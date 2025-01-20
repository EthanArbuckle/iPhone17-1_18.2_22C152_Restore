@interface SUSettingsUpdateOperation
+ (id)_generateStateTable;
- (BOOL)beginOperation:(unint64_t)a3 ofUnattendedInstall:(BOOL)a4 descriptor:(id)a5 options:(id)a6;
- (BOOL)canceled;
- (BOOL)deviceSupportsCellularCapability;
- (BOOL)isActive;
- (BOOL)isCancelableState:(id)a3;
- (NSDictionary)stateTable;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)delegateCallbackQueue;
- (OS_dispatch_queue)requestsQueue;
- (OS_dispatch_queue)workQueue;
- (SUCoreFSM)updateFSM;
- (SUCoreLog)log;
- (SUManagerClient)suClient;
- (SUSettingsUpdateOperation)initWithDescriptor:(id)a3 usingSUManagerClient:(id)a4 delegate:(id)a5;
- (SUSettingsUpdateOperationDelegate)delegate;
- (id)baseDomain;
- (id)cancelHandler;
- (id)downloadAndScheduleCompletion;
- (id)downloadUpdateCompletion;
- (id)installCompletion;
- (id)scheduleCompletion;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_AquireKeybag:(id)a3 error:(id *)a4;
- (int64_t)action_InitiateUpdateDownload:(id)a3 error:(id *)a4;
- (int64_t)action_InitiateUpdateInstallation:(id)a3 error:(id *)a4;
- (int64_t)action_PrepareUpdateProcess:(id)a3 error:(id *)a4;
- (int64_t)action_PresentDownloadConstraints:(id)a3 error:(id *)a4;
- (int64_t)action_PresentTermsConditions:(id)a3 error:(id *)a4;
- (int64_t)action_PurgeSpace:(id)a3 error:(id *)a4;
- (int64_t)action_ReportUpdateOperationOutcome:(id)a3 error:(id *)a4;
- (int64_t)action_ResolveUpdateOperation:(id)a3 error:(id *)a4;
- (int64_t)action_ScheduleUpdate:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)operationType;
- (void)cancel:(id)a3;
- (void)downloadAndInstall:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)downloadAndScheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5;
- (void)downloadUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)installUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)invalidateMachine;
- (void)promoteDownloadToUserInitiated:(id)a3 completionHandler:(id)a4;
- (void)scheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5;
- (void)setCancelHandler:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDelegateCallbackQueue:(id)a3;
- (void)setDownloadAndScheduleCompletion:(id)a3;
- (void)setDownloadUpdateCompletion:(id)a3;
- (void)setInstallCompletion:(id)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setRequestsQueue:(id)a3;
- (void)setScheduleCompletion:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)unscheduleAutomaticInstallation:(id)a3 completionHandler:(id)a4;
@end

@implementation SUSettingsUpdateOperation

