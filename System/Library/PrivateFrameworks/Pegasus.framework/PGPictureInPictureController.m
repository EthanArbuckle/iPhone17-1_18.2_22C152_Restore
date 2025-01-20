@interface PGPictureInPictureController
+ (BOOL)isPictureInPictureSupported;
- (BOOL)_hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP;
- (BOOL)backgroundPIPService:(id)a3 canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:(id)a4 appBundleIdentifier:(id)a5;
- (BOOL)isPictureInPictureActive;
- (BOOL)isStartingStoppingOrCancellingPictureInPicture;
- (BOOL)isStoppingOrCancellingPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4;
- (BOOL)pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:(id)a3;
- (BOOL)pictureInPictureRemoteObjectShouldAcceptSetupRequest:(id)a3;
- (BOOL)pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart:(id)a3;
- (BOOL)pictureInPictureRemoteObjectShouldUpdateCancellationPolicyOnStart:(id)a3;
- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3;
- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3;
- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (CGSize)preferredContentSizeForActivePictureInPictureWithApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (CGSize)preferredContentSizeForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3;
- (CGSize)preferredContentSizeForInteractivelyEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (NSDictionary)activeSceneSessionIdentifiersByApplication;
- (NSSet)activePictureInPictureApplications;
- (NSSet)activePictureInPictureApplicationsStoppingOrCancelling;
- (NSSet)pictureInPictureApplications;
- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate;
- (PGPictureInPictureApplication)activePictureInPictureApplication;
- (PGPictureInPictureController)init;
- (PGPictureInPictureControllerDelegate)delegate;
- (id)_continuityCameraInterruptionExemption;
- (id)_faceTimeVideoCallInterruptionExemption;
- (id)_faceTimeVideoCallRemoteObject;
- (id)_pictureInPictureRemoteObjects;
- (id)_remoteObjectForPictureInPictureApplication:(id)a3 passingTest:(id)a4 error:(id *)a5;
- (id)_remoteObjectForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5;
- (id)_remoteObjectForTestApplicationWithBundleIdentifier:(id)a3;
- (id)_remoteObjectThatCanCancelPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5;
- (id)_remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:(id)a3 error:(id *)a4;
- (id)_remoteObjectThatCanStopPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5;
- (id)_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5;
- (id)_remoteObjectsForPictureInPictureApplication:(id)a3;
- (id)existingPictureInPictureApplicationForBundleIdentifier:(id)a3;
- (id)pictureInPictureRemoteObjectInterruptionAssistant:(id)a3;
- (id)suspendedPictureInPictureApplication;
- (int64_t)contentTypePictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (int64_t)tetheringModeForSceneSessionPersistentIdentifier:(id)a3;
- (void)_addRemoteObject:(id)a3;
- (void)_removeRemoteObject:(id)a3;
- (void)_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions;
- (void)activateBackgroundPIPAuthorizationService;
- (void)backgroundPIPService:(id)a3 didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4;
- (void)backgroundPIPService:(id)a3 didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4;
- (void)beginTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 byRestoringUserInterfaceWithCompletionHandler:(id)a6;
- (void)cancelPictureInPictureForApplication:(id)a3;
- (void)cancelPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4;
- (void)dealloc;
- (void)endTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)init;
- (void)pagingSkipByNumberOfPages:(int64_t)a3 application:(id)a4;
- (void)pictureInPictureInterruptionBegan;
- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3;
- (void)pictureInPictureInterruptionEnded;
- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3;
- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 didCreatePictureInPictureViewController:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 didHidePictureInPictureViewController:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 didRequestPictureInPictureStopForViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6;
- (void)pictureInPictureRemoteObject:(id)a3 didShowPictureInPictureViewController:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 completion:(id)a5;
- (void)pictureInPictureRemoteObject:(id)a3 willDestroyPictureInPictureViewController:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 willHidePictureInPictureViewController:(id)a4;
- (void)pictureInPictureRemoteObject:(id)a3 willShowPictureInPictureViewController:(id)a4;
- (void)restorePictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)startPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4;
- (void)startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3;
- (void)stopPictureInPictureForApplication:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)stopPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)stopPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4;
@end

@implementation PGPictureInPictureController

- (BOOL)isStartingStoppingOrCancellingPictureInPicture
{
  return [(NSMutableSet *)self->_activePictureInPictureRemoteObjects bs_containsObjectPassingTest:&__block_literal_global_22];
}

- (NSSet)pictureInPictureApplications
{
  return self->_pictureInPictureApplications;
}

- (BOOL)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = PGStringFromPictureInPictureInterruptionReason(a3);
    *(_DWORD *)buf = 136315650;
    v24 = "-[PGPictureInPictureController pictureInPictureInterruptionBeganWithReason:attribution:]";
    __int16 v25 = 2114;
    v26 = v9;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);
  }
  [(PGInterruptionAssistant *)self->_interruptionAssistant addReason:a3 attribution:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v16 pictureInPictureInterruptionBeganWithReason:a3 attribution:v6];
        if (!((a3 != 2) | v13 & 1))
        {
          if (-[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v16))char v13 = [v16 isInterrupted]; {
          else
          }
            char v13 = 0;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  uint64_t v12 = 0;
  id v9 = [(PGPictureInPictureController *)self _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:v6 sceneSessionPersistentIdentifier:v7 error:&v12];
  BOOL v10 = v12 == 0;

  return v10;
}

- (id)_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __164__PGPictureInPictureController__remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 passingTest:v12 error:a5];

  return v10;
}

- (id)_remoteObjectForPictureInPictureApplication:(id)a3 passingTest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(PGPictureInPictureController *)v10 _remoteObjectsForPictureInPictureApplication:v8];
  if ([v11 count])
  {
    uint64_t v12 = [v11 objectsPassingTest:v9];
    if ((unint64_t)[v12 count] >= 2)
    {
      id v13 = PGLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](v13);
      }
    }
    if ([v12 count] == 1)
    {
      uint64_t v14 = [v12 anyObject];
      v15 = 0;
    }
    else
    {
      v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1002 userInfo:0];
      uint64_t v14 = 0;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1000 userInfo:0];
    uint64_t v14 = 0;
  }

  objc_sync_exit(v10);
  if (a5) {
    *a5 = v15;
  }

  return v14;
}

- (id)_remoteObjectsForPictureInPictureApplication:(id)a3
{
  id v4 = a3;
  v5 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PGPictureInPictureController__remoteObjectsForPictureInPictureApplication___block_invoke;
  v9[3] = &unk_1E610C1A0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 objectsPassingTest:v9];

  return v7;
}

