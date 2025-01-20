@interface SAAppsQuitApp
+ (id)quitApp;
- (BOOL)requiresResponse;
- (NSString)appBundleId;
- (NSString)sceneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setSceneId:(id)a3;
@end

@implementation SAAppsQuitApp

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"QuitApp";
}

+ (id)quitApp
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