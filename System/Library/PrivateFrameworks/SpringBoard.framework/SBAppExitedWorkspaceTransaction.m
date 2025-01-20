@interface SBAppExitedWorkspaceTransaction
- (void)_begin;
- (void)_didComplete;
@end

@implementation SBAppExitedWorkspaceTransaction

- (void)_begin
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppExitedWorkspaceTransaction;
  [(SBAppExitedWorkspaceTransaction *)&v3 _begin];
  [(SBToAppsWorkspaceTransaction *)self activateApplications];
}

- (void)_didComplete
{
  objc_super v3 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v3 updateWhitePointAdaptationStrength];

  [(id)SBApp updateNativeOrientationAnimated:1, @"App exited, interface orientation may need to be updated." logMessage];
  v4.receiver = self;
  v4.super_class = (Class)SBAppExitedWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 _didComplete];
}

@end