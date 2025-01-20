@interface UVAgentSceneSpecification
- (BOOL)allowsConfigurationByAppDelegate;
- (BOOL)previewAgentDisplaysUI;
- (id)baseSceneComponentClassDictionary;
- (id)uiSceneSessionRole;
@end

@implementation UVAgentSceneSpecification

- (BOOL)previewAgentDisplaysUI
{
  return 1;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 0;
}

- (id)uiSceneSessionRole
{
  return @"_XcodePreviewsSceneSessionRole";
}

- (id)baseSceneComponentClassDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)UVAgentSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v5 baseSceneComponentClassDictionary];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:objc_opt_class() forKey:@"UVAgentSceneEntryPoint"];
  return v3;
}

@end