@interface PGPictureInPictureRemoteObject
+ (void)tetherRemoteObject:(id)a3 toRemoteObject:(id)a4 mode:(int64_t)a5;
- (BOOL)_canTransitionToState:(int64_t)a3;
- (BOOL)_currentStateAllowsProcessAssertion;
- (BOOL)_isAppICS;
- (BOOL)_isAssociatedWithOtherObject:(id)a3;
- (BOOL)_isICSVideoCall;
- (BOOL)_isInActivitySession;
- (BOOL)_isUnderLock;
- (BOOL)_wantsProcessAssertion;
- (BOOL)canActivateUntetheredAlongsideOtherObject:(id)a3;
- (BOOL)canCancelPictureInPicture;
- (BOOL)canEndTwoStageStopPictureInPicture;
- (BOOL)canPreventOrSuspendRemoteObject:(id)a3;
- (BOOL)canStartBackgroundPIPForCurrentActivitySessionIdentifier;
- (BOOL)canStartMicroPIP;
- (BOOL)canStopPictureInPicture;
- (BOOL)canTetherRemoteObjectAsMicroPIP:(id)a3;
- (BOOL)isInterrupted;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isStartingPictureInPicture;
- (BOOL)isStartingStoppingOrCancellingPictureInPicture;
- (BOOL)isStoppingOrCancellingPictureInPicture;
- (BOOL)isVideoCall;
- (BOOL)matchesSceneSessionIdentifier:(id)a3;
- (BOOL)pictureInPictureViewControllerShouldHideTetheredViewControllerAlongsideControls:(id)a3;
- (BOOL)shouldStartPictureInPictureEnteringBackground;
- (BOOL)supportsMicroPIP;
- (CGRect)initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding;
- (CGSize)preferredContentSize;
- (NSString)activitySessionIdentifier;
- (NSString)description;
- (NSString)exemptAttribution;
- (NSString)sourceSceneSessionPersistentIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate;
- (PGPictureInPictureApplication)pictureInPictureApplication;
- (PGPictureInPictureRemoteObject)init;
- (PGPictureInPictureRemoteObject)initWithConnection:(id)a3 interruptionAssistant:(id)a4;
- (PGPictureInPictureRemoteObject)tetheredRemoteObject;
- (PGPictureInPictureRemoteObject)tetheringRemoteObject;
- (PGPictureInPictureRemoteObjectDelegate)delegate;
- (PGPictureInPictureViewController)pictureInPictureViewController;
- (id)_invalidationTimerWithTimeout:(double)a3;
- (id)_invalidationTimerWithTimeout:(double)a3 block:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)contentType;
- (int64_t)currentState;
- (int64_t)sourceSceneSettingsInterfaceOrientation;
- (void)_acquireOrInvalidateProcessAssertionIfNeeded;
- (void)_finishCleanup;
- (void)_invalidateAllAssertions;
- (void)_invalidateForFailureToStartStopOrCancel;
- (void)_invalidateInterruptionBeganFinishTaskAssertion;
- (void)_notifyProxyOfStashedOrUnderLock:(BOOL)a3;
- (void)_queue_notifyProxyOfInterruptionBegan;
- (void)_queue_notifyProxyOfInterruptionEnded;
- (void)_setCurrentState:(int64_t)a3;
- (void)_setResolvedResourcesUsageReductionReasons:(unint64_t)a3;
- (void)_setUILockedResourcesUsageReductionReasons:(unint64_t)a3;
- (void)_stopTethering;
- (void)_updateActiveProxyAndViewControllerOfInterruptionIfNeeded;
- (void)_updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4;
- (void)beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)checkActivePictureInPictureCancellationPolicyWithCompletion:(id)a3;
- (void)cleanupWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)endTwoStageStopPictureInPictureWithCompletionBlock:(id)a3;
- (void)handleCommand:(id)a3;
- (void)initializePictureInPictureWithControlsStyle:(int64_t)a3 preferredContentSize:(CGSize)a4 sceneIdentifier:(id)a5 affectsAppLifeCycle:(BOOL)a6 completionHandler:(id)a7;
- (void)invalidate;
- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4;
- (void)pagingSkipByNumberOfPages:(int64_t)a3;
- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4;
- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4;
- (void)pictureInPictureViewController:(id)a3 didReceiveCommand:(id)a4;
- (void)pictureInPictureViewController:(id)a3 didTransitionToStashed:(BOOL)a4;
- (void)pictureInPictureViewController:(id)a3 updateHostedWindowSize:(CGSize)a4 animationType:(int64_t)a5 initialSpringVelocity:(double)a6;
- (void)pictureInPictureViewControllerDidRequestCancel:(id)a3;
- (void)pictureInPictureViewControllerDidRequestStop:(id)a3;
- (void)pictureInPictureViewControllerHostedWindowSizeChangeBegan:(id)a3;
- (void)pictureInPictureViewControllerHostedWindowSizeChangeEnded:(id)a3;
- (void)resume;
- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)sendStartPictureInPictureTestAction;
- (void)setActivitySessionIdentifier:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setCurrentResourcesUsageReductionReasons:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExemptAttribution:(id)a3;
- (void)setExemptAttributionOverride:(id)a3;
- (void)setPictureInPicturePossible:(BOOL)a3;
- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3 completionHandler:(id)a4;
- (void)setSourceSceneSessionPersistentIdentifier:(id)a3;
- (void)setTetheredRemoteObject:(id)a3;
- (void)setTetheringRemoteObject:(id)a3;
- (void)setupStartAnimated:(BOOL)a3 hostedWindowHostingHandle:(id)a4 sceneSessionPersistentIdentifier:(id)a5 preferredContentSize:(CGSize)a6 initialInterfaceOrientation:(int64_t)a7 initialLayerFrame:(CGRect)a8 completionHandler:(id)a9;
- (void)setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 completionHandler:(id)a5;
- (void)startPictureInPictureAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)startPictureInPictureEnteringBackgroundAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)startPictureInPictureFromBackground;
- (void)stopPictureInPictureAndRestoreUserInterface;
- (void)stopPictureInPictureAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)stopPictureInPictureAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6;
- (void)suspend;
- (void)updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding:(CGRect)a3 withCompletionHandler:(id)a4;
- (void)updateMenuItems:(id)a3;
- (void)updatePlaybackStateWithDiff:(id)a3;
- (void)updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4;
- (void)updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation PGPictureInPictureRemoteObject

- (BOOL)matchesSceneSessionIdentifier:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  v5 = [(PGPictureInPictureRemoteObject *)self sourceSceneSessionPersistentIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (PGPictureInPictureRemoteObject)initWithConnection:(id)a3 interruptionAssistant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject initWithConnection:interruptionAssistant:]();
  }

  v27.receiver = self;
  v27.super_class = (Class)PGPictureInPictureRemoteObject;
  v9 = [(PGPictureInPictureRemoteObject *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_connection, v6);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.pegasus.PGPictureInPictureRemoteObject %p", v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[PGPictureInPictureApplication pictureInPictureApplicationWithProcessIdentifier:](PGPictureInPictureApplication, "pictureInPictureApplicationWithProcessIdentifier:", [v6 processIdentifier]);
    pictureInPictureApplication = v10->_pictureInPictureApplication;
    v10->_pictureInPictureApplication = (PGPictureInPictureApplication *)v16;

    v10->_currentState = 0;
    objc_initWeak(&location, v10);
    id v18 = MEMORY[0x1E4F14428];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"PictureInPicture - PGPictureInPictureRemoteObject - %p", v10);
    objc_copyWeak(&v25, &location);
    uint64_t v20 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v10->_stateCaptureInvalidatable;
    v10->_stateCaptureInvalidatable = (BSInvalidatable *)v20;

    objc_storeStrong((id *)&v10->_interruptionAssistant, a4);
    interruptionAssistant = v10->_interruptionAssistant;
    v23 = [(PGPictureInPictureApplication *)v10->_pictureInPictureApplication bundleIdentifier];
    [(PGInterruptionAssistant *)interruptionAssistant setExemptAttribution:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

__CFString *__75__PGPictureInPictureRemoteObject_initWithConnection_interruptionAssistant___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained description];
  }
  else
  {
    v3 = &stru_1F0E4F210;
  }

  return v3;
}

- (PGPictureInPictureRemoteObject)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = _PGLogMethodProem(self, 0);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithConnection:].", v5, v7 format];

  return [(PGPictureInPictureRemoteObject *)self initWithConnection:0 interruptionAssistant:0];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

uint64_t __41__PGPictureInPictureRemoteObject_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateAnalyticsSessionIfNeeded];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 pictureInPictureDidDestroyAnalyticsSourceWithUUID:v3];
}

- (NSString)description
{
  return (NSString *)[(PGPictureInPictureRemoteObject *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PGPictureInPictureRemoteObject *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PGPictureInPictureRemoteObject *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(PGPictureInPictureRemoteObject *)self succinctDescriptionBuilder];
  uint64_t v5 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication description];
  [v4 appendString:v5 withName:@"application"];

  [v4 appendString:self->_sourceSceneSessionPersistentIdentifier withName:@"sourceSceneSessionPersistentIdentifier"];
  uint64_t v6 = [(PGPictureInPictureRemoteObject *)self activitySessionIdentifier];
  [v4 appendString:v6 withName:@"activitySessionIdentifier"];

  uint64_t v7 = PGStringFromPictureInPictureControlsStyle(self->_controlsStyle);
  [v4 appendString:v7 withName:@"controlsStyle"];

  id v8 = (id)[v4 appendBool:self->_isPictureInPicturePossible withName:@"isPictureInPicturePossible"];
  [v4 appendString:self->_exemptAttribution withName:@"exemptAttribution"];
  [v4 appendString:self->_exemptAttributionOverride withName:@"exemptAttributionOverride"];
  id v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[PGPictureInPictureRemoteObject isInterrupted](self, "isInterrupted"), @"isInterrupted");
  v10 = PGStringFromPictureInPictureRemoteObjectState(self->_currentState);
  [v4 appendString:v10 withName:@"currentState"];

  id v11 = (id)[v4 appendBool:self->_pictureInPictureShouldStartWhenEnteringBackground withName:@"pictureInPictureShouldStartWhenEnteringBackground"];
  id v12 = (id)[v4 appendBool:self->_stashed withName:@"stashed"];
  if (self->_tetheringRemoteObject) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = self->_tetheredRemoteObject != 0;
  }
  id v14 = (id)[v4 appendBool:v13 withName:@"isInMicroPIP"];
  id v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock"), @"isUnderLock");
  uint64_t v16 = NSStringFromCGRect(self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding);
  [v4 appendString:v16 withName:@"initialLayerFrame"];

  return v4;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAnalyticsDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_analyticsDelegate, v4);
    analyticsSourceUUID = self->_analyticsSourceUUID;
    p_analyticsSourceUUID = (id *)&self->_analyticsSourceUUID;
    id v8 = analyticsSourceUUID;
    uint64_t v9 = [p_analyticsSourceUUID[18] bundleIdentifier];
    v10 = (void *)v9;
    id v11 = @"com.apple.MissingBundleIdentifier";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v12 = v11;

    [(__CFString *)v12 isEqualToString:@"com.apple.InCallService"];
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F29128] UUID];
      objc_storeStrong(p_analyticsSourceUUID, v8);
    }
    id v15 = v4;
    uint64_t v16 = v8;
    BOOL v13 = v12;
    id v14 = v8;
    BSDispatchMain();
  }
}

uint64_t __55__PGPictureInPictureRemoteObject_setAnalyticsDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pictureInPictureDidCreateAnalyticsSourceWithUUID:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48) contentType:*(void *)(a1 + 56)];
}

- (BOOL)shouldStartPictureInPictureEnteringBackground
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PGPictureInPictureRemoteObject *)self isPictureInPicturePossible];
  BOOL pictureInPictureShouldStartWhenEnteringBackground = self->_pictureInPictureShouldStartWhenEnteringBackground;
  BOOL v5 = [(PGPictureInPictureRemoteObject *)self _canTransitionToState:3];
  BOOL v6 = (unint64_t)(self->_currentState - 3) <= 2 && self->_pictureInPictureStartedAutomatically;
  BOOL v7 = [(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted];
  BOOL v8 = v7;
  int v9 = v5 || v6;
  char v10 = !v3;
  if (!pictureInPictureShouldStartWhenEnteringBackground) {
    char v10 = 1;
  }
  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = v9 & !v7;
  }
  id v12 = PGLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
    {
      BOOL v13 = [(PGInterruptionAssistant *)self->_interruptionAssistant description];
    }
    else
    {
      BOOL v13 = &stru_1F0E4F210;
    }
    int v15 = 134219522;
    uint64_t v16 = self;
    __int16 v17 = 1024;
    int v18 = v11;
    __int16 v19 = 1024;
    BOOL v20 = v3;
    __int16 v21 = 1024;
    BOOL v22 = pictureInPictureShouldStartWhenEnteringBackground;
    __int16 v23 = 1024;
    int v24 = v9;
    __int16 v25 = 1024;
    BOOL v26 = v8;
    __int16 v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1B5645000, v12, OS_LOG_TYPE_DEFAULT, "Remote object(%p) shouldStartPictureInPictureEnteringBackground check result:%{BOOL}u. State: possible(%{BOOL}u) shouldStartEnteringBackground(%{BOOL}u) canStartAutomaticallyOrIsStartingAutomatically(%{BOOL}u) isInterrupted(%{BOOL}u) %{public}@", (uint8_t *)&v15, 0x34u);
    if (v8) {
  }
    }
  return v11;
}

