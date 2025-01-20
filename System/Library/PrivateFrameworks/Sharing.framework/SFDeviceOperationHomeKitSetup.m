@interface SFDeviceOperationHomeKitSetup
- (ACAccount)iTunesAccount;
- (BOOL)_isOwnerOfHome:(id)a3;
- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3;
- (BOOL)hasHomePod;
- (BOOL)hasMultipleUsers;
- (BOOL)homeKitAddedAccessory;
- (BOOL)homeKitHomeManagerReady;
- (BOOL)isCLIMode;
- (BOOL)keyExchangeOnly;
- (BOOL)pauseAfterUserInput;
- (BOOL)personalRequestsEnabled;
- (BOOL)userInteractive;
- (CUPairedPeer)pairedPeer;
- (HMAccessory)stereoCounterpart;
- (HMAccessory)tvAudioInput;
- (HMHome)homeKitSelectedHome;
- (HMHomeManager)homeKitHomeManager;
- (HMMediaGroup)existingMediaGroup;
- (NSArray)psgHomePods;
- (NSArray)psgStereoPairs;
- (NSDictionary)appDataSelf;
- (NSString)homeKitSelectedRoomName;
- (NSString)iTunesAccountID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationHomeKitSetup)init;
- (TRSession)trSession;
- (double)addDeviceNonUserSeconds;
- (double)assignRoomNonUserSeconds;
- (double)metricNonUserSeconds;
- (double)metricUserSeconds;
- (double)odeonSeconds;
- (double)personalRequestsNonUserSeconds;
- (double)setupDeviceNonUserSeconds;
- (double)timeoutInSeconds;
- (double)ulhNonUserSeconds;
- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4;
- (id)_mediaSystemForAccessory:(id)a3;
- (id)_normalizedString:(id)a3;
- (id)_runHomeKitAutoSelectHome:(BOOL)a3;
- (id)completionHandler;
- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3;
- (id)findTVs;
- (id)homeKitAccessory;
- (id)pauseHandler;
- (id)promptForHomeHandler;
- (id)promptForRoomHandler;
- (id)promptForRoomHandlerDetailed;
- (id)promptToInstallHomeAppHandler;
- (int)stereoRole;
- (void)_cleanup;
- (void)_completeWithError:(id)a3;
- (void)_removeAccessoryIfNeeded;
- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4;
- (void)_restoreHomeApp;
- (void)_run;
- (void)_runHomeKitAddAccessory;
- (void)_runHomeKitAddAppData;
- (void)_runHomeKitAddHome;
- (void)_runHomeKitAssignRoom;
- (void)_runHomeKitDeviceSetup;
- (void)_runHomeKitSelectRoom;
- (void)_runHomeKitSetupRoom:(BOOL)a3;
- (void)_runHomeKitUpdateAppleTVAudioDestination;
- (void)_runInit;
- (void)_runPersonalRequestsStart;
- (void)_runUpdateUserListeningHistoryStart;
- (void)_startTimeout:(double)a3;
- (void)_updateAccount;
- (void)_updateHomeStats;
- (void)activate;
- (void)homeAppInstallChoice:(BOOL)a3;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)invalidate;
- (void)reselectHome;
- (void)resume;
- (void)selectHome:(id)a3;
- (void)selectRoom:(id)a3;
- (void)setAppDataSelf:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExistingMediaGroup:(id)a3;
- (void)setITunesAccount:(id)a3;
- (void)setITunesAccountID:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setKeyExchangeOnly:(BOOL)a3;
- (void)setOdeonSeconds:(double)a3;
- (void)setPairedPeer:(id)a3;
- (void)setPauseAfterUserInput:(BOOL)a3;
- (void)setPauseHandler:(id)a3;
- (void)setPersonalRequestsEnabled:(BOOL)a3;
- (void)setPromptForHomeHandler:(id)a3;
- (void)setPromptForRoomHandler:(id)a3;
- (void)setPromptForRoomHandlerDetailed:(id)a3;
- (void)setPromptToInstallHomeAppHandler:(id)a3;
- (void)setPsgHomePods:(id)a3;
- (void)setPsgStereoPairs:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStereoCounterpart:(id)a3;
- (void)setStereoRole:(int)a3;
- (void)setTimeoutInSeconds:(double)a3;
- (void)setTrSession:(id)a3;
- (void)setTvAudioInput:(id)a3;
- (void)setUserInteractive:(BOOL)a3;
@end

@implementation SFDeviceOperationHomeKitSetup

- (SFDeviceOperationHomeKitSetup)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationHomeKitSetup;
  v2 = [(SFDeviceOperationHomeKitSetup *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_timeoutInSeconds = 300.0;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceOperationHomeKitSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceOperationHomeKitSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFDeviceOperationHomeKitSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __43__SFDeviceOperationHomeKitSetup_invalidate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _completeWithError:v2];
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id pauseHandler = self->_pauseHandler;
  self->_id pauseHandler = 0;

  id promptForHomeHandler = self->_promptForHomeHandler;
  self->_id promptForHomeHandler = 0;

  id promptForRoomHandler = self->_promptForRoomHandler;
  self->_id promptForRoomHandler = 0;

  id promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_id promptToInstallHomeAppHandler = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  self->_active = 0;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  homeKitHomeManager = self->_homeKitHomeManager;
  self->_homeKitHomeManager = 0;

  [(HMAccessoryBrowser *)self->_homeKitBrowser stopSearchingForNewAccessories];
  homeKitBrowser = self->_homeKitBrowser;
  self->_homeKitBrowser = 0;

  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation cancel];
  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation setCompletionBlock:0];
  homeKitAccessory = self->_homeKitAccessory;
  self->_homeKitAccessory = 0;

  homeKitSelectedHome = self->_homeKitSelectedHome;
  self->_homeKitSelectedHome = 0;

  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = 0;
}

- (void)_removeAccessoryIfNeeded
{
  if (self->_homeKitAddedAccessory)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    homeKitAccessory = self->_homeKitAccessory;
    [(HMHome *)homeKitSelectedHome removeAccessory:homeKitAccessory completionHandler:&__block_literal_global_44];
  }
}

void __57__SFDeviceOperationHomeKitSetup__removeAccessoryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      id v6 = v2;
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v6;
      }
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    id v6 = 0;
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5) {
      goto LABEL_7;
    }
  }
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_homeKitHomeManager && self->_isCLIMode && self->_hdsutilHKToken)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HMHomeManager *)self->_homeKitHomeManager _endActiveAssertion:self->_hdsutilHKToken];
    id v4 = v14;
  }
  if (!self->_active) {
    goto LABEL_27;
  }
  if (!v4)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    double v6 = v5;
    if (gLogCategory_SFDeviceOperationHomeKitSetup >= 31)
    {
      self->_double metricNonUserSeconds = v5 + self->_metricNonUserSeconds;
      self->_state = 4;
      goto LABEL_27;
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
    {
      double v12 = v6;
      LogPrintF();
    }
    int v8 = gLogCategory_SFDeviceOperationHomeKitSetup;
    double metricNonUserSeconds = v6 + self->_metricNonUserSeconds;
    self->_double metricNonUserSeconds = metricNonUserSeconds;
    self->_state = 4;
    if (v8 > 30) {
      goto LABEL_27;
    }
    if (v8 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_27;
      }
      double metricNonUserSeconds = self->_metricNonUserSeconds;
    }
    double v12 = metricNonUserSeconds;
    double metricUserSeconds = self->_metricUserSeconds;
LABEL_26:
    LogPrintF();
    goto LABEL_27;
  }
  self->_state = 3;
  [(SFDeviceOperationHomeKitSetup *)self _removeAccessoryIfNeeded];
  if ([v14 code] != -6723)
  {
    double v7 = *(double *)&v14;
    if (gLogCategory_SFDeviceOperationHomeKitSetup > 60) {
      goto LABEL_27;
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup == -1)
    {
      int v11 = _LogCategory_Initialize();
      double v7 = *(double *)&v14;
      if (!v11) {
        goto LABEL_27;
      }
    }
    double v12 = v7;
    goto LABEL_26;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_26;
  }
LABEL_27:
  id completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v14);
  }
  [(SFDeviceOperationHomeKitSetup *)self _cleanup];
}

- (void)homeAppInstallChoice:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SFDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_1E5BBCD90;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __54__SFDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 72) = 1;
    if (*(unsigned char *)(v1 + 40)) {
      [*(id *)(v1 + 32) _restoreHomeApp];
    }
    id v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (id)homeKitAccessory
{
  return self->_homeKitAccessory;
}

