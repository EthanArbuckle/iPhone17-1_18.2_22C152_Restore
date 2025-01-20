@interface _UIViewServiceViewControllerOperator
+ (_UIViewServiceViewControllerOperator)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 hostBundleID:(id)a5 hostAuditToken:(id *)a6 sessionIdentifier:(id)a7;
+ (id)XPCInterface;
+ (void)initialize;
- (BOOL)__knownPresentationWithoutPresentationControllerInstance;
- (BOOL)_canShowWhileLocked;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_forwardPresses:(id)a3 withEvent:(id)a4 canceled:(BOOL)a5;
- (BOOL)_isHostedRootViewController;
- (BOOL)_providesCustomBasePresentationInsets;
- (BOOL)_shouldForwardLegacyRotationOnly;
- (BOOL)becomeFirstResponder;
- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7;
- (BOOL)isModalInPresentation;
- (BOOL)sendClientToHostAction:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CGSize)contentSizeForViewInPopover;
- (NSString)debugDescription;
- (NSUUID)_sessionIdentifier;
- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_viewSafeAreaInsetsFromScene;
- (UIViewController)localViewController;
- (UIWindow)_primaryHostedWindow;
- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry;
- (_UIRemoteViewControllerSceneContext)_sceneContext;
- (_UIViewServiceViewControllerOperatorDelegate)delegate;
- (double)_canvasSystemMinimumMargin;
- (double)_systemReferenceAngleFromHost;
- (double)hysteresisForInteraction:(id)a3;
- (id)_childViewControllerForMultitaskingDragExclusionRects;
- (id)_dataFromPressesEvent:(id)a3;
- (id)_inputViewsKey;
- (id)_presentationControllerClassName;
- (id)_queue;
- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7;
- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6;
- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4;
- (id)_supportedInterfaceOrientationsForViewController:(id)a3;
- (id)_traitsDidChangeHandler;
- (id)_traitsWillChangeHandler;
- (id)_viewControllersForRotationCallbacks;
- (id)_window;
- (id)_windowHostingScene;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForPointerLock;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (id)invalidate;
- (id)preferredFocusEnvironments;
- (id)trackingViewForInteraction:(id)a3;
- (int)_effectiveViewControllerAppearState;
- (int64_t)_availableTextServices;
- (unint64_t)_providerType;
- (unint64_t)_systemReferenceAngleModeFromHost;
- (unint64_t)supportedInterfaceOrientations;
- (void)__cancelAlertActionWithToken:(int64_t)a3;
- (void)__createViewControllerWithOptions:(id)a3 completionBlock:(id)a4;
- (void)__dimmingViewWasTapped;
- (void)__exchangeAccessibilityPortInformation:(id)a3 replyHandler:(id)a4;
- (void)__hostDidAttachDisplay:(id)a3;
- (void)__hostDidBecomeActive;
- (void)__hostDidChangeStatusBarHeight:(double)a3;
- (void)__hostDidChangeStatusBarOrientationToInterfaceOrientation:(int64_t)a3;
- (void)__hostDidDetachDisplay:(id)a3;
- (void)__hostDidDismissShieldViewForAppProtection;
- (void)__hostDidEnterBackground;
- (void)__hostDidEvaluatePencilBarrelEventFocusForSceneTransition;
- (void)__hostDidMoveToParentSceneWithSettings:(id)a3;
- (void)__hostDidPresentShieldViewForAppProtection;
- (void)__hostDidPromoteFirstResponder;
- (void)__hostDidReceivePhysicalButtonBSAction:(id)a3;
- (void)__hostDidRotateFromInterfaceOrientation:(int64_t)a3 skipSelf:(BOOL)a4;
- (void)__hostDidSetContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5;
- (void)__hostDidSetPresentationControllerClassName:(id)a3;
- (void)__hostDidUpdateDisplay:(id)a3;
- (void)__hostDidUpdateSceneContext:(id)a3;
- (void)__hostDisablesAutomaticKeyboardBehavior:(BOOL)a3;
- (void)__hostHomeAffordanceFrameIntersectionDidChange:(CGRect)a3;
- (void)__hostReadyToReceiveMessagesFromServiceViewController;
- (void)__hostReceivedHomeAffordanceDoubleTapGestureDidSucceed:(BOOL)a3;
- (void)__hostSceneDidEnterBackground;
- (void)__hostSceneDidUpdateWithDiff:(id)a3;
- (void)__hostSceneWillEnterForeground;
- (void)__hostViewDidAppear:(BOOL)a3;
- (void)__hostViewDidDisappear:(BOOL)a3;
- (void)__hostViewDidMoveToScreenWithFBSDisplayIdentity:(id)a3 newHostingHandleReplyHandler:(id)a4;
- (void)__hostViewWillAppear:(BOOL)a3 inInterfaceOrientation:(int64_t)a4 traitCollection:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 completionHandler:(id)a8;
- (void)__hostViewWillDisappear:(BOOL)a3;
- (void)__hostViewWillMoveToWindowInInterfaceOrientation:(int64_t)a3 withStatusBarHeight:(double)a4 underlapsStatusBar:(BOOL)a5;
- (void)__hostViewWillTransitionToSize:(CGSize)a3 withContextDescription:(id)a4 boundingPath:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 fence:(id)a8 timing:(_UIUpdateTiming *)a9 whenDone:(id)a10;
- (void)__hostWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5;
- (void)__hostWillEnterForeground;
- (void)__hostWillResignActive;
- (void)__hostWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5;
- (void)__hostWillTransitionToTraitCollection:(id)a3 withContextDescription:(id)a4 deferIfAnimated:(BOOL)a5 inRemoteViewHierarchy:(BOOL)a6;
- (void)__installDismissInteractionForZoomTransition;
- (void)__intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4;
- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3;
- (void)__redoActionWithToken:(int64_t)a3;
- (void)__scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)__setBoundingPath:(id)a3;
- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4;
- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4 withFence:(id)a5;
- (void)__setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3;
- (void)__setHostTintColor:(id)a3 tintAdjustmentMode:(int64_t)a4;
- (void)__setHostTraitCollection:(id)a3 deferIfAnimated:(BOOL)a4;
- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3;
- (void)__setMediaOverridePID:(int)a3;
- (void)__setServiceInPopover:(BOOL)a3;
- (void)__setSheetConfiguration:(id)a3;
- (void)__sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3;
- (void)__sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5;
- (void)__sheetInteractionDraggingDidEnd;
- (void)__showEditAlertView;
- (void)__textServiceDidDismiss;
- (void)__timelinesForDateInterval:(id)a3 completion:(id)a4;
- (void)__undoActionWithToken:(int64_t)a3;
- (void)__updateWithFrameSpecifierDate:(id)a3 completion:(id)a4;
- (void)_addSceneForwardingLayersForOwners:(id)a3;
- (void)_didBecomeContentViewControllerOfPopover:(id)a3;
- (void)_didResignContentViewControllerOfPopover:(id)a3;
- (void)_eventDispatcherDidCancelTouch:(id)a3;
- (void)_firstResponderDidChange:(id)a3;
- (void)_forwardFocusMovementAction:(id)a3;
- (void)_handleActivityObserverGesture:(id)a3;
- (void)_installActivityObserverGestureIfNeeded;
- (void)_invalidateUnconditionallyThen:(id)a3;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_objc_initiateDealloc;
- (void)_physicalButtonInteractionArbiter:(id)a3 didUpdateResolvedConfigurations:(id)a4 inActiveViewServiceSession:(id)a5;
- (void)_popoverDidDismiss:(id)a3;
- (void)_popoverWillPresent:(id)a3;
- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3;
- (void)_removeSceneForwardingLayersForOwners:(id)a3;
- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects;
- (void)_setTraitsDidChangeHandler:(id)a3;
- (void)_setTraitsWillChangeHandler:(id)a3;
- (void)_sheetGrabberDidTriggerPrimaryAction;
- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
- (void)_sheetInteractionDraggingDidEnd;
- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3;
- (void)_updateSupportedInterfaceOrientationsIfNecessary;
- (void)_viewServiceIsDisplayingPopoverController:(id)a3;
- (void)_wantsKeyboardEventsWithoutFirstResponder:(id)a3;
- (void)_willBecomeContentViewControllerOfPopover:(id)a3;
- (void)_willResignContentViewControllerOfPopover:(id)a3;
- (void)_windowDidBecomeApplicationKey:(id)a3;
- (void)_windowDidRegisterOrUnregisterScrollToTopView;
- (void)addDeputyRotationDelegate:(id)a3;
- (void)dealloc;
- (void)dismissHostedTextServiceSession:(id)a3 animated:(BOOL)a4;
- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5;
- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4;
- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4;
- (void)dummyPopoverController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5;
- (void)dummyPopoverController:(id)a3 popoverViewDidSetUseToolbarShine:(BOOL)a4;
- (void)establishViewControllerDeputyWithProxy:(id)a3 completionHandler:(id)a4;
- (void)loadView;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setNeedsUpdateOfHomeIndicatorAutoHidden;
- (void)setNeedsUpdateOfPrefersPointerLocked;
- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures;
- (void)setNeedsWhitePointAdaptivityStyleUpdate;
- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5;
@end

@implementation _UIViewServiceViewControllerOperator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (id)_queue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

+ (_UIViewServiceViewControllerOperator)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 hostBundleID:(id)a5 hostAuditToken:(id *)a6 sessionIdentifier:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  v12 = (NSString *)a5;
  v13 = (NSUUID *)a7;
  v14 = objc_alloc_init(_UIViewServiceViewControllerOperator);
  id remoteViewControllerProxyToOperator = v14->_remoteViewControllerProxyToOperator;
  v14->_id remoteViewControllerProxyToOperator = v11;
  id v36 = v11;

  v14->_hostPID = v10;
  v14->_mediaPID = v10;
  hostBundleID = v14->_hostBundleID;
  v14->_hostBundleID = v12;
  v17 = v12;

  long long v18 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)v14->_hostAuditToken.val = *(_OWORD *)a6->var0;
  *(_OWORD *)&v14->_hostAuditToken.val[4] = v18;
  sessionIdentifier = v14->_sessionIdentifier;
  v14->_sessionIdentifier = v13;
  v20 = v13;

  beginInheritingCoreMediaApplicationState(v14->_mediaPID);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke;
  v38[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v38[4] = v14;
  uint64_t v21 = +[_UIAsyncInvocation invocationWithBlock:v38];
  prepareForDisconnectionInvocation = v14->_prepareForDisconnectionInvocation;
  v14->_prepareForDisconnectionInvocation = (_UIAsyncInvocation *)v21;

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke_2;
  v37[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v37[4] = v14;
  uint64_t v23 = +[_UIAsyncInvocation invocationWithBlock:v37];
  invalidationInvocation = v14->_invalidationInvocation;
  v14->_invalidationInvocation = (_UIAsyncInvocation *)v23;

  [(UIViewController *)v14 setWantsFullScreenLayout:1];
  [(UIViewController *)v14 _setAllowsAutorotation:0];
  v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:v14 selector:sel__popoverWillPresent_ name:0x1ED10B260 object:0];
  [v25 addObserver:v14 selector:sel__popoverDidDismiss_ name:0x1ED10B280 object:0];
  v26 = (void *)MEMORY[0x1E4F62A20];
  v27 = [(NSUUID *)v20 UUIDString];
  v28 = +[FBSSceneSpecification specification];
  uint64_t v29 = [v26 pseudoSceneWithIdentifier:v27 specification:v28];
  pseudoScene = v14->_pseudoScene;
  v14->_pseudoScene = (FBSScene *)v29;

  v31 = [(id)objc_opt_class() XPCInterface];
  v32 = [v31 exportedInterface];
  v33 = [v32 protocol];
  v34 = +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:v14 forCommunicationWithPID:v10 exportedProtocol:v33];

  return (_UIViewServiceViewControllerOperator *)v34;
}

- (void)_objc_initiateDealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", &_objc_initiateDealloc___s_category_0)+ 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v4 = NSString;
      v5 = self;
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
    }
    else
    {
      v8 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Initiating deallocation for operator: %{public}@", buf, 0xCu);
  }
  if (self) {
    *((_WORD *)&self->super._viewControllerFlags + 4) |= 0x80u;
  }
  v9 = [(_UIViewServiceViewControllerOperator *)self invalidate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___UIViewServiceViewControllerOperator__objc_initiateDealloc__block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v10[4] = self;
  [v9 whenCompleteDo:v10];
}

- (void)dealloc
{
  v6[8] = *MEMORY[0x1E4F143B8];
  [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowFirstResponderDidChangeNotification";
  v6[1] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v6[2] = @"_UIWindowDidResignApplicationKeyNotification";
  v6[3] = @"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification";
  v6[4] = @"_UIHostedWindowDidRegisterScrollToTopViewNotification";
  v6[5] = @"_UIHostedWindowDidUnregisterScrollToTopViewNotification";
  v6[6] = 0x1ED10B260;
  v6[7] = 0x1ED10B280;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v5 dealloc];
}

- (void)establishViewControllerDeputyWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (!self->_localViewController)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    NSLog(&cfstr_ReceivedViewCo.isa, v9, self);

    v7[2](v7, 0);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke;
  block[3] = &unk_1E52E3298;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = [(id)UIApp _beginBackgroundTaskWithExpirationHandler:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke;
  block[3] = &unk_1E530DCB0;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v13 = self;
  uint64_t v14 = v6;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIAsyncInvocation *)self->_prepareForDisconnectionInvocation invoke];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___UIViewServiceViewControllerOperator__invalidateUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E52DA040;
  id v8 = v4;
  id v6 = v4;
  [v5 whenCompleteDo:v7];
}

- (void)loadView
{
  id v7 = +[UIScreen mainScreen];
  id v3 = [UIView alloc];
  [v7 bounds];
  id v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  [(UIViewController *)self setView:v4];

  [v7 _referenceBounds];
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__setServiceMaxFrameSize:", v5, v6);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v4 viewDidLoad];
  id v3 = [(UIViewController *)self view];
  [v3 setAutoresizingMask:18];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v2 viewDidLayoutSubviews];
}

- (BOOL)_isHostedRootViewController
{
  return 1;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return self->_disableAutomaticKeyboardBehavior;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return [(UIViewController *)self->_localViewController shouldAutorotateToInterfaceOrientation:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(UIViewController *)self->_localViewController supportedInterfaceOrientations];
}

- (void)addDeputyRotationDelegate:(id)a3
{
  id v4 = a3;
  deputyRotationDelegates = self->_deputyRotationDelegates;
  id v8 = v4;
  if (!deputyRotationDelegates)
  {
    double v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v7 = self->_deputyRotationDelegates;
    self->_deputyRotationDelegates = v6;

    id v4 = v8;
    deputyRotationDelegates = self->_deputyRotationDelegates;
  }
  [(NSMutableArray *)deputyRotationDelegates addObject:v4];
  objc_msgSend(v8, "setHostedWindow:disableAutomaticBehaviors:", self->_hostedWindow, -[UIResponder _disableAutomaticKeyboardBehavior](self->_localViewController, "_disableAutomaticKeyboardBehavior"));
}

- (id)_window
{
  return self->_hostedWindow;
}

- (void)_updateSupportedInterfaceOrientationsIfNecessary
{
  id v3 = [(UIViewController *)self->_localViewController _viewControllerForSupportedInterfaceOrientations];
  uint64_t v4 = [v3 supportedInterfaceOrientations];

  if (v4 != self->_supportedOrientations)
  {
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    double v6 = _supportedInterfaceOrientationsForMask(v4);
    objc_msgSend(remoteViewControllerProxyToOperator, "__setSupportedInterfaceOrientations:", v6);

    self->_supportedOrientations = v4;
  }
}

