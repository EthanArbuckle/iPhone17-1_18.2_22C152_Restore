@interface SUCoreScan
+ (BOOL)isPreSUStagingEnabledForUpdate:(id)a3 policy:(id)a4 reason:(id *)a5;
+ (id)_generateStateTable;
+ (id)_phaseName:(int)a3;
- (BOOL)_decideAndProcessPSUSScanForPrimaryDescriptor:(id)a3 secondaryDescriptor:(id)a4 andError:(id)a5;
- (BOOL)_decideAndProcessSlowReleaseScan;
- (BOOL)_decideAndProcessSplomboScan;
- (BOOL)_shouldPerformAlternateScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)_shouldPerformPSUSScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)_shouldPerformSplomboScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)cancelingOperation;
- (BOOL)downloadDocumentation;
- (MAAsset)primaryUpdateAsset;
- (MAAsset)secondaryUpdateAsset;
- (NSString)alternateAssetAudienceUUID;
- (NSString)scanUUID;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_os_transaction)scanCancelTransaction;
- (OS_os_transaction)scanCheckTransaction;
- (OS_os_transaction)scanCollectTransaction;
- (OS_os_transaction)scanLocateTransaction;
- (OS_os_transaction)scanVerifyTransaction;
- (SUCoreDescriptor)activeDescriptor;
- (SUCoreDescriptor)psusPrimaryDescriptor;
- (SUCoreDescriptor)psusSecondaryDescriptor;
- (SUCoreFSM)scanFSM;
- (SUCoreMobileAsset)maDocumentationControl;
- (SUCorePolicy)originalScanPolicy;
- (SUCorePolicy)scanPolicy;
- (SUCoreScan)initWithUUID:(id)a3;
- (SUCoreScan)initWithUUID:(id)a3 withCompletionQueue:(id)a4;
- (SUCoreScanParam)interimScanResult;
- (id)_createEvent:(id)a3;
- (id)_operationName;
- (id)_simDescriptorAttributes;
- (id)cancelCompletion;
- (id)checkCompletion;
- (id)checkMajorMinorCompletion;
- (id)checkSlowReleaseCompletion;
- (id)collectCompletion;
- (id)description;
- (id)locateCompletion;
- (id)verifyCompletion;
- (int)_getPhaseAndPostEventAfterReachingScanPhase:(int)a3;
- (int)operation;
- (int)operationSPIType;
- (int)pendingMobileAssetRequests;
- (int)phase;
- (int64_t)_decrementMobileAssetPending:(id)a3;
- (int64_t)_determinePSUSAssets;
- (int64_t)_downloadCatalog:(id)a3 withIdentifier:(id)a4;
- (int64_t)a_SimCatalogDownloadSuccess:(id *)a3;
- (int64_t)a_SimQueryMetadataUpdateAvailable:(id *)a3;
- (int64_t)actionAfterAvailCancelSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionAfterFailCancelSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionAfterFailCheckCancelDone:(id)a3 error:(id *)a4;
- (int64_t)actionAlterDocDownloadConfig:(id *)a3;
- (int64_t)actionCancelDocCatalogDownload:(id *)a3;
- (int64_t)actionCancelDone:(id *)a3;
- (int64_t)actionCancelPSUSAssetsDetermination:(id *)a3;
- (int64_t)actionCancelRemoveFailed:(id)a3 error:(id *)a4;
- (int64_t)actionCancelSUCatalogDownload:(id *)a3;
- (int64_t)actionCancelSuccess:(id *)a3;
- (int64_t)actionCheckCancelDone:(id *)a3;
- (int64_t)actionDeterminePSUSAssets:(id *)a3;
- (int64_t)actionDownloadDocAsset:(id *)a3;
- (int64_t)actionDownloadDocCatalog:(id *)a3;
- (int64_t)actionDownloadSUCatalog:(id *)a3;
- (int64_t)actionQueryDocMetadata:(id *)a3;
- (int64_t)actionQuerySUMetadata:(id *)a3;
- (int64_t)actionRemoveDocAsset:(id *)a3;
- (int64_t)actionScanCompleteNoUpdate:(id *)a3;
- (int64_t)actionScanFailed:(id)a3 error:(id *)a4;
- (int64_t)actionScanSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)actionDecideNextScanStep:(id *)a3;
- (unint64_t)actionDeterminePSUSAssetsFailed:(id)a3 error:(id *)a4;
- (unint64_t)actionDeterminePSUSAssetsSuccess:(id)a3 error:(id *)a4;
- (unint64_t)actionScanComplete:(id *)a3;
- (void)_cancelCompleteWithError:(id)a3;
- (void)_cancelEndComplete:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5;
- (void)_checkEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8;
- (void)_checkMajorMinorEndComplete:(id)a3 scanPolicy:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10;
- (void)_checkSlowReleaseEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 alternatePrimary:(id)a7 alternateSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10;
- (void)_clearCurrentOperation;
- (void)_collectEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 error:(id)a6 clearingTransaction:(BOOL)a7;
- (void)_filterDocQueryResults:(id)a3;
- (void)_filterSUQueryResults:(id)a3;
- (void)_filterSUQueryResultsForSPITypeMajorMinorFromQuery:(id)a3;
- (void)_filterSUQueryResultsForSPITypeSingleFromQuery:(id)a3;
- (void)_incrementMobileAssetPending:(id)a3;
- (void)_invalidOperation:(id)a3;
- (void)_locateEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8;
- (void)_operationCompleting:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5;
- (void)_reportPSUSDetermineFinishedEvent:(id)a3 duration:(double)a4;
- (void)_reportPSUSDetermineStartedEvent;
- (void)_scanCompleteFoundPrimary:(id)a3 foundSecondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 clearingOperation:(BOOL)a9 error:(id)a10;
- (void)_trackInconsistentAnomalyAndUpdateInterimResult:(id)a3 reason:(id)a4;
- (void)_trackScanBegin:(id)a3;
- (void)_trackScanBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackScanEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_trackScanEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)_updateInterimScanResultForSlowReleaseWithPrimary:(id)a3 secondary:(id)a4 error:(id)a5;
- (void)_updateInterimScanResultForSplomboWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9;
- (void)_updateInterimScanResultWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9;
- (void)_verifyEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 primary:(id)a6 secondary:(id)a7 error:(id)a8 clearingTransaction:(BOOL)a9;
- (void)alterCurrentPolicy:(id)a3;
- (void)cancelCurrentScan:(id)a3;
- (void)checkForAvailableMajorMinorUpdatesWithPolicy:(id)a3 completion:(id)a4;
- (void)checkForAvailableSlowReleaseUpdatesWithPolicy:(id)a3 completion:(id)a4;
- (void)checkForAvailableUpdateWithPolicy:(id)a3 completion:(id)a4;
- (void)collectDocumentationMetadataWithPolicy:(id)a3 descriptor:(id)a4 downloadDocumentation:(BOOL)a5 completion:(id)a6;
- (void)locateAvailableUpdateWithPolicy:(id)a3 completion:(id)a4;
- (void)setActiveDescriptor:(id)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setCancelCompletion:(id)a3;
- (void)setCancelingOperation:(BOOL)a3;
- (void)setCheckCompletion:(id)a3;
- (void)setCheckMajorMinorCompletion:(id)a3;
- (void)setCheckSlowReleaseCompletion:(id)a3;
- (void)setCollectCompletion:(id)a3;
- (void)setDownloadDocumentation:(BOOL)a3;
- (void)setInterimScanResult:(id)a3;
- (void)setLocateCompletion:(id)a3;
- (void)setMaDocumentationControl:(id)a3;
- (void)setOperation:(int)a3;
- (void)setOperationSPIType:(int)a3;
- (void)setOriginalScanPolicy:(id)a3;
- (void)setPendingMobileAssetRequests:(int)a3;
- (void)setPhase:(int)a3;
- (void)setPrimaryUpdateAsset:(id)a3;
- (void)setPsusPrimaryDescriptor:(id)a3;
- (void)setPsusSecondaryDescriptor:(id)a3;
- (void)setScanCancelTransaction:(id)a3;
- (void)setScanCheckTransaction:(id)a3;
- (void)setScanCollectTransaction:(id)a3;
- (void)setScanLocateTransaction:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setScanVerifyTransaction:(id)a3;
- (void)setSecondaryUpdateAsset:(id)a3;
- (void)setVerifyCompletion:(id)a3;
- (void)verifyLatestAvailableWithPolicy:(id)a3 descriptor:(id)a4 completion:(id)a5;
@end

@implementation SUCoreScan

+ (id)_generateStateTable
{
  v192[9] = *MEMORY[0x263EF8340];
  v191[0] = @"Idle";
  v189[0] = @"DecideNextScanStep";
  uint64_t v187 = *MEMORY[0x263F77E28];
  uint64_t v2 = v187;
  v188 = @"DecideNextScanStep";
  v68 = [NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
  v190[0] = v68;
  v189[1] = @"CheckForAvailableUpdate";
  v185[0] = *MEMORY[0x263F78170];
  uint64_t v3 = v185[0];
  v185[1] = v2;
  v186[0] = @"DownloadingSUCatalog";
  v186[1] = @"DownloadSUCatalog";
  v67 = [NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:2];
  v190[1] = v67;
  v189[2] = @"VerifyLatestAvailable";
  v183[0] = v3;
  v183[1] = v2;
  v184[0] = @"DownloadingSUCatalog";
  v184[1] = @"DownloadSUCatalog";
  v66 = [NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:2];
  v190[2] = v66;
  v189[3] = @"CollectDocMetadata";
  v181[0] = v3;
  v181[1] = v2;
  v182[0] = @"DownloadingDocCatalog";
  v182[1] = @"DownloadDocCatalog";
  v65 = [NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:2];
  v190[3] = v65;
  v189[4] = @"DeterminePSUSAssets";
  v179[0] = v3;
  v179[1] = v2;
  v180[0] = @"DeterminingPSUSAssets";
  v180[1] = @"DeterminePSUSAssets";
  v64 = [NSDictionary dictionaryWithObjects:v180 forKeys:v179 count:2];
  v190[4] = v64;
  v189[5] = @"ScanComplete";
  uint64_t v177 = v2;
  v178 = @"ScanComplete";
  v63 = [NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
  v190[5] = v63;
  v62 = [NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:6];
  v192[0] = v62;
  v191[1] = @"DownloadingSUCatalog";
  v175[0] = @"CatalogDownloadSuccess";
  v173[0] = v3;
  v173[1] = v2;
  v174[0] = @"QueryingSUMetadata";
  v174[1] = @"QuerySUMetadata";
  v61 = [NSDictionary dictionaryWithObjects:v174 forKeys:v173 count:2];
  v176[0] = v61;
  v175[1] = @"CatalogDownloadFailed";
  v171[0] = v3;
  v171[1] = v2;
  v172[0] = @"Idle";
  v172[1] = @"ScanFailed";
  v60 = [NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:2];
  v176[1] = v60;
  v175[2] = @"AlterCurrentPolicy";
  uint64_t v169 = v2;
  uint64_t v170 = *MEMORY[0x263F78148];
  uint64_t v4 = v170;
  v59 = [NSDictionary dictionaryWithObjects:&v170 forKeys:&v169 count:1];
  v176[2] = v59;
  v175[3] = @"CancelCurrentScan";
  v167[0] = v3;
  v167[1] = v2;
  v168[0] = @"Canceling";
  v168[1] = @"CancelSUCatalogDownload";
  v58 = [NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
  v176[3] = v58;
  v57 = [NSDictionary dictionaryWithObjects:v176 forKeys:v175 count:4];
  v192[1] = v57;
  v191[2] = @"QueryingSUMetadata";
  v165[0] = @"QueryMetadataNoAssetFound";
  v163[0] = v3;
  v163[1] = v2;
  v164[0] = @"Idle";
  v164[1] = @"ScanCompleteNoUpdate";
  v56 = [NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:2];
  v166[0] = v56;
  v165[1] = @"QueryMetadataUpdateAvailable";
  v161[0] = v3;
  v161[1] = v2;
  v162[0] = @"Idle";
  v162[1] = @"ScanSuccess";
  v55 = [NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:2];
  v166[1] = v55;
  v165[2] = @"QueryMetadataFailed";
  v159[0] = v3;
  v159[1] = v2;
  v160[0] = @"Idle";
  v160[1] = @"ScanFailed";
  v54 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:2];
  v166[2] = v54;
  v165[3] = @"AlterCurrentPolicy";
  uint64_t v157 = v2;
  uint64_t v158 = v4;
  v53 = [NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
  v166[3] = v53;
  v165[4] = @"CancelCurrentScan";
  uint64_t v155 = v3;
  v156 = @"Canceling";
  v52 = [NSDictionary dictionaryWithObjects:&v156 forKeys:&v155 count:1];
  v166[4] = v52;
  v51 = [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:5];
  v192[2] = v51;
  v191[3] = @"DeterminingPSUSAssets";
  v153[0] = @"PSUSAssetsDetermineSuccess";
  v151[0] = v3;
  v151[1] = v2;
  v152[0] = @"Idle";
  v152[1] = @"DeterminePSUSAssetsSuccess";
  v50 = [NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:2];
  v154[0] = v50;
  v153[1] = @"PSUSAssetsDetermineFailed";
  v149[0] = v3;
  v149[1] = v2;
  v150[0] = @"Idle";
  v150[1] = @"DeterminePSUSAssetsFailed";
  v49 = [NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:2];
  v154[1] = v49;
  v153[2] = @"AlterCurrentPolicy";
  uint64_t v147 = v2;
  uint64_t v148 = v4;
  v48 = [NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
  v154[2] = v48;
  v153[3] = @"CancelCurrentScan";
  v145[0] = v3;
  v145[1] = v2;
  v146[0] = @"Canceling";
  v146[1] = @"CancelPSUSAssetsDetermination";
  v47 = [NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:2];
  v154[3] = v47;
  v46 = [NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:4];
  v192[3] = v46;
  v191[4] = @"DownloadingDocCatalog";
  v143[0] = @"CatalogDownloadSuccess";
  v141[0] = v3;
  v141[1] = v2;
  v142[0] = @"QueryingDocMetadata";
  v142[1] = @"QueryDocMetadata";
  v45 = [NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];
  v144[0] = v45;
  v143[1] = @"CatalogDownloadFailed";
  v139[0] = v3;
  v139[1] = v2;
  v140[0] = @"Idle";
  v140[1] = @"ScanFailed";
  v44 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:2];
  v144[1] = v44;
  v143[2] = @"AlterCurrentPolicy";
  uint64_t v137 = v2;
  uint64_t v138 = v4;
  v43 = [NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];
  v144[2] = v43;
  v143[3] = @"CancelCurrentScan";
  v135[0] = v3;
  v135[1] = v2;
  v136[0] = @"Canceling";
  v136[1] = @"CancelDocCatalogDownload";
  v42 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
  v144[3] = v42;
  v41 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:4];
  v192[4] = v41;
  v191[5] = @"QueryingDocMetadata";
  v133[0] = @"QueryMetadataNoAssetFound";
  v131[0] = v3;
  v131[1] = v2;
  v132[0] = @"Idle";
  v132[1] = @"ScanFailed";
  v40 = [NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2];
  v134[0] = v40;
  v133[1] = @"QueryMetadataSuccess";
  v129[0] = v3;
  v129[1] = v2;
  v130[0] = @"Idle";
  v130[1] = @"ScanSuccess";
  v39 = [NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:2];
  v134[1] = v39;
  v133[2] = @"QueryMetadataNeedDoc";
  v127[0] = v3;
  v127[1] = v2;
  v128[0] = @"DownloadingDocAsset";
  v128[1] = @"DownloadDocAsset";
  v38 = [NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:2];
  v134[2] = v38;
  v133[3] = @"QueryMetadataFailed";
  v125[0] = v3;
  v125[1] = v2;
  v126[0] = @"Idle";
  v126[1] = @"ScanFailed";
  v37 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];
  v134[3] = v37;
  v133[4] = @"AlterCurrentPolicy";
  uint64_t v123 = v2;
  uint64_t v124 = v4;
  v36 = [NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
  v134[4] = v36;
  v133[5] = @"CancelCurrentScan";
  uint64_t v121 = v3;
  v122 = @"Canceling";
  v35 = [NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
  v134[5] = v35;
  v34 = [NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:6];
  v192[5] = v34;
  v191[6] = @"DownloadingDocAsset";
  v119[0] = @"DocDownloadSuccess";
  v117[0] = v3;
  v117[1] = v2;
  v118[0] = @"Idle";
  v118[1] = @"ScanSuccess";
  v33 = [NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];
  v120[0] = v33;
  v119[1] = @"DocDownloadFailed";
  v115[0] = v3;
  v115[1] = v2;
  v116[0] = @"Idle";
  v116[1] = @"ScanFailed";
  v32 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
  v120[1] = v32;
  v119[2] = @"AlterCurrentPolicy";
  uint64_t v113 = v2;
  v114 = @"AlterDocDownloadConfig";
  v31 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  v120[2] = v31;
  v119[3] = @"CancelCurrentScan";
  v111[0] = v3;
  v111[1] = v2;
  v112[0] = @"Canceling";
  v112[1] = @"RemoveDocAsset";
  v30 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
  v120[3] = v30;
  v29 = [NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
  v192[6] = v29;
  v191[7] = @"Canceling";
  v109[0] = @"CatalogDownloadSuccess";
  uint64_t v107 = v2;
  v108 = @"CheckCancelDone";
  v28 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
  v110[0] = v28;
  v109[1] = @"CatalogDownloadFailed";
  uint64_t v105 = v2;
  v106 = @"AfterFailCheckCancelDone";
  v27 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
  v110[1] = v27;
  v109[2] = @"CatalogDownloadCancelSuccess";
  uint64_t v103 = v2;
  v104 = @"CheckCancelDone";
  v26 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
  v110[2] = v26;
  v109[3] = @"CatalogDownloadCancelFailed";
  uint64_t v101 = v2;
  v102 = @"AfterFailCheckCancelDone";
  v25 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
  v110[3] = v25;
  v109[4] = @"PSUSAssetsDetermineSuccess";
  uint64_t v99 = v2;
  v100 = @"CheckCancelDone";
  v24 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
  v110[4] = v24;
  v109[5] = @"PSUSAssetsDetermineFailed";
  uint64_t v97 = v2;
  v98 = @"AfterFailCheckCancelDone";
  v23 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
  v110[5] = v23;
  v109[6] = @"PSUSAssetsDetermineCancelSuccess";
  uint64_t v95 = v2;
  v96 = @"CheckCancelDone";
  v22 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
  v110[6] = v22;
  v109[7] = @"PSUSAssetsDetermineCancelFailed";
  uint64_t v93 = v2;
  v94 = @"AfterFailCheckCancelDone";
  v21 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
  v110[7] = v21;
  v109[8] = @"QueryMetadataNoAssetFound";
  v91[0] = v3;
  v91[1] = v2;
  v92[0] = @"Idle";
  v92[1] = @"CancelSuccess";
  v20 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
  v110[8] = v20;
  v109[9] = @"QueryMetadataUpdateAvailable";
  v89[0] = v3;
  v89[1] = v2;
  v90[0] = @"Idle";
  v90[1] = @"AfterAvailCancelSuccess";
  v18 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  v110[9] = v18;
  v109[10] = @"QueryMetadataNeedDoc";
  v87[0] = v3;
  v87[1] = v2;
  v88[0] = @"Idle";
  v88[1] = @"CancelSuccess";
  v17 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  v110[10] = v17;
  v109[11] = @"QueryMetadataSuccess";
  v85[0] = v3;
  v85[1] = v2;
  v86[0] = @"Idle";
  v86[1] = @"CancelSuccess";
  v16 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
  v110[11] = v16;
  v109[12] = @"QueryMetadataFailed";
  v83[0] = v3;
  v83[1] = v2;
  v84[0] = @"Idle";
  v84[1] = @"AfterFailCancelSuccess";
  v5 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
  v110[12] = v5;
  v109[13] = @"DocDownloadSuccess";
  uint64_t v81 = v2;
  v82 = @"CheckCancelDone";
  v6 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  v110[13] = v6;
  v109[14] = @"DocDownloadFailed";
  uint64_t v79 = v2;
  v80 = @"AfterFailCheckCancelDone";
  v7 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v110[14] = v7;
  v109[15] = @"DocRemoveSuccess";
  uint64_t v77 = v2;
  v78 = @"CheckCancelDone";
  v8 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v110[15] = v8;
  v109[16] = @"DocRemoveFailed";
  uint64_t v75 = v2;
  v76 = @"AfterFailCheckCancelDone";
  v9 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
  v110[16] = v9;
  v109[17] = @"CancelComplete";
  v73[0] = v3;
  v73[1] = v2;
  v74[0] = @"Idle";
  v74[1] = @"CancelDone";
  v10 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
  v110[17] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:18];
  v192[7] = v11;
  v191[8] = *MEMORY[0x263F78158];
  uint64_t v71 = *MEMORY[0x263F78150];
  uint64_t v69 = v3;
  uint64_t v70 = *MEMORY[0x263F78160];
  v12 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  v72 = v12;
  v13 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v192[8] = v13;
  v19 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:9];

  v14 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v19 copyItems:1];

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  v13 = [(SUCoreScan *)self scanFSM];
  v14 = [v13 extendedStateQueue];
  dispatch_assert_queue_V2(v14);

  if ([v11 isEqualToString:*MEMORY[0x263F78148]])
  {
    int64_t v15 = 0;
  }
  else
  {
    if ([v11 isEqualToString:@"DecideNextScanStep"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDecideNextScanStep:a8];
    }
    else if ([v11 isEqualToString:@"DownloadSUCatalog"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDownloadSUCatalog:a8];
    }
    else if ([v11 isEqualToString:@"QuerySUMetadata"])
    {
      int64_t v16 = [(SUCoreScan *)self actionQuerySUMetadata:a8];
    }
    else if ([v11 isEqualToString:@"DeterminePSUSAssets"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDeterminePSUSAssets:a8];
    }
    else if ([v11 isEqualToString:@"DownloadDocCatalog"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDownloadDocCatalog:a8];
    }
    else if ([v11 isEqualToString:@"QueryDocMetadata"])
    {
      int64_t v16 = [(SUCoreScan *)self actionQueryDocMetadata:a8];
    }
    else if ([v11 isEqualToString:@"DownloadDocAsset"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDownloadDocAsset:a8];
    }
    else if ([v11 isEqualToString:@"AlterDocDownloadConfig"])
    {
      int64_t v16 = [(SUCoreScan *)self actionAlterDocDownloadConfig:a8];
    }
    else if ([v11 isEqualToString:@"RemoveDocAsset"])
    {
      int64_t v16 = [(SUCoreScan *)self actionRemoveDocAsset:a8];
    }
    else if ([v11 isEqualToString:@"ScanCompleteNoUpdate"])
    {
      int64_t v16 = [(SUCoreScan *)self actionScanCompleteNoUpdate:a8];
    }
    else if ([v11 isEqualToString:@"ScanSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self actionScanSuccess:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ScanFailed"])
    {
      int64_t v16 = [(SUCoreScan *)self actionScanFailed:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"DeterminePSUSAssetsSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDeterminePSUSAssetsSuccess:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"DeterminePSUSAssetsFailed"])
    {
      int64_t v16 = [(SUCoreScan *)self actionDeterminePSUSAssetsFailed:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"ScanComplete"])
    {
      int64_t v16 = [(SUCoreScan *)self actionScanComplete:a8];
    }
    else if ([v11 isEqualToString:@"CancelSUCatalogDownload"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelSUCatalogDownload:a8];
    }
    else if ([v11 isEqualToString:@"CancelDocCatalogDownload"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelDocCatalogDownload:a8];
    }
    else if ([v11 isEqualToString:@"CancelSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelSuccess:a8];
    }
    else if ([v11 isEqualToString:@"AfterAvailCancelSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self actionAfterAvailCancelSuccess:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"AfterFailCancelSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self actionAfterFailCancelSuccess:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CancelRemoveFailed"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelRemoveFailed:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CheckCancelDone"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCheckCancelDone:a8];
    }
    else if ([v11 isEqualToString:@"AfterFailCheckCancelDone"])
    {
      int64_t v16 = [(SUCoreScan *)self actionAfterFailCheckCancelDone:v12 error:a8];
    }
    else if ([v11 isEqualToString:@"CancelDone"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelDone:a8];
    }
    else if ([v11 isEqualToString:@"CancelPSUSAssetsDetermination"])
    {
      int64_t v16 = [(SUCoreScan *)self actionCancelPSUSAssetsDetermination:a8];
    }
    else if ([v11 isEqualToString:@"SimCatalogDownloadSuccess"])
    {
      int64_t v16 = [(SUCoreScan *)self a_SimCatalogDownloadSuccess:a8];
    }
    else if ([v11 isEqualToString:@"SimQueryMetadataUpdateAvailable"])
    {
      int64_t v16 = [(SUCoreScan *)self a_SimQueryMetadataUpdateAvailable:a8];
    }
    else
    {
      int64_t v16 = [(SUCoreScan *)self actionUnknownAction:v11 error:a8];
    }
    int64_t v15 = v16;
  }

  return v15;
}

- (int64_t)actionDeterminePSUSAssets:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  return [(SUCoreScan *)self _determinePSUSAssets];
}

- (int64_t)actionDownloadSUCatalog:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(SUCoreScan *)self scanPolicy];
  v7 = [v6 softwareUpdateAssetType];
  int64_t v8 = [(SUCoreScan *)self _downloadCatalog:v7 withIdentifier:@"su"];

  return v8;
}

- (int64_t)actionQuerySUMetadata:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self _decrementMobileAssetPending:@"DownloadSUCatalog"];
  v7 = [(SUCoreScan *)self alternateAssetAudienceUUID];

  if (v7)
  {
    int64_t v8 = [(SUCoreScan *)self alternateAssetAudienceUUID];
    v9 = [MEMORY[0x263F77DE8] sharedLogger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v8;
      id v11 = "%{public}@ SU metadata query using alternateAssetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v12 = [(SUCoreScan *)self scanPolicy];
  v13 = [v12 assetAudienceUUID];

  if (v13)
  {
    v14 = [(SUCoreScan *)self scanPolicy];
    int64_t v8 = [v14 assetAudienceUUID];

    int64_t v15 = [MEMORY[0x263F77DE8] sharedLogger];
    v10 = [v15 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v8;
      id v11 = "%{public}@ SU metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  int64_t v8 = 0;
LABEL_9:
  int64_t v16 = [(SUCoreScan *)self scanPolicy];
  v17 = [v16 constructSoftwareUpdateMAAssetQueryWithPurpose:v8];

  [(SUCoreScan *)self _incrementMobileAssetPending:@"QuerySUMetadata"];
  if (v17)
  {
    [(SUCoreScan *)self _trackScanBegin:@"queryMetaDataWithError" withIdentifier:@"su"];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __36__SUCoreScan_actionQuerySUMetadata___block_invoke;
    v27[3] = &unk_2640DCC30;
    v27[4] = self;
    id v28 = v17;
    objc_msgSend(v28, "SUCoreBorder_queryMetaDataWithError:", v27);
  }
  else
  {
    id v18 = [NSString alloc];
    v19 = [(SUCoreScan *)self scanPolicy];
    v20 = [v19 summary];
    v21 = (void *)[v18 initWithFormat:@"failed to construct SU asset query from policy[%@]", v20];

    v22 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v6 = 8100;
    v23 = [v22 buildError:8100 underlying:0 description:v21];

    v24 = [(SUCoreScan *)self scanFSM];
    v25 = [[SUCoreScanParam alloc] initWithResult:8100 withError:v23];
    [v24 postEvent:@"QueryMetadataFailed" withInfo:v25];
  }
  return v6;
}

void __36__SUCoreScan_actionQuerySUMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", @"queryMetaDataWithError", @"su", a2);
  if (a2)
  {
    v5 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v6 = [v5 buildError:8401 underlying:v9 description:@"failed to query SU metadata"];

    v7 = [*(id *)(a1 + 32) scanFSM];
    int64_t v8 = [[SUCoreScanParam alloc] initWithResult:a2 withError:v6];
    [v7 postEvent:@"QueryMetadataFailed" withInfo:v8];
  }
  else
  {
    [*(id *)(a1 + 32) _filterSUQueryResults:*(void *)(a1 + 40)];
  }
}

- (unint64_t)actionDeterminePSUSAssetsSuccess:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = [(SUCoreScan *)self _decrementMobileAssetPending:@"DeterminePSUSAssets succeeded"];
  id v9 = [v5 additionalInfo];

  v10 = [v9 safeObjectForKey:@"PSUSDetermineError" ofClass:objc_opt_class()];
  if (!v10)
  {
    id v11 = [v9 safeObjectForKey:@"PSUSAssetsSizes" ofClass:objc_opt_class()];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 safeULLForKey:@"STAGE_GROUP_REQUIRED" defaultValue:0];
      uint64_t v14 = [v12 safeULLForKey:@"STAGE_GROUP_OPTIONAL" defaultValue:0];
      int64_t v15 = [(SUCoreScan *)self psusPrimaryDescriptor];
      [v15 setPreSUStagingRequiredSize:v13];

      int64_t v16 = [(SUCoreScan *)self psusPrimaryDescriptor];
      [v16 setPreSUStagingOptionalSize:v14];

      v17 = [(SUCoreScan *)self psusSecondaryDescriptor];
      [v17 setPreSUStagingRequiredSize:v13];

      id v18 = [(SUCoreScan *)self psusSecondaryDescriptor];
      [v18 setPreSUStagingOptionalSize:v14];
    }
    else
    {
      id v18 = [(SUCoreScan *)self scanFSM];
      v19 = [v18 diag];
      v20 = (void *)[[NSString alloc] initWithFormat:@"%@ unexpected no assets sizes", self];
      [v19 trackAnomaly:@"[SCAN] DETERMINE_PSUS_SUCCESS" forReason:v20 withResult:8117 withError:0];
    }
  }
  v21 = [v9 safeObjectForKey:@"Duration" ofClass:objc_opt_class()];
  [v21 doubleValue];
  double v23 = v22;

  [(SUCoreScan *)self _reportPSUSDetermineFinishedEvent:v10 duration:v23];
  [(SUCoreScan *)self setPsusPrimaryDescriptor:0];
  [(SUCoreScan *)self setPsusSecondaryDescriptor:0];
  v24 = [(SUCoreScan *)self scanFSM];
  [v24 followupEvent:@"DecideNextScanStep"];

  return v8;
}

