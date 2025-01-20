@interface MSUNRDUpdateBrainController
+ (id)sharedInstance;
+ (id)stateToString:(int)a3;
- (MSUNRDUpdateBrainController)init;
- (NSDictionary)currentMSUUpdateAttributes;
- (NSDictionary)currentRecoveryOSInfo;
- (NSDictionary)progressStatus;
- (NSError)lastError;
- (NSString)lastSuccessForTargetMainOSBuild;
- (NSString)lastSuccessForTargetRecoveryOSBuild;
- (OS_dispatch_queue)cancelQueue;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_queue)workQueue;
- (id)nrdLock;
- (id)status;
- (id)waitWithTimeout:(int)a3 progressCallback:(void *)a4 context:(void *)a5 releaseLock:(BOOL)a6;
- (int)state;
- (void)cancelAndLock;
- (void)progressCB;
- (void)progressContext;
- (void)saveLastError:(id)a3;
- (void)saveLastSuccessForTargetMainOSBuild:(id)a3 recoveryOSBuild:(id)a4;
- (void)saveMSUUpdateAttributes:(id)a3 andState:(int)a4;
- (void)saveRecoveryOSInfo:(id)a3;
- (void)saveState:(int)a3;
- (void)setCancelQueue:(id)a3;
- (void)setCurrentMSUUpdateAttributes:(id)a3;
- (void)setCurrentRecoveryOSInfo:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLastSuccessForTargetMainOSBuild:(id)a3;
- (void)setLastSuccessForTargetRecoveryOSBuild:(id)a3;
- (void)setNrdLock:(id)a3;
- (void)setProgressCB:(void *)a3;
- (void)setProgressContext:(void *)a3;
- (void)setProgressStatus:(id)a3;
- (void)setState:(int)a3;
- (void)setStateQueue:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startForMSUUpdate:(id)a3;
- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4;
- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4 withOptions:(id)a5;
- (void)updateStatusFromCallback:(id)a3;
@end

@implementation MSUNRDUpdateBrainController

