@interface SASyncSetDeepSyncVerificationNeeded
+ (id)setDeepSyncVerificationNeeded;
- (BOOL)requiresResponse;
- (NSArray)keys;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKeys:(id)a3;
@end

@implementation SASyncSetDeepSyncVerificationNeeded

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"SetDeepSyncVerificationNeeded";
}

+ (id)setDeepSyncVerificationNeeded
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)keys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"keys"];
}

- (void)setKeys:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end