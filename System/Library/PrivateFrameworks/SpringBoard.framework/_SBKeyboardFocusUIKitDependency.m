@interface _SBKeyboardFocusUIKitDependency
- (BOOL)shouldInitAsync;
- (SBInputUISceneController)inputUISceneController;
- (UIKeyboardArbiterManager)keyboardArbiterManager;
- (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4;
- (void)setSystemShellBehaviorDelegate:(id)a3;
@end

@implementation _SBKeyboardFocusUIKitDependency

- (BOOL)shouldInitAsync
{
  return 1;
}

- (SBInputUISceneController)inputUISceneController
{
  v2 = [(id)SBApp systemUIScenesCoordinator];
  v3 = [v2 inputUISceneController];

  return (SBInputUISceneController *)v3;
}

- (void)setSystemShellBehaviorDelegate:(id)a3
{
}

- (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4
{
  return (id)[MEMORY[0x1E4F71DD8] launchAdvisorWithOmniscientDelegate:a3 sceneDelegate:a4];
}

- (UIKeyboardArbiterManager)keyboardArbiterManager
{
  return (UIKeyboardArbiterManager *)[MEMORY[0x1E4F42B10] sharedArbiterManager];
}

@end