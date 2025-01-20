@interface SBReturnToLockscreenWorkspaceTransaction
- (SBReturnToLockscreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 toLockScreenEnvironment:(id)a4;
- (id)_setupAnimation;
- (id)debugDescription;
- (unint64_t)_serialOverlayPreDismissalOptions;
- (void)_animationDidFinish;
- (void)_animationWillBegin:(BOOL)a3;
- (void)_didComplete;
@end

@implementation SBReturnToLockscreenWorkspaceTransaction

- (SBReturnToLockscreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 toLockScreenEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  v8 = [(SBActivateAppUnderLockScreenWorkspaceTransaction *)&v15 initWithTransitionRequest:v6 lockScreenEnvironment:v7];
  if (v8)
  {
    v9 = [v6 applicationContext];
    uint64_t v10 = [v9 previousApplicationSceneEntityForLayoutRole:1];
    fromAppSceneEntity = v8->_fromAppSceneEntity;
    v8->_fromAppSceneEntity = (SBApplicationSceneEntity *)v10;

    v12 = +[SBLockScreenManager sharedInstance];
    if (([v12 isUILocked] & 1) == 0)
    {
      id v13 = [v12 lockScreenEnvironment];

      if (v13 == v7) {
        [v9 setAnimationDisabled:0];
      }
    }
  }
  return v8;
}

- (id)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  v3 = [(SBReturnToLockscreenWorkspaceTransaction *)&v9 debugDescription];
  v4 = v3;
  fromAppSceneEntity = self->_fromAppSceneEntity;
  if (!fromAppSceneEntity) {
    fromAppSceneEntity = (SBApplicationSceneEntity *)@"SpringBoard";
  }
  id v6 = [v3 stringByAppendingFormat:@"\n\tfromApp = %@", fromAppSceneEntity];

  id v7 = [v6 stringByAppendingFormat:@"\n\ttoLockScreen = %@", self->super._lockScreenEnvironment];

  return v7;
}

- (void)_didComplete
{
  v3 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v3 updateWhitePointAdaptationStrength];

  v4.receiver = self;
  v4.super_class = (Class)SBReturnToLockscreenWorkspaceTransaction;
  [(SBActivateAppUnderLockScreenWorkspaceTransaction *)&v4 _didComplete];
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -2;
}

- (id)_setupAnimation
{
  v3 = [[SBUIMainScreenAnimationController alloc] initWithTransitionContextProvider:self->super.super.super.super._transitionRequest];
  objc_super v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  v5 = [(SBUIAnimationController *)v3 transitionCoordinator];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBReturnToLockscreenWorkspaceTransaction__setupAnimation__block_invoke;
  v8[3] = &unk_1E6B08F40;
  id v9 = v4;
  id v6 = v4;
  [v5 animateAlongsideTransition:v8 completion:0];

  return v3;
}

void __59__SBReturnToLockscreenWorkspaceTransaction__setupAnimation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v4 updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:*(void *)(a1 + 32) animationTransitionContext:v3];
}

- (void)_animationWillBegin:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      self->_animatedAppDeactivation = 1;
      id v6 = (void *)SBApp;
      [v6 _accessibilityDeactivationAnimationWillBegin];
    }
  }
}

- (void)_animationDidFinish
{
  if (self->_animatedAppDeactivation) {
    self->_animatedAppDeactivation = 0;
  }
}

- (void).cxx_destruct
{
}

@end