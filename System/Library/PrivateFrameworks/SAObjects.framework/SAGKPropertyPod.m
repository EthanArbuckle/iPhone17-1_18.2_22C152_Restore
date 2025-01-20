@interface SAGKPropertyPod
+ (id)propertyPod;
- (NSArray)propertyList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPropertyList:(id)a3;
@end

@implementation SAGKPropertyPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"PropertyPod";
}

+ (id)propertyPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)propertyList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"propertyList", v3);
}

- (void)setPropertyList:(id)a3
{
}

@end