- (MSUNRDUpdateBrainController)init
{
  v20.receiver = self;
  v20.super_class = (Class)MSUNRDUpdateBrainController;
  v2 = [(MSUNRDUpdateBrainController *)&v20 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerWork", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerCancel", v6);
    cancelQueue = v2->_cancelQueue;
    v2->_cancelQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerState", v9);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v10;

    id nrdLock = v2->_nrdLock;
    v2->_id nrdLock = 0;

    lastError = v2->_lastError;
    v2->_lastError = 0;

    currentRecoveryOSInfo = v2->_currentRecoveryOSInfo;
    v2->_currentRecoveryOSInfo = 0;

    currentMSUUpdateAttributes = v2->_currentMSUUpdateAttributes;
    v2->_currentMSUUpdateAttributes = 0;

    progressStatus = v2->_progressStatus;
    v2->_progressStatus = 0;

    v2->_state = 0;
    lastSuccessForTargetMainOSBuild = v2->_lastSuccessForTargetMainOSBuild;
    v2->_lastSuccessForTargetMainOSBuild = 0;

    lastSuccessForTargetRecoveryOSBuild = v2->_lastSuccessForTargetRecoveryOSBuild;
    v2->_lastSuccessForTargetRecoveryOSBuild = 0;

    v2->_progressCB = 0;
    v2->_progressContext = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

void __45__MSUNRDUpdateBrainController_sharedInstance__block_invoke(id a1)
{
  sharedInstance___instance = objc_alloc_init(MSUNRDUpdateBrainController);
  _objc_release_x1();
}

- (void)startForMSUUpdate:(id)a3
{
}

- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4
{
}

- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4 withOptions:(id)a5
{
  id v8 = a3;
  v9 = (__CFString *)a4;
  id v15 = a5;
  if (v9) {
    v16 = v9;
  }
  else {
    v16 = @"(unversioned)";
  }
  logfunction(", 1, @"Received request to start RecoveryOS update for MSU update:%@\n"", v10, v11, v12, v13, v14, (char)v8);
  v17 = [(MSUNRDUpdateBrainController *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__MSUNRDUpdateBrainController_startForMSUUpdate_withMSUBrainVersion_withOptions___block_invoke;
  block[3] = &unk_100059188;
  id v22 = v8;
  v23 = self;
  v24 = v16;
  id v25 = v15;
  id v18 = v15;
  v19 = v16;
  id v20 = v8;
  dispatch_async(v17, block);
}

void __81__MSUNRDUpdateBrainController_startForMSUUpdate_withMSUBrainVersion_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction(", 1, @"starting RecoveryOS update for MSU update:%@\n"", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  [*(id *)(a1 + 40) saveMSUUpdateAttributes:*(void *)(a1 + 32) andState:1];
  id v100 = 0;
  id v101 = 0;
  BOOL updated = NRDGetUpdateBrainConnection(&v101, &v100, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 40));
  id v10 = v101;
  id v11 = v100;
  uint64_t v12 = objc_opt_new();
  [v12 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"MainOSUpdateAttributes"];
  CFStringRef v102 = @"msuBrainVersion";
  uint64_t v103 = *(void *)(a1 + 48);
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
  [v12 setObject:v13 forKeyedSubscript:@"AdditionalEventInfo"];

  uint64_t v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"ForceInline"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    logfunction(", 1, @"MSUNRD detected option %@, adding appropriate keys to query\n", v16, v17, v18, v19, v20, (char)@"ForceInline"");
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Foreground"];
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ForceInline"];
  }
  if (updated)
  {
    [*(id *)(a1 + 40) saveState:2];
    v21 = [*(id *)(a1 + 40) nrdLock];

    if (v21)
    {
      logfunction(", 1, @"Found existing nrd lock, releasing it first\n"", v22, v23, v24, v25, v26, v84);
      v27 = [*(id *)(a1 + 40) nrdLock];
      NRDReleaseActivityLock(v27);

      [*(id *)(a1 + 40) setNrdLock:0];
    }
    v28 = NRDAcquireActivityLock(v10, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 40));
    [*(id *)(a1 + 40) setNrdLock:v28];

    v29 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"OSVersion"];
    v30 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Build"];
    id v98 = 0;
    id v99 = 0;
    id v97 = v11;
    BOOL v31 = NRDQueryRecoveryOS(v10, v29, v30, v12, &v99, &v98, &v97, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 40));
    id v32 = v99;
    id v33 = v98;
    id v34 = v97;

    if (v33)
    {
      logfunction(", 1, @"Installed recovery OS:\n%@\n"", v35, v36, v37, v38, v39, (char)v33);
      [*(id *)(a1 + 40) saveRecoveryOSInfo:v33];
      if (v31)
      {
        if (v32)
        {
LABEL_9:
          [*(id *)(a1 + 40) saveState:3];
          logfunction(", 1, @"RecoveryOS update was found:\n%@\n"", v45, v46, v47, v48, v49, (char)v32);
          id v95 = v34;
          id v96 = 0;
          BOOL v50 = NRDDownloadRecoveryOS(v10, v32, 0, &v96, &v95, (uint64_t)progressCallback, *(void *)(a1 + 40));
          id v51 = v96;
          id v11 = v95;

          if (v50)
          {
            [*(id *)(a1 + 40) saveState:4];
            logfunction(", 1, @"RecoveryOS update was successfully downloaded.\n"", v57, v58, v59, v60, v61, v87);
            id v93 = v11;
            id v94 = 0;
            BOOL v62 = NRDInstallRecoveryOS(v10, v32, 0, &v94, &v93, (uint64_t)progressCallback, *(void *)(a1 + 40));
            id v63 = v94;
            id v34 = v93;

            if (v62)
            {
              v91 = *(void **)(a1 + 40);
              v92 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Build"];
              v90 = [v32 objectForKeyedSubscript:@"assetAttributes"];
              v69 = [v90 objectForKeyedSubscript:@"AssetProperties"];
              v70 = [v69 objectForKeyedSubscript:@"Build"];
              [v91 saveLastSuccessForTargetMainOSBuild:v92 recoveryOSBuild:v70];

              [*(id *)(a1 + 40) saveState:5];
              logfunction(", 1, @"RecoveryOS update was successfully installed.\n"", v71, v72, v73, v74, v75, v88);
              goto LABEL_22;
            }
            logfunction(", 1, @"Non-fatal error installing RecoveryOS update: %@\n"", v64, v65, v66, v67, v68, (char)v34);
            goto LABEL_19;
          }
          logfunction(", 1, @"Non-fatal error downloading RecoveryOS update: %@\n"", v52, v53, v54, v55, v56, (char)v11);
          goto LABEL_13;
        }
LABEL_16:
        logfunction(", 1, @"No RecoveryOS update is required for this update.\n"", v40, v41, v42, v43, v44, v86);
        uint64_t v76 = 0;
        id v51 = 0;
        id v63 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      if (v31)
      {
        logfunction(", 1, @"No recoveryOS is installed\n"", v35, v36, v37, v38, v39, v85);
        [*(id *)(a1 + 40) saveRecoveryOSInfo:0];
        if (v32) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
      logfunction(", 1, @"Installed state of recovery OS is unknown.\n"", v35, v36, v37, v38, v39, v85);
    }
    logfunction(", 1, @"Non-fatal error querying for RecoveryOS update: %@\n"", v40, v41, v42, v43, v44, (char)v34);
    id v51 = 0;
    id v63 = 0;
    goto LABEL_19;
  }
  logfunction(", 1, @"Non-fatal error connecting to RecoveryOSUpdateBrain: %@\n"", v16, v17, v18, v19, v20, (char)v11);
  id v32 = 0;
  id v33 = 0;
  id v51 = 0;
LABEL_13:
  id v63 = 0;
  id v34 = v11;
LABEL_19:
  [*(id *)(a1 + 40) saveLastError:v34];
  uint64_t v76 = 6;
LABEL_20:
  [*(id *)(a1 + 40) saveState:v76];
  v77 = [*(id *)(a1 + 40) nrdLock];

  if (v77)
  {
    logfunction(", 1, @"Releasing nrd lock\n"", v78, v79, v80, v81, v82, v89);
    v83 = [*(id *)(a1 + 40) nrdLock];
    NRDReleaseActivityLock(v83);

    [*(id *)(a1 + 40) setNrdLock:0];
  }
LABEL_22:
}

