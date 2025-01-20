@interface UVAgentMainSceneSpecification
- (BOOL)allowsConfigurationByAppDelegate;
- (BOOL)previewAgentDisplaysUI;
- (id)uiSceneSessionRole;
@end

@implementation UVAgentMainSceneSpecification

- (BOOL)previewAgentDisplaysUI
{
  return 0;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 1;
}

- (id)uiSceneSessionRole
{
  return (id)*MEMORY[0x263F83C68];
}

@end