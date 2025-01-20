@interface SUManagerEngine
+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4;
+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4 comparisonFlags:(unint64_t)a5;
+ (BOOL)shouldHideInstallAlertForCoreDescriptor:(id)a3;
+ (id)SUDescriptorFromCoreDescriptor:(id)a3;
+ (id)SUDescriptorFromRollbackDescriptor:(id)a3;
+ (id)_generateStateTable;
+ (id)rollbackDescriptorForSUCoreRollbackDescriptor:(id)a3;
+ (int)softwareUpdateTypeForDescriptor:(id)a3;
+ (unint64_t)SUCoreAudienceTypeToSUSAudienceType:(int64_t)a3;
+ (unint64_t)SUCorePreferredTypeToSUSPreferenceType:(int64_t)a3;
+ (unint64_t)upgradeTypeForCoreDescriptor:(id)a3;
- (BOOL)_queue_createBrainLoadLockAssertion:(id *)a3;
- (BOOL)activated;
- (BOOL)activating;
- (BOOL)isBrainNetworkError:(id)a3;
- (BOOL)isBrainReloadError:(id)a3;
- (BOOL)isManagedScan;
- (BOOL)isPasscodeEnabled;
- (BOOL)isPasscodeLocked;
- (NSDictionary)stateTable;
- (NSString)engineName;
- (NSString)rollbackUUID;
- (SUCoreFSM)engineFSM;
- (SUCoreLog)engineLog;
- (SUCoreScan)activeScanner;
- (SUCoreUpdate)updateControl;
- (SUManagerEngine)initWithDelegate:(id)a3;
- (SUManagerEngineDelegate)managerDelegate;
- (SUManagerEngineDownloadDescriptor)downloadDescriptor;
- (SUManagerEngineParam)pendingManagedScanParams;
- (SUManagerEngineParam)pendingPurgeParams;
- (SUPolicyFactory)policyFactory;
- (__MKBAssertion)lockAssertion;
- (id)SUOperationProgressFromSUCoreProgress:(id)a3;
- (id)availableRollback;
- (id)previousRollback;
- (id)rollbackPolicy;
- (id)updatePolicy;
- (int)lockState;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_Activated:(id)a3 error:(id *)a4;
- (int64_t)action_ActivatedClean:(id)a3 error:(id *)a4;
- (int64_t)action_ActivatedHelper:(BOOL)a3;
- (int64_t)action_ArmInstallOrFail:(id)a3 error:(id *)a4;
- (int64_t)action_BrainLoaded:(id)a3 error:(id *)a4;
- (int64_t)action_Cancel:(id)a3 error:(id *)a4;
- (int64_t)action_CanceledDownloadRequested:(id)a3 error:(id *)a4;
- (int64_t)action_CheckLockAndNetwork:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadAndPrepare:(id)a3 error:(id *)a4;
- (int64_t)action_HandleCanceledPendingRollback:(id)a3 error:(id *)a4;
- (int64_t)action_HandlePendingDownload:(id)a3 error:(id *)a4;
- (int64_t)action_HandlePendingRollback:(id)a3 error:(id *)a4;
- (int64_t)action_InstallArmed:(id)a3 error:(id *)a4;
- (int64_t)action_InstallUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_LoadBrain:(id)a3 error:(id *)a4;
- (int64_t)action_NewDownloadPending:(id)a3 error:(id *)a4;
- (int64_t)action_Prepare:(id)a3 error:(id *)a4;
- (int64_t)action_ReloadBrain:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveAllPreserveCache:(id)a3 error:(id *)a4;
- (int64_t)action_RemovePreserving:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportApplyFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_ReportAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadFailedNoUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadFailedRemoveAll:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadFailedRollingBack:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadInstalling:(id)a3 error:(id *)a4;
- (int64_t)action_ReportDownloadProgress:(id)a3 error:(id *)a4;
- (int64_t)action_ReportInstallAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportInstallFailedNoUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_ReportInstallFailedRollingBack:(id)a3 error:(id *)a4;
- (int64_t)action_ReportPrepared:(id)a3 error:(id *)a4;
- (int64_t)action_ReportPreparedSet:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRemoveAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRemoveFailedRollingBack:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRemoveInstalling:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRollbackAwaitingReboot:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRollbackFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRollbackInstalling:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRollbackSucceeded:(id)a3 error:(id *)a4;
- (int64_t)action_Resume:(id)a3 error:(id *)a4;
- (int64_t)action_RollbackUpdate:(id)a3 error:(id *)a4;
- (int64_t)loadBrainHelper:(id)a3;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)loadBrainRetries;
- (void)_queue_cancelLockAssertion;
- (void)_updatePolicyFactoryMetricEventFields:(id)a3 updateUUID:(id)a4;
- (void)actionHelper_ReportApplyFailed:(id)a3;
- (void)actionHelper_ReportDownloadFailedRollingBack;
- (void)actionHelper_ReportInstallFailedNoUpdate;
- (void)actionHelper_ReportInstallFailedRollingBack;
- (void)actionHelper_ReportPrepared:(BOOL)a3;
- (void)actionHelper_ReportRemoveFailedRollingBack;
- (void)actionHelper_ReportRollbackCompleted:(id)a3 withError:(id)a4;
- (void)activateLoadingPersisted:(id)a3;
- (void)applyAttemptFailed:(id)a3;
- (void)cancelLockAssertion;
- (void)createBrainLoadLockAssertion:(id)a3;
- (void)downloadUpdate:(id)a3;
- (void)installUpdate:(id)a3;
- (void)notifyRollbackStarted:(id)a3;
- (void)onUnlock;
- (void)pathSatisficationStatusChangedTo:(BOOL)a3;
- (void)refreshInstallTonightConfig:(id)a3;
- (void)removeUpdateKeepingDocAssets:(BOOL)a3;
- (void)resetPolicy;
- (void)rollbackAttemptFailed:(id)a3 withError:(id)a4;
- (void)rollbackUpdateWithOptions:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setActivating:(BOOL)a3;
- (void)setActiveScanner:(id)a3;
- (void)setDownloadDescriptor:(id)a3;
- (void)setEngineFSM:(id)a3;
- (void)setIsManagedScan:(BOOL)a3;
- (void)setLoadBrainRetries:(unint64_t)a3;
- (void)setLockAssertion:(__MKBAssertion *)a3;
- (void)setPendingManagedScanParams:(id)a3;
- (void)setPendingPurgeParams:(id)a3;
- (void)setPolicyFactory:(id)a3;
- (void)setRollbackUUID:(id)a3;
- (void)setUpdateControl:(id)a3;
- (void)updateAnomaly:(id)a3;
- (void)updateApplied;
- (void)updateAssetDownloadPreflighted;
- (void)updateAssetDownloadProgress:(id)a3;
- (void)updateAssetDownloadStalled:(id)a3;
- (void)updateAssetDownloaded:(id)a3;
- (void)updateAttemptFailed:(id)a3;
- (void)updateBrainLoadProgress:(id)a3;
- (void)updateBrainLoadStalled:(id)a3;
- (void)updateBrainLoaded:(id)a3;
- (void)updateCanceled;
- (void)updatePrepareProgress:(id)a3;
- (void)updatePrepared:(id)a3;
- (void)updateRolledBack:(id)a3;
@end

@implementation SUManagerEngine

