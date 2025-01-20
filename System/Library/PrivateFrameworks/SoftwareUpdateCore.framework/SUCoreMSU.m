@interface SUCoreMSU
+ (id)commitStash:(id)a3;
- (BOOL)applyProgressFinal;
- (BOOL)cancelingPrepare;
- (BOOL)performingOperation;
- (BOOL)prepareProgressFinal;
- (BOOL)removingPrepared;
- (MSUUpdateBrainAssetLoader)brainLoader;
- (NSString)applyProgressActionText;
- (NSString)descriptionName;
- (NSString)updateUUID;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)msuControlQueue;
- (OS_dispatch_queue)msuOperationQueue;
- (OS_os_transaction)applyUpdateTransaction;
- (OS_os_transaction)cancelPrepareTransaction;
- (OS_os_transaction)loadBrainTransaction;
- (OS_os_transaction)preflightDownloadSUTransaction;
- (OS_os_transaction)preflightFDRRecoveryTransaction;
- (OS_os_transaction)preflightPersonalizeTransaction;
- (OS_os_transaction)preflightPrerequisiteCheckTransaction;
- (OS_os_transaction)preflightWakeupTransaction;
- (OS_os_transaction)prepareUpdateTransaction;
- (OS_os_transaction)removePreparedTransaction;
- (OS_os_transaction)resumeUpdateTransaction;
- (OS_os_transaction)rollbackUpdateTransaction;
- (OS_os_transaction)suspendUpdateTransaction;
- (SUCoreDescriptor)updateDescriptor;
- (SUCoreMSU)initWithDelegate:(id)a3;
- (SUCoreMSU)initWithDelegate:(id)a3 withCallbackQueue:(id)a4;
- (SUCoreRollbackDescriptor)rollbackDescriptor;
- (float)nextProgressThreshold;
- (id)_newMSUOptionsUsingPolicy:(id)a3 descriptor:(id)a4 baseOptions:(id)a5;
- (id)_newMSURollbackOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4 baseOptions:(id)a5 additionalOptions:(id)a6;
- (id)_newPreflightOptionsUsingPolicy:(id)a3 subPolicyClass:(Class)a4 descriptor:(id)a5 baseOptions:(id)a6 additionalOptions:(id)a7;
- (id)_newPrepareOptionsUsingPolicy:(id)a3 descriptor:(id)a4;
- (id)_newRollbackPrepareOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4;
- (id)doNotPatchList;
- (id)msuDelegate;
- (int)applyProgress:(__CFDictionary *)a3;
- (int)prepareProgress:(__CFDictionary *)a3;
- (int64_t)msuHandle;
- (void)_addRemoteServerAccessControlToMSUOptions:(id)a3 usingPolicy:(id)a4;
- (void)_addUpdateMetricsEventFieldsToMSUOptions:(id)a3 usingPolicy:(id)a4 descriptor:(id)a5;
- (void)_addUpdateMetricsEventFieldsToMSURollbackOptions:(id)a3 usingPolicy:(id)a4 rollbackDescriptor:(id)a5;
- (void)_operationApplyUpdate:(id)a3;
- (void)_operationLoadBrain:(id)a3;
- (void)_operationPreflightFDRRecovery:(id)a3;
- (void)_operationPreflightPersonalize:(id)a3;
- (void)_operationPreflightPrerequisiteCheck:(id)a3;
- (void)_operationPreflightSUDownload:(id)a3;
- (void)_operationPreflightWakeup:(id)a3;
- (void)_operationPrepareUpdate:(id)a3;
- (void)_operationResumeUpdate:(id)a3;
- (void)_operationRollbackUpdateApply:(id)a3;
- (void)_operationRollbackUpdatePrepare:(id)a3;
- (void)_operationRollbackUpdateResume:(id)a3;
- (void)_operationRollbackUpdateSuspend:(id)a3;
- (void)_operationSuspendUpdate;
- (void)_removePrepared;
- (void)_reportAnomaly:(id)a3;
- (void)_reportApplied;
- (void)_reportApplyFailed:(id)a3;
- (void)_reportApplyProgress:(id)a3;
- (void)_reportBrainLoadFailed:(id)a3;
- (void)_reportBrainLoadProgress:(id)a3;
- (void)_reportBrainLoadStalled:(id)a3;
- (void)_reportBrainLoaded:(id)a3;
- (void)_reportFDRRecoveryPreflightFailed:(id)a3;
- (void)_reportFDRRecoveryPreflighted;
- (void)_reportPersonalizePreflightFailed:(id)a3;
- (void)_reportPersonalizePreflighted;
- (void)_reportPrepareFailed:(id)a3;
- (void)_reportPrepareProgress:(id)a3;
- (void)_reportPrepared:(id)a3;
- (void)_reportPrerequisiteCheckPreflightFailed:(id)a3;
- (void)_reportPrerequisiteCheckPreflighted;
- (void)_reportRemoveFailed:(id)a3;
- (void)_reportRemoved;
- (void)_reportResumeFailed:(id)a3;
- (void)_reportResumed;
- (void)_reportRollbackApplyFailed:(id)a3;
- (void)_reportRollbackApplySuccess;
- (void)_reportRollbackFailed:(id)a3;
- (void)_reportRollbackPrepareSuccess;
- (void)_reportRollbackResumeSuccess;
- (void)_reportRollbackSuspendSuccess;
- (void)_reportSUDownloadPreflightFailed:(id)a3;
- (void)_reportSUDownloadPreflighted;
- (void)_reportSuspendFailed:(id)a3;
- (void)_reportSuspended;
- (void)_reportWakeupPreflightFailed:(id)a3;
- (void)_reportWakeupPreflighted;
- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5;
- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5 underlying:(id)a6;
- (void)_trackMSUBegin:(id)a3;
- (void)_trackMSUEnd:(id)a3;
- (void)_trackMSUEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)_trackMSUOptions:(id)a3 optionsName:(id)a4 withMSUOptions:(id)a5;
- (void)applyUpdate:(id)a3;
- (void)assignDescriptor:(id)a3 updateUUID:(id)a4;
- (void)assignRollbackDescriptor:(id)a3 updateUUID:(id)a4;
- (void)cancelPrepare;
- (void)loadBrain:(id)a3;
- (void)loadBrainProgress:(id)a3 error:(id)a4;
- (void)preflightDownloadSU:(id)a3;
- (void)preflightFDRRecovery:(id)a3;
- (void)preflightPersonalize:(id)a3;
- (void)preflightPrerequisiteCheck:(id)a3;
- (void)preflightWakeup:(id)a3;
- (void)prepareUpdate:(id)a3;
- (void)removePrepared;
- (void)resumeUpdate;
- (void)resumeUpdate:(id)a3;
- (void)rollbackUpdateApply:(id)a3;
- (void)rollbackUpdatePrepare:(id)a3;
- (void)rollbackUpdateResume:(id)a3;
- (void)rollbackUpdateSuspend:(id)a3;
- (void)setApplyProgressActionText:(id)a3;
- (void)setApplyProgressFinal:(BOOL)a3;
- (void)setApplyUpdateTransaction:(id)a3;
- (void)setBrainLoader:(id)a3;
- (void)setCancelPrepareTransaction:(id)a3;
- (void)setCancelingPrepare:(BOOL)a3;
- (void)setDescriptionName:(id)a3;
- (void)setLoadBrainTransaction:(id)a3;
- (void)setMsuHandle:(int64_t)a3;
- (void)setNextProgressThreshold:(float)a3;
- (void)setPerformingOperation:(BOOL)a3;
- (void)setPreflightDownloadSUTransaction:(id)a3;
- (void)setPreflightFDRRecoveryTransaction:(id)a3;
- (void)setPreflightPersonalizeTransaction:(id)a3;
- (void)setPreflightPrerequisiteCheckTransaction:(id)a3;
- (void)setPreflightWakeupTransaction:(id)a3;
- (void)setPrepareProgressFinal:(BOOL)a3;
- (void)setPrepareUpdateTransaction:(id)a3;
- (void)setRemovePreparedTransaction:(id)a3;
- (void)setRemovingPrepared:(BOOL)a3;
- (void)setResumeUpdateTransaction:(id)a3;
- (void)setRollbackDescriptor:(id)a3;
- (void)setRollbackUpdateTransaction:(id)a3;
- (void)setSuspendUpdateTransaction:(id)a3;
- (void)setUpdateDescriptor:(id)a3;
- (void)setUpdateUUID:(id)a3;
- (void)suspendUpdate;
- (void)updatePrepareOptions:(id)a3 withPolicy:(id)a4;
@end

@implementation SUCoreMSU

- (SUCoreMSU)initWithDelegate:(id)a3
{
  return [(SUCoreMSU *)self initWithDelegate:a3 withCallbackQueue:0];
}

- (SUCoreMSU)initWithDelegate:(id)a3 withCallbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SUCoreMSU;
  v8 = [(SUCoreMSU *)&v35 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_msuDelegate, v6);
    updateUUID = v9->_updateUUID;
    v9->_updateUUID = 0;

    descriptionName = v9->_descriptionName;
    v9->_descriptionName = (NSString *)@"NotAssigned";

    updateDescriptor = v9->_updateDescriptor;
    v9->_updateDescriptor = 0;

    v9->_nextProgressThreshold = 0.0;
    *(_DWORD *)&v9->_performingOperation = 0;
    v9->_applyProgressFinal = 0;
    applyProgressActionText = v9->_applyProgressActionText;
    v9->_applyProgressActionText = 0;

    brainLoader = v9->_brainLoader;
    v9->_brainLoader = 0;

    v9->_msuHandle = 0;
    v15 = [MEMORY[0x263F77D78] sharedCore];
    v16 = [v15 commonDomain];

    id v17 = (id) [[NSString alloc] initWithFormat:@"%@.%@", v16, @"msu.control"];
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    msuControlQueue = v9->_msuControlQueue;
    v9->_msuControlQueue = (OS_dispatch_queue *)v20;

    if (v9->_msuControlQueue)
    {
      id v22 = (id) [[NSString alloc] initWithFormat:@"%@.%@", v16, @"msu.operation"];
      v23 = (const char *)[v22 UTF8String];
      v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
      msuOperationQueue = v9->_msuOperationQueue;
      v9->_msuOperationQueue = (OS_dispatch_queue *)v25;

      if (v9->_msuOperationQueue)
      {
        v27 = [MEMORY[0x263F77D78] sharedCore];
        uint64_t v28 = [v27 selectDelegateCallbackQueue:v7];
        clientDelegateCallbackQueue = v9->_clientDelegateCallbackQueue;
        v9->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v28;

        if (initWithDelegate_withCallbackQueue__msuErrorInfoOnce != -1) {
          dispatch_once(&initWithDelegate_withCallbackQueue__msuErrorInfoOnce, &__block_literal_global_10);
        }

        goto LABEL_7;
      }
      v31 = [MEMORY[0x263F77DA8] sharedDiag];
      v32 = v31;
      v33 = @"unable to create MSU operation dispatch queue";
    }
    else
    {
      v31 = [MEMORY[0x263F77DA8] sharedDiag];
      v32 = v31;
      v33 = @"unable to create MSU control dispatch queue";
    }
    [v31 trackError:@"[MSU]" forReason:v33 withResult:8100 withError:0];

    v30 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v30 = v9;
LABEL_11:

  return v30;
}

