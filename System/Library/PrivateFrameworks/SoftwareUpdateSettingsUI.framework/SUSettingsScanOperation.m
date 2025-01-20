@interface SUSettingsScanOperation
+ (id)_generateStateTable;
+ (unint64_t)installationIgnorableConstraints;
- (BOOL)isActive;
- (BOOL)isCanceled;
- (BOOL)shouldConsiderErrorAsSuccessfulCase:(id)a3;
- (NSDictionary)stateTable;
- (NSString)scanUUID;
- (OS_dispatch_group)scanGroup;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)concurrentQueue;
- (SDBetaManager)seedingBetaManager;
- (SUCoreFSM)scanFSM;
- (SUCoreLog)log;
- (SUManagerClient)suClient;
- (SUSettingsScanOperation)initWithUUID:(id)a3 usingSUManagerClient:(id)a4 andBetaManager:(id)a5 withCompletionQueue:(id)a6;
- (id)baseDomain;
- (id)cancelHandler;
- (id)fullScanCompletionHandler;
- (id)refreshScanCompletionHandler;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ObserveConcurrentQueries:(id)a3 error:(id *)a4;
- (int64_t)action_QueryCurrentDownload:(id)a3 error:(id *)a4;
- (int64_t)action_QueryFullScanMetadata:(id)a3 error:(id *)a4;
- (int64_t)action_QueryUpdatesInfo:(id)a3 error:(id *)a4;
- (int64_t)action_ReportScanCanceled:(id)a3 error:(id *)a4;
- (int64_t)action_ReportScanOutcome:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)operationType;
- (void)cancel:(id)a3;
- (void)checkForAvailableUpdatesWithCompletionHandler:(id)a3;
- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4;
- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4 usingThirdPartyScanResults:(id)a5 andScanError:(id)a6;
- (void)checkForBetaPrograms:(id)a3 withReplyHandler:(id)a4;
- (void)checkForMDMRestrictions:(id)a3 withReplyHandler:(id)a4;
- (void)checkIfAutoUpdateScheduled:(id)a3 withReplyHandler:(id)a4;
- (void)checkIsEligibleForRollback:(id)a3 withReplyHandler:(id)a4;
- (void)invalidateMachine;
- (void)queryDDMDeclaration:(id)a3 withReplyHandler:(id)a4;
- (void)queryRollbackStatus:(id)a3 withReplyHandler:(id)a4;
- (void)refreshBetaProgramsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 encounteredError:(id)a7 completionHandler:(id)a8;
- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 previouslyDiscoveredAutoInstallOperation:(id)a7 encounteredError:(id)a8 completionHandler:(id)a9;
- (void)scanForDeviceEligibleBetaPrograms:(id)a3 withReplyHandler:(id)a4;
- (void)scheduleConcurrentActionWithSelector:(SEL)a3 eventInfo:(id)a4;
- (void)setCancelHandler:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setFullScanCompletionHandler:(id)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setRefreshScanCompletionHandler:(id)a3;
- (void)setScanGroup:(id)a3;
- (void)startRefreshOperation:(id)a3 withEventInfo:(id)a4 completionHandler:(id)a5;
@end

@implementation SUSettingsScanOperation

