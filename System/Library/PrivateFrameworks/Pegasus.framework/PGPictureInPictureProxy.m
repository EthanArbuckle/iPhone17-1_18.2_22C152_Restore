@interface PGPictureInPictureProxy
+ (BOOL)isPictureInPictureActive;
+ (BOOL)isPictureInPictureSupported;
+ (id)pictureInPictureProxyWithControlsStyle:(int64_t)a3 viewController:(id)a4;
+ (void)_updatePictureInPictureActive:(BOOL)a3;
- (BOOL)_canBeShownInMicroPIPMode;
- (BOOL)_isInCallService;
- (BOOL)_isInactive;
- (BOOL)_isViewControllerWindowSceneActive;
- (BOOL)_isViewControllerWindowSceneConsideredActive;
- (BOOL)automaticallyInterruptsForLegacyFaceTimeBehaviors;
- (BOOL)canSwitchCamera;
- (BOOL)disablesLayerCloning;
- (BOOL)isCameraActive;
- (BOOL)isMicrophoneMuted;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPictureInPictureInterrupted;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPictureInPictureStashed;
- (BOOL)isPictureInPictureStashedOrUnderLock;
- (BOOL)isPictureInPictureSuspended;
- (BOOL)isReadyForDisplay;
- (BOOL)pictureInPictureShouldStartWhenEnteringBackground;
- (BOOL)pictureInPictureWasStartedWhenEnteringBackground;
- (CGRect)_viewFrameForTransitionAnimationAssumeApplicationActive:(BOOL)a3;
- (PGPictureInPictureProxy)init;
- (PGPictureInPictureProxy)initWithControlsStyle:(int64_t)a3 viewController:(id)a4;
- (PGPictureInPictureProxyDelegate)delegate;
- (PGPictureInPictureViewController)viewController;
- (PGPlaybackState)playbackState;
- (double)playbackProgress;
- (double)playbackRate;
- (id)_bestKnownConnectedSceneSessionPersistentIdentifier;
- (id)_connection;
- (id)_expectedScene;
- (id)_generatePlaybackStateDiffAndMarkAsSent;
- (id)_pipStopFinalStageCompletionHandler;
- (id)_pipStopUserInterfaceRestoreContinuationBlock;
- (id)_remoteObject;
- (id)_remoteObjectWithErrorHandler:(id)a3;
- (id)_sourceScene;
- (id)clientSessionIdentifier;
- (id)loadedTimeRanges;
- (id)menuItems;
- (int64_t)_activationState;
- (int64_t)_interfaceOrientationForTransitionAnimationAssumeApplicationActive:(BOOL)a3;
- (int64_t)controlsStyle;
- (unint64_t)resourcesUsageReductionReasons;
- (void)__actuallyStartWithAnimationType:(int64_t)a3 successHandler:(id)a4 failureHandler:(id)a5;
- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 finalLayerFrame:(CGRect)a5 finalInterfaceOrientation:(int64_t)a6 completionHandler:(id)a7;
- (void)__cleanupWithCompletionHandler:(id)a3;
- (void)__coordinateStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)__didStartWithAnimationType:(int64_t)a3 completionHandler:(id)a4;
- (void)__restoreUserInterfaceAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)__setConnection:(id)a3;
- (void)__setupStartWithAnimationType:(int64_t)a3 initialLayerFrame:(CGRect)a4 successHandler:(id)a5 failureHandler:(id)a6;
- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 successHandler:(id)a5 failureHandler:(id)a6;
- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 waitForApplicationActivation:(BOOL)a5 successHandler:(id)a6 failureHandler:(id)a7;
- (void)__updateCancellationPolicyWithSuccessHandler:(id)a3 failureHandler:(id)a4;
- (void)__waitForApplicationActivationWithSuccessHandler:(id)a3 failureHandler:(id)a4;
- (void)_addViewControllerToHostedWindowIfNeeded;
- (void)_addWindowSceneActivationStateObserverIfNeeded:(id)a3;
- (void)_applicationDidBecomeActive;
- (void)_beginDeactivatingPictureInPicture;
- (void)_beginDeactivatingPictureInPictureWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4;
- (void)_cancelPrewarming;
- (void)_deactivateIfNeededForInterruptedOrInvalidatedConnection;
- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4;
- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4 cleanupHandlerOrNil:(id)a5;
- (void)_establishConnection;
- (void)_executeDelegateCallbackBlock:(id)a3 assumeApplicationActive:(BOOL)a4;
- (void)_handleSceneConnectionChangedNotification:(id)a3;
- (void)_initializeWithControlsStyle:(int64_t)a3 viewController:(id)a4 reason:(id)a5;
- (void)_invalidateConnectionForFailure;
- (void)_legacyPictureInPictureInterruptionBegan;
- (void)_legacyPictureInPictureInterruptionEnded;
- (void)_markConnectionAsInterrupted;
- (void)_notifyActionButtonTapped;
- (void)_pipSceneComponentDidConnect:(id)a3;
- (void)_pipSceneComponentDidDisconnect:(id)a3;
- (void)_prewarmAndStartAfterTimeout;
- (void)_removeViewControllerFromHostedWindowIfNeeded;
- (void)_resetInternalState;
- (void)_restoreInterruptedConnectionIfNeeded;
- (void)_setActivationState:(int64_t)a3 reason:(id)a4;
- (void)_setInterruptedForDefaultReason:(BOOL)a3 initiatedByRemoteObject:(BOOL)a4;
- (void)_setMaybeNeedsUpdatePlaybackState;
- (void)_setPictureInPictureActive:(BOOL)a3;
- (void)_setPictureInPicturePossible:(BOOL)a3;
- (void)_setPictureInPictureSuspended:(BOOL)a3;
- (void)_setRequestedWindowScene:(id)a3;
- (void)_setResourcesUsageReductionReasons:(unint64_t)a3;
- (void)_setStashedOrUnderLock:(BOOL)a3 reason:(id)a4;
- (void)_startBackgroundPIPWhilePrewarmingIfNeeded;
- (void)_startPictureInPictureAnimated:(BOOL)a3 enteringBackground:(BOOL)a4 reason:(id)a5 withCompletionHandler:(id)a6;
- (void)_stopObservingWindowSceneActivationState;
- (void)_stopPictureInPictureAnimated:(BOOL)a3 restoreUserInterface:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock:(id)a3 completionHandler:(id)a4;
- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded;
- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:(id)a3;
- (void)_updateFaceTimePlaybackStateUsingBlock:(id)a3;
- (void)_updateInteractiveFrameWorkaroundFor_100127310:(id)a3;
- (void)_updateIsInterruptedIfNeededForReason:(id)a3;
- (void)_updateIsInterruptedIfNeededForReason:(id)a3 initiatedByRemoteObject:(BOOL)a4;
- (void)_updatePlaybackStateContentTypeIfNeeded;
- (void)_updatePlaybackStateIfNeeded;
- (void)_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3;
- (void)_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3;
- (void)actionButtonTapped;
- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3;
- (void)handleCommand:(id)a3;
- (void)hostedWindowSizeChangeBegan;
- (void)hostedWindowSizeChangeEnded;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4;
- (void)pagingSkipByNumberOfPages:(int64_t)a3;
- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)pictureInPictureInvalidated;
- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)preferredContentSizeDidChangeForViewController;
- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)setAutomaticallyInterruptsForLegacyFaceTimeBehaviors:(BOOL)a3;
- (void)setCameraActive:(BOOL)a3;
- (void)setCanSwitchCamera:(BOOL)a3;
- (void)setClientSessionIdentifier:(id)a3;
- (void)setControlsStyle:(int64_t)a3;
- (void)setControlsStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDisablesLayerCloning:(BOOL)a3;
- (void)setLoadedTimeRanges:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOverrideInterruptionExemptionIdentifier:(id)a3;
- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3;
- (void)setPlaybackProgress:(double)a3 playbackRate:(double)a4;
- (void)setReadyForDisplay:(BOOL)a3;
- (void)setResourcesUsageReductionReasons:(unint64_t)a3;
- (void)setStashed:(BOOL)a3;
- (void)setStashedOrUnderLock:(BOOL)a3;
- (void)set_pipStopFinalStageCompletionHandler:(id)a3;
- (void)set_pipStopUserInterfaceRestoreContinuationBlock:(id)a3;
- (void)skipForwardButtonTappedWithTimeInterval:(double)a3;
- (void)startPictureInPicture;
- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3;
- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6;
- (void)updatePictureInPicturePossible:(BOOL)a3;
- (void)updatePlaybackStateUsingBlock:(id)a3;
- (void)viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController;
- (void)windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController;
@end

@implementation PGPictureInPictureProxy

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken_0 != -1) {
    dispatch_once(&isPictureInPictureSupported_onceToken_0, &__block_literal_global_13);
  }
  return isPictureInPictureSupported_isPictureInPictureSupported_0;
}

uint64_t __54__PGPictureInPictureProxy_isPictureInPictureSupported__block_invoke()
{
  uint64_t result = PGIsPictureInPictureSupported();
  isPictureInPictureSupported_isPictureInPictureSupported_0 = result;
  return result;
}

+ (BOOL)isPictureInPictureActive
{
  return __activePictureInPictureProxyObjectCount > 0;
}

+ (void)_updatePictureInPictureActive:(BOOL)a3
{
  uint64_t v4 = __activePictureInPictureProxyObjectCount;
  if (a3)
  {
    ++__activePictureInPictureProxyObjectCount;
    if (v4) {
      return;
    }
  }
  else if (--__activePictureInPictureProxyObjectCount)
  {
    return;
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PGPictureInPictureProxyPictureInPictureActiveChangedNotification" object:a1];
}

+ (id)pictureInPictureProxyWithControlsStyle:(int64_t)a3 viewController:(id)a4
{
  id v5 = a4;
  v6 = [[PGPictureInPictureProxy alloc] initWithControlsStyle:a3 viewController:v5];

  return v6;
}

- (PGPictureInPictureProxy)initWithControlsStyle:(int64_t)a3 viewController:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = _PGLogMethodProem(self, 0);
    [v28 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 180, @"%@ needs valid viewController!", v29 object file lineNumber description];
  }
  if ([(id)objc_opt_class() isPictureInPictureSupported])
  {
    v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureRemoteObject dealloc]();
    }

    v30.receiver = self;
    v30.super_class = (Class)PGPictureInPictureProxy;
    v9 = [(PGPictureInPictureProxy *)&v30 init];
    v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      v11 = objc_alloc_init(PGRunLoopObserver);
      runLoopObserver = v10->_runLoopObserver;
      v10->_runLoopObserver = v11;

      v10->_readyForDisplay = 1;
      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.pegasus.PGPictureInPictureProxy %p", v10);
      id v13 = objc_claimAutoreleasedReturnValue();
      v14 = (const char *)[v13 UTF8String];
      v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v16;

      [(PGPictureInPictureProxy *)v10 _establishConnection];
      [(PGPictureInPictureProxy *)v10 _resetInternalState];
      v18 = NSStringFromSelector(a2);
      [(PGPictureInPictureProxy *)v10 _initializeWithControlsStyle:a3 viewController:v7 reason:v18];

      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v10 selector:sel__handleSceneConnectionChangedNotification_ name:*MEMORY[0x1E4F43C80] object:0];

      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v10 selector:sel__handleSceneConnectionChangedNotification_ name:*MEMORY[0x1E4F43C98] object:0];

      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 addObserver:v10 selector:sel__updateInteractiveFrameWorkaroundFor_100127310_ name:*MEMORY[0x1E4F43F10] object:0];

      v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v23 = *MEMORY[0x1E4F43CA8];
      [v22 addObserver:v10 selector:sel__updateInteractiveFrameWorkaroundFor_100127310_ name:*MEMORY[0x1E4F43CA8] object:0];

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:v10 selector:sel__updateInteractiveFrameWorkaroundFor_100127310_ name:v23 object:0];

      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:v10 selector:sel__updateInteractiveFrameWorkaroundFor_100127310_ name:@"UIWindowSceneDidEndLiveResizeNotification" object:0];
    }
    self = v10;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (PGPictureInPictureProxy)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = _PGLogMethodProem(self, 0);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithControlsStyle:viewController:].", v5, v7 format];

  return [(PGPictureInPictureProxy *)self initWithControlsStyle:0 viewController:0];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  v1 = _PGLogMethodProem(v0, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

void __34__PGPictureInPictureProxy_dealloc__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)_updateInteractiveFrameWorkaroundFor_100127310:(id)a3
{
}

uint64_t __74__PGPictureInPictureProxy__updateInteractiveFrameWorkaroundFor_100127310___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController];
}

- (id)_remoteObject
{
  uint64_t v3 = [(PGPictureInPictureProxy *)self _connection];
  uint64_t v4 = _PGLogMethodProem(self, 1);
  uint64_t v5 = objc_msgSend(v3, "PG_remoteObjectWithDebugMethodAndPointerProem:", v4);

  return v5;
}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGPictureInPictureProxy *)self _connection];
  uint64_t v6 = _PGLogMethodProem(self, 1);
  uint64_t v7 = objc_msgSend(v5, "PG_remoteObjectWithDebugMethodAndPointerProem:errorHandler:", v6, v4);

  return v7;
}

- (id)_connection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__setConnection:(id)a3
{
  id v4 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_connection = self->_lock_connection;
  self->_lock_connection = v4;
  uint64_t v6 = v4;

  lock_connectionIfInterrupted = self->_lock_connectionIfInterrupted;
  self->_lock_connectionIfInterrupted = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_markConnectionAsInterrupted
{
  BSDispatchMain();
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_connectionIfInterrupted, self->_lock_connection);
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __55__PGPictureInPictureProxy__markConnectionAsInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRequestedWindowScene:0];
}

- (void)_restoreInterruptedConnectionIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_connection)
  {
    objc_storeStrong((id *)&self->_lock_connection, self->_lock_connectionIfInterrupted);
    lock_connectionIfInterrupted = self->_lock_connectionIfInterrupted;
    self->_lock_connectionIfInterrupted = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_initializeWithControlsStyle:(int64_t)a3 viewController:(id)a4 reason:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = PGLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = _PGLogMethodProem(self, 1);
    *(_DWORD *)buf = 138412546;
    v40 = v12;
    __int16 v41 = 2114;
    id v42 = v10;
    _os_log_impl(&dword_1B5645000, v11, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);
  }
  BSDispatchQueueAssertMain();
  self->_automaticallyInterruptsForLegacyFaceTimeBehaviors = [(PGPictureInPictureProxy *)self _isInCallService];
  self->_controlsStyle = a3;
  objc_storeStrong((id *)&self->_viewController, a4);
  [v9 preferredContentSize];
  uint64_t v13 = MEMORY[0x1E4F1DB20];
  self->_preferredContentSize.width = v14;
  self->_preferredContentSize.height = v15;
  CGSize v16 = *(CGSize *)(v13 + 16);
  self->_frameForInteractiveTransitions.origin = *(CGPoint *)v13;
  self->_frameForInteractiveTransitions.size = v16;
  *(_WORD *)&self->_isPictureInPicturePossible = 0;
  self->_isPictureInPictureSuspended = 0;
  self->_shouldPullCancellationPolicyOnStart = 0;
  *(_WORD *)&self->_pictureInPictureWasStartedWhenEnteringBackground = 256;
  v17 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
  v18 = v17;
  if (v17) {
    char v19 = [v17 _isWindowServerHostingManaged] ^ 1;
  }
  else {
    char v19 = 0;
  }
  self->_isInViewService = v19;
  if (!self->_requestedSceneIdentifier
    && ((dyld_program_sdk_at_least() & 1) != 0 || _os_feature_enabled_impl())
    && !self->_isInViewService
    && (_os_feature_enabled_impl() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F29128] UUID];
    v21 = [v20 UUIDString];
    requestedSceneIdentifier = self->_requestedSceneIdentifier;
    self->_requestedSceneIdentifier = v21;

    uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:self selector:sel__pipSceneComponentDidConnect_ name:@"PGPIPSceneComponentDidConnectNotification" object:0];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:self selector:sel__pipSceneComponentDidDisconnect_ name:@"PGPIPSceneComponentDidDisconnectNotification" object:0];
  }
  queue = self->_queue;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke;
  v36 = &unk_1E610C258;
  v37 = self;
  id v26 = v10;
  id v38 = v26;
  dispatch_async(queue, &v33);
  if (!self->_isObservingViewController && (objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_isObservingViewController = 1;
    [(PGPictureInPictureViewController *)self->_viewController addObserver:self, @"shouldShowAlternateActionButtonImage", 4, PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext, v33, v34, v35, v36, v37 forKeyPath options context];
  }
  v27 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4F42FF8]);
  rootViewController = self->_rootViewController;
  self->_rootViewController = v27;

  if (!self->_requestedSceneIdentifier)
  {
    v29 = [PGHostedWindow alloc];
    objc_super v30 = [MEMORY[0x1E4F42D90] mainScreen];
    [v30 bounds];
    v31 = -[PGHostedWindow initWithFrame:](v29, "initWithFrame:");
    hostedWindow = self->_hostedWindow;
    self->_hostedWindow = v31;

    [(PGHostedWindow *)self->_hostedWindow setBackgroundColor:0];
    [(PGHostedWindow *)self->_hostedWindow setHidden:0];
    [(PGHostedWindow *)self->_hostedWindow setRootViewController:self->_rootViewController];
  }
}