- (BOOL)canStopPictureInPicture
{
  return [(PGPictureInPictureRemoteObject *)self _canTransitionToState:8];
}

- (BOOL)canCancelPictureInPicture
{
  unint64_t currentState = self->_currentState;
  if (currentState > 0xE) {
    return 0;
  }
  if (((1 << currentState) & 0x73C7) != 0) {
    return [(PGPictureInPictureRemoteObject *)self _canTransitionToState:7];
  }
  return 1;
}

- (BOOL)isStartingPictureInPicture
{
  return (unint64_t)(self->_currentState - 3) < 3;
}

- (BOOL)isStoppingOrCancellingPictureInPicture
{
  return (self->_currentState < 0xEuLL) & (0x2F80u >> self->_currentState);
}

- (BOOL)isStartingStoppingOrCancellingPictureInPicture
{
  if ([(PGPictureInPictureRemoteObject *)self isStartingPictureInPicture]) {
    return 1;
  }

  return [(PGPictureInPictureRemoteObject *)self isStoppingOrCancellingPictureInPicture];
}

- (BOOL)canEndTwoStageStopPictureInPicture
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  return self->_hasBegunTwoStageStop;
}

- (BOOL)isPictureInPicturePossible
{
  return self->_isPictureInPicturePossible;
}

- (BOOL)isInterrupted
{
  return [(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted];
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (self->_isPictureInPicturePossible != v3)
  {
    self->_isPictureInPicturePossible = v3;
    if (v3) {
      [(PGPIPRemoteObjectSceneController *)self->_sceneControllerIfExists activateIfNeeded];
    }
    BOOL v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138543618;
      id v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "isPictureInPicturePossible - %{public}@ %@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PGPictureInPictureRemoteObject_setPictureInPicturePossible___block_invoke;
    block[3] = &unk_1E610C7D0;
    block[4] = self;
    block[5] = a2;
    BOOL v12 = v3;
    dispatch_async(queue, block);
  }
}

void __62__PGPictureInPictureRemoteObject_setPictureInPicturePossible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 updatePictureInPicturePossible:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setSourceSceneSessionPersistentIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  BOOL v5 = v4;
  if (self->_sourceSceneSessionPersistentIdentifier != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    BOOL v6 = (NSString *)[(NSString *)v5 copy];
    sourceSceneSessionPersistentIdentifier = self->_sourceSceneSessionPersistentIdentifier;
    self->_sourceSceneSessionPersistentIdentifier = v6;

    if (v5)
    {
      uint64_t v19 = 0;
      BOOL v20 = &v19;
      uint64_t v21 = 0x2050000000;
      BOOL v8 = (void *)getFBSceneManagerClass_softClass;
      uint64_t v22 = getFBSceneManagerClass_softClass;
      if (!getFBSceneManagerClass_softClass)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __getFBSceneManagerClass_block_invoke;
        v18[3] = &unk_1E610CD18;
        v18[4] = &v19;
        __getFBSceneManagerClass_block_invoke((uint64_t)v18);
        BOOL v8 = (void *)v20[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v19, 8);
      char v10 = [v9 sharedInstance];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      __int16 v15 = __76__PGPictureInPictureRemoteObject_setSourceSceneSessionPersistentIdentifier___block_invoke;
      uint64_t v16 = &unk_1E610C7F8;
      uint64_t v17 = v5;
      int v11 = [v10 scenesPassingTest:&v13];
      BOOL v12 = objc_msgSend(v11, "anyObject", v13, v14, v15, v16);
      objc_storeWeak((id *)&self->_sourceScene, v12);

      [(PGPIPRemoteObjectSceneController *)self->_sceneControllerIfExists updateInterfaceOrientation];
    }
  }
}

uint64_t __76__PGPictureInPictureRemoteObject_setSourceSceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 settings];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = v8;

  char v10 = [v9 persistenceIdentifier];

  uint64_t v11 = [v10 isEqualToString:*(void *)(a1 + 32)];
  *a3 = v11;
  return v11;
}

- (int64_t)sourceSceneSettingsInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceScene);
  BOOL v4 = [(PGPictureInPictureRemoteObject *)self isStartingPictureInPicture];
  int64_t v5 = 1;
  if (!v4 && WeakRetained)
  {
    uint64_t v6 = [WeakRetained settings];
    int64_t v5 = [v6 interfaceOrientation];
  }
  return v5;
}

- (int64_t)contentType
{
  return [(PGPlaybackState *)self->_playbackState contentType];
}

- (BOOL)isVideoCall
{
  return [(PGPictureInPictureRemoteObject *)self contentType] == 4;
}

- (void)startPictureInPictureEnteringBackgroundAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[PGPictureInPictureRemoteObject startPictureInPictureEnteringBackgroundAnimated:withCompletionHandler:]";
    __int16 v18 = 2048;
    uint64_t v19 = self;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:3])
  {
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:3];
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController notePictureInPictureStartedAutomatically:1];
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E610C8C0;
    v12[4] = self;
    SEL v14 = a2;
    id v13 = v7;
    BOOL v15 = a3;
    dispatch_async(queue, v12);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E610C848;
  id v4 = *(id *)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  int64_t v5 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:errorHandler:", v3, v10);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E610C898;
  id v7 = *(id *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v5 pictureInPictureStartRequestedAnimated:v6 withCompletionHandler:v8];
}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E610C820;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v10 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, a1[4]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  [WeakRetained invalidate];
}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_5;
  v9[3] = &unk_1E610C870;
  id v6 = *(id *)(a1 + 40);
  char v13 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v12 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 _invalidateForFailureToStartStopOrCancel];
  }
  return result;
}

- (void)stopPictureInPictureAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:8])
  {
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:8];
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E610C8C0;
    v11[4] = self;
    SEL v13 = a2;
    BOOL v14 = a3;
    id v12 = v7;
    dispatch_async(queue, v11);
  }
  else if (v7)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  id v4 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E610C1C8;
  id v7 = *(id *)(a1 + 40);
  [v4 pictureInPictureStopRequestedAnimated:v5 withCompletionHandler:v6];
}

void __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E610C8E8;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:9])
  {
    self->_hasBegunTwoStageStop = 1;
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:9];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke;
    block[3] = &unk_1E610C960;
    void block[4] = self;
    SEL v11 = a2;
    id v10 = v5;
    dispatch_async(queue, block);
  }
  else if (v5)
  {
    if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:6]) {
      [(PGPictureInPictureRemoteObject *)self _setCurrentState:6];
    }
    self->_hasBegunTwoStageStop = 0;
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v8);
  }
}

void __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  id v4 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E610C938;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:v6];
}

void __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E610C910;
  char v11 = a2;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    if ([*(id *)(a1 + 32) _canTransitionToState:6]) {
      [*(id *)(a1 + 32) _setCurrentState:6];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 160) = 0;
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)endTwoStageStopPictureInPictureWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (self->_hasBegunTwoStageStop) {
    goto LABEL_9;
  }
  id v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject endTwoStageStopPictureInPictureWithCompletionBlock:](v7);
  }

  if (self->_hasBegunTwoStageStop)
  {
LABEL_9:
    self->_hasBegunTwoStageStop = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke;
    block[3] = &unk_1E610C960;
    void block[4] = self;
    SEL v12 = a2;
    id v11 = v5;
    dispatch_async(queue, block);
  }
  else if (v5)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v9);
  }
}

void __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  id v4 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E610C1C8;
  id v6 = *(id *)(a1 + 40);
  [v4 endTwoStagePictureInPictureStopWithCompletionBlock:v5];
}

void __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E610C8E8;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)sendStartPictureInPictureTestAction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[PGPictureInPictureRemoteObject sendStartPictureInPictureTestAction]";
    __int16 v10 = 2048;
    char v11 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PGPictureInPictureRemoteObject_sendStartPictureInPictureTestAction__block_invoke;
  v7[3] = &unk_1E610C5C0;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

void __69__PGPictureInPictureRemoteObject_sendStartPictureInPictureTestAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  id v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  id v4 = +[PGCommand commandForTestStartPIP];
  id v5 = [v4 dictionaryRepresentation];
  [v3 handleCommand:v5];
}

- (void)startPictureInPictureFromBackground
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(PGPictureInPictureRemoteObject *)self isPictureInPicturePossible])
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PGPictureInPictureRemoteObject.m", 530, @"Tried to BG PIP a remote object %@ that has NO for pip is possible", self object file lineNumber description];
  }
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[PGPictureInPictureRemoteObject startPictureInPictureFromBackground]";
    __int16 v17 = 2048;
    __int16 v18 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if (!self->_startBackgroundPIPAssertion)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v7 = +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", [WeakRetained processIdentifier], @"Start PIP from Background");

    objc_storeStrong((id *)&self->_startBackgroundPIPAssertion, v7);
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke;
    block[3] = &unk_1E610C258;
    void block[4] = self;
    id v14 = v7;
    id v9 = v7;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke_2;
  v12[3] = &unk_1E610C5C0;
  v12[4] = self;
  void v12[5] = a2;
  dispatch_async(queue, v12);
}

uint64_t __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2 == *(void **)(result + 40))
  {
    uint64_t v3 = result;
    *(void *)(v1 + 64) = 0;

    id v4 = *(void **)(v3 + 40);
    return [v4 invalidate];
  }
  return result;
}

void __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  uint64_t v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  id v4 = +[PGCommand commandForStartPIP];
  id v5 = [v4 dictionaryRepresentation];
  [v3 handleCommand:v5];
}

- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  [(PGInterruptionAssistant *)self->_interruptionAssistant addReason:a3 attribution:v6];
  if (a3 == 2)
  {
    exemptAttributionOverride = self->_exemptAttributionOverride;
    if (!exemptAttributionOverride) {
      exemptAttributionOverride = self->_exemptAttribution;
    }
    if ([v6 isEqualToString:exemptAttributionOverride]
      && [(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:4])
    {
      [(PGPictureInPictureRemoteObject *)self pictureInPictureInterruptionEndedWithReason:4 attribution:0];
    }
  }
  id v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4) {
      __int16 v10 = @"invalid";
    }
    else {
      __int16 v10 = off_1E610CDE0[a3];
    }
    BOOL v11 = [(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted];
    int v13 = 136315906;
    id v14 = "-[PGPictureInPictureRemoteObject pictureInPictureInterruptionBeganWithReason:attribution:]";
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    __int16 v19 = 1024;
    BOOL v20 = v11;
    _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "%s %p: %{public}@ isInterrupted %{BOOL}u ", (uint8_t *)&v13, 0x26u);
  }

  if ([(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1]) {
    [(PGPictureInPictureRemoteObject *)self _setUILockedResourcesUsageReductionReasons:1];
  }
  if (a3 == 1)
  {
    BOOL v12 = self->_stashed || [(PGPictureInPictureRemoteObject *)self _isUnderLock];
    [(PGPictureInPictureRemoteObject *)self _notifyProxyOfStashedOrUnderLock:v12];
  }
  [(PGPictureInPictureRemoteObject *)self _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  [(PGInterruptionAssistant *)self->_interruptionAssistant removeReason:a3 attribution:v6];
  if (a3 == 1)
  {
    BOOL v8 = self->_stashed || [(PGPictureInPictureRemoteObject *)self _isUnderLock];
    [(PGPictureInPictureRemoteObject *)self _notifyProxyOfStashedOrUnderLock:v8];
  }
  id v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4) {
      __int16 v10 = @"invalid";
    }
    else {
      __int16 v10 = off_1E610CDE0[a3];
    }
    BOOL v11 = [(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted];
    int v12 = 138543874;
    int v13 = v10;
    __int16 v14 = 1024;
    BOOL v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    _os_log_impl(&dword_1B5645000, v9, OS_LOG_TYPE_DEFAULT, "pictureInPictureInterruptionEndedWithReason: %{public}@ isInterrupted %{BOOL}u %p", (uint8_t *)&v12, 0x1Cu);
  }

  [(PGPictureInPictureRemoteObject *)self _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
  if (![(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1]) {
    [(PGPictureInPictureRemoteObject *)self _setUILockedResourcesUsageReductionReasons:0];
  }
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController flashControls];
}

- (void)_notifyProxyOfStashedOrUnderLock:(BOOL)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PGPictureInPictureRemoteObject__notifyProxyOfStashedOrUnderLock___block_invoke;
  block[3] = &unk_1E610C7D0;
  void block[4] = self;
  void block[5] = a2;
  BOOL v5 = a3;
  dispatch_async(queue, block);
}

