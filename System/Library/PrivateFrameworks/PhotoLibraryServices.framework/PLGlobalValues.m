@interface PLGlobalValues
+ (id)searchIndexSpotlightClientStateDataWithDictionary:(id)a3;
+ (id)searchIndexSpotlightClientStateDictionaryWithIdentifier:(id)a3 timestamp:(id)a4;
+ (id)searchIndexSpotlightClientStateWithData:(id)a3;
+ (void)setJournalRebuildRequired:(BOOL)a3 managedObjectContext:(id)a4;
+ (void)setLibraryCreateOptions:(unint64_t)a3 managedObjectContext:(id)a4;
+ (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3 managedObjectContext:(id)a4;
- (BOOL)_isNewLibraryOrRebuildWithPathManager:(id)a3;
- (BOOL)backgroundJobServiceNeedsProcessing;
- (BOOL)didImportFileSystemAssets;
- (BOOL)hasCloudInitialUploadCompleted;
- (BOOL)isInitialDuplicateDetectorProcessingCompleted;
- (BOOL)isJournalRebuildRequired;
- (BOOL)isRebuildComplete;
- (BOOL)isSearchIndexRebuildFinished;
- (BOOL)markRebuildPhaseCompleted:(unint64_t)a3;
- (BOOL)rebuildWorkIsRequiredForEntity:(unint64_t)a3;
- (BOOL)shouldDropGlobalSpotlightIndexForLibraryIdentifier:(int64_t)a3;
- (BOOL)shouldPrefetchWidgetResources;
- (NSDate)_deprecated_lastFullIndexSyndicationSyncDate;
- (NSDate)dateOfLastExternalAvailabilitySignal;
- (NSDate)inProgressFullIndexSyndicationSyncDate;
- (NSDate)lastAttachmentSyndicationSyncDate;
- (NSDate)lastChatSyndicationSyncDate;
- (NSDate)lastCompletePrefetchDate;
- (NSDate)lastDeleteSyndicationSyncDate;
- (NSDate)lastFullIndexSyndicationSyncStartDate;
- (NSDate)libraryReadyForAnalysisDate;
- (NSDate)locationOfInterestUpdateDate;
- (NSDate)mediaAnalysisEmbeddingVersionBumpDate;
- (NSDate)memoriesCreationPreviewAvailableDate;
- (NSDate)searchFeatureReadyDate;
- (NSDate)searchIndexRebuildEndDate;
- (NSDate)searchIndexRebuildStartDate;
- (NSDate)syndicationPrefetchDownloadThrottlingDate;
- (NSDate)syndicationStartDate;
- (NSDate)timeOfLastFeatureAvailabilityJob;
- (NSDictionary)featureAvailability;
- (NSDictionary)greenValues;
- (NSDictionary)searchIndexSpotlightClientState;
- (NSManagedObjectContext)moc;
- (NSManagedObjectID)searchIndexRebuildResumeObjectID;
- (NSNumber)featureAvailabilityJobDidFail;
- (NSNumber)greenTeaContactsAuthorization;
- (NSNumber)guestAssetSyncStatus;
- (NSNumber)mediaAnalysisEmbeddingVersion;
- (NSNumber)orphanedSceneClassificationsCount;
- (NSNumber)searchFeatureReadyFraction;
- (NSNumber)searchIndexEmbeddingModelVersion;
- (NSNumber)searchIndexFeatureSettings;
- (NSNumber)searchIndexRebuildCoalescedReasons;
- (NSNumber)searchIndexRebuildRequiredExternalReasons;
- (NSNumber)searchIndexSpotlightClientStateMismatchedCount;
- (NSNumber)searchIndexSpotlightClientStateMissingCount;
- (NSNumber)searchIndexStatus;
- (NSNumber)searchIndexUtilityTypeClassifierVersion;
- (NSNumber)searchIndexVersion;
- (NSPersistentHistoryToken)cloudTrackerLastKnownToken;
- (NSPersistentHistoryToken)lastDuplicateDetectorProcessingToken;
- (NSPersistentHistoryToken)lastGuestAssetSyncToken;
- (NSPersistentHistoryToken)lastInitialDuplicateDetectorProcessingCompletedToken;
- (NSPersistentHistoryToken)lastPersonSyncToken;
- (NSPersistentHistoryToken)lastSharedAssetContainerProcessingToken;
- (NSPersistentHistoryToken)libraryScopeRulesTrackerLastKnownToken;
- (NSString)cloudTrackerLastKnownCloudVersion;
- (NSString)guestAssetInitialSyncResumeMarker;
- (NSString)lastGuestAssetSyncTargetLibraryPath;
- (NSString)lastPersonSyncSourceLibraryPath;
- (NSString)lastUpdatedGraphLabelsAgainstPLSImageUUID;
- (NSString)localeIdentifier;
- (NSString)lockedResourceTransitionAssetUUID;
- (NSString)searchIndexLocaleIdentifier;
- (NSString)searchIndexRebuildResumeMarker;
- (NSString)searchIndexSceneTaxonomySHA;
- (PLGlobalValues)initWithManagedObjectContext:(id)a3;
- (double)searchIndexRebuildTimeIsRebuildInProgress:(BOOL *)a3;
- (double)searchIndexUptimeIsRebuildInProgress:(BOOL *)a3;
- (double)syndicationSyncRangeDenominator;
- (id)_getValueUsingPerformBlockAndWait:(id)a3;
- (id)_lastKnownTransactionTokenWithTransactionNumberKey:(id)a3 andStoreUUIDKey:(id)a4;
- (id)searchIndexSpotlightClientStateData;
- (int64_t)importFilesystemAssetsState;
- (unint64_t)libraryCreateOptions;
- (unint64_t)searchIndexRebuildReasonsWithSceneTaxonomyDigests:(id)a3 spotlightRequestedRebuild:(BOOL)a4 pathManager:(id)a5;
- (unint64_t)searchIndexingEntityToRebuild;
- (unint64_t)unpackedSearchIndexFeatureSettings;
- (unint64_t)unpackedSearchIndexRebuildCoalescedReasons;
- (unint64_t)unpackedSearchIndexRebuildRequiredExternalReasons;
- (unint64_t)unpackedSearchIndexStatus;
- (void)_setBackgroundJobServiceNeedsProcessing:(BOOL)a3;
- (void)_setImportFilesystemAssetsState:(int64_t)a3;
- (void)_setLastKnownTransactionToken:(id)a3 withTransactionNumberKey:(id)a4 andStoreUUIDKey:(id)a5;
- (void)_setRebuildComplete;
- (void)_setValueUsingPerformBlockAndWait:(id)a3 responsibleCaller:(const char *)a4;
- (void)addRebuildRequiredExternalReasons:(unint64_t)a3;
- (void)addSearchIndexRebuildCoalescedReasons:(unint64_t)a3;
- (void)clearRebuildFinishedFlags;
- (void)dontImportFileSystemDataIntoDatabase;
- (void)incrementSpotlightClientStateMismatchedCount;
- (void)incrementSpotlightClientStateMissingCount;
- (void)resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:(id)a3;
- (void)setBackgroundJobServiceNeedsProcessing:(BOOL)a3;
- (void)setCloudInitialUploadCompleted:(BOOL)a3;
- (void)setCloudTrackerLastKnownCloudVersion:(id)a3;
- (void)setCloudTrackerLastKnownToken:(id)a3;
- (void)setDateOfLastExternalAvailabilitySignal:(id)a3;
- (void)setFeatureAvailability:(id)a3;
- (void)setFeatureAvailabilityJobDidFail:(id)a3;
- (void)setGreenTeaContactsAuthorization:(id)a3;
- (void)setGreenValues:(id)a3;
- (void)setGuestAssetInitialSyncResumeMarker:(id)a3;
- (void)setGuestAssetSyncStatus:(id)a3;
- (void)setImportFilesystemAssetsState:(int64_t)a3;
- (void)setInProgressFullIndexSyndicationSyncDate:(id)a3;
- (void)setJournalRebuildRequired:(BOOL)a3;
- (void)setLastAttachmentSyndicationSyncDate:(id)a3;
- (void)setLastChatSyndicationSyncDate:(id)a3;
- (void)setLastCompletePrefetchDate:(id)a3;
- (void)setLastDeleteSyndicationSyncDate:(id)a3;
- (void)setLastDuplicateDetectorProcessingToken:(id)a3;
- (void)setLastFullIndexSyndicationSyncStartDate:(id)a3;
- (void)setLastGuestAssetSyncTargetLibraryPath:(id)a3;
- (void)setLastGuestAssetSyncToken:(id)a3;
- (void)setLastInitialDuplicateDetectorProcessingCompletedToken:(id)a3;
- (void)setLastPersonSyncSourceLibraryPath:(id)a3;
- (void)setLastPersonSyncToken:(id)a3;
- (void)setLastSharedAssetContainerProcessingToken:(id)a3;
- (void)setLastUpdatedGraphLabelsAgainstPLSImageUUID:(id)a3;
- (void)setLibraryReadyForAnalysisDate:(id)a3;
- (void)setLibraryScopeRulesTrackerLastKnownToken:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocationOfInterestUpdateDate:(id)a3;
- (void)setLockedResourceTransitionAssetUUID:(id)a3;
- (void)setMediaAnalysisEmbeddingVersion:(id)a3;
- (void)setMediaAnalysisEmbeddingVersionBumpDate:(id)a3;
- (void)setMemoriesCreationPreviewAvailableDate:(id)a3;
- (void)setOrphanedSceneClassificationsCount:(id)a3;
- (void)setRebuildComplete;
- (void)setSearchFeatureReadyDate:(id)a3;
- (void)setSearchFeatureReadyFraction:(id)a3;
- (void)setSearchIndexEmbeddingModelVersion:(id)a3;
- (void)setSearchIndexFeatureSettings:(id)a3;
- (void)setSearchIndexLocaleIdentifier:(id)a3;
- (void)setSearchIndexRebuildCoalescedReasons:(id)a3;
- (void)setSearchIndexRebuildEndDate:(id)a3;
- (void)setSearchIndexRebuildRequiredExternalReasons:(id)a3;
- (void)setSearchIndexRebuildResumeMarker:(id)a3;
- (void)setSearchIndexRebuildResumeObjectID:(id)a3;
- (void)setSearchIndexRebuildStartDate:(id)a3;
- (void)setSearchIndexSceneTaxonomySHA:(id)a3;
- (void)setSearchIndexSpotlightClientState:(id)a3;
- (void)setSearchIndexSpotlightClientStateMismatchedCount:(id)a3;
- (void)setSearchIndexSpotlightClientStateMissingCount:(id)a3;
- (void)setSearchIndexStatus:(id)a3;
- (void)setSearchIndexUtilityTypeClassifierVersion:(id)a3;
- (void)setSearchIndexVersion:(id)a3;
- (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3;
- (void)setSyndicationStartDate:(id)a3;
- (void)setSyndicationSyncRangeDenominator:(double)a3;
- (void)setTimeOfLastFeatureAvailabilityJob:(id)a3;
- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3;
@end

@implementation PLGlobalValues

- (PLGlobalValues)initWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLGlobalValues;
  v6 = [(PLGlobalValues *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_moc, a3);
  }

  return v7;
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  v2 = [(PLGlobalValues *)self lastInitialDuplicateDetectorProcessingCompletedToken];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSPersistentHistoryToken)lastInitialDuplicateDetectorProcessingCompletedToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PLGlobalValues_lastInitialDuplicateDetectorProcessingCompletedToken__block_invoke;
  v4[3] = &unk_1E5870538;
  v4[4] = self;
  v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSPersistentHistoryToken *)v2;
}

- (id)_getValueUsingPerformBlockAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5138;
  v15 = __Block_byref_object_dispose__5139;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke;
  v8[3] = &unk_1E58753C0;
  v8[4] = self;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke_2;
  v4[3] = &unk_1E5870D98;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  objc_msgSend(v1, "pl_performBlockAndWait:", v4);
}

void __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __70__PLGlobalValues_lastInitialDuplicateDetectorProcessingCompletedToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastInitialDuplicateDetectorProcessingCompletedToken" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void).cxx_destruct
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)_setValueUsingPerformBlockAndWait:(id)a3 responsibleCaller:(const char *)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke;
  v8[3] = &unk_1E5873370;
  v8[4] = self;
  id v9 = v6;
  v10 = a4;
  id v7 = v6;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v8];
}

void __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke_2;
  v4[3] = &unk_1E5873370;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  objc_msgSend(v2, "pl_performBlockAndWait:", v4);
}

void __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = [*(id *)(a1[4] + 8) photoLibrary];
  id v3 = v2;
  if (!v2 || ![v2 pendingTransactions])
  {
    id v4 = *(void **)(a1[4] + 8);
    id v9 = 0;
    char v5 = [v4 save:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      id v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = a1[6];
        *(_DWORD *)buf = 136446466;
        uint64_t v11 = v8;
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Error setting value from caller: %{public}s, error: %@", buf, 0x16u);
      }
    }
  }
}

- (NSDate)locationOfInterestUpdateDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PLGlobalValues_locationOfInterestUpdateDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __46__PLGlobalValues_locationOfInterestUpdateDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LocationOfInterestUpdateDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLocationOfInterestUpdateDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLGlobalValues_setLocationOfInterestUpdateDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLocationOfInterestUpdateDate:]");
}

uint64_t __50__PLGlobalValues_setLocationOfInterestUpdateDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LocationOfInterestUpdateDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)libraryReadyForAnalysisDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLGlobalValues_libraryReadyForAnalysisDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __45__PLGlobalValues_libraryReadyForAnalysisDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LibraryReadyForAnalysisDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLibraryReadyForAnalysisDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setLibraryReadyForAnalysisDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLibraryReadyForAnalysisDate:]");
}

uint64_t __49__PLGlobalValues_setLibraryReadyForAnalysisDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LibraryReadyForAnalysisDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)mediaAnalysisEmbeddingVersionBumpDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PLGlobalValues_mediaAnalysisEmbeddingVersionBumpDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __55__PLGlobalValues_mediaAnalysisEmbeddingVersionBumpDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"MediaAnalysisEmbeddingVersionBumpDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setMediaAnalysisEmbeddingVersionBumpDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setMediaAnalysisEmbeddingVersionBumpDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setMediaAnalysisEmbeddingVersionBumpDate:]");
}

uint64_t __59__PLGlobalValues_setMediaAnalysisEmbeddingVersionBumpDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"MediaAnalysisEmbeddingVersionBumpDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)mediaAnalysisEmbeddingVersion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PLGlobalValues_mediaAnalysisEmbeddingVersion__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __47__PLGlobalValues_mediaAnalysisEmbeddingVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"MediaAnalysisEmbeddingVersion" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setMediaAnalysisEmbeddingVersion:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setMediaAnalysisEmbeddingVersion___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setMediaAnalysisEmbeddingVersion:]");
}

uint64_t __51__PLGlobalValues_setMediaAnalysisEmbeddingVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"MediaAnalysisEmbeddingVersion" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)dateOfLastExternalAvailabilitySignal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLGlobalValues_dateOfLastExternalAvailabilitySignal__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __54__PLGlobalValues_dateOfLastExternalAvailabilitySignal__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"DateOfLastExternalAvailabilitySignal" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setDateOfLastExternalAvailabilitySignal:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PLGlobalValues_setDateOfLastExternalAvailabilitySignal___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setDateOfLastExternalAvailabilitySignal:]");
}

uint64_t __58__PLGlobalValues_setDateOfLastExternalAvailabilitySignal___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"DateOfLastExternalAvailabilitySignal" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)memoriesCreationPreviewAvailableDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLGlobalValues_memoriesCreationPreviewAvailableDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __54__PLGlobalValues_memoriesCreationPreviewAvailableDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"MemoriesCreationPreviewAvailableDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setMemoriesCreationPreviewAvailableDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PLGlobalValues_setMemoriesCreationPreviewAvailableDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setMemoriesCreationPreviewAvailableDate:]");
}

uint64_t __58__PLGlobalValues_setMemoriesCreationPreviewAvailableDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"MemoriesCreationPreviewAvailableDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchFeatureReadyFraction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PLGlobalValues_searchFeatureReadyFraction__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __44__PLGlobalValues_searchFeatureReadyFraction__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchFeatureReadyFraction" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchFeatureReadyFraction:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PLGlobalValues_setSearchFeatureReadyFraction___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchFeatureReadyFraction:]");
}

uint64_t __48__PLGlobalValues_setSearchFeatureReadyFraction___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchFeatureReadyFraction" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)searchFeatureReadyDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PLGlobalValues_searchFeatureReadyDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __40__PLGlobalValues_searchFeatureReadyDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchFeatureReadyDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchFeatureReadyDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PLGlobalValues_setSearchFeatureReadyDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchFeatureReadyDate:]");
}

uint64_t __44__PLGlobalValues_setSearchFeatureReadyDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchFeatureReadyDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)featureAvailabilityJobDidFail
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PLGlobalValues_featureAvailabilityJobDidFail__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __47__PLGlobalValues_featureAvailabilityJobDidFail__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"FeatureAvailabilityJobDidFailKey" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setFeatureAvailabilityJobDidFail:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setFeatureAvailabilityJobDidFail___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setFeatureAvailabilityJobDidFail:]");
}