void __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _restoreInterruptedConnectionIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) _remoteObject];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 296);
  uint64_t v5 = *(void *)(v3 + 272);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_2;
  v6[3] = &unk_1E610D4A0;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "initializePictureInPictureWithControlsStyle:preferredContentSize:sceneIdentifier:affectsAppLifeCycle:completionHandler:", v4, v5, 0, v6, *(double *)(v3 + 8), *(double *)(v3 + 16));
}

void __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _remoteObject];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_3;
    v5[3] = &unk_1E610D478;
    v5[4] = *(void *)(a1 + 32);
    [v3 checkActivePictureInPictureCancellationPolicyWithCompletion:v5];

    id v4 = *(id *)(a1 + 40);
    BSDispatchMain();
  }
}

uint64_t __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_3(uint64_t result, int a2, uint64_t a3, char a4, char a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(result + 32) + 106) = a4;
    *(unsigned char *)(*(void *)(result + 32) + 107) = a5;
  }
  return result;
}

uint64_t __78__PGPictureInPictureProxy__initializeWithControlsStyle_viewController_reason___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  [*(id *)(a1 + 32) _updatePlaybackStateContentTypeIfNeeded];
  [*(id *)(a1 + 32) _updatePlaybackStateIfNeeded];
  [*(id *)(a1 + 32) _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateIsInterruptedIfNeededForReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setClientSessionIdentifier:*(void *)(*(void *)(a1 + 32) + 64)];
  [*(id *)(a1 + 32) setOverrideInterruptionExemptionIdentifier:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateScreenSharingInfoIfNeeded];
}

- (void)_resetInternalState
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = _PGLogMethodProem(self, 1);
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  BSDispatchQueueAssertMain();
  self->_needsReinitialization = 0;
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F43648];
  id v7 = [MEMORY[0x1E4F42738] sharedApplication];
  [v5 removeObserver:self name:v6 object:v7];

  [(PGPictureInPictureProxy *)self _stopObservingWindowSceneActivationState];
  if (self->_isObservingViewController)
  {
    self->_isObservingViewController = 0;
    [(PGPictureInPictureViewController *)self->_viewController removeObserver:self forKeyPath:@"shouldShowAlternateActionButtonImage" context:PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint8_t v8 = [(UIViewController *)self->_rootViewController childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v13 willMoveToParentViewController:0];
        CGFloat v14 = [v13 viewIfLoaded];
        [v14 removeFromSuperview];

        [v13 removeFromParentViewController];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(PGHostedWindow *)self->_hostedWindow setHidden:1];
  hostedWindow = self->_hostedWindow;
  self->_hostedWindow = 0;

  self->_pictureInPictureWasStartedWhenEnteringBackground = 0;
  if (self->_isHostedWindowSizeChangeDuringPinchGesture)
  {
    if (objc_opt_respondsToSelector()) {
      [(PGPictureInPictureViewController *)self->_viewController viewDidResize];
    }
    self->_isHostedWindowSizeChangeDuringPinchGesture = 0;
  }
  sceneSessionPersistentIdentifierAccordingToRemoteObject = self->_sceneSessionPersistentIdentifierAccordingToRemoteObject;
  self->_sceneSessionPersistentIdentifierAccordingToRemoteObject = 0;

  playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  self->_playbackStateAccordingToRemoteObject = 0;

  [(PGPictureInPictureProxy *)self _stopObservingWindowSceneActivationState];
  [(PGPictureInPictureProxy *)self _setResourcesUsageReductionReasons:0];
  [(PGPictureInPictureProxy *)self _setPictureInPicturePossible:0];
  [(PGPictureInPictureProxy *)self _setStashedOrUnderLock:0 reason:@"resetting internal state"];
  [(PGPictureInPictureProxy *)self _setInterruptedForDefaultReason:0 initiatedByRemoteObject:0];
  [(PGPictureInPictureProxy *)self _setActivationState:0 reason:@"_resetInternalState"];
}

- (PGPictureInPictureProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGPictureInPictureProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v6) {
      *(_WORD *)&self->_delegateRespondsTo &= 0x8000u;
    }
    id v7 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;

      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v10 = 2;
      }
      else {
        __int16 v10 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFD | v10;

      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v12 = 4;
      }
      else {
        __int16 v12 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFB | v12;

      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v14 = 8;
      }
      else {
        __int16 v14 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFF7 | v14;

      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = 16;
      }
      else {
        __int16 v16 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFEF | v16;

      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v18 = 32;
      }
      else {
        __int16 v18 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFDF | v18;

      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v20 = 64;
      }
      else {
        __int16 v20 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFBF | v20;

      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v22 = 128;
      }
      else {
        __int16 v22 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFF7F | v22;

      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v24 = 256;
      }
      else {
        __int16 v24 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFEFF | v24;

      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v26 = 512;
      }
      else {
        __int16 v26 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFDFF | v26;

      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v28 = 1024;
      }
      else {
        __int16 v28 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFBFF | v28;

      id v29 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = 2048;
      }
      else {
        __int16 v30 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v30;

      id v31 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        __int16 v32 = 4096;
      }
      else {
        __int16 v32 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xEFFF | v32;

      if (objc_opt_respondsToSelector()) {
        __int16 v33 = 0x2000;
      }
      else {
        __int16 v33 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xDFFF | v33;
      if (objc_opt_respondsToSelector()) {
        __int16 v34 = 0x4000;
      }
      else {
        __int16 v34 = 0;
      }
      *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xBFFF | v34;
    }
    [(PGPictureInPictureProxy *)self _updatePlaybackStateContentTypeIfNeeded];
    uint64_t v5 = obj;
  }
}

- (BOOL)isPictureInPicturePossible
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_isPictureInPicturePossible;
}

- (BOOL)isPictureInPictureActive
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_isPictureInPictureActive;
}

- (BOOL)isPictureInPictureSuspended
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_isPictureInPictureSuspended;
}

- (BOOL)isPictureInPictureInterrupted
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_isInterruptedForAnyReason;
}

- (BOOL)pictureInPictureShouldStartWhenEnteringBackground
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_pictureInPictureShouldStartWhenEnteringBackground;
}

- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (self->_pictureInPictureShouldStartWhenEnteringBackground != v3)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      id v8 = "-[PGPictureInPictureProxy setPictureInPictureShouldStartWhenEnteringBackground:]";
      __int16 v9 = 2048;
      __int16 v10 = self;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v7, 0x1Cu);
    }

    self->_pictureInPictureShouldStartWhenEnteringBackground = v3;
    [(PGPictureInPictureProxy *)self _updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded];
  }
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_pictureInPictureWasStartedWhenEnteringBackground;
}

- (double)playbackProgress
{
  BOOL v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_playbackProgress;
}

- (double)playbackRate
{
  BOOL v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_playbackRate;
}

- (id)loadedTimeRanges
{
  BOOL v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  loadedTimeRanges = self->_loadedTimeRanges;

  return loadedTimeRanges;
}

- (void)setLoadedTimeRanges:(id)a3
{
  id v4 = (NSArray *)a3;
  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  loadedTimeRanges = self->_loadedTimeRanges;
  self->_loadedTimeRanges = v4;
}

- (void)preferredContentSizeDidChangeForViewController
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  [(PGPictureInPictureViewController *)self->_viewController preferredContentSize];
  CGFloat v7 = v6;
  CGFloat v8 = v5;
  if (self->_preferredContentSize.width != v6 || self->_preferredContentSize.height != v5)
  {
    __int16 v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CGSize preferredContentSize = self->_preferredContentSize;
      __int16 v11 = [MEMORY[0x1E4F29238] valueWithBytes:&preferredContentSize objCType:"{CGSize=dd}"];
      *(CGFloat *)id v15 = v7;
      *(CGFloat *)&v15[1] = v8;
      BOOL v12 = [MEMORY[0x1E4F29238] valueWithBytes:v15 objCType:"{CGSize=dd}"];
      *(_DWORD *)buf = 136315906;
      __int16 v18 = "-[PGPictureInPictureProxy preferredContentSizeDidChangeForViewController]";
      __int16 v19 = 2048;
      __int16 v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = v11;
      __int16 v23 = 2114;
      __int16 v24 = v12;
      _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }
    self->_preferredContentSize.width = v7;
    self->_preferredContentSize.height = v8;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke;
    block[3] = &unk_1E610C9A8;
    block[4] = self;
    *(CGFloat *)&block[5] = v7;
    *(CGFloat *)&block[6] = v8;
    dispatch_async(queue, block);
  }
}

void __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _remoteObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_2;
  v3[3] = &unk_1E610D4C8;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "updatePreferredContentSize:withCompletionHandler:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_2()
{
  return BSDispatchMain();
}

uint64_t __73__PGPictureInPictureProxy_preferredContentSizeDidChangeForViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBackgroundPIPWhilePrewarmingIfNeeded];
}

- (void)viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController
{
}

- (void)_viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = (PGPictureInPictureProxy *)a3;
  double v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    double v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2114;
    v40 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    CGFloat v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  CGFloat v8 = *MEMORY[0x1E4F1DB20];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  BOOL v12 = [(PGPictureInPictureProxy *)self _expectedScene];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(PGPictureInPictureProxy *)self _expectedScene];

    if (self->_pictureInPictureShouldStartWhenEnteringBackground && v13)
    {
      if ([v13 activationState])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PGPictureInPictureProxy *)self _addWindowSceneActivationStateObserverIfNeeded:v13];
        }
      }
      else if (self->_sceneSessionPersistentIdentifier)
      {
        [(PGPictureInPictureProxy *)self _viewFrameForTransitionAnimationAssumeApplicationActive:1];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        id v27 = [v13 coordinateSpace];
        __int16 v28 = [v13 screen];
        id v29 = [v28 fixedCoordinateSpace];
        objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v29, v20, v22, v24, v26);
        CGFloat v8 = v30;
        CGFloat v9 = v31;
        CGFloat v10 = v32;
        CGFloat v11 = v33;
      }
    }
  }
  else
  {

    uint64_t v13 = 0;
  }
  v46.origin.x = v8;
  v46.origin.y = v9;
  v46.size.width = v10;
  v46.size.height = v11;
  if (!CGRectEqualToRect(self->_frameForInteractiveTransitions, v46))
  {
    __int16 v14 = PGLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CGSize size = self->_frameForInteractiveTransitions.size;
      v36[0] = self->_frameForInteractiveTransitions.origin;
      v36[1] = size;
      __int16 v16 = [MEMORY[0x1E4F29238] valueWithBytes:v36 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(CGFloat *)v35 = v8;
      *(CGFloat *)&v35[1] = v9;
      *(CGFloat *)&v35[2] = v10;
      *(CGFloat *)&v35[3] = v11;
      id v17 = [MEMORY[0x1E4F29238] valueWithBytes:v35 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(_DWORD *)buf = 136315906;
      id v38 = "-[PGPictureInPictureProxy _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewC"
            "ontrollerWithReason:]";
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      id v42 = v16;
      __int16 v43 = 2114;
      v44 = v17;
      _os_log_impl(&dword_1B5645000, v14, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }
    self->_frameForInteractiveTransitions.origin.x = v8;
    self->_frameForInteractiveTransitions.origin.y = v9;
    self->_frameForInteractiveTransitions.size.width = v10;
    self->_frameForInteractiveTransitions.size.height = v11;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__PGPictureInPictureProxy__viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke;
    block[3] = &unk_1E610D4F0;
    block[4] = self;
    *(CGFloat *)&block[5] = v8;
    *(CGFloat *)&block[6] = v9;
    *(CGFloat *)&void block[7] = v10;
    *(CGFloat *)&block[8] = v11;
    dispatch_async(queue, block);
  }
}

void __129__PGPictureInPictureProxy__viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  objc_msgSend(v2, "updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding:withCompletionHandler:", &__block_literal_global_98, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController
{
}

- (void)_windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (PGPictureInPictureProxy *)a3;
  double v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    double v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    double v19 = v6;
    __int16 v20 = 2114;
    double v21 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%@ %{public}@", buf, 0x16u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    CGFloat v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  CGFloat v8 = [(PGPictureInPictureProxy *)self _bestKnownConnectedSceneSessionPersistentIdentifier];
  if (![(NSString *)self->_sceneSessionPersistentIdentifier isEqualToString:v8]
    || ([v8 isEqualToString:self->_sceneSessionPersistentIdentifierAccordingToRemoteObject] & 1) == 0)
  {
    CGFloat v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
      *(_DWORD *)buf = 136315906;
      double v19 = "-[PGPictureInPictureProxy _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForVie"
            "wControllerWithReason:]";
      __int16 v20 = 2048;
      double v21 = self;
      __int16 v22 = 2114;
      double v23 = sceneSessionPersistentIdentifier;
      __int16 v24 = 2114;
      double v25 = v8;
      _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }

    CGFloat v11 = (NSString *)[v8 copy];
    BOOL v12 = self->_sceneSessionPersistentIdentifier;
    self->_sceneSessionPersistentIdentifier = v11;

    uint64_t v13 = (NSString *)[v8 copy];
    sceneSessionPersistentIdentifierAccordingToRemoteObject = self->_sceneSessionPersistentIdentifierAccordingToRemoteObject;
    self->_sceneSessionPersistentIdentifierAccordingToRemoteObject = v13;

    [(PGPictureInPictureProxy *)self _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:@"window scene change"];
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __131__PGPictureInPictureProxy__windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke;
    v16[3] = &unk_1E610C258;
    v16[4] = self;
    id v17 = v8;
    dispatch_async(queue, v16);
  }
}

void __131__PGPictureInPictureProxy__windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding:*(void *)(a1 + 40) withCompletionHandler:&__block_literal_global_106];
}

- (void)startPictureInPicture
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    double v6 = "-[PGPictureInPictureProxy startPictureInPicture]";
    __int16 v7 = 2048;
    CGFloat v8 = self;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v5, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureProxy *)self _isInactive]) {
    [(PGPictureInPictureProxy *)self _startPictureInPictureAnimated:1 enteringBackground:0 reason:@"Client request" withCompletionHandler:0];
  }
}

- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v12 = "-[PGPictureInPictureProxy stopPictureInPictureAndRestoreUserInterface:]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  int64_t v7 = [(PGPictureInPictureProxy *)self _activationState];
  switch(v7)
  {
    case 3:
      if (v3 && [(PGPictureInPictureProxy *)self _isInCallService])
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke;
        block[3] = &unk_1E610C280;
        block[4] = self;
        dispatch_async(queue, block);
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke_2;
        v9[3] = &unk_1E610D4C8;
        v9[4] = self;
        [(PGPictureInPictureProxy *)self _stopPictureInPictureAnimated:1 restoreUserInterface:v3 withCompletionHandler:v9];
      }
      break;
    case 2:
      self->_shouldStopUponActivation = v3;
      self->_shouldCancelUponActivation = !v3;
      break;
    case 1:
      [(PGPictureInPictureProxy *)self _cancelPrewarming];
      break;
  }
}

void __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObject];
  [v1 stopPictureInPictureAndRestoreUserInterface];
}

uint64_t __71__PGPictureInPictureProxy_stopPictureInPictureAndRestoreUserInterface___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _invalidateConnectionForFailure];
  }
  return result;
}

- (void)setPlaybackProgress:(double)a3 playbackRate:(double)a4
{
  int64_t v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (self->_playbackProgress != a3 || self->_playbackRate != a4)
  {
    self->_playbackProgress = a3;
    self->_playbackRate = a4;
  }
}

- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[PGPictureInPictureProxy rotateContentContainer:withCompletionHandler:]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = a3;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %ld", buf, 0x20u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    CGFloat v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (self->_isPictureInPictureActive)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke;
    block[3] = &unk_1E610C960;
    block[4] = self;
    id v11 = v6;
    int64_t v12 = a3;
    dispatch_async(queue, block);
  }
}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E610D518;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  BOOL v3 = [v2 _remoteObjectWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E610D540;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 rotateContentContainer:v4 withCompletionHandler:v5];
}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E610CAE8;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  [v6 performAsync:v8];
}

uint64_t __72__PGPictureInPictureProxy_rotateContentContainer_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)isCameraActive
{
  id v2 = [(PGPictureInPictureProxy *)self playbackState];
  char v3 = [v2 isCameraActive];

  return v3;
}

- (void)setCameraActive:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__PGPictureInPictureProxy_setCameraActive___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  BOOL v4 = a3;
  [(PGPictureInPictureProxy *)self _updateFaceTimePlaybackStateUsingBlock:v3];
}

uint64_t __43__PGPictureInPictureProxy_setCameraActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCameraActive:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)canSwitchCamera
{
  id v2 = [(PGPictureInPictureProxy *)self playbackState];
  char v3 = [v2 canSwitchCamera];

  return v3;
}

- (void)setCanSwitchCamera:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PGPictureInPictureProxy_setCanSwitchCamera___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  BOOL v4 = a3;
  [(PGPictureInPictureProxy *)self _updateFaceTimePlaybackStateUsingBlock:v3];
}

uint64_t __46__PGPictureInPictureProxy_setCanSwitchCamera___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCanSwitchCamera:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isMicrophoneMuted
{
  id v2 = [(PGPictureInPictureProxy *)self playbackState];
  char v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PGPictureInPictureProxy_setMicrophoneMuted___block_invoke;
  v3[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  BOOL v4 = a3;
  [(PGPictureInPictureProxy *)self _updateFaceTimePlaybackStateUsingBlock:v3];
}

uint64_t __46__PGPictureInPictureProxy_setMicrophoneMuted___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMicrophoneMuted:*(unsigned __int8 *)(a1 + 32)];
}

- (id)clientSessionIdentifier
{
  clientSessionIdentifier = self->_clientSessionIdentifier;
  if (clientSessionIdentifier)
  {
    char v3 = clientSessionIdentifier;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
    char v3 = [v4 bundleIdentifier];
  }

  return v3;
}

- (void)setClientSessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PGPictureInPictureProxy *)self clientSessionIdentifier];
  if ([v4 isEqualToString:v5])
  {
    char v6 = [v4 isEqualToString:self->_clientSessionIdentifierAccordingToRemoteObject];

    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [(PGPictureInPictureProxy *)self _cancelPrewarming];
  id v7 = (NSString *)[v4 copy];
  clientSessionIdentifier = self->_clientSessionIdentifier;
  self->_clientSessionIdentifier = v7;

  id v9 = [(PGPictureInPictureProxy *)self clientSessionIdentifier];
  if (self->_needsReinitialization)
  {
    clientSessionIdentifierAccordingToRemoteObject = self->_clientSessionIdentifierAccordingToRemoteObject;
    self->_clientSessionIdentifierAccordingToRemoteObject = 0;

    [(PGPictureInPictureProxy *)self _resetInternalState];
    [(PGPictureInPictureProxy *)self _initializeWithControlsStyle:self->_controlsStyle viewController:self->_viewController reason:@"Connection was nil and setClientSessionIdentifier called"];
  }
  else
  {
    id v11 = [(PGPictureInPictureProxy *)self clientSessionIdentifier];
    int64_t v12 = self->_clientSessionIdentifierAccordingToRemoteObject;
    self->_clientSessionIdentifierAccordingToRemoteObject = v11;

    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PGPictureInPictureProxy_setClientSessionIdentifier___block_invoke;
    v14[3] = &unk_1E610C258;
    v14[4] = self;
    id v15 = v9;
    dispatch_async(queue, v14);
  }
LABEL_9:
}

void __54__PGPictureInPictureProxy_setClientSessionIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 setActivitySessionIdentifier:*(void *)(a1 + 40)];
}

- (void)setOverrideInterruptionExemptionIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  overrideInterruptionExemptionIdentifier = self->_overrideInterruptionExemptionIdentifier;
  self->_overrideInterruptionExemptionIdentifier = v4;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PGPictureInPictureProxy_setOverrideInterruptionExemptionIdentifier___block_invoke;
  block[3] = &unk_1E610C280;
  block[4] = self;
  dispatch_async(queue, block);
}

void __70__PGPictureInPictureProxy_setOverrideInterruptionExemptionIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 setExemptAttributionOverride:*(void *)(*(void *)(a1 + 32) + 72)];
}

- (BOOL)disablesLayerCloning
{
  id v2 = [(PGPictureInPictureProxy *)self playbackState];
  char v3 = [v2 disablesLayerCloning];

  return v3;
}

- (void)setDisablesLayerCloning:(BOOL)a3
{
  PGPictureInPictureProxyMaySupportsScreenSharing = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PGPictureInPictureProxy_setDisablesLayerCloning___block_invoke;
  v4[3] = &__block_descriptor_33_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
  BOOL v5 = a3;
  [(PGPictureInPictureProxy *)self _updateFaceTimePlaybackStateUsingBlock:v4];
  [(PGPictureInPictureProxy *)self _updatePlaybackStateContentTypeIfNeeded];
}

uint64_t __51__PGPictureInPictureProxy_setDisablesLayerCloning___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesLayerCloning:*(unsigned __int8 *)(a1 + 32)];
}

- (id)menuItems
{
  if (self->_menuItems) {
    return self->_menuItems;
  }
  else {
    return MEMORY[0x1E4F1CBF0];
  }
}

- (void)setMenuItems:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  char v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    char v6 = v4;
  }
  id v7 = v6;

  if (![(NSArray *)self->_menuItems isEqualToArray:v7])
  {
    id v8 = (NSArray *)[v7 copy];
    menuItems = self->_menuItems;
    self->_menuItems = v8;
  }
}

- (void)_updateFaceTimePlaybackStateUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PGPictureInPictureProxy__updateFaceTimePlaybackStateUsingBlock___block_invoke;
  v6[3] = &unk_1E610D588;
  id v7 = v4;
  id v5 = v4;
  [(PGPictureInPictureProxy *)self updatePlaybackStateUsingBlock:v6];
}

uint64_t __66__PGPictureInPictureProxy__updateFaceTimePlaybackStateUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setControlsStyle:(int64_t)a3
{
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  [(PGPictureInPictureProxy *)self setControlsStyle:a3 animated:0 withCompletionHandler:0];
}

- (void)setControlsStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (self->_controlsStyle != a3)
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [NSNumber numberWithInteger:self->_controlsStyle];
      id v11 = [NSNumber numberWithInteger:a3];
      int v12 = 136315906;
      __int16 v13 = "-[PGPictureInPictureProxy setControlsStyle:animated:withCompletionHandler:]";
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v12, 0x2Au);
    }
    self->_controlsStyle = a3;
    [(PGPictureInPictureProxy *)self _updatePlaybackStateContentTypeIfNeeded];
  }
}

- (PGPlaybackState)playbackState
{
  playbackState = self->_playbackState;
  if (!playbackState)
  {
    id v4 = [[PGPlaybackState alloc] initWithDictionary:0];
    id v5 = self->_playbackState;
    self->_playbackState = v4;

    playbackState = self->_playbackState;
  }

  return playbackState;
}

- (void)updatePlaybackStateUsingBlock:(id)a3
{
  id v5 = a3;
  char v6 = [(PGPictureInPictureProxy *)self playbackState];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  [(PGPictureInPictureProxy *)self _setMaybeNeedsUpdatePlaybackState];
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  id v6 = [(PGPictureInPictureProxy *)self _remoteObject];
  [v6 pagingAccessorySetCurrentPage:a3 numberOfPages:a4];
}

- (BOOL)automaticallyInterruptsForLegacyFaceTimeBehaviors
{
  return self->_automaticallyInterruptsForLegacyFaceTimeBehaviors;
}

- (void)setAutomaticallyInterruptsForLegacyFaceTimeBehaviors:(BOOL)a3
{
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 806, @"Invalid parameter not satisfying: %@", @"automaticallyInterruptsForLegacyFaceTimeBehaviors == NO" object file lineNumber description];
  }
  self->_automaticallyInterruptsForLegacyFaceTimeBehaviors = a3;

  [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"automaticallyInterruptsForLegacyFaceTimeBehaviors changed"];
}

- (void)_updatePlaybackStateContentTypeIfNeeded
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = [v6 pictureInPictureProxyContentType:self];

    id v8 = [(PGPictureInPictureProxy *)self playbackState];
    [v8 setContentType:v7];

    if (v7 == 4)
    {
LABEL_3:
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      char v10 = objc_opt_respondsToSelector();

      id v11 = [(PGPictureInPictureProxy *)self playbackState];
      [v11 setSupportsFaceTimeActions:v10 & 1];
LABEL_21:
    }
  }
  else
  {
    if (![(PGPictureInPictureProxy *)self _isInCallService]
      || PGPictureInPictureProxyMaySupportsScreenSharing != 1)
    {
      switch([(PGPictureInPictureProxy *)self controlsStyle])
      {
        case 1:
          __int16 v22 = [(PGPictureInPictureProxy *)self playbackState];
          if ([v22 contentType] == 1)
          {
            double v23 = [(PGPictureInPictureProxy *)self playbackState];
            uint64_t v24 = [v23 contentType];

            if (v24 == 2) {
              goto LABEL_22;
            }
          }
          else
          {
          }
          uint64_t v20 = [(PGPictureInPictureProxy *)self playbackState];
          id v11 = v20;
          uint64_t v21 = 1;
LABEL_20:
          [v20 setContentType:v21];
          break;
        case 2:
          double v25 = [(PGPictureInPictureProxy *)self playbackState];
          [v25 setContentType:4];

          goto LABEL_3;
        case 3:
          uint64_t v20 = [(PGPictureInPictureProxy *)self playbackState];
          id v11 = v20;
          uint64_t v21 = 3;
          goto LABEL_20;
        case 4:
        case 5:
          id v16 = objc_loadWeakRetained((id *)p_delegate);
          char v17 = objc_opt_respondsToSelector();

          if (v17)
          {
            __int16 v18 = [(PGPictureInPictureProxy *)self playbackState];
            [v18 setContentType:4];
          }
          uint64_t v19 = [(PGPictureInPictureProxy *)self playbackState];
          [v19 setSupportsFaceTimeActions:v17 & 1];

          goto LABEL_22;
        default:
          goto LABEL_22;
      }
      goto LABEL_21;
    }
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = objc_opt_respondsToSelector();

    BOOL v14 = [(PGPictureInPictureProxy *)self disablesLayerCloning];
    uint64_t v15 = 4;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __66__PGPictureInPictureProxy__updatePlaybackStateContentTypeIfNeeded__block_invoke;
    double v30 = &__block_descriptor_41_e49_v16__0___PGMutablePlaybackStateFaceTimeSupport__8l;
    if (!v14) {
      uint64_t v15 = 5;
    }
    uint64_t v31 = v15;
    char v32 = v13 & 1;
    [(PGPictureInPictureProxy *)self _updateFaceTimePlaybackStateUsingBlock:&v27];
  }
LABEL_22:
  if (self->_controlsStyle == 3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v26 = [(PGPictureInPictureProxy *)self playbackState];
    objc_msgSend(v26, "setCameraHasMicrophone:", -[PGPictureInPictureViewController shouldShowAlternateActionButtonImage](self->_viewController, "shouldShowAlternateActionButtonImage"));
  }
  [(PGPictureInPictureProxy *)self _setMaybeNeedsUpdatePlaybackState];
}

void __66__PGPictureInPictureProxy__updatePlaybackStateContentTypeIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setContentType:v3];
  [v4 setSupportsFaceTimeActions:*(unsigned __int8 *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)PGPictureInPictureProxyViewControllerShouldShowAlternateActionButtonImageObservationContext == a6)
  {
    id v7 = [(PGPictureInPictureProxy *)self playbackState];
    objc_msgSend(v7, "setCameraHasMicrophone:", -[PGPictureInPictureViewController shouldShowAlternateActionButtonImage](self->_viewController, "shouldShowAlternateActionButtonImage"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PGPictureInPictureProxy;
    -[PGPictureInPictureProxy observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)_isInactive
{
  return [(PGPictureInPictureProxy *)self _activationState] == 0;
}

- (int64_t)_activationState
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_activationState;
}

- (void)_setActivationState:(int64_t)a3 reason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureProxy *)self _activationState] != a3)
  {
    objc_super v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [NSNumber numberWithInteger:self->_activationState];
      char v10 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = "-[PGPictureInPictureProxy _setActivationState:reason:]";
      __int16 v16 = 2048;
      char v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ -> %{public}@ reason: %{public}@", buf, 0x34u);
    }
    self->_activationState = a3;
    id v11 = [NSString stringWithFormat:@"_setActivationState: %@", v6];
    [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:v11];

    BOOL shouldStopUponActivation = self->_shouldStopUponActivation;
    BOOL shouldCancelUponActivation = self->_shouldCancelUponActivation;
    *(_WORD *)&self->_BOOL shouldStopUponActivation = 0;
    if (a3 == 3 && (shouldCancelUponActivation || shouldStopUponActivation)) {
      [(PGPictureInPictureProxy *)self _stopPictureInPictureAnimated:1 restoreUserInterface:shouldStopUponActivation withCompletionHandler:0];
    }
  }
}

