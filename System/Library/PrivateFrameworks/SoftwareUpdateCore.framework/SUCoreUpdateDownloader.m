@interface SUCoreUpdateDownloader
+ (id)_generateStateTable;
- (BOOL)_isPreSUStagingEnabled;
- (BOOL)_shouldStageOptionalPSUSAssets;
- (BOOL)shouldDownloadSplat;
- (BOOL)shouldReportDownloadFailureIfCanceled;
- (NSDictionary)stateTable;
- (NSString)description;
- (NSString)updateUUID;
- (OS_dispatch_queue)delegateCallBackQueue;
- (SUCoreDescriptor)updateDescriptor;
- (SUCoreFSM)downloadFSM;
- (SUCoreMobileAsset)maControl;
- (SUCoreMobileAsset)maControlSplombo;
- (SUCorePolicy)policy;
- (SUCoreProgress)unifiedProgress;
- (SUCoreUpdateDownloader)initWithDelegate:(id)a3 forUpdate:(id)a4 updateUUID:(id)a5;
- (SUCoreUpdateDownloaderDelegate)delegate;
- (id)_createEvent:(id)a3;
- (id)_versionedModuleName;
- (int)numPendingOperations;
- (int64_t)actionCheckRemoveCompleted:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadPSUSAssets:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadSplat:(id)a3 error:(id *)a4;
- (int64_t)actionRemoveUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateDownloaded:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateFailedToDownload:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateFailedToRemove:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateRemoved:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)totalToWriteBytesForPhase;
- (unint64_t)totalWrittenBytesUpToLastPhase;
- (void)_reportPSUSFinishedEvent:(id)a3;
- (void)_reportPSUSStartedEvent;
- (void)_reportUpdateFailedToDownload:(id)a3;
- (void)_skipCurrentOperationFor:(id)a3;
- (void)_trackAnomaly:(id)a3 reason:(id)a4 result:(int64_t)a5 error:(id)a6;
- (void)_trackBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_verifyNoPendingOperations:(id)a3 reason:(id)a4;
- (void)alterPolicy:(id)a3;
- (void)downloadUpdateWithPolicy:(id)a3;
- (void)maAnomaly:(id)a3;
- (void)maDownloadProgress:(id)a3;
- (void)maDownloadStalled:(id)a3;
- (void)removeUpdate;
- (void)setNumPendingOperations:(int)a3;
- (void)setPolicy:(id)a3;
- (void)setShouldReportDownloadFailureIfCanceled:(BOOL)a3;
- (void)setTotalToWriteBytesForPhase:(unint64_t)a3;
- (void)setTotalWrittenBytesUpToLastPhase:(unint64_t)a3;
- (void)setUnifiedProgress:(id)a3;
@end

@implementation SUCoreUpdateDownloader

- (SUCoreUpdateDownloader)initWithDelegate:(id)a3 forUpdate:(id)a4 updateUUID:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v44.receiver = self;
    v44.super_class = (Class)SUCoreUpdateDownloader;
    v12 = [(SUCoreUpdateDownloader *)&v44 init];
    self = v12;
    if (!v12)
    {
LABEL_18:
      self = self;
      v25 = self;
      goto LABEL_19;
    }
    v12->_shouldDownloadSplat = 0;
    if ([v9 descriptorType] == 1
      || [v9 descriptorType] == 3
      || [v9 descriptorType] == 5)
    {
      v13 = [SUCoreMobileAsset alloc];
      v14 = [v9 softwareUpdateAsset];
      v15 = [(SUCoreMobileAsset *)v13 initWithDelegate:self forAsset:v14 updateUUID:v11];
      maControl = self->_maControl;
      self->_maControl = v15;

      v17 = [v9 associatedSplatDescriptor];
      v18 = v17;
      if (v17)
      {
        if ([v17 descriptorType] != 1)
        {
          v40 = [MEMORY[0x263F77DE8] sharedLogger];
          v41 = [v40 oslog];

          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:](v18);
          }

          goto LABEL_13;
        }
        v19 = [SUCoreMobileAsset alloc];
        v20 = [v18 softwareUpdateAsset];
        v21 = [(SUCoreMobileAsset *)v19 initWithDelegate:self forAsset:v20 updateUUID:v11];
        maControlSplombo = self->_maControlSplombo;
        self->_maControlSplombo = v21;

        self->_shouldDownloadSplat = 1;
      }
      else
      {
        v26 = [MEMORY[0x263F77DE8] sharedLogger];
        v27 = [v26 oslog];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [NSString stringWithFormat:@"init: not creating ma for Splat"];
          *(_DWORD *)buf = 138543362;
          v46 = v28;
          _os_log_impl(&dword_20C8EA000, v27, OS_LOG_TYPE_DEFAULT, "[SUCoreUpdateDownloader] %{public}@", buf, 0xCu);
        }
      }

      policy = self->_policy;
      self->_policy = 0;

      objc_storeWeak((id *)&self->_delegate, v8);
      objc_storeStrong((id *)&self->_updateDescriptor, a4);
      objc_storeStrong((id *)&self->_updateUUID, a5);
      self->_numPendingOperations = 0;
      self->_shouldReportDownloadFailureIfCanceled = 0;
      v30 = [MEMORY[0x263F77D78] sharedCore];
      v31 = [v30 selectDelegateCallbackQueue:0];
      delegateCallBackQueue = self->_delegateCallBackQueue;
      self->_delegateCallBackQueue = v31;

      v33 = +[SUCoreUpdateDownloader _generateStateTable];
      stateTable = self->_stateTable;
      self->_stateTable = v33;

      id v35 = objc_alloc(MEMORY[0x263F77DD8]);
      v36 = [(SUCoreUpdateDownloader *)self _versionedModuleName];
      v37 = (SUCoreFSM *)[v35 initMachine:v36 ofInstance:self->_updateUUID withTable:self->_stateTable startingIn:@"Idle" usingDelegate:self registeringAllInfoClass:objc_opt_class()];
      downloadFSM = self->_downloadFSM;
      self->_downloadFSM = v37;

      if (self->_downloadFSM) {
        goto LABEL_18;
      }
      v42 = [MEMORY[0x263F77DE8] sharedLogger];
      v24 = [v42 oslog];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:]();
      }
    }
    else
    {
      v43 = [MEMORY[0x263F77DE8] sharedLogger];
      v24 = [v43 oslog];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:](v9);
      }
    }
  }
  else
  {
    v23 = [MEMORY[0x263F77DE8] sharedLogger];
    v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.4();
    }
  }

