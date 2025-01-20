@interface RTBluetoothManagerNotificationCarKitConnectionStateChanged
- (RTBluetoothManagerNotificationCarKitConnectionStateChanged)initWithCarKitConnectionState:(int64_t)a3;
- (int64_t)carKitConnectionState;
@end

@implementation RTBluetoothManagerNotificationCarKitConnectionStateChanged

- (RTBluetoothManagerNotificationCarKitConnectionStateChanged)initWithCarKitConnectionState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTBluetoothManagerNotificationCarKitConnectionStateChanged;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_carKitConnectionState = a3;
  }
  return result;
}

- (int64_t)carKitConnectionState
{
  return self->_carKitConnectionState;
}

@end