- (unint64_t)actionDeterminePSUSAssetsFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = [(SUCoreScan *)self _decrementMobileAssetPending:@"DeterminePSUSAssets failed"];
  [(SUCoreScan *)self setInterimScanResult:v5];
  id v9 = [v5 error];
  v10 = [v5 additionalInfo];

  id v11 = [v10 safeObjectForKey:@"Duration" ofClass:objc_opt_class()];
  [v11 doubleValue];
  double v13 = v12;

  [(SUCoreScan *)self _reportPSUSDetermineFinishedEvent:v9 duration:v13];
  [(SUCoreScan *)self setPsusPrimaryDescriptor:0];
  [(SUCoreScan *)self setPsusSecondaryDescriptor:0];
  uint64_t v14 = [(SUCoreScan *)self scanFSM];
  [v14 followupEvent:@"DecideNextScanStep"];

  return v8;
}

- (unint64_t)actionScanComplete:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  if ([(SUCoreScan *)self operation] != 1)
  {
    int64_t v6 = [(SUCoreScan *)self scanFSM];
    v7 = [v6 diag];
    unint64_t v8 = [NSString stringWithFormat:@"%@ invalid operation (%d) detected", self, -[SUCoreScan operation](self, "operation")];
    unint64_t v13 = 8117;
    [v7 trackAnomaly:@"[SCAN] COMPLETE" forReason:v8 withResult:8117 withError:0];
    goto LABEL_12;
  }
  int64_t v6 = [(SUCoreScan *)self interimScanResult];
  v7 = [(SUCoreScan *)self scanPolicy];
  if ([(SUCoreScan *)self operationSPIType] == 1)
  {
    unint64_t v8 = [(SUCoreScan *)self checkCompletion];
    [(SUCoreScan *)self setCheckCompletion:0];
    id v9 = [(SUCoreScan *)self scanPolicy];
    v10 = [v6 descriptor];
    id v11 = [v6 fallbackDescriptor];
    double v12 = [v6 error];
    [(SUCoreScan *)self _checkEndComplete:v8 scanPolicy:v9 primary:v10 secondary:v11 error:v12 clearingTransaction:1];
  }
  else
  {
    if ([(SUCoreScan *)self operationSPIType] == 2)
    {
      unint64_t v8 = [(SUCoreScan *)self checkMajorMinorCompletion];
      [(SUCoreScan *)self setCheckMajorMinorCompletion:0];
      id v9 = [v6 majorPrimaryDescriptor];
      v10 = [v6 majorSecondaryDescriptor];
      id v11 = [v6 minorPrimaryDescriptor];
      double v12 = [v6 minorSecondaryDescriptor];
      uint64_t v14 = [v6 error];
      LOBYTE(v16) = 1;
      [(SUCoreScan *)self _checkMajorMinorEndComplete:v8 scanPolicy:v7 majorPrimary:v9 majorSecondary:v10 minorPrimary:v11 minorSecondary:v12 error:v14 clearingTransaction:v16];
    }
    else
    {
      if ([(SUCoreScan *)self operationSPIType] != 3)
      {
        unint64_t v8 = [(SUCoreScan *)self scanFSM];
        id v9 = [v8 diag];
        v10 = (void *)[[NSString alloc] initWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
        unint64_t v13 = 8117;
        [v9 trackAnomaly:@"[SCAN] COMPLETE" forReason:v10 withResult:8117 withError:0];
        goto LABEL_11;
      }
      unint64_t v8 = [(SUCoreScan *)self checkSlowReleaseCompletion];
      [(SUCoreScan *)self setCheckSlowReleaseCompletion:0];
      id v9 = [v6 majorPrimaryDescriptor];
      v10 = [v6 majorSecondaryDescriptor];
      id v11 = [v6 minorPrimaryDescriptor];
      double v12 = [v6 minorSecondaryDescriptor];
      uint64_t v14 = [v6 error];
      LOBYTE(v16) = 1;
      [(SUCoreScan *)self _checkSlowReleaseEndComplete:v8 scanPolicy:v7 primary:v9 secondary:v10 alternatePrimary:v11 alternateSecondary:v12 error:v14 clearingTransaction:v16];
    }
  }
  unint64_t v13 = 0;
LABEL_11:

LABEL_12:
  if (![(SUCoreScan *)self cancelingOperation]) {
    [(SUCoreScan *)self _clearCurrentOperation];
  }
  return v13;
}

- (int)_getPhaseAndPostEventAfterReachingScanPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  int64_t v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[SUCoreScan _phaseName:v3];
    *(_DWORD *)buf = 138543618;
    v40 = self;
    __int16 v41 = 2114;
    v42 = v7;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ DecideNextScanStep: reached phase = %{public}@", buf, 0x16u);
  }
  unint64_t v8 = @"CheckForAvailableUpdate";
  uint64_t v9 = 1;
  switch((int)v3)
  {
    case 0:
      goto LABEL_36;
    case 1:
      if (![(SUCoreScan *)self _decideAndProcessSplomboScan]) {
        goto LABEL_6;
      }
      uint64_t v9 = 2;
      goto LABEL_36;
    case 2:
LABEL_6:
      if (![(SUCoreScan *)self _decideAndProcessSlowReleaseScan]) {
        goto LABEL_8;
      }
      uint64_t v9 = 3;
      goto LABEL_36;
    case 3:
LABEL_8:
      if ([(SUCoreScan *)self operationSPIType] == 1)
      {
        v10 = [(SUCoreScan *)self interimScanResult];
        id v11 = [v10 descriptor];

        double v12 = [(SUCoreScan *)self interimScanResult];
        uint64_t v13 = [v12 fallbackDescriptor];
LABEL_14:
        uint64_t v16 = (void *)v13;

        goto LABEL_15;
      }
      if ([(SUCoreScan *)self operationSPIType] == 2
        || [(SUCoreScan *)self operationSPIType] == 3)
      {
        int64_t v15 = [(SUCoreScan *)self interimScanResult];
        id v11 = [v15 majorPrimaryDescriptor];

        double v12 = [(SUCoreScan *)self interimScanResult];
        uint64_t v13 = [v12 majorSecondaryDescriptor];
        goto LABEL_14;
      }
      id v11 = 0;
      uint64_t v16 = 0;
LABEL_15:
      v17 = [(SUCoreScan *)self interimScanResult];
      id v18 = [v17 error];

      BOOL v19 = [(SUCoreScan *)self _decideAndProcessPSUSScanForPrimaryDescriptor:v11 secondaryDescriptor:v16 andError:v18];
      if (v19) {
        unint64_t v8 = @"DeterminePSUSAssets";
      }
      else {
        unint64_t v8 = 0;
      }
      if (v19) {
        int v14 = 3;
      }
      else {
        int v14 = 4;
      }

LABEL_22:
      if (v14 == 4)
      {
        if ([(SUCoreScan *)self operationSPIType] == 2
          || [(SUCoreScan *)self operationSPIType] == 3)
        {
          v20 = [(SUCoreScan *)self interimScanResult];
          v21 = [v20 minorPrimaryDescriptor];

          double v22 = [(SUCoreScan *)self interimScanResult];
          double v23 = [v22 minorSecondaryDescriptor];
        }
        else
        {
          v21 = 0;
          double v23 = 0;
        }
        v24 = [(SUCoreScan *)self interimScanResult];
        v25 = [v24 error];

        if ([(SUCoreScan *)self _decideAndProcessPSUSScanForPrimaryDescriptor:v21 secondaryDescriptor:v23 andError:v25])
        {
          unint64_t v8 = @"DeterminePSUSAssets";
          int v14 = 4;
        }
        else
        {
          int v14 = 5;
        }
      }
      if (v14 == 5)
      {
        unint64_t v8 = @"ScanComplete";
        uint64_t v9 = 6;
        goto LABEL_36;
      }
      if (v14 >= 6)
      {
        v26 = [(SUCoreScan *)self scanFSM];
        v27 = [v26 diag];
        id v28 = [NSString stringWithFormat:@"%@ invalid phase detected", self];
        [v27 trackAnomaly:@"[SCAN_GET_NEXT_PHASE]" forReason:v28 withResult:8117 withError:0];

        uint64_t v9 = 0;
        unint64_t v8 = 0;
        v29 = 0;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v9 = (v14 + 1);
      if (v8)
      {
LABEL_36:
        v30 = [SUCoreScanParam alloc];
        __int16 v31 = NSString;
        v32 = +[SUCoreScan _phaseName:v3];
        uint64_t v33 = +[SUCoreScan _phaseName:v9];
        v34 = [v31 stringWithFormat:@"DecideNextScanStep: reached phase = %@, next (reached) phase = %@", v32, v33];
        v29 = [(SUCoreScanParam *)v30 initWithNote:v34];

        v26 = [(SUCoreScan *)self scanFSM];
        [v26 followupEvent:v8 withInfo:v29];
        goto LABEL_37;
      }
      v29 = 0;
LABEL_38:
      v35 = [MEMORY[0x263F77DE8] sharedLogger];
      v36 = [v35 oslog];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = +[SUCoreScan _phaseName:v9];
        *(_DWORD *)buf = 138543874;
        v40 = self;
        __int16 v41 = 2114;
        v42 = v37;
        __int16 v43 = 2114;
        v44 = v8;
        _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ DecideNextScanStep: next (reached) phase = %{public}@, next event = %{public}@", buf, 0x20u);
      }
      return v9;
    default:
      unint64_t v8 = 0;
      int v14 = v3;
      goto LABEL_22;
  }
}

- (unint64_t)actionDecideNextScanStep:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self setPhase:[(SUCoreScan *)self _getPhaseAndPostEventAfterReachingScanPhase:[(SUCoreScan *)self phase]]];
  return 0;
}

- (int64_t)actionDownloadDocCatalog:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self scanPolicy];
  v7 = [v6 documentationAssetType];
  int64_t v8 = [(SUCoreScan *)self _downloadCatalog:v7 withIdentifier:@"doc"];

  return v8;
}

