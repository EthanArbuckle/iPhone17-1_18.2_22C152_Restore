@interface SFDeviceSetupAppleTVSession
- (BOOL)_isPreflightError:(id)a3;
- (BOOL)_shouldSkipHomeKitSetup;
- (BOOL)_verifyiCloudMatch:(unint64_t)a3 error:(id *)a4;
- (BOOL)isCLIMode;
- (NSString)forcedPasscode;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFDeviceSetupAppleTVSession)init;
- (UIViewController)presentingViewController;
- (id)_videoSubscriberAccountData;
- (id)progressHandler;
- (id)promptForCaptiveNetworkHandler;
- (id)promptForHomeHandler;
- (id)promptForHomeiCloudHandler;
- (id)promptForPINHandler;
- (id)promptForRoomHandler;
- (int)_runAppleIDSetup;
- (int)_runBasicConfig;
- (int)_runCDPSetup;
- (int)_runCaptiveJoin;
- (int)_runCaptivePrompt;
- (int)_runFinish:(BOOL)a3;
- (int)_runHomeKitSetup;
- (int)_runHomeKitUserInput;
- (int)_runPairSetupWithFlags:(unsigned int)a3;
- (int)_runPreAuth;
- (int)_runPreflightHomeKit;
- (int)_runPreflightWiFi;
- (int)_runPreflightiTunes;
- (int)_runSFSessionStart;
- (int)_runTRActivation;
- (int)_runTRAuthentication;
- (int)_runTRCompletion;
- (int)_runTRNetwork;
- (int)_runTRSessionStart;
- (int)_runTRSetupConfiguration;
- (int)_runTVLatencySetup;
- (int)_runWiFiSetup;
- (int)bonjourTestState;
- (unint64_t)peerFeatureFlags;
- (void)_cleanup;
- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3;
- (void)_reportError:(id)a3 label:(id)a4;
- (void)_reportErrorMetrics:(id)a3 errorLabel:(id)a4 isFatal:(BOOL)a5;
- (void)_reportMainMetrics:(id)a3 errorLabel:(id)a4 userWaitSeconds:(double)a5;
- (void)_reportProgress:(unsigned int)a3 info:(id)a4;
- (void)_run;
- (void)_runAppleIDSetupRequest;
- (void)_runAppleIDSetupResponse:(id)a3 error:(id)a4;
- (void)_runBasicConfigRequest;
- (void)_runBasicConfigResponse:(id)a3 error:(id)a4;
- (void)_runPreAuthRequest;
- (void)_runPreAuthResponse:(id)a3 error:(id)a4;
- (void)_runTVLatencySetupEnded:(int)a3;
- (void)_runTVLatencySetupEstimate;
- (void)_runTVLatencySetupProgressEvent:(unint64_t)a3 info:(id)a4;
- (void)_runTVLatencySetupRequest;
- (void)_setNumberOfDevicesOnAccount:(id)a3;
- (void)activate;
- (void)captiveConfirmed;
- (void)dealloc;
- (void)homeKitSelectHome:(id)a3;
- (void)homeKitSelectRoom:(id)a3;
- (void)homeiCloudEnable;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setForcedPasscode:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPeerFeatureFlags:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForCaptiveNetworkHandler:(id)a3;
- (void)setPromptForHomeHandler:(id)a3;
- (void)setPromptForHomeiCloudHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setPromptForRoomHandler:(id)a3;
- (void)switchToManualAuth;
@end

@implementation SFDeviceSetupAppleTVSession

- (SFDeviceSetupAppleTVSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)SFDeviceSetupAppleTVSession;
  v2 = [(SFDeviceSetupAppleTVSession *)&v10 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_proxSetupActiveToken = -1;
    uint64_t v6 = objc_opt_new();
    sessionID = v3->_sessionID;
    v3->_sessionID = (NSUUID *)v6;

    *(void *)&v3->_numberOfAppleTVsOnAccount = -1;
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupAppleTVSession *)FatalErrorF();
    [(SFDeviceSetupAppleTVSession *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupAppleTVSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupAppleTVSession;
    [(SFDeviceSetupAppleTVSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int proxSetupActiveToken = self->_proxSetupActiveToken;
  if (proxSetupActiveToken != -1)
  {
    notify_set_state(proxSetupActiveToken, 0);
    notify_post("com.apple.sharing.wha-prox-setup");
    notify_cancel(self->_proxSetupActiveToken);
    self->_int proxSetupActiveToken = -1;
  }
  [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = self->_trOperations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "cancel", (void)v26);
        [v12 setCompletionBlock:0];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  [(NSMutableArray *)self->_trOperations removeAllObjects];
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  [(TRSession *)self->_trSession setDisconnectHandler:0];
  [(TRSession *)self->_trSession disconnect];
  trSession = self->_trSession;
  self->_trSession = 0;

  [(TVLAudioLatencyEstimator *)self->_tvLatencyEstimator invalidate];
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    id v21 = self->_progressHandler;
  }
  else
  {
    id v21 = 0;
  }
  self->_progressHandler = 0;

  id promptForHomeHandler = self->_promptForHomeHandler;
  self->_id promptForHomeHandler = 0;

  id promptForHomeiCloudHandler = self->_promptForHomeiCloudHandler;
  self->_id promptForHomeiCloudHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id promptForRoomHandler = self->_promptForRoomHandler;
  self->_id promptForRoomHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceSetupAppleTVSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __39__SFDeviceSetupAppleTVSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = [(Class)getHMHomeManagerConfigurationClass_0[0]() defaultPrivateConfiguration];
  uint64_t v3 = [objc_alloc((Class)getHMHomeManagerClass_1[0]()) initWithHomeMangerConfiguration:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v3;

  notify_register_check("com.apple.sharing.wha-prox-setup", (int *)(*(void *)(a1 + 32) + 20));
  notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 20), 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  *(unsigned char *)(*(void *)(a1 + 32) + 124) = _os_feature_enabled_impl();
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 153) = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 154) = CFPrefs_GetInt64() != 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 154)) {
    *(unsigned char *)(v6 + 153) = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 400) = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = CFPrefs_GetInt64() != 0;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[67];
  if (v8)
  {
    (*(void (**)(void, uint64_t, void))(v8 + 16))(v7[67], 10, 0);
    v7 = *(void **)(a1 + 32);
  }
  [v7 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupAppleTVSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupAppleTVSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16)
    && gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  [*(id *)(a1 + 32) _runFinish:1];
  v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)homeiCloudEnable
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceSetupAppleTVSession_homeiCloudEnable__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFDeviceSetupAppleTVSession_homeiCloudEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)homeKitSelectHome:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SFDeviceSetupAppleTVSession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__SFDeviceSetupAppleTVSession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) selectHome:*(void *)(a1 + 40)];
}

- (void)captiveConfirmed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceSetupAppleTVSession_captiveConfirmed__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFDeviceSetupAppleTVSession_captiveConfirmed__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)switchToManualAuth
{
  if (self->_pairSetupState == 1)
  {
    self->_pairSetupState = 0;
    [(SFDeviceSetupAppleTVSession *)self _runPairSetupWithFlags:0];
  }
}

- (void)homeKitSelectRoom:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SFDeviceSetupAppleTVSession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__SFDeviceSetupAppleTVSession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) selectRoom:*(void *)(a1 + 40)];
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SFDeviceSetupAppleTVSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__SFDeviceSetupAppleTVSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_reportError:(id)a3 label:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    id v23 = v9;
    id v24 = v8;
    LogPrintF();
  }
  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    id v23 = v9;
    id v24 = v8;
    FPrintF();
  }
  if (self->_userWaitSeconds == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_userWaitSeconds = v10;
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    long long v29 = @"eo";
    v12 = v8;
    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28760];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v4 = (void *)v15;
      v16 = @"?";
      if (v15) {
        v16 = (__CFString *)v15;
      }
      long long v28 = v16;
      objc_super v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v23, v24);
      v12 = [v13 errorWithDomain:v14 code:-6700 userInfo:v5];
    }
    v30[0] = v12;
    v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1, v23, v24);
    progressHandler[2](progressHandler, 30, v17);

    if (!v8)
    {
    }
  }
  if (!self->_metricsReported)
  {
    self->_metricsReported = 1;
    [(SFDeviceSetupAppleTVSession *)self _reportMainMetrics:v8 errorLabel:v9 userWaitSeconds:self->_userWaitSeconds];
    [(SFDeviceSetupAppleTVSession *)self _reportErrorMetrics:v8 errorLabel:v9 isFatal:[(SFDeviceSetupAppleTVSession *)self _isPreflightError:v8] ^ 1];
  }
  v26[0] = v9;
  v25[0] = @"label";
  v25[1] = @"errDomain";
  uint64_t v18 = objc_msgSend(v8, "domain", v23, v24);
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"?";
  }
  v26[1] = v20;
  v25[2] = @"errCode";
  id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
  v26[2] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  SFMetricsLog(@"com.apple.sharing.AppleTVSetupResult", v22);
}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6) {
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);
  }
}

