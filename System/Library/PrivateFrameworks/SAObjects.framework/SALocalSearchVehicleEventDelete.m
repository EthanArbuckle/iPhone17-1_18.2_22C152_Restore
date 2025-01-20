@interface SALocalSearchVehicleEventDelete
+ (id)vehicleEventDelete;
- (BOOL)requiresResponse;
- (NSArray)eventIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEventIds:(id)a3;
@end

@implementation SALocalSearchVehicleEventDelete

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"VehicleEventDelete";
}

+ (id)vehicleEventDelete
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)eventIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"eventIds"];
}

- (void)setEventIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end