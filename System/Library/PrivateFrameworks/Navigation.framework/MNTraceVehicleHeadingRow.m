@interface MNTraceVehicleHeadingRow
- (double)timestamp;
- (double)vehicleHeading;
- (void)setTimestamp:(double)a3;
- (void)setVehicleHeading:(double)a3;
@end

@implementation MNTraceVehicleHeadingRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)vehicleHeading
{
  return self->_vehicleHeading;
}

- (void)setVehicleHeading:(double)a3
{
  self->_vehicleHeading = a3;
}

@end