- (void)resume
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationHomeKitSetup_resume__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceOperationHomeKitSetup_resume__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup >= 31)
    {
      *(unsigned char *)(v1 + 9) = 0;
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v3 = gLogCategory_SFDeviceOperationHomeKitSetup;
      *(unsigned char *)(*(void *)(v2 + 32) + 9) = 0;
      if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    *(void *)(*(void *)(v2 + 32) + 16) = mach_absolute_time();
    [*(id *)(v2 + 32) _startTimeout:*(double *)(*(void *)(v2 + 32) + 384)];
    id v4 = *(void **)(v2 + 32);
    return [v4 _run];
  }
  return result;
}

- (void)selectHome:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SFDeviceOperationHomeKitSetup_selectHome___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__SFDeviceOperationHomeKitSetup_selectHome___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(void *)(a1 + 32) + 248) = v2 + *(double *)(*(void *)(a1 + 32) + 248);
    if ([*(id *)(a1 + 32) _isOwnerOfHome:*(void *)(a1 + 40)])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
      *(void *)(*(void *)(a1 + 32) + 16) = mach_absolute_time();
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [*(id *)(a1 + 32) _startTimeout:*(double *)(*(void *)(a1 + 32) + 384)];
      id v14 = *(void **)(a1 + 32);
      [v14 _run];
    }
    else
    {
      NSErrorWithOSStatusF();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v3 = [v15 userInfo];
      id v4 = (void *)[v3 mutableCopy];
      BOOL v5 = v4;
      if (v4) {
        id v6 = v4;
      }
      else {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      double v7 = v6;

      id v8 = [*(id *)(a1 + 40) name];
      [v7 setObject:v8 forKeyedSubscript:@"SFErrorKeyHomeName"];

      v9 = [*(id *)(a1 + 40) owner];
      v10 = [v9 name];
      [v7 setObject:v10 forKeyedSubscript:@"SFErrorKeyHomeOwnerAccount"];

      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      double v12 = [v15 domain];
      v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v15, "code"), v7);

      [*(id *)(a1 + 32) _completeWithError:v13];
    }
  }
}

- (void)reselectHome
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SFDeviceOperationHomeKitSetup_reselectHome__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __45__SFDeviceOperationHomeKitSetup_reselectHome__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 96) = 1;
    double v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)selectRoom:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SFDeviceOperationHomeKitSetup_selectRoom___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __44__SFDeviceOperationHomeKitSetup_selectRoom___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(void *)(v1 + 32) + 248) = v2 + *(double *)(*(void *)(v1 + 32) + 248);
    *(void *)(*(void *)(v1 + 32) + 16) = mach_absolute_time();
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(v1 + 32) + 216), *(id *)(v1 + 40));
    [*(id *)(v1 + 32) _startTimeout:*(double *)(*(void *)(v1 + 32) + 384)];
    int v3 = *(void **)(v1 + 32);
    return [v3 _run];
  }
  return result;
}

- (void)_startTimeout:(double)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    double v7 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v9 = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  v10 = self->_timeoutTimer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SFDeviceOperationHomeKitSetup__startTimeout___block_invoke;
  v11[3] = &unk_1E5BBC910;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler(v10, v11);
  SFDispatchTimerSet(self->_timeoutTimer, a3, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

void __47__SFDeviceOperationHomeKitSetup__startTimeout___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 32) - 10;
  if (v2 > 0x24) {
    int v3 = "HomeKitSetupUnknownState?";
  }
  else {
    int v3 = off_1E5BC02B0[v2];
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v4)
  {
    BOOL v5 = v4;
    dispatch_source_cancel(v5);
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  id v8 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_completeWithError:", v9, v3);
}

- (void)_run
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  int state = self->_state;
  while (2)
  {
    switch(state)
    {
      case 0:
        self->_int state = 10;
        [(SFDeviceOperationHomeKitSetup *)self _runInit];
        goto LABEL_121;
      case 10:
        if (self->_homeKitHomeManagerReady)
        {
          int v6 = 11;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 11:
        int v6 = 12;
        goto LABEL_120;
      case 12:
        if ([(HMHomeManager *)self->_homeKitHomeManager dataSyncState] == 5)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          SFMetricsLog(@"com.apple.sharing.HomeResetRequired", MEMORY[0x1E4F1CC08]);
          v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v38 = v4;
          uint64_t v20 = [NSString stringWithUTF8String:DebugGetErrorString()];
          v21 = (void *)v20;
          v22 = @"?";
          if (v20) {
            v22 = (__CFString *)v20;
          }
          v39[0] = v22;
          v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1, v34);
          uint64_t v24 = 301024;
          v25 = v19;
          uint64_t v26 = v3;
LABEL_158:
          v33 = [v25 errorWithDomain:v26 code:v24 userInfo:v23];
          [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v33];

          goto LABEL_121;
        }
        if ([(HMHomeManager *)self->_homeKitHomeManager dataSyncState] == 2)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          SFMetricsLog(@"com.apple.sharing.HomeKitKeychainNotEnabled", MEMORY[0x1E4F1CC08]);
          v30 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v36 = v4;
          uint64_t v31 = [NSString stringWithUTF8String:DebugGetErrorString()];
          v21 = (void *)v31;
          v32 = @"?";
          if (v31) {
            v32 = (__CFString *)v31;
          }
          v37 = v32;
          v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v34);
          v25 = v30;
          uint64_t v26 = v3;
          uint64_t v24 = 301011;
          goto LABEL_158;
        }
        if ([(HMHomeManager *)self->_homeKitHomeManager isDataSyncInProgress])
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v34 = [(HMHomeManager *)self->_homeKitHomeManager dataSyncState];
            goto LABEL_153;
          }
        }
        else if ([(HMHomeManager *)self->_homeKitHomeManager status])
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v34 = [(HMHomeManager *)self->_homeKitHomeManager status];
            goto LABEL_153;
          }
        }
        else
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          int v6 = 13;
LABEL_120:
          self->_int state = v6;
        }
LABEL_121:
        BOOL v18 = self->_state == state;
        int state = self->_state;
        if (!v18) {
          continue;
        }
        return;
      case 13:
        if (self->_keyExchangeOnly) {
          goto LABEL_38;
        }
        int v6 = 14;
        goto LABEL_120;
      case 14:
        if (!self->_promptToInstallHomeAppHandler) {
          goto LABEL_17;
        }
        double v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.Home"];
        id v8 = [v7 appState];
        char v9 = [v8 isInstalled];

        if (v9) {
          goto LABEL_17;
        }
        self->_int state = 15;
        id promptToInstallHomeAppHandler = (void (**)(id))self->_promptToInstallHomeAppHandler;
        goto LABEL_140;
      case 15:
        if (self->_homeAppInstallUserDidChoose)
        {
LABEL_17:
          int v6 = 16;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 16:
        id v11 = [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAutoSelectHome:0];
        homeKitSelectedHome = self->_homeKitSelectedHome;
        self->_homeKitSelectedHome = v11;

        if (!self->_homeKitSelectedHome) {
          goto LABEL_121;
        }
        goto LABEL_25;
      case 17:
        if (self->_homeKitSelectedHome) {
          goto LABEL_25;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 18:
        if (self->_homeKitSelectedHome)
        {
LABEL_25:
          int v6 = 19;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 19:
        [(SFDeviceOperationHomeKitSetup *)self _updateHomeStats];
        self->_int state = 20;
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitSelectRoom];
        goto LABEL_121;
      case 20:
        if (self->_reselectHome)
        {
          self->_reselectHome = 0;
          v13 = self->_homeKitSelectedHome;
          self->_homeKitSelectedHome = 0;

          self->_int state = 17;
          id v14 = [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAutoSelectHome:1];
          goto LABEL_121;
        }
        if (self->_homeKitSelectedRoom || self->_homeKitSelectedRoomName)
        {
          int v6 = 21;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 21:
        if (!self->_pauseAfterUserInput || !self->_pauseHandler) {
          goto LABEL_38;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          v28 = timeoutTimer;
          dispatch_source_cancel(v28);
          v29 = self->_timeoutTimer;
          self->_timeoutTimer = 0;
        }
        self->_paused = 1;
        self->_int state = 22;
        id promptToInstallHomeAppHandler = (void (**)(id))self->_pauseHandler;
LABEL_140:
        promptToInstallHomeAppHandler[2](promptToInstallHomeAppHandler);
        goto LABEL_121;
      case 22:
        if (!self->_paused)
        {
LABEL_38:
          int v6 = 23;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 23:
        self->_int state = 24;
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitDeviceSetup];
        goto LABEL_121;
      case 24:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 25:
        if (self->_keyExchangeOnly) {
          goto LABEL_119;
        }
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAddAccessory];
        goto LABEL_121;
      case 26:
        if (self->_homeKitAddedAccessory)
        {
          int v6 = 27;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
LABEL_153:
          LogPrintF();
        }
        goto LABEL_121;
      case 27:
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitSetupRoom:0];
        goto LABEL_121;
      case 28:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 29:
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAssignRoom];
        goto LABEL_121;
      case 30:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 31:
        if (self->_stereoRole)
        {
          int v6 = 34;
        }
        else if (self->_tvAudioInput)
        {
LABEL_102:
          int v6 = 37;
        }
        else if (self->_appDataSelf)
        {
          int v6 = 32;
        }
        else
        {
LABEL_59:
          int v6 = 40;
        }
        goto LABEL_120;
      case 32:
        self->_int state = 33;
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAddAppData];
        goto LABEL_121;
      case 33:
        if (self->_homeKitAddedAppData) {
          goto LABEL_59;
        }
        goto LABEL_121;
      case 34:
        id v35 = 0;
        BOOL v15 = [(SFDeviceOperationHomeKitSetup *)self _runHomeKitConfigureStereoPairAndReturnError:&v35];
        id v16 = v35;
        if (v16)
        {
          [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v16];
        }
        else
        {
          if (v15) {
            int v17 = 35;
          }
          else {
            int v17 = 36;
          }
          self->_int state = v17;
        }

        goto LABEL_121;
      case 35:
        if (!self->_configuredStereoPair) {
          goto LABEL_121;
        }
        int v6 = 36;
        goto LABEL_120;
      case 36:
        goto LABEL_102;
      case 37:
        if (!self->_tvAudioInput) {
          goto LABEL_67;
        }
        [(SFDeviceOperationHomeKitSetup *)self _runHomeKitUpdateAppleTVAudioDestination];
        int v6 = 38;
        goto LABEL_120;
      case 38:
        if (!self->_configuredTVAudio) {
          goto LABEL_121;
        }