+ (id)_generateStateTable
{
  v97[6] = *MEMORY[0x263EF8340];
  v37[2] = a1;
  v37[1] = (id)a2;
  v96[0] = @"Idle";
  v94[0] = @"CheckForAvailableUpdate";
  v5 = (void *)MEMORY[0x263F78170];
  v92[0] = *MEMORY[0x263F78170];
  v93[0] = @"CheckingForAvailableUpdate";
  v4 = (void *)MEMORY[0x263F77E28];
  v92[1] = *MEMORY[0x263F77E28];
  v93[1] = @"QueryFullScanMetadata";
  id v34 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92);
  v95[0] = v34;
  v94[1] = @"RefreshScanResults";
  v90[0] = *v5;
  v91[0] = @"QueryingCurrentDownload";
  v90[1] = *v4;
  v91[1] = @"QueryCurrentDownload";
  id v33 = (id)[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
  v95[1] = v33;
  v94[2] = @"RefreshScanResultsPostDownload";
  v88[0] = *v5;
  v89[0] = @"QueryingUpdatesInfo";
  v88[1] = *v4;
  v89[1] = @"QueryUpdatesInfo";
  id v32 = (id)[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
  v95[2] = v32;
  v94[3] = @"CancelScan";
  v86[0] = *v5;
  v87[0] = @"Idle";
  v86[1] = *v4;
  v87[1] = @"ReportScanCanceled";
  id v31 = (id)[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
  v95[3] = v31;
  id v30 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v95, v94);
  v97[0] = v30;
  v96[1] = @"CheckingForAvailableUpdate";
  v84[0] = @"PerformFullScan";
  uint64_t v82 = *v4;
  v83 = @"CheckForAvailableUpdate";
  id v29 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v83, &v82);
  v85[0] = v29;
  v84[1] = @"UpdatesAvailable";
  v80[0] = *v5;
  v81[0] = @"QueryingCurrentDownload";
  v80[1] = *v4;
  v81[1] = @"QueryCurrentDownload";
  id v28 = (id)[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  v85[1] = v28;
  v84[2] = @"NoUpdateAvailable";
  v78[0] = *v5;
  v79[0] = @"QueryingCurrentDownload";
  v78[1] = *v4;
  v79[1] = @"QueryCurrentDownload";
  id v27 = (id)[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
  v85[2] = v27;
  v84[3] = @"CheckingForUpdatesFailed";
  v76[0] = *v5;
  v77[0] = @"Idle";
  v76[1] = *v4;
  v77[1] = @"ReportScanOutcome";
  id v26 = (id)[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
  v85[3] = v26;
  v84[4] = @"ConcurrentActionFailed";
  v74[0] = *v5;
  v75[0] = @"Idle";
  v74[1] = *v4;
  v75[1] = @"ReportScanOutcome";
  id v25 = (id)[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
  v85[4] = v25;
  v84[5] = @"CancelScan";
  v72[0] = *v5;
  v73[0] = @"Idle";
  v72[1] = *v4;
  v73[1] = @"ReportScanCanceled";
  id v24 = (id)[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  v85[5] = v24;
  id v23 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84);
  v97[1] = v23;
  v96[2] = @"QueryingCurrentDownload";
  v70[0] = @"QueryCurrentDownloadSuccess";
  v68[0] = *v5;
  v69[0] = @"QueryingUpdatesInfo";
  v68[1] = *v4;
  v69[1] = @"QueryUpdatesInfo";
  id v22 = (id)[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  v71[0] = v22;
  v70[1] = @"QueryCurrentDownloadFailed";
  v66[0] = *v5;
  v67[0] = @"Idle";
  v66[1] = *v4;
  v67[1] = @"ReportScanFailed";
  id v21 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
  v71[1] = v21;
  v70[2] = @"NoUpdateAvailable";
  v64[0] = *v5;
  v65[0] = @"ObservingConcurrentQueries";
  v64[1] = *v4;
  v65[1] = @"ObserveConcurrentQueries";
  id v20 = (id)[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
  v71[2] = v20;
  v70[3] = @"ConcurrentActionFailed";
  v62[0] = *v5;
  v63[0] = @"Idle";
  v62[1] = *v4;
  v63[1] = @"ReportScanOutcome";
  id v19 = (id)[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
  v71[3] = v19;
  v70[4] = @"CancelScan";
  v60[0] = *v5;
  v61[0] = @"Idle";
  v60[1] = *v4;
  v61[1] = @"ReportScanCanceled";
  id v18 = (id)[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
  v71[4] = v18;
  id v17 = (id)[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:5];
  v97[2] = v17;
  v96[3] = @"QueryingUpdatesInfo";
  v58[0] = @"QueryUpdatesInfoSuccess";
  v56[0] = *v5;
  v57[0] = @"ObservingConcurrentQueries";
  v56[1] = *v4;
  v57[1] = @"ObserveConcurrentQueries";
  id v16 = (id)[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
  v59[0] = v16;
  v58[1] = @"QueryUpdatesInfoFailed";
  v54[0] = *v5;
  v55[0] = @"Idle";
  v54[1] = *v4;
  v55[1] = @"ReportScanOutcome";
  id v15 = (id)[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  v59[1] = v15;
  v58[2] = @"ConcurrentActionFailed";
  v52[0] = *v5;
  v53[0] = @"Idle";
  v52[1] = *v4;
  v53[1] = @"ReportScanOutcome";
  id v14 = (id)[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
  v59[2] = v14;
  v58[3] = @"CancelScan";
  v50[0] = *v5;
  v51[0] = @"Idle";
  v50[1] = *v4;
  v51[1] = @"ReportScanCanceled";
  id v13 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  v59[3] = v13;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
  v97[3] = v12;
  v96[4] = @"ObservingConcurrentQueries";
  v48[0] = @"AllConcurrentActionsFinished";
  v46[0] = *v5;
  v47[0] = @"Idle";
  v46[1] = *v4;
  v47[1] = @"ReportScanOutcome";
  id v11 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[0] = v11;
  v48[1] = @"ConcurrentActionFailed";
  v44[0] = *v5;
  v45[0] = @"Idle";
  v44[1] = *v4;
  v45[1] = @"ReportScanOutcome";
  id v10 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  v49[1] = v10;
  v48[2] = @"CancelScan";
  v42[0] = *v5;
  v43[0] = @"Idle";
  v42[1] = *v4;
  v43[1] = @"ReportScanCanceled";
  id v9 = (id)[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  v49[2] = v9;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
  v97[4] = v8;
  v96[5] = *MEMORY[0x263F78158];
  uint64_t v40 = *MEMORY[0x263F78150];
  uint64_t v38 = *v5;
  uint64_t v39 = *MEMORY[0x263F78160];
  id v7 = (id)[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v41 = v7;
  id v6 = (id)[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  v97[5] = v6;
  v37[0] = (id)[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:6];

  id v2 = objc_alloc(NSDictionary);
  id v36 = (id)[v2 initWithDictionary:v37[0] copyItems:1];
  id v35 = v36;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);
  return v35;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  id v15 = [(SUSettingsScanOperation *)v24 scanFSM];
  id v14 = (id)[(SUCoreFSM *)v15 extendedStateQueue];
  dispatch_assert_queue_V2(v14);

  id v16 = v24;
  objc_sync_enter(v16);
  if (!v24->_canceled || ([location[0] isEqualToString:@"ReportScanCanceled"] & 1) != 0)
  {
    int v18 = 0;
  }
  else
  {
    int64_t v25 = 0;
    int v18 = 1;
  }
  objc_sync_exit(v16);

  if (!v18)
  {
    if ([location[0] isEqualToString:*MEMORY[0x263F78148]])
    {
      uint64_t v17 = 0;
    }
    else if ([location[0] isEqualToString:@"QueryFullScanMetadata"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_QueryFullScanMetadata:v20 error:a8];
    }
    else if ([location[0] isEqualToString:@"CheckForAvailableUpdate"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_CheckForAvailableUpdate:v20 error:a8];
    }
    else if ([location[0] isEqualToString:@"QueryCurrentDownload"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_QueryCurrentDownload:v20 error:a8];
    }
    else if ([location[0] isEqualToString:@"QueryUpdatesInfo"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_QueryUpdatesInfo:v20 error:a8];
    }
    else if ([location[0] isEqualToString:@"ObserveConcurrentQueries"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_ObserveConcurrentQueries:v20 error:a8];
    }
    else if ([location[0] isEqualToString:@"ReportScanOutcome"])
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 action_ReportScanOutcome:v20 error:a8];
    }
    else
    {
      uint64_t v17 = [(SUSettingsScanOperation *)v24 actionUnknownAction:location[0] error:a8];
    }
    int64_t v25 = v17;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v25;
}

- (int64_t)action_QueryFullScanMetadata:(id)a3 error:(id *)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [(SUSettingsScanOperation *)v10 scanFSM];
  id v7 = (id)[(SUCoreFSM *)v8 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  if (location[0])
  {
    [(SUSettingsScanOperation *)v10 scheduleConcurrentActionWithSelector:sel_queryDDMDeclaration_withReplyHandler_ eventInfo:location[0]];
    [(SUSettingsScanOperation *)v10 scheduleConcurrentActionWithSelector:sel_checkForMDMRestrictions_withReplyHandler_ eventInfo:location[0]];
    [(SUSettingsScanOperation *)v10 scheduleConcurrentActionWithSelector:sel_checkForBetaPrograms_withReplyHandler_ eventInfo:location[0]];
    [(SUSettingsScanOperation *)v10 scheduleConcurrentActionWithSelector:sel_queryRollbackStatus_withReplyHandler_ eventInfo:location[0]];
    [(SUSettingsScanOperation *)v10 scheduleConcurrentActionWithSelector:sel_checkIsEligibleForRollback_withReplyHandler_ eventInfo:location[0]];
    [(SUCoreFSM *)v10->_scanFSM followupEvent:@"PerformFullScan" withInfo:location[0]];
    int64_t v11 = 0;
  }
  else
  {
    id v6 = [(SUSettingsScanOperation *)v10 scanFSM];
    id v5 = (id)[(SUCoreFSM *)v6 diag];
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v11 = 8102;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v40 = a4;
  id v23 = [(SUSettingsScanOperation *)v42 scanFSM];
  id v22 = (id)[(SUCoreFSM *)v23 extendedStateQueue];
  dispatch_assert_queue_V2(v22);

  if (location[0])
  {
    id v17 = (id)[location[0] options];
    char v37 = 0;
    char v35 = 0;
    BOOL v18 = 1;
    if (v17)
    {
      id v38 = (id)[location[0] options];
      char v37 = 1;
      id v36 = (id)[v38 scanOptions];
      char v35 = 1;
      BOOL v18 = v36 == 0;
    }
    if (v35) {

    }
    if (v37) {
    if (v18)
    }
    {
      id v16 = [(SUSettingsScanOperation *)v42 scanFSM];
      id v15 = (id)[(SUCoreFSM *)v16 diag];
      objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"Missing eventInfo parameter: scanOptions.");

      int64_t v43 = 8102;
      int v39 = 1;
    }
    else
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      int v28 = -1073741824;
      int v29 = 0;
      id v30 = __64__SUSettingsScanOperation_action_CheckForAvailableUpdate_error___block_invoke;
      id v31 = &unk_264841388;
      id v32 = v42;
      id v33 = location[0];
      id v34 = (id)MEMORY[0x22A697370](&v27);
      id v13 = (id)[location[0] thirdPartyDiscoveredScanResults];
      char v25 = 0;
      BOOL v14 = 0;
      if (!v13)
      {
        id v26 = (id)[location[0] thirdPartyDiscoveredScanError];
        char v25 = 1;
        BOOL v14 = v26 == 0;
      }
      if (v25) {

      }
      if (v14)
      {
        id v12 = [(SUSettingsScanOperation *)v42 suClient];
        id v11 = (id)[location[0] options];
        id v10 = (id)[v11 scanOptions];
        -[SUManagerClient scanForUpdates:withScanResults:](v12, "scanForUpdates:withScanResults:");
      }
      else
      {
        id v9 = [(SUSettingsScanOperation *)v42 log];
        id v24 = (id)[(SUCoreLog *)v9 oslog];

        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [(SUSettingsScanOperation *)v42 scanUUID];
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v44, (uint64_t)"-[SUSettingsScanOperation action_CheckForAvailableUpdate:error:]", (uint64_t)v8);
          _os_log_impl(&dword_228401000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Got third-party discovered scan results. Using them instead of performing a new scan.", v44, 0x16u);
        }
        objc_storeStrong(&v24, 0);
        id v5 = (void (**)(id, id))v34;
        id v7 = (id)[location[0] thirdPartyDiscoveredScanResults];
        id v6 = (id)[location[0] thirdPartyDiscoveredScanError];
        v5[2](v5, v7);
      }
      int64_t v43 = 0;
      int v39 = 1;
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v32, 0);
    }
  }
  else
  {
    id v20 = [(SUSettingsScanOperation *)v42 scanFSM];
    id v19 = (id)[(SUCoreFSM *)v20 diag];
    objc_msgSend(v19, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v43 = 8102;
    int v39 = 1;
  }
  objc_storeStrong(location, 0);
  return v43;
}

void __64__SUSettingsScanOperation_action_CheckForAvailableUpdate_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  id v15 = (id)[a1[4] log];
  v20[0] = (id)[v15 oslog];

  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_64((uint64_t)v23, (uint64_t)"-[SUSettingsScanOperation action_CheckForAvailableUpdate:error:]_block_invoke", (uint64_t)v14, (uint64_t)v21, (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, (os_log_t)v20[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: scanForUpdates results: error: %{public}@; SUScanResults: %@",
      v23,
      0x2Au);
  }
  objc_storeStrong(v20, 0);
  [a1[5] setScanError:v21];
  if (!v21 || ([a1[4] shouldConsiderErrorAsSuccessfulCase:v21] & 1) != 0)
  {
    if (location[0])
    {
      [a1[5] setEmptyScanResults:0];
      id v6 = a1[5];
      id v7 = (id)[location[0] preferredDescriptor];
      objc_msgSend(v6, "setPreferredDescriptor:");

      id v8 = a1[5];
      id v9 = (id)[location[0] alternateDescriptor];
      objc_msgSend(v8, "setAlternateDescriptor:");

      id v10 = (id)[location[0] preferredDescriptor];
      char v18 = 0;
      BOOL v11 = 1;
      if (!v10)
      {
        id v19 = (id)[location[0] alternateDescriptor];
        char v18 = 1;
        BOOL v11 = v19 != 0;
      }
      if (v18) {

      }
      if (v11)
      {
        id v5 = (id)[a1[4] scanFSM];
        [v5 postEvent:@"UpdatesAvailable" withInfo:a1[5]];

        goto LABEL_16;
      }
    }
    else
    {
      [a1[5] setEmptyScanResults:1];
    }
    id v4 = (id)[a1[4] scanFSM];
    [v4 postEvent:@"NoUpdateAvailable" withInfo:a1[5]];

    goto LABEL_16;
  }
  id v13 = (id)[a1[4] scanFSM];
  v3 = [SUSettingsScanParam alloc];
  id v12 = [(SUSettingsScanParam *)v3 initWithError:v21];
  objc_msgSend(v13, "postEvent:withInfo:", @"CheckingForUpdatesFailed");

LABEL_16:
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_QueryCurrentDownload:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  int v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v37 = a4;
  uint64_t v24 = [(SUSettingsScanOperation *)v39 scanFSM];
  id v23 = (id)[(SUCoreFSM *)v24 extendedStateQueue];
  dispatch_assert_queue_V2(v23);

  if (location[0])
  {
    uint64_t v28 = MEMORY[0x263EF8330];
    int v29 = -1073741824;
    int v30 = 0;
    id v31 = __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke;
    id v32 = &unk_26483E9D8;
    id v33 = v39;
    id v34 = location[0];
    id v35 = (id)MEMORY[0x22A697370](&v28);
    id v4 = (id)[location[0] currentDownload];
    BOOL v19 = v4 != 0;

    if (v19)
    {
      id v17 = [(SUSettingsScanOperation *)v39 log];
      id v27 = (id)[(SUCoreLog *)v17 oslog];

      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
      {
        log = v27;
        os_log_type_t type = v26;
        id v16 = [(SUSettingsScanOperation *)v39 scanUUID];
        id v15 = (id)[location[0] currentDownload];
        id v14 = (id)[v15 descriptor];
        id v13 = (id)[v14 humanReadableUpdateName];
        id v9 = v13;
        id v25 = v9;
        id v12 = (id)[location[0] currentDownload];
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v41, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]", (uint64_t)v16, (uint64_t)v9, (uint64_t)v12);
        _os_log_impl(&dword_228401000, log, type, "%s [%{public}@]: Scan operation has already been given a download (%{public}@, %p) - skipping on the download lookup.", v41, 0x2Au);

        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong(&v27, 0);
      id v6 = (void (**)(id, id))v35;
      id v8 = (id)[location[0] currentDownload];
      id v7 = (id)[location[0] operationError];
      v6[2](v6, v8);
    }
    else
    {
      char v18 = [(SUSettingsScanOperation *)v39 suClient];
      [(SUManagerClient *)v18 download:v35];
    }
    int64_t v40 = 0;
    int v36 = 1;
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v33, 0);
  }
  else
  {
    id v21 = [(SUSettingsScanOperation *)v39 scanFSM];
    id v20 = (id)[(SUCoreFSM *)v21 diag];
    objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v40 = 8102;
    int v36 = 1;
  }
  objc_storeStrong(location, 0);
  return v40;
}

void __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v47 = 0;
  objc_storeStrong(&v47, a3);
  v46[1] = a1;
  id v25 = (id)[a1[4] log];
  v46[0] = (id)[v25 oslog];

  os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v46[0], OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v50, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v24, (uint64_t)v47, (uint64_t)location[0], (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, (os_log_t)v46[0], v45, "%s [%{public}@]: error: %{public}@, download: <%p> %{public}@", v50, 0x34u);
  }
  objc_storeStrong(v46, 0);
  if (!v47 || ([a1[4] shouldConsiderErrorAsSuccessfulCase:v47] & 1) != 0)
  {
    char v42 = 0;
    BOOL v21 = 0;
    if (!location[0])
    {
      id v43 = (id)[v47 domain];
      char v42 = 1;
      BOOL v21 = 0;
      if ([v43 isEqualToString:*MEMORY[0x263F78360]]) {
        BOOL v21 = [v47 code] == 11;
      }
    }
    if (v42) {

    }
    if (v21)
    {
      id v4 = [[SUSUIUninitializedDownload alloc] initWithDescriptor:0];
      id v5 = location[0];
      location[0] = v4;

      id v20 = (id)[a1[4] log];
      id v41 = (id)[v20 oslog];

      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (id)[a1[4] scanUUID];
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v49, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v19, (uint64_t)v47, (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, (os_log_t)v41, v40, "%s [%{public}@]: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v49, 0x2Au);
      }
      objc_storeStrong(&v41, 0);
    }
    char v38 = 0;
    char v36 = 0;
    char v18 = 0;
    if (!location[0])
    {
      char v17 = 1;
      if (([a1[5] emptyScanResults] & 1) == 0)
      {
        id v39 = (id)[a1[5] preferredDescriptor];
        char v38 = 1;
        BOOL v16 = 0;
        if (!v39)
        {
          id v37 = (id)[a1[5] alternateDescriptor];
          char v36 = 1;
          BOOL v16 = v37 == 0;
        }
        char v17 = v16;
      }
      char v18 = v17;
    }
    if (v36) {

    }
    if (v38) {
    if (v18)
    }
    {
      id v15 = (id)[a1[4] scanFSM];
      [v15 postEvent:@"NoUpdateAvailable" withInfo:a1[5]];

      int v44 = 1;
    }
    else
    {
      [a1[5] setCurrentDownload:location[0]];
      id v35 = objc_alloc_init(SUSUIUpdateAgreementManager);
      id v7 = v35;
      id v9 = (id)[location[0] downloadOptions];
      unsigned int v6 = [v9 downloadFeeAgreementStatus];
      id v8 = (id)[location[0] descriptor];
      -[SUSUIUpdateAgreementManager setCellularFeeAgreementStatus:forUpdate:](v7, "setCellularFeeAgreementStatus:forUpdate:", v6);

      BOOL v11 = v35;
      id v13 = (id)[location[0] downloadOptions];
      unsigned int v10 = [v13 termsAndConditionsAgreementStatus];
      id v12 = (id)[location[0] descriptor];
      -[SUSUIUpdateAgreementManager setTermsAgreementStatus:forUpdate:](v11, "setTermsAgreementStatus:forUpdate:", v10);

      [a1[4] scheduleConcurrentActionWithSelector:sel_checkIfAutoUpdateScheduled_withReplyHandler_ eventInfo:a1[5]];
      id v14 = (id)[a1[4] suClient];
      uint64_t v28 = MEMORY[0x263EF8330];
      int v29 = -1073741824;
      int v30 = 0;
      id v31 = __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke_306;
      id v32 = &unk_26483BD38;
      id v33 = a1[4];
      id v34 = a1[5];
      [v14 isClearingSpaceForDownload:&v28];

      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v35, 0);
      int v44 = 0;
    }
  }
  else
  {
    id v23 = (id)[a1[4] scanFSM];
    v3 = [SUSettingsScanParam alloc];
    id v22 = [(SUSettingsScanParam *)v3 initWithError:v47];
    objc_msgSend(v23, "postEvent:withInfo:", @"QueryCurrentDownloadFailed");

    int v44 = 1;
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke_306(id *a1, char a2, id obj)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = a1;
  char v12 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  id v8 = (id)[a1[4] log];
  v10[0] = (id)[v8 oslog];

  if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v14, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v7, v12 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, (os_log_t)v10[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: isClearingSpaceForDownload? %d, isClearingSpaceError: %{public}@", v14, 0x26u);
  }
  objc_storeStrong(v10, 0);
  if (location)
  {
    id v6 = (id)[a1[4] scanFSM];
    v3 = [SUSettingsScanParam alloc];
    id v5 = [(SUSettingsScanParam *)v3 initWithError:location];
    objc_msgSend(v6, "postEvent:withInfo:", @"QueryCurrentDownloadFailed");
  }
  else
  {
    [a1[5] setClearingSpaceForDownload:v12 & 1];
    id v4 = (id)[a1[4] scanFSM];
    [v4 postEvent:@"QueryCurrentDownloadSuccess" withInfo:a1[5]];
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_QueryUpdatesInfo:(id)a3 error:(id *)a4
{
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v45 = a4;
  int v30 = [(SUSettingsScanOperation *)v47 scanFSM];
  int v29 = (id)[(SUCoreFSM *)v30 extendedStateQueue];
  dispatch_assert_queue_V2(v29);

  if (location[0])
  {
    id v25 = (id)[location[0] preferredDescriptor];
    char v42 = 0;
    char v40 = 0;
    if (v25
      || (id v43 = (id)[location[0] alternateDescriptor],
          char v42 = 1,
          BOOL v24 = 1,
          v43))
    {
      id v41 = (id)[location[0] agreementManager];
      char v40 = 1;
      BOOL v24 = v41 != 0;
    }
    if (v40) {

    }
    if (v42) {
    if (v24)
    }
    {
      id v23 = [(SUSettingsScanOperation *)v47 scanFSM];
      id v22 = (id)[(SUCoreFSM *)v23 diag];
      objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"Both the preferredUpdate and alternateUpdate are empty, or agreementManager is missing.");

      int64_t v48 = 8102;
      int v44 = 1;
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x263F781E0]);
      id v6 = (id)[location[0] preferredDescriptor];
      uint64_t v39 = objc_msgSend(v5, "initWithDescriptor:");

      id v7 = (id)v39;
      id v8 = (id)[location[0] options];
      objc_msgSend(v7, "setAllowUnrestrictedCellularDownload:", objc_msgSend(v8, "allowUnrestrictedCellularDownload") & 1);

      id v9 = (id)v39;
      id v11 = (id)[location[0] agreementManager];
      id v10 = (id)[location[0] preferredDescriptor];
      objc_msgSend(v9, "setDownloadFeeAgreementStatus:", objc_msgSend(v11, "cellularFeeAgreementStatusForUpdate:"));

      id v12 = objc_alloc(MEMORY[0x263F781E0]);
      id v13 = (id)[location[0] alternateDescriptor];
      uint64_t v38 = objc_msgSend(v12, "initWithDescriptor:");

      id v14 = (id)v38;
      id v15 = (id)[location[0] options];
      objc_msgSend(v14, "setAllowUnrestrictedCellularDownload:", objc_msgSend(v15, "allowUnrestrictedCellularDownload") & 1);

      id v16 = (id)v38;
      id v18 = (id)[location[0] agreementManager];
      id v17 = (id)[location[0] alternateDescriptor];
      objc_msgSend(v16, "setDownloadFeeAgreementStatus:", objc_msgSend(v18, "cellularFeeAgreementStatusForUpdate:"));

      BOOL v21 = [(SUSettingsScanOperation *)v47 suClient];
      id v19 = (id)v39;
      id v20 = (id)v38;
      uint64_t v31 = MEMORY[0x263EF8330];
      int v32 = -1073741824;
      int v33 = 0;
      id v34 = __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke;
      id v35 = &unk_2648413B0;
      char v36 = v47;
      id v37 = location[0];
      [(SUManagerClient *)v21 updatesDownloadableWithOptions:v19 alternateDownloadOptions:v20 replyHandler:&v31];

      int64_t v48 = 0;
      int v44 = 1;
      objc_storeStrong(&v37, 0);
      objc_storeStrong((id *)&v36, 0);
      objc_storeStrong((id *)&v38, 0);
      objc_storeStrong((id *)&v39, 0);
    }
  }
  else
  {
    id v27 = [(SUSettingsScanOperation *)v47 scanFSM];
    id v26 = (id)[(SUCoreFSM *)v27 diag];
    objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v48 = 8102;
    int v44 = 1;
  }
  objc_storeStrong(location, 0);
  return v48;
}

void __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke(id *a1, char a2, char a3, id obj, void *a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v36 = a1;
  char v35 = a2 & 1;
  char v34 = a3 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  v31[1] = a1;
  id v15 = (id)[a1[4] log];
  v31[0] = (id)[v15 oslog];

  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)[a1[4] scanUUID];
    id v14 = v5;
    if (v35) {
      id v6 = "YES";
    }
    else {
      id v6 = "NO";
    }
    if (v34) {
      id v7 = "YES";
    }
    else {
      id v7 = "NO";
    }
    __os_log_helper_16_2_6_8_32_8_66_8_32_8_66_8_32_8_66((uint64_t)v37, (uint64_t)"-[SUSettingsScanOperation action_QueryUpdatesInfo:error:]_block_invoke", (uint64_t)v5, (uint64_t)v6, (uint64_t)location, (uint64_t)v7, (uint64_t)v32);
    _os_log_impl(&dword_228401000, (os_log_t)v31[0], v30, "%s [%{public}@]: preferredDownloadable: %s, preferredError: %{public}@, alternateDownloadable: %s, alternateError: %{public}@", v37, 0x3Eu);
  }
  objc_storeStrong(v31, 0);
  [a1[5] setPreferredUpdateDownloadable:v35 & 1];
  [a1[5] setAlternateUpdateDownloadable:v34 & 1];
  [a1[5] setPreferredUpdateDownloadError:location];
  [a1[5] setAlternateUpdateDownloadError:v32];
  id v12 = (id)[a1[5] currentDownload];
  char v28 = 0;
  char v26 = 0;
  char v13 = 0;
  if (v12)
  {
    id v29 = (id)[a1[5] currentDownload];
    char v28 = 1;
    id v27 = (id)[v29 progress];
    char v26 = 1;
    char v13 = [v27 isDone];
  }
  if (v26) {

  }
  if (v28) {
  if (v13)
  }
  {
    id v25 = objc_alloc_init(MEMORY[0x263F781E8]);
    uint64_t v8 = [(id)objc_opt_class() installationIgnorableConstraints];
    [v25 setIgnorableConstraints:v8];
    id v11 = (void *)*((void *)a1[4] + 11);
    id v10 = v25;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    BOOL v21 = __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke_316;
    id v22 = &unk_26483BD38;
    id v23 = a1[4];
    id v24 = a1[5];
    [v11 isUpdateReadyForInstallationWithOptions:v10 withResult:&v18];
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    id v9 = (id)[a1[4] scanFSM];
    [v9 postEvent:@"QueryUpdatesInfoSuccess" withInfo:a1[5]];
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&location, 0);
}

void __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke_316(NSObject *a1, char a2, id obj)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v10 = a1;
  char v9 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  id v5 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v5 oslog];

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[(objc_class *)a1[4].isa scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsScanOperation action_QueryUpdatesInfo:error:]_block_invoke", (uint64_t)v4, v9 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Ready to install: %d; error: %{public}@",
      v11,
      0x26u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)a1[5].isa setIsUpdateReadyForInstallation:v9 & 1];
  [(objc_class *)a1[5].isa setUpdateInstallationError:location];
  id v3 = (id)[(objc_class *)a1[4].isa scanFSM];
  [v3 postEvent:@"QueryUpdatesInfoSuccess" withInfo:a1[5].isa];

  objc_storeStrong(&location, 0);
}

