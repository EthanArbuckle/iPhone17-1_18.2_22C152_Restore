@interface _UIRemoteViewController
+ (BOOL)__shouldHostRemoteTextEffectsWindow;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize;
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)_requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 service:(id)a6 connectionHandler:(id)a7;
+ (id)exportedInterface;
+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 connectionHandler:(id)a5;
+ (id)requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 connectionHandler:(id)a6;
+ (id)requestViewControllerWithService:(id)a3 connectionHandler:(id)a4;
+ (id)requestViewControllerWithService:(id)a3 traitCollection:(id)a4 connectionHandler:(id)a5;
+ (id)serviceViewControllerInterface;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken;
- (BKSTouchDeliveryPolicyAssertion)_touchDeliveryPolicyAssertion;
- (BOOL)__interdictServiceViewTouches;
- (BOOL)__isKindOfUIRemoteViewController;
- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4;
- (BOOL)__shouldRemoteViewControllerFenceOperations;
- (BOOL)_allowsConnection;
- (BOOL)_allowsShielding;
- (BOOL)_ignoreAppSupportedOrientations;
- (BOOL)_isAppProtectionLocked;
- (BOOL)_isHostingRemoteContent;
- (BOOL)_isUpdatingSize;
- (BOOL)_isUpdatingSizeInHost;
- (BOOL)_needsUnderflowPropertyUpdate;
- (BOOL)_requiresKeyboardWindowWhenFirstResponder;
- (BOOL)_serviceHasScrollToTopView;
- (BOOL)_shouldRemoteViewControllerFenceOriginChanges;
- (BOOL)_shouldUpdateRemoteTextEffectsWindow;
- (BOOL)_viewClipsToBounds;
- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3;
- (BOOL)_windowSceneIsKeyboardWindowScene:(uint64_t)a1;
- (BOOL)canBecomeFirstResponder;
- (BOOL)inheritsSecurity;
- (BOOL)observesLockNotifications;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersPointerLocked;
- (BOOL)serviceViewShouldShareTouchesWithHost;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldPropagateAppearanceCustomizations;
- (NSSet)_keyboardSceneLayers;
- (NSString)debugDescription;
- (NSString)serviceBundleIdentifier;
- (_UIRemoteViewService)_remoteViewService;
- (_UISheetPresentationControllerConfiguration)_proxySheetConfigurationBeforeDeferring;
- (_UISheetPresentationControllerConfiguration)_sheetConfiguration;
- (_UIZoomTransitionController)_ancestorZoomTransitionController;
- (id)_addAutoAllowedNotifications:(id)a3;
- (id)_cancelTouchesForCurrentEventInHostedContent;
- (id)_fenceForSynchronizedDrawing;
- (id)_hostedWindowServiceDeferringTarget;
- (id)_initWithViewServiceBundleIdentifier:(id)a3;
- (id)_multitaskingDragExclusionRects;
- (id)_sheetPresentationController;
- (id)_terminateWithError:(id)a3;
- (id)_timelineID;
- (id)_traitCollectionForServiceFromTraitCollection:(id)a3;
- (id)allowedNotifications;
- (id)disconnect;
- (id)forbiddenNotifications;
- (id)serviceViewControllerProxy;
- (id)serviceViewControllerProxyWithErrorHandler:(id)a3;
- (id)textEffectsWindowForServiceScreen;
- (int)_preferredStatusBarVisibility;
- (int)serviceProcessIdentifier;
- (int64_t)_preferredInterfaceOrientation;
- (int64_t)_preferredInterfaceOrientationForWindow:(id)a3;
- (int64_t)interfaceElementCategory;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)__didReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4;
- (void)__dismissTextServiceSessionAnimated:(BOOL)a3;
- (void)__handleFocusMovementAction:(id)a3;
- (void)__setInterdictServiceViewTouches:(BOOL)a3;
- (void)__setMediaOverridePID:(int)a3;
- (void)__setServiceMaxFrameSize:(CGSize)a3;
- (void)__setSupportedInterfaceOrientations:(id)a3;
- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3;
- (void)__showEditAlertViewWithToken:(int64_t)a3 canUndo:(BOOL)a4 canRedo:(BOOL)a5;
- (void)__showServiceForText:(id)a3 selectedTextRangeValue:(id)a4 type:(int64_t)a5 fromRectValue:(id)a6 replyHandler:(id)a7;
- (void)__showServiceForText:(id)a3 type:(int64_t)a4 fromRectValue:(id)a5 replyHandler:(id)a6;
- (void)__showServiceForType:(int64_t)a3 withContext:(id)a4 replyHandler:(id)a5;
- (void)__trampolineButtonPressData:(id)a3 canceled:(BOOL)a4;
- (void)__viewServiceAddSceneForwardingLayersForOwners:(id)a3;
- (void)__viewServiceDidChangeHasScrollToTopView:(BOOL)a3;
- (void)__viewServiceDidChangeKeyWindow:(BOOL)a3;
- (void)__viewServiceDidDropTouchEventForInsecurePresentation;
- (void)__viewServiceDidPromoteFirstResponderWithCompletionHandler:(id)a3;
- (void)__viewServiceDidUpdateClientToHostAction:(id)a3;
- (void)__viewServiceDidUpdateMultitaskingDragExclusionRects:(id)a3;
- (void)__viewServiceDidUpdatePreferredScreenEdgesDeferringSystemGestures:(unint64_t)a3;
- (void)__viewServiceDidUpdatePreferredStatusBarStyle:(int64_t)a3 preferredStatusBarVisibility:(int)a4 updateAnimation:(int64_t)a5 currentAnimationSettings:(id)a6;
- (void)__viewServiceDidUpdatePreferredUserInterfaceStyle:(int64_t)a3;
- (void)__viewServiceDidUpdatePreferredWhitePointAdaptationStyle:(int64_t)a3 animationSettings:(id)a4;
- (void)__viewServiceDidUpdatePrefersHomeIndicatorAutoHidden:(BOOL)a3;
- (void)__viewServiceDidUpdatePrefersPointerLocked:(BOOL)a3;
- (void)__viewServiceDidUpdateResolvedPhysicalButtonConfigurations:(id)a3;
- (void)__viewServiceDismissInteractionDidBeginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (void)__viewServiceDismissInteractionDidCancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4;
- (void)__viewServiceDismissInteractionDidDismissWithVelocity:(CGPoint)a3;
- (void)__viewServiceDismissInteractionDidIssueUpdate:(id)a3;
- (void)__viewServiceInstrinsicContentSizeDidChange:(CGSize)a3 fence:(id)a4;
- (void)__viewServicePopoverDidChangeContentSize:(CGSize)a3 animated:(BOOL)a4 fence:(id)a5 withReplyHandler:(id)a6;
- (void)__viewServicePreferredContentSizeDidChange:(CGSize)a3 fence:(id)a4;
- (void)__viewServiceRemoveSceneForwardingLayersForOwners:(id)a3;
- (void)__viewServiceSheetGrabberDidTriggerPrimaryAction;
- (void)__viewServiceSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
- (void)__viewServiceSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
- (void)__viewServiceSheetInteractionDraggingDidEnd;
- (void)__viewServiceSheetPresentationClientConfigurationDidChange:(id)a3 attributes:(id)a4;
- (void)__viewServiceWantsKeyboardEventsWithoutFirstResponderAndCompletionHandler:(id)a3;
- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationDidFinishSuspendSnapshot:(id)a3;
- (void)_applicationWillAddDeactivationReason:(id)a3;
- (void)_applicationWillDeactivate:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_awakeWithConnectionInfo:(id)a3;
- (void)_beginDeferringProxySheetConfigurationUpdates;
- (void)_beginObservingNotificationsForEventDeferringIfNeeded;
- (void)_beginObservingSceneMoveNotificationsIfNeeded;
- (void)_cancelProxiedEditAlertViewAnimated:(BOOL)a3;
- (void)_configureSizeViewConstraintsForWindow:(id)a3 interfaceOrientation:(int64_t)a4;
- (void)_didResignContentViewControllerOfPopover:(id)a3;
- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5;
- (void)_endDeferringProxySheetConfigurationUpdates;
- (void)_endDynamicButtonEventDeferringIfNeeded;
- (void)_endNoPresentingViewControllerAlertController:(id)a3;
- (void)_enhancedWindowingModeDidChange:(id)a3;
- (void)_firstResponderDidChange:(id)a3;
- (void)_hostDidEnterBackground:(id)a3;
- (void)_hostDidEvaluatePencilBarrelEventFocusForSceneTransition:(id)a3;
- (void)_hostSceneDidEnterBackground:(id)a3;
- (void)_hostSceneWillEnterForeground:(id)a3;
- (void)_hostWillEnterForeground:(id)a3;
- (void)_initializeAccessibilityPortInformation;
- (void)_intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4;
- (void)_movedToParentSceneWithSettings:(id)a3;
- (void)_noteWindowState:(BOOL)a3;
- (void)_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:(id)a3;
- (void)_objc_initiateDealloc;
- (void)_parentSceneDidUpdateWithDiff:(id)a3;
- (void)_pencilBarrelEventFocusEvaluatedForSceneTransition:(id)a3;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)_physicalButtonProxyInteraction:(id)a3 didReceiveBSAction:(id)a4;
- (void)_prepareTouchDeliveryPolicy;
- (void)_referenceDisplayModeStatusDidChange:(id)a3;
- (void)_removeTextEffectsRemoteViews;
- (void)_restoreTextEffectsRemoteView;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_screenDidConnect:(id)a3;
- (void)_screenDidDisconnect:(id)a3;
- (void)_screenDidUpdate:(id)a3;
- (void)_screenDidUpdateCapture:(id)a3;
- (void)_scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_serviceWantsKeyboardEventsWithPromotedFirstResponder:(BOOL)a3 completionHandler:(id)a4;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5;
- (void)_setIsUpdatingSize:(BOOL)a3;
- (void)_setIsUpdatingSizeInHost:(BOOL)a3;
- (void)_setSecurityModeForViewsLayer;
- (void)_setSheetConfiguration:(id)a3;
- (void)_setShouldUpdateRemoteTextEffectsWindow:(BOOL)a3;
- (void)_setTouchDeliveryPolicyAssertion:(id)a3;
- (void)_setUpHomeAffordanceObserverInteractionForViewIfNeeded:(id)a3;
- (void)_setViewClipsToBounds:(BOOL)a3;
- (void)_setWantsKeyboardEnvironmentEventDeferring:(BOOL)a3;
- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3;
- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5;
- (void)_sheetInteractionDraggingDidEnd;
- (void)_snapshotAndRemoveTextEffectsRemoteView;
- (void)_statusBarHeightDidChange:(id)a3;
- (void)_statusBarOrientationDidChange:(id)a3;
- (void)_synchronizeAnimationsInActionsIfNecessary:(id)a3;
- (void)_systemApplicationDidUnlock:(id)a3;
- (void)_systemApplicationWillLock:(id)a3;
- (void)_systemReferenceAngleDidChange:(id)a3;
- (void)_terminateUnconditionallyThen:(id)a3;
- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_uirvc_applicationKeyWindowWillChange:(id)a3;
- (void)_uirvc_keyboardWindowSceneSettingsSceneWillChange:(id)a3;
- (void)_uirvc_windowBecameKey:(id)a3;
- (void)_uirvc_windowDidMoveToScene:(id)a3;
- (void)_uirvc_windowResignedKey:(id)a3;
- (void)_uirvc_windowWillMoveToScene:(id)a3;
- (void)_updateAncestorZoomTransitionControllerWithWindow:(id)a3;
- (void)_updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:(void *)a3 newResolvedConfigurations:;
- (void)_updateLockStatusHostingVisibility;
- (void)_updateParentHostingRegistryIfNecessaryForWindow:(uint64_t)a1;
- (void)_updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:(id)a3;
- (void)_updateServiceSceneContext;
- (void)_updateTintColor;
- (void)_updateTouchGrabbingView;
- (void)_updateUnderflowProperties;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)_viewServiceHostDidBecomeActive:(id)a3;
- (void)_viewServiceHostWillDeactivate:(id)a3;
- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6;
- (void)_willBecomeContentViewControllerOfPopover:(id)a3;
- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)createAppProtectionShieldView;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)dimmingViewWasTapped:(id)a3;
- (void)loadView;
- (void)performReplyActionsInsideSynchronousReply:(id)a3;
- (void)presentAppProtectionShieldIfServiceCurrentlyRequiresAuth;
- (void)presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled;
- (void)presentAppProtectionShieldView;
- (void)removeAppProtectionShieldView;
- (void)requestAppProtectionAuthIfNecessary;
- (void)setAllowedNotifications:(id)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setObservesLockNotifications:(BOOL)a3;
- (void)setServiceViewShouldShareTouchesWithHost:(BOOL)a3;
- (void)set_ancestorZoomTransitionController:(id)a3;
- (void)set_proxySheetConfigurationBeforeDeferring:(id)a3;
- (void)setupAppProtectionIfNecessary;
- (void)shieldViewUnlockButtonPressed:(id)a3;
- (void)synchronizeAnimationsInActions:(id)a3;
- (void)synchronizeAnimationsInActionsWithSynchronousReply:(id)a3;
- (void)updateTouchInterdictionViewLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIRemoteViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_endDynamicButtonEventDeferringIfNeeded
{
  if (a1 && *(void *)(a1 + 1272))
  {
    id v3 = [NSString stringWithFormat:@"%@: %p: end dynamic button deferring", objc_opt_class(), a1];
    -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:](*(void *)(a1 + 1272), (uint64_t)v3);
    v2 = *(void **)(a1 + 1272);
    *(void *)(a1 + 1272) = 0;
  }
}

- (void)_updateParentHostingRegistryIfNecessaryForWindow:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 _remoteContentParent];
    id obj = [v3 _childRemoteContentRegistry];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1432));
    if (obj != WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 1432));
      [v5 removeChildViewService:a1];

      [obj addChildViewService:a1];
      objc_storeWeak((id *)(a1 + 1432), obj);
    }
  }
}

- (BOOL)__isKindOfUIRemoteViewController
{
  return 1;
}

+ (id)requestViewController:(id)a3 fromServiceWithBundleIdentifier:(id)a4 connectionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[UIScreen mainScreen];
  v12 = [v11 traitCollection];

  v13 = [a1 _requestViewController:v10 traitCollection:v12 fromServiceWithBundleIdentifier:v9 service:0 connectionHandler:v8];

  return v13;
}

+ (id)requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 connectionHandler:(id)a6
{
  return (id)[a1 _requestViewController:a3 traitCollection:a4 fromServiceWithBundleIdentifier:a5 service:0 connectionHandler:a6];
}

+ (id)requestViewControllerWithService:(id)a3 connectionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIScreen mainScreen];
  id v9 = [v8 traitCollection];

  id v10 = [a1 _requestViewController:0 traitCollection:v9 fromServiceWithBundleIdentifier:0 service:v7 connectionHandler:v6];

  return v10;
}

+ (id)requestViewControllerWithService:(id)a3 traitCollection:(id)a4 connectionHandler:(id)a5
{
  return (id)[a1 _requestViewController:0 traitCollection:a4 fromServiceWithBundleIdentifier:0 service:a3 connectionHandler:a5];
}

+ (id)_requestViewController:(id)a3 traitCollection:(id)a4 fromServiceWithBundleIdentifier:(id)a5 service:(id)a6 connectionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [objc_alloc((Class)a1) _initWithViewServiceBundleIdentifier:v14];
  v18 = (void *)v17;
  if (v15) {
    objc_storeStrong((id *)(v17 + 992), a6);
  }
  v19 = [a1 serviceViewControllerInterface];
  v20 = [a1 exportedInterface];
  v21 = +[_UIViewServiceViewControllerDeputyXPCInterface interfaceWithExportedInterface:v19 remoteViewControllerInterface:v20];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke;
  aBlock[3] = &unk_1E530D7E0;
  v35 = v36;
  id v22 = v16;
  id v34 = v22;
  id v23 = v18;
  id v33 = v23;
  v24 = _Block_copy(aBlock);
  if (v15) {
    +[_UIRemoteViewControllerConnectionRequest requestViewControllerWithService:v15 traitCollection:v13 exportedHostingObject:v23 remoteViewControllerClass:objc_opt_class() serviceViewControllerDeputyInterface:v21 connectionHandler:v24];
  }
  else {
  v25 = +[_UIRemoteViewControllerConnectionRequest requestViewController:v12 fromServiceWithBundleIdentifier:v14 traitCollection:v13 exportedHostingObject:v23 serviceViewControllerDeputyInterface:v21 connectionHandler:v24];
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_350;
  v29[3] = &unk_1E52FA9B0;
  id v26 = v25;
  id v30 = v26;
  v31 = v36;
  v27 = +[_UIAsyncInvocation invocationWithBlock:v29];

  _Block_object_dispose(v36, 8);
  return v27;
}

- (id)_initWithViewServiceBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  id v5 = [(UIViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceBundleIdentifier = v5->_serviceBundleIdentifier;
    v5->_serviceBundleIdentifier = (NSString *)v6;

    v5->__viewClipsToBounds = 1;
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      -[UIViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 480.0);
    }
    -[UIViewController setContentSizeForViewInPopover:](v5, "setContentSizeForViewInPopover:", 320.0, 480.0);
    id v8 = v5;
  }

  return v5;
}