- (id)_pictureInPictureRemoteObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableSet *)self->_lock_pictureInPictureRemoteObjects copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken != -1) {
    dispatch_once(&isPictureInPictureSupported_onceToken, &__block_literal_global_1);
  }
  return isPictureInPictureSupported_isPictureInPictureSupported;
}

uint64_t __59__PGPictureInPictureController_isPictureInPictureSupported__block_invoke()
{
  uint64_t result = PGIsPictureInPictureSupported();
  isPictureInPictureSupported_isPictureInPictureSupported = result;
  return result;
}

- (PGPictureInPictureController)init
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureController init]();
  }

  v22.receiver = self;
  v22.super_class = (Class)PGPictureInPictureController;
  id v4 = [(PGPictureInPictureController *)&v22 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    lock_pictureInPictureRemoteObjects = v5->_lock_pictureInPictureRemoteObjects;
    v5->_lock_pictureInPictureRemoteObjects = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart = v5->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart;
    v5->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    activePictureInPictureRemoteObjects = v5->_activePictureInPictureRemoteObjects;
    v5->_activePictureInPictureRemoteObjects = (NSMutableSet *)v10;

    uint64_t v12 = objc_alloc_init(PGInterruptionAssistant);
    interruptionAssistant = v5->_interruptionAssistant;
    v5->_interruptionAssistant = v12;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.pegasus.PGPictureInPictureController %p", v5);
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    listenerQueue = v5->_listenerQueue;
    v5->_listenerQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.pegasus"];
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v19;

    [(NSXPCListener *)v5->_listener setDelegate:v5];
    [(NSXPCListener *)v5->_listener resume];
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureController init]();
  }

  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureController;
  [(PGPictureInPictureController *)&v4 dealloc];
}

uint64_t __78__PGPictureInPictureController_isStartingStoppingOrCancellingPictureInPicture__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isStartingStoppingOrCancellingPictureInPicture];
}

- (PGPictureInPictureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGPictureInPictureControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v5) {
      *(unsigned char *)&self->_delegateRespondsTo &= 0x80u;
    }
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v9 = 2;
      }
      else {
        char v9 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v9;

      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v11 = 4;
      }
      else {
        char v11 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v11;

      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v13 = 8;
      }
      else {
        char v13 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xF7 | v13;

      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v15 = 16;
      }
      else {
        char v15 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xEF | v15;

      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v17 = 32;
      }
      else {
        char v17 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xDF | v17;

      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        char v19 = 64;
      }
      else {
        char v19 = 0;
      }
      *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xBF | v19;
    }
  }
}

- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3
{
  [(PGPictureInPictureController *)self initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:a3 sceneSessionPersistentIdentifier:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)preferredContentSizeForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3
{
  [(PGPictureInPictureController *)self preferredContentSizeForInteractivelyEnteringBackgroundForApplication:a3 sceneSessionPersistentIdentifier:0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3
{
  return [(PGPictureInPictureController *)self shouldStartPictureInPictureForApplicationEnteringBackground:a3 sceneSessionPersistentIdentifier:0];
}

- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)stopPictureInPictureForApplication:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)cancelPictureInPictureForApplication:(id)a3
{
}

- (int64_t)contentTypePictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  double v4 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 sceneSessionPersistentIdentifier:a4 error:0];
  double v5 = v4;
  if (v4) {
    int64_t v6 = [v4 contentType];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  char v9 = [(PGPictureInPictureController *)v8 _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:v6 sceneSessionPersistentIdentifier:v7 error:0];
  id v10 = v9;
  if (v9)
  {
    [v9 initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  objc_sync_exit(v8);
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)preferredContentSizeForInteractivelyEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  char v9 = [(PGPictureInPictureController *)v8 _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:v6 sceneSessionPersistentIdentifier:v7 error:0];
  id v10 = v9;
  if (v9)
  {
    [v9 preferredContentSize];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  objc_sync_exit(v8);
  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)preferredContentSizeForActivePictureInPictureWithApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  activePictureInPictureRemoteObjects = v8->_activePictureInPictureRemoteObjects;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke;
  v22[3] = &unk_1E610C150;
  id v10 = v6;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  double v12 = [(NSMutableSet *)activePictureInPictureRemoteObjects bs_firstObjectPassingTest:v22];
  if (v12) {
    goto LABEL_3;
  }
  double v13 = [(PGPictureInPictureController *)v8 _remoteObjectsForPictureInPictureApplication:v10];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke_2;
  v20[3] = &unk_1E610C178;
  id v21 = v11;
  double v12 = objc_msgSend(v13, "bs_firstObjectPassingTest:", v20);

  if (v12)
  {
LABEL_3:
    [v12 preferredContentSize];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  objc_sync_exit(v8);
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

uint64_t __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 pictureInPictureApplication];
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v5 = [v3 matchesSceneSessionIdentifier:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchesSceneSessionIdentifier:*(void *)(a1 + 32)];
}

- (BOOL)isStoppingOrCancellingPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__PGPictureInPictureController_isStoppingOrCancellingPictureInPictureForApplication_sceneSessionPersistentIdentifier___block_invoke;
  v13[3] = &unk_1E610C1A0;
  id v14 = v7;
  id v9 = v7;
  id v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:v6 passingTest:v13 error:0];
  char v11 = [v10 isStoppingOrCancellingPictureInPicture];

  return v11;
}

uint64_t __118__PGPictureInPictureController_isStoppingOrCancellingPictureInPictureForApplication_sceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesSceneSessionIdentifier:*(void *)(a1 + 32)];
}

- (int64_t)tetheringModeForSceneSessionPersistentIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke;
  v12[3] = &unk_1E610C178;
  id v13 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v12);

  id v8 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  id v9 = objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_40);

  int64_t v10 = 0;
  if (v9 && v7 && v9 != v7) {
    int64_t v10 = [v9 canTetherRemoteObjectAsMicroPIP:v7];
  }

  return v10;
}

uint64_t __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sourceSceneSessionPersistentIdentifier];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  LODWORD(v4) = [v3 supportsMicroPIP];
  return a1 & v4;
}

BOOL __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 currentState] == 6;
}

- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = PGLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v18 = 0;
  id v14 = [(PGPictureInPictureController *)self _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:v10 sceneSessionPersistentIdentifier:v11 error:&v18];
  id v15 = v18;
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __146__PGPictureInPictureController_startPictureInPictureForApplicationEnteringBackground_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke;
    v16[3] = &unk_1E610C1C8;
    id v17 = v12;
    [v14 startPictureInPictureEnteringBackgroundAnimated:v7 withCompletionHandler:v16];
  }
  else if (v12)
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v15);
  }
}