LABEL_67:
        int v6 = 39;
        goto LABEL_120;
      case 39:
        goto LABEL_59;
      case 40:
        self->_int state = 41;
        [(SFDeviceOperationHomeKitSetup *)self _runPersonalRequestsStart];
        goto LABEL_121;
      case 41:
        if (!self->_personalRequestsDone) {
          goto LABEL_121;
        }
        int v6 = 42;
        goto LABEL_120;
      case 42:
        self->_int state = 43;
        [(SFDeviceOperationHomeKitSetup *)self _runUpdateUserListeningHistoryStart];
        goto LABEL_121;
      case 43:
        if (!self->_userListeningHistoryDone) {
          goto LABEL_121;
        }
        if (self->_psgHomePods && self->_psgStereoPairs) {
          int v6 = 44;
        }
        else {
LABEL_119:
        }
          int v6 = 46;
        goto LABEL_120;
      case 44:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_119;
      case 45:
        if (!self->_createUpdatePSGDone) {
          goto LABEL_121;
        }
        goto LABEL_119;
      case 46:
        [(SFDeviceOperationHomeKitSetup *)self _completeWithError:0];
        goto LABEL_121;
      default:
        goto LABEL_121;
    }
  }
}

- (void)_runInit
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFDeviceOperationHomeKitSetup *)self _startTimeout:self->_timeoutInSeconds];
  uint64_t v3 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_0[0]());
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = v3;

  if (self->_isCLIMode)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    BOOL v5 = [(objc_class *)getHMMutableHomeManagerConfigurationClass() defaultConfiguration];
    int v6 = (void *)[v5 mutableCopy];
    [v6 setAdaptive:1];
    double v7 = (HMHomeManager *)[objc_alloc((Class)getHMHomeManagerClass_0[0]()) initWithConfiguration:v6];
    homeKitHomeManager = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v7;

    char v9 = [(HMHomeManager *)self->_homeKitHomeManager _beginActiveAssertionWithReason:@"tvsetuputil Started"];
    hdsutilHKToken = self->_hdsutilHKToken;
    self->_hdsutilHKToken = v9;
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v11 = (HMHomeManager *)objc_alloc_init((Class)getHMHomeManagerClass_0[0]());
    BOOL v5 = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v11;
  }

  double v12 = self->_homeKitHomeManager;

  [(HMHomeManager *)v12 setDelegate:self];
}

- (void)_runHomeKitDeviceSetup
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_keyExchangeOnly)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = (HMAccessoryBrowser *)objc_alloc_init((Class)getHMAccessoryBrowserClass[0]());
    homeKitBrowser = self->_homeKitBrowser;
    self->_homeKitBrowser = v3;

    [(HMAccessoryBrowser *)self->_homeKitBrowser setDelegate:self];
    [(HMAccessoryBrowser *)self->_homeKitBrowser startSearchingForNewAccessories];
  }
  BOOL v5 = self->_trSession;
  if (!v5)
  {
    v10 = NSErrorWithOSStatusF();
    [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v10];

    goto LABEL_30;
  }
  sessionID = self->_sessionID;
  id v7 = objc_alloc((Class)getHMDeviceSetupOperationClass[0]());
  if (sessionID)
  {
    id v8 = (HMDeviceSetupOperation *)[v7 initWithSession:v5 sessionIdentifier:self->_sessionID];
    homeKitDeviceSetupOperation = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v8;

    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      id v14 = self->_sessionID;
LABEL_19:
      LogPrintF();
    }
  }
  else
  {
    id v11 = (HMDeviceSetupOperation *)[v7 initWithSession:v5];
    double v12 = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v11;

    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  if (self->_userInteractive) {
    uint64_t v13 = 33;
  }
  else {
    uint64_t v13 = 9;
  }
  -[HMDeviceSetupOperation setQualityOfService:](self->_homeKitDeviceSetupOperation, "setQualityOfService:", v13, v14);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke;
  v15[3] = &unk_1E5BBC870;
  v15[4] = self;
  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation setCompletionBlock:v15];
  [(TROperationQueue *)self->_trOperationQueue addOperation:self->_homeKitDeviceSetupOperation];
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:
}

void __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(NSObject **)(v1 + 192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2;
  block[3] = &unk_1E5BBC870;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 256) = v2;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 8))
  {
    uint64_t v4 = [*(id *)(v3 + 80) accessory];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(v7 + 88))
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v8 = _LogCategory_Initialize(), uint64_t v7 = *(void *)(a1 + 32), v8))
        {
          LogPrintF();
          uint64_t v7 = *(void *)(a1 + 32);
        }
      }
      *(_DWORD *)(v7 + 32) = 25;
      char v9 = *(void **)(a1 + 32);
      [v9 _run];
    }
    else
    {
      NSErrorWithOSStatusF();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [(id)v7 _completeWithError:v10];
    }
  }
}