+ (id)_generateStateTable
{
  v163[10] = *MEMORY[0x263EF8340];
  v59[2] = a1;
  v59[1] = (id)a2;
  v162[0] = @"Idle";
  v160[0] = @"BeginDownloadUpdate";
  v4 = (void *)MEMORY[0x263F77E28];
  uint64_t v158 = *MEMORY[0x263F77E28];
  v159 = @"PrepareUpdateProcess";
  id v56 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158);
  v161[0] = v56;
  v160[1] = @"PrepareUpdateProcessSuccess";
  v5 = (void *)MEMORY[0x263F78170];
  v156[0] = *MEMORY[0x263F78170];
  v157[0] = @"PurgingSpace";
  v156[1] = *v4;
  v157[1] = @"PurgeSpace";
  id v55 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v157, v156);
  v161[1] = v55;
  v160[2] = @"PrepareUpdateProcessFailed";
  uint64_t v154 = *v4;
  v155 = @"ReportUpdateOperationOutcome";
  id v54 = (id)[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
  v161[2] = v54;
  v160[3] = @"CancelUpdate";
  v152[0] = *v5;
  v153[0] = @"Idle";
  v152[1] = *v4;
  v153[1] = @"ReportUpdateOperationOutcome";
  id v53 = (id)[NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:2];
  v161[3] = v53;
  id v52 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v161, v160);
  v163[0] = v52;
  v162[1] = @"PurgingSpace";
  v150[0] = @"PurgeSuccess";
  v148[0] = *v5;
  v149[0] = @"AquiringKeybag";
  v148[1] = *v4;
  v149[1] = @"AquireKeybag";
  id v51 = (id)[NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:2];
  v151[0] = v51;
  v150[1] = @"NoPurgableDownloadAvailable";
  v146[0] = *v5;
  v147[0] = @"AquiringKeybag";
  v146[1] = *v4;
  v147[1] = @"AquireKeybag";
  id v50 = (id)[NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];
  v151[1] = v50;
  v150[2] = @"PurgeUserReject";
  v144[0] = *v5;
  v145[0] = @"Idle";
  v144[1] = *v4;
  v145[1] = @"ReportUpdateOperationOutcome";
  id v49 = (id)[NSDictionary dictionaryWithObjects:v145 forKeys:v144 count:2];
  v151[2] = v49;
  v150[3] = @"PurgeFailed";
  v142[0] = *v5;
  v143[0] = @"Idle";
  v142[1] = *v4;
  v143[1] = @"ReportUpdateOperationOutcome";
  id v48 = (id)[NSDictionary dictionaryWithObjects:v143 forKeys:v142 count:2];
  v151[3] = v48;
  v150[4] = @"CancelUpdate";
  v140[0] = *v5;
  v141[0] = @"Idle";
  v140[1] = *v4;
  v141[1] = @"ReportUpdateOperationOutcome";
  id v47 = (id)[NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:2];
  v151[4] = v47;
  id v46 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v151, v150);
  v163[1] = v46;
  v162[2] = @"AquiringKeybag";
  v138[0] = @"KeybagNotRequired";
  v136[0] = *v5;
  v137[0] = @"PresentingTermsConditions";
  v136[1] = *v4;
  v137[1] = @"PresentTermsConditions";
  id v45 = (id)[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:2];
  v139[0] = v45;
  v138[1] = @"KeybagCreated";
  v134[0] = *v5;
  v135[0] = @"PresentingTermsConditions";
  v134[1] = *v4;
  v135[1] = @"PresentTermsConditions";
  id v44 = (id)[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:2];
  v139[1] = v44;
  v138[2] = @"KeybagCreationFailed";
  v132[0] = *v5;
  v133[0] = @"Idle";
  v132[1] = *v4;
  v133[1] = @"ReportUpdateOperationOutcome";
  id v43 = (id)[NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:2];
  v139[2] = v43;
  v138[3] = @"KeybagUserReject";
  v130[0] = *v5;
  v131[0] = @"Idle";
  v130[1] = *v4;
  v131[1] = @"ReportUpdateOperationOutcome";
  id v42 = (id)[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
  v139[3] = v42;
  v138[4] = @"CancelUpdate";
  v128[0] = *v5;
  v129[0] = @"Idle";
  v128[1] = *v4;
  v129[1] = @"ReportUpdateOperationOutcome";
  id v41 = (id)[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:2];
  v139[4] = v41;
  id v40 = (id)[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:5];
  v163[2] = v40;
  v162[3] = @"PresentingTermsConditions";
  v126[0] = @"TermsConditionsAlreadyAgreed";
  v124[0] = *v5;
  v125[0] = @"ResolvingUpdateOperation";
  v124[1] = *v4;
  v125[1] = @"ResolveUpdateOperation";
  id v39 = (id)[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];
  v127[0] = v39;
  v126[1] = @"TermsConditionsNotRequired";
  v122[0] = *v5;
  v123[0] = @"ResolvingUpdateOperation";
  v122[1] = *v4;
  v123[1] = @"ResolveUpdateOperation";
  id v38 = (id)[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
  v127[1] = v38;
  v126[2] = @"TermsConditionsBypassed";
  v120[0] = *v5;
  v121[0] = @"ResolvingUpdateOperation";
  v120[1] = *v4;
  v121[1] = @"ResolveUpdateOperation";
  id v37 = (id)[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];
  v127[2] = v37;
  v126[3] = @"TermsConditionsAgreed";
  v118[0] = *v5;
  v119[0] = @"ResolvingUpdateOperation";
  v118[1] = *v4;
  v119[1] = @"ResolveUpdateOperation";
  id v36 = (id)[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
  v127[3] = v36;
  v126[4] = @"TermsConditionsRejected";
  v116[0] = *v5;
  v117[0] = @"Idle";
  v116[1] = *v4;
  v117[1] = @"ReportUpdateOperationOutcome";
  id v35 = (id)[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
  v127[4] = v35;
  v126[5] = @"CancelUpdate";
  v114[0] = *v5;
  v115[0] = @"Idle";
  v114[1] = *v4;
  v115[1] = @"ReportUpdateOperationOutcome";
  id v34 = (id)[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:2];
  v127[5] = v34;
  id v33 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126);
  v163[3] = v33;
  v162[4] = @"ResolvingUpdateOperation";
  v112[0] = @"UpdateOpDownloadAndInstall";
  v110[0] = *v5;
  v111[0] = @"PresentingDownloadConstraints";
  v110[1] = *v4;
  v111[1] = @"PresentDownloadConstraints";
  id v32 = (id)[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];
  v113[0] = v32;
  v112[1] = @"UpdateOpDownloadAndSchedule";
  v108[0] = *v5;
  v109[0] = @"PresentingDownloadConstraints";
  v108[1] = *v4;
  v109[1] = @"PresentDownloadConstraints";
  id v31 = (id)[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
  v113[1] = v31;
  v112[2] = @"UpdateOpOnlyDownload";
  v106[0] = *v5;
  v107[0] = @"PresentingDownloadConstraints";
  v106[1] = *v4;
  v107[1] = @"PresentDownloadConstraints";
  id v30 = (id)[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:2];
  v113[2] = v30;
  v112[3] = @"UpdateOpOnlySchedule";
  v104[0] = *v5;
  v105[0] = @"SchedulingUpdate";
  v104[1] = *v4;
  v105[1] = @"ScheduleUpdate";
  id v29 = (id)[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
  v113[3] = v29;
  v112[4] = @"UpdateOpOnlyInstall";
  v102[0] = *v5;
  v103[0] = @"InitiatingUpdateInstallation";
  v102[1] = *v4;
  v103[1] = @"InitiateUpdateInstallation";
  id v28 = (id)[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
  v113[4] = v28;
  v112[5] = @"CancelUpdate";
  v100[0] = *v5;
  v101[0] = @"Idle";
  v100[1] = *v4;
  v101[1] = @"ReportUpdateOperationOutcome";
  id v27 = (id)[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:2];
  v113[5] = v27;
  id v26 = (id)[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:6];
  v163[4] = v26;
  v162[5] = @"PresentingDownloadConstraints";
  v98[0] = @"DownloadConstraintsNotRequired";
  v96[0] = *v5;
  v97[0] = @"InitiatingUpdateDownload";
  v96[1] = *v4;
  v97[1] = @"InitiateUpdateDownload";
  id v25 = (id)[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
  v99[0] = v25;
  v98[1] = @"DownloadConstraintsAgreed";
  v94[0] = *v5;
  v95[0] = @"InitiatingUpdateDownload";
  v94[1] = *v4;
  v95[1] = @"InitiateUpdateDownload";
  id v24 = (id)[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
  v99[1] = v24;
  v98[2] = @"DownloadConstraintsRejected";
  v92[0] = *v5;
  v93[0] = @"Idle";
  v92[1] = *v4;
  v93[1] = @"ReportUpdateOperationOutcome";
  id v23 = (id)[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
  v99[2] = v23;
  v98[3] = @"CancelUpdate";
  v90[0] = *v5;
  v91[0] = @"Idle";
  v90[1] = *v4;
  v91[1] = @"ReportUpdateOperationOutcome";
  id v22 = (id)[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
  v99[3] = v22;
  id v21 = (id)[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:4];
  v163[5] = v21;
  v162[6] = @"InitiatingUpdateDownload";
  v88[0] = @"UpdateDownloadStarted";
  v86[0] = *v5;
  v87[0] = @"Idle";
  v86[1] = *v4;
  v87[1] = @"ReportUpdateOperationOutcome";
  id v20 = (id)[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
  v89[0] = v20;
  v88[1] = @"UpdateDownloadReadyToSchedule";
  v84[0] = *v5;
  v85[0] = @"SchedulingUpdate";
  v84[1] = *v4;
  v85[1] = @"ScheduleUpdate";
  id v19 = (id)[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
  v89[1] = v19;
  v88[2] = @"UpdateDownloadInitFailed";
  v82[0] = *v5;
  v83[0] = @"Idle";
  v82[1] = *v4;
  v83[1] = @"ReportUpdateOperationOutcome";
  id v18 = (id)[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
  v89[2] = v18;
  v88[3] = @"CancelUpdate";
  v80[0] = *v5;
  v81[0] = @"Idle";
  v80[1] = *v4;
  v81[1] = @"ReportUpdateOperationOutcome";
  id v17 = (id)[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  v89[3] = v17;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];
  v163[6] = v16;
  v162[7] = @"InitiatingUpdateInstallation";
  v78[0] = @"UpdateInstallationStarted";
  v76[0] = *v5;
  v77[0] = @"Idle";
  v76[1] = *v4;
  v77[1] = @"ReportUpdateOperationOutcome";
  id v15 = (id)[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
  v79[0] = v15;
  v78[1] = @"UpdateInstallationFailed";
  v74[0] = *v5;
  v75[0] = @"Idle";
  v74[1] = *v4;
  v75[1] = @"ReportUpdateOperationOutcome";
  id v14 = (id)[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
  v79[1] = v14;
  v78[2] = @"CancelUpdate";
  v72[0] = *v5;
  v73[0] = @"Idle";
  v72[1] = *v4;
  v73[1] = @"ReportUpdateOperationOutcome";
  id v13 = (id)[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  v79[2] = v13;
  id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78);
  v163[7] = v12;
  v162[8] = @"SchedulingUpdate";
  v70[0] = @"UpdateScheduleSuccess";
  v68[0] = *v5;
  v69[0] = @"Idle";
  v68[1] = *v4;
  v69[1] = @"ReportUpdateOperationOutcome";
  id v11 = (id)[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  v71[0] = v11;
  v70[1] = @"UpdateScheduleFailed";
  v66[0] = *v5;
  v67[0] = @"Idle";
  v66[1] = *v4;
  v67[1] = @"ReportUpdateOperationOutcome";
  id v10 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
  v71[1] = v10;
  v70[2] = @"CancelUpdate";
  v64[0] = *v5;
  v65[0] = @"Idle";
  v64[1] = *v4;
  v65[1] = @"ReportUpdateOperationOutcome";
  id v9 = (id)[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
  v71[2] = v9;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];
  v163[8] = v8;
  v162[9] = *MEMORY[0x263F78158];
  uint64_t v62 = *MEMORY[0x263F78150];
  uint64_t v60 = *v5;
  uint64_t v61 = *MEMORY[0x263F78160];
  id v7 = (id)[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  id v63 = v7;
  id v6 = (id)[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v163[9] = v6;
  v59[0] = (id)[NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:10];

  id v2 = objc_alloc(NSDictionary);
  id v58 = (id)[v2 initWithDictionary:v59[0] copyItems:1];
  id v57 = v58;
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, 0);
  return v57;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  id v31 = 0;
  objc_storeStrong(&v31, a6);
  id v30 = 0;
  objc_storeStrong(&v30, a7);
  id v29 = a8;
  id v19 = [(SUSettingsUpdateOperation *)v35 updateFSM];
  id v18 = (id)[(SUCoreFSM *)v19 extendedStateQueue];
  dispatch_assert_queue_V2(v18);

  id v20 = v35;
  objc_sync_enter(v20);
  if (v35->_canceled && ![(SUSettingsUpdateOperation *)v35 isCancelableState:v32])
  {
    id v12 = [(SUSettingsUpdateOperation *)v35 updateFSM];
    id v11 = (id)[(SUCoreFSM *)v12 diag];
    id v10 = (id)[NSString stringWithFormat:@"It's too late to cancel the operation in the current state. State: %@", v32];
    objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]");

    queue = v35->_completionQueue;
    uint64_t v23 = MEMORY[0x263EF8330];
    int v24 = -1073741824;
    int v25 = 0;
    id v26 = __84__SUSettingsUpdateOperation_performAction_onEvent_inState_withInfo_nextState_error___block_invoke;
    id v27 = &unk_26483BA90;
    id v28 = v35;
    dispatch_async(queue, &v23);
    v35->_canceled = 0;
    objc_storeStrong((id *)&v28, 0);
  }
  if (!v35->_canceled
    || ([location[0] isEqualToString:@"ReportUpdateOperationOutcome"] & 1) != 0)
  {
    int v22 = 0;
  }
  else
  {
    int64_t v36 = 0;
    int v22 = 1;
  }
  objc_sync_exit(v20);

  if (!v22)
  {
    if ([location[0] isEqualToString:*MEMORY[0x263F78148]])
    {
      uint64_t v21 = 0;
    }
    else if ([location[0] isEqualToString:@"PrepareUpdateProcess"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_PrepareUpdateProcess:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"PurgeSpace"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_PurgeSpace:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"AquireKeybag"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_AquireKeybag:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"PresentTermsConditions"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_PresentTermsConditions:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"ResolveUpdateOperation"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_ResolveUpdateOperation:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"PresentDownloadConstraints"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_PresentDownloadConstraints:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"InitiateUpdateDownload"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_InitiateUpdateDownload:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"InitiateUpdateInstallation"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_InitiateUpdateInstallation:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"ScheduleUpdate"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_ScheduleUpdate:v31 error:v29];
    }
    else if ([location[0] isEqualToString:@"ReportUpdateOperationOutcome"])
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 action_ReportUpdateOperationOutcome:v31 error:v29];
    }
    else
    {
      uint64_t v21 = [(SUSettingsUpdateOperation *)v35 actionUnknownAction:location[0] error:v29];
    }
    int64_t v36 = v21;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __84__SUSettingsUpdateOperation_performAction_onEvent_inState_withInfo_nextState_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

- (int64_t)action_PrepareUpdateProcess:(id)a3 error:(id *)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = a4;
  suClient = v15->_suClient;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __63__SUSettingsUpdateOperation_action_PrepareUpdateProcess_error___block_invoke;
  id v11 = &unk_26483E9D8;
  id v12 = v15;
  v13[0] = location[0];
  -[SUManagerClient download:](suClient, "download:");
  objc_storeStrong(v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  return 0;
}

void __63__SUSettingsUpdateOperation_action_PrepareUpdateProcess_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  id v10 = (id)[a1[4] log];
  v23[0] = (id)[v10 oslog];

  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)[a1[5] descriptor];
    id v7 = (id)[v6 humanReadableUpdateName];
    id v8 = v7;
    id v21 = v8;
    id v9 = v24;
    char v19 = 0;
    char v17 = 0;
    char v15 = 0;
    if (location[0]
      && (v20 = (id)[location[0] descriptor], char v19 = 1, v20))
    {
      id v18 = (id)[location[0] descriptor];
      char v17 = 1;
      id v16 = (__CFString *)(id)[v18 humanReadableUpdateName];
      char v15 = 1;
      v5 = v16;
    }
    else
    {
      v5 = @"N/A";
    }
    id v4 = location[0];
    char v13 = 0;
    if (location[0])
    {
      id v14 = (__CFString *)(id)[location[0] progress];
      char v13 = 1;
      v3 = v14;
    }
    else
    {
      v3 = @"N/A";
    }
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_66_8_0_8_66((uint64_t)v26, (uint64_t)"-[SUSettingsUpdateOperation action_PrepareUpdateProcess:error:]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_228401000, (os_log_t)v23[0], v22, "%s [->%{public}@]: error: %{public}@; download: %{public}@ (%p); progress: %{public}@",
      v26,
      0x3Eu);
    if (v13) {

    }
    if (v15) {
    if (v17)
    }

    if (v19) {
    objc_storeStrong(&v21, 0);
    }
  }
  objc_storeStrong(v23, 0);
  if (v24)
  {
    [a1[5] setOperationError:v24];
    [*((id *)a1[4] + 14) postEvent:@"PrepareUpdateProcessFailed" withInfo:a1[5]];
  }
  else
  {
    [a1[5] setCurrentDownload:location[0]];
    [*((id *)a1[4] + 14) postEvent:@"PrepareUpdateProcessSuccess" withInfo:a1[5]];
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_PurgeSpace:(id)a3 error:(id *)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = a4;
  id v39 = [(SUSettingsUpdateOperation *)v73 updateFSM];
  id v38 = (id)[(SUCoreFSM *)v39 extendedStateQueue];
  dispatch_assert_queue_V2(v38);

  if (location[0])
  {
    id v69 = (id)[location[0] currentDownload];
    id v34 = (id)[v69 descriptor];
    id v33 = (id)[location[0] descriptor];
    char v35 = objc_msgSend(v34, "isEqual:");

    if (v35)
    {
      id v32 = [(SUSettingsUpdateOperation *)v73 log];
      id v68 = (id)[(SUCoreLog *)v32 oslog];

      os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
      {
        log = v68;
        os_log_type_t type = v67;
        id v31 = (id)[location[0] descriptor];
        id v30 = (id)[v31 humanReadableUpdateName];
        id v66 = v30;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v78, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v66);
        _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Currently downloading descriptor is the same as requested descriptor, do not purge", v78, 0x16u);

        objc_storeStrong(&v66, 0);
      }
      objc_storeStrong(&v68, 0);
      [(SUCoreFSM *)v73->_updateFSM postEvent:@"NoPurgableDownloadAvailable" withInfo:location[0]];
      int64_t v74 = 0;
      int v70 = 1;
    }
    else if (v69)
    {
      id v21 = (id)[location[0] options];
      char v22 = [v21 clientIsBuddy];

      if (v22)
      {
        id v20 = [(SUSettingsUpdateOperation *)v73 log];
        id v62 = (id)[(SUCoreLog *)v20 oslog];

        os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v62;
          os_log_type_t v17 = v61;
          id v19 = (id)[location[0] descriptor];
          id v18 = (id)[v19 humanReadableUpdateName];
          id v60 = v18;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v76, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v60);
          _os_log_impl(&dword_228401000, v16, v17, "%s [->%{public}@]: Client is buddy: Attempting to purge w/o user confirmation", v76, 0x16u);

          objc_storeStrong(&v60, 0);
        }
        objc_storeStrong(&v62, 0);
        id v59 = objc_alloc_init(MEMORY[0x263F78220]);
        [v59 setNotifyUser:0];
        [v59 setUserRequested:0];
        suClient = v73->_suClient;
        id v14 = v59;
        uint64_t v52 = MEMORY[0x263EF8330];
        int v53 = -1073741824;
        int v54 = 0;
        id v55 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke;
        id v56 = &unk_26483BD38;
        id v57 = v73;
        id v58 = location[0];
        [(SUManagerClient *)suClient purgeDownloadWithOptions:v14 withResult:&v52];
        int64_t v74 = 0;
        int v70 = 1;
        objc_storeStrong(&v58, 0);
        objc_storeStrong((id *)&v57, 0);
        objc_storeStrong(&v59, 0);
      }
      else
      {
        char v13 = [(SUSettingsUpdateOperation *)v73 log];
        os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v13 oslog];

        os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = oslog;
          os_log_type_t v8 = v50;
          id v12 = (id)[location[0] descriptor];
          id v11 = (id)[v12 humanReadableUpdateName];
          id v6 = v11;
          id v49 = v6;
          id v10 = (id)[v69 descriptor];
          id v9 = (id)[v10 humanReadableUpdateName];
          id v48 = v9;
          __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v75, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v6, (uint64_t)v48);
          _os_log_impl(&dword_228401000, v7, v8, "%s [->%{public}@]: Attempting to get the user consent to purge the download: %{public}@", v75, 0x20u);

          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v49, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        queue = v73->_delegateCallbackQueue;
        uint64_t v40 = MEMORY[0x263EF8330];
        int v41 = -1073741824;
        int v42 = 0;
        id v43 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_309;
        id v44 = &unk_26483BB58;
        id v45 = v73;
        id v46 = v69;
        id v47 = location[0];
        dispatch_async(queue, &v40);
        int64_t v74 = 0;
        int v70 = 1;
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v46, 0);
        objc_storeStrong((id *)&v45, 0);
      }
    }
    else
    {
      uint64_t v27 = [(SUSettingsUpdateOperation *)v73 log];
      id v65 = (id)[(SUCoreLog *)v27 oslog];

      os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = v65;
        os_log_type_t v24 = v64;
        id v26 = (id)[location[0] descriptor];
        id v25 = (id)[v26 humanReadableUpdateName];
        id v63 = v25;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v77, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v63);
        _os_log_impl(&dword_228401000, v23, v24, "%s [->%{public}@]: There's no purgable download available.", v77, 0x16u);

        objc_storeStrong(&v63, 0);
      }
      objc_storeStrong(&v65, 0);
      [(SUCoreFSM *)v73->_updateFSM postEvent:@"NoPurgableDownloadAvailable" withInfo:location[0]];
      int64_t v74 = 0;
      int v70 = 1;
    }
    objc_storeStrong(&v69, 0);
  }
  else
  {
    id v36 = (id)[(SUCoreFSM *)v73->_updateFSM diag];
    objc_msgSend(v36, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v74 = 8102;
    int v70 = 1;
  }
  objc_storeStrong(location, 0);
  return v74;
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke(id *a1, char a2, id obj)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = a1;
  char v13 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v11[1] = a1;
  id v7 = (id)[a1[4] log];
  v11[0] = (id)[v7 oslog];

  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v11[0];
    os_log_type_t type = v10;
    id v6 = (id)[a1[5] descriptor];
    id v5 = (id)[v6 humanReadableUpdateName];
    id v9 = v5;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v15, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke", (uint64_t)v9, v13 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Purge result: %d; error: %{public}@", v15, 0x26u);

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  if (location)
  {
    [a1[5] setOperationError:location];
    [*((id *)a1[4] + 14) postEvent:@"PurgeFailed" withInfo:a1[5]];
  }
  else
  {
    [*((id *)a1[4] + 14) postEvent:@"PurgeSuccess" withInfo:a1[5]];
  }
  objc_storeStrong(&location, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_309(id *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  id v4 = (void *)*((void *)a1[4] + 2);
  id v2 = a1[4];
  id v3 = a1[5];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_2;
  id v9 = &unk_26483EA28;
  id v10 = a1[4];
  id v11 = a1[6];
  v12[0] = a1[5];
  objc_msgSend(v4, "operation:requestPurgeConfirmationForDownload:replyHandler:", v2, v3);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_2(id *a1, void *a2)
{
  char v13 = a1;
  id v12 = a2;
  id v11[2] = a1;
  queue = *((void *)a1[4] + 12);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_3;
  os_log_type_t v8 = &unk_26483EA00;
  id v9 = a1[4];
  id v10 = a1[5];
  v11[0] = a1[6];
  v11[1] = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  id v12 = (id)[*(id *)(a1 + 32) log];
  v26[0] = (id)[v12 oslog];

  os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v26[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v26[0];
    os_log_type_t type = v25;
    id v11 = (id)[*(id *)(a1 + 40) descriptor];
    id v10 = (id)[v11 humanReadableUpdateName];
    id v3 = v10;
    id v24 = v3;
    id v9 = (id)[*(id *)(a1 + 48) descriptor];
    id v8 = (id)[v9 humanReadableUpdateName];
    id v4 = v8;
    id v23 = v4;
    int v7 = SUSettingsUserInteractionResponseTypeToString(*(void *)(a1 + 56));
    char v22 = v7;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v27, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke_3", (uint64_t)v3, (uint64_t)v4, (uint64_t)v22);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: User responded to the purge request of %{public}@: %{public}@", v27, 0x2Au);

    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(v26, 0);
  if (*(void *)(a1 + 56))
  {
    [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"PurgeUserReject" withInfo:*(void *)(a1 + 40)];
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x263F78220]);
    [v21 setNotifyUser:0];
    [v21 setUserRequested:1];
    id v2 = *(void **)(*(void *)(a1 + 32) + 120);
    id v1 = v21;
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    os_log_type_t v17 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_310;
    id v18 = &unk_26483BD38;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 40);
    [v2 purgeDownloadWithOptions:v1 withResult:&v14];
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v21, 0);
  }
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_310(id *a1, char a2, id obj)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  char v13 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v11[1] = a1;
  id v7 = (id)[a1[4] log];
  v11[0] = (id)[v7 oslog];

  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v11[0];
    os_log_type_t type = v10;
    id v6 = (id)[a1[5] descriptor];
    id v5 = (id)[v6 humanReadableUpdateName];
    id v9 = v5;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v15, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke", (uint64_t)v9, v13 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Purge result: %d; error: %{public}@", v15, 0x26u);

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  if (location)
  {
    [a1[5] setOperationError:location];
    [*((id *)a1[4] + 14) postEvent:@"PurgeFailed" withInfo:a1[5]];
  }
  else
  {
    [*((id *)a1[4] + 14) postEvent:@"PurgeSuccess" withInfo:a1[5]];
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_AquireKeybag:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = a4;
  id v23 = [(SUSettingsUpdateOperation *)v47 updateFSM];
  char v22 = (id)[(SUCoreFSM *)v23 extendedStateQueue];
  dispatch_assert_queue_V2(v22);

  if (location[0])
  {
    BOOL v43 = 0;
    suClient = v47->_suClient;
    id v17 = (id)[location[0] descriptor];
    BOOL v18 = -[SUManagerClient isInstallationKeybagRequiredForDescriptor:](suClient, "isInstallationKeybagRequiredForDescriptor:");

    BOOL v43 = v18;
    char v42 = v18;
    char v40 = 0;
    char v38 = 0;
    char v19 = 0;
    if (!v18)
    {
      id v41 = (id)[location[0] descriptor];
      char v40 = 1;
      char v19 = 0;
      if ([v41 isSplatOnly])
      {
        id v39 = (id)[MEMORY[0x263F781F0] sharedInstance];
        char v38 = 1;
        char v19 = [v39 hasPasscodeSet];
      }
    }
    if (v38) {

    }
    if (v40) {
    if (v19)
    }
    {
      int v15 = [(SUSettingsUpdateOperation *)v47 log];
      id v37 = (id)[(SUCoreLog *)v15 oslog];

      os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
      {
        log = v37;
        os_log_type_t type = v36;
        id v14 = (id)[location[0] descriptor];
        id v13 = (id)[v14 humanReadableUpdateName];
        id v35 = v13;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v50, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]", (uint64_t)v35);
        _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Prompting for passcode for splat-only update, but not generating an installation keybag", v50, 0x16u);

        objc_storeStrong(&v35, 0);
      }
      objc_storeStrong(&v37, 0);
      char v42 = 1;
    }
    if (v42)
    {
      os_log_type_t v10 = [(SUSettingsUpdateOperation *)v47 log];
      id v34 = (id)[(SUCoreLog *)v10 oslog];

      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v34;
        os_log_type_t v7 = v33;
        id v9 = (id)[location[0] descriptor];
        id v8 = (id)[v9 humanReadableUpdateName];
        id v32 = v8;
        __os_log_helper_16_2_4_8_32_8_66_4_0_4_0((uint64_t)v49, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]", (uint64_t)v32, v43, v42 & 1);
        _os_log_impl(&dword_228401000, v6, v7, "%s [->%{public}@]: Attempts to create a Keybag by asking the user for the device passcode. isKeybagRequired: %d, askForPasscode: %d", v49, 0x22u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v34, 0);
      queue = v47->_delegateCallbackQueue;
      uint64_t v24 = MEMORY[0x263EF8330];
      int v25 = -1073741824;
      int v26 = 0;
      uint64_t v27 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke;
      uint64_t v28 = &unk_26483EAA0;
      id v29 = v47;
      id v30 = location[0];
      BOOL v31 = v43;
      dispatch_async(queue, &v24);
      int64_t v48 = 0;
      int v44 = 1;
      objc_storeStrong(&v30, 0);
      objc_storeStrong((id *)&v29, 0);
    }
    else
    {
      [(SUCoreFSM *)v47->_updateFSM postEvent:@"KeybagNotRequired" withInfo:location[0]];
      int64_t v48 = 0;
      int v44 = 1;
    }
  }
  else
  {
    id v20 = (id)[(SUCoreFSM *)v47->_updateFSM diag];
    objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v48 = 8102;
    int v44 = 1;
  }
  objc_storeStrong(location, 0);
  return v48;
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) descriptor];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_2;
  id v9 = &unk_26483EA78;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48) & 1;
  objc_msgSend(v3, "operation:requestDevicePasscodeForDescriptor:replyHandler:", v2, v4);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_2(uint64_t a1, void *a2, id obj)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v14 = a1;
  queue = *(NSObject **)(*(void *)(a1 + 32) + 96);
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_3;
  id v9 = &unk_26483EA50;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v12[1] = v16;
  v12[0] = location;
  char v13 = *(unsigned char *)(a1 + 48) & 1;
  dispatch_async(queue, &v5);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_3(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v38[2] = (id)a1;
  v38[1] = (id)a1;
  id v23 = (id)[*(id *)(a1 + 32) log];
  v38[0] = (id)[v23 oslog];

  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v38[0];
    os_log_type_t type = v37;
    id v22 = (id)[*(id *)(a1 + 40) descriptor];
    id v21 = (id)[v22 humanReadableUpdateName];
    id v17 = v21;
    id v36 = v17;
    id v20 = SUSettingsUserInteractionResponseTypeToString(*(void *)(a1 + 56));
    id v35 = v20;
    __os_log_helper_16_2_5_8_32_8_66_8_66_4_0_4_0((uint64_t)v41, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke_3", (uint64_t)v17, (uint64_t)v35, *(void *)(a1 + 48) != 0, [*(id *)(a1 + 40) isUnattendedInstall] & 1);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Passcode request result: %{public}@; passcode present: %d; for unattended install? %d",
      v41,
      0x2Cu);

    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(v38, 0);
  if (!*(void *)(a1 + 56) && *(void *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v34 = objc_alloc_init(MEMORY[0x263F10468]);
      id v14 = (id)[*(id *)(a1 + 48) dataUsingEncoding:4];
      char v15 = objc_msgSend(v34, "setCredential:type:");

      if (v15)
      {
        id v29 = objc_alloc_init(MEMORY[0x263F781F8]);
        [v29 setLaContext:v34];
        id v7 = (id)[*(id *)(a1 + 40) descriptor];
        objc_msgSend(v29, "setDescriptor:");

        objc_msgSend(v29, "setKeybagType:", (objc_msgSend(*(id *)(a1 + 40), "isUnattendedInstall") & 1) != 0);
        char v28 = 0;
        char v28 = [*(id *)(*(void *)(a1 + 32) + 120) createInstallationKeybagWithOptions:v29] & 1;
        [*(id *)(a1 + 40) setCreatedKeybag:v28 & 1];
        id v6 = (id)[*(id *)(a1 + 32) log];
        id v27 = (id)[v6 oslog];

        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v2 = v27;
          os_log_type_t v3 = v26;
          id v5 = (id)[*(id *)(a1 + 40) descriptor];
          id v4 = (id)[v5 humanReadableUpdateName];
          id v25 = v4;
          __os_log_helper_16_2_3_8_32_8_66_4_0((uint64_t)v39, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke", (uint64_t)v25, v28 & 1);
          _os_log_impl(&dword_228401000, v2, v3, "%s [->%{public}@]: Keybag creation result: %d", v39, 0x1Cu);

          objc_storeStrong(&v25, 0);
        }
        objc_storeStrong(&v27, 0);
        if (v28)
        {
          [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"KeybagCreated" withInfo:*(void *)(a1 + 40)];
        }
        else
        {
          id v1 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:6 userInfo:0];
          objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

          [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"KeybagCreationFailed" withInfo:*(void *)(a1 + 40)];
        }
        objc_storeStrong(&v29, 0);
        int v30 = 0;
      }
      else
      {
        id v13 = (id)[*(id *)(a1 + 32) log];
        id v33 = (id)[v13 oslog];

        os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v33;
          os_log_type_t v10 = v32;
          id v12 = (id)[*(id *)(a1 + 40) descriptor];
          id v11 = (id)[v12 humanReadableUpdateName];
          id v31 = v11;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v40, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke", (uint64_t)v31);
          _os_log_impl(&dword_228401000, v9, v10, "%s [->%{public}@]: Failed to create a LAContext with the given passcode", v40, 0x16u);

          objc_storeStrong(&v31, 0);
        }
        objc_storeStrong(&v33, 0);
        id v8 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:6 userInfo:0];
        objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

        [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"KeybagCreationFailed" withInfo:*(void *)(a1 + 40)];
        int v30 = 1;
      }
      objc_storeStrong(&v34, 0);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"KeybagNotRequired" withInfo:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v16 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:6 userInfo:0];
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"KeybagUserReject" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)action_PresentTermsConditions:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = a4;
  id v39 = [(SUSettingsUpdateOperation *)v58 updateFSM];
  char v38 = (id)[(SUCoreFSM *)v39 extendedStateQueue];
  dispatch_assert_queue_V2(v38);

  if (location[0])
  {
    id v4 = (id)[location[0] currentDownload];
    BOOL v35 = v4 == 0;

    if (v35) {
      goto LABEL_8;
    }
    id v33 = (id)[location[0] currentDownload];
    id v32 = (id)[v33 downloadOptions];
    int v34 = [v32 termsAndConditionsAgreementStatus];

    int v54 = v34;
    id v31 = [(SUSettingsUpdateOperation *)v58 log];
    id v53 = (id)[(SUCoreLog *)v31 oslog];

    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
    {
      log = v53;
      os_log_type_t type = v52;
      id v30 = (id)[location[0] descriptor];
      id v29 = (id)[v30 humanReadableUpdateName];
      id v25 = v29;
      id v51 = v25;
      id v28 = (id)SUStringFromAgreementStatus();
      id v50 = v28;
      __os_log_helper_16_2_4_8_32_8_66_8_66_4_0((uint64_t)v61, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]", (uint64_t)v25, (uint64_t)v50, v54);
      _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: A download object is available. SU T&C  agreement status: %{public}@ (%d)", v61, 0x26u);

      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
    }
    objc_storeStrong(&v53, 0);
    if (v54 != 1)
    {
LABEL_8:
      id v20 = (id)[location[0] descriptor];
      char v21 = [v20 isSplatOnly];

      if (v21)
      {
        id v19 = (id)[location[0] options];
        id v18 = (id)[v19 agreementManager];
        id v17 = (id)[location[0] descriptor];
        objc_msgSend(v18, "setTermsAgreementStatus:forUpdate:");

        [(SUCoreFSM *)v58->_updateFSM postEvent:@"TermsConditionsNotRequired" withInfo:location[0]];
        int64_t v59 = 0;
        int v55 = 1;
      }
      else
      {
        id v15 = (id)[location[0] options];
        char v16 = [v15 bypassTermsAndConditions];

        if (v16)
        {
          id v14 = (id)[location[0] options];
          id v13 = (id)[v14 agreementManager];
          id v12 = (id)[location[0] descriptor];
          objc_msgSend(v13, "setTermsAgreementStatus:forUpdate:");

          [(SUCoreFSM *)v58->_updateFSM postEvent:@"TermsConditionsBypassed" withInfo:location[0]];
          int64_t v59 = 0;
          int v55 = 1;
        }
        else
        {
          id v11 = [(SUSettingsUpdateOperation *)v58 log];
          id v49 = (id)[(SUCoreLog *)v11 oslog];

          os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
          {
            id v7 = v49;
            os_log_type_t v8 = v48;
            id v10 = (id)[location[0] descriptor];
            id v9 = (id)[v10 humanReadableUpdateName];
            id v47 = v9;
            __os_log_helper_16_2_2_8_32_8_66((uint64_t)v60, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]", (uint64_t)v47);
            _os_log_impl(&dword_228401000, v7, v8, "%s [->%{public}@]: Attempting to present the T&C sheet", v60, 0x16u);

            objc_storeStrong(&v47, 0);
          }
          objc_storeStrong(&v49, 0);
          queue = v58->_delegateCallbackQueue;
          uint64_t v40 = MEMORY[0x263EF8330];
          int v41 = -1073741824;
          int v42 = 0;
          BOOL v43 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke;
          int v44 = &unk_26483BAB8;
          id v45 = v58;
          id v46 = location[0];
          dispatch_async(queue, &v40);
          int64_t v59 = 0;
          int v55 = 1;
          objc_storeStrong(&v46, 0);
          objc_storeStrong((id *)&v45, 0);
        }
      }
    }
    else
    {
      id v24 = (id)[location[0] options];
      id v23 = (id)[v24 agreementManager];
      id v22 = (id)[location[0] descriptor];
      objc_msgSend(v23, "setTermsAgreementStatus:forUpdate:");

      [(SUCoreFSM *)v58->_updateFSM postEvent:@"TermsConditionsAlreadyAgreed" withInfo:location[0]];
      int64_t v59 = 0;
      int v55 = 1;
    }
  }
  else
  {
    id v36 = (id)[(SUCoreFSM *)v58->_updateFSM diag];
    objc_msgSend(v36, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v59 = 8102;
    int v55 = 1;
  }
  objc_storeStrong(location, 0);
  return v59;
}