- (int64_t)action_ObserveConcurrentQueries:(id)a3 error:(id *)a4
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v20 = a4;
  id v11 = [(SUSettingsScanOperation *)v22 scanFSM];
  id v10 = (id)[(SUCoreFSM *)v11 extendedStateQueue];
  dispatch_assert_queue_V2(v10);

  if (location[0])
  {
    group = v22->_scanGroup;
    queue = v22->_concurrentQueue;
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __65__SUSettingsScanOperation_action_ObserveConcurrentQueries_error___block_invoke;
    id v16 = &unk_26483BAB8;
    id v17 = v22;
    id v18 = location[0];
    dispatch_group_notify(group, queue, &v12);
    int64_t v23 = 0;
    int v19 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    uint64_t v8 = [(SUSettingsScanOperation *)v22 scanFSM];
    id v7 = (id)[(SUCoreFSM *)v8 diag];
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v23 = 8102;
    int v19 = 1;
  }
  objc_storeStrong(location, 0);
  return v23;
}

uint64_t __65__SUSettingsScanOperation_action_ObserveConcurrentQueries_error___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  id v6 = (id)[a1[4] log];
  location[0] = (id)[v6 oslog];

  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)[a1[4] scanUUID];
    id v4 = (id)[a1[5] operationError];
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v9, (uint64_t)"-[SUSettingsScanOperation action_ObserveConcurrentQueries:error:]_block_invoke", (uint64_t)v5, (uint64_t)v4);
    _os_log_impl(&dword_228401000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: All of the concurrent operations has been finished. Current operation error: %{public}@", v9, 0x20u);
  }
  objc_storeStrong(location, 0);
  id v1 = (id)[a1[5] operationError];
  BOOL v3 = v1 == 0;

  if (v3) {
    return [*((id *)a1[4] + 10) postEvent:@"AllConcurrentActionsFinished" withInfo:a1[5]];
  }
  else {
    return [*((id *)a1[4] + 10) postEvent:@"ConcurrentActionFailed" withInfo:a1[5]];
  }
}