uint64_t __48__SUCoreMSU_initWithDelegate_withCallbackQueue___block_invoke()
{
  uint64_t v0 = *MEMORY[0x263F55A90];
  [MEMORY[0x263F77DB0] associateLayer:510 withDomain:*MEMORY[0x263F55A90] indicating:2 ifKeyTrue:@"MSUFullReplacementRecommened"];
  [MEMORY[0x263F77DB0] associateLayer:512 withDomain:@"com.apple.BuildInfo.preflight.error" indicating:8 ifKeyTrue:@"BIPreflightAlternateInstallerRecommended"];
  uint64_t v1 = *MEMORY[0x263F55A98];
  [MEMORY[0x263F77DB0] associateLayer:511 withDomain:*MEMORY[0x263F55A98]];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:1 codeName:@"MSU_ERR_BAD_SIGNATURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:2 codeName:@"MSU_ERR_PERSONALIZATION_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:3 codeName:@"MSU_ERR_FILESYSTEM_DOESNT_VERIFY"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:4 codeName:@"MSU_ERR_PENDING_UPDATE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:5 codeName:@"MSU_ERR_NO_SUSPENDED_UPDATE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:6 codeName:@"MSU_ERR_NONFATAL_RESIZE_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:7 codeName:@"MSU_ERR_INTERNAL_ERROR"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:8 codeName:@"MSU_ERR_INVALID_INFO_PLIST"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:9 codeName:@"MSU_ERR_BAD_ARGUMENT"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:10 codeName:@"MSU_ERR_UPDATE_BRAIN"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:11 codeName:@"MSU_ERR_BOOT_SETUP_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:12 codeName:@"MSU_ERR_CANCEL"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:13 codeName:@"MSU_ERR_FDR"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:14 codeName:@"MSU_ERR_ALLOC"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:15 codeName:@"MSU_ERR_PROGRAMMED_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:16 codeName:@"MSU_ERR_PREPARE_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:17 codeName:@"MSU_ERR_APPLY_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:18 codeName:@"MSU_ERR_PARALLELEXTRACTPAYLOAD"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:19 codeName:@"MSU_ERR_PARALLELAPPLYPATCHFILES"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:20 codeName:@"MSU_ERR_INSUFFICIENT_DISK_SPACE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:21 codeName:@"MSU_ERR_CONTENT_HASHES"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:23 codeName:@"MSU_ERR_APP_DEMOTION"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:24 codeName:@"MSU_ERR_PREBRAIN_SCAN"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:25 codeName:@"MSU_ERR_PREBRAIN_DOWNLOAD"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:26 codeName:@"MSU_ERR_NO_STASHBAG"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:27 codeName:@"MSU_ERR_FAILED_BRAIN_LOAD"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:28 codeName:@"MSU_ERR_NO_BRAIN"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:29 codeName:@"MSU_ERR_PACKAGE_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:30 codeName:@"MSU_ERR_RETRIEVE_AP_NONCE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:31 codeName:@"MSU_ERR_PERSONALIZATION_VERIFICATION_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:32 codeName:@"MSU_ERR_NETWORK"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:33 codeName:@"MSU_ERR_DEMO_MODE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:34 codeName:@"MSU_ERR_PURGE_QUERY_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:35 codeName:@"MSU_ERR_LOCAL_QUERY_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:36 codeName:@"MSU_ERR_BRIDGE_CALLING_MA"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:37 codeName:@"MSU_ERR_RETRIEVE_UCRT_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:38 codeName:@"MSU_ERR_COPY_DEVICE_IDENTITY"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:39 codeName:@"MSU_ERR_FAILED_TRUST_CACHE_LOAD"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:40 codeName:@"MSU_ERR_CONNECT_SOFTWAREUPDATED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:41 codeName:@"MSU_ERR_BACKWARDS_UPDATE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:42 codeName:@"MSU_ERR_MISSING_TARGET"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:43 codeName:@"MSU_ERR_BOOTPOLICY_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:44 codeName:@"MSU_ERR_BRIDGEOS_PERSONALIZATION_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:45 codeName:@"MSU_ERR_BRIDGEOS_PREPARE_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:46 codeName:@"MSU_ERR_BRIDGEOS_APPLY_FAILURE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:47 codeName:@"MSU_ERR_LIVE_SNAPSHOT_MOUNT_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:48 codeName:@"MSU_ERR_CREATE_SNAPSHOT_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:49 codeName:@"MSU_ERR_SET_TARGET_SYSTEM_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:50 codeName:@"MSU_ERR_CONFIGURE_TARGET_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:51 codeName:@"MSU_ERR_PREP_INSTALL_TARGET_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:52 codeName:@"MSU_ERR_GLOBAL_TICKET_NOT_FOUND"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:53 codeName:@"MSU_ERR_GLOBAL_TICKET_INVALID"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:54 codeName:@"MSU_ERR_MEDIUM_DOWNGRADE_NOT_ALLOWED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:55 codeName:@"MSU_ERR_INTERNAL_USE_ONLY_BUILD"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:56 codeName:@"MSU_ERR_STAGE_SPLAT_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:57 codeName:@"MSU_ERR_SPLAT_PREBOOT_UNAVAILABLE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:58 codeName:@"MSU_ERR_ROLLBACK_UNSUPPORTED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:59 codeName:@"MSU_ERR_ROLLBACK_UNAVAILABLE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:60 codeName:@"MSU_ERR_STAGE_SPLAT_ROLLBACK_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:61 codeName:@"MSU_ERR_PARALLELPATCHIMAGEINFO_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:62 codeName:@"MSU_ERR_MOUNT_PREBOOT"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:63 codeName:@"MSU_ERR_PRESOFTWAREUPDATESTAGING"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:64 codeName:@"MSU_ERR_STAGE_SEMISPLAT_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:65 codeName:@"MSU_ERR_IMG4_NONCE_PREROLL_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:66 codeName:@"MSU_ERR_IMG4_NONCE_UNSUPPORTED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:67 codeName:@"MSU_ERR_BOOTPOLICY_NONCES_CHANGED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:801 codeName:@"MSU_ERR_BRAINLOAD_MISSING_PLIST"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:802 codeName:@"MSU_ERR_BRAINLOAD_NO_LOCATION"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:803 codeName:@"MSU_ERR_BRAINLOAD_NO_QUERY_RESULTS"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:804 codeName:@"MSU_ERR_BRAINLOAD_SORT_EXCEPTION"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:805 codeName:@"MSU_ERR_BRAINLOAD_NO_BEST_ASSET"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:806 codeName:@"MSU_ERR_BRAINLOAD_ASSET_DOWNLOAD_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:807 codeName:@"MSU_ERR_BRAINLOAD_NO_ASSET"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:808 codeName:@"MSU_ERR_BRAINLOAD_ADJUST_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:809 codeName:@"MSU_ERR_BRAINLOAD_ADJUST_NOT_DOWNLOADING"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:810 codeName:@"MSU_ERR_BRAINLOAD_CANCEL_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:811 codeName:@"MSU_ERR_BRAINLOAD_QUERY_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:812 codeName:@"MSU_ERR_BRAINLOAD_CATALOG_DOWNLOAD_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:813 codeName:@"MSU_ERR_BRAINLOAD_PURGE_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:814 codeName:@"MSU_ERR_BRAINLOAD_SPACE_CHECK_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:815 codeName:@"MSU_ERR_BRAINLOAD_CANCEL_DOWNLOAD_FAILED"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:816 codeName:@"MSU_ERR_BRAINLOAD_NO_SHARED_CONNECTION"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:817 codeName:@"MSU_ERR_BRAINLOAD_NO_BRAIN_LOCATOR"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v0 withCode:818 codeName:@"MSU_ERR_BRAINLOAD_INVALID_RESPONSE"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:1 codeName:@"BIPreflightErrorMissingTargetMedia"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:2 codeName:@"BIPreflightErrorTargetIsEncrypted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:3 codeName:@"BIPreflightErrorTargetIsNotMounted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:4 codeName:@"BIPreflightErrorTargetIsFirewireDisk"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:5 codeName:@"BIPreflightErrorTargetIsTargetDiskMode"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:6 codeName:@"BIPreflightErrorTargetIsNotSnapshotBooted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:7 codeName:@"BIPreflightErrorTargetIsAppleRAID"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:8 codeName:@"BIPreflightErrorTargetIsCaseSensitive"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:9 codeName:@"BIPreflightErrorDeviceNotSupported"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:10 codeName:@"BIPreflightErrorTargetNotCompatible"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:11 codeName:@"BIPreflightErrorTargetHasInvalidBAACert"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:12 codeName:@"BIPreflightErrorBaseBuildNotCompatible"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:13 codeName:@"BIPreflightErrorUpdateIsNotMounted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:14 codeName:@"BIPreflightErrorBootIsNotMounted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:15 codeName:@"BIPreflightErrorBootOutOfSpace" indicating:4];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:16 codeName:@"BIPreflightErrorTargetOutOfSpace" indicating:4];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:17 codeName:@"BIPreflightErrorUpdateOutOfSpace" indicating:4];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:18 codeName:@"BIPreflightErrorStatFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:19 codeName:@"BIPreflightErrorInsufficientFreeSpace" indicating:4];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:20 codeName:@"BIPreflightErrorTargetIsBackupDisk"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:21 codeName:@"BIPreflightErrorDowngrade"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:22 codeName:@"BIPreflightErrorNotInstallable"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:23 codeName:@"BIPreflightErrorIsDiskUser"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:24 codeName:@"BIPreflightErrorHasInstallerUser"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:25 codeName:@"BIPreflightErrorBootVolumeIsExternal"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:26 codeName:@"BIPreflightErrorRosettaDownloadNotAllowed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:27 codeName:@"BIPreflightErrorNetworkingRequired" indicating:1];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:28 codeName:@"BIPreflightErrorAlternateInstaller"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:29 codeName:@"BIPreflightErrorFullReplacement"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:32 codeName:@"BIPreflightErrorMacOSServerUnsupported"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:33 codeName:@"BIPreflightErrorInvalidStartupDisk"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:1 codeName:@"kAMAuthInstallErrorBadParameter"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:2 codeName:@"kAMAuthInstallErrorAllocation"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3 codeName:@"kAMAuthInstallErrorConversion"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:4 codeName:@"kAMAuthInstallErrorFile"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5 codeName:@"kAMAuthInstallErrorHash"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:6 codeName:@"kAMAuthInstallErrorCrypto"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:7 codeName:@"kAMAuthInstallErrorBadBuildIdentity"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:8 codeName:@"kAMAuthInstallErrorEntryNotFound"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:9 codeName:@"kAMAuthInstallErrorInvalidImg3Object"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:10 codeName:@"kAMAuthInstallErrorInvalidFlsObject"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:11 codeName:@"kAMAuthInstallErrorServerNotReachable" indicating:1];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:12 codeName:@"kAMAuthInstallErrorServerTimedOut" indicating:1];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:13 codeName:@"kAMAuthInstallErrorUnimplemented"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:14 codeName:@"kAMAuthInstallErrorInternal"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:15 codeName:@"kAMAuthInstallErrorInvalidBbfwFile"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:16 codeName:@"kAMAuthInstallErrorNetwork"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:17 codeName:@"kAMAuthInstallErrorBadResponse"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:18 codeName:@"kAMAuthInstallErrorFusingFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:19 codeName:@"kAMAuthInstallErrorBBProvisioningFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:20 codeName:@"kAMAuthInstallErrorAppleConnectNotFound"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:21 codeName:@"kAMAuthInstallErrorAppleConnectCanceled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:22 codeName:@"kAMAuthInstallErrorAppleConnectAuthFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:23 codeName:@"kAMAuthInstallErrorInvalidImg4Object"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:24 codeName:@"kAMAuthInstallErrorProvisioningAckFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:25 codeName:@"kAMAuthInstallErrorUpdaterOperation"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:26 codeName:@"kAMAuthInstallErrorUpdaterNotFound"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:99 codeName:@"kAMAuthInstallErrorGeneric"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3194 codeName:@"kAMAuthInstallTATSUDeclinedAuthorization" indicating:16];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3501 codeName:@"kAMAuthInstallErrorHTTPUnauthorized"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3503 codeName:@"kAMAuthInstallErrorHTTPForbidden"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3504 codeName:@"kAMAuthInstallErrorHTTPNotFound"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3507 codeName:@"kAMAuthInstallErrorHTTPProxyAuthNeeded"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:3500 codeName:@"kAMAuthInstallErrorHTTPInternalServerError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5000 codeName:@"kAMAuthInstallErrorZipOpenFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5001 codeName:@"kAMAuthInstallErrorZipWriteFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5002 codeName:@"kAMAuthInstallErrorZipCloseFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5003 codeName:@"kAMAuthInstallErrorZipParamError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5004 codeName:@"kAMAuthInstallErrorZipBadZipFile"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5005 codeName:@"kAMAuthInstallErrorZipInternalError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5006 codeName:@"kAMAuthInstallErrorZipStreamError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5007 codeName:@"kAMAuthInstallErrorZipDataError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5008 codeName:@"kAMAuthInstallErrorZipMemError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:v1 withCode:5009 codeName:@"kAMAuthInstallErrorZipBufError"];
  v2 = (void *)MEMORY[0x263F77DB0];

  return [v2 attributesOfErrorForDomain:v1 withCode:5010 codeName:@"kAMAuthInstallErrorZipVersionError"];
}

- (void)assignDescriptor:(id)a3 updateUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ASSIGN_DESCRIPTOR: Client provided updateUUID: %{public}@; descriptor: %{public}@",
      buf,
      0x20u);
  }

  v10 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    v2 = *(void **)(a1 + 32);
    [v2 _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8115 description:@"busy performing other MSU operation"];
    return;
  }
  [*(id *)(a1 + 32) setUpdateDescriptor:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setUpdateUUID:*(void *)(a1 + 48)];
  id v3 = [NSString alloc];
  v4 = [*(id *)(a1 + 32) updateUUID];
  v5 = (void *)[v3 initWithFormat:@"[MSU(%@)]", v4];
  [*(id *)(a1 + 32) setDescriptionName:v5];

  id v6 = [*(id *)(a1 + 32) updateDescriptor];
  if ([v6 descriptorType] == 2)
  {

LABEL_10:
    v9 = (void *)[objc_alloc(MEMORY[0x263F55A88]) initWithUpdateAsset:0];
    [*(id *)(a1 + 32) setBrainLoader:v9];

    goto LABEL_11;
  }
  id v7 = [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v8 = [v7 descriptorType];

  if (v8 == 4) {
    goto LABEL_10;
  }
  v27 = [*(id *)(a1 + 32) updateDescriptor];
  if ([v27 descriptorType] == 1)
  {
  }
  else
  {
    uint64_t v28 = [*(id *)(a1 + 32) updateDescriptor];
    uint64_t v29 = [v28 descriptorType];

    if (v29 != 3)
    {
      v34 = (void *)[objc_alloc(MEMORY[0x263F55A88]) initWithUpdateAsset:0];
      [*(id *)(a1 + 32) setBrainLoader:v34];

      [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8115 description:@"method received a descriptor with unknown type; creating a brain loader anyways"];
      goto LABEL_11;
    }
  }
  id v30 = objc_alloc(MEMORY[0x263F55A88]);
  v31 = [*(id *)(a1 + 32) updateDescriptor];
  v32 = [v31 softwareUpdateAsset];
  v33 = (void *)[v30 initWithUpdateAsset:v32];
  [*(id *)(a1 + 32) setBrainLoader:v33];

LABEL_11:
  v10 = [*(id *)(a1 + 32) brainLoader];

  if (!v10) {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8100 description:@"unable to create MSU brain loader"];
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = [MEMORY[0x263F77DE8] sharedLogger];
  v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *(void **)(a1 + 32);
    id v15 = [v14 updateDescriptor];
    v16 = [v15 overviewWithMaxValueLength:96 providingSubstitutionMap:v11];
    *(_DWORD *)buf = 138543618;
    v41 = v14;
    __int16 v42 = 2114;
    v43 = v16;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ assigned update descriptor: %{public}@", buf, 0x16u);
  }
  uint64_t v17 = a1;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v24 = [MEMORY[0x263F77DE8] sharedLogger];
        dispatch_queue_t v25 = [v24 oslog];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(void **)(v17 + 32);
          *(_DWORD *)buf = 138543618;
          v41 = v26;
          __int16 v42 = 2114;
          v43 = v23;
          _os_log_impl(&dword_20C8EA000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v20);
  }
}