uint64_t __51__PLGlobalValues_setFeatureAvailabilityJobDidFail___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"FeatureAvailabilityJobDidFailKey" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)timeOfLastFeatureAvailabilityJob
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PLGlobalValues_timeOfLastFeatureAvailabilityJob__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __50__PLGlobalValues_timeOfLastFeatureAvailabilityJob__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"TimeOfLastFeatureAvailabilityJob" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setTimeOfLastFeatureAvailabilityJob:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PLGlobalValues_setTimeOfLastFeatureAvailabilityJob___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setTimeOfLastFeatureAvailabilityJob:]");
}

uint64_t __54__PLGlobalValues_setTimeOfLastFeatureAvailabilityJob___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"TimeOfLastFeatureAvailabilityJob" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDictionary)featureAvailability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PLGlobalValues_featureAvailability__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDictionary *)v2;
}

id __37__PLGlobalValues_featureAvailability__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"FeatureAvailabilityKey" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setFeatureAvailability:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PLGlobalValues_setFeatureAvailability___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setFeatureAvailability:]");
}

uint64_t __41__PLGlobalValues_setFeatureAvailability___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"FeatureAvailabilityKey" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)lastUpdatedGraphLabelsAgainstPLSImageUUID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PLGlobalValues_lastUpdatedGraphLabelsAgainstPLSImageUUID__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __59__PLGlobalValues_lastUpdatedGraphLabelsAgainstPLSImageUUID__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastUpdatedGraphLabel" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastUpdatedGraphLabelsAgainstPLSImageUUID:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setLastUpdatedGraphLabelsAgainstPLSImageUUID___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastUpdatedGraphLabelsAgainstPLSImageUUID:]");
}

uint64_t __63__PLGlobalValues_setLastUpdatedGraphLabelsAgainstPLSImageUUID___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastUpdatedGraphLabel" managedObjectContext:*(void *)(a1 + 40)];
}

- (void)setSearchIndexRebuildCoalescedReasons:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PLGlobalValues_setSearchIndexRebuildCoalescedReasons___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildCoalescedReasons:]");
}

uint64_t __56__PLGlobalValues_setSearchIndexRebuildCoalescedReasons___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexRebuildCoalescedReasons" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexRebuildCoalescedReasons
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PLGlobalValues_searchIndexRebuildCoalescedReasons__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __52__PLGlobalValues_searchIndexRebuildCoalescedReasons__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexRebuildCoalescedReasons" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexRebuildRequiredExternalReasons:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setSearchIndexRebuildRequiredExternalReasons___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildRequiredExternalReasons:]");
}

uint64_t __63__PLGlobalValues_setSearchIndexRebuildRequiredExternalReasons___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexRebuildRequiredExternalReason" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexRebuildRequiredExternalReasons
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PLGlobalValues_searchIndexRebuildRequiredExternalReasons__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __59__PLGlobalValues_searchIndexRebuildRequiredExternalReasons__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexRebuildRequiredExternalReason" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexRebuildEndDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PLGlobalValues_setSearchIndexRebuildEndDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildEndDate:]");
}

uint64_t __47__PLGlobalValues_setSearchIndexRebuildEndDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexRebuildEndDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)searchIndexRebuildEndDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PLGlobalValues_searchIndexRebuildEndDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __43__PLGlobalValues_searchIndexRebuildEndDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexRebuildEndDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexRebuildStartDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexRebuildStartDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildStartDate:]");
}

uint64_t __49__PLGlobalValues_setSearchIndexRebuildStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexRebuildStartDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)searchIndexRebuildStartDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLGlobalValues_searchIndexRebuildStartDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __45__PLGlobalValues_searchIndexRebuildStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexRebuildStartDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexSpotlightClientStateMismatchedCount:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PLGlobalValues_setSearchIndexSpotlightClientStateMismatchedCount___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientStateMismatchedCount:]");
}

uint64_t __68__PLGlobalValues_setSearchIndexSpotlightClientStateMismatchedCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexSpotlightClientStateMissingCount" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexSpotlightClientStateMismatchedCount
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PLGlobalValues_searchIndexSpotlightClientStateMismatchedCount__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __64__PLGlobalValues_searchIndexSpotlightClientStateMismatchedCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexSpotlightClientStateMismatchedCount" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexSpotlightClientStateMissingCount:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PLGlobalValues_setSearchIndexSpotlightClientStateMissingCount___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientStateMissingCount:]");
}

uint64_t __65__PLGlobalValues_setSearchIndexSpotlightClientStateMissingCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexSpotlightClientStateMissingCount" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexSpotlightClientStateMissingCount
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PLGlobalValues_searchIndexSpotlightClientStateMissingCount__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __61__PLGlobalValues_searchIndexSpotlightClientStateMissingCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexSpotlightClientStateMissingCount" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexSpotlightClientState:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PLGlobalValues_setSearchIndexSpotlightClientState___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientState:]");
}

uint64_t __53__PLGlobalValues_setSearchIndexSpotlightClientState___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexSpotlightClientState" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDictionary)searchIndexSpotlightClientState
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PLGlobalValues_searchIndexSpotlightClientState__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDictionary *)v2;
}

id __49__PLGlobalValues_searchIndexSpotlightClientState__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexSpotlightClientState" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexRebuildResumeMarker:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PLGlobalValues_setSearchIndexRebuildResumeMarker___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildResumeMarker:]");
}

uint64_t __52__PLGlobalValues_setSearchIndexRebuildResumeMarker___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexRebuildResumeMarker" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)searchIndexRebuildResumeMarker
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PLGlobalValues_searchIndexRebuildResumeMarker__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __48__PLGlobalValues_searchIndexRebuildResumeMarker__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexRebuildResumeMarker" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexStatus:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PLGlobalValues_setSearchIndexStatus___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexStatus:]");
}

uint64_t __39__PLGlobalValues_setSearchIndexStatus___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexStatus" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexStatus
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PLGlobalValues_searchIndexStatus__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __35__PLGlobalValues_searchIndexStatus__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexStatus" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexFeatureSettings:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PLGlobalValues_setSearchIndexFeatureSettings___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexFeatureSettings:]");
}

uint64_t __48__PLGlobalValues_setSearchIndexFeatureSettings___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexFeatureSettings" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexFeatureSettings
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PLGlobalValues_searchIndexFeatureSettings__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __44__PLGlobalValues_searchIndexFeatureSettings__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexFeatureSettings" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexSceneTaxonomySHA:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexSceneTaxonomySHA___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSceneTaxonomySHA:]");
}

uint64_t __49__PLGlobalValues_setSearchIndexSceneTaxonomySHA___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexSceneTaxonomySHA" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)searchIndexSceneTaxonomySHA
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLGlobalValues_searchIndexSceneTaxonomySHA__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __45__PLGlobalValues_searchIndexSceneTaxonomySHA__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexSceneTaxonomySHA" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexLocaleIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexLocaleIdentifier___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexLocaleIdentifier:]");
}

uint64_t __49__PLGlobalValues_setSearchIndexLocaleIdentifier___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexLocaleIdentifier" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)searchIndexLocaleIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLGlobalValues_searchIndexLocaleIdentifier__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __45__PLGlobalValues_searchIndexLocaleIdentifier__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexLocaleIdentifier" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (NSNumber)searchIndexUtilityTypeClassifierVersion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PLGlobalValues_searchIndexUtilityTypeClassifierVersion__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __57__PLGlobalValues_searchIndexUtilityTypeClassifierVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexUtilityTypeClassifierVersion" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexUtilityTypeClassifierVersion:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PLGlobalValues_setSearchIndexUtilityTypeClassifierVersion___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexUtilityTypeClassifierVersion:]");
}

uint64_t __61__PLGlobalValues_setSearchIndexUtilityTypeClassifierVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexUtilityTypeClassifierVersion" managedObjectContext:*(void *)(a1 + 40)];
}

- (void)setSearchIndexEmbeddingModelVersion:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PLGlobalValues_setSearchIndexEmbeddingModelVersion___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexEmbeddingModelVersion:]");
}

uint64_t __54__PLGlobalValues_setSearchIndexEmbeddingModelVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexEmbeddingModelVersionKey" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexEmbeddingModelVersion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PLGlobalValues_searchIndexEmbeddingModelVersion__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __50__PLGlobalValues_searchIndexEmbeddingModelVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexEmbeddingModelVersionKey" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSearchIndexVersion:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PLGlobalValues_setSearchIndexVersion___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexVersion:]");
}

uint64_t __40__PLGlobalValues_setSearchIndexVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SearchIndexVersion" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)searchIndexVersion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PLGlobalValues_searchIndexVersion__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __36__PLGlobalValues_searchIndexVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SearchIndexVersion" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastCompletePrefetchDate:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PLGlobalValues_setLastCompletePrefetchDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastCompletePrefetchDate:]");
}