- (int64_t)action_ReportScanOutcome:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = a4;
  id v22 = [(SUSettingsScanOperation *)v43 scanFSM];
  BOOL v21 = (id)[(SUCoreFSM *)v22 extendedStateQueue];
  dispatch_assert_queue_V2(v21);

  if (location[0])
  {
    id v17 = [(SUSettingsScanOperation *)v43 log];
    id v39 = (id)[(SUCoreLog *)v17 oslog];

    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      log = v39;
      os_log_type_t type = v38;
      id v16 = [(SUSettingsScanOperation *)v43 scanUUID];
      id v15 = (id)[location[0] operationError];
      id v4 = "successful";
      if (v15) {
        id v4 = "failed";
      }
      uint64_t v11 = (uint64_t)v4;
      int v14 = SUSettingsScanOperationTypeToString([(SUSettingsScanOperation *)v43 operationType]);
      id v37 = v14;
      __os_log_helper_16_2_4_8_32_8_66_8_32_8_66((uint64_t)v45, (uint64_t)"-[SUSettingsScanOperation action_ReportScanOutcome:error:]", (uint64_t)v16, v11, (uint64_t)v37);
      _os_log_impl(&dword_228401000, log, type, "%s [%{public}@]: Reporting a %s scan of type: %{public}@", v45, 0x2Au);

      objc_storeStrong((id *)&v37, 0);
    }
    objc_storeStrong(&v39, 0);
    uint64_t v10 = [(SUSettingsScanOperation *)v43 operationType];
    if (v10)
    {
      if (v10 == 1)
      {
        queue = [(SUSettingsScanOperation *)v43 clientCompletionQueue];
        uint64_t v30 = MEMORY[0x263EF8330];
        int v31 = -1073741824;
        int v32 = 0;
        int v33 = __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke;
        char v34 = &unk_26483BAB8;
        id v35 = location[0];
        char v36 = v43;
        dispatch_async(queue, &v30);

        objc_storeStrong((id *)&v36, 0);
        objc_storeStrong(&v35, 0);
      }
      else if (v10 == 2)
      {
        id v6 = [(SUSettingsScanOperation *)v43 clientCompletionQueue];
        uint64_t v23 = MEMORY[0x263EF8330];
        int v24 = -1073741824;
        int v25 = 0;
        char v26 = __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke_2;
        id v27 = &unk_26483BAB8;
        id v28 = location[0];
        id v29 = v43;
        dispatch_async(v6, &v23);

        objc_storeStrong((id *)&v29, 0);
        objc_storeStrong(&v28, 0);
      }
    }
    else
    {
      char v9 = [(SUSettingsScanOperation *)v43 scanFSM];
      id v8 = (id)[(SUCoreFSM *)v9 diag];
      [v8 dumpTracked:@"Could not invoke a completion handler for a 'None' operation type." dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

      [(SUSettingsScanOperation *)v43 invalidateMachine];
    }
    int64_t v44 = 0;
    int v40 = 1;
  }
  else
  {
    int v19 = [(SUSettingsScanOperation *)v43 scanFSM];
    id v18 = (id)[(SUCoreFSM *)v19 diag];
    objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v44 = 8102;
    int v40 = 1;
  }
  objc_storeStrong(location, 0);
  return v44;
}

void __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke(id *a1)
{
  v13[2] = a1;
  v13[1] = a1;
  id v8 = (id)[a1[4] operationError];
  char v11 = 0;
  char v9 = 0;
  if (v8)
  {
    id v1 = 0;
  }
  else
  {
    id v6 = [SUSettingsFullScanResults alloc];
    id v5 = a1[4];
    id v12 = (id)[a1[5] scanUUID];
    char v11 = 1;
    id v10 = -[SUSettingsFullScanResults initFromScanParam:withUUID:](v6, "initFromScanParam:withUUID:", v5);
    char v9 = 1;
    id v1 = v10;
  }
  v13[0] = v1;
  if (v9) {

  }
  if (v11) {
  id v4 = (void (**)(id, id))(id)[a1[5] fullScanCompletionHandler];
  }
  id v2 = v13[0];
  id v3 = (id)[a1[4] operationError];
  v4[2](v4, v2);

  [a1[5] invalidateMachine];
  objc_storeStrong(v13, 0);
}