void __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke(id *a1)
{
  id v11[2] = a1;
  v11[1] = a1;
  os_log_type_t v3 = (void *)*((void *)a1[4] + 2);
  id v2 = a1[4];
  id v4 = (id)[a1[5] descriptor];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_2;
  id v9 = &unk_26483C058;
  id v10 = a1[4];
  v11[0] = a1[5];
  objc_msgSend(v3, "operation:requestAgreementToTermsAndConditionsForUpdate:replyHandler:", v2, v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
}

void __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_2(id *a1, void *a2)
{
  id v12 = a1;
  id v11 = a2;
  v10[2] = a1;
  queue = *((void *)a1[4] + 12);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_3;
  os_log_type_t v8 = &unk_26483C030;
  id v9 = a1[4];
  v10[0] = a1[5];
  v10[1] = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24[2] = (id)a1;
  v24[1] = (id)a1;
  id v19 = (id)[*(id *)(a1 + 32) log];
  v24[0] = (id)[v19 oslog];

  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v24[0];
    os_log_type_t type = v23;
    id v18 = (id)[*(id *)(a1 + 40) descriptor];
    id v17 = (id)[v18 humanReadableUpdateName];
    id v13 = v17;
    id v22 = v13;
    char v16 = SUSettingsUserInteractionResponseTypeToString(*(void *)(a1 + 48));
    char v21 = v16;
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v25, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]_block_invoke_3", (uint64_t)v13, (uint64_t)v21);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: T&C request result: %{public}@", v25, 0x20u);

    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  if (*(void *)(a1 + 48))
  {
    id v9 = (id)[*(id *)(a1 + 40) options];
    id v8 = (id)[v9 agreementManager];
    id v7 = (id)[*(id *)(a1 + 40) descriptor];
    objc_msgSend(v8, "setTermsAgreementStatus:forUpdate:");

    id v11 = (id)[*(id *)(a1 + 40) currentDownload];
    id v10 = (id)[v11 downloadOptions];
    [v10 setTermsAndConditionsAgreementStatus:2];

    id v12 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:3 userInfo:0];
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    return [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"TermsConditionsRejected" withInfo:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = (id)[*(id *)(a1 + 40) options];
    id v3 = (id)[v4 agreementManager];
    id v2 = (id)[*(id *)(a1 + 40) descriptor];
    objc_msgSend(v3, "setTermsAgreementStatus:forUpdate:");

    id v6 = (id)[*(id *)(a1 + 40) currentDownload];
    id v5 = (id)[v6 downloadOptions];
    [v5 setTermsAndConditionsAgreementStatus:1];

    return [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"TermsConditionsAgreed" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)action_ResolveUpdateOperation:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = a4;
  char v21 = [(SUSettingsUpdateOperation *)v29 updateFSM];
  id v20 = (id)[(SUCoreFSM *)v21 extendedStateQueue];
  dispatch_assert_queue_V2(v20);

  if (location[0])
  {
    unint64_t operationType = v29->_operationType;
    BOOL v5 = operationType > 1;
    unint64_t v6 = operationType - 1;
    if (v5)
    {
      unint64_t v8 = v6;
      char v7 = 1;
    }
    else
    {
      unint64_t v8 = v6;
      char v7 = 0;
    }
    if (v7)
    {
      id v17 = [(SUSettingsUpdateOperation *)v29 log];
      id v25 = (id)[(SUCoreLog *)v17 oslog];

      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        log = v25;
        os_log_type_t type = v24;
        id v16 = (id)[location[0] descriptor];
        id v15 = (id)[v16 humanReadableUpdateName];
        id v11 = v15;
        id v23 = v11;
        id v14 = SUSettingsUpdateOperationTypeToString(v29->_operationType);
        id v22 = v14;
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_2((uint64_t)v31, (uint64_t)"-[SUSettingsUpdateOperation action_ResolveUpdateOperation:error:]", (uint64_t)v11, (uint64_t)v22, v29->_operationType);
        _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Can not resovle unknown operation type: %{public}@ (%{public}ld)", v31, 0x2Au);

        objc_storeStrong((id *)&v22, 0);
        objc_storeStrong(&v23, 0);
      }
      objc_storeStrong(&v25, 0);
      id v10 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:2 userInfo:0];
      objc_msgSend(location[0], "setOperationError:");

      [(SUCoreFSM *)v29->_updateFSM postEvent:@"CancelUpdate" withInfo:location[0]];
    }
    else
    {
      switch(v8)
      {
        case 0uLL:
          [(SUCoreFSM *)v29->_updateFSM postEvent:@"UpdateOpOnlyDownload" withInfo:location[0]];
          break;
        case 1uLL:
          [(SUCoreFSM *)v29->_updateFSM postEvent:@"UpdateOpDownloadAndInstall" withInfo:location[0]];
          break;
        case 2uLL:
          [(SUCoreFSM *)v29->_updateFSM postEvent:@"UpdateOpDownloadAndSchedule" withInfo:location[0]];
          break;
        case 3uLL:
          [(SUCoreFSM *)v29->_updateFSM postEvent:@"UpdateOpOnlySchedule" withInfo:location[0]];
          break;
        case 4uLL:
          [(SUCoreFSM *)v29->_updateFSM postEvent:@"UpdateOpOnlyInstall" withInfo:location[0]];
          break;
        default:
          JUMPOUT(0);
      }
    }
    int64_t v30 = 0;
    int v26 = 1;
  }
  else
  {
    id v18 = (id)[(SUCoreFSM *)v29->_updateFSM diag];
    objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v30 = 8102;
    int v26 = 1;
  }
  objc_storeStrong(location, 0);
  return v30;
}

