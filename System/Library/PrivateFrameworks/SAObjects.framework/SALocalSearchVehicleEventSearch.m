@interface SALocalSearchVehicleEventSearch
+ (id)vehicleEventSearch;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchVehicleEventSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"VehicleEventSearch";
}

+ (id)vehicleEventSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end