- (void)_startPictureInPictureAnimated:(BOOL)a3 enteringBackground:(BOOL)a4 reason:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  char v13 = PGLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v27 = "-[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:]";
    __int16 v28 = 2048;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl(&dword_1B5645000, v13, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v14 = PGLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (![(PGPictureInPictureProxy *)self _activationState]
    || [(PGPictureInPictureProxy *)self _activationState] == 1)
  {
    uint64_t v15 = [NSString stringWithFormat:@"_startPictureInPictureAnimated: %@", v11];
    [(PGPictureInPictureProxy *)self _setActivationState:2 reason:v15];
    self->_pictureInPictureWasStartedWhenEnteringBackground = a4;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E610D5D0;
    v23[4] = self;
    SEL v25 = a2;
    id v24 = v12;
    __int16 v16 = (void *)MEMORY[0x1BA99D810](v23);
    char v17 = v16;
    if (self->_shouldPullCancellationPolicyOnStart)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke_151;
      v20[3] = &unk_1E610CB38;
      v20[4] = self;
      BOOL v22 = v8;
      id v21 = v16;
      [(PGPictureInPictureProxy *)self __updateCancellationPolicyWithSuccessHandler:v20 failureHandler:v21];
    }
    else
    {
      [(PGPictureInPictureProxy *)self __coordinateStartAnimated:v8 withCompletionHandler:v16];
    }

    goto LABEL_17;
  }
  __int16 v18 = PGLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 0);
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v19;
    _os_log_impl(&dword_1B5645000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ failed because not inactive.", buf, 0xCu);
  }
  if (v12)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v15);
LABEL_17:
  }
}

void __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _activationState] != 2)
  {
    char v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v14 = 136315394;
      uint64_t v15 = "-[PGPictureInPictureProxy _startPictureInPictureAnimated:enteringBackground:reason:withCompletionHandler:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, "%s %p Not updating activation state because we are no longer activating and it's not our responsibility to maintain activation state.", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_12;
  }
  id v4 = *(id **)(a1 + 32);
  if (v3)
  {
    char v5 = [v4[38] parentViewController];
    id v6 = *(void **)(*(void *)(a1 + 32) + 216);

    if (v5 == v6)
    {
      char v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PGPictureInPictureProxy.m", 926, @"We failed to start, but activation state remained activating and nobody cleaned up after the failure" object file lineNumber description];
    }
    id v7 = [*(id *)(*(void *)(a1 + 32) + 304) parentViewController];
    BOOL v8 = *(void **)(*(void *)(a1 + 32) + 216);

    if (v7 == v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [*(id *)(*(void *)(a1 + 32) + 304) willAnimatePictureInPictureStop];
    }
    [*(id *)(a1 + 32) _removeViewControllerFromHostedWindowIfNeeded];
    [*(id *)(a1 + 32) _setActivationState:0 reason:@"_startPictureInPictureAnimated failed"];
    id v9 = *(_WORD **)(a1 + 32);
    if ((v9[144] & 0x20) != 0)
    {
      char v10 = [v9 delegate];
      [v10 pictureInPictureProxy:*(void *)(a1 + 32) failedToStartPictureInPictureWithAnimationType:0 error:v3];
LABEL_12:
    }
  }
  else
  {
    [v4 _setActivationState:3 reason:@"_startPictureInPictureAnimated succeeded"];
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v3 == 0, v3);
  }
}

uint64_t __106__PGPictureInPictureProxy__startPictureInPictureAnimated_enteringBackground_reason_withCompletionHandler___block_invoke_151(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__coordinateStartAnimated:withCompletionHandler:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)__coordinateStartAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  BOOL v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureProxy __coordinateStartAnimated:withCompletionHandler:]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!v7)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 964, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  double v10 = *MEMORY[0x1E4F1DB20];
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v4
    && [(PGPictureInPictureProxy *)self _isViewControllerWindowSceneConsideredActive])
  {
    [(PGPictureInPictureProxy *)self _viewFrameForTransitionAnimationAssumeApplicationActive:1];
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
    if (self->_shouldCancelActivePictureInPictureOnStart)
    {
      if (CGRectIsNull(*(CGRect *)&v14)) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 1;
      }
    }
    else
    {
      uint64_t v18 = 3;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E610C960;
  id v22 = v7;
  uint64_t v23 = v18;
  v21[4] = self;
  id v19 = v7;
  -[PGPictureInPictureProxy __setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:](self, "__setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:", v18, v21, v19, v10, v11, v12, v13);
}

void __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E610C960;
  void v4[4] = v2;
  uint64_t v6 = v3;
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "__actuallyStartWithAnimationType:successHandler:failureHandler:", v3, v4, *(void *)(a1 + 40));
}

uint64_t __75__PGPictureInPictureProxy___coordinateStartAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__didStartWithAnimationType:completionHandler:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)__setupStartWithAnimationType:(int64_t)a3 initialLayerFrame:(CGRect)a4 successHandler:(id)a5 failureHandler:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  double v16 = PGLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v17 = PGLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (v14 && v15)
  {
    if (a3)
    {
LABEL_10:
      int64_t v18 = [(PGPictureInPictureProxy *)self _interfaceOrientationForTransitionAnimationAssumeApplicationActive:1];
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 988, @"Invalid parameter not satisfying: %@", @"successHandler != nil && failureHandler != nil" object file lineNumber description];

    if (a3) {
      goto LABEL_10;
    }
  }
  int64_t v18 = 0;
LABEL_13:
  __int16 v20 = [(PGPictureInPictureProxy *)self _bestKnownConnectedSceneSessionPersistentIdentifier];
  if (![(NSString *)self->_sceneSessionPersistentIdentifier isEqualToString:v20])
  {
    id v21 = PGLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
      *(_DWORD *)buf = 136315906;
      id v38 = "-[PGPictureInPictureProxy __setupStartWithAnimationType:initialLayerFrame:successHandler:failureHandler:]";
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      id v42 = sceneSessionPersistentIdentifier;
      __int16 v43 = 2114;
      v44 = v20;
      _os_log_impl(&dword_1B5645000, v21, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", buf, 0x2Au);
    }

    objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifier, v20);
  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    uint64_t v23 = [(PGPictureInPictureProxy *)self delegate];
    [v23 pictureInPictureProxy:self willStartPictureInPictureWithAnimationType:a3];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E610D648;
  block[4] = self;
  id v28 = v15;
  BOOL v36 = a3 != 0;
  CGFloat v31 = x;
  CGFloat v32 = y;
  CGFloat v33 = width;
  CGFloat v34 = height;
  id v29 = v14;
  int64_t v30 = v18;
  int64_t v35 = a3;
  id v25 = v14;
  id v26 = v15;
  dispatch_async(queue, block);
}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_2;
  v15[3] = &unk_1E610D518;
  id v2 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _remoteObjectWithErrorHandler:v15];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 104);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 208) hostedWindowHostingHandle];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_4;
  v11[3] = &unk_1E610D620;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  double v10 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v14 = *(void *)(a1 + 96);
  id v13 = v10;
  objc_msgSend(v3, "setupStartAnimated:hostedWindowHostingHandle:sceneSessionPersistentIdentifier:preferredContentSize:initialInterfaceOrientation:initialLayerFrame:completionHandler:", v4, v5, v7, v8, v11, *(double *)(v6 + 8), *(double *)(v6 + 16), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __105__PGPictureInPictureProxy___setupStartWithAnimationType_initialLayerFrame_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v2();
  }
  else
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) localizedDescription];
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "Failed to setup start with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    id v6 = *(_WORD **)(a1 + 40);
    if ((v6[144] & 0x20) != 0)
    {
      id v7 = [v6 delegate];
      [v7 pictureInPictureProxy:*(void *)(a1 + 40) failedToStartPictureInPictureWithAnimationType:*(void *)(a1 + 64) error:*(void *)(a1 + 32)];
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)__actuallyStartWithAnimationType:(int64_t)a3 successHandler:(id)a4 failureHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  double v11 = PGLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = PGLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!v9 || !v10)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1027, @"Invalid parameter not satisfying: %@", @"successHandler != nil && failureHandler != nil" object file lineNumber description];
  }
  [(PGPictureInPictureProxy *)self _addViewControllerToHostedWindowIfNeeded];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E610D6C0;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a3 != 0;
  id v19 = v9;
  int64_t v20 = a3;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(queue, block);
}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_2;
  v11[3] = &unk_1E610D518;
  id v2 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v3 = [v2 _remoteObjectWithErrorHandler:v11];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_4;
  v7[3] = &unk_1E610D698;
  void v7[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v10 = v6;
  id v9 = *(id *)(a1 + 40);
  [v3 startPictureInPictureAnimated:v4 completionHandler:v7];
}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __90__PGPictureInPictureProxy___actuallyStartWithAnimationType_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 304) didAnimatePictureInPictureStart];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v2();
  }
  else
  {
    id v4 = *(_WORD **)(a1 + 32);
    if ((v4[144] & 0x20) != 0)
    {
      id v5 = [v4 delegate];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 64);
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1000 userInfo:0];
      [v5 pictureInPictureProxy:v6 failedToStartPictureInPictureWithAnimationType:v7 error:v8];
    }
    id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v9();
  }
}

- (void)__didStartWithAnimationType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!v7)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1059, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    uint64_t v10 = [(PGPictureInPictureProxy *)self delegate];
    [v10 pictureInPictureProxy:self didStartPictureInPictureWithAnimationType:a3];
  }
  [(PGPictureInPictureProxy *)self _setPictureInPictureActive:1];
  [(id)objc_opt_class() _updatePictureInPictureActive:1];
  v7[2](v7, 0);
}

- (void)__updateCancellationPolicyWithSuccessHandler:(id)a3 failureHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if (!v7 || !v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1077, @"Invalid parameter not satisfying: %@", @"successHandler != nil && failureHandler != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke;
  block[3] = &unk_1E610D738;
  block[4] = self;
  id v16 = v8;
  id v17 = v7;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(queue, block);
}

void __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_2;
  v7[3] = &unk_1E610D518;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 _remoteObjectWithErrorHandler:v7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_3;
  v4[3] = &unk_1E610D710;
  void v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 checkActivePictureInPictureCancellationPolicyWithCompletion:v4];
}

uint64_t __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __87__PGPictureInPictureProxy___updateCancellationPolicyWithSuccessHandler_failureHandler___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 107) = *(unsigned char *)(a1 + 65);
  *(unsigned char *)(*(void *)(a1 + 32) + 106) = *(unsigned char *)(a1 + 66);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureProxy *)self _activationState] == 3)
  {
    [(PGPictureInPictureProxy *)self _setActivationState:4 reason:@"starting two stage stop"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke;
    v21[3] = &unk_1E610C848;
    v21[4] = self;
    id v22 = v8;
    double v11 = (void *)MEMORY[0x1BA99D810](v21);
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
    {
      id v12 = [(PGPictureInPictureProxy *)self delegate];
      [v12 pictureInPictureProxyWillSetupPictureInPictureStop:self];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_167;
    v17[3] = &unk_1E610D7B0;
    v17[4] = self;
    uint64_t v20 = 0;
    id v18 = v7;
    id v19 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_4;
    v14[3] = &unk_1E610D5D0;
    id v15 = v19;
    SEL v16 = a2;
    v14[4] = self;
    id v13 = v19;
    [(PGPictureInPictureProxy *)self __setupStopAnimated:1 needsApplicationActivation:0 waitForApplicationActivation:1 successHandler:v17 failureHandler:v14];
  }
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (v3)
    {
      id v5 = PGLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v3 localizedDescription];
        int v7 = 138543362;
        id v8 = v6;
        _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Failed to finalize with error %{public}@.", (uint8_t *)&v7, 0xCu);
      }
      uint64_t v4 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, v3 == 0, v3);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
  if ([*(id *)(a1 + 32) _activationState] == 4) {
    [*(id *)(a1 + 32) _setActivationState:0 reason:@"two stage stop finalize block"];
  }
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_167(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_2;
  v6[3] = &unk_1E610D788;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v8 = v5;
  objc_msgSend(v3, "__restoreUserInterfaceAnimated:reason:completionHandler:", 1, v2, v6);
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_2(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_3;
  v9[3] = &unk_1E610D760;
  uint64_t v6 = a1[5];
  id v8 = (void *)a1[6];
  uint64_t v7 = a1[7];
  v9[4] = a1[4];
  uint64_t v11 = v7;
  double v12 = a3;
  double v13 = a4;
  double v14 = a5;
  double v15 = a6;
  uint64_t v16 = a2;
  id v10 = v8;
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);
}

uint64_t __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:", 1, *(void *)(a1 + 48), *(void *)(a1 + 88), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __127__PGPictureInPictureProxy__twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock_completionHandler___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a1[6], a1[4], @"PGPictureInPictureProxy.m", 1131, @"Invalid parameter not satisfying: %@", @"appActivationError" object file lineNumber description];
  }
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "[TwoStageStop] Failed to __setupStopAnimated:::::", buf, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)_stopPictureInPictureAnimated:(BOOL)a3 restoreUserInterface:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureProxy *)self _activationState] == 3)
  {
    [(PGPictureInPictureProxy *)self _setActivationState:4 reason:@"_stopPictureInPictureAnimated"];
    if (v5)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [(PGHostedWindow *)self->_hostedWindow snapshotViewAfterScreenUpdates:0];
      [(PGHostedWindow *)self->_hostedWindow bounds];
      objc_msgSend(v11, "setFrame:");
      [(PGHostedWindow *)self->_hostedWindow addSubview:v11];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E610D7D8;
    id v23 = v11;
    id v24 = v8;
    v22[4] = self;
    id v12 = v11;
    double v13 = (void *)MEMORY[0x1BA99D810](v22);
    uint64_t v14 = v5 & ~[(PGPictureInPictureProxy *)self _isViewControllerWindowSceneConsideredActive];
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
    {
      double v15 = [(PGPictureInPictureProxy *)self delegate];
      [v15 pictureInPictureProxyWillSetupPictureInPictureStop:self];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E610D828;
    BOOL v20 = v5;
    BOOL v21 = v6;
    id v18 = v13;
    BOOL v19 = !v5;
    v17[4] = self;
    id v16 = v13;
    [(PGPictureInPictureProxy *)self __setupStopAnimated:v6 needsApplicationActivation:v14 successHandler:v17 failureHandler:v16];
  }
}

void __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v4) {
    (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, v3 == 0, v3);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
  if ([*(id *)(a1 + 32) _activationState] == 4) {
    [*(id *)(a1 + 32) _setActivationState:0 reason:@"_stopPictureInPictureAnimated finalize block"];
  }
  [*(id *)(a1 + 40) removeFromSuperview];
}

void __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v3 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v4 = v2 != 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_3;
    v7[3] = &unk_1E610D800;
    char v10 = v2;
    void v7[4] = v1;
    uint64_t v9 = v3;
    id v8 = *(id *)(a1 + 40);
    objc_msgSend(v1, "__restoreUserInterfaceAnimated:reason:completionHandler:", v4, v3, v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    BOOL v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "__actuallyStopAnimated:reason:completionHandler:", v2 != 0, v3, v5);
  }
}

uint64_t __100__PGPictureInPictureProxy__stopPictureInPictureAnimated_restoreUserInterface_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48), a2, *(void *)(a1 + 40));
}

- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 successHandler:(id)a5 failureHandler:(id)a6
{
}

