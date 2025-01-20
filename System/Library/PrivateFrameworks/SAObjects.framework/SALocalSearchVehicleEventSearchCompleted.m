@interface SALocalSearchVehicleEventSearchCompleted
+ (id)vehicleEventSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)events;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEvents:(id)a3;
@end

@implementation SALocalSearchVehicleEventSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"VehicleEventSearchCompleted";
}

+ (id)vehicleEventSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)events
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"events", v3);
}

- (void)setEvents:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end