- (void)_awakeWithConnectionInfo:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  self->_isUpdatingSize = 0;
  self->_isUpdatingSizeInHost = 0;
  proxySheetConfigurationBeforeDeferring = self->__proxySheetConfigurationBeforeDeferring;
  self->__proxySheetConfigurationBeforeDeferring = 0;

  uint64_t v6 = [v4 interface];
  serviceInterface = self->_serviceInterface;
  self->_serviceInterface = v6;

  id v8 = self->_serviceInterface;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke;
  v85[3] = &unk_1E52EC430;
  objc_copyWeak(&v86, location);
  [(_UIViewServiceInterface *)v8 setTerminationHandler:v85];
  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  callerID = self->_callerID;
  self->_callerID = v9;

  v11 = [v4 serviceViewControllerControlMessageProxy];
  id serviceViewControllerControlMessageProxy = self->_serviceViewControllerControlMessageProxy;
  self->_id serviceViewControllerControlMessageProxy = v11;

  id v13 = [v4 serviceViewControllerProxy];

  if (v13)
  {
    id v14 = [v4 serviceViewControllerProxy];
    id v15 = +[_UIViewServiceReplyControlProxy proxyWithTarget:v14];

    id v16 = +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:v15 controlMessageTarget:self->_serviceViewControllerControlMessageProxy];
    id serviceViewControllerProxy = self->_serviceViewControllerProxy;
    self->_id serviceViewControllerProxy = v16;
  }
  v18 = [v4 viewControllerOperatorProxy];
  v19 = +[_UIViewServiceReplyControlProxy proxyWithTarget:v18];

  v20 = [v4 viewControllerOperatorProxy];
  v21 = +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:v19 controlMessageTarget:v20];
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  self->_id viewControllerOperatorProxy = v21;

  objc_msgSend(self->_viewControllerOperatorProxy, "__hostReadyToReceiveMessagesFromServiceViewController");
  _UIRemoteViewControllerHalfDisconnectionInvocationForProxy(self->_viewControllerOperatorProxy);
  id v23 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  viewControllerOperatorHalfDisconnectionInvocation = self->_viewControllerOperatorHalfDisconnectionInvocation;
  self->_viewControllerOperatorHalfDisconnectionInvocation = v23;

  v25 = [v4 textEffectsOperatorProxy];

  if (v25)
  {
    id v26 = [v4 textEffectsOperatorProxy];
    v27 = +[_UIViewServiceReplyControlProxy proxyWithTarget:v26];

    v28 = [v4 textEffectsOperatorProxy];
    v29 = +[_UIViewServiceImplicitAnimationEncodingProxy proxyEncodingAnimationsForTarget:v27 controlMessageTarget:v28];
    id textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
    self->_id textEffectsOperatorProxy = v29;
  }
  else
  {
    v27 = self->_textEffectsOperatorProxy;
    self->_id textEffectsOperatorProxy = 0;
  }

  _UIRemoteViewControllerHalfDisconnectionInvocationForProxy(self->_textEffectsOperatorProxy);
  v31 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  textEffectsOperatorHalfDisconnectionInvocation = self->_textEffectsOperatorHalfDisconnectionInvocation;
  self->_textEffectsOperatorHalfDisconnectionInvocation = v31;

  id v33 = [v4 serviceViewControllerSupportedInterfaceOrientations];
  serviceViewControllerSupportedInterfaceOrientations = self->_serviceViewControllerSupportedInterfaceOrientations;
  self->_serviceViewControllerSupportedInterfaceOrientations = v33;

  v35 = [v4 serviceAccessibilityServerPortWrapper];

  if (v35)
  {
    v36 = [v4 serviceAccessibilityServerPortWrapper];
    mach_port_name_t v37 = [v36 extractPortAndIKnowWhatImDoingISwear];

    if (v37 - 1 <= 0xFFFFFFFD)
    {
      if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v37, 0, 1)) {
        unsigned int v38 = 0;
      }
      else {
        unsigned int v38 = v37;
      }
      self->_serviceAccessibilityServerPort = v38;
    }
  }
  self->_preferredStatusBarStyle = [v4 preferredStatusBarStyle];
  self->_preferredStatusBarVisibility = [v4 preferredStatusBarVisibility];
  v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v39 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
  if ([(id)UIApp _isSpringBoard] && !_UIDeviceNativeUserInterfaceIdiom()) {
    v40 = (const NSNotificationName *)UITextEffectsWindowViewControllerWillRotateNotification;
  }
  else {
    v40 = &UIApplicationDidChangeStatusBarOrientationNotification;
  }
  [v39 addObserver:self selector:sel__statusBarOrientationDidChange_ name:*v40 object:0];
  [v39 addObserver:self selector:sel__statusBarHeightDidChange_ name:@"UIApplicationStatusBarHeightChangedNotification" object:0];
  [v39 addObserver:self selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  [v39 addObserver:self selector:sel__sceneWillEnterForeground_ name:@"UISceneWillEnterForegroundNotification" object:0];
  [v39 addObserver:self selector:sel__hostWillEnterForeground_ name:0x1ED180300 object:0];
  [v39 addObserver:self selector:sel__hostSceneWillEnterForeground_ name:0x1ED180340 object:0];
  [v39 addObserver:self selector:sel__pencilBarrelEventFocusEvaluatedForSceneTransition_ name:@"_UIPencilEventDidEvaluateBarrelFocusForSceneTransition" object:0];
  [v39 addObserver:self selector:sel__hostDidEvaluatePencilBarrelEventFocusForSceneTransition_ name:@"_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition" object:0];
  [v39 addObserver:self selector:sel__applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v39 addObserver:self selector:sel__sceneDidEnterBackground_ name:@"UISceneDidEnterBackgroundNotification" object:0];
  [v39 addObserver:self selector:sel__hostDidEnterBackground_ name:0x1ED1802E0 object:0];
  [v39 addObserver:self selector:sel__hostSceneDidEnterBackground_ name:0x1ED180320 object:0];
  [v39 addObserver:self selector:sel__applicationDidFinishSuspendSnapshot_ name:@"_UIApplicationDidFinishSuspensionSnapshotNotification" object:0];
  [v39 addObserver:self selector:sel__screenDidUpdate_ name:@"_UIScreenDisplayConfigurationUpdatedNotification" object:0];
  [v39 addObserver:self selector:sel__referenceDisplayModeStatusDidChange_ name:@"UIScreenReferenceDisplayModeStatusDidChangeNotification" object:0];
  [v39 addObserver:self selector:sel__enhancedWindowingModeDidChange_ name:@"_UIWindowSceneEnhancedWindowingModeChanged" object:0];
  [v39 addObserver:self selector:sel__systemReferenceAngleDidChange_ name:*MEMORY[0x1E4FB3528] object:0];
  [v39 addObserver:self selector:sel__screenDidConnect_ name:@"_UIScreenDidConnectNotification" object:0];
  [v39 addObserver:self selector:sel__screenDidDisconnect_ name:@"_UIScreenDidDisconnectNotification" object:0];
  [v39 addObserver:self selector:sel__screenDidUpdateCapture_ name:@"UIScreenCapturedDidChangeNotification" object:0];
  v41 = +[_UISizeTrackingView viewWithRemoteViewController:self viewControllerOperatorProxy:self->_viewControllerOperatorProxy textEffectsOperatorProxy:self->_textEffectsOperatorProxy];
  sizeTrackingView = self->_sizeTrackingView;
  self->_sizeTrackingView = v41;

  [(UIViewController *)self loadViewIfRequired];
  [(_UIRemoteViewController *)self _setUpHomeAffordanceObserverInteractionForViewIfNeeded:self->_sizeTrackingView];
  if (self->_proxyPhysicalButtonInteraction) {
    -[UIView addInteraction:](self->_sizeTrackingView, "addInteraction:");
  }
  v43 = [v4 hostedWindowHostingHandle];
  v44 = +[_UIRemoteView viewWithHostedWindowHostingHandle:v43];
  serviceViewControllerRemoteView = self->_serviceViewControllerRemoteView;
  self->_serviceViewControllerRemoteView = v44;

  [(_UIRemoteView *)self->_serviceViewControllerRemoteView setRemoteViewController:self];
  [(UIView *)self->_sizeTrackingView addSubview:self->_serviceViewControllerRemoteView];
  v46 = +[UIScreen mainScreen];
  v47 = [v46 displayIdentity];
  lastNotifiedServiceScreenDisplayIdentity = self->_lastNotifiedServiceScreenDisplayIdentity;
  self->_lastNotifiedServiceScreenDisplayIdentity = v47;

  if (UISelfTaskHasEntitlement(@"com.apple.QuartzCore.secure-mode"))
  {
    v49 = [(_UILayerHostView *)self->_serviceViewControllerRemoteView layerHost];
    [v49 setStopsSecureSuperlayersValidation:1];
  }
  v50 = [v4 textEffectsWindowAboveStatusBarHostingHandle];

  if (v50)
  {
    v51 = [v4 textEffectsWindowAboveStatusBarHostingHandle];
    v52 = +[_UIRemoteView viewWithHostedWindowHostingHandle:v51];
    textEffectsAboveStatusBarRemoteView = self->_textEffectsAboveStatusBarRemoteView;
    self->_textEffectsAboveStatusBarRemoteView = v52;

    [(_UIRemoteView *)self->_textEffectsAboveStatusBarRemoteView setRemoteViewController:self];
  }
  v54 = [v4 textEffectsWindowHostingHandle];

  if (v54)
  {
    v55 = [v4 textEffectsWindowHostingHandle];
    v56 = +[_UIRemoteView viewWithHostedWindowHostingHandle:v55];
    fullScreenTextEffectsRemoteView = self->_fullScreenTextEffectsRemoteView;
    self->_fullScreenTextEffectsRemoteView = v56;

    [(_UIRemoteView *)self->_fullScreenTextEffectsRemoteView setRemoteViewController:self];
  }
  v58 = [v4 remoteKeyboardsWindowHostingHandle];

  if (v58)
  {
    v59 = [v4 remoteKeyboardsWindowHostingHandle];
    v60 = +[_UIRemoteView viewWithHostedWindowHostingHandle:v59];
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    self->_remoteKeyboardRemoteView = v60;

    [(_UIRemoteView *)self->_remoteKeyboardRemoteView setRemoteViewController:self];
  }
  self->__shouldUpdateRemoteTextEffectsWindow = objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow");
  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      v62 = [(UIViewController *)self _window];
      v63 = [v62 windowScene];
      v64 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v63 forViewService:1];
      if ([v64 _isHostedInAnotherProcess])
      {
        unint64_t v65 = [(id)UIApp _frontMostAppOrientation] - 5;

        if (v65 >= 0xFFFFFFFFFFFFFFFELL) {
          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    v66 = [(UIViewController *)self _window];
    v67 = [v66 windowScene];
    v68 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v67 forViewService:1];

    v69 = [v68 rootViewController];
    v70 = [v69 view];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_2;
    aBlock[3] = &unk_1E52DCB30;
    id v71 = v70;
    id v82 = v71;
    id v72 = v68;
    id v83 = v72;
    v84 = self;
    v73 = _Block_copy(aBlock);
    v74 = v73;
    if (v69) {
      [v69 performWithSafeTransitionFrames:v73];
    }
    else {
      (*((void (**)(void *))v73 + 2))(v73);
    }
  }
LABEL_36:
  v75 = (_UISceneKeyboardProxyLayerForwardingPresentationViewService *)-[_UISceneKeyboardProxyLayerForwardingPresentationViewService initWithRemoteViewController:]((id *)[_UISceneKeyboardProxyLayerForwardingPresentationViewService alloc], self);
  keyboardProxyPresentationEnvironment = self->_keyboardProxyPresentationEnvironment;
  self->_keyboardProxyPresentationEnvironment = v75;

  v77 = +[_UISceneKeyboardProxyLayerForwardingManager sharedInstance];
  [v77 trackPresentationEnvironment:self->_keyboardProxyPresentationEnvironment];

  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_3;
  v80[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v80[4] = self;
  v78 = +[_UIAsyncInvocation invocationWithBlock:v80];
  terminationInvocation = self->_terminationInvocation;
  self->_terminationInvocation = v78;

  objc_destroyWeak(&v86);
  objc_destroyWeak(location);
}

- (void)loadView
{
  sizeTrackingView = self->_sizeTrackingView;
  v3.receiver = self;
  v3.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v3 setView:sizeTrackingView];
}

- (id)_fenceForSynchronizedDrawing
{
  if ([(_UIRemoteViewController *)self __shouldRemoteViewControllerFenceOperations])
  {
    objc_super v3 = (void *)MEMORY[0x18C108260]();
    if ([(UIViewController *)self _appearState]
      && [(_UISizeTrackingView *)self->_sizeTrackingView _fencingEffectsAreVisible])
    {
      id v4 = [(UIView *)self->_sizeTrackingView _window];
      id v5 = [v4 _windowHostingScene];
      uint64_t v6 = [v5 _synchronizedDrawingFence];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)_synchronizeAnimationsInActionsIfNecessary:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(_UIRemoteViewController *)self __shouldRemoteViewControllerFenceOperations])
  {
    [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v4];
  }
  else
  {
    v4[2]();
  }
}

- (void)synchronizeAnimationsInActions:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)MEMORY[0x18C108260]();
  uint64_t v6 = [(_UIRemoteViewController *)self _fenceForSynchronizedDrawing];
  if (v6)
  {
    if (_UIUpdateCycleEnabled())
    {
      __n128 v10 = 0uLL;
      uint64_t v11 = 0;
      _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, 0, &v10);
      id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
      __n128 v8 = v10;
      uint64_t v9 = v11;
      objc_msgSend(viewControllerOperatorProxy, "__participateInSystemAnimationFence:timing:", v6, &v8);
    }
    else
    {
      objc_msgSend(self->_viewControllerOperatorProxy, "__participateInSystemAnimationFence:", v6);
    }
    v4[2](v4);
    objc_msgSend(self->_viewControllerOperatorProxy, "__finishParticipatingInSystemAnimationFence:", v6);
  }
  else
  {
    v4[2](v4);
  }
}

- (void)synchronizeAnimationsInActionsWithSynchronousReply:(id)a3
{
  id v4 = _Block_copy(a3);
  [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v4];
}

- (void)performReplyActionsInsideSynchronousReply:(id)a3
{
  objc_super v3 = (void (**)(void))_Block_copy(a3);
  v3[2]();
}

- (NSString)serviceBundleIdentifier
{
  serviceBundleIdentifier = self->_serviceBundleIdentifier;
  if (serviceBundleIdentifier)
  {
    objc_super v3 = serviceBundleIdentifier;
  }
  else
  {
    objc_super v3 = [(_UIRemoteViewService *)self->_remoteViewService identifier];
  }
  return v3;
}

- (int)serviceProcessIdentifier
{
  return [(_UIViewServiceInterface *)self->_serviceInterface servicePID];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_serviceInterface;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result serviceAuditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)setInheritsSecurity:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UIRemoteView _setInheritsSecurity:](self->_serviceViewControllerRemoteView, "_setInheritsSecurity:");
  [(_UIRemoteView *)self->_fullScreenTextEffectsRemoteView _setInheritsSecurity:v3];
  [(_UIRemoteView *)self->_textEffectsAboveStatusBarRemoteView _setInheritsSecurity:v3];
  remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
  [(_UIRemoteView *)remoteKeyboardRemoteView _setInheritsSecurity:v3];
}

- (BOOL)inheritsSecurity
{
  return [(_UIRemoteView *)self->_serviceViewControllerRemoteView _inheritsSecurity];
}

- (void)_setSecurityModeForViewsLayer
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v5 _setSecurityModeForViewsLayer];
  if ([(_UIRemoteViewController *)self inheritsSecurity])
  {
    BOOL v3 = [(UIViewController *)self view];
    id v4 = [v3 layer];
    [v4 setSecurityMode:*MEMORY[0x1E4F3A448]];
  }
}

- (void)setAllowedNotifications:(id)a3
{
  id v4 = [(_UIRemoteViewController *)self _addAutoAllowedNotifications:a3];
  allowedNotifications = self->_allowedNotifications;
  self->_allowedNotifications = v4;
  uint64_t v6 = v4;

  objc_msgSend(self->_textEffectsOperatorProxy, "__setHostAllowedNotifications:", self->_allowedNotifications);
}

- (id)allowedNotifications
{
  return self->_allowedNotifications;
}

- (id)forbiddenNotifications
{
  return 0;
}

- (id)_addAutoAllowedNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
  }
  objc_super v5 = -[UIViewController _requiredNotificationsForRemoteServices](self);
  if (v5)
  {
    uint64_t v6 = (void *)[v4 mutableCopy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v5;
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
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v13 = [(_UIRemoteViewController *)self forbiddenNotifications];
  if ([v13 count])
  {
    if (!v6) {
      uint64_t v6 = (void *)[v4 mutableCopy];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          if (objc_msgSend(v6, "containsObject:", v19, (void)v23)) {
            [v6 removeObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
  }
  if (v6) {
    v20 = v6;
  }
  else {
    v20 = v4;
  }
  id v21 = v20;

  return v21;
}

- (void)__setMediaOverridePID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(id)UIApp isFrontBoard])
  {
    id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
    objc_msgSend(viewControllerOperatorProxy, "__setMediaOverridePID:", v3);
  }
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 1;
}

- (BOOL)_shouldRemoteViewControllerFenceOriginChanges
{
  return 1;
}

- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4
{
  return [(_UIRemoteViewController *)self _shouldRemoteViewControllerFenceOriginChanges]|| a3->var0 != 4;
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 1;
}

- (BOOL)_shouldUpdateRemoteTextEffectsWindow
{
  return self->__shouldUpdateRemoteTextEffectsWindow;
}

- (void)_setShouldUpdateRemoteTextEffectsWindow:(BOOL)a3
{
  self->__shouldUpdateRemoteTextEffectsWindow = a3;
  [(_UISizeTrackingView *)self->_sizeTrackingView _updateTextEffectsGeometriesImmediately];
}

- (int64_t)_preferredInterfaceOrientation
{
  uint64_t v3 = [(UIViewController *)self _window];
  int64_t v4 = [(_UIRemoteViewController *)self _preferredInterfaceOrientationForWindow:v3];

  return v4;
}

- (int64_t)_preferredInterfaceOrientationForWindow:(id)a3
{
  if (!a3) {
    return 0;
  }
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "interfaceOrientation"));
  int v7 = [v5 _windowOwnsInterfaceOrientation];

  if (v7
    && ![(NSArray *)self->_serviceViewControllerSupportedInterfaceOrientations containsObject:v6])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)UIApp, "_expectedViewOrientation"));

    if ([(NSArray *)self->_serviceViewControllerSupportedInterfaceOrientations containsObject:v8]) {
      goto LABEL_8;
    }
    if ([(id)UIApp _isSpringBoard])
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)UIApp, "activeInterfaceOrientation"));

      uint64_t v8 = (void *)v9;
    }
    if ([(NSArray *)self->_serviceViewControllerSupportedInterfaceOrientations containsObject:v8])
    {
LABEL_8:
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v6 = [(NSArray *)self->_serviceViewControllerSupportedInterfaceOrientations firstObject];
    }
  }
  int64_t v11 = [v6 integerValue];

  return v11;
}

- (void)_statusBarOrientationDidChange:(id)a3
{
  if (![(_UIRemoteViewController *)self _isUpdatingSize])
  {
    int64_t v4 = [(UIViewController *)self _window];

    if (v4)
    {
      id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
      int64_t v6 = [(_UIRemoteViewController *)self _preferredInterfaceOrientation];
      objc_msgSend(viewControllerOperatorProxy, "__hostDidChangeStatusBarOrientationToInterfaceOrientation:", v6);
    }
  }
}

- (void)_statusBarHeightDidChange:(id)a3
{
  id v4 = a3;
  if (![(_UIRemoteViewController *)self _isUpdatingSize])
  {
    id v5 = [v4 userInfo];
    int64_t v6 = [v5 objectForKeyedSubscript:@"UIApplicationStatusBarHeightChangedDurationKey"];
    [v6 doubleValue];
    double v8 = v7;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__statusBarHeightDidChange___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:v8];
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59___UIRemoteViewController__applicationWillEnterForeground___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v3];
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  if (([v5 isEqualToString:@"UISceneWillEnterForegroundNotification"] & 1) == 0)
  {

LABEL_5:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__sceneWillEnterForeground___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v9];
    [(_UIRemoteViewController *)self requestAppProtectionAuthIfNecessary];
    goto LABEL_6;
  }
  int64_t v6 = [v4 object];
  double v7 = [(UIViewController *)self _window];
  double v8 = [v7 windowScene];

  if (v6 == v8) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_hostWillEnterForeground:(id)a3
{
  id v8 = a3;
  id v4 = [(UIViewController *)self view];
  id v5 = [v8 object];
  int64_t v6 = [v5 view];
  int v7 = [v4 isDescendantOfView:v6];

  if (v7) {
    [(_UIRemoteViewController *)self _applicationWillEnterForeground:v8];
  }
}

- (void)_hostSceneWillEnterForeground:(id)a3
{
  id v9 = a3;
  id v4 = [(UIViewController *)self view];
  id v5 = [v4 window];
  int64_t v6 = [v9 object];
  int v7 = [v6 parentViewController];
  id v8 = [v7 _window];

  if (v5 == v8) {
    [(_UIRemoteViewController *)self _sceneWillEnterForeground:v9];
  }
}

- (void)_pencilBarrelEventFocusEvaluatedForSceneTransition:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(UIViewController *)self _existingView];
  id v5 = [v4 _window];
  id v6 = [v5 _eventRoutingScene];

  if (v6 && v7 == v6) {
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidEvaluatePencilBarrelEventFocusForSceneTransition");
  }
}