LABEL_13:
  v25 = 0;
LABEL_19:

  return v25;
}

- (void)downloadUpdateWithPolicy:(id)a3
{
  id v4 = a3;
  v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke;
  v8[3] = &unk_2640DCE98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPolicy:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) downloadFSM];
  v2 = objc_alloc_init(SUCoreUpdateDownloaderParam);
  [v3 postProtectedEvent:@"DownloadUpdate" withInfo:v2];
}

- (void)removeUpdate
{
  id v3 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v4 = [v3 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUCoreUpdateDownloader_removeUpdate__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_async(v4, block);
}

void __38__SUCoreUpdateDownloader_removeUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldReportDownloadFailureIfCanceled])
  {
    [*(id *)(a1 + 32) setShouldReportDownloadFailureIfCanceled:0];
    v2 = [MEMORY[0x263F77D78] sharedCore];
    id v3 = [v2 buildError:8124 underlying:0 description:@"update attempt was canceled"];

    [*(id *)(a1 + 32) _reportUpdateFailedToDownload:v3];
  }
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  id v4 = objc_alloc_init(SUCoreUpdateDownloaderParam);
  [v5 postProtectedEvent:@"RemoveUpdate" withInfo:v4];
}

- (void)alterPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SUCoreUpdateDownloader_alterPolicy___block_invoke;
  v8[3] = &unk_2640DCE98;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __38__SUCoreUpdateDownloader_alterPolicy___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPolicy:");
    id v2 = objc_alloc_init(MEMORY[0x263F559A8]);
    id v3 = [*(id *)(a1 + 32) softwareUpdateDownloadPolicy];
    objc_msgSend(v2, "setDiscretionary:", objc_msgSend(v3, "discretionary"));

    id v4 = [MEMORY[0x263F77DE8] sharedLogger];
    id v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSString;
      id v8 = +[SUCoreMobileAsset downloadConfigSummary:v2];
      id v9 = [v7 stringWithFormat:@"adjusting configuration: %@", v8];
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
    id v10 = [*(id *)(a1 + 40) maControl];
    [v10 alterDownloadOptions:v2];

    v11 = [*(id *)(a1 + 40) maControlSplombo];
    [v11 alterDownloadOptions:v2];
  }
}

