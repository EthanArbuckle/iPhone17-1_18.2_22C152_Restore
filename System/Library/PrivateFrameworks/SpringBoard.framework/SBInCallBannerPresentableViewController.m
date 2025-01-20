@interface SBInCallBannerPresentableViewController
+ (NSString)requesterIdentifier;
+ (double)cornerRadius;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isCallConnected;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isPresented;
- (BOOL)isTouchOutsideDismissalEnabled;
- (BOOL)shouldDismissForReason:(id)a3;
- (CGPoint)translationInCoordinateSpace:(id)a3;
- (CGPoint)velocityInCoordinateSpace:(id)a3;
- (CGPoint)visualTranslationInCoordinateSpace:(id)a3;
- (CGSize)preferredBannerContentSize;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)result containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBInCallBannerPresentableViewController)initWithSceneHandle:(id)a3;
- (SBInCallBannerPresentableViewControllerDelegate)delegate;
- (id)_inCallSceneClientSettingsDiffInspector;
- (void)_callConnectedStatusChanged;
- (void)_handlePanGestureProxyAction:(id)a3;
- (void)_handleTapAction:(id)a3;
- (void)dealloc;
- (void)draggingDidBeginWithGestureProxy:(id)a3;
- (void)invalidate;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPreferredBannerContentSize:(CGSize)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBInCallBannerPresentableViewController

- (SBInCallBannerPresentableViewController)initWithSceneHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallBannerPresentableViewController;
  v6 = [(SBInCallBannerPresentableViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    [(SBDeviceApplicationSceneHandle *)v7->_sceneHandle addObserver:v7];
  }

  return v7;
}

- (void)dealloc
{
  if ([(SBInCallBannerPresentableViewController *)self isViewLoaded]) {
    [(SBInCallBannerPresentableViewController *)self bs_removeChildViewController:self->_sceneViewController];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBInCallBannerPresentableViewController;
  [(SBInCallBannerPresentableViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBInCallBannerPresentableViewController;
  [(SBInCallBannerPresentableViewController *)&v15 viewDidLayoutSubviews];
  objc_super v3 = [(SBInCallBannerPresentableViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  uint64_t v13 = [(SBInCallBannerPresentableViewController *)self interfaceOrientation];
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v13, v13, v9, v11);
  v14 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController backgroundView];
  objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)SBInCallBannerPresentableViewController;
  [(SBInCallBannerPresentableViewController *)&v15 viewDidLoad];
  objc_super v3 = [(SBInCallBannerPresentableViewController *)self view];
  double v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle newSceneViewController];
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;

  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setRendersWhileLocked:1];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setHomeGrabberDisplayMode:1];
  double v6 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController statusBarAssertionWithStatusBarHidden:1 atLevel:0];
  statusBarHiddenAssertion = self->_statusBarHiddenAssertion;
  self->_statusBarHiddenAssertion = v6;

  double v8 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  [(id)objc_opt_class() cornerRadius];
  objc_msgSend(v8, "_setContinuousCornerRadius:");
  [v8 setClipsToBounds:1];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapAction_];
  [v8 addGestureRecognizer:v9];
  double v10 = [SBInCallBannerSceneBackgroundView alloc];
  [v8 bounds];
  double v11 = -[SBInCallBannerSceneBackgroundView initWithFrame:](v10, "initWithFrame:");
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setBackgroundView:v11];
  [(SBInCallBannerPresentableViewController *)self addChildViewController:self->_sceneViewController];
  uint64_t v12 = [(SBInCallBannerPresentableViewController *)self interfaceOrientation];
  uint64_t v13 = self->_sceneViewController;
  [(SBInCallBannerPresentableViewController *)self preferredBannerContentSize];
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](v13, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v12, v12);
  v14 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  [v3 addSubview:v14];

  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController didMoveToParentViewController:self];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setDisplayMode:4 animationFactory:0 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallBannerPresentableViewController;
  id v7 = a4;
  -[SBInCallBannerPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__SBInCallBannerPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AF53F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __94__SBInCallBannerPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
  [v4 inCallBannerPresentableViewController:v2 viewWillTransitionSizeWithAnimationSettings:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureProxy, a3);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__SBInCallBannerPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
  v6[3] = &unk_1E6AFBFF0;
  objc_copyWeak(&v7, &location);
  [v5 setActionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__SBInCallBannerPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePanGestureProxyAction:v3];
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  id v5 = [v4 clientSettings];
  double v6 = SBSafeCast(v3, v5);

  LOBYTE(v4) = [v6 isCallConnected];
  return (char)v4;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)result containerSize:(CGSize)a4
{
  double height = self->_preferredBannerContentSize.height;
  result.double height = height;
  return result;
}