- (void)_hostDidEvaluatePencilBarrelEventFocusForSceneTransition:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self view];
  id v6 = [v5 _window];
  id v7 = [v4 object];

  id v8 = [v7 parentViewController];
  id v9 = [v8 _window];

  if (v6 == v9)
  {
    id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
    objc_msgSend(viewControllerOperatorProxy, "__hostDidEvaluatePencilBarrelEventFocusForSceneTransition");
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidEnterBackground", a3);
  [(_UIRemoteViewController *)self _cancelProxiedEditAlertViewAnimated:0];
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v8 = a3;
  id v4 = [v8 name];
  if ([v4 isEqualToString:@"UISceneDidEnterBackgroundNotification"])
  {
    id v5 = [v8 object];
    id v6 = [(UIViewController *)self _window];
    id v7 = [v6 windowScene];

    if (v5 != v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostSceneDidEnterBackground");
  [(_UIRemoteViewController *)self presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled];
LABEL_6:
}

- (void)_hostDidEnterBackground:(id)a3
{
  id v8 = a3;
  id v4 = [(UIViewController *)self view];
  id v5 = [v8 object];
  id v6 = [v5 view];
  int v7 = [v4 isDescendantOfView:v6];

  if (v7) {
    [(_UIRemoteViewController *)self _applicationDidEnterBackground:v8];
  }
}

- (void)_hostSceneDidEnterBackground:(id)a3
{
  id v9 = a3;
  id v4 = [(UIViewController *)self view];
  id v5 = [v4 window];
  id v6 = [v9 object];
  int v7 = [v6 parentViewController];
  id v8 = [v7 _window];

  if (v5 == v8) {
    [(_UIRemoteViewController *)self _sceneDidEnterBackground:v9];
  }
}

- (void)_applicationDidFinishSuspendSnapshot:(id)a3
{
}

- (BOOL)_windowSceneIsKeyboardWindowScene:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    if (+[_UIRemoteKeyboards enabled]
      && [v4 _hasSettingsScene])
    {
      id v6 = [v4 screen];
      int v7 = +[UIWindowScene _keyboardWindowSceneForScreen:v6 create:0];
      BOOL v5 = v7 == v4;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)textEffectsWindowForServiceScreen
{
  v2 = [(UIViewController *)self _window];
  id v3 = [v2 windowScene];
  id v4 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v3 forViewService:1];

  return v4;
}

- (void)_restoreTextEffectsRemoteView
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  fullScreenTextEffectsSnapshotView = self->_fullScreenTextEffectsSnapshotView;
  if (fullScreenTextEffectsSnapshotView)
  {
    [(UIView *)fullScreenTextEffectsSnapshotView removeFromSuperview];
    id v4 = self->_fullScreenTextEffectsSnapshotView;
    self->_fullScreenTextEffectsSnapshotView = 0;
  }
  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    BOOL v5 = [(UIViewController *)self _window];
    id v6 = [v5 windowScene];

    if (self->_fullScreenTextEffectsRemoteView) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      id v8 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
      [v8 addSubview:self->_fullScreenTextEffectsRemoteView];
    }
    if (self->_textEffectsAboveStatusBarRemoteView)
    {
      id v9 = [(UIViewController *)self _window];
      uint64_t v10 = [v9 windowScene];
      int64_t v11 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v10 forViewService:1];
      [v11 addSubview:self->_textEffectsAboveStatusBarRemoteView];
    }
    if (+[UIKeyboard usesInputSystemUI])
    {
      if (!self->_callerID)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v18 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            int v19 = 138412290;
            v20 = self;
            _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v19, 0xCu);
          }
        }
        else
        {
          uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_restoreTextEffectsRemoteView___s_category) + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v19 = 138412290;
            v20 = self;
            _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v19, 0xCu);
          }
        }
      }
      uint64_t v12 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
      objc_msgSend(v12, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
    }
    else
    {
      if (!self->_remoteKeyboardRemoteView)
      {
LABEL_17:

        return;
      }
      uint64_t v12 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
      uint64_t v14 = [(_UIViewServiceInterface *)self->_serviceInterface servicePID];
      uint64_t v15 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
      uint64_t v16 = [v15 windowScene];
      [v12 addHostedWindowView:remoteKeyboardRemoteView fromPID:v14 forScene:v16 callerID:self->_callerID];
    }
    goto LABEL_17;
  }
}

- (void)_snapshotAndRemoveTextEffectsRemoteView
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB25ACC0 != -1) {
    dispatch_once(&qword_1EB25ACC0, &__block_literal_global_617);
  }
  if (!_MergedGlobals_68)
  {
    fullScreenTextEffectsSnapshotView = self->_fullScreenTextEffectsSnapshotView;
    if (fullScreenTextEffectsSnapshotView)
    {
      [(UIView *)fullScreenTextEffectsSnapshotView removeFromSuperview];
      id v4 = self->_fullScreenTextEffectsSnapshotView;
      self->_fullScreenTextEffectsSnapshotView = 0;
    }
    if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow")
      && [(_UIRemoteViewController *)self _shouldUpdateRemoteTextEffectsWindow])
    {
      BOOL v5 = +[UIWindow _applicationKeyWindow];
      id v6 = [(UIViewController *)self _window];
      BOOL v7 = [v6 windowScene];
      id v8 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v7 forViewService:1];

      id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      uint64_t v10 = v9;
      if (v5) {
        [v9 addObject:v5];
      }
      if (v8) {
        [v10 addObject:v8];
      }
      if ([v10 count])
      {
        [v8 bounds];
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        uint64_t v26 = *MEMORY[0x1E4F3A590];
        v27[0] = MEMORY[0x1E4F1CC28];
        int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        _UISnapshotWindowsAtViewRect(v10, v8, v19, v12, v14, v16, v18);
        v20 = (UIView *)objc_claimAutoreleasedReturnValue();

        [v8 bounds];
        -[UIView setFrame:](v20, "setFrame:");
        [(UIView *)v20 setUserInteractionEnabled:0];
        uint64_t v21 = [(UIViewController *)self _window];
        id v22 = [v21 windowScene];
        long long v23 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v22 forViewService:1];
        [v23 addSubview:v20];

        long long v24 = self->_fullScreenTextEffectsSnapshotView;
        self->_fullScreenTextEffectsSnapshotView = v20;
      }
      [(_UIRemoteViewController *)self _removeTextEffectsRemoteViews];
      long long v25 = [(UIViewController *)self _window];
      [(_UIRemoteViewController *)self _noteWindowState:v25 != 0];
    }
  }
}

- (void)_removeTextEffectsRemoteViews
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_fullScreenTextEffectsRemoteView removeFromSuperview];
  [(UIView *)self->_textEffectsAboveStatusBarRemoteView removeFromSuperview];
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          int v7 = 138412290;
          id v8 = self;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v7, 0xCu);
        }
      }
      else
      {
        BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_removeTextEffectsRemoteViews___s_category) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v7 = 138412290;
          id v8 = self;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", (uint8_t *)&v7, 0xCu);
        }
      }
    }
    id v3 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_msgSend(v3, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
  }
  else
  {
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    [(UIView *)remoteKeyboardRemoteView removeFromSuperview];
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  self->_snapshotTextEffectsAfterRotation = 0;
  [(_UIRemoteViewController *)self _restoreTextEffectsRemoteView];
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidBecomeActive");
  [(_UIRemoteViewController *)self _updateServiceSceneContext];
}

- (void)_applicationWillDeactivate:(id)a3
{
  id v6 = a3;
  if (qword_1EB25ACD0 != -1) {
    dispatch_once(&qword_1EB25ACD0, &__block_literal_global_426);
  }
  uint64_t v4 = qword_1EB25ACC8;
  BOOL v5 = [NSNumber numberWithInt:self->_applicationDeactivationReason];
  LOBYTE(v4) = [(id)v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [(_UIRemoteViewController *)self _snapshotAndRemoveTextEffectsRemoteView];
  }
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostWillResignActive");
}

- (void)_viewServiceHostWillDeactivate:(id)a3
{
}

- (void)_viewServiceHostDidBecomeActive:(id)a3
{
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  id v5 = [a3 userInfo];
  uint64_t v4 = [v5 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  self->_applicationDeactivationReason = [v4 intValue];
}

- (void)_systemApplicationWillLock:(id)a3
{
  self->_systemAppIsLocked = 1;
  [(_UIRemoteViewController *)self _updateLockStatusHostingVisibility];
}

- (void)_systemApplicationDidUnlock:(id)a3
{
  self->_systemAppIsLocked = 0;
  [(_UIRemoteViewController *)self _updateLockStatusHostingVisibility];
}

- (BOOL)observesLockNotifications
{
  return self->_observesLockNotifications;
}

- (void)setObservesLockNotifications:(BOOL)a3
{
  self->_observesLockNotifications = a3;
  [(_UIRemoteViewController *)self _updateLockStatusHostingVisibility];
}

- (void)_updateLockStatusHostingVisibility
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_observesLockNotifications || !self->_systemAppIsLocked)
  {
    id v3 = [(UIViewController *)self view];
    uint64_t v4 = [v3 window];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [(UIViewController *)self view];
      int v7 = [v6 window];
      int v8 = [v7 isHidden];

      if (!v8)
      {
        if (!objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow")) {
          return;
        }
        fullScreenTextEffectsRemoteView = self->_fullScreenTextEffectsRemoteView;
        if (fullScreenTextEffectsRemoteView)
        {
          uint64_t v10 = [(UIView *)fullScreenTextEffectsRemoteView superview];

          if (!v10)
          {
            double v11 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
            [v11 addSubview:self->_fullScreenTextEffectsRemoteView];
          }
        }
        textEffectsAboveStatusBarRemoteView = self->_textEffectsAboveStatusBarRemoteView;
        if (textEffectsAboveStatusBarRemoteView)
        {
          double v13 = [(UIView *)textEffectsAboveStatusBarRemoteView superview];

          if (!v13)
          {
            double v14 = [(UIViewController *)self _window];
            double v15 = [v14 windowScene];
            double v16 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v15 forViewService:1];
            [v16 addSubview:self->_textEffectsAboveStatusBarRemoteView];
          }
        }
        if (+[UIKeyboard usesInputSystemUI])
        {
          double v17 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
          char v18 = [v17 hasWindowHostingCallerID:self->_callerID];

          if (v18) {
            return;
          }
          if (!self->_callerID)
          {
            if (os_variant_has_internal_diagnostics())
            {
              long long v30 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v33 = self;
                _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
              }
            }
            else
            {
              long long v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25ACE0) + 8);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v33 = self;
                _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
              }
            }
          }
          int v19 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
          objc_msgSend(v19, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
          goto LABEL_20;
        }
        remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
        if (remoteKeyboardRemoteView)
        {
          id v22 = [(UIView *)remoteKeyboardRemoteView superview];

          if (!v22)
          {
            id v31 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
            long long v23 = self->_remoteKeyboardRemoteView;
            uint64_t v24 = [(_UIViewServiceInterface *)self->_serviceInterface servicePID];
            long long v25 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
            uint64_t v26 = [v25 windowScene];
            [v31 addHostedWindowView:v23 fromPID:v24 forScene:v26 callerID:self->_callerID];
          }
        }
        return;
      }
    }
    else
    {
    }
  }
  [(UIView *)self->_fullScreenTextEffectsRemoteView removeFromSuperview];
  [(UIView *)self->_textEffectsAboveStatusBarRemoteView removeFromSuperview];
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v29 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = self;
          _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
      else
      {
        long long v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25ACD8) + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = self;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    int v19 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_msgSend(v19, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
LABEL_20:

    return;
  }
  v20 = self->_remoteKeyboardRemoteView;
  [(UIView *)v20 removeFromSuperview];
}

- (void)_uirvc_windowResignedKey:(id)a3
{
  self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey = self->_wantsKeyboardEnvironmentEventDeferring;
  [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:0];
}

- (void)_uirvc_windowBecameKey:(id)a3
{
  id v6 = a3;
  if (self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey
    || ([(UIViewController *)self _screen],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = [(_UIRemoteViewController *)self _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:v4], v4, v5))
  {
    [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:1];
  }
  self->_wasKeyboardEnvironmentEventDeferringBeforeResignKey = 0;
}

- (void)_uirvc_keyboardWindowSceneSettingsSceneWillChange:(id)a3
{
  double v11 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = v11;
  if (isKindOfClass)
  {
    id v6 = v11;
    BOOL v7 = -[_UIRemoteViewController _windowSceneIsKeyboardWindowScene:]((uint64_t)self, v6);
    int v8 = [(UIViewController *)self _existingView];
    uint64_t v9 = [v8 _window];
    id v10 = [v9 windowScene];

    if (v7 && v6 == v10)
    {
      if (self->_keyboardEnvironmentDeferringToken) {
        [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:0];
      }
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)self);
    }

    BOOL v5 = v11;
  }
}

- (void)_uirvc_applicationKeyWindowWillChange:(id)a3
{
  id v8 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[UIWindow _applicationKeyWindow];
    id v5 = v8;
    id v6 = [(UIViewController *)self _existingView];
    BOOL v7 = [v6 window];

    if ([v7 _isRemoteKeyboardWindow] && v5 != v4)
    {
      if (self->_keyboardEnvironmentDeferringToken) {
        [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:0];
      }
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)self);
    }
  }
}

- (void)_uirvc_windowWillMoveToScene:(id)a3
{
  uint64_t v9 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v9;
  if (isKindOfClass)
  {
    id v6 = v9;
    BOOL v7 = [(UIViewController *)self _existingView];
    id v8 = [v7 _window];

    if (v6 == v8)
    {
      if (self->_keyboardEnvironmentDeferringToken)
      {
        self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove = 1;
        [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:0];
      }
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)self);
    }

    id v5 = v9;
  }
}

- (void)_uirvc_windowDidMoveToScene:(id)a3
{
  id v10 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v10;
  if (isKindOfClass)
  {
    id v6 = v10;
    BOOL v7 = [(UIViewController *)self _existingView];
    id v8 = [v7 _window];

    if (v6 == v8)
    {
      if (self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove)
      {
        [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:1];
        self->_wasKeyboardEnvironmentEventDeferringBeforeSceneMove = 0;
      }
      serviceResolvedPhysicalButtonConfigurations = self->_serviceResolvedPhysicalButtonConfigurations;
      if (serviceResolvedPhysicalButtonConfigurations
        && [(_UIPhysicalButtonConfigurationSet *)serviceResolvedPhysicalButtonConfigurations _count])
      {
        -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, self->_serviceResolvedPhysicalButtonConfigurations, self->_serviceResolvedPhysicalButtonConfigurations);
      }
      -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)self, v6);
    }

    id v5 = v10;
  }
}

- (void)_updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:(void *)a3 newResolvedConfigurations:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_41;
  }
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_41;
  }
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    char v10 = [v7 isEqual:v8];

    if (v10) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  id v33 = v5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = 0;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        double v17 = objc_msgSend(MEMORY[0x1E4F4F280], "ui_environmentForUIPhysicalButton:", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "_button"));
        if (v17)
        {
          if (!v14) {
            double v14 = objc_opt_new();
          }
          [v14 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }
  else
  {
    double v14 = 0;
  }

  if (!a1[159])
  {
    BOOL v18 = 0;
LABEL_27:
    BOOL v19 = [v14 count] != 0;
    if (!v11) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  BOOL v18 = [v14 count] != 0;
  if (!a1[159]) {
    goto LABEL_27;
  }
  BOOL v19 = 0;
  if (!v11) {
    goto LABEL_30;
  }
LABEL_28:
  v20 = (void *)v11[1];
  if (v20)
  {
    BOOL v21 = [v20 count] == 0;
    goto LABEL_31;
  }
LABEL_30:
  BOOL v21 = 1;
LABEL_31:
  int v22 = [a1 _appearState];
  int v23 = 0;
  if (v22 && v22 != 3) {
    int v23 = v18 || v19;
  }
  id v5 = v33;
  if ((v21 | v23) == 1)
  {
    -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t)a1);
    uint64_t v24 = [a1 _existingView];
    long long v25 = [v24 _window];

    if ([v11 _count] && v25 && objc_msgSend(a1, "serviceProcessIdentifier"))
    {
      uint64_t v26 = [v25 windowScene];
      long long v27 = [v26 _eventDeferringManager];
      long long v28 = [NSString stringWithFormat:@"%@: %p: begin remote deferring for dynamic buttons", objc_opt_class(), a1];
      long long v29 = (void *)[v14 copy];
      long long v30 = [a1 _hostedWindowServiceDeferringTarget];
      uint64_t v31 = -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:](v27, v29, a1, v30, v28);
      v32 = (void *)a1[159];
      a1[159] = v31;

      [a1 _beginObservingNotificationsForEventDeferringIfNeeded];
    }
  }
LABEL_41:
}

- (void)_updateTouchGrabbingView
{
  id v22 = [(UIViewController *)self navigationController];
  id v3 = [v22 viewControllers];
  id v4 = [v3 objectAtIndex:0];

  id v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  BOOL v7 = v5 == 0;
  id v8 = v5;
  if (v5 && v4 != v5)
  {
    id v8 = v5;
    do
    {
      uint64_t v9 = v8;
      id v8 = [(UIViewController *)v8 parentViewController];

      BOOL v7 = v8 == 0;
    }
    while (v8 && v8 != v4);
  }
  id v10 = p_isa[151];
  if (!v22 || !v7)
  {
    if (!v10) {
      goto LABEL_14;
    }
    [v10 removeFromSuperview];
    id v21 = p_isa[151];
    p_isa[151] = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    double v11 = [p_isa view];
    [v11 bounds];
    double v13 = v12;

    double v14 = [v22 _builtinInteractionController];
    uint64_t v15 = [v14 screenEdgePanGestureRecognizer];
    [v15 _edgeRegionSize];
    double v17 = v16;

    if (v17 > 0.0)
    {
      BOOL v18 = -[UIView initWithFrame:]([_UIRemoteViewControllerTouchGrabbingView alloc], "initWithFrame:", 0.0, 0.0, v17, v13);
      id v19 = p_isa[151];
      p_isa[151] = v18;

      v20 = [p_isa[151] layer];
      [v20 setHitTestsAsOpaque:1];

      [p_isa[151] setUserInteractionEnabled:0];
      [p_isa[151] setAutoresizingMask:20];
      id v21 = [p_isa view];
      [v21 addSubview:p_isa[151]];
LABEL_13:
    }
  }
LABEL_14:
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  double right = a3.right;
  CGFloat bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v28.receiver = self;
  v28.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](&v28, sel__setContentOverlayInsets_andLeftMargin_rightMargin_);
  if (!_UIDeviceNativeUserInterfaceIdiom())
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_24;
      }
    }
    else
    {
      double v12 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      if ([v12 isCarrierInstall])
      {
        char v13 = dyld_program_sdk_at_least();

        if ((v13 & 1) == 0) {
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
  }
  double v14 = [(UIViewController *)self traitCollection];
  if ([v14 userInterfaceIdiom])
  {

    goto LABEL_24;
  }
  uint64_t v15 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
  char v16 = [v15 hasPrefix:@"com.apple."];

  if (v16) {
    goto LABEL_24;
  }
  double v17 = [(UIViewController *)self _window];
  [v17 safeAreaInsets];
  double v26 = v18;
  double v20 = v19;
  double v22 = v21;

  int v23 = [(UIViewController *)self _window];
  if ((unint64_t)([v23 interfaceOrientation] - 3) > 1)
  {
  }
  else
  {
    if (vabdd_f64(left, v20) < 0.1 && left > 50.0)
    {

LABEL_23:
      double left = 44.0;
      double right = 44.0;
      goto LABEL_24;
    }

    if (vabdd_f64(right, v22) < 0.1 && right > 50.0) {
      goto LABEL_23;
    }
  }
  double v24 = vabdd_f64(top, v26);
  if (top > 50.0 && v24 < 0.1) {
    double top = 44.0;
  }
LABEL_24:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __78___UIRemoteViewController__setContentOverlayInsets_andLeftMargin_rightMargin___block_invoke;
  v27[3] = &unk_1E52E7948;
  v27[4] = self;
  *(double *)&v27[5] = top;
  *(double *)&v27[6] = left;
  *(CGFloat *)&v27[7] = bottom;
  *(double *)&v27[8] = right;
  *(double *)&v27[9] = a4;
  *(double *)&v27[10] = a5;
  -[_UIRemoteViewController _synchronizeAnimationsInActionsIfNecessary:](self, "_synchronizeAnimationsInActionsIfNecessary:", v27, *(void *)&v26);
}

- (id)_terminateWithError:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_terminationErrorLock);
  if (!self->_terminationError) {
    objc_storeStrong((id *)&self->_terminationError, a3);
  }
  os_unfair_lock_unlock(&self->_terminationErrorLock);
  id v6 = [(_UIAsyncInvocation *)self->_terminationInvocation invoke];

  return v6;
}