+ (id)_generateStateTable
{
  v125[6] = *MEMORY[0x263EF8340];
  v124[0] = @"Idle";
  v122[0] = @"DownloadUpdate";
  uint64_t v3 = *MEMORY[0x263F77E28];
  v120[0] = *MEMORY[0x263F78170];
  uint64_t v2 = v120[0];
  v120[1] = v3;
  v121[0] = @"DownloadingSU";
  v121[1] = @"DownloadSU";
  v45 = [NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];
  v122[1] = @"RemoveUpdate";
  v123[0] = v45;
  v118[0] = v2;
  v118[1] = v3;
  v119[0] = @"RemovingUpdate";
  v119[1] = @"RemoveUpdate";
  objc_super v44 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
  v123[1] = v44;
  v43 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
  v125[0] = v43;
  v124[1] = @"DownloadingSU";
  v116[0] = @"DownloadUpdate";
  uint64_t v114 = v3;
  uint64_t v115 = *MEMORY[0x263F78148];
  uint64_t v4 = v115;
  v42 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
  v117[0] = v42;
  v116[1] = @"RemoveUpdate";
  v112[0] = v2;
  v112[1] = v3;
  v113[0] = @"RemovingUpdate";
  v113[1] = @"RemoveUpdate";
  v41 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
  v117[1] = v41;
  v116[2] = @"DownloadSucceeded";
  v110[0] = v2;
  v110[1] = v3;
  v111[0] = @"DownloadingSplat";
  v111[1] = @"DownloadSplat";
  v40 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];
  v117[2] = v40;
  v116[3] = @"DownloadFailed";
  v108[0] = v2;
  v108[1] = v3;
  v109[0] = @"Idle";
  v109[1] = @"ReportUpdateFailedToDownload";
  v39 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
  v117[3] = v39;
  v116[4] = @"DownloadProgress";
  uint64_t v106 = v3;
  v107 = @"ReportDownloadProgress";
  v38 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
  v117[4] = v38;
  v116[5] = @"DownloadStalled";
  uint64_t v104 = v3;
  v105 = @"ReportDownloadStalled";
  v37 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
  v117[5] = v37;
  v36 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:6];
  v125[1] = v36;
  v124[2] = @"DownloadingSplat";
  v102[0] = @"DownloadUpdate";
  uint64_t v100 = v3;
  uint64_t v101 = v4;
  id v35 = [NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
  v103[0] = v35;
  v102[1] = @"RemoveUpdate";
  v98[0] = v2;
  v98[1] = v3;
  v99[0] = @"RemovingUpdate";
  v99[1] = @"RemoveUpdate";
  v34 = [NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
  v103[1] = v34;
  v102[2] = @"DownloadSucceeded";
  v96[0] = v2;
  v96[1] = v3;
  v97[0] = @"DownloadingPSUSAssets";
  v97[1] = @"DownloadPSUSAssets";
  v33 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
  v103[2] = v33;
  v102[3] = @"OperationSkipped";
  v94[0] = v2;
  v94[1] = v3;
  v95[0] = @"DownloadingPSUSAssets";
  v95[1] = @"DownloadPSUSAssets";
  v32 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
  v103[3] = v32;
  v102[4] = @"DownloadFailed";
  v92[0] = v2;
  v92[1] = v3;
  v93[0] = @"Idle";
  v93[1] = @"ReportUpdateFailedToDownload";
  v31 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
  v103[4] = v31;
  v102[5] = @"DownloadProgress";
  uint64_t v90 = v3;
  v91 = @"ReportDownloadProgress";
  v30 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  v103[5] = v30;
  v102[6] = @"DownloadStalled";
  uint64_t v88 = v3;
  v89 = @"ReportDownloadStalled";
  v29 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  v103[6] = v29;
  v28 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:7];
  v125[2] = v28;
  v124[3] = @"DownloadingPSUSAssets";
  v86[0] = @"DownloadUpdate";
  uint64_t v84 = v3;
  uint64_t v85 = v4;
  v27 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  v87[0] = v27;
  v86[1] = @"RemoveUpdate";
  v82[0] = v2;
  v82[1] = v3;
  v83[0] = @"RemovingUpdate";
  v83[1] = @"RemoveUpdate";
  v26 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
  v87[1] = v26;
  v86[2] = @"DownloadSucceeded";
  v80[0] = v2;
  v80[1] = v3;
  v81[0] = @"Downloaded";
  v81[1] = @"ReportUpdateDownloaded";
  v25 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  v87[2] = v25;
  v86[3] = @"OperationSkipped";
  v78[0] = v2;
  v78[1] = v3;
  v79[0] = @"Downloaded";
  v79[1] = @"ReportUpdateDownloaded";
  v24 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
  v87[3] = v24;
  v86[4] = @"DownloadFailed";
  v76[0] = v2;
  v76[1] = v3;
  v77[0] = @"Idle";
  v77[1] = @"ReportUpdateFailedToDownload";
  v23 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
  v87[4] = v23;
  v86[5] = @"DownloadProgress";
  uint64_t v74 = v3;
  v75 = @"ReportDownloadProgress";
  v22 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  v87[5] = v22;
  v86[6] = @"DownloadStalled";
  uint64_t v72 = v3;
  v73 = @"ReportDownloadStalled";
  v21 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v87[6] = v21;
  v20 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:7];
  v125[3] = v20;
  v124[4] = @"Downloaded";
  v70[0] = @"DownloadUpdate";
  uint64_t v68 = v3;
  v69 = @"ReportUpdateDownloaded";
  v19 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v71[0] = v19;
  v70[1] = @"RemoveUpdate";
  v66[0] = v2;
  v66[1] = v3;
  v67[0] = @"RemovingUpdate";
  v67[1] = @"RemoveUpdate";
  v18 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
  v71[1] = v18;
  v17 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  v125[4] = v17;
  v124[5] = @"RemovingUpdate";
  uint64_t v63 = v4;
  v64[0] = @"DownloadUpdate";
  uint64_t v62 = v3;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  v65[0] = v16;
  v64[1] = @"RemoveUpdate";
  uint64_t v60 = v3;
  uint64_t v61 = v4;
  id v5 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v65[1] = v5;
  v64[2] = @"RemoveSucceeded";
  uint64_t v58 = v3;
  v59 = @"CheckRemoveCompleted";
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v65[2] = v6;
  v64[3] = @"RemoveFailed";
  uint64_t v56 = v3;
  v57 = @"CheckRemoveCompleted";
  id v7 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v65[3] = v7;
  v64[4] = @"DownloadSucceeded";
  uint64_t v54 = v3;
  v55 = @"CheckRemoveCompleted";
  id v8 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v65[4] = v8;
  v64[5] = @"DownloadFailed";
  uint64_t v52 = v3;
  v53 = @"CheckRemoveCompleted";
  id v9 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v65[5] = v9;
  v64[6] = @"DownloadProgress";
  uint64_t v50 = v3;
  uint64_t v51 = v4;
  id v10 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v65[6] = v10;
  v64[7] = @"DownloadStalled";
  uint64_t v48 = v3;
  uint64_t v49 = v4;
  v11 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v65[7] = v11;
  v64[8] = @"RemoveCompleted";
  v46[0] = v2;
  v46[1] = v3;
  v47[0] = @"Idle";
  v47[1] = @"ReportUpdateRemoved";
  v12 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  v65[8] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:9];
  v125[5] = v13;
  __int16 v14 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:6];

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = [(SUCoreUpdateDownloader *)self downloadFSM];
  __int16 v14 = [v13 extendedStateQueue];
  dispatch_assert_queue_V2(v14);

  if ([v11 isEqualToString:*MEMORY[0x263F78148]])
  {
    int64_t v15 = 0;
  }
  else
  {
    if ([v11 isEqualToString:@"DownloadSU"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionDownloadSU:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"DownloadSplat"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionDownloadSplat:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"DownloadPSUSAssets"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionDownloadPSUSAssets:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportUpdateDownloaded"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportUpdateDownloaded:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportUpdateFailedToDownload"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportUpdateFailedToDownload:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadStalled"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportDownloadStalled:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadProgress"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportDownloadProgress:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"RemoveUpdate"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionRemoveUpdate:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CheckRemoveCompleted"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionCheckRemoveCompleted:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportUpdateRemoved"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportUpdateRemoved:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportUpdateFailedToRemove"])
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionReportUpdateFailedToRemove:v12 error:a8];
    }
    else
    {
      int64_t v16 = [(SUCoreUpdateDownloader *)self actionUnknownAction:v11 error:a8];
    }
    int64_t v15 = v16;
  }

  return v15;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v9 = [v8 diag];
  id v10 = (void *)[[NSString alloc] initWithFormat:@"%@ unknown action(%@)", self, v5];

  [v9 dumpTracked:v10 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  return 8102;
}

- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUCoreUpdateDownloader *)self setShouldReportDownloadFailureIfCanceled:1];
  [(SUCoreUpdateDownloader *)self setTotalWrittenBytesUpToLastPhase:0];
  [(SUCoreUpdateDownloader *)self setTotalToWriteBytesForPhase:0];
  id v7 = objc_alloc(MEMORY[0x263F77E08]);
  uint64_t v8 = *MEMORY[0x263F781A0];
  id v9 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  id v10 = objc_msgSend(v7, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:", v8, 0, 0, objc_msgSend(v9, "downloadSize"), 0.0, -1.0);
  [(SUCoreUpdateDownloader *)self setUnifiedProgress:v10];

  id v11 = [(SUCoreUpdateDownloader *)self maControl];

  if (v11)
  {
    id v12 = [(SUCoreUpdateDownloader *)self updateDescriptor];
    -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", [v12 suDownloadSize]);

    [(SUCoreUpdateDownloader *)self _trackBegin:@"downloadSoftwareUpdateAssetWithPolicy" withIdentifier:@"su"];
    uint64_t v13 = [(SUCoreUpdateDownloader *)self maControl];
    __int16 v14 = [(SUCoreUpdateDownloader *)self policy];
    int64_t v15 = [(SUCoreUpdateDownloader *)self updateUUID];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke;
    v22[3] = &unk_2640DCC58;
    v22[4] = self;
    [v13 downloadSoftwareUpdateAssetWithPolicy:v14 withUUID:v15 completion:v22];

    return 0;
  }
  else
  {
    v17 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v16 = 8116;
    v18 = [v17 buildError:8116 underlying:0 description:@"unexpected no maControl when trying to download SU"];

    [(SUCoreUpdateDownloader *)self _trackAnomaly:@"[DOWNLOAD_SU]" reason:@"unexpected no maControl when trying to download SU" result:8116 error:v18];
    v19 = [(SUCoreUpdateDownloader *)self downloadFSM];
    v20 = [[SUCoreUpdateDownloaderParam alloc] initWithError:v18];
    [v19 followupEvent:@"DownloadFailed" withInfo:v20];
  }
  return v16;
}

