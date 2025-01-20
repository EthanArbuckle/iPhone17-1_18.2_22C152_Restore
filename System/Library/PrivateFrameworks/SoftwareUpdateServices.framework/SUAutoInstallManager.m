@interface SUAutoInstallManager
+ (id)rollbackRebootLaterTime;
- (BOOL)_queue_canGetAutoInstallOperation;
- (BOOL)_queue_isAutoInstallOperationReadyToBegin;
- (BOOL)_queue_isExpired;
- (BOOL)isAutoDownload;
- (BOOL)isAutoInstallOperationReadyToBegin;
- (BOOL)isAutoUpdateEnabled;
- (BOOL)isCurrentUpdateAutoUpdate;
- (SUAutoInstallManager)initWithManager:(id)a3;
- (SUAutoInstallManagerDelegate)delegate;
- (SUAutoUpdatePasscodePolicy)passcodePolicy;
- (SUSFollowUpController)followUpController;
- (SUState)state;
- (_SUAutoInstallOperationModel)operationModel;
- (id)_createOperationModel;
- (id)_queue_currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 notifyIfExpired:(BOOL)a4 error:(id *)a5;
- (id)currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 error:(id *)a4;
- (void)_installAttemptDone;
- (void)_queue_cancelAutoInstallOperation:(id)a3;
- (void)_queue_clearAutoInstallOperationForReason:(id)a3 disableKeybagStash:(BOOL)a4;
- (void)_queue_consentToAutoInstallOperation:(id)a3;
- (void)_queue_noteAutoInstallOperationDidExpire;
- (void)_queue_noteAutoInstallOperationWantsToBegin;
- (void)_queue_resumeOrResetStateIfNecessary;
- (void)_queue_setFailedToInstallError:(id)a3;
- (void)_queue_trySchedulingAnotherTimeInInstallWindow:(double)a3;
- (void)cancelAutoInstallOperation:(id)a3;
- (void)consentToAutoInstallOperation:(id)a3;
- (void)copyAutoInstallOperationForecast:(id *)a3 error:(id *)a4;
- (void)dealloc;
- (void)downloadWasInvalidated:(id)a3;
- (void)keybagInterfacePasscodeDidChange:(id)a3;
- (void)noteAutoInstallOperationDidExpire;
- (void)noteAutoInstallOperationUnlockWindowDidBegin;
- (void)noteAutoInstallOperationWantsToBegin;
- (void)noteInstallDidFail:(id)a3 withError:(id)a4;
- (void)noteInstallDidFinish:(id)a3;
- (void)passcodePolicyInterface:(id)a3 passcodePolicyTypeChanged:(unint64_t)a4;
- (void)resumeOrResetStateIfNecessary;
- (void)setDelegate:(id)a3;
- (void)setFailedToInstallError:(id)a3;
- (void)trySchedulingAnotherTimeInInstallWindow:(double)a3;
- (void)trySchedulingAutoInstallAgainLater;
- (void)unattendedInstallationKeybagCreated;
@end

@implementation SUAutoInstallManager

- (SUAutoInstallManager)initWithManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUAutoInstallManager;
  v6 = [(SUAutoInstallManager *)&v19 init];
  if (v6)
  {
    unsigned int v7 = time(0);
    srand(v7);
    uint64_t v8 = +[SUState currentState];
    state = v6->_state;
    v6->_state = (SUState *)v8;

    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v10 = +[SUAutoUpdatePasscodePolicy sharedInstance];
    passcodePolicy = v6->_passcodePolicy;
    v6->_passcodePolicy = (SUAutoUpdatePasscodePolicy *)v10;

    operationModel = v6->_operationModel;
    v6->_operationModel = 0;

    [(SUManagerInterface *)v6->_manager setPasscodePolicy:v6->_passcodePolicy];
    [(SUAutoUpdatePasscodePolicy *)v6->_passcodePolicy addObserver:v6];
    [(SUManagerInterface *)v6->_manager addObserver:v6];
    v13 = +[SUKeybagInterface sharedInstance];
    [v13 addObserver:v6];

    uint64_t v14 = +[SUSFollowUpController sharedController];
    followUpController = v6->_followUpController;
    v6->_followUpController = (SUSFollowUpController *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.softwareupdateservices.autoInstallManager.stateQueue", 0);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v16;

    v6->_autoInstallAttempted = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(SUManagerInterface *)self->_manager removeObserver:self];
  [(SUAutoUpdatePasscodePolicy *)self->_passcodePolicy removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallManager;
  [(SUAutoInstallManager *)&v3 dealloc];
}

- (void)resumeOrResetStateIfNecessary
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUAutoInstallManager_resumeOrResetStateIfNecessary__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUAutoInstallManager_resumeOrResetStateIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeOrResetStateIfNecessary");
}