void __67__PGPictureInPictureRemoteObject__notifyProxyOfStashedOrUnderLock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  uint64_t v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 setStashedOrUnderLock:*(unsigned __int8 *)(a1 + 48)];
}

- (void)suspend
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[PGPictureInPictureRemoteObject suspend]";
    __int16 v10 = 2048;
    BOOL v11 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:12])
  {
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:12];
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke;
    v7[3] = &unk_1E610C5C0;
    v7[4] = self;
    v7[5] = a2;
    dispatch_async(queue, v7);
  }
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_2;
  v1[3] = &unk_1E610C5C0;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

uint64_t __41__PGPictureInPictureRemoteObject_suspend__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_3;
  v2[3] = &unk_1E610C5C0;
  long long v3 = *(_OWORD *)(a1 + 32);
  return [*(id *)(v3 + 256) performSuspendAnimationWithCompletionHandler:v2];
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  long long v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_4;
  v3[3] = &unk_1E610C5C0;
  long long v4 = v1;
  dispatch_async(v2, v3);
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  long long v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  long long v4 = +[PGCommand commandForSetSuspended:1];
  BOOL v5 = [v4 dictionaryRepresentation];
  [v3 handleCommand:v5];
}

- (void)resume
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[PGPictureInPictureRemoteObject resume]";
    __int16 v10 = 2048;
    BOOL v11 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke;
  v7[3] = &unk_1E610C5C0;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

void __40__PGPictureInPictureRemoteObject_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  long long v4 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  BOOL v5 = +[PGCommand commandForSetSuspended:0];
  id v6 = [v5 dictionaryRepresentation];
  [v4 handleCommand:v6];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke_2;
  block[3] = &unk_1E610C280;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__PGPictureInPictureRemoteObject_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(void **)(v1 + 256);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke_3;
  v4[3] = &unk_1E610C280;
  v4[4] = v1;
  return [v2 performResumeAnimationWithCompletionHandler:v4];
}

void *__40__PGPictureInPictureRemoteObject_resume__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[5] == 12) {
    return (void *)[result _setCurrentState:6];
  }
  return result;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[PGPictureInPictureRemoteObject cancel]";
    __int16 v11 = 2048;
    uint64_t v12 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:7])
  {
    *(_WORD *)&self->_hasPendingCancellationRequest = 0;
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:7];
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController notePictureInPictureWillStopForAppRequest:0 preferredFullScreenRestore:0];
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PGPictureInPictureRemoteObject_cancel__block_invoke;
    v8[3] = &unk_1E610C5C0;
    v8[4] = self;
    void v8[5] = a2;
    dispatch_async(queue, v8);
  }
  else
  {
    BOOL v7 = [(PGPictureInPictureRemoteObject *)self isStartingPictureInPicture];
    if (v7) {
      LOBYTE(v7) = [(PGPictureInPictureRemoteObject *)self canCancelPictureInPicture];
    }
    self->_hasPendingCancellationRequest = v7;
    self->_hasPendingStopRequest = 0;
  }
}

void __40__PGPictureInPictureRemoteObject_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  long long v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 pictureInPictureCancelRequestedAnimated:1 withCompletionHandler:&__block_literal_global_9];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[PGPictureInPictureRemoteObject invalidate]";
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:13])
  {
    [(PGPictureInPictureRemoteObject *)self _setCurrentState:13];
    long long v4 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController parentViewController];

    if (v4)
    {
      BOOL v5 = [(PGPictureInPictureRemoteObject *)self delegate];
      [v5 pictureInPictureRemoteObject:self willHidePictureInPictureViewController:self->_pictureInPictureViewController];

      [(PGPictureInPictureRemoteObject *)self _stopTethering];
      pictureInPictureViewController = self->_pictureInPictureViewController;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44__PGPictureInPictureRemoteObject_invalidate__block_invoke;
      v7[3] = &unk_1E610C280;
      v7[4] = self;
      -[PGPictureInPictureViewController performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:](pictureInPictureViewController, "performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", 1, 0, v7, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
    else if ([(PGPictureInPictureRemoteObject *)self _canTransitionToState:14])
    {
      [(PGPictureInPictureRemoteObject *)self _setCurrentState:14];
      [(PGPictureInPictureRemoteObject *)self _finishCleanup];
    }
  }
  [(PGPIPRemoteObjectSceneController *)self->_sceneControllerIfExists invalidate];
}

uint64_t __44__PGPictureInPictureRemoteObject_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) setHostedWindowHostingHandle:0];
  [*(id *)(*(void *)(a1 + 32) + 256) setSceneView:0];
  long long v2 = [*(id *)(a1 + 32) delegate];
  [v2 pictureInPictureRemoteObject:*(void *)(a1 + 32) didHidePictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

  uint64_t result = [*(id *)(a1 + 32) _canTransitionToState:14];
  if (result)
  {
    [*(id *)(a1 + 32) _setCurrentState:14];
    long long v4 = *(void **)(a1 + 32);
    return [v4 _finishCleanup];
  }
  return result;
}

- (void)setCurrentResourcesUsageReductionReasons:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PGPictureInPictureRemoteObject setCurrentResourcesUsageReductionReasons:]";
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  self->_externalResourcesUsageReductionReasons = a3;
  [(PGPictureInPictureRemoteObject *)self _setResolvedResourcesUsageReductionReasons:self->_UILockedResourcesUsageReductionReasons | a3];
}

- (void)_setUILockedResourcesUsageReductionReasons:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PGPictureInPictureRemoteObject _setUILockedResourcesUsageReductionReasons:]";
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  self->_UILockedResourcesUsageReductionReasons = a3;
  [(PGPictureInPictureRemoteObject *)self _setResolvedResourcesUsageReductionReasons:self->_externalResourcesUsageReductionReasons | a3];
}

- (void)_setResolvedResourcesUsageReductionReasons:(unint64_t)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PGPictureInPictureRemoteObject__setResolvedResourcesUsageReductionReasons___block_invoke;
  block[3] = &unk_1E610C9A8;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a2;
  dispatch_async(queue, block);
}

void __77__PGPictureInPictureRemoteObject__setResolvedResourcesUsageReductionReasons___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 184) != v2)
  {
    *(void *)(v1 + 184) = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    long long v4 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
    BOOL v5 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v4);
    [v5 setResourcesUsageReductionReasons:*(void *)(a1 + 40)];
  }
}

- (NSString)activitySessionIdentifier
{
  activitySessionIdentifier = self->_activitySessionIdentifier;
  if (activitySessionIdentifier)
  {
    long long v3 = activitySessionIdentifier;
  }
  else
  {
    long long v3 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
  }

  return v3;
}

- (BOOL)canStartBackgroundPIPForCurrentActivitySessionIdentifier
{
  if (self->_currentState != 2 || self->_pictureInPictureViewController) {
    return 0;
  }
  activitySessionIdentifierForLastActivePIPSession = self->_activitySessionIdentifierForLastActivePIPSession;
  id v6 = [(PGPictureInPictureRemoteObject *)self activitySessionIdentifier];
  if ([(NSString *)activitySessionIdentifierForLastActivePIPSession isEqualToString:v6]) {
    BOOL v3 = [(PGPictureInPictureRemoteObject *)self _isICSVideoCall];
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (BOOL)supportsMicroPIP
{
  BOOL v3 = [(PGPlaybackState *)self->_playbackState supportsMicroPIP];
  if (v3)
  {
    LOBYTE(v3) = [(PGPictureInPictureRemoteObject *)self _isAppICS];
  }
  return v3;
}

- (BOOL)canStartMicroPIP
{
  BOOL v3 = [(PGPictureInPictureRemoteObject *)self supportsMicroPIP];
  if (v3)
  {
    if (self->_hasPendingStopRequest)
    {
      char v4 = 0;
    }
    else
    {
      char v4 = !self->_hasPendingCancellationRequest;
      if (!self->_hasPendingCancellationRequest && (unint64_t)(self->_currentState - 2) >= 5)
      {
        BOOL v5 = [(PGPictureInPictureRemoteObject *)self delegate];
        char v4 = [v5 pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:self];
      }
    }
    LOBYTE(v3) = [(PGPictureInPictureRemoteObject *)self supportsMicroPIP] & v4;
  }
  return v3;
}

- (BOOL)canTetherRemoteObjectAsMicroPIP:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = (unint64_t)(self->_currentState - 3) <= 3
    && [v4 canStartMicroPIP]
    && ![(PGPictureInPictureRemoteObject *)self canStartMicroPIP]
    && !self->_tetheredRemoteObject
    && [(PGPictureInPictureRemoteObject *)self _isAssociatedWithOtherObject:v5];
  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
    __int16 v9 = PGStringFromPictureInPictureRemoteObjectState(self->_currentState);
    int v10 = [v5 canStartMicroPIP];
    int v11 = ![(PGPictureInPictureRemoteObject *)self canStartMicroPIP];
    BOOL v12 = self->_tetheredRemoteObject == 0;
    int v14 = 136317186;
    BOOL v15 = "-[PGPictureInPictureRemoteObject canTetherRemoteObjectAsMicroPIP:]";
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2114;
    __int16 v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 2114;
    __int16 v23 = v9;
    __int16 v24 = 1024;
    int v25 = v10;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 1024;
    BOOL v31 = [(PGPictureInPictureRemoteObject *)self _isAssociatedWithOtherObject:v5];
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ %{BOOL}u || _currentState: %{public}@ [otherObject canStartMicroPIP] %{BOOL}u ![self canStartMicroPIP] %{BOOL}u _tetheredMicroPIP == nil %{BOOL}u [self _isAssociatedWithOtherObject:otherObject] %{BOOL}u", (uint8_t *)&v14, 0x48u);
  }
  return v6;
}

- (BOOL)canActivateUntetheredAlongsideOtherObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PGPictureInPictureRemoteObject contentType](self, "contentType") == 6 || [v4 contentType] == 6;

  return v5;
}

+ (void)tetherRemoteObject:(id)a3 toRemoteObject:(id)a4 mode:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __int16 v9 = (id *)a3;
  unint64_t v10 = (unint64_t)a4;
  int v11 = PGLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [NSNumber numberWithInteger:a5];
    *(_DWORD *)buf = 136316162;
    __int16 v19 = "+[PGPictureInPictureRemoteObject tetherRemoteObject:toRemoteObject:mode:]";
    __int16 v20 = 2048;
    id v21 = a1;
    __int16 v22 = 2048;
    __int16 v23 = v9;
    __int16 v24 = 2048;
    unint64_t v25 = v10;
    __int16 v26 = 2112;
    int v27 = v12;
    _os_log_impl(&dword_1B5645000, v11, OS_LOG_TYPE_DEFAULT, "%s %p tether %p to %p for mode %@", buf, 0x34u);
  }
  if ((unint64_t)v9 | v10)
  {
    char v13 = [(id)v10 canTetherRemoteObjectAsMicroPIP:v9];
    if (v9 && v10 && (v13 & 1) == 0)
    {
      __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, a1, @"PGPictureInPictureRemoteObject.m", 812, @"Failed to tether [%@] to [%@]. isStoppingTethering[%u] canStartTethering[%u]", v9, v10, 0, 0 object file lineNumber description];

      [v9 setTetheringRemoteObject:v10];
    }
    else
    {
      [v9 setTetheringRemoteObject:v10];
      if (!v9) {
        goto LABEL_11;
      }
    }
    if ([v9[32] stashed] && (objc_msgSend(v9[19], "hasInterruptionReason:", 4) & 1) == 0) {
      [v9 pictureInPictureInterruptionBeganWithReason:4 attribution:0];
    }
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PGPictureInPictureRemoteObject.m", 809, @"Invalid parameter not satisfying: %@", @"tetheredObject != nil || tetheringObject != nil" object file lineNumber description];

    [0 canTetherRemoteObjectAsMicroPIP:0];
    [0 setTetheringRemoteObject:0];
  }
LABEL_11:
  [(id)v10 setTetheredRemoteObject:v9];
  uint64_t v14 = [v9 pictureInPictureViewController];
  uint64_t v15 = [(id)v10 pictureInPictureViewController];
  if (v14 | v15) {
    +[PGPictureInPictureViewController tetherViewController:v14 toViewController:v15 mode:a5];
  }
}

- (void)_stopTethering
{
  if (self->_tetheredRemoteObject)
  {
    [(id)objc_opt_class() tetherRemoteObject:self->_tetheredRemoteObject toRemoteObject:0 mode:0];
    [(id)objc_opt_class() tetherRemoteObject:0 toRemoteObject:self mode:0];
  }
  if (self->_tetheringRemoteObject)
  {
    [(id)objc_opt_class() tetherRemoteObject:0 toRemoteObject:self->_tetheringRemoteObject mode:0];
    BOOL v3 = objc_opt_class();
    [v3 tetherRemoteObject:self toRemoteObject:0 mode:1];
  }
}