void __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) downloadFSM];
  id v5 = [v4 extendedStateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke_2;
  v7[3] = &unk_2640DCE98;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"downloadSoftwareUpdateAssetWithPolicy", @"su", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  if (v2)
  {
    id v3 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
    uint64_t v4 = @"DownloadFailed";
  }
  else
  {
    id v3 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    uint64_t v4 = @"DownloadSucceeded";
  }
  [v5 postProtectedEvent:v4 withInfo:v3];
}

- (int64_t)actionDownloadSplat:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUCoreUpdateDownloader *)self shouldDownloadSplat])
  {
    id v7 = [(SUCoreUpdateDownloader *)self maControlSplombo];

    if (!v7)
    {
      __int16 v14 = [MEMORY[0x263F77D78] sharedCore];
      int64_t v13 = 8116;
      int64_t v15 = [v14 buildError:8116 underlying:0 description:@"unexpected no maControlSplombo when tyring to download Splat"];

      [(SUCoreUpdateDownloader *)self _trackAnomaly:@"[DOWNLOAD_SPLAT]" reason:@"unexpected no maControlSplombo when tyring to download Splat" result:8116 error:v15];
      int64_t v16 = [(SUCoreUpdateDownloader *)self downloadFSM];
      v17 = [[SUCoreUpdateDownloaderParam alloc] initWithError:v15];
      [v16 followupEvent:@"DownloadFailed" withInfo:v17];

      return v13;
    }
    [(SUCoreUpdateDownloader *)self setTotalWrittenBytesUpToLastPhase:[(SUCoreUpdateDownloader *)self totalWrittenBytesUpToLastPhase]+ [(SUCoreUpdateDownloader *)self totalToWriteBytesForPhase]];
    id v8 = [(SUCoreUpdateDownloader *)self updateDescriptor];
    id v9 = [v8 associatedSplatDescriptor];
    -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", [v9 downloadSize]);

    [(SUCoreUpdateDownloader *)self _trackBegin:@"downloadSoftwareUpdateAssetWithPolicy" withIdentifier:@"splat"];
    id v10 = [(SUCoreUpdateDownloader *)self maControlSplombo];
    id v11 = [(SUCoreUpdateDownloader *)self policy];
    id v12 = [(SUCoreUpdateDownloader *)self updateUUID];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__SUCoreUpdateDownloader_actionDownloadSplat_error___block_invoke;
    v19[3] = &unk_2640DCC58;
    v19[4] = self;
    [v10 downloadSoftwareUpdateAssetWithPolicy:v11 withUUID:v12 completion:v19];
  }
  else
  {
    [(SUCoreUpdateDownloader *)self _skipCurrentOperationFor:@"[Splombo] No splat to download; skip downloading splat"];
  }
  return 0;
}

void __52__SUCoreUpdateDownloader_actionDownloadSplat_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) downloadFSM];
  id v5 = [v4 extendedStateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SUCoreUpdateDownloader_actionDownloadSplat_error___block_invoke_2;
  v7[3] = &unk_2640DCE98;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __52__SUCoreUpdateDownloader_actionDownloadSplat_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"downloadSoftwareUpdateAssetWithPolicy", @"splat", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  if (v2)
  {
    id v3 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
    uint64_t v4 = @"DownloadFailed";
  }
  else
  {
    id v3 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    uint64_t v4 = @"DownloadSucceeded";
  }
  [v5 postProtectedEvent:v4 withInfo:v3];
}