uint64_t __46__PLGlobalValues_setLastCompletePrefetchDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastCompletePrefetchDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)lastCompletePrefetchDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PLGlobalValues_lastCompletePrefetchDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __42__PLGlobalValues_lastCompletePrefetchDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastCompletePrefetchDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setCloudInitialUploadCompleted:(BOOL)a3
{
  char v5 = self->_moc;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PLGlobalValues_setCloudInitialUploadCompleted___block_invoke;
  v7[3] = &unk_1E58748B0;
  BOOL v9 = a3;
  uint64_t v8 = v5;
  id v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setCloudInitialUploadCompleted:]");
}

void __49__PLGlobalValues_setCloudInitialUploadCompleted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  +[PLGlobalKeyValue setGlobalValue:v2 forKey:@"CloudInitialUploadDate" managedObjectContext:*(void *)(a1 + 32)];
}

- (BOOL)hasCloudInitialUploadCompleted
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PLGlobalValues_hasCloudInitialUploadCompleted__block_invoke;
  v5[3] = &unk_1E5870538;
  v5[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __48__PLGlobalValues_hasCloudInitialUploadCompleted__block_invoke(uint64_t a1)
{
  v1 = +[PLGlobalKeyValue globalValueForKey:@"CloudInitialUploadDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
  if (v1) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v3 = v2;

  return v3;
}

- (void)setLibraryScopeRulesTrackerLastKnownToken:(id)a3
{
}

- (NSPersistentHistoryToken)libraryScopeRulesTrackerLastKnownToken
{
  return (NSPersistentHistoryToken *)[(PLGlobalValues *)self _lastKnownTransactionTokenWithTransactionNumberKey:@"LibraryScopeRulesTrackerLastKnownTransactionNumber" andStoreUUIDKey:@"LibraryScopeRulesTrackerLastKnownStoreUUID"];
}

- (void)setCloudTrackerLastKnownToken:(id)a3
{
}

- (NSPersistentHistoryToken)cloudTrackerLastKnownToken
{
  return (NSPersistentHistoryToken *)[(PLGlobalValues *)self _lastKnownTransactionTokenWithTransactionNumberKey:@"CloudTrackerLastKnownTransactionNumber" andStoreUUIDKey:@"CloudTrackerLastKnownTransactionStoreUUID"];
}

- (void)setCloudTrackerLastKnownCloudVersion:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setCloudTrackerLastKnownCloudVersion___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setCloudTrackerLastKnownCloudVersion:]");
}

uint64_t __55__PLGlobalValues_setCloudTrackerLastKnownCloudVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"CloudTrackerLastKnownCloudVersion" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)cloudTrackerLastKnownCloudVersion
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLGlobalValues_cloudTrackerLastKnownCloudVersion__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __51__PLGlobalValues_cloudTrackerLastKnownCloudVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"CloudTrackerLastKnownCloudVersion" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setOrphanedSceneClassificationsCount:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setOrphanedSceneClassificationsCount___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setOrphanedSceneClassificationsCount:]");
}

uint64_t __55__PLGlobalValues_setOrphanedSceneClassificationsCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"OrphanedSceneClassificationsCount" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)orphanedSceneClassificationsCount
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLGlobalValues_orphanedSceneClassificationsCount__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __51__PLGlobalValues_orphanedSceneClassificationsCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"OrphanedSceneClassificationsCount" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLockedResourceTransitionAssetUUID:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setLockedResourceTransitionAssetUUID___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLockedResourceTransitionAssetUUID:]");
}

uint64_t __55__PLGlobalValues_setLockedResourceTransitionAssetUUID___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LockedResourceTransitionAssetUUID" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)lockedResourceTransitionAssetUUID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLGlobalValues_lockedResourceTransitionAssetUUID__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __51__PLGlobalValues_lockedResourceTransitionAssetUUID__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LockedResourceTransitionAssetUUID" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastSharedAssetContainerProcessingToken:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PLGlobalValues_setLastSharedAssetContainerProcessingToken___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastSharedAssetContainerProcessingToken:]");
}

uint64_t __61__PLGlobalValues_setLastSharedAssetContainerProcessingToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastSharedAssetContainerUpdateToken" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSPersistentHistoryToken)lastSharedAssetContainerProcessingToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PLGlobalValues_lastSharedAssetContainerProcessingToken__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSPersistentHistoryToken *)v2;
}

id __57__PLGlobalValues_lastSharedAssetContainerProcessingToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastSharedAssetContainerUpdateToken" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastInitialDuplicateDetectorProcessingCompletedToken:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PLGlobalValues_setLastInitialDuplicateDetectorProcessingCompletedToken___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastInitialDuplicateDetectorProcessingCompletedToken:]");
}

uint64_t __74__PLGlobalValues_setLastInitialDuplicateDetectorProcessingCompletedToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastInitialDuplicateDetectorProcessingCompletedToken" managedObjectContext:*(void *)(a1 + 40)];
}

- (void)setLastDuplicateDetectorProcessingToken:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PLGlobalValues_setLastDuplicateDetectorProcessingToken___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastDuplicateDetectorProcessingToken:]");
}

uint64_t __58__PLGlobalValues_setLastDuplicateDetectorProcessingToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastDuplicateDetectorProcessingToken" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSPersistentHistoryToken)lastDuplicateDetectorProcessingToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PLGlobalValues_lastDuplicateDetectorProcessingToken__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSPersistentHistoryToken *)v2;
}

id __54__PLGlobalValues_lastDuplicateDetectorProcessingToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastDuplicateDetectorProcessingToken" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastPersonSyncSourceLibraryPath:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PLGlobalValues_setLastPersonSyncSourceLibraryPath___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastPersonSyncSourceLibraryPath:]");
}

uint64_t __53__PLGlobalValues_setLastPersonSyncSourceLibraryPath___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastPersonSyncSourceLibraryPath" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)lastPersonSyncSourceLibraryPath
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PLGlobalValues_lastPersonSyncSourceLibraryPath__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __49__PLGlobalValues_lastPersonSyncSourceLibraryPath__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastPersonSyncSourceLibraryPath" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastPersonSyncToken:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PLGlobalValues_setLastPersonSyncToken___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastPersonSyncToken:]");
}

uint64_t __41__PLGlobalValues_setLastPersonSyncToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastPersonSyncToken" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSPersistentHistoryToken)lastPersonSyncToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PLGlobalValues_lastPersonSyncToken__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSPersistentHistoryToken *)v2;
}

id __37__PLGlobalValues_lastPersonSyncToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastPersonSyncToken" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastGuestAssetSyncTargetLibraryPath:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PLGlobalValues_setLastGuestAssetSyncTargetLibraryPath___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastGuestAssetSyncTargetLibraryPath:]");
}

uint64_t __57__PLGlobalValues_setLastGuestAssetSyncTargetLibraryPath___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastGuestAssetSyncTargetLibraryPath" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)lastGuestAssetSyncTargetLibraryPath
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PLGlobalValues_lastGuestAssetSyncTargetLibraryPath__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __53__PLGlobalValues_lastGuestAssetSyncTargetLibraryPath__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastGuestAssetSyncTargetLibraryPath" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setGuestAssetInitialSyncResumeMarker:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setGuestAssetInitialSyncResumeMarker___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGuestAssetInitialSyncResumeMarker:]");
}

uint64_t __55__PLGlobalValues_setGuestAssetInitialSyncResumeMarker___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"GuestAssetInitialSyncResumeMarker" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)guestAssetInitialSyncResumeMarker
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLGlobalValues_guestAssetInitialSyncResumeMarker__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __51__PLGlobalValues_guestAssetInitialSyncResumeMarker__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"GuestAssetInitialSyncResumeMarker" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setGuestAssetSyncStatus:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLGlobalValues_setGuestAssetSyncStatus___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGuestAssetSyncStatus:]");
}

uint64_t __42__PLGlobalValues_setGuestAssetSyncStatus___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"GuestAssetSyncStatus" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)guestAssetSyncStatus
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PLGlobalValues_guestAssetSyncStatus__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __38__PLGlobalValues_guestAssetSyncStatus__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"GuestAssetSyncStatus" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastGuestAssetSyncToken:(id)a3
{
  id v4 = a3;
  char v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PLGlobalValues_setLastGuestAssetSyncToken___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastGuestAssetSyncToken:]");
}

uint64_t __45__PLGlobalValues_setLastGuestAssetSyncToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastGuestAssetSyncToken" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSPersistentHistoryToken)lastGuestAssetSyncToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PLGlobalValues_lastGuestAssetSyncToken__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  uint64_t v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSPersistentHistoryToken *)v2;
}

