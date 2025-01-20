@interface RTMotionActivityManagerNotificationVehicleConnected
- (NSString)deviceId;
- (RTMotionActivityManagerNotificationVehicleConnected)initWithVehicleConnectedState:(unint64_t)a3 deviceId:(id)a4;
- (unint64_t)vehicleConnectedState;
@end

@implementation RTMotionActivityManagerNotificationVehicleConnected

- (RTMotionActivityManagerNotificationVehicleConnected)initWithVehicleConnectedState:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMotionActivityManagerNotificationVehicleConnected;
  v7 = [(RTNotification *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_vehicleConnectedState = a3;
    uint64_t v9 = [v6 copy];
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)vehicleConnectedState
{
  return self->_vehicleConnectedState;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
}

@end