- (int64_t)action_PresentDownloadConstraints:(id)a3 error:(id *)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  v106 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v104 = a4;
  int v70 = [(SUSettingsUpdateOperation *)v106 updateFSM];
  id v69 = (id)[(SUCoreFSM *)v70 extendedStateQueue];
  dispatch_assert_queue_V2(v69);

  if (location[0])
  {
    id SUDownloadPolicyFactoryClass = getSUDownloadPolicyFactoryClass();
    id v66 = (id)[location[0] descriptor];
    id v65 = (id)[location[0] currentDownload];
    id v64 = (id)[v65 downloadOptions];
    id v63 = (id)[v64 activeDownloadPolicy];
    id v62 = (id)[location[0] options];
    id v102 = (id)objc_msgSend(SUDownloadPolicyFactoryClass, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v66, v63, objc_msgSend(v62, "allowUnrestrictedCellularDownload") & 1);

    if ([(SUSettingsUpdateOperation *)v106 deviceSupportsCellularCapability])
    {
      id v98 = (id)[MEMORY[0x263F78208] sharedInstance];
      id v51 = (id)[location[0] options];
      char v52 = [v51 clientIsBuddy];

      if ((v52 & 1) != 0
        && ([v98 isBootstrap] & 1) != 0
        && ([v98 isPathSatisfied] & 1) == 0)
      {
        id v50 = [(SUSettingsUpdateOperation *)v106 log];
        os_log_t v97 = (os_log_t)(id)[(SUCoreLog *)v50 oslog];

        os_log_type_t v96 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          id v46 = v97;
          os_log_type_t v47 = v96;
          id v49 = (id)[location[0] descriptor];
          id v48 = (id)[v49 humanReadableUpdateName];
          id v95 = v48;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v113, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v95);
          _os_log_impl(&dword_228401000, v46, v47, "%s [->%{public}@]: Can't download update in bootstrap network. Not prompting for cellular download acceptance", v113, 0x16u);

          objc_storeStrong(&v95, 0);
        }
        objc_storeStrong((id *)&v97, 0);
        id v45 = (id)[location[0] options];
        id v44 = (id)[v45 agreementManager];
        id v43 = (id)[location[0] descriptor];
        objc_msgSend(v44, "setCellularFeeAgreementStatus:forUpdate:");

        [location[0] setCellularAgreementStatus:0];
        [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
        int64_t v107 = 0;
        int v103 = 1;
      }
      else if (MGGetBoolAnswer() & 1)
      {
        if ([v102 isDownloadAllowableForCellular])
        {
          if ([v98 currentNetworkType] == 1)
          {
            int v26 = [(SUSettingsUpdateOperation *)v106 log];
            os_log_t v87 = (os_log_t)(id)[(SUCoreLog *)v26 oslog];

            os_log_type_t v86 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = v87;
              os_log_type_t v23 = v86;
              id v25 = (id)[location[0] descriptor];
              id v24 = (id)[v25 humanReadableUpdateName];
              id v85 = v24;
              __os_log_helper_16_2_2_8_32_8_66((uint64_t)v110, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v85);
              _os_log_impl(&dword_228401000, v22, v23, "%s [->%{public}@]: Device is currently using Wi-Fi. Skipping on the download constraints acceptance step.", v110, 0x16u);

              objc_storeStrong(&v85, 0);
            }
            objc_storeStrong((id *)&v87, 0);
            id v21 = (id)[location[0] options];
            id v20 = (id)[v21 agreementManager];
            id v19 = (id)[location[0] descriptor];
            objc_msgSend(v20, "setCellularFeeAgreementStatus:forUpdate:");

            [location[0] setCellularAgreementStatus:0];
            [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
            int64_t v107 = 0;
            int v103 = 1;
          }
          else if ([v102 is5GDownloadAllowed])
          {
            id v18 = [(SUSettingsUpdateOperation *)v106 log];
            os_log_t v84 = (os_log_t)(id)[(SUCoreLog *)v18 oslog];

            os_log_type_t v83 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = v84;
              os_log_type_t v15 = v83;
              id v17 = (id)[location[0] descriptor];
              id v16 = (id)[v17 humanReadableUpdateName];
              id v82 = v16;
              __os_log_helper_16_2_2_8_32_8_66((uint64_t)v109, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v82);
              _os_log_impl(&dword_228401000, v14, v15, "%s [->%{public}@]: Device is using inexpensive HDM. Skipping on the download constraints acceptance step.", v109, 0x16u);

              objc_storeStrong(&v82, 0);
            }
            objc_storeStrong((id *)&v84, 0);
            id v13 = (id)[location[0] options];
            id v12 = (id)[v13 agreementManager];
            id v11 = (id)[location[0] descriptor];
            objc_msgSend(v12, "setCellularFeeAgreementStatus:forUpdate:");

            [location[0] setCellularAgreementStatus:0];
            [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
            int64_t v107 = 0;
            int v103 = 1;
          }
          else
          {
            id v10 = [(SUSettingsUpdateOperation *)v106 log];
            os_log_t v81 = (os_log_t)(id)[(SUCoreLog *)v10 oslog];

            os_log_type_t v80 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v6 = v81;
              os_log_type_t v7 = v80;
              id v9 = (id)[location[0] descriptor];
              id v8 = (id)[v9 humanReadableUpdateName];
              id v79 = v8;
              __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v108, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v79, (uint64_t)v102);
              _os_log_impl(&dword_228401000, v6, v7, "%s [->%{public}@]: Attempting to ask for download constraints approval for download policy: %{public}@", v108, 0x20u);

              objc_storeStrong(&v79, 0);
            }
            objc_storeStrong((id *)&v81, 0);
            queue = v106->_delegateCallbackQueue;
            uint64_t v71 = MEMORY[0x263EF8330];
            int v72 = -1073741824;
            int v73 = 0;
            int64_t v74 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke;
            v75 = &unk_26483BB58;
            v76 = v106;
            id v77 = location[0];
            id v78 = v102;
            dispatch_async(queue, &v71);
            int64_t v107 = 0;
            int v103 = 1;
            objc_storeStrong(&v78, 0);
            objc_storeStrong(&v77, 0);
            objc_storeStrong((id *)&v76, 0);
          }
        }
        else
        {
          int v34 = [(SUSettingsUpdateOperation *)v106 log];
          os_log_t v90 = (os_log_t)(id)[(SUCoreLog *)v34 oslog];

          os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v30 = v90;
            os_log_type_t v31 = v89;
            id v33 = (id)[location[0] descriptor];
            id v32 = (id)[v33 humanReadableUpdateName];
            id v88 = v32;
            __os_log_helper_16_2_2_8_32_8_66((uint64_t)v111, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v88);
            _os_log_impl(&dword_228401000, v30, v31, "%s [->%{public}@]: The download policy does not support cellular capability. Skipping on the download constraints acceptance step.", v111, 0x16u);

            objc_storeStrong(&v88, 0);
          }
          objc_storeStrong((id *)&v90, 0);
          id v29 = (id)[location[0] options];
          id v28 = (id)[v29 agreementManager];
          id v27 = (id)[location[0] descriptor];
          objc_msgSend(v28, "setCellularFeeAgreementStatus:forUpdate:");

          [location[0] setCellularAgreementStatus:0];
          [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
          int64_t v107 = 0;
          int v103 = 1;
        }
      }
      else
      {
        int v42 = [(SUSettingsUpdateOperation *)v106 log];
        os_log_t v93 = (os_log_t)(id)[(SUCoreLog *)v42 oslog];

        os_log_type_t v92 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          char v38 = v93;
          os_log_type_t v39 = v92;
          id v41 = (id)[location[0] descriptor];
          id v40 = (id)[v41 humanReadableUpdateName];
          id v91 = v40;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v112, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v91);
          _os_log_impl(&dword_228401000, v38, v39, "%s [->%{public}@]: MobileGestalt: The device does not support cellular capability. Skipping on the download constraints acceptance step.", v112, 0x16u);

          objc_storeStrong(&v91, 0);
        }
        objc_storeStrong((id *)&v93, 0);
        id v37 = (id)[location[0] options];
        id v36 = (id)[v37 agreementManager];
        id v35 = (id)[location[0] descriptor];
        objc_msgSend(v36, "setCellularFeeAgreementStatus:forUpdate:");

        [location[0] setCellularAgreementStatus:0];
        [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
        int64_t v107 = 0;
        int v103 = 1;
      }
      objc_storeStrong(&v98, 0);
    }
    else
    {
      id v60 = [(SUSettingsUpdateOperation *)v106 log];
      os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v60 oslog];

      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v57 = type;
        id v59 = (id)[location[0] descriptor];
        id v58 = (id)[v59 humanReadableUpdateName];
        id v99 = v58;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v114, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v99);
        _os_log_impl(&dword_228401000, log, v57, "%s [->%{public}@]: CoreTelephony: The device does not support cellular capability. Skipping on the download constraints acceptance step.", v114, 0x16u);

        objc_storeStrong(&v99, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v55 = (id)[location[0] options];
      id v54 = (id)[v55 agreementManager];
      id v53 = (id)[location[0] descriptor];
      objc_msgSend(v54, "setCellularFeeAgreementStatus:forUpdate:");

      [location[0] setCellularAgreementStatus:0];
      [(SUCoreFSM *)v106->_updateFSM postEvent:@"DownloadConstraintsNotRequired" withInfo:location[0]];
      int64_t v107 = 0;
      int v103 = 1;
    }
    objc_storeStrong(&v102, 0);
  }
  else
  {
    id v67 = (id)[(SUCoreFSM *)v106->_updateFSM diag];
    objc_msgSend(v67, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v107 = 8102;
    int v103 = 1;
  }
  objc_storeStrong(location, 0);
  return v107;
}

