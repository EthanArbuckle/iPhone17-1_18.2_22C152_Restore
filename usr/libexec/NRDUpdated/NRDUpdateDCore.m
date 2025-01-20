@interface NRDUpdateDCore
- (BOOL)brainLoadRequiresUnlock;
- (BOOL)forceBrainUpdate;
- (BOOL)isPasscodeLocked;
- (Class)_infoClassForAction:(id)a3;
- (MAAsset)loadBrainAsset;
- (MAAsset)localBrainAsset;
- (MAAsset)updateBrainAsset;
- (NRDUpdateDCore)initWithDelegate:(id)a3;
- (NRDUpdateDCoreDelegate)delegate;
- (NSBackgroundActivityScheduler)periodicScheduler;
- (NSBackgroundActivityScheduler)rescanScheduler;
- (NSDictionary)stateTable;
- (NSDictionary)updateOptions;
- (NSNumber)updateAttempt;
- (NSString)uuid;
- (OS_dispatch_queue)keyBagQueue;
- (OS_dispatch_queue)updateQueue;
- (SUCoreFSM)updatedFSM;
- (SUCoreMobileAsset)maControl;
- (SUCorePolicyUpdateBrain)downloadPolicy;
- (SUCorePolicyUpdateBrain)scanPolicy;
- (SUCoreScan)scanner;
- (double)_minimumInterval:(double)a3;
- (id)brain;
- (id)findLocalBrainAsset;
- (id)runningBrain;
- (int)keyBagStateChangedNotifyToken;
- (int64_t)actionBeginBrainScan:(id *)a3;
- (int64_t)actionCheckDeviceUnlockConstraint:(id *)a3;
- (int64_t)actionDownloadBrainUpdate:(id *)a3;
- (int64_t)actionLoadBrain:(id *)a3;
- (int64_t)actionLoadPersisted:(id *)a3;
- (int64_t)actionPeriodicScan:(id *)a3;
- (int64_t)actionRunBrain:(id *)a3;
- (int64_t)actionScheduleRetry:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)actionWaitForUnlock:(id *)a3;
- (int64_t)getSchedulerQOS;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)cleanBeforeScan;
- (void)cleanReScanScheduler;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)findLocalBrainAsset;
- (void)getSchedulerQOS;
- (void)maDownloadFailed:(id)a3;
- (void)maDownloadProgress:(id)a3;
- (void)maDownloadStalled:(id)a3;
- (void)maDownloaded:(id)a3;
- (void)newBrain:(id)a3;
- (void)newSchedulerWithIdentifier:(id)a3 reply:(id)a4;
- (void)performUpdate:(id)a3;
- (void)registerUpdatedFSMhandlers;
- (void)scheduleNRDUpdateBrainPeriodicScan;
- (void)scheduleNRDUpdateBrainReScan:(BOOL)a3;
- (void)setBrain:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)setForceBrainUpdate:(BOOL)a3;
- (void)setKeyBagQueue:(id)a3;
- (void)setKeyBagStateChangedNotifyToken:(int)a3;
- (void)setLoadBrainAsset:(id)a3;
- (void)setLocalBrainAsset:(id)a3;
- (void)setMaControl:(id)a3;
- (void)setPeriodicScheduler:(id)a3;
- (void)setRescanScheduler:(id)a3;
- (void)setRunningBrain:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setScanner:(id)a3;
- (void)setStateTable:(id)a3;
- (void)setUpdateAttempt:(id)a3;
- (void)setUpdateBrainAsset:(id)a3;
- (void)setUpdateOptions:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUpdatedFSM:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NRDUpdateDCore

