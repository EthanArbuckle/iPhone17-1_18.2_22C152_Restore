@interface SAABPersonSnippet
+ (id)personSnippet;
- (NSArray)displayProperties;
- (NSArray)persons;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDisplayProperties:(id)a3;
- (void)setPersons:(id)a3;
@end

@implementation SAABPersonSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"PersonSnippet";
}

+ (id)personSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)displayProperties
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"displayProperties"];
}

- (void)setDisplayProperties:(id)a3
{
}

- (NSArray)persons
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"persons", v3);
}

- (void)setPersons:(id)a3
{
}

@end