void __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke(uint64_t a1)
{
  id v12[2] = (id)a1;
  v12[1] = (id)a1;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = (id)[*(id *)(a1 + 40) descriptor];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_2;
  id v10 = &unk_26483C058;
  id v11 = *(id *)(a1 + 32);
  v12[0] = *(id *)(a1 + 40);
  objc_msgSend(v4, "operation:requestApprovalForDownloadConstraints:downloadPolicy:replyHandler:", v2, v5, v3);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
}

void __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_2(id *a1, void *a2)
{
  id v12 = a1;
  id v11 = a2;
  v10[2] = a1;
  queue = *((void *)a1[4] + 12);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_3;
  int v8 = &unk_26483C030;
  id v9 = a1[4];
  v10[0] = a1[5];
  v10[1] = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20[2] = (id)a1;
  v20[1] = (id)a1;
  id v15 = (id)[*(id *)(a1 + 32) log];
  v20[0] = (id)[v15 oslog];

  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v20[0];
    os_log_type_t type = v19;
    id v14 = (id)[*(id *)(a1 + 40) descriptor];
    id v13 = (id)[v14 humanReadableUpdateName];
    id v9 = v13;
    id v18 = v9;
    id v12 = SUSettingsUserInteractionResponseTypeToString(*(void *)(a1 + 48));
    id v17 = v12;
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v21, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]_block_invoke_3", (uint64_t)v9, (uint64_t)v17);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Download constraints approval request result: %{public}@", v21, 0x20u);

    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(v20, 0);
  if (*(void *)(a1 + 48))
  {
    id v7 = (id)[*(id *)(a1 + 40) options];
    id v6 = (id)[v7 agreementManager];
    id v5 = (id)[*(id *)(a1 + 40) descriptor];
    objc_msgSend(v6, "setCellularFeeAgreementStatus:forUpdate:");

    [*(id *)(a1 + 40) setCellularAgreementStatus:2];
    id v8 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:4 userInfo:0];
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    return [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"DownloadConstraintsRejected" withInfo:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = (id)[*(id *)(a1 + 40) options];
    id v3 = (id)[v4 agreementManager];
    id v2 = (id)[*(id *)(a1 + 40) descriptor];
    objc_msgSend(v3, "setCellularFeeAgreementStatus:forUpdate:");

    [*(id *)(a1 + 40) setCellularAgreementStatus:1];
    return [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"DownloadConstraintsAgreed" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)action_InitiateUpdateDownload:(id)a3 error:(id *)a4
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = a4;
  id v16 = [(SUSettingsUpdateOperation *)v29 updateFSM];
  id v15 = (id)[(SUCoreFSM *)v16 extendedStateQueue];
  dispatch_assert_queue_V2(v15);

  if (location[0])
  {
    id v7 = objc_alloc(MEMORY[0x263F781E0]);
    id v8 = (id)[location[0] descriptor];
    id v25 = (id)objc_msgSend(v7, "initWithDescriptor:");

    id SUDownloadPolicyFactoryClass = getSUDownloadPolicyFactoryClass();
    id v11 = (id)[location[0] descriptor];
    id v10 = (id)[location[0] options];
    id v24 = (id)objc_msgSend(SUDownloadPolicyFactoryClass, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v11, 0, objc_msgSend(v10, "allowUnrestrictedCellularDownload") & 1);

    uint64_t v12 = [(SUSettingsUpdateOperation *)v29 operationType];
    if (v12 != 1)
    {
      if (v12 != 3)
      {
LABEL_7:
        [v25 setActiveDownloadPolicy:v24];
        objc_msgSend(v25, "setDownloadFeeAgreementStatus:", objc_msgSend(location[0], "cellularAgreementStatus"));
        objc_msgSend(v25, "setTermsAndConditionsAgreementStatus:");
        suClient = v29->_suClient;
        id v5 = v25;
        uint64_t v17 = MEMORY[0x263EF8330];
        int v18 = -1073741824;
        int v19 = 0;
        id v20 = __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke;
        id v21 = &unk_26483BD38;
        uint64_t v22 = v29;
        id v23 = location[0];
        [(SUManagerClient *)suClient startDownloadWithOptions:v5 withResult:&v17];
        int64_t v30 = 0;
        int v26 = 1;
        objc_storeStrong(&v23, 0);
        objc_storeStrong((id *)&v22, 0);
        objc_storeStrong(&v24, 0);
        objc_storeStrong(&v25, 0);
        goto LABEL_8;
      }
      [v25 setUserUpdateTonight:1];
    }
    [v25 setDownloadOnly:1];
    goto LABEL_7;
  }
  id v13 = (id)[(SUCoreFSM *)v29->_updateFSM diag];
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

  int64_t v30 = 8102;
  int v26 = 1;
LABEL_8:
  objc_storeStrong(location, 0);
  return v30;
}