- (UIViewController)localViewController
{
  return self->_localViewController;
}

- (void)__setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3
{
  self->_hostCanDynamicallySpecifySupportedInterfaceOrientations = a3;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = self->_hostedWindow;
  [(_UIHostedWindow *)v10 __setHostViewUnderlapsStatusBar:v3];
  [(UIViewController *)self _updateLayoutForStatusBarAndInterfaceOrientation];
  double v5 = self;
  uint64_t v6 = [(UIViewController *)v5 presentedViewController];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      [v7 _updateLayoutForStatusBarAndInterfaceOrientation];
      id v8 = v7;

      id v7 = [(UIViewController *)v8 presentedViewController];

      double v5 = v8;
    }
    while (v7);
  }
  else
  {
    id v8 = v5;
  }
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"_UIViewServiceHostDidUpdateUnderlapsStatusBar" object:v10 userInfo:0];
}

- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5
{
  hostedWindow = self->_hostedWindow;
  id v9 = a3;
  if ([(_UIHostedWindow *)hostedWindow __hostViewUnderlapsStatusBar]) {
    -[UIViewController window:statusBarWillChangeFromHeight:toHeight:](&v11, sel_window_statusBarWillChangeFromHeight_toHeight_, v9, a4, a5, v10.receiver, v10.super_class, self, _UIViewServiceViewControllerOperator);
  }
  else {
    -[UIViewController window:statusBarWillChangeFromHeight:toHeight:](&v10, sel_window_statusBarWillChangeFromHeight_toHeight_, v9, a4, 0.0, self, _UIViewServiceViewControllerOperator, v11.receiver, v11.super_class);
  }
}

- (BOOL)__knownPresentationWithoutPresentationControllerInstance
{
  return self->_presentationControllerClassName != 0;
}

- (void)__scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UIViewController *)self view];
  id v9 = [v8 window];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91___UIViewServiceViewControllerOperator___scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke;
  v11[3] = &unk_1E52D9FE8;
  id v12 = v7;
  id v10 = v7;
  objc_msgSend(v9, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", v11, x, y);
}

- (void)_windowDidRegisterOrUnregisterScrollToTopView
{
  id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  id v3 = [(UIWindow *)self->_hostedWindow _registeredScrollToTopViews];
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidChangeHasScrollToTopView:", objc_msgSend(v3, "count") != 0);
}

- (void)__setHostTintColor:(id)a3 tintAdjustmentMode:(int64_t)a4
{
  id v7 = a3;
  uint64_t v6 = self->_hostedWindow;
  if (dyld_program_sdk_at_least()) {
    [(_UIHostedWindow *)v6 _setHostTintColor:v7];
  }
  [(_UIHostedWindow *)v6 _setHostTintAdjustmentMode:a4];
}

- (void)__setHostTraitCollection:(id)a3 deferIfAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = _unobscuredTraitCollectionFromTraitCollection(a3);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke;
  aBlock[3] = &unk_1E52D9960;
  objc_copyWeak(&v13, &location);
  id v7 = v6;
  id v12 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = v8;
  if (v4)
  {
    id v10 = (void *)[v8 copy];
    [(_UIViewServiceViewControllerOperator *)self _setTraitsDidChangeHandler:v10];
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)__hostWillTransitionToTraitCollection:(id)a3 withContextDescription:(id)a4 deferIfAnimated:(BOOL)a5 inRemoteViewHierarchy:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  objc_super v11 = _unobscuredTraitCollectionFromTraitCollection(a3);
  id v12 = _UIHostedWindowModifiedHostTraitCollection((uint64_t)self->_hostedWindow, (uint64_t)v11);
  [v10 transitionDuration];
  uint64_t v22 = 3221225472;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v23 = __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke;
  v24 = &unk_1E530DCE0;
  char v14 = v13 > 0.0 || v7;
  LOBYTE(v28) = v14;
  BYTE1(v28) = v13 > 0.0;
  v25 = self;
  id v26 = v10;
  BYTE2(v28) = a6;
  id v27 = v12;
  id v15 = v12;
  id v16 = v10;
  v17 = (uint64_t (**)(void))_Block_copy(&v21);
  long long v18 = v17;
  if (v7)
  {
    v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24, v25, v26, v27, v28);
    [(_UIViewServiceViewControllerOperator *)self _setTraitsWillChangeHandler:v19];
  }
  else
  {
    id v20 = (id)v17[2](v17);
  }
}

- (BOOL)becomeFirstResponder
{
  return [(UIResponder *)self->_localViewController becomeFirstResponder];
}

- (void)_firstResponderDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  BOOL v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:0x1ED160760];
  char v9 = [v8 BOOLValue];

  id v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  char v11 = [v10 handlingRemoteEvent];

  if (v6 && (v9 & 1) == 0 && (v11 & 1) == 0 && !self->_hasRequestedKeyboardEventEnvironmentDeferring)
  {
    id v12 = [v4 object];
    if (v12 == self->_hostedWindow)
    {
      self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
      objc_initWeak(&location, self);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __65___UIViewServiceViewControllerOperator__firstResponderDidChange___block_invoke;
      v17 = &unk_1E52DC308;
      objc_copyWeak(&v18, &location);
      double v13 = _Block_copy(&v14);
      objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidPromoteFirstResponderWithCompletionHandler:", v13, v14, v15, v16, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  char v9 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  hostedWindow = self->_hostedWindow;
  if (hostedWindow) {
    BOOL v6 = hostedWindow == v4;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = v6;
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidChangeKeyWindow:", v7);
  if (v7 == 1)
  {
    id v8 = +[_UIActiveViewServiceSessionTracker sharedTracker];
    -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v8, 3uLL, &self->_hostedWindow->super.super.super.super.isa, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);
  }
}

- (void)_wantsKeyboardEventsWithoutFirstResponder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"_UIRemoteKeyboardsHostedWindowUserInfoKey"];

  if (v6 && v6 == self->_hostedWindow && !self->_hasRequestedKeyboardEventEnvironmentDeferring)
  {
    self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
    objc_initWeak(&location, self);
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82___UIViewServiceViewControllerOperator__wantsKeyboardEventsWithoutFirstResponder___block_invoke;
    v8[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceWantsKeyboardEventsWithoutFirstResponderAndCompletionHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", &__prepareForDisconnectionWithCompletionHandler____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      BOOL v6 = NSString;
      uint64_t v7 = self;
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = [v6 stringWithFormat:@"<%@: %p>", v9, v7];
    }
    else
    {
      id v10 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Received request to prepare operator for disconnection: %{public}@", buf, 0xCu);
  }
  char v11 = [(_UIAsyncInvocation *)self->_prepareForDisconnectionInvocation invoke];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87___UIViewServiceViewControllerOperator___prepareForDisconnectionWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E52DA040;
  id v14 = v4;
  id v12 = v4;
  [v11 whenCompleteDo:v13];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_viewServiceIsDisplayingPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_displayedPopoverController, a3);
  id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  objc_msgSend(remoteViewControllerProxyToOperator, "__setViewServiceIsDisplayingPopover:", a3 != 0);
}

- (void)_popoverWillPresent:(id)a3
{
  id v11 = a3;
  id v4 = [v11 userInfo];
  double v5 = [v4 objectForKey:0x1ED10B2A0];

  if (self->_hostedWindow == v5)
  {
    uint64_t v6 = [v11 object];
    if (!v6
      || (uint64_t v7 = (void *)v6,
          [v11 object],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          id WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController),
          WeakRetained,
          v8,
          v7,
          v8 != WeakRetained))
    {
      id v10 = [v11 object];
      [(_UIViewServiceViewControllerOperator *)self _viewServiceIsDisplayingPopoverController:v10];
    }
  }
}

- (void)_popoverDidDismiss:(id)a3
{
  id v4 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayedPopoverController);

  if (v4 == WeakRetained)
  {
    [(_UIViewServiceViewControllerOperator *)self _viewServiceIsDisplayingPopoverController:0];
  }
}

- (void)__dimmingViewWasTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayedPopoverController);
  objc_super v2 = [WeakRetained _dimmingView];
  [v2 _simulateTap];
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  id v4 = a3;
  [(UIViewController *)&v5 _willBecomeContentViewControllerOfPopover:v4];
  -[UIViewController _willBecomeContentViewControllerOfPopover:](self->_localViewController, "_willBecomeContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);
}

- (void)_didBecomeContentViewControllerOfPopover:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  id v4 = a3;
  [(UIViewController *)&v5 _didBecomeContentViewControllerOfPopover:v4];
  -[UIViewController _didBecomeContentViewControllerOfPopover:](self->_localViewController, "_didBecomeContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);
}

- (void)_willResignContentViewControllerOfPopover:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  id v4 = a3;
  [(UIViewController *)&v5 _willResignContentViewControllerOfPopover:v4];
  -[UIViewController _willResignContentViewControllerOfPopover:](self->_localViewController, "_willResignContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  id v4 = a3;
  [(UIViewController *)&v5 _didResignContentViewControllerOfPopover:v4];
  -[UIViewController _didResignContentViewControllerOfPopover:](self->_localViewController, "_didResignContentViewControllerOfPopover:", v4, v5.receiver, v5.super_class);
}

- (CGSize)contentSizeForViewInPopover
{
  [(UIViewController *)self->_localViewController contentSizeForViewInPopover];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v10 = a3;
  [v10 preferredContentSize];
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  id v4 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1 includesRoot:1];
  [v4 preferredContentSizeDidChangeForChildContentContainer:self];

  objc_super v5 = (void *)MEMORY[0x18C108260]();
  uint64_t v6 = [(_UIViewServiceViewControllerOperator *)self _window];
  uint64_t v7 = [v6 _windowHostingScene];
  id v8 = [v7 _synchronizedDrawingFence];

  id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  [v10 preferredContentSize];
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServicePreferredContentSizeDidChange:fence:", v8);
  [v8 invalidate];
}

- (void)systemLayoutFittingSizeDidChangeForChildViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  objc_super v5 = v4;
  if (self->_localViewController == v4
    && [(UIViewController *)v4 _shouldForwardSystemLayoutFittingSizeChanges])
  {
    objc_initWeak(&location, self->_remoteViewControllerProxyToOperator);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __95___UIViewServiceViewControllerOperator_systemLayoutFittingSizeDidChangeForChildViewController___block_invoke;
    id v14 = &unk_1E52E6948;
    uint64_t v15 = v5;
    id v16 = self;
    objc_copyWeak(&v17, &location);
    uint64_t v6 = (void (**)(void))_Block_copy(&v11);
    if ([(UIViewController *)self->_localViewController _appearState]
       - 1 > 1)
    {
      deferredToViewDidAppear = self->_deferredToViewDidAppear;
      if (!deferredToViewDidAppear)
      {
        id v8 = [MEMORY[0x1E4F1CA48] array];
        id v9 = self->_deferredToViewDidAppear;
        self->_deferredToViewDidAppear = v8;

        deferredToViewDidAppear = self->_deferredToViewDidAppear;
      }
      id v10 = (void *)[v6 copy];
      [(NSMutableArray *)deferredToViewDidAppear addObject:v10];
    }
    else
    {
      v6[2](v6);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isModalInPresentation
{
  return [(UIViewController *)self->_localViewController isModalInPresentation];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___UIViewServiceViewControllerOperator_presentationControllerDidAttemptToDismiss___block_invoke;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    if (qword_1EB25B048 != -1) {
      dispatch_once(&qword_1EB25B048, block);
    }
    [(UIViewController *)self->_localViewController presentationControllerDidAttemptToDismiss:_MergedGlobals_61_0];
  }
}

- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_sheetClientConfiguration;
  uint64_t v7 = (_UISheetPresentationControllerClientConfiguration *)v5;
  uint64_t v12 = v7;
  if (v6 == v7)
  {

    id v10 = v12;
LABEL_9:

    id v9 = v12;
    goto LABEL_10;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(_UISheetPresentationControllerClientConfiguration *)v6 isEqual:v7];

  id v9 = v12;
  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_sheetClientConfiguration, a3);
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    id v10 = +[UIView _currentAnimationAttributes];
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceSheetPresentationClientConfigurationDidChange:attributes:", v12, v10);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_sheetGrabberDidTriggerPrimaryAction
{
}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
}

- (void)_sheetInteractionDraggingDidEnd
{
}

- (void)_addSceneForwardingLayersForOwners:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    id v5 = (void *)[v6 copy];
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceAddSceneForwardingLayersForOwners:", v5);
  }
}

- (void)_removeSceneForwardingLayersForOwners:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    id v5 = (void *)[v6 copy];
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceRemoveSceneForwardingLayersForOwners:", v5);
  }
}

- (void)dummyPopoverController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);

  if (WeakRetained == v9)
  {
    uint64_t v11 = (void *)MEMORY[0x18C108260]();
    uint64_t v12 = [(_UIViewServiceViewControllerOperator *)self _window];
    double v13 = [v12 _windowHostingScene];
    id v14 = [v13 _synchronizedDrawingFence];

    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93___UIViewServiceViewControllerOperator_dummyPopoverController_didChangeContentSize_animated___block_invoke;
    v16[3] = &unk_1E52F2248;
    v16[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServicePopoverDidChangeContentSize:animated:fence:withReplyHandler:", v5, v14, v16, width, height);
    [v14 invalidate];
  }
}

- (void)dummyPopoverController:(id)a3 popoverViewDidSetUseToolbarShine:(BOOL)a4
{
  BOOL v4 = a4;
  p_dummyPopoverController = &self->_dummyPopoverController;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dummyPopoverController);

  if (WeakRetained == v7)
  {
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    objc_msgSend(remoteViewControllerProxyToOperator, "__viewServicePopoverDidSetUseToolbarShine:", v4);
  }
}

- (id)invalidate
{
  return [(_UIAsyncInvocation *)self->_invalidationInvocation invoke];
}

+ (id)XPCInterface
{
  if (qword_1EB25B050 != -1) {
    dispatch_once(&qword_1EB25B050, &__block_literal_global_621);
  }
  double v2 = (void *)qword_1EB25B058;
  return v2;
}

- (void)__hostReadyToReceiveMessagesFromServiceViewController
{
}