- (int64_t)actionQueryDocMetadata:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self _decrementMobileAssetPending:@"DownloadDocCatalog"];
  v7 = [(SUCoreScan *)self activeDescriptor];
  int64_t v8 = [v7 assetAudienceUUID];

  if (v8)
  {
    uint64_t v9 = [(SUCoreScan *)self activeDescriptor];
    v10 = [v9 assetAudienceUUID];

    id v11 = [MEMORY[0x263F77DE8] sharedLogger];
    double v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v10;
      uint64_t v13 = "%{public}@ doc metadata query using activeDescriptor assetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v14 = [(SUCoreScan *)self scanPolicy];
  int64_t v15 = [v14 assetAudienceUUID];

  if (v15)
  {
    uint64_t v16 = [(SUCoreScan *)self scanPolicy];
    v10 = [v16 assetAudienceUUID];

    v17 = [MEMORY[0x263F77DE8] sharedLogger];
    double v12 = [v17 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v10;
      uint64_t v13 = "%{public}@ doc metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  id v18 = [(SUCoreScan *)self scanPolicy];
  BOOL v19 = [(SUCoreScan *)self activeDescriptor];
  v20 = [v19 documentationID];
  v21 = [v18 constructDocumentationMAAssetQueryWithDocID:v20 purpose:v10];

  [(SUCoreScan *)self _incrementMobileAssetPending:@"QueryDocMetadata"];
  if (v21)
  {
    [(SUCoreScan *)self _trackScanBegin:@"queryMetaDataWithError" withIdentifier:@"doc"];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __37__SUCoreScan_actionQueryDocMetadata___block_invoke;
    v33[3] = &unk_2640DCC30;
    v33[4] = self;
    id v34 = v21;
    objc_msgSend(v34, "SUCoreBorder_queryMetaDataWithError:", v33);
  }
  else
  {
    id v22 = [NSString alloc];
    double v23 = [(SUCoreScan *)self activeDescriptor];
    v24 = [v23 documentationID];
    v25 = [(SUCoreScan *)self scanPolicy];
    v26 = [v25 summary];
    v27 = (void *)[v22 initWithFormat:@"failed to construct doc asset query for docID[%@] from policy[%@]", v24, v26];

    id v28 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v6 = 8100;
    v29 = [v28 buildError:8100 underlying:0 description:v27];

    v30 = [(SUCoreScan *)self scanFSM];
    __int16 v31 = [[SUCoreScanParam alloc] initWithResult:8100 withError:v29];
    [v30 postEvent:@"QueryMetadataFailed" withInfo:v31];
  }
  return v6;
}

void __37__SUCoreScan_actionQueryDocMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", @"queryMetaDataWithError", @"doc", a2);
  if (a2)
  {
    id v5 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v6 = [v5 buildError:8401 underlying:v9 description:@"failed to query doc metadata"];

    v7 = [*(id *)(a1 + 32) scanFSM];
    int64_t v8 = [[SUCoreScanParam alloc] initWithResult:a2 withError:v6];
    [v7 postEvent:@"QueryMetadataFailed" withInfo:v8];
  }
  else
  {
    [*(id *)(a1 + 32) _filterDocQueryResults:*(void *)(a1 + 40)];
  }
}

- (int64_t)actionDownloadDocAsset:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self _decrementMobileAssetPending:@"DownloadDocAsset"];
  [(SUCoreScan *)self _incrementMobileAssetPending:@"DownloadDocAsset"];
  v7 = [SUCoreMobileAsset alloc];
  int64_t v8 = [(SUCoreScan *)self activeDescriptor];
  id v9 = [v8 documentationAsset];
  v10 = [(SUCoreScan *)self scanUUID];
  id v11 = [(SUCoreMobileAsset *)v7 initWithDelegate:0 forAsset:v9 updateUUID:v10];
  [(SUCoreScan *)self setMaDocumentationControl:v11];

  double v12 = [(SUCoreScan *)self maDocumentationControl];

  if (v12)
  {
    uint64_t v13 = [(SUCoreScan *)self maDocumentationControl];
    int v14 = [(SUCoreScan *)self scanPolicy];
    int64_t v15 = [(SUCoreScan *)self scanUUID];
    uint64_t v16 = [(SUCoreScan *)self activeDescriptor];
    v17 = [v16 productBuildVersion];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __37__SUCoreScan_actionDownloadDocAsset___block_invoke;
    v23[3] = &unk_2640DCC58;
    v23[4] = self;
    [v13 downloadDocumentationAssetWithPolicy:v14 withUUID:v15 stashingDocumentationForBuild:v17 completion:v23];
  }
  else
  {
    id v18 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v6 = 8100;
    BOOL v19 = [v18 buildError:8100 underlying:0 description:@"failed to allocate MA documentation control"];

    v20 = [(SUCoreScan *)self scanFSM];
    v21 = [[SUCoreScanParam alloc] initWithResult:8100 withError:v19];
    [v20 postEvent:@"DocDownloadFailed" withInfo:v21];
  }
  return v6;
}

void __37__SUCoreScan_actionDownloadDocAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = v3;
  if (v3)
  {
    id v5 = [v4 scanFSM];
    int64_t v6 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v11 code], v11);
    [v5 postEvent:@"DocDownloadFailed" withInfo:v6];
  }
  else
  {
    v7 = [v4 activeDescriptor];
    int64_t v8 = [v7 documentation];
    id v5 = [v8 extendDocumentationProperties];

    id v9 = [*(id *)(a1 + 32) scanFSM];
    int64_t v6 = v9;
    if (v5)
    {
      v10 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v5 code], v5);
      [(SUCoreScanParam *)v6 postEvent:@"DocDownloadFailed" withInfo:v10];
    }
    else
    {
      [(SUCoreScanParam *)v9 postEvent:@"DocDownloadSuccess"];
    }
  }
}

- (int64_t)actionAlterDocDownloadConfig:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self maDocumentationControl];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F559A8]);
    int64_t v8 = [(SUCoreScan *)self scanPolicy];
    id v9 = [v8 documentationDownloadPolicy];
    objc_msgSend(v7, "setDiscretionary:", objc_msgSend(v9, "discretionary"));

    v10 = [(SUCoreScan *)self maDocumentationControl];
    [v10 alterDownloadOptions:v7];
    int64_t v11 = 0;
  }
  else
  {
    id v7 = [(SUCoreScan *)self scanFSM];
    v10 = [v7 diag];
    double v12 = (void *)[[NSString alloc] initWithFormat:@"%@ alter documentation download configuration when not downloading", self];
    int64_t v11 = 8116;
    [v10 trackAnomaly:@"[SCAN] ALTER" forReason:v12 withResult:8116 withError:0];
  }
  return v11;
}

- (int64_t)actionRemoveDocAsset:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"RemoveDocAsset"];
  int64_t v6 = [(SUCoreScan *)self maDocumentationControl];

  if (v6)
  {
    id v7 = [(SUCoreScan *)self maDocumentationControl];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__SUCoreScan_actionRemoveDocAsset___block_invoke;
    v10[3] = &unk_2640DCC58;
    v10[4] = self;
    [v7 removeAsset:v10];

    return 0;
  }
  else
  {
    id v9 = [(SUCoreScan *)self scanFSM];
    [v9 postEvent:@"DocRemoveFailed"];

    return 8116;
  }
}

void __35__SUCoreScan_actionRemoveDocAsset___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) scanFSM];
  if (v5)
  {
    uint64_t v4 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v5 code], v5);
    [v3 postEvent:@"DocRemoveFailed" withInfo:v4];
  }
  else
  {
    [v3 postEvent:@"DocRemoveSuccess"];
  }
}

- (int64_t)actionScanCompleteNoUpdate:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self _decrementMobileAssetPending:@"ScanCompleteNoUpdate"];
  int64_t v6 = [MEMORY[0x263F77D78] sharedCore];
  id v7 = [v6 buildError:8406 underlying:0 description:@"no update found"];

  LOBYTE(v9) = 1;
  [(SUCoreScan *)self _scanCompleteFoundPrimary:0 foundSecondary:0 majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 clearingOperation:v9 error:v7];

  return 0;
}

- (int64_t)actionScanSuccess:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  int64_t v8 = [(SUCoreScan *)self _decrementMobileAssetPending:@"ScanSuccess"];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v53 = self;
  int64_t v52 = v8;
  switch([(SUCoreScan *)self operation])
  {
    case 1:
      v10 = [v5 fallbackDescriptor];

      int64_t v11 = [MEMORY[0x263F77DE8] sharedLogger];
      double v12 = [v11 oslog];

      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v13)
        {
          int v14 = [v5 descriptor];
          int64_t v15 = [v14 summary];
          uint64_t v16 = [v5 descriptor];
          v17 = [v16 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
          *(_DWORD *)buf = 138543874;
          v60 = self;
          __int16 v61 = 2114;
          v62 = v15;
          __int16 v63 = 2114;
          v64 = v17;
          _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found primary descriptor:%{public}@\n%{public}@", buf, 0x20u);
        }
        id v18 = [MEMORY[0x263F77DE8] sharedLogger];
        double v12 = [v18 oslog];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v19 = [v5 fallbackDescriptor];
          v20 = [v19 summary];
          v21 = [v5 fallbackDescriptor];
          id v22 = [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
          *(_DWORD *)buf = 138543874;
          v60 = self;
          __int16 v61 = 2114;
          v62 = v20;
          __int16 v63 = 2114;
          v64 = v22;
          double v23 = "%{public}@ with fallback descriptor:%{public}@\n%{public}@";
          goto LABEL_17;
        }
        goto LABEL_22;
      }
      if (!v13) {
        goto LABEL_22;
      }
      BOOL v19 = [v5 descriptor];
      v20 = [v19 summary];
      v21 = [v5 descriptor];
      id v22 = [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v22;
      double v23 = "%{public}@ found descriptor:%{public}@\n%{public}@";
      goto LABEL_17;
    case 2:
      v24 = [MEMORY[0x263F77DE8] sharedLogger];
      double v12 = [v24 oslog];

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      BOOL v19 = [v5 descriptor];
      v20 = [v19 summary];
      v21 = [v5 descriptor];
      id v22 = [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v22;
      double v23 = "%{public}@ verified active descriptor:%{public}@\n%{public}@";
LABEL_17:
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

      goto LABEL_21;
    case 3:
      v25 = [MEMORY[0x263F77DE8] sharedLogger];
      double v12 = [v25 oslog];

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      v26 = [v5 descriptor];
      v20 = [v26 summary];
      v27 = [v5 descriptor];
      id v28 = [v27 documentation];
      v29 = [v28 summary];
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v29;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ collected descriptor:%{public}@ doc metadata:%{public}@", buf, 0x20u);

      goto LABEL_21;
    case 4:
      v30 = [(SUCoreScan *)self secondaryUpdateAsset];

      __int16 v31 = [MEMORY[0x263F77DE8] sharedLogger];
      double v12 = [v31 oslog];

      BOOL v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (!v32) {
          goto LABEL_22;
        }
        v20 = [(SUCoreScan *)self primaryUpdateAsset];
        uint64_t v33 = [v20 assetId];
        id v34 = [(SUCoreScan *)self secondaryUpdateAsset];
        v35 = [v34 assetId];
        *(_DWORD *)buf = 138543874;
        v60 = self;
        __int16 v61 = 2114;
        v62 = v33;
        __int16 v63 = 2114;
        v64 = v35;
        _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found primary update asset ID:%{public}@ with secondary update asset ID:%{public}@", buf, 0x20u);
      }
      else
      {
        if (!v32) {
          goto LABEL_22;
        }
        v20 = [(SUCoreScan *)self primaryUpdateAsset];
        uint64_t v33 = [v20 assetId];
        *(_DWORD *)buf = 138543618;
        v60 = self;
        __int16 v61 = 2114;
        v62 = v33;
        _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found update asset ID:%{public}@", buf, 0x16u);
      }

LABEL_21:
LABEL_22:

LABEL_23:
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v36 = v9;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v55 != v39) {
              objc_enumerationMutation(v36);
            }
            __int16 v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v42 = [MEMORY[0x263F77DE8] sharedLogger];
            __int16 v43 = [v42 oslog];

            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v60 = v53;
              __int16 v61 = 2114;
              v62 = v41;
              _os_log_impl(&dword_20C8EA000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v38);
      }

      v44 = [v5 descriptor];
      uint64_t v45 = [v5 fallbackDescriptor];
      v46 = [v5 majorPrimaryDescriptor];
      v47 = [v5 majorSecondaryDescriptor];
      v48 = [v5 minorPrimaryDescriptor];
      v49 = [v5 minorSecondaryDescriptor];
      LOBYTE(v51) = 1;
      [(SUCoreScan *)v53 _scanCompleteFoundPrimary:v44 foundSecondary:v45 majorPrimary:v46 majorSecondary:v47 minorPrimary:v48 minorSecondary:v49 clearingOperation:v51 error:0];

      return v52;
    default:
      [(SUCoreScan *)self _invalidOperation:@"[SCAN] SUCCESS"];
      int64_t v52 = 8112;
      goto LABEL_23;
  }
}

- (int64_t)actionScanFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  id v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  [(SUCoreScan *)self _decrementMobileAssetPending:@"ScanFailed"];
  int64_t v8 = [v5 error];
  if (!v8)
  {
    uint64_t v9 = [v5 resultCode];
    v10 = [MEMORY[0x263F77D78] sharedCore];
    if (v9) {
      uint64_t v11 = [v5 resultCode];
    }
    else {
      uint64_t v11 = 8402;
    }
    int64_t v8 = [v10 buildError:v11 underlying:0 description:@"scan failed"];
  }
  LOBYTE(v13) = 1;
  [(SUCoreScan *)self _scanCompleteFoundPrimary:0 foundSecondary:0 majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 clearingOperation:v13 error:v8];

  return 0;
}

- (int64_t)actionCancelPSUSAssetsDetermination:(id *)a3
{
  uint64_t v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"CancelPSUSAssetsDetermination"];
  [(SUCoreScan *)self _trackScanBegin:@"stageCancelOperation"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke;
  v7[3] = &unk_2640DCC58;
  v7[4] = self;
  objc_msgSend(MEMORY[0x263F55960], "SUCoreBorder_stageCancelOperation:", v7);
  return 0;
}

void __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_trackScanEnd:withResult:withError:", @"stageCancelOperation", objc_msgSend(v4, "code"), v4);

  id v5 = [*(id *)(a1 + 32) scanFSM];
  id v7 = v5;
  if (v4) {
    int64_t v6 = @"PSUSAssetsDetermineCancelFailed";
  }
  else {
    int64_t v6 = @"PSUSAssetsDetermineCancelSuccess";
  }
  [v5 postEvent:v6];
}

- (int64_t)actionCancelSUCatalogDownload:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"CancelSUCatalogDownload"];
  [(SUCoreScan *)self _trackScanBegin:@"cancelCatalogDownload" withIdentifier:@"su"];
  int64_t v6 = (void *)MEMORY[0x263F55938];
  id v7 = [(SUCoreScan *)self scanPolicy];
  int64_t v8 = [v7 softwareUpdateAssetType];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke;
  v10[3] = &unk_2640DCC80;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0;
}

void __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _trackScanEnd:@"cancelCatalogDownload" withIdentifier:@"su" withResult:a2 withError:0];
  id v4 = [*(id *)(a1 + 32) scanFSM];
  id v6 = v4;
  if (a2) {
    id v5 = @"CatalogDownloadCancelFailed";
  }
  else {
    id v5 = @"CatalogDownloadCancelSuccess";
  }
  [v4 postEvent:v5];
}

- (int64_t)actionCancelDocCatalogDownload:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"CancelDocCatalogDownload"];
  [(SUCoreScan *)self _trackScanBegin:@"cancelCatalogDownload" withIdentifier:@"doc"];
  id v6 = (void *)MEMORY[0x263F55938];
  id v7 = [(SUCoreScan *)self scanPolicy];
  int64_t v8 = [v7 documentationAssetType];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke;
  v10[3] = &unk_2640DCC80;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0;
}

void __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _trackScanEnd:@"cancelCatalogDownload" withIdentifier:@"doc" withResult:a2 withError:0];
  id v4 = [*(id *)(a1 + 32) scanFSM];
  id v6 = v4;
  if (a2) {
    id v5 = @"CatalogDownloadCancelFailed";
  }
  else {
    id v5 = @"CatalogDownloadCancelSuccess";
  }
  [v4 postEvent:v5];
}

- (int64_t)actionCancelSuccess:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self _decrementMobileAssetPending:@"CancelSuccess"];
  if ([(SUCoreScan *)self cancelingOperation])
  {
    [(SUCoreScan *)self _cancelCompleteWithError:0];
  }
  else
  {
    id v7 = [(SUCoreScan *)self scanFSM];
    int64_t v8 = [v7 diag];
    uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"%@ cancel success when not canceling", self];
    int64_t v6 = 8405;
    [v8 trackAnomaly:@"[SCAN] CANCEL" forReason:v9 withResult:8405 withError:0];
  }
  return v6;
}

- (int64_t)actionAfterAvailCancelSuccess:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreScan *)self scanFSM];
  int64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  int64_t v7 = [(SUCoreScan *)self _decrementMobileAssetPending:@"AfterAvailCancelSuccess"];
  if ([(SUCoreScan *)self cancelingOperation])
  {
    [(SUCoreScan *)self _cancelCompleteWithError:0];
  }
  else
  {
    int64_t v8 = [(SUCoreScan *)self scanFSM];
    uint64_t v9 = [v8 diag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"%@ cancel (after update availabvle) when not canceling", self];
    int64_t v7 = 8405;
    [v9 trackAnomaly:@"[SCAN] CANCEL" forReason:v10 withResult:8405 withError:0];
  }
  return v7;
}

- (int64_t)actionAfterFailCancelSuccess:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreScan *)self scanFSM];
  int64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  int64_t v7 = [(SUCoreScan *)self _decrementMobileAssetPending:@"AfterFailCancelSuccess"];
  if ([(SUCoreScan *)self cancelingOperation])
  {
    [(SUCoreScan *)self _cancelCompleteWithError:0];
  }
  else
  {
    int64_t v8 = [(SUCoreScan *)self scanFSM];
    uint64_t v9 = [v8 diag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"%@ cancel (after fail) when not canceling", self];
    int64_t v7 = 8405;
    [v9 trackAnomaly:@"[SCAN] CANCEL" forReason:v10 withResult:8405 withError:0];
  }
  return v7;
}

- (int64_t)actionCancelRemoveFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  int64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  int64_t v8 = [(SUCoreScan *)self _decrementMobileAssetPending:@"CancelRemoveFailed"];
  if ([(SUCoreScan *)self cancelingOperation])
  {
    uint64_t v9 = [v5 error];
    [(SUCoreScan *)self _cancelCompleteWithError:v9];
  }
  else
  {
    uint64_t v9 = [(SUCoreScan *)self scanFSM];
    v10 = [v9 diag];
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"%@ cancel (after remove fail) when not canceling", self];
    uint64_t v12 = [v5 resultCode];
    uint64_t v13 = [v5 error];
    [v10 trackAnomaly:@"[SCAN] CANCEL" forReason:v11 withResult:v12 withError:v13];

    int64_t v8 = 8405;
  }

  return v8;
}

- (int64_t)actionCheckCancelDone:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self _decrementMobileAssetPending:@"CheckCancelDone"];
  if (![(SUCoreScan *)self pendingMobileAssetRequests])
  {
    int64_t v7 = [(SUCoreScan *)self scanFSM];
    [v7 followupEvent:@"CancelComplete"];
  }
  return v6;
}

- (int64_t)actionAfterFailCheckCancelDone:(id)a3 error:(id *)a4
{
  id v5 = [(SUCoreScan *)self scanFSM];
  int64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  int64_t v7 = [(SUCoreScan *)self _decrementMobileAssetPending:@"AfterFailCheckCancelDone"];
  if (![(SUCoreScan *)self pendingMobileAssetRequests])
  {
    int64_t v8 = [(SUCoreScan *)self scanFSM];
    [v8 followupEvent:@"CancelComplete"];
  }
  return v7;
}

- (int64_t)actionCancelDone:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  if ([(SUCoreScan *)self cancelingOperation])
  {
    [(SUCoreScan *)self _cancelCompleteWithError:0];
    return 0;
  }
  else
  {
    int64_t v7 = [(SUCoreScan *)self scanFSM];
    int64_t v8 = [v7 diag];
    uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"%@ cancel done when not canceling", self];
    int64_t v6 = 8405;
    [v8 trackAnomaly:@"[SCAN] CANCEL" forReason:v9 withResult:8405 withError:0];
  }
  return v6;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = [(SUCoreScan *)self scanFSM];
  int64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2(v7);

  int64_t v8 = [(SUCoreScan *)self scanFSM];
  uint64_t v9 = [v8 diag];
  v10 = (void *)[[NSString alloc] initWithFormat:@"%@ unknown action(%@)", self, v5];

  [v9 dumpTracked:v10 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  return 8102;
}

- (int64_t)a_SimCatalogDownloadSuccess:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  int64_t v6 = [(SUCoreScan *)self scanFSM];
  [v6 postEvent:@"CatalogDownloadSuccess"];

  return 0;
}