- (BOOL)_isUnderLock
{
  return [(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1];
}

- (void)_setCurrentState:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int64_t currentState = self->_currentState;
  BSDispatchQueueAssertMain();
  if (![(PGPictureInPictureRemoteObject *)self _canTransitionToState:a3])
  {
    unint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v26 = PGStringFromPictureInPictureRemoteObjectState(currentState);
    int v27 = PGStringFromPictureInPictureRemoteObjectState(a3);
    [v25 handleFailureInMethod:a2, self, @"PGPictureInPictureRemoteObject.m", 849, @"%@ attempted transition from %@ to %@, which is not allowed.", self, v26, v27 object file lineNumber description];
  }
  if (currentState == a3) {
    return;
  }
  self->_int64_t currentState = a3;
  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = PGStringFromPictureInPictureRemoteObjectState(currentState);
    __int16 v9 = PGStringFromPictureInPictureRemoteObjectState(a3);
    *(_DWORD *)buf = 136315906;
    BOOL v31 = "-[PGPictureInPictureRemoteObject _setCurrentState:]";
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2114;
    v35 = v8;
    __int16 v36 = 2114;
    v37 = v9;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ -> %{public}@", buf, 0x2Au);
  }
  BOOL v10 = [(PGInterruptionAssistant *)self->_interruptionAssistant isProxyActive];
  unint64_t v11 = self->_currentState;
  if (v11 <= 0xC)
  {
    if (((1 << v11) & 0x1070) != 0)
    {
LABEL_14:
      BOOL v10 = 1;
      goto LABEL_15;
    }
    if (((1 << v11) & 7) != 0)
    {
      if ([(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:4])
      {
        [(PGPictureInPictureRemoteObject *)self pictureInPictureInterruptionEndedWithReason:4 attribution:0];
      }
      BOOL v10 = 0;
      self->_pictureInPictureStartedAutomatically = 0;
      goto LABEL_15;
    }
    if (v11 == 3)
    {
      self->_pictureInPictureStartedAutomatically = 1;
      goto LABEL_14;
    }
  }
LABEL_15:
  [(PGInterruptionAssistant *)self->_interruptionAssistant setProxyActive:v10];
  [(PGPictureInPictureRemoteObject *)self _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
  if (a3 == 6)
  {
    BOOL v12 = [(PGPictureInPictureRemoteObject *)self activitySessionIdentifier];
    char v13 = (NSString *)[v12 copy];
    activitySessionIdentifierForLastActivePIPSession = self->_activitySessionIdentifierForLastActivePIPSession;
    self->_activitySessionIdentifierForLastActivePIPSession = v13;

    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = [(PGPictureInPictureRemoteObject *)self isStartingPictureInPicture];
  }
  BOOL v16 = self->_hasPendingStopRequest || self->_hasPendingCancellationRequest;
  BOOL v17 = [(PGPictureInPictureRemoteObject *)self isStoppingOrCancellingPictureInPicture];
  cancelPictureInPictureFinishTaskAssertion = self->_cancelPictureInPictureFinishTaskAssertion;
  if (!v17 && (!v15 || !v16))
  {
    [(PGProcessAssertion *)cancelPictureInPictureFinishTaskAssertion invalidate];
    __int16 v19 = self->_cancelPictureInPictureFinishTaskAssertion;
    self->_cancelPictureInPictureFinishTaskAssertion = 0;

    [(NSTimer *)self->_timerForInvalidatingIfStopOrCancelFails invalidate];
    timerForInvalidatingIfStopOrCancelFails = self->_timerForInvalidatingIfStopOrCancelFails;
    self->_timerForInvalidatingIfStopOrCancelFails = 0;
LABEL_27:

    return;
  }
  if (!cancelPictureInPictureFinishTaskAssertion || !self->_timerForInvalidatingIfStopOrCancelFails)
  {
    [(PGProcessAssertion *)cancelPictureInPictureFinishTaskAssertion invalidate];
    [(NSTimer *)self->_timerForInvalidatingIfStopOrCancelFails invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    __int16 v22 = +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", [WeakRetained processIdentifier], @"Cancel PIP Task Assertion");

    objc_storeStrong((id *)&self->_cancelPictureInPictureFinishTaskAssertion, v22);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51__PGPictureInPictureRemoteObject__setCurrentState___block_invoke;
    v28[3] = &unk_1E610C9D0;
    v28[4] = self;
    id v29 = v22;
    timerForInvalidatingIfStopOrCancelFails = v22;
    __int16 v23 = [(PGPictureInPictureRemoteObject *)self _invalidationTimerWithTimeout:v28 block:5.0];
    __int16 v24 = self->_timerForInvalidatingIfStopOrCancelFails;
    self->_timerForInvalidatingIfStopOrCancelFails = v23;

    goto LABEL_27;
  }
}

uint64_t __51__PGPictureInPictureRemoteObject__setCurrentState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(id *)(v4 + 96) == v3)
  {
    if ([v3 isValid]) {
      [*(id *)(a1 + 32) _invalidateForFailureToStartStopOrCancel];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v7 = *(void **)(a1 + 40);
  if (v7 == *(void **)(v4 + 80))
  {
    [v7 invalidate];
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 80);
    *(void *)(v8 + 80) = 0;
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_canTransitionToState:(int64_t)a3
{
  int64_t currentState = self->_currentState;
  BOOL result = currentState == a3;
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      BOOL v6 = currentState == a3 || currentState == 0;
      goto LABEL_41;
    case 2:
      BOOL v6 = currentState == 1 || currentState == 11;
      goto LABEL_41;
    case 3:
      if (currentState != 2) {
        goto LABEL_26;
      }
      BOOL v7 = !self->_isPictureInPicturePossible;
      goto LABEL_32;
    case 4:
      if (currentState == 2 && self->_isPictureInPicturePossible) {
        goto LABEL_20;
      }
      BOOL v6 = currentState == 3;
      goto LABEL_41;
    case 5:
      BOOL v6 = currentState == 4;
      goto LABEL_41;
    case 6:
      if (currentState == 5 || currentState == 12)
      {
LABEL_20:
        BOOL result = 1;
      }
      else
      {
        BOOL v6 = self->_hasBegunTwoStageStop && currentState == 9;
LABEL_41:
        BOOL result = v6;
      }
      break;
    case 7:
      BOOL v6 = currentState == 6 || currentState == 12;
      goto LABEL_41;
    case 8:
      if (currentState != 6) {
        goto LABEL_26;
      }
      BOOL v7 = [(PGPlaybackState *)self->_playbackState contentType] == 6;
LABEL_32:
      BOOL result = !v7;
      break;
    case 9:
    case 12:
      BOOL v6 = currentState == 6;
      goto LABEL_41;
    case 10:
      return (unint64_t)(currentState - 6) < 4;
    case 11:
      BOOL v6 = currentState == 10;
      goto LABEL_41;
    case 13:
      BOOL v7 = currentState == 14 || currentState == a3;
      goto LABEL_32;
    case 14:
      BOOL v6 = currentState == a3 || currentState == 13;
      goto LABEL_41;
    default:
LABEL_26:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)_invalidateInterruptionBeganFinishTaskAssertion
{
  interruptionBeganFinishTaskAssertion = self->_interruptionBeganFinishTaskAssertion;
  if (interruptionBeganFinishTaskAssertion)
  {
    [(PGProcessAssertion *)interruptionBeganFinishTaskAssertion invalidate];
    uint64_t v4 = self->_interruptionBeganFinishTaskAssertion;
    self->_interruptionBeganFinishTaskAssertion = 0;

    finishTaskInvalidationUUID = self->_finishTaskInvalidationUUID;
    self->_finishTaskInvalidationUUID = 0;
  }
}

- (void)_invalidateAllAssertions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PGPictureInPictureRemoteObject _invalidateAllAssertions]";
    __int16 v9 = 2048;
    BOOL v10 = self;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  [(PGProcessAssertion *)self->_startBackgroundPIPAssertion invalidate];
  startBackgroundPIPAssertion = self->_startBackgroundPIPAssertion;
  self->_startBackgroundPIPAssertion = 0;

  [(PGProcessAssertion *)self->_processAssertion invalidate];
  processAssertion = self->_processAssertion;
  self->_processAssertion = 0;

  [(PGProcessAssertion *)self->_cancelPictureInPictureFinishTaskAssertion invalidate];
  cancelPictureInPictureFinishTaskAssertion = self->_cancelPictureInPictureFinishTaskAssertion;
  self->_cancelPictureInPictureFinishTaskAssertion = 0;

  [(PGPictureInPictureRemoteObject *)self _invalidateInterruptionBeganFinishTaskAssertion];
}

- (void)_finishCleanup
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  uint64_t v4 = [(PGPictureInPictureRemoteObject *)self delegate];
  [v4 pictureInPictureRemoteObject:self willDestroyPictureInPictureViewController:self->_pictureInPictureViewController];

  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController deactivateAnalyticsSessionIfNeeded];
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setDelegate:0];
  pictureInPictureViewController = self->_pictureInPictureViewController;
  self->_pictureInPictureViewController = 0;

  [(PGPictureInPictureRemoteObject *)self _invalidateAllAssertions];
  [(PGPictureInPictureRemoteObject *)self pictureInPictureViewController:0 didTransitionToStashed:0];
}

- (id)_invalidationTimerWithTimeout:(double)a3
{
  return [(PGPictureInPictureRemoteObject *)self _invalidationTimerWithTimeout:0 block:a3];
}

- (id)_invalidationTimerWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  int v7 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PGPictureInPictureRemoteObject__invalidationTimerWithTimeout_block___block_invoke;
  v11[3] = &unk_1E610C9F8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  __int16 v9 = [v7 scheduledTimerWithTimeInterval:0 repeats:v11 block:a3];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __70__PGPictureInPictureRemoteObject__invalidationTimerWithTimeout_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained + 5);
    int v7 = PGLogCommon();
    unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v8 == 10;
      _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "Invalidation timeout fired while isStoppingOrCancelling: %{BOOL}u.", (uint8_t *)v11, 8u);
    }

    if (v8 == 10)
    {
      __int16 v9 = [v5 connection];
      [v9 invalidate];
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (BOOL)_isICSVideoCall
{
  BOOL v3 = [(PGPictureInPictureRemoteObject *)self isVideoCall];
  if (v3)
  {
    LOBYTE(v3) = [(PGPictureInPictureRemoteObject *)self _isAppICS];
  }
  return v3;
}

- (BOOL)_isAppICS
{
  uint64_t v2 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.InCallService"];

  return v3;
}

- (BOOL)_isAssociatedWithOtherObject:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (PGPictureInPictureRemoteObject *)a3;
  if (![(PGPictureInPictureRemoteObject *)self _isICSVideoCall]
    && ![(PGPictureInPictureRemoteObject *)v4 _isICSVideoCall])
  {
    BOOL v15 = 0;
    goto LABEL_24;
  }
  if ([(PGPictureInPictureRemoteObject *)self _isICSVideoCall]) {
    uint64_t v5 = self;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = [(PGPictureInPictureRemoteObject *)v5 activitySessionIdentifier];
  if ([(PGPictureInPictureRemoteObject *)self _isICSVideoCall]) {
    int v7 = v4;
  }
  else {
    int v7 = self;
  }
  unint64_t v8 = [(PGPictureInPictureRemoteObject *)v7 pictureInPictureApplication];
  __int16 v9 = [v8 bundleIdentifier];

  if ([v6 isEqualToString:v9])
  {
    uint64_t v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
      uint64_t v12 = [(PGPictureInPictureRemoteObject *)v4 pictureInPictureApplication];
      id v13 = [v12 bundleIdentifier];
      int v24 = 136316162;
      unint64_t v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      __int16 v26 = 2048;
      int v27 = self;
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2048;
      BOOL v31 = v4;
      __int16 v32 = 2114;
      v33 = v13;
      uint64_t v14 = "%s Associating %p %{public}@ with %p %{public}@ because hasMatchingSessionIdentifierAndBundleIdentifier";
LABEL_20:
      _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, 0x34u);
    }
  }
  else if ([(PGPictureInPictureRemoteObject *)self _isAppICS] {
         && [(PGPictureInPictureRemoteObject *)v4 _isAppICS])
  }
  {
    uint64_t v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
      uint64_t v12 = [(PGPictureInPictureRemoteObject *)v4 pictureInPictureApplication];
      id v13 = [v12 bundleIdentifier];
      int v24 = 136316162;
      unint64_t v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      __int16 v26 = 2048;
      int v27 = self;
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2048;
      BOOL v31 = v4;
      __int16 v32 = 2114;
      v33 = v13;
      uint64_t v14 = "%s Associating %p %{public}@ with %p %{public}@ because one of them is a video call and we always associate ICS with itself";
      goto LABEL_20;
    }
  }
  else
  {
    if (([(PGPictureInPictureRemoteObject *)v4 isEqual:self->_tetheringRemoteObject] & 1) == 0
      && ![(PGPictureInPictureRemoteObject *)v4 isEqual:self->_tetheredRemoteObject])
    {
      if ([(PGPictureInPictureRemoteObject *)v4 _isICSVideoCall])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v18 = [WeakRetained pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:self];

        if (v18)
        {
          uint64_t v10 = PGLogCommon();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          uint64_t v11 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
          uint64_t v12 = [(PGPictureInPictureRemoteObject *)v4 pictureInPictureApplication];
          id v13 = [v12 bundleIdentifier];
          int v24 = 136316162;
          unint64_t v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
          __int16 v26 = 2048;
          int v27 = self;
          __int16 v28 = 2114;
          id v29 = v11;
          __int16 v30 = 2048;
          BOOL v31 = v4;
          __int16 v32 = 2114;
          v33 = v13;
          uint64_t v14 = "%s Associating %p %{public}@ with %p %{public}@ because it has backgroundPIPAuthorization.";
          goto LABEL_20;
        }
      }
      if ([(PGPictureInPictureRemoteObject *)v4 _isICSVideoCall])
      {
        __int16 v19 = [(PGPictureInPictureRemoteObject *)v4 activitySessionIdentifier];
        if ([v19 isEqualToString:@"com.apple.InCallService"])
        {
          __int16 v20 = [(PGPictureInPictureRemoteObject *)self activitySessionIdentifier];
          id v21 = [(PGPictureInPictureRemoteObject *)self pictureInPictureApplication];
          __int16 v22 = [v21 bundleIdentifier];
          char v23 = [v20 isEqualToString:v22];

          if ((v23 & 1) == 0)
          {
            uint64_t v10 = PGLogCommon();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            uint64_t v11 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
            uint64_t v12 = [(PGPictureInPictureRemoteObject *)v4 pictureInPictureApplication];
            id v13 = [v12 bundleIdentifier];
            int v24 = 136316162;
            unint64_t v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
            __int16 v26 = 2048;
            int v27 = self;
            __int16 v28 = 2114;
            id v29 = v11;
            __int16 v30 = 2048;
            BOOL v31 = v4;
            __int16 v32 = 2114;
            v33 = v13;
            uint64_t v14 = "%s Associating %p %{public}@ with %p %{public}@ because it has an expanse-like activity session identi"
                  "fier and the facetime video call has an ICS bundle for its activity session identifier.";
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      BOOL v15 = 0;
      goto LABEL_22;
    }
    uint64_t v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
      uint64_t v12 = [(PGPictureInPictureRemoteObject *)v4 pictureInPictureApplication];
      id v13 = [v12 bundleIdentifier];
      int v24 = 136316162;
      unint64_t v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      __int16 v26 = 2048;
      int v27 = self;
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2048;
      BOOL v31 = v4;
      __int16 v32 = 2114;
      v33 = v13;
      uint64_t v14 = "%s Associating %p %{public}@ with %p %{public}@ because micropip is active between the objects";
      goto LABEL_20;
    }
  }
LABEL_21:

  BOOL v15 = 1;
LABEL_22:

LABEL_24:
  return v15;
}

