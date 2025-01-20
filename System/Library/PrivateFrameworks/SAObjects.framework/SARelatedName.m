@interface SARelatedName
+ (id)relatedName;
- (NSString)label;
- (NSString)name;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SARelatedName

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RelatedName";
}

+ (id)relatedName
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

@end