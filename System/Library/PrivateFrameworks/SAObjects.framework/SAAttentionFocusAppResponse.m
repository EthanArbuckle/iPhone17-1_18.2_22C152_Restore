@interface SAAttentionFocusAppResponse
- (BOOL)requiresResponse;
- (NSString)appBundleId;
- (NSString)sceneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setSceneId:(id)a3;
@end

@implementation SAAttentionFocusAppResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.attention";
}

- (id)encodedClassName
{
  return @"FocusAppResponse";
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)sceneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sceneId"];
}

- (void)setSceneId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end