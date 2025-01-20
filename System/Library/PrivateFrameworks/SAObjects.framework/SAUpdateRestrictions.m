@interface SAUpdateRestrictions
+ (id)updateRestrictions;
- (BOOL)requiresResponse;
- (NSArray)restrictionsToAdd;
- (NSArray)restrictionsToRemove;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRestrictionsToAdd:(id)a3;
- (void)setRestrictionsToRemove:(id)a3;
@end

@implementation SAUpdateRestrictions

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UpdateRestrictions";
}

+ (id)updateRestrictions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)restrictionsToAdd
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"restrictionsToAdd"];
}

- (void)setRestrictionsToAdd:(id)a3
{
}

- (NSArray)restrictionsToRemove
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"restrictionsToRemove"];
}

- (void)setRestrictionsToRemove:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end