- (BOOL)_shouldSkipHomeKitSetup
{
  int v3 = [(HMHomeManager *)self->_homeManager hasOptedToHH2];
  if (v3) {
    LOBYTE(v3) = (self->_peerFeatureFlags & 0x800) == 0;
  }
  return v3;
}

- (void)_run
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    id v23 = [(SFSession *)self->_sfSession identifier];
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(SFDeviceSetupAppleTVSession *)self _runPreflightWiFi];
    if (v3 == 4 || v3 == 2)
    {
      int v4 = [(SFDeviceSetupAppleTVSession *)self _runCaptivePrompt];
      if (v4 == 4 || v4 == 2)
      {
        if (self->_appleIDSetupEnabled
          || (int v18 = [(SFDeviceSetupAppleTVSession *)self _runPreflightiTunes], v18 == 4)
          || v18 == 2)
        {
          int v5 = [(SFDeviceSetupAppleTVSession *)self _runPreflightHomeKit];
          if (v5 == 4 || v5 == 2)
          {
            if (!self->_useSFSession && !self->_isCLIMode
              || ((int v6 = [(SFDeviceSetupAppleTVSession *)self _runSFSessionStart], v6 == 4)
               || v6 == 2)
              && ((int v7 = [(SFDeviceSetupAppleTVSession *)self _runPreAuth], v7 == 4) || v7 == 2)
              && ((int v8 = [(SFDeviceSetupAppleTVSession *)self _runPairSetupWithFlags:0],
                   v8 == 4)
               || v8 == 2)
              && (!self->_homeKitDoFullSetup && !self->_isCLIMode
               || (int v9 = [(SFDeviceSetupAppleTVSession *)self _runHomeKitUserInput], v9 == 4)
               || v9 == 2)
              && ((int v10 = [(SFDeviceSetupAppleTVSession *)self _runBasicConfig], v10 == 4) || v10 == 2))
            {
              int v11 = [(SFDeviceSetupAppleTVSession *)self _runTRSessionStart];
              if (v11 == 4 || v11 == 2)
              {
                int v12 = [(SFDeviceSetupAppleTVSession *)self _runTRSetupConfiguration];
                int v13 = v12;
                if (v12 == 4 || v12 == 2)
                {
                  if (!SFDeviceIsVirtualMachine()) {
                    int v13 = [(SFDeviceSetupAppleTVSession *)self _runWiFiSetup];
                  }
                  if (v13 == 4 || v13 == 2)
                  {
                    if (!self->_doCaptiveJoin
                      || (int v14 = [(SFDeviceSetupAppleTVSession *)self _runCaptiveJoin], v14 == 4)
                      || v14 == 2)
                    {
                      int v15 = [(SFDeviceSetupAppleTVSession *)self _runTRActivation];
                      if (v15 == 4 || v15 == 2)
                      {
                        if (self->_appleIDSetupEnabled && (self->_peerFeatureFlags & 0x8000) != 0)
                        {
                          int v19 = [(SFDeviceSetupAppleTVSession *)self _runAppleIDSetup];
                          if (v19 != 2 && v19 != 4) {
                            return;
                          }
                        }
                        else
                        {
                          int v16 = [(SFDeviceSetupAppleTVSession *)self _runTRAuthentication];
                          if (v16 != 4 && v16 != 2) {
                            return;
                          }
                          if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                          {
                            int v17 = [(SFDeviceSetupAppleTVSession *)self _runCDPSetup];
                            if (v17 != 4 && v17 != 2) {
                              return;
                            }
                          }
                        }
                        if ((!self->_useSFSession || !self->_homeKitDoKeyExchange && !self->_homeKitDoFullSetup)
                          && !self->_isCLIMode
                          || (int v20 = [(SFDeviceSetupAppleTVSession *)self _runHomeKitSetup], v20 == 4)
                          || v20 == 2)
                        {
                          if (!self->_tvLatencyEnabled
                            || (self->_peerFeatureFlags & 0x40) == 0
                            || (int v21 = [(SFDeviceSetupAppleTVSession *)self _runTVLatencySetup],
                                v21 == 4)
                            || v21 == 2)
                          {
                            int v22 = [(SFDeviceSetupAppleTVSession *)self _runTRCompletion];
                            if (v22 == 4 || v22 == 2)
                            {
                              [(SFDeviceSetupAppleTVSession *)self _runFinish:0];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runPreflightWiFi
{
  int preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2) {
    return self->_preflightWiFiState;
  }
  if (preflightWiFiState)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightWiFiState;
  }
  if (self->_isCLIMode && IsAppleInternalBuild()) {
    FPrintF();
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  int v6 = CFDictionaryGetTypedValue();
  if (v6 || SFDeviceIsVirtualMachine())
  {
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    if (CFDictionaryGetInt64())
    {
      int v8 = NSErrorWithOSStatusF();
      if (v8)
      {
        self->_int preflightWiFiState = 3;
        [(SFDeviceSetupAppleTVSession *)self _reportError:v8 label:@"PreflightWiFi"];
      }
    }
    else
    {
      int v8 = 0;
    }
    self->_wifiIsCaptive = CFDictionaryGetInt64() != 0;
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v11 = "UnshareableMDM";
    switch(Int64Ranged)
    {
      case 0:
      case 1:
      case 5:
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_int preflightWiFiState = 4;

        return self->_preflightWiFiState;
      case 2:
        break;
      case 3:
        int v11 = "UnshareableCarrier";
        break;
      case 4:
        int v11 = "UnshareableUnsupportedEAP";
        break;
      case 6:
        int v11 = "UnsupportedProfileBased";
        break;
      case 7:
        int v11 = "UnshareableEAPShareBlockedByProfile";
        break;
      case 8:
        int v11 = "UnshareableThirdPartySource";
        break;
      case 9:
        int v11 = "NetworkRequiresOneTimePassword";
        break;
      default:
        int v11 = "?";
        break;
    }
    int v14 = v11;
    int v12 = NSErrorWithOSStatusF();

    self->_int preflightWiFiState = 3;
    [(SFDeviceSetupAppleTVSession *)self _reportError:v12, @"PreflightWiFi", v14 label];
    int v10 = self->_preflightWiFiState;
  }
  else
  {
    int v9 = NSErrorWithOSStatusF();
    [(SFDeviceSetupAppleTVSession *)self _reportError:v9 label:@"PreflightWiFi"];

    int v10 = 3;
    self->_int preflightWiFiState = 3;
  }

  return v10;
}

- (int)_runPreflightiTunes
{
  int preflightiTunesState = self->_preflightiTunesState;
  if (preflightiTunesState != 4 && preflightiTunesState != 2)
  {
    if (preflightiTunesState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int preflightiTunesState = 1;
      int v5 = [(Class)getSSAccountStoreClass_1[0]() defaultStore];
      int v6 = [v5 activeAccount];

      if (v6)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v7 = [v6 accountName];
        iTunesUserID = self->_iTunesUserID;
        self->_iTunesUserID = v7;

        int v9 = 4;
      }
      else
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v9 = 2;
      }
      self->_int preflightiTunesState = v9;
    }
  }
  return self->_preflightiTunesState;
}

- (int)_runPreflightHomeKit
{
  int preflightHomeKitState = self->_preflightHomeKitState;
  HIDWORD(v5) = preflightHomeKitState;
  LODWORD(v5) = preflightHomeKitState;
  int v4 = v5 >> 1;
  if ((v4 - 1) < 2) {
    return self->_preflightHomeKitState;
  }
  if (v4 == 5)
  {
    if (self->_homeiCloudEnabled)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFDeviceSetupAppleTVSession *)self _homeKitUpdateiCloudSwitchState:1];
      self->_int preflightHomeKitState = 4;
      return self->_preflightHomeKitState;
    }
    if (preflightHomeKitState == 2 || preflightHomeKitState == 4) {
      return self->_preflightHomeKitState;
    }
LABEL_24:
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightHomeKitState;
  }
  if (v4) {
    goto LABEL_24;
  }
  if (self->_isCLIMode && IsAppleInternalBuild()) {
    FPrintF();
  }
  id v6 = objc_alloc_init((Class)getACAccountStoreClass_4[0]());
  int v7 = objc_msgSend(v6, "aa_primaryAppleAccount");
  int v8 = v7;
  if (!v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v10 = 2;
    self->_int preflightHomeKitState = 2;
    goto LABEL_38;
  }
  if ([v7 isEnabledForDataclass:*MEMORY[0x1E4F17AC0]]) {
    goto LABEL_41;
  }
  if (!self->_promptForHomeiCloudHandler)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFDeviceSetupAppleTVSession *)self _homeKitUpdateiCloudSwitchState:1];
LABEL_41:
    self->_int preflightHomeKitState = 4;

    return self->_preflightHomeKitState;
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_int preflightHomeKitState = 10;
  (*((void (**)(void))self->_promptForHomeiCloudHandler + 2))();
  int v10 = self->_preflightHomeKitState;
LABEL_38:

  return v10;
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      unint64_t v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"AppleTVSetup"];
      [(SFSession *)self->_sfSession setPairSetupACL:&unk_1EFA09B98];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.AppleTVSetup"];
      [(SFSession *)self->_sfSession setSessionFlags:4097];
      [(SFSession *)self->_sfSession setTouchRemoteEnabled:1];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke;
      v14[3] = &unk_1E5BBC8E8;
      v14[4] = self;
      [(SFSession *)self->_sfSession setErrorHandler:v14];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_2;
      v13[3] = &unk_1E5BBC870;
      v13[4] = self;
      [(SFSession *)self->_sfSession setInterruptionHandler:v13];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_3;
      v12[3] = &unk_1E5BBC870;
      v12[4] = self;
      [(SFSession *)self->_sfSession setInvalidationHandler:v12];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_4;
      v11[3] = &unk_1E5BBE590;
      v11[4] = self;
      [(SFSession *)self->_sfSession setPromptForPINHandler:v11];
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 35, 0);
      }
      int v8 = self->_sfSession;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_5;
      v10[3] = &unk_1E5BBC8E8;
      v10[4] = self;
      [(SFSession *)v8 activateWithCompletion:v10];
    }
  }
  return self->_sfSessionState;
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reportError:a2 label:@"SFSessionError"];
}

