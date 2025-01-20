@interface SBCaptureApplicationLaunchRequest
- (BOOL)prewarmCamera;
- (BSTransaction)launchTransaction;
- (NSSet)launchActions;
- (NSString)captureApplicationBundleIdentifier;
- (SBCaptureApplicationLaunchRequest)initWithCaptureApplicationBundleIdentifier:(id)a3;
- (id)_cameraPrewarmer;
- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4;
- (id)completionBlock;
- (int64_t)launchType;
- (int64_t)transitionSource;
- (void)_completeLaunchWithError:(id)a3;
- (void)_setupContentObserverWithSceneEntity:(id)a3;
- (void)captureApplicationLaunchAssertionManager:(id)a3 didUpdateAssertionForBundleIdentifier:(id)a4;
- (void)dealloc;
- (void)initiate;
- (void)setCaptureApplicationBundleIdentifier:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setLaunchActions:(id)a3;
- (void)setLaunchTransaction:(id)a3;
- (void)setLaunchType:(int64_t)a3;
- (void)setPrewarmCamera:(BOOL)a3;
- (void)setTransitionSource:(int64_t)a3;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBCaptureApplicationLaunchRequest

- (SBCaptureApplicationLaunchRequest)initWithCaptureApplicationBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureApplicationLaunchRequest;
  v6 = [(SBCaptureApplicationLaunchRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_captureApplicationBundleIdentifier, a3);
    uint64_t v8 = +[SBCaptureApplicationLaunchAssertionManager sharedInstance];
    launchAssertionManager = v7->_launchAssertionManager;
    v7->_launchAssertionManager = (SBCaptureApplicationLaunchAssertionManager *)v8;
  }
  return v7;
}

- (void)dealloc
{
  [(BSTransaction *)self->_launchTransaction removeObserver:self];
  launchTransaction = self->_launchTransaction;
  self->_launchTransaction = 0;

  [(SBCaptureApplicationLaunchAssertionManager *)self->_launchAssertionManager removeObserver:self];
  launchAssertionManager = self->_launchAssertionManager;
  self->_launchAssertionManager = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBCaptureApplicationLaunchRequest;
  [(SBCaptureApplicationLaunchRequest *)&v5 dealloc];
}

- (void)initiate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v3 = SBLogCaptureApplication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    captureApplicationBundleIdentifier = self->_captureApplicationBundleIdentifier;
    *(_DWORD *)buf = 138412290;
    v19 = captureApplicationBundleIdentifier;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Initiating launch request for %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __45__SBCaptureApplicationLaunchRequest_initiate__block_invoke;
  v15 = &unk_1E6AF7920;
  objc_copyWeak(&v17, (id *)buf);
  v16 = self;
  objc_super v5 = (void *)MEMORY[0x1D948C7A0](&v12);
  if (self->_prewarmCamera)
  {
    int64_t launchType = self->_launchType;
    id v7 = objc_alloc(MEMORY[0x1E4F5E3B8]);
    uint64_t v8 = objc_msgSend(v7, "initWithCameraPrewarmType:applicationBundleIdentifier:", launchType == 0, self->_captureApplicationBundleIdentifier, v12, v13, v14, v15);
    v9 = [(SBCaptureApplicationLaunchRequest *)self _cameraPrewarmer];
    [v9 prewarmCameraForIdentifier:v8];
  }
  v10 = +[SBCaptureApplicationCenter sharedInstance];
  objc_super v11 = v10;
  if (!self->_launchType) {
    [v10 launchForExtensionToApplicationTransition:self->_captureApplicationBundleIdentifier launchActions:self->_launchActions completionHandler:v5];
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __45__SBCaptureApplicationLaunchRequest_initiate__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v3 = +[SBApplicationController sharedInstance];
    v4 = [v3 applicationWithBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];

    objc_super v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v4];
    [WeakRetained _setupContentObserverWithSceneEntity:v5];
  }
  else
  {
    v6 = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
    if (!v7) {
      goto LABEL_6;
    }
    id WeakRetained = v6;
    (*(void (**)(void))(v7 + 16))();
  }
  v6 = WeakRetained;
LABEL_6:
}

