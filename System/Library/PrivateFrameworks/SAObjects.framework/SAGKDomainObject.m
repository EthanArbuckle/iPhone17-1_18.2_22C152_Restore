@interface SAGKDomainObject
+ (id)domainObject;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAGKDomainObject

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
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

@end