@interface SBDashBoardSecureCaptureExtensionHostableEntity
- (CSCoverSheetViewPresenting)hostingViewController;
- (LCSCaptureApplicationDescribing)captureApplication;
- (NSString)applicationBundleIdentifier;
- (SBDashBoardSecureCaptureExtensionHostableEntity)initWithCaptureApplication:(id)a3;
- (SBDisplayItem)displayItemRepresentation;
- (id)_cameraPrewarmer;
- (void)_requestTransitionToCaptureApplication:(id)a3 actions:(id)a4 completion:(id)a5;
- (void)_resetTransitionRequest;
- (void)cameraExtensionViewController:(id)a3 cancelLaunchMonitoringForScene:(id)a4;
- (void)cameraExtensionViewController:(id)a3 didCreateScene:(id)a4;
- (void)cameraExtensionViewController:(id)a3 didDestroyScene:(id)a4;
- (void)cameraExtensionViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5;
- (void)cameraExtensionViewController:(id)a3 requestsLaunchMonitoringForScene:(id)a4;
- (void)cameraExtensionViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5;
- (void)cameraExtensionViewControllerWillPresent:(id)a3;
- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5;
- (void)captureApplicationTransitionRequest:(id)a3 didCompleteWithError:(id)a4;
- (void)captureApplicationTransitionRequestWillLaunchApplication:(id)a3;
- (void)dealloc;
@end

@implementation SBDashBoardSecureCaptureExtensionHostableEntity

- (SBDashBoardSecureCaptureExtensionHostableEntity)initWithCaptureApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardSecureCaptureExtensionHostableEntity;
  v6 = [(SBDashBoardSecureCaptureExtensionHostableEntity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_captureApplication, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SBCaptureExtensionIdleTimerManager *)self->_idleTimerManager invalidate];
  idleTimerManager = self->_idleTimerManager;
  self->_idleTimerManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSecureCaptureExtensionHostableEntity;
  [(SBDashBoardSecureCaptureExtensionHostableEntity *)&v4 dealloc];
}

- (SBDisplayItem)displayItemRepresentation
{
  v2 = [(SBDashBoardSecureCaptureExtensionHostableEntity *)self captureApplication];
  v3 = [v2 extension];
  objc_super v4 = [v3 bundleIdentifier];

  id v5 = +[SBDisplayItem displayItemWithType:7 bundleIdentifier:v4 uniqueIdentifier:@"default"];

  return (SBDisplayItem *)v5;
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)[(LCSCaptureApplicationDescribing *)self->_captureApplication bundleIdentifier];
}

- (CSCoverSheetViewPresenting)hostingViewController
{
  cameraExtensionViewController = self->_cameraExtensionViewController;
  if (!cameraExtensionViewController)
  {
    objc_super v4 = (CSCameraExtensionViewController *)[objc_alloc(MEMORY[0x1E4F5E3B0]) initWithCaptureApplication:self->_captureApplication];
    id v5 = self->_cameraExtensionViewController;
    self->_cameraExtensionViewController = v4;
    v6 = v4;

    [(CSCameraExtensionViewController *)self->_cameraExtensionViewController setDelegate:self];
    cameraExtensionViewController = self->_cameraExtensionViewController;
  }
  return cameraExtensionViewController;
}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchWithAction:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 captureApplication];
  v11 = [v10 bundleIdentifier];
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Launch request received for capture application: %@", (uint8_t *)&v14, 0xCu);
  }

  if (self->_transitionToApplicationRequest)
  {
    v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Already have an ongoing transition request for this capture application: %@, dropping this request", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v13 = objc_opt_new();
    [v13 addObject:v8];
    [(SBDashBoardSecureCaptureExtensionHostableEntity *)self _requestTransitionToCaptureApplication:v10 actions:v13 completion:v9];
  }
}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchAfterTransitionCompletionWithAction:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 captureApplication];
  v11 = [v10 bundleIdentifier];
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "After transition completion request received for capture application: %@", (uint8_t *)&v14, 0xCu);
  }

  if (self->_transitionToApplicationRequest)
  {
    v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Already have an ongoing transition request for this capture application: %@, dropping this request", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v13 = objc_opt_new();
    [v13 addObject:v8];
    [(SBDashBoardSecureCaptureExtensionHostableEntity *)self _requestTransitionToCaptureApplication:v10 actions:v13 completion:v9];
  }
}

- (void)cameraExtensionViewController:(id)a3 requestsLaunchMonitoringForScene:(id)a4
{
  if (!self->_launchMonitor)
  {
    id v5 = a4;
    v6 = [[SBCaptureApplicationLaunchMonitor alloc] initWithScene:v5 delegate:self];

    launchMonitor = self->_launchMonitor;
    self->_launchMonitor = v6;

    id v8 = self->_launchMonitor;
    [(SBCaptureApplicationLaunchMonitor *)v8 start];
  }
}

- (void)cameraExtensionViewController:(id)a3 cancelLaunchMonitoringForScene:(id)a4
{
  if (!self->_launchMonitor)
  {
    objc_msgSend(0, "invalidate", a3, a4);
    launchMonitor = self->_launchMonitor;
    self->_launchMonitor = 0;
  }
}

