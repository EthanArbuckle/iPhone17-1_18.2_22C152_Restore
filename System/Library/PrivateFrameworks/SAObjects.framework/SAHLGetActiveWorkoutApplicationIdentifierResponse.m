@interface SAHLGetActiveWorkoutApplicationIdentifierResponse
+ (id)getActiveWorkoutApplicationIdentifierResponse;
- (BOOL)requiresResponse;
- (NSString)appBundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
@end

@implementation SAHLGetActiveWorkoutApplicationIdentifierResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"GetActiveWorkoutApplicationIdentifierResponse";
}

+ (id)getActiveWorkoutApplicationIdentifierResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end