uint64_t __146__PGPictureInPictureController_startPictureInPictureForApplicationEnteringBackground_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = PGLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v18 = 0;
  id v14 = [(PGPictureInPictureController *)self _remoteObjectThatCanStopPictureInPictureApplication:v10 sceneSessionPersistentIdentifier:v11 error:&v18];
  id v15 = v18;
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __127__PGPictureInPictureController_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke;
    v16[3] = &unk_1E610C1C8;
    id v17 = v12;
    [v14 stopPictureInPictureAnimated:v7 withCompletionHandler:v16];
  }
  else if (v12)
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v15);
  }
}

uint64_t __127__PGPictureInPictureController_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)beginTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 byRestoringUserInterfaceWithCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v12 = PGLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v15 = 0;
  id v13 = [(PGPictureInPictureController *)self _remoteObjectThatCanStopPictureInPictureApplication:v9 sceneSessionPersistentIdentifier:v10 error:&v15];
  id v14 = v15;
  if (v13)
  {
    [v13 beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler:v11];
  }
  else if (v11)
  {
    v11[2](v11, 0, v14);
  }
}

- (void)endTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = PGLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v13 = 0;
  id v11 = [(PGPictureInPictureController *)self _remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:v8 error:&v13];
  id v12 = v13;
  if (v11)
  {
    [v11 endTwoStageStopPictureInPictureWithCompletionBlock:v9];
  }
  else if (v9)
  {
    v9[2](v9, 0, v12);
  }
}

- (void)cancelPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    id v13 = "-[PGPictureInPictureController cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = PGLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v10 = [(PGPictureInPictureController *)self _remoteObjectThatCanCancelPictureInPictureApplication:v6 sceneSessionPersistentIdentifier:v7 error:0];
  id v11 = v10;
  if (v10) {
    [v10 cancel];
  }
}

- (void)startPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__PGPictureInPictureController_startPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v7;
  id v9 = v7;
  id v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:v6 passingTest:v12 error:0];
  id v11 = v10;
  if (v10) {
    [v10 setCurrentResourcesUsageReductionReasons:1];
  }
}

BOOL __116__PGPictureInPictureController_startPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pictureInPictureViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)stopPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __115__PGPictureInPictureController_stopPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v7;
  id v9 = v7;
  id v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:v6 passingTest:v12 error:0];
  id v11 = v10;
  if (v10) {
    [v10 setCurrentResourcesUsageReductionReasons:0];
  }
}

BOOL __115__PGPictureInPictureController_stopPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pictureInPictureViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_remoteObjectForTestApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 pictureInPictureApplication];
        id v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v6 = [(PGPictureInPictureController *)self _remoteObjectForTestApplicationWithBundleIdentifier:v4];
  [v6 sendStartPictureInPictureTestAction];
}

- (void)restorePictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = PGLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v6 = [(PGPictureInPictureController *)self _remoteObjectForTestApplicationWithBundleIdentifier:v4];
  uint64_t v7 = [v6 pictureInPictureViewController];
  id v8 = [v7 viewModel];
  [v8 handleRestoreButtonTapped];
}

- (void)pictureInPictureInterruptionBegan
{
}

- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3
{
}

- (void)pictureInPictureInterruptionEnded
{
}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3
{
}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  id v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = PGStringFromPictureInPictureInterruptionReason(a3);
    *(_DWORD *)buf = 136315650;
    v30 = "-[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:]";
    __int16 v31 = 2114;
    v32 = v9;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);
  }
  BOOL v10 = [(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1];
  [(PGInterruptionAssistant *)self->_interruptionAssistant removeReason:a3 attribution:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v15++) pictureInPictureInterruptionEndedWithReason:a3 attribution:v6];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  if (![(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1]
    && v10
    && _os_feature_enabled_impl())
  {
    long long v16 = [(PGPictureInPictureController *)self _faceTimeVideoCallRemoteObject];
    uint64_t v17 = [v16 currentState];
    int v18 = [v16 shouldStartPictureInPictureEnteringBackground];
    if (v17 == 2)
    {
      if (v18)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v20 = objc_opt_respondsToSelector();

        if (v20)
        {
          id v21 = objc_loadWeakRetained((id *)&self->_delegate);
          int v22 = [v21 pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:self];

          if (v22)
          {
            id v23 = PGLogCommon();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v30 = "-[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:]";
              _os_log_impl(&dword_1B5645000, v23, OS_LOG_TYPE_DEFAULT, "%s Starting PIP for FaceTime Video Call upon unlock", buf, 0xCu);
            }

            [v16 startPictureInPictureFromBackground];
          }
        }
      }
    }
  }
}

- (id)existingPictureInPictureApplicationForBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) pictureInPictureApplication];
      id v11 = [v10 bundleIdentifier];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v10 = 0;
  }

  return v10;
}

- (NSSet)activePictureInPictureApplications
{
  return (NSSet *)[(NSMutableSet *)self->_activePictureInPictureRemoteObjects bs_map:&__block_literal_global_48];
}

uint64_t __66__PGPictureInPictureController_activePictureInPictureApplications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pictureInPictureApplication];
}

- (NSSet)activePictureInPictureApplicationsStoppingOrCancelling
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke;
  v7[3] = &unk_1E610C230;
  v7[4] = self;
  uint64_t v5 = [(NSMutableSet *)activePictureInPictureRemoteObjects bs_compactMap:v7];

  return (NSSet *)v5;
}

id __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pictureInPictureApplication];
  id v4 = [*(id *)(a1 + 32) _remoteObjectForPictureInPictureApplication:v3 passingTest:&__block_literal_global_50 error:0];
  id v5 = 0;
  if ([v4 isStoppingOrCancellingPictureInPicture]) {
    id v5 = v3;
  }

  return v5;
}

uint64_t __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchesSceneSessionIdentifier:0];
}

- (id)suspendedPictureInPictureApplication
{
  return [(PGPictureInPictureRemoteObject *)self->_suspendedPictureInPictureRemoteObject pictureInPictureApplication];
}