- (NRDUpdateDCore)initWithDelegate:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NRDUpdateDCore;
  v5 = [(NRDUpdateDCore *)&v53 init];
  if (v5)
  {
    id v51 = v4;
    uint64_t v50 = kSU_S_Startup;
    v112[0] = kSU_S_Startup;
    v110[0] = @"ProceedToNextUpdateStep";
    uint64_t v6 = kSUCoreNextStateKey;
    uint64_t v7 = kSU_S_LoadingPersisted;
    uint64_t v8 = kSUCoreActionKey;
    v108[0] = kSUCoreNextStateKey;
    v108[1] = kSUCoreActionKey;
    uint64_t v9 = kSU_A_LoadPersisted;
    v109[0] = kSU_S_LoadingPersisted;
    v109[1] = kSU_A_LoadPersisted;
    v49 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
    v111[0] = v49;
    v110[1] = @"PeriodicScanRequested";
    v106[0] = v6;
    v106[1] = v8;
    v107[0] = v7;
    v107[1] = v9;
    v48 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:2];
    v111[1] = v48;
    v47 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];
    v113[0] = v47;
    v112[1] = v7;
    v104[0] = @"NoLocalBrainFound";
    v102[0] = v6;
    v102[1] = v8;
    v103[0] = @"ScanningBrain";
    v103[1] = @"ActionBeginBrainScan";
    v46 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
    v105[0] = v46;
    v104[1] = @"LocalBrainFound";
    v100[0] = v6;
    v100[1] = v8;
    v101[0] = @"CheckingDeviceUnlockConstraint";
    v101[1] = @"ActionCheckDeviceUnlockConstraint";
    v45 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:2];
    v105[1] = v45;
    v44 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
    v113[1] = v44;
    v112[2] = @"ScanningBrain";
    v98[0] = @"NoRemoteBrainFound";
    v96[0] = v6;
    v96[1] = v8;
    v97[0] = @"SchedulingRetry";
    v97[1] = @"ActionScheduleRetry";
    v43 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
    v99[0] = v43;
    v98[1] = @"ErrorGeneric";
    v94[0] = v6;
    v94[1] = v8;
    v95[0] = @"SchedulingRetry";
    v95[1] = @"ActionScheduleRetry";
    v42 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
    v99[1] = v42;
    v98[2] = @"ProceedToNextUpdateStep";
    v92[0] = v6;
    v92[1] = v8;
    v93[0] = @"DownloadingBrain";
    v93[1] = @"ActionDownloadBrain";
    v41 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
    v99[2] = v41;
    v40 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
    v113[2] = v40;
    v112[3] = @"DownloadingBrain";
    v90[0] = @"ProceedToNextUpdateStep";
    v88[0] = v6;
    v88[1] = v8;
    v89[0] = @"CheckingDeviceUnlockConstraint";
    v89[1] = @"ActionCheckDeviceUnlockConstraint";
    v39 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
    v91[0] = v39;
    v90[1] = kSU_E_DownloadFailed;
    v86[0] = v6;
    v86[1] = v8;
    v87[0] = @"SchedulingRetry";
    v87[1] = @"ActionScheduleRetry";
    v38 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
    v91[1] = v38;
    v37 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
    v113[3] = v37;
    v112[4] = @"CheckingDeviceUnlockConstraint";
    v84[0] = @"DeviceLocked";
    v82[0] = v6;
    v82[1] = v8;
    v83[0] = @"WaitingForUnlock";
    v83[1] = @"ActionWaitForUnlock";
    v36 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
    v85[0] = v36;
    v84[1] = @"DeviceUnlocked";
    v80[0] = v6;
    v80[1] = v8;
    v81[0] = @"LoadingBrain";
    v81[1] = @"ActionLoadBrain";
    v35 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
    v85[1] = v35;
    v34 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
    v113[4] = v34;
    v112[5] = @"WaitingForUnlock";
    v78[0] = @"DeviceUnlocked";
    v76[0] = v6;
    v76[1] = v8;
    v77[0] = @"LoadingBrain";
    v77[1] = @"ActionLoadBrain";
    v33 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    v79[0] = v33;
    v78[1] = @"PeriodicScanRequested";
    uint64_t v74 = v8;
    CFStringRef v75 = @"ActionWaitForUnlock";
    v32 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    v79[1] = v32;
    v78[2] = @"ProceedToNextUpdateStep";
    uint64_t v72 = v8;
    CFStringRef v73 = @"ActionWaitForUnlock";
    v31 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    v79[2] = v31;
    v30 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
    v113[5] = v30;
    v112[6] = @"LoadingBrain";
    v70[0] = @"ProceedToNextUpdateStep";
    v68[0] = v6;
    v68[1] = v8;
    v69[0] = @"RunningBrain";
    v69[1] = @"ActionRunBrain";
    v29 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
    v70[1] = @"ErrorGeneric";
    v71[0] = v29;
    v66[0] = v6;
    v66[1] = v8;
    v67[0] = @"SchedulingRetry";
    v67[1] = @"ActionScheduleRetry";
    v28 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
    v71[1] = v28;
    v27 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    v113[6] = v27;
    v112[7] = @"RunningBrain";
    CFStringRef v63 = @"ActionRunBrain";
    v64[0] = @"ProceedToNextUpdateStep";
    uint64_t v62 = v8;
    v10 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    v64[1] = @"PeriodicScanRequested";
    v65[0] = v10;
    uint64_t v60 = v8;
    CFStringRef v61 = @"ActionPeriodicScan";
    v11 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    v65[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
    v113[7] = v12;
    v112[8] = @"SchedulingRetry";
    v58[0] = @"ProceedToNextUpdateStep";
    v56[0] = v6;
    v56[1] = v8;
    v57[0] = @"ScanningBrain";
    v57[1] = @"ActionBeginBrainScan";
    v13 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
    v58[1] = @"PeriodicScanRequested";
    v59[0] = v13;
    v54[0] = v6;
    v54[1] = v8;
    v55[0] = @"ScanningBrain";
    v55[1] = @"ActionBeginBrainScan";
    v14 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v59[1] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
    v113[8] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:9];

    id v17 = [objc_alloc((Class)NSDictionary) initWithDictionary:v16 copyItems:1];
    [(NRDUpdateDCore *)v5 setStateTable:v17];

    v18 = nrdSharedLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Creating FSM", buf, 2u);
    }

    id v19 = [objc_alloc((Class)SUCoreFSM) initMachine:@"NRDUpdated" withTable:v5->_stateTable startingIn:v50];
    [(NRDUpdateDCore *)v5 setUpdatedFSM:v19];

    [(NRDUpdateDCore *)v5 setScanPolicy:0];
    [(NRDUpdateDCore *)v5 setDownloadPolicy:0];
    [(NRDUpdateDCore *)v5 registerUpdatedFSMhandlers];
    v20 = [(NRDUpdateDCore *)v5 updatedFSM];
    [v20 activateMachine];

    id v4 = v51;
    [(NRDUpdateDCore *)v5 setDelegate:v51];
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.NRDUpdated.keybag", 0);
    [(NRDUpdateDCore *)v5 setKeyBagQueue:v21];

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.NRDUpdated.update", 0);
    [(NRDUpdateDCore *)v5 setUpdateQueue:v22];

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    fsmSemaphore = v5->_fsmSemaphore;
    v5->_fsmSemaphore = (OS_dispatch_semaphore *)v23;

    v25 = nrdSharedLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Initialization of NRDUpdateDCore complete", buf, 2u);
    }
  }
  return v5;
}

- (Class)_infoClassForAction:(id)a3
{
  if ([a3 compare:@"ActionScheduleRetry"])
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (void)registerUpdatedFSMhandlers
{
  v3 = [(NRDUpdateDCore *)self stateTable];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke;
  v4[3] = &unk_1000189F0;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2;
  v7[3] = &unk_1000189C8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 objectForKey:kSUCoreActionKey];
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) updatedFSM];
    [v6 registerAction:v5 ForEvent:v7 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 32) withInfoClass:objc_msgSend(*(id *)(a1 + 32), "_infoClassForAction:", v5)];
  }
}

- (id)findLocalBrainAsset
{
  id v2 = [objc_alloc((Class)SUCorePolicyUpdateBrain) initWithSoftwareUpdateAssetType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" documentationAssetType:0 usingExtensions:0];
  [v2 setAllowSameVersion:1];
  [v2 setRestrictToFull:1];
  [v2 setReleaseType:0];
  v3 = +[NSNumber numberWithInt:1];
  [v2 setCompatibilityVersion:v3];

  id v4 = [v2 constructSoftwareUpdateMAAssetQuery];
  [v4 returnTypes:1];
  [v4 setDoNotBlockOnNetworkStatus:1];
  if ([v4 queryMetaDataSync])
  {
    id v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore findLocalBrainAsset]();
    }
    id v6 = 0;
    id v7 = 0;
    goto LABEL_10;
  }
  id v7 = [v4 results];
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = nrdSharedLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found %lu brain assets.  Removing all...", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke;
    v11[3] = &unk_100018A18;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    id v5 = v12;
    +[SUCorePurge removeAllAssetsOfType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" completion:v11];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

LABEL_9:
    id v6 = 0;
    goto LABEL_10;
  }
  if (![v7 count])
  {
    id v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No local brain asset found", buf, 2u);
    }
    goto LABEL_9;
  }
  id v6 = [v7 firstObject];
  id v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 description];
    *(_DWORD *)buf = 138543362;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found local brain asset:%{public}@", buf, 0xCu);
  }
LABEL_10:

  return v6;
}

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets succeeded", v6, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cleanReScanScheduler
{
  id v3 = [(NRDUpdateDCore *)self rescanScheduler];

  if (v3)
  {
    id v4 = nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NRDUpdateDCore *)self rescanScheduler];
      id v6 = [(NRDUpdateDCore *)self rescanScheduler];
      id v7 = [v6 identifier];
      int v9 = 138543618;
      v10 = v5;
      __int16 v11 = 2114;
      dispatch_semaphore_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Activity %{public}@ \"%{public}@\"", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [(NRDUpdateDCore *)self rescanScheduler];
    [v8 invalidate];

    [(NRDUpdateDCore *)self setRescanScheduler:0];
  }
}