- (int64_t)a_SimQueryMetadataUpdateAvailable:(id *)a3
{
  id v4 = [(SUCoreScan *)self scanFSM];
  id v5 = [v4 extendedStateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(MEMORY[0x263F55938]);
  int64_t v7 = [(SUCoreScan *)self _simDescriptorAttributes];
  int64_t v8 = (void *)[v6 initWithAttributes:v7];

  uint64_t v9 = [[SUCoreDescriptor alloc] initWithSUAsset:v8 releaseDate:@"2018-10-22" defaultValues:0];
  v10 = [(SUCoreScan *)self scanFSM];
  uint64_t v11 = [[SUCoreScanParam alloc] initWithDescriptor:v9 withFallbackDescriptor:0];
  [v10 postEvent:@"QueryMetadataUpdateAvailable" withInfo:v11];

  return 0;
}

- (SUCoreScan)initWithUUID:(id)a3
{
  return [(SUCoreScan *)self initWithUUID:a3 withCompletionQueue:0];
}

- (SUCoreScan)initWithUUID:(id)a3 withCompletionQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreScan;
  uint64_t v9 = [(SUCoreScan *)&v39 init];
  if (v9)
  {
    v10 = +[SUCoreScan _generateStateTable];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F77DD8]) initMachine:@"scan" ofInstance:v7 withTable:v10 startingIn:@"Idle"];
    scanFSM = v9->_scanFSM;
    v9->_scanFSM = (SUCoreFSM *)v11;

    if (!v9->_scanFSM)
    {

      v35 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_scanUUID, a3);
    uint64_t v13 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v14 = [v13 selectCompletionQueue:v8];
    clientCompletionQueue = v9->_clientCompletionQueue;
    v9->_clientCompletionQueue = (OS_dispatch_queue *)v14;

    v9->_operation = 0;
    v9->_operationSPIType = 0;
    v9->_cancelingOperation = 0;
    scanPolicy = v9->_scanPolicy;
    v9->_scanPolicy = 0;

    activeDescriptor = v9->_activeDescriptor;
    v9->_activeDescriptor = 0;

    v9->_downloadDocumentation = 0;
    v9->_pendingMobileAssetRequests = 0;
    alternateAssetAudienceUUID = v9->_alternateAssetAudienceUUID;
    v9->_alternateAssetAudienceUUID = 0;

    maDocumentationControl = v9->_maDocumentationControl;
    v9->_maDocumentationControl = 0;

    primaryUpdateAsset = v9->_primaryUpdateAsset;
    v9->_primaryUpdateAsset = 0;

    secondaryUpdateAsset = v9->_secondaryUpdateAsset;
    v9->_secondaryUpdateAsset = 0;

    originalScanPolicy = v9->_originalScanPolicy;
    v9->_originalScanPolicy = 0;

    v9->_phase = 0;
    interimScanResult = v9->_interimScanResult;
    v9->_interimScanResult = 0;

    psusPrimaryDescriptor = v9->_psusPrimaryDescriptor;
    v9->_psusPrimaryDescriptor = 0;

    psusSecondaryDescriptor = v9->_psusSecondaryDescriptor;
    v9->_psusSecondaryDescriptor = 0;

    id checkCompletion = v9->_checkCompletion;
    v9->_id checkCompletion = 0;

    id checkMajorMinorCompletion = v9->_checkMajorMinorCompletion;
    v9->_id checkMajorMinorCompletion = 0;

    id checkSlowReleaseCompletion = v9->_checkSlowReleaseCompletion;
    v9->_id checkSlowReleaseCompletion = 0;

    id verifyCompletion = v9->_verifyCompletion;
    v9->_id verifyCompletion = 0;

    id collectCompletion = v9->_collectCompletion;
    v9->_id collectCompletion = 0;

    id locateCompletion = v9->_locateCompletion;
    v9->_id locateCompletion = 0;

    id cancelCompletion = v9->_cancelCompletion;
    v9->_id cancelCompletion = 0;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke;
    v37[3] = &unk_2640DCCD0;
    uint64_t v33 = v9;
    uint64_t v38 = v33;
    [v10 enumerateKeysAndObjectsUsingBlock:v37];
    id v34 = [(SUCoreScan *)v33 scanFSM];
    [v34 activateMachine];
  }
  v35 = v9;
LABEL_6:

  return v35;
}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2;
  v7[3] = &unk_2640DCCA8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = [a3 safeStringForKey:*MEMORY[0x263F77E28]];
  if (v5)
  {
    if (([v8 isEqualToString:@"CatalogDownloadFailed"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataFailed"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataNoAssetFound"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataUpdateAvailable"] & 1) != 0
      || ([v8 isEqualToString:@"DocDownloadFailed"] & 1) != 0
      || ([v8 isEqualToString:@"DocRemoveFailed"] & 1) != 0
      || ([v8 isEqualToString:@"PSUSAssetsDetermineFailed"] & 1) != 0
      || ([v8 isEqualToString:@"CheckForAvailableUpdate"] & 1) != 0
      || ([v8 isEqualToString:@"DeterminePSUSAssets"] & 1) != 0
      || ([v8 isEqualToString:@"ScanComplete"] & 1) != 0
      || [v8 isEqualToString:@"PSUSAssetsDetermineSuccess"])
    {
      uint64_t v6 = objc_opt_class();
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [*(id *)(a1 + 32) scanFSM];
    [v7 registerAction:v5 ForEvent:v8 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 32) withInfoClass:v6];
  }
}

- (void)checkForAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  id v9 = [(SUCoreScan *)self scanFSM];
  v10 = [v9 extendedStateQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_2640DCCF8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"checkForAvailableUpdateWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v14 = [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] CHECK" forReason:v7 withResult:v8 withError:v14];

    [*(id *)(a1 + 32) _checkEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 error:v14 clearingTransaction:0];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v14 = [v9 buildError:8115 underlying:0 description:@"check when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  v10 = [*(id *)(a1 + 32) scanCheckTransaction];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) scanFSM];
    id v12 = [v11 diag];
    [v12 trackAnomaly:@"[SCAN] CHECK" forReason:@"existing transaction found for kSUCoreTransactionCheckForAvailableUpdate" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setCheckCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:1];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  id v14 = [*(id *)(a1 + 32) scanFSM];
  [v14 postProtectedEvent:@"DecideNextScanStep"];
LABEL_6:
}

- (void)checkForAvailableMajorMinorUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  id v9 = [(SUCoreScan *)self scanFSM];
  v10 = [v9 extendedStateQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_2640DCCF8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"checkForAvailableUpdateWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] CHECK MAJOR_MINOR" forReason:v7 withResult:v8 withError:v15];

    LOBYTE(v14) = 0;
    [*(id *)(a1 + 32) _checkMajorMinorEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 error:v15 clearingTransaction:v14];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v9 buildError:8115 underlying:0 description:@"check when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  v10 = [*(id *)(a1 + 32) scanCheckTransaction];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) scanFSM];
    id v12 = [v11 diag];
    [v12 trackAnomaly:@"[SCAN] CHECK MAJOR_MINOR" forReason:@"existing transaction found for kSUCoreTransactionCheckForAvailableUpdate" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setCheckMajorMinorCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:1];
  [*(id *)(a1 + 32) setOperationSPIType:2];
  id v15 = [*(id *)(a1 + 32) scanFSM];
  [v15 postProtectedEvent:@"DecideNextScanStep"];
LABEL_6:
}

- (void)checkForAvailableSlowReleaseUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  id v9 = [(SUCoreScan *)self scanFSM];
  v10 = [v9 extendedStateQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_2640DCCF8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"checkForAvailableSlowReleaseUpdatesWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v12 = [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] CHECK SLOW_RELEASE" forReason:v7 withResult:v8 withError:v12];

    LOBYTE(v11) = 0;
    [*(id *)(a1 + 32) _checkSlowReleaseEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 alternatePrimary:0 alternateSecondary:0 error:v12 clearingTransaction:v11];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v12 = [v9 buildError:8115 underlying:0 description:@"check when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
  v10 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v10];

  [*(id *)(a1 + 32) setCheckSlowReleaseCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:1];
  [*(id *)(a1 + 32) setOperationSPIType:3];
  id v12 = [*(id *)(a1 + 32) scanFSM];
  [v12 postProtectedEvent:@"DecideNextScanStep"];
LABEL_7:
}

- (void)verifyLatestAvailableWithPolicy:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.VerifyLatestAvailable"];
  id v12 = [(SUCoreScan *)self scanFSM];
  id v13 = [v12 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke;
  block[3] = &unk_2640DCD20;
  id v21 = v11;
  id v22 = v10;
  block[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  dispatch_async(v13, block);
}

void __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"verifyLatestAvailableWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v2 buildError:8111 underlying:0 description:@"verify when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] VERIFY" forReason:v7 withResult:v8 withError:v15];

    LOBYTE(v14) = 0;
    [*(id *)(a1 + 32) _verifyEndComplete:*(void *)(a1 + 64) scanPolicy:*(void *)(a1 + 40) active:*(void *)(a1 + 48) primary:0 secondary:0 error:v15 clearingTransaction:v14];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 56) withName:@"scan.VerifyLatestAvailable"];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v9 buildError:8115 underlying:0 description:@"verify when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ verify when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  id v10 = [*(id *)(a1 + 32) scanVerifyTransaction];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) scanFSM];
    id v12 = [v11 diag];
    [v12 trackAnomaly:@"[SCAN] VERIFY" forReason:@"existing transaction found for kSUCoreTransactionVerifyLatestAvailable" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanVerifyTransaction:*(void *)(a1 + 56)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setActiveDescriptor:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setVerifyCompletion:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setOperation:2];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  id v15 = [*(id *)(a1 + 32) scanFSM];
  [v15 postProtectedEvent:@"VerifyLatestAvailable"];
LABEL_6:
}

- (void)collectDocumentationMetadataWithPolicy:(id)a3 descriptor:(id)a4 downloadDocumentation:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.CollectDocumentationMetadata"];
  uint64_t v14 = [(SUCoreScan *)self scanFSM];
  id v15 = [v14 extendedStateQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke;
  v20[3] = &unk_2640DCD48;
  id v23 = v13;
  id v24 = v12;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  BOOL v25 = a5;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(v15, v20);
}

void __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"collectDocumentationMetadataWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v14 = [v2 buildError:8111 underlying:0 description:@"collect when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] COLLECT" forReason:v7 withResult:v8 withError:v14];

    [*(id *)(a1 + 32) _collectEndComplete:*(void *)(a1 + 64) scanPolicy:*(void *)(a1 + 40) active:*(void *)(a1 + 48) error:v14 clearingTransaction:0];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 56) withName:@"scan.CollectDocumentationMetadata"];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v14 = [v9 buildError:8115 underlying:0 description:@"collect when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ collect when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  id v10 = [*(id *)(a1 + 32) scanCollectTransaction];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) scanFSM];
    id v12 = [v11 diag];
    [v12 trackAnomaly:@"[SCAN] COLLECT" forReason:@"existing transaction found for kSUCoreTransactionCollectDocumentationMetadata" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanCollectTransaction:*(void *)(a1 + 56)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setActiveDescriptor:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDownloadDocumentation:*(unsigned __int8 *)(a1 + 72)];
  [*(id *)(a1 + 32) setCollectCompletion:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setOperation:3];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  id v14 = [*(id *)(a1 + 32) scanFSM];
  [v14 postProtectedEvent:@"CollectDocMetadata"];
LABEL_6:
}

- (void)locateAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.LocateAvailableUpdate"];
  id v9 = [(SUCoreScan *)self scanFSM];
  id v10 = [v9 extendedStateQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_2640DCCF8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"locateAvailableUpdateWithPolicy"];
  if ([*(id *)(a1 + 32) operation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v2 buildError:8111 underlying:0 description:@"locate when already performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] LOCATE" forReason:v7 withResult:v8 withError:v15];

    [*(id *)(a1 + 32) _locateEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 error:v15 clearingTransaction:0];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 48) withName:@"scan.LocateAvailableUpdate"];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v15 = [v9 buildError:8115 underlying:0 description:@"locate when canceling"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ locate when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_5;
  }
  id v10 = [*(id *)(a1 + 32) scanLocateTransaction];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) scanFSM];
    id v12 = [v11 diag];
    [v12 trackAnomaly:@"[SCAN] COLLECT" forReason:@"existing transaction found for kSUCoreTransactionLocateAvailableUpdate" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanLocateTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setLocateCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:4];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  id v15 = [*(id *)(a1 + 32) scanFSM];
  id v14 = [[SUCoreScanParam alloc] initWithNote:@"API locateAvailableUpdateWithPolicy"];
  [v15 postProtectedEvent:@"CheckForAvailableUpdate" withInfo:v14];

LABEL_6:
}

- (void)alterCurrentPolicy:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.AlterCurrentPolicy"];
  id v6 = [(SUCoreScan *)self scanFSM];
  id v7 = [v6 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUCoreScan_alterCurrentPolicy___block_invoke;
  block[3] = &unk_2640DCD70;
  block[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, block);
}

uint64_t __33__SUCoreScan_alterCurrentPolicy___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"alterCurrentPolicy"];
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v3 = [v2 buildError:8115 underlying:0 description:@"no alterations permitted when canceling scan operation"];

    id v4 = [*(id *)(a1 + 32) scanFSM];
    id v5 = [v4 diag];
    id v6 = (void *)[[NSString alloc] initWithFormat:@"%@ currently canceling", *(void *)(a1 + 32)];
    [v5 trackAnomaly:@"[SCAN] ALTER" forReason:v6 withResult:8115 withError:v3];
  }
  else
  {
    id v7 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 32) setScanPolicy:v7];

    if ([*(id *)(a1 + 32) operation] != 3) {
      goto LABEL_6;
    }
    id v3 = [*(id *)(a1 + 32) scanFSM];
    [v3 postProtectedEvent:@"AlterCurrentPolicy"];
  }

LABEL_6:
  id v8 = (void *)MEMORY[0x263F77D78];
  uint64_t v9 = *(void *)(a1 + 48);

  return [v8 endTransaction:v9 withName:@"scan.AlterCurrentPolicy"];
}

- (void)cancelCurrentScan:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"scan.CancelCurrentScan"];
  id v6 = [(SUCoreScan *)self scanFSM];
  id v7 = [v6 extendedStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SUCoreScan_cancelCurrentScan___block_invoke;
  block[3] = &unk_2640DCD98;
  id v11 = v5;
  id v12 = v4;
  block[4] = self;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, block);
}

void __32__SUCoreScan_cancelCurrentScan___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackScanBegin:@"cancelCurrentScan"];
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    uint64_t v2 = [MEMORY[0x263F77D78] sharedCore];
    id v18 = [v2 buildError:8111 underlying:0 description:@"already canceling scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ already canceling", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111;
LABEL_9:
    [v6 trackAnomaly:@"[SCAN] CANCEL" forReason:v7 withResult:v8 withError:v18];

    [*(id *)(a1 + 32) _cancelEndComplete:*(void *)(a1 + 48) error:v18 clearingTransaction:0];
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"scan.CancelCurrentScan"];
    goto LABEL_12;
  }
  int v9 = [*(id *)(a1 + 32) operation];
  id v10 = [MEMORY[0x263F77D78] sharedCore];
  id v11 = v10;
  if (!v9)
  {
    id v18 = [v10 buildError:8115 underlying:0 description:@"cancel when not performing scan operation"];

    id v3 = [*(id *)(a1 + 32) scanFSM];
    id v4 = [v3 diag];
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ no scan operation to cancel", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115;
    goto LABEL_9;
  }
  id v18 = [v10 buildError:8403 underlying:0 description:@"scan operation canceled"];

  id v12 = [*(id *)(a1 + 32) scanCancelTransaction];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) scanFSM];
    id v14 = [v13 diag];
    [v14 trackAnomaly:@"[SCAN] CANCEL" forReason:@"existing transaction found for kSUCoreTransactionCancelCurrentScan" withResult:8120 withError:0];
  }
  [*(id *)(a1 + 32) setScanCancelTransaction:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCancelingOperation:1];
  [*(id *)(a1 + 32) setCancelCompletion:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) operation] == 1)
  {
    id v15 = [[SUCoreScanParam alloc] initWithResult:8403 withError:v18];
    [*(id *)(a1 + 32) setInterimScanResult:v15];

    [*(id *)(a1 + 32) actionScanComplete:0];
  }
  else
  {
    LOBYTE(v17) = 0;
    [*(id *)(a1 + 32) _scanCompleteFoundPrimary:0 foundSecondary:0 majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 clearingOperation:v17 error:v18];
  }
  id v16 = [*(id *)(a1 + 32) scanFSM];
  [v16 postProtectedEvent:@"CancelCurrentScan"];

LABEL_12:
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:(id)a3 secondary:(id)a4 error:(id)a5
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(SUCoreScan *)self operationSPIType] != 3)
  {
    [NSString stringWithFormat:@"%@ invalid operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
    id v34 = LABEL_23:;
    [(SUCoreScan *)self _trackInconsistentAnomalyAndUpdateInterimResult:@"[SCAN] UPDATE_INTERIM_SLOWROLL" reason:v34];

    goto LABEL_109;
  }
  id v11 = [(SUCoreScan *)self interimScanResult];

  if (!v11)
  {
    [NSString stringWithFormat:@"%@ unexpected no previous scan result for slow release scan", self, v91];
    goto LABEL_23;
  }
  id v12 = v10;
  id v13 = [(SUCoreScan *)self interimScanResult];
  id v14 = [v13 majorPrimaryDescriptor];

  id v15 = [(SUCoreScan *)self interimScanResult];
  id v16 = [v15 majorSecondaryDescriptor];

  v100 = (SUCoreScanParam *)v8;
  id v102 = v9;
  if (v100 && !v14) {
    goto LABEL_8;
  }
  uint64_t v17 = 1;
  uint64_t v18 = 2;
  if (v100 && v14)
  {
    if ([(SUCoreScanParam *)v14 promoteAlternateUpdate])
    {
LABEL_8:
      uint64_t v17 = 2;
      uint64_t v18 = 1;
      goto LABEL_9;
    }
    uint64_t v17 = 1;
    uint64_t v18 = 2;
  }
LABEL_9:
  v98 = v14;
  id v19 = [MEMORY[0x263F77DE8] sharedLogger];
  id v20 = [v19 oslog];

  uint64_t v97 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v96 = v8;
    id v21 = @"YES";
    id v93 = v10;
    if (v98) {
      id v22 = @"YES";
    }
    else {
      id v22 = @"NO";
    }
    id v23 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:v18];
    if (!v100) {
      id v21 = @"NO";
    }
    id v24 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:v17];
    *(_DWORD *)buf = 138544386;
    v110 = self;
    __int16 v111 = 2112;
    id v112 = v22;
    id v10 = v93;
    __int16 v113 = 2114;
    uint64_t v114 = (uint64_t)v23;
    __int16 v115 = 2112;
    v116 = v21;
    id v8 = v96;
    __int16 v117 = 2114;
    v118 = v24;
    _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] assigning to descriptors (Default) promotedPrimary=%@ primaryPreferredType=%{public}@ and (Alternate) promotedAlternatePrimary=%@ alternatePreferredType=%{public}@", buf, 0x34u);

    id v12 = v97;
  }

  [(SUCoreScanParam *)v98 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:v18 assetAudienceUUID:0];
  [v16 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:v18 assetAudienceUUID:0];
  BOOL v25 = [(SUCoreScan *)self alternateAssetAudienceUUID];
  [(SUCoreScanParam *)v100 assignDescriptorAudienceType:2 descriptorPreferredUpdateType:v17 assetAudienceUUID:v25];

  v26 = [(SUCoreScan *)self alternateAssetAudienceUUID];
  [v102 assignDescriptorAudienceType:2 descriptorPreferredUpdateType:v17 assetAudienceUUID:v26];

  v27 = [v12 domain];
  if (![v27 isEqualToString:*MEMORY[0x263F78058]])
  {
    uint64_t v99 = v12;
    v30 = v100;
    unint64_t v31 = 0x263F77000;
LABEL_25:

    goto LABEL_27;
  }
  uint64_t v28 = [v12 code];

  id v29 = v12;
  v30 = v100;
  unint64_t v31 = 0x263F77000uLL;
  if (v28 == 8406)
  {
    BOOL v32 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v33 = [v32 oslog];

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[SUCoreScan _updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:]();
    }

    v30 = 0;
    uint64_t v99 = 0;
    v27 = v102;
    id v102 = 0;
    goto LABEL_25;
  }
  uint64_t v99 = v29;
