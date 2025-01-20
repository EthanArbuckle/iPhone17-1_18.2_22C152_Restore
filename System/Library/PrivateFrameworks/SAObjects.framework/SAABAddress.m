@interface SAABAddress
+ (id)address;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAABAddress

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"Address";
}

+ (id)address
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end