- (void)_queue_resumeOrResetStateIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  objc_super v3 = +[SUScheduler sharedInstance];
  [v3 scheduleSimulatedAutoInstallTask];

  v4 = [(SUState *)self->_state lastAutoInstallOperationModel];
  SULogInfo(@"%s: lastOperation = %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
  if (v4)
  {
    v12 = [(SUState *)self->_state lastProductBuild];
    v13 = [(SUState *)self->_state lastProductVersion];
    uint64_t v14 = +[SUUtility currentProductBuild];
    v15 = +[SUUtility currentProductVersion];
    v119 = (void *)v14;
    v120 = v12;
    if ([v13 isEqualToString:v15]
      && ([v12 isEqualToString:v14] & 1) != 0)
    {
      int v23 = 0;
    }
    else
    {
      SULogInfo(@"New OS detected. Clearing last SUAutoInstallOperation", v16, v17, v18, v19, v20, v21, v22, v116);
      int v23 = 1;
    }
    v24 = [MEMORY[0x263EFF910] date];
    v25 = [v4 forecast];
    v26 = [v25 suEndDate];
    uint64_t v27 = [v24 compare:v26];

    if (v27 == 1)
    {
      SULogInfo(@"Saved SUAutoInstallOperation is expired", v28, v29, v30, v31, v32, v33, v34, v116);
      int v23 = 1;
    }
    uint64_t v35 = [(SUManagerInterface *)self->_manager download];
    if (!v35) {
      goto LABEL_12;
    }
    v43 = (void *)v35;
    v44 = [(SUManagerInterface *)self->_manager download];
    v45 = [v44 progress];
    char v46 = [v45 isDone];

    if (v46)
    {
      if (!v23)
      {
        SULogInfo(@"Last AutoInstall operation found\n %@", v36, v37, v38, v39, v40, v41, v42, (uint64_t)v4);
        objc_storeStrong((id *)&self->_operationModel, v4);
        [(SUAutoUpdatePasscodePolicy *)self->_passcodePolicy setCurrentPolicyType:1];
        goto LABEL_20;
      }
    }
    else
    {
LABEL_12:
      SULogInfo(@"There is no downloaded asset. Clearing last SUAutoInstallOperation", v36, v37, v38, v39, v40, v41, v42, v116);
    }
    if ([(SUAutoInstallManager *)self isAutoUpdateEnabled])
    {
      v54 = [(SUManagerInterface *)self->_manager download];
      v55 = [v54 progress];
      char v56 = [v55 isDone];

      SULogInfo(@"%s: canceling %@", v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
      v64 = +[SUScheduler sharedInstance];
      [v64 cancelAllAutoInstallTasks];

      [(SUAutoUpdatePasscodePolicy *)self->_passcodePolicy setCurrentPolicyType:0];
      if (v56)
      {
        [(SUState *)self->_state setLastAutoInstallOperationModel:0];
        [(SUState *)self->_state save];
        SULogInfo(@"Last AutoInstall operation found\n %@", v65, v66, v67, v68, v69, v70, v71, (uint64_t)v4);
        if ([(SUAutoInstallManager *)self isAutoUpdateEnabled])
        {
          id v121 = 0;
          v72 = [(SUAutoInstallManager *)self _queue_currentAutoInstallOperationCreatingIfNecessary:1 notifyIfExpired:1 error:&v121];
          id v73 = v121;
          operationModel = self->_operationModel;
          self->_operationModel = v72;

          if (v73)
          {
            SULogInfo(@"Error creating new autoInstallOperationModel: %@", v75, v76, v77, v78, v79, v80, v81, (uint64_t)v73);
LABEL_27:

            goto LABEL_28;
          }
        }
LABEL_20:
        if ([v4 agreementStatus] == 1)
        {
          v90 = [MEMORY[0x263EFF910] date];
          v91 = [v4 forecast];
          v92 = [v91 unlockStartDate];
          uint64_t v93 = [v90 compare:v92];

          if (v93 == 1)
          {
            SULogInfo(@"Unlock window passed. Firing unlock window timer manually", v94, v95, v96, v97, v98, v99, v100, v117);
            [(SUAutoInstallManager *)self noteAutoInstallOperationUnlockWindowDidBegin];
          }
        }
        id v73 = [(SUManagerInterface *)self->_manager download];
        v101 = [v73 progress];
        int v102 = [v101 isDone];

        if (v102)
        {
          SULogInfo(@"%s: Scheduling tonight activity because the download is finished", v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
          v110 = +[SUScheduler sharedInstance];
          v112 = self->_operationModel;
          p_operationModel = &self->_operationModel;
          v113 = [(_SUAutoInstallOperationModel *)v112 forecast];
          v114 = [(_SUAutoInstallOperationModel *)*(p_operationModel - 2) download];
          v115 = [v114 descriptor];
          [v110 scheduleAllAutoInstallUpdateTasks:v113 descriptor:v115];

          [(_SUAutoInstallOperationModel *)*(p_operationModel - 2) setIsInstallTonightScheduled:1];
        }
        else
        {
          SULogInfo(@"%s: Do not schedule tonight activity because the download is not finished", v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
          p_operationModel = &self->_operationModel;
        }
        [(_SUAutoInstallOperationModel *)*p_operationModel setWaitingUntilDownloadComplete:v102 ^ 1u];
        goto LABEL_27;
      }
    }
    else
    {
      SULogInfo(@"%s: canceling %@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
      v82 = +[SUScheduler sharedInstance];
      [v82 cancelAllAutoInstallTasks];

      [(SUAutoUpdatePasscodePolicy *)self->_passcodePolicy setCurrentPolicyType:0];
    }
    v83 = SULogBadging();
    SULogInfoForSubsystem(v83, @"resumeOrResetStateIfNecessary: Dismissing AutoUpdateBanner if present", v84, v85, v86, v87, v88, v89, v118);

    [(SUManagerInterface *)self->_manager dismissAutoUpdateBanner];
    [(SUState *)self->_state setLastAutoInstallOperationModel:0];
    [(SUState *)self->_state save];
LABEL_28:
  }
}

- (BOOL)isAutoDownload
{
  objc_super v3 = [(SUManagerInterface *)self->_manager download];
  v4 = [v3 downloadOptions];

  uint64_t v5 = [(SUManagerInterface *)self->_manager download];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 downloadOptions];
LABEL_5:
    uint64_t v9 = v7;
    char v10 = [v7 isAutoDownload];

    return v10;
  }
  uint64_t v8 = [v5 metadata];

  if (v8)
  {
    uint64_t v6 = [(SUManagerInterface *)self->_manager download];
    uint64_t v7 = [v6 metadata];
    goto LABEL_5;
  }
  return 0;
}

- (BOOL)isAutoUpdateEnabled
{
  return [(SUManagerInterface *)self->_manager isAutoUpdateEnabled];
}

- (BOOL)isCurrentUpdateAutoUpdate
{
  return [(SUManagerInterface *)self->_manager isCurrentUpdateAutoUpdate];
}

- (id)currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 error:(id *)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  uint64_t v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__SUAutoInstallManager_currentAutoInstallOperationCreatingIfNecessary_error___block_invoke;
  v10[3] = &unk_26447EFB8;
  v10[4] = self;
  v10[5] = &v12;
  BOOL v11 = a3;
  v10[6] = a4;
  dispatch_sync(stateQueue, v10);
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __77__SUAutoInstallManager_currentAutoInstallOperationCreatingIfNecessary_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:", *(unsigned __int8 *)(a1 + 56), 1, *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)copyAutoInstallOperationForecast:(id *)a3 error:(id *)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  uint64_t v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__SUAutoInstallManager_copyAutoInstallOperationForecast_error___block_invoke;
  v9[3] = &unk_26447C9B8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateQueue, v9);
  id v8 = 0;
  if (!v11[5])
  {
    id v8 = +[SUUtility errorWithCode:49];
  }
  if (a3) {
    *a3 = (id) v11[5];
  }
  if (a4) {
    *a4 = v8;
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __63__SUAutoInstallManager_copyAutoInstallOperationForecast_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_canGetAutoInstallOperation");
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v3)
    {
      uint64_t v4 = [v3 forecast];

      if (v4)
      {
        uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) forecast];
        uint64_t v6 = [v5 copy];
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v9 || (uint64_t result = [v9 _isForecastExpired], result))
    {
      uint64_t v10 = +[SUAutoInstallForecast createForecast];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void *)(v11 + 40);
      *(void *)(v11 + 40) = v10;
      return MEMORY[0x270F9A758](v10, v12);
    }
  }
  return result;
}