void __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
  unint64_t v5 = (void *)v4;
  id v6 = @"?";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v10[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = [v2 errorWithDomain:v3 code:-6762 userInfo:v7];
  [v1 _reportError:v8 label:@"SFSessionInterruption"];
}

void __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16) && *(void *)(v1 + 56))
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F28760];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
    unint64_t v5 = (void *)v4;
    id v6 = @"?";
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    v10[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    int v8 = [v2 errorWithDomain:v3 code:-6736 userInfo:v7];
    [(id)v1 _reportError:v8 label:@"SFSessionInvalidation"];
  }
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    int v11 = &unk_1A56EAEDB;
    uint64_t v12 = a3;
    uint64_t v10 = a2;
    LogPrintF();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 497))
  {
    int v7 = IsAppleInternalBuild();
    uint64_t v6 = *(void *)(a1 + 32);
    if (v7)
    {
      if (*(void *)(v6 + 584))
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pairSetupTryPIN:", *(void *)(*(void *)(a1 + 32) + 584), v10, v11, v12);
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
  }
  uint64_t result = *(void *)(v6 + 560);
  if (result)
  {
    uint64_t v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 64) = 3;
    return [*(id *)(a1 + 32) _reportError:a2 label:@"SFSessionActivate"];
  }
  else
  {
    *(_DWORD *)(v2 + 64) = 4;
    return [*(id *)(a1 + 32) _run];
  }
}

- (int)_runPreAuth
{
  int preAuthState = self->_preAuthState;
  if (preAuthState != 4 && preAuthState != 2)
  {
    if (preAuthState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int preAuthState = 1;
      [(SFDeviceSetupAppleTVSession *)self _runPreAuthRequest];
    }
  }
  return self->_preAuthState;
}

- (void)_runPreAuthRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  unint64_t v5 = [v4 firstObject];

  if (v5)
  {
    [v3 setObject:v5 forKeyedSubscript:@"lang"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"langs"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  int v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v8 = [v7 localeIdentifier];

  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"locale"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v9 = [NSNumber numberWithUnsignedChar:softLink_AXSVoiceOverTouchEnabled[0]()];
  [v3 setObject:v9 forKeyedSubscript:@"voe"];

  uint64_t v10 = NSNumber;
  softLink_AXSVoiceOverTouchSpeakingRate();
  int v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"vosr"];

  uint64_t v12 = [(Class)getAXSettingsClass[0]() sharedInstance];
  int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "touchAccommodationsHoldDurationEnabled"));
  [v3 setObject:v13 forKeyedSubscript:@"taHE"];

  int v14 = NSNumber;
  [v12 touchAccommodationsHoldDuration];
  int v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:@"taHD"];

  int v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "touchAccommodationsIgnoreRepeatEnabled"));
  [v3 setObject:v16 forKeyedSubscript:@"taIRE"];

  int v17 = NSNumber;
  [v12 touchAccommodationsIgnoreRepeatDuration];
  int v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"taIRD"];

  int v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "touchAccommodationsTapActivationMethod"));
  [v3 setObject:v19 forKeyedSubscript:@"taTAM"];

  int v20 = NSNumber;
  [v12 touchAccommodationsTapActivationTimeout];
  int v21 = objc_msgSend(v20, "numberWithDouble:");
  [v3 setObject:v21 forKeyedSubscript:@"taTAT"];

  int v22 = NSNumber;
  [v12 voiceOverDoubleTapInterval];
  id v23 = objc_msgSend(v22, "numberWithDouble:");
  [v3 setObject:v23 forKeyedSubscript:@"vodti"];

  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v26 = v3;
      LogPrintF();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_forcedPasscode, @"forcedPin", v26);
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isCLIMode"];
  }
  id v24 = [NSNumber numberWithUnsignedChar:SFDeviceClassCodeGet()];
  [v3 setObject:v24 forKeyedSubscript:@"dclass"];

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    id v26 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__SFDeviceSetupAppleTVSession__runPreAuthRequest__block_invoke;
  v27[3] = &unk_1E5BBCBF8;
  v27[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_pa", &unk_1EFA09BC0, v3, v27, v26 options request responseHandler];
}

uint64_t __49__SFDeviceSetupAppleTVSession__runPreAuthRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runPreAuthResponse:a4 error:a2];
}

- (void)_runPreAuthResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (!v6 || v7)
  {
    self->_int preAuthState = 3;
    if (v7)
    {
      [(SFDeviceSetupAppleTVSession *)self _reportError:v7 label:@"PreAuth"];
    }
    else
    {
      uint64_t v9 = NSErrorWithOSStatusF();
      [(SFDeviceSetupAppleTVSession *)self _reportError:v9 label:@"PreAuth"];
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v13 = v6;
      LogPrintF();
    }
    self->_peerFeatureFlags = CFDictionaryGetInt64();
    CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_appleTVModelNumber, v10);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      id v13 = 0;
      LogPrintF();
    }
    CFStringGetTypeID();
    int v11 = CFDictionaryGetTypedValue();

    if (v11)
    {
      objc_storeStrong((id *)&self->_appleTVModel, v11);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      id v13 = 0;
      LogPrintF();
    }
    CFStringGetTypeID();
    uint64_t v12 = CFDictionaryGetTypedValue();

    if (v12)
    {
      objc_storeStrong((id *)&self->_appleTVBuild, v12);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      id v13 = 0;
      LogPrintF();
    }
    self->_int preAuthState = 4;
    [(SFDeviceSetupAppleTVSession *)self _run];
  }
}

- (int)_runPairSetupWithFlags:(unsigned int)a3
{
  int pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4 && pairSetupState != 2)
  {
    if (pairSetupState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      self->_int pairSetupState = 1;
      uint64_t v7 = mach_absolute_time();
      if (self->_isCLIMode && self->_forcedPasscode)
      {
        [(SFSession *)self->_sfSession setIsCLIMode:1];
        [(SFSession *)self->_sfSession setForcedPasscode:self->_forcedPasscode];
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__SFDeviceSetupAppleTVSession__runPairSetupWithFlags___block_invoke;
      v11[3] = &unk_1E5BC0548;
      v11[4] = self;
      void v11[5] = v7;
      [(SFSession *)sfSession pairSetupWithFlags:a3 | 0x80008 completion:v11];
    }
  }
  return self->_pairSetupState;
}

void __54__SFDeviceSetupAppleTVSession__runPairSetupWithFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v7 = v3;
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 88) = v4;
    if (v7)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 80) = 3;
      [*(id *)(a1 + 32) _reportError:v7 label:@"PairSetup"];
    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 80) = 4;
      unint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[67];
      if (v6)
      {
        (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[67], 70, 0);
        unint64_t v5 = *(void **)(a1 + 32);
      }
      [v5 _run];
    }
    id v3 = v7;
  }
}

- (int)_runHomeKitUserInput
{
  int homeKitUserInputState = self->_homeKitUserInputState;
  if (homeKitUserInputState != 4)
  {
    if (homeKitUserInputState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int homeKitUserInputState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 230, 0);
      }
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
      unint64_t v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setUserInteractive:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPauseAfterUserInput:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTimeoutInSeconds:120.0];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setIsCLIMode:self->_isCLIMode];
      if (self->_promptForHomeHandler) {
        -[SFDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetupOperation, "setPromptForHomeHandler:");
      }
      if (self->_promptForRoomHandler) {
        -[SFDeviceOperationHomeKitSetup setPromptForRoomHandler:](self->_homeKitSetupOperation, "setPromptForRoomHandler:");
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke;
      v9[3] = &unk_1E5BBC870;
      v9[4] = self;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setPauseHandler:v9];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke_2;
      v8[3] = &unk_1E5BBC8E8;
      v8[4] = self;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation activate];
    }
  }
  return self->_homeKitUserInputState;
}

uint64_t __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) homeKitSelectedRoomName];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 168) = 4;
  unint64_t v5 = *(void **)(a1 + 32);

  return [v5 _run];
}

void __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 160))
  {
    if (!v3)
    {
      NSErrorWithOSStatusF();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = *(void *)(a1 + 32);
    }
    id v5 = v3;
    *(_DWORD *)(v4 + 168) = 3;
    [*(id *)(a1 + 32) _reportError:v3 label:@"HomeKitUserInput"];
    id v3 = v5;
  }
}