LABEL_27:
  v35 = [(SUCoreScan *)self scanPolicy];
  int v36 = [v35 isSupervisedPolicy];

  if (v36)
  {
    id v92 = v9;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v103 = self;
    uint64_t v37 = [(SUCoreScan *)self scanPolicy];
    uint64_t v38 = [v37 policyExtensions];

    uint64_t v39 = [v38 countByEnumeratingWithState:&v104 objects:v108 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v101 = v30;
      id v94 = v10;
      uint64_t v95 = v16;
      __int16 v41 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v105 != v43) {
            objc_enumerationMutation(v38);
          }
          uint64_t v45 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v46 = [v45 requestedPMV];

            uint64_t v42 = [v45 mdmSoftwareUpdatePath];
            v47 = [MEMORY[0x263F77DE8] sharedLogger];
            v48 = [v47 oslog];

            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:v42];
              *(_DWORD *)buf = 138543874;
              v110 = v103;
              __int16 v111 = 2112;
              id v112 = v49;
              __int16 v113 = 2048;
              uint64_t v114 = v42;
              _os_log_impl(&dword_20C8EA000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Found SUCorePolicyExtensionManagedUpdates with mdmSoftwareUpdatePath: %@ (%ld)", buf, 0x20u);
            }
            __int16 v41 = (void *)v46;
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v104 objects:v108 count:16];
      }
      while (v40);

      if (v98)
      {
        v53 = v101;
        uint64_t v38 = v102;
        uint64_t v101 = v98;
        id v16 = v95;
        id v9 = v92;
      }
      else
      {
        id v16 = v95;
        id v9 = v92;
        if (v101 && v41)
        {
          v50 = [MEMORY[0x263F77DE8] sharedLogger];
          uint64_t v51 = [v50 oslog];

          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_20C8EA000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM scan performed using a requested PMV with no primary update found, using alternate update instead", buf, 0xCu);
          }

          id v52 = v102;
          uint64_t v38 = 0;
          v53 = 0;
          id v16 = v52;
        }
        else
        {
          v53 = v101;
          uint64_t v38 = v102;
          uint64_t v101 = 0;
        }
      }
      if (v42 == 1)
      {
        long long v55 = v101;
        if (![(SUCoreScanParam *)v101 enableAlternateAssetAudience] || v41)
        {
          v58 = v41;
        }
        else
        {
          long long v56 = [MEMORY[0x263F77DE8] sharedLogger];
          long long v57 = [v56 oslog];

          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_20C8EA000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and primary update found with dual audiences enabled, dropping primary update", buf, 0xCu);
          }

          v58 = 0;
          id v16 = 0;
          long long v55 = 0;
        }
        if (!v41 && v53)
        {
          __int16 v61 = [MEMORY[0x263F77DE8] sharedLogger];
          v62 = [v61 oslog];

          id v10 = v94;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_20C8EA000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and alternate update found, using alternate update only", buf, 0xCu);
          }

          __int16 v63 = v53;
          id v64 = v38;

          uint64_t v38 = 0;
          id v16 = v64;
          goto LABEL_77;
        }
        goto LABEL_72;
      }
      if (v41 || v42 != 2)
      {
        v58 = v41;
        id v10 = v94;
        long long v55 = v101;
        goto LABEL_73;
      }
      long long v55 = v101;
      if (!v53)
      {
        v58 = 0;
LABEL_72:
        id v10 = v94;
LABEL_73:
        if (v99 || v53 || v55)
        {
LABEL_78:
          long long v54 = v55;

          id v102 = v38;
          v30 = v53;
          self = v103;
          unint64_t v31 = 0x263F77000uLL;
          if (v53) {
            goto LABEL_79;
          }
LABEL_87:
          int v74 = [(SUCoreScanParam *)v54 promoteAlternateUpdate];
          if (v30 && v74)
          {
            uint64_t v75 = v54;
            v76 = [*(id *)(v31 + 3560) sharedLogger];
            uint64_t v77 = [v76 oslog];

            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v110 = self;
              _os_log_impl(&dword_20C8EA000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Primary descriptor indicates alternate updates should be promoted, swapping now", buf, 0xCu);
            }

            long long v54 = v30;
            v30 = v75;

            id v78 = v102;
            id v102 = v16;
            id v16 = v78;
          }
          uint64_t v79 = v54;
          goto LABEL_95;
        }
        id v64 = [MEMORY[0x263F77D78] sharedCore];
        uint64_t v99 = [v64 buildError:8406 underlying:v97 description:@"Supervised device MDM restrictions resulted in no update found"];
        __int16 v63 = 0;
LABEL_77:

        v53 = 0;
        long long v55 = v63;
        goto LABEL_78;
      }
      v59 = [MEMORY[0x263F77DE8] sharedLogger];
      v60 = [v59 oslog];

      id v10 = v94;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v110 = v103;
        _os_log_impl(&dword_20C8EA000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathFast and alternate update found, dropping alternate update", buf, 0xCu);
      }

      id v102 = 0;
      v53 = 0;
    }
    else
    {
      v53 = v30;
      long long v55 = v98;
    }

    v58 = 0;
    uint64_t v38 = v102;
    goto LABEL_73;
  }
  long long v54 = v98;
  if (!v30) {
    goto LABEL_87;
  }
LABEL_79:
  if (!v54 || ![(SUCoreScanParam *)v54 isEqual:v30]) {
    goto LABEL_87;
  }
  [*(id *)(v31 + 3560) sharedLogger];
  v66 = uint64_t v65 = v54;
  v67 = [v66 oslog];

  v68 = v65;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    int v69 = [(SUCoreScanParam *)v65 promoteAlternateUpdate];
    uint64_t v70 = @"NO";
    if (v69) {
      uint64_t v70 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    v110 = self;
    __int16 v111 = 2114;
    id v112 = v70;
    _os_log_impl(&dword_20C8EA000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Primary update and alternate update descriptors are equal, not returning alternate update (promoteAlternateUpdate=%{public}@)", buf, 0x16u);
  }

  if ([(SUCoreScanParam *)v65 promoteAlternateUpdate])
  {
    uint64_t v71 = v30;

    v72 = v102;
    id v73 = v102;

    id v16 = v73;
    v68 = v71;
  }
  else
  {
    v72 = v102;
  }

  uint64_t v79 = v68;
  [(SUCoreScanParam *)v68 promoteAlternateUpdate];
  id v102 = 0;
  v30 = 0;
LABEL_95:
  v80 = [*(id *)(v31 + 3560) sharedLogger];
  uint64_t v81 = [v80 oslog];

  BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
  if (v99)
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543362;
      v110 = self;
      _os_log_impl(&dword_20C8EA000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] An error was found while processing the scan for dual audience updates, not returning any updates", buf, 0xCu);
    }

    v83 = v99;
    uint64_t v79 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v99 code], v99);
    [(SUCoreScan *)self setInterimScanResult:v79];
  }
  else
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      __int16 v111 = 2114;
      id v112 = v79;
      _os_log_impl(&dword_20C8EA000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted primary update: %{public}@", buf, 0x16u);
    }

    v84 = [*(id *)(v31 + 3560) sharedLogger];
    v85 = [v84 oslog];

    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      __int16 v111 = 2114;
      id v112 = v16;
      _os_log_impl(&dword_20C8EA000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted secondary update: %{public}@", buf, 0x16u);
    }

    v86 = [*(id *)(v31 + 3560) sharedLogger];
    v87 = [v86 oslog];

    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      __int16 v111 = 2114;
      id v112 = v30;
      _os_log_impl(&dword_20C8EA000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted alternate primary update: %{public}@", buf, 0x16u);
    }

    v88 = [*(id *)(v31 + 3560) sharedLogger];
    v89 = [v88 oslog];

    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      __int16 v111 = 2114;
      id v112 = v102;
      _os_log_impl(&dword_20C8EA000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted alternate secondary update: %{public}@", buf, 0x16u);
    }

    v90 = [[SUCoreScanParam alloc] initWithMajorPrimaryDescriptor:v79 majorSecondaryDescriptor:v16 minorPrimaryDescriptor:v30 minorSecondaryDescriptor:v102];
    [(SUCoreScan *)self setInterimScanResult:v90];

    v83 = 0;
  }

LABEL_109:
}

- (void)_updateInterimScanResultForSplomboWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(SUCoreScan *)self interimScanResult];

  if (!v22)
  {
    v26 = [NSString stringWithFormat:@"%@ unexpected no previous scan result for Splombo scan", self];
    [(SUCoreScan *)self _trackInconsistentAnomalyAndUpdateInterimResult:@"[SCAN] UPDATE_INTERIM_SPLOMBO" reason:v26];

    goto LABEL_18;
  }
  if (!v21)
  {
    if ([(SUCoreScan *)self operationSPIType] == 1)
    {
      [(SUCoreScan *)self interimScanResult];
      v27 = id v49 = v20;
      uint64_t v28 = [v27 descriptor];

      id v29 = [(SUCoreScan *)self interimScanResult];
      v30 = [v29 fallbackDescriptor];

      id v20 = v49;
      [v28 setAssociatedSplatDescriptor:v15];
      [v30 setAssociatedSplatDescriptor:v15];
      unint64_t v31 = [[SUCoreScanParam alloc] initWithDescriptor:v28 withFallbackDescriptor:v30];
      [(SUCoreScan *)self setInterimScanResult:v31];

      id v16 = v30;
    }
    else
    {
      if ([(SUCoreScan *)self operationSPIType] == 2)
      {
        id v15 = v15;
        BOOL v32 = [(SUCoreScan *)self interimScanResult];
        uint64_t v33 = [v32 majorPrimaryDescriptor];

        id v34 = [(SUCoreScan *)self interimScanResult];
        uint64_t v35 = [v34 majorSecondaryDescriptor];

        int v36 = [(SUCoreScan *)self interimScanResult];
        [v36 minorPrimaryDescriptor];
        v38 = uint64_t v37 = v20;

        uint64_t v39 = [(SUCoreScan *)self interimScanResult];
        uint64_t v40 = [v39 minorSecondaryDescriptor];

        if (v33)
        {
          [v33 setAssociatedSplatDescriptor:v15];
          __int16 v41 = (void *)v35;
        }
        else
        {
          [v38 setAssociatedSplatDescriptor:v15];
          __int16 v41 = (void *)v40;
        }
        [v41 setAssociatedSplatDescriptor:v15];

        v47 = [[SUCoreScanParam alloc] initWithMajorPrimaryDescriptor:v33 majorSecondaryDescriptor:v35 minorPrimaryDescriptor:v38 minorSecondaryDescriptor:v40];
        [(SUCoreScan *)self setInterimScanResult:v47];

        id v18 = (id)v35;
        id v19 = v38;
        id v20 = (id)v40;
        id v17 = v33;
        goto LABEL_18;
      }
      if ([(SUCoreScan *)self operationSPIType] != 3)
      {
        uint64_t v46 = [NSString stringWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
        [(SUCoreScan *)self _trackInconsistentAnomalyAndUpdateInterimResult:@"[SCAN] UPDATE_INTERIM_SPLOMBO" reason:v46];

        goto LABEL_18;
      }
      uint64_t v42 = [(SUCoreScan *)self interimScanResult];
      uint64_t v28 = [v42 majorPrimaryDescriptor];

      uint64_t v43 = [(SUCoreScan *)self interimScanResult];
      [v43 majorSecondaryDescriptor];
      v44 = id v50 = v20;

      [v28 setAssociatedSplatDescriptor:v15];
      [v44 setAssociatedSplatDescriptor:v15];
      uint64_t v45 = [[SUCoreScanParam alloc] initWithMajorPrimaryDescriptor:v28 majorSecondaryDescriptor:v44 minorPrimaryDescriptor:0 minorSecondaryDescriptor:0];
      [(SUCoreScan *)self setInterimScanResult:v45];

      id v16 = v44;
      id v20 = v50;
    }
    id v15 = v28;
    goto LABEL_18;
  }
  id v23 = v20;
  id v24 = [MEMORY[0x263F77DE8] sharedLogger];
  BOOL v25 = [v24 oslog];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v52 = self;
    __int16 v53 = 2114;
    id v54 = v21;
    _os_log_impl(&dword_20C8EA000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ [SPLOMBO] splombo scan failed with %{public}@, but this is non-fatal", buf, 0x16u);
  }

  id v20 = v23;
LABEL_18:
  v48 = [(SUCoreScan *)self originalScanPolicy];
  [(SUCoreScan *)self setScanPolicy:v48];

  [(SUCoreScan *)self setOriginalScanPolicy:0];
}

- (void)_updateInterimScanResultWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  id v29 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([(SUCoreScan *)self operation] == 1)
  {
    if ([(SUCoreScan *)self phase] == 1)
    {
      if (v20)
      {
        id v21 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v20 code], v20);
LABEL_19:
        id v22 = v21;
        [(SUCoreScan *)self setInterimScanResult:v21];
        goto LABEL_20;
      }
      if ([(SUCoreScan *)self operationSPIType] == 1)
      {
        id v21 = [[SUCoreScanParam alloc] initWithDescriptor:v29 withFallbackDescriptor:v15];
        goto LABEL_19;
      }
      if ([(SUCoreScan *)self operationSPIType] == 2)
      {
        id v23 = [SUCoreScanParam alloc];
        id v24 = v16;
        id v25 = v17;
        id v26 = v18;
        id v27 = v19;
LABEL_18:
        id v21 = [(SUCoreScanParam *)v23 initWithMajorPrimaryDescriptor:v24 majorSecondaryDescriptor:v25 minorPrimaryDescriptor:v26 minorSecondaryDescriptor:v27];
        goto LABEL_19;
      }
      if ([(SUCoreScan *)self operationSPIType] == 3)
      {
        [v29 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:2 assetAudienceUUID:0];
        [v15 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:2 assetAudienceUUID:0];
        id v23 = [SUCoreScanParam alloc];
        id v24 = v29;
        id v25 = v15;
        id v26 = 0;
        id v27 = 0;
        goto LABEL_18;
      }
      [NSString stringWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
    }
    else
    {
      if ([(SUCoreScan *)self phase] == 2)
      {
        [(SUCoreScan *)self _updateInterimScanResultForSplomboWithPrimary:v29 secondary:v15 majorPrimary:v16 majorSecondary:v17 minorPrimary:v18 minorSecondary:v19 error:v20];
        goto LABEL_21;
      }
      if ([(SUCoreScan *)self phase] == 3)
      {
        [(SUCoreScan *)self _updateInterimScanResultForSlowReleaseWithPrimary:v29 secondary:v15 error:v20];
        goto LABEL_21;
      }
      [NSString stringWithFormat:@"%@ invalid phase (%d) found", self, -[SUCoreScan phase](self, "phase")];
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown operation (%d) found", -[SUCoreScan operation](self, "operation"), v28);
  id v22 = };
  [(SUCoreScan *)self _trackInconsistentAnomalyAndUpdateInterimResult:@"[SCAN] UPDATE_INTERIM" reason:v22];
LABEL_20:

LABEL_21:
}

- (void)_trackInconsistentAnomalyAndUpdateInterimResult:(id)a3 reason:(id)a4
{
  id v6 = (void *)MEMORY[0x263F77D78];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedCore];
  id v13 = [v9 buildError:8117 underlying:0 description:v7];

  id v10 = [(SUCoreScan *)self scanFSM];
  id v11 = [v10 diag];
  objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", v8, v7, objc_msgSend(v13, "code"), v13);

  id v12 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v13 code], v13);
  [(SUCoreScan *)self setInterimScanResult:v12];
}

- (void)_scanCompleteFoundPrimary:(id)a3 foundSecondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 clearingOperation:(BOOL)a9 error:(id)a10
{
  id v42 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = [(SUCoreScan *)self scanFSM];
  id v23 = [v22 extendedStateQueue];
  dispatch_assert_queue_V2(v23);

  id v24 = [(SUCoreScan *)self scanPolicy];
  id v25 = [(SUCoreScan *)self activeDescriptor];
  switch([(SUCoreScan *)self operation])
  {
    case 1:
      [(SUCoreScan *)self _updateInterimScanResultWithPrimary:v42 secondary:v16 majorPrimary:v17 majorSecondary:v18 minorPrimary:v19 minorSecondary:v20 error:v21];
      id v26 = [(SUCoreScan *)self scanFSM];
      [v26 followupEvent:@"DecideNextScanStep"];

      if (a9) {
        goto LABEL_13;
      }
      break;
    case 2:
      id v40 = v18;
      id v27 = v17;
      uint64_t v28 = [(SUCoreScan *)self verifyCompletion];
      [(SUCoreScan *)self setVerifyCompletion:0];
      id v29 = v21;
      if (!v29 && (([v25 isEqual:v42] & 1) != 0 || objc_msgSend(v25, "isEqual:", v16)))
      {

        id v16 = 0;
        id v42 = 0;
      }
      LOBYTE(v38) = 1;
      [(SUCoreScan *)self _verifyEndComplete:v28 scanPolicy:v24 active:v25 primary:v42 secondary:v16 error:v29 clearingTransaction:v38];

      id v17 = v27;
      id v18 = v40;
      goto LABEL_12;
    case 3:
      v30 = [(SUCoreScan *)self collectCompletion];
      [(SUCoreScan *)self setCollectCompletion:0];
      [(SUCoreScan *)self _collectEndComplete:v30 scanPolicy:v24 active:v25 error:v21 clearingTransaction:1];

      goto LABEL_12;
    case 4:
      [(SUCoreScan *)self primaryUpdateAsset];
      unint64_t v31 = v41 = v21;
      [(SUCoreScan *)self secondaryUpdateAsset];
      v32 = id v39 = v17;
      [(SUCoreScan *)self setPrimaryUpdateAsset:0];
      [(SUCoreScan *)self setSecondaryUpdateAsset:0];
      [(SUCoreScan *)self locateCompletion];
      id v33 = v16;
      id v34 = v20;
      id v35 = v19;
      uint64_t v37 = v36 = v18;
      [(SUCoreScan *)self setLocateCompletion:0];
      [(SUCoreScan *)self _locateEndComplete:v37 scanPolicy:v24 primary:v31 secondary:v32 error:v41 clearingTransaction:1];

      id v18 = v36;
      id v19 = v35;
      id v20 = v34;
      id v16 = v33;

      id v17 = v39;
      id v21 = v41;
LABEL_12:
      if (a9)
      {
LABEL_13:
        if ([(SUCoreScan *)self operation] != 1) {
          [(SUCoreScan *)self _clearCurrentOperation];
        }
      }
      break;
    default:
      [(SUCoreScan *)self _invalidOperation:@"[SCAN] COMPLETION"];
      break;
  }
}

- (void)_cancelCompleteWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreScan *)self scanFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SUCoreScan *)self cancelCompletion];
  [(SUCoreScan *)self setCancelCompletion:0];
  [(SUCoreScan *)self _cancelEndComplete:v7 error:v4 clearingTransaction:1];

  [(SUCoreScan *)self _clearCurrentOperation];
}

- (void)_checkEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(SUCoreScan *)self scanFSM];
  id v20 = [v19 extendedStateQueue];
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    id v21 = [(SUCoreScan *)self scanCheckTransaction];
    [(SUCoreScan *)self setScanCheckTransaction:0];
  }
  else
  {
    id v21 = 0;
  }
  id v22 = (void *)MEMORY[0x210550B20](v14);
  [(SUCoreScan *)self _operationCompleting:v22 error:v18 clearingTransaction:v8];

  if (v14)
  {
    id v23 = [(SUCoreScan *)self clientCompletionQueue];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    id v27 = __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    uint64_t v28 = &unk_2640DCDC0;
    id v34 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v21;
    dispatch_async(v23, &v25);
  }
  else if (v21)
  {
    [MEMORY[0x263F77D78] endTransaction:v21 withName:@"scan.CheckForAvailableUpdate"];
  }
  if (v18) {
    uint64_t v24 = [v18 code];
  }
  else {
    uint64_t v24 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"checkForAvailableUpdateWithPolicy", v24, v18, v25, v26, v27, v28 withResult withError];
}