void __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke(id *a1, char a2, id obj)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  char v38 = a1;
  char v37 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v35[1] = a1;
  id v19 = (id)[a1[4] log];
  v35[0] = (id)[v19 oslog];

  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v35[0];
    os_log_type_t type = v34;
    id v18 = (id)[a1[5] descriptor];
    id v17 = (id)[v18 humanReadableUpdateName];
    id v33 = v17;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v40, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v33, v37 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Initiated the update download. Successfully started: %d; error: %{public}@",
      v40,
      0x26u);

    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(v35, 0);
  id v13 = (id)[location domain];
  id v12 = getSUErrorDomain_2();
  char v14 = objc_msgSend(v13, "isEqualToString:");

  if (v14)
  {
    uint64_t v32 = [location code];
    if (v32 == 11 || v32 == 41) {
      char v37 = 1;
    }
  }
  [a1[5] setDownloadStartedSuccessfully:v37 & 1];
  [a1[5] setOperationError:location];
  if (v37)
  {
    id v4 = (void *)*((void *)a1[4] + 15);
    uint64_t v21 = MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    id v24 = __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke_323;
    id v25 = &unk_26483E9D8;
    id v26 = a1[4];
    id v27 = a1[5];
    [v4 download:&v21];
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v26, 0);
    int v28 = 0;
  }
  else
  {
    id v3 = (id)[a1[5] operationError];
    BOOL v11 = v3 != 0;

    if (!v11)
    {
      id v10 = (id)[a1[4] log];
      id v31 = (id)[v10 oslog];

      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v31;
        os_log_type_t v7 = v30;
        id v9 = (id)[a1[5] descriptor];
        id v8 = (id)[v9 humanReadableUpdateName];
        id v29 = v8;
        __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v39, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v29, v37 & 1, (uint64_t)location);
        _os_log_impl(&dword_228401000, v6, v7, "%s [->%{public}@]: The download attempt has failed but there's no error assigned to it. result: %d; startDownl"
          "oadError: %{public}@",
          v39,
          0x26u);

        objc_storeStrong(&v29, 0);
      }
      objc_storeStrong(&v31, 0);
      id v5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:-1 userInfo:0];
      objc_msgSend(a1[5], "setOperationError:");
    }
    [*((id *)a1[4] + 14) postEvent:@"UpdateDownloadInitFailed" withInfo:a1[5]];
    int v28 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke_323(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v30 = 0;
  objc_storeStrong(&v30, a3);
  v29[1] = a1;
  id v17 = (id)[a1[4] log];
  v29[0] = (id)[v17 oslog];

  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v29[0];
    os_log_type_t type = v28;
    id v16 = (id)[a1[5] descriptor];
    id v15 = (id)[v16 humanReadableUpdateName];
    id v27 = v15;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v33, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v27, (uint64_t)location[0], (uint64_t)v30);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Received the newly created download object: %{public}@; error: %{public}@",
      v33,
      0x2Au);

    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(v29, 0);
  char v25 = 0;
  char v23 = 0;
  BOOL v12 = 0;
  if (!location[0])
  {
    id v26 = (id)[v30 domain];
    char v25 = 1;
    id v24 = getSUErrorDomain_2();
    char v23 = 1;
    BOOL v12 = 0;
    if (objc_msgSend(v26, "isEqualToString:")) {
      BOOL v12 = [v30 code] == 11;
    }
  }
  if (v23) {

  }
  if (v25) {
  if (v12)
  }
  {
    id v10 = [SUSUIUninitializedDownload alloc];
    id v11 = (id)[a1[5] descriptor];
    id v3 = -[SUSUIUninitializedDownload initWithDescriptor:](v10, "initWithDescriptor:");
    id v4 = location[0];
    location[0] = v3;

    id v9 = (id)[a1[4] log];
    os_log_t oslog = (os_log_t)(id)[v9 oslog];

    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v21;
      id v8 = (id)[a1[5] descriptor];
      id v7 = (id)[v8 humanReadableUpdateName];
      id v20 = v7;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v32, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v20, (uint64_t)v30, (uint64_t)location[0]);
      _os_log_impl(&dword_228401000, v5, v6, "%s [->%{public}@]: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v32, 0x2Au);

      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  [a1[5] setCurrentDownload:location[0]];
  if (*((void *)a1[4] + 13) == 3) {
    [*((id *)a1[4] + 14) postEvent:@"UpdateDownloadReadyToSchedule" withInfo:a1[5]];
  }
  else {
    [*((id *)a1[4] + 14) postEvent:@"UpdateDownloadStarted" withInfo:a1[5]];
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_InitiateUpdateInstallation:(id)a3 error:(id *)a4
{
  char v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v21 = a4;
  id v11 = [(SUSettingsUpdateOperation *)v23 updateFSM];
  id v10 = (id)[(SUCoreFSM *)v11 extendedStateQueue];
  dispatch_assert_queue_V2(v10);

  if (location[0])
  {
    id v19 = objc_alloc_init(MEMORY[0x263F781E8]);
    unint64_t v4 = +[SUSettingsScanOperation installationIgnorableConstraints];
    [v19 setIgnorableConstraints:v4];
    suClient = v23->_suClient;
    id v6 = v19;
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __69__SUSettingsUpdateOperation_action_InitiateUpdateInstallation_error___block_invoke;
    id v16 = &unk_26483BD38;
    id v17 = location[0];
    id v18 = v23;
    [(SUManagerClient *)suClient installUpdateWithInstallOptions:v6 withResult:&v12];
    int64_t v24 = 0;
    int v20 = 1;
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v8 = (id)[(SUCoreFSM *)v23->_updateFSM diag];
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v24 = 8102;
    int v20 = 1;
  }
  objc_storeStrong(location, 0);
  return v24;
}

void __69__SUSettingsUpdateOperation_action_InitiateUpdateInstallation_error___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v20 = a1;
  char v19 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v17 = a1;
  [*(id *)(a1 + 32) setInstallInitiatedSuccessfully:v19 & 1];
  [*(id *)(a1 + 32) setOperationError:location];
  char v15 = 0;
  BOOL v11 = 0;
  if ((v19 & 1) == 0)
  {
    id v16 = (id)[*(id *)(a1 + 32) operationError];
    char v15 = 1;
    BOOL v11 = v16 == 0;
  }
  if (v15) {

  }
  if (v11)
  {
    id v9 = (id)[*(id *)(a1 + 40) log];
    id v14 = (id)[v9 oslog];

    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      log = v14;
      os_log_type_t type = v13;
      id v8 = (id)[*(id *)(a1 + 32) descriptor];
      id v7 = (id)[v8 humanReadableUpdateName];
      id v12 = v7;
      __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v21, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateInstallation:error:]_block_invoke", (uint64_t)v12, v19 & 1, (uint64_t)location);
      _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: The installation attempt has failed but there's no error assigned to it. result: %d; installa"
        "tionError: %{public}@",
        v21,
        0x26u);

      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v14, 0);
    id v4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:-1 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "setOperationError:");
  }
  id v3 = *(void **)(*(void *)(a1 + 40) + 112);
  if (v19) {
    objc_msgSend(v3, "postEvent:withInfo:", @"UpdateInstallationStarted", *(void *)(a1 + 32), @"UpdateInstallationStarted");
  }
  else {
    objc_msgSend(v3, "postEvent:withInfo:", @"UpdateInstallationFailed", *(void *)(a1 + 32), @"UpdateInstallationFailed");
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_ScheduleUpdate:(id)a3 error:(id *)a4
{
  uint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = a4;
  id v9 = [(SUSettingsUpdateOperation *)v20 updateFSM];
  id v8 = (id)[(SUCoreFSM *)v9 extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  if (location[0])
  {
    suClient = v20->_suClient;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    os_log_type_t v13 = __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke;
    id v14 = &unk_26483EAF0;
    char v15 = v20;
    id v16 = location[0];
    [(SUManagerClient *)suClient currentAutoInstallOperation:1 withResult:&v10];
    int64_t v21 = 0;
    int v17 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
  }
  else
  {
    id v6 = (id)[(SUCoreFSM *)v20->_updateFSM diag];
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v21 = 8102;
    int v17 = 1;
  }
  objc_storeStrong(location, 0);
  return v21;
}

void __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  id v9 = (id)[a1[4] log];
  v24[0] = (id)[v9 oslog];

  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v24[0];
    os_log_type_t type = v23;
    id v8 = (id)[a1[5] descriptor];
    id v7 = (id)[v8 humanReadableUpdateName];
    id v22 = v7;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v27, (uint64_t)"-[SUSettingsUpdateOperation action_ScheduleUpdate:error:]_block_invoke", (uint64_t)v22, (uint64_t)location[0], (uint64_t)v25);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Operation aquired from currentAutoInstallOperation: %{public}@; error: %{public}@",
      v27,
      0x2Au);

    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  if (location[0] && !v25)
  {
    id v4 = (void *)*((void *)a1[4] + 15);
    id v3 = location[0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    char v15 = __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke_327;
    id v16 = &unk_26483EAC8;
    id v17 = a1[4];
    id v18 = a1[5];
    id v19 = location[0];
    id v20 = v25;
    [v4 _consentAutoInstallOperation:v3 withResult:&v12];
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    int v21 = 0;
  }
  else
  {
    [a1[5] setUpdateScheduledSuccessfully:0];
    [a1[5] setScheduleError:v25];
    [*((id *)a1[4] + 14) postEvent:@"UpdateScheduleFailed" withInfo:a1[5]];
    int v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke_327(uint64_t a1, char a2, id obj)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  id v10 = (id)[*(id *)(a1 + 32) log];
  v14[0] = (id)[v10 oslog];

  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v14[0];
    os_log_type_t type = v13;
    id v9 = (id)[*(id *)(a1 + 40) descriptor];
    id v8 = (id)[v9 humanReadableUpdateName];
    id v12 = v8;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v18, (uint64_t)"-[SUSettingsUpdateOperation action_ScheduleUpdate:error:]_block_invoke", (uint64_t)v12, v16 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: Consent aquired: %d; error: %{public}@", v18, 0x26u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v14, 0);
  BOOL v5 = 0;
  if (v16) {
    BOOL v5 = *(void *)(a1 + 48) != 0;
  }
  [*(id *)(a1 + 40) setUpdateScheduledSuccessfully:v5];
  id v4 = (id)[*(id *)(a1 + 40) scheduleError];
  if (v4) {
    objc_msgSend(*(id *)(a1 + 40), "setScheduleError:", v4, v4);
  }
  else {
    objc_msgSend(*(id *)(a1 + 40), "setScheduleError:", *(void *)(a1 + 56), *(void *)(a1 + 56));
  }

  if (*(void *)(a1 + 48))
  {
    if (v16) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [*(id *)(a1 + 48) setAgreementStatus:v3];
    [*(id *)(a1 + 40) setAutoInstallOperation:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"UpdateScheduleSuccess" withInfo:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 112) postEvent:@"UpdateScheduleFailed" withInfo:*(void *)(a1 + 40)];
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_ReportUpdateOperationOutcome:(id)a3 error:(id *)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  os_log_t v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v82 = a4;
  char v37 = [(SUSettingsUpdateOperation *)v84 updateFSM];
  id v36 = (id)[(SUCoreFSM *)v37 extendedStateQueue];
  dispatch_assert_queue_V2(v36);

  if (location[0])
  {
    char v79 = 0;
    BOOL v33 = 0;
    if ([location[0] createdKeybag])
    {
      BOOL v32 = 1;
      if (!v84->_canceled)
      {
        id v80 = (id)[location[0] operationError];
        char v79 = 1;
        BOOL v32 = v80 != 0;
      }
      BOOL v33 = v32;
    }
    if (v79) {

    }
    if (v33)
    {
      id v31 = [(SUSettingsUpdateOperation *)v84 log];
      id v78 = (id)[(SUCoreLog *)v31 oslog];

      os_log_type_t v77 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_DEFAULT))
      {
        log = v78;
        os_log_type_t type = v77;
        id v30 = (id)[location[0] descriptor];
        id v29 = (id)[v30 humanReadableUpdateName];
        id v24 = v29;
        id v76 = v24;
        id v4 = "YES";
        if (!v84->_canceled) {
          id v4 = "NO";
        }
        uint64_t v25 = (uint64_t)v4;
        id v28 = (id)[location[0] operationError];
        __os_log_helper_16_2_4_8_32_8_66_8_32_8_66((uint64_t)v87, (uint64_t)"-[SUSettingsUpdateOperation action_ReportUpdateOperationOutcome:error:]", (uint64_t)v24, v25, (uint64_t)v28);
        _os_log_impl(&dword_228401000, log, type, "%s [->%{public}@]: A keybag was created during the update attempt, but the update operation did not finish with success result. Destroying the keybag.\ncanceled? %s; operationError: %{public}@",
          v87,
          0x2Au);

        objc_storeStrong(&v76, 0);
      }
      objc_storeStrong(&v78, 0);
      [(SUManagerClient *)v84->_suClient destroyInstallationKeybag];
    }
    if (v84->_canceled)
    {
      [location[0] setDownloadStartedSuccessfully:0];
      [location[0] setInstallInitiatedSuccessfully:0];
      [location[0] setUpdateScheduledSuccessfully:0];
      id v22 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F78360], 16);
      objc_msgSend(location[0], "setOperationError:");

      queue = v84->_completionQueue;
      uint64_t v70 = MEMORY[0x263EF8330];
      int v71 = -1073741824;
      int v72 = 0;
      int v73 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke;
      int64_t v74 = &unk_26483BA90;
      v75 = v84;
      dispatch_async(queue, &v70);
      objc_storeStrong((id *)&v75, 0);
    }
    unint64_t operationType = v84->_operationType;
    BOOL v6 = operationType > 1;
    unint64_t v7 = operationType - 1;
    if (v6)
    {
      unint64_t v9 = v7;
      char v8 = 1;
    }
    else
    {
      unint64_t v9 = v7;
      char v8 = 0;
    }
    if (v8)
    {
      uint64_t v17 = [(SUSettingsUpdateOperation *)v84 log];
      os_log_t oslog = (os_log_t)(id)[(SUCoreLog *)v17 oslog];

      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = oslog;
        os_log_type_t v13 = v40;
        id v16 = (id)[location[0] descriptor];
        id v15 = (id)[v16 humanReadableUpdateName];
        id v11 = v15;
        id v39 = v11;
        int v14 = SUSettingsUpdateOperationTypeToString(v84->_operationType);
        char v38 = v14;
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_2((uint64_t)v86, (uint64_t)"-[SUSettingsUpdateOperation action_ReportUpdateOperationOutcome:error:]", (uint64_t)v11, (uint64_t)v38, v84->_operationType);
        _os_log_impl(&dword_228401000, v12, v13, "%s [->%{public}@]: Unknown operation type: %{public}@ (%{public}ld)", v86, 0x2Au);

        objc_storeStrong((id *)&v38, 0);
        objc_storeStrong(&v39, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      switch(v9)
      {
        case 0uLL:
        case 1uLL:
          completionQueue = v84->_completionQueue;
          uint64_t v63 = MEMORY[0x263EF8330];
          int v64 = -1073741824;
          int v65 = 0;
          id v66 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_2;
          id v67 = &unk_26483BAB8;
          id v68 = v84;
          id v69 = location[0];
          dispatch_async(completionQueue, &v63);
          objc_storeStrong(&v69, 0);
          objc_storeStrong((id *)&v68, 0);
          break;
        case 2uLL:
          id v20 = v84->_completionQueue;
          uint64_t v56 = MEMORY[0x263EF8330];
          int v57 = -1073741824;
          int v58 = 0;
          id v59 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_3;
          id v60 = &unk_26483BAB8;
          os_log_type_t v61 = v84;
          id v62 = location[0];
          dispatch_async(v20, &v56);
          objc_storeStrong(&v62, 0);
          objc_storeStrong((id *)&v61, 0);
          break;
        case 3uLL:
          uint64_t v19 = v84->_completionQueue;
          uint64_t v49 = MEMORY[0x263EF8330];
          int v50 = -1073741824;
          int v51 = 0;
          char v52 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_4;
          id v53 = &unk_26483BAB8;
          id v54 = v84;
          id v55 = location[0];
          dispatch_async(v19, &v49);
          objc_storeStrong(&v55, 0);
          objc_storeStrong((id *)&v54, 0);
          break;
        case 4uLL:
          id v18 = v84->_completionQueue;
          uint64_t v42 = MEMORY[0x263EF8330];
          int v43 = -1073741824;
          int v44 = 0;
          id v45 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_5;
          id v46 = &unk_26483BAB8;
          os_log_type_t v47 = v84;
          id v48 = location[0];
          dispatch_async(v18, &v42);
          objc_storeStrong(&v48, 0);
          objc_storeStrong((id *)&v47, 0);
          break;
        default:
          JUMPOUT(0);
      }
    }
    int64_t v85 = 0;
    int v81 = 1;
  }
  else
  {
    id v34 = (id)[(SUCoreFSM *)v84->_updateFSM diag];
    objc_msgSend(v34, "trackAnomaly:forReason:withResult:withError:", @"[SUSettingsUpdateOperation]", @"The given eventInfo parameter must not be nil.");

    int64_t v85 = 8102;
    int v81 = 1;
  }
  objc_storeStrong(location, 0);
  return v85;
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
  }
  return [*(id *)(a1 + 32) invalidateMachine];
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
    char v2 = [*(id *)(a1 + 40) downloadStartedSuccessfully];
    id v5 = (id)[*(id *)(a1 + 40) currentDownload];
    id v4 = (id)[*(id *)(a1 + 40) operationError];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, v2 & 1, v5);
  }
  return [*(id *)(a1 + 32) invalidateMachine];
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
    char v4 = [*(id *)(a1 + 40) downloadStartedSuccessfully];
    id v5 = (id)[*(id *)(a1 + 40) currentDownload];
    char v6 = [*(id *)(a1 + 40) updateScheduledSuccessfully];
    id v7 = (id)[*(id *)(a1 + 40) autoInstallOperation];
    id v8 = (id)[*(id *)(a1 + 40) operationError];
    char v10 = 0;
    if (v8)
    {
      id v2 = v8;
      (*(void (**)(uint64_t, void, id, void, id, id))(v3 + 16))(v3, v4 & 1, v5, v6 & 1, v7, v8);
    }
    else
    {
      id v11 = (id)[*(id *)(a1 + 40) scheduleError];
      char v10 = 1;
      id v2 = v11;
      (*(void (**)(uint64_t, void, id, void, id, id))(v3 + 16))(v3, v4 & 1, v5, v6 & 1, v7, v11);
    }
    if (v10) {
  }
    }
  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine", v2);
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
    char v2 = [*(id *)(a1 + 40) updateScheduledSuccessfully];
    id v5 = (id)[*(id *)(a1 + 40) autoInstallOperation];
    id v4 = (id)[*(id *)(a1 + 40) operationError];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, v2 & 1, v5);
  }
  return [*(id *)(a1 + 32) invalidateMachine];
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    char v2 = [*(id *)(a1 + 40) installInitiatedSuccessfully];
    id v4 = (id)[*(id *)(a1 + 40) operationError];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, v2 & 1);
  }
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
  id v11 = [(SUSettingsUpdateOperation *)v18 updateFSM];
  id v10 = (id)[(SUCoreFSM *)v11 diag];
  id v5 = [NSString alloc];
  id v9 = (id)[v5 initWithFormat:@"unknown action(%@)", location[0]];
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  id v12 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v15 = (id)[v12 buildError:8116 underlying:0 description:v16[0]];

  int v14 = [(SUSettingsUpdateOperation *)v18 updateFSM];
  id v13 = (id)[(SUCoreFSM *)v14 diag];
  uint64_t v6 = [v15 code];
  [v13 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"Scan FSM has reported an anomaly" withResult:v6 withError:v15];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsUpdateOperation)initWithDescriptor:(id)a3 usingSUManagerClient:(id)a4 delegate:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v5 = v45;
  id v45 = 0;
  v41.receiver = v5;
  v41.super_class = (Class)SUSettingsUpdateOperation;
  BOOL v33 = [(SUSettingsUpdateOperation *)&v41 init];
  id v45 = v33;
  objc_storeStrong(&v45, v33);
  if (!v33) {
    goto LABEL_12;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettingsScanOperation"];
  id v7 = (void *)*((void *)v45 + 5);
  *((void *)v45 + 5) = v6;

  if (!*((void *)v45 + 5))
  {
    id v30 = SUSettingsSharedLogger();
    id v40 = (id)[v30 oslog];

    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v50, (uint64_t)"-[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:]", @"SUSettingsScanOperation");
      _os_log_impl(&dword_228401000, (os_log_t)v40, v39, "%s: Could not create a log category for %@", v50, 0x16u);
    }
    objc_storeStrong(&v40, 0);
    id v46 = 0;
    int v38 = 1;
    goto LABEL_13;
  }
  id v48 = (id)MGCopyAnswer();
  id v37 = v48;
  id v47 = (id)MGCopyAnswer();
  id v36 = v47;
  id v25 = [NSString alloc];
  id v8 = (objc_class *)objc_opt_class();
  id v28 = NSStringFromClass(v8);
  id v27 = (id)[location[0] productVersion];
  id v26 = (id)[location[0] productBuildVersion];
  id v35 = (id)[v25 initWithFormat:@"%@:[(%@, %@)->(%@, %@)]", v28, v37, v36, v27, v26];

  objc_storeStrong((id *)v45 + 15, v43);
  objc_storeStrong((id *)v45 + 2, v42);
  id v9 = (id)[(id)objc_opt_class() _generateStateTable];
  id v10 = (void *)*((void *)v45 + 16);
  *((void *)v45 + 16) = v9;

  *((void *)v45 + 13) = 0;
  id v29 = objc_alloc(MEMORY[0x263F77DD8]);
  uint64_t v11 = [v29 initMachine:v35 withTable:*((void *)v45 + 16) startingIn:@"Idle" usingDelegate:v45 registeringAllInfoClass:objc_opt_class()];
  id v12 = (void *)*((void *)v45 + 14);
  *((void *)v45 + 14) = v11;

  if (*((void *)v45 + 14))
  {
    id v18 = NSString;
    id v20 = (id)[v45 baseDomain];
    id v19 = (id)[v18 stringWithFormat:@"%@.requests-queue", v20];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v19 UTF8String], 0);
    int v14 = (void *)*((void *)v45 + 11);
    *((void *)v45 + 11) = v13;

    int v21 = NSString;
    id v23 = (id)[v45 baseDomain];
    id v22 = (id)[v21 stringWithFormat:@"%@.work-queue", v23];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    id v16 = (void *)*((void *)v45 + 12);
    *((void *)v45 + 12) = v15;

    int v38 = 0;
  }
  else
  {
    id v24 = SUSettingsSharedLogger();
    id v34 = (id)[v24 oslog];

    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v49, (uint64_t)"-[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:]");
      _os_log_impl(&dword_228401000, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "%s: Failed creating the update FSM", v49, 0xCu);
    }
    objc_storeStrong(&v34, 0);
    id v46 = 0;
    int v38 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  if (!v38)
  {
LABEL_12:
    id v46 = (SUSettingsUpdateOperation *)v45;
    int v38 = 1;
  }