- (BOOL)_queue_canGetAutoInstallOperation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 isAutoSUDisabled];

  if (v4)
  {
    SULogInfo(@"AutoSU disabled. Not scheduling AutoSU timers", v5, v6, v7, v8, v9, v10, v11, v26);
    return 0;
  }
  else
  {
    v13 = [(SUManagerInterface *)self->_manager preferredLastScannedDescriptor];
    uint64_t v14 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v13];

    if (v14 && [v14 installTonightDisabled])
    {
      SULogInfo(@"AutoSU disabled for this update. Not scheduling AutoSU timers", v15, v16, v17, v18, v19, v20, v21, v26);
      char v12 = 0;
    }
    else
    {
      uint64_t v22 = [(SUManagerInterface *)self->_manager download];
      int v23 = v22;
      if (v22)
      {
        v24 = [v22 progress];
        if ([v24 isDone]) {
          char v12 = 1;
        }
        else {
          char v12 = [(SUManagerInterface *)self->_manager isDownloading];
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  return v12;
}

- (id)_queue_currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 notifyIfExpired:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (![(SUAutoInstallManager *)self _queue_canGetAutoInstallOperation]) {
    goto LABEL_25;
  }
  uint64_t v9 = [(SUManagerInterface *)self->_manager download];
  uint64_t v10 = self->_operationModel;
  if (!v10)
  {
LABEL_6:
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
  if (![(SUAutoInstallManager *)self _queue_isExpired])
  {
    uint64_t v31 = [v9 progress];
    int v32 = [v31 isDone];

    if (v32)
    {
      if ([(SUManagerInterface *)self->_manager isInstallTonightScheduled])
      {
        SULogInfo(@"%s: Do not schedule tonight activity because it has been scheduled", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
      }
      else
      {
        SULogInfo(@"%s: Scheduling tonight activity because the download is finished", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
        uint64_t v48 = +[SUScheduler sharedInstance];
        uint64_t v49 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
        uint64_t v50 = [v9 descriptor];
        [v48 scheduleAllAutoInstallUpdateTasks:v49 descriptor:v50];

        [(SUManagerInterface *)self->_manager setIsInstallTonightScheduled:1];
      }
    }
    else
    {
      SULogInfo(@"%s: Do not schedule tonight activity because the download is not finished", v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
    }
    [(_SUAutoInstallOperationModel *)self->_operationModel setWaitingUntilDownloadComplete:v32 ^ 1u];
    uint64_t v51 = self->_operationModel;

    goto LABEL_30;
  }
  if (v6)
  {
    [(SUAutoInstallManager *)self _queue_noteAutoInstallOperationDidExpire];
    goto LABEL_6;
  }
  operationModel = self->_operationModel;
  self->_operationModel = 0;

  if (v7)
  {
LABEL_7:
    uint64_t v11 = [(SUAutoInstallManager *)self _createOperationModel];
    char v12 = self->_operationModel;
    self->_operationModel = v11;

    if (self->_operationModel)
    {
      v13 = [v9 downloadOptions];
      int v14 = [v13 termsAndConditionsAgreementStatus];

      if (v14 == 1) {
        [(_SUAutoInstallOperationModel *)self->_operationModel setAgreementStatus:1];
      }
      uint64_t v15 = [v9 progress];
      int v16 = [v15 isDone];

      if (v16)
      {
        if ([(SUManagerInterface *)self->_manager isInstallTonightScheduled])
        {
          SULogInfo(@"%s: Do not schedule tonight activity because it has been scheduled", v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
        }
        else
        {
          SULogInfo(@"%s: Scheduling tonight activity because the download is finished", v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
          uint64_t v52 = +[SUScheduler sharedInstance];
          uint64_t v53 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
          v54 = [v9 descriptor];
          [v52 scheduleAllAutoInstallUpdateTasks:v53 descriptor:v54];

          [(SUManagerInterface *)self->_manager setIsInstallTonightScheduled:1];
        }
      }
      else
      {
        SULogInfo(@"%s: Do not schedule tonight activity because the download is not finished", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
      }
      [(_SUAutoInstallOperationModel *)self->_operationModel setWaitingUntilDownloadComplete:v16 ^ 1u];
      [(SUState *)self->_state setLastAutoInstallOperationModel:self->_operationModel];
      [(SUState *)self->_state save];
    }
  }
LABEL_24:

LABEL_25:
  v55 = self->_operationModel;
  if (a5 && !v55 && v7)
  {
    *a5 = +[SUUtility errorWithCode:45];
    v55 = self->_operationModel;
  }
  uint64_t v51 = v55;
LABEL_30:
  return v51;
}

- (void)cancelAutoInstallOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUAutoInstallManager_cancelAutoInstallOperation___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __51__SUAutoInstallManager_cancelAutoInstallOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstallOperation:", *(void *)(a1 + 40));
}

- (void)_queue_cancelAutoInstallOperation:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v4 = [(_SUAutoInstallOperationModel *)self->_operationModel id];
  int v5 = [v4 isEqual:v15];

  if (v5)
  {
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"SUAutoInstallOperationCancelledNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained autoInstallManager:self didCancelOperation:self->_operationModel];

    [(SUAutoInstallManager *)self _queue_clearAutoInstallOperationForReason:@"Canceled" disableKeybagStash:0];
  }
  else
  {
    SULogInfo(@"%s: unknown operationID: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUAutoInstallManager _queue_cancelAutoInstallOperation:]");
  }
}

- (void)consentToAutoInstallOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUAutoInstallManager_consentToAutoInstallOperation___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __54__SUAutoInstallManager_consentToAutoInstallOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_consentToAutoInstallOperation:", *(void *)(a1 + 40));
}

- (void)_queue_consentToAutoInstallOperation:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  id v6 = [(_SUAutoInstallOperationModel *)self->_operationModel id];
  int v7 = [v6 isEqual:v5];

  if (!v7) {
    return;
  }
  SULogInfo(@"AutoSU consented", v8, v9, v10, v11, v12, v13, v14, v45);
  [(_SUAutoInstallOperationModel *)self->_operationModel setAgreementStatus:1];
  id v15 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
  int v16 = [v15 unlockStartDate];
  uint64_t v17 = [MEMORY[0x263EFF910] date];
  if ([v16 compare:v17] == -1)
  {
    uint64_t v18 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
    uint64_t v19 = [v18 unlockEndDate];
    uint64_t v20 = [MEMORY[0x263EFF910] date];
    uint64_t v21 = [v19 compare:v20];

    if (v21 == 1)
    {
      SULogInfo(@"User consented during unlock window. Persisting stash", v22, v23, v24, v25, v26, v27, v28, v46);
      [(SUManagerInterface *)self->_manager persistStashOnUnlock];
    }
  }
  else
  {
  }
  [(SUState *)self->_state setLastAutoInstallOperationModel:self->_operationModel];
  [(SUState *)self->_state save];
  uint64_t v29 = [MEMORY[0x263F08A00] defaultCenter];
  [v29 postNotificationName:@"SUAutoInstallOperationDidConsentNotification" object:0];

  if ([(SUManagerInterface *)self->_manager isAutoUpdateEnabled])
  {
    uint64_t v30 = +[SUKeybagInterface sharedInstance];
    char v31 = [v30 hasPasscodeSet];

    if ((v31 & 1) == 0)
    {
      uint64_t v35 = SULogBadging();
      uint64_t v42 = v35;
      uint64_t v43 = @"Auto update consented and no passcode set. Displaying banner";
      goto LABEL_13;
    }
  }
  if ([(SUManagerInterface *)self->_manager isInstallTonightScheduled])
  {
    int v32 = [(SUManagerInterface *)self->_manager download];
    uint64_t v33 = [v32 progress];
    int v34 = [v33 isDone];

    if (v34)
    {
      uint64_t v35 = SULogBadging();
      uint64_t v42 = v35;
      uint64_t v43 = @"Install tonight is scheduled and download is done. Displaying banner";
LABEL_13:
      SULogInfoForSubsystem(v35, v43, v36, v37, v38, v39, v40, v41, v46);

      uint64_t v44 = +[SUScheduler sharedInstance];
      [v44 schedulePresentAutoUpdateBanner];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoInstallManager:self operationWasConsented:self->_operationModel];
}

- (void)trySchedulingAutoInstallAgainLater
{
  uint64_t v3 = +[SUPreferences sharedInstance];
  id v36 = [v3 autoInstallRetryDelay];

  SULogDebug(@"defaultDelay = %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v36);
  double v11 = 900.0;
  if (v36 && (int)[v36 intValue] >= 1)
  {
    uint64_t v12 = [v36 intValue];
    double v11 = (double)(int)v12;
    SULogInfo(@"delay is set to %d seconds by default", v13, v14, v15, v16, v17, v18, v19, v12);
  }
  uint64_t v20 = +[SUPreferences sharedInstance];
  int v21 = [v20 disableAutoInstallJitter];

  if (v21) {
    SULogInfo(@"%s: disableAutoInstallJitter default is set, ignoring jitter", v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[SUAutoInstallManager trySchedulingAutoInstallAgainLater]");
  }
  else {
    double v11 = v11
  }
        + (double)+[SUUtility randomIntWithMinVal:0 maxVal:300];
  SULogInfo(@"Will retry to auto install in %d seconds", v29, v30, v31, v32, v33, v34, v35, (int)v11);
  [(SUAutoInstallManager *)self trySchedulingAnotherTimeInInstallWindow:v11];
}

- (void)trySchedulingAnotherTimeInInstallWindow:(double)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SUAutoInstallManager_trySchedulingAnotherTimeInInstallWindow___block_invoke;
  v6[3] = &unk_26447CA30;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(stateQueue, v6);
}

uint64_t __64__SUAutoInstallManager_trySchedulingAnotherTimeInInstallWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_trySchedulingAnotherTimeInInstallWindow:", *(double *)(a1 + 40));
}

- (void)_queue_trySchedulingAnotherTimeInInstallWindow:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v5 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
  id v20 = [v5 suEndDate];

  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  uint64_t v7 = [MEMORY[0x263F08790] localizedStringFromDate:v20 dateStyle:1 timeStyle:1];
  uint64_t v8 = [MEMORY[0x263F08790] localizedStringFromDate:v6 dateStyle:1 timeStyle:1];
  if ([v6 compare:v20] == -1)
  {
    uint64_t v17 = +[SUScheduler sharedInstance];
    uint64_t v18 = [(SUManagerInterface *)self->_manager download];
    uint64_t v19 = [v18 descriptor];
    [v17 scheduleAutoInstallStartInstallTaskWithDate:v6 descriptor:v19 fromFailure:1];

    uint64_t v16 = @"Window ends on %@; attempting to reschedule auto install on %@";
  }
  else
  {
    uint64_t v16 = @"Window ends on %@; cannot reschedule auto install on %@";
  }
  SULogInfo(v16, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
}

- (void)noteAutoInstallOperationUnlockWindowDidBegin
{
  SULogInfo(@"Unlock window did begin", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v10);
  manager = self->_manager;
  [(SUManagerInterface *)manager addUnlockCallback:sel_persistStashOnUnlock forKey:@"unlockCallbackPersistStash"];
}

- (BOOL)isAutoInstallOperationReadyToBegin
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SUAutoInstallManager_isAutoInstallOperationReadyToBegin__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__SUAutoInstallManager_isAutoInstallOperationReadyToBegin__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isAutoInstallOperationReadyToBegin");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isAutoInstallOperationReadyToBegin
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  operationModel = self->_operationModel;
  if (operationModel)
  {
    if ([(_SUAutoInstallOperationModel *)operationModel agreementStatus] != 1) {
      SULogInfo(@"Anomaly: Ready to install timer fired, but operation was not agreed to. (Proceeding to anyway)", v3, v4, v5, v6, v7, v8, v9, v13);
    }
    uint64_t v11 = @"Auto install operation is ready";
  }
  else
  {
    uint64_t v11 = @"Ready to install timer fired, but operation model is nil";
  }
  SULogInfo(v11, v3, v4, v5, v6, v7, v8, v9, v13);
  return operationModel != 0;
}

- (void)noteAutoInstallOperationWantsToBegin
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 disableAutoInstallJitter];

  if (v4)
  {
    SULogInfo(@"%s: disableAutoInstallJitter default is set, ignoring jitter", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUAutoInstallManager noteAutoInstallOperationWantsToBegin]");
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(stateQueue, block);
  }
  else
  {
    uint64_t v13 = +[SUUtility randomIntWithMinVal:0 maxVal:300];
    double v14 = (double)(int)v13;
    SULogInfo(@"[Auto Install Jitter] Starting auto installation in %d seconds", v15, v16, v17, v18, v19, v20, v21, v13);
    dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    uint64_t v23 = self->_stateQueue;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke_2;
    v24[3] = &unk_26447C878;
    v24[4] = self;
    dispatch_after(v22, v23, v24);
  }
}

uint64_t __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationWantsToBegin");
}

uint64_t __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationWantsToBegin");
}