id __41__PLGlobalValues_lastGuestAssetSyncToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastGuestAssetSyncToken" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSyndicationSyncRangeDenominator:(double)a3
{
  if (a3 >= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  char v5 = self->_moc;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLGlobalValues_setSyndicationSyncRangeDenominator___block_invoke;
  v7[3] = &unk_1E5873348;
  double v9 = v4;
  uint64_t v8 = v5;
  id v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setSyndicationSyncRangeDenominator:]");
}

void __53__PLGlobalValues_setSyndicationSyncRangeDenominator___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  +[PLGlobalKeyValue setGlobalValue:v2 forKey:@"PLSyndicationSyncRangeDenominator" managedObjectContext:*(void *)(a1 + 32)];
}

- (double)syndicationSyncRangeDenominator
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PLGlobalValues_syndicationSyncRangeDenominator__block_invoke;
  v7[3] = &unk_1E5870538;
  void v7[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v7];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

id __49__PLGlobalValues_syndicationSyncRangeDenominator__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"PLSyndicationSyncRangeDenominator" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setSyndicationPrefetchDownloadThrottlingDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSyndicationPrefetchDownloadThrottlingDate:]");
}

uint64_t __63__PLGlobalValues_setSyndicationPrefetchDownloadThrottlingDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"PLSyndicationPrefetchDownloadThrottlingDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)syndicationPrefetchDownloadThrottlingDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PLGlobalValues_syndicationPrefetchDownloadThrottlingDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __59__PLGlobalValues_syndicationPrefetchDownloadThrottlingDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"PLSyndicationPrefetchDownloadThrottlingDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setSyndicationStartDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLGlobalValues_setSyndicationStartDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSyndicationStartDate:]");
}

uint64_t __42__PLGlobalValues_setSyndicationStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"SyndicationStartDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)syndicationStartDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PLGlobalValues_syndicationStartDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __38__PLGlobalValues_syndicationStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"SyndicationStartDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastDeleteSyndicationSyncDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setLastDeleteSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastDeleteSyndicationSyncDate:]");
}

uint64_t __51__PLGlobalValues_setLastDeleteSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastDeleteSyndicationSyncDateKey" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)lastDeleteSyndicationSyncDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PLGlobalValues_lastDeleteSyndicationSyncDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __47__PLGlobalValues_lastDeleteSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastDeleteSyndicationSyncDateKey" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastChatSyndicationSyncDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setLastChatSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastChatSyndicationSyncDate:]");
}

uint64_t __49__PLGlobalValues_setLastChatSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastChatSyndicationSyncDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)lastChatSyndicationSyncDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLGlobalValues_lastChatSyndicationSyncDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __45__PLGlobalValues_lastChatSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastChatSyndicationSyncDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastAttachmentSyndicationSyncDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setLastAttachmentSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastAttachmentSyndicationSyncDate:]");
}

uint64_t __55__PLGlobalValues_setLastAttachmentSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastAttachmentSyndicationSyncDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)lastAttachmentSyndicationSyncDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLGlobalValues_lastAttachmentSyndicationSyncDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __51__PLGlobalValues_lastAttachmentSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastAttachmentSyndicationSyncDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setInProgressFullIndexSyndicationSyncDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PLGlobalValues_setInProgressFullIndexSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setInProgressFullIndexSyndicationSyncDate:]");
}

uint64_t __60__PLGlobalValues_setInProgressFullIndexSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"InProgressFullIndexSyndicationSyncDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)inProgressFullIndexSyndicationSyncDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PLGlobalValues_inProgressFullIndexSyndicationSyncDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __56__PLGlobalValues_inProgressFullIndexSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"InProgressFullIndexSyndicationSyncDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLastFullIndexSyndicationSyncStartDate:(id)a3
{
  id v4 = a3;
  double v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setLastFullIndexSyndicationSyncStartDate___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  v10 = v5;
  id v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastFullIndexSyndicationSyncStartDate:]");
}

uint64_t __59__PLGlobalValues_setLastFullIndexSyndicationSyncStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LastFullIndexSyndicationSyncStartDate" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDate)lastFullIndexSyndicationSyncStartDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PLGlobalValues_lastFullIndexSyndicationSyncStartDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __55__PLGlobalValues_lastFullIndexSyndicationSyncStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastFullIndexSyndicationSyncStartDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (NSDate)_deprecated_lastFullIndexSyndicationSyncDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PLGlobalValues__deprecated_lastFullIndexSyndicationSyncDate__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDate *)v2;
}

id __62__PLGlobalValues__deprecated_lastFullIndexSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LastFullIndexSyndicationSyncDate" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (BOOL)shouldPrefetchWidgetResources
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  moc = self->_moc;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PLGlobalValues_shouldPrefetchWidgetResources__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  void v5[5] = &v6;
  [(NSManagedObjectContext *)moc performBlockAndWait:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__PLGlobalValues_shouldPrefetchWidgetResources__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"LastWidgetUpdateDate", @"LargestWidgetPixelSize", 0);
  id v9 = +[PLGlobalKeyValue globalValuesForKeys:v2 managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];

  char v3 = [v9 objectForKeyedSubscript:@"LastWidgetUpdateDate"];
  id v4 = [v9 objectForKeyedSubscript:@"LargestWidgetPixelSize"];
  unint64_t v5 = [v4 integerValue];

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-259200.0];
  [v3 timeIntervalSinceDate:v6];
  BOOL v8 = v7 > 0.0 && v5 > [MEMORY[0x1E4F59940] maxPixelSizeForResourceType:5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v6 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setWidgetTimelineGeneratedForDisplaySize___block_invoke;
  v8[3] = &unk_1E5875E90;
  id v9 = v6;
  CGFloat v10 = width;
  CGFloat v11 = height;
  double v7 = v6;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setWidgetTimelineGeneratedForDisplaySize:]");
}

void __59__PLGlobalValues_setWidgetTimelineGeneratedForDisplaySize___block_invoke(uint64_t a1)
{
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:");
  if (*(double *)(a1 + 40) != *MEMORY[0x1E4F1DB30] || *(double *)(a1 + 48) != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    char v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"LargestWidgetSizeDate", @"LargestWidgetPixelSize", 0);
    id v4 = +[PLGlobalKeyValue globalValuesForKeys:v3 managedObjectContext:*(void *)(a1 + 32)];

    unint64_t v5 = [v4 objectForKeyedSubscript:@"LargestWidgetSizeDate"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"LargestWidgetPixelSize"];
    unint64_t v7 = [v6 integerValue];

    BOOL v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
    unint64_t v9 = vcvtpd_u64_f64(*(double *)(a1 + 40) * *(double *)(a1 + 48));
    [v5 timeIntervalSinceDate:v8];
    if (v10 <= 0.0 || v7 < v9)
    {
      __int16 v12 = [NSNumber numberWithUnsignedInteger:v9];
      +[PLGlobalKeyValue setGlobalValue:v12 forKey:@"LargestWidgetPixelSize" managedObjectContext:*(void *)(a1 + 32)];

      +[PLGlobalKeyValue setGlobalValue:v13 forKey:@"LargestWidgetSizeDate" managedObjectContext:*(void *)(a1 + 32)];
    }
  }
}

- (unint64_t)libraryCreateOptions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PLGlobalValues_libraryCreateOptions__block_invoke;
  v5[3] = &unk_1E5870538;
  v5[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __38__PLGlobalValues_libraryCreateOptions__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LibraryCreateOptions" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setGreenTeaContactsAuthorization:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setGreenTeaContactsAuthorization___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  double v10 = v5;
  uint64_t v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGreenTeaContactsAuthorization:]");
}

uint64_t __51__PLGlobalValues_setGreenTeaContactsAuthorization___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"GreenTeaContactsAuthorization" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSNumber)greenTeaContactsAuthorization
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PLGlobalValues_greenTeaContactsAuthorization__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSNumber *)v2;
}

id __47__PLGlobalValues_greenTeaContactsAuthorization__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"GreenTeaContactsAuthorization" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PLGlobalValues_setLocaleIdentifier___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  double v10 = v5;
  uint64_t v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLocaleIdentifier:]");
}

uint64_t __38__PLGlobalValues_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"LocaleIdentifier" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSString)localeIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PLGlobalValues_localeIdentifier__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSString *)v2;
}

id __34__PLGlobalValues_localeIdentifier__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"LocaleIdentifier" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)setGreenValues:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_moc;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__PLGlobalValues_setGreenValues___block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v4;
  double v10 = v5;
  uint64_t v6 = v5;
  id v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGreenValues:]");
}

uint64_t __33__PLGlobalValues_setGreenValues___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:*(void *)(a1 + 32) forKey:@"GreenValues" managedObjectContext:*(void *)(a1 + 40)];
}

- (NSDictionary)greenValues
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PLGlobalValues_greenValues__block_invoke;
  v4[3] = &unk_1E5870538;
  void v4[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v4];
  return (NSDictionary *)v2;
}