- (id)_runHomeKitAutoSelectHome:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMHomeManager *)self->_homeKitHomeManager homes];
  int v6 = v5;
  if (!a3)
  {
    if (![v5 count])
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFDeviceOperationHomeKitSetup *)self _runHomeKitAddHome];
LABEL_52:
      uint64_t v7 = 0;
      goto LABEL_53;
    }
    if ([v6 count] == 1)
    {
      uint64_t v7 = [v6 firstObject];
      if (v7 && [(SFDeviceOperationHomeKitSetup *)self _isOwnerOfHome:v7])
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_53;
      }
    }
  }
  p_inst_meths = &OBJC_PROTOCOL___NSXPCConnectionDelegate.inst_meths;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = [v6 count];
    LogPrintF();
  }
  if (self->_promptForHomeHandler)
  {
    char v9 = [(HMHomeManager *)self->_homeKitHomeManager currentHome];
    id v10 = [v9 uniqueIdentifier];

    if (v10)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v30;
LABEL_21:
        uint64_t v15 = 0;
        uint64_t v28 = v13 + v12;
        while (1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v15), "uniqueIdentifier", v27);
          char v17 = [v16 isEqual:v10];

          if (v17) {
            break;
          }
          if (v12 == ++v15)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
            uint64_t v13 = v28;
            if (v12) {
              goto LABEL_21;
            }
            break;
          }
        }
        p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCConnectionDelegate + 24);
      }
    }
    int v18 = *((_DWORD *)p_inst_meths + 858);
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      uint64_t v20 = timeoutTimer;
      dispatch_source_cancel(v20);
      v21 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    double v23 = v22;
    int v24 = *((_DWORD *)p_inst_meths + 858);
    if (v24 <= 30 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_double metricNonUserSeconds = v23 + self->_metricNonUserSeconds;
    self->_startTicks = mach_absolute_time();
    int v25 = *((_DWORD *)p_inst_meths + 858);
    if (v25 <= 30 && (v25 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int state = 17;
    (*((void (**)(void))self->_promptForHomeHandler + 2))();

    goto LABEL_52;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(v6, "firstObject", v27);
LABEL_53:

  return v7;
}

- (void)_runHomeKitAddHome
{
  self->_int state = 18;
  homeKitHomeManager = self->_homeKitHomeManager;
  uint64_t v4 = SFLocalizedStringForKey(@"MY_HOME");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke;
  v5[3] = &unk_1E5BC01A0;
  v5[4] = self;
  [(HMHomeManager *)homeKitHomeManager addHomeWithName:v4 completionHandler:v5];
}

void __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2;
  block[3] = &unk_1E5BBD418;
  block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[8])
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "_completeWithError:");
    }
    else if (*(void *)(a1 + 48))
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 48));
      uint64_t v4 = *(void **)(a1 + 32);
      [v4 _run];
    }
    else
    {
      NSErrorWithOSStatusF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v1 _completeWithError:v5];
    }
  }
}

- (void)_runHomeKitSelectRoom
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_homeKitSelectedHome;
  v56 = self;
  v50 = v3;
  if (*(_OWORD *)&self->_promptForRoomHandler == 0)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v39 = [(HMHome *)v3 roomForEntireHome];
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v39;

    if (!self->_homeKitSelectedRoom)
    {
      v41 = NSErrorWithOSStatusF();
      [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v41];
    }
  }
  else
  {
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v4 = [(HMHome *)v3 rooms];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v78 != v6) {
            objc_enumerationMutation(v4);
          }
          int v8 = [*(id *)(*((void *)&v77 + 1) + 8 * i) name];
          if (v8 && ([v57 containsObject:v8] & 1) == 0) {
            [v57 addObject:v8];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v5);
    }

    objc_msgSend(v57, "sortUsingSelector:");
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v9 = [&unk_1EFA0A088 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v9)
    {
      v51 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v74;
      do
      {
        uint64_t v12 = 0;
        uint64_t v54 = v10;
        uint64_t v13 = 10 - v10;
        do
        {
          if (*(void *)v74 != v11) {
            objc_enumerationMutation(&unk_1EFA0A088);
          }
          uint64_t v14 = SFLocalizedStringForKey(*(const __CFString **)(*((void *)&v73 + 1) + 8 * v12));
          if (v14)
          {
            uint64_t v15 = [(SFDeviceOperationHomeKitSetup *)v56 _normalizedString:v14];
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke;
            v72[3] = &unk_1E5BC01C8;
            v72[4] = v15;
            if ([v57 indexOfObjectPassingTest:v72] == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v52 addObject:v14];
              if (v13 == v12)
              {
                id v16 = v14;

                v51 = v16;
              }
            }
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v17 = [&unk_1EFA0A088 countByEnumeratingWithState:&v73 objects:v82 count:16];
        uint64_t v10 = v54 + v9;
        uint64_t v9 = v17;
      }
      while (v17);
    }
    else
    {
      v51 = 0;
    }
    [(SFDeviceOperationHomeKitSetup *)v56 _removeSimilarRoomNames:v52 home:v50];
    [v52 sortUsingSelector:sel_localizedStandardCompare_];
    v49 = [v57 arrayByAddingObjectsFromArray:v52];
    timeoutTimer = v56->_timeoutTimer;
    if (timeoutTimer)
    {
      v19 = timeoutTimer;
      dispatch_source_cancel(v19);
      uint64_t v20 = v56->_timeoutTimer;
      v56->_timeoutTimer = 0;
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    double v22 = v21;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      double v44 = v22;
      LogPrintF();
    }
    v56->_double metricNonUserSeconds = v22 + v56->_metricNonUserSeconds;
    uint64_t v23 = mach_absolute_time();
    int v24 = v56;
    v56->_startTicks = v23;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v25 = _LogCategory_Initialize(), int v24 = v56, v25))
      {
        LogPrintF();
        int v24 = v56;
      }
    }
    if (v24->_promptForRoomHandler
      && v24->_promptForRoomHandlerDetailed
      && gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v48 = objc_msgSend(v57, "count", *(void *)&v44);
    uint64_t v26 = v56;
    if (v56->_promptForRoomHandlerDetailed)
    {
      uint64_t v27 = dispatch_group_create();
      v55 = objc_opt_new();
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x3032000000;
      v69 = __Block_byref_object_copy__10;
      v70 = __Block_byref_object_dispose__10;
      id v71 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      obuint64_t j = v52;
      uint64_t v28 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v63 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void *)(*((void *)&v62 + 1) + 8 * j);
            dispatch_group_enter(v27);
            homeKitHomeManager = v56->_homeKitHomeManager;
            homeKitSelectedHome = v56->_homeKitSelectedHome;
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke_261;
            v58[3] = &unk_1E5BC01F0;
            v58[4] = v31;
            v61 = &v66;
            id v59 = v55;
            v60 = v27;
            [(HMHomeManager *)homeKitHomeManager checkName:v31 inHome:homeKitSelectedHome withValidationOptions:4 completionHandler:v58];
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
        }
        while (v28);
      }

      dispatch_time_t v34 = dispatch_time(0, 30000000000);
      dispatch_group_wait(v27, v34);
      if ([v57 count] || objc_msgSend(v55, "count") || !v67[5])
      {
        id v35 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
        if (!v48)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            id v45 = v51;
            LogPrintF();
          }
          if (v51) {
            objc_msgSend(v55, "indexOfObject:");
          }
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v45);

          id v35 = (void *)v36;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          id v46 = obj;
          v47 = v35;
          id v45 = v57;
          LogPrintF();
        }
        promptForRoomHandlerDetailed = (void (**)(id, void *, id, void *, void *))v56->_promptForRoomHandlerDetailed;
        uint64_t v38 = [(HMHome *)v50 name];
        promptForRoomHandlerDetailed[2](promptForRoomHandlerDetailed, v38, v57, v55, v35);
      }
      else
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        [(SFDeviceOperationHomeKitSetup *)v56 _completeWithError:v67[5]];
      }
      _Block_object_dispose(&v66, 8);
    }
    else
    {
      if (!v48)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v42 = _LogCategory_Initialize(), uint64_t v26 = v56, v42))
          {
            LogPrintF();
            uint64_t v26 = v56;
          }
        }
        if (v51)
        {
          objc_msgSend(v49, "indexOfObject:");
          uint64_t v26 = v56;
        }
      }
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v43 = _LogCategory_Initialize(), uint64_t v26 = v56, v43))
        {
          LogPrintF();
          uint64_t v26 = v56;
        }
      }
      (*((void (**)(id, void *))v26->_promptForRoomHandler + 2))(v26->_promptForRoomHandler, v49);
    }
  }
}

BOOL __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 caseInsensitiveCompare:*(void *)(a1 + 32)];
  if (!v5) {
    *a4 = 1;
  }
  return v5 == 0;
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke_261(uint64_t a1, int a2, void *a3, void *a4)
{
  unint64_t v10 = a3;
  unint64_t v7 = a4;
  if (v10 | v7)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v7) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
    }
  }
  else if (a2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(a1 + 32), v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(a1 + 32), v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_runHomeKitAddAccessory
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_int state = 26;
  uint64_t v3 = [(HMAccessory *)self->_homeKitAccessory uniqueIdentifier];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [(HMHome *)self->_homeKitSelectedHome accessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
      unint64_t v10 = [v9 uniqueIdentifier];
      char v11 = [v10 isEqual:v3];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v12 = v9;

    if (!v12) {
      goto LABEL_14;
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitAccessory = self->_homeKitAccessory;
    self->_homeKitAccessory = v12;
    uint64_t v14 = v12;

    self->_homeKitAddedAccessory = 1;
  }
  else
  {
LABEL_9:

LABEL_14:
    self->_startTicksForHomeKitSteps = mach_absolute_time();
    uint64_t v13 = [(SFDeviceOperationHomeKitSetup *)self pairedPeer];
    uint64_t v14 = [v13 identifier];

    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v14);
      }
      else
      {
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v18);
      }
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    uint64_t v17 = self->_homeKitAccessory;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke;
    v19[3] = &unk_1E5BBC8E8;
    v19[4] = self;
    [(HMHome *)homeKitSelectedHome addAccessory:v17 completionHandler:v19];
  }
}