- (NSDictionary)activeSceneSessionIdentifiersByApplication
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_activePictureInPictureRemoteObjects count])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableSet count](self->_activePictureInPictureRemoteObjects, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_activePictureInPictureRemoteObjects;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          BOOL v10 = objc_msgSend(v9, "pictureInPictureApplication", (void)v15);
          if (v10)
          {
            id v11 = [v3 objectForKey:v10];

            if (v11) {
              [v3 objectForKey:v10];
            }
            else {
            char v12 = [MEMORY[0x1E4F1CA48] array];
            }
            uint64_t v13 = [v9 sourceSceneSessionPersistentIdentifier];
            if (v13) {
              [v12 addObject:v13];
            }
            if (v12) {
              [v3 setObject:v12 forKey:v10];
            }
          }
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)activateBackgroundPIPAuthorizationService
{
  if (!self->_backgroundPIPService)
  {
    id v3 = objc_alloc_init(PGBackgroundPIPService);
    backgroundPIPService = self->_backgroundPIPService;
    self->_backgroundPIPService = v3;

    [(PGBackgroundPIPService *)self->_backgroundPIPService setDelegate:self];
    uint64_t v5 = self->_backgroundPIPService;
    [(PGBackgroundPIPService *)v5 startListener];
  }
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3 application:(id)a4
{
  uint64_t v5 = [(PGPictureInPictureController *)self _remoteObjectsForPictureInPictureApplication:a4];
  id v6 = [v5 anyObject];

  [v6 pagingSkipByNumberOfPages:a3];
}

BOOL __77__PGPictureInPictureController__remoteObjectsForPictureInPictureApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pictureInPictureApplication];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_remoteObjectForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __115__PGPictureInPictureController__remoteObjectForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 passingTest:v12 error:a5];

  return v10;
}

uint64_t __115__PGPictureInPictureController__remoteObjectForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesSceneSessionIdentifier:*(void *)(a1 + 32)];
}

uint64_t __164__PGPictureInPictureController__remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 matchesSceneSessionIdentifier:*(void *)(a1 + 32)];
  unsigned int v5 = [v3 shouldStartPictureInPictureEnteringBackground];
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218752;
    id v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4 & v5;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    unsigned int v15 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "Could remoteObject{%p} start pip upon backgrounding? %{BOOL}u, since we have at least the following: matchesSceneIdentifier{%{BOOL}u} shouldStartPictureInPictureEnteringBackground{%{BOOL}u}", (uint8_t *)&v8, 0x1Eu);
  }

  return v4 & v5;
}

- (id)_remoteObjectThatCanStopPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __123__PGPictureInPictureController__remoteObjectThatCanStopPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v8;
  id v9 = v8;
  __int16 v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 passingTest:v12 error:a5];

  return v10;
}

uint64_t __123__PGPictureInPictureController__remoteObjectThatCanStopPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 matchesSceneSessionIdentifier:*(void *)(a1 + 32)]) {
    uint64_t v4 = [v3 canStopPictureInPicture];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_remoteObjectThatCanCancelPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __125__PGPictureInPictureController__remoteObjectThatCanCancelPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E610C1A0;
  id v13 = v8;
  id v9 = v8;
  __int16 v10 = [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 passingTest:v12 error:a5];

  return v10;
}

uint64_t __125__PGPictureInPictureController__remoteObjectThatCanCancelPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 matchesSceneSessionIdentifier:*(void *)(a1 + 32)]) {
    uint64_t v4 = [v3 canCancelPictureInPicture];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:(id)a3 error:(id *)a4
{
  return [(PGPictureInPictureController *)self _remoteObjectForPictureInPictureApplication:a3 passingTest:&__block_literal_global_56 error:a4];
}

uint64_t __101__PGPictureInPictureController__remoteObjectThatCanEndTwoStageStopPictureInPictureApplication_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canEndTwoStageStopPictureInPicture];
}

- (BOOL)_hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP
{
  id v3 = [(PGPictureInPictureController *)self _faceTimeVideoCallRemoteObject];
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke;
  v12[3] = &unk_1E610C150;
  id v5 = v3;
  id v13 = v5;
  __int16 v14 = self;
  if ([(NSMutableSet *)activePictureInPictureRemoteObjects bs_containsObjectPassingTest:v12])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke_2;
    v9[3] = &unk_1E610C150;
    id v10 = v5;
    int v11 = self;
    char v6 = objc_msgSend(v7, "bs_containsObjectPassingTest:", v9);
  }
  return v6;
}

uint64_t __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 64);
    char v6 = [v3 activitySessionIdentifier];
    uint64_t v7 = [v3 pictureInPictureApplication];
    id v8 = [v7 bundleIdentifier];
    uint64_t v4 = [v5 hasAcquiredAuthorizationForActivitySessionWithIdentifier:v6 appBundleIdentifier:v8];
  }
  return v4;
}

uint64_t __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqual:v3] & 1) != 0 || objc_msgSend(v3, "currentState") == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 64);
    char v6 = [v3 activitySessionIdentifier];
    uint64_t v7 = [v3 pictureInPictureApplication];
    id v8 = [v7 bundleIdentifier];
    uint64_t v4 = [v5 hasAcquiredAuthorizationForActivitySessionWithIdentifier:v6 appBundleIdentifier:v8];
  }
  return v4;
}

- (id)_faceTimeVideoCallRemoteObject
{
  v2 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  id v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", &__block_literal_global_58);

  return v3;
}