uint64_t __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  if (*(void *)(a1 + 64))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_checkMajorMinorEndComplete:(id)a3 scanPolicy:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(SUCoreScan *)self scanFSM];
  id v23 = [v22 extendedStateQueue];
  dispatch_assert_queue_V2(v23);

  if (a10)
  {
    uint64_t v24 = [(SUCoreScan *)self scanCheckTransaction];
    [(SUCoreScan *)self setScanCheckTransaction:0];
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v25 = (void *)MEMORY[0x210550B20](v16);
  [(SUCoreScan *)self _operationCompleting:v25 error:v21 clearingTransaction:a10];

  if (v16)
  {
    uint64_t v26 = [(SUCoreScan *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_2640DCDE8;
    id v38 = v16;
    id v27 = v29;
    id v31 = v29;
    id v32 = v17;
    id v33 = v18;
    id v34 = v19;
    id v35 = v20;
    id v36 = v21;
    id v37 = v24;
    dispatch_async(v26, block);
  }
  else
  {
    id v27 = v29;
    if (v24) {
      [MEMORY[0x263F77D78] endTransaction:v24 withName:@"scan.CheckForAvailableUpdate"];
    }
  }
  if (v21) {
    uint64_t v28 = [v21 code];
  }
  else {
    uint64_t v28 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"checkForAvailableUpdateWithPolicy" withResult:v28 withError:v21];
}

uint64_t __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
  if (*(void *)(a1 + 80))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (BOOL)_decideAndProcessSlowReleaseScan
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreScan *)self scanFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  if ([(SUCoreScan *)self phase] <= 2
    && [(SUCoreScan *)self operation] == 1
    && [(SUCoreScan *)self operationSPIType] == 3)
  {
    id v5 = [(SUCoreScan *)self interimScanResult];
    id v6 = [v5 majorPrimaryDescriptor];

    id v7 = [(SUCoreScan *)self interimScanResult];
    BOOL v8 = [v7 error];

    id v9 = [v8 userInfo];
    id v10 = [v9 safeObjectForKey:*MEMORY[0x263F08608] ofClass:objc_opt_class()];

    if (v8)
    {
      id v11 = [v8 domain];
      if ([v11 isEqualToString:*MEMORY[0x263F78058]]
        && [v8 code] == 8400
        && v10)
      {
        id v12 = [v10 domain];
        if ([v12 isEqualToString:@"com.apple.MobileAssetError.Download"]
          && [v10 code] == 18)
        {
          id v13 = [(SUCoreScan *)self scanPolicy];
          int v14 = [v13 isRequestedPMVSupervisedPolicy];

          if (!v14) {
            goto LABEL_19;
          }
LABEL_15:
          id v19 = [(SUCoreScan *)self scanPolicy];
          id v20 = [v19 alternateAssetAudienceUUID];
          if (v20)
          {
            [(SUCoreScan *)self setAlternateAssetAudienceUUID:v20];
          }
          else
          {
            id v21 = [v6 alternateAssetAudienceUUID];
            [(SUCoreScan *)self setAlternateAssetAudienceUUID:v21];
          }
          if (v8)
          {
            id v22 = [(SUCoreScan *)self alternateAssetAudienceUUID];

            if (!v22)
            {
              id v23 = objc_alloc(MEMORY[0x263F77D90]);
              uint64_t v24 = (void *)[v23 initWithProjectName:*MEMORY[0x263F77EB8]];
              uint64_t v25 = [v24 getStringConfigForKey:*MEMORY[0x263F77E40]];
              [(SUCoreScan *)self setAlternateAssetAudienceUUID:v25];

              uint64_t v26 = [(SUCoreScan *)self alternateAssetAudienceUUID];

              if (v26)
              {
                id v27 = [MEMORY[0x263F77DE8] sharedLogger];
                uint64_t v28 = [v27 oslog];

                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  id v29 = [(SUCoreScan *)self alternateAssetAudienceUUID];
                  int v33 = 138543618;
                  id v34 = self;
                  __int16 v35 = 2114;
                  id v36 = v29;
                  _os_log_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Using alternate asset audience from SUCoreConfig: %{public}@", (uint8_t *)&v33, 0x16u);
                }
              }
              else
              {
                [(SUCoreScan *)self setAlternateAssetAudienceUUID:@"c724cb61-e974-42d3-a911-ffd4dce11eda"];
              }
            }
          }
          id v30 = [MEMORY[0x263F77DE8] sharedLogger];
          id v31 = [v30 oslog];

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = [(SUCoreScan *)self alternateAssetAudienceUUID];
            int v33 = 138543618;
            id v34 = self;
            __int16 v35 = 2114;
            id v36 = v32;
            _os_log_impl(&dword_20C8EA000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] alternate scan using asset audience: %{public}@", (uint8_t *)&v33, 0x16u);
          }
          BOOL v15 = 1;
          goto LABEL_31;
        }
      }
    }
    else
    {
      id v17 = [(SUCoreScan *)self scanPolicy];
      BOOL v18 = [(SUCoreScan *)self _shouldPerformAlternateScanFromFoundDescriptor:v6 policy:v17];

      if (v18) {
        goto LABEL_15;
      }
    }
LABEL_19:
    BOOL v15 = 0;
LABEL_31:

    return v15;
  }
  return 0;
}

- (BOOL)_decideAndProcessSplomboScan
{
  id v3 = [(SUCoreScan *)self scanFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  if ([(SUCoreScan *)self phase] <= 1 && [(SUCoreScan *)self operation] == 1)
  {
    id v5 = [(SUCoreScan *)self interimScanResult];
    id v6 = [v5 error];

    if ([(SUCoreScan *)self operationSPIType] == 1)
    {
      id v7 = [(SUCoreScan *)self interimScanResult];
      uint64_t v8 = [v7 descriptor];
    }
    else
    {
      if ([(SUCoreScan *)self operationSPIType] == 2)
      {
        id v7 = [(SUCoreScan *)self interimScanResult];
        id v11 = [v7 majorPrimaryDescriptor];
        id v12 = v11;
        if (v11)
        {
          id v9 = v11;
        }
        else
        {
          id v13 = [(SUCoreScan *)self interimScanResult];
          id v9 = [v13 minorPrimaryDescriptor];
        }
LABEL_15:

        BOOL v10 = 0;
        if (!v6 && v9)
        {
          int v14 = [(SUCoreScan *)self scanPolicy];
          BOOL v15 = [(SUCoreScan *)self _shouldPerformSplomboScanFromFoundDescriptor:v9 policy:v14];

          if (v15)
          {
            id v16 = [(SUCoreScan *)self scanPolicy];
            id v17 = (void *)[v16 copy];

            BOOL v18 = [v9 productBuildVersion];
            [v17 setPrerequisiteBuildVersion:v18];

            id v19 = [v9 productVersion];
            [v17 setPrerequisiteProductVersion:v19];

            id v20 = [v9 restoreVersion];
            [v17 setPrerequisiteRestoreVersion:v20];

            id v21 = [v17 softwareUpdateScanPolicy];
            [v21 setRestrictToFull:0];

            id v22 = [v17 softwareUpdateScanPolicy];
            [v22 setRestrictToIncremental:1];

            id v23 = objc_alloc_init(SUCorePolicyExtensionSplatUpdate);
            uint64_t v24 = [v9 restoreVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatRestoreVersion:v24];

            uint64_t v25 = [v9 productBuildVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatBuildVersion:v25];

            uint64_t v26 = [v9 productVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatProductVersion:v26];

            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatProductVersionExtra:0];
            id v27 = [v9 releaseType];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatReleaseType:v27];

            uint64_t v28 = [v9 restoreVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledBaseOSRestoreVersion:v28];

            id v29 = [v9 productBuildVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledBaseOSBuildVersion:v29];

            id v30 = [v9 productVersion];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledSplatProductVersion:v30];

            id v31 = [v9 releaseType];
            [(SUCorePolicyExtensionSplatUpdate *)v23 setInstalledBaseOSReleaseType:v31];

            id v32 = [v17 softwareUpdateScanPolicy];
            -[SUCorePolicyExtensionSplatUpdate setAllowSameRestoreVersion:](v23, "setAllowSameRestoreVersion:", [v32 allowSameVersion]);

            int v33 = [MEMORY[0x263EFF980] array];
            id v34 = [v17 policyExtensions];

            if (v34)
            {
              __int16 v35 = (void *)MEMORY[0x263EFF980];
              id v36 = [v17 policyExtensions];
              uint64_t v37 = [v35 arrayWithArray:v36];

              int v33 = (void *)v37;
            }
            [v33 addObject:v23];
            [v17 setPolicyExtensions:v33];
            [v17 setSoftwareUpdateAssetType:@"com.apple.MobileAsset.SplatSoftwareUpdate"];
            id v38 = [(SUCoreScan *)self scanPolicy];
            [(SUCoreScan *)self setOriginalScanPolicy:v38];

            [(SUCoreScan *)self setScanPolicy:v17];
            BOOL v10 = 1;
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        goto LABEL_22;
      }
      if ([(SUCoreScan *)self operationSPIType] != 3)
      {
        BOOL v10 = 0;
        id v9 = 0;
LABEL_22:

        return v10;
      }
      id v7 = [(SUCoreScan *)self interimScanResult];
      uint64_t v8 = [v7 majorPrimaryDescriptor];
    }
    id v9 = (id)v8;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_decideAndProcessPSUSScanForPrimaryDescriptor:(id)a3 secondaryDescriptor:(id)a4 andError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(SUCoreScan *)self phase] <= 4 && [(SUCoreScan *)self operation] == 1)
  {
    if (v8
      && !a5
      && ([(SUCoreScan *)self scanPolicy],
          BOOL v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = [(SUCoreScan *)self _shouldPerformPSUSScanFromFoundDescriptor:v8 policy:v10], v10, v11))
    {
      [(SUCoreScan *)self setPsusPrimaryDescriptor:v8];
      BOOL v12 = 1;
      id v13 = v9;
    }
    else
    {
      [(SUCoreScan *)self setPsusPrimaryDescriptor:0];
      id v13 = 0;
      BOOL v12 = 0;
    }
    [(SUCoreScan *)self setPsusSecondaryDescriptor:v13];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldPerformPSUSScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v11 = 0;
  BOOL v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:a3 policy:a4 reason:&v11];
  id v6 = v11;
  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    *(_DWORD *)buf = 138543874;
    id v13 = self;
    __int16 v14 = 2114;
    if (v5) {
      id v9 = @"YES";
    }
    BOOL v15 = v9;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [PreSUStaging] Performing psus scan: %{public}@; reason; %{public}@",
      buf,
      0x20u);
  }

  return v5;
}

- (BOOL)_shouldPerformSplomboScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if ([v7 disableSplatCombo])
    {
      int v9 = 0;
      BOOL v10 = @"Splombo scan disabled via policy";
    }
    else if ([v8 isSplatPolicy])
    {
      int v9 = 0;
      BOOL v10 = @"Policy is a splat policy; don't perform splombo scan";
    }
    else if ([v6 splatOnly])
    {
      int v9 = 0;
      BOOL v10 = @"Located descriptor is a splat update; don't perform splombo scan";
    }
    else
    {
      int v11 = [v6 disableSplatCombo];
      int v9 = v11 ^ 1;
      if (v11) {
        BOOL v10 = @"Splombo is disabled by server";
      }
      else {
        BOOL v10 = @"Splombo scan should be perfromed since it isn't disbaled and the found descriptor is a normal SU";
      }
    }
  }
  else
  {
    int v9 = 0;
    BOOL v10 = @"Unexpected nil policy; don't perform the splombo scan";
  }
  BOOL v12 = [MEMORY[0x263F77DE8] sharedLogger];
  id v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = @"NO";
    int v16 = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    if (v9) {
      __int16 v14 = @"YES";
    }
    id v19 = v14;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [SPLOMBO] Performing splombo scan: %{public}@ (%{public}@)", (uint8_t *)&v16, 0x20u);
  }

  return v9;
}

- (BOOL)_shouldPerformAlternateScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 disableAlternateUpdate])
  {
    BOOL v8 = 0;
    int v9 = @"Alternate scan disabled via policy";
  }
  else if ([v7 isRequestedPMVSupervisedPolicy])
  {
    BOOL v8 = 0;
    int v9 = @"Alternate scan disabled for supervised PMV requests";
  }
  else
  {
    BOOL v10 = [v7 alternateAssetAudienceUUID];

    if (v10)
    {
      int v9 = @"Alternate scan enabled via policy alternate asset audience";
      BOOL v8 = 1;
    }
    else
    {
      int v9 = @"Defaults to not performing alternate scan";
      if ([v6 enableAlternateAssetAudience])
      {
        int v11 = [v6 alternateAssetAudienceUUID];

        BOOL v12 = v11 == 0;
        BOOL v8 = v11 != 0;
        if (!v12) {
          int v9 = @"Located descriptor indicates an alternate scan should be performed";
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }
  id v13 = [MEMORY[0x263F77DE8] sharedLogger];
  __int16 v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = @"NO";
    int v17 = 138543874;
    __int16 v18 = self;
    __int16 v19 = 2114;
    if (v8) {
      BOOL v15 = @"YES";
    }
    __int16 v20 = v15;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Performing alternate scan: %{public}@ (%{public}@)", (uint8_t *)&v17, 0x20u);
  }

  return v8;
}

- (void)_checkSlowReleaseEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 alternatePrimary:(id)a7 alternateSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16 = a3;
  id v30 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = [(SUCoreScan *)self scanFSM];
  uint64_t v23 = [v22 extendedStateQueue];
  dispatch_assert_queue_V2(v23);

  id v24 = v21;
  if (a10)
  {
    uint64_t v25 = [(SUCoreScan *)self scanCheckTransaction];
    [(SUCoreScan *)self setScanCheckTransaction:0];
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (void *)MEMORY[0x210550B20](v16);
  [(SUCoreScan *)self _operationCompleting:v26 error:v24 clearingTransaction:a10];

  if (v16)
  {
    id v27 = [(SUCoreScan *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_2640DCDE8;
    id v39 = v16;
    uint64_t v28 = v30;
    id v32 = v30;
    id v33 = v17;
    id v34 = v18;
    id v35 = v19;
    id v36 = v20;
    id v37 = v24;
    id v38 = v25;
    dispatch_async(v27, block);
  }
  else
  {
    uint64_t v28 = v30;
    if (v25) {
      [MEMORY[0x263F77D78] endTransaction:v25 withName:@"scan.CheckForAvailableUpdate"];
    }
  }
  if (v24) {
    uint64_t v29 = [v24 code];
  }
  else {
    uint64_t v29 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"checkForAvailableSlowReleaseUpdatesWithPolicy" withResult:v29 withError:v24];
}

uint64_t __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
  if (*(void *)(a1 + 80))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_verifyEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 primary:(id)a6 secondary:(id)a7 error:(id)a8 clearingTransaction:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(SUCoreScan *)self scanFSM];
  uint64_t v22 = [v21 extendedStateQueue];
  dispatch_assert_queue_V2(v22);

  if (a9)
  {
    uint64_t v23 = [(SUCoreScan *)self scanVerifyTransaction];
    [(SUCoreScan *)self setScanVerifyTransaction:0];
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = (void *)MEMORY[0x210550B20](v15);
  [(SUCoreScan *)self _operationCompleting:v24 error:v20 clearingTransaction:a9];

  if (v15)
  {
    uint64_t v25 = [(SUCoreScan *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_2640DCE10;
    id v34 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    id v32 = v20;
    id v33 = v23;
    dispatch_async(v25, block);
  }
  else if (v23)
  {
    [MEMORY[0x263F77D78] endTransaction:v23 withName:@"scan.VerifyLatestAvailable"];
  }
  if (v20) {
    uint64_t v26 = [v20 code];
  }
  else {
    uint64_t v26 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"verifyLatestAvailableWithPolicy" withResult:v26 withError:v20];
}

uint64_t __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
  if (*(void *)(a1 + 72))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_collectEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 error:(id)a6 clearingTransaction:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(SUCoreScan *)self scanFSM];
  id v17 = [v16 extendedStateQueue];
  dispatch_assert_queue_V2(v17);

  if (v7)
  {
    id v18 = [(SUCoreScan *)self scanCollectTransaction];
    [(SUCoreScan *)self setScanCollectTransaction:0];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = (void *)MEMORY[0x210550B20](v12);
  [(SUCoreScan *)self _operationCompleting:v19 error:v15 clearingTransaction:v7];

  if (v12)
  {
    id v20 = [(SUCoreScan *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke;
    block[3] = &unk_2640DCE38;
    id v27 = v12;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = v18;
    dispatch_async(v20, block);
  }
  else if (v18)
  {
    [MEMORY[0x263F77D78] endTransaction:v18 withName:@"scan.CollectDocumentationMetadata"];
  }
  if (v15) {
    uint64_t v21 = [v15 code];
  }
  else {
    uint64_t v21 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"collectDocumentationMetadataWithPolicy" withResult:v21 withError:v15];
}

uint64_t __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  if (*(void *)(a1 + 56))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_locateEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(SUCoreScan *)self scanFSM];
  id v20 = [v19 extendedStateQueue];
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    uint64_t v21 = [(SUCoreScan *)self scanLocateTransaction];
    [(SUCoreScan *)self setScanLocateTransaction:0];
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v22 = (void *)MEMORY[0x210550B20](v14);
  [(SUCoreScan *)self _operationCompleting:v22 error:v18 clearingTransaction:v8];

  if (v14)
  {
    id v23 = [(SUCoreScan *)self clientCompletionQueue];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    id v27 = __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    id v28 = &unk_2640DCDC0;
    id v34 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v21;
    dispatch_async(v23, &v25);
  }
  else if (v21)
  {
    [MEMORY[0x263F77D78] endTransaction:v21 withName:@"scan.LocateAvailableUpdate"];
  }
  if (v18) {
    uint64_t v24 = [v18 code];
  }
  else {
    uint64_t v24 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"locateAvailableUpdateWithPolicy", v24, v18, v25, v26, v27, v28 withResult withError];
}

uint64_t __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  if (*(void *)(a1 + 64))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_cancelEndComplete:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SUCoreScan *)self scanFSM];
  int v11 = [v10 extendedStateQueue];
  dispatch_assert_queue_V2(v11);

  if (v5)
  {
    id v12 = [(SUCoreScan *)self scanCancelTransaction];
    [(SUCoreScan *)self setScanCancelTransaction:0];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = (void *)MEMORY[0x210550B20](v8);
  [(SUCoreScan *)self _operationCompleting:v13 error:v9 clearingTransaction:v5];

  if (v8)
  {
    id v14 = [(SUCoreScan *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke;
    block[3] = &unk_2640DC2C0;
    id v19 = v8;
    id v17 = v9;
    id v18 = v12;
    dispatch_async(v14, block);
  }
  else if (v12)
  {
    [MEMORY[0x263F77D78] endTransaction:v12 withName:@"scan.CancelCurrentScan"];
  }
  if (v9) {
    uint64_t v15 = [v9 code];
  }
  else {
    uint64_t v15 = 0;
  }
  [(SUCoreScan *)self _trackScanEnd:@"cancelCurrentScan" withResult:v15 withError:v9];
}

uint64_t __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(void *)(a1 + 40))
  {
    id v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

- (void)_clearCurrentOperation
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  id v4 = a1;
  __int16 v5 = 1024;
  int v6 = [a1 pendingMobileAssetRequests];
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ [MA_PENDING] clearCurrentOperation - non-zero MA pending (%d) - clearing", (uint8_t *)&v3, 0x12u);
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)_phaseName:(int)a3
{
  if (a3 > 6) {
    int v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"UNKNOWN(%d)", *(void *)&a3);
  }
  else {
    int v3 = kSUCoreScanPhaseName[a3];
  }

  return v3;
}

- (id)_operationName
{
  int v3 = [(SUCoreScan *)self scanFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  if ([(SUCoreScan *)self operation] < 0 || [(SUCoreScan *)self operation] > 4) {
    __int16 v5 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"UNKNOWN(%d)", -[SUCoreScan operation](self, "operation"));
  }
  else {
    __int16 v5 = kSUCoreScanOperationName[[(SUCoreScan *)self operation]];
  }

  return v5;
}

- (void)_operationCompleting:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a4;
  id v9 = [MEMORY[0x263F77DE8] sharedLogger];
  BOOL v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(SUCoreScan *)self _operationName];
    id v12 = (void *)v11;
    id v13 = @"calling client completion";
    if (!a3) {
      id v13 = @"has completed (no client completion)";
    }
    id v14 = @"NO";
    int v16 = 138544386;
    id v17 = self;
    if (v5) {
      id v14 = @"YES";
    }
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    id v23 = v14;
    if (v8) {
      uint64_t v15 = v8;
    }
    else {
      uint64_t v15 = @"SUCCESS";
    }
    __int16 v24 = 2114;
    uint64_t v25 = v15;
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ [clearingTransaction:%{public}@] | %{public}@", (uint8_t *)&v16, 0x34u);
  }
}

- (void)_invalidOperation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanFSM];
  int v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  id v11 = [(SUCoreScan *)self scanFSM];
  uint64_t v7 = [v11 diag];
  id v8 = [NSString alloc];
  id v9 = [(SUCoreScan *)self _operationName];
  BOOL v10 = (void *)[v8 initWithFormat:@"%@ invalid scan operation: %@", self, v9];
  [v7 trackAnomaly:v4 forReason:v10 withResult:8102 withError:0];
}