+ (id)_generateStateTable
{
  v460[18] = *MEMORY[0x263EF8340];
  v459[0] = *MEMORY[0x263F77D70];
  v457[0] = @"DownloadAndPrepare";
  uint64_t v455 = *MEMORY[0x263F77E30];
  uint64_t v2 = v455;
  v456 = @"ReportDownloadFailedNoUpdate";
  v160 = [NSDictionary dictionaryWithObjects:&v456 forKeys:&v455 count:1];
  v458[0] = v160;
  v457[1] = @"InstallUpdate";
  uint64_t v453 = v2;
  v454 = @"ReportInstallFailedNoUpdate";
  v159 = [NSDictionary dictionaryWithObjects:&v454 forKeys:&v453 count:1];
  v458[1] = v159;
  v457[2] = @"RollbackRequested";
  uint64_t v451 = v2;
  uint64_t v452 = *MEMORY[0x263F77D00];
  uint64_t v125 = v452;
  v158 = [NSDictionary dictionaryWithObjects:&v452 forKeys:&v451 count:1];
  v458[2] = v158;
  v457[3] = @"ActivateNoPersisted";
  v449[0] = *MEMORY[0x263F78168];
  uint64_t v3 = v449[0];
  v449[1] = v2;
  v450[0] = @"RemovingAll";
  v450[1] = @"RemoveAll";
  v157 = [NSDictionary dictionaryWithObjects:v450 forKeys:v449 count:2];
  v458[3] = v157;
  v457[4] = @"ActivateHavePersisted";
  v447[0] = v3;
  v447[1] = v2;
  v448[0] = @"RemovingExceptPreserved";
  v448[1] = @"RemovePreserving";
  v156 = [NSDictionary dictionaryWithObjects:v448 forKeys:v447 count:2];
  v458[4] = v156;
  v155 = [NSDictionary dictionaryWithObjects:v458 forKeys:v457 count:5];
  v460[0] = v155;
  v459[1] = @"RemovingExceptPreserved";
  v445[0] = @"DownloadAndPrepare";
  v443[0] = v3;
  v443[1] = v2;
  v444[0] = @"CancelingDownloadRequested";
  v444[1] = @"NewDownloadPending";
  v154 = [NSDictionary dictionaryWithObjects:v444 forKeys:v443 count:2];
  v446[0] = v154;
  v445[1] = @"InstallUpdate";
  uint64_t v441 = v2;
  v442 = @"ReportInstallFailedNoUpdate";
  v153 = [NSDictionary dictionaryWithObjects:&v442 forKeys:&v441 count:1];
  v446[1] = v153;
  v445[2] = @"RemoveUpdate";
  uint64_t v439 = v3;
  v440 = @"CancelingRemoveRequested";
  v152 = [NSDictionary dictionaryWithObjects:&v440 forKeys:&v439 count:1];
  v446[2] = v152;
  v445[3] = @"RollbackRequested";
  uint64_t v437 = v3;
  v438 = @"CancelingRollbackRequested";
  v151 = [NSDictionary dictionaryWithObjects:&v438 forKeys:&v437 count:1];
  v446[3] = v151;
  v445[4] = @"PreservedInvalid";
  v435[0] = v3;
  v435[1] = v2;
  v436[0] = @"RemovingAll";
  v436[1] = @"RemoveAll";
  v150 = [NSDictionary dictionaryWithObjects:v436 forKeys:v435 count:2];
  v446[4] = v150;
  v445[5] = @"PreservedValidated";
  uint64_t v4 = *MEMORY[0x263F77D50];
  v433[0] = v3;
  v433[1] = v2;
  uint64_t v5 = *MEMORY[0x263F77CE0];
  v434[0] = v4;
  uint64_t v162 = v4;
  v434[1] = v5;
  uint64_t v6 = v5;
  uint64_t v164 = v5;
  v149 = [NSDictionary dictionaryWithObjects:v434 forKeys:v433 count:2];
  v446[5] = v149;
  v148 = [NSDictionary dictionaryWithObjects:v446 forKeys:v445 count:6];
  v460[1] = v148;
  v459[2] = @"RemovingAll";
  v431[0] = @"DownloadAndPrepare";
  v429[0] = v3;
  v429[1] = v2;
  v430[0] = @"RemovingAllDownloadRequested";
  v430[1] = @"NewDownloadPending";
  v147 = [NSDictionary dictionaryWithObjects:v430 forKeys:v429 count:2];
  v432[0] = v147;
  v431[1] = @"InstallUpdate";
  uint64_t v427 = v2;
  v428 = @"ReportInstallFailedNoUpdate";
  v146 = [NSDictionary dictionaryWithObjects:&v428 forKeys:&v427 count:1];
  v432[1] = v146;
  v431[2] = @"RemoveUpdate";
  uint64_t v425 = v2;
  uint64_t v426 = *MEMORY[0x263F78140];
  uint64_t v167 = v426;
  v145 = [NSDictionary dictionaryWithObjects:&v426 forKeys:&v425 count:1];
  v432[2] = v145;
  v431[3] = @"RollbackRequested";
  uint64_t v423 = v3;
  v424 = @"RemovingAllRollbackRequested";
  v144 = [NSDictionary dictionaryWithObjects:&v424 forKeys:&v423 count:1];
  v432[3] = v144;
  v431[4] = @"RemovedAll";
  uint64_t v166 = *MEMORY[0x263F77D60];
  v421[0] = v3;
  v421[1] = v2;
  v422[0] = v166;
  v422[1] = @"ActivatedClean";
  v143 = [NSDictionary dictionaryWithObjects:v422 forKeys:v421 count:2];
  v432[4] = v143;
  v142 = [NSDictionary dictionaryWithObjects:v432 forKeys:v431 count:5];
  v460[2] = v142;
  v459[3] = @"RemovingAllDownloadRequested";
  v419[0] = @"DownloadAndPrepare";
  uint64_t v417 = v2;
  v418 = @"NewDownloadPending";
  v141 = [NSDictionary dictionaryWithObjects:&v418 forKeys:&v417 count:1];
  v420[0] = v141;
  v419[1] = @"InstallUpdate";
  uint64_t v415 = v2;
  v416 = @"ReportInstallFailedNoUpdate";
  v140 = [NSDictionary dictionaryWithObjects:&v416 forKeys:&v415 count:1];
  v420[1] = v140;
  v419[2] = @"RemoveUpdate";
  uint64_t v413 = v3;
  v414 = @"RemovingAll";
  v139 = [NSDictionary dictionaryWithObjects:&v414 forKeys:&v413 count:1];
  v420[2] = v139;
  v419[3] = @"RollbackRequested";
  uint64_t v411 = v3;
  v412 = @"RemovingAllRollbackRequested";
  v138 = [NSDictionary dictionaryWithObjects:&v412 forKeys:&v411 count:1];
  v420[3] = v138;
  v419[4] = @"RemovedAll";
  uint64_t v409 = v2;
  v410 = @"HandlePendingDownload";
  v137 = [NSDictionary dictionaryWithObjects:&v410 forKeys:&v409 count:1];
  v420[4] = v137;
  v419[5] = @"ReadyToDownload";
  v407[0] = v3;
  v407[1] = v2;
  v408[0] = v4;
  v408[1] = v6;
  v136 = [NSDictionary dictionaryWithObjects:v408 forKeys:v407 count:2];
  v420[5] = v136;
  v135 = [NSDictionary dictionaryWithObjects:v420 forKeys:v419 count:6];
  v460[3] = v135;
  v459[4] = @"RemovingAllRollbackRequested";
  v405[0] = @"DownloadAndPrepare";
  uint64_t v403 = v2;
  v404 = @"ReportDownloadFailedRollingBack";
  v134 = [NSDictionary dictionaryWithObjects:&v404 forKeys:&v403 count:1];
  v406[0] = v134;
  v405[1] = @"InstallUpdate";
  uint64_t v401 = v2;
  v402 = @"ReportInstallFailedRollingBack";
  v133 = [NSDictionary dictionaryWithObjects:&v402 forKeys:&v401 count:1];
  v406[1] = v133;
  v405[2] = @"RemoveUpdate";
  uint64_t v399 = v2;
  uint64_t v400 = v167;
  v132 = [NSDictionary dictionaryWithObjects:&v400 forKeys:&v399 count:1];
  v406[2] = v132;
  v405[3] = @"RollbackRequested";
  uint64_t v397 = v2;
  uint64_t v398 = v167;
  v131 = [NSDictionary dictionaryWithObjects:&v398 forKeys:&v397 count:1];
  v406[3] = v131;
  v405[4] = @"RemovedAll";
  uint64_t v395 = v2;
  v396 = @"HandleCanceledPendingRollback";
  v130 = [NSDictionary dictionaryWithObjects:&v396 forKeys:&v395 count:1];
  v406[4] = v130;
  v405[5] = @"ReadyToRollback";
  v393[0] = v3;
  v393[1] = v2;
  v394[0] = @"RollingBack";
  v394[1] = @"PerformRollback";
  v129 = [NSDictionary dictionaryWithObjects:v394 forKeys:v393 count:2];
  v406[5] = v129;
  v128 = [NSDictionary dictionaryWithObjects:v406 forKeys:v405 count:6];
  v460[4] = v128;
  v459[5] = @"CancelingDownloadRequested";
  v391[0] = @"DownloadAndPrepare";
  uint64_t v389 = v2;
  v390 = @"NewDownloadPending";
  v127 = [NSDictionary dictionaryWithObjects:&v390 forKeys:&v389 count:1];
  v392[0] = v127;
  v391[1] = @"InstallUpdate";
  uint64_t v387 = v2;
  v388 = @"ReportInstallFailedNoUpdate";
  v126 = [NSDictionary dictionaryWithObjects:&v388 forKeys:&v387 count:1];
  v392[1] = v126;
  v391[2] = @"RemoveUpdate";
  uint64_t v385 = v3;
  v386 = @"CancelingRemoveRequested";
  v124 = [NSDictionary dictionaryWithObjects:&v386 forKeys:&v385 count:1];
  v392[2] = v124;
  v391[3] = @"RollbackRequested";
  uint64_t v383 = v3;
  v384 = @"CancelingRollbackRequested";
  v123 = [NSDictionary dictionaryWithObjects:&v384 forKeys:&v383 count:1];
  v392[3] = v123;
  v391[4] = @"UpdateCanceled";
  uint64_t v381 = v2;
  v382 = @"CanceledDownloadRequested";
  v122 = [NSDictionary dictionaryWithObjects:&v382 forKeys:&v381 count:1];
  v392[4] = v122;
  v391[5] = @"UpdateFailed";
  uint64_t v379 = v2;
  v380 = @"CanceledDownloadRequested";
  v121 = [NSDictionary dictionaryWithObjects:&v380 forKeys:&v379 count:1];
  v392[5] = v121;
  v391[6] = @"PreservedInvalid";
  uint64_t v377 = v2;
  v378 = @"CanceledDownloadRequested";
  v120 = [NSDictionary dictionaryWithObjects:&v378 forKeys:&v377 count:1];
  v392[6] = v120;
  v391[7] = @"PreservedValidated";
  uint64_t v375 = v2;
  v376 = @"CanceledDownloadRequested";
  v119 = [NSDictionary dictionaryWithObjects:&v376 forKeys:&v375 count:1];
  v392[7] = v119;
  v391[8] = @"ReadyToDownload";
  v373[0] = v3;
  v373[1] = v2;
  v374[0] = @"RemovingExceptPreserved";
  v374[1] = @"RemovePreserving";
  v118 = [NSDictionary dictionaryWithObjects:v374 forKeys:v373 count:2];
  v392[8] = v118;
  v117 = [NSDictionary dictionaryWithObjects:v392 forKeys:v391 count:9];
  v460[5] = v117;
  v459[6] = @"CancelingRollbackRequested";
  v371[0] = @"DownloadAndPrepare";
  uint64_t v369 = v2;
  v370 = @"ReportDownloadFailedRollingBack";
  v116 = [NSDictionary dictionaryWithObjects:&v370 forKeys:&v369 count:1];
  v372[0] = v116;
  v371[1] = @"InstallUpdate";
  uint64_t v367 = v2;
  v368 = @"ReportInstallFailedRollingBack";
  v115 = [NSDictionary dictionaryWithObjects:&v368 forKeys:&v367 count:1];
  v372[1] = v115;
  v371[2] = @"RemoveUpdate";
  uint64_t v365 = v2;
  uint64_t v366 = v167;
  v114 = [NSDictionary dictionaryWithObjects:&v366 forKeys:&v365 count:1];
  v372[2] = v114;
  v371[3] = @"RollbackRequested";
  uint64_t v363 = v2;
  uint64_t v364 = v167;
  v113 = [NSDictionary dictionaryWithObjects:&v364 forKeys:&v363 count:1];
  v372[3] = v113;
  v371[4] = @"UpdateCanceled";
  uint64_t v361 = v2;
  v362 = @"HandleCanceledPendingRollback";
  v112 = [NSDictionary dictionaryWithObjects:&v362 forKeys:&v361 count:1];
  v372[4] = v112;
  v371[5] = @"UpdateFailed";
  uint64_t v359 = v2;
  v360 = @"HandleCanceledPendingRollback";
  v111 = [NSDictionary dictionaryWithObjects:&v360 forKeys:&v359 count:1];
  v372[5] = v111;
  v371[6] = @"PreservedInvalid";
  uint64_t v357 = v2;
  v358 = @"HandleCanceledPendingRollback";
  v110 = [NSDictionary dictionaryWithObjects:&v358 forKeys:&v357 count:1];
  v372[6] = v110;
  v371[7] = @"PreservedValidated";
  uint64_t v355 = v2;
  v356 = @"HandleCanceledPendingRollback";
  v109 = [NSDictionary dictionaryWithObjects:&v356 forKeys:&v355 count:1];
  v372[7] = v109;
  v371[8] = @"ReadyToRollback";
  v353[0] = v3;
  v353[1] = v2;
  v354[0] = @"RollingBack";
  v354[1] = @"PerformRollback";
  v108 = [NSDictionary dictionaryWithObjects:v354 forKeys:v353 count:2];
  v372[8] = v108;
  v107 = [NSDictionary dictionaryWithObjects:v372 forKeys:v371 count:9];
  v460[6] = v107;
  v459[7] = @"CancelingRemoveRequested";
  v351[0] = @"DownloadAndPrepare";
  v349[0] = v3;
  v349[1] = v2;
  v350[0] = @"CancelingDownloadRequested";
  v350[1] = @"NewDownloadPending";
  v106 = [NSDictionary dictionaryWithObjects:v350 forKeys:v349 count:2];
  v352[0] = v106;
  v351[1] = @"InstallUpdate";
  uint64_t v347 = v2;
  v348 = @"ReportInstallFailedNoUpdate";
  v105 = [NSDictionary dictionaryWithObjects:&v348 forKeys:&v347 count:1];
  v352[1] = v105;
  v351[2] = @"RemoveUpdate";
  uint64_t v345 = v2;
  uint64_t v346 = v167;
  v104 = [NSDictionary dictionaryWithObjects:&v346 forKeys:&v345 count:1];
  v352[2] = v104;
  v351[3] = @"RollbackRequested";
  uint64_t v343 = v3;
  v344 = @"CancelingRollbackRequested";
  v103 = [NSDictionary dictionaryWithObjects:&v344 forKeys:&v343 count:1];
  v352[3] = v103;
  v351[4] = @"UpdateCanceled";
  v341[0] = v3;
  v341[1] = v2;
  v342[0] = @"RemovingAll";
  v342[1] = @"RemoveAll";
  v102 = [NSDictionary dictionaryWithObjects:v342 forKeys:v341 count:2];
  v352[4] = v102;
  v351[5] = @"UpdateFailed";
  v339[0] = v3;
  v339[1] = v2;
  v340[0] = @"RemovingAll";
  v340[1] = @"RemoveAll";
  v101 = [NSDictionary dictionaryWithObjects:v340 forKeys:v339 count:2];
  v352[5] = v101;
  v351[6] = @"PreservedValidated";
  v337[0] = v3;
  v337[1] = v2;
  v338[0] = @"RemovingAll";
  v338[1] = @"RemoveAll";
  v100 = [NSDictionary dictionaryWithObjects:v338 forKeys:v337 count:2];
  v352[6] = v100;
  v351[7] = @"PreservedInvalid";
  v335[0] = v3;
  v335[1] = v2;
  v336[0] = @"RemovingAll";
  v336[1] = @"RemoveAll";
  v99 = [NSDictionary dictionaryWithObjects:v336 forKeys:v335 count:2];
  v352[7] = v99;
  v98 = [NSDictionary dictionaryWithObjects:v352 forKeys:v351 count:8];
  v460[7] = v98;
  v459[8] = v166;
  v333[0] = @"DownloadAndPrepare";
  v331[0] = v3;
  v331[1] = v2;
  v332[0] = v4;
  v332[1] = v164;
  v97 = [NSDictionary dictionaryWithObjects:v332 forKeys:v331 count:2];
  v334[0] = v97;
  v333[1] = @"InstallUpdate";
  uint64_t v329 = v2;
  v330 = @"ReportInstallFailedNoUpdate";
  v96 = [NSDictionary dictionaryWithObjects:&v330 forKeys:&v329 count:1];
  v334[1] = v96;
  v333[2] = @"RemoveUpdate";
  v327[0] = v3;
  v327[1] = v2;
  v328[0] = @"RemovingAll";
  v328[1] = @"RemoveAll";
  v95 = [NSDictionary dictionaryWithObjects:v328 forKeys:v327 count:2];
  v334[2] = v95;
  v333[3] = @"RollbackRequested";
  uint64_t v325 = v2;
  v326 = @"HandlePendingRollback";
  v94 = [NSDictionary dictionaryWithObjects:&v326 forKeys:&v325 count:1];
  v334[3] = v94;
  v333[4] = @"ReadyToRollback";
  v323[0] = v3;
  v323[1] = v2;
  v324[0] = @"RollingBack";
  v324[1] = @"PerformRollback";
  v93 = [NSDictionary dictionaryWithObjects:v324 forKeys:v323 count:2];
  v334[4] = v93;
  v92 = [NSDictionary dictionaryWithObjects:v334 forKeys:v333 count:5];
  v460[8] = v92;
  v459[9] = v4;
  v321[0] = @"DownloadAndPrepare";
  v319[0] = v3;
  v319[1] = v2;
  v320[0] = @"CancelingDownloadRequested";
  v320[1] = @"Cancel";
  v91 = [NSDictionary dictionaryWithObjects:v320 forKeys:v319 count:2];
  v322[0] = v91;
  v321[1] = @"InstallUpdate";
  uint64_t v317 = v2;
  v318 = @"ArmInstallOrFail";
  v90 = [NSDictionary dictionaryWithObjects:&v318 forKeys:&v317 count:1];
  v322[1] = v90;
  v321[2] = @"RemoveUpdate";
  v315[0] = v3;
  v315[1] = v2;
  v316[0] = @"CancelingRemoveRequested";
  v316[1] = @"Cancel";
  v89 = [NSDictionary dictionaryWithObjects:v316 forKeys:v315 count:2];
  v322[2] = v89;
  v321[3] = @"RollbackRequested";
  v313[0] = v3;
  v313[1] = v2;
  v314[0] = @"CancelingRollbackRequested";
  v314[1] = @"Cancel";
  v88 = [NSDictionary dictionaryWithObjects:v314 forKeys:v313 count:2];
  v322[3] = v88;
  v321[4] = @"BrainLoading";
  uint64_t v311 = v2;
  v312 = @"Activated";
  v87 = [NSDictionary dictionaryWithObjects:&v312 forKeys:&v311 count:1];
  v322[4] = v87;
  v321[5] = *MEMORY[0x263F77D30];
  uint64_t v309 = v2;
  v310 = @"BrainLoaded";
  v86 = [NSDictionary dictionaryWithObjects:&v310 forKeys:&v309 count:1];
  v322[5] = v86;
  v321[6] = @"BrainLoaded";
  v307[0] = v3;
  v307[1] = v2;
  v308[0] = @"DownloadAndPrepare";
  v308[1] = @"DownloadAndPrepare";
  v85 = [NSDictionary dictionaryWithObjects:v308 forKeys:v307 count:2];
  v322[6] = v85;
  v321[7] = @"AlreadyDownloaded";
  v305[0] = v3;
  v305[1] = v2;
  v306[0] = @"DownloadAndPrepare";
  v306[1] = @"Prepare";
  v84 = [NSDictionary dictionaryWithObjects:v306 forKeys:v305 count:2];
  v322[7] = v84;
  v321[8] = @"PrepareInterrupted";
  uint64_t v7 = *MEMORY[0x263F77D68];
  v303[0] = v3;
  v303[1] = v2;
  uint64_t v8 = *MEMORY[0x263F77D10];
  v304[0] = v7;
  v304[1] = v8;
  v83 = [NSDictionary dictionaryWithObjects:v304 forKeys:v303 count:2];
  v322[8] = v83;
  v321[9] = @"AlreadyPrepared";
  uint64_t v9 = *MEMORY[0x263F77D58];
  v301[0] = v3;
  v301[1] = v2;
  v302[0] = v9;
  v302[1] = @"ReportPreparedSet";
  v82 = [NSDictionary dictionaryWithObjects:v302 forKeys:v301 count:2];
  v322[9] = v82;
  v321[10] = @"ArmedInstall";
  uint64_t v49 = *MEMORY[0x263F77D40];
  v299[0] = v3;
  v299[1] = v2;
  v300[0] = v49;
  v300[1] = @"InstallArmed";
  v81 = [NSDictionary dictionaryWithObjects:v300 forKeys:v299 count:2];
  v322[10] = v81;
  v321[11] = @"UpdateProgress";
  uint64_t v297 = v2;
  uint64_t v298 = *MEMORY[0x263F77CF0];
  uint64_t v46 = v298;
  v80 = [NSDictionary dictionaryWithObjects:&v298 forKeys:&v297 count:1];
  v322[11] = v80;
  v321[12] = @"UpdateFailed";
  uint64_t v295 = v2;
  v296 = @"CheckLockAndNetwork";
  v79 = [NSDictionary dictionaryWithObjects:&v296 forKeys:&v295 count:1];
  v322[12] = v79;
  v321[13] = @"Unlocked";
  uint64_t v293 = v2;
  v294 = @"ReloadBrain";
  v78 = [NSDictionary dictionaryWithObjects:&v294 forKeys:&v293 count:1];
  v322[13] = v78;
  v321[14] = @"WaitUnlock";
  uint64_t v291 = v3;
  v292 = @"WaitingFirstUnlock";
  v77 = [NSDictionary dictionaryWithObjects:&v292 forKeys:&v291 count:1];
  v322[14] = v77;
  v321[15] = @"WaitNetwork";
  uint64_t v289 = v3;
  v290 = @"WaitingNetwork";
  v76 = [NSDictionary dictionaryWithObjects:&v290 forKeys:&v289 count:1];
  v322[15] = v76;
  v321[16] = *MEMORY[0x263F77D28];
  v287[0] = v3;
  v287[1] = v2;
  v288[0] = @"CancelingRemoveRequested";
  v288[1] = @"ReportDownloadFailedRemoveAll";
  v75 = [NSDictionary dictionaryWithObjects:v288 forKeys:v287 count:2];
  v322[16] = v75;
  v74 = [NSDictionary dictionaryWithObjects:v322 forKeys:v321 count:17];
  v460[9] = v74;
  v459[10] = v7;
  v281[0] = @"DownloadAndPrepare";
  v279[0] = v3;
  v279[1] = v2;
  v280[0] = @"CancelingDownloadRequested";
  v280[1] = @"Cancel";
  v73 = [NSDictionary dictionaryWithObjects:v280 forKeys:v279 count:2];
  v286[0] = v73;
  v281[1] = @"InstallUpdate";
  uint64_t v277 = v2;
  v278 = @"ReportInstallFailedNoUpdate";
  v72 = [NSDictionary dictionaryWithObjects:&v278 forKeys:&v277 count:1];
  v286[1] = v72;
  v281[2] = @"RemoveUpdate";
  v275[0] = v3;
  v275[1] = v2;
  v276[0] = @"CancelingRemoveRequested";
  v276[1] = @"Cancel";
  v71 = [NSDictionary dictionaryWithObjects:v276 forKeys:v275 count:2];
  v286[2] = v71;
  v281[3] = @"RollbackRequested";
  v273[0] = v3;
  v273[1] = v2;
  v274[0] = @"CancelingRollbackRequested";
  v274[1] = @"Cancel";
  v70 = [NSDictionary dictionaryWithObjects:v274 forKeys:v273 count:2];
  v286[3] = v70;
  v281[4] = @"ApplyFailedDone";
  uint64_t v271 = v2;
  v272 = @"RemoveAllPreserveCache";
  v69 = [NSDictionary dictionaryWithObjects:&v272 forKeys:&v271 count:1];
  v286[4] = v69;
  uint64_t v282 = *MEMORY[0x263F77D18];
  uint64_t v40 = v282;
  uint64_t v269 = v2;
  v270 = @"RemoveAllPreserveCache";
  v68 = [NSDictionary dictionaryWithObjects:&v270 forKeys:&v269 count:1];
  v286[5] = v68;
  v283 = @"RemovedAllPreservedCache";
  uint64_t v267 = v2;
  v268 = @"CanceledDownloadRequested";
  v67 = [NSDictionary dictionaryWithObjects:&v268 forKeys:&v267 count:1];
  v286[6] = v67;
  v284 = @"ReadyToDownload";
  v265[0] = v3;
  v265[1] = v2;
  v266[0] = v162;
  v266[1] = v164;
  v66 = [NSDictionary dictionaryWithObjects:v266 forKeys:v265 count:2];
  v286[7] = v66;
  uint64_t v285 = *MEMORY[0x263F77D38];
  uint64_t v44 = v285;
  v263[0] = v3;
  v263[1] = v2;
  uint64_t v42 = *MEMORY[0x263F77CF8];
  v264[0] = v9;
  v264[1] = v42;
  v65 = [NSDictionary dictionaryWithObjects:v264 forKeys:v263 count:2];
  v286[8] = v65;
  v64 = [NSDictionary dictionaryWithObjects:v286 forKeys:v281 count:9];
  v460[10] = v64;
  v459[11] = @"WaitingFirstUnlock";
  v261[0] = @"DownloadAndPrepare";
  v259[0] = v3;
  v259[1] = v2;
  v260[0] = @"CancelingDownloadRequested";
  v260[1] = @"Cancel";
  v63 = [NSDictionary dictionaryWithObjects:v260 forKeys:v259 count:2];
  v262[0] = v63;
  v261[1] = @"InstallUpdate";
  uint64_t v257 = v2;
  v258 = @"ReportInstallFailedNoUpdate";
  v62 = [NSDictionary dictionaryWithObjects:&v258 forKeys:&v257 count:1];
  v262[1] = v62;
  v261[2] = @"RemoveUpdate";
  v255[0] = v3;
  v255[1] = v2;
  v256[0] = @"CancelingRemoveRequested";
  v256[1] = @"Cancel";
  v61 = [NSDictionary dictionaryWithObjects:v256 forKeys:v255 count:2];
  v262[2] = v61;
  v261[3] = @"RollbackRequested";
  v253[0] = v3;
  v253[1] = v2;
  v254[0] = @"CancelingRollbackRequested";
  v254[1] = @"Cancel";
  v60 = [NSDictionary dictionaryWithObjects:v254 forKeys:v253 count:2];
  v262[3] = v60;
  v261[4] = @"Unlocked";
  v251[0] = v3;
  v251[1] = v2;
  v252[0] = v162;
  v252[1] = v164;
  v59 = [NSDictionary dictionaryWithObjects:v252 forKeys:v251 count:2];
  v262[4] = v59;
  v58 = [NSDictionary dictionaryWithObjects:v262 forKeys:v261 count:5];
  v460[11] = v58;
  v459[12] = @"WaitingNetwork";
  v249[0] = @"DownloadAndPrepare";
  v247[0] = v3;
  v247[1] = v2;
  v248[0] = @"CancelingDownloadRequested";
  v248[1] = @"Cancel";
  v57 = [NSDictionary dictionaryWithObjects:v248 forKeys:v247 count:2];
  v250[0] = v57;
  v249[1] = @"InstallUpdate";
  uint64_t v245 = v2;
  v246 = @"ReportInstallFailedNoUpdate";
  v56 = [NSDictionary dictionaryWithObjects:&v246 forKeys:&v245 count:1];
  v250[1] = v56;
  v249[2] = @"RemoveUpdate";
  v243[0] = v3;
  v243[1] = v2;
  v244[0] = @"CancelingRemoveRequested";
  v244[1] = @"Cancel";
  v55 = [NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:2];
  v250[2] = v55;
  v249[3] = @"RollbackRequested";
  v241[0] = v3;
  v241[1] = v2;
  v242[0] = @"CancelingRollbackRequested";
  v242[1] = @"Cancel";
  v54 = [NSDictionary dictionaryWithObjects:v242 forKeys:v241 count:2];
  v250[3] = v54;
  v249[4] = @"NetworkAvailable";
  v239[0] = v3;
  v239[1] = v2;
  v240[0] = v162;
  v240[1] = v164;
  v165 = [NSDictionary dictionaryWithObjects:v240 forKeys:v239 count:2];
  v250[4] = v165;
  v163 = [NSDictionary dictionaryWithObjects:v250 forKeys:v249 count:5];
  v460[12] = v163;
  v459[13] = @"DownloadAndPrepare";
  v237[0] = @"DownloadAndPrepare";
  v235[0] = v3;
  v235[1] = v2;
  v236[0] = @"CancelingDownloadRequested";
  v236[1] = @"Cancel";
  v53 = [NSDictionary dictionaryWithObjects:v236 forKeys:v235 count:2];
  v238[0] = v53;
  v237[1] = @"InstallUpdate";
  uint64_t v233 = v2;
  v234 = @"ReportInstallFailedNoUpdate";
  v52 = [NSDictionary dictionaryWithObjects:&v234 forKeys:&v233 count:1];
  v238[1] = v52;
  v237[2] = @"RemoveUpdate";
  v231[0] = v3;
  v231[1] = v2;
  v232[0] = @"CancelingRemoveRequested";
  v232[1] = @"Cancel";
  v51 = [NSDictionary dictionaryWithObjects:v232 forKeys:v231 count:2];
  v238[2] = v51;
  v237[3] = @"RollbackRequested";
  v229[0] = v3;
  v229[1] = v2;
  v230[0] = @"CancelingRollbackRequested";
  v230[1] = @"Cancel";
  v48 = [NSDictionary dictionaryWithObjects:v230 forKeys:v229 count:2];
  v238[3] = v48;
  v237[4] = @"UpdateProgress";
  uint64_t v227 = v2;
  uint64_t v228 = v46;
  v47 = [NSDictionary dictionaryWithObjects:&v228 forKeys:&v227 count:1];
  v238[4] = v47;
  v237[5] = v44;
  v225[0] = v3;
  v225[1] = v2;
  v226[0] = v9;
  v226[1] = v42;
  v45 = [NSDictionary dictionaryWithObjects:v226 forKeys:v225 count:2];
  v238[5] = v45;
  v237[6] = @"UpdateFailed";
  v223[0] = v3;
  v223[1] = v2;
  v224[0] = @"CancelingRemoveRequested";
  v224[1] = @"ReportDownloadFailedRemoveAll";
  v43 = [NSDictionary dictionaryWithObjects:v224 forKeys:v223 count:2];
  v238[6] = v43;
  v39 = [NSDictionary dictionaryWithObjects:v238 forKeys:v237 count:7];
  v460[13] = v39;
  v459[14] = v9;
  v221[0] = @"DownloadAndPrepare";
  v219[0] = v3;
  v219[1] = v2;
  v220[0] = @"CancelingDownloadRequested";
  v220[1] = @"Cancel";
  v38 = [NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:2];
  v222[0] = v38;
  v221[1] = @"InstallUpdate";
  v217[0] = v3;
  v217[1] = v2;
  v218[0] = v49;
  v218[1] = @"InstallUpdate";
  v37 = [NSDictionary dictionaryWithObjects:v218 forKeys:v217 count:2];
  v222[1] = v37;
  v221[2] = @"RemoveUpdate";
  v215[0] = v3;
  v215[1] = v2;
  v216[0] = @"RemovingAll";
  v216[1] = @"RemoveAll";
  v36 = [NSDictionary dictionaryWithObjects:v216 forKeys:v215 count:2];
  v222[2] = v36;
  v221[3] = @"RollbackRequested";
  v213[0] = v3;
  v213[1] = v2;
  v214[0] = @"CancelingRollbackRequested";
  v214[1] = @"Cancel";
  v35 = [NSDictionary dictionaryWithObjects:v214 forKeys:v213 count:2];
  v222[3] = v35;
  v34 = [NSDictionary dictionaryWithObjects:v222 forKeys:v221 count:4];
  v460[14] = v34;
  v459[15] = v49;
  v211[0] = @"DownloadAndPrepare";
  uint64_t v209 = v2;
  v210 = @"ReportDownloadInstalling";
  v50 = [NSDictionary dictionaryWithObjects:&v210 forKeys:&v209 count:1];
  v212[0] = v50;
  v211[1] = @"InstallUpdate";
  uint64_t v207 = v2;
  uint64_t v208 = v167;
  v33 = [NSDictionary dictionaryWithObjects:&v208 forKeys:&v207 count:1];
  v212[1] = v33;
  v211[2] = @"RemoveUpdate";
  uint64_t v205 = v2;
  v206 = @"ReportRemoveInstalling";
  v32 = [NSDictionary dictionaryWithObjects:&v206 forKeys:&v205 count:1];
  v212[2] = v32;
  v211[3] = @"RollbackRequested";
  uint64_t v203 = v2;
  v204 = @"ReportRollbackInstalling";
  v31 = [NSDictionary dictionaryWithObjects:&v204 forKeys:&v203 count:1];
  v212[3] = v31;
  v211[4] = @"UpdateProgress";
  uint64_t v201 = v2;
  uint64_t v202 = v167;
  v30 = [NSDictionary dictionaryWithObjects:&v202 forKeys:&v201 count:1];
  v212[4] = v30;
  v211[5] = v40;
  v199[0] = v3;
  v199[1] = v2;
  uint64_t v10 = *MEMORY[0x263F77CE8];
  v200[0] = v9;
  v200[1] = v10;
  v161 = [NSDictionary dictionaryWithObjects:v200 forKeys:v199 count:2];
  v212[5] = v161;
  v211[6] = @"ApplyFailedDone";
  uint64_t v197 = v2;
  v198 = @"ReportApplyFailedRemoveAll";
  v41 = [NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
  v212[6] = v41;
  v211[7] = @"ApplyFailedRemoveNow";
  v195[0] = v3;
  v195[1] = v2;
  v196[0] = @"RemovingAll";
  v196[1] = @"RemoveAll";
  v29 = [NSDictionary dictionaryWithObjects:v196 forKeys:v195 count:2];
  v212[7] = v29;
  v211[8] = *MEMORY[0x263F77D20];
  uint64_t v11 = *MEMORY[0x263F77D48];
  v193[0] = v3;
  v193[1] = v2;
  v194[0] = v11;
  v194[1] = @"ReportAwaitingReboot";
  v28 = [NSDictionary dictionaryWithObjects:v194 forKeys:v193 count:2];
  v212[8] = v28;
  v27 = [NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:9];
  v460[15] = v27;
  v459[16] = @"RollingBack";
  v191[0] = @"DownloadAndPrepare";
  uint64_t v189 = v2;
  v190 = @"ReportDownloadFailedRollingBack";
  v26 = [NSDictionary dictionaryWithObjects:&v190 forKeys:&v189 count:1];
  v192[0] = v26;
  v191[1] = @"InstallUpdate";
  uint64_t v187 = v2;
  v188 = @"ReportInstallFailedRollingBack";
  v25 = [NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
  v192[1] = v25;
  v191[2] = @"RemoveUpdate";
  uint64_t v185 = v2;
  v186 = @"ReportRemoveFailedRollingBack";
  v24 = [NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
  v192[2] = v24;
  v191[3] = @"RollbackRequested";
  uint64_t v183 = v2;
  uint64_t v184 = v167;
  v12 = [NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
  v192[3] = v12;
  v191[4] = @"RollbackComplete";
  v181[0] = v3;
  v181[1] = v2;
  uint64_t v13 = *MEMORY[0x263F77D08];
  v182[0] = v11;
  v182[1] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:2];
  v192[4] = v14;
  v191[5] = @"RollbackFailed";
  v179[0] = v3;
  v179[1] = v2;
  v180[0] = v166;
  v180[1] = v125;
  v15 = [NSDictionary dictionaryWithObjects:v180 forKeys:v179 count:2];
  v192[5] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:6];
  v460[16] = v16;
  v459[17] = v11;
  v177[0] = @"DownloadAndPrepare";
  uint64_t v175 = v2;
  v176 = @"ReportDownloadAwaitingReboot";
  v17 = [NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
  v178[0] = v17;
  v177[1] = @"InstallUpdate";
  uint64_t v173 = v2;
  v174 = @"ReportInstallAwaitingReboot";
  v18 = [NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
  v178[1] = v18;
  v177[2] = @"RemoveUpdate";
  uint64_t v171 = v2;
  v172 = @"ReportRemoveAwaitingReboot";
  v19 = [NSDictionary dictionaryWithObjects:&v172 forKeys:&v171 count:1];
  v178[2] = v19;
  v177[3] = @"RollbackRequested";
  uint64_t v169 = v2;
  v170 = @"ReportRollbackAwaitingReboot";
  v20 = [NSDictionary dictionaryWithObjects:&v170 forKeys:&v169 count:1];
  v178[3] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:4];
  v460[17] = v21;
  v168 = [NSDictionary dictionaryWithObjects:v460 forKeys:v459 count:18];

  v22 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v168 copyItems:1];

  return v22;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:*MEMORY[0x263F78140]])
  {
    int64_t v13 = 0;
  }
  else
  {
    if ([v11 isEqualToString:@"RemovePreserving"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_RemovePreserving:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"Activated"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_Activated:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ActivatedClean"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ActivatedClean:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"NewDownloadPending"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_NewDownloadPending:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"HandlePendingDownload"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_HandlePendingDownload:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CheckLockAndNetwork"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_CheckLockAndNetwork:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"BrainLoaded"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_BrainLoaded:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77CE0]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_LoadBrain:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReloadBrain"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReloadBrain:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"DownloadAndPrepare"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_DownloadAndPrepare:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"Prepare"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_Prepare:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77D10]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_Resume:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"InstallUpdate"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_InstallUpdate:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ArmInstallOrFail"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ArmInstallOrFail:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"InstallArmed"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_InstallArmed:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"Cancel"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_Cancel:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CanceledDownloadRequested"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_CanceledDownloadRequested:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"RemoveAll"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_RemoveAll:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"RemoveAllPreserveCache"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_RemoveAllPreserveCache:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"PerformRollback"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_RollbackUpdate:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"HandlePendingRollback"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_HandlePendingRollback:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"HandleCanceledPendingRollback"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_HandleCanceledPendingRollback:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadFailedRemoveAll"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadFailedRemoveAll:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77CF0]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadProgress:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportPreparedSet"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportPreparedSet:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77CF8]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportPrepared:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77CE8]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportApplyFailed:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportApplyFailedRemoveAll"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportApplyFailedRemoveAll:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadFailedNoUpdate"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadFailedNoUpdate:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportInstallFailedNoUpdate"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportInstallFailedNoUpdate:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadFailedRollingBack"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadFailedRollingBack:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportInstallFailedRollingBack"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportInstallFailedRollingBack:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportRemoveFailedRollingBack"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRemoveFailedRollingBack:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadInstalling"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadInstalling:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportRemoveInstalling"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRemoveInstalling:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportRollbackInstalling"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRollbackInstalling:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportAwaitingReboot"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportAwaitingReboot:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportDownloadAwaitingReboot"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportDownloadAwaitingReboot:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportInstallAwaitingReboot"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportInstallAwaitingReboot:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportRemoveAwaitingReboot"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRemoveAwaitingReboot:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ReportRollbackAwaitingReboot"])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRollbackAwaitingReboot:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77D00]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRollbackFailed:v12 error:a8];
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F77D08]])
    {
      int64_t v14 = [(SUManagerEngine *)self action_ReportRollbackSucceeded:v12 error:a8];
    }
    else
    {
      int64_t v14 = [(SUManagerEngine *)self actionUnknownAction:v11 error:a8];
    }
    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)action_RemovePreserving:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 paramType];
  uint64_t v9 = [(SUManagerEngine *)self engineFSM];
  uint64_t v10 = v9;
  if (v8 == 2)
  {
    [v9 postEvent:@"PreservedValidated" withInfo:v5];
    int64_t v11 = 0;
  }
  else
  {
    id v12 = [v9 diag];
    int64_t v11 = 8102;
    [v12 trackAnomaly:@"[ENGINE]" forReason:@"param type is not DOWNLOAD_DESCRIPTOR" withResult:8102 withError:0];
  }
  return v11;
}