LABEL_13:
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v45, 0);
  return v46;
}

- (void)downloadUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v10 = [(SUSettingsUpdateOperation *)v19 log];
  id v15 = (id)[(SUCoreLog *)v10 oslog];

  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (id)[location[0] humanReadableUpdateName];
    id v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadUpdate:withOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_228401000, (os_log_t)v15, v14, "%s: Initiating an update operation (Download Only) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  id v8 = v19;
  objc_sync_enter(v8);
  if ([(SUSettingsUpdateOperation *)v19 isActive])
  {
    id v7 = (id)[(SUCoreFSM *)v19->_updateFSM diag];
    [v7 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"This update machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];
  }
  else
  {
    uint64_t v6 = MEMORY[0x22A697370](v16);
    id downloadUpdateCompletion = v19->_downloadUpdateCompletion;
    v19->_id downloadUpdateCompletion = (id)v6;

    if (![(SUSettingsUpdateOperation *)v19 beginOperation:1 ofUnattendedInstall:0 descriptor:location[0] options:v17])(*((void (**)(id, void, void))v16 + 2))(v16, 0, 0); {
  }
    }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstall:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v10 = [(SUSettingsUpdateOperation *)v19 log];
  id v15 = (id)[(SUCoreLog *)v10 oslog];

  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (id)[location[0] humanReadableUpdateName];
    id v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadAndInstall:withOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_228401000, (os_log_t)v15, v14, "%s: Initiating an update operation (Download and Install) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  id v8 = v19;
  objc_sync_enter(v8);
  if ([(SUSettingsUpdateOperation *)v19 isActive])
  {
    id v7 = (id)[(SUCoreFSM *)v19->_updateFSM diag];
    [v7 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"This update machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];
  }
  else
  {
    uint64_t v6 = MEMORY[0x22A697370](v16);
    id downloadUpdateCompletion = v19->_downloadUpdateCompletion;
    v19->_id downloadUpdateCompletion = (id)v6;

    if (![(SUSettingsUpdateOperation *)v19 beginOperation:2 ofUnattendedInstall:1 descriptor:location[0] options:v17])(*((void (**)(id, void, void))v16 + 2))(v16, 0, 0); {
  }
    }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndScheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v10 = [(SUSettingsUpdateOperation *)v19 log];
  id v15 = (id)[(SUCoreLog *)v10 oslog];

  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (id)[location[0] humanReadableUpdateName];
    id v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadAndScheduleUpdate:forInstallationTonightWithOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_228401000, (os_log_t)v15, v14, "%s: Initiating an update operation (Update Tonight) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  id v8 = v19;
  objc_sync_enter(v8);
  if ([(SUSettingsUpdateOperation *)v19 isActive])
  {
    id v7 = (id)[(SUCoreFSM *)v19->_updateFSM diag];
    [v7 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"This update machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];
  }
  else
  {
    uint64_t v6 = MEMORY[0x22A697370](v16);
    id downloadAndScheduleCompletion = v19->_downloadAndScheduleCompletion;
    v19->_id downloadAndScheduleCompletion = (id)v6;

    if (![(SUSettingsUpdateOperation *)v19 beginOperation:3 ofUnattendedInstall:1 descriptor:location[0] options:v17])(*((void (**)(id, void, void, void, void))v16 + 2))(v16, 0, 0, 0, 0); {
  }
    }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)installUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v12 = [(SUSettingsUpdateOperation *)v21 log];
  id v17 = (id)[(SUCoreLog *)v12 oslog];

  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)[location[0] humanReadableUpdateName];
    id v15 = v11;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsUpdateOperation installUpdate:withOptions:completionHandler:]", (uint64_t)v15);
    _os_log_impl(&dword_228401000, (os_log_t)v17, v16, "%s: Initiating an install operation (Install Now) to target: %{public}@", v22, 0x16u);

    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v17, 0);
  id v10 = v21;
  objc_sync_enter(v10);
  if ([(SUSettingsUpdateOperation *)v21 isActive])
  {
    id v9 = (id)[(SUCoreFSM *)v21->_updateFSM diag];
    [v9 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"This update machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];
  }
  else
  {
    uint64_t v8 = MEMORY[0x22A697370](v18);
    id installCompletion = v21->_installCompletion;
    v21->_id installCompletion = (id)v8;

    if (![(SUSettingsUpdateOperation *)v21 beginOperation:5 ofUnattendedInstall:1 descriptor:location[0] options:v19])
    {
      id v7 = (void (**)(id, void))v18;
      id v6 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:8102 userInfo:0];
      v7[2](v7, 0);
    }
  }
  objc_sync_exit(v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)promoteDownloadToUserInitiated:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  if (location[0])
  {
    id v11 = [(SUSettingsUpdateOperation *)v29 log];
    id v23 = (id)[(SUCoreLog *)v11 oslog];

    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v23;
      os_log_type_t v8 = v22;
      id v10 = (id)[location[0] descriptor];
      id v9 = (id)[v10 humanReadableUpdateName];
      id v21 = v9;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v30, (uint64_t)"-[SUSettingsUpdateOperation promoteDownloadToUserInitiated:completionHandler:]", (uint64_t)v21);
      _os_log_impl(&dword_228401000, v7, v8, "%s: Initiating an update operation (Install once Downloaded) to target: %{public}@", v30, 0x16u);

      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
    id v4 = (id)[location[0] downloadOptions];
    [v4 setAutoDownload:0];

    suClient = v29->_suClient;
    id v6 = (id)[location[0] downloadOptions];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = __78__SUSettingsUpdateOperation_promoteDownloadToUserInitiated_completionHandler___block_invoke;
    id v18 = &unk_26483EB18;
    id v20 = v27;
    id v19 = location[0];
    [(SUManagerClient *)suClient updateDownloadOptions:v6 withResult:&v14];

    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    int v24 = 0;
  }
  else
  {
    id v12 = [(SUSettingsUpdateOperation *)v29 log];
    id v26 = (id)[(SUCoreLog *)v12 oslog];

    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSettingsUpdateOperation promoteDownloadToUserInitiated:completionHandler:]");
      _os_log_error_impl(&dword_228401000, (os_log_t)v26, v25, "%s: Can not promote the initial status of a nil targeted update.", v31, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    int v24 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

void __78__SUSettingsUpdateOperation_promoteDownloadToUserInitiated_completionHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)scheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v10 = [(SUSettingsUpdateOperation *)v19 log];
  id v15 = (id)[(SUCoreLog *)v10 oslog];

  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (id)[location[0] humanReadableUpdateName];
    id v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation scheduleUpdate:forInstallationTonightWithOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_228401000, (os_log_t)v15, v14, "%s: Initiating a schedule operation (Install Tonight) of target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  os_log_type_t v8 = v19;
  objc_sync_enter(v8);
  if ([(SUSettingsUpdateOperation *)v19 isActive])
  {
    id v7 = (id)[(SUCoreFSM *)v19->_updateFSM diag];
    [v7 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"This update machine is currently process another scan request. Queuing requests is not currently supported." withResult:8102 withError:0];
  }
  else
  {
    uint64_t v6 = MEMORY[0x22A697370](v16);
    id scheduleCompletion = v19->_scheduleCompletion;
    v19->_id scheduleCompletion = (id)v6;

    if (![(SUSettingsUpdateOperation *)v19 beginOperation:4 ofUnattendedInstall:1 descriptor:location[0] options:v17])(*((void (**)(id, void, void))v16 + 2))(v16, 0, 0); {
  }
    }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)unscheduleAutomaticInstallation:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v4 = [(SUSettingsUpdateOperation *)v9 log];
  id v6 = (id)[(SUCoreLog *)v4 oslog];

  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v10, (uint64_t)"-[SUSettingsUpdateOperation unscheduleAutomaticInstallation:completionHandler:]", (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "%s: Initiating an update operation (Cancel Install Tonight) to operation: %{public}@", v10, 0x16u);
  }
  objc_storeStrong(&v6, 0);
  [location[0] cancel];
  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)cancel:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [(SUSettingsUpdateOperation *)v10 log];
  id v8 = (id)[(SUCoreLog *)v7 oslog];

  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSettingsUpdateOperation cancel:]");
    _os_log_impl(&dword_228401000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s: Requesting to cancel the current update operation", v11, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  obj = v10;
  objc_sync_enter(obj);
  if ([(SUSettingsUpdateOperation *)v10 isActive])
  {
    if (![(SUSettingsUpdateOperation *)v10 canceled])
    {
      [(SUSettingsUpdateOperation *)v10 setCanceled:1];
      [(SUSettingsUpdateOperation *)v10 setCancelHandler:location[0]];
      updateFSM = v10->_updateFSM;
      id v4 = objc_alloc_init(SUSettingsUpdateParam);
      [(SUCoreFSM *)updateFSM postEvent:@"CancelUpdate" withInfo:v4];
    }
  }
  else
  {
    id v5 = (id)[(SUCoreFSM *)v10->_updateFSM diag];
    [v5 trackAnomaly:@"[SUSettingsUpdateOperation]" forReason:@"There is no active search to cancel" withResult:8102 withError:0];
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (BOOL)isActive
{
  return [(SUSettingsUpdateOperation *)self operationType] != 0;
}

- (void)invalidateMachine
{
  self->_unint64_t operationType = 0;
  id scheduleCompletion = self->_scheduleCompletion;
  self->_id scheduleCompletion = 0;

  id downloadUpdateCompletion = self->_downloadUpdateCompletion;
  self->_id downloadUpdateCompletion = 0;

  id downloadAndScheduleCompletion = self->_downloadAndScheduleCompletion;
  self->_id downloadAndScheduleCompletion = 0;

  id installCompletion = self->_installCompletion;
  self->_id installCompletion = 0;

  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = 0;

  self->_canceled = 0;
}

- (BOOL)beginOperation:(unint64_t)a3 ofUnattendedInstall:(BOOL)a4 descriptor:(id)a5 options:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v24 = self;
  SEL v23 = a2;
  unint64_t v22 = a3;
  BOOL v21 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  if (v24->_delegate)
  {
    v24->_unint64_t operationType = v22;
    id v12 = (id)[MEMORY[0x263F77D78] sharedCore];
    id v6 = (OS_dispatch_queue *)(id)[v12 selectDelegateCallbackQueue:v24->_delegateCallbackQueue];
    delegateCallbackQueue = v24->_delegateCallbackQueue;
    v24->_delegateCallbackQueue = v6;

    id v13 = (id)[MEMORY[0x263F77D78] sharedCore];
    id v8 = (OS_dispatch_queue *)(id)[v13 selectCompletionQueue:v24->_completionQueue];
    completionQueue = v24->_completionQueue;
    v24->_completionQueue = v8;

    [(SUCoreFSM *)v24->_updateFSM activateMachine];
    updateFSM = v24->_updateFSM;
    id v10 = [SUSettingsUpdateParam alloc];
    id v15 = [(SUSettingsUpdateParam *)v10 initWithDescriptor:location andUpdateOptions:v19 forUnattendedInstall:v21];
    -[SUCoreFSM postEvent:withInfo:](updateFSM, "postEvent:withInfo:", @"BeginDownloadUpdate");

    char v25 = 1;
  }
  else
  {
    id v16 = [(SUSettingsUpdateOperation *)v24 log];
    id v18 = (id)[(SUCoreLog *)v16 oslog];

    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v26, (uint64_t)"-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:]", v22);
      _os_log_error_impl(&dword_228401000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "%s: Can not perform operation %ld: The class delegate must not be nil.", v26, 0x16u);
    }
    objc_storeStrong(&v18, 0);
    char v25 = 0;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v25 & 1;
}

