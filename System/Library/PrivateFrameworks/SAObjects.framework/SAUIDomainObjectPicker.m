@interface SAUIDomainObjectPicker
+ (id)domainObjectPicker;
- (NSString)idNodeName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdNodeName:(id)a3;
@end

@implementation SAUIDomainObjectPicker

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DomainObjectPicker";
}

+ (id)domainObjectPicker
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)idNodeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"idNodeName"];
}

- (void)setIdNodeName:(id)a3
{
}

@end