- (int64_t)action_ActivatedHelper:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUManagerEngine *)self activating])
  {
    [(SUManagerEngine *)self setActivated:1];
    [(SUManagerEngine *)self setActivating:0];
    uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
    [v7 activated:v3];
LABEL_5:

    return 0;
  }
  if (![(SUManagerEngine *)self activated])
  {
    uint64_t v7 = [(SUManagerEngine *)self engineFSM];
    uint64_t v8 = [v7 diag];
    [v8 trackAnomaly:@"[ENGINE]" forReason:@"not in activating state" withResult:8115 withError:0];

    goto LABEL_5;
  }
  return 0;
}

- (int64_t)action_Activated:(id)a3 error:(id *)a4
{
  return -[SUManagerEngine action_ActivatedHelper:](self, "action_ActivatedHelper:", 0, a4);
}

- (int64_t)action_ActivatedClean:(id)a3 error:(id *)a4
{
  return -[SUManagerEngine action_ActivatedHelper:](self, "action_ActivatedHelper:", 1, a4);
}

- (int64_t)action_NewDownloadPending:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 downloadDescriptor];

  [(SUManagerEngine *)self setDownloadDescriptor:v8];
  return 0;
}

- (int64_t)action_HandlePendingDownload:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUManagerEngine *)self engineFSM];
  uint64_t v8 = [SUManagerEngineParam alloc];
  uint64_t v9 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v10 = [(SUManagerEngineParam *)v8 initWithDownloadDescriptor:v9];
  [v7 followupEvent:@"ReadyToDownload" withInfo:v10];

  return 0;
}