- (void)__setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 waitForApplicationActivation:(BOOL)a5 successHandler:(id)a6 failureHandler:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  double v15 = PGLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v16 = PGLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if (!v13 || !v14)
  {
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1191, @"Invalid parameter not satisfying: %@", @"successHandler != nil && failureHandler != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke;
  block[3] = &unk_1E610D8A0;
  block[4] = self;
  id v22 = v14;
  BOOL v24 = a3;
  BOOL v25 = a4;
  BOOL v26 = a5;
  id v23 = v13;
  id v18 = v13;
  id v19 = v14;
  dispatch_async(queue, block);
}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_2;
  v10[3] = &unk_1E610D518;
  int v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _remoteObjectWithErrorHandler:v10];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 57);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_4;
  v6[3] = &unk_1E610D878;
  char v9 = *(unsigned char *)(a1 + 58);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  [v3 setupStopAnimated:v4 needsApplicationActivation:v5 completionHandler:v6];
}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __133__PGPictureInPictureProxy___setupStopAnimated_needsApplicationActivation_waitForApplicationActivation_successHandler_failureHandler___block_invoke_5(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 65)) {
    return objc_msgSend(*(id *)(a1 + 32), "__waitForApplicationActivationWithSuccessHandler:failureHandler:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)__waitForApplicationActivationWithSuccessHandler:(id)a3 failureHandler:(id)a4
{
  id v7 = (void (**)(void))a3;
  id v8 = a4;
  char v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if (!v7 || !v8)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1217, @"Invalid parameter not satisfying: %@", @"successHandler != nil && failureHandler != nil" object file lineNumber description];
  }
  if ([(PGPictureInPictureProxy *)self _isViewControllerWindowSceneConsideredActive])
  {
    v7[2](v7);
  }
  else
  {
    id v11 = [(PGPictureInPictureProxy *)self _sourceScene];
    id v12 = (void **)MEMORY[0x1E4F43C78];
    if (!v11) {
      id v12 = (void **)MEMORY[0x1E4F43648];
    }
    id v13 = *v12;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke;
    v19[3] = &unk_1E610D8C8;
    v19[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke_2;
    v16[3] = &unk_1E610D8F0;
    id v17 = v7;
    id v18 = v8;
    UIAnimationDragCoefficient();
    PGWaitForNotificationWithTimeout(MEMORY[0x1E4F14428], v13, v11, v19, v16, v14 * 3.0);
  }
}

uint64_t __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _isViewControllerWindowSceneConsideredActive];
}

void __91__PGPictureInPictureProxy___waitForApplicationActivationWithSuccessHandler_failureHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "Timed out attempting to activate app on PIP stop", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1005 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)__restoreUserInterfaceAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  char v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke;
    v16[3] = &unk_1E610D918;
    void v16[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_4;
    v12[3] = &unk_1E610D940;
    BOOL v15 = a3;
    v12[4] = self;
    int64_t v14 = a4;
    id v13 = v8;
    UIAnimationDragCoefficient();
    PG_dispatch_async_with_timeout(MEMORY[0x1E4F14428], v16, v12, v11);
  }
  else
  {
    (*((void (**)(id, void, double, double, double, double))v8 + 2))(v8, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
}

void __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_2;
  v7[3] = &unk_1E610CF08;
  id v8 = v3;
  id v6 = v3;
  [v4 pictureInPictureProxy:v5 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:v7];
}

void __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PGPictureInPictureProxy___restoreUserInterfaceAnimated_reason_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v14 = 0;
      _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "Timed out attempting to restore UI on PIP stop, attempt proceeding anyway", v14, 2u);
    }
  }
  if (*(unsigned char *)(a1 + 56)
    && ([*(id *)(a1 + 32) _interfaceOrientationForTransitionAnimationAssumeApplicationActive:a2],
        *(unsigned char *)(a1 + 56)))
  {
    [*(id *)(a1 + 32) _viewFrameForTransitionAnimationAssumeApplicationActive:a2];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  if ([*(id *)(a1 + 32) _isInCallService] && *(void *)(a1 + 48))
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v6, v8, v10, v12);
}

- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)__actuallyStopAnimated:(BOOL)a3 reason:(int64_t)a4 finalLayerFrame:(CGRect)a5 finalInterfaceOrientation:(int64_t)a6 completionHandler:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  BOOL v13 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v16 = a7;
  id v17 = PGLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v18 = PGLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!v16)
  {
    BOOL v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1270, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  [(id)objc_opt_class() _updatePictureInPictureActive:0];
  if ([(PGPictureInPictureProxy *)self _activationState] == 4)
  {
    if (v13)
    {
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      if (CGRectIsNull(v40)) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 1;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    [(PGPictureInPictureProxy *)self _beginDeactivatingPictureInPictureWithAnimationType:v19 stopReason:a4];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke;
    v33[3] = &unk_1E610D990;
    v33[4] = self;
    uint64_t v35 = v19;
    int64_t v36 = a4;
    id v34 = v16;
    BOOL v21 = (void *)MEMORY[0x1BA99D810](v33);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_181;
    block[3] = &unk_1E610CC50;
    block[4] = self;
    id v26 = v21;
    BOOL v32 = v13;
    int64_t v27 = a6;
    CGFloat v28 = x;
    CGFloat v29 = y;
    CGFloat v30 = width;
    CGFloat v31 = height;
    id v23 = v21;
    dispatch_async(queue, block);
  }
  else
  {
    BOOL v20 = PGLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v38 = "-[PGPictureInPictureProxy __actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completionHandler:]";
      _os_log_impl(&dword_1B5645000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping deactivation as we are no longer deactivating.", buf, 0xCu);
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _activationState] == 4)
  {
    int v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v2 _endDeactivatingPictureInPictureIfNeededWithAnimationType:v3 stopReason:v4 cleanupHandlerOrNil:v5];
  }
  else
  {
    double v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 136315394;
      double v10 = "-[PGPictureInPictureProxy __actuallyStopAnimated:reason:finalLayerFrame:finalInterfaceOrientation:completion"
            "Handler:]_block_invoke_2";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s Skipping deactivation as our state is not deactivating. Error had been: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_181(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _remoteObjectWithErrorHandler:*(void *)(a1 + 40)];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2_182;
  v5[3] = &unk_1E610D540;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "stopPictureInPictureAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", v3, v4, v5, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_2_182(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v9;
  BSDispatchMain();
}

void __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    int v2 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_4;
    v4[3] = &unk_1E610D9B8;
    id v5 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    [v2 performAsync:v4];
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

uint64_t __117__PGPictureInPictureProxy___actuallyStopAnimated_reason_finalLayerFrame_finalInterfaceOrientation_completionHandler___block_invoke_4(uint64_t a1)
{
  [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)__cleanupWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1318, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke;
  block[3] = &unk_1E610CAE8;
  block[4] = self;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(queue, block);
}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E610D518;
  int v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _remoteObjectWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_4;
  v4[3] = &unk_1E610C1C8;
  id v5 = *(id *)(a1 + 40);
  [v3 cleanupWithCompletionHandler:v4];
}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 32);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __58__PGPictureInPictureProxy___cleanupWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_beginDeactivatingPictureInPicture
{
}

- (void)_beginDeactivatingPictureInPictureWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:]();
    }
  }
  if ([(PGPictureInPictureProxy *)self _activationState] != 4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PGPictureInPictureProxy.m" lineNumber:1339 description:@"starting deactivating without being PGProxyActivationStateDeactivating"];
  }
  [(PGPictureInPictureProxy *)self _setStashedOrUnderLock:0 reason:@"deactivation"];
  [(PGPictureInPictureProxy *)self _setResourcesUsageReductionReasons:0];
  [(PGPictureInPictureProxy *)self _setInterruptedForDefaultReason:0 initiatedByRemoteObject:0];
  [(PGPictureInPictureProxy *)self _setPictureInPictureActive:0];
  [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"begin deactivation"];
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x80) != 0)
  {
    id v9 = [(PGPictureInPictureProxy *)self delegate];
    [v9 pictureInPictureProxy:self willStopPictureInPictureWithAnimationType:a3 reason:a4];
  }
  if (objc_opt_respondsToSelector()) {
    [(PGPictureInPictureViewController *)self->_viewController willAnimatePictureInPictureStop];
  }
}

- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4
{
}

- (void)_endDeactivatingPictureInPictureIfNeededWithAnimationType:(int64_t)a3 stopReason:(int64_t)a4 cleanupHandlerOrNil:(id)a5
{
  id v9 = a5;
  if ([(PGPictureInPictureProxy *)self _activationState] != 4)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PGPictureInPictureProxy.m" lineNumber:1362 description:@"ending deactivating without being PGProxyActivationStateDeactivating"];
  }
  [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"end deactivation"];
  [(PGPictureInPictureProxy *)self _removeViewControllerFromHostedWindowIfNeeded];
  if (v9)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke;
    v15[3] = &unk_1E610D990;
    void v15[4] = self;
    int64_t v17 = a3;
    int64_t v18 = a4;
    id v16 = v9;
    [(PGPictureInPictureProxy *)self __cleanupWithCompletionHandler:v15];
  }
  else
  {
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x100) != 0)
    {
      id v10 = [(PGPictureInPictureProxy *)self delegate];
      [v10 pictureInPictureProxy:self didStopPictureInPictureWithAnimationType:a3 reason:a4];
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke_2;
    v12[3] = &unk_1E610D9E0;
    objc_copyWeak(&v13, &location);
    [(PGPictureInPictureProxy *)self __cleanupWithCompletionHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(_WORD **)(a1 + 32);
  if ((v3[144] & 0x100) != 0)
  {
    id v4 = [v3 delegate];
    [v4 pictureInPictureProxy:*(void *)(a1 + 32) didStopPictureInPictureWithAnimationType:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded];
}

void __116__PGPictureInPictureProxy__endDeactivatingPictureInPictureIfNeededWithAnimationType_stopReason_cleanupHandlerOrNil___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded];
}

- (void)setReadyForDisplay:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_readyForDisplay != a3)
  {
    BOOL v3 = a3;
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      id v7 = "-[PGPictureInPictureProxy setReadyForDisplay:]";
      __int16 v8 = 2048;
      id v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p Ready for display: %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    self->_readyForDisplaCGFloat y = v3;
    [(PGPictureInPictureProxy *)self _startBackgroundPIPWhilePrewarmingIfNeeded];
  }
}

- (void)_prewarmAndStartAfterTimeout
{
  if (![(PGPictureInPictureProxy *)self _activationState]
    && ![(PGPictureInPictureProxy *)self isReadyForDisplay])
  {
    [(PGPictureInPictureProxy *)self _setActivationState:1 reason:@"_prewarmAndStartAfterTimeout"];
    [(PGPictureInPictureProxy *)self _addViewControllerToHostedWindowIfNeeded];
    objc_initWeak(&location, self);
    BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PGPictureInPictureProxy__prewarmAndStartAfterTimeout__block_invoke;
    v6[3] = &unk_1E610C6E0;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:3.0];
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__PGPictureInPictureProxy__prewarmAndStartAfterTimeout__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v5 isValid] && (id)WeakRetained[31] == v5)
  {
    if ([WeakRetained _activationState] == 1) {
      [WeakRetained _startPictureInPictureAnimated:0 enteringBackground:0 reason:@"Prewarming timeout fired" withCompletionHandler:0];
    }
    id v4 = (void *)WeakRetained[31];
    WeakRetained[31] = 0;
  }
}

- (void)_cancelPrewarming
{
  if ([(PGPictureInPictureProxy *)self _activationState] == 1)
  {
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = 0;
    id v4 = prewarmingTimeoutTimer;

    [(NSTimer *)v4 invalidate];
    [(PGPictureInPictureProxy *)self _removeViewControllerFromHostedWindowIfNeeded];
    [(PGPictureInPictureProxy *)self _setActivationState:0 reason:@"_cancelPrewarming"];
  }
}

- (void)_startBackgroundPIPWhilePrewarmingIfNeeded
{
  if ([(PGPictureInPictureProxy *)self _activationState] == 1
    && [(PGPictureInPictureProxy *)self isReadyForDisplay]
    && (*MEMORY[0x1E4F1DB30] != self->_preferredContentSize.width
     || *(double *)(MEMORY[0x1E4F1DB30] + 8) != self->_preferredContentSize.height))
  {
    prewarmingTimeoutTimer = self->_prewarmingTimeoutTimer;
    self->_prewarmingTimeoutTimer = 0;
    id v5 = prewarmingTimeoutTimer;

    [(NSTimer *)v5 invalidate];
    [(PGPictureInPictureProxy *)self _startPictureInPictureAnimated:0 enteringBackground:0 reason:@"became ready for display with a non-zero size while prewarming" withCompletionHandler:0];
  }
}

- (void)_addViewControllerToHostedWindowIfNeeded
{
  BOOL v3 = [(PGPictureInPictureViewController *)self->_viewController parentViewController];
  rootViewController = self->_rootViewController;

  if (v3 != rootViewController)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PGPictureInPictureProxy__addViewControllerToHostedWindowIfNeeded__block_invoke;
    v5[3] = &unk_1E610C280;
    void v5[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v5];
  }
}

void __67__PGPictureInPictureProxy__addViewControllerToHostedWindowIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 304) view];
  objc_msgSend(v2, "PG_setAllowsEdgeAntialiasing:", 1);

  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 304) view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  [*(id *)(*(void *)(a1 + 32) + 216) addChildViewController:*(void *)(*(void *)(a1 + 32) + 304)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 216) view];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 304) view];
  [v4 addSubview:v5];

  [*(id *)(*(void *)(a1 + 32) + 304) didMoveToParentViewController:*(void *)(*(void *)(a1 + 32) + 216)];
  int v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    __int16 v8 = NSStringFromClass(v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 304);
    *(_DWORD *)buf = 138543618;
    BOOL v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "PGHostedWindow root view controller *is* now containing: %{public}@[%p]", buf, 0x16u);
  }
  __int16 v10 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v21 = @"view";
  BOOL v11 = [*(id *)(*(void *)(a1 + 32) + 304) view];
  id v22 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v13 = [v10 constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v12];
  [v10 activateConstraints:v13];

  int64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 304), "view", @"view");
  BOOL v20 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  int64_t v17 = [v14 constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v16];
  [v14 activateConstraints:v17];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 304) willAnimatePictureInPictureStart];
  }
  int64_t v18 = [*(id *)(*(void *)(a1 + 32) + 216) view];
  [v18 layoutIfNeeded];
}

- (void)_removeViewControllerFromHostedWindowIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PGPictureInPictureViewController *)self->_viewController parentViewController];
  rootViewController = self->_rootViewController;

  if (v3 == rootViewController)
  {
    if (objc_opt_respondsToSelector()) {
      [(PGPictureInPictureViewController *)self->_viewController didAnimatePictureInPictureStop];
    }
    [(PGPictureInPictureViewController *)self->_viewController willMoveToParentViewController:0];
    id v5 = [(PGPictureInPictureViewController *)self->_viewController view];
    [v5 removeFromSuperview];

    [(PGPictureInPictureViewController *)self->_viewController removeFromParentViewController];
    int v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      viewController = self->_viewController;
      int v10 = 138543618;
      BOOL v11 = v8;
      __int16 v12 = 2048;
      id v13 = viewController;
      _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "PGHostedWindow root view controller is *not* anymore containing: %{public}@[%p]", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (int64_t)_interfaceOrientationForTransitionAnimationAssumeApplicationActive:(BOOL)a3
{
  int64_t v3 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__PGPictureInPictureProxy__interfaceOrientationForTransitionAnimationAssumeApplicationActive___block_invoke;
    v5[3] = &unk_1E610DA08;
    void v5[4] = self;
    void v5[5] = &v6;
    [(PGPictureInPictureProxy *)self _executeDelegateCallbackBlock:v5 assumeApplicationActive:a3];
    int64_t v3 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __94__PGPictureInPictureProxy__interfaceOrientationForTransitionAnimationAssumeApplicationActive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 pictureInPictureProxyInterfaceOrientationForTransitionAnimation:*(void *)(a1 + 32)];
}