- (id)description
{
  int v3 = [(SUCoreScan *)self scanPolicy];

  if (v3)
  {
    id v4 = [(SUCoreScan *)self scanPolicy];
    BOOL v5 = [v4 softwareUpdateScanPolicy];
    int v6 = [v5 rampingScanType];

    id v7 = [NSString alloc];
    id v8 = [(SUCoreScan *)self scanUUID];
    id v9 = [(SUCoreScan *)self scanPolicy];
    BOOL v10 = [v9 softwareUpdateScanPolicy];
    if ([v10 discretionary]) {
      id v11 = @"Y";
    }
    else {
      id v11 = @"N";
    }
    if (v6)
    {
      id v12 = [(SUCoreScan *)self scanPolicy];
      id v13 = [v12 softwareUpdateScanPolicy];
      id v14 = [v13 rampingScanType];
      uint64_t v15 = (void *)[v7 initWithFormat:@"[SCAN(%@) SU disc:%@, ramp:%@]", v8, v11, v14];
    }
    else
    {
      uint64_t v15 = (void *)[v7 initWithFormat:@"[SCAN(%@) SU disc:%@]", v8, v11];
    }
  }
  else
  {
    id v16 = [NSString alloc];
    id v8 = [(SUCoreScan *)self scanUUID];
    uint64_t v15 = (void *)[v16 initWithFormat:@"[SCAN(%@)]", v8];
  }

  return v15;
}

- (int64_t)_determinePSUSAssets
{
  int v3 = [(SUCoreScan *)self scanFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"_determinePSUSAssets"];
  BOOL v5 = [(SUCoreScan *)self psusPrimaryDescriptor];
  if (v5)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__1;
    id v28 = __Block_byref_object_dispose__1;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __34__SUCoreScan__determinePSUSAssets__block_invoke;
    v23[3] = &unk_2640DCE60;
    v23[4] = self;
    void v23[5] = &v24;
    int v6 = (void *)MEMORY[0x210550B20](v23);
    id v7 = [v5 productVersion];
    id v8 = [v5 productBuildVersion];
    id v9 = [v5 trainName];
    BOOL v10 = [v5 restoreVersion];
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    [v11 setSafeObject:v7 forKey:@"OSVersion"];
    [v11 setSafeObject:v8 forKey:@"Build"];
    [v11 setSafeObject:v9 forKey:@"TrainName"];
    [v11 setSafeObject:v10 forKey:@"RestoreVersion"];
    [v11 setSafeObject:&unk_26C19D358 forKey:@"GroupNames"];
    [(SUCoreScan *)self _reportPSUSDetermineStartedEvent];
    [(SUCoreScan *)self _trackScanBegin:@"stageDetermineGroupsAvailableForUpdate"];
    uint64_t v12 = [MEMORY[0x263EFF910] now];
    id v13 = (void *)v25[5];
    v25[5] = v12;

    objc_msgSend(MEMORY[0x263F55960], "SUCoreBorder_stageDetermineGroupsAvailableForUpdate:completion:", v11, v6);
    _Block_object_dispose(&v24, 8);

    int64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@ psus descriptor is nil", self];
    id v16 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v14 = 8411;
    id v17 = [v16 buildError:8411 underlying:0 description:v15];

    __int16 v18 = [(SUCoreScan *)self scanFSM];
    uint64_t v19 = [v18 diag];
    [v19 trackAnomaly:@"[SCAN] PSUS" forReason:v15 withResult:8411 withError:v17];

    __int16 v20 = [[SUCoreScanParam alloc] initWithResult:8411 withError:v17];
    uint64_t v21 = [(SUCoreScan *)self scanFSM];
    [v21 postProtectedEvent:@"PSUSAssetsDetermineFailed" withInfo:v20];
  }
  return v14;
}

void __34__SUCoreScan__determinePSUSAssets__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [MEMORY[0x263EFF910] now];
  [v10 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  double v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withResult:withError:", @"stageDetermineGroupsAvailableForUpdate", objc_msgSend(v9, "code"), v9);
  if (!v9)
  {
    uint64_t v15 = [v8 safeULLForKey:@"STAGE_GROUP_REQUIRED" defaultValue:0];
    uint64_t v16 = [v8 safeULLForKey:@"STAGE_GROUP_OPTIONAL" defaultValue:0];
    id v17 = NSString;
    __int16 v18 = [*(id *)(a1 + 32) psusPrimaryDescriptor];
    uint64_t v19 = [v18 summary];
    __int16 v20 = [v17 stringWithFormat:@"found assets with {requiredSize=%llu, optionalSize=%llu} for %@", v15, v16, v19];

    uint64_t v21 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v47 = v23;
      __int16 v48 = 2114;
      id v49 = v20;
      __int16 v50 = 2048;
      uint64_t v51 = [v7 count];
      __int16 v52 = 2114;
      id v53 = v8;
      _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ [PreSUStaging] succeeded; %{public}@\n"
        "[>>>\n"
        "byGroupAvailableForStagingAttributes = DICT[%lu]\n"
        "byGroupTotalExpectedBytes = %{public}@\n"
        "<<<]",
        buf,
        0x2Au);
    }

    uint64_t v24 = [[SUCoreScanParam alloc] initWithNote:v20];
    uint64_t v25 = [(SUCoreScanParam *)v24 additionalInfo];
    uint64_t v26 = v25;
    id v27 = @"PSUSAssetsSizes";
    id v28 = v8;
    goto LABEL_17;
  }
  id v13 = [v9 domain];
  if (![v13 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {

    goto LABEL_9;
  }
  uint64_t v14 = [v9 code];

  if (v14 != 6602)
  {
LABEL_9:
    id v29 = [v9 domain];
    if ([v29 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
    {
      uint64_t v30 = [v9 code];

      if (v30 == 6609)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Operation canceled", v44, v45);
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v35 = NSString;
    id v36 = [*(id *)(a1 + 32) psusPrimaryDescriptor];
    id v37 = [v36 summary];
    __int16 v20 = [v35 stringWithFormat:@"failed to determine for %@ with %@, but this is non-fatal", v37, v9];

    id v38 = [MEMORY[0x263F77DE8] sharedLogger];
    id v39 = [v38 oslog];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v40;
      __int16 v48 = 2114;
      id v49 = v20;
      _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ [PreSUStaging] %{public}@", buf, 0x16u);
    }

    uint64_t v24 = [[SUCoreScanParam alloc] initWithNote:v20];
    uint64_t v25 = [(SUCoreScanParam *)v24 additionalInfo];
    uint64_t v26 = v25;
    id v27 = @"PSUSDetermineError";
    id v28 = v9;
LABEL_17:
    [v25 setSafeObject:v28 forKey:v27];

    id v34 = @"PSUSAssetsDetermineSuccess";
    goto LABEL_18;
  }
  [NSString stringWithFormat:@"Failed to determine PSUS, assets: %@, bytes: %@", v7, v8];
  id v31 = LABEL_12:;
  id v32 = [MEMORY[0x263F77D78] sharedCore];
  id v33 = [v32 buildError:8411 underlying:v9 description:v31];

  uint64_t v24 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", [v33 code], v33);
  id v34 = @"PSUSAssetsDetermineFailed";
LABEL_18:
  id v41 = [(SUCoreScanParam *)v24 additionalInfo];
  id v42 = [NSNumber numberWithDouble:v12];
  [v41 setSafeObject:v42 forKey:@"Duration"];

  uint64_t v43 = [*(id *)(a1 + 32) scanFSM];
  [v43 postEvent:v34 withInfo:v24];
}

+ (BOOL)isPreSUStagingEnabledForUpdate:(id)a3 policy:(id)a4 reason:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 enablePreSUStaging])
  {
    if ([v8 enablePreSUStaging])
    {
      if (_MSUPreferencesGetAppBooleanValueWithDefaultValue())
      {
        int v9 = 0;
        BOOL v10 = @"disabled by MSU default";
      }
      else if ([v7 splatOnly])
      {
        int v9 = 0;
        BOOL v10 = @"disabled for a Splat update";
      }
      else if ([v7 descriptorType] == 3)
      {
        int v9 = 0;
        BOOL v10 = @"disabled for SFR-only updates";
      }
      else
      {
        int v15 = os_variant_uses_ephemeral_storage();
        if (v15) {
          BOOL v10 = @"disabled in limited environment (NeRD)";
        }
        else {
          BOOL v10 = @"not disabled by anything";
        }
        int v9 = v15 ^ 1;
      }
    }
    else
    {
      int v9 = 0;
      BOOL v10 = @"disabled by policy";
    }
  }
  else
  {
    int v9 = 0;
    BOOL v10 = @"disabled by server (through software update asset metadata)";
  }
  if (a5)
  {
    *a5 = v10;
  }
  else
  {
    double v11 = [MEMORY[0x263F77DE8] sharedLogger];
    double v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"disabled";
      if (v9) {
        id v13 = @"enabled";
      }
      int v16 = 138543618;
      id v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[PreSUStaging] %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  return v9;
}

- (int64_t)_downloadCatalog:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreScan *)self scanFSM];
  int v9 = [v8 extendedStateQueue];
  dispatch_assert_queue_V2(v9);

  [(SUCoreScan *)self _incrementMobileAssetPending:@"_downloadCatalog"];
  int v10 = [(SUCoreScan *)self operation];
  if ((v10 - 1) < 2)
  {
    double v11 = [(SUCoreScan *)self scanPolicy];
    double v12 = [(SUCoreScan *)self scanUUID];
    uint64_t v14 = [(SUCoreScan *)self alternateAssetAudienceUUID];
    id v13 = [v11 constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:v12 assetAudience:v14];

    goto LABEL_6;
  }
  if (v10 != 3)
  {
    if (v10 != 4)
    {
      id v26 = [NSString alloc];
      id v27 = [(SUCoreScan *)self _operationName];
      id v13 = (void *)[v26 initWithFormat:@"downloadCatalog received unsupported SUCoreScanOperation (%@)", v27];

      id v28 = [MEMORY[0x263F77DE8] sharedLogger];
      int v16 = [v28 oslog];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SUCoreScan _downloadCatalog:withIdentifier:]();
      }
      goto LABEL_19;
    }
    double v11 = [(SUCoreScan *)self scanPolicy];
    double v12 = [(SUCoreScan *)self scanUUID];
    id v13 = [v11 constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:v12 assetAudience:0];
LABEL_6:

    if (!v13)
    {
      id v15 = [NSString alloc];
      int v16 = [(SUCoreScan *)self _operationName];
      id v17 = [(SUCoreScan *)self scanPolicy];
      __int16 v18 = [v17 summary];
      uint64_t v19 = [v15 initWithFormat:@"failed to construct MA SU catalog download options (for %@) from scan policy[%@]", v16, v18];
LABEL_18:
      id v13 = (void *)v19;

LABEL_19:
      id v33 = [MEMORY[0x263F77D78] sharedCore];
      int64_t v31 = 8100;
      id v29 = [v33 buildError:8100 underlying:0 description:v13];

      id v34 = [(SUCoreScan *)self scanFSM];
      id v35 = [[SUCoreScanParam alloc] initWithResult:8100 withError:v29];
      [v34 postProtectedEvent:@"CatalogDownloadFailed" withInfo:v35];

      goto LABEL_20;
    }
    goto LABEL_9;
  }
  uint64_t v20 = [(SUCoreScan *)self scanPolicy];
  uint64_t v21 = [(SUCoreScan *)self scanUUID];
  __int16 v22 = [(SUCoreScan *)self activeDescriptor];
  id v13 = [v20 constructMADocumentationCatalogDownloadOptionsWithUUID:v21 usingDescriptor:v22];

  if (!v13)
  {
    id v32 = [NSString alloc];
    int v16 = [(SUCoreScan *)self _operationName];
    id v17 = [(SUCoreScan *)self scanPolicy];
    __int16 v18 = [v17 summary];
    uint64_t v19 = [v32 initWithFormat:@"failed to construct MA documentation catalog download options (for %@) from scan policy[%@]", v16, v18];
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v23 = [v13 additionalServerParams];
  uint64_t v24 = v23;
  if (v23) {
    id v25 = v23;
  }
  else {
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v29 = v25;

  [v29 setSafeObject:&unk_26C19D2A0 forKey:@"ScanRequestCount"];
  if ([(SUCoreScan *)self phase] >= 3) {
    [v29 setSafeObject:&unk_26C19D2B8 forKey:@"ScanRequestCount"];
  }
  [v13 setAdditionalServerParams:v29];
  [(SUCoreScan *)self _trackScanBegin:@"startCatalogDownload" withIdentifier:v7];
  uint64_t v30 = (void *)MEMORY[0x263F55938];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke;
  v37[3] = &unk_2640DCC30;
  void v37[4] = self;
  id v38 = v7;
  objc_msgSend(v30, "SUCoreBorder_startCatalogDownload:options:completionWithError:", v6, v13, v37);

  int64_t v31 = 0;
LABEL_20:

  return v31;
}

void __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", @"startCatalogDownload", *(void *)(a1 + 40), a2);
  switch(a2)
  {
    case 0:
      goto LABEL_4;
    case 18:
      uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"failed to download catalog - no match found (MADownload domain result:%ld)", 18);
      break;
    case 10:
LABEL_4:
      BOOL v5 = [*(id *)(a1 + 32) scanFSM];
      [v5 postEvent:@"CatalogDownloadSuccess"];
      goto LABEL_8;
    default:
      uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"failed to download catalog (MADownload domain result:%ld)", a2);
      break;
  }
  BOOL v5 = (void *)v6;
  id v7 = [MEMORY[0x263F77D78] sharedCore];
  id v8 = [v7 buildError:8400 underlying:v11 description:v5];

  int v9 = [*(id *)(a1 + 32) scanFSM];
  int v10 = [[SUCoreScanParam alloc] initWithResult:a2 withError:v8];
  [v9 postEvent:@"CatalogDownloadFailed" withInfo:v10];

LABEL_8:
}

- (void)_filterSUQueryResults:(id)a3
{
  id v12 = a3;
  if ([(SUCoreScan *)self operationSPIType] == 1
    || [(SUCoreScan *)self operationSPIType] == 3
    || [(SUCoreScan *)self phase] == 2)
  {
    [(SUCoreScan *)self _filterSUQueryResultsForSPITypeSingleFromQuery:v12];
  }
  else if ([(SUCoreScan *)self operationSPIType] == 2)
  {
    [(SUCoreScan *)self _filterSUQueryResultsForSPITypeMajorMinorFromQuery:v12];
  }
  else
  {
    id v4 = [MEMORY[0x263F77D78] sharedCore];
    BOOL v5 = (void *)[[NSString alloc] initWithFormat:@"%@ unknown operationSPIType found (%i)", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
    uint64_t v6 = [v4 buildError:8117 underlying:0 description:v5];

    id v7 = [(SUCoreScan *)self scanFSM];
    id v8 = [v7 diag];
    int v9 = [v6 localizedDescription];
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", @"[SCAN] FILTER_SU_QUERY", v9, objc_msgSend(v6, "code"), v6);

    int v10 = [(SUCoreScan *)self scanFSM];
    id v11 = [[SUCoreScanParam alloc] initWithResult:8117 withError:v6];
    [v10 postEvent:@"QueryMetadataFailed" withInfo:v11];
  }
}

- (void)_filterSUQueryResultsForSPITypeSingleFromQuery:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanPolicy];
  id v45 = 0;
  id v46 = 0;
  [v5 selectSoftwareUpdatePrimaryAsset:&v46 secondaryAsset:&v45 fromAssetQuery:v4];
  id v6 = v46;
  id v7 = v45;

  if (v6)
  {
    int v8 = [(SUCoreScan *)self operation];
    if ((v8 - 1) < 2)
    {
      id v26 = [v4 postedDate];

      if (v26)
      {
        uint64_t v27 = [v4 postedDate];
      }
      else
      {
        id v33 = [MEMORY[0x263F77DE8] sharedLogger];
        id v34 = [v33 oslog];

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v48 = self;
          _os_log_impl(&dword_20C8EA000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset query did not return posting date. Setting posting date to now", buf, 0xCu);
        }

        uint64_t v27 = [MEMORY[0x263EFF910] date];
      }
      uint64_t v23 = (void *)v27;
      id v35 = [SUCoreDescriptor alloc];
      id v36 = [(SUCoreScan *)self scanPolicy];
      id v37 = [v36 defaultDescriptorValues];
      uint64_t v38 = [(SUCoreDescriptor *)v35 initWithSUAsset:v6 releaseDate:v23 defaultValues:v37];

      if (v7)
      {
        id v39 = [SUCoreDescriptor alloc];
        uint64_t v40 = [(SUCoreScan *)self scanPolicy];
        id v41 = [v40 defaultDescriptorValues];
        uint64_t v24 = [(SUCoreDescriptor *)v39 initWithSUAsset:v7 releaseDate:v23 defaultValues:v41];
      }
      else
      {
        uint64_t v24 = 0;
      }
      id v28 = [(SUCoreScan *)self scanFSM];
      id v42 = [SUCoreScanParam alloc];
      if (v38)
      {
        uint64_t v43 = [(SUCoreScanParam *)v42 initWithDescriptor:v38 withFallbackDescriptor:v24];
        [v28 postEvent:@"QueryMetadataUpdateAvailable" withInfo:v43];

        uint64_t v24 = (SUCoreScanParam *)v38;
        goto LABEL_27;
      }
      uint64_t v44 = [(SUCoreScanParam *)v42 initWithResult:8406 withError:0];
      [v28 postEvent:@"QueryMetadataNoAssetFound" withInfo:v44];
    }
    else
    {
      if (v8 == 3)
      {
        uint64_t v23 = [(SUCoreScan *)self scanFSM];
        uint64_t v24 = [v23 diag];
        id v28 = (void *)[[NSString alloc] initWithFormat:@"%@ SUCoreScanOperation (SU_SCAN_OP_COLLECT) should never filter SU query results", self];
        id v29 = @"[SCAN] FILTER_SU_QUERY";
        uint64_t v30 = v24;
        int64_t v31 = v28;
        uint64_t v32 = 8115;
      }
      else
      {
        if (v8 == 4)
        {
          int v9 = [(SUCoreScan *)self primaryUpdateAsset];

          if (v9)
          {
            int v10 = [(SUCoreScan *)self scanFSM];
            id v11 = [v10 diag];
            id v12 = [NSString alloc];
            id v13 = [(SUCoreScan *)self primaryUpdateAsset];
            uint64_t v14 = [v13 assetId];
            id v15 = (void *)[v12 initWithFormat:@"%@ discarding existing primary update asset ID:%@", self, v14];
            [v11 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v15 withResult:8111 withError:0];
          }
          [(SUCoreScan *)self setPrimaryUpdateAsset:v6];
          int v16 = [(SUCoreScan *)self secondaryUpdateAsset];

          if (v16)
          {
            id v17 = [(SUCoreScan *)self scanFSM];
            __int16 v18 = [v17 diag];
            id v19 = [NSString alloc];
            uint64_t v20 = [(SUCoreScan *)self secondaryUpdateAsset];
            uint64_t v21 = [v20 assetId];
            __int16 v22 = (void *)[v19 initWithFormat:@"%@ discarding existing secondary update asset ID:%@", self, v21];
            [v18 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v22 withResult:8111 withError:0];
          }
          [(SUCoreScan *)self setSecondaryUpdateAsset:v7];
          uint64_t v23 = [(SUCoreScan *)self scanFSM];
          uint64_t v24 = objc_alloc_init(SUCoreScanParam);
          id v25 = @"QueryMetadataUpdateAvailable";
          goto LABEL_11;
        }
        uint64_t v23 = [(SUCoreScan *)self scanFSM];
        uint64_t v24 = [v23 diag];
        id v28 = (void *)[[NSString alloc] initWithFormat:@"%@ filter SU query results for unknown operation:%d", self, -[SUCoreScan operation](self, "operation")];
        id v29 = @"[SCAN] UNKNOWN OPERATION";
        uint64_t v30 = v24;
        int64_t v31 = v28;
        uint64_t v32 = 8117;
      }
      [(SUCoreScanParam *)v30 trackAnomaly:v29 forReason:v31 withResult:v32 withError:0];
    }

    goto LABEL_27;
  }
  uint64_t v23 = [(SUCoreScan *)self scanFSM];
  uint64_t v24 = [[SUCoreScanParam alloc] initWithResult:8406 withError:0];
  id v25 = @"QueryMetadataNoAssetFound";
LABEL_11:
  [v23 postEvent:v25 withInfo:v24];
LABEL_27:
}