- (int)_runBasicConfig
{
  int basicConfigState = self->_basicConfigState;
  if (basicConfigState != 4 && basicConfigState != 2)
  {
    if (basicConfigState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int basicConfigState = 1;
      self->_startUserWaitTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 80, 0);
      }
      [(SFDeviceSetupAppleTVSession *)self _runBasicConfigRequest];
    }
  }
  return self->_basicConfigState;
}

- (void)_runBasicConfigRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = SFDeviceSetupDeviceInfo();
  v48 = (void *)v4;
  if (v4)
  {
    [v3 addEntriesFromDictionary:v4];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE8]] == 1;

  id v7 = [NSNumber numberWithBool:v6];
  [v3 setObject:v7 forKeyedSubscript:@"eca"];

  int v8 = [MEMORY[0x1E4F74230] sharedConnection];
  int v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]];

  if ((v9 - 1) <= 1)
  {
    uint64_t v10 = [NSNumber numberWithBool:v9 == 1];
    [v3 setObject:v10 forKeyedSubscript:@"dsub"];
  }
  int v11 = [MEMORY[0x1E4F74230] sharedConnection];
  int v12 = [v11 effectiveBoolValueForSetting:*MEMORY[0x1E4F73EE8]];

  if ((v12 - 1) <= 1)
  {
    id v13 = [NSNumber numberWithBool:v12 == 1];
    [v3 setObject:v13 forKeyedSubscript:@"aasub"];
  }
  int v14 = SFDeviceSetupHomeKitInfo(self->_homeManager);
  if ([(SFDeviceSetupAppleTVSession *)self _shouldSkipHomeKitSetup])
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v15 = [v14 objectForKeyedSubscript:@"hkcuis"];
    if ([v15 count])
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"hkcuis"];
      [v3 setObject:v16 forKeyedSubscript:@"hkin"];
    }
  }
  else if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:@"hkin"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  int v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((Class)getCLLocationManagerClass_0[0](), "locationServicesEnabled"));
  [v3 setObject:v17 forKeyedSubscript:@"lsEn"];

  int v18 = SFDeviceSetupAppleTVLocationAuthorizationInfo();
  if (v18)
  {
    [v3 setObject:v18 forKeyedSubscript:@"lsAI"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  int v19 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  int v20 = [v19 firstObject];

  if (v20)
  {
    [v3 setObject:v20 forKeyedSubscript:@"lang"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  if (_os_feature_enabled_impl())
  {
    int v21 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"langs"];
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    int v50 = 0;
    CFArrayGetTypeID();
    uint64_t v22 = CFPrefs_CopyTypedValue();
    id v23 = (void *)v22;
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"kbs"];
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  id v24 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", v46);
  v25 = [v24 localeIdentifier];

  if (v25)
  {
    [v3 setObject:v25 forKeyedSubscript:@"locale"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v26 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v27 = [v26 objectForKey:*MEMORY[0x1E4F1C478]];

  if (v27)
  {
    [v3 setObject:v27 forKeyedSubscript:@"tempUnit"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  Class v28 = (Class)getOBBundleClass[0]();
  long long v29 = [(objc_class *)v28 bundleWithIdentifier:getOBPrivacyPrivacyPaneIdentifier[0]()];
  v30 = [v29 privacyFlow];
  uint64_t v31 = [v30 contentVersion];

  if (v31)
  {
    v32 = [NSNumber numberWithUnsignedInteger:v31];
    [v3 setObject:v32 forKeyedSubscript:@"pfcv"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v33 = [(Class)getAFPreferencesClass_0[0]() sharedPreferences];
  v34 = v33;
  if (v33)
  {
    v35 = SFDeviceSetupSiriInfo(v33);
    if (v35)
    {
      [v3 addEntriesFromDictionary:v35];
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v36 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setObject:v36 forKeyedSubscript:@"time"];

  CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  if (CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0))
  {
    uint64_t v38 = 12;
  }
  else if (CFPreferencesGetAppBooleanValue(@"AppleICUForce24HourTime", v37, 0))
  {
    uint64_t v38 = 24;
  }
  else
  {
    uint64_t v38 = 0;
  }
  v39 = [NSNumber numberWithInteger:v38];
  [v3 setObject:v39 forKeyedSubscript:@"timeCycle"];

  v40 = [NSNumber numberWithBool:softLinkTMIsAutomaticTimeEnabled[0]() != 0];
  [v3 setObject:v40 forKeyedSubscript:@"timeAuto"];

  v41 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v42 = [v41 name];

  if (v42)
  {
    [v3 setObject:v42 forKeyedSubscript:@"tz"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v43 = [NSNumber numberWithBool:softLinkTMIsAutomaticTimeZoneEnabled[0]() != 0];
  [v3 setObject:v43 forKeyedSubscript:@"tzAuto"];

  v44 = [(SFDeviceSetupAppleTVSession *)self _videoSubscriberAccountData];
  if (v44) {
    [v3 setObject:v44 forKeyedSubscript:@"vsad"];
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    id v47 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __53__SFDeviceSetupAppleTVSession__runBasicConfigRequest__block_invoke;
  v49[3] = &unk_1E5BBCBF8;
  v49[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_bc", 0, v3, v49, v47 options request responseHandler];
}

uint64_t __53__SFDeviceSetupAppleTVSession__runBasicConfigRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runBasicConfigResponse:a4 error:a2];
}

- (void)_runBasicConfigResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  int v13 = 0;
  if (v6 && !v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v11 = v6;
      LogPrintF();
    }
    id v12 = 0;
    BOOL v10 = [(SFDeviceSetupAppleTVSession *)self _verifyiCloudMatch:CFDictionaryGetInt64() error:&v12];
    id v9 = v12;
    self->_iCloudAccountMatches = v10;
    if (v9
      && gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v11 = v9;
      LogPrintF();
    }
    self->_int basicConfigState = 4;
    [(SFDeviceSetupAppleTVSession *)self _run];
    goto LABEL_16;
  }
  self->_int basicConfigState = 3;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(SFDeviceSetupAppleTVSession *)self _reportError:v9 label:@"BasicConfig"];
LABEL_16:

    goto LABEL_17;
  }
  [(SFDeviceSetupAppleTVSession *)self _reportError:v7 label:@"BasicConfig"];
LABEL_17:
}

- (int)_runTRSessionStart
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (self->_isCLIMode && IsAppleInternalBuild()) {
    FPrintF();
  }
  int trSessionState = self->_trSessionState;
  if (trSessionState != 4 && trSessionState != 2)
  {
    if (!trSessionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trSessionState = 1;
      id v5 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_2[0]());
      trOperationQueue = self->_trOperationQueue;
      self->_trOperationQueue = v5;

      if (!self->_trOperationQueue)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 90
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_56;
        }
        goto LABEL_38;
      }
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      trOperations = self->_trOperations;
      self->_trOperations = v7;

      if (self->_useSFSession || self->_isCLIMode)
      {
        id v9 = [(SFSession *)self->_sfSession trSession];
        trSession = self->_trSession;
        self->_trSession = v9;

        if (self->_trSession)
        {
          if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
            && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          self->_int trSessionState = 4;
          return self->_trSessionState;
        }
        if (gLogCategory_SFDeviceSetupAppleTVSession > 90
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_56;
        }
LABEL_38:
        LogPrintF();
LABEL_56:
        int v20 = -6700;
LABEL_57:
        self->_int trSessionState = 3;
        int v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28760];
        uint64_t v23 = v20;
        uint64_t v30 = *MEMORY[0x1E4F28568];
        uint64_t v24 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v25 = (void *)v24;
        id v26 = @"?";
        if (v24) {
          id v26 = (__CFString *)v24;
        }
        v31[0] = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        Class v28 = [v21 errorWithDomain:v22 code:v23 userInfo:v27];
        [(SFDeviceSetupAppleTVSession *)self _reportError:v28 label:@"TRSessionStart"];

        return self->_trSessionState;
      }
      id v12 = self->_peerDevice;
      if (!v12)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v20 = -6745;
        goto LABEL_57;
      }
      int v13 = v12;
      int v14 = (void *)[objc_alloc((Class)getTRNearbyDeviceClass[0]()) initWithRepresentedDevice:v12 supportedService:1];
      if (v14)
      {
        int v15 = (TRSession *)[objc_alloc((Class)getTRSessionClass[0]()) initWithNearbyDevice:v14];
        int v16 = self->_trSession;
        self->_trSession = v15;

        if (self->_trSession)
        {
          id v17 = objc_alloc_init((Class)getTRNearbyDeviceScannerClass[0]());
          if (v17)
          {
            int v18 = v17;
            int v19 = self->_trSession;
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke;
            v29[3] = &unk_1E5BBD7E8;
            v29[4] = self;
            [v17 openSession:v19 withCompletion:v29];

            return self->_trSessionState;
          }
          if (gLogCategory_SFDeviceSetupAppleTVSession > 90
            || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_55;
          }
        }
        else if (gLogCategory_SFDeviceSetupAppleTVSession > 90 {
               || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        }
        {
          goto LABEL_55;
        }
      }
      else if (gLogCategory_SFDeviceSetupAppleTVSession > 90 {
             || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
      }
      {
        goto LABEL_55;
      }
      LogPrintF();
LABEL_55:

      goto LABEL_56;
    }
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_trSessionState;
}

void __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 504);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke_2;
  block[3] = &unk_1E5BC0128;
  char v11 = a2;
  block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 208))
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 48))
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(v2 + 32) + 204) = 4;
      id v5 = *(void **)(v2 + 32);
      return [v5 _run];
    }
    else
    {
      *(_DWORD *)(v1 + 204) = 3;
      id v3 = *(void **)(result + 32);
      uint64_t v4 = *(void *)(v2 + 40);
      return [v3 _reportError:v4 label:@"TRSessionOpen"];
    }
  }
  return result;
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4 && trSetupConfigurationState != 2)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trSetupConfigurationState = 1;
      self->_trSetupConfigurationStartTicks = mach_absolute_time();
      id v5 = (void *)[objc_alloc((Class)getTRSetupConfigurationOperationClass[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke;
      v8[3] = &unk_1E5BBBD18;
      v8[4] = self;
      id v9 = v5;
      id v6 = v5;
      [v6 setCompletionBlock:v8];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v6];
    }
  }
  return self->_trSetupConfigurationState;
}