- (int64_t)action_CheckLockAndNetwork:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(SUManagerEngine *)self downloadDescriptor];
  LODWORD(v7) = [v8 disarmInstall];

  if (v7)
  {
    uint64_t v9 = [(SUManagerEngine *)self engineLog];
    uint64_t v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ disarming install", buf, 0xCu);
    }
    [(SUManagerEngine *)self actionHelper_ReportInstallFailedNoUpdate];
  }
  id v12 = [(SUManagerEngine *)self downloadDescriptor];
  int64_t v13 = [v12 asset];

  if (!v13) {
    goto LABEL_28;
  }
  if (![(SUManagerEngine *)self isBrainNetworkError:v5]
    || (+[SUNetworkMonitor sharedInstance],
        int64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isPathSatisfied],
        v14,
        (v15 & 1) != 0))
  {
    if ([(SUManagerEngine *)self isBrainReloadError:v5])
    {
      v16 = 0;
    }
    else
    {
      v17 = [(SUManagerEngine *)self downloadDescriptor];
      v18 = [v17 asset];
      v19 = [v18 attributes];
      v20 = SUCoreBorder_MSUBrainIsLoadable();
      v16 = v20;
      if (v20)
      {
        v21 = [v20 userInfo];
        v22 = [v21 objectForKeyedSubscript:@"LoadTrustCachePurgedBrain"];
        int v23 = [v22 isEqual:MEMORY[0x263EFFA88]];

        if (!v23)
        {
          v24 = +[SUKeybagInterface sharedInstance];
          int v25 = [v24 isPasscodeLocked];

          if (v25)
          {
            v26 = [(SUManagerEngine *)self managerDelegate];
            char v27 = objc_opt_respondsToSelector();

            v28 = [(SUManagerEngine *)self engineLog];
            v29 = [v28 oslog];

            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
            if (v27)
            {
              if (v30)
              {
                v31 = [(SUManagerEngine *)self engineName];
                *(_DWORD *)buf = 138412290;
                v48 = v31;
                _os_log_impl(&dword_21DCF7000, v29, OS_LOG_TYPE_DEFAULT, "%@ load brain failed, waiting for unlock", buf, 0xCu);
              }
              v32 = [(SUManagerEngine *)self engineFSM];
              v33 = objc_alloc_init(SUManagerEngineParam);
              [v32 followupEvent:@"WaitUnlock" withInfo:v33];

              v34 = [MEMORY[0x263F77D80] sharedCore];
              v35 = [v34 delegateCallbackQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __52__SUManagerEngine_action_CheckLockAndNetwork_error___block_invoke;
              block[3] = &unk_26447C878;
              block[4] = self;
              dispatch_async(v35, block);

              goto LABEL_23;
            }
            if (v30)
            {
              uint64_t v44 = [(SUManagerEngine *)self engineName];
              *(_DWORD *)buf = 138412290;
              v48 = v44;
              _os_log_impl(&dword_21DCF7000, v29, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to sendUnlockNotifications, failing", buf, 0xCu);
            }
          }
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
    if ([(SUManagerEngine *)self loadBrainRetries] <= 9)
    {
      v34 = [(SUManagerEngine *)self engineFSM];
      v41 = [SUManagerEngineParam alloc];
      uint64_t v42 = [(SUManagerEngine *)self downloadDescriptor];
      v43 = [(SUManagerEngineParam *)v41 initWithDownloadDescriptor:v42];
      [v34 followupEvent:@"Unlocked" withInfo:v43];

LABEL_23:
      goto LABEL_29;
    }
LABEL_27:

LABEL_28:
    [(SUManagerEngine *)self _queue_cancelLockAssertion];
    v16 = [(SUManagerEngine *)self engineFSM];
    [v16 followupEvent:*MEMORY[0x263F77D28] withInfo:v5];
    goto LABEL_29;
  }
  v36 = [(SUManagerEngine *)self engineLog];
  v37 = [v36 oslog];

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [(SUManagerEngine *)self engineName];
    *(_DWORD *)buf = 138412290;
    v48 = v38;
    _os_log_impl(&dword_21DCF7000, v37, OS_LOG_TYPE_DEFAULT, "%@ network unavailable, will wait for network", buf, 0xCu);
  }
  v39 = +[SUNetworkMonitor sharedInstance];
  [v39 addObserver:self];

  v16 = [(SUManagerEngine *)self engineFSM];
  uint64_t v40 = objc_alloc_init(SUManagerEngineParam);
  [v16 followupEvent:@"WaitNetwork" withInfo:v40];

LABEL_29:
  return 0;
}

void __52__SUManagerEngine_action_CheckLockAndNetwork_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managerDelegate];
  [v1 sendUnlockNotifications:1];
}

- (int64_t)action_BrainLoaded:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v9 = [v8 asset];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    int64_t v11 = [(SUManagerEngine *)self downloadDescriptor];
    id v12 = [v11 asset];
    int64_t v13 = [v12 attributes];
    int64_t v14 = SUCoreBorder_MSUBrainIsLoadable();

    if (!v14)
    {
      char v15 = [(SUManagerEngine *)self downloadDescriptor];
      uint64_t v16 = [v15 atPhase];

      if (v16 == 6)
      {
        v17 = [(SUManagerEngine *)self engineFSM];
        int64_t v14 = v17;
        v18 = @"ArmedInstall";
      }
      else
      {
        char v27 = [(SUManagerEngine *)self downloadDescriptor];
        uint64_t v28 = [v27 atPhase];

        if (v28 == 5)
        {
          v17 = [(SUManagerEngine *)self engineFSM];
          int64_t v14 = v17;
          v18 = @"AlreadyPrepared";
        }
        else
        {
          v29 = [(SUManagerEngine *)self downloadDescriptor];
          uint64_t v30 = [v29 atPhase];

          if (v30 == 4)
          {
            v17 = [(SUManagerEngine *)self engineFSM];
            int64_t v14 = v17;
            v18 = @"PrepareInterrupted";
          }
          else
          {
            v31 = [(SUManagerEngine *)self downloadDescriptor];
            uint64_t v32 = [v31 atPhase];

            v17 = [(SUManagerEngine *)self engineFSM];
            int64_t v14 = v17;
            if (v32 == 3) {
              v18 = @"AlreadyDownloaded";
            }
            else {
              v18 = @"BrainLoaded";
            }
          }
        }
      }
      [v17 followupEvent:v18 withInfo:v5];
      goto LABEL_18;
    }
  }
  else
  {

    int64_t v14 = 0;
  }
  v19 = [v14 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"LoadTrustCachePurgedBrain"];
  int v21 = [v20 isEqual:MEMORY[0x263EFFA88]];

  if (v21) {
    uint64_t v22 = 107;
  }
  else {
    uint64_t v22 = 54;
  }
  int v23 = [(SUManagerEngine *)self engineFSM];
  v24 = [SUManagerEngineParam alloc];
  int v25 = +[SUUtility errorWithCode:v22];
  v26 = [(SUManagerEngineParam *)v24 initWithError:v25];
  [v23 followupEvent:@"UpdateFailed" withInfo:v26];

LABEL_18:
  return 0;
}

- (int64_t)loadBrainHelper:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if ([v4 paramType] == 2)
  {
    uint64_t v7 = [v4 downloadDescriptor];
    [(SUManagerEngine *)self setDownloadDescriptor:v7];

    uint64_t v8 = [(SUManagerEngine *)self downloadDescriptor];
    uint64_t v9 = [v8 coreDescriptor];

    [(SUManagerEngine *)self resetPolicy];
    [(SUManagerEngine *)self setPendingPurgeParams:0];
    uint64_t v10 = [(SUManagerEngine *)self downloadDescriptor];
    int64_t v11 = [v10 installTonightConfig];
    id v12 = [(SUManagerEngine *)self downloadDescriptor];
    int64_t v13 = [v12 sessionID];
    [(SUManagerEngine *)self _updatePolicyFactoryMetricEventFields:v11 updateUUID:v13];

    id v14 = objc_alloc(MEMORY[0x263F77BC8]);
    char v15 = [(SUManagerEngine *)self downloadDescriptor];
    uint64_t v16 = [v15 sessionID];
    v17 = (void *)[v14 initWithDelegate:self updateDescriptor:v9 updateUUID:v16];
    [(SUManagerEngine *)self setUpdateControl:v17];

    policyFactory = self->_policyFactory;
    v19 = [v4 downloadDescriptor];
    v20 = [v19 scanOptions];
    [(SUPolicyFactory *)policyFactory setScanOptions:v20];

    int v21 = [(SUManagerEngine *)self updateControl];
    uint64_t v22 = [(SUManagerEngine *)self updatePolicy];
    [v21 targetBrainLoaded:v22];

    if (![(SUManagerEngine *)self activating])
    {
      int64_t v25 = 0;
      goto LABEL_7;
    }
    int v23 = [(SUManagerEngine *)self engineFSM];
    v24 = objc_alloc_init(SUManagerEngineParam);
    [v23 followupEvent:@"BrainLoading" withInfo:v24];

    int64_t v25 = 0;
  }
  else
  {
    uint64_t v9 = [(SUManagerEngine *)self engineFSM];
    int v23 = [v9 diag];
    int64_t v25 = 8102;
    [v23 trackAnomaly:@"[ENGINE]" forReason:@"param type is not DOWNLOAD_DESCRIPTOR" withResult:8102 withError:0];
  }

LABEL_7:
  return v25;
}

- (int64_t)action_LoadBrain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUManagerEngine *)self setLoadBrainRetries:0];
  int64_t v8 = [(SUManagerEngine *)self loadBrainHelper:v5];

  return v8;
}

- (int64_t)action_ReloadBrain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUManagerEngine *)self setLoadBrainRetries:[(SUManagerEngine *)self loadBrainRetries] + 1];
  int64_t v8 = [(SUManagerEngine *)self loadBrainHelper:v5];

  return v8;
}

- (int64_t)action_DownloadAndPrepare:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  uint64_t v9 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v10 = [v9 downloadOptions];
  [(SUPolicyFactory *)policyFactory setDownloadOptions:v10];

  int64_t v11 = [(SUManagerEngine *)self engineFSM];
  [v11 followupEvent:@"UpdateProgress" withInfo:v5];

  id v12 = [(SUManagerEngine *)self updateControl];
  int64_t v13 = [(SUManagerEngine *)self updatePolicy];
  [v12 targetPrepared:v13];

  return 0;
}

- (int64_t)action_Prepare:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  uint64_t v9 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v10 = [v9 downloadOptions];
  [(SUPolicyFactory *)policyFactory setDownloadOptions:v10];

  int64_t v11 = [(SUManagerEngine *)self engineFSM];
  [v11 followupEvent:@"UpdateProgress" withInfo:v5];

  id v12 = [(SUManagerEngine *)self updatePolicy];
  [v12 setCheckAvailableSpace:0];

  int64_t v13 = [(SUManagerEngine *)self updatePolicy];
  id v14 = [v13 downloadPreflightPolicy];
  [v14 setSkipPhase:1];

  char v15 = [(SUManagerEngine *)self updatePolicy];
  uint64_t v16 = [v15 softwareUpdateDownloadPolicy];
  [v16 setSkipPhase:1];

  v17 = [(SUManagerEngine *)self updateControl];
  v18 = [(SUManagerEngine *)self updatePolicy];
  [v17 targetPrepared:v18];

  return 0;
}

- (int64_t)action_Resume:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUManagerEngine *)self updatePolicy];
  int64_t v8 = [v7 downloadPreflightPolicy];
  [v8 setSkipPhase:1];

  uint64_t v9 = [(SUManagerEngine *)self updatePolicy];
  [v9 setCheckAvailableSpace:0];

  uint64_t v10 = [(SUManagerEngine *)self updatePolicy];
  int64_t v11 = [v10 softwareUpdateDownloadPolicy];
  [v11 setSkipPhase:1];

  id v12 = [(SUManagerEngine *)self updatePolicy];
  int64_t v13 = [v12 preparePolicy];
  [v13 setSkipPhase:1];

  id v14 = [(SUManagerEngine *)self updatePolicy];
  char v15 = [v14 suspendPolicy];
  [v15 setSkipPhase:1];

  uint64_t v16 = [(SUManagerEngine *)self updateControl];
  v17 = [(SUManagerEngine *)self updatePolicy];
  [v16 targetPrepared:v17];

  return 0;
}

- (int64_t)action_InstallUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  uint64_t v9 = [v5 installOptions];

  [(SUPolicyFactory *)policyFactory setInstallOptions:v9];
  uint64_t v10 = [(SUManagerEngine *)self updateControl];
  int64_t v11 = [(SUManagerEngine *)self updatePolicy];
  [v10 targetApplied:v11];

  return 0;
}

- (int64_t)action_InstallArmed:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  policyFactory = self->_policyFactory;
  int64_t v8 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v9 = [v8 installOptions];
  [(SUPolicyFactory *)policyFactory setInstallOptions:v9];

  uint64_t v10 = [(SUManagerEngine *)self updatePolicy];
  [v10 setCheckAvailableSpace:0];

  int64_t v11 = [(SUManagerEngine *)self updatePolicy];
  id v12 = [v11 downloadPreflightPolicy];
  [v12 setSkipPhase:1];

  int64_t v13 = [(SUManagerEngine *)self updatePolicy];
  id v14 = [v13 softwareUpdateDownloadPolicy];
  [v14 setSkipPhase:1];

  char v15 = [(SUManagerEngine *)self updatePolicy];
  uint64_t v16 = [v15 preparePolicy];
  [v16 setSkipPhase:1];

  v17 = [(SUManagerEngine *)self updatePolicy];
  v18 = [v17 suspendPolicy];
  [v18 setSkipPhase:1];

  v19 = [(SUManagerEngine *)self updateControl];
  v20 = [(SUManagerEngine *)self updatePolicy];
  [v19 targetApplied:v20];

  return 0;
}

- (int64_t)action_ArmInstallOrFail:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  int64_t v8 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v9 = [v5 installOptions];
  char v10 = [v8 armInstall:v9];

  int64_t v11 = [(SUManagerEngine *)self engineLog];
  id v12 = [v11 oslog];

  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      id v14 = [(SUManagerEngine *)self engineName];
      char v15 = [v5 installOptions];
      int v18 = 138412546;
      v19 = v14;
      __int16 v20 = 2112;
      int v21 = v15;
      _os_log_impl(&dword_21DCF7000, v12, OS_LOG_TYPE_DEFAULT, "%@ install is armed with options:%@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v16 = [(SUManagerEngine *)self engineName];
      int v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_21DCF7000, v12, OS_LOG_TYPE_DEFAULT, "%@ install can't be armed", (uint8_t *)&v18, 0xCu);
    }
    [(SUManagerEngine *)self actionHelper_ReportInstallFailedNoUpdate];
  }

  return 0;
}

- (int64_t)action_Cancel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  int64_t v8 = [v5 downloadDescriptor];
  [(SUManagerEngine *)self setDownloadDescriptor:v8];

  if ([v5 paramType] == 9) {
    [(SUManagerEngine *)self setPendingPurgeParams:v5];
  }
  uint64_t v9 = [(SUManagerEngine *)self updateControl];
  [v9 cancelCurrentUpdate];

  return 0;
}

- (int64_t)action_CanceledDownloadRequested:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUManagerEngine *)self engineFSM];
  int64_t v8 = [SUManagerEngineParam alloc];
  uint64_t v9 = [(SUManagerEngine *)self downloadDescriptor];
  char v10 = [(SUManagerEngineParam *)v8 initWithDownloadDescriptor:v9];
  [v7 followupEvent:@"ReadyToDownload" withInfo:v10];

  return 0;
}