void __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke_2(id *a1)
{
  v13[2] = a1;
  v13[1] = a1;
  id v8 = (id)[a1[4] operationError];
  char v11 = 0;
  char v9 = 0;
  if (v8)
  {
    id v1 = 0;
  }
  else
  {
    id v6 = [SUSettingsScanResults alloc];
    id v5 = a1[4];
    id v12 = (id)[a1[5] scanUUID];
    char v11 = 1;
    id v10 = -[SUSettingsScanResults initFromScanParam:withUUID:](v6, "initFromScanParam:withUUID:", v5);
    char v9 = 1;
    id v1 = v10;
  }
  v13[0] = v1;
  if (v9) {

  }
  if (v11) {
  id v4 = (void (**)(id, id))(id)[a1[5] refreshScanCompletionHandler];
  }
  id v2 = v13[0];
  id v3 = (id)[a1[4] operationError];
  v4[2](v4, v2);

  [a1[5] invalidateMachine];
  objc_storeStrong(v13, 0);
}

- (int64_t)action_ReportScanCanceled:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v24 = a4;
  int v14 = [(SUSettingsScanOperation *)v26 scanFSM];
  int v13 = (id)[(SUCoreFSM *)v14 extendedStateQueue];
  dispatch_assert_queue_V2(v13);

  if (location[0])
  {
    char v9 = [(SUSettingsScanOperation *)v26 log];
    id v22 = (id)[(SUCoreLog *)v9 oslog];

    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUSettingsScanOperation *)v26 scanUUID];
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v28, (uint64_t)"-[SUSettingsScanOperation action_ReportScanCanceled:error:]", (uint64_t)v8);
      _os_log_impl(&dword_228401000, (os_log_t)v22, v21, "%s [%{public}@]: The scan was canceled. Calling the cancelation handler.", v28, 0x16u);
    }
    objc_storeStrong(&v22, 0);
    id v4 = [(SUSettingsScanOperation *)v26 cancelHandler];
    BOOL v7 = v4 == 0;

    if (v7)
    {
      [(SUSettingsScanOperation *)v26 invalidateMachine];
    }
    else
    {
      queue = [(SUSettingsScanOperation *)v26 clientCompletionQueue];
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      id v18 = __59__SUSettingsScanOperation_action_ReportScanCanceled_error___block_invoke;
      int v19 = &unk_26483BA90;
      int v20 = v26;
      dispatch_async(queue, &v15);

      objc_storeStrong((id *)&v20, 0);
    }
    int64_t v27 = 0;
    int v23 = 1;
  }
  else
  {
    char v11 = [(SUSettingsScanOperation *)v26 scanFSM];
    id v10 = (id)[(SUCoreFSM *)v11 diag];
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsScanOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v27 = 8102;
    int v23 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

uint64_t __59__SUSettingsScanOperation_action_ReportScanCanceled_error___block_invoke(uint64_t a1)
{
  id v2 = (void (**)(void))(id)[*(id *)(a1 + 32) cancelHandler];
  v2[2]();

  return [*(id *)(a1 + 32) invalidateMachine];
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  id v4 = [NSString alloc];
  v16[0] = (id)[v4 initWithFormat:location[0]];
  char v11 = [(SUSettingsScanOperation *)v18 scanFSM];
  id v10 = (id)[(SUCoreFSM *)v11 diag];
  id v5 = [NSString alloc];
  id v9 = (id)[v5 initWithFormat:@"unknown action(%@)", location[0]];
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  id v12 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v15 = (id)[v12 buildError:8116 underlying:0 description:v16[0]];

  int v14 = [(SUSettingsScanOperation *)v18 scanFSM];
  id v13 = (id)[(SUCoreFSM *)v14 diag];
  uint64_t v6 = [v15 code];
  [v13 trackAnomaly:@"[SUSettingsScanOperation]" forReason:@"Scan FSM has reported an anomaly" withResult:v6 withError:v15];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsScanOperation)initWithUUID:(id)a3 usingSUManagerClient:(id)a4 andBetaManager:(id)a5 withCompletionQueue:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  id v6 = v39;
  id v39 = 0;
  v34.receiver = v6;
  v34.super_class = (Class)SUSettingsScanOperation;
  char v26 = [(SUSettingsScanOperation *)&v34 init];
  id v39 = v26;
  objc_storeStrong(&v39, v26);
  if (!v26) {
    goto LABEL_12;
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettingsScanOperation"];
  id v8 = (void *)*((void *)v39 + 3);
  *((void *)v39 + 3) = v7;

  if (!*((void *)v39 + 3))
  {
    id v22 = SUSettingsSharedLogger();
    id v33 = (id)[v22 oslog];

    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v44, (uint64_t)"-[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:]", @"SUSettingsScanOperation");
      _os_log_impl(&dword_228401000, (os_log_t)v33, v32, "%s: Could not create a log category for %@", v44, 0x16u);
    }
    objc_storeStrong(&v33, 0);
    int v40 = 0;
    int v31 = 1;
    goto LABEL_13;
  }
  id v42 = (id)MGCopyAnswer();
  id v30 = v42;
  id v41 = (id)MGCopyAnswer();
  id v29 = v41;
  id v19 = [NSString alloc];
  id v9 = (objc_class *)objc_opt_class();
  int v20 = NSStringFromClass(v9);
  id v28 = (id)[v19 initWithFormat:@"%@:%@(%@,%@)", v20, v30, v29, location[0]];

  objc_storeStrong((id *)v39 + 2, location[0]);
  objc_storeStrong((id *)v39 + 11, v37);
  objc_storeStrong((id *)v39 + 12, v36);
  id v10 = (id)[(id)objc_opt_class() _generateStateTable];
  char v11 = (void *)*((void *)v39 + 13);
  *((void *)v39 + 13) = v10;

  *((void *)v39 + 9) = 0;
  id v21 = objc_alloc(MEMORY[0x263F77DD8]);
  uint64_t v12 = [v21 initMachine:v28 withTable:*((void *)v39 + 13) startingIn:@"Idle" usingDelegate:v39 registeringAllInfoClass:objc_opt_class()];
  id v13 = (void *)*((void *)v39 + 10);
  *((void *)v39 + 10) = v12;

  if (*((void *)v39 + 10))
  {
    id v17 = (id)[MEMORY[0x263F77D78] sharedCore];
    id v14 = (id)[v17 selectCompletionQueue:v35];
    id v15 = (void *)*((void *)v39 + 14);
    *((void *)v39 + 14) = v14;

    int v31 = 0;
  }
  else
  {
    id v18 = SUSettingsSharedLogger();
    id v27 = (id)[v18 oslog];

    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v43, (uint64_t)"-[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:]");
      _os_log_impl(&dword_228401000, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "%s: Failed creating a scan FSM", v43, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    int v40 = 0;
    int v31 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  if (!v31)
  {
LABEL_12:
    int v40 = (SUSettingsScanOperation *)v39;
    int v31 = 1;
  }
LABEL_13:
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v39, 0);
  return v40;
}