- (id)disconnect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", disconnect___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      id v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
    }
    else
    {
      id v8 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    char v13 = v8;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Disconnect requested for remote view controller: %{public}@", buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceErrorDomain" code:1 userInfo:&unk_1ED3F7C80];
  id v10 = [(_UIRemoteViewController *)self _terminateWithError:v9];

  return v10;
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
  [v5 removeObserver:self name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];
  [v5 removeObserver:self name:@"UIApplicationStatusBarHeightChangedNotification" object:0];
  [v5 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];
  [v5 removeObserver:self name:@"UISceneWillEnterForegroundNotification" object:0];
  [v5 removeObserver:self name:0x1ED180300 object:0];
  [v5 removeObserver:self name:0x1ED180340 object:0];
  [v5 removeObserver:self name:@"_UIPencilEventDidEvaluateBarrelFocusForSceneTransition" object:0];
  [v5 removeObserver:self name:@"_UIViewServiceHostDidEvaluatePencilBarrelEventFocusForSceneTransition" object:0];
  [v5 removeObserver:self name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v5 removeObserver:self name:@"UISceneDidEnterBackgroundNotification" object:0];
  [v5 removeObserver:self name:0x1ED1802E0 object:0];
  [v5 removeObserver:self name:0x1ED180320 object:0];
  [v5 removeObserver:self name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v5 removeObserver:self name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  [v5 removeObserver:self name:_UIWindowDidAttachContextNotification object:0];
  [v5 removeObserver:self name:_UIWindowDidDetachContextNotification object:0];
  [v5 removeObserver:self name:@"_UISystemApplicationWillLockNotification" object:0];
  [v5 removeObserver:self name:@"_UISystemApplicationDidUnlockNotification" object:0];
  [v5 removeObserver:self name:@"_UIScreenDisplayConfigurationUpdatedNotification" object:0];
  [v5 removeObserver:self name:@"UIScreenReferenceDisplayModeStatusDidChangeNotification" object:0];
  [v5 removeObserver:self name:@"_UIWindowSceneEnhancedWindowingModeChanged" object:0];
  id v6 = [(_UIAsyncInvocation *)self->_viewControllerOperatorHalfDisconnectionInvocation invoke];
  v13[0] = v6;
  BOOL v7 = [(_UIAsyncInvocation *)self->_textEffectsOperatorHalfDisconnectionInvocation invoke];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke;
  v10[3] = &unk_1E530D828;
  id v11 = v4;
  double v12 = self;
  id v9 = v4;
  +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:v8 do:v10];
}

- (void)_objc_initiateDealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("ViewServices", &_objc_initiateDealloc___s_category)
                                     + 8));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      id v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
    }
    else
    {
      id v8 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    double v12 = v8;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Initiating deallocation for remote view controller: %{public}@", buf, 0xCu);
  }
  if (self) {
    *((_WORD *)&self->super._viewControllerFlags + 4) |= 0x80u;
  }
  id v9 = [(_UIRemoteViewController *)self disconnect];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48___UIRemoteViewController__objc_initiateDealloc__block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  void v10[4] = self;
  [v9 whenCompleteDo:v10];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  remoteViewService = self->_remoteViewService;
  self->_remoteViewService = 0;

  [(UIView *)self->_fullScreenTextEffectsRemoteView removeFromSuperview];
  [(UIView *)self->_fullScreenTextEffectsSnapshotView removeFromSuperview];
  [(UIView *)self->_textEffectsAboveStatusBarRemoteView removeFromSuperview];
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v8 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = self;
          _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
      else
      {
        BOOL v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_13) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = self;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    id v4 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_msgSend(v4, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
  }
  else
  {
    [(UIView *)self->_remoteKeyboardRemoteView removeFromSuperview];
  }
  [(UIView *)self->_viewServiceTouchInterdictionView removeFromSuperview];
  keyboardProxyPresentationEnvironment = self->_keyboardProxyPresentationEnvironment;
  if (keyboardProxyPresentationEnvironment)
  {
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService invalidate]((uint64_t)keyboardProxyPresentationEnvironment);
    id v6 = self->_keyboardProxyPresentationEnvironment;
    self->_keyboardProxyPresentationEnvironment = 0;
  }
  [(APExtensionSubjectMonitorRegistry *)self->_appProtectionSubjectMonitorRegistry invalidate];
  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v9 dealloc];
}

- (void)__viewServiceDidChangeHasScrollToTopView:(BOOL)a3
{
  if (self->_serviceHasScrollToTopView != a3)
  {
    BOOL v3 = a3;
    self->_serviceHasScrollToTopView = a3;
    id v5 = [(UIView *)self->_serviceViewControllerRemoteView window];
    sizeTrackingView = self->_sizeTrackingView;
    id v7 = v5;
    if (v3) {
      [v5 _registerScrollToTopView:sizeTrackingView];
    }
    else {
      [v5 _unregisterScrollToTopView:sizeTrackingView];
    }
  }
}

- (void)_scrollToTopFromTouchAtViewLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke;
  v14[3] = &unk_1E52F31C8;
  id v9 = v7;
  id v15 = v9;
  id v10 = [viewControllerOperatorProxy remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_3;
  v12[3] = &unk_1E5302828;
  id v13 = v9;
  id v11 = v9;
  objc_msgSend(v10, "__scrollToTopFromTouchAtViewLocation:resultHandler:", v12, x, y);
}

- (BOOL)_serviceHasScrollToTopView
{
  return self->_serviceHasScrollToTopView;
}

- (BOOL)_isHostingRemoteContent
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_firstResponderDidChange:(id)a3
{
  id v21 = a3;
  id v4 = [v21 userInfo];
  id v5 = [v4 objectForKey:0x1ED160760];
  int v6 = [v5 BOOLValue];

  id v7 = [v21 userInfo];
  id v8 = [v7 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  id v9 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  char v10 = [v9 handlingRemoteEvent];

  if ((v6 & 1) == 0)
  {
    if (v8) {
      BOOL v11 = v8 == self;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      char v12 = 1;
    }
    else {
      char v12 = v10;
    }
    if (v12) {
      goto LABEL_20;
    }
LABEL_11:
    id v13 = [v21 object];
    if (_UIWindowKeyWindowAPIIsSceneLevel()) {
      int v14 = [v13 isKeyWindow];
    }
    else {
      int v14 = [v13 _isApplicationKeyWindow];
    }
    int v15 = v14;
    char v16 = [(UIViewController *)self view];
    uint64_t v17 = [v16 window];
    if (v13 == (void *)v17)
    {
    }
    else
    {
      double v18 = (void *)v17;
      double v19 = [v13 _windowHostingScene];
      unsigned int v20 = v15 & ~[v19 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal] | v6;

      if (v20 != 1) {
        goto LABEL_19;
      }
    }
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidPromoteFirstResponder");
    [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:0];
LABEL_19:

    goto LABEL_20;
  }
  if ((v10 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_20:
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v5 addObserver:self selector:sel__applicationWillDeactivate_ name:@"UIApplicationWillResignActiveNotification" object:0];
  [v5 addObserver:self selector:sel__viewServiceHostDidBecomeActive_ name:0x1ED180360 object:0];
  [v5 addObserver:self selector:sel__viewServiceHostWillDeactivate_ name:0x1ED180380 object:0];
  [v5 addObserver:self selector:sel__applicationWillAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  [v5 addObserver:self selector:sel__systemApplicationWillLock_ name:@"_UISystemApplicationWillLockNotification" object:0];
  [v5 addObserver:self selector:sel__systemApplicationDidUnlock_ name:@"_UISystemApplicationDidUnlockNotification" object:0];
  [(_UIRemoteViewController *)self _beginObservingSceneMoveNotificationsIfNeeded];
  if (!objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow")) {
    goto LABEL_12;
  }
  if (self->_fullScreenTextEffectsRemoteView)
  {
    int v6 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
    [v6 addSubview:self->_fullScreenTextEffectsRemoteView];
  }
  if (self->_textEffectsAboveStatusBarRemoteView)
  {
    id v7 = [(UIViewController *)self _window];
    id v8 = [v7 windowScene];
    id v9 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v8 forViewService:1];
    [v9 addSubview:self->_textEffectsAboveStatusBarRemoteView];
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v21 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v26 = self;
          _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
      else
      {
        unsigned int v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &viewWillAppear____s_category_0) + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v26 = self;
          _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    char v10 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_msgSend(v10, "addWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
  }
  else
  {
    if (!self->_remoteKeyboardRemoteView) {
      goto LABEL_12;
    }
    char v10 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    uint64_t v12 = [(_UIViewServiceInterface *)self->_serviceInterface servicePID];
    id v13 = [(_UIRemoteViewController *)self textEffectsWindowForServiceScreen];
    int v14 = [v13 windowScene];
    [v10 addHostedWindowView:remoteKeyboardRemoteView fromPID:v12 forScene:v14 callerID:self->_callerID];
  }
LABEL_12:
  v24.receiver = self;
  v24.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v24 viewWillAppear:v3];
  [(_UIRemoteViewController *)self setupAppProtectionIfNecessary];
  int v15 = [(UIViewController *)self presentingViewController];
  char v16 = [v15 currentAction];
  if (v16) {
    uint64_t v17 = v16[4];
  }
  else {
    uint64_t v17 = 0;
  }

  id textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
  uint64_t v19 = +[UIViewController _keyboardDirectionForTransition:v17];
  +[UIViewController durationForTransition:v17];
  objc_msgSend(textEffectsOperatorProxy, "__setNextAutomaticOrderOutDirection:duration:", v19);
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDisablesAutomaticKeyboardBehavior:", -[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior"));
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke;
  v22[3] = &unk_1E52D9FC0;
  v22[4] = self;
  BOOL v23 = v3;
  [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v22];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v4 viewIsAppearing:a3];
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 0x20) != 0)
  {
    [(_UIRemoteViewController *)self presentAppProtectionShieldIfServiceCurrentlyRequiresAuth];
    *(unsigned char *)&self->_remoteViewControllerFlags &= ~0x20u;
  }
  [(_UIRemoteViewController *)self requestAppProtectionAuthIfNecessary];
}

- (void)_updateServiceSceneContext
{
  BOOL v3 = [(UIViewController *)self _existingView];
  objc_super v4 = [v3 window];

  id v5 = [(UIViewController *)self _existingView];
  int v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = +[_UIRemoteViewControllerSceneContext contextForWindow:inScene:]((uint64_t)_UIRemoteViewControllerSceneContext, v4, v7);

  if (v8 && ([v8 isEqual:self->_serviceSceneContext] & 1) == 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___UIRemoteViewController__updateServiceSceneContext__block_invoke;
    v9[3] = &unk_1E52D9F98;
    v9[4] = self;
    id v10 = v8;
    [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v9];
    objc_storeStrong((id *)&self->_serviceSceneContext, v8);
  }
}

- (void)_movedToParentSceneWithSettings:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isUISubclass];
  int v6 = (Class *)off_1E52D34C8;
  if (!v5) {
    int v6 = (Class *)0x1E4F62A78;
  }
  id v8 = (id)[objc_alloc(*v6) initWithSettings:v4];

  id v7 = (void *)BSCreateSerializedBSXPCEncodableObject();
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidMoveToParentSceneWithSettings:", v7);
}

- (void)_parentSceneDidUpdateWithDiff:(id)a3
{
  id v4 = (id)BSCreateSerializedBSXPCEncodableObject();
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostSceneDidUpdateWithDiff:", v4);
}

- (void)_screenDidConnect:(id)a3
{
  id v6 = [a3 object];
  if (![(id)UIApp _isSpringBoard] || (objc_msgSend(v6, "_isCarScreen") & 1) == 0)
  {
    id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
    int v5 = [v6 displayConfiguration];
    objc_msgSend(viewControllerOperatorProxy, "__hostDidAttachDisplay:", v5);
  }
}

- (void)_screenDidUpdate:(id)a3
{
  id v6 = [a3 object];
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  int v5 = [v6 displayConfiguration];
  objc_msgSend(viewControllerOperatorProxy, "__hostDidUpdateDisplay:", v5);
}

- (void)_screenDidDisconnect:(id)a3
{
  id v15 = a3;
  id v4 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v15 object];

    if (!v5) {
      goto LABEL_17;
    }
    lastNotifiedServiceScreenDisplayIdentitdouble y = self->_lastNotifiedServiceScreenDisplayIdentity;
    id v7 = [v5 displayIdentity];
    id v8 = lastNotifiedServiceScreenDisplayIdentity;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {

LABEL_14:
LABEL_15:
        id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
        int v14 = [v5 displayConfiguration];
        objc_msgSend(viewControllerOperatorProxy, "__hostDidDetachDisplay:", v14);

        goto LABEL_16;
      }
      int v12 = [(FBSDisplayIdentity *)v8 isEqual:v9];

      if (!v12) {
        goto LABEL_15;
      }
    }
    id v10 = +[UIScreen mainScreen];
    [(_UIRemoteViewController *)self _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:v10];
    goto LABEL_14;
  }
  int v5 = v4;
LABEL_16:

LABEL_17:
}

- (void)_screenDidUpdateCapture:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [(UIViewController *)self view];
  id v10 = [v9 window];
  BOOL v11 = [v10 screen];
  id v14 = v8;
  id v12 = v11;
  if (v14 == v12)
  {

    goto LABEL_12;
  }
  if (!v14 || !v12)
  {

    goto LABEL_14;
  }
  char v13 = [v14 isEqual:v12];

  if (v13) {
LABEL_12:
  }
    [(_UIRemoteViewController *)self _updateServiceSceneContext];
LABEL_14:
}

- (void)_referenceDisplayModeStatusDidChange:(id)a3
{
  id v4 = a3;
  id v10 = [v4 object];
  uint64_t v5 = [(UIViewController *)self _existingView];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = [v7 screen];
  id v9 = [v4 object];

  if (v8 == v9) {
    [(_UIRemoteViewController *)self _updateServiceSceneContext];
  }
}

- (void)_enhancedWindowingModeDidChange:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(UIViewController *)self _window];
  id v5 = [v4 windowScene];

  id v6 = v7;
  if (v5 == v7)
  {
    [(_UIRemoteViewController *)self _updateServiceSceneContext];
    id v6 = v7;
  }
}

- (void)_systemReferenceAngleDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIViewController *)self _existingView];
  id v6 = [v5 window];

  if (v6)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB3520]];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58___UIRemoteViewController__systemReferenceAngleDidChange___block_invoke;
    v16[3] = &unk_1E530D850;
    id v17 = v6;
    if (objc_msgSend(v8, "bs_containsObjectPassingTest:", v16))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &_systemReferenceAngleDidChange____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v10 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          if (self)
          {
            BOOL v11 = NSString;
            id v12 = self;
            char v13 = (objc_class *)objc_opt_class();
            id v14 = NSStringFromClass(v13);
            id v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];
          }
          else
          {
            id v15 = @"(nil)";
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = v15;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@: The system reference angle changed affecting a remote view controller. Pushing new angle to service.", buf, 0xCu);
        }
      }
      [(_UIRemoteViewController *)self _updateServiceSceneContext];
    }
  }
}

- (void)_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 displayIdentity];
  int v6 = [(FBSDisplayIdentity *)self->_lastNotifiedServiceScreenDisplayIdentity isEqual:v5] ^ 1;
  if (v4 && v6)
  {
    objc_storeStrong((id *)&self->_lastNotifiedServiceScreenDisplayIdentity, v5);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke;
    char v16 = &unk_1E52D9F98;
    id v17 = self;
    id v18 = v4;
    [(_UIRemoteViewController *)self synchronizeAnimationsInActionsWithSynchronousReply:&v13];
  }
  BOOL wantsKeyboardEnvironmentEventDeferring = self->_wantsKeyboardEnvironmentEventDeferring;
  int v8 = objc_msgSend(v4, "supportsFocus", v13, v14, v15, v16, v17);
  uint64_t v9 = [v4 _userInterfaceIdiom];
  if (v8 && v9 == 3)
  {
    int v10 = wantsKeyboardEnvironmentEventDeferring ? v6 : 1;
    if (v4)
    {
      if (v10)
      {
        BOOL v11 = [(_UIRemoteViewController *)self _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:v4];
        if (self->_wantsKeyboardEnvironmentEventDeferring != v11) {
          [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:v11];
        }
      }
    }
  }
  [(_UIRemoteViewController *)self _updateServiceSceneContext];
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 removeObserver:self name:@"_UIScreenUniqueIdDidChangeNotification" object:0];
  if (v4) {
    [v12 addObserver:self selector:sel__screenIDChanged_ name:@"_UIScreenUniqueIdDidChangeNotification" object:v4];
  }
}

- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  id v6 = a4;
  [(_UIRemoteViewController *)self _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:v6];
  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v7 __willChangeToIdiom:a3 onScreen:v6];
}

- (void)_beginObservingSceneMoveNotificationsIfNeeded
{
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 4) == 0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__uirvc_windowWillMoveToScene_ name:0x1ED1601C0 object:0];
    [v3 addObserver:self selector:sel__uirvc_windowDidMoveToScene_ name:0x1ED1601E0 object:0];
    *(unsigned char *)&self->_remoteViewControllerFlags |= 4u;
  }
}

- (int64_t)interfaceElementCategory
{
  return 3;
}

- (id)_hostedWindowServiceDeferringTarget
{
  id v3 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
  id v4 = [(_UIRemoteView *)self->_serviceViewControllerRemoteView hostedWindowHostingHandle];
  uint64_t v5 = [v4 contextID];

  id v6 = objc_alloc_init(MEMORY[0x1E4F4F368]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F368]);

  objc_msgSend(v7, "setPid:", -[_UIRemoteViewController serviceProcessIdentifier](self, "serviceProcessIdentifier"));
  int v8 = [MEMORY[0x1E4F4F290] tokenForIdentifierOfCAContext:v5];
  [v7 setToken:v8];

  return v7;
}

- (void)_beginObservingNotificationsForEventDeferringIfNeeded
{
  id v3 = [(UIViewController *)self _existingView];
  id v21 = [v3 _window];

  id v4 = [v21 windowScene];
  uint64_t v5 = [v4 _eventDeferringManager];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char remoteViewControllerFlags = (char)self->_remoteViewControllerFlags;
  int v8 = -[_UIEventDeferringManager internalBehavior](v5);
  int v9 = [v8 shouldDisableRemoteViewControllerEventDeferringForKeyboardSettingsSceneChanges];

  if ((remoteViewControllerFlags & 1) == 0 && v9)
  {
    id v10 = v21;
    BOOL v11 = v10;
    if (v10
      && ([v10 windowScene], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v13 = (void *)v12,
          BOOL v14 = +[_UIRemoteKeyboards enabled],
          v13,
          v14))
    {
      int v15 = [v11 _isRemoteKeyboardWindow];
      char v16 = [v11 windowScene];
      BOOL v17 = -[_UIRemoteViewController _windowSceneIsKeyboardWindowScene:]((uint64_t)self, v16);

      if (v15 && v17)
      {
        [v6 addObserver:self selector:sel__uirvc_keyboardWindowSceneSettingsSceneWillChange_ name:@"_UISceneWillChangeSettingsSceneNotification" object:0];
        *(unsigned char *)&self->_remoteViewControllerFlags |= 1u;
      }
    }
    else
    {
    }
  }
  char v18 = (char)self->_remoteViewControllerFlags;
  uint64_t v19 = -[_UIEventDeferringManager internalBehavior](v5);
  int v20 = [v19 shouldDisableRemoteViewControllerEventDeferringForKeyboardKeyWindowChanges];

  if ((v18 & 2) == 0 && v20 && [v21 _isRemoteKeyboardWindow])
  {
    [v6 addObserver:self selector:sel__uirvc_applicationKeyWindowWillChange_ name:@"_UIWindowWillBecomeApplicationKeyNotification" object:0];
    *(unsigned char *)&self->_remoteViewControllerFlags |= 2u;
  }
  [(_UIRemoteViewController *)self _beginObservingSceneMoveNotificationsIfNeeded];
}