- (int64_t)action_RemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUManagerEngine *)self setUpdateControl:0];
  [(SUManagerEngine *)self setDownloadDescriptor:0];
  [(SUPolicyFactory *)self->_policyFactory setScanOptions:0];
  [(SUPolicyFactory *)self->_policyFactory setDownloadOptions:0];
  [(SUPolicyFactory *)self->_policyFactory setInstallOptions:0];
  int64_t v8 = [(SUManagerEngine *)self updatePolicy];
  uint64_t v9 = (void *)[v8 copy];

  if ([v5 paramType] == 9 && objc_msgSend(v5, "skipDocAssetsPurge")) {
    [v9 setDocumentationAssetType:0];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke;
  v11[3] = &unk_26447D9F8;
  v11[4] = self;
  [MEMORY[0x263F77BA8] removeAllUpdateContentWithPolicy:v9 completion:v11];

  return 0;
}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = [*(id *)(a1 + 32) engineFSM];
  id v5 = [v4 diag];
  objc_msgSend(v5, "trackError:forReason:withResult:withError:", @"[ENGINE]", @"unable to remove all update content", objc_msgSend(v3, "code"), v3);

  uint64_t v6 = [v3 domain];
  if (![v6 isEqual:@"com.apple.MobileAssetError.Purge"])
  {

    goto LABEL_6;
  }
  if ([v3 code] != 11)
  {
    uint64_t v8 = [v3 code];

    if (v8 == 8) {
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v7 = *MEMORY[0x263F77CA8];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_2;
    v12[3] = &unk_26447D9F8;
    v12[4] = *(void *)(a1 + 32);
    [MEMORY[0x263F77BA8] removeAllAssetsOfType:v7 completion:v12];
    goto LABEL_11;
  }

LABEL_8:
  uint64_t v9 = [*(id *)(a1 + 32) engineLog];
  char v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v11 = [*(id *)(a1 + 32) engineName];
    *(_DWORD *)buf = 138412290;
    char v15 = v11;
    _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ Trying to purge installed assets one by one", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_517;
  v13[3] = &unk_26447C878;
  v13[4] = *(void *)(a1 + 32);
  +[SUAssetSupport cleanupAllInstalledAssets:v13];
LABEL_11:
}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_517(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) engineFSM];
  id v1 = objc_alloc_init(SUManagerEngineParam);
  [v2 postEvent:@"RemovedAll" withInfo:v1];
}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = [*(id *)(a1 + 32) engineFSM];
  id v5 = [v4 diag];
  objc_msgSend(v5, "trackError:forReason:withResult:withError:", @"[ENGINE]", @"unable to remove all splat update content", objc_msgSend(v3, "code"), v3);

  uint64_t v6 = [v3 domain];
  if (![v6 isEqual:@"com.apple.MobileAssetError.Purge"])
  {

    goto LABEL_6;
  }
  if ([v3 code] != 11)
  {
    uint64_t v9 = [v3 code];

    if (v9 == 8) {
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v7 = [*(id *)(a1 + 32) engineFSM];
    uint64_t v8 = objc_alloc_init(SUManagerEngineParam);
    [v7 postEvent:@"RemovedAll" withInfo:v8];

    goto LABEL_11;
  }

LABEL_8:
  char v10 = [*(id *)(a1 + 32) engineLog];
  int64_t v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 32) engineName];
    *(_DWORD *)buf = 138412290;
    char v15 = v12;
    _os_log_impl(&dword_21DCF7000, v11, OS_LOG_TYPE_DEFAULT, "%@ Trying to purge installed assets one by one", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__SUManagerEngine_action_RemoveAll_error___block_invoke_521;
  v13[3] = &unk_26447C878;
  v13[4] = *(void *)(a1 + 32);
  +[SUAssetSupport cleanupAllInstalledAssets:v13];
LABEL_11:
}

void __42__SUManagerEngine_action_RemoveAll_error___block_invoke_521(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) engineFSM];
  id v1 = objc_alloc_init(SUManagerEngineParam);
  [v2 postEvent:@"RemovedAll" withInfo:v1];
}

- (int64_t)action_RemoveAllPreserveCache:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUManagerEngine *)self downloadDescriptor];
  [v7 resetPhase];

  uint64_t v8 = (void *)MEMORY[0x263F77BA8];
  uint64_t v9 = [(SUManagerEngine *)self updatePolicy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SUManagerEngine_action_RemoveAllPreserveCache_error___block_invoke;
  v11[3] = &unk_26447D9F8;
  v11[4] = self;
  [v8 removeAllUpdateContentWithPolicy:v9 completion:v11];

  return 0;
}

void __55__SUManagerEngine_action_RemoveAllPreserveCache_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 engineFSM];
    uint64_t v6 = [v5 diag];
    objc_msgSend(v6, "trackError:forReason:withResult:withError:", @"[ENGINE]", @"unable to remove all update content", objc_msgSend(v4, "code"), v4);
  }
  id v8 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v7 = objc_alloc_init(SUManagerEngineParam);
  [v8 postEvent:@"RemovedAllPreservedCache" withInfo:v7];
}

- (int64_t)action_RollbackUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  policyFactory = self->_policyFactory;
  uint64_t v9 = [v5 rollbackOptions];

  [(SUPolicyFactory *)policyFactory setRollbackOptions:v9];
  char v10 = [(SUManagerEngine *)self updateControl];

  if (!v10)
  {
    int64_t v11 = (void *)[objc_alloc(MEMORY[0x263F77BC8]) initWithDelegate:self updateDescriptor:0 updateUUID:self->_rollbackUUID];
    [(SUManagerEngine *)self setUpdateControl:v11];
  }
  id v12 = [(SUManagerEngine *)self updateControl];
  BOOL v13 = [v12 rollbackAvailable];
  [(SUManagerEngine *)self notifyRollbackStarted:v13];

  id v14 = [(SUManagerEngine *)self updateControl];
  char v15 = [(SUManagerEngine *)self rollbackPolicy];
  [v14 targetRollback:v15];

  return 0;
}

- (int64_t)action_HandlePendingRollback:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(SUManagerEngine *)self engineFSM];
  [v8 followupEvent:@"ReadyToRollback" withInfo:v5];

  return 0;
}

- (int64_t)action_HandleCanceledPendingRollback:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  id v8 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [MEMORY[0x263F77D80] sharedCore];
    char v10 = [v9 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SUManagerEngine_action_HandleCanceledPendingRollback_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v10, block);
LABEL_5:

    goto LABEL_6;
  }
  int64_t v11 = [(SUManagerEngine *)self engineLog];
  uint64_t v9 = [v11 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = [(SUManagerEngine *)self engineName];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v10;
    _os_log_impl(&dword_21DCF7000, v9, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:

  id v12 = [(SUManagerEngine *)self engineFSM];
  [v12 followupEvent:@"ReadyToRollback" withInfo:v5];

  return 0;
}

void __62__SUManagerEngine_action_HandleCanceledPendingRollback_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:16 userInfo:0];
  [v2 downloadCompleted:v1];
}

- (int64_t)action_ReportDownloadProgress:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 progress];
  uint64_t v9 = [(SUManagerEngine *)self SUOperationProgressFromSUCoreProgress:v8];
  char v10 = [v9 phase];
  int IsBeyondBrainLoad = SUDownloadPhaseIsBeyondBrainLoad(v10);

  if (IsBeyondBrainLoad) {
    [(SUManagerEngine *)self _queue_cancelLockAssertion];
  }
  id v12 = [(SUManagerEngine *)self managerDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [MEMORY[0x263F77D80] sharedCore];
    char v15 = [v14 delegateCallbackQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__SUManagerEngine_action_ReportDownloadProgress_error___block_invoke;
    v20[3] = &unk_26447C8C8;
    v20[4] = self;
    id v21 = v5;
    dispatch_async(v15, v20);
  }
  else
  {
    uint64_t v16 = [(SUManagerEngine *)self engineLog];
    uint64_t v17 = [v16 oslog];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int v23 = v18;
      _os_log_impl(&dword_21DCF7000, v17, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadProgress:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __55__SUManagerEngine_action_ReportDownloadProgress_error___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managerDelegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) progress];
  id v4 = [v2 SUOperationProgressFromSUCoreProgress:v3];
  [v5 downloadProgress:v4];
}

- (void)actionHelper_ReportPrepared:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self managerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F77D80] sharedCore];
    id v8 = [v7 delegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__SUManagerEngine_actionHelper_ReportPrepared___block_invoke;
    v12[3] = &unk_26447CD98;
    v12[4] = self;
    BOOL v13 = a3;
    dispatch_async(v8, v12);
  }
  else
  {
    uint64_t v9 = [(SUManagerEngine *)self engineLog];
    char v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __47__SUManagerEngine_actionHelper_ReportPrepared___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  [v2 downloadCompleted:0 informClients:*(unsigned __int8 *)(a1 + 40)];
}

- (int64_t)action_ReportPrepared:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  char v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUManagerEngine *)self actionHelper_ReportPrepared:1];
  return 0;
}

- (int64_t)action_ReportPreparedSet:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  char v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  policyFactory = self->_policyFactory;
  id v8 = [(SUManagerEngine *)self downloadDescriptor];
  uint64_t v9 = [v8 downloadOptions];
  [(SUPolicyFactory *)policyFactory setDownloadOptions:v9];

  char v10 = [(SUManagerEngine *)self updatePolicy];
  [v10 setCheckAvailableSpace:0];

  int64_t v11 = [(SUManagerEngine *)self updatePolicy];
  id v12 = [v11 downloadPreflightPolicy];
  [v12 setSkipPhase:1];

  BOOL v13 = [(SUManagerEngine *)self updatePolicy];
  id v14 = [v13 softwareUpdateDownloadPolicy];
  [v14 setSkipPhase:1];

  char v15 = [(SUManagerEngine *)self updatePolicy];
  uint64_t v16 = [v15 preparePolicy];
  [v16 setSkipPhase:1];

  uint64_t v17 = [(SUManagerEngine *)self updatePolicy];
  int v18 = [v17 suspendPolicy];
  [v18 setSkipPhase:1];

  [(SUManagerEngine *)self actionHelper_ReportPrepared:0];
  return 0;
}

- (int64_t)action_ReportDownloadFailedNoUpdate:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_action_ReportDownloadFailedNoUpdate_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportDownloadFailedNoUpdate_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:3];
  [v2 downloadCompleted:v1];
}

- (void)actionHelper_ReportInstallFailedNoUpdate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SUManagerEngine *)self managerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v6 = [v5 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SUManagerEngine_actionHelper_ReportInstallFailedNoUpdate__block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = [(SUManagerEngine *)self engineLog];
    id v5 = [v7 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int64_t v11 = v8;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __59__SUManagerEngine_actionHelper_ReportInstallFailedNoUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:3];
  [v2 installCompleted:v1];
}

- (int64_t)action_ReportInstallFailedNoUpdate:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUManagerEngine *)self actionHelper_ReportInstallFailedNoUpdate];
  return 0;
}

- (void)actionHelper_ReportInstallFailedRollingBack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SUManagerEngine *)self managerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v6 = [v5 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SUManagerEngine_actionHelper_ReportInstallFailedRollingBack__block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = [(SUManagerEngine *)self engineLog];
    id v5 = [v7 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int64_t v11 = v8;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __62__SUManagerEngine_actionHelper_ReportInstallFailedRollingBack__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:87];
  [v2 installCompleted:v1];
}

- (int64_t)action_ReportInstallFailedRollingBack:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUManagerEngine *)self actionHelper_ReportInstallFailedRollingBack];
  return 0;
}

- (void)actionHelper_ReportDownloadFailedRollingBack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SUManagerEngine *)self managerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v6 = [v5 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SUManagerEngine_actionHelper_ReportDownloadFailedRollingBack__block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = [(SUManagerEngine *)self engineLog];
    id v5 = [v7 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int64_t v11 = v8;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __63__SUManagerEngine_actionHelper_ReportDownloadFailedRollingBack__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:87];
  [v2 downloadCompleted:v1];
}

- (int64_t)action_ReportDownloadFailedRollingBack:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUManagerEngine *)self actionHelper_ReportDownloadFailedRollingBack];
  return 0;
}

- (void)actionHelper_ReportRemoveFailedRollingBack
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(SUManagerEngine *)self managerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v6 = [v5 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_actionHelper_ReportRemoveFailedRollingBack__block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = [(SUManagerEngine *)self engineLog];
    id v5 = [v7 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int64_t v11 = v8;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __61__SUManagerEngine_actionHelper_ReportRemoveFailedRollingBack__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:87];
  [v2 removeCompleted:v1];
}

- (int64_t)action_ReportRemoveFailedRollingBack:(id)a3 error:(id *)a4
{
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUManagerEngine *)self actionHelper_ReportRemoveFailedRollingBack];
  return 0;
}

- (int64_t)action_ReportDownloadInstalling:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SUManagerEngine_action_ReportDownloadInstalling_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __57__SUManagerEngine_action_ReportDownloadInstalling_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:14];
  [v2 downloadCompleted:v1];
}

- (int64_t)action_ReportRemoveInstalling:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SUManagerEngine_action_ReportRemoveInstalling_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __55__SUManagerEngine_action_ReportRemoveInstalling_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:14];
  [v2 removeCompleted:v1];
}

- (int64_t)action_ReportRollbackInstalling:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  id v8 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [MEMORY[0x263F77D80] sharedCore];
    char v10 = [v9 delegateCallbackQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__SUManagerEngine_action_ReportRollbackInstalling_error___block_invoke;
    v15[3] = &unk_26447C8C8;
    v15[4] = self;
    id v16 = v5;
    dispatch_async(v10, v15);
  }
  else
  {
    int64_t v11 = [(SUManagerEngine *)self engineLog];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int v18 = v13;
      _os_log_impl(&dword_21DCF7000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __57__SUManagerEngine_action_ReportRollbackInstalling_error___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managerDelegate];
  id v2 = [*(id *)(a1 + 40) rollback];
  id v3 = [v2 eligibleRollback];
  char v4 = +[SUUtility errorWithCode:14];
  [v5 rollbackCompleted:v3 withError:v4];
}

- (int64_t)action_ReportDownloadAwaitingReboot:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUManagerEngine_action_ReportDownloadAwaitingReboot_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportDownloadAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:42];
  [v2 downloadCompleted:v1];
}

- (int64_t)action_ReportInstallAwaitingReboot:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__SUManagerEngine_action_ReportInstallAwaitingReboot_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __60__SUManagerEngine_action_ReportInstallAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:42];
  [v2 installCompleted:v1];
}

- (int64_t)action_ReportRemoveAwaitingReboot:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SUManagerEngine_action_ReportRemoveAwaitingReboot_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(removeCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __59__SUManagerEngine_action_ReportRemoveAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  id v1 = +[SUUtility errorWithCode:42];
  [v2 removeCompleted:v1];
}

- (int64_t)action_ReportRollbackAwaitingReboot:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  id v8 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [MEMORY[0x263F77D80] sharedCore];
    char v10 = [v9 delegateCallbackQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__SUManagerEngine_action_ReportRollbackAwaitingReboot_error___block_invoke;
    v15[3] = &unk_26447C8C8;
    v15[4] = self;
    id v16 = v5;
    dispatch_async(v10, v15);
  }
  else
  {
    int64_t v11 = [(SUManagerEngine *)self engineLog];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int v18 = v13;
      _os_log_impl(&dword_21DCF7000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __61__SUManagerEngine_action_ReportRollbackAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managerDelegate];
  id v2 = [*(id *)(a1 + 40) rollback];
  id v3 = [v2 eligibleRollback];
  char v4 = +[SUUtility errorWithCode:42];
  [v5 rollbackCompleted:v3 withError:v4];
}

- (int64_t)action_ReportDownloadFailedRemoveAll:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  id v8 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [MEMORY[0x263F77D80] sharedCore];
    char v10 = [v9 delegateCallbackQueue];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    int v18 = __62__SUManagerEngine_action_ReportDownloadFailedRemoveAll_error___block_invoke;
    uint64_t v19 = &unk_26447C8C8;
    __int16 v20 = self;
    id v21 = v5;
    dispatch_async(v10, &v16);
  }
  else
  {
    int64_t v11 = [(SUManagerEngine *)self engineLog];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      int v23 = v13;
      _os_log_impl(&dword_21DCF7000, v12, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(downloadCompleted:) so not reporting", buf, 0xCu);
    }
  }
  id v14 = [(SUManagerEngine *)self engineFSM];
  [v14 followupEvent:@"UpdateFailed" withInfo:v5];

  return 0;
}

void __62__SUManagerEngine_action_ReportDownloadFailedRemoveAll_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) managerDelegate];
  id v2 = [*(id *)(a1 + 40) error];
  [v3 downloadCompleted:v2];
}

- (void)actionHelper_ReportApplyFailed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self managerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F77D80] sharedCore];
    id v8 = [v7 delegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__SUManagerEngine_actionHelper_ReportApplyFailed___block_invoke;
    v12[3] = &unk_26447C8C8;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    uint64_t v9 = [(SUManagerEngine *)self engineLog];
    char v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);
    }
  }
}

void __50__SUManagerEngine_actionHelper_ReportApplyFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  [v2 installCompleted:*(void *)(a1 + 40)];
}