void __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 504);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 248) = v2;
    id v13 = [*(id *)(a1 + 40) result];
    if (v13)
    {
      getTRSetupConfigurationOperationNeedsNetworkKey[0]();
      *(unsigned char *)(*(void *)(a1 + 32) + 256) = CFDictionaryGetInt64() != 0;
      getTRSetupConfigurationOperationUnauthenticatedServicesKey[0]();
      CFSetGetTypeID();
      uint64_t v3 = CFDictionaryGetTypedValue();
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 264);
      *(void *)(v4 + 264) = v3;

      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = "yes";
        if (!*(unsigned char *)(v6 + 256)) {
          id v7 = "no";
        }
        char v11 = v7;
        uint64_t v12 = *(void *)(v6 + 264);
        uint64_t v10 = *(void *)(v6 + 248);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 232) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v10, v11, v12);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 232) = 3;
      id v8 = *(void **)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) error];
      [v8 _reportError:v9 label:@"TRSetupConfig"];
    }
  }
}

- (int)_runTRNetwork
{
  int trNetworkState = self->_trNetworkState;
  if (trNetworkState != 4 && trNetworkState != 2)
  {
    if (trNetworkState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_trNeedsNetwork)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trNetworkState = 1;
      self->_trNetworkStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 200, 0);
      }
      uint64_t v6 = (void *)[objc_alloc((Class)getTRNetworkOperationClass[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke;
      v9[3] = &unk_1E5BBBD18;
      v9[4] = self;
      id v10 = v6;
      id v7 = v6;
      [v7 setCompletionBlock:v9];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v7];
    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trNetworkState = 2;
    }
  }
  return self->_trNetworkState;
}

void __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 504);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 328) = v2;
    id v5 = [*(id *)(a1 + 40) result];
    getTRNetworkOperationHasNetworkKey[0]();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 328);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 296) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 296) = 3;
      uint64_t v3 = [*(id *)(a1 + 40) error];
      if (!v3)
      {
        uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UserErrorDomain" code:301021 userInfo:0];
      }
      [*(id *)(a1 + 32) _reportError:v3 label:@"TRNetwork"];
    }
  }
}

- (int)_runWiFiSetup
{
  if (SFDeviceIsVirtualMachine())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int wifiSetupState = 2;
  }
  else
  {
    int wifiSetupState = self->_wifiSetupState;
    if (wifiSetupState != 4)
    {
      if (wifiSetupState)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (self->_isCLIMode && IsAppleInternalBuild()) {
          FPrintF();
        }
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_int wifiSetupState = 1;
        progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
        if (progressHandler) {
          progressHandler[2](progressHandler, 200, 0);
        }
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
        id v5 = objc_alloc_init(SFDeviceOperationWiFiSetup);
        wifiSetupOperation = self->_wifiSetupOperation;
        self->_wifiSetupOperation = v5;

        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setDispatchQueue:self->_dispatchQueue];
        if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0) {
          [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSetupFlags:[(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setupFlags] | 1];
        }
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSfSession:self->_sfSession];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSkipReachability:self->_doCaptiveJoin];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setRetryScansCount:2];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setRetryJoinsCount:2];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __44__SFDeviceSetupAppleTVSession__runWiFiSetup__block_invoke;
        v8[3] = &unk_1E5BBC8E8;
        v8[4] = self;
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setCompletionHandler:v8];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation activate];
      }
    }
  }
  return self->_wifiSetupState;
}

void __44__SFDeviceSetupAppleTVSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 312);
  if (v5)
  {
    int v20 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 320) = 3;
      if ([v3 code] == 301009 || objc_msgSend(v20, "code") == 301000)
      {
        [*(id *)(a1 + 32) _reportError:v20 label:@"WiFiSetup"];
      }
      else
      {
        if ([v20 code] != -71157) {
          [v20 code];
        }
        int v15 = NSErrorNestedF();
        [*(id *)(a1 + 32) _reportError:v15 label:@"WiFiSetup"];
      }
    }
    else
    {
      [v5 metricTotalSeconds];
      *(void *)(*(void *)(a1 + 32) + 328) = v6;
      [*(id *)(*(void *)(a1 + 32) + 312) metricWiFiSetupSeconds];
      *(void *)(*(void *)(a1 + 32) + 336) = v7;
      [*(id *)(*(void *)(a1 + 32) + 312) metricBonjourTestSeconds];
      *(void *)(*(void *)(a1 + 32) + 344) = v8;
      *(_DWORD *)(*(void *)(a1 + 32) + 500) = [*(id *)(*(void *)(a1 + 32) + 312) bonjourTestState];
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(v9 + 328);
        uint64_t v11 = *(void *)(v9 + 336);
        uint64_t v12 = *(void *)(v9 + 344);
        uint64_t v13 = *(int *)(v9 + 500);
        if (v13 >= 8)
        {
          if ((int)v13 <= 9) {
            int v14 = "?";
          }
          else {
            int v14 = "User";
          }
        }
        else
        {
          int v14 = off_1E5BC0690[v13];
        }
        int v19 = v14;
        uint64_t v17 = v11;
        uint64_t v18 = v12;
        uint64_t v16 = v10;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 320) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v16, v17, v18, v19);
    }
    id v3 = v20;
  }
}

- (int)_runCaptivePrompt
{
  switch(self->_captivePromptState)
  {
    case 0:
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (!self->_wifiIsCaptive)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 30
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_37;
        }
LABEL_25:
        LogPrintF();
LABEL_37:
        int v3 = 2;
        goto LABEL_38;
      }
      if (!self->_promptForCaptiveNetworkHandler)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 30
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_37;
        }
        goto LABEL_25;
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_captivePromptState = 1;
      (*((void (**)(void))self->_promptForCaptiveNetworkHandler + 2))();
      return self->_captivePromptState;
    case 1:
      if (self->_doCaptiveJoin)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v3 = 4;
LABEL_38:
        self->_captivePromptState = v3;
      }
      else if (gLogCategory_SFDeviceSetupAppleTVSession <= 30 {
             && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      }
      {
LABEL_22:
        LogPrintF();
      }
      return self->_captivePromptState;
    case 2:
    case 4:
      return self->_captivePromptState;
    default:
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_22;
      }
      return self->_captivePromptState;
  }
}

- (int)_runCaptiveJoin
{
  int captiveJoinState = self->_captiveJoinState;
  if (captiveJoinState != 4)
  {
    if (captiveJoinState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_doCaptiveJoin)
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int captiveJoinState = 1;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
      uint64_t v4 = objc_alloc_init(SFDeviceOperationCNJSetup);
      captiveJoin = self->_captiveJoin;
      self->_captiveJoin = v4;

      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setSfSession:self->_sfSession];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setIsSetup:1];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setPresentingViewController:self->_presentingViewController];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setCompletionHandler:v7];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin activate];
    }
    else
    {
      self->_int captiveJoinState = 2;
    }
  }
  return self->_captiveJoinState;
}

void __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 504);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    NSErrorWithOSStatusF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(void *)(a1 + 40) + 280) = 3;
    [*(id *)(a1 + 40) _reportError:v4 label:@"Captive Join"];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 40) + 272) metricTotalSeconds];
    *(void *)(*(void *)(a1 + 40) + 288) = v2;
    *(_DWORD *)(*(void *)(a1 + 40) + 280) = 4;
    id v3 = *(void **)(a1 + 40);
    [v3 _run];
  }
}

- (int)_runTRActivation
{
  int trActivationState = self->_trActivationState;
  if (trActivationState != 4 && trActivationState != 2)
  {
    if (trActivationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trActivationState = 1;
      self->_trActivationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 210, 0);
      }
      id v6 = (void *)[objc_alloc((Class)getTRActivationOperationClass[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke;
      v9[3] = &unk_1E5BBBD18;
      v9[4] = self;
      id v10 = v6;
      id v7 = v6;
      [v7 setCompletionBlock:v9];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v7];
    }
  }
  return self->_trActivationState;
}