- (int64_t)actionLoadPersisted:(id *)a3
{
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionLoadPersisted", (uint8_t *)&v23, 2u);
  }

  unsigned int v5 = [(NRDUpdateDCore *)self forceBrainUpdate];
  [(NRDUpdateDCore *)self setForceBrainUpdate:0];
  [(NRDUpdateDCore *)self cleanBeforeScan];
  [(NRDUpdateDCore *)self cleanReScanScheduler];
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:@"NRDBrainPath"];

  if (!v7)
  {
    int v9 = [(NRDUpdateDCore *)self updateOptions];
    v10 = [v9 objectForKeyedSubscript:@"__nrd_brain-location_key"];

    if (v10)
    {
      id v8 = nrdSharedLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = [(NRDUpdateDCore *)self updateOptions];
        dispatch_semaphore_t v12 = [v11 objectForKeyedSubscript:@"__nrd_brain-location_key"];
        int v23 = 138543362;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Brain path specified by options:%{public}@, skipping scan", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_9;
    }
    v13 = [(NRDUpdateDCore *)self findLocalBrainAsset];
    if (v13)
    {
      [(NRDUpdateDCore *)self setLocalBrainAsset:v13];
      v15 = nrdSharedLogger();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (!v5)
      {
        if (v16)
        {
          dispatch_queue_t v22 = [v13 assetId];
          int v23 = 138543362;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found brain asset:%{public}@ on disk, skipping scan", (uint8_t *)&v23, 0xCu);
        }
        id v19 = [(NRDUpdateDCore *)self updatedFSM];
        v20 = v19;
        CFStringRef v21 = @"LocalBrainFound";
        goto LABEL_23;
      }
      if (v16)
      {
        id v17 = [v13 assetId];
        int v23 = 138543362;
        v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found brain asset:%{public}@ on disk but forced to scan again", (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      v18 = nrdSharedLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not find brain asset on disk, going to scan", (uint8_t *)&v23, 2u);
      }
    }
    id v19 = [(NRDUpdateDCore *)self updatedFSM];
    v20 = v19;
    CFStringRef v21 = @"NoLocalBrainFound";
LABEL_23:
    [v19 postEvent:v21];

    goto LABEL_10;
  }
  id v8 = nrdSharedLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Brain path specified by a default:%{public}@, skipping scan", (uint8_t *)&v23, 0xCu);
  }
LABEL_9:

  v13 = [(NRDUpdateDCore *)self updatedFSM];
  [v13 postEvent:@"LocalBrainFound"];
LABEL_10:

  return 0;
}

- (void)cleanBeforeScan
{
  [(NRDUpdateDCore *)self setUuid:0];

  [(NRDUpdateDCore *)self setUpdateBrainAsset:0];
}

- (int64_t)actionBeginBrainScan:(id *)a3
{
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionBeginBrainScan", buf, 2u);
  }

  [(NRDUpdateDCore *)self cleanBeforeScan];
  unsigned int v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  id v7 = [objc_alloc((Class)SUCoreScan) initWithUUID:v6];
  [(NRDUpdateDCore *)self setScanner:v7];
  id v8 = [(NRDUpdateDCore *)self scanPolicy];

  if (!v8)
  {
    id v9 = [objc_alloc((Class)SUCorePolicyUpdateBrain) initWithSoftwareUpdateAssetType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" documentationAssetType:0 usingPolicies:127 usingExtensions:0];
    v10 = [v9 softwareUpdateScanPolicy];
    [v10 setAllowSameVersion:1];

    __int16 v11 = [v9 softwareUpdateScanPolicy];
    [v11 setRestrictToFull:1];

    dispatch_semaphore_t v12 = [v9 softwareUpdateScanPolicy];
    [v12 setDisableUI:1];

    [v9 setReleaseType:0];
    v13 = +[NSNumber numberWithInt:1];
    [v9 setCompatibilityVersion:v13];

    [(NRDUpdateDCore *)self setScanPolicy:v9];
  }
  id v14 = nrdSharedLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(NRDUpdateDCore *)self scanPolicy];
    BOOL v16 = [v15 description];
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ScanPolicy: %{public}@", buf, 0xCu);
  }
  id v17 = [(NRDUpdateDCore *)self updateAttempt];
  v18 = (char *)[v17 unsignedLongLongValue] + 1;

  if ((unint64_t)v18 < 4)
  {
    scanner = self->_scanner;
    dispatch_queue_t v22 = [(NRDUpdateDCore *)self scanPolicy];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke;
    v24[3] = &unk_100018A40;
    v24[4] = self;
    id v25 = v6;
    [(SUCoreScan *)scanner locateAvailableUpdateWithPolicy:v22 completion:v24];
  }
  else
  {
    id v19 = nrdSharedLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionBeginBrainScan:]();
    }

    v20 = [(NRDUpdateDCore *)self updatedFSM];
    [v20 postEvent:@"ErrorGeneric"];
  }
  return 0;
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = nrdSharedLogger();
  dispatch_semaphore_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1();
    }

    v23[0] = NSDebugDescriptionErrorKey;
    v23[1] = NSUnderlyingErrorKey;
    v24[0] = @"brain scan failed";
    v24[1] = v10;
    v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v14 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:607 userInfo:v13];

    v15 = [*(id *)(a1 + 32) updatedFSM];
    [v15 postEvent:@"ErrorGeneric" withInfo:v14];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scan returned with success\n primaryUpdateAsset: %{public}@\n secondaryUpdateAsset: %{public}@\n", (uint8_t *)&v19, 0x16u);
    }

    if (v8)
    {
      [*(id *)(a1 + 32) setUpdateBrainAsset:v8];
      [*(id *)(a1 + 32) setUuid:*(void *)(a1 + 40)];
      BOOL v16 = [*(id *)(a1 + 32) updatedFSM];
      id v14 = v16;
      CFStringRef v17 = @"ProceedToNextUpdateStep";
    }
    else
    {
      v18 = nrdSharedLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No brain update found", (uint8_t *)&v19, 2u);
      }

      BOOL v16 = [*(id *)(a1 + 32) updatedFSM];
      id v14 = v16;
      CFStringRef v17 = @"NoRemoteBrainFound";
    }
    [v16 postEvent:v17];
  }
}