- (CGRect)_viewFrameForTransitionAnimationAssumeApplicationActive:(BOOL)a3
{
  int64_t v3 = (double *)&v14;
  uint64_t v14 = 0;
  BOOL v15 = (double *)&v14;
  int64_t v17 = &unk_1B5693C16;
  uint64_t v16 = 0x4010000000;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v18 = *MEMORY[0x1E4F1DB20];
  long long v19 = v4;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__PGPictureInPictureProxy__viewFrameForTransitionAnimationAssumeApplicationActive___block_invoke;
    v13[3] = &unk_1E610D2B0;
    v13[4] = self;
    v13[5] = &v14;
    [(PGPictureInPictureProxy *)self _executeDelegateCallbackBlock:v13 assumeApplicationActive:a3];
    int64_t v3 = v15;
  }
  double v5 = v3[4];
  double v6 = v3[5];
  double v7 = v3[6];
  double v8 = v3[7];
  _Block_object_dispose(&v14, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

void __83__PGPictureInPictureProxy__viewFrameForTransitionAnimationAssumeApplicationActive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 pictureInPictureProxyViewFrameForTransitionAnimation:*(void *)(a1 + 32)];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  if (!CGRectIsEmpty(v19))
  {
    double v11 = [MEMORY[0x1E4F42D90] mainScreen];
    double v12 = [v11 fixedCoordinateSpace];
    [v12 bounds];
    v22.origin.CGFloat x = v13;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = v15;
    v22.size.CGFloat height = v16;
    v20.origin.CGFloat x = v4;
    v20.origin.CGFloat y = v6;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v10;
    CGRect v21 = CGRectIntersection(v20, v22);
    BOOL IsNull = CGRectIsNull(v21);

    if (!IsNull)
    {
      long long v18 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
      v18[4] = v4;
      v18[5] = v6;
      v18[6] = v8;
      v18[7] = v10;
    }
  }
}

- (id)_bestKnownConnectedSceneSessionPersistentIdentifier
{
  uint64_t v18 = 0;
  CGRect v19 = &v18;
  uint64_t v20 = 0x3032000000;
  CGRect v21 = __Block_byref_object_copy__3;
  CGRect v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) == 0) {
    goto LABEL_4;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke;
  v17[3] = &unk_1E610D2B0;
  v17[4] = self;
  void v17[5] = &v18;
  [(PGPictureInPictureProxy *)self _executeDelegateCallbackBlock:v17 assumeApplicationActive:1];
  double v3 = (void *)v19[5];
  if (v3)
  {
    CGFloat v4 = v3;
  }
  else
  {
LABEL_4:
    CGFloat v4 = self->_sceneSessionPersistentIdentifier;
    if (!v4) {
      goto LABEL_8;
    }
  }
  double v5 = [MEMORY[0x1E4F42738] sharedApplication];
  CGFloat v6 = [v5 connectedScenes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_2;
  v15[3] = &unk_1E610DA30;
  double v7 = v4;
  CGFloat v16 = v7;
  char v8 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v15);

  if (v8)
  {
    id v9 = v16;
    goto LABEL_11;
  }

LABEL_8:
  if ([(PGPictureInPictureProxy *)self _isInactive])
  {
    double v7 = 0;
    goto LABEL_12;
  }
  CGFloat v10 = [MEMORY[0x1E4F42738] sharedApplication];
  double v11 = [v10 connectedScenes];
  objc_msgSend(v11, "bs_firstObjectPassingTest:", &__block_literal_global_231);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  double v12 = [v9 session];
  CGFloat v13 = [v12 persistentIdentifier];
  double v7 = (NSString *)[v13 copy];

LABEL_11:
LABEL_12:
  _Block_object_dispose(&v18, 8);

  return v7;
}

void __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  id v9 = [v2 pictureInPictureProxyViewControllerWindowForTransitionAnimation:*(void *)(a1 + 32)];

  double v3 = [v9 windowScene];
  CGFloat v4 = [v3 session];
  double v5 = [v4 persistentIdentifier];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 session];
  CGFloat v4 = [v3 persistentIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __78__PGPictureInPictureProxy__bestKnownConnectedSceneSessionPersistentIdentifier__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isViewControllerWindowSceneConsideredActive
{
  if ([(PGPictureInPictureProxy *)self _isInCallService] || self->_isInViewService) {
    return 1;
  }

  return [(PGPictureInPictureProxy *)self _isViewControllerWindowSceneActive];
}

- (BOOL)_isViewControllerWindowSceneActive
{
  if ([(id)*MEMORY[0x1E4F43630] applicationState]) {
    return 0;
  }
  CGFloat v4 = [(PGPictureInPictureProxy *)self _sourceScene];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v3 = [v4 activationState] == 0;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)_sourceScene
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_sceneSessionPersistentIdentifier)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v3 = objc_msgSend((id)*MEMORY[0x1E4F43630], "connectedScenes", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = [v8 session];
          CGFloat v10 = [v9 persistentIdentifier];
          int v11 = [v10 isEqualToString:self->_sceneSessionPersistentIdentifier];

          if (v11)
          {
            id v12 = v8;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_12:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_executeDelegateCallbackBlock:(id)a3 assumeApplicationActive:(BOOL)a4
{
  uint64_t v6 = (uint64_t)a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6;
    if (a4
      || (v6 = [(PGPictureInPictureProxy *)self _isViewControllerWindowSceneConsideredActive], uint64_t v7 = v8, v6))
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t))(v7 + 16))(v7);
      uint64_t v7 = v8;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (id)_expectedScene
{
  BOOL v3 = [(PGPictureInPictureProxy *)self _sourceScene];
  if (!v3)
  {
    if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
    {
      uint64_t v4 = [(PGPictureInPictureProxy *)self delegate];
      uint64_t v5 = [v4 pictureInPictureProxyViewControllerWindowForTransitionAnimation:self];
      BOOL v3 = [v5 windowScene];
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectIfNeeded
{
  id v5 = [(PGPictureInPictureProxy *)self _expectedScene];
  if (v5 && [v5 activationState] && !self->_pictureInPictureStashedOrUnderLock)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PGPictureInPictureProxy *)self _addWindowSceneActivationStateObserverIfNeeded:v5];
    }
  }
  else
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(PGPictureInPictureProxy *)self _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:v4];
  }
}

- (void)_addWindowSceneActivationStateObserverIfNeeded:(id)a3
{
  id v5 = a3;
  if (v5 && !self->_windowSceneActivationStateObserver)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F43C78];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PGPictureInPictureProxy__addWindowSceneActivationStateObserverIfNeeded___block_invoke;
    v10[3] = &unk_1E610DA78;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    uint64_t v8 = [v6 addObserverForName:v7 object:v5 queue:0 usingBlock:v10];
    id windowSceneActivationStateObserver = self->_windowSceneActivationStateObserver;
    self->_id windowSceneActivationStateObserver = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __74__PGPictureInPictureProxy__addWindowSceneActivationStateObserverIfNeeded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:v2];
}

- (void)_updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _PGLogMethodProem(self, 1);
    *(_DWORD *)buf = 138543618;
    CGFloat v10 = v6;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
  [(PGPictureInPictureProxy *)self _stopObservingWindowSceneActivationState];
  [(PGPictureInPictureProxy *)self _viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:v4];
  if (self->_pictureInPictureShouldStartWhenEnteringBackground && !self->_isPictureInPictureActive) {
    [(PGPictureInPictureProxy *)self _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:v4];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PGPictureInPictureProxy__updateAutoPIPSettingsAndNotifyRemoteObjectWithReason___block_invoke;
  block[3] = &unk_1E610C280;
  block[4] = self;
  dispatch_async(queue, block);
}

void __81__PGPictureInPictureProxy__updateAutoPIPSettingsAndNotifyRemoteObjectWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 setPictureInPictureShouldStartWhenEnteringBackground:*(unsigned __int8 *)(*(void *)(a1 + 32) + 104) completionHandler:&__block_literal_global_234];
}

- (void)_stopObservingWindowSceneActivationState
{
  if (self->_windowSceneActivationStateObserver)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_windowSceneActivationStateObserver];

    id windowSceneActivationStateObserver = self->_windowSceneActivationStateObserver;
    self->_id windowSceneActivationStateObserver = 0;
  }
}

- (void)_handleSceneConnectionChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F43C98]];

  sceneSessionPersistentIdentifier = self->_sceneSessionPersistentIdentifier;
  if (v6)
  {
    if (!sceneSessionPersistentIdentifier) {
      goto LABEL_4;
    }
    uint64_t v8 = [MEMORY[0x1E4F42738] sharedApplication];
    id v9 = [v8 connectedScenes];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__PGPictureInPictureProxy__handleSceneConnectionChangedNotification___block_invoke;
    v17[3] = &unk_1E610DA30;
    v17[4] = self;
    char v10 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v17);

    if ((v10 & 1) == 0) {
LABEL_4:
    }
      [(PGPictureInPictureProxy *)self _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:@"Scene Connection and _sceneSessionPersistentIdentifier is not connected"];
  }
  else if (sceneSessionPersistentIdentifier)
  {
    __int16 v11 = [v4 name];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F43C80]];

    if (v12)
    {
      uint64_t v13 = [v4 object];
      long long v14 = [v13 session];
      long long v15 = [v14 persistentIdentifier];
      int v16 = [v15 isEqualToString:self->_sceneSessionPersistentIdentifier];

      if (v16) {
        [(PGPictureInPictureProxy *)self _windowSceneForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewControllerWithReason:@"Scene Disconnection"];
      }
    }
  }
}

uint64_t __69__PGPictureInPictureProxy__handleSceneConnectionChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 session];
  id v4 = [v3 persistentIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 56)];

  return v5;
}

- (BOOL)_canBeShownInMicroPIPMode
{
  BOOL v3 = [(PGPictureInPictureProxy *)self playbackState];
  if ([v3 supportsMicroPIP]) {
    BOOL v4 = [(PGPictureInPictureProxy *)self _isInCallService];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_isInCallService
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.InCallService"];

  return v4;
}

- (void)_establishConnection
{
  char v4 = [(PGPictureInPictureProxy *)self _connection];

  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PGPictureInPictureProxy.m", 1663, @"Attempted to establish connection but %@ already had one", self object file lineNumber description];
  }
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.pegasus" options:4096];
  objc_initWeak(&from, v5);
  [v5 _setQueue:self->_queue];
  int v6 = PGPictureInPictureExportedInterface();
  [v5 setExportedInterface:v6];

  uint64_t v7 = [[_PGPictureInPictureConnectionExportedObject alloc] initWithPictureInPictureProxy:self];
  [v5 setExportedObject:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__PGPictureInPictureProxy__establishConnection__block_invoke;
  v13[3] = &unk_1E610DAA0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [v5 setInterruptionHandler:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PGPictureInPictureProxy__establishConnection__block_invoke_2;
  v10[3] = &unk_1E610DAA0;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  [v5 setInvalidationHandler:v10];
  uint64_t v8 = PGPictureInPictureRemoteObjectInterface();
  [v5 setRemoteObjectInterface:v8];

  [(PGPictureInPictureProxy *)self __setConnection:v5];
  [v5 resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      *(_DWORD *)buf = 136315394;
      char v10 = "-[PGPictureInPictureProxy _establishConnection]_block_invoke";
      __int16 v11 = 2048;
      id v12 = v5;
      _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p - Connection interrupted!", buf, 0x16u);
    }
    id v6 = [WeakRetained _connection];
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v6 == v7) {
      [WeakRetained _markConnectionAsInterrupted];
    }
    id v8 = WeakRetained;
    BSDispatchMain();
  }
}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke_246(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 109) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  [*(id *)(a1 + 32) _deactivateIfNeededForInterruptedOrInvalidatedConnection];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F43648];
  id v6 = [MEMORY[0x1E4F42738] sharedApplication];
  [v7 addObserver:v4 selector:sel__applicationDidBecomeActive name:v5 object:v6];
}

void __47__PGPictureInPictureProxy__establishConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PGLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315394;
    char v10 = "-[PGPictureInPictureProxy _establishConnection]_block_invoke_2";
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    _os_log_impl(&dword_1B5645000, v2, OS_LOG_TYPE_DEFAULT, "%s %p - Connection invalidated", buf, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 _connection];
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v6 == v7)
    {
      id v8 = v5;
      BSDispatchMain();
    }
  }
}

uint64_t __47__PGPictureInPictureProxy__establishConnection__block_invoke_249(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__setConnection:", 0);
  [*(id *)(a1 + 32) _resetInternalState];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _deactivateIfNeededForInterruptedOrInvalidatedConnection];
}

- (void)_invalidateConnectionForFailure
{
  BSDispatchQueueAssertMain();
  id v7 = [(PGPictureInPictureProxy *)self _connection];
  [(PGPictureInPictureProxy *)self __setConnection:0];
  [v7 invalidate];
  [(PGPictureInPictureProxy *)self _deactivateIfNeededForInterruptedOrInvalidatedConnection];
  [(PGPictureInPictureProxy *)self _establishConnection];
  [(PGPictureInPictureProxy *)self _resetInternalState];
  int64_t controlsStyle = self->_controlsStyle;
  viewController = self->_viewController;
  id v6 = NSStringFromSelector(a2);
  [(PGPictureInPictureProxy *)self _initializeWithControlsStyle:controlsStyle viewController:viewController reason:v6];
}

- (void)_setMaybeNeedsUpdatePlaybackState
{
  objc_initWeak(&location, self);
  runLoopObserver = self->_runLoopObserver;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PGPictureInPictureProxy__setMaybeNeedsUpdatePlaybackState__block_invoke;
  v4[3] = &unk_1E610CEE0;
  objc_copyWeak(&v5, &location);
  [(PGRunLoopObserver *)runLoopObserver setActions:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__PGPictureInPictureProxy__setMaybeNeedsUpdatePlaybackState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlaybackStateIfNeeded];
}

- (void)_updatePlaybackStateIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_canSendPlaybackState
    && ![(PGPlaybackState *)self->_playbackState isEquivalentToPlaybackState:self->_playbackStateAccordingToRemoteObject])
  {
    BOOL v3 = [(PGPictureInPictureProxy *)self _generatePlaybackStateDiffAndMarkAsSent];
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PGPictureInPictureProxy *)self playbackState];
      *(_DWORD *)buf = 136315650;
      __int16 v11 = "-[PGPictureInPictureProxy _updatePlaybackStateIfNeeded]";
      __int16 v12 = 2048;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p APP: %{public}@", buf, 0x20u);
    }
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PGPictureInPictureProxy__updatePlaybackStateIfNeeded__block_invoke;
    v8[3] = &unk_1E610C258;
    void v8[4] = self;
    id v9 = v3;
    id v7 = v3;
    dispatch_async(queue, v8);
  }
}

void __55__PGPictureInPictureProxy__updatePlaybackStateIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 updatePlaybackStateWithDiff:*(void *)(a1 + 40)];
}

- (id)_generatePlaybackStateDiffAndMarkAsSent
{
  playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  if (!playbackStateAccordingToRemoteObject)
  {
    id v4 = [[PGPlaybackState alloc] initWithDictionary:0];
    id v5 = self->_playbackStateAccordingToRemoteObject;
    self->_playbackStateAccordingToRemoteObject = v4;

    playbackStateAccordingToRemoteObject = self->_playbackStateAccordingToRemoteObject;
  }
  id v6 = [(PGPlaybackState *)playbackStateAccordingToRemoteObject diffFromPlaybackState:self->_playbackState];
  id v7 = (PGPlaybackState *)[(PGPlaybackState *)self->_playbackState copy];
  id v8 = self->_playbackStateAccordingToRemoteObject;
  self->_playbackStateAccordingToRemoteObject = v7;

  return v6;
}

- (void)_applicationDidBecomeActive
{
  if (self->_needsReinitialization)
  {
    [(PGPictureInPictureProxy *)self _resetInternalState];
    int64_t controlsStyle = self->_controlsStyle;
    viewController = self->_viewController;
    [(PGPictureInPictureProxy *)self _initializeWithControlsStyle:controlsStyle viewController:viewController reason:@"application did become active and no connection"];
  }
}