- (int64_t)action_ReportApplyFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 error];

  [(SUManagerEngine *)self actionHelper_ReportApplyFailed:v8];
  return 0;
}

- (int64_t)action_ReportApplyFailedRemoveAll:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [(SUManagerEngine *)self engineFSM];
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 error];
  uint64_t v9 = +[SUUtility errorWithCode:78 originalError:v8];

  [(SUManagerEngine *)self actionHelper_ReportApplyFailed:v9];
  char v10 = [(SUManagerEngine *)self engineFSM];
  [v10 followupEvent:@"ApplyFailedRemoveNow" withInfo:v5];

  return 0;
}

- (int64_t)action_ReportAwaitingReboot:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUManagerEngine *)self managerDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v9 = [v8 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__SUManagerEngine_action_ReportAwaitingReboot_error___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    char v10 = [(SUManagerEngine *)self engineLog];
    id v8 = [v10 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      char v15 = v11;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(installCompleted:) so not reporting", buf, 0xCu);
    }
  }

  return 0;
}

void __53__SUManagerEngine_action_ReportAwaitingReboot_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managerDelegate];
  [v1 installCompleted:0];
}

- (void)actionHelper_ReportRollbackCompleted:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerEngine *)self managerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [MEMORY[0x263F77D80] sharedCore];
    int64_t v11 = [v10 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__SUManagerEngine_actionHelper_ReportRollbackCompleted_withError___block_invoke;
    block[3] = &unk_26447CD70;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = [(SUManagerEngine *)self engineLog];
    id v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v14;
      _os_log_impl(&dword_21DCF7000, v13, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackCompleted:withError:) so not reporting", buf, 0xCu);
    }
  }
}

void __66__SUManagerEngine_actionHelper_ReportRollbackCompleted_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  [v2 rollbackCompleted:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (int64_t)action_ReportRollbackFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(SUManagerEngine *)self engineFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 rollback];
  char v9 = [v8 eligibleRollback];
  char v10 = [v5 error];

  [(SUManagerEngine *)self actionHelper_ReportRollbackCompleted:v9 withError:v10];
  return 0;
}

- (int64_t)action_ReportRollbackSucceeded:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(SUManagerEngine *)self engineFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 rollback];
  char v9 = [v8 eligibleRollback];
  char v10 = [v5 error];

  [(SUManagerEngine *)self actionHelper_ReportRollbackCompleted:v9 withError:v10];
  return 0;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithFormat:@"unknown action(%@)", v6];

  id v8 = [(SUManagerEngine *)self engineFSM];
  char v9 = [v8 diag];
  [v9 dumpTracked:v7 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  char v10 = [MEMORY[0x263F77D80] sharedCore];
  int64_t v11 = [v10 buildError:8116 underlying:0 description:v7];

  uint64_t v12 = [(SUManagerEngine *)self engineFSM];
  id v13 = [v12 diag];
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", @"[ENGINE]", @"engine FSM has reported an anomaly", objc_msgSend(v11, "code"), v11);

  return 0;
}

- (SUManagerEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SUManagerEngine;
  id v5 = [(SUManagerEngine *)&v44 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_managerDelegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F77DE0]) initWithCategory:@"engine"];
    engineLog = v6->_engineLog;
    v6->_engineLog = (SUCoreLog *)v7;

    if (!v6->_engineLog) {
      SULogInfo(@"Failed creating engine log", v9, v10, v11, v12, v13, v14, v15, v43);
    }
    updateControl = v6->_updateControl;
    v6->_updateControl = 0;

    id v17 = objc_alloc_init(SUPolicyFactory);
    policyFactory = v6->_policyFactory;
    v6->_policyFactory = v17;

    uint64_t v19 = (void *)MGCopyAnswer();
    uint64_t v20 = (void *)MGCopyAnswer();
    uint64_t v21 = [[NSString alloc] initWithFormat:@"engine:%@(%@)"];
    engineName = v6->_engineName;
    v6->_engineName = (NSString *)v21;

    uint64_t v23 = [(id)objc_opt_class() _generateStateTable];
    stateTable = v6->_stateTable;
    v6->_stateTable = (NSDictionary *)v23;

    id v25 = objc_alloc(MEMORY[0x263F77DD0]);
    uint64_t v26 = [v25 initMachine:v6->_engineName withTable:v6->_stateTable startingIn:*MEMORY[0x263F77D70] usingDelegate:v6 registeringAllInfoClass:objc_opt_class()];
    engineFSM = v6->_engineFSM;
    v6->_engineFSM = (SUCoreFSM *)v26;

    if (!v6->_engineFSM)
    {
      SULogInfo(@"Failed creating engine FSM", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v19);

      v41 = 0;
      goto LABEL_8;
    }
    pendingManagedScanParams = v6->_pendingManagedScanParams;
    v6->_pendingManagedScanParams = 0;

    pendingPurgeParams = v6->_pendingPurgeParams;
    v6->_pendingPurgeParams = 0;

    v6->_isManagedScan = 0;
    activeScanner = v6->_activeScanner;
    v6->_activeScanner = 0;

    *(_WORD *)&v6->_activating = 0;
    v6->_loadBrainRetries = 0;
    v38 = [MEMORY[0x263F08C38] UUID];
    uint64_t v39 = [v38 UUIDString];
    rollbackUUID = v6->_rollbackUUID;
    v6->_rollbackUUID = (NSString *)v39;
  }
  v41 = v6;
LABEL_8:

  return v41;
}

- (void)activateLoadingPersisted:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerEngine_activateLoadingPersisted___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __44__SUManagerEngine_activateLoadingPersisted___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) engineFSM];
  id v3 = [v2 diag];
  [v3 trackBegin:@"activateLoadingPersisted" atLevel:1];

  if (([*(id *)(a1 + 32) activated] & 1) == 0
    && ![*(id *)(a1 + 32) activating])
  {
    [*(id *)(a1 + 32) setActivating:1];
    __int16 v45 = 0;
    __int16 v44 = 0;
    [MEMORY[0x263F77BA8] previousUpdateState:(char *)&v45 + 1 tetheredRestore:&v45 failedBackward:(char *)&v44 + 1 failedForward:&v44];
    if (HIBYTE(v45))
    {
      id v9 = [*(id *)(a1 + 32) engineLog];
      uint64_t v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [*(id *)(a1 + 32) engineName];
        *(_DWORD *)buf = 138412290;
        v47 = v11;
        _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ previous update state: successful OTA", buf, 0xCu);
      }
    }
    if ((_BYTE)v45)
    {
      uint64_t v12 = [*(id *)(a1 + 32) engineLog];
      uint64_t v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*(id *)(a1 + 32) engineName];
        *(_DWORD *)buf = 138412290;
        v47 = v14;
        _os_log_impl(&dword_21DCF7000, v13, OS_LOG_TYPE_DEFAULT, "%@ previous update state: tethered restore", buf, 0xCu);
      }
    }
    if (HIBYTE(v44))
    {
      uint64_t v15 = [*(id *)(a1 + 32) engineLog];
      id v16 = [v15 oslog];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [*(id *)(a1 + 32) engineName];
        *(_DWORD *)buf = 138412290;
        v47 = v17;
        _os_log_impl(&dword_21DCF7000, v16, OS_LOG_TYPE_DEFAULT, "%@ previous update state: failed backward", buf, 0xCu);
      }
    }
    if ((_BYTE)v44)
    {
      int v18 = [*(id *)(a1 + 32) engineLog];
      uint64_t v19 = [v18 oslog];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [*(id *)(a1 + 32) engineName];
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl(&dword_21DCF7000, v19, OS_LOG_TYPE_DEFAULT, "%@ previous update state: failed forward", buf, 0xCu);
      }
    }
    uint64_t v21 = *(void **)(a1 + 40);
    if (v21)
    {
      uint64_t v22 = [v21 asset];

      if (v22)
      {
        if (HIBYTE(v44))
        {
          uint64_t v23 = [*(id *)(a1 + 32) engineLog];
          uint64_t v24 = [v23 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DCF7000, v24, OS_LOG_TYPE_DEFAULT, "Previous OTA attempt failed backwards and prepared update has been purged", buf, 2u);
          }
          goto LABEL_39;
        }
        if ([*(id *)(a1 + 40) atPhase] == 2)
        {
          uint64_t v34 = [*(id *)(a1 + 32) engineLog];
          uint64_t v24 = [v34 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [*(id *)(a1 + 32) engineName];
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, started downloading but not completed, will try to load";
LABEL_53:
            _os_log_impl(&dword_21DCF7000, v24, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);

            goto LABEL_54;
          }
          goto LABEL_54;
        }
        if ([*(id *)(a1 + 40) atPhase] == 3)
        {
          v37 = [*(id *)(a1 + 32) engineLog];
          uint64_t v24 = [v37 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [*(id *)(a1 + 32) engineName];
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, update is downloaded, will try to load";
            goto LABEL_53;
          }
LABEL_54:

          uint64_t v29 = [*(id *)(a1 + 32) engineFSM];
          uint64_t v30 = [[SUManagerEngineParam alloc] initWithDownloadDescriptor:*(void *)(a1 + 40)];
          uint64_t v31 = @"ActivateHavePersisted";
          goto LABEL_40;
        }
        if ([*(id *)(a1 + 40) atPhase] == 5)
        {
          v38 = [*(id *)(a1 + 32) engineLog];
          uint64_t v24 = [v38 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v35 = [*(id *)(a1 + 32) engineName];
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, update is prepared, will try to load";
            goto LABEL_53;
          }
          goto LABEL_54;
        }
        uint64_t v39 = [*(id *)(a1 + 40) atPhase];
        uint64_t v40 = [*(id *)(a1 + 32) engineLog];
        uint64_t v24 = [v40 oslog];

        BOOL v41 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v39 == 4)
        {
          if (v41)
          {
            v35 = [*(id *)(a1 + 32) engineName];
            *(_DWORD *)buf = 138412290;
            v47 = v35;
            v36 = "%@ download descriptor found, prepare interrupted, will try to resume or purge and redownload";
            goto LABEL_53;
          }
          goto LABEL_54;
        }
        if (v41)
        {
          uint64_t v26 = +[SUManagerEngineDownloadDescriptor phaseToString:](SUManagerEngineDownloadDescriptor, "phaseToString:", [*(id *)(a1 + 40) atPhase]);
          uint64_t v42 = [*(id *)(a1 + 32) engineName];
          *(_DWORD *)buf = 138412546;
          v47 = v26;
          __int16 v48 = 2112;
          uint64_t v49 = v42;
          _os_log_impl(&dword_21DCF7000, v24, OS_LOG_TYPE_DEFAULT, "%@ download descriptor found, phase (%@) is not valid to load", buf, 0x16u);

          goto LABEL_38;
        }
LABEL_39:

        uint64_t v29 = [*(id *)(a1 + 32) engineFSM];
        uint64_t v30 = objc_alloc_init(SUManagerEngineParam);
        uint64_t v31 = @"ActivateNoPersisted";
LABEL_40:
        [v29 postEvent:v31 withInfo:v30];

        uint64_t v32 = [*(id *)(a1 + 32) engineFSM];
        uint64_t v33 = [v32 diag];
        objc_msgSend(v33, "trackEnd:atLevel:withResult:withError:", @"activateLoadingPersisted", 1, objc_msgSend(0, "code"), 0);

        return;
      }
      uint64_t v28 = [*(id *)(a1 + 32) engineLog];
      uint64_t v24 = [v28 oslog];

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v26 = [*(id *)(a1 + 32) engineName];
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      char v27 = "%@ no download descriptor asset to load from";
    }
    else
    {
      id v25 = [*(id *)(a1 + 32) engineLog];
      uint64_t v24 = [v25 oslog];

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v26 = [*(id *)(a1 + 32) engineName];
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      char v27 = "%@ no download descriptor to load from";
    }
    _os_log_impl(&dword_21DCF7000, v24, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_38:

    goto LABEL_39;
  }
  id v4 = [MEMORY[0x263F77D80] sharedCore];
  id v5 = [NSString alloc];
  if ([*(id *)(a1 + 32) activated]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if ([*(id *)(a1 + 32) activating]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  id v8 = (void *)[v5 initWithFormat:@"unexpected activate - activated:%@, activating:%@", v6, v7];
  id v43 = [v4 buildError:8111 underlying:0 description:v8];
}

- (void)downloadUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [(SUManagerEngine *)self engineFSM];
  id v5 = [[SUManagerEngineParam alloc] initWithDownloadDescriptor:v4];

  [v6 postEvent:@"DownloadAndPrepare" withInfo:v5];
}

- (void)refreshInstallTonightConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SUManagerEngine_refreshInstallTonightConfig___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __47__SUManagerEngine_refreshInstallTonightConfig___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePolicyFactoryMetricEventFields:*(void *)(a1 + 40) updateUUID:0];
}

- (void)_updatePolicyFactoryMetricEventFields:(id)a3 updateUUID:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUManagerEngine *)self engineFSM];
  id v8 = [v7 extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v13) {
    [v9 setValue:v13 forKey:*MEMORY[0x263F77F98]];
  }
  if (v6) {
    [v9 setValue:v6 forKey:*MEMORY[0x263F78128]];
  }
  uint64_t v10 = [(SUManagerEngine *)self policyFactory];
  uint64_t v11 = [v10 globalOptions];

  [v11 appendUpdateMetricEventFields:v9];
  uint64_t v12 = [(SUManagerEngine *)self policyFactory];
  [v12 setGlobalOptions:v11];
}

- (void)installUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [(SUManagerEngine *)self engineFSM];
  id v5 = [[SUManagerEngineParam alloc] initWithInstallOptions:v4];

  [v6 postEvent:@"InstallUpdate" withInfo:v5];
}

- (void)removeUpdateKeepingDocAssets:(BOOL)a3
{
  if (a3) {
    id v4 = [[SUManagerEngineParam alloc] initWithPurgeOptions:1 withError:0];
  }
  else {
    id v4 = objc_alloc_init(SUManagerEngineParam);
  }
  id v6 = v4;
  id v5 = [(SUManagerEngine *)self engineFSM];
  [v5 postEvent:@"RemoveUpdate" withInfo:v6];
}

- (id)availableRollback
{
  id v3 = [(SUManagerEngine *)self updateControl];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F77BC8]) initWithDelegate:self updateDescriptor:0 updateUUID:self->_rollbackUUID];
    [(SUManagerEngine *)self setUpdateControl:v4];
  }
  id v5 = [(SUManagerEngine *)self updateControl];
  id v6 = [v5 rollbackAvailable];

  return v6;
}

- (id)previousRollback
{
  id v3 = [(SUManagerEngine *)self updateControl];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F77BC8]) initWithDelegate:self updateDescriptor:0 updateUUID:self->_rollbackUUID];
    [(SUManagerEngine *)self setUpdateControl:v4];
  }
  id v5 = [(SUManagerEngine *)self updateControl];
  id v6 = [v5 previousRollback];

  return v6;
}

- (void)rollbackUpdateWithOptions:(id)a3
{
  id v4 = a3;
  id v6 = [(SUManagerEngine *)self engineFSM];
  id v5 = [[SUManagerEngineParam alloc] initWithRollbackOptions:v4];

  [v6 postEvent:@"RollbackRequested" withInfo:v5];
}

- (void)onUnlock
{
  id v3 = [(SUManagerEngine *)self engineFSM];
  id v4 = [v3 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SUManagerEngine_onUnlock__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __27__SUManagerEngine_onUnlock__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [MEMORY[0x263F77D80] sharedCore];
    id v5 = [v4 delegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__SUManagerEngine_onUnlock__block_invoke_2;
    block[3] = &unk_26447C878;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
  id v6 = [*(id *)(a1 + 32) engineFSM];
  id v7 = [SUManagerEngineParam alloc];
  id v8 = [*(id *)(a1 + 32) downloadDescriptor];
  id v9 = [(SUManagerEngineParam *)v7 initWithDownloadDescriptor:v8];
  [v6 postEvent:@"Unlocked" withInfo:v9];
}

void __27__SUManagerEngine_onUnlock__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managerDelegate];
  [v1 sendUnlockNotifications:0];
}

