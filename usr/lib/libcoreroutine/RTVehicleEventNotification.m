@interface RTVehicleEventNotification
- (NSArray)vehicleEvents;
- (RTVehicleEventNotification)initWithVehicleEvents:(id)a3;
@end

@implementation RTVehicleEventNotification

- (RTVehicleEventNotification)initWithVehicleEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTVehicleEventNotification;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    vehicleEvents = v5->_vehicleEvents;
    v5->_vehicleEvents = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)vehicleEvents
{
  return self->_vehicleEvents;
}

- (void).cxx_destruct
{
}

@end