- (int64_t)actionDownloadPSUSAssets:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [MEMORY[0x263EFF980] array];
  if (![(SUCoreUpdateDownloader *)self _isPreSUStagingEnabled])
  {
    id v10 = @"[PreSUStaging] disabled; skip downloading assets";
LABEL_15:
    [(SUCoreUpdateDownloader *)self _skipCurrentOperationFor:v10];
    goto LABEL_16;
  }
  id v8 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  uint64_t v9 = [v8 preSUStagingRequiredSize];

  if (v9)
  {
    [v7 addObject:@"STAGE_GROUP_REQUIRED"];
  }
  else
  {
    id v11 = [MEMORY[0x263F77DE8] sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = [NSString stringWithFormat:@"[PreSUStaging] No required assets to stage"];
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
  if ([(SUCoreUpdateDownloader *)self _shouldStageOptionalPSUSAssets]) {
    [v7 addObject:@"STAGE_GROUP_OPTIONAL"];
  }
  if (![v7 count])
  {
    id v10 = @"[PreSUStaging] No assets to download; skip downloading assets";
    goto LABEL_15;
  }
  __int16 v14 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v15 = [v14 oslog];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v16 = [NSString stringWithFormat:@"[PreSUStaging] PSUS groups to stage: %@", v7];
    *(_DWORD *)buf = 138543618;
    v33 = self;
    __int16 v34 = 2114;
    id v35 = v16;
    _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
  [(SUCoreUpdateDownloader *)self setTotalWrittenBytesUpToLastPhase:[(SUCoreUpdateDownloader *)self totalWrittenBytesUpToLastPhase]+ [(SUCoreUpdateDownloader *)self totalToWriteBytesForPhase]];
  v17 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", [v17 preSUStagingRequiredSize]);

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke;
  v31[3] = &unk_2640DD558;
  v31[4] = self;
  v18 = (void *)MEMORY[0x210550B20](v31);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_431;
  v30[3] = &unk_2640DD580;
  v30[4] = self;
  v19 = (void *)MEMORY[0x210550B20](v30);
  v20 = [MEMORY[0x263EFF9A0] dictionary];
  v21 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  v22 = [v21 productVersion];
  [v20 setSafeObject:v22 forKey:@"OSVersion"];

  v23 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  v24 = [v23 productBuildVersion];
  [v20 setSafeObject:v24 forKey:@"Build"];

  v25 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  v26 = [v25 trainName];
  [v20 setSafeObject:v26 forKey:@"TrainName"];

  v27 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  v28 = [v27 restoreVersion];
  [v20 setSafeObject:v28 forKey:@"RestoreVersion"];

  [v20 setSafeObject:v7 forKey:@"GroupNames"];
  [(SUCoreUpdateDownloader *)self _reportPSUSStartedEvent];
  [(SUCoreUpdateDownloader *)self _trackBegin:@"stageDownloadGroups" withIdentifier:@"presustaging"];
  objc_msgSend(MEMORY[0x263F55960], "SUCoreBorder_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:", v20, 0, -1, v19, v18);

LABEL_16:
  return 0;
}

void __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(a1 + 32) downloadFSM];
  id v7 = [v6 extendedStateQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_2;
  v9[3] = &unk_2640DCE98;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"stageDownloadGroups", @"presustaging", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  [*(id *)(a1 + 32) _reportPSUSFinishedEvent:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    id v14 = [*(id *)(a1 + 32) downloadFSM];
    id v5 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    id v6 = @"DownloadSucceeded";
    goto LABEL_6;
  }
  id v3 = [v2 domain];
  if ([v3 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {
    uint64_t v4 = [*(id *)(a1 + 40) code];

    if (v4 == 6611)
    {
      id v14 = [*(id *)(a1 + 32) downloadFSM];
      id v5 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
      id v6 = @"DownloadFailed";
LABEL_6:
      [v14 postProtectedEvent:v6 withInfo:v5];

      return;
    }
  }
  else
  {
  }
  id v7 = [NSString stringWithFormat:@"download failed with %@, but this is non-fatal", *(void *)(a1 + 40)];
  id v8 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [NSString stringWithFormat:@"[PreSUStaging] %@", v7];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
  id v12 = [*(id *)(a1 + 32) downloadFSM];
  int64_t v13 = [[SUCoreUpdateDownloaderParam alloc] initWithNote:v7];
  [v12 postProtectedEvent:@"DownloadSucceeded" withInfo:v13];
}

void __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_431(uint64_t a1, void *a2, void *a3)
{
  id v21 = a3;
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackAnomaly:reason:result:error:", @"[DOWNLOAD_PSUS]", @"unexpected progress error", objc_msgSend(v21, "code"), v21);
  }
  else
  {
    id v5 = [a2 downloadProgress];
    id v6 = v5;
    if (v5)
    {
      float v7 = 0.0;
      if ([v5 totalWrittenBytes] >= 1 && objc_msgSend(v6, "totalExpectedBytes") >= 1)
      {
        float v8 = (float)[v6 totalWrittenBytes];
        float v7 = v8 / (float)[v6 totalExpectedBytes];
      }
      id v9 = objc_alloc(MEMORY[0x263F77E08]);
      uint64_t v10 = *MEMORY[0x263F781A0];
      uint64_t v11 = [v6 isStalled];
      uint64_t v12 = [v6 totalWrittenBytes];
      uint64_t v13 = [v6 totalExpectedBytes];
      [v6 expectedTimeRemainingSecs];
      double v15 = v14;
      uint64_t v16 = [v6 description];
      *(float *)&double v17 = v7;
      v18 = (void *)[v9 initWithPhase:v10 isStalled:v11 portionComplete:v12 totalWrittenBytes:v13 totalExpectedBytes:v16 remaining:v17 taskDescription:v15];

      uint64_t v19 = [*(id *)(a1 + 32) downloadFSM];
      v20 = [[SUCoreUpdateDownloaderParam alloc] initWithProgress:v18];
      [v19 postEvent:@"DownloadProgress" withInfo:v20];
    }
  }
}

- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  float v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 progress];

  id v9 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  [v9 setIsStalled:0];

  uint64_t v10 = [v8 totalWrittenBytes];
  unint64_t v11 = [(SUCoreUpdateDownloader *)self totalWrittenBytesUpToLastPhase] + v10;
  uint64_t v12 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  [v12 setTotalWrittenBytes:v11];

  uint64_t v13 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  uint64_t v14 = [v13 totalExpectedBytes];
  double v15 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  uint64_t v16 = v14 - [v15 totalWrittenBytes];

  uint64_t v17 = [v8 totalExpectedBytes];
  uint64_t v18 = [v8 totalWrittenBytes];
  if (v16 >= 1 && v17 - v18 >= 1)
  {
    double v19 = (double)v16 / (double)(v17 - v18);
    [v8 estimatedTimeRemaining];
    double v21 = v19 * v20;
    v22 = [(SUCoreUpdateDownloader *)self unifiedProgress];
    [v22 setEstimatedTimeRemaining:v21];
  }
  v23 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  double v24 = (double)[v23 totalWrittenBytes];
  uint64_t v25 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  *(float *)&double v24 = v24 / (double)[(id)v25 totalExpectedBytes];
  v26 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  LODWORD(v27) = LODWORD(v24);
  [v26 setPortionComplete:v27];

  v28 = [(SUCoreUpdateDownloader *)self delegate];
  LOBYTE(v25) = objc_opt_respondsToSelector();

  if (v25)
  {
    v29 = [(SUCoreUpdateDownloader *)self unifiedProgress];
    v30 = (void *)[v29 copy];

    v31 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke;
    block[3] = &unk_2640DCE98;
    block[4] = self;
    id v8 = v30;
    id v39 = v8;
    dispatch_async(v31, block);
  }
  else
  {
    v32 = [MEMORY[0x263F77DE8] sharedLogger];
    v33 = [v32 oslog];

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v34 = NSString;
      id v35 = [(SUCoreUpdateDownloader *)self unifiedProgress];
      uint64_t v36 = [v34 stringWithFormat:@"delegate does not respond to selector(downloadProgress:) so not reporting progress=%@", v35];
      *(_DWORD *)buf = 138543618;
      v41 = self;
      __int16 v42 = 2114;
      v43 = v36;
      _os_log_impl(&dword_20C8EA000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0;
}

void __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadProgress:*(void *)(a1 + 40)];
}

- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  float v7 = [(SUCoreUpdateDownloader *)self unifiedProgress];
  [v7 setIsStalled:1];

  id v8 = [(SUCoreUpdateDownloader *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke;
    block[3] = &unk_2640DC338;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = NSString;
      uint64_t v12 = [(SUCoreUpdateDownloader *)self unifiedProgress];
      uint64_t v13 = [v11 stringWithFormat:@"delegate does not respond to selector(downloadStalled:) so not reporting progress=%@", v12];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      double v19 = v13;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0;
}

void __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = [*(id *)(a1 + 32) unifiedProgress];
  [v3 downloadStalled:v2];
}