- (void)transactionDidComplete:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = [v4 isFailed];

  if (v5)
  {
    v6 = [(BSTransaction *)self->_launchTransaction error];
    uint64_t v7 = [(SBCaptureApplicationLaunchRequest *)self _errorWithCode:2 underlyingError:v6];
  }
  else
  {
    uint64_t v8 = SBLogCaptureApplication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      captureApplicationBundleIdentifier = self->_captureApplicationBundleIdentifier;
      int v14 = 138412290;
      v15 = captureApplicationBundleIdentifier;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Scene content is ready %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v7 = 0;
  }
  uint64_t v10 = [(SBCaptureApplicationLaunchAssertionManager *)self->_launchAssertionManager assertionForBundleIdentifier:self->_captureApplicationBundleIdentifier];
  objc_super v11 = (void *)v10;
  if (v7 || !v10)
  {
    [(SBCaptureApplicationLaunchRequest *)self _completeLaunchWithError:v7];
  }
  else
  {
    uint64_t v12 = SBLogCaptureApplication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_captureApplicationBundleIdentifier;
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "There's a launch assertion held for %@, waiting for that to be invalidated to complete launch", (uint8_t *)&v14, 0xCu);
    }

    [(SBCaptureApplicationLaunchAssertionManager *)self->_launchAssertionManager addObserver:self];
  }
}

- (void)setLaunchTransaction:(id)a3
{
  int v5 = (BSTransaction *)a3;
  launchTransaction = self->_launchTransaction;
  if (launchTransaction != v5)
  {
    uint64_t v8 = v5;
    if (launchTransaction)
    {
      [(BSTransaction *)launchTransaction removeObserver:self];
      uint64_t v7 = self->_launchTransaction;
      self->_launchTransaction = 0;
    }
    objc_storeStrong((id *)&self->_launchTransaction, a3);
    [(BSTransaction *)self->_launchTransaction addObserver:self];
    int v5 = v8;
  }
}

- (void)_completeLaunchWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogCaptureApplication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    captureApplicationBundleIdentifier = self->_captureApplicationBundleIdentifier;
    int v8 = 138412290;
    v9 = captureApplicationBundleIdentifier;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Launch completed for %@", (uint8_t *)&v8, 0xCu);
  }

  [(SBCaptureApplicationLaunchAssertionManager *)self->_launchAssertionManager removeObserver:self];
  completionBlock = (void (**)(id, id))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, v4);
  }
}

- (id)_cameraPrewarmer
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 coverSheetViewController];
  id v4 = [v3 cameraPrewarmer];

  return v4;
}

- (void)_setupContentObserverWithSceneEntity:(id)a3
{
  id v6 = [a3 sceneHandle];
  id v4 = [[SBWaitForSceneContentAvailableTransaction alloc] initWithSceneHandle:v6 manualListener:0];
  [(SBCaptureApplicationLaunchRequest *)self setLaunchTransaction:v4];

  int v5 = [(SBCaptureApplicationLaunchRequest *)self launchTransaction];
  [v5 begin];
}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:*MEMORY[0x1E4F28A50]];
  }
  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:SBCaptureApplicationLaunchErrorDomain code:a3 userInfo:v7];

  return v8;
}

- (void)captureApplicationLaunchAssertionManager:(id)a3 didUpdateAssertionForBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  BSDispatchMain();
}

void __116__SBCaptureApplicationLaunchRequest_captureApplicationLaunchAssertionManager_didUpdateAssertionForBundleIdentifier___block_invoke(id *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 5;
  if ([a1[4] isEqualToString:*((void *)a1[5] + 3)])
  {
    v3 = [a1[6] assertionForBundleIdentifier:a1[4]];
    id v4 = SBLogCaptureApplication();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __116__SBCaptureApplicationLaunchRequest_captureApplicationLaunchAssertionManager_didUpdateAssertionForBundleIdentifier___block_invoke_cold_1((uint64_t)v2, v3, v5);
      }
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *((void *)*v2 + 3);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Capture application (%@) ended delaying appearance, initiating a launch", (uint8_t *)&v7, 0xCu);
      }

      [*v2 _completeLaunchWithError:0];
    }
  }
}

- (NSString)captureApplicationBundleIdentifier
{
  return self->_captureApplicationBundleIdentifier;
}

- (void)setCaptureApplicationBundleIdentifier:(id)a3
{
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (int64_t)transitionSource
{
  return self->_transitionSource;
}

- (void)setTransitionSource:(int64_t)a3
{
  self->_transitionSource = a3;
}

- (BOOL)prewarmCamera
{
  return self->_prewarmCamera;
}

- (void)setPrewarmCamera:(BOOL)a3
{
  self->_prewarmCamera = a3;
}

- (int64_t)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(int64_t)a3
{
  self->_int64_t launchType = a3;
}

- (BSTransaction)launchTransaction
{
  return self->_launchTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTransaction, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_captureApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchAssertionManager, 0);
}

void __116__SBCaptureApplicationLaunchRequest_captureApplicationLaunchAssertionManager_didUpdateAssertionForBundleIdentifier___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)a1 + 24);
  id v5 = [a2 identifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Capture application (%@) has a launch assertion (UUID: %@), can't complete the launch", (uint8_t *)&v6, 0x16u);
}

@end