- (void)_deactivateIfNeededForInterruptedOrInvalidatedConnection
{
  int64_t v3 = [(PGPictureInPictureProxy *)self _activationState];
  if ((unint64_t)(v3 - 2) < 2)
  {
    [(PGPictureInPictureProxy *)self _setActivationState:4 reason:@"deactivateIfNeededForInterruptedConnection"];
    [(PGPictureInPictureProxy *)self _beginDeactivatingPictureInPicture];
  }
  else if (v3 != 4)
  {
    if (v3 == 1)
    {
      [(PGPictureInPictureProxy *)self _cancelPrewarming];
    }
    return;
  }
  [(PGPictureInPictureProxy *)self _endDeactivatingPictureInPictureIfNeededWithAnimationType:0 stopReason:1];

  [(PGPictureInPictureProxy *)self _setActivationState:0 reason:@"deactivateIfNeededForInterruptedConnection"];
}

- (void)_legacyPictureInPictureInterruptionBegan
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PGPictureInPictureProxy _legacyPictureInPictureInterruptionBegan]";
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    id v4 = [(PGPictureInPictureProxy *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      id v6 = [(PGPictureInPictureProxy *)self delegate];
      [v6 pictureInPictureProxyPictureInPictureInterruptionBegan:self];
    }
  }
}

- (void)_legacyPictureInPictureInterruptionEnded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PGPictureInPictureProxy _legacyPictureInPictureInterruptionEnded]";
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x400) != 0)
  {
    id v4 = [(PGPictureInPictureProxy *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      id v6 = [(PGPictureInPictureProxy *)self delegate];
      [v6 pictureInPictureProxyPictureInPictureInterruptionEnded:self];
    }
  }
}

- (void)_setPictureInPictureActive:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isPictureInPictureActive != a3)
  {
    BOOL v3 = a3;
    char v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      int v7 = "-[PGPictureInPictureProxy _setPictureInPictureActive:]";
      __int16 v8 = 2048;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    [(PGPictureInPictureProxy *)self willChangeValueForKey:@"pictureInPictureActive"];
    self->_isPictureInPictureActive = v3;
    [(PGPictureInPictureProxy *)self didChangeValueForKey:@"pictureInPictureActive"];
    [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"pip active"];
  }
}

- (void)_setPictureInPictureSuspended:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isPictureInPictureSuspended != a3)
  {
    BOOL v3 = a3;
    char v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      int v7 = "-[PGPictureInPictureProxy _setPictureInPictureSuspended:]";
      __int16 v8 = 2048;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    [(PGPictureInPictureProxy *)self willChangeValueForKey:@"pictureInPictureSuspended"];
    self->_isPictureInPictureSuspended = v3;
    [(PGPictureInPictureProxy *)self didChangeValueForKey:@"pictureInPictureSuspended"];
    [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"suspended changed"];
  }
}

- (void)_setPictureInPicturePossible:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isPictureInPicturePossible != a3)
  {
    BOOL v3 = a3;
    char v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      int v7 = "-[PGPictureInPictureProxy _setPictureInPicturePossible:]";
      __int16 v8 = 2048;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v6, 0x1Cu);
    }

    [(PGPictureInPictureProxy *)self willChangeValueForKey:@"pictureInPicturePossible"];
    self->_isPictureInPicturePossible = v3;
    [(PGPictureInPictureProxy *)self didChangeValueForKey:@"pictureInPicturePossible"];
  }
}

- (void)_setStashedOrUnderLock:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureProxy _beginDeactivatingPictureInPictureWithAnimationType:stopReason:]();
    }
  }
  if (self->_pictureInPictureStashedOrUnderLock != v4)
  {
    __int16 v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      __int16 v14 = "-[PGPictureInPictureProxy _setStashedOrUnderLock:reason:]";
      __int16 v15 = 2048;
      *(void *)uint64_t v16 = self;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v4;
      _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v13, 0x1Cu);
    }

    self->_pictureInPictureStashedOrUnderLock = v4;
    uint64_t v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(self, 1);
      __int16 v10 = (char *)objc_claimAutoreleasedReturnValue();
      int v13 = 138543874;
      __int16 v14 = v10;
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = v4;
      *(_WORD *)&void v16[4] = 2114;
      *(void *)&v16[6] = v6;
      _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Did update stashed or under lock state. stashedOrUnderLock{%{BOOL}u} reason: %{public}@", (uint8_t *)&v13, 0x1Cu);
    }
    BOOL v11 = self->_automaticallyInterruptsForLegacyFaceTimeBehaviors && v4;
    self->_isInterruptedForStash = v11;
    if ((*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
    {
      uint64_t v12 = [(PGPictureInPictureProxy *)self delegate];
      [v12 pictureInPictureProxy:self didUpdateStashedOrUnderLockState:self->_pictureInPictureStashedOrUnderLock];
    }
    [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:@"stashed or underlock"];
    [(PGPictureInPictureProxy *)self _updateAutoPIPSettingsAndNotifyRemoteObjectWithReason:@"stashed or underlock changed"];
  }
}

- (void)_setInterruptedForDefaultReason:(BOOL)a3 initiatedByRemoteObject:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [NSNumber numberWithBool:self->_isInterruptedForDefaultReason];
    uint64_t v9 = [NSNumber numberWithBool:v5];
    int v11 = 136315906;
    uint64_t v12 = "-[PGPictureInPictureProxy _setInterruptedForDefaultReason:initiatedByRemoteObject:]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v11, 0x2Au);
  }
  if (self->_isInterruptedForDefaultReason != v5)
  {
    self->_isInterruptedForDefaultReason = v5;
    if (v4) {
      __int16 v10 = @"default reason initiated by remote";
    }
    else {
      __int16 v10 = @"default reason initiated locally";
    }
    [(PGPictureInPictureProxy *)self _updateIsInterruptedIfNeededForReason:v10 initiatedByRemoteObject:v4];
  }
}

- (void)_updateIsInterruptedIfNeededForReason:(id)a3
{
}

- (void)_updateIsInterruptedIfNeededForReason:(id)a3 initiatedByRemoteObject:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(PGPictureInPictureProxy *)self _activationState];
  int64_t v8 = v7;
  BOOL isInterruptedForDefaultReason = v7 != 0;
  BOOL automaticallyInterruptsForLegacyFaceTimeBehaviors = self->_automaticallyInterruptsForLegacyFaceTimeBehaviors;
  if (automaticallyInterruptsForLegacyFaceTimeBehaviors)
  {
    if (self->_isPictureInPictureSuspended) {
      goto LABEL_7;
    }
    BOOL automaticallyInterruptsForLegacyFaceTimeBehaviors = self->_isInterruptedForStash;
  }
  if (!automaticallyInterruptsForLegacyFaceTimeBehaviors && v7) {
    BOOL isInterruptedForDefaultReason = self->_isInterruptedForDefaultReason;
  }
LABEL_7:
  int v11 = PGLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = _PGLogMethodProem(self, 1);
    BOOL isInterruptedForAnyReason = self->_isInterruptedForAnyReason;
    BOOL v14 = self->_isInterruptedForDefaultReason;
    int v19 = 138544898;
    uint64_t v20 = v12;
    __int16 v21 = 1024;
    BOOL v22 = isInterruptedForAnyReason;
    __int16 v23 = 1024;
    BOOL v24 = isInterruptedForDefaultReason;
    __int16 v25 = 2114;
    id v26 = v6;
    __int16 v27 = 1024;
    BOOL v28 = v8 != 0;
    __int16 v29 = 1024;
    BOOL v30 = v14;
    __int16 v31 = 1024;
    BOOL v32 = v4;
    _os_log_impl(&dword_1B5645000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Did update _isInterruptedForAnyReason %{BOOL}u --> shouldBeInterruptedForAnyReason %{BOOL}u reason: %{public}@ canBeInterrupted %{BOOL}u _isInterruptedForDefaultReason %{BOOL}u initiatedByRemoteObject: %{BOOL}u", (uint8_t *)&v19, 0x34u);
  }
  if (self->_isInterruptedForAnyReason != isInterruptedForDefaultReason)
  {
    self->_BOOL isInterruptedForAnyReason = isInterruptedForDefaultReason;
    if (isInterruptedForDefaultReason)
    {
      [(PGPictureInPictureProxy *)self _legacyPictureInPictureInterruptionBegan];
    }
    else
    {
      [(PGPictureInPictureProxy *)self _legacyPictureInPictureInterruptionEnded];
      if (!v4)
      {
        __int16 v15 = [(PGPictureInPictureProxy *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          __int16 v17 = +[PGCommand commandForEndInterruptionWithShouldResumeSuggestion:0];
          uint64_t v18 = [(PGPictureInPictureProxy *)self delegate];
          [v18 pictureInPictureProxy:self didReceivePlaybackCommand:v17];
        }
      }
    }
  }
}

- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[PGPictureInPictureProxy pictureInPictureStartRequestedAnimated:withCompletionHandler:]";
    __int16 v14 = 2048;
    __int16 v15 = self;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    int64_t v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  int64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v9 = [(PGPictureInPictureProxy *)self _connection];

  if (v8 == v9)
  {
    id v11 = v5;
    BSDispatchMain();
  }
  else
  {
    __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

void __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E610C938;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _startPictureInPictureAnimated:v2 enteringBackground:1 reason:@"remote request" withCompletionHandler:v3];
}

void __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E610C8E8;
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  id v7 = v5;
  id v9 = v7;
  dispatch_async(v6, block);
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _invalidateConnectionForFailure];
  }
}

uint64_t __88__PGPictureInPictureProxy_pictureInPictureStartRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[PGPictureInPictureProxy pictureInPictureStopRequestedAnimated:withCompletionHandler:]";
    __int16 v14 = 2048;
    __int16 v15 = self;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  int64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  id v9 = [(PGPictureInPictureProxy *)self _connection];

  if (v8 == v9)
  {
    id v11 = v5;
    BSDispatchMain();
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E610C938;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _stopPictureInPictureAnimated:v2 restoreUserInterface:1 withCompletionHandler:v3];
}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E610C870;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

void __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_4;
  v2[3] = &unk_1E610C640;
  char v3 = *(unsigned char *)(a1 + 56);
  v2[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __87__PGPictureInPictureProxy_pictureInPictureStopRequestedAnimated_withCompletionHandler___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _invalidateConnectionForFailure];
  }
  return result;
}

- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[PGPictureInPictureProxy beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:]";
    __int16 v13 = 2048;
    char v14 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v8 = [(PGPictureInPictureProxy *)self _connection];

  if (v7 == v8)
  {
    id v10 = v4;
    BSDispatchMain();
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E610DAC8;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E610DAF0;
  char v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock:v9 completionHandler:v6];
}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set_pipStopUserInterfaceRestoreContinuationBlock:", v3);
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E610C6B8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) != 0, 0);
}

void __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 320))
  {
    id v7 = (void *)MEMORY[0x1BA99D810]();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 320);
    *(void *)(v8 + 320) = 0;

    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 200);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E610C8E8;
    id v18 = v7;
    char v19 = a2;
    id v17 = v5;
    id v11 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    if ((a2 & 1) == 0)
    {
      uint64_t v12 = *(NSObject **)(v6 + 200);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_6;
      v13[3] = &unk_1E610CAC0;
      id v15 = *(id *)(a1 + 40);
      id v14 = v5;
      dispatch_async(v12, v13);
      [*(id *)(a1 + 32) _invalidateConnectionForFailure];

      goto LABEL_7;
    }
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PGPictureInPictureProxy.m", 1944, @"_twoStageStopForPictureInPictureRestoreWithContinueAfterUserInterfaceRestoreBlock completed without error, but a __pipStopFinalStageCompletionHandler was not available" object file lineNumber description];
  }

LABEL_7:
}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __106__PGPictureInPictureProxy_beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[PGPictureInPictureProxy endTwoStagePictureInPictureStopWithCompletionBlock:]";
    __int16 v16 = 2048;
    id v17 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v8 = [(PGPictureInPictureProxy *)self _connection];

  if (v7 == v8)
  {
    [(PGPictureInPictureProxy *)self set_pipStopFinalStageCompletionHandler:v4];
    id v10 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v11 = __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke_2;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    v4[2](v4, 0, v9);

    id v10 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v11 = __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke;
  }
  v10[2] = v11;
  v10[3] = &unk_1E610C280;
  void v10[4] = self;
  BSDispatchMain();
}

uint64_t __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateConnectionForFailure];
}

void __78__PGPictureInPictureProxy_endTwoStagePictureInPictureStopWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 312);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 312);
    *(void *)(v3 + 312) = 0;
  }
}

- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[PGPictureInPictureProxy pictureInPictureCancelRequestedAnimated:withCompletionHandler:]";
    __int16 v14 = 2048;
    id v15 = self;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
  id v9 = [(PGPictureInPictureProxy *)self _connection];

  if (v8 == v9)
  {
    id v11 = v5;
    BSDispatchMain();
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

void __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E610C938;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _stopPictureInPictureAnimated:v2 restoreUserInterface:0 withCompletionHandler:v3];
}

void __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E610C8E8;
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  id v7 = v5;
  id v9 = v7;
  dispatch_async(v6, block);
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _invalidateConnectionForFailure];
  }
}

uint64_t __89__PGPictureInPictureProxy_pictureInPictureCancelRequestedAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)updatePictureInPicturePossible:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[PGPictureInPictureProxy updatePictureInPicturePossible:]";
    __int16 v10 = 2048;
    char v11 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F29268] currentConnection];
  id v7 = [(PGPictureInPictureProxy *)self _connection];

  if (v6 == v7) {
    BSDispatchMain();
  }
}

uint64_t __58__PGPictureInPictureProxy_updatePictureInPicturePossible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPictureInPicturePossible:*(unsigned __int8 *)(a1 + 40)];
}

- (void)pictureInPictureInvalidated
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[PGPictureInPictureProxy pictureInPictureInvalidated]";
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v6 = [(PGPictureInPictureProxy *)self _connection];

  if (v5 == v6) {
    BSDispatchMain();
  }
}

uint64_t __54__PGPictureInPictureProxy_pictureInPictureInvalidated__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _activationState] == 3
    || (uint64_t result = [*(id *)(a1 + 32) _activationState], result == 2))
  {
    [*(id *)(a1 + 32) _setActivationState:4 reason:@"pictureInPictureInvalidated starting"];
    [(id)objc_opt_class() _updatePictureInPictureActive:0];
    [*(id *)(a1 + 32) _beginDeactivatingPictureInPicture];
    [*(id *)(a1 + 32) _endDeactivatingPictureInPictureIfNeededWithAnimationType:0 stopReason:1];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _setActivationState:0 reason:@"pictureInPictureInvalidated finished"];
  }
  return result;
}

- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v11 = a6;
  uint64_t v12 = PGLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    __int16 v13 = PGLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  __int16 v14 = [MEMORY[0x1E4F29268] currentConnection];
  id v15 = [(PGPictureInPictureProxy *)self _connection];

  if (v14 == v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke;
    v17[3] = &unk_1E610DB40;
    id v18 = v11;
    char v19 = self;
    CGFloat v20 = width;
    CGFloat v21 = height;
    int64_t v22 = a4;
    double v23 = a5;
    [v16 performAsync:v17];
  }
}