- (int64_t)actionReportUpdateDownloaded:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUCoreUpdateDownloader *)self _verifyNoPendingOperations:@"DOWNLOAD" reason:@"Should have no pending operations: UpdateDownloaded"];
  id v7 = objc_alloc(MEMORY[0x263F77E08]);
  LODWORD(v8) = 1.0;
  id v9 = (void *)[v7 initWithPhase:*MEMORY[0x263F781A0] isStalled:0 portionComplete:-1 totalWrittenBytes:-1 totalExpectedBytes:v8 remaining:0.0];
  [(SUCoreUpdateDownloader *)self setUnifiedProgress:v9];
  uint64_t v10 = [(SUCoreUpdateDownloader *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke;
    block[3] = &unk_2640DCE98;
    block[4] = self;
    id v18 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [NSString stringWithFormat:@"delegate does not respond to selector(downloaded:) so not reporting progress=%@", v9];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
  [(SUCoreUpdateDownloader *)self setShouldReportDownloadFailureIfCanceled:0];

  return 0;
}

void __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloaded:*(void *)(a1 + 40)];
}

- (void)_reportUpdateFailedToDownload:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUCoreUpdateDownloader *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SUCoreUpdateDownloader__reportUpdateFailedToDownload___block_invoke;
    block[3] = &unk_2640DCE98;
    block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    double v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSString stringWithFormat:@"delegate does not respond to selector(downloadedFailed:) so not reporting error=%@", v4];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
}

void __56__SUCoreUpdateDownloader__reportUpdateFailedToDownload___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadFailed:*(void *)(a1 + 40)];
}

- (int64_t)actionReportUpdateFailedToDownload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUCoreUpdateDownloader *)self _verifyNoPendingOperations:@"DOWNLOAD" reason:@"Should have no pending operations: UpdateFailedToDownload"];
  double v8 = [v5 error];

  [(SUCoreUpdateDownloader *)self _reportUpdateFailedToDownload:v8];
  [(SUCoreUpdateDownloader *)self setShouldReportDownloadFailureIfCanceled:0];
  return 0;
}

- (int64_t)actionRemoveUpdate:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  char v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SUCoreUpdateDownloader *)self maControl];

  if (v7)
  {
    [(SUCoreUpdateDownloader *)self _trackBegin:@"removeAsset" withIdentifier:@"su"];
    double v8 = [(SUCoreUpdateDownloader *)self maControl];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke;
    v28[3] = &unk_2640DCC58;
    v28[4] = self;
    [v8 removeAsset:v28];

    int64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v9 = 8116;
    char v11 = [v10 buildError:8116 underlying:0 description:@"unexpected no maControl when tyring to remove SU"];

    [(SUCoreUpdateDownloader *)self _trackAnomaly:@"[REMOVE_SU]" reason:@"unexpected no maControl when tyring to remove SU" result:8116 error:v11];
    id v12 = [(SUCoreUpdateDownloader *)self downloadFSM];
    uint64_t v13 = [[SUCoreUpdateDownloaderParam alloc] initWithError:v11];
    [v12 followupEvent:@"RemoveFailed" withInfo:v13];
  }
  if (![(SUCoreUpdateDownloader *)self shouldDownloadSplat])
  {
    uint64_t v16 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v15 = [v16 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [NSString stringWithFormat:@"[Splombo] No need to remove Splat (no Splat)"];
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v14 = [(SUCoreUpdateDownloader *)self maControlSplombo];

  if (v14)
  {
    [(SUCoreUpdateDownloader *)self _trackBegin:@"removeAsset" withIdentifier:@"splat"];
    __int16 v15 = [(SUCoreUpdateDownloader *)self maControlSplombo];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_494;
    v27[3] = &unk_2640DCC58;
    v27[4] = self;
    [v15 removeAsset:v27];
LABEL_9:

    goto LABEL_10;
  }
  v22 = [MEMORY[0x263F77D78] sharedCore];
  int64_t v9 = 8116;
  uint64_t v23 = [v22 buildError:8116 underlying:0 description:@"unexpected no maControlSplombo when tyring to remove Splat"];

  [(SUCoreUpdateDownloader *)self _trackAnomaly:@"[REMOVE_SPLAT]" reason:@"unexpected no maControlSplombo when tyring to remove Splat" result:8116 error:v23];
  double v24 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v25 = [[SUCoreUpdateDownloaderParam alloc] initWithError:v23];
  [v24 followupEvent:@"RemoveFailed" withInfo:v25];

LABEL_10:
  if ([(SUCoreUpdateDownloader *)self _isPreSUStagingEnabled])
  {
    [(SUCoreUpdateDownloader *)self _trackBegin:@"stagePurgeAll" withIdentifier:@"presustaging"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_3;
    v26[3] = &unk_2640DCC58;
    v26[4] = self;
    objc_msgSend(MEMORY[0x263F55960], "SUCoreBorder_stagePurgeAll:", v26);
  }
  else
  {
    id v18 = [MEMORY[0x263F77DE8] sharedLogger];
    double v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [NSString stringWithFormat:@"[PreSUStaging] No need to remove PSUS assets (disabled)"];
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
  return v9;
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) downloadFSM];
  id v5 = [v4 extendedStateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2;
  v7[3] = &unk_2640DCE98;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"removeAsset", @"su", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  if (v2)
  {
    id v3 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
    id v4 = @"RemoveFailed";
  }
  else
  {
    id v3 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    id v4 = @"RemoveSucceeded";
  }
  [v5 postProtectedEvent:v4 withInfo:v3];
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_494(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) downloadFSM];
  id v5 = [v4 extendedStateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2_495;
  v7[3] = &unk_2640DCE98;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2_495(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"removeAsset", @"splat", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  if (v2)
  {
    id v3 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
    id v4 = @"RemoveFailed";
  }
  else
  {
    id v3 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    id v4 = @"RemoveSucceeded";
  }
  [v5 postProtectedEvent:v4 withInfo:v3];
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) downloadFSM];
  id v5 = [v4 extendedStateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_4;
  v7[3] = &unk_2640DCE98;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_trackEnd:withIdentifier:withResult:withError:", @"stagePurgeAll", @"presustaging", objc_msgSend(*(id *)(a1 + 40), "code"), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) downloadFSM];
  if (v2)
  {
    id v3 = [[SUCoreUpdateDownloaderParam alloc] initWithError:*(void *)(a1 + 40)];
    id v4 = @"RemoveFailed";
  }
  else
  {
    id v3 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    id v4 = @"RemoveSucceeded";
  }
  [v5 postProtectedEvent:v4 withInfo:v3];
}

- (int64_t)actionCheckRemoveCompleted:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if (![(SUCoreUpdateDownloader *)self numPendingOperations])
  {
    id v7 = [(SUCoreUpdateDownloader *)self downloadFSM];
    id v8 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    [v7 followupEvent:@"RemoveCompleted" withInfo:v8];
  }
  return 0;
}

- (int64_t)actionReportUpdateRemoved:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  [(SUCoreUpdateDownloader *)self _verifyNoPendingOperations:@"REMOVE" reason:@"Should have no pending operations: UpdateRemoved"];
  id v7 = [(SUCoreUpdateDownloader *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke;
    block[3] = &unk_2640DC338;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    int64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSString stringWithFormat:@"delegate does not respond to selector(updateRemoved) so not reporting updateRemoved"];
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0;
}

void __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 updateRemoved];
}