uint64_t __62__PGPictureInPictureController__faceTimeVideoCallRemoteObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isVideoCall])
  {
    id v3 = [v2 pictureInPictureApplication];
    uint64_t v4 = [v3 bundleIdentifier];
    uint64_t v5 = [v4 isEqualToString:@"com.apple.InCallService"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_faceTimeVideoCallInterruptionExemption
{
  if (_os_feature_enabled_impl()) {
    id v2 = @"com.apple.avconferenced";
  }
  else {
    id v2 = @"com.apple.mediaserverd";
  }

  return v2;
}

- (id)_continuityCameraInterruptionExemption
{
  return @"com.apple.continuitycaptured";
}

- (void)_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v3 = PGLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  uint64_t v4 = [(PGPictureInPictureController *)self _pictureInPictureRemoteObjects];
  v39 = [(PGPictureInPictureController *)self _faceTimeVideoCallRemoteObject];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(PGPictureInPictureRemoteObject **)(*((void *)&v45 + 1) + 8 * i);
        if (v9 == self->_suspendedPictureInPictureRemoteObject
          || ([(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:*(void *)(*((void *)&v45 + 1) + 8 * i)] & 1) != 0)
        {
          uint64_t v10 = 1;
        }
        else
        {
          activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __90__PGPictureInPictureController__updateAllRemoteObjectsForPIPPossibleAndExemptAttributions__block_invoke;
          v44[3] = &unk_1E610C150;
          v44[4] = self;
          v44[5] = v9;
          uint64_t v10 = [(NSMutableSet *)activePictureInPictureRemoteObjects bs_containsObjectPassingTest:v44] ^ 1;
        }
        [(PGPictureInPictureRemoteObject *)v9 setPictureInPicturePossible:v10];
        if ([(PGPictureInPictureRemoteObject *)v9 isVideoCall]
          && ([(PGPictureInPictureRemoteObject *)v9 pictureInPictureApplication],
              __int16 v12 = objc_claimAutoreleasedReturnValue(),
              [v12 bundleIdentifier],
              id v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isEqual:@"com.apple.InCallService"],
              v13,
              v12,
              v14)
          || [(PGPictureInPictureRemoteObject *)v9 isAssociatedWithRemoteObject:v39])
        {
          unsigned int v15 = [(PGPictureInPictureController *)self _faceTimeVideoCallInterruptionExemption];
          [(PGPictureInPictureRemoteObject *)v9 setExemptAttribution:v15];
        }
        else
        {
          unsigned int v15 = [(PGPictureInPictureRemoteObject *)v9 pictureInPictureApplication];
          uint64_t v16 = [v15 bundleIdentifier];
          [(PGPictureInPictureRemoteObject *)v9 setExemptAttribution:v16];
        }
        if ((v10 & 1) == 0
          && [(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:v9]&& [(PGPictureInPictureRemoteObject *)v9 canCancelPictureInPicture])
        {
          [(PGPictureInPictureRemoteObject *)v9 cancel];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v6);
  }

  id v17 = [(PGBackgroundPIPService *)self->_backgroundPIPService identifiersForAuthorizedActivitySessions];
  if (![v17 count]) {
    goto LABEL_54;
  }
  BOOL v18 = [(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:1];

  if (v18) {
    goto LABEL_55;
  }
  BOOL v19 = [(PGPictureInPictureController *)self _hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = obj;
  uint64_t v20 = [v17 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (!v20)
  {
LABEL_54:

    goto LABEL_55;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v41;
  id v37 = v17;
LABEL_29:
  uint64_t v23 = 0;
  while (1)
  {
    if (*(void *)v41 != v22) {
      objc_enumerationMutation(v37);
    }
    long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * v23);
    int v25 = v19 ? [v39 isEqual:*(void *)(*((void *)&v40 + 1) + 8 * v23)] : 1;
    long long v26 = [v24 activitySessionIdentifier];
    long long v27 = [v24 pictureInPictureApplication];
    id v28 = [v27 bundleIdentifier];

    if (v25)
    {
      if ([(PGBackgroundPIPService *)self->_backgroundPIPService hasAcquiredAuthorizationForActivitySessionWithIdentifier:v26 appBundleIdentifier:v28])
      {
        break;
      }
    }

    if (v21 == ++v23)
    {
      id v17 = v37;
      uint64_t v21 = [v37 countByEnumeratingWithState:&v40 objects:v55 count:16];
      if (v21) {
        goto LABEL_29;
      }
      goto LABEL_54;
    }
  }
  uint64_t v29 = [(PGPictureInPictureController *)self delegate];
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    __int16 v31 = [(PGPictureInPictureController *)self delegate];
    int v32 = [v31 pictureInPictureController:self shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:v28];

    __int16 v33 = v37;
    if (v32)
    {
      if ([v24 canStartBackgroundPIPForCurrentActivitySessionIdentifier]) {
        id v34 = v24;
      }
      else {
        id v34 = 0;
      }
      id v17 = v34;
    }
    else
    {
      uint64_t v35 = PGLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v50 = "-[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions]";
        __int16 v51 = 2114;
        id v52 = v26;
        __int16 v53 = 2114;
        v54 = v28;
        _os_log_impl(&dword_1B5645000, v35, OS_LOG_TYPE_DEFAULT, "%s Revoking authorization for %{public}@ because the delegate forbids background pip for the app %{public}@", buf, 0x20u);
      }

      [(PGBackgroundPIPService *)self->_backgroundPIPService revokeAuthorizationActivitySessionWithIdentifier:v26];
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
    __int16 v33 = v37;
  }

  if (v17)
  {
    v36 = PGLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions]";
      __int16 v51 = 2114;
      id v52 = v17;
      _os_log_impl(&dword_1B5645000, v36, OS_LOG_TYPE_DEFAULT, "%s Attempting to start backgroundPIP for %{public}@", buf, 0x16u);
    }

    [v17 setPictureInPicturePossible:1];
    [v17 startPictureInPictureFromBackground];
    goto LABEL_54;
  }
LABEL_55:
}

uint64_t __90__PGPictureInPictureController__updateAllRemoteObjectsForPIPPossibleAndExemptAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (WeakRetained == v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v3 canPreventOrSuspendRemoteObject:*(void *)(a1 + 40)];
  }

  return v5;
}