void __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(unsigned __int8 *)(v2 + 256);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_2;
  v11[3] = &unk_1E610C9A8;
  void v11[4] = v2;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v4 = (void *)MEMORY[0x1BA99D810](v11);
  uint64_t v5 = *(void *)(a1 + 64);
  switch(v5)
  {
    case 2:
      if (!v3 && (objc_opt_respondsToSelector() & 1) != 0) {
        [*(id *)(*(void *)(a1 + 40) + 304) viewWillResize];
      }
      double v6 = *(double *)(a1 + 72);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_4;
      v7[3] = &unk_1E610DB18;
      char v8 = v3;
      void v7[4] = *(void *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v4, v7, v6);
      break;
    case 1:
      if (!v3 && (objc_opt_respondsToSelector() & 1) != 0) {
        [*(id *)(*(void *)(a1 + 40) + 304) viewWillResize];
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_3;
      v9[3] = &unk_1E610DB18;
      char v10 = v3;
      v9[4] = *(void *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v4, v9);
      break;
    case 0:
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E4F42FF0], "PG_performWithoutAnimation:", v4);
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [*(id *)(*(void *)(a1 + 40) + 304) viewWillResize];
        }
        objc_msgSend(MEMORY[0x1E4F42FF0], "PG_performWithoutAnimation:", v4);
        if (objc_opt_respondsToSelector()) {
          [*(id *)(*(void *)(a1 + 40) + 304) viewDidResize];
        }
      }
      break;
  }
}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);

  return [v2 layoutIfNeeded];
}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v2 = *(void **)(*(void *)(v1 + 32) + 304);
      return [v2 viewDidResize];
    }
  }
  return result;
}

uint64_t __107__PGPictureInPictureProxy_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v2 = *(void **)(*(void *)(v1 + 32) + 304);
      return [v2 viewDidResize];
    }
  }
  return result;
}

- (void)hostedWindowSizeChangeBegan
{
  int v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  double v6 = [(PGPictureInPictureProxy *)self _connection];

  if (v5 == v6) {
    BSDispatchMain();
  }
}

uint64_t __54__PGPictureInPictureProxy_hostedWindowSizeChangeBegan__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = 1;
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(*(void *)(a1 + 32) + 304);
    return [v3 viewWillResize];
  }
  return result;
}

- (void)hostedWindowSizeChangeEnded
{
  int v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  double v6 = [(PGPictureInPictureProxy *)self _connection];

  if (v5 == v6) {
    BSDispatchMain();
  }
}

uint64_t __54__PGPictureInPictureProxy_hostedWindowSizeChangeEnded__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 304) viewDidResize];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = 0;
  return result;
}

- (void)actionButtonTapped
{
  int v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  double v6 = [(PGPictureInPictureProxy *)self _connection];

  if (v5 == v6) {
    BSDispatchMain();
  }
}

uint64_t __45__PGPictureInPictureProxy_actionButtonTapped__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = *(void **)(*(void *)(a1 + 32) + 304);
    return [v3 actionButtonTapped];
  }
  return result;
}

- (void)setStashedOrUnderLock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = _PGLogMethodProem(self, 1);
    *(_DWORD *)buf = 138543618;
    id v11 = v9;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_debug_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ %{BOOL}u", buf, 0x12u);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    double v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  char v8 = [(PGPictureInPictureProxy *)self _connection];

  if (v7 == v8) {
    BSDispatchMain();
  }
}

uint64_t __49__PGPictureInPictureProxy_setStashedOrUnderLock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStashedOrUnderLock:*(unsigned __int8 *)(a1 + 40) reason:@"remote message"];
}

- (void)setResourcesUsageReductionReasons:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [NSNumber numberWithUnsignedInteger:a3];
    int v10 = 136315650;
    id v11 = "-[PGPictureInPictureProxy setResourcesUsageReductionReasons:]";
    __int16 v12 = 2048;
    BOOL v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v10, 0x20u);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  char v8 = [MEMORY[0x1E4F29268] currentConnection];
  __int16 v9 = [(PGPictureInPictureProxy *)self _connection];

  if (v8 == v9) {
    [(PGPictureInPictureProxy *)self _setResourcesUsageReductionReasons:a3];
  }
}

- (void)_setResourcesUsageReductionReasons:(unint64_t)a3
{
}

void __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = (void **)(a1 + 32);
  uint64_t v4 = *(void *)(v1 + 264);
  if (v3 == v4)
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke_cold_1(v2);
    }
  }
  else
  {
    *(void *)(v1 + 264) = v3;
    if ((*((_WORD *)*v2 + 144) & 0x1000) == 0) {
      return;
    }
    double v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*v2 delegate];
      char v8 = [NSNumber numberWithUnsignedInteger:v3];
      __int16 v9 = [NSNumber numberWithUnsignedInteger:v4];
      int v10 = 136315906;
      id v11 = "-[PGPictureInPictureProxy _setResourcesUsageReductionReasons:]_block_invoke";
      __int16 v12 = 2114;
      BOOL v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s Informing %{public}@ of didUpdateResourcesUsageReductionReasons:%@ oldReasons:%@", (uint8_t *)&v10, 0x2Au);
    }
    uint64_t v5 = [*v2 delegate];
    [v5 pictureInPictureProxy:*v2 didUpdateResourcesUsageReductionReasons:v3 oldReasons:v4];
  }
}

- (void)handleCommand:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  double v6 = [MEMORY[0x1E4F29268] currentConnection];
  id v7 = [(PGPictureInPictureProxy *)self _connection];

  if (v6 == v7)
  {
    char v8 = [[PGCommand alloc] initWithDictionary:v4];
    __int16 v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(self, 1);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      __int16 v16 = (PGPictureInPictureProxy *)v8;
      _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
    }
    id v11 = PGLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[PGPictureInPictureProxy handleCommand:]";
      __int16 v15 = 2114;
      __int16 v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1B5645000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);
    }

    __int16 v12 = v8;
    BSDispatchMain();
  }
}

void __41__PGPictureInPictureProxy_handleCommand___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) systemAction] == 1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _notifyActionButtonTapped];
    return;
  }
  if ([*(id *)(a1 + 32) systemAction] == 7)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    [v3 _invalidateConnectionForFailure];
    return;
  }
  if ([*(id *)(a1 + 32) systemAction] != 6)
  {
    uint64_t v5 = [*(id *)(a1 + 32) faceTimeAction];
    double v6 = *(void **)(a1 + 32);
    if (v5)
    {
      int v7 = [v6 associatedBoolValue];
      uint64_t v8 = 5;
      switch([*(id *)(a1 + 32) faceTimeAction])
      {
        case 1:
          BOOL v9 = v7 == 0;
          uint64_t v10 = 1;
          goto LABEL_27;
        case 2:
          BOOL v9 = v7 == 0;
          uint64_t v10 = 3;
LABEL_27:
          if (v9) {
            uint64_t v8 = v10 + 1;
          }
          else {
            uint64_t v8 = v10;
          }
          goto LABEL_40;
        case 3:
          goto LABEL_40;
        case 4:
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v15 = *(id *)(*(void *)(a1 + 40) + 144);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (!v16) {
            goto LABEL_74;
          }
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v44;
          break;
        case 5:
          uint64_t v8 = 6;
LABEL_40:
          int64_t v22 = [*(id *)(a1 + 40) delegate];
          char v23 = objc_opt_respondsToSelector();

          if ((v23 & 1) == 0) {
            return;
          }
          id v42 = [*(id *)(a1 + 40) delegate];
          [v42 pictureInPictureProxy:*(void *)(a1 + 40) didRequestFaceTimeAction:v8];
          goto LABEL_42;
        default:
          return;
      }
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          CGFloat v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v21 = [v20 identifier];
          if (v21 == [*(id *)(a1 + 32) associatedIntegerValue])
          {
            [v20 invokeAction];
            goto LABEL_74;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      if ([v6 testingAction])
      {
        id v11 = [*(id *)(a1 + 40) delegate];
        char v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) == 0) {
          return;
        }
        id v42 = [*(id *)(a1 + 40) delegate];
        [v42 pictureInPictureProxy:*(void *)(a1 + 40) didReceiveTestingCommand:*(void *)(a1 + 32)];
LABEL_42:
        BOOL v13 = v42;
        goto LABEL_43;
      }
      switch([*(id *)(a1 + 32) playbackAction])
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 8:
          goto LABEL_25;
        case 5:
          int v24 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 103);
          if (v24 == [*(id *)(a1 + 32) associatedBoolValue]) {
            goto LABEL_66;
          }
          objc_msgSend(*(id *)(a1 + 40), "_setPictureInPictureSuspended:", objc_msgSend(*(id *)(a1 + 32), "associatedBoolValue"));
          goto LABEL_25;
        case 6:
          __int16 v25 = *(unsigned __int8 **)(a1 + 40);
          int v26 = v25[100];
          [v25 _setInterruptedForDefaultReason:1 initiatedByRemoteObject:1];
          if (v26) {
            BOOL v27 = 1;
          }
          else {
            BOOL v27 = *(unsigned char *)(*(void *)(a1 + 40) + 100) == 0;
          }
          int v14 = !v27;
          goto LABEL_67;
        case 7:
          BOOL v28 = *(unsigned __int8 **)(a1 + 40);
          int v29 = v28[100];
          [v28 _setInterruptedForDefaultReason:0 initiatedByRemoteObject:1];
          if (v29) {
            BOOL v30 = *(unsigned char *)(*(void *)(a1 + 40) + 100) == 0;
          }
          else {
            BOOL v30 = 0;
          }
          int v14 = v30;
          goto LABEL_67;
        case 9:
          __int16 v31 = [*(id *)(a1 + 40) delegate];
          if (objc_opt_respondsToSelector())
          {
            BOOL v32 = [*(id *)(a1 + 40) delegate];
            char v33 = [v32 pictureInPictureProxyCanIssueOptionalCommand:*(void *)(a1 + 32)];

            if (v33)
            {
LABEL_25:
              int v14 = 1;
              goto LABEL_67;
            }
          }
          else
          {
          }
          [*(id *)(a1 + 40) stopPictureInPictureAndRestoreUserInterface:0];
LABEL_66:
          int v14 = 0;
LABEL_67:
          uint64_t v34 = [*(id *)(a1 + 40) _activationState];
          uint64_t v35 = PGLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v36 = _PGLogMethodProem(*(void **)(a1 + 40), 0);
            uint64_t v37 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            v48 = v36;
            __int16 v49 = 1024;
            BOOL v50 = v34 != 0;
            __int16 v51 = 2114;
            uint64_t v52 = v37;
            __int16 v53 = 1024;
            int v54 = v14;
            _os_log_impl(&dword_1B5645000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ isActiveOrStarting: %{BOOL}u handle command %{public}@ should notify: %{BOOL}u", buf, 0x22u);
          }
          char v38 = v14 ^ 1;
          if (!v34) {
            char v38 = 1;
          }
          if (v38) {
            return;
          }
          uint64_t v39 = [*(id *)(a1 + 40) delegate];
          char v40 = objc_opt_respondsToSelector();

          if ((v40 & 1) == 0) {
            return;
          }
          id v15 = [*(id *)(a1 + 40) delegate];
          [v15 pictureInPictureProxy:*(void *)(a1 + 40) didReceivePlaybackCommand:*(void *)(a1 + 32)];
          break;
        default:
          goto LABEL_66;
      }
    }
LABEL_74:

    return;
  }
  if (![*(id *)(a1 + 40) _isInactive]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 280));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [*(id *)(a1 + 40) isReadyForDisplay];
LABEL_22:
    [*(id *)(a1 + 40) _startPictureInPictureAnimated:0 enteringBackground:0 reason:@"PGSystemActionStartPIP" withCompletionHandler:0];
    goto LABEL_23;
  }
  int v4 = [WeakRetained pictureInPictureProxySupportsPrewarming:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) isReadyForDisplay] & 1) != 0 || !v4) {
    goto LABEL_22;
  }
  [*(id *)(a1 + 40) _prewarmAndStartAfterTimeout];
LABEL_23:
  BOOL v13 = WeakRetained;
LABEL_43:
}

- (void)_notifyActionButtonTapped
{
  if (objc_opt_respondsToSelector())
  {
    viewController = self->_viewController;
    [(PGPictureInPictureViewController *)viewController actionButtonTapped];
  }
}

- (void)skipForwardButtonTappedWithTimeInterval:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    viewController = self->_viewController;
    [(PGPictureInPictureViewController *)viewController skipForwardButtonTappedWithTimeInterval:a3];
  }
}

- (void)_pipSceneComponentDidConnect:(id)a3
{
  id v9 = a3;
  int v4 = [v9 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v9 object];
  }
  else
  {
    uint64_t v5 = 0;
  }

  double v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:self->_requestedSceneIdentifier];

  if (v7)
  {
    uint64_t v8 = [v5 windowScene];
    [(PGPictureInPictureProxy *)self _setRequestedWindowScene:v8];
  }
}

- (void)_pipSceneComponentDidDisconnect:(id)a3
{
  id v8 = a3;
  int v4 = [v8 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v8 object];
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v6 = [v5 windowScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

  if (v6 == WeakRetained) {
    [(PGPictureInPictureProxy *)self _setRequestedWindowScene:0];
  }
}

- (void)_setRequestedWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

      if (v7)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"PGPictureInPictureProxy.m" lineNumber:2328 description:@"We don't support changing scenes!"];
      }
    }
    objc_storeWeak((id *)&self->_requestedWindowScene, obj);
    [(UIWindow *)self->_contentWindow setHidden:1];
    id v9 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);

    id v6 = obj;
    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F43058]);
      id v11 = objc_loadWeakRetained((id *)&self->_requestedWindowScene);
      char v12 = (UIWindow *)[v10 initWithWindowScene:v11];
      contentWindow = self->_contentWindow;
      self->_contentWindow = v12;

      [(UIWindow *)self->_contentWindow setBackgroundColor:0];
      [(UIWindow *)self->_contentWindow setRootViewController:self->_rootViewController];
      [(UIWindow *)self->_contentWindow setHidden:0];
      id v6 = obj;
    }
  }
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x4000) != 0)
  {
    id v5 = [(PGPictureInPictureProxy *)self delegate];
    [v5 pictureInPictureProxy:self pagingSkipByNumberOfPages:a3];
  }
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (PGPictureInPictureViewController)viewController
{
  return self->_viewController;
}

- (BOOL)isPictureInPictureStashedOrUnderLock
{
  return self->_pictureInPictureStashedOrUnderLock;
}

- (unint64_t)resourcesUsageReductionReasons
{
  return self->_resourcesUsageReductionReasons;
}

- (BOOL)isPictureInPictureStashed
{
  return self->_stashed;
}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (id)_pipStopUserInterfaceRestoreContinuationBlock
{
  return self->__pipStopUserInterfaceRestoreContinuationBlock;
}

- (void)set_pipStopUserInterfaceRestoreContinuationBlock:(id)a3
{
}

- (id)_pipStopFinalStageCompletionHandler
{
  return self->__pipStopFinalStageCompletionHandler;
}

- (void)set_pipStopFinalStageCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__pipStopFinalStageCompletionHandler, 0);
  objc_storeStrong(&self->__pipStopUserInterfaceRestoreContinuationBlock, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_prewarmingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_contentWindow, 0);
  objc_destroyWeak((id *)&self->_requestedWindowScene);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_hostedWindow, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_connectionIfInterrupted, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_runLoopObserver, 0);
  objc_storeStrong((id *)&self->_playbackStateAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_loadedTimeRanges, 0);
  objc_storeStrong(&self->_windowSceneActivationStateObserver, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifierAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifierAccordingToRemoteObject, 0);
  objc_storeStrong((id *)&self->_overrideInterruptionExemptionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifier, 0);

  objc_storeStrong((id *)&self->_sceneSessionPersistentIdentifier, 0);
}

- (void)__coordinateStartAnimated:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  uint64_t v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%{public}@", v5, v6, v7, v8, v9);
}

- (void)_beginDeactivatingPictureInPictureWithAnimationType:stopReason:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  uint64_t v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%@ must be invoked on the main thread!", v5, v6, v7, v8, v9);
}

void __62__PGPictureInPictureProxy__setResourcesUsageReductionReasons___block_invoke_cold_1(void **a1)
{
  int v1 = _PGLogMethodProem(*a1, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@ oldReasons cannot equal new ones.", v4, v5, v6, v7, v8);
}

@end