void __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 264) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 264);
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "stopSearchingForNewAccessories", v8);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;

    if (*(void *)(a1 + 40))
    {
      id v6 = *(void **)(a1 + 32);
      return objc_msgSend(v6, "_completeWithError:");
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 156) = 1;
      [*(id *)(a1 + 32) _updateAccount];
      uint64_t v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)_runHomeKitSetupRoom:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_homeKitSelectedRoom;
  if (v5)
  {
LABEL_2:
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v5;
    uint64_t v14 = v5;

    self->_int state = 29;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [(HMHome *)self->_homeKitSelectedHome rooms];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v12 = [v11 name];
        char v13 = [v12 isEqual:self->_homeKitSelectedRoomName];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v8) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      uint64_t v5 = v11;

      if (v5) {
        goto LABEL_2;
      }
    }
    else
    {
LABEL_13:
    }
    uint64_t v14 = self->_homeKitSelectedRoomName;
    if (v14)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        LogPrintF();
      }
      self->_int state = 28;
      homeKitSelectedHome = self->_homeKitSelectedHome;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke;
      v19[3] = &unk_1E5BC0240;
      v19[4] = self;
      BOOL v20 = a3;
      -[HMHome addRoomWithName:completionHandler:](homeKitSelectedHome, "addRoomWithName:completionHandler:", v14, v19, homeKitSelectedRoomName);
    }
    else
    {
      id v16 = NSErrorWithOSStatusF();
      [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v16];
    }
  }
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 192);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2;
  v11[3] = &unk_1E5BC0218;
  v11[4] = v7;
  id v12 = v6;
  id v13 = v5;
  char v14 = *(unsigned char *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3 || (id v6 = *(void **)(a1 + 48)) == 0)
    {
      if ([v3 code] == 1 && !*(unsigned char *)(a1 + 56))
      {
        dispatch_time_t v7 = dispatch_time(0, 2000000000);
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 192);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3;
        block[3] = &unk_1E5BBBD18;
        id v9 = *(id *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 32);
        id v14 = v9;
        uint64_t v15 = v10;
        dispatch_after(v7, v8, block);
      }
      else
      {
        uint64_t v4 = *(void **)(a1 + 32);
        if (*(void *)(a1 + 40))
        {
          id v5 = *(void **)(a1 + 32);
          objc_msgSend(v5, "_completeWithError:");
        }
        else
        {
          NSErrorWithOSStatusF();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          [v4 _completeWithError:v12];
        }
      }
    }
    else
    {
      objc_storeStrong((id *)(v1 + 104), v6);
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 32) = 29;
      char v11 = *(void **)(a1 + 32);
      [v11 _run];
    }
  }
}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_runHomeKitSetupRoom:", 1, v4);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _run];
}

- (void)_runHomeKitAssignRoom
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    id v6 = [(HMRoom *)self->_homeKitSelectedRoom name];
    LogPrintF();
  }
  self->_int state = 30;
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  homeKitSelectedHome = self->_homeKitSelectedHome;
  homeKitAccessory = self->_homeKitAccessory;
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke;
  v7[3] = &unk_1E5BBC8E8;
  v7[4] = self;
  [(HMHome *)homeKitSelectedHome assignAccessory:homeKitAccessory toRoom:homeKitSelectedRoom completionHandler:v7];
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

unsigned char *__54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 272) = v2;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[8])
  {
    if (*(void *)(a1 + 40))
    {
      return (unsigned char *)objc_msgSend(result, "_completeWithError:");
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 32) = 31;
      uint64_t v4 = *(void **)(a1 + 32);
      return (unsigned char *)[v4 _run];
    }
  }
  return result;
}

- (void)_runHomeKitAddAppData
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  homeKitAccessory = self->_homeKitAccessory;
  if (homeKitAccessory)
  {
    uint64_t v4 = [(HMAccessory *)homeKitAccessory applicationData];
    appDataSelf = self->_appDataSelf;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke;
    v10[3] = &unk_1E5BC0268;
    id v11 = v4;
    id v6 = v4;
    [(NSDictionary *)appDataSelf enumerateKeysAndObjectsUsingBlock:v10];
    dispatch_time_t v7 = self->_homeKitAccessory;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2;
    v9[3] = &unk_1E5BBC8E8;
    v9[4] = self;
    [(HMAccessory *)v7 updateApplicationData:v6 completionHandler:v9];
  }
  else
  {
    NSErrorWithOSStatusF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v8];
  }
}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 40);
    if (v2)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v3 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(v1 + 40), v3))
        {
          LogPrintF();
          uint64_t v2 = *(void *)(v1 + 40);
        }
      }
      uint64_t v4 = *(void **)(v1 + 32);
      return [v4 _completeWithError:v2];
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(v1 + 32) + 112) = 1;
      id v5 = *(void **)(v1 + 32);
      return [v5 _run];
    }
  }
  return result;
}

- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = self->_stereoCounterpart;
  if (!v5 || (self->_stereoRole & 0xFFFFFFFE) != 2) {
    goto LABEL_19;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homeKitAccessory)
  {
    if (a3) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v6 = getHMMediaSystemBuilderClass[0]();
  homeKitAccessory = self->_homeKitAccessory;
  v36[0] = v5;
  v36[1] = homeKitAccessory;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  LOBYTE(v6) = [(id)v6 isStereoPairingSupportedForAccessories:v8];

  if ((v6 & 1) == 0)
  {
    if (a3)
    {
LABEL_18:
      NSErrorWithOSStatusF();
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    BOOL v16 = 0;
    goto LABEL_20;
  }
  id v9 = self->_homeKitSelectedHome;
  if (v9)
  {
    uint64_t v10 = self->_homeKitSelectedRoomName;
    if (v10)
    {
      id v11 = (void *)[objc_alloc((Class)getHMMediaSystemBuilderClass[0]()) initWithHome:v9];
      id v12 = v11;
      if (v11)
      {
        [v11 setName:v10];
        id v13 = [(HMAccessory *)self->_homeKitAccessory mediaProfile];
        if (v13)
        {
          int stereoRole = self->_stereoRole;
          Class v15 = (Class)getHMMediaSystemRoleClass[0]();
          if (stereoRole == 2) {
            [(objc_class *)v15 leftRole];
          }
          else {
          uint64_t v18 = [(objc_class *)v15 rightRole];
          }
          uint64_t v31 = [objc_alloc((Class)getHMMediaSystemComponentClass[0]()) initWithMediaProfile:v13 role:v18];
          long long v32 = (void *)v18;
          if (v31)
          {
            long long v30 = [(HMAccessory *)v5 mediaProfile];
            if (v30)
            {
              int v19 = self->_stereoRole;
              Class v20 = (Class)getHMMediaSystemRoleClass[0]();
              if (v19 == 2) {
                [(objc_class *)v20 rightRole];
              }
              else {
              uint64_t v29 = [(objc_class *)v20 leftRole];
              }
              long long v21 = (void *)[objc_alloc((Class)getHMMediaSystemComponentClass[0]()) initWithMediaProfile:v30 role:v29];
              BOOL v16 = v21 != 0;
              if (v21)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
                {
                  if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
                    || (v25 = v21, int v26 = _LogCategory_Initialize(), v21 = v25, v26))
                  {
                    long long v22 = v21;
                    LogPrintF();
                    long long v21 = v22;
                  }
                }
                long long v23 = (void *)v31;
                v35[0] = v31;
                v35[1] = v21;
                uint64_t v27 = v21;
                uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
                [v12 setComponents:v28];

                v33[0] = MEMORY[0x1E4F143A8];
                v33[1] = 3221225472;
                v33[2] = __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke;
                v33[3] = &unk_1E5BC0290;
                v33[4] = self;
                id v34 = v12;
                [v34 commitWithCompletionHandler:v33];

                long long v21 = v27;
              }
              else
              {
                long long v23 = (void *)v31;
                if (a3)
                {
                  NSErrorWithOSStatusF();
                  id v24 = (id)objc_claimAutoreleasedReturnValue();
                  long long v21 = 0;
                  *a3 = v24;
                }
              }
            }
            else
            {
              if (a3)
              {
                NSErrorWithOSStatusF();
                BOOL v16 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                BOOL v16 = 0;
              }
              long long v23 = (void *)v31;
            }
          }
          else
          {
            if (a3)
            {
              NSErrorWithOSStatusF();
              BOOL v16 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v16 = 0;
            }
            long long v23 = 0;
          }
        }
        else if (a3)
        {
          NSErrorWithOSStatusF();
          BOOL v16 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else if (a3)
      {
        NSErrorWithOSStatusF();
        BOOL v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else if (a3)
    {
      NSErrorWithOSStatusF();
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else if (a3)
  {
    NSErrorWithOSStatusF();
    BOOL v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_20:
  return v16;
}

void __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 8))
  {
    id v8 = *(NSObject **)(v7 + 192);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2;
    v11[3] = &unk_1E5BBD050;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v8, v11);
  }
}

void __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
        || (v5 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    id v6 = *(void **)(a1 + 40);
    [v6 _completeWithError:v2];
    return;
  }
  int v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_17;
        }
        int v3 = *(void **)(a1 + 48);
      }
      uint64_t v4 = [v3 uniqueIdentifier];
      id v9 = [*(id *)(a1 + 56) name];
      LogPrintF();
    }