- (void)_queue_noteAutoInstallOperationWantsToBegin
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(@"AutoInstallOperation wants to begin", v3, v4, v5, v6, v7, v8, v9, v12);
  [(SUManagerInterface *)self->_manager reportOTAAutoTriggeredEvent];
  self->_autoInstallAttempted = 1;
  if ([(SUAutoInstallManager *)self _queue_isAutoInstallOperationReadyToBegin])
  {
    [(SUManagerInterface *)self->_manager setIsInstallTonight:1];
    uint64_t v10 = objc_alloc_init(SUInstallOptions);
    [(SUInstallOptions *)v10 setAutomaticInstallation:1];
    manager = self->_manager;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke;
    v13[3] = &unk_26447F008;
    v13[4] = self;
    [(SUManagerInterface *)manager isUpdateReadyForInstallationWithOptions:v10 withResult:v13];
  }
}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_2;
  block[3] = &unk_26447EFE0;
  uint64_t v9 = *(void *)(a1 + 32);
  char v13 = a2;
  block[4] = v9;
  id v12 = v7;
  char v14 = a3;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ([*(id *)(a1 + 32) isAutoInstallOperationReadyToBegin])
  {
    uint64_t v17 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      [v17 setFailedToInstallError:0];
      uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 postNotificationName:@"SUAutoInstallOperationIsReadyToInstallNotification" object:0];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = [v20 operationModel];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_3;
      v41[3] = &unk_26447CF50;
      v41[4] = *(void *)(a1 + 32);
      [WeakRetained autoInstallManager:v20 isReadyToInstall:v21 withResult:v41];
    }
    else
    {
      [v17 setFailedToInstallError:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _installAttemptDone];
      if (*(unsigned char *)(a1 + 49))
      {
        SULogInfo(@"Could not install due to %@.", v23, v24, v25, v26, v27, v28, v29, *(void *)(a1 + 40));
        [*(id *)(a1 + 32) trySchedulingAutoInstallAgainLater];
      }
      else
      {
        SULogInfo(@"Could not install due to %@, and should not retry. Canceling auto install", v23, v24, v25, v26, v27, v28, v29, *(void *)(a1 + 40));
        uint64_t v30 = +[SUScheduler sharedInstance];
        [v30 cancelAutoInstallStartInstallTask];
      }
      if ([*(id *)(a1 + 32) isCurrentUpdateAutoUpdate]
        && ![*(id *)(*(void *)(a1 + 32) + 48) isCurrentlyPresentingFollowUpType:2])
      {
        SULogInfo(@"AutoUpdate cannot be installed, but user is not yet aware of the same..NOT presenting error alert", v31, v32, v33, v34, v35, v36, v37, a9);
      }
      else
      {
        SULogInfo(@"AutoUpdate cannot be installed and user has been informed of the update..Presenting error alert", v31, v32, v33, v34, v35, v36, v37, v40);
        uint64_t v38 = *(void *)(a1 + 40);
        uint64_t v39 = *(void **)(*(void *)(a1 + 32) + 16);
        [v39 autoSUFailedWithError:v38];
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 48)) {
      dispatch_time_t v22 = @"Yes";
    }
    else {
      dispatch_time_t v22 = @"No";
    }
    SULogInfo(@"Not ready to begin AutoInstall operation. Is update ready for install? %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v22);
  }
}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v24 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 setFailedToInstallError:0];
    SULogInfo(@"isReadyToInstall Returned YES", v6, v7, v8, v9, v10, v11, v12, v23);
    goto LABEL_11;
  }
  [v5 setFailedToInstallError:v24];
  [*(id *)(a1 + 32) _installAttemptDone];
  if (!v24)
  {
    dispatch_time_t v22 = @"nil";
    goto LABEL_9;
  }
  uint64_t v20 = [(__CFString *)v24 domain];
  int v21 = [v20 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  uint64_t v13 = (uint64_t)v24;
  dispatch_time_t v22 = v24;
  if (!v21)
  {
LABEL_9:
    SULogInfo(@"isReadyToInstall (SB) Returned NO. Error: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v22);
LABEL_10:
    [*(id *)(a1 + 32) trySchedulingAutoInstallAgainLater];
    goto LABEL_11;
  }
  SULogInfo(@"isReadyToInstall (SUS) Returned NO. Error: %@", (uint64_t)v24, v14, v15, v16, v17, v18, v19, (uint64_t)v24);
  if ([(__CFString *)v24 code] != 49 && [(__CFString *)v24 code] != 48) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)noteAutoInstallOperationDidExpire
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUAutoInstallManager_noteAutoInstallOperationDidExpire__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __57__SUAutoInstallManager_noteAutoInstallOperationDidExpire__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationDidExpire");
}