- (int64_t)actionReportUpdateFailedToRemove:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  [(SUCoreUpdateDownloader *)self _verifyNoPendingOperations:@"REMOVE" reason:@"Should have no pending operations: UpdateFailedToRemove"];
  id v8 = [(SUCoreUpdateDownloader *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v9 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke;
    block[3] = &unk_2640DCE98;
    block[4] = self;
    id v17 = v5;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F77DE8] sharedLogger];
    char v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSString;
      uint64_t v13 = [v5 error];
      uint64_t v14 = [v12 stringWithFormat:@"delegate does not respond to selector(updateRemoveFailed:) so not reporting error=%@", v13];
      *(_DWORD *)buf = 138543618;
      double v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v14;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0;
}

void __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 40) error];
  [v3 updateRemoveFailed:v2];
}

- (void)maDownloadProgress:(id)a3
{
  id v4 = a3;
  id v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v5 = [[SUCoreUpdateDownloaderParam alloc] initWithProgress:v4];

  [v6 postEvent:@"DownloadProgress" withInfo:v5];
}

- (void)maDownloadStalled:(id)a3
{
  id v4 = a3;
  id v6 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v5 = [[SUCoreUpdateDownloaderParam alloc] initWithProgress:v4];

  [v6 postEvent:@"DownloadStalled" withInfo:v5];
}

- (void)maAnomaly:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", @"[MA_ANOMALY]", @"maAnomaly called", [v4 code], v4);
}

- (id)_createEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setSafeObject:v4 forKey:*MEMORY[0x263F780B0]];

  id v8 = [(SUCoreUpdateDownloader *)self updateUUID];
  [v7 setSafeObject:v8 forKey:*MEMORY[0x263F78130]];

  int64_t v9 = objc_alloc_init(SUCoreEventAugmenter);
  uint64_t v10 = [(SUCoreUpdateDownloader *)self policy];
  [(SUCoreEventAugmenter *)v9 setPolicy:v10];

  char v11 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  [(SUCoreEventAugmenter *)v9 setPrimaryDescriptor:v11];

  [(SUCoreEventAugmenter *)v9 augmentEvent:v7];

  return v7;
}

- (void)_reportPSUSStartedEvent
{
  id v3 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUCoreUpdateDownloader *)self _createEvent:*MEMORY[0x263F78108]];
  [v5 setSafeObject:*MEMORY[0x263F780C8] forKey:*MEMORY[0x263F780B8]];
  id v6 = [MEMORY[0x263F77D78] sharedCore];
  uint64_t v7 = [v6 miscellaneousTaksQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUCoreUpdateDownloader__reportPSUSStartedEvent__block_invoke;
  block[3] = &unk_2640DC338;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __49__SUCoreUpdateDownloader__reportPSUSStartedEvent__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F77DC0] sharedReporter];
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_reportPSUSFinishedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUCoreUpdateDownloader *)self _createEvent:*MEMORY[0x263F78100]];
  id v8 = v7;
  if (v4) {
    [MEMORY[0x263F77DC0] augmentEvent:v7 withError:v4];
  }
  else {
    [v7 setSafeObject:*MEMORY[0x263F780C8] forKey:*MEMORY[0x263F780B8]];
  }
  int64_t v9 = [MEMORY[0x263F77D78] sharedCore];
  id v10 = [v9 miscellaneousTaksQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUCoreUpdateDownloader__reportPSUSFinishedEvent___block_invoke;
  block[3] = &unk_2640DC338;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, block);
}

void __51__SUCoreUpdateDownloader__reportPSUSFinishedEvent___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F77DC0] sharedReporter];
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_verifyNoPendingOperations:(id)a3 reason:(id)a4
{
  id v12 = (__CFString *)a3;
  id v6 = a4;
  uint64_t v7 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v8 = [v7 extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  if ([(SUCoreUpdateDownloader *)self numPendingOperations])
  {
    int64_t v9 = v12;
    if (!v12) {
      int64_t v9 = @"UNK_LOC";
    }
    id v12 = v9;
    id v10 = [(SUCoreUpdateDownloader *)self downloadFSM];
    id v11 = [v10 diag];
    [v11 trackAnomaly:v12 forReason:v6 withResult:8117 withError:0];
  }
}

- (void)_trackBegin:(id)a3 withIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreUpdateDownloader *)self downloadFSM];
  int64_t v9 = [v8 extendedStateQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(SUCoreUpdateDownloader *)self downloadFSM];
  id v11 = [v10 diag];
  id v12 = [(SUCoreUpdateDownloader *)self _versionedModuleName];
  [v11 trackBegin:v6 atLevel:1 forModule:v12 withIdentifier:v7];

  [(SUCoreUpdateDownloader *)self setNumPendingOperations:[(SUCoreUpdateDownloader *)self numPendingOperations] + 1];
  id v13 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [NSString stringWithFormat:@"incremented the number of pending operations (%d): %@ (%@) has begun", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v6, v7];
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    double v19 = v15;
    _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
}

- (void)_trackEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v14 = [v13 extendedStateQueue];
  dispatch_assert_queue_V2(v14);

  __int16 v15 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v16 = [v15 diag];
  id v17 = [(SUCoreUpdateDownloader *)self _versionedModuleName];
  [v16 trackEnd:v10 atLevel:1 forModule:v17 withIdentifier:v11 withResult:a5 withError:v12];

  if ([(SUCoreUpdateDownloader *)self numPendingOperations] < 1)
  {
    double v19 = [NSString stringWithFormat:@"invalid numPendingOperations (%d) when %@ (%@) ends", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v10, v11];
    __int16 v21 = [(SUCoreUpdateDownloader *)self downloadFSM];
    uint64_t v22 = [v21 diag];
    [v22 trackAnomaly:@"[TRACK_END]" forReason:v19 withResult:8117 withError:0];
  }
  else
  {
    [(SUCoreUpdateDownloader *)self setNumPendingOperations:[(SUCoreUpdateDownloader *)self numPendingOperations] - 1];
    __int16 v18 = [MEMORY[0x263F77DE8] sharedLogger];
    double v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [NSString stringWithFormat:@"decremented the number of pending operations (%d): %@ (%@) has ended", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v10, v11];
      *(_DWORD *)buf = 138543618;
      double v24 = self;
      __int16 v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
}