LABEL_17:
    *(unsigned char *)(*(void *)(a1 + 40) + 113) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 120), *(id *)(a1 + 48));
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 _run];
    return;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = *(void **)(a1 + 40);
  NSErrorWithOSStatusF();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v8 _completeWithError:v10];
}

- (void)_runHomeKitUpdateAppleTVAudioDestination
{
  self->_odeonStartTicks = mach_absolute_time();
  int v3 = [(HMAccessory *)self->_tvAudioInput audioDestinationController];
  if (v3)
  {
    uint64_t v4 = 120;
    if (!self->_configuredStereoPair) {
      uint64_t v4 = 88;
    }
    id v5 = *(id *)((char *)&self->super.isa + v4);
    if (v5)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke;
      v7[3] = &unk_1E5BBCBD0;
      v7[4] = self;
      id v8 = v3;
      [v8 updateDestination:v5 options:2 completionHandler:v7];
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 115
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = NSErrorWithOSStatusF();
      [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v6];
    }
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 115
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v5];
  }
}

void __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 392) = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 8))
  {
    id v6 = *(NSObject **)(v5 + 192);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2;
    block[3] = &unk_1E5BBD418;
    void block[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

uint64_t __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 392) = v2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
        || (int v4 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 40), v4))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 40);
      }
    }
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _completeWithError:v3];
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 176) name];
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _run];
  }
}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 settings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = [v13 keyPath];
        char v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v20 = v13;
          goto LABEL_19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = objc_msgSend(v7, "groups", 0);
  uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v8);
      }
      id v20 = [(SFDeviceOperationHomeKitSetup *)self _homeKitFindSettingsWithKeyPath:v6 group:*(void *)(*((void *)&v23 + 1) + 8 * v19)];
      if (v20) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    long long v21 = v20;
  }
  else
  {
LABEL_17:
    long long v21 = 0;
  }

  return v21;
}

- (void)_runUpdateUserListeningHistoryStart
{
  uint64_t v3 = self->_homeKitAccessory;
  if (v3)
  {
    int v4 = self->_homeKitSelectedHome;
    uint64_t v5 = [(HMHome *)self->_homeKitSelectedHome owner];
    if (v5)
    {
      id v6 = [(HMHome *)v4 owner];
      id v7 = [v6 userSettingsForHome:v4];
      id v8 = [v7 settings];

      uint64_t v9 = [v8 rootGroup];
      uint64_t v10 = [(SFDeviceOperationHomeKitSetup *)self _homeKitFindSettingsWithKeyPath:@"root.siri.identifyVoice" group:v9];

      if (v10
        && ([v10 value],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 BOOLValue],
            v11,
            (v12 & 1) != 0))
      {
        uint64_t v13 = [v5 userListeningHistoryUpdateControlForHome:v4];
        id v14 = (void *)[v13 mutableCopy];
        if (v14)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          [v14 addAccessory:v3];
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke;
          v16[3] = &unk_1E5BBC8E8;
          v16[4] = self;
          [v5 updateUserListeningHistoryUpdateControl:v14 forHome:v4 completionHandler:v16];
        }
        else
        {
          char v15 = NSErrorWithOSStatusF();
          [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v15];
        }
      }
      else
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 50
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_userListeningHistoryDone = 1;
      }
    }
    else
    {
      id v8 = NSErrorWithOSStatusF();
      [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v8];
    }
  }
  else
  {
    NSErrorWithOSStatusF();
    int v4 = (HMHome *)objc_claimAutoreleasedReturnValue();
    [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v4];
  }
}

void __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 288) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v5))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      id v6 = *(void **)(a1 + 32);
      return [v6 _completeWithError:v4];
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 129) = 1;
      id v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)_runPersonalRequestsStart
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_personalRequestsEnabled)
  {
    long long v27 = self->_homeKitAccessory;
    if (v27)
    {
      uint64_t v3 = self->_homeKitSelectedHome;
      uint64_t v4 = [(HMHome *)self->_homeKitSelectedHome owner];
      int v5 = v4;
      if (v4)
      {
        id v6 = [v4 assistantAccessControlForHome:v3];
        id v7 = (void *)[v6 mutableCopy];
        if (v7)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          [v7 setEnabled:1];
          if (_os_feature_enabled_impl())
          {
            long long v22 = v7;
            long long v23 = v6;
            long long v24 = v5;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v25 = v3;
            obuint64_t j = [(HMHome *)v3 accessories];
            uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v30 != v13) {
                    objc_enumerationMutation(obj);
                  }
                  char v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  uint64_t v16 = [v15 category];
                  uint64_t v17 = [v16 categoryType];
                  uint64_t v18 = getHMAccessoryCategoryTypeHomePod_0[0]();
                  if ([v17 isEqualToString:v18])
                  {
                    uint64_t v19 = [v15 uniqueIdentifier];
                    id v20 = [(HMAccessory *)v27 uniqueIdentifier];
                    int v21 = [v19 isEqual:v20];

                    if (!v21)
                    {

                      int v5 = v24;
                      uint64_t v3 = v25;
                      id v7 = v22;
                      id v6 = v23;
                      goto LABEL_34;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v12);
            }

            if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            id v7 = v22;
            [v22 setAllowUnauthenticatedRequests:1];
            int v5 = v24;
            uint64_t v3 = v25;
            id v6 = v23;
          }
LABEL_34:
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          [v7 addAccessory:v27];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke;
          v28[3] = &unk_1E5BBC8E8;
          v28[4] = self;
          [v5 updateAssistantAccessControl:v7 forHome:v3 completionHandler:v28];
        }
        else
        {
          uint64_t v10 = NSErrorWithOSStatusF();
          [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v10];
        }
      }
      else
      {
        uint64_t v9 = NSErrorWithOSStatusF();
        [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v9];
      }
    }
    else
    {
      id v8 = NSErrorWithOSStatusF();
      [(SFDeviceOperationHomeKitSetup *)self _completeWithError:v8];
    }
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_personalRequestsDone = 1;
  }
}

