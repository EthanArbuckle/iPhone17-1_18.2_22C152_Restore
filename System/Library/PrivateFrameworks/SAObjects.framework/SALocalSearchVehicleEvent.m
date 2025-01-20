@interface SALocalSearchVehicleEvent
+ (id)vehicleEvent;
- (NSDate)date;
- (NSNumber)userSetLocation;
- (NSString)notes;
- (NSString)vehicleIdentifier;
- (SALocation)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setUserSetLocation:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation SALocalSearchVehicleEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"VehicleEvent";
}

+ (id)vehicleEvent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)date
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"date"];
}

- (void)setDate:(id)a3
{
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

- (NSNumber)userSetLocation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"userSetLocation"];
}

- (void)setUserSetLocation:(id)a3
{
}

- (NSString)vehicleIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"vehicleIdentifier"];
}

- (void)setVehicleIdentifier:(id)a3
{
}

@end