- (void)__hostViewWillAppear:(BOOL)a3 inInterfaceOrientation:(int64_t)a4 traitCollection:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  BOOL v12 = a3;
  id v14 = (void (**)(void, double, double))a8;
  uint64_t v15 = _unobscuredTraitCollectionFromTraitCollection(a5);
  if ([(UIViewController *)self->_localViewController _appearState])
  {
    [(UIViewController *)self->_localViewController beginAppearanceTransition:1 animated:v12];
    v14[2](v14, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    BOOL v37 = v8;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B060);
    id v17 = *(id *)(CategoryCachedImpl + 8);
    os_signpost_id_t v18 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCOperatorViewWillAppear", "", buf, 2u);
      }
    }

    id v20 = self->_hostedWindow;
    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
    [v21 addObserver:self selector:sel__windowDidBecomeApplicationKey_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
    [v21 addObserver:self selector:sel__eventDispatcherDidCancelTouch_ name:@"_UIEventDispatcherDidCancelTouchForInsecureServicePresentation" object:v20];
    if (+[_UIRemoteKeyboards enabled]) {
      [v21 addObserver:self selector:sel__wantsKeyboardEventsWithoutFirstResponder_ name:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0];
    }
    uint64_t v22 = [(UIWindow *)v20 firstResponder];

    if (v22)
    {
      self->_hasRequestedKeyboardEventEnvironmentDeferring = 1;
      objc_initWeak((id *)buf, self);
      id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke;
      v45[3] = &unk_1E52DC308;
      objc_copyWeak(v46, (id *)buf);
      objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidPromoteFirstResponderWithCompletionHandler:", v45);
      objc_destroyWeak(v46);
      objc_destroyWeak((id *)buf);
    }
    [(_UIViewServiceViewControllerOperator *)self __setHostTraitCollection:v15 deferIfAnimated:0];
    if (a4)
    {
      *(void *)buf = 0;
      v42 = buf;
      uint64_t v43 = 0x2020000000;
      int64_t v44 = a4;
      id v24 = objc_alloc(MEMORY[0x1E4F4F6D8]);
      v25 = [(_UIViewServiceViewControllerOperator *)self _window];
      id v26 = objc_msgSend(v24, "initWithTargetOrientation:currentOrientation:", a4, objc_msgSend(v25, "interfaceOrientation"));

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_2;
      v40[3] = &unk_1E5301058;
      v40[4] = self;
      v40[5] = buf;
      v40[6] = a4;
      _UIApplicationPerformWithViewServiceFallbackOrientationResolver(v26, v40);
      [(_UIViewServiceViewControllerOperator *)self __hostDidChangeStatusBarOrientationToInterfaceOrientation:*((void *)v42 + 3)];
      [(_UIViewServiceViewControllerOperator *)self __hostDidChangeStatusBarHeight:a6];
      [(_UIViewServiceViewControllerOperator *)self __setHostViewUnderlapsStatusBar:v37];

      _Block_object_dispose(buf, 8);
    }
    [(UIViewController *)self->_localViewController beginAppearanceTransition:1 animated:v12];
    id v27 = [(UIViewController *)self->_localViewController view];
    uint64_t v28 = [(UIViewController *)self view];
    [v28 addSubview:v27];

    uint64_t v29 = [(UIViewController *)self view];
    [v29 bounds];
    objc_msgSend(v27, "setFrame:");

    [v27 setNeedsLayout];
    [v27 _setNeedsUpdateConstraints];
    [(_UIViewServiceViewControllerOperator *)self setNeedsStatusBarAppearanceUpdate];
    [(_UIViewServiceViewControllerOperator *)self setNeedsWhitePointAdaptivityStyleUpdate];
    [(_UIViewServiceViewControllerOperator *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    [(_UIViewServiceViewControllerOperator *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    [(_UIViewServiceViewControllerOperator *)self _setNeedsUserInterfaceAppearanceUpdate];
    [(_UIViewServiceViewControllerOperator *)self setNeedsUpdateOfPrefersPointerLocked];
    [(_UIViewServiceViewControllerOperator *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
    v30 = [(UIWindow *)v20 _registeredScrollToTopViews];
    uint64_t v31 = [v30 count];

    if (v31) {
      [(_UIViewServiceViewControllerOperator *)self _windowDidRegisterOrUnregisterScrollToTopView];
    }
    [v21 addObserver:self selector:sel__windowDidRegisterOrUnregisterScrollToTopView name:@"_UIHostedWindowDidRegisterScrollToTopViewNotification" object:v20];
    [v21 addObserver:self selector:sel__windowDidRegisterOrUnregisterScrollToTopView name:@"_UIHostedWindowDidUnregisterScrollToTopViewNotification" object:v20];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_3;
    v38[3] = &unk_1E52DB330;
    v38[4] = self;
    v39 = v14;
    +[UIWindow _synchronizeDrawingWithPreCommitHandler:v38];
    unint64_t v32 = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B068);
    v33 = *(id *)(v32 + 8);
    os_signpost_id_t v34 = os_signpost_id_make_with_pointer(*(os_log_t *)(v32 + 8), self);
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v35 = v34;
      if (os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v33, OS_SIGNPOST_INTERVAL_END, v35, "VCOperatorViewWillAppear", "", buf, 2u);
      }
    }
  }
  id v36 = [(UIViewController *)self view];
  [v36 setUserInteractionEnabled:1];
}

- (void)__hostViewWillMoveToWindowInInterfaceOrientation:(int64_t)a3 withStatusBarHeight:(double)a4 underlapsStatusBar:(BOOL)a5
{
  BOOL v5 = a5;
  [(_UIViewServiceViewControllerOperator *)self __hostDidChangeStatusBarOrientationToInterfaceOrientation:a3];
  [(_UIViewServiceViewControllerOperator *)self __hostDidChangeStatusBarHeight:a4];
  [(_UIViewServiceViewControllerOperator *)self __setHostViewUnderlapsStatusBar:v5];
}

- (void)__hostViewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(UIViewController *)self->_localViewController _appearState] == 1) {
    [(UIViewController *)self->_localViewController endAppearanceTransition];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_deferredToViewDidAppear;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_deferredToViewDidAppear removeAllObjects];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"_UIViewServiceHostViewDidAppearNotification" object:self->_localViewController userInfo:0];

  id v10 = +[_UIActiveViewServiceSessionTracker sharedTracker];
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v10, 2uLL, &self->_hostedWindow->super.super.super.super.isa, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);
}

- (void)__hostViewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSMutableArray *)self->_deferredToViewDidAppear removeAllObjects];
  uint64_t v5 = [(UIViewController *)self view];
  [v5 setUserInteractionEnabled:0];

  uint64_t v6 = [(UIWindow *)self->_hostedWindow windowScene];
  id v10 = [v6 keyboardSceneDelegate];

  uint64_t v7 = [v10 responder];

  if (v7)
  {
    [v10 _clearPersistingInputAccessoryView];
    [v10 _reloadInputViewsForResponder:0];
  }
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"_UIViewServiceHostViewWillDisappearNotification" object:self->_localViewController userInfo:0];

  [(UIViewController *)self->_localViewController beginAppearanceTransition:0 animated:v3];
  id v9 = +[_UIActiveViewServiceSessionTracker sharedTracker];
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v9, 2uLL, &self->_hostedWindow->super.super.super.super.isa, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);
}

- (void)__hostViewDidDisappear:(BOOL)a3
{
  if ([(UIViewController *)self->_localViewController _appearState] == 3)
  {
    uint64_t v7 = self->_hostedWindow;
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
    [v4 removeObserver:self name:@"_UIHostedWindowDidRegisterScrollToTopViewNotification" object:v7];
    [v4 removeObserver:self name:@"_UIHostedWindowDidUnregisterScrollToTopViewNotification" object:v7];
    if (+[_UIRemoteKeyboards enabled]) {
      [v4 removeObserver:self name:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0];
    }
    [v4 removeObserver:self name:@"_UIEventDispatcherDidCancelTouchForInsecureServicePresentation" object:v7];
    if ([(UIViewController *)self->_localViewController _shouldRemoveViewFromHierarchyOnDisappear])
    {
      uint64_t v5 = [(UIViewController *)self->_localViewController view];
      [v5 removeFromSuperview];
    }
    [(UIViewController *)self->_localViewController endAppearanceTransition];
    uint64_t v6 = [(UIWindow *)v7 _rootPresentationController];
    [v6 _resetRemoteDismissing];
  }
}

- (void)__hostDidAttachDisplay:(id)a3
{
  id v6 = a3;
  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v6, [(id)UIApp _hasCalledRunWithMainScene]);
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0 && (_UIApplicationIsExtension() & 1) == 0)
  {
    BOOL v3 = [v6 identity];
    BOOL v4 = +[UIScreen _screenWithFBSDisplayIdentity:v3];
    id v5 = +[UIWindowScene _placeholderWindowSceneForScreen:v4 create:1];
  }
}

- (void)__hostDidUpdateDisplay:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 identity];
  id v5 = +[UIScreen _screenWithFBSDisplayIdentity:v4];

  [v5 _updateDisplayConfiguration:v3];
}

- (void)__hostDidDetachDisplay:(id)a3
{
  id v3 = [a3 identity];
  +[UIScreen _FBSDisplayIdentityDisconnected:v3];
}

- (void)_eventDispatcherDidCancelTouch:(id)a3
{
}

- (void)__hostDidUpdateSceneContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIViewServiceViewControllerOperator *)self _window];
  id v6 = [v5 windowScene];
  uint64_t v7 = [v6 _screen];
  uint64_t v8 = [v7 displayIdentity];
  if (v4) {
    id v9 = (void *)*((void *)v4 + 4);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  char v11 = [v8 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v30 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        goto LABEL_17;
      }
      if (v4) {
        v41 = (void *)*((void *)v4 + 4);
      }
      else {
        v41 = 0;
      }
      id v32 = v41;
      *(_DWORD *)buf = 138412546;
      id v47 = v32;
      __int16 v48 = 2112;
      v49 = v8;
      _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "Received scene context for wrong screen, host sent context for %@ but service is on %@", buf, 0x16u);
    }
    else
    {
      uint64_t v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &__hostDidUpdateSceneContext____s_category) + 8);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v30 = v29;
      if (v4) {
        uint64_t v31 = (void *)*((void *)v4 + 4);
      }
      else {
        uint64_t v31 = 0;
      }
      id v32 = v31;
      *(_DWORD *)buf = 138412546;
      id v47 = v32;
      __int16 v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Received scene context for wrong screen, host sent context for %@ but service is on %@", buf, 0x16u);
    }

LABEL_17:
    goto LABEL_26;
  }
  long long v12 = self->_sceneContext;
  long long v13 = (_UIRemoteViewControllerSceneContext *)[v4 copy];
  sceneContext = self->_sceneContext;
  self->_sceneContext = v13;

  if (v4)
  {
    [v7 _setReferenceDisplayModeStatus:*((void *)v4 + 5)];
    BOOL v15 = *((unsigned char *)v4 + 9) != 0;
  }
  else
  {
    [v7 _setReferenceDisplayModeStatus:0];
    BOOL v15 = 0;
  }
  [v6 _setEnhancedWindowingEnabled:v15];
  int v16 = [v4 isCapturingContentForAdditionalRenderingDestination];
  if (v16 != [(_UIRemoteViewControllerSceneContext *)v12 isCapturingContentForAdditionalRenderingDestination])
  {
    id v17 = NSString;
    uint64_t v43 = v5;
    int64_t v44 = v7;
    os_signpost_id_t v18 = v8;
    hostBundleID = self->_hostBundleID;
    id v20 = self;
    uint64_t v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    uint64_t v23 = v22 = v12;
    id v24 = [v17 stringWithFormat:@"<%@: %p>", v23, v20];

    long long v12 = v22;
    v42 = hostBundleID;
    uint64_t v8 = v18;
    id v5 = v43;
    uint64_t v7 = v44;
    v25 = [v17 stringWithFormat:@"scene context value changed in view service via %@; %@", v42, v24];
    -[UIScreen _evaluateCapturedStateForReason:](v44, v25);
  }
  double systemReferenceAngleFromHost = self->_systemReferenceAngleFromHost;
  if (v4)
  {
    double v27 = *((double *)v4 + 6);
    BOOL v28 = systemReferenceAngleFromHost != v27 || self->_systemReferenceAngleModeFromHost != *((void *)v4 + 7);
    self->_double systemReferenceAngleFromHost = v27;
    unint64_t v33 = *((void *)v4 + 7);
  }
  else
  {
    BOOL v28 = systemReferenceAngleFromHost != 0.0 || self->_systemReferenceAngleModeFromHost != 0;
    unint64_t v33 = 0;
    self->_double systemReferenceAngleFromHost = 0.0;
  }
  self->_unint64_t systemReferenceAngleModeFromHost = v33;
  if (v5 && v28)
  {
    os_signpost_id_t v34 = +[_UISystemReferenceAngleMultiplexer sharedMultiplexer];
    double v35 = self->_systemReferenceAngleFromHost;
    unint64_t systemReferenceAngleModeFromHost = self->_systemReferenceAngleModeFromHost;
    v45 = v5;
    BOOL v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v34 systemReferenceAngleDidChange:systemReferenceAngleModeFromHost mode:v37 forWindows:v35];
  }
  v38 = [v6 keyboardSceneDelegate];
  if (v4) {
    v39 = (void *)*((void *)v4 + 8);
  }
  else {
    v39 = 0;
  }
  id v40 = v39;
  [v38 setHardwareKeyboardExclusivityIdentifier:v40];

LABEL_26:
}

- (void)__hostDidMoveToParentSceneWithSettings:(id)a3
{
  id v4 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  id v5 = [MEMORY[0x1E4F62AE0] diffFromSettings:0 toSettings:v4];
  pseudoScene = self->_pseudoScene;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___UIViewServiceViewControllerOperator___hostDidMoveToParentSceneWithSettings___block_invoke;
  v8[3] = &unk_1E530DD18;
  id v9 = v5;
  id v7 = v5;
  [(FBSScene *)pseudoScene updateSettings:v8];
}

- (void)__hostSceneDidUpdateWithDiff:(id)a3
{
  id v4 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  pseudoScene = self->_pseudoScene;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69___UIViewServiceViewControllerOperator___hostSceneDidUpdateWithDiff___block_invoke;
  v7[3] = &unk_1E530DD18;
  id v8 = v4;
  id v6 = v4;
  [(FBSScene *)pseudoScene updateSettings:v7];
}

- (void)__hostViewDidMoveToScreenWithFBSDisplayIdentity:(id)a3 newHostingHandleReplyHandler:(id)a4
{
  v51 = self->_hostedWindow;
  uint64_t v50 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v8 = [(UIWindow *)v51 _windowHostingScene];
  id v9 = [v8 _screen];

  id v10 = +[UIScreen _screenWithFBSDisplayIdentity:v7];

  if (v10) {
    BOOL v11 = v9 == v10;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    BOOL v12 = 0;
  }
  else
  {
    -[_UIViewServiceSessionActivityRecord invalidate]((uint64_t)self->_sessionActivityRecord);
    physicalButtonInteractionArbiterObserverToken = self->_physicalButtonInteractionArbiterObserverToken;
    if (physicalButtonInteractionArbiterObserverToken)
    {
      [(BSInvalidatable *)self->_physicalButtonInteractionArbiterObserverToken invalidate];
      long long v14 = self->_physicalButtonInteractionArbiterObserverToken;
      self->_physicalButtonInteractionArbiterObserverToken = 0;
    }
    stopStealingStatusBar(self->_hostedWindow);
    self->_hostStatusBarOrientation = 0;
    self->_hostStatusBarHeight = 0.0;
    BOOL v15 = [(UIWindow *)v51 windowScene];
    -[UIWindowScene _keyWindow](v15);
    int v16 = (_UIHostedWindow *)objc_claimAutoreleasedReturnValue();

    id v17 = +[UIWindowScene _unassociatedWindowSceneForScreen:v10 create:1];
    [(UIWindow *)v51 setWindowScene:v17];
    os_signpost_id_t v18 = [v17 screen];
    +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, self, [v18 _userInterfaceIdiom]);
    os_signpost_id_t v19 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
    sessionActivityRecord = self->_sessionActivityRecord;
    self->_sessionActivityRecord = v19;

    if (physicalButtonInteractionArbiterObserverToken)
    {
      uint64_t v21 = [v17 _physicalButtonInteractionArbiter];
      -[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:](v21, self);
      uint64_t v22 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = self->_physicalButtonInteractionArbiterObserverToken;
      self->_physicalButtonInteractionArbiterObserverToken = v22;
    }
    if (v51 == v16)
    {
      id v24 = -[UIWindowScene _keyWindow]((id *)v17);
      BOOL v12 = v24 == 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  v25 = [(UIWindow *)v51 windowScene];
  if (v25)
  {
    id v26 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v25];
    char v27 = [v26 useHostedInstance];

    if ((v27 & 1) == 0)
    {
      BOOL v28 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v25];
      [v28 setUseHostedInstance:1];

      uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 postNotificationName:@"UITextEffectsWindowIsHostedNotification" object:0];
    }
  }
  if (v12) {
    -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v51, 0, 1);
  }
  if ([(_UIRemoteViewControllerSceneContext *)self->_sceneContext isCapturingContentForAdditionalRenderingDestination])
  {
    __int16 v48 = NSString;
    id v30 = v9;
    if (v30)
    {
      uint64_t v31 = NSString;
      id v32 = (objc_class *)objc_opt_class();
      unint64_t v33 = NSStringFromClass(v32);
      os_signpost_id_t v34 = [v31 stringWithFormat:@"<%@: %p>", v33, v30];
    }
    else
    {
      os_signpost_id_t v34 = @"(nil)";
    }

    id v35 = v10;
    v49 = v9;
    if (v35)
    {
      id v36 = NSString;
      BOOL v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      v39 = [v36 stringWithFormat:@"<%@: %p>", v38, v35];
    }
    else
    {
      v39 = @"(nil)";
    }

    hostBundleID = self->_hostBundleID;
    v41 = NSString;
    v42 = self;
    uint64_t v43 = (objc_class *)objc_opt_class();
    int64_t v44 = NSStringFromClass(v43);
    v45 = [v41 stringWithFormat:@"<%@: %p>", v44, v42];

    objc_msgSend(v48, "stringWithFormat:", @"view service moved from %@ to %@ via %@; %@",
      v34,
      v39,
      hostBundleID,
    v46 = v45);

    -[UIScreen _evaluateCapturedStateForReason:](v30, v46);
    -[UIScreen _evaluateCapturedStateForReason:](v35, v46);

    id v9 = v49;
  }
  id v47 = [(_UIHostedWindow *)v51 hostingHandle];
  v50[2](v50, v47);
}