- (void)_setWantsKeyboardEnvironmentEventDeferring:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_wantsKeyboardEnvironmentEventDeferring)
  {
    keyboardEnvironmentDeferringToken = self->_keyboardEnvironmentDeferringToken;
    BOOL v6 = keyboardEnvironmentDeferringToken == 0;
    BOOL v7 = keyboardEnvironmentDeferringToken != 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  BOOL v8 = self->_wantsKeyboardEnvironmentEventDeferring && !a3;
  int v9 = [(UIViewController *)self _appearState];
  BOOL v10 = 0;
  if (v9 && v9 != 3) {
    BOOL v10 = !self->_wantsKeyboardEnvironmentEventDeferring && v3;
  }
  if (v6 || v10 || v8)
  {
    if (v7)
    {
      BOOL v11 = [NSString stringWithFormat:@"%@: %p: end keyboard environment deferring", objc_opt_class(), self];
      -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:]((uint64_t)self->_keyboardEnvironmentDeferringToken, (uint64_t)v11);
      uint64_t v12 = self->_keyboardEnvironmentDeferringToken;
      self->_keyboardEnvironmentDeferringToken = 0;
    }
    self->_BOOL wantsKeyboardEnvironmentEventDeferring = v3;
    uint64_t v13 = [(UIViewController *)self _existingView];
    long long v25 = [v13 window];

    BOOL v14 = v25;
    if (self->_wantsKeyboardEnvironmentEventDeferring && v25 != 0)
    {
      int v16 = [(_UIRemoteViewController *)self serviceProcessIdentifier];
      BOOL v14 = v25;
      if (v16)
      {
        BOOL v17 = [v25 windowScene];
        char v18 = [v17 _eventDeferringManager];
        uint64_t v19 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
        int v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v19];
        id v21 = [NSString stringWithFormat:@"%@: %p: begin remote deferring in %@", objc_opt_class(), self, v19];
        double v22 = [(_UIRemoteViewController *)self _hostedWindowServiceDeferringTarget];
        -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:](v18, v20, self, v22, v21);
        BOOL v23 = (_UIEventDeferringOwnershipToken *)objc_claimAutoreleasedReturnValue();
        objc_super v24 = self->_keyboardEnvironmentDeferringToken;
        self->_keyboardEnvironmentDeferringToken = v23;

        [(_UIRemoteViewController *)self _beginObservingNotificationsForEventDeferringIfNeeded];
        BOOL v14 = v25;
      }
    }
  }
}

- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3
{
  id v4 = a3;
  int v5 = [v4 supportsFocus];
  uint64_t v6 = [v4 _userInterfaceIdiom];

  BOOL result = 0;
  if (v5 && v6 == 3)
  {
    BOOL v8 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:0];
    int v9 = [v8 shouldPresentInFullscreen];
    int v10 = v9;
    if (v8 && (v9 & 1) != 0) {
      goto LABEL_12;
    }
    BOOL v11 = [(UIViewController *)self presentingViewController];
    uint64_t v12 = [v11 presentedViewController];
    if (![v12 modalPresentationStyle]
      || [v12 modalPresentationStyle] == 5
      || [v12 modalPresentationStyle] == 2
      || [v12 modalPresentationStyle] == 16
      || [v12 modalPresentationStyle] == 7)
    {
      int v10 = 1;
LABEL_11:

LABEL_12:
      return v10 != 0;
    }
    if ([v12 modalPresentationStyle] == 3)
    {
      uint64_t v13 = [v11 _nonModalAncestorViewControllerStopAtIsPresentationContext:1];
    }
    else
    {
      uint64_t v14 = [v12 modalPresentationStyle];
      uint64_t v13 = [v11 _nonModalAncestorViewControllerStopAtIsPresentationContext:1];
      if (v14 != 6)
      {
LABEL_22:

        goto LABEL_11;
      }
    }
    int v15 = [v13 _existingView];

    if (v15)
    {
      int v16 = [v13 _existingView];
      BOOL v17 = [v16 window];

      if (v17)
      {
        char v18 = [v13 _existingView];
        BOOL v19 = +[UIViewController _isViewSizeFullScreen:v18 inWindow:v17 ignoreInWindowCheck:0];

        if (v19) {
          int v10 = 1;
        }
      }
    }
    goto LABEL_22;
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostViewDidAppear:", v3);
  [(_UIRemoteViewController *)self _updateTouchGrabbingView];
  int v5 = [(UIViewController *)self presentingViewController];
  uint64_t v6 = [v5 _presentationController];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(id)objc_opt_class() _shouldInterdictServiceViewTouches])
  {
    [(_UIRemoteViewController *)self __setInterdictServiceViewTouches:1];
  }
  BOOL v7 = [(UIViewController *)self _window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v10 = [(UIViewController *)self _window];
    [v9 addObserver:self selector:sel__updateUnderflowProperties name:0x1ED1803E0 object:v10];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___UIRemoteViewController_viewWillDisappear___block_invoke;
  v5[3] = &unk_1E52D9FC0;
  v5[4] = self;
  BOOL v6 = a3;
  [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v5];
  [(_UIRemoteViewController *)self _updateTouchGrabbingView];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewDidDisappear:](&v9, sel_viewDidDisappear_);
  [(_UIRemoteViewController *)self _restoreTextEffectsRemoteView];
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostViewDidDisappear:", v3);
  [(UIView *)self->_fullScreenTextEffectsRemoteView removeFromSuperview];
  [(UIView *)self->_textEffectsAboveStatusBarRemoteView removeFromSuperview];
  [(UIView *)self->_fullScreenTextEffectsSnapshotView removeFromSuperview];
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!self->_callerID)
    {
      if (os_variant_has_internal_diagnostics())
      {
        BOOL v8 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v11 = self;
          _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
      else
      {
        objc_super v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &viewDidDisappear____s_category) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v11 = self;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "UIRemoteViewController %@ has a nil _callerID", buf, 0xCu);
        }
      }
    }
    int v5 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    objc_msgSend(v5, "removeWindowHostingPID:callerID:", -[_UIViewServiceInterface servicePID](self->_serviceInterface, "servicePID"), self->_callerID);
  }
  else
  {
    [(UIView *)self->_remoteKeyboardRemoteView removeFromSuperview];
  }
  [(_UIRemoteViewController *)self __setInterdictServiceViewTouches:0];
  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v6 removeObserver:self name:@"UIApplicationWillResignActiveNotification" object:0];
  [v6 removeObserver:self name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  [v6 removeObserver:self name:0x1ED1803E0 object:0];
  *(unsigned char *)&self->_remoteViewControllerFlags |= 0x20u;
}

- (void)_configureSizeViewConstraintsForWindow:(id)a3 interfaceOrientation:(int64_t)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_UIDeviceNativeUserInterfaceIdiom()) {
    goto LABEL_27;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_27;
    }
  }
  else
  {
    objc_super v7 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    if (([v7 isCarrierInstall] & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    char v8 = dyld_program_sdk_at_least();

    if ((v8 & 1) == 0) {
      goto LABEL_27;
    }
  }
  objc_super v7 = [v6 screen];
  if (([v7 _isEmbeddedScreen] & 1) == 0) {
    goto LABEL_26;
  }
  objc_super v9 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
  char v10 = [v9 hasPrefix:@"com.apple."];

  if ((v10 & 1) == 0)
  {
    sizeTrackingConstraints = self->_sizeTrackingConstraints;
    if (sizeTrackingConstraints)
    {
      uint64_t v12 = [(UIView *)self->_sizeTrackingView superview];

      if (v12)
      {
        uint64_t v13 = [(UIView *)self->_sizeTrackingView superview];
        [v13 removeConstraints:self->_sizeTrackingConstraints];
      }
      uint64_t v14 = self->_sizeTrackingConstraints;
      self->_sizeTrackingConstraints = 0;
    }
    int v15 = [(UIViewController *)self traitCollection];
    unint64_t v16 = [v15 userInterfaceIdiom];

    p_serviceMainScreenSize = &self->_serviceMainScreenSize;
    if (*MEMORY[0x1E4F1DB30] == self->_serviceMainScreenSize.width
      && *(double *)(MEMORY[0x1E4F1DB30] + 8) == self->_serviceMainScreenSize.height
      && !v16)
    {
      CGSize *p_serviceMainScreenSize = (CGSize)xmmword_186B9DC10;
    }
    if (v6)
    {
      char v18 = [v6 screen];
      [v18 _referenceBounds];
      double v20 = v19;
      double v22 = v21;
      double width = p_serviceMainScreenSize->width;
      double height = self->_serviceMainScreenSize.height;

      if (height == v22 && width == v20 || v16 > 1)
      {
        if (sizeTrackingConstraints)
        {
          [(UIView *)self->_sizeTrackingView setTranslatesAutoresizingMaskIntoConstraints:self->_sizeTrackingViewShouldTranslateAutoResizeMaskIntoConstraints];
          [(UIView *)self->_sizeTrackingView setAutoresizingMask:self->_sizeTrackingViewAutoResizeMask];
          [(UIView *)self->_sizeTrackingView setNeedsLayout];
          uint64_t v27 = [(UIView *)self->_sizeTrackingView superview];
          [v27 layoutBelowIfNeeded];
        }
      }
      else
      {
        double v28 = *(&p_serviceMainScreenSize->width + ((unint64_t)(a4 - 1) > 1));
        double v29 = *(&p_serviceMainScreenSize->width + ((unint64_t)(a4 - 1) < 2));
        long long v30 = [MEMORY[0x1E4F1CA48] array];
        sizeTrackingView = self->_sizeTrackingView;
        v54 = @"_sizeTrackingView";
        v55[0] = sizeTrackingView;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
        v52[0] = @"serviceSceneMaxSizeH";
        id v33 = [NSNumber numberWithDouble:v28];
        v52[1] = @"serviceSceneMaxSizeV";
        v53[0] = v33;
        long long v34 = [NSNumber numberWithDouble:v29];
        v53[1] = v34;
        long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

        long long v36 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(0@990)-[_sizeTrackingView(<=serviceSceneMaxSizeH@1000)]-(0@990)-|" options:0 metrics:v35 views:v32];
        [v30 addObjectsFromArray:v36];

        v51 = (void *)v32;
        long long v37 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(0@990)-[_sizeTrackingView(<=serviceSceneMaxSizeV@1000)]-(0@990)-|" options:0 metrics:v35 views:v32];
        [v30 addObjectsFromArray:v37];

        unsigned int v38 = (void *)MEMORY[0x1E4F5B268];
        uint64_t v39 = self->_sizeTrackingView;
        v40 = [(UIView *)v39 superview];
        v41 = [v38 constraintWithItem:v39 attribute:9 relatedBy:0 toItem:v40 attribute:9 multiplier:1.0 constant:0.0];
        [v30 addObject:v41];

        v42 = (void *)MEMORY[0x1E4F5B268];
        v43 = self->_sizeTrackingView;
        v44 = [(UIView *)v43 superview];
        v45 = [v42 constraintWithItem:v43 attribute:10 relatedBy:0 toItem:v44 attribute:10 multiplier:1.0 constant:0.0];
        [v30 addObject:v45];

        v46 = (NSArray *)[v30 copy];
        v47 = self->_sizeTrackingConstraints;
        self->_sizeTrackingConstraints = v46;

        if (!sizeTrackingConstraints)
        {
          self->_sizeTrackingViewAutoResizeMask = [(UIView *)self->_sizeTrackingView autoresizingMask];
          self->_sizeTrackingViewShouldTranslateAutoResizeMaskIntoConstraints = [(UIView *)self->_sizeTrackingView translatesAutoresizingMaskIntoConstraints];
        }
        [(UIView *)self->_sizeTrackingView setAutoresizingMask:0];
        [(UIView *)self->_sizeTrackingView setTranslatesAutoresizingMaskIntoConstraints:0];
        v48 = [(UIView *)self->_sizeTrackingView superview];
        [v48 addConstraints:self->_sizeTrackingConstraints];

        v49 = [(UIView *)self->_sizeTrackingView superview];
        [v49 setNeedsLayout];

        v50 = [(UIView *)self->_sizeTrackingView superview];
        [v50 layoutBelowIfNeeded];
      }
    }
  }
LABEL_27:
}

- (void)__setServiceMaxFrameSize:(CGSize)a3
{
  self->_serviceMainScreenSize = a3;
  id v5 = [(UIView *)self->_sizeTrackingView window];
  id v4 = [(UIView *)self->_sizeTrackingView window];
  -[_UIRemoteViewController _configureSizeViewConstraintsForWindow:interfaceOrientation:](self, "_configureSizeViewConstraintsForWindow:interfaceOrientation:", v5, [v4 interfaceOrientation]);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [v6 windowScene];
  char v8 = [v7 _eventDeferringManager];
  objc_super v9 = -[_UIEventDeferringManager internalBehavior](v8);

  if ([v9 shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement])
  {
    char v10 = [v6 screen];
    [(_UIRemoteViewController *)self _notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:v10];

    objc_super v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if ([v9 shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring])
    {
      int v12 = _UIWindowKeyWindowAPIIsSceneLevel();
      uint64_t v13 = (id *)&UIWindowDidBecomeKeyNotification;
      if (!v12) {
        uint64_t v13 = (id *)&_UIWindowDidBecomeApplicationKeyNotification;
      }
      id v14 = *v13;
      int v15 = _UIWindowKeyWindowAPIIsSceneLevel();
      unint64_t v16 = (id *)&UIWindowDidResignKeyNotification;
      if (!v15) {
        unint64_t v16 = (id *)&_UIWindowDidResignApplicationKeyNotification;
      }
      id v17 = *v16;
      [v11 removeObserver:self name:v14 object:0];
      [v11 removeObserver:self name:v17 object:0];
      if (v6)
      {
        [v11 addObserver:self selector:sel__uirvc_windowBecameKey_ name:v14 object:v6];
        [v11 addObserver:self selector:sel__uirvc_windowResignedKey_ name:v17 object:v6];
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v25 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  char v18 = [(UIView *)self->_sizeTrackingView window];
  double v19 = [(UIView *)self->_sizeTrackingView window];
  -[_UIRemoteViewController _configureSizeViewConstraintsForWindow:interfaceOrientation:](self, "_configureSizeViewConstraintsForWindow:interfaceOrientation:", v18, [v19 interfaceOrientation]);

  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  double v21 = [(UIViewController *)self presentingViewController];
  double v22 = [v21 _presentationControllerClassName];
  objc_msgSend(viewControllerOperatorProxy, "__hostDidSetPresentationControllerClassName:", v22);

  id v23 = self->_viewControllerOperatorProxy;
  objc_super v24 = [v6 windowScene];
  objc_msgSend(v23, "__setHostCanDynamicallySpecifySupportedInterfaceOrientations:", objc_msgSend(v24, "_canDynamicallySpecifySupportedInterfaceOrientations"));

  [(_UIRemoteViewController *)self _updateAncestorZoomTransitionControllerWithWindow:v6];
}

- (void)_updateAncestorZoomTransitionControllerWithWindow:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    BOOL v4 = self;
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
      do
      {
        objc_super v7 = [v6 preferredTransition];

        if (v7) {
          break;
        }
        uint64_t v8 = [v6 parentViewController];

        id v6 = (void *)v8;
      }
      while (v8);
    }
    else
    {
      id v6 = 0;
    }
    objc_super v9 = [v6 _zoomTransitionController];
    char v10 = objc_opt_new();
    [v9 setDismissInteraction:v10];

    if (v9) {
      objc_msgSend(v5->_viewControllerOperatorProxy, "__installDismissInteractionForZoomTransition");
    }
  }
  else
  {
    objc_super v9 = 0;
  }
  [(_UIRemoteViewController *)self set_ancestorZoomTransitionController:v9];
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRemoteViewController;
  -[UIViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  id v5 = [(_UIRemoteViewController *)self allowedNotifications];
  [(_UIRemoteViewController *)self setAllowedNotifications:v5];

  if (self->_wantsKeyboardEnvironmentEventDeferring && a3 && !self->_keyboardEnvironmentDeferringToken) {
    [(_UIRemoteViewController *)self _setWantsKeyboardEnvironmentEventDeferring:1];
  }
  serviceResolvedPhysicalButtonConfigurations = self->_serviceResolvedPhysicalButtonConfigurations;
  if (serviceResolvedPhysicalButtonConfigurations && a3 && !self->_dynamicButtonDeferringToken) {
    -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, serviceResolvedPhysicalButtonConfigurations, self->_serviceResolvedPhysicalButtonConfigurations);
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  serviceViewControllerSupportedInterfaceOrientations = self->_serviceViewControllerSupportedInterfaceOrientations;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(serviceViewControllerSupportedInterfaceOrientations) = [(NSArray *)serviceViewControllerSupportedInterfaceOrientations containsObject:v4];

  return (char)serviceViewControllerSupportedInterfaceOrientations;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = self->_serviceViewControllerSupportedInterfaceOrientations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= 1 << [*(id *)(*((void *)&v11 + 1) + 8 * i) integerValue];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {

    v10.receiver = self;
    v10.super_class = (Class)_UIRemoteViewController;
    return [(UIViewController *)&v10 supportedInterfaceOrientations];
  }
  return v6;
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return 1;
}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return [a1 doesOverrideViewControllerMethod:sel_viewWillTransitionToSize_withTransitionCoordinator_ inBaseClass:objc_opt_class()] ^ 1;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 0;
}

- (BOOL)_needsUnderflowPropertyUpdate
{
  BOOL isUnderlappingStatusBar = self->_isUnderlappingStatusBar;
  return isUnderlappingStatusBar != [(UIViewController *)self _viewControllerUnderlapsStatusBar];
}

- (void)_updateUnderflowProperties
{
  BOOL v3 = [(UIViewController *)self _viewControllerUnderlapsStatusBar];
  self->_BOOL isUnderlappingStatusBar = v3;
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  objc_msgSend(viewControllerOperatorProxy, "__setHostViewUnderlapsStatusBar:", v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(_UIRemoteViewController *)self _setIsUpdatingSize:1];
  [(_UIRemoteViewController *)self _setIsUpdatingSizeInHost:1];
  v16.receiver = self;
  v16.super_class = (Class)_UIRemoteViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  IsIdentitdouble y = CGAffineTransformIsIdentity(&v17);
  objc_super v9 = [(UIViewController *)self _window];
  objc_super v10 = v9;
  if (IsIdentity)
  {
    uint64_t v11 = [v9 interfaceOrientation];
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = [v9 _toWindowOrientation];

    objc_super v10 = [(UIViewController *)self _window];
    uint64_t v11 = [v10 _fromWindowOrientation];
  }

  long long v13 = [(UIView *)self->_sizeTrackingView window];
  [(_UIRemoteViewController *)self _configureSizeViewConstraintsForWindow:v13 interfaceOrientation:v12];

  [(_UIRemoteViewController *)self _beginDeferringProxySheetConfigurationUpdates];
  void v14[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1E52E9AD8;
  v15[5] = v12;
  v15[6] = v11;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v14[3] = &unk_1E52DA598;
  [v7 animateAlongsideTransition:v15 completion:v14];
}

- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (self->_fullScreenTextEffectsSnapshotView)
  {
    self->_snapshotTextEffectsAfterRotation = 1;
    [(_UIRemoteViewController *)self _restoreTextEffectsRemoteView];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v14 _willAnimateRotationToInterfaceOrientation:a3 duration:v7 forwardToChildControllers:v6 skipSelf:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114___UIRemoteViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
  v12[3] = &unk_1E52E7E40;
  void v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[6] = a4;
  BOOL v13 = v6;
  [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v12];
  sizeTrackingView = self->_sizeTrackingView;
  [(UIView *)sizeTrackingView frame];
  -[_UISizeTrackingView _updateTextEffectsGeometries:](sizeTrackingView, "_updateTextEffectsGeometries:");
}

- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:](&v12, sel__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf_, a3, a5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105___UIRemoteViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
  v10[3] = &unk_1E52E7E40;
  void v10[4] = self;
  void v10[5] = a3;
  *(double *)&v10[6] = a4;
  BOOL v11 = a6;
  [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v10];
}

- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteViewController;
  -[UIViewController _didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:](&v10, sel__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf_, a3, a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97___UIRemoteViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke;
  v8[3] = &unk_1E52E8040;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = a5;
  [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v8];
  if (self->_snapshotTextEffectsAfterRotation)
  {
    [(_UIRemoteViewController *)self _snapshotAndRemoveTextEffectsRemoteView];
    self->_snapshotTextEffectsAfterRotation = 0;
  }
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  id v5 = a3;
  objc_msgSend(viewControllerOperatorProxy, "__setServiceInPopover:", 1);
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v6 _willBecomeContentViewControllerOfPopover:v5];
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  id v5 = a3;
  objc_msgSend(viewControllerOperatorProxy, "__setServiceInPopover:", 0);
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v6 _didResignContentViewControllerOfPopover:v5];
}