id __29__PLGlobalValues_greenValues__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"GreenValues" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)_setBackgroundJobServiceNeedsProcessing:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  +[PLGlobalKeyValue setGlobalValue:v4 forKey:@"BackgroundJobServiceNeedsProcessing" managedObjectContext:self->_moc];
}

- (void)setBackgroundJobServiceNeedsProcessing:(BOOL)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PLGlobalValues_setBackgroundJobServiceNeedsProcessing___block_invoke;
  v5[3] = &unk_1E5863450;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v5, "-[PLGlobalValues setBackgroundJobServiceNeedsProcessing:]");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__PLGlobalValues_setBackgroundJobServiceNeedsProcessing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setBackgroundJobServiceNeedsProcessing:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)backgroundJobServiceNeedsProcessing
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PLGlobalValues_backgroundJobServiceNeedsProcessing__block_invoke;
  v5[3] = &unk_1E5870538;
  void v5[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __53__PLGlobalValues_backgroundJobServiceNeedsProcessing__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"BackgroundJobServiceNeedsProcessing" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)_setRebuildComplete
{
  char v3 = [MEMORY[0x1E4F1C9C8] now];
  +[PLGlobalKeyValue setGlobalValue:v3 forKey:@"RebuildCompleteDate" managedObjectContext:self->_moc];

  moc = self->_moc;
  +[PLGlobalKeyValue setGlobalValue:0 forKey:@"JournalRebuildRequired" managedObjectContext:moc];
}

- (void)setRebuildComplete
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PLGlobalValues_setRebuildComplete__block_invoke;
  v3[3] = &unk_1E5875F08;
  objc_copyWeak(&v4, &location);
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v3, "-[PLGlobalValues setRebuildComplete]");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __36__PLGlobalValues_setRebuildComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setRebuildComplete];
}

- (BOOL)isRebuildComplete
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PLGlobalValues_isRebuildComplete__block_invoke;
  v7[3] = &unk_1E5870538;
  void v7[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v7];
  char v3 = [v2 objectForKeyedSubscript:@"JournalRebuildRequired"];
  if ([v3 BOOLValue])
  {
    BOOL v4 = 0;
  }
  else
  {
    unint64_t v5 = [v2 objectForKeyedSubscript:@"RebuildCompleteDate"];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

id __35__PLGlobalValues_isRebuildComplete__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"JournalRebuildRequired", @"RebuildCompleteDate", 0);
  char v3 = +[PLGlobalKeyValue globalValuesForKeys:v2 managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];

  return v3;
}

- (void)setJournalRebuildRequired:(BOOL)a3
{
  unint64_t v5 = self->_moc;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PLGlobalValues_setJournalRebuildRequired___block_invoke;
  v7[3] = &unk_1E58748B0;
  BOOL v9 = a3;
  BOOL v8 = v5;
  id v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setJournalRebuildRequired:]");
}

uint64_t __44__PLGlobalValues_setJournalRebuildRequired___block_invoke(uint64_t a1)
{
  return +[PLGlobalValues setJournalRebuildRequired:*(unsigned __int8 *)(a1 + 40) managedObjectContext:*(void *)(a1 + 32)];
}

- (BOOL)isJournalRebuildRequired
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLGlobalValues_isJournalRebuildRequired__block_invoke;
  v5[3] = &unk_1E5870538;
  void v5[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __42__PLGlobalValues_isJournalRebuildRequired__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"JournalRebuildRequired" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)dontImportFileSystemDataIntoDatabase
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PLGlobalValues_dontImportFileSystemDataIntoDatabase__block_invoke;
  v3[3] = &unk_1E5875F08;
  objc_copyWeak(&v4, &location);
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v3, "-[PLGlobalValues dontImportFileSystemDataIntoDatabase]");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__PLGlobalValues_dontImportFileSystemDataIntoDatabase__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setImportFilesystemAssetsState:1];
  [WeakRetained _setRebuildComplete];
}

- (void)_setImportFilesystemAssetsState:(int64_t)a3
{
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  +[PLGlobalKeyValue setGlobalValue:v5 forKey:@"ImportedFileSystemAssets" managedObjectContext:self->_moc];

  if (a3 == 1)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    +[PLGlobalKeyValue setGlobalValue:v7 forKey:@"ImportedFileSystemAssetsDate" managedObjectContext:self->_moc];
  }
  else
  {
    moc = self->_moc;
    +[PLGlobalKeyValue setGlobalValue:0 forKey:@"ImportedFileSystemAssetsDate" managedObjectContext:moc];
  }
}

- (void)setImportFilesystemAssetsState:(int64_t)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PLGlobalValues_setImportFilesystemAssetsState___block_invoke;
  v5[3] = &unk_1E586A670;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v5, "-[PLGlobalValues setImportFilesystemAssetsState:]");
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __49__PLGlobalValues_setImportFilesystemAssetsState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setImportFilesystemAssetsState:*(void *)(a1 + 40)];
}

- (int64_t)importFilesystemAssetsState
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PLGlobalValues_importFilesystemAssetsState__block_invoke;
  v5[3] = &unk_1E5870538;
  void v5[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  int64_t v3 = [v2 integerValue];

  return v3;
}

id __45__PLGlobalValues_importFilesystemAssetsState__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:@"ImportedFileSystemAssets" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (BOOL)didImportFileSystemAssets
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PLGlobalValues_didImportFileSystemAssets__block_invoke;
  v5[3] = &unk_1E5870538;
  void v5[4] = self;
  id v2 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v5];
  char v3 = [v2 BOOLValue];

  return v3;
}

id __43__PLGlobalValues_didImportFileSystemAssets__block_invoke(uint64_t a1)
{
  v1 = +[PLGlobalKeyValue globalValueForKey:@"ImportedFileSystemAssets" managedObjectContext:*(void *)(*(void *)(a1 + 32) + 8)];
  id v2 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "integerValue") == 1);

  return v2;
}

- (void)_setLastKnownTransactionToken:(id)a3 withTransactionNumberKey:(id)a4 andStoreUUIDKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLGlobalValues.m", 46, @"Invalid parameter not satisfying: %@", @"transactionNumberKey" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PLGlobalValues.m", 47, @"Invalid parameter not satisfying: %@", @"storeUUIDKey" object file lineNumber description];

LABEL_3:
  id v13 = self->_moc;
  if (v9)
  {
    uint64_t v14 = [v9 storeTokens];
    if ([v14 count] != 1)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"PLGlobalValues.m" lineNumber:56 description:@"unexpected number of tokens"];
    }
    v15 = [v14 allKeys];
    id v16 = [v15 firstObject];

    v17 = [v14 allValues];
    v18 = [v17 firstObject];
  }
  else
  {
    v18 = 0;
    id v16 = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __89__PLGlobalValues__setLastKnownTransactionToken_withTransactionNumberKey_andStoreUUIDKey___block_invoke;
  v27[3] = &unk_1E5870618;
  id v28 = v12;
  v29 = v13;
  id v30 = v16;
  id v31 = v18;
  id v32 = v10;
  id v19 = v10;
  id v20 = v18;
  id v21 = v16;
  v22 = v13;
  id v23 = v12;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v27, "-[PLGlobalValues _setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:]");
}

void __89__PLGlobalValues__setLastKnownTransactionToken_withTransactionNumberKey_andStoreUUIDKey___block_invoke(void *a1)
{
  id v2 = +[PLGlobalKeyValue globalValueForKey:a1[4] managedObjectContext:a1[5]];
  if ((PLObjectIsEqual() & 1) == 0) {
    +[PLGlobalKeyValue setGlobalValue:a1[6] forKey:a1[4] managedObjectContext:a1[5]];
  }
  +[PLGlobalKeyValue setGlobalValue:a1[7] forKey:a1[8] managedObjectContext:a1[5]];
}

- (id)_lastKnownTransactionTokenWithTransactionNumberKey:(id)a3 andStoreUUIDKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLGlobalValues.m", 28, @"Invalid parameter not satisfying: %@", @"transactionNumberKey" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PLGlobalValues.m", 29, @"Invalid parameter not satisfying: %@", @"storeUUIDKey" object file lineNumber description];

LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PLGlobalValues__lastKnownTransactionTokenWithTransactionNumberKey_andStoreUUIDKey___block_invoke;
  v16[3] = &unk_1E5863428;
  id v17 = v9;
  v18 = self;
  id v19 = v7;
  id v10 = v7;
  id v11 = v9;
  __int16 v12 = [(PLGlobalValues *)self _getValueUsingPerformBlockAndWait:v16];

  return v12;
}

