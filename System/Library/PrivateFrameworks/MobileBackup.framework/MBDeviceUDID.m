@interface MBDeviceUDID
@end

@implementation MBDeviceUDID

id __MBDeviceUDID_Legacy_client_block_invoke()
{
  v0 = MBGetGestaltValueForKey();
  if (!v0) {
    objc_exception_throw([[MBException alloc] initWithCode:1, @"Error getting %@ from MobileGestalt", @"UniqueDeviceID" format]);
  }
  v1 = v0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __MBDeviceUDID_Legacy_client_block_invoke_cold_1();
  }
  id result = v1;
  MBDeviceUDID_Legacy_client_sDeviceUDID = (uint64_t)result;
  return result;
}

void __MBDeviceUDID_Legacy_client_block_invoke_cold_1()
{
}

@end