- (NSString)requesterIdentifier
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 requesterIdentifier];
}

- (NSString)requestIdentifier
{
  return (NSString *)@"InCall";
}

- (BOOL)shouldDismissForReason:(id)a3
{
  id v4 = a3;
  if ([(SBInCallBannerPresentableViewController *)self isCallConnected])
  {
    LOBYTE(v5) = 1;
  }
  else if (([v4 isEqualToString:@"dismissOverlays"] & 1) != 0 {
         || ([v4 isEqualToString:@"mainScreenAnimationController"] & 1) != 0)
  }
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = [v4 isEqualToString:@"assistantWillAppear"] ^ 1;
  }

  return v5;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerDidAppear:self];
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  self->_presented = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerWillAppear:self];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained inCallBannerPresentableViewController:self willDisappearWithReason:v6];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  self->_presented = 0;
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained inCallBannerPresentableViewController:self didDisappearWithReason:v6];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerUserInteractionWillBegin:self];
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerUserInteractionDidEnd:self];
}

- (void)invalidate
{
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController invalidate];
  [(SBSceneViewStatusBarAssertion *)self->_statusBarHiddenAssertion invalidate];
  statusBarHiddenAssertion = self->_statusBarHiddenAssertion;
  self->_statusBarHiddenAssertion = 0;
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes] & 2) == 0)return 0; {
  sceneHandle = self->_sceneHandle;
  }
  return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:1];
}

- (BOOL)handleVolumeDownButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes] & 4) == 0)return 0; {
  sceneHandle = self->_sceneHandle;
  }
  return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:2];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes];
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      uint64_t v6 = 3;
      goto LABEL_7;
    }
    return 0;
  }
  if ((v5 & 0x10) == 0) {
    return 0;
  }
  uint64_t v6 = 4;
LABEL_7:
  sceneHandle = self->_sceneHandle;
  return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:v6];
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v6 = a4;
  id v7 = [(SBInCallBannerPresentableViewController *)self _inCallSceneClientSettingsDiffInspector];
  [v7 inspectDiff:v6 withContext:0];
}

- (id)_inCallSceneClientSettingsDiffInspector
{
  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    id v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4FA7B98]);
    char v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    id v6 = self->_inCallSceneClientSettingsDiffInspector;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__SBInCallBannerPresentableViewController__inCallSceneClientSettingsDiffInspector__block_invoke;
    v8[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v9, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v6 observeCallConnectedWithBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __82__SBInCallBannerPresentableViewController__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callConnectedStatusChanged];
}

- (void)_callConnectedStatusChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerCallConnectedStatusChanged:self];
}

+ (double)cornerRadius
{
  return 13.0;
}

+ (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.InCall";
}

- (BOOL)isCallConnected
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  char v5 = [v4 clientSettings];
  id v6 = SBSafeCast(v3, v5);
  char v7 = [v6 isCallConnected];

  return v7;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxy *)self->_lastGestureProxy translationInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxy *)self->_lastGestureProxy visualTranslationInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxy *)self->_lastGestureProxy velocityInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_handleTapAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallBannerPresentableViewControllerDidReceiveTap:self];
}

- (void)_handlePanGestureProxyAction:(id)a3
{
  int v4 = [a3 didCrossDefaultThreshold];
  if (!self->_didCrossDefaultDraggingThreshold && v4 != 0)
  {
    self->_didCrossDefaultDraggingThreshold = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained inCallBannerPresentableViewControllerDidCrossDefaultDraggingThreshold:self];
  }
}

- (SBInCallBannerPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInCallBannerPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)preferredBannerContentSize
{
  double width = self->_preferredBannerContentSize.width;
  double height = self->_preferredBannerContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredBannerContentSize:(CGSize)a3
{
  self->_preferredBannerContentSize = a3;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_statusBarHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_lastGestureProxy, 0);
}

@end