id __85__PLGlobalValues__lastKnownTransactionTokenWithTransactionNumberKey_andStoreUUIDKey___block_invoke(void *a1)
{
  id v2 = +[PLGlobalKeyValue globalValueForKey:a1[4] managedObjectContext:*(void *)(a1[5] + 8)];
  char v3 = +[PLGlobalKeyValue globalValueForKey:a1[6] managedObjectContext:*(void *)(a1[5] + 8)];
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C170]) initWithTransactionNumber:v3 andStoreID:v2];
  }

  return v5;
}

+ (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3 managedObjectContext:(id)a4
{
}

+ (void)setLibraryCreateOptions:(unint64_t)a3 managedObjectContext:(id)a4
{
  if (a3)
  {
    unint64_t v5 = NSNumber;
    id v6 = a4;
    id v7 = [v5 numberWithUnsignedInteger:a3];
    +[PLGlobalKeyValue setGlobalValue:v7 forKey:@"LibraryCreateOptions" managedObjectContext:v6];
  }
}

+ (void)setJournalRebuildRequired:(BOOL)a3 managedObjectContext:(id)a4
{
  if (a3)
  {
    BOOL v4 = NSNumber;
    id v5 = a4;
    id v6 = [v4 numberWithBool:1];
    +[PLGlobalKeyValue setGlobalValue:v6 forKey:@"JournalRebuildRequired" managedObjectContext:v5];

    id v7 = @"RebuildCompleteDate";
    id v8 = v5;
  }
  else
  {
    id v8 = a4;
    id v7 = @"JournalRebuildRequired";
  }
  +[PLGlobalKeyValue setGlobalValue:0 forKey:v7 managedObjectContext:v8];
}

- (void)incrementSpotlightClientStateMismatchedCount
{
  char v3 = [(PLGlobalValues *)self searchIndexSpotlightClientStateMismatchedCount];
  uint64_t v4 = [v3 unsignedIntegerValue];

  id v5 = [NSNumber numberWithUnsignedInteger:v4 + 1];
  [(PLGlobalValues *)self setSearchIndexSpotlightClientStateMismatchedCount:v5];
}

- (void)incrementSpotlightClientStateMissingCount
{
  char v3 = [(PLGlobalValues *)self searchIndexSpotlightClientStateMissingCount];
  uint64_t v4 = [v3 unsignedIntegerValue];

  id v5 = [NSNumber numberWithUnsignedInteger:v4 + 1];
  [(PLGlobalValues *)self setSearchIndexSpotlightClientStateMissingCount:v5];
}

- (id)searchIndexSpotlightClientStateData
{
  id v2 = [(PLGlobalValues *)self searchIndexSpotlightClientState];
  if (v2)
  {
    char v3 = [(id)objc_opt_class() searchIndexSpotlightClientStateDataWithDictionary:v2];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (double)searchIndexUptimeIsRebuildInProgress:(BOOL *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLGlobalValues *)self searchIndexRebuildStartDate];
  id v6 = [(PLGlobalValues *)self searchIndexRebuildEndDate];
  BOOL v7 = [(PLGlobalValues *)self isSearchIndexRebuildFinished];
  if (v7)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [v5 timeIntervalSinceReferenceDate];
    if (v9 > v10)
    {
      id v11 = [MEMORY[0x1E4F1C9C8] now];
      [v11 timeIntervalSinceDate:v6];
      double v13 = v12;

      goto LABEL_13;
    }
    goto LABEL_7;
  }
  [v5 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v6 timeIntervalSinceReferenceDate];
  if (v15 <= v16)
  {
LABEL_7:
    v18 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = @"YES";
      if (v7) {
        id v19 = @"NO";
      }
      id v20 = v19;
      int v22 = 138543874;
      id v23 = v20;
      __int16 v24 = 2114;
      v25 = v5;
      __int16 v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to get search index uptime. Invalid index rebuild completion status [%{public}@], start date [%{public}@], end date [%{public}@]", (uint8_t *)&v22, 0x20u);
    }
    goto LABEL_12;
  }
  if (v6)
  {
    [v5 timeIntervalSinceDate:v6];
    double v13 = v17;
    goto LABEL_13;
  }
LABEL_12:
  double v13 = 0.0;
LABEL_13:
  if (a3) {
    *a3 = !v7;
  }

  return v13;
}

- (double)searchIndexRebuildTimeIsRebuildInProgress:(BOOL *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLGlobalValues *)self searchIndexRebuildStartDate];
  id v6 = [(PLGlobalValues *)self searchIndexRebuildEndDate];
  BOOL v7 = [(PLGlobalValues *)self isSearchIndexRebuildFinished];
  if (v7)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [v5 timeIntervalSinceReferenceDate];
    if (v9 > v10)
    {
      if (v5)
      {
        [v6 timeIntervalSinceDate:v5];
        double v12 = v11;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    [v5 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v6 timeIntervalSinceReferenceDate];
    if (v14 > v15)
    {
      double v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v5];
      double v12 = v17;

      goto LABEL_13;
    }
  }
  v18 = PLSearchBackendIndexRebuildGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = @"YES";
    if (v7) {
      id v19 = @"NO";
    }
    id v20 = v19;
    int v22 = 138543874;
    id v23 = v20;
    __int16 v24 = 2114;
    v25 = v5;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to get search index rebuild time. Invalid index rebuild completion status [%{public}@], start date [%{public}@], end date [%{public}@]", (uint8_t *)&v22, 0x20u);
  }
LABEL_12:
  double v12 = 0.0;
LABEL_13:
  if (a3) {
    *a3 = !v7;
  }

  return v12;
}

- (BOOL)isSearchIndexRebuildFinished
{
  return ([(PLGlobalValues *)self unpackedSearchIndexStatus] >> 4) & 1;
}

- (void)addSearchIndexRebuildCoalescedReasons:(unint64_t)a3
{
  unint64_t v5 = [(PLGlobalValues *)self unpackedSearchIndexRebuildCoalescedReasons];
  if (v5 != (v5 | a3))
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PLGlobalValues *)self setSearchIndexRebuildCoalescedReasons:v6];
  }
}

- (void)addRebuildRequiredExternalReasons:(unint64_t)a3
{
  unint64_t v5 = [(PLGlobalValues *)self unpackedSearchIndexRebuildRequiredExternalReasons];
  if (v5 != (v5 | a3))
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PLGlobalValues *)self setSearchIndexRebuildRequiredExternalReasons:v6];
  }
}

- (BOOL)shouldDropGlobalSpotlightIndexForLibraryIdentifier:(int64_t)a3
{
  BOOL result = 0;
  if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:a3])
  {
    uint64_t v4 = [(PLGlobalValues *)self searchIndexVersion];
    if (!v4) {
      return 1;
    }
    unint64_t v5 = v4;
    uint64_t v6 = [v4 integerValue];

    if (v6 < 18004) {
      return 1;
    }
  }
  return result;
}

- (unint64_t)searchIndexRebuildReasonsWithSceneTaxonomyDigests:(id)a3 spotlightRequestedRebuild:(BOOL)a4 pathManager:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(PLGlobalValues *)self _isNewLibraryOrRebuildWithPathManager:a5]) {
    uint64_t v9 = 1024;
  }
  else {
    uint64_t v9 = 0;
  }
  double v10 = [(PLGlobalValues *)self searchIndexVersion];
  uint64_t v11 = [v10 unsignedIntegerValue];

  if (v11 != 18007)
  {
    double v12 = [(PLGlobalValues *)self searchIndexVersion];
    unint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v14 = 33;
    if (v13 >= 0x4654) {
      uint64_t v14 = 1;
    }
    v9 |= v14;
  }
  unint64_t v15 = +[PLSearchIndexConfiguration currentEmbeddingModelVersion];
  double v16 = [(PLGlobalValues *)self searchIndexEmbeddingModelVersion];
  uint64_t v17 = [v16 unsignedIntegerValue];

  if (v15 != v17) {
    v9 |= 0x40uLL;
  }
  unint64_t v18 = +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion];
  id v19 = [(PLGlobalValues *)self searchIndexUtilityTypeClassifierVersion];
  uint64_t v20 = [v19 unsignedIntegerValue];

  if (v18 == v20) {
    uint64_t v21 = v9;
  }
  else {
    uint64_t v21 = v9 | 0x80;
  }
  int v22 = +[PLSearchIndexConfiguration locale];
  id v23 = [v22 localeIdentifier];
  __int16 v24 = [(PLGlobalValues *)self searchIndexLocaleIdentifier];
  int v25 = [v23 isEqualToString:v24];

  if (v25) {
    uint64_t v26 = v21;
  }
  else {
    uint64_t v26 = v21 | 2;
  }
  id v27 = [(PLGlobalValues *)self searchIndexSceneTaxonomySHA];
  if (v27 != v8 && ![v8 isEqualToString:v27]) {
    v26 |= 4uLL;
  }
  unint64_t v28 = [(PLGlobalValues *)self unpackedSearchIndexStatus];
  unint64_t v29 = 0;
  unint64_t v30 = 1;
  do
  {
    unint64_t v31 = v30 | v29;
    if (((1 << v30) & 0x10116) == 0) {
      unint64_t v31 = v29;
    }
    if (v30 <= 0x10) {
      unint64_t v29 = v31;
    }
    BOOL v32 = v30 >= 9;
    v30 *= 2;
  }
  while (!v32);
  if ((v29 & ~v28) != 0) {
    v26 |= 0x10uLL;
  }
  unint64_t v33 = [(PLGlobalValues *)self unpackedSearchIndexRebuildRequiredExternalReasons];
  if (v6) {
    unint64_t v34 = v26 | v33 | 8;
  }
  else {
    unint64_t v34 = v26 | v33;
  }

  return v34;
}