- (void)__setServiceInPopover:(BOOL)a3
{
  BOOL v3 = a3;
  p_dummyPopoverController = &self->_dummyPopoverController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);
  id v6 = self->_hostedWindow;
  self->_serviceInPopover = v3;
  int v7 = !v3;
  if (v3 && !WeakRetained)
  {
    id v8 = [(UIPopoverController *)[_UIViewServiceDummyPopoverController alloc] initWithContentViewController:self];
    objc_storeWeak((id *)p_dummyPopoverController, v8);
    -[UIPopoverController setPopoverLayoutMargins:](v8, "setPopoverLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    [(UIPopoverController *)v8 setPopoverBackgroundViewClass:objc_opt_class()];
    [(_UIViewServiceDummyPopoverController *)v8 setDummyPopoverControllerDelegate:self];
    -[UIPopoverController setPopoverLayoutMargins:](v8, "setPopoverLayoutMargins:", 0.0, 0.0, -1000.0, 0.0);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v8, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v6, 4, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_8:

    goto LABEL_9;
  }
  if (!WeakRetained) {
    int v7 = 0;
  }
  if (v7 == 1)
  {
    [WeakRetained dismissPopoverAnimated:0];
    objc_storeWeak((id *)p_dummyPopoverController, 0);
    id v8 = [(UIViewController *)self view];
    [(UIView *)v6 addSubview:v8];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)__setSheetConfiguration:(id)a3
{
  int v7 = self->_hostedWindow;
  id v5 = a3;
  id v6 = [(UIWindow *)v7 _rootPresentationController];
  [v6 _setConfiguration:v5];

  if ([(UIViewController *)self->_localViewController _shouldForceLayoutForHostedAnimation]&& +[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    [(UIView *)v7 layoutIfNeeded];
  }
}

- (void)__sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
  id v4 = [(UIWindow *)self->_hostedWindow _rootPresentationController];
  [v4 _hostSheetInteractionDraggingDidBeginWithRubberBandCoefficient:a3];
}

- (void)__sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  id v10 = [(UIWindow *)self->_hostedWindow _rootPresentationController];
  objc_msgSend(v10, "_hostSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:", v5, v9, v8, x, y);
}

- (void)__sheetInteractionDraggingDidEnd
{
  id v2 = [(UIWindow *)self->_hostedWindow _rootPresentationController];
  [v2 _hostSheetInteractionDraggingDidEnd];
}

- (void)__installDismissInteractionForZoomTransition
{
  id v4 = (id)objc_opt_new();
  [v4 setDelegate:self];
  [v4 setStyles:6];
  BOOL v3 = [(UIViewController *)self->_localViewController view];
  [v3 addInteraction:v4];
}

- (double)hysteresisForInteraction:(id)a3
{
  return 10.0;
}

- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7
{
  return a7;
}

- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5
{
}

- (id)trackingViewForInteraction:(id)a3
{
  return [(UIViewController *)self->_localViewController view];
}

- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4
{
}

- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4
{
}

- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5
{
}

- (void)__hostDidEnterBackground
{
  if (self->_remoteViewControllerProxyToOperator)
  {
    stopStealingStatusBar(self->_hostedWindow);
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_UIViewServiceHostDidEnterBackgroundNotification" object:self->_localViewController userInfo:0];

    localViewController = self->_localViewController;
    [(UIViewController *)localViewController _hostApplicationDidEnterBackground];
  }
}

- (void)__hostWillEnterForeground
{
  if (self->_remoteViewControllerProxyToOperator)
  {
    stealStatusBar(self->_hostStatusBarOrientation, 0, self->_hostedWindow, 1);
    beginInheritingCoreMediaApplicationState(self->_mediaPID);
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_UIViewServiceHostWillEnterForegroundNotification" object:self->_localViewController userInfo:0];

    localViewController = self->_localViewController;
    [(UIViewController *)localViewController _hostApplicationWillEnterForeground];
  }
}

- (void)__hostSceneWillEnterForeground
{
  if (self->_remoteViewControllerProxyToOperator)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_UIViewServiceHostSceneWillEnterForegroundNotification" object:self->_localViewController userInfo:0];
  }
}

- (void)__hostDidEvaluatePencilBarrelEventFocusForSceneTransition
{
  if (self->_remoteViewControllerProxyToOperator)
  {
    hostedWindow = self->_hostedWindow;
    if (hostedWindow)
    {
      _UIPencilEventRequestBarrelFocusIfAbleForWindow(hostedWindow, 0);
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition" object:self->_localViewController userInfo:0];
    }
  }
}

- (void)__hostDidPresentShieldViewForAppProtection
{
  self->_appProtectionShieldPresentedInHost = 1;
  [(UIView *)self->_hostedWindow setUserInteractionEnabled:0];
}

- (void)__hostDidDismissShieldViewForAppProtection
{
  self->_appProtectionShieldPresentedInHost = 0;
  [(UIView *)self->_hostedWindow setUserInteractionEnabled:1];
  hostedWindow = self->_hostedWindow;
  [(UIWindow *)hostedWindow _restoreFirstResponder];
}

- (void)__hostSceneDidEnterBackground
{
  if (self->_remoteViewControllerProxyToOperator)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_UIViewServiceHostSceneDidEnterBackgroundNotification" object:self->_localViewController userInfo:0];
  }
}

- (void)__hostWillResignActive
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIViewServiceHostWillResignActiveNotification" object:self->_localViewController userInfo:0];
}

- (void)__hostDidBecomeActive
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIViewServiceHostDidBecomeActiveNotification" object:self->_localViewController userInfo:0];
}

- (void)__hostDidChangeStatusBarOrientationToInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3)
  {
    if (self->_remoteViewControllerProxyToOperator)
    {
      +[UIKeyboardSceneDelegate setInterfaceOrientation:](UIKeyboardSceneDelegate, "setInterfaceOrientation:");
      if (self->_hostStatusBarOrientation != a3)
      {
        self->_int64_t hostStatusBarOrientation = a3;
        stealStatusBar(a3, 0, self->_hostedWindow, self->_hostedWindow != 0);
        [(UIViewController *)self setInterfaceOrientation:a3];
        hostedWindow = self->_hostedWindow;
        int64_t hostStatusBarOrientation = self->_hostStatusBarOrientation;
        [(UIWindow *)hostedWindow _setWindowInterfaceOrientation:hostStatusBarOrientation];
      }
    }
  }
}

- (void)__hostDidChangeStatusBarHeight:(double)a3
{
  if (a3 >= 0.0 && self->_hostStatusBarHeight != a3)
  {
    self->_hostStatusBarHeight = a3;
    id v4 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    +[UIView _currentAnimationDuration];
    -[UIStatusBarAnimationParameters setDuration:](v4, "setDuration:");
    stealStatusBar(self->_hostStatusBarOrientation, v4, self->_hostedWindow, self->_hostedWindow != 0);
  }
}

- (id)_viewControllersForRotationCallbacks
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(UIWindow *)self->_hostedWindow _rotationViewControllers];
  BOOL v5 = [v3 setWithArray:v4];
  v12.receiver = self;
  v12.super_class = (Class)_UIViewServiceViewControllerOperator;
  id v6 = [(UIViewController *)&v12 _viewControllersForRotationCallbacks];
  int v7 = [v5 setByAddingObjectsFromArray:v6];

  double v8 = (void *)MEMORY[0x1E4F1CA48];
  double v9 = [v7 allObjects];
  id v10 = [v8 arrayWithArray:v9];

  return v10;
}

- (BOOL)_shouldForwardLegacyRotationOnly
{
  id v2 = objc_opt_class();
  if (dyld_program_sdk_at_least())
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [v2 doesOverrideViewControllerMethod:sel_viewWillTransitionToSize_withTransitionCoordinator_];
    if (v3)
    {
      if (([v2 doesOverrideViewControllerMethod:sel_willRotateToInterfaceOrientation_duration_] & 1) != 0
        || ([v2 doesOverrideViewControllerMethod:sel_willAnimateRotationToInterfaceOrientation_duration_] & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = [v2 doesOverrideViewControllerMethod:sel_didRotateFromInterfaceOrientation_];
      }
    }
  }
  return v3;
}

- (void)__hostViewWillTransitionToSize:(CGSize)a3 withContextDescription:(id)a4 boundingPath:(id)a5 statusBarHeight:(double)a6 underlapsStatusBar:(BOOL)a7 fence:(id)a8 timing:(_UIUpdateTiming *)a9 whenDone:(id)a10
{
  BOOL v13 = a7;
  CGFloat height = a3.height;
  double width = a3.width;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  id v22 = a10;
  if (v21)
  {
    +[UIScene _synchronizeDrawingWithFence:v21];
    if (_UIUpdateCycleEnabled()) {
      *(void *)&double v23 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, (uint64_t)a9, &v102).n128_u64[0];
    }
  }
  uint64_t v24 = objc_msgSend(v19, "toOrientation", v23);
  uint64_t v25 = [v19 fromOrientation];
  [v19 transitionDuration];
  double v27 = v26;
  BOOL v28 = self;
  double v29 = *MEMORY[0x1E4F1DAD8];
  double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v31 = [(UIViewController *)v28 view];
  id v32 = [v31 window];
  [v32 bounds];
  double v34 = v33;
  double v36 = v35;

  v132.origin.double x = v29;
  v132.origin.double y = v30;
  v132.size.double width = width;
  v132.size.CGFloat height = height;
  v133.origin.double x = v29;
  v133.origin.double y = v30;
  v133.size.double width = v34;
  v133.size.CGFloat height = v36;
  BOOL v74 = CGRectEqualToRect(v132, v133);
  if (v24 == v25)
  {
    id v47 = v28->_hostedWindow;
    if (v47)
    {
      __int16 v48 = v47;
      BOOL v68 = v13;
      BOOL v69 = v24 != v25;
      double v70 = height;
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_6;
      v112[3] = &unk_1E530DE18;
      v112[4] = v28;
      v49 = (uint64_t (**)(void))_Block_copy(v112);
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_8;
      v109[3] = &unk_1E52DCA58;
      v109[4] = v28;
      id v111 = v22;
      int64_t v44 = v48;
      v110 = v44;
      uint64_t v50 = _Block_copy(v109);

      if (v74)
      {
        id v51 = (id)v49[2](v49);
        id v73 = v50;
        (*((void (**)(void *))v50 + 2))(v50);
        v52 = &__block_literal_global_577_0;
LABEL_18:

        goto LABEL_19;
      }
      v66 = v22;
      v67 = (void (**)(void))v49;
      v72 = v20;
      id v64 = v21;
      v65 = &__block_literal_global_577_0;
      v46 = v50;
LABEL_12:
      v53 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      objc_storeStrong((id *)&v28->_viewControllerTransitioningContext, v53);
      [(_UIViewControllerOneToOneTransitionContext *)v53 _setFromViewController:v28];
      [(_UIViewControllerOneToOneTransitionContext *)v53 _setToViewController:0];
      [(_UIViewControllerTransitionContext *)v53 _setContainerView:v44];
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v53, "_setFromStartFrame:", v29, v30, v34, v36);
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v53, "_setToEndFrame:", v29, v30, width, v70);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v53, "_setToStartFrame:", v29, v30, v34, v36);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v53, "_setFromEndFrame:", v29, v30, width, v70);
      [(_UIViewControllerTransitionContext *)v53 _setRotating:v24 != v25];
      v54 = +[_UIWindowAnimationController animationControllerWithWindow:v44];
      [(_UIViewControllerTransitionContext *)v53 _setIsAnimated:v27 > 0.0];
      [(_UIViewControllerTransitionContext *)v53 _setAnimator:v54];
      -[_UIViewControllerTransitionContext _setCompletionCurve:](v53, "_setCompletionCurve:", [v19 completionCurve]);
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_9;
      v107[3] = &unk_1E530DE40;
      v107[4] = v28;
      id v73 = v46;
      id v108 = v73;
      [(_UIViewControllerTransitionContext *)v53 _setDidCompleteHandler:v107];
      [(_UIViewControllerTransitionContext *)v53 _setDuration:v27];
      BOOL v55 = [(_UIViewServiceViewControllerOperator *)v28 _shouldForwardLegacyRotationOnly];
      v102.n128_u64[0] = 0;
      v102.n128_u64[1] = (unint64_t)&v102;
      uint64_t v103 = 0x3032000000;
      v104 = __Block_byref_object_copy__228;
      v105 = __Block_byref_object_dispose__228;
      id v106 = 0;
      v71 = v54;
      [v54 setDuration:v27];
      BOOL v56 = !v74;
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_579;
      v91[3] = &unk_1E530DE68;
      BOOL v100 = v69;
      int64_t v44 = v44;
      uint64_t v97 = v24;
      BOOL v101 = !v74;
      v92 = v44;
      v93 = v28;
      double v98 = width;
      double v99 = v70;
      id v57 = v72;
      id v94 = v57;
      id v75 = v65;
      id v95 = v75;
      v96 = &v102;
      [v71 setTransitionActions:v91];
      [(_UIViewServiceViewControllerOperator *)v28 __setHostViewUnderlapsStatusBar:v68];
      if (v55)
      {
        [(_UIViewServiceViewControllerOperator *)v28 __hostWillRotateToInterfaceOrientation:v24 duration:0 skipSelf:v27];
        v58 = [(_UIViewControllerTransitionContext *)v53 _transitionCoordinator];
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2_580;
        v82[3] = &unk_1E530DE90;
        BOOL v90 = v56;
        v82[4] = v28;
        double v84 = v29;
        double v85 = v30;
        double v86 = width;
        double v87 = v70;
        id v83 = v57;
        uint64_t v88 = v24;
        double v89 = v27;
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3_582;
        v78[3] = &unk_1E530DEB8;
        v78[4] = v28;
        uint64_t v81 = v25;
        id v80 = v66;
        v79 = v44;
        [v58 animateAlongsideTransition:v82 completion:v78];
      }
      else
      {
        uint64_t v59 = v67[2]();
        v60 = *(void **)(v102.n128_u64[1] + 40);
        *(void *)(v102.n128_u64[1] + 40) = v59;

        if (v24 == v25)
        {
          v61 = [(_UIViewControllerTransitionContext *)v53 _transitionCoordinator];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4_583;
          v76[3] = &unk_1E52DA598;
          v77 = v44;
          [v61 animateAlongsideTransition:v76 completion:0];
        }
        v62 = [(_UIViewControllerTransitionContext *)v53 _transitionCoordinator];
        -[UIViewController _window:viewWillTransitionToSize:withTransitionCoordinator:](v28, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v44, v62, width, v70);
      }
      v63 = [(_UIViewControllerTransitionContext *)v53 _animator];
      [v63 animateTransition:v53];

      _Block_object_dispose(&v102, 8);
      id v20 = v72;
      id v21 = v64;
      id v22 = v66;
      v49 = (uint64_t (**)(void))v67;
      v52 = v75;
      goto LABEL_18;
    }
  }
  else if ((unint64_t)(v24 - 1) <= 3)
  {
    BOOL v37 = v28->_hostedWindow;
    if (v37)
    {
      v38 = v37;
      BOOL v68 = v13;
      BOOL v69 = v24 != v25;
      double v70 = height;
      id v64 = v21;
      v72 = v20;
      v39 = (void *)[(NSMutableArray *)v28->_deputyRotationDelegates copy];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke;
      aBlock[3] = &unk_1E530DD78;
      void aBlock[4] = v28;
      uint64_t v130 = v24;
      id v40 = v39;
      id v128 = v40;
      double v131 = v27;
      v41 = v38;
      v129 = v41;
      v67 = (void (**)(void))_Block_copy(aBlock);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2;
      v120[3] = &unk_1E530DDC8;
      id v42 = v40;
      double v124 = v27;
      uint64_t v125 = v24;
      id v121 = v42;
      v122 = v28;
      double v126 = a6;
      uint64_t v43 = v41;
      v123 = v43;
      v65 = _Block_copy(v120);
      v113[0] = MEMORY[0x1E4F143A8];
      v113[1] = 3221225472;
      v113[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_5;
      v113[3] = &unk_1E530DDF0;
      id v114 = v42;
      uint64_t v118 = v25;
      int64_t v44 = v43;
      uint64_t v119 = v24;
      v115 = v44;
      v116 = v28;
      v66 = v22;
      id v117 = v22;
      id v45 = v42;
      v46 = _Block_copy(v113);
      [(UIWindow *)v44 _setToWindowOrientation:v24];
      [(UIWindow *)v44 _setFromWindowOrientation:v25];

      goto LABEL_12;
    }
  }
LABEL_19:
}

