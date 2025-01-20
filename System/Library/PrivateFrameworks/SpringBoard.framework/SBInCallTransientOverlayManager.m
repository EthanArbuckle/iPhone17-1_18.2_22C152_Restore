@interface SBInCallTransientOverlayManager
- (id)_newAlertDefinition;
- (id)_remoteTransientOverlaySessionManager;
- (void)presentTransientOverlay;
- (void)presentTransientOverlayForActivityContinuationWithActivityIdentifier:(id)a3;
- (void)presentTransientOverlayForUILock;
@end

@implementation SBInCallTransientOverlayManager

- (void)presentTransientOverlay
{
  id v7 = [(SBInCallTransientOverlayManager *)self _newAlertDefinition];
  v3 = [(SBInCallTransientOverlayManager *)self _remoteTransientOverlaySessionManager];
  v4 = [v3 sessionWithDefinition:v7 options:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  [v4 prepareWithConfigurationContext:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v4 activateWithContext:v6];
}

- (void)presentTransientOverlayForActivityContinuationWithActivityIdentifier:(id)a3
{
  id v4 = a3;
  id v9 = [(SBInCallTransientOverlayManager *)self _newAlertDefinition];
  id v5 = [(SBInCallTransientOverlayManager *)self _remoteTransientOverlaySessionManager];
  id v6 = [v5 sessionWithDefinition:v9 options:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  [v6 prepareWithConfigurationContext:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v8 setActivityContinuationIdentifier:v4];

  [v6 activateWithContext:v8];
}

- (void)presentTransientOverlayForUILock
{
  id v3 = [(SBInCallTransientOverlayManager *)self _newAlertDefinition];
  id v4 = [(SBInCallTransientOverlayManager *)self _remoteTransientOverlaySessionManager];
  id v5 = [v4 sessionWithDefinition:v3 options:0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  [v5 prepareWithConfigurationContext:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SBInCallTransientOverlayManager_presentTransientOverlayForUILock__block_invoke;
  v8[3] = &unk_1E6AFB348;
  id v9 = v5;
  id v7 = v5;
  [v7 getActionForHandlingButtonEvents:1 completion:v8];
}

void __67__SBInCallTransientOverlayManager_presentTransientOverlayForUILock__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v3 setReason:*MEMORY[0x1E4FA7EE8]];
  if (v5)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    [v3 setActions:v4];
  }
  [*(id *)(a1 + 32) activateWithContext:v3];
}

- (id)_newAlertDefinition
{
  id v2 = objc_alloc(MEMORY[0x1E4FA6BB0]);
  id v3 = TUInCallRemoteAlertViewControllerClassName();
  id v4 = (void *)[v2 initWithServiceName:@"com.apple.InCallService" viewControllerClassName:v3];

  return v4;
}

- (id)_remoteTransientOverlaySessionManager
{
  return (id)[(id)SBApp remoteTransientOverlaySessionManager];
}

@end