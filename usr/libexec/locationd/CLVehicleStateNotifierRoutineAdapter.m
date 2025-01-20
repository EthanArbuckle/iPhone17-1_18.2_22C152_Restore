@interface CLVehicleStateNotifierRoutineAdapter
- (BOOL)valid;
- (CLVehicleStateNotifierRoutineAdapter)initWithVehicleStateNotifier:(void *)a3;
- (void)onLowConfidenceVisit:(id)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVehicleStateNotifierRoutineAdapter

- (CLVehicleStateNotifierRoutineAdapter)initWithVehicleStateNotifier:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLVehicleStateNotifierRoutineAdapter;
  result = [(CLVehicleStateNotifierRoutineAdapter *)&v5 init];
  if (result)
  {
    result->_vehicleStateNotifier = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)onVisit:(id)a3
{
}

- (void)onLowConfidenceVisit:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end