- (void)assignRollbackDescriptor:(id)a3 updateUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ ASSIGN_ROLLBACK_DESCRIPTOR: Client provided updateUUID: %{public}@; rollbackDescriptor: %{public}@",
      buf,
      0x20u);
  }

  v10 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    v2 = *(void **)(a1 + 32);
    [v2 _trackMSUAnomaly:@"ASSIGN_ROLLBACK_DESCRIPTOR" result:8115 description:@"busy performing other MSU operation"];
  }
  else
  {
    [*(id *)(a1 + 32) setRollbackDescriptor:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setUpdateUUID:*(void *)(a1 + 48)];
    id v3 = [NSString alloc];
    v4 = [*(id *)(a1 + 32) updateUUID];
    v5 = (void *)[v3 initWithFormat:@"[MSU Rollback(%@)]", v4];
    [*(id *)(a1 + 32) setDescriptionName:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x263F55A88]) initWithUpdateAsset:0];
    [*(id *)(a1 + 32) setBrainLoader:v6];

    id v7 = [*(id *)(a1 + 32) brainLoader];

    if (!v7) {
      [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_ROLLBACK_DESCRIPTOR" result:8100 description:@"unable to create MSU brain loader"];
    }
    uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
    v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ assigned rollback descriptor: %{public}@", buf, 0x16u);
    }
  }
}

- (void)loadBrain:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.LoadBrain"];
  id v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__SUCoreMSU_loadBrain___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __23__SUCoreMSU_loadBrain___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"LOAD_BRAIN" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.LoadBrain"];
  }
  else
  {
    [*(id *)(a1 + 32) setLoadBrainTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationLoadBrain:v6];
  }
}

- (void)preflightDownloadSU:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PreflightDownloadSU"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMSU_preflightDownloadSU___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMSU_preflightDownloadSU___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_DOWNLOAD" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PreflightDownloadSU"];
  }
  else
  {
    [*(id *)(a1 + 32) setPreflightDownloadSUTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPreflightSUDownload:v6];
  }
}

- (void)preflightPersonalize:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PreflightPersonalize"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_preflightPersonalize___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_preflightPersonalize___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_PERSONALIZE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PreflightPersonalize"];
  }
  else
  {
    [*(id *)(a1 + 32) setPreflightPersonalizeTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPreflightPersonalize:v6];
  }
}

- (void)preflightFDRRecovery:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PreflightFDRRecovery"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_preflightFDRRecovery___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_preflightFDRRecovery___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_FDR_RECOVERY" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PreflightFDRRecovery"];
  }
  else
  {
    [*(id *)(a1 + 32) setPreflightFDRRecoveryTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPreflightFDRRecovery:v6];
  }
}

- (void)preflightWakeup:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PreflightWakeup"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SUCoreMSU_preflightWakeup___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __29__SUCoreMSU_preflightWakeup___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_WAKEUP" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PreflightWakeup"];
  }
  else
  {
    [*(id *)(a1 + 32) setPreflightWakeupTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPreflightWakeup:v6];
  }
}

- (void)preflightPrerequisiteCheck:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PreflightPrerequisiteCheck"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_PREREQUISITE_CHECK" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PreflightPrerequisiteCheck"];
  }
  else
  {
    [*(id *)(a1 + 32) setPreflightPrerequisiteCheckTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPreflightPrerequisiteCheck:v6];
  }
}

- (void)prepareUpdate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.PrepareUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SUCoreMSU_prepareUpdate___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __27__SUCoreMSU_prepareUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREPARE_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.PrepareUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setPrepareUpdateTransaction:*(void *)(a1 + 40)];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationPrepareUpdate:v6];
  }
}

- (void)suspendUpdate
{
  uint64_t v3 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.SuspendUpdate"];
  id v4 = [(SUCoreMSU *)self msuControlQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__SUCoreMSU_suspendUpdate__block_invoke;
  v6[3] = &unk_2640DCE98;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __26__SUCoreMSU_suspendUpdate__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"SUSPEND_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.SuspendUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setSuspendUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    return [v5 _operationSuspendUpdate];
  }
}

- (void)resumeUpdate
{
}

- (void)resumeUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.ResumeUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SUCoreMSU_resumeUpdate___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __26__SUCoreMSU_resumeUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"RESUME_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.ResumeUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setResumeUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationResumeUpdate:v6];
  }
}

- (void)applyUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.ApplyUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__SUCoreMSU_applyUpdate___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __25__SUCoreMSU_applyUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"APPLY_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.ApplyUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setApplyUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationApplyUpdate:v6];
  }
}

+ (id)commitStash:(id)a3
{
  return SUCoreBorder_MSUCommitStash(a3);
}

- (void)rollbackUpdatePrepare:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.RollbackUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_PREPARE" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.RollbackUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationRollbackUpdatePrepare:v6];
  }
}

- (void)rollbackUpdateSuspend:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.RollbackUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_SUSPEND" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.RollbackUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationRollbackUpdateSuspend:v6];
  }
}

- (void)rollbackUpdateResume:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.RollbackUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUCoreMSU_rollbackUpdateResume___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_rollbackUpdateResume___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_RESUME" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.RollbackUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationRollbackUpdateResume:v6];
  }
}

- (void)rollbackUpdateApply:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.RollbackUpdate"];
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMSU_rollbackUpdateApply___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMSU_rollbackUpdateApply___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_APPLY" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.RollbackUpdate"];
  }
  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 _operationRollbackUpdateApply:v6];
  }
}

- (void)cancelPrepare
{
  uint64_t v3 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SUCoreMSU_cancelPrepare__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__SUCoreMSU_cancelPrepare__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = @"busy performing other MSU operation";
LABEL_4:
    return [v2 _trackMSUAnomaly:@"CANCEL_PREPARE" result:8115 description:v3];
  }
  if (([*(id *)(a1 + 32) performingOperation] & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = @"not performing any MSU operation";
    goto LABEL_4;
  }
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will request that prepare be canceled [with result provided back to MSU on prepare progress as mechanism for requesting cancel]", (uint8_t *)&v8, 0xCu);
  }

  return [*(id *)(a1 + 32) setCancelingPrepare:1];
}

- (void)removePrepared
{
  uint64_t v3 = [MEMORY[0x263F77D78] beginTransactionWithName:@"msu.RemovePrepared"];
  id v4 = [(SUCoreMSU *)self msuControlQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__SUCoreMSU_removePrepared__block_invoke;
  v6[3] = &unk_2640DCE98;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __27__SUCoreMSU_removePrepared__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"REMOVE_PREPARED" result:8115 description:@"busy performing other MSU operation"];
    v2 = (void *)MEMORY[0x263F77D78];
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 endTransaction:v3 withName:@"msu.RemovePrepared"];
  }
  else
  {
    [*(id *)(a1 + 32) setRemovePreparedTransaction:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    return [v5 _removePrepared];
  }
}

- (void)_addUpdateMetricsEventFieldsToMSUOptions:(id)a3 usingPolicy:(id)a4 descriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SUCoreMSU *)self msuOperationQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(SUCoreMSU *)self updateUUID];

  if (!v12)
  {
    id v15 = [MEMORY[0x263F77DA8] sharedDiag];
    [v15 trackAnomaly:@"NEW_UPDATE_METRIC_EVENT_FIELDS" forReason:@"Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)" withResult:8116 withError:0];
    goto LABEL_25;
  }
  uint64_t v13 = *MEMORY[0x263F55C00];
  __int16 v14 = [v8 safeObjectForKey:*MEMORY[0x263F55C00] ofClass:objc_opt_class()];
  id v15 = (id)[v14 mutableCopy];

  if (!v15) {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  [v8 setSafeObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F55B98]];
  uint64_t v16 = [(SUCoreMSU *)self updateUUID];
  [v15 setSafeObject:v16 forKey:*MEMORY[0x263F55BD8]];

  uint64_t v17 = [v9 updateMetricContext];
  [v15 setSafeObject:v17 forKey:*MEMORY[0x263F78070]];

  __int16 v18 = [v10 productBuildVersion];

  if (v18)
  {
    id v19 = [v10 productBuildVersion];
    [v15 setSafeObject:v19 forKey:*MEMORY[0x263F55AE0]];
  }
  __int16 v20 = [v9 updateMetricEventFields];

  if (v20)
  {
    id v21 = [v9 updateMetricEventFields];
    [v8 setSafeObject:v21 forKey:*MEMORY[0x263F55B58]];
  }
  uint64_t v22 = [(SUCoreMSU *)self updateDescriptor];
  if ([v22 descriptorType] == 1)
  {
  }
  else
  {
    v23 = [(SUCoreMSU *)self updateDescriptor];
    uint64_t v24 = [v23 descriptorType];

    if (v24 != 3)
    {
      if ([v10 descriptorType] == 2 || objc_msgSend(v10, "descriptorType") == 4)
      {
        v26 = [v10 bundleAttributes];
      }
      else
      {
        v26 = 0;
      }
      goto LABEL_17;
    }
  }
  dispatch_queue_t v25 = [v10 softwareUpdateAsset];
  v26 = [v25 attributes];

LABEL_17:
  id v27 = [v26 safeObjectForKey:@"_EventRecordingServiceURL" ofClass:objc_opt_class()];
  if (!v27) {
    id v27 = (id)*MEMORY[0x263F78178];
  }
  [v8 setSafeObject:v27 forKey:@"_EventRecordingServiceURL"];
  [v15 setSafeObject:v27 forKey:@"_EventRecordingServiceURL"];
  if ([v10 descriptorType] == 4)
  {
    uint64_t v28 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v29 = [v28 oslog];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v30 = 0;
      _os_log_impl(&dword_20C8EA000, v29, OS_LOG_TYPE_DEFAULT, "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type", v30, 2u);
    }
  }
  else
  {
    [v8 setSafeObject:v15 forKey:v13];
  }

LABEL_25:
}

- (void)_addUpdateMetricsEventFieldsToMSURollbackOptions:(id)a3 usingPolicy:(id)a4 rollbackDescriptor:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SUCoreMSU *)self msuOperationQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SUCoreMSU *)self updateUUID];

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x263F55C00];
    uint64_t v13 = [v25 safeObjectForKey:*MEMORY[0x263F55C00] ofClass:objc_opt_class()];
    id v14 = (id)[v13 mutableCopy];

    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v15 = [(SUCoreMSU *)self updateUUID];
    [v14 setSafeObject:v15 forKey:*MEMORY[0x263F55BD8]];

    uint64_t v16 = [v8 updateMetricContext];
    [v14 setSafeObject:v16 forKey:*MEMORY[0x263F78070]];

    [v14 setSafeObject:*MEMORY[0x263F78120] forKey:*MEMORY[0x263F780D8]];
    uint64_t v17 = [v9 productBuildVersion];

    if (v17)
    {
      __int16 v18 = [v9 productBuildVersion];
      [v14 setSafeObject:v18 forKey:*MEMORY[0x263F55AE0]];
    }
    id v19 = [v9 restoreVersion];

    if (v19)
    {
      __int16 v20 = [v9 restoreVersion];
      [v14 setSafeObject:v20 forKey:*MEMORY[0x263F55BA0]];
    }
    id v21 = [v8 updateMetricEventFields];

    uint64_t v22 = v25;
    if (v21)
    {
      v23 = [v8 updateMetricEventFields];
      [v25 setSafeObject:v23 forKey:*MEMORY[0x263F55B58]];

      uint64_t v22 = v25;
    }
    uint64_t v24 = *MEMORY[0x263F78178];
    [v22 setSafeObject:*MEMORY[0x263F78178] forKey:@"_EventRecordingServiceURL"];
    [v14 setSafeObject:v24 forKey:@"_EventRecordingServiceURL"];
    [v25 setSafeObject:v14 forKey:v12];
  }
  else
  {
    id v14 = [MEMORY[0x263F77DA8] sharedDiag];
    [v14 trackAnomaly:@"NEW_UPDATE_METRIC_EVENT_FIELDS" forReason:@"Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)" withResult:8116 withError:0];
  }
}

- (void)_addRemoteServerAccessControlToMSUOptions:(id)a3 usingPolicy:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(SUCoreMSU *)self msuOperationQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 personalizationServerURL];
  [v15 setSafeObject:v8 forKey:*MEMORY[0x263F55B80]];

  id v9 = [v6 proxyHostName];
  if (v9)
  {

LABEL_4:
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v11)
    {
      uint64_t v12 = [v6 proxyHostName];
      [v11 setSafeObject:v12 forKey:@"SOCKSProxy"];

      uint64_t v13 = [v6 proxyPortNumber];
      [v11 setSafeObject:v13 forKey:@"SOCKSPort"];

      [v15 setSafeObject:v11 forKey:*MEMORY[0x263F55BB8]];
    }
    else
    {
      id v14 = [MEMORY[0x263F77DA8] sharedDiag];
      [v14 trackAnomaly:@"ADD_REMOTE_SERVER_ACCESS_CONTROL_TO_MSU_OPTIONS" forReason:@"could not create proxy dictionary" withResult:8100 withError:0];
    }
    goto LABEL_8;
  }
  id v10 = [v6 proxyPortNumber];

  if (v10) {
    goto LABEL_4;
  }
LABEL_8:
}

- (id)_newMSUOptionsUsingPolicy:(id)a3 descriptor:(id)a4 baseOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SUCoreMSU *)self msuOperationQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [(SUCoreMSU *)self updateUUID];

  if (!v12)
  {
    id v25 = [MEMORY[0x263F77DA8] sharedDiag];
    [v25 trackAnomaly:@"NEW_MSU_OPTIONS" forReason:@"Could not get everything needed to provide a sessionID creation of MSU options (missing updateUUID)" withResult:8116 withError:0];

    id v14 = 0;
    goto LABEL_55;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v14 = v13;
  if (v10) {
    [v13 addEntriesFromDictionary:v10];
  }
  id v15 = objc_opt_new();
  uint64_t v16 = [(SUCoreMSU *)self updateDescriptor];
  uint64_t v17 = [v16 updateBrainPath];
  uint64_t v18 = *MEMORY[0x263F55AA0];
  [v15 setSafeObject:v17 forKey:*MEMORY[0x263F55AA0]];

  id v19 = [MEMORY[0x263F77DA0] sharedDevice];
  if ([v19 isBootedOSSecureInternal])
  {
    __int16 v20 = [v8 updateBrainLocationOverride];

    if (!v20) {
      goto LABEL_10;
    }
    id v21 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:](v8, v22);
    }

    id v19 = [v8 updateBrainLocationOverride];
    [v15 setSafeObject:v19 forKey:v18];
  }