- (void)updateStatusFromCallback:(id)a3
{
  id v4 = a3;
  v5 = [(MSUNRDUpdateBrainController *)self stateQueue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(MSUNRDUpdateBrainController *)self stateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MSUNRDUpdateBrainController_updateStatusFromCallback___block_invoke;
  v8[3] = &unk_1000591B0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

id __56__MSUNRDUpdateBrainController_updateStatusFromCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction(", 1, @"Current NRD Update status:%@\n"", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  [*(id *)(a1 + 40) setProgressStatus:*(void *)(a1 + 32)];
  id result = [*(id *)(a1 + 40) progressCB];
  if (result)
  {
    uint64_t v12 = (uint64_t (*)(uint64_t, id))[*(id *)(a1 + 40) progressCB];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) progressContext];
    return (id)v12(v10, v11);
  }
  return result;
}

- (id)status
{
  v3 = [(MSUNRDUpdateBrainController *)self stateQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = +[NSMutableDictionary dictionary];
  v5 = [(MSUNRDUpdateBrainController *)self stateQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __37__MSUNRDUpdateBrainController_status__block_invoke;
  v9[3] = &unk_1000591B0;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  dispatch_sync(v5, v9);

  id v7 = v6;
  return v7;
}

void __37__MSUNRDUpdateBrainController_status__block_invoke(uint64_t a1)
{
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 40) state]);
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"State"];

  v3 = [*(id *)(a1 + 40) currentMSUUpdateAttributes];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) currentMSUUpdateAttributes];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"MSUUpdateAttributes"];
  }
  v5 = [*(id *)(a1 + 40) progressStatus];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) progressStatus];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"ProgressStatus"];
  }
  id v7 = [*(id *)(a1 + 40) lastError];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) lastError];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"LastError"];
  }
  id v9 = [*(id *)(a1 + 40) currentRecoveryOSInfo];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) currentRecoveryOSInfo];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"RecoveryOSInfo"];
  }
  id v11 = [*(id *)(a1 + 40) lastSuccessForTargetMainOSBuild];

  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 40) lastSuccessForTargetMainOSBuild];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"SuccessForTargetMainOSBuild"];
  }
  uint64_t v13 = [*(id *)(a1 + 40) lastSuccessForTargetRecoveryOSBuild];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 40) lastSuccessForTargetRecoveryOSBuild];
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"SuccessForTargetRecoveryOSBuild"];
  }
}

