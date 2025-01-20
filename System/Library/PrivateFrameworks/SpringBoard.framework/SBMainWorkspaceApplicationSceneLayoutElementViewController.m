@interface SBMainWorkspaceApplicationSceneLayoutElementViewController
- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling;
- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling;
- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding;
- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding;
- (BOOL)_shouldDisplayLayoutElementBecomeActive;
- (BOOL)clipsToBounds;
- (BOOL)isBlurred;
- (BOOL)isNubViewHidden;
- (BOOL)isNubViewHighlighted;
- (BOOL)sceneRendersAsynchronously;
- (BOOL)sceneResizesHostedContext;
- (BSCornerRadiusConfiguration)cornerRadiusConfiguration;
- (NSString)description;
- (NSString)sceneMinificationFilter;
- (SBApplicationSceneBackgroundView)backgroundView;
- (SBHomeGrabberView)homeGrabberView;
- (SBMainWorkspaceApplicationSceneLayoutElementViewController)initWithDisplayIdentity:(id)a3;
- (UIDropInteraction)dropInteraction;
- (UIView)sceneContentView;
- (double)blurViewIconScale;
- (double)currentStatusBarHeight;
- (double)darkenViewAlpha;
- (double)shadowOffset;
- (double)shadowOpacity;
- (id)_applicationSceneViewController;
- (id)_applicationSceneViewControllerForSceneHandle:(id)a3;
- (id)_deviceApplicationSceneViewController;
- (id)_deviceApplicationSceneViewController:(id)a3;
- (id)_medusaDecoratedVC;
- (id)_medusaDecoratedVC:(id)a3;
- (id)backgroundActivitiesToSuppress;
- (id)containerViewForBlurContentView;
- (id)initialCornerRadiusConfiguration;
- (id)prepareForContentRotation;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5;
- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3;
- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3;
- (int64_t)homeGrabberDisplayMode;
- (int64_t)leadingStatusBarStyle;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedContentInterfaceOrientations;
- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3;
- (void)_configureViewController:(id)a3;
- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)prepareForReuse;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setBlurViewIconScale:(double)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setCornerRadiusConfiguration:(id)a3;
- (void)setDarkenViewAlpha:(double)a3;
- (void)setDropInteraction:(id)a3;
- (void)setHomeGrabberDisplayMode:(int64_t)a3;
- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8;
- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4;
- (void)setNubViewHidden:(BOOL)a3;
- (void)setNubViewHighlighted:(BOOL)a3;
- (void)setSceneMinificationFilter:(id)a3;
- (void)setSceneRendersAsynchronously:(BOOL)a3;
- (void)setSceneResizesHostedContext:(BOOL)a3;
- (void)setShadowOffset:(double)a3;
- (void)setShadowOpacity:(double)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBMainWorkspaceApplicationSceneLayoutElementViewController

- (SBMainWorkspaceApplicationSceneLayoutElementViewController)initWithDisplayIdentity:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v3 = [(SBAppContainerViewController *)&v10 initWithDisplayIdentity:a3];
  v4 = v3;
  if (v3)
  {
    v3->_nubViewHidden = 1;
    v3->_nubViewHighlighted = 0;
    v3->_shadowOpacity = 0.0;
    v3->_shadowOffset = 0.0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:SBScreenDisplayCornerRadius()];
    cornerRadiusConfiguration = v4->_cornerRadiusConfiguration;
    v4->_cornerRadiusConfiguration = (BSCornerRadiusConfiguration *)v5;

    v4->_clipsToBounds = 1;
    v4->_darkenViewAlpha = 0.0;
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    maskDisplayCornersReasons = v4->_maskDisplayCornersReasons;
    v4->_maskDisplayCornersReasons = (NSMutableSet *)v7;
  }
  return v4;
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  BOOL v12 = a3;
  id v16 = a7;
  v14 = (void (**)(void))a8;
  v15 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 setLiveContentBlurEnabled:v12 duration:v16 blurDelay:v14 iconViewScale:a4 began:a5 completion:a6];
  }
  else if (v14)
  {
    v14[2](v14);
  }
}

- (double)blurViewIconScale
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_opt_class();
  double v3 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 blurViewIconScale];
    double v3 = v4;
  }

  return v3;
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setBlurViewIconScale:a3];
  }
}

