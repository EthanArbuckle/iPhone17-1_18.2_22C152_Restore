@interface SBDashBoardWidgetURLHandler
- (void)openURL:(id)a3;
@end

@implementation SBDashBoardWidgetURLHandler

- (void)openURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v4 setSource:24];
  [(SBLockScreenUnlockRequest *)v4 setIntent:3];
  [(SBLockScreenUnlockRequest *)v4 setName:@"Open URL From CoverSheet Widget"];
  [(SBLockScreenUnlockRequest *)v4 setWantsBiometricPresentation:1];
  v5 = +[SBLockScreenManager sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SBDashBoardWidgetURLHandler_openURL___block_invoke;
  v7[3] = &unk_1E6AF5350;
  id v8 = v3;
  id v6 = v3;
  [v5 unlockWithRequest:v4 completion:v7];
}

uint64_t __39__SBDashBoardWidgetURLHandler_openURL___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return SBWorkspaceActivateApplicationFromURL(*(void **)(result + 32), 0, &__block_literal_global_99);
  }
  return result;
}

uint64_t __39__SBDashBoardWidgetURLHandler_openURL___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSource:7];
}

@end