- (void)__hostWillRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v9 = [(_UIViewServiceViewControllerOperator *)self _viewControllersForRotationCallbacks];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((void *)&v29 + 1) + 8 * i);
        if (localViewController == self)
        {
          if (!v5) {
            [(UIViewController *)self willRotateToInterfaceOrientation:a3 duration:a4];
          }
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        [(UIViewController *)localViewController _willRotateToInterfaceOrientation:a3 duration:[(UIViewController *)localViewController _forwardRotationMethods] forwardToChildControllers:v5 skipSelf:a4];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)self, a3);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v15 = self->_deputyRotationDelegates;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * j) willRotateToInterfaceOrientation:a3 duration:a4];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  hostedWindow = self->_hostedWindow;
  id v22 = (void *)MEMORY[0x1E4F1C9E8];
  double v23 = [NSNumber numberWithInt:a3];
  uint64_t v24 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, @"UIWindowNewOrientationUserInfoKey", 0, (void)v25);
  [v20 postNotificationName:@"UIWindowWillRotateNotification" object:hostedWindow userInfo:v24];
}

- (void)__hostWillAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 skipSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v9 = [(_UIViewServiceViewControllerOperator *)self _viewControllersForRotationCallbacks];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v15 = [(UIViewController *)localViewController view];
        uint64_t v16 = [v15 layer];
        [v16 layoutBelowIfNeeded];

        if (localViewController == self)
        {
          if (!v5) {
            [(UIViewController *)self willAnimateRotationToInterfaceOrientation:a3 duration:a4];
          }
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        [(UIViewController *)localViewController _willAnimateRotationToInterfaceOrientation:a3 duration:[(UIViewController *)localViewController _forwardRotationMethods] forwardToChildControllers:v5 skipSelf:a4];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  BOOL v17 = [(NSMutableArray *)self->_deputyRotationDelegates count] != 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke;
  v19[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  *(double *)&v19[4] = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke_2;
  v18[3] = &unk_1E52DD178;
  v18[4] = self;
  v18[5] = a3;
  *(double *)&v18[6] = a4;
  +[UIView conditionallyAnimate:v17 withAnimation:v19 layout:v18 completion:0];
}

- (void)__hostDidRotateFromInterfaceOrientation:(int64_t)a3 skipSelf:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v7 = [(_UIViewServiceViewControllerOperator *)self _viewControllersForRotationCallbacks];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        localViewController = *(_UIViewServiceViewControllerOperator **)(*((void *)&v27 + 1) + 8 * i);
        if (localViewController == self)
        {
          if (!v4) {
            [(UIViewController *)self didRotateFromInterfaceOrientation:a3];
          }
          localViewController = (_UIViewServiceViewControllerOperator *)self->_localViewController;
        }
        [(UIViewController *)localViewController _didRotateFromInterfaceOrientation:a3 forwardToChildControllers:[(UIViewController *)localViewController _forwardRotationMethods] skipSelf:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v13 = self->_deputyRotationDelegates;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * j) finishRotationFromInterfaceOrientation:a3];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  hostedWindow = self->_hostedWindow;
  long long v20 = (void *)MEMORY[0x1E4F1C9E8];
  long long v21 = [NSNumber numberWithInt:a3];
  long long v22 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, @"UIWindowOldOrientationUserInfoKey", 0, (void)v23);
  [v18 postNotificationName:@"UIWindowDidRotateNotification" object:hostedWindow userInfo:v22];
}

- (id)_supportedInterfaceOrientationsForViewController:(id)a3
{
  uint64_t v4 = [a3 supportedInterfaceOrientations];
  self->_supportedOrientations = v4;
  return _supportedInterfaceOrientationsForMask(v4);
}

- (void)__createViewControllerWithOptions:(id)a3 completionBlock:(id)a4
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [v6 viewControllerClassName];
  uint64_t v10 = [v6 contextToken];
  int v189 = [WeakRetained requiresExtensionContextForViewControllerOperator:self];
  int v187 = [WeakRetained isExtensionServiceViewControllerOperator:self];
  uint64_t v11 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B070) + 8);
  v191 = self;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      uint64_t v12 = NSString;
      BOOL v13 = self;
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v16 = uint64_t v15 = v10;
      BOOL v17 = [v12 stringWithFormat:@"<%@: %p>", v16, v13];

      self = v191;
      uint64_t v10 = v15;
    }
    else
    {
      BOOL v17 = @"(nil)";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v218 = (uint64_t)v17;
    __int16 v219 = 2114;
    v220 = v9;
    __int16 v221 = 2114;
    v222 = v10;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Received request to create view controller: self: %{public}@; class: %{public}@; contextToken: %{public}@",
      buf,
      0x20u);
  }
  uint64_t v18 = [v6 displayConfigurations];
  id v19 = [v6 traitCollection];
  long long v20 = _unobscuredTraitCollectionFromTraitCollection(v19);

  uint64_t v21 = [v6 initialInterfaceOrientation];
  long long v22 = [v6 hostAccessibilityServerPort];
  uint64_t v23 = [v6 availableTextServices];
  if (!self->_localViewController)
  {
    uint64_t v170 = v21;
    int64_t v167 = v23;
    v178 = (void (**)(void, void, void))v7;
    v179 = v22;
    v185 = v18;
    v186 = v10;
    id v181 = v6;
    v184 = WeakRetained;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B080);
    long long v27 = *(id *)(CategoryCachedImpl + 8);
    os_signpost_id_t v28 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v29 = v28;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VCOperatorCreateViewController", "", buf, 2u);
      }
    }

    v172 = v20;
    id v177 = v20;
    v169 = (void *)_UISetCurrentFallbackEnvironment(v177);
    self->_editAlertToken = 0;
    [(id)UIApp _forceEndIgnoringInteractionEvents];
    long long v199 = 0u;
    long long v200 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    id v30 = v185;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v197 objects:v216 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v198;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v198 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v197 + 1) + 8 * i);
          if (_UIApplicationIsExtension()) {
            uint64_t v36 = 0;
          }
          else {
            uint64_t v36 = [(id)UIApp _hasCalledRunWithMainScene] ^ 1;
          }
          +[UIScreen _FBSDisplayConfigurationConnected:v35 andNotify:v36];
          if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0
            && (_UIApplicationIsExtension() & 1) == 0)
          {
            BOOL v37 = [v35 identity];
            v38 = +[UIScreen _screenWithFBSDisplayIdentity:v37];
            id v39 = +[UIWindowScene _placeholderWindowSceneForScreen:v38 create:1];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v197 objects:v216 count:16];
      }
      while (v32);
    }

    uint64_t v40 = [v30 copy];
    pluginDisplayConfigurations = v191->_pluginDisplayConfigurations;
    v191->_pluginDisplayConfigurations = (NSArray *)v40;

    id v42 = [(id)UIApp delegate];
    char v43 = objc_opt_respondsToSelector();

    if (v43)
    {
      int64_t v44 = [(id)UIApp delegate];
      [v44 _application:UIApp didReceiveViewServiceRequestForViewControllerClassName:v9];
    }
    uint64_t v10 = v186;
    int v45 = v189;
    if (!v186) {
      int v45 = 0;
    }
    id v7 = v178;
    if (v45 == 1)
    {
      v175 = [MEMORY[0x1E4F292B0] _sharedExtensionContextVendor];
      uint64_t v46 = [v175 _extensionContextForUUID:v186];
      if (!v46)
      {
        BOOL v68 = [NSString stringWithFormat:@"Unable to find extensionContext for contextToken: %@. This is indicative of a host issue, where it may have crashed or invalidated the connection before the view service request completed.", v186];
        BOOL v69 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v70 = *MEMORY[0x1E4F281F8];
        v214 = @"Unable to find NSExtensionContext";
        v215 = v68;
        v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
        v72 = [v69 errorWithDomain:v70 code:967225 userInfo:v71];

        id v73 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B088) + 8);
        id v6 = v181;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v218 = (uint64_t)v72;
          _os_log_impl(&dword_1853B0000, v73, OS_LOG_TYPE_ERROR, "Rejecting view controller creation request due to missing context for token: %{public}@", buf, 0xCu);
        }
        ((void (**)(void, void, void *))v178)[2](v178, 0, v72);

        id v47 = 0;
        uint64_t v10 = v186;
LABEL_35:
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          __int16 v48 = [(_UIViewServiceViewControllerOperator *)v191 delegate];
          uint64_t v182 = [v48 viewControllerClassNameForViewControllerOperator:v191];

          v49 = [(_UIViewServiceViewControllerOperator *)v191 delegate];
          uint64_t v50 = [v49 containingViewControllerClassNameForViewControllerOperator:v191];

          id v51 = [(_UIViewServiceViewControllerOperator *)v191 delegate];
          uint64_t v52 = [v51 mainStoryboardNameForViewControllerOperator:v191];

          uint64_t v53 = v52;
          uint64_t v54 = v182;
        }
        else
        {
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v54 = 0;
        }
        v180 = (NSString *)v50;
        v183 = (void *)v54;
        v176 = v47;
        v173 = (void *)v53;
        if (v47 || ((v187 ^ 1 | v189) & 1) == 0)
        {
          BOOL v55 = v53 == 0;
          if (v55 == (v54 == 0))
          {
            if (v53 | v54) {
              v62 = @"Either NSExtensionMainStoryboard or NSExtensionPrincipalClass must be specified in the extension's Info.plist file but not both.";
            }
            else {
              v62 = @"Either NSExtensionMainStoryboard or NSExtensionPrincipalClass must be specified in the extension's Info.plist";
            }
            v63 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v64 = *MEMORY[0x1E4F281F8];
            v212 = @"Invalid Configuration";
            v213 = v62;
            v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
            uint64_t v66 = [v63 errorWithDomain:v64 code:967223 userInfo:v65];

            v67 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B090) + 8);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v218 = v66;
              _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_ERROR, "Rejecting view controller creation request due to invalid extension storyboard or principal class: %{public}@", buf, 0xCu);
            }
            v178[2](v178, 0, v66);
            goto LABEL_90;
          }
          if (v53)
          {
            uint64_t v56 = v53;
            id v57 = [MEMORY[0x1E4F28B50] mainBundle];
            v58 = +[UIStoryboard storyboardWithName:v56 bundle:v57];

            uint64_t v59 = [v58 instantiateInitialViewController];
            localViewController = v191->_localViewController;
            v191->_localViewController = (UIViewController *)v59;

            id v61 = 0;
            uint64_t v9 = v58;
            id v47 = v176;
          }
          else
          {
            id v61 = (id)v54;
          }

          uint64_t v9 = v61;
        }
        else
        {
          BOOL v55 = 1;
        }
        [(_UIViewServiceViewControllerOperator *)v191 __hostDidChangeStatusBarOrientationToInterfaceOrientation:v170];
        BOOL v74 = [(id)UIApp _findUISceneForLegacyInterfaceOrientation];
        if (!v74 && v170 == 1)
        {
          id v75 = +[UIScreen mainScreen];
          uint64_t v76 = [v75 _interfaceOrientation];

          if (v76 == 1) {
            goto LABEL_62;
          }
          BOOL v74 = +[UIScreen mainScreen];
          [v74 _setInterfaceOrientation:1];
        }