- (void)_trackAnomaly:(id)a3 reason:(id)a4 result:(int64_t)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SUCoreUpdateDownloader *)self downloadFSM];
  uint64_t v14 = [v13 diag];
  [v14 trackAnomaly:v12 forReason:v11 withResult:a5 withError:v10];

  __int16 v15 = [(SUCoreUpdateDownloader *)self delegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v16 = [(SUCoreUpdateDownloader *)self delegateCallBackQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke;
    v17[3] = &unk_2640DCE98;
    v17[4] = self;
    id v18 = v10;
    dispatch_async(v16, v17);
  }
}

void __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 anomaly:*(void *)(a1 + 40)];
}

- (BOOL)_isPreSUStagingEnabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  id v4 = [(SUCoreUpdateDownloader *)self policy];
  id v12 = 0;
  BOOL v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:v3 policy:v4 reason:&v12];
  id v6 = v12;

  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = @"disabled";
    if (v5) {
      int64_t v9 = @"enabled";
    }
    id v10 = [NSString stringWithFormat:@"[PreSUStaging] %@: %@", v9, v6];
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
  return v5;
}

- (BOOL)_shouldStageOptionalPSUSAssets
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  uint64_t v4 = [v3 preSUStagingOptionalSize];

  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x263F77DE8] sharedLogger];
    id v10 = [v14 oslog];

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v15 = [NSString stringWithFormat:@"[PreSUStaging] no optional assets to stage"];
    int v18 = 138543618;
    double v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v15;
LABEL_13:
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v18, 0x16u);

    goto LABEL_14;
  }
  BOOL v5 = [(SUCoreUpdateDownloader *)self updateDescriptor];
  char v6 = [v5 enablePreSUStagingForOptionalAssets];

  if ((v6 & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x263F77DE8] sharedLogger];
    id v10 = [v16 oslog];

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v15 = [NSString stringWithFormat:@"[PreSUStaging] staging optional assets is disabled by server (through the update)"];
    int v18 = 138543618;
    double v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v15;
    goto LABEL_13;
  }
  id v7 = [(SUCoreUpdateDownloader *)self policy];
  char v8 = [v7 enablePreSUStagingForOptionalAssets];

  int64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
  id v10 = [v9 oslog];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v11)
    {
      __int16 v15 = [NSString stringWithFormat:@"[PreSUStaging] staging optional assets is disabled by policy"];
      int v18 = 138543618;
      double v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v15;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  if (v11)
  {
    id v12 = [NSString stringWithFormat:@"[PreSUStaging] should stage optional assets"];
    int v18 = 138543618;
    double v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v12;
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v18, 0x16u);
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (void)_skipCurrentOperationFor:(id)a3
{
  id v4 = a3;
  char v6 = [[SUCoreUpdateDownloaderParam alloc] initWithNote:v4];

  BOOL v5 = [(SUCoreUpdateDownloader *)self downloadFSM];
  [v5 followupEvent:@"OperationSkipped" withInfo:v6];
}

- (id)_versionedModuleName
{
  return (id)[NSString stringWithFormat:@"%@[%@]", @"update_downloader", @"1.0.2"];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(SUCoreUpdateDownloader *)self _versionedModuleName];
  BOOL v5 = [(SUCoreUpdateDownloader *)self updateUUID];
  char v6 = [v3 stringWithFormat:@"%@(%@)]", v4, v5];

  return (NSString *)v6;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (SUCoreUpdateDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUCoreUpdateDownloaderDelegate *)WeakRetained;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)downloadFSM
{
  return self->_downloadFSM;
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (SUCoreMobileAsset)maControlSplombo
{
  return self->_maControlSplombo;
}

- (BOOL)shouldDownloadSplat
{
  return self->_shouldDownloadSplat;
}

- (SUCoreProgress)unifiedProgress
{
  return self->_unifiedProgress;
}

- (void)setUnifiedProgress:(id)a3
{
}

- (unint64_t)totalToWriteBytesForPhase
{
  return self->_totalToWriteBytesForPhase;
}

- (void)setTotalToWriteBytesForPhase:(unint64_t)a3
{
  self->_totalToWriteBytesForPhase = a3;
}

- (unint64_t)totalWrittenBytesUpToLastPhase
{
  return self->_totalWrittenBytesUpToLastPhase;
}

- (void)setTotalWrittenBytesUpToLastPhase:(unint64_t)a3
{
  self->_totalWrittenBytesUpToLastPhase = a3;
}

- (OS_dispatch_queue)delegateCallBackQueue
{
  return self->_delegateCallBackQueue;
}

- (int)numPendingOperations
{
  return self->_numPendingOperations;
}

- (void)setNumPendingOperations:(int)a3
{
  self->_numPendingOperations = a3;
}

- (BOOL)shouldReportDownloadFailureIfCanceled
{
  return self->_shouldReportDownloadFailureIfCanceled;
}

- (void)setShouldReportDownloadFailureIfCanceled:(BOOL)a3
{
  self->_shouldReportDownloadFailureIfCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallBackQueue, 0);
  objc_storeStrong((id *)&self->_unifiedProgress, 0);
  objc_storeStrong((id *)&self->_maControlSplombo, 0);
  objc_storeStrong((id *)&self->_maControl, 0);
  objc_storeStrong((id *)&self->_downloadFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateDescriptor, 0);

  objc_storeStrong((id *)&self->_policy, 0);
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = [NSString stringWithFormat:@"init: failed to create the FSM"];
  int v3 = 138543362;
  id v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_20C8EA000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [NSString stringWithFormat:@"init: invalid udpate descriptor, descriptor type of splat (%ld) invalid", objc_msgSend(a1, "descriptorType")];
  int v4 = 138543362;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_20C8EA000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.3(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [NSString stringWithFormat:@"init: invalid udpate descriptor, descriptor type (%ld) invalid", objc_msgSend(a1, "descriptorType")];
  int v4 = 138543362;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_20C8EA000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.4()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = [NSString stringWithFormat:@"init: invalid param, update and updateUUID must be nonnull"];
  int v3 = 138543362;
  int v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_20C8EA000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);
}

@end