- (void)createBrainLoadLockAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SUManagerEngine_createBrainLoadLockAssertion___block_invoke;
  v8[3] = &unk_26447C940;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __48__SUManagerEngine_createBrainLoadLockAssertion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = 0;
  objc_msgSend(v2, "_queue_createBrainLoadLockAssertion:", &v5);
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (BOOL)_queue_createBrainLoadLockAssertion:(id *)a3
{
  v37[2] = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if (![(SUManagerEngine *)self isPasscodeEnabled])
  {
    SULogInfo(@"Unable to create lock assertion on device without passcode", v7, v8, v9, v10, v11, v12, v13, v35);
    if (a3)
    {
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = 86;
      goto LABEL_7;
    }
    return 0;
  }
  if ([(SUManagerEngine *)self isPasscodeLocked])
  {
    SULogInfo(@"Unable to create lock assertion on locked device", v14, v15, v16, v17, v18, v19, v20, v35);
    if (a3)
    {
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = 85;
LABEL_7:
      [v21 errorWithDomain:@"com.apple.softwareupdateservices.errors" code:v22 userInfo:0];
      BOOL v23 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v23;
    }
    return 0;
  }
  v36[0] = @"MKBAssertionKey";
  v36[1] = @"MKBAssertionTimeout";
  v37[0] = @"RemoteProfile";
  uint64_t v24 = [NSNumber numberWithLongLong:240];
  v37[1] = v24;
  id v25 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  uint64_t v26 = (__MKBAssertion *)MKBDeviceLockAssertion();
  self->_lockAssertion = v26;
  if (v26) {
    SULogInfo(@"Created lock assertion", v27, v28, v29, v30, v31, v32, v33, v35);
  }
  BOOL v23 = self->_lockAssertion != 0;

  return v23;
}

- (void)updateBrainLoadProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SUManagerEngine_updateBrainLoadProgress___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __43__SUManagerEngine_updateBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  id v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updateBrainLoadStalled:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SUManagerEngine_updateBrainLoadStalled___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__SUManagerEngine_updateBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  id v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updateBrainLoaded:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  id v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SUManagerEngine_updateBrainLoaded___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __37__SUManagerEngine_updateBrainLoaded___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = *MEMORY[0x263F77D30];
  id v3 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v4 postEvent:v2 withInfo:v3];
}

- (void)updateAssetDownloadPreflighted
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [(SUManagerEngine *)self engineLog];
  id v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SUManagerEngine *)self engineName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_21DCF7000, v4, OS_LOG_TYPE_DEFAULT, "%@ update asset download preflighted", (uint8_t *)&v6, 0xCu);
  }
}

- (void)updateAssetDownloadProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SUManagerEngine_updateAssetDownloadProgress___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __47__SUManagerEngine_updateAssetDownloadProgress___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updateAssetDownloadStalled:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SUManagerEngine_updateAssetDownloadStalled___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __46__SUManagerEngine_updateAssetDownloadStalled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updateAssetDownloaded:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerEngine_updateAssetDownloaded___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__SUManagerEngine_updateAssetDownloaded___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updatePrepareProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerEngine_updatePrepareProgress___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__SUManagerEngine_updatePrepareProgress___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v3 postEvent:@"UpdateProgress" withInfo:v2];
}

- (void)updatePrepared:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SUManagerEngine_updatePrepared___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __34__SUManagerEngine_updatePrepared___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = *MEMORY[0x263F77D38];
  id v3 = [[SUManagerEngineParam alloc] initWithProgress:*(void *)(a1 + 40)];
  [v4 postEvent:v2 withInfo:v3];
}

- (void)updateApplied
{
  id v3 = [(SUManagerEngine *)self engineFSM];
  id v4 = [v3 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SUManagerEngine_updateApplied__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __32__SUManagerEngine_updateApplied__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v1 = *MEMORY[0x263F77D20];
  uint64_t v2 = objc_alloc_init(SUManagerEngineParam);
  [v3 postEvent:v1 withInfo:v2];
}

- (void)applyAttemptFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SUManagerEngine_applyAttemptFailed___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __38__SUManagerEngine_applyAttemptFailed___block_invoke(uint64_t a1)
{
  uint64_t v2 = (__CFString *)(id)*MEMORY[0x263F77D18];
  id v3 = *(void **)(a1 + 32);
  uint64_t v33 = v2;
  if (!v3) {
    goto LABEL_21;
  }
  uint64_t v4 = [v3 domain];
  id v5 = v33;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = (void *)v4;
  id v7 = [*(id *)(a1 + 32) domain];
  if ([v7 isEqualToString:*MEMORY[0x263F55A90]])
  {
    uint64_t v8 = [*(id *)(a1 + 32) code];

    id v5 = v33;
    if (v8 != 5) {
      goto LABEL_8;
    }
    id v5 = @"ApplyFailedDone";
    int v6 = v33;
  }
  else
  {

    id v5 = v33;
  }

LABEL_8:
  id v9 = *(void **)(a1 + 32);
  if (!v9)
  {
    uint64_t v28 = 0;
    uint64_t v33 = v5;
    goto LABEL_23;
  }
  uint64_t v10 = [v9 userInfo];
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [*(id *)(a1 + 32) userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v14 = [*(id *)(a1 + 32) userInfo];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"Recoverable"];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    uint64_t v17 = [*(id *)(a1 + 32) userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"Recoverable"];
    int v19 = [v18 BOOLValue];

    if (v19) {
      uint64_t v20 = v33;
    }
    else {
      uint64_t v20 = @"ApplyFailedDone";
    }
    uint64_t v33 = v20;
  }
  else
  {
LABEL_14:
    uint64_t v33 = v5;
  }
  uint64_t v21 = *(void **)(a1 + 32);
  if (!v21)
  {
LABEL_21:
    uint64_t v28 = 0;
    goto LABEL_23;
  }
  uint64_t v22 = [v21 userInfo];
  id v23 = (id)[v22 mutableCopy];

  if (!v23) {
    id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v24 = [*(id *)(a1 + 40) policyFactory];
  id v25 = [v24 installOptions];

  if (v25) {
    [v23 setSafeObject:v25 forKey:@"InstallOptions"];
  }
  uint64_t v26 = (void *)MEMORY[0x263F087E8];
  uint64_t v27 = [*(id *)(a1 + 32) domain];
  uint64_t v28 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(*(id *)(a1 + 32), "code"), v23);

LABEL_23:
  uint64_t v29 = [*(id *)(a1 + 40) engineFSM];
  uint64_t v30 = [SUManagerEngineParam alloc];
  uint64_t v31 = [*(id *)(a1 + 40) downloadDescriptor];
  uint64_t v32 = [(SUManagerEngineParam *)v30 initWithDescriptor:v31 andError:v28];
  [v29 postEvent:v33 withInfo:v32];
}

- (void)updateAttemptFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SUManagerEngine_updateAttemptFailed___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __39__SUManagerEngine_updateAttemptFailed___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingPurgeParams];

  id v3 = [SUManagerEngineParam alloc];
  id v4 = v3;
  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) pendingPurgeParams];
    uint64_t v8 = -[SUManagerEngineParam initWithPurgeOptions:withError:](v4, "initWithPurgeOptions:withError:", [v5 skipDocAssetsPurge], *(void *)(a1 + 40));

    [*(id *)(a1 + 32) setPendingPurgeParams:0];
  }
  else
  {
    uint64_t v8 = [(SUManagerEngineParam *)v3 initWithError:*(void *)(a1 + 40)];
  }
  int v6 = [*(id *)(a1 + 32) engineFSM];
  id v7 = [[SUManagerEngineParam alloc] initWithError:*(void *)(a1 + 40)];
  [v6 postEvent:@"UpdateFailed" withInfo:v7];
}

- (void)updateCanceled
{
  id v3 = [(SUManagerEngine *)self engineFSM];
  id v4 = [v3 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUManagerEngine_updateCanceled__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __33__SUManagerEngine_updateCanceled__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingPurgeParams];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) pendingPurgeParams];
    [*(id *)(a1 + 32) setPendingPurgeParams:0];
  }
  else
  {
    id v4 = objc_alloc_init(SUManagerEngineParam);
  }
  id v3 = [*(id *)(a1 + 32) engineFSM];
  [v3 postEvent:@"UpdateCanceled" withInfo:v4];
}

- (void)updateRolledBack:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineFSM];
  int v6 = [v5 extendedStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SUManagerEngine_updateRolledBack___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __36__SUManagerEngine_updateRolledBack___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithRollback:*(void *)(a1 + 40)];
  [v3 postEvent:@"RollbackComplete" withInfo:v2];
}

- (void)rollbackAttemptFailed:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUManagerEngine *)self engineFSM];
  id v9 = [v8 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUManagerEngine_rollbackAttemptFailed_withError___block_invoke;
  block[3] = &unk_26447CD70;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __51__SUManagerEngine_rollbackAttemptFailed_withError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) engineFSM];
  uint64_t v2 = [[SUManagerEngineParam alloc] initWithRollback:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  [v3 postEvent:@"RollbackFailed" withInfo:v2];
}

- (void)updateAnomaly:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineLog];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SUManagerEngine *)self engineName];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21DCF7000, v6, OS_LOG_TYPE_DEFAULT, "%@ anomaly reporteed by update control interface, error:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)pathSatisficationStatusChangedTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(SUManagerEngine *)self engineLog];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SUManagerEngine *)self engineName];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_21DCF7000, v6, OS_LOG_TYPE_DEFAULT, "%@ path satisfication changed to: %d", buf, 0x12u);
  }
  if (v3)
  {
    int v8 = [(SUManagerEngine *)self engineFSM];
    id v9 = [v8 extendedStateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SUManagerEngine_pathSatisficationStatusChangedTo___block_invoke;
    block[3] = &unk_26447C878;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

void __52__SUManagerEngine_pathSatisficationStatusChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUNetworkMonitor sharedInstance];
  [v2 removeObserver:*(void *)(a1 + 32)];

  id v6 = [*(id *)(a1 + 32) engineFSM];
  BOOL v3 = [SUManagerEngineParam alloc];
  id v4 = [*(id *)(a1 + 32) downloadDescriptor];
  id v5 = [(SUManagerEngineParam *)v3 initWithDownloadDescriptor:v4];
  [v6 postEvent:@"NetworkAvailable" withInfo:v5];
}

- (BOOL)isBrainNetworkError:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineLog];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SUManagerEngine *)self engineName];
    int v24 = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_21DCF7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Checking if engine parameter is brain network error, %@", (uint8_t *)&v24, 0x16u);
  }
  if ([v4 paramType] != 5)
  {
    uint64_t v12 = [(SUManagerEngine *)self engineLog];
    __int16 v13 = [v12 oslog];

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    BOOL v14 = [(SUManagerEngine *)self engineName];
    int v24 = 138412290;
    id v25 = v14;
    uint64_t v15 = "%@ engine parameter is not an error";
LABEL_17:
    _os_log_impl(&dword_21DCF7000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, 0xCu);

    goto LABEL_18;
  }
  int v8 = [v4 error];
  id v9 = [v8 domain];
  char v10 = [v9 isEqualToString:*MEMORY[0x263F55A90]];

  if ((v10 & 1) == 0)
  {
    char v16 = [(SUManagerEngine *)self engineLog];
    __int16 v13 = [v16 oslog];

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    BOOL v14 = [(SUManagerEngine *)self engineName];
    int v24 = 138412290;
    id v25 = v14;
    uint64_t v15 = "%@ engine error parameter is not in MSU domain";
    goto LABEL_17;
  }
  id v11 = [v4 error];
  if ([v11 code] != 812)
  {
    uint64_t v17 = [v4 error];
    uint64_t v18 = [v17 code];

    if (v18 == 806) {
      goto LABEL_12;
    }
    uint64_t v22 = [(SUManagerEngine *)self engineLog];
    __int16 v13 = [v22 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(SUManagerEngine *)self engineName];
      int v24 = 138412290;
      id v25 = v14;
      uint64_t v15 = "%@ engine error parameter does not have a network failure code";
      goto LABEL_17;
    }
LABEL_18:
    BOOL v21 = 0;
    goto LABEL_19;
  }

LABEL_12:
  int v19 = [(SUManagerEngine *)self engineLog];
  __int16 v13 = [v19 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(SUManagerEngine *)self engineName];
    int v24 = 138412290;
    id v25 = v20;
    _os_log_impl(&dword_21DCF7000, v13, OS_LOG_TYPE_DEFAULT, "%@ Engine parameter is brain network error", (uint8_t *)&v24, 0xCu);
  }
  BOOL v21 = 1;
LABEL_19:

  return v21;
}

- (BOOL)isBrainReloadError:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUManagerEngine *)self engineLog];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SUManagerEngine *)self engineName];
    int v23 = 138412546;
    int v24 = v7;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_21DCF7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Checking if engine parameter is brain error that should be retried, %@", (uint8_t *)&v23, 0x16u);
  }
  if ([v4 paramType] != 5)
  {
    uint64_t v18 = [(SUManagerEngine *)self engineLog];
    BOOL v14 = [v18 oslog];

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v19 = [(SUManagerEngine *)self engineName];
    int v23 = 138412290;
    int v24 = v19;
    uint64_t v20 = "%@ engine parameter is not an error";
LABEL_15:
    _os_log_impl(&dword_21DCF7000, v14, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, 0xCu);

    goto LABEL_16;
  }
  int v8 = [v4 error];
  id v9 = [v8 domain];
  char v10 = [v9 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  if ((v10 & 1) == 0)
  {
    BOOL v21 = [(SUManagerEngine *)self engineLog];
    BOOL v14 = [v21 oslog];

    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v19 = [(SUManagerEngine *)self engineName];
    int v23 = 138412290;
    int v24 = v19;
    uint64_t v20 = "%@ engine error parameter is not in SU domain";
    goto LABEL_15;
  }
  id v11 = [v4 error];
  uint64_t v12 = [v11 code];

  __int16 v13 = [(SUManagerEngine *)self engineLog];
  BOOL v14 = [v13 oslog];

  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12 != 107)
  {
    if (v15)
    {
      int v19 = [(SUManagerEngine *)self engineName];
      int v23 = 138412290;
      int v24 = v19;
      uint64_t v20 = "%@ engine error parameter does not have a brain should retry failure code";
      goto LABEL_15;
    }
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  if (v15)
  {
    char v16 = [(SUManagerEngine *)self engineName];
    int v23 = 138412290;
    int v24 = v16;
    _os_log_impl(&dword_21DCF7000, v14, OS_LOG_TYPE_DEFAULT, "%@ Engine parameter is brain retry error", (uint8_t *)&v23, 0xCu);
  }
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

- (int)lockState
{
  v4[2] = *MEMORY[0x263EF8340];
  v3[0] = *MEMORY[0x263F55A68];
  v3[1] = @"ExtendedDeviceLockState";
  v4[0] = &unk_26CEBD030;
  v4[1] = MEMORY[0x263EFFA88];
  [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return MKBGetDeviceLockState();
}

- (BOOL)isPasscodeEnabled
{
  return [(SUManagerEngine *)self lockState] != 3;
}

- (BOOL)isPasscodeLocked
{
  unsigned int v2 = [(SUManagerEngine *)self lockState];
  return (v2 < 7) & (0x46u >> v2);
}

- (void)cancelLockAssertion
{
  BOOL v3 = [(SUManagerEngine *)self engineFSM];
  id v4 = [v3 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUManagerEngine_cancelLockAssertion__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __38__SUManagerEngine_cancelLockAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelLockAssertion");
}

- (void)_queue_cancelLockAssertion
{
  BOOL v3 = [(SUManagerEngine *)self engineFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_lockAssertion)
  {
    SULogInfo(@"Canceled lock assertion", v5, v6, v7, v8, v9, v10, v11, v12);
    CFRelease(self->_lockAssertion);
    self->_lockAssertion = 0;
  }
}

- (id)updatePolicy
{
  return [(SUPolicyFactory *)self->_policyFactory corePolicy];
}

- (id)rollbackPolicy
{
  return [(SUPolicyFactory *)self->_policyFactory rollbackPolicy];
}

- (void)resetPolicy
{
  self->_policyFactory = objc_alloc_init(SUPolicyFactory);

  MEMORY[0x270F9A758]();
}

- (void)notifyRollbackStarted:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUManagerEngine *)self managerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v8 = [v7 delegateCallbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__SUManagerEngine_notifyRollbackStarted___block_invoke;
    v12[3] = &unk_26447C8C8;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }
  else
  {
    uint64_t v9 = [(SUManagerEngine *)self engineLog];
    uint64_t v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(SUManagerEngine *)self engineName];
      *(_DWORD *)buf = 138412290;
      BOOL v15 = v11;
      _os_log_impl(&dword_21DCF7000, v10, OS_LOG_TYPE_DEFAULT, "%@ delegate does not respond to selector(rollbackStarted:) so not reporting", buf, 0xCu);
    }
  }
}

void __41__SUManagerEngine_notifyRollbackStarted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managerDelegate];
  [v2 rollbackStarted:*(void *)(a1 + 40)];
}

