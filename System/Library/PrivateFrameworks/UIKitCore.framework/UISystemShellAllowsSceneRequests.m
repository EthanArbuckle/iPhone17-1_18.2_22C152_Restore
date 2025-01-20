@interface UISystemShellAllowsSceneRequests
@end

@implementation UISystemShellAllowsSceneRequests

void ___UISystemShellAllowsSceneRequests_block_invoke()
{
  v0 = +[_UIApplicationConfigurationLoader sharedLoader];
  id v1 = [v0 applicationInitializationContext];

  byte_1EB25B503 = [v1 supportAppSceneRequests];
}

@end