- (void)_addRemoteObject:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSMutableSet *)self->_lock_pictureInPictureRemoteObjects addObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_removeRemoteObject:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSMutableSet *)self->_lock_pictureInPictureRemoteObjects removeObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v21 = "-[PGPictureInPictureController listener:shouldAcceptNewConnection:]";
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    id v25 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v7 = PGLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:]();
    }
  }
  if (!PGIsPictureInPictureSupported()
    || (*(unsigned char *)&self->_delegateRespondsTo & 0x20) != 0
    && ([(PGPictureInPictureController *)self delegate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 pictureInPictureController:self shouldDenyNewConnection:v5],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke;
    v19[3] = &unk_1E610C280;
    v19[4] = self;
    int v11 = (void *)MEMORY[0x1BA99D810](v19);
    listenerQueue = self->_listenerQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_4;
    v15[3] = &unk_1E610C2A8;
    id v16 = v5;
    id v17 = self;
    id v18 = v11;
    id v13 = v11;
    dispatch_async(listenerQueue, v15);

    BOOL v10 = 1;
  }

  return v10;
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _pictureInPictureRemoteObjects];
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_64);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3;
  v5[3] = &unk_1E610C258;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pictureInPictureApplication];
}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"pictureInPictureApplications"];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"pictureInPictureApplications"];
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  id v2 = [PGPictureInPictureRemoteObject alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)[*(id *)(*(void *)(a1 + 40) + 72) copyWithExemptAttribution:0];
  id v5 = [(PGPictureInPictureRemoteObject *)v2 initWithConnection:v3 interruptionAssistant:v4];

  [(PGPictureInPictureRemoteObject *)v5 setDelegate:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [(PGPictureInPictureRemoteObject *)v5 queue];
  [v6 _setQueue:v7];

  id v8 = *(void **)(a1 + 32);
  char v9 = PGPictureInPictureRemoteObjectInterface();
  [v8 setExportedInterface:v9];

  [*(id *)(a1 + 32) setExportedObject:v5];
  BOOL v10 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_5;
  v25[3] = &unk_1E610C280;
  int v11 = v5;
  uint64_t v26 = v11;
  [v10 setInterruptionHandler:v25];
  __int16 v12 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_69;
  v20[3] = &unk_1E610C2D0;
  id v13 = v11;
  uint64_t v21 = v13;
  objc_copyWeak(&v24, &location);
  int v14 = *(void **)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 40);
  id v23 = v14;
  [v12 setInvalidationHandler:v20];
  unsigned int v15 = *(void **)(a1 + 32);
  id v16 = PGPictureInPictureExportedInterface();
  [v15 setRemoteObjectInterface:v16];

  [*(id *)(a1 + 40) _addRemoteObject:v13];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) resume];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3_72;
  v18[3] = &unk_1E610C258;
  v18[4] = *(void *)(a1 + 40);
  BOOL v19 = v13;
  id v17 = v13;
  dispatch_async(MEMORY[0x1E4F14428], v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = PGLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 connection];
    int v5 = 134218240;
    id v6 = v3;
    __int16 v7 = 1024;
    int v8 = [v4 processIdentifier];
    _os_log_impl(&dword_1B5645000, v2, OS_LOG_TYPE_DEFAULT, "PGPictureInPictureRemoteObject %p - Connection with PID %d interrupted!", (uint8_t *)&v5, 0x12u);
  }
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_69(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = PGLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 connection];
    *(_DWORD *)buf = 134218240;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = [v4 processIdentifier];
    _os_log_impl(&dword_1B5645000, v2, OS_LOG_TYPE_DEFAULT, "PGPictureInPictureRemoteObject %p - Connection with PID %d invalidated!", buf, 0x12u);
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v7 = WeakRetained[5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_70;
    block[3] = &unk_1E610C2A8;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
  }
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_70(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeRemoteObject:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(id *)(a1 + 40);
  BSDispatchMain();
}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_2_71(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(void **)(a1 + 40);

  return [v2 _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3_72(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) analyticsDelegate];
  [v2 setAnalyticsDelegate:v3];
}

- (BOOL)pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:(id)a3
{
  backgroundPIPService = self->_backgroundPIPService;
  id v4 = a3;
  int v5 = [v4 activitySessionIdentifier];
  id v6 = [v4 pictureInPictureApplication];

  __int16 v7 = [v6 bundleIdentifier];
  LOBYTE(backgroundPIPService) = [(PGBackgroundPIPService *)backgroundPIPService hasAcquiredAuthorizationForActivitySessionWithIdentifier:v5 appBundleIdentifier:v7];

  return (char)backgroundPIPService;
}

- (BOOL)pictureInPictureRemoteObjectShouldAcceptSetupRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:v4];
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PGPictureInPictureController_pictureInPictureRemoteObjectShouldAcceptSetupRequest___block_invoke;
  v9[3] = &unk_1E610C178;
  id v10 = v4;
  id v7 = v4;
  LODWORD(activePictureInPictureRemoteObjects) = (v5 | [(NSMutableSet *)activePictureInPictureRemoteObjects bs_containsObjectPassingTest:v9]) ^ 1;

  return (char)activePictureInPictureRemoteObjects;
}

uint64_t __85__PGPictureInPictureController_pictureInPictureRemoteObjectShouldAcceptSetupRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canPreventOrSuspendRemoteObject:*(void *)(a1 + 32)];
}

- (BOOL)pictureInPictureRemoteObjectShouldUpdateCancellationPolicyOnStart:(id)a3
{
  return (*(unsigned char *)&self->_delegateRespondsTo >> 4) & 1;
}

- (BOOL)pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x10) != 0
    && [(NSMutableSet *)self->_activePictureInPictureRemoteObjects count])
  {
    activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    int8x16_t v11 = __102__PGPictureInPictureController_pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart___block_invoke;
    id v12 = &unk_1E610C150;
    id v13 = self;
    id v6 = v4;
    id v14 = v6;
    char v7 = [(NSMutableSet *)activePictureInPictureRemoteObjects bs_containsObjectPassingTest:&v9];
    if ((v7 & 1) == 0) {
      -[NSMutableSet addObject:](self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, "addObject:", v6, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

uint64_t __102__PGPictureInPictureController_pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 delegate];
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = [v4 pictureInPictureApplication];

  id v8 = [*(id *)(a1 + 40) pictureInPictureApplication];
  uint64_t v9 = [v5 pictureInPictureController:v6 shouldCancelPictureInPictureForApplication:v7 whenStartingPictureInPictureForApplication:v8];

  return v9;
}

- (void)pictureInPictureRemoteObject:(id)a3 didRequestPictureInPictureStopForViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id obj = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeWeak((id *)&self->_remoteObjectThatRequestedStop, obj);
  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    id v12 = [(PGPictureInPictureController *)self delegate];
    [v12 pictureInPictureController:self didRequestStopForPictureInPictureViewController:v10 sourceSceneSessionIdentifier:v11 animated:v6];
  }
  else
  {
    id v12 = [obj pictureInPictureApplication];
    id v13 = [obj sourceSceneSessionPersistentIdentifier];
    [(PGPictureInPictureController *)self stopPictureInPictureForApplication:v12 sceneSessionPersistentIdentifier:v13 animated:v6 completionHandler:0];
  }
}

- (void)pictureInPictureRemoteObject:(id)a3 didCreatePictureInPictureViewController:(id)a4
{
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id v5 = a4;
    id v6 = [(PGPictureInPictureController *)self delegate];
    [v6 pictureInPictureController:self didCreatePictureInPictureViewController:v5];
  }
}

- (void)pictureInPictureRemoteObject:(id)a3 willShowPictureInPictureViewController:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = (PGPictureInPictureController *)a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  uint64_t v9 = (void *)[(NSMutableSet *)self->_activePictureInPictureRemoteObjects copy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v11)
  {

    long long v27 = 0;
    goto LABEL_46;
  }
  uint64_t v12 = v11;
  char v28 = 0;
  id location = (id *)&self->_suspendedPictureInPictureRemoteObject;
  __int16 v31 = 0;
  uint64_t v13 = *(void *)v33;
  uint64_t v29 = self;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v10);
      }
      __int16 v15 = *(PGPictureInPictureController **)(*((void *)&v32 + 1) + 8 * v14);
      if ([(PGPictureInPictureController *)v6 canTetherRemoteObjectAsMicroPIP:v15])
      {
        int v16 = PGLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          __int16 v38 = 2048;
          v39 = v6;
          __int16 v40 = 2048;
          long long v41 = v15;
          _os_log_impl(&dword_1B5645000, v16, OS_LOG_TYPE_DEFAULT, "%s Will tether because new object %p can tether %p as micropip", buf, 0x20u);
        }

        uint64_t v17 = v15;
        id v18 = v6;