- (void)checkForAvailableUpdatesWithCompletionHandler:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSettingsScanOperation checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:](v4, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:", 0, location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSettingsScanOperation checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:](v7, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:", location[0], v5, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4 usingThirdPartyScanResults:(id)a5 andScanError:(id)a6
{
  os_log_type_t v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = 0;
  objc_storeStrong(&v28, a6);
  int v23 = v32;
  objc_sync_enter(v23);
  if ([(SUSettingsScanOperation *)v32 isActive])
  {
    id v19 = [(SUSettingsScanOperation *)v32 scanFSM];
    id v18 = (id)[(SUCoreFSM *)v19 diag];
    [v18 trackAnomaly:@"[SUSettingsScanOperation]" forReason:@"This scan machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];

    int v27 = 1;
  }
  else
  {
    uint64_t v6 = MEMORY[0x22A697370](v30);
    id fullScanCompletionHandler = v32->_fullScanCompletionHandler;
    v32->_id fullScanCompletionHandler = (id)v6;

    v32->_operationType = 1;
    dispatch_group_t v8 = dispatch_group_create();
    scanGroup = v32->_scanGroup;
    v32->_scanGroup = (OS_dispatch_group *)v8;

    id v17 = NSString;
    id v16 = [(SUSettingsScanOperation *)v32 baseDomain];
    id v14 = (id)[v17 stringWithFormat:@"%@.concurrentQueue", v16];
    label = (char *)[v14 UTF8String];
    dispatch_queue_t v10 = dispatch_queue_create(label, MEMORY[0x263EF83A8]);
    concurrentQueue = v32->_concurrentQueue;
    v32->_concurrentQueue = (OS_dispatch_queue *)v10;

    [(SUCoreFSM *)v32->_scanFSM activateMachine];
    id v13 = [SUSettingsScanParam alloc];
    char v24 = 0;
    if (location[0])
    {
      uint64_t v12 = (SUSettingsScanOptions *)location[0];
    }
    else
    {
      int v25 = objc_alloc_init(SUSettingsScanOptions);
      char v24 = 1;
      uint64_t v12 = v25;
    }
    id v26 = [(SUSettingsScanParam *)v13 initWithScanOptions:v12];
    if (v24) {

    }
    [v26 setThirdPartyDiscoveredScanResults:v29];
    [v26 setThirdPartyDiscoveredScanError:v28];
    [(SUCoreFSM *)v32->_scanFSM postEvent:@"CheckForAvailableUpdate" withInfo:v26];
    objc_storeStrong(&v26, 0);
    int v27 = 0;
  }
  objc_sync_exit(v23);

  if (!v27) {
    int v27 = 0;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = 0;
  objc_storeStrong(&v12, a6);
  dispatch_queue_t v10 = v16;
  uint64_t v6 = [SUSettingsScanParam alloc];
  char v11 = [(SUSettingsScanParam *)v6 initWithPreferredDescriptor:location[0] andAlternateDescriptor:v14];
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v10, "startRefreshOperation:withEventInfo:completionHandler:", @"RefreshScanResults");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 encounteredError:(id)a7 completionHandler:(id)a8
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v17 = 0;
  objc_storeStrong(&v17, a7);
  id v16 = 0;
  objc_storeStrong(&v16, a8);
  id v14 = v22;
  dispatch_group_t v8 = [SUSettingsScanParam alloc];
  id v15 = [(SUSettingsScanParam *)v8 initWithPreferredDescriptor:location[0] andAlternateDescriptor:v20 previouslyDiscoveredDownloadedUpdate:v18 encounteredError:v17];
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v14, "startRefreshOperation:withEventInfo:completionHandler:", @"RefreshScanResults");

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 previouslyDiscoveredAutoInstallOperation:(id)a7 encounteredError:(id)a8 completionHandler:(id)a9
{
  char v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  id v18 = 0;
  objc_storeStrong(&v18, a8);
  id v17 = 0;
  objc_storeStrong(&v17, a9);
  id v15 = v24;
  id v9 = [SUSettingsScanParam alloc];
  id v16 = [(SUSettingsScanParam *)v9 initWithPreferredDescriptor:location[0] andAlternateDescriptor:v22 previouslyDiscoveredDownloadedUpdate:v20 previouslyDiscoveredAutoInstallOperation:v19 encounteredError:v18];
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v15, "startRefreshOperation:withEventInfo:completionHandler:", @"RefreshScanResultsPostDownload");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshBetaProgramsWithOptions:(id)a3 completionHandler:(id)a4
{
  int v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  dispatch_queue_t v10 = v25;
  objc_sync_enter(v10);
  if ([(SUSettingsScanOperation *)v25 isActive])
  {
    id v8 = (id)[(SUCoreFSM *)v25->_scanFSM diag];
    [v8 trackAnomaly:@"[SUSettingsScanOperation]" forReason:@"The scan machine is currently active" withResult:8102 withError:0];

    int v22 = 1;
  }
  else
  {
    uint64_t v7 = [SUSettingsScanParam alloc];
    char v19 = 0;
    if (location[0])
    {
      uint64_t v6 = (SUSettingsScanOptions *)location[0];
    }
    else
    {
      id v20 = objc_alloc_init(SUSettingsScanOptions);
      char v19 = 1;
      uint64_t v6 = v20;
    }
    id v21 = [(SUSettingsScanParam *)v7 initWithScanOptions:v6];
    if (v19) {

    }
    id v5 = v25;
    id v4 = v21;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke;
    id v15 = &unk_26483BCC0;
    id v16 = v25;
    id v18 = v23;
    id v17 = v21;
    [(SUSettingsScanOperation *)v5 checkForBetaPrograms:v4 withReplyHandler:&v11];
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v21, 0);
    int v22 = 0;
  }
  objc_sync_exit(v10);

  if (!v22) {
    int v22 = 0;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke(id *a1, char a2, id obj)
{
  id v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v13[1] = a1;
  queue = (id)[a1[4] clientCompletionQueue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke_2;
  id v9 = &unk_2648413D8;
  v13[0] = a1[6];
  id v10 = a1[5];
  id v11 = a1[4];
  id v12 = location;
  dispatch_async(queue, &v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&location, 0);
}

void __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 56);
  id v2 = [SUSettingsBetaUpdatesScanResults alloc];
  uint64_t v1 = *(void *)(a1 + 32);
  id v6 = (id)[*(id *)(a1 + 40) scanUUID];
  id v5 = -[SUSettingsBetaUpdatesScanResults initFromScanParam:withUUID:](v2, "initFromScanParam:withUUID:", v1);
  (*(void (**)(void))(v4 + 16))();
}

- (void)cancel:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = v8;
  objc_sync_enter(obj);
  if ([(SUSettingsScanOperation *)v8 isActive])
  {
    if (![(SUSettingsScanOperation *)v8 isCanceled])
    {
      [(SUSettingsScanOperation *)v8 setCanceled:1];
      [(SUSettingsScanOperation *)v8 setCancelHandler:location[0]];
      scanFSM = v8->_scanFSM;
      uint64_t v4 = objc_alloc_init(SUSettingsScanParam);
      [(SUCoreFSM *)scanFSM postEvent:@"CancelScan" withInfo:v4];
    }
  }
  else
  {
    id v5 = (id)[(SUCoreFSM *)v8->_scanFSM diag];
    [v5 trackAnomaly:@"[SUSettingsScanOperation]" forReason:@"There is no active search to cancel" withResult:8102 withError:0];
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (BOOL)isActive
{
  return [(SUSettingsScanOperation *)self operationType] != 0;
}

+ (unint64_t)installationIgnorableConstraints
{
  return 3072;
}

- (void)scheduleConcurrentActionWithSelector:(SEL)a3 eventInfo:(id)a4
{
  char v15 = (dispatch_group_t *)self;
  SEL v14 = a2;
  SEL v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  dispatch_group_enter(v15[7]);
  queue = v15[8];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke;
  id v9 = &unk_26483C030;
  id v10 = v15;
  v11[0] = location;
  v11[1] = (id)v13;
  dispatch_async(queue, &v5);
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21[2] = (id)a1;
  v21[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  id v1 = (id)[*(id *)(a1 + 40) operationError];
  BOOL v8 = v1 == 0;

  if (v8)
  {
    v21[0] = (id)[*(id *)(a1 + 32) methodSignatureForSelector:*(void *)(a1 + 48)];
    id v20 = (id)[MEMORY[0x263EFF958] invocationWithMethodSignature:v21[0]];
    [v20 setTarget:*(void *)(a1 + 32)];
    [v20 setSelector:*(void *)(a1 + 48)];
    [v20 setArgument:a1 + 40 atIndex:2];
    id v6 = (id)[*(id *)(a1 + 32) log];
    id v19 = (id)[v6 oslog];

    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      os_log_type_t type = v18;
      id v5 = (id)[*(id *)(a1 + 32) scanUUID];
      uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v17 = v4;
      __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:]_block_invoke", (uint64_t)v5, (uint64_t)v17);
      _os_log_impl(&dword_228401000, log, type, "%s [%{public}@]: Starting to execute concurrent action: %{public}@", v22, 0x20u);

      objc_storeStrong((id *)&v17, 0);
    }
    objc_storeStrong(&v19, 0);
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_362;
    SEL v13 = &unk_264841400;
    id v14 = *(id *)(a1 + 32);
    v15[1] = *(id *)(a1 + 48);
    v15[0] = *(id *)(a1 + 40);
    uint64_t v16 = MEMORY[0x22A697370](&v9);
    objc_msgSend(v20, "setArgument:atIndex:");
    [v20 invoke];
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(v21, 0);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
  }
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_362(id *a1, char a2, id obj)
{
  id v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v14 = a1;
  queue = *((void *)a1[4] + 8);
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_2;
  uint64_t v9 = &unk_26483EA50;
  id v10 = a1[4];
  v12[1] = a1[6];
  char v13 = v16 & 1;
  id v11 = location;
  v12[0] = a1[5];
  dispatch_barrier_async(queue, &v5);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19[2] = (id)a1;
  v19[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  id v13 = (id)[*(id *)(a1 + 32) log];
  v19[0] = (id)[v13 oslog];

  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v19[0];
    os_log_type_t type = v18;
    id v12 = (id)[*(id *)(a1 + 32) scanUUID];
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = v11;
    id v17 = v5;
    id v1 = "YES";
    if ((*(unsigned char *)(a1 + 64) & 1) == 0) {
      id v1 = "NO";
    }
    uint64_t v6 = (uint64_t)v1;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = (id)[*(id *)(a1 + 48) operationError];
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_32_8_66_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:]_block_invoke_2", (uint64_t)v12, (uint64_t)v5, v6, v7, (uint64_t)v10);
    _os_log_impl(&dword_228401000, log, type, "%s [%{public}@]: Concurrent operation \"%{public}@\" has been finished. Success: %s; error: %{public}@. Previous e"
      "rror: %{public}@",
      v20,
      0x3Eu);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(v19, 0);
  id v2 = (id)[*(id *)(a1 + 48) operationError];
  BOOL v4 = v2 == 0;

  if (!v4 || (*(unsigned char *)(a1 + 64) & 1) != 0)
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    char v15 = 0;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "setOperationError:", v3, v3);
    }
    else
    {
      id v16 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:5 userInfo:0];
      char v15 = 1;
      objc_msgSend(*(id *)(a1 + 48), "setOperationError:", v16, v16);
    }
    if (v15) {

    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
    [*(id *)(*(void *)(a1 + 32) + 80) postEvent:@"ConcurrentActionFailed" withInfo:*(void *)(a1 + 48)];
  }
}

