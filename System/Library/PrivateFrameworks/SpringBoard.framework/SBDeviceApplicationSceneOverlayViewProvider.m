@interface SBDeviceApplicationSceneOverlayViewProvider
- (BOOL)_contentSupportedInterfaceOrientationsRequireContainerCounterRotation;
- (BOOL)_mightNeedCounterRotationForBasicContentWrapper;
- (BOOL)affectsStatusBarPresentation;
- (BOOL)contentWantsSimplifiedOrientationBehavior;
- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldFollowSceneOrientation;
- (BOOL)wantsResignActiveAssertion;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBDeviceApplicationSceneOverlayViewController)overlayViewController;
- (SBDeviceApplicationSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4;
- (SBDeviceApplicationSceneOverlayViewProviderDelegate)delegate;
- (id)_realOverlayViewController;
- (id)initialTraitsParticipantForOverlayContainer;
- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (int64_t)priority;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateIfPossible;
- (void)_deactivateIfPossible;
- (void)_noteSupportedInterfaceOrientationsChanged;
- (void)containerDidUpdateTraitsParticipant:(id)a3;
- (void)dealloc;
- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
- (void)setSceneHandle:(id)a3;
- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SBDeviceApplicationSceneOverlayViewProvider

- (SBDeviceApplicationSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneOverlayViewProvider;
  v9 = [(SBDeviceApplicationSceneOverlayViewProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneHandle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    [(SBDeviceApplicationSceneOverlayViewProvider *)v10 _activateIfPossible];
  }

  return v10;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)dealloc
{
  [(SBDeviceApplicationSceneOverlayViewProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v3 dealloc];
}

- (SBDeviceApplicationSceneOverlayViewController)overlayViewController
{
  orientationWrapperViewController = self->_orientationWrapperViewController;
  if (!orientationWrapperViewController) {
    orientationWrapperViewController = self->_basicWrapperViewController;
  }
  return (SBDeviceApplicationSceneOverlayViewController *)orientationWrapperViewController;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _realOverlayViewController];
  int64_t v3 = [v2 preferredStatusBarStyle];

  return v3;
}

- (BOOL)affectsStatusBarPresentation
{
  return 1;
}

- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4
{
  return 0;
}

- (BOOL)wantsResignActiveAssertion
{
  return 1;
}

- (int64_t)priority
{
  return 0;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  if ([(SBDeviceApplicationSceneOverlayViewProvider *)self shouldFollowSceneOrientation]
    || ((1 << a3) & ~[(SBDeviceApplicationSceneOverlayViewProvider *)self supportedInterfaceOrientations]) == 0)
  {
    return a3;
  }
  orientationWrapperViewController = self->_orientationWrapperViewController;
  if (orientationWrapperViewController)
  {
    return [(SBIsolatedSceneOrientationFollowingWrapperViewController *)orientationWrapperViewController currentInterfaceOrientation];
  }
  else
  {
    id v7 = [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self->_basicWrapperViewController view];
    id v8 = [v7 window];
    int64_t v9 = [v8 _windowInterfaceOrientation];

    return v9;
  }
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
}

- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)shouldFollowSceneOrientation
{
  return 1;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v2 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _realOverlayViewController];
  int64_t v3 = [v2 preferredInterfaceOrientationForPresentation];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _realOverlayViewController];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

- (id)initialTraitsParticipantForOverlayContainer
{
  unint64_t v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  v4 = [v3 initialTraitsParticipantForOverlayViewProvider:self];

  return v4;
}