- (void)cameraExtensionViewControllerWillPresent:(id)a3
{
  if (!self->_isCameraPrewarmed)
  {
    objc_super v4 = (objc_class *)MEMORY[0x1E4F5E3B8];
    id v5 = a3;
    id v6 = [v4 alloc];
    v7 = [v5 captureApplication];

    id v8 = [v7 bundleIdentifier];
    id v10 = (id)[v6 initWithCameraPrewarmType:2 applicationBundleIdentifier:v8];

    id v9 = [(SBDashBoardSecureCaptureExtensionHostableEntity *)self _cameraPrewarmer];
    [v9 prewarmCameraForIdentifier:v10];

    self->_isCameraPrewarmed = 1;
  }
}

- (void)cameraExtensionViewController:(id)a3 didCreateScene:(id)a4
{
  id v5 = a3;
  id v8 = [v5 entityPresenterDelegate];
  [v8 hostableEntityPresenter:v5 didBeginHosting:self];

  if (!self->_idleTimerManager)
  {
    id v6 = objc_alloc_init(SBCaptureExtensionIdleTimerManager);
    idleTimerManager = self->_idleTimerManager;
    self->_idleTimerManager = v6;
  }
}

- (void)cameraExtensionViewController:(id)a3 didDestroyScene:(id)a4
{
  id v5 = a3;
  id v7 = [v5 entityPresenterDelegate];
  [v7 hostableEntityPresenter:v5 didEndHosting:self];

  [(SBCaptureExtensionIdleTimerManager *)self->_idleTimerManager invalidate];
  idleTimerManager = self->_idleTimerManager;
  self->_idleTimerManager = 0;

  [(SBDashBoardSecureCaptureExtensionHostableEntity *)self _resetTransitionRequest];
}

- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!a4)
  {
    id v9 = a3;
    id v10 = [(SBDashBoardSecureCaptureExtensionHostableEntity *)self hostingViewController];
    [v10 dismiss];

    v11 = [v9 scene];

    v12 = [v11 clientHandle];

    if (v12)
    {
      v13 = [v12 processHandle];
      if (v13)
      {
        int v14 = [MEMORY[0x1E4F96430] predicateMatchingIdentifier:v13];
        id v15 = objc_alloc(MEMORY[0x1E4F96488]);
        uint64_t v16 = [NSString stringWithFormat:@"Capture Application Requirements Unmet: \"%@\"", v8];
        v17 = (void *)[v15 initWithExplanation:v16];

        [v17 setReportType:1];
        [v17 setMaximumTerminationResistance:40];
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v14 context:v17];
        v19 = SBLogCaptureApplication();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v13 bundle];
          v21 = [v20 identifier];
          *(_DWORD *)buf = 138543618;
          id v30 = v21;
          __int16 v31 = 2114;
          id v32 = v8;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Locked capture launch monitor requesting termination of \"%{public}@\" for reason: \"%{public}@\"", buf, 0x16u);
        }
        id v28 = 0;
        char v22 = [v18 execute:&v28];
        id v23 = v28;
        if ((v22 & 1) == 0)
        {
          v24 = SBLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v23;
            _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Launch monitor failed to terminate the extension: %@", buf, 0xCu);
          }
        }
        v25 = +[SBCaptureApplicationCenter sharedInstance];
        v26 = [v13 name];
        [v25 promptLaunchTerminationAlertIfNecessaryForProcess:v26 afterDelay:v8 reason:1.0];
      }
    }
  }
  [(SBCaptureApplicationLaunchMonitor *)self->_launchMonitor invalidate];
  launchMonitor = self->_launchMonitor;
  self->_launchMonitor = 0;
}

- (id)_cameraPrewarmer
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 coverSheetViewController];
  objc_super v4 = [v3 cameraPrewarmer];

  return v4;
}

- (void)_requestTransitionToCaptureApplication:(id)a3 actions:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(SBDashBoardSecureCaptureExtensionHostableEntity *)self captureApplication];
    v13 = [v12 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Requesting a launch for capture application (%@)", buf, 0xCu);
  }
  int v14 = [[SBDashBoardCaptureApplicationTransitionRequest alloc] initWithCaptureApplication:v8];
  [(SBDashBoardCaptureApplicationTransitionRequest *)v14 setDelegate:self];
  id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [(SBDashBoardCaptureApplicationTransitionRequest *)v14 setLaunchActions:v15];

  objc_initWeak((id *)buf, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __109__SBDashBoardSecureCaptureExtensionHostableEntity__requestTransitionToCaptureApplication_actions_completion___block_invoke;
  v21 = &unk_1E6AFC718;
  objc_copyWeak(&v23, (id *)buf);
  id v16 = v10;
  id v22 = v16;
  [(SBDashBoardCaptureApplicationTransitionRequest *)v14 setCompletion:&v18];
  p_transitionToApplicationRequest = &self->_transitionToApplicationRequest;
  objc_storeStrong((id *)p_transitionToApplicationRequest, v14);
  [(SBDashBoardCaptureApplicationTransitionRequest *)*p_transitionToApplicationRequest initiate];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __109__SBDashBoardSecureCaptureExtensionHostableEntity__requestTransitionToCaptureApplication_actions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
  [WeakRetained _resetTransitionRequest];
}

- (void)_resetTransitionRequest
{
  transitionToApplicationRequest = self->_transitionToApplicationRequest;
  self->_transitionToApplicationRequest = 0;
}

- (void)captureApplicationTransitionRequestWillLaunchApplication:(id)a3
{
}

- (void)captureApplicationTransitionRequest:(id)a3 didCompleteWithError:(id)a4
{
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_transitionToApplicationRequest, 0);
  objc_storeStrong((id *)&self->_idleTimerManager, 0);
  objc_storeStrong((id *)&self->_launchMonitor, 0);
  objc_storeStrong((id *)&self->_cameraExtensionViewController, 0);
}

@end