LABEL_10:
  if ([v9 descriptorType] == 4)
  {
    v23 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type", buf, 2u);
    }
  }
  else
  {
    [v14 setSafeObject:v15 forKey:*MEMORY[0x263F55C00]];
  }
  v85 = v15;
  [(SUCoreMSU *)self _addUpdateMetricsEventFieldsToMSUOptions:v14 usingPolicy:v8 descriptor:v9];
  [(SUCoreMSU *)self _addRemoteServerAccessControlToMSUOptions:v14 usingPolicy:v8];
  v26 = [v8 updateMetricEventFields];
  [v14 setSafeObject:v26 forKey:*MEMORY[0x263F55B58]];

  id v27 = [v8 userAgentString];
  [v14 setSafeObject:v27 forKey:*MEMORY[0x263F55BE0]];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "performPreflightEncryptedCheck"));
  [v14 setSafeObject:v28 forKey:*MEMORY[0x263F55C08]];

  uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "performPreflightSnapshotCheck"));
  [v14 setSafeObject:v29 forKey:*MEMORY[0x263F55C10]];

  id v30 = [v8 ssoToken];

  if (v30)
  {
    id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v32 = [v8 ssoToken];
    uint64_t v33 = *MEMORY[0x263F55AB8];
    [v31 setSafeObject:v32 forKey:*MEMORY[0x263F55AB8]];

    [v14 setSafeObject:v31 forKey:*MEMORY[0x263F55AB0]];
    v34 = [v8 ssoToken];
    [v14 setSafeObject:v34 forKey:v33];
  }
  long long v35 = [v8 personalizedManifestRootsPath];
  [v14 setSafeObject:v35 forKey:*MEMORY[0x263F55B88]];

  long long v36 = [v8 localAuthenticationContext];
  [v14 setSafeObject:v36 forKey:*MEMORY[0x263F55B68]];

  long long v37 = [v8 localAuthenticationUserID];
  [v14 setSafeObject:v37 forKey:*MEMORY[0x263F55B70]];

  long long v38 = [v8 mdmBootstrapToken];
  [v14 setSafeObject:v38 forKey:*MEMORY[0x263F55B78]];

  int v39 = [v8 bridgeOSIgnoreMinimumVersionCheck];
  uint64_t v40 = MEMORY[0x263EFFA80];
  uint64_t v41 = MEMORY[0x263EFFA88];
  if (v39) {
    uint64_t v42 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v42 = MEMORY[0x263EFFA80];
  }
  [v14 setSafeObject:v42 forKey:*MEMORY[0x263F55AD8]];
  v43 = [v8 bridgeOSDownloadDirectory];
  [v14 setSafeObject:v43 forKey:*MEMORY[0x263F55AD0]];

  if ([v8 enableEmbeddedOSInstall]) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = v40;
  }
  [v14 setSafeObject:v44 forKey:*MEMORY[0x263F55B40]];
  if ([v8 enableBridgeOSInstall]) {
    uint64_t v45 = v41;
  }
  else {
    uint64_t v45 = v40;
  }
  [v14 setSafeObject:v45 forKey:*MEMORY[0x263F55B38]];
  if ([v8 enableOSPersonalization]) {
    uint64_t v46 = v41;
  }
  else {
    uint64_t v46 = v40;
  }
  [v14 setSafeObject:v46 forKey:*MEMORY[0x263F55B50]];
  if ([v8 userInitiated]) {
    uint64_t v47 = v41;
  }
  else {
    uint64_t v47 = v40;
  }
  [v14 setSafeObject:v47 forKey:*MEMORY[0x263F55BE8]];
  if ([v8 skipVolumeSealing]) {
    uint64_t v48 = v41;
  }
  else {
    uint64_t v48 = v40;
  }
  [v14 setSafeObject:v48 forKey:*MEMORY[0x263F55BB0]];
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "qualityOfService"));
  [v14 setSafeObject:v49 forKey:*MEMORY[0x263F55B90]];

  v50 = [v8 targetVolumeUUID];
  [v14 setSafeObject:v50 forKey:*MEMORY[0x263F55BD0]];

  v51 = [v8 prerequisiteBuildVersion];
  [v14 setSafeObject:v51 forKey:*MEMORY[0x263F55AC8]];

  v52 = [MEMORY[0x263F77DA0] sharedDevice];
  v53 = [v52 rootVolumeUUID];
  [v14 setSafeObject:v53 forKey:*MEMORY[0x263F55AC0]];

  v54 = [v8 targetVolumeUUID];
  [v14 setSafeObject:v54 forKey:*MEMORY[0x263F55AE8]];

  if ([v9 descriptorType] == 2)
  {
    v55 = [v9 updateBundlePath];
    [v14 setSafeObject:v55 forKey:*MEMORY[0x263F55BC0]];
LABEL_48:

    goto LABEL_49;
  }
  if ([v9 descriptorType] == 1)
  {
    v56 = [v9 softwareUpdateAsset];
    id v57 = [v56 getLocalUrl];
    v55 = (void *)[v57 fileSystemRepresentation];

    if (v55)
    {
      v55 = [NSString stringWithUTF8String:v55];
    }
    [v14 setSafeObject:v55 forKey:*MEMORY[0x263F55BC0]];
    uint64_t v58 = [v9 associatedSplatDescriptor];
    if (v58)
    {
      v59 = (void *)v58;
      v60 = [v9 associatedSplatDescriptor];
      uint64_t v61 = [v60 descriptorType];

      if (v61 == 1)
      {
        v62 = [v9 associatedSplatDescriptor];
        v63 = [v62 softwareUpdateAsset];
        [v63 refreshState];

        v64 = [v9 associatedSplatDescriptor];
        v65 = [v64 softwareUpdateAsset];
        int v66 = [v65 wasLocal];

        if (v66)
        {
          v84 = [v9 associatedSplatDescriptor];
          v67 = [v84 softwareUpdateAsset];
          id v68 = [v67 getLocalUrl];
          v69 = (void *)[v68 fileSystemRepresentation];

          if (v69)
          {
            v69 = [NSString stringWithUTF8String:v69];
          }
          [v14 setSafeObject:v69 forKey:@"SplatComboBundlePath"];
        }
        v70 = [v9 associatedSplatDescriptor];
        v71 = [v70 bundleAttributes];
        [v14 setSafeObject:v71 forKey:@"__msu-splat-combo-update-attributes-dictionary-key"];
      }
    }
    goto LABEL_48;
  }
LABEL_49:
  if ([v9 splatOnly]) {
    [v14 setSafeObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F55BC8]];
  }
  id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v73 = [v8 hwModelStr];
  [v72 setSafeObject:v73 forKey:*MEMORY[0x263F55B00]];

  v74 = [v8 deviceClass];
  [v72 setSafeObject:v74 forKey:*MEMORY[0x263F55AF8]];

  v75 = [v8 productType];
  [v72 setSafeObject:v75 forKey:*MEMORY[0x263F55B10]];

  v76 = [v8 releaseType];
  [v72 setSafeObject:v76 forKey:*MEMORY[0x263F55B18]];

  v77 = [MEMORY[0x263F77DA0] sharedDevice];
  v78 = [v77 deviceBoardID];
  [v72 setSafeObject:v78 forKey:*MEMORY[0x263F55AF0]];

  [v14 setSafeObject:v72 forKey:*MEMORY[0x263F55B08]];
  v79 = +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", [v9 descriptorAudienceType]);
  [v14 setSafeObject:v79 forKey:*MEMORY[0x263F55B20]];

  v80 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", [v9 preferredUpdateType]);
  [v14 setSafeObject:v80 forKey:*MEMORY[0x263F55B28]];

  v81 = [v8 softwareUpdateScanPolicy];
  if ([v81 allowSameVersion]) {
    uint64_t v82 = v41;
  }
  else {
    uint64_t v82 = v40;
  }
  [v14 setSafeObject:v82 forKey:*MEMORY[0x263F55AA8]];

LABEL_55:
  return v14;
}

- (id)_newMSURollbackOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4 baseOptions:(id)a5 additionalOptions:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SUCoreMSU *)self _newMSUOptionsUsingPolicy:v12 descriptor:0 baseOptions:a5];
  [(SUCoreMSU *)self _addUpdateMetricsEventFieldsToMSURollbackOptions:v13 usingPolicy:v12 rollbackDescriptor:v11];

  [v13 setSafeObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F55BA8]];
  [v13 setSafeObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F55B98]];
  [v13 addEntriesFromDictionary:v10];

  return v13;
}

- (id)_newPreflightOptionsUsingPolicy:(id)a3 subPolicyClass:(Class)a4 descriptor:(id)a5 baseOptions:(id)a6 additionalOptions:(id)a7
{
  id v12 = a7;
  id v13 = [(SUCoreMSU *)self _newMSUOptionsUsingPolicy:a3 descriptor:a5 baseOptions:a6];
  if ((Class)objc_opt_class() == a4 || (Class)objc_opt_class() == a4) {
    [v13 setSafeObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F55B60]];
  }
  [v13 addEntriesFromDictionary:v12];

  return v13;
}

- (id)_newPrepareOptionsUsingPolicy:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 preparePolicy];
  id v9 = [v8 basePrepareOptions];
  id v10 = [(SUCoreMSU *)self _newMSUOptionsUsingPolicy:v7 descriptor:v6 baseOptions:v9];

  [(SUCoreMSU *)self updatePrepareOptions:v10 withPolicy:v7];
  return v10;
}

- (id)_newRollbackPrepareOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 rollbackPolicy];
  id v9 = [v8 baseRollbackOptions];
  id v10 = [v7 rollbackPolicy];
  id v11 = [v10 additionalOptions];
  id v12 = [(SUCoreMSU *)self _newMSURollbackOptionsUsingPolicy:v7 rollbackDescriptor:v6 baseOptions:v9 additionalOptions:v11];

  [(SUCoreMSU *)self updatePrepareOptions:v12 withPolicy:v7];
  [v7 updateRollbackOptionsWithExtensions:v12];

  return v12;
}

- (void)updatePrepareOptions:(id)a3 withPolicy:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(SUCoreMSU *)self doNotPatchList];
  uint64_t v8 = *MEMORY[0x263F55B30];
  id v9 = [v16 safeObjectForKey:*MEMORY[0x263F55B30] ofClass:objc_opt_class()];
  if (v9)
  {
    id v10 = v9;
    id v11 = [v9 arrayByAddingObjectsFromArray:v7];

    id v12 = [MEMORY[0x263EFFA08] setWithArray:v11];
    id v13 = [v12 allObjects];
  }
  else
  {
    id v13 = v7;
  }
  [v16 setSafeObject:v13 forKey:v8];
  [(SUCoreMSU *)self _addRemoteServerAccessControlToMSUOptions:v16 usingPolicy:v6];
  id v14 = [v6 preparePolicy];

  id v15 = [v14 additionalOptions];
  [v16 addEntriesFromDictionary:v15];
}

- (id)doNotPatchList
{
  return &unk_26C19D3D0;
}

- (void)_operationLoadBrain:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreMSU *)self brainLoader];

  if (v6)
  {
    [(SUCoreMSU *)self setPerformingOperation:1];
    id v7 = [(SUCoreMSU *)self msuOperationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v8 buildError:8102 underlying:0 description:@"Missing required brain loader when attempting to load an update brain"];
    [(SUCoreMSU *)self _reportBrainLoadFailed:v9];

    [(SUCoreMSU *)self setPerformingOperation:0];
  }
}

void __33__SUCoreMSU__operationLoadBrain___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 updateDescriptor];
  id v5 = (void *)[v2 _newMSUOptionsUsingPolicy:v3 descriptor:v4 baseOptions:0];

  id v6 = objc_opt_new();
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = [v7 loadBrainPolicy];
      objc_msgSend(v6, "setDiscretionary:", objc_msgSend(v8, "discretionary"));

      id v9 = [*(id *)(a1 + 40) loadBrainPolicy];
      objc_msgSend(v6, "setAllowsCellularAccess:", objc_msgSend(v9, "allowsCellular"));

      id v10 = [*(id *)(a1 + 40) loadBrainPolicy];
      objc_msgSend(v6, "setLiveServerCatalogOnly:", objc_msgSend(v10, "liveServerCatalogOnly"));

      if ([*(id *)(a1 + 40) isSupervisedPolicy])
      {
        [v6 setSupervised:1];
        id v11 = [*(id *)(a1 + 32) updateDescriptor];
        id v12 = [v11 productVersion];
        [v6 setRequestedProductVersion:v12];
      }
      id v13 = [v6 additionalServerParams];
      id v14 = (void *)[v13 mutableCopy];
      id v15 = v14;
      if (v14) {
        id v16 = v14;
      }
      else {
        id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      uint64_t v17 = v16;

      uint64_t v18 = [*(id *)(a1 + 40) loadBrainPolicy];
      id v19 = [v18 additionalOptions];

      if (v19)
      {
        __int16 v20 = [*(id *)(a1 + 40) loadBrainPolicy];
        id v21 = [v20 additionalOptions];
        [v17 addEntriesFromDictionary:v21];
      }
      [v6 setAdditionalServerParams:v17];
    }
    else
    {
      [v6 setDiscretionary:0];
      [v6 setAllowsCellularAccess:0];
    }
    uint64_t v22 = [*(id *)(a1 + 32) updateDescriptor];

    if (v22)
    {
      v23 = [*(id *)(a1 + 32) updateDescriptor];
      uint64_t v24 = [v23 assetAudienceUUID];

      if (v24)
      {
        id v25 = [*(id *)(a1 + 32) updateDescriptor];
        v26 = [v25 assetAudienceUUID];
        id v27 = (void *)[v26 copy];
        [v6 setLiveAssetAudienceUUID:v27];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"LOAD_BRAIN" result:8100 description:@"unable to create download options - using default"];
  }
  uint64_t v28 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v29 = [v28 oslog];

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = *(void **)(a1 + 32);
    id v31 = [v30 brainLoader];
    v32 = @"YES";
    *(_DWORD *)buf = 138543874;
    long long v36 = v30;
    __int16 v37 = 2114;
    if (!v31) {
      v32 = @"NO";
    }
    long long v38 = v6;
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    _os_log_impl(&dword_20C8EA000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ loading brain with download options: %{public}@; brain loader present: %{public}@",
      buf,
      0x20u);
  }
  [*(id *)(a1 + 32) _trackMSUBegin:@"loadUpdateBrainWithMAOptions"];
  uint64_t v33 = [*(id *)(a1 + 32) brainLoader];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke_966;
  v34[3] = &unk_2640DDFC0;
  v34[4] = *(void *)(a1 + 32);
  objc_msgSend(v33, "SUCoreBorder_loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:", v6, v5, v34);
}

