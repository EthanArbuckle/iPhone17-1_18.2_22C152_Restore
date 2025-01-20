@interface _CARVehicleState
- (NSString)deviceID;
- (NSString)vehicleStateDebugDescription;
- (unint64_t)vehicleOperatorState;
- (unint64_t)vehicleState;
- (unint64_t)vehicularHints;
- (void)setDeviceID:(id)a3;
- (void)setVehicleOperatorState:(unint64_t)a3;
- (void)setVehicleState:(unint64_t)a3;
- (void)setVehicularHints:(unint64_t)a3;
@end

@implementation _CARVehicleState

- (NSString)vehicleStateDebugDescription
{
  v3 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicleState]];
  v4 = [(_CARVehicleState *)self deviceID];
  [(_CARVehicleState *)self vehicularHints];
  v5 = +[NSNumber numberWithUnsignedInteger:0];
  v6 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicularHints] & 1];
  v7 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicularHints] & 2];
  v8 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicularHints] & 4];
  v9 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicularHints] & 8];
  v10 = +[NSNumber numberWithUnsignedInteger:[(_CARVehicleState *)self vehicularHints] & 0x10];
  v11 = +[NSString stringWithFormat:@"Vehicle State %@, device ID %@, Vehicular Hints: None: %@ Motion: %@ GPS: %@ Baseband: %@ WiFi: %@ Bluetooth: %@", v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (unint64_t)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unint64_t)a3
{
  self->_vehicleState = a3;
}

- (unint64_t)vehicularHints
{
  return self->_vehicularHints;
}

- (void)setVehicularHints:(unint64_t)a3
{
  self->_vehicularHints = a3;
}

- (unint64_t)vehicleOperatorState
{
  return self->_vehicleOperatorState;
}

- (void)setVehicleOperatorState:(unint64_t)a3
{
  self->_vehicleOperatorState = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end