- (BOOL)_isInActivitySession
{
  BSDispatchQueueAssertMain();
  int64_t v3 = [(PGPictureInPictureRemoteObject *)self contentType];
  if ([(PGPictureInPictureRemoteObject *)self contentType] == 6)
  {
    LOBYTE(v4) = 0;
  }
  else if (v3 == 5)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v5 = [(PGPictureInPictureRemoteObject *)self activitySessionIdentifier];
    uint64_t v6 = [(PGPictureInPictureRemoteObject *)self pictureInPictureApplication];
    int v7 = [v6 bundleIdentifier];
    int v4 = [v5 isEqualToString:v7] ^ 1;
  }
  return v4;
}

- (void)_invalidateForFailureToStartStopOrCancel
{
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v5 = +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", [WeakRetained processIdentifier], @"Invalidate for failure to start stop or cancel");

  objc_initWeak(&location, self);
  id v6 = objc_loadWeakRetained((id *)p_connection);
  int v7 = _PGLogMethodProem(self, 1);
  unint64_t v8 = objc_msgSend(v6, "PG_appProxyWithDebugMethodAndPointerProem:", v7);
  __int16 v9 = +[PGCommand commandForInvalidateFromProxy];
  uint64_t v10 = [v9 dictionaryRepresentation];
  [v8 handleCommand:v10];

  dispatch_time_t v11 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke;
  block[3] = &unk_1E610CA20;
  id v14 = v5;
  id v12 = v5;
  objc_copyWeak(&v15, &location);
  dispatch_after(v11, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke_2;
    block[3] = &unk_1E610C280;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained invalidate];
}

- (void)initializePictureInPictureWithControlsStyle:(int64_t)a3 preferredContentSize:(CGSize)a4 sceneIdentifier:(id)a5 affectsAppLifeCycle:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = PGLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v21 = _PGLogMethodProem(self, 1);
    v36.CGFloat width = width;
    v36.CGFloat height = height;
    __int16 v22 = NSStringFromCGSize(v36);
    *(_DWORD *)buf = 138412546;
    __int16 v32 = v21;
    __int16 v33 = 2114;
    uint64_t v34 = v22;
    _os_log_debug_impl(&dword_1B5645000, v16, OS_LOG_TYPE_DEBUG, "%@ preferredContentSize:%{public}@", buf, 0x16u);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    BOOL v17 = PGLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v18 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v18 == WeakRetained)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke;
    v23[3] = &unk_1E610CA98;
    v23[4] = self;
    id v25 = v15;
    int64_t v26 = a3;
    CGFloat v27 = width;
    CGFloat v28 = height;
    BOOL v30 = a6;
    id v24 = v14;
    SEL v29 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
  else
  {
    __int16 v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v20);
  }
}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _canTransitionToState:1];
  int64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _setCurrentState:1];
    *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 56);
    *(_OWORD *)(*(void *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 40) && !*(void *)(v4 + 48))
    {
      uint64_t v5 = [[PGPIPRemoteObjectSceneController alloc] initWithRemoteObject:*(void *)(a1 + 32) requestedSceneIdentifier:*(void *)(a1 + 40) affectsAppLifeCycle:*(unsigned __int8 *)(a1 + 88)];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = v5;

      uint64_t v4 = *(void *)(a1 + 32);
    }
    char v8 = *(unsigned char *)(v4 + 113);
    if (v8)
    {
      [*(id *)(v4 + 48) activateIfNeeded];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    [(id)v4 _setCurrentState:2];
    __int16 v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_3;
    v13[3] = &unk_1E610CA70;
    uint64_t v10 = (id *)v14;
    id v11 = *(id *)(a1 + 48);
    v13[4] = *(void *)(a1 + 32);
    v14[0] = v11;
    v14[1] = *(void *)(a1 + 80);
    char v15 = v8;
    id v12 = v13;
  }
  else
  {
    __int16 v9 = v3[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_2;
    block[3] = &unk_1E610CA48;
    uint64_t v10 = &v17;
    id v17 = *(id *)(a1 + 48);
    id v12 = block;
  }
  dispatch_async(v9, v12);
}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  int64_t v3 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  uint64_t v4 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  [v4 updatePictureInPicturePossible:*(unsigned __int8 *)(a1 + 56)];

  return BSDispatchMain();
}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:*(void *)(a1 + 32)];
}

- (void)setupStartAnimated:(BOOL)a3 hostedWindowHostingHandle:(id)a4 sceneSessionPersistentIdentifier:(id)a5 preferredContentSize:(CGSize)a6 initialInterfaceOrientation:(int64_t)a7 initialLayerFrame:(CGRect)a8 completionHandler:(id)a9
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  CGFloat v15 = a6.height;
  CGFloat v16 = a6.width;
  id v21 = a4;
  id v22 = a5;
  id v23 = a9;
  id v24 = PGLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v25 = PGLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v26 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v26 == WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke;
    block[3] = &unk_1E610CB10;
    CGFloat v33 = v16;
    CGFloat v34 = v15;
    void block[4] = self;
    SEL v35 = a2;
    id v32 = v23;
    id v30 = v22;
    BOOL v41 = a3;
    id v31 = v21;
    int64_t v36 = a7;
    CGFloat v37 = x;
    CGFloat v38 = y;
    CGFloat v39 = width;
    CGFloat v40 = height;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    CGFloat v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v23 + 2))(v23, 0, v28);
  }
}

void __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v3 = *(double *)(a1 + 64);
  double v2 = *(double *)(a1 + 72);
  if (![*(id *)(a1 + 32) _canTransitionToState:4])
  {
    uint64_t v28 = -1002;
LABEL_16:
    SEL v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:v28 userInfo:0];
    id v30 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_173;
    block[3] = &unk_1E610CAC0;
    id v31 = *(id *)(a1 + 56);
    id v42 = v29;
    id v43 = v31;
    id v32 = v29;
    dispatch_async(v30, block);

    return;
  }
  if (!PGSizeIsValid() || (PGSizeIsPositive() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
    int v5 = [WeakRetained pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:*(void *)(a1 + 32)];

    uint64_t v6 = PGLogCommon();
    int v7 = v6;
    if (!v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(double *)v44 = v3;
        *(double *)&v44[1] = v2;
        CGFloat v33 = [MEMORY[0x1E4F29238] valueWithBytes:v44 objCType:"{CGSize=dd}"];
        CGFloat v34 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
        *(_DWORD *)buf = 138543618;
        v46 = v33;
        __int16 v47 = 2112;
        v48 = v34;
        _os_log_error_impl(&dword_1B5645000, v7, OS_LOG_TYPE_ERROR, "invalid preferredContentSize %{public}@ %@", buf, 0x16u);
      }
      uint64_t v28 = -1003;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
      *(_DWORD *)buf = 138412290;
      v46 = v8;
      _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "Using default initial preferred content size due to background PIP authorization %@", buf, 0xCu);
    }
    double v3 = 16.0;
    double v2 = 9.0;
  }
  __int16 v9 = [*(id *)(a1 + 32) delegate];
  char v10 = [v9 pictureInPictureRemoteObjectShouldAcceptSetupRequest:*(void *)(a1 + 32)];

  if ((v10 & 1) == 0)
  {
    uint64_t v28 = -1007;
    goto LABEL_16;
  }
  [*(id *)(a1 + 32) _setCurrentState:4];
  id v11 = [[PGPictureInPictureViewController alloc] initWithApplication:*(void *)(*(void *)(a1 + 32) + 248) sourceSceneSessionPersistentIdentifier:*(void *)(a1 + 40) controlsStyle:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 256);
  *(void *)(v12 + 256) = v11;

  id v14 = [*(id *)(*(void *)(a1 + 32) + 256) view];
  [v14 setHidden:*(unsigned char *)(a1 + 128) == 0];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setDelegate:");
  uint64_t v15 = *(void *)(a1 + 32);
  CGFloat v16 = *(void **)(v15 + 256);
  id v17 = objc_loadWeakRetained((id *)(v15 + 264));
  [v16 setAnalyticsDelegate:v17 analyticsSourceUUID:*(void *)(*(void *)(a1 + 32) + 104)];

  [*(id *)(*(void *)(a1 + 32) + 256) notePictureInPictureStartedAutomatically:*(unsigned __int8 *)(*(void *)(a1 + 32) + 112)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setPreferredContentSize:", v3, v2);
  uint64_t v18 = *(void *)(a1 + 32);
  __int16 v19 = *(void **)(v18 + 256);
  __int16 v20 = [*(id *)(v18 + 144) dictionaryRepresentation];
  [v19 updatePlaybackStateWithDiff:v20];

  id v21 = [*(id *)(*(void *)(a1 + 32) + 256) viewModel];
  objc_msgSend(v21, "setInActivitySession:", objc_msgSend(*(id *)(a1 + 32), "_isInActivitySession"));

  [*(id *)(*(void *)(a1 + 32) + 256) pagingAccessorySetCurrentPage:*(void *)(*(void *)(a1 + 32) + 168) numberOfPages:*(void *)(*(void *)(a1 + 32) + 176)];
  id v22 = [*(id *)(a1 + 32) delegate];
  [v22 pictureInPictureRemoteObject:*(void *)(a1 + 32) didCreatePictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

  [*(id *)(*(void *)(a1 + 32) + 256) setHostedWindowHostingHandle:*(void *)(a1 + 48)];
  uint64_t v23 = *(void *)(a1 + 32);
  id v24 = *(void **)(v23 + 256);
  id v25 = [*(id *)(v23 + 48) sceneView];
  [v24 setSceneView:v25];

  [*(id *)(a1 + 32) setSourceSceneSessionPersistentIdentifier:*(void *)(a1 + 40)];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  CGFloat v37 = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_2;
  CGFloat v38 = &unk_1E610CAE8;
  uint64_t v39 = *(void *)(a1 + 32);
  id v40 = *(id *)(a1 + 56);
  uint64_t v26 = MEMORY[0x1BA99D810](&v35);
  CGFloat v27 = (void *)v26;
  if (*(unsigned char *)(a1 + 128)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "prepareStartAnimationWithInitialInterfaceOrientation:initialLayerFrame:completionHandler:", *(void *)(a1 + 88), v26, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), v35, v36, v37, v38, v39);
  }
  else {
    (*(void (**)(uint64_t))(v26 + 16))(v26);
  }
}