uint64_t __33__SUCoreMSU__operationLoadBrain___block_invoke_966(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) loadBrainProgress:a2 error:a3];
}

- (void)_operationPreflightSUDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreMSU *)self updateDescriptor];

  if (!v6)
  {
    id v15 = [MEMORY[0x263F77D78] sharedCore];
    id v16 = [v15 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightSUDownload"];

    [(SUCoreMSU *)self _reportSUDownloadPreflightFailed:v16];
    goto LABEL_8;
  }
  id v7 = [(SUCoreMSU *)self updateDescriptor];
  if ([v7 descriptorType] == 1) {
    goto LABEL_5;
  }
  uint64_t v8 = [(SUCoreMSU *)self updateDescriptor];
  uint64_t v9 = [v8 descriptorType];

  if (v9 != 3)
  {
    id v10 = [NSString alloc];
    id v11 = [(SUCoreMSU *)self updateDescriptor];
    id v12 = +[SUCoreDescriptor nameForDescriptorType:](SUCoreDescriptor, "nameForDescriptorType:", [v11 descriptorType]);
    id v7 = (void *)[v10 initWithFormat:@"Unexpected descriptor type %@, expecting SUCoreDescriptorTypeAsset or SUCoreDescriptorTypeSFRAsset", v12];

    id v13 = [MEMORY[0x263F77DA8] sharedDiag];
    [v13 trackAnomaly:@"PreflightSUDownload" forReason:v7 withResult:8116 withError:0];

LABEL_5:
  }
  [(SUCoreMSU *)self setPerformingOperation:1];
  id v14 = [(SUCoreMSU *)self msuOperationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke;
  block[3] = &unk_2640DCE98;
  block[4] = self;
  id v18 = v4;
  dispatch_async(v14, block);

LABEL_8:
}

void __43__SUCoreMSU__operationPreflightSUDownload___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateDescriptor];
  if ([v2 descriptorType] == 2)
  {

LABEL_4:
    id v5 = [MEMORY[0x263F77DA8] sharedDiag];
    [v5 trackAnomaly:@"MSUPreflightSUDownload" forReason:@"The descriptor specified a package type which is not expected for download preflight" withResult:8116 withError:0];

    goto LABEL_5;
  }
  uint64_t v3 = [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v4 = [v3 descriptorType];

  if (v4 == 4) {
    goto LABEL_4;
  }
LABEL_5:
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 downloadPreflightPolicy];
  uint64_t v9 = objc_opt_class();
  id v10 = [*(id *)(a1 + 32) updateDescriptor];
  id v11 = [*(id *)(a1 + 40) softwareUpdateDownloadPolicy];
  id v12 = [v11 basePreflightOptions];
  id v13 = [*(id *)(a1 + 40) softwareUpdateDownloadPolicy];
  id v14 = [v13 additionalOptions];
  id v15 = (void *)[v6 _newPreflightOptionsUsingPolicy:v7 subPolicyClass:v9 descriptor:v10 baseOptions:v12 additionalOptions:v14];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (download)" optionsName:@"preflightOptions" withMSUOptions:v15];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  id v16 = SUCoreBorder_MSUPreflightUpdate(4, v15);
  uint64_t v17 = [*(id *)(a1 + 32) msuControlQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2;
  v20[3] = &unk_2640DCE98;
  uint64_t v18 = *(void *)(a1 + 32);
  id v21 = v16;
  uint64_t v22 = v18;
  id v19 = v16;
  dispatch_async(v17, v20);
}

uint64_t __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSUDownloadPreflightFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportSUDownloadPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationPreflightPersonalize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(SUCoreMSU *)self updateDescriptor];

  if (v6)
  {
    [(SUCoreMSU *)self setPerformingOperation:1];
    id v7 = [(SUCoreMSU *)self msuOperationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v9 = [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightPersonalize"];

    [(SUCoreMSU *)self _reportPersonalizePreflightFailed:v9];
  }
}

void __44__SUCoreMSU__operationPreflightPersonalize___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 personalizePreflightPolicy];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 32) updateDescriptor];
  id v7 = [*(id *)(a1 + 40) personalizePreflightPolicy];
  uint64_t v8 = [v7 basePreflightOptions];
  uint64_t v9 = [*(id *)(a1 + 40) personalizePreflightPolicy];
  id v10 = [v9 additionalOptions];
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (personalize)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  id v12 = SUCoreBorder_MSUPreflightUpdate(2, v11);
  id v13 = [*(id *)(a1 + 32) msuControlQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2;
  v16[3] = &unk_2640DCE98;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPersonalizePreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportPersonalizePreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationPreflightFDRRecovery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(SUCoreMSU *)self updateDescriptor];

  if (v6)
  {
    [(SUCoreMSU *)self setPerformingOperation:1];
    id v7 = [(SUCoreMSU *)self msuOperationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v9 = [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightFDRRecovery"];

    [(SUCoreMSU *)self _reportFDRRecoveryPreflightFailed:v9];
  }
}

void __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 fdrRecoveryPreflightPolicy];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 32) updateDescriptor];
  id v7 = [*(id *)(a1 + 40) fdrRecoveryPreflightPolicy];
  uint64_t v8 = [v7 basePreflightOptions];
  uint64_t v9 = [*(id *)(a1 + 40) fdrRecoveryPreflightPolicy];
  id v10 = [v9 additionalOptions];
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (FDRRecovery)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  id v12 = SUCoreBorder_MSUPreflightUpdate(3, v11);
  id v13 = [*(id *)(a1 + 32) msuControlQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2;
  v16[3] = &unk_2640DCE98;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportFDRRecoveryPreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportFDRRecoveryPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationPreflightWakeup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(SUCoreMSU *)self updateDescriptor];

  if (v6)
  {
    [(SUCoreMSU *)self setPerformingOperation:1];
    id v7 = [(SUCoreMSU *)self msuOperationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v9 = [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightWakeup"];

    [(SUCoreMSU *)self _reportWakeupPreflightFailed:v9];
  }
}

void __39__SUCoreMSU__operationPreflightWakeup___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v4 = [v3 descriptorType];
  if (v4 != 2)
  {
    uint64_t v1 = [*(id *)(a1 + 32) updateDescriptor];
    if ([v1 descriptorType] != 4)
    {

      goto LABEL_8;
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v6 = [v5 updateBrainPath];

  if (v4 != 2) {
  if (!v6)
  }
  {
    uint64_t v3 = [MEMORY[0x263F77DA8] sharedDiag];
    [v3 trackAnomaly:@"MSUPreflightWakeup", @"An update brain path is required for preflight, yet none was provided", 8116, 0 forReason withResult withError];
LABEL_8:
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v8 wakeupPreflightPolicy];
  uint64_t v10 = objc_opt_class();
  id v11 = [*(id *)(a1 + 32) updateDescriptor];
  id v12 = [*(id *)(a1 + 40) wakeupPreflightPolicy];
  id v13 = [v12 basePreflightOptions];
  uint64_t v14 = [*(id *)(a1 + 40) wakeupPreflightPolicy];
  id v15 = [v14 additionalOptions];
  id v16 = (void *)[v7 _newPreflightOptionsUsingPolicy:v8 subPolicyClass:v10 descriptor:v11 baseOptions:v13 additionalOptions:v15];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (wakeup)" optionsName:@"preflightOptions" withMSUOptions:v16];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  id v17 = SUCoreBorder_MSUPreflightUpdate(4, v16);
  uint64_t v18 = [*(id *)(a1 + 32) msuControlQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2;
  v21[3] = &unk_2640DCE98;
  uint64_t v19 = *(void *)(a1 + 32);
  id v22 = v17;
  uint64_t v23 = v19;
  id v20 = v17;
  dispatch_async(v18, v21);
}

uint64_t __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportWakeupPreflightFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportWakeupPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationPreflightPrerequisiteCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(SUCoreMSU *)self updateDescriptor];

  if (v6)
  {
    [(SUCoreMSU *)self setPerformingOperation:1];
    id v7 = [(SUCoreMSU *)self msuOperationQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v9 = [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightPrerequisiteCheck"];

    [(SUCoreMSU *)self _reportPrerequisiteCheckPreflightFailed:v9];
  }
}

void __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 prerequisiteCheckPreflightPolicy];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 32) updateDescriptor];
  id v7 = [*(id *)(a1 + 40) prerequisiteCheckPreflightPolicy];
  uint64_t v8 = [v7 basePreflightOptions];
  uint64_t v9 = [*(id *)(a1 + 40) prerequisiteCheckPreflightPolicy];
  uint64_t v10 = [v9 additionalOptions];
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (prerequisite check)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  id v12 = SUCoreBorder_MSUPreflightUpdate(5, v11);
  id v13 = [*(id *)(a1 + 32) msuControlQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2;
  v16[3] = &unk_2640DCE98;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPrerequisiteCheckPreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportPrerequisiteCheckPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationPrepareUpdate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SUCoreMSU *)self updateDescriptor];

  if (v7)
  {
    uint64_t v8 = [(SUCoreMSU *)self updateDescriptor];
    uint64_t v9 = [v8 descriptorType];
    if (v9 == 2
      || ([(SUCoreMSU *)self updateDescriptor],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 descriptorType] == 4))
    {
      uint64_t v10 = [(SUCoreMSU *)self updateDescriptor];
      id v11 = [v10 updateBrainPath];

      if (v9 != 2) {
      if (v11)
      }
      {
LABEL_11:
        uint64_t v14 = [(SUCoreMSU *)self updateDescriptor];
        uint64_t v15 = [v14 descriptorType];
        if (v15 == 2
          || ([(SUCoreMSU *)self updateDescriptor],
              uint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [v3 descriptorType] == 4))
        {
          id v16 = [(SUCoreMSU *)self updateDescriptor];
          id v17 = [v16 updateBundlePath];

          if (v15 != 2) {
          if (v17)
          }
            goto LABEL_19;
          uint64_t v14 = [MEMORY[0x263F77DA8] sharedDiag];
          [v14 trackAnomaly:@"MSUPrepare", @"An update bundle path is required for prepare, yet none was provided", 8116, 0 forReason withResult withError];
        }
        else
        {
        }
LABEL_19:
        [(SUCoreMSU *)self setPerformingOperation:1];
        [(SUCoreMSU *)self setCancelingPrepare:0];
        [(SUCoreMSU *)self setNextProgressThreshold:0.0];
        [(SUCoreMSU *)self setPrepareProgressFinal:0];
        uint64_t v18 = [(SUCoreMSU *)self msuOperationQueue];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke;
        v19[3] = &unk_2640DCE98;
        v19[4] = self;
        id v20 = v5;
        dispatch_async(v18, v19);

        goto LABEL_20;
      }
      uint64_t v8 = [MEMORY[0x263F77DA8] sharedDiag];
      [v8 trackAnomaly:@"MSUPrepare", @"An update brain path is required for prepare, yet none was provided", 8116, 0 forReason withResult withError];
    }
    else
    {
    }
    goto LABEL_11;
  }
  id v12 = [MEMORY[0x263F77D78] sharedCore];
  id v13 = [v12 buildError:8803 underlying:0 description:@"Missing required descriptor for PrepareUpdate"];

  [(SUCoreMSU *)self _reportPrepareFailed:v13];
LABEL_20:
}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v26 = *(id *)(a1 + 32);
  +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.PrepareUpdate"];
  [*v2 setMsuHandle:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [v4 updateDescriptor];
  uint64_t v6 = (void *)[v4 _newPrepareOptionsUsingPolicy:v3 descriptor:v5];

  [*v2 _trackMSUOptions:@"performing MSU prepare" optionsName:@"prepareOptions" withMSUOptions:v6];
  uint64_t v25 = 0;
  id v7 = [*v2 updateDescriptor];
  if ([v7 descriptorType] == 2)
  {

LABEL_4:
    [*v2 _trackMSUBegin:@"MSUPrepareUpdate"];
    uint64_t v10 = [*v2 updateDescriptor];
    id v11 = [v10 updateBundlePath];
    uint64_t v12 = SUCoreBorder_MSUPrepareUpdate(v11, v6);
    goto LABEL_6;
  }
  uint64_t v8 = [*v2 updateDescriptor];
  uint64_t v9 = [v8 descriptorType];

  if (v9 == 4) {
    goto LABEL_4;
  }
  [*v2 _trackMSUBegin:@"MSUPrepareUpdateWithMAAsset"];
  uint64_t v10 = [*v2 updateDescriptor];
  id v11 = [v10 softwareUpdateAsset];
  uint64_t v12 = SUCoreBorder_MSUPrepareUpdateWithMAAsset(v11, v6);
LABEL_6:
  id v13 = (void *)v12;

  +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.PrepareUpdate"];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(v2, (uint64_t)v13, v15);
    }
  }
  else
  {
    [*v2 setMsuHandle:v25];
    id v16 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v15 = [v16 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *v2;
      uint64_t v18 = [*v2 msuHandle];
      *(_DWORD *)buf = 138543618;
      id v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU prepare completed successfully, updating msuHandle: %ld", buf, 0x16u);
    }
  }

  uint64_t v19 = [*v2 msuControlQueue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke_1038;
  v22[3] = &unk_2640DCE98;
  id v20 = *v2;
  id v23 = v13;
  id v24 = v20;
  id v21 = v13;
  dispatch_async(v19, v22);
}