- (int64_t)actionDownloadBrainUpdate:(id *)a3
{
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionDownloadBrainUpdate", v34, 2u);
  }

  unsigned int v5 = [(NRDUpdateDCore *)self updateBrainAsset];

  if (v5)
  {
    id v6 = objc_alloc((Class)SUCoreMobileAsset);
    id v7 = [(NRDUpdateDCore *)self updateBrainAsset];
    id v8 = [(NRDUpdateDCore *)self uuid];
    id v9 = [v6 initWithDelegate:self forAsset:v7 updateUUID:v8];

    [(NRDUpdateDCore *)self setMaControl:v9];
    id v10 = [objc_alloc((Class)SUCorePolicyUpdateBrain) initWithSoftwareUpdateAssetType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" documentationAssetType:0 usingPolicies:127 usingExtensions:0];
    __int16 v11 = [v10 loadBrainPolicy];
    [v11 setDiscretionary:0];

    dispatch_semaphore_t v12 = [v10 loadBrainPolicy];
    [v12 setDisableUI:1];

    v13 = [v10 loadBrainPolicy];
    [v13 setAllowsCellular:0];

    id v14 = [v10 downloadPreflightPolicy];
    [v14 setDiscretionary:0];

    v15 = [v10 downloadPreflightPolicy];
    [v15 setDisableUI:1];

    BOOL v16 = [v10 downloadPreflightPolicy];
    [v16 setAllowsCellular:0];

    CFStringRef v17 = [v10 softwareUpdateDownloadPolicy];
    [v17 setDiscretionary:0];

    v18 = [v10 softwareUpdateDownloadPolicy];
    [v18 setDisableUI:1];

    int v19 = [v10 softwareUpdateDownloadPolicy];
    [v19 setAllowsCellular:0];

    [v10 setReleaseType:0];
    id v20 = +[NSNumber numberWithInt:1];
    [v10 setCompatibilityVersion:v20];

    [(NRDUpdateDCore *)self setDownloadPolicy:v10];
    __int16 v21 = [(NRDUpdateDCore *)self maControl];
    id v22 = [(NRDUpdateDCore *)self downloadPolicy];
    int v23 = [(NRDUpdateDCore *)self uuid];
    [v21 downloadSoftwareUpdateAssetWithPolicy:v22 withUUID:v23];

    int64_t v24 = 0;
  }
  else
  {
    id v25 = nrdSharedLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionDownloadBrainUpdate:](v25, v26, v27, v28, v29, v30, v31, v32);
    }

    id v9 = [(NRDUpdateDCore *)self updatedFSM];
    [v9 postEvent:@"ErrorGeneric"];
    int64_t v24 = 8700;
  }

  return v24;
}

- (void)maDownloadProgress:(id)a3
{
  id v3 = a3;
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Download progress is : %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)maDownloadStalled:(id)a3
{
  id v3 = a3;
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Download is currently stalled : %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)maDownloaded:(id)a3
{
  id v4 = a3;
  int v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update brain asset has downloaded successfully : %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(NRDUpdateDCore *)self updatedFSM];
  [v6 postEvent:@"ProceedToNextUpdateStep"];
}

- (void)maDownloadFailed:(id)a3
{
  id v4 = a3;
  int v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NRDUpdateDCore maDownloadFailed:]();
  }

  v9[0] = NSDebugDescriptionErrorKey;
  v9[1] = NSUnderlyingErrorKey;
  v10[0] = @"Update brain asset download failed";
  v10[1] = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  int v7 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:608 userInfo:v6];

  id v8 = [(NRDUpdateDCore *)self updatedFSM];
  [v8 postEvent:kSU_E_DownloadFailed withInfo:v7];
}

- (BOOL)brainLoadRequiresUnlock
{
  return 1;
}

- (int64_t)actionCheckDeviceUnlockConstraint:(id *)a3
{
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionCheckDeviceUnlockConstraint", buf, 2u);
  }

  unsigned int v5 = [(NRDUpdateDCore *)self brainLoadRequiresUnlock];
  id v6 = nrdSharedLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      id v14 = "brain load does not require unlock";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_15:

    __int16 v11 = [(NRDUpdateDCore *)self updatedFSM];
    dispatch_semaphore_t v12 = v11;
    CFStringRef v13 = @"DeviceUnlocked";
    goto LABEL_16;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "brain load requires unlock", buf, 2u);
  }

  unsigned __int8 v8 = [(NRDUpdateDCore *)self isPasscodeLocked];
  id v6 = nrdSharedLogger();
  BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      id v14 = "device is unlocked";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Need to wait for device unlock before loading brain", buf, 2u);
  }

  [(NRDUpdateDCore *)self setKeyBagStateChangedNotifyToken:0xFFFFFFFFLL];
  id v10 = [(NRDUpdateDCore *)self keyBagQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke;
  handler[3] = &unk_100018A68;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keyBagStateChangedNotifyToken, v10, handler);

  __int16 v11 = [(NRDUpdateDCore *)self updatedFSM];
  dispatch_semaphore_t v12 = v11;
  CFStringRef v13 = @"DeviceLocked";
LABEL_16:
  [v11 postEvent:v13];

  return 0;
}

void __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPasscodeLocked];
  id v3 = nrdSharedLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v7 = 138543362;
    CFStringRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device lock status changed: passcodeLocked = %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if ((v2 & 1) == 0)
  {
    unsigned int v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device unlocked, sending device unlocked event", (uint8_t *)&v7, 2u);
    }

    notify_cancel((int)[*(id *)(a1 + 32) keyBagStateChangedNotifyToken]);
    id v6 = [*(id *)(a1 + 32) updatedFSM];
    [v6 postEvent:@"DeviceUnlocked"];
  }
}

- (int64_t)actionWaitForUnlock:(id *)a3
{
  CFStringRef v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionWaitForUnlock", v9, 2u);
  }

  unsigned int v5 = [(NRDUpdateDCore *)self delegate];
  NSErrorUserInfoKey v10 = NSDebugDescriptionErrorKey;
  CFStringRef v11 = @"Device is locked, unable to load brain";
  id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  int v7 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:601 userInfo:v6];
  [v5 updateCompleted:v7];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  return 0;
}

