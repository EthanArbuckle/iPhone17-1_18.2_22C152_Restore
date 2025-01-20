@interface SBLockToAppStatusBarAnimator
- (void)animateStatusBarFromLockToHome;
@end

@implementation SBLockToAppStatusBarAnimator

- (void)animateStatusBarFromLockToHome
{
  v3 = +[SBLockScreenManager sharedInstance];
  v4 = [v3 coverSheetViewController];
  v5 = [v4 _sbWindowScene];

  v6 = [v5 statusBarManager];
  v7 = [v6 assertionManager];
  if (SBReduceMotion())
  {
    v8 = +[SBUIController sharedInstance];
    [v8 updateStatusBarLegibilityForWindowScene:v5];

    [v3 updateSpringBoardStatusBarForLockScreenTeardown];
    if ([v6 isStatusBarEffectivelyHidden])
    {
      v16 = (void *)MEMORY[0x1E4F4F898];
      v9 = [MEMORY[0x1E4FA6270] rootSettings];
      v10 = [v9 iconAnimationSettings];
      v11 = [v10 reducedMotionSettings];
      v12 = [v11 centralAnimationSettings];
      v13 = [v12 BSAnimationSettings];
      v17 = [v16 factoryWithSettings:v13];

      v14 = (void *)MEMORY[0x1E4F4F898];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke;
      v31[3] = &unk_1E6AF5290;
      v31[4] = self;
      id v32 = v7;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2;
      v30[3] = &unk_1E6AF5350;
      v30[4] = self;
      [v14 animateWithFactory:v17 actions:v31 completion:v30];
    }
  }
  else
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__86;
    v28[4] = __Block_byref_object_dispose__86;
    id v29 = 0;
    v15 = (void *)MEMORY[0x1E4F42FF0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_16;
    v24[3] = &unk_1E6AF6380;
    v27 = v28;
    id v25 = v7;
    v26 = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2_21;
    v18[3] = &unk_1E6B08878;
    id v19 = v5;
    id v20 = v3;
    v21 = self;
    v22 = v28;
    uint64_t v23 = 0x3FD0000000000000;
    [v15 animateWithDuration:v24 animations:v18 completion:0.25];

    _Block_object_dispose(v28, 8);
  }
}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) acquireDisableAlphaChangesAssertionWithReason:@"SBLockToAppStatusBarAnimator"];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_16(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[SBLockToAppStatusBarAnimator animateStatusBarFromLockToHome]_block_invoke");
  uint64_t v4 = [v2 newSettingsAssertionWithStatusBarHidden:1 atLevel:8 reason:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) acquire];
  uint64_t v7 = [*(id *)(a1 + 32) acquireDisableAlphaChangesAssertionWithReason:@"SBLockToAppStatusBarAnimator"];
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v7;
}

uint64_t __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_2_21(uint64_t a1)
{
  uint64_t v2 = +[SBUIController sharedInstance];
  [v2 updateStatusBarLegibilityForWindowScene:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) updateSpringBoardStatusBarForLockScreenTeardown];
  [*(id *)(*(void *)(a1 + 48) + 8) invalidate];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  double v5 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_3;
  v7[3] = &unk_1E6AF56B0;
  v7[4] = *(void *)(a1 + 56);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:v5];
}

void __62__SBLockToAppStatusBarAnimator_animateStatusBarFromLockToHome__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void).cxx_destruct
{
}

@end