- (void)_queue_noteAutoInstallOperationDidExpire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(@"AutoInstallOperation expired", v3, v4, v5, v6, v7, v8, v9, v26);
  uint64_t v28 = self->_failedToInstallError;
  if (!v28)
  {
    if (self->_autoInstallAttempted)
    {
      uint64_t v28 = 0;
    }
    else
    {
      SULogInfo(@"DAS failed to run auto install activity", v10, v11, v12, v13, v14, v15, v16, v27);
      uint64_t v28 = +[SUUtility errorWithCode:77 originalError:0];
    }
  }
  if ([(SUAutoInstallManager *)self isCurrentUpdateAutoUpdate]
    && ![(SUSFollowUpController *)self->_followUpController isCurrentlyPresentingFollowUpType:2])
  {
    SULogInfo(@"AutoUpdate install operation expired but user is not aware of the update..NOT Presenting error alert", v17, v18, v19, v20, v21, v22, v23, v27);
  }
  else
  {
    SULogInfo(@"AutoUpdate install operation expired and user has been informed of update..Presenting error alert", v17, v18, v19, v20, v21, v22, v23, v27);
    if ([(_SUAutoInstallOperationModel *)self->_operationModel agreementStatus] == 1) {
      [(SUManagerInterface *)self->_manager autoSUFailedWithError:v28];
    }
    uint64_t v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 postNotificationName:@"SUAutoInstallOperationDidExpireNotification" object:0];
  }
  [(SUManagerInterface *)self->_manager reportPostponedEvent:v28 withStatus:*MEMORY[0x263F77FC0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained autoInstallManager:self didExpireOperation:self->_operationModel withError:v28];

  [(SUAutoInstallManager *)self _queue_clearAutoInstallOperationForReason:@"Expired" disableKeybagStash:[(SUAutoInstallManager *)self isCurrentUpdateAutoUpdate] ^ 1];
}

