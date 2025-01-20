@interface MNTraceEVDataRow
- (VGVehicle)vehicle;
- (double)timestamp;
- (void)setTimestamp:(double)a3;
- (void)setVehicle:(id)a3;
@end

@implementation MNTraceEVDataRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end