- (void)cancelAndLock
{
  logfunction(", 1, @"Received request to cancel RecoveryOS update\n"", v2, v3, v4, v5, v6, v9);
  id v8 = [(MSUNRDUpdateBrainController *)self cancelQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke;
  block[3] = &unk_100059200;
  void block[4] = self;
  dispatch_async(v8, block);
}

void __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction(", 1, @"starting to cancel RecoveryOS update\n"", a4, a5, a6, a7, a8, v21);
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id obj = 0;
  id v28 = 0;
  BOOL updated = NRDGetUpdateBrainConnection(&v28, &obj, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 32));
  id v10 = v28;
  objc_storeStrong(&v38, obj);
  *((unsigned char *)v30 + 24) = updated;
  uint64_t v17 = (id *)(v34 + 5);
  uint64_t v16 = v34[5];
  if (!updated)
  {
    CFStringRef v20 = @"Non-fatal error connecting to RecoveryOSUpdateBrain: %@\n";
LABEL_6:
    logfunction("", 1, v20, v11, v12, v13, v14, v15, v16);
    goto LABEL_7;
  }
  id v26 = (id)v34[5];
  BOOL v18 = NRDCancelRecoveryOSUpdate(v10, &v26, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 32));
  objc_storeStrong(v17, v26);
  *((unsigned char *)v30 + 24) = v18;
  if (!v18)
  {
    uint64_t v16 = v34[5];
    CFStringRef v20 = @"Non-fatal error canceling recoveryOS update: %@\n";
    goto LABEL_6;
  }
  uint64_t v19 = [*(id *)(a1 + 32) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke_387;
  block[3] = &unk_1000591D8;
  void block[4] = *(void *)(a1 + 32);
  id v23 = v10;
  uint64_t v24 = &v29;
  uint64_t v25 = &v33;
  dispatch_async(v19, block);

LABEL_7:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v33, 8);
}

void __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke_387(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nrdLock];

  if (!v2)
  {
    logfunction(", 1, @"Acquiring NRD lock\n"", v3, v4, v5, v6, v7, v24);
    id v8 = NRDAcquireActivityLock(*(void **)(a1 + 40), (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 32));
    [*(id *)(a1 + 32) setNrdLock:v8];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  id v27 = 0;
  BOOL v10 = NRDQueryRecoveryOS(*(void **)(a1 + 40), 0, 0, &off_100064B00, 0, &v27, &obj, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 32));
  id v11 = v27;
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  if (v11)
  {
    logfunction(", 1, @"Installed recovery OS:\n%@\n"", v12, v13, v14, v15, v16, (char)v11);
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = v11;
LABEL_7:
    [v17 saveRecoveryOSInfo:v18];
    goto LABEL_8;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    logfunction(", 1, @"No recoveryOS is installed\n"", v12, v13, v14, v15, v16, v25);
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = 0;
    goto LABEL_7;
  }
  logfunction(", 1, @"Installed state of recovery OS is unknown.\n"", v12, v13, v14, v15, v16, v25);
LABEL_8:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    logfunction(", 1, @"Non-fatal error querying for RecoveryOS update: %@\n"", v19, v20, v21, v22, v23, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
}