- (void)keybagInterfacePasscodeDidChange:(id)a3
{
  SULogInfo(@"Device passcode changed", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v10);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUAutoInstallManager_keybagInterfacePasscodeDidChange___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __57__SUAutoInstallManager_keybagInterfacePasscodeDidChange___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 40) currentPolicyType];
    if (!result)
    {
      uint64_t v3 = *(void **)(*(void *)(v2 + 32) + 40);
      return [v3 setCurrentPolicyType:1];
    }
  }
  return result;
}

- (void)passcodePolicyInterface:(id)a3 passcodePolicyTypeChanged:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 autoInstallManager:self passcodePolicyChanged:a4 forOperation:self->_operationModel];
    }
  }
}

- (void)downloadWasInvalidated:(id)a3
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUAutoInstallManager_downloadWasInvalidated___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __47__SUAutoInstallManager_downloadWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [v1[4] id];
  objc_msgSend(v1, "_queue_cancelAutoInstallOperation:", v2);
}

- (void)unattendedInstallationKeybagCreated
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUAutoInstallManager_unattendedInstallationKeybagCreated__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __59__SUAutoInstallManager_unattendedInstallationKeybagCreated__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addUnlockCallback:sel_persistStashOnUnlock forKey:@"unlockCallbackPersistStash"];
  [*(id *)(*(void *)(a1 + 32) + 16) persistStashOnUnlock];
  uint64_t result = [*(id *)(a1 + 32) isCurrentUpdateAutoUpdate];
  if (result)
  {
    uint64_t v3 = SULogBadging();
    SULogInfoForSubsystem(v3, @"unattendedInstallationKeybagCreated: isAutoUpdate and isAutoDownload are true..Scheduling presentation of AutoUpdateBanner", v4, v5, v6, v7, v8, v9, v12);

    char v10 = +[SUScheduler sharedInstance];
    [v10 schedulePresentAutoUpdateBanner];

    id v11 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v11 setCurrentPolicyType:0];
  }
  return result;
}