uint64_t __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_3;
  block[3] = &unk_1E610CA48;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startPictureInPictureAnimated:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    CGFloat v16 = "-[PGPictureInPictureRemoteObject startPictureInPictureAnimated:completionHandler:]";
    __int16 v17 = 2048;
    uint64_t v18 = self;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    char v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v9 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 == WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke;
    block[3] = &unk_1E610CB38;
    void block[4] = self;
    id v13 = v6;
    BOOL v14 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
  }
}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _canTransitionToState:5];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v3 + 113))
    {
      [(id)v3 _setCurrentState:5];
      [*(id *)(*(void *)(a1 + 32) + 48) updateInterfaceOrientation];
      uint64_t v4 = [*(id *)(a1 + 32) delegate];
      [v4 pictureInPictureRemoteObject:*(void *)(a1 + 32) willShowPictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      uint64_t v12 = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_4;
      id v13 = &unk_1E610CAE8;
      int v5 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v5;
      id v6 = (void *)MEMORY[0x1BA99D810](&v10);
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "performStartAnimated:withCompletionHandler:", *(unsigned __int8 *)(a1 + 48), v6, v10, v11, v12, v13, v14);

      int v7 = v15;
    }
    else
    {
      id v9 = *(NSObject **)(v3 + 16);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_3;
      v16[3] = &unk_1E610CA48;
      id v17 = *(id *)(a1 + 40);
      dispatch_async(v9, v16);
      int v7 = v17;
    }
  }
  else
  {
    char v8 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_2;
    block[3] = &unk_1E610CA48;
    id v19 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    int v7 = v19;
  }
}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1007 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 pictureInPictureRemoteObject:*(void *)(a1 + 32) didShowPictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

  if ([*(id *)(a1 + 32) _canTransitionToState:6]) {
    [*(id *)(a1 + 32) _setCurrentState:6];
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_5;
  v5[3] = &unk_1E610CAC0;
  id v4 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_5(uint64_t a1)
{
  return BSDispatchMain();
}

uint64_t __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 114)
    && (int v3 = [(id)result canCancelPictureInPicture], result = *(void *)(a1 + 32), v3))
  {
    uint64_t result = [(id)result cancel];
  }
  else if (*(unsigned char *)(result + 115))
  {
    uint64_t result = [(id)result pictureInPictureViewControllerDidRequestStop:*(void *)(result + 256)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 115) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 114) = 0;
  return result;
}

- (void)updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding:(CGRect)a3 withCompletionHandler:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = (void (**)(id, void, void *))a4;
  uint64_t v10 = PGLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v11 = PGLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v12 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v12 != WeakRetained)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -1001;
LABEL_14:
    id v17 = [v14 errorWithDomain:@"PGPegasusErrorDomain" code:v15 userInfo:0];
    v9[2](v9, 0, v17);

    goto LABEL_15;
  }
  if ((PGRectIsValid() & 1) == 0)
  {
    CGFloat v16 = PGLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(CGFloat *)uint64_t v26 = x;
      *(CGFloat *)&v26[1] = y;
      *(CGFloat *)&v26[2] = width;
      *(CGFloat *)&v26[3] = height;
      uint64_t v18 = [MEMORY[0x1E4F29238] valueWithBytes:v26 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      id v19 = _PGLogMethodProem(self, 1);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_error_impl(&dword_1B5645000, v16, OS_LOG_TYPE_ERROR, "invalid initialLayerFrame %{public}@ %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -1003;
    goto LABEL_14;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E610CB60;
  v20[4] = self;
  CGFloat v22 = x;
  CGFloat v23 = y;
  CGFloat v24 = width;
  CGFloat v25 = height;
  id v21 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v20);

LABEL_15:
}

void __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v1 + 320) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 336) = v2;
  int v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E610CA48;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v10 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v10 == WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke;
    block[3] = &unk_1E610C2A8;
    void block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSourceSceneSessionPersistentIdentifier:*(void *)(a1 + 40)];
  long long v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E610CA48;
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void, void *))a4;
  char v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = _PGLogMethodProem(self, 1);
    v22.double width = width;
    v22.double height = height;
    id v10 = NSStringFromCGSize(v22);
    int v17 = 138412546;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    __int16 v20 = v10;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%@ preferredContentSize:%{public}@", (uint8_t *)&v17, 0x16u);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v11 = PGLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v12 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v12 == WeakRetained)
  {
    if (!self->_queue_outstandingRotationAnimationsCount)
    {
      -[PGPictureInPictureRemoteObject _updatePreferredContentSize:withCompletionHandler:](self, "_updatePreferredContentSize:withCompletionHandler:", v7, width, height);
      goto LABEL_12;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -1002;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -1001;
  }
  CGFloat v16 = [v14 errorWithDomain:@"PGPegasusErrorDomain" code:v15 userInfo:0];
  v7[2](v7, 0, v16);

LABEL_12:
}

- (void)_updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    char v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if PGSizeIsValid() && (PGSizeIsPositive())
  {
    if (self->_currentState == 6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke;
      block[3] = &unk_1E610CB88;
      void block[4] = self;
      CGFloat v20 = width;
      CGFloat v21 = height;
      id v19 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v9 = v19;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_3;
      v14[3] = &unk_1E610CB88;
      v14[4] = self;
      CGFloat v16 = width;
      CGFloat v17 = height;
      id v15 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v14);
      id v9 = v15;
    }
  }
  else
  {
    id v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(CGFloat *)CGSize v22 = width;
      *(CGFloat *)&v22[1] = height;
      id v12 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGSize=dd}"];
      id v13 = _PGLogMethodProem(self, 1);
      *(_DWORD *)buf = 138543618;
      CGFloat v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_error_impl(&dword_1B5645000, v10, OS_LOG_TYPE_ERROR, "invalid preferredContentSize %{public}@ %@", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1003 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setPreferredContentSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  long long v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E610CA48;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 48);
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E610CA48;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkActivePictureInPictureCancellationPolicyWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *, uint64_t, uint64_t))a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 != WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -1001;
LABEL_12:
    uint64_t v11 = [v9 errorWithDomain:@"PGPegasusErrorDomain" code:v10 userInfo:0];
    v4[2](v4, 0, v11, 1, 1);

    goto LABEL_13;
  }
  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -1002;
    goto LABEL_12;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PGPictureInPictureRemoteObject_checkActivePictureInPictureCancellationPolicyWithCompletion___block_invoke;
  v12[3] = &unk_1E610CAE8;
  v12[4] = self;
  id v13 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v12);

LABEL_13:
}

uint64_t __94__PGPictureInPictureRemoteObject_checkActivePictureInPictureCancellationPolicyWithCompletion___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) delegate];
  [v2 pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 pictureInPictureRemoteObjectShouldUpdateCancellationPolicyOnStart:*(void *)(a1 + 32)];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    char v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v9 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 != WeakRetained)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = -1001;
LABEL_12:
    id v13 = [v11 errorWithDomain:@"PGPegasusErrorDomain" code:v12 userInfo:0];
    (*((void (**)(id, void, void *, void))v6 + 2))(v6, 0, v13, 0);

    goto LABEL_13;
  }
  if (self->_currentState != 6)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = -1002;
    goto LABEL_12;
  }
  ++self->_queue_outstandingRotationAnimationsCount;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke;
  block[3] = &unk_1E610C960;
  void block[4] = self;
  int64_t v16 = a3;
  id v15 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_13:
}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(void **)(v1 + 256);
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E610C960;
  v4[4] = v1;
  uint64_t v6 = v3;
  id v5 = *(id *)(a1 + 40);
  [v2 performRotateAnimationWithRotation:v3 completionHandler:v4];
}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_2(void *a1)
{
  long long v2 = (void *)MEMORY[0x1BA99D5F0]();
  uint64_t v3 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  uint64_t v4 = a1[4];
  id v5 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E610CBD8;
  uint64_t v6 = (void *)a1[5];
  uint64_t v11 = a1[6];
  v8[4] = v4;
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  long long v2 = *(double **)(a1 + 32);
  if (*(void *)(a1 + 56) > 1uLL)
  {
    --*((void *)v2 + 3);
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
  else
  {
    double v4 = v2[38];
    double v3 = v2[39];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_4;
    v6[3] = &unk_1E610CBB0;
    void v6[4] = v2;
    id v8 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_updatePreferredContentSize:withCompletionHandler:", v6, v3, v4);
  }
}

uint64_t __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, 0, a1[5]);
}

- (void)setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v11 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v11 == WeakRetained)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke;
    v21[3] = &unk_1E610CB38;
    v21[4] = self;
    id v14 = v8;
    id v22 = v14;
    BOOL v23 = a4;
    id v15 = (void *)MEMORY[0x1BA99D810](v21);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_7;
    block[3] = &unk_1E610CC28;
    void block[4] = self;
    BOOL v20 = a3;
    id v18 = v14;
    id v19 = v15;
    id v16 = v15;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke(uint64_t a1)
{
  long long v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_2;
  block[3] = &unk_1E610C8E8;
  id v3 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_3;
  v5[3] = &unk_1E610C1C8;
  id v6 = *(id *)(a1 + 40);
  long long v2 = (void (**)(void, void, void))MEMORY[0x1BA99D810](v5);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 48))
  {
    double v4 = v2;
    BSDispatchMain();
  }
  else
  {
    v2[2](v2, 1, 0);
  }
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1005 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 sourceSceneSessionPersistentIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_5;
  v6[3] = &unk_1E610CC00;
  id v5 = *(id *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 pictureInPictureRemoteObject:v3 requestActivationOfSceneWithPersistenceIdentier:v4 completion:v6];
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = [WeakRetained processIdentifier];
    id v6 = *(void **)(*(void *)(a1 + 32) + 288);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_6;
    v7[3] = &unk_1E610C1C8;
    id v8 = *(id *)(a1 + 40);
    PGActivateApplication(v5, v6, v7);
  }
}

uint64_t __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_7(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _canTransitionToState:10];
  id v3 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    id v6 = v3[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_8;
    block[3] = &unk_1E610CA48;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    uint64_t v5 = v11;
    goto LABEL_5;
  }
  [v3 _setCurrentState:10];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 256);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_9;
    v8[3] = &unk_1E610CA48;
    id v9 = *(id *)(a1 + 48);
    [v4 prepareStopAnimationWithCompletionHandler:v8];
    uint64_t v5 = v9;
LABEL_5:

    return;
  }
  id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v7();
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopPictureInPictureAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = PGLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[PGPictureInPictureRemoteObject stopPictureInPictureAnimated:withFinalInterfaceOrientation:finalLayerFrame:co"
          "mpletionHandler:]";
    __int16 v29 = 2048;
    id v30 = self;
    _os_log_impl(&dword_1B5645000, v14, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v15 = PGLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v16 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v16 == WeakRetained)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
    v19[3] = &unk_1E610CC50;
    v19[4] = self;
    id v20 = v13;
    CGFloat v21 = x;
    CGFloat v22 = y;
    CGFloat v23 = width;
    CGFloat v24 = height;
    BOOL v26 = a3;
    int64_t v25 = a4;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0, v18, 0);
  }
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _canTransitionToState:11];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _setCurrentState:11];
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    [v4 pictureInPictureRemoteObject:*(void *)(a1 + 32) willHidePictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
    v9[3] = &unk_1E610CAE8;
    uint64_t v5 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v6 = (void *)MEMORY[0x1BA99D810](v9);
    [*(id *)(a1 + 32) _stopTethering];
    [*(id *)(*(void *)(a1 + 32) + 256) notePictureInPictureWillStopForAppRequest:1 preferredFullScreenRestore:!CGRectIsNull(*(CGRect *)(a1 + 48))];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 80), v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

    id v7 = v10;
  }
  else
  {
    id v8 = v3[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
    block[3] = &unk_1E610CA48;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    id v7 = v12;
  }
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 pictureInPictureRemoteObject:*(void *)(a1 + 32) didHidePictureInPictureViewController:*(void *)(*(void *)(a1 + 32) + 256)];

  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4;
  block[3] = &unk_1E610CA48;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_5;
  block[3] = &unk_1E610CA48;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanupWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 != WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -1001;
LABEL_12:
    id v11 = [v9 errorWithDomain:@"PGPegasusErrorDomain" code:v10 userInfo:0];
    v4[2](v4, 0, v11);

    goto LABEL_13;
  }
  if (self->_currentState != 11)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -1002;
    goto LABEL_12;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E610CAE8;
  v12[4] = self;
  id v13 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v12);