void __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 504);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 368) = v2;
    id v5 = [*(id *)(a1 + 40) result];
    getTRActivationOperationIsActivatedKey[0]();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 368);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 356) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 356) = 3;
      id v3 = [*(id *)(a1 + 40) error];
      if (!v3)
      {
        id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UserErrorDomain" code:301003 userInfo:0];
      }
      [*(id *)(a1 + 32) _reportError:v3 label:@"TRActivation"];
    }
  }
}

- (int)_runTRAuthentication
{
  int trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 220, 0);
      }
      id v6 = (void *)[objc_alloc((Class)getTRAuthenticationOperationClass_1[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v6];
      [v6 setTargetedServices:self->_trUnauthServices];
      if (self->_presentingViewController) {
        objc_msgSend(v6, "setPresentingViewController:");
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke;
      v9[3] = &unk_1E5BBBD18;
      v9[4] = self;
      id v10 = v6;
      id v7 = v6;
      [v7 setCompletionBlock:v9];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v7];
    }
  }
  return self->_trAuthenticationState;
}

void __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 504);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 392) = v2;
    id v5 = [*(id *)(a1 + 40) result];
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 392);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 376) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      id v3 = [*(id *)(a1 + 40) error];
      *(_DWORD *)(*(void *)(a1 + 32) + 376) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"TRAuth"];
    }
  }
}

- (int)_runAppleIDSetup
{
  int appleIDSetupState = self->_appleIDSetupState;
  if (appleIDSetupState != 4)
  {
    if (appleIDSetupState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int appleIDSetupState = 1;
      self->_appleIDSetupStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 224, 0);
      }
      [(SFDeviceSetupAppleTVSession *)self _runAppleIDSetupRequest];
    }
  }
  return self->_appleIDSetupState;
}

- (void)_runAppleIDSetupRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"isCLIMode", v3);
    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"isCLIMode", v5);
    }
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    id v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SFDeviceSetupAppleTVSession__runAppleIDSetupRequest__block_invoke;
  v6[3] = &unk_1E5BBCBF8;
  v6[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_appleIDSetup", MEMORY[0x1E4F1CC08], v3, v6, v5 options request responseHandler];
}

uint64_t __54__SFDeviceSetupAppleTVSession__runAppleIDSetupRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runAppleIDSetupResponse:a4 error:a2];
}

- (void)_runAppleIDSetupResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Int64 = CFDictionaryGetInt64();
  if (v6 && !v7 && Int64)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v17 = v6;
      LogPrintF();
    }
    uint64_t v9 = [(SFSession *)self->_sfSession messageSessionTemplate];
    if (v9)
    {
      id v10 = objc_alloc_init(getAISSetupContextClass_0());
      uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F4D8E8]];
      [v10 setRequiredServiceTypes:v11];

      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F4D908], *MEMORY[0x1E4F4D8F8], 0);
      [v10 setDesiredServiceTypes:v12];

      [v10 setShouldBackgroundDesiredServices:1];
      [v10 setLocalRole:1];
      [v10 setRemoteRole:3];
      [v10 setMessageSessionTemplate:v9];
      [v10 setIsPreEstablishedClient:1];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke;
      aBlock[3] = &unk_1E5BC0600;
      aBlock[4] = self;
      uint64_t v13 = _Block_copy(aBlock);
      if (self->_presentingViewController)
      {
        id v14 = (id)[objc_alloc(getAISSetupViewControllerClass()) initWithContext:v10];
        [v14 setReportHandler:v13];
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          id v19 = v14;
          presentingViewController = self->_presentingViewController;
          LogPrintF();
        }
        int v15 = [(UIViewController *)self->_presentingViewController navigationController];
        getUINavigationControllerClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = self->_presentingViewController;

          int v15 = v16;
        }
        if (v15) {
          [v15 pushViewController:v14 animated:1];
        }
        else {
          [(UIViewController *)self->_presentingViewController presentViewController:v14 animated:1 completion:0];
        }
      }
      else
      {
        id v14 = objc_alloc_init(getAISSetupControllerClass_0());
        [v14 setupWithContext:v10 completionHandler:v13];
      }
    }
    else
    {
      NSErrorWithOSStatusF();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        id v18 = v10;
        LogPrintF();
      }
      self->_int appleIDSetupState = 3;
      [(SFDeviceSetupAppleTVSession *)self _reportError:v10, @"AppleIDSetup", v18 label];
    }

    goto LABEL_31;
  }
  self->_int appleIDSetupState = 3;
  if (!v7)
  {
    uint64_t v9 = NSErrorWithOSStatusF();
    [(SFDeviceSetupAppleTVSession *)self _reportError:v9 label:@"AppleIDSetup"];
LABEL_31:

    goto LABEL_32;
  }
  [(SFDeviceSetupAppleTVSession *)self _reportError:v7 label:@"AppleIDSetup"];
LABEL_32:
}

void __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 504);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke_2;
  block[3] = &unk_1E5BBD418;
  block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke_2(void *a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(a1[4] + 144) = v2;
  if (a1[5])
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(a1[4] + 128) = 4;
    id v3 = (void *)a1[4];
    return [v3 _run];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(a1[4] + 128) = 3;
    id v5 = (void *)a1[4];
    uint64_t v6 = a1[6];
    return [v5 _reportError:v6 label:@"AppleIDSetup"];
  }
}

- (int)_runCDPSetup
{
  int cdpState = self->_cdpState;
  if (cdpState != 4)
  {
    if (cdpState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 236, 0);
      }
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
      id v5 = objc_alloc_init(SFDeviceOperationCDPSetup);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v5;

      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSfSession:self->_sfSession];
      if (self->_presentingViewController) {
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__SFDeviceSetupAppleTVSession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E5BBC8E8;
      v8[4] = self;
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation activate];
    }
  }
  return self->_cdpState;
}

void __43__SFDeviceSetupAppleTVSession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 104);
  if (v5)
  {
    id v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 120) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"CDPSetup"];
    }
    else
    {
      [v5 metricSeconds];
      *(void *)(*(void *)(a1 + 32) + 112) = v6;
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 112);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 120) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    id v3 = v8;
  }
}

- (int)_runHomeKitSetup
{
  int homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState == 4 || homeKitSetupState == 2) {
    return self->_homeKitSetupState;
  }
  if (homeKitSetupState)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_homeKitSetupState;
  }
  if ([(SFDeviceSetupAppleTVSession *)self _shouldSkipHomeKitSetup])
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession > 30
      || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  if (self->_iCloudAccountMatches
    || [(NSSet *)self->_trUnauthServices containsObject:&unk_1EFA09698])
  {
    if (self->_isCLIMode && IsAppleInternalBuild()) {
      FPrintF();
    }
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int homeKitSetupState = 1;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 234, 0);
    }
    homeKitSetupOperation = self->_homeKitSetupOperation;
    uint64_t v7 = homeKitSetupOperation;
    if (!homeKitSetupOperation)
    {
      id v8 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      id v9 = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v8;

      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setUserInteractive:0];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setKeyExchangeOnly:1];
      uint64_t v7 = self->_homeKitSetupOperation;
    }
    [(SFDeviceOperationHomeKitSetup *)v7 setPauseHandler:0];
    [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTrSession:self->_trSession];
    [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTimeoutInSeconds:60.0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__SFDeviceSetupAppleTVSession__runHomeKitSetup__block_invoke;
    v12[3] = &unk_1E5BBC8E8;
    v12[4] = self;
    [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v12];
    id v10 = self->_homeKitSetupOperation;
    if (homeKitSetupOperation) {
      [(SFDeviceOperationHomeKitSetup *)v10 resume];
    }
    else {
      [(SFDeviceOperationHomeKitSetup *)v10 activate];
    }
    return self->_homeKitSetupState;
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession > 30
    || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_38;
  }
LABEL_9:
  LogPrintF();
LABEL_38:
  int result = 2;
  self->_int homeKitSetupState = 2;
  return result;
}

void __47__SFDeviceSetupAppleTVSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v4)
  {
    id v16 = v3;
    [v4 metricNonUserSeconds];
    *(void *)(*(void *)(a1 + 32) + 176) = v5;
    uint64_t v6 = *(id **)(a1 + 32);
    uint64_t v7 = [v6[20] homeKitHomeManager];
    id v8 = [v7 homes];
    [v6 _setNumberOfDevicesOnAccount:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    if (v16)
    {
      if (*(unsigned char *)(v9 + 154))
      {
        *(_DWORD *)(v9 + 172) = 3;
        [*(id *)(a1 + 32) _reportError:v16 label:@"HomeKitSetup"];
LABEL_16:
        id v3 = v16;
        goto LABEL_17;
      }
      objc_msgSend((id)v9, "_reportErrorMetrics:errorLabel:isFatal:");
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        id v15 = v16;
        LogPrintF();
      }
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 2;
    }
    else
    {
      uint64_t v10 = [*(id *)(v9 + 160) homeKitSelectedRoomName];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 184);
      *(void *)(v11 + 184) = v10;

      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        id v15 = *(id *)(*(void *)(a1 + 32) + 176);
        LogPrintF();
      }
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 4;
    }
    *(_DWORD *)(v13 + 172) = v14;
    objc_msgSend(*(id *)(a1 + 32), "_run", v15);
    goto LABEL_16;
  }
