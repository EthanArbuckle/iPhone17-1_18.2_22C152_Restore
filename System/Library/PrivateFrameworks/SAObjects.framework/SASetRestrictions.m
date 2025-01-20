@interface SASetRestrictions
+ (id)setRestrictions;
- (BOOL)requiresResponse;
- (NSArray)restrictions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRestrictions:(id)a3;
@end

@implementation SASetRestrictions

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetRestrictions";
}

+ (id)setRestrictions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)restrictions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"restrictions"];
}

- (void)setRestrictions:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end