LABEL_13:
}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) setHostedWindowHostingHandle:0];
  [*(id *)(*(void *)(a1 + 32) + 256) setSceneView:0];
  [*(id *)(a1 + 32) _setCurrentState:2];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E610CAC0;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E610C280;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _finishCleanup];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:*(void *)(a1 + 32)];
}

- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (self->_pictureInPictureShouldStartWhenEnteringBackground != v4)
  {
    id v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      id v13 = "-[PGPictureInPictureRemoteObject setPictureInPictureShouldStartWhenEnteringBackground:completionHandler:]";
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v12, 0x1Cu);
    }
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v9 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 == WeakRetained)
  {
    self->_BOOL pictureInPictureShouldStartWhenEnteringBackground = v4;
    v6[2](v6, 1, 0);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1001 userInfo:0];
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v11);
  }
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v12 = "-[PGPictureInPictureRemoteObject updatePlaybackStateWithDiff:]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 == WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__PGPictureInPictureRemoteObject_updatePlaybackStateWithDiff___block_invoke;
    v9[3] = &unk_1E610C258;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __62__PGPictureInPictureRemoteObject_updatePlaybackStateWithDiff___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) contentType];
  id v3 = *(void **)(*(void *)(a1 + 32) + 144);
  if (v3)
  {
    [v3 updatePlaybackStateWithDiff:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = [[PGPlaybackState alloc] initWithDictionary:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v4;
  }
  [*(id *)(*(void *)(a1 + 32) + 256) updatePlaybackStateWithDiff:*(void *)(a1 + 40)];
  BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 144) backgroundAudioPolicy] == 1
    || [*(id *)(*(void *)(a1 + 32) + 144) backgroundAudioPolicy] == 3;
  if (v7 != [*(id *)(*(void *)(a1 + 32) + 152) isExemptFromUILockInterruptionsWhenActive])
  {
    [*(id *)(*(void *)(a1 + 32) + 152) setExemptFromUILockInterruptionsWhenActive:v7];
    [*(id *)(a1 + 32) _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
  }
  if (v2 != [*(id *)(*(void *)(a1 + 32) + 144) contentType])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
    [WeakRetained pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:*(void *)(a1 + 32)];
  }
}

- (void)updateMenuItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureRemoteObject updateMenuItems:]();
    }
  }
  BOOL v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[PGPictureInPictureRemoteObject updateMenuItems:]";
    __int16 v20 = 2048;
    CGFloat v21 = self;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  BOOL v10 = v8 == WeakRetained;

  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke;
    v16[3] = &unk_1E610CCA0;
    objc_copyWeak(v17, (id *)buf);
    void v16[4] = self;
    v17[1] = (id)a2;
    id v11 = objc_msgSend(v5, "bs_map:", v16);
    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    int v13 = objc_msgSend(v12, "PG_hasMenuItemProviderEntitlement");

    if (v13)
    {
      id v15 = v11;
      BSDispatchMain();
    }
    else
    {
      __int16 v14 = PGLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PGPictureInPictureRemoteObject updateMenuItems:](v14);
      }
    }
    objc_destroyWeak(v17);
  }
  objc_destroyWeak((id *)buf);
}

PGMenuItem *__50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PGMenuItem alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_2;
  v8[3] = &unk_1E610CC78;
  objc_copyWeak(v9, (id *)(a1 + 40));
  id v5 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  v9[1] = v5;
  id v6 = [(PGMenuItem *)v4 initWithDictionary:v3 action:v8];
  objc_destroyWeak(v9);

  return v6;
}

void __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_3;
    v8[3] = &unk_1E610C7A8;
    uint64_t v7 = *(void *)(a1 + 32);
    void v8[4] = WeakRetained;
    void v8[5] = v7;
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = v3;
    dispatch_async(v6, v8);
  }
}

void __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 40), 1);
  id v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  id v4 = +[PGCommand commandForMenuItemSelected:](PGCommand, "commandForMenuItemSelected:", [*(id *)(a1 + 48) identifier]);
  id v5 = [v4 dictionaryRepresentation];
  [v3 handleCommand:v5];
}

uint64_t __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = v2;

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 256);

  return [v6 setMenuItems:v5];
}

- (void)setActivitySessionIdentifier:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v6 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v6 == WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PGPictureInPictureRemoteObject_setActivitySessionIdentifier___block_invoke;
    v8[3] = &unk_1E610C258;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __63__PGPictureInPictureRemoteObject_setActivitySessionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 248) bundleIdentifier];
  }
  id v4 = v3;
  uint64_t v5 = [*(id *)(a1 + 40) activitySessionIdentifier];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = [v8 activitySessionIdentifier];
      int v20 = 136315906;
      CGFloat v21 = "-[PGPictureInPictureRemoteObject setActivitySessionIdentifier:]_block_invoke";
      __int16 v22 = 2048;
      id v23 = v8;
      __int16 v24 = 2114;
      int64_t v25 = v4;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v20, 0x2Au);
    }
    uint64_t v10 = [v4 copy];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 128);
    *(void *)(v11 + 128) = v10;

    uint64_t v13 = *(void *)(a1 + 40);
    __int16 v14 = *(void **)(v13 + 232);
    *(void *)(v13 + 232) = 0;

    if ([*(id *)(a1 + 40) currentState] == 6)
    {
      uint64_t v15 = [v4 copy];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void **)(v16 + 232);
      *(void *)(v16 + 232) = v15;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 240));
    [WeakRetained pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:*(void *)(a1 + 40)];

    id v19 = [*(id *)(*(void *)(a1 + 40) + 256) viewModel];
    objc_msgSend(v19, "setInActivitySession:", objc_msgSend(*(id *)(a1 + 40), "_isInActivitySession"));
  }
}

- (void)setExemptAttributionOverride:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  id v6 = [MEMORY[0x1E4F29268] currentConnection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v6 == WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PGPictureInPictureRemoteObject_setExemptAttributionOverride___block_invoke;
    v8[3] = &unk_1E610C258;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __63__PGPictureInPictureRemoteObject_setExemptAttributionOverride___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;

  uint64_t v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v10 = 136315394;
    uint64_t v11 = "-[PGPictureInPictureRemoteObject setExemptAttributionOverride:]_block_invoke";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 136);
  if (!v8) {
    uint64_t v8 = *(void *)(v7 + 296);
  }
  [*(id *)(v7 + 152) setExemptAttribution:v8];
  return [*(id *)(a1 + 32) _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
}

- (void)stopPictureInPictureAndRestoreUserInterface
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PGPictureInPictureApplication *)self->_pictureInPictureApplication bundleIdentifier];
    *(_DWORD *)buf = 136315650;
    uint64_t v6 = "-[PGPictureInPictureRemoteObject stopPictureInPictureAndRestoreUserInterface]";
    __int16 v7 = 2048;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  if ([(PGPictureInPictureRemoteObject *)self _isAppICS]) {
    BSDispatchMain();
  }
}

uint64_t __77__PGPictureInPictureRemoteObject_stopPictureInPictureAndRestoreUserInterface__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pictureInPictureViewControllerDidRequestStop:*(void *)(*(void *)(a1 + 32) + 256)];
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PGPictureInPictureRemoteObject_pagingAccessorySetCurrentPage_numberOfPages___block_invoke;
  block[3] = &unk_1E610C9A8;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PGPictureInPictureRemoteObject_pagingAccessorySetCurrentPage_numberOfPages___block_invoke(void *a1)
{
  *(void *)(a1[4] + 168) = a1[5];
  *(void *)(a1[4] + 176) = a1[6];
  return [*(id *)(a1[4] + 256) pagingAccessorySetCurrentPage:a1[5] numberOfPages:a1[6]];
}

- (void)setExemptAttribution:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  BSDispatchQueueAssertMain();
  exemptAttribution = self->_exemptAttribution;
  if (exemptAttribution != v4 && ![(NSString *)exemptAttribution isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    __int16 v7 = self->_exemptAttribution;
    self->_exemptAttribution = v6;

    if (!self->_exemptAttributionOverride)
    {
      uint64_t v8 = PGLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        int v10 = "-[PGPictureInPictureRemoteObject setExemptAttribution:]";
        __int16 v11 = 2114;
        __int16 v12 = self;
        _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v9, 0x16u);
      }

      [(PGInterruptionAssistant *)self->_interruptionAssistant setExemptAttribution:v4];
      [(PGPictureInPictureRemoteObject *)self _updateActiveProxyAndViewControllerOfInterruptionIfNeeded];
    }
  }
}

- (void)_updateActiveProxyAndViewControllerOfInterruptionIfNeeded
{
  BSDispatchQueueAssertMain();
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setInterrupted:[(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted]];
  [(PGPictureInPictureRemoteObject *)self _acquireOrInvalidateProcessAssertionIfNeeded];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PGPictureInPictureRemoteObject__updateActiveProxyAndViewControllerOfInterruptionIfNeeded__block_invoke;
  block[3] = &unk_1E610C280;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__PGPictureInPictureRemoteObject__updateActiveProxyAndViewControllerOfInterruptionIfNeeded__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 152) shouldNotifyProxyOfInterruptionBegan];
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    return objc_msgSend(v3, "_queue_notifyProxyOfInterruptionBegan");
  }
  else
  {
    uint64_t result = [v3[19] shouldNotifyProxyOfInterruptionEnded];
    if (result)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      return objc_msgSend(v5, "_queue_notifyProxyOfInterruptionEnded");
    }
  }
  return result;
}

- (BOOL)_currentStateAllowsProcessAssertion
{
  BSDispatchQueueAssertMain();
  unint64_t currentState = self->_currentState;
  if (currentState > 0xD) {
    return 0;
  }
  if (((1 << currentState) & 0x2F80) != 0) {
    return self->_processAssertion != 0;
  }
  return ((1 << currentState) & 0x78) != 0;
}

- (BOOL)_wantsProcessAssertion
{
  BSDispatchQueueAssertMain();
  BOOL v3 = [(PGPictureInPictureRemoteObject *)self _currentStateAllowsProcessAssertion];
  if (v3)
  {
    BOOL v4 = [(PGInterruptionAssistant *)self->_interruptionAssistant isInterrupted];
    BOOL v5 = [(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1];
    LOBYTE(v3) = !v5;
    if (!v5 && v4)
    {
      LOBYTE(v3) = [(PGPictureInPictureRemoteObject *)self isVideoCall];
    }
  }
  return v3;
}

- (void)_acquireOrInvalidateProcessAssertionIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL v3 = [(PGPictureInPictureRemoteObject *)self _wantsProcessAssertion];
  processAssertion = self->_processAssertion;
  if (v3)
  {
    if (processAssertion) {
      return;
    }
    BOOL v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[PGPictureInPictureRemoteObject _acquireOrInvalidateProcessAssertionIfNeeded]";
      __int16 v25 = 2048;
      __int16 v26 = self;
      _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %p Acquiring process assertion", buf, 0x16u);
    }

    [(PGPictureInPictureRemoteObject *)self _invalidateInterruptionBeganFinishTaskAssertion];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion pipVisibleAssertionForProcessWithIdentifier:explanation:legacy:](PGProcessAssertion, "pipVisibleAssertionForProcessWithIdentifier:explanation:legacy:", [WeakRetained processIdentifier], @"PIP Visible Assertion", self->_sceneControllerIfExists == 0);
    __int16 v7 = (PGProcessAssertion *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_processAssertion;
    self->_processAssertion = v7;

    [(PGPIPRemoteObjectSceneController *)self->_sceneControllerIfExists setForeground:1];
    [(PGProcessAssertion *)self->_startBackgroundPIPAssertion invalidate];
    startBackgroundPIPAssertion = self->_startBackgroundPIPAssertion;
    self->_startBackgroundPIPAssertion = 0;
  }
  else
  {
    if (!processAssertion) {
      return;
    }
    int v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[PGPictureInPictureRemoteObject _acquireOrInvalidateProcessAssertionIfNeeded]";
      __int16 v25 = 2048;
      __int16 v26 = self;
      _os_log_impl(&dword_1B5645000, v10, OS_LOG_TYPE_DEFAULT, "%s %p Invalidating process assertion", buf, 0x16u);
    }

    [(PGPictureInPictureRemoteObject *)self _invalidateInterruptionBeganFinishTaskAssertion];
    id v11 = objc_alloc_init(MEMORY[0x1E4F29128]);
    objc_storeStrong((id *)&self->_finishTaskInvalidationUUID, v11);
    id v12 = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", [v12 processIdentifier], @"interruption began assertion");
    uint64_t v13 = (PGProcessAssertion *)objc_claimAutoreleasedReturnValue();
    interruptionBeganFinishTaskAssertion = self->_interruptionBeganFinishTaskAssertion;
    self->_interruptionBeganFinishTaskAssertion = v13;

    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __78__PGPictureInPictureRemoteObject__acquireOrInvalidateProcessAssertionIfNeeded__block_invoke;
    int v20 = &unk_1E610C258;
    id v21 = v11;
    __int16 v22 = self;
    startBackgroundPIPAssertion = (PGProcessAssertion *)v11;
    dispatch_after(v15, MEMORY[0x1E4F14428], &v17);
    [(PGProcessAssertion *)self->_processAssertion invalidate];
    uint64_t v16 = self->_processAssertion;
    self->_processAssertion = 0;

    [(PGPIPRemoteObjectSceneController *)self->_sceneControllerIfExists setForeground:0];
  }
}