- (BOOL)_requiresKeyboardWindowWhenFirstResponder
{
  return 1;
}

- (void)__didReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (int)_preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return self->_preferredAdaptivityStyle;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return self->_preferredStatusBarUpdateAnimation;
}

- (void)__viewServiceDidUpdatePreferredStatusBarStyle:(int64_t)a3 preferredStatusBarVisibility:(int)a4 updateAnimation:(int64_t)a5 currentAnimationSettings:(id)a6
{
  id v10 = a6;
  BOOL v11 = v10;
  self->_preferredStatusBarStyle = a3;
  self->_preferredStatusBarVisibilitdouble y = a4;
  self->_preferredStatusBarUpdateAnimation = a5;
  if (v10)
  {
    [v10 duration];
    double v13 = v12;
    [v11 delay];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __143___UIRemoteViewController___viewServiceDidUpdatePreferredStatusBarStyle_preferredStatusBarVisibility_updateAnimation_currentAnimationSettings___block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    +[UIView animateWithDuration:0 delay:v15 options:&__block_literal_global_592 animations:v13 completion:v14];
  }
  else
  {
    [(UIViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)__viewServiceDidUpdatePreferredWhitePointAdaptationStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6 = a4;
  self->_preferredAdaptivityStyle = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102___UIRemoteViewController___viewServiceDidUpdatePreferredWhitePointAdaptationStyle_animationSettings___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  void aBlock[4] = self;
  BOOL v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = v7;
  if (v6)
  {
    [v6 duration];
    double v10 = v9;
    [v6 delay];
    double v12 = v11;
    double v13 = [v6 timingFunction];
    if (v13)
    {
      double v14 = objc_alloc_init(_UISceneSettingsMediaTimingAnimationFactory);
      [(_UISceneSettingsMediaTimingAnimationFactory *)v14 set_timingFunctionForAnimation:v13];
      +[UIView _animateWithDuration:393216 delay:v14 options:v8 factory:0 animations:v10 completion:v12];
    }
    else if (v10 <= 0.0)
    {
      v8[2](v8);
    }
    else
    {
      +[UIView animateWithDuration:0 delay:v8 options:0 animations:v10 completion:v12];
    }
  }
  else
  {
    v7[2](v7);
  }
}

- (void)__viewServiceDidUpdateClientToHostAction:(id)a3
{
  id v4 = a3;
  id v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___UIRemoteViewController___viewServiceDidUpdateClientToHostAction___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)__viewServiceDidDropTouchEventForInsecurePresentation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  droppedTouchLoggingInhibitor = self->_droppedTouchLoggingInhibitor;
  if (!droppedTouchLoggingInhibitor)
  {
    id v4 = [[_UISimpleTimedInhibitor alloc] initWithClockType:0 maxAttempts:2 inPeriod:30.0];
    id v5 = self->_droppedTouchLoggingInhibitor;
    self->_droppedTouchLoggingInhibitor = v4;

    droppedTouchLoggingInhibitor = self->_droppedTouchLoggingInhibitor;
  }
  if (![(_UISimpleTimedInhibitor *)droppedTouchLoggingInhibitor attempt])
  {
    id v6 = [(_UIRemoteViewController *)self serviceBundleIdentifier];

    if (v6)
    {
      BOOL v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &__viewServiceDidDropTouchEventForInsecurePresentation___s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        double v9 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
        int v10 = 138543362;
        double v11 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "User interaction with %{public}@ was ignored because it is currently presented in an unsupported configuration. Ensure this view's appearance has not been modified.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return self->_preferredScreenEdgesDeferringSystemGestures;
}

- (void)__viewServiceDidUpdatePreferredScreenEdgesDeferringSystemGestures:(unint64_t)a3
{
  self->_preferredScreenEdgesDeferringSystemGestures = a3;
  [(UIViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (void)__viewServiceDidUpdatePrefersHomeIndicatorAutoHidden:(BOOL)a3
{
  self->_prefersHomeIndicatorAutoHidden = a3;
  [(UIViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)__viewServiceDidUpdatePreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
  [(UIViewController *)self _setNeedsUserInterfaceAppearanceUpdate];
}

- (BOOL)prefersPointerLocked
{
  return self->_prefersPointerLocked;
}

- (void)__viewServiceDidUpdatePrefersPointerLocked:(BOOL)a3
{
  self->_prefersPointerLocked = a3;
  [(UIViewController *)self setNeedsUpdateOfPrefersPointerLocked];
}

- (id)_multitaskingDragExclusionRects
{
  if (self->_multitaskingDragExclusionRects) {
    return self->_multitaskingDragExclusionRects;
  }
  else {
    return MEMORY[0x1E4F1CBF0];
  }
}

- (void)__viewServiceDidUpdateMultitaskingDragExclusionRects:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sizeTrackingView = self->_sizeTrackingView;
  if (sizeTrackingView)
  {
    [(UIView *)sizeTrackingView frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v14 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "CGRectValue", (void)v31);
          v39.origin.double x = v20;
          v39.origin.double y = v21;
          v39.size.double width = v22;
          v39.size.double height = v23;
          v37.origin.double x = v7;
          v37.origin.double y = v9;
          v37.size.double width = v11;
          v37.size.double height = v13;
          CGRect v38 = CGRectIntersection(v37, v39);
          double x = v38.origin.x;
          double y = v38.origin.y;
          double width = v38.size.width;
          double height = v38.size.height;
          if (!CGRectIsEmpty(v38))
          {
            double v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
            [v14 addObject:v28];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }

    double v29 = (NSArray *)[v14 copy];
    multitaskingDragExclusionRects = self->_multitaskingDragExclusionRects;
    self->_multitaskingDragExclusionRects = v29;

    [(UIViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
  }
}

- (id)_traitCollectionForServiceFromTraitCollection:(id)a3
{
  return _obscuredTraitCollectionFromTraitCollection(a3);
}

- (void)_traitCollectionDidChange:(id)a3
{
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  id v5 = a3;
  double v6 = [(UIViewController *)self traitCollection];
  CGFloat v7 = [(_UIRemoteViewController *)self _traitCollectionForServiceFromTraitCollection:v6];
  objc_msgSend(viewControllerOperatorProxy, "__setHostTraitCollection:deferIfAnimated:", v7, _shouldDeferSendingTraitCollectionChangeToService(self));

  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewController;
  [(UIViewController *)&v9 _traitCollectionDidChange:v5];
  double v8 = [(UIViewController *)self traitCollection];
  LODWORD(v6) = [v8 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6) {
    [(_UIRemoteViewController *)self _updateTintColor];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIRemoteViewController;
  id v7 = a4;
  [(UIViewController *)&v20 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  uint64_t v8 = [v6 userInterfaceStyle];
  objc_super v9 = [(UIViewController *)self traitCollection];
  uint64_t v10 = [v9 userInterfaceStyle];

  if (v8 == v10)
  {
    char v11 = 0;
  }
  else
  {
    double v12 = [(UIViewController *)self traitCollection];
    CGFloat v13 = objc_msgSend(v12, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", objc_msgSend(v6, "userInterfaceStyle"), 0x1ED3F5A48);

    char v11 = [v13 isEqual:v6];
  }
  double v14 = [(_UIRemoteViewController *)self _traitCollectionForServiceFromTraitCollection:v6];

  void v16[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E52E4FF8;
  v17[4] = self;
  id v18 = v14;
  char v19 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3;
  v16[3] = &unk_1E52DA598;
  id v15 = v14;
  [v7 animateAlongsideTransition:v17 completion:v16];
}

- (void)__viewServiceAddSceneForwardingLayersForOwners:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(UIViewController *)self view];
        char v11 = [v10 window];
        [v11 windowLevel];
        double v13 = v12 + 1.0;

        double v14 = (void *)[objc_alloc(MEMORY[0x1E4F62988]) initWithLevel:v9 keyboardOwner:v13];
        mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
        if (!mutableKeyboardSceneLayers)
        {
          uint64_t v16 = (NSMutableSet *)objc_opt_new();
          uint64_t v17 = self->_mutableKeyboardSceneLayers;
          self->_mutableKeyboardSceneLayers = v16;

          mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
        }
        [(NSMutableSet *)mutableKeyboardSceneLayers addObject:v14];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  -[_UISceneKeyboardProxyLayerForwardingPresentationViewService keyboardLayersDidChange]((uint64_t)self->_keyboardProxyPresentationEnvironment);
}

- (void)__viewServiceRemoveSceneForwardingLayersForOwners:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v4;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v5 = (void *)[(NSMutableSet *)self->_mutableKeyboardSceneLayers copy];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if (([v10 isKeyboardProxyLayer] & 1) == 0)
              {
                double v14 = [MEMORY[0x1E4F28B00] currentHandler];
                [v14 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:4682 description:@"only keyboard proxy layers support forwarding via UIRVC"];
              }
              id v11 = v10;
              double v12 = [v11 keyboardOwner];
              int v13 = BSEqualObjects();

              if (v13) {
                [(NSMutableSet *)self->_mutableKeyboardSceneLayers removeObject:v11];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
  if (![(NSMutableSet *)self->_mutableKeyboardSceneLayers count])
  {
    mutableKeyboardSceneLayers = self->_mutableKeyboardSceneLayers;
    self->_mutableKeyboardSceneLayers = 0;
  }
  -[_UISceneKeyboardProxyLayerForwardingPresentationViewService keyboardLayersDidChange]((uint64_t)self->_keyboardProxyPresentationEnvironment);
}

- (NSSet)_keyboardSceneLayers
{
  v2 = (void *)[(NSMutableSet *)self->_mutableKeyboardSceneLayers copy];
  return (NSSet *)v2;
}

- (void)__setSupportedInterfaceOrientations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (unint64_t)((int)[v10 intValue] - 1) >= 2
          && (unint64_t)((int)[v10 intValue] - 3) >= 2)
        {
          double v12 = NSStringFromSelector(a2);
          NSLog(&cfstr_ReceivedInvali.isa, self, v10, v12);

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___UIRemoteViewController___setSupportedInterfaceOrientations___block_invoke;
  void v13[3] = &unk_1E52D9F98;
  v13[4] = self;
  id v14 = v5;
  [v11 performAsync:v13];

LABEL_13:
}

- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3
{
  id v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIRemoteViewController___setViewServiceIsDisplayingPopover___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performAsync:v6];
}

- (void)dimmingViewWasTapped:(id)a3
{
}

- (void)__viewServiceWantsKeyboardEventsWithoutFirstResponderAndCompletionHandler:(id)a3
{
}

- (void)__viewServiceDidPromoteFirstResponderWithCompletionHandler:(id)a3
{
}

- (void)_serviceWantsKeyboardEventsWithPromotedFirstResponder:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99___UIRemoteViewController__serviceWantsKeyboardEventsWithPromotedFirstResponder_completionHandler___block_invoke;
  v9[3] = &unk_1E52E3538;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)__viewServiceDidChangeKeyWindow:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v5 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    int v6 = [v5 hasWindowHostingCallerID:self->_callerID];

    if (v3)
    {
      if (v6) {
        return;
      }
LABEL_8:
      [(_UIRemoteViewController *)self _restoreTextEffectsRemoteView];
      return;
    }
    if (!v6) {
      return;
    }
  }
  else
  {
    remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
    if (v3)
    {
      if (!remoteKeyboardRemoteView) {
        return;
      }
      id v8 = [(UIView *)remoteKeyboardRemoteView superview];

      if (v8) {
        return;
      }
      goto LABEL_8;
    }
    if (!remoteKeyboardRemoteView) {
      return;
    }
    uint64_t v9 = [(UIView *)remoteKeyboardRemoteView superview];

    if (!v9) {
      return;
    }
  }
  [(_UIRemoteViewController *)self _removeTextEffectsRemoteViews];
}

- (void)__viewServicePopoverDidChangeContentSize:(CGSize)a3 animated:(BOOL)a4 fence:(id)a5 withReplyHandler:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a6;
  BOOL v11 = (void *)[a5 copy];
  double v12 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100___UIRemoteViewController___viewServicePopoverDidChangeContentSize_animated_fence_withReplyHandler___block_invoke;
  v15[3] = &unk_1E52FCC40;
  v15[4] = self;
  id v16 = v11;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  [v12 performAsync:v15];
}

- (void)__viewServicePreferredContentSizeDidChange:(CGSize)a3 fence:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  BOOL v7 = (void *)[a4 copy];
  id v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76___UIRemoteViewController___viewServicePreferredContentSizeDidChange_fence___block_invoke;
  v10[3] = &unk_1E52E05A8;
  void v10[4] = self;
  id v11 = v7;
  CGFloat v12 = width;
  CGFloat v13 = height;
  id v9 = v7;
  [v8 performAsync:v10];
}

- (void)__viewServiceInstrinsicContentSizeDidChange:(CGSize)a3 fence:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  sizeTrackingView = self->_sizeTrackingView;
  if (has_internal_diagnostics)
  {
    if (!sizeTrackingView)
    {
      CGFloat v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        CGFloat v19 = "-[_UIRemoteViewController __viewServiceInstrinsicContentSizeDidChange:fence:]";
        __int16 v20 = 2112;
        long long v21 = self;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "%s unexpectedly received before _sizeTrackingView was created. %@", buf, 0x16u);
      }
    }
  }
  else if (!sizeTrackingView)
  {
    CGFloat v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &__viewServiceInstrinsicContentSizeDidChange_fence____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CGFloat v19 = "-[_UIRemoteViewController __viewServiceInstrinsicContentSizeDidChange:fence:]";
      __int16 v20 = 2112;
      long long v21 = self;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%s unexpectedly received before _sizeTrackingView was created. %@", buf, 0x16u);
    }
  }
  id v10 = (void *)[v7 copy];

  if (self->_sizeTrackingView)
  {
    id v11 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77___UIRemoteViewController___viewServiceInstrinsicContentSizeDidChange_fence___block_invoke;
    v14[3] = &unk_1E52E05A8;
    void v14[4] = self;
    id v15 = v10;
    CGFloat v16 = width;
    CGFloat v17 = height;
    [v11 performAsync:v14];
  }
}

- (id)_sheetPresentationController
{
  v2 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_setSheetConfiguration:(id)a3
{
  id v5 = a3;
  int v6 = self->__sheetConfiguration;
  id v7 = (_UISheetPresentationControllerConfiguration *)v5;
  id v10 = v7;
  if (v6 == v7)
  {

    id v9 = v10;
LABEL_10:

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

LABEL_8:
    id v9 = self->__sheetConfiguration;
    objc_storeStrong((id *)&self->__sheetConfiguration, a3);
    if (!self->__proxySheetConfigurationBeforeDeferring) {
      [(_UIRemoteViewController *)self _updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:v9];
    }
    goto LABEL_10;
  }
  BOOL v8 = [(_UISheetPresentationControllerConfiguration *)v6 isEqual:v7];

  if (!v8) {
    goto LABEL_8;
  }
LABEL_11:
}

- (void)_updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self->__sheetConfiguration;
  int v6 = (_UISheetPresentationControllerConfiguration *)v4;
  id v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      BOOL v8 = [(_UISheetPresentationControllerConfiguration *)v5 isEqual:v6];

      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ([(_UISheetPresentationControllerConfiguration *)v7 _shouldFenceChangeToConfiguration:v5])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __91___UIRemoteViewController__updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration___block_invoke;
      v9[3] = &unk_1E52D9F98;
      v9[4] = self;
      id v10 = v5;
      [(_UIRemoteViewController *)self _synchronizeAnimationsInActionsIfNecessary:v9];
    }
    else
    {
      objc_msgSend(self->_viewControllerOperatorProxy, "__setSheetConfiguration:", v5);
    }
  }
LABEL_11:
}

- (void)_beginDeferringProxySheetConfigurationUpdates
{
  if (!self->__proxySheetConfigurationBeforeDeferring) {
    objc_storeStrong((id *)&self->__proxySheetConfigurationBeforeDeferring, self->__sheetConfiguration);
  }
}

- (void)_endDeferringProxySheetConfigurationUpdates
{
  proxySheetConfigurationBeforeDeferring = self->__proxySheetConfigurationBeforeDeferring;
  if (proxySheetConfigurationBeforeDeferring)
  {
    self->__proxySheetConfigurationBeforeDeferring = 0;
    id v4 = proxySheetConfigurationBeforeDeferring;

    [(_UIRemoteViewController *)self _updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration:v4];
  }
}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
}

- (void)_sheetInteractionDraggingDidEnd
{
}

- (void)__viewServiceSheetPresentationClientConfigurationDidChange:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_UIRemoteViewController *)self _sheetPresentationController];
  [v8 _setRemoteClientConfiguration:v7];

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97___UIRemoteViewController___viewServiceSheetPresentationClientConfigurationDidChange_attributes___block_invoke;
    v9[3] = &unk_1E52D9F70;
    id v10 = v8;
    +[UIView _animateWithAttributes:v6 animations:v9 completion:0];
  }
}

- (void)__viewServiceSheetGrabberDidTriggerPrimaryAction
{
  id v2 = [(_UIRemoteViewController *)self _sheetPresentationController];
  [v2 _remoteSheetGrabberDidTriggerPrimaryAction];
}

- (void)__viewServiceSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  id v9 = [(_UIRemoteViewController *)self _sheetPresentationController];
  objc_msgSend(v9, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v7, a3, x, y);
}

- (void)__viewServiceSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  id v12 = [(_UIRemoteViewController *)self _sheetPresentationController];
  objc_msgSend(v12, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v7, v6, v11, v10, x, y);
}

- (void)__viewServiceSheetInteractionDraggingDidEnd
{
  id v2 = [(_UIRemoteViewController *)self _sheetPresentationController];
  [v2 _remoteSheetInteractionDraggingDidEnd];
}

- (void)__viewServiceDismissInteractionDidBeginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  BOOL v8 = [(_UIRemoteViewController *)self _ancestorZoomTransitionController];
  if (v8)
  {
    id v10 = v8;
    id v9 = [v8 dismissInteraction];
    objc_msgSend(v9, "beginAtLocation:withVelocity:", v7, v6, x, y);

    BOOL v8 = v10;
  }
}

