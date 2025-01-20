@interface SALocalSearchVehicleEventCreate
+ (id)vehicleEventCreate;
- (BOOL)requiresResponse;
- (NSString)notes;
- (SALocation)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
@end

@implementation SALocalSearchVehicleEventCreate

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"VehicleEventCreate";
}

+ (id)vehicleEventCreate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSString)notes
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notes"];
}

- (void)setNotes:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end