- (BOOL)deviceSupportsCellularCapability
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
  if (v5[0])
  {
    id location = (id)[v5[0] getInternetDataStatusSync:0];
    char v3 = 0;
    if (location) {
      char v3 = [location cellularDataPossible];
    }
    char v6 = v3 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v6 = 0;
  }
  objc_storeStrong(v5, 0);
  return v6 & 1;
}

- (id)baseDomain
{
  id v3 = [NSString alloc];
  id v5 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v4 = (id)[v5 commonDomain];
  char v6 = (void *)[v3 initWithFormat:@"%@.susettings.fsm.update", v4];

  return v6;
}

- (BOOL)isCancelableState:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"Idle"])
  {
    BOOL v5 = 1;
  }
  else if ([location[0] isEqualToString:@"PurgingSpace"])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = ([location[0] isEqualToString:@"AquiringKeybag"] & 1) != 0
      || ([location[0] isEqualToString:@"PresentingTermsConditions"] & 1) != 0
      || ([location[0] isEqualToString:@"ResolvingUpdateOperation"] & 1) != 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (SUSettingsUpdateOperationDelegate)delegate
{
  return self->_delegate;
}

- (OS_dispatch_queue)completionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateCallbackQueue:(id)a3
{
}

- (SUCoreLog)log
{
  return self->_log;
}

- (id)downloadUpdateCompletion
{
  return self->_downloadUpdateCompletion;
}

- (void)setDownloadUpdateCompletion:(id)a3
{
}

- (id)downloadAndScheduleCompletion
{
  return self->_downloadAndScheduleCompletion;
}

- (void)setDownloadAndScheduleCompletion:(id)a3
{
}

- (id)scheduleCompletion
{
  return self->_scheduleCompletion;
}

- (void)setScheduleCompletion:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (id)installCompletion
{
  return self->_installCompletion;
}

- (void)setInstallCompletion:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (OS_dispatch_queue)requestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestsQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_unint64_t operationType = a3;
}

- (SUCoreFSM)updateFSM
{
  return self->_updateFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
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