void *__78__PGPictureInPictureRemoteObject__acquireOrInvalidateProcessAssertionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[11]) {
    return (void *)[result _invalidateInterruptionBeganFinishTaskAssertion];
  }
  return result;
}

- (void)_queue_notifyProxyOfInterruptionBegan
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PGInterruptionAssistant *)self->_interruptionAssistant noteDidNotifyProxyOfInterruptionBegan];
  BOOL v3 = +[PGCommand commandForBeginInterruption];
  BOOL v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int v10 = self;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "remote object %p notifying proxy of pictureInPictureInterruptionBegan", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  uint64_t v6 = _PGLogMethodProem(self, 1);
  __int16 v7 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v6);
  uint64_t v8 = [v3 dictionaryRepresentation];
  [v7 handleCommand:v8];
}

- (void)_queue_notifyProxyOfInterruptionEnded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PGInterruptionAssistant *)self->_interruptionAssistant allowsResumingAfterInterruptionEnds];
  [(PGInterruptionAssistant *)self->_interruptionAssistant noteDidNotifyProxyOfInterruptionEnded];
  BOOL v4 = +[PGCommand commandForEndInterruptionWithShouldResumeSuggestion:v3];
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    uint64_t v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "remote object %p notifying proxy of pictureInPictureInterruptionEnded shouldResumeSuggestion %{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  __int16 v7 = _PGLogMethodProem(self, 1);
  uint64_t v8 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v7);
  int v9 = [v4 dictionaryRepresentation];
  [v8 handleCommand:v9];
}

- (void)handleCommand:(id)a3
{
}

- (void)pictureInPictureViewController:(id)a3 updateHostedWindowSize:(CGSize)a4 animationType:(int64_t)a5 initialSpringVelocity:(double)a6
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  BOOL v13 = PGLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = PGLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  sceneControllerIfExists = self->_sceneControllerIfExists;
  if (sceneControllerIfExists)
  {
    -[PGPIPRemoteObjectSceneController updateSize:animationType:initialSpringVelocity:](sceneControllerIfExists, "updateSize:animationType:initialSpringVelocity:", a5, width, height, a6);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1BA99D5F0]();
    uint64_t v17 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __124__PGPictureInPictureRemoteObject_pictureInPictureViewController_updateHostedWindowSize_animationType_initialSpringVelocity___block_invoke;
    block[3] = &unk_1E610CCC8;
    id v21 = v17;
    SEL v22 = a2;
    double v23 = width;
    double v24 = height;
    int64_t v25 = a5;
    double v26 = a6;
    void block[4] = self;
    id v19 = v17;
    dispatch_async(queue, block);
  }
}

void __124__PGPictureInPictureRemoteObject_pictureInPictureViewController_updateHostedWindowSize_animationType_initialSpringVelocity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  objc_msgSend(v3, "updateHostedWindowSize:animationType:initialSpringVelocity:synchronizationFence:", *(void *)(a1 + 72), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 80));
}

- (void)pictureInPictureViewControllerHostedWindowSizeChangeBegan:(id)a3
{
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeBegan___block_invoke;
  v8[3] = &unk_1E610C5C0;
  void v8[4] = self;
  void v8[5] = a2;
  dispatch_async(queue, v8);
}

void __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeBegan___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 hostedWindowSizeChangeBegan];
}

- (void)pictureInPictureViewControllerHostedWindowSizeChangeEnded:(id)a3
{
  BOOL v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeEnded___block_invoke;
  v8[3] = &unk_1E610C5C0;
  void v8[4] = self;
  void v8[5] = a2;
  dispatch_async(queue, v8);
}

void __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeEnded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 hostedWindowSizeChangeEnded];
}

- (void)pictureInPictureViewControllerDidRequestStop:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PGPictureInPictureRemoteObject *)self canStopPictureInPicture];
  uint64_t v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestStop:]";
    __int16 v12 = 2048;
    BOOL v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p canStop: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
  }

  if (v5)
  {
    self->_hasPendingStopRequest = 0;
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController notePictureInPictureWillStopForAppRequest:0 preferredFullScreenRestore:1];
    __int16 v7 = [(PGPictureInPictureRemoteObject *)self delegate];
    uint64_t v8 = [(PGPictureInPictureRemoteObject *)self sourceSceneSessionPersistentIdentifier];
    [v7 pictureInPictureRemoteObject:self didRequestPictureInPictureStopForViewController:v4 sourceSceneSessionIdentifier:v8 animated:1];
  }
  else
  {
    BOOL v9 = !self->_hasPendingCancellationRequest
      && [(PGPictureInPictureRemoteObject *)self isStartingPictureInPicture];
    self->_hasPendingStopRequest = v9;
  }
}

- (void)pictureInPictureViewController:(id)a3 didReceiveCommand:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureRemoteObject dealloc]();
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  switch([v8 systemAction])
  {
    case 0:
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke;
      block[3] = &unk_1E610CCF0;
      void block[4] = self;
      SEL v16 = a2;
      id v15 = v8;
      dispatch_async(queue, block);

      break;
    case 1:
      __int16 v12 = self->_queue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke_2;
      v13[3] = &unk_1E610C5C0;
      v13[4] = self;
      void v13[5] = a2;
      dispatch_async(v12, v13);
      break;
    case 2:
      [(PGPictureInPictureRemoteObject *)self _stopTethering];
      [(PGPictureInPictureRemoteObject *)self pictureInPictureViewControllerDidRequestStop:v7];
      break;
    case 3:
      [(PGPictureInPictureRemoteObject *)self _stopTethering];
      [(PGPictureInPictureRemoteObject *)self pictureInPictureViewControllerDidRequestCancel:v7];
      break;
    default:
      break;
  }
}

void __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  id v4 = [*(id *)(a1 + 40) dictionaryRepresentation];
  [v3 handleCommand:v4];
}

void __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 actionButtonTapped];
}

- (void)pictureInPictureViewControllerDidRequestCancel:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v4 = PGLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  BOOL v5 = [(PGPictureInPictureRemoteObject *)self canCancelPictureInPicture];
  uint64_t v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "-[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestCancel:]";
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p canCancel: %{BOOL}u", (uint8_t *)&v7, 0x1Cu);
  }

  if (v5) {
    [(PGPictureInPictureRemoteObject *)self cancel];
  }
}

- (void)pictureInPictureViewController:(id)a3 didTransitionToStashed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = _PGLogMethodProem(self, 1);
    *(_DWORD *)buf = 138543874;
    SEL v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    __int16 v19 = 1024;
    BOOL v20 = [(PGPictureInPictureRemoteObject *)self _isUnderLock];
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setStashed:%{BOOL}u [self _isUnderLock]:%{BOOL}u", buf, 0x18u);
  }
  self->_stashed = v4;
  if (v4)
  {
    [(PGPictureInPictureRemoteObject *)self _notifyProxyOfStashedOrUnderLock:1];
    if ([(PGPlaybackState *)self->_playbackState backgroundAudioPolicy] == 2
      && !self->_considerStashedPlaybackAsBackgroundAudioTimer)
    {
      objc_initWeak((id *)buf, self);
      __int16 v9 = (void *)MEMORY[0x1E4F1CB00];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __88__PGPictureInPictureRemoteObject_pictureInPictureViewController_didTransitionToStashed___block_invoke;
      v13[3] = &unk_1E610C6E0;
      objc_copyWeak(&v14, (id *)buf);
      int v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:v13 block:30.0];
      considerStashedPlaybackAsBackgroundAudioTimer = self->_considerStashedPlaybackAsBackgroundAudioTimer;
      self->_considerStashedPlaybackAsBackgroundAudioTimer = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    [(PGPictureInPictureRemoteObject *)self _notifyProxyOfStashedOrUnderLock:[(PGPictureInPictureRemoteObject *)self _isUnderLock]];
    [(NSTimer *)self->_considerStashedPlaybackAsBackgroundAudioTimer invalidate];
    BOOL v12 = self->_considerStashedPlaybackAsBackgroundAudioTimer;
    self->_considerStashedPlaybackAsBackgroundAudioTimer = 0;

    [(PGPictureInPictureRemoteObject *)self pictureInPictureInterruptionEndedWithReason:3 attribution:0];
  }
}

void __88__PGPictureInPictureRemoteObject_pictureInPictureViewController_didTransitionToStashed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained pictureInPictureInterruptionBeganWithReason:3 attribution:0];
    id WeakRetained = v2;
  }
}

- (BOOL)pictureInPictureViewControllerShouldHideTetheredViewControllerAlongsideControls:(id)a3
{
  tetheredRemoteObject = self->_tetheredRemoteObject;
  return tetheredRemoteObject
      && [(PGInterruptionAssistant *)tetheredRemoteObject->_interruptionAssistant hasInterruptionReason:4];
}

- (BOOL)canPreventOrSuspendRemoteObject:(id)a3
{
  id v4 = a3;
  if ([(PGPictureInPictureRemoteObject *)self _isICSVideoCall]
    && [v4 isVideoCall])
  {
    int v5 = [v4 _isAppICS] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PGPictureInPictureRemoteObject_pagingSkipByNumberOfPages___block_invoke;
  block[3] = &unk_1E610C9A8;
  void block[4] = self;
  void block[5] = a2;
  void block[6] = a3;
  dispatch_async(queue, block);
}

void __60__PGPictureInPictureRemoteObject_pagingSkipByNumberOfPages___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v2 = _PGLogMethodProem(*(void **)(a1 + 32), 1);
  BOOL v3 = objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  [v3 pagingSkipByNumberOfPages:*(void *)(a1 + 48)];
}

- (PGPictureInPictureApplication)pictureInPictureApplication
{
  return self->_pictureInPictureApplication;
}

- (PGPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (PGPictureInPictureRemoteObjectDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGPictureInPictureRemoteObjectDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (PGPictureInPictureAnalyticsDelegate *)WeakRetained;
}

- (PGPictureInPictureRemoteObject)tetheredRemoteObject
{
  return self->_tetheredRemoteObject;
}

- (void)setTetheredRemoteObject:(id)a3
{
}

- (PGPictureInPictureRemoteObject)tetheringRemoteObject
{
  return self->_tetheringRemoteObject;
}

- (void)setTetheringRemoteObject:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (CGRect)initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding
{
  double x = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.origin.x;
  double y = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.origin.y;
  double width = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.size.width;
  double height = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)sourceSceneSessionPersistentIdentifier
{
  return self->_sourceSceneSessionPersistentIdentifier;
}

- (NSString)exemptAttribution
{
  return self->_exemptAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exemptAttribution, 0);
  objc_storeStrong((id *)&self->_sourceSceneSessionPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_tetheringRemoteObject, 0);
  objc_storeStrong((id *)&self->_tetheredRemoteObject, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_pictureInPictureApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitySessionIdentifierForLastActivePIPSession, 0);
  objc_destroyWeak((id *)&self->_sourceScene);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_considerStashedPlaybackAsBackgroundAudioTimer, 0);
  objc_storeStrong((id *)&self->_interruptionAssistant, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_exemptAttributionOverride, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_analyticsSourceUUID, 0);
  objc_storeStrong((id *)&self->_timerForInvalidatingIfStopOrCancelFails, 0);
  objc_storeStrong((id *)&self->_finishTaskInvalidationUUID, 0);
  objc_storeStrong((id *)&self->_cancelPictureInPictureFinishTaskAssertion, 0);
  objc_storeStrong((id *)&self->_interruptionBeganFinishTaskAssertion, 0);
  objc_storeStrong((id *)&self->_startBackgroundPIPAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_sceneControllerIfExists, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_connection);
}

- (void)initWithConnection:interruptionAssistant:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = _PGLogMethodProem(v0, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

- (void)endTwoStageStopPictureInPictureWithCompletionBlock:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B5645000, log, OS_LOG_TYPE_DEBUG, "Called endTwoStageStopPictureInPictureWithCompletionBlock on object that hasn't begun.", v1, 2u);
}

- (void)updateMenuItems:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B5645000, log, OS_LOG_TYPE_ERROR, "*** WARNING: Updating menu without the proper entitlement has no effect. ***", v1, 2u);
}

- (void)updateMenuItems:.cold.2()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = _PGLogMethodProem(v0, 0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@ may not be invoked on the main thread!", v4, v5, v6, v7, v8);
}

@end