- (void)checkForMDMRestrictions:(id)a3 withReplyHandler:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke;
  id v10 = &unk_264841450;
  id v11 = v16;
  id v13 = v14;
  id v12 = location[0];
  -[SUManagerClient softwareUpdatePathRestriction:](suClient, "softwareUpdatePathRestriction:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke(id *a1, void *a2, id obj)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v24 = a1;
  uint64_t v23 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  v21[1] = a1;
  id v8 = (id)[a1[4] log];
  v21[0] = (id)[v8 oslog];

  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v21[0];
    os_log_type_t type = v20;
    id v7 = (id)[a1[4] scanUUID];
    id v6 = (id)SUStringFromMDMSUPath();
    id v19 = v6;
    __os_log_helper_16_2_5_8_32_8_66_8_64_8_0_8_66((uint64_t)v25, (uint64_t)"-[SUSettingsScanOperation checkForMDMRestrictions:withReplyHandler:]_block_invoke", (uint64_t)v7, (uint64_t)v19, (uint64_t)v23, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s [%{public}@]: Found path restriction: %@ (%ld); error: %{public}@",
      v25,
      0x34u);

    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(v21, 0);
  if (location)
  {
    (*((void (**)(void))a1[6] + 2))();
    int v18 = 1;
  }
  else
  {
    uint64_t v3 = (void *)*((void *)a1[4] + 11);
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke_364;
    id v14 = &unk_264841428;
    id v15 = a1[4];
    v17[0] = a1[6];
    id v16 = a1[5];
    v17[1] = v23;
    [v3 isDelayingUpdates:&v10];
    objc_storeStrong(&v16, 0);
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v15, 0);
    int v18 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke_364(NSObject *a1, char a2, id obj)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  id v4 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v4 oslog];

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)[(objc_class *)a1[4].isa scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v10, (uint64_t)"-[SUSettingsScanOperation checkForMDMRestrictions:withReplyHandler:]_block_invoke", (uint64_t)v3, v8 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Is delaying updates: %d; error: %{public}@",
      v10,
      0x26u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (!location)
  {
    [(objc_class *)a1[5].isa setMdmPathRestrictions:a1[7].isa];
    [(objc_class *)a1[5].isa setIsDelayingUpdate:v8 & 1];
  }
  (*((void (**)(void))a1[6].isa + 2))();
  objc_storeStrong(&location, 0);
}

- (void)queryDDMDeclaration:(id)a3 withReplyHandler:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  suClient = v15->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __64__SUSettingsScanOperation_queryDDMDeclaration_withReplyHandler___block_invoke;
  uint64_t v10 = &unk_264840510;
  id v12 = v13;
  id v11 = location[0];
  -[SUManagerClient getDDMDeclarationWithHandler:](suClient, "getDDMDeclarationWithHandler:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsScanOperation_queryDDMDeclaration_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  char v7 = 0;
  BOOL v6 = 0;
  if (v9)
  {
    id v8 = (id)[v9 domain];
    char v7 = 1;
    BOOL v3 = 0;
    if ([v8 isEqualToString:*MEMORY[0x263F78360]]) {
      BOOL v3 = [v9 code] == 102;
    }
    BOOL v6 = !v3;
  }
  if (v7) {

  }
  if (!v6) {
    [*(id *)(a1 + 32) setDDMDeclaration:location[0]];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)checkForBetaPrograms:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_log_type_t v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  if (_os_feature_enabled_impl())
  {
    if (v32->_seedingBetaManager)
    {
      id v8 = (id)[location[0] options];
      char v9 = [v8 clientIsBuddy];

      if (v9)
      {
        char v7 = [(SUSettingsScanOperation *)v32 log];
        id v24 = (id)[(SUCoreLog *)v7 oslog];

        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v6 = [(SUSettingsScanOperation *)v32 scanUUID];
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v33, (uint64_t)"-[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:]", (uint64_t)v6);
          _os_log_impl(&dword_228401000, (os_log_t)v24, v23, "%s [%{public}@]: The client is Buddy - skipping on the Seeding feature.", v33, 0x16u);
        }
        objc_storeStrong(&v24, 0);
        (*((void (**)(id, uint64_t, void))v30 + 2))(v30, 1, 0);
        int v27 = 1;
      }
      else
      {
        id v5 = (id)[location[0] currentSeedingDevice];

        if (v5)
        {
          [(SUSettingsScanOperation *)v32 scanForDeviceEligibleBetaPrograms:location[0] withReplyHandler:v30];
        }
        else
        {
          id v4 = (void *)MEMORY[0x263F67CF8];
          uint64_t v15 = MEMORY[0x263EF8330];
          int v16 = -1073741824;
          int v17 = 0;
          int v18 = __65__SUSettingsScanOperation_checkForBetaPrograms_withReplyHandler___block_invoke;
          id v19 = &unk_264841478;
          id v20 = location[0];
          uint64_t v21 = v32;
          id v22 = v30;
          [v4 getCurrentDevice:&v15];
          objc_storeStrong(&v22, 0);
          objc_storeStrong((id *)&v21, 0);
          objc_storeStrong(&v20, 0);
        }
        int v27 = 0;
      }
    }
    else
    {
      id v11 = [(SUSettingsScanOperation *)v32 log];
      id v26 = (id)[(SUCoreLog *)v11 oslog];

      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(SUSettingsScanOperation *)v32 scanUUID];
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v34, (uint64_t)"-[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:]", (uint64_t)v10);
        _os_log_impl(&dword_228401000, (os_log_t)v26, v25, "%s [%{public}@]: The seeding beta manager was not configured for this scan operation. Skipping.", v34, 0x16u);
      }
      objc_storeStrong(&v26, 0);
      (*((void (**)(id, uint64_t, void))v30 + 2))(v30, 1, 0);
      int v27 = 1;
    }
  }
  else
  {
    id v13 = [(SUSettingsScanOperation *)v32 log];
    id v29 = (id)[(SUCoreLog *)v13 oslog];

    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(SUSettingsScanOperation *)v32 scanUUID];
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v35, (uint64_t)"-[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:]", (uint64_t)v12);
      _os_log_impl(&dword_228401000, (os_log_t)v29, v28, "%s [%{public}@]: The Seeding feature is unavailable.", v35, 0x16u);
    }
    objc_storeStrong(&v29, 0);
    (*((void (**)(id, uint64_t, void))v30 + 2))(v30, 1, 0);
    int v27 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSettingsScanOperation_checkForBetaPrograms_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) setCurrentSeedingDevice:location[0]];
  [*(id *)(a1 + 40) scanForDeviceEligibleBetaPrograms:*(void *)(a1 + 32) withReplyHandler:*(void *)(a1 + 48)];
  objc_storeStrong(location, 0);
}

- (void)scanForDeviceEligibleBetaPrograms:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_log_type_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v4 = (id)[location[0] currentSeedingDevice];
  BOOL v11 = v4 != 0;

  if (v11)
  {
    seedingBetaManager = v25->_seedingBetaManager;
    id v7 = (id)[location[0] currentSeedingDevice];
    uint64_t v5 = [v7 platform];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    uint64_t v15 = __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke;
    int v16 = &unk_2648414C8;
    id v17 = location[0];
    int v18 = v25;
    id v19 = v23;
    [(SDBetaManager *)seedingBetaManager queryProgramsForSystemAccountsWithPlatforms:v5 completion:&v12];

    objc_storeStrong(&v19, 0);
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v17, 0);
    int v20 = 0;
  }
  else
  {
    char v9 = [(SUSettingsScanOperation *)v25 log];
    id v22 = (id)[(SUCoreLog *)v9 oslog];

    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUSettingsScanOperation *)v25 scanUUID];
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v26, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]", (uint64_t)v8);
      _os_log_impl(&dword_228401000, (os_log_t)v22, v21, "%s [%{public}@]: Tried to scan for beta programs without a seeding device.", v26, 0x16u);
    }
    objc_storeStrong(&v22, 0);
    (*((void (**)(id, void, void))v23 + 2))(v23, 0, 0);
    int v20 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v29 = a3;
  v28[1] = a1;
  if (a3)
  {
    [a1[4] setBetaPrograms:MEMORY[0x263EFFA68]];
    id v12 = (id)[a1[5] log];
    v28[0] = (id)[v12 oslog];

    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28[0], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (id)[a1[5] scanUUID];
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v32, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v11, v29);
      _os_log_impl(&dword_228401000, (os_log_t)v28[0], v27, "%s [%{public}@]: Could not fetch new beta programs: %ld", v32, 0x20u);
    }
    objc_storeStrong(v28, 0);
    (*((void (**)(void))a1[6] + 2))();
    int v26 = 1;
  }
  else
  {
    [a1[4] setBetaPrograms:location[0]];
    id v10 = (id)[a1[5] log];
    id v25 = (id)[v10 oslog];

    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = v25;
      os_log_type_t v7 = v24;
      id v9 = (id)[a1[5] scanUUID];
      uint64_t v5 = [location[0] count];
      id v8 = (id)[location[0] valueForKey:@"programID"];
      id v23 = v8;
      __os_log_helper_16_2_4_8_32_8_66_8_0_8_64((uint64_t)v31, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v9, v5, (uint64_t)v23);
      _os_log_impl(&dword_228401000, v6, v7, "%s [%{public}@]: Got the device available Beta Programs (count: %ld): %@", v31, 0x2Au);

      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v25, 0);
    BOOL v3 = (void *)*((void *)a1[5] + 12);
    id v4 = (id)[a1[4] currentSeedingDevice];
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    int v18 = __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke_374;
    id v19 = &unk_2648414A0;
    id v20 = a1[4];
    id v21 = a1[5];
    id v22 = a1[6];
    [v3 enrolledBetaProgramForDevice:v4 completion:&v15];

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    int v26 = 0;
  }
  objc_storeStrong(location, 0);
}

