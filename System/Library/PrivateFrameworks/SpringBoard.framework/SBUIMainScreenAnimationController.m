@interface SBUIMainScreenAnimationController
- (BOOL)__wantsInitialProgressStateChange;
- (BOOL)_shouldDismissBanner;
- (BSInvalidatable)bannerSuppressionAssertion;
- (BSInvalidatable)wallpaperRequiredAssertion;
- (SBDeviceApplicationSceneEntity)fromApplicationSceneEntity;
- (SBDeviceApplicationSceneEntity)toApplicationSceneEntity;
- (SBUIMainScreenAnimationController)initWithTransitionContextProvider:(id)a3;
- (id)_getTransitionWindow;
- (id)_primaryAppOrAnyAppFromSet:(id)a3;
- (void)__startAnimation;
- (void)_begin;
- (void)_cleanupAnimation;
- (void)_dismissBannerAnimated:(BOOL)a3;
- (void)setBannerSuppressionAssertion:(id)a3;
- (void)setWallpaperRequiredAssertion:(id)a3;
@end

@implementation SBUIMainScreenAnimationController

- (SBUIMainScreenAnimationController)initWithTransitionContextProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIMainScreenAnimationController;
  return [(SBUIWorkspaceAnimationController *)&v4 initWithWorkspaceTransitionRequest:a3];
}

- (SBDeviceApplicationSceneEntity)toApplicationSceneEntity
{
  v3 = [(SBUIAnimationController *)self toApplicationSceneEntities];
  objc_super v4 = [(SBUIMainScreenAnimationController *)self _primaryAppOrAnyAppFromSet:v3];

  return (SBDeviceApplicationSceneEntity *)v4;
}

- (SBDeviceApplicationSceneEntity)fromApplicationSceneEntity
{
  v3 = [(SBUIAnimationController *)self fromApplicationSceneEntities];
  objc_super v4 = [(SBUIMainScreenAnimationController *)self _primaryAppOrAnyAppFromSet:v3];

  return (SBDeviceApplicationSceneEntity *)v4;
}

- (id)_getTransitionWindow
{
  v2 = +[SBUIController sharedInstance];
  v3 = [v2 window];

  return v3;
}

- (id)_primaryAppOrAnyAppFromSet:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 objectsPassingTest:&__block_literal_global_369];
  v5 = [v4 anyObject];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v3 anyObject];
  }
  v7 = v6;

  return v7;
}

BOOL __64__SBUIMainScreenAnimationController__primaryAppOrAnyAppFromSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutRole] == 1;
}

- (BOOL)__wantsInitialProgressStateChange
{
  return 1;
}

- (void)__startAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIMainScreenAnimationController;
  [(SBUIAnimationController *)&v3 __startAnimation];
  if ([(SBUIMainScreenAnimationController *)self _shouldDismissBanner]) {
    [(SBUIMainScreenAnimationController *)self _dismissBannerAnimated:1];
  }
  [MEMORY[0x1E4F42FF0] _beginSuspendingMotionEffectsForReason:@"Main screen transaction animation"];
  [MEMORY[0x1E4F42FF0] animateWithDuration:&__block_literal_global_19_3 animations:0.25];
}

uint64_t __53__SBUIMainScreenAnimationController___startAnimation__block_invoke()
{
  return [MEMORY[0x1E4F42FF0] _recenterMotionEffects];
}

- (BOOL)_shouldDismissBanner
{
  return 1;
}

- (void)_dismissBannerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(id)SBApp bannerManager];
  objc_super v4 = [(id)SBApp windowSceneManager];
  v5 = [v4 embeddedDisplayWindowScene];
  [v6 dismissAllBannersInWindowScene:v5 animated:v3 reason:@"mainScreenAnimationController"];
}

- (void)_begin
{
  BOOL v3 = [(SBUIAnimationController *)self _animationIdentifier];
  objc_super v4 = [(id)SBApp bannerManager];
  v5 = [v4 acquireBannerSuppressionAssertionForReason:v3];
  [(SBUIMainScreenAnimationController *)self setBannerSuppressionAssertion:v5];

  if ([(SBUIAnimationController *)self _willAnimate])
  {
    id v6 = +[SBWallpaperController sharedInstance];
    v7 = [v6 requireWallpaperWithReason:v3];
    [(SBUIMainScreenAnimationController *)self setWallpaperRequiredAssertion:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)SBUIMainScreenAnimationController;
  [(SBUIAnimationController *)&v8 _begin];
}

- (void)_cleanupAnimation
{
  [MEMORY[0x1E4F42FF0] _endSuspendingMotionEffectsForReason:@"Main screen transaction animation"];
  BOOL v3 = [(SBUIMainScreenAnimationController *)self bannerSuppressionAssertion];
  [v3 invalidate];

  [(SBUIMainScreenAnimationController *)self setBannerSuppressionAssertion:0];
  objc_super v4 = [(SBUIMainScreenAnimationController *)self wallpaperRequiredAssertion];
  [v4 invalidate];

  [(SBUIMainScreenAnimationController *)self setWallpaperRequiredAssertion:0];
  id v6 = +[SBIconController sharedInstance];
  v5 = [v6 iconManager];
  [v5 clearHighlightedIcon];
}

- (BSInvalidatable)wallpaperRequiredAssertion
{
  return self->_wallpaperRequiredAssertion;
}

- (void)setWallpaperRequiredAssertion:(id)a3
{
}

- (BSInvalidatable)bannerSuppressionAssertion
{
  return self->_bannerSuppressionAssertion;
}

- (void)setBannerSuppressionAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredAssertion, 0);
}

@end