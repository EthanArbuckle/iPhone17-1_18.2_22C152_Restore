@interface PLCloudPhotoLibraryManager
+ (BOOL)needResetSyncErrorType:(id)a3;
+ (id)_lastKnownCloudVersionInLibrary:(id)a3;
+ (id)descriptionForResourceType:(unint64_t)a3;
- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress;
- (BOOL)_canExternallyTransitionToNewLibraryStateIgnoringPause:(BOOL)a3;
- (BOOL)_connectToCloudChangeTrackerWithContext:(id)a3;
- (BOOL)_disableiCPLAfterZoneWipedInCloudIfNecessary;
- (BOOL)_hasAvalancheIncomingWork;
- (BOOL)_hasIncomingWorkFileMarker;
- (BOOL)_hasItemToDownload;
- (BOOL)_isAssetsdNotReadyToAnswer;
- (BOOL)_isPausedForDownloadRequestHighPriority:(BOOL)a3;
- (BOOL)_libraryModeSupportsEnableiCPL;
- (BOOL)_setupTimerForUnpause;
- (BOOL)_shouldResetICloudBackupExclusionPaths;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isConnectedToCloudChangeTracker;
- (BOOL)isReadyForAnalysis;
- (BOOL)isResourceTransferTaskAliveWithTaskWithIdentifier:(id)a3;
- (BOOL)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 forSystemBudgets:(unint64_t)a5;
- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4;
- (CGSize)_targetSizeForInputSize:(CGSize)a3 maxPixelSize:(unint64_t)a4;
- (PLCloudPhotoLibraryManager)initWithLibraryServicesManager:(id)a3;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLPhotoLibraryPathManager)pathManager;
- (id)_assetResourceForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 isPhoto:(BOOL *)a6;
- (id)_calculateUnpauseTimeForPauseTime:(id)a3;
- (id)_convertToIdentifierMapFromCPLScopeIdentifierMap:(id)a3;
- (id)_debugNameForState:(unint64_t)a3;
- (id)_fetchEventsFromCloudChangeTrackerInLibrary:(id)a3;
- (id)_identifierForResource:(id)a3;
- (id)_idleStateTransitionOneTimeAction;
- (id)_inMemoryTrackerStateForDebug;
- (id)cacheDeleteSupport;
- (id)cplConfiguration;
- (id)cplLibrary;
- (id)cplStatus;
- (id)readCloudTrackerToken;
- (id)readLocalVersion;
- (id)readRulesTrackerToken;
- (id)recoveryManager;
- (id)resourceManager;
- (int64_t)currentResetSyncType;
- (int64_t)deviceLibraryConfiguration;
- (int64_t)sizeOfResourcesToUploadByCPL:(id *)a3;
- (signed)_placeHolderKindFromCPLResourceType:(unint64_t)a3;
- (unint64_t)_inq_numberOfOtherItemsToDownloadInLibrary:(id)a3;
- (unint64_t)_inq_numberOfOtherItemsToUploadInLibrary:(id)a3;
- (unint64_t)_inq_numberOfPhotosToDownloadInLibrary:(id)a3;
- (unint64_t)_inq_numberOfPhotosToUploadInLibrary:(id)a3;
- (unint64_t)_inq_numberOfVideosToDownloadInLibrary:(id)a3;
- (unint64_t)_inq_numberOfVideosToUploadInLibrary:(id)a3;
- (unint64_t)totalNumberOfDeferredAssets;
- (unint64_t)totalNumberOfUnpushedMasters;
- (unint64_t)totalNumberOfUploadedMasters;
- (unint64_t)totalSizeOfUnpushedOriginals;
- (unint64_t)totalUploadedOriginalSize;
- (void)_appWithBundleIdentifier:(id)a3 changedStateToForeground:(BOOL)a4;
- (void)_callBlocksWaitingForLibraryOpen;
- (void)_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:(id)a3;
- (void)_callPushAllChangesCompletionHandlersIfNecessary;
- (void)_cameraChangedStateToForeground:(BOOL)a3;
- (void)_checkAndMarkPurgeableResources:(id)a3 checkIfSafe:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 urgency:(int64_t)a6 completionHandler:(id)a7;
- (void)_checkEnableState;
- (void)_checkForPushedMastersInLibrary:(id)a3;
- (void)_checkForWorkInProgress;
- (void)_checkIfSharedLibraryDedupeIsDisabled;
- (void)_constructUnpauseTimerFrom:(id)a3 to:(id)a4;
- (void)_createDeletionRecordsIfNecessary;
- (void)_disableOpportunisticTasks;
- (void)_disableiCPLSyncWithResetMode:(int64_t)a3;
- (void)_disableiCPLWillBecomeNonSyncablePhotoLibrary:(BOOL)a3 resetMode:(int64_t)a4;
- (void)_doPause;
- (void)_doResetSync:(int64_t)a3 inLibrary:(id)a4;
- (void)_doUnpause;
- (void)_downloadFromCloudInLibrary:(id)a3;
- (void)_enableOpportunisticTasks;
- (void)_enableiCPL;
- (void)_fetchNewEventsFromCloudChangeTrackerInLibrary:(id)a3;
- (void)_finishUploadWithNoBatchesToUploadInLibrary:(id)a3;
- (void)_finishedUnsharingPendingAssetsSharedToScopeWithTransaction:(id)a3 error:(id)a4;
- (void)_fixMasterStatusIn:(id)a3 inLibrary:(id)a4;
- (void)_getStatusChanges:(id)a3 transaction:(id)a4 notificationGeneration:(unint64_t)a5 inLibrary:(id)a6;
- (void)_getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)_handleFinalizeSessionError:(id)a3 commitError:(id)a4 uploadBatchContainer:(id)a5 needResetSync:(BOOL)a6 forTransaction:(id)a7 inLibrary:(id)a8;
- (void)_handleOptimizeSettingChange;
- (void)_handleOptimizeSettingChangeInLibrary:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleStateTransistionAfterDisableiCPL;
- (void)_initCPLLibraryMode;
- (void)_initCacheDeleteSupport;
- (void)_initDeviceLibraryConfiguration;
- (void)_initRecoveryManager;
- (void)_initResourceManager;
- (void)_initializeMasterAndSizeCalculationinLibrary:(id)a3;
- (void)_linkFileFrom:(id)a3 to:(id)a4;
- (void)_markPurgeableNextBatchOfResources:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7;
- (void)_markResourceObjectIDsAsPurgeable:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5;
- (void)_migrateFromChangeHubToCoreDataIfNecessary;
- (void)_notifyCPLStatus:(id)a3 didChange:(BOOL)a4 andCPLConfiguration:(id)a5;
- (void)_openCPLLibrary;
- (void)_pause;
- (void)_processDownloadBatchWithSession:(id)a3 inLibrary:(id)a4;
- (void)_processNextTransaction;
- (void)_processRulesEvaluationIfNeeded;
- (void)_processUploadBatchInLibrary:(id)a3;
- (void)_processUploadBatchWithStartupFailureCount:(unint64_t)a3 orderKeyManager:(id)a4 inLibrary:(id)a5;
- (void)_reportOptimizeSettingChangeWithCompletionHandler:(id)a3;
- (void)_repushAssetsWithImportedByBundleIdentifier;
- (void)_repushMasterWithMissingMediaMetadata;
- (void)_repushVideoAssetsMetadata;
- (void)_resetCPLLibrary;
- (void)_resetCacheDeleteSupport;
- (void)_resetDidCallBlocksWaitingForLibraryOpen;
- (void)_resetResourceManager;
- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 afterDelay:(double)a4 block:(id)a5;
- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 block:(id)a4;
- (void)_runOnLibraryOpenWithTransaction:(id)a3 block:(id)a4;
- (void)_runOneTimeMigrationStepsIfNecessaryInLibrary:(id)a3;
- (void)_runOneTimeMigrationStepsWithoutiCPLIfNecessary;
- (void)_runSyncOnIsolationQueueWithBlock:(id)a3;
- (void)_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:(id)a3;
- (void)_setIdleStateTransitionOneTimeAction:(id)a3;
- (void)_setReadyForAnalysisWithCPLStatus:(id)a3;
- (void)_setToDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4;
- (void)_setupPLCPLPlistInLibrary:(id)a3;
- (void)_startLibraryScopeRulesChangeTrackerInQueue;
- (void)_startWorkInProgressTimer;
- (void)_stopUnpauseTimer;
- (void)_stopWorkInProgressTimer;
- (void)_transitionToState:(unint64_t)a3;
- (void)_unpause;
- (void)_unshareBatchOfPendingAssetsSharedToScopeWithTransaction:(id)a3;
- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4;
- (void)_updateBackupExclusionPathsAfterRemoveCPLDirectory;
- (void)_updateLocalStaleResourceWithCPLResource:(id)a3 inLibrary:(id)a4;
- (void)_updatePendingResetSyncDate;
- (void)_updateThumbnailDataForAsset:(id)a3 withImageFileURL:(id)a4;
- (void)_updateTransferCountsInLibrary:(id)a3;
- (void)_updateWithCPLResource:(id)a3 isHighPriority:(BOOL)a4 inLibrary:(id)a5 completionHandler:(id)a6;
- (void)_uploadFullPhotoLibraryToCloud:(id)a3;
- (void)_uploadToCloudForEventsResult:(id)a3 inLibrary:(id)a4;
- (void)acceptCPLShare:(id)a3 completionHandler:(id)a4;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)beginsSignificantWorkWithResourcesSize:(unint64_t)a3;
- (void)boostPriorityForMomentShareWithScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelResourceTransferTaskWithIdentifier:(id)a3 completion:(id)a4;
- (void)clearPrefetchState;
- (void)clearPurgeableResourcesMatchingPredicate:(id)a3 inLibrary:(id)a4 completionHandler:(id)a5;
- (void)cloudChangeTrackerDidReceiveChangesWithTransaction:(id)a3;
- (void)configurationDidChange:(id)a3;
- (void)cplConfigurationWithCompletionHandler:(id)a3;
- (void)cplHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)disableiCPLSyncForLibraryDeletion;
- (void)disableiCPLSyncWillBecomeNonSyncablePhotoLibrary;
- (void)disableiCPLWithCompletionHandler:(id)a3;
- (void)downloadAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 clientBundleID:(id)a7 proposedTaskIdentifier:(id)a8 taskDidBeginHandler:(id)a9 progressBlock:(id)a10 completionHandler:(id)a11;
- (void)downloadResource:(id)a3 highPriority:(BOOL)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9;
- (void)downloadResource:(id)a3 options:(id)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9;
- (void)downloadResourceInMemory:(id)a3 clientBundleID:(id)a4 proposedTaskIdentifier:(id)a5 taskDidBeginHandler:(id)a6 completionHandler:(id)a7;
- (void)downloadResourceInMemoryForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 clientBundleID:(id)a6 proposedTaskIdentifier:(id)a7 taskDidBeginHandler:(id)a8 completionHandler:(id)a9;
- (void)enableiCPLWithCompletionHandler:(id)a3;
- (void)endUserSessionWithCompletionHandler:(id)a3;
- (void)endsSignificantWork;
- (void)fetchAdjustmentDataForAsset:(id)a3 completionHandler:(id)a4;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 onDemand:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchResourcesForAsset:(id)a3 completionHandler:(id)a4;
- (void)fetchShareFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceSyncMomentSharesWithScopeIdentifiers:(id)a3;
- (void)getCPLStateForDebug:(BOOL)a3 completionHandler:(id)a4;
- (void)getCloudScopedIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getStreamingURLForAsset:(id)a3 resourceType:(unint64_t)a4 intent:(unint64_t)a5 hints:(id)a6 timeRange:(id *)a7 clientBundleID:(id)a8 completionHandler:(id)a9;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)invalidateCacheDeleteSupport;
- (void)invalidateRecoveryManager;
- (void)invalidateResourceManager;
- (void)invalidateUploadDownloadCountCoalescer;
- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4;
- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4;
- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4;
- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5;
- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManagerDidChangeConfiguration:(id)a3;
- (void)libraryManagerHasChangesToPull:(id)a3;
- (void)libraryManagerHasStatusChanges:(id)a3;
- (void)libraryManagerStatusDidChange:(id)a3;
- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7;
- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5 completionHandler:(id)a6;
- (void)performTransactionOnLibraryScopeSynchronizationQueue:(id)a3;
- (void)photosPreferencesChanged;
- (void)publishCPLScopeChange:(id)a3 completionHandler:(id)a4;
- (void)publishLibraryScopeWithCPLShare:(id)a3 title:(id)a4 completionHandler:(id)a5;
- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4;
- (void)refreshLibraryScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllChangeHubKeys;
- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)reportMiscInformation:(id)a3;
- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 completionHandler:(id)a4;
- (void)resetSyncDueToMigrationMarker;
- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)saveCloudTrackerToken:(id)a3 withContext:(id)a4;
- (void)saveRulesTrackerToken:(id)a3;
- (void)sendBudgetOverrideAnalytics:(BOOL)a3 pauseReason:(id)a4;
- (void)setCPLConfiguration:(id)a3;
- (void)setCPLLibrary:(id)a3;
- (void)setCPLStatus:(id)a3;
- (void)setDeviceLibraryConfiguration:(int64_t)a3;
- (void)setPause:(BOOL)a3 reason:(signed __int16)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3;
- (void)startAssetRecoveryWithTransaction:(id)a3;
- (void)startAutomaticPrefetchOrPrune;
- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startLibraryScopeRulesChangeTracker;
- (void)startUnsharingPendingAssetsSharedToScopeWithIdentifier:(id)a3;
- (void)statusDidChange:(id)a3;
- (void)stopLibraryScopeRulesChangeTracker;
- (void)sync;
- (void)updateLibraryScopeWithCPLScopeChange:(id)a3 completionHandler:(id)a4;
- (void)updateTransferCountsWithInsertedPhotoCount:(unint64_t)a3 insertedVideoCount:(unint64_t)a4 inLibrary:(id)a5;
- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3;
@end

@implementation PLCloudPhotoLibraryManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->__idleStateTransitionOneTimeAction, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_scopeIdentifierToUnsharePendingAssetsFrom, 0);
  objc_storeStrong((id *)&self->_deviceLibraryConfigurationChangeCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_libraryScopeSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_numberOfOtherItemsDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfVideosDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfPhotosDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfOtherItemsToPush, 0);
  objc_storeStrong((id *)&self->_numberOfVideosToPush, 0);
  objc_storeStrong((id *)&self->_numberOfPhotosToPush, 0);
  objc_storeStrong((id *)&self->_blocksWaitingForLibraryOpen, 0);
  objc_storeStrong((id *)&self->_backgroundJobWorkerCoordinator, 0);
  objc_storeStrong((id *)&self->_pushAllChangesCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lazyCacheDeleteSupport, 0);
  objc_storeStrong((id *)&self->_switchHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_uploadTracker, 0);
  objc_storeStrong((id *)&self->_inMemoryTaskManager, 0);
  objc_storeStrong((id *)&self->_workInProgressTimer, 0);
  objc_storeStrong((id *)&self->_uploadDownloadCountQueue, 0);
  objc_storeStrong((id *)&self->_uploadDownloadCountCoalescer, 0);
  objc_storeStrong((id *)&self->_userUnpauseDispatchTimer, 0);
  objc_storeStrong((id *)&self->_unpauseDispatchTimer, 0);
  objc_storeStrong((id *)&self->_lazyRecoveryManager, 0);
  objc_storeStrong((id *)&self->_lazyResourceManager, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_cplConfiguration, 0);
  objc_storeStrong((id *)&self->_unsafe_cplStatus, 0);
  objc_storeStrong((id *)&self->_unsafe_cplLibrary, 0);
  objc_storeStrong(&self->_cameraMonitorIdentifier, 0);
  objc_storeStrong(&self->_foregroundMonitorIdentifier, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_rulesChangeTracker, 0);
  objc_storeStrong((id *)&self->_syncChangeTracker, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
}

- (void)_setIdleStateTransitionOneTimeAction:(id)a3
{
}

- (id)_idleStateTransitionOneTimeAction
{
  return self->__idleStateTransitionOneTimeAction;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  return (PLLibraryServicesManager *)WeakRetained;
}

- (void)setDeviceLibraryConfiguration:(int64_t)a3
{
  self->_deviceLibraryConfiguration = a3;
}

- (int64_t)deviceLibraryConfiguration
{
  return self->_deviceLibraryConfiguration;
}

- (id)_inMemoryTrackerStateForDebug
{
  v2 = [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker currentStateForDebug];
  v3 = v2;
  v4 = NSString;
  if (v2)
  {
    v5 = [v2 componentsSeparatedByString:@"\n"];
    v6 = [v5 componentsJoinedByString:@"\n\t"];
    v7 = [v4 stringWithFormat:@"In-memory tracker: %@", v6];
  }
  else
  {
    v7 = [NSString stringWithFormat:@"In-memory tracker: %@", @"not initialized"];
  }

  return v7;
}

- (id)_debugNameForState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = @"Uninitialized";
      break;
    case 1uLL:
      v3 = @"Opening";
      break;
    case 2uLL:
      v3 = @"Opened";
      break;
    case 3uLL:
      v3 = @"Fetching";
      break;
    case 4uLL:
      v3 = @"Uploading";
      break;
    case 5uLL:
      v3 = @"Downloading";
      break;
    case 6uLL:
      v3 = @"Idle";
      break;
    case 7uLL:
      v3 = @"ForceResetSync";
      break;
    case 8uLL:
      v4 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      v5 = [v4 libraryBundle];
      v6 = [v5 indicatorFileCoordinator];

      objc_msgSend(NSString, "stringWithFormat:", @"Paused (%d)", (int)objc_msgSend(v6, "currentPauseReason"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 9uLL:
      v3 = @"Deactivated";
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_convertToIdentifierMapFromCPLScopeIdentifierMap:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v17);
        v12 = [v10 identifier];
        uint64_t v13 = [v11 identifier];
        v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v4 setObject:v13 forKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)getCloudScopedIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager getCloudScopedIdentifiersForLocalIdentifiers:completionHandler:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E5874868;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v8 block:v11];
}

void __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] cplLibrary];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 58);
    id v5 = [WeakRetained mainScopeIdentifier];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = a1[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v5 identifier:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v3 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5865048;
    id v12 = a1[6];
    id v15 = v3;
    id v16 = v12;
    v14[4] = a1[4];
    id v13 = v3;
    [v2 getCloudScopedIdentifiersForLocalScopedIdentifiers:v13 completionHandler:v14];

    goto LABEL_12;
  }
  if (a1[6])
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41022 userInfo:0];
    (*((void (**)(void))a1[6] + 2))();
LABEL_12:
  }
}

void __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v6)
  {
    if (v7)
    {
      (*(void (**)(void, void, id))(v7 + 16))(*(void *)(a1 + 48), 0, v6);
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v9 == 2)
      {
        id v10 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v9 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v10 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138543618;
        uint64_t v14 = v12;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to get cloud scoped identifiers from local identifiers %{public}@. Error: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _convertToIdentifierMapFromCPLScopeIdentifierMap:v5];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
}

- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager resolveLocalIdentifiersForCloudIdentifiers:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] cplLibrary];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 58);
    id v5 = [WeakRetained mainScopeIdentifier];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = a1[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v5 identifier:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v3 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5865048;
    id v12 = a1[7];
    id v13 = a1[4];
    id v16 = v12;
    v14[4] = v13;
    id v15 = a1[6];
    [v2 resolveLocalScopedIdentifiersForCloudScopedIdentifiers:v3 completionHandler:v14];

    goto LABEL_12;
  }
  if (a1[7])
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41022 userInfo:0];
    (*((void (**)(void))a1[7] + 2))();
LABEL_12:
  }
}

void __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v5)
  {
    if (v6) {
      (*(void (**)(void, void, id))(v6 + 16))(*(void *)(a1 + 48), 0, v5);
    }
  }
  else if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _convertToIdentifierMapFromCPLScopeIdentifierMap:v8];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  [*(id *)(a1 + 40) stillAlive];
}

- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager queryUserIdentitiesWithParticipants:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5864F58;
    id v8 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 48);
    [v2 queryUserDetailsForShareParticipants:v3 completionHandler:v6];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F59778] code:2 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
    }
  }
}

uint64_t __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)forceSyncMomentSharesWithScopeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager forceSyncMomentSharesWithScopeIdentifiers:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke;
  v8[3] = &unk_1E5873A50;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v6 block:v8];
}

void __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Forcing sync for %@", buf, 0xCu);
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke_571;
    v12[3] = &unk_1E5865020;
    uint64_t v9 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v2 forceSynchronizingScopeWithIdentifiers:v9 completionHandler:v12];
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v5 == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v5 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v10 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to force sync for %@: No CPL library", buf, 0xCu);
    }
  }
}

void __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke_571(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Force sync task %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 40) stillAlive];
}

- (void)boostPriorityForMomentShareWithScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager boostPriorityForMomentShareWithScopeIdentifier:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        uint64_t v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Boosting priority for %@", buf, 0xCu);
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke_570;
    v17[3] = &unk_1E5875AB8;
    id v9 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v9;
    id v20 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 48);
    [v2 boostPriorityForScopeWithIdentifier:v18 completionHandler:v17];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v5 == 2)
      {
        id v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v10 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to boost priority for %@: No CPL library", buf, 0xCu);
      }
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F59778];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v22 = @"CPL hasn't been setup yet";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v16 = [v13 errorWithDomain:v14 code:2 userInfo:v15];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);
    }
  }
}

void __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke_570(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_22;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v8 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)id v15 = 138412290;
    *(void *)&v15[4] = v9;
    id v10 = "Failed to boost priority for %@";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  if (*MEMORY[0x1E4F59AC0]) {
    goto LABEL_22;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
  if (v6 == 2)
  {
    id v7 = __CPLAppLibraryOSLogDomain();
  }
  else
  {
    if (v6 == 1) {
      __CPLSyndicationOSLogDomain();
    }
    else {
    id v7 = __CPLSystemLibraryOSLogDomain();
    }
  }
  uint64_t v8 = v7;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)id v15 = 138412290;
    *(void *)&v15[4] = v13;
    id v10 = "Boosted priority for %@";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
    _os_log_impl(&dword_19B3C7000, v11, v12, v10, v15, 0xCu);
  }
LABEL_21:

LABEL_22:
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
  objc_msgSend(*(id *)(a1 + 48), "stillAlive", *(_OWORD *)v15);
}

- (void)acceptCPLShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager acceptCPLShare:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58734E8;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    [v2 acceptSharedScope:v3 completionHandler:v9];

    uint64_t v4 = v11;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F59778];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"CPL hasn't been setup yet";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v6 errorWithDomain:v7 code:2 userInfo:v4];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)fetchShareFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager fetchShareFromShareURL:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5864FF8;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    [v2 fetchSharedScopeFromShareURL:v3 completionHandler:v9];

    uint64_t v4 = v11;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F59778];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"CPL hasn't been setup yet";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v6 errorWithDomain:v7 code:2 userInfo:v4];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);

    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)publishCPLScopeChange:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager publishCPLScopeChange:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5864FF8;
      id v16 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      [v2 createScope:v3 completionHandler:v14];

      uint64_t v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v18 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
  [*(id *)(a1 + 48) stillAlive];
}

uint64_t __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 onDemand:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke;
  v13[3] = &unk_1E5873CA8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v10 block:v13];
}

void __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) libraryServicesManager];
    uint64_t v4 = [v3 databaseContext];
    uint64_t v5 = (void *)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:]_block_invoke"];

    if (+[PLManagedAsset isComputeSyncEnabledForDirection:1 library:v5])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F59920]);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke_2;
      v12[3] = &unk_1E5874D98;
      uint64_t v8 = *(void *)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      [v2 fetchComputeStatesForRecordsWithScopedIdentifiers:v8 validator:v6 onDemand:v7 completionHandler:v12];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v6 = +[PLCloudPhotoLibraryError createErrorWithType:18 withDebugMessage:@"CCSS download feature disabled"];
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = +[PLCloudPhotoLibraryError createErrorWithType:15];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

uint64_t __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTransactionOnLibraryScopeSynchronizationQueue:(id)a3
{
}

- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager requestDeviceLibraryConfigurationChange:completionHandler:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke;
  v18[3] = &unk_1E5875E40;
  v18[4] = self;
  id v8 = v7;
  id v19 = v8;
  int64_t v20 = a3;
  uint64_t v9 = (void *)MEMORY[0x19F38D650](v18);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_559;
  v13[3] = &unk_1E5864FD0;
  id v16 = v9;
  int64_t v17 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v10 = v9;
  id v11 = v8;
  id v12 = v6;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v11 block:v13];
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2;
  v6[3] = &unk_1E58735D8;
  id v7 = v2;
  id v8 = v4;
  uint64_t v10 = *(void *)(a1 + 48);
  id v9 = v3;
  id v5 = v2;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v9 block:v6];
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_559(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (!v3) {
      return;
    }
    uint64_t v4 = v2[57];
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F8C500];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    v25[0] = @"Cannot change library configuration on non-SPL";
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (__CFString **)v25;
    id v9 = &v24;
    goto LABEL_4;
  }
  char v12 = [v2 isCloudPhotoLibraryEnabled];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v4 == *(void *)(v13 + 456))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      if (v3)
      {
        id v5 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v6 = *MEMORY[0x1E4F8C500];
        uint64_t v22 = *MEMORY[0x1E4F28228];
        v23 = @"Cannot change device-libary configuration to the current configuration";
        id v7 = (void *)MEMORY[0x1E4F1C9E8];
        id v8 = &v23;
        id v9 = &v22;
LABEL_4:
        uint64_t v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
        id v11 = [v5 errorWithDomain:v6 code:41032 userInfo:v10];
        (*(void (**)(uint64_t, void, uint64_t, void *))(v3 + 16))(v3, 0, v4, v11);
      }
    }
    else
    {
      if (!*(void *)(v13 + 416))
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v17 = *(void *)(a1 + 32);
        id v18 = *(void **)(v17 + 416);
        *(void *)(v17 + 416) = v16;

        id v19 = *(void **)(a1 + 32);
        if (v19[51] == v19[57]) {
          [v19 _runOnLibraryOpenWithTransaction:*(void *)(a1 + 40) block:*(void *)(a1 + 56)];
        }
      }
      if (*(void *)(a1 + 48))
      {
        int64_t v20 = *(void **)(*(void *)(a1 + 32) + 416);
        id v21 = (id)MEMORY[0x19F38D650]();
        objc_msgSend(v20, "addObject:");
      }
    }
  }
  else
  {
    PLSetCPLDeviceLibraryConfiguration(*(void *)(a1 + 64));
    [*(id *)(a1 + 32) setDeviceLibraryConfiguration:*(void *)(a1 + 64)];
    *(void *)(*(void *)(a1 + 32) + 408) = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      id v15 = *(void (**)(void))(v14 + 16);
      v15();
    }
  }
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2(void *a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(a1[5] + 96);
      if (v3 == 2)
      {
        uint64_t v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = *(void *)(a1[5] + 456);
        if (v11 > 2) {
          char v12 = @"unknown";
        }
        else {
          char v12 = off_1E586C1D0[v11];
        }
        uint64_t v13 = v12;
        unint64_t v14 = a1[7];
        if (v14 > 2) {
          id v15 = @"unknown";
        }
        else {
          id v15 = off_1E586C1D0[v14];
        }
        id v16 = v15;
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Starting force-backup in preparation for device-library configuration change from %@ to %@", buf, 0x16u);
      }
      uint64_t v2 = (void *)a1[4];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_554;
    v20[3] = &unk_1E5864FA8;
    uint64_t v17 = (void *)a1[6];
    v20[4] = a1[5];
    id v18 = v17;
    uint64_t v19 = a1[7];
    id v21 = v18;
    uint64_t v22 = v19;
    [v2 forceBackupWithCompletionHandler:v20];
  }
  else
  {
    id v5 = (void *)a1[5];
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F59778];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"CPL hasn't been setup yet";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v9 = [v6 errorWithDomain:v7 code:2 userInfo:v8];
    [v5 _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:v9];
  }
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_554(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2_555;
  v7[3] = &unk_1E5875E40;
  id v8 = v3;
  id v9 = v4;
  uint64_t v10 = a1[6];
  id v6 = v3;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2_555(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:");
  }
  else
  {
    uint64_t v4 = [v2 libraryServicesManager];
    uint64_t v5 = [v4 libraryBundle];
    id v6 = [v5 indicatorFileCoordinator];

    if ([v6 isDisableICloudPhotos])
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v7 == 2)
        {
          id v8 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v7 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v8 = __CPLSystemLibraryOSLogDomain();
          }
        }
        unint64_t v11 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "iCPL requested to disable, unable to change device-library configuration", buf, 2u);
        }
      }
      char v12 = *(void **)(a1 + 40);
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F8C500];
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v26 = @"Cannot change device-library, iCPL was disabled";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v16 = [v13 errorWithDomain:v14 code:41032 userInfo:v15];
      [v12 _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:v16];
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v9 == 2)
        {
          uint64_t v10 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v9 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v10 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v17 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v18 = *(void *)(*(void *)(a1 + 40) + 456);
          if (v18 > 2) {
            uint64_t v19 = @"unknown";
          }
          else {
            uint64_t v19 = off_1E586C1D0[v18];
          }
          int64_t v20 = v19;
          unint64_t v21 = *(void *)(a1 + 48);
          if (v21 > 2) {
            uint64_t v22 = @"unknown";
          }
          else {
            uint64_t v22 = off_1E586C1D0[v21];
          }
          v23 = v22;
          *(_DWORD *)buf = 138412546;
          v28 = v20;
          __int16 v29 = 2112;
          v30 = v23;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Changing device-library configuration from %@ to %@", buf, 0x16u);
        }
      }
      uint64_t v24 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      PLSetPendingCPLDeviceLibraryConfiguration(v24);

      *(void *)(*(void *)(a1 + 40) + 408) = *(void *)(a1 + 48);
      [*(id *)(a1 + 40) _disableiCPLWillBecomeNonSyncablePhotoLibrary:0 resetMode:3];
    }
  }
}

- (void)_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_deviceLibraryConfigurationChangeCompletionHandlers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  deviceLibraryConfigurationChangeCompletionHandlers = self->_deviceLibraryConfigurationChangeCompletionHandlers;
  self->_deviceLibraryConfigurationChangeCompletionHandlers = 0;
}

- (void)startUnsharingPendingAssetsSharedToScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager startUnsharingPendingAssetsSharedToScopeWithIdentifier:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PLCloudPhotoLibraryManager_startUnsharingPendingAssetsSharedToScopeWithIdentifier___block_invoke;
  v8[3] = &unk_1E5873A50;
  v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v6 block:v8];
}

void __85__PLCloudPhotoLibraryManager_startUnsharingPendingAssetsSharedToScopeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 424))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(v2 + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v11 = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Already un-sharing assets pending push to scope: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(v2 + 96);
      if (v5 == 2)
      {
        id v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v9 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Start un-sharing assets pending push to scope: %@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 424), *(id *)(a1 + 40));
    [*(id *)(a1 + 32) _unshareBatchOfPendingAssetsSharedToScopeWithTransaction:*(void *)(a1 + 48)];
  }
}

- (void)_unshareBatchOfPendingAssetsSharedToScopeWithTransaction:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v5 = self->_scopeIdentifierToUnsharePendingAssetsFrom;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke;
  v8[3] = &unk_1E5864F80;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PLCloudPhotoLibraryManager *)self _getStatusForPendingRecordsSharedToScopeWithIdentifier:v7 maximumCount:100 completionHandler:v8];
}

void __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v6;
LABEL_6:
    [v8 _finishedUnsharingPendingAssetsSharedToScopeWithTransaction:v13 error:v14];
    goto LABEL_7;
  }
  uint64_t v7 = [v5 count];
  uint64_t v8 = *(void **)(a1 + 32);
  if (!v7)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = 0;
    goto LABEL_6;
  }
  id v9 = [v8 libraryServicesManager];
  id v10 = [v9 databaseContext];
  int v11 = (void *)[v10 newShortLivedLibraryWithName:"-[PLCloudPhotoLibraryManager _unshareBatchOfPendingAssetsSharedToScopeWithTransaction:]_block_invoke"];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2;
  v17[3] = &unk_1E5870618;
  id v18 = v5;
  id v19 = *(id *)(a1 + 40);
  id v20 = v11;
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(id *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_552;
  v15[3] = &unk_1E5875E18;
  v15[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  id v12 = v11;
  [v12 performTransaction:v17 completionHandler:v15];

LABEL_7:
}

void __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v41 + 1) + 8 * i) record];
        id v9 = [v8 scopedIdentifier];
        id v10 = [v9 identifier];
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v5);
  }

  int v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND noindex:(%K) = %@", @"cloudAssetGUID", v2, @"libraryScope.scopeIdentifier", *(void *)(a1 + 40)];
  id v12 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v13 = +[PLManagedAsset entityName];
  id v14 = [v12 fetchRequestWithEntityName:v13];

  [v14 setPredicate:v11];
  id v15 = [*(id *)(a1 + 48) managedObjectContext];
  id v40 = 0;
  id v16 = [v15 executeFetchRequest:v14 error:&v40];
  id v17 = v40;

  if (v16)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 96);
      if (v18 == 2)
      {
        id v19 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v18 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v19 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v20 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        int v22 = [v16 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = v21;
        __int16 v48 = 1024;
        int v49 = v22;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Unsharing pending assets shared to scope: %@, batch count: %d", buf, 0x12u);
      }
    }
    id v33 = v17;
    v34 = v16;
    v35 = v14;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v16;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          [v28 removeLibraryScopeAndContributors];
          char v29 = [v28 libraryScopeShareState];
          int v30 = (v29 & 1) - 1;
          if ((v29 & 2) != 0) {
            int v30 = 1;
          }
          if ((v29 & 4) != 0) {
            int v30 = 2;
          }
          if ((v29 & 8) != 0) {
            int v30 = 3;
          }
          if ((v29 & 0x10) != 0) {
            int v31 = 4;
          }
          else {
            int v31 = v30;
          }
          [v28 setLibraryScopeShareState:0];
          PLLibraryScopeAssetSetSuggestedByClientType(v31, v28);
          PLLibraryScopeAssetSetUserManuallyRejectedState(1, v28);
          id v32 = v28;
          objc_msgSend(v32, "setLibraryScopeShareState:", objc_msgSend(v32, "libraryScopeShareState") & 0xFFFFFFFFFF7FFFFFLL);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v25);
    }

    id v14 = v35;
    id v17 = v33;
    id v16 = v34;
  }
  else
  {
    [*(id *)(a1 + 56) _finishedUnsharingPendingAssetsSharedToScopeWithTransaction:*(void *)(a1 + 64) error:v17];
  }
}

uint64_t __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_552(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2_553;
  v4[3] = &unk_1E5875CE0;
  v4[4] = v2;
  return [v2 _runAsyncOnIsolationQueueWithTransaction:v1 block:v4];
}

uint64_t __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2_553(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canExternallyTransitionToNewLibraryStateIgnoringPause:0];
  if (result)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        uint64_t v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from UNSHARE PENDING ASSETS", v6, 2u);
      }
    }
    return [*(id *)(a1 + 32) _transitionToState:3];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 90) = 1;
  }
  return result;
}

- (void)_finishedUnsharingPendingAssetsSharedToScopeWithTransaction:(id)a3 error:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__PLCloudPhotoLibraryManager__finishedUnsharingPendingAssetsSharedToScopeWithTransaction_error___block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:a3 block:v8];
}

void __96__PLCloudPhotoLibraryManager__finishedUnsharingPendingAssetsSharedToScopeWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 424);
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Finished un-sharing assets pending push to scope: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 424);
  *(void *)(v7 + 424) = 0;
}

- (void)_getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v14[3] = &unk_1E5873600;
  void v14[4] = self;
  id v15 = v8;
  id v17 = v9;
  unint64_t v18 = a4;
  id v16 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v11 block:v14];
}

void __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (!v2)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F59778];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"CPL hasn't been setup yet";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v13 = v10;
    uint64_t v14 = v11;
    uint64_t v15 = 2;
LABEL_10:
    unint64_t v18 = [v13 errorWithDomain:v14 code:v15 userInfo:v12];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v18);

    goto LABEL_11;
  }
  if (([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (!v9) {
      goto LABEL_11;
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F59778];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    int v30 = @"iCloud Photo Library is not enabled";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v13 = v16;
    uint64_t v14 = v17;
    uint64_t v15 = 33;
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) cplStatus];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [*(id *)(a1 + 32) cplStatus],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isExceedingSharedLibraryQuota],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        id v20 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v19 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v20 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v21 = v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Not exceeding shared library quota, not fetching pending record statuses for scope identifier: %@", buf, 0xCu);
      }
    }
    uint64_t v23 = *(void *)(a1 + 56);
    if (v23) {
      (*(void (**)(uint64_t, void, void))(v23 + 16))(v23, 0, 0);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_542;
    v24[3] = &unk_1E5864F58;
    uint64_t v8 = *(void *)(a1 + 64);
    id v26 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 48);
    [v2 getStatusForPendingRecordsSharedToScopeWithIdentifier:v7 maximumCount:v8 completionHandler:v24];
  }
LABEL_11:
}

uint64_t __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_542(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2;
      uint64_t v17 = &unk_1E5869570;
      id v18 = *(id *)(a1 + 56);
      [v2 getScopeStatusCountsForScopeWithIdentifier:v3 completionHandler:&v14];
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      uint64_t v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v20 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)refreshLibraryScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager refreshLibraryScopeWithIdentifier:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_2;
      uint64_t v17 = &unk_1E5869548;
      id v18 = *(id *)(a1 + 56);
      [v2 refreshScopeWithIdentifier:v3 completionHandler:&v14];
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      uint64_t v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v20 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLibraryScopeWithCPLScopeChange:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager updateLibraryScopeWithCPLScopeChange:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke_2;
      uint64_t v17 = &unk_1E5869548;
      id v18 = *(id *)(a1 + 56);
      [v2 updateShareForScope:v3 completionHandler:&v14];
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      uint64_t v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v20 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)publishLibraryScopeWithCPLShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager publishLibraryScopeWithCPLShare:title:completionHandler:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke;
  v16[3] = &unk_1E5874818;
  id v19 = v11;
  id v20 = v10;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v12 = v11;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v12 block:v16];
}

void __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke_2;
      id v18 = &unk_1E5869548;
      id v19 = *(id *)(a1 + 64);
      [v2 createOwnedLibraryShareScopeWithShare:v3 title:v4 completionHandler:&v15];
      objc_msgSend(*(id *)(a1 + 56), "stillAlive", v15, v16, v17, v18);
      uint64_t v5 = v19;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F59778];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      uint64_t v21 = @"iCloud Photo Library is not enabled";
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v9 = v12;
      uint64_t v10 = v13;
      uint64_t v11 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F59778];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"CPL hasn't been setup yet";
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v9 = v7;
      uint64_t v10 = v8;
      uint64_t v11 = 2;
LABEL_8:
      id v14 = [v9 errorWithDomain:v10 code:v11 userInfo:v5];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v14);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager sharedLibraryRampCheckWithCompletionHandler:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v5 block:v7];
}

void __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E5874DE8;
      id v14 = *(id *)(a1 + 40);
      [v2 sharedLibraryRampCheckWithCompletionHandler:v13];
      uint64_t v3 = v14;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F59778];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v16 = @"iCloud Photo Library is not enabled";
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v7 = v10;
      uint64_t v8 = v11;
      uint64_t v9 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F59778];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"CPL hasn't been setup yet";
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      uint64_t v9 = 2;
LABEL_8:
      id v12 = [v7 errorWithDomain:v8 code:v9 userInfo:v3];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v12);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v20[3] = &unk_1E5864F30;
  v20[4] = self;
  id v21 = v12;
  id v24 = v14;
  int64_t v25 = a5;
  int64_t v26 = a6;
  id v22 = v13;
  id v23 = v15;
  id v16 = v15;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v16 block:v20];
}

void __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = [*(id *)(a1 + 32) libraryServicesManager];
      uint64_t v4 = [v3 databaseContext];
      uint64_t v5 = (void *)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke"];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
      v16[3] = &unk_1E5864F08;
      id v17 = *(id *)(a1 + 40);
      id v18 = v5;
      id v19 = v2;
      id v20 = *(id *)(a1 + 48);
      long long v23 = *(_OWORD *)(a1 + 72);
      id v22 = *(id *)(a1 + 64);
      id v21 = *(id *)(a1 + 56);
      id v6 = v5;
      [v6 performBlockAndWait:v16];

      uint64_t v7 = v17;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F59778];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      int64_t v25 = @"iCloud Photo Library is not enabled";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v11 = v14;
      uint64_t v12 = v15;
      uint64_t v13 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F59778];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"CPL hasn't been setup yet";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      uint64_t v11 = v9;
      uint64_t v12 = v10;
      uint64_t v13 = 2;
LABEL_8:
      uint64_t v7 = [v11 errorWithDomain:v12 code:v13 userInfo:v6];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v7);
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLShareParticipant participantsWithUUIDs:*(void *)(a1 + 32) inPhotoLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[PLShareParticipant participantWithPLShareParticipant:*(void *)(*((void *)&v17 + 1) + 8 * v8)];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v14[3] = &unk_1E5864EE0;
  id v16 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 64);
  [v10 removeParticipants:v3 fromSharedScopeWithIdentifier:v11 retentionPolicy:v12 exitSource:v13 completionHandler:v14];
}

uint64_t __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v16[3] = &unk_1E586DE10;
  void v16[4] = self;
  id v17 = v10;
  int64_t v20 = a4;
  int64_t v21 = a5;
  id v18 = v12;
  id v19 = v11;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v13 block:v16];
}

void __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 64);
      uint64_t v5 = *(void *)(a1 + 72);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
      v16[3] = &unk_1E5864EE0;
      id v18 = *(id *)(a1 + 56);
      id v17 = *(id *)(a1 + 48);
      [v2 startExitFromSharedScopeWithIdentifier:v3 retentionPolicy:v4 exitSource:v5 completionHandler:v16];

      uint64_t v6 = v18;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      int64_t v20 = @"iCloud Photo Library is not enabled";
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v10 = v13;
      uint64_t v11 = v14;
      uint64_t v12 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F59778];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"CPL hasn't been setup yet";
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v10 = v8;
      uint64_t v11 = v9;
      uint64_t v12 = 2;
LABEL_8:
      id v15 = [v10 errorWithDomain:v11 code:v12 userInfo:v6];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v15);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager deactivateScopeWithIdentifier:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
      v14[3] = &unk_1E58734E8;
      id v16 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      [v2 deactivateScopeWithIdentifier:v3 completionHandler:v14];

      uint64_t v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v18 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager activateScopeWithIdentifier:completionHandler:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E58710F0;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v9 block:v12];
}

void __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
      v14[3] = &unk_1E58734E8;
      id v16 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      [v2 activateScopeWithIdentifier:v3 completionHandler:v14];

      uint64_t v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F59778];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v18 = @"iCloud Photo Library is not enabled";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      uint64_t v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F59778];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"CPL hasn't been setup yet";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = 2;
LABEL_8:
      id v13 = [v8 errorWithDomain:v9 code:v10 userInfo:v4];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)configurationDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager configurationDidChange:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLCloudPhotoLibraryManager_configurationDidChange___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __53__PLCloudPhotoLibraryManager_configurationDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceManager];
  [v2 handleCPLConfigurationChange];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  uint64_t v3 = [WeakRetained computeCacheManager];
  [v3 notifyCPLConfiguration:*(void *)(a1 + 40)];
}

- (void)statusDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 statusDescription];
      *(_DWORD *)buf = 136315394;
      id v14 = "-[PLCloudPhotoLibraryManager statusDidChange:]";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager statusDidChange:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke;
  v11[3] = &unk_1E5875E18;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v9 block:v11];
}

void __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _disableiCPLAfterZoneWipedInCloudIfNecessary]) {
    return;
  }
  [*(id *)(a1 + 32) _setReadyForAnalysisWithCPLStatus:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifyCPLStatus:*(void *)(a1 + 40) didChange:1 andCPLConfiguration:0];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) currentObjectValueWithoutForcingEvaluation];
  uint64_t v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v2)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v8 = v5;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = "cacheDeleteSupport is non-null";
LABEL_21:
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_22:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v6 == 2)
    {
      uint64_t v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v6 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v8 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "cacheDeleteSupport is null";
    goto LABEL_21;
  }
  id v10 = [v2 exitDeleteTime];
  id v11 = [*(id *)(a1 + 40) exitDeleteTime];
  if (v10 == v11)
  {
    if (!*v3)
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v14 == 2)
      {
        __int16 v15 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v14 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        __int16 v15 = __CPLSystemLibraryOSLogDomain();
        }
      }
      long long v23 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v10;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "exitDeleteTime (%@) is unchanged", buf, 0xCu);
      }
    }
    id v18 = [*(id *)(a1 + 32) resourceManager];
    [v18 handleCPLStatusChange];
  }
  else
  {
    if (!*v3)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v12 == 2)
      {
        id v13 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v12 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v13 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v16 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v55 = v10;
        __int16 v56 = 2112;
        v57 = v11;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Updating exitDeleteTime for CacheDelete from %@ to %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _resetCacheDeleteSupport];
    [*(id *)(a1 + 32) _resetResourceManager];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
    id v18 = [WeakRetained cplSettings];

    if (v10)
    {
      if (!v11)
      {
        if (!*v3)
        {
          uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v19 == 2)
          {
            int64_t v20 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v19 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            int64_t v20 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v31 = v20;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Leaving exit mode, marking purgeable flags for all resources", buf, 2u);
          }
        }
        id v32 = +[PLInternalResource predicateForAvailableResources];
        id v33 = [*(id *)(a1 + 32) libraryServicesManager];
        v34 = [v33 databaseContext];
        v35 = (void *)[v34 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager statusDidChange:]_block_invoke"];

        [v18 setRunOnceFlag:4 error:0];
        long long v36 = *(void **)(a1 + 32);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke_2;
        v52[3] = &unk_1E5875E18;
        v52[4] = v36;
        id v18 = v18;
        id v53 = v18;
        [v36 markPurgeableResourcesMatchingPredicate:v32 urgency:0 inLibrary:v35 completionHandler:v52];
      }
    }
    else
    {
      if (!*v3)
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v21 == 2)
        {
          uint64_t v22 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v21 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v22 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v24 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Entering exit mode, clearing purgeable flags for all resources", buf, 2u);
        }
      }
      [v18 setRunOnceFlag:8 error:0];
      int64_t v25 = [*(id *)(a1 + 32) cacheDeleteSupport];
      int v26 = [v25 clearPurgeableFlagsForAllResources];

      if (v26)
      {
        if (!*v3)
        {
          uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v27 == 2)
          {
            uint64_t v28 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v27 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v28 = __CPLSystemLibraryOSLogDomain();
            }
          }
          long long v37 = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
          }
        }
        [v18 clearRunOnceFlag:8 error:0];
      }
      else if (!*v3)
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v29 == 2)
        {
          int v30 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v29 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          int v30 = __CPLSystemLibraryOSLogDomain();
          }
        }
        long long v38 = v30;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", buf, 2u);
        }
      }
      id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
      id v40 = [v39 cplSettings];
      char v41 = [v40 isKeepOriginalsEnabled];

      if ((v41 & 1) == 0)
      {
        if (!*v3)
        {
          uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v42 == 2)
          {
            long long v43 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v42 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            long long v43 = __CPLSystemLibraryOSLogDomain();
            }
          }
          long long v44 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Entering exit mode, automatically switch to download & keep original mode", buf, 2u);
          }
        }
        [*(id *)(a1 + 32) setPrefetchMode:1 error:0];
      }
    }
  }

  v45 = [*(id *)(a1 + 40) initialSyncDate];
  v46 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v47 = [v46 databaseContext];
  __int16 v48 = (void *)[v47 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager statusDidChange:]_block_invoke"];

  if (!*(unsigned char *)(*(void *)(a1 + 32) + 448))
  {
    [v45 timeIntervalSinceNow];
    if (fabs(v49) <= 60.0)
    {
      v50 = [v48 libraryServicesManager];
      int v51 = [v50 isSystemPhotoLibrary];

      if (v51)
      {
        [v48 reportLibrarySizeToDAS];
        *(unsigned char *)(*(void *)(a1 + 32) + 448) = 1;
      }
    }
  }
}

uint64_t __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke_2(uint64_t a1)
{
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Successfully marked all purgeable resources", v6, 2u);
    }
  }
  return [*(id *)(a1 + 40) clearRunOnceFlag:4 error:0];
}

- (void)_setToDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLCloudPhotoLibraryManager.m", 5206, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  id v8 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v9 = [v8 libraryBundle];
  id v10 = [v9 indicatorFileCoordinator];

  id v11 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _setToDownloadCountsForImages:videos:]"];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLCloudPhotoLibraryManager__setToDownloadCountsForImages_videos___block_invoke;
  block[3] = &unk_1E5873AA0;
  unint64_t v19 = a3;
  unint64_t v20 = a4;
  id v17 = v10;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(serialQueue, block);
}

uint64_t __67__PLCloudPhotoLibraryManager__setToDownloadCountsForImages_videos___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDownloadCountsForImages:*(void *)(a1 + 48) videos:*(void *)(a1 + 56)];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.transfercountchange", 0, 0, 0);
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 stillAlive];
}

- (BOOL)_hasIncomingWorkFileMarker
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [MEMORY[0x1E4F8B840] takingPhotoIndicatorFilePath];
  uint64_t v5 = [MEMORY[0x1E4F8B840] takingVideoIndicatorFilePath];
  uint64_t v6 = [MEMORY[0x1E4F8B840] nebuladkeepalivepath];
  BOOL v7 = ([v3 fileExistsAtPath:v4] & 1) != 0
    || ([v3 fileExistsAtPath:v5] & 1) != 0
    || ([v3 fileExistsAtPath:v6] & 1) != 0
    || [(PLCloudPhotoLibraryManager *)self _hasAvalancheIncomingWork];

  return v7;
}

- (BOOL)_hasAvalancheIncomingWork
{
  uint64_t v2 = [MEMORY[0x1E4F8B850] incomingDirectoryPath];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [v3 enumeratorAtPath:v2];
  uint64_t v5 = 0;
  uint64_t v6 = *MEMORY[0x1E4F8C610];
  while (1)
  {
    BOOL v7 = [v4 nextObject];

    if (!v7) {
      break;
    }
    id v8 = [v7 pathExtension];
    int v9 = [v8 isEqualToString:v6];

    uint64_t v5 = v7;
    id v10 = v7;
    if (v9) {
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_6:

  return v7 != 0;
}

- (void)_checkForWorkInProgress
{
  uint64_t v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "checking workInProgress", buf, 2u);
    }
  }
  if ([(PLCloudPhotoLibraryManager *)self _hasIncomingWorkFileMarker])
  {
    if (!*v3)
    {
      int64_t v7 = self->_libraryMode;
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v11 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Camera work is not yet finished, retrying later", v18, 2u);
      }
    }
  }
  else
  {
    if (!*v3)
    {
      int64_t v9 = self->_libraryMode;
      if (v9 == 2)
      {
        id v10 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v9 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v10 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v12 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v20 = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Camera work is finished, try to log out", v20, 2u);
      }
    }
    if (self->_state == 6)
    {
      if (!*v3)
      {
        int64_t v13 = self->_libraryMode;
        if (v13 == 2)
        {
          id v14 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v13 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v14 = __CPLSystemLibraryOSLogDomain();
          }
        }
        __int16 v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unint64_t v19 = 0;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "assetd is idle, try to log out", v19, 2u);
        }
      }
      uint64_t v16 = [(PLCloudPhotoLibraryManager *)self _idleStateTransitionOneTimeAction];
      id v17 = (void *)v16;
      if (v16) {
        (*(void (**)(uint64_t))(v16 + 16))(v16);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _stopWorkInProgressTimer];
  }
}

- (void)_stopWorkInProgressTimer
{
  workInProgressTimer = self->_workInProgressTimer;
  if (workInProgressTimer)
  {
    dispatch_source_cancel(workInProgressTimer);
    uint64_t v4 = self->_workInProgressTimer;
    self->_workInProgressTimer = 0;
  }
}

- (void)_startWorkInProgressTimer
{
  uint64_t v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Camera still has work, assetsd is idle", buf, 2u);
    }
  }
  if (!self->_workInProgressTimer)
  {
    if (!*v3)
    {
      int64_t v7 = self->_libraryMode;
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Setting up work in progress timer", buf, 2u);
      }
    }
    int64_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    pl_dispatch_source_set_event_handler();
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v13, v10, 0x77359400uLL, 0);
    workInProgressTimer = self->_workInProgressTimer;
    self->_workInProgressTimer = (OS_dispatch_source *)v13;
    uint64_t v12 = v13;

    dispatch_resume((dispatch_object_t)self->_workInProgressTimer);
  }
}

void *__55__PLCloudPhotoLibraryManager__startWorkInProgressTimer__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[29] == *(void *)(a1 + 40)) {
    return (void *)[result _checkForWorkInProgress];
  }
  return result;
}

- (void)endUserSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PLCloudBatchUploader *)self->_uploader setShouldGenerateDerivatives:0];
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager endUserSessionWithCompletionHandler:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PLCloudPhotoLibraryManager_endUserSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

uint64_t __66__PLCloudPhotoLibraryManager_endUserSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  if (v3 == 8)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = v2[12];
      if (v6 == 2)
      {
        int64_t v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v6 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v12 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is paused, will unpause", (uint8_t *)&v15, 2u);
      }

      uint64_t v2 = *(void **)(a1 + 32);
    }
    [v2 _setIdleStateTransitionOneTimeAction:*(void *)(a1 + 40)];
    *(_WORD *)(*(void *)(a1 + 32) + 132) = 3;
    return [*(id *)(a1 + 32) _unpause];
  }
  else if (v3 == 6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = v2[12];
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      dispatch_time_t v10 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is idle", (uint8_t *)&v15, 2u);
      }

      uint64_t v2 = *(void **)(a1 + 32);
    }
    if ([v2 _hasIncomingWorkFileMarker])
    {
      [*(id *)(a1 + 32) _setIdleStateTransitionOneTimeAction:*(void *)(a1 + 40)];
      return [*(id *)(a1 + 32) _startWorkInProgressTimer];
    }
    else
    {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v8 = v2[12];
      if (v8 == 2)
      {
        int64_t v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
        int v15 = 138412290;
        uint64_t v16 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is not yet idle, assetsd state: %@", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v2 = *(void **)(a1 + 32);
    }
    return [v2 _setIdleStateTransitionOneTimeAction:*(void *)(a1 + 40)];
  }
}

- (int64_t)currentResetSyncType
{
  return self->_pendingResetSyncType;
}

- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress
{
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  uint64_t result = ($3CC19D079FD0B010EE84973AA846B91B *)self->_uploadTracker;
  if (result) {
    return ($3CC19D079FD0B010EE84973AA846B91B *)[($3CC19D079FD0B010EE84973AA846B91B *)result currentTransferProgress];
  }
  return result;
}

- (unint64_t)totalNumberOfDeferredAssets
{
  return [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalNumberOfDeferredAssets];
}

- (unint64_t)totalUploadedOriginalSize
{
  return [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalUploadedOriginalSize];
}

- (unint64_t)totalSizeOfUnpushedOriginals
{
  return [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalSizeOfUnpushedOriginals];
}

- (unint64_t)totalNumberOfUploadedMasters
{
  return [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalNumberOfUploadedMasters];
}

- (unint64_t)totalNumberOfUnpushedMasters
{
  return [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalNumberOfUnpushedMasters];
}

- (unint64_t)_inq_numberOfOtherItemsToDownloadInLibrary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self _inq_numberOfOtherItemsToUploadInLibrary:v4];
  uint64_t v6 = [(PLCloudPhotoLibraryManager *)self cplStatus];
  int64_t v7 = [v6 cloudAssetCountPerType];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke;
  v21[3] = &unk_1E5864EB8;
  v21[4] = &v22;
  [v7 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v8 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      dispatch_time_t v10 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      dispatch_time_t v10 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = v23[3];
      uint64_t v13 = v18[3];
      *(_DWORD *)buf = 67109632;
      int v27 = v12;
      __int16 v28 = 1024;
      int v29 = v13;
      __int16 v30 = 1024;
      int v31 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "_inq_numberOfOtherItemsToDownload serverCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }
  }
  uint64_t v14 = v23[3];
  uint64_t v15 = v18[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  return (v14 - (v5 + v15)) & ~((uint64_t)(v14 - (v5 + v15)) >> 63);
}

void __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [(id)*MEMORY[0x1E4F44448] identifier];
  if ([v9 isEqualToString:v6])
  {
  }
  else
  {
    int64_t v7 = [(id)*MEMORY[0x1E4F44400] identifier];
    char v8 = [v9 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v5 unsignedIntegerValue];
    }
  }
}

void __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 392) unsignedIntegerValue];
  uint64_t v2 = (void *)a1[4];
  if (!v2[49])
  {
    uint64_t v3 = [v2 cplStatus];
    id v4 = [v3 lastSuccessfulSyncDate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_3;
    v10[3] = &unk_1E5875340;
    id v5 = (void *)a1[5];
    uint64_t v13 = a1[6];
    id v11 = v5;
    id v12 = v4;
    id v6 = v4;
    [v11 performBlockAndWait:v10];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 392);
    *(void *)(v8 + 392) = v7;
  }
}

uint64_t __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) numberOfCPLSupportedAssetsOfKind:2 includingTrashedSinceDate:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) numberOfCPLSupportedAssetsOfKind:3 includingTrashedSinceDate:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += result;
  return result;
}

- (unint64_t)_inq_numberOfVideosToDownloadInLibrary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self _inq_numberOfVideosToUploadInLibrary:v4];
  id v6 = [(PLCloudPhotoLibraryManager *)self cplStatus];
  uint64_t v7 = [v6 cloudAssetCountPerType];
  uint64_t v8 = [(id)*MEMORY[0x1E4F44448] identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v11 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v19[3];
      *(_DWORD *)buf = 67109632;
      int v23 = v10;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v5;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "_inq_numberOfVideosToDownload serverCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }
  }
  uint64_t v16 = v19[3];

  _Block_object_dispose(&v18, 8);
  return (v10 - (v5 + v16)) & ~((uint64_t)(v10 - (v5 + v16)) >> 63);
}

void __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 384) unsignedIntegerValue];
  uint64_t v2 = (void *)a1[4];
  if (!v2[48])
  {
    uint64_t v3 = [v2 cplStatus];
    id v4 = [v3 lastSuccessfulSyncDate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke_2;
    v10[3] = &unk_1E5875340;
    unint64_t v5 = (void *)a1[5];
    uint64_t v13 = a1[6];
    id v11 = v5;
    id v12 = v4;
    id v6 = v4;
    [v11 performBlockAndWait:v10];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 384);
    *(void *)(v8 + 384) = v7;
  }
}

uint64_t __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfCPLSupportedAssetsOfKind:1 includingTrashedSinceDate:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inq_numberOfPhotosToDownloadInLibrary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self _inq_numberOfPhotosToUploadInLibrary:v4];
  id v6 = [(PLCloudPhotoLibraryManager *)self cplStatus];
  uint64_t v7 = [v6 cloudAssetCountPerType];
  uint64_t v8 = [(id)*MEMORY[0x1E4F44400] identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v11 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v19[3];
      *(_DWORD *)buf = 67109632;
      int v23 = v10;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v5;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "_inq_numberOfPhotosToDownload serverPhotoCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }
  }
  uint64_t v16 = v19[3];

  _Block_object_dispose(&v18, 8);
  return (v10 - (v5 + v16)) & ~((uint64_t)(v10 - (v5 + v16)) >> 63);
}

void __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 376) unsignedIntegerValue];
  uint64_t v2 = (void *)a1[4];
  if (!v2[47])
  {
    uint64_t v3 = [v2 cplStatus];
    id v4 = [v3 lastSuccessfulSyncDate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke_2;
    v10[3] = &unk_1E5875340;
    unint64_t v5 = (void *)a1[5];
    uint64_t v13 = a1[6];
    id v11 = v5;
    id v12 = v4;
    id v6 = v4;
    [v11 performBlockAndWait:v10];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 376);
    *(void *)(v8 + 376) = v7;
  }
}

uint64_t __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfCPLSupportedAssetsOfKind:0 includingTrashedSinceDate:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inq_numberOfVideosToUploadInLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  uint64_t v6 = [v5 numberOfVideosToUpload];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfVideosToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }
  }
  if (v15[3] + v6 >= self->_boundForUploadingVideos) {
    unint64_t boundForUploadingVideos = self->_boundForUploadingVideos;
  }
  else {
    unint64_t boundForUploadingVideos = v15[3] + v6;
  }

  _Block_object_dispose(&v14, 8);
  return boundForUploadingVideos;
}

void __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 360) unsignedIntegerValue];
  if (!*(void *)(*(void *)(a1 + 32) + 360))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E5875E68;
    long long v6 = *(_OWORD *)(a1 + 40);
    [(id)v6 performBlockAndWait:v5];
    uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 360);
    *(void *)(v3 + 360) = v2;
  }
}

uint64_t __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfUnpushedAssetsOfKind:1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inq_numberOfPhotosToUploadInLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  uint64_t v6 = [v5 numberOfImagesToUpload];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfPhotosToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }
  }
  if (v15[3] + v6 >= self->_boundForUploadingPhotos) {
    unint64_t boundForUploadingPhotos = self->_boundForUploadingPhotos;
  }
  else {
    unint64_t boundForUploadingPhotos = v15[3] + v6;
  }

  _Block_object_dispose(&v14, 8);
  return boundForUploadingPhotos;
}

void __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 352) unsignedIntegerValue];
  if (!*(void *)(*(void *)(a1 + 32) + 352))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E5875E68;
    long long v6 = *(_OWORD *)(a1 + 40);
    [(id)v6 performBlockAndWait:v5];
    uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 352);
    *(void *)(v3 + 352) = v2;
  }
}

uint64_t __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfUnpushedAssetsOfKind:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_inq_numberOfOtherItemsToUploadInLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  uint64_t v6 = [v5 numberOfOtherItemsToUpload];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfOtherItemsToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }
  }
  if (v15[3] + v6 >= self->_boundForUploadingOtherItems) {
    unint64_t boundForUploadingOtherItems = self->_boundForUploadingOtherItems;
  }
  else {
    unint64_t boundForUploadingOtherItems = v15[3] + v6;
  }

  _Block_object_dispose(&v14, 8);
  return boundForUploadingOtherItems;
}

void __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 368) unsignedIntegerValue];
  if (!*(void *)(*(void *)(a1 + 32) + 368))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E5875E68;
    long long v6 = *(_OWORD *)(a1 + 40);
    [(id)v6 performBlockAndWait:v5];
    uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 368);
    *(void *)(v3 + 368) = v2;
  }
}

uint64_t __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) numberOfUnpushedAssetsOfKind:2];
  uint64_t result = [*(id *)(a1 + 32) numberOfUnpushedAssetsOfKind:3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (void)_notifyCPLStatus:(id)a3 didChange:(BOOL)a4 andCPLConfiguration:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v10 = [v8 initialSyncDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v12 = [WeakRetained computeCacheManager];

  if (v9) {
    [v12 notifyCPLConfiguration:v9];
  }
  int v13 = [v8 hasFinishedInitialDownload];
  BOOL v14 = v13;
  if (self->_hasCompletedInitialDownload || !v13)
  {
    if ([v8 isExceedingQuota] && v12)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          uint64_t v18 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (libraryMode == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v18 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v22 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Notifying compute cache to restore because library is over quota", (uint8_t *)&v27, 2u);
        }
      }
      [v12 notifyReadyToRestoreWithInitialSyncDate:v10];
    }
  }
  else
  {
    if (v12)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t v15 = self->_libraryMode;
        if (v15 == 2)
        {
          uint64_t v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v19 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Notifying compute cache to restore because initial sync date was initially set", (uint8_t *)&v27, 2u);
        }
      }
      if (!v10)
      {
        uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
      }
      [v12 notifyReadyToRestoreWithInitialSyncDate:v10];
    }
    if (v6
      && [(PLCloudPhotoLibraryManager *)self _shouldResetICloudBackupExclusionPaths])
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t v20 = self->_libraryMode;
        if (v20 == 2)
        {
          int v21 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v20 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          int v21 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v23 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = [(PLCloudPhotoLibraryManager *)self pathManager];
          int v25 = [v24 libraryURL];
          int v27 = 138412290;
          uint64_t v28 = v25;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Setting iCPL-enabled exclusion flags on App Library because initial sync date was initially set: %@", (uint8_t *)&v27, 0xCu);
        }
      }
      __int16 v26 = [(PLCloudPhotoLibraryManager *)self pathManager];
      [v26 resetBackupExclusionPathsForBackupType:3];
    }
  }
  self->_hasCompletedInitialDownload = v14;
}

- (void)_updateTransferCountsInLibrary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _updateTransferCountsInLibrary:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PLCloudPhotoLibraryManager__updateTransferCountsInLibrary___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __61__PLCloudPhotoLibraryManager__updateTransferCountsInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_inq_numberOfPhotosToDownloadInLibrary:", *(void *)(a1 + 40));
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_inq_numberOfVideosToDownloadInLibrary:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) _setToDownloadCountsForImages:v2 videos:v3];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      unint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      unint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "updateTransferCounts, download i: %d v: %d", (uint8_t *)v7, 0xEu);
    }
  }
}

- (void)clearPrefetchState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__PLCloudPhotoLibraryManager_clearPrefetchState__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:0 block:v2];
}

void __48__PLCloudPhotoLibraryManager_clearPrefetchState__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resourceManager];
  [v1 clearPrefetchState];
}

- (void)_disableOpportunisticTasks
{
  if (!self->_opportunisticTasksWasDisabled)
  {
    uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v4 = [v3 databaseContext];
    unint64_t v5 = (void *)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager _disableOpportunisticTasks]"];

    if (v5)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          id v7 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (libraryMode == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v7 = __CPLSystemLibraryOSLogDomain();
          }
        }
        __int16 v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v9 = 0;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Disabling opportunistic tasks before CPL initial sync", v9, 2u);
        }
      }
      [v5 disableOpportunisticTasks];
      self->_opportunisticTasksWasDisabled = 1;
    }
  }
}

- (void)_enableOpportunisticTasks
{
  if (self->_opportunisticTasksWasDisabled)
  {
    uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v4 = [v3 databaseContext];
    unint64_t v5 = (void *)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager _enableOpportunisticTasks]"];

    if (v5)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          id v7 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (libraryMode == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v7 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v10 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Enabling opportunistic tasks after CPL initial sync", buf, 2u);
        }
      }
      [v5 enableOpportunisticTasks];
      self->_opportunisticTasksWasDisabled = 0;
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v8 = self->_libraryMode;
      if (v8 == 2)
      {
        int v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v11 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to enable opportunistic tasks. Unable to access photolibrary", v12, 2u);
      }
    }
  }
}

- (void)_setReadyForAnalysisWithCPLStatus:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  char v5 = (char)v6;
  if (v6)
  {
    if ([v6 hasFinishedInitialDownload]) {
      char v5 = 1;
    }
    else {
      char v5 = [v6 isExceedingQuota];
    }
  }
  v4->_unsafe_readyForAnalysis = v5;
  objc_sync_exit(v4);

  if (v4->_unsafe_readyForAnalysis) {
    [(PLCloudPhotoLibraryManager *)v4 _enableOpportunisticTasks];
  }
}

- (BOOL)isReadyForAnalysis
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL unsafe_readyForAnalysis = v2->_unsafe_readyForAnalysis;
  objc_sync_exit(v2);

  return unsafe_readyForAnalysis;
}

- (void)cplConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PLCloudPhotoLibraryManager_cplConfigurationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E58742F0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:0 block:v6];
}

void __68__PLCloudPhotoLibraryManager_cplConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) cplConfiguration];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)setCPLConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (CPLConfiguration *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = v5->_libraryMode;
    if (libraryMode == 2)
    {
      id v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager setting cplConfiguration to %p", (uint8_t *)&v10, 0xCu);
    }
  }
  cplConfiguration = v5->_cplConfiguration;
  v5->_cplConfiguration = v4;

  objc_sync_exit(v5);
}

- (id)cplConfiguration
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_cplConfiguration;
  objc_sync_exit(v2);

  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F59AC0] == 0;
  }
  if (v4)
  {
    int64_t libraryMode = v2->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager cplConfiguration is nil", v9, 2u);
    }
  }
  return v3;
}

- (void)setCPLStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (CPLStatus *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = v5->_libraryMode;
    if (libraryMode == 2)
    {
      id v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager setting cplStatus to %p", (uint8_t *)&v10, 0xCu);
    }
  }
  unsafe_cplStatus = v5->_unsafe_cplStatus;
  v5->_unsafe_cplStatus = v4;

  objc_sync_exit(v5);
}

- (id)cplStatus
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_unsafe_cplStatus;
  objc_sync_exit(v2);

  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F59AC0] == 0;
  }
  if (v4)
  {
    int64_t libraryMode = v2->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager cplStatus is nil", v9, 2u);
    }
  }
  return v3;
}

- (void)getCPLStateForDebug:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PLCloudPhotoLibraryManager_getCPLStateForDebug_completionHandler___block_invoke;
  v8[3] = &unk_1E5871E30;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:0 block:v8];
}

void __68__PLCloudPhotoLibraryManager_getCPLStateForDebug_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
  BOOL v4 = [*(id *)(a1 + 32) _inMemoryTrackerStateForDebug];
  id v5 = [*(id *)(a1 + 32) resourceManager];
  id v6 = [v5 statusForDebug:*(unsigned __int8 *)(a1 + 48)];
  id v7 = [v2 stringWithFormat:@"%@\n%@\n%@", v3, v4, v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isPausedForDownloadRequestHighPriority:(BOOL)a3
{
  return !a3 && self->_state == 8;
}

- (void)_appWithBundleIdentifier:(id)a3 changedStateToForeground:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _appWithBundleIdentifier:changedStateToForeground:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke;
  v9[3] = &unk_1E5874318;
  BOOL v11 = a4;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v7 block:v9];
}

void __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[8]) {
    return;
  }
  if (v2[12])
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    BOOL v4 = [v2 cplLibrary];
    id v10 = v4;
    if (v3)
    {
      uint64_t v5 = 0;
LABEL_15:
      [v4 noteClientIsInForegroundQuietly:v5];
LABEL_18:

      return;
    }
    goto LABEL_17;
  }
  if (kCPLMaximumOutgoingResourcesSize_block_invoke_onceToken != -1) {
    dispatch_once(&kCPLMaximumOutgoingResourcesSize_block_invoke_onceToken, &__block_literal_global_517);
  }
  if ([(id)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification containsObject:*(void *)(a1 + 40)])
  {
    int v6 = *(unsigned __int8 *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) cplLibrary];
    id v8 = v7;
    if (v6) {
      [v7 noteClientIsInForegroundQuietly:0];
    }
    else {
      [v7 noteClientIsInBackground];
    }
  }
  if ([(id)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification containsObject:*(void *)(a1 + 40)])
  {
    int v9 = *(unsigned __int8 *)(a1 + 48);
    BOOL v4 = [*(id *)(a1 + 32) cplLibrary];
    id v10 = v4;
    if (v9)
    {
      uint64_t v5 = 1;
      goto LABEL_15;
    }
LABEL_17:
    [v4 noteClientIsInBackground];
    goto LABEL_18;
  }
}

void __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke_2()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.mobileslideshow", @"com.apple.mobileslideshow.photospicker", @"com.apple.mobileslideshow.photo-picker", 0);
  uint64_t v1 = (void *)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification;
  kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification = v0;

  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.MobileSMS", 0);
  int v3 = (void *)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification;
  kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification = v2;
}

- (void)_cameraChangedStateToForeground:(BOOL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _cameraChangedStateToForeground:]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PLCloudPhotoLibraryManager__cameraChangedStateToForeground___block_invoke;
  v6[3] = &unk_1E58748B0;
  void v6[4] = self;
  BOOL v7 = a3;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v6];
}

void *__62__PLCloudPhotoLibraryManager__cameraChangedStateToForeground___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[9]) {
    return (void *)[result setPause:*(unsigned __int8 *)(a1 + 40) reason:1];
  }
  return result;
}

- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CFDataRef v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:0];
  if ([(__CFData *)v8 length])
  {
    int v9 = (void *)MEMORY[0x1E4F8CDF8];
    id v10 = [v7 pathExtension];
    BOOL v11 = [v9 typeWithFilenameExtension:v10 conformingToType:*MEMORY[0x1E4F44400]];

    if (v11)
    {
      uint64_t v29 = *MEMORY[0x1E4F2FF78];
      uint64_t v12 = [v11 identifier];
      v30[0] = v12;
      CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    }
    else
    {
      CFDictionaryRef v13 = 0;
    }
    CGImageSourceRef v16 = CGImageSourceCreateWithData(v8, v13);
    if (v16)
    {
      CGImageSourceRef v17 = v16;
      [v6 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:v16 imageData:v8 forceSRGBConversion:0];
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          int v19 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (libraryMode == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          int v19 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v22 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v25 = 138412546;
          id v26 = v6;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Generated new thumbnail for asset %@ with %@", (uint8_t *)&v25, 0x16u);
        }
      }
      CFRelease(v17);
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v20 = self->_libraryMode;
      if (v20 == 2)
      {
        int v21 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v20 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v21 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v23 = v21;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = [v7 path];
        int v25 = 138412290;
        id v26 = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Unable to create image source for '%@'.", (uint8_t *)&v25, 0xCu);
      }
    }

LABEL_37:
    goto LABEL_38;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t v14 = self->_libraryMode;
    if (v14 == 2)
    {
      int64_t v15 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v14 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      int64_t v15 = __CPLSystemLibraryOSLogDomain();
      }
    }
    BOOL v11 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to read imageData from file '%@'.", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_38:
}

- (void)_updateThumbnailDataForAsset:(id)a3 withImageFileURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CFDataRef v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:0];
  if ([(__CFData *)v8 length])
  {
    uint64_t v9 = [v6 uniformTypeIdentifier];
    id v10 = v9;
    if (v9)
    {
      uint64_t v22 = *MEMORY[0x1E4F2FF78];
      uint64_t v23 = v9;
      CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    }
    else
    {
      CFDictionaryRef v11 = 0;
    }
    CGImageSourceRef v14 = CGImageSourceCreateWithData(v8, v11);
    if (v14)
    {
      int64_t v15 = v14;
      uint64_t v20 = *MEMORY[0x1E4F2FDF8];
      uint64_t v21 = *MEMORY[0x1E4F1CFD0];
      CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(v15, 0, v16);
      [v6 setThumbnailDataFromImageProperties:v17];
      CFRelease(v15);
    }
    else
    {
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        int v19 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v19 = __CPLSystemLibraryOSLogDomain();
        }
      }
      CFDictionaryRef v16 = (const __CFDictionary *)v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_19B3C7000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Unable to create image source for '%@'.", buf, 0xCu);
      }
    }

    goto LABEL_26;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t v12 = self->_libraryMode;
    if (v12 == 2)
    {
      CFDictionaryRef v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v12 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      CFDictionaryRef v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v10 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to read imageData from file '%@'.", buf, 0xCu);
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (signed)_placeHolderKindFromCPLResourceType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 1;
  if (a3 - 1 < 0x1C && ((0x9C3C07Fu >> v4) & 1) != 0) {
    return word_19BA9A768[v4];
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    CFDataRef v8 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [MEMORY[0x1E4F59940] descriptionForResourceType:a3];
      int v11 = 138412290;
      int64_t v12 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unsupported media resource type %@ to download", (uint8_t *)&v11, 0xCu);
    }
  }
  return 0;
}

- (void)_updateWithCPLResource:(id)a3 isHighPriority:(BOOL)a4 inLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PLCloudPhotoLibraryManager__updateWithCPLResource_isHighPriority_inLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5873988;
  id v15 = v10;
  CFDictionaryRef v16 = self;
  id v17 = v11;
  BOOL v18 = a4;
  id v12 = v11;
  id v13 = v10;
  [v12 performTransaction:v14 completionHandler:a6];
}

void __96__PLCloudPhotoLibraryManager__updateWithCPLResource_isHighPriority_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) identity];
  int v3 = [v2 fileURL];
  unint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v3)
  {
    uint64_t v5 = [v3 path];
    char v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      id v7 = [*(id *)(v1 + 32) itemScopedIdentifier];
      CFDataRef v8 = +[PLManagedAsset assetWithScopedIdentifier:v7 inLibrary:*(void *)(v1 + 48) prefetchResources:1];
      uint64_t v217 = v1;
      uint64_t v218 = [*(id *)(v1 + 32) resourceType];
      v210 = v3;
      v200 = v8;
      if (v8)
      {
        uint64_t v9 = (unsigned char *)MEMORY[0x1E4F59AC0];
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v10 = *(void *)(*(void *)(v217 + 40) + 96);
          if (v10 == 2)
          {
            id v11 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v10 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v11 = __CPLSystemLibraryOSLogDomain();
            }
          }
          BOOL v18 = v11;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = *(void *)(v217 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v8;
            __int16 v239 = 2112;
            *(void *)v240 = v19;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Updating owningAsset %@ with resource %@", buf, 0x16u);
          }
        }
        uint64_t v20 = [*(id *)(v217 + 40) _placeHolderKindFromCPLResourceType:v218];
        int v21 = [v8 cloudPlaceholderKind];
        if (v218 == 18 || v218 == 24)
        {
          if (!*v9)
          {
            uint64_t v22 = *(void *)(*(void *)(v217 + 40) + 96);
            if (v22 == 2)
            {
              uint64_t v23 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v22 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v23 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v28 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              int v29 = [v8 cloudPlaceholderKind];
              *(_DWORD *)buf = 67109120;
              LODWORD(v238) = v29;
              _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Not changing the cloud placeholder kind (%d), since we are only downloading the video complement", buf, 8u);
            }
          }
        }
        else if (v21 && v21 < (int)v20)
        {
          if (!*v9)
          {
            uint64_t v24 = *(void *)(*(void *)(v217 + 40) + 96);
            if (v24 == 2)
            {
              id v25 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v24 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v25 = __CPLSystemLibraryOSLogDomain();
              }
            }
            v132 = v25;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v238) = v20;
              _os_log_impl(&dword_19B3C7000, v132, OS_LOG_TYPE_DEBUG, "Setting cloud placeholder kind to %d", buf, 8u);
            }

            CFDataRef v8 = v200;
          }
          [v8 setCloudPlaceholderKind:v20];
        }
        __int16 v30 = [*(id *)(v217 + 48) thumbnailManager];
        if ([v8 isCloudPlaceholder])
        {
          int v31 = [v30 thumbnailJPEGPathForPhoto:v8];
        }
        else
        {
          int v31 = 0;
        }
        uint64_t v32 = [v8 thumbnailIdentifier];
        v216 = v30;
        id v33 = [v30 beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:v32];

        int v34 = [v8 hasMasterThumb] ^ 1;
        if ((v34 & 1) != 0 || v218 == 5)
        {
          if (!*v9)
          {
            uint64_t v37 = *(void *)(*(void *)(v217 + 40) + 96);
            if (v37 == 2)
            {
              long long v38 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v37 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              long long v38 = __CPLSystemLibraryOSLogDomain();
              }
            }
            long long v43 = v38;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v238 = v200;
              __int16 v239 = 1024;
              *(_DWORD *)v240 = v34;
              *(_WORD *)&v240[4] = 1024;
              *(_DWORD *)&v240[6] = v218 == 5;
              _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset %@ (missingThumbnail %d, isPlaceholderThumbnail %d)", buf, 0x18u);
            }
          }
          CFDataRef v8 = v200;
          [*(id *)(v217 + 40) _updateAsset:v200 withImageFileURL:v210];
        }
        else
        {
          CFDataRef v8 = v200;
          if (!*v9)
          {
            uint64_t v35 = *(void *)(*(void *)(v217 + 40) + 96);
            if (v35 == 2)
            {
              long long v36 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v35 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              long long v36 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v39 = v36;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              id v40 = [v200 cloudAssetGUID];
              *(_DWORD *)buf = 138412290;
              v238 = v40;
              _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEBUG, "Skipping thumbnail generation for asset with cloudAssetGUID %@", buf, 0xCu);

              CFDataRef v8 = v200;
            }
          }
          if (v31
            && ([v8 isCloudPlaceholder] & 1) == 0
            && [v8 isVideo]
            && [v4 fileExistsAtPath:v31]
            && [v8 isVideo])
          {
            char v41 = *(void **)(v217 + 40);
            uint64_t v42 = [v8 pathForVideoPreviewFile];
            [v41 _linkFileFrom:v31 to:v42];

            CFDataRef v8 = v200;
          }
        }
        long long v44 = [v8 thumbnailIdentifier];
        [v30 endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:v44 withToken:v33];

        if (v218 == 5) {
          goto LABEL_236;
        }
        if (v218 == 27)
        {
          id v235 = 0;
          v45 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v210 options:0 error:&v235];
          id v46 = v235;
          if (v45)
          {
            [v200 additionalAttributes];
            v48 = uint64_t v47 = v7;
            [v48 setMediaMetadataData:v45];

            id v7 = v47;
            +[PLManagedAsset processAdjustedMediaMetadataForAsset:v200];
          }
          else if (!*v9)
          {
            uint64_t v55 = *(void *)(*(void *)(v217 + 40) + 96);
            __int16 v56 = v7;
            if (v55 == 2)
            {
              v57 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v55 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              v57 = __CPLSystemLibraryOSLogDomain();
              }
            }
            v126 = v57;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v238 = v210;
              __int16 v239 = 2112;
              *(void *)v240 = v46;
              _os_log_impl(&dword_19B3C7000, v126, OS_LOG_TYPE_ERROR, "Unable to read metadata file at url: %@, error: %@", buf, 0x16u);
            }

            id v7 = v56;
          }

LABEL_236:
          id v234 = 0;
          char v127 = [v4 removeItemAtURL:v210 error:&v234];
          id v50 = v234;
          if ((v127 & 1) != 0 || *v9) {
            goto LABEL_252;
          }
          uint64_t v128 = *(void *)(*(void *)(v217 + 40) + 96);
          if (v128 == 2)
          {
            v129 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v128 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            v129 = __CPLSystemLibraryOSLogDomain();
            }
          }
          v125 = v129;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          {
            v130 = *(NSObject **)(v217 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v130;
            __int16 v239 = 2112;
            *(void *)v240 = v50;
            _os_log_impl(&dword_19B3C7000, v125, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
          }
LABEL_251:

LABEL_252:
          CFDataRef v8 = v200;
LABEL_253:

          int v3 = v210;
          goto LABEL_254;
        }
        uint64_t v49 = -[NSObject assetResourceForCPLType:](v8, "assetResourceForCPLType:");
        if (!v49)
        {
          if (*v9)
          {
            id v50 = 0;
            goto LABEL_253;
          }
          uint64_t v58 = *(void *)(*(void *)(v217 + 40) + 96);
          if (v58 == 2)
          {
            v59 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v58 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            v59 = __CPLSystemLibraryOSLogDomain();
            }
          }
          v125 = v59;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v131 = [MEMORY[0x1E4F59940] descriptionForResourceType:v218];
            *(_DWORD *)buf = 138412546;
            v238 = v131;
            __int16 v239 = 2112;
            *(void *)v240 = v7;
            _os_log_impl(&dword_19B3C7000, v125, OS_LOG_TYPE_DEFAULT, "Didn't find resource type: %@ in asset: %@ we tried to mark as available", buf, 0x16u);
          }
          id v50 = 0;
          goto LABEL_251;
        }
        id v50 = (id)v49;
        if (_os_feature_enabled_impl())
        {
          v199 = v7;
          int v51 = [*(id *)(v217 + 48) pathManager];
          BOOL v52 = +[PLLockedResourceTransferRecovery isStaleResourceURL:v210 asset:v200 resource:v50 pathManager:v51];

          if (v52)
          {
            if (!*v9)
            {
              uint64_t v53 = *(void *)(*(void *)(v217 + 40) + 96);
              if (v53 == 2)
              {
                v54 = __CPLAppLibraryOSLogDomain();
              }
              else
              {
                if (v53 == 1) {
                  __CPLSyndicationOSLogDomain();
                }
                else {
                v54 = __CPLSystemLibraryOSLogDomain();
                }
              }
              v169 = v54;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v170 = [v200 uuid];
                [v210 path];
                v172 = v171 = v2;
                *(_DWORD *)buf = 138543618;
                v238 = v170;
                __int16 v239 = 2112;
                *(void *)v240 = v172;
                _os_log_impl(&dword_19B3C7000, v169, OS_LOG_TYPE_DEFAULT, "Detected asset resource download for asset %{public}@ to stale bundle scope location: '%@'", buf, 0x16u);

                uint64_t v2 = v171;
              }
            }
            v206 = v4;
            v173 = v2;
            uint64_t v174 = [v200 bundleScope];
            v175 = [*(id *)(v217 + 48) pathManager];
            v125 = +[PLLockedResourceTransferRecovery destinationURLForResource:v50 asset:v200 bundleScope:v174 pathManager:v175];

            v176 = (void *)MEMORY[0x1E4F8B908];
            v177 = [*(id *)(v217 + 48) pathManager];
            v178 = [v177 capabilities];
            id v233 = 0;
            char v179 = [v176 secureMoveItemAtURL:v210 toURL:v125 capabilities:v178 error:&v233];
            id v180 = v233;

            int v181 = *v9;
            if ((v179 & 1) == 0)
            {
              if (!*v9)
              {
                uint64_t v184 = *(void *)(*(void *)(v217 + 40) + 96);
                if (v184 == 2)
                {
                  v185 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v184 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  v185 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                v189 = v185;
                if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
                {
                  v190 = *(NSObject **)(v217 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v190;
                  __int16 v239 = 2112;
                  *(void *)v240 = v180;
                  _os_log_impl(&dword_19B3C7000, v189, OS_LOG_TYPE_ERROR, "Unable to move stale cloud resource %@: %@", buf, 0x16u);
                }
              }
              id v232 = 0;
              char v191 = [v206 removeItemAtURL:v210 error:&v232];
              id v192 = v232;
              if ((v191 & 1) == 0 && !*v9)
              {
                uint64_t v193 = *(void *)(*(void *)(v217 + 40) + 96);
                if (v193 == 2)
                {
                  v194 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v193 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  v194 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                v195 = v194;
                if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                {
                  v196 = *(NSObject **)(v217 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v196;
                  __int16 v239 = 2112;
                  *(void *)v240 = v192;
                  _os_log_impl(&dword_19B3C7000, v195, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
                }
              }
              uint64_t v2 = v173;
              unint64_t v4 = v206;
              id v7 = v199;
              goto LABEL_251;
            }
            uint64_t v2 = v173;
            uint64_t v120 = v217;
            if (!v181)
            {
              uint64_t v182 = *(void *)(*(void *)(v217 + 40) + 96);
              if (v182 == 2)
              {
                v183 = __CPLAppLibraryOSLogDomain();
              }
              else
              {
                if (v182 == 1) {
                  __CPLSyndicationOSLogDomain();
                }
                else {
                v183 = __CPLSystemLibraryOSLogDomain();
                }
              }
              v186 = v183;
              if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
              {
                v187 = [v200 uuid];
                v188 = [v125 path];
                *(_DWORD *)buf = 138543618;
                v238 = v187;
                __int16 v239 = 2112;
                *(void *)v240 = v188;
                _os_log_impl(&dword_19B3C7000, v186, OS_LOG_TYPE_DEFAULT, "Successfully moved stale bundle scope download for asset %{public}@ to new path: '%@'", buf, 0x16u);
              }
              uint64_t v2 = v173;
            }

            v210 = v125;
            unint64_t v4 = v206;
            id v7 = v199;
            goto LABEL_224;
          }
          id v7 = v199;
        }
        uint64_t v120 = v217;
LABEL_224:
        v121 = v7;
        v122 = [v210 path];
        [v50 markAsLocallyAvailableWithFilePath:v122];

        if (*(unsigned char *)(v120 + 56))
        {
          v123 = [MEMORY[0x1E4F1C9C8] date];
          [v50 setCloudLastOnDemandDownloadDate:v123];

          uint64_t v124 = *(unsigned __int8 *)(v120 + 56);
        }
        else
        {
          uint64_t v124 = 0;
        }
        v125 = [*(id *)(v120 + 40) cacheDeleteSupport];
        [v125 markResourceAsPurgeable:v50 withUrgency:v124];
        id v7 = v121;
        goto LABEL_251;
      }
      v216 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v7 prefetchResources:1 inLibrary:*(void *)(v1 + 48)];
      if (!v216)
      {
        if (*MEMORY[0x1E4F59AC0])
        {

          goto LABEL_256;
        }
        uint64_t v26 = *(void *)(*(void *)(v1 + 40) + 96);
        if (v26 == 2)
        {
          __int16 v27 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v26 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          __int16 v27 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v31 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v119 = *(void *)(v1 + 32);
          *(_DWORD *)buf = 138412546;
          v238 = v7;
          __int16 v239 = 2112;
          *(void *)v240 = v119;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "can't find the master with identifier %@ for resource %@", buf, 0x16u);
        }
        v216 = 0;
        goto LABEL_254;
      }
      v197 = v2;
      v198 = v7;
      v205 = v4;
      if (v218 == 10)
      {
        id v231 = 0;
        id v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v231];
        id v16 = v231;
        if (v15)
        {
          id v17 = [v216 mediaMetadata];
          [v17 setValue:v15 forKey:@"data"];
        }
        else
        {
          if (*MEMORY[0x1E4F59AC0])
          {
            id v15 = 0;
LABEL_270:
            char v201 = 0;
LABEL_271:

            int v213 = 0;
LABEL_272:
            long long v222 = 0u;
            long long v223 = 0u;
            long long v220 = 0u;
            long long v221 = 0u;
            v133 = [v216 assets];
            uint64_t v134 = [v133 countByEnumeratingWithState:&v220 objects:v236 count:16];
            if (!v134)
            {
LABEL_346:

              if ((v201 & 1) == 0 && v218 != 10 && v218 != 5)
              {
                uint64_t v2 = v197;
                id v7 = v198;
                unint64_t v4 = v205;
                CFDataRef v8 = 0;
                goto LABEL_255;
              }
              id v219 = 0;
              unint64_t v4 = v205;
              char v164 = [v205 removeItemAtURL:v3 error:&v219];
              int v31 = v219;
              uint64_t v2 = v197;
              id v7 = v198;
              CFDataRef v8 = 0;
              if ((v164 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
              {
                uint64_t v165 = *(void *)(*(void *)(v1 + 40) + 96);
                if (v165 == 2)
                {
                  v166 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v165 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  v166 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                v167 = v166;
                if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
                {
                  v168 = *(NSObject **)(v1 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v168;
                  __int16 v239 = 2112;
                  *(void *)v240 = v31;
                  _os_log_impl(&dword_19B3C7000, v167, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
                }
              }
LABEL_254:

LABEL_255:
LABEL_256:

LABEL_257:
              goto LABEL_258;
            }
            uint64_t v135 = v134;
            uint64_t v136 = *(void *)v221;
            v137 = (unsigned char *)MEMORY[0x1E4F59AC0];
LABEL_274:
            uint64_t v138 = 0;
            while (1)
            {
              if (*(void *)v221 != v136) {
                objc_enumerationMutation(v133);
              }
              v139 = *(NSObject **)(*((void *)&v220 + 1) + 8 * v138);
              if (!v139) {
                goto LABEL_344;
              }
              if (!*v137)
              {
                uint64_t v140 = *(void *)(*(void *)(v1 + 40) + 96);
                if (v140 == 2)
                {
                  v141 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v140 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  v141 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                v142 = v141;
                if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
                {
                  v143 = [v139 uuid];
                  *(_DWORD *)buf = 138412546;
                  v238 = v143;
                  __int16 v239 = 2112;
                  *(void *)v240 = v216;
                  _os_log_impl(&dword_19B3C7000, v142, OS_LOG_TYPE_DEBUG, "Asset %@ mapped to master %@ during duplicate copy", buf, 0x16u);

                  uint64_t v1 = v217;
                }
              }
              v144 = [v139 assetResourceForCPLType:v218];
              if (v144) {
                break;
              }
              uint64_t v147 = [*(id *)(v1 + 40) _placeHolderKindFromCPLResourceType:v218];
              int v148 = [v139 cloudPlaceholderKind];
              if (v148) {
                BOOL v149 = v148 < (int)v147;
              }
              else {
                BOOL v149 = 0;
              }
              if (v149)
              {
                if (!*v137)
                {
                  uint64_t v150 = *(void *)(*(void *)(v1 + 40) + 96);
                  if (v150 == 2)
                  {
                    v151 = __CPLAppLibraryOSLogDomain();
                  }
                  else
                  {
                    if (v150 == 1) {
                      __CPLSyndicationOSLogDomain();
                    }
                    else {
                    v151 = __CPLSystemLibraryOSLogDomain();
                    }
                  }
                  v155 = v151;
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v238) = v147;
                    _os_log_impl(&dword_19B3C7000, v155, OS_LOG_TYPE_DEBUG, "Setting cloud placeholder kind to %d during duplicate copy", buf, 8u);
                  }

                  int v3 = v210;
                }
                [v139 setCloudPlaceholderKind:v147];
              }
              unsigned int v156 = (v147 != 5) & ~[v139 hasMasterThumb];
              if ((v213 | v156) == 1)
              {
                if (!*v137)
                {
                  uint64_t v157 = *(void *)(*(void *)(v217 + 40) + 96);
                  if (v157 == 2)
                  {
                    v158 = __CPLAppLibraryOSLogDomain();
                  }
                  else
                  {
                    if (v157 == 1) {
                      __CPLSyndicationOSLogDomain();
                    }
                    else {
                    v158 = __CPLSystemLibraryOSLogDomain();
                    }
                  }
                  v159 = v158;
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    v238 = v139;
                    __int16 v239 = 1024;
                    *(_DWORD *)v240 = v156;
                    *(_WORD *)&v240[4] = 1024;
                    *(_DWORD *)&v240[6] = v213;
                    _os_log_impl(&dword_19B3C7000, v159, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset %@ during duplicate copy (missingThumbnail %d, isThumbnail %d)", buf, 0x18u);
                  }
                }
                [*(id *)(v217 + 40) _updateAsset:v139 withImageFileURL:v3];
              }
              if (v218 == 1)
              {
                uint64_t v1 = v217;
                if (!*v137)
                {
                  uint64_t v160 = *(void *)(*(void *)(v217 + 40) + 96);
                  if (v160 == 2)
                  {
                    v161 = __CPLAppLibraryOSLogDomain();
                  }
                  else
                  {
                    if (v160 == 1) {
                      __CPLSyndicationOSLogDomain();
                    }
                    else {
                    v161 = __CPLSystemLibraryOSLogDomain();
                    }
                  }
                  v162 = v161;
                  if (os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                  {
                    v163 = [v139 uuid];
                    *(_DWORD *)buf = 138412290;
                    v238 = v163;
                    _os_log_impl(&dword_19B3C7000, v162, OS_LOG_TYPE_DEBUG, "Persisting metadata for %@ during duplicate copy", buf, 0xCu);

                    uint64_t v1 = v217;
                  }
                }
                [v139 persistMetadataToFilesystem];
                goto LABEL_343;
              }
              uint64_t v1 = v217;
              if (v218 != 2) {
                goto LABEL_309;
              }
              [*(id *)(v217 + 40) _updateThumbnailDataForAsset:v139 withImageFileURL:v3];
LABEL_343:

LABEL_344:
              if (v135 == ++v138)
              {
                uint64_t v135 = [v133 countByEnumeratingWithState:&v220 objects:v236 count:16];
                if (!v135) {
                  goto LABEL_346;
                }
                goto LABEL_274;
              }
            }
            if (!*v137)
            {
              uint64_t v145 = *(void *)(*(void *)(v1 + 40) + 96);
              if (v145 == 2)
              {
                v146 = __CPLAppLibraryOSLogDomain();
              }
              else
              {
                if (v145 == 1) {
                  __CPLSyndicationOSLogDomain();
                }
                else {
                v146 = __CPLSystemLibraryOSLogDomain();
                }
              }
              v152 = v146;
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                v153 = [v139 uuid];
                uint64_t v154 = *(void *)(v217 + 32);
                *(_DWORD *)buf = 138412546;
                v238 = v153;
                __int16 v239 = 2112;
                *(void *)v240 = v154;
                _os_log_impl(&dword_19B3C7000, v152, OS_LOG_TYPE_DEFAULT, "Skipping update duplicate asset %@ with master resource %@", buf, 0x16u);

                uint64_t v1 = v217;
              }
            }
LABEL_309:
            if (v218 == 10) {
              +[PLManagedAsset processMediaMetadataForAsset:v139 withCloudMaster:v216];
            }
            goto LABEL_343;
          }
          uint64_t v117 = *(void *)(*(void *)(v1 + 40) + 96);
          if (v117 == 2)
          {
            v118 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v117 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            v118 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v17 = v118;
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v238 = v3;
            __int16 v239 = 2112;
            *(void *)v240 = v16;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to read metadata file at url: %@, error: %@", buf, 0x16u);
          }
        }

        goto LABEL_270;
      }
      if (v218 == 5)
      {
        char v201 = 0;
        int v213 = 1;
        goto LABEL_272;
      }
      v60 = [*(id *)(v1 + 40) pathManager];
      int v208 = [v60 isUBF];

      objc_msgSend(v216, "rm_cloudResourcesForResourceType:", v218);
      long long v227 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v212 = [v15 countByEnumeratingWithState:&v227 objects:v246 count:16];
      if (!v212)
      {
        char v201 = 0;
        goto LABEL_229;
      }
      char v201 = 0;
      uint64_t v211 = *(void *)v228;
      uint64_t v203 = *MEMORY[0x1E4F28358];
      uint64_t v204 = *MEMORY[0x1E4F28370];
      id v207 = v15;
LABEL_109:
      uint64_t v61 = 0;
      while (1)
      {
        if (*(void *)v228 != v211) {
          objc_enumerationMutation(v15);
        }
        v62 = *(NSObject **)(*((void *)&v227 + 1) + 8 * v61);
        v63 = [v3 path];
        v215 = [v62 cplFileURL];
        uint64_t v64 = [v215 path];
        v65 = (void *)v64;
        if (v63)
        {
          if (v64) {
            break;
          }
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v71 = *(void *)(*(void *)(v1 + 40) + 96);
          if (v71 == 2)
          {
            v72 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v71 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            v72 = __CPLSystemLibraryOSLogDomain();
            }
          }
          v73 = v72;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v74 = *(NSObject **)(v1 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v74;
            __int16 v239 = 2112;
            *(void *)v240 = v62;
            _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_ERROR, "Missing file path, downloaded resource %@ local resource %@", buf, 0x16u);
          }
          goto LABEL_208;
        }
LABEL_209:

        if (v212 == ++v61)
        {
          uint64_t v212 = [v15 countByEnumeratingWithState:&v227 objects:v246 count:16];
          if (!v212)
          {
LABEL_229:
            id v16 = v15;
            goto LABEL_271;
          }
          goto LABEL_109;
        }
      }
      if (_os_feature_enabled_impl())
      {
        v66 = [v62 asset];
        v67 = [*(id *)(v1 + 48) pathManager];
        BOOL v68 = +[PLLockedResourceTransferRecovery isStaleResourceURL:v3 asset:v66 resource:v62 pathManager:v67];

        if (v68)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v69 = *(void *)(*(void *)(v1 + 40) + 96);
            if (v69 == 2)
            {
              v70 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v69 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              v70 = __CPLSystemLibraryOSLogDomain();
              }
            }
            v75 = v70;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v76 = [0 uuid];
              *(_DWORD *)buf = 138543618;
              v238 = v76;
              __int16 v239 = 2112;
              *(void *)v240 = v63;
              _os_log_impl(&dword_19B3C7000, v75, OS_LOG_TYPE_DEFAULT, "Detected master resource download for asset %{public}@ to stale bundle scope location: '%@'", buf, 0x16u);
            }
          }
          char v201 = 1;
        }
      }
      v214 = v63;
      if (v208)
      {
        v77 = objc_msgSend(v216, "originalFilenameForResourceType:filePath:", -[NSObject cplType](v62, "cplType"), v65);
        v78 = [v62 uniformTypeIdentifier];
        v79 = [v78 identifier];

        id v80 = objc_alloc(MEMORY[0x1E4F8B978]);
        v81 = [v62 asset];
        v82 = [v81 uuid];
        uint64_t v83 = [0 bundleScope];
        uint64_t v84 = [v62 resourceType];
        uint64_t v85 = [v62 recipeID];
        uint64_t v86 = v84;
        v63 = v214;
        v87 = (PLValidatedExternalResource *)[v80 initWithAssetUuid:v82 bundleScope:v83 uti:v79 resourceVersion:0 resourceType:v86 recipeID:v85 originalFilename:v77];

        if ([v214 isEqualToString:v65])
        {
          uint64_t v1 = v217;
          v88 = [*(id *)(v217 + 40) pathManager];
          [v88 setExtendedAttributesWithIdentifier:v87 andURL:v215];

          v63 = v214;
          int v3 = v210;
          unint64_t v4 = v205;
LABEL_202:

          if ([v4 fileExistsAtPath:v65])
          {
            [v62 markAsLocallyAvailableWithFilePath:v65];
            id v15 = v207;
            if (*(unsigned char *)(v1 + 56))
            {
              v115 = [MEMORY[0x1E4F1C9C8] date];
              [v62 setCloudLastOnDemandDownloadDate:v115];

              v63 = v214;
              uint64_t v116 = *(unsigned __int8 *)(v1 + 56);
            }
            else
            {
              uint64_t v116 = 0;
            }
            v73 = [*(id *)(v1 + 40) cacheDeleteSupport];
            [v73 markResourceAsPurgeable:v62 withUrgency:v116];
LABEL_208:

            goto LABEL_209;
          }
          id v15 = v207;
          goto LABEL_209;
        }
        v90 = 0;
        int v3 = v210;
        unint64_t v4 = v205;
        uint64_t v1 = v217;
        goto LABEL_147;
      }
      v89 = v62;
      if ([v89 resourceType] == 4
        && ![v89 version])
      {
        char v110 = [v89 recipeID];

        if ((v110 & 1) == 0)
        {
          v90 = objc_alloc_init(PLValidatedExternalResource);
          [(PLValidatedExternalResource *)v90 setResourceType:4];
          [(PLValidatedExternalResource *)v90 setFileURL:v215];
          goto LABEL_143;
        }
      }
      else
      {
      }
      v90 = 0;
LABEL_143:
      if ([v63 isEqualToString:v65])
      {
        [(PLValidatedExternalResource *)v90 persistResourceTypeToFileURL];
        v87 = v90;
        goto LABEL_202;
      }
      v87 = 0;
LABEL_147:
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v91 = *(void *)(*(void *)(v1 + 40) + 96);
        if (v91 == 2)
        {
          v92 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v91 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          v92 = __CPLSystemLibraryOSLogDomain();
          }
        }
        v93 = v92;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v238 = v63;
          __int16 v239 = 2112;
          *(void *)v240 = v65;
          _os_log_impl(&dword_19B3C7000, v93, OS_LOG_TYPE_DEBUG, "Resource is downloaded to %@ during duplicate copy, copying to %@", buf, 0x16u);
        }
      }
      uint64_t v244 = v204;
      uint64_t v245 = v203;
      uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v245 forKeys:&v244 count:1];
      v95 = v63;
      v96 = (void *)v94;
      id v226 = 0;
      char v97 = [v4 setAttributes:v94 ofItemAtPath:v95 error:&v226];
      id v209 = v226;

      if ((v97 & 1) == 0)
      {
        v98 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v238 = v214;
          __int16 v239 = 2112;
          *(void *)v240 = v209;
          _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\" during duplicate copy: %@", buf, 0x16u);
        }
      }
      if ([v4 fileExistsAtPath:v65])
      {
        v63 = v214;
        if (*MEMORY[0x1E4F59AC0])
        {
LABEL_201:

          goto LABEL_202;
        }
        uint64_t v99 = *(void *)(*(void *)(v1 + 40) + 96);
        if (v99 == 2)
        {
          v100 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v99 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          v100 = __CPLSystemLibraryOSLogDomain();
          }
        }
        v103 = v100;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E4F59940], "descriptionForResourceType:", objc_msgSend(*(id *)(v1 + 32), "resourceType"));
          v113 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v238 = v113;
          __int16 v239 = 2112;
          *(void *)v240 = v65;
          *(_WORD *)&v240[8] = 2112;
          v241 = v62;
          _os_log_impl(&dword_19B3C7000, v103, OS_LOG_TYPE_DEBUG, "File exist at path %@ during duplicate copy on master for type %@, will not overwrite, localResource: %@", buf, 0x20u);

          v63 = v214;
        }
LABEL_200:

        goto LABEL_201;
      }
      uint64_t v101 = [v65 stringByDeletingLastPathComponent];
      id v225 = 0;
      v202 = v101;
      char v102 = objc_msgSend(v4, "createDirectoryIfNeededAtPath:error:");
      v103 = v225;
      if (v102)
      {
        id v224 = 0;
        char v104 = [v4 copyItemAtPath:v214 toPath:v65 error:&v224];
        v105 = v224;
        if (v104)
        {
          if (v208)
          {
            v106 = [*(id *)(v1 + 40) pathManager];
            [v106 setExtendedAttributesWithIdentifier:v87 andURL:v215];
          }
          else
          {
            [(PLValidatedExternalResource *)v90 persistResourceTypeToFileURL];
          }
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v111 = *(void *)(*(void *)(v1 + 40) + 96);
          if (v111 == 2)
          {
            v114 = __CPLAppLibraryOSLogDomain();
            v112 = v214;
          }
          else
          {
            v112 = v214;
            if (v111 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            v114 = __CPLSystemLibraryOSLogDomain();
            }
          }
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v238 = v112;
            __int16 v239 = 2112;
            *(void *)v240 = v65;
            *(_WORD *)&v240[8] = 2112;
            v241 = v105;
            __int16 v242 = 2112;
            v243 = v62;
            _os_log_impl(&dword_19B3C7000, v114, OS_LOG_TYPE_ERROR, "Failed to copy from %@ to %@ during duplicate copy on master. Error: %@, localResource: %@", buf, 0x2Au);
          }
        }
        v107 = v202;
      }
      else
      {
        v107 = v202;
        if (*MEMORY[0x1E4F59AC0])
        {
LABEL_199:

          v63 = v214;
          unint64_t v4 = v205;
          goto LABEL_200;
        }
        uint64_t v108 = *(void *)(*(void *)(v1 + 40) + 96);
        if (v108 == 2)
        {
          v109 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v108 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          v109 = __CPLSystemLibraryOSLogDomain();
          }
        }
        v105 = v109;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v238 = v202;
          __int16 v239 = 2112;
          *(void *)v240 = v103;
          *(_WORD *)&v240[8] = 2112;
          v241 = v62;
          _os_log_impl(&dword_19B3C7000, v105, OS_LOG_TYPE_ERROR, "Failed to create directory %@ during duplicate copy on master. Error: %@, localResource: %@", buf, 0x20u);
        }
      }

      int v3 = v210;
      goto LABEL_199;
    }
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v12 = *(void *)(*(void *)(v1 + 40) + 96);
    if (v12 == 2)
    {
      id v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v12 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CGImageSourceRef v14 = *(NSObject **)(v1 + 32);
      *(_DWORD *)buf = 138412546;
      v238 = v14;
      __int16 v239 = 2112;
      *(void *)v240 = v3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "downloaded resource file not found for resource %@ at %@", buf, 0x16u);
    }
    goto LABEL_257;
  }
LABEL_258:
}

- (void)_updateLocalStaleResourceWithCPLResource:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke;
  v10[3] = &unk_1E5873A50;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [v8 performBlock:v10];
}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = *((void *)a1[4] + 12);
    if (v3 == 2)
    {
      unint64_t v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      unint64_t v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[5];
      *(_DWORD *)buf = 138412290;
      long long v36 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Updating local stale resource for %@", buf, 0xCu);
    }
  }
  id v7 = [a1[5] itemScopedIdentifier];
  uint64_t v8 = [a1[5] resourceType];
  id v9 = +[PLManagedAsset assetWithScopedIdentifier:v7 inLibrary:a1[6] prefetchResources:1];
  if (v9)
  {
    uint64_t v10 = [a1[4] cplLibrary];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_506;
    v28[3] = &unk_1E5864E68;
    id v11 = a1[6];
    id v12 = a1[4];
    id v29 = v11;
    id v30 = v12;
    id v31 = v7;
    id v32 = a1[5];
    id v33 = v9;
    uint64_t v34 = v8;
    [v10 getCloudCacheForRecordWithScopedIdentifier:v31 completionHandler:v28];

    id v13 = v29;
  }
  else
  {
    id v13 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v7 prefetchResources:1 inLibrary:a1[6]];
    if (v13)
    {
      CGImageSourceRef v14 = [a1[4] cplLibrary];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_507;
      v20[3] = &unk_1E5864E90;
      id v15 = a1[6];
      id v16 = a1[4];
      int v21 = v15;
      id v22 = v16;
      id v23 = v7;
      id v24 = a1[5];
      id v26 = 0;
      uint64_t v27 = v8;
      id v25 = v13;
      [v14 getCloudCacheForRecordWithScopedIdentifier:v23 completionHandler:v20];

      id v17 = v21;
    }
    else
    {
      if (*v2)
      {
        id v13 = 0;
        goto LABEL_25;
      }
      uint64_t v18 = *((void *)a1[4] + 12);
      if (v18 == 2)
      {
        uint64_t v19 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v18 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v19 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v17 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v36 = v7;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to find local asset/master with itemScopedIdentifier %@", buf, 0xCu);
      }
    }
  }
LABEL_25:
}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_506(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2;
  v14[3] = &unk_1E5866440;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v15 = v6;
  uint64_t v16 = v7;
  id v17 = v9;
  id v18 = v5;
  id v19 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v20 = v10;
  uint64_t v21 = v11;
  id v12 = v5;
  id v13 = v6;
  [v8 performTransaction:v14];
}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_507(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2_508;
  v15[3] = &unk_1E5864CC0;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v16 = v6;
  uint64_t v17 = v7;
  id v18 = v9;
  id v19 = v5;
  id v20 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v12 = *(void **)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  id v21 = v10;
  uint64_t v23 = v11;
  id v22 = v12;
  id v13 = v5;
  id v14 = v6;
  [v8 performTransaction:v15];
}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2_508(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (*MEMORY[0x1E4F59AC0]) {
      return;
    }
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    unint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(void **)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v41 = v16;
      __int16 v42 = 2112;
      uint64_t v43 = v17;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to get cloud cache for master record %@: %@", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v4 = *(id *)(a1 + 56);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = [v4 resources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
LABEL_9:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        uint64_t v11 = [0 resourceType];
        if (v11 == [*(id *)(a1 + 64) resourceType]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v7) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
      id v12 = v10;

      if (!v12) {
        goto LABEL_53;
      }
      id v13 = (unsigned char *)MEMORY[0x1E4F59AC0];
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v14 == 2)
        {
          id v15 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v14 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v15 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v18 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v12;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Updating local stale master resource with %@", buf, 0xCu);
        }
      }
      id v29 = v4;
      id v19 = objc_msgSend(*(id *)(a1 + 72), "rm_cloudResourcesForResourceType:", *(void *)(a1 + 88));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (v24 && ([v24 isLocallyAvailable] & 1) == 0)
            {
              id v25 = [*(id *)(a1 + 80) storedResourceForCPLResource:v12 asset:*(void *)(a1 + 80) adjusted:0];
              if (!*v13)
              {
                uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 96);
                if (v26 == 2)
                {
                  uint64_t v27 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v26 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  uint64_t v27 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                id v28 = v27;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v41 = v25;
                  _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Updated local stale master resource to %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }

      unint64_t v4 = v29;
    }
    else
    {
LABEL_15:
      id v12 = v5;
    }
  }
LABEL_53:
}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (*MEMORY[0x1E4F59AC0]) {
      return;
    }
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    unint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      long long v30 = v15;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to get cloud cache for asset record %@: %@", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v4 = *(id *)(a1 + 56);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = [v4 resources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v11 = [v10 resourceType];
          if (v11 == [*(id *)(a1 + 64) resourceType])
          {
            id v12 = (unsigned char *)MEMORY[0x1E4F59AC0];
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 96);
              if (v13 == 2)
              {
                uint64_t v14 = __CPLAppLibraryOSLogDomain();
              }
              else
              {
                if (v13 == 1) {
                  __CPLSyndicationOSLogDomain();
                }
                else {
                uint64_t v14 = __CPLSystemLibraryOSLogDomain();
                }
              }
              uint64_t v17 = v14;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v30 = v10;
                _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Updating local stale asset resource with %@", buf, 0xCu);
              }
            }
            id v18 = [*(id *)(a1 + 72) assetResourceForCPLType:*(void *)(a1 + 80)];
            id v19 = v18;
            if (v18 && ([v18 isLocallyAvailable] & 1) == 0)
            {
              uint64_t v20 = [*(id *)(a1 + 72) storedResourceForCPLResource:v10 asset:*(void *)(a1 + 72) adjusted:1];
              if (!*v12)
              {
                uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 96);
                if (v21 == 2)
                {
                  uint64_t v22 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v21 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  uint64_t v22 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                uint64_t v23 = v22;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v30 = v20;
                  _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Updated local stale asset resource to %@", buf, 0xCu);
                }
              }
            }

            goto LABEL_44;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_44:
  }
}

- (CGSize)_targetSizeForInputSize:(CGSize)a3 maxPixelSize:(unint64_t)a4
{
  double v4 = 1.0;
  if (a3.height * a3.width > (double)a4) {
    double v4 = sqrt((double)a4 / (a3.height * a3.width));
  }
  float v5 = a3.width * v4;
  double v6 = roundf(v5);
  float v7 = a3.height * v4;
  double v8 = roundf(v7);
  result.height = v8;
  result.width = v6;
  return result;
}

- (void)_linkFileFrom:(id)a3 to:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [v7 stringByDeletingLastPathComponent];
  char v10 = [v8 fileExistsAtPath:v9];
  uint64_t v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v10)
  {
    id v12 = 0;
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v9;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Creating destination path = %@", buf, 0xCu);
      }
    }
    id v24 = 0;
    [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v12 = v24;
  }
  if (!*v11)
  {
    int64_t v16 = self->_libraryMode;
    if (v16 == 2)
    {
      uint64_t v17 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v16 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v17 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v18 = v17;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Linking old thumb in %@ to new location in %@", buf, 0x16u);
    }
  }
  id v23 = v12;
  [v8 linkItemAtPath:v6 toPath:v7 error:&v23];
  id v19 = v23;

  if (v19 && !*v11)
  {
    int64_t v20 = self->_libraryMode;
    if (v20 == 2)
    {
      uint64_t v21 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v20 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v21 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v22 = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unable to link file from '%@' to '%@'", buf, 0x16u);
    }
  }
}

- (BOOL)_isAssetsdNotReadyToAnswer
{
  return (self->_state < 8) & (0x83u >> self->_state);
}

- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:providePayloadForComputeStates:inFolderWithURL:completionHandler:]"];
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v9, "count"));
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  int64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v24[3] = &unk_1E586C8F0;
  void v24[4] = self;
  id v25 = v9;
  id v26 = v14;
  id v27 = v16;
  id v28 = v10;
  id v29 = v13;
  id v30 = v15;
  id v31 = v11;
  id v17 = v11;
  id v18 = v15;
  id v19 = v13;
  id v20 = v10;
  id v21 = v16;
  id v22 = v14;
  id v23 = v9;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v12 block:v24];
}

void __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] libraryServicesManager];
  uint64_t v3 = [v2 databaseContext];
  double v4 = (void *)[v3 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManager:providePayloadForComputeStates:inFolderWithURL:completionHandler:]_block_invoke"];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5875880;
  id v15 = a1[5];
  id v16 = a1[6];
  id v5 = a1[7];
  id v6 = a1[4];
  id v17 = v5;
  id v18 = v6;
  id v19 = a1[8];
  id v20 = v4;
  id v21 = a1[9];
  id v22 = a1[10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_505;
  v8[3] = &unk_1E58751C0;
  v8[4] = a1[4];
  id v9 = a1[9];
  id v10 = a1[5];
  id v11 = a1[10];
  id v12 = a1[7];
  id v13 = a1[11];
  id v7 = v4;
  [v7 performTransaction:v14 completionHandler:v8];
}

void __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([*(id *)(a1 + 40) isCancelled])
        {
          id v13 = *(void **)(a1 + 48);
          uint64_t v14 = [v8 itemScopedIdentifier];
          [v13 addObject:v14];

          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 96);
            if (v15 == 2)
            {
              id v16 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v15 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v16 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v17 = v16;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)id v18 = 0;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[CCSS] providePayloadForComputeStates: Cancelled!", v18, 2u);
            }
          }
          goto LABEL_23;
        }
        id v9 = +[PLManagedAsset generateFullComputeStateRecordForRecord:v8 payloadHelper:v2 destinationDirectoryURL:*(void *)(a1 + 64) inPhotoLibrary:*(void *)(a1 + 72)];
        if (v9)
        {
          [*(id *)(a1 + 80) addObject:v9];
          id v10 = *(void **)(a1 + 88);
          id v11 = v9;
        }
        else
        {
          id v10 = *(void **)(a1 + 48);
          id v11 = v8;
        }
        id v12 = [v11 itemScopedIdentifier];
        [v10 addObject:v12];

        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_23:
}

uint64_t __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_505(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v3 == 2)
    {
      uint64_t v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 40) count];
      uint64_t v7 = [*(id *)(a1 + 48) count];
      int v19 = 134218240;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[CCSS] providePayloadForComputeStates: Returning %tu generated compute states payloads for %tu received", (uint8_t *)&v19, 0x16u);
    }
  }
  if ([*(id *)(a1 + 56) count]) {
    BOOL v8 = *v2 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      id v10 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v9 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v10 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      int v19 = 138412290;
      uint64_t v20 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[CCSS] providePayloadForComputeStates: Payloads generated for: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if ([*(id *)(a1 + 64) count]) {
    BOOL v13 = *v2 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v14 == 2)
    {
      uint64_t v15 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v14 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v15 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v16 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 64);
      int v19 = 138412290;
      uint64_t v20 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "[CCSS] providePayloadForComputeStates: Payload generation skipped for: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [a4 resource];
  uint64_t v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:inMemoryDownloadDidFinishForResourceTransferTask:data:withError:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__PLCloudPhotoLibraryManager_libraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke;
  v16[3] = &unk_1E5875BF8;
  void v16[4] = self;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v12 block:v16];
}

uint64_t __109__PLCloudPhotoLibraryManager_libraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 248) reportCompletionForResource:a1[5] withData:a1[6] error:a1[7]];
}

- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  uint64_t v7 = objc_msgSend(a5, "resource", a3);
  BOOL v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:uploadDidProgress:forResourceTransferTask:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PLCloudPhotoLibraryManager_libraryManager_uploadDidProgress_forResourceTransferTask___block_invoke;
  v10[3] = &unk_1E5864E40;
  id v11 = v7;
  uint64_t v12 = self;
  float v13 = a4;
  id v9 = v7;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v8 block:v10];
}

void __87__PLCloudPhotoLibraryManager_libraryManager_uploadDidProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  if (objc_msgSend(MEMORY[0x1E4F59940], "resourceTypeTrackedForUpload:", objc_msgSend(*(id *)(a1 + 32), "resourceType")))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 256);
    uint64_t v3 = [*(id *)(a1 + 32) itemScopedIdentifier];
    int v4 = *(_DWORD *)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 32) identity];
    uint64_t v6 = [v5 fileSize];
    uint64_t v7 = [*(id *)(a1 + 32) resourceType];
    LODWORD(v8) = v4;
    [v2 updateForMasterResourceUploadWithScopedIdentifier:v3 progress:v6 fileSize:v7 type:v8];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
}

- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v7 = a5;
  double v8 = [a4 resource];
  id v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:uploadDidFinishForResourceTransferTask:withError:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke;
  v12[3] = &unk_1E5873A50;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v9 block:v12];
}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v3 = [v2 databaseContext];
  int v4 = (void *)[v3 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManager:uploadDidFinishForResourceTransferTask:withError:]_block_invoke"];

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 256);
    uint64_t v6 = [*(id *)(a1 + 48) itemScopedIdentifier];
    [v5 uploadFinishedForMasterResourceWithScopedIdentifier:v6 fileSize:0 type:0 withError:1];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_502;
    v14[3] = &unk_1E5875E18;
    id v15 = *(id *)(a1 + 48);
    id v16 = v4;
    [v16 performBlock:v14];

    id v7 = v15;
  }
  else
  {
    double v8 = [*(id *)(a1 + 48) itemScopedIdentifier];
    if (objc_msgSend(MEMORY[0x1E4F59940], "resourceTypeTrackedForUpload:", objc_msgSend(*(id *)(a1 + 48), "resourceType")))
    {
      id v9 = [*(id *)(a1 + 48) identity];
      uint64_t v10 = [v9 fileSize];

      id v11 = *(void **)(*(void *)(a1 + 32) + 256);
      uint64_t v12 = [*(id *)(a1 + 48) itemScopedIdentifier];
      objc_msgSend(v11, "uploadFinishedForMasterResourceWithScopedIdentifier:fileSize:type:withError:", v12, v10, objc_msgSend(*(id *)(a1 + 48), "resourceType"), 0);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_2;
    v17[3] = &unk_1E5875BF8;
    id v18 = *(id *)(a1 + 48);
    id v19 = v4;
    id v20 = v8;
    uint64_t v21 = *(void *)(a1 + 32);
    id v7 = v8;
    [v19 performTransactionAndWait:v17];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "resetIfNeededWithLibrary:isInitialUpload:", v4, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "initialUpload"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  +[PLManagedAsset rm_cplResourceWasUploaded:a1[4] photoLibrary:a1[5]];
  uint64_t v2 = +[PLCloudMaster cloudMasterWithScopedIdentifier:a1[6] prefetchResources:0 inLibrary:a1[5]];
  uint64_t v3 = v2;
  if (v2 && [v2 allOriginalsAreUploaded])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(a1[7] + 96);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v3 scopedIdentifier];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 1024;
        int v13 = [v3 cloudLocalState];
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "uploadDidFinishForResourceTransferTask: setting master %@ (%d) to uploaded", (uint8_t *)&v10, 0x12u);
      }
    }
    [v3 setCloudLocalState:3];
    double v8 = *(void **)(a1[7] + 256);
    id v9 = [v3 scopedIdentifier];
    [v8 uploadFinishedForMasterRecordWithScopedIdentifier:v9 didUpdateStatus:0];
  }
}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_502(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemScopedIdentifier];
  uint64_t v5 = +[PLManagedAsset assetWithScopedIdentifier:v2 inLibrary:*(void *)(a1 + 40) prefetchResources:0];

  uint64_t v3 = v5;
  if (v5)
  {
    int v4 = [v5 isPlaceholderAsset];
    uint64_t v3 = v5;
    if (v4)
    {
      [v5 setDestinationAssetCopyStateOnSourceAsset:0xFFFFFFFFLL];
      uint64_t v3 = v5;
    }
  }
}

- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "backgroundDownloadDidFailForResource: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F59778] code:26 userInfo:0];
  __int16 v12 = [(PLCloudPhotoLibraryManager *)self _identifierForResource:v7];
  [(PLCloudTaskManager *)self->_taskManager reportCompletionForResourceIdentifier:v12 highPriority:0 withError:v11];
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Finished low priority download for resource: %@", buf, 0xCu);
    }
  }
  id v11 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  __int16 v12 = [v11 databaseContext];
  int v13 = (void *)[v12 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManager:backgroundDownloadDidFinishForResource:]"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PLCloudPhotoLibraryManager_libraryManager_backgroundDownloadDidFinishForResource___block_invoke;
  v16[3] = &unk_1E5873A50;
  id v17 = v7;
  id v18 = v13;
  id v19 = self;
  id v14 = v13;
  id v15 = v7;
  [v14 performBlock:v16];
}

void __84__PLCloudPhotoLibraryManager_libraryManager_backgroundDownloadDidFinishForResource___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemScopedIdentifier];
  uint64_t v3 = +[PLManagedAsset assetWithScopedIdentifier:v2 inLibrary:*(void *)(a1 + 40) prefetchResources:1];
  if (v3)
  {
    int v4 = objc_msgSend(v3, "rm_cplResourceForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v2 prefetchResources:1 inLibrary:*(void *)(a1 + 40)];
    id v18 = v17;
    if (v17)
    {
      id v19 = [v17 assets];
      id v20 = [v19 anyObject];

      int v4 = objc_msgSend(v20, "rm_cplMasterResourceForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
    }
    else
    {
      int v4 = 0;
    }

    if (v4)
    {
LABEL_3:
      uint64_t v5 = [v4 identity];
      id v6 = [*(id *)(a1 + 32) identity];
      id v7 = [v5 fingerPrint];
      double v8 = [v6 fingerPrint];
      if ([v7 isEqualToString:v8])
      {
        [v5 fileUTI];
        id v9 = v30 = v2;
        [v6 fileUTI];
        int v10 = v4;
        id v11 = v3;
        int v13 = v12 = v6;
        int v14 = [v9 isEqualToString:v13];

        id v6 = v12;
        uint64_t v3 = v11;
        int v4 = v10;

        uint64_t v2 = v30;
        if (v14)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 96);
            if (v15 == 2)
            {
              id v16 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v15 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v16 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v28 = v16;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v29 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              uint64_t v32 = v29;
              _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "O-----> Rerequesting bg download for resource: %@", buf, 0xCu);
            }
          }
          id v25 = [*(id *)(a1 + 48) cplLibrary];
          [v25 beginDownloadForResource:v10 clientBundleID:@"com.apple.mobileslideshow" highPriority:0 completionHandler:&__block_literal_global_501];
          goto LABEL_39;
        }
      }
      else
      {
      }
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 96);
      if (v21 == 2)
      {
        uint64_t v22 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v21 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v22 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v25 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v26;
        __int16 v33 = 2112;
        long long v34 = v4;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Fingerprint of background download resource: %@ didn't match local resource: %@", buf, 0x16u);
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 96);
    if (v23 == 2)
    {
      uint64_t v24 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v23 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v24 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v27;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to find local resource for background downloaded resource %@", buf, 0xCu);
    }
    goto LABEL_41;
  }
LABEL_42:
}

- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v16 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v16 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v17 = v16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = v11;
      __int16 v70 = 2112;
      id v71 = v13;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "downloadDidFinishForResourceTransferTask: %@, with error: %@", buf, 0x16u);
    }
  }
  if (![v13 isCPLError] || objc_msgSend(v13, "code") != 10)
  {
    id v20 = [v11 taskIdentifier];
    uint64_t v21 = [v20 hash];

    kdebug_trace();
    id v59 = v10;
    if (v12)
    {
      id v22 = v12;
      id v23 = v12;
    }
    else
    {
      id v22 = 0;
      id v23 = [v11 resource];
    }
    uint64_t v24 = v23;
    id v25 = [v11 options];
    char v26 = [v25 isForeground];

    uint64_t v27 = [v11 options];
    char v57 = [v27 hasValidTimeRange];

    id v28 = [(PLCloudPhotoLibraryManager *)self _identifierForResource:v24];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke;
    v62[3] = &unk_1E586FE60;
    uint64_t v66 = v21;
    v62[4] = self;
    id v58 = v28;
    id v63 = v58;
    char v67 = v26;
    id v29 = v13;
    id v30 = v13;
    id v64 = v30;
    id v31 = v24;
    v65 = v31;
    uint64_t v32 = (void (**)(void))MEMORY[0x19F38D650](v62);
    __int16 v33 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    long long v34 = [v33 databaseContext];
    uint64_t v35 = [v34 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManager:downloadDidFinishForResourceTransferTask:finalResource:withError:]"];

    if (v30)
    {
      id v12 = v22;
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t v36 = self->_libraryMode;
        if (v36 == 2)
        {
          long long v37 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v36 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v37 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v43 = v37;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = v31;
          __int16 v70 = 2112;
          id v71 = v30;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEFAULT, "Failed to download resource %@. Error: %@", buf, 0x16u);
        }
      }
      if ([v30 code] == 27) {
        char v44 = v57;
      }
      else {
        char v44 = 1;
      }
      id v40 = (void *)v35;
      if ((v44 & 1) == 0) {
        [(PLCloudPhotoLibraryManager *)self _updateLocalStaleResourceWithCPLResource:v31 inLibrary:v35];
      }
      v32[2](v32);
      id v13 = v29;
      goto LABEL_76;
    }
    long long v38 = [v11 options];
    unsigned int v39 = [v38 isHighPriority];

    if (v31)
    {
      unsigned int v56 = v39;
      id v12 = v22;
      id v40 = (void *)v35;
      if ((v57 & 1) == 0)
      {
        id v13 = v29;
        if (!*MEMORY[0x1E4F59AC0])
        {
          int64_t v47 = self->_libraryMode;
          if (v47 == 2)
          {
            __int16 v48 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v47 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            __int16 v48 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v55 = v48;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v69 = v31;
            __int16 v70 = 1024;
            LODWORD(v71) = v56;
            _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEBUG, "Update local state of resource %@, highPriority: %d", buf, 0x12u);
          }
        }
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_498;
        v60[3] = &unk_1E5875198;
        uint64_t v61 = v32;
        [(PLCloudPhotoLibraryManager *)self _updateWithCPLResource:v31 isHighPriority:v56 inLibrary:v40 completionHandler:v60];

        goto LABEL_76;
      }
      id v13 = v29;
      if (*MEMORY[0x1E4F59AC0]) {
        goto LABEL_69;
      }
      int64_t v41 = self->_libraryMode;
      if (v41 == 2)
      {
        __int16 v42 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v41 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        __int16 v42 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v50 = v42;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v69 = v31;
      __int16 v70 = 1024;
      LODWORD(v71) = v56;
      int v51 = "Skip updating local state of time ranged video resource %@, highPriority: %d";
      BOOL v52 = v50;
      os_log_type_t v53 = OS_LOG_TYPE_DEBUG;
      uint32_t v54 = 18;
    }
    else
    {
      id v12 = v22;
      id v40 = (void *)v35;
      id v13 = v29;
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_69:
        v32[2](v32);
LABEL_76:

        id v10 = v59;
LABEL_77:

        goto LABEL_78;
      }
      int64_t v45 = self->_libraryMode;
      if (v45 == 2)
      {
        id v46 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v45 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v46 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v50 = v46;
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_68:

        goto LABEL_69;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = v11;
      int v51 = "resource transfer task %@ finished for unknown asset";
      BOOL v52 = v50;
      os_log_type_t v53 = OS_LOG_TYPE_ERROR;
      uint32_t v54 = 12;
    }
    _os_log_impl(&dword_19B3C7000, v52, v53, v51, buf, v54);
    goto LABEL_68;
  }
  if (!*v14)
  {
    int64_t v18 = self->_libraryMode;
    if (v18 == 2)
    {
      id v19 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v18 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v19 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v31 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v49 = [v11 resource];
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = v49;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "resource %@ will be downloaded in background, skip reporting its completion", buf, 0xCu);
    }
    goto LABEL_77;
  }
LABEL_78:
}

void __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  [*(id *)(*(void *)(a1 + 32) + 136) reportCompletionForResourceIdentifier:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 72) withError:*(void *)(a1 + 48)];
  if (!*(void *)(a1 + 48) && [*(id *)(a1 + 56) resourceType] == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.originaldownloaded", 0, 0, 0);
  }
  if (*(unsigned char *)(a1 + 72))
  {
    os_signpost_id_t v3 = *(void *)(a1 + 64);
    int v4 = PLCPLSignpostsTelemetryGetLog();
    uint64_t v5 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      uint64_t v6 = [*(id *)(a1 + 56) resourceType];
      id v7 = [*(id *)(a1 + 56) identity];
      uint64_t v8 = [v7 fileSize];
      id v9 = [*(id *)(a1 + 56) itemScopedIdentifier];
      int v10 = 134349570;
      uint64_t v11 = v6;
      __int16 v12 = 2050;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v3, "OnDemandDownload", " enableTelemetry=YES type=%{signpost.telemetry:number1,public}lu size=%{signpost.telemetry:number2,public}lu identifier=%@", (uint8_t *)&v10, 0x20u);
    }
  }
}

uint64_t __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 resource];
  id v7 = [(PLCloudPhotoLibraryManager *)self _identifierForResource:v6];
  uint64_t v8 = [v5 options];
  uint64_t v9 = [v8 isForeground];

  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v11 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v11 = __CPLSystemLibraryOSLogDomain();
      }
    }
    __int16 v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "downloadDidStartForResourceTransferTask: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [(PLCloudTaskManager *)self->_taskManager reportProgress:v7 forResourceIdentifier:v9 highPriority:0.0];
}

- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [v7 resource];
  uint64_t v9 = [(PLCloudPhotoLibraryManager *)self _identifierForResource:v8];
  int v10 = [v7 options];
  uint64_t v11 = [v10 isForeground];

  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v14 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v14 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134218242;
      double v17 = a4;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "downloadDidProgress %f forResourceTransferTask: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  *(float *)&double v12 = a4;
  [(PLCloudTaskManager *)self->_taskManager reportProgress:v9 forResourceIdentifier:v11 highPriority:v12];
}

- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager sizeOfResourcesToUploadDidChangeForLibraryManager:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __80__PLCloudPhotoLibraryManager_sizeOfResourcesToUploadDidChangeForLibraryManager___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __80__PLCloudPhotoLibraryManager_sizeOfResourcesToUploadDidChangeForLibraryManager___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  os_signpost_id_t v3 = [v2 databaseContext];
  id v5 = (id)[v3 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager sizeOfResourcesToUploadDidChangeForLibraryManager:]_block_invoke"];

  if (![*(id *)(a1 + 40) sizeOfOriginalResourcesToUpload]
    && [*(id *)(*(void *)(a1 + 32) + 256) totalSizeOfUnpushedOriginals])
  {
    [*(id *)(*(void *)(a1 + 32) + 256) reset];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setupFromLibrary:isInitialUpload:", v5, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "initialUpload"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
  }
  [*(id *)(a1 + 32) _updateTransferCountsInLibrary:v5];
}

- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager workerCoordinatorDidFinishAllSubmittedJobsOnBundle:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __81__PLCloudPhotoLibraryManager_workerCoordinatorDidFinishAllSubmittedJobsOnBundle___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __81__PLCloudPhotoLibraryManager_workerCoordinatorDidFinishAllSubmittedJobsOnBundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  os_signpost_id_t v3 = [WeakRetained libraryBundle];

  if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
  {
    id v4 = [*(id *)(a1 + 40) pendingJobsForBundle:v3];
    id v5 = +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker];
    int v6 = [v4 containsObject:v5];

    id v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (v6)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v8 == 2)
        {
          uint64_t v9 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v8 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v9 = __CPLSystemLibraryOSLogDomain();
          }
        }
        double v12 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: jobs still pending, re-submitting bundle for processing...", buf, 2u);
        }
      }
      int v13 = *(void **)(*(void *)(a1 + 32) + 296);
      id v14 = +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker];
      [v13 submitBundleForProcessing:v3 withCriteria:v14];
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v10 == 2)
        {
          uint64_t v11 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v10 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v11 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v15 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: pushing all changes to CPL...", v22, 2u);
        }
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 304) = 1;
      int v16 = [*(id *)(a1 + 32) _canExternallyTransitionToNewLibraryStateIgnoringPause:1];
      uint64_t v17 = *(void *)(a1 + 32);
      if (v16)
      {
        if (*(void *)(v17 + 80) == 8)
        {
          *(_DWORD *)(v17 + 128) = 1;
          uint64_t v17 = *(void *)(a1 + 32);
        }
        if (!*v7)
        {
          uint64_t v18 = *(void *)(v17 + 96);
          if (v18 == 2)
          {
            id v19 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v18 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v19 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v20 = v19;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)uint64_t v21 = 0;
            _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from PUSHALLCHANGES", v21, 2u);
          }

          uint64_t v17 = *(void *)(a1 + 32);
        }
        [(id)v17 _transitionToState:3];
      }
      else
      {
        *(unsigned char *)(v17 + 90) = 1;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 304) = 1;
    [*(id *)(a1 + 32) _callPushAllChangesCompletionHandlersIfNecessary];
  }
}

- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:pushAllChangesWithCompletionHandler:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PLCloudPhotoLibraryManager_libraryManager_pushAllChangesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58742F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v6 block:v8];
}

void __81__PLCloudPhotoLibraryManager_libraryManager_pushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[37])
  {
    os_signpost_id_t v3 = [[PLBackgroundJobWorkerCoordinator alloc] initWithWorkerCoordinatorWorkerMode:1 statusCenter:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 296);
    *(void *)(v4 + 296) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 296), "setDelegate:");
    uint64_t v2 = *(void **)(a1 + 32);
  }
  int v6 = [v2 isCloudPhotoLibraryEnabled];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 288);
      id v9 = (void *)MEMORY[0x19F38D650]();
      [v8 addObject:v9];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 288) count] == 1)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v10 == 2)
        {
          uint64_t v11 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v10 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v11 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v13 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v19 = 0;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: submitting bundle for processing...", v19, 2u);
        }
      }
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(v14 + 296);
      id WeakRetained = objc_loadWeakRetained((id *)(v14 + 464));
      uint64_t v17 = [WeakRetained libraryBundle];
      uint64_t v18 = +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker];
      [v15 submitBundleForProcessing:v17 withCriteria:v18];
    }
  }
  else
  {
    double v12 = *(void (**)(void))(v7 + 16);
    v12();
  }
}

- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v14 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v14 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
      *(_DWORD *)buf = 138412546;
      id v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Requested to tentatively provide %@. assetsd state is currently in %@", buf, 0x16u);
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManager:provideLocalResource:recordClass:completionHandler:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke;
  v20[3] = &unk_1E5864DF8;
  void v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  Class v23 = a5;
  id v18 = v11;
  id v19 = v12;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v17 block:v20];
}

void __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isAssetsdNotReadyToAnswer])
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    os_signpost_id_t v3 = [*(id *)(a1 + 32) libraryServicesManager];
    uint64_t v4 = [v3 databaseContext];
    id v5 = (void *)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManager:provideLocalResource:recordClass:completionHandler:]_block_invoke"];

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    __int16 v26 = __Block_byref_object_copy__12675;
    uint64_t v27 = __Block_byref_object_dispose__12676;
    id v28 = 0;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke_2;
    id v18 = &unk_1E5864DD0;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 56);
    id v19 = v6;
    uint64_t v22 = v7;
    id v8 = v5;
    id v20 = v8;
    id v21 = &v23;
    [v8 performBlockAndWait:&v15];
    if (v24[5])
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "identity", v15, v16, v17, v18, v19);
      id v12 = [v11 fileURL];
      if (!v12
        || ([MEMORY[0x1E4F28CB8] defaultManager],
            int v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 copyItemAtURL:v24[5] toURL:v12 error:0],
            v13,
            (v14 & 1) == 0))
      {
        [v11 setFileURL:v24[5]];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, 1, v9, v10);
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) resourceType];
  os_signpost_id_t v3 = [*(id *)(a1 + 32) itemScopedIdentifier];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == objc_opt_class())
  {
    id v6 = +[PLManagedAsset assetWithScopedIdentifier:v3 inLibrary:*(void *)(a1 + 40) prefetchResources:1];
    id v7 = [v6 assetResourceForCPLType:v2];
    if ([v7 isLocallyAvailable])
    {
      uint64_t v13 = [v7 fileURL];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == objc_opt_class())
  {
    id v6 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v3 prefetchResources:1 inLibrary:*(void *)(a1 + 40)];
    objc_msgSend(v6, "rm_cloudResourcesForResourceType:", v2);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "isLocallyAvailable", (void)v19))
          {
            uint64_t v16 = [v12 fileURL];
            uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
            id v18 = *(void **)(v17 + 40);
            *(void *)(v17 + 40) = v16;

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
}

- (void)_getStatusChanges:(id)a3 transaction:(id)a4 notificationGeneration:(unint64_t)a5 inLibrary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke;
  v16[3] = &unk_1E5864DA8;
  void v16[4] = self;
  id v17 = v11;
  id v19 = v10;
  unint64_t v20 = a5;
  id v18 = v12;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  [v13 getChangedStatusesWithCompletionHandler:v16];
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2;
  v14[3] = &unk_1E5866440;
  id v15 = v5;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 64);
  id v18 = v11;
  id v19 = *(id *)(a1 + 40);
  id v20 = v6;
  id v12 = v6;
  id v13 = v5;
  [v7 _runAsyncOnIsolationQueueWithTransaction:v8 block:v14];
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3;
    v26[3] = &unk_1E5870CA8;
    uint64_t v2 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 48);
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 80);
    id v27 = v3;
    uint64_t v31 = v4;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    id v30 = *(id *)(a1 + 64);
    [v2 performTransactionAndWait:v26];
  }
  else
  {
    id v5 = (unsigned __int8 *)MEMORY[0x1E4F59AC0];
    int v6 = *MEMORY[0x1E4F59AC0];
    if (*(void *)(a1 + 72)) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 96);
      if (v8 == 2)
      {
        id v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 72);
        uint64_t v12 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138412546;
        __int16 v33 = v11;
        __int16 v34 = 2048;
        uint64_t v35 = v12;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Error getting statuses %@, notification generation (%lu)", buf, 0x16u);
      }

      int v6 = *v5;
    }
    uint64_t v13 = *(void *)(a1 + 80);
    id v14 = *(void **)(a1 + 48);
    uint64_t v15 = v14[42];
    if (v13 == v15)
    {
      if (!v6)
      {
        uint64_t v16 = v14[12];
        if (v16 == 2)
        {
          uint64_t v17 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v16 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v17 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v20 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [*(id *)(a1 + 48) _debugNameForState:*(void *)(*(void *)(a1 + 48) + 80)];
          uint64_t v22 = *(void *)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          __int16 v33 = v21;
          __int16 v34 = 2048;
          uint64_t v35 = v22;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Finished handling record status change notification, state is currently %@, notification generation (%lu)", buf, 0x16u);
        }
        id v14 = *(void **)(a1 + 48);
        uint64_t v13 = v14[42];
      }
      v14[42] = v13 + 1;
      *(unsigned char *)(*(void *)(a1 + 48) + 328) = 0;
    }
    else
    {
      if (!v6)
      {
        uint64_t v18 = v14[12];
        if (v18 == 2)
        {
          id v19 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v18 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v19 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v23 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [*(id *)(a1 + 48) _debugNameForState:*(void *)(*(void *)(a1 + 48) + 80)];
          uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 336);
          *(_DWORD *)buf = 138412546;
          __int16 v33 = v24;
          __int16 v34 = 2048;
          uint64_t v35 = v25;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Notified for record status changes (pending notifications), state is currently %@, notification generation (%lu)", buf, 0x16u);
        }
        id v14 = *(void **)(a1 + 48);
        uint64_t v15 = v14[42];
      }
      [v14 _getStatusChanges:*(void *)(a1 + 56) transaction:*(void *)(a1 + 64) notificationGeneration:v15 inLibrary:*(void *)(a1 + 40)];
    }
  }
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      id v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 40) count];
      int v6 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      uint64_t v105 = v5;
      __int16 v106 = 2048;
      v107 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Handling %lu record status changes, notification generation (%lu)", buf, 0x16u);
    }
  }
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v7 = (void *)MEMORY[0x1E4F8B8D8];
  uint64_t v8 = [*(id *)(a1 + 32) pathManager];
  id v9 = [v8 libraryURL];
  uint64_t v10 = [v9 path];
  unsigned int v73 = [v7 freeSpaceBelowDesiredSpaceThresholdForPath:v10];

  char v99 = 0;
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v96 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        uint64_t v17 = [v16 record];
        if ([v16 isQuarantined])
        {
          [*(id *)(*(void *)(a1 + 32) + 8) quarantineRecord:v17 uploadTracker:*(void *)(*(void *)(a1 + 32) + 256) inLibrary:*(void *)(a1 + 48)];
        }
        else if (([v16 isUploaded] & v73 & 1) != 0 {
               || [v16 isConfirmed])
        }
        {
          uint64_t v18 = [v17 scopedIdentifier];
          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v71 addObject:v18];
              [*(id *)(*(void *)(a1 + 32) + 256) uploadFinishedForMasterRecordWithScopedIdentifier:v18 didUpdateStatus:&v99];
              if (!*MEMORY[0x1E4F59AC0])
              {
                uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
                if (v19 == 2)
                {
                  id v20 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v19 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  id v20 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                uint64_t v23 = v20;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v105 = (uint64_t)v18;
                  uint64_t v24 = v23;
                  os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
                  __int16 v26 = "Marking master record as uploaded in tracker: %@";
LABEL_42:
                  _os_log_impl(&dword_19B3C7000, v24, v25, v26, buf, 0xCu);
                }
                goto LABEL_43;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v70 addObject:v18];
              }
            }
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 96);
            if (v21 == 2)
            {
              uint64_t v22 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v21 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v22 = __CPLSystemLibraryOSLogDomain();
              }
            }
            uint64_t v23 = v22;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v105 = (uint64_t)v17;
              uint64_t v24 = v23;
              os_log_type_t v25 = OS_LOG_TYPE_ERROR;
              __int16 v26 = "Missing scopedIdentifier for %@";
              goto LABEL_42;
            }
LABEL_43:
          }
        }
        if ([v16 isUploaded])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = [v17 scopedIdentifier];
            if ([v27 isInAMomentShare])
            {
              id v28 = +[PLManagedAsset assetWithScopedIdentifier:v27 inLibrary:*(void *)(a1 + 48) prefetchResources:0];
              id v29 = [v28 momentShare];
              int v30 = [v29 status];
              if (v28
                && v29
                && v30 == 1
                && (([v28 isPlaceholderAsset] & 1) != 0
                 || [v28 isMomentSharedAsset]))
              {
                if ([v28 isPlaceholderAsset]) {
                  objc_msgSend(v28, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForMomentSharedAsset"));
                }
                [v72 addObject:v29];
              }
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v95 objects:v103 count:16];
    }
    while (v13);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v72;
  uint64_t v31 = [obj countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v92 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        [v35 computeUploadedAssetCountsUsingAssetRelationship];
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v36 == 2)
          {
            long long v37 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v36 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            long long v37 = __CPLSystemLibraryOSLogDomain();
            }
          }
          long long v38 = v37;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v39 = [v35 scopeIdentifier];
            id v40 = [v35 uuid];
            *(_DWORD *)buf = 138543618;
            uint64_t v105 = (uint64_t)v39;
            __int16 v106 = 2114;
            v107 = v40;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Recomputed uploaded asset counts on MomentShare %{public}@ %{public}@ after receiving record status changes", buf, 0x16u);
          }
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v32);
  }

  if (v99)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v43 = [v70 allObjects];
  char v44 = +[PLManagedAsset assetsByScopedIdentifiers:v43 relationshipKeyPathsForPrefetching:0 inLibrary:*(void *)(a1 + 48)];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  int64_t v45 = [v44 allValues];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v88 != v48) {
          objc_enumerationMutation(v45);
        }
        id v50 = [*(id *)(*((void *)&v87 + 1) + 8 * k) allAssetCPLResources];
        [v42 unionSet:v50];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v87 objects:v101 count:16];
    }
    while (v47);
  }

  long long v86 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v83 = 0u;
  id v51 = v71;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v53; ++m)
      {
        if (*(void *)v84 != v54) {
          objc_enumerationMutation(v51);
        }
        unsigned int v56 = +[PLCloudMaster cloudMasterWithScopedIdentifier:*(void *)(*((void *)&v83 + 1) + 8 * m) prefetchResources:1 inLibrary:*(void *)(a1 + 48)];
        char v57 = [v56 allMasterResources];
        [v42 unionSet:v57];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v53);
  }

  id v58 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"localAvailability", 0xFFFFFFFFLL);
  [v42 filterUsingPredicate:v58];

  if ([v42 count] && !*MEMORY[0x1E4F59AC0])
  {
    uint64_t v59 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v59 == 2)
    {
      v60 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v59 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      v60 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v61 = v60;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v62 = [v42 valueForKey:@"objectID"];
      id v63 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138412546;
      uint64_t v105 = (uint64_t)v62;
      __int16 v106 = 2048;
      v107 = v63;
      _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "Checking and marking purgeable resources %@, notification generation (%lu)", buf, 0x16u);
    }
  }
  id v64 = *(void **)(a1 + 32);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_488;
  v75[3] = &unk_1E5866440;
  id v76 = v51;
  id v77 = *(id *)(a1 + 48);
  id v78 = *(id *)(a1 + 56);
  id v65 = *(id *)(a1 + 40);
  uint64_t v66 = *(void *)(a1 + 32);
  id v79 = v65;
  uint64_t v80 = v66;
  id v67 = *(id *)(a1 + 64);
  uint64_t v68 = *(void *)(a1 + 72);
  id v81 = v67;
  uint64_t v82 = v68;
  id v69 = v51;
  [v64 _checkAndMarkPurgeableResources:v42 checkIfSafe:1 checkServerIfNecessary:v73 urgency:1 completionHandler:v75];
}

uint64_t __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_488(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    int v6 = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2_489;
    BOOL v7 = &unk_1E5875E18;
    uint64_t v2 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v2 performTransactionAndWait:&v4];
  }
  objc_msgSend(*(id *)(a1 + 48), "acknowledgeChangedStatuses:", *(void *)(a1 + 56), v4, v5, v6, v7);
  return [*(id *)(a1 + 64) _getStatusChanges:*(void *)(a1 + 48) transaction:*(void *)(a1 + 72) notificationGeneration:*(void *)(a1 + 80) inLibrary:*(void *)(a1 + 40)];
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2_489(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allObjects];
  id v3 = +[PLCloudMaster cloudMastersByScopedIdentifiers:v2 relationshipKeyPathsForPrefetching:0 inLibrary:*(void *)(a1 + 40)];

  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_493];
}

uint64_t __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3_490(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCloudLocalState:3];
}

- (void)libraryManagerHasStatusChanges:(id)a3
{
  id v4 = a3;
  if (PLIsAssetsd())
  {
    uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager libraryManagerHasStatusChanges:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PLCloudPhotoLibraryManager_libraryManagerHasStatusChanges___block_invoke;
    v10[3] = &unk_1E5873A50;
    void v10[4] = self;
    id v11 = v4;
    id v12 = v5;
    int v6 = v5;
    [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v6 block:v10];

LABEL_12:
    goto LABEL_13;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v8 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v8 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v6 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Notified for record status change, but PLCloudPhotoLibrary is not running in assetsd", v9, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __61__PLCloudPhotoLibraryManager_libraryManagerHasStatusChanges___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 328))
  {
    ++*(void *)(v2 + 336);
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(v2 + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 336);
        int v11 = 138412546;
        id v12 = v6;
        __int16 v13 = 2048;
        uint64_t v14 = v7;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Notified for record status changes, state is currently %@, notification generation (%lu)", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v8 = [(id)v2 libraryServicesManager];
    id v9 = [v8 databaseContext];
    uint64_t v10 = (void *)[v9 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager libraryManagerHasStatusChanges:]_block_invoke"];

    [*(id *)(a1 + 32) _getStatusChanges:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48) notificationGeneration:*(void *)(*(void *)(a1 + 32) + 336) inLibrary:v10];
    *(unsigned char *)(*(void *)(a1 + 32) + 328) = 1;
  }
}

- (void)libraryManagerHasChangesToPull:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      int v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      int v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Notified for changes to pull, assetsd state is currently in %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (PLIsAssetsd())
  {
    [(PLCloudPhotoLibraryManager *)self sync];
  }
  else
  {
    id v9 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v10 = [v9 libraryBundle];
    int v11 = [v10 assetsdClient];
    id v12 = [v11 cloudInternalClient];
    [v12 syncCloudPhotoLibrary];
  }
}

- (void)libraryManagerDidChangeConfiguration:(id)a3
{
  id v4 = [(PLCloudPhotoLibraryManager *)self cplConfiguration];
  [(PLCloudPhotoLibraryManager *)self configurationDidChange:v4];
}

- (void)libraryManagerStatusDidChange:(id)a3
{
  id v4 = [(PLCloudPhotoLibraryManager *)self cplStatus];
  [(PLCloudPhotoLibraryManager *)self statusDidChange:v4];
}

- (void)_markResourceObjectIDsAsPurgeable:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      int v11 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      int v11 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = [v8 count];
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Marking %lu resources as purgeable", buf, 0xCu);
    }
  }
  int v13 = [v9 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke;
  v16[3] = &unk_1E58735D8;
  id v17 = v8;
  id v18 = v13;
  uint64_t v19 = self;
  int64_t v20 = a4;
  id v14 = v13;
  id v15 = v8;
  [v9 performBlock:v16];
}

void __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLInternalResource entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x65) {
    [v4 setFetchBatchSize:100];
  }
  int v6 = *(void **)(a1 + 40);
  id v27 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v27];
  id v8 = v27;
  uint64_t v9 = [v7 count];
  uint64_t v10 = [*(id *)(a1 + 32) count];
  int v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v9 != v10 && *MEMORY[0x1E4F59AC0] == 0)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 96);
    if (v13 == 2)
    {
      id v14 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v13 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v14 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v7 count];
      uint64_t v17 = [*(id *)(a1 + 32) count];
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v29 = v16;
      __int16 v30 = 2048;
      uint64_t v31 = v17;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Only found %lu resources from %lu resourceIDs: %@", buf, 0x20u);
    }
  }
  if (v7)
  {
    uint64_t v19 = [v7 count];
    int64_t v20 = *(void **)(a1 + 48);
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke_475;
    v26[3] = &unk_1E5873348;
    uint64_t v22 = *(void *)(a1 + 56);
    v26[4] = *(void *)(a1 + 48);
    void v26[5] = v19;
    [v20 _checkAndMarkPurgeableResources:v21 checkIfSafe:1 checkServerIfNecessary:0 urgency:v22 completionHandler:v26];
  }
  else if (!*v11)
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 96);
    if (v23 == 2)
    {
      uint64_t v24 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v23 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v24 = __CPLSystemLibraryOSLogDomain();
      }
    }
    os_log_type_t v25 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v8;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch confirmed resources %@", buf, 0xCu);
    }
  }
}

void __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke_475(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Successfully checked and marked %lu purgeable resources", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_processDownloadBatchWithSession:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v8 = PLCPLGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = v8;
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "BatchDownload", "", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _processDownloadBatchWithSession:inLibrary:]"];
  uint64_t v13 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v14 = [v13 postRunningProgress];
  int v15 = [v14 isCancelled];

  if (v15)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v17 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v17 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v18 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }
    }
    uint64_t v19 = v11;
    int64_t v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v9, "BatchDownload", "Shutting Down", buf, 2u);
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke;
    v21[3] = &unk_1E5864D60;
    v21[4] = self;
    id v22 = v12;
    id v23 = v7;
    uint64_t v24 = v11;
    os_signpost_id_t v26 = v9;
    id v25 = v6;
    [v25 getChangeBatchWithCompletionHandler:v21];
  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2;
  v14[3] = &unk_1E5864CC0;
  id v15 = v5;
  uint64_t v16 = v7;
  id v17 = v6;
  id v18 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  int v11 = *(void **)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v19 = v9;
  uint64_t v22 = v10;
  id v20 = v11;
  id v21 = *(id *)(a1 + 40);
  id v12 = v6;
  id v13 = v5;
  [v7 _runAsyncOnIsolationQueueWithTransaction:v8 block:v14];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*(void *)(a1 + 32))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        id v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v18 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v91 = v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Pulled change batch: %@", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 48))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = *(void **)(v20 + 8);
      uint64_t v22 = objc_msgSend(*(id *)(v20 + 16), "deletedRecordsFromBatch:");
      [v21 recordDeletions:v22];

      id v23 = [*(id *)(*(void *)(a1 + 40) + 16) handleIncomingBatch:*(void *)(a1 + 48)];
      char v24 = [v23 hasResourceChanges];
      uint64_t v25 = [v23 numberOfPhotos];
      uint64_t v26 = [v23 numberOfVideos];
      if (v25 | v26)
      {
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v83 = MEMORY[0x1E4F143A8];
        uint64_t v84 = 3221225472;
        long long v85 = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_448;
        long long v86 = &unk_1E5875E90;
        uint64_t v87 = v27;
        uint64_t v88 = v25;
        uint64_t v89 = v26;
        PLRunWithUnfairLock();
        [*(id *)(a1 + 40) _updateTransferCountsInLibrary:*(void *)(a1 + 56)];
      }
      id v28 = [v23 cmmUUIDsToNotify];
      if ([v28 count])
      {
        uint64_t v29 = *(void **)(a1 + 56);
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_449;
        v79[3] = &unk_1E5873A50;
        id v30 = v28;
        uint64_t v31 = *(void *)(a1 + 40);
        id v80 = v30;
        uint64_t v81 = v31;
        id v82 = *(id *)(a1 + 56);
        [v29 performBlock:v79 withPriority:0];
      }
      if ([v23 needsWidgetTimelineReload]) {
        _processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload = 1;
      }
      __int16 v32 = [*(id *)(a1 + 40) libraryServicesManager];
      uint64_t v33 = [v32 postRunningProgress];
      int v34 = [v33 isCancelled];

      if (v34)
      {
        if (!*v2)
        {
          uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 96);
          if (v35 == 2)
          {
            uint64_t v36 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v35 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v36 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v55 = v36;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
          }
        }
        unsigned int v56 = *(id *)(a1 + 64);
        char v57 = v56;
        os_signpost_id_t v58 = *(void *)(a1 + 88);
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v57, OS_SIGNPOST_INTERVAL_END, v58, "BatchDownload", "Shutting Down", buf, 2u);
        }
      }
      else
      {
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_452;
        v71[3] = &unk_1E5864D38;
        uint64_t v39 = *(void *)(a1 + 48);
        v71[4] = *(void *)(a1 + 40);
        id v40 = *(void **)(a1 + 72);
        id v72 = *(id *)(a1 + 80);
        unsigned int v73 = v23;
        id v74 = *(id *)(a1 + 56);
        char v78 = v24;
        id v41 = *(id *)(a1 + 64);
        uint64_t v42 = *(void *)(a1 + 88);
        id v75 = v41;
        uint64_t v77 = v42;
        id v76 = *(id *)(a1 + 72);
        [v40 acknowledgeChangeBatch:v39 withCompletionHandler:v71];
      }
      goto LABEL_80;
    }
    if (!*v2)
    {
      uint64_t v37 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v37 == 2)
      {
        long long v38 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v37 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        long long v38 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v46 = v38;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "No more pull batches available, finalizing pull session", buf, 2u);
      }
    }
    [*(id *)(a1 + 40) _setToDownloadCountsForImages:0 videos:0];
    uint64_t v47 = [*(id *)(a1 + 40) libraryServicesManager];
    uint64_t v48 = [v47 postRunningProgress];
    int v49 = [v48 isCancelled];

    if (v49)
    {
      if (!*v2)
      {
        uint64_t v50 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v50 == 2)
        {
          id v51 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v50 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v51 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v59 = v51;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
        }
      }
      v60 = *(id *)(a1 + 64);
      id v23 = v60;
      os_signpost_id_t v45 = *(void *)(a1 + 88);
      if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v60)) {
        goto LABEL_80;
      }
      *(_WORD *)buf = 0;
      goto LABEL_57;
    }
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_460;
    v66[3] = &unk_1E5864C20;
    v66[4] = *(void *)(a1 + 40);
    uint64_t v52 = *(void **)(a1 + 72);
    id v67 = *(id *)(a1 + 80);
    id v68 = *(id *)(a1 + 56);
    id v53 = *(id *)(a1 + 64);
    uint64_t v54 = *(void *)(a1 + 88);
    id v69 = v53;
    uint64_t v70 = v54;
    [v52 finalizeWithCompletionHandler:v66];

    id v17 = v67;
LABEL_24:

    return;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v91 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Received error while pulling changes: %@", buf, 0xCu);
    }
  }
  id v9 = [*(id *)(a1 + 40) libraryServicesManager];
  uint64_t v10 = [v9 postRunningProgress];
  int v11 = [v10 isCancelled];

  if (!v11)
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_465;
    v61[3] = &unk_1E5864C20;
    v61[4] = *(void *)(a1 + 40);
    id v14 = *(void **)(a1 + 72);
    id v62 = *(id *)(a1 + 80);
    id v63 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 88);
    id v64 = v15;
    uint64_t v65 = v16;
    [v14 finalizeWithCompletionHandler:v61];

    id v17 = v62;
    goto LABEL_24;
  }
  if (!*v2)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v12 == 2)
    {
      id v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v12 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v43 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
    }
  }
  char v44 = *(id *)(a1 + 64);
  id v23 = v44;
  os_signpost_id_t v45 = *(void *)(a1 + 88);
  if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
    goto LABEL_80;
  }
  *(_WORD *)buf = 0;
LABEL_57:
  _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v45, "BatchDownload", "Shutting Down", buf, 2u);
LABEL_80:
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_448(void *a1)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 376), "unsignedIntegerValue"));
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 376);
  *(void *)(v3 + 376) = v2;

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 384), "unsignedIntegerValue"));
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 384);
  *(void *)(v6 + 384) = v5;
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_449(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_3;
  v3[3] = &unk_1E586FC78;
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 enumerateObjectsUsingBlock:v3];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_452(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_453;
  v14[3] = &unk_1E5864D10;
  id v15 = v5;
  uint64_t v16 = v7;
  id v17 = v6;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  char v24 = *(unsigned char *)(a1 + 88);
  id v9 = *(id *)(a1 + 64);
  int v11 = *(void **)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v20 = v9;
  uint64_t v23 = v10;
  id v21 = v11;
  id v22 = *(id *)(a1 + 40);
  id v12 = v6;
  id v13 = v5;
  [v7 _runAsyncOnIsolationQueueWithTransaction:v8 block:v14];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_460(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_461;
  v9[3] = &unk_1E5870A08;
  void v9[4] = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v12 = v6;
  uint64_t v13 = v7;
  id v8 = v3;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v5 block:v9];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_465(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_466;
  v9[3] = &unk_1E5870A08;
  id v10 = v3;
  id v11 = v4;
  id v12 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v5 block:v9];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_466(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    BOOL v2 = *MEMORY[0x1E4F59AC0] == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Error finalizing session: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(void *)(a1 + 48))|| *(void *)(a1 + 32)&& +[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:"))
  {
    [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error when finalizing a pull session during pull"];
    uint64_t v7 = 7;
  }
  else
  {
    uint64_t v7 = 6;
  }
  [*(id *)(a1 + 40) _transitionToState:v7];
  id v8 = *(id *)(a1 + 56);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "BatchDownload", "Error while pulling changes: %@", (uint8_t *)&v12, 0xCu);
  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_461(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (_processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload == 1)
  {
    _processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload = 0;
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating widget timeline due to changes in batch download session", (uint8_t *)&v15, 2u);
      }
    }
    uint64_t v6 = [*(id *)(a1 + 40) photoAnalysisClient];
    [v6 reloadForYouWidgetTimelineWithReply:0];
  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:*(void *)(a1 + 48)])
  {
    if (!*v2)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      os_signpost_id_t v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        int v15 = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error while finalizing ack change batch: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error while finalizing a pull session"];
    uint64_t v9 = 7;
  }
  else
  {
    uint64_t v9 = 6;
  }
  [*(id *)(a1 + 32) _transitionToState:v9];
  int v12 = *(id *)(a1 + 56);
  uint64_t v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 64);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "BatchDownload", "", (uint8_t *)&v15, 2u);
  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_453(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (*(void *)(a1 + 32))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Received error while acknowledging change batch: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [*(id *)(a1 + 40) libraryServicesManager];
    os_signpost_id_t v10 = [v9 postRunningProgress];
    int v11 = [v10 isCancelled];

    if (!v11)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_454;
      v30[3] = &unk_1E5864C20;
      v30[4] = *(void *)(a1 + 40);
      os_signpost_id_t v14 = *(void **)(a1 + 80);
      id v31 = *(id *)(a1 + 88);
      id v32 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 72);
      uint64_t v16 = *(void *)(a1 + 96);
      id v33 = v15;
      uint64_t v34 = v16;
      [v14 finalizeWithCompletionHandler:v30];

      return;
    }
    if (!*v2)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v12 == 2)
      {
        uint64_t v13 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v12 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v13 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v27 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }
    }
    id v28 = *(id *)(a1 + 72);
    id v19 = v28;
    os_signpost_id_t v29 = *(void *)(a1 + 96);
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v29, "BatchDownload", "Shutting Down", buf, 2u);
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        uint64_t v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v17 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Change batch acknowledged, new version: %@", buf, 0xCu);
      }
    }
    id v19 = [*(id *)(a1 + 56) confirmedResourceIDs];
    if ([v19 count]) {
      [*(id *)(a1 + 40) _markResourceObjectIDsAsPurgeable:v19 urgency:1 inLibrary:*(void *)(a1 + 64)];
    }
    if (*(void *)(a1 + 48))
    {
      id v20 = [PLGlobalValues alloc];
      id v21 = [*(id *)(a1 + 64) managedObjectContext];
      id v22 = [(PLGlobalValues *)v20 initWithManagedObjectContext:v21];

      [(PLGlobalValues *)v22 setCloudTrackerLastKnownCloudVersion:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v23 = [*(id *)(a1 + 40) resourceManager];
      [v23 startAutomaticPrefetchAndPruneWithTimeout:0];
    }
    char v24 = *(id *)(a1 + 72);
    uint64_t v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 96);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v26, "BatchDownload", "", buf, 2u);
    }

    [*(id *)(a1 + 40) _processDownloadBatchWithSession:*(void *)(a1 + 80) inLibrary:*(void *)(a1 + 64)];
  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_454(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_455;
  v9[3] = &unk_1E5870A08;
  id v10 = v3;
  int v11 = v4;
  id v12 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v5 block:v9];
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_455(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    BOOL v2 = *MEMORY[0x1E4F59AC0] == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Error finalizing session: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(void *)(a1 + 48))|| *(void *)(a1 + 32)&& +[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:"))
  {
    [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error while acknowledging change batch"];
    uint64_t v7 = 7;
  }
  else
  {
    uint64_t v7 = 6;
  }
  [*(id *)(a1 + 40) _transitionToState:v7];
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "BatchDownload", "", (uint8_t *)&v11, 2u);
  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v5 == 2)
    {
      uint64_t v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v5 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Sending notification CMM %@ has finished uploading.", (uint8_t *)&v13, 0xCu);
    }
  }
  id v8 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v9 = +[PLShare shareWithUUID:v3 includeTrashed:0 inManagedObjectContext:v8];

  if (v9)
  {
    os_signpost_id_t v10 = +[PLNotificationManager sharedManager];
    [v10 noteUserAssetsAreReadyForMomentShare:v9];
LABEL_22:

    goto LABEL_23;
  }
  if (!*v4)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v11 == 2)
    {
      uint64_t v12 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v11 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v12 = __CPLSystemLibraryOSLogDomain();
      }
    }
    os_signpost_id_t v10 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to find CMM with UUID %@ to post notification", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_downloadFromCloudInLibrary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v5 = PLCPLGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Download", "_downloadFromCloud", buf, 2u);
  }

  uint64_t v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _downloadFromCloudInLibrary:]"];
  os_signpost_id_t v10 = [(id)objc_opt_class() _lastKnownCloudVersionInLibrary:v4];
  uint64_t v11 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke;
  v16[3] = &unk_1E5864CE8;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v4;
  id v20 = v8;
  os_signpost_id_t v21 = v6;
  uint64_t v12 = v8;
  id v13 = v4;
  id v14 = v10;
  id v15 = v9;
  [v11 beginPullChangeSessionWithKnownLibraryVersion:v14 completionHandler:v16];
}

void __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_2;
  v13[3] = &unk_1E5864CC0;
  id v14 = v6;
  id v15 = v7;
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v20 = v9;
  uint64_t v21 = v10;
  id v11 = v5;
  id v12 = v6;
  [v7 _runAsyncOnIsolationQueueWithTransaction:v8 block:v13];
}

void __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 72);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_443;
    v13[3] = &unk_1E5875E18;
    void v13[4] = v3;
    id v14 = v2;
    [v3 _runAsyncOnIsolationQueueWithTransaction:v4 block:v13];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        id v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Pull session started with last known version: %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 40) _processDownloadBatchWithSession:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 64)];
  }
  id v9 = *(id *)(a1 + 80);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 88);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    BOOL v12 = *(void *)(a1 + 32) == 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "Download", "_downloadFromCloud success: %d", buf, 8u);
  }
}

uint64_t __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_443(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      id v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Error beginning pull session: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:*(void *)(a1 + 40)])
  {
    [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error beginning pull session"];
    uint64_t v6 = 7;
  }
  else
  {
    uint64_t v6 = 6;
  }
  return [*(id *)(a1 + 32) _transitionToState:v6];
}

- (void)sendBudgetOverrideAnalytics:(BOOL)a3 pauseReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  os_signpost_id_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke;
  v20[3] = &unk_1E5871E08;
  void v20[4] = self;
  void v20[5] = &v37;
  v20[6] = &v33;
  v20[7] = &v29;
  [(PLCloudPhotoLibraryManager *)self _runSyncOnIsolationQueueWithBlock:v20];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  int v8 = [WeakRetained cloudPhotoLibraryManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke_2;
  v19[3] = &unk_1E5864C98;
  v19[4] = &v25;
  v19[5] = &v21;
  [v8 getLibraryScopeStatusCountsForScopeWithIdentifier:@"PrimarySync" completionHandler:v19];

  if (v30[3])
  {
    id v9 = v6;
    id v10 = objc_alloc_init(MEMORY[0x1E4F8B8C0]);
    os_signpost_id_t v11 = [NSNumber numberWithBool:v4];
    uint64_t v12 = *MEMORY[0x1E4F8C0B8];
    [v10 setPayloadValue:v11 forKey:*MEMORY[0x1E4F8C0F0] onEventWithName:*MEMORY[0x1E4F8C0B8]];

    id v13 = [NSNumber numberWithUnsignedInteger:v38[3]];
    [v10 setPayloadValue:v13 forKey:*MEMORY[0x1E4F8C0D8] onEventWithName:v12];

    id v14 = [NSNumber numberWithUnsignedInteger:v34[3]];
    [v10 setPayloadValue:v14 forKey:*MEMORY[0x1E4F8C0E0] onEventWithName:v12];

    id v15 = [NSNumber numberWithUnsignedInteger:v30[3]];
    [v10 setPayloadValue:v15 forKey:*MEMORY[0x1E4F8C0D0] onEventWithName:v12];

    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v26[3]];
    [v10 setPayloadValue:v16 forKey:*MEMORY[0x1E4F8C0C8] onEventWithName:v12];

    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v22[3]];
    [v10 setPayloadValue:v17 forKey:*MEMORY[0x1E4F8C0C0] onEventWithName:v12];

    [v10 setPayloadValue:v9 forKey:*MEMORY[0x1E4F8C0E8] onEventWithName:v12];
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v42 = v10;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "SystemBudgets overriden metrics: %{public}@", buf, 0xCu);
    }

    [v10 publishEventWithName:v12];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    id v3 = v2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 numberOfImagesToUpload];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 numberOfVideosToUpload];
    uint64_t v2 = v3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 countOfUnsharingRecords];
  uint64_t v4 = [v3 countOfSharingRecords];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (BOOL)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 forSystemBudgets:(unint64_t)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  PLSAggregateDictionaryAddValueForScalarKey(@"com.apple.mobileslideshow.overrideBudgetCount", 1);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__PLCloudPhotoLibraryManager_overrideSystemBudgetsForSyncSession_pauseReason_forSystemBudgets___block_invoke;
  v11[3] = &unk_1E5865378;
  BOOL v12 = v6;
  void v11[5] = &v13;
  v11[6] = a5;
  v11[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runSyncOnIsolationQueueWithBlock:v11];
  if (v6) {
    [(PLCloudPhotoLibraryManager *)self sendBudgetOverrideAnalytics:*((unsigned __int8 *)v14 + 24) pauseReason:v8];
  }
  char v9 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __95__PLCloudPhotoLibraryManager_overrideSystemBudgetsForSyncSession_pauseReason_forSystemBudgets___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    id v3 = v2;
    [v2 setShouldOverride:*(unsigned __int8 *)(a1 + 56) forSystemBudgets:*(void *)(a1 + 48)];
    uint64_t v2 = v3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager getSystemBudgetsWithCompletionHandler:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E5874D98;
    id v6 = *(id *)(a1 + 40);
    [v2 getSystemBudgetsWithCompletionHandler:v5];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = +[PLCloudPhotoLibraryError createErrorWithType:15];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

uint64_t __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startAutomaticPrefetchOrPrune
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__PLCloudPhotoLibraryManager_startAutomaticPrefetchOrPrune__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:0 block:v2];
}

void __59__PLCloudPhotoLibraryManager_startAutomaticPrefetchOrPrune__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceManager];
  [v2 startAutomaticPrefetchAndPruneWithTimeout:1];

  id v3 = [*(id *)(a1 + 32) resourceManager];
  [v3 updateCacheDeletePurgeableAmount];
}

- (void)_processUploadBatchWithStartupFailureCount:(unint64_t)a3 orderKeyManager:(id)a4 inLibrary:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v10 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      BOOL v12 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      BOOL v12 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = [(PLCloudBatchUploader *)self->_uploader numberOfBatchesToUpload];
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Processing %d upload batches", buf, 8u);
    }
  }
  if ([(PLCloudBatchUploader *)self->_uploader hasBatchesToUpload])
  {
    unint64_t v30 = a3;
    unint64_t v15 = [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker totalSizeOfUnpushedOriginals];
    char v16 = PLCPLGetLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);
    id v18 = v16;
    id v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v44 = v15;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Upload", "total size of unpushed originals: %llu", buf, 0xCu);
    }

    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    uint64_t v40 = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke;
    id v41 = &unk_1E5875CE0;
    id v42 = self;
    PLRunWithUnfairLock();
    id v20 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _processUploadBatchWithStartupFailureCount:orderKeyManager:inLibrary:]"];
    uint64_t v21 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    id v22 = [v21 postRunningProgress];
    int v23 = [v22 isCancelled];

    if (v23)
    {
      if (!*v10)
      {
        int64_t v24 = self->_libraryMode;
        if (v24 == 2)
        {
          uint64_t v25 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v24 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v25 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v28 = v25;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
        }
      }
      uint64_t v29 = v19;
      os_signpost_id_t v26 = v29;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v17, "Upload", "Shutting Down", buf, 2u);
      }
    }
    else
    {
      os_signpost_id_t v26 = [(id)objc_opt_class() _lastKnownCloudVersionInLibrary:v9];
      uint64_t v27 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_386;
      v31[3] = &unk_1E5864C70;
      v31[4] = self;
      id v32 = v20;
      id v33 = v9;
      id v34 = v8;
      uint64_t v35 = v19;
      os_signpost_id_t v36 = v17;
      unint64_t v37 = v30;
      [v27 beginPushChangeSessionWithKnownLibraryVersion:v26 completionHandler:v31];
    }
  }
  else
  {
    [(PLCloudPhotoLibraryManager *)self _finishUploadWithNoBatchesToUploadInLibrary:v9];
  }
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 352) unsignedIntegerValue];
  id v3 = [*(id *)(a1 + 32) cplLibrary];
  *(void *)(*(void *)(a1 + 32) + 208) = [v3 numberOfImagesToUpload] + v2;

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 360) unsignedIntegerValue];
  id v5 = [*(id *)(a1 + 32) cplLibrary];
  *(void *)(*(void *)(a1 + 32) + 216) = [v5 numberOfVideosToUpload] + v4;
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_386(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v7 == 2)
    {
      id v8 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v7 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v8 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "beginPushError: %@", buf, 0xCu);
    }
  }
  os_signpost_id_t v11 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_387;
  v14[3] = &unk_1E5864C48;
  void v14[4] = v11;
  id v15 = v6;
  id v16 = v5;
  id v17 = v10;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 72);
  id v12 = v5;
  id v13 = v6;
  [v11 _runAsyncOnIsolationQueueWithTransaction:v17 block:v14];
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_387(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 8) hasBatchesToUpload])
  {
    id v6 = [*(id *)(a1 + 32) libraryServicesManager];
    uint64_t v7 = [v6 postRunningProgress];
    int v8 = [v7 isCancelled];

    if (!v8)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_427;
      v48[3] = &unk_1E5864C20;
      v48[4] = *(void *)(a1 + 32);
      os_signpost_id_t v11 = *(void **)(a1 + 48);
      id v49 = *(id *)(a1 + 56);
      id v50 = *(id *)(a1 + 64);
      id v12 = *(id *)(a1 + 80);
      uint64_t v13 = *(void *)(a1 + 88);
      id v51 = v12;
      uint64_t v52 = v13;
      [v11 finalizeWithCompletionHandler:v48];

      return;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v9 == 2)
      {
        id v10 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v9 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v10 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v28 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }
    }
    uint64_t v29 = *(id *)(a1 + 80);
    unint64_t v30 = v29;
    os_signpost_id_t v31 = *(void *)(a1 + 88);
    if (v31 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v29)) {
      goto LABEL_59;
    }
    *(_WORD *)buf = 0;
    id v32 = "Shutting Down";
    id v33 = v30;
    os_signpost_id_t v34 = v31;
    uint32_t v35 = 2;
    goto LABEL_58;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    int v14 = [*(id *)(*(void *)(a1 + 32) + 8) pop];
    id v15 = [v14 batch];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_2;
    v59[3] = &unk_1E5864BF8;
    v59[4] = *(void *)(a1 + 32);
    id v60 = v15;
    id v16 = *(void **)(a1 + 48);
    id v61 = *(id *)(a1 + 56);
    id v62 = *(id *)(a1 + 64);
    id v63 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    uint64_t v18 = *(void *)(a1 + 88);
    id v64 = v17;
    uint64_t v67 = v18;
    id v65 = *(id *)(a1 + 48);
    id v66 = v14;
    id v19 = v14;
    id v20 = v15;
    [v16 commitChangeBatch:v20 completionHandler:v59];

    return;
  }
  id v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      id v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    long long v21 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)id v69 = v22;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Got a push error: %@", buf, 0xCu);
    }

    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:v2])
  {
    id v23 = *(void **)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 56);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_422;
    v57[3] = &unk_1E5875E18;
    v57[4] = v23;
    id v58 = *(id *)(a1 + 40);
    [v23 _runAsyncOnIsolationQueueWithTransaction:v24 block:v57];
    uint64_t v25 = v58;
  }
  else
  {
    if (!*v3)
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v26 == 2)
      {
        uint64_t v27 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v26 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v27 = __CPLSystemLibraryOSLogDomain();
        }
      }
      os_signpost_id_t v36 = v27;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(a1 + 96);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v69 = 5;
        *(_WORD *)&v69[4] = 1024;
        *(_DWORD *)&v69[6] = v37;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Waiting %d seconds then retrying upload after error beginning push, startupFaiureCount: %d", buf, 0xEu);
      }
    }
    unint64_t v38 = *(void *)(a1 + 96);
    if (v38 > 0x18)
    {
      if (!*v3)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v41 == 2)
        {
          id v42 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v41 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v42 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v43 = v42;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = *(void *)(a1 + 96);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)id v69 = v44;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Reached max startupFailureCount: %d, transitioning to library error state", buf, 8u);
        }
      }
      [*(id *)(a1 + 32) _transitionToState:0];
      goto LABEL_55;
    }
    uint64_t v39 = *(void **)(a1 + 32);
    uint64_t v40 = *(void *)(a1 + 56);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_426;
    v53[3] = &unk_1E58735D8;
    v53[4] = v39;
    unint64_t v56 = v38;
    id v54 = *(id *)(a1 + 72);
    id v55 = *(id *)(a1 + 64);
    [v39 _runAsyncOnIsolationQueueWithTransaction:v40 afterDelay:v53 block:5.0];

    uint64_t v25 = v54;
  }

LABEL_55:
  uint64_t v45 = *(id *)(a1 + 80);
  unint64_t v30 = v45;
  os_signpost_id_t v46 = *(void *)(a1 + 88);
  if (v46 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v45)) {
    goto LABEL_59;
  }
  uint64_t v47 = *(void *)(a1 + 40);
  *(_DWORD *)buf = 138412290;
  *(void *)id v69 = v47;
  id v32 = "Error during beginPushChangeSession: %@";
  id v33 = v30;
  os_signpost_id_t v34 = v46;
  uint32_t v35 = 12;
LABEL_58:
  _os_signpost_emit_with_name_impl(&dword_19B3C7000, v33, OS_SIGNPOST_INTERVAL_END, v34, "Upload", v32, buf, v35);
LABEL_59:
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v46 = a3;
  id v7 = a4;
  int v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      id v10 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v9 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v10 = __CPLSystemLibraryOSLogDomain();
      }
    }
    os_signpost_id_t v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v47;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "commitError: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v45 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v44 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v43 = [MEMORY[0x1E4F1CA80] set];
  id v42 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v41 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v40 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v38 = [MEMORY[0x1E4F1CA80] set];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  if (v47)
  {
    if (!*v8)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v13 == 2)
      {
        int v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v74 = 138412290;
        id v75 = v47;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Got a commit error: %@", v74, 0xCu);
      }

      if (!*v8)
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v16 == 2)
        {
          id v17 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v16 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v17 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v18 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v74 = 138412290;
          id v75 = v46;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Tasks: %@", v74, 0xCu);
        }
      }
    }
    id v37 = v7;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_388;
    v62[3] = &unk_1E5864BA8;
    id v19 = v41;
    id v63 = v19;
    id v20 = v44;
    id v64 = v20;
    id v21 = v43;
    id v65 = v21;
    id v22 = v45;
    id v66 = v22;
    id v23 = v42;
    id v67 = v23;
    id v24 = v40;
    id v68 = v24;
    id v25 = v39;
    id v69 = v25;
    id v26 = v38;
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void **)(a1 + 40);
    id v70 = v26;
    uint64_t v71 = v27;
    id v72 = v28;
    p_long long buf = &buf;
    [v46 enumerateScopedTasksWithBlock:v62];
    [v12 setObject:v22 forKey:@"regenerateDerivativeError"];
    [v12 setObject:v21 forKey:@"needMasterError"];
    [v12 setObject:v20 forKey:@"needFullChangeError"];
    [v12 setObject:v23 forKey:@"repushAlbumError"];
    [v12 setObject:v19 forKey:@"quarantinedRecordError"];
    [v12 setObject:v24 forKey:@"invalidScopeError"];
    [v12 setObject:v25 forKey:@"invalidResourceCopySourceError"];
    [v12 setObject:v26 forKey:@"invalidExpungeableResourceTypes"];

    id v7 = v37;
  }
  uint64_t v29 = *(void **)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 48);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_418;
  v48[3] = &unk_1E5867978;
  id v31 = v47;
  uint64_t v32 = *(void *)(a1 + 32);
  id v49 = v31;
  uint64_t v50 = v32;
  id v33 = v7;
  id v51 = v33;
  id v52 = *(id *)(a1 + 40);
  id v53 = *(id *)(a1 + 56);
  id v60 = &buf;
  id v34 = v12;
  id v54 = v34;
  id v55 = *(id *)(a1 + 64);
  id v35 = *(id *)(a1 + 72);
  uint64_t v36 = *(void *)(a1 + 96);
  id v56 = v35;
  uint64_t v61 = v36;
  id v57 = *(id *)(a1 + 80);
  id v58 = *(id *)(a1 + 88);
  id v59 = *(id *)(a1 + 48);
  [v29 _runAsyncOnIsolationQueueWithTransaction:v30 block:v48];

  _Block_object_dispose(&buf, 8);
}

uint64_t __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_422(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      id v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Error beginning push session: %@, need to force a reset sync", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 8) clearUploadArray];
  [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error beginning push session"];
  return [*(id *)(a1 + 32) _transitionToState:7];
}

uint64_t __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_426(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processUploadBatchWithStartupFailureCount:*(void *)(a1 + 56) + 1 orderKeyManager:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 48)];
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_427(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _handleFinalizeSessionError:a2 commitError:0 uploadBatchContainer:0 needResetSync:0 forTransaction:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 48)];
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Upload", "No batch to upload", v6, 2u);
  }
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_388(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a2)
  {
    case 0:
    case 1:
      id v6 = (void *)a1[4];
      goto LABEL_10;
    case 2:
      id v6 = (void *)a1[5];
      goto LABEL_10;
    case 3:
      id v6 = (void *)a1[7];
      goto LABEL_10;
    case 4:
      id v6 = (void *)a1[6];
      goto LABEL_10;
    case 5:
      id v6 = (void *)a1[8];
      goto LABEL_10;
    case 6:
      id v6 = (void *)a1[9];
      goto LABEL_10;
    case 7:
      id v6 = (void *)a1[10];
      goto LABEL_10;
    case 8:
      id v6 = (void *)a1[11];
LABEL_10:
      [v6 addObject:v5];
      break;
    case 9:
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v7 = *(void *)(a1[12] + 96);
        if (v7 == 2)
        {
          uint64_t v8 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v7 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v8 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = a1[13];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v14 = v10;
          __int16 v15 = 2112;
          id v16 = v5;
          __int16 v17 = 1024;
          int v18 = 9;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Received unknown taskType on commit, forcing a resetSync, upload batch: %@, record: %@, type: %d", buf, 0x1Cu);
        }
      }
      os_signpost_id_t v11 = (void *)MEMORY[0x1E4F59938];
      id v12 = [MEMORY[0x1E4F59908] descriptionForTaskType:9];
      [v11 registerLikelyResetReason:@"assetsd rejected pushed change for an unsupported reason: %@", v12];

      *(unsigned char *)(*(void *)(a1[14] + 8) + 24) = 1;
      break;
    default:
      break;
  }
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_418(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v3 == 2)
        {
          uint64_t v4 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v3 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v4 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v18 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 56);
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v47 = v19;
          __int16 v48 = 2112;
          uint64_t v49 = v20;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@: Error: %@", buf, 0x16u);
        }

        uint64_t v2 = *(void *)(a1 + 32);
      }
      [*(id *)(*(void *)(a1 + 40) + 8) tryToFixCommitError:v2 inUploadBatch:*(void *)(a1 + 56) forRecords:*(void *)(a1 + 72) uploadTracker:*(void *)(*(void *)(a1 + 40) + 256) orderKeyManager:*(void *)(a1 + 80) inLibrary:*(void *)(a1 + 64)];
    }
  }
  else
  {
    id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v6 == 2)
      {
        uint64_t v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v6 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v47 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Change batch committed, new version: %@, finalizing push session", buf, 0xCu);
      }

      if (!*v5)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v10 == 2)
        {
          os_signpost_id_t v11 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v10 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          os_signpost_id_t v11 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*(id *)(a1 + 56) records];
          uint64_t v14 = [v13 count];
          *(_DWORD *)long long buf = 134217984;
          uint64_t v47 = v14;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "uploaded %lu records", buf, 0xCu);
        }
      }
    }
    if (*(void *)(a1 + 48))
    {
      __int16 v15 = [PLGlobalValues alloc];
      id v16 = [*(id *)(a1 + 64) managedObjectContext];
      __int16 v17 = [(PLGlobalValues *)v15 initWithManagedObjectContext:v16];

      [(PLGlobalValues *)v17 setCloudTrackerLastKnownCloudVersion:*(void *)(a1 + 48)];
    }
  }
  id v21 = [*(id *)(a1 + 40) libraryServicesManager];
  id v22 = [v21 postRunningProgress];
  int v23 = [v22 isCancelled];

  if (v23)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v24 == 2)
      {
        id v25 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v24 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v25 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v33 = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }
    }
    id v34 = *(id *)(a1 + 88);
    id v35 = v34;
    os_signpost_id_t v36 = *(void *)(a1 + 128);
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v35, OS_SIGNPOST_INTERVAL_END, v36, "Upload", "Shutting Down", buf, 2u);
    }
  }
  else
  {
    id v26 = *(void **)(a1 + 96);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_419;
    v38[3] = &unk_1E5864BD0;
    int8x16_t v37 = *(int8x16_t *)(a1 + 32);
    id v27 = (id)v37.i64[0];
    int8x16_t v39 = vextq_s8(v37, v37, 8uLL);
    id v28 = *(id *)(a1 + 104);
    uint64_t v30 = *(void **)(a1 + 112);
    uint64_t v29 = *(void *)(a1 + 120);
    id v40 = v28;
    uint64_t v44 = v29;
    id v41 = v30;
    id v42 = *(id *)(a1 + 64);
    id v31 = *(id *)(a1 + 88);
    uint64_t v32 = *(void *)(a1 + 128);
    id v43 = v31;
    uint64_t v45 = v32;
    [v26 finalizeWithCompletionHandler:v38];
  }
}

void __99__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_orderKeyManager_inLibrary___block_invoke_419(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _handleFinalizeSessionError:a2 commitError:*(void *)(a1 + 40) uploadBatchContainer:*(void *)(a1 + 48) needResetSync:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) forTransaction:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 64)];
  uint64_t v3 = *(id *)(a1 + 72);
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 88);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Upload", "Finalize upload session", v6, 2u);
  }
}

- (void)_finishUploadWithNoBatchesToUploadInLibrary:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)os_signpost_id_t v11 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "No batches to upload", v11, 2u);
    }
  }
  uint64_t v8 = [v4 managedObjectContext];
  [(PLCloudPhotoLibraryManager *)self _saveLastKnownCloudChangeTrackerTokenToDiskWithContext:v8];

  [(PLCloudBatchUploader *)self->_uploader processMomentSharesNeedingForceSyncInLibrary:v4];
  if ([(PLCloudBatchUploader *)self->_uploader initialUpload])
  {
    uint64_t v9 = 3;
    uint64_t v10 = 90;
  }
  else
  {
    uint64_t v10 = 90;
    if (self->_pushOnIdle)
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v10 = 91;
      uint64_t v9 = 5;
    }
  }
  *((unsigned char *)&self->super.isa + v10) = 0;
  [(PLCloudPhotoLibraryManager *)self _transitionToState:v9];
}

- (void)_handleFinalizeSessionError:(id)a3 commitError:(id)a4 uploadBatchContainer:(id)a5 needResetSync:(BOOL)a6 forTransaction:(id)a7 inLibrary:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v20 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v20 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v21 = v20;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v35 = v14;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "finalizeError: %@", buf, 0xCu);
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke;
  v27[3] = &unk_1E5871078;
  v27[4] = self;
  id v28 = v15;
  id v29 = v14;
  id v30 = v16;
  BOOL v33 = a6;
  id v31 = v18;
  id v32 = v17;
  id v22 = v17;
  id v23 = v18;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v22 block:v27];
}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) processCommitError:*(void *)(a1 + 40) andFinalizeError:*(void *)(a1 + 48) forUploadBatchContainer:*(void *)(a1 + 56) withUploadTracker:*(void *)(*(void *)(a1 + 32) + 256) inLibrary:*(void *)(a1 + 64)];
  uint64_t v3 = [v2 objectForKey:@"resetSyncNeeded"];
  BOOL v4 = ([v3 BOOLValue] & 1) != 0 || *(unsigned char *)(a1 + 80) != 0;

  os_signpost_id_t v5 = [v2 objectForKey:@"hadError"];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [v2 objectForKey:@"hadPermanentError"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 93))
  {
    if (v4)
    {
LABEL_6:
      uint64_t v10 = *(void *)(a1 + 32);
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v11 = *(void *)(v10 + 96);
        if (v11 == 2)
        {
          id v12 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v11 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v12 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int8x16_t v37 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Need to perform a reset sync", buf, 2u);
        }

        uint64_t v10 = *(void *)(a1 + 32);
      }
      [*(id *)(v10 + 8) clearUploadArray];
      [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected an error while processing batch"];
      [*(id *)(a1 + 32) _transitionToState:7];
      goto LABEL_60;
    }
  }
  else
  {
    *(unsigned char *)(v9 + 93) = 1;
    if (v4) {
      goto LABEL_6;
    }
  }
  if ((v6 ^ 1 | v8) == 1)
  {
    uint64_t v13 = [v2 objectForKey:@"pushedPhotoCount"];
    uint64_t v14 = [v13 unsignedIntegerValue];

    id v15 = [v2 objectForKey:@"pushedVideoCount"];
    uint64_t v16 = [v15 unsignedIntegerValue];

    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v56 = MEMORY[0x1E4F143A8];
    uint64_t v57 = 3221225472;
    id v58 = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_2;
    id v59 = &unk_1E5875E90;
    uint64_t v60 = v17;
    uint64_t v61 = v14;
    uint64_t v62 = v16;
    PLRunWithUnfairLock();
    [*(id *)(a1 + 32) _updateTransferCountsInLibrary:*(void *)(a1 + 64)];
    if (v8)
    {
      id v18 = [v2 objectForKey:@"changedTotalSizeOfUnpushedOriginal"];
      int v19 = [v18 BOOLValue];

      if (v19) {
        [*(id *)(a1 + 64) performBlock:&__block_literal_global_379];
      }
    }
    uint64_t v20 = +[PLMomentShare momentSharesReferencedInUploadBatchContainer:*(void *)(a1 + 56) inPhotoLibrary:*(void *)(a1 + 64)];
    if ([v20 count]) {
      [*(id *)(*(void *)(a1 + 32) + 8) recordMomentSharesNeedingForceSync:v20 inLibrary:*(void *)(a1 + 64)];
    }
    if (+[PLManagedAsset isComputeSyncEnabledForDirection:0 library:*(void *)(a1 + 64)])
    {
      id v21 = [*(id *)(a1 + 56) computeSyncRelevantAssetsInBatch];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        id v23 = [*(id *)(a1 + 56) computeSyncRelevantAssetsInBatch];
        id v24 = [v23 allObjects];

        id v25 = +[PLManagedAsset createSparseComputeStateRecordsForAssets:v24 inPhotoLibrary:*(void *)(a1 + 64)];
        if ([v25 count])
        {
          id v46 = v24;
          uint64_t v47 = v20;
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v45 = v25;
          id v27 = v25;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v67 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v53;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v53 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                BOOL v33 = [v32 itemScopedIdentifier];
                [v26 setObject:v32 forKeyedSubscript:v33];
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v67 count:16];
            }
            while (v29);
          }

          id v34 = [*(id *)(a1 + 32) cplLibrary];
          id v24 = v46;
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 96);
            if (v35 == 2)
            {
              uint64_t v36 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v35 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v36 = __CPLSystemLibraryOSLogDomain();
              }
            }
            unint64_t v38 = v36;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = [v27 count];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v64 = v39;
              __int16 v65 = 2112;
              id v66 = v27;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "[CCSS] Attaching %lu sparse compute state records to cpl library %@", buf, 0x16u);
            }
          }
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_381;
          v50[3] = &unk_1E586B750;
          v50[4] = *(void *)(a1 + 32);
          id v51 = v27;
          [v34 attachComputeStates:v51 completionHandler:v50];

          uint64_t v20 = v47;
          id v25 = v45;
        }
      }
    }
  }
  if (v6)
  {
    id v40 = *(void **)(a1 + 32);
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v41 = v40[12];
      if (v41 == 2)
      {
        id v42 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v41 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v42 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v43 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v64) = 5;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Waiting %d seconds then retrying upload after error processing batch", buf, 8u);
      }

      id v40 = *(void **)(a1 + 32);
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_382;
    v48[3] = &unk_1E5875E18;
    void v48[4] = v40;
    uint64_t v44 = *(void *)(a1 + 72);
    id v49 = *(id *)(a1 + 64);
    [v40 _runAsyncOnIsolationQueueWithTransaction:v44 afterDelay:v48 block:5.0];
  }
  else
  {
    [*(id *)(a1 + 32) _processUploadBatchInLibrary:*(void *)(a1 + 64)];
  }
LABEL_60:
}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_2(void *a1)
{
  if ((unint64_t)[*(id *)(a1[4] + 352) integerValue] >= a1[5])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 352), "integerValue") - a1[5]);
    uint64_t v5 = a1[4];
    uint64_t v3 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v4;
  }
  else
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(v2 + 352);
    *(void *)(v2 + 352) = &unk_1EEBED518;
  }

  if ((unint64_t)[*(id *)(a1[4] + 360) integerValue] >= a1[6])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 360), "integerValue") - a1[6]);
    uint64_t v9 = a1[4];
    uint64_t v7 = *(void **)(v9 + 360);
    *(void *)(v9 + 360) = v8;
  }
  else
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 360);
    *(void *)(v6 + 360) = &unk_1EEBED518;
  }
}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_381(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v8 = v5;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v9 = [*(id *)(a1 + 40) count];
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 134218498;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      uint64_t v11 = "[CCSS] Failed to attach %lu sparse compute state records to cpl library: %@ %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_20:
      _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v16, v14);
LABEL_21:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v6 == 2)
    {
      uint64_t v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v6 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v8 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    uint64_t v15 = [*(id *)(a1 + 40) count];
    int v16 = 134217984;
    uint64_t v17 = v15;
    uint64_t v11 = "[CCSS] Successfully attached %lu sparse compute state records to cpl library";
    id v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 12;
    goto LABEL_20;
  }
}

uint64_t __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_382(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processUploadBatchInLibrary:*(void *)(a1 + 40)];
}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_377()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
}

- (void)_processUploadBatchInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 libraryServicesManager];
  uint64_t v6 = [v5 databaseContext];

  uint64_t v7 = [PLRelationshipOrderKeyManager alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PLCloudPhotoLibraryManager__processUploadBatchInLibrary___block_invoke;
  v10[3] = &unk_1E5872390;
  id v11 = v6;
  id v8 = v6;
  uint64_t v9 = [(PLRelationshipOrderKeyManager *)v7 initWithGenerateContextBlock:v10];
  [(PLCloudPhotoLibraryManager *)self _processUploadBatchWithStartupFailureCount:0 orderKeyManager:v9 inLibrary:v4];
}

uint64_t __59__PLCloudPhotoLibraryManager__processUploadBatchInLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (id)[*(id *)(a1 + 32) newShortLivedLibraryForOrderKeyManagerWithName:a2];
  return [v2 managedObjectContext];
}

- (void)updateTransferCountsWithInsertedPhotoCount:(unint64_t)a3 insertedVideoCount:(unint64_t)a4 inLibrary:(id)a5
{
  if (a4 | a3)
  {
    id v6 = a5;
    PLRunWithUnfairLock();
    [(PLCloudPhotoLibraryManager *)self _updateTransferCountsInLibrary:v6];
  }
}

void __102__PLCloudPhotoLibraryManager_updateTransferCountsWithInsertedPhotoCount_insertedVideoCount_inLibrary___block_invoke(void *a1)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 352), "unsignedIntegerValue"));
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 352);
  *(void *)(v3 + 352) = v2;

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 360), "unsignedIntegerValue"));
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v5;

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 376), "unsignedIntegerValue"));
  uint64_t v9 = a1[4];
  uint64_t v10 = *(void **)(v9 + 376);
  *(void *)(v9 + 376) = v8;

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 384), "unsignedIntegerValue"));
  uint64_t v12 = a1[4];
  os_log_type_t v13 = *(void **)(v12 + 384);
  *(void *)(v12 + 384) = v11;
}

- (void)_uploadToCloudForEventsResult:(id)a3 inLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke;
  v11[3] = &unk_1E58735D8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [v9 performBlockAndWait:v11];
}

void __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PLCloudPhotoLibraryManager.m", 3049, @"Invalid parameter not satisfying: %@", @"eventsResult != nil" object file lineNumber description];

    uint64_t v2 = *(void **)(a1 + 40);
  }
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke_2;
  v12[3] = &unk_1E5864B80;
  void v12[4] = *(void *)(a1 + 32);
  SEL v14 = &v25;
  uint64_t v15 = &v21;
  id v13 = *(id *)(a1 + 48);
  int v16 = &v17;
  [v2 enumerateLocalEventsWithBlock:v12];
  *(unsigned char *)(*(void *)(a1 + 32) + 90) = [*(id *)(a1 + 40) hasMoreEvents];
  [*(id *)(*(void *)(a1 + 32) + 24) updateLastKnownTokenToResult:*(void *)(a1 + 40)];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 32) resourceManager];
    [v3 startAutomaticPrefetchAndPruneWithTimeout:1];
  }
  [*(id *)(a1 + 32) updateTransferCountsWithInsertedPhotoCount:v26[3] insertedVideoCount:v22[3] inLibrary:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) hasBatchesToUpload])
  {
    uint64_t v4 = 4;
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v5 == 2)
      {
        uint64_t v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [*(id *)(*(void *)(a1 + 32) + 24) lastKnownTokenDescription];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "didn't upload, no batch, updating change traker token on disk to %@", buf, 0xCu);
      }
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = [*(id *)(a1 + 48) managedObjectContext];
    [v9 _saveLastKnownCloudChangeTrackerTokenToDiskWithContext:v10];

    uint64_t v4 = 6;
  }
  [*(id *)(a1 + 32) _transitionToState:v4];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v6 = *(void *)(a1[4] + 96);
    if (v6 == 2)
    {
      id v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v6 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "local event for upload = %@", (uint8_t *)&v9, 0xCu);
    }
  }
  LOBYTE(v9) = 0;
  [*(id *)(a1[4] + 8) handleUploadBatchesFromLocalEvent:v5 outInsertedPhotoCount:*(void *)(a1[6] + 8) + 24 outInsertedVideoCount:*(void *)(a1[7] + 8) + 24 shouldTriggerPrefetch:&v9 withUploadTracker:*(void *)(a1[4] + 256) inLibrary:a1[5]];
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) |= v9;
  if ([*(id *)(a1[4] + 8) hasBatchesToUpload]) {
    *a3 = 1;
  }
}

- (void)_uploadFullPhotoLibraryToCloud:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudPhotoLibraryManager *)self _migrateFromChangeHubToCoreDataIfNecessary];
  [(PLCloudBatchUploader *)self->_uploader uploadFullPhotoLibraryToCloud:v4];
  if ([(PLCloudBatchUploader *)self->_uploader hasBatchesToUpload])
  {
    if (*MEMORY[0x1E4F59AC0])
    {
      uint64_t v11 = 4;
      goto LABEL_24;
    }
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v9 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [(PLCloudBatchUploader *)self->_uploader numberOfBatchesToUpload];
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Uploading full library (%d batches) to cloud", (uint8_t *)v13, 8u);
    }
    uint64_t v11 = 4;
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v7 = self->_libraryMode;
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v12 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Finished initial upload", (uint8_t *)v13, 2u);
      }
    }
    [(PLCloudBatchUploader *)self->_uploader setInitialUpload:0];
    int v9 = [v4 globalValues];
    [v9 setCloudInitialUploadCompleted:1];
    uint64_t v11 = 6;
  }

LABEL_24:
  [(PLCloudPhotoLibraryManager *)self _transitionToState:v11];
}

- (void)_checkForPushedMastersInLibrary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v5 = [v4 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PLCloudPhotoLibraryManager__checkForPushedMastersInLibrary___block_invoke;
  v8[3] = &unk_1E5873A50;
  id v9 = v5;
  int v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [v6 performTransaction:v8];
}

void __62__PLCloudPhotoLibraryManager__checkForPushedMastersInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLCloudMaster entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudMasterGUID != nil AND cloudLocalState == %d", 1);
  [v4 setPredicate:v5];
  [v4 setFetchBatchSize:100];
  id v6 = *(void **)(a1 + 32);
  id v25 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v25];
  id v8 = v25;
  id v9 = v8;
  if (v7)
  {
    id v19 = v8;
    int v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    char v20 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          int v16 = [*(id *)(*((void *)&v21 + 1) + 8 * i) scopedIdentifier];
          [v10 addObject:v16];

          if (__ROR8__(0x8F5C28F5C28F5C29 * [v10 count], 1) <= 0x51EB851EB851EB8uLL)
          {
            [*(id *)(a1 + 40) _fixMasterStatusIn:v10 inLibrary:*(void *)(a1 + 48)];
            [v10 removeAllObjects];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      [*(id *)(a1 + 40) _fixMasterStatusIn:v10 inLibrary:*(void *)(a1 + 48)];
      [v10 removeAllObjects];
    }
    id v7 = v20;
    id v9 = v19;
LABEL_23:

    goto LABEL_24;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v17 == 2)
    {
      __int16 v18 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v17 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      __int16 v18 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v10 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Fetch for pushed master failed, error:%@", buf, 0xCu);
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_fixMasterStatusIn:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)[v6 copy];
    id v9 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke;
    v10[3] = &unk_1E5864B58;
    void v10[4] = self;
    id v11 = v7;
    [v9 getStatusForRecordsWithScopedIdentifiers:v8 completionHandler:v10];
  }
}

void __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v12 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "getStatusForRecords for pushed master failed, error:%@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else if ([v5 count])
  {
    id v9 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    _DWORD v13[2] = __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke_346;
    v13[3] = &unk_1E5873A50;
    uint64_t v14 = v5;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v15 = v10;
    uint64_t v16 = v11;
    [v9 performTransaction:v13];

    uint64_t v12 = v14;
LABEL_13:
  }
}

void __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke_346(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v19;
    uint64_t v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
    *(void *)&long long v4 = 67109120;
    long long v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, v17, (void)v18);
        int v11 = [v10 isUploaded];

        if (v11)
        {
          uint64_t v12 = +[PLCloudMaster cloudMasterWithScopedIdentifier:v9 prefetchResources:0 inLibrary:*(void *)(a1 + 40)];
          if (!*v7)
          {
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 96);
            if (v13 == 2)
            {
              uint64_t v14 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v13 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v14 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v15 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              int v16 = [v12 cloudLocalState];
              *(_DWORD *)long long buf = v17;
              int v23 = v16;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "_fixMasterStatusIn: setting master (%d) to uploaded", buf, 8u);
            }
          }
          [v12 setCloudLocalState:3];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }
}

- (BOOL)isConnectedToCloudChangeTracker
{
  return [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker isConnected];
}

- (id)_fetchEventsFromCloudChangeTrackerInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__12675;
  id v15 = __Block_byref_object_dispose__12676;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PLCloudPhotoLibraryManager__fetchEventsFromCloudChangeTrackerInLibrary___block_invoke;
  v8[3] = &unk_1E5875340;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __74__PLCloudPhotoLibraryManager__fetchEventsFromCloudChangeTrackerInLibrary___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v3 = [v2 fetchAllEventsInContext:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_fetchNewEventsFromCloudChangeTrackerInLibrary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Fetching new events from cloud change tracker", (uint8_t *)&v47, 2u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if ([(PLCloudPhotoLibraryManager *)self isConnectedToCloudChangeTracker])
  {
    if ([(PLCloudBatchUploader *)self->_uploader initialUpload])
    {
      if (!*v5)
      {
        int64_t v9 = self->_libraryMode;
        if (v9 == 2)
        {
          id v10 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v9 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v10 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v16 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Is initial upload so uploading full library", (uint8_t *)&v47, 2u);
        }
      }
      [(PLCloudPhotoLibraryManager *)self _uploadFullPhotoLibraryToCloud:v4];
      goto LABEL_106;
    }
    if (!*v5)
    {
      int64_t v13 = self->_libraryMode;
      if (v13 == 2)
      {
        uint64_t v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      long long v17 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Fetching events from cloud change tracker", (uint8_t *)&v47, 2u);
      }
    }
    long long v18 = [(PLCloudPhotoLibraryManager *)self _fetchEventsFromCloudChangeTrackerInLibrary:v4];
    if ([v18 resultType] == 4)
    {
      if (!*v5)
      {
        int64_t v19 = self->_libraryMode;
        if (v19 == 2)
        {
          long long v20 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v19 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v20 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v27 = v20;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "No history when fetching events", (uint8_t *)&v47, 2u);
        }
      }
      if ([(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker hasChangeTrackerToken])
      {
        if (!*v5)
        {
          int64_t v28 = self->_libraryMode;
          if (v28 == 2)
          {
            uint64_t v29 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v28 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v29 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v36 = v29;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v47) = 0;
            _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Cloud change tracker has no history but an existing token so doing a reset sync", (uint8_t *)&v47, 2u);
          }
        }
        [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd changeStore has no history"];
        [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v4];
        [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker clearToken];
      }
      else
      {
        if (!*v5)
        {
          int64_t v30 = self->_libraryMode;
          if (v30 == 2)
          {
            uint64_t v31 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v30 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v31 = __CPLSystemLibraryOSLogDomain();
            }
          }
          int8x16_t v37 = v31;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v47) = 0;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Cloud change tracker has no history and no existing token so uploading full library", (uint8_t *)&v47, 2u);
          }
        }
        [(PLCloudPhotoLibraryManager *)self _uploadFullPhotoLibraryToCloud:v4];
      }
      goto LABEL_105;
    }
    if ([v18 resultType] == 3)
    {
      if (!*v5)
      {
        int64_t v21 = self->_libraryMode;
        if (v21 == 2)
        {
          long long v22 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v21 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v22 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v32 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Change token is unexpectedly up-to-date", (uint8_t *)&v47, 2u);
        }
      }
      BOOL v33 = [v4 managedObjectContext];
      [(PLCloudPhotoLibraryManager *)self _saveLastKnownCloudChangeTrackerTokenToDiskWithContext:v33];
LABEL_90:

      goto LABEL_91;
    }
    if ([v18 resultType] == 5)
    {
      if (!*v5)
      {
        int64_t v23 = self->_libraryMode;
        if (v23 == 2)
        {
          long long v24 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v23 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v24 = __CPLSystemLibraryOSLogDomain();
          }
        }
        BOOL v33 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v38 = [v18 currentTokenDescription];
          uint64_t v39 = [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker lastKnownTokenDescription];
          int v47 = 138543618;
          __int16 v48 = v38;
          __int16 v49 = 2114;
          uint64_t v50 = (uint64_t)v39;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "We're not up to date, be there were no new events. Current token: %{public}@, we have %{public}@", (uint8_t *)&v47, 0x16u);
        }
        goto LABEL_90;
      }
    }
    else
    {
      if (!*v5)
      {
        int64_t v25 = self->_libraryMode;
        if (v25 == 2)
        {
          id v26 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v25 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v26 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v40 = v26;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker lastKnownTokenDescription];
          uint64_t v42 = [v18 resultType];
          int v47 = 138543618;
          __int16 v48 = v41;
          __int16 v49 = 2048;
          uint64_t v50 = v42;
          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "fetched history from assetd since: %{public}@, resultType: %zd", (uint8_t *)&v47, 0x16u);
        }
      }
      if ([v18 resultType] != 1)
      {
        if ([v18 resultType] != 2)
        {
          [(PLCloudPhotoLibraryManager *)self _uploadToCloudForEventsResult:v18 inLibrary:v4];
          goto LABEL_105;
        }
        if (!*v5)
        {
          int64_t v43 = self->_libraryMode;
          if (v43 == 2)
          {
            uint64_t v44 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v43 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v44 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v45 = v44;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            id v46 = [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker lastKnownTokenDescription];
            int v47 = 138543362;
            __int16 v48 = v46;
            _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "assetsd doesn't have change history for what we need. We're now going to re-push our current local library to the cloud, last token = %{public}@", (uint8_t *)&v47, 0xCu);
          }
        }
        [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd can't find its change history"];
        [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v4];
        id v34 = self;
        uint64_t v35 = 3;
LABEL_92:
        [(PLCloudPhotoLibraryManager *)v34 _transitionToState:v35];
LABEL_105:

        goto LABEL_106;
      }
    }
LABEL_91:
    id v34 = self;
    uint64_t v35 = 6;
    goto LABEL_92;
  }
  if (!*v5)
  {
    int64_t v11 = self->_libraryMode;
    if (v11 == 2)
    {
      uint64_t v12 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v11 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v12 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v15 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Skip fetching new events when iCPL is not enabled", (uint8_t *)&v47, 2u);
    }
  }
  [(PLCloudPhotoLibraryManager *)self _transitionToState:6];
LABEL_106:
}

- (void)_processRulesEvaluationIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  rulesChangeTracker = self->_rulesChangeTracker;
  if (rulesChangeTracker)
  {
    id v4 = [(PLLibraryScopeChangeTracker *)rulesChangeTracker fetchObjectsNeedingEvaluation];
    id v5 = [v4 assetObjectIDs];
    id v6 = [v4 detectedFaceObjectIDs];
    if ([v5 count] || objc_msgSend(v6, "count"))
    {
      uint64_t v7 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      id v8 = [v7 databaseContext];
      int64_t v9 = (void *)[v8 newShortLivedLibraryWithName:"-[PLCloudPhotoLibraryManager _processRulesEvaluationIfNeeded]"];

      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      int64_t v13 = __61__PLCloudPhotoLibraryManager__processRulesEvaluationIfNeeded__block_invoke;
      uint64_t v14 = &unk_1E5875BF8;
      id v15 = v9;
      id v16 = v5;
      long long v17 = self;
      id v18 = v6;
      id v10 = v9;
      [v10 performTransactionAndWait:&v11];
    }
    -[PLLibraryScopeChangeTracker updateLastKnownTokenToResult:](self->_rulesChangeTracker, "updateLastKnownTokenToResult:", v4, v11, v12, v13, v14);
  }
}

void __61__PLCloudPhotoLibraryManager__processRulesEvaluationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v2];

  id v4 = [[PLLibraryScopeRuleManager alloc] initWithLibraryScope:v3];
  uint64_t v5 = [*(id *)(a1 + 40) count];
  id v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v5)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 96);
      if (v7 == 2)
      {
        id v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 40) count];
        int v15 = 134217984;
        uint64_t v16 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Rules change tracker: %lu assets need evaluation, sending to library scope rule manager", (uint8_t *)&v15, 0xCu);
      }
    }
    [(PLLibraryScopeRuleManager *)v4 evaluateAssetObjectIDs:*(void *)(a1 + 40) withResultEnumerationBlock:0];
  }
  if ([*(id *)(a1 + 56) count])
  {
    if (!*v6)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 96);
      if (v11 == 2)
      {
        uint64_t v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*(id *)(a1 + 40) count];
        int v15 = 134217984;
        uint64_t v16 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Rules change tracker: %lu faces need evaluation, sending to library scope rule manager", (uint8_t *)&v15, 0xCu);
      }
    }
    [(PLLibraryScopeRuleManager *)v4 evaluateFaceObjectIDs:*(void *)(a1 + 56) withResultEnumerationBlock:0];
  }
}

- (void)photosPreferencesChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__PLCloudPhotoLibraryManager_photosPreferencesChanged__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:0 block:v2];
}

void *__54__PLCloudPhotoLibraryManager_photosPreferencesChanged__block_invoke(uint64_t a1)
{
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      uint64_t v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Photos preferences changed", v8, 2u);
    }
  }
  int v5 = PLIsSharedLibrarySuggestionsEnabled();
  CGSize result = *(void **)(a1 + 32);
  uint64_t v7 = result[5];
  if (v5)
  {
    if (!v7) {
      return (void *)[result _startLibraryScopeRulesChangeTrackerInQueue];
    }
  }
  else if (v7)
  {
    return (void *)[result stopLibraryScopeRulesChangeTracker];
  }
  return result;
}

- (void)stopLibraryScopeRulesChangeTracker
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting and clearing rules change tracker", v7, 2u);
    }
  }
  [(PLLibraryScopeChangeTracker *)self->_rulesChangeTracker stop];
  rulesChangeTracker = self->_rulesChangeTracker;
  self->_rulesChangeTracker = 0;
}

- (void)resetSyncDueToMigrationMarker
{
  [MEMORY[0x1E4F59938] registerLikelyResetReason:@"Change Hub migration marker found"];
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v4 = [v3 databaseContext];
  id v5 = (id)[v4 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager resetSyncDueToMigrationMarker]"];

  [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v5];
}

- (id)readLocalVersion
{
  objc_opt_class();
  uint64_t v3 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v4 = *MEMORY[0x1E4F8BAF8];
  id v5 = [(PLCloudPhotoLibraryManager *)self pathManager];
  id v6 = [v3 readCPLPlistObjectWithKey:v4 pathManager:v5];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)removeAllChangeHubKeys
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v3 = *MEMORY[0x1E4F8BAF8];
  id v4 = [(PLCloudPhotoLibraryManager *)self pathManager];
  [v2 saveCPLPlistObject:0 forKey:v3 pathManager:v4];
}

- (void)_startLibraryScopeRulesChangeTrackerInQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_libraryMode)
  {
    if (PLIsSharedLibrarySuggestionsEnabled())
    {
      uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      id v4 = [v3 databaseContext];
      id v5 = (void *)[v4 newShortLivedLibraryForHistoryPersistenceReadingWithName:"PLLibraryScopeChangeTracker persistence history tracker"];

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      _DWORD v7[2] = __73__PLCloudPhotoLibraryManager__startLibraryScopeRulesChangeTrackerInQueue__block_invoke;
      v7[3] = &unk_1E5875E18;
      id v8 = v5;
      int64_t v9 = self;
      id v6 = v5;
      [v6 performBlockAndWait:v7];
    }
  }
}

void __73__PLCloudPhotoLibraryManager__startLibraryScopeRulesChangeTrackerInQueue__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v2];

  if ([v3 shouldEnableRulesChangeTracker])
  {
    id v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        id v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Setting up rules change tracker", buf, 2u);
      }
    }
    id v8 = [PLLibraryScopeChangeTracker alloc];
    int64_t v9 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v10 = [(PLLibraryScopeChangeTracker *)v8 initWithManagedObjectContext:v9];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (([*(id *)(*(void *)(a1 + 40) + 40) start] & 1) == 0 && !*v4)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v13 == 2)
      {
        uint64_t v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to connect to rules change tracker", v16, 2u);
      }
    }
  }
}

- (void)startLibraryScopeRulesChangeTracker
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__PLCloudPhotoLibraryManager_startLibraryScopeRulesChangeTracker__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:0 block:v2];
}

uint64_t __65__PLCloudPhotoLibraryManager_startLibraryScopeRulesChangeTracker__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLibraryScopeRulesChangeTrackerInQueue];
}

- (void)startAssetRecoveryWithTransaction:(id)a3
{
  id v5 = a3;
  if ([(PLCloudPhotoLibraryManager *)self isCloudPhotoLibraryEnabled])
  {
    id v4 = [(PLCloudPhotoLibraryManager *)self recoveryManager];
    [v4 startRecoveryUsingCloudPhotoLibraryManager:self transaction:v5 shouldIdentifyInconsistentAssets:1];
  }
}

- (void)_doResetSync:(int64_t)a3 inLibrary:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a3 != 2) {
    self->_initializedMaster = 1;
  }
  uint64_t v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      int64_t v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      int64_t v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      int64_t v34 = a3;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Re-push local library to the cloud due to starting reset sync of type: %ld", buf, 0xCu);
    }
  }
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  int64_t v30 = __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke;
  uint64_t v31 = &unk_1E5875CE0;
  id v32 = self;
  PLRunWithUnfairLock();
  [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker reset];
  [(PLCloudBatchUploader *)self->_uploader setInitialUpload:1];
  self->_pullOnIdle = 1;
  uint64_t v11 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v12 = [(PLCloudPhotoLibraryManager *)self pathManager];
  LODWORD(v11) = [v11 CPLPlistFileExistsWithPathManager:v12];

  if (v11) {
    self->_pendingResetSyncType = a3;
  }
  uint64_t v13 = [(PLCloudPhotoLibraryManager *)self resourceManager];
  [v13 stop];

  if (a3 == 2 && self->_syncChangeTracker)
  {
    if (*v7) {
      goto LABEL_38;
    }
    int64_t v14 = self->_libraryMode;
    if (v14 == 2)
    {
      int v15 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v14 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      int v15 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v16 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Tried to hard reset while we had an existing hub connection.  This could cause data loss so ignoring.  PLEASE REPORT THIS!", buf, 2u);
    }
  }
  else
  {
    PLResetSyncStatusWithLibrary(v6, 0, a3 == 2, 0, 0);
  }
  if (!*v7)
  {
    int64_t v17 = self->_libraryMode;
    if (v17 == 2)
    {
      id v18 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v17 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v18 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v19 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Clearing cloud version and last initial upload date from PLGlobalValues...", buf, 2u);
    }
  }
LABEL_38:
  long long v20 = [v6 globalValues];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  int64_t v25 = __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke_332;
  id v26 = &unk_1E5875CE0;
  id v27 = v20;
  id v21 = v20;
  [v6 performTransactionAndWait:&v23];
  [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker forceTokenToCurrent];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.ResetSyncStateChanged", 0, 0, 1u);
}

void __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 352);
  *(void *)(v2 + 352) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 360);
  *(void *)(v4 + 360) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  int64_t v9 = *(void **)(v8 + 376);
  *(void *)(v8 + 376) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 384);
  *(void *)(v10 + 384) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 392);
  *(void *)(v12 + 392) = 0;
}

uint64_t __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke_332(uint64_t a1)
{
  [*(id *)(a1 + 32) setCloudTrackerLastKnownCloudVersion:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setCloudInitialUploadCompleted:0];
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager deleteResources:checkServerIfNecessary:completionHandler:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __87__PLCloudPhotoLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v13[3] = &unk_1E5873CA8;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v10 block:v13];
}

void __87__PLCloudPhotoLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cplLibrary];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 deleteResources:*(void *)(a1 + 40) checkServerIfNecessary:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        id v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", v13, 2u);
      }
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F59868];
    uint64_t v10 = a1 + 40;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v10 + 8);
    id v11 = +[PLCloudPhotoLibraryError createErrorWithType:15];
    id v12 = [v7 unsafeResources:v8 withError:v11 resourceStorage:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
  }
}

- (void)downloadResourceInMemory:(id)a3 clientBundleID:(id)a4 proposedTaskIdentifier:(id)a5 taskDidBeginHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int64_t v17 = v16;
  if (v12 && v16)
  {
    id v18 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager downloadResourceInMemory:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:]"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke;
    v20[3] = &unk_1E5864B30;
    void v20[4] = self;
    id v21 = v12;
    id v25 = v15;
    id v22 = v14;
    id v26 = v17;
    id v23 = v13;
    id v24 = v18;
    id v19 = v18;
    [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v19 block:v20];
  }
}

void __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isPausedForDownloadRequestHighPriority:0])
  {
    uint64_t v2 = [NSString stringWithFormat:@"iCloud Photo Library is paused, unable to download in-memory resource %@", *(void *)(a1 + 40)];
    id v3 = +[PLCloudPhotoLibraryError createErrorWithType:1 withDebugMessage:v2];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        id v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v3;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    (*(void (**)(void, void, uint64_t, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0, [*(id *)(a1 + 40) resourceType], v3);
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) cplLibrary];
    if (v6)
    {
      uint64_t v2 = (void *)v6;
      uint64_t v7 = *(void **)(a1 + 48);
      if (v7)
      {
        id v3 = v7;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F29128] UUID];
        id v3 = [v11 UUIDString];
      }
      if ([*(id *)(*(void *)(a1 + 32) + 248) addClientHandlerAndCreateTaskIfNecessaryForResource:*(void *)(a1 + 40) taskIdentifier:v3 completionHandler:*(void *)(a1 + 80)])
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v12 == 2)
          {
            id v13 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v12 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v13 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v19 = v13;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            long long v20 = *(void **)(a1 + 40);
            *(_DWORD *)long long buf = 138412546;
            id v31 = v20;
            __int16 v32 = 2112;
            id v33 = v3;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Going to download in-memory CPLResource %@ with taskIdentifier %@", buf, 0x16u);
          }
        }
        uint64_t v21 = *(void *)(a1 + 56);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke_330;
        v25[3] = &unk_1E5864B08;
        id v22 = *(void **)(a1 + 40);
        v25[4] = *(void *)(a1 + 32);
        id v26 = v22;
        id v29 = *(id *)(a1 + 72);
        id v3 = v3;
        id v27 = v3;
        id v28 = *(id *)(a1 + 64);
        [v2 beginInMemoryDownloadOfResource:v26 clientBundleID:v21 completionHandler:v25];
      }
      else if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v14 == 2)
        {
          id v15 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v14 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v15 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v23 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v24 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          id v31 = v24;
          __int16 v32 = 2112;
          id v33 = v3;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Resource download for in-memory CPLResource %@ is inflight with taskIdentifier %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v8 == 2)
        {
          uint64_t v9 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v8 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v9 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v16 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", buf, 2u);
        }
      }
      uint64_t v17 = *(void *)(a1 + 72);
      uint64_t v18 = [*(id *)(a1 + 40) resourceType];
      id v3 = +[PLCloudPhotoLibraryError createErrorWithType:15];
      (*(void (**)(uint64_t, void, uint64_t, id))(v17 + 16))(v17, 0, v18, v3);
      uint64_t v2 = 0;
    }
  }
}

void __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke_330(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = +[PLCloudPhotoLibraryError createErrorWithType:2];
    [*(id *)(*(void *)(a1 + 32) + 248) reportCompletionForResource:*(void *)(a1 + 40) withData:0 error:v6];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        uint64_t v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to start download in-memory for resource %@", (uint8_t *)&v12, 0xCu);
      }
    }
    goto LABEL_21;
  }
  [*(id *)(*(void *)(a1 + 32) + 248) setTransferTask:v3 forResource:*(void *)(a1 + 40)];
  (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 48), [*(id *)(a1 + 40) resourceType], 0);
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      id v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Began download in-memory resource %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_21:
  }
  [*(id *)(a1 + 56) stillAlive];
}

- (void)downloadResourceInMemoryForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 clientBundleID:(id)a6 proposedTaskIdentifier:(id)a7 taskDidBeginHandler:(id)a8 completionHandler:(id)a9
{
  if (a3 && a9)
  {
    BOOL v12 = a5;
    id v16 = a9;
    id v17 = a8;
    id v18 = a7;
    id v19 = a6;
    id v20 = [(PLCloudPhotoLibraryManager *)self _assetResourceForAsset:a3 resourceType:a4 masterResourceOnly:v12 isPhoto:0];
    [(PLCloudPhotoLibraryManager *)self downloadResourceInMemory:v20 clientBundleID:v19 proposedTaskIdentifier:v18 taskDidBeginHandler:v17 completionHandler:v16];
  }
}

- (void)downloadAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 clientBundleID:(id)a7 proposedTaskIdentifier:(id)a8 taskDidBeginHandler:(id)a9 progressBlock:(id)a10 completionHandler:(id)a11
{
  BOOL v13 = a6;
  BOOL v14 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void, unint64_t, void *))a9;
  id v21 = a10;
  id v22 = a11;
  if (!v20) {
    id v20 = (void (**)(id, void, unint64_t, void *))&__block_literal_global_326;
  }
  char v33 = 0;
  id v23 = [(PLCloudPhotoLibraryManager *)self _assetResourceForAsset:v17 resourceType:a4 masterResourceOnly:v14 isPhoto:&v33];
  if (v23)
  {
    [(PLCloudPhotoLibraryManager *)self downloadResource:v23 highPriority:v13 clientBundleID:v18 proposedTaskIdentifier:v19 taskDidBeginHandler:v20 progressBlock:v21 completionHandler:v22];
  }
  else
  {
    if (v33) {
      uint64_t v24 = 3;
    }
    else {
      uint64_t v24 = 4;
    }
    id v25 = +[PLCloudPhotoLibraryError createErrorWithType:v24];
    __int16 v32 = [v17 allAssetCPLResources];
    id v31 = [v17 allMasterCPLResources];
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        id v27 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v27 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v28 = v27;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        [v17 master];
        id v29 = v30 = v25;
        *(_DWORD *)long long buf = 138413570;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        id v37 = v17;
        __int16 v38 = 2112;
        uint64_t v39 = v32;
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        int64_t v43 = v31;
        __int16 v44 = 2048;
        unint64_t v45 = a4;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%@. Asset: %@ %@, Master: %@ %@, resourceType: %lu", buf, 0x3Eu);

        id v25 = v30;
      }
    }
    v20[2](v20, 0, a4, v25);
  }
}

- (id)_assetResourceForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 isPhoto:(BOOL *)a6
{
  id v9 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__12675;
  uint64_t v24 = __Block_byref_object_dispose__12676;
  id v25 = 0;
  uint64_t v10 = [v9 photoLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PLCloudPhotoLibraryManager__assetResourceForAsset_resourceType_masterResourceOnly_isPhoto___block_invoke;
  v14[3] = &unk_1E5864AE0;
  id v16 = &v26;
  id v11 = v9;
  BOOL v19 = a5;
  id v15 = v11;
  id v17 = &v20;
  unint64_t v18 = a4;
  [v10 performBlockAndWait:v14];

  if (a6) {
    *a6 = *((unsigned char *)v27 + 24);
  }
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __93__PLCloudPhotoLibraryManager__assetResourceForAsset_resourceType_masterResourceOnly_isPhoto___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isPhoto];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64)) {
    objc_msgSend(v2, "rm_cplMasterResourceForResourceType:", v3);
  }
  else {
    objc_msgSend(v2, "rm_cplResourceForResourceType:", v3);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)downloadResource:(id)a3 options:(id)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = [v15 resourceType];
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = &__block_literal_global_315;
  }
  if (!v19) {
    id v19 = &__block_literal_global_318;
  }
  if (v15)
  {
    uint64_t v24 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:]"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_3;
    v27[3] = &unk_1E5864AB8;
    id v28 = v16;
    char v29 = self;
    id v30 = v15;
    id v34 = v19;
    uint64_t v37 = v22;
    id v31 = v18;
    id v35 = v20;
    id v36 = v23;
    id v32 = v17;
    id v33 = v24;
    id v25 = v24;
    [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v25 block:v27];
  }
  else
  {
    uint64_t v26 = +[PLCloudPhotoLibraryError createErrorWithType:12];
    (*((void (**)(id, void, uint64_t, void *))v19 + 2))(v19, 0, v22, v26);
  }
}

void __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  v48[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) isForeground];
  if ([*(id *)(a1 + 40) _isPausedForDownloadRequestHighPriority:v2])
  {
    uint64_t v3 = [NSString stringWithFormat:@"iCloud Photo Library is paused, unable to download resource %@", *(void *)(a1 + 48)];
    id v4 = +[PLCloudPhotoLibraryError createErrorWithType:1 withDebugMessage:v3];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        uint64_t v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v5 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v11 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v44 = v4;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) cplLibrary];
    if (v7)
    {
      uint64_t v3 = (void *)v7;
      uint64_t v8 = *(void **)(a1 + 56);
      if (v8)
      {
        id v4 = v8;
      }
      else
      {
        id v12 = [MEMORY[0x1E4F29128] UUID];
        id v4 = [v12 UUIDString];
      }
      BOOL v13 = [*(id *)(a1 + 40) _identifierForResource:*(void *)(a1 + 48)];
      if ([*(id *)(*(void *)(a1 + 40) + 136) addProgressBlock:*(void *)(a1 + 88) completionHandler:*(void *)(a1 + 96) forResourceIdentifier:v13 highPriority:v2 withTaskIdentifier:v4])
      {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 96);
          if (v14 == 2)
          {
            id v15 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v14 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v15 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v24 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = *(void **)(a1 + 48);
            uint64_t v26 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138543874;
            id v44 = v25;
            __int16 v45 = 2114;
            id v46 = v4;
            __int16 v47 = 2114;
            v48[0] = v26;
            _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Download is inflight for resource %{public}@ with taskIdentifier %{public}@, options: %{public}@", buf, 0x20u);
          }
        }
      }
      else
      {
        if (v2)
        {
          os_signpost_id_t v16 = [v4 hash];
          id v17 = PLCPLSignpostsTelemetryGetLog();
          id v18 = v17;
          if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "OnDemandDownload", "", buf, 2u);
          }
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 96);
          if (v19 == 2)
          {
            id v20 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v19 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v20 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v27 = v20;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = *(void **)(a1 + 48);
            uint64_t v29 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138544130;
            id v44 = v28;
            __int16 v45 = 2114;
            id v46 = v4;
            __int16 v47 = 1024;
            LODWORD(v48[0]) = v2;
            WORD2(v48[0]) = 2114;
            *(void *)((char *)v48 + 6) = v29;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Going to start download for resource %{public}@ with taskIdentifier %{public}@, highPriority %d, %{public}@", buf, 0x26u);
          }
        }
        uint64_t v30 = *(void *)(a1 + 64);
        uint64_t v31 = *(void *)(a1 + 32);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_323;
        v35[3] = &unk_1E5864A90;
        uint64_t v32 = *(void *)(a1 + 48);
        v35[4] = *(void *)(a1 + 40);
        id v36 = v4;
        id v37 = *(id *)(a1 + 48);
        id v38 = v13;
        char v42 = v2;
        id v33 = *(id *)(a1 + 80);
        uint64_t v34 = *(void *)(a1 + 104);
        id v40 = v33;
        uint64_t v41 = v34;
        id v39 = *(id *)(a1 + 72);
        [v3 beginDownloadForResource:v32 clientBundleID:v30 options:v31 proposedTaskIdentifier:v36 completionHandler:v35];
      }
    }
    else
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v9 == 2)
        {
          uint64_t v10 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v9 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v10 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v21 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", buf, 2u);
        }
      }
      uint64_t v22 = *(void *)(a1 + 80);
      uint64_t v23 = *(void *)(a1 + 104);
      id v4 = +[PLCloudPhotoLibraryError createErrorWithType:15];
      (*(void (**)(uint64_t, void, uint64_t, id))(v22 + 16))(v22, 0, v23, v4);
      uint64_t v3 = 0;
    }
  }
}

void __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_323(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setPendingTaskWithTransferTask:v3 withTaskIdentifier:*(void *)(a1 + 40)];
    if (*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = 0;
      goto LABEL_22;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v9 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Start download for resource %@ with task: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v6 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = +[PLCloudPhotoLibraryError createErrorWithType:2];
  [*(id *)(*(void *)(a1 + 32) + 136) reportCompletionForResourceIdentifier:*(void *)(a1 + 56) highPriority:*(unsigned __int8 *)(a1 + 88) withError:v6];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v7 == 2)
    {
      uint64_t v8 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v7 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v8 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to start download for resource %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_21:
  }
LABEL_22:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  [*(id *)(a1 + 64) stillAlive];
}

- (void)downloadResource:(id)a3 highPriority:(BOOL)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v13 = a4;
  uint64_t v16 = (objc_class *)MEMORY[0x1E4F59958];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = (id)[[v16 alloc] initWithHighPriority:v13];
  [(PLCloudPhotoLibraryManager *)self downloadResource:v22 options:v23 clientBundleID:v21 proposedTaskIdentifier:v20 taskDidBeginHandler:v19 progressBlock:v18 completionHandler:v17];
}

- (id)_identifierForResource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 itemScopedIdentifier];
  uint64_t v5 = NSString;
  uint64_t v6 = [v4 descriptionWithNoScopeIndex];
  uint64_t v7 = [v3 resourceType];

  uint64_t v8 = [v5 stringWithFormat:@"%@_%lu", v6, v7];

  return v8;
}

- (void)getStreamingURLForAsset:(id)a3 resourceType:(unint64_t)a4 intent:(unint64_t)a5 hints:(id)a6 timeRange:(id *)a7 clientBundleID:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager getStreamingURLForAsset:resourceType:intent:hints:timeRange:clientBundleID:completionHandler:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  long long v20 = *(_OWORD *)&a7->var0.var3;
  long long v33 = *(_OWORD *)&a7->var0.var0;
  long long v34 = v20;
  void v25[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v25[3] = &unk_1E5864A28;
  id v26 = v16;
  id v27 = v15;
  unint64_t v31 = a4;
  unint64_t v32 = a5;
  long long v35 = *(_OWORD *)&a7->var1.var1;
  id v28 = self;
  id v29 = v17;
  id v30 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v19 block:v25];
}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5864A00;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  long long v15 = *(_OWORD *)(a1 + 72);
  id v11 = *(id *)(a1 + 32);
  id v12 = v2;
  long long v6 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 88);
  long long v17 = v6;
  long long v18 = *(_OWORD *)(a1 + 120);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v2;
  [v3 performBlock:v8 withPriority:1];
}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "rm_cplResourceForResourceType:", *(void *)(a1 + 80));
  id v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 96);
    if (v4 == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v4 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    long long v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) cloudAssetGUID];
      uint64_t v8 = *(void *)(a1 + 80);
      uint64_t v9 = *(void *)(a1 + 88);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138413314;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v2;
      *(_WORD *)id v29 = 2048;
      *(void *)&v29[2] = v9;
      *(_WORD *)&v29[10] = 2112;
      *(void *)&v29[12] = v10;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Going to get streaming URL for asset %@ type %lu CPLResource %@ intent %lu hints %@", buf, 0x34u);
    }
  }
  if (v2)
  {
    uint64_t v11 = [*(id *)(a1 + 40) cplLibrary];
    if (v11)
    {
      id v12 = (void *)v11;
      uint64_t v13 = *(void *)(a1 + 88);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 64);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_307;
      v26[3] = &unk_1E58649D8;
      v26[4] = *(void *)(a1 + 40);
      id v27 = *(id *)(a1 + 72);
      long long v16 = *(_OWORD *)(a1 + 112);
      *(_OWORD *)long long buf = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&uint8_t buf[16] = v16;
      *(_OWORD *)id v29 = *(_OWORD *)(a1 + 128);
      [v12 getStreamingURLOrMediaMakerDataForResource:v2 intent:v13 hints:v14 timeRange:buf clientBundleID:v15 completionHandler:v26];
    }
    else
    {
      if (!*v3)
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 96);
        if (v20 == 2)
        {
          id v21 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v20 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v21 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v23 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled, unable to fetch publicURL", buf, 2u);
        }
      }
      uint64_t v24 = *(void *)(a1 + 72);
      id v25 = +[PLCloudPhotoLibraryError createErrorWithType:15];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v24 + 16))(v24, 0, 0, 0, 0, v25);

      id v12 = 0;
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) isPhoto]) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 4;
    }
    id v12 = +[PLCloudPhotoLibraryError createErrorWithType:v17];
    if (!*v3)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 96);
      if (v18 == 2)
      {
        id v19 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v18 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v19 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v22 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_307(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v16 == 2)
    {
      uint64_t v17 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v16 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v17 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v18 = v17;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138413058;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Got streaming URL %@/media item maker data %@, expiration %@, error %@", (uint8_t *)&v19, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchResourcesForAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager fetchResourcesForAsset:completionHandler:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E5874868;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v8 block:v11];
}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5874868;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 48);
  [v2 performBlock:v5];
}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_2(id *a1)
{
  id v2 = [a1[4] cplLibrary];
  if (v2)
  {
    id v3 = [a1[5] scopedIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_3;
    v9[3] = &unk_1E58649B0;
    id v10 = a1[6];
    [v2 getCloudCacheForRecordWithScopedIdentifier:v3 completionHandler:v9];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *((void *)a1[4] + 12);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int8x16_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", (uint8_t *)&v8, 2u);
      }
    }
    id v7 = (void (**)(id, void, void *))a1[6];
    id v3 = +[PLCloudPhotoLibraryError createErrorWithType:15];
    v7[2](v7, 0, v3);
  }
}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = *(void *)(a1 + 32);
    if (isKindOfClass)
    {
      id v7 = [v8 resources];
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    }
  }
}

- (void)fetchAdjustmentDataForAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager fetchAdjustmentDataForAsset:completionHandler:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E5874868;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v8 block:v11];
}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5874868;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 48);
  [v2 performBlock:v5];
}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_2(id *a1)
{
  id v2 = [a1[4] cplLibrary];
  if (v2)
  {
    id v3 = [a1[5] scopedIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_3;
    v9[3] = &unk_1E58649B0;
    id v10 = a1[6];
    [v2 getCloudCacheForRecordWithScopedIdentifier:v3 completionHandler:v9];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *((void *)a1[4] + 12);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int8x16_t v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", (uint8_t *)&v8, 2u);
      }
    }
    id v7 = (void (**)(id, void, void *))a1[6];
    id v3 = +[PLCloudPhotoLibraryError createErrorWithType:15];
    v7[2](v7, 0, v3);
  }
}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int8x16_t v6 = [v7 adjustments];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
LABEL_7:
}

- (BOOL)isResourceTransferTaskAliveWithTaskWithIdentifier:(id)a3
{
  id v3 = [(PLCloudTaskManager *)self->_taskManager getPendingTaskForTaskIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)cancelResourceTransferTaskWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)sync
{
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager sync]"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PLCloudPhotoLibraryManager_sync__block_invoke;
  v4[3] = &unk_1E5875CE0;
  v4[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v3 block:v4];
}

void __34__PLCloudPhotoLibraryManager_sync__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _canExternallyTransitionToNewLibraryStateIgnoringPause:0])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v2 == 2)
      {
        id v3 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v2 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v3 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int8x16_t v6 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Going to pull changes from CPL", (uint8_t *)&v9, 2u);
      }
    }
    [*(id *)(a1 + 32) _transitionToState:5];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 91) = 1;
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        uint64_t v5 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v4 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v5 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Deferring sync because state is %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)saveRulesTrackerToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  int8x16_t v6 = [v5 databaseContext];
  id v10 = (id)[v6 newShortLivedLibraryForHistoryPersistenceReadingWithName:"-[PLCloudPhotoLibraryManager saveRulesTrackerToken:]"];

  id v7 = [PLGlobalValues alloc];
  __int16 v8 = [v10 managedObjectContext];
  int v9 = [(PLGlobalValues *)v7 initWithManagedObjectContext:v8];

  [(PLGlobalValues *)v9 setLibraryScopeRulesTrackerLastKnownToken:v4];
}

- (id)readRulesTrackerToken
{
  uint64_t v2 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v3 = [v2 databaseContext];
  id v4 = (void *)[v3 newShortLivedLibraryForHistoryPersistenceReadingWithName:"-[PLCloudPhotoLibraryManager readRulesTrackerToken]"];

  uint64_t v5 = [PLGlobalValues alloc];
  int8x16_t v6 = [v4 managedObjectContext];
  id v7 = [(PLGlobalValues *)v5 initWithManagedObjectContext:v6];

  __int16 v8 = [(PLGlobalValues *)v7 libraryScopeRulesTrackerLastKnownToken];

  return v8;
}

- (void)cloudChangeTrackerDidReceiveChangesWithTransaction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PLCloudPhotoLibraryManager_cloudChangeTrackerDidReceiveChangesWithTransaction___block_invoke;
  v3[3] = &unk_1E5875CE0;
  v3[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:a3 block:v3];
}

uint64_t __81__PLCloudPhotoLibraryManager_cloudChangeTrackerDidReceiveChangesWithTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canExternallyTransitionToNewLibraryStateIgnoringPause:0];
  if (result)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int8x16_t v6 = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from NOTIFICATION", v6, 2u);
      }
    }
    return [*(id *)(a1 + 32) _transitionToState:3];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 90) = 1;
  }
  return result;
}

- (void)saveCloudTrackerToken:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PLGlobalValues alloc] initWithManagedObjectContext:v5];

  [(PLGlobalValues *)v7 setCloudTrackerLastKnownToken:v6];
}

- (id)readCloudTrackerToken
{
  if (self->_wasRebuild)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    id v4 = [v3 databaseContext];
    id v5 = (void *)[v4 newShortLivedLibraryForHistoryPersistenceReadingWithName:"-[PLCloudPhotoLibraryManager readCloudTrackerToken]"];

    id v6 = [PLGlobalValues alloc];
    id v7 = [v5 managedObjectContext];
    __int16 v8 = [(PLGlobalValues *)v6 initWithManagedObjectContext:v7];

    uint64_t v2 = [(PLGlobalValues *)v8 cloudTrackerLastKnownToken];
  }
  return v2;
}

- (BOOL)_connectToCloudChangeTrackerWithContext:(id)a3
{
  return [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker connectWithContext:a3];
}

- (void)_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "saveLastKnownCloudChangeTrackerTokenToDisk", v8, 2u);
    }
  }
  [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker saveLastKnownChangeTrackerTokenToDiskWithContext:v4];
}

- (void)_callPushAllChangesCompletionHandlersIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_pushingAllChanges)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: complete, calling completion handlers", buf, 2u);
      }
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_pushAllChangesCompletionHandlers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_pushAllChangesCompletionHandlers removeAllObjects];
    self->_pushingAllChanges = 0;
  }
}

- (void)_setupPLCPLPlistInLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Setting up PLCPLPlist", buf, 2u);
    }
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v10 = *MEMORY[0x1E4F8BB00];
  long long v11 = [(PLCloudPhotoLibraryManager *)self pathManager];
  long long v12 = [v9 readCPLPlistObjectWithKey:v10 pathManager:v11];

  self->_wasRebuild = 0;
  long long v13 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  long long v14 = [v13 libraryBundle];
  id v15 = [v14 persistentContainer];
  uint64_t v16 = [v15 sharedPersistentStoreCoordinator];

  uint64_t v17 = [v16 persistentStores];
  uint64_t v18 = [v17 firstObject];
  int v19 = [v18 metadata];
  id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];

  if (v12)
  {
    char v21 = [v12 isEqualToString:v20];
    self->_wasRebuild = v21 ^ 1;
    if (v21)
    {
      id v22 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      __int16 v23 = [v22 libraryBundle];
      id v24 = [v23 indicatorFileCoordinator];

      int v25 = [v24 isForceSoftResetSync];
      if (v25)
      {
        if (!*v5)
        {
          int64_t v26 = self->_libraryMode;
          if (v26 == 2)
          {
            uint64_t v27 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v26 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v27 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v36 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v46 = 0;
            _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Force soft reset sync filemarker detected, will reset and upload Cloud Photo Library", v46, 2u);
          }
        }
        [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected a reset sync marker"];
        [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v4];
      }
    }
    else
    {
      if (!*v5)
      {
        int64_t v30 = self->_libraryMode;
        if (v30 == 2)
        {
          unint64_t v31 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v30 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          unint64_t v31 = __CPLSystemLibraryOSLogDomain();
          }
        }
        long long v33 = v31;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v47 = 0;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Rebuild was detected, will reset and upload Cloud Photo Library", v47, 2u);
        }
      }
      [MEMORY[0x1E4F59938] registerLikelyResetReason:@"assetsd detected a Photo Library rebuild"];
      long long v34 = [(PLCloudPhotoLibraryManager *)self pathManager];
      BOOL v35 = +[PLRebuildJournalManager isEnabledWithPathManager:v34 error:0];

      if (v35)
      {
        int v25 = 1;
        [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v4];
      }
      else
      {
        [(PLCloudPhotoLibraryManager *)self _doResetSync:2 inLibrary:v4];
        int v25 = 1;
      }
    }
  }
  else
  {
    if (!*v5)
    {
      int64_t v28 = self->_libraryMode;
      if (v28 == 2)
      {
        id v29 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v28 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v29 = __CPLSystemLibraryOSLogDomain();
        }
      }
      unint64_t v32 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v45 = 0;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Force soft reset sync due to missing previous store UUID", v45, 2u);
      }
    }
    [MEMORY[0x1E4F59938] registerLikelyResetReason:@"missing previous store UUID"];
    int v25 = 1;
    [(PLCloudPhotoLibraryManager *)self _doResetSync:1 inLibrary:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v38 = [WeakRetained cplSettings];

  if (v25 && [v38 runOnceFlagIsSet:4])
  {
    if (!*v5)
    {
      int64_t v39 = self->_libraryMode;
      if (v39 == 2)
      {
        id v40 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v39 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v40 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v41 = v40;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v44 = 0;
        _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Clearing shouldMarkPurgeableResourcesOnce due to reset sync", v44, 2u);
      }
    }
    [v38 setRunOnceFlag:4 error:0];
  }
  if (([v20 isEqualToString:v12] & 1) == 0)
  {
    char v42 = (void *)MEMORY[0x1E4F8B890];
    int64_t v43 = [(PLCloudPhotoLibraryManager *)self pathManager];
    [v42 saveCPLPlistObject:v20 forKey:v10 pathManager:v43];
  }
}

- (void)_checkEnableState
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Checking enable state, clearing cached primaryAppleAccount", (uint8_t *)&v35, 2u);
    }
  }
  uint64_t v7 = +[PLAccountStore pl_sharedAccountStore];
  [v7 clearCachedProperties];

  if (![(PLCloudPhotoLibraryManager *)self _disableiCPLAfterZoneWipedInCloudIfNecessary])
  {
    uint64_t v8 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v9 = [v8 libraryBundle];
    uint64_t v10 = [v9 indicatorFileCoordinator];

    if ([v10 isDisableICloudPhotos])
    {
      if (!*v3)
      {
        int64_t v11 = self->_libraryMode;
        if (v11 == 2)
        {
          long long v12 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v11 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v12 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v17 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "CloudPhotos was switched OFF, will reset and stop Cloud Photo Library", (uint8_t *)&v35, 2u);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      int v19 = [WeakRetained cplSettings];
      [v19 setICPLEnabled:0 error:0];

      id v20 = self;
      uint64_t v21 = 2;
LABEL_53:
      [(PLCloudPhotoLibraryManager *)v20 _disableiCPLWillBecomeNonSyncablePhotoLibrary:0 resetMode:v21];
      goto LABEL_66;
    }
    if (self->_pendingDeviceLibraryConfiguration != self->_deviceLibraryConfiguration)
    {
      if (!*v3)
      {
        int64_t v15 = self->_libraryMode;
        if (v15 == 2)
        {
          uint64_t v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v24 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
          if (deviceLibraryConfiguration > 2) {
            int64_t v26 = @"unknown";
          }
          else {
            int64_t v26 = off_1E586C1D0[deviceLibraryConfiguration];
          }
          uint64_t v27 = v26;
          int v35 = 138412290;
          id v36 = v27;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Handle device-library configuration change on check enable to %@", (uint8_t *)&v35, 0xCu);
        }
      }
      id v20 = self;
      uint64_t v21 = 3;
      goto LABEL_53;
    }
    if (![(PLCloudPhotoLibraryManager *)self isCloudPhotoLibraryEnabled]
      && ![v10 isEnableICloudPhotos])
    {
      [(PLCloudPhotoLibraryManager *)self _transitionToState:6];
LABEL_66:

      return;
    }
    if ([v10 isEnableICloudPhotos])
    {
      if (!*v3)
      {
        int64_t v13 = self->_libraryMode;
        if (v13 == 2)
        {
          long long v14 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v13 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          long long v14 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int64_t v28 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "CloudPhotos was switched ON, enabling iCPL after opening CPL", (uint8_t *)&v35, 2u);
        }
      }
      id v29 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      int64_t v30 = [v29 databaseContext];
      unint64_t v31 = [v30 newShortLivedLibraryForHistoryPersistenceReadingWithName:"CPL library: Global Values"];

      unint64_t v32 = [v31 globalValues];
      [v32 setLastInitialDuplicateDetectorProcessingCompletedToken:0];

      id v33 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      long long v34 = [v33 cplSettings];
      [v34 setICPLEnabled:1 error:0];
    }
    else
    {
      if (*v3)
      {
LABEL_65:
        [(PLCloudPhotoLibraryManager *)self _enableiCPL];
        goto LABEL_66;
      }
      int64_t v22 = self->_libraryMode;
      if (v22 == 2)
      {
        __int16 v23 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v22 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        __int16 v23 = __CPLSystemLibraryOSLogDomain();
        }
      }
      unint64_t v31 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Enabling iCPL after opening CPL", (uint8_t *)&v35, 2u);
      }
    }

    goto LABEL_65;
  }
}

- (BOOL)_disableiCPLAfterZoneWipedInCloudIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v4 = [v3 cloudPhotoLibraryManager];
  id v5 = [v4 cplStatus];

  if ([v5 iCloudLibraryHasBeenWiped] && self->_libraryMode == 2)
  {
    id v6 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    [v6 setICloudPhotosEnabledInternal:0];

    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
        long long v12 = [WeakRetained mainScopeIdentifier];
        int v14 = 138543362;
        int64_t v15 = v12;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Disabling sync, because zone has been wiped for library with main scope identifier: %{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _disableiCPLWillBecomeNonSyncablePhotoLibrary:0 resetMode:2];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 isCloudPhotoLibraryEnabled];
  }
  else
  {
    id v6 = [(PLCloudPhotoLibraryManager *)self pathManager];
    uint64_t v7 = [v6 libraryURL];
    char v5 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v7);
  }
  return v5;
}

- (void)_checkIfSharedLibraryDedupeIsDisabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  if (_checkIfSharedLibraryDedupeIsDisabled_onceToken != -1) {
    dispatch_once(&_checkIfSharedLibraryDedupeIsDisabled_onceToken, block);
  }
}

void __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v3 = [v2 databaseContext];
  id v4 = (void *)[v3 newShortLivedLibraryForHistoryPersistenceReadingWithName:"-[PLCloudPhotoLibraryManager _checkIfSharedLibraryDedupeIsDisabled]_block_invoke"];

  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke_2;
    v7[3] = &unk_1E5875E18;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    [v5 performBlockAndWait:v7];
  }
}

void __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) cplConfiguration];
  +[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:v1 cplConfiguration:v2];
}

- (void)_processNextTransaction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _processNextTransaction]"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke;
  v5[3] = &unk_1E5875E18;
  void v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v4 block:v5];
}

void __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 92) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  switch(*(void *)(v2 + 80))
  {
    case 0:
    case 2:
    case 9:
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v3 = *(void *)(v2 + 96);
        if (v3 == 2)
        {
          id v4 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v3 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v4 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v7 = (uint64_t)v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          int64_t v22 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v56 = v22;
          _os_log_impl(&dword_19B3C7000, (os_log_t)v7, OS_LOG_TYPE_ERROR, "Unsupported state for processing: %@", buf, 0xCu);
        }
        goto LABEL_38;
      }
      return;
    case 1:
      [(id)v2 _openCPLLibrary];
      return;
    case 3:
      id v5 = [(id)v2 libraryServicesManager];
      id v6 = [v5 databaseContext];
      uint64_t v7 = [v6 newShortLivedLibraryWithName:"CPL library: _processNextTransaction.FetchNewEventsFromChangeHub"];

      if (v7)
      {
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke_2;
        v52[3] = &unk_1E5875E18;
        id v8 = (id)v7;
        uint64_t v9 = *(void *)(a1 + 32);
        id v53 = v8;
        uint64_t v54 = v9;
        [v8 performBlockAndWait:v52];
      }
      goto LABEL_38;
    case 4:
      uint64_t v10 = [(id)v2 libraryServicesManager];
      int64_t v11 = [v10 databaseContext];
      id v51 = (id)[v11 newShortLivedCplLibraryWithNameSuffix:"_processNextTransaction.UploadingBatch"];

      [*(id *)(a1 + 32) _processUploadBatchInLibrary:v51];
      goto LABEL_14;
    case 5:
      long long v12 = [(id)v2 libraryServicesManager];
      int64_t v13 = [v12 databaseContext];
      id v51 = (id)[v13 newShortLivedCplLibraryWithNameSuffix:"_processNextTransaction.DownloadingBatch"];

      [*(id *)(a1 + 32) _downloadFromCloudInLibrary:v51];
LABEL_14:

      return;
    case 6:
      int v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = *(void *)(v2 + 96);
        if (v15 == 2)
        {
          uint64_t v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        __int16 v23 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Cloud photo manager now idle", buf, 2u);
        }
      }
      +[PLFileDescriptorFuse checkFileDescriptorFuse];
      uint64_t v24 = *(void *)(a1 + 32);
      if (*(_DWORD *)(v24 + 128) == 1)
      {
        if (*(unsigned char *)(v24 + 304) && *(unsigned char *)(v24 + 90))
        {
          if (!*v14)
          {
            uint64_t v25 = *(void *)(v24 + 96);
            if (v25 == 2)
            {
              int64_t v26 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v25 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              int64_t v26 = __CPLSystemLibraryOSLogDomain();
              }
            }
            char v42 = v26;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              int v43 = *(__int16 *)(*(void *)(a1 + 32) + 132);
              *(_DWORD *)long long buf = 67109120;
              LODWORD(v56) = v43;
              _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEBUG, "Pause (%d) request detected, but pushing all changes, will pause when push is complete", buf, 8u);
            }

            uint64_t v24 = *(void *)(a1 + 32);
          }
          *(unsigned char *)(v24 + 90) = 0;
          goto LABEL_98;
        }
        [(id)v24 _callPushAllChangesCompletionHandlersIfNecessary];
        if (!*v14)
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v29 == 2)
          {
            int64_t v30 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v29 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            int64_t v30 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v40 = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            int v41 = *(__int16 *)(*(void *)(a1 + 32) + 132);
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v56) = v41;
            _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEBUG, "Pause (%d) request detected, will now pause", buf, 8u);
          }
        }
        *(_DWORD *)(*(void *)(a1 + 32) + 128) = 0;
        [*(id *)(a1 + 32) _doPause];
      }
      else if (*(unsigned char *)(v24 + 88))
      {
        *(unsigned char *)(v24 + 88) = 0;
        if (!*v14)
        {
          uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 96);
          if (v27 == 2)
          {
            int64_t v28 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v27 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            int64_t v28 = __CPLSystemLibraryOSLogDomain();
            }
          }
          int64_t v39 = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Checking enable state at idle", buf, 2u);
          }
        }
        [*(id *)(a1 + 32) _checkEnableState];
      }
      else
      {
        char v35 = [*(id *)(v24 + 8) initialUpload];
        id v36 = *(unsigned char **)(a1 + 32);
        if ((v35 & 1) != 0 || v36[90])
        {
          v36[90] = 0;
LABEL_98:
          id v44 = *(void **)(a1 + 32);
          uint64_t v45 = 3;
LABEL_99:
          [v44 _transitionToState:v45];
          goto LABEL_100;
        }
        if (v36[91])
        {
          v36[91] = 0;
          id v44 = *(void **)(a1 + 32);
          uint64_t v45 = 5;
          goto LABEL_99;
        }
        v36[93] = 1;
        PFSharedFigDecodeSessionDiscardCachedBuffers();
        [*(id *)(*(void *)(a1 + 32) + 192) update];
        [*(id *)(a1 + 32) _processRulesEvaluationIfNeeded];
        [*(id *)(a1 + 32) _updatePendingResetSyncDate];
        [*(id *)(a1 + 32) _callPushAllChangesCompletionHandlersIfNecessary];
        uint64_t v50 = *(void **)(a1 + 32);
        if (v50[53])
        {
          [v50 _unshareBatchOfPendingAssetsSharedToScopeWithTransaction:*(void *)(a1 + 40)];
          uint64_t v50 = *(void **)(a1 + 32);
        }
        [v50 _checkIfSharedLibraryDedupeIsDisabled];
      }
LABEL_100:
      if (PLIsEDUMode())
      {
        id v46 = *(void **)(a1 + 32);
        if (!v46[12])
        {
          uint64_t v7 = [v46 _idleStateTransitionOneTimeAction];
          if (v7)
          {
            if ([*(id *)(a1 + 32) _hasIncomingWorkFileMarker])
            {
              [*(id *)(a1 + 32) _startWorkInProgressTimer];
            }
            else
            {
              if (!*v14)
              {
                uint64_t v47 = *(void *)(*(void *)(a1 + 32) + 96);
                if (v47 == 2)
                {
                  __int16 v48 = __CPLAppLibraryOSLogDomain();
                }
                else
                {
                  if (v47 == 1) {
                    __CPLSyndicationOSLogDomain();
                  }
                  else {
                  __int16 v48 = __CPLSystemLibraryOSLogDomain();
                  }
                }
                __int16 v49 = v48;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Will run idleStateTransitionOneTimeAction", buf, 2u);
                }
              }
              [*(id *)(a1 + 32) _setIdleStateTransitionOneTimeAction:0];
              (*(void (**)(uint64_t))(v7 + 16))(v7);
            }
          }
LABEL_38:
        }
      }
      return;
    case 7:
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v17 = *(void *)(v2 + 96);
        if (v17 == 2)
        {
          uint64_t v18 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v17 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v18 = __CPLSystemLibraryOSLogDomain();
          }
        }
        unint64_t v31 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Doing soft reset sync", buf, 2u);
        }

        uint64_t v2 = *(void *)(a1 + 32);
      }
      unint64_t v32 = [(id)v2 libraryServicesManager];
      id v33 = [v32 databaseContext];
      long long v34 = (void *)[v33 newShortLivedCplLibraryWithNameSuffix:"_processNextTransaction.ForceResetSync"];

      [*(id *)(a1 + 32) _doResetSync:1 inLibrary:v34];
      [*(id *)(a1 + 32) _transitionToState:3];

      return;
    case 8:
      int v19 = *(_DWORD *)(v2 + 128);
      if (v19)
      {
        if (v19 == 2)
        {
          *(_DWORD *)(v2 + 128) = 0;
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 96);
            if (v20 == 2)
            {
              uint64_t v21 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v20 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v21 = __CPLSystemLibraryOSLogDomain();
              }
            }
            uint64_t v37 = v21;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              int v38 = *(__int16 *)(*(void *)(a1 + 32) + 132);
              *(_DWORD *)long long buf = 67109120;
              LODWORD(v56) = v38;
              _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEBUG, "Unpause (%d) request detected, will now unpause", buf, 8u);
            }
          }
          [*(id *)(a1 + 32) _doUnpause];
        }
        else
        {
          *(_DWORD *)(v2 + 128) = 0;
        }
      }
      return;
    default:
      return;
  }
}

uint64_t __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 setChangeSource:1];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 _fetchNewEventsFromCloudChangeTrackerInLibrary:v4];
}

- (void)_checkAndMarkPurgeableResources:(id)a3 checkIfSafe:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 urgency:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  int64_t v13 = (void (**)(void))a7;
  int v14 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  if (a4 || ![v12 count])
  {
    if (v14 && [v12 count])
    {
      uint64_t v17 = [v12 anyObject];
      uint64_t v18 = [v17 photoLibrary];

      int v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3;
      v29[3] = &unk_1E5868AA8;
      id v20 = v19;
      id v30 = v20;
      [v12 enumerateObjectsUsingBlock:v29];
      uint64_t v21 = [v20 allKeys];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_281;
      v24[3] = &unk_1E5864988;
      void v24[4] = self;
      id v25 = v18;
      id v26 = v20;
      uint64_t v27 = v13;
      int64_t v28 = a6;
      id v22 = v20;
      id v23 = v18;
      [v14 checkResourcesAreSafeToPrune:v21 checkServerIfNecessary:v9 completionHandler:v24];
    }
    else
    {
      v13[2](v13);
    }
  }
  else
  {
    uint64_t v15 = [v12 anyObject];
    uint64_t v16 = [v15 photoLibrary];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke;
    v31[3] = &unk_1E5875E40;
    id v32 = v12;
    id v33 = self;
    int64_t v34 = a6;
    [v16 performTransactionAndWait:v31];
    v13[2](v13);
  }
}

uint64_t __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke(void *a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5864910;
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[6];
  v4[4] = a1[5];
  void v4[5] = v2;
  return [v1 enumerateObjectsUsingBlock:v4];
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 cplResourceIncludeFile:1 createDirectoryIfNeeded:0];
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  else
  {
    id v5 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to get CPLResource for %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2_282;
  v12[3] = &unk_1E5864960;
  void v12[4] = v7;
  id v17 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  id v16 = v8;
  uint64_t v18 = v9;
  id v10 = v6;
  id v11 = v5;
  [v7 _runAsyncOnIsolationQueueWithTransaction:0 block:v12];
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2_282(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 89))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3_283;
    v6[3] = &unk_1E5870A08;
    uint64_t v2 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    id v9 = v3;
    uint64_t v10 = v4;
    uint64_t v11 = *(void *)(a1 + 80);
    [v2 performTransactionAndWait:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v5();
  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3_283(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v15 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "%lu resources safe to purge", buf, 0xCu);
  }

  uint64_t v4 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Unsafe resources to purge: %@", buf, 0xCu);
  }

  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_284;
  v10[3] = &unk_1E5864938;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_284(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v4)
  {
    uint64_t v3 = [*(id *)(a1 + 40) cacheDeleteSupport];
    [v3 markResourceAsPurgeable:v4 withUrgency:*(void *)(a1 + 48)];
  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 cacheDeleteSupport];
    [v5 markResourceAsPurgeable:v4 withUrgency:*(void *)(a1 + 40)];
  }
}

- (void)_markPurgeableNextBatchOfResources:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke;
  v18[3] = &unk_1E5865F30;
  id v19 = v12;
  id v20 = self;
  BOOL v24 = a5;
  id v22 = v14;
  int64_t v23 = a4;
  id v21 = v13;
  id v15 = v13;
  id v16 = v14;
  id v17 = v12;
  [v15 performBlockAndWait:v18];
}

void __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v3 = 100;
  do
  {
    uint64_t v4 = [*(id *)(a1 + 32) nextObject];
    if (!v4) {
      break;
    }
    id v5 = (void *)v4;
    [v2 addObject:v4];

    --v3;
  }
  while (v3);
  if ([v2 count])
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5865F30;
    void v11[4] = v6;
    uint64_t v8 = *(void *)(a1 + 64);
    id v14 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 64);
    id v12 = v9;
    uint64_t v15 = v10;
    char v16 = *(unsigned char *)(a1 + 72);
    id v13 = *(id *)(a1 + 48);
    [v6 _checkAndMarkPurgeableResources:v2 checkIfSafe:v7 checkServerIfNecessary:1 urgency:v8 completionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 89)) {
    return [*(id *)(a1 + 32) _markPurgeableNextBatchOfResources:*(void *)(a1 + 40) urgency:*(void *)(a1 + 64) checkIfSafe:*(unsigned __int8 *)(a1 + 72) inLibrary:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(void))a7;
  uint64_t v15 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager markPurgeableResourcesMatchingPredicate:urgency:checkIfSafe:inLibrary:completionHandler:]"];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  int v38 = __Block_byref_object_copy__12675;
  int64_t v39 = __Block_byref_object_dispose__12676;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__12675;
  id v33 = __Block_byref_object_dispose__12676;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke;
  v24[3] = &unk_1E5874900;
  id v16 = v12;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  uint64_t v27 = &v29;
  int64_t v28 = &v35;
  [v17 performBlockAndWait:v24];
  uint64_t v18 = v36[5];
  if (v18)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_277;
    v21[3] = &unk_1E58742F0;
    int64_t v23 = v14;
    id v22 = v15;
    [(PLCloudPhotoLibraryManager *)self _markPurgeableNextBatchOfResources:v18 urgency:a4 checkIfSafe:v9 inLibrary:v17 completionHandler:v21];
  }
  else
  {
    id v19 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v30[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v42 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch available resources to mark purgeable: %@", buf, 0xCu);
    }

    if (v14) {
      v14[2](v14);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

void __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLInternalResource entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 32)];
  [v4 setFetchBatchSize:100];
  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v6 + 40);
  uint64_t v7 = [v5 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    uint64_t v8 = [v7 objectEnumerator];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

uint64_t __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_277(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 stillAlive];
}

- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5 completionHandler:(id)a6
{
}

- (void)clearPurgeableResourcesMatchingPredicate:(id)a3 inLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = [(PLCloudPhotoLibraryManager *)self pathManager];
  id v12 = [v11 capabilities];
  int v13 = [v12 isCentralizedCacheDeleteCapable];

  if (v13)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke;
    v16[3] = &unk_1E5875E18;
    id v17 = v8;
    id v18 = v9;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_276;
    v14[3] = &unk_1E5875198;
    uint64_t v15 = v10;
    [v18 performTransaction:v16 completionHandler:v14];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

void __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLInternalResource entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  id v16 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v4 error:&v16];
  id v7 = v16;
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_2;
    v15[3] = &unk_1E58716C8;
    void v15[4] = &buf;
    id v8 = [v5 enumerateWithIncrementalSaveUsingObjects:v6 withBlock:v15];

    if (v8)
    {
      id v9 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v17 = 138412290;
        id v18 = v8;
        uint64_t v10 = "Failed to enumerate resources to clear purgeable flag: %@";
        id v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v11, v12, v10, v17, 0xCu);
      }
    }
    else
    {
      id v9 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *(void **)(*((void *)&buf + 1) + 24);
        *(_DWORD *)id v17 = 134217984;
        id v18 = v14;
        uint64_t v10 = "Cleared purgeable flags for %ld original resources";
        id v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_10;
      }
    }

    _Block_object_dispose(&buf, 8);
    goto LABEL_12;
  }
  int v13 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch resources to clear purgeable flag: %@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = v7;
LABEL_12:
}

uint64_t __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_276(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL result = +[PLCacheDeleteSupport clearPurgeableFlagForResource:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (void)_repushAssetsWithImportedByBundleIdentifier
{
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v4 = [v3 databaseContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke;
  v5[3] = &unk_1E5865E90;
  void v5[4] = self;
  [v4 performTransactionSync:v5 withName:"-[PLCloudPhotoLibraryManager _repushAssetsWithImportedByBundleIdentifier]"];
}

void __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  uint64_t v3 = [v28 managedObjectContext];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = +[PLManagedAsset entityName];
  uint64_t v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"additionalAttributes.importedByBundleIdentifier");
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState == %d OR cloudLocalState == %d", 1, 3);
  id v9 = +[PLManagedAsset predicateForSupportedAssetTypesForUpload];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  [v10 addObject:v8];
  [v10 addObject:v9];
  [v10 addObject:v7];
  id v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  [v6 setFetchBatchSize:100];
  id v30 = 0;
  os_log_type_t v12 = [v3 executeFetchRequest:v6 error:&v30];
  id v13 = v30;
  if (v12)
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v34 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke_2;
    v29[3] = &unk_1E5866718;
    void v29[4] = buf;
    id v14 = [v3 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v29];

    if (v14)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          id v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        *(_DWORD *)uint64_t v31 = 138543362;
        id v32 = v14;
        uint64_t v22 = "_repushAssetsWithImportedByBundleIdentifier: save failed with error: %{public}@";
        int64_t v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
LABEL_32:
        _os_log_impl(&dword_19B3C7000, v23, v24, v22, v31, 0xCu);
LABEL_33:
      }
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        uint64_t v20 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v19 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v20 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      uint64_t v27 = *(void **)(*(void *)&buf[8] + 24);
      *(_DWORD *)uint64_t v31 = 134349056;
      id v32 = v27;
      uint64_t v22 = "_repushAssetsWithImportedByBundleIdentifier: set importedByBundleIdentifier on %{public}lu masters";
      int64_t v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      id v18 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v17 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v18 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v25 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v6 predicate];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "_repushAssetsWithImportedByBundleIdentifier: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  id v14 = v13;
LABEL_35:
}

void __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 master];
  uint64_t v4 = [v3 importedByBundleIdentifier];

  [v5 setImportedByBundleIdentifier:v4];
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_repushMasterWithMissingMediaMetadata
{
  id v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v4 = [v3 databaseContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke;
  v5[3] = &unk_1E5865E90;
  void v5[4] = self;
  [v4 performTransactionSync:v5 withName:"-[PLCloudPhotoLibraryManager _repushMasterWithMissingMediaMetadata]"];
}

void __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 managedObjectContext];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v6 = +[PLManagedAsset entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  [v7 setFetchBatchSize:100];
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL && %K == NULL", @"master", @"master.mediaMetadata.data");
  id v9 = +[PLManagedAsset predicateForSupportedAssetTypesForUpload];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  [v10 addObject:v8];
  [v10 addObject:v9];
  id v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v7 setPredicate:v11];

  [v7 setFetchBatchSize:100];
  id v35 = 0;
  os_log_type_t v12 = [v4 executeFetchRequest:v7 error:&v35];
  id v13 = v35;
  if (v12)
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v31 = 0;
    id v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke_2;
    v30[3] = &unk_1E5866C98;
    v30[4] = *(void *)(a1 + 32);
    void v30[5] = buf;
    v30[6] = &v31;
    id v14 = [v4 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v30];

    if (v14)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          id v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        *(_DWORD *)id v36 = 138543362;
        uint64_t v37 = v14;
        uint64_t v22 = "_repushMasterWithMissingMediaMetadata: save failed with error: %{public}@";
        int64_t v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = 12;
LABEL_32:
        _os_log_impl(&dword_19B3C7000, v23, v24, v22, v36, v25);
LABEL_33:
      }
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        uint64_t v20 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v19 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v20 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      id v28 = *(void **)(*(void *)&buf[8] + 24);
      uint64_t v29 = v32[3];
      *(_DWORD *)id v36 = 134349312;
      uint64_t v37 = v28;
      __int16 v38 = 2050;
      uint64_t v39 = v29;
      uint64_t v22 = "_repushMasterWithMissingMediaMetadata: set media metadata on %{public}lu (img) %{public}lu (vid) masters";
      int64_t v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      uint32_t v25 = 22;
      goto LABEL_32;
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      id v18 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v17 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v18 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v26 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v7 predicate];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  id v14 = v13;
LABEL_35:
}

void __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke_2(void *a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 masterResourceForCPLType:1];
  int v5 = [v4 isLocallyAvailable];

  if (v5)
  {
    uint64_t v6 = [v3 master];
    id v7 = [v3 mainFileURL];
    if (v7)
    {
      if ([v3 isPhoto])
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        id v9 = [v7 path];
        id v61 = 0;
        CFDataRef v10 = (const __CFData *)[v8 initWithContentsOfFile:v9 options:1 error:&v61];
        id v11 = v61;

        if (!v10)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v35 = *(void *)(a1[4] + 96);
            if (v35 == 2)
            {
              id v36 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v35 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v36 = __CPLSystemLibraryOSLogDomain();
              }
            }
            __int16 v48 = v36;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543362;
              id v63 = v11;
              _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (img) Reading Error: %{public}@", buf, 0xCu);
            }
          }
          goto LABEL_95;
        }
        os_log_type_t v12 = (void *)MEMORY[0x19F38D3B0]();
        id v13 = CGImageSourceCreateWithData(v10, 0);
        if (!v13)
        {
          if (*MEMORY[0x1E4F59AC0])
          {
LABEL_94:
            goto LABEL_95;
          }
          uint64_t v38 = *(void *)(a1[4] + 96);
          if (v38 == 2)
          {
            uint64_t v39 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v38 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v39 = __CPLSystemLibraryOSLogDomain();
            }
          }
          __int16 v49 = v39;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            uint64_t v50 = [v3 uuid];
            *(_DWORD *)long long buf = 138543362;
            id v63 = v50;
            _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: failed to create CGImage for extracting media metadata %{public}@", buf, 0xCu);
          }
LABEL_93:

          goto LABEL_94;
        }
        id v14 = v13;
        id v58 = v12;
        CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
        id v16 = (void *)MEMORY[0x1E4F28F98];
        uint64_t v57 = v15;
        uint64_t v17 = +[PLPropertyListFilter filterPropertyList:](PLPropertyListFilter, "filterPropertyList:");
        id v60 = 0;
        id v18 = [v16 dataWithPropertyList:v17 format:200 options:0 error:&v60];
        id v19 = v60;

        if (v18)
        {
          unint64_t v20 = [v18 length];
          if (v20 <= [MEMORY[0x1E4F59910] maxInlineDataSize])
          {
            ++*(void *)(*(void *)(a1[5] + 8) + 24);
            id v44 = [v6 mediaMetadata];
            [v44 setValue:v18 forKey:@"data"];

            [v6 setMediaMetadataType:@"CGImageProperties"];
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v21 = *(void *)(a1[4] + 96);
            if (v21 == 2)
            {
              uint64_t v22 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v21 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v22 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v53 = v22;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v54 = [v3 uuid];
              *(_DWORD *)long long buf = 138543362;
              id v63 = v54;
              _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: media metadata (img) for %{public}@ is too large, skipping", buf, 0xCu);
            }
LABEL_91:
          }
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v42 = *(void *)(a1[4] + 96);
          if (v42 == 2)
          {
            uint64_t v43 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v42 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v43 = __CPLSystemLibraryOSLogDomain();
            }
          }
          id v53 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v63 = v19;
            _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (img) Serialization Error: %{public}@", buf, 0xCu);
          }
          goto LABEL_91;
        }
        CFRelease(v14);

        __int16 v49 = v57;
        os_log_type_t v12 = v58;
        goto LABEL_93;
      }
      if ([v3 isVideo])
      {
        uint64_t v25 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v7 options:0];
        if (!v25)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v40 = *(void *)(a1[4] + 96);
            if (v40 == 2)
            {
              uint64_t v41 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v40 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              uint64_t v41 = __CPLSystemLibraryOSLogDomain();
              }
            }
            id v51 = v41;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              long long v52 = [v3 uuid];
              *(_DWORD *)long long buf = 138543362;
              id v63 = v52;
              _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: failed to create AVAsset for extracting media metadata %{public}@", buf, 0xCu);
            }
          }
          id v11 = 0;
          goto LABEL_96;
        }
        id v11 = v25;
        id v26 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v27 = [v11 propertyListForProxy];
        id v59 = 0;
        id v28 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v27 format:200 options:0 error:&v59];
        id v29 = v59;
        if (v28)
        {
          unint64_t v30 = [v28 length];
          if (v30 <= [MEMORY[0x1E4F59910] maxInlineDataSize])
          {
            ++*(void *)(*(void *)(a1[6] + 8) + 24);
            uint64_t v47 = [v6 mediaMetadata];
            [v47 setValue:v28 forKey:@"data"];

            [v6 setMediaMetadataType:@"AVAssetProxy"];
          }
          else if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v31 = *(void *)(a1[4] + 96);
            if (v31 == 2)
            {
              id v32 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (v31 == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v32 = __CPLSystemLibraryOSLogDomain();
              }
            }
            long long v55 = v32;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              uint64_t v56 = [v3 uuid];
              *(_DWORD *)long long buf = 138543362;
              id v63 = v56;
              _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: media metadata (vid) for %{public}@ is too large, skipping", buf, 0xCu);
            }
LABEL_107:
          }
        }
        else if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v45 = *(void *)(a1[4] + 96);
          if (v45 == 2)
          {
            id v46 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v45 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v46 = __CPLSystemLibraryOSLogDomain();
            }
          }
          long long v55 = v46;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v63 = v29;
            _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (vid) Serialization Error: %{public}@", buf, 0xCu);
          }
          goto LABEL_107;
        }

        goto LABEL_96;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v33 = *(void *)(a1[4] + 96);
        if (v33 == 2)
        {
          uint64_t v34 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v33 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v34 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v11 = v34;
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          goto LABEL_96;
        }
        CFDataRef v10 = [v3 uuid];
        *(_DWORD *)long long buf = 138543362;
        id v63 = v10;
        uint64_t v37 = "_repushMasterWithMissingMediaMetadata: unknown asset type %{public}@";
        goto LABEL_60;
      }
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v23 = *(void *)(a1[4] + 96);
      if (v23 == 2)
      {
        os_log_type_t v24 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v23 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        os_log_type_t v24 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v11 = v24;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_96;
      }
      CFDataRef v10 = [v3 uuid];
      *(_DWORD *)long long buf = 138543362;
      id v63 = v10;
      uint64_t v37 = "_repushMasterWithMissingMediaMetadata: nil file url %{public}@";
LABEL_60:
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
LABEL_95:

LABEL_96:
    }
  }
}

- (void)_repushVideoAssetsMetadata
{
  id v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v4 = [v3 databaseContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke;
  v5[3] = &unk_1E5865E90;
  void v5[4] = self;
  [v4 performTransactionSync:v5 withName:"-[PLCloudPhotoLibraryManager _repushVideoAssetsMetadata]"];
}

void __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v3 = [v28 managedObjectContext];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C0D0];
  int v5 = +[PLManagedAsset entityName];
  uint64_t v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState == %d OR cloudLocalState == %d", 1, 3);
  id v9 = +[PLManagedAsset predicateForSupportedAssetTypesForUpload];
  CFDataRef v10 = [MEMORY[0x1E4F1CA48] array];
  [v10 addObject:v8];
  [v10 addObject:v9];
  [v10 addObject:v7];
  id v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  [v6 setFetchBatchSize:100];
  id v30 = 0;
  os_log_type_t v12 = [v3 executeFetchRequest:v6 error:&v30];
  id v13 = v30;
  if (v12)
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v34 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke_2;
    v29[3] = &unk_1E586F878;
    void v29[4] = *(void *)(a1 + 32);
    void v29[5] = buf;
    id v14 = [v3 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v29];

    if (v14)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          id v16 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v15 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v16 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        *(_DWORD *)uint64_t v31 = 138543362;
        id v32 = v14;
        uint64_t v22 = "_repushVideoAssetsMetadata: save failed with error: %{public}@";
        uint64_t v23 = v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
LABEL_32:
        _os_log_impl(&dword_19B3C7000, v23, v24, v22, v31, 0xCu);
LABEL_33:
      }
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        unint64_t v20 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v19 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        unint64_t v20 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      uint64_t v27 = *(void **)(*(void *)&buf[8] + 24);
      *(_DWORD *)uint64_t v31 = 134349056;
      id v32 = v27;
      uint64_t v22 = "_repushVideoAssetsMetadata: set videoFrameRate and codecName on %{public}lu masters";
      uint64_t v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      id v18 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v17 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v18 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v25 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v6 predicate];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "_repushVideoAssetsMetadata: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  id v14 = v13;
LABEL_35:
}

void __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 master];
  int v5 = [v4 mediaMetadata];
  uint64_t v6 = [v5 valueForKey:@"data"];

  if (v6)
  {
    id v18 = 0;
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v18];
    id v8 = v18;
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v7];
      [v3 setVideoInfoOnMasterFromAVAsset:v9];
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else
    {
      if (*MEMORY[0x1E4F59AC0])
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v12 == 2)
      {
        id v13 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v12 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v13 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v9 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v16 = [v4 scopedIdentifier];
        uint64_t v17 = [v16 identifier];
        *(_DWORD *)long long buf = 138543618;
        unint64_t v20 = v17;
        __int16 v21 = 2114;
        uint64_t v22 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "_repushVideoAssetsMetadata: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_23;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v10 == 2)
    {
      id v11 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v10 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v11 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v8 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 scopedIdentifier];
      uint64_t v15 = [v14 identifier];
      *(_DWORD *)long long buf = 138543362;
      unint64_t v20 = v15;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "_repushVideoAssetsMetadata: unable to find mediaPropertiesData for %{public}@", buf, 0xCu);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (void)_handleOptimizeSettingChangeInLibrary:(id)a3 withCompletionHandler:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v9 = [WeakRetained cplSettings];
  int v10 = [v9 isKeepOriginalsEnabled];

  id v11 = PLResourceCachingGetLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Switching mode to download and keep originals, updating purgeable flags", buf, 2u);
    }

    id v13 = +[PLInternalResource predicateForPurgeableOriginalResources];
    id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"fileID != %lld", -1);
    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v29[0] = v13;
    v29[1] = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v17 = [v15 andPredicateWithSubpredicates:v16];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke;
    v25[3] = &unk_1E58742F0;
    id v18 = &v26;
    void v25[4] = self;
    id v26 = v6;
    id v19 = v6;
    [(PLCloudPhotoLibraryManager *)self clearPurgeableResourcesMatchingPredicate:v17 inLibrary:v7 completionHandler:v25];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Switching mode to optimize, updating purgeable flags", buf, 2u);
    }

    id v13 = +[PLInternalResource predicateForAvailableResources];
    id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"fileID == %lld", -1);
    unint64_t v20 = (void *)MEMORY[0x1E4F28BA0];
    v28[0] = v13;
    v28[1] = v14;
    __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    uint64_t v17 = [v20 andPredicateWithSubpredicates:v21];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke_235;
    v23[3] = &unk_1E58742F0;
    id v18 = &v24;
    v23[4] = self;
    id v24 = v6;
    id v22 = v6;
    [(PLCloudPhotoLibraryManager *)self markPurgeableResourcesMatchingPredicate:v17 urgency:0 inLibrary:v7 completionHandler:v23];
  }
}

uint64_t __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceManager];
  [v2 handleOptimizeModeChange];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke_235(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resourceManager];
  [v2 handleOptimizeModeChange];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_handleOptimizeSettingChange
{
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _handleOptimizeSettingChange]"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  int v5 = [WeakRetained cplSettings];

  [v5 setRunOnceFlag:2 error:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke;
  v8[3] = &unk_1E5873A50;
  void v8[4] = self;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v6 block:v8];
}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[89])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_2;
    v5[3] = &unk_1E5873A50;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = v3;
    uint64_t v7 = v4;
    id v8 = *(id *)(a1 + 48);
    [v1 _reportOptimizeSettingChangeWithCompletionHandler:v5];
  }
}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_2(id *a1)
{
  [a1[4] clearRunOnceFlag:2 error:0];
  uint64_t v2 = [a1[5] libraryServicesManager];
  id v3 = [v2 databaseContext];
  uint64_t v4 = (void *)[v3 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager _handleOptimizeSettingChange]_block_invoke_2"];

  int v5 = a1[5];
  uint64_t v6 = v5[55] + 1;
  v5[55] = v6;
  id v7 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_3;
  v8[3] = &unk_1E58735D8;
  void v8[4] = v7;
  id v9 = a1[6];
  uint64_t v11 = v6;
  id v10 = a1[4];
  [v7 _handleOptimizeSettingChangeInLibrary:v4 withCompletionHandler:v8];
}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_3(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_4;
  v4[3] = &unk_1E5875E40;
  id v3 = (void *)a1[6];
  uint64_t v6 = a1[7];
  v4[4] = v1;
  id v5 = v3;
  [v1 _runAsyncOnIsolationQueueWithTransaction:v2 block:v4];
}

uint64_t __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 440)) {
    return [*(id *)(result + 40) clearRunOnceFlag:1 error:0];
  }
  return result;
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v8 = [WeakRetained cplSettings];

  if ([v8 prefetchMode] == a3) {
    goto LABEL_5;
  }
  if (![v8 setRunOnceFlag:1 error:a4])
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (([v8 setPrefetchMode:a3 error:a4] & 1) == 0)
  {
    [v8 clearRunOnceFlag:1 error:0];
    goto LABEL_7;
  }
  [(PLCloudPhotoLibraryManager *)self _handleOptimizeSettingChange];
LABEL_5:
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void)_reportOptimizeSettingChangeWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  uint64_t v6 = [WeakRetained cplSettings];
  uint64_t v7 = [v6 prefetchMode];

  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      BOOL v9 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      BOOL v9 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"Optimize";
      if (v7 == 1) {
        uint64_t v11 = @"Keep Originals";
      }
      int v15 = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Reporting optimized setting %@ to feedback", (uint8_t *)&v15, 0xCu);
    }
  }
  BOOL v12 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  id v13 = v12;
  if (v7 == 1) {
    id v14 = @"false";
  }
  else {
    id v14 = @"true";
  }
  [v12 reportSetting:*MEMORY[0x1E4F597A0] hasBeenSetToValue:v14];

  if (v4) {
    v4[2](v4);
  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager reportMiscInformation:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __52__PLCloudPhotoLibraryManager_reportMiscInformation___block_invoke;
  v7[3] = &unk_1E5875E18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v5 block:v7];
}

void __52__PLCloudPhotoLibraryManager_reportMiscInformation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      id v3 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v2 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v3 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Reporting info %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = [*(id *)(a1 + 32) cplLibrary];
  [v6 reportMiscInformation:*(void *)(a1 + 40)];
}

- (void)_updatePendingResetSyncDate
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int64_t pendingResetSyncType = self->_pendingResetSyncType;
  if (!pendingResetSyncType || self->_hasSettledInitialBatch)
  {
    self->_int64_t pendingResetSyncType = 0;
    id v4 = [(PLCloudPhotoLibraryManager *)self pathManager];
    uint64_t v5 = [v4 cplDataDirectoryCreateIfNeeded:0];

    id v6 = [(PLCloudPhotoLibraryManager *)self pathManager];
    int v7 = PLCloudPhotoLibraryLocalModeEnabled(v6);

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      id v10 = [v8 fakeCPLStatusBaseURLWithBaseURL:v9];
      uint64_t v11 = [v10 absoluteString];

      uint64_t v5 = (void *)v11;
    }
    BOOL v12 = [v5 stringByAppendingPathComponent:@"resetevents.plist"];
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12];

    if (!v14)
    {
LABEL_23:
      int64_t v22 = self->_pendingResetSyncType;
      if (pendingResetSyncType)
      {
        if (!v22)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            int64_t libraryMode = self->_libraryMode;
            if (libraryMode == 2)
            {
              id v24 = __CPLAppLibraryOSLogDomain();
            }
            else
            {
              if (libraryMode == 1) {
                __CPLSyndicationOSLogDomain();
              }
              else {
              id v24 = __CPLSystemLibraryOSLogDomain();
              }
            }
            uint64_t v25 = v24;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = [MEMORY[0x1E4F1C9C8] date];
              int v30 = 138412290;
              uint64_t v31 = v26;
              _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Finished reset sync at %@, triggering prefetching/pruning", (uint8_t *)&v30, 0xCu);
            }
          }
          uint64_t v27 = [(PLCloudPhotoLibraryManager *)self resourceManager];
          [v27 startAutomaticPrefetchAndPruneWithTimeout:0];

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.ResetSyncStateChanged", 0, 0, 1u);
          int64_t v22 = self->_pendingResetSyncType;
        }
        if (!v22 || pendingResetSyncType == v22) {
          goto LABEL_41;
        }
      }
      else if (!v22)
      {
        goto LABEL_41;
      }
      id v29 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v29, @"com.apple.mobileslideshow.ResetSyncStateChanged", 0, 0, 1u);
LABEL_41:

      return;
    }
    int v15 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v12];
    id v16 = [v15 lastObject];
    uint64_t v17 = v16;
    if (!v16
      || ([v16 objectForKey:@"pending"],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 BOOLValue],
          v18,
          !v19))
    {
LABEL_22:

      goto LABEL_23;
    }
    unint64_t v20 = [v17 objectForKey:@"type"];
    if ([v20 isEqualToString:@"soft"])
    {
      int64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"hard"])
    {
      int64_t v21 = 2;
    }
    else if ([v20 isEqualToString:@"recover"])
    {
      int64_t v21 = 3;
    }
    else if ([v20 isEqualToString:@"anchor"])
    {
      int64_t v21 = 4;
    }
    else if ([v20 isEqualToString:@"globalAnchor"])
    {
      int64_t v21 = 5;
    }
    else
    {
      if (![v20 isEqualToString:@"wipe"])
      {
LABEL_21:

        goto LABEL_22;
      }
      int64_t v21 = 6;
    }
    self->_int64_t pendingResetSyncType = v21;
    goto LABEL_21;
  }
}

- (BOOL)_setupTimerForUnpause
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v4 = [v3 libraryBundle];
  uint64_t v5 = [v4 indicatorFileCoordinator];

  id v6 = [v5 unpauseTime];
  int v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v7 compare:v6];
  if (v8 == -1) {
    [(PLCloudPhotoLibraryManager *)self _constructUnpauseTimerFrom:v7 to:v6];
  }
  else {
    [v5 clearPauseMarkerForReason:3];
  }
  BOOL v9 = v8 == -1;
  id v10 = [NSNumber numberWithBool:v8 == -1];
  CFPreferencesSetAppValue(@"cloudPhotosPaused", v10, @"com.apple.mobileslideshow");

  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  return v9;
}

- (void)_constructUnpauseTimerFrom:(id)a3 to:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  isolationQueue = self->_isolationQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      BOOL v12 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      BOOL v12 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v19 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Will unpaused in %f seconds", buf, 0xCu);
    }
  }
  [(PLCloudPhotoLibraryManager *)self _stopUnpauseTimer];
  uint64_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_isolationQueue);
  pl_dispatch_source_set_event_handler();
  dispatch_time_t v14 = dispatch_walltime(0, 1000000000 * (unint64_t)v10);
  dispatch_source_set_timer(v17, v14, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  unpauseDispatchTimer = self->_unpauseDispatchTimer;
  self->_unpauseDispatchTimer = (OS_dispatch_source *)v17;
  id v16 = v17;

  dispatch_resume((dispatch_object_t)self->_unpauseDispatchTimer);
}

void *__60__PLCloudPhotoLibraryManager__constructUnpauseTimerFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(a1 + 32);
  if (result[20] == *(void *)(a1 + 40))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = result[12];
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(__int16 *)(*(void *)(a1 + 32) + 132);
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Unpause (%d) timer triggered, will unpause Cloud Photo Library", (uint8_t *)v7, 8u);
      }

      uint64_t result = *(void **)(a1 + 32);
    }
    return (void *)[result setPause:0 reason:*(__int16 *)(a1 + 48)];
  }
  return result;
}

- (id)_calculateUnpauseTimeForPauseTime:(id)a3
{
  if (self->_pauseReason == 3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
    id v4 = a3;
    id v5 = [v3 currentCalendar];
    int v6 = [v5 startOfDayForDate:v4];

    id v7 = [v5 dateByAddingUnit:16 value:1 toDate:v6 options:0];
    uint64_t v8 = [v5 dateByAddingUnit:32 value:3 toDate:v7 options:0];
  }
  else
  {
    id v5 = a3;
    uint64_t v8 = [v5 dateByAddingTimeInterval:1800.0];
  }

  return v8;
}

- (void)_stopUnpauseTimer
{
  unpauseDispatchTimer = self->_unpauseDispatchTimer;
  if (unpauseDispatchTimer)
  {
    dispatch_source_cancel(unpauseDispatchTimer);
    id v4 = self->_unpauseDispatchTimer;
    self->_unpauseDispatchTimer = 0;
  }
}

- (void)_transitionToState:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  unint64_t state = self->_state;
  if (state == 9)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      return;
    }
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v7 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v7 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v15 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    id v16 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
    uint64_t v17 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:a3];
    int v29 = 138412546;
    int v30 = v16;
    __int16 v31 = 2112;
    uint64_t v32 = v17;
    id v18 = "Not transitioning state from %@ to %@ because library was deactivated";
LABEL_30:
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v29, 0x16u);

LABEL_31:
    return;
  }
  if (a3 == 1 && state)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v8 = self->_libraryMode;
      if (v8 == 2)
      {
        double v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        double v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      double v19 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
        int64_t v21 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:1];
        int v29 = 138412546;
        int v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = v21;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Not transitioning state from %@ to %@, can only transition to open from uninitialized", (uint8_t *)&v29, 0x16u);
      }
    }
  }
  else
  {
    double v10 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && state == 1)
    {
      if (*MEMORY[0x1E4F59AC0]) {
        return;
      }
      int64_t v11 = self->_libraryMode;
      if (v11 == 2)
      {
        BOOL v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        BOOL v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v15 = v12;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      id v16 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
      uint64_t v17 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:a3];
      int v29 = 138412546;
      int v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      id v18 = "Not transitioning state from %@ to %@ because library is opening";
      goto LABEL_30;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v13 = self->_libraryMode;
      if (v13 == 2)
      {
        dispatch_time_t v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        dispatch_time_t v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v22 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:self->_state];
        id v24 = [(PLCloudPhotoLibraryManager *)self _debugNameForState:a3];
        int v29 = 138412546;
        int v30 = v23;
        __int16 v31 = 2112;
        uint64_t v32 = v24;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Transition state from %@ to %@", (uint8_t *)&v29, 0x16u);
      }
      unint64_t state = self->_state;
    }
    self->_stateChangePending = 1;
    if (state
      && ([(PLCloudPhotoLibraryManager *)self cplLibrary],
          (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      if (a3 == 2) {
        a3 = 6;
      }
    }
    else if (a3 != 1)
    {
      if (!*v10)
      {
        int64_t v26 = self->_libraryMode;
        if (v26 == 2)
        {
          uint64_t v27 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v26 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v27 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v28 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Forcing transition to open CPL", (uint8_t *)&v29, 2u);
        }
      }
      a3 = 1;
    }
    self->_unint64_t state = a3;
    [(PLCloudPhotoLibraryManager *)self _processNextTransaction];
  }
}

- (BOOL)_canExternallyTransitionToNewLibraryStateIgnoringPause:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_stateChangePending) {
    return 0;
  }
  unint64_t state = self->_state;
  BOOL v7 = state == 8 && a3;
  return state == 6 || v7;
}

- (void)_resetDidCallBlocksWaitingForLibraryOpen
{
}

uint64_t __70__PLCloudPhotoLibraryManager__resetDidCallBlocksWaitingForLibraryOpen__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 305) = 0;
  return result;
}

- (void)_callBlocksWaitingForLibraryOpen
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__12675;
  uint64_t v20 = __Block_byref_object_dispose__12676;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __62__PLCloudPhotoLibraryManager__callBlocksWaitingForLibraryOpen__block_invoke;
  int64_t v13 = &unk_1E5875E68;
  dispatch_time_t v14 = self;
  int v15 = &v16;
  PLRunWithUnfairLock();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = (id)v17[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v22 count:16];
    }
    while (v3);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t __62__PLCloudPhotoLibraryManager__callBlocksWaitingForLibraryOpen__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 312) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 305) = 1;
  return result;
}

- (void)_runOnLibraryOpenWithTransaction:(id)a3 block:(id)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  long long v6 = (void (**)(void))a4;
  id v7 = v5;
  PLRunWithUnfairLock();
  if (*((unsigned char *)v9 + 24)) {
    v6[2](v6);
  }

  _Block_object_dispose(&v8, 8);
}

void __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 305);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 312);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    long long v6 = __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke_2;
    id v7 = &unk_1E58742F0;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x19F38D650](&v4);
    objc_msgSend(v2, "addObject:", v3, v4, v5, v6, v7);
  }
}

uint64_t __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 afterDelay:(double)a4 block:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (a4 > 30.0 && *MEMORY[0x1E4F59AC0] == 0)
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        BOOL v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        BOOL v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        double v19 = a4;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "warning: Cloud Photo Library scheduling work in %f seconds with open transaction", buf, 0xCu);
      }
    }
  }
  dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  id v14 = v8;
  id v15 = v9;
  pl_dispatch_after();
}

uint64_t __88__PLCloudPhotoLibraryManager__runAsyncOnIsolationQueueWithTransaction_afterDelay_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  id v6 = v8;
  pl_dispatch_async();
}

uint64_t __77__PLCloudPhotoLibraryManager__runAsyncOnIsolationQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_runSyncOnIsolationQueueWithBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_sync();
}

uint64_t __64__PLCloudPhotoLibraryManager__runSyncOnIsolationQueueWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleStateTransistionAfterDisableiCPL
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_state != 9)
  {
    id v5 = +[PLAccountStore pl_sharedAccountStore];
    id v6 = [v5 cachedPrimaryAppleAccount];
    if (v6)
    {
      id v7 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      int v8 = [v7 isCPLSyncablePhotoLibrary];

      if (v8)
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          int64_t libraryMode = self->_libraryMode;
          if (libraryMode == 2)
          {
            uint64_t v10 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (libraryMode == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            uint64_t v10 = __CPLSystemLibraryOSLogDomain();
            }
          }
          double v19 = v10;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22) = 0;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Library is still syncable, transitioning back to open", (uint8_t *)&v22, 2u);
          }
        }
        [(PLCloudPhotoLibraryManager *)self _transitionToState:1];
        goto LABEL_46;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t v13 = self->_libraryMode;
        if (v13 == 2)
        {
          id v14 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v13 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v14 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v18 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [(PLCloudPhotoLibraryManager *)self pathManager];
          id v21 = [v20 libraryURL];
          int v22 = 138412290;
          uint64_t v23 = v21;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "%@ is no longer syncable, keep CPL OFF", (uint8_t *)&v22, 0xCu);
        }
LABEL_44:
      }
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v11 = self->_libraryMode;
      if (v11 == 2)
      {
        BOOL v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        BOOL v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v18 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "No Apple Account, keep CPL OFF", (uint8_t *)&v22, 2u);
      }
      goto LABEL_44;
    }
    [(PLCloudPhotoLibraryManager *)self _callBlocksWaitingForLibraryOpen];
LABEL_46:

    return;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t v3 = self->_libraryMode;
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v15 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(PLCloudPhotoLibraryManager *)self pathManager];
      uint64_t v17 = [v16 libraryURL];
      int v22 = 138412290;
      uint64_t v23 = v17;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "%@ disabled after becoming non-syncable, keep CPL OFF", (uint8_t *)&v22, 0xCu);
    }
  }
  [(PLCloudPhotoLibraryManager *)self _callBlocksWaitingForLibraryOpen];
}

- (void)_disableiCPLWillBecomeNonSyncablePhotoLibrary:(BOOL)a3 resetMode:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a4 == 3)
  {
    id v7 = NSString;
    unint64_t deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
    if (deviceLibraryConfiguration > 2) {
      id v9 = @"unknown";
    }
    else {
      id v9 = off_1E586C1D0[deviceLibraryConfiguration];
    }
    int64_t v11 = v9;
    unint64_t pendingDeviceLibraryConfiguration = self->_pendingDeviceLibraryConfiguration;
    if (pendingDeviceLibraryConfiguration > 2) {
      int64_t v13 = @"unknown";
    }
    else {
      int64_t v13 = off_1E586C1D0[pendingDeviceLibraryConfiguration];
    }
    id v14 = v13;
    v142 = [v7 stringWithFormat:@"device-library configuration changing from %@ to %@", v11, v14];
  }
  else
  {
    self->_unint64_t pendingDeviceLibraryConfiguration = 0;
    self->_unint64_t deviceLibraryConfiguration = 0;
    PLSetCPLDeviceLibraryConfiguration(0);
    [(PLCloudPhotoLibraryManager *)self _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:0];
    uint64_t v10 = @"will become non-Syncable";
    if (!v5) {
      uint64_t v10 = 0;
    }
    v142 = v10;
  }
  id v15 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v16 = [v15 libraryBundle];
  uint64_t v17 = [v16 indicatorFileCoordinator];

  [v17 logCloudServiceEnableEvent:0 serviceName:@"CPL" reason:v142];
  uint64_t v18 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v20 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v20 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v21 = v20;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (v142) {
        int v22 = v142;
      }
      else {
        int v22 = @"account setting changed";
      }
      if ((unint64_t)a4 > 3) {
        uint64_t v23 = @"unknown";
      }
      else {
        uint64_t v23 = off_1E5868C30[a4];
      }
      uint64_t v24 = v23;
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Disabling iCPL reason %@, reset mode: %{public}@", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v143 = [WeakRetained cplSettings];

  [v143 setRunOnceFlag:8 error:0];
  int64_t v26 = [(PLCloudPhotoLibraryManager *)self cacheDeleteSupport];
  int v27 = [v26 clearPurgeableFlagsForAllResources];

  if (v27)
  {
    if (!*v18)
    {
      int64_t v28 = self->_libraryMode;
      if (v28 == 2)
      {
        int v29 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v28 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v29 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v32 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
      }
    }
    [v143 clearRunOnceFlag:8 error:0];
  }
  else if (!*v18)
  {
    int64_t v30 = self->_libraryMode;
    if (v30 == 2)
    {
      __int16 v31 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v30 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      __int16 v31 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v33 = v31;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", buf, 2u);
    }
  }
  [(PLCloudPhotoLibraryManager *)self _resetCacheDeleteSupport];
  if (self->_foregroundMonitorIdentifier)
  {
    uint64_t v34 = +[PLForegroundMonitor sharedInstance];
    [v34 stopMonitoring:self->_foregroundMonitorIdentifier];

    id foregroundMonitorIdentifier = self->_foregroundMonitorIdentifier;
    self->_id foregroundMonitorIdentifier = 0;
  }
  if (self->_cameraMonitorIdentifier)
  {
    id v36 = +[PLForegroundMonitor sharedInstance];
    [v36 stopMonitoring:self->_cameraMonitorIdentifier];

    id cameraMonitorIdentifier = self->_cameraMonitorIdentifier;
    self->_id cameraMonitorIdentifier = 0;
  }
  if (!*v18)
  {
    int64_t v38 = self->_libraryMode;
    if (v38 == 2)
    {
      uint64_t v39 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v38 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v39 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v40 = v39;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Disconnecting CPL delegates", buf, 2u);
    }
  }
  uint64_t v41 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  [v41 setResourceProgressDelegate:0];

  uint64_t v42 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  [v42 setDelegate:0];

  if (!*v18)
  {
    int64_t v43 = self->_libraryMode;
    if (v43 == 2)
    {
      id v44 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v43 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v44 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v45 = v44;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "Disconnecting and clearing cloud change tracker", buf, 2u);
    }
  }
  [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker disconnect];
  syncChangeTracker = self->_syncChangeTracker;
  self->_syncChangeTracker = 0;

  [(PLCloudPhotoLibraryManager *)self stopLibraryScopeRulesChangeTracker];
  if (!*v18)
  {
    int64_t v47 = self->_libraryMode;
    if (v47 == 2)
    {
      __int16 v48 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v47 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      __int16 v48 = __CPLSystemLibraryOSLogDomain();
      }
    }
    __int16 v49 = v48;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Clearing upload array", buf, 2u);
    }
  }
  [(PLCloudBatchUploader *)self->_uploader clearUploadArray];
  uploader = self->_uploader;
  self->_uploader = 0;

  if (!*v18)
  {
    int64_t v51 = self->_libraryMode;
    if (v51 == 2)
    {
      long long v52 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v51 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      long long v52 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v53 = v52;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "Clearing batch downloader", buf, 2u);
    }
  }
  downloader = self->_downloader;
  self->_downloader = 0;

  if (!*v18)
  {
    int64_t v55 = self->_libraryMode;
    if (v55 == 2)
    {
      uint64_t v56 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v55 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v56 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v57 = v56;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEFAULT, "Resetting task manager", buf, 2u);
    }
  }
  [(PLCloudTaskManager *)self->_taskManager reset];
  taskManager = self->_taskManager;
  self->_taskManager = 0;

  [(PLCloudInMemoryTaskManager *)self->_inMemoryTaskManager reset];
  inMemoryTaskManager = self->_inMemoryTaskManager;
  self->_inMemoryTaskManager = 0;

  if (!*v18)
  {
    int64_t v60 = self->_libraryMode;
    if (v60 == 2)
    {
      id v61 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v60 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v61 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v62 = v61;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Stopping resource manager", buf, 2u);
    }
  }
  id v63 = [(PLCloudPhotoLibraryManager *)self resourceManager];
  [v63 stop];

  [(PLCloudPhotoLibraryManager *)self _resetResourceManager];
  if (!*v18)
  {
    int64_t v64 = self->_libraryMode;
    if (v64 == 2)
    {
      __int16 v65 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v64 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      __int16 v65 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v66 = v65;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_DEFAULT, "Deleting CPL Plist", buf, 2u);
    }
  }
  id v67 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v68 = [(PLCloudPhotoLibraryManager *)self pathManager];
  [v67 deleteCPLPlistWithPathManager:v68];

  id v69 = "-[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:]";
  if (a4 == 3)
  {
    id v70 = NSString;
    unint64_t v71 = self->_pendingDeviceLibraryConfiguration;
    if (v71 > 2) {
      id v72 = @"unknown";
    }
    else {
      id v72 = off_1E586C1D0[v71];
    }
    unsigned int v73 = v72;
    id v74 = [v70 stringWithFormat:@"%s - %@", "-[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:]", v73];
    id v69 = (const char *)[v74 UTF8String];
  }
  id v75 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v76 = [v75 databaseContext];
  uint64_t v77 = (void *)[v76 newShortLivedCplLibraryWithNameSuffix:v69];

  char v78 = [v77 managedObjectContext];
  [v78 setLocalOnlyDelete:1];

  v147[0] = MEMORY[0x1E4F143A8];
  v147[1] = 3221225472;
  v147[2] = __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke;
  v147[3] = &unk_1E5875CE0;
  id v79 = v77;
  id v148 = v79;
  [v79 performTransactionAndWait:v147];
  if (!*v18)
  {
    int64_t v80 = self->_libraryMode;
    if (v80 == 2)
    {
      uint64_t v81 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v80 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v81 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v82 = v81;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_DEFAULT, "Resetting upload tracker", buf, 2u);
    }
  }
  [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker reset];
  uploadTracker = self->_uploadTracker;
  self->_uploadTracker = 0;

  if (!*v18)
  {
    int64_t v84 = self->_libraryMode;
    if (v84 == 2)
    {
      long long v85 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v84 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      long long v85 = __CPLSystemLibraryOSLogDomain();
      }
    }
    long long v86 = v85;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v86, OS_LOG_TYPE_DEFAULT, "Resetting flags", buf, 2u);
    }
  }
  unint64_t v87 = 9;
  if (!v5) {
    unint64_t v87 = 0;
  }
  self->_unint64_t state = v87;
  self->_initializedMaster = 0;
  self->_pauseRequest = 0;
  self->_pauseReason = 0;
  self->_pushingAllChanges = 0;
  *(_DWORD *)&self->_icplEnabled = 0;
  self->_hasSettledInitialBatch = 0;
  [(NSMutableArray *)self->_pushAllChangesCompletionHandlers removeAllObjects];
  if (!*v18)
  {
    int64_t v88 = self->_libraryMode;
    if (v88 == 2)
    {
      uint64_t v89 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v88 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v89 = __CPLSystemLibraryOSLogDomain();
      }
    }
    long long v90 = v89;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_DEFAULT, "Deactivating local library for iCPL", buf, 2u);
    }
  }
  uint64_t v91 = [MEMORY[0x1E4F8B8D0] defaultDeviceConfiguration];
  int v92 = [v91 isTV];

  [(PLCloudPhotoLibraryManager *)self _enableOpportunisticTasks];
  long long v93 = (void *)MEMORY[0x1E4F8B858];
  long long v94 = [(PLCloudPhotoLibraryManager *)self pathManager];
  long long v95 = [v94 libraryURL];
  long long v96 = [v93 appPrivateDataForLibraryURL:v95];

  [v96 saveCachedIsReadyForAnalysis:0];
  if ([(PLCloudPhotoLibraryManager *)self _shouldResetICloudBackupExclusionPaths])
  {
    if (!*v18)
    {
      int64_t v97 = self->_libraryMode;
      if (v97 == 2)
      {
        long long v98 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v97 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        long long v98 = __CPLSystemLibraryOSLogDomain();
        }
      }
      char v99 = v98;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v100 = [(PLCloudPhotoLibraryManager *)self pathManager];
        uint64_t v101 = [v100 libraryURL];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v101;
        _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_DEFAULT, "Setting iCPL-disabled exclusion flags on App Library because iCPL was disabled: %@", buf, 0xCu);
      }
    }
    char v102 = [(PLCloudPhotoLibraryManager *)self pathManager];
    [v102 resetBackupExclusionPathsForBackupType:2];
  }
  v103 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  PLResetSyncStatusWithLibrary(v79, v103, a4, self->_pendingDeviceLibraryConfiguration, v92);

  char v104 = [(PLCloudPhotoLibraryManager *)self cplLibrary];

  if (v104)
  {
    if (!*v18)
    {
      int64_t v105 = self->_libraryMode;
      if (v105 == 2)
      {
        __int16 v106 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v105 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        __int16 v106 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v107 = v106;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v107, OS_LOG_TYPE_DEFAULT, "Deactivating CPL library", buf, 2u);
      }
    }
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v152 = __Block_byref_object_copy__12675;
    v153 = __Block_byref_object_dispose__12676;
    id v154 = 0;
    dispatch_block_t v108 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_196_13014);
    v109 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke_2;
    v144[3] = &unk_1E586DD98;
    v146 = buf;
    id v110 = v108;
    id v145 = v110;
    [v109 deactivateWithCompletionHandler:v144];

    dispatch_block_wait(v110, 0xFFFFFFFFFFFFFFFFLL);
    int v111 = *v18;
    if (*(void *)(*(void *)&buf[8] + 40) && !*v18)
    {
      int64_t v112 = self->_libraryMode;
      if (v112 == 2)
      {
        v113 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v112 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        v113 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v114 = v113;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        uint64_t v115 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)BOOL v149 = 138412290;
        uint64_t v150 = v115;
        _os_log_impl(&dword_19B3C7000, v114, OS_LOG_TYPE_ERROR, "Unable to deactivate CPL: %@", v149, 0xCu);
      }

      int v111 = *v18;
    }
    if (!v111)
    {
      int64_t v116 = self->_libraryMode;
      if (v116 == 2)
      {
        uint64_t v117 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v116 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v117 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v118 = v117;
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v149 = 0;
        _os_log_impl(&dword_19B3C7000, v118, OS_LOG_TYPE_DEFAULT, "Clearing CPLLibrary", v149, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self setCPLLibrary:0];
    [(PLCloudPhotoLibraryManager *)self setCPLStatus:0];
    [(PLCloudPhotoLibraryManager *)self setCPLConfiguration:0];

    _Block_object_dispose(buf, 8);
  }
  uint64_t v119 = [(PLCloudPhotoLibraryManager *)self pathManager];
  [v119 removeCPLDataDirectory];

  [(PLCloudPhotoLibraryManager *)self _updateBackupExclusionPathsAfterRemoveCPLDirectory];
  if (a4 == 3)
  {
    if (!*v18)
    {
      int64_t v120 = self->_libraryMode;
      if (v120 == 2)
      {
        v121 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v120 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        v121 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v125 = v121;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v126 = self->_deviceLibraryConfiguration;
        if (v126 > 2) {
          char v127 = @"unknown";
        }
        else {
          char v127 = off_1E586C1D0[v126];
        }
        uint64_t v128 = v127;
        unint64_t v129 = self->_pendingDeviceLibraryConfiguration;
        if (v129 > 2) {
          v130 = @"unknown";
        }
        else {
          v130 = off_1E586C1D0[v129];
        }
        v131 = v130;
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v128;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v131;
        _os_log_impl(&dword_19B3C7000, v125, OS_LOG_TYPE_DEFAULT, "Finished changing device-library configuration from %@ to %@", buf, 0x16u);
      }
    }
    PLSetCPLDeviceLibraryConfiguration(self->_pendingDeviceLibraryConfiguration);
    [(PLCloudPhotoLibraryManager *)self setDeviceLibraryConfiguration:self->_pendingDeviceLibraryConfiguration];
    [(PLCloudPhotoLibraryManager *)self _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:0];
    if (!*v18)
    {
      int64_t v132 = self->_libraryMode;
      if (v132 == 2)
      {
        v133 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v132 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        v133 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v140 = v133;
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v140, OS_LOG_TYPE_DEFAULT, "Transitioning back to after configuration change", buf, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _transitionToState:1];
  }
  else
  {
    v122 = [(PLCloudPhotoLibraryManager *)self pathManager];
    [v122 removePartialVideoDirectory];

    if (!*v18)
    {
      int64_t v123 = self->_libraryMode;
      if (v123 == 2)
      {
        uint64_t v124 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v123 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v124 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v134 = v124;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v134, OS_LOG_TYPE_DEFAULT, "Updating iCPL marker", buf, 2u);
      }
    }
    [v17 deleteCPLDownloadFinishedMarkerFilePath];
    [v17 updateICloudPhotosMarkerForEnable:0];
    if (self->_state != 9)
    {
      uint64_t v135 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
      char v136 = [v135 isCPLSyncablePhotoLibrary];

      if ((v136 & 1) == 0)
      {
        self->_unint64_t state = 9;
        v137 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
        [v137 didBecomeNonSyncablePhotoLibrary];
      }
    }
    if (!*v18)
    {
      int64_t v138 = self->_libraryMode;
      if (v138 == 2)
      {
        v139 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v138 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        v139 = __CPLSystemLibraryOSLogDomain();
        }
      }
      v141 = v139;
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v141, OS_LOG_TYPE_DEFAULT, "iCPL is disabled", buf, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _handleStateTransistionAfterDisableiCPL];
  }
}

void __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [PLGlobalValues alloc];
  int64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [(PLGlobalValues *)v2 initWithManagedObjectContext:v3];

  [(PLGlobalValues *)v4 setCloudTrackerLastKnownCloudVersion:0];
  [(PLGlobalValues *)v4 setCloudTrackerLastKnownToken:0];
  [(PLGlobalValues *)v4 setLibraryScopeRulesTrackerLastKnownToken:0];
  [(PLGlobalValues *)v4 setCloudInitialUploadCompleted:0];
}

void __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_disableiCPLSyncWithResetMode:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _disableiCPLSyncWithResetMode:]"];
  id v6 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v7 = [v6 libraryBundle];
  int v8 = [v7 indicatorFileCoordinator];

  [v8 writeDisableICloudPhotosMarker];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  uint64_t v10 = [WeakRetained cplSettings];
  [v10 setICPLEnabled:0 error:0];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke;
  v18[3] = &unk_1E5875CE0;
  void v18[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runSyncOnIsolationQueueWithBlock:v18];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      BOOL v12 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      BOOL v12 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(PLCloudPhotoLibraryManager *)self pathManager];
      id v15 = [v14 libraryURL];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = v15;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Waiting for CPL to open for iCPL disable before library deletion: %@", buf, 0xCu);
    }
  }
  dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_177);
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v5 block:v16];
  dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  [(PLCloudPhotoLibraryManager *)self _resetDidCallBlocksWaitingForLibraryOpen];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke_2;
  v17[3] = &unk_1E5873348;
  uint8_t v17[4] = self;
  void v17[5] = a3;
  [(PLCloudPhotoLibraryManager *)self _runSyncOnIsolationQueueWithBlock:v17];
}

void *__60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[10])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = result[12];
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      BOOL v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [*(id *)(a1 + 32) pathManager];
        id v7 = [v6 libraryURL];
        int v8 = 138412290;
        id v9 = v7;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Opening CPL for iCPL disable before library deletion: %@", (uint8_t *)&v8, 0xCu);
      }
      uint64_t result = *(void **)(a1 + 32);
    }
    return (void *)[result _transitionToState:1];
  }
  return result;
}

uint64_t __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableiCPLWillBecomeNonSyncablePhotoLibrary:1 resetMode:*(void *)(a1 + 40)];
}

- (void)disableiCPLSyncForLibraryDeletion
{
}

- (void)disableiCPLSyncWillBecomeNonSyncablePhotoLibrary
{
}

- (void)disableiCPLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager disableiCPLWithCompletionHandler:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5874868;
  void v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v7 block:v8];
}

void __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[10] == 9)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      return;
    }
    uint64_t v3 = v2[12];
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Not disabling, CPL already deactivated", buf, 2u);
    }
  }
  else
  {
    BOOL v5 = [v2 libraryServicesManager];
    id v6 = [v5 libraryBundle];
    id v7 = [v6 indicatorFileCoordinator];

    if ([v7 isDisableICloudPhotos])
    {
      int v8 = *(void **)(a1 + 32);
      if (!v8[10])
      {
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v9 = v8[12];
          if (v9 == 2)
          {
            id v10 = __CPLAppLibraryOSLogDomain();
          }
          else
          {
            if (v9 == 1) {
              __CPLSyndicationOSLogDomain();
            }
            else {
            id v10 = __CPLSystemLibraryOSLogDomain();
            }
          }
          uint64_t v17 = v10;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [*(id *)(a1 + 32) pathManager];
            double v19 = [v18 libraryURL];
            *(_DWORD *)long long buf = 138412290;
            int64_t v30 = v19;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Opening CPL for iCPL disable: %@", buf, 0xCu);
          }
          int v8 = *(void **)(a1 + 32);
        }
        [v8 _transitionToState:1];
        int v8 = *(void **)(a1 + 32);
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v20 = v8[12];
        if (v20 == 2)
        {
          uint64_t v21 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v20 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          uint64_t v21 = __CPLSystemLibraryOSLogDomain();
          }
        }
        int v22 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [*(id *)(a1 + 32) pathManager];
          uint64_t v24 = [v23 libraryURL];
          *(_DWORD *)long long buf = 138412290;
          int64_t v30 = v24;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Waiting for CPL to open for iCPL disable: %@", buf, 0xCu);
        }
        int v8 = *(void **)(a1 + 32);
      }
      uint64_t v25 = *(void **)(a1 + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_174;
      v26[3] = &unk_1E5874868;
      v26[4] = v8;
      id v27 = v25;
      id v28 = *(id *)(a1 + 48);
      [v8 _runOnLibraryOpenWithTransaction:v27 block:v26];
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        BOOL v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        BOOL v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int64_t v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 32) pathManager];
        id v15 = [v14 libraryURL];
        dispatch_block_t v16 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
        *(_DWORD *)long long buf = 138412546;
        int64_t v30 = v15;
        __int16 v31 = 2114;
        uint64_t v32 = v16;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Not disabling, CPL disable marker missing for library %@, state: %{public}@", buf, 0x16u);
      }
    }
  }
}

void __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_174(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetDidCallBlocksWaitingForLibraryOpen];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E58742F0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  [v2 _runAsyncOnIsolationQueueWithTransaction:v3 block:v4];
}

uint64_t __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _disableiCPLWillBecomeNonSyncablePhotoLibrary:0 resetMode:2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_pause
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _pause]"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PLCloudPhotoLibraryManager__pause__block_invoke;
  v4[3] = &unk_1E5875CE0;
  v4[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v3 block:v4];
}

void __36__PLCloudPhotoLibraryManager__pause__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [*(id *)(a1 + 32) _calculateUnpauseTimeForPauseTime:v2];
  id v4 = [*(id *)(a1 + 32) libraryServicesManager];
  id v5 = [v4 libraryBundle];
  id v6 = [v5 indicatorFileCoordinator];

  [v6 createPauseMarkerWithUnpauseTime:v3 reason:*(__int16 *)(*(void *)(a1 + 32) + 132)];
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if ([*(id *)(a1 + 32) _canExternallyTransitionToNewLibraryStateIgnoringPause:1])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v8 == 2)
      {
        uint64_t v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(__int16 *)(v11 + 132);
        int64_t v13 = [(id)v11 _debugNameForState:*(void *)(v11 + 80)];
        v14[0] = 67109378;
        v14[1] = v12;
        __int16 v15 = 2112;
        dispatch_block_t v16 = v13;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Going to pause (%d) Cloud Photo Library from %@", (uint8_t *)v14, 0x12u);
      }
    }
    [*(id *)(a1 + 32) _doPause];
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 128) = 1;
  }
  objc_sync_exit(v7);
}

- (void)_doPause
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudPhotoLibraryManager *)self _setupTimerForUnpause];
  [(PLCloudPhotoLibraryManager *)self _transitionToState:8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.paused", 0, 0, 1u);
}

- (void)_unpause
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _unpause]"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PLCloudPhotoLibraryManager__unpause__block_invoke;
  v4[3] = &unk_1E5875CE0;
  v4[4] = self;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v3 block:v4];
}

void __38__PLCloudPhotoLibraryManager__unpause__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 80) == 8)
  {
    if ([(id)v3 _canExternallyTransitionToNewLibraryStateIgnoringPause:1])
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 96);
        if (v4 == 2)
        {
          id v5 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v4 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v5 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v8 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(__int16 *)(*(void *)(a1 + 32) + 132);
          v14[0] = 67109120;
          v14[1] = v9;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Going to unpause (%d) Cloud Photo Library", (uint8_t *)v14, 8u);
        }
      }
      [*(id *)(a1 + 32) _doUnpause];
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 128) = 2;
    }
  }
  else if (*(_DWORD *)(v3 + 128) == 1)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = *(void *)(v3 + 96);
      if (v6 == 2)
      {
        id v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v6 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v10 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Going to cancel previous pause request for Cloud Photo Library", (uint8_t *)v14, 2u);
      }

      uint64_t v3 = *(void *)(a1 + 32);
    }
    *(_DWORD *)(v3 + 128) = 0;
    *(_WORD *)(*(void *)(a1 + 32) + 132) = 0;
    uint64_t v11 = [*(id *)(a1 + 32) libraryServicesManager];
    int v12 = [v11 libraryBundle];
    int64_t v13 = [v12 indicatorFileCoordinator];

    [v13 clearPauseMarkerForReason:3];
  }
  objc_sync_exit(v2);
}

- (void)setPause:(BOOL)a3 reason:(signed __int16)a4
{
  id v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager setPause:reason:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PLCloudPhotoLibraryManager_setPause_reason___block_invoke;
  v8[3] = &unk_1E58648E8;
  signed __int16 v9 = a4;
  void v8[4] = self;
  BOOL v10 = a3;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v7 block:v8];
}

_WORD *__46__PLCloudPhotoLibraryManager_setPause_reason___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(a1 + 40);
  uint64_t result = *(_WORD **)(a1 + 32);
  if (v2 == 3 || result[66] != 3)
  {
    if (*(unsigned char *)(a1 + 42))
    {
      if (result[66] != 3)
      {
        result[66] = v2;
        uint64_t result = *(_WORD **)(a1 + 32);
      }
      return (_WORD *)[result _pause];
    }
    else
    {
      return (_WORD *)[result _unpause];
    }
  }
  return result;
}

- (void)_doUnpause
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v4 = [v3 libraryBundle];
  id v5 = [v4 indicatorFileCoordinator];

  if ([v5 clearPauseMarkerForReason:self->_pauseReason])
  {
    [(PLCloudPhotoLibraryManager *)self _stopUnpauseTimer];
    self->_int pauseReason = 0;
    [(PLCloudPhotoLibraryManager *)self _transitionToState:6];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.paused", 0, 0, 1u);
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v8 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v8 = __CPLSystemLibraryOSLogDomain();
      }
    }
    signed __int16 v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v5 currentPauseReason];
      int pauseReason = self->_pauseReason;
      v12[0] = 67109376;
      v12[1] = v10;
      __int16 v13 = 1024;
      int v14 = pauseReason;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring unpause request, currentPause reason %d, unpause reason %d", (uint8_t *)v12, 0xEu);
    }
  }
}

- (void)dealloc
{
  [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker disconnect];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow.PreferenceChanged", 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.mobileslideshow.cpl.localmodeenabledchanged", 0);
  v5.receiver = self;
  v5.super_class = (Class)PLCloudPhotoLibraryManager;
  [(PLCloudPhotoLibraryManager *)&v5 dealloc];
}

- (void)_resetCPLLibrary
{
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self cplLibrary];

  if (v3)
  {
    uint64_t v4 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    [v4 setResourceProgressDelegate:0];

    objc_super v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    [v5 setDelegate:0];

    [(PLCloudPhotoLibraryManager *)self setCPLLibrary:0];
    [(PLCloudPhotoLibraryManager *)self setCPLStatus:0];
    [(PLCloudPhotoLibraryManager *)self setCPLConfiguration:0];
  }
}

- (void)cplHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager cplHasBackgroundDownloadOperationsWithCompletionHandler:]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLCloudPhotoLibraryManager *)self _runOnLibraryOpenWithTransaction:v5 block:v7];
}

void __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) cplLibrary];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E5874DE8;
    id v6 = *(id *)(a1 + 40);
    [v2 checkHasBackgroundDownloadOperationsWithCompletionHandler:v5];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = +[PLCloudPhotoLibraryError createErrorWithType:5];
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
    }
  }
}

uint64_t __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endsSignificantWork
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self cplStatus];
  id v4 = [v3 initialSyncDate];

  objc_super v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  if (v5
    && self->_significantWork
    && ([(PLCloudPhotoLibraryManager *)self cplLibrary],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 sizeOfResourcesToUpload],
        v6,
        !v7)
    && v4)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        signed __int16 v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        signed __int16 v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      __int16 v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Ending significant work", (uint8_t *)&v14, 2u);
      }
    }
    self->_significantWoruint64_t k = 0;
    [v5 noteClientIsEndingSignificantWork];
  }
  else if (self->_significantWork && !*MEMORY[0x1E4F59AC0])
  {
    int64_t v10 = self->_libraryMode;
    if (v10 == 2)
    {
      uint64_t v11 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v10 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v11 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      uint64_t v15 = [v5 sizeOfResourcesToUpload];
      __int16 v16 = 1024;
      BOOL v17 = v4 == 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Keeping the significant work mode, sizeOfResourcesToUpload = %llu, inInitialSync = %d", (uint8_t *)&v14, 0x12u);
    }
  }
}

- (void)beginsSignificantWorkWithResourcesSize:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  if (v5 && (PLIsEDUMode() & 1) == 0 && a3 >> 22 >= 0x19 && !self->_significantWork)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        unint64_t v10 = a3 >> 20;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Starting significant work with %lluMB of resources", (uint8_t *)&v9, 0xCu);
      }
    }
    self->_significantWoruint64_t k = 1;
    [v5 noteClientIsBeginningSignificantWork];
  }
}

- (void)_migrateFromChangeHubToCoreDataIfNecessary
{
  if (self->_hasAttemptedMigration)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v3 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v3 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Already attempted persistent history migration so skipping it", v5, 2u);
      }
    }
  }
  else
  {
    self->_hasAttemptedMigration = 1;
    +[PLCloudPersistentHistoryMigrator migrateToPersistentHistoryIfNecessaryWithMigratorContext:self];
  }
}

- (void)_createDeletionRecordsIfNecessary
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PLCloudPhotoLibraryManager *)self pathManager];
  id v8 = 0;
  objc_super v5 = [v4 photoDirectoryWithType:13 leafType:3 createIfNeeded:0 error:&v8];
  id v6 = v8;

  uint64_t v7 = [v5 stringByAppendingPathComponent:@"recordstodelete.plist"];
  if ([v3 fileExistsAtPath:v7]) {
    [(PLCloudBatchUploader *)self->_uploader uploadDeletedRecordsFromPlist:v7];
  }
}

- (void)_runOneTimeMigrationStepsIfNecessaryInLibrary:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v6 = [WeakRetained cplSettings];

  if ([v6 runOnceFlagIsSet:2])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke;
    v18[3] = &unk_1E5875CE0;
    id v19 = v6;
    [(PLCloudPhotoLibraryManager *)self _reportOptimizeSettingChangeWithCompletionHandler:v18];
  }
  if ([v6 runOnceFlagIsSet:1])
  {
    unint64_t v7 = self->_handlePrefetchModeChangeGeneration + 1;
    self->_handlePrefetchModeChangeGeneration = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_2;
    v15[3] = &unk_1E5875E40;
    unint64_t v17 = v7;
    void v15[4] = self;
    id v16 = v6;
    [(PLCloudPhotoLibraryManager *)self _handleOptimizeSettingChangeInLibrary:v4 withCompletionHandler:v15];
  }
  if ([v6 runOnceFlagIsSet:16])
  {
    [(PLCloudPhotoLibraryManager *)self _repushVideoAssetsMetadata];
    [v6 clearRunOnceFlag:16 error:0];
  }
  if ([v6 runOnceFlagIsSet:32])
  {
    [(PLCloudPhotoLibraryManager *)self _repushMasterWithMissingMediaMetadata];
    [v6 clearRunOnceFlag:32 error:0];
  }
  if ([v6 runOnceFlagIsSet:4])
  {
    id v8 = +[PLInternalResource predicateForAvailableResources];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_3;
    int v12 = &unk_1E5875E18;
    __int16 v13 = self;
    id v14 = v6;
    [(PLCloudPhotoLibraryManager *)self markPurgeableResourcesMatchingPredicate:v8 urgency:0 inLibrary:v4 completionHandler:&v9];
  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 64, v9, v10, v11, v12, v13))
  {
    [(PLCloudPhotoLibraryManager *)self _repushAssetsWithImportedByBundleIdentifier];
    [v6 clearRunOnceFlag:64 error:0];
  }
  if ([v6 runOnceFlagIsSet:128])
  {
    +[PLManagedAsset runComputeSyncBackfillTaskOnProcessedAssets:v4];
    [v6 clearRunOnceFlag:128 error:0];
  }
  [(PLCloudPhotoLibraryManager *)self _createDeletionRecordsIfNecessary];
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearRunOnceFlag:2 error:0];
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 48) == *(void *)(*(void *)(result + 32) + 440)) {
    return [*(id *)(result + 40) clearRunOnceFlag:1 error:0];
  }
  return result;
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) pathManager];
  [v2 removePartialVideoDirectory];

  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 clearRunOnceFlag:4 error:0];
}

- (void)_runOneTimeMigrationStepsWithoutiCPLIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v4 = [WeakRetained cplSettings];

  if ([v4 runOnceFlagIsSet:8])
  {
    objc_super v5 = [(PLCloudPhotoLibraryManager *)self cacheDeleteSupport];
    int v6 = [v5 clearPurgeableFlagsForAllResources];

    if (v6)
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        int64_t libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          id v8 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (libraryMode == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v8 = __CPLSystemLibraryOSLogDomain();
          }
        }
        uint64_t v11 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
        }
      }
      [v4 clearRunOnceFlag:8 error:0];
    }
    else if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t v9 = self->_libraryMode;
      if (v9 == 2)
      {
        uint64_t v10 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v9 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v10 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v12 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", v13, 2u);
      }
    }
  }
}

- (void)_initializeMasterAndSizeCalculationinLibrary:(id)a3
{
  id v4 = a3;
  uploadTracker = self->_uploadTracker;
  int v6 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  [(PLCloudPhotoLibraryUploadTracker *)uploadTracker setupFromCPLManager:v6];

  if (!self->_initializedMaster)
  {
    if ([(PLCloudBatchUploader *)self->_uploader initialUpload]) {
      +[PLManagedAsset createMastersInLibrary:v4];
    }
    [(PLCloudPhotoLibraryUploadTracker *)self->_uploadTracker setupFromLibrary:v4 isInitialUpload:[(PLCloudBatchUploader *)self->_uploader initialUpload]];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, 0, 0);
    self->_initializedMaster = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PLCloudPhotoLibraryManager__initializeMasterAndSizeCalculationinLibrary___block_invoke;
    v8[3] = &unk_1E5875E18;
    id v9 = v4;
    uint64_t v10 = self;
    [v9 performBlockAndWait:v8];
  }
}

void __75__PLCloudPhotoLibraryManager__initializeMasterAndSizeCalculationinLibrary___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) librarySizesFromDBForLibraryKindMask:32];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 32);
  id v4 = [*(id *)(a1 + 40) cplLibrary];
  objc_super v5 = [v2 objectForKey:v3];
  objc_msgSend(v4, "setEstimatedInitialSizeForLocalLibrary:", objc_msgSend(v5, "unsignedIntegerValue"));

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if ([*(id *)(a1 + 32) getPhotoCount:&v8 videoCount:&v7 excludeTrashed:0 excludeInvisible:0 excludeCloudShared:1])
  {
    int v6 = [*(id *)(a1 + 40) cplLibrary];
    [v6 setEstimatedInitialAssetCountForLocalLibrary:v7 + v8];
  }
}

- (void)_openCPLLibrary
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudPhotoLibraryManager *)self _resetCacheDeleteSupport];
  [(PLCloudPhotoLibraryManager *)self _resetResourceManager];
  [(PLCloudPhotoLibraryManager *)self _resetDidCallBlocksWaitingForLibraryOpen];
  self->_isHandlingStatusChangesNotification = 0;
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  id v4 = [v3 libraryBundle];
  objc_super v5 = [v4 indicatorFileCoordinator];

  int v6 = [v5 isWipeCPLOnOpen];
  uint64_t v7 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        id v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Wipe CPL on open marker detected, attempting to remove CPL directory", buf, 2u);
      }
    }
    uint64_t v11 = [(PLCloudPhotoLibraryManager *)self pathManager];
    [v11 removeCPLDataDirectory];

    [(PLCloudPhotoLibraryManager *)self _updateBackupExclusionPathsAfterRemoveCPLDirectory];
    [v5 clearWipeCPLOnOpen];
  }
  int v12 = +[PLAccountStore pl_sharedAccountStore];
  __int16 v13 = [v12 cachedPrimaryAppleAccount];

  if (!v13)
  {
    if (!*v7)
    {
      int64_t v16 = self->_libraryMode;
      if (v16 == 2)
      {
        unint64_t v17 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v16 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        unint64_t v17 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v28 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "No Apple Account, resetting CPL library", buf, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _resetCPLLibrary];
    [(PLCloudPhotoLibraryManager *)self _callBlocksWaitingForLibraryOpen];
    self->_unint64_t state = 0;
    goto LABEL_120;
  }
  if (!*v7)
  {
    int64_t v14 = self->_libraryMode;
    if (v14 == 2)
    {
      uint64_t v15 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v14 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v15 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v18 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Creating CPL Library", buf, 2u);
    }
  }
  id v19 = [(PLCloudPhotoLibraryManager *)self cplLibrary];

  if (v19) {
    goto LABEL_96;
  }
  uint64_t v20 = [(PLCloudPhotoLibraryManager *)self pathManager];
  uint64_t v21 = [v20 cplDataDirectoryCreateIfNeeded:0];

  uint64_t v22 = [v21 stringByAppendingPathComponent:@"storage"];
  uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v83 = 0;
  char v24 = [v23 createDirectoryIfNeededAtPath:v22 error:&v83];
  id v25 = v83;

  if ((v24 & 1) == 0 && !*v7)
  {
    int64_t v26 = self->_libraryMode;
    if (v26 == 2)
    {
      id v27 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v26 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v27 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int v29 = v27;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v85 = v22;
      __int16 v86 = 2112;
      id v87 = v25;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Unable to create directory %@: %@", buf, 0x16u);
    }
  }
  id v76 = v25;
  int64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v21 isDirectory:1];
  char v78 = v21;
  id v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v22 isDirectory:1];
  int64_t v31 = self->_libraryMode;
  uint64_t v77 = (void *)v22;
  if (v31 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    [WeakRetained libraryURL];
    id v36 = v35 = v30;
    uint64_t v32 = 1;
    uint64_t v37 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v36 createIfMissing:1 error:0];

    int64_t v38 = [v37 containerIdentifier];
    uint64_t v39 = [v37 uuid];
    CPLLibraryIdentifierForApp();
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    int64_t v30 = v35;
  }
  else if (v31 == 1)
  {
    id v33 = (id)*MEMORY[0x1E4F59790];
    uint64_t v32 = 4;
  }
  else if (v31)
  {
    id v33 = 0;
    uint64_t v32 = 0;
  }
  else
  {
    if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken != -1) {
      dispatch_once(&PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken, &__block_literal_global_387);
    }
    if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_multiLibrarySyncingEnabled) {
      uint64_t v32 = 1033;
    }
    else {
      uint64_t v32 = 1037;
    }
    id v33 = (id)*MEMORY[0x1E4F59798];
  }
  uint64_t v40 = [(PLCloudPhotoLibraryManager *)self pathManager];
  int v41 = PLCloudPhotoLibraryLocalModeEnabled(v40);

  if (v41)
  {
    uint64_t v42 = [PLFakeCPLLibraryManager alloc];
    int64_t v43 = [(PLFakeCPLLibraryManager *)v42 initWithClientLibraryBaseURL:v30 cloudLibraryStateStorageURL:v79 cloudLibraryResourceStorageURL:v79 libraryIdentifier:*MEMORY[0x1E4F59798] options:v32];
    if (*v7) {
      goto LABEL_73;
    }
    int64_t v44 = self->_libraryMode;
    if (v44 == 2)
    {
      uint64_t v45 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v44 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v45 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v47 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v51 = (objc_class *)objc_opt_class();
      long long v52 = NSStringFromClass(v51);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v85 = (uint64_t)v52;
      _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, "Warning: CPLLocalMode enabled, about to connect to fake library manager instead: %@", buf, 0xCu);
    }
  }
  else
  {
    if (!v33)
    {
      int64_t v43 = 0;
      goto LABEL_73;
    }
    id v46 = objc_alloc(MEMORY[0x1E4F598A0]);
    int64_t v47 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    [v47 mainScopeIdentifier];
    id v48 = v33;
    v50 = __int16 v49 = v30;
    int64_t v43 = (PLFakeCPLLibraryManager *)[v46 initWithClientLibraryBaseURL:v49 cloudLibraryStateStorageURL:v79 cloudLibraryResourceStorageURL:v79 libraryIdentifier:v48 mainScopeIdentifier:v50 options:v32];

    int64_t v30 = v49;
    id v33 = v48;
  }

LABEL_73:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_localModeEnabledChanged, @"com.apple.mobileslideshow.cpl.localmodeenabledchanged", 0, (CFNotificationSuspensionBehavior)1028);
  if (v43)
  {
    [(PLCloudPhotoLibraryManager *)self setCPLLibrary:v43];
    uint64_t v54 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    [v54 setDelegate:self];

    int64_t v55 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    [v55 setResourceProgressDelegate:self];

    uint64_t v56 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    [v56 setRecordComputeStateDelegate:self];

    if (!*v7)
    {
      int64_t v57 = self->_libraryMode;
      if (v57 == 2)
      {
        id v58 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v57 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v58 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v61 = v58;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
        [(PLCloudPhotoLibraryManager *)self cplLibrary];
        int64_t v64 = v63 = v30;
        *(_DWORD *)long long buf = 134218242;
        uint64_t v85 = (uint64_t)v62;
        __int16 v86 = 2112;
        id v87 = v64;
        _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "Created cplLibrary (%p) %@", buf, 0x16u);

        int64_t v30 = v63;
      }
    }
  }
  else
  {
    if (!*v7)
    {
      int64_t v59 = self->_libraryMode;
      if (v59 == 2)
      {
        int64_t v60 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v59 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v60 = __CPLSystemLibraryOSLogDomain();
        }
      }
      __int16 v65 = v60;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        int64_t v66 = self->_libraryMode;
        *(_DWORD *)long long buf = 134217984;
        uint64_t v85 = v66;
        _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_ERROR, "Error initializing cloud photo library instance - no library identifier found for library mode: %ld", buf, 0xCu);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _callBlocksWaitingForLibraryOpen];
    self->_unint64_t state = 0;
  }

  if (v43)
  {
LABEL_96:
    id v67 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
    if ([v67 state] == 2)
    {
      if (!*v7)
      {
        int64_t v68 = self->_libraryMode;
        if (v68 == 2)
        {
          id v69 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v68 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v69 = __CPLSystemLibraryOSLogDomain();
          }
        }
        unsigned int v73 = v69;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218242;
          uint64_t v85 = (uint64_t)v67;
          __int16 v86 = 2112;
          id v87 = v67;
          _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_DEFAULT, "CPLLibrary is already open: (%p) %@", buf, 0x16u);
        }
      }
      [(PLCloudPhotoLibraryManager *)self _callBlocksWaitingForLibraryOpen];
      [(PLCloudPhotoLibraryManager *)self _transitionToState:2];
    }
    else
    {
      id v70 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _openCPLLibrary]"];
      if (!*v7)
      {
        int64_t v71 = self->_libraryMode;
        if (v71 == 2)
        {
          id v72 = __CPLAppLibraryOSLogDomain();
        }
        else
        {
          if (v71 == 1) {
            __CPLSyndicationOSLogDomain();
          }
          else {
          id v72 = __CPLSystemLibraryOSLogDomain();
          }
        }
        id v74 = v72;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218242;
          uint64_t v85 = (uint64_t)v67;
          __int16 v86 = 2112;
          id v87 = v67;
          _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_DEFAULT, "Opening cplLibrary: (%p) %@", buf, 0x16u);
        }
      }
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke;
      v80[3] = &unk_1E58648C0;
      v80[4] = self;
      id v81 = v70;
      id v82 = v67;
      id v75 = v70;
      [v82 openWithCompletionHandler:v80];
    }
  }
LABEL_120:
}

void __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2;
  v7[3] = &unk_1E5873A50;
  void v7[4] = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 _runAsyncOnIsolationQueueWithTransaction:v5 block:v7];
}

void __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  int v2 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v3 == 2)
    {
      id v4 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v3 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v4 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v72 = v6;
      __int16 v73 = 2112;
      uint64_t v74 = v6;
      __int16 v75 = 2112;
      id v76 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Opened cplLibrary (%p) %@ %@", buf, 0x20u);
    }
  }
  uint64_t v8 = [*(id *)(a1 + 40) state];
  if (v8 == 3 || v8 == 0)
  {
    if (!*v2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        int v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v15 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        unint64_t v17 = [MEMORY[0x1E4F598A0] stateDescriptionForState:v10];
        *(_DWORD *)long long buf = 134218498;
        uint64_t v72 = v16;
        __int16 v73 = 2112;
        uint64_t v74 = v16;
        __int16 v75 = 2114;
        id v76 = v17;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Opened cplLibrary was already closed by iCPL disable, disregarding: (%p) %@ %{public}@", buf, 0x20u);
      }
    }
  }
  else if (*(void *)(a1 + 48) {
         || ([*(id *)(a1 + 32) libraryServicesManager],
  }
             uint64_t v18 = objc_claimAutoreleasedReturnValue(),
             [v18 databaseContext],
             id v19 = objc_claimAutoreleasedReturnValue(),
             uint64_t v20 = (void *)[v19 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager _openCPLLibrary]_block_invoke"], v19, v18, !v20))
  {
    if (!*v2)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v13 == 2)
      {
        int64_t v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v23 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v72 = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Error opening cloud photo library: %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) _callBlocksWaitingForLibraryOpen];
    [*(id *)(a1 + 32) _transitionToState:0];
  }
  else
  {
    if (!*v2)
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v21 == 2)
      {
        uint64_t v22 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v21 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v22 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v25 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Setting up CPLStatus for CacheDelete support", buf, 2u);
      }
    }
    int64_t v26 = [*(id *)(a1 + 40) syncStatus];
    [*(id *)(a1 + 32) setCPLStatus:v26];
    id v27 = *(void **)(a1 + 32);
    id v28 = [v27 cplLibrary];
    int v29 = [v28 configuration];
    [v27 setCPLConfiguration:v29];

    [*(id *)(a1 + 32) _setupPLCPLPlistInLibrary:v20];
    [*(id *)(a1 + 32) _setReadyForAnalysisWithCPLStatus:v26];
    int64_t v30 = *(void **)(a1 + 32);
    int64_t v31 = [v30 cplConfiguration];
    [v30 _notifyCPLStatus:v26 didChange:0 andCPLConfiguration:v31];

    if (!*v2)
    {
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v32 == 2)
      {
        id v33 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v32 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v33 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v34 = v33;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Creating batch downloader", buf, 2u);
      }
    }
    uint64_t v35 = [PLCloudBatchDownloader alloc];
    id v36 = [*(id *)(a1 + 32) libraryServicesManager];
    uint64_t v37 = [(PLCloudBatchDownloader *)v35 initWithLibraryServicesManager:v36 manager:*(void *)(a1 + 32)];
    uint64_t v38 = *(void *)(a1 + 32);
    uint64_t v39 = *(void **)(v38 + 16);
    *(void *)(v38 + 16) = v37;

    if (!*v2)
    {
      uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v40 == 2)
      {
        int v41 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v40 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v41 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v42 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "Setting up task manager", buf, 2u);
      }
    }
    int64_t v43 = objc_alloc_init(PLCloudTaskManager);
    uint64_t v44 = *(void *)(a1 + 32);
    uint64_t v45 = *(void **)(v44 + 136);
    *(void *)(v44 + 136) = v43;

    id v46 = objc_alloc_init(PLCloudInMemoryTaskManager);
    uint64_t v47 = *(void *)(a1 + 32);
    id v48 = *(void **)(v47 + 248);
    *(void *)(v47 + 248) = v46;

    __int16 v49 = [*(id *)(a1 + 32) cacheDeleteSupport];

    int v50 = *v2;
    if (v49 && !*v2)
    {
      uint64_t v51 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v51 == 2)
      {
        long long v52 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v51 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        long long v52 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v53 = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "CacheDelete support is initialized", buf, 2u);
      }

      int v50 = *v2;
    }
    if (!v50)
    {
      uint64_t v54 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v54 == 2)
      {
        int64_t v55 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v54 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v55 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v56 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "Setting up foreground monitor", buf, 2u);
      }
    }
    if (!*(void *)(*(void *)(a1 + 32) + 96))
    {
      uint64_t v57 = +[PLForegroundMonitor bundleIdentifiersToMonitorForSystemLibrary];
      if (v57)
      {
        id v58 = (void *)v57;
        int64_t v59 = +[PLForegroundMonitor sharedInstance];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_156;
        v70[3] = &unk_1E5865620;
        v70[4] = *(void *)(a1 + 32);
        uint64_t v60 = [v59 startMonitoringBundleIdentifiers:v58 block:v70];
        uint64_t v61 = *(void *)(a1 + 32);
        uint64_t v62 = *(void **)(v61 + 64);
        *(void *)(v61 + 64) = v60;
      }
    }
    id v63 = +[PLForegroundMonitor sharedInstance];
    int64_t v64 = PLCameraBundleIdentifiers();
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2_158;
    v69[3] = &unk_1E5865620;
    v69[4] = *(void *)(a1 + 32);
    uint64_t v65 = [v63 startMonitoringBundleIdentifiers:v64 block:v69];
    uint64_t v66 = *(void *)(a1 + 32);
    id v67 = *(void **)(v66 + 72);
    *(void *)(v66 + 72) = v65;

    int64_t v68 = [*(id *)(a1 + 32) resourceManager];
    [v68 startAutomaticPrefetchAndPruneWithTimeout:1];

    *(unsigned char *)(*(void *)(a1 + 32) + 91) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 89) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    [*(id *)(a1 + 32) _runOneTimeMigrationStepsWithoutiCPLIfNecessary];
    [*(id *)(a1 + 32) _callBlocksWaitingForLibraryOpen];
    [*(id *)(a1 + 32) _transitionToState:2];
  }
}

uint64_t __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _appWithBundleIdentifier:a2 changedStateToForeground:a3];
}

uint64_t __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2_158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cameraChangedStateToForeground:");
}

- (void)_enableiCPL
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v74 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager _enableiCPL]"];
  if (!self->_libraryMode)
  {
    id v4 = (void *)MEMORY[0x1E4F8B980];
    uint64_t v5 = [(PLCloudPhotoLibraryManager *)self pathManager];
    uint64_t v6 = [v5 libraryURL];
    LOBYTE(v4) = [v4 isSystemPhotoLibraryURL:v6];

    if ((v4 & 1) == 0)
    {
      __int16 v73 = [MEMORY[0x1E4F28B00] currentHandler];
      [v73 handleFailureInMethod:a2, self, @"PLCloudPhotoLibraryManager.m", 629, @"Invalid parameter not satisfying: %@", @"[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:self.pathManager.libraryURL]" object file lineNumber description];
    }
  }
  uint64_t v7 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_121);
  uint64_t v8 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x3032000000;
  id v83 = __Block_byref_object_copy__12675;
  int64_t v84 = __Block_byref_object_dispose__12676;
  id v85 = 0;
  if ([(PLCloudPhotoLibraryManager *)self _libraryModeSupportsEnableiCPL])
  {
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_122;
    v77[3] = &unk_1E586DD98;
    id v79 = &v80;
    char v78 = v7;
    [v8 enableMainScopeWithCompletionHandler:v77];
  }
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41022 userInfo:0];
    uint64_t v10 = (void *)v81[5];
    v81[5] = v9;

    v7[2](v7);
  }
  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!v81[5])
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v15 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v15 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v18 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Updating iCPL markers", buf, 2u);
      }
    }
    id v19 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v20 = [v19 libraryBundle];
    uint64_t v16 = [v20 indicatorFileCoordinator];

    [v16 updateICloudPhotosMarkerForEnable:1];
    uint64_t v21 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v22 = [v21 databaseContext];
    uint64_t v23 = (void *)[v22 newShortLivedCplLibraryWithNameSuffix:"-[PLCloudPhotoLibraryManager _enableiCPL]"];

    self->_icplEnabled = 1;
    uint64_t v24 = objc_alloc_init(PLCloudPhotoLibraryUploadTracker);
    uploadTracker = self->_uploadTracker;
    self->_uploadTracker = v24;

    int64_t v26 = [PLCloudBatchUploader alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    id v28 = [(PLCloudBatchUploader *)v26 initWithLibraryServicesManager:WeakRetained];
    uploader = self->_uploader;
    self->_uploader = v28;

    int v30 = [MEMORY[0x1E4F59940] cplShouldGenerateDerivatives];
    int v31 = v30;
    if (*v11) {
      int v32 = 0;
    }
    else {
      int v32 = v30;
    }
    if (v32 == 1)
    {
      int64_t v33 = self->_libraryMode;
      if (v33 == 2)
      {
        uint64_t v34 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v33 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v34 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v35 = v34;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "CPLShouldGenerateDerivatives is set to YES", buf, 2u);
      }
    }
    [(PLCloudBatchUploader *)self->_uploader setShouldGenerateDerivatives:v31 ^ 1u];
    id v36 = [v23 globalValues];
    int v37 = [v36 hasCloudInitialUploadCompleted];

    if (!*v11)
    {
      int64_t v38 = self->_libraryMode;
      if (v38 == 2)
      {
        uint64_t v39 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v38 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v39 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v40 = v39;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = @"YES";
        if (v37) {
          int v41 = @"NO";
        }
        *(_DWORD *)long long buf = 138543362;
        id v87 = v41;
        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Setting initial upload to: %{public}@", buf, 0xCu);
      }
    }
    [(PLCloudBatchUploader *)self->_uploader setInitialUpload:v37 ^ 1u];
    if (!*v11)
    {
      int64_t v42 = self->_libraryMode;
      if (v42 == 2)
      {
        int64_t v43 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v42 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v43 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v44 = v43;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Setting up cloud change tracker", buf, 2u);
      }
    }
    uint64_t v45 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    id v46 = [v45 libraryBundle];
    uint64_t v47 = [v46 persistentContainer];
    id v48 = [v47 sharedPersistentStoreCoordinator];

    __int16 v49 = [PLCloudPersistentHistoryChangeTracker alloc];
    int v50 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
    uint64_t v51 = [v50 libraryBundle];
    long long v52 = [(PLCloudPersistentHistoryChangeTracker *)v49 initWithPersistentStoreCoordinator:v48 libraryBundle:v51];
    syncChangeTracker = self->_syncChangeTracker;
    self->_syncChangeTracker = v52;

    [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker setDelegate:self];
    if (!*v11)
    {
      int64_t v54 = self->_libraryMode;
      if (v54 == 2)
      {
        int64_t v55 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v54 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int64_t v55 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v56 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = [(PLCloudPersistentHistoryChangeTracker *)self->_syncChangeTracker name];
        *(_DWORD *)long long buf = 138412290;
        id v87 = v57;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "Cloud change tracker: %@", buf, 0xCu);
      }
    }
    id v58 = [v23 managedObjectContext];
    BOOL v59 = [(PLCloudPhotoLibraryManager *)self _connectToCloudChangeTrackerWithContext:v58];

    if (*v11) {
      char v60 = 1;
    }
    else {
      char v60 = v59;
    }
    if ((v60 & 1) == 0)
    {
      int64_t v61 = self->_libraryMode;
      if (v61 == 2)
      {
        uint64_t v62 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v61 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v62 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v63 = v62;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "Failed to connect to change tracker", buf, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _startLibraryScopeRulesChangeTrackerInQueue];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_photosPreferencesChanged, @"com.apple.mobileslideshow.PreferenceChanged", 0, (CFNotificationSuspensionBehavior)1028);
    [(PLCloudPhotoLibraryManager *)self _updatePendingResetSyncDate];
    if (![(PLCloudPhotoLibraryManager *)self isReadyForAnalysis]
      && [(PLCloudPhotoLibraryManager *)self currentResetSyncType] != 1)
    {
      [(PLCloudPhotoLibraryManager *)self _disableOpportunisticTasks];
    }
    if (!*v11)
    {
      int64_t v65 = self->_libraryMode;
      if (v65 == 2)
      {
        uint64_t v66 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v65 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v66 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v67 = v66;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "Resetting counts", buf, 2u);
      }
    }
    [(PLCloudPhotoLibraryManager *)self _setToDownloadCountsForImages:0 videos:0];
    self->_unint64_t boundForUploadingVideos = -1;
    self->_unint64_t boundForUploadingOtherItems = -1;
    self->_unint64_t boundForUploadingPhotos = -1;
    objc_initWeak((id *)buf, self);
    int64_t v68 = (void *)MEMORY[0x1E4F8A220];
    uploadDownloadCountQueue = self->_uploadDownloadCountQueue;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_141;
    v75[3] = &unk_1E5864898;
    void v75[4] = self;
    objc_copyWeak(&v76, (id *)buf);
    id v70 = [v68 setCoalescerWithLabel:@"com.apple.photos.uploaddownloadcount" queue:uploadDownloadCountQueue action:v75];
    uploadDownloadCountCoalescer = self->_uploadDownloadCountCoalescer;
    self->_uploadDownloadCountCoalescer = v70;

    LODWORD(v68) = [v16 isICloudPhotosPaused];
    self->_int pauseReason = [v16 currentPauseReason];
    if (v68)
    {
      if ([(PLCloudPhotoLibraryManager *)self _setupTimerForUnpause]) {
        uint64_t v72 = 8;
      }
      else {
        uint64_t v72 = 3;
      }
    }
    else
    {
      uint64_t v72 = 3;
    }
    [(PLCloudPhotoLibraryManager *)self _transitionToState:v72];
    [(PLCloudPhotoLibraryManager *)self _initializeMasterAndSizeCalculationinLibrary:v23];
    [(PLCloudPhotoLibraryManager *)self _updateTransferCountsInLibrary:v23];
    [(PLCloudPhotoLibraryManager *)self _checkForPushedMastersInLibrary:v23];
    [(PLCloudPhotoLibraryManager *)self _runOneTimeMigrationStepsIfNecessaryInLibrary:v23];
    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);

    goto LABEL_105;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t v12 = self->_libraryMode;
    if (v12 == 2)
    {
      uint64_t v13 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v12 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v13 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v16 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v17 = (__CFString *)v81[5];
      *(_DWORD *)long long buf = 138412290;
      id v87 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to enable main scope: %@", buf, 0xCu);
    }
LABEL_105:
  }
  [v74 stillAlive];
  _Block_object_dispose(&v80, 8);
}

void __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_122(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_141(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v6 = [v5 databaseContext];
  uint64_t v7 = (void *)[v6 newShortLivedLibraryWithName:"com.apple.photos.uploaddownloadcount.coalescer"];

  uint64_t v8 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      uint64_t v10 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v9 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v10 = __CPLSystemLibraryOSLogDomain();
      }
    }
    uint64_t v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Revalidate unpushed/pushed asset count on idle", buf, 2u);
    }
  }
  int64_t v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v14 = [WeakRetained _hasItemToDownload];

  if (v14)
  {
    if (!*v8)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v15 == 2)
      {
        uint64_t v16 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v15 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v16 = __CPLSystemLibraryOSLogDomain();
        }
      }
      unint64_t v17 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Recalculate updateTransferCounts", v20, 2u);
      }
    }
    id v18 = objc_loadWeakRetained(v12);
    [v18 _updateTransferCountsInLibrary:v7];
  }
  id v19 = objc_loadWeakRetained(v12);

  if (v19) {
    [v4 delayNextInvocationByTimeInterval:60.0];
  }
}

- (BOOL)_hasItemToDownload
{
  int v2 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  uint64_t v3 = [v2 libraryBundle];
  id v4 = [v3 indicatorFileCoordinator];

  LOBYTE(v2) = [v4 hasItemToDownload];
  return (char)v2;
}

- (id)recoveryManager
{
  return (id)[(PLLazyObject *)self->_lazyRecoveryManager objectValue];
}

- (void)_updateBackupExclusionPathsAfterRemoveCPLDirectory
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self pathManager];
  int v4 = [v3 isUBF];

  if (v4)
  {
    if ([(PLCloudPhotoLibraryManager *)self _shouldResetICloudBackupExclusionPaths])
    {
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(PLCloudPhotoLibraryManager *)self pathManager];
  [v6 updateBackupExclusionPathsForBackupType:v5];
}

- (BOOL)_shouldResetICloudBackupExclusionPaths
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  uint64_t v3 = [(PLCloudPhotoLibraryManager *)self pathManager];
  if ([v3 isDeviceRestoreSupported] && self->_libraryMode == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    unint64_t v5 = ((unint64_t)[WeakRetained createOptions] >> 5) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_initDeviceLibraryConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_libraryMode)
  {
    CFIndex v3 = 0;
    self->_unint64_t deviceLibraryConfiguration = 0;
LABEL_3:
    self->_unint64_t pendingDeviceLibraryConfiguration = v3;
    return;
  }
  id v12 = 0;
  CFIndex v3 = PLGetCPLDeviceLibraryConfiguration(&v12);
  id v4 = v12;
  self->_unint64_t deviceLibraryConfiguration = v3;
  if (!v4) {
    goto LABEL_3;
  }
  unint64_t v5 = v4;
  if ([v4 integerValue] == self->_deviceLibraryConfiguration)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        uint64_t v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
        if (deviceLibraryConfiguration > 2) {
          uint64_t v10 = @"unknown";
        }
        else {
          uint64_t v10 = off_1E586C1D0[deviceLibraryConfiguration];
        }
        uint64_t v11 = v10;
        *(_DWORD *)long long buf = 138412290;
        int v14 = v11;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Clearing pending device-library configuration on init because it is the same as the current configuration: %@", buf, 0xCu);
      }
    }
    PLSetPendingCPLDeviceLibraryConfiguration(0);
  }
  self->_unint64_t pendingDeviceLibraryConfiguration = [v5 integerValue];
}

- (BOOL)_libraryModeSupportsEnableiCPL
{
  unint64_t libraryMode = self->_libraryMode;
  return (libraryMode & 1) == 0 && libraryMode < 3;
}

- (void)_initCPLLibraryMode
{
  p_libraryServicesManager = &self->_libraryServicesManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  char v5 = [WeakRetained isSystemPhotoLibrary];

  if (v5)
  {
    int64_t v6 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    char v8 = [v7 isSyndicationPhotoLibrary];

    if (v8)
    {
      int64_t v6 = 1;
    }
    else
    {
      id v9 = objc_loadWeakRetained((id *)p_libraryServicesManager);
      int v10 = [v9 isAppPhotoLibrary];

      if (!v10) {
        return;
      }
      int64_t v6 = 2;
    }
  }
  self->_unint64_t libraryMode = v6;
}

- (void)_initRecoveryManager
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFIndex v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyRecoveryManager) {
      id v4 = @"non-null";
    }
    else {
      id v4 = @"null";
    }
    *(_DWORD *)long long buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy recoveryManager, was %{public}@", buf, 0xCu);
  }

  id v5 = objc_initWeak((id *)buf, self);
  id v6 = objc_alloc(MEMORY[0x1E4F8B948]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PLCloudPhotoLibraryManager__initRecoveryManager__block_invoke;
  v9[3] = &unk_1E5874070;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = (PLLazyObject *)[v6 initWithBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  lazyRecoveryManager = self->_lazyRecoveryManager;
  self->_lazyRecoveryManager = v7;
}

PLManagedAssetRecoveryManager *__50__PLCloudPhotoLibraryManager__initRecoveryManager__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = [PLManagedAssetRecoveryManager alloc];
    CFIndex v3 = [WeakRetained libraryServicesManager];
    id v4 = [(PLManagedAssetRecoveryManager *)v2 initWithLibraryServicesManager:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_resetResourceManager
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFIndex v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ %p _resetResourceManager", (uint8_t *)&v4, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudPhotoLibraryManager *)self invalidateResourceManager];
  [(PLCloudPhotoLibraryManager *)self _initResourceManager];
}

- (id)resourceManager
{
  return (id)[(PLLazyObject *)self->_lazyResourceManager objectValue];
}

- (void)_initResourceManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFIndex v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyResourceManager) {
      int v4 = @"non-null";
    }
    else {
      int v4 = @"null";
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy resourceManager, was %{public}@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (PLPlatformSharedAlbumAndiCPLPrefetchSupported())
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int64_t libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __int16 v6 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (libraryMode == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        __int16 v6 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Setting up resource manager", buf, 2u);
      }
    }
    id v8 = objc_initWeak((id *)buf, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __50__PLCloudPhotoLibraryManager__initResourceManager__block_invoke;
    v12[3] = &unk_1E5874070;
    objc_copyWeak(&v13, (id *)buf);
    id v10 = (PLLazyObject *)[v9 initWithBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    lazyResourceManager = self->_lazyResourceManager;
    self->_lazyResourceManager = v10;
  }
}

PLCloudResourceManager *__50__PLCloudPhotoLibraryManager__initResourceManager__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = [PLCloudResourceManager alloc];
    CFIndex v3 = [WeakRetained libraryServicesManager];
    int v4 = [(PLCloudResourceManager *)v2 initWithCPLManager:WeakRetained libraryServicesManager:v3];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_resetCacheDeleteSupport
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFIndex v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ %p _resetCacheDeleteSupport", (uint8_t *)&v4, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  [(PLCloudPhotoLibraryManager *)self invalidateCacheDeleteSupport];
  [(PLCloudPhotoLibraryManager *)self _initCacheDeleteSupport];
}

- (id)cacheDeleteSupport
{
  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  if (!lazyCacheDeleteSupport)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLCloudPhotoLibraryManager.m", 517, @"Invalid parameter not satisfying: %@", @"_lazyCacheDeleteSupport != nil" object file lineNumber description];

    lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  }
  int v4 = [(PLLazyObject *)lazyCacheDeleteSupport objectValue];
  if (!v4)
  {
    uint64_t v5 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager requesting cacheDeleteSupport after it has been invalidated", buf, 2u);
    }
  }
  return v4;
}

- (void)_initCacheDeleteSupport
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFIndex v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyCacheDeleteSupport) {
      int v4 = @"non-null";
    }
    else {
      int v4 = @"null";
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy cacheDeleteSupport, was %{public}@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v6 = objc_initWeak((id *)buf, self);

  id v7 = objc_alloc(MEMORY[0x1E4F8B948]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PLCloudPhotoLibraryManager__initCacheDeleteSupport__block_invoke;
  v11[3] = &unk_1E5870860;
  objc_copyWeak(&v13, (id *)buf);
  id v8 = WeakRetained;
  id v12 = v8;
  id v9 = (PLLazyObject *)[v7 initWithBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  self->_lazyCacheDeleteSupport = v9;
}

PLCacheDeleteSupport *__53__PLCloudPhotoLibraryManager__initCacheDeleteSupport__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CFIndex v3 = [PLCacheDeleteSupport alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [WeakRetained cplStatus];
    id v6 = [(PLCacheDeleteSupport *)v3 initWithLibraryServicesManager:v4 cplStatus:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PLPhotoLibraryPathManager)pathManager
{
  int v2 = [(PLCloudPhotoLibraryManager *)self libraryServicesManager];
  CFIndex v3 = [v2 pathManager];

  return (PLPhotoLibraryPathManager *)v3;
}

- (void)enableiCPLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      id v6 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      id v6 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Enabling iCPL", buf, 2u);
    }
  }
  id v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager enableiCPLWithCompletionHandler:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PLCloudPhotoLibraryManager_enableiCPLWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E58742F0;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(PLCloudPhotoLibraryManager *)self _runAsyncOnIsolationQueueWithTransaction:v8 block:v10];
}

void __62__PLCloudPhotoLibraryManager_enableiCPLWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) libraryServicesManager];
  CFIndex v3 = [v2 libraryBundle];
  id v4 = [v3 indicatorFileCoordinator];

  [v4 logCloudServiceEnableEvent:1 serviceName:@"CPL" reason:0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 89))
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = *(void *)(v5 + 96);
      if (v6 == 2)
      {
        id v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v6 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v12 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "iCPL already enabled, skip enabling again", (uint8_t *)&v18, 2u);
      }
    }
  }
  else if (*(void *)(v5 + 80) == 6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v8 = *(void *)(v5 + 96);
      if (v8 == 2)
      {
        id v9 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v8 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v9 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Checking enable state while idle", (uint8_t *)&v18, 2u);
      }

      uint64_t v5 = *(void *)(a1 + 32);
    }
    [(id)v5 _checkEnableState];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v10 = *(void *)(v5 + 96);
      if (v10 == 2)
      {
        id v11 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v10 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v11 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v14 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 32) _debugNameForState:*(void *)(*(void *)(a1 + 32) + 80)];
        int v18 = 138412290;
        id v19 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Currently in state %@, will check enable state while idle", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v5 + 88) = 1;
    uint64_t v16 = *(void **)(a1 + 32);
    if (!v16[10]) {
      [v16 _transitionToState:1];
    }
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(void))(v17 + 16))();
  }
}

- (int64_t)sizeOfResourcesToUploadByCPL:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PLCloudPhotoLibraryManager *)self cplLibrary];
  uint64_t v5 = v4;
  if (v4 && [v4 state] == 2)
  {
    int64_t v6 = [v5 sizeOfResourcesToUpload];
  }
  else
  {
    if (a3)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F59778];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      v12[0] = @"CPL hasn't been setup yet";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a3 = [v7 errorWithDomain:v8 code:2 userInfo:v9];
    }
    int64_t v6 = -1;
  }

  return v6;
}

- (void)setCPLLibrary:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

void __44__PLCloudPhotoLibraryManager_setCPLLibrary___block_invoke(uint64_t a1)
{
}

- (id)cplLibrary
{
  int v2 = PLResultWithUnfairLock();
  return v2;
}

id __40__PLCloudPhotoLibraryManager_cplLibrary__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 104);
}

- (void)invalidateUploadDownloadCountCoalescer
{
  [(PFCoalescer *)self->_uploadDownloadCountCoalescer resetAndShutDown];
  uploadDownloadCountCoalescer = self->_uploadDownloadCountCoalescer;
  self->_uploadDownloadCountCoalescer = 0;
}

- (void)invalidateRecoveryManager
{
}

- (void)invalidateCacheDeleteSupport
{
}

uint64_t __58__PLCloudPhotoLibraryManager_invalidateCacheDeleteSupport__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)invalidateResourceManager
{
}

uint64_t __55__PLCloudPhotoLibraryManager_invalidateResourceManager__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)invalidate
{
  id v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int64_t libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      uint64_t v5 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (libraryMode == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v5 = __CPLSystemLibraryOSLogDomain();
      }
    }
    int64_t v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "invalidate PLCloudPhotoLibraryManager, will invalidate resourceManager, cacheDeleteSupport, recoveryManager, and uploadDownloadCountCoalescer.", buf, 2u);
    }
  }
  [(PLCloudPhotoLibraryManager *)self invalidateResourceManager];
  [(PLCloudPhotoLibraryManager *)self invalidateCacheDeleteSupport];
  [(PLCloudPhotoLibraryManager *)self invalidateRecoveryManager];
  [(PLCloudPhotoLibraryManager *)self invalidateUploadDownloadCountCoalescer];
  if (!*v3)
  {
    int64_t v7 = self->_libraryMode;
    if (v7 == 2)
    {
      uint64_t v8 = __CPLAppLibraryOSLogDomain();
    }
    else
    {
      if (v7 == 1) {
        __CPLSyndicationOSLogDomain();
      }
      else {
      uint64_t v8 = __CPLSystemLibraryOSLogDomain();
      }
    }
    id v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager invalidation complete", v10, 2u);
    }
  }
}

- (PLCloudPhotoLibraryManager)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PLCloudPhotoLibraryManager;
  id v6 = [(PLCloudPhotoLibraryManager *)&v35 init];
  if (v6)
  {
    if ((PLIsAssetsd() & 1) == 0 && (PLIsInternalTool() & 1) == 0)
    {
      int v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:v6 file:@"PLCloudPhotoLibraryManager.m" lineNumber:358 description:@"only assetsd"];
    }
    objc_storeWeak((id *)v6 + 58, v5);
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v7 = *((void *)v6 + 12);
      if (v7 == 2)
      {
        uint64_t v8 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v7 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v8 = __CPLSystemLibraryOSLogDomain();
        }
      }
      id v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Initialize PLCPLLibraryManager", buf, 2u);
      }
    }
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = pl_dispatch_queue_create_with_fallback_qos();
    id v12 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v11;

    dispatch_queue_t v13 = dispatch_queue_create("upload-download-count-update", 0);
    int v14 = (void *)*((void *)v6 + 25);
    *((void *)v6 + 25) = v13;

    uint64_t v15 = PLCloudCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.plcplstatus", v15);
    uint64_t v17 = (void *)*((void *)v6 + 33);
    *((void *)v6 + 33) = v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = (void *)*((void *)v6 + 36);
    *((void *)v6 + 36) = v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = (void *)*((void *)v6 + 39);
    *((void *)v6 + 39) = v20;

    *((_DWORD *)v6 + 87) = 0;
    *((void *)v6 + 40) = 0;
    uint64_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v23 = pl_dispatch_queue_create_with_fallback_qos();
    uint64_t v24 = (void *)*((void *)v6 + 50);
    *((void *)v6 + 50) = v23;

    *((unsigned char *)v6 + 344) = 0;
    *((void *)v6 + 55) = 0;
    [v6 _initCPLLibraryMode];
    [v6 _initDeviceLibraryConfiguration];
    [v6 _initRecoveryManager];
    id v25 = *((void *)v6 + 7);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke;
    block[3] = &unk_1E5875CE0;
    id v26 = v6;
    id v33 = v26;
    dispatch_async(v25, block);
    id v27 = [v5 cplReadiness];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2;
    v30[3] = &unk_1E5875CE0;
    id v31 = v26;
    [v27 performOnceLibraryIsReadyForCPLManager:v30];
  }
  return (PLCloudPhotoLibraryManager *)v6;
}

uint64_t __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initCacheDeleteSupport];
  int v2 = *(void **)(a1 + 32);
  return [v2 _initResourceManager];
}

void __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80) != 9) {
    *(void *)(v2 + 80) = 0;
  }
  id v3 = +[PLAccountStore pl_sharedAccountStore];
  id v4 = [v3 cachedPrimaryAppleAccount];

  if (v4)
  {
    int v5 = PLIsEDUMode();
    id v6 = *(void **)(a1 + 32);
    if (v5 && !v6[12])
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        uint64_t v7 = __CPLSystemLibraryOSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v4 appleID];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v22 = v8;
          _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "EDU Mode: Registering user switch stakeholder for user: %@", buf, 0xCu);
        }
      }
      id v9 = objc_alloc_init(PLCloudPhotoLibraryUserSwitchHandler);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 272);
      *(void *)(v10 + 272) = v9;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "setSessionHandler:");
      id v6 = *(void **)(a1 + 32);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_82;
    v19[3] = &unk_1E5875CE0;
    id v20 = v6;
    [v20 _runSyncOnIsolationQueueWithBlock:v19];
    id v12 = v20;
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v13 == 2)
      {
        int v14 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v13 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        int v14 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "No Apple Account, skip opening cloud photo library at init time", buf, 2u);
      }
    }
    id v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudPhotoLibraryManager initWithLibraryServicesManager:]_block_invoke"];
    dispatch_queue_t v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2_84;
    v17[3] = &unk_1E5875CE0;
    id v18 = v16;
    [v18 _runAsyncOnIsolationQueueWithTransaction:v12 block:v17];
  }
}

uint64_t __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_82(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 80))
  {
    uint64_t v2 = result;
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v3 = *(void *)(v1 + 96);
      if (v3 == 2)
      {
        id v4 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v3 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v4 = __CPLSystemLibraryOSLogDomain();
        }
      }
      int v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Opening CPL library after ready for CPL", v6, 2u);
      }

      uint64_t v1 = *(void *)(v2 + 32);
    }
    *(void *)(v1 + 80) = 1;
    return [*(id *)(v2 + 32) _openCPLLibrary];
  }
  return result;
}

void __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2_84(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v3 = [v2 libraryBundle];
  id v4 = [v3 indicatorFileCoordinator];

  if ([v4 isDisableICloudPhotos])
  {
    int v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v6 == 2)
      {
        uint64_t v7 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v6 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        uint64_t v7 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Found disable marker, will reset and stop Cloud Photo Library", buf, 2u);
      }
    }
    id v9 = [*(id *)(a1 + 32) libraryServicesManager];
    [v9 setICloudPhotosEnabledInternal:0];

    uint64_t v10 = [*(id *)(a1 + 32) cacheDeleteSupport];

    if (v10 && !*v5)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        id v12 = __CPLAppLibraryOSLogDomain();
      }
      else
      {
        if (v11 == 1) {
          __CPLSyndicationOSLogDomain();
        }
        else {
        id v12 = __CPLSystemLibraryOSLogDomain();
        }
      }
      uint64_t v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "No user account, but cacheDeleteSupport is now available", v14, 2u);
      }
    }
    [*(id *)(a1 + 32) _disableiCPLWillBecomeNonSyncablePhotoLibrary:0 resetMode:2];
  }
  else
  {
    [*(id *)(a1 + 32) _callBlocksWaitingForLibraryOpen];
  }
}

+ (BOOL)needResetSyncErrorType:(id)a3
{
  id v3 = a3;
  char v4 = 1;
  if (([v3 isCPLErrorWithCode:1] & 1) == 0)
  {
    if ([v3 isCPLErrorWithCode:20]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 isCPLErrorWithCode:21];
    }
  }
  if ([v3 isCPLErrorWithCode:1])
  {
    int v5 = @"Library version mismatch";
LABEL_11:
    [MEMORY[0x1E4F59938] registerLikelyResetReason:v5];
    goto LABEL_12;
  }
  if ([v3 isCPLErrorWithCode:20])
  {
    int v5 = @"Client cache is invalid";
    goto LABEL_11;
  }
  if ([v3 isCPLErrorWithCode:21])
  {
    int v5 = @"Cloud cache is invalid";
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

+ (id)_lastKnownCloudVersionInLibrary:(id)a3
{
  id v3 = a3;
  char v4 = [PLGlobalValues alloc];
  int v5 = [v3 managedObjectContext];

  uint64_t v6 = [(PLGlobalValues *)v4 initWithManagedObjectContext:v5];
  uint64_t v7 = [(PLGlobalValues *)v6 cloudTrackerLastKnownCloudVersion];

  return v7;
}

+ (id)descriptionForResourceType:(unint64_t)a3
{
  return (id)[MEMORY[0x1E4F59940] descriptionForResourceType:a3];
}

@end