- (int64_t)actionLoadBrain:(id *)a3
{
  CFStringRef v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionLoadBrain", buf, 2u);
  }

  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"NRDBrainPath"];

  if (v6)
  {
    int v7 = nrdSharedLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Defaults specified brain path is %{public}@", buf, 0xCu);
    }

    [(NRDUpdateDCore *)self setUpdateOptions:0];
    goto LABEL_11;
  }
  CFStringRef v8 = [(NRDUpdateDCore *)self updateOptions];
  BOOL v9 = [v8 objectForKeyedSubscript:@"__nrd_brain-location_key"];

  if (v9)
  {
    NSErrorUserInfoKey v10 = [(NRDUpdateDCore *)self updateOptions];
    id v6 = [v10 objectForKeyedSubscript:@"__nrd_brain-location_key"];

    CFStringRef v11 = nrdSharedLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Option specified brain path is %{public}@", buf, 0xCu);
    }

    [(NRDUpdateDCore *)self setUpdateOptions:0];
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  __int16 v21 = [(NRDUpdateDCore *)self updateBrainAsset];

  if (v21)
  {
    id v22 = [(NRDUpdateDCore *)self updateBrainAsset];
    int v23 = [v22 getLocalUrl];
    id v6 = [v23 path];

    int64_t v24 = nrdSharedLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Downloaded brain path is %{public}@", buf, 0xCu);
    }

    uint64_t v25 = [(NRDUpdateDCore *)self updateBrainAsset];
  }
  else
  {
    uint64_t v26 = [(NRDUpdateDCore *)self localBrainAsset];

    if (!v26)
    {
      v41 = nrdSharedLogger();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[NRDUpdateDCore actionLoadBrain:](v41, v42, v43, v44, v45, v46, v47, v48);
      }

      NSErrorUserInfoKey v54 = NSDebugDescriptionErrorKey;
      CFStringRef v55 = @"LoadingBrain state was reached without either a downloaded brain or an existing local brain";
      v39 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      uint64_t v40 = 600;
      goto LABEL_32;
    }
    uint64_t v27 = [(NRDUpdateDCore *)self localBrainAsset];
    uint64_t v28 = [v27 getLocalUrl];
    id v6 = [v28 path];

    uint64_t v29 = nrdSharedLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Existing local brain path is %{public}@", buf, 0xCu);
    }

    uint64_t v25 = [(NRDUpdateDCore *)self localBrainAsset];
  }
  uint64_t v30 = (void *)v25;
  [(NRDUpdateDCore *)self setLoadBrainAsset:v25];

  if (!v6)
  {
LABEL_29:
    uint64_t v31 = nrdSharedLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionLoadBrain:](v31, v32, v33, v34, v35, v36, v37, v38);
    }

    NSErrorUserInfoKey v52 = NSDebugDescriptionErrorKey;
    CFStringRef v53 = @"brain path is nil";
    v39 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v40 = 603;
LABEL_32:
    CFStringRef v13 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:v40 userInfo:v39];

    id v6 = [(NRDUpdateDCore *)self updatedFSM];
    [v6 postEvent:@"ErrorGeneric" withInfo:v13];
    goto LABEL_19;
  }
LABEL_11:
  dispatch_semaphore_t v12 = nrdSharedLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trying to load update brain", buf, 2u);
  }

  id v49 = 0;
  CFStringRef v13 = +[NRDUpdateBrainLoader brainAtPath:v6 delegate:self error:&v49];
  id v14 = v49;
  v15 = v14;
  if (v14)
  {
    v50[0] = NSDebugDescriptionErrorKey;
    v50[1] = NSUnderlyingErrorKey;
    v51[0] = @"load brain failed";
    v51[1] = v14;
    BOOL v16 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    CFStringRef v17 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:602 userInfo:v16];

    v18 = [(NRDUpdateDCore *)self updatedFSM];
    [v18 postEvent:@"ErrorGeneric" withInfo:v17];
  }
  else
  {
    [(NRDUpdateDCore *)self setBrain:v13];
    int v19 = nrdSharedLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "update brain load succeeded", buf, 2u);
    }

    CFStringRef v17 = [(NRDUpdateDCore *)self updatedFSM];
    [v17 postEvent:@"ProceedToNextUpdateStep"];
  }

LABEL_19:
  return 0;
}

- (int64_t)actionRunBrain:(id *)a3
{
  CFStringRef v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionRunBrain", buf, 2u);
  }

  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke;
  block[3] = &unk_100018A90;
  block[4] = buf;
  if (actionRunBrain__onceToken != -1) {
    dispatch_once(&actionRunBrain__onceToken, block);
  }
  unsigned int v5 = [(NRDUpdateDCore *)self updateOptions];
  id v6 = [v5 objectForKeyedSubscript:@"__nrd_brain-location_key"];

  if (v6 && +[NRDUpdateBrainLoader isBrainLoaded])
  {
    int v7 = [(NRDUpdateDCore *)self delegate];
    [v7 requestExit:0 reason:@"A new NRD brain will be loaded from an option-specified local path."];

    v21[0] = NSDebugDescriptionErrorKey;
    v21[1] = @"com.apple.NRD-Resend";
    v22[0] = @"new local brain load needed";
    v22[1] = &__kCFBooleanTrue;
    CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    BOOL v9 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:610 userInfo:v8];

    NSErrorUserInfoKey v10 = [(NRDUpdateDCore *)self delegate];
    [v10 updateCompleted:v9];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }
  else
  {
    CFStringRef v11 = [(NRDUpdateDCore *)self brain];
    uint64_t v12 = *((void *)v18 + 3);
    CFStringRef v13 = [(NRDUpdateDCore *)self updateOptions];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke_2;
    v15[3] = &unk_100018A18;
    v15[4] = self;
    [v11 run:v12 options:v13 callback:v15];
  }
  _Block_object_dispose(buf, 8);
  return 0;
}

uint64_t __33__NRDUpdateDCore_actionRunBrain___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  unsigned int v5 = [v3 domain];
  if ([v5 isEqualToString:@"NRDUpdateErrorDomain"])
  {
    id v6 = [v4 code];

    if (v6 == (id)111)
    {
LABEL_4:
      int v7 = nrdSharedLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "brain run completed successfully", v14, 2u);
      }

      CFStringRef v8 = [*(id *)(a1 + 32) brain];
      [*(id *)(a1 + 32) setRunningBrain:v8];

      BOOL v9 = [*(id *)(a1 + 32) delegate];
      [v9 updateCompleted:0];

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
      goto LABEL_11;
    }
  }
  else
  {
  }
  NSErrorUserInfoKey v10 = nrdSharedLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1();
  }

  v15[0] = NSDebugDescriptionErrorKey;
  v15[1] = NSUnderlyingErrorKey;
  v16[0] = @"run brain failed";
  v16[1] = v4;
  CFStringRef v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:609 userInfo:v11];

  CFStringRef v13 = [*(id *)(a1 + 32) delegate];
  [v13 updateCompleted:v12];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
LABEL_11:
}

- (int64_t)actionScheduleRetry:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = nrdSharedLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "In actionScheduleRetry", buf, 2u);
  }

  int v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke;
  v10[3] = &unk_100018AB8;
  v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  +[SUCorePurge removeAllAssetsOfType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" completion:v10];

  return 0;
}

void __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = nrdSharedLogger();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets succeeded", v7, 2u);
  }

  [*(id *)(a1 + 32) scheduleNRDUpdateBrainReScan:0];
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 updateCompleted:*(void *)(a1 + 40)];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