- (id)waitWithTimeout:(int)a3 progressCallback:(void *)a4 context:(void *)a5 releaseLock:(BOOL)a6
{
  BOOL v8 = a6;
  logfunction(", 1, @"waitWithTimeout:%d releaseLock:%@\n"", (uint64_t)a4, (uint64_t)a5, a6, v6, v7, a3);
  uint64_t v13 = [(MSUNRDUpdateBrainController *)self stateQueue];
  dispatch_assert_queue_not_V2(v13);

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  if (a4)
  {
    uint64_t v15 = [(MSUNRDUpdateBrainController *)self stateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke;
    block[3] = &unk_100059228;
    void block[4] = self;
    void block[5] = a4;
    block[6] = a5;
    dispatch_sync(v15, block);
  }
  uint64_t v16 = [(MSUNRDUpdateBrainController *)self workQueue];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_408;
  v37[3] = &unk_100059200;
  uint64_t v17 = v14;
  id v38 = v17;
  dispatch_async(v16, v37);

  dispatch_time_t v18 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_semaphore_wait(v17, v18))
  {
    logfunction(", 1, @"Timed out waiting for NRD update to finish\n"", v19, v20, v21, v22, v23, v35);
    NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
    CFStringRef v41 = @"timed out waiting for NRD update to finish";
    char v24 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    char v25 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:77 userInfo:v24];

    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    char v25 = 0;
    if (!v8) {
      goto LABEL_9;
    }
  }
  id v26 = [(MSUNRDUpdateBrainController *)self nrdLock];

  if (v26)
  {
    logfunction(", 1, @"Releasing nrd lock\n"", v27, v28, v29, v30, v31, v35);
    char v32 = [(MSUNRDUpdateBrainController *)self nrdLock];
    NRDReleaseActivityLock(v32);

    [(MSUNRDUpdateBrainController *)self setNrdLock:0];
  }
LABEL_9:
  if (a4)
  {
    uint64_t v33 = [(MSUNRDUpdateBrainController *)self stateQueue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_2;
    v36[3] = &unk_100059200;
    v36[4] = self;
    dispatch_sync(v33, v36);
  }
  return v25;
}

void __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressCB:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setProgressContext:*(void *)(a1 + 48)];
  uint64_t v2 = +[NSNumber numberWithDouble:90.0];
  v4[0] = @"ActionText";
  v4[1] = @"ElapsedTime";
  v5[0] = @"Waiting for RecoveryOS update...";
  v5[1] = &off_1000649C8;
  v4[2] = @"PercentComplete";
  v4[3] = @"PercentBytesComplete";
  v5[2] = v2;
  v5[3] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  ((void (*)(void *, id))[*(id *)(a1 + 32) progressCB])(v3, objc_msgSend(*(id *)(a1 + 32), "progressContext"));
}

intptr_t __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_408(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressCB:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setProgressContext:0];
}

- (void)saveLastError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSUNRDUpdateBrainController *)self stateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__MSUNRDUpdateBrainController_saveLastError___block_invoke;
  v7[3] = &unk_1000591B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __45__MSUNRDUpdateBrainController_saveLastError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastError];
  logfunction(", 1, @"Overriding current error:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  return [v8 setLastError:v9];
}

- (void)saveRecoveryOSInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSUNRDUpdateBrainController *)self stateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__MSUNRDUpdateBrainController_saveRecoveryOSInfo___block_invoke;
  v7[3] = &unk_1000591B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __50__MSUNRDUpdateBrainController_saveRecoveryOSInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentRecoveryOSInfo];
  logfunction(", 1, @"Overriding current RecoveryOS info:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  return [v8 setCurrentRecoveryOSInfo:v9];
}

- (void)saveLastSuccessForTargetMainOSBuild:(id)a3 recoveryOSBuild:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSUNRDUpdateBrainController *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __83__MSUNRDUpdateBrainController_saveLastSuccessForTargetMainOSBuild_recoveryOSBuild___block_invoke;
  block[3] = &unk_100059250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __83__MSUNRDUpdateBrainController_saveLastSuccessForTargetMainOSBuild_recoveryOSBuild___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastSuccessForTargetMainOSBuild];
  logfunction(", 1, @"Overriding current LastSuccessForTargetMainOSBuild:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  id v8 = [*(id *)(a1 + 32) lastSuccessForTargetRecoveryOSBuild];
  logfunction(", 1, @"Overriding current LastSuccessForTargetRecoveryOSBuild:%@ with:%@\n"", v9, v10, v11, v12, v13, (char)v8);

  [*(id *)(a1 + 32) setLastSuccessForTargetMainOSBuild:*(void *)(a1 + 40)];
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void **)(a1 + 32);
  return [v15 setLastSuccessForTargetRecoveryOSBuild:v14];
}

