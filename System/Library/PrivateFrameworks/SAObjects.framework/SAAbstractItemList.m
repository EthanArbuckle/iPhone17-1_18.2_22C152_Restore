@interface SAAbstractItemList
+ (id)abstractItemList;
- (NSArray)domainObjects;
- (NSNumber)selectedIndex;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomainObjects:(id)a3;
- (void)setSelectedIndex:(id)a3;
@end

@implementation SAAbstractItemList

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AbstractItemList";
}

+ (id)abstractItemList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)domainObjects
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"domainObjects", v3);
}

- (void)setDomainObjects:(id)a3
{
}

- (NSNumber)selectedIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"selectedIndex"];
}

- (void)setSelectedIndex:(id)a3
{
}

@end