- (void)_filterSUQueryResultsForSPITypeMajorMinorFromQuery:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SUCoreScan *)self operation] == 1)
  {
    BOOL v5 = [(SUCoreScan *)self scanPolicy];
    id v42 = 0;
    id v43 = 0;
    id v40 = 0;
    id v41 = 0;
    [v5 selectSoftwareUpdateMajorPrimaryAsset:&v43 majorSecondaryAsset:&v42 minorPrimaryAsset:&v41 minorSecondaryAsset:&v40 fromAssetQuery:v4];
    id v6 = v43;
    id v7 = v42;
    uint64_t v8 = (uint64_t)v41;
    id v39 = v40;

    int v9 = [v4 postedDate];

    if (v9)
    {
      uint64_t v10 = [v4 postedDate];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F77DE8] sharedLogger];
      id v15 = [v14 oslog];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v45 = self;
        _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset query did not return posting date. Setting posting date to now", buf, 0xCu);
      }

      uint64_t v10 = [MEMORY[0x263EFF910] date];
    }
    int v16 = (void *)v10;
    if (v6)
    {
      id v17 = [SUCoreDescriptor alloc];
      __int16 v18 = [(SUCoreScan *)self scanPolicy];
      id v19 = [v18 defaultDescriptorValues];
      uint64_t v37 = [(SUCoreDescriptor *)v17 initWithSUAsset:v6 releaseDate:v16 defaultValues:v19];
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v38 = (void *)v8;
    id v36 = v7;
    if (v7)
    {
      uint64_t v20 = [SUCoreDescriptor alloc];
      uint64_t v21 = [(SUCoreScan *)self scanPolicy];
      __int16 v22 = [v21 defaultDescriptorValues];
      uint64_t v23 = [(SUCoreDescriptor *)v20 initWithSUAsset:v7 releaseDate:v16 defaultValues:v22];

      uint64_t v8 = (uint64_t)v38;
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v24 = v6;
    if (v8)
    {
      id v25 = [SUCoreDescriptor alloc];
      id v26 = [(SUCoreScan *)self scanPolicy];
      uint64_t v27 = [v26 defaultDescriptorValues];
      uint64_t v8 = [(SUCoreDescriptor *)v25 initWithSUAsset:v8 releaseDate:v16 defaultValues:v27];
    }
    if (v39)
    {
      id v28 = [SUCoreDescriptor alloc];
      id v29 = [(SUCoreScan *)self scanPolicy];
      uint64_t v30 = [v29 defaultDescriptorValues];
      int64_t v31 = [(SUCoreDescriptor *)v28 initWithSUAsset:v39 releaseDate:v16 defaultValues:v30];
    }
    else
    {
      int64_t v31 = 0;
    }
    uint64_t v32 = [(SUCoreScan *)self scanFSM];
    id v33 = [SUCoreScanParam alloc];
    if (v37 | v8)
    {
      id v34 = [(SUCoreScanParam *)v33 initWithMajorPrimaryDescriptor:v37 majorSecondaryDescriptor:v23 minorPrimaryDescriptor:v8 minorSecondaryDescriptor:v31];
      id v35 = @"QueryMetadataUpdateAvailable";
    }
    else
    {
      id v34 = [(SUCoreScanParam *)v33 initWithResult:8406 withError:0];
      id v35 = @"QueryMetadataNoAssetFound";
    }
    [v32 postEvent:v35 withInfo:v34];
  }
  else
  {
    id v11 = [(SUCoreScan *)self scanFSM];
    id v12 = [v11 diag];
    id v13 = (void *)[[NSString alloc] initWithFormat:@"%@ SU_SCAN_OP_CHECK is not supported for current operation", self];
    [v12 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v13 withResult:8117 withError:0];
  }
}

- (void)_filterDocQueryResults:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanPolicy];
  id v18 = 0;
  [v5 selectDocumentationAsset:&v18 fromAssetQuery:v4];

  id v6 = v18;
  if (v6)
  {
    id v7 = [(SUCoreScan *)self activeDescriptor];
    objc_msgSend(v7, "assignDocumentationFromAsset:extendingBundleProperties:", v6, objc_msgSend(v6, "wasLocal"));

    LODWORD(v7) = [(SUCoreScan *)self downloadDocumentation];
    uint64_t v8 = [(SUCoreScan *)self scanFSM];
    int v9 = v8;
    if (v7) {
      uint64_t v10 = @"QueryMetadataNeedDoc";
    }
    else {
      uint64_t v10 = @"QueryMetadataSuccess";
    }
LABEL_12:
    [v8 postEvent:v10];
    goto LABEL_13;
  }
  id v11 = [MEMORY[0x263F77DA0] sharedDevice];
  int v12 = [v11 requiresDocAssetForUpdate];

  id v13 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v14 = [v13 oslog];

  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [MEMORY[0x263F77DA0] sharedDevice];
      id v17 = [v16 deviceClass];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = v17;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ documentation not required for device: %{public}@", buf, 0x16u);
    }
    uint64_t v8 = [(SUCoreScan *)self scanFSM];
    int v9 = v8;
    uint64_t v10 = @"QueryMetadataSuccess";
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SUCoreScan _filterDocQueryResults:]((uint64_t)self, v14);
  }

  int v9 = [(SUCoreScan *)self scanFSM];
  id v15 = [[SUCoreScanParam alloc] initWithResult:8407 withError:0];
  [v9 postEvent:@"QueryMetadataNoAssetFound" withInfo:v15];

LABEL_13:
}

- (void)_incrementMobileAssetPending:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  [(SUCoreScan *)self setPendingMobileAssetRequests:[(SUCoreScan *)self pendingMobileAssetRequests] + 1];
  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1024;
    int v14 = [(SUCoreScan *)self pendingMobileAssetRequests];
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [MA_PENDING(INCR)] %{public}@ - incremented MA pending (%d remaining)", (uint8_t *)&v9, 0x1Cu);
  }
}

- (int64_t)_decrementMobileAssetPending:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUCoreScan *)self pendingMobileAssetRequests] < 1)
  {
    uint64_t v10 = [(SUCoreScan *)self scanFSM];
    uint64_t v11 = [v10 diag];
    id v12 = (void *)[[NSString alloc] initWithFormat:@"%@ MobileAsset operation completed when nothing pending (%@)", self, v4];
    [(id)v11 trackAnomaly:@"[SCAN] MA_PENDING(DECR)" forReason:v12 withResult:8117 withError:0];

    LODWORD(v11) = [(SUCoreScan *)self pendingMobileAssetRequests];
    __int16 v13 = [MEMORY[0x263F77DE8] sharedLogger];
    int v14 = [v13 oslog];

    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v11 & 0x80000000) != 0)
    {
      if (v15) {
        [(SUCoreScan *)self _decrementMobileAssetPending:v14];
      }

      [(SUCoreScan *)self setPendingMobileAssetRequests:0];
    }
    else
    {
      if (v15) {
        -[SUCoreScan _decrementMobileAssetPending:]();
      }
    }
    int64_t v9 = 8117;
  }
  else
  {
    [(SUCoreScan *)self setPendingMobileAssetRequests:[(SUCoreScan *)self pendingMobileAssetRequests] - 1];
    id v7 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = [(SUCoreScan *)self pendingMobileAssetRequests];
      _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [MA_PENDING(DECR)] %{public}@ - decremented MA pending (%d remaining)", buf, 0x1Cu);
    }

    int64_t v9 = 0;
  }

  return v9;
}

- (void)_trackScanBegin:(id)a3
{
}

- (void)_trackScanBegin:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SUCoreScan *)self scanFSM];
  uint64_t v8 = [v9 diag];
  [v8 trackBegin:v7 atLevel:1 forModule:@"scan" withIdentifier:v6];
}

- (void)_trackScanEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

- (void)_trackScanEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(SUCoreScan *)self scanFSM];
  __int16 v13 = [v14 diag];
  [v13 trackEnd:v12 atLevel:1 forModule:@"scan" withIdentifier:v11 withResult:a5 withError:v10];
}

- (id)_createEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUCoreScan *)self scanFSM];
  id v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setSafeObject:v4 forKey:*MEMORY[0x263F780B0]];

  uint64_t v8 = [(SUCoreScan *)self scanUUID];
  [v7 setSafeObject:v8 forKey:*MEMORY[0x263F78130]];

  id v9 = objc_alloc_init(SUCoreEventAugmenter);
  id v10 = [(SUCoreScan *)self scanPolicy];
  [(SUCoreEventAugmenter *)v9 setPolicy:v10];

  id v11 = [(SUCoreScan *)self psusPrimaryDescriptor];
  [(SUCoreEventAugmenter *)v9 setPrimaryDescriptor:v11];

  [(SUCoreEventAugmenter *)v9 augmentEvent:v7];

  return v7;
}

- (void)_reportPSUSDetermineStartedEvent
{
  int v3 = [(SUCoreScan *)self scanFSM];
  id v4 = [v3 extendedStateQueue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(SUCoreScan *)self _createEvent:*MEMORY[0x263F780F8]];
  [v5 setSafeObject:*MEMORY[0x263F780C8] forKey:*MEMORY[0x263F780B8]];
  id v6 = [MEMORY[0x263F77D78] sharedCore];
  id v7 = [v6 miscellaneousTaksQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUCoreScan__reportPSUSDetermineStartedEvent__block_invoke;
  block[3] = &unk_2640DC338;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __46__SUCoreScan__reportPSUSDetermineStartedEvent__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F77DC0] sharedReporter];
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_reportPSUSDetermineFinishedEvent:(id)a3 duration:(double)a4
{
  id v6 = a3;
  id v7 = [(SUCoreScan *)self scanFSM];
  id v8 = [v7 extendedStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SUCoreScan *)self _createEvent:*MEMORY[0x263F780F0]];
  id v10 = v9;
  if (v6) {
    [MEMORY[0x263F77DC0] augmentEvent:v9 withError:v6];
  }
  else {
    [v9 setSafeObject:*MEMORY[0x263F780C8] forKey:*MEMORY[0x263F780B8]];
  }
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", (unint64_t)a4);
  [v10 setSafeObject:v11 forKey:*MEMORY[0x263F77F48]];

  id v12 = [MEMORY[0x263F77D78] sharedCore];
  __int16 v13 = [v12 miscellaneousTaksQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUCoreScan__reportPSUSDetermineFinishedEvent_duration___block_invoke;
  block[3] = &unk_2640DC338;
  id v16 = v10;
  id v14 = v10;
  dispatch_async(v13, block);
}

void __57__SUCoreScan__reportPSUSDetermineFinishedEvent_duration___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F77DC0] sharedReporter];
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (id)_simDescriptorAttributes
{
  v22[38] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"dd-MMM-yy"];
  id v16 = [v2 dateFromString:@"07-Jul-07"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  v21[0] = @"OSVersion";
  v21[1] = @"Build";
  v22[0] = @"9.9.13.0";
  v22[1] = @"17A408a";
  v21[2] = @"SUProductSystemName";
  v21[3] = @"ReleaseType";
  v22[2] = @"iOS";
  v22[3] = @"Internal";
  v21[4] = @"SUPublisher";
  v21[5] = @"ReleaseDate";
  v22[4] = @"Apple Inc.";
  v22[5] = v16;
  v21[6] = @"SupportedDevices";
  id v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"D11AP", 0);
  v22[6] = v4;
  v21[7] = *MEMORY[0x263F55888];
  BOOL v5 = [NSNumber numberWithUnsignedLongLong:3209145381];
  v22[7] = v5;
  v21[8] = *MEMORY[0x263F558A0];
  id v6 = [NSNumber numberWithUnsignedLongLong:3309669376];
  v22[8] = v6;
  v21[9] = @"ActualMinimumSystemPartition";
  id v7 = [NSNumber numberWithUnsignedLongLong:5674];
  uint64_t v8 = *MEMORY[0x263F55890];
  uint64_t v9 = MEMORY[0x263EFFA88];
  v22[9] = v7;
  v22[10] = MEMORY[0x263EFFA88];
  v21[10] = v8;
  v21[11] = @"SystemPartitionPadding";
  v22[11] = MEMORY[0x263EFFA78];
  v22[12] = MEMORY[0x263EFFA88];
  v21[12] = @"AutomaticDownloadOver3G";
  v21[13] = @"AllowableOverCellular";
  v22[13] = MEMORY[0x263EFFA88];
  v22[14] = MEMORY[0x263EFFA88];
  v21[14] = @"AllowableOTA";
  v21[15] = @"SUDisableSiriVoiceDeletion";
  v22[15] = MEMORY[0x263EFFA88];
  v22[16] = MEMORY[0x263EFFA88];
  v21[16] = @"SUDisableCDLevel4";
  v21[17] = @"SUDisableAppDemotion";
  v22[17] = MEMORY[0x263EFFA88];
  v22[18] = MEMORY[0x263EFFA88];
  v21[18] = @"SUInstallTonightEnabled";
  v21[19] = @"Ramp";
  v22[19] = MEMORY[0x263EFFA88];
  v21[20] = @"MDMDelayInterval";
  id v10 = [NSNumber numberWithUnsignedLongLong:24];
  v22[20] = v10;
  v22[21] = v9;
  v21[21] = @"AutoUpdate";
  v21[22] = @"SetupCritical";
  v22[22] = @"kSUAssetSetupCriticalKey";
  v22[23] = v9;
  v21[23] = @"SetupCriticalCellularOverride";
  v21[24] = @"SetupCriticalUpdateOutOfBoxOnly";
  v22[24] = v9;
  v22[25] = @"kSUAssetLastEmergencyBuildKey";
  v21[25] = @"LastEmergencyBuild";
  v21[26] = @"LastEmergencyOSVersion";
  v22[26] = @"kSUAssetLastEmergencyOSVersionKey";
  v22[27] = v3;
  v21[27] = @"SEPDigest";
  v21[28] = @"SEPTBMDigests";
  v22[28] = v3;
  v22[29] = v3;
  v21[29] = @"RSEPDigest";
  v21[30] = @"RSEPTBMDigests";
  v22[30] = v3;
  v22[31] = @"PreRelease";
  v21[31] = @"SUDocumentationID";
  v21[32] = @"Language";
  v22[32] = @"kSUAssetLanguageKey";
  v22[33] = @"kSUAssetReleaseNotesSummaryFileNameKey";
  v21[33] = @"ReleaseNotesSummaryFileName";
  v21[34] = @"ReleaseNotesFileName";
  v22[34] = @"kSUAssetReleaseNotesFileNameKey";
  v22[35] = @"kSUAssetLicenseAgreementFileNameKey";
  v21[35] = @"LicenseAgreementFileName";
  v21[36] = @"_Measurement";
  v21[37] = @"_MeasurementAlgorithm";
  v22[36] = v3;
  v22[37] = @"SHA-1";
  id v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:38];

  v19[0] = @"AssetProperties";
  v19[1] = @"AssetAddedProperties";
  v20[0] = v11;
  v17[0] = @"AssetState";
  id v12 = [NSNumber numberWithInt:1];
  v18[0] = v12;
  v18[1] = @"com.apple.MobileAsset.SoftwareUpdateCoreTest";
  v17[1] = @"AssetType";
  v17[2] = @"AssetId";
  v18[2] = @"ma-asset-id";
  __int16 v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[1] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v14;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)operationSPIType
{
  return self->_operationSPIType;
}

- (void)setOperationSPIType:(int)a3
{
  self->_operationSPIType = a3;
}

- (BOOL)cancelingOperation
{
  return self->_cancelingOperation;
}

- (void)setCancelingOperation:(BOOL)a3
{
  self->_cancelingOperation = a3;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (SUCoreDescriptor)activeDescriptor
{
  return self->_activeDescriptor;
}

- (void)setActiveDescriptor:(id)a3
{
}

- (BOOL)downloadDocumentation
{
  return self->_downloadDocumentation;
}

- (void)setDownloadDocumentation:(BOOL)a3
{
  self->_downloadDocumentation = a3;
}

- (int)pendingMobileAssetRequests
{
  return self->_pendingMobileAssetRequests;
}

- (void)setPendingMobileAssetRequests:(int)a3
{
  self->_pendingMobileAssetRequests = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (SUCoreMobileAsset)maDocumentationControl
{
  return self->_maDocumentationControl;
}

- (void)setMaDocumentationControl:(id)a3
{
}

- (MAAsset)primaryUpdateAsset
{
  return self->_primaryUpdateAsset;
}

- (void)setPrimaryUpdateAsset:(id)a3
{
}

- (MAAsset)secondaryUpdateAsset
{
  return self->_secondaryUpdateAsset;
}

- (void)setSecondaryUpdateAsset:(id)a3
{
}

- (id)checkCompletion
{
  return self->_checkCompletion;
}

- (void)setCheckCompletion:(id)a3
{
}

- (id)checkMajorMinorCompletion
{
  return self->_checkMajorMinorCompletion;
}

- (void)setCheckMajorMinorCompletion:(id)a3
{
}

- (id)checkSlowReleaseCompletion
{
  return self->_checkSlowReleaseCompletion;
}

- (void)setCheckSlowReleaseCompletion:(id)a3
{
}

- (id)verifyCompletion
{
  return self->_verifyCompletion;
}

- (void)setVerifyCompletion:(id)a3
{
}

- (id)collectCompletion
{
  return self->_collectCompletion;
}

- (void)setCollectCompletion:(id)a3
{
}

- (id)locateCompletion
{
  return self->_locateCompletion;
}

- (void)setLocateCompletion:(id)a3
{
}

- (id)cancelCompletion
{
  return self->_cancelCompletion;
}

- (void)setCancelCompletion:(id)a3
{
}

- (SUCorePolicy)originalScanPolicy
{
  return self->_originalScanPolicy;
}

- (void)setOriginalScanPolicy:(id)a3
{
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_phase = a3;
}

- (SUCoreScanParam)interimScanResult
{
  return self->_interimScanResult;
}

- (void)setInterimScanResult:(id)a3
{
}

- (SUCoreDescriptor)psusPrimaryDescriptor
{
  return self->_psusPrimaryDescriptor;
}

- (void)setPsusPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)psusSecondaryDescriptor
{
  return self->_psusSecondaryDescriptor;
}

- (void)setPsusSecondaryDescriptor:(id)a3
{
}

- (OS_os_transaction)scanCheckTransaction
{
  return self->_scanCheckTransaction;
}

- (void)setScanCheckTransaction:(id)a3
{
}

- (OS_os_transaction)scanVerifyTransaction
{
  return self->_scanVerifyTransaction;
}

- (void)setScanVerifyTransaction:(id)a3
{
}

- (OS_os_transaction)scanCollectTransaction
{
  return self->_scanCollectTransaction;
}

- (void)setScanCollectTransaction:(id)a3
{
}

- (OS_os_transaction)scanLocateTransaction
{
  return self->_scanLocateTransaction;
}

- (void)setScanLocateTransaction:(id)a3
{
}

- (OS_os_transaction)scanCancelTransaction
{
  return self->_scanCancelTransaction;
}

- (void)setScanCancelTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanCancelTransaction, 0);
  objc_storeStrong((id *)&self->_scanLocateTransaction, 0);
  objc_storeStrong((id *)&self->_scanCollectTransaction, 0);
  objc_storeStrong((id *)&self->_scanVerifyTransaction, 0);
  objc_storeStrong((id *)&self->_scanCheckTransaction, 0);
  objc_storeStrong((id *)&self->_psusSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_psusPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_interimScanResult, 0);
  objc_storeStrong((id *)&self->_originalScanPolicy, 0);
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong(&self->_locateCompletion, 0);
  objc_storeStrong(&self->_collectCompletion, 0);
  objc_storeStrong(&self->_verifyCompletion, 0);
  objc_storeStrong(&self->_checkSlowReleaseCompletion, 0);
  objc_storeStrong(&self->_checkMajorMinorCompletion, 0);
  objc_storeStrong(&self->_checkCompletion, 0);
  objc_storeStrong((id *)&self->_secondaryUpdateAsset, 0);
  objc_storeStrong((id *)&self->_primaryUpdateAsset, 0);
  objc_storeStrong((id *)&self->_maDocumentationControl, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_activeDescriptor, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
  objc_storeStrong((id *)&self->_scanFSM, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);

  objc_storeStrong((id *)&self->_scanUUID, 0);
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ [DUAL_AUDIENCE] Dropping no update found alternate scan error: %{public}@");
}

- (void)_downloadCatalog:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ %{public}@");
}

- (void)_filterDocQueryResults:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ no documentation asset (after filtering/selection)", (uint8_t *)&v2, 0xCu);
}

- (void)_decrementMobileAssetPending:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 138543874;
  BOOL v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = [a1 pendingMobileAssetRequests];
  _os_log_error_impl(&dword_20C8EA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ [MA_PENDING(DECR)] %{public}@ - negative MA pending (%d) - clearing", (uint8_t *)&v4, 0x1Cu);
}

- (void)_decrementMobileAssetPending:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20C8EA000, v0, v1, "%{public}@ [MA_PENDING(DECR)] %{public}@ - 0 MA pending");
}

@end