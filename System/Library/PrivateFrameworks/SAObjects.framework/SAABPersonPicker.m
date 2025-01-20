@interface SAABPersonPicker
+ (id)personPicker;
- (BOOL)showImmediately;
- (NSArray)persons;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPersons:(id)a3;
- (void)setShowImmediately:(BOOL)a3;
@end

@implementation SAABPersonPicker

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"PersonPicker";
}

+ (id)personPicker
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)persons
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"persons", v3);
}

- (void)setPersons:(id)a3
{
}

- (BOOL)showImmediately
{
  return AceObjectBoolForProperty(self, @"showImmediately");
}

- (void)setShowImmediately:(BOOL)a3
{
}

@end