uint64_t __37__SUCoreMSU__operationPrepareUpdate___block_invoke_1038(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_reportPrepareFailed:");
    uint64_t v3 = [*(id *)(a1 + 40) updateDescriptor];
    if ([v3 descriptorType] == 2)
    {
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 40) updateDescriptor];
      uint64_t v9 = [v8 descriptorType];

      if (v9 != 4)
      {
        uint64_t v10 = kSU_M_MSUPrepareUpdateWithMAAsset;
        goto LABEL_11;
      }
    }
    uint64_t v10 = kSU_M_MSUPrepareUpdate;
LABEL_11:
    uint64_t v15 = *v10;
    id v16 = *(void **)(a1 + 40);
    uint64_t v17 = [*(id *)(a1 + 32) code];
    uint64_t v18 = *(void *)(a1 + 32);
    id v13 = v16;
    uint64_t v19 = v15;
    goto LABEL_14;
  }
  id v4 = objc_alloc(MEMORY[0x263F77E08]);
  LODWORD(v5) = 1.0;
  uint64_t v6 = (void *)[v4 initWithPhase:*MEMORY[0x263F781B8] isStalled:0 portionComplete:v5 remaining:-1.0];
  [v2 _reportPrepared:v6];

  id v7 = [*(id *)(a1 + 40) updateDescriptor];
  if ([v7 descriptorType] == 2)
  {
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) updateDescriptor];
    uint64_t v12 = [v11 descriptorType];

    if (v12 != 4)
    {
      id v13 = *(void **)(a1 + 40);
      uint64_t v14 = kSU_M_MSUPrepareUpdateWithMAAsset;
      goto LABEL_13;
    }
  }
  id v13 = *(void **)(a1 + 40);
  uint64_t v14 = kSU_M_MSUPrepareUpdate;
LABEL_13:
  uint64_t v19 = *v14;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
LABEL_14:
  [v13 _trackMSUEnd:v19 withResult:v17 withError:v18];
  [*(id *)(a1 + 40) setPerformingOperation:0];
  id v20 = *(void **)(a1 + 40);

  return [v20 setCancelingPrepare:0];
}

- (void)_operationSuspendUpdate
{
  uint64_t v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  [(SUCoreMSU *)self setPerformingOperation:1];
  id v4 = [(SUCoreMSU *)self msuOperationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_async(v4, block);
}

void __36__SUCoreMSU__operationSuspendUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 msuHandle];
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU suspend update with msuHandle: %ld", buf, 0x16u);
  }

  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUSuspendUpdate"];
  [*(id *)(a1 + 32) msuHandle];
  double v5 = SUCoreBorder_MSUSuspendUpdate();
  uint64_t v6 = [*(id *)(a1 + 32) msuControlQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke_1040;
  v9[3] = &unk_2640DCE98;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __36__SUCoreMSU__operationSuspendUpdate__block_invoke_1040(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSuspendFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = v4;
  }
  else
  {
    [v2 _reportSuspended];
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUSuspendUpdate" withResult:v5 withError:v6];
  id v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_operationResumeUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke;
  v8[3] = &unk_2640DCE98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [v3 resumePolicy];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 32) updateDescriptor];
  id v7 = [*(id *)(a1 + 40) resumePolicy];
  id v8 = [v7 baseResumeOptions];
  id v9 = [*(id *)(a1 + 40) resumePolicy];
  id v10 = [v9 additionalOptions];
  uint64_t v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU resume" optionsName:@"resumeUpdateOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUResumeUpdateWithOptions"];
  uint64_t v20 = 0;
  uint64_t v12 = SUCoreBorder_MSUResumeUpdateWithOptions(v11);
  id v13 = [*(id *)(a1 + 32) msuControlQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke_2;
  v16[3] = &unk_2640DDE70;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  uint64_t v19 = 0;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __36__SUCoreMSU__operationResumeUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v3 = [v2 oslog];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _reportResumeFailed:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    id v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 40);
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v10 msuHandle];
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU resume completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 40) _reportResumed];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUResumeUpdateWithOptions" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationApplyUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  [(SUCoreMSU *)self setNextProgressThreshold:0.0];
  [(SUCoreMSU *)self setApplyProgressFinal:0];
  [(SUCoreMSU *)self setApplyProgressActionText:0];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke;
  v8[3] = &unk_2640DCE98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __35__SUCoreMSU__operationApplyUpdate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v20 = *(id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 updateDescriptor];
  uint64_t v5 = [*(id *)(a1 + 40) applyPolicy];
  uint64_t v6 = [v5 baseApplyOptions];
  id v7 = (void *)[v2 _newMSUOptionsUsingPolicy:v3 descriptor:v4 baseOptions:v6];

  [*(id *)(a1 + 40) updateApplyOptionsWithExtensions:v7];
  id v8 = [*(id *)(a1 + 40) applyPolicy];
  id v9 = [v8 additionalOptions];
  [v7 addEntriesFromDictionary:v9];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU apply" optionsName:@"applyOptions" withMSUOptions:v7];
  id v10 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = [v12 msuHandle];
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ performing MSU apply with msuHandle: %ld", buf, 0x16u);
  }

  +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.ApplyUpdate"];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUApplyUpdate"];
  id v13 = SUCoreBorder_MSUApplyUpdate([*(id *)(a1 + 32) msuHandle], v7);
  +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.ApplyUpdate"];
  __int16 v14 = [*(id *)(a1 + 32) msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke_1053;
  block[3] = &unk_2640DCE98;
  uint64_t v15 = *(void *)(a1 + 32);
  id v18 = v13;
  uint64_t v19 = v15;
  id v16 = v13;
  dispatch_async(v14, block);
}

uint64_t __35__SUCoreMSU__operationApplyUpdate___block_invoke_1053(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportApplyFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportApplied];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUApplyUpdate" withResult:v5 withError:v6];
  id v8 = *(void **)(a1 + 40);

  return [v8 setPerformingOperation:0];
}

- (void)_removePrepared
{
  uint64_t v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUCoreMSU *)self msuOperationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SUCoreMSU__removePrepared__block_invoke;
  block[3] = &unk_2640DC338;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __28__SUCoreMSU__removePrepared__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPurgeSuspendedUpdate"];
  v2 = SUCoreBorder_MSUPurgeSuspendedUpdate();
  uint64_t v3 = [*(id *)(a1 + 32) msuControlQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__SUCoreMSU__removePrepared__block_invoke_2;
  v6[3] = &unk_2640DCE98;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v2;
  uint64_t v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __28__SUCoreMSU__removePrepared__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportRemoveFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [v2 _reportRemoved];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSUPurgeSuspendedUpdate" withResult:v5 withError:v6];
  uint64_t v8 = *(void **)(a1 + 40);

  return [v8 setRemovingPrepared:0];
}

- (void)_operationRollbackUpdatePrepare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke;
  v8[3] = &unk_2640DCE98;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v7 = [v5 rollbackDescriptor];
    uint64_t v8 = (void *)[v5 _newRollbackPrepareOptionsUsingPolicy:v6 rollbackDescriptor:v7];

    [*(id *)(a1 + 40) _trackMSUOptions:@"performing MSU rollback prepare" optionsName:@"rollbackOptions" withMSUOptions:v8];
    +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.RollbackUpdatePrepare"];
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdatePrepare"];
    *(void *)buf = 0;
    id v9 = SUCoreBorder_MSURollbackUpdatePrepare((uint64_t)buf, v8);
    +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.RollbackUpdatePrepare"];
    id v10 = [*(id *)(a1 + 40) msuControlQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2;
    block[3] = &unk_2640DDE70;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 40);
    id v26 = v11;
    uint64_t v27 = v12;
    uint64_t v28 = *(void *)buf;
    dispatch_async(v10, block);

    id v13 = v26;
    goto LABEL_8;
  }
  uint64_t v3 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if (v4) {
    goto LABEL_4;
  }
  __int16 v14 = NSString;
  uint64_t v15 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v8 = [v14 stringWithFormat:@"Rollback prepare operation only supported for Splat asset types. Asset Type %@ unsupported", v15];

  id v16 = [MEMORY[0x263F77DE8] sharedLogger];
  id v17 = [v16 oslog];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v18;
    __int16 v34 = 2114;
    long long v35 = v8;
    _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F78058];
  uint64_t v31 = *MEMORY[0x263F08320];
  v32 = v8;
  id v21 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v22 = [v19 errorWithDomain:v20 code:8118 userInfo:v21];

  __int16 v23 = [MEMORY[0x263F77DA8] sharedDiag];
  [v23 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_PREPARE" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v22];

  uint64_t v24 = [*(id *)(a1 + 40) msuControlQueue];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_1064;
  v29[3] = &unk_2640DCE98;
  v29[4] = *(void *)(a1 + 40);
  id v11 = v22;
  id v30 = v11;
  dispatch_async(v24, v29);

  id v13 = v30;
LABEL_8:
}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_1064(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportRollbackFailed:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 setPerformingOperation:0];
}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F77DE8] sharedLogger];
  char v4 = [v3 oslog];

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU rollback completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _reportRollbackPrepareSuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  [v8 _trackMSUEnd:@"MSURollbackUpdatePrepare" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateSuspend:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke;
  v8[3] = &unk_2640DCE98;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v7;
      __int16 v33 = 2048;
      uint64_t v34 = [v7 msuHandle];
      _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU suspend rollback update with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.RollbackUpdateSuspend"];
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateSuspend"];
    [*(id *)(a1 + 40) msuHandle];
    uint64_t v8 = SUCoreBorder_MSURollbackUpdateSuspend();
    +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.RollbackUpdateSuspend"];
    id v9 = [*(id *)(a1 + 40) msuControlQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1078;
    block[3] = &unk_2640DCE98;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 40);
    id v25 = v10;
    uint64_t v26 = v11;
    dispatch_async(v9, block);

    int v12 = v25;
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v13 = NSString;
  __int16 v14 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  int v12 = [v13 stringWithFormat:@"Rollback suspend operation only supported for Splat asset types. Asset Type %@ unsupported", v14];

  uint64_t v15 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v12;
    _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F78058];
  uint64_t v29 = *MEMORY[0x263F08320];
  id v30 = v12;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v21 = [v18 errorWithDomain:v19 code:8118 userInfo:v20];

  id v22 = [MEMORY[0x263F77DA8] sharedDiag];
  [v22 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_SUSPEND" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v21];

  __int16 v23 = [*(id *)(a1 + 40) msuControlQueue];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1077;
  v27[3] = &unk_2640DCE98;
  v27[4] = *(void *)(a1 + 40);
  id v10 = v21;
  id v28 = v10;
  dispatch_async(v23, v27);

LABEL_10:
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1077(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportRollbackFailed:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setPerformingOperation:0];
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1078(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F77DE8] sharedLogger];
  char v4 = [v3 oslog];

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1078_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 40);
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = [v9 msuHandle];
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU suspend rollback completed successfully, msuHandle: %ld", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 40) _reportRollbackSuspendSuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  [v8 _trackMSUEnd:@"MSURollbackUpdateSuspend" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateResume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke;
  v8[3] = &unk_2640DCE98;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v33 = 2048;
      uint64_t v34 = [v7 msuHandle];
      _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing MSU resume rollback update with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.RollbackUpdateResume"];
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateResume"];
    *(void *)buf = 0;
    uint64_t v8 = SUCoreBorder_MSURollbackUpdateResumeWithOptions(0);
    +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.RollbackUpdateResume"];
    id v9 = [*(id *)(a1 + 40) msuControlQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1086;
    block[3] = &unk_2640DDE70;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 40);
    id v25 = v10;
    uint64_t v26 = v11;
    uint64_t v27 = *(void *)buf;
    dispatch_async(v9, block);

    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if (v4) {
    goto LABEL_4;
  }
  int v12 = NSString;
  __int16 v13 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v14 = [v12 stringWithFormat:@"Rollback resume operation only supported for Splat asset types. Asset Type %@ unsupported", v13];

  uint64_t v15 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v14;
    _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F78058];
  uint64_t v30 = *MEMORY[0x263F08320];
  uint64_t v31 = v14;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v21 = [v18 errorWithDomain:v19 code:8118 userInfo:v20];

  id v22 = [MEMORY[0x263F77DA8] sharedDiag];
  [v22 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_RESUME" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v21];

  __int16 v23 = [*(id *)(a1 + 40) msuControlQueue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1085;
  v28[3] = &unk_2640DCE98;
  v28[4] = *(void *)(a1 + 40);
  id v10 = v21;
  id v29 = v10;
  dispatch_async(v23, v28);

LABEL_10:
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1085(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportRollbackFailed:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setPerformingOperation:0];
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1086(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v3 = [v2 oslog];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1086_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    char v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }
  else
  {
    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 40);
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v10 msuHandle];
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU resume completed successfully, updating msuHandle: %ld", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 40) _reportRollbackResumeSuccess];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  [v7 _trackMSUEnd:@"MSURollbackUpdateResume" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateApply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreMSU *)self setPerformingOperation:1];
  uint64_t v6 = [(SUCoreMSU *)self msuOperationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke;
  v8[3] = &unk_2640DCE98;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v7 = [v5 rollbackDescriptor];
    uint64_t v8 = [*(id *)(a1 + 32) rollbackPolicy];
    id v9 = [v8 baseRollbackOptions];
    id v10 = [*(id *)(a1 + 32) rollbackPolicy];
    uint64_t v11 = [v10 additionalOptions];
    int v12 = (void *)[v5 _newMSURollbackOptionsUsingPolicy:v6 rollbackDescriptor:v7 baseOptions:v9 additionalOptions:v11];

    [*(id *)(a1 + 32) updateApplyOptionsWithExtensions:v12];
    [*(id *)(a1 + 40) _trackMSUOptions:@"performing MSU rollback apply" optionsName:@"applyOptions" withMSUOptions:v12];
    __int16 v13 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = [v15 msuHandle];
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ performing MSU rollback apply with msuHandle: %ld", buf, 0x16u);
    }

    +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"msu.ApplyUpdate"];
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateApply"];
    uint64_t v16 = SUCoreBorder_MSURollbackUpdateApply([*(id *)(a1 + 40) msuHandle], v12);
    +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"msu.ApplyUpdate"];
    uint64_t v17 = [*(id *)(a1 + 40) msuControlQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1097;
    block[3] = &unk_2640DCE98;
    id v18 = v16;
    uint64_t v19 = *(void *)(a1 + 40);
    id v33 = v18;
    uint64_t v34 = v19;
    dispatch_async(v17, block);

    uint64_t v20 = v33;
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if (v4) {
    goto LABEL_4;
  }
  id v21 = NSString;
  id v22 = [*(id *)(a1 + 32) softwareUpdateAssetType];
  int v12 = [v21 stringWithFormat:@"Rollback apply operation only supported for Splat asset types. Asset Type %@ unsupported", v22];

  __int16 v23 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v24 = [v23 oslog];

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v25;
    __int16 v41 = 2114;
    uint64_t v42 = (uint64_t)v12;
    _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v26 = (void *)MEMORY[0x263F087E8];
  uint64_t v27 = *MEMORY[0x263F78058];
  uint64_t v37 = *MEMORY[0x263F08320];
  long long v38 = v12;
  id v28 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v29 = [v26 errorWithDomain:v27 code:8118 userInfo:v28];

  uint64_t v30 = [MEMORY[0x263F77DA8] sharedDiag];
  [v30 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_APPLY" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v29];

  uint64_t v31 = [*(id *)(a1 + 40) msuControlQueue];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1093;
  v35[3] = &unk_2640DCE98;
  v35[4] = *(void *)(a1 + 40);
  id v18 = v29;
  id v36 = v18;
  dispatch_async(v31, v35);

  uint64_t v20 = v36;
LABEL_10:
}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1093(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportRollbackFailed:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setPerformingOperation:0];
}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1097(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263F77DE8] sharedLogger];
  char v4 = [v3 oslog];

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1097_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackApplyFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU apply rollback completed successfully", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 40) _reportRollbackApplySuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  [v8 _trackMSUEnd:@"MSURollbackUpdateApply" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)loadBrainProgress:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUCoreMSU_loadBrainProgress_error___block_invoke;
  block[3] = &unk_2640DCD70;
  id v12 = v7;
  id v13 = v6;
  __int16 v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __37__SUCoreMSU_loadBrainProgress_error___block_invoke(id *a1)
{
  if (a1[4])
  {
    objc_msgSend(a1[6], "_reportBrainLoadFailed:");
    objc_msgSend(a1[6], "_trackMSUEnd:withResult:withError:", @"loadUpdateBrainWithMAOptions", objc_msgSend(a1[4], "code"), a1[4]);
    id v2 = a1[6];
    [v2 setPerformingOperation:0];
  }
  else
  {
    id v14 = [a1[5] safeStringForKey:*MEMORY[0x263F55918]];
    if ([v14 isEqualToString:*MEMORY[0x263F55910]])
    {
      id v3 = a1[6];
      id v4 = objc_alloc(MEMORY[0x263F77E08]);
      LODWORD(v5) = -1.0;
      id v6 = (void *)[v4 initWithPhase:*MEMORY[0x263F781B0] isStalled:1 portionComplete:v5 remaining:-1.0];
      [v3 _reportBrainLoadStalled:v6];
    }
    else
    {
      int v7 = [v14 isEqualToString:*MEMORY[0x263F55908]];
      id v8 = a1[6];
      id v9 = objc_alloc(MEMORY[0x263F77E08]);
      uint64_t v11 = *MEMORY[0x263F781B0];
      if (v7)
      {
        LODWORD(v10) = 1.0;
        id v12 = (void *)[v9 initWithPhase:v11 isStalled:0 portionComplete:v10 remaining:-1.0];
        [v8 _reportBrainLoaded:v12];

        [a1[6] _trackMSUEnd:@"loadUpdateBrainWithMAOptions" withResult:0 withError:0];
        [a1[6] setPerformingOperation:0];
      }
      else
      {
        LODWORD(v10) = -1.0;
        id v13 = (void *)[v9 initWithPhase:v11 isStalled:0 portionComplete:v10 remaining:-1.0];
        [v8 _reportBrainLoadProgress:v13];
      }
    }
  }
}