- (BOOL)isBlurred
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 isBlurred];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  [v5 _beginRequiringSceneViewMatchMoveAnimationForReason:v4];
}

- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  [v5 _endRequiringSceneViewMatchMoveAnimationForReason:v4];
}

- (NSString)description
{
  char v3 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_opt_class();
  id v4 = @"NO";
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isBlurred]) {
    id v4 = @"YES";
  }
  id v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v8 = [(SBAppContainerViewController *)self sceneHandle];
  v9 = [v8 sceneIdentifier];
  objc_super v10 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  v11 = [v5 stringWithFormat:@"<%@:%p (%@) - %@ - blurred=%@>", v7, self, v9, v10, v4];

  return (NSString *)v11;
}

- (void)setClipsToBounds:(BOOL)a3
{
  if (self->_clipsToBounds != a3) {
    self->_clipsToBounds = a3;
  }
}

- (void)setDarkenViewAlpha:(double)a3
{
  if (self->_darkenViewAlpha != a3)
  {
    self->_darkenViewAlpha = a3;
    id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
    [v4 setDarkenViewAlpha:a3];
  }
}

- (void)setDropInteraction:(id)a3
{
  v6 = (UIDropInteraction *)a3;
  if (self->_dropInteraction != v6)
  {
    objc_storeStrong((id *)&self->_dropInteraction, a3);
    id v5 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
    [v5 setDropInteraction:v6];
  }
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  [v4 setHomeGrabberDisplayMode:a3];
}

- (int64_t)homeGrabberDisplayMode
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int64_t v3 = [v2 homeGrabberDisplayMode];

  return v3;
}

- (id)prepareForContentRotation
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int64_t v3 = [v2 prepareForContentRotation];

  return v3;
}

- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling
{
  return 1;
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3) {
    self->_shadowOpacity = a3;
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3) {
    self->_shadowOffset = a3;
  }
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v6 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    id v4 = (BSCornerRadiusConfiguration *)[v6 copy];
    cornerRadiusConfiguration = self->_cornerRadiusConfiguration;
    self->_cornerRadiusConfiguration = v4;
  }
}

- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4
{
  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  if (a3) {
    [(NSMutableSet *)maskDisplayCornersReasons addObject:a4];
  }
  else {
    [(NSMutableSet *)maskDisplayCornersReasons removeObject:a4];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  id v7 = a4;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id v5 = [(SBAppContainerViewController *)self sceneHandle];
  uint64_t v6 = [v5 currentInterfaceOrientation];
  if (v6)
  {
    int64_t v7 = v6;
    int64_t v8 = [(SBLayoutElementViewController *)self contentWrapperInterfaceOrientation];
    if (v7 != v8)
    {
      int64_t v9 = v8;
      if (![v5 isEffectivelyForeground]) {
        int64_t v7 = v9;
      }
    }
  }
  else
  {
    int64_t v7 = [v5 activationInterfaceOrientationForOrientation:a3];
  }

  return v7;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  [(SBAppContainerViewController *)&v4 prepareForReuse];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setNubViewHidden:1];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setNubViewHighlighted:0];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setShadowOpacity:0.0];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setShadowOffset:0.0];
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:SBScreenDisplayCornerRadius()];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setCornerRadiusConfiguration:v3];

  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setClipsToBounds:1];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setDarkenViewAlpha:0.0];
  [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self setDropInteraction:0];
  [(NSMutableSet *)self->_maskDisplayCornersReasons removeAllObjects];
}

- (unint64_t)supportedContentInterfaceOrientations
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  id v3 = [(SBLayoutElementViewController *)&v7 supportedContentInterfaceOrientations];
  objc_super v4 = [(SBAppContainerViewController *)self sceneHandle];
  id v5 = v4;
  if (v4) {
    id v3 = (id)[v4 _mainSceneSupportedInterfaceOrientations];
  }

  return (unint64_t)v3;
}