- (int64_t)actionPeriodicScan:(id *)a3
{
  CFStringRef v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In actionPeriodicScan", buf, 2u);
  }

  id v5 = [(NRDUpdateDCore *)self runningBrain];

  if (v5)
  {
    id v6 = [(NRDUpdateDCore *)self runningBrain];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke;
    v9[3] = &unk_100018A18;
    v9[4] = self;
    [v6 run:4 callback:v9];
  }
  else
  {
    int v7 = nrdSharedLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "actionPeriodicScan no running brain", buf, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }
  return 0;
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = nrdSharedLogger();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "brain run idle completed successfully", buf, 2u);
    }

    id v6 = objc_alloc((Class)SUCoreScan);
    int v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];
    id v9 = [v6 initWithUUID:v8];

    id v10 = [objc_alloc((Class)SUCorePolicyUpdateBrain) initWithSoftwareUpdateAssetType:@"com.apple.MobileAsset.RecoveryOSUpdateBrain" documentationAssetType:0 usingPolicies:127 usingExtensions:0];
    id v11 = [v10 softwareUpdateScanPolicy];
    [v11 setAllowSameVersion:1];

    uint64_t v12 = [v10 softwareUpdateScanPolicy];
    [v12 setRestrictToFull:1];

    CFStringRef v13 = [v10 softwareUpdateScanPolicy];
    [v13 setDisableUI:1];

    [v10 setReleaseType:0];
    id v14 = +[NSNumber numberWithInt:1];
    [v10 setCompatibilityVersion:v14];

    v15 = nrdSharedLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [v10 description];
      *(_DWORD *)buf = 138543362;
      int v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Periodic ScanPolicy: %{public}@", buf, 0xCu);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_415;
    v19[3] = &unk_100018A40;
    uint64_t v17 = *(void *)(a1 + 32);
    id v20 = v9;
    uint64_t v21 = v17;
    id v18 = v9;
    [v18 locateAvailableUpdateWithPolicy:v10 completion:v19];
  }
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_415(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nrdSharedLogger();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_415_cold_1();
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Periodic Scan returned with success\n primaryUpdateAsset: %{public}@\n secondaryUpdateAsset: %{public}@\n", (uint8_t *)&v26, 0x16u);
  }

  if (v8)
  {
    uint64_t v12 = [v8 assetProperty:@"Build"];
    if (!v12)
    {
      uint64_t v12 = [v8 assetProperty:@"_MasteredVersion"];
    }
    CFStringRef v13 = [*(id *)(a1 + 40) loadBrainAsset];
    id v14 = [v13 assetProperty:@"Build"];

    if (!v14)
    {
      v15 = [*(id *)(a1 + 40) loadBrainAsset];
      id v14 = [v15 assetProperty:@"_MasteredVersion"];
    }
    BOOL v16 = nrdSharedLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543618;
      uint64_t v27 = v12;
      __int16 v28 = 2114;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Periodic Scan found brain version:%{public}@, existing version:%{public}@", (uint8_t *)&v26, 0x16u);
    }

    unsigned int v17 = [v14 isEqual:v12];
    id v18 = nrdSharedLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        LOWORD(v26) = 0;
        id v20 = "Periodic Scan returned with the existing brain asset";
        uint64_t v21 = v18;
        uint32_t v22 = 2;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
      }
    }
    else
    {
      if (v19)
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Periodic Scan returned with new brain asset, purging old asset", (uint8_t *)&v26, 2u);
      }

      int v23 = [*(id *)(a1 + 40) loadBrainAsset];
      int64_t v24 = [v23 purgeSync];

      id v18 = nrdSharedLogger();
      BOOL v25 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (!v24)
      {
        if (v25)
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Purged old brain asset, send new brain notification", (uint8_t *)&v26, 2u);
        }

        [*(id *)(a1 + 40) newBrain:v12];
        goto LABEL_25;
      }
      if (v25)
      {
        int v26 = 134217984;
        uint64_t v27 = v24;
        id v20 = "Purging old brain asset failed with result:%ld";
        uint64_t v21 = v18;
        uint32_t v22 = 12;
        goto LABEL_23;
      }
    }

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v12 = nrdSharedLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No brain update found", (uint8_t *)&v26, 2u);
  }
LABEL_26:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 8));
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NRDUpdateDCore actionUnknownAction:error:]();
  }

  return 8113;
}

- (int64_t)getSchedulerQOS
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 stringForKey:@"SchedulerQOS"];

  if (!v3) {
    goto LABEL_13;
  }
  id v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    CFStringRef v9 = @"SchedulerQOS";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found %{public}@=%{public}@ in preferences", (uint8_t *)&v8, 0x16u);
  }

  if ([v3 caseInsensitiveCompare:@"Background"])
  {
    if ([v3 caseInsensitiveCompare:@"Utility"])
    {
      if ([v3 caseInsensitiveCompare:@"UserInitiated"])
      {
        if ([v3 caseInsensitiveCompare:@"UserInteractive"])
        {
          if ([v3 caseInsensitiveCompare:@"Default"])
          {
            id v5 = nrdSharedLogger();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              -[NRDUpdateDCore getSchedulerQOS]();
            }
          }
          int64_t v6 = -1;
        }
        else
        {
          int64_t v6 = 33;
        }
      }
      else
      {
        int64_t v6 = 25;
      }
    }
    else
    {
      int64_t v6 = 17;
    }
  }
  else
  {
LABEL_13:
    int64_t v6 = 9;
  }

  return v6;
}

- (double)_minimumInterval:(double)a3
{
  double v3 = a3;
  if (a3 < 60.0)
  {
    id v4 = nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218240;
      double v7 = v3;
      __int16 v8 = 2048;
      uint64_t v9 = 0x404E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "interval of %.1f seconds is too low. clamping to %.1f seconds.", (uint8_t *)&v6, 0x16u);
    }

    return 60.0;
  }
  return v3;
}

- (void)scheduleNRDUpdateBrainReScan:(BOOL)a3
{
  BOOL v3 = a3;
  [(NRDUpdateDCore *)self cleanReScanScheduler];
  id v5 = +[NSUserDefaults standardUserDefaults];
  int v6 = [v5 objectForKey:@"NRDBrainReScanInterval"];

  if (v6)
  {
    double v7 = nrdSharedLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v27 = @"NRDBrainReScanInterval";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found %{public}@ in defaults", buf, 0xCu);
    }

    [v6 doubleValue];
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    double v9 = v8;
  }
  else
  {
    double v9 = (double)XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  id v10 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download"];
  id v11 = v10;
  if (v10)
  {
    [v10 setInterval:v9];
    [v11 setQualityOfService:-[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS")];
    uint64_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    [v11 _setAdditionalXPCActivityProperties:v12];
    [(NRDUpdateDCore *)self setRescanScheduler:v11];
    CFStringRef v13 = nrdSharedLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking in retry activity for brain scan", buf, 2u);
      }

      v15 = [v11 description];
      [v11 identifier];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      void v23[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke;
      v23[3] = &unk_100018898;
      id v24 = v15;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v25;
      CFStringRef v13 = v15;
      [v11 setCheckInHandler:v23];
      [v11 setPreregistered:1];
    }
    else if (v14)
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v27 = *(const __CFString **)&v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scheduling a retry for brain update in %lf seconds", buf, 0xCu);
    }

    unsigned int v17 = +[NRDUpdateBrainLoader isBrainLoaded];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_447;
    v19[3] = &unk_100018AE0;
    char v22 = v17;
    id v20 = v11;
    uint64_t v21 = self;
    [v20 scheduleWithBlock:v19];
    if (v17)
    {
      id v18 = [(NRDUpdateDCore *)self delegate];
      [v18 requestExit:0 reason:@"NRD brain service has already been bootstrapped into the xpc namespace of this process."];
    }
  }
  else
  {
    uint64_t v12 = [(NRDUpdateDCore *)self delegate];
    [v12 requestExit:1 reason:@"Failed to schedule a retry for NRD brain update"];
  }
}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke(uint64_t a1)
{
  unsigned int v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in.", (uint8_t *)&v8, 0x16u);
  }

  id v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in complete.", (uint8_t *)&v8, 0x16u);
  }
}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_447(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ fired", (uint8_t *)&v10, 0xCu);
  }
  if ([*(id *)(a1 + 32) shouldDefer])
  {
    uint64_t v6 = nrdSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      uint64_t v11 = v7;
      int v8 = "Activity %{public}@ is deferred";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 40) performUpdate:&off_100019AE8];
      uint64_t v9 = 1;
      goto LABEL_11;
    }
    uint64_t v6 = nrdSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      uint64_t v11 = v7;
      int v8 = "Activity %{public}@ will be deferred because daemon needs to exit.";
      goto LABEL_9;
    }
  }

  uint64_t v9 = 2;