void __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 280) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v5))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      id v6 = *(void **)(a1 + 32);
      return [v6 _completeWithError:v4];
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 1;
      id v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __67__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(v1 + 40) dataSyncState];
      LogPrintF();
    }
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 157) = 1;
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SFDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_1E5BBC910;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __61__SFDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = self->_homeKitSelectedRoom;
  unint64_t v50 = a3;
  if (v5) {
    goto LABEL_2;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v8 = [(HMHome *)self->_homeKitSelectedHome rooms];
  uint64_t v9 = (HMRoom *)[v8 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v9) {
    goto LABEL_83;
  }
  uint64_t v10 = *(void *)v58;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v58 != v10) {
      objc_enumerationMutation(v8);
    }
    uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * v11);
    uint64_t v13 = [v12 name];
    char v14 = [v13 isEqual:self->_homeKitSelectedRoomName];

    if (v14) {
      break;
    }
    if (v9 == (HMRoom *)++v11)
    {
      uint64_t v9 = (HMRoom *)[v8 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (!v9)
      {
LABEL_83:

        goto LABEL_84;
      }
      goto LABEL_6;
    }
  }
  uint64_t v9 = v12;

  int v5 = v9;
  a3 = v50;
  if (v9)
  {
LABEL_2:
    id v6 = self->_iTunesAccountID;
    if (v6)
    {
      id v7 = v6;
      v51 = SFNormalizeEmailAddress(v6, 1);
    }
    else
    {
      v51 = 0;
    }
    id v52 = self;
    uint64_t v48 = v5;
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    char v15 = [(HMRoom *)v5 accessories];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (!v16)
    {
LABEL_82:

      uint64_t v9 = (HMRoom *)[v49 copy];
      id v8 = v48;
      goto LABEL_83;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v54;
LABEL_16:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v54 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v53 + 1) + 8 * v19);
      int v21 = objc_msgSend(v20, "category", v45, v47);
      long long v22 = [v21 categoryType];
      long long v23 = getHMAccessoryCategoryTypeHomePod_0[0]();
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_22;
      }
      long long v25 = [(SFDeviceOperationHomeKitSetup *)v52 _mediaSystemForAccessory:v20];
      if (!v25)
      {
        if (([v20 supportedStereoPairVersions] & a3) != 0)
        {
          if ([(Class)getHMMediaSystemBuilderClass[0]() supportsMediaSystem:v20])
          {
            long long v26 = [v20 remoteLoginHandler];
            long long v27 = [v26 loggedInAccount];
            long long v28 = [v27 username];

            long long v29 = [v20 remoteLoginHandler];

            if (v29)
            {
              if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                id v45 = [v20 remoteLoginHandler];
                LogPrintF();
              }
            }
            else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
                   && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF();
            }
            long long v30 = objc_msgSend(v20, "remoteLoginHandler", v45);
            long long v31 = [v30 loggedInAccount];

            if (v31)
            {
              if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                long long v32 = [v20 remoteLoginHandler];
                id v46 = [v32 loggedInAccount];
                LogPrintF();
              }
            }
            else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
                   && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF();
            }
            uint64_t v33 = objc_msgSend(v20, "remoteLoginHandler", v46);
            uint64_t v34 = [v33 loggedInAccount];
            id v35 = [v34 username];

            if (v35)
            {
              if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                uint64_t v36 = [v20 remoteLoginHandler];
                v37 = [v36 loggedInAccount];
                id v45 = [v37 username];
                LogPrintF();
              }
            }
            else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
                   && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            }
            {
              LogPrintF();
            }
            if (v28)
            {
              uint64_t v38 = SFNormalizeEmailAddress(v28, 1);
            }
            else
            {
              uint64_t v38 = 0;
            }
            id v39 = v38;
            id v40 = v51;
            v41 = v40;
            if (v39 == v40)
            {
            }
            else
            {
              if ((v51 != 0) == (v39 == 0))
              {

                goto LABEL_76;
              }
              char v42 = [v39 isEqual:v40];

              if ((v42 & 1) == 0)
              {
LABEL_76:
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  id v45 = v41;
                  uint64_t v47 = (uint64_t)v39;
                  LogPrintF();
                }
                goto LABEL_80;
              }
            }
            objc_msgSend(v49, "addObject:", v20, v45);
LABEL_80:

            a3 = v50;
            goto LABEL_21;
          }
          if (gLogCategory_SFDeviceOperationHomeKitSetup > 30
            || gLogCategory_SFDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_21;
          }
        }
        else
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup > 30
            || gLogCategory_SFDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_21;
          }
          id v45 = (void *)a3;
          uint64_t v47 = [v20 supportedStereoPairVersions];
        }
        LogPrintF();
      }
LABEL_21:

LABEL_22:
      if (v17 == ++v19)
      {
        uint64_t v43 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
        uint64_t v17 = v43;
        if (!v43) {
          goto LABEL_82;
        }
        goto LABEL_16;
      }
    }
  }
LABEL_84:

  return v9;
}

- (id)findTVs
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = self->_homeKitSelectedRoom;
  if (v3)
  {
LABEL_2:
    long long v28 = v3;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v4 = [(HMRoom *)v3 accessories];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
          uint64_t v10 = objc_msgSend(v9, "category", v27);
          uint64_t v11 = [v10 categoryType];
          uint64_t v12 = getHMAccessoryCategoryTypeAppleTV[0]();
          int v13 = [v11 isEqual:v12];

          if (v13)
          {
            char v14 = [v9 audioDestinationController];

            if (v14)
            {
              char v15 = [v9 audioDestinationController];
              uint64_t v16 = [v15 destination];

              if (v16)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  long long v27 = v9;
                  LogPrintF();
                }
              }
              else
              {
                [v29 addObject:v9];
              }
            }
            else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
                   && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            }
            {
              long long v27 = v9;
              LogPrintF();
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v17 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v6 = v17;
      }
      while (v17);
    }

    uint64_t v18 = (void *)[v29 copy];
    uint64_t v19 = v28;
    goto LABEL_25;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v19 = [(HMHome *)self->_homeKitSelectedHome rooms];
  uint64_t v18 = (void *)[v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v18)
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v21 = *(void *)v35;
LABEL_31:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v35 != v21) {
      objc_enumerationMutation(v19);
    }
    long long v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
    int v24 = [v23 name];
    char v25 = [v24 isEqual:self->_homeKitSelectedRoomName];

    if (v25) {
      break;
    }
    if (v18 == (void *)++v22)
    {
      uint64_t v18 = (void *)[v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v18) {
        goto LABEL_31;
      }
      goto LABEL_25;
    }
  }
  long long v26 = v23;

  uint64_t v3 = v26;
  if (v26) {
    goto LABEL_2;
  }
  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentUser];
  if (v4)
  {
    uint64_t v5 = [v3 homeAccessControlForUser:v4];
    char v6 = [v5 isOwner];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_mediaSystemForAccessory:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v3 home];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  char v6 = [v5 mediaSystems];
  uint64_t v23 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v7 = *(void *)v30;
    uint64_t v21 = v5;
    id v22 = v3;
    int v24 = v6;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v10 = [v9 components];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = [*(id *)(*((void *)&v25 + 1) + 8 * j) mediaProfile];
              uint64_t v16 = [v15 accessory];
              uint64_t v17 = [v16 uniqueIdentifier];

              if ([v17 isEqual:v4])
              {
                id v18 = v9;

                uint64_t v5 = v21;
                id v3 = v22;
                char v6 = v24;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        char v6 = v24;
        uint64_t v7 = v20;
      }
      id v18 = 0;
      uint64_t v5 = v21;
      id v3 = v22;
      uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_normalizedString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[ ]+", @" ", 1024, 0, objc_msgSend(v3, "length"));

  uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  char v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v54 = a4;
  uint64_t v7 = [v54 name];
  uint64_t v8 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v7];

  if (v8)
  {
    uint64_t v9 = [v6 count];
    if (v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = 0;
      v51 = v8;
      id v52 = v6;
      do
      {
        uint64_t v12 = [v6 objectAtIndexedSubscript:v11];
        uint64_t v13 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v12];

        if ([v13 caseInsensitiveCompare:v8])
        {
          unint64_t v53 = v10;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          char v14 = [v54 actionSets];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v68;
LABEL_7:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v68 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v67 + 1) + 8 * v18);
              uint64_t v20 = [v19 name];
              uint64_t v21 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v20];

              if (v21)
              {
                if (![v13 caseInsensitiveCompare:v21]) {
                  break;
                }
              }

              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
                if (v16) {
                  goto LABEL_7;
                }
                goto LABEL_14;
              }
            }
            id v22 = [v19 name];

            if (!v22) {
              goto LABEL_18;
            }
            uint64_t v23 = "ActionSet";
          }
          else
          {
LABEL_14:

LABEL_18:
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            int v24 = [v54 serviceGroups];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v64;
LABEL_20:
              uint64_t v28 = 0;
              while (1)
              {
                if (*(void *)v64 != v27) {
                  objc_enumerationMutation(v24);
                }
                long long v29 = *(void **)(*((void *)&v63 + 1) + 8 * v28);
                long long v30 = [v29 name];
                long long v31 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v30];

                if (v31)
                {
                  if (![v13 caseInsensitiveCompare:v31]) {
                    break;
                  }
                }

                if (v26 == ++v28)
                {
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
                  if (v26) {
                    goto LABEL_20;
                  }
                  goto LABEL_27;
                }
              }
              id v22 = [v29 name];

              if (!v22) {
                goto LABEL_30;
              }
              uint64_t v23 = "ServiceGroup";
            }
            else
            {
LABEL_27:

LABEL_30:
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v32 = [v54 triggers];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v60;
LABEL_32:
                uint64_t v36 = 0;
                while (1)
                {
                  if (*(void *)v60 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  long long v37 = *(void **)(*((void *)&v59 + 1) + 8 * v36);
                  uint64_t v38 = [v37 name];
                  id v39 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v38];

                  if (v39)
                  {
                    if (![v13 caseInsensitiveCompare:v39]) {
                      break;
                    }
                  }

                  if (v34 == ++v36)
                  {
                    uint64_t v34 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
                    if (v34) {
                      goto LABEL_32;
                    }
                    goto LABEL_39;
                  }
                }
                id v22 = [v37 name];

                if (!v22) {
                  goto LABEL_42;
                }
                uint64_t v23 = "Trigger";
              }
              else
              {
LABEL_39:

LABEL_42:
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                uint64_t v40 = [v54 zones];
                uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
                if (!v41)
                {
LABEL_51:

LABEL_62:
                  ++v11;
                  uint64_t v8 = v51;
                  id v6 = v52;
                  unint64_t v10 = v53;
                  goto LABEL_60;
                }
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v56;
LABEL_44:
                uint64_t v44 = 0;
                while (1)
                {
                  if (*(void *)v56 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  id v45 = *(void **)(*((void *)&v55 + 1) + 8 * v44);
                  id v46 = [v45 name];
                  uint64_t v47 = [(SFDeviceOperationHomeKitSetup *)self _normalizedString:v46];

                  if (v47)
                  {
                    if (![v13 caseInsensitiveCompare:v47]) {
                      break;
                    }
                  }

                  if (v42 == ++v44)
                  {
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
                    if (v42) {
                      goto LABEL_44;
                    }
                    goto LABEL_51;
                  }
                }
                id v22 = [v45 name];

                if (!v22) {
                  goto LABEL_62;
                }
                uint64_t v23 = "Zone";
              }
            }
          }
          uint64_t v8 = v51;
          id v6 = v52;
          unint64_t v10 = v53;
        }
        else
        {
          id v22 = v8;
          uint64_t v23 = "Home";
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          id v49 = v22;
          unint64_t v50 = v23;
          uint64_t v48 = v13;
          LogPrintF();
        }
        objc_msgSend(v6, "removeObjectAtIndex:", v11, v48, v49, v50);
        --v10;