LABEL_18:
        +[PGPictureInPictureRemoteObject tetherRemoteObject:v17 toRemoteObject:v18 mode:1];
        goto LABEL_19;
      }
      if ([(PGPictureInPictureController *)v15 canTetherRemoteObjectAsMicroPIP:v6])
      {
        BOOL v19 = PGLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          __int16 v38 = 2048;
          v39 = v15;
          __int16 v40 = 2048;
          long long v41 = v6;
          _os_log_impl(&dword_1B5645000, v19, OS_LOG_TYPE_DEFAULT, "%s Will tether because active object %p can tether %p as micropip", buf, 0x20u);
        }

        uint64_t v17 = v6;
        id v18 = v15;
        goto LABEL_18;
      }
      if ([(PGPictureInPictureController *)v6 canActivateUntetheredAlongsideOtherObject:v15])
      {
        uint64_t v20 = PGLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          *(_DWORD *)buf = 136315650;
          id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          __int16 v38 = 2048;
          v39 = v6;
          __int16 v40 = 2048;
          long long v41 = v15;
          _os_log_impl(&dword_1B5645000, v20, OS_LOG_TYPE_DEFAULT, "%s Allowing remote object %p to coexist with active %p because one is QNBacklink", buf, 0x20u);
        }
LABEL_27:

        goto LABEL_19;
      }
      if ([(PGPictureInPictureController *)v15 canActivateUntetheredAlongsideOtherObject:v6])
      {
        uint64_t v20 = PGLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      if ([(PGPictureInPictureController *)v6 canPreventOrSuspendRemoteObject:v15])
      {
        uint64_t v21 = PGLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          __int16 v38 = 2048;
          v39 = self;
          __int16 v40 = 2048;
          long long v41 = v15;
          _os_log_impl(&dword_1B5645000, v21, OS_LOG_TYPE_DEFAULT, "%s New object %p suspending active %p", buf, 0x20u);
        }

        [(PGPictureInPictureController *)v15 suspend];
        [(NSMutableSet *)self->_activePictureInPictureRemoteObjects removeObject:v15];
        objc_storeStrong(location, v15);
      }
      else
      {
        char v22 = [(NSMutableSet *)self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart containsObject:v6];
        id v23 = PGLogCommon();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136315138;
            id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
            _os_log_impl(&dword_1B5645000, v23, OS_LOG_TYPE_DEFAULT, "%s removing objects for swap", buf, 0xCu);
          }

          char v28 = 1;
          self = v29;
        }
        else
        {
          self = v29;
          if (v24)
          {
            *(_DWORD *)buf = 136315650;
            id v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
            __int16 v38 = 2048;
            v39 = v29;
            __int16 v40 = 2048;
            long long v41 = v15;
            _os_log_impl(&dword_1B5645000, v23, OS_LOG_TYPE_DEFAULT, "%s New object %p canceling active %p", buf, 0x20u);
          }

          [(PGPictureInPictureController *)v15 cancel];
          id v25 = v31;
          if (!v31)
          {
            id v25 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableSet count](v29->_activePictureInPictureRemoteObjects, "count"));
          }
          __int16 v31 = v25;
          [v25 addObject:v15];
        }
      }
LABEL_19:
      ++v14;
    }
    while (v12 != v14);
    uint64_t v26 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    uint64_t v12 = v26;
  }
  while (v26);

  if (v28) {
    [(NSMutableSet *)self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart removeObject:v6];
  }
  long long v27 = v31;
LABEL_46:
  if ([v27 count]) {
    [(NSMutableSet *)self->_activePictureInPictureRemoteObjects minusSet:v27];
  }
  [(NSMutableSet *)self->_activePictureInPictureRemoteObjects addObject:v6];
  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
  [(PGBackgroundPIPService *)self->_backgroundPIPService pipDidStartForRemoteObject:v6];
}

- (void)pictureInPictureRemoteObject:(id)a3 didShowPictureInPictureViewController:(id)a4
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ([(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:v5])
  {
    if (self->_pictureInPictureActive)
    {
      [(PGPictureInPictureController *)self willChangeValueForKey:@"activePictureInPictureApplication"];
      self->_pictureInPictureActive = 1;
      id v7 = [v5 pictureInPictureApplication];
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v7;
    }
    else
    {
      [(PGPictureInPictureController *)self willChangeValueForKey:@"pictureInPictureActive"];
      [(PGPictureInPictureController *)self willChangeValueForKey:@"activePictureInPictureApplication"];
      self->_pictureInPictureActive = 1;
      uint64_t v9 = [v5 pictureInPictureApplication];
      id v10 = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v9;

      [(PGPictureInPictureController *)self didChangeValueForKey:@"pictureInPictureActive"];
    }
    [(PGPictureInPictureController *)self didChangeValueForKey:@"activePictureInPictureApplication"];
  }
  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
}

- (void)pictureInPictureRemoteObject:(id)a3 willHidePictureInPictureViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) != 0)
  {
    uint64_t v9 = [(PGPictureInPictureController *)self delegate];
    [v9 pictureInPictureController:self willHidePictureInPictureViewController:v7];
  }
  if ([(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:v6])
  {
    suspendedPictureInPictureRemoteObject = self->_suspendedPictureInPictureRemoteObject;
    if (!suspendedPictureInPictureRemoteObject)
    {
      [(PGPictureInPictureController *)self willChangeValueForKey:@"activePictureInPictureApplication"];
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = 0;
      goto LABEL_12;
    }
    uint64_t v11 = self->_activePictureInPictureApplication;
    uint64_t v12 = [(PGPictureInPictureRemoteObject *)suspendedPictureInPictureRemoteObject pictureInPictureApplication];

    if (v11 != v12)
    {
      [(PGPictureInPictureController *)self willChangeValueForKey:@"activePictureInPictureApplication"];
      uint64_t v13 = [(PGPictureInPictureRemoteObject *)self->_suspendedPictureInPictureRemoteObject pictureInPictureApplication];
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v13;
LABEL_12:

      [(PGPictureInPictureController *)self didChangeValueForKey:@"activePictureInPictureApplication"];
    }
  }
  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
}