- (void)__viewServiceDismissInteractionDidIssueUpdate:(id)a3
{
  id v7 = a3;
  id v4 = [(_UIRemoteViewController *)self _ancestorZoomTransitionController];
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 dismissInteraction];
    [v6 issueUpdate:v7];
  }
}

- (void)__viewServiceDismissInteractionDidDismissWithVelocity:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIRemoteViewController *)self _ancestorZoomTransitionController];
  if (v5)
  {
    id v7 = v5;
    double v6 = [v5 dismissInteraction];
    objc_msgSend(v6, "dismissWithVelocity:", x, y);

    id v5 = v7;
  }
}

- (void)__viewServiceDismissInteractionDidCancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  BOOL v8 = [(_UIRemoteViewController *)self _ancestorZoomTransitionController];
  if (v8)
  {
    id v10 = v8;
    id v9 = [v8 dismissInteraction];
    objc_msgSend(v9, "cancelWithVelocity:originalPosition:", v7, v6, x, y);

    BOOL v8 = v10;
  }
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  BOOL v8 = (void *)MEMORY[0x1E4F28B00];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 currentHandler];
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIRemoteViewController.m", 5278, @"Unexpected request to handle a non-proxy action: self: %@; interaction: %@; action: %@",
    self,
    v10,
    v9);
}

- (void)_physicalButtonProxyInteraction:(id)a3 didReceiveBSAction:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_physicalButtonProxyInteraction_didReceiveBSAction____s_category_0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v9 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v10 = NSString;
        id v11 = self;
        id v12 = (objc_class *)objc_opt_class();
        CGFloat v13 = NSStringFromClass(v12);
        id v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];
      }
      else
      {
        id v14 = @"(nil)";
      }
      id v15 = v14;
      CGFloat v16 = [v6 succinctDescription];
      *(_DWORD *)buf = 138412802;
      CGFloat v18 = v14;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Received proxy physicalButtonBSAction from interaction: self: %@; proxyInteraction: %@; physicalButtonBSAction: %@",
        buf,
        0x20u);
    }
  }
  objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidReceivePhysicalButtonBSAction:", v7);
}

- (void)__viewServiceDidUpdateResolvedPhysicalButtonConfigurations:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_serviceResolvedPhysicalButtonConfigurations = &self->_serviceResolvedPhysicalButtonConfigurations;
  id v7 = self->_serviceResolvedPhysicalButtonConfigurations;
  BOOL v8 = (_UIPhysicalButtonConfigurationSet *)v5;
  id v9 = v8;
  if (v7 == v8)
  {
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
    if (v8 && v7) {
      int v10 = [(_UIPhysicalButtonConfigurationSet *)v7 isEqual:v8];
    }
  }

  id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB25ACE8) + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSString;
    CGFloat v13 = self;
    id v14 = v11;
    id v15 = (objc_class *)objc_opt_class();
    CGFloat v16 = NSStringFromClass(v15);
    CGFloat v17 = [v12 stringWithFormat:@"<%@: %p>", v16, v13];

    id v18 = v17;
    __int16 v19 = [(_UIPhysicalButtonConfigurationSet *)v9 succinctDescription];
    *(_DWORD *)buf = 138543874;
    long long v34 = v17;
    __int16 v35 = 1026;
    int v36 = v10 ^ 1;
    __int16 v37 = 2114;
    *(void *)CGRect v38 = v19;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Received resolved configurations update from service: self: %{public}@; didChange: %{public}d; configurations: %{public}@",
      buf,
      0x1Cu);
  }
  if ((v10 & 1) == 0)
  {
    __int16 v20 = *p_serviceResolvedPhysicalButtonConfigurations;
    objc_storeStrong((id *)&self->_serviceResolvedPhysicalButtonConfigurations, a3);
    unsigned int v21 = _UIPBIProxyOwnerActionsForState(self->_proxyPhysicalButtonInteraction, v20, *p_serviceResolvedPhysicalButtonConfigurations);
    id v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB25ACF0) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = NSString;
      long long v24 = self;
      long long v25 = v22;
      long long v26 = (objc_class *)objc_opt_class();
      long long v27 = NSStringFromClass(v26);
      long long v28 = [v23 stringWithFormat:@"<%@: %p>", v27, v24];

      *(_DWORD *)buf = 138544386;
      long long v34 = v28;
      __int16 v35 = 1026;
      int v36 = v21 & 1;
      __int16 v37 = 1026;
      *(_DWORD *)CGRect v38 = HIBYTE(v21) & 1;
      *(_WORD *)&v38[4] = 1026;
      *(_DWORD *)&v38[6] = HIWORD(v21) & 1;
      __int16 v39 = 1026;
      int v40 = (v21 >> 8) & 1;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "Actions for resolved configurations update from service: %{public}@; shouldCreate: %{public}d; shouldDisable: %{"
        "public}d; shouldEnable: %{public}d; shouldUpdate: %{public}d",
        buf,
        0x24u);
    }
    if ((v21 & 0x1000000) != 0) {
      [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setEnabled:0];
    }
    double v29 = -[_UIPhysicalButtonConfigurationSet _nsSetRepresentation](*p_serviceResolvedPhysicalButtonConfigurations);
    if (v21)
    {
      long long v30 = (_UIPhysicalButtonProxyInteraction *)-[_UIPhysicalButtonProxyInteraction initWithConfigurations:proxyDelegate:]([_UIPhysicalButtonProxyInteraction alloc], (uint64_t)v29, self);
      proxyPhysicalButtonInteraction = self->_proxyPhysicalButtonInteraction;
      self->_proxyPhysicalButtonInteraction = v30;

      long long v32 = [(UIViewController *)self _existingView];
      [v32 addInteraction:self->_proxyPhysicalButtonInteraction];
    }
    else if ((v21 & 0x100) != 0)
    {
      [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setConfigurations:v29];
    }
    if ((v21 & 0x10000) != 0) {
      [(_UIPhysicalButtonInteraction *)self->_proxyPhysicalButtonInteraction _setEnabled:1];
    }
    -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](self, v20, *p_serviceResolvedPhysicalButtonConfigurations);
  }
}

- (void)_setUpHomeAffordanceObserverInteractionForViewIfNeeded:(id)a3
{
  id v4 = a3;
  if (_UIDeviceSupportsGlobalEdgeSwipeTouches()
    && _UIApplicationSupportsHomeAffordanceObservation()
    && !self->_proxyHomeAffordanceObserverInteraction)
  {
    objc_initWeak(&location, self);
    id v5 = [_UIHomeAffordanceObserverProxyInteraction alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82___UIRemoteViewController__setUpHomeAffordanceObserverInteractionForViewIfNeeded___block_invoke;
    v10[3] = &unk_1E5306388;
    objc_copyWeak(&v11, &location);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82___UIRemoteViewController__setUpHomeAffordanceObserverInteractionForViewIfNeeded___block_invoke_2;
    v8[3] = &unk_1E52DC888;
    objc_copyWeak(&v9, &location);
    id v6 = (_UIHomeAffordanceObserverProxyInteraction *)-[_UIHomeAffordanceObserverProxyInteraction initWithIntersectedFrameHandler:doubleTapGestureHandler:](v5, v10, v8);
    proxyHomeAffordanceObserverInteraction = self->_proxyHomeAffordanceObserverInteraction;
    self->_proxyHomeAffordanceObserverInteraction = v6;

    [v4 addInteraction:self->_proxyHomeAffordanceObserverInteraction];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldPropagateAppearanceCustomizations
{
  int v3 = [(id)objc_opt_class() shouldPropagateAppearanceCustomizations];
  if (v3) {
    LOBYTE(v3) = [(_UIRemoteViewService *)self->_remoteViewService overridesHostAppearance] ^ 1;
  }
  return v3;
}

- (void)_updateTintColor
{
  if ([(_UIRemoteViewController *)self shouldPropagateAppearanceCustomizations])
  {
    id v3 = [(UIView *)self->_serviceViewControllerRemoteView _normalInheritedTintColor];
    objc_msgSend(self->_viewControllerOperatorProxy, "__setHostTintColor:tintAdjustmentMode:", v3, -[UIView tintAdjustmentMode](self->_serviceViewControllerRemoteView, "tintAdjustmentMode"));
  }
}

- (void)_initializeAccessibilityPortInformation
{
  if (objc_opt_respondsToSelector())
  {
    ipc_space_t v3 = *MEMORY[0x1E4F14960];
    mach_port_name_t v4 = [(id)UIApp _accessibilityMachPort];
    mach_port_insert_right(v3, v4, [(id)UIApp _accessibilityMachPort], 0x14u);
    id v5 = objc_alloc(MEMORY[0x1E4F4F770]);
    id v6 = objc_msgSend(v5, "initWithPort:", objc_msgSend((id)UIApp, "_accessibilityMachPort"));
  }
  else
  {
    id v6 = 0;
  }
  objc_initWeak(&location, self);
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___UIRemoteViewController__initializeAccessibilityPortInformation__block_invoke;
  v8[3] = &unk_1E530D8F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(viewControllerOperatorProxy, "__exchangeAccessibilityPortInformation:replyHandler:", v6, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__showServiceForType:(int64_t)a3 withContext:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke;
  void v13[3] = &unk_1E52FE2B8;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  [v10 performAsync:v13];
}

- (void)__showServiceForText:(id)a3 selectedTextRangeValue:(id)a4 type:(int64_t)a5 fromRectValue:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke;
  v21[3] = &unk_1E52FC2E0;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  long long v25 = self;
  id v26 = v15;
  int64_t v27 = a5;
  id v17 = v15;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  [v16 performAsync:v21];
}

- (void)__showServiceForText:(id)a3 type:(int64_t)a4 fromRectValue:(id)a5 replyHandler:(id)a6
{
}

- (void)__dismissTextServiceSessionAnimated:(BOOL)a3
{
  id v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIRemoteViewController___dismissTextServiceSessionAnimated___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performAsync:v6];
}

- (void)_cancelProxiedEditAlertViewAnimated:(BOOL)a3
{
}

- (void)_endNoPresentingViewControllerAlertController:(id)a3
{
  mach_port_name_t v4 = (UIAlertController *)a3;
  [(UIAlertController *)v4 _endNoPresentingViewControllerPresentation];
  proxiedEditAlertController = self->_proxiedEditAlertController;

  if (proxiedEditAlertController == v4)
  {
    self->_proxiedEditAlertToken = 0;
    id v6 = self->_proxiedEditAlertController;
    self->_proxiedEditAlertController = 0;
  }
}

- (void)__showEditAlertViewWithToken:(int64_t)a3 canUndo:(BOOL)a4 canRedo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(UIViewController *)self _window];
  int v10 = v9;
  if (v9 && ![v9 _isHostedInAnotherProcess])
  {
    motionNotificationGenerator = self->_motionNotificationGenerator;
    if (!motionNotificationGenerator)
    {
      id v12 = [UINotificationFeedbackGenerator alloc];
      id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED3F7248];
      id v14 = +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:v13];
      id v15 = [(UIFeedbackGenerator *)v12 initWithConfiguration:v14];
      id v16 = self->_motionNotificationGenerator;
      self->_motionNotificationGenerator = v15;

      motionNotificationGenerator = self->_motionNotificationGenerator;
    }
    [(UIFeedbackGenerator *)motionNotificationGenerator activateWithCompletionBlock:0];
    id v17 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
    id v18 = _UIKitBundle();
    uint64_t v19 = [v18 localizedStringForKey:@"CANCEL_TITLE_IN_UNDO_ALERT" value:@"Cancel" table:@"Localizable"];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke;
    v48[3] = &unk_1E5302AC8;
    v48[4] = self;
    id v20 = v17;
    v49 = v20;
    v43 = (void *)v19;
    unsigned int v21 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v48];
    int v22 = v6 && v5;
    if (!v6 || !v5) {
      [(UIAlertController *)v20 addAction:v21];
    }
    if (v6 || v5)
    {
      if (v6)
      {
        id v24 = _UIKitBundle();
        [v24 localizedStringForKey:@"UNDO_BUTTON_TITLE_IN_UNDO_ALERT" value:@"Undo" table:@"Localizable"];
        long long v25 = v42 = v22;

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_3;
        v46[3] = &unk_1E5302AC8;
        v46[4] = self;
        int64_t v26 = a3;
        int64_t v27 = v20;
        v47 = v27;
        long long v28 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v46];
        double v29 = v27;
        a3 = v26;
        [(UIAlertController *)v29 addAction:v28];

        int v22 = v42;
      }
      if (v5)
      {
        long long v30 = _UIKitBundle();
        uint64_t v31 = [v30 localizedStringForKey:@"REDO_BUTTON_TITLE_IN_UNDO_ALERT" value:@"Redo" table:@"Localizable"];

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_5;
        v44[3] = &unk_1E5302AC8;
        v44[4] = self;
        long long v32 = v21;
        long long v33 = v20;
        v45 = v33;
        long long v34 = +[UIAlertAction actionWithTitle:v31 style:0 handler:v44];
        __int16 v35 = v33;
        unsigned int v21 = v32;
        [(UIAlertController *)v35 addAction:v34];
      }
      int v36 = _UIKitBundle();
      id v23 = [v36 localizedStringForKey:@"UNDO_TITLE_LABEL_IN_UNDO_ALERT" value:@"Undo" table:@"Localizable"];
    }
    else
    {
      id v23 = _UINSLocalizedStringWithDefaultValue(@"Nothing to Undo", @"Nothing to Undo");
    }
    [(UIAlertController *)v20 setTitle:v23];

    if (v22) {
      [(UIAlertController *)v20 addAction:v21];
    }
    [(UINotificationFeedbackGenerator *)self->_motionNotificationGenerator _privateNotificationOccurred:1006];
    [(UIFeedbackGenerator *)self->_motionNotificationGenerator deactivate];
    self->_proxiedEditAlertToken = a3;
    proxiedEditAlertController = self->_proxiedEditAlertController;
    self->_proxiedEditAlertController = v20;
    CGRect v38 = v20;

    __int16 v39 = self->_proxiedEditAlertController;
    int v40 = [(UIViewController *)self _window];
    uint64_t v41 = [v40 windowScene];
    [(UIAlertController *)v39 _beginNoPresentingViewControllerPresentation:v41];
  }
  else
  {
    objc_msgSend(self->_viewControllerOperatorProxy, "__cancelAlertActionWithToken:", self->_proxiedEditAlertToken);
  }
}

- (BOOL)__interdictServiceViewTouches
{
  return self->_viewServiceTouchInterdictionView != 0;
}

- (void)__setInterdictServiceViewTouches:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_viewServiceTouchInterdictionView removeFromSuperview];
  if (v3)
  {
    BOOL v5 = objc_alloc_init(UIView);
    viewServiceTouchInterdictionView = self->_viewServiceTouchInterdictionView;
    self->_viewServiceTouchInterdictionView = v5;

    BOOL v7 = [(UIView *)self->_viewServiceTouchInterdictionView layer];
    [v7 setHitTestsAsOpaque:1];

    [(_UIRemoteViewController *)self updateTouchInterdictionViewLayout];
  }
  else
  {
    id v8 = self->_viewServiceTouchInterdictionView;
    self->_viewServiceTouchInterdictionView = 0;
  }
}

- (void)updateTouchInterdictionViewLayout
{
  id v7 = [(UIView *)self->_sizeTrackingView superview];
  if (v7
    && ([(UIViewController *)self _window],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 screen],
        mach_port_name_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 _isMainLikeScreen],
        v4,
        v3,
        v5))
  {
    [v7 insertSubview:self->_viewServiceTouchInterdictionView aboveSubview:self->_sizeTrackingView];
    viewServiceTouchInterdictionView = self->_viewServiceTouchInterdictionView;
    [(UIView *)self->_sizeTrackingView frame];
    -[UIView setFrame:](viewServiceTouchInterdictionView, "setFrame:");
  }
  else
  {
    [(UIView *)self->_viewServiceTouchInterdictionView removeFromSuperview];
  }
}

- (void)_noteWindowState:(BOOL)a3
{
  BOOL v4 = !a3;
  [(UIView *)self->_fullScreenTextEffectsSnapshotView setHidden:v4];
  [(UIView *)self->_fullScreenTextEffectsRemoteView setHidden:v4];
  [(UIView *)self->_textEffectsAboveStatusBarRemoteView setHidden:v4];
  remoteKeyboardRemoteView = self->_remoteKeyboardRemoteView;
  [(UIView *)remoteKeyboardRemoteView setHidden:v4];
}

- (void)setServiceViewShouldShareTouchesWithHost:(BOOL)a3
{
  if (self->_serviceViewShouldShareTouchesWithHost != a3)
  {
    self->_serviceViewShouldShareTouchesWithHost = a3;
    if (a3) {
      [(_UIRemoteViewController *)self _prepareTouchDeliveryPolicy];
    }
    else {
      [(_UIRemoteViewController *)self _setTouchDeliveryPolicyAssertion:0];
    }
  }
}

- (void)_prepareTouchDeliveryPolicy
{
  if ([(_UIRemoteViewController *)self serviceViewShouldShareTouchesWithHost])
  {
    serviceViewControllerRemoteView = self->_serviceViewControllerRemoteView;
    if (serviceViewControllerRemoteView)
    {
      int v5 = [(UIView *)serviceViewControllerRemoteView _window];

      if (v5)
      {
        BOOL v6 = [(_UIRemoteView *)self->_serviceViewControllerRemoteView hostedWindowHostingHandle];
        uint64_t v7 = [v6 contextID];

        id v8 = [(UIView *)self->_serviceViewControllerRemoteView _window];
        uint64_t v9 = [v8 _contextId];

        id v10 = objc_alloc_init(MEMORY[0x1E4F4F3E8]);
        id v11 = [MEMORY[0x1E4F4F3E0] policyRequiringSharingOfTouchesDeliveredToChildContextId:v7 withHostContextId:v9];
        id v12 = [v10 endpoint];
        [v11 setAssertionEndpoint:v12];

        uint64_t v15 = MEMORY[0x1E4F143A8];
        SEL v17 = a2;
        id v13 = v11;
        id v16 = v13;
        id v14 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
        if (v14)
        {
          -[_UIRemoteViewController _setTouchDeliveryPolicyAssertion:](self, "_setTouchDeliveryPolicyAssertion:", v10, v15, 3221225472, __54___UIRemoteViewController__prepareTouchDeliveryPolicy__block_invoke, &unk_1E530D918, v13, v17);
          objc_msgSend(v14, "ipc_addPolicy:", v13);
        }
      }
    }
  }
}

- (id)_cancelTouchesForCurrentEventInHostedContent
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  BOOL v3 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  if (!v3)
  {
    id v14 = 0;
    goto LABEL_28;
  }
  BOOL v4 = [(UIView *)self->_serviceViewControllerRemoteView _window];
  int v5 = [(_UIRemoteView *)self->_serviceViewControllerRemoteView hostedWindowHostingHandle];
  uint64_t v6 = [v5 contextID];
  if (!v5)
  {
    id v15 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  id v8 = (id)[(id)UIApp _touchesEventForWindow:v4];
  if (!v8
    || ((uint64_t v9 = v8,
         [(UIView *)self->_serviceViewControllerRemoteView _window],
         id v10 = objc_claimAutoreleasedReturnValue(),
         [v9 _initialTouchTimestampForWindow:v10],
         double v12 = v11,
         v10,
         v12 > 0.0)
      ? (BOOL v13 = v7 == 0)
      : (BOOL v13 = 1),
        v13))
  {
    id v16 = 0;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F4F3E0] policyCancelingTouchesDeliveredToContextId:v7 withInitialTouchTimestamp:v12];
  }
  id v17 = (id)[(id)UIApp _scrollEventForWindow:v4];
  if (!v17 || (([v17 _beganScrollTimestamp], v18 > 0.0) ? (BOOL v19 = v7 == 0) : (BOOL v19 = 1), v19))
  {
    id v15 = 0;
    if (!v16) {
      goto LABEL_23;
    }
LABEL_19:
    if (v15)
    {
      id v20 = (void *)MEMORY[0x1E4F4F3E0];
      v27[0] = v16;
      v27[1] = v15;
      unsigned int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      id v22 = [v20 policyByCombiningPolicies:v21];

      if (!v22) {
        goto LABEL_24;
      }
    }
    else
    {
      id v22 = v16;
      id v16 = v22;
    }
LABEL_26:
    id v14 = objc_alloc_init(MEMORY[0x1E4F4F3E8]);
    id v23 = [v14 endpoint];
    [v22 setAssertionEndpoint:v23];

    objc_msgSend(v3, "ipc_addPolicy:", v22);
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E4F4F3E0], "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v16) {
    goto LABEL_19;
  }