LABEL_17:
}

- (int)_runTVLatencySetup
{
  int tvLatencySetupState = self->_tvLatencySetupState;
  if (tvLatencySetupState > 3)
  {
    if (tvLatencySetupState == 4) {
      return self->_tvLatencySetupState;
    }
    if (tvLatencySetupState == 11)
    {
      [(SFDeviceSetupAppleTVSession *)self _runTVLatencySetupEstimate];
      return self->_tvLatencySetupState;
    }
LABEL_12:
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_tvLatencySetupState;
  }
  if (tvLatencySetupState)
  {
    if (tvLatencySetupState == 2) {
      return self->_tvLatencySetupState;
    }
    goto LABEL_12;
  }
  if (self->_isCLIMode && IsAppleInternalBuild()) {
    FPrintF();
  }
  [(SFDeviceSetupAppleTVSession *)self _runTVLatencySetupRequest];
  return self->_tvLatencySetupState;
}

- (void)_runTVLatencySetupRequest
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFDeviceSetupAppleTVSession *)self _reportProgress:260 info:0];
  self->_int tvLatencySetupState = 10;
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SFDeviceSetupAppleTVSession__runTVLatencySetupRequest__block_invoke;
  v4[3] = &unk_1E5BBCBF8;
  v4[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_tvlS" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v4];
}

void __56__SFDeviceSetupAppleTVSession__runTVLatencySetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    int v9 = 2;
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      id v10 = v8;
      LogPrintF();
    }
    int v9 = 11;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 416) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_run", v10);
}

- (void)_runTVLatencySetupEstimate
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_int tvLatencySetupState = 12;
  id v3 = [(SFSession *)self->_sfSession messageSessionTemplate];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc((Class)getTVLAudioLatencyEstimatorClass_0[0]()) initWithMessageSession:v3];
    objc_storeStrong((id *)&self->_tvLatencyEstimator, v4);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    int v9 = __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke;
    id v10 = &unk_1E5BBCC48;
    id v11 = self;
    id v12 = v4;
    id v5 = v4;
    [v5 setProgressEventHandler:&v7];
    objc_msgSend(v5, "activate", v7, v8, v9, v10, v11);
    [v5 estimate];
  }
  else
  {
    uint64_t v6 = NSErrorWithOSStatusF();
    [(SFDeviceSetupAppleTVSession *)self _reportError:v6 label:@"TVLatencySetup"];
    self->_int tvLatencySetupState = 3;
  }
}

void __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 504);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke_2;
  v10[3] = &unk_1E5BBCC20;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  uint64_t v14 = a2;
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 408)) {
    return [*(id *)(result + 40) _runTVLatencySetupProgressEvent:*(void *)(result + 56) info:*(void *)(result + 48)];
  }
  return result;
}

- (void)_runTVLatencySetupProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  id v16 = v6;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession != -1 || (v7 = _LogCategory_Initialize(), id v6 = v16, v7))
    {
      unint64_t v14 = a3;
      id v15 = v6;
      LogPrintF();
      id v6 = v16;
    }
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v8 = self;
      uint64_t v9 = 270;
      goto LABEL_8;
    case 1uLL:
      uint64_t v8 = self;
      uint64_t v9 = 277;
LABEL_8:
      -[SFDeviceSetupAppleTVSession _reportProgress:info:](v8, "_reportProgress:info:", v9, v16, v14, v15);
      goto LABEL_14;
    case 2uLL:
      id v10 = self;
      uint64_t v11 = 274;
      goto LABEL_12;
    case 3uLL:
      [(SFDeviceSetupAppleTVSession *)self _reportProgress:272 info:v16];
      uint64_t v12 = self;
      uint64_t v13 = 4;
      goto LABEL_13;
    case 4uLL:
      id v10 = self;
      uint64_t v11 = 276;
LABEL_12:
      -[SFDeviceSetupAppleTVSession _reportProgress:info:](v10, "_reportProgress:info:", v11, v16, v14, v15);
      uint64_t v12 = self;
      uint64_t v13 = 2;
LABEL_13:
      -[SFDeviceSetupAppleTVSession _runTVLatencySetupEnded:](v12, "_runTVLatencySetupEnded:", v13, v14, v15);
LABEL_14:
      id v6 = v16;
      break;
    default:
      break;
  }
}

- (void)_runTVLatencySetupEnded:(int)a3
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    if (a3 >= 8)
    {
      id v5 = "?";
      if (a3 > 9) {
        id v5 = "User";
      }
    }
    else
    {
      id v5 = off_1E5BC0690[a3];
    }
    int v7 = v5;
    LogPrintF();
  }
  [(TVLAudioLatencyEstimator *)self->_tvLatencyEstimator invalidate];
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  if (self->_tvLatencySetupState == 12)
  {
    self->_int tvLatencySetupState = a3;
    [(SFDeviceSetupAppleTVSession *)self _run];
  }
}

- (int)_runTRCompletion
{
  int trCompletionState = self->_trCompletionState;
  if (trCompletionState != 4 && trCompletionState != 2)
  {
    if (trCompletionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trCompletionState = 1;
      self->_trCompletionStartTicks = mach_absolute_time();
      id v5 = (void *)[objc_alloc((Class)getTRCompletionOperationClass[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke;
      v8[3] = &unk_1E5BBBD18;
      v8[4] = self;
      id v9 = v5;
      id v6 = v5;
      [v6 setCompletionBlock:v8];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v6];
    }
  }
  return self->_trCompletionState;
}

void __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 504);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 432) = v2;
    id v5 = [*(id *)(a1 + 40) result];
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 392);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 420) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      id v3 = [*(id *)(a1 + 40) error];
      *(_DWORD *)(*(void *)(a1 + 32) + 420) = 3;
      [*(id *)(a1 + 32) _reportError:v3 label:@"TRCompletion"];
    }
  }
}

- (int)_runFinish:(BOOL)a3
{
  int result = self->_finishState;
  if (!result)
  {
    if (!a3)
    {
      if (self->_isCLIMode && IsAppleInternalBuild()) {
        FPrintF();
      }
      if (self->_userWaitSeconds == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        self->_userWaitSeconds = v5;
      }
      CFPrefs_SetValue();
      notify_post("com.apple.Sharing.prefsChanged");
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 96, 0);
      }
    }
    self->_finishState = 4;
    if (!self->_metricsReported)
    {
      self->_metricsReported = 1;
      [(SFDeviceSetupAppleTVSession *)self _reportMainMetrics:0 errorLabel:@"NoErr" userWaitSeconds:self->_userWaitSeconds];
    }
    [(SFDeviceSetupAppleTVSession *)self _cleanup];
    return self->_finishState;
  }
  return result;
}

- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = (void *)[objc_alloc((Class)getHMHomeManagerClass_1[0]()) initWithOptions:0];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke_2;
  v5[3] = &unk_1E5BC0628;
  char v7 = v3;
  id v6 = v2;
  id v4 = v2;
  [v4 updateiCloudSwitchState:v3 completionHandler:v5];
}

void __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90)
    {
      id v7 = v3;
      if (gLogCategory_SFDeviceSetupAppleTVSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        [*(id *)(a1 + 32) status];
LABEL_7:
        LogPrintF();
        id v4 = v7;
      }
    }
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 30)
  {
    id v7 = 0;
    if (gLogCategory_SFDeviceSetupAppleTVSession != -1) {
      goto LABEL_7;
    }
    int v6 = _LogCategory_Initialize();
    id v4 = 0;
    if (v6) {
      goto LABEL_7;
    }
  }
}