- (void)pictureInPictureRemoteObject:(id)a3 didHidePictureInPictureViewController:(id)a4
{
  id v6 = (PGPictureInPictureRemoteObject *)a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = PGLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:]();
    }
  }
  int v9 = [(NSMutableSet *)self->_activePictureInPictureRemoteObjects containsObject:v6];
  suspendedPictureInPictureRemoteObject = self->_suspendedPictureInPictureRemoteObject;
  if (v9)
  {
    if (suspendedPictureInPictureRemoteObject)
    {
      [(PGPictureInPictureRemoteObject *)suspendedPictureInPictureRemoteObject resume];
      [(NSMutableSet *)self->_activePictureInPictureRemoteObjects addObject:self->_suspendedPictureInPictureRemoteObject];
      uint64_t v11 = self->_suspendedPictureInPictureRemoteObject;
      self->_suspendedPictureInPictureRemoteObject = 0;
    }
    else
    {
      [(PGPictureInPictureController *)self willChangeValueForKey:@"pictureInPictureActive"];
      self->_pictureInPictureActive = 0;
      [(PGPictureInPictureController *)self didChangeValueForKey:@"pictureInPictureActive"];
    }
    [(NSMutableSet *)self->_activePictureInPictureRemoteObjects removeObject:v6];
  }
  else if (suspendedPictureInPictureRemoteObject == v6)
  {
    self->_suspendedPictureInPictureRemoteObject = 0;
  }
  if ((*(unsigned char *)&self->_delegateRespondsTo & 8) != 0)
  {
    uint64_t v12 = [(PGPictureInPictureController *)self delegate];
    [v12 pictureInPictureController:self didHidePictureInPictureViewController:v7];
  }
  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
  [(PGBackgroundPIPService *)self->_backgroundPIPService pipDidStopForRemoteObject:v6];
}

- (void)pictureInPictureRemoteObject:(id)a3 willDestroyPictureInPictureViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    id v7 = [(PGPictureInPictureController *)self delegate];
    [v7 pictureInPictureController:self willDestroyPictureInPictureViewController:v6];
  }
  p_remoteObjectThatRequestedStop = &self->_remoteObjectThatRequestedStop;
  id WeakRetained = objc_loadWeakRetained((id *)p_remoteObjectThatRequestedStop);

  if (WeakRetained == v10) {
    objc_storeWeak((id *)p_remoteObjectThatRequestedStop, 0);
  }
}

- (id)pictureInPictureRemoteObjectInterruptionAssistant:(id)a3
{
  id v3 = [(PGInterruptionAssistant *)self->_interruptionAssistant copyWithExemptAttribution:0];

  return v3;
}

- (void)pictureInPictureRemoteObject:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void))a5;
  if (v8
    && ([(PGPictureInPictureController *)self delegate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = [(PGPictureInPictureController *)self delegate];
    uint64_t v13 = [v14 pictureInPictureViewController];
    [v12 pictureInPictureController:self requestActivationOfSceneWithPersistenceIdentier:v8 pictureInPictureViewController:v13 completion:v9];
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)backgroundPIPService:(id)a3 didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PGPictureInPictureController backgroundPIPService:didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
}

- (void)backgroundPIPService:(id)a3 didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PGLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PGPictureInPictureController backgroundPIPService:didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(PGPictureInPictureController *)self _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions];
}

- (BOOL)backgroundPIPService:(id)a3 canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [(PGPictureInPictureController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(PGPictureInPictureController *)self delegate];
    int v12 = [v11 pictureInPictureController:self shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:v8];
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = PGLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[PGPictureInPictureController backgroundPIPService:canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:"
          "appBundleIdentifier:]";
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 1024;
    int v26 = v12;
    _os_log_impl(&dword_1B5645000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ canAuthorizeBackgroundPIPForActivitySessionWithIdentifier before checking interruptions %{BOOL}u", buf, 0x26u);
  }

  if (v12)
  {
    if ([(PGInterruptionAssistant *)self->_interruptionAssistant hasInterruptionReason:2])
    {
      id v14 = [(PGInterruptionAssistant *)self->_interruptionAssistant cameraInterruptionAttributions];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __131__PGPictureInPictureController_backgroundPIPService_canAuthorizeBackgroundPIPForActivitySessionWithIdentifier_appBundleIdentifier___block_invoke;
      v18[3] = &unk_1E610C2F8;
      v18[4] = self;
      int v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v18) ^ 1;
      if ((v15 & 1) == 0)
      {
        int v16 = PGLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "-[PGPictureInPictureController backgroundPIPService:canAuthorizeBackgroundPIPForActivitySessionWithIdent"
                "ifier:appBundleIdentifier:]";
          __int16 v21 = 2114;
          id v22 = v7;
          __int16 v23 = 2114;
          id v24 = v8;
          _os_log_impl(&dword_1B5645000, v16, OS_LOG_TYPE_DEFAULT, "%s Controller changed mind and decided to reject auth due for %{public}@ %{public}@ to camera interruption.", buf, 0x20u);
        }
      }
    }
    else
    {
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __131__PGPictureInPictureController_backgroundPIPService_canAuthorizeBackgroundPIPForActivitySessionWithIdentifier_appBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _faceTimeVideoCallInterruptionExemption];
  if ([v3 isEqualToString:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _continuityCameraInterruptionExemption];
    uint64_t v5 = [v3 isEqualToString:v6] ^ 1;
  }
  return v5;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (PGPictureInPictureApplication)activePictureInPictureApplication
{
  return self->_activePictureInPictureApplication;
}

- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (PGPictureInPictureAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_activePictureInPictureApplication, 0);
  objc_storeStrong((id *)&self->_pictureInPictureApplications, 0);
  objc_destroyWeak((id *)&self->_remoteObjectThatRequestedStop);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interruptionAssistant, 0);
  objc_storeStrong((id *)&self->_backgroundPIPService, 0);
  objc_storeStrong((id *)&self->_suspendedPictureInPictureRemoteObject, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureRemoteObjects, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, 0);

  objc_storeStrong((id *)&self->_lock_pictureInPictureRemoteObjects, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  v1 = _PGLogMethodProem(v0, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v2, v3, "%@", v4, v5, v6, v7, v8);
}

- (void)shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  uint64_t v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%@ needs to be invoked on the main thread!", v5, v6, v7, v8, v9);
}

- (void)_remoteObjectForPictureInPictureApplication:(os_log_t)log passingTest:error:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1B5645000, log, OS_LOG_TYPE_DEBUG, "Multiple remote object response for attempted action, desired effect is ambiguous", v1, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  uint64_t v2 = _PGLogMethodProem(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B5645000, v3, v4, "%@ may not be invoked on the main thread!", v5, v6, v7, v8, v9);
}

@end