LABEL_60:
      }
      while (v11 < v10);
    }
  }
}

- (void)_restoreHomeApp
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = (void *)[objc_alloc((Class)getASDSystemAppRequestClass[0]()) initWithBundleID:@"com.apple.Home"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke;
  v5[3] = &unk_1E5BBCBD0;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 startWithErrorHandler:v5];
}

void __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 192);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2;
  v6[3] = &unk_1E5BBBD18;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
         && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  }
  {
    id v2 = [*(id *)(a1 + 40) bundleID];
    LogPrintF();
  }
}

- (void)_updateHomeStats
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(HMHome *)self->_homeKitSelectedHome accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v16 + 1) + 8 * i) category];
        uint64_t v9 = [v8 categoryType];
        unint64_t v10 = getHMAccessoryCategoryTypeHomePod_0[0]();
        int v11 = [v9 isEqual:v10];

        if (v11)
        {
          self->_hasHomePod = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    if (self->_hasHomePod) {
      uint64_t v12 = "yes";
    }
    else {
      uint64_t v12 = "no";
    }
    uint64_t v15 = v12;
    LogPrintF();
  }
  uint64_t v13 = [(HMHome *)self->_homeKitSelectedHome users];
  uint64_t v14 = [v13 count];

  self->_hasMultipleUsers = v14 != 0;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccount
{
  id v3 = [(HMAccessory *)self->_homeKitAccessory remoteLoginHandler];
  if (v3)
  {
    uint64_t v4 = self->_iTunesAccount;
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        uint64_t v5 = [(ACAccount *)v4 username];
        LogPrintF();
      }
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__SFDeviceOperationHomeKitSetup__updateAccount__block_invoke;
      v6[3] = &unk_1E5BBCBD0;
      id v7 = v4;
      id v8 = v3;
      [v8 updateLoggedInAccount:v7 completionHandler:v6];
    }
    else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30 {
           && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90 {
         && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __47__SFDeviceOperationHomeKitSetup__updateAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      id v10 = v3;
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v7 = _LogCategory_Initialize(), uint64_t v4 = v10, v7))
      {
        uint64_t v5 = [*(id *)(a1 + 32) username];
        LogPrintF();
LABEL_8:

        uint64_t v4 = v10;
      }
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    id v10 = 0;
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v8 = _LogCategory_Initialize(), uint64_t v4 = 0, v8))
    {
      uint64_t v5 = [*(id *)(a1 + 32) username];
      uint64_t v6 = [*(id *)(a1 + 40) loggedInAccount];
      uint64_t v9 = [v6 username];
      LogPrintF();

      goto LABEL_8;
    }
  }
}

- (NSDictionary)appDataSelf
{
  return self->_appDataSelf;
}

- (void)setAppDataSelf:(id)a3
{
}

- (HMAccessory)tvAudioInput
{
  return self->_tvAudioInput;
}

- (void)setTvAudioInput:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)homeKitAddedAccessory
{
  return self->_homeKitAddedAccessory;
}

- (HMHomeManager)homeKitHomeManager
{
  return self->_homeKitHomeManager;
}

- (BOOL)homeKitHomeManagerReady
{
  return self->_homeKitHomeManagerReady;
}

- (HMHome)homeKitSelectedHome
{
  return self->_homeKitSelectedHome;
}

- (NSString)homeKitSelectedRoomName
{
  return self->_homeKitSelectedRoomName;
}

- (NSString)iTunesAccountID
{
  return self->_iTunesAccountID;
}

- (void)setITunesAccountID:(id)a3
{
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
}

- (BOOL)keyExchangeOnly
{
  return self->_keyExchangeOnly;
}

- (void)setKeyExchangeOnly:(BOOL)a3
{
  self->_keyExchangeOnly = a3;
}

- (double)metricNonUserSeconds
{
  return self->_metricNonUserSeconds;
}

- (double)metricUserSeconds
{
  return self->_metricUserSeconds;
}

- (double)setupDeviceNonUserSeconds
{
  return self->_setupDeviceNonUserSeconds;
}

- (double)addDeviceNonUserSeconds
{
  return self->_addDeviceNonUserSeconds;
}

- (double)assignRoomNonUserSeconds
{
  return self->_assignRoomNonUserSeconds;
}

- (double)personalRequestsNonUserSeconds
{
  return self->_personalRequestsNonUserSeconds;
}

- (double)ulhNonUserSeconds
{
  return self->_ulhNonUserSeconds;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
}

- (BOOL)pauseAfterUserInput
{
  return self->_pauseAfterUserInput;
}

- (void)setPauseAfterUserInput:(BOOL)a3
{
  self->_pauseAfterUserInput = a3;
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setPauseHandler:(id)a3
{
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
}

- (HMAccessory)stereoCounterpart
{
  return self->_stereoCounterpart;
}

- (void)setStereoCounterpart:(id)a3
{
}

- (NSArray)psgHomePods
{
  return self->_psgHomePods;
}

- (void)setPsgHomePods:(id)a3
{
}

- (NSArray)psgStereoPairs
{
  return self->_psgStereoPairs;
}

- (void)setPsgStereoPairs:(id)a3
{
}

- (HMMediaGroup)existingMediaGroup
{
  return self->_existingMediaGroup;
}

- (void)setExistingMediaGroup:(id)a3
{
}

- (int)stereoRole
{
  return self->_stereoRole;
}

- (void)setStereoRole:(int)a3
{
  self->_int stereoRole = a3;
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(double)a3
{
  self->_timeoutInSeconds = a3;
}

- (double)odeonSeconds
{
  return self->_odeonSeconds;
}

- (void)setOdeonSeconds:(double)a3
{
  self->_odeonSeconds = a3;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_existingMediaGroup, 0);
  objc_storeStrong((id *)&self->_psgStereoPairs, 0);
  objc_storeStrong((id *)&self->_psgHomePods, 0);
  objc_storeStrong((id *)&self->_stereoCounterpart, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iTunesAccountID, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedHome, 0);
  objc_storeStrong((id *)&self->_homeKitHomeManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_appDataSelf, 0);
  objc_storeStrong((id *)&self->_hdsutilHKToken, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystem, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitAccessory, 0);
  objc_storeStrong((id *)&self->_homeKitDeviceSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitBrowser, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end