LABEL_62:
        if (!v55) {
          goto LABEL_75;
        }
        if (!v183)
        {
          v77 = [MEMORY[0x1E4F28B50] mainBundle];
          v78 = [v77 objectForInfoDictionaryKey:@"UIViewServicePermittedViewControllerClasses"];

          objc_opt_class();
          v190 = v78;
          if (objc_opt_isKindOfClass())
          {
            if (([(UIViewController *)v78 containsObject:v9] & 1) == 0)
            {
              v79 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B098) + 8);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                id v80 = (void *)MEMORY[0x1E4F28B50];
                uint64_t v81 = v79;
                v82 = [v80 mainBundle];
                id v83 = [v82 bundleIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v218 = (uint64_t)v9;
                __int16 v219 = 2112;
                v220 = v83;
                _os_log_impl(&dword_1853B0000, v81, OS_LOG_TYPE_ERROR, "Refusing request for view controller of class \"%@\" not included in \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist", buf, 0x16u);
              }
              double v84 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v85 = *MEMORY[0x1E4F281F8];
              v210 = @"Class Not Permitted";
              double v86 = NSString;
              double v87 = [MEMORY[0x1E4F28B50] mainBundle];
              uint64_t v88 = [v87 bundleIdentifier];
              double v89 = [v86 stringWithFormat:@"Refusing request for view controller of class \"%@\" not included in \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist", v9, v88];
              v211 = v89;
              BOOL v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
              v91 = [v84 errorWithDomain:v85 code:967224 userInfo:v90];
              ((void (**)(void, void, void *))v178)[2](v178, 0, v91);

              id WeakRetained = v184;
              uint64_t v18 = v185;
              uint64_t v10 = v186;
              long long v20 = v172;
              long long v22 = v179;
              long long v24 = v177;
              goto LABEL_122;
            }
          }
          else
          {
            v92 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0A0) + 8);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              v93 = (void *)MEMORY[0x1E4F28B50];
              id v94 = v92;
              id v95 = [v93 mainBundle];
              v96 = [v95 bundleIdentifier];
              *(_DWORD *)buf = 138412546;
              uint64_t v218 = (uint64_t)v96;
              __int16 v219 = 2112;
              v220 = v9;
              _os_log_impl(&dword_1853B0000, v94, OS_LOG_TYPE_ERROR, "No \"UIViewServicePermittedViewControllerClasses\" array in View Service bundle \"%@\"'s Info.plist. Cannot check validity of request for class \"%@\". This will become failure in a future build.", buf, 0x16u);

              id v47 = v176;
            }
          }
        }
        Class v97 = NSClassFromString((NSString *)v9);
        if (v97)
        {
          double v98 = v97;
          if ([(objc_class *)v97 isSubclassOfClass:objc_opt_class()])
          {
            double v99 = (UIViewController *)objc_alloc_init(v98);
            BOOL v100 = v191->_localViewController;
            v191->_localViewController = v99;

LABEL_75:
            if (objc_opt_respondsToSelector()) {
              [WeakRetained viewControllerOperator:v191 didCreateServiceViewController:v191->_localViewController contextToken:v186];
            }
            BOOL v101 = v191;
            __n128 v102 = v191->_localViewController;
            v190 = v102;
            if (!v180) {
              goto LABEL_97;
            }
            Class v103 = NSClassFromString(v180);
            if (v103)
            {
              v104 = v103;
              if ([(objc_class *)v103 isSubclassOfClass:objc_opt_class()])
              {
                v105 = (UIViewController *)objc_alloc_init(v104);
                objc_opt_class();
                BOOL v101 = v191;
                if (objc_opt_isKindOfClass())
                {
                  v201 = v191->_localViewController;
                  id v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
                  [(UIViewController *)v105 setViewControllers:v106];
                }
                else
                {
                  [(UIViewController *)v191->_localViewController willMoveToParentViewController:v105];
                  [(UIViewController *)v105 addChildViewController:v191->_localViewController];
                }
                __n128 v102 = v190;
                uint64_t v130 = v191->_localViewController;
                v191->_localViewController = v105;

LABEL_97:
                [(UIViewController *)v101 addChildViewController:v101->_localViewController];
                if (v47)
                {
                  [v175 _setPrincipalObject:v102 forUUID:v186];
                  [(UIViewController *)v101->_localViewController beginRequestWithExtensionContext:v47];
                }
                [(UIViewController *)v101->_localViewController preferredContentSize];
                -[UIViewController setPreferredContentSize:](v101, "setPreferredContentSize:");
                double v131 = +[UIScreen mainScreen];
                [v131 bounds];
                double v133 = v132;
                double v135 = v134;
                double v137 = v136;
                double v139 = v138;
                int v140 = [(id)objc_opt_class() _isSecureForRemoteViewService];
                v141 = off_1E52D5F30;
                if (!v140) {
                  v141 = off_1E52D5830;
                }
                uint64_t v142 = objc_msgSend(objc_alloc(*v141), "initWithFrame:", v133, v135, v137, v139);
                objc_storeStrong((id *)&v101->_hostedWindow, (id)v142);
                -[_UIHostedWindow _setHostBundleIdentifier:](v142, v101->_hostBundleID);
                if (v142)
                {
                  long long v143 = *(_OWORD *)&v101->_hostAuditToken.val[4];
                  *(_OWORD *)(v142 + 952) = *(_OWORD *)v101->_hostAuditToken.val;
                  *(_OWORD *)(v142 + 968) = v143;
                  [(id)v142 _updateStrictTouchVerificationIfNecessary];
                }
                [(id)v142 _setHostTraitCollection:v177];
                v144 = +[UIWindowScene _unassociatedWindowSceneForScreen:v131 create:1];
                [(id)v142 setWindowScene:v144];
                [(id)v142 setRootViewController:v101];
                [(id)v142 setBackgroundColor:0];
                [(id)v142 setHidden:0];
                [(id)v142 makeKeyWindow];
                [(_UIViewServiceViewControllerOperator *)v101 _installActivityObserverGestureIfNeeded];
                v188 = v131;
                uint64_t v145 = +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, v101, [v131 _userInterfaceIdiom]);
                sessionActivityRecord = v101->_sessionActivityRecord;
                v101->_sessionActivityRecord = (_UIViewServiceSessionActivityRecord *)v145;

                v174 = v144;
                v171 = [v144 _physicalButtonInteractionArbiter];
                uint64_t v147 = -[_UIPhysicalButtonInteractionArbiter _registerViewServiceObserver:](v171, v101);
                physicalButtonInteractionArbiterObserverToken = v101->_physicalButtonInteractionArbiterObserverToken;
                v101->_physicalButtonInteractionArbiterObserverToken = (BSInvalidatable *)v147;

                v149 = +[_UIActiveViewServiceSessionTracker sharedTracker];
                -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v149, 1uLL, (void *)v142, (__CFString *)v101, (uint64_t)v101->_sessionActivityRecord);

                v150 = [(id)v142 _rootPresentationController];
                [v150 setDelegate:v101];

                v151 = 0;
                id v7 = v178;
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v152 = [(id)UIApp _accessibilityMachPort];
                  if (v152)
                  {
                    uint64_t v153 = v152;
                    mach_port_insert_right(*MEMORY[0x1E4F14960], v153, v153, 0x14u);
                    v151 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:v153];
                  }
                  else
                  {
                    v151 = 0;
                  }
                }
                if (v179)
                {
                  mach_port_name_t v154 = [v179 extractPortAndIKnowWhatImDoingISwear];
                  if (v154 - 1 <= 0xFFFFFFFD)
                  {
                    mach_port_name_t v155 = v154;
                    if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v154, 0, 1)) {
                      unsigned int v156 = 0;
                    }
                    else {
                      unsigned int v156 = v155;
                    }
                    v191->_hostAccessibilityServerPort = v156;
                  }
                }
                v191->_availableTextServices = v167;
                v157 = [(UIViewController *)v191->_localViewController view];
                if (dyld_program_sdk_at_least())
                {
                  [v157 setAutoresizingMask:18];
                  v158 = [(UIViewController *)v191 view];
                  [v158 bounds];
                  objc_msgSend(v157, "setFrame:");
                }
                v159 = [(UIViewController *)v191 view];
                v168 = v157;
                [v159 addSubview:v157];

                if (objc_opt_respondsToSelector()) {
                  [v184 viewControllerOperator:v191 didCreateServiceViewControllerOfClass:objc_opt_class()];
                }
                v160 = (void *)UIApp;
                v192[0] = MEMORY[0x1E4F143A8];
                v192[1] = 3221225472;
                v192[2] = __90___UIViewServiceViewControllerOperator___createViewControllerWithOptions_completionBlock___block_invoke;
                v192[3] = &unk_1E52DC7E8;
                id v161 = (id)v142;
                id v193 = v161;
                v194 = v191;
                id v162 = v151;
                id v195 = v162;
                v196 = v178;
                [v160 _performBlockAfterCATransactionCommits:v192];
                _UIRestorePreviousFallbackEnvironment(v169);
                unint64_t v163 = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0C8);
                v164 = *(id *)(v163 + 8);
                os_signpost_id_t v165 = os_signpost_id_make_with_pointer(*(os_log_t *)(v163 + 8), v191);
                if (v165 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  os_signpost_id_t v166 = v165;
                  if (os_signpost_enabled(v164))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1853B0000, v164, OS_SIGNPOST_INTERVAL_END, v166, "VCOperatorCreateViewController", "", buf, 2u);
                  }
                }

                id WeakRetained = v184;
                uint64_t v18 = v185;
                uint64_t v10 = v186;
                v129 = v188;
                long long v20 = v172;
                goto LABEL_121;
              }
              uint64_t v125 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v126 = *MEMORY[0x1E4F281F8];
              v202 = @"Class Not UIViewController subclass";
              v127 = [NSString stringWithFormat:@"%@ specified as the containing controller class, but that class is not a subclass of UIViewController", v180];
              v203 = v127;
              id v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
              uint64_t v117 = [v125 errorWithDomain:v126 code:967221 userInfo:v128];

              uint64_t v118 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0C0) + 8);
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v218 = v117;
                uint64_t v119 = "Rejecting view controller creation request as specified class is not a view controller subclass: %{public}@";
                goto LABEL_93;
              }
            }
            else
            {
              v113 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v114 = *MEMORY[0x1E4F281F8];
              v204 = @"Class Not Found";
              v115 = [NSString stringWithFormat:@"%@ specified as the containing controller class, but that class was not found", v180];
              v205 = v115;
              v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
              uint64_t v117 = [v113 errorWithDomain:v114 code:967220 userInfo:v116];

              uint64_t v118 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0B8) + 8);
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v218 = v117;
                uint64_t v119 = "Rejecting view controller creation request as view controller class is not present: %{public}@";
LABEL_93:
                _os_log_impl(&dword_1853B0000, v118, OS_LOG_TYPE_ERROR, v119, buf, 0xCu);
              }
            }
            v178[2](v178, 0, v117);
            uint64_t v18 = v185;
            uint64_t v10 = v186;
            long long v20 = v172;
            v129 = (void *)v117;
LABEL_121:
            long long v22 = v179;
            long long v24 = v177;

LABEL_122:
            double v124 = v190;
            goto LABEL_123;
          }
          v120 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v121 = *MEMORY[0x1E4F281F8];
          v206 = @"Class Not UIViewController subclass";
          v122 = [NSString stringWithFormat:@"Service Side Class %@ not UIViewControllerSubclass", v9];
          v207 = v122;
          v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
          uint64_t v66 = [v120 errorWithDomain:v121 code:967221 userInfo:v123];

          id v111 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0B0) + 8);
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
            goto LABEL_89;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v218 = v66;
          v112 = "Rejecting view controller creation request as specified class is not a view controller subclass: %{public}@";
        }
        else
        {
          v107 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v108 = *MEMORY[0x1E4F281F8];
          v208 = @"Class Not Found";
          v109 = [NSString stringWithFormat:@"View Controller Class %@ not found service side", v9];
          v209 = v109;
          v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
          uint64_t v66 = [v107 errorWithDomain:v108 code:967220 userInfo:v110];

          id v111 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0A8) + 8);
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
LABEL_89:
            v178[2](v178, 0, v66);
            uint64_t v10 = v186;
LABEL_90:
            uint64_t v18 = v185;
            long long v20 = v172;
            double v124 = (void *)v66;
            long long v22 = v179;
            long long v24 = v177;
LABEL_123:

            goto LABEL_124;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v218 = v66;
          v112 = "Rejecting view controller creation request as view controller class is not present: %{public}@";
        }
        _os_log_impl(&dword_1853B0000, v111, OS_LOG_TYPE_ERROR, v112, buf, 0xCu);
        goto LABEL_89;
      }
      id v47 = (void *)v46;
    }
    else
    {
      v175 = 0;
      id v47 = 0;
    }
    id v6 = v181;
    goto LABEL_35;
  }
  long long v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:967219 userInfo:0];
  long long v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B078) + 8);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v218 = (uint64_t)v24;
    _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Rejecting view controller creation request as connection has an existing instantiated view controller: %{public}@", buf, 0xCu);
  }
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v24);
LABEL_124:
}

- (void)__exchangeAccessibilityPortInformation:(id)a3 replyHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F1D170];
    v18[0] = @"Remote service does not respond to _accessibilityMachPort";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    BOOL v13 = [v11 errorWithDomain:@"Accessibility" code:0 userInfo:v12];
    v7[2](v7, 0, v13);

LABEL_6:
    uint64_t v10 = 0;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v8 = [(id)UIApp _accessibilityMachPort];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  mach_port_insert_right(*MEMORY[0x1E4F14960], v9, v9, 0x14u);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:v9];
  if (!v6) {
    goto LABEL_12;
  }
LABEL_7:
  mach_port_name_t v14 = [v6 extractPortAndIKnowWhatImDoingISwear];
  if (v14 - 1 <= 0xFFFFFFFD)
  {
    mach_port_name_t v15 = v14;
    if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v14, 0, 1)) {
      unsigned int v16 = 0;
    }
    else {
      unsigned int v16 = v15;
    }
    self->_hostAccessibilityServerPort = v16;
  }
LABEL_12:
  ((void (**)(id, void *, void *))v7)[2](v7, v10, 0);
}

- (void)__setMediaOverridePID:(int)a3
{
  self->_mediaPID = a3;
  beginInheritingCoreMediaApplicationState(*(uint64_t *)&a3);
}

- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4 withFence:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v12 = a4;
  if (a5)
  {
    id v9 = a5;
    uint64_t v10 = [(_UIViewServiceViewControllerOperator *)self _window];
    uint64_t v11 = [v10 _windowHostingScene];
    [v11 _synchronizeDrawingWithFence:v9];
  }
  -[_UIViewServiceViewControllerOperator __setContentSize:boundingPath:](self, "__setContentSize:boundingPath:", v12, width, height);
}

- (void)__setContentSize:(CGSize)a3 boundingPath:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0D0);
  id v9 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCOperatorSetContentSize", "", buf, 2u);
    }
  }

  id v12 = self->_hostedWindow;
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIView *)v12 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  -[UIWindow setFrame:](v12, "setFrame:", v13, v14, width, height);
  [(_UIViewServiceViewControllerOperator *)self __setBoundingPath:v7];

  [(UIView *)v12 layoutBelowIfNeeded];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v23 = [(UIViewController *)self _existingView];
    objc_msgSend(v23, "setFrame:", v13, v14, width, height);

    long long v24 = [(UIViewController *)self->_localViewController _existingView];
    objc_msgSend(v24, "setFrame:", v13, v14, width, height);

    long long v25 = [(UIViewController *)self _existingView];
    [v25 layoutBelowIfNeeded];

    long long v26 = [(UIViewController *)self->_localViewController _existingView];
    [v26 layoutBelowIfNeeded];
  }
  -[UIViewController window:willAnimateFromContentFrame:toContentFrame:](self, "window:willAnimateFromContentFrame:toContentFrame:", v12, v16, v18, v20, v22, v13, v14, width, height);
  if (!self->_viewControllerTransitioningContext)
  {
    long long v27 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    [(_UIViewControllerOneToOneTransitionContext *)v27 _setFromViewController:self];
    [(_UIViewControllerOneToOneTransitionContext *)v27 _setToViewController:0];
    [(_UIViewControllerTransitionContext *)v27 _setContainerView:v12];
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v27, "_setFromStartFrame:", v16, v18, v20, v22);
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v27, "_setToEndFrame:", v13, v14, width, height);
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v27, "_setToStartFrame:", v16, v18, v20, v22);
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v27, "_setFromEndFrame:", v13, v14, width, height);
    [(_UIViewControllerTransitionContext *)v27 _setRotating:0];
    os_signpost_id_t v28 = +[_UIWindowAnimationController animationControllerWithWindow:v12];
    [(_UIViewControllerTransitionContext *)v27 _setIsAnimated:0];
    [(_UIViewControllerTransitionContext *)v27 _setAnimator:v28];
    os_signpost_id_t v29 = [(_UIViewControllerTransitionContext *)v27 _transitionCoordinator];
    -[UIViewController _window:viewWillTransitionToSize:withTransitionCoordinator:](self, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v12, v29, width, height);
    [v28 animateTransition:v27];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverController);
  objc_msgSend(WeakRetained, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v12, 4, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  unint64_t v31 = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B0D8);
  uint64_t v32 = *(id *)(v31 + 8);
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(*(os_log_t *)(v31 + 8), self);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v34 = v33;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)uint64_t v35 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v32, OS_SIGNPOST_INTERVAL_END, v34, "VCOperatorSetContentSize", "", v35, 2u);
    }
  }
}

