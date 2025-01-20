@interface SAReminderLocationTrigger
+ (id)locationTrigger;
- (NSString)internalGUID;
- (NSString)mobileSpace;
- (NSString)timing;
- (NSURL)contactIdentifier;
- (SALocation)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContactIdentifier:(id)a3;
- (void)setInternalGUID:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMobileSpace:(id)a3;
- (void)setTiming:(id)a3;
@end

@implementation SAReminderLocationTrigger

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"LocationTrigger";
}

+ (id)locationTrigger
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)contactIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"contactIdentifier");
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)internalGUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"internalGUID"];
}

- (void)setInternalGUID:(id)a3
{
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSString)mobileSpace
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mobileSpace"];
}

- (void)setMobileSpace:(id)a3
{
}

- (NSString)timing
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timing"];
}

- (void)setTiming:(id)a3
{
}

@end