- (int)prepareProgress:(__CFDictionary *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  double v5 = [(SUCoreMSU *)self msuControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SUCoreMSU_prepareProgress___block_invoke;
  block[3] = &unk_2640DCF08;
  void block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LODWORD(a3) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return (int)a3;
}

void __29__SUCoreMSU_prepareProgress___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) cancelingPrepare])
  {
    id v2 = [MEMORY[0x263F77DE8] sharedLogger];
    id v3 = [v2 oslog];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v4;
      _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting cancel (on return from prepare progress)", buf, 0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  else
  {
    CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x263F55BF8]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v13 doubleValue];
    *(float *)&double v5 = v5;
    float v6 = fminf(fmaxf(*(float *)&v5 / 100.0, 0.0), 1.0);
    [*(id *)(a1 + 32) nextProgressThreshold];
    if (v6 > v7 && ([*(id *)(a1 + 32) prepareProgressFinal] & 1) == 0)
    {
      *(float *)&double v8 = v6 + 0.01;
      if ((float)(v6 + 0.01) >= 0.99)
      {
        if (v6 >= 0.99)
        {
          objc_msgSend(*(id *)(a1 + 32), "setPrepareProgressFinal:", 1, v8);
          if (v6 > 0.99) {
            float v6 = 0.99;
          }
        }
      }
      else
      {
        [*(id *)(a1 + 32) setNextProgressThreshold:v8];
      }
      id v9 = *(void **)(a1 + 32);
      id v10 = objc_alloc(MEMORY[0x263F77E08]);
      *(float *)&double v11 = v6;
      id v12 = (void *)[v10 initWithPhase:*MEMORY[0x263F781B8] isStalled:0 portionComplete:v11 remaining:-1.0];
      [v9 _reportPrepareProgress:v12];
    }
  }
}

- (int)applyProgress:(__CFDictionary *)a3
{
  double v5 = [(SUCoreMSU *)self msuControlQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__SUCoreMSU_applyProgress___block_invoke;
  v7[3] = &unk_2640DDEE8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v5, v7);

  return 0;
}

void __27__SUCoreMSU_applyProgress___block_invoke(uint64_t a1)
{
  value = 0;
  float valuePtr = -1.0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x263F55BF8], (const void **)&value))
  {
    BOOL v3 = value == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  if (v3
    || (CFTypeID v4 = CFGetTypeID(value), v4 != CFNumberGetTypeID())
    || (CFNumberGetValue((CFNumberRef)value, kCFNumberFloatType, &valuePtr), *(float *)&double v2 = valuePtr, valuePtr < 0.0)
    || (float v5 = fminf(valuePtr, 1.0), [*(id *)(a1 + 32) nextProgressThreshold], v5 <= *(float *)&v2)
    || ([*(id *)(a1 + 32) applyProgressFinal] & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextProgressThreshold", v2);
    float v5 = v6;
    char v7 = 0;
    goto LABEL_10;
  }
  *(float *)&double v2 = v5 + 0.01;
  if ((float)(v5 + 0.01) < 0.99)
  {
    [*(id *)(a1 + 32) setNextProgressThreshold:v2];
LABEL_23:
    char v7 = 1;
    goto LABEL_10;
  }
  if (v5 < 0.99) {
    goto LABEL_23;
  }
  char v7 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setApplyProgressFinal:", 1, v2);
  if (v5 > 0.99) {
    float v5 = 0.99;
  }
LABEL_10:
  double v8 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x263F55BF0]);
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      id v9 = v9;
      double v11 = [*(id *)(a1 + 32) applyProgressActionText];

      id v12 = *(void **)(a1 + 32);
      if (!v11)
      {
LABEL_15:
        [v12 setApplyProgressActionText:v9];
LABEL_18:
        uint64_t v15 = *(void **)(a1 + 32);
        id v16 = objc_alloc(MEMORY[0x263F77E08]);
        *(float *)&double v17 = v5;
        id v18 = (void *)[v16 initWithPhase:*MEMORY[0x263F78190] isStalled:0 portionComplete:v9 remaining:v17 actionText:-1.0];
        [v15 _reportApplyProgress:v18];

        goto LABEL_19;
      }
      id v13 = [v12 applyProgressActionText];
      char v14 = [v13 isEqualToString:v9];

      if ((v14 & 1) == 0)
      {
        id v12 = *(void **)(a1 + 32);
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  if (v7) {
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_reportBrainLoadProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  float v6 = [(SUCoreMSU *)self msuDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__SUCoreMSU__reportBrainLoadProgress___block_invoke;
    v12[3] = &unk_2640DCE98;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    CFTypeID v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      double v17 = v11;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadProgress:); so not reporting progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __38__SUCoreMSU__reportBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuBrainLoadProgress:*(void *)(a1 + 40)];
}

- (void)_reportBrainLoadStalled:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  float v6 = [(SUCoreMSU *)self msuDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__SUCoreMSU__reportBrainLoadStalled___block_invoke;
    v12[3] = &unk_2640DCE98;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    CFTypeID v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      double v17 = v11;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadStalled:); so not reporting stalled with progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __37__SUCoreMSU__reportBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuBrainLoadStalled:*(void *)(a1 + 40)];
}

- (void)_reportBrainLoaded:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  float v6 = [(SUCoreMSU *)self loadBrainTransaction];
  [(SUCoreMSU *)self setLoadBrainTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__SUCoreMSU__reportBrainLoaded___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v14 = v4;
    id v15 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    double v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      double v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoaded:); so not reporting brain loaded with progress=%{public}@",
        buf,
        0x16u);
    }
    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.LoadBrain"];
  }
}

uint64_t __32__SUCoreMSU__reportBrainLoaded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuBrainLoaded:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.LoadBrain"];
}

- (void)_reportBrainLoadFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  float v6 = [(SUCoreMSU *)self loadBrainTransaction];
  [(SUCoreMSU *)self setLoadBrainTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__SUCoreMSU__reportBrainLoadFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    double v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuBrainLoadFailed:); so not reporting brain load failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.LoadBrain"];
  }
}

uint64_t __36__SUCoreMSU__reportBrainLoadFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuBrainLoadFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.LoadBrain"];
}

- (void)_reportSUDownloadPreflighted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self preflightDownloadSUTransaction];
  [(SUCoreMSU *)self setPreflightDownloadSUTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSUDownloadPreflighted); so not reporting SU download preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuSUDownloadPreflighted];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportSUDownloadPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self preflightDownloadSUTransaction];
  [(SUCoreMSU *)self setPreflightDownloadSUTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSUDownloadPreflightFailed:); so not reporting SU download pr"
        "eflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuSUDownloadPreflightFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportPersonalizePreflighted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self preflightPersonalizeTransaction];
  [(SUCoreMSU *)self setPreflightPersonalizeTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPersonalizePreflighted); so not reporting personalization preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.PreflightPersonalize"];
  }
}

uint64_t __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPersonalizePreflighted];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.PreflightPersonalize"];
}

- (void)_reportPersonalizePreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self preflightPersonalizeTransaction];
  [(SUCoreMSU *)self setPreflightPersonalizeTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPersonalizePreflightFailed:); so not reporting personalizati"
        "on preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPersonalizePreflightFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportFDRRecoveryPreflighted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self preflightFDRRecoveryTransaction];
  [(SUCoreMSU *)self setPreflightFDRRecoveryTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflighted); so not reporting FDRRecovery preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.PreflightFDRRecovery"];
  }
}

uint64_t __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuFDRRecoveryPreflighted];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.PreflightFDRRecovery"];
}

- (void)_reportFDRRecoveryPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self preflightFDRRecoveryTransaction];
  [(SUCoreMSU *)self setPreflightFDRRecoveryTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflightFailed:); so not reporting FDRRecovery p"
        "reflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PreflightFDRRecovery"];
  }
}

uint64_t __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuFDRRecoveryPreflightFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PreflightFDRRecovery"];
}

- (void)_reportWakeupPreflighted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self preflightWakeupTransaction];
  [(SUCoreMSU *)self setPreflightWakeupTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SUCoreMSU__reportWakeupPreflighted__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuWakeupPreflighted); so not reporting wakeup preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.PreflightWakeup"];
  }
}

uint64_t __37__SUCoreMSU__reportWakeupPreflighted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuWakeupPreflighted];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.PreflightWakeup"];
}

- (void)_reportWakeupPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self preflightWakeupTransaction];
  [(SUCoreMSU *)self setPreflightWakeupTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuWakeupPreflightFailed:); so not reporting wakeup preflight f"
        "ailed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PreflightWakeup"];
  }
}

uint64_t __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuWakeupPreflightFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PreflightWakeup"];
}

- (void)_reportPrerequisiteCheckPreflighted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self preflightPrerequisiteCheckTransaction];
  [(SUCoreMSU *)self setPreflightPrerequisiteCheckTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflighted); so not reporting prerequisite"
        " check preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.PreflightPrerequisiteCheck"];
  }
}

uint64_t __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPrerequisiteCheckPreflighted];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.PreflightPrerequisiteCheck"];
}

- (void)_reportPrerequisiteCheckPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self preflightPrerequisiteCheckTransaction];
  [(SUCoreMSU *)self setPreflightPrerequisiteCheckTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflightFailed:); so not reporting prerequ"
        "isite check preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PreflightPrerequisiteCheck"];
  }
}

uint64_t __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPrerequisiteCheckPreflightFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PreflightPrerequisiteCheck"];
}

- (void)_reportPrepared:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self prepareUpdateTransaction];
  [(SUCoreMSU *)self setPrepareUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__SUCoreMSU__reportPrepared___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v14 = v4;
    id v15 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      __int16 v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepared:); so not reporting prepared with progress=%{public}@",
        buf,
        0x16u);
    }
    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PrepareUpdate"];
  }
}

uint64_t __29__SUCoreMSU__reportPrepared___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPrepared:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PrepareUpdate"];
}

- (void)_reportPrepareProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self msuDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __36__SUCoreMSU__reportPrepareProgress___block_invoke;
    v12[3] = &unk_2640DCE98;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    CFTypeID v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepareProgress:); so not reporting prepare progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __36__SUCoreMSU__reportPrepareProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPrepareProgress:*(void *)(a1 + 40)];
}