- (void)__setBoundingPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_hostedWindow;
  if (v5)
  {
    [v4 setCoordinateSpace:v5];
    if (([v4 validateForCoordinateSpace] & 1) == 0)
    {
      id v6 = [_UIRectangularBoundingPath alloc];
      [(UIView *)v5 bounds];
      uint64_t v7 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v6, "initWithCoordinateSpace:boundingRect:", v5);

      id v4 = (id)v7;
    }
    [(UIView *)v5 _setBoundingPath:v4];
    uint64_t v23 = 0;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v10 = 0u;
    long long v9 = 0u;
    uint64_t v8 = 32;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)v5, &v8);
  }
}

- (void)__hostDidPromoteFirstResponder
{
  if (![(UIResponder *)self->_localViewController _disableAutomaticKeyboardBehavior])
  {
    long long v9 = self->_hostedWindow;
    int v3 = [(UIWindow *)v9 windowScene];
    id v4 = [v3 keyboardSceneDelegate];

    [(UIWindow *)v9 _setIsResigningFirstResponderFromHost:1];
    BOOL v5 = [(UIWindow *)v9 firstResponder];
    [v5 resignFirstResponder];

    id v6 = [v4 responder];
    BOOL v7 = [(UIResponder *)v9 _containsResponder:v6];

    if (v7) {
      [v4 _reloadInputViewsForResponder:0];
    }
    [(UIWindow *)v9 _setIsResigningFirstResponderFromHost:0];
    uint64_t v8 = +[_UIEditMenuSceneComponent sceneComponentForView:v9];
    [v8 dismissCurrentMenu];
  }
}

- (void)__hostDisablesAutomaticKeyboardBehavior:(BOOL)a3
{
  self->_disableAutomaticKeyboardBehavior = a3;
}

- (void)__hostDidSetContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  BOOL v12 = a3.left == self->_localViewControllerRequestedInsets.left
     && a3.top == self->_localViewControllerRequestedInsets.top
     && a3.right == self->_localViewControllerRequestedInsets.right
     && a3.bottom == self->_localViewControllerRequestedInsets.bottom;
  if (v12
    && self->_localViewControllerRequestedLeftMargin == a4
    && self->_localViewControllerRequestedRightMargin == a5)
  {
    return;
  }
  self->_localViewControllerRequestedInsets = a3;
  self->_localViewControllerRequestedLeftMargin = a4;
  self->_localViewControllerRequestedRightMargin = a5;
  if (![(_UIViewServiceViewControllerOperator *)self _providesCustomBasePresentationInsets])
  {
    long long v14 = self->_hostedWindow;
    -[UIView setSafeAreaInsets:](v14, "setSafeAreaInsets:", top, left, bottom, right);
    [(UIViewController *)self _sceneSettingsSafeAreaInsetsDidChangeForWindow:v14];
    if ([(UIViewController *)self->_localViewController _shouldForceLayoutForHostedAnimation]&& +[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UIView *)v14 layoutIfNeeded];
    }
    goto LABEL_20;
  }
  -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self->_localViewController);
  long long v13 = [(UIViewController *)self presentedViewController];
  if (v13)
  {
    long long v14 = v13;
    -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](v13);
LABEL_20:
    long long v13 = v14;
  }
}

- (BOOL)_providesCustomBasePresentationInsets
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", 0);
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  long long v13 = [(UIViewController *)self view];
  long long v14 = [v13 window];
  if (v14)
  {
    long long v15 = [(UIViewController *)self view];
    long long v16 = [(UIViewController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "convertRect:toView:", 0);
    CGFloat v18 = v17;
    double v47 = v19;
    CGFloat v42 = v21;
    CGFloat v43 = v20;
  }
  else
  {
    long long v15 = [(_UIViewServiceViewControllerOperator *)self _window];
    [v15 bounds];
    CGFloat v18 = v22;
    double v47 = v23;
    CGFloat v42 = v25;
    CGFloat v43 = v24;
  }

  double top = self->_localViewControllerRequestedInsets.top;
  double bottom = self->_localViewControllerRequestedInsets.bottom;
  double left = self->_localViewControllerRequestedInsets.left;
  double right = self->_localViewControllerRequestedInsets.right;
  v48.origin.double x = v6;
  v48.origin.double y = v8;
  v48.size.double width = v10;
  v48.size.double height = v12;
  double MinY = CGRectGetMinY(v48);
  v49.origin.double x = v18;
  v49.origin.double y = v47;
  v49.size.double width = v43;
  v49.size.double height = v42;
  double v41 = fmax(top - fmax(MinY - CGRectGetMinY(v49), 0.0), 0.0);
  v50.origin.double x = v6;
  v50.origin.double y = v8;
  v50.size.double width = v10;
  v50.size.double height = v12;
  double MinX = CGRectGetMinX(v50);
  v51.origin.double x = v18;
  v51.origin.double y = v47;
  v51.size.double width = v43;
  v51.size.double height = v42;
  double v38 = CGRectGetMinX(v51);
  v52.origin.double x = v18;
  v52.origin.double y = v47;
  v52.size.double width = v43;
  v52.size.double height = v42;
  double MaxY = CGRectGetMaxY(v52);
  v53.origin.double x = v6;
  v53.origin.double y = v8;
  v53.size.double width = v10;
  v53.size.double height = v12;
  double v36 = CGRectGetMaxY(v53);
  v54.origin.double x = v18;
  v54.origin.double y = v47;
  v54.size.double width = v43;
  v54.size.double height = v42;
  double MaxX = CGRectGetMaxX(v54);
  v55.origin.double x = v6;
  v55.origin.double y = v8;
  v55.size.double width = v10;
  v55.size.double height = v12;
  double v28 = CGRectGetMaxX(v55);
  double hostStatusBarHeight = self->_hostStatusBarHeight;
  _UIAppStatusBarDefaultHeight();
  if (hostStatusBarHeight == 0.0)
  {
    BOOL v31 = vabdd_f64(v8, v47) == 0.0 - v30;
    double v32 = v41;
    if (v31) {
      double v32 = self->_localViewControllerRequestedInsets.top;
    }
  }
  else
  {
    double v32 = v41;
  }
  double v33 = fmax(right - fmax(MaxX - v28, 0.0), 0.0);
  double v34 = fmax(bottom - fmax(MaxY - v36, 0.0), 0.0);
  double v35 = fmax(left - fmax(MinX - v38, 0.0), 0.0);
  result.double right = v33;
  result.double bottom = v34;
  result.double left = v35;
  result.double top = v32;
  return result;
}

- (double)_canvasSystemMinimumMargin
{
  return 0.0;
}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
{
  BOOL v3 = [(_UIViewServiceViewControllerOperator *)self _providesCustomBasePresentationInsets];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (!v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIViewController *)&v8 _viewSafeAreaInsetsFromScene];
  }
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v4;
  result.double top = v5;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v6 = (UIViewController *)a3;
  if (self->_localViewController == v6
    && [(_UIViewServiceViewControllerOperator *)self _providesCustomBasePresentationInsets])
  {
    *a4 = 1;
    CGFloat top = self->_localViewControllerRequestedInsets.top;
    CGFloat left = self->_localViewControllerRequestedInsets.left;
    CGFloat bottom = self->_localViewControllerRequestedInsets.bottom;
    CGFloat right = self->_localViewControllerRequestedInsets.right;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIViewController *)&v19 _edgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
    CGFloat top = v11;
    CGFloat left = v12;
    CGFloat bottom = v13;
    CGFloat right = v14;
  }

  double v15 = top;
  double v16 = left;
  double v17 = bottom;
  double v18 = right;
  result.CGFloat right = v18;
  result.CGFloat bottom = v17;
  result.CGFloat left = v16;
  result.CGFloat top = v15;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  if (self->_localViewController == a3)
  {
    *a4 = self->_localViewControllerRequestedLeftMargin;
    *a5 = self->_localViewControllerRequestedRightMargin;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIViewController _marginInfoForChild:leftMargin:rightMargin:](&v5, sel__marginInfoForChild_leftMargin_rightMargin_);
  }
}

- (void)__hostDidSetPresentationControllerClassName:(id)a3
{
}

- (id)_presentationControllerClassName
{
  return self->_presentationControllerClassName;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_localViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_localViewController;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  v12.receiver = self;
  v12.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v12 setNeedsStatusBarAppearanceUpdate];
  BOOL v3 = [(UIViewController *)self _effectiveStatusBarStyleViewController];
  double v4 = [(UIViewController *)self _effectiveStatusBarHiddenViewController];
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__preferredStatusBarVisibility])
  {
    uint64_t v5 = [v4 _preferredStatusBarVisibility];
LABEL_8:
    uint64_t v6 = v5;
    goto LABEL_9;
  }
  if (![(id)objc_opt_class() doesOverrideViewControllerMethod:sel_prefersStatusBarHidden])
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIViewServiceViewControllerOperator;
    uint64_t v5 = [(UIViewController *)&v11 _preferredStatusBarVisibility];
    goto LABEL_8;
  }
  if ([v4 prefersStatusBarHidden]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
LABEL_9:
  id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  uint64_t v8 = [v3 preferredStatusBarStyle];
  uint64_t v9 = [v3 preferredStatusBarUpdateAnimation];
  CGFloat v10 = +[UIView _currentAnimationSettings];
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredStatusBarStyle:preferredStatusBarVisibility:updateAnimation:currentAnimationSettings:", v8, v6, v9, v10);
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_localViewController;
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v7 setNeedsWhitePointAdaptivityStyleUpdate];
  BOOL v3 = [(UIViewController *)self _effectiveWhitePointAdaptivityStyleViewController];
  id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
  uint64_t v5 = [v3 preferredWhitePointAdaptivityStyle];
  uint64_t v6 = +[UIView _currentAnimationSettings];
  objc_msgSend(remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredWhitePointAdaptationStyle:animationSettings:", v5, v6);
}

- (BOOL)sendClientToHostAction:(id)a3
{
  return 1;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v4 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  BOOL v3 = [(UIViewController *)self _effectiveScreenEdgesDeferringSystemGesturesViewController];
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePreferredScreenEdgesDeferringSystemGestures:", objc_msgSend(v3, "preferredScreenEdgesDeferringSystemGestures"));
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v4 setNeedsUpdateOfHomeIndicatorAutoHidden];
  BOOL v3 = [(UIViewController *)self _effectiveHomeIndicatorAutoHiddenViewController];
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePrefersHomeIndicatorAutoHidden:", objc_msgSend(v3, "prefersHomeIndicatorAutoHidden"));
}

- (id)childViewControllerForPointerLock
{
  return self->_localViewController;
}

- (void)setNeedsUpdateOfPrefersPointerLocked
{
  v4.receiver = self;
  v4.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v4 setNeedsUpdateOfPrefersPointerLocked];
  BOOL v3 = [(UIViewController *)self _effectivePointerLockViewController];
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdatePrefersPointerLocked:", objc_msgSend(v3, "prefersPointerLocked"));
}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return self->_localViewController;
}

- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceViewControllerOperator;
  [(UIViewController *)&v5 _setNeedsUpdateOfMultitaskingDragExclusionRects];
  BOOL v3 = [(UIViewController *)self _effectiveViewControllerForMultitaskingDragExclusionRects];
  objc_super v4 = [v3 _multitaskingDragExclusionRects];
  objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdateMultitaskingDragExclusionRects:", v4);
}

- (id)_inputViewsKey
{
  return (id)[MEMORY[0x1E4F29238] valueWithPointer:self];
}

- (int64_t)_availableTextServices
{
  BOOL v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return self->_availableTextServices;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIViewServiceViewControllerOperator;
  return [(UIResponder *)&v6 _availableTextServices];
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  objc_super v7 = [v6 textInput];
  uint64_t v8 = [v7 textInputView];
  BOOL v9 = +[_UITextServiceSession shouldPresentServiceInSameWindowAsView:v8];

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIViewServiceViewControllerOperator;
    CGFloat v10 = [(UIResponder *)&v18 _showServiceForType:a3 withContext:v6];
  }
  else
  {
    [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:0];
    objc_super v11 = +[_UIHostedTextServiceSession showServiceForType:a3 withContext:v6];
    textServiceSession = self->_textServiceSession;
    self->_textServiceSession = v11;

    [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:self];
    double v13 = [(UIViewController *)self view];
    [v6 convertRectToView:v13];

    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72___UIViewServiceViewControllerOperator__showServiceForType_withContext___block_invoke;
    v17[3] = &unk_1E530DEE0;
    v17[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__showServiceForType:withContext:replyHandler:", a3, v6, v17);
    CGFloat v10 = self->_textServiceSession;
  }
  double v15 = v10;

  return v15;
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a3;
  double v15 = -[_UIViewServiceViewControllerOperator _showServiceForText:selectedTextRange:type:fromRect:inView:](self, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v14, 0, [v14 length], a4, v13, x, y, width, height);

  return v15;
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a3;
  id v17 = a7;
  if (+[_UITextServiceSession shouldPresentServiceInSameWindowAsView:v17])
  {
    v36.receiver = self;
    v36.super_class = (Class)_UIViewServiceViewControllerOperator;
    -[UIResponder _showServiceForText:selectedTextRange:type:fromRect:inView:](&v36, sel__showServiceForText_selectedTextRange_type_fromRect_inView_, v16, location, length, a5, v17, x, y, width, height);
    objc_super v18 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:0];
    +[_UIHostedTextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UIHostedTextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", v16, location, length, a5, v17, x, y, width, height);
    objc_super v19 = (_UIHostedTextServiceSession *)objc_claimAutoreleasedReturnValue();
    textServiceSession = self->_textServiceSession;
    self->_textServiceSession = v19;

    [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:self];
    double v21 = [(UIViewController *)self view];
    objc_msgSend(v21, "convertRect:fromView:", v17, x, y, width, height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    BOOL v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    double v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v23, v25, v27, v29);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __99___UIViewServiceViewControllerOperator__showServiceForText_selectedTextRange_type_fromRect_inView___block_invoke;
    v35[3] = &unk_1E530DEE0;
    v35[4] = self;
    objc_msgSend(remoteViewControllerProxyToOperator, "__showServiceForText:selectedTextRangeValue:type:fromRectValue:replyHandler:", v16, v31, a5, v32, v35);

    objc_super v18 = self->_textServiceSession;
  }
  double v33 = v18;

  return v33;
}

- (void)dismissHostedTextServiceSession:(id)a3 animated:(BOOL)a4
{
  if (self->_textServiceSession == a3) {
    objc_msgSend(self->_remoteViewControllerProxyToOperator, "__dismissTextServiceSessionAnimated:", a4);
  }
}

- (void)__textServiceDidDismiss
{
  [(_UIHostedTextServiceSession *)self->_textServiceSession remoteSessionDidDismiss];
  [(_UIHostedTextServiceSession *)self->_textServiceSession setDelegate:0];
  textServiceSession = self->_textServiceSession;
  self->_textServiceSession = 0;

  uint64_t v4 = [(UIWindow *)self->_hostedWindow windowScene];
  id v6 = [v4 keyboardSceneDelegate];

  objc_super v5 = [(_UIViewServiceViewControllerOperator *)self _inputViewsKey];
  [v6 _restoreInputViewsWithId:v5 animated:1];
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (objc_msgSend((id)UIApp, "applicationSupportsShakeToEdit", a3, a4)
    && !_AXSShakeToUndoDisabled())
  {
    [(_UIViewServiceViewControllerOperator *)self __showEditAlertView];
  }
}

