@interface SUSettingsStatefulUIManager
+ (id)_generateStateTable;
- (BOOL)assignScanRelatedMembersFromScanResults:(id)a3;
- (BOOL)connectedToPowerSource;
- (BOOL)doesTargetedUpdateMatchDescriptor:(id)a3;
- (BOOL)doesTargetedUpdateMatchDescriptorType:(unint64_t)a3;
- (BOOL)hasSUPathRestrictions;
- (BOOL)hidingAlternateDescriptor;
- (BOOL)hidingPreferredDescriptor;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isClearingSpaceForDownload;
- (BOOL)isDelayingUpdate;
- (BOOL)isPerformingFullScan;
- (BOOL)isPerformingRefresh;
- (BOOL)isPerformingUpdate;
- (BOOL)isPreferredUpdatePromotedAsAlternate;
- (BOOL)isRollingBack;
- (BOOL)isTargetedUpdateScheduledForAutoInstall;
- (BOOL)performThirdPartyScan;
- (NSArray)betaPrograms;
- (NSDictionary)stateTable;
- (NSError)scanError;
- (NSMutableSet)auxiliaryOperations;
- (OS_dispatch_queue)delegateCallbackQueue;
- (OS_dispatch_queue)preferencesQueue;
- (OS_dispatch_queue)workQueue;
- (SDBetaManager)seedingBetaManager;
- (SDBetaProgram)enrolledBetaProgram;
- (SDDevice)currentSeedingDevice;
- (SUAutoInstallOperation)currentAutoInstallOperation;
- (SUCoreDDMDeclaration)ddmDeclaration;
- (SUCoreFSM)managerFSM;
- (SUCoreLog)log;
- (SUDownload)currentDownload;
- (SUManagerClient)suClient;
- (SURollbackDescriptor)rollbackDescriptor;
- (SUSUIUpdateAgreementManager)agreementManager;
- (SUSettingsSUPreferencesManager)preferences;
- (SUSettingsScanOperation)currentFullScanOperation;
- (SUSettingsScanOperation)currentRefreshScanOperation;
- (SUSettingsStatefulDescriptor)alternateStatefulDescriptor;
- (SUSettingsStatefulDescriptor)hiddenAlternateStatefulDescriptor;
- (SUSettingsStatefulDescriptor)hiddenPreferredStatefulDescriptor;
- (SUSettingsStatefulDescriptor)preferredStatefulDescriptor;
- (SUSettingsStatefulErrorContextProvider)errorContextProvider;
- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3;
- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 betaManager:(id)a4 preferences:(id)a5 options:(id)a6;
- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 options:(id)a4;
- (SUSettingsStatefulUIManagerDelegate)delegate;
- (SUSettingsStatefulUIOptions)options;
- (SUSettingsUpdateOperation)currentUpdateOperation;
- (float)batteryLevel;
- (id)baseDomain;
- (id)createScanOperationOptions;
- (id)createUpdateOperationOptions;
- (id)rvGetCurrentNeRDInfo;
- (id)targetedUpdateForDownload:(id)a3;
- (id)targetedUpdateMatchingDescriptor:(id)a3;
- (id)targetedUpdateStatefulDescriptor;
- (int)networkType;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4;
- (int64_t)action_RefreshScanResults:(id)a3 error:(id *)a4;
- (int64_t)action_ReportNoUpdateFound:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRefreshScanResults:(id)a3 error:(id *)a4;
- (int64_t)action_ReportRefreshScanResultsFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportScanFailed:(id)a3 error:(id *)a4;
- (int64_t)action_ReportUpdatesAvailable:(id)a3 error:(id *)a4;
- (int64_t)action_ThirdPartyScanDuringRefresh:(id)a3 error:(id *)a4;
- (int64_t)convertFSMStateToUIState:(id)a3;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)currentState;
- (unint64_t)mdmPathRestrictions;
- (unsigned)originalCellFlag;
- (unsigned)originalWifiFlag;
- (void)assignDescriptorOfType:(unint64_t)a3 fromSearchResults:(id)a4;
- (void)assignRefreshScanResults:(id)a3;
- (void)autoInstallOperationDidConsent:(id)a3;
- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4;
- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4;
- (void)autoInstallOperationWasCancelled:(id)a3;
- (void)batteryLevelChanged:(id)a3;
- (void)batteryStateChanged:(id)a3;
- (void)beginUpdateOperationWithDescriptor:(id)a3 operationDelegate:(id)a4 delegateCallbackQueue:(id)a5 operationTypeBlock:(id)a6;
- (void)checkForAvailableUpdates;
- (void)checkForAvailableUpdatesWithRetriesCount:(unsigned __int8)a3;
- (void)checkForUpdatesInBackground;
- (void)clearPastScanResults;
- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6;
- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)doEnrollInBetaUpdatesProgram:(id)a3 completionHandler:(id)a4;
- (void)downloadAndInstall:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6;
- (void)downloadAndScheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6;
- (void)downloadUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6;
- (void)enrollInBetaUpdatesProgram:(id)a3 withPurgeConfirmation:(id)a4 completionHandler:(id)a5;
- (void)executeOperationOnDelegate:(SEL)a3 usingBlock:(id)a4;
- (void)handleFailedFullScan:(id)a3;
- (void)handleFullScanResults:(id)a3;
- (void)handleRefreshScanResults:(id)a3;
- (void)handleScanFinishedRollbackApplied:(id)a3;
- (void)hideAlternateUpdate;
- (void)hideNonTargetedUpdateDescriptors;
- (void)hidePreferredUpdate;
- (void)installUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6;
- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4;
- (void)performFullScan:(id)a3;
- (void)performFullScanWithScanResults:(id)a3 andScanError:(id)a4;
- (void)performPostUpdateOperationRefresh:(BOOL)a3 withDownload:(id)a4 didScheduledUpdate:(BOOL)a5 autoInstallOperation:(id)a6 error:(id)a7 completionHandler:(id)a8;
- (void)performRefreshScan:(id)a3;
- (void)promoteTargetedUpdateToUserInitiatedStatus;
- (void)refreshBetaUpdates;
- (void)refreshBetaUpdates:(id)a3;
- (void)refreshState;
- (void)refreshState:(BOOL)a3;
- (void)revealHiddenAlteranteUpdate;
- (void)revealHiddenPreferredUpdate;
- (void)rvTriggerNeRDUpdate;
- (void)rvTriggerNeRDUpdate:(id)a3;
- (void)scheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6;
- (void)setAgreementManager:(id)a3;
- (void)setAlternateStatefulDescriptor:(id)a3;
- (void)setAuxiliaryOperations:(id)a3;
- (void)setBatteryLevel:(float)a3;
- (void)setBetaPrograms:(id)a3;
- (void)setClearingSpaceForDownload:(BOOL)a3;
- (void)setConnectedToPowerSource:(BOOL)a3;
- (void)setCurrentAutoInstallOperation:(id)a3;
- (void)setCurrentDownload:(id)a3;
- (void)setCurrentFullScanOperation:(id)a3;
- (void)setCurrentRefreshScanOperation:(id)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setCurrentUpdateOperation:(id)a3;
- (void)setDDMDeclaration:(id)a3;
- (void)setDelayingUpdate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateCallbackQueue:(id)a3;
- (void)setEnrolledBetaProgram:(id)a3;
- (void)setErrorContextProvider:(id)a3;
- (void)setHiddenAlternateStatefulDescriptor:(id)a3;
- (void)setHiddenPreferredStatefulDescriptor:(id)a3;
- (void)setHidingAlternateDescriptor:(BOOL)a3;
- (void)setHidingPreferredDescriptor:(BOOL)a3;
- (void)setIsAutoUpdateScheduled:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setMdmPathRestrictions:(unint64_t)a3;
- (void)setNetworkType:(int)a3;
- (void)setOptions:(id)a3;
- (void)setOriginalCellFlag:(unsigned __int8)a3;
- (void)setOriginalWifiFlag:(unsigned __int8)a3;
- (void)setPerformThirdPartyScan:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setPreferencesQueue:(id)a3;
- (void)setPreferredStatefulDescriptor:(id)a3;
- (void)setRollbackDescriptor:(id)a3;
- (void)setRollingBack:(BOOL)a3;
- (void)setScanError:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setupBatteryMonitoring;
- (void)setupFSM;
- (void)setupNetworkMonitoring;
- (void)setupObservers;
- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3;
- (void)unscheduleTargetedUpdateAutomaticInstallation;
- (void)updateDescriptorsUsingScanResults:(id)a3 andWithConcreteError:(id)a4;
- (void)updateStatePostDownloadOperation:(BOOL)a3 withDownload:(id)a4 error:(id)a5 completionHandler:(id)a6;
@end

@implementation SUSettingsStatefulUIManager

+ (id)_generateStateTable
{
  v152[7] = *MEMORY[0x263EF8340];
  v56[2] = a1;
  v56[1] = (id)a2;
  v151[0] = @"Idle";
  v149[0] = @"CheckForAvailableUpdate";
  v4 = (void *)MEMORY[0x263F78170];
  v147[0] = *MEMORY[0x263F78170];
  v148[0] = @"CheckingForAvailableUpdate";
  v5 = (void *)MEMORY[0x263F77E28];
  v147[1] = *MEMORY[0x263F77E28];
  v148[1] = @"CheckForAvailableUpdate";
  id v53 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v148, v147);
  v150[0] = v53;
  v149[1] = @"RefreshScanResults";
  v145[0] = *v4;
  v146[0] = @"RefreshingScanResults";
  v145[1] = *v5;
  v146[1] = @"RefreshScanResults";
  id v52 = (id)[NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:2];
  v150[1] = v52;
  v149[2] = @"RefreshScanResults";
  uint64_t v143 = *v5;
  v6 = (uint64_t *)MEMORY[0x263F78148];
  uint64_t v144 = *MEMORY[0x263F78148];
  id v51 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143);
  v150[2] = v51;
  v149[3] = @"PerformThirdPartyScan";
  uint64_t v141 = *v5;
  uint64_t v142 = *v6;
  id v50 = (id)[NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
  v150[3] = v50;
  id v49 = (id)[NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:4];
  v152[0] = v49;
  v151[1] = @"CheckingForAvailableUpdate";
  v139[0] = @"UpdatesAvailable";
  v137[0] = *v4;
  v138[0] = @"UpdatesAvailable";
  v137[1] = *v5;
  v138[1] = @"ReportUpdatesAvailable";
  id v48 = (id)[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:2];
  v140[0] = v48;
  v139[1] = @"NoUpdateAvailable";
  v135[0] = *v4;
  v136[0] = @"NoUpdateFound";
  v135[1] = *v5;
  v136[1] = @"ReportNoUpdateFound";
  id v47 = (id)[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
  v140[1] = v47;
  v139[2] = @"CheckingForUpdatesFailed";
  v133[0] = *v4;
  v134[0] = @"ScanFailed";
  v133[1] = *v5;
  v134[1] = @"ReportScanFailed";
  id v46 = (id)[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
  v140[2] = v46;
  v139[3] = @"CheckForAvailableUpdate";
  uint64_t v131 = *v5;
  uint64_t v132 = *v6;
  id v45 = (id)[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
  v140[3] = v45;
  v139[4] = @"RefreshScanResults";
  uint64_t v129 = *v5;
  uint64_t v130 = *v6;
  id v44 = (id)[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  v140[4] = v44;
  v139[5] = @"PerformThirdPartyScan";
  uint64_t v127 = *v5;
  uint64_t v128 = *v6;
  id v43 = (id)[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  v140[5] = v43;
  id v42 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v140, v139);
  v152[1] = v42;
  v151[2] = @"NoUpdateFound";
  v125[0] = @"CheckForAvailableUpdate";
  v123[0] = *v4;
  v124[0] = @"CheckingForAvailableUpdate";
  v123[1] = *v5;
  v124[1] = @"CheckForAvailableUpdate";
  id v41 = (id)[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:2];
  v126[0] = v41;
  v125[1] = @"RefreshScanResults";
  v121[0] = *v4;
  v122[0] = @"RefreshingScanResults";
  v121[1] = *v5;
  v122[1] = @"RefreshScanResults";
  id v40 = (id)[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:2];
  v126[1] = v40;
  v125[2] = @"PerformThirdPartyScan";
  uint64_t v119 = *v4;
  v120 = @"PerformingThirdPartyScan";
  id v39 = (id)[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  v126[2] = v39;
  v125[3] = @"UpdatesAvailable";
  v117[0] = *v4;
  v118[0] = @"UpdatesAvailable";
  v117[1] = *v5;
  v118[1] = @"ReportUpdatesAvailable";
  id v38 = (id)[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];
  v126[3] = v38;
  v125[4] = @"NoUpdateAvailable";
  v115[0] = *v4;
  v116[0] = @"NoUpdateFound";
  v115[1] = *v5;
  v116[1] = @"ReportNoUpdateFound";
  id v37 = (id)[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
  v126[4] = v37;
  v125[5] = @"CheckingForUpdatesFailed";
  v113[0] = *v4;
  v114[0] = @"ScanFailed";
  v113[1] = *v5;
  v114[1] = @"ReportScanFailed";
  id v36 = (id)[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:2];
  v126[5] = v36;
  id v35 = (id)[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:6];
  v152[2] = v35;
  v151[3] = @"UpdatesAvailable";
  v111[0] = @"CheckForAvailableUpdate";
  v109[0] = *v4;
  v110[0] = @"CheckingForAvailableUpdate";
  v109[1] = *v5;
  v110[1] = @"CheckForAvailableUpdate";
  id v34 = (id)[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
  v112[0] = v34;
  v111[1] = @"RefreshScanResults";
  v107[0] = *v4;
  v108[0] = @"RefreshingScanResults";
  v107[1] = *v5;
  v108[1] = @"RefreshScanResults";
  id v33 = (id)[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:2];
  v112[1] = v33;
  v111[2] = @"PerformThirdPartyScan";
  uint64_t v105 = *v4;
  v106 = @"PerformingThirdPartyScan";
  id v32 = (id)[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
  v112[2] = v32;
  v111[3] = @"UpdatesAvailable";
  v103[0] = *v4;
  v104[0] = @"UpdatesAvailable";
  v103[1] = *v5;
  v104[1] = @"ReportUpdatesAvailable";
  id v31 = (id)[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
  v112[3] = v31;
  v111[4] = @"NoUpdateAvailable";
  v101[0] = *v4;
  v102[0] = @"NoUpdateFound";
  v101[1] = *v5;
  v102[1] = @"ReportNoUpdateFound";
  id v30 = (id)[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
  v112[4] = v30;
  v111[5] = @"CheckingForUpdatesFailed";
  v99[0] = *v4;
  v100[0] = @"ScanFailed";
  v99[1] = *v5;
  v100[1] = @"ReportScanFailed";
  id v29 = (id)[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];
  v112[5] = v29;
  id v28 = (id)[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:6];
  v152[3] = v28;
  v151[4] = @"ScanFailed";
  v97[0] = @"CheckForAvailableUpdate";
  v95[0] = *v4;
  v96[0] = @"CheckingForAvailableUpdate";
  v95[1] = *v5;
  v96[1] = @"CheckForAvailableUpdate";
  id v27 = (id)[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];
  v98[0] = v27;
  v97[1] = @"RefreshScanResults";
  v93[0] = *v4;
  v94[0] = @"RefreshingScanResults";
  v93[1] = *v5;
  v94[1] = @"RefreshScanResults";
  id v26 = (id)[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
  v98[1] = v26;
  v97[2] = @"PerformThirdPartyScan";
  uint64_t v91 = *v4;
  v92 = @"PerformingThirdPartyScan";
  id v25 = (id)[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
  v98[2] = v25;
  v97[3] = @"UpdatesAvailable";
  v89[0] = *v4;
  v90[0] = @"UpdatesAvailable";
  v89[1] = *v5;
  v90[1] = @"ReportUpdatesAvailable";
  id v24 = (id)[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  v98[3] = v24;
  v97[4] = @"NoUpdateAvailable";
  v87[0] = *v4;
  v88[0] = @"NoUpdateFound";
  v87[1] = *v5;
  v88[1] = @"ReportNoUpdateFound";
  id v23 = (id)[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  v98[4] = v23;
  v97[5] = @"CheckingForUpdatesFailed";
  v85[0] = *v4;
  v86[0] = @"ScanFailed";
  v85[1] = *v5;
  v86[1] = @"ReportScanFailed";
  id v22 = (id)[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
  v98[5] = v22;
  id v21 = (id)[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:6];
  v152[4] = v21;
  v151[5] = @"PerformingThirdPartyScan";
  v83[0] = @"CheckForAvailableUpdate";
  v81[0] = *v4;
  v82[0] = @"CheckingForAvailableUpdate";
  v81[1] = *v5;
  v82[1] = @"CheckForAvailableUpdate";
  id v20 = (id)[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
  v84[0] = v20;
  v83[1] = @"RefreshScanResults";
  v79[0] = *v4;
  v80[0] = @"RefreshingScanResults";
  v79[1] = *v5;
  v80[1] = @"RefreshScanResults";
  id v19 = (id)[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
  v84[1] = v19;
  v83[2] = @"UpdatesAvailable";
  v77[0] = *v4;
  v78[0] = @"UpdatesAvailable";
  v77[1] = *v5;
  v78[1] = @"ReportUpdatesAvailable";
  id v18 = (id)[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
  v84[2] = v18;
  v83[3] = @"NoUpdateAvailable";
  v75[0] = *v4;
  v76[0] = @"NoUpdateFound";
  v75[1] = *v5;
  v76[1] = @"ReportNoUpdateFound";
  id v17 = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
  v84[3] = v17;
  v83[4] = @"CheckingForUpdatesFailed";
  v73[0] = *v4;
  v74[0] = @"ScanFailed";
  v73[1] = *v5;
  v74[1] = @"ReportScanFailed";
  id v16 = (id)[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
  v84[4] = v16;
  v83[5] = @"PerformThirdPartyScan";
  uint64_t v71 = *v5;
  uint64_t v72 = *v6;
  id v15 = (id)[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v84[5] = v15;
  id v14 = (id)[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:6];
  v152[5] = v14;
  v151[6] = @"RefreshingScanResults";
  v69[0] = @"CheckForAvailableUpdate";
  v67[0] = *v4;
  v68[0] = @"CheckingForAvailableUpdate";
  v67[1] = *v5;
  v68[1] = @"CheckForAvailableUpdate";
  id v13 = (id)[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  v70[0] = v13;
  v69[1] = @"UpdatesAvailable";
  v65[0] = *v4;
  v66[0] = @"UpdatesAvailable";
  v65[1] = *v5;
  v66[1] = @"ReportRefreshScanResults";
  id v12 = (id)[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
  v70[1] = v12;
  v69[2] = @"NoUpdateAvailable";
  v63[0] = *v4;
  v64[0] = @"NoUpdateFound";
  v63[1] = *v5;
  v64[1] = @"ReportRefreshScanResults";
  id v11 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  v70[2] = v11;
  v69[3] = @"PerformThirdPartyScan";
  v61[0] = *v4;
  v62[0] = @"PerformingThirdPartyScan";
  v61[1] = *v5;
  v62[1] = @"ThirdPartyScanDuringRefresh";
  id v10 = (id)[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  v70[3] = v10;
  v69[4] = @"RefreshScanResultsFailed";
  uint64_t v59 = *v5;
  v60 = @"ReportRefreshScanResultsFailed";
  id v9 = (id)[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  v70[4] = v9;
  v69[5] = @"RefreshScanResults";
  uint64_t v57 = *v5;
  uint64_t v58 = *v6;
  id v8 = (id)[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v70[5] = v8;
  id v7 = (id)[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:6];
  v152[6] = v7;
  v56[0] = (id)[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:7];

  id v2 = objc_alloc(NSDictionary);
  id v55 = (id)[v2 initWithDictionary:v56[0] copyItems:1];
  id v54 = v55;
  objc_storeStrong(&v55, 0);
  objc_storeStrong(v56, 0);
  return v54;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = 0;
  objc_storeStrong(&v28, a6);
  id v27 = 0;
  objc_storeStrong(&v27, a7);
  id v26 = a8;
  id v16 = [(SUSettingsStatefulUIManager *)v32 managerFSM];
  id v15 = (id)[(SUCoreFSM *)v16 extendedStateQueue];
  dispatch_assert_queue_V2(v15);

  if (v27)
  {
    id v25 = [(SUSettingsStatefulUIManager *)v32 convertFSMStateToUIState:v27];
    if (v25 != (void *)0x7FFFFFFFFFFFFFFFLL
      && (void *)[(SUSettingsStatefulUIManager *)v32 currentState] != v25)
    {
      id v24 = [(SUSettingsStatefulUIManager *)v32 currentState];
      [(SUSettingsStatefulUIManager *)v32 setCurrentState:v25];
      id v9 = v32;
      uint64_t v18 = MEMORY[0x263EF8330];
      int v19 = -1073741824;
      int v20 = 0;
      id v21 = __86__SUSettingsStatefulUIManager_performAction_onEvent_inState_withInfo_nextState_error___block_invoke;
      id v22 = &unk_26483BA68;
      v23[0] = v32;
      v23[1] = v24;
      v23[2] = v25;
      [(SUSettingsStatefulUIManager *)v9 executeOperationOnDelegate:sel_statefulUIManager_didTransitionFromUIState_toState_ usingBlock:&v18];
      objc_storeStrong(v23, 0);
    }
  }
  if ([location[0] isEqualToString:*MEMORY[0x263F78148]])
  {
    int64_t v17 = 0;
  }
  else if ([location[0] isEqualToString:@"CheckForAvailableUpdate"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_CheckForAvailableUpdate:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ReportScanFailed"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ReportScanFailed:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ReportUpdatesAvailable"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ReportUpdatesAvailable:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ReportNoUpdateFound"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ReportNoUpdateFound:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"RefreshScanResults"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_RefreshScanResults:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ReportRefreshScanResults"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ReportRefreshScanResults:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ReportRefreshScanResultsFailed"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ReportRefreshScanResultsFailed:v28 error:v26];
  }
  else if ([location[0] isEqualToString:@"ThirdPartyScanDuringRefresh"])
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 action_ThirdPartyScanDuringRefresh:v28 error:v26];
  }
  else
  {
    int64_t v17 = [(SUSettingsStatefulUIManager *)v32 actionUnknownAction:location[0] error:v26];
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v17;
}

void __86__SUSettingsStatefulUIManager_performAction_onEvent_inState_withInfo_nextState_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didTransitionFromUIState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48)];
}

- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4
{
  v161 = a4;
  v162 = "-[SUSettingsStatefulUIManager action_CheckForAvailableUpdate:error:]";
  uint64_t v209 = *MEMORY[0x263EF8340];
  id v205 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[3] = v161;
  id v160 = (id)[*((id *)v205 + 27) extendedStateQueue];
  id v159 = v160;
  dispatch_assert_queue_V2((dispatch_queue_t)v159);

  id obj = v205;
  objc_sync_enter(obj);
  id v158 = (id)[v205 currentRefreshScanOperation];
  id v4 = v158;
  BOOL v156 = v4 == 0;

  if (!v156)
  {
    id v155 = (id)[v205 log];
    id v153 = v155;
    id v154 = (id)[v153 oslog];
    oslog[0] = (os_log_t)v154;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog[0];
      *(_DWORD *)v151 = type;
      uint64_t v152 = [v205 currentState];
      id v149 = SUSettingsUIStateToString(v152);
      id v146 = v149;
      id v147 = v146;
      id v201 = v147;
      uint64_t v148 = [v205 currentState];
      char v199 = 0;
      char v197 = 0;
      id v145 = (id)[v205 delegate];
      id v144 = v145;
      if (v144)
      {
        id v143 = (id)[v205 delegate];
        id v200 = v143;
        char v199 = 1;
        Class aClass = (Class)objc_opt_class();
        id v141 = NSStringFromClass(aClass);
        id v198 = v141;
        char v197 = 1;
        v140 = (__CFString *)v198;
      }
      else
      {
        v140 = @"(null)";
      }
      v138 = v140;
      id v139 = (id)[v205 delegate];
      id v136 = v139;
      id v137 = (id)[v205 scanError];
      id v134 = v137;
      id v135 = (id)[v205 preferredStatefulDescriptor];
      id v132 = v135;
      id v133 = (id)[v205 alternateStatefulDescriptor];
      id v130 = v133;
      char v195 = 0;
      char v193 = 0;
      char v191 = 0;
      id v131 = (id)[v205 currentDownload];
      id v129 = v131;
      if (v129)
      {
        id v128 = (id)[v205 currentDownload];
        id v196 = v128;
        char v195 = 1;
        id v127 = (id)[v196 descriptor];
        id v194 = v127;
        char v193 = 1;
        id v126 = (id)[v194 humanReadableUpdateName];
        id v192 = v126;
        char v191 = 1;
        v125 = (__CFString *)v192;
      }
      else
      {
        v125 = @"(null)";
      }
      v123 = v125;
      id v124 = (id)[v205 currentDownload];
      id v121 = v124;
      int v122 = [v205 performThirdPartyScan];
      v5 = "YES";
      if ((v122 & 1) == 0) {
        v5 = "NO";
      }
      uint64_t v119 = v5;
      int v120 = [v205 isTargetedUpdateScheduledForAutoInstall];
      v6 = "YES";
      if ((v120 & 1) == 0) {
        v6 = "NO";
      }
      v117 = v6;
      int v118 = [v205 hidingPreferredDescriptor];
      id v7 = "YES";
      if ((v118 & 1) == 0) {
        id v7 = "NO";
      }
      v115 = v7;
      id v116 = (id)[*((id *)v205 + 32) humanReadableUpdateName];
      id v112 = v116;
      id v113 = v112;
      id v190 = v113;
      int v114 = [v205 hidingAlternateDescriptor];
      id v8 = "YES";
      if ((v114 & 1) == 0) {
        id v8 = "NO";
      }
      v110 = v8;
      id v111 = (id)[*((id *)v205 + 33) humanReadableUpdateName];
      id v107 = v111;
      id v108 = v107;
      id v189 = v108;
      char v187 = 0;
      id v109 = (id)[v205 enrolledBetaProgram];
      id v106 = v109;
      if (v106)
      {
        id v105 = (id)[v205 enrolledBetaProgram];
        id v188 = v105;
        char v187 = 1;
        uint64_t v104 = [v188 programID];
        uint64_t v103 = v104;
      }
      else
      {
        uint64_t v103 = 0;
      }
      uint64_t v101 = v103;
      id v102 = (id)[v205 betaPrograms];
      id v99 = v102;
      uint64_t v100 = [v99 count];
      id v98 = (id)[v205 currentFullScanOperation];
      id v96 = v98;
      id v97 = (id)[v205 currentRefreshScanOperation];
      id v94 = v97;
      id v95 = (id)[v205 currentUpdateOperation];
      id v92 = v95;
      id v93 = (id)[v205 auxiliaryOperations];
      id v90 = v93;
      uint64_t v91 = [v90 count];
      v88 = v15;
      buf = v208;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v208, (uint64_t)v162, (uint64_t)v147, v148, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, (uint64_t)v123, (uint64_t)v121, (uint64_t)v119, (uint64_t)v117, (uint64_t)v115, (uint64_t)v113, (uint64_t)v110, (uint64_t)v108, v103, v100,
        (uint64_t)v96,
        (uint64_t)v94,
        (uint64_t)v92,
        v91);
      _os_log_impl(&dword_228401000, log, v151[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if (v187) {
      if (v191)
      }

      if (v193) {
      if (v195)
      }

      if (v197) {
      if (v199)
      }

      objc_storeStrong(&v189, 0);
      objc_storeStrong(&v190, 0);
      objc_storeStrong(&v201, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    id v87 = (id)*((void *)v205 + 24);
    v86 = &v181;
    uint64_t v181 = MEMORY[0x263EF8330];
    int v182 = -1073741824;
    int v183 = 0;
    v184 = __68__SUSettingsStatefulUIManager_action_CheckForAvailableUpdate_error___block_invoke;
    v185 = &unk_26483BA90;
    v85 = &v186;
    id v186 = v205;
    [v87 cancel:v86];
    objc_storeStrong(v85, 0);
  }
  id v84 = (id)[v205 currentFullScanOperation];
  id v9 = v84;
  BOOL v83 = v9 == 0;

  if (v83)
  {
    int v163 = 0;
  }
  else
  {
    id v82 = (id)[v205 log];
    id v80 = v82;
    id v81 = (id)[v80 oslog];
    os_log_t v180 = (os_log_t)v81;

    os_log_type_t v179 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v77 = v180;
      *(_DWORD *)v78 = v179;
      uint64_t v79 = [v205 currentState];
      id v76 = SUSettingsUIStateToString(v79);
      id v73 = v76;
      id v74 = v73;
      id v178 = v74;
      uint64_t v75 = [v205 currentState];
      char v176 = 0;
      char v174 = 0;
      id v72 = (id)[v205 delegate];
      id v71 = v72;
      if (v71)
      {
        id v70 = (id)[v205 delegate];
        id v177 = v70;
        char v176 = 1;
        Class v69 = (Class)objc_opt_class();
        id v68 = NSStringFromClass(v69);
        id v175 = v68;
        char v174 = 1;
        v67 = (__CFString *)v175;
      }
      else
      {
        v67 = @"(null)";
      }
      v65 = v67;
      id v66 = (id)[v205 delegate];
      id v63 = v66;
      id v64 = (id)[v205 scanError];
      id v61 = v64;
      id v62 = (id)[v205 preferredStatefulDescriptor];
      id v59 = v62;
      id v60 = (id)[v205 alternateStatefulDescriptor];
      id v57 = v60;
      char v172 = 0;
      char v170 = 0;
      char v168 = 0;
      id v58 = (id)[v205 currentDownload];
      id v56 = v58;
      if (v56)
      {
        id v55 = (id)[v205 currentDownload];
        id v173 = v55;
        char v172 = 1;
        id v54 = (id)[v173 descriptor];
        id v171 = v54;
        char v170 = 1;
        id v53 = (id)[v171 humanReadableUpdateName];
        id v169 = v53;
        char v168 = 1;
        id v52 = (__CFString *)v169;
      }
      else
      {
        id v52 = @"(null)";
      }
      id v50 = v52;
      id v51 = (id)[v205 currentDownload];
      id v48 = v51;
      int v49 = [v205 performThirdPartyScan];
      id v10 = "YES";
      if ((v49 & 1) == 0) {
        id v10 = "NO";
      }
      id v46 = v10;
      int v47 = [v205 isTargetedUpdateScheduledForAutoInstall];
      id v11 = "YES";
      if ((v47 & 1) == 0) {
        id v11 = "NO";
      }
      id v44 = v11;
      int v45 = [v205 hidingPreferredDescriptor];
      id v12 = "YES";
      if ((v45 & 1) == 0) {
        id v12 = "NO";
      }
      id v42 = v12;
      id v43 = (id)[*((id *)v205 + 32) humanReadableUpdateName];
      id v39 = v43;
      id v40 = v39;
      id v167 = v40;
      int v41 = [v205 hidingAlternateDescriptor];
      id v13 = "YES";
      if ((v41 & 1) == 0) {
        id v13 = "NO";
      }
      id v37 = v13;
      id v38 = (id)[*((id *)v205 + 33) humanReadableUpdateName];
      id v34 = v38;
      id v35 = v34;
      id v166 = v35;
      char v164 = 0;
      id v36 = (id)[v205 enrolledBetaProgram];
      id v33 = v36;
      if (v33)
      {
        id v32 = (id)[v205 enrolledBetaProgram];
        id v165 = v32;
        char v164 = 1;
        uint64_t v31 = [v165 programID];
        uint64_t v30 = v31;
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v28 = v30;
      id v29 = (id)[v205 betaPrograms];
      id v26 = v29;
      uint64_t v27 = [v26 count];
      id v25 = (id)[v205 currentFullScanOperation];
      id v23 = v25;
      id v24 = (id)[v205 currentRefreshScanOperation];
      id v21 = v24;
      id v22 = (id)[v205 currentUpdateOperation];
      id v19 = v22;
      id v20 = (id)[v205 auxiliaryOperations];
      id v17 = v20;
      uint64_t v18 = [v17 count];
      v15[17] = (_Unwind_Exception *)v15;
      id v16 = v207;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v207, (uint64_t)v162, (uint64_t)v74, v75, (uint64_t)v65, (uint64_t)v63, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v50, (uint64_t)v48, (uint64_t)v46, (uint64_t)v44, (uint64_t)v42, (uint64_t)v40, (uint64_t)v37, (uint64_t)v35, v28, v27,
        (uint64_t)v23,
        (uint64_t)v21,
        (uint64_t)v19,
        v18);
      _os_log_impl(&dword_228401000, v77, v78[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v16,
        0xDEu);

      if (v164) {
      if (v168)
      }

      if (v170) {
      if (v172)
      }

      if (v174) {
      if (v176)
      }

      objc_storeStrong(&v166, 0);
      objc_storeStrong(&v167, 0);
      objc_storeStrong(&v178, 0);
    }
    objc_storeStrong((id *)&v180, 0);
    int64_t v206 = 0;
    int v163 = 1;
  }
  objc_sync_exit(obj);

  if (!v163)
  {
    [v205 performFullScan:location[0]];
    int64_t v206 = 0;
    int v163 = 1;
  }
  objc_storeStrong(location, 0);
  return v206;
}

uint64_t __68__SUSettingsStatefulUIManager_action_CheckForAvailableUpdate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

- (int64_t)action_ReportUpdatesAvailable:(id)a3 error:(id *)a4
{
  id v82 = a4;
  id v81 = "-[SUSettingsStatefulUIManager action_ReportUpdatesAvailable:error:]";
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v110 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v82;
  id v83 = (id)[*((id *)v110 + 27) extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v83);

  id v80 = (id)[v110 log];
  oslog[0] = (os_log_t)(id)[v80 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v75 = type;
    id v76 = SUSettingsUIStateToString([v110 currentState]);
    id v77 = v76;
    id v106 = v77;
    uint64_t v78 = [v110 currentState];
    id v79 = (id)[v110 delegate];
    char v104 = 0;
    char v102 = 0;
    if (v79)
    {
      id v105 = (id)[v110 delegate];
      int v72 = 1;
      char v104 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v103 = NSStringFromClass(v4);
      char v102 = 1;
      id v73 = (__CFString *)v103;
    }
    else
    {
      id v73 = @"(null)";
    }
    id v66 = v73;
    id v67 = (id)[v110 delegate];
    id v68 = (id)[v110 scanError];
    id v69 = (id)[v110 preferredStatefulDescriptor];
    id v70 = (id)[v110 alternateStatefulDescriptor];
    id v71 = (id)[v110 currentDownload];
    char v100 = 0;
    char v98 = 0;
    char v96 = 0;
    if (v71)
    {
      id v101 = (id)[v110 currentDownload];
      int v64 = 1;
      char v100 = 1;
      id v99 = (id)[v101 descriptor];
      char v98 = 1;
      id v97 = (id)[v99 humanReadableUpdateName];
      char v96 = 1;
      v65 = (__CFString *)v97;
    }
    else
    {
      v65 = @"(null)";
    }
    id v50 = v65;
    id v51 = (id)[v110 currentDownload];
    char v5 = [v110 performThirdPartyScan];
    id v57 = "NO";
    v6 = "YES";
    id v58 = "YES";
    int v62 = 1;
    if ((v5 & 1) == 0) {
      v6 = "NO";
    }
    id v52 = v6;
    char v7 = [v110 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v58;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v57;
    }
    uint64_t v53 = v8;
    char v9 = [v110 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v58;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v57;
    }
    uint64_t v54 = v10;
    id v55 = (id)[*((id *)v110 + 32) humanReadableUpdateName];
    id v56 = v55;
    id v95 = v56;
    char v11 = [v110 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v58;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v57;
    }
    uint64_t v59 = v12;
    id v60 = (id)[*((id *)v110 + 33) humanReadableUpdateName];
    id v61 = v60;
    id v94 = v61;
    id v63 = (id)[v110 enrolledBetaProgram];
    char v92 = 0;
    if (v63)
    {
      id v93 = (id)[v110 enrolledBetaProgram];
      char v92 = 1;
      uint64_t v49 = [v93 programID];
    }
    else
    {
      uint64_t v49 = 0;
    }
    uint64_t v27 = v49;
    id v48 = (id)[v110 betaPrograms];
    uint64_t v28 = [v48 count];
    id v47 = (id)[v110 currentFullScanOperation];
    id v46 = (id)[v110 currentRefreshScanOperation];
    id v45 = (id)[v110 currentUpdateOperation];
    id v44 = (id)[v110 auxiliaryOperations];
    uint64_t v29 = [v44 count];
    id v43 = (id)[location[0] fullScanResults];
    id v42 = (id)[v43 preferredDescriptor];
    id v41 = (id)[v42 humanReadableUpdateName];
    id v30 = v41;
    id v91 = v30;
    id v40 = (id)[location[0] fullScanResults];
    id v39 = (id)[v40 preferredDescriptor];
    id v38 = (id)[location[0] fullScanResults];
    id v37 = (id)[v38 alternateDescriptor];
    id v36 = (id)[v37 humanReadableUpdateName];
    id v31 = v36;
    id v90 = v31;
    id v35 = (id)[location[0] fullScanResults];
    id v34 = (id)[v35 alternateDescriptor];
    id v32 = &v15;
    buf = v111;
    __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66_8_0((uint64_t)v111, (uint64_t)v81, (uint64_t)v77, v78, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, v53, v54, (uint64_t)v56, v59, (uint64_t)v61, v49, v28,
      (uint64_t)v47,
      (uint64_t)v46,
      (uint64_t)v45,
      v29,
      (uint64_t)v30,
      (uint64_t)v39,
      (uint64_t)v31,
      (uint64_t)v34);
    _os_log_impl(&dword_228401000, log, v75[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Reporting on available updates:\n"
      "\tPreferred update: %{public}@ (%p)\n"
      "\tAlternate update: %{public}@ (%p)",
      buf,
      0x106u);

    if (v92) {
    if (v96)
    }

    if (v98) {
    if (v100)
    }

    if (v102) {
    if (v104)
    }

    id obj = 0;
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, obj);
    objc_storeStrong(&v94, obj);
    objc_storeStrong(&v95, obj);
    objc_storeStrong(&v106, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  id WeakRetained = objc_loadWeakRetained((id *)v110 + 4);
  BOOL v25 = WeakRetained == 0;

  if (!v25)
  {
    id v23 = objc_loadWeakRetained((id *)v110 + 4);
    int v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v19 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v19 selectDelegateCallbackQueue:*((void *)v110 + 5)];
      dispatch_block_t block = &v84;
      uint64_t v84 = MEMORY[0x263EF8330];
      int v85 = -1073741824;
      int v86 = 0;
      id v87 = __67__SUSettingsStatefulUIManager_action_ReportUpdatesAvailable_error___block_invoke;
      v88 = &unk_26483BAB8;
      id v21 = (id *)v89;
      v89[0] = v110;
      id v20 = (id *)((char *)block + 40);
      v89[1] = location[0];
      dispatch_async(queue, block);

      id v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  id v16 = 0;
  objc_storeStrong((id *)v110 + 23, 0);
  objc_storeStrong((id *)v110 + 24, v16);
  [v110 setPerformThirdPartyScan:0];
  objc_storeStrong(location, v16);
  return 0;
}

void __67__SUSettingsStatefulUIManager_action_ReportUpdatesAvailable_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) fullScanResults];
  objc_msgSend(WeakRetained, "statefulUIManager:didFinishScanningForUpdatesWithResults:", v2);
}

- (int64_t)action_ReportNoUpdateFound:(id)a3 error:(id *)a4
{
  id v69 = a4;
  id v68 = "-[SUSettingsStatefulUIManager action_ReportNoUpdateFound:error:]";
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v69;
  id v70 = (id)[*((id *)v95 + 27) extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v70);

  id v67 = (id)[v95 log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v62 = type;
    id v63 = SUSettingsUIStateToString([v95 currentState]);
    id v64 = v63;
    id v91 = v64;
    uint64_t v65 = [v95 currentState];
    id v66 = (id)[v95 delegate];
    char v89 = 0;
    char v87 = 0;
    if (v66)
    {
      id v90 = (id)[v95 delegate];
      int v59 = 1;
      char v89 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v88 = NSStringFromClass(v4);
      char v87 = 1;
      id v60 = (__CFString *)v88;
    }
    else
    {
      id v60 = @"(null)";
    }
    uint64_t v53 = v60;
    id v54 = (id)[v95 delegate];
    id v55 = (id)[v95 scanError];
    id v56 = (id)[v95 preferredStatefulDescriptor];
    id v57 = (id)[v95 alternateStatefulDescriptor];
    id v58 = (id)[v95 currentDownload];
    char v85 = 0;
    char v83 = 0;
    char v81 = 0;
    if (v58)
    {
      id v86 = (id)[v95 currentDownload];
      int v51 = 1;
      char v85 = 1;
      id v84 = (id)[v86 descriptor];
      char v83 = 1;
      id v82 = (id)[v84 humanReadableUpdateName];
      char v81 = 1;
      id v52 = (__CFString *)v82;
    }
    else
    {
      id v52 = @"(null)";
    }
    id v37 = v52;
    id v38 = (id)[v95 currentDownload];
    char v5 = [v95 performThirdPartyScan];
    id v44 = "NO";
    v6 = "YES";
    id v45 = "YES";
    int v49 = 1;
    if ((v5 & 1) == 0) {
      v6 = "NO";
    }
    id v39 = v6;
    char v7 = [v95 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v40 = v8;
    char v9 = [v95 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v41 = v10;
    id v42 = (id)[*((id *)v95 + 32) humanReadableUpdateName];
    id v43 = v42;
    id v80 = v43;
    char v11 = [v95 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v45;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v44;
    }
    uint64_t v46 = v12;
    id v47 = (id)[*((id *)v95 + 33) humanReadableUpdateName];
    id v48 = v47;
    id v79 = v48;
    id v50 = (id)[v95 enrolledBetaProgram];
    char v77 = 0;
    if (v50)
    {
      id v78 = (id)[v95 enrolledBetaProgram];
      char v77 = 1;
      uint64_t v36 = [v78 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[v95 betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[v95 currentFullScanOperation];
    id v33 = (id)[v95 currentRefreshScanOperation];
    id v32 = (id)[v95 currentUpdateOperation];
    id v31 = (id)[v95 auxiliaryOperations];
    uint64_t v29 = &v15;
    buf = v96;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v96, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      [v31 count]);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v77) {
    if (v81)
    }

    if (v83) {
    if (v85)
    }

    if (v87) {
    if (v89)
    }

    id obj = 0;
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, obj);
    objc_storeStrong(&v91, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  id WeakRetained = objc_loadWeakRetained((id *)v95 + 4);
  BOOL v25 = WeakRetained == 0;

  if (!v25)
  {
    id v23 = objc_loadWeakRetained((id *)v95 + 4);
    int v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v19 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v19 selectDelegateCallbackQueue:*((void *)v95 + 5)];
      dispatch_block_t block = &v71;
      uint64_t v71 = MEMORY[0x263EF8330];
      int v72 = -1073741824;
      int v73 = 0;
      id v74 = __64__SUSettingsStatefulUIManager_action_ReportNoUpdateFound_error___block_invoke;
      uint64_t v75 = &unk_26483BAB8;
      id v21 = (id *)v76;
      v76[0] = v95;
      id v20 = (id *)((char *)block + 40);
      v76[1] = location[0];
      dispatch_async(queue, block);

      id v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  id v16 = 0;
  objc_storeStrong((id *)v95 + 23, 0);
  objc_storeStrong((id *)v95 + 24, v16);
  [v95 setPerformThirdPartyScan:0];
  objc_storeStrong(location, v16);
  return 0;
}

void __64__SUSettingsStatefulUIManager_action_ReportNoUpdateFound_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) fullScanResults];
  objc_msgSend(WeakRetained, "statefulUIManager:didFinishScanningForUpdatesWithResults:", v2);
}

- (int64_t)action_ReportScanFailed:(id)a3 error:(id *)a4
{
  id v69 = a4;
  id v68 = "-[SUSettingsStatefulUIManager action_ReportScanFailed:error:]";
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v69;
  id v70 = (id)[*((id *)v95 + 27) extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v70);

  id v67 = (id)[v95 log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v62 = type;
    id v63 = SUSettingsUIStateToString([v95 currentState]);
    id v64 = v63;
    id v91 = v64;
    uint64_t v65 = [v95 currentState];
    id v66 = (id)[v95 delegate];
    char v89 = 0;
    char v87 = 0;
    if (v66)
    {
      id v90 = (id)[v95 delegate];
      int v59 = 1;
      char v89 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v88 = NSStringFromClass(v4);
      char v87 = 1;
      id v60 = (__CFString *)v88;
    }
    else
    {
      id v60 = @"(null)";
    }
    uint64_t v53 = v60;
    id v54 = (id)[v95 delegate];
    id v55 = (id)[v95 scanError];
    id v56 = (id)[v95 preferredStatefulDescriptor];
    id v57 = (id)[v95 alternateStatefulDescriptor];
    id v58 = (id)[v95 currentDownload];
    char v85 = 0;
    char v83 = 0;
    char v81 = 0;
    if (v58)
    {
      id v86 = (id)[v95 currentDownload];
      int v51 = 1;
      char v85 = 1;
      id v84 = (id)[v86 descriptor];
      char v83 = 1;
      id v82 = (id)[v84 humanReadableUpdateName];
      char v81 = 1;
      id v52 = (__CFString *)v82;
    }
    else
    {
      id v52 = @"(null)";
    }
    id v37 = v52;
    id v38 = (id)[v95 currentDownload];
    char v5 = [v95 performThirdPartyScan];
    id v44 = "NO";
    v6 = "YES";
    id v45 = "YES";
    int v49 = 1;
    if ((v5 & 1) == 0) {
      v6 = "NO";
    }
    id v39 = v6;
    char v7 = [v95 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v40 = v8;
    char v9 = [v95 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v41 = v10;
    id v42 = (id)[*((id *)v95 + 32) humanReadableUpdateName];
    id v43 = v42;
    id v80 = v43;
    char v11 = [v95 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v45;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v44;
    }
    uint64_t v46 = v12;
    id v47 = (id)[*((id *)v95 + 33) humanReadableUpdateName];
    id v48 = v47;
    id v79 = v48;
    id v50 = (id)[v95 enrolledBetaProgram];
    char v77 = 0;
    if (v50)
    {
      id v78 = (id)[v95 enrolledBetaProgram];
      char v77 = 1;
      uint64_t v36 = [v78 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[v95 betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[v95 currentFullScanOperation];
    id v33 = (id)[v95 currentRefreshScanOperation];
    id v32 = (id)[v95 currentUpdateOperation];
    id v31 = (id)[v95 auxiliaryOperations];
    uint64_t v29 = &v15;
    buf = v96;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v96, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      [v31 count]);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v77) {
    if (v81)
    }

    if (v83) {
    if (v85)
    }

    if (v87) {
    if (v89)
    }

    id obj = 0;
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, obj);
    objc_storeStrong(&v91, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  id WeakRetained = objc_loadWeakRetained((id *)v95 + 4);
  BOOL v25 = WeakRetained == 0;

  if (!v25)
  {
    id v23 = objc_loadWeakRetained((id *)v95 + 4);
    int v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v19 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v19 selectDelegateCallbackQueue:*((void *)v95 + 5)];
      dispatch_block_t block = &v71;
      uint64_t v71 = MEMORY[0x263EF8330];
      int v72 = -1073741824;
      int v73 = 0;
      id v74 = __61__SUSettingsStatefulUIManager_action_ReportScanFailed_error___block_invoke;
      uint64_t v75 = &unk_26483BAB8;
      id v21 = (id *)v76;
      v76[0] = v95;
      id v20 = (id *)((char *)block + 40);
      v76[1] = location[0];
      dispatch_async(queue, block);

      id v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  id v16 = 0;
  objc_storeStrong((id *)v95 + 23, 0);
  objc_storeStrong((id *)v95 + 24, v16);
  [v95 setPerformThirdPartyScan:0];
  objc_storeStrong(location, v16);
  return 0;
}

void __61__SUSettingsStatefulUIManager_action_ReportScanFailed_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) error];
  objc_msgSend(WeakRetained, "statefulUIManager:didFailToScanForUpdatesWithError:", v2);
}

- (int64_t)action_RefreshScanResults:(id)a3 error:(id *)a4
{
  char v174 = &v194;
  id v175 = a4;
  char v176 = "-[SUSettingsStatefulUIManager action_RefreshScanResults:error:]";
  uint64_t v210 = *MEMORY[0x263EF8340];
  v207 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v205[1] = v175;
  id v173 = (id)[(SUCoreFSM *)v207->_managerFSM extendedStateQueue];
  id v172 = v173;
  dispatch_assert_queue_V2((dispatch_queue_t)v172);

  id obj = v207;
  objc_sync_enter(obj);
  if (v207->_currentRefreshScanOperation)
  {
    id v170 = (id)[*((id *)v174 + 21) log];
    id v168 = v170;
    id v169 = (id)[v168 oslog];
    id v4 = v169;
    id v5 = v168;
    *((void *)v174 + 17) = v4;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(*((os_log_t *)v174 + 17), OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)*((void *)v174 + 17);
      *(_DWORD *)id v166 = type;
      uint64_t v167 = [*((id *)v174 + 21) currentState];
      id v164 = SUSettingsUIStateToString(v167);
      id v161 = v164;
      id v6 = v161;
      char v7 = (id *)v174;
      uint64_t v162 = (uint64_t)v6;
      *((void *)v174 + 14) = v6;
      uint64_t v163 = [v7[21] currentState];
      uint64_t v8 = (void *)*((void *)v174 + 21);
      char v202 = 0;
      char v201 = 0;
      id v160 = (id)[v8 delegate];
      id v159 = v160;
      if (v159)
      {
        id v158 = (id)[*((id *)v174 + 21) delegate];
        *((void *)v174 + 13) = v158;
        char v202 = 1;
        Class aClass = (Class)objc_opt_class();
        id v156 = NSStringFromClass(aClass);
        char v9 = (__CFString *)v156;
        *((void *)v174 + 11) = v9;
        char v201 = 1;
        id v155 = v9;
      }
      else
      {
        id v155 = @"(null)";
      }
      id v153 = v155;
      id v154 = (id)[*((id *)v174 + 21) delegate];
      id v151 = v154;
      id v152 = (id)[*((id *)v174 + 21) scanError];
      id v149 = v152;
      id v150 = (id)[*((id *)v174 + 21) preferredStatefulDescriptor];
      id v147 = v150;
      id v148 = (id)[*((id *)v174 + 21) alternateStatefulDescriptor];
      id v145 = v148;
      uint64_t v10 = (void *)*((void *)v174 + 21);
      char v200 = 0;
      char v199 = 0;
      char v198 = 0;
      id v146 = (id)[v10 currentDownload];
      id v144 = v146;
      if (v144)
      {
        id v143 = (id)[*((id *)v174 + 21) currentDownload];
        id v11 = v143;
        *((void *)v174 + 9) = v11;
        char v200 = 1;
        id v142 = (id)[v11 descriptor];
        id v12 = v142;
        *((void *)v174 + 7) = v12;
        char v199 = 1;
        id v141 = (id)[v12 humanReadableUpdateName];
        id v13 = (__CFString *)v141;
        *((void *)v174 + 5) = v13;
        char v198 = 1;
        v140 = v13;
      }
      else
      {
        v140 = @"(null)";
      }
      v138 = v140;
      id v139 = (id)[*((id *)v174 + 21) currentDownload];
      id v136 = v139;
      int v137 = [*((id *)v174 + 21) performThirdPartyScan];
      id v14 = "YES";
      if ((v137 & 1) == 0) {
        id v14 = "NO";
      }
      id v134 = v14;
      int v135 = [*((id *)v174 + 21) isTargetedUpdateScheduledForAutoInstall];
      uint64_t v15 = "YES";
      if ((v135 & 1) == 0) {
        uint64_t v15 = "NO";
      }
      id v132 = v15;
      int v133 = [*((id *)v174 + 21) hidingPreferredDescriptor];
      id v16 = "YES";
      if ((v133 & 1) == 0) {
        id v16 = "NO";
      }
      id v130 = v16;
      id v131 = (id)[*(id *)(*((void *)v174 + 21) + 256) humanReadableUpdateName];
      id v127 = v131;
      id v17 = v127;
      uint64_t v18 = (id *)v174;
      uint64_t v128 = (uint64_t)v17;
      *((void *)v174 + 3) = v17;
      int v129 = [v18[21] hidingAlternateDescriptor];
      id v19 = "YES";
      if ((v129 & 1) == 0) {
        id v19 = "NO";
      }
      v125 = v19;
      id v126 = (id)[*(id *)(*((void *)v174 + 21) + 264) humanReadableUpdateName];
      id v122 = v126;
      id v20 = v122;
      id v21 = v174;
      uint64_t v123 = (uint64_t)v20;
      *((void *)v174 + 2) = v20;
      id v22 = (void *)*((void *)v21 + 21);
      char v195 = 0;
      id v124 = (id)[v22 enrolledBetaProgram];
      id v121 = v124;
      if (v121)
      {
        id v120 = (id)[*((id *)v174 + 21) enrolledBetaProgram];
        id v23 = v120;
        *((void *)v174 + 1) = v23;
        char v195 = 1;
        uint64_t v119 = [v23 programID];
        uint64_t v118 = v119;
      }
      else
      {
        uint64_t v118 = 0;
      }
      uint64_t v116 = v118;
      id v117 = (id)[*((id *)v174 + 21) betaPrograms];
      id v114 = v117;
      uint64_t v115 = [v114 count];
      id v113 = (id)[*((id *)v174 + 21) currentFullScanOperation];
      id v111 = v113;
      id v112 = (id)[*((id *)v174 + 21) currentRefreshScanOperation];
      id v109 = v112;
      id v110 = (id)[*((id *)v174 + 21) currentUpdateOperation];
      id v107 = v110;
      id v108 = (id)[*((id *)v174 + 21) auxiliaryOperations];
      id v105 = v108;
      uint64_t v106 = [v105 count];
      id v103 = v35;
      buf = v209;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v209, (uint64_t)v176, v162, v163, (uint64_t)v153, (uint64_t)v151, (uint64_t)v149, (uint64_t)v147, (uint64_t)v145, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, v128, (uint64_t)v125, v123, v118, v115,
        (uint64_t)v111,
        (uint64_t)v109,
        (uint64_t)v107,
        v106);
      _os_log_impl(&dword_228401000, log, v166[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is already running. Skipping on this refresh request. This should never happen.",
        buf,
        0xDEu);

      if (v195) {
      if (v198)
      }

      if (v199) {
      if (v200)
      }

      if (v201) {
      if (v202)
      }

      objc_storeStrong(&v196, 0);
      objc_storeStrong(&v197, 0);
      objc_storeStrong(&v203, 0);
    }
    objc_storeStrong(v205, 0);
    int v24 = v174;
    *((void *)v174 + 22) = 0;
    *(_DWORD *)int v24 = 1;
  }
  else if (*(void *)(*((void *)v174 + 21) + 184))
  {
    id v102 = (id)[*((id *)v174 + 21) log];
    id v100 = v102;
    id v101 = (id)[v100 oslog];
    osos_log_t log = (os_log_t)v101;

    os_log_type_t v192 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v97 = oslog;
      *(_DWORD *)char v98 = v192;
      uint64_t v99 = [*((id *)v174 + 21) currentState];
      id v96 = SUSettingsUIStateToString(v99);
      id v93 = v96;
      id v94 = v93;
      id v191 = v94;
      uint64_t v95 = [*((id *)v174 + 21) currentState];
      BOOL v25 = (void *)*((void *)v174 + 21);
      char v189 = 0;
      char v187 = 0;
      id v92 = (id)[v25 delegate];
      id v91 = v92;
      if (v91)
      {
        id v90 = (id)[*((id *)v174 + 21) delegate];
        id v190 = v90;
        char v189 = 1;
        Class v89 = (Class)objc_opt_class();
        id v88 = NSStringFromClass(v89);
        id v188 = v88;
        char v187 = 1;
        char v87 = (__CFString *)v188;
      }
      else
      {
        char v87 = @"(null)";
      }
      char v85 = v87;
      id v86 = (id)[*((id *)v174 + 21) delegate];
      id v83 = v86;
      id v84 = (id)[*((id *)v174 + 21) scanError];
      id v81 = v84;
      id v82 = (id)[*((id *)v174 + 21) preferredStatefulDescriptor];
      id v79 = v82;
      id v80 = (id)[*((id *)v174 + 21) alternateStatefulDescriptor];
      id v77 = v80;
      id v26 = (void *)*((void *)v174 + 21);
      char v185 = 0;
      char v183 = 0;
      char v181 = 0;
      id v78 = (id)[v26 currentDownload];
      id v76 = v78;
      if (v76)
      {
        id v75 = (id)[*((id *)v174 + 21) currentDownload];
        id v186 = v75;
        char v185 = 1;
        id v74 = (id)[v186 descriptor];
        id v184 = v74;
        char v183 = 1;
        id v73 = (id)[v184 humanReadableUpdateName];
        id v182 = v73;
        char v181 = 1;
        int v72 = (__CFString *)v182;
      }
      else
      {
        int v72 = @"(null)";
      }
      id v70 = v72;
      id v71 = (id)[*((id *)v174 + 21) currentDownload];
      id v68 = v71;
      int v69 = [*((id *)v174 + 21) performThirdPartyScan];
      uint64_t v27 = "YES";
      if ((v69 & 1) == 0) {
        uint64_t v27 = "NO";
      }
      id v66 = v27;
      int v67 = [*((id *)v174 + 21) isTargetedUpdateScheduledForAutoInstall];
      uint64_t v28 = "YES";
      if ((v67 & 1) == 0) {
        uint64_t v28 = "NO";
      }
      id v64 = v28;
      int v65 = [*((id *)v174 + 21) hidingPreferredDescriptor];
      uint64_t v29 = "YES";
      if ((v65 & 1) == 0) {
        uint64_t v29 = "NO";
      }
      int v62 = v29;
      id v63 = (id)[*(id *)(*((void *)v174 + 21) + 256) humanReadableUpdateName];
      id v59 = v63;
      id v60 = v59;
      id v180 = v60;
      int v61 = [*((id *)v174 + 21) hidingAlternateDescriptor];
      id v30 = "YES";
      if ((v61 & 1) == 0) {
        id v30 = "NO";
      }
      id v57 = v30;
      id v58 = (id)[*(id *)(*((void *)v174 + 21) + 264) humanReadableUpdateName];
      id v54 = v58;
      id v55 = v54;
      id v179 = v55;
      id v31 = (void *)*((void *)v174 + 21);
      char v177 = 0;
      id v56 = (id)[v31 enrolledBetaProgram];
      id v53 = v56;
      if (v53)
      {
        id v52 = (id)[*((id *)v174 + 21) enrolledBetaProgram];
        id v178 = v52;
        char v177 = 1;
        uint64_t v51 = [v178 programID];
        uint64_t v50 = v51;
      }
      else
      {
        uint64_t v50 = 0;
      }
      uint64_t v48 = v50;
      id v49 = (id)[*((id *)v174 + 21) betaPrograms];
      id v46 = v49;
      uint64_t v47 = [v46 count];
      id v45 = (id)[*((id *)v174 + 21) currentFullScanOperation];
      id v43 = v45;
      id v44 = (id)[*((id *)v174 + 21) currentRefreshScanOperation];
      id v41 = v44;
      id v42 = (id)[*((id *)v174 + 21) currentUpdateOperation];
      id v39 = v42;
      id v40 = (id)[*((id *)v174 + 21) auxiliaryOperations];
      id v37 = v40;
      uint64_t v38 = [v37 count];
      v35[17] = (_Unwind_Exception *)v35;
      uint64_t v36 = v208;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v208, (uint64_t)v176, (uint64_t)v94, v95, (uint64_t)v85, (uint64_t)v83, (uint64_t)v81, (uint64_t)v79, (uint64_t)v77, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v57, (uint64_t)v55, v50, v47,
        (uint64_t)v43,
        (uint64_t)v41,
        (uint64_t)v39,
        v38);
      _os_log_impl(&dword_228401000, v97, v98[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full scan operation is already running. Skipping on this refresh request. This should never happen.",
        v36,
        0xDEu);

      if (v177) {
      if (v181)
      }

      if (v183) {
      if (v185)
      }

      if (v187) {
      if (v189)
      }

      objc_storeStrong(&v179, 0);
      objc_storeStrong(&v180, 0);
      objc_storeStrong(&v191, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v32 = v174;
    *((void *)v174 + 22) = 0;
    *(_DWORD *)id v32 = 1;
  }
  else
  {
    *(_DWORD *)char v174 = 0;
  }
  objc_sync_exit(obj);

  if (!*(_DWORD *)v174)
  {
    [*((id *)v174 + 21) performRefreshScan:*((void *)v174 + 19)];
    id v33 = v174;
    *((void *)v174 + 22) = 0;
    *(_DWORD *)id v33 = 1;
  }
  objc_storeStrong(location, 0);
  return *((void *)v174 + 22);
}

- (int64_t)action_ReportRefreshScanResults:(id)a3 error:(id *)a4
{
  uint64_t v115 = a4;
  id v114 = "-[SUSettingsStatefulUIManager action_ReportRefreshScanResults:error:]";
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v164 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v162 = v115;
  id v116 = (id)[*((id *)v164 + 27) extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v116);

  uint64_t v117 = [v164 currentState];
  char v160 = 0;
  BOOL v118 = 0;
  if (v117 == [location[0] refreshPreviousState])
  {
    BOOL v118 = 0;
    if (([location[0] refreshHasAnyChanges] & 1) == 0)
    {
      id v161 = (id)[v164 scanError];
      char v160 = 1;
      BOOL v118 = v161 == 0;
    }
  }
  BOOL v113 = v118;
  if (v160) {

  }
  if (!v113) {
    goto LABEL_72;
  }
  if ([location[0] forceReload])
  {
    id v70 = (id)[v164 log];
    os_log_t v141 = (os_log_t)(id)[v70 oslog];

    os_log_type_t v140 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v64 = v141;
      *(_DWORD *)int v65 = v140;
      id v66 = SUSettingsUIStateToString([v164 currentState]);
      id v67 = v66;
      id v139 = v67;
      uint64_t v68 = [v164 currentState];
      id v69 = (id)[v164 delegate];
      char v137 = 0;
      char v135 = 0;
      if (v69)
      {
        id v138 = (id)[v164 delegate];
        int v62 = 1;
        char v137 = 1;
        id v13 = (objc_class *)objc_opt_class();
        id v136 = NSStringFromClass(v13);
        char v135 = 1;
        id v63 = (__CFString *)v136;
      }
      else
      {
        id v63 = @"(null)";
      }
      id v56 = v63;
      id v57 = (id)[v164 delegate];
      id v58 = (id)[v164 scanError];
      id v59 = (id)[v164 preferredStatefulDescriptor];
      id v60 = (id)[v164 alternateStatefulDescriptor];
      id v61 = (id)[v164 currentDownload];
      char v133 = 0;
      char v131 = 0;
      char v129 = 0;
      if (v61)
      {
        id v134 = (id)[v164 currentDownload];
        int v54 = 1;
        char v133 = 1;
        id v132 = (id)[v134 descriptor];
        char v131 = 1;
        id v130 = (id)[v132 humanReadableUpdateName];
        char v129 = 1;
        id v55 = (__CFString *)v130;
      }
      else
      {
        id v55 = @"(null)";
      }
      id v40 = v55;
      id v41 = (id)[v164 currentDownload];
      char v14 = [v164 performThirdPartyScan];
      uint64_t v47 = "NO";
      uint64_t v15 = "YES";
      uint64_t v48 = "YES";
      int v52 = 1;
      if ((v14 & 1) == 0) {
        uint64_t v15 = "NO";
      }
      id v42 = v15;
      char v16 = [v164 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v17 = (uint64_t)v48;
      if ((v16 & 1) == 0) {
        uint64_t v17 = (uint64_t)v47;
      }
      uint64_t v43 = v17;
      char v18 = [v164 hidingPreferredDescriptor];
      uint64_t v19 = (uint64_t)v48;
      if ((v18 & 1) == 0) {
        uint64_t v19 = (uint64_t)v47;
      }
      uint64_t v44 = v19;
      id v45 = (id)[*((id *)v164 + 32) humanReadableUpdateName];
      id v46 = v45;
      id v128 = v46;
      char v20 = [v164 hidingAlternateDescriptor];
      uint64_t v21 = (uint64_t)v48;
      if ((v20 & 1) == 0) {
        uint64_t v21 = (uint64_t)v47;
      }
      uint64_t v49 = v21;
      id v50 = (id)[*((id *)v164 + 33) humanReadableUpdateName];
      id v51 = v50;
      id v127 = v51;
      id v53 = (id)[v164 enrolledBetaProgram];
      char v125 = 0;
      if (v53)
      {
        id v126 = (id)[v164 enrolledBetaProgram];
        char v125 = 1;
        uint64_t v39 = [v126 programID];
      }
      else
      {
        uint64_t v39 = 0;
      }
      uint64_t v30 = v39;
      id v38 = (id)[v164 betaPrograms];
      uint64_t v31 = [v38 count];
      id v37 = (id)[v164 currentFullScanOperation];
      id v36 = (id)[v164 currentRefreshScanOperation];
      id v35 = (id)[v164 currentUpdateOperation];
      id v34 = (id)[v164 auxiliaryOperations];
      id v32 = &v23;
      id v33 = v166;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v166, (uint64_t)v114, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v39, v31,
        (uint64_t)v37,
        (uint64_t)v36,
        (uint64_t)v35,
        [v34 count]);
      _os_log_impl(&dword_228401000, v64, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "The descriptors states and errors are identical to the previous values (refreshHasAnyChanges = YES). Force load "
        "was requested - proceeding to ask the delegate to reload the UI.",
        v33,
        0xDEu);

      if (v125) {
      if (v129)
      }

      if (v131) {
      if (v133)
      }

      if (v135) {
      if (v137)
      }

      id v29 = 0;
      objc_storeStrong(&v127, 0);
      objc_storeStrong(&v128, v29);
      objc_storeStrong(&v139, v29);
    }
    objc_storeStrong((id *)&v141, 0);
LABEL_72:
    id v26 = v164;
    int v24 = sel_statefulUIManagerDidRefreshState_;
    BOOL v25 = &v119;
    uint64_t v119 = MEMORY[0x263EF8330];
    int v120 = -1073741824;
    int v121 = 0;
    id v122 = __69__SUSettingsStatefulUIManager_action_ReportRefreshScanResults_error___block_invoke;
    uint64_t v123 = &unk_26483BA90;
    uint64_t v27 = &v124;
    id v124 = v164;
    [v26 executeOperationOnDelegate:v24 usingBlock:v25];
    id v28 = 0;
    objc_storeStrong((id *)v164 + 24, 0);
    int64_t v165 = 0;
    int v142 = 1;
    objc_storeStrong(v27, v28);
    goto LABEL_73;
  }
  id v112 = (id)[v164 log];
  osos_log_t log = (os_log_t)(id)[v112 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v107 = type;
    id v108 = SUSettingsUIStateToString([v164 currentState]);
    id v109 = v108;
    id v157 = v109;
    uint64_t v110 = [v164 currentState];
    id v111 = (id)[v164 delegate];
    char v155 = 0;
    char v153 = 0;
    if (v111)
    {
      id v156 = (id)[v164 delegate];
      int v104 = 1;
      char v155 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v154 = NSStringFromClass(v4);
      char v153 = 1;
      id v105 = (__CFString *)v154;
    }
    else
    {
      id v105 = @"(null)";
    }
    char v98 = v105;
    id v99 = (id)[v164 delegate];
    id v100 = (id)[v164 scanError];
    id v101 = (id)[v164 preferredStatefulDescriptor];
    id v102 = (id)[v164 alternateStatefulDescriptor];
    id v103 = (id)[v164 currentDownload];
    char v151 = 0;
    char v149 = 0;
    char v147 = 0;
    if (v103)
    {
      id v152 = (id)[v164 currentDownload];
      int v96 = 1;
      char v151 = 1;
      id v150 = (id)[v152 descriptor];
      char v149 = 1;
      id v148 = (id)[v150 humanReadableUpdateName];
      char v147 = 1;
      os_log_t v97 = (__CFString *)v148;
    }
    else
    {
      os_log_t v97 = @"(null)";
    }
    id v82 = v97;
    id v83 = (id)[v164 currentDownload];
    char v5 = [v164 performThirdPartyScan];
    Class v89 = "NO";
    id v6 = "YES";
    id v90 = "YES";
    int v94 = 1;
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    id v84 = v6;
    char v7 = [v164 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v90;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v89;
    }
    uint64_t v85 = v8;
    char v9 = [v164 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v90;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v89;
    }
    uint64_t v86 = v10;
    id v87 = (id)[*((id *)v164 + 32) humanReadableUpdateName];
    id v88 = v87;
    id v146 = v88;
    char v11 = [v164 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v90;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v89;
    }
    uint64_t v91 = v12;
    id v92 = (id)[*((id *)v164 + 33) humanReadableUpdateName];
    id v93 = v92;
    id v145 = v93;
    id v95 = (id)[v164 enrolledBetaProgram];
    char v143 = 0;
    if (v95)
    {
      id v144 = (id)[v164 enrolledBetaProgram];
      char v143 = 1;
      uint64_t v81 = [v144 programID];
    }
    else
    {
      uint64_t v81 = 0;
    }
    uint64_t v72 = v81;
    id v80 = (id)[v164 betaPrograms];
    uint64_t v73 = [v80 count];
    id v79 = (id)[v164 currentFullScanOperation];
    id v78 = (id)[v164 currentRefreshScanOperation];
    id v77 = (id)[v164 currentUpdateOperation];
    id v76 = (id)[v164 auxiliaryOperations];
    id v74 = &v23;
    buf = v167;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v167, (uint64_t)v114, (uint64_t)v109, v110, (uint64_t)v98, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, v85, v86, (uint64_t)v88, v91, (uint64_t)v93, v81, v73,
      (uint64_t)v79,
      (uint64_t)v78,
      (uint64_t)v77,
      [v76 count]);
    _os_log_impl(&dword_228401000, log, v107[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "The descriptors states and errors are identical to the previous values (refreshHasAnyChanges = YES). Dropping the "
      "refresh request.",
      buf,
      0xDEu);

    if (v143) {
    if (v147)
    }

    if (v149) {
    if (v151)
    }

    if (v153) {
    if (v155)
    }

    id obj = 0;
    objc_storeStrong(&v145, 0);
    objc_storeStrong(&v146, obj);
    objc_storeStrong(&v157, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong((id *)v164 + 24, 0);
  int64_t v165 = 0;
  int v142 = 1;
LABEL_73:
  objc_storeStrong(location, 0);
  return v165;
}

void __69__SUSettingsStatefulUIManager_action_ReportRefreshScanResults_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (int64_t)action_ReportRefreshScanResultsFailed:(id)a3 error:(id *)a4
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = a4;
  id v6 = (id)[(SUCoreFSM *)v15->_managerFSM extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  char v7 = v15;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  char v11 = __75__SUSettingsStatefulUIManager_action_ReportRefreshScanResultsFailed_error___block_invoke;
  uint64_t v12 = &unk_26483BA90;
  v13[0] = v15;
  -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v7, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManagerDidRefreshState_);
  objc_storeStrong((id *)&v15->_currentRefreshScanOperation, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return 0;
}

void __75__SUSettingsStatefulUIManager_action_ReportRefreshScanResultsFailed_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (int64_t)action_ThirdPartyScanDuringRefresh:(id)a3 error:(id *)a4
{
  int v65 = a4;
  os_log_t v64 = "-[SUSettingsStatefulUIManager action_ThirdPartyScanDuringRefresh:error:]";
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v86 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v65;
  id v66 = (id)[(SUCoreFSM *)v86->_managerFSM extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v66);

  id v63 = [(SUSettingsStatefulUIManager *)v86 log];
  oslog[0] = (os_log_t)(id)[v63 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v58 = type;
    id v59 = SUSettingsUIStateToString([(SUSettingsStatefulUIManager *)v86 currentState]);
    id v60 = v59;
    id v82 = v60;
    unint64_t v61 = [(SUSettingsStatefulUIManager *)v86 currentState];
    id v62 = [(SUSettingsStatefulUIManager *)v86 delegate];
    char v80 = 0;
    char v78 = 0;
    if (v62)
    {
      id v81 = [(SUSettingsStatefulUIManager *)v86 delegate];
      int v55 = 1;
      char v80 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v79 = NSStringFromClass(v4);
      char v78 = 1;
      id v56 = (__CFString *)v79;
    }
    else
    {
      id v56 = @"(null)";
    }
    uint64_t v49 = v56;
    id v50 = [(SUSettingsStatefulUIManager *)v86 delegate];
    id v51 = [(SUSettingsStatefulUIManager *)v86 scanError];
    id v52 = [(SUSettingsStatefulUIManager *)v86 preferredStatefulDescriptor];
    id v53 = [(SUSettingsStatefulUIManager *)v86 alternateStatefulDescriptor];
    id v54 = [(SUSettingsStatefulUIManager *)v86 currentDownload];
    char v76 = 0;
    char v74 = 0;
    char v72 = 0;
    if (v54)
    {
      id v77 = [(SUSettingsStatefulUIManager *)v86 currentDownload];
      int v47 = 1;
      char v76 = 1;
      id v75 = (id)[v77 descriptor];
      char v74 = 1;
      id v73 = (id)[v75 humanReadableUpdateName];
      char v72 = 1;
      uint64_t v48 = (__CFString *)v73;
    }
    else
    {
      uint64_t v48 = @"(null)";
    }
    id v33 = v48;
    id v34 = [(SUSettingsStatefulUIManager *)v86 currentDownload];
    BOOL v5 = [(SUSettingsStatefulUIManager *)v86 performThirdPartyScan];
    id v40 = "NO";
    id v6 = "YES";
    id v41 = "YES";
    int v45 = 1;
    if (!v5) {
      id v6 = "NO";
    }
    id v35 = v6;
    BOOL v7 = [(SUSettingsStatefulUIManager *)v86 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v41;
    if (!v7) {
      uint64_t v8 = (uint64_t)v40;
    }
    uint64_t v36 = v8;
    BOOL v9 = [(SUSettingsStatefulUIManager *)v86 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v41;
    if (!v9) {
      uint64_t v10 = (uint64_t)v40;
    }
    uint64_t v37 = v10;
    id v38 = [(SUSettingsStatefulDescriptor *)v86->_hiddenPreferredStatefulDescriptor humanReadableUpdateName];
    id v39 = v38;
    id v71 = v39;
    BOOL v11 = [(SUSettingsStatefulUIManager *)v86 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v41;
    if (!v11) {
      uint64_t v12 = (uint64_t)v40;
    }
    uint64_t v42 = v12;
    id v43 = [(SUSettingsStatefulDescriptor *)v86->_hiddenAlternateStatefulDescriptor humanReadableUpdateName];
    id v44 = v43;
    id v70 = v44;
    id v46 = [(SUSettingsStatefulUIManager *)v86 enrolledBetaProgram];
    char v68 = 0;
    if (v46)
    {
      id v69 = [(SUSettingsStatefulUIManager *)v86 enrolledBetaProgram];
      char v68 = 1;
      uint64_t v32 = [v69 programID];
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v18 = v32;
    id v31 = [(SUSettingsStatefulUIManager *)v86 betaPrograms];
    uint64_t v19 = [v31 count];
    id v30 = [(SUSettingsStatefulUIManager *)v86 currentFullScanOperation];
    id v29 = [(SUSettingsStatefulUIManager *)v86 currentRefreshScanOperation];
    id v28 = [(SUSettingsStatefulUIManager *)v86 currentUpdateOperation];
    id v27 = [(SUSettingsStatefulUIManager *)v86 auxiliaryOperations];
    uint64_t v20 = [v27 count];
    id v26 = [(SUSettingsStatefulUIManager *)v86 currentRefreshScanOperation];
    id v25 = (id)[v26 scanUUID];
    id v21 = v25;
    id v67 = v21;
    id v24 = [(SUSettingsStatefulUIManager *)v86 currentRefreshScanOperation];
    id v22 = &v14;
    buf = v87;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_2((uint64_t)v87, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v32, v19,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v20,
      (uint64_t)v21,
      (uint64_t)v24);
    _os_log_impl(&dword_228401000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Cancelling a refresh request as a third-party scan has been initiated.\n"
      "Refresh scan UUID: %{public}@; Refresh Scan: %{public}p",
      buf,
      0xF2u);

    if (v68) {
    if (v72)
    }

    if (v74) {
    if (v76)
    }

    if (v78) {
    if (v80)
    }

    id obj = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v70, obj);
    objc_storeStrong(&v71, obj);
    objc_storeStrong(&v82, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  char v16 = [(SUSettingsStatefulUIManager *)v86 currentRefreshScanOperation];

  if (v16)
  {
    id v15 = [(SUSettingsStatefulUIManager *)v86 currentRefreshScanOperation];
    [v15 cancel:0];
  }
  objc_storeStrong(location, 0);
  return 0;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  id v4 = [NSString alloc];
  v16[0] = (id)[v4 initWithFormat:location[0]];
  BOOL v11 = [(SUSettingsStatefulUIManager *)v18 managerFSM];
  id v10 = (id)[(SUCoreFSM *)v11 diag];
  id v5 = [NSString alloc];
  id v9 = (id)[v5 initWithFormat:@"unknown action(%@)", location[0]];
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  id v12 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v15 = (id)[v12 buildError:8116 underlying:0 description:v16[0]];

  uint64_t v14 = [(SUSettingsStatefulUIManager *)v18 managerFSM];
  id v13 = (id)[(SUCoreFSM *)v14 diag];
  uint64_t v6 = [v15 code];
  [v13 trackAnomaly:@"[SUSettingsStatefulUIManager]" forReason:@"Stateful UI FSM has reported an anomaly" withResult:v6 withError:v15];

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v10;
  id v4 = location[0];
  id v7 = (id)[MEMORY[0x263F67CE8] sharedManager];
  id v6 = (id)[MEMORY[0x263F78218] sharedInstance];
  id v10 = 0;
  id v10 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v5, "initWithManagerClient:betaManager:preferences:options:", v4, v7);
  uint64_t v8 = v10;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v8;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 options:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v7 = v13;
  id v6 = location[0];
  id v9 = (id)[MEMORY[0x263F67CE8] sharedManager];
  id v8 = (id)[MEMORY[0x263F78218] sharedInstance];
  id v13 = 0;
  id v13 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v7, "initWithManagerClient:betaManager:preferences:options:", v6, v9);
  id v10 = v13;

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 betaManager:(id)a4 preferences:(id)a5 options:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v41 = 0;
  objc_storeStrong(&v41, a6);
  id v6 = v45;
  id v45 = 0;
  v40.receiver = v6;
  v40.super_class = (Class)SUSettingsStatefulUIManager;
  id v29 = [(SUSettingsStatefulUIManager *)&v40 init];
  id v45 = v29;
  objc_storeStrong(&v45, v29);
  if (!v29) {
    goto LABEL_25;
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettingsStatefulUIManager"];
  id v8 = (void *)*((void *)v45 + 20);
  *((void *)v45 + 20) = v7;

  if (!*((void *)v45 + 20))
  {
    id v25 = SUSettingsSharedLogger();
    id v39 = (id)[v25 oslog];

    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v48, (uint64_t)"-[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:]", @"SUSettingsStatefulUIManager");
      _os_log_impl(&dword_228401000, (os_log_t)v39, v38, "%s: Could not create a log category for %@", v48, 0x16u);
    }
    objc_storeStrong(&v39, 0);
    id v46 = 0;
    int v37 = 1;
    goto LABEL_26;
  }
  char v35 = 0;
  if (v41)
  {
    objc_storeStrong((id *)v45 + 6, v41);
  }
  else
  {
    uint64_t v36 = objc_alloc_init(SUSettingsStatefulUIOptions);
    char v35 = 1;
    objc_storeStrong((id *)v45 + 6, v36);
  }
  if (v35) {

  }
  id v9 = [[SUSettingsStatefulErrorContextProvider alloc] initForManager:v45];
  id v10 = (void *)*((void *)v45 + 7);
  *((void *)v45 + 7) = v9;

  uint64_t v20 = NSString;
  id v22 = (id)[v45 baseDomain];
  id v21 = (id)[v20 stringWithFormat:@"%@.stateful-ui-manager.preferences", v22];
  dispatch_queue_t v11 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
  id v12 = (void *)*((void *)v45 + 22);
  *((void *)v45 + 22) = v11;

  uint64_t v23 = [SUSettingsSUPreferencesManager alloc];
  uint64_t v24 = *((void *)v45 + 22);
  char v33 = 0;
  if (v42)
  {
    id v19 = v42;
  }
  else
  {
    id v34 = (id)[MEMORY[0x263F78218] sharedInstance];
    char v33 = 1;
    id v19 = v34;
  }
  uint64_t v13 = [(SUSettingsSUPreferencesManager *)v23 initWithDispatchQueue:v24 forSUPreferencesInstance:v19];
  uint64_t v14 = (void *)*((void *)v45 + 8);
  *((void *)v45 + 8) = v13;

  if (v33) {
  objc_storeStrong((id *)v45 + 28, location[0]);
  }
  [*((id *)v45 + 28) setDelegate:v45];
  *((void *)v45 + 9) = 0;
  char v31 = 0;
  if (v43)
  {
    objc_storeStrong((id *)v45 + 29, v43);
  }
  else
  {
    id v32 = (id)[MEMORY[0x263F67CE8] sharedManager];
    char v31 = 1;
    objc_storeStrong((id *)v45 + 29, v32);
  }
  if (v31) {

  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  char v16 = (void *)*((void *)v45 + 26);
  *((void *)v45 + 26) = v15;

  [v45 setupFSM];
  [v45 setupNetworkMonitoring];
  [v45 setupBatteryMonitoring];
  [v45 setupObservers];
  if (*((void *)v45 + 27))
  {
LABEL_25:
    id v46 = (SUSettingsStatefulUIManager *)v45;
    int v37 = 1;
    goto LABEL_26;
  }
  id v18 = (id)[v45 log];
  id v30 = (id)[v18 oslog];

  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v47, (uint64_t)"-[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:]");
    _os_log_error_impl(&dword_228401000, (os_log_t)v30, OS_LOG_TYPE_ERROR, "%s: Failed creating the manager FSM", v47, 0xCu);
  }
  objc_storeStrong(&v30, 0);
  id v46 = 0;
  int v37 = 1;
LABEL_26:
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v45, 0);
  return v46;
}

- (void)dealloc
{
  uint64_t v7 = self;
  SEL v6 = a2;
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x22A696F40](v2, v7->_originalCellFlag, v7->_originalWifiFlag);
  id v3 = (id)[getSUNetworkMonitorClass() sharedInstance];
  [v3 removeObserver:v7];

  PSSetBatteryMonitoringEnabled();
  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:v7];

  v5.receiver = v7;
  v5.super_class = (Class)SUSettingsStatefulUIManager;
  [(SUSettingsStatefulUIManager *)&v5 dealloc];
}

- (void)checkForAvailableUpdates
{
  id v57 = v76;
  id v58 = "-[SUSettingsStatefulUIManager checkForAvailableUpdates]";
  uint64_t v78 = *MEMORY[0x263EF8340];
  v76[1] = self;
  v76[0] = a2;
  id v56 = [(SUSettingsStatefulUIManager *)self log];
  osos_log_t log = (os_log_t)(id)[v56 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v51 = type;
    id v52 = SUSettingsUIStateToString([(id)v57[1] currentState]);
    id v53 = v52;
    id v73 = v53;
    uint64_t v54 = [(id)v57[1] currentState];
    id v55 = (id)[(id)v57[1] delegate];
    char v71 = 0;
    char v69 = 0;
    if (v55)
    {
      id v72 = (id)[(id)v57[1] delegate];
      int v48 = 1;
      char v71 = 1;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v70 = NSStringFromClass(v2);
      char v69 = 1;
      uint64_t v49 = (__CFString *)v70;
    }
    else
    {
      uint64_t v49 = @"(null)";
    }
    id v42 = v49;
    id v43 = (id)[(id)v57[1] delegate];
    id v44 = (id)[(id)v57[1] scanError];
    id v45 = (id)[(id)v57[1] preferredStatefulDescriptor];
    id v46 = (id)[(id)v57[1] alternateStatefulDescriptor];
    id v47 = (id)[(id)v57[1] currentDownload];
    char v67 = 0;
    char v65 = 0;
    char v63 = 0;
    if (v47)
    {
      id v68 = (id)[(id)v57[1] currentDownload];
      int v40 = 1;
      char v67 = 1;
      id v66 = (id)[v68 descriptor];
      char v65 = 1;
      id v64 = (id)[v66 humanReadableUpdateName];
      char v63 = 1;
      id v41 = (__CFString *)v64;
    }
    else
    {
      id v41 = @"(null)";
    }
    id v26 = v41;
    id v27 = (id)[(id)v57[1] currentDownload];
    char v3 = [(id)v57[1] performThirdPartyScan];
    char v33 = "NO";
    id v4 = "YES";
    id v34 = "YES";
    int v38 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    id v28 = v4;
    char v5 = [(id)v57[1] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v34;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v33;
    }
    uint64_t v29 = v6;
    char v7 = [(id)v57[1] hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v34;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v33;
    }
    uint64_t v30 = v8;
    id v31 = (id)[*(id *)(v57[1] + 256) humanReadableUpdateName];
    id v32 = v31;
    id v62 = v32;
    char v9 = [(id)v57[1] hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v34;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v33;
    }
    uint64_t v35 = v10;
    id v36 = (id)[*(id *)(v57[1] + 264) humanReadableUpdateName];
    id v37 = v36;
    id location = v37;
    id v39 = (id)[(id)v57[1] enrolledBetaProgram];
    char v59 = 0;
    if (v39)
    {
      id v60 = (id)[(id)v57[1] enrolledBetaProgram];
      char v59 = 1;
      uint64_t v25 = [v60 programID];
    }
    else
    {
      uint64_t v25 = 0;
    }
    uint64_t v16 = v25;
    id v24 = (id)[(id)v57[1] betaPrograms];
    uint64_t v17 = [v24 count];
    id v23 = (id)[(id)v57[1] currentFullScanOperation];
    id v22 = (id)[(id)v57[1] currentRefreshScanOperation];
    id v21 = (id)[(id)v57[1] currentUpdateOperation];
    id v20 = (id)[(id)v57[1] auxiliaryOperations];
    id v18 = &v11;
    buf = v77;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v77, (uint64_t)v58, (uint64_t)v53, v54, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28, v29, v30, (uint64_t)v32, v35, (uint64_t)v37, v25, v17,
      (uint64_t)v23,
      (uint64_t)v22,
      (uint64_t)v21,
      [v20 count]);
    _os_log_impl(&dword_228401000, log, v51[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v59) {
    if (v63)
    }

    if (v65) {
    if (v67)
    }

    if (v69) {
    if (v71)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v62, obj);
    objc_storeStrong(&v73, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v14 = (id)[(id)v57[1] managerFSM];
  id v12 = @"CheckForAvailableUpdate";
  id v13 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
  objc_msgSend(v14, "postEvent:withInfo:", v12);
}

- (void)refreshState
{
}

- (void)refreshState:(BOOL)a3
{
  v224 = "-[SUSettingsStatefulUIManager refreshState:]";
  uint64_t v285 = *MEMORY[0x263EF8340];
  v281 = self;
  SEL v280 = a2;
  BOOL v279 = a3;
  id obj = self->_currentRefreshScanOperation;
  objc_sync_enter(obj);
  id v223 = [(SUSettingsStatefulUIManager *)v281 log];
  id v221 = v223;
  id v222 = (id)[v221 oslog];
  osos_log_t log = (os_log_t)v222;

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)v219 = type;
    unint64_t v220 = [(SUSettingsStatefulUIManager *)v281 currentState];
    id v217 = SUSettingsUIStateToString(v220);
    id v214 = v217;
    id v215 = v214;
    id v276 = v215;
    unint64_t v216 = [(SUSettingsStatefulUIManager *)v281 currentState];
    char v274 = 0;
    char v272 = 0;
    id v213 = [(SUSettingsStatefulUIManager *)v281 delegate];
    id v212 = v213;
    if (v212)
    {
      id v211 = [(SUSettingsStatefulUIManager *)v281 delegate];
      id v275 = v211;
      char v274 = 1;
      Class aClass = (Class)objc_opt_class();
      id v209 = NSStringFromClass(aClass);
      id v273 = v209;
      char v272 = 1;
      v208 = (__CFString *)v273;
    }
    else
    {
      v208 = @"(null)";
    }
    int64_t v206 = v208;
    id v207 = [(SUSettingsStatefulUIManager *)v281 delegate];
    id v204 = v207;
    id v205 = [(SUSettingsStatefulUIManager *)v281 scanError];
    id v202 = v205;
    id v203 = [(SUSettingsStatefulUIManager *)v281 preferredStatefulDescriptor];
    id v200 = v203;
    id v201 = [(SUSettingsStatefulUIManager *)v281 alternateStatefulDescriptor];
    id v198 = v201;
    char v270 = 0;
    char v268 = 0;
    char v266 = 0;
    id v199 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
    id v197 = v199;
    if (v197)
    {
      id v196 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
      id v271 = v196;
      char v270 = 1;
      id v195 = (id)[v271 descriptor];
      id v269 = v195;
      char v268 = 1;
      id v194 = (id)[v269 humanReadableUpdateName];
      id v267 = v194;
      char v266 = 1;
      char v193 = (__CFString *)v267;
    }
    else
    {
      char v193 = @"(null)";
    }
    id v191 = v193;
    id v192 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
    id v189 = v192;
    BOOL v190 = [(SUSettingsStatefulUIManager *)v281 performThirdPartyScan];
    char v3 = "YES";
    if (!v190) {
      char v3 = "NO";
    }
    char v187 = v3;
    BOOL v188 = [(SUSettingsStatefulUIManager *)v281 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v188) {
      id v4 = "NO";
    }
    char v185 = v4;
    BOOL v186 = [(SUSettingsStatefulUIManager *)v281 hidingPreferredDescriptor];
    char v5 = "YES";
    if (!v186) {
      char v5 = "NO";
    }
    char v183 = v5;
    id v184 = [(SUSettingsStatefulDescriptor *)v281->_hiddenPreferredStatefulDescriptor humanReadableUpdateName];
    id v180 = v184;
    id v181 = v180;
    id v265 = v181;
    BOOL v182 = [(SUSettingsStatefulUIManager *)v281 hidingAlternateDescriptor];
    uint64_t v6 = "YES";
    if (!v182) {
      uint64_t v6 = "NO";
    }
    id v178 = v6;
    id v179 = [(SUSettingsStatefulDescriptor *)v281->_hiddenAlternateStatefulDescriptor humanReadableUpdateName];
    id v175 = v179;
    id v176 = v175;
    id location = v176;
    char v262 = 0;
    id v177 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
    id v174 = v177;
    if (v174)
    {
      id v173 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
      id v263 = v173;
      char v262 = 1;
      uint64_t v172 = [v263 programID];
      uint64_t v171 = v172;
    }
    else
    {
      uint64_t v171 = 0;
    }
    uint64_t v169 = v171;
    id v170 = [(SUSettingsStatefulUIManager *)v281 betaPrograms];
    id v167 = v170;
    uint64_t v168 = [v167 count];
    id v166 = [(SUSettingsStatefulUIManager *)v281 currentFullScanOperation];
    id v164 = v166;
    id v165 = [(SUSettingsStatefulUIManager *)v281 currentRefreshScanOperation];
    id v162 = v165;
    id v163 = [(SUSettingsStatefulUIManager *)v281 currentUpdateOperation];
    id v160 = v163;
    id v161 = [(SUSettingsStatefulUIManager *)v281 auxiliaryOperations];
    id v158 = v161;
    uint64_t v159 = [v158 count];
    id v156 = &v15;
    buf = v284;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v284, (uint64_t)v224, (uint64_t)v215, v216, (uint64_t)v206, (uint64_t)v204, (uint64_t)v202, (uint64_t)v200, (uint64_t)v198, (uint64_t)v191, (uint64_t)v189, (uint64_t)v187, (uint64_t)v185, (uint64_t)v183, (uint64_t)v181, (uint64_t)v178, (uint64_t)v176, v171, v168,
      (uint64_t)v164,
      (uint64_t)v162,
      (uint64_t)v160,
      v159);
    _os_log_impl(&dword_228401000, log, v219[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v262) {
    if (v266)
    }

    if (v268) {
    if (v270)
    }

    if (v272) {
    if (v274)
    }

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v265, 0);
    objc_storeStrong(&v276, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v281->_currentRefreshScanOperation)
  {
    id v155 = [(SUSettingsStatefulUIManager *)v281 log];
    id v153 = v155;
    id v154 = (id)[v153 oslog];
    os_log_t v261 = (os_log_t)v154;

    os_log_type_t v260 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v150 = v261;
      *(_DWORD *)char v151 = v260;
      unint64_t v152 = [(SUSettingsStatefulUIManager *)v281 currentState];
      id v149 = SUSettingsUIStateToString(v152);
      id v146 = v149;
      id v147 = v146;
      id v259 = v147;
      unint64_t v148 = [(SUSettingsStatefulUIManager *)v281 currentState];
      char v257 = 0;
      char v255 = 0;
      id v145 = [(SUSettingsStatefulUIManager *)v281 delegate];
      id v144 = v145;
      if (v144)
      {
        id v143 = [(SUSettingsStatefulUIManager *)v281 delegate];
        id v258 = v143;
        char v257 = 1;
        Class v142 = (Class)objc_opt_class();
        id v141 = NSStringFromClass(v142);
        id v256 = v141;
        char v255 = 1;
        os_log_type_t v140 = (__CFString *)v256;
      }
      else
      {
        os_log_type_t v140 = @"(null)";
      }
      id v138 = v140;
      id v139 = [(SUSettingsStatefulUIManager *)v281 delegate];
      id v136 = v139;
      id v137 = [(SUSettingsStatefulUIManager *)v281 scanError];
      id v134 = v137;
      id v135 = [(SUSettingsStatefulUIManager *)v281 preferredStatefulDescriptor];
      id v132 = v135;
      id v133 = [(SUSettingsStatefulUIManager *)v281 alternateStatefulDescriptor];
      id v130 = v133;
      char v253 = 0;
      char v251 = 0;
      char v249 = 0;
      id v131 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
      id v129 = v131;
      if (v129)
      {
        id v128 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
        id v254 = v128;
        char v253 = 1;
        id v127 = (id)[v254 descriptor];
        id v252 = v127;
        char v251 = 1;
        id v126 = (id)[v252 humanReadableUpdateName];
        id v250 = v126;
        char v249 = 1;
        char v125 = (__CFString *)v250;
      }
      else
      {
        char v125 = @"(null)";
      }
      uint64_t v123 = v125;
      id v124 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
      id v121 = v124;
      BOOL v122 = [(SUSettingsStatefulUIManager *)v281 performThirdPartyScan];
      char v7 = "YES";
      if (!v122) {
        char v7 = "NO";
      }
      uint64_t v119 = v7;
      BOOL v120 = [(SUSettingsStatefulUIManager *)v281 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v8 = "YES";
      if (!v120) {
        uint64_t v8 = "NO";
      }
      uint64_t v117 = v8;
      BOOL v118 = [(SUSettingsStatefulUIManager *)v281 hidingPreferredDescriptor];
      char v9 = "YES";
      if (!v118) {
        char v9 = "NO";
      }
      uint64_t v115 = v9;
      id v116 = [(SUSettingsStatefulDescriptor *)v281->_hiddenPreferredStatefulDescriptor humanReadableUpdateName];
      id v112 = v116;
      id v113 = v112;
      id v248 = v113;
      BOOL v114 = [(SUSettingsStatefulUIManager *)v281 hidingAlternateDescriptor];
      uint64_t v10 = "YES";
      if (!v114) {
        uint64_t v10 = "NO";
      }
      uint64_t v110 = v10;
      id v111 = [(SUSettingsStatefulDescriptor *)v281->_hiddenAlternateStatefulDescriptor humanReadableUpdateName];
      id v107 = v111;
      id v108 = v107;
      id v247 = v108;
      char v245 = 0;
      id v109 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
      id v106 = v109;
      if (v106)
      {
        id v105 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
        id v246 = v105;
        char v245 = 1;
        uint64_t v104 = [v246 programID];
        uint64_t v103 = v104;
      }
      else
      {
        uint64_t v103 = 0;
      }
      uint64_t v101 = v103;
      id v102 = [(SUSettingsStatefulUIManager *)v281 betaPrograms];
      id v99 = v102;
      uint64_t v100 = [v99 count];
      id v98 = [(SUSettingsStatefulUIManager *)v281 currentFullScanOperation];
      id v96 = v98;
      id v97 = [(SUSettingsStatefulUIManager *)v281 currentRefreshScanOperation];
      id v94 = v97;
      id v95 = [(SUSettingsStatefulUIManager *)v281 currentUpdateOperation];
      id v92 = v95;
      id v93 = [(SUSettingsStatefulUIManager *)v281 auxiliaryOperations];
      id v90 = v93;
      uint64_t v91 = [v90 count];
      uint64_t v88 = &v15;
      Class v89 = v283;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v283, (uint64_t)v224, (uint64_t)v147, v148, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, (uint64_t)v123, (uint64_t)v121, (uint64_t)v119, (uint64_t)v117, (uint64_t)v115, (uint64_t)v113, (uint64_t)v110, (uint64_t)v108, v101, v100,
        (uint64_t)v96,
        (uint64_t)v94,
        (uint64_t)v92,
        v91);
      _os_log_impl(&dword_228401000, v150, v151[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is already running. Skipping on this refresh request without transitioning to the Refreshing"
        "ScanResults state.",
        v89,
        0xDEu);

      if (v245) {
      if (v249)
      }

      if (v251) {
      if (v253)
      }

      if (v255) {
      if (v257)
      }

      objc_storeStrong(&v247, 0);
      objc_storeStrong(&v248, 0);
      objc_storeStrong(&v259, 0);
    }
    objc_storeStrong((id *)&v261, 0);
    int v244 = 1;
  }
  else if (v281->_currentFullScanOperation)
  {
    id v87 = [(SUSettingsStatefulUIManager *)v281 log];
    id v85 = v87;
    id v86 = (id)[v85 oslog];
    os_log_t v243 = (os_log_t)v86;

    os_log_type_t v242 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v82 = v243;
      *(_DWORD *)id v83 = v242;
      unint64_t v84 = [(SUSettingsStatefulUIManager *)v281 currentState];
      id v81 = SUSettingsUIStateToString(v84);
      id v78 = v81;
      id v79 = v78;
      id v241 = v79;
      unint64_t v80 = [(SUSettingsStatefulUIManager *)v281 currentState];
      char v239 = 0;
      char v237 = 0;
      id v77 = [(SUSettingsStatefulUIManager *)v281 delegate];
      id v76 = v77;
      if (v76)
      {
        id v75 = [(SUSettingsStatefulUIManager *)v281 delegate];
        id v240 = v75;
        char v239 = 1;
        Class v74 = (Class)objc_opt_class();
        id v73 = NSStringFromClass(v74);
        id v238 = v73;
        char v237 = 1;
        id v72 = (__CFString *)v238;
      }
      else
      {
        id v72 = @"(null)";
      }
      id v70 = v72;
      id v71 = [(SUSettingsStatefulUIManager *)v281 delegate];
      id v68 = v71;
      id v69 = [(SUSettingsStatefulUIManager *)v281 scanError];
      id v66 = v69;
      id v67 = [(SUSettingsStatefulUIManager *)v281 preferredStatefulDescriptor];
      id v64 = v67;
      id v65 = [(SUSettingsStatefulUIManager *)v281 alternateStatefulDescriptor];
      id v62 = v65;
      char v235 = 0;
      char v233 = 0;
      char v231 = 0;
      id v63 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
      id v61 = v63;
      if (v61)
      {
        id v60 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
        id v236 = v60;
        char v235 = 1;
        id v59 = (id)[v236 descriptor];
        id v234 = v59;
        char v233 = 1;
        id v58 = (id)[v234 humanReadableUpdateName];
        id v232 = v58;
        char v231 = 1;
        id v57 = (__CFString *)v232;
      }
      else
      {
        id v57 = @"(null)";
      }
      id v55 = v57;
      id v56 = [(SUSettingsStatefulUIManager *)v281 currentDownload];
      id v53 = v56;
      BOOL v54 = [(SUSettingsStatefulUIManager *)v281 performThirdPartyScan];
      uint64_t v11 = "YES";
      if (!v54) {
        uint64_t v11 = "NO";
      }
      id v51 = v11;
      BOOL v52 = [(SUSettingsStatefulUIManager *)v281 isTargetedUpdateScheduledForAutoInstall];
      id v12 = "YES";
      if (!v52) {
        id v12 = "NO";
      }
      uint64_t v49 = v12;
      BOOL v50 = [(SUSettingsStatefulUIManager *)v281 hidingPreferredDescriptor];
      id v13 = "YES";
      if (!v50) {
        id v13 = "NO";
      }
      id v47 = v13;
      id v48 = [(SUSettingsStatefulDescriptor *)v281->_hiddenPreferredStatefulDescriptor humanReadableUpdateName];
      id v44 = v48;
      id v45 = v44;
      id v230 = v45;
      BOOL v46 = [(SUSettingsStatefulUIManager *)v281 hidingAlternateDescriptor];
      id v14 = "YES";
      if (!v46) {
        id v14 = "NO";
      }
      id v42 = v14;
      id v43 = [(SUSettingsStatefulDescriptor *)v281->_hiddenAlternateStatefulDescriptor humanReadableUpdateName];
      id v39 = v43;
      id v40 = v39;
      id v229 = v40;
      char v227 = 0;
      id v41 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
      id v38 = v41;
      if (v38)
      {
        id v37 = [(SUSettingsStatefulUIManager *)v281 enrolledBetaProgram];
        id v228 = v37;
        char v227 = 1;
        uint64_t v36 = [v228 programID];
        uint64_t v35 = v36;
      }
      else
      {
        uint64_t v35 = 0;
      }
      uint64_t v33 = v35;
      id v34 = [(SUSettingsStatefulUIManager *)v281 betaPrograms];
      id v31 = v34;
      uint64_t v32 = [v31 count];
      id v30 = [(SUSettingsStatefulUIManager *)v281 currentFullScanOperation];
      id v28 = v30;
      id v29 = [(SUSettingsStatefulUIManager *)v281 currentRefreshScanOperation];
      id v26 = v29;
      id v27 = [(SUSettingsStatefulUIManager *)v281 currentUpdateOperation];
      id v24 = v27;
      id v25 = [(SUSettingsStatefulUIManager *)v281 auxiliaryOperations];
      id v22 = v25;
      uint64_t v23 = [v22 count];
      id v20 = &v15;
      id v21 = v282;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v282, (uint64_t)v224, (uint64_t)v79, v80, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v55, (uint64_t)v53, (uint64_t)v51, (uint64_t)v49, (uint64_t)v47, (uint64_t)v45, (uint64_t)v42, (uint64_t)v40, v33, v32,
        (uint64_t)v28,
        (uint64_t)v26,
        (uint64_t)v24,
        v23);
      _os_log_impl(&dword_228401000, v82, v83[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full scan operation is already running. Skipping on this refresh requestwithout transitioning to the Refreshin"
        "gScanResults state.",
        v21,
        0xDEu);

      if (v227) {
      if (v231)
      }

      if (v233) {
      if (v235)
      }

      if (v237) {
      if (v239)
      }

      objc_storeStrong(&v229, 0);
      objc_storeStrong(&v230, 0);
      objc_storeStrong(&v241, 0);
    }
    objc_storeStrong((id *)&v243, 0);
    int v244 = 1;
  }
  else
  {
    id v19 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    id v226 = v19;
    [(SUSettingsStatefulUIManagerFSMParam *)v19 setForceReload:v279];
    [v226 setRefreshHasAnyChanges:0];
    uint64_t v18 = [(SUSettingsStatefulUIManager *)v281 currentState];
    [v226 setRefreshPreviousState:v18];
    id v17 = [(SUSettingsStatefulUIManager *)v281 managerFSM];
    id v16 = v17;
    [v16 postEvent:@"RefreshScanResults" withInfo:v226];

    objc_storeStrong(&v226, 0);
    int v244 = 0;
  }
  objc_sync_exit(obj);
}

- (void)checkForUpdatesInBackground
{
  id v56 = v75;
  id v57 = "-[SUSettingsStatefulUIManager checkForUpdatesInBackground]";
  uint64_t v77 = *MEMORY[0x263EF8340];
  v75[1] = self;
  v75[0] = a2;
  id v55 = [(SUSettingsStatefulUIManager *)self log];
  osos_log_t log = (os_log_t)(id)[v55 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)BOOL v50 = type;
    id v51 = SUSettingsUIStateToString([(id)v56[1] currentState]);
    id v52 = v51;
    id v72 = v52;
    uint64_t v53 = [(id)v56[1] currentState];
    id v54 = (id)[(id)v56[1] delegate];
    char v70 = 0;
    char v68 = 0;
    if (v54)
    {
      id v71 = (id)[(id)v56[1] delegate];
      int v47 = 1;
      char v70 = 1;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v69 = NSStringFromClass(v2);
      char v68 = 1;
      id v48 = (__CFString *)v69;
    }
    else
    {
      id v48 = @"(null)";
    }
    id v41 = v48;
    id v42 = (id)[(id)v56[1] delegate];
    id v43 = (id)[(id)v56[1] scanError];
    id v44 = (id)[(id)v56[1] preferredStatefulDescriptor];
    id v45 = (id)[(id)v56[1] alternateStatefulDescriptor];
    id v46 = (id)[(id)v56[1] currentDownload];
    char v66 = 0;
    char v64 = 0;
    char v62 = 0;
    if (v46)
    {
      id v67 = (id)[(id)v56[1] currentDownload];
      int v39 = 1;
      char v66 = 1;
      id v65 = (id)[v67 descriptor];
      char v64 = 1;
      id v63 = (id)[v65 humanReadableUpdateName];
      char v62 = 1;
      id v40 = (__CFString *)v63;
    }
    else
    {
      id v40 = @"(null)";
    }
    id v25 = v40;
    id v26 = (id)[(id)v56[1] currentDownload];
    char v3 = [(id)v56[1] performThirdPartyScan];
    uint64_t v32 = "NO";
    id v4 = "YES";
    uint64_t v33 = "YES";
    int v37 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    id v27 = v4;
    char v5 = [(id)v56[1] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v33;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v32;
    }
    uint64_t v28 = v6;
    char v7 = [(id)v56[1] hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v33;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v32;
    }
    uint64_t v29 = v8;
    id v30 = (id)[*(id *)(v56[1] + 256) humanReadableUpdateName];
    id v31 = v30;
    id v61 = v31;
    char v9 = [(id)v56[1] hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v33;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v32;
    }
    uint64_t v34 = v10;
    id v35 = (id)[*(id *)(v56[1] + 264) humanReadableUpdateName];
    id v36 = v35;
    id location = v36;
    id v38 = (id)[(id)v56[1] enrolledBetaProgram];
    char v58 = 0;
    if (v38)
    {
      id v59 = (id)[(id)v56[1] enrolledBetaProgram];
      char v58 = 1;
      uint64_t v24 = [v59 programID];
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v15 = v24;
    id v23 = (id)[(id)v56[1] betaPrograms];
    uint64_t v16 = [v23 count];
    id v22 = (id)[(id)v56[1] currentFullScanOperation];
    id v21 = (id)[(id)v56[1] currentRefreshScanOperation];
    id v20 = (id)[(id)v56[1] currentUpdateOperation];
    id v19 = (id)[(id)v56[1] auxiliaryOperations];
    id v17 = &v11;
    buf = v76;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v76, (uint64_t)v57, (uint64_t)v52, v53, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v28, v29, (uint64_t)v31, v34, (uint64_t)v36, v24, v16,
      (uint64_t)v22,
      (uint64_t)v21,
      (uint64_t)v20,
      [v19 count]);
    _os_log_impl(&dword_228401000, log, v50[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v58) {
    if (v62)
    }

    if (v64) {
    if (v66)
    }

    if (v68) {
    if (v70)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v61, obj);
    objc_storeStrong(&v72, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v12 = (id)v56[1];
  id v13 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
  objc_msgSend(v12, "performFullScan:");
}

- (BOOL)isTargetedUpdateScheduledForAutoInstall
{
  LOBYTE(v3) = 0;
  if (self->_isAutoUpdateScheduled)
  {
    LOBYTE(v3) = 0;
    if (self->_currentAutoInstallOperation)
    {
      LOBYTE(v3) = 0;
      if (([(SUAutoInstallOperation *)self->_currentAutoInstallOperation isCanceled] & 1) == 0) {
        int v3 = [(SUAutoInstallOperation *)self->_currentAutoInstallOperation isExpired] ^ 1;
      }
    }
  }
  return v3 & 1;
}

- (BOOL)doesTargetedUpdateMatchDescriptorType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  if (!a3 || v16 == 1)
  {
    char v11 = 0;
    char v9 = 0;
    if (v16)
    {
      uint64_t v10 = [(SUSettingsStatefulUIManager *)v18 alternateStatefulDescriptor];
      char v9 = 1;
      id v4 = v10;
    }
    else
    {
      id v12 = [(SUSettingsStatefulUIManager *)v18 preferredStatefulDescriptor];
      char v11 = 1;
      id v4 = v12;
    }
    char v19 = [(SUSettingsStatefulUIManager *)v18 doesTargetedUpdateMatchDescriptor:v4];
    if (v9) {

    }
    if (v11) {
  }
    }
  else
  {
    uint64_t v8 = [(SUSettingsStatefulUIManager *)v18 log];
    id v15 = (id)[(SUCoreLog *)v8 oslog];

    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v15;
      os_log_type_t type = v14;
      char v7 = SUSettingsDescriptorTypeToString(v16);
      id v13 = v7;
      __os_log_helper_16_2_3_8_32_8_64_8_0((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptorType:]", (uint64_t)v13, v16);
      _os_log_error_impl(&dword_228401000, log, type, "%s: The given descriptor type, %@ (%ld), is invalid.", v20, 0x20u);

      objc_storeStrong((id *)&v13, 0);
    }
    objc_storeStrong(&v15, 0);
    char v19 = 0;
  }
  return v19 & 1;
}

- (BOOL)doesTargetedUpdateMatchDescriptor:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(SUSettingsStatefulUIManager *)v13 currentDownload];
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  char v5 = 0;
  if (v4)
  {
    char v11 = [(SUSettingsStatefulUIManager *)v13 currentDownload];
    char v10 = 1;
    char v9 = [(SUDownload *)v11 descriptor];
    char v8 = 1;
    id v7 = (id)[location[0] descriptor];
    char v6 = 1;
    char v5 = -[SUDescriptor isEqual:](v9, "isEqual:");
  }
  char v14 = v5 & 1;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)targetedUpdateStatefulDescriptor
{
  return -[SUSettingsStatefulUIManager targetedUpdateForDownload:](self, "targetedUpdateForDownload:", self->_currentDownload, a2, self);
}

- (void)downloadUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
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
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  id v13 = &unk_26483BBD0;
  char v14 = v22;
  id v15 = location[0];
  id v16 = v20;
  id v17 = (id)MEMORY[0x22A697370]();
  [(SUSettingsStatefulUIManager *)v22 beginUpdateOperationWithDescriptor:location[0] operationDelegate:v19 delegateCallbackQueue:v18 operationTypeBlock:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  id v69 = a1;
  char v68 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  uint64_t v102 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  id v67 = (id)[(objc_class *)v69[4].isa log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)char v62 = type;
    id v63 = SUSettingsUIStateToString([(objc_class *)v69[4].isa currentState]);
    id v64 = v63;
    id v97 = v64;
    uint64_t v65 = [(objc_class *)v69[4].isa currentState];
    id v66 = (id)[(objc_class *)v69[4].isa delegate];
    char v95 = 0;
    char v93 = 0;
    if (v66)
    {
      id v96 = (id)[(objc_class *)v69[4].isa delegate];
      int v59 = 1;
      char v95 = 1;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v94 = NSStringFromClass(v2);
      char v93 = 1;
      id v60 = (__CFString *)v94;
    }
    else
    {
      id v60 = @"(null)";
    }
    uint64_t v53 = v60;
    id v54 = (id)[(objc_class *)v69[4].isa delegate];
    id v55 = (id)[(objc_class *)v69[4].isa scanError];
    id v56 = (id)[(objc_class *)v69[4].isa preferredStatefulDescriptor];
    id v57 = (id)[(objc_class *)v69[4].isa alternateStatefulDescriptor];
    id v58 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v91 = 0;
    char v89 = 0;
    char v87 = 0;
    if (v58)
    {
      id v92 = (id)[(objc_class *)v69[4].isa currentDownload];
      int v51 = 1;
      char v91 = 1;
      id v90 = (id)[v92 descriptor];
      char v89 = 1;
      id v88 = (id)[v90 humanReadableUpdateName];
      char v87 = 1;
      id v52 = (__CFString *)v88;
    }
    else
    {
      id v52 = @"(null)";
    }
    int v37 = v52;
    id v38 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v3 = [(objc_class *)v69[4].isa performThirdPartyScan];
    id v44 = "NO";
    id v4 = "YES";
    id v45 = "YES";
    int v49 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    int v39 = v4;
    char v5 = [(objc_class *)v69[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v45;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v44;
    }
    uint64_t v40 = v6;
    char v7 = [(objc_class *)v69[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v41 = v8;
    id v42 = (id)[*((id *)v69[4].isa + 32) humanReadableUpdateName];
    id v43 = v42;
    id v86 = v43;
    char v9 = [(objc_class *)v69[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v46 = v10;
    id v47 = (id)[*((id *)v69[4].isa + 33) humanReadableUpdateName];
    id v48 = v47;
    id v85 = v48;
    id v50 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
    char v83 = 0;
    if (v50)
    {
      id v84 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
      char v83 = 1;
      uint64_t v36 = [v84 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[(objc_class *)v69[4].isa betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[(objc_class *)v69[4].isa currentFullScanOperation];
    id v33 = (id)[(objc_class *)v69[4].isa currentRefreshScanOperation];
    id v32 = (id)[(objc_class *)v69[4].isa currentUpdateOperation];
    id v31 = (id)[(objc_class *)v69[4].isa auxiliaryOperations];
    uint64_t v11 = [v31 count];
    uint64_t isa = (uint64_t)v69[5].isa;
    uint64_t v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download (Download Only) the update: %{public}@",
      buf,
      0xE8u);

    if (v83) {
    if (v87)
    }

    if (v89) {
    if (v91)
    }

    if (v93) {
    if (v95)
    }

    id obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    id v15 = (id)*((void *)v69[4].isa + 25);
    id v17 = (id)[(objc_class *)v69[5].isa descriptor];
    id v16 = (id)[(objc_class *)v69[4].isa createUpdateOperationOptions];
    char v14 = &v70;
    uint64_t v70 = MEMORY[0x263EF8330];
    int v71 = -1073741824;
    int v72 = 0;
    id v73 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    Class v74 = &unk_26483BBA8;
    id v20 = (id *)v75;
    v75[0] = v69[4].isa;
    id v19 = (id *)(v14 + 6);
    void v75[2] = v69[6].isa;
    id v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    [v15 downloadUpdate:v17 withOptions:v16 completionHandler:v14];

    id v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    int v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)v69[4].isa + 5)];
      dispatch_block_t block = &v77;
      uint64_t v77 = MEMORY[0x263EF8330];
      int v78 = -1073741824;
      int v79 = 0;
      unint64_t v80 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_331;
      id v81 = &unk_26483BAE0;
      id v25 = (id *)&v82;
      os_log_t v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    int v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_331(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F78360], 8102);
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, void *a4)
{
  int v78 = a1;
  id obja = a4;
  int v76 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v116 = *MEMORY[0x263EF8340];
  BOOL v114 = a1;
  unsigned __int8 v113 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v111 = 0;
  objc_storeStrong(&v111, obja);
  oslog[1] = v78;
  id v75 = (id)[(objc_class *)v78[4].isa log];
  oslog[0] = (os_log_t)(id)[v75 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v70 = type;
    id v71 = SUSettingsUIStateToString([(objc_class *)v78[4].isa currentState]);
    id v72 = v71;
    id v108 = v72;
    uint64_t v73 = [(objc_class *)v78[4].isa currentState];
    id v74 = (id)[(objc_class *)v78[4].isa delegate];
    char v106 = 0;
    char v104 = 0;
    if (v74)
    {
      id v107 = (id)[(objc_class *)v78[4].isa delegate];
      int v67 = 1;
      char v106 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v105 = NSStringFromClass(v4);
      char v104 = 1;
      char v68 = (__CFString *)v105;
    }
    else
    {
      char v68 = @"(null)";
    }
    id v61 = v68;
    id v62 = (id)[(objc_class *)v78[4].isa delegate];
    id v63 = (id)[(objc_class *)v78[4].isa scanError];
    id v64 = (id)[(objc_class *)v78[4].isa preferredStatefulDescriptor];
    id v65 = (id)[(objc_class *)v78[4].isa alternateStatefulDescriptor];
    id v66 = (id)[(objc_class *)v78[4].isa currentDownload];
    char v102 = 0;
    char v100 = 0;
    char v98 = 0;
    if (v66)
    {
      id v103 = (id)[(objc_class *)v78[4].isa currentDownload];
      int v59 = 1;
      char v102 = 1;
      id v101 = (id)[v103 descriptor];
      char v100 = 1;
      id v99 = (id)[v101 humanReadableUpdateName];
      char v98 = 1;
      id v60 = (__CFString *)v99;
    }
    else
    {
      id v60 = @"(null)";
    }
    id v45 = v60;
    id v46 = (id)[(objc_class *)v78[4].isa currentDownload];
    char v5 = [(objc_class *)v78[4].isa performThirdPartyScan];
    id v52 = "NO";
    uint64_t v6 = "YES";
    uint64_t v53 = "YES";
    int v57 = 1;
    if ((v5 & 1) == 0) {
      uint64_t v6 = "NO";
    }
    id v47 = v6;
    char v7 = [(objc_class *)v78[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v53;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v52;
    }
    uint64_t v48 = v8;
    char v9 = [(objc_class *)v78[4].isa hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v53;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v52;
    }
    uint64_t v49 = v10;
    id v50 = (id)[*((id *)v78[4].isa + 32) humanReadableUpdateName];
    id v51 = v50;
    id v97 = v51;
    char v11 = [(objc_class *)v78[4].isa hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v53;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v52;
    }
    uint64_t v54 = v12;
    id v55 = (id)[*((id *)v78[4].isa + 33) humanReadableUpdateName];
    id v56 = v55;
    id v96 = v56;
    id v58 = (id)[(objc_class *)v78[4].isa enrolledBetaProgram];
    char v94 = 0;
    if (v58)
    {
      id v95 = (id)[(objc_class *)v78[4].isa enrolledBetaProgram];
      char v94 = 1;
      uint64_t v44 = [v95 programID];
    }
    else
    {
      uint64_t v44 = 0;
    }
    uint64_t v35 = v44;
    id v43 = (id)[(objc_class *)v78[4].isa betaPrograms];
    uint64_t v36 = [v43 count];
    id v42 = (id)[(objc_class *)v78[4].isa currentFullScanOperation];
    id v41 = (id)[(objc_class *)v78[4].isa currentRefreshScanOperation];
    id v40 = (id)[(objc_class *)v78[4].isa currentUpdateOperation];
    id v39 = (id)[(objc_class *)v78[4].isa auxiliaryOperations];
    uint64_t v13 = [v39 count];
    int v37 = &v14;
    buf = v115;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v115, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v36,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v13,
      v113 & 1,
      (uint64_t)v111);
    _os_log_impl(&dword_228401000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download (Download Only) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if (v94) {
    if (v98)
    }

    if (v100) {
    if (v102)
    }

    if (v104) {
    if (v106)
    }

    id v34 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v34);
    objc_storeStrong(&v108, v34);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v78[4].isa + 25, 0);
  if (v113)
  {
    objc_storeStrong((id *)v78[4].isa + 13, location);
    Class isa = v78[4].isa;
    int v16 = v113;
    id v17 = location;
    id v19 = v111;
    id v20 = (id *)&v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v18 = 0;
    int v81 = 0;
    os_log_t v82 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_334;
    char v83 = &unk_26483BB80;
    id v26 = (id *)v84;
    v84[0] = v78[4].isa;
    char v85 = v113 & 1;
    id v25 = v20 + 8;
    v84[4] = v78[6].isa;
    id v24 = v20 + 5;
    v84[1] = location;
    id v23 = v20 + 6;
    v84[2] = v111;
    id v22 = v20 + 7;
    v84[3] = v78[5].isa;
    id v27 = 0;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v16 & 1, v17, v18 & 1);
    objc_storeStrong(v22, v27);
    objc_storeStrong(v23, v27);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
    int v86 = 0;
  }
  else
  {
    if (v78[6].isa)
    {
      id v30 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v30 selectDelegateCallbackQueue:*((void *)v78[4].isa + 5)];
      dispatch_block_t block = &v87;
      uint64_t v87 = MEMORY[0x263EF8330];
      int v88 = -1073741824;
      int v89 = 0;
      id v90 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_333;
      char v91 = &unk_26483BB08;
      id v32 = (id *)&v93;
      char v93 = v78[6].isa;
      id v31 = (id *)((char *)block + 32);
      id v92 = v111;
      dispatch_async(queue, block);

      id v33 = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, v33);
    }
    int v86 = 1;
  }
  id v15 = 0;
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&location, v15);
}

uint64_t __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_333(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_334(NSObject *a1, char a2)
{
  id v71 = a1;
  id v72 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v107 = a1;
  unsigned __int8 v106 = a2 & 1;
  oslog[1] = a1;
  id v70 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v70 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v65 = type;
    id v66 = SUSettingsUIStateToString([(objc_class *)v71[4].isa currentState]);
    id v67 = v66;
    id v103 = v67;
    uint64_t v68 = [(objc_class *)v71[4].isa currentState];
    id v69 = (id)[(objc_class *)v71[4].isa delegate];
    char v101 = 0;
    char v99 = 0;
    if (v69)
    {
      id v102 = (id)[(objc_class *)v71[4].isa delegate];
      int v62 = 1;
      char v101 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v100 = NSStringFromClass(v2);
      char v99 = 1;
      id v63 = (__CFString *)v100;
    }
    else
    {
      id v63 = @"(null)";
    }
    id v56 = v63;
    id v57 = (id)[(objc_class *)v71[4].isa delegate];
    id v58 = (id)[(objc_class *)v71[4].isa scanError];
    id v59 = (id)[(objc_class *)v71[4].isa preferredStatefulDescriptor];
    id v60 = (id)[(objc_class *)v71[4].isa alternateStatefulDescriptor];
    id v61 = (id)[(objc_class *)v71[4].isa currentDownload];
    char v97 = 0;
    char v95 = 0;
    char v93 = 0;
    if (v61)
    {
      id v98 = (id)[(objc_class *)v71[4].isa currentDownload];
      int v54 = 1;
      char v97 = 1;
      id v96 = (id)[v98 descriptor];
      char v95 = 1;
      id v94 = (id)[v96 humanReadableUpdateName];
      char v93 = 1;
      id v55 = (__CFString *)v94;
    }
    else
    {
      id v55 = @"(null)";
    }
    id v40 = v55;
    id v41 = (id)[(objc_class *)v71[4].isa currentDownload];
    char v3 = [(objc_class *)v71[4].isa performThirdPartyScan];
    id v47 = "NO";
    id v4 = "YES";
    uint64_t v48 = "YES";
    int v52 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    id v42 = v4;
    char v5 = [(objc_class *)v71[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v48;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v47;
    }
    uint64_t v43 = v6;
    char v7 = [(objc_class *)v71[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v48;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v47;
    }
    uint64_t v44 = v8;
    id v45 = (id)[*((id *)v71[4].isa + 32) humanReadableUpdateName];
    id v46 = v45;
    id v92 = v46;
    char v9 = [(objc_class *)v71[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v48;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v47;
    }
    uint64_t v49 = v10;
    id v50 = (id)[*((id *)v71[4].isa + 33) humanReadableUpdateName];
    id v51 = v50;
    id location = v51;
    id v53 = (id)[(objc_class *)v71[4].isa enrolledBetaProgram];
    char v89 = 0;
    if (v53)
    {
      id v90 = (id)[(objc_class *)v71[4].isa enrolledBetaProgram];
      char v89 = 1;
      uint64_t v39 = [v90 programID];
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v30 = v39;
    id v31 = (id)[(objc_class *)v71[4].isa betaPrograms];
    uint64_t v32 = [v31 count];
    id v33 = (id)[(objc_class *)v71[4].isa currentFullScanOperation];
    id v34 = (id)[(objc_class *)v71[4].isa currentRefreshScanOperation];
    id v35 = (id)[(objc_class *)v71[4].isa currentUpdateOperation];
    id v36 = (id)[(objc_class *)v71[4].isa auxiliaryOperations];
    uint64_t v37 = [v36 count];
    char isa = (char)v71[9].isa;
    int v38 = 0;
    if (isa) {
      int v38 = v106;
    }
    uint64_t v28 = &v12;
    buf = v108;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v30, v32,
      (uint64_t)v33,
      (uint64_t)v34,
      (uint64_t)v35,
      v37,
      v38 & 1);
    _os_log_impl(&dword_228401000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Download Only\" with result: %d",
      buf,
      0xE4u);

    if (v89) {
    if (v93)
    }

    if (v95) {
    if (v97)
    }

    if (v99) {
    if (v101)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v92, obj);
    objc_storeStrong(&v103, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v71[8].isa)
  {
    id v22 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v22 selectDelegateCallbackQueue:*((void *)v71[4].isa + 5)];
    dispatch_block_t block = &v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v81 = 0;
    os_log_t v82 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_335;
    char v83 = &unk_26483BB30;
    id v25 = (id *)&v86;
    int v86 = v71[8].isa;
    char v87 = (uint64_t)v71[9].isa & 1;
    char v88 = v106 & 1;
    id v24 = (id *)((char *)block + 32);
    id v84 = v71[5].isa;
    id v23 = (id *)((char *)block + 40);
    char v85 = v71[6].isa;
    dispatch_async(queue, block);

    id v26 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v26);
    objc_storeStrong(v25, v26);
  }
  Class v15 = v71[4].isa;
  uint64_t v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  uint64_t v14 = &v73;
  uint64_t v73 = MEMORY[0x263EF8330];
  int v74 = -1073741824;
  int v75 = 0;
  int v76 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_338;
  uint64_t v77 = &unk_26483BB58;
  int v18 = (id *)v78;
  v78[0] = v71[4].isa;
  id v17 = (id *)(v14 + 5);
  v78[1] = v71[7].isa;
  int v16 = (id *)(v14 + 6);
  void v78[2] = v71[5].isa;
  [(objc_class *)v15 executeOperationOnDelegate:v13 usingBlock:v14];
  id v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_335(uint64_t a1)
{
  char v2 = 0;
  if (*(unsigned char *)(a1 + 56)) {
    char v2 = *(unsigned char *)(a1 + 57);
  }
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2 & 1, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_338(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartDownloadForDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)downloadAndInstall:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
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
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  uint64_t v13 = &unk_26483BBD0;
  uint64_t v14 = v22;
  id v15 = location[0];
  id v16 = v20;
  id v17 = (id)MEMORY[0x22A697370]();
  [(SUSettingsStatefulUIManager *)v22 beginUpdateOperationWithDescriptor:location[0] operationDelegate:v19 delegateCallbackQueue:v18 operationTypeBlock:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  id v69 = a1;
  uint64_t v68 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  uint64_t v102 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  id v67 = (id)[(objc_class *)v69[4].isa log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v62 = type;
    id v63 = SUSettingsUIStateToString([(objc_class *)v69[4].isa currentState]);
    id v64 = v63;
    id v97 = v64;
    uint64_t v65 = [(objc_class *)v69[4].isa currentState];
    id v66 = (id)[(objc_class *)v69[4].isa delegate];
    char v95 = 0;
    char v93 = 0;
    if (v66)
    {
      id v96 = (id)[(objc_class *)v69[4].isa delegate];
      int v59 = 1;
      char v95 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v94 = NSStringFromClass(v2);
      char v93 = 1;
      id v60 = (__CFString *)v94;
    }
    else
    {
      id v60 = @"(null)";
    }
    id v53 = v60;
    id v54 = (id)[(objc_class *)v69[4].isa delegate];
    id v55 = (id)[(objc_class *)v69[4].isa scanError];
    id v56 = (id)[(objc_class *)v69[4].isa preferredStatefulDescriptor];
    id v57 = (id)[(objc_class *)v69[4].isa alternateStatefulDescriptor];
    id v58 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v91 = 0;
    char v89 = 0;
    char v87 = 0;
    if (v58)
    {
      id v92 = (id)[(objc_class *)v69[4].isa currentDownload];
      int v51 = 1;
      char v91 = 1;
      id v90 = (id)[v92 descriptor];
      char v89 = 1;
      id v88 = (id)[v90 humanReadableUpdateName];
      char v87 = 1;
      int v52 = (__CFString *)v88;
    }
    else
    {
      int v52 = @"(null)";
    }
    uint64_t v37 = v52;
    id v38 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v3 = [(objc_class *)v69[4].isa performThirdPartyScan];
    uint64_t v44 = "NO";
    id v4 = "YES";
    id v45 = "YES";
    int v49 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    uint64_t v39 = v4;
    char v5 = [(objc_class *)v69[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v45;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v44;
    }
    uint64_t v40 = v6;
    char v7 = [(objc_class *)v69[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v41 = v8;
    id v42 = (id)[*((id *)v69[4].isa + 32) humanReadableUpdateName];
    id v43 = v42;
    id v86 = v43;
    char v9 = [(objc_class *)v69[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v46 = v10;
    id v47 = (id)[*((id *)v69[4].isa + 33) humanReadableUpdateName];
    id v48 = v47;
    id v85 = v48;
    id v50 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
    char v83 = 0;
    if (v50)
    {
      id v84 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
      char v83 = 1;
      uint64_t v36 = [v84 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[(objc_class *)v69[4].isa betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[(objc_class *)v69[4].isa currentFullScanOperation];
    id v33 = (id)[(objc_class *)v69[4].isa currentRefreshScanOperation];
    id v32 = (id)[(objc_class *)v69[4].isa currentUpdateOperation];
    id v31 = (id)[(objc_class *)v69[4].isa auxiliaryOperations];
    uint64_t v11 = [v31 count];
    uint64_t isa = (uint64_t)v69[5].isa;
    uint64_t v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download and install (Update Now) the update: %{public}@",
      buf,
      0xE8u);

    if (v83) {
    if (v87)
    }

    if (v89) {
    if (v91)
    }

    if (v93) {
    if (v95)
    }

    id obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    id v15 = (id)*((void *)v69[4].isa + 25);
    id v17 = (id)[(objc_class *)v69[5].isa descriptor];
    id v16 = (id)[(objc_class *)v69[4].isa createUpdateOperationOptions];
    uint64_t v14 = &v70;
    uint64_t v70 = MEMORY[0x263EF8330];
    int v71 = -1073741824;
    int v72 = 0;
    uint64_t v73 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    int v74 = &unk_26483BBA8;
    id v20 = (id *)v75;
    v75[0] = v69[4].isa;
    id v19 = (id *)(v14 + 6);
    void v75[2] = v69[6].isa;
    id v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    [v15 downloadAndInstall:v17 withOptions:v16 completionHandler:v14];

    id v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    int v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)v69[4].isa + 5)];
      dispatch_block_t block = &v77;
      uint64_t v77 = MEMORY[0x263EF8330];
      int v78 = -1073741824;
      int v79 = 0;
      int v80 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_342;
      int v81 = &unk_26483BAE0;
      id v25 = (id *)&v82;
      os_log_t v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    int v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_342(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F78360], 8102);
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, void *a4)
{
  int v78 = a1;
  id obja = a4;
  int v76 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v116 = *MEMORY[0x263EF8340];
  BOOL v114 = a1;
  unsigned __int8 v113 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v111 = 0;
  objc_storeStrong(&v111, obja);
  oslog[1] = v78;
  id v75 = (id)[(objc_class *)v78[4].isa log];
  oslog[0] = (os_log_t)(id)[v75 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v70 = type;
    id v71 = SUSettingsUIStateToString([(objc_class *)v78[4].isa currentState]);
    id v72 = v71;
    id v108 = v72;
    uint64_t v73 = [(objc_class *)v78[4].isa currentState];
    id v74 = (id)[(objc_class *)v78[4].isa delegate];
    char v106 = 0;
    char v104 = 0;
    if (v74)
    {
      id v107 = (id)[(objc_class *)v78[4].isa delegate];
      int v67 = 1;
      char v106 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v105 = NSStringFromClass(v4);
      char v104 = 1;
      uint64_t v68 = (__CFString *)v105;
    }
    else
    {
      uint64_t v68 = @"(null)";
    }
    id v61 = v68;
    id v62 = (id)[(objc_class *)v78[4].isa delegate];
    id v63 = (id)[(objc_class *)v78[4].isa scanError];
    id v64 = (id)[(objc_class *)v78[4].isa preferredStatefulDescriptor];
    id v65 = (id)[(objc_class *)v78[4].isa alternateStatefulDescriptor];
    id v66 = (id)[(objc_class *)v78[4].isa currentDownload];
    char v102 = 0;
    char v100 = 0;
    char v98 = 0;
    if (v66)
    {
      id v103 = (id)[(objc_class *)v78[4].isa currentDownload];
      int v59 = 1;
      char v102 = 1;
      id v101 = (id)[v103 descriptor];
      char v100 = 1;
      id v99 = (id)[v101 humanReadableUpdateName];
      char v98 = 1;
      id v60 = (__CFString *)v99;
    }
    else
    {
      id v60 = @"(null)";
    }
    id v45 = v60;
    id v46 = (id)[(objc_class *)v78[4].isa currentDownload];
    char v5 = [(objc_class *)v78[4].isa performThirdPartyScan];
    int v52 = "NO";
    uint64_t v6 = "YES";
    id v53 = "YES";
    int v57 = 1;
    if ((v5 & 1) == 0) {
      uint64_t v6 = "NO";
    }
    id v47 = v6;
    char v7 = [(objc_class *)v78[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v53;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v52;
    }
    uint64_t v48 = v8;
    char v9 = [(objc_class *)v78[4].isa hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v53;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v52;
    }
    uint64_t v49 = v10;
    id v50 = (id)[*((id *)v78[4].isa + 32) humanReadableUpdateName];
    id v51 = v50;
    id v97 = v51;
    char v11 = [(objc_class *)v78[4].isa hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v53;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v52;
    }
    uint64_t v54 = v12;
    id v55 = (id)[*((id *)v78[4].isa + 33) humanReadableUpdateName];
    id v56 = v55;
    id v96 = v56;
    id v58 = (id)[(objc_class *)v78[4].isa enrolledBetaProgram];
    char v94 = 0;
    if (v58)
    {
      id v95 = (id)[(objc_class *)v78[4].isa enrolledBetaProgram];
      char v94 = 1;
      uint64_t v44 = [v95 programID];
    }
    else
    {
      uint64_t v44 = 0;
    }
    uint64_t v35 = v44;
    id v43 = (id)[(objc_class *)v78[4].isa betaPrograms];
    uint64_t v36 = [v43 count];
    id v42 = (id)[(objc_class *)v78[4].isa currentFullScanOperation];
    id v41 = (id)[(objc_class *)v78[4].isa currentRefreshScanOperation];
    id v40 = (id)[(objc_class *)v78[4].isa currentUpdateOperation];
    id v39 = (id)[(objc_class *)v78[4].isa auxiliaryOperations];
    uint64_t v13 = [v39 count];
    uint64_t v37 = &v14;
    buf = v115;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v115, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v36,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v13,
      v113 & 1,
      (uint64_t)v111);
    _os_log_impl(&dword_228401000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download and Install (Update Now) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if (v94) {
    if (v98)
    }

    if (v100) {
    if (v102)
    }

    if (v104) {
    if (v106)
    }

    id v34 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v34);
    objc_storeStrong(&v108, v34);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v78[4].isa + 25, 0);
  if (v113)
  {
    objc_storeStrong((id *)v78[4].isa + 13, location);
    Class isa = v78[4].isa;
    int v16 = v113;
    id v17 = location;
    id v19 = v111;
    id v20 = (id *)&v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v18 = 0;
    int v81 = 0;
    os_log_t v82 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_344;
    char v83 = &unk_26483BB80;
    id v26 = (id *)v84;
    v84[0] = v78[4].isa;
    char v85 = v113 & 1;
    id v25 = v20 + 8;
    v84[4] = v78[6].isa;
    id v24 = v20 + 5;
    v84[1] = location;
    id v23 = v20 + 6;
    v84[2] = v111;
    id v22 = v20 + 7;
    v84[3] = v78[5].isa;
    id v27 = 0;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v16 & 1, v17, v18 & 1);
    objc_storeStrong(v22, v27);
    objc_storeStrong(v23, v27);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
    int v86 = 0;
  }
  else
  {
    if (v78[6].isa)
    {
      id v30 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v30 selectDelegateCallbackQueue:*((void *)v78[4].isa + 5)];
      dispatch_block_t block = &v87;
      uint64_t v87 = MEMORY[0x263EF8330];
      int v88 = -1073741824;
      int v89 = 0;
      id v90 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_343;
      char v91 = &unk_26483BB08;
      id v32 = (id *)&v93;
      char v93 = v78[6].isa;
      id v31 = (id *)((char *)block + 32);
      id v92 = v111;
      dispatch_async(queue, block);

      id v33 = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, v33);
    }
    int v86 = 1;
  }
  id v15 = 0;
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&location, v15);
}

uint64_t __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_344(NSObject *a1, char a2)
{
  id v71 = a1;
  id v72 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v107 = a1;
  unsigned __int8 v106 = a2 & 1;
  oslog[1] = a1;
  id v70 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v70 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v65 = type;
    id v66 = SUSettingsUIStateToString([(objc_class *)v71[4].isa currentState]);
    id v67 = v66;
    id v103 = v67;
    uint64_t v68 = [(objc_class *)v71[4].isa currentState];
    id v69 = (id)[(objc_class *)v71[4].isa delegate];
    char v101 = 0;
    char v99 = 0;
    if (v69)
    {
      id v102 = (id)[(objc_class *)v71[4].isa delegate];
      int v62 = 1;
      char v101 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v100 = NSStringFromClass(v2);
      char v99 = 1;
      id v63 = (__CFString *)v100;
    }
    else
    {
      id v63 = @"(null)";
    }
    id v56 = v63;
    id v57 = (id)[(objc_class *)v71[4].isa delegate];
    id v58 = (id)[(objc_class *)v71[4].isa scanError];
    id v59 = (id)[(objc_class *)v71[4].isa preferredStatefulDescriptor];
    id v60 = (id)[(objc_class *)v71[4].isa alternateStatefulDescriptor];
    id v61 = (id)[(objc_class *)v71[4].isa currentDownload];
    char v97 = 0;
    char v95 = 0;
    char v93 = 0;
    if (v61)
    {
      id v98 = (id)[(objc_class *)v71[4].isa currentDownload];
      int v54 = 1;
      char v97 = 1;
      id v96 = (id)[v98 descriptor];
      char v95 = 1;
      id v94 = (id)[v96 humanReadableUpdateName];
      char v93 = 1;
      id v55 = (__CFString *)v94;
    }
    else
    {
      id v55 = @"(null)";
    }
    id v40 = v55;
    id v41 = (id)[(objc_class *)v71[4].isa currentDownload];
    char v3 = [(objc_class *)v71[4].isa performThirdPartyScan];
    id v47 = "NO";
    id v4 = "YES";
    uint64_t v48 = "YES";
    int v52 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    id v42 = v4;
    char v5 = [(objc_class *)v71[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v48;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v47;
    }
    uint64_t v43 = v6;
    char v7 = [(objc_class *)v71[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v48;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v47;
    }
    uint64_t v44 = v8;
    id v45 = (id)[*((id *)v71[4].isa + 32) humanReadableUpdateName];
    id v46 = v45;
    id v92 = v46;
    char v9 = [(objc_class *)v71[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v48;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v47;
    }
    uint64_t v49 = v10;
    id v50 = (id)[*((id *)v71[4].isa + 33) humanReadableUpdateName];
    id v51 = v50;
    id location = v51;
    id v53 = (id)[(objc_class *)v71[4].isa enrolledBetaProgram];
    char v89 = 0;
    if (v53)
    {
      id v90 = (id)[(objc_class *)v71[4].isa enrolledBetaProgram];
      char v89 = 1;
      uint64_t v39 = [v90 programID];
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v30 = v39;
    id v31 = (id)[(objc_class *)v71[4].isa betaPrograms];
    uint64_t v32 = [v31 count];
    id v33 = (id)[(objc_class *)v71[4].isa currentFullScanOperation];
    id v34 = (id)[(objc_class *)v71[4].isa currentRefreshScanOperation];
    id v35 = (id)[(objc_class *)v71[4].isa currentUpdateOperation];
    id v36 = (id)[(objc_class *)v71[4].isa auxiliaryOperations];
    uint64_t v37 = [v36 count];
    char isa = (char)v71[9].isa;
    int v38 = 0;
    if (isa) {
      int v38 = v106;
    }
    uint64_t v28 = &v12;
    buf = v108;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v30, v32,
      (uint64_t)v33,
      (uint64_t)v34,
      (uint64_t)v35,
      v37,
      v38 & 1);
    _os_log_impl(&dword_228401000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Update Now\" with result: %d",
      buf,
      0xE4u);

    if (v89) {
    if (v93)
    }

    if (v95) {
    if (v97)
    }

    if (v99) {
    if (v101)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v92, obj);
    objc_storeStrong(&v103, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v71[8].isa)
  {
    id v22 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v22 selectDelegateCallbackQueue:*((void *)v71[4].isa + 5)];
    dispatch_block_t block = &v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v81 = 0;
    os_log_t v82 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_345;
    char v83 = &unk_26483BB30;
    id v25 = (id *)&v86;
    int v86 = v71[8].isa;
    char v87 = (uint64_t)v71[9].isa & 1;
    char v88 = v106 & 1;
    id v24 = (id *)((char *)block + 32);
    id v84 = v71[5].isa;
    id v23 = (id *)((char *)block + 40);
    char v85 = v71[6].isa;
    dispatch_async(queue, block);

    id v26 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v26);
    objc_storeStrong(v25, v26);
  }
  Class v15 = v71[4].isa;
  uint64_t v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  uint64_t v14 = &v73;
  uint64_t v73 = MEMORY[0x263EF8330];
  int v74 = -1073741824;
  int v75 = 0;
  int v76 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_346;
  uint64_t v77 = &unk_26483BB58;
  int v18 = (id *)v78;
  v78[0] = v71[4].isa;
  id v17 = (id *)(v14 + 5);
  v78[1] = v71[7].isa;
  int v16 = (id *)(v14 + 6);
  void v78[2] = v71[5].isa;
  [(objc_class *)v15 executeOperationOnDelegate:v13 usingBlock:v14];
  id v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_345(uint64_t a1)
{
  char v2 = 0;
  if (*(unsigned char *)(a1 + 56)) {
    char v2 = *(unsigned char *)(a1 + 57);
  }
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2 & 1, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_346(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartDownloadForDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)downloadAndScheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
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
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  uint64_t v13 = &unk_26483BBD0;
  uint64_t v14 = v22;
  id v15 = location[0];
  id v16 = v20;
  id v17 = (id)MEMORY[0x22A697370]();
  [(SUSettingsStatefulUIManager *)v22 beginUpdateOperationWithDescriptor:location[0] operationDelegate:v19 delegateCallbackQueue:v18 operationTypeBlock:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  id v69 = a1;
  uint64_t v68 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke";
  uint64_t v102 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  id v67 = (id)[(objc_class *)v69[4].isa log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v62 = type;
    id v63 = SUSettingsUIStateToString([(objc_class *)v69[4].isa currentState]);
    id v64 = v63;
    id v97 = v64;
    uint64_t v65 = [(objc_class *)v69[4].isa currentState];
    id v66 = (id)[(objc_class *)v69[4].isa delegate];
    char v95 = 0;
    char v93 = 0;
    if (v66)
    {
      id v96 = (id)[(objc_class *)v69[4].isa delegate];
      int v59 = 1;
      char v95 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v94 = NSStringFromClass(v2);
      char v93 = 1;
      id v60 = (__CFString *)v94;
    }
    else
    {
      id v60 = @"(null)";
    }
    id v53 = v60;
    id v54 = (id)[(objc_class *)v69[4].isa delegate];
    id v55 = (id)[(objc_class *)v69[4].isa scanError];
    id v56 = (id)[(objc_class *)v69[4].isa preferredStatefulDescriptor];
    id v57 = (id)[(objc_class *)v69[4].isa alternateStatefulDescriptor];
    id v58 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v91 = 0;
    char v89 = 0;
    char v87 = 0;
    if (v58)
    {
      id v92 = (id)[(objc_class *)v69[4].isa currentDownload];
      int v51 = 1;
      char v91 = 1;
      id v90 = (id)[v92 descriptor];
      char v89 = 1;
      id v88 = (id)[v90 humanReadableUpdateName];
      char v87 = 1;
      int v52 = (__CFString *)v88;
    }
    else
    {
      int v52 = @"(null)";
    }
    uint64_t v37 = v52;
    id v38 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v3 = [(objc_class *)v69[4].isa performThirdPartyScan];
    uint64_t v44 = "NO";
    id v4 = "YES";
    id v45 = "YES";
    int v49 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    uint64_t v39 = v4;
    char v5 = [(objc_class *)v69[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v45;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v44;
    }
    uint64_t v40 = v6;
    char v7 = [(objc_class *)v69[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v41 = v8;
    id v42 = (id)[*((id *)v69[4].isa + 32) humanReadableUpdateName];
    id v43 = v42;
    id v86 = v43;
    char v9 = [(objc_class *)v69[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v46 = v10;
    id v47 = (id)[*((id *)v69[4].isa + 33) humanReadableUpdateName];
    id v48 = v47;
    id v85 = v48;
    id v50 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
    char v83 = 0;
    if (v50)
    {
      id v84 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
      char v83 = 1;
      uint64_t v36 = [v84 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[(objc_class *)v69[4].isa betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[(objc_class *)v69[4].isa currentFullScanOperation];
    id v33 = (id)[(objc_class *)v69[4].isa currentRefreshScanOperation];
    id v32 = (id)[(objc_class *)v69[4].isa currentUpdateOperation];
    id v31 = (id)[(objc_class *)v69[4].isa auxiliaryOperations];
    uint64_t v11 = [v31 count];
    uint64_t isa = (uint64_t)v69[5].isa;
    uint64_t v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download and schedule (Update Tonight) the update: %{public}@",
      buf,
      0xE8u);

    if (v83) {
    if (v87)
    }

    if (v89) {
    if (v91)
    }

    if (v93) {
    if (v95)
    }

    id obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    id v15 = (id)*((void *)v69[4].isa + 25);
    id v17 = (id)[(objc_class *)v69[5].isa descriptor];
    id v16 = (id)[(objc_class *)v69[4].isa createUpdateOperationOptions];
    uint64_t v14 = &v70;
    uint64_t v70 = MEMORY[0x263EF8330];
    int v71 = -1073741824;
    int v72 = 0;
    uint64_t v73 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    int v74 = &unk_26483BC70;
    id v20 = (id *)v75;
    v75[0] = v69[4].isa;
    id v19 = (id *)(v14 + 6);
    void v75[2] = v69[6].isa;
    id v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    [v15 downloadAndScheduleUpdate:v17 forInstallationTonightWithOptions:v16 completionHandler:v14];

    id v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    int v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)v69[4].isa + 5)];
      dispatch_block_t block = &v77;
      uint64_t v77 = MEMORY[0x263EF8330];
      int v78 = -1073741824;
      int v79 = 0;
      int v80 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_347;
      int v81 = &unk_26483BAE0;
      id v25 = (id *)&v82;
      os_log_t v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    int v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_347(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F78360], 8102);
  (*(void (**)(uint64_t, void, void, void))(v1 + 16))(v1, 0, 0, 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, int a4, void *a5, void *a6)
{
  char v87 = a1;
  int v84 = a4;
  id obja = a5;
  id v86 = a6;
  char v83 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke_2";
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v128 = a1;
  unsigned __int8 v127 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  unsigned __int8 v125 = v84 & 1;
  id v124 = 0;
  objc_storeStrong(&v124, obja);
  id v123 = 0;
  objc_storeStrong(&v123, v86);
  oslog[1] = v87;
  id v82 = (id)[(objc_class *)v87[4].isa log];
  oslog[0] = (os_log_t)(id)[v82 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v77 = type;
    id v78 = SUSettingsUIStateToString([(objc_class *)v87[4].isa currentState]);
    id v79 = v78;
    id v120 = v79;
    uint64_t v80 = [(objc_class *)v87[4].isa currentState];
    id v81 = (id)[(objc_class *)v87[4].isa delegate];
    char v118 = 0;
    char v116 = 0;
    if (v81)
    {
      id v119 = (id)[(objc_class *)v87[4].isa delegate];
      int v74 = 1;
      char v118 = 1;
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v117 = NSStringFromClass(v6);
      char v116 = 1;
      int v75 = (__CFString *)v117;
    }
    else
    {
      int v75 = @"(null)";
    }
    uint64_t v68 = v75;
    id v69 = (id)[(objc_class *)v87[4].isa delegate];
    id v70 = (id)[(objc_class *)v87[4].isa scanError];
    id v71 = (id)[(objc_class *)v87[4].isa preferredStatefulDescriptor];
    id v72 = (id)[(objc_class *)v87[4].isa alternateStatefulDescriptor];
    id v73 = (id)[(objc_class *)v87[4].isa currentDownload];
    char v114 = 0;
    char v112 = 0;
    char v110 = 0;
    if (v73)
    {
      id v115 = (id)[(objc_class *)v87[4].isa currentDownload];
      int v66 = 1;
      char v114 = 1;
      id v113 = (id)[v115 descriptor];
      char v112 = 1;
      id v111 = (id)[v113 humanReadableUpdateName];
      char v110 = 1;
      id v67 = (__CFString *)v111;
    }
    else
    {
      id v67 = @"(null)";
    }
    int v52 = v67;
    id v53 = (id)[(objc_class *)v87[4].isa currentDownload];
    char v7 = [(objc_class *)v87[4].isa performThirdPartyScan];
    int v59 = "NO";
    uint64_t v8 = "YES";
    id v60 = "YES";
    int v64 = 1;
    if ((v7 & 1) == 0) {
      uint64_t v8 = "NO";
    }
    id v54 = v8;
    char v9 = [(objc_class *)v87[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v10 = (uint64_t)v60;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v59;
    }
    uint64_t v55 = v10;
    char v11 = [(objc_class *)v87[4].isa hidingPreferredDescriptor];
    uint64_t v12 = (uint64_t)v60;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v59;
    }
    uint64_t v56 = v12;
    id v57 = (id)[*((id *)v87[4].isa + 32) humanReadableUpdateName];
    id v58 = v57;
    id v109 = v58;
    char v13 = [(objc_class *)v87[4].isa hidingAlternateDescriptor];
    uint64_t v14 = (uint64_t)v60;
    if ((v13 & 1) == 0) {
      uint64_t v14 = (uint64_t)v59;
    }
    uint64_t v61 = v14;
    id v62 = (id)[*((id *)v87[4].isa + 33) humanReadableUpdateName];
    id v63 = v62;
    id v108 = v63;
    id v65 = (id)[(objc_class *)v87[4].isa enrolledBetaProgram];
    char v106 = 0;
    if (v65)
    {
      id v107 = (id)[(objc_class *)v87[4].isa enrolledBetaProgram];
      char v106 = 1;
      uint64_t v51 = [v107 programID];
    }
    else
    {
      uint64_t v51 = 0;
    }
    uint64_t v42 = v51;
    id v50 = (id)[(objc_class *)v87[4].isa betaPrograms];
    uint64_t v43 = [v50 count];
    id v49 = (id)[(objc_class *)v87[4].isa currentFullScanOperation];
    id v48 = (id)[(objc_class *)v87[4].isa currentRefreshScanOperation];
    id v47 = (id)[(objc_class *)v87[4].isa currentUpdateOperation];
    id v46 = (id)[(objc_class *)v87[4].isa auxiliaryOperations];
    uint64_t v15 = [v46 count];
    uint64_t v44 = &v17;
    buf = v129;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_66((uint64_t)v129, (uint64_t)v83, (uint64_t)v79, v80, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v71, (uint64_t)v72, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, v55, v56, (uint64_t)v58, v61, (uint64_t)v63, v51, v43,
      (uint64_t)v49,
      (uint64_t)v48,
      (uint64_t)v47,
      v15,
      v127 & 1,
      v125 & 1,
      (uint64_t)v123);
    _os_log_impl(&dword_228401000, log, v77[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Update and Schedule (Update Tonight) operation completed with download result: %d; schedule success: %d; error: %{public}@",
      buf,
      0xF4u);

    if (v106) {
    if (v110)
    }

    if (v112) {
    if (v114)
    }

    if (v116) {
    if (v118)
    }

    id v41 = 0;
    objc_storeStrong(&v108, 0);
    objc_storeStrong(&v109, v41);
    objc_storeStrong(&v120, v41);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v87[4].isa + 25, 0);
  if (v127)
  {
    objc_storeStrong((id *)v87[4].isa + 13, location);
    objc_storeStrong((id *)v87[4].isa + 31, v124);
    id v16 = v87;
    *((unsigned char *)v87[4].isa + 14) = v125 & 1;
    if (*((void *)v16[4].isa + 31)) {
      [*((id *)v87[4].isa + 31) setDelegate:v87[4].isa];
    }
    Class isa = v87[4].isa;
    int v20 = v127;
    id v21 = location;
    int v22 = v125;
    id v23 = v124;
    id v24 = v123;
    id v25 = (id *)&v88;
    uint64_t v88 = MEMORY[0x263EF8330];
    int v89 = -1073741824;
    int v90 = 0;
    char v91 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_349;
    id v92 = &unk_26483BC48;
    id v32 = (id *)v93;
    v93[0] = v87[4].isa;
    int v19 = 1;
    char v94 = v127 & 1;
    id v31 = v25 + 9;
    v93[5] = v87[6].isa;
    uint64_t v30 = v25 + 5;
    v93[1] = location;
    char v95 = v125 & v19;
    uint64_t v29 = v25 + 6;
    void v93[2] = v124;
    uint64_t v28 = v25 + 7;
    v93[3] = v123;
    uint64_t v27 = v25 + 8;
    v93[4] = v87[5].isa;
    [(objc_class *)isa performPostUpdateOperationRefresh:v20 & 1 withDownload:v21 didScheduledUpdate:v22 & 1 autoInstallOperation:v23 error:v24 completionHandler:v25];
    id v33 = 0;
    objc_storeStrong(v27, 0);
    objc_storeStrong(v28, v33);
    objc_storeStrong(v29, v33);
    objc_storeStrong(v30, v33);
    objc_storeStrong(v31, v33);
    objc_storeStrong(v32, v33);
    int v96 = 0;
  }
  else
  {
    if (v87[6].isa)
    {
      id v36 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v36 selectDelegateCallbackQueue:*((void *)v87[4].isa + 5)];
      dispatch_block_t block = &v97;
      uint64_t v97 = MEMORY[0x263EF8330];
      int v98 = -1073741824;
      int v99 = 0;
      id v100 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_348;
      char v101 = &unk_26483BBF8;
      uint64_t v39 = (id *)&v104;
      char v104 = v87[6].isa;
      char v105 = v125 & 1;
      id v38 = (id *)((char *)block + 32);
      id v102 = v124;
      uint64_t v37 = (id *)((char *)block + 40);
      id v103 = v123;
      dispatch_async(queue, block);

      id v40 = 0;
      objc_storeStrong(v37, 0);
      objc_storeStrong(v38, v40);
      objc_storeStrong(v39, v40);
    }
    int v96 = 1;
  }
  id v18 = 0;
  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, v18);
  objc_storeStrong(&location, v18);
}

uint64_t __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_348(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_349(NSObject *a1, char a2)
{
  id v72 = a1;
  id v73 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke_2";
  uint64_t v112 = *MEMORY[0x263EF8340];
  char v110 = a1;
  unsigned __int8 v109 = a2 & 1;
  oslog[1] = a1;
  id v71 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v71 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v66 = type;
    id v67 = SUSettingsUIStateToString([(objc_class *)v72[4].isa currentState]);
    id v68 = v67;
    id v106 = v68;
    uint64_t v69 = [(objc_class *)v72[4].isa currentState];
    id v70 = (id)[(objc_class *)v72[4].isa delegate];
    char v104 = 0;
    char v102 = 0;
    if (v70)
    {
      id v105 = (id)[(objc_class *)v72[4].isa delegate];
      int v63 = 1;
      char v104 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v103 = NSStringFromClass(v2);
      char v102 = 1;
      int v64 = (__CFString *)v103;
    }
    else
    {
      int v64 = @"(null)";
    }
    id v57 = v64;
    id v58 = (id)[(objc_class *)v72[4].isa delegate];
    id v59 = (id)[(objc_class *)v72[4].isa scanError];
    id v60 = (id)[(objc_class *)v72[4].isa preferredStatefulDescriptor];
    id v61 = (id)[(objc_class *)v72[4].isa alternateStatefulDescriptor];
    id v62 = (id)[(objc_class *)v72[4].isa currentDownload];
    char v100 = 0;
    char v98 = 0;
    char v96 = 0;
    if (v62)
    {
      id v101 = (id)[(objc_class *)v72[4].isa currentDownload];
      int v55 = 1;
      char v100 = 1;
      id v99 = (id)[v101 descriptor];
      char v98 = 1;
      id v97 = (id)[v99 humanReadableUpdateName];
      char v96 = 1;
      uint64_t v56 = (__CFString *)v97;
    }
    else
    {
      uint64_t v56 = @"(null)";
    }
    id v41 = v56;
    id v42 = (id)[(objc_class *)v72[4].isa currentDownload];
    char v3 = [(objc_class *)v72[4].isa performThirdPartyScan];
    id v48 = "NO";
    id v4 = "YES";
    id v49 = "YES";
    int v53 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    uint64_t v43 = v4;
    char v5 = [(objc_class *)v72[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v49;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v48;
    }
    uint64_t v44 = v6;
    char v7 = [(objc_class *)v72[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v49;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v48;
    }
    uint64_t v45 = v8;
    id v46 = (id)[*((id *)v72[4].isa + 32) humanReadableUpdateName];
    id v47 = v46;
    id v95 = v47;
    char v9 = [(objc_class *)v72[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v49;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v48;
    }
    uint64_t v50 = v10;
    id v51 = (id)[*((id *)v72[4].isa + 33) humanReadableUpdateName];
    id v52 = v51;
    id location = v52;
    id v54 = (id)[(objc_class *)v72[4].isa enrolledBetaProgram];
    char v92 = 0;
    if (v54)
    {
      id v93 = (id)[(objc_class *)v72[4].isa enrolledBetaProgram];
      char v92 = 1;
      uint64_t v40 = [v93 programID];
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v31 = v40;
    id v32 = (id)[(objc_class *)v72[4].isa betaPrograms];
    uint64_t v33 = [v32 count];
    id v34 = (id)[(objc_class *)v72[4].isa currentFullScanOperation];
    id v35 = (id)[(objc_class *)v72[4].isa currentRefreshScanOperation];
    id v36 = (id)[(objc_class *)v72[4].isa currentUpdateOperation];
    id v37 = (id)[(objc_class *)v72[4].isa auxiliaryOperations];
    uint64_t v38 = [v37 count];
    char isa = (char)v72[10].isa;
    int v39 = 0;
    if (isa) {
      int v39 = v109;
    }
    uint64_t v29 = &v12;
    buf = v111;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v111, (uint64_t)v73, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v31, v33,
      (uint64_t)v34,
      (uint64_t)v35,
      (uint64_t)v36,
      v38,
      v39 & 1);
    _os_log_impl(&dword_228401000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Update Tonight\" with result: %d",
      buf,
      0xE4u);

    if (v92) {
    if (v96)
    }

    if (v98) {
    if (v100)
    }

    if (v102) {
    if (v104)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v95, obj);
    objc_storeStrong(&v106, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v72[9].isa)
  {
    id v22 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v22 selectDelegateCallbackQueue:*((void *)v72[4].isa + 5)];
    dispatch_block_t block = &v80;
    uint64_t v80 = MEMORY[0x263EF8330];
    int v81 = -1073741824;
    int v82 = 0;
    char v83 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_350;
    int v84 = &unk_26483BC20;
    id v26 = (id *)&v88;
    uint64_t v88 = v72[9].isa;
    char v89 = (uint64_t)v72[10].isa & 1;
    char v90 = v109 & 1;
    id v25 = (id *)((char *)block + 32);
    id v85 = v72[5].isa;
    char v91 = BYTE1(v72[10].isa) & 1;
    id v24 = (id *)((char *)block + 40);
    id v86 = v72[6].isa;
    id v23 = (id *)((char *)block + 48);
    char v87 = v72[7].isa;
    dispatch_async(queue, block);

    id v27 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
  }
  Class v15 = v72[4].isa;
  char v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  uint64_t v14 = &v74;
  uint64_t v74 = MEMORY[0x263EF8330];
  int v75 = -1073741824;
  int v76 = 0;
  uint64_t v77 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_351;
  id v78 = &unk_26483BB58;
  id v18 = (id *)v79;
  v79[0] = v72[4].isa;
  uint64_t v17 = (id *)(v14 + 5);
  v79[1] = v72[8].isa;
  id v16 = (id *)(v14 + 6);
  void v79[2] = v72[5].isa;
  [(objc_class *)v15 executeOperationOnDelegate:v13 usingBlock:v14];
  id v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_350(uint64_t a1)
{
  char v2 = 0;
  if (*(unsigned char *)(a1 + 64)) {
    char v2 = *(unsigned char *)(a1 + 65);
  }
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v2 & 1, *(void *)(a1 + 32), *(unsigned char *)(a1 + 66) & 1, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_351(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartDownloadForDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)installUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
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
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  char v13 = &unk_26483BBD0;
  uint64_t v14 = v22;
  id v15 = location[0];
  id v16 = v20;
  id v17 = (id)MEMORY[0x22A697370]();
  [(SUSettingsStatefulUIManager *)v22 beginUpdateOperationWithDescriptor:location[0] operationDelegate:v19 delegateCallbackQueue:v18 operationTypeBlock:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  uint64_t v69 = a1;
  id v68 = "-[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  uint64_t v102 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  id v67 = (id)[(objc_class *)v69[4].isa log];
  oslog[0] = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v62 = type;
    id v63 = SUSettingsUIStateToString([(objc_class *)v69[4].isa currentState]);
    id v64 = v63;
    id v97 = v64;
    uint64_t v65 = [(objc_class *)v69[4].isa currentState];
    id v66 = (id)[(objc_class *)v69[4].isa delegate];
    char v95 = 0;
    char v93 = 0;
    if (v66)
    {
      id v96 = (id)[(objc_class *)v69[4].isa delegate];
      int v59 = 1;
      char v95 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v94 = NSStringFromClass(v2);
      char v93 = 1;
      id v60 = (__CFString *)v94;
    }
    else
    {
      id v60 = @"(null)";
    }
    int v53 = v60;
    id v54 = (id)[(objc_class *)v69[4].isa delegate];
    id v55 = (id)[(objc_class *)v69[4].isa scanError];
    id v56 = (id)[(objc_class *)v69[4].isa preferredStatefulDescriptor];
    id v57 = (id)[(objc_class *)v69[4].isa alternateStatefulDescriptor];
    id v58 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v91 = 0;
    char v89 = 0;
    char v87 = 0;
    if (v58)
    {
      id v92 = (id)[(objc_class *)v69[4].isa currentDownload];
      int v51 = 1;
      char v91 = 1;
      id v90 = (id)[v92 descriptor];
      char v89 = 1;
      id v88 = (id)[v90 humanReadableUpdateName];
      char v87 = 1;
      id v52 = (__CFString *)v88;
    }
    else
    {
      id v52 = @"(null)";
    }
    id v37 = v52;
    id v38 = (id)[(objc_class *)v69[4].isa currentDownload];
    char v3 = [(objc_class *)v69[4].isa performThirdPartyScan];
    uint64_t v44 = "NO";
    id v4 = "YES";
    uint64_t v45 = "YES";
    int v49 = 1;
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    int v39 = v4;
    char v5 = [(objc_class *)v69[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v45;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v44;
    }
    uint64_t v40 = v6;
    char v7 = [(objc_class *)v69[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v41 = v8;
    id v42 = (id)[*((id *)v69[4].isa + 32) humanReadableUpdateName];
    id v43 = v42;
    id v86 = v43;
    char v9 = [(objc_class *)v69[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v46 = v10;
    id v47 = (id)[*((id *)v69[4].isa + 33) humanReadableUpdateName];
    id v48 = v47;
    id v85 = v48;
    id v50 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
    char v83 = 0;
    if (v50)
    {
      id v84 = (id)[(objc_class *)v69[4].isa enrolledBetaProgram];
      char v83 = 1;
      uint64_t v36 = [v84 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v27 = v36;
    id v35 = (id)[(objc_class *)v69[4].isa betaPrograms];
    uint64_t v28 = [v35 count];
    id v34 = (id)[(objc_class *)v69[4].isa currentFullScanOperation];
    id v33 = (id)[(objc_class *)v69[4].isa currentRefreshScanOperation];
    id v32 = (id)[(objc_class *)v69[4].isa currentUpdateOperation];
    id v31 = (id)[(objc_class *)v69[4].isa auxiliaryOperations];
    uint64_t v11 = [v31 count];
    uint64_t isa = (uint64_t)v69[5].isa;
    uint64_t v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to install (Install Now) the update: %{public}@",
      buf,
      0xE8u);

    if (v83) {
    if (v87)
    }

    if (v89) {
    if (v91)
    }

    if (v93) {
    if (v95)
    }

    id obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    id v15 = (id)*((void *)v69[4].isa + 25);
    id v17 = (id)[(objc_class *)v69[5].isa descriptor];
    id v16 = (id)[(objc_class *)v69[4].isa createUpdateOperationOptions];
    uint64_t v14 = &v70;
    uint64_t v70 = MEMORY[0x263EF8330];
    int v71 = -1073741824;
    int v72 = 0;
    id v73 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    uint64_t v74 = &unk_26483BCC0;
    id v20 = (id *)v75;
    v75[0] = v69[4].isa;
    id v19 = (id *)(v14 + 6);
    void v75[2] = v69[6].isa;
    id v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    [v15 installUpdate:v17 withOptions:v16 completionHandler:v14];

    id v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    int v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)v69[4].isa + 5)];
      dispatch_block_t block = &v77;
      uint64_t v77 = MEMORY[0x263EF8330];
      int v78 = -1073741824;
      int v79 = 0;
      uint64_t v80 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_353;
      int v81 = &unk_26483BAE0;
      id v25 = (id *)&v82;
      int v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    int v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_353(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:8102 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj)
{
  int v76 = a1;
  int v75 = "-[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v113 = a1;
  char v112 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = v76;
  id v74 = (id)[(objc_class *)v76[4].isa log];
  oslog[0] = (os_log_t)(id)[v74 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v69 = type;
    id v70 = SUSettingsUIStateToString([(objc_class *)v76[4].isa currentState]);
    id v71 = v70;
    id v108 = v71;
    uint64_t v72 = [(objc_class *)v76[4].isa currentState];
    id v73 = (id)[(objc_class *)v76[4].isa delegate];
    char v106 = 0;
    char v104 = 0;
    if (v73)
    {
      id v107 = (id)[(objc_class *)v76[4].isa delegate];
      int v66 = 1;
      char v106 = 1;
      char v3 = (objc_class *)objc_opt_class();
      id v105 = NSStringFromClass(v3);
      char v104 = 1;
      id v67 = (__CFString *)v105;
    }
    else
    {
      id v67 = @"(null)";
    }
    id v60 = v67;
    id v61 = (id)[(objc_class *)v76[4].isa delegate];
    id v62 = (id)[(objc_class *)v76[4].isa scanError];
    id v63 = (id)[(objc_class *)v76[4].isa preferredStatefulDescriptor];
    id v64 = (id)[(objc_class *)v76[4].isa alternateStatefulDescriptor];
    id v65 = (id)[(objc_class *)v76[4].isa currentDownload];
    char v102 = 0;
    char v100 = 0;
    char v98 = 0;
    if (v65)
    {
      id v103 = (id)[(objc_class *)v76[4].isa currentDownload];
      int v58 = 1;
      char v102 = 1;
      id v101 = (id)[v103 descriptor];
      char v100 = 1;
      id v99 = (id)[v101 humanReadableUpdateName];
      char v98 = 1;
      int v59 = (__CFString *)v99;
    }
    else
    {
      int v59 = @"(null)";
    }
    uint64_t v44 = v59;
    id v45 = (id)[(objc_class *)v76[4].isa currentDownload];
    char v4 = [(objc_class *)v76[4].isa performThirdPartyScan];
    int v51 = "NO";
    char v5 = "YES";
    id v52 = "YES";
    int v56 = 1;
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    uint64_t v46 = v5;
    char v6 = [(objc_class *)v76[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v52;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v51;
    }
    uint64_t v47 = v7;
    char v8 = [(objc_class *)v76[4].isa hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v52;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v51;
    }
    uint64_t v48 = v9;
    id v49 = (id)[*((id *)v76[4].isa + 32) humanReadableUpdateName];
    id v50 = v49;
    id v97 = v50;
    char v10 = [(objc_class *)v76[4].isa hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v52;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v51;
    }
    uint64_t v53 = v11;
    id v54 = (id)[*((id *)v76[4].isa + 33) humanReadableUpdateName];
    id v55 = v54;
    id v96 = v55;
    id v57 = (id)[(objc_class *)v76[4].isa enrolledBetaProgram];
    char v94 = 0;
    if (v57)
    {
      id v95 = (id)[(objc_class *)v76[4].isa enrolledBetaProgram];
      char v94 = 1;
      uint64_t v43 = [v95 programID];
    }
    else
    {
      uint64_t v43 = 0;
    }
    uint64_t v34 = v43;
    id v42 = (id)[(objc_class *)v76[4].isa betaPrograms];
    uint64_t v35 = [v42 count];
    id v41 = (id)[(objc_class *)v76[4].isa currentFullScanOperation];
    id v40 = (id)[(objc_class *)v76[4].isa currentRefreshScanOperation];
    id v39 = (id)[(objc_class *)v76[4].isa currentUpdateOperation];
    id v38 = (id)[(objc_class *)v76[4].isa auxiliaryOperations];
    uint64_t v12 = [v38 count];
    uint64_t v36 = &v13;
    buf = v114;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v114, (uint64_t)v75, (uint64_t)v71, v72, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, v47, v48, (uint64_t)v50, v53, (uint64_t)v55, v43, v35,
      (uint64_t)v41,
      (uint64_t)v40,
      (uint64_t)v39,
      v12,
      v112 & 1,
      (uint64_t)location);
    _os_log_impl(&dword_228401000, log, v69[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Update installation (Install Now) operation completed with download result: %d; error: %{public}@",
      buf,
      0xEEu);

    if (v94) {
    if (v98)
    }

    if (v100) {
    if (v102)
    }

    if (v104) {
    if (v106)
    }

    id obja = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, obja);
    objc_storeStrong(&v108, obja);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v76[4].isa + 25, 0);
  id v93 = (id)[(objc_class *)v76[4].isa targetedUpdateStatefulDescriptor];
  id v28 = v93;
  id v29 = (id)[(objc_class *)v76[4].isa currentDownload];
  int v30 = [v93 updateDownloadable];
  id v31 = (id)[v93 updateDownloadError];
  id v32 = location;
  char v91 = 0;
  if (location)
  {
    id v27 = v32;
  }
  else
  {
    id v92 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:14 userInfo:0];
    char v91 = 1;
    id v27 = v92;
  }
  [v28 updateStateFromConcreteDownload:v29 downloadable:v30 & 1 downloadError:v31 isUpdateReadyForInstallation:0 updateInstallationError:v27 error:location];
  if (v91) {

  }
  if (v76[6].isa)
  {
    id v23 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v23 selectDelegateCallbackQueue:*((void *)v76[4].isa + 5)];
    dispatch_block_t block = &v83;
    uint64_t v83 = MEMORY[0x263EF8330];
    int v84 = -1073741824;
    int v85 = 0;
    id v86 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_354;
    char v87 = &unk_26483BC98;
    id v25 = (id *)&v89;
    char v89 = v76[6].isa;
    char v90 = v112 & 1;
    id v24 = (id *)((char *)block + 32);
    id v88 = location;
    dispatch_async(queue, block);

    id v26 = 0;
    objc_storeStrong(v24, 0);
    objc_storeStrong(v25, v26);
  }
  if (v112)
  {
    Class isa = v76[4].isa;
    id v15 = sel_statefulUIManager_didStartInstallingUpdateWithDescriptor_;
    id v16 = &v77;
    uint64_t v77 = MEMORY[0x263EF8330];
    int v78 = -1073741824;
    int v79 = 0;
    uint64_t v80 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_357;
    int v81 = &unk_26483BAB8;
    id v19 = (id *)v82;
    v82[0] = v76[4].isa;
    id v18 = (id *)(v16 + 5);
    v82[1] = v76[5].isa;
    [(objc_class *)isa executeOperationOnDelegate:v15 usingBlock:v16];
    id v20 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v20);
  }
  id v14 = 0;
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&location, v14);
}

uint64_t __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_354(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_357(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartInstallingUpdateWithDescriptor:*(void *)(a1 + 40)];
}

- (void)scheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  id obj = a4;
  id v189 = a5;
  id v190 = a6;
  char v187 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]";
  uint64_t v261 = *MEMORY[0x263EF8340];
  id v257 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v255 = 0;
  objc_storeStrong(&v255, obj);
  id v254 = 0;
  objc_storeStrong(&v254, v189);
  id v253 = 0;
  objc_storeStrong(&v253, v190);
  id v6 = (id)[v257 currentDownload];
  BOOL v191 = v6 != 0;

  if (v191)
  {
    id v141 = location[0];
    id v143 = (id)[v257 currentDownload];
    id v142 = (id)[v143 descriptor];
    int v144 = objc_msgSend(v141, "isEqualToDescriptor:");

    if (v144)
    {
      id v92 = (id)[v257 log];
      os_log_t v215 = (os_log_t)(id)[v92 oslog];

      os_log_type_t v214 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v86 = v215;
        *(_DWORD *)char v87 = v214;
        id v88 = SUSettingsUIStateToString([v257 currentState]);
        id v89 = v88;
        id v213 = v89;
        uint64_t v90 = [v257 currentState];
        id v91 = (id)[v257 delegate];
        char v211 = 0;
        char v209 = 0;
        if (v91)
        {
          id v212 = (id)[v257 delegate];
          int v84 = 1;
          char v211 = 1;
          id v26 = (objc_class *)objc_opt_class();
          id v210 = NSStringFromClass(v26);
          char v209 = 1;
          int v85 = (__CFString *)v210;
        }
        else
        {
          int v85 = @"(null)";
        }
        int v78 = v85;
        id v79 = (id)[v257 delegate];
        id v80 = (id)[v257 scanError];
        id v81 = (id)[v257 preferredStatefulDescriptor];
        id v82 = (id)[v257 alternateStatefulDescriptor];
        id v83 = (id)[v257 currentDownload];
        char v207 = 0;
        char v205 = 0;
        char v203 = 0;
        if (v83)
        {
          id v208 = (id)[v257 currentDownload];
          int v76 = 1;
          char v207 = 1;
          id v206 = (id)[v208 descriptor];
          char v205 = 1;
          id v204 = (id)[v206 humanReadableUpdateName];
          char v203 = 1;
          uint64_t v77 = (__CFString *)v204;
        }
        else
        {
          uint64_t v77 = @"(null)";
        }
        id v62 = v77;
        id v63 = (id)[v257 currentDownload];
        char v27 = [v257 performThirdPartyScan];
        uint64_t v69 = "NO";
        id v28 = "YES";
        id v70 = "YES";
        int v74 = 1;
        if ((v27 & 1) == 0) {
          id v28 = "NO";
        }
        id v64 = v28;
        char v29 = [v257 isTargetedUpdateScheduledForAutoInstall];
        uint64_t v30 = (uint64_t)v70;
        if ((v29 & 1) == 0) {
          uint64_t v30 = (uint64_t)v69;
        }
        uint64_t v65 = v30;
        char v31 = [v257 hidingPreferredDescriptor];
        uint64_t v32 = (uint64_t)v70;
        if ((v31 & 1) == 0) {
          uint64_t v32 = (uint64_t)v69;
        }
        uint64_t v66 = v32;
        id v67 = (id)[*((id *)v257 + 32) humanReadableUpdateName];
        id v68 = v67;
        id v202 = v68;
        char v33 = [v257 hidingAlternateDescriptor];
        uint64_t v34 = (uint64_t)v70;
        if ((v33 & 1) == 0) {
          uint64_t v34 = (uint64_t)v69;
        }
        uint64_t v71 = v34;
        id v72 = (id)[*((id *)v257 + 33) humanReadableUpdateName];
        id v73 = v72;
        id v201 = v73;
        id v75 = (id)[v257 enrolledBetaProgram];
        char v199 = 0;
        if (v75)
        {
          id v200 = (id)[v257 enrolledBetaProgram];
          char v199 = 1;
          uint64_t v61 = [v200 programID];
        }
        else
        {
          uint64_t v61 = 0;
        }
        uint64_t v52 = v61;
        id v60 = (id)[v257 betaPrograms];
        uint64_t v53 = [v60 count];
        id v59 = (id)[v257 currentFullScanOperation];
        id v58 = (id)[v257 currentRefreshScanOperation];
        id v57 = (id)[v257 currentUpdateOperation];
        id v56 = (id)[v257 auxiliaryOperations];
        uint64_t v35 = [v56 count];
        id v54 = &v37;
        id v55 = v258;
        __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v258, (uint64_t)v187, (uint64_t)v89, v90, (uint64_t)v78, (uint64_t)v79, (uint64_t)v80, (uint64_t)v81, (uint64_t)v82, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, v65, v66, (uint64_t)v68, v71, (uint64_t)v73, v61, v53,
          (uint64_t)v59,
          (uint64_t)v58,
          (uint64_t)v57,
          v35,
          (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, v86, v87[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Starting to schedule (Install Tonight) the update: %{public}@",
          v55,
          0xE8u);

        if (v199) {
        if (v203)
        }

        if (v205) {
        if (v207)
        }

        if (v209) {
        if (v211)
        }

        id v51 = 0;
        objc_storeStrong(&v201, 0);
        objc_storeStrong(&v202, v51);
        objc_storeStrong(&v213, v51);
      }
      objc_storeStrong((id *)&v215, 0);
      id v39 = [SUSettingsUpdateOperation alloc];
      id v41 = (id)[v257 targetedUpdateStatefulDescriptor];
      id v40 = (id)[v41 descriptor];
      uint64_t v36 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v39, "initWithDescriptor:usingSUManagerClient:delegate:");
      id v49 = &v198;
      id v198 = v36;

      [v198 setDelegateCallbackQueue:v253];
      [v198 setCompletionQueue:*((void *)v257 + 21)];
      [*((id *)v257 + 26) addObject:v198];
      id v43 = v198;
      id v45 = (id)[location[0] descriptor];
      id v44 = (id)[v257 createUpdateOperationOptions];
      id v42 = &v192;
      uint64_t v192 = MEMORY[0x263EF8330];
      int v193 = -1073741824;
      int v194 = 0;
      id v195 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
      id v196 = &unk_26483BCE8;
      uint64_t v48 = (id *)v197;
      v197[0] = v257;
      uint64_t v47 = (id *)(v42 + 6);
      v197[2] = v255;
      uint64_t v46 = (id *)(v42 + 5);
      v197[1] = v198;
      [v43 scheduleUpdate:v45 forInstallationTonightWithOptions:v44 completionHandler:v42];

      id v50 = 0;
      objc_storeStrong(v46, 0);
      objc_storeStrong(v47, v50);
      objc_storeStrong(v48, v50);
      objc_storeStrong(v49, v50);
      int v235 = 0;
    }
    else
    {
      id v140 = (id)[v257 log];
      os_log_t v234 = (os_log_t)(id)[v140 oslog];

      os_log_type_t v233 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v134 = v234;
        *(_DWORD *)id v135 = v233;
        id v136 = SUSettingsUIStateToString([v257 currentState]);
        id v137 = v136;
        id v232 = v137;
        uint64_t v138 = [v257 currentState];
        id v139 = (id)[v257 delegate];
        char v230 = 0;
        char v228 = 0;
        if (v139)
        {
          id v231 = (id)[v257 delegate];
          int v132 = 1;
          char v230 = 1;
          id v17 = (objc_class *)objc_opt_class();
          id v229 = NSStringFromClass(v17);
          char v228 = 1;
          id v133 = (__CFString *)v229;
        }
        else
        {
          id v133 = @"(null)";
        }
        id v126 = v133;
        id v127 = (id)[v257 delegate];
        id v128 = (id)[v257 scanError];
        id v129 = (id)[v257 preferredStatefulDescriptor];
        id v130 = (id)[v257 alternateStatefulDescriptor];
        id v131 = (id)[v257 currentDownload];
        char v226 = 0;
        char v224 = 0;
        char v222 = 0;
        if (v131)
        {
          id v227 = (id)[v257 currentDownload];
          int v124 = 1;
          char v226 = 1;
          id v225 = (id)[v227 descriptor];
          char v224 = 1;
          id v223 = (id)[v225 humanReadableUpdateName];
          char v222 = 1;
          unsigned __int8 v125 = (__CFString *)v223;
        }
        else
        {
          unsigned __int8 v125 = @"(null)";
        }
        char v110 = v125;
        id v111 = (id)[v257 currentDownload];
        char v18 = [v257 performThirdPartyScan];
        id v117 = "NO";
        id v19 = "YES";
        char v118 = "YES";
        int v122 = 1;
        if ((v18 & 1) == 0) {
          id v19 = "NO";
        }
        char v112 = v19;
        char v20 = [v257 isTargetedUpdateScheduledForAutoInstall];
        uint64_t v21 = (uint64_t)v118;
        if ((v20 & 1) == 0) {
          uint64_t v21 = (uint64_t)v117;
        }
        uint64_t v113 = v21;
        char v22 = [v257 hidingPreferredDescriptor];
        uint64_t v23 = (uint64_t)v118;
        if ((v22 & 1) == 0) {
          uint64_t v23 = (uint64_t)v117;
        }
        uint64_t v114 = v23;
        id v115 = (id)[*((id *)v257 + 32) humanReadableUpdateName];
        id v116 = v115;
        id v221 = v116;
        char v24 = [v257 hidingAlternateDescriptor];
        uint64_t v25 = (uint64_t)v118;
        if ((v24 & 1) == 0) {
          uint64_t v25 = (uint64_t)v117;
        }
        uint64_t v119 = v25;
        id v120 = (id)[*((id *)v257 + 33) humanReadableUpdateName];
        id v121 = v120;
        id v220 = v121;
        id v123 = (id)[v257 enrolledBetaProgram];
        char v218 = 0;
        if (v123)
        {
          id v219 = (id)[v257 enrolledBetaProgram];
          char v218 = 1;
          uint64_t v109 = [v219 programID];
        }
        else
        {
          uint64_t v109 = 0;
        }
        uint64_t v94 = v109;
        id v108 = (id)[v257 betaPrograms];
        uint64_t v95 = [v108 count];
        id v107 = (id)[v257 currentFullScanOperation];
        id v106 = (id)[v257 currentRefreshScanOperation];
        id v105 = (id)[v257 currentUpdateOperation];
        id v104 = (id)[v257 auxiliaryOperations];
        uint64_t v96 = [v104 count];
        id v103 = (id)[v257 currentDownload];
        id v102 = (id)[v103 descriptor];
        id v101 = (id)[v102 humanReadableUpdateName];
        id v97 = v101;
        id v217 = v97;
        id v100 = (id)[location[0] humanReadableUpdateName];
        id v216 = v100;
        char v98 = &v37;
        id v99 = v259;
        __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v259, (uint64_t)v187, (uint64_t)v137, v138, (uint64_t)v126, (uint64_t)v127, (uint64_t)v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v110, (uint64_t)v111, (uint64_t)v112, v113, v114, (uint64_t)v116, v119, (uint64_t)v121, v109, v95,
          (uint64_t)v107,
          (uint64_t)v106,
          (uint64_t)v105,
          v96,
          (uint64_t)v97,
          (uint64_t)v216);
        _os_log_impl(&dword_228401000, v134, v135[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not schedule the update because the current download points to a different descriptor.\n"
          "\tCurrent Download: %{public}@\n"
          "\tUpdate: %{public}@",
          v99,
          0xF2u);

        if (v218) {
        if (v222)
        }

        if (v224) {
        if (v226)
        }

        if (v228) {
        if (v230)
        }

        id v93 = 0;
        objc_storeStrong(&v216, 0);
        objc_storeStrong(&v217, v93);
        objc_storeStrong(&v220, v93);
        objc_storeStrong(&v221, v93);
        objc_storeStrong(&v232, v93);
      }
      objc_storeStrong((id *)&v234, 0);
      int v235 = 1;
    }
  }
  else
  {
    id v186 = (id)[v257 log];
    osos_log_t log = (os_log_t)(id)[v186 oslog];

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)id v181 = type;
      id v182 = SUSettingsUIStateToString([v257 currentState]);
      id v183 = v182;
      id v250 = v183;
      uint64_t v184 = [v257 currentState];
      id v185 = (id)[v257 delegate];
      char v248 = 0;
      char v246 = 0;
      if (v185)
      {
        id v249 = (id)[v257 delegate];
        int v178 = 1;
        char v248 = 1;
        uint64_t v7 = (objc_class *)objc_opt_class();
        id v247 = NSStringFromClass(v7);
        char v246 = 1;
        id v179 = (__CFString *)v247;
      }
      else
      {
        id v179 = @"(null)";
      }
      uint64_t v172 = v179;
      id v173 = (id)[v257 delegate];
      id v174 = (id)[v257 scanError];
      id v175 = (id)[v257 preferredStatefulDescriptor];
      id v176 = (id)[v257 alternateStatefulDescriptor];
      id v177 = (id)[v257 currentDownload];
      char v244 = 0;
      char v242 = 0;
      char v240 = 0;
      if (v177)
      {
        id v245 = (id)[v257 currentDownload];
        int v170 = 1;
        char v244 = 1;
        id v243 = (id)[v245 descriptor];
        char v242 = 1;
        id v241 = (id)[v243 humanReadableUpdateName];
        char v240 = 1;
        uint64_t v171 = (__CFString *)v241;
      }
      else
      {
        uint64_t v171 = @"(null)";
      }
      id v156 = v171;
      id v157 = (id)[v257 currentDownload];
      char v8 = [v257 performThirdPartyScan];
      id v163 = "NO";
      uint64_t v9 = "YES";
      id v164 = "YES";
      int v168 = 1;
      if ((v8 & 1) == 0) {
        uint64_t v9 = "NO";
      }
      id v158 = v9;
      char v10 = [v257 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v11 = (uint64_t)v164;
      if ((v10 & 1) == 0) {
        uint64_t v11 = (uint64_t)v163;
      }
      uint64_t v159 = v11;
      char v12 = [v257 hidingPreferredDescriptor];
      uint64_t v13 = (uint64_t)v164;
      if ((v12 & 1) == 0) {
        uint64_t v13 = (uint64_t)v163;
      }
      uint64_t v160 = v13;
      id v161 = (id)[*((id *)v257 + 32) humanReadableUpdateName];
      id v162 = v161;
      id v239 = v162;
      char v14 = [v257 hidingAlternateDescriptor];
      uint64_t v15 = (uint64_t)v164;
      if ((v14 & 1) == 0) {
        uint64_t v15 = (uint64_t)v163;
      }
      uint64_t v165 = v15;
      id v166 = (id)[*((id *)v257 + 33) humanReadableUpdateName];
      id v167 = v166;
      id v238 = v167;
      id v169 = (id)[v257 enrolledBetaProgram];
      char v236 = 0;
      if (v169)
      {
        id v237 = (id)[v257 enrolledBetaProgram];
        char v236 = 1;
        uint64_t v155 = [v237 programID];
      }
      else
      {
        uint64_t v155 = 0;
      }
      uint64_t v146 = v155;
      id v154 = (id)[v257 betaPrograms];
      uint64_t v147 = [v154 count];
      id v153 = (id)[v257 currentFullScanOperation];
      id v152 = (id)[v257 currentRefreshScanOperation];
      id v151 = (id)[v257 currentUpdateOperation];
      id v150 = (id)[v257 auxiliaryOperations];
      uint64_t v16 = [v150 count];
      unint64_t v148 = &v37;
      buf = v260;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v260, (uint64_t)v187, (uint64_t)v183, v184, (uint64_t)v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175, (uint64_t)v176, (uint64_t)v156, (uint64_t)v157, (uint64_t)v158, v159, v160, (uint64_t)v162, v165, (uint64_t)v167, v155, v147,
        (uint64_t)v153,
        (uint64_t)v152,
        (uint64_t)v151,
        v16,
        (uint64_t)location[0]);
      _os_log_impl(&dword_228401000, log, v181[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can't schedule update as the current download is nil (and thus no update has been downloaded). You should use do"
        "wnloadAndScheduleUpdate: to do both operations. Update: %{public}@",
        buf,
        0xE8u);

      if (v236) {
      if (v240)
      }

      if (v242) {
      if (v244)
      }

      if (v246) {
      if (v248)
      }

      id v145 = 0;
      objc_storeStrong(&v238, 0);
      objc_storeStrong(&v239, v145);
      objc_storeStrong(&v250, v145);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v235 = 1;
  }
  id v38 = 0;
  objc_storeStrong(&v253, 0);
  objc_storeStrong(&v254, v38);
  objc_storeStrong(&v255, v38);
  objc_storeStrong(location, v38);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, char a2, id obj, void *a4)
{
  id v80 = a1;
  id obja = a4;
  int v78 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v116 = a1;
  unsigned __int8 v115 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v113 = 0;
  objc_storeStrong(&v113, obja);
  oslog[1] = v80;
  id v77 = (id)[(objc_class *)v80[4].isa log];
  oslog[0] = (os_log_t)(id)[v77 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v72 = type;
    id v73 = SUSettingsUIStateToString([(objc_class *)v80[4].isa currentState]);
    id v74 = v73;
    id v110 = v74;
    uint64_t v75 = [(objc_class *)v80[4].isa currentState];
    id v76 = (id)[(objc_class *)v80[4].isa delegate];
    char v108 = 0;
    char v106 = 0;
    if (v76)
    {
      id v109 = (id)[(objc_class *)v80[4].isa delegate];
      int v69 = 1;
      char v108 = 1;
      char v4 = (objc_class *)objc_opt_class();
      id v107 = NSStringFromClass(v4);
      char v106 = 1;
      id v70 = (__CFString *)v107;
    }
    else
    {
      id v70 = @"(null)";
    }
    id v63 = v70;
    id v64 = (id)[(objc_class *)v80[4].isa delegate];
    id v65 = (id)[(objc_class *)v80[4].isa scanError];
    id v66 = (id)[(objc_class *)v80[4].isa preferredStatefulDescriptor];
    id v67 = (id)[(objc_class *)v80[4].isa alternateStatefulDescriptor];
    id v68 = (id)[(objc_class *)v80[4].isa currentDownload];
    char v104 = 0;
    char v102 = 0;
    char v100 = 0;
    if (v68)
    {
      id v105 = (id)[(objc_class *)v80[4].isa currentDownload];
      int v61 = 1;
      char v104 = 1;
      id v103 = (id)[v105 descriptor];
      char v102 = 1;
      id v101 = (id)[v103 humanReadableUpdateName];
      char v100 = 1;
      id v62 = (__CFString *)v101;
    }
    else
    {
      id v62 = @"(null)";
    }
    uint64_t v47 = v62;
    id v48 = (id)[(objc_class *)v80[4].isa currentDownload];
    char v5 = [(objc_class *)v80[4].isa performThirdPartyScan];
    id v54 = "NO";
    id v6 = "YES";
    id v55 = "YES";
    int v59 = 1;
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    id v49 = v6;
    char v7 = [(objc_class *)v80[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v55;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v54;
    }
    uint64_t v50 = v8;
    char v9 = [(objc_class *)v80[4].isa hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v55;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v54;
    }
    uint64_t v51 = v10;
    id v52 = (id)[*((id *)v80[4].isa + 32) humanReadableUpdateName];
    id v53 = v52;
    id v99 = v53;
    char v11 = [(objc_class *)v80[4].isa hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v55;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v54;
    }
    uint64_t v56 = v12;
    id v57 = (id)[*((id *)v80[4].isa + 33) humanReadableUpdateName];
    id v58 = v57;
    id v98 = v58;
    id v60 = (id)[(objc_class *)v80[4].isa enrolledBetaProgram];
    char v96 = 0;
    if (v60)
    {
      id v97 = (id)[(objc_class *)v80[4].isa enrolledBetaProgram];
      char v96 = 1;
      uint64_t v46 = [v97 programID];
    }
    else
    {
      uint64_t v46 = 0;
    }
    uint64_t v37 = v46;
    id v45 = (id)[(objc_class *)v80[4].isa betaPrograms];
    uint64_t v38 = [v45 count];
    id v44 = (id)[(objc_class *)v80[4].isa currentFullScanOperation];
    id v43 = (id)[(objc_class *)v80[4].isa currentRefreshScanOperation];
    id v42 = (id)[(objc_class *)v80[4].isa currentUpdateOperation];
    id v41 = (id)[(objc_class *)v80[4].isa auxiliaryOperations];
    uint64_t v13 = [v41 count];
    id v39 = &v15;
    buf = v117;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v117, (uint64_t)v78, (uint64_t)v74, v75, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, v50, v51, (uint64_t)v53, v56, (uint64_t)v58, v46, v38,
      (uint64_t)v44,
      (uint64_t)v43,
      (uint64_t)v42,
      v13,
      v115 & 1,
      (uint64_t)v113);
    _os_log_impl(&dword_228401000, log, v72[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Schedule (Install Tonight) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if (v96) {
    if (v100)
    }

    if (v102) {
    if (v104)
    }

    if (v106) {
    if (v108)
    }

    id v36 = 0;
    objc_storeStrong(&v98, 0);
    objc_storeStrong(&v99, v36);
    objc_storeStrong(&v110, v36);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v80[4].isa + 25, 0);
  if (v115)
  {
    objc_storeStrong((id *)v80[4].isa + 31, location);
    char v14 = v80;
    *((unsigned char *)v80[4].isa + 14) = v115 & 1;
    if (*((void *)v14[4].isa + 31)) {
      [*((id *)v80[4].isa + 31) setDelegate:v80[4].isa];
    }
    Class isa = v80[4].isa;
    id v23 = (id)[(objc_class *)v80[4].isa currentDownload];
    int v18 = v115;
    id v19 = location;
    id v20 = v113;
    uint64_t v21 = (id *)&v81;
    uint64_t v81 = MEMORY[0x263EF8330];
    int v82 = -1073741824;
    int v83 = 0;
    int v84 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    int v85 = &unk_26483BB80;
    id v28 = (id *)v86;
    v86[0] = v80[4].isa;
    int v17 = 1;
    char v87 = v115 & 1;
    char v27 = v21 + 8;
    v86[4] = v80[6].isa;
    id v26 = v21 + 5;
    v86[1] = location;
    uint64_t v25 = v21 + 6;
    void v86[2] = v113;
    char v24 = v21 + 7;
    v86[3] = v80[5].isa;
    [(objc_class *)isa performPostUpdateOperationRefresh:v17 & 1 withDownload:v23 didScheduledUpdate:v18 & 1 autoInstallOperation:v19 error:v20 completionHandler:v21];

    id v29 = 0;
    objc_storeStrong(v24, 0);
    objc_storeStrong(v25, v29);
    objc_storeStrong(v26, v29);
    objc_storeStrong(v27, v29);
    objc_storeStrong(v28, v29);
    int v88 = 0;
  }
  else
  {
    if (v80[6].isa)
    {
      id v32 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v32 selectDelegateCallbackQueue:*((void *)v80[4].isa + 5)];
      dispatch_block_t block = &v89;
      uint64_t v89 = MEMORY[0x263EF8330];
      int v90 = -1073741824;
      int v91 = 0;
      id v92 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_360;
      id v93 = &unk_26483BB08;
      uint64_t v34 = (id *)&v95;
      uint64_t v95 = v80[6].isa;
      char v33 = (id *)((char *)block + 32);
      id v94 = v113;
      dispatch_async(queue, block);

      id v35 = 0;
      objc_storeStrong(v33, 0);
      objc_storeStrong(v34, v35);
    }
    int v88 = 1;
  }
  id v16 = 0;
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&location, v16);
}

uint64_t __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_360(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2)
{
  id v67 = a1;
  id v68 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  uint64_t v104 = *MEMORY[0x263EF8340];
  char v102 = a1;
  char v101 = a2 & 1;
  oslog[1] = a1;
  id v66 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v66 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)int v61 = type;
    id v62 = SUSettingsUIStateToString([(objc_class *)v67[4].isa currentState]);
    id v63 = v62;
    id v98 = v63;
    uint64_t v64 = [(objc_class *)v67[4].isa currentState];
    id v65 = (id)[(objc_class *)v67[4].isa delegate];
    char v96 = 0;
    char v94 = 0;
    if (v65)
    {
      id v97 = (id)[(objc_class *)v67[4].isa delegate];
      int v58 = 1;
      char v96 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v95 = NSStringFromClass(v2);
      char v94 = 1;
      int v59 = (__CFString *)v95;
    }
    else
    {
      int v59 = @"(null)";
    }
    id v52 = v59;
    id v53 = (id)[(objc_class *)v67[4].isa delegate];
    id v54 = (id)[(objc_class *)v67[4].isa scanError];
    id v55 = (id)[(objc_class *)v67[4].isa preferredStatefulDescriptor];
    id v56 = (id)[(objc_class *)v67[4].isa alternateStatefulDescriptor];
    id v57 = (id)[(objc_class *)v67[4].isa currentDownload];
    char v92 = 0;
    char v90 = 0;
    char v88 = 0;
    if (v57)
    {
      id v93 = (id)[(objc_class *)v67[4].isa currentDownload];
      int v50 = 1;
      char v92 = 1;
      id v91 = (id)[v93 descriptor];
      char v90 = 1;
      id v89 = (id)[v91 humanReadableUpdateName];
      char v88 = 1;
      uint64_t v51 = (__CFString *)v89;
    }
    else
    {
      uint64_t v51 = @"(null)";
    }
    id v36 = v51;
    id v37 = (id)[(objc_class *)v67[4].isa currentDownload];
    char v3 = [(objc_class *)v67[4].isa performThirdPartyScan];
    id v43 = "NO";
    char v4 = "YES";
    id v44 = "YES";
    int v48 = 1;
    if ((v3 & 1) == 0) {
      char v4 = "NO";
    }
    uint64_t v38 = v4;
    char v5 = [(objc_class *)v67[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v44;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v43;
    }
    uint64_t v39 = v6;
    char v7 = [(objc_class *)v67[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v44;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v43;
    }
    uint64_t v40 = v8;
    id v41 = (id)[*((id *)v67[4].isa + 32) humanReadableUpdateName];
    id v42 = v41;
    id v87 = v42;
    char v9 = [(objc_class *)v67[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v44;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v43;
    }
    uint64_t v45 = v10;
    id v46 = (id)[*((id *)v67[4].isa + 33) humanReadableUpdateName];
    id v47 = v46;
    id location = v47;
    id v49 = (id)[(objc_class *)v67[4].isa enrolledBetaProgram];
    char v84 = 0;
    if (v49)
    {
      id v85 = (id)[(objc_class *)v67[4].isa enrolledBetaProgram];
      char v84 = 1;
      uint64_t v35 = [v85 programID];
    }
    else
    {
      uint64_t v35 = 0;
    }
    uint64_t v26 = v35;
    id v34 = (id)[(objc_class *)v67[4].isa betaPrograms];
    uint64_t v27 = [v34 count];
    id v33 = (id)[(objc_class *)v67[4].isa currentFullScanOperation];
    id v32 = (id)[(objc_class *)v67[4].isa currentRefreshScanOperation];
    id v31 = (id)[(objc_class *)v67[4].isa currentUpdateOperation];
    id v30 = (id)[(objc_class *)v67[4].isa auxiliaryOperations];
    uint64_t v11 = [v30 count];
    int v12 = (uint64_t)v67[9].isa & 1;
    id v28 = &v13;
    buf = v103;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v103, (uint64_t)v68, (uint64_t)v63, v64, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v39, v40, (uint64_t)v42, v45, (uint64_t)v47, v35, v27,
      (uint64_t)v33,
      (uint64_t)v32,
      (uint64_t)v31,
      v11,
      v12);
    _os_log_impl(&dword_228401000, log, v61[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Install Tonight\" with result: %d",
      buf,
      0xE4u);

    if (v84) {
    if (v88)
    }

    if (v90) {
    if (v92)
    }

    if (v94) {
    if (v96)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v87, obj);
    objc_storeStrong(&v98, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v67[8].isa)
  {
    id v20 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v20 selectDelegateCallbackQueue:*((void *)v67[4].isa + 5)];
    dispatch_block_t block = &v75;
    uint64_t v75 = MEMORY[0x263EF8330];
    int v76 = -1073741824;
    int v77 = 0;
    int v78 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_361;
    id v79 = &unk_26483BBF8;
    id v23 = (id *)&v82;
    int v82 = v67[8].isa;
    char v83 = (uint64_t)v67[9].isa & 1;
    char v22 = (id *)((char *)block + 32);
    id v80 = v67[5].isa;
    uint64_t v21 = (id *)((char *)block + 40);
    uint64_t v81 = v67[6].isa;
    dispatch_async(queue, block);

    id v24 = 0;
    objc_storeStrong(v21, 0);
    objc_storeStrong(v22, v24);
    objc_storeStrong(v23, v24);
  }
  Class isa = v67[4].isa;
  char v14 = sel_statefulUIManagerDidRefreshState_;
  uint64_t v15 = &v69;
  uint64_t v69 = MEMORY[0x263EF8330];
  int v70 = -1073741824;
  int v71 = 0;
  id v72 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_362;
  id v73 = &unk_26483BA90;
  int v17 = (id *)&v74;
  id v74 = v67[4].isa;
  [(objc_class *)isa executeOperationOnDelegate:v14 usingBlock:v15];
  [*((id *)v67[4].isa + 26) removeObject:v67[7].isa];
  objc_storeStrong(v17, 0);
}

uint64_t __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_361(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56) & 1);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_362(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (void)promoteTargetedUpdateToUserInitiatedStatus
{
  id v62 = "-[SUSettingsStatefulUIManager promoteTargetedUpdateToUserInitiatedStatus]";
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v89 = self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(SUSettingsStatefulUIManager *)self currentDownload];
  BOOL v63 = v2 != 0;

  if (v63)
  {
    uint64_t v13 = [SUSettingsUpdateOperation alloc];
    id v15 = (id)[v89 targetedUpdateStatefulDescriptor];
    id v14 = (id)[v15 descriptor];
    id v19 = 0;
    int v18 = &v71;
    id v71 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v13, "initWithDescriptor:usingSUManagerClient:delegate:");

    [v71 setDelegateCallbackQueue:*((void *)v89 + 21)];
    [v71 setCompletionQueue:*((void *)v89 + 21)];
    [*((id *)v89 + 26) addObject:v71];
    id v16 = v71;
    id v17 = (id)[v89 currentDownload];
    uint64_t v64 = MEMORY[0x263EF8330];
    int v65 = -1073741824;
    int v66 = 0;
    id v67 = __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke;
    id v68 = &unk_26483BD10;
    id v69 = v89;
    id v70 = v71;
    [v16 promoteDownloadToUserInitiated:v17 completionHandler:&v64];

    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    id v61 = (id)[v89 log];
    oslog[0] = (os_log_t)(id)[v61 oslog];

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog[0];
      *(_DWORD *)id v56 = type;
      id v57 = SUSettingsUIStateToString([v89 currentState]);
      id v58 = v57;
      id v86 = v58;
      uint64_t v59 = [v89 currentState];
      id v60 = (id)[v89 delegate];
      char v84 = 0;
      char v82 = 0;
      if (v60)
      {
        id v85 = (id)[v89 delegate];
        int v53 = 1;
        char v84 = 1;
        char v3 = (objc_class *)objc_opt_class();
        id v83 = NSStringFromClass(v3);
        char v82 = 1;
        id v54 = (__CFString *)v83;
      }
      else
      {
        id v54 = @"(null)";
      }
      id v47 = v54;
      id v48 = (id)[v89 delegate];
      id v49 = (id)[v89 scanError];
      id v50 = (id)[v89 preferredStatefulDescriptor];
      id v51 = (id)[v89 alternateStatefulDescriptor];
      id v52 = (id)[v89 currentDownload];
      char v80 = 0;
      char v78 = 0;
      char v76 = 0;
      if (v52)
      {
        id v81 = (id)[v89 currentDownload];
        int v45 = 1;
        char v80 = 1;
        id v79 = (id)[v81 descriptor];
        char v78 = 1;
        id v77 = (id)[v79 humanReadableUpdateName];
        char v76 = 1;
        id v46 = (__CFString *)v77;
      }
      else
      {
        id v46 = @"(null)";
      }
      id v31 = v46;
      id v32 = (id)[v89 currentDownload];
      char v4 = [v89 performThirdPartyScan];
      uint64_t v38 = "NO";
      char v5 = "YES";
      uint64_t v39 = "YES";
      int v43 = 1;
      if ((v4 & 1) == 0) {
        char v5 = "NO";
      }
      id v33 = v5;
      char v6 = [v89 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v7 = (uint64_t)v39;
      if ((v6 & 1) == 0) {
        uint64_t v7 = (uint64_t)v38;
      }
      uint64_t v34 = v7;
      char v8 = [v89 hidingPreferredDescriptor];
      uint64_t v9 = (uint64_t)v39;
      if ((v8 & 1) == 0) {
        uint64_t v9 = (uint64_t)v38;
      }
      uint64_t v35 = v9;
      id v36 = (id)[*((id *)v89 + 32) humanReadableUpdateName];
      id v37 = v36;
      id v75 = v37;
      char v10 = [v89 hidingAlternateDescriptor];
      uint64_t v11 = (uint64_t)v39;
      if ((v10 & 1) == 0) {
        uint64_t v11 = (uint64_t)v38;
      }
      uint64_t v40 = v11;
      id v41 = (id)[*((id *)v89 + 33) humanReadableUpdateName];
      id v42 = v41;
      id location = v42;
      id v44 = (id)[v89 enrolledBetaProgram];
      char v72 = 0;
      if (v44)
      {
        id v73 = (id)[v89 enrolledBetaProgram];
        char v72 = 1;
        uint64_t v30 = [v73 programID];
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v21 = v30;
      id v29 = (id)[v89 betaPrograms];
      uint64_t v22 = [v29 count];
      id v28 = (id)[v89 currentFullScanOperation];
      id v27 = (id)[v89 currentRefreshScanOperation];
      id v26 = (id)[v89 currentUpdateOperation];
      id v25 = (id)[v89 auxiliaryOperations];
      id v23 = &v12;
      buf = v90;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v90, (uint64_t)v62, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
        (uint64_t)v28,
        (uint64_t)v27,
        (uint64_t)v26,
        [v25 count]);
      _os_log_impl(&dword_228401000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can not promote the initial status of a nil targeted update.",
        buf,
        0xDEu);

      if (v72) {
      if (v76)
      }

      if (v78) {
      if (v80)
      }

      if (v82) {
      if (v84)
      }

      id obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v75, obj);
      objc_storeStrong(&v86, obj);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

void __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke(NSObject *a1, void *a2, int a3, void *a4)
{
  id v67 = a1;
  int v65 = a3;
  id obj = a4;
  uint64_t v64 = "-[SUSettingsStatefulUIManager promoteTargetedUpdateToUserInitiatedStatus]_block_invoke";
  uint64_t v95 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v92 = v65 & 1;
  id v91 = 0;
  objc_storeStrong(&v91, obj);
  oslog[1] = v67;
  id v63 = (id)[(objc_class *)v67[4].isa log];
  oslog[0] = (os_log_t)(id)[v63 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v58 = type;
    id v59 = SUSettingsUIStateToString([(objc_class *)v67[4].isa currentState]);
    id v60 = v59;
    id v88 = v60;
    uint64_t v61 = [(objc_class *)v67[4].isa currentState];
    id v62 = (id)[(objc_class *)v67[4].isa delegate];
    char v86 = 0;
    char v84 = 0;
    if (v62)
    {
      id v87 = (id)[(objc_class *)v67[4].isa delegate];
      int v55 = 1;
      char v86 = 1;
      char v4 = (objc_class *)objc_opt_class();
      id v85 = NSStringFromClass(v4);
      char v84 = 1;
      id v56 = (__CFString *)v85;
    }
    else
    {
      id v56 = @"(null)";
    }
    id v49 = v56;
    id v50 = (id)[(objc_class *)v67[4].isa delegate];
    id v51 = (id)[(objc_class *)v67[4].isa scanError];
    id v52 = (id)[(objc_class *)v67[4].isa preferredStatefulDescriptor];
    id v53 = (id)[(objc_class *)v67[4].isa alternateStatefulDescriptor];
    id v54 = (id)[(objc_class *)v67[4].isa currentDownload];
    char v82 = 0;
    char v80 = 0;
    char v78 = 0;
    if (v54)
    {
      id v83 = (id)[(objc_class *)v67[4].isa currentDownload];
      int v47 = 1;
      char v82 = 1;
      id v81 = (id)[v83 descriptor];
      char v80 = 1;
      id v79 = (id)[v81 humanReadableUpdateName];
      char v78 = 1;
      id v48 = (__CFString *)v79;
    }
    else
    {
      id v48 = @"(null)";
    }
    id v33 = v48;
    id v34 = (id)[(objc_class *)v67[4].isa currentDownload];
    char v5 = [(objc_class *)v67[4].isa performThirdPartyScan];
    uint64_t v40 = "NO";
    char v6 = "YES";
    id v41 = "YES";
    int v45 = 1;
    if ((v5 & 1) == 0) {
      char v6 = "NO";
    }
    uint64_t v35 = v6;
    char v7 = [(objc_class *)v67[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v41;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v40;
    }
    uint64_t v36 = v8;
    char v9 = [(objc_class *)v67[4].isa hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v41;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v40;
    }
    uint64_t v37 = v10;
    id v38 = (id)[*((id *)v67[4].isa + 32) humanReadableUpdateName];
    id v39 = v38;
    id v77 = v39;
    char v11 = [(objc_class *)v67[4].isa hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v41;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v40;
    }
    uint64_t v42 = v12;
    id v43 = (id)[*((id *)v67[4].isa + 33) humanReadableUpdateName];
    id v44 = v43;
    id v76 = v44;
    id v46 = (id)[(objc_class *)v67[4].isa enrolledBetaProgram];
    char v74 = 0;
    if (v46)
    {
      id v75 = (id)[(objc_class *)v67[4].isa enrolledBetaProgram];
      char v74 = 1;
      uint64_t v32 = [v75 programID];
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v23 = v32;
    id v31 = (id)[(objc_class *)v67[4].isa betaPrograms];
    uint64_t v24 = [v31 count];
    id v30 = (id)[(objc_class *)v67[4].isa currentFullScanOperation];
    id v29 = (id)[(objc_class *)v67[4].isa currentRefreshScanOperation];
    id v28 = (id)[(objc_class *)v67[4].isa currentUpdateOperation];
    id v27 = (id)[(objc_class *)v67[4].isa auxiliaryOperations];
    uint64_t v13 = [v27 count];
    if (v92) {
      id v14 = "succeeded";
    }
    else {
      id v14 = "failed";
    }
    id v25 = &v15;
    buf = v94;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66((uint64_t)v94, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v23, v24,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v13,
      (uint64_t)v14,
      (uint64_t)v91);
    _os_log_impl(&dword_228401000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Promote targeted update to user initiated status: %{public}s; error: %{public}@",
      buf,
      0xF2u);

    if (v74) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    id v22 = 0;
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v77, v22);
    objc_storeStrong(&v88, v22);
  }
  objc_storeStrong((id *)oslog, 0);
  id v20 = location;
  [(objc_class *)v67[4].isa setCurrentDownload:location[0]];
  Class isa = v67[4].isa;
  id v16 = sel_statefulUIManagerDidRefreshState_;
  id v17 = &v68;
  uint64_t v68 = MEMORY[0x263EF8330];
  int v69 = -1073741824;
  int v70 = 0;
  id v71 = __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke_366;
  char v72 = &unk_26483BA90;
  id v19 = (id *)&v73;
  id v73 = v67[4].isa;
  [(objc_class *)isa executeOperationOnDelegate:v16 usingBlock:v17];
  [*((id *)v67[4].isa + 26) removeObject:v67[5].isa];
  id v21 = 0;
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v91, v21);
  objc_storeStrong(v20, v21);
}

void __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke_366(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (void)unscheduleTargetedUpdateAutomaticInstallation
{
  unsigned __int8 v115 = "-[SUSettingsStatefulUIManager unscheduleTargetedUpdateAutomaticInstallation]";
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v159 = self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(SUSettingsStatefulUIManager *)self currentDownload];
  BOOL v116 = v2 != 0;

  if (v116)
  {
    id v12 = (id)[v159 currentAutoInstallOperation];
    BOOL v72 = v12 != 0;

    if (v72)
    {
      uint64_t v23 = [SUSettingsUpdateOperation alloc];
      id v25 = (id)[v159 targetedUpdateStatefulDescriptor];
      id v24 = (id)[v25 descriptor];
      id v29 = 0;
      id v28 = &v124;
      id v124 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v23, "initWithDescriptor:usingSUManagerClient:delegate:");

      [v124 setDelegateCallbackQueue:*((void *)v159 + 21)];
      [v124 setCompletionQueue:*((void *)v159 + 21)];
      [*((id *)v159 + 26) addObject:v124];
      id v26 = v124;
      id v27 = (id)[v159 currentAutoInstallOperation];
      uint64_t v117 = MEMORY[0x263EF8330];
      int v118 = -1073741824;
      int v119 = 0;
      id v120 = __76__SUSettingsStatefulUIManager_unscheduleTargetedUpdateAutomaticInstallation__block_invoke;
      id v121 = &unk_26483BD38;
      id v122 = v159;
      id v123 = v124;
      [v26 unscheduleAutomaticInstallation:v27 completionHandler:&v117];

      objc_storeStrong(&v123, 0);
      objc_storeStrong(&v122, 0);
      objc_storeStrong(&v124, 0);
    }
    else
    {
      id v71 = (id)[v159 log];
      os_log_t v141 = (os_log_t)(id)[v71 oslog];

      os_log_type_t v140 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v65 = v141;
        *(_DWORD *)int v66 = v140;
        id v67 = SUSettingsUIStateToString([v159 currentState]);
        id v68 = v67;
        id v139 = v68;
        uint64_t v69 = [v159 currentState];
        id v70 = (id)[v159 delegate];
        char v137 = 0;
        char v135 = 0;
        if (v70)
        {
          id v138 = (id)[v159 delegate];
          int v63 = 1;
          char v137 = 1;
          uint64_t v13 = (objc_class *)objc_opt_class();
          id v136 = NSStringFromClass(v13);
          char v135 = 1;
          uint64_t v64 = (__CFString *)v136;
        }
        else
        {
          uint64_t v64 = @"(null)";
        }
        id v57 = v64;
        id v58 = (id)[v159 delegate];
        id v59 = (id)[v159 scanError];
        id v60 = (id)[v159 preferredStatefulDescriptor];
        id v61 = (id)[v159 alternateStatefulDescriptor];
        id v62 = (id)[v159 currentDownload];
        char v133 = 0;
        char v131 = 0;
        char v129 = 0;
        if (v62)
        {
          id v134 = (id)[v159 currentDownload];
          int v55 = 1;
          char v133 = 1;
          id v132 = (id)[v134 descriptor];
          char v131 = 1;
          id v130 = (id)[v132 humanReadableUpdateName];
          char v129 = 1;
          id v56 = (__CFString *)v130;
        }
        else
        {
          id v56 = @"(null)";
        }
        id v41 = v56;
        id v42 = (id)[v159 currentDownload];
        char v14 = [v159 performThirdPartyScan];
        id v48 = "NO";
        uint64_t v15 = "YES";
        id v49 = "YES";
        int v53 = 1;
        if ((v14 & 1) == 0) {
          uint64_t v15 = "NO";
        }
        id v43 = v15;
        char v16 = [v159 isTargetedUpdateScheduledForAutoInstall];
        uint64_t v17 = (uint64_t)v49;
        if ((v16 & 1) == 0) {
          uint64_t v17 = (uint64_t)v48;
        }
        uint64_t v44 = v17;
        char v18 = [v159 hidingPreferredDescriptor];
        uint64_t v19 = (uint64_t)v49;
        if ((v18 & 1) == 0) {
          uint64_t v19 = (uint64_t)v48;
        }
        uint64_t v45 = v19;
        id v46 = (id)[*((id *)v159 + 32) humanReadableUpdateName];
        id v47 = v46;
        id v128 = v47;
        char v20 = [v159 hidingAlternateDescriptor];
        uint64_t v21 = (uint64_t)v49;
        if ((v20 & 1) == 0) {
          uint64_t v21 = (uint64_t)v48;
        }
        uint64_t v50 = v21;
        id v51 = (id)[*((id *)v159 + 33) humanReadableUpdateName];
        id v52 = v51;
        id v127 = v52;
        id v54 = (id)[v159 enrolledBetaProgram];
        char v125 = 0;
        if (v54)
        {
          id v126 = (id)[v159 enrolledBetaProgram];
          char v125 = 1;
          uint64_t v40 = [v126 programID];
        }
        else
        {
          uint64_t v40 = 0;
        }
        uint64_t v31 = v40;
        id v39 = (id)[v159 betaPrograms];
        uint64_t v32 = [v39 count];
        id v38 = (id)[v159 currentFullScanOperation];
        id v37 = (id)[v159 currentRefreshScanOperation];
        id v36 = (id)[v159 currentUpdateOperation];
        id v35 = (id)[v159 auxiliaryOperations];
        id v33 = &v22;
        id v34 = v160;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v160, (uint64_t)v115, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v32,
          (uint64_t)v38,
          (uint64_t)v37,
          (uint64_t)v36,
          [v35 count]);
        _os_log_impl(&dword_228401000, v65, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not unschedule an update when the auto-install operation is nil.",
          v34,
          0xDEu);

        if (v125) {
        if (v129)
        }

        if (v131) {
        if (v133)
        }

        if (v135) {
        if (v137)
        }

        id v30 = 0;
        objc_storeStrong(&v127, 0);
        objc_storeStrong(&v128, v30);
        objc_storeStrong(&v139, v30);
      }
      objc_storeStrong((id *)&v141, 0);
    }
  }
  else
  {
    id v114 = (id)[v159 log];
    oslog[0] = (os_log_t)(id)[v114 oslog];

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog[0];
      *(_DWORD *)id v109 = type;
      id v110 = SUSettingsUIStateToString([v159 currentState]);
      id v111 = v110;
      id v156 = v111;
      uint64_t v112 = [v159 currentState];
      id v113 = (id)[v159 delegate];
      char v154 = 0;
      char v152 = 0;
      if (v113)
      {
        id v155 = (id)[v159 delegate];
        int v106 = 1;
        char v154 = 1;
        char v3 = (objc_class *)objc_opt_class();
        id v153 = NSStringFromClass(v3);
        char v152 = 1;
        id v107 = (__CFString *)v153;
      }
      else
      {
        id v107 = @"(null)";
      }
      char v100 = v107;
      id v101 = (id)[v159 delegate];
      id v102 = (id)[v159 scanError];
      id v103 = (id)[v159 preferredStatefulDescriptor];
      id v104 = (id)[v159 alternateStatefulDescriptor];
      id v105 = (id)[v159 currentDownload];
      char v150 = 0;
      char v148 = 0;
      char v146 = 0;
      if (v105)
      {
        id v151 = (id)[v159 currentDownload];
        int v98 = 1;
        char v150 = 1;
        id v149 = (id)[v151 descriptor];
        char v148 = 1;
        id v147 = (id)[v149 humanReadableUpdateName];
        char v146 = 1;
        id v99 = (__CFString *)v147;
      }
      else
      {
        id v99 = @"(null)";
      }
      char v84 = v99;
      id v85 = (id)[v159 currentDownload];
      char v4 = [v159 performThirdPartyScan];
      id v91 = "NO";
      char v5 = "YES";
      char v92 = "YES";
      int v96 = 1;
      if ((v4 & 1) == 0) {
        char v5 = "NO";
      }
      char v86 = v5;
      char v6 = [v159 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v7 = (uint64_t)v92;
      if ((v6 & 1) == 0) {
        uint64_t v7 = (uint64_t)v91;
      }
      uint64_t v87 = v7;
      char v8 = [v159 hidingPreferredDescriptor];
      uint64_t v9 = (uint64_t)v92;
      if ((v8 & 1) == 0) {
        uint64_t v9 = (uint64_t)v91;
      }
      uint64_t v88 = v9;
      id v89 = (id)[*((id *)v159 + 32) humanReadableUpdateName];
      id v90 = v89;
      id v145 = v90;
      char v10 = [v159 hidingAlternateDescriptor];
      uint64_t v11 = (uint64_t)v92;
      if ((v10 & 1) == 0) {
        uint64_t v11 = (uint64_t)v91;
      }
      uint64_t v93 = v11;
      id v94 = (id)[*((id *)v159 + 33) humanReadableUpdateName];
      id v95 = v94;
      id location = v95;
      id v97 = (id)[v159 enrolledBetaProgram];
      char v142 = 0;
      if (v97)
      {
        id v143 = (id)[v159 enrolledBetaProgram];
        char v142 = 1;
        uint64_t v83 = [v143 programID];
      }
      else
      {
        uint64_t v83 = 0;
      }
      uint64_t v74 = v83;
      id v82 = (id)[v159 betaPrograms];
      uint64_t v75 = [v82 count];
      id v81 = (id)[v159 currentFullScanOperation];
      id v80 = (id)[v159 currentRefreshScanOperation];
      id v79 = (id)[v159 currentUpdateOperation];
      id v78 = (id)[v159 auxiliaryOperations];
      id v76 = &v22;
      buf = v161;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v161, (uint64_t)v115, (uint64_t)v111, v112, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v103, (uint64_t)v104, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, v87, v88, (uint64_t)v90, v93, (uint64_t)v95, v83, v75,
        (uint64_t)v81,
        (uint64_t)v80,
        (uint64_t)v79,
        [v78 count]);
      _os_log_impl(&dword_228401000, log, v109[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can not unschedule an update without having the current download object.",
        buf,
        0xDEu);

      if (v142) {
      if (v146)
      }

      if (v148) {
      if (v150)
      }

      if (v152) {
      if (v154)
      }

      id obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v145, obj);
      objc_storeStrong(&v156, obj);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

void __76__SUSettingsStatefulUIManager_unscheduleTargetedUpdateAutomaticInstallation__block_invoke(uint64_t a1, char a2, id obj)
{
  id v60 = &v78;
  uint64_t v59 = a1;
  id v58 = "-[SUSettingsStatefulUIManager unscheduleTargetedUpdateAutomaticInstallation]_block_invoke";
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v81 = a1;
  char v80 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v78 = v59;
  id v57 = (id)[*(id *)(v59 + 32) log];
  osos_log_t log = (os_log_t)(id)[v57 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v52 = type;
    id v53 = SUSettingsUIStateToString([*(id *)(v59 + 32) currentState]);
    id v54 = v53;
    id v75 = v54;
    uint64_t v55 = [*(id *)(v59 + 32) currentState];
    id v56 = (id)[*(id *)(v59 + 32) delegate];
    char v73 = 0;
    char v71 = 0;
    if (v56)
    {
      id v74 = (id)[*(id *)(v59 + 32) delegate];
      int v49 = 1;
      char v73 = 1;
      char v3 = (objc_class *)objc_opt_class();
      id v72 = NSStringFromClass(v3);
      char v71 = 1;
      uint64_t v50 = (__CFString *)v72;
    }
    else
    {
      uint64_t v50 = @"(null)";
    }
    id v43 = v50;
    id v44 = (id)[*(id *)(v59 + 32) delegate];
    id v45 = (id)[*(id *)(v59 + 32) scanError];
    id v46 = (id)[*(id *)(v59 + 32) preferredStatefulDescriptor];
    id v47 = (id)[*(id *)(v59 + 32) alternateStatefulDescriptor];
    id v48 = (id)[*(id *)(v59 + 32) currentDownload];
    char v69 = 0;
    char v67 = 0;
    char v65 = 0;
    if (v48)
    {
      id v70 = (id)[*(id *)(v59 + 32) currentDownload];
      int v41 = 1;
      char v69 = 1;
      id v68 = (id)[v70 descriptor];
      char v67 = 1;
      id v66 = (id)[v68 humanReadableUpdateName];
      char v65 = 1;
      id v42 = (__CFString *)v66;
    }
    else
    {
      id v42 = @"(null)";
    }
    id v27 = v42;
    id v28 = (id)[*(id *)(v59 + 32) currentDownload];
    char v4 = [*(id *)(v59 + 32) performThirdPartyScan];
    id v34 = "NO";
    char v5 = "YES";
    id v35 = "YES";
    int v39 = 1;
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    id v29 = v5;
    char v6 = [*(id *)(v59 + 32) isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v35;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v34;
    }
    uint64_t v30 = v7;
    char v8 = [*(id *)(v59 + 32) hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v35;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v34;
    }
    uint64_t v31 = v9;
    id v32 = (id)[*(id *)(*(void *)(v59 + 32) + 256) humanReadableUpdateName];
    id v33 = v32;
    id v64 = v33;
    char v10 = [*(id *)(v59 + 32) hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v35;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v34;
    }
    uint64_t v36 = v11;
    id v37 = (id)[*(id *)(*(void *)(v59 + 32) + 264) humanReadableUpdateName];
    id v38 = v37;
    id v63 = v38;
    id v40 = (id)[*(id *)(v59 + 32) enrolledBetaProgram];
    char v61 = 0;
    if (v40)
    {
      id v62 = (id)[*(id *)(v59 + 32) enrolledBetaProgram];
      char v61 = 1;
      uint64_t v26 = [v62 programID];
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v17 = v26;
    id v25 = (id)[*(id *)(v59 + 32) betaPrograms];
    uint64_t v18 = [v25 count];
    id v24 = (id)[*(id *)(v59 + 32) currentFullScanOperation];
    id v23 = (id)[*(id *)(v59 + 32) currentRefreshScanOperation];
    id v22 = (id)[*(id *)(v59 + 32) currentUpdateOperation];
    id v21 = (id)[*(id *)(v59 + 32) auxiliaryOperations];
    uint64_t v12 = [v21 count];
    uint64_t v13 = "Failure";
    if (v80) {
      uint64_t v13 = "Success";
    }
    uint64_t v14 = v60[1];
    uint64_t v19 = &v15;
    buf = v82;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66((uint64_t)v82, (uint64_t)v58, (uint64_t)v54, v55, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v30, v31, (uint64_t)v33, v36, (uint64_t)v38, v17, v18,
      (uint64_t)v24,
      (uint64_t)v23,
      (uint64_t)v22,
      v12,
      (uint64_t)v13,
      v14);
    _os_log_impl(&dword_228401000, log, v52[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Unschedule targeted update automatic installation: %{public}s; error: %{public}@",
      buf,
      0xF2u);

    if (v61) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    id obja = 0;
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v64, obja);
    objc_storeStrong(&v75, obja);
  }
  objc_storeStrong((id *)&oslog, 0);
  [*(id *)(*(void *)(v59 + 32) + 208) removeObject:*(void *)(v59 + 40)];
  objc_storeStrong(&location, 0);
}

- (BOOL)isPerformingFullScan
{
  id obj = self;
  objc_sync_enter(obj);
  BOOL v4 = self->_currentFullScanOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (BOOL)isPerformingRefresh
{
  id obj = self;
  objc_sync_enter(obj);
  BOOL v4 = self->_currentRefreshScanOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (BOOL)isPerformingUpdate
{
  id obj = self;
  objc_sync_enter(obj);
  BOOL v4 = self->_currentUpdateOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (void)enrollInBetaUpdatesProgram:(id)a3 withPurgeConfirmation:(id)a4 completionHandler:(id)a5
{
  id obj = a4;
  id v331 = a5;
  v332 = "-[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:withPurgeConfirmation:completionHandler:]";
  v427[29] = *MEMORY[0x263EF8340];
  id v423 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v421 = 0;
  objc_storeStrong(&v421, obj);
  id v420 = 0;
  objc_storeStrong(&v420, v331);
  int v329 = _os_feature_enabled_impl();
  if (v329)
  {
    unint64_t v328 = [v423 currentState];
    if (v328 > 1)
    {
      id v259 = (id)[v423 currentSeedingDevice];
      id v9 = v259;
      BOOL v258 = v9 != 0;

      if (v258)
      {
        id v189 = (id)[v423 betaPrograms];
        id v187 = v189;
        char v383 = 0;
        BOOL v188 = 1;
        if (v187)
        {
          id v186 = (id)[v423 betaPrograms];
          id v384 = v186;
          char v383 = 1;
          uint64_t v185 = [v384 count];
          BOOL v188 = v185 == 0;
        }
        BOOL v184 = v188;
        if (v383) {

        }
        if (v184)
        {
          id v183 = (id)[v423 log];
          id v181 = v183;
          id v182 = (id)[v181 oslog];
          os_log_t v382 = (os_log_t)v182;

          os_log_type_t v381 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v382, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v178 = v382;
            *(_DWORD *)id v179 = v381;
            uint64_t v180 = [v423 currentState];
            id v177 = SUSettingsUIStateToString(v180);
            id v174 = v177;
            id v175 = v174;
            id v380 = v175;
            uint64_t v176 = [v423 currentState];
            id v173 = (id)[v423 delegate];
            id v172 = v173;
            char v378 = 0;
            char v376 = 0;
            if (v172)
            {
              id v171 = (id)[v423 delegate];
              id v379 = v171;
              char v378 = 1;
              Class v170 = (Class)objc_opt_class();
              id v169 = NSStringFromClass(v170);
              id v377 = v169;
              char v376 = 1;
              int v168 = (__CFString *)v377;
            }
            else
            {
              int v168 = @"(null)";
            }
            id v166 = v168;
            id v167 = (id)[v423 delegate];
            id v164 = v167;
            id v165 = (id)[v423 scanError];
            id v162 = v165;
            id v163 = (id)[v423 preferredStatefulDescriptor];
            id v160 = v163;
            id v161 = (id)[v423 alternateStatefulDescriptor];
            id v158 = v161;
            id v159 = (id)[v423 currentDownload];
            id v157 = v159;
            char v374 = 0;
            char v372 = 0;
            char v370 = 0;
            if (v157)
            {
              id v156 = (id)[v423 currentDownload];
              id v375 = v156;
              char v374 = 1;
              id v155 = (id)[v375 descriptor];
              id v373 = v155;
              char v372 = 1;
              id v154 = (id)[v373 humanReadableUpdateName];
              id v371 = v154;
              char v370 = 1;
              id v153 = (__CFString *)v371;
            }
            else
            {
              id v153 = @"(null)";
            }
            id v151 = v153;
            id v152 = (id)[v423 currentDownload];
            id v149 = v152;
            int v150 = [v423 performThirdPartyScan];
            uint64_t v14 = "YES";
            if ((v150 & 1) == 0) {
              uint64_t v14 = "NO";
            }
            id v147 = v14;
            int v148 = [v423 isTargetedUpdateScheduledForAutoInstall];
            uint64_t v15 = "YES";
            if ((v148 & 1) == 0) {
              uint64_t v15 = "NO";
            }
            id v145 = v15;
            int v146 = [v423 hidingPreferredDescriptor];
            char v16 = "YES";
            if ((v146 & 1) == 0) {
              char v16 = "NO";
            }
            id v143 = v16;
            id v144 = (id)[*((id *)v423 + 32) humanReadableUpdateName];
            id v140 = v144;
            id v141 = v140;
            id v369 = v141;
            int v142 = [v423 hidingAlternateDescriptor];
            uint64_t v17 = "YES";
            if ((v142 & 1) == 0) {
              uint64_t v17 = "NO";
            }
            id v138 = v17;
            id v139 = (id)[*((id *)v423 + 33) humanReadableUpdateName];
            id v135 = v139;
            id v136 = v135;
            id v368 = v136;
            id v137 = (id)[v423 enrolledBetaProgram];
            id v134 = v137;
            char v366 = 0;
            if (v134)
            {
              id v133 = (id)[v423 enrolledBetaProgram];
              id v367 = v133;
              char v366 = 1;
              uint64_t v132 = [v367 programID];
              uint64_t v131 = v132;
            }
            else
            {
              uint64_t v131 = 0;
            }
            uint64_t v129 = v131;
            id v130 = (id)[v423 betaPrograms];
            id v127 = v130;
            uint64_t v128 = [v127 count];
            id v126 = (id)[v423 currentFullScanOperation];
            id v124 = v126;
            id v125 = (id)[v423 currentRefreshScanOperation];
            id v122 = v125;
            id v123 = (id)[v423 currentUpdateOperation];
            id v120 = v123;
            id v121 = (id)[v423 auxiliaryOperations];
            id v118 = v121;
            uint64_t v119 = [v118 count];
            uint64_t v117 = [location[0] programID];
            unsigned __int8 v115 = &v24;
            BOOL v116 = v425;
            __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v425, (uint64_t)v332, (uint64_t)v175, v176, (uint64_t)v166, (uint64_t)v164, (uint64_t)v162, (uint64_t)v160, (uint64_t)v158, (uint64_t)v151, (uint64_t)v149, (uint64_t)v147, (uint64_t)v145, (uint64_t)v143, (uint64_t)v141, (uint64_t)v138, (uint64_t)v136, v131, v128,
              (uint64_t)v124,
              (uint64_t)v122,
              (uint64_t)v120,
              v119,
              v117,
              (uint64_t)location[0]);
            _os_log_impl(&dword_228401000, v178, v179[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
              "\tselectedBetaProgram: %lu (count: %ld)\n"
              "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
              "\n"
              "Can not register to the beta progra \"%ld\" (%p) as no beta programs have been discovered by the Stateful "
              "UI. Attempts to perform a full re-scan.",
              v116,
              0xF2u);

            if (v366) {
            if (v370)
            }

            if (v372) {
            if (v374)
            }

            if (v376) {
            if (v378)
            }

            objc_storeStrong(&v368, 0);
            objc_storeStrong(&v369, 0);
            objc_storeStrong(&v380, 0);
          }
          objc_storeStrong((id *)&v382, 0);
          [v423 checkForAvailableUpdates];
          int v419 = 1;
        }
        else
        {
          if (!location[0])
          {
            id v114 = (id)[v423 betaPrograms];
            id v112 = v114;
            id v113 = (id)[v112 firstObject];
            id v18 = v113;
            id v19 = location[0];
            location[0] = v18;
          }
          id v111 = *((id *)v423 + 13);
          objc_sync_enter(v111);
          if (*((void *)v423 + 13))
          {
            id v102 = (id)[v423 log];
            id v100 = v102;
            id v101 = (id)[v100 oslog];
            os_log_t v357 = (os_log_t)v101;

            os_log_type_t v356 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v357, OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v97 = v357;
              *(_DWORD *)int v98 = v356;
              uint64_t v99 = [v423 currentState];
              id v96 = SUSettingsUIStateToString(v99);
              id v93 = v96;
              id v94 = v93;
              id v355 = v94;
              uint64_t v95 = [v423 currentState];
              char v353 = 0;
              char v351 = 0;
              id v92 = (id)[v423 delegate];
              id v91 = v92;
              if (v91)
              {
                id v90 = (id)[v423 delegate];
                id v354 = v90;
                char v353 = 1;
                Class v89 = (Class)objc_opt_class();
                id v88 = NSStringFromClass(v89);
                id v352 = v88;
                char v351 = 1;
                uint64_t v87 = (__CFString *)v352;
              }
              else
              {
                uint64_t v87 = @"(null)";
              }
              id v85 = v87;
              id v86 = (id)[v423 delegate];
              id v83 = v86;
              id v84 = (id)[v423 scanError];
              id v81 = v84;
              id v82 = (id)[v423 preferredStatefulDescriptor];
              id v79 = v82;
              id v80 = (id)[v423 alternateStatefulDescriptor];
              id v77 = v80;
              char v349 = 0;
              char v347 = 0;
              char v345 = 0;
              id v78 = (id)[v423 currentDownload];
              id v76 = v78;
              if (v76)
              {
                id v75 = (id)[v423 currentDownload];
                id v350 = v75;
                char v349 = 1;
                id v74 = (id)[v350 descriptor];
                id v348 = v74;
                char v347 = 1;
                id v73 = (id)[v348 humanReadableUpdateName];
                id v346 = v73;
                char v345 = 1;
                id v72 = (__CFString *)v346;
              }
              else
              {
                id v72 = @"(null)";
              }
              id v70 = v72;
              id v71 = (id)[v423 currentDownload];
              id v68 = v71;
              int v69 = [v423 performThirdPartyScan];
              char v20 = "YES";
              if ((v69 & 1) == 0) {
                char v20 = "NO";
              }
              id v66 = v20;
              int v67 = [v423 isTargetedUpdateScheduledForAutoInstall];
              id v21 = "YES";
              if ((v67 & 1) == 0) {
                id v21 = "NO";
              }
              id v64 = v21;
              int v65 = [v423 hidingPreferredDescriptor];
              id v22 = "YES";
              if ((v65 & 1) == 0) {
                id v22 = "NO";
              }
              id v62 = v22;
              id v63 = (id)[*((id *)v423 + 32) humanReadableUpdateName];
              id v59 = v63;
              id v60 = v59;
              id v344 = v60;
              int v61 = [v423 hidingAlternateDescriptor];
              id v23 = "YES";
              if ((v61 & 1) == 0) {
                id v23 = "NO";
              }
              id v57 = v23;
              id v58 = (id)[*((id *)v423 + 33) humanReadableUpdateName];
              id v54 = v58;
              id v55 = v54;
              id v343 = v55;
              char v341 = 0;
              id v56 = (id)[v423 enrolledBetaProgram];
              id v53 = v56;
              if (v53)
              {
                id v52 = (id)[v423 enrolledBetaProgram];
                id v342 = v52;
                char v341 = 1;
                uint64_t v51 = [v342 programID];
                uint64_t v50 = v51;
              }
              else
              {
                uint64_t v50 = 0;
              }
              uint64_t v48 = v50;
              id v49 = (id)[v423 betaPrograms];
              id v46 = v49;
              uint64_t v47 = [v46 count];
              id v45 = (id)[v423 currentFullScanOperation];
              id v43 = v45;
              id v44 = (id)[v423 currentRefreshScanOperation];
              id v41 = v44;
              id v42 = (id)[v423 currentUpdateOperation];
              id v39 = v42;
              id v40 = (id)[v423 auxiliaryOperations];
              id v37 = v40;
              uint64_t v38 = [v37 count];
              uint64_t v36 = [location[0] programID];
              id v34 = &v24;
              id v35 = v424;
              __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v424, (uint64_t)v332, (uint64_t)v94, v95, (uint64_t)v85, (uint64_t)v83, (uint64_t)v81, (uint64_t)v79, (uint64_t)v77, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v57, (uint64_t)v55, v50, v47,
                (uint64_t)v43,
                (uint64_t)v41,
                (uint64_t)v39,
                v38,
                v36,
                (uint64_t)location[0]);
              _os_log_impl(&dword_228401000, v97, v98[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
                "\tselectedBetaProgram: %lu (count: %ld)\n"
                "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
                "\n"
                "A targeted update exists when attempting to enroll in beta program: %ld (%p). Asking to purge the targeted update.",
                v35,
                0xF2u);

              if (v341) {
              if (v345)
              }

              if (v347) {
              if (v349)
              }

              if (v351) {
              if (v353)
              }

              objc_storeStrong(&v343, 0);
              objc_storeStrong(&v344, 0);
              objc_storeStrong(&v355, 0);
            }
            objc_storeStrong((id *)&v357, 0);
            id v33 = (id)[MEMORY[0x263F77D78] sharedCore];
            id v31 = v33;
            id v32 = (id)[v31 selectDelegateCallbackQueue:*((void *)v423 + 5)];
            dispatch_queue_t v30 = (dispatch_queue_t)v32;
            dispatch_block_t v29 = &v333;
            uint64_t v333 = MEMORY[0x263EF8330];
            int v334 = -1073741824;
            int v335 = 0;
            v336 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_372;
            v337 = &unk_26483BDB0;
            id v25 = (id *)v340;
            v340[0] = v421;
            uint64_t v26 = (id *)((char *)v29 + 32);
            id v338 = v423;
            id v27 = (id *)((char *)v29 + 40);
            id v339 = location[0];
            id v28 = (id *)((char *)v29 + 56);
            v340[1] = v420;
            dispatch_async(v30, v29);

            objc_storeStrong(v28, 0);
            objc_storeStrong(v27, 0);
            objc_storeStrong(v26, 0);
            objc_storeStrong(v25, 0);
            int v419 = 0;
          }
          else
          {
            id v110 = (id)[MEMORY[0x263F77D78] sharedCore];
            id v108 = v110;
            id v109 = (id)[v108 selectDelegateCallbackQueue:*((void *)v423 + 21)];
            dispatch_queue_t queue = (dispatch_queue_t)v109;
            dispatch_block_t block = &v358;
            uint64_t v358 = MEMORY[0x263EF8330];
            int v359 = -1073741824;
            int v360 = 0;
            v361 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke;
            v362 = &unk_26483BD60;
            id v103 = &v363;
            id v363 = v423;
            id v104 = &v364;
            id v364 = location[0];
            id v105 = &v365;
            id v365 = v420;
            dispatch_async(queue, &v358);

            int v419 = 1;
            objc_storeStrong(&v365, 0);
            objc_storeStrong(&v364, 0);
            objc_storeStrong(&v363, 0);
          }
          objc_sync_exit(v111);

          if (!v419) {
            int v419 = 0;
          }
        }
      }
      else
      {
        id v257 = (id)[v423 log];
        id v255 = v257;
        id v256 = (id)[v255 oslog];
        os_log_t v401 = (os_log_t)v256;

        os_log_type_t v400 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v401, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v252 = v401;
          *(_DWORD *)id v253 = v400;
          uint64_t v254 = [v423 currentState];
          id v251 = SUSettingsUIStateToString(v254);
          id v248 = v251;
          id v249 = v248;
          id v399 = v249;
          uint64_t v250 = [v423 currentState];
          id v247 = (id)[v423 delegate];
          id v246 = v247;
          char v397 = 0;
          char v395 = 0;
          if (v246)
          {
            id v245 = (id)[v423 delegate];
            id v398 = v245;
            char v397 = 1;
            Class v244 = (Class)objc_opt_class();
            id v243 = NSStringFromClass(v244);
            id v396 = v243;
            char v395 = 1;
            char v242 = (__CFString *)v396;
          }
          else
          {
            char v242 = @"(null)";
          }
          char v240 = v242;
          id v241 = (id)[v423 delegate];
          id v238 = v241;
          id v239 = (id)[v423 scanError];
          id v236 = v239;
          id v237 = (id)[v423 preferredStatefulDescriptor];
          id v234 = v237;
          id v235 = (id)[v423 alternateStatefulDescriptor];
          id v232 = v235;
          id v233 = (id)[v423 currentDownload];
          id v231 = v233;
          char v393 = 0;
          char v391 = 0;
          char v389 = 0;
          if (v231)
          {
            id v230 = (id)[v423 currentDownload];
            id v394 = v230;
            char v393 = 1;
            id v229 = (id)[v394 descriptor];
            id v392 = v229;
            char v391 = 1;
            id v228 = (id)[v392 humanReadableUpdateName];
            id v390 = v228;
            char v389 = 1;
            id v227 = (__CFString *)v390;
          }
          else
          {
            id v227 = @"(null)";
          }
          id v225 = v227;
          id v226 = (id)[v423 currentDownload];
          id v223 = v226;
          int v224 = [v423 performThirdPartyScan];
          char v10 = "YES";
          if ((v224 & 1) == 0) {
            char v10 = "NO";
          }
          id v221 = v10;
          int v222 = [v423 isTargetedUpdateScheduledForAutoInstall];
          uint64_t v11 = "YES";
          if ((v222 & 1) == 0) {
            uint64_t v11 = "NO";
          }
          id v219 = v11;
          int v220 = [v423 hidingPreferredDescriptor];
          uint64_t v12 = "YES";
          if ((v220 & 1) == 0) {
            uint64_t v12 = "NO";
          }
          id v217 = v12;
          id v218 = (id)[*((id *)v423 + 32) humanReadableUpdateName];
          id v214 = v218;
          id v215 = v214;
          id v388 = v215;
          int v216 = [v423 hidingAlternateDescriptor];
          uint64_t v13 = "YES";
          if ((v216 & 1) == 0) {
            uint64_t v13 = "NO";
          }
          id v212 = v13;
          id v213 = (id)[*((id *)v423 + 33) humanReadableUpdateName];
          id v209 = v213;
          id v210 = v209;
          id v387 = v210;
          id v211 = (id)[v423 enrolledBetaProgram];
          id v208 = v211;
          char v385 = 0;
          if (v208)
          {
            id v207 = (id)[v423 enrolledBetaProgram];
            id v386 = v207;
            char v385 = 1;
            uint64_t v206 = [v386 programID];
            uint64_t v205 = v206;
          }
          else
          {
            uint64_t v205 = 0;
          }
          uint64_t v203 = v205;
          id v204 = (id)[v423 betaPrograms];
          id v201 = v204;
          uint64_t v202 = [v201 count];
          id v200 = (id)[v423 currentFullScanOperation];
          id v198 = v200;
          id v199 = (id)[v423 currentRefreshScanOperation];
          id v196 = v199;
          id v197 = (id)[v423 currentUpdateOperation];
          id v194 = v197;
          id v195 = (id)[v423 auxiliaryOperations];
          id v192 = v195;
          uint64_t v193 = [v192 count];
          id v190 = &v24;
          BOOL v191 = v426;
          __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v426, (uint64_t)v332, (uint64_t)v249, v250, (uint64_t)v240, (uint64_t)v238, (uint64_t)v236, (uint64_t)v234, (uint64_t)v232, (uint64_t)v225, (uint64_t)v223, (uint64_t)v221, (uint64_t)v219, (uint64_t)v217, (uint64_t)v215, (uint64_t)v212, (uint64_t)v210, v205, v202,
            (uint64_t)v198,
            (uint64_t)v196,
            (uint64_t)v194,
            v193);
          _os_log_impl(&dword_228401000, v252, v253[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "Can not enroll in beta updates as we have not discovered a seeding device.",
            v191,
            0xDEu);

          if (v385) {
          if (v389)
          }

          if (v391) {
          if (v393)
          }

          if (v395) {
          if (v397)
          }

          objc_storeStrong(&v387, 0);
          objc_storeStrong(&v388, 0);
          objc_storeStrong(&v399, 0);
        }
        objc_storeStrong((id *)&v401, 0);
        int v419 = 1;
      }
    }
    else
    {
      id v327 = (id)[v423 log];
      id v325 = v327;
      id v326 = (id)[v325 oslog];
      osos_log_t log = (os_log_t)v326;

      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = oslog;
        *(_DWORD *)v323 = type;
        uint64_t v324 = [v423 currentState];
        id v321 = SUSettingsUIStateToString(v324);
        id v318 = v321;
        id v319 = v318;
        id v416 = v319;
        uint64_t v320 = [v423 currentState];
        id v317 = (id)[v423 delegate];
        id v316 = v317;
        char v414 = 0;
        char v412 = 0;
        if (v316)
        {
          id v315 = (id)[v423 delegate];
          id v415 = v315;
          char v414 = 1;
          Class aClass = (Class)objc_opt_class();
          id v313 = NSStringFromClass(aClass);
          id v413 = v313;
          char v412 = 1;
          v312 = (__CFString *)v413;
        }
        else
        {
          v312 = @"(null)";
        }
        v310 = v312;
        id v311 = (id)[v423 delegate];
        id v308 = v311;
        id v309 = (id)[v423 scanError];
        id v306 = v309;
        id v307 = (id)[v423 preferredStatefulDescriptor];
        id v304 = v307;
        id v305 = (id)[v423 alternateStatefulDescriptor];
        id v302 = v305;
        id v303 = (id)[v423 currentDownload];
        id v301 = v303;
        char v410 = 0;
        char v408 = 0;
        char v406 = 0;
        if (v301)
        {
          id v300 = (id)[v423 currentDownload];
          id v411 = v300;
          char v410 = 1;
          id v299 = (id)[v411 descriptor];
          id v409 = v299;
          char v408 = 1;
          id v298 = (id)[v409 humanReadableUpdateName];
          id v407 = v298;
          char v406 = 1;
          v297 = (__CFString *)v407;
        }
        else
        {
          v297 = @"(null)";
        }
        v295 = v297;
        id v296 = (id)[v423 currentDownload];
        id v293 = v296;
        int v294 = [v423 performThirdPartyScan];
        char v5 = "YES";
        if ((v294 & 1) == 0) {
          char v5 = "NO";
        }
        v291 = v5;
        int v292 = [v423 isTargetedUpdateScheduledForAutoInstall];
        char v6 = "YES";
        if ((v292 & 1) == 0) {
          char v6 = "NO";
        }
        v289 = v6;
        int v290 = [v423 hidingPreferredDescriptor];
        uint64_t v7 = "YES";
        if ((v290 & 1) == 0) {
          uint64_t v7 = "NO";
        }
        v287 = v7;
        id v288 = (id)[*((id *)v423 + 32) humanReadableUpdateName];
        id v284 = v288;
        id v285 = v284;
        id v405 = v285;
        int v286 = [v423 hidingAlternateDescriptor];
        char v8 = "YES";
        if ((v286 & 1) == 0) {
          char v8 = "NO";
        }
        v282 = v8;
        id v283 = (id)[*((id *)v423 + 33) humanReadableUpdateName];
        id v279 = v283;
        id v280 = v279;
        id v404 = v280;
        id v281 = (id)[v423 enrolledBetaProgram];
        id v278 = v281;
        char v402 = 0;
        if (v278)
        {
          id v277 = (id)[v423 enrolledBetaProgram];
          id v403 = v277;
          char v402 = 1;
          uint64_t v276 = [v403 programID];
          uint64_t v275 = v276;
        }
        else
        {
          uint64_t v275 = 0;
        }
        uint64_t v273 = v275;
        id v274 = (id)[v423 betaPrograms];
        id v271 = v274;
        uint64_t v272 = [v271 count];
        id v270 = (id)[v423 currentFullScanOperation];
        id v268 = v270;
        id v269 = (id)[v423 currentRefreshScanOperation];
        id v266 = v269;
        id v267 = (id)[v423 currentUpdateOperation];
        id v264 = v267;
        id v265 = (id)[v423 auxiliaryOperations];
        id v262 = v265;
        uint64_t v263 = [v262 count];
        os_log_type_t v260 = &v24;
        buf = (uint8_t *)v427;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v427, (uint64_t)v332, (uint64_t)v319, v320, (uint64_t)v310, (uint64_t)v308, (uint64_t)v306, (uint64_t)v304, (uint64_t)v302, (uint64_t)v295, (uint64_t)v293, (uint64_t)v291, (uint64_t)v289, (uint64_t)v287, (uint64_t)v285, (uint64_t)v282, (uint64_t)v280, v275, v272,
          (uint64_t)v268,
          (uint64_t)v266,
          (uint64_t)v264,
          v263);
        _os_log_impl(&dword_228401000, log, v323[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not enroll in beta updates as we are currently checking for updates.",
          buf,
          0xDEu);

        if (v402) {
        if (v406)
        }

        if (v408) {
        if (v410)
        }

        if (v412) {
        if (v414)
        }

        objc_storeStrong(&v404, 0);
        objc_storeStrong(&v405, 0);
        objc_storeStrong(&v416, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v419 = 1;
    }
  }
  else
  {
    int v419 = 1;
  }
  objc_storeStrong(&v420, 0);
  objc_storeStrong(&v421, 0);
  objc_storeStrong(location, 0);
}

uint64_t __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doEnrollInBetaUpdatesProgram:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

void __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_372(uint64_t a1)
{
  id v13[2] = (id)a1;
  v13[1] = (id)a1;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2;
  char v10 = &unk_26483BD88;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  v13[0] = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v2, v3, v4);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
}

void __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2(NSObject *a1, uint64_t a2)
{
  p_Class isa = (id *)&a1->isa;
  id v78 = "-[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:withPurgeConfirmation:completionHandler:]_block_invoke_2";
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v113 = a1;
  uint64_t v112 = a2;
  oslog[1] = a1;
  id v76 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v76 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v71 = type;
    id v72 = SUSettingsUIStateToString([p_isa[4] currentState]);
    id v73 = v72;
    id v109 = v73;
    uint64_t v74 = [p_isa[4] currentState];
    id v75 = (id)[p_isa[4] delegate];
    char v107 = 0;
    char v105 = 0;
    if (v75)
    {
      id v108 = (id)[p_isa[4] delegate];
      int v68 = 1;
      char v107 = 1;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v106 = NSStringFromClass(v2);
      char v105 = 1;
      int v69 = (__CFString *)v106;
    }
    else
    {
      int v69 = @"(null)";
    }
    id v62 = v69;
    id v63 = (id)[p_isa[4] delegate];
    id v64 = (id)[p_isa[4] scanError];
    id v65 = (id)[p_isa[4] preferredStatefulDescriptor];
    id v66 = (id)[p_isa[4] alternateStatefulDescriptor];
    id v67 = (id)[p_isa[4] currentDownload];
    char v103 = 0;
    char v101 = 0;
    char v99 = 0;
    if (v67)
    {
      id v104 = (id)[p_isa[4] currentDownload];
      int v60 = 1;
      char v103 = 1;
      id v102 = (id)[v104 descriptor];
      char v101 = 1;
      id v100 = (id)[v102 humanReadableUpdateName];
      char v99 = 1;
      int v61 = (__CFString *)v100;
    }
    else
    {
      int v61 = @"(null)";
    }
    id v46 = v61;
    id v47 = (id)[p_isa[4] currentDownload];
    char v3 = [p_isa[4] performThirdPartyScan];
    id v53 = "NO";
    uint64_t v4 = "YES";
    id v54 = "YES";
    int v58 = 1;
    if ((v3 & 1) == 0) {
      uint64_t v4 = "NO";
    }
    uint64_t v48 = v4;
    char v5 = [p_isa[4] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v54;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v53;
    }
    uint64_t v49 = v6;
    char v7 = [p_isa[4] hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v54;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v53;
    }
    uint64_t v50 = v8;
    id v51 = (id)[*((id *)p_isa[4] + 32) humanReadableUpdateName];
    id v52 = v51;
    id v98 = v52;
    char v9 = [p_isa[4] hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v54;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v53;
    }
    uint64_t v55 = v10;
    id v56 = (id)[*((id *)p_isa[4] + 33) humanReadableUpdateName];
    id v57 = v56;
    id v97 = v57;
    id v59 = (id)[p_isa[4] enrolledBetaProgram];
    char v95 = 0;
    if (v59)
    {
      id v96 = (id)[p_isa[4] enrolledBetaProgram];
      char v95 = 1;
      uint64_t v45 = [v96 programID];
    }
    else
    {
      uint64_t v45 = 0;
    }
    uint64_t v29 = v45;
    id v44 = (id)[p_isa[4] betaPrograms];
    uint64_t v30 = [v44 count];
    id v43 = (id)[p_isa[4] currentFullScanOperation];
    id v42 = (id)[p_isa[4] currentRefreshScanOperation];
    id v41 = (id)[p_isa[4] currentUpdateOperation];
    id v40 = (id)[p_isa[4] auxiliaryOperations];
    uint64_t v31 = [v40 count];
    id v39 = (id)[*((id *)p_isa[4] + 13) descriptor];
    id v38 = (id)[v39 humanReadableUpdateName];
    id v32 = v38;
    id v94 = v32;
    uint64_t v33 = [p_isa[5] programID];
    id v34 = p_isa[5];
    id v37 = SUSettingsUserInteractionResponseTypeToString(v112);
    id location = v37;
    id v35 = &v12;
    buf = v114;
    __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0_8_66((uint64_t)v114, (uint64_t)v78, (uint64_t)v73, v74, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v66, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, v49, v50, (uint64_t)v52, v55, (uint64_t)v57, v45, v30,
      (uint64_t)v43,
      (uint64_t)v42,
      (uint64_t)v41,
      v31,
      (uint64_t)v32,
      v33,
      (uint64_t)v34,
      (uint64_t)location);
    _os_log_impl(&dword_228401000, log, v71[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "User responded to the targeted update purge request of %{public}@, for beta program %ld (%p): %{public}@",
      buf,
      0x106u);

    if (v95) {
    if (v99)
    }

    if (v101) {
    if (v103)
    }

    if (v105) {
    if (v107)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v94, obj);
    objc_storeStrong(&v97, obj);
    objc_storeStrong(&v98, obj);
    objc_storeStrong(&v109, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v112)
  {
    if (p_isa[6])
    {
      id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)p_isa[4] + 5)];
      dispatch_block_t block = &v86;
      uint64_t v86 = MEMORY[0x263EF8330];
      int v87 = -1073741824;
      int v88 = 0;
      Class v89 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_373;
      id v90 = &unk_26483BB08;
      uint64_t v26 = &v92;
      id v92 = p_isa[6];
      id v25 = (id *)((char *)block + 32);
      id v91 = p_isa[5];
      dispatch_async(queue, block);

      id v27 = 0;
      objc_storeStrong(v25, 0);
      objc_storeStrong(v26, v27);
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F78220]);
    char v20 = &v85;
    id v85 = v11;
    int v13 = 1;
    [v11 setNotifyUser:0];
    [v85 setUserRequested:v13 & 1];
    id v16 = (id)*((void *)p_isa[4] + 28);
    id v14 = v85;
    uint64_t v15 = &v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v81 = 0;
    id v82 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2_375;
    id v83 = &unk_26483BCC0;
    id v19 = (id *)v84;
    v84[0] = p_isa[4];
    id v18 = (id *)(v15 + 6);
    v84[2] = p_isa[6];
    uint64_t v17 = (id *)(v15 + 5);
    v84[1] = p_isa[5];
    [v16 purgeDownloadWithOptions:v14 withResult:v15];
    id v21 = 0;
    objc_storeStrong(v17, 0);
    objc_storeStrong(v18, v21);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
  }
}

void __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_373(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:9 userInfo:0];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

void __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2_375(NSObject *a1, char a2, id obj)
{
  id v70 = a1;
  int v69 = "-[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:withPurgeConfirmation:completionHandler:]_block_invoke_2";
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v104 = a1;
  char v103 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = v70;
  id v68 = (id)[(objc_class *)v70[4].isa log];
  oslog[0] = (os_log_t)(id)[v68 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v63 = type;
    id v64 = SUSettingsUIStateToString([(objc_class *)v70[4].isa currentState]);
    id v65 = v64;
    id v99 = v65;
    uint64_t v66 = [(objc_class *)v70[4].isa currentState];
    id v67 = (id)[(objc_class *)v70[4].isa delegate];
    char v97 = 0;
    char v95 = 0;
    if (v67)
    {
      id v98 = (id)[(objc_class *)v70[4].isa delegate];
      int v60 = 1;
      char v97 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v96 = NSStringFromClass(v3);
      char v95 = 1;
      int v61 = (__CFString *)v96;
    }
    else
    {
      int v61 = @"(null)";
    }
    id v54 = v61;
    id v55 = (id)[(objc_class *)v70[4].isa delegate];
    id v56 = (id)[(objc_class *)v70[4].isa scanError];
    id v57 = (id)[(objc_class *)v70[4].isa preferredStatefulDescriptor];
    id v58 = (id)[(objc_class *)v70[4].isa alternateStatefulDescriptor];
    id v59 = (id)[(objc_class *)v70[4].isa currentDownload];
    char v93 = 0;
    char v91 = 0;
    char v89 = 0;
    if (v59)
    {
      id v94 = (id)[(objc_class *)v70[4].isa currentDownload];
      int v52 = 1;
      char v93 = 1;
      id v92 = (id)[v94 descriptor];
      char v91 = 1;
      id v90 = (id)[v92 humanReadableUpdateName];
      char v89 = 1;
      id v53 = (__CFString *)v90;
    }
    else
    {
      id v53 = @"(null)";
    }
    id v38 = v53;
    id v39 = (id)[(objc_class *)v70[4].isa currentDownload];
    char v4 = [(objc_class *)v70[4].isa performThirdPartyScan];
    uint64_t v45 = "NO";
    char v5 = "YES";
    id v46 = "YES";
    int v50 = 1;
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    id v40 = v5;
    char v6 = [(objc_class *)v70[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v46;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v45;
    }
    uint64_t v41 = v7;
    char v8 = [(objc_class *)v70[4].isa hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v46;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v45;
    }
    uint64_t v42 = v9;
    id v43 = (id)[*((id *)v70[4].isa + 32) humanReadableUpdateName];
    id v44 = v43;
    id v88 = v44;
    char v10 = [(objc_class *)v70[4].isa hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v46;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v45;
    }
    uint64_t v47 = v11;
    id v48 = (id)[*((id *)v70[4].isa + 33) humanReadableUpdateName];
    id v49 = v48;
    id v87 = v49;
    id v51 = (id)[(objc_class *)v70[4].isa enrolledBetaProgram];
    char v85 = 0;
    if (v51)
    {
      id v86 = (id)[(objc_class *)v70[4].isa enrolledBetaProgram];
      char v85 = 1;
      uint64_t v37 = [v86 programID];
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v28 = v37;
    id v36 = (id)[(objc_class *)v70[4].isa betaPrograms];
    uint64_t v29 = [v36 count];
    id v35 = (id)[(objc_class *)v70[4].isa currentFullScanOperation];
    id v34 = (id)[(objc_class *)v70[4].isa currentRefreshScanOperation];
    id v33 = (id)[(objc_class *)v70[4].isa currentUpdateOperation];
    id v32 = (id)[(objc_class *)v70[4].isa auxiliaryOperations];
    uint64_t v12 = [v32 count];
    uint64_t v30 = &v13;
    buf = v105;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v105, (uint64_t)v69, (uint64_t)v65, v66, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40, v41, v42, (uint64_t)v44, v47, (uint64_t)v49, v37, v29,
      (uint64_t)v35,
      (uint64_t)v34,
      (uint64_t)v33,
      v12,
      v103 & 1,
      (uint64_t)location);
    _os_log_impl(&dword_228401000, log, v63[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Purge result: %d; error: %{public}@",
      buf,
      0xEEu);

    if (v85) {
    if (v89)
    }

    if (v91) {
    if (v93)
    }

    if (v95) {
    if (v97)
    }

    id obja = 0;
    objc_storeStrong(&v87, 0);
    objc_storeStrong(&v88, obja);
    objc_storeStrong(&v99, obja);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v103)
  {
    id v16 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t v15 = (dispatch_queue_t)(id)[v16 selectDelegateCallbackQueue:*((void *)v70[4].isa + 21)];
    dispatch_block_t v14 = &v71;
    uint64_t v71 = MEMORY[0x263EF8330];
    int v72 = -1073741824;
    int v73 = 0;
    uint64_t v74 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2_377;
    id v75 = &unk_26483BD60;
    id v19 = (id *)v76;
    v76[0] = v70[4].isa;
    id v18 = (id *)((char *)v14 + 40);
    v76[1] = v70[5].isa;
    uint64_t v17 = (id *)((char *)v14 + 48);
    void v76[2] = v70[6].isa;
    dispatch_async(v15, v14);

    id v20 = 0;
    objc_storeStrong(v17, 0);
    objc_storeStrong(v18, v20);
    objc_storeStrong(v19, v20);
    int v77 = 0;
  }
  else
  {
    if (v70[6].isa)
    {
      id v23 = (id)[MEMORY[0x263F77D78] sharedCore];
      dispatch_queue_t queue = (dispatch_queue_t)(id)[v23 selectDelegateCallbackQueue:*((void *)v70[4].isa + 5)];
      dispatch_block_t block = &v78;
      uint64_t v78 = MEMORY[0x263EF8330];
      int v79 = -1073741824;
      int v80 = 0;
      int v81 = __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_376;
      id v82 = &unk_26483BB08;
      id v25 = (id *)&v84;
      id v84 = v70[6].isa;
      id v24 = (id *)((char *)block + 32);
      id v83 = v70[5].isa;
      dispatch_async(queue, block);

      id v26 = 0;
      objc_storeStrong(v24, 0);
      objc_storeStrong(v25, v26);
    }
    int v77 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_376(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:9 userInfo:0];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

uint64_t __98__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_withPurgeConfirmation_completionHandler___block_invoke_2_377(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doEnrollInBetaUpdatesProgram:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3
{
  id v113 = "-[SUSettingsStatefulUIManager unenrollFromBetaUpdatesWithCompletion:]";
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v157 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (_os_feature_enabled_impl())
  {
    if ((unint64_t)[v157 currentState] > 1)
    {
      id v12 = (id)[v157 currentSeedingDevice];
      BOOL v70 = v12 != 0;

      if (v70)
      {
        id v24 = (id)[MEMORY[0x263F67CE8] sharedManager];
        id v23 = (id)[v157 currentSeedingDevice];
        v22[15] = &v114;
        uint64_t v114 = MEMORY[0x263EF8330];
        int v115 = -1073741824;
        int v116 = 0;
        uint64_t v117 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke;
        id v118 = &unk_26483BE28;
        id v26 = &v119;
        id v119 = v157;
        id v25 = &v120;
        id v120 = location[0];
        [v24 unenrollDevice:v23 completion:&v114];

        id v27 = 0;
        objc_storeStrong(&v120, 0);
        objc_storeStrong(&v119, 0);
        int v155 = 0;
      }
      else
      {
        id v69 = (id)[v157 log];
        os_log_t v137 = (os_log_t)(id)[v69 oslog];

        os_log_type_t v136 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v63 = v137;
          *(_DWORD *)id v64 = v136;
          id v65 = SUSettingsUIStateToString([v157 currentState]);
          id v66 = v65;
          id v135 = v66;
          uint64_t v67 = [v157 currentState];
          id v68 = (id)[v157 delegate];
          char v133 = 0;
          char v131 = 0;
          if (v68)
          {
            id v134 = (id)[v157 delegate];
            int v61 = 1;
            char v133 = 1;
            uint64_t v13 = (objc_class *)objc_opt_class();
            id v132 = NSStringFromClass(v13);
            char v131 = 1;
            id v62 = (__CFString *)v132;
          }
          else
          {
            id v62 = @"(null)";
          }
          id v55 = v62;
          id v56 = (id)[v157 delegate];
          id v57 = (id)[v157 scanError];
          id v58 = (id)[v157 preferredStatefulDescriptor];
          id v59 = (id)[v157 alternateStatefulDescriptor];
          id v60 = (id)[v157 currentDownload];
          char v129 = 0;
          char v127 = 0;
          char v125 = 0;
          if (v60)
          {
            id v130 = (id)[v157 currentDownload];
            int v53 = 1;
            char v129 = 1;
            id v128 = (id)[v130 descriptor];
            char v127 = 1;
            id v126 = (id)[v128 humanReadableUpdateName];
            char v125 = 1;
            id v54 = (__CFString *)v126;
          }
          else
          {
            id v54 = @"(null)";
          }
          id v39 = v54;
          id v40 = (id)[v157 currentDownload];
          char v14 = [v157 performThirdPartyScan];
          id v46 = "NO";
          dispatch_queue_t v15 = "YES";
          uint64_t v47 = "YES";
          int v51 = 1;
          if ((v14 & 1) == 0) {
            dispatch_queue_t v15 = "NO";
          }
          uint64_t v41 = v15;
          char v16 = [v157 isTargetedUpdateScheduledForAutoInstall];
          uint64_t v17 = (uint64_t)v47;
          if ((v16 & 1) == 0) {
            uint64_t v17 = (uint64_t)v46;
          }
          uint64_t v42 = v17;
          char v18 = [v157 hidingPreferredDescriptor];
          uint64_t v19 = (uint64_t)v47;
          if ((v18 & 1) == 0) {
            uint64_t v19 = (uint64_t)v46;
          }
          uint64_t v43 = v19;
          id v44 = (id)[*((id *)v157 + 32) humanReadableUpdateName];
          id v45 = v44;
          id v124 = v45;
          char v20 = [v157 hidingAlternateDescriptor];
          uint64_t v21 = (uint64_t)v47;
          if ((v20 & 1) == 0) {
            uint64_t v21 = (uint64_t)v46;
          }
          uint64_t v48 = v21;
          id v49 = (id)[*((id *)v157 + 33) humanReadableUpdateName];
          id v50 = v49;
          id v123 = v50;
          id v52 = (id)[v157 enrolledBetaProgram];
          char v121 = 0;
          if (v52)
          {
            id v122 = (id)[v157 enrolledBetaProgram];
            char v121 = 1;
            uint64_t v38 = [v122 programID];
          }
          else
          {
            uint64_t v38 = 0;
          }
          uint64_t v29 = v38;
          id v37 = (id)[v157 betaPrograms];
          uint64_t v30 = [v37 count];
          id v36 = (id)[v157 currentFullScanOperation];
          id v35 = (id)[v157 currentRefreshScanOperation];
          id v34 = (id)[v157 currentUpdateOperation];
          id v33 = (id)[v157 auxiliaryOperations];
          uint64_t v31 = v22;
          id v32 = v158;
          __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v158, (uint64_t)v113, (uint64_t)v66, v67, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v39, (uint64_t)v40, (uint64_t)v41, v42, v43, (uint64_t)v45, v48, (uint64_t)v50, v38, v30,
            (uint64_t)v36,
            (uint64_t)v35,
            (uint64_t)v34,
            [v33 count]);
          _os_log_impl(&dword_228401000, v63, v64[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "Can not unenroll from beta updates as we have not discovered a seeding device.",
            v32,
            0xDEu);

          if (v121) {
          if (v125)
          }

          if (v127) {
          if (v129)
          }

          if (v131) {
          if (v133)
          }

          id v28 = 0;
          objc_storeStrong(&v123, 0);
          objc_storeStrong(&v124, v28);
          objc_storeStrong(&v135, v28);
        }
        objc_storeStrong((id *)&v137, 0);
        int v155 = 1;
      }
    }
    else
    {
      id v112 = (id)[v157 log];
      osos_log_t log = (os_log_t)(id)[v112 oslog];

      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = oslog;
        *(_DWORD *)char v107 = type;
        id v108 = SUSettingsUIStateToString([v157 currentState]);
        id v109 = v108;
        id v152 = v109;
        uint64_t v110 = [v157 currentState];
        id v111 = (id)[v157 delegate];
        char v150 = 0;
        char v148 = 0;
        if (v111)
        {
          id v151 = (id)[v157 delegate];
          int v104 = 1;
          char v150 = 1;
          id v3 = (objc_class *)objc_opt_class();
          id v149 = NSStringFromClass(v3);
          char v148 = 1;
          char v105 = (__CFString *)v149;
        }
        else
        {
          char v105 = @"(null)";
        }
        id v98 = v105;
        id v99 = (id)[v157 delegate];
        id v100 = (id)[v157 scanError];
        id v101 = (id)[v157 preferredStatefulDescriptor];
        id v102 = (id)[v157 alternateStatefulDescriptor];
        id v103 = (id)[v157 currentDownload];
        char v146 = 0;
        char v144 = 0;
        char v142 = 0;
        if (v103)
        {
          id v147 = (id)[v157 currentDownload];
          int v96 = 1;
          char v146 = 1;
          id v145 = (id)[v147 descriptor];
          char v144 = 1;
          id v143 = (id)[v145 humanReadableUpdateName];
          char v142 = 1;
          char v97 = (__CFString *)v143;
        }
        else
        {
          char v97 = @"(null)";
        }
        id v82 = v97;
        id v83 = (id)[v157 currentDownload];
        char v4 = [v157 performThirdPartyScan];
        char v89 = "NO";
        char v5 = "YES";
        id v90 = "YES";
        int v94 = 1;
        if ((v4 & 1) == 0) {
          char v5 = "NO";
        }
        id v84 = v5;
        char v6 = [v157 isTargetedUpdateScheduledForAutoInstall];
        uint64_t v7 = (uint64_t)v90;
        if ((v6 & 1) == 0) {
          uint64_t v7 = (uint64_t)v89;
        }
        uint64_t v85 = v7;
        char v8 = [v157 hidingPreferredDescriptor];
        uint64_t v9 = (uint64_t)v90;
        if ((v8 & 1) == 0) {
          uint64_t v9 = (uint64_t)v89;
        }
        uint64_t v86 = v9;
        id v87 = (id)[*((id *)v157 + 32) humanReadableUpdateName];
        id v88 = v87;
        id v141 = v88;
        char v10 = [v157 hidingAlternateDescriptor];
        uint64_t v11 = (uint64_t)v90;
        if ((v10 & 1) == 0) {
          uint64_t v11 = (uint64_t)v89;
        }
        uint64_t v91 = v11;
        id v92 = (id)[*((id *)v157 + 33) humanReadableUpdateName];
        id v93 = v92;
        id v140 = v93;
        id v95 = (id)[v157 enrolledBetaProgram];
        char v138 = 0;
        if (v95)
        {
          id v139 = (id)[v157 enrolledBetaProgram];
          char v138 = 1;
          uint64_t v81 = [v139 programID];
        }
        else
        {
          uint64_t v81 = 0;
        }
        uint64_t v72 = v81;
        id v80 = (id)[v157 betaPrograms];
        uint64_t v73 = [v80 count];
        id v79 = (id)[v157 currentFullScanOperation];
        id v78 = (id)[v157 currentRefreshScanOperation];
        id v77 = (id)[v157 currentUpdateOperation];
        id v76 = (id)[v157 auxiliaryOperations];
        uint64_t v74 = v22;
        buf = v159;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v159, (uint64_t)v113, (uint64_t)v109, v110, (uint64_t)v98, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, v85, v86, (uint64_t)v88, v91, (uint64_t)v93, v81, v73,
          (uint64_t)v79,
          (uint64_t)v78,
          (uint64_t)v77,
          [v76 count]);
        _os_log_impl(&dword_228401000, log, v107[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not unenroll from beta updates as we are currently checking for updates.",
          buf,
          0xDEu);

        if (v138) {
        if (v142)
        }

        if (v144) {
        if (v146)
        }

        if (v148) {
        if (v150)
        }

        id obj = 0;
        objc_storeStrong(&v140, 0);
        objc_storeStrong(&v141, obj);
        objc_storeStrong(&v152, obj);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v155 = 1;
    }
  }
  else
  {
    int v155 = 1;
  }
  objc_storeStrong(location, 0);
}

void __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke(NSObject *a1, char a2)
{
  id v62 = a1;
  os_log_t v63 = "-[SUSettingsStatefulUIManager unenrollFromBetaUpdatesWithCompletion:]_block_invoke";
  uint64_t v98 = *MEMORY[0x263EF8340];
  int v96 = a1;
  char v95 = a2 & 1;
  oslog[1] = a1;
  id v61 = (id)[(objc_class *)a1[4].isa log];
  oslog[0] = (os_log_t)(id)[v61 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v56 = type;
    id v57 = SUSettingsUIStateToString([(objc_class *)v62[4].isa currentState]);
    id v58 = v57;
    id v92 = v58;
    uint64_t v59 = [(objc_class *)v62[4].isa currentState];
    id v60 = (id)[(objc_class *)v62[4].isa delegate];
    char v90 = 0;
    char v88 = 0;
    if (v60)
    {
      id v91 = (id)[(objc_class *)v62[4].isa delegate];
      int v53 = 1;
      char v90 = 1;
      uint64_t v2 = (objc_class *)objc_opt_class();
      id v89 = NSStringFromClass(v2);
      char v88 = 1;
      id v54 = (__CFString *)v89;
    }
    else
    {
      id v54 = @"(null)";
    }
    uint64_t v47 = v54;
    id v48 = (id)[(objc_class *)v62[4].isa delegate];
    id v49 = (id)[(objc_class *)v62[4].isa scanError];
    id v50 = (id)[(objc_class *)v62[4].isa preferredStatefulDescriptor];
    id v51 = (id)[(objc_class *)v62[4].isa alternateStatefulDescriptor];
    id v52 = (id)[(objc_class *)v62[4].isa currentDownload];
    char v86 = 0;
    char v84 = 0;
    char v82 = 0;
    if (v52)
    {
      id v87 = (id)[(objc_class *)v62[4].isa currentDownload];
      int v45 = 1;
      char v86 = 1;
      id v85 = (id)[v87 descriptor];
      char v84 = 1;
      id v83 = (id)[v85 humanReadableUpdateName];
      char v82 = 1;
      id v46 = (__CFString *)v83;
    }
    else
    {
      id v46 = @"(null)";
    }
    uint64_t v31 = v46;
    id v32 = (id)[(objc_class *)v62[4].isa currentDownload];
    char v3 = [(objc_class *)v62[4].isa performThirdPartyScan];
    uint64_t v38 = "NO";
    char v4 = "YES";
    id v39 = "YES";
    int v43 = 1;
    if ((v3 & 1) == 0) {
      char v4 = "NO";
    }
    id v33 = v4;
    char v5 = [(objc_class *)v62[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v39;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v38;
    }
    uint64_t v34 = v6;
    char v7 = [(objc_class *)v62[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v39;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v38;
    }
    uint64_t v35 = v8;
    id v36 = (id)[*((id *)v62[4].isa + 32) humanReadableUpdateName];
    id v37 = v36;
    id v81 = v37;
    char v9 = [(objc_class *)v62[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v39;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v38;
    }
    uint64_t v40 = v10;
    id v41 = (id)[*((id *)v62[4].isa + 33) humanReadableUpdateName];
    id v42 = v41;
    id location = v42;
    id v44 = (id)[(objc_class *)v62[4].isa enrolledBetaProgram];
    char v78 = 0;
    if (v44)
    {
      id v79 = (id)[(objc_class *)v62[4].isa enrolledBetaProgram];
      char v78 = 1;
      uint64_t v30 = [v79 programID];
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v21 = v30;
    id v29 = (id)[(objc_class *)v62[4].isa betaPrograms];
    uint64_t v22 = [v29 count];
    id v28 = (id)[(objc_class *)v62[4].isa currentFullScanOperation];
    id v27 = (id)[(objc_class *)v62[4].isa currentRefreshScanOperation];
    id v26 = (id)[(objc_class *)v62[4].isa currentUpdateOperation];
    id v25 = (id)[(objc_class *)v62[4].isa auxiliaryOperations];
    id v23 = &v11;
    buf = v97;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v97, (uint64_t)v63, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
      (uint64_t)v28,
      (uint64_t)v27,
      (uint64_t)v26,
      [v25 count],
      v95 & 1);
    _os_log_impl(&dword_228401000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Un-enroll from beta program success: %d",
      buf,
      0xE4u);

    if (v78) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    if (v88) {
    if (v90)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v81, obj);
    objc_storeStrong(&v92, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v95) {
    [(objc_class *)v62[4].isa setEnrolledBetaProgram:0];
  }
  [(objc_class *)v62[4].isa checkForAvailableUpdates];
  if (v62[5].isa)
  {
    id v18 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v18 selectDelegateCallbackQueue:*((void *)v62[4].isa + 5)];
    dispatch_block_t block = &v71;
    uint64_t v71 = MEMORY[0x263EF8330];
    int v72 = -1073741824;
    int v73 = 0;
    uint64_t v74 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_379;
    id v75 = &unk_26483BDD8;
    uint64_t v19 = (id *)&v76;
    id v76 = v62[5].isa;
    char v77 = v95 & 1;
    dispatch_async(queue, block);

    objc_storeStrong(v19, 0);
  }
  Class isa = v62[4].isa;
  id v12 = sel_statefulUIManager_didUnenrollDevice_fromBetaUpdatesProgram_;
  uint64_t v13 = &v64;
  uint64_t v64 = MEMORY[0x263EF8330];
  int v65 = -1073741824;
  int v66 = 0;
  uint64_t v67 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_2;
  id v68 = &unk_26483BE00;
  dispatch_queue_t v15 = (id *)&v69;
  id v69 = v62[4].isa;
  char v70 = v95 & 1;
  [(objc_class *)isa executeOperationOnDelegate:v12 usingBlock:v13];
  objc_storeStrong(v15, 0);
}

uint64_t __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_379(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) & 1);
}

void __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)[v2 currentSeedingDevice];
  objc_msgSend(v4, "statefulUIManager:didUnenrollDevice:fromBetaUpdatesProgram:", v2);
}

- (void)refreshBetaUpdates
{
}

- (void)refreshBetaUpdates:(id)a3
{
  id v69 = "-[SUSettingsStatefulUIManager refreshBetaUpdates:]";
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v70 = (id)[MEMORY[0x263F08C38] UUID];
  id v95 = (id)[v70 UUIDString];

  id v68 = (id)[v97 log];
  osos_log_t log = (os_log_t)(id)[v68 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)os_log_t v63 = type;
    id v64 = SUSettingsUIStateToString([v97 currentState]);
    id v65 = v64;
    id v92 = v65;
    uint64_t v66 = [v97 currentState];
    id v67 = (id)[v97 delegate];
    char v90 = 0;
    char v88 = 0;
    if (v67)
    {
      id v91 = (id)[v97 delegate];
      int v60 = 1;
      char v90 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v89 = NSStringFromClass(v3);
      char v88 = 1;
      id v61 = (__CFString *)v89;
    }
    else
    {
      id v61 = @"(null)";
    }
    id v54 = v61;
    id v55 = (id)[v97 delegate];
    id v56 = (id)[v97 scanError];
    id v57 = (id)[v97 preferredStatefulDescriptor];
    id v58 = (id)[v97 alternateStatefulDescriptor];
    id v59 = (id)[v97 currentDownload];
    char v86 = 0;
    char v84 = 0;
    char v82 = 0;
    if (v59)
    {
      id v87 = (id)[v97 currentDownload];
      int v52 = 1;
      char v86 = 1;
      id v85 = (id)[v87 descriptor];
      char v84 = 1;
      id v83 = (id)[v85 humanReadableUpdateName];
      char v82 = 1;
      int v53 = (__CFString *)v83;
    }
    else
    {
      int v53 = @"(null)";
    }
    uint64_t v38 = v53;
    id v39 = (id)[v97 currentDownload];
    char v4 = [v97 performThirdPartyScan];
    int v45 = "NO";
    char v5 = "YES";
    id v46 = "YES";
    int v50 = 1;
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    uint64_t v40 = v5;
    char v6 = [v97 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v46;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v45;
    }
    uint64_t v41 = v7;
    char v8 = [v97 hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v46;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v45;
    }
    uint64_t v42 = v9;
    id v43 = (id)[*((id *)v97 + 32) humanReadableUpdateName];
    id v44 = v43;
    id v81 = v44;
    char v10 = [v97 hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v46;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v45;
    }
    uint64_t v47 = v11;
    id v48 = (id)[*((id *)v97 + 33) humanReadableUpdateName];
    id v49 = v48;
    id v80 = v49;
    id v51 = (id)[v97 enrolledBetaProgram];
    char v78 = 0;
    if (v51)
    {
      id v79 = (id)[v97 enrolledBetaProgram];
      char v78 = 1;
      uint64_t v37 = [v79 programID];
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v28 = v37;
    id v36 = (id)[v97 betaPrograms];
    uint64_t v29 = [v36 count];
    id v35 = (id)[v97 currentFullScanOperation];
    id v34 = (id)[v97 currentRefreshScanOperation];
    id v33 = (id)[v97 currentUpdateOperation];
    id v32 = (id)[v97 auxiliaryOperations];
    uint64_t v12 = [v32 count];
    uint64_t v13 = *((void *)v97 + 23);
    uint64_t v14 = *((void *)v97 + 24);
    uint64_t v30 = &v17;
    buf = v98;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v98, (uint64_t)v69, (uint64_t)v65, v66, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40, v41, v42, (uint64_t)v44, v47, (uint64_t)v49, v37, v29,
      (uint64_t)v35,
      (uint64_t)v34,
      (uint64_t)v33,
      v12,
      (uint64_t)v95,
      v13,
      v14);
    _os_log_impl(&dword_228401000, log, v63[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning a beta updates scan operation with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
      buf,
      0xFCu);

    if (v78) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    if (v88) {
    if (v90)
    }

    id obj = 0;
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, obj);
    objc_storeStrong(&v92, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  dispatch_queue_t v15 = [SUSettingsScanOperation alloc];
  id v24 = &v95;
  char v16 = [(SUSettingsScanOperation *)v15 initWithUUID:v95 usingSUManagerClient:*((void *)v97 + 28) andBetaManager:*((void *)v97 + 29) withCompletionQueue:*((void *)v97 + 21)];
  id v23 = (id *)&v77;
  char v77 = v16;
  uint64_t v19 = v16;
  id v20 = (id)[v97 createScanOperationOptions];
  id v18 = &v71;
  uint64_t v71 = MEMORY[0x263EF8330];
  int v72 = -1073741824;
  int v73 = 0;
  uint64_t v74 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke;
  id v75 = &unk_26483BE78;
  uint64_t v22 = (id *)v76;
  v76[0] = v97;
  uint64_t v21 = (id *)(v18 + 5);
  id v25 = location;
  v76[1] = location[0];
  [(SUSettingsScanOperation *)v19 refreshBetaProgramsWithOptions:v20 completionHandler:v18];

  id v26 = 0;
  objc_storeStrong(v21, 0);
  objc_storeStrong(v22, v26);
  objc_storeStrong(v23, v26);
  objc_storeStrong(v24, v26);
  objc_storeStrong(v25, v26);
}

void __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke(id *a1, void *a2, void *a3)
{
  id v87 = a1;
  id obj = a3;
  id v85 = "-[SUSettingsStatefulUIManager refreshBetaUpdates:]_block_invoke";
  uint64_t v129 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v126 = 0;
  objc_storeStrong(&v126, obj);
  char v125 = v87;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v87[4] + 21));
  char v124 = 0;
  char v122 = 0;
  char v120 = 0;
  int v88 = 1;
  if (!v126)
  {
    id v84 = (id)[v87[4] enrolledBetaProgram];
    id v123 = v84;
    int v83 = 1;
    char v122 = 1;
    id v121 = (id)[location[0] enrolledBetaProgram];
    char v120 = 1;
    int v88 = objc_msgSend(v84, "isEqual:");
  }
  int v82 = v88;
  if (v120) {

  }
  if (v122) {
  char v124 = v82 & 1;
  }
  id v81 = (id)[v87[4] log];
  osos_log_t log = (os_log_t)(id)[v81 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v76 = type;
    id v77 = SUSettingsUIStateToString([v87[4] currentState]);
    id v78 = v77;
    id v117 = v78;
    uint64_t v79 = [v87[4] currentState];
    id v80 = (id)[v87[4] delegate];
    char v115 = 0;
    char v113 = 0;
    if (v80)
    {
      id v116 = (id)[v87[4] delegate];
      int v73 = 1;
      char v115 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v114 = NSStringFromClass(v3);
      char v113 = 1;
      uint64_t v74 = (__CFString *)v114;
    }
    else
    {
      uint64_t v74 = @"(null)";
    }
    id v67 = v74;
    id v68 = (id)[v87[4] delegate];
    id v69 = (id)[v87[4] scanError];
    id v70 = (id)[v87[4] preferredStatefulDescriptor];
    id v71 = (id)[v87[4] alternateStatefulDescriptor];
    id v72 = (id)[v87[4] currentDownload];
    char v111 = 0;
    char v109 = 0;
    char v107 = 0;
    if (v72)
    {
      id v112 = (id)[v87[4] currentDownload];
      int v65 = 1;
      char v111 = 1;
      id v110 = (id)[v112 descriptor];
      char v109 = 1;
      id v108 = (id)[v110 humanReadableUpdateName];
      char v107 = 1;
      uint64_t v66 = (__CFString *)v108;
    }
    else
    {
      uint64_t v66 = @"(null)";
    }
    id v51 = v66;
    id v52 = (id)[v87[4] currentDownload];
    char v4 = [v87[4] performThirdPartyScan];
    id v58 = "NO";
    char v5 = "YES";
    id v59 = "YES";
    int v63 = 1;
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    int v53 = v5;
    char v6 = [v87[4] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v59;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v58;
    }
    uint64_t v54 = v7;
    char v8 = [v87[4] hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v59;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v58;
    }
    uint64_t v55 = v9;
    id v56 = (id)[*((id *)v87[4] + 32) humanReadableUpdateName];
    id v57 = v56;
    id v106 = v57;
    char v10 = [v87[4] hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v59;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v58;
    }
    uint64_t v60 = v11;
    id v61 = (id)[*((id *)v87[4] + 33) humanReadableUpdateName];
    id v62 = v61;
    id v105 = v62;
    id v64 = (id)[v87[4] enrolledBetaProgram];
    char v103 = 0;
    if (v64)
    {
      id v104 = (id)[v87[4] enrolledBetaProgram];
      char v103 = 1;
      uint64_t v50 = [v104 programID];
    }
    else
    {
      uint64_t v50 = 0;
    }
    uint64_t v39 = v50;
    id v49 = (id)[v87[4] betaPrograms];
    uint64_t v40 = [v49 count];
    id v48 = (id)[v87[4] currentFullScanOperation];
    id v47 = (id)[v87[4] currentRefreshScanOperation];
    id v46 = (id)[v87[4] currentUpdateOperation];
    id v45 = (id)[v87[4] auxiliaryOperations];
    uint64_t v41 = [v45 count];
    id v12 = (id)[location[0] scanUUID];
    id v44 = v12;
    if (v124) {
      uint64_t v13 = "YES";
    }
    else {
      uint64_t v13 = "NO";
    }
    uint64_t v42 = &v24;
    buf = v128;
    __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_34_8_66((uint64_t)v128, (uint64_t)v85, (uint64_t)v78, v79, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v71, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, v54, v55, (uint64_t)v57, v60, (uint64_t)v62, v39, v40,
      (uint64_t)v48,
      (uint64_t)v47,
      (uint64_t)v46,
      v41,
      (uint64_t)v12,
      (uint64_t)v126,
      (uint64_t)v13,
      (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, v76[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a beta updates scan with ID: %{public}@.\n"
      "Error: %{public}@;\n"
      "Enrolled to a different beta program: %{public}s\n"
      "Results: %{public}@",
      buf,
      0x106u);

    if (v103) {
    if (v107)
    }

    if (v109) {
    if (v111)
    }

    if (v113) {
    if (v115)
    }

    id v38 = 0;
    objc_storeStrong(&v105, 0);
    objc_storeStrong(&v106, v38);
    objc_storeStrong(&v117, v38);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v126)
  {
    uint64_t v14 = (id *)((char *)v87[4] + 128);
    id v37 = 0;
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)v87[4] + 17, v37);
    objc_storeStrong((id *)v87[4] + 18, v37);
  }
  else
  {
    id v15 = (id)[location[0] currentSeedingDevice];
    char v16 = v87[4];
    uint64_t v17 = (void *)v16[16];
    v16[16] = v15;

    id v18 = (id)[location[0] betaPrograms];
    uint64_t v19 = v87[4];
    id v20 = (void *)v19[17];
    v19[17] = v18;

    id v21 = (id)[location[0] enrolledBetaProgram];
    uint64_t v22 = v87[4];
    id v23 = (void *)v22[18];
    v22[18] = v21;
  }
  id v36 = v87[4];
  id v34 = sel_statefulUIManagerDidRefreshBetaUpdates_;
  id v35 = &v97;
  uint64_t v97 = MEMORY[0x263EF8330];
  int v98 = -1073741824;
  int v99 = 0;
  id v100 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_386;
  id v101 = &unk_26483BA90;
  id v33 = &v102;
  id v102 = v87[4];
  [v36 executeOperationOnDelegate:v34 usingBlock:v35];
  if (v87[5])
  {
    id v28 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v28 selectDelegateCallbackQueue:*((void *)v87[4] + 5)];
    dispatch_block_t block = &v89;
    uint64_t v89 = MEMORY[0x263EF8330];
    int v90 = -1073741824;
    int v91 = 0;
    id v92 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_2;
    id v93 = &unk_26483BE50;
    uint64_t v31 = &v96;
    id v96 = v87[5];
    uint64_t v30 = (id *)((char *)block + 32);
    id v94 = location[0];
    uint64_t v29 = (id *)((char *)block + 40);
    id v95 = v126;
    dispatch_async(queue, block);

    id v32 = 0;
    objc_storeStrong(v29, 0);
    objc_storeStrong(v30, v32);
    objc_storeStrong(v31, v32);
  }
  if (v124) {
    [v87[4] checkForAvailableUpdates];
  }
  id v25 = 0;
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v126, v25);
  objc_storeStrong(location, v25);
}

void __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_386(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshBetaUpdates:*(void *)(a1 + 32)];
}

uint64_t __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)hasSUPathRestrictions
{
  return self->_mdmPathRestrictions != 0;
}

- (BOOL)isDelayingUpdate
{
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  char v5 = 0;
  BOOL v4 = 1;
  if (!self->_delayingUpdate)
  {
    id v12 = [(SUSettingsStatefulUIManager *)self scanError];
    char v11 = 1;
    BOOL v3 = 0;
    if (v12)
    {
      char v10 = [(SUSettingsStatefulUIManager *)self scanError];
      char v9 = 1;
      char v8 = [(NSError *)v10 domain];
      char v7 = 1;
      BOOL v3 = 0;
      if ([(NSString *)v8 isEqualToString:*MEMORY[0x263F78360]])
      {
        char v6 = [(SUSettingsStatefulUIManager *)self scanError];
        char v5 = 1;
        BOOL v3 = [(NSError *)v6 code] == 55;
      }
    }
    BOOL v4 = v3;
  }
  if (v5) {

  }
  if (v7) {
  if (v9)
  }

  if (v11) {
  return v4;
  }
}

- (BOOL)isPreferredUpdatePromotedAsAlternate
{
  char v5 = [(SUSettingsStatefulUIManager *)self preferredStatefulDescriptor];
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if (v5)
  {
    id v12 = [(SUSettingsStatefulUIManager *)self alternateStatefulDescriptor];
    char v11 = 1;
    BOOL v6 = 0;
    if (!v12)
    {
      char v10 = [(SUSettingsStatefulUIManager *)self preferredStatefulDescriptor];
      char v9 = 1;
      char v8 = [(SUSettingsStatefulDescriptor *)v10 descriptor];
      char v7 = 1;
      BOOL v6 = 0;
      if ([(SUDescriptor *)v8 audienceType] == 1) {
        BOOL v6 = !self->_hidingPreferredDescriptor;
      }
    }
  }
  if (v7) {

  }
  if (v9) {
  if (v11)
  }

  if (v6)
  {
    BOOL v4 = [(SUSettingsStatefulUIManager *)self preferredStatefulDescriptor];
    BOOL v3 = [(SUSettingsStatefulDescriptor *)v4 descriptor];
    char v14 = [(SUDescriptor *)v3 promoteAlternateUpdate] & 1;
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

- (void)rvTriggerNeRDUpdate
{
}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __51__SUSettingsStatefulUIManager_rvTriggerNeRDUpdate___block_invoke;
  char v8 = &unk_26483BAB8;
  char v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__SUSettingsStatefulUIManager_rvTriggerNeRDUpdate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 224);
  if (*(void *)(a1 + 40)) {
    return [v2 rvTriggerNeRDUpdate:*(void *)(a1 + 40)];
  }
  else {
    return [v2 rvTriggerNeRDUpdate:MEMORY[0x263EFFA78]];
  }
}

- (id)rvGetCurrentNeRDInfo
{
  return [(SUManagerClient *)self->_suClient rvGetCurrentNeRDInfo];
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  char v16 = self;
  SEL v15 = a2;
  int v14 = a3;
  int v13 = a4;
  dispatch_queue_t queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  char v8 = __75__SUSettingsStatefulUIManager_networkChangedFromNetworkType_toNetworkType___block_invoke;
  char v9 = &unk_26483BEA0;
  id v10 = self;
  int v11 = v13;
  int v12 = v14;
  dispatch_async(queue, &v5);
  objc_storeStrong((id *)&v10, 0);
}

void __75__SUSettingsStatefulUIManager_networkChangedFromNetworkType_toNetworkType___block_invoke(NSObject *a1)
{
  id v96 = a1;
  id v94 = "-[SUSettingsStatefulUIManager networkChangedFromNetworkType:toNetworkType:]_block_invoke";
  uint64_t v118 = *MEMORY[0x263EF8340];
  os_log_t oslog[2] = a1;
  oslog[1] = a1;
  id obj = a1[4].isa;
  objc_sync_enter(obj);
  if (LODWORD(v96[5].isa) != *((_DWORD *)v96[4].isa + 5))
  {
    id v93 = (id)[(objc_class *)v96[4].isa log];
    id v91 = v93;
    id v92 = (id)[v91 oslog];
    oslog[0] = (os_log_t)v92;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog[0];
      *(_DWORD *)uint64_t v89 = type;
      uint64_t v90 = [(objc_class *)v96[4].isa currentState];
      id v87 = SUSettingsUIStateToString(v90);
      id v84 = v87;
      id v85 = v84;
      id v114 = v85;
      uint64_t v86 = [(objc_class *)v96[4].isa currentState];
      Class isa = v96[4].isa;
      char v112 = 0;
      char v110 = 0;
      id v83 = (id)[(objc_class *)isa delegate];
      id v82 = v83;
      if (v82)
      {
        id v81 = (id)[(objc_class *)v96[4].isa delegate];
        id v113 = v81;
        char v112 = 1;
        Class aClass = (Class)objc_opt_class();
        id v79 = NSStringFromClass(aClass);
        id v111 = v79;
        char v110 = 1;
        id v78 = (__CFString *)v111;
      }
      else
      {
        id v78 = @"(null)";
      }
      id v76 = v78;
      id v77 = (id)[(objc_class *)v96[4].isa delegate];
      id v74 = v77;
      id v75 = (id)[(objc_class *)v96[4].isa scanError];
      id v72 = v75;
      id v73 = (id)[(objc_class *)v96[4].isa preferredStatefulDescriptor];
      id v70 = v73;
      id v71 = (id)[(objc_class *)v96[4].isa alternateStatefulDescriptor];
      id v68 = v71;
      Class v2 = v96[4].isa;
      char v108 = 0;
      char v106 = 0;
      char v104 = 0;
      id v69 = (id)[(objc_class *)v2 currentDownload];
      id v67 = v69;
      if (v67)
      {
        id v66 = (id)[(objc_class *)v96[4].isa currentDownload];
        id v109 = v66;
        char v108 = 1;
        id v65 = (id)[v109 descriptor];
        id v107 = v65;
        char v106 = 1;
        id v64 = (id)[v107 humanReadableUpdateName];
        id v105 = v64;
        char v104 = 1;
        int v63 = (__CFString *)v105;
      }
      else
      {
        int v63 = @"(null)";
      }
      id v61 = v63;
      id v62 = (id)[(objc_class *)v96[4].isa currentDownload];
      id v59 = v62;
      int v60 = [(objc_class *)v96[4].isa performThirdPartyScan];
      BOOL v3 = "YES";
      if ((v60 & 1) == 0) {
        BOOL v3 = "NO";
      }
      id v57 = v3;
      int v58 = [(objc_class *)v96[4].isa isTargetedUpdateScheduledForAutoInstall];
      uint64_t v4 = "YES";
      if ((v58 & 1) == 0) {
        uint64_t v4 = "NO";
      }
      uint64_t v55 = v4;
      int v56 = [(objc_class *)v96[4].isa hidingPreferredDescriptor];
      uint64_t v5 = "YES";
      if ((v56 & 1) == 0) {
        uint64_t v5 = "NO";
      }
      int v53 = v5;
      id v54 = (id)[*((id *)v96[4].isa + 32) humanReadableUpdateName];
      id v50 = v54;
      id v51 = v50;
      id v103 = v51;
      int v52 = [(objc_class *)v96[4].isa hidingAlternateDescriptor];
      int v6 = "YES";
      if ((v52 & 1) == 0) {
        int v6 = "NO";
      }
      id v48 = v6;
      id v49 = (id)[*((id *)v96[4].isa + 33) humanReadableUpdateName];
      id v45 = v49;
      id v46 = v45;
      id v102 = v46;
      Class v7 = v96[4].isa;
      char v100 = 0;
      id v47 = (id)[(objc_class *)v7 enrolledBetaProgram];
      id v44 = v47;
      if (v44)
      {
        id v43 = (id)[(objc_class *)v96[4].isa enrolledBetaProgram];
        id v101 = v43;
        char v100 = 1;
        uint64_t v42 = [v101 programID];
        uint64_t v41 = v42;
      }
      else
      {
        uint64_t v41 = 0;
      }
      uint64_t v39 = v41;
      id v40 = (id)[(objc_class *)v96[4].isa betaPrograms];
      id v37 = v40;
      uint64_t v38 = [v37 count];
      id v36 = (id)[(objc_class *)v96[4].isa currentFullScanOperation];
      id v34 = v36;
      id v35 = (id)[(objc_class *)v96[4].isa currentRefreshScanOperation];
      id v32 = v35;
      id v33 = (id)[(objc_class *)v96[4].isa currentUpdateOperation];
      id v30 = v33;
      id v31 = (id)[(objc_class *)v96[4].isa auxiliaryOperations];
      id v28 = v31;
      uint64_t v29 = [v28 count];
      id v27 = (id)SUStringFromNetworkType();
      id v23 = v27;
      id v24 = v23;
      id v99 = v24;
      int isa_high = HIDWORD(v96[5].isa);
      id v26 = (id)SUStringFromNetworkType();
      id v19 = v26;
      id v20 = v19;
      id v98 = v20;
      int v21 = (int)v96[5].isa;
      id v22 = (id)SUStringFromNetworkType();
      id v18 = v22;
      id location = v18;
      int v8 = *((_DWORD *)v96[4].isa + 5);
      char v16 = &v10;
      buf = v117;
      __os_log_helper_16_2_28_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_64_4_0_8_66_4_0_8_66_4_0((uint64_t)v117, (uint64_t)v94, (uint64_t)v85, v86, (uint64_t)v76, (uint64_t)v74, (uint64_t)v72, (uint64_t)v70, (uint64_t)v68, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v55, (uint64_t)v53, (uint64_t)v51, (uint64_t)v48, (uint64_t)v46, v41, v38,
        (uint64_t)v34,
        (uint64_t)v32,
        (uint64_t)v30,
        v29,
        (uint64_t)v24,
        isa_high,
        (uint64_t)v20,
        v21,
        (uint64_t)location,
        v8);
      _os_log_impl(&dword_228401000, log, v89[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Changed network type: %@ (%d) -> %{public}@ (%d) (current network type: %{public}@ (%d))",
        buf,
        0x10Eu);

      if (v100) {
      if (v104)
      }

      if (v106) {
      if (v108)
      }

      if (v110) {
      if (v112)
      }

      objc_storeStrong(&location, 0);
      objc_storeStrong(&v98, 0);
      objc_storeStrong(&v99, 0);
      objc_storeStrong(&v102, 0);
      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v114, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    char v9 = v96;
    *((_DWORD *)v96[4].isa + 5) = v96[5].isa;
    if (LODWORD(v9[5].isa))
    {
      if ((*((void *)v96[4].isa + 10) || (uint64_t v15 = [(objc_class *)v96[4].isa currentState], v15 == 3))
        && (uint64_t v14 = [(objc_class *)v96[4].isa currentState], v14 != 2))
      {
        [(objc_class *)v96[4].isa setScanError:0];
        [(objc_class *)v96[4].isa refreshState:1];
      }
      else
      {
        [(objc_class *)v96[4].isa checkForAvailableUpdatesWithRetriesCount:kSUSettingsStatefulUINetworkErrorRetriesCount];
      }
    }
    else
    {
      uint64_t v13 = [(objc_class *)v96[4].isa currentState];
      if (v13 != 2)
      {
        id v12 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:7 userInfo:0];
        id v11 = v12;
        -[objc_class setScanError:](v96[4].isa, "setScanError:");

        [(objc_class *)v96[4].isa refreshState];
      }
    }
  }
  objc_sync_exit(obj);
}

- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  char v133 = &v152;
  id obj = a4;
  char v131 = "-[SUSettingsStatefulUIManager client:scanRequestDidStartForOptions:]";
  uint64_t v169 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v165 = 0;
  objc_storeStrong(&v165, obj);
  char v164 = 0;
  BOOL v134 = 1;
  if (v165)
  {
    id v4 = (id)[*((id *)v133 + 19) identifier];
    *((void *)v133 + 18) = v4;
    char v164 = 1;
    BOOL v134 = v4 == 0;
  }
  BOOL v130 = v134;
  if (v164) {

  }
  if (v130)
  {
    id v129 = (id)[*((id *)v133 + 22) log];
    id v5 = (id)[v129 oslog];
    id v6 = v129;
    *((void *)v133 + 16) = v5;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(*((os_log_t *)v133 + 16), OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)*((void *)v133 + 16);
      *(_DWORD *)char v124 = type;
      id v125 = SUSettingsUIStateToString([*((id *)v133 + 22) currentState]);
      id v7 = v125;
      int v8 = (id *)v133;
      uint64_t v126 = (uint64_t)v7;
      *((void *)v133 + 14) = v7;
      uint64_t v127 = [v8[22] currentState];
      id v128 = (id)[*((id *)v133 + 22) delegate];
      char v160 = 0;
      char v159 = 0;
      if (v128)
      {
        *((void *)v133 + 13) = (id)[*((id *)v133 + 22) delegate];
        int v121 = 1;
        char v160 = 1;
        char v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        *((void *)v133 + 11) = v10;
        char v159 = 1;
        char v122 = (__CFString *)v10;
      }
      else
      {
        char v122 = @"(null)";
      }
      char v115 = v122;
      id v116 = (id)[*((id *)v133 + 22) delegate];
      id v117 = (id)[*((id *)v133 + 22) scanError];
      id v118 = (id)[*((id *)v133 + 22) preferredStatefulDescriptor];
      id v119 = (id)[*((id *)v133 + 22) alternateStatefulDescriptor];
      id v120 = (id)[*((id *)v133 + 22) currentDownload];
      char v158 = 0;
      char v157 = 0;
      char v156 = 0;
      if (v120)
      {
        id v11 = (id)[*((id *)v133 + 22) currentDownload];
        *((void *)v133 + 9) = v11;
        int v113 = 1;
        char v158 = 1;
        id v12 = (id)[v11 descriptor];
        *((void *)v133 + 7) = v12;
        char v157 = 1;
        uint64_t v13 = (__CFString *)(id)[v12 humanReadableUpdateName];
        char v14 = v113;
        *((void *)v133 + 5) = v13;
        char v156 = v14 & 1;
        id v114 = v13;
      }
      else
      {
        id v114 = @"(null)";
      }
      id v99 = v114;
      id v100 = (id)[*((id *)v133 + 22) currentDownload];
      char v15 = [*((id *)v133 + 22) performThirdPartyScan];
      char v106 = "NO";
      char v16 = "YES";
      id v107 = "YES";
      int v111 = 1;
      if ((v15 & 1) == 0) {
        char v16 = "NO";
      }
      id v101 = v16;
      char v17 = [*((id *)v133 + 22) isTargetedUpdateScheduledForAutoInstall];
      uint64_t v18 = (uint64_t)v107;
      if ((v17 & 1) == 0) {
        uint64_t v18 = (uint64_t)v106;
      }
      uint64_t v102 = v18;
      char v19 = [*((id *)v133 + 22) hidingPreferredDescriptor];
      uint64_t v20 = (uint64_t)v107;
      if ((v19 & 1) == 0) {
        uint64_t v20 = (uint64_t)v106;
      }
      uint64_t v103 = v20;
      id v104 = (id)[*(id *)(*((void *)v133 + 22) + 256) humanReadableUpdateName];
      id v21 = v104;
      id v22 = (id *)v133;
      uint64_t v105 = (uint64_t)v21;
      *((void *)v133 + 3) = v21;
      char v23 = [v22[22] hidingAlternateDescriptor];
      uint64_t v24 = (uint64_t)v107;
      if ((v23 & 1) == 0) {
        uint64_t v24 = (uint64_t)v106;
      }
      uint64_t v108 = v24;
      id v109 = (id)[*(id *)(*((void *)v133 + 22) + 264) humanReadableUpdateName];
      id v25 = v109;
      id v26 = (id *)v133;
      uint64_t v110 = (uint64_t)v25;
      *((void *)v133 + 2) = v25;
      id v112 = (id)[v26[22] enrolledBetaProgram];
      char v153 = 0;
      if (v112)
      {
        id v27 = (id)[*((id *)v133 + 22) enrolledBetaProgram];
        *((void *)v133 + 1) = v27;
        char v153 = 1;
        uint64_t v98 = [v27 programID];
      }
      else
      {
        uint64_t v98 = 0;
      }
      uint64_t v89 = v98;
      id v97 = (id)[*((id *)v133 + 22) betaPrograms];
      uint64_t v90 = [v97 count];
      id v96 = (id)[*((id *)v133 + 22) currentFullScanOperation];
      id v95 = (id)[*((id *)v133 + 22) currentRefreshScanOperation];
      id v94 = (id)[*((id *)v133 + 22) currentUpdateOperation];
      id v93 = (id)[*((id *)v133 + 22) auxiliaryOperations];
      id v91 = &v37;
      buf = v168;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v168, (uint64_t)v131, v126, v127, (uint64_t)v115, (uint64_t)v116, (uint64_t)v117, (uint64_t)v118, (uint64_t)v119, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101, v102, v103, v105, v108, v110, v98, v90,
        (uint64_t)v96,
        (uint64_t)v95,
        (uint64_t)v94,
        [v93 count]);
      _os_log_impl(&dword_228401000, log, v124[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Scan has finished, but we've been given a nil options. Skipping.",
        buf,
        0xDEu);

      if (v153) {
      if (v156)
      }

      if (v157) {
      if (v158)
      }

      if (v159) {
      if (v160)
      }

      id v88 = 0;
      objc_storeStrong(&v154, 0);
      objc_storeStrong(&v155, v88);
      objc_storeStrong(&v161, v88);
    }
    objc_storeStrong(&v163, 0);
    *(_DWORD *)char v133 = 1;
  }
  else
  {
    id v87 = (id)[*((id *)v133 + 22) log];
    osos_log_t log = (os_log_t)(id)[v87 oslog];

    os_log_type_t v150 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v81 = oslog;
      *(_DWORD *)id v82 = v150;
      id v83 = SUSettingsUIStateToString([*((id *)v133 + 22) currentState]);
      id v84 = v83;
      id v149 = v84;
      uint64_t v85 = [*((id *)v133 + 22) currentState];
      id v86 = (id)[*((id *)v133 + 22) delegate];
      char v147 = 0;
      char v145 = 0;
      if (v86)
      {
        id v148 = (id)[*((id *)v133 + 22) delegate];
        int v79 = 1;
        char v147 = 1;
        id v28 = (objc_class *)objc_opt_class();
        id v146 = NSStringFromClass(v28);
        char v145 = 1;
        id v80 = (__CFString *)v146;
      }
      else
      {
        id v80 = @"(null)";
      }
      id v73 = v80;
      id v74 = (id)[*((id *)v133 + 22) delegate];
      id v75 = (id)[*((id *)v133 + 22) scanError];
      id v76 = (id)[*((id *)v133 + 22) preferredStatefulDescriptor];
      id v77 = (id)[*((id *)v133 + 22) alternateStatefulDescriptor];
      id v78 = (id)[*((id *)v133 + 22) currentDownload];
      char v143 = 0;
      char v141 = 0;
      char v139 = 0;
      if (v78)
      {
        id v144 = (id)[*((id *)v133 + 22) currentDownload];
        int v71 = 1;
        char v143 = 1;
        id v142 = (id)[v144 descriptor];
        char v141 = 1;
        id v140 = (id)[v142 humanReadableUpdateName];
        char v139 = 1;
        id v72 = (__CFString *)v140;
      }
      else
      {
        id v72 = @"(null)";
      }
      id v57 = v72;
      id v58 = (id)[*((id *)v133 + 22) currentDownload];
      char v29 = [*((id *)v133 + 22) performThirdPartyScan];
      id v64 = "NO";
      id v30 = "YES";
      id v65 = "YES";
      int v69 = 1;
      if ((v29 & 1) == 0) {
        id v30 = "NO";
      }
      id v59 = v30;
      char v31 = [*((id *)v133 + 22) isTargetedUpdateScheduledForAutoInstall];
      uint64_t v32 = (uint64_t)v65;
      if ((v31 & 1) == 0) {
        uint64_t v32 = (uint64_t)v64;
      }
      uint64_t v60 = v32;
      char v33 = [*((id *)v133 + 22) hidingPreferredDescriptor];
      uint64_t v34 = (uint64_t)v65;
      if ((v33 & 1) == 0) {
        uint64_t v34 = (uint64_t)v64;
      }
      uint64_t v61 = v34;
      id v62 = (id)[*(id *)(*((void *)v133 + 22) + 256) humanReadableUpdateName];
      id v63 = v62;
      id v138 = v63;
      char v35 = [*((id *)v133 + 22) hidingAlternateDescriptor];
      uint64_t v36 = (uint64_t)v65;
      if ((v35 & 1) == 0) {
        uint64_t v36 = (uint64_t)v64;
      }
      uint64_t v66 = v36;
      id v67 = (id)[*(id *)(*((void *)v133 + 22) + 264) humanReadableUpdateName];
      id v68 = v67;
      id v137 = v68;
      id v70 = (id)[*((id *)v133 + 22) enrolledBetaProgram];
      char v135 = 0;
      if (v70)
      {
        id v136 = (id)[*((id *)v133 + 22) enrolledBetaProgram];
        char v135 = 1;
        uint64_t v56 = [v136 programID];
      }
      else
      {
        uint64_t v56 = 0;
      }
      uint64_t v45 = v56;
      id v55 = (id)[*((id *)v133 + 22) betaPrograms];
      uint64_t v46 = [v55 count];
      id v54 = (id)[*((id *)v133 + 22) currentFullScanOperation];
      id v53 = (id)[*((id *)v133 + 22) currentRefreshScanOperation];
      id v52 = (id)[*((id *)v133 + 22) currentUpdateOperation];
      id v51 = (id)[*((id *)v133 + 22) auxiliaryOperations];
      uint64_t v47 = [v51 count];
      id v50 = (id)[*((id *)v133 + 19) identifier];
      id v48 = &v37;
      id v49 = v167;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v167, (uint64_t)v131, (uint64_t)v84, v85, (uint64_t)v73, (uint64_t)v74, (uint64_t)v75, (uint64_t)v76, (uint64_t)v77, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, v60, v61, (uint64_t)v63, v66, (uint64_t)v68, v56, v46,
        (uint64_t)v54,
        (uint64_t)v53,
        (uint64_t)v52,
        v47,
        (uint64_t)v50);
      _os_log_impl(&dword_228401000, v81, v82[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Scan has started on behalf of: %{public}@",
        v49,
        0xE8u);

      if (v135) {
      if (v139)
      }

      if (v141) {
      if (v143)
      }

      if (v145) {
      if (v147)
      }

      id v44 = 0;
      objc_storeStrong(&v137, 0);
      objc_storeStrong(&v138, v44);
      objc_storeStrong(&v149, v44);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v42 = (id)[*((id *)v133 + 19) identifier];
    int v43 = [v42 isEqualToString:@"com.apple.Preferences.software_update"];

    if (v43)
    {
      *(_DWORD *)char v133 = 1;
    }
    else
    {
      [*((id *)v133 + 22) setPerformThirdPartyScan:1];
      id v40 = *(id *)(*((void *)v133 + 22) + 216);
      uint64_t v39 = @"PerformThirdPartyScan";
      id v41 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
      objc_msgSend(v40, "postEvent:withInfo:", v39);

      *(_DWORD *)char v133 = 0;
    }
  }
  id v38 = 0;
  objc_storeStrong(&v165, 0);
  objc_storeStrong(location, v38);
}

- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v186 = &v207;
  id obj = a4;
  id v188 = a5;
  id v189 = a6;
  id v190 = "-[SUSettingsStatefulUIManager client:scanRequestDidFinishForOptions:results:error:]";
  uint64_t v229 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v224 = 0;
  objc_storeStrong(&v224, obj);
  id v223 = 0;
  objc_storeStrong(&v223, v188);
  id v222 = 0;
  objc_storeStrong(&v222, v189);
  char v221 = 0;
  BOOL v185 = 1;
  if (v224)
  {
    id v184 = (id)[v186[24] identifier];
    id v6 = v184;
    v186[21] = v6;
    char v221 = 1;
    BOOL v185 = v6 == 0;
  }
  BOOL v183 = v185;
  if (v221) {

  }
  if (v183)
  {
    id v182 = (id)[v186[27] log];
    id v180 = v182;
    id v181 = (id)[v180 oslog];
    id v7 = v181;
    id v8 = v180;
    v186[19] = v7;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v186[19], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)v186[19];
      *(_DWORD *)os_log_t v178 = type;
      uint64_t v179 = [v186[27] currentState];
      id v176 = SUSettingsUIStateToString(v179);
      id v173 = v176;
      id v9 = v173;
      uint64_t v10 = v186;
      uint64_t v174 = (uint64_t)v9;
      v186[17] = v9;
      uint64_t v175 = [v10[27] currentState];
      id v172 = (id)[v186[27] delegate];
      id v171 = v172;
      char v217 = 0;
      char v216 = 0;
      if (v171)
      {
        id v170 = (id)[v186[27] delegate];
        v186[16] = v170;
        char v217 = 1;
        Class aClass = (Class)objc_opt_class();
        id v168 = NSStringFromClass(aClass);
        id v11 = (__CFString *)v168;
        v186[14] = v11;
        char v216 = 1;
        id v167 = v11;
      }
      else
      {
        id v167 = @"(null)";
      }
      id v165 = v167;
      id v166 = (id)[v186[27] delegate];
      id v163 = v166;
      id v164 = (id)[v186[27] scanError];
      id v161 = v164;
      id v162 = (id)[v186[27] preferredStatefulDescriptor];
      id v159 = v162;
      id v160 = (id)[v186[27] alternateStatefulDescriptor];
      id v157 = v160;
      id v158 = (id)[v186[27] currentDownload];
      id v156 = v158;
      char v215 = 0;
      char v214 = 0;
      char v213 = 0;
      if (v156)
      {
        id v155 = (id)[v186[27] currentDownload];
        id v12 = v155;
        v186[12] = v12;
        char v215 = 1;
        id v154 = (id)[v12 descriptor];
        id v13 = v154;
        v186[10] = v13;
        char v214 = 1;
        id v153 = (id)[v13 humanReadableUpdateName];
        char v14 = (__CFString *)v153;
        v186[8] = v14;
        char v213 = 1;
        char v152 = v14;
      }
      else
      {
        char v152 = @"(null)";
      }
      os_log_type_t v150 = v152;
      id v151 = (id)[v186[27] currentDownload];
      id v148 = v151;
      int v149 = [v186[27] performThirdPartyScan];
      char v15 = "YES";
      if ((v149 & 1) == 0) {
        char v15 = "NO";
      }
      id v146 = v15;
      int v147 = [v186[27] isTargetedUpdateScheduledForAutoInstall];
      char v16 = "YES";
      if ((v147 & 1) == 0) {
        char v16 = "NO";
      }
      id v144 = v16;
      int v145 = [v186[27] hidingPreferredDescriptor];
      char v17 = "YES";
      if ((v145 & 1) == 0) {
        char v17 = "NO";
      }
      id v142 = v17;
      id v143 = (id)[*((id *)v186[27] + 32) humanReadableUpdateName];
      id v139 = v143;
      id v18 = v139;
      char v19 = v186;
      uint64_t v140 = (uint64_t)v18;
      v186[6] = v18;
      int v141 = [v19[27] hidingAlternateDescriptor];
      uint64_t v20 = "YES";
      if ((v141 & 1) == 0) {
        uint64_t v20 = "NO";
      }
      id v137 = v20;
      id v138 = (id)[*((id *)v186[27] + 33) humanReadableUpdateName];
      id v134 = v138;
      id v21 = v134;
      id v22 = v186;
      uint64_t v135 = (uint64_t)v21;
      v186[5] = v21;
      id v136 = (id)[v22[27] enrolledBetaProgram];
      id v133 = v136;
      char v210 = 0;
      if (v133)
      {
        id v132 = (id)[v186[27] enrolledBetaProgram];
        id v23 = v132;
        v186[4] = v23;
        char v210 = 1;
        uint64_t v131 = [v23 programID];
        uint64_t v130 = v131;
      }
      else
      {
        uint64_t v130 = 0;
      }
      uint64_t v128 = v130;
      id v129 = (id)[v186[27] betaPrograms];
      id v126 = v129;
      uint64_t v127 = [v126 count];
      id v125 = (id)[v186[27] currentFullScanOperation];
      id v123 = v125;
      id v124 = (id)[v186[27] currentRefreshScanOperation];
      id v121 = v124;
      id v122 = (id)[v186[27] currentUpdateOperation];
      id v119 = v122;
      id v120 = (id)[v186[27] auxiliaryOperations];
      id v117 = v120;
      uint64_t v118 = [v117 count];
      char v115 = &v34;
      buf = v228;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v228, (uint64_t)v190, v174, v175, (uint64_t)v165, (uint64_t)v163, (uint64_t)v161, (uint64_t)v159, (uint64_t)v157, (uint64_t)v150, (uint64_t)v148, (uint64_t)v146, (uint64_t)v144, (uint64_t)v142, v140, (uint64_t)v137, v135, v130, v127,
        (uint64_t)v123,
        (uint64_t)v121,
        (uint64_t)v119,
        v118);
      _os_log_impl(&dword_228401000, log, v178[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Scan has finished, but we've been given a nil options. Skipping.",
        buf,
        0xDEu);

      if (v210) {
      if (v213)
      }

      if (v214) {
      if (v215)
      }

      if (v216) {
      if (v217)
      }

      objc_storeStrong(&v211, 0);
      objc_storeStrong(&v212, 0);
      objc_storeStrong(&v218, 0);
    }
    objc_storeStrong(&v220, 0);
    *((_DWORD *)v186 + 6) = 1;
  }
  else
  {
    id v114 = (id)[v186[27] log];
    id v112 = v114;
    id v113 = (id)[v112 oslog];
    id v24 = v113;
    id v25 = v112;
    v186[2] = v24;

    os_log_type_t v208 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v186[2], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v109 = (os_log_t)v186[2];
      *(_DWORD *)uint64_t v110 = v208;
      uint64_t v111 = [v186[27] currentState];
      id v108 = SUSettingsUIStateToString(v111);
      id v105 = v108;
      id v26 = v105;
      id v27 = v186;
      uint64_t v106 = (uint64_t)v26;
      *id v186 = v26;
      uint64_t v107 = [v27[27] currentState];
      id v104 = (id)[v186[27] delegate];
      id v103 = v104;
      char v205 = 0;
      char v203 = 0;
      if (v103)
      {
        id v102 = (id)[v186[27] delegate];
        id v206 = v102;
        char v205 = 1;
        Class v101 = (Class)objc_opt_class();
        id v100 = NSStringFromClass(v101);
        id v204 = v100;
        char v203 = 1;
        id v99 = (__CFString *)v204;
      }
      else
      {
        id v99 = @"(null)";
      }
      id v97 = v99;
      id v98 = (id)[v186[27] delegate];
      id v95 = v98;
      id v96 = (id)[v186[27] scanError];
      id v93 = v96;
      id v94 = (id)[v186[27] preferredStatefulDescriptor];
      id v91 = v94;
      id v92 = (id)[v186[27] alternateStatefulDescriptor];
      id v89 = v92;
      id v90 = (id)[v186[27] currentDownload];
      id v88 = v90;
      char v201 = 0;
      char v199 = 0;
      char v197 = 0;
      if (v88)
      {
        id v87 = (id)[v186[27] currentDownload];
        id v202 = v87;
        char v201 = 1;
        id v86 = (id)[v202 descriptor];
        id v200 = v86;
        char v199 = 1;
        id v85 = (id)[v200 humanReadableUpdateName];
        id v198 = v85;
        char v197 = 1;
        id v84 = (__CFString *)v198;
      }
      else
      {
        id v84 = @"(null)";
      }
      id v82 = v84;
      id v83 = (id)[v186[27] currentDownload];
      id v80 = v83;
      int v81 = [v186[27] performThirdPartyScan];
      id v28 = "YES";
      if ((v81 & 1) == 0) {
        id v28 = "NO";
      }
      id v78 = v28;
      int v79 = [v186[27] isTargetedUpdateScheduledForAutoInstall];
      char v29 = "YES";
      if ((v79 & 1) == 0) {
        char v29 = "NO";
      }
      id v76 = v29;
      int v77 = [v186[27] hidingPreferredDescriptor];
      id v30 = "YES";
      if ((v77 & 1) == 0) {
        id v30 = "NO";
      }
      id v74 = v30;
      id v75 = (id)[*((id *)v186[27] + 32) humanReadableUpdateName];
      id v71 = v75;
      id v72 = v71;
      id v196 = v72;
      int v73 = [v186[27] hidingAlternateDescriptor];
      char v31 = "YES";
      if ((v73 & 1) == 0) {
        char v31 = "NO";
      }
      int v69 = v31;
      id v70 = (id)[*((id *)v186[27] + 33) humanReadableUpdateName];
      id v66 = v70;
      id v67 = v66;
      id v195 = v67;
      id v68 = (id)[v186[27] enrolledBetaProgram];
      id v65 = v68;
      char v193 = 0;
      if (v65)
      {
        id v64 = (id)[v186[27] enrolledBetaProgram];
        id v194 = v64;
        char v193 = 1;
        uint64_t v63 = [v194 programID];
        uint64_t v62 = v63;
      }
      else
      {
        uint64_t v62 = 0;
      }
      uint64_t v60 = v62;
      id v61 = (id)[v186[27] betaPrograms];
      id v58 = v61;
      uint64_t v59 = [v58 count];
      id v57 = (id)[v186[27] currentFullScanOperation];
      id v55 = v57;
      id v56 = (id)[v186[27] currentRefreshScanOperation];
      id v53 = v56;
      id v54 = (id)[v186[27] currentUpdateOperation];
      id v51 = v54;
      id v52 = (id)[v186[27] auxiliaryOperations];
      id v49 = v52;
      uint64_t v50 = [v49 count];
      id v48 = (id)[v186[24] identifier];
      id v47 = v48;
      uint64_t v45 = &v34;
      uint64_t v46 = v227;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v227, (uint64_t)v190, v106, v107, (uint64_t)v97, (uint64_t)v95, (uint64_t)v93, (uint64_t)v91, (uint64_t)v89, (uint64_t)v82, (uint64_t)v80, (uint64_t)v78, (uint64_t)v76, (uint64_t)v74, (uint64_t)v72, (uint64_t)v69, (uint64_t)v67, v62, v59,
        (uint64_t)v55,
        (uint64_t)v53,
        (uint64_t)v51,
        v50,
        (uint64_t)v47);
      _os_log_impl(&dword_228401000, v109, v110[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Scan has finished, triggered by the initiator: %{public}@",
        v46,
        0xE8u);

      if (v193) {
      if (v197)
      }

      if (v199) {
      if (v201)
      }

      if (v203) {
      if (v205)
      }

      objc_storeStrong(&v195, 0);
      objc_storeStrong(&v196, 0);
      objc_storeStrong(&v207, 0);
    }
    objc_storeStrong(&v209, 0);
    id v44 = (id)[v186[24] identifier];
    id v42 = v44;
    int v43 = [v42 isEqualToString:@"com.apple.Preferences.software_update"];

    if (v43)
    {
      *((_DWORD *)v186 + 6) = 1;
    }
    else
    {
      id v41 = v186[27];
      objc_sync_enter(v41);
      if ((*((unsigned char *)v186[27] + 10) & 1) == 0)
      {
        id v40 = (id)[v186[27] log];
        id v38 = v40;
        id v39 = (id)[v38 oslog];
        osos_log_t log = (os_log_t)v39;

        os_log_type_t v191 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v35 = oslog;
          *(_DWORD *)uint64_t v36 = v191;
          uint64_t v32 = (uint64_t)v186[22];
          uint64_t v33 = (uint64_t)v186[23];
          uint64_t v37 = v226;
          __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v226, (uint64_t)v190, v32, v33);
          _os_log_impl(&dword_228401000, v35, v36[0], "%s: Got a third-party scan completion even, but performThirdPartyScan is NO. Recovering.\nerror: %{public}@; SUScanResults: %{public}@",
            v37,
            0x20u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      [v186[27] performFullScanWithScanResults:v186[23] andScanError:v186[22]];
      objc_sync_exit(v41);

      *((_DWORD *)v186 + 6) = 0;
    }
  }
  objc_storeStrong(&v222, 0);
  objc_storeStrong(&v223, 0);
  objc_storeStrong(&v224, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id obj = a4;
  id v71 = "-[SUSettingsStatefulUIManager client:downloadDidStart:]";
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v101 = 0;
  objc_storeStrong(&v101, obj);
  id v70 = (id)[v103 log];
  osos_log_t log = (os_log_t)(id)[v70 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v65 = type;
    id v66 = SUSettingsUIStateToString([v103 currentState]);
    id v67 = v66;
    id v98 = v67;
    uint64_t v68 = [v103 currentState];
    id v69 = (id)[v103 delegate];
    char v96 = 0;
    char v94 = 0;
    if (v69)
    {
      id v97 = (id)[v103 delegate];
      int v62 = 1;
      char v96 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v95 = NSStringFromClass(v4);
      char v94 = 1;
      uint64_t v63 = (__CFString *)v95;
    }
    else
    {
      uint64_t v63 = @"(null)";
    }
    id v56 = v63;
    id v57 = (id)[v103 delegate];
    id v58 = (id)[v103 scanError];
    id v59 = (id)[v103 preferredStatefulDescriptor];
    id v60 = (id)[v103 alternateStatefulDescriptor];
    id v61 = (id)[v103 currentDownload];
    char v92 = 0;
    char v90 = 0;
    char v88 = 0;
    if (v61)
    {
      id v93 = (id)[v103 currentDownload];
      int v54 = 1;
      char v92 = 1;
      id v91 = (id)[v93 descriptor];
      char v90 = 1;
      id v89 = (id)[v91 humanReadableUpdateName];
      char v88 = 1;
      id v55 = (__CFString *)v89;
    }
    else
    {
      id v55 = @"(null)";
    }
    id v40 = v55;
    id v41 = (id)[v103 currentDownload];
    char v5 = [v103 performThirdPartyScan];
    id v47 = "NO";
    id v6 = "YES";
    id v48 = "YES";
    int v52 = 1;
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    id v42 = v6;
    char v7 = [v103 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v48;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v47;
    }
    uint64_t v43 = v8;
    char v9 = [v103 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v48;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v47;
    }
    uint64_t v44 = v10;
    id v45 = (id)[*((id *)v103 + 32) humanReadableUpdateName];
    id v46 = v45;
    id v87 = v46;
    char v11 = [v103 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v48;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v47;
    }
    uint64_t v49 = v12;
    id v50 = (id)[*((id *)v103 + 33) humanReadableUpdateName];
    id v51 = v50;
    id v86 = v51;
    id v53 = (id)[v103 enrolledBetaProgram];
    char v84 = 0;
    if (v53)
    {
      id v85 = (id)[v103 enrolledBetaProgram];
      char v84 = 1;
      uint64_t v39 = [v85 programID];
    }
    else
    {
      uint64_t v39 = 0;
    }
    uint64_t v27 = v39;
    id v38 = (id)[v103 betaPrograms];
    uint64_t v28 = [v38 count];
    id v37 = (id)[v103 currentFullScanOperation];
    id v36 = (id)[v103 currentRefreshScanOperation];
    id v35 = (id)[v103 currentUpdateOperation];
    id v34 = (id)[v103 auxiliaryOperations];
    uint64_t v29 = [v34 count];
    id v33 = (id)[v101 descriptor];
    id v32 = (id)[v33 humanReadableUpdateName];
    id v83 = v32;
    id v30 = &v13;
    buf = v105;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v105, (uint64_t)v71, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v39, v28,
      (uint64_t)v37,
      (uint64_t)v36,
      (uint64_t)v35,
      v29,
      (uint64_t)v83,
      (uint64_t)v101);
    _os_log_impl(&dword_228401000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download an update targeting \"%{public}@\" (%p)",
      buf,
      0xF2u);

    if (v84) {
    if (v88)
    }

    if (v90) {
    if (v92)
    }

    if (v94) {
    if (v96)
    }

    id v26 = 0;
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v86, v26);
    objc_storeStrong(&v87, v26);
    objc_storeStrong(&v98, v26);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((void *)v103 + 25))
  {
    int v82 = 1;
  }
  else
  {
    id v81 = (id)[v103 targetedUpdateForDownload:v101];
    if (v81)
    {
      id v17 = v103;
      id v15 = v101;
      char v16 = &v73;
      uint64_t v73 = MEMORY[0x263EF8330];
      int v74 = -1073741824;
      int v75 = 0;
      id v76 = __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke;
      int v77 = &unk_26483BEC8;
      uint64_t v20 = (id *)v78;
      v78[0] = v103;
      char v19 = (id *)(v16 + 5);
      v78[1] = v81;
      id v18 = (id *)(v16 + 6);
      void v78[2] = v101;
      id v21 = 0;
      objc_msgSend(v17, "updateStatePostDownloadOperation:withDownload:error:completionHandler:", 1, v15);
      objc_storeStrong(v18, v21);
      objc_storeStrong(v19, v21);
      objc_storeStrong(v20, v21);
      int v82 = 0;
    }
    else
    {
      id v25 = (id)[v103 log];
      os_log_t v80 = (os_log_t)(id)[v25 oslog];

      os_log_type_t v79 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        os_log_t v22 = v80;
        *(_DWORD *)id v23 = v79;
        id v24 = v104;
        __os_log_helper_16_2_1_8_32((uint64_t)v104, (uint64_t)v71);
        _os_log_error_impl(&dword_228401000, v22, v23[0], "%s: Could not resolve the targeted update from the current download. Skipping on the downloadDidStart event and performing a new scan instead.", v24, 0xCu);
      }
      objc_storeStrong((id *)&v80, 0);
      [v103 checkForUpdatesInBackground];
      int v82 = 1;
    }
    objc_storeStrong(&v81, 0);
  }
  id v14 = 0;
  objc_storeStrong(&v101, 0);
  objc_storeStrong(location, v14);
}

void __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke(id *a1, char a2)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  v11[1] = a1;
  id v3 = a1[4];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke_2;
  uint64_t v8 = &unk_26483BB58;
  id v9 = a1[4];
  id v10 = a1[5];
  v11[0] = a1[6];
  objc_msgSend(v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartDownloadForDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  if ([(SUSettingsStatefulUIManager *)v37 currentState] == 4)
  {
    id v33 = (id)[v35 progress];
    [v33 normalizedPercentComplete];
    float v32 = v4;
    id v31 = (id)[v33 phase];
    id v15 = [(SUSettingsStatefulUIManager *)v37 log];
    id v30 = (id)[(SUCoreLog *)v15 oslog];

    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v30;
      os_log_type_t type = v29;
      id v14 = (id)[v35 descriptor];
      id v13 = (id)[v14 humanReadableUpdateName];
      id v8 = v13;
      id v28 = v8;
      *(double *)&uint64_t v9 = v32;
      id v10 = v31;
      [v33 timeRemaining];
      __os_log_helper_16_2_6_8_32_8_66_8_0_8_66_8_0_8_0((uint64_t)v39, (uint64_t)"-[SUSettingsStatefulUIManager client:downloadProgressDidChange:]", (uint64_t)v8, v9, (uint64_t)v10, v5, (uint64_t)v35);
      _os_log_impl(&dword_228401000, log, type, "%s [->\"%{public}@\"]: progress: %.02f; phase: %{public}@; time remaining: %f, download: %p",
        v39,
        0x3Eu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
    [(SUSettingsStatefulUIManager *)v37 setCurrentDownload:v35];
    id v27 = [(SUSettingsStatefulUIManager *)v37 targetedUpdateForDownload:v35];
    if (v27)
    {
      [v27 updateStateFromProgressedDownload:v35];
      int v6 = v37;
      uint64_t v17 = MEMORY[0x263EF8330];
      int v18 = -1073741824;
      int v19 = 0;
      uint64_t v20 = __64__SUSettingsStatefulUIManager_client_downloadProgressDidChange___block_invoke;
      id v21 = &unk_26483BB58;
      os_log_t v22 = v37;
      id v23 = v27;
      id v24 = v35;
      [(SUSettingsStatefulUIManager *)v6 executeOperationOnDelegate:sel_statefulUIManager_didChangeProgressForDownloadOfDescriptor_withDownload_ usingBlock:&v17];
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong((id *)&v22, 0);
      int v34 = 0;
    }
    else
    {
      char v7 = [(SUSettingsStatefulUIManager *)v37 log];
      id v26 = (id)[(SUCoreLog *)v7 oslog];

      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[SUSettingsStatefulUIManager client:downloadProgressDidChange:]");
        _os_log_error_impl(&dword_228401000, (os_log_t)v26, v25, "%s: Could not resolve the targeted update from the current download. Skipping on the downloadProgressDidChange event and performing a new scan instead.", v38, 0xCu);
      }
      objc_storeStrong(&v26, 0);
      [(SUSettingsStatefulUIManager *)v37 checkForAvailableUpdates];
      int v34 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    int v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsStatefulUIManager_client_downloadProgressDidChange___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didChangeProgressForDownloadOfDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  id obj = a4;
  id v74 = a5;
  id v72 = "-[SUSettingsStatefulUIManager client:downloadDidFinish:withInstallPolicy:]";
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v106 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v104 = 0;
  objc_storeStrong(&v104, obj);
  id v103 = 0;
  objc_storeStrong(&v103, v74);
  id v71 = (id)[v106 log];
  osos_log_t log = (os_log_t)(id)[v71 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v66 = type;
    id v67 = SUSettingsUIStateToString([v106 currentState]);
    id v68 = v67;
    id v100 = v68;
    uint64_t v69 = [v106 currentState];
    id v70 = (id)[v106 delegate];
    char v98 = 0;
    char v96 = 0;
    if (v70)
    {
      id v99 = (id)[v106 delegate];
      int v63 = 1;
      char v98 = 1;
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v97 = NSStringFromClass(v5);
      char v96 = 1;
      id v64 = (__CFString *)v97;
    }
    else
    {
      id v64 = @"(null)";
    }
    id v57 = v64;
    id v58 = (id)[v106 delegate];
    id v59 = (id)[v106 scanError];
    id v60 = (id)[v106 preferredStatefulDescriptor];
    id v61 = (id)[v106 alternateStatefulDescriptor];
    id v62 = (id)[v106 currentDownload];
    char v94 = 0;
    char v92 = 0;
    char v90 = 0;
    if (v62)
    {
      id v95 = (id)[v106 currentDownload];
      int v55 = 1;
      char v94 = 1;
      id v93 = (id)[v95 descriptor];
      char v92 = 1;
      id v91 = (id)[v93 humanReadableUpdateName];
      char v90 = 1;
      id v56 = (__CFString *)v91;
    }
    else
    {
      id v56 = @"(null)";
    }
    id v41 = v56;
    id v42 = (id)[v106 currentDownload];
    char v6 = [v106 performThirdPartyScan];
    id v48 = "NO";
    char v7 = "YES";
    uint64_t v49 = "YES";
    int v53 = 1;
    if ((v6 & 1) == 0) {
      char v7 = "NO";
    }
    uint64_t v43 = v7;
    char v8 = [v106 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v9 = (uint64_t)v49;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v48;
    }
    uint64_t v44 = v9;
    char v10 = [v106 hidingPreferredDescriptor];
    uint64_t v11 = (uint64_t)v49;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v48;
    }
    uint64_t v45 = v11;
    id v46 = (id)[*((id *)v106 + 32) humanReadableUpdateName];
    id v47 = v46;
    id v89 = v47;
    char v12 = [v106 hidingAlternateDescriptor];
    uint64_t v13 = (uint64_t)v49;
    if ((v12 & 1) == 0) {
      uint64_t v13 = (uint64_t)v48;
    }
    uint64_t v50 = v13;
    id v51 = (id)[*((id *)v106 + 33) humanReadableUpdateName];
    id v52 = v51;
    id v88 = v52;
    id v54 = (id)[v106 enrolledBetaProgram];
    char v86 = 0;
    if (v54)
    {
      id v87 = (id)[v106 enrolledBetaProgram];
      char v86 = 1;
      uint64_t v40 = [v87 programID];
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v28 = v40;
    id v39 = (id)[v106 betaPrograms];
    uint64_t v29 = [v39 count];
    id v38 = (id)[v106 currentFullScanOperation];
    id v37 = (id)[v106 currentRefreshScanOperation];
    id v36 = (id)[v106 currentUpdateOperation];
    id v35 = (id)[v106 auxiliaryOperations];
    uint64_t v30 = [v35 count];
    id v34 = (id)[v104 descriptor];
    id v33 = (id)[v34 humanReadableUpdateName];
    id v85 = v33;
    id v31 = &v14;
    buf = v108;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v29,
      (uint64_t)v38,
      (uint64_t)v37,
      (uint64_t)v36,
      v30,
      (uint64_t)v85,
      (uint64_t)v104);
    _os_log_impl(&dword_228401000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to download an update targeting \"%{public}@\": (%p)",
      buf,
      0xF2u);

    if (v86) {
    if (v90)
    }

    if (v92) {
    if (v94)
    }

    if (v96) {
    if (v98)
    }

    id v27 = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v88, v27);
    objc_storeStrong(&v89, v27);
    objc_storeStrong(&v100, v27);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((void *)v106 + 25))
  {
    int v84 = 1;
  }
  else
  {
    id v83 = (id)[v106 targetedUpdateForDownload:v104];
    if (v83)
    {
      id v18 = v106;
      id v16 = v104;
      uint64_t v17 = &v75;
      uint64_t v75 = MEMORY[0x263EF8330];
      int v76 = -1073741824;
      int v77 = 0;
      id v78 = __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke;
      os_log_type_t v79 = &unk_26483BEC8;
      id v21 = (id *)v80;
      v80[0] = v106;
      uint64_t v20 = (id *)(v17 + 5);
      v80[1] = v83;
      int v19 = (id *)(v17 + 6);
      void v80[2] = v104;
      id v22 = 0;
      objc_msgSend(v18, "updateStatePostDownloadOperation:withDownload:error:completionHandler:", 1, v16);
      objc_storeStrong(v19, v22);
      objc_storeStrong(v20, v22);
      objc_storeStrong(v21, v22);
      int v84 = 0;
    }
    else
    {
      id v26 = (id)[v106 log];
      os_log_t v82 = (os_log_t)(id)[v26 oslog];

      os_log_type_t v81 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        os_log_t v23 = v82;
        *(_DWORD *)id v24 = v81;
        os_log_type_t v25 = v107;
        __os_log_helper_16_2_1_8_32((uint64_t)v107, (uint64_t)v72);
        _os_log_error_impl(&dword_228401000, v23, v24[0], "%s: Could not resolve the targeted update from the current download. Skipping on the downloadDidStart event and performing a new scan instead.", v25, 0xCu);
      }
      objc_storeStrong((id *)&v82, 0);
      [v106 checkForAvailableUpdates];
      int v84 = 1;
    }
    objc_storeStrong(&v83, 0);
  }
  id v15 = 0;
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, v15);
  objc_storeStrong(location, v15);
}

void __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke(id *a1, char a2)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  v11[1] = a1;
  id v3 = a1[4];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke_2;
  char v8 = &unk_26483BB58;
  id v9 = a1[4];
  id v10 = a1[5];
  v11[0] = a1[6];
  objc_msgSend(v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didFinishDownloadForDescriptor_withDownload_);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didFinishDownloadForDescriptor:*(void *)(a1 + 40) withDownload:*(void *)(a1 + 48)];
}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  int v63 = &v82;
  id obj = a4;
  id v62 = "-[SUSettingsStatefulUIManager client:downloadWasInvalidatedForNewUpdatesAvailable:]";
  uint64_t v86 = *MEMORY[0x263EF8340];
  int v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v82 = 0;
  objc_storeStrong(&v82, obj);
  id v61 = [(SUSettingsStatefulUIManager *)v84 log];
  osos_log_t log = (os_log_t)(id)[v61 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v56 = type;
    id v57 = SUSettingsUIStateToString([v63[3] currentState]);
    id v58 = v57;
    id v79 = v58;
    uint64_t v59 = [v63[3] currentState];
    id v60 = (id)[v63[3] delegate];
    char v77 = 0;
    char v75 = 0;
    if (v60)
    {
      id v78 = (id)[v63[3] delegate];
      int v53 = 1;
      char v77 = 1;
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v76 = NSStringFromClass(v4);
      char v75 = 1;
      id v54 = (__CFString *)v76;
    }
    else
    {
      id v54 = @"(null)";
    }
    id v47 = v54;
    id v48 = (id)[v63[3] delegate];
    id v49 = (id)[v63[3] scanError];
    id v50 = (id)[v63[3] preferredStatefulDescriptor];
    id v51 = (id)[v63[3] alternateStatefulDescriptor];
    id v52 = (id)[v63[3] currentDownload];
    char v73 = 0;
    char v71 = 0;
    char v69 = 0;
    if (v52)
    {
      id v74 = (id)[v63[3] currentDownload];
      int v45 = 1;
      char v73 = 1;
      id v72 = (id)[v74 descriptor];
      char v71 = 1;
      id v70 = (id)[v72 humanReadableUpdateName];
      char v69 = 1;
      id v46 = (__CFString *)v70;
    }
    else
    {
      id v46 = @"(null)";
    }
    id v31 = v46;
    id v32 = (id)[v63[3] currentDownload];
    char v5 = [v63[3] performThirdPartyScan];
    id v38 = "NO";
    int v6 = "YES";
    id v39 = "YES";
    int v43 = 1;
    if ((v5 & 1) == 0) {
      int v6 = "NO";
    }
    id v33 = v6;
    char v7 = [v63[3] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v39;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v38;
    }
    uint64_t v34 = v8;
    char v9 = [v63[3] hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v39;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v38;
    }
    uint64_t v35 = v10;
    id v36 = (id)[*((id *)v63[3] + 32) humanReadableUpdateName];
    id v37 = v36;
    id v68 = v37;
    char v11 = [v63[3] hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v39;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v38;
    }
    uint64_t v40 = v12;
    id v41 = (id)[*((id *)v63[3] + 33) humanReadableUpdateName];
    id v42 = v41;
    id v67 = v42;
    id v44 = (id)[v63[3] enrolledBetaProgram];
    char v65 = 0;
    if (v44)
    {
      id v66 = (id)[v63[3] enrolledBetaProgram];
      char v65 = 1;
      uint64_t v30 = [v66 programID];
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v21 = v30;
    id v29 = (id)[v63[3] betaPrograms];
    uint64_t v22 = [v29 count];
    id v28 = (id)[v63[3] currentFullScanOperation];
    id v27 = (id)[v63[3] currentRefreshScanOperation];
    id v26 = (id)[v63[3] currentUpdateOperation];
    id v25 = (id)[v63[3] auxiliaryOperations];
    uint64_t v13 = [v25 count];
    uint64_t v14 = (uint64_t)*v63;
    os_log_t v23 = &v17;
    buf = v85;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v85, (uint64_t)v62, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
      (uint64_t)v28,
      (uint64_t)v27,
      (uint64_t)v26,
      v13,
      v14);
    _os_log_impl(&dword_228401000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download was invalidated for new updates available: %{public}@",
      buf,
      0xE8u);

    if (v65) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    if (v75) {
    if (v77)
    }

    id v20 = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, v20);
    objc_storeStrong(&v79, v20);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v15 = v63[3];
  id v18 = &v82;
  id v16 = *v63;
  id v19 = 0;
  objc_msgSend(v15, "performFullScanWithScanResults:andScanError:", v16);
  objc_storeStrong(v18, v19);
  objc_storeStrong(location, v19);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id obj = a4;
  id v78 = a5;
  id v76 = "-[SUSettingsStatefulUIManager client:downloadDidFail:withError:]";
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v110 = 0;
  objc_storeStrong(&v110, obj);
  id v109 = 0;
  objc_storeStrong(&v109, v78);
  id v75 = (id)[v112 log];
  osos_log_t log = (os_log_t)(id)[v75 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v70 = type;
    id v71 = SUSettingsUIStateToString([v112 currentState]);
    id v72 = v71;
    id v106 = v72;
    uint64_t v73 = [v112 currentState];
    id v74 = (id)[v112 delegate];
    char v104 = 0;
    char v102 = 0;
    if (v74)
    {
      id v105 = (id)[v112 delegate];
      int v67 = 1;
      char v104 = 1;
      char v5 = (objc_class *)objc_opt_class();
      id v103 = NSStringFromClass(v5);
      char v102 = 1;
      id v68 = (__CFString *)v103;
    }
    else
    {
      id v68 = @"(null)";
    }
    id v61 = v68;
    id v62 = (id)[v112 delegate];
    id v63 = (id)[v112 scanError];
    id v64 = (id)[v112 preferredStatefulDescriptor];
    id v65 = (id)[v112 alternateStatefulDescriptor];
    id v66 = (id)[v112 currentDownload];
    char v100 = 0;
    char v98 = 0;
    char v96 = 0;
    if (v66)
    {
      id v101 = (id)[v112 currentDownload];
      int v59 = 1;
      char v100 = 1;
      id v99 = (id)[v101 descriptor];
      char v98 = 1;
      id v97 = (id)[v99 humanReadableUpdateName];
      char v96 = 1;
      id v60 = (__CFString *)v97;
    }
    else
    {
      id v60 = @"(null)";
    }
    int v45 = v60;
    id v46 = (id)[v112 currentDownload];
    char v6 = [v112 performThirdPartyScan];
    id v52 = "NO";
    char v7 = "YES";
    int v53 = "YES";
    int v57 = 1;
    if ((v6 & 1) == 0) {
      char v7 = "NO";
    }
    id v47 = v7;
    char v8 = [v112 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v9 = (uint64_t)v53;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v52;
    }
    uint64_t v48 = v9;
    char v10 = [v112 hidingPreferredDescriptor];
    uint64_t v11 = (uint64_t)v53;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v52;
    }
    uint64_t v49 = v11;
    id v50 = (id)[*((id *)v112 + 32) humanReadableUpdateName];
    id v51 = v50;
    id v95 = v51;
    char v12 = [v112 hidingAlternateDescriptor];
    uint64_t v13 = (uint64_t)v53;
    if ((v12 & 1) == 0) {
      uint64_t v13 = (uint64_t)v52;
    }
    uint64_t v54 = v13;
    id v55 = (id)[*((id *)v112 + 33) humanReadableUpdateName];
    id v56 = v55;
    id v94 = v56;
    id v58 = (id)[v112 enrolledBetaProgram];
    char v92 = 0;
    if (v58)
    {
      id v93 = (id)[v112 enrolledBetaProgram];
      char v92 = 1;
      uint64_t v44 = [v93 programID];
    }
    else
    {
      uint64_t v44 = 0;
    }
    uint64_t v32 = v44;
    id v43 = (id)[v112 betaPrograms];
    uint64_t v33 = [v43 count];
    id v42 = (id)[v112 currentFullScanOperation];
    id v41 = (id)[v112 currentRefreshScanOperation];
    id v40 = (id)[v112 currentUpdateOperation];
    id v39 = (id)[v112 auxiliaryOperations];
    uint64_t v34 = [v39 count];
    id v38 = (id)[v110 descriptor];
    id v37 = (id)[v38 humanReadableUpdateName];
    id v91 = v37;
    uint64_t v35 = &v16;
    buf = v113;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66((uint64_t)v113, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v33,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v34,
      (uint64_t)v91,
      (uint64_t)v110,
      (uint64_t)v109);
    _os_log_impl(&dword_228401000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download of update %{public}@ (%p) failed: %{public}@",
      buf,
      0xFCu);

    if (v92) {
    if (v96)
    }

    if (v98) {
    if (v100)
    }

    if (v102) {
    if (v104)
    }

    id v31 = 0;
    objc_storeStrong(&v91, 0);
    objc_storeStrong(&v94, v31);
    objc_storeStrong(&v95, v31);
    objc_storeStrong(&v106, v31);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v90 = (id)[v112 targetedUpdateForDownload:v110];
  id v28 = (id)[v109 domain];
  id v29 = getSUErrorDomain();
  char v14 = objc_msgSend(v28, "isEqualToString:");
  char v88 = 0;
  char v86 = 0;
  int v30 = 0;
  if (v14)
  {
    BOOL v15 = [v109 code] != 16;
    int v30 = 0;
    if (!v15)
    {
      id v89 = (id)[v109 userInfo];
      int v27 = 1;
      char v88 = 1;
      id v87 = (id)[v89 objectForKey:*MEMORY[0x263F784B0]];
      char v86 = v27 & 1;
      int v30 = [v87 BOOLValue];
    }
  }
  int v26 = v30;
  if (v86) {

  }
  if (v88) {
  if ((v26 & 1) != 0 && v90)
  }
  {
    [v90 updateStateFromProgressedDownload:0];
    int v85 = 1;
  }
  else
  {
    [*((id *)v112 + 28) destroyInstallationKeybag];
    [v112 checkForUpdatesInBackground];
    id v20 = v112;
    id v18 = sel_statefulUIManager_didFailToDownloadUpdateForDescriptor_withError_download_;
    id v19 = (id *)&v79;
    uint64_t v79 = MEMORY[0x263EF8330];
    int v80 = -1073741824;
    int v81 = 0;
    id v82 = __64__SUSettingsStatefulUIManager_client_downloadDidFail_withError___block_invoke;
    id v83 = &unk_26483BEF0;
    id v24 = (id *)v84;
    v84[0] = v112;
    os_log_t v23 = v19 + 5;
    v84[1] = v90;
    uint64_t v22 = v19 + 6;
    v84[2] = v109;
    uint64_t v21 = v19 + 7;
    void v84[3] = v110;
    [v20 executeOperationOnDelegate:v18 usingBlock:v19];
    id v25 = 0;
    objc_storeStrong(v21, 0);
    objc_storeStrong(v22, v25);
    objc_storeStrong(v23, v25);
    objc_storeStrong(v24, v25);
    int v85 = 0;
  }
  id v17 = 0;
  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v109, v17);
  objc_storeStrong(&v110, v17);
  objc_storeStrong(location, v17);
}

void __64__SUSettingsStatefulUIManager_client_downloadDidFail_withError___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didFailToDownloadUpdateForDescriptor:*(void *)(a1 + 40) withError:*(void *)(a1 + 48) download:*(void *)(a1 + 56)];
}

- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  id obj = a4;
  BOOL v69 = a5;
  int v67 = "-[SUSettingsStatefulUIManager client:clearingSpaceForDownload:clearingSpace:]";
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v95 = 0;
  objc_storeStrong(&v95, obj);
  BOOL v94 = v69;
  id v66 = (id)[v97 log];
  osos_log_t log = (os_log_t)(id)[v66 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v61 = type;
    id v62 = SUSettingsUIStateToString([v97 currentState]);
    id v63 = v62;
    id v91 = v63;
    uint64_t v64 = [v97 currentState];
    id v65 = (id)[v97 delegate];
    char v89 = 0;
    char v87 = 0;
    if (v65)
    {
      id v90 = (id)[v97 delegate];
      int v58 = 1;
      char v89 = 1;
      char v5 = (objc_class *)objc_opt_class();
      id v88 = NSStringFromClass(v5);
      char v87 = 1;
      int v59 = (__CFString *)v88;
    }
    else
    {
      int v59 = @"(null)";
    }
    id v52 = v59;
    id v53 = (id)[v97 delegate];
    id v54 = (id)[v97 scanError];
    id v55 = (id)[v97 preferredStatefulDescriptor];
    id v56 = (id)[v97 alternateStatefulDescriptor];
    id v57 = (id)[v97 currentDownload];
    char v85 = 0;
    char v83 = 0;
    char v81 = 0;
    if (v57)
    {
      id v86 = (id)[v97 currentDownload];
      int v50 = 1;
      char v85 = 1;
      id v84 = (id)[v86 descriptor];
      char v83 = 1;
      id v82 = (id)[v84 humanReadableUpdateName];
      char v81 = 1;
      id v51 = (__CFString *)v82;
    }
    else
    {
      id v51 = @"(null)";
    }
    id v36 = v51;
    id v37 = (id)[v97 currentDownload];
    char v6 = [v97 performThirdPartyScan];
    id v43 = "NO";
    char v7 = "YES";
    uint64_t v44 = "YES";
    int v48 = 1;
    if ((v6 & 1) == 0) {
      char v7 = "NO";
    }
    id v38 = v7;
    char v8 = [v97 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v9 = (uint64_t)v44;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v43;
    }
    uint64_t v39 = v9;
    char v10 = [v97 hidingPreferredDescriptor];
    uint64_t v11 = (uint64_t)v44;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v43;
    }
    uint64_t v40 = v11;
    id v41 = (id)[*((id *)v97 + 32) humanReadableUpdateName];
    id v42 = v41;
    id v80 = v42;
    char v12 = [v97 hidingAlternateDescriptor];
    uint64_t v13 = (uint64_t)v44;
    if ((v12 & 1) == 0) {
      uint64_t v13 = (uint64_t)v43;
    }
    uint64_t v45 = v13;
    id v46 = (id)[*((id *)v97 + 33) humanReadableUpdateName];
    id v47 = v46;
    id v79 = v47;
    id v49 = (id)[v97 enrolledBetaProgram];
    char v77 = 0;
    if (v49)
    {
      id v78 = (id)[v97 enrolledBetaProgram];
      char v77 = 1;
      uint64_t v35 = [v78 programID];
    }
    else
    {
      uint64_t v35 = 0;
    }
    uint64_t v23 = v35;
    id v34 = (id)[v97 betaPrograms];
    uint64_t v24 = [v34 count];
    id v33 = (id)[v97 currentFullScanOperation];
    id v32 = (id)[v97 currentRefreshScanOperation];
    id v31 = (id)[v97 currentUpdateOperation];
    id v30 = (id)[v97 auxiliaryOperations];
    uint64_t v25 = [v30 count];
    id v29 = (id)[v95 descriptor];
    id v28 = (id)[v29 humanReadableUpdateName];
    id v14 = v28;
    id v76 = v14;
    BOOL v15 = "YES";
    if (!v94) {
      BOOL v15 = "NO";
    }
    int v26 = &v16;
    buf = v98;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_32((uint64_t)v98, (uint64_t)v67, (uint64_t)v63, v64, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v39, v40, (uint64_t)v42, v45, (uint64_t)v47, v23, v24,
      (uint64_t)v33,
      (uint64_t)v32,
      (uint64_t)v31,
      v25,
      (uint64_t)v14,
      (uint64_t)v95,
      (uint64_t)v15);
    _os_log_impl(&dword_228401000, log, v61[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Clearing space for update %{public}@ (%p): %s",
      buf,
      0xFCu);

    if (v77) {
    if (v81)
    }

    if (v83) {
    if (v85)
    }

    if (v87) {
    if (v89)
    }

    id v22 = 0;
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v79, v22);
    objc_storeStrong(&v80, v22);
    objc_storeStrong(&v91, v22);
  }
  objc_storeStrong((id *)&oslog, 0);
  [v97 setClearingSpaceForDownload:1];
  id v19 = v97;
  id v17 = sel_statefulUIManagerDidRefreshState_;
  id v18 = &v70;
  uint64_t v70 = MEMORY[0x263EF8330];
  int v71 = -1073741824;
  int v72 = 0;
  uint64_t v73 = __77__SUSettingsStatefulUIManager_client_clearingSpaceForDownload_clearingSpace___block_invoke;
  id v74 = &unk_26483BA90;
  id v20 = &v75;
  id v75 = v97;
  [v19 executeOperationOnDelegate:v17 usingBlock:v18];
  id v21 = 0;
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v95, v21);
  objc_storeStrong(location, v21);
}

void __77__SUSettingsStatefulUIManager_client_clearingSpaceForDownload_clearingSpace___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id obj = a4;
  id v65 = "-[SUSettingsStatefulUIManager client:installDidStart:]";
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v93 = 0;
  objc_storeStrong(&v93, obj);
  id v64 = (id)[v95 log];
  osos_log_t log = (os_log_t)(id)[v64 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)int v59 = type;
    id v60 = SUSettingsUIStateToString([v95 currentState]);
    id v61 = v60;
    id v90 = v61;
    uint64_t v62 = [v95 currentState];
    id v63 = (id)[v95 delegate];
    char v88 = 0;
    char v86 = 0;
    if (v63)
    {
      id v89 = (id)[v95 delegate];
      int v56 = 1;
      char v88 = 1;
      uint64_t v4 = (objc_class *)objc_opt_class();
      id v87 = NSStringFromClass(v4);
      char v86 = 1;
      id v57 = (__CFString *)v87;
    }
    else
    {
      id v57 = @"(null)";
    }
    int v50 = v57;
    id v51 = (id)[v95 delegate];
    id v52 = (id)[v95 scanError];
    id v53 = (id)[v95 preferredStatefulDescriptor];
    id v54 = (id)[v95 alternateStatefulDescriptor];
    id v55 = (id)[v95 currentDownload];
    char v84 = 0;
    char v82 = 0;
    char v80 = 0;
    if (v55)
    {
      id v85 = (id)[v95 currentDownload];
      int v48 = 1;
      char v84 = 1;
      id v83 = (id)[v85 descriptor];
      char v82 = 1;
      id v81 = (id)[v83 humanReadableUpdateName];
      char v80 = 1;
      id v49 = (__CFString *)v81;
    }
    else
    {
      id v49 = @"(null)";
    }
    id v34 = v49;
    id v35 = (id)[v95 currentDownload];
    char v5 = [v95 performThirdPartyScan];
    id v41 = "NO";
    char v6 = "YES";
    id v42 = "YES";
    int v46 = 1;
    if ((v5 & 1) == 0) {
      char v6 = "NO";
    }
    id v36 = v6;
    char v7 = [v95 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v42;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v41;
    }
    uint64_t v37 = v8;
    char v9 = [v95 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v42;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v41;
    }
    uint64_t v38 = v10;
    id v39 = (id)[*((id *)v95 + 32) humanReadableUpdateName];
    id v40 = v39;
    id v79 = v40;
    char v11 = [v95 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v42;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v41;
    }
    uint64_t v43 = v12;
    id v44 = (id)[*((id *)v95 + 33) humanReadableUpdateName];
    id v45 = v44;
    id v78 = v45;
    id v47 = (id)[v95 enrolledBetaProgram];
    char v76 = 0;
    if (v47)
    {
      id v77 = (id)[v95 enrolledBetaProgram];
      char v76 = 1;
      uint64_t v33 = [v77 programID];
    }
    else
    {
      uint64_t v33 = 0;
    }
    uint64_t v22 = v33;
    id v32 = (id)[v95 betaPrograms];
    uint64_t v23 = [v32 count];
    id v31 = (id)[v95 currentFullScanOperation];
    id v30 = (id)[v95 currentRefreshScanOperation];
    id v29 = (id)[v95 currentUpdateOperation];
    id v28 = (id)[v95 auxiliaryOperations];
    uint64_t v24 = [v28 count];
    id v27 = (id)[v93 humanReadableUpdateName];
    id v75 = v27;
    uint64_t v25 = &v13;
    buf = v96;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v96, (uint64_t)v65, (uint64_t)v61, v62, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36, v37, v38, (uint64_t)v40, v43, (uint64_t)v45, v33, v23,
      (uint64_t)v31,
      (uint64_t)v30,
      (uint64_t)v29,
      v24,
      (uint64_t)v75,
      (uint64_t)v93);
    _os_log_impl(&dword_228401000, log, v59[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to install an update targeting \"%{public}@\" (%p)",
      buf,
      0xF2u);

    if (v76) {
    if (v80)
    }

    if (v82) {
    if (v84)
    }

    if (v86) {
    if (v88)
    }

    id v21 = 0;
    objc_storeStrong(&v75, 0);
    objc_storeStrong(&v78, v21);
    objc_storeStrong(&v79, v21);
    objc_storeStrong(&v90, v21);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((void *)v95 + 25))
  {
    int v74 = 1;
  }
  else
  {
    id v73 = (id)[v95 targetedUpdateMatchingDescriptor:v93];
    if (v73)
    {
      id v17 = v95;
      BOOL v15 = sel_statefulUIManager_didStartInstallingUpdateWithDescriptor_;
      uint64_t v16 = &v67;
      uint64_t v67 = MEMORY[0x263EF8330];
      int v68 = -1073741824;
      int v69 = 0;
      uint64_t v70 = __54__SUSettingsStatefulUIManager_client_installDidStart___block_invoke;
      int v71 = &unk_26483BAB8;
      id v19 = (id *)v72;
      v72[0] = v95;
      id v18 = (id *)(v16 + 5);
      v72[1] = v73;
      [v17 executeOperationOnDelegate:v15 usingBlock:v16];
      id v20 = 0;
      objc_storeStrong(v18, 0);
      objc_storeStrong(v19, v20);
      int v74 = 0;
    }
    else
    {
      [v95 checkForAvailableUpdates];
      int v74 = 1;
    }
    objc_storeStrong(&v73, 0);
  }
  id v14 = 0;
  objc_storeStrong(&v93, 0);
  objc_storeStrong(location, v14);
}

void __54__SUSettingsStatefulUIManager_client_installDidStart___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManager:*(void *)(a1 + 32) didStartInstallingUpdateWithDescriptor:*(void *)(a1 + 40)];
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v63 = &v82;
  id obj = a4;
  id v64 = a5;
  id v61 = "-[SUSettingsStatefulUIManager client:installDidFail:withError:]";
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v83 = 0;
  objc_storeStrong(&v83, obj);
  id v82 = 0;
  objc_storeStrong(&v82, v64);
  id v60 = [(SUSettingsStatefulUIManager *)v85 log];
  osos_log_t log = (os_log_t)(id)[v60 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v55 = type;
    id v56 = SUSettingsUIStateToString([v63[4] currentState]);
    id v57 = v56;
    id v79 = v57;
    uint64_t v58 = [v63[4] currentState];
    id v59 = (id)[v63[4] delegate];
    char v77 = 0;
    char v75 = 0;
    if (v59)
    {
      id v78 = (id)[v63[4] delegate];
      int v52 = 1;
      char v77 = 1;
      char v5 = (objc_class *)objc_opt_class();
      id v76 = NSStringFromClass(v5);
      char v75 = 1;
      id v53 = (__CFString *)v76;
    }
    else
    {
      id v53 = @"(null)";
    }
    int v46 = v53;
    id v47 = (id)[v63[4] delegate];
    id v48 = (id)[v63[4] scanError];
    id v49 = (id)[v63[4] preferredStatefulDescriptor];
    id v50 = (id)[v63[4] alternateStatefulDescriptor];
    id v51 = (id)[v63[4] currentDownload];
    char v73 = 0;
    char v71 = 0;
    char v69 = 0;
    if (v51)
    {
      id v74 = (id)[v63[4] currentDownload];
      int v44 = 1;
      char v73 = 1;
      id v72 = (id)[v74 descriptor];
      char v71 = 1;
      id v70 = (id)[v72 humanReadableUpdateName];
      char v69 = 1;
      id v45 = (__CFString *)v70;
    }
    else
    {
      id v45 = @"(null)";
    }
    id v30 = v45;
    id v31 = (id)[v63[4] currentDownload];
    char v6 = [v63[4] performThirdPartyScan];
    uint64_t v37 = "NO";
    char v7 = "YES";
    uint64_t v38 = "YES";
    int v42 = 1;
    if ((v6 & 1) == 0) {
      char v7 = "NO";
    }
    id v32 = v7;
    char v8 = [v63[4] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v9 = (uint64_t)v38;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v37;
    }
    uint64_t v33 = v9;
    char v10 = [v63[4] hidingPreferredDescriptor];
    uint64_t v11 = (uint64_t)v38;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v37;
    }
    uint64_t v34 = v11;
    id v35 = (id)[*((id *)v63[4] + 32) humanReadableUpdateName];
    id v36 = v35;
    id v68 = v36;
    char v12 = [v63[4] hidingAlternateDescriptor];
    uint64_t v13 = (uint64_t)v38;
    if ((v12 & 1) == 0) {
      uint64_t v13 = (uint64_t)v37;
    }
    uint64_t v39 = v13;
    id v40 = (id)[*((id *)v63[4] + 33) humanReadableUpdateName];
    id v41 = v40;
    id v67 = v41;
    id v43 = (id)[v63[4] enrolledBetaProgram];
    char v65 = 0;
    if (v43)
    {
      id v66 = (id)[v63[4] enrolledBetaProgram];
      char v65 = 1;
      uint64_t v29 = [v66 programID];
    }
    else
    {
      uint64_t v29 = 0;
    }
    uint64_t v20 = v29;
    id v28 = (id)[v63[4] betaPrograms];
    uint64_t v21 = [v28 count];
    id v27 = (id)[v63[4] currentFullScanOperation];
    id v26 = (id)[v63[4] currentRefreshScanOperation];
    id v25 = (id)[v63[4] currentUpdateOperation];
    id v24 = (id)[v63[4] auxiliaryOperations];
    uint64_t v14 = [v24 count];
    uint64_t v15 = (uint64_t)v63[1];
    uint64_t v16 = (uint64_t)*v63;
    uint64_t v22 = &v17;
    buf = v86;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v86, (uint64_t)v61, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
      (uint64_t)v27,
      (uint64_t)v26,
      (uint64_t)v25,
      v14,
      v15,
      v16);
    _os_log_impl(&dword_228401000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Failed to install an update. Error: %{public}@; Descriptor: %{public}@",
      buf,
      0xF2u);

    if (v65) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    if (v75) {
    if (v77)
    }

    id v19 = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, v19);
    objc_storeStrong(&v79, v19);
  }
  objc_storeStrong((id *)&oslog, 0);
  [v63[4] checkForAvailableUpdates];
  id v18 = 0;
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, v18);
  objc_storeStrong(location, v18);
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSettingsStatefulUIManager *)v11 setIsAutoUpdateScheduled:0];
  [(SUSettingsStatefulUIManager *)v11 setCurrentAutoInstallOperation:0];
  id v3 = v11;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __64__SUSettingsStatefulUIManager_autoInstallOperationWasCancelled___block_invoke;
  char v8 = &unk_26483BA90;
  uint64_t v9 = v11;
  -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManagerDidRefreshState_);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsStatefulUIManager_autoInstallOperationWasCancelled___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 statefulUIManagerDidRefreshState:*(void *)(a1 + 32)];
}

- (void)autoInstallOperationDidConsent:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)batteryStateChanged:(id)a3
{
  id v61 = &v81;
  uint64_t v58 = "-[SUSettingsStatefulUIManager batteryStateChanged:]";
  uint64_t v84 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v81 = 0;
  id v59 = (id)[MEMORY[0x263F82670] currentDevice];
  uint64_t v60 = [v59 batteryState];

  uint64_t v81 = v60;
  BOOL v80 = 0;
  BOOL v62 = 1;
  if (v60 != 2) {
    BOOL v62 = *v61 == 3;
  }
  BOOL v80 = v62;
  id v57 = (id)[(id)v61[3] log];
  osos_log_t log = (os_log_t)(id)[v57 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)int v52 = type;
    id v53 = SUSettingsUIStateToString([(id)v61[3] currentState]);
    id v54 = v53;
    id v77 = v54;
    uint64_t v55 = [(id)v61[3] currentState];
    id v56 = (id)[(id)v61[3] delegate];
    char v75 = 0;
    char v73 = 0;
    if (v56)
    {
      id v76 = (id)[(id)v61[3] delegate];
      int v49 = 1;
      char v75 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v74 = NSStringFromClass(v3);
      char v73 = 1;
      id v50 = (__CFString *)v74;
    }
    else
    {
      id v50 = @"(null)";
    }
    id v43 = v50;
    id v44 = (id)[(id)v61[3] delegate];
    id v45 = (id)[(id)v61[3] scanError];
    id v46 = (id)[(id)v61[3] preferredStatefulDescriptor];
    id v47 = (id)[(id)v61[3] alternateStatefulDescriptor];
    id v48 = (id)[(id)v61[3] currentDownload];
    char v71 = 0;
    char v69 = 0;
    char v67 = 0;
    if (v48)
    {
      id v72 = (id)[(id)v61[3] currentDownload];
      int v41 = 1;
      char v71 = 1;
      id v70 = (id)[v72 descriptor];
      char v69 = 1;
      id v68 = (id)[v70 humanReadableUpdateName];
      char v67 = 1;
      int v42 = (__CFString *)v68;
    }
    else
    {
      int v42 = @"(null)";
    }
    id v27 = v42;
    id v28 = (id)[(id)v61[3] currentDownload];
    char v4 = [(id)v61[3] performThirdPartyScan];
    uint64_t v34 = "NO";
    id v5 = "YES";
    id v35 = "YES";
    int v39 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    uint64_t v29 = v5;
    char v6 = [(id)v61[3] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v35;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v34;
    }
    uint64_t v30 = v7;
    char v8 = [(id)v61[3] hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v35;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v34;
    }
    uint64_t v31 = v9;
    id v32 = (id)[*(id *)(v61[3] + 256) humanReadableUpdateName];
    id v33 = v32;
    id v66 = v33;
    char v10 = [(id)v61[3] hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v35;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v34;
    }
    uint64_t v36 = v11;
    id v37 = (id)[*(id *)(v61[3] + 264) humanReadableUpdateName];
    id v38 = v37;
    id v65 = v38;
    id v40 = (id)[(id)v61[3] enrolledBetaProgram];
    char v63 = 0;
    if (v40)
    {
      id v64 = (id)[(id)v61[3] enrolledBetaProgram];
      char v63 = 1;
      uint64_t v26 = [v64 programID];
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v17 = v26;
    id v25 = (id)[(id)v61[3] betaPrograms];
    uint64_t v18 = [v25 count];
    id v24 = (id)[(id)v61[3] currentFullScanOperation];
    id v23 = (id)[(id)v61[3] currentRefreshScanOperation];
    id v22 = (id)[(id)v61[3] currentUpdateOperation];
    id v21 = (id)[(id)v61[3] auxiliaryOperations];
    uint64_t v12 = [v21 count];
    int v13 = *(unsigned char *)(v61[3] + 13) & 1;
    id v19 = &v15;
    buf = v83;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0((uint64_t)v83, (uint64_t)v58, (uint64_t)v54, v55, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v30, v31, (uint64_t)v33, v36, (uint64_t)v38, v26, v18,
      (uint64_t)v24,
      (uint64_t)v23,
      (uint64_t)v22,
      v12,
      v13,
      v80);
    _os_log_impl(&dword_228401000, log, v52[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Battery state changed: %d -> %d",
      buf,
      0xEAu);

    if (v63) {
    if (v67)
    }

    if (v69) {
    if (v71)
    }

    if (v73) {
    if (v75)
    }

    id obj = 0;
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, obj);
    objc_storeStrong(&v77, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((*(unsigned char *)(v61[3] + 13) & 1) != v80)
  {
    uint64_t v14 = v61;
    *(unsigned char *)(v61[3] + 13) = v80;
    [(id)v14[3] refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)batteryLevelChanged:(id)a3
{
  char v63 = v82;
  id v61 = "-[SUSettingsStatefulUIManager batteryLevelChanged:]";
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  float v64 = 0.2;
  void v82[2] = 1045220557;
  v82[1] = 0.5;
  v82[0] = 0;
  v82[0] = LODWORD(v84->_batteryLevel);
  id v62 = (id)[MEMORY[0x263F82670] currentDevice];
  [v62 batteryLevel];
  id v3 = v62;
  v84->_batteryLevel = v4;

  if (*(float *)(*(void *)(v63 + 7) + 24) < v64 && (LODWORD(v5) = *v63, *(float *)v63 >= 0.2)
    || *(float *)(*(void *)(v63 + 7) + 24) >= 0.2 && (LODWORD(v5) = *v63, *(float *)v63 < 0.2)
    || *(float *)(*(void *)(v63 + 7) + 24) < 0.5 && (LODWORD(v5) = *v63, *(float *)v63 >= 0.5)
    || *(float *)(*(void *)(v63 + 7) + 24) >= 0.5 && (LODWORD(v5) = *v63, *(float *)v63 < 0.5))
  {
    id v60 = (id)objc_msgSend(*(id *)(v63 + 7), "log", v5);
    osos_log_t log = (os_log_t)(id)[v60 oslog];

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)uint64_t v55 = type;
      id v56 = SUSettingsUIStateToString([*(id *)(v63 + 7) currentState]);
      id v57 = v56;
      id v79 = v57;
      uint64_t v58 = [*(id *)(v63 + 7) currentState];
      id v59 = (id)[*(id *)(v63 + 7) delegate];
      char v77 = 0;
      char v75 = 0;
      if (v59)
      {
        id v78 = (id)[*(id *)(v63 + 7) delegate];
        int v52 = 1;
        char v77 = 1;
        char v6 = (objc_class *)objc_opt_class();
        id v76 = NSStringFromClass(v6);
        char v75 = 1;
        id v53 = (__CFString *)v76;
      }
      else
      {
        id v53 = @"(null)";
      }
      id v46 = v53;
      id v47 = (id)[*(id *)(v63 + 7) delegate];
      id v48 = (id)[*(id *)(v63 + 7) scanError];
      id v49 = (id)[*(id *)(v63 + 7) preferredStatefulDescriptor];
      id v50 = (id)[*(id *)(v63 + 7) alternateStatefulDescriptor];
      id v51 = (id)[*(id *)(v63 + 7) currentDownload];
      char v73 = 0;
      char v71 = 0;
      char v69 = 0;
      if (v51)
      {
        id v74 = (id)[*(id *)(v63 + 7) currentDownload];
        int v44 = 1;
        char v73 = 1;
        id v72 = (id)[v74 descriptor];
        char v71 = 1;
        id v70 = (id)[v72 humanReadableUpdateName];
        char v69 = 1;
        id v45 = (__CFString *)v70;
      }
      else
      {
        id v45 = @"(null)";
      }
      uint64_t v30 = v45;
      id v31 = (id)[*(id *)(v63 + 7) currentDownload];
      char v7 = [*(id *)(v63 + 7) performThirdPartyScan];
      id v37 = "NO";
      char v8 = "YES";
      id v38 = "YES";
      int v42 = 1;
      if ((v7 & 1) == 0) {
        char v8 = "NO";
      }
      id v32 = v8;
      char v9 = [*(id *)(v63 + 7) isTargetedUpdateScheduledForAutoInstall];
      uint64_t v10 = (uint64_t)v38;
      if ((v9 & 1) == 0) {
        uint64_t v10 = (uint64_t)v37;
      }
      uint64_t v33 = v10;
      char v11 = [*(id *)(v63 + 7) hidingPreferredDescriptor];
      uint64_t v12 = (uint64_t)v38;
      if ((v11 & 1) == 0) {
        uint64_t v12 = (uint64_t)v37;
      }
      uint64_t v34 = v12;
      id v35 = (id)[*(id *)(*(void *)(v63 + 7) + 256) humanReadableUpdateName];
      id v36 = v35;
      id v68 = v36;
      char v13 = [*(id *)(v63 + 7) hidingAlternateDescriptor];
      uint64_t v14 = (uint64_t)v38;
      if ((v13 & 1) == 0) {
        uint64_t v14 = (uint64_t)v37;
      }
      uint64_t v39 = v14;
      id v40 = (id)[*(id *)(*(void *)(v63 + 7) + 264) humanReadableUpdateName];
      id v41 = v40;
      id v67 = v41;
      id v43 = (id)[*(id *)(v63 + 7) enrolledBetaProgram];
      char v65 = 0;
      if (v43)
      {
        id v66 = (id)[*(id *)(v63 + 7) enrolledBetaProgram];
        char v65 = 1;
        uint64_t v29 = [v66 programID];
      }
      else
      {
        uint64_t v29 = 0;
      }
      uint64_t v20 = v29;
      id v28 = (id)[*(id *)(v63 + 7) betaPrograms];
      uint64_t v21 = [v28 count];
      id v27 = (id)[*(id *)(v63 + 7) currentFullScanOperation];
      id v26 = (id)[*(id *)(v63 + 7) currentRefreshScanOperation];
      id v25 = (id)[*(id *)(v63 + 7) currentUpdateOperation];
      id v24 = (id)[*(id *)(v63 + 7) auxiliaryOperations];
      uint64_t v15 = [v24 count];
      *(double *)&uint64_t v16 = *(float *)v63;
      *(double *)&uint64_t v17 = *(float *)(*(void *)(v63 + 7) + 24);
      id v22 = &v18;
      buf = v85;
      __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v85, (uint64_t)v61, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
        (uint64_t)v27,
        (uint64_t)v26,
        (uint64_t)v25,
        v15,
        v16,
        v17);
      _os_log_impl(&dword_228401000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Battery level changed: %f -> %f",
        buf,
        0xF2u);

      if (v65) {
      if (v69)
      }

      if (v71) {
      if (v73)
      }

      if (v75) {
      if (v77)
      }

      id obj = 0;
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, obj);
      objc_storeStrong(&v79, obj);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(v63 + 7) refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)didBecomeActive:(id)a3
{
  float v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSettingsStatefulUIManager *)v4 currentState] != 1) {
    [(SUSettingsStatefulUIManager *)v4 refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)setupFSM
{
  uint64_t v18 = self;
  v17[1] = (id)a2;
  id v20 = (id)MGCopyAnswer();
  v17[0] = v20;
  id v19 = (id)MGCopyAnswer();
  id v16 = v19;
  id v9 = [NSString alloc];
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v2);
  id v15 = (id)[v9 initWithFormat:@"%@:%@(%@)", v10, v17[0], v16];

  id v3 = (NSDictionary *)(id)[(id)objc_opt_class() _generateStateTable];
  stateTable = v18->_stateTable;
  v18->_stateTable = v3;

  char v11 = NSString;
  id v13 = [(SUSettingsStatefulUIManager *)v18 baseDomain];
  id v12 = (id)[v11 stringWithFormat:@"%@.stateful-ui-manager", v13];
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  workQueue = v18->_workQueue;
  v18->_workQueue = (OS_dispatch_queue *)v5;

  id v14 = objc_alloc(MEMORY[0x263F77DD8]);
  uint64_t v7 = [v14 initMachine:v15 withTable:v18->_stateTable startingIn:@"Idle" usingDelegate:v18 registeringAllInfoClass:objc_opt_class()];
  managerFSM = v18->_managerFSM;
  v18->_managerFSM = (SUCoreFSM *)v7;

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
}

- (void)setupNetworkMonitoring
{
  char v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[getSUNetworkMonitorClass() sharedInstance];
  uint64_t v2 = [v5[0] currentNetworkType];
  [(SUSettingsStatefulUIManager *)v6 setNetworkType:v2];
  [v5[0] addObserver:v6];
  uint64_t v3 = SBSSpringBoardServerPort();
  MEMORY[0x22A696F20](v3, &v6->_originalCellFlag, &v6->_originalWifiFlag);
  uint64_t v4 = SBSSpringBoardServerPort();
  MEMORY[0x22A696F40](v4, 1);
  objc_storeStrong(v5, 0);
}

- (void)setupBatteryMonitoring
{
  PSSetBatteryMonitoringEnabled();
  id v6 = (id)[MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 batteryState];

  BOOL v8 = 1;
  if (v7 != 2) {
    BOOL v8 = v7 == 3;
  }
  self->_connectedToPowerSource = v8;
  id v3 = (id)[MEMORY[0x263F82670] currentDevice];
  [v3 batteryLevel];
  self->_batteryLevel = v2;

  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_batteryStateChanged_, *MEMORY[0x263F834A0]);

  id v5 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_batteryLevelChanged_ name:*MEMORY[0x263F83498] object:0];
}

- (void)setupObservers
{
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:self selector:sel_didBecomeActive_ name:*MEMORY[0x263F83318] object:0];
}

- (void)checkForAvailableUpdatesWithRetriesCount:(unsigned __int8)a3
{
  id v59 = v79;
  id v60 = "-[SUSettingsStatefulUIManager checkForAvailableUpdatesWithRetriesCount:]";
  uint64_t v81 = *MEMORY[0x263EF8340];
  v79[1] = self;
  v79[0] = a2;
  unsigned __int8 v78 = a3;
  id v58 = [(SUSettingsStatefulUIManager *)self log];
  osos_log_t log = (os_log_t)(id)[v58 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v53 = type;
    id v54 = SUSettingsUIStateToString([(id)v59[1] currentState]);
    id v55 = v54;
    id v75 = v55;
    uint64_t v56 = [(id)v59[1] currentState];
    id v57 = (id)[(id)v59[1] delegate];
    char v73 = 0;
    char v71 = 0;
    if (v57)
    {
      id v74 = (id)[(id)v59[1] delegate];
      int v50 = 1;
      char v73 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v72 = NSStringFromClass(v3);
      char v71 = 1;
      id v51 = (__CFString *)v72;
    }
    else
    {
      id v51 = @"(null)";
    }
    int v44 = v51;
    id v45 = (id)[(id)v59[1] delegate];
    id v46 = (id)[(id)v59[1] scanError];
    id v47 = (id)[(id)v59[1] preferredStatefulDescriptor];
    id v48 = (id)[(id)v59[1] alternateStatefulDescriptor];
    id v49 = (id)[(id)v59[1] currentDownload];
    char v69 = 0;
    char v67 = 0;
    char v65 = 0;
    if (v49)
    {
      id v70 = (id)[(id)v59[1] currentDownload];
      int v42 = 1;
      char v69 = 1;
      id v68 = (id)[v70 descriptor];
      char v67 = 1;
      id v66 = (id)[v68 humanReadableUpdateName];
      char v65 = 1;
      id v43 = (__CFString *)v66;
    }
    else
    {
      id v43 = @"(null)";
    }
    id v28 = v43;
    id v29 = (id)[(id)v59[1] currentDownload];
    char v4 = [(id)v59[1] performThirdPartyScan];
    id v35 = "NO";
    id v5 = "YES";
    id v36 = "YES";
    int v40 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    uint64_t v30 = v5;
    char v6 = [(id)v59[1] isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v36;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v35;
    }
    uint64_t v31 = v7;
    char v8 = [(id)v59[1] hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v36;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v35;
    }
    uint64_t v32 = v9;
    id v33 = (id)[*(id *)(v59[1] + 256) humanReadableUpdateName];
    id v34 = v33;
    id v64 = v34;
    char v10 = [(id)v59[1] hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v36;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v35;
    }
    uint64_t v37 = v11;
    id v38 = (id)[*(id *)(v59[1] + 264) humanReadableUpdateName];
    id v39 = v38;
    id location = v39;
    id v41 = (id)[(id)v59[1] enrolledBetaProgram];
    char v61 = 0;
    if (v41)
    {
      id v62 = (id)[(id)v59[1] enrolledBetaProgram];
      char v61 = 1;
      uint64_t v27 = [v62 programID];
    }
    else
    {
      uint64_t v27 = 0;
    }
    uint64_t v18 = v27;
    id v26 = (id)[(id)v59[1] betaPrograms];
    uint64_t v19 = [v26 count];
    id v25 = (id)[(id)v59[1] currentFullScanOperation];
    id v24 = (id)[(id)v59[1] currentRefreshScanOperation];
    id v23 = (id)[(id)v59[1] currentUpdateOperation];
    id v22 = (id)[(id)v59[1] auxiliaryOperations];
    id v20 = &v13;
    buf = v80;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v80, (uint64_t)v60, (uint64_t)v55, v56, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, v31, v32, (uint64_t)v34, v37, (uint64_t)v39, v27, v19,
      (uint64_t)v25,
      (uint64_t)v24,
      (uint64_t)v23,
      [v22 count]);
    _os_log_impl(&dword_228401000, log, v53[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if (v61) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    id obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v64, obj);
    objc_storeStrong(&v75, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v16 = (id)[(id)v59[1] managerFSM];
  id v14 = @"CheckForAvailableUpdate";
  id v12 = [SUSettingsStatefulUIManagerFSMParam alloc];
  id v15 = [(SUSettingsStatefulUIManagerFSMParam *)v12 initWithRetriesCount:v78];
  objc_msgSend(v16, "postEvent:withInfo:", v14);
}

- (void)performFullScan:(id)a3
{
  Class v244 = "-[SUSettingsStatefulUIManager performFullScan:]";
  uint64_t v315 = *MEMORY[0x263EF8340];
  id v311 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = v311;
  objc_sync_enter(obj);
  id v243 = (id)[v311 currentRefreshScanOperation];
  id v3 = v243;
  BOOL v241 = v3 == 0;

  if (!v241)
  {
    id v240 = (id)[v311 log];
    id v238 = v240;
    id v239 = (id)[v238 oslog];
    osos_log_t log = (os_log_t)v239;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)id v236 = type;
      uint64_t v237 = [v311 currentState];
      id v234 = SUSettingsUIStateToString(v237);
      id v231 = v234;
      id v232 = v231;
      id v307 = v232;
      uint64_t v233 = [v311 currentState];
      char v305 = 0;
      char v303 = 0;
      id v230 = (id)[v311 delegate];
      id v229 = v230;
      if (v229)
      {
        id v228 = (id)[v311 delegate];
        id v306 = v228;
        char v305 = 1;
        Class aClass = (Class)objc_opt_class();
        id v226 = NSStringFromClass(aClass);
        id v304 = v226;
        char v303 = 1;
        id v225 = (__CFString *)v304;
      }
      else
      {
        id v225 = @"(null)";
      }
      id v223 = v225;
      id v224 = (id)[v311 delegate];
      id v221 = v224;
      id v222 = (id)[v311 scanError];
      id v219 = v222;
      id v220 = (id)[v311 preferredStatefulDescriptor];
      id v217 = v220;
      id v218 = (id)[v311 alternateStatefulDescriptor];
      id v215 = v218;
      char v301 = 0;
      char v299 = 0;
      char v297 = 0;
      id v216 = (id)[v311 currentDownload];
      id v214 = v216;
      if (v214)
      {
        id v213 = (id)[v311 currentDownload];
        id v302 = v213;
        char v301 = 1;
        id v212 = (id)[v302 descriptor];
        id v300 = v212;
        char v299 = 1;
        id v211 = (id)[v300 humanReadableUpdateName];
        id v298 = v211;
        char v297 = 1;
        char v210 = (__CFString *)v298;
      }
      else
      {
        char v210 = @"(null)";
      }
      os_log_type_t v208 = v210;
      id v209 = (id)[v311 currentDownload];
      id v206 = v209;
      int v207 = [v311 performThirdPartyScan];
      char v4 = "YES";
      if ((v207 & 1) == 0) {
        char v4 = "NO";
      }
      id v204 = v4;
      int v205 = [v311 isTargetedUpdateScheduledForAutoInstall];
      id v5 = "YES";
      if ((v205 & 1) == 0) {
        id v5 = "NO";
      }
      id v202 = v5;
      int v203 = [v311 hidingPreferredDescriptor];
      char v6 = "YES";
      if ((v203 & 1) == 0) {
        char v6 = "NO";
      }
      id v200 = v6;
      id v201 = (id)[*((id *)v311 + 32) humanReadableUpdateName];
      id v197 = v201;
      id v198 = v197;
      id v296 = v198;
      int v199 = [v311 hidingAlternateDescriptor];
      uint64_t v7 = "YES";
      if ((v199 & 1) == 0) {
        uint64_t v7 = "NO";
      }
      id v195 = v7;
      id v196 = (id)[*((id *)v311 + 33) humanReadableUpdateName];
      id v192 = v196;
      id v193 = v192;
      id v295 = v193;
      char v293 = 0;
      id v194 = (id)[v311 enrolledBetaProgram];
      id v191 = v194;
      if (v191)
      {
        id v190 = (id)[v311 enrolledBetaProgram];
        id v294 = v190;
        char v293 = 1;
        uint64_t v189 = [v294 programID];
        uint64_t v188 = v189;
      }
      else
      {
        uint64_t v188 = 0;
      }
      uint64_t v186 = v188;
      id v187 = (id)[v311 betaPrograms];
      id v184 = v187;
      uint64_t v185 = [v184 count];
      id v183 = (id)[v311 currentFullScanOperation];
      id v181 = v183;
      id v182 = (id)[v311 currentRefreshScanOperation];
      id v179 = v182;
      id v180 = (id)[v311 currentUpdateOperation];
      id v177 = v180;
      id v178 = (id)[v311 auxiliaryOperations];
      id v175 = v178;
      uint64_t v176 = [v175 count];
      id v173 = &v20;
      buf = v314;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v314, (uint64_t)v244, (uint64_t)v232, v233, (uint64_t)v223, (uint64_t)v221, (uint64_t)v219, (uint64_t)v217, (uint64_t)v215, (uint64_t)v208, (uint64_t)v206, (uint64_t)v204, (uint64_t)v202, (uint64_t)v200, (uint64_t)v198, (uint64_t)v195, (uint64_t)v193, v188, v185,
        (uint64_t)v181,
        (uint64_t)v179,
        (uint64_t)v177,
        v176);
      _os_log_impl(&dword_228401000, log, v236[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if (v293) {
      if (v297)
      }

      if (v299) {
      if (v301)
      }

      if (v303) {
      if (v305)
      }

      objc_storeStrong(&v295, 0);
      objc_storeStrong(&v296, 0);
      objc_storeStrong(&v307, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v172 = (id)*((void *)v311 + 24);
    id v171 = &v287;
    uint64_t v287 = MEMORY[0x263EF8330];
    int v288 = -1073741824;
    int v289 = 0;
    int v290 = __47__SUSettingsStatefulUIManager_performFullScan___block_invoke;
    v291 = &unk_26483BA90;
    id v170 = &v292;
    id v292 = v311;
    [v172 cancel:v171];
    objc_storeStrong(v170, 0);
  }
  id v169 = (id)[v311 currentFullScanOperation];
  id v8 = v169;
  BOOL v168 = v8 == 0;

  if (v168)
  {
    int v269 = 0;
  }
  else
  {
    id v167 = (id)[v311 log];
    id v165 = v167;
    id v166 = (id)[v165 oslog];
    os_log_t v286 = (os_log_t)v166;

    os_log_type_t v285 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v162 = v286;
      *(_DWORD *)id v163 = v285;
      uint64_t v164 = [v311 currentState];
      id v161 = SUSettingsUIStateToString(v164);
      id v158 = v161;
      id v159 = v158;
      id v284 = v159;
      uint64_t v160 = [v311 currentState];
      char v282 = 0;
      char v280 = 0;
      id v157 = (id)[v311 delegate];
      id v156 = v157;
      if (v156)
      {
        id v155 = (id)[v311 delegate];
        id v283 = v155;
        char v282 = 1;
        Class v154 = (Class)objc_opt_class();
        id v153 = NSStringFromClass(v154);
        id v281 = v153;
        char v280 = 1;
        char v152 = (__CFString *)v281;
      }
      else
      {
        char v152 = @"(null)";
      }
      os_log_type_t v150 = v152;
      id v151 = (id)[v311 delegate];
      id v148 = v151;
      id v149 = (id)[v311 scanError];
      id v146 = v149;
      id v147 = (id)[v311 preferredStatefulDescriptor];
      id v144 = v147;
      id v145 = (id)[v311 alternateStatefulDescriptor];
      id v142 = v145;
      char v278 = 0;
      char v276 = 0;
      char v274 = 0;
      id v143 = (id)[v311 currentDownload];
      id v141 = v143;
      if (v141)
      {
        id v140 = (id)[v311 currentDownload];
        id v279 = v140;
        char v278 = 1;
        id v139 = (id)[v279 descriptor];
        id v277 = v139;
        char v276 = 1;
        id v138 = (id)[v277 humanReadableUpdateName];
        id v275 = v138;
        char v274 = 1;
        id v137 = (__CFString *)v275;
      }
      else
      {
        id v137 = @"(null)";
      }
      uint64_t v135 = v137;
      id v136 = (id)[v311 currentDownload];
      id v133 = v136;
      int v134 = [v311 performThirdPartyScan];
      uint64_t v9 = "YES";
      if ((v134 & 1) == 0) {
        uint64_t v9 = "NO";
      }
      uint64_t v131 = v9;
      int v132 = [v311 isTargetedUpdateScheduledForAutoInstall];
      char v10 = "YES";
      if ((v132 & 1) == 0) {
        char v10 = "NO";
      }
      id v129 = v10;
      int v130 = [v311 hidingPreferredDescriptor];
      uint64_t v11 = "YES";
      if ((v130 & 1) == 0) {
        uint64_t v11 = "NO";
      }
      uint64_t v127 = v11;
      id v128 = (id)[*((id *)v311 + 32) humanReadableUpdateName];
      id v124 = v128;
      id v125 = v124;
      id v273 = v125;
      int v126 = [v311 hidingAlternateDescriptor];
      id v12 = "YES";
      if ((v126 & 1) == 0) {
        id v12 = "NO";
      }
      id v122 = v12;
      id v123 = (id)[*((id *)v311 + 33) humanReadableUpdateName];
      id v119 = v123;
      id v120 = v119;
      id v272 = v120;
      char v270 = 0;
      id v121 = (id)[v311 enrolledBetaProgram];
      id v118 = v121;
      if (v118)
      {
        id v117 = (id)[v311 enrolledBetaProgram];
        id v271 = v117;
        char v270 = 1;
        uint64_t v116 = [v271 programID];
        uint64_t v115 = v116;
      }
      else
      {
        uint64_t v115 = 0;
      }
      uint64_t v113 = v115;
      id v114 = (id)[v311 betaPrograms];
      id v111 = v114;
      uint64_t v112 = [v111 count];
      id v110 = (id)[v311 currentFullScanOperation];
      id v108 = v110;
      id v109 = (id)[v311 currentRefreshScanOperation];
      id v106 = v109;
      id v107 = (id)[v311 currentUpdateOperation];
      id v104 = v107;
      id v105 = (id)[v311 auxiliaryOperations];
      id v102 = v105;
      uint64_t v103 = [v102 count];
      char v100 = &v20;
      id v101 = v313;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v313, (uint64_t)v244, (uint64_t)v159, v160, (uint64_t)v150, (uint64_t)v148, (uint64_t)v146, (uint64_t)v144, (uint64_t)v142, (uint64_t)v135, (uint64_t)v133, (uint64_t)v131, (uint64_t)v129, (uint64_t)v127, (uint64_t)v125, (uint64_t)v122, (uint64_t)v120, v113, v112,
        (uint64_t)v108,
        (uint64_t)v106,
        (uint64_t)v104,
        v103);
      _os_log_impl(&dword_228401000, v162, v163[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v101,
        0xDEu);

      if (v270) {
      if (v274)
      }

      if (v276) {
      if (v278)
      }

      if (v280) {
      if (v282)
      }

      objc_storeStrong(&v272, 0);
      objc_storeStrong(&v273, 0);
      objc_storeStrong(&v284, 0);
    }
    objc_storeStrong((id *)&v286, 0);
    int v269 = 1;
  }
  objc_sync_exit(obj);

  if (!v269)
  {
    id v99 = (id)[MEMORY[0x263F08C38] UUID];
    id v97 = v99;
    id v98 = (id)[v97 UUIDString];
    id v268 = v98;

    id v96 = (id)[v311 log];
    id v94 = v96;
    id v95 = (id)[v94 oslog];
    os_log_t v267 = (os_log_t)v95;

    os_log_type_t v266 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v91 = v267;
      *(_DWORD *)char v92 = v266;
      uint64_t v93 = [v311 currentState];
      id v90 = SUSettingsUIStateToString(v93);
      id v87 = v90;
      id v88 = v87;
      id v265 = v88;
      uint64_t v89 = [v311 currentState];
      id v86 = (id)[v311 delegate];
      id v85 = v86;
      char v263 = 0;
      char v261 = 0;
      if (v85)
      {
        id v84 = (id)[v311 delegate];
        id v264 = v84;
        char v263 = 1;
        Class v83 = (Class)objc_opt_class();
        id v82 = NSStringFromClass(v83);
        id v262 = v82;
        char v261 = 1;
        uint64_t v81 = (__CFString *)v262;
      }
      else
      {
        uint64_t v81 = @"(null)";
      }
      id v79 = v81;
      id v80 = (id)[v311 delegate];
      id v77 = v80;
      id v78 = (id)[v311 scanError];
      id v75 = v78;
      id v76 = (id)[v311 preferredStatefulDescriptor];
      id v73 = v76;
      id v74 = (id)[v311 alternateStatefulDescriptor];
      id v71 = v74;
      id v72 = (id)[v311 currentDownload];
      id v70 = v72;
      char v259 = 0;
      char v257 = 0;
      char v255 = 0;
      if (v70)
      {
        id v69 = (id)[v311 currentDownload];
        id v260 = v69;
        char v259 = 1;
        id v68 = (id)[v260 descriptor];
        id v258 = v68;
        char v257 = 1;
        id v67 = (id)[v258 humanReadableUpdateName];
        id v256 = v67;
        char v255 = 1;
        id v66 = (__CFString *)v256;
      }
      else
      {
        id v66 = @"(null)";
      }
      id v64 = v66;
      id v65 = (id)[v311 currentDownload];
      id v62 = v65;
      int v63 = [v311 performThirdPartyScan];
      uint64_t v13 = "YES";
      if ((v63 & 1) == 0) {
        uint64_t v13 = "NO";
      }
      id v60 = v13;
      int v61 = [v311 isTargetedUpdateScheduledForAutoInstall];
      id v14 = "YES";
      if ((v61 & 1) == 0) {
        id v14 = "NO";
      }
      id v58 = v14;
      int v59 = [v311 hidingPreferredDescriptor];
      id v15 = "YES";
      if ((v59 & 1) == 0) {
        id v15 = "NO";
      }
      uint64_t v56 = v15;
      id v57 = (id)[*((id *)v311 + 32) humanReadableUpdateName];
      id v53 = v57;
      id v54 = v53;
      id v254 = v54;
      int v55 = [v311 hidingAlternateDescriptor];
      id v16 = "YES";
      if ((v55 & 1) == 0) {
        id v16 = "NO";
      }
      id v51 = v16;
      id v52 = (id)[*((id *)v311 + 33) humanReadableUpdateName];
      id v48 = v52;
      id v49 = v48;
      id v253 = v49;
      id v50 = (id)[v311 enrolledBetaProgram];
      id v47 = v50;
      char v251 = 0;
      if (v47)
      {
        id v46 = (id)[v311 enrolledBetaProgram];
        id v252 = v46;
        char v251 = 1;
        uint64_t v45 = [v252 programID];
        uint64_t v44 = v45;
      }
      else
      {
        uint64_t v44 = 0;
      }
      uint64_t v42 = v44;
      id v43 = (id)[v311 betaPrograms];
      id v40 = v43;
      uint64_t v41 = [v40 count];
      id v39 = (id)[v311 currentFullScanOperation];
      id v37 = v39;
      id v38 = (id)[v311 currentRefreshScanOperation];
      id v35 = v38;
      id v36 = (id)[v311 currentUpdateOperation];
      id v33 = v36;
      id v34 = (id)[v311 auxiliaryOperations];
      id v31 = v34;
      uint64_t v32 = [v31 count];
      uint64_t v17 = *((void *)v311 + 23);
      uint64_t v18 = *((void *)v311 + 24);
      id v29 = &v20;
      uint64_t v30 = v312;
      __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v312, (uint64_t)v244, (uint64_t)v88, v89, (uint64_t)v79, (uint64_t)v77, (uint64_t)v75, (uint64_t)v73, (uint64_t)v71, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v51, (uint64_t)v49, v42, v41,
        (uint64_t)v37,
        (uint64_t)v35,
        (uint64_t)v33,
        v32,
        (uint64_t)v268,
        v17,
        v18);
      _os_log_impl(&dword_228401000, v91, v92[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Beginning a full scan operation with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
        v30,
        0xFCu);

      if (v251) {
      if (v255)
      }

      if (v257) {
      if (v259)
      }

      if (v261) {
      if (v263)
      }

      objc_storeStrong(&v253, 0);
      objc_storeStrong(&v254, 0);
      objc_storeStrong(&v265, 0);
    }
    objc_storeStrong((id *)&v267, 0);
    *((unsigned char *)v311 + 10) = 0;
    id v28 = [SUSettingsScanOperation alloc];
    uint64_t v27 = [(SUSettingsScanOperation *)v28 initWithUUID:v268 usingSUManagerClient:*((void *)v311 + 28) andBetaManager:*((void *)v311 + 29) withCompletionQueue:*((void *)v311 + 21)];
    uint64_t v19 = (void *)*((void *)v311 + 23);
    *((void *)v311 + 23) = v27;

    id v25 = (id)*((void *)v311 + 23);
    id v26 = (id)[v311 createScanOperationOptions];
    id v23 = v26;
    id v24 = &v245;
    uint64_t v245 = MEMORY[0x263EF8330];
    int v246 = -1073741824;
    int v247 = 0;
    id v248 = __47__SUSettingsStatefulUIManager_performFullScan___block_invoke_414;
    id v249 = &unk_26483BF18;
    uint64_t v21 = (id *)v250;
    v250[0] = v311;
    id v22 = (id *)(v24 + 5);
    v250[1] = location[0];
    [v25 checkForAvailableUpdatesWithOptions:v23 usingCompletionHandler:v24];

    objc_storeStrong(v22, 0);
    objc_storeStrong(v21, 0);
    objc_storeStrong(&v268, 0);
    int v269 = 0;
  }
  objc_storeStrong(location, 0);
}

uint64_t __47__SUSettingsStatefulUIManager_performFullScan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

void __47__SUSettingsStatefulUIManager_performFullScan___block_invoke_414(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v5)
  {
    [a1[5] setError:v5];
    [a1[4] handleFailedFullScan:a1[5]];
  }
  else
  {
    [a1[5] setFullScanResults:location[0]];
    [a1[4] handleFullScanResults:a1[5]];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)performFullScanWithScanResults:(id)a3 andScanError:(id)a4
{
  id obj = a4;
  uint64_t v245 = "-[SUSettingsStatefulUIManager performFullScanWithScanResults:andScanError:]";
  uint64_t v317 = *MEMORY[0x263EF8340];
  id v313 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v311 = 0;
  objc_storeStrong(&v311, obj);
  id v242 = v313;
  objc_sync_enter(v242);
  id v243 = (id)[v313 currentRefreshScanOperation];
  id v4 = v243;
  BOOL v241 = v4 == 0;

  if (!v241)
  {
    id v240 = (id)[v313 log];
    id v238 = v240;
    id v239 = (id)[v238 oslog];
    osos_log_t log = (os_log_t)v239;

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)id v236 = type;
      uint64_t v237 = [v313 currentState];
      id v234 = SUSettingsUIStateToString(v237);
      id v231 = v234;
      id v232 = v231;
      id v308 = v232;
      uint64_t v233 = [v313 currentState];
      char v306 = 0;
      char v304 = 0;
      id v230 = (id)[v313 delegate];
      id v229 = v230;
      if (v229)
      {
        id v228 = (id)[v313 delegate];
        id v307 = v228;
        char v306 = 1;
        Class aClass = (Class)objc_opt_class();
        id v226 = NSStringFromClass(aClass);
        id v305 = v226;
        char v304 = 1;
        id v225 = (__CFString *)v305;
      }
      else
      {
        id v225 = @"(null)";
      }
      id v223 = v225;
      id v224 = (id)[v313 delegate];
      id v221 = v224;
      id v222 = (id)[v313 scanError];
      id v219 = v222;
      id v220 = (id)[v313 preferredStatefulDescriptor];
      id v217 = v220;
      id v218 = (id)[v313 alternateStatefulDescriptor];
      id v215 = v218;
      char v302 = 0;
      char v300 = 0;
      char v298 = 0;
      id v216 = (id)[v313 currentDownload];
      id v214 = v216;
      if (v214)
      {
        id v213 = (id)[v313 currentDownload];
        id v303 = v213;
        char v302 = 1;
        id v212 = (id)[v303 descriptor];
        id v301 = v212;
        char v300 = 1;
        id v211 = (id)[v301 humanReadableUpdateName];
        id v299 = v211;
        char v298 = 1;
        char v210 = (__CFString *)v299;
      }
      else
      {
        char v210 = @"(null)";
      }
      os_log_type_t v208 = v210;
      id v209 = (id)[v313 currentDownload];
      id v206 = v209;
      int v207 = [v313 performThirdPartyScan];
      id v5 = "YES";
      if ((v207 & 1) == 0) {
        id v5 = "NO";
      }
      id v204 = v5;
      int v205 = [v313 isTargetedUpdateScheduledForAutoInstall];
      char v6 = "YES";
      if ((v205 & 1) == 0) {
        char v6 = "NO";
      }
      id v202 = v6;
      int v203 = [v313 hidingPreferredDescriptor];
      uint64_t v7 = "YES";
      if ((v203 & 1) == 0) {
        uint64_t v7 = "NO";
      }
      id v200 = v7;
      id v201 = (id)[*((id *)v313 + 32) humanReadableUpdateName];
      id v197 = v201;
      id v198 = v197;
      id v297 = v198;
      int v199 = [v313 hidingAlternateDescriptor];
      id v8 = "YES";
      if ((v199 & 1) == 0) {
        id v8 = "NO";
      }
      id v195 = v8;
      id v196 = (id)[*((id *)v313 + 33) humanReadableUpdateName];
      id v192 = v196;
      id v193 = v192;
      id v296 = v193;
      char v294 = 0;
      id v194 = (id)[v313 enrolledBetaProgram];
      id v191 = v194;
      if (v191)
      {
        id v190 = (id)[v313 enrolledBetaProgram];
        id v295 = v190;
        char v294 = 1;
        uint64_t v189 = [v295 programID];
        uint64_t v188 = v189;
      }
      else
      {
        uint64_t v188 = 0;
      }
      uint64_t v186 = v188;
      id v187 = (id)[v313 betaPrograms];
      id v184 = v187;
      uint64_t v185 = [v184 count];
      id v183 = (id)[v313 currentFullScanOperation];
      id v181 = v183;
      id v182 = (id)[v313 currentRefreshScanOperation];
      id v179 = v182;
      id v180 = (id)[v313 currentUpdateOperation];
      id v177 = v180;
      id v178 = (id)[v313 auxiliaryOperations];
      id v175 = v178;
      uint64_t v176 = [v175 count];
      id v173 = &v21;
      buf = v316;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v316, (uint64_t)v245, (uint64_t)v232, v233, (uint64_t)v223, (uint64_t)v221, (uint64_t)v219, (uint64_t)v217, (uint64_t)v215, (uint64_t)v208, (uint64_t)v206, (uint64_t)v204, (uint64_t)v202, (uint64_t)v200, (uint64_t)v198, (uint64_t)v195, (uint64_t)v193, v188, v185,
        (uint64_t)v181,
        (uint64_t)v179,
        (uint64_t)v177,
        v176);
      _os_log_impl(&dword_228401000, log, v236[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if (v294) {
      if (v298)
      }

      if (v300) {
      if (v302)
      }

      if (v304) {
      if (v306)
      }

      objc_storeStrong(&v296, 0);
      objc_storeStrong(&v297, 0);
      objc_storeStrong(&v308, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v172 = (id)*((void *)v313 + 24);
    id v171 = &v288;
    uint64_t v288 = MEMORY[0x263EF8330];
    int v289 = -1073741824;
    int v290 = 0;
    v291 = __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke;
    id v292 = &unk_26483BA90;
    id v170 = &v293;
    id v293 = v313;
    [v172 cancel:v171];
    objc_storeStrong(v170, 0);
  }
  id v169 = (id)[v313 currentFullScanOperation];
  id v9 = v169;
  BOOL v168 = v9 == 0;

  if (v168)
  {
    int v270 = 0;
  }
  else
  {
    id v167 = (id)[v313 log];
    id v165 = v167;
    id v166 = (id)[v165 oslog];
    os_log_t v287 = (os_log_t)v166;

    os_log_type_t v286 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v162 = v287;
      *(_DWORD *)id v163 = v286;
      uint64_t v164 = [v313 currentState];
      id v161 = SUSettingsUIStateToString(v164);
      id v158 = v161;
      id v159 = v158;
      id v285 = v159;
      uint64_t v160 = [v313 currentState];
      char v283 = 0;
      char v281 = 0;
      id v157 = (id)[v313 delegate];
      id v156 = v157;
      if (v156)
      {
        id v155 = (id)[v313 delegate];
        id v284 = v155;
        char v283 = 1;
        Class v154 = (Class)objc_opt_class();
        id v153 = NSStringFromClass(v154);
        id v282 = v153;
        char v281 = 1;
        char v152 = (__CFString *)v282;
      }
      else
      {
        char v152 = @"(null)";
      }
      os_log_type_t v150 = v152;
      id v151 = (id)[v313 delegate];
      id v148 = v151;
      id v149 = (id)[v313 scanError];
      id v146 = v149;
      id v147 = (id)[v313 preferredStatefulDescriptor];
      id v144 = v147;
      id v145 = (id)[v313 alternateStatefulDescriptor];
      id v142 = v145;
      char v279 = 0;
      char v277 = 0;
      char v275 = 0;
      id v143 = (id)[v313 currentDownload];
      id v141 = v143;
      if (v141)
      {
        id v140 = (id)[v313 currentDownload];
        id v280 = v140;
        char v279 = 1;
        id v139 = (id)[v280 descriptor];
        id v278 = v139;
        char v277 = 1;
        id v138 = (id)[v278 humanReadableUpdateName];
        id v276 = v138;
        char v275 = 1;
        id v137 = (__CFString *)v276;
      }
      else
      {
        id v137 = @"(null)";
      }
      uint64_t v135 = v137;
      id v136 = (id)[v313 currentDownload];
      id v133 = v136;
      int v134 = [v313 performThirdPartyScan];
      char v10 = "YES";
      if ((v134 & 1) == 0) {
        char v10 = "NO";
      }
      uint64_t v131 = v10;
      int v132 = [v313 isTargetedUpdateScheduledForAutoInstall];
      uint64_t v11 = "YES";
      if ((v132 & 1) == 0) {
        uint64_t v11 = "NO";
      }
      id v129 = v11;
      int v130 = [v313 hidingPreferredDescriptor];
      id v12 = "YES";
      if ((v130 & 1) == 0) {
        id v12 = "NO";
      }
      uint64_t v127 = v12;
      id v128 = (id)[*((id *)v313 + 32) humanReadableUpdateName];
      id v124 = v128;
      id v125 = v124;
      id v274 = v125;
      int v126 = [v313 hidingAlternateDescriptor];
      uint64_t v13 = "YES";
      if ((v126 & 1) == 0) {
        uint64_t v13 = "NO";
      }
      id v122 = v13;
      id v123 = (id)[*((id *)v313 + 33) humanReadableUpdateName];
      id v119 = v123;
      id v120 = v119;
      id v273 = v120;
      char v271 = 0;
      id v121 = (id)[v313 enrolledBetaProgram];
      id v118 = v121;
      if (v118)
      {
        id v117 = (id)[v313 enrolledBetaProgram];
        id v272 = v117;
        char v271 = 1;
        uint64_t v116 = [v272 programID];
        uint64_t v115 = v116;
      }
      else
      {
        uint64_t v115 = 0;
      }
      uint64_t v113 = v115;
      id v114 = (id)[v313 betaPrograms];
      id v111 = v114;
      uint64_t v112 = [v111 count];
      id v110 = (id)[v313 currentFullScanOperation];
      id v108 = v110;
      id v109 = (id)[v313 currentRefreshScanOperation];
      id v106 = v109;
      id v107 = (id)[v313 currentUpdateOperation];
      id v104 = v107;
      id v105 = (id)[v313 auxiliaryOperations];
      id v102 = v105;
      uint64_t v103 = [v102 count];
      char v100 = &v21;
      id v101 = v315;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v315, (uint64_t)v245, (uint64_t)v159, v160, (uint64_t)v150, (uint64_t)v148, (uint64_t)v146, (uint64_t)v144, (uint64_t)v142, (uint64_t)v135, (uint64_t)v133, (uint64_t)v131, (uint64_t)v129, (uint64_t)v127, (uint64_t)v125, (uint64_t)v122, (uint64_t)v120, v113, v112,
        (uint64_t)v108,
        (uint64_t)v106,
        (uint64_t)v104,
        v103);
      _os_log_impl(&dword_228401000, v162, v163[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v101,
        0xDEu);

      if (v271) {
      if (v275)
      }

      if (v277) {
      if (v279)
      }

      if (v281) {
      if (v283)
      }

      objc_storeStrong(&v273, 0);
      objc_storeStrong(&v274, 0);
      objc_storeStrong(&v285, 0);
    }
    objc_storeStrong((id *)&v287, 0);
    int v270 = 1;
  }
  objc_sync_exit(v242);

  if (!v270)
  {
    id v99 = (id)[MEMORY[0x263F08C38] UUID];
    id v97 = v99;
    id v98 = (id)[v97 UUIDString];
    id v269 = v98;

    id v96 = (id)[v313 log];
    id v94 = v96;
    id v95 = (id)[v94 oslog];
    os_log_t v268 = (os_log_t)v95;

    os_log_type_t v267 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v91 = v268;
      *(_DWORD *)char v92 = v267;
      uint64_t v93 = [v313 currentState];
      id v90 = SUSettingsUIStateToString(v93);
      id v87 = v90;
      id v88 = v87;
      id v266 = v88;
      uint64_t v89 = [v313 currentState];
      id v86 = (id)[v313 delegate];
      id v85 = v86;
      char v264 = 0;
      char v262 = 0;
      if (v85)
      {
        id v84 = (id)[v313 delegate];
        id v265 = v84;
        char v264 = 1;
        Class v83 = (Class)objc_opt_class();
        id v82 = NSStringFromClass(v83);
        id v263 = v82;
        char v262 = 1;
        uint64_t v81 = (__CFString *)v263;
      }
      else
      {
        uint64_t v81 = @"(null)";
      }
      id v79 = v81;
      id v80 = (id)[v313 delegate];
      id v77 = v80;
      id v78 = (id)[v313 scanError];
      id v75 = v78;
      id v76 = (id)[v313 preferredStatefulDescriptor];
      id v73 = v76;
      id v74 = (id)[v313 alternateStatefulDescriptor];
      id v71 = v74;
      id v72 = (id)[v313 currentDownload];
      id v70 = v72;
      char v260 = 0;
      char v258 = 0;
      char v256 = 0;
      if (v70)
      {
        id v69 = (id)[v313 currentDownload];
        id v261 = v69;
        char v260 = 1;
        id v68 = (id)[v261 descriptor];
        id v259 = v68;
        char v258 = 1;
        id v67 = (id)[v259 humanReadableUpdateName];
        id v257 = v67;
        char v256 = 1;
        id v66 = (__CFString *)v257;
      }
      else
      {
        id v66 = @"(null)";
      }
      id v64 = v66;
      id v65 = (id)[v313 currentDownload];
      id v62 = v65;
      int v63 = [v313 performThirdPartyScan];
      id v14 = "YES";
      if ((v63 & 1) == 0) {
        id v14 = "NO";
      }
      id v60 = v14;
      int v61 = [v313 isTargetedUpdateScheduledForAutoInstall];
      id v15 = "YES";
      if ((v61 & 1) == 0) {
        id v15 = "NO";
      }
      id v58 = v15;
      int v59 = [v313 hidingPreferredDescriptor];
      id v16 = "YES";
      if ((v59 & 1) == 0) {
        id v16 = "NO";
      }
      uint64_t v56 = v16;
      id v57 = (id)[*((id *)v313 + 32) humanReadableUpdateName];
      id v53 = v57;
      id v54 = v53;
      id v255 = v54;
      int v55 = [v313 hidingAlternateDescriptor];
      uint64_t v17 = "YES";
      if ((v55 & 1) == 0) {
        uint64_t v17 = "NO";
      }
      id v51 = v17;
      id v52 = (id)[*((id *)v313 + 33) humanReadableUpdateName];
      id v48 = v52;
      id v49 = v48;
      id v254 = v49;
      id v50 = (id)[v313 enrolledBetaProgram];
      id v47 = v50;
      char v252 = 0;
      if (v47)
      {
        id v46 = (id)[v313 enrolledBetaProgram];
        id v253 = v46;
        char v252 = 1;
        uint64_t v45 = [v253 programID];
        uint64_t v44 = v45;
      }
      else
      {
        uint64_t v44 = 0;
      }
      uint64_t v42 = v44;
      id v43 = (id)[v313 betaPrograms];
      id v40 = v43;
      uint64_t v41 = [v40 count];
      id v39 = (id)[v313 currentFullScanOperation];
      id v37 = v39;
      id v38 = (id)[v313 currentRefreshScanOperation];
      id v35 = v38;
      id v36 = (id)[v313 currentUpdateOperation];
      id v33 = v36;
      id v34 = (id)[v313 auxiliaryOperations];
      id v31 = v34;
      uint64_t v32 = [v31 count];
      uint64_t v18 = *((void *)v313 + 23);
      uint64_t v19 = *((void *)v313 + 24);
      id v29 = &v21;
      uint64_t v30 = v314;
      __os_log_helper_16_2_27_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_0_8_0((uint64_t)v314, (uint64_t)v245, (uint64_t)v88, v89, (uint64_t)v79, (uint64_t)v77, (uint64_t)v75, (uint64_t)v73, (uint64_t)v71, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v51, (uint64_t)v49, v42, v41,
        (uint64_t)v37,
        (uint64_t)v35,
        (uint64_t)v33,
        v32,
        (uint64_t)location[0],
        (uint64_t)v311,
        (uint64_t)v269,
        v18,
        v19);
      _os_log_impl(&dword_228401000, v91, v92[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Beginning a full scan operation with with existing scan results (results: %p, error: %{public}@), usoing scan ID"
        ": %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
        v30,
        0x110u);

      if (v252) {
      if (v256)
      }

      if (v258) {
      if (v260)
      }

      if (v262) {
      if (v264)
      }

      objc_storeStrong(&v254, 0);
      objc_storeStrong(&v255, 0);
      objc_storeStrong(&v266, 0);
    }
    objc_storeStrong((id *)&v268, 0);
    *((unsigned char *)v313 + 10) = 0;
    id v28 = [SUSettingsScanOperation alloc];
    uint64_t v27 = [(SUSettingsScanOperation *)v28 initWithUUID:v269 usingSUManagerClient:*((void *)v313 + 28) andBetaManager:*((void *)v313 + 29) withCompletionQueue:*((void *)v313 + 21)];
    uint64_t v20 = (void *)*((void *)v313 + 23);
    *((void *)v313 + 23) = v27;

    id v25 = (id)*((void *)v313 + 23);
    id v26 = (id)[v313 createScanOperationOptions];
    id v23 = v26;
    id v24 = &v246;
    uint64_t v246 = MEMORY[0x263EF8330];
    int v247 = -1073741824;
    int v248 = 0;
    id v249 = __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke_416;
    uint64_t v250 = &unk_26483BF40;
    id v22 = &v251;
    id v251 = v313;
    [v25 checkForAvailableUpdatesWithOptions:v23 usingCompletionHandler:v24 usingThirdPartyScanResults:location[0] andScanError:v311];

    objc_storeStrong(v22, 0);
    objc_storeStrong(&v269, 0);
    int v270 = 0;
  }
  objc_storeStrong(&v311, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

void __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke_416(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v7)
  {
    id v5 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    [(SUSettingsStatefulUIManagerFSMParam *)v5 setError:v7];
    [a1[4] handleFailedFullScan:v5];
    objc_storeStrong((id *)&v5, 0);
  }
  else
  {
    v6[0] = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    [v6[0] setFullScanResults:location[0]];
    [a1[4] handleFullScanResults:v6[0]];
    objc_storeStrong(v6, 0);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)performRefreshScan:(id)a3
{
  id v73 = "-[SUSettingsStatefulUIManager performRefreshScan:]";
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v100 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v74 = (id)[MEMORY[0x263F08C38] UUID];
  id v98 = (id)[v74 UUIDString];

  id v72 = (id)[v100 log];
  osos_log_t log = (os_log_t)(id)[v72 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v67 = type;
    id v68 = SUSettingsUIStateToString([v100 currentState]);
    id v69 = v68;
    id v95 = v69;
    uint64_t v70 = [v100 currentState];
    id v71 = (id)[v100 delegate];
    char v93 = 0;
    char v91 = 0;
    if (v71)
    {
      id v94 = (id)[v100 delegate];
      int v64 = 1;
      char v93 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v92 = NSStringFromClass(v3);
      char v91 = 1;
      id v65 = (__CFString *)v92;
    }
    else
    {
      id v65 = @"(null)";
    }
    id v58 = v65;
    id v59 = (id)[v100 delegate];
    id v60 = (id)[v100 scanError];
    id v61 = (id)[v100 preferredStatefulDescriptor];
    id v62 = (id)[v100 alternateStatefulDescriptor];
    id v63 = (id)[v100 currentDownload];
    char v89 = 0;
    char v87 = 0;
    char v85 = 0;
    if (v63)
    {
      id v90 = (id)[v100 currentDownload];
      int v56 = 1;
      char v89 = 1;
      id v88 = (id)[v90 descriptor];
      char v87 = 1;
      id v86 = (id)[v88 humanReadableUpdateName];
      char v85 = 1;
      id v57 = (__CFString *)v86;
    }
    else
    {
      id v57 = @"(null)";
    }
    uint64_t v42 = v57;
    id v43 = (id)[v100 currentDownload];
    char v4 = [v100 performThirdPartyScan];
    id v49 = "NO";
    id v5 = "YES";
    id v50 = "YES";
    int v54 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    uint64_t v44 = v5;
    char v6 = [v100 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v50;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v49;
    }
    uint64_t v45 = v7;
    char v8 = [v100 hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v50;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v49;
    }
    uint64_t v46 = v9;
    id v47 = (id)[*((id *)v100 + 32) humanReadableUpdateName];
    id v48 = v47;
    id v84 = v48;
    char v10 = [v100 hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v50;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v49;
    }
    uint64_t v51 = v11;
    id v52 = (id)[*((id *)v100 + 33) humanReadableUpdateName];
    id v53 = v52;
    id v83 = v53;
    id v55 = (id)[v100 enrolledBetaProgram];
    char v81 = 0;
    if (v55)
    {
      id v82 = (id)[v100 enrolledBetaProgram];
      char v81 = 1;
      uint64_t v41 = [v82 programID];
    }
    else
    {
      uint64_t v41 = 0;
    }
    uint64_t v32 = v41;
    id v40 = (id)[v100 betaPrograms];
    uint64_t v33 = [v40 count];
    id v39 = (id)[v100 currentFullScanOperation];
    id v38 = (id)[v100 currentRefreshScanOperation];
    id v37 = (id)[v100 currentUpdateOperation];
    id v36 = (id)[v100 auxiliaryOperations];
    uint64_t v12 = [v36 count];
    uint64_t v13 = *((void *)v100 + 23);
    uint64_t v14 = *((void *)v100 + 24);
    id v34 = &v18;
    buf = v101;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v101, (uint64_t)v73, (uint64_t)v69, v70, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, v45, v46, (uint64_t)v48, v51, (uint64_t)v53, v41, v33,
      (uint64_t)v39,
      (uint64_t)v38,
      (uint64_t)v37,
      v12,
      (uint64_t)v98,
      v13,
      v14);
    _os_log_impl(&dword_228401000, log, v67[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning to refresh the current scan results with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
      buf,
      0xFCu);

    if (v81) {
    if (v85)
    }

    if (v87) {
    if (v89)
    }

    if (v91) {
    if (v93)
    }

    id obj = 0;
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, obj);
    objc_storeStrong(&v95, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v15 = [SUSettingsScanOperation alloc];
  id v28 = &v98;
  uint64_t v16 = [(SUSettingsScanOperation *)v15 initWithUUID:v98 usingSUManagerClient:*((void *)v100 + 28) andBetaManager:*((void *)v100 + 29) withCompletionQueue:*((void *)v100 + 21)];
  uint64_t v17 = (void *)*((void *)v100 + 24);
  *((void *)v100 + 24) = v16;

  *((unsigned char *)v100 + 10) = 0;
  id v20 = (id)*((void *)v100 + 24);
  id v25 = (id)[v100 preferredStatefulDescriptor];
  id v24 = (id)[v25 descriptor];
  id v23 = (id)[v100 alternateStatefulDescriptor];
  id v22 = (id)[v23 descriptor];
  id v21 = (id)[v100 createScanOperationOptions];
  uint64_t v19 = &v75;
  uint64_t v75 = MEMORY[0x263EF8330];
  int v76 = -1073741824;
  int v77 = 0;
  id v78 = __50__SUSettingsStatefulUIManager_performRefreshScan___block_invoke;
  id v79 = &unk_26483BF68;
  uint64_t v27 = (id *)v80;
  v80[0] = v100;
  id v26 = (id *)(v19 + 5);
  id v29 = location;
  v80[1] = location[0];
  [v20 refreshScanResultsWithPreferredUpdate:v24 alternateUpdate:v22 options:v21 completionHandler:v19];

  id v30 = 0;
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, v30);
  objc_storeStrong(v28, v30);
  objc_storeStrong(v29, v30);
}

void __50__SUSettingsStatefulUIManager_performRefreshScan___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v5)
  {
    objc_storeStrong((id *)a1[4] + 12, v5);
    [a1[5] setError:v5];
    [*((id *)a1[4] + 27) postEvent:@"RefreshScanResultsFailed" withInfo:a1[5]];
  }
  else
  {
    [a1[5] setRefreshScanResults:location[0]];
    [a1[4] handleRefreshScanResults:a1[5]];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)handleFullScanResults:(id)a3
{
  id v230 = "-[SUSettingsStatefulUIManager handleFullScanResults:]";
  uint64_t v314 = *MEMORY[0x263EF8340];
  id v309 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v307 = (id)[location[0] fullScanResults];
  id v229 = (id)[v309 log];
  osos_log_t log = (os_log_t)(id)[v229 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v224 = type;
    id v225 = SUSettingsUIStateToString([v309 currentState]);
    id v226 = v225;
    id v304 = v226;
    uint64_t v227 = [v309 currentState];
    id v228 = (id)[v309 delegate];
    char v302 = 0;
    char v300 = 0;
    if (v228)
    {
      id v303 = (id)[v309 delegate];
      int v221 = 1;
      char v302 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v301 = NSStringFromClass(v3);
      char v300 = 1;
      id v222 = (__CFString *)v301;
    }
    else
    {
      id v222 = @"(null)";
    }
    id v215 = v222;
    id v216 = (id)[v309 delegate];
    id v217 = (id)[v309 scanError];
    id v218 = (id)[v309 preferredStatefulDescriptor];
    id v219 = (id)[v309 alternateStatefulDescriptor];
    id v220 = (id)[v309 currentDownload];
    char v298 = 0;
    char v296 = 0;
    char v294 = 0;
    if (v220)
    {
      id v299 = (id)[v309 currentDownload];
      int v213 = 1;
      char v298 = 1;
      id v297 = (id)[v299 descriptor];
      char v296 = 1;
      id v295 = (id)[v297 humanReadableUpdateName];
      char v294 = 1;
      id v214 = (__CFString *)v295;
    }
    else
    {
      id v214 = @"(null)";
    }
    int v199 = v214;
    id v200 = (id)[v309 currentDownload];
    char v4 = [v309 performThirdPartyScan];
    id v206 = "NO";
    id v5 = "YES";
    int v207 = "YES";
    int v211 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    id v201 = v5;
    char v6 = [v309 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v207;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v206;
    }
    uint64_t v202 = v7;
    char v8 = [v309 hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v207;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v206;
    }
    uint64_t v203 = v9;
    id v204 = (id)[*((id *)v309 + 32) humanReadableUpdateName];
    id v205 = v204;
    id v293 = v205;
    char v10 = [v309 hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v207;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v206;
    }
    uint64_t v208 = v11;
    id v209 = (id)[*((id *)v309 + 33) humanReadableUpdateName];
    id v210 = v209;
    id v292 = v210;
    id v212 = (id)[v309 enrolledBetaProgram];
    char v290 = 0;
    if (v212)
    {
      id v291 = (id)[v309 enrolledBetaProgram];
      char v290 = 1;
      uint64_t v198 = [v291 programID];
    }
    else
    {
      uint64_t v198 = 0;
    }
    uint64_t v187 = v198;
    id v197 = (id)[v309 betaPrograms];
    uint64_t v188 = [v197 count];
    id v196 = (id)[v309 currentFullScanOperation];
    id v195 = (id)[v309 currentRefreshScanOperation];
    id v194 = (id)[v309 currentUpdateOperation];
    id v193 = (id)[v309 auxiliaryOperations];
    uint64_t v189 = [v193 count];
    id v192 = (id)[v307 scanUUID];
    id v190 = &v65;
    buf = v313;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v313, (uint64_t)v230, (uint64_t)v226, v227, (uint64_t)v215, (uint64_t)v216, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219, (uint64_t)v199, (uint64_t)v200, (uint64_t)v201, v202, v203, (uint64_t)v205, v208, (uint64_t)v210, v198, v188,
      (uint64_t)v196,
      (uint64_t)v195,
      (uint64_t)v194,
      v189,
      (uint64_t)v192,
      (uint64_t)v307);
    _os_log_impl(&dword_228401000, log, v224[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a full-scan with ID: %{public}@.\n"
      "Results: %{public}@",
      buf,
      0xF2u);

    if (v290) {
    if (v294)
    }

    if (v296) {
    if (v298)
    }

    if (v300) {
    if (v302)
    }

    id obj = 0;
    objc_storeStrong(&v292, 0);
    objc_storeStrong(&v293, obj);
    objc_storeStrong(&v304, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((void *)v309 + 25))
  {
    char v12 = [v307 emptyScanResults];
    char v288 = 0;
    BOOL v185 = 0;
    if (v12)
    {
      id v289 = (id)[v307 currentDownload];
      char v288 = 1;
      BOOL v185 = v289 == 0;
    }
    BOOL v184 = v185;
    if (v288) {

    }
    if (v184)
    {
      id v183 = (id)[v309 log];
      os_log_t v287 = (os_log_t)(id)[v183 oslog];

      os_log_type_t v286 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v177 = v287;
        *(_DWORD *)id v178 = v286;
        id v179 = SUSettingsUIStateToString([v309 currentState]);
        id v180 = v179;
        id v285 = v180;
        uint64_t v181 = [v309 currentState];
        id v182 = (id)[v309 delegate];
        char v283 = 0;
        char v281 = 0;
        if (v182)
        {
          id v284 = (id)[v309 delegate];
          int v175 = 1;
          char v283 = 1;
          uint64_t v13 = (objc_class *)objc_opt_class();
          id v282 = NSStringFromClass(v13);
          char v281 = v175 & 1;
          uint64_t v176 = (__CFString *)v282;
        }
        else
        {
          uint64_t v176 = @"(null)";
        }
        id v169 = v176;
        id v170 = (id)[v309 delegate];
        id v171 = (id)[v309 scanError];
        id v172 = (id)[v309 preferredStatefulDescriptor];
        id v173 = (id)[v309 alternateStatefulDescriptor];
        id v174 = (id)[v309 currentDownload];
        char v279 = 0;
        char v277 = 0;
        char v275 = 0;
        if (v174)
        {
          id v280 = (id)[v309 currentDownload];
          int v167 = 1;
          char v279 = 1;
          id v278 = (id)[v280 descriptor];
          char v277 = v167 & 1;
          id v276 = (id)[v278 humanReadableUpdateName];
          char v275 = v167 & 1;
          BOOL v168 = (__CFString *)v276;
        }
        else
        {
          BOOL v168 = @"(null)";
        }
        id v153 = v168;
        id v154 = (id)[v309 currentDownload];
        char v14 = [v309 performThirdPartyScan];
        uint64_t v160 = "NO";
        id v15 = "YES";
        id v161 = "YES";
        int v165 = 1;
        if ((v14 & 1) == 0) {
          id v15 = "NO";
        }
        id v155 = v15;
        char v16 = [v309 isTargetedUpdateScheduledForAutoInstall];
        uint64_t v17 = v161;
        if ((v16 & 1) == 0) {
          uint64_t v17 = v160;
        }
        uint64_t v156 = (uint64_t)v17;
        char v18 = [v309 hidingPreferredDescriptor];
        uint64_t v19 = (uint64_t)v161;
        if ((v18 & 1) == 0) {
          uint64_t v19 = (uint64_t)v160;
        }
        uint64_t v157 = v19;
        id v158 = (id)[*((id *)v309 + 32) humanReadableUpdateName];
        id v159 = v158;
        id v274 = v159;
        char v20 = [v309 hidingAlternateDescriptor];
        uint64_t v21 = (uint64_t)v161;
        if ((v20 & 1) == 0) {
          uint64_t v21 = (uint64_t)v160;
        }
        uint64_t v162 = v21;
        id v163 = (id)[*((id *)v309 + 33) humanReadableUpdateName];
        id v164 = v163;
        id v273 = v164;
        id v166 = (id)[v309 enrolledBetaProgram];
        char v271 = 0;
        if (v166)
        {
          id v272 = (id)[v309 enrolledBetaProgram];
          char v271 = 1;
          uint64_t v152 = [v272 programID];
        }
        else
        {
          uint64_t v152 = 0;
        }
        uint64_t v22 = v156;
        uint64_t v23 = (uint64_t)v155;
        id v24 = v154;
        uint64_t v25 = (uint64_t)v153;
        id v26 = v173;
        uint64_t v143 = v152;
        id v151 = (id)[v309 betaPrograms];
        uint64_t v144 = [v151 count];
        id v150 = (id)[v309 currentFullScanOperation];
        id v149 = (id)[v309 currentRefreshScanOperation];
        id v148 = (id)[v309 currentUpdateOperation];
        id v147 = (id)[v309 auxiliaryOperations];
        uint64_t v27 = [v147 count];
        id v145 = &v65;
        id v146 = v312;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v312, (uint64_t)v230, (uint64_t)v180, v181, (uint64_t)v169, (uint64_t)v170, (uint64_t)v171, (uint64_t)v172, (uint64_t)v26, v25, (uint64_t)v24, v23, v22, v157, (uint64_t)v159, v162, (uint64_t)v164, v143, v144,
          (uint64_t)v150,
          (uint64_t)v149,
          (uint64_t)v148,
          v27);
        _os_log_impl(&dword_228401000, v177, v178[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "The full scan yielded empty scan results - cancelling the currently active update operation",
          v146,
          0xDEu);

        if (v271) {
        if (v275)
        }

        if (v277) {
        if (v279)
        }

        if (v281) {
        if (v283)
        }

        id v142 = 0;
        objc_storeStrong(&v273, 0);
        objc_storeStrong(&v274, v142);
        objc_storeStrong(&v285, v142);
      }
      objc_storeStrong((id *)&v287, 0);
      id v140 = (id)*((void *)v309 + 25);
      id v139 = &v265;
      uint64_t v265 = MEMORY[0x263EF8330];
      int v266 = -1073741824;
      int v267 = 0;
      os_log_t v268 = __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke;
      id v269 = &unk_26483BF90;
      id v141 = &v270;
      id v270 = v309;
      [v140 cancel:v139];
      objc_storeStrong(v141, 0);
    }
    else
    {
      id v137 = (id)*((void *)v309 + 10);
      id v138 = (id)[v307 preferredDescriptor];
      char v28 = objc_msgSend(v137, "isEqualToDescriptor:");
      char v263 = 0;
      char v261 = 0;
      char v259 = 0;
      if ((v28 & 1) != 0
        || (id v135 = (id)*((void *)v309 + 10),
            id v264 = (id)[v307 alternateDescriptor],
            char v263 = 1,
            char v29 = objc_msgSend(v135, "isEqualToDescriptor:"),
            int v136 = 1,
            (v29 & 1) != 0))
      {
        id v133 = (id)*((void *)v309 + 11);
        id v262 = (id)[v307 preferredDescriptor];
        char v261 = 1;
        char v30 = objc_msgSend(v133, "isEqualToDescriptor:");
        int v134 = 0;
        if ((v30 & 1) == 0)
        {
          id v131 = (id)*((void *)v309 + 11);
          id v260 = (id)[v307 alternateDescriptor];
          int v132 = 1;
          char v259 = 1;
          int v31 = objc_msgSend(v131, "isEqualToDescriptor:");
          int v134 = v31 ^ v132;
        }
        int v136 = v134;
      }
      int v130 = v136;
      if (v259) {

      }
      if (v261) {
      if (v263)
      }

      if (v130)
      {
        id v129 = (id)[v309 log];
        os_log_t v258 = (os_log_t)(id)[v129 oslog];

        os_log_type_t v257 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v123 = v258;
          *(_DWORD *)id v124 = v257;
          id v125 = SUSettingsUIStateToString([v309 currentState]);
          id v126 = v125;
          id v256 = v126;
          uint64_t v127 = [v309 currentState];
          id v128 = (id)[v309 delegate];
          char v254 = 0;
          char v252 = 0;
          if (v128)
          {
            id v255 = (id)[v309 delegate];
            int v121 = 1;
            char v254 = 1;
            uint64_t v32 = (objc_class *)objc_opt_class();
            id v253 = NSStringFromClass(v32);
            char v252 = v121 & 1;
            id v122 = (__CFString *)v253;
          }
          else
          {
            id v122 = @"(null)";
          }
          uint64_t v115 = v122;
          id v116 = (id)[v309 delegate];
          id v117 = (id)[v309 scanError];
          id v118 = (id)[v309 preferredStatefulDescriptor];
          id v119 = (id)[v309 alternateStatefulDescriptor];
          id v120 = (id)[v309 currentDownload];
          char v250 = 0;
          char v248 = 0;
          char v246 = 0;
          if (v120)
          {
            id v251 = (id)[v309 currentDownload];
            int v113 = 1;
            char v250 = 1;
            id v249 = (id)[v251 descriptor];
            char v248 = v113 & 1;
            id v247 = (id)[v249 humanReadableUpdateName];
            char v246 = v113 & 1;
            id v114 = (__CFString *)v247;
          }
          else
          {
            id v114 = @"(null)";
          }
          id v99 = v114;
          id v100 = (id)[v309 currentDownload];
          char v33 = [v309 performThirdPartyScan];
          id v106 = "NO";
          id v34 = "YES";
          id v107 = "YES";
          int v111 = 1;
          if ((v33 & 1) == 0) {
            id v34 = "NO";
          }
          id v101 = v34;
          char v35 = [v309 isTargetedUpdateScheduledForAutoInstall];
          id v36 = v107;
          if ((v35 & 1) == 0) {
            id v36 = v106;
          }
          uint64_t v102 = (uint64_t)v36;
          char v37 = [v309 hidingPreferredDescriptor];
          id v38 = v107;
          if ((v37 & 1) == 0) {
            id v38 = v106;
          }
          uint64_t v103 = (uint64_t)v38;
          id v104 = (id)[*((id *)v309 + 32) humanReadableUpdateName];
          id v105 = v104;
          id v245 = v105;
          char v39 = [v309 hidingAlternateDescriptor];
          uint64_t v40 = (uint64_t)v107;
          if ((v39 & 1) == 0) {
            uint64_t v40 = (uint64_t)v106;
          }
          uint64_t v108 = v40;
          id v109 = (id)[*((id *)v309 + 33) humanReadableUpdateName];
          id v110 = v109;
          id v244 = v110;
          id v112 = (id)[v309 enrolledBetaProgram];
          char v242 = 0;
          if (v112)
          {
            id v243 = (id)[v309 enrolledBetaProgram];
            char v242 = 1;
            uint64_t v98 = [v243 programID];
          }
          else
          {
            uint64_t v98 = 0;
          }
          uint64_t v41 = (uint64_t)v105;
          uint64_t v42 = v103;
          uint64_t v43 = v102;
          uint64_t v44 = (uint64_t)v101;
          id v45 = v100;
          uint64_t v46 = (uint64_t)v99;
          id v47 = v119;
          uint64_t v83 = v98;
          id v97 = (id)[v309 betaPrograms];
          uint64_t v84 = [v97 count];
          id v96 = (id)[v309 currentFullScanOperation];
          id v95 = (id)[v309 currentRefreshScanOperation];
          id v94 = (id)[v309 currentUpdateOperation];
          id v93 = (id)[v309 auxiliaryOperations];
          uint64_t v85 = [v93 count];
          id v92 = (id)[v307 preferredDescriptor];
          id v91 = (id)[v92 humanReadableUpdateName];
          id v86 = v91;
          id v241 = v86;
          id v90 = (id)[v307 alternateDescriptor];
          id v89 = (id)[v90 humanReadableUpdateName];
          id v240 = v89;
          char v87 = &v65;
          id v88 = v311;
          __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v311, (uint64_t)v230, (uint64_t)v126, v127, (uint64_t)v115, (uint64_t)v116, (uint64_t)v117, (uint64_t)v118, (uint64_t)v47, v46, (uint64_t)v45, v44, v43, v42, v41, v108, (uint64_t)v110, v83, v84,
            (uint64_t)v96,
            (uint64_t)v95,
            (uint64_t)v94,
            v85,
            (uint64_t)v86,
            (uint64_t)v240);
          _os_log_impl(&dword_228401000, v123, v124[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "The full scan yielded results that are different then the previously discovered results - cancelling the cur"
            "rently active update operation.\n"
            "\tresults.preferredDescriptor: %{public}@\n"
            "\tresults.alternateDescriptor: %{public}@",
            v88,
            0xF2u);

          if (v242) {
          if (v246)
          }

          if (v248) {
          if (v250)
          }

          if (v252) {
          if (v254)
          }

          id v82 = 0;
          objc_storeStrong(&v240, 0);
          objc_storeStrong(&v241, v82);
          objc_storeStrong(&v244, v82);
          objc_storeStrong(&v245, v82);
          objc_storeStrong(&v256, v82);
        }
        objc_storeStrong((id *)&v258, 0);
        id v80 = (id)*((void *)v309 + 25);
        id v79 = &v234;
        uint64_t v234 = MEMORY[0x263EF8330];
        int v235 = -1073741824;
        int v236 = 0;
        uint64_t v237 = __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke_418;
        id v238 = &unk_26483BF90;
        char v81 = &v239;
        id v239 = v309;
        [v80 cancel:v79];
        objc_storeStrong(v81, 0);
      }
    }
  }
  [v309 assignScanRelatedMembersFromScanResults:v307];
  id v48 = (id)[v307 scanError];
  id v49 = (void *)*((void *)v309 + 12);
  *((void *)v309 + 12) = v48;

  uint64_t v50 = [v307 mdmPathRestrictions];
  *((void *)v309 + 34) = v50;
  char v51 = [v307 isDelayingUpdate];
  int v76 = 1;
  *((unsigned char *)v309 + 17) = v51 & 1;
  char v52 = [v307 isRollingBack];
  *((unsigned char *)v309 + 9) = v52 & v76;
  id v53 = (id)[v307 rollbackDescriptor];
  int v54 = (void *)*((void *)v309 + 15);
  *((void *)v309 + 15) = v53;

  id v55 = (id)[v307 currentSeedingDevice];
  int v56 = (void *)*((void *)v309 + 16);
  *((void *)v309 + 16) = v55;

  id v57 = (id)[v307 betaPrograms];
  id v58 = (void *)*((void *)v309 + 17);
  *((void *)v309 + 17) = v57;

  id v59 = (id)[v307 enrolledBetaProgram];
  id v60 = (void *)*((void *)v309 + 18);
  *((void *)v309 + 18) = v59;

  id v61 = (id)[v307 ddmDeclaration];
  id v62 = (void *)*((void *)v309 + 14);
  *((void *)v309 + 14) = v61;

  id v77 = (id)[MEMORY[0x263F77DA0] sharedDevice];
  int v78 = [v77 hasSemiSplatActive];

  if (v78)
  {
    id v75 = (id)[v309 log];
    os_log_t v233 = (os_log_t)(id)[v75 oslog];

    os_log_type_t v232 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v72 = v233;
      *(_DWORD *)id v73 = v232;
      id v74 = v310;
      __os_log_helper_16_2_1_8_32((uint64_t)v310, (uint64_t)v230);
      _os_log_impl(&dword_228401000, v72, v73[0], "%s: Rollback already applied, show the user an alert to reboot, and show no available updates.", v74, 0xCu);
    }
    objc_storeStrong((id *)&v233, 0);
    [v309 clearPastScanResults];
    [v309 handleScanFinishedRollbackApplied:location[0]];
    [*((id *)v309 + 27) postEvent:@"NoUpdateAvailable" withInfo:location[0]];
    int v231 = 1;
  }
  else if (*((void *)v309 + 12))
  {
    id v70 = (id)[*((id *)v309 + 12) domain];
    char v63 = [v70 isEqualToString:*MEMORY[0x263F78360]];
    BOOL v71 = 0;
    if (v63) {
      BOOL v71 = [*((id *)v309 + 12) code] == 3;
    }
    BOOL v69 = v71;

    if (v69) {
      [v309 clearPastScanResults];
    }
    [*((id *)v309 + 27) postEvent:@"NoUpdateAvailable" withInfo:location[0]];
    int v231 = 1;
  }
  else if ([v307 emptyScanResults])
  {
    if (*((void *)v309 + 13) && (*((void *)v309 + 10) || *((void *)v309 + 11)))
    {
      [v309 updateDescriptorsUsingScanResults:v307 andWithConcreteError:0];
      [*((id *)v309 + 27) postEvent:@"UpdatesAvailable" withInfo:location[0]];
      int v231 = 1;
    }
    else
    {
      [v309 clearPastScanResults];
      [*((id *)v309 + 27) postEvent:@"NoUpdateAvailable" withInfo:location[0]];
      int v231 = 0;
    }
  }
  else
  {
    [v309 assignDescriptorOfType:0 fromSearchResults:v307];
    [v309 assignDescriptorOfType:1 fromSearchResults:v307];
    id v67 = 0;
    objc_storeStrong((id *)v309 + 32, 0);
    objc_storeStrong((id *)v309 + 33, v67);
    *((unsigned char *)v309 + 15) = 0;
    *((unsigned char *)v309 + 16) = 0;
    id v64 = (id)[v309 currentDownload];
    BOOL v68 = v64 == 0;

    if (!v68) {
      [v309 hideNonTargetedUpdateDescriptors];
    }
    [*((id *)v309 + 27) postEvent:@"UpdatesAvailable" withInfo:location[0]];
    int v231 = 1;
  }
  id v66 = 0;
  objc_storeStrong(&v307, 0);
  objc_storeStrong(location, v66);
}

void __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke(uint64_t a1)
{
}

void __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke_418(uint64_t a1)
{
}

- (void)handleFailedFullScan:(id)a3
{
  uint64_t v85 = &v107;
  id v86 = "-[SUSettingsStatefulUIManager handleFailedFullScan:]";
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v114 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v84 = [(SUSettingsStatefulUIManager *)v114 log];
  id v112 = (id)[v84 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v112, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v85 + 7);
    *(_DWORD *)id v79 = type;
    id v80 = SUSettingsUIStateToString([*((id *)v85 + 10) currentState]);
    id v3 = v80;
    char v4 = (id *)v85;
    uint64_t v81 = (uint64_t)v3;
    *((void *)v85 + 5) = v3;
    uint64_t v82 = [v4[10] currentState];
    id v83 = (id)[*((id *)v85 + 10) delegate];
    char v109 = 0;
    char v108 = 0;
    if (v83)
    {
      *((void *)v85 + 4) = (id)[*((id *)v85 + 10) delegate];
      int v76 = 1;
      char v109 = 1;
      id v5 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v5);
      *((void *)v85 + 2) = v6;
      char v108 = 1;
      id v77 = (__CFString *)v6;
    }
    else
    {
      id v77 = @"(null)";
    }
    id v70 = v77;
    id v71 = (id)[*((id *)v85 + 10) delegate];
    id v72 = (id)[*((id *)v85 + 10) scanError];
    id v73 = (id)[*((id *)v85 + 10) preferredStatefulDescriptor];
    id v74 = (id)[*((id *)v85 + 10) alternateStatefulDescriptor];
    id v75 = (id)[*((id *)v85 + 10) currentDownload];
    char v106 = 0;
    char v104 = 0;
    char v102 = 0;
    if (v75)
    {
      id v7 = (id)[*((id *)v85 + 10) currentDownload];
      *(void *)uint64_t v85 = v7;
      int v68 = 1;
      char v106 = 1;
      id v105 = (id)[v7 descriptor];
      char v104 = 1;
      id v103 = (id)[v105 humanReadableUpdateName];
      char v102 = 1;
      BOOL v69 = (__CFString *)v103;
    }
    else
    {
      BOOL v69 = @"(null)";
    }
    int v54 = v69;
    id v55 = (id)[*((id *)v85 + 10) currentDownload];
    char v8 = [*((id *)v85 + 10) performThirdPartyScan];
    id v61 = "NO";
    uint64_t v9 = "YES";
    id v62 = "YES";
    int v66 = 1;
    if ((v8 & 1) == 0) {
      uint64_t v9 = "NO";
    }
    int v56 = v9;
    char v10 = [*((id *)v85 + 10) isTargetedUpdateScheduledForAutoInstall];
    uint64_t v11 = (uint64_t)v62;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v61;
    }
    uint64_t v57 = v11;
    char v12 = [*((id *)v85 + 10) hidingPreferredDescriptor];
    uint64_t v13 = (uint64_t)v62;
    if ((v12 & 1) == 0) {
      uint64_t v13 = (uint64_t)v61;
    }
    uint64_t v58 = v13;
    id v59 = (id)[*(id *)(*((void *)v85 + 10) + 256) humanReadableUpdateName];
    id v60 = v59;
    id v101 = v60;
    char v14 = [*((id *)v85 + 10) hidingAlternateDescriptor];
    uint64_t v15 = (uint64_t)v62;
    if ((v14 & 1) == 0) {
      uint64_t v15 = (uint64_t)v61;
    }
    uint64_t v63 = v15;
    id v64 = (id)[*(id *)(*((void *)v85 + 10) + 264) humanReadableUpdateName];
    id v65 = v64;
    id v100 = v65;
    id v67 = (id)[*((id *)v85 + 10) enrolledBetaProgram];
    char v98 = 0;
    if (v67)
    {
      id v99 = (id)[*((id *)v85 + 10) enrolledBetaProgram];
      char v98 = 1;
      uint64_t v53 = [v99 programID];
    }
    else
    {
      uint64_t v53 = 0;
    }
    uint64_t v42 = v53;
    id v52 = (id)[*((id *)v85 + 10) betaPrograms];
    uint64_t v43 = [v52 count];
    id v51 = (id)[*((id *)v85 + 10) currentFullScanOperation];
    id v50 = (id)[*((id *)v85 + 10) currentRefreshScanOperation];
    id v49 = (id)[*((id *)v85 + 10) currentUpdateOperation];
    id v48 = (id)[*((id *)v85 + 10) auxiliaryOperations];
    uint64_t v44 = [v48 count];
    id v47 = (id)[*((id *)v85 + 8) error];
    id v45 = &v26;
    buf = v117;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v117, (uint64_t)v86, v81, v82, (uint64_t)v70, (uint64_t)v71, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, v57, v58, (uint64_t)v60, v63, (uint64_t)v65, v53, v43,
      (uint64_t)v51,
      (uint64_t)v50,
      (uint64_t)v49,
      v44,
      (uint64_t)v47);
    _os_log_impl(&dword_228401000, log, v79[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a full-scan with error: %{public}@",
      buf,
      0xE8u);

    if (v98) {
    if (v102)
    }

    if (v104) {
    if (v106)
    }

    if (v108) {
    if (v109)
    }

    id obj = 0;
    objc_storeStrong(&v100, 0);
    objc_storeStrong(&v101, obj);
    objc_storeStrong(&v110, obj);
  }
  objc_storeStrong(&v112, 0);
  id v16 = (id)[*((id *)v85 + 8) error];
  uint64_t v17 = *((void *)v85 + 10);
  char v18 = *(void **)(v17 + 96);
  *(void *)(v17 + 96) = v16;

  id v39 = (id)[*(id *)(*((void *)v85 + 10) + 96) domain];
  char v19 = [v39 isEqualToString:*MEMORY[0x263F78360]];
  BOOL v40 = 0;
  if (v19) {
    BOOL v40 = [*(id *)(*((void *)v85 + 10) + 96) code] == 26;
  }
  BOOL v38 = v40;

  if (!v38) {
    goto LABEL_48;
  }
  unsigned __int8 v97 = 0;
  BOOL v96 = 0;
  unsigned __int8 v20 = [*((id *)v85 + 8) retries];
  BOOL v21 = __OFSUB__(v20, 1);
  unsigned __int8 v97 = v20 - 1;
  BOOL v115 = v21 || v20 - 1 != (v20 - 1);
  BOOL v96 = v115;
  int v37 = v115 ? 0 : v97;
  [*((id *)v85 + 8) setRetries:v37];
  char v22 = [*((id *)v85 + 8) retries];
  char v24 = v23 | (v22 == 0);
  if (v24)
  {
LABEL_48:
    [*(id *)(*((void *)v85 + 10) + 216) postEvent:@"CheckingForUpdatesFailed" withInfo:*((void *)v85 + 8)];
    int v87 = 0;
  }
  else
  {
    id v36 = (id)[*((id *)v85 + 10) log];
    osos_log_t log = (os_log_t)(id)[v36 oslog];

    os_log_type_t v94 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v33 = oslog;
      *(_DWORD *)id v34 = v94;
      unsigned __int8 v25 = [*((id *)v85 + 8) retries];
      char v35 = v116;
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v116, (uint64_t)v86, v25 + 1);
      _os_log_impl(&dword_228401000, v33, v34[0], "%s: The scan failed but got %u retries left. Performing a retry.", v35, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    dispatch_time_t when = dispatch_time(0, 1000000000 * kSUSettingsStatefulUIRetryDelay);
    dispatch_queue_t queue = (dispatch_queue_t)(id)[*((id *)v85 + 10) workQueue];
    dispatch_block_t block = &v88;
    uint64_t v88 = MEMORY[0x263EF8330];
    int v89 = -1073741824;
    int v90 = 0;
    id v91 = __52__SUSettingsStatefulUIManager_handleFailedFullScan___block_invoke;
    id v92 = &unk_26483BAB8;
    int v31 = (id *)v93;
    v93[0] = *((id *)v85 + 8);
    char v30 = (id *)((char *)block + 40);
    v93[1] = *((id *)v85 + 10);
    dispatch_after(when, queue, block);

    int v87 = 1;
    id v32 = 0;
    objc_storeStrong(v30, 0);
    objc_storeStrong(v31, v32);
  }
  objc_storeStrong(location, 0);
}

uint64_t __52__SUSettingsStatefulUIManager_handleFailedFullScan___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) performFullScan:*(void *)(a1 + 32)];
}

- (void)handleRefreshScanResults:(id)a3
{
  uint64_t v63 = "-[SUSettingsStatefulUIManager handleRefreshScanResults:]";
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v89 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v87 = (id)[location[0] refreshScanResults];
  id v62 = (id)[v89 log];
  osos_log_t log = (os_log_t)(id)[v62 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)uint64_t v57 = type;
    id v58 = SUSettingsUIStateToString([v89 currentState]);
    id v59 = v58;
    id v84 = v59;
    uint64_t v60 = [v89 currentState];
    id v61 = (id)[v89 delegate];
    char v82 = 0;
    char v80 = 0;
    if (v61)
    {
      id v83 = (id)[v89 delegate];
      int v54 = 1;
      char v82 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v81 = NSStringFromClass(v3);
      char v80 = 1;
      id v55 = (__CFString *)v81;
    }
    else
    {
      id v55 = @"(null)";
    }
    id v48 = v55;
    id v49 = (id)[v89 delegate];
    id v50 = (id)[v89 scanError];
    id v51 = (id)[v89 preferredStatefulDescriptor];
    id v52 = (id)[v89 alternateStatefulDescriptor];
    id v53 = (id)[v89 currentDownload];
    char v78 = 0;
    char v76 = 0;
    char v74 = 0;
    if (v53)
    {
      id v79 = (id)[v89 currentDownload];
      int v46 = 1;
      char v78 = 1;
      id v77 = (id)[v79 descriptor];
      char v76 = 1;
      id v75 = (id)[v77 humanReadableUpdateName];
      char v74 = 1;
      id v47 = (__CFString *)v75;
    }
    else
    {
      id v47 = @"(null)";
    }
    id v32 = v47;
    id v33 = (id)[v89 currentDownload];
    char v4 = [v89 performThirdPartyScan];
    id v39 = "NO";
    id v5 = "YES";
    BOOL v40 = "YES";
    int v44 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    id v34 = v5;
    char v6 = [v89 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v40;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v39;
    }
    uint64_t v35 = v7;
    char v8 = [v89 hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v40;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v39;
    }
    uint64_t v36 = v9;
    id v37 = (id)[*((id *)v89 + 32) humanReadableUpdateName];
    id v38 = v37;
    id v73 = v38;
    char v10 = [v89 hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v40;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v39;
    }
    uint64_t v41 = v11;
    id v42 = (id)[*((id *)v89 + 33) humanReadableUpdateName];
    id v43 = v42;
    id v72 = v43;
    id v45 = (id)[v89 enrolledBetaProgram];
    char v70 = 0;
    if (v45)
    {
      id v71 = (id)[v89 enrolledBetaProgram];
      char v70 = 1;
      uint64_t v31 = [v71 programID];
    }
    else
    {
      uint64_t v31 = 0;
    }
    uint64_t v20 = v31;
    id v30 = (id)[v89 betaPrograms];
    uint64_t v21 = [v30 count];
    id v29 = (id)[v89 currentFullScanOperation];
    id v28 = (id)[v89 currentRefreshScanOperation];
    id v27 = (id)[v89 currentUpdateOperation];
    id v26 = (id)[v89 auxiliaryOperations];
    uint64_t v22 = [v26 count];
    id v25 = (id)[v87 scanUUID];
    char v23 = &v12;
    buf = v90;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v90, (uint64_t)v63, (uint64_t)v59, v60, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, v35, v36, (uint64_t)v38, v41, (uint64_t)v43, v31, v21,
      (uint64_t)v29,
      (uint64_t)v28,
      (uint64_t)v27,
      v22,
      (uint64_t)v25,
      (uint64_t)v87);
    _os_log_impl(&dword_228401000, log, v57[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to refresh the current scan results with ID: %{public}@.\n"
      "Results: %{public}@",
      buf,
      0xF2u);

    if (v70) {
    if (v74)
    }

    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    id obj = 0;
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, obj);
    objc_storeStrong(&v84, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v14 = (id)*((void *)v89 + 28);
  uint64_t v13 = &v64;
  uint64_t v64 = MEMORY[0x263EF8330];
  int v65 = -1073741824;
  int v66 = 0;
  id v67 = __56__SUSettingsStatefulUIManager_handleRefreshScanResults___block_invoke;
  int v68 = &unk_26483BD38;
  id v16 = (id *)v69;
  v69[0] = v89;
  uint64_t v15 = (id *)(v13 + 5);
  uint64_t v17 = location;
  v69[1] = location[0];
  [v14 isScanning:v13];
  id v18 = 0;
  objc_storeStrong(v15, 0);
  objc_storeStrong(v16, v18);
  objc_storeStrong(&v87, v18);
  objc_storeStrong(v17, v18);
}

void __56__SUSettingsStatefulUIManager_handleRefreshScanResults___block_invoke(NSObject *a1, char a2, id obj)
{
  id v58 = a1;
  uint64_t v57 = "-[SUSettingsStatefulUIManager handleRefreshScanResults:]_block_invoke";
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v79 = a1;
  char v78 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = v58;
  id v56 = (id)[(objc_class *)v58[4].isa log];
  oslog[0] = (os_log_t)(id)[v56 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v51 = type;
    id v52 = SUSettingsUIStateToString([(objc_class *)v58[4].isa currentState]);
    id v53 = v52;
    id v74 = v53;
    uint64_t v54 = [(objc_class *)v58[4].isa currentState];
    id v55 = (id)[(objc_class *)v58[4].isa delegate];
    char v72 = 0;
    char v70 = 0;
    if (v55)
    {
      id v73 = (id)[(objc_class *)v58[4].isa delegate];
      int v48 = 1;
      char v72 = 1;
      id v3 = (objc_class *)objc_opt_class();
      id v71 = NSStringFromClass(v3);
      char v70 = 1;
      id v49 = (__CFString *)v71;
    }
    else
    {
      id v49 = @"(null)";
    }
    id v42 = v49;
    id v43 = (id)[(objc_class *)v58[4].isa delegate];
    id v44 = (id)[(objc_class *)v58[4].isa scanError];
    id v45 = (id)[(objc_class *)v58[4].isa preferredStatefulDescriptor];
    id v46 = (id)[(objc_class *)v58[4].isa alternateStatefulDescriptor];
    id v47 = (id)[(objc_class *)v58[4].isa currentDownload];
    char v68 = 0;
    char v66 = 0;
    char v64 = 0;
    if (v47)
    {
      id v69 = (id)[(objc_class *)v58[4].isa currentDownload];
      int v40 = 1;
      char v68 = 1;
      id v67 = (id)[v69 descriptor];
      char v66 = 1;
      id v65 = (id)[v67 humanReadableUpdateName];
      char v64 = 1;
      uint64_t v41 = (__CFString *)v65;
    }
    else
    {
      uint64_t v41 = @"(null)";
    }
    id v26 = v41;
    id v27 = (id)[(objc_class *)v58[4].isa currentDownload];
    char v4 = [(objc_class *)v58[4].isa performThirdPartyScan];
    id v33 = "NO";
    id v5 = "YES";
    id v34 = "YES";
    int v38 = 1;
    if ((v4 & 1) == 0) {
      id v5 = "NO";
    }
    id v28 = v5;
    char v6 = [(objc_class *)v58[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v34;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v33;
    }
    uint64_t v29 = v7;
    char v8 = [(objc_class *)v58[4].isa hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v34;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v33;
    }
    uint64_t v30 = v9;
    id v31 = (id)[*((id *)v58[4].isa + 32) humanReadableUpdateName];
    id v32 = v31;
    id v63 = v32;
    char v10 = [(objc_class *)v58[4].isa hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v34;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v33;
    }
    uint64_t v35 = v11;
    id v36 = (id)[*((id *)v58[4].isa + 33) humanReadableUpdateName];
    id v37 = v36;
    id v62 = v37;
    id v39 = (id)[(objc_class *)v58[4].isa enrolledBetaProgram];
    char v60 = 0;
    if (v39)
    {
      id v61 = (id)[(objc_class *)v58[4].isa enrolledBetaProgram];
      char v60 = 1;
      uint64_t v25 = [v61 programID];
    }
    else
    {
      uint64_t v25 = 0;
    }
    uint64_t v16 = v25;
    id v24 = (id)[(objc_class *)v58[4].isa betaPrograms];
    uint64_t v17 = [v24 count];
    id v23 = (id)[(objc_class *)v58[4].isa currentFullScanOperation];
    id v22 = (id)[(objc_class *)v58[4].isa currentRefreshScanOperation];
    id v21 = (id)[(objc_class *)v58[4].isa currentUpdateOperation];
    id v20 = (id)[(objc_class *)v58[4].isa auxiliaryOperations];
    uint64_t v12 = [v20 count];
    if (v78) {
      uint64_t v13 = "YES";
    }
    else {
      uint64_t v13 = "NO";
    }
    id v18 = &v14;
    buf = v80;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66((uint64_t)v80, (uint64_t)v57, (uint64_t)v53, v54, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28, v29, v30, (uint64_t)v32, v35, (uint64_t)v37, v16, v17,
      (uint64_t)v23,
      (uint64_t)v22,
      (uint64_t)v21,
      v12,
      (uint64_t)v13,
      (uint64_t)location);
    _os_log_impl(&dword_228401000, log, v51[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "isScanning: %s; error: %{public}@",
      buf,
      0xF2u);

    if (v60) {
    if (v64)
    }

    if (v66) {
    if (v68)
    }

    if (v70) {
    if (v72)
    }

    id obja = 0;
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v63, obja);
    objc_storeStrong(&v74, obja);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v78)
  {
    if ((unint64_t)[(objc_class *)v58[4].isa currentState] > 1) {
      [(objc_class *)v58[4].isa checkForUpdatesInBackground];
    }
    else {
      [(objc_class *)v58[4].isa checkForAvailableUpdates];
    }
    int v59 = 1;
  }
  else
  {
    [(objc_class *)v58[4].isa assignRefreshScanResults:v58[5].isa];
    if (*((void *)v58[4].isa + 10) || *((void *)v58[4].isa + 11))
    {
      [*((id *)v58[4].isa + 27) postEvent:@"UpdatesAvailable" withInfo:v58[5].isa];
    }
    else if ([(objc_class *)v58[5].isa refreshPreviousState] == 3)
    {
      [*((id *)v58[4].isa + 27) postEvent:@"NoUpdateAvailable" withInfo:v58[5].isa];
    }
    else
    {
      [*((id *)v58[4].isa + 27) postEvent:@"CheckForAvailableUpdate" withInfo:v58[5].isa];
    }
    int v59 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)assignRefreshScanResults:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)[location[0] refreshScanResults];
  char v13 = [(SUSettingsStatefulUIManager *)v16 assignScanRelatedMembersFromScanResults:v14];
  id v12 = [(SUSettingsStatefulUIManager *)v16 preferredStatefulDescriptor];
  id v11 = [(SUSettingsStatefulUIManager *)v16 alternateStatefulDescriptor];
  if (*(_OWORD *)&v16->_preferredStatefulDescriptor == 0)
  {
    if (!v16->_currentDownload)
    {
      objc_storeStrong((id *)&v16->_preferredStatefulDescriptor, 0);
      objc_storeStrong((id *)&v16->_alternateStatefulDescriptor, 0);
    }
  }
  else
  {
    [(SUSettingsStatefulUIManager *)v16 updateDescriptorsUsingScanResults:v14 andWithConcreteError:0];
  }
  char v10 = 0;
  if (v16->_preferredStatefulDescriptor == v12
    || (char v8 = 1, v16->_preferredStatefulDescriptor)
    && (char v8 = 1, [(SUSettingsStatefulDescriptor *)v16->_preferredStatefulDescriptor isEqual:v12]))
  {
    char v7 = 0;
    if (v16->_alternateStatefulDescriptor != v11)
    {
      LOBYTE(v6) = 1;
      if (v16->_alternateStatefulDescriptor) {
        int v6 = ![(SUSettingsStatefulDescriptor *)v16->_alternateStatefulDescriptor isEqual:v11];
      }
      char v7 = v6;
    }
    char v8 = v7;
  }
  char v10 = v8 & 1;
  id v5 = [(SUSettingsStatefulUIManager *)v16 log];
  osos_log_t log = (os_log_t)(id)[(SUCoreLog *)v5 oslog];

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_4_0((uint64_t)v17, (uint64_t)"-[SUSettingsStatefulUIManager assignRefreshScanResults:]", v13 & 1, v10 & 1);
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Refreshed results changes from previous data: changedScanRelatedData = %d, changedDescriptors: %d", v17, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v4 = 1;
  if ((v13 & 1) == 0) {
    char v4 = v10;
  }
  objc_msgSend(location[0], "setRefreshHasAnyChanges:", v4 & 1, location);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v3, 0);
}

- (BOOL)assignScanRelatedMembersFromScanResults:(id)a3
{
  uint64_t v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v33 = 0;
  uint64_t v25 = v35;
  objc_sync_enter(v25);
  agreementManager = v35->_agreementManager;
  char v31 = 0;
  id v23 = (SUSUIUpdateAgreementManager *)(id)[location[0] agreementManager];
  char v24 = 0;
  if (agreementManager != v23)
  {
    LOBYTE(v22) = 1;
    if (v35->_agreementManager)
    {
      id v32 = (id)[location[0] agreementManager];
      char v31 = 1;
      int v22 = [v32 isEqual:v35->_agreementManager] ^ 1;
    }
    char v24 = v22;
  }
  if (v31) {

  }
  if (v24)
  {
    id v3 = (SUSUIUpdateAgreementManager *)(id)[location[0] agreementManager];
    char v4 = v35->_agreementManager;
    v35->_agreementManager = v3;

    char v33 = 1;
  }
  int clearingSpaceForDownload = v35->_clearingSpaceForDownload;
  if (clearingSpaceForDownload != ([location[0] isClearingSpaceForDownload] & 1))
  {
    char v20 = [location[0] isClearingSpaceForDownload];
    v35->_int clearingSpaceForDownload = v20 & 1;
    char v33 = 1;
  }
  currentDownload = v35->_currentDownload;
  char v29 = 0;
  uint64_t v17 = (SUDownload *)(id)[location[0] currentDownload];
  char v18 = 0;
  if (currentDownload != v17)
  {
    LOBYTE(v16) = 1;
    if (v35->_currentDownload)
    {
      id v30 = (id)[location[0] currentDownload];
      char v29 = 1;
      int v16 = [v30 isEqual:v35->_currentDownload] ^ 1;
    }
    char v18 = v16;
  }
  if (v29) {

  }
  if (v18)
  {
    id v5 = (SUDownload *)(id)[location[0] currentDownload];
    int v6 = v35->_currentDownload;
    v35->_currentDownload = v5;

    char v33 = 1;
  }
  int isAutoUpdateScheduled = v35->_isAutoUpdateScheduled;
  if (isAutoUpdateScheduled != ([location[0] isAutoUpdateScheduled] & 1))
  {
    char v14 = [location[0] isAutoUpdateScheduled];
    v35->_int isAutoUpdateScheduled = v14 & 1;
    char v33 = 1;
  }
  currentAutoInstallOperation = v35->_currentAutoInstallOperation;
  char v27 = 0;
  id v11 = (SUAutoInstallOperation *)(id)[location[0] currentAutoInstallOperation];
  char v12 = 0;
  if (currentAutoInstallOperation != v11)
  {
    LOBYTE(v10) = 1;
    if (v35->_currentAutoInstallOperation)
    {
      id v28 = (id)[location[0] currentAutoInstallOperation];
      char v27 = 1;
      int v10 = [v28 isEqual:v35->_currentAutoInstallOperation] ^ 1;
    }
    char v12 = v10;
  }
  if (v27) {

  }
  if (v12)
  {
    if (v35->_currentAutoInstallOperation) {
      [(SUAutoInstallOperation *)v35->_currentAutoInstallOperation setDelegate:0];
    }
    char v7 = (SUAutoInstallOperation *)(id)[location[0] currentAutoInstallOperation];
    char v8 = v35->_currentAutoInstallOperation;
    v35->_currentAutoInstallOperation = v7;

    char v33 = 1;
    if (v35->_currentAutoInstallOperation) {
      [(SUAutoInstallOperation *)v35->_currentAutoInstallOperation setDelegate:v35];
    }
  }
  objc_sync_exit(v25);

  objc_storeStrong(location, 0);
  return v33 & 1;
}

- (void)clearPastScanResults
{
  id v2 = self;
  objc_sync_enter(v2);
  objc_storeStrong((id *)&self->_preferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_alternateStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_hiddenPreferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_hiddenAlternateStatefulDescriptor, 0);
  self->_hidingPreferredDescriptor = 0;
  self->_hidingAlternateDescriptor = 0;
  objc_sync_exit(v2);
}

- (id)createScanOperationOptions
{
  int v10 = self;
  v9[1] = (id)a2;
  v9[0] = -[SUSettingsScanOptions initWithScanOptions:]([SUSettingsScanOptions alloc], "initWithScanOptions:");
  id v5 = [(SUSettingsStatefulUIManager *)v10 options];
  BOOL v2 = [(SUSettingsStatefulUIOptions *)v5 allowUnrestrictedCellularDownload];
  [v9[0] setAllowUnrestrictedCellularDownload:v2];

  int v6 = [(SUSettingsStatefulUIManager *)v10 currentSeedingDevice];
  objc_msgSend(v9[0], "setCurrentSeedingDevice:");

  char v7 = [(SUSettingsStatefulUIManager *)v10 options];
  BOOL v3 = [(SUSettingsStatefulUIOptions *)v7 clientIsBuddy];
  [v9[0] setClientIsBuddy:v3];

  id v8 = v9[0];
  objc_storeStrong(v9, 0);
  return v8;
}

- (id)targetedUpdateForDownload:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  preferredStatefulDescriptor = v12->_preferredStatefulDescriptor;
  id v9 = (id)[location[0] descriptor];
  BOOL v10 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](preferredStatefulDescriptor, "isEqualToDescriptor:");

  if (v10)
  {
    char v13 = v12->_preferredStatefulDescriptor;
  }
  else
  {
    alternateStatefulDescriptor = v12->_alternateStatefulDescriptor;
    id v6 = (id)[location[0] descriptor];
    BOOL v7 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](alternateStatefulDescriptor, "isEqualToDescriptor:");

    if (v7) {
      char v13 = v12->_alternateStatefulDescriptor;
    }
    else {
      char v13 = 0;
    }
  }
  objc_storeStrong(location, 0);
  BOOL v3 = v13;
  return v3;
}

- (id)targetedUpdateMatchingDescriptor:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSettingsStatefulDescriptor *)v6->_preferredStatefulDescriptor isEqualToDescriptor:location[0]])
  {
    BOOL v7 = v6->_preferredStatefulDescriptor;
  }
  else if ([(SUSettingsStatefulDescriptor *)v6->_alternateStatefulDescriptor isEqualToDescriptor:location[0]])
  {
    BOOL v7 = v6->_alternateStatefulDescriptor;
  }
  else
  {
    BOOL v7 = 0;
  }
  objc_storeStrong(location, 0);
  BOOL v3 = v7;
  return v3;
}

- (void)beginUpdateOperationWithDescriptor:(id)a3 operationDelegate:(id)a4 delegateCallbackQueue:(id)a5 operationTypeBlock:(id)a6
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
  dispatch_queue_t queue = v24->_workQueue;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  char v13 = __125__SUSettingsStatefulUIManager_beginUpdateOperationWithDescriptor_operationDelegate_delegateCallbackQueue_operationTypeBlock___block_invoke;
  char v14 = &unk_26483BFB8;
  uint64_t v15 = v24;
  id v16 = location[0];
  id v19 = v20;
  id v17 = v22;
  id v18 = v21;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __125__SUSettingsStatefulUIManager_beginUpdateOperationWithDescriptor_operationDelegate_delegateCallbackQueue_operationTypeBlock___block_invoke(NSObject *a1)
{
  id v61 = a1;
  id v62 = "-[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operati"
        "onTypeBlock:]_block_invoke";
  uint64_t v81 = *MEMORY[0x263EF8340];
  os_log_t oslog[2] = a1;
  oslog[1] = a1;
  if (*((void *)a1[4].isa + 25))
  {
    id v60 = (id)[(objc_class *)v61[4].isa log];
    oslog[0] = (os_log_t)(id)[v60 oslog];

    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog[0];
      *(_DWORD *)id v55 = type;
      id v56 = SUSettingsUIStateToString([(objc_class *)v61[4].isa currentState]);
      id v57 = v56;
      id v77 = v57;
      uint64_t v58 = [(objc_class *)v61[4].isa currentState];
      id v59 = (id)[(objc_class *)v61[4].isa delegate];
      char v75 = 0;
      char v73 = 0;
      if (v59)
      {
        id v76 = (id)[(objc_class *)v61[4].isa delegate];
        int v52 = 1;
        char v75 = 1;
        uint64_t v1 = (objc_class *)objc_opt_class();
        id v74 = NSStringFromClass(v1);
        char v73 = 1;
        id v53 = (__CFString *)v74;
      }
      else
      {
        id v53 = @"(null)";
      }
      id v46 = v53;
      id v47 = (id)[(objc_class *)v61[4].isa delegate];
      id v48 = (id)[(objc_class *)v61[4].isa scanError];
      id v49 = (id)[(objc_class *)v61[4].isa preferredStatefulDescriptor];
      id v50 = (id)[(objc_class *)v61[4].isa alternateStatefulDescriptor];
      id v51 = (id)[(objc_class *)v61[4].isa currentDownload];
      char v71 = 0;
      char v69 = 0;
      char v67 = 0;
      if (v51)
      {
        id v72 = (id)[(objc_class *)v61[4].isa currentDownload];
        int v44 = 1;
        char v71 = 1;
        id v70 = (id)[v72 descriptor];
        char v69 = 1;
        id v68 = (id)[v70 humanReadableUpdateName];
        char v67 = 1;
        id v45 = (__CFString *)v68;
      }
      else
      {
        id v45 = @"(null)";
      }
      id v30 = v45;
      id v31 = (id)[(objc_class *)v61[4].isa currentDownload];
      char v2 = [(objc_class *)v61[4].isa performThirdPartyScan];
      id v37 = "NO";
      BOOL v3 = "YES";
      int v38 = "YES";
      int v42 = 1;
      if ((v2 & 1) == 0) {
        BOOL v3 = "NO";
      }
      id v32 = v3;
      char v4 = [(objc_class *)v61[4].isa isTargetedUpdateScheduledForAutoInstall];
      uint64_t v5 = (uint64_t)v38;
      if ((v4 & 1) == 0) {
        uint64_t v5 = (uint64_t)v37;
      }
      uint64_t v33 = v5;
      char v6 = [(objc_class *)v61[4].isa hidingPreferredDescriptor];
      uint64_t v7 = (uint64_t)v38;
      if ((v6 & 1) == 0) {
        uint64_t v7 = (uint64_t)v37;
      }
      uint64_t v34 = v7;
      id v35 = (id)[*((id *)v61[4].isa + 32) humanReadableUpdateName];
      id v36 = v35;
      id v66 = v36;
      char v8 = [(objc_class *)v61[4].isa hidingAlternateDescriptor];
      uint64_t v9 = (uint64_t)v38;
      if ((v8 & 1) == 0) {
        uint64_t v9 = (uint64_t)v37;
      }
      uint64_t v39 = v9;
      id v40 = (id)[*((id *)v61[4].isa + 33) humanReadableUpdateName];
      id v41 = v40;
      id location = v41;
      id v43 = (id)[(objc_class *)v61[4].isa enrolledBetaProgram];
      char v63 = 0;
      if (v43)
      {
        id v64 = (id)[(objc_class *)v61[4].isa enrolledBetaProgram];
        char v63 = 1;
        uint64_t v29 = [v64 programID];
      }
      else
      {
        uint64_t v29 = 0;
      }
      uint64_t v20 = v29;
      id v28 = (id)[(objc_class *)v61[4].isa betaPrograms];
      uint64_t v21 = [v28 count];
      id v27 = (id)[(objc_class *)v61[4].isa currentFullScanOperation];
      id v26 = (id)[(objc_class *)v61[4].isa currentRefreshScanOperation];
      id v25 = (id)[(objc_class *)v61[4].isa currentUpdateOperation];
      id v24 = (id)[(objc_class *)v61[4].isa auxiliaryOperations];
      uint64_t v10 = [v24 count];
      uint64_t isa = (uint64_t)v61[5].isa;
      id v22 = &v16;
      buf = v80;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v80, (uint64_t)v62, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
        (uint64_t)v27,
        (uint64_t)v26,
        (uint64_t)v25,
        v10,
        isa);
      _os_log_impl(&dword_228401000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "There is already an update process running. Ignoring request to update into: %{public}@",
        buf,
        0xE8u);

      if (v63) {
      if (v67)
      }

      if (v69) {
      if (v71)
      }

      if (v73) {
      if (v75)
      }

      id obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v66, obj);
      objc_storeStrong(&v77, obj);
    }
    objc_storeStrong((id *)oslog, 0);
    return (*((uint64_t (**)(void))v61[8].isa + 2))();
  }
  else
  {
    id v17 = [SUSettingsUpdateOperation alloc];
    id v18 = (id)[(objc_class *)v61[5].isa descriptor];
    uint64_t v13 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v17, "initWithDescriptor:usingSUManagerClient:delegate:");
    Class v14 = v61[4].isa;
    uint64_t v15 = (void *)*((void *)v14 + 25);
    *((void *)v14 + 25) = v13;

    [*((id *)v61[4].isa + 25) setDelegateCallbackQueue:v61[7].isa];
    [*((id *)v61[4].isa + 25) setCompletionQueue:*((void *)v61[4].isa + 21)];
    return (*((uint64_t (**)(void))v61[8].isa + 2))();
  }
}

- (void)updateStatePostDownloadOperation:(BOOL)a3 withDownload:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v8 = 0;
  objc_storeStrong(&v8, a6);
  [(SUSettingsStatefulUIManager *)v13 performPostUpdateOperationRefresh:v11 withDownload:location didScheduledUpdate:0 autoInstallOperation:0 error:v9 completionHandler:v8];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)performPostUpdateOperationRefresh:(BOOL)a3 withDownload:(id)a4 didScheduledUpdate:(BOOL)a5 autoInstallOperation:(id)a6 error:(id)a7 completionHandler:(id)a8
{
  BOOL v81 = a5;
  id obj = a6;
  id v83 = a7;
  id v84 = a8;
  char v80 = "-[SUSettingsStatefulUIManager performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOpera"
        "tion:error:completionHandler:]";
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v119 = self;
  SEL v118 = a2;
  BOOL v117 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v115 = v81;
  id v114 = 0;
  objc_storeStrong(&v114, obj);
  id v113 = 0;
  objc_storeStrong(&v113, v83);
  id v112 = 0;
  objc_storeStrong(&v112, v84);
  id v85 = (id)[MEMORY[0x263F08C38] UUID];
  id v111 = (id)[v85 UUIDString];

  id v79 = (id)[v119 log];
  osos_log_t log = (os_log_t)(id)[v79 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v74 = type;
    id v75 = SUSettingsUIStateToString([v119 currentState]);
    id v76 = v75;
    id v108 = v76;
    uint64_t v77 = [v119 currentState];
    id v78 = (id)[v119 delegate];
    char v106 = 0;
    char v104 = 0;
    if (v78)
    {
      id v107 = (id)[v119 delegate];
      int v71 = 1;
      char v106 = 1;
      id v8 = (objc_class *)objc_opt_class();
      id v105 = NSStringFromClass(v8);
      char v104 = 1;
      id v72 = (__CFString *)v105;
    }
    else
    {
      id v72 = @"(null)";
    }
    id v65 = v72;
    id v66 = (id)[v119 delegate];
    id v67 = (id)[v119 scanError];
    id v68 = (id)[v119 preferredStatefulDescriptor];
    id v69 = (id)[v119 alternateStatefulDescriptor];
    id v70 = (id)[v119 currentDownload];
    char v102 = 0;
    char v100 = 0;
    char v98 = 0;
    if (v70)
    {
      id v103 = (id)[v119 currentDownload];
      int v63 = 1;
      char v102 = 1;
      id v101 = (id)[v103 descriptor];
      char v100 = 1;
      id v99 = (id)[v101 humanReadableUpdateName];
      char v98 = 1;
      id v64 = (__CFString *)v99;
    }
    else
    {
      id v64 = @"(null)";
    }
    id v49 = v64;
    id v50 = (id)[v119 currentDownload];
    char v9 = [v119 performThirdPartyScan];
    id v56 = "NO";
    uint64_t v10 = "YES";
    id v57 = "YES";
    int v61 = 1;
    if ((v9 & 1) == 0) {
      uint64_t v10 = "NO";
    }
    id v51 = v10;
    char v11 = [v119 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v12 = (uint64_t)v57;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v56;
    }
    uint64_t v52 = v12;
    char v13 = [v119 hidingPreferredDescriptor];
    uint64_t v14 = (uint64_t)v57;
    if ((v13 & 1) == 0) {
      uint64_t v14 = (uint64_t)v56;
    }
    uint64_t v53 = v14;
    id v54 = (id)[*((id *)v119 + 32) humanReadableUpdateName];
    id v55 = v54;
    id v97 = v55;
    char v15 = [v119 hidingAlternateDescriptor];
    uint64_t v16 = (uint64_t)v57;
    if ((v15 & 1) == 0) {
      uint64_t v16 = (uint64_t)v56;
    }
    uint64_t v58 = v16;
    id v59 = (id)[*((id *)v119 + 33) humanReadableUpdateName];
    id v60 = v59;
    id v96 = v60;
    id v62 = (id)[v119 enrolledBetaProgram];
    char v94 = 0;
    if (v62)
    {
      id v95 = (id)[v119 enrolledBetaProgram];
      char v94 = 1;
      uint64_t v48 = [v95 programID];
    }
    else
    {
      uint64_t v48 = 0;
    }
    uint64_t v39 = v48;
    id v47 = (id)[v119 betaPrograms];
    uint64_t v40 = [v47 count];
    id v46 = (id)[v119 currentFullScanOperation];
    id v45 = (id)[v119 currentRefreshScanOperation];
    id v44 = (id)[v119 currentUpdateOperation];
    id v43 = (id)[v119 auxiliaryOperations];
    id v41 = &v20;
    buf = v120;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v120, (uint64_t)v80, (uint64_t)v76, v77, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, v52, v53, (uint64_t)v55, v58, (uint64_t)v60, v48, v40,
      (uint64_t)v46,
      (uint64_t)v45,
      (uint64_t)v44,
      [v43 count],
      (uint64_t)v111);
    _os_log_impl(&dword_228401000, log, v74[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning a post download refresh operation with scan ID: %{public}@",
      buf,
      0xE8u);

    if (v94) {
    if (v98)
    }

    if (v100) {
    if (v102)
    }

    if (v104) {
    if (v106)
    }

    id v38 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v38);
    objc_storeStrong(&v108, v38);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v17 = [SUSettingsScanOperation alloc];
  id v32 = &v111;
  id v18 = [(SUSettingsScanOperation *)v17 initWithUUID:v111 usingSUManagerClient:*((void *)v119 + 28) andBetaManager:*((void *)v119 + 29) withCompletionQueue:*((void *)v119 + 21)];
  id v31 = &v93;
  id v93 = v18;
  [*((id *)v119 + 26) addObject:v18];
  uint64_t v21 = (id *)&v86;
  uint64_t v86 = MEMORY[0x263EF8330];
  int v87 = -1073741824;
  int v88 = 0;
  id v89 = __142__SUSettingsStatefulUIManager_performPostUpdateOperationRefresh_withDownload_didScheduledUpdate_autoInstallOperation_error_completionHandler___block_invoke;
  int v90 = &unk_26483BFE0;
  id v30 = (id *)v91;
  v91[0] = v119;
  uint64_t v29 = v21 + 7;
  uint64_t v33 = &v112;
  v91[3] = v112;
  id v28 = v21 + 5;
  v91[1] = v93;
  id v27 = v21 + 6;
  uint64_t v34 = &v113;
  v91[2] = v113;
  uint64_t v19 = MEMORY[0x22A697370](v21);
  id v26 = (id *)&v92;
  uint64_t v92 = v19;
  id v22 = v93;
  id v25 = (id)[*((id *)v119 + 10) descriptor];
  id v24 = (id)[*((id *)v119 + 11) descriptor];
  id v23 = (id)[v119 createScanOperationOptions];
  p_id location = &location;
  id v35 = &v114;
  objc_msgSend(v22, "refreshScanResultsWithPreferredUpdate:alternateUpdate:options:previouslyDiscoveredDownload:previouslyDiscoveredAutoInstallOperation:encounteredError:completionHandler:", v25, v24, v92);

  id v37 = 0;
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, v37);
  objc_storeStrong(v28, v37);
  objc_storeStrong(v29, v37);
  objc_storeStrong(v30, v37);
  objc_storeStrong(v31, v37);
  objc_storeStrong(v32, v37);
  objc_storeStrong(v33, v37);
  objc_storeStrong(v34, v37);
  objc_storeStrong(v35, v37);
  objc_storeStrong(p_location, v37);
}

void __142__SUSettingsStatefulUIManager_performPostUpdateOperationRefresh_withDownload_didScheduledUpdate_autoInstallOperation_error_completionHandler___block_invoke(NSObject *a1, void *a2, void *a3)
{
  id v66 = a1;
  id obj = a3;
  id v64 = "-[SUSettingsStatefulUIManager performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOpera"
        "tion:error:completionHandler:]_block_invoke";
  uint64_t v88 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v85 = 0;
  objc_storeStrong(&v85, obj);
  oslog[1] = v66;
  id v63 = (id)[(objc_class *)v66[4].isa log];
  oslog[0] = (os_log_t)(id)[v63 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)uint64_t v58 = type;
    id v59 = SUSettingsUIStateToString([(objc_class *)v66[4].isa currentState]);
    id v60 = v59;
    id v82 = v60;
    uint64_t v61 = [(objc_class *)v66[4].isa currentState];
    id v62 = (id)[(objc_class *)v66[4].isa delegate];
    char v80 = 0;
    char v78 = 0;
    if (v62)
    {
      id v81 = (id)[(objc_class *)v66[4].isa delegate];
      int v55 = 1;
      char v80 = 1;
      BOOL v3 = (objc_class *)objc_opt_class();
      id v79 = NSStringFromClass(v3);
      char v78 = 1;
      id v56 = (__CFString *)v79;
    }
    else
    {
      id v56 = @"(null)";
    }
    id v49 = v56;
    id v50 = (id)[(objc_class *)v66[4].isa delegate];
    id v51 = (id)[(objc_class *)v66[4].isa scanError];
    id v52 = (id)[(objc_class *)v66[4].isa preferredStatefulDescriptor];
    id v53 = (id)[(objc_class *)v66[4].isa alternateStatefulDescriptor];
    id v54 = (id)[(objc_class *)v66[4].isa currentDownload];
    char v76 = 0;
    char v74 = 0;
    char v72 = 0;
    if (v54)
    {
      id v77 = (id)[(objc_class *)v66[4].isa currentDownload];
      int v47 = 1;
      char v76 = 1;
      id v75 = (id)[v77 descriptor];
      char v74 = 1;
      id v73 = (id)[v75 humanReadableUpdateName];
      char v72 = 1;
      uint64_t v48 = (__CFString *)v73;
    }
    else
    {
      uint64_t v48 = @"(null)";
    }
    uint64_t v33 = v48;
    id v34 = (id)[(objc_class *)v66[4].isa currentDownload];
    char v4 = [(objc_class *)v66[4].isa performThirdPartyScan];
    uint64_t v40 = "NO";
    uint64_t v5 = "YES";
    id v41 = "YES";
    int v45 = 1;
    if ((v4 & 1) == 0) {
      uint64_t v5 = "NO";
    }
    id v35 = v5;
    char v6 = [(objc_class *)v66[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v7 = (uint64_t)v41;
    if ((v6 & 1) == 0) {
      uint64_t v7 = (uint64_t)v40;
    }
    uint64_t v36 = v7;
    char v8 = [(objc_class *)v66[4].isa hidingPreferredDescriptor];
    uint64_t v9 = (uint64_t)v41;
    if ((v8 & 1) == 0) {
      uint64_t v9 = (uint64_t)v40;
    }
    uint64_t v37 = v9;
    id v38 = (id)[*((id *)v66[4].isa + 32) humanReadableUpdateName];
    id v39 = v38;
    id v71 = v39;
    char v10 = [(objc_class *)v66[4].isa hidingAlternateDescriptor];
    uint64_t v11 = (uint64_t)v41;
    if ((v10 & 1) == 0) {
      uint64_t v11 = (uint64_t)v40;
    }
    uint64_t v42 = v11;
    id v43 = (id)[*((id *)v66[4].isa + 33) humanReadableUpdateName];
    id v44 = v43;
    id v70 = v44;
    id v46 = (id)[(objc_class *)v66[4].isa enrolledBetaProgram];
    char v68 = 0;
    if (v46)
    {
      id v69 = (id)[(objc_class *)v66[4].isa enrolledBetaProgram];
      char v68 = 1;
      uint64_t v32 = [v69 programID];
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v23 = v32;
    id v31 = (id)[(objc_class *)v66[4].isa betaPrograms];
    uint64_t v24 = [v31 count];
    id v30 = (id)[(objc_class *)v66[4].isa currentFullScanOperation];
    id v29 = (id)[(objc_class *)v66[4].isa currentRefreshScanOperation];
    id v28 = (id)[(objc_class *)v66[4].isa currentUpdateOperation];
    id v27 = (id)[(objc_class *)v66[4].isa auxiliaryOperations];
    uint64_t v12 = [v27 count];
    if (v85) {
      char v13 = "failed";
    }
    else {
      char v13 = "completed successfully";
    }
    id v25 = &v18;
    buf = v87;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66_8_66((uint64_t)v87, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v23, v24,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v12,
      (uint64_t)v13,
      (uint64_t)v85,
      (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Post update request refresh operation %s with error: %{public}@; scan results: %{public}@",
      buf,
      0xFCu);

    if (v68) {
    if (v72)
    }

    if (v74) {
    if (v76)
    }

    if (v78) {
    if (v80)
    }

    id v22 = 0;
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, v22);
    objc_storeStrong(&v82, v22);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v85)
  {
    uint64_t v14 = (void (*)(void))*((void *)v66[7].isa + 2);
    int v21 = 1;
    v14();
    id v20 = (id)[(objc_class *)v66[4].isa auxiliaryOperations];
    [v20 removeObject:v66[5].isa];

    int v67 = v21;
  }
  else
  {
    id v15 = (id)[location[0] currentDownload];
    Class isa = v66[4].isa;
    id v17 = (void *)*((void *)isa + 13);
    *((void *)isa + 13) = v15;

    [(objc_class *)v66[4].isa updateDescriptorsUsingScanResults:location[0] andWithConcreteError:v66[6].isa];
    (*((void (**)(void))v66[7].isa + 2))();
    [*((id *)v66[4].isa + 26) removeObject:v66[5].isa];
    int v67 = 0;
  }
  id v19 = 0;
  objc_storeStrong(&v85, 0);
  objc_storeStrong(location, v19);
}

- (id)createUpdateOperationOptions
{
  char v8 = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(SUSettingsUpdateOptions);
  BOOL v2 = [(SUSettingsStatefulUIOptions *)v8->_options allowUnrestrictedCellularDownload];
  [v7[0] setAllowUnrestrictedCellularDownload:v2];
  BOOL v3 = [(SUSettingsStatefulUIOptions *)v8->_options clientIsBuddy];
  [v7[0] setClientIsBuddy:v3];
  BOOL v4 = [(SUSettingsStatefulUIOptions *)v8->_options bypassTermsAndConditions];
  [v7[0] setBypassTermsAndConditions:v4];
  [v7[0] setAgreementManager:v8->_agreementManager];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (void)hidePreferredUpdate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  id location[3] = (id)a2;
  id obj = self;
  objc_sync_enter(obj);
  if ([(SUSettingsStatefulUIOptions *)v12->_options shouldHideNonTargetedUpdatesPostUserSelection])
  {
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 log];
    id v8 = (id)[(SUCoreLog *)v3 oslog];

    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [(SUSettingsStatefulDescriptor *)v12->_preferredStatefulDescriptor humanReadableUpdateName];
      id v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager hidePreferredUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_228401000, (os_log_t)v8, v7, "%s: Hiding preferred update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_hiddenPreferredStatefulDescriptor, v12->_preferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_preferredStatefulDescriptor, v12->_alternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 1;
    v12->_hidingAlternateDescriptor = 0;
    int v9 = 0;
  }
  else
  {
    BOOL v4 = [(SUSettingsStatefulUIManager *)v12 log];
    location[0] = (id)[(SUCoreLog *)v4 oslog];

    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager hidePreferredUpdate]");
      _os_log_impl(&dword_228401000, (os_log_t)location[0], v10, "%s: A request to hide the preferred update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    int v9 = 1;
  }
  objc_sync_exit(obj);
}

- (void)hideAlternateUpdate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  id location[3] = (id)a2;
  id obj = self;
  objc_sync_enter(obj);
  if ([(SUSettingsStatefulUIOptions *)v12->_options shouldHideNonTargetedUpdatesPostUserSelection])
  {
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 log];
    id v8 = (id)[(SUCoreLog *)v3 oslog];

    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [(SUSettingsStatefulDescriptor *)v12->_alternateStatefulDescriptor humanReadableUpdateName];
      id v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager hideAlternateUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_228401000, (os_log_t)v8, v7, "%s: Hiding alternate update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_hiddenAlternateStatefulDescriptor, v12->_alternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 0;
    v12->_hidingAlternateDescriptor = 1;
    int v9 = 0;
  }
  else
  {
    BOOL v4 = [(SUSettingsStatefulUIManager *)v12 log];
    location[0] = (id)[(SUCoreLog *)v4 oslog];

    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager hideAlternateUpdate]");
      _os_log_impl(&dword_228401000, (os_log_t)location[0], v10, "%s: A request to hide the alternate update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    int v9 = 1;
  }
  objc_sync_exit(obj);
}

- (void)revealHiddenPreferredUpdate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  id location[3] = (id)a2;
  id obj = self;
  objc_sync_enter(obj);
  if ([(SUSettingsStatefulUIOptions *)v12->_options shouldHideNonTargetedUpdatesPostUserSelection])
  {
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 log];
    id v8 = (id)[(SUCoreLog *)v3 oslog];

    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [(SUSettingsStatefulDescriptor *)v12->_hiddenPreferredStatefulDescriptor humanReadableUpdateName];
      id v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenPreferredUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_228401000, (os_log_t)v8, v7, "%s: Revealing the previously hidden preferred update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, v12->_preferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_preferredStatefulDescriptor, v12->_hiddenPreferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_hiddenPreferredStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 0;
    int v9 = 0;
  }
  else
  {
    BOOL v4 = [(SUSettingsStatefulUIManager *)v12 log];
    location[0] = (id)[(SUCoreLog *)v4 oslog];

    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenPreferredUpdate]");
      _os_log_impl(&dword_228401000, (os_log_t)location[0], v10, "%s: A request to reveal the hidden preferred update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    int v9 = 1;
  }
  objc_sync_exit(obj);
}

- (void)revealHiddenAlteranteUpdate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  id location[3] = (id)a2;
  id obj = self;
  objc_sync_enter(obj);
  if ([(SUSettingsStatefulUIOptions *)v12->_options shouldHideNonTargetedUpdatesPostUserSelection])
  {
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 log];
    id v8 = (id)[(SUCoreLog *)v3 oslog];

    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [(SUSettingsStatefulDescriptor *)v12->_hiddenAlternateStatefulDescriptor humanReadableUpdateName];
      id v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenAlteranteUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_228401000, (os_log_t)v8, v7, "%s: Reveal the previously hidden alternate update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, v12->_hiddenAlternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_hiddenAlternateStatefulDescriptor, 0);
    v12->_hidingAlternateDescriptor = 0;
    int v9 = 0;
  }
  else
  {
    BOOL v4 = [(SUSettingsStatefulUIManager *)v12 log];
    location[0] = (id)[(SUCoreLog *)v4 oslog];

    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenAlteranteUpdate]");
      _os_log_impl(&dword_228401000, (os_log_t)location[0], v10, "%s: A request to reveal the hidden alternate update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    int v9 = 1;
  }
  objc_sync_exit(obj);
}

- (void)doEnrollInBetaUpdatesProgram:(id)a3 completionHandler:(id)a4
{
  id obj = a4;
  char v68 = "-[SUSettingsStatefulUIManager doEnrollInBetaUpdatesProgram:completionHandler:]";
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v93 = 0;
  objc_storeStrong(&v93, obj);
  id v67 = (id)[v95 log];
  osos_log_t log = (os_log_t)(id)[v67 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v62 = type;
    id v63 = SUSettingsUIStateToString([v95 currentState]);
    id v64 = v63;
    id v90 = v64;
    uint64_t v65 = [v95 currentState];
    id v66 = (id)[v95 delegate];
    char v88 = 0;
    char v86 = 0;
    if (v66)
    {
      id v89 = (id)[v95 delegate];
      int v59 = 1;
      char v88 = 1;
      BOOL v4 = (objc_class *)objc_opt_class();
      id v87 = NSStringFromClass(v4);
      char v86 = 1;
      id v60 = (__CFString *)v87;
    }
    else
    {
      id v60 = @"(null)";
    }
    id v53 = v60;
    id v54 = (id)[v95 delegate];
    id v55 = (id)[v95 scanError];
    id v56 = (id)[v95 preferredStatefulDescriptor];
    id v57 = (id)[v95 alternateStatefulDescriptor];
    id v58 = (id)[v95 currentDownload];
    char v84 = 0;
    char v82 = 0;
    char v80 = 0;
    if (v58)
    {
      id v85 = (id)[v95 currentDownload];
      int v51 = 1;
      char v84 = 1;
      id v83 = (id)[v85 descriptor];
      char v82 = 1;
      id v81 = (id)[v83 humanReadableUpdateName];
      char v80 = 1;
      id v52 = (__CFString *)v81;
    }
    else
    {
      id v52 = @"(null)";
    }
    uint64_t v37 = v52;
    id v38 = (id)[v95 currentDownload];
    char v5 = [v95 performThirdPartyScan];
    id v44 = "NO";
    id v6 = "YES";
    int v45 = "YES";
    int v49 = 1;
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    id v39 = v6;
    char v7 = [v95 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v8 = (uint64_t)v45;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v44;
    }
    uint64_t v40 = v8;
    char v9 = [v95 hidingPreferredDescriptor];
    uint64_t v10 = (uint64_t)v45;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v44;
    }
    uint64_t v41 = v10;
    id v42 = (id)[*((id *)v95 + 32) humanReadableUpdateName];
    id v43 = v42;
    id v79 = v43;
    char v11 = [v95 hidingAlternateDescriptor];
    uint64_t v12 = (uint64_t)v45;
    if ((v11 & 1) == 0) {
      uint64_t v12 = (uint64_t)v44;
    }
    uint64_t v46 = v12;
    id v47 = (id)[*((id *)v95 + 33) humanReadableUpdateName];
    id v48 = v47;
    id v78 = v48;
    id v50 = (id)[v95 enrolledBetaProgram];
    char v76 = 0;
    if (v50)
    {
      id v77 = (id)[v95 enrolledBetaProgram];
      char v76 = 1;
      uint64_t v36 = [v77 programID];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v26 = v36;
    id v35 = (id)[v95 betaPrograms];
    uint64_t v27 = [v35 count];
    id v34 = (id)[v95 currentFullScanOperation];
    id v33 = (id)[v95 currentRefreshScanOperation];
    id v32 = (id)[v95 currentUpdateOperation];
    id v31 = (id)[v95 auxiliaryOperations];
    uint64_t v28 = [v31 count];
    uint64_t v13 = [location[0] programID];
    id v29 = &v14;
    buf = v96;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v96, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v27,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v28,
      v13,
      (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Attempts to enroll in beta program: %ld (%p)",
      buf,
      0xF2u);

    if (v76) {
    if (v80)
    }

    if (v82) {
    if (v84)
    }

    if (v86) {
    if (v88)
    }

    id v25 = 0;
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v79, v25);
    objc_storeStrong(&v90, v25);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v18 = (id)[v95 seedingBetaManager];
  id v17 = (id)[v95 currentSeedingDevice];
  uint64_t v23 = location;
  id v15 = location[0];
  uint64_t v16 = &v70;
  uint64_t v70 = MEMORY[0x263EF8330];
  int v71 = -1073741824;
  int v72 = 0;
  id v73 = __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke;
  char v74 = &unk_26483C008;
  int v21 = (id *)v75;
  v75[0] = v95;
  id v20 = (id *)(v16 + 5);
  v75[1] = location[0];
  id v19 = (id *)(v16 + 6);
  id v22 = &v93;
  void v75[2] = v93;
  [v18 enrollDevice:v17 inBetaProgram:v15 completion:v16];

  id v24 = 0;
  objc_storeStrong(v19, 0);
  objc_storeStrong(v20, v24);
  objc_storeStrong(v21, v24);
  objc_storeStrong(v22, v24);
  objc_storeStrong(v23, v24);
}

void __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke(NSObject *a1, void *a2)
{
  id v73 = a1;
  int v72 = "-[SUSettingsStatefulUIManager doEnrollInBetaUpdatesProgram:completionHandler:]_block_invoke";
  uint64_t v107 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v73;
  id v71 = (id)[(objc_class *)v73[4].isa log];
  oslog[0] = (os_log_t)(id)[v71 oslog];

  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    *(_DWORD *)id v66 = type;
    id v67 = SUSettingsUIStateToString([(objc_class *)v73[4].isa currentState]);
    id v68 = v67;
    id v102 = v68;
    uint64_t v69 = [(objc_class *)v73[4].isa currentState];
    id v70 = (id)[(objc_class *)v73[4].isa delegate];
    char v100 = 0;
    char v98 = 0;
    if (v70)
    {
      id v101 = (id)[(objc_class *)v73[4].isa delegate];
      int v63 = 1;
      char v100 = 1;
      id v2 = (objc_class *)objc_opt_class();
      id v99 = NSStringFromClass(v2);
      char v98 = 1;
      id v64 = (__CFString *)v99;
    }
    else
    {
      id v64 = @"(null)";
    }
    id v57 = v64;
    id v58 = (id)[(objc_class *)v73[4].isa delegate];
    id v59 = (id)[(objc_class *)v73[4].isa scanError];
    id v60 = (id)[(objc_class *)v73[4].isa preferredStatefulDescriptor];
    id v61 = (id)[(objc_class *)v73[4].isa alternateStatefulDescriptor];
    id v62 = (id)[(objc_class *)v73[4].isa currentDownload];
    char v96 = 0;
    char v94 = 0;
    char v92 = 0;
    if (v62)
    {
      id v97 = (id)[(objc_class *)v73[4].isa currentDownload];
      int v55 = 1;
      char v96 = 1;
      id v95 = (id)[v97 descriptor];
      char v94 = 1;
      id v93 = (id)[v95 humanReadableUpdateName];
      char v92 = 1;
      id v56 = (__CFString *)v93;
    }
    else
    {
      id v56 = @"(null)";
    }
    uint64_t v41 = v56;
    id v42 = (id)[(objc_class *)v73[4].isa currentDownload];
    char v3 = [(objc_class *)v73[4].isa performThirdPartyScan];
    id v48 = "NO";
    BOOL v4 = "YES";
    int v49 = "YES";
    int v53 = 1;
    if ((v3 & 1) == 0) {
      BOOL v4 = "NO";
    }
    id v43 = v4;
    char v5 = [(objc_class *)v73[4].isa isTargetedUpdateScheduledForAutoInstall];
    uint64_t v6 = (uint64_t)v49;
    if ((v5 & 1) == 0) {
      uint64_t v6 = (uint64_t)v48;
    }
    uint64_t v44 = v6;
    char v7 = [(objc_class *)v73[4].isa hidingPreferredDescriptor];
    uint64_t v8 = (uint64_t)v49;
    if ((v7 & 1) == 0) {
      uint64_t v8 = (uint64_t)v48;
    }
    uint64_t v45 = v8;
    id v46 = (id)[*((id *)v73[4].isa + 32) humanReadableUpdateName];
    id v47 = v46;
    id v91 = v47;
    char v9 = [(objc_class *)v73[4].isa hidingAlternateDescriptor];
    uint64_t v10 = (uint64_t)v49;
    if ((v9 & 1) == 0) {
      uint64_t v10 = (uint64_t)v48;
    }
    uint64_t v50 = v10;
    id v51 = (id)[*((id *)v73[4].isa + 33) humanReadableUpdateName];
    id v52 = v51;
    id v90 = v52;
    id v54 = (id)[(objc_class *)v73[4].isa enrolledBetaProgram];
    char v88 = 0;
    if (v54)
    {
      id v89 = (id)[(objc_class *)v73[4].isa enrolledBetaProgram];
      char v88 = 1;
      uint64_t v40 = [v89 programID];
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v30 = v40;
    id v39 = (id)[(objc_class *)v73[4].isa betaPrograms];
    uint64_t v31 = [v39 count];
    id v38 = (id)[(objc_class *)v73[4].isa currentFullScanOperation];
    id v37 = (id)[(objc_class *)v73[4].isa currentRefreshScanOperation];
    id v36 = (id)[(objc_class *)v73[4].isa currentUpdateOperation];
    id v35 = (id)[(objc_class *)v73[4].isa auxiliaryOperations];
    uint64_t v32 = [v35 count];
    uint64_t v11 = [(objc_class *)v73[5].isa programID];
    uint64_t isa = (uint64_t)v73[5].isa;
    id v33 = &v13;
    buf = v106;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v106, (uint64_t)v72, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v31,
      (uint64_t)v38,
      (uint64_t)v37,
      (uint64_t)v36,
      v32,
      v11,
      isa,
      (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to enroll in beta program: %ld (%p); error: %{public}@",
      buf,
      0xFCu);

    if (v88) {
    if (v92)
    }

    if (v94) {
    if (v96)
    }

    if (v98) {
    if (v100)
    }

    id obj = 0;
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, obj);
    objc_storeStrong(&v102, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)v73[4].isa setEnrolledBetaProgram:v73[5].isa];
  [(objc_class *)v73[4].isa checkForAvailableUpdates];
  if (v73[6].isa)
  {
    id v24 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (dispatch_queue_t)(id)[v24 selectDelegateCallbackQueue:*((void *)v73[4].isa + 5)];
    dispatch_block_t block = &v80;
    uint64_t v80 = MEMORY[0x263EF8330];
    int v81 = -1073741824;
    int v82 = 0;
    id v83 = __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke_423;
    char v84 = &unk_26483BE50;
    uint64_t v27 = (id *)&v87;
    id v87 = v73[6].isa;
    uint64_t v26 = (id *)((char *)block + 32);
    id v85 = v73[5].isa;
    id v25 = (id *)((char *)block + 40);
    id v86 = location[0];
    dispatch_async(queue, block);

    id v28 = 0;
    objc_storeStrong(v25, 0);
    objc_storeStrong(v26, v28);
    objc_storeStrong(v27, v28);
  }
  Class v16 = v73[4].isa;
  uint64_t v14 = sel_statefulUIManager_didEnrollDevice_inBetaUpdatesProgram_withError_;
  id v15 = &v74;
  uint64_t v74 = MEMORY[0x263EF8330];
  int v75 = -1073741824;
  int v76 = 0;
  id v77 = __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke_2;
  id v78 = &unk_26483BB58;
  id v19 = (id *)v79;
  v79[0] = v73[4].isa;
  id v18 = (id *)(v15 + 5);
  v79[1] = v73[5].isa;
  id v17 = (id *)(v15 + 6);
  id v20 = location;
  void v79[2] = location[0];
  [(objc_class *)v16 executeOperationOnDelegate:v14 usingBlock:v15];
  id v21 = 0;
  objc_storeStrong(v17, 0);
  objc_storeStrong(v18, v21);
  objc_storeStrong(v19, v21);
  objc_storeStrong(v20, v21);
}

uint64_t __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke_423(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

void __78__SUSettingsStatefulUIManager_doEnrollInBetaUpdatesProgram_completionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[v2 currentSeedingDevice];
  objc_msgSend(v4, "statefulUIManager:didEnrollDevice:inBetaUpdatesProgram:withError:", v2);
}

- (void)handleScanFinishedRollbackApplied:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(SUSettingsStatefulUIManager *)v15 log];
  id v13 = (id)[(SUCoreLog *)v4 oslog];

  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[SUSettingsStatefulUIManager handleScanFinishedRollbackApplied:]");
    _os_log_impl(&dword_228401000, (os_log_t)v13, v12, "%s: Rollback applied. Attempts to ask to reboot the device.", v16, 0xCu);
  }
  objc_storeStrong(&v13, 0);
  dispatch_queue_t queue = v15->_delegateCallbackQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke;
  char v9 = &unk_26483BAB8;
  uint64_t v10 = v15;
  id v11 = location[0];
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 4);
  id v2 = a1[4];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_2;
  uint64_t v8 = &unk_26483C058;
  id v9 = a1[4];
  v10[0] = a1[5];
  objc_msgSend(WeakRetained, "statefulUIManager:requestRollbackRestartApprovalWithReplyHandler:", v2);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_2(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = a1;
  id v18 = a2;
  v17[1] = a1;
  id v6 = (id)[a1[4] log];
  v17[0] = (id)[v6 oslog];

  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v17[0];
    os_log_type_t type = v16;
    int v5 = SUSettingsUserInteractionResponseTypeToString((uint64_t)v18);
    id v15 = v5;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulUIManager handleScanFinishedRollbackApplied:]_block_invoke_2", (uint64_t)v15);
    _os_log_impl(&dword_228401000, log, type, "%s: User responded to the rollback reboot request: %{public}@", v20, 0x16u);

    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(v17, 0);
  dispatch_queue_t queue = *((void *)a1[4] + 21);
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_427;
  os_log_type_t v12 = &unk_26483C030;
  v14[1] = v18;
  id v13 = a1[4];
  v14[0] = a1[5];
  dispatch_async(queue, &v8);
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_427(void *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  if (a1[6])
  {
    [*(id *)(a1[4] + 216) postEvent:@"CheckingForUpdatesFailed" withInfo:a1[5]];
  }
  else
  {
    v2[0] = (id)[objc_alloc(MEMORY[0x263F3F800]) initWithReason:@"Reboot for rollback apply"];
    [v2[0] setRebootType:1];
    id v1 = objc_alloc_init(MEMORY[0x263F3F808]);
    [v1 shutdownWithOptions:v2[0]];
    objc_storeStrong(&v1, 0);
    objc_storeStrong(v2, 0);
  }
}

- (void)updateDescriptorsUsingScanResults:(id)a3 andWithConcreteError:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSettingsStatefulUIManager *)v7 hideNonTargetedUpdateDescriptors];
  [(SUSettingsStatefulDescriptor *)v7->_preferredStatefulDescriptor updateStateWithScanResults:location[0] andWithConcreteError:v5];
  [(SUSettingsStatefulDescriptor *)v7->_alternateStatefulDescriptor updateStateWithScanResults:location[0] andWithConcreteError:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)hideNonTargetedUpdateDescriptors
{
  if (self->_currentDownload)
  {
    uint64_t v8 = [(SUDownload *)self->_currentDownload downloadOptions];
    BOOL v9 = 0;
    if (([(SUDownloadOptions *)v8 isAutoDownload] & 1) == 0)
    {
      BOOL v9 = 0;
      if (!self->_hidingPreferredDescriptor) {
        BOOL v9 = !self->_hidingAlternateDescriptor;
      }
    }

    if (v9)
    {
      id v6 = [(SUDownload *)self->_currentDownload descriptor];
      id v5 = [(SUSettingsStatefulDescriptor *)self->_preferredStatefulDescriptor descriptor];
      char v7 = -[SUDescriptor isEqual:](v6, "isEqual:");

      if (v7)
      {
        [(SUSettingsStatefulUIManager *)self hideAlternateUpdate];
      }
      else
      {
        id v3 = [(SUDownload *)self->_currentDownload descriptor];
        id v2 = [(SUSettingsStatefulDescriptor *)self->_alternateStatefulDescriptor descriptor];
        char v4 = -[SUDescriptor isEqual:](v3, "isEqual:");

        if (v4) {
          [(SUSettingsStatefulUIManager *)self hidePreferredUpdate];
        }
      }
    }
  }
}

- (void)executeOperationOnDelegate:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v6 = [(SUSettingsStatefulUIManager *)v17 delegate];
  char v14 = 0;
  char v7 = 0;
  if (v6)
  {
    id v15 = [(SUSettingsStatefulUIManager *)v17 delegate];
    char v14 = 1;
    char v7 = objc_opt_respondsToSelector();
  }
  if (v14) {

  }
  if (v7)
  {
    id v5 = (id)[MEMORY[0x263F77D78] sharedCore];
    dispatch_queue_t queue = (id)[v5 selectDelegateCallbackQueue:v17->_delegateCallbackQueue];
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __69__SUSettingsStatefulUIManager_executeOperationOnDelegate_usingBlock___block_invoke;
    os_log_type_t v12 = &unk_26483BAE0;
    id v13 = location[0];
    dispatch_async(queue, &v8);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSettingsStatefulUIManager_executeOperationOnDelegate_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)setCurrentDownload:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = v27;
  objc_sync_enter(obj);
  if (location[0] != v27->_currentDownload || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = SUSettingsSharedLogger();
    id v25 = (id)[v11 oslog];

    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      char v23 = 0;
      char v21 = 0;
      char v19 = 0;
      if (v27->_currentDownload
        && (id v24 = [(SUDownload *)v27->_currentDownload descriptor],
            char v23 = 1,
            v24))
      {
        id v22 = [(SUDownload *)v27->_currentDownload descriptor];
        char v21 = 1;
        id v20 = (__CFString *)(id)[(SUDescriptor *)v22 humanReadableUpdateName];
        char v19 = 1;
        int v10 = v20;
      }
      else
      {
        int v10 = @"N/A";
      }
      uint64_t currentDownload = (uint64_t)v27->_currentDownload;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v3 = @"YES";
      if ((isKindOfClass & 1) == 0) {
        id v3 = @"NO";
      }
      uint64_t v7 = (uint64_t)v3;
      char v17 = 0;
      char v15 = 0;
      char v13 = 0;
      if (location[0]
        && (v18 = (id)[location[0] descriptor], char v17 = 1, v18))
      {
        id v16 = (id)[location[0] descriptor];
        char v15 = 1;
        char v14 = (__CFString *)(id)[v16 humanReadableUpdateName];
        char v13 = 1;
        id v6 = v14;
      }
      else
      {
        id v6 = @"N/A";
      }
      id v5 = location[0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v4 = @"YES";
      }
      else {
        char v4 = @"NO";
      }
      __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66((uint64_t)v28, (uint64_t)"-[SUSettingsStatefulUIManager setCurrentDownload:]", (uint64_t)v10, currentDownload, v7, (uint64_t)v6, (uint64_t)v5, (uint64_t)v4);
      _os_log_impl(&dword_228401000, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "%s: Replacing the current download object with a new one.\n\tCurrent: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n\tNew: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n", v28, 0x48u);
      if (v13) {

      }
      if (v15) {
      if (v17)
      }

      if (v19) {
      if (v21)
      }

      if (v23) {
    }
      }
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v27->_currentDownload, location[0]);
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (int64_t)convertFSMStateToUIState:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"Idle"])
  {
    int64_t v5 = 0;
  }
  else if ([location[0] isEqualToString:@"CheckingForAvailableUpdate"])
  {
    int64_t v5 = 1;
  }
  else if ([location[0] isEqualToString:@"ScanFailed"])
  {
    int64_t v5 = 2;
  }
  else if ([location[0] isEqualToString:@"NoUpdateFound"])
  {
    int64_t v5 = 3;
  }
  else if ([location[0] isEqualToString:@"UpdatesAvailable"])
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (void)assignDescriptorOfType:(unint64_t)a3 fromSearchResults:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v67 = self;
  SEL v66 = a2;
  unint64_t v65 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v65 < 2)
  {
    char v57 = 0;
    char v55 = 0;
    if (v65)
    {
      id v56 = [(SUSettingsStatefulUIManager *)v67 alternateStatefulDescriptor];
      char v55 = 1;
      id v4 = v56;
    }
    else
    {
      id v58 = [(SUSettingsStatefulUIManager *)v67 preferredStatefulDescriptor];
      char v57 = 1;
      id v4 = v58;
    }
    id v59 = v4;
    if (v55) {

    }
    if (v57) {
    char v52 = 0;
    }
    char v50 = 0;
    if (v65)
    {
      id v51 = (id)[location alternateDescriptor];
      char v50 = 1;
      id v5 = v51;
    }
    else
    {
      id v53 = (id)[location preferredDescriptor];
      char v52 = 1;
      id v5 = v53;
    }
    id v54 = v5;
    if (v50) {

    }
    if (v52) {
    if (v59 || v54)
    }
    {
      if ([v59 isEqualToDescriptor:v54])
      {
        id v35 = [(SUSettingsStatefulUIManager *)v67 log];
        osos_log_t log = (os_log_t)(id)[(SUCoreLog *)v35 oslog];

        os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = oslog;
          os_log_type_t v31 = v48;
          id v34 = SUSettingsDescriptorTypeToString(v65);
          uint64_t v26 = v34;
          id v47 = v26;
          id v33 = (id)[v59 humanReadableUpdateName];
          id v27 = v33;
          id v46 = v27;
          id v32 = (id)[v54 humanReadableUpdateName];
          id v28 = v32;
          id v45 = v28;
          BOOL v6 = [(SUSettingsStatefulUIManager *)v67 hidingPreferredDescriptor];
          uint64_t v7 = "YES";
          if (!v6) {
            uint64_t v7 = "NO";
          }
          uint64_t v29 = (uint64_t)v7;
          if ([(SUSettingsStatefulUIManager *)v67 hidingAlternateDescriptor]) {
            uint64_t v8 = "YES";
          }
          else {
            uint64_t v8 = "NO";
          }
          __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32((uint64_t)v69, (uint64_t)v26, (uint64_t)v27, (uint64_t)v59, (uint64_t)v28, (uint64_t)v54, v29, (uint64_t)v8);
          _os_log_impl(&dword_228401000, v30, v31, "%{public}@ descriptor assignment: the given descriptor is equal to the current stateful descriptor. Updating internal state instead of creation of an entirely new one.\n\tCurrent: %{public}@ (%p)\n\tNew: %{public}@ (%p)\n\tHiding: Preferred - %s; Alternate: %s",
            v69,
            0x48u);

          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong((id *)&v47, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        [(SUSettingsStatefulUIManager *)v67 hideNonTargetedUpdateDescriptors];
        [v59 updateStateWithScanResults:location andWithConcreteError:0];
        int v60 = 1;
      }
      else
      {
        id v25 = [(SUSettingsStatefulUIManager *)v67 log];
        os_log_t v44 = (os_log_t)(id)[(SUCoreLog *)v25 oslog];

        os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = v44;
          os_log_type_t v21 = v43;
          id v24 = SUSettingsDescriptorTypeToString(v65);
          id v16 = v24;
          id v42 = v16;
          id v23 = (id)[v59 humanReadableUpdateName];
          id v17 = v23;
          id v41 = v17;
          id v22 = (id)[v54 humanReadableUpdateName];
          id v18 = v22;
          id v40 = v18;
          BOOL v9 = [(SUSettingsStatefulUIManager *)v67 hidingPreferredDescriptor];
          int v10 = "YES";
          if (!v9) {
            int v10 = "NO";
          }
          uint64_t v19 = (uint64_t)v10;
          if ([(SUSettingsStatefulUIManager *)v67 hidingAlternateDescriptor]) {
            id v11 = "YES";
          }
          else {
            id v11 = "NO";
          }
          __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32((uint64_t)v68, (uint64_t)v16, (uint64_t)v17, (uint64_t)v59, (uint64_t)v18, (uint64_t)v54, v19, (uint64_t)v11);
          _os_log_impl(&dword_228401000, v20, v21, "%{public}@ descriptor assignment: Replacing the current descriptor with a new descriptor.\n\tCurrent: %{public}@ (%p)\n\tNew: %{public}@ (%p)\n\tHiding: Preferred - %s; Alternate: %s",
            v68,
            0x48u);

          objc_storeStrong(&v40, 0);
          objc_storeStrong(&v41, 0);
          objc_storeStrong((id *)&v42, 0);
        }
        objc_storeStrong((id *)&v44, 0);
        if (v65)
        {
          if (v54)
          {
            char v13 = [SUSettingsStatefulDescriptor alloc];
            id v14 = [(SUSettingsStatefulDescriptor *)v13 initForDescriptor:v65 fromScanResults:location managedBy:v67];
            -[SUSettingsStatefulUIManager setAlternateStatefulDescriptor:](v67, "setAlternateStatefulDescriptor:");
          }
          else
          {
            [(SUSettingsStatefulUIManager *)v67 setAlternateStatefulDescriptor:0];
          }
        }
        else if (v54)
        {
          os_log_type_t v12 = [SUSettingsStatefulDescriptor alloc];
          id v15 = [(SUSettingsStatefulDescriptor *)v12 initForDescriptor:v65 fromScanResults:location managedBy:v67];
          -[SUSettingsStatefulUIManager setPreferredStatefulDescriptor:](v67, "setPreferredStatefulDescriptor:");
        }
        else
        {
          [(SUSettingsStatefulUIManager *)v67 setPreferredStatefulDescriptor:0];
        }
        int v60 = 0;
      }
    }
    else
    {
      int v60 = 1;
    }
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v59, 0);
  }
  else
  {
    id v39 = [(SUSettingsStatefulUIManager *)v67 log];
    id v63 = (id)[(SUCoreLog *)v39 oslog];

    char v62 = 16;
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v63;
      os_log_type_t type = v62;
      id v38 = SUSettingsDescriptorTypeToString(v65);
      id v61 = v38;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v70, (uint64_t)"-[SUSettingsStatefulUIManager assignDescriptorOfType:fromSearchResults:]", (uint64_t)v61);
      _os_log_error_impl(&dword_228401000, log, type, "%s: Invalid descriptor type: %{public}@", v70, 0x16u);

      objc_storeStrong((id *)&v61, 0);
    }
    objc_storeStrong(&v63, 0);
    int v60 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)baseDomain
{
  id v3 = [NSString alloc];
  id v5 = (id)[MEMORY[0x263F77D78] sharedCore];
  id v4 = (id)[v5 commonDomain];
  BOOL v6 = (void *)[v3 initWithFormat:@"%@.susettings.fsm.manager", v4];

  return v6;
}

- (SUSettingsStatefulUIManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUSettingsStatefulUIManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegateCallbackQueue:(id)a3
{
}

- (SUSettingsStatefulUIOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (SUSettingsStatefulErrorContextProvider)errorContextProvider
{
  return self->_errorContextProvider;
}

- (void)setErrorContextProvider:(id)a3
{
}

- (SUSettingsSUPreferencesManager)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (SUSettingsStatefulDescriptor)preferredStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreferredStatefulDescriptor:(id)a3
{
}

- (SUSettingsStatefulDescriptor)alternateStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlternateStatefulDescriptor:(id)a3
{
}

- (NSError)scanError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setScanError:(id)a3
{
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (BOOL)isClearingSpaceForDownload
{
  return self->_clearingSpaceForDownload;
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  self->_int clearingSpaceForDownload = a3;
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
}

- (BOOL)isRollingBack
{
  return self->_rollingBack;
}

- (void)setRollingBack:(BOOL)a3
{
  self->_rollingBack = a3;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreLog)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)preferencesQueue
{
  return self->_preferencesQueue;
}

- (void)setPreferencesQueue:(id)a3
{
}

- (SUSettingsScanOperation)currentFullScanOperation
{
  return (SUSettingsScanOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrentFullScanOperation:(id)a3
{
}

- (SUSettingsScanOperation)currentRefreshScanOperation
{
  return (SUSettingsScanOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCurrentRefreshScanOperation:(id)a3
{
}

- (SUSettingsUpdateOperation)currentUpdateOperation
{
  return (SUSettingsUpdateOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCurrentUpdateOperation:(id)a3
{
}

- (NSMutableSet)auxiliaryOperations
{
  return self->_auxiliaryOperations;
}

- (void)setAuxiliaryOperations:(id)a3
{
}

- (BOOL)performThirdPartyScan
{
  return self->_performThirdPartyScan;
}

- (void)setPerformThirdPartyScan:(BOOL)a3
{
  self->_performThirdPartyScan = a3;
}

- (int)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (unsigned)originalWifiFlag
{
  return self->_originalWifiFlag;
}

- (void)setOriginalWifiFlag:(unsigned __int8)a3
{
  self->_originalWifiFlag = a3;
}

- (unsigned)originalCellFlag
{
  return self->_originalCellFlag;
}

- (void)setOriginalCellFlag:(unsigned __int8)a3
{
  self->_originalCellFlag = a3;
}

- (BOOL)connectedToPowerSource
{
  return self->_connectedToPowerSource;
}

- (void)setConnectedToPowerSource:(BOOL)a3
{
  self->_connectedToPowerSource = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (SUCoreFSM)managerFSM
{
  return self->_managerFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
}

- (SDBetaManager)seedingBetaManager
{
  return self->_seedingBetaManager;
}

- (SUSUIUpdateAgreementManager)agreementManager
{
  return self->_agreementManager;
}

- (void)setAgreementManager:(id)a3
{
}

- (BOOL)isAutoUpdateScheduled
{
  return self->_isAutoUpdateScheduled;
}

- (void)setIsAutoUpdateScheduled:(BOOL)a3
{
  self->_int isAutoUpdateScheduled = a3;
}

- (SUAutoInstallOperation)currentAutoInstallOperation
{
  return self->_currentAutoInstallOperation;
}

- (void)setCurrentAutoInstallOperation:(id)a3
{
}

- (SUSettingsStatefulDescriptor)hiddenPreferredStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHiddenPreferredStatefulDescriptor:(id)a3
{
}

- (SUSettingsStatefulDescriptor)hiddenAlternateStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHiddenAlternateStatefulDescriptor:(id)a3
{
}

- (BOOL)hidingPreferredDescriptor
{
  return self->_hidingPreferredDescriptor;
}

- (void)setHidingPreferredDescriptor:(BOOL)a3
{
  self->_hidingPreferredDescriptor = a3;
}

- (BOOL)hidingAlternateDescriptor
{
  return self->_hidingAlternateDescriptor;
}

- (void)setHidingAlternateDescriptor:(BOOL)a3
{
  self->_hidingAlternateDescriptor = a3;
}

- (unint64_t)mdmPathRestrictions
{
  return self->_mdmPathRestrictions;
}

- (void)setMdmPathRestrictions:(unint64_t)a3
{
  self->_mdmPathRestrictions = a3;
}

- (void)setDelayingUpdate:(BOOL)a3
{
  self->_delayingUpdate = a3;
}

- (void).cxx_destruct
{
}

@end