@interface SAABPerson
+ (id)person;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAABPerson

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"Person";
}

+ (id)person
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end