- (void)noteInstallDidFinish:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_after(v4, stateQueue, block);
  uint64_t v6 = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke_2;
  v7[3] = &unk_26447C878;
  v7[4] = self;
  dispatch_async(v6, v7);
}

void __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _installAttemptDone];
  id v1 = +[SUScheduler sharedInstance];
  [v1 cancelAutoInstallStartInstallTask];
}

uint64_t __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearAutoInstallOperationForReason:disableKeybagStash:", @"InstallDidFinish", 0);
}

- (void)noteInstallDidFail:(id)a3 withError:(id)a4
{
  id v15 = a4;
  [(SUAutoInstallManager *)self _installAttemptDone];
  uint64_t v5 = [v15 userInfo];
  uint64_t v6 = [v5 safeObjectForKey:@"SUAutomaticInstallation" ofClass:objc_opt_class()];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    SULogInfo(@"[SUAutoInstallManager] A previous auto installation failed due to error %@, retrying...", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v15);

    [(SUAutoInstallManager *)self trySchedulingAutoInstallAgainLater];
  }
  else
  {
    SULogInfo(@"[SUAutoInstallManager] A previous manual installation failed due to error %@, nothing to do here", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v15);
  }
}

- (BOOL)_queue_isExpired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v3 = [(_SUAutoInstallOperationModel *)self->_operationModel forecast];
  dispatch_time_t v4 = [v3 suEndDate];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  BOOL v6 = [v4 compare:v5] == -1;

  return v6;
}

