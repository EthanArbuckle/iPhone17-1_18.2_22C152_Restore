@interface SADomainObject
+ (id)domainObject;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
@end

@implementation SADomainObject

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObject";
}

+ (id)domainObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

@end