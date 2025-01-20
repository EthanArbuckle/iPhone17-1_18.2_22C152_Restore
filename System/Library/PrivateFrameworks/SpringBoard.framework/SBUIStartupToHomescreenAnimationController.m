@interface SBUIStartupToHomescreenAnimationController
- (BOOL)_shouldDismissBanner;
- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4;
- (double)_animationDelay;
- (id)animationSettings;
- (void)_cleanupAnimation;
- (void)_startAnimation;
@end

@implementation SBUIStartupToHomescreenAnimationController

- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3
{
  return [(SBUIStartupToHomescreenAnimationController *)self initWithTransitionContextProvider:a3 overlay:0];
}

- (SBUIStartupToHomescreenAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBUIStartupToHomescreenAnimationController.m", 32, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBUIStartupToHomescreenAnimationController;
  v9 = [(SBUIMainScreenAnimationController *)&v15 initWithTransitionContextProvider:v7];
  if (v9)
  {
    v10 = [v7 toApplicationSceneEntities];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:v9 file:@"SBUIStartupToHomescreenAnimationController.m" lineNumber:34 description:@"cannot have an app we're activating"];
    }
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, a4);
  }

  return v9;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (id)animationSettings
{
  v2 = (void *)MEMORY[0x1E4F4F680];
  [(SBUIStartupToHomescreenAnimationController *)self _animationDelay];
  double v4 = v3 + 0.5;
  return (id)[v2 settingsWithDuration:v4];
}

- (void)_startAnimation
{
  double v3 = +[SBUIController sharedInstance];
  [v3 beginRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];

  persistentSnapshotOverlay = self->_persistentSnapshotOverlay;
  if (persistentSnapshotOverlay)
  {
    v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:1.0];
    [(BKSDisplayRenderOverlay *)persistentSnapshotOverlay dismissWithAnimation:v5];
  }
  v6 = +[SBIconController sharedInstance];
  id v7 = [v6 iconManager];
  [(SBUIStartupToHomescreenAnimationController *)self _animationDelay];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBUIStartupToHomescreenAnimationController__startAnimation__block_invoke;
  v8[3] = &unk_1E6AF5350;
  v8[4] = self;
  objc_msgSend(v7, "unscatterAnimated:afterDelay:withCompletion:", 1, v8);
}

uint64_t __61__SBUIStartupToHomescreenAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

- (void)_cleanupAnimation
{
  double v3 = +[SBUIController sharedInstance];
  [v3 beginRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];

  v4.receiver = self;
  v4.super_class = (Class)SBUIStartupToHomescreenAnimationController;
  [(SBUIMainScreenAnimationController *)&v4 _cleanupAnimation];
}

- (double)_animationDelay
{
  double result = 0.75;
  if (!self->_persistentSnapshotOverlay) {
    return 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end