- (id)_videoSubscriberAccountData
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__11;
  id v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  uint64_t v2 = [(Class)getVSAccountSerializationCenterClass[0]() defaultSerializationCenter];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__SFDeviceSetupAppleTVSession__videoSubscriberAccountData__block_invoke;
    v9[3] = &unk_1E5BC0670;
    uint64_t v11 = &v12;
    id v4 = v3;
    id v10 = v4;
    id v5 = (id)[v2 exportDataWithCompletionHandler:v9];
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v4, v6)
      && gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 90 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__SFDeviceSetupAppleTVSession__videoSubscriberAccountData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60 {
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_verifyiCloudMatch:(unint64_t)a3 error:(id *)a4
{
  SFMyAltDSID();
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (const char *)[v7 UTF8String];

  if (v8
    && ([(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"AltDSID" keyLength:16], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    [v10 bytes];
    strlen(v8);
    if (SipHash() == a3)
    {
      BOOL v11 = 0;
      id v12 = 0;
      goto LABEL_5;
    }
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
  }
  BOOL v11 = v12 != 0;
  if (a4 && v12)
  {
    id v12 = v12;
    *a4 = v12;
    BOOL v11 = 1;
  }
LABEL_5:
  BOOL v13 = !v11;

  return v13;
}

- (void)_reportMainMetrics:(id)a3 errorLabel:(id)a4 userWaitSeconds:(double)a5
{
  v41[12] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (__CFString *)a4;
  uint64_t v10 = [v8 code];
  BOOL v11 = [v8 domain];
  id v12 = [v8 underlyingErrors];
  BOOL v13 = [v12 firstObject];
  uint64_t v37 = [v13 code];

  uint64_t v14 = [v8 underlyingErrors];
  id v15 = [v14 firstObject];
  uint64_t v16 = [v15 domain];
  id v17 = (void *)v16;
  id v18 = @"NoUnderlyingError";
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  v39 = v18;

  id v19 = [(NSUUID *)self->_sessionID UUIDString];
  v40[0] = @"AppleTVModel";
  v40[1] = @"AppleTVSetupDeviceBuild";
  appleTVBuild = (__CFString *)self->_appleTVBuild;
  appleTVModel = (__CFString *)self->_appleTVModel;
  if (!appleTVModel) {
    appleTVModel = @"Unknown";
  }
  if (!appleTVBuild) {
    appleTVBuild = @"Unknown";
  }
  v41[0] = appleTVModel;
  v41[1] = appleTVBuild;
  v40[2] = @"errorCode";
  uint64_t v22 = [NSNumber numberWithInteger:v10];
  uint64_t v23 = (void *)v22;
  if (v11) {
    uint64_t v24 = v11;
  }
  else {
    uint64_t v24 = @"Unknown";
  }
  v41[2] = v22;
  v41[3] = v24;
  v40[3] = @"errorDomain";
  v40[4] = @"errorLabel";
  uint64_t v38 = v9;
  if (v9) {
    v25 = v9;
  }
  else {
    v25 = @"Unknown";
  }
  v41[4] = v25;
  v40[5] = @"isPreFlightLabel";
  id v26 = NSNumber;
  if (v8) {
    BOOL v27 = [(SFDeviceSetupAppleTVSession *)self _isPreflightError:v8];
  }
  else {
    BOOL v27 = 0;
  }
  Class v28 = [v26 numberWithInt:v27];
  v41[5] = v28;
  v40[6] = @"numberOfAppleTVsOnAccount";
  long long v29 = [NSNumber numberWithInt:self->_numberOfAppleTVsOnAccount];
  v41[6] = v29;
  v40[7] = @"numberOfHomePodsOnAccount";
  uint64_t v30 = [NSNumber numberWithInt:self->_numberOfAppleTVsOnAccount];
  uint64_t v31 = (void *)v30;
  if (v19) {
    v32 = v19;
  }
  else {
    v32 = @"Unknown";
  }
  v41[7] = v30;
  v41[8] = v32;
  v40[8] = @"sessionIdentifier";
  v40[9] = @"underlyingErrorCode";
  v33 = [NSNumber numberWithInteger:v37];
  v41[9] = v33;
  v41[10] = v39;
  v40[10] = @"underlyingErrorDomain";
  v40[11] = @"userWaitTimeMs";
  double v34 = a5 * 1000.0;
  if (a5 == 0.0) {
    double v34 = 0.0;
  }
  v35 = [NSNumber numberWithUnsignedInt:v34];
  v41[11] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:12];

  SFMetricsLog(@"com.apple.tvos.tvsetup.main", v36);
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_reportErrorMetrics:(id)a3 errorLabel:(id)a4 isFatal:(BOOL)a5
{
  BOOL v45 = a5;
  v55[14] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = [v7 code];
  uint64_t v10 = [v7 domain];
  BOOL v11 = [v7 underlyingErrors];
  id v12 = [v11 firstObject];

  uint64_t v46 = [v12 code];
  uint64_t v13 = [v12 domain];
  uint64_t v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = @"NoUnderlyingError";
  }
  v53 = v15;

  v48 = v12;
  uint64_t v16 = [v12 underlyingErrors];
  id v17 = [v16 firstObject];

  uint64_t v44 = [v17 code];
  uint64_t v18 = [v17 domain];
  id v19 = (void *)v18;
  if (v18) {
    int v20 = (__CFString *)v18;
  }
  else {
    int v20 = @"NoUnderlyingError";
  }
  v52 = v20;

  int v21 = [v17 underlyingErrors];
  uint64_t v22 = [v21 firstObject];

  uint64_t v43 = [v22 code];
  id v47 = v22;
  uint64_t v23 = [v22 domain];
  uint64_t v24 = (void *)v23;
  if (v23) {
    v25 = (__CFString *)v23;
  }
  else {
    v25 = @"NoUnderlyingError";
  }
  v51 = v25;

  id v26 = [(NSUUID *)self->_sessionID UUIDString];
  v54[0] = @"AppleTVModel";
  v54[1] = @"AppleTVSetupDeviceBuild";
  appleTVBuild = (__CFString *)self->_appleTVBuild;
  appleTVModel = (__CFString *)self->_appleTVModel;
  if (!appleTVModel) {
    appleTVModel = @"Unknown";
  }
  if (!appleTVBuild) {
    appleTVBuild = @"Unknown";
  }
  v55[0] = appleTVModel;
  v55[1] = appleTVBuild;
  v54[2] = @"errorCode";
  uint64_t v29 = [NSNumber numberWithInteger:v9];
  uint64_t v30 = (void *)v29;
  v49 = (void *)v10;
  int v50 = v8;
  if (v10) {
    uint64_t v31 = (__CFString *)v10;
  }
  else {
    uint64_t v31 = @"Unknown";
  }
  v55[2] = v29;
  v55[3] = v31;
  v54[3] = @"errorDomain";
  v54[4] = @"errorLabel";
  if (v8) {
    v32 = v8;
  }
  else {
    v32 = @"Unknown";
  }
  v55[4] = v32;
  v54[5] = @"isFatalError";
  v33 = [NSNumber numberWithInt:v45];
  v55[5] = v33;
  v54[6] = @"isPreFlight";
  double v34 = NSNumber;
  if (v7) {
    BOOL v35 = [(SFDeviceSetupAppleTVSession *)self _isPreflightError:v7];
  }
  else {
    BOOL v35 = 0;
  }
  uint64_t v36 = [v34 numberWithInt:v35];
  uint64_t v37 = (void *)v36;
  if (v26) {
    uint64_t v38 = v26;
  }
  else {
    uint64_t v38 = @"Unknown";
  }
  v55[6] = v36;
  v55[7] = v38;
  v54[7] = @"sessionIdentifier";
  v54[8] = @"underlyingErrorCode1";
  v39 = [NSNumber numberWithInteger:v46];
  v55[8] = v39;
  v55[9] = v53;
  v54[9] = @"underlyingErrorDomain1";
  v54[10] = @"underlyingErrorCode2";
  v40 = [NSNumber numberWithInteger:v44];
  v55[10] = v40;
  v55[11] = v52;
  v54[11] = @"underlyingErrorDomain2";
  v54[12] = @"underlyingErrorCode3";
  v41 = [NSNumber numberWithInteger:v43];
  v54[13] = @"underlyingErrorDomain3";
  v55[12] = v41;
  v55[13] = v51;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:14];

  SFMetricsLog(@"com.apple.tvos.tvsetup.errors", v42);
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_isPreflightError:(id)a3
{
  uint64_t v3 = [a3 code];
  return ((unint64_t)(v3 - 301000) < 8) & (0x91u >> (v3 + 56));
}

- (void)_setNumberOfDevicesOnAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)&self->_numberOfAppleTVsOnAccount = 0;
  id obj = v4;
  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v23 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      p_numberOfAppleTVsOnAccount = &self->_numberOfAppleTVsOnAccount;
      p_numberOfHomePodsOnAccount = &self->_numberOfHomePodsOnAccount;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v7;
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v9 = objc_msgSend(v8, "accessories", obj);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) category];
                id v15 = [v14 categoryType];

                uint64_t v16 = getHMAccessoryCategoryTypeHomePod_1[0]();
                char v17 = [v15 isEqualToString:v16];

                uint64_t v18 = p_numberOfHomePodsOnAccount;
                if ((v17 & 1) != 0
                  || (getHMAccessoryCategoryTypeAppleTV_0[0](),
                      id v19 = objc_claimAutoreleasedReturnValue(),
                      int v20 = [v15 isEqualToString:v19],
                      v19,
                      uint64_t v18 = p_numberOfAppleTVsOnAccount,
                      v20))
                {
                  ++*v18;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_peerFeatureFlags = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
}

- (id)promptForHomeiCloudHandler
{
  return self->_promptForHomeiCloudHandler;
}

- (void)setPromptForHomeiCloudHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
}

- (id)promptForCaptiveNetworkHandler
{
  return self->_promptForCaptiveNetworkHandler;
}

- (void)setPromptForCaptiveNetworkHandler:(id)a3
{
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPasscode
{
  return self->_forcedPasscode;
}

- (void)setForcedPasscode:(id)a3
{
  self->_forcedPasscode = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForCaptiveNetworkHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForHomeiCloudHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_appleTVModelNumber, 0);
  objc_storeStrong((id *)&self->_appleTVModel, 0);
  objc_storeStrong((id *)&self->_appleTVBuild, 0);
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);

  objc_storeStrong((id *)&self->_iTunesUserID, 0);
}

@end