void __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke_374(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  [*(id *)(a1 + 32) setEnrolledBetaProgram:location[0]];
  id v5 = (id)[*(id *)(a1 + 40) log];
  v9[0] = (id)[v5 oslog];

  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)[*(id *)(a1 + 40) scanUUID];
    id v4 = location[0];
    char v7 = 0;
    if (location[0])
    {
      id v8 = (__CFString *)(id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(location[0], "programID"));
      char v7 = 1;
      id v2 = v8;
    }
    else
    {
      id v2 = @"(null)";
    }
    __os_log_helper_16_2_4_8_32_8_66_8_64_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v3, (uint64_t)v4, (uint64_t)v2);
    _os_log_impl(&dword_228401000, (os_log_t)v9[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Refreshed current beta program: %@ (program ID: %{public}@", v11, 0x2Au);
    if (v7) {
  }
    }
  objc_storeStrong(v9, 0);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong(location, 0);
}

- (void)queryRollbackStatus:(id)a3 withReplyHandler:(id)a4
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke;
  id v10 = &unk_2648414F0;
  id v11 = v16;
  id v13 = v14;
  id v12 = location[0];
  -[SUManagerClient isRollingBack:](suClient, "isRollingBack:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke(id *a1, char a2, id obj, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_log_type_t v24 = a1;
  char v23 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  v20[1] = a1;
  id v6 = (id)[a1[4] log];
  v20[0] = (id)[v6 oslog];

  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_5_8_32_8_66_4_0_8_66_8_64((uint64_t)v25, (uint64_t)"-[SUSettingsScanOperation queryRollbackStatus:withReplyHandler:]_block_invoke", (uint64_t)v5, v23 & 1, (uint64_t)location, (uint64_t)v21);
    _os_log_impl(&dword_228401000, (os_log_t)v20[0], v19, "%s [%{public}@]: Is rolling back? %d; error: %{public}@; rollback descriptor: %@",
      v25,
      0x30u);
  }
  objc_storeStrong(v20, 0);
  if (v21)
  {
    (*((void (**)(void))a1[6] + 2))();
    int v18 = 1;
  }
  else
  {
    [a1[5] setIsRollingBack:v23 & 1];
    queue = *((void *)a1[4] + 8);
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke_381;
    id v13 = &unk_264840420;
    id v14 = location;
    id v15 = a1[4];
    id v16 = a1[5];
    id v17 = a1[6];
    dispatch_barrier_async(queue, &v9);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    int v18 = 0;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke_381(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    id v5 = (id)[*(id *)(a1 + 40) log];
    location[0] = (id)[v5 oslog];

    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      id v4 = (id)[*(id *)(a1 + 48) rollbackDescriptor];
      id v3 = (id)[*(id *)(a1 + 48) rollbackDescriptor];
      __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0((uint64_t)v8, (uint64_t)"-[SUSettingsScanOperation queryRollbackStatus:withReplyHandler:]_block_invoke", v2, v2, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_228401000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Assigning roolback descriptor %@ (%p) instead of %@ (%p)", v8, 0x34u);
    }
    objc_storeStrong(location, 0);
    [*(id *)(a1 + 48) setRollbackDescriptor:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)checkIsEligibleForRollback:(id)a3 withReplyHandler:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke;
  int v10 = &unk_264841518;
  int v11 = v16;
  id v13 = v14;
  id v12 = location[0];
  -[SUManagerClient eligibleRollbackWithOptions:withResult:](suClient, "eligibleRollbackWithOptions:withResult:", 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v20 = 0;
  objc_storeStrong(&v20, a3);
  v19[1] = a1;
  id v5 = (id)[a1[4] log];
  v19[0] = (id)[v5 oslog];

  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_64((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation checkIsEligibleForRollback:withReplyHandler:]_block_invoke", (uint64_t)v4, (uint64_t)v20, (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, (os_log_t)v19[0], v18, "%s [%{public}@]: error: %{public}@; eligible rollback descriptor: %@",
      v22,
      0x2Au);
  }
  objc_storeStrong(v19, 0);
  if (v20)
  {
    (*((void (**)(void))a1[6] + 2))();
    int v17 = 1;
  }
  else
  {
    queue = *((void *)a1[4] + 8);
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    int v11 = __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke_383;
    id v12 = &unk_264840420;
    id v13 = location[0];
    id v14 = a1[4];
    id v15 = a1[5];
    id v16 = a1[6];
    dispatch_barrier_async(queue, &v8);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    int v17 = 0;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

uint64_t __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke_383(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    id v5 = (id)[*(id *)(a1 + 40) log];
    location[0] = (id)[v5 oslog];

    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      id v4 = (id)[*(id *)(a1 + 48) rollbackDescriptor];
      id v3 = (id)[*(id *)(a1 + 48) rollbackDescriptor];
      __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0((uint64_t)v8, (uint64_t)"-[SUSettingsScanOperation checkIsEligibleForRollback:withReplyHandler:]_block_invoke", v2, v2, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_228401000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Assigning roolback descriptor %@ (%p) instead of %@ (%p)", v8, 0x34u);
    }
    objc_storeStrong(location, 0);
    [*(id *)(a1 + 48) setRollbackDescriptor:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)checkIfAutoUpdateScheduled:(id)a3 withReplyHandler:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke;
  int v10 = &unk_26483BCC0;
  int v11 = v16;
  id v13 = v14;
  id v12 = location[0];
  -[SUManagerClient isAutoUpdateScheduled:](suClient, "isAutoUpdateScheduled:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke(id *a1, char a2, id obj)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v21 = a1;
  char v20 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v18[1] = a1;
  id v5 = (id)[a1[4] log];
  v18[0] = (id)[v5 oslog];

  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)[a1[4] scanUUID];
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation checkIfAutoUpdateScheduled:withReplyHandler:]_block_invoke", (uint64_t)v4, v20 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, (os_log_t)v18[0], v17, "%s [%{public}@]: isAutoUpdateScheduled - result: %d, error: %{public}@", v22, 0x26u);
  }
  objc_storeStrong(v18, 0);
  if (location || ([a1[5] setIsAutoUpdateScheduled:v20 & 1], (v20 & 1) == 0))
  {
    (*((void (**)(void))a1[6] + 2))();
    int v16 = 1;
  }
  else
  {
    id v3 = (void *)*((void *)a1[4] + 11);
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke_385;
    int v11 = &unk_264841540;
    id v12 = a1[4];
    char v15 = v20 & 1;
    id v14 = a1[6];
    id v13 = a1[5];
    [v3 currentAutoInstallOperation:0 withResult:&v7];
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v12, 0);
    int v16 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke_385(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  oslog[1] = (os_log_t)a1;
  id v4 = (id)[*(id *)(a1 + 32) log];
  oslog[0] = (os_log_t)(id)[v4 oslog];

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)[*(id *)(a1 + 32) scanUUID];
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_66_4_0((uint64_t)v10, (uint64_t)"-[SUSettingsScanOperation checkIfAutoUpdateScheduled:withReplyHandler:]_block_invoke", (uint64_t)v3, (uint64_t)location[0], (uint64_t)v8, *(unsigned char *)(a1 + 56) & 1);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: currentAutoInstallOperation - result: %{public}@, error: %{public}@; was scheduled: %d",
      v10,
      0x30u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (!v8) {
    [*(id *)(a1 + 40) setCurrentAutoInstallOperation:location[0]];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)startRefreshOperation:(id)a3 withEventInfo:(id)a4 completionHandler:(id)a5
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  os_log_type_t v18 = v22;
  objc_sync_enter(v18);
  if ([(SUSettingsScanOperation *)v22 isActive])
  {
    id v15 = (id)[(SUCoreFSM *)v22->_scanFSM diag];
    [v15 trackAnomaly:@"[SUSettingsScanOperation]" forReason:@"The scan machine is currently active" withResult:8102 withError:0];
  }
  else
  {
    uint64_t v5 = MEMORY[0x22A697370](v19);
    id refreshScanCompletionHandler = v22->_refreshScanCompletionHandler;
    v22->_id refreshScanCompletionHandler = (id)v5;

    v22->_operationType = 2;
    dispatch_group_t v7 = dispatch_group_create();
    scanGroup = v22->_scanGroup;
    v22->_scanGroup = (OS_dispatch_group *)v7;

    id v14 = NSString;
    id v13 = [(SUSettingsScanOperation *)v22 baseDomain];
    id v11 = (id)[v14 stringWithFormat:@"%@.concurrentQueue", v13];
    label = (char *)[v11 UTF8String];
    dispatch_queue_t v9 = dispatch_queue_create(label, MEMORY[0x263EF83A8]);
    concurrentQueue = v22->_concurrentQueue;
    v22->_concurrentQueue = (OS_dispatch_queue *)v9;

    [(SUCoreFSM *)v22->_scanFSM activateMachine];
    [(SUCoreFSM *)v22->_scanFSM postEvent:location[0] withInfo:v20];
  }
  objc_sync_exit(v18);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldConsiderErrorAsSuccessfulCase:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v5 = (id)[location[0] domain];
    char v6 = [v5 isEqualToString:*MEMORY[0x263F78360]];

    if (v6)
    {
      uint64_t v7 = [location[0] code];
      BOOL v4 = 1;
      if (v7 != 3)
      {
        BOOL v4 = 1;
        if (v7 != 55)
        {
          BOOL v4 = 1;
          if (v7 != 13)
          {
            BOOL v4 = 1;
            if (v7 != 11) {
              BOOL v4 = v7 == 14;
            }
          }
        }
      }
      char v9 = v4;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)invalidateMachine
{
}

- (id)baseDomain
{
  id v3 = [NSString alloc];
  id v5 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v4 = (id)[v5 commonDomain];
  char v6 = (void *)[v3 initWithFormat:@"%@.susettings.fsm.scan.%@", v4, self->_scanUUID];

  return v6;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (SUCoreLog)log
{
  return self->_log;
}

- (id)fullScanCompletionHandler
{
  return self->_fullScanCompletionHandler;
}

- (void)setFullScanCompletionHandler:(id)a3
{
}

- (id)refreshScanCompletionHandler
{
  return self->_refreshScanCompletionHandler;
}

- (void)setRefreshScanCompletionHandler:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (OS_dispatch_group)scanGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScanGroup:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConcurrentQueue:(id)a3
{
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
}

- (SDBetaManager)seedingBetaManager
{
  return self->_seedingBetaManager;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (void).cxx_destruct
{
}

@end