- (void)_reportApplyProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self msuDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __34__SUCoreMSU__reportApplyProgress___block_invoke;
    v12[3] = &unk_2640DCE98;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    CFTypeID v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplyProgress:); so not reporting apply progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __34__SUCoreMSU__reportApplyProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuApplyProgress:*(void *)(a1 + 40)];
}

- (void)_reportPrepareFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self prepareUpdateTransaction];
  [(SUCoreMSU *)self setPrepareUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__SUCoreMSU__reportPrepareFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuPrepareFailed:); so not reporting prepare failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.PrepareUpdate"];
  }
}

uint64_t __34__SUCoreMSU__reportPrepareFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuPrepareFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.PrepareUpdate"];
}

- (void)_reportSuspended
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self suspendUpdateTransaction];
  [(SUCoreMSU *)self setSuspendUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __29__SUCoreMSU__reportSuspended__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSuspended); so not reporting suspended",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.SuspendUpdate"];
  }
}

uint64_t __29__SUCoreMSU__reportSuspended__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuSuspended];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.SuspendUpdate"];
}

- (void)_reportSuspendFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self suspendUpdateTransaction];
  [(SUCoreMSU *)self setSuspendUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__SUCoreMSU__reportSuspendFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuSuspendFailed:); so not reporting suspend failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.SuspendUpdate"];
  }
}

uint64_t __34__SUCoreMSU__reportSuspendFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuSuspendFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.SuspendUpdate"];
}

- (void)_reportResumed
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self resumeUpdateTransaction];
  [(SUCoreMSU *)self setResumeUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportResumed__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuResumed); so not reporting resumed",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.ResumeUpdate"];
  }
}

uint64_t __27__SUCoreMSU__reportResumed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuResumed];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.ResumeUpdate"];
}

- (void)_reportResumeFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self resumeUpdateTransaction];
  [(SUCoreMSU *)self setResumeUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__SUCoreMSU__reportResumeFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuResumeFailed:); so not reporting resume failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.ResumeUpdate"];
  }
}

uint64_t __33__SUCoreMSU__reportResumeFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuResumeFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.ResumeUpdate"];
}

- (void)_reportApplied
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self applyUpdateTransaction];
  [(SUCoreMSU *)self setApplyUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportApplied__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplied); so not reporting applied",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.ApplyUpdate"];
  }
}

uint64_t __27__SUCoreMSU__reportApplied__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuApplied];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.ApplyUpdate"];
}

- (void)_reportApplyFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self applyUpdateTransaction];
  [(SUCoreMSU *)self setApplyUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__SUCoreMSU__reportApplyFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.ApplyUpdate"];
  }
}

uint64_t __32__SUCoreMSU__reportApplyFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuApplyFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.ApplyUpdate"];
}

- (void)_reportRollbackPrepareSuccess
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackPrepareSuccess); so not reporting msuRollbackPrepareSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackPrepareSuccess];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackSuspendSuccess
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackSuspendSuccess); so not reporting msuRollbackSuspendSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackSuspendSuccess];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackResumeSuccess
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackResumeSuccess); so not reporting msuRollbackResumeSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackResumeSuccess];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackApplySuccess
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackApplySuccess); so not reporting msuRollbackApplySuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackApplySuccess];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackApplyFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackApplyFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self rollbackUpdateTransaction];
  [(SUCoreMSU *)self setRollbackUpdateTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__SUCoreMSU__reportRollbackFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRollbackFailed:); so not reporting rollback failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __35__SUCoreMSU__reportRollbackFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRollbackFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.RollbackUpdate"];
}

- (void)_reportRemoved
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMSU *)self removePreparedTransaction];
  [(SUCoreMSU *)self setRemovePreparedTransaction:0];
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__SUCoreMSU__reportRemoved__block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRemoved); so not reporting removed",
        buf,
        0xCu);
    }

    [MEMORY[0x263F77D78] endTransaction:v4 withName:@"msu.RemovePrepared"];
  }
}

uint64_t __27__SUCoreMSU__reportRemoved__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRemoved];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"msu.RemovePrepared"];
}

- (void)_reportRemoveFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuControlQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(SUCoreMSU *)self removePreparedTransaction];
  [(SUCoreMSU *)self setRemovePreparedTransaction:0];
  char v7 = [(SUCoreMSU *)self msuDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__SUCoreMSU__reportRemoveFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    CFTypeID v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuRemoveFailed:); so not reporting remove failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x263F77D78] endTransaction:v6 withName:@"msu.RemovePrepared"];
  }
}

uint64_t __33__SUCoreMSU__reportRemoveFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuRemoveFailed:*(void *)(a1 + 40)];

  BOOL v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"msu.RemovePrepared"];
}

- (void)_reportAnomaly:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [(SUCoreMSU *)self msuDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(SUCoreMSU *)self clientDelegateCallbackQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __28__SUCoreMSU__reportAnomaly___block_invoke;
    v10[3] = &unk_2640DCE98;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    char v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate does not respond to selector(msuAnomaly:); so not reporting anomaly error=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __28__SUCoreMSU__reportAnomaly___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) msuDelegate];
  [v2 msuAnomaly:*(void *)(a1 + 40)];
}

- (void)_trackMSUBegin:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F77DA8];
  id v4 = a3;
  id v5 = [v3 sharedDiag];
  [v5 trackBegin:v4 atLevel:1 forModule:@"msu"];
}

- (void)_trackMSUEnd:(id)a3
{
}

- (void)_trackMSUEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  char v7 = (void *)MEMORY[0x263F77DA8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 sharedDiag];
  [v10 trackEnd:v9 atLevel:1 forModule:@"msu" withResult:a4 withError:v8];
}

- (void)_trackMSUOptions:(id)a3 optionsName:(id)a4 withMSUOptions:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = [v8 safeDescriptionWithName:v7 maxNestedLevel:0 withMaxValueLength:64 providingSubstitutionMap:v9];
  id v11 = [MEMORY[0x263F77DE8] sharedLogger];
  id v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v53 = self;
    __int16 v54 = 2114;
    id v55 = v39;
    __int16 v56 = 2114;
    uint64_t v57 = v10;
    _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
  }
  uint64_t v37 = (void *)v10;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(SUCoreMSU **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v19 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v20 = [v19 oslog];

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v18;
          _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v15);
  }

  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v22 = [v8 safeSubDescriptionAtNestedLevel:1 instanceAtLevel:0 withMaxValueLength:96 providingSubstitutionMap:v21];
  if (v22)
  {
    __int16 v23 = (void *)v22;
    id v36 = v7;
    unint64_t v24 = 0;
    do
    {
      unint64_t v41 = v24;
      id v25 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", v36, v37);
      uint64_t v26 = [v25 oslog];

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v53 = self;
        __int16 v54 = 2114;
        id v55 = v39;
        __int16 v56 = 2114;
        uint64_t v57 = (uint64_t)v23;
        _os_log_impl(&dword_20C8EA000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
      }
      uint64_t v40 = v23;

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v27 = v21;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(SUCoreMSU **)(*((void *)&v42 + 1) + 8 * j);
            id v33 = [MEMORY[0x263F77DE8] sharedLogger];
            uint64_t v34 = [v33 oslog];

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v32;
              _os_log_impl(&dword_20C8EA000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v29);
      }

      unint64_t v24 = v41 + 1;
      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);

      uint64_t v35 = [v8 safeSubDescriptionAtNestedLevel:1 instanceAtLevel:v41 + 1 withMaxValueLength:96 providingSubstitutionMap:v21];

      if (!v35) {
        break;
      }
      __int16 v23 = v35;
    }
    while (v41 < 5);

    id v7 = v36;
  }
}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F77D78];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [v10 sharedCore];
  id v18 = [v14 buildError:a4 underlying:v11 description:v12];

  uint64_t v15 = [MEMORY[0x263F77DA8] sharedDiag];
  uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"[MSU] %@", v13];

  __int16 v17 = (void *)[[NSString alloc] initWithFormat:@"%@ %@", self, v12];
  [v15 trackAnomaly:v16 forReason:v17 withResult:a4 withError:v18];

  [(SUCoreMSU *)self _reportAnomaly:v18];
}

- (OS_dispatch_queue)msuControlQueue
{
  return self->_msuControlQueue;
}

- (OS_dispatch_queue)msuOperationQueue
{
  return self->_msuOperationQueue;
}

- (NSString)descriptionName
{
  return self->_descriptionName;
}

- (void)setDescriptionName:(id)a3
{
}

- (id)msuDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_msuDelegate);

  return WeakRetained;
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (void)setUpdateDescriptor:(id)a3
{
}

- (BOOL)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(BOOL)a3
{
  self->_performingOperation = a3;
}

- (BOOL)cancelingPrepare
{
  return self->_cancelingPrepare;
}

- (void)setCancelingPrepare:(BOOL)a3
{
  self->_cancelingPrepare = a3;
}

- (BOOL)removingPrepared
{
  return self->_removingPrepared;
}

- (void)setRemovingPrepared:(BOOL)a3
{
  self->_removingPrepared = a3;
}

- (float)nextProgressThreshold
{
  return self->_nextProgressThreshold;
}

- (void)setNextProgressThreshold:(float)a3
{
  self->_nextProgressThreshold = a3;
}

- (BOOL)prepareProgressFinal
{
  return self->_prepareProgressFinal;
}

- (void)setPrepareProgressFinal:(BOOL)a3
{
  self->_prepareProgressFinal = a3;
}

- (BOOL)applyProgressFinal
{
  return self->_applyProgressFinal;
}

- (void)setApplyProgressFinal:(BOOL)a3
{
  self->_applyProgressFinal = a3;
}

- (NSString)applyProgressActionText
{
  return self->_applyProgressActionText;
}

- (void)setApplyProgressActionText:(id)a3
{
}

- (MSUUpdateBrainAssetLoader)brainLoader
{
  return self->_brainLoader;
}

- (void)setBrainLoader:(id)a3
{
}

- (int64_t)msuHandle
{
  return self->_msuHandle;
}

- (void)setMsuHandle:(int64_t)a3
{
  self->_msuHandle = a3;
}

- (SUCoreRollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
}

- (OS_os_transaction)loadBrainTransaction
{
  return self->_loadBrainTransaction;
}

- (void)setLoadBrainTransaction:(id)a3
{
}

- (OS_os_transaction)preflightDownloadSUTransaction
{
  return self->_preflightDownloadSUTransaction;
}

- (void)setPreflightDownloadSUTransaction:(id)a3
{
}

- (OS_os_transaction)preflightPersonalizeTransaction
{
  return self->_preflightPersonalizeTransaction;
}

- (void)setPreflightPersonalizeTransaction:(id)a3
{
}

- (OS_os_transaction)preflightFDRRecoveryTransaction
{
  return self->_preflightFDRRecoveryTransaction;
}

- (void)setPreflightFDRRecoveryTransaction:(id)a3
{
}

- (OS_os_transaction)preflightWakeupTransaction
{
  return self->_preflightWakeupTransaction;
}

- (void)setPreflightWakeupTransaction:(id)a3
{
}

- (OS_os_transaction)preflightPrerequisiteCheckTransaction
{
  return self->_preflightPrerequisiteCheckTransaction;
}

- (void)setPreflightPrerequisiteCheckTransaction:(id)a3
{
}

- (OS_os_transaction)prepareUpdateTransaction
{
  return self->_prepareUpdateTransaction;
}

- (void)setPrepareUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)suspendUpdateTransaction
{
  return self->_suspendUpdateTransaction;
}

- (void)setSuspendUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)resumeUpdateTransaction
{
  return self->_resumeUpdateTransaction;
}

- (void)setResumeUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)applyUpdateTransaction
{
  return self->_applyUpdateTransaction;
}

- (void)setApplyUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)cancelPrepareTransaction
{
  return self->_cancelPrepareTransaction;
}

- (void)setCancelPrepareTransaction:(id)a3
{
}

- (OS_os_transaction)removePreparedTransaction
{
  return self->_removePreparedTransaction;
}

- (void)setRemovePreparedTransaction:(id)a3
{
}

- (OS_os_transaction)rollbackUpdateTransaction
{
  return self->_rollbackUpdateTransaction;
}

- (void)setRollbackUpdateTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_removePreparedTransaction, 0);
  objc_storeStrong((id *)&self->_cancelPrepareTransaction, 0);
  objc_storeStrong((id *)&self->_applyUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_resumeUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_suspendUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_prepareUpdateTransaction, 0);
  objc_storeStrong((id *)&self->_preflightPrerequisiteCheckTransaction, 0);
  objc_storeStrong((id *)&self->_preflightWakeupTransaction, 0);
  objc_storeStrong((id *)&self->_preflightFDRRecoveryTransaction, 0);
  objc_storeStrong((id *)&self->_preflightPersonalizeTransaction, 0);
  objc_storeStrong((id *)&self->_preflightDownloadSUTransaction, 0);
  objc_storeStrong((id *)&self->_loadBrainTransaction, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_brainLoader, 0);
  objc_storeStrong((id *)&self->_applyProgressActionText, 0);
  objc_storeStrong((id *)&self->_updateDescriptor, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_destroyWeak(&self->_msuDelegate);
  objc_storeStrong((id *)&self->_descriptionName, 0);
  objc_storeStrong((id *)&self->_msuOperationQueue, 0);

  objc_storeStrong((id *)&self->_msuControlQueue, 0);
}

- (void)_newMSUOptionsUsingPolicy:(void *)a1 descriptor:(NSObject *)a2 baseOptions:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 updateBrainLocationOverride];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "[NEW_MSU_OPTIONS] WARNING WARNING WARNING: Setting update brain location override: %{public}@", (uint8_t *)&v4, 0xCu);
}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)BOOL v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_20C8EA000, a2, a3, "%{public}@ MSU prepare completed with error (not updating msuHandle): %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ MSU resume failed to complete with error (not updating msuHandle): %@");
}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ MSU rollback completed with error (not updating msuHandle): %@");
}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_1078_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ MSU suspend rollback completed with error (not updating msuHandle): %@");
}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_1086_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ MSU resume rollback completed with error (not updating msuHandle): %@");
}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_1097_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ MSU apply rollback completed with error: %@");
}

@end