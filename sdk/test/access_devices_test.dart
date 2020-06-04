import 'package:flutter_test/flutter_test.dart';
import 'package:sdk/functionality/access_devices.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("test 1: successful http request", () async {
    AccessDevices accessDevices = new AccessDevices("accessToken", "enterpriseId", testing: 1);
    expect(await accessDevices.getAllDevices(), "list of devices");
    expect(await accessDevices.getAllStructures(), "list of structures");
    expect(await accessDevices.getDeviceStatus("deviceId"), "ONLINE");
  });
  test("test 2: http API throws exception", () async {
    AccessDevices accessDevices = new AccessDevices("accessToken", "enterpriseId", testing: 2);
    expect(await accessDevices.getAllDevices(), null);
    expect(await accessDevices.getAllStructures(), null);
    expect(await accessDevices.getDeviceStatus("deviceId"), null);
  });
  test("test 3: http API takes 200 ms to respond", () async {
    AccessDevices accessDevices = new AccessDevices("accessToken", "enterpriseId", testing: 3, accessDevicesTimeoutDuration: new Duration(milliseconds: 100));
    expect(await accessDevices.getAllDevices(), null);
    expect(await accessDevices.getAllStructures(), null);
    expect(await accessDevices.getDeviceStatus("deviceId"), null);
  });

}