- (BOOL)_isNewLibraryOrRebuildWithPathManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PLGlobalValues *)self searchIndexVersion];

  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    char v18 = 0;
    BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [v4 searchIndexSystemInfoFilePath];
    int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v18];

    if (v9)
    {
      if (v18)
      {
        double v10 = PLSearchBackendIndexRebuildGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Legacy search index system info file is a directory", buf, 2u);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      double v12 = [v4 searchIndexSystemInfoFilePath];
      id v17 = 0;
      char v13 = [v11 removeItemAtPath:v12 error:&v17];
      id v14 = v17;

      if ((v13 & 1) == 0)
      {
        unint64_t v15 = PLSearchBackendIndexRebuildGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v14;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to remove legacy search index system info file: %@", buf, 0xCu);
        }
      }
    }
    char v6 = v9 ^ 1;
  }

  return v6;
}

- (BOOL)markRebuildPhaseCompleted:(unint64_t)a3
{
  unint64_t v5 = [(PLGlobalValues *)self unpackedSearchIndexStatus];
  unint64_t v6 = v5 & a3;
  if ((v5 & a3) != a3)
  {
    BOOL v7 = [NSNumber numberWithUnsignedLongLong:v5 | a3];
    [(PLGlobalValues *)self setSearchIndexStatus:v7];

    [(PLGlobalValues *)self setSearchIndexRebuildResumeMarker:0];
    if ([(PLGlobalValues *)self isSearchIndexRebuildFinished])
    {
      id v8 = [MEMORY[0x1E4F1C9C8] now];
      [(PLGlobalValues *)self setSearchIndexRebuildEndDate:v8];
    }
  }
  return v6 != a3;
}

- (void)resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:(id)a3
{
  id v4 = a3;
  [(PLGlobalValues *)self clearRebuildFinishedFlags];
  [(PLGlobalValues *)self setSearchIndexRebuildResumeMarker:0];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentSearchIndexVersion](PLSearchIndexConfiguration, "currentSearchIndexVersion"));
  [(PLGlobalValues *)self setSearchIndexVersion:v5];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentEmbeddingModelVersion](PLSearchIndexConfiguration, "currentEmbeddingModelVersion"));
  [(PLGlobalValues *)self setSearchIndexEmbeddingModelVersion:v6];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion](PLSearchIndexConfiguration, "currentUtilityTypeClassifierVersion"));
  [(PLGlobalValues *)self setSearchIndexUtilityTypeClassifierVersion:v7];

  id v8 = +[PLSearchIndexConfiguration locale];
  int v9 = [v8 localeIdentifier];
  [(PLGlobalValues *)self setSearchIndexLocaleIdentifier:v9];

  [(PLGlobalValues *)self setSearchIndexSceneTaxonomySHA:v4];
  double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration featureSettings](PLSearchIndexConfiguration, "featureSettings"));
  [(PLGlobalValues *)self setSearchIndexFeatureSettings:v10];

  [(PLGlobalValues *)self setSearchIndexSpotlightClientState:0];
  [(PLGlobalValues *)self setSearchIndexRebuildRequiredExternalReasons:0];
}

- (void)clearRebuildFinishedFlags
{
  unint64_t v3 = [(PLGlobalValues *)self unpackedSearchIndexStatus];
  if ((v3 & 0xFFFFFFFFFFFFFFE0) != v3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PLGlobalValues *)self setSearchIndexStatus:v4];
  }
}

- (void)setSearchIndexRebuildResumeObjectID:(id)a3
{
  id v5 = [a3 URIRepresentation];
  id v4 = [v5 absoluteString];
  [(PLGlobalValues *)self setSearchIndexRebuildResumeMarker:v4];
}

- (NSManagedObjectID)searchIndexRebuildResumeObjectID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLGlobalValues *)self searchIndexRebuildResumeMarker];
  if (v3)
  {
    id v4 = [(PLGlobalValues *)self moc];
    id v5 = [v4 persistentStoreCoordinator];
    unint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    BOOL v7 = [v5 managedObjectIDForURIRepresentation:v6];

    unint64_t v8 = [(PLGlobalValues *)self searchIndexingEntityToRebuild];
    int v9 = [v7 entity];
    double v10 = [v9 name];
    uint64_t v11 = PLSearchIndexingEntityForEntityName(v10);

    if (v11 == v8) {
      goto LABEL_10;
    }
    double v12 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v8 > 8) {
        char v13 = @"invalid";
      }
      else {
        char v13 = off_1E586EAE8[v8];
      }
      id v14 = v13;
      int v16 = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v14;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Rebuild resume object ID %{public}@ does not match stored entity to rebuild: %{public}@, cannot resume from this token", (uint8_t *)&v16, 0x16u);
    }
  }
  BOOL v7 = 0;
LABEL_10:

  return (NSManagedObjectID *)v7;
}

- (BOOL)rebuildWorkIsRequiredForEntity:(unint64_t)a3
{
  BOOL result = 0;
  if (a3 <= 8 && ((0xBAu >> a3) & 1) != 0)
  {
    uint64_t v5 = qword_19BA9EAF0[a3];
    return ([(PLGlobalValues *)self unpackedSearchIndexStatus] & v5) == 0;
  }
  return result;
}

- (unint64_t)searchIndexingEntityToRebuild
{
  unint64_t v2 = [(PLGlobalValues *)self unpackedSearchIndexStatus];
  unint64_t result = 0;
  while (((0xBAu >> result) & 1) == 0 || (qword_19BA9EAF0[result] & ~v2) == 0)
  {
    if (++result == 9) {
      return 0;
    }
  }
  return result;
}

- (unint64_t)unpackedSearchIndexRebuildCoalescedReasons
{
  unint64_t v3 = [(PLGlobalValues *)self searchIndexRebuildCoalescedReasons];
  if (v3)
  {
    id v4 = [(PLGlobalValues *)self searchIndexRebuildCoalescedReasons];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexRebuildRequiredExternalReasons
{
  unint64_t v3 = [(PLGlobalValues *)self searchIndexRebuildRequiredExternalReasons];
  if (v3)
  {
    id v4 = [(PLGlobalValues *)self searchIndexRebuildRequiredExternalReasons];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexFeatureSettings
{
  unint64_t v3 = [(PLGlobalValues *)self searchIndexFeatureSettings];
  if (v3)
  {
    id v4 = [(PLGlobalValues *)self searchIndexFeatureSettings];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexStatus
{
  unint64_t v3 = [(PLGlobalValues *)self searchIndexStatus];
  if (v3)
  {
    id v4 = [(PLGlobalValues *)self searchIndexStatus];
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (id)searchIndexSpotlightClientStateWithData:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  unint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v11];
  id v4 = v11;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [MEMORY[0x1E4F8B9B8] successWithResult:v3];

      goto LABEL_6;
    }
    unint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"Spotlight client state is not a dictionary";
    unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:46514 userInfo:v8];

    id v4 = (id)v9;
  }
  unint64_t v5 = [MEMORY[0x1E4F8B9B8] failureWithError:v4];
LABEL_6:

  return v5;
}

+ (id)searchIndexSpotlightClientStateDataWithDictionary:(id)a3
{
  uint64_t v6 = 0;
  unint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v6];
  if (v3) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
  }

  return v4;
}

+ (id)searchIndexSpotlightClientStateDictionaryWithIdentifier:(id)a3 timestamp:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v5;
  if ((unint64_t)[v5 length] >= 0x25)
  {
    unint64_t v8 = [v5 substringToIndex:33];
    uint64_t v7 = [v8 stringByAppendingString:@"..."];
  }
  v16[0] = @"v";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:PLSearchIndexSpotlightClientStateVersion];
  v17[0] = v9;
  v16[1] = @"t";
  double v10 = NSNumber;
  [v6 timeIntervalSinceReferenceDate];
  double v12 = v11;

  char v13 = [v10 numberWithDouble:v12];
  v16[2] = @"i";
  v17[1] = v13;
  v17[2] = v7;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v14;
}

@end