LABEL_11:
  v3[2](v3, v9);
}

- (void)scheduleNRDUpdateBrainPeriodicScan
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"NRDBrainPeriodicScanInterval"];

  if (v4)
  {
    id v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v24 = @"NRDBrainPeriodicScanInterval";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found %{public}@ in defaults", buf, 0xCu);
    }

    [v4 doubleValue];
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    double v7 = v6;
  }
  else
  {
    double v7 = (double)XPC_ACTIVITY_INTERVAL_7_DAYS;
  }
  id v8 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_autoscan"];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setInterval:v7];
    [v9 setDelay:v7 * 0.5];
    [v9 setQualityOfService:-[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS")];
    int v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    [v9 _setAdditionalXPCActivityProperties:v10];
    [(NRDUpdateDCore *)self setPeriodicScheduler:v9];
    uint64_t v11 = nrdSharedLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking in periodic activity for brain scan", buf, 2u);
    }

    uint64_t v12 = [v9 description];
    [v9 identifier];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke;
    v18[3] = &unk_100018B08;
    id v19 = v12;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = self;
    double v22 = v7;
    id v13 = v20;
    id v14 = v12;
    [v9 setCheckInHandler:v18];
    [v9 setPreregistered:1];
    [v9 setRepeats:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_465;
    v15[3] = &unk_100018798;
    id v16 = v9;
    unsigned int v17 = self;
    [v16 scheduleWithBlock:v15];
  }
  else
  {
    int v10 = [(NRDUpdateDCore *)self delegate];
    [v10 requestExit:1 reason:@"Failed to schedule periodic scan for NRD brain update"];
  }
}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke(uint64_t a1)
{
  unsigned int v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    int v24 = 138543618;
    id v25 = v3;
    __int16 v26 = 2114;
    CFStringRef v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in.", (uint8_t *)&v24, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) periodicScheduler];
  [v5 interval];
  double v7 = v6;

  id v8 = nrdSharedLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 48) periodicScheduler];
    int v10 = [*(id *)(a1 + 48) periodicScheduler];
    uint64_t v11 = [v10 identifier];
    int v24 = 138543874;
    id v25 = v9;
    __int16 v26 = 2114;
    CFStringRef v27 = v11;
    __int16 v28 = 2048;
    double v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" was preregistered with interval: %lf", (uint8_t *)&v24, 0x20u);
  }
  double v12 = *(double *)(a1 + 56);
  if (v12 != v7)
  {
    id v13 = [*(id *)(a1 + 48) periodicScheduler];
    [v13 setInterval:v12];

    double v14 = *(double *)(a1 + 56) * 0.5;
    v15 = [*(id *)(a1 + 48) periodicScheduler];
    [v15 setDelay:v14];

    id v16 = nrdSharedLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [*(id *)(a1 + 48) periodicScheduler];
      id v18 = [*(id *)(a1 + 48) periodicScheduler];
      id v19 = [v18 identifier];
      double v20 = *(double *)(a1 + 56);
      int v24 = 138543874;
      id v25 = v17;
      __int16 v26 = 2114;
      CFStringRef v27 = v19;
      __int16 v28 = 2048;
      double v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" new interval: %lf", (uint8_t *)&v24, 0x20u);
    }
  }
  uint64_t v21 = nrdSharedLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = *(void **)(a1 + 32);
    int v23 = *(void **)(a1 + 40);
    int v24 = 138543618;
    id v25 = v22;
    __int16 v26 = 2114;
    CFStringRef v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in complete.", (uint8_t *)&v24, 0x16u);
  }
}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_465(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    int v9 = 138543362;
    int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ fired", (uint8_t *)&v9, 0xCu);
  }
  if ([*(id *)(a1 + 32) shouldDefer])
  {
    double v6 = nrdSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [*(id *)(a1 + 32) identifier];
      int v9 = 138543362;
      int v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ is deferred", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v8 = 2;
  }
  else
  {
    [*(id *)(a1 + 40) performUpdate:&off_100019B10];
    uint64_t v8 = 1;
  }
  v3[2](v3, v8);
}

- (BOOL)isPasscodeLocked
{
  v5[0] = kMKBUserSessionIDKey;
  v5[1] = @"ExtendedDeviceLockState";
  v6[0] = &off_100019A78;
  v6[1] = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  unsigned int v2 = MKBGetDeviceLockState();
  return (v2 < 7) & (0x46u >> v2);
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = nrdSharedLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138544130;
    id v24 = v14;
    __int16 v25 = 2114;
    id v26 = v15;
    __int16 v27 = 2114;
    id v28 = v16;
    __int16 v29 = 2114;
    id v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PerformAction: Action:%{public}@ Event:%{public}@ inState:%{public}@ nextState:%{public}@", (uint8_t *)&v23, 0x2Au);
  }

  if ([v14 isEqualToString:kSUCoreFSMActionNoOp])
  {
    int64_t v20 = 0;
  }
  else
  {
    if ([v14 isEqualToString:kSU_A_LoadPersisted])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionLoadPersisted:a8];
    }
    else if ([v14 isEqualToString:@"ActionBeginBrainScan"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionBeginBrainScan:a8];
    }
    else if ([v14 isEqualToString:@"ActionDownloadBrain"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionDownloadBrainUpdate:a8];
    }
    else if ([v14 isEqualToString:@"ActionCheckDeviceUnlockConstraint"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionCheckDeviceUnlockConstraint:a8];
    }
    else if ([v14 isEqualToString:@"ActionWaitForUnlock"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionWaitForUnlock:a8];
    }
    else if ([v14 isEqualToString:@"ActionLoadBrain"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionLoadBrain:a8];
    }
    else if ([v14 isEqualToString:@"ActionRunBrain"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionRunBrain:a8];
    }
    else if ([v14 isEqualToString:@"ActionScheduleRetry"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionScheduleRetry:v17 error:a8];
    }
    else if ([v14 isEqualToString:@"ActionPeriodicScan"])
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionPeriodicScan:a8];
    }
    else
    {
      int64_t v21 = [(NRDUpdateDCore *)self actionUnknownAction:v14 error:a8];
    }
    int64_t v20 = v21;
  }

  return v20;
}