+ (int)softwareUpdateTypeForDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 splatOnly])
  {
    int v4 = 4;
  }
  else
  {
    uint64_t v5 = [v3 updateType];
    if ((unint64_t)(v5 - 1) <= 2) {
      int v4 = v5;
    }
    else {
      int v4 = 0;
    }
  }

  return v4;
}

+ (unint64_t)SUCoreAudienceTypeToSUSAudienceType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (unint64_t)SUCorePreferredTypeToSUSPreferenceType:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (unint64_t)upgradeTypeForCoreDescriptor:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x263F77D98] sharedDevice];
  uint64_t v5 = [v3 productBuildVersion];
  char v6 = [v4 isMinorOSUpdate:v5];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 productBuildVersion];
    int v9 = [v4 isMajorOSUpdate:v8];

    if (v9) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)SUOperationProgressFromSUCoreProgress:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(SUOperationProgress);
  uint64_t v5 = [v3 phase];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F781A8]];

  if (v6)
  {
    [v3 portionComplete];
    if (v7 == 1.0)
    {
      uint64_t v8 = kSUDownloadPhaseBrainExtracting;
      goto LABEL_11;
    }
    int v11 = [v3 isStalled];
    uint64_t v8 = kSUDownloadPhaseBrainFetching;
    uint64_t v12 = kSUDownloadPhaseBrainFetchingStalled;
LABEL_9:
    if (v11) {
      uint64_t v8 = v12;
    }
    goto LABEL_11;
  }
  int v9 = [v3 phase];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F78198]];

  if (v10)
  {
    int v11 = [v3 isStalled];
    uint64_t v8 = kSUDownloadPhaseUpdateFetching;
    uint64_t v12 = kSUDownloadPhaseUpdateFetchingStalled;
    goto LABEL_9;
  }
  id v13 = [v3 phase];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F781C0]];

  if (!v14) {
    goto LABEL_12;
  }
  uint64_t v8 = kSUDownloadPhasePreparingForInstallation;
LABEL_11:
  [(SUOperationProgress *)v4 setPhase:*v8];
LABEL_12:
  [v3 portionComplete];
  [(SUOperationProgress *)v4 setIsDone:v15 == 1.0];
  [v3 portionComplete];
  -[SUOperationProgress setPercentComplete:](v4, "setPercentComplete:");
  [v3 estimatedTimeRemaining];
  -[SUOperationProgress setTimeRemaining:](v4, "setTimeRemaining:");
  LODWORD(v16) = -1.0;
  [(SUOperationProgress *)v4 setNormalizedPercentComplete:v16];

  return v4;
}

+ (id)SUDescriptorFromCoreDescriptor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(SUDescriptor);
    int v6 = [v4 documentation];

    if (v6)
    {
      float v7 = [SUDocumentation alloc];
      uint64_t v8 = [v4 documentation];
      int v9 = [(SUDocumentation *)v7 initWithSUCoreDocumentation:v8];
      [(SUDescriptor *)v5 setDocumentation:v9];
    }
    int v10 = [v4 publisher];
    [(SUDescriptor *)v5 setPublisher:v10];

    int v11 = [v4 productSystemName];
    [(SUDescriptor *)v5 setProductSystemName:v11];

    uint64_t v12 = [v4 productVersion];
    [(SUDescriptor *)v5 setProductVersion:v12];

    id v13 = [v4 productVersionExtra];
    [(SUDescriptor *)v5 setProductVersionExtra:v13];

    int v14 = [v4 productBuildVersion];
    [(SUDescriptor *)v5 setProductBuildVersion:v14];

    float v15 = [v4 prerequisiteBuild];
    [(SUDescriptor *)v5 setPrerequisiteBuild:v15];

    double v16 = [v4 prerequisiteOSVersion];
    [(SUDescriptor *)v5 setPrerequisiteOS:v16];

    BOOL v17 = [v4 releaseType];
    [(SUDescriptor *)v5 setReleaseType:v17];

    -[SUDescriptor setDownloadSize:](v5, "setDownloadSize:", [v4 downloadSize]);
    -[SUDescriptor _setUnarchiveSize:](v5, "_setUnarchiveSize:", [v4 unarchivedSize]);
    -[SUDescriptor _setMsuPrepareSize:](v5, "_setMsuPrepareSize:", [v4 msuPrepareSize]);
    -[SUDescriptor setInstallationSize:](v5, "setInstallationSize:", [v4 installationSize]);
    -[SUDescriptor setMinimumSystemPartitionSize:](v5, "setMinimumSystemPartitionSize:", [v4 minimumSystemPartitionSize]);
    -[SUDescriptor setPreparationSize:](v5, "setPreparationSize:", [v4 preparationSize]);
    -[SUDescriptor setTotalRequiredFreeSpace:](v5, "setTotalRequiredFreeSpace:", [v4 totalRequiredFreeSpace]);
    -[SUDescriptor _setStreamingZipCapable:](v5, "_setStreamingZipCapable:", [v4 streamingZipCapable]);
    -[SUDescriptor setUpdateType:](v5, "setUpdateType:", [a1 softwareUpdateTypeForDescriptor:v4]);
    -[SUDescriptor setAutoDownloadAllowableForCellular:](v5, "setAutoDownloadAllowableForCellular:", [v4 autoDownloadAllowableOverCellular]);
    -[SUDescriptor setDownloadableOverCellular:](v5, "setDownloadableOverCellular:", [v4 downloadAllowableOverCellular]);
    -[SUDescriptor setDownloadable:](v5, "setDownloadable:", [v4 downloadable]);
    -[SUDescriptor _setDisableSiriVoiceDeletion:](v5, "_setDisableSiriVoiceDeletion:", [v4 disableSiriVoiceDeletion]);
    -[SUDescriptor _setDisableCDLevel4:](v5, "_setDisableCDLevel4:", [v4 disableCDLevel4]);
    -[SUDescriptor _setDisableAppDemotion:](v5, "_setDisableAppDemotion:", [v4 disableAppDemotion]);
    -[SUDescriptor _setDisableInstallTonight:](v5, "_setDisableInstallTonight:", [v4 disableInstallTonight]);
    -[SUDescriptor setRampEnabled:](v5, "setRampEnabled:", [v4 rampEnabled]);
    -[SUDescriptor setGranularlyRamped:](v5, "setGranularlyRamped:", [v4 granularlyRamped]);
    -[SUDescriptor setCriticalOutOfBoxOnly:](v5, "setCriticalOutOfBoxOnly:", [v4 criticalOutOfBoxOnly]);
    -[SUDescriptor setAutoUpdateEnabled:](v5, "setAutoUpdateEnabled:", [v4 autoUpdateEnabled]);
    uint64_t v18 = [v4 setupCritical];
    [(SUDescriptor *)v5 setSetupCritical:v18];

    int v19 = [v4 criticalOverrideCellularPolicy];
    [(SUDescriptor *)v5 setCriticalDownloadPolicy:v19];

    uint64_t v20 = [v4 systemPartitionPadding];
    [(SUDescriptor *)v5 setSystemPartitionPadding:v20];

    BOOL v21 = [v4 sepDigest];
    [(SUDescriptor *)v5 setSEPDigest:v21];

    uint64_t v22 = [v4 rsepDigest];
    [(SUDescriptor *)v5 setRSEPDigest:v22];

    int v23 = [v4 sepTBMDigests];
    [(SUDescriptor *)v5 setSEPTBMDigest:v23];

    int v24 = [v4 rsepTBMDigests];
    [(SUDescriptor *)v5 setRSEPTBMDigest:v24];

    __int16 v25 = [v4 releaseDate];
    [(SUDescriptor *)v5 setReleaseDate:v25];

    -[SUDescriptor setMdmDelayInterval:](v5, "setMdmDelayInterval:", [v4 mdmDelayInterval]);
    id v26 = [v4 assetID];
    [(SUDescriptor *)v5 setAssetID:v26];

    -[SUDescriptor setAudienceType:](v5, "setAudienceType:", objc_msgSend(a1, "SUCoreAudienceTypeToSUSAudienceType:", objc_msgSend(v4, "descriptorAudienceType")));
    -[SUDescriptor setPreferenceType:](v5, "setPreferenceType:", objc_msgSend(a1, "SUCorePreferredTypeToSUSPreferenceType:", objc_msgSend(v4, "preferredUpdateType")));
    -[SUDescriptor setUpgradeType:](v5, "setUpgradeType:", [a1 upgradeTypeForCoreDescriptor:v4]);
    -[SUDescriptor setPromoteAlternateUpdate:](v5, "setPromoteAlternateUpdate:", [v4 promoteAlternateUpdate]);
    -[SUDescriptor setHideInstallAlert:](v5, "setHideInstallAlert:", [a1 shouldHideInstallAlertForCoreDescriptor:v4]);
    -[SUDescriptor setIsSplatOnly:](v5, "setIsSplatOnly:", [v4 splatOnly]);
    uint64_t v27 = [v4 humanReadableUpdateName];
    [(SUDescriptor *)v5 setHumanReadableUpdateName:v27];

    -[SUDescriptor setMandatoryUpdateEligible:](v5, "setMandatoryUpdateEligible:", [v4 mandatoryUpdateEligible]);
    uint64_t v28 = [v4 mandatoryUpdateVersionMin];
    [(SUDescriptor *)v5 setMandatoryUpdateVersionMin:v28];

    uint64_t v29 = [v4 mandatoryUpdateVersionMax];
    [(SUDescriptor *)v5 setMandatoryUpdateVersionMax:v29];

    -[SUDescriptor setMandatoryUpdateOptional:](v5, "setMandatoryUpdateOptional:", [v4 mandatoryUpdateOptional]);
    -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v5, "setMandatoryUpdateRestrictedToOutOfTheBox:", [v4 mandatoryUpdateRestrictedToOutOfTheBox]);
    -[SUDescriptor setForcePasscodeRequired:](v5, "setForcePasscodeRequired:", [v4 forcePasscodeRequired]);
    -[SUDescriptor setAllowAutoDownloadOnBattery:](v5, "setAllowAutoDownloadOnBattery:", [v4 allowAutoDownloadOnBattery]);
    -[SUDescriptor setAutoDownloadOnBatteryDelay:](v5, "setAutoDownloadOnBatteryDelay:", [v4 autoDownloadOnBatteryDelay]);
    -[SUDescriptor setAutoDownloadOnBatteryMinBattery:](v5, "setAutoDownloadOnBatteryMinBattery:", [v4 autoDownloadOnBatteryMinBattery]);
    uint64_t v30 = [v4 associatedSplatDescriptor];
    [(SUDescriptor *)v5 setIsSplombo:v30 != 0];

    uint64_t v31 = [v4 associatedSplatDescriptor];
    uint64_t v32 = [v31 productBuildVersion];
    [(SUDescriptor *)v5 setSplatComboBuildVersion:v32];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)SUDescriptorFromRollbackDescriptor:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(SUDescriptor);
    uint64_t v5 = [v3 productBuildVersion];
    [(SUDescriptor *)v4 setProductBuildVersion:v5];

    int v6 = [v3 productVersion];
    [(SUDescriptor *)v4 setProductVersion:v6];

    float v7 = [v3 releaseType];

    [(SUDescriptor *)v4 setReleaseType:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldHideInstallAlertForCoreDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 hideInstallAlert] == 2)
  {
    id v4 = +[SUUtility currentReleaseType];
    char v5 = [v4 isEqualToString:@"Beta"];

    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      float v7 = [v3 productVersion];
      BOOL v6 = +[SUAssetSupport updateIsPreCRelease:v7];

      SULogInfo(@"%s: Current release type is not developer, overriding HideInstallAlert to: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"+[SUManagerEngine shouldHideInstallAlertForCoreDescriptor:]");
    }
  }
  else
  {
    BOOL v6 = [v3 hideInstallAlert] != 0;
  }

  return v6;
}

+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4
{
  return +[SUManagerEngine SUDescriptor:a3 matchesSUCoreDescriptor:a4 comparisonFlags:0];
}

+ (BOOL)SUDescriptor:(id)a3 matchesSUCoreDescriptor:(id)a4 comparisonFlags:(unint64_t)a5
{
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    return 1;
  }
  char v5 = a5;
  float v7 = (void *)MEMORY[0x263F77D80];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 prerequisiteBuild];
  uint64_t v11 = [v8 prerequisiteBuild];
  char v28 = [v7 stringIsEqual:v10 to:v11];

  uint64_t v12 = (void *)MEMORY[0x263F77D80];
  uint64_t v13 = [v9 prerequisiteOS];
  uint64_t v14 = [v8 prerequisiteOSVersion];
  LOBYTE(v12) = [v12 stringIsEqual:v13 to:v14];

  float v15 = (void *)MEMORY[0x263F77D80];
  uint64_t v16 = [v9 releaseType];
  BOOL v17 = [v8 releaseType];
  LOBYTE(v15) = [v15 stringIsEqual:v16 to:v17];

  uint64_t v18 = [v9 productSystemName];
  int v19 = [v8 productSystemName];
  LOBYTE(v16) = [v18 isEqualToString:v19];

  uint64_t v20 = [v9 productVersion];
  BOOL v21 = [v8 productVersion];
  char v22 = [v20 isEqualToString:v21];

  int v23 = [v9 productBuildVersion];
  int v24 = [v8 productBuildVersion];
  LOBYTE(v7) = [v23 isEqualToString:v24];

  uint64_t v25 = [v9 downloadSize];
  uint64_t v26 = [v8 downloadSize];

  BOOL result = v28 & v12 & v15 & v16 & v22 & v7;
  if ((v5 & 1) == 0 && v25 != v26) {
    return 0;
  }
  return result;
}

+ (id)rollbackDescriptorForSUCoreRollbackDescriptor:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(SURollbackDescriptor);
    char v5 = [v3 restoreVersion];
    [(SURollbackDescriptor *)v4 setRestoreVersion:v5];

    BOOL v6 = [v3 productVersion];
    [(SURollbackDescriptor *)v4 setProductVersion:v6];

    float v7 = [v3 productBuildVersion];
    [(SURollbackDescriptor *)v4 setProductBuildVersion:v7];

    id v8 = [v3 releaseType];

    [(SURollbackDescriptor *)v4 setReleaseType:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (SUCoreScan)activeScanner
{
  return self->_activeScanner;
}

- (void)setActiveScanner:(id)a3
{
}

- (BOOL)isManagedScan
{
  return self->_isManagedScan;
}

- (void)setIsManagedScan:(BOOL)a3
{
  self->_isManagedScan = a3;
}

- (SUManagerEngineParam)pendingManagedScanParams
{
  return self->_pendingManagedScanParams;
}

- (void)setPendingManagedScanParams:(id)a3
{
}

- (SUManagerEngineParam)pendingPurgeParams
{
  return self->_pendingPurgeParams;
}

- (void)setPendingPurgeParams:(id)a3
{
}

- (SUManagerEngineDelegate)managerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managerDelegate);

  return (SUManagerEngineDelegate *)WeakRetained;
}

- (SUCoreLog)engineLog
{
  return self->_engineLog;
}

- (NSString)engineName
{
  return self->_engineName;
}

- (SUCoreUpdate)updateControl
{
  return self->_updateControl;
}

- (void)setUpdateControl:(id)a3
{
}

- (SUManagerEngineDownloadDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (void)setDownloadDescriptor:(id)a3
{
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)engineFSM
{
  return self->_engineFSM;
}

- (void)setEngineFSM:(id)a3
{
}

- (BOOL)activating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (unint64_t)loadBrainRetries
{
  return self->_loadBrainRetries;
}

- (void)setLoadBrainRetries:(unint64_t)a3
{
  self->_loadBrainRetries = a3;
}

- (__MKBAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(__MKBAssertion *)a3
{
  self->_lockAssertion = a3;
}

- (NSString)rollbackUUID
{
  return self->_rollbackUUID;
}

- (void)setRollbackUUID:(id)a3
{
}

- (SUPolicyFactory)policyFactory
{
  return self->_policyFactory;
}

- (void)setPolicyFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyFactory, 0);
  objc_storeStrong((id *)&self->_rollbackUUID, 0);
  objc_storeStrong((id *)&self->_engineFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_updateControl, 0);
  objc_storeStrong((id *)&self->_engineName, 0);
  objc_storeStrong((id *)&self->_engineLog, 0);
  objc_destroyWeak((id *)&self->_managerDelegate);
  objc_storeStrong((id *)&self->_pendingPurgeParams, 0);
  objc_storeStrong((id *)&self->_pendingManagedScanParams, 0);

  objc_storeStrong((id *)&self->_activeScanner, 0);
}

@end