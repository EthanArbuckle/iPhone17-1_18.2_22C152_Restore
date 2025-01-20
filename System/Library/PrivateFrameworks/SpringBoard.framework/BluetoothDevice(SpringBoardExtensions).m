@interface BluetoothDevice(SpringBoardExtensions)
- (id)sb_siriBluetoothDeviceSource;
- (void)sb_setSiriBluetoothDeviceSource:()SpringBoardExtensions;
@end

@implementation BluetoothDevice(SpringBoardExtensions)

- (id)sb_siriBluetoothDeviceSource
{
  return objc_getAssociatedObject(a1, sel_sb_siriBluetoothDeviceSource);
}

- (void)sb_setSiriBluetoothDeviceSource:()SpringBoardExtensions
{
}

@end