- (void)_activateIfPossible
{
  id v12 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  if (-[SBDeviceApplicationSceneOverlayViewProvider contentWantsSimplifiedOrientationBehavior](self, "contentWantsSimplifiedOrientationBehavior")|| ([v12 overlayViewProviderIsHostedInNonrotatingWindow:self] & 1) == 0&& -[SBDeviceApplicationSceneOverlayViewProvider shouldFollowSceneOrientation](self, "shouldFollowSceneOrientation"))
  {
    if ([(SBDeviceApplicationSceneOverlayViewProvider *)self _mightNeedCounterRotationForBasicContentWrapper])
    {
      BOOL v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _contentSupportedInterfaceOrientationsRequireContainerCounterRotation];
      self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate = 1;
    }
    else
    {
      BOOL v3 = 0;
    }
    v10 = [SBDeviceApplicationSceneOverlayBasicWrapperViewController alloc];
    v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _realOverlayViewController];
    v11 = -[SBDeviceApplicationSceneOverlayBasicWrapperViewController initWithContentViewController:rendersWhileLocked:needsCounterRotation:](v10, "initWithContentViewController:rendersWhileLocked:needsCounterRotation:", v5, [v12 overlayViewProviderRendersWhileLocked:self], v3);
    basicWrapperViewController = self->_basicWrapperViewController;
    self->_basicWrapperViewController = v11;
  }
  else
  {
    v4 = [SBIsolatedSceneOrientationFollowingWrapperViewController alloc];
    v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self _realOverlayViewController];
    basicWrapperViewController = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    id v7 = [v12 windowSceneForOverlayViewProvider:self];
    id v8 = -[SBIsolatedSceneOrientationFollowingWrapperViewController initWithContentViewController:sceneHandle:windowScene:orientationDelegate:rendersWhileLocked:](v4, "initWithContentViewController:sceneHandle:windowScene:orientationDelegate:rendersWhileLocked:", v5, basicWrapperViewController, v7, self, [v12 overlayViewProviderRendersWhileLocked:self]);
    orientationWrapperViewController = self->_orientationWrapperViewController;
    self->_orientationWrapperViewController = v8;
  }
  [v12 activateOverlayForViewProvider:self];
}

- (void)_deactivateIfPossible
{
  BOOL v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  id v8 = v3;
  if (v3)
  {
    [v3 deactivateOverlayForViewProvider:self];
  }
  else
  {
    v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)self overlayViewController];
    [v4 beginAppearanceTransition:0 animated:0];
    [v4 willMoveToParentViewController:0];
    v5 = [v4 viewIfLoaded];
    [v5 removeFromSuperview];

    [v4 removeFromParentViewController];
    [v4 endAppearanceTransition];
  }
  orientationWrapperViewController = self->_orientationWrapperViewController;
  self->_orientationWrapperViewController = 0;

  basicWrapperViewController = self->_basicWrapperViewController;
  self->_basicWrapperViewController = 0;
}

- (id)_realOverlayViewController
{
  return 0;
}

- (BOOL)_mightNeedCounterRotationForBasicContentWrapper
{
  BOOL v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  v4 = [v3 application];
  if (([v4 classicAppPhoneAppRunningOnPad] & 1) != 0
    || ![(SBDeviceApplicationSceneOverlayViewProvider *)self contentWantsSimplifiedOrientationBehavior])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = ![(SBDeviceApplicationSceneOverlayViewProvider *)self shouldFollowSceneOrientation];
  }

  return v5;
}

- (BOOL)_contentSupportedInterfaceOrientationsRequireContainerCounterRotation
{
  return ([(SBDeviceApplicationSceneOverlayViewProvider *)self supportedInterfaceOrientations] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)_noteSupportedInterfaceOrientationsChanged
{
  if (self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate
    && self->_basicWrapperViewController
    && [(SBDeviceApplicationSceneOverlayViewProvider *)self _mightNeedCounterRotationForBasicContentWrapper])
  {
    self->_needsCounterRotationReevaluationForFirstSupportedOrientationsUpdate = 0;
    id v3 = [(SBDeviceApplicationSceneOverlayBasicWrapperViewController *)self->_basicWrapperViewController overlayView];
    objc_msgSend(v3, "setNeedsCounterRotation:", -[SBDeviceApplicationSceneOverlayViewProvider _contentSupportedInterfaceOrientationsRequireContainerCounterRotation](self, "_contentSupportedInterfaceOrientationsRequireContainerCounterRotation"));
  }
}

- (SBDeviceApplicationSceneOverlayViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDeviceApplicationSceneOverlayViewProviderDelegate *)WeakRetained;
}

- (void)setSceneHandle:(id)a3
{
}

- (BOOL)prefersStatusBarHidden
{
  return self->_prefersStatusBarHidden;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return self->_contentWantsSimplifiedOrientationBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_basicWrapperViewController, 0);
  objc_storeStrong((id *)&self->_orientationWrapperViewController, 0);
}

@end