- (void)_queue_clearAutoInstallOperationForReason:(id)a3 disableKeybagStash:(BOOL)a4
{
  BOOL v4 = a4;
  stateQueue = self->_stateQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  SULogInfo(@"clearing autoInstallOperation for reason: %@, destroying keybag stash: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  LODWORD(stateQueue) = [v7 isEqualToString:@"InstallDidFinish"];

  id v15 = +[SUScheduler sharedInstance];
  [v15 cancelAllAutoInstallTasksIncludingStartInstallTask:stateQueue ^ 1];

  [(SUManagerInterface *)self->_manager setIsInstallTonight:0];
  [(SUManagerInterface *)self->_manager setIsInstallTonightScheduled:0];
  SULogInfo(@"Setting isInstallTonightScheduled to NO", v16, v17, v18, v19, v20, v21, v22, v37);
  [(SUAutoUpdatePasscodePolicy *)self->_passcodePolicy setCurrentPolicyType:0];
  self->_autoInstallAttempted = 0;
  [(SUManagerInterface *)self->_manager dismissAutoUpdateBanner];
  if ((stateQueue & 1) == 0)
  {
    manager = self->_manager;
    uint64_t v24 = [(SUManagerInterface *)manager download];
    uint64_t v25 = [v24 descriptor];
    [(SUManagerInterface *)manager badgeSettingsForManualSoftwareUpdate:v25];
  }
  if ([(SUState *)self->_state stashbagPersisted])
  {
    if (!v4) {
      goto LABEL_9;
    }
    [(SUState *)self->_state setStashbagPersisted:0];
    [(SUState *)self->_state save];
    uint64_t v33 = MKBKeyBagKeyStashCreateWithMode();
    if (v33)
    {
      SULogInfo(@"MKBKeyBagKeyStashCreateWithMode returned error %d, continuing..", v26, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_9;
    }
    uint64_t v34 = @"Stashbag un-persisted successfully";
  }
  else
  {
    uint64_t v34 = @"No stashbag has been persisted.";
  }
  SULogInfo(v34, v26, v27, v28, v29, v30, v31, v32, v38);
LABEL_9:
  [(SUManagerInterface *)self->_manager removeUnlockCallback:@"unlockCallbackPersistStash"];
  operationModel = self->_operationModel;
  self->_operationModel = 0;

  [(SUState *)self->_state setLastAutoInstallOperationModel:0];
  state = self->_state;
  [(SUState *)state save];
}

- (id)_createOperationModel
{
  id v2 = +[SUAutoInstallForecast createForecast];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_SUAutoInstallOperationModel);
    [(_SUAutoInstallOperationModel *)v3 setForecast:v2];
    BOOL v4 = [MEMORY[0x263F08C38] UUID];
    [(_SUAutoInstallOperationModel *)v3 setId:v4];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (_SUAutoInstallOperationModel)operationModel
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__21;
  uint64_t v11 = __Block_byref_object_dispose__21;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SUAutoInstallManager_operationModel__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (_SUAutoInstallOperationModel *)v4;
}

void __38__SUAutoInstallManager_operationModel__block_invoke(uint64_t a1)
{
}

- (void)_installAttemptDone
{
  id v2 = +[SUScheduler sharedInstance];
  [v2 setAutoInstallActivityStateDone];
}

- (void)setFailedToInstallError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUAutoInstallManager_setFailedToInstallError___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __48__SUAutoInstallManager_setFailedToInstallError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFailedToInstallError:", *(void *)(a1 + 40));
}

- (void)_queue_setFailedToInstallError:(id)a3
{
  id v4 = (NSError *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(@"_failedToInstallError changed from %@ to %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)self->_failedToInstallError);
  failedToInstallError = self->_failedToInstallError;
  self->_failedToInstallError = v4;
}

+ (id)rollbackRebootLaterTime
{
  id v2 = objc_alloc_init(MEMORY[0x263F34FD8]);
  uint64_t v10 = v2;
  if (v2)
  {
    uint64_t v11 = [v2 getUnlockAndSoftwareUpdateTimes];
    uint64_t v19 = v11;
    if (v11)
    {
      uint64_t v20 = [v11 objectForKeyedSubscript:*MEMORY[0x263F351A0]];
    }
    else
    {
      SULogInfo(@"No SoftwareUpdate times found from _CDSleepForAutoSu", v12, v13, v14, v15, v16, v17, v18, v22);
      uint64_t v20 = 0;
    }
  }
  else
  {
    SULogInfo(@"Unable to allocate _CDSleepForAutoSu to get rollback reboot time", v3, v4, v5, v6, v7, v8, v9, v22);
    uint64_t v20 = 0;
  }

  return v20;
}

- (SUAutoInstallManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUAutoInstallManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUState)state
{
  return self->_state;
}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  return self->_passcodePolicy;
}

- (SUSFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedToInstallError, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_passcodePolicy, 0);
  objc_storeStrong((id *)&self->_operationModel, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end