LABEL_23:
  id v15 = v15;
  id v16 = 0;
  id v22 = v15;
  if (v15) {
    goto LABEL_26;
  }
LABEL_24:
  id v14 = 0;
LABEL_27:

LABEL_28:
  return v14;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  if (self->__viewClipsToBounds != a3)
  {
    BOOL v3 = a3;
    self->__viewClipsToBounds = a3;
    id v4 = [(UIViewController *)self view];
    [v4 setClipsToBounds:v3];
  }
}

- (void)__trampolineButtonPressData:(id)a3 canceled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (qword_1EB25AD00 != -1) {
    dispatch_once(&qword_1EB25AD00, &__block_literal_global_666);
  }
  uint64_t v7 = MEMORY[0x18C105F40](*MEMORY[0x1E4F1CF80], v6);
  if (v7)
  {
    id v8 = (const void *)v7;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)qword_1EB25ACF8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        if (_UIApplicationPressEventConformsToType((uint64_t)v8, objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "integerValue", (void)v18)))
        {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_15;
        }
      }

      id v14 = (void *)UIApp;
      if (v4)
      {
        id v15 = [(UIViewController *)self _window];
        id v16 = (id)[v14 _pressesEventForWindow:v15];

        id v17 = (void *)UIApp;
        id v9 = [v16 allPresses];
        [v17 _cancelTouchesOrPresses:v9 withEvent:v16];
        goto LABEL_15;
      }
      [(id)UIApp _enqueueHIDEvent:v8];
    }
    else
    {
LABEL_15:
    }
    CFRelease(v8);
  }
}

- (void)__handleFocusMovementAction:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(UIViewController *)self _window];
    [v5 _forwardFocusMovementAction:v4];
  }
}

- (id)_timelineID
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"UIRemoteViewController:%p", self);
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64___UIRemoteViewController__timelinesForDateInterval_completion___block_invoke;
  v9[3] = &unk_1E52E3BB0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(viewControllerOperatorProxy, "__timelinesForDateInterval:completion:", a3, v9);
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIRemoteViewController *)self _timelineID];
  id v12 = [v7 entrySpecifierForTimelineIdentifier:v8];

  id viewControllerOperatorProxy = self->_viewControllerOperatorProxy;
  id v10 = [v12 timelineEntry];
  uint64_t v11 = [v10 presentationTime];
  objc_msgSend(viewControllerOperatorProxy, "__updateWithFrameSpecifierDate:completion:", v11, v6);
}

- (BOOL)_allowsShielding
{
  id v3 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v4 = [(_UIRemoteViewService *)self->_remoteViewService plugin];
  id v5 = [v4 identifier];
  id v6 = (void *)[v3 initWithBundleIdentifier:v5 error:0];

  if (v6)
  {
    id v7 = [v6 containingBundleRecord];
    id v8 = [v7 bundleIdentifier];
    id v9 = _UIMainBundleIdentifier();
    if ([v8 isEqualToString:v9]) {
      char v10 = 1;
    }
    else {
      char v10 = [v6 optsOutOfAppProtectionShield];
    }
  }
  else
  {
    char v10 = [0 optsOutOfAppProtectionShield];
  }

  return v10 ^ 1;
}

- (void)setupAppProtectionIfNecessary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 8) == 0)
  {
    *(unsigned char *)&self->_remoteViewControllerFlags |= 8u;
    if ([(_UIRemoteViewController *)self _allowsShielding])
    {
      id v3 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];

      if (v3)
      {
        id v4 = objc_alloc(MEMORY[0x1E4F223A0]);
        id v5 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
        id v27 = 0;
        id v6 = (void *)[v4 initWithBundleIdentifier:v5 error:&v27];
        id v7 = v27;

        if (!v7)
        {
          id v8 = (APExtension *)[objc_alloc((Class)getAPExtensionClass()) initWithApplicationExtensionRecord:v6];
          appProtectionExtension = self->_appProtectionExtension;
          self->_appProtectionExtension = v8;
        }
        if (self->_appProtectionExtension) {
          goto LABEL_12;
        }
        char v10 = [(_UIRemoteViewService *)self->_remoteViewService plugin];
        uint64_t v11 = [v10 uuid];

        if (v11)
        {
          id v12 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            if ([getAPExtensionClass() instancesRespondToSelector:sel_initWithExtensionUUID_bundleIdentifier_])
            {
              id v14 = objc_alloc((Class)getAPExtensionClass());
              id v15 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
              id v16 = (APExtension *)[v14 initWithExtensionUUID:v11 bundleIdentifier:v15];
              id v17 = self->_appProtectionExtension;
              self->_appProtectionExtension = v16;
            }
          }
        }

        if (self->_appProtectionExtension)
        {
LABEL_12:
          uint64_t v28 = 0;
          double v29 = &v28;
          uint64_t v30 = 0x2050000000;
          long long v18 = (void *)qword_1EB25AD48;
          uint64_t v31 = qword_1EB25AD48;
          if (!qword_1EB25AD48)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getAPExtensionSubjectMonitorRegistryClass_block_invoke;
            long long v33 = &unk_1E52D9900;
            long long v34 = &v28;
            __getAPExtensionSubjectMonitorRegistryClass_block_invoke((uint64_t)buf);
            long long v18 = (void *)v29[3];
          }
          long long v19 = v18;
          _Block_object_dispose(&v28, 8);
          long long v20 = (APExtensionSubjectMonitorRegistry *)[[v19 alloc] initWithExtensionSubject:self->_appProtectionExtension];
          appProtectionSubjectMonitorRegistrdouble y = self->_appProtectionSubjectMonitorRegistry;
          self->_appProtectionSubjectMonitorRegistrdouble y = v20;

          id v22 = (id)[(APExtensionSubjectMonitorRegistry *)self->_appProtectionSubjectMonitorRegistry addMonitor:self];
          [(APExtensionSubjectMonitorRegistry *)self->_appProtectionSubjectMonitorRegistry resume];
        }
        else
        {
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD08);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            id v24 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = v24;
              int64_t v26 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v26;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v7;
              _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Couldn't find app protection extension for: %@ error: %@", buf, 0x16u);
            }
          }
        }
        [(_UIRemoteViewController *)self presentAppProtectionShieldIfServiceCurrentlyRequiresAuth];
      }
    }
  }
}

- (void)createAppProtectionShieldView
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_appProtectionShieldView)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"UIRemoteViewController.m" lineNumber:5852 description:@"App protection view already exists"];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v4 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
  id v35 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 error:&v35];
  id v34 = v35;

  if (v34)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD10);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v28 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        double v29 = v28;
        uint64_t v30 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Couldn't fetch bundle record for %@. Error: %@", buf, 0x16u);
      }
    }
  }
  id v7 = [v5 appProtectionEffectiveContainer];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];
  if (v8)
  {
    if (v7)
    {
LABEL_7:
      id v9 = v7;
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = [v5 containingBundleRecord];
    if (v7) {
      goto LABEL_7;
    }
  }
  id v9 = [(_UIRemoteViewController *)self _extensionBundleIdentifierForAppProtection];
LABEL_10:
  char v10 = v9;
  uint64_t v11 = [v8 localizedName];
  id v12 = v11;
  if (v11)
  {
    id v32 = v11;
  }
  else
  {
    BOOL v13 = [(_UIRemoteViewService *)self->_remoteViewService plugin];
    id v32 = [v13 localizedName];
  }
  long long v33 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v10];
  id v14 = objc_alloc(MEMORY[0x1E4F6F258]);
  id v15 = [(UIViewController *)self traitCollection];
  [v15 displayScale];
  id v17 = objc_msgSend(v14, "initWithSize:scale:", 64.0, 64.0, v16);

  [v17 setDrawBorder:1];
  long long v18 = [v33 prepareImageForDescriptor:v17];
  uint64_t v19 = [v18 CGImage];
  [v18 scale];
  long long v20 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v19, 0);
  uint64_t v36 = 0;
  __int16 v37 = &v36;
  uint64_t v38 = 0x2050000000;
  long long v21 = (void *)qword_1EB25AD50;
  uint64_t v39 = qword_1EB25AD50;
  if (!qword_1EB25AD50)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAPBaseExtensionShieldViewClass_block_invoke;
    uint64_t v41 = &unk_1E52D9900;
    int v42 = &v36;
    __getAPBaseExtensionShieldViewClass_block_invoke((uint64_t)buf);
    long long v21 = (void *)v37[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v36, 8);
  uint64_t v23 = (UIView *)[[v22 alloc] initWithLocalizedApplicationName:v32 iconImage:v20];
  [(UIView *)v23 setDelegate:self];
  uint64_t v31 = v5;
  appProtectionShieldView = self->_appProtectionShieldView;
  self->_appProtectionShieldView = v23;
  uint64_t v25 = v23;

  [(UIView *)self->_appProtectionShieldView setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)presentAppProtectionShieldUnconditionallyIfProtectionIsEnabled
{
  if ([(APExtension *)self->_appProtectionExtension isEffectivelyLocked])
  {
    [(_UIRemoteViewController *)self presentAppProtectionShieldView];
  }
}

- (void)presentAppProtectionShieldIfServiceCurrentlyRequiresAuth
{
  if ([(APExtension *)self->_appProtectionExtension requiresShielding])
  {
    [(_UIRemoteViewController *)self presentAppProtectionShieldView];
  }
}

- (void)requestAppProtectionAuthIfNecessary
{
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 0x10) != 0)
  {
    if ([(APExtension *)self->_appProtectionExtension requiresShielding])
    {
      appProtectionShieldView = self->_appProtectionShieldView;
      [(_UIRemoteViewController *)self shieldViewUnlockButtonPressed:appProtectionShieldView];
    }
    else
    {
      [(_UIRemoteViewController *)self removeAppProtectionShieldView];
    }
  }
}

- (void)presentAppProtectionShieldView
{
  v23[4] = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 0x10) == 0)
  {
    if (!self->_appProtectionShieldView) {
      [(_UIRemoteViewController *)self createAppProtectionShieldView];
    }
    id v3 = [(UIViewController *)self view];
    [v3 addSubview:self->_appProtectionShieldView];

    id v15 = (void *)MEMORY[0x1E4F5B268];
    long long v21 = [(UIView *)self->_appProtectionShieldView leftAnchor];
    id v22 = [(UIViewController *)self view];
    long long v20 = [v22 leftAnchor];
    uint64_t v19 = [v21 constraintEqualToAnchor:v20];
    v23[0] = v19;
    id v17 = [(UIView *)self->_appProtectionShieldView topAnchor];
    long long v18 = [(UIViewController *)self view];
    double v16 = [v18 topAnchor];
    id v14 = [v17 constraintEqualToAnchor:v16];
    v23[1] = v14;
    id v4 = [(UIView *)self->_appProtectionShieldView rightAnchor];
    id v5 = [(UIViewController *)self view];
    id v6 = [v5 rightAnchor];
    id v7 = [v4 constraintEqualToAnchor:v6];
    v23[2] = v7;
    id v8 = [(UIView *)self->_appProtectionShieldView bottomAnchor];
    id v9 = [(UIViewController *)self view];
    char v10 = [v9 bottomAnchor];
    uint64_t v11 = [v8 constraintEqualToAnchor:v10];
    v23[3] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v15 activateConstraints:v12];

    BOOL v13 = [(_UIRemoteViewController *)self _sheetPresentationController];
    [v13 _tryToConnectToRemoteSheet:0];

    *(unsigned char *)&self->_remoteViewControllerFlags |= 0x10u;
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidPresentShieldViewForAppProtection");
  }
}

- (void)removeAppProtectionShieldView
{
  BSDispatchQueueAssertMain();
  if ((*(unsigned char *)&self->_remoteViewControllerFlags & 0x10) != 0)
  {
    *(unsigned char *)&self->_remoteViewControllerFlags &= ~0x10u;
    [(UIView *)self->_appProtectionShieldView removeFromSuperview];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56___UIRemoteViewController_removeAppProtectionShieldView__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    [(_UIRemoteViewController *)self synchronizeAnimationsInActions:v3];
    objc_msgSend(self->_viewControllerOperatorProxy, "__hostDidDismissShieldViewForAppProtection");
  }
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD18) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Shield view unlock button pressed", buf, 2u);
  }
  objc_initWeak(&location, self);
  if (self->_appProtectionExtension)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v6 = (void *)qword_1EB25AD60;
    uint64_t v21 = qword_1EB25AD60;
    if (!qword_1EB25AD60)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __getAPGuardClass_block_invoke;
      double v16 = &unk_1E52D9900;
      id v17 = &v18;
      __getAPGuardClass_block_invoke((uint64_t)buf);
      id v6 = (void *)v19[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = [v7 sharedGuard];
    appProtectionExtension = self->_appProtectionExtension;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke;
    v10[3] = &unk_1E530D960;
    objc_copyWeak(&v11, &location);
    [v8 authenticateForExtension:appProtectionExtension completion:v10];

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___UIRemoteViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E52D9960;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_allowsConnection
{
  return (*(unsigned char *)&self->_remoteViewControllerFlags & 0x10) == 0;
}

- (BOOL)_isAppProtectionLocked
{
  return (*(unsigned char *)&self->_remoteViewControllerFlags >> 4) & 1;
}

- (void)_intelligenceCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
}

- (BKSTouchDeliveryPolicyAssertion)_touchDeliveryPolicyAssertion
{
  return self->_touchDeliveryPolicyAssertion;
}

- (void)_setTouchDeliveryPolicyAssertion:(id)a3
{
}

- (BOOL)_isUpdatingSize
{
  return self->_isUpdatingSize;
}

- (void)_setIsUpdatingSize:(BOOL)a3
{
  self->_isUpdatingSize = a3;
}

- (BOOL)_isUpdatingSizeInHost
{
  return self->_isUpdatingSizeInHost;
}

- (void)_setIsUpdatingSizeInHost:(BOOL)a3
{
  self->_isUpdatingSizeInHost = a3;
}

- (_UIRemoteViewService)_remoteViewService
{
  return self->_remoteViewService;
}

- (_UIZoomTransitionController)_ancestorZoomTransitionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestorZoomTransitionController);
  return (_UIZoomTransitionController *)WeakRetained;
}

- (void)set_ancestorZoomTransitionController:(id)a3
{
}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  return self->__sheetConfiguration;
}

- (BOOL)serviceViewShouldShareTouchesWithHost
{
  return self->_serviceViewShouldShareTouchesWithHost;
}

- (BOOL)_viewClipsToBounds
{
  return self->__viewClipsToBounds;
}

- (_UISheetPresentationControllerConfiguration)_proxySheetConfigurationBeforeDeferring
{
  return self->__proxySheetConfigurationBeforeDeferring;
}

- (void)set_proxySheetConfigurationBeforeDeferring:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__proxySheetConfigurationBeforeDeferring, 0);
  objc_storeStrong((id *)&self->__sheetConfiguration, 0);
  objc_destroyWeak((id *)&self->_ancestorZoomTransitionController);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_droppedTouchLoggingInhibitor, 0);
  objc_destroyWeak((id *)&self->_associatedRemoteContentRegistry);
  objc_storeStrong((id *)&self->_mutableKeyboardSceneLayers, 0);
  objc_storeStrong((id *)&self->_keyboardProxyPresentationEnvironment, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_multitaskingDragExclusionRects, 0);
  objc_storeStrong((id *)&self->_motionNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_proxiedEditAlertController, 0);
  objc_storeStrong((id *)&self->_viewServiceTouchInterdictionView, 0);
  objc_storeStrong((id *)&self->_sizeTrackingConstraints, 0);
  objc_storeStrong((id *)&self->_allowedNotifications, 0);
  objc_storeStrong((id *)&self->_proxyHomeAffordanceObserverInteraction, 0);
  objc_storeStrong((id *)&self->_dynamicButtonDeferringToken, 0);
  objc_storeStrong((id *)&self->_proxyPhysicalButtonInteraction, 0);
  objc_storeStrong((id *)&self->_serviceResolvedPhysicalButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_keyboardEnvironmentDeferringToken, 0);
  objc_storeStrong((id *)&self->_touchGrabbingView, 0);
  objc_storeStrong((id *)&self->_hostedDimmingView, 0);
  objc_storeStrong((id *)&self->_textServiceSession, 0);
  objc_storeStrong((id *)&self->_terminationError, 0);
  objc_storeStrong((id *)&self->_terminationInvocation, 0);
  objc_storeStrong((id *)&self->_serviceSceneContext, 0);
  objc_storeStrong((id *)&self->_lastNotifiedServiceScreenDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_fullScreenTextEffectsSnapshotView, 0);
  objc_storeStrong((id *)&self->_remoteKeyboardRemoteView, 0);
  objc_storeStrong((id *)&self->_textEffectsAboveStatusBarRemoteView, 0);
  objc_storeStrong((id *)&self->_fullScreenTextEffectsRemoteView, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerRemoteView, 0);
  objc_storeStrong((id *)&self->_sizeTrackingView, 0);
  objc_storeStrong((id *)&self->_textEffectsOperatorHalfDisconnectionInvocation, 0);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong((id *)&self->_viewControllerOperatorHalfDisconnectionInvocation, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorRegistry, 0);
  objc_storeStrong((id *)&self->_appProtectionShieldView, 0);
  objc_storeStrong((id *)&self->_appProtectionExtension, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerSupportedInterfaceOrientations, 0);
  objc_storeStrong(&self->_serviceViewControllerControlMessageProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewService, 0);
  objc_storeStrong((id *)&self->_serviceInterface, 0);
  objc_storeStrong((id *)&self->_serviceBundleIdentifier, 0);
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = [v4 code] == 1;
    id v4 = v7;
    if (!v5)
    {
      id v6 = NSStringFromSelector(a2);
      NSLog(&stru_1ED1743A0.isa, v6, v7);

      id v4 = v7;
    }
  }
}

- (id)serviceViewControllerProxy
{
  return self->_serviceViewControllerProxy;
}

- (id)serviceViewControllerProxyWithErrorHandler:(id)a3
{
  return (id)[self->_serviceViewControllerProxy remoteObjectProxyWithErrorHandler:a3];
}

+ (id)serviceViewControllerInterface
{
  return 0;
}

+ (id)exportedInterface
{
  return 0;
}

- (NSString)debugDescription
{
  if (os_variant_has_internal_diagnostics())
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIRemoteViewController;
    BOOL v5 = [(_UIRemoteViewController *)&v10 debugDescription];
    uint64_t v6 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
    id v7 = (void *)v6;
    if (self->_serviceBundleIdentifier) {
      id v8 = @"extension";
    }
    else {
      id v8 = @"view service";
    }
    id v3 = [v5 stringByAppendingFormat:@" serviceBundleIdentifier=%@ [%@]", v6, v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIRemoteViewController;
    id v3 = [(_UIRemoteViewController *)&v9 debugDescription];
  }
  return (NSString *)v3;
}

@end