- (void)saveMSUUpdateAttributes:(id)a3 andState:(int)a4
{
  id v6 = a3;
  uint64_t v7 = [(MSUNRDUpdateBrainController *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MSUNRDUpdateBrainController_saveMSUUpdateAttributes_andState___block_invoke;
  block[3] = &unk_100059278;
  int v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

id __64__MSUNRDUpdateBrainController_saveMSUUpdateAttributes_andState___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MSUNRDUpdateBrainController stateToString:](MSUNRDUpdateBrainController, "stateToString:", [*(id *)(a1 + 32) state]);
  uint64_t v3 = +[MSUNRDUpdateBrainController stateToString:*(unsigned int *)(a1 + 48)];
  logfunction(", 1, @"Overriding current state:%@ with:%@\n"", v4, v5, v6, v7, v8, (char)v2);

  [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 48)];
  uint64_t v9 = [*(id *)(a1 + 32) currentMSUUpdateAttributes];
  logfunction(", 1, @"Overriding current MSU Update Attributes:%@ with:%@\n"", v10, v11, v12, v13, v14, (char)v9);

  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  return [v15 setCurrentMSUUpdateAttributes:v16];
}

+ (id)stateToString:(int)a3
{
  if (a3 > 6) {
    return @"Unknown";
  }
  else {
    return *(&off_1000592C0 + a3);
  }
}

- (void)saveState:(int)a3
{
  uint64_t v5 = [(MSUNRDUpdateBrainController *)self stateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __41__MSUNRDUpdateBrainController_saveState___block_invoke;
  v6[3] = &unk_1000592A0;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

id __41__MSUNRDUpdateBrainController_saveState___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MSUNRDUpdateBrainController stateToString:](MSUNRDUpdateBrainController, "stateToString:", [*(id *)(a1 + 32) state]);
  uint64_t v11 = +[MSUNRDUpdateBrainController stateToString:*(unsigned int *)(a1 + 40)];
  logfunction(", 1, @"Overriding current state:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  uint64_t v8 = *(unsigned int *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 setState:v8];
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)cancelQueue
{
  return self->_cancelQueue;
}

- (void)setCancelQueue:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (id)nrdLock
{
  return self->_nrdLock;
}

- (void)setNrdLock:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSDictionary)currentRecoveryOSInfo
{
  return self->_currentRecoveryOSInfo;
}

- (void)setCurrentRecoveryOSInfo:(id)a3
{
}

- (NSDictionary)progressStatus
{
  return self->_progressStatus;
}

- (void)setProgressStatus:(id)a3
{
}

- (NSDictionary)currentMSUUpdateAttributes
{
  return self->_currentMSUUpdateAttributes;
}

- (void)setCurrentMSUUpdateAttributes:(id)a3
{
}

- (NSString)lastSuccessForTargetMainOSBuild
{
  return self->_lastSuccessForTargetMainOSBuild;
}

- (void)setLastSuccessForTargetMainOSBuild:(id)a3
{
}

- (NSString)lastSuccessForTargetRecoveryOSBuild
{
  return self->_lastSuccessForTargetRecoveryOSBuild;
}

- (void)setLastSuccessForTargetRecoveryOSBuild:(id)a3
{
}

- (void)progressCB
{
  return self->_progressCB;
}

- (void)setProgressCB:(void *)a3
{
  self->_progressCB = a3;
}

- (void)progressContext
{
  return self->_progressContext;
}

- (void)setProgressContext:(void *)a3
{
  self->_progressContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSuccessForTargetRecoveryOSBuild, 0);
  objc_storeStrong((id *)&self->_lastSuccessForTargetMainOSBuild, 0);
  objc_storeStrong((id *)&self->_currentMSUUpdateAttributes, 0);
  objc_storeStrong((id *)&self->_progressStatus, 0);
  objc_storeStrong((id *)&self->_currentRecoveryOSInfo, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong(&self->_nrdLock, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end