- (void)__showEditAlertView
{
  BOOL v3 = [(UIWindow *)self->_hostedWindow firstResponder];
  uint64_t v4 = [v3 undoManager];
  editAlertUndoManager = self->_editAlertUndoManager;
  self->_editAlertUndoManager = v4;

  if (!self->_editAlertToken
    && ([(NSUndoManager *)self->_editAlertUndoManager canUndo]
     || [(NSUndoManager *)self->_editAlertUndoManager canRedo]))
  {
    int64_t v6 = arc4random();
    self->_editAlertToken = v6;
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    BOOL v8 = [(NSUndoManager *)self->_editAlertUndoManager canUndo];
    BOOL v9 = [(NSUndoManager *)self->_editAlertUndoManager canRedo];
    objc_msgSend(remoteViewControllerProxyToOperator, "__showEditAlertViewWithToken:canUndo:canRedo:", v6, v8, v9);
  }
}

- (void)__undoActionWithToken:(int64_t)a3
{
  if (a3 && self->_editAlertToken == a3)
  {
    self->_editAlertToken = 0;
    [(NSUndoManager *)self->_editAlertUndoManager undo];
    editAlertUndoManager = self->_editAlertUndoManager;
    self->_editAlertUndoManager = 0;
  }
}

- (void)__redoActionWithToken:(int64_t)a3
{
  if (a3 && self->_editAlertToken == a3)
  {
    self->_editAlertToken = 0;
    [(NSUndoManager *)self->_editAlertUndoManager redo];
    editAlertUndoManager = self->_editAlertUndoManager;
    self->_editAlertUndoManager = 0;
  }
}

- (void)__cancelAlertActionWithToken:(int64_t)a3
{
  if (a3)
  {
    if (self->_editAlertToken == a3)
    {
      self->_editAlertToken = 0;
      editAlertUndoManager = self->_editAlertUndoManager;
      self->_editAlertUndoManager = 0;
    }
  }
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_localViewController)
  {
    v5[0] = self->_localViewController;
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIViewServiceViewControllerOperator;
    id v2 = [(UIViewController *)&v4 preferredFocusEnvironments];
  }
  return v2;
}

- (void)_forwardFocusMovementAction:(id)a3
{
}

- (id)_dataFromPressesEvent:(id)a3
{
  [a3 _hidEvent];
  Data = (void *)IOHIDEventCreateData();
  return Data;
}

- (BOOL)_forwardPresses:(id)a3 withEvent:(id)a4 canceled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (_UIPressesContainsPressType(v8, 7)
    || _UIPressesContainsPressType(v8, 5)
    && (![v9 _hidEvent] || (objc_msgSend(v9, "_hidEvent"), IOHIDEventGetType() != 35)))
  {
    id remoteViewControllerProxyToOperator = self->_remoteViewControllerProxyToOperator;
    objc_super v11 = [(_UIViewServiceViewControllerOperator *)self _dataFromPressesEvent:v9];
    objc_msgSend(remoteViewControllerProxyToOperator, "__trampolineButtonPressData:canceled:", v11, v5);

    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UIViewServiceViewControllerOperator *)self _forwardPresses:v6 withEvent:v7 canceled:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIResponder *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UIViewServiceViewControllerOperator *)self _forwardPresses:v6 withEvent:v7 canceled:1])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UIViewServiceViewControllerOperator *)self _forwardPresses:v6 withEvent:v7 canceled:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIResponder *)&v8 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UIViewServiceViewControllerOperator *)self _forwardPresses:v6 withEvent:v7 canceled:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIViewServiceViewControllerOperator;
    [(UIResponder *)&v8 pressesEnded:v6 withEvent:v7];
  }
}

- (void)__timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (pthread_main_np() != 1)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UIViewServiceViewControllerOperator.m" lineNumber:3597 description:@"Call must be made on main thread"];
  }
  if (!self->_blsFrameSpecifierModel)
  {
    id v9 = (BLSFrameSpecifierModel *)objc_alloc_init(MEMORY[0x1E4F4F520]);
    blsFrameSpecifierModel = self->_blsFrameSpecifierModel;
    self->_blsFrameSpecifierModel = v9;
  }
  objc_super v11 = objc_opt_new();
  BOOL v12 = [(UIViewController *)self->_localViewController _effectiveControllersForAlwaysOnTimelines];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke;
  v22[3] = &unk_1E52F2120;
  SEL v26 = a2;
  id v23 = v7;
  double v24 = self;
  id v25 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_3;
  v17[3] = &unk_1E530DF08;
  id v20 = v8;
  SEL v21 = a2;
  v17[4] = self;
  id v18 = v25;
  id v19 = v23;
  id v13 = v8;
  id v14 = v23;
  id v15 = v25;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:v12 performBlock:v22 withCompletion:v17];
}

- (void)__updateWithFrameSpecifierDate:(id)a3 completion:(id)a4
{
  blsFrameSpecifierModel = self->_blsFrameSpecifierModel;
  id v7 = a4;
  id v8 = [(BLSFrameSpecifierModel *)blsFrameSpecifierModel specifierAtPresentationDate:a3];
  id v9 = [(UIViewController *)self->_localViewController _effectiveControllersForAlwaysOnTimelines];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82___UIViewServiceViewControllerOperator___updateWithFrameSpecifierDate_completion___block_invoke;
  v11[3] = &unk_1E530DF30;
  id v12 = v8;
  id v10 = v8;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:v9 performBlock:v11 withCompletion:v7];
}

- (_UIChildRemoteContentRegistry)_childRemoteContentRegistry
{
  childRemoteContentRegistrdouble y = self->_childRemoteContentRegistry;
  if (!childRemoteContentRegistry)
  {
    objc_super v4 = [[_UIChildRemoteContentRegistry alloc] initWithParentScene:self->_pseudoScene];
    BOOL v5 = self->_childRemoteContentRegistry;
    self->_childRemoteContentRegistrdouble y = v4;

    childRemoteContentRegistrdouble y = self->_childRemoteContentRegistry;
  }
  return childRemoteContentRegistry;
}

- (id)_windowHostingScene
{
  return [(UIWindow *)self->_hostedWindow _windowHostingScene];
}

- (unint64_t)_providerType
{
  return 0;
}

- (NSUUID)_sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (UIWindow)_primaryHostedWindow
{
  return (UIWindow *)self->_hostedWindow;
}

- (int)_effectiveViewControllerAppearState
{
  return [(UIViewController *)self->_localViewController _appearState];
}

- (void)_installActivityObserverGestureIfNeeded
{
  if (pthread_main_np() != 1)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIViewServiceViewControllerOperator.m" lineNumber:3676 description:@"Call must be made on main thread"];
  }
  hostedWindow = self->_hostedWindow;
  if (hostedWindow)
  {
    if (!self->_hostedWindowActivityObserverGesture)
    {
      BOOL v5 = [NSString stringWithFormat:@"%@-%p", @"ViewService-HostedWindow-Observer", hostedWindow];
      id v6 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleActivityObserverGesture_, (uint64_t)v5);
      hostedWindowActivityObserverGesture = self->_hostedWindowActivityObserverGesture;
      self->_hostedWindowActivityObserverGesture = v6;

      hostedWindow = self->_hostedWindow;
    }
    id v8 = [(UIView *)hostedWindow gestureRecognizers];
    char v9 = [v8 containsObject:self->_hostedWindowActivityObserverGesture];

    if ((v9 & 1) == 0)
    {
      id v10 = self->_hostedWindow;
      objc_super v11 = self->_hostedWindowActivityObserverGesture;
      [(UIView *)v10 addGestureRecognizer:v11];
    }
  }
}

- (void)_handleActivityObserverGesture:(id)a3
{
  objc_super v4 = +[_UIActiveViewServiceSessionTracker sharedTracker];
  -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v4, 4uLL, &self->_hostedWindow->super.super.super.super.isa, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);
}

- (void)_physicalButtonInteractionArbiter:(id)a3 didUpdateResolvedConfigurations:(id)a4 inActiveViewServiceSession:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (_UIViewServiceSessionActivityRecord *)a5;
  objc_super v11 = v10;
  sessionActivityRecord = self->_sessionActivityRecord;
  if (sessionActivityRecord)
  {
    int64_t v13 = v10 ? v10->_userInterfaceIdiom : 0;
    if (sessionActivityRecord->_userInterfaceIdiom == v13)
    {
      uint64_t v14 = objc_opt_new();
      id v15 = (void *)v14;
      if (sessionActivityRecord == v11 && self->_hostedWindow != 0)
      {
        double v38 = sessionActivityRecord;
        id v39 = v9;
        double v41 = v11;
        CGFloat v43 = (void *)v14;
        id v40 = v8;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v17 = v9;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(v17);
              }
              double v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              id v23 = [v17 objectForKey:v22];
              double v24 = [v23 view];
              id v25 = [v24 _window];

              if (v25 == self->_hostedWindow) {
                objc_msgSend(v43, "_setConfiguration:forButton:", v22, objc_msgSend(v22, "_button"));
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v54 count:16];
          }
          while (v19);
        }

        id v9 = v39;
        id v8 = v40;
        objc_super v11 = v41;
        id v15 = v43;
        sessionActivityRecord = v38;
      }
      SEL v26 = (void *)[v15 copy];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_physicalButtonInteractionArbiter_didUpdateResolvedConfigurations_inActiveViewServiceSession____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v28 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          CGFloat v42 = v11;
          BOOL v29 = sessionActivityRecord == v11;
          double v30 = NSString;
          BOOL v31 = self;
          double v32 = v28;
          double v33 = (objc_class *)objc_opt_class();
          double v34 = NSStringFromClass(v33);
          double v35 = [v30 stringWithFormat:@"<%@: %p>", v34, v31];

          id v36 = v35;
          BOOL v37 = [v26 succinctDescription];
          *(_DWORD *)buf = 138412802;
          CGRect v49 = v35;
          __int16 v50 = 1024;
          BOOL v51 = v29;
          objc_super v11 = v42;
          __int16 v52 = 2112;
          CGRect v53 = v37;
          _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Notifying view service host of resolved configurations update: self: %@; isMostActiveService: %d; configurations: %@",
            buf,
            0x1Cu);
        }
      }
      objc_msgSend(self->_remoteViewControllerProxyToOperator, "__viewServiceDidUpdateResolvedPhysicalButtonConfigurations:", v26);
    }
  }
}

- (void)__hostDidReceivePhysicalButtonBSAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &__hostDidReceivePhysicalButtonBSAction____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v9 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v10 = NSString;
        objc_super v11 = self;
        id v12 = (objc_class *)objc_opt_class();
        int64_t v13 = NSStringFromClass(v12);
        uint64_t v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];
      }
      else
      {
        uint64_t v14 = @"(nil)";
      }
      *(_DWORD *)buf = 138412546;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Received proxy physicalButtonBSAction from host: self: %@; physicalButtonBSAction: %@",
        buf,
        0x16u);
    }
  }
  id v6 = [(UIWindow *)self->_hostedWindow _eventRoutingScene];
  uint64_t v7 = [v6 _physicalButtonInteractionArbiter];
  id v8 = (void *)v7;
  if (v7) {
    -[_UIPhysicalButtonInteractionArbiter _handleBSAction:](v7, v4);
  }
}

- (void)__hostHomeAffordanceFrameIntersectionDidChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &__hostHomeAffordanceFrameIntersectionDidChange____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    objc_super v11 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      id v12 = NSStringFromCGRect(v23);
      if (self)
      {
        int64_t v13 = NSString;
        uint64_t v14 = self;
        id v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        __int16 v17 = [v13 stringWithFormat:@"<%@: %p>", v16, v14];
      }
      else
      {
        __int16 v17 = @"(nil)";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      SEL v21 = v17;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Received homeAffordanceFrameIntersectionDidChange from host: %{public}@; self: %{public}@",
        buf,
        0x16u);
    }
  }
  id v9 = [(UIWindow *)self->_hostedWindow _windowHostingScene];
  id v10 = [v9 _homeAffordanceSceneNotifier];

  if (v10) {
    -[_UIHomeAffordanceSceneNotifier _homeAffordanceLegacyViewServiceUpdateSource:frameDidChange:]((uint64_t)v10, self, x, y, width, height);
  }
}

- (void)__hostReceivedHomeAffordanceDoubleTapGestureDidSucceed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HomeAffordanceObservation", &__hostReceivedHomeAffordanceDoubleTapGestureDidSucceed____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v8 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v9 = NSString;
        id v10 = self;
        objc_super v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        int64_t v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];
      }
      else
      {
        int64_t v13 = @"(nil)";
      }
      *(_DWORD *)buf = 67109378;
      BOOL v15 = v3;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Received doubleTapGestureDidSucceed from host:  %d; self: %{public}@",
        buf,
        0x12u);
    }
  }
  id v6 = [(UIWindow *)self->_hostedWindow _windowHostingScene];
  uint64_t v7 = [v6 _homeAffordanceSceneNotifier];

  if (v7) {
    -[_UIHomeAffordanceSceneNotifier _homeAffordanceLegacyViewServiceUpdateSource:doubleTapGestureDidSucceed:](v7, self, v3);
  }
}

- (void)__intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
}

- (NSString)debugDescription
{
  if (os_variant_has_internal_diagnostics())
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIViewServiceViewControllerOperator;
    BOOL v5 = [(_UIViewServiceViewControllerOperator *)&v7 debugDescription];
    BOOL v3 = [v5 stringByAppendingFormat:@" hostBundleID=%@", self->_hostBundleID];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIViewServiceViewControllerOperator;
    BOOL v3 = [(_UIViewServiceViewControllerOperator *)&v6 debugDescription];
  }
  return (NSString *)v3;
}

- (double)_systemReferenceAngleFromHost
{
  return self->_systemReferenceAngleFromHost;
}

- (unint64_t)_systemReferenceAngleModeFromHost
{
  return self->_systemReferenceAngleModeFromHost;
}

- (_UIRemoteViewControllerSceneContext)_sceneContext
{
  return self->_sceneContext;
}

- (_UIViewServiceViewControllerOperatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIViewServiceViewControllerOperatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)_traitsWillChangeHandler
{
  return self->__traitsWillChangeHandler;
}

- (void)_setTraitsWillChangeHandler:(id)a3
{
}

- (id)_traitsDidChangeHandler
{
  return self->__traitsDidChangeHandler;
}

- (void)_setTraitsDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__traitsDidChangeHandler, 0);
  objc_storeStrong(&self->__traitsWillChangeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childRemoteContentRegistry, 0);
  objc_storeStrong((id *)&self->_sceneContext, 0);
  objc_storeStrong((id *)&self->_pseudoScene, 0);
  objc_storeStrong((id *)&self->_physicalButtonInteractionArbiterObserverToken, 0);
  objc_storeStrong((id *)&self->_hostedWindowActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_sessionActivityRecord, 0);
  objc_storeStrong((id *)&self->_blsFrameSpecifierModel, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_sheetClientConfiguration, 0);
  objc_storeStrong((id *)&self->_editAlertUndoManager, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitioningContext, 0);
  objc_destroyWeak((id *)&self->_dummyPopoverController);
  objc_destroyWeak((id *)&self->_displayedPopoverController);
  objc_storeStrong((id *)&self->_invalidationInvocation, 0);
  objc_storeStrong((id *)&self->_prepareForDisconnectionInvocation, 0);
  objc_storeStrong((id *)&self->_textServiceSession, 0);
  objc_storeStrong((id *)&self->_deputyRotationDelegates, 0);
  objc_storeStrong((id *)&self->_hostedWindow, 0);
  objc_storeStrong((id *)&self->_presentationControllerClassName, 0);
  objc_storeStrong((id *)&self->_localViewController, 0);
  objc_storeStrong((id *)&self->_pluginDisplayConfigurations, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxyToViewController, 0);
  objc_storeStrong(&self->_remoteViewControllerProxyToOperator, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_hostBundleID, 0);
  objc_storeStrong((id *)&self->_deferredToViewDidAppear, 0);
}

@end