- (BOOL)_shouldDisplayLayoutElementBecomeActive
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBAppContainerViewController *)self sceneHandle];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = [v3 sceneIfExists];
    if (v5 && ![v4 isEffectivelyForeground])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      int v7 = [v6 isSuspendedUnderLock] ^ 1;
    }
    v14 = SBLogAppSwitcher();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      v24 = [(SBLayoutElementViewController *)self layoutElement];
      v17 = [v24 uniqueIdentifier];
      v18 = NSStringFromBOOL();
      [v4 isEffectivelyForeground];
      v19 = NSStringFromBOOL();
      v20 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      [v20 isSuspendedUnderLock];
      v21 = NSStringFromBOOL();
      v22 = [v4 sceneIfExists];
      *(_DWORD *)buf = 138544642;
      v26 = v16;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v18;
      __int16 v31 = 2114;
      v32 = v19;
      __int16 v33 = 2114;
      v34 = v21;
      __int16 v35 = 2114;
      v36 = v22;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ shouldDisplayLayoutElementBecomeActive=%{public}@ because isEffectivelyForeground=%{public}@ isSuspendedUnderLock=%{public}@ sceneIfExists=%{public}@", buf, 0x3Eu);
    }
    int64_t v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "sceneHandle=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    int64_t v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = (objc_class *)objc_opt_class();
      objc_super v10 = NSStringFromClass(v9);
      v11 = [(SBLayoutElementViewController *)self layoutElement];
      BOOL v12 = [v11 uniqueIdentifier];
      v13 = [(SBLayoutElementViewController *)self layoutState];
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      __int16 v27 = 2114;
      v28 = v12;
      __int16 v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ shouldDisplayLayoutElementBecomeActive=NO because there is no scene handle. layout state %{public}@", buf, 0x20u);
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_applicationSceneViewController
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v2 = [(SBAppContainerViewController *)&v4 _applicationSceneViewController];
  return v2;
}

- (id)_applicationSceneViewControllerForSceneHandle:(id)a3
{
  id v5 = a3;
  if (([v5 isDeviceApplicationSceneHandle] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBMainWorkspaceApplicationSceneLayoutElementViewController.m" lineNumber:335 description:@"This class cannot work with anything other than a SBDeviceApplicationSceneHandle."];
  }
  uint64_t v6 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int v7 = v6;
  if (v6)
  {
    int64_t v8 = v6;
  }
  else
  {
    int64_t v9 = +[SBWorkspace mainWorkspace];
    int v10 = [v9 isMedusaCapable];

    if (v10)
    {
      v11 = [(SBLayoutElementViewController *)self layoutElement];
      uint64_t v12 = [v11 layoutRole];

      int64_t v8 = [[SBMedusaDecoratedDeviceApplicationSceneViewController alloc] initWithDeviceApplicationSceneHandle:v5 layoutRole:v12];
    }
    else
    {
      int64_t v8 = [[SBDeviceApplicationSceneViewController alloc] initWithSceneHandle:v5];
    }
  }
  v13 = v8;

  return v13;
}

- (void)_configureViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  id v4 = a3;
  [(SBAppContainerViewController *)&v8 _configureViewController:v4];
  id v5 = -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC:](self, "_medusaDecoratedVC:", v4, v8.receiver, v8.super_class);

  if (v5)
  {
    objc_msgSend(v5, "setNubViewHidden:", -[SBMainWorkspaceApplicationSceneLayoutElementViewController isNubViewHidden](self, "isNubViewHidden"));
    objc_msgSend(v5, "setNubViewHighlighted:", -[SBMainWorkspaceApplicationSceneLayoutElementViewController isNubViewHighlighted](self, "isNubViewHighlighted"));
    [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self darkenViewAlpha];
    objc_msgSend(v5, "setDarkenViewAlpha:");
    uint64_t v6 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self dropInteraction];
    [v5 setDropInteraction:v6];

    int v7 = [(SBLayoutElementViewController *)self layoutElement];
    objc_msgSend(v5, "setLayoutRole:spaceConfiguration:floatingConfiguration:sizingPolicy:", objc_msgSend(v7, "layoutRole"), 0, 0, 0);
  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  [(SBAppContainerViewController *)&v5 sceneHandle:a3 didCreateScene:a4];
  [(SBLayoutElementViewController *)self _updateDisplayLayoutElementVisibility];
}

- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  return [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self statusBarAssertionWithStatusBarHidden:a3 nubViewHidden:0x7FFFFFFFFFFFFFFFLL atLevel:a4];
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  BOOL v7 = a3;
  int64_t v9 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  int v10 = v9;
  if (v9)
  {
    v11 = [v9 statusBarAssertionWithStatusBarHidden:v7 nubViewHidden:a4 atLevel:a5];
  }
  else
  {
    uint64_t v12 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _deviceApplicationSceneViewController];
    v13 = v12;
    if (v12)
    {
      v11 = [v12 statusBarAssertionWithStatusBarHidden:v7 atLevel:a5];
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (BOOL)isNubViewHidden
{
  return self->_nubViewHidden;
}

- (void)setNubViewHidden:(BOOL)a3
{
  if (self->_nubViewHidden != a3)
  {
    BOOL v3 = a3;
    self->_nubViewHidden = a3;
    id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
    [v4 setNubViewHidden:v3];
  }
}

- (BOOL)isNubViewHighlighted
{
  return self->_nubViewHighlighted;
}

- (void)setNubViewHighlighted:(BOOL)a3
{
  if (self->_nubViewHighlighted != a3)
  {
    BOOL v3 = a3;
    self->_nubViewHighlighted = a3;
    id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
    [v4 setNubViewHighlighted:v3];
  }
}

- (SBHomeGrabberView)homeGrabberView
{
  BOOL v3 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _deviceApplicationSceneViewController];
  id v4 = [v3 homeGrabberView];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    BOOL v7 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
    id v6 = [v7 homeGrabberView];
  }
  return (SBHomeGrabberView *)v6;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _deviceApplicationSceneViewController];
  int64_t v5 = [v4 bestHomeAffordanceOrientationForOrientation:a3];

  return v5;
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  BOOL v3 = [v2 backgroundView];

  return (SBApplicationSceneBackgroundView *)v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  [v5 setBackgroundView:v4];
}

- (UIView)sceneContentView
{
  return 0;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  if (objc_opt_respondsToSelector()) {
    [v7 layoutStateTransitionCoordinator:v8 transitionDidBeginWithTransitionContext:v6];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  if (objc_opt_respondsToSelector()) {
    [v7 layoutStateTransitionCoordinator:v8 transitionWillEndWithTransitionContext:v6];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  if (objc_opt_respondsToSelector()) {
    [v7 layoutStateTransitionCoordinator:v8 transitionDidEndWithTransitionContext:v6];
  }
}

- (id)initialCornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (id)containerViewForBlurContentView
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC];
  BOOL v3 = [v2 _blurViewContainerView];

  return v3;
}

- (id)_medusaDecoratedVC
{
  BOOL v3 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _medusaDecoratedVC:v3];

  return v4;
}

- (id)_medusaDecoratedVC:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_deviceApplicationSceneViewController
{
  id v3 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  id v4 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _deviceApplicationSceneViewController:v3];

  return v4;
}

- (id)_deviceApplicationSceneViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)leadingStatusBarStyle
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int64_t v3 = [v2 leadingStatusBarStyle];

  return v3;
}

- (int64_t)trailingStatusBarStyle
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int64_t v3 = [v2 trailingStatusBarStyle];

  return v3;
}

- (id)backgroundActivitiesToSuppress
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  int64_t v3 = [v2 backgroundActivitiesToSuppress];

  return v3;
}

- (double)currentStatusBarHeight
{
  v2 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  [v2 currentStatusBarHeight];
  double v4 = v3;

  return v4;
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  [v11 willRotateFromInterfaceOrientation:a3 toInterfaceOrientation:a4 alongsideContainerView:v10 animated:v6];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  id v6 = [(SBMainWorkspaceApplicationSceneLayoutElementViewController *)self _applicationSceneViewController];
  [v6 didRotateFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
}

- (NSString)sceneMinificationFilter
{
  return self->sceneMinificationFilter;
}

- (void)setSceneMinificationFilter:(id)a3
{
}

- (BOOL)sceneRendersAsynchronously
{
  return self->sceneRendersAsynchronously;
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  self->sceneRendersAsynchronously = a3;
}

- (BOOL)sceneResizesHostedContext
{
  return self->sceneResizesHostedContext;
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
  self->sceneResizesHostedContext = a3;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (double)darkenViewAlpha
{
  return self->_darkenViewAlpha;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_maskDisplayCornersReasons, 0);
}

@end