- (void)performUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(NRDUpdateDCore *)self updateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __32__NRDUpdateDCore_performUpdate___block_invoke;
  v7[3] = &unk_100018898;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

intptr_t __32__NRDUpdateDCore_performUpdate___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) objectForKey:@"TriggeredByDeviceUnlock"];
  unsigned int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Continuing update on device unlock event", buf, 2u);
    }

    id v5 = [*(id *)(a1 + 40) updatedFSM];
    id v6 = v5;
    CFStringRef v7 = @"DeviceUnlocked";
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) objectForKey:@"TriggeredByPeriodicActivity"];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      int v10 = nrdSharedLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "perform periodic scan", v12, 2u);
      }

      [*(id *)(a1 + 40) setForceBrainUpdate:1];
      id v5 = [*(id *)(a1 + 40) updatedFSM];
      id v6 = v5;
      CFStringRef v7 = @"PeriodicScanRequested";
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) updatedFSM];
      id v6 = v5;
      CFStringRef v7 = @"ProceedToNextUpdateStep";
    }
  }
  [v5 postEvent:v7];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 8), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)newSchedulerWithIdentifier:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, NRDBackgroundActivitySchedulerServerImpl *))a4;
  CFStringRef v7 = [[NRDBackgroundActivitySchedulerServerImpl alloc] initWithIdentifier:v5];
  id v8 = nrdSharedLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" created.", (uint8_t *)&v9, 0x16u);
  }

  v6[2](v6, v7);
}

- (void)newBrain:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:112 userInfo:0];
  id v6 = nrdSharedLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"(unversioned)";
    if (v4) {
      CFStringRef v7 = v4;
    }
    int v9 = 138543362;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got newBrain notification, brainVersion:%{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(NRDUpdateDCore *)self delegate];
  [v8 requestExit:0 reason:@"NRD brain has downloaded a new brain (via delegate)" relaunchError:v5];
}

- (void)connectionInterrupted
{
  unsigned int v3 = nrdSharedLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got connectionInterrupted notification", v5, 2u);
  }

  id v4 = [(NRDUpdateDCore *)self delegate];
  [v4 requestExit:1 reason:@"NRD brain connection has been unexpectedly interrupted"];
}

- (void)connectionInvalidated
{
  unsigned int v3 = nrdSharedLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got connectionInvalidated notification", v5, 2u);
  }

  id v4 = [(NRDUpdateDCore *)self delegate];
  [v4 requestExit:1 reason:@"NRD brain connection has been unexpectedly invalidated"];
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (void)setStateTable:(id)a3
{
}

- (SUCoreFSM)updatedFSM
{
  return self->_updatedFSM;
}

- (void)setUpdatedFSM:(id)a3
{
}

- (MAAsset)updateBrainAsset
{
  return self->_updateBrainAsset;
}

- (void)setUpdateBrainAsset:(id)a3
{
}

- (MAAsset)localBrainAsset
{
  return self->_localBrainAsset;
}

- (void)setLocalBrainAsset:(id)a3
{
}

- (MAAsset)loadBrainAsset
{
  return self->_loadBrainAsset;
}

- (void)setLoadBrainAsset:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (SUCoreScan)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (SUCorePolicyUpdateBrain)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (void)setMaControl:(id)a3
{
}

- (SUCorePolicyUpdateBrain)downloadPolicy
{
  return self->_downloadPolicy;
}

- (void)setDownloadPolicy:(id)a3
{
}

- (NRDUpdateDCoreDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)updateAttempt
{
  return self->_updateAttempt;
}

- (void)setUpdateAttempt:(id)a3
{
}

- (id)brain
{
  return self->_brain;
}

- (void)setBrain:(id)a3
{
}

- (id)runningBrain
{
  return self->_runningBrain;
}

- (void)setRunningBrain:(id)a3
{
}

- (OS_dispatch_queue)keyBagQueue
{
  return self->_keyBagQueue;
}

- (void)setKeyBagQueue:(id)a3
{
}

- (int)keyBagStateChangedNotifyToken
{
  return self->_keyBagStateChangedNotifyToken;
}

- (void)setKeyBagStateChangedNotifyToken:(int)a3
{
  self->_keyBagStateChangedNotifyToken = a3;
}

- (NSBackgroundActivityScheduler)rescanScheduler
{
  return self->_rescanScheduler;
}

- (void)setRescanScheduler:(id)a3
{
}

- (NSBackgroundActivityScheduler)periodicScheduler
{
  return self->_periodicScheduler;
}

- (void)setPeriodicScheduler:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (BOOL)forceBrainUpdate
{
  return self->_forceBrainUpdate;
}

- (void)setForceBrainUpdate:(BOOL)a3
{
  self->_forceBrainUpdate = a3;
}

- (NSDictionary)updateOptions
{
  return self->_updateOptions;
}

- (void)setUpdateOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOptions, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_periodicScheduler, 0);
  objc_storeStrong((id *)&self->_rescanScheduler, 0);
  objc_storeStrong((id *)&self->_keyBagQueue, 0);
  objc_storeStrong(&self->_runningBrain, 0);
  objc_storeStrong(&self->_brain, 0);
  objc_storeStrong((id *)&self->_updateAttempt, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_downloadPolicy, 0);
  objc_storeStrong((id *)&self->_maControl, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_loadBrainAsset, 0);
  objc_storeStrong((id *)&self->_localBrainAsset, 0);
  objc_storeStrong((id *)&self->_updateBrainAsset, 0);
  objc_storeStrong((id *)&self->_updatedFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);

  objc_storeStrong((id *)&self->_fsmSemaphore, 0);
}

- (void)findLocalBrainAsset
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query local brain asset, result:%ld", v2, v3, v4, v5, v6);
}

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Removing all update brain assets failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionBeginBrainScan:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Previous attempts to update the brain failed too many times(%llu)..", v2, v3, v4, v5, v6);
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Scan returned with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionDownloadBrainUpdate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)maDownloadFailed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Update brain asset download failed with error:%{public}@", v2, v3, v4, v5, v6);
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "brain run completed with error:%{public}@", v2, v3, v4, v5, v6);
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "brain run idle completed with error:%{public}@", v2, v3, v4, v5, v6);
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_415_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Periodic scan returned with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)actionUnknownAction:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "In unknown state!..action: %{public}@ error:%{public}@", v2, 0x16u);
}

- (void)getSchedulerQOS
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "%{public}@ is invalid NSQualityOfService, falling to default", v2, v3, v4, v5, v6);
}

@end