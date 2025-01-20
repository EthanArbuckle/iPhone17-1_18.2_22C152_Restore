@interface PLPhotoLibrary
+ (BOOL)_assetsLibrary_isSharedPhotoStreamsSupportEnabled;
+ (BOOL)areOpportunisticTasksDisabled;
+ (BOOL)canSaveVideoToLibrary:(id)a3;
+ (BOOL)isAdjustmentEnvelopeExtension:(id)a3;
+ (BOOL)isAudioFileExtension:(id)a3;
+ (BOOL)isImageFileExtension:(id)a3;
+ (BOOL)isNonRawImageFileExtension:(id)a3;
+ (BOOL)isRawImageFileExtension:(id)a3;
+ (BOOL)isVideoFileExtension:(id)a3;
+ (BOOL)removeFaceMetadataAtURL:(id)a3 includingPeople:(BOOL)a4;
+ (BOOL)shouldTryFastPathWithLibraryBundle:(id)a3;
+ (BOOL)systemPhotoLibraryIsObtainable;
+ (id)_debugStatisticsDescription;
+ (id)_internalSystemPhotoLibrary;
+ (id)_resourcesInfoFromMoc:(id)a3;
+ (id)_stateDictionary;
+ (id)deferredPhotoPreviewDestinationURLForPrimaryAssetURL:(id)a3;
+ (id)fileReservationForFileAtPath:(id)a3 exclusive:(BOOL)a4;
+ (id)masterURLFromSidecarURLs:(id)a3;
+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromBundle:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)opportunisticTaskIsolationQueue;
+ (id)photoOutboundSharingTmpDirectoryURL;
+ (id)queueStatusDescription;
+ (id)requestIdentifierFromDeferredIdentifier:(id)a3;
+ (id)savedPhotosOriginalsSizeWithSizeDataRef:(id)a3;
+ (id)savedPhotosReferenceMediaSizeWithSizeDataRef:(id)a3;
+ (id)stringFromLibraryRole:(unint64_t)a3;
+ (id)systemMainQueuePhotoLibrary;
+ (int)priorityForFileExtension:(id)a3;
+ (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3;
+ (unint64_t)CloudPhotoLibrarySize;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ABORT_4_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_AUTH_23_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_BUSY_5_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CANTOPEN_14_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CONSTRAINT_19_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CORRUPT_11_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_DONE_101_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_EMPTY_16_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_SQLITE_ERROR_SNAPSHOT_769_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FORMAT_24_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FULL_13_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERNAL_2_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERRUPT_9_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_IOERR_10_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_LOCKED_6_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISMATCH_20_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISUSE_21_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOLFS_22_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOMEM_7_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTADB_26_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTFOUND_12_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTICE_27_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_OTHER_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PERM_3_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PROTOCOL_15_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_RANGE_25_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_READONLY_8_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ROW_100_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_SCHEMA_17_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_TOOBIG_18_withCode:(int)a3;
+ (void)_abortFromMocExecFail_NSMOC_SQLITE_WARNING_28_withCode:(int)a3;
+ (void)_activateStatusTimer;
+ (void)_assetsLibrary_disableSharedPhotoStreamsSupport;
+ (void)_context:(id)a3 saveFailedWithError:(id)a4;
+ (void)_contextSaveFailedDueToChangingSPL:(id)a3;
+ (void)_contextSaveFailedDueToClientRequestedShutdown:(id)a3;
+ (void)_contextSaveFailedWithCocoaError:(id)a3 message:(id)a4;
+ (void)_contextSaveFailedWithError:(id)a3;
+ (void)_contextSaveFailedWithNSManagedObjectConstraintValidationError:(id)a3;
+ (void)_contextSaveFailedWithNSManagedObjectContextRecursiveSaveError:(id)a3;
+ (void)_contextSaveFailedWithNSManagedObjectValidationError:(id)a3;
+ (void)_contextSaveFailedWithNSPersistentStoreSaveError:(id)a3;
+ (void)_contextSaveFailedWithNSPersistentStoreTimeoutError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationDateTooLateError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationDateTooSoonError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationInvalidDateError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationInvalidURIError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationMissingMandatoryPropertyError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationMultipleErrorsError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationNumberTooLargeError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationNumberTooSmallError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationRelationshipDeniedDeleteError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationRelationshipExceedsMaximumCountError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationRelationshipLacksMinimumCountError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationStringPatternMatchingError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationStringTooLongError:(id)a3;
+ (void)_contextSaveFailedWithNSValidationStringTooShortError:(id)a3;
+ (void)_contextSaveFailedWithNoPersistentStores:(id)a3;
+ (void)_contextSaveFailedWithOtherCocoaError:(id)a3;
+ (void)_contextSaveFailedWithTimeoutError:(id)a3;
+ (void)_getResourceData:(id)a3 nonDerivativeSizeOut:(unint64_t *)a4 derivativesSizeOut:(unint64_t *)a5 fileBackedThumbnailsSizeOut:(unint64_t *)a6 tableThumbnailsSizeOut:(unint64_t *)a7;
+ (void)_loadFileExtensionInformation;
+ (void)_registerStateHandler;
+ (void)_withDispatchGroup:(id)a3 onContext:(id)a4 synchronously:(BOOL)a5 shouldSave:(BOOL)a6 refreshAfterSave:(BOOL)a7 performTransaction:(id)a8 completionHandler:(id)a9;
+ (void)configureEnumeratorForLibrarySizeInfo:(id)a3 completion:(id)a4;
+ (void)contextExecuteFailedWithSQLiteResultCode:(int)a3;
+ (void)postGlobalPhotoLibraryAvailableIfNecessary;
+ (void)refreshCachedCountsAndDates:(BOOL)a3 onAssetsContainerClass:(Class)a4 inContext:(id)a5 withPredicate:(id)a6;
+ (void)refreshCachedCountsOnAllAssetContainersInContext:(id)a3;
+ (void)reportLibraryDidDealloc:(id)a3;
+ (void)reportLibraryDidInit:(id)a3;
+ (void)setCloudAlbumSharingEnabled:(BOOL)a3;
+ (void)setPhotoStreamEnabled:(BOOL)a3;
- (BOOL)_hasIncompleteAsset;
- (BOOL)_isUnknownAssetColumnError:(id)a3;
- (BOOL)batchDeleteAssetsWithPredicate:(id)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)batchDeleteObjectsWithEntity:(id)a3 predicate:(id)a4 error:(id *)a5;
- (BOOL)deleteAllDiagnosticFiles:(id *)a3;
- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4;
- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4 excludeTrashed:(BOOL)a5 excludeInvisible:(BOOL)a6 excludeCloudShared:(BOOL)a7;
- (BOOL)hasCompletedMomentAnalysis;
- (BOOL)hasCompletedRestorePostProcessing;
- (BOOL)hasITunesSyncedContent;
- (BOOL)hasPendingAssetsIgnoreiTunes:(BOOL)a3;
- (BOOL)isAlbumSynced:(id)a3;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isReadyForCloudPhotoLibrary;
- (BOOL)isUnitTesting;
- (BOOL)isWalrusEnabled;
- (BOOL)loadDatabaseWithOptions:(id)a3 error:(id *)a4;
- (BOOL)safeSave:(id)a3 error:(id *)a4;
- (BOOL)unloadDatabase:(id *)a3;
- (NSArray)photoStreamAlbums;
- (NSArray)photoStreamAlbumsForPreferences;
- (NSArray)syncedAlbums;
- (NSString)name;
- (PAImageConversionServiceClient)imageConversionServiceClient;
- (PAVideoConversionServiceClient)videoConversionServiceClient;
- (PLAlbumProtocol)filesystemImportProgressAlbum;
- (PLAlbumProtocol)otaRestoreProgressAlbum;
- (PLAlbumProtocol)syncProgressAlbum;
- (PLGlobalValues)globalValues;
- (PLKeywordManager)keywordManager;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLManagedObjectContext)managedObjectContext;
- (PLPhotoLibrary)init;
- (PLPhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5;
- (PLPhotoLibraryBundle)libraryBundle;
- (PLPhotoLibraryOptions)options;
- (PLPhotoLibraryPathManager)pathManager;
- (PLThumbnailIndexes)thumbnailIndexes;
- (PLThumbnailManager)thumbnailManager;
- (id)_fetchCompleteAssetIDsWithValidatedSavedAssetTypeMask:(unsigned int)a3 context:(id)a4;
- (id)_fetchedObjectsForDeleteWithEntity:(id)a3 predicate:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6;
- (id)_initWithPathManager:(id)a3;
- (id)_internal_managedObjectContext;
- (id)_loadClientDatabaseContextFastPath;
- (id)_loadClientDatabaseContextWithOptions:(id)a3 error:(id *)a4;
- (id)_loadDatabaseContextWithOptions:(id)a3 error:(id *)a4;
- (id)_loadServerDatabaseContextWithOptions:(id)a3 error:(id *)a4;
- (id)addDCIMEntryAtFileURL:(id)a3 mainFileMetadata:(id)a4 previewImage:(id)a5 thumbnailImage:(id)a6 savedAssetType:(signed __int16)a7 replacementUUID:(id)a8 publicGlobalUUID:(id)a9 extendedInfo:(id)a10 withUUID:(id)a11 isPlaceholder:(BOOL)a12 placeholderFileURL:(id)a13 forFinalCameraImage:(BOOL)a14;
- (id)albumFromGroupURL:(id)a3;
- (id)albumListForAlbumOfKind:(int)a3;
- (id)albumListForContentMode:(int)a3;
- (id)albumWithUuid:(id)a3;
- (id)allImportedPhotosAlbum;
- (id)allImportedPhotosAlbumCreateIfNeeded:(BOOL)a3;
- (id)assetURLForPhoto:(id)a3;
- (id)assetURLForPhoto:(id)a3 extension:(id)a4;
- (id)assetWithUUID:(id)a3;
- (id)assetWithUUID:(id)a3 inContainer:(id)a4;
- (id)assetsdClient;
- (id)constraintsDirector;
- (id)cplStatus;
- (id)description;
- (id)estimatedLibrarySizes;
- (id)eventAlbumContainingPhoto:(id)a3;
- (id)eventWithName:(id)a3 andImportSessionIdentifier:(id)a4;
- (id)fingerprintContext;
- (id)iTunesSyncedContentInfo;
- (id)incompleteRestoreProcesses;
- (id)lastImportedPhotosAlbum;
- (id)lastImportedPhotosAlbumCreateIfNeeded:(BOOL)a3;
- (id)libraryID;
- (id)librarySizes;
- (id)librarySizesFromDB;
- (id)librarySizesFromDBForLibraryKindMask:(unint64_t)a3;
- (id)mainScopeIdentifier;
- (id)managedObjectContextStoreUUID;
- (id)objectWithObjectID:(id)a3;
- (id)personInfoManager;
- (id)photoAnalysisClient;
- (id)photoFromAssetURL:(id)a3;
- (id)photoOutboundSharingTmpDirectoryURL;
- (id)shortLivedLibraryCopyByAppendingName:(const char *)a3;
- (id)syncProgressAlbumsIgnoreiTunes:(BOOL)a3;
- (id)syncedAlbumSubtitleStringFormat;
- (id)transactionCompletionHandlers;
- (unint64_t)_dbFileSizes;
- (unint64_t)_fileSizeAtPath:(id)a3;
- (unint64_t)countOfLocalAlbumsContainingAssets:(id)a3 assetsInSomeAlbumCount:(int64_t *)a4;
- (unint64_t)numberOfCPLSupportedAssetsOfKind:(signed __int16)a3 includingTrashedSinceDate:(id)a4;
- (unint64_t)numberOfUnpushedAssetsOfKind:(signed __int16)a3;
- (unint64_t)pendingTransactions;
- (unint64_t)role;
- (unint64_t)sharedStreamsSize;
- (void)_cancelAllDeferredPrewarming;
- (void)_deleteEmptyImportAlbumsWithAddedAlbums:(id)a3;
- (void)_deleteObsoleteMetadataFiles;
- (void)_enumerateFilesAtURL:(id)a3 withBlock:(id)a4;
- (void)_enumerateFilesAtURLs:(id)a3 withBlock:(id)a4;
- (void)_filterAlbums:(id)a3 toTrashableAlbums:(id *)a4 deletableAlbums:(id *)a5 otherAlbums:(id *)a6;
- (void)_filterAssets:(id)a3 toTrashableAssets:(id *)a4 deletableAssets:(id *)a5 otherAssets:(id *)a6;
- (void)_inq_createPhotoStreamAlbumStreamID:(id)a3;
- (void)_markForRebuildAndAbortWithReason:(int64_t)a3 error:(id)a4;
- (void)_pauseChangeHandlingNotifications;
- (void)_photoLibraryCorruptNotification;
- (void)_photoLibraryForceClientExitNotification;
- (void)_processPhotoIrisSidecarIfNecessary:(id)a3 forAsset:(id)a4 mainFileMetadata:(id)a5;
- (void)_reallyDisableOpportunisticTasks;
- (void)_reallyEnableOpportunisticTasks;
- (void)_rebuildSocialGroups;
- (void)_recreateItemsFromMetadataAtDirectoryURLs:(id)a3 includeAlbums:(BOOL)a4;
- (void)_removeOldFaceMetadataAsync;
- (void)_resumeChangeHandlingNotifications;
- (void)_safeSave:(id)a3;
- (void)_setManagedObjectContext:(id)a3;
- (void)_updateAssetCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5;
- (void)_updateMemoryCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5;
- (void)_userApplyTrashedState:(signed __int16)a3 toAlbums:(id)a4;
- (void)_userApplyTrashedState:(signed __int16)a3 toAssets:(id)a4 localOnlyDelete:(BOOL)a5 trashedReason:(unsigned __int16)a6 expungeReasonFromClient:(id)a7;
- (void)_userDeleteAlbums:(id)a3;
- (void)_userDeleteAssets:(id)a3 withReason:(id)a4 localOnlyDelete:(BOOL)a5;
- (void)addCompletionHandlerToCurrentTransaction:(id)a3;
- (void)batchDeleteAssets:(id)a3 withReason:(id)a4;
- (void)cleanupAfterImportAllDCIMAssets;
- (void)cleanupIncompleteAssetsAfterOTARestore;
- (void)clearTransactionCompletionHandlers;
- (void)clientApplicationWillEnterForeground;
- (void)countOfReferencedMediaWithCompletionHandler:(id)a3;
- (void)createPhotoStreamAlbumWithStreamID:(id)a3;
- (void)dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced;
- (void)dealloc;
- (void)deleteExpiredTrashedAssetsAndAlbums;
- (void)deleteExpiredTrashedResources;
- (void)deleteITunesSyncedContentForEnablingiCPL;
- (void)deleteTTRDeferredIntermediates;
- (void)deleteUnknownDeferredIntermediatesWithCompletionHandler:(id)a3;
- (void)deleteUnusedCameraMetadataPaths;
- (void)disableOpportunisticTasks;
- (void)enableOpportunisticTasks;
- (void)handlePersistentStoreRemoval:(id)a3;
- (void)handlePossibleCoreDataError:(id)a3;
- (void)invalidateWithReason:(id)a3;
- (void)modifyDCIMEntryForPhoto:(id)a3;
- (void)old_refreshCachedCountsOnAllAssetContainersInContext:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 completionHandler:(id)a4;
- (void)performBlock:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5;
- (void)performBlock:(id)a3 withPriority:(int64_t)a4;
- (void)performBlockAndWait:(id)a3;
- (void)performBlockAndWait:(id)a3 completionHandler:(id)a4;
- (void)performBlockAndWait:(id)a3 forceSave:(BOOL)a4;
- (void)performTransaction:(id)a3;
- (void)performTransaction:(id)a3 completionHandler:(id)a4;
- (void)performTransaction:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5;
- (void)performTransaction:(id)a3 withPriority:(int64_t)a4;
- (void)performTransactionAndWait:(id)a3;
- (void)performTransactionAndWait:(id)a3 completionHandler:(id)a4;
- (void)recreateAlbumsAndPersonsFromMetadata;
- (void)recreateMemoriesAndPersonsFromMetadata;
- (void)recreatePersonsFromMetadata;
- (void)repairSingletonObjects;
- (void)reportLibrarySizeToDAS;
- (void)resetCachedImportAlbumsIfNeededForAlbum:(id)a3;
- (void)setPendingTransactions:(unint64_t)a3;
- (void)signalBackgroundProcessingNeeded;
- (void)updateAssetPlayShareViewCountsInContext:(id)a3;
- (void)updateKeyAssetsInAlbums:(id)a3;
- (void)updateMemoryPlayShareViewCountsInContext:(id)a3;
- (void)userExpungeAlbums:(id)a3;
- (void)userExpungeAssets:(id)a3 localOnlyDelete:(BOOL)a4 expungeReasonFromClient:(id)a5;
- (void)userTrashAlbums:(id)a3;
- (void)userTrashAssets:(id)a3 withTrashedReason:(unsigned __int16)a4;
- (void)userUntrashAlbums:(id)a3;
- (void)userUntrashAssets:(id)a3;
- (void)withDispatchGroup:(id)a3 performBlock:(id)a4;
- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4;
- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4 completionHandler:(id)a5;
@end

@implementation PLPhotoLibrary

id __48__PLPhotoLibrary__internal_managedObjectContext__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

- (PLThumbnailManager)thumbnailManager
{
  return (PLThumbnailManager *)PLThumbnailManagerForPathManager();
}

- (BOOL)hasITunesSyncedContent
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PLPhotoLibrary_hasITunesSyncedContent__block_invoke;
  v4[3] = &unk_1E5875E68;
  v4[4] = self;
  v4[5] = &v5;
  [(PLPhotoLibrary *)self performBlockAndWait:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (PLGlobalValues)globalValues
{
  v3 = [PLGlobalValues alloc];
  v4 = [(PLPhotoLibrary *)self managedObjectContext];
  uint64_t v5 = [(PLGlobalValues *)v3 initWithManagedObjectContext:v4];

  return v5;
}

void __40__PLPhotoLibrary_hasITunesSyncedContent__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 1);
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[PLManagedAsset entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setPredicate:v2];
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_1EEBF1520];
  [v5 setFetchLimit:1];
  v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v10 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v5 error:&v10];
  id v8 = v10;

  if (v8)
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error attempting to count iTunes synced assets: %@", buf, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 count] != 0;
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(PLPhotoLibrary *)self managedObjectContext];
  [v5 _withDispatchGroup:0 onContext:v6 synchronously:1 shouldSave:0 refreshAfterSave:0 performTransaction:v4 completionHandler:0];
}

- (PLManagedObjectContext)managedObjectContext
{
  char v2 = [(PLPhotoLibrary *)self _internal_managedObjectContext];
  if (!v2)
  {
    v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "managedObjectContext is only accessible after successfully loading photo library database", v6, 2u);
    }

    if (MEMORY[0x19F38BDA0]())
    {
      id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28778] reason:@"managedObjectContext is only accessible after successfully loading photo library database" userInfo:0];
      objc_exception_throw(v5);
    }
  }
  return (PLManagedObjectContext *)v2;
}

- (id)_internal_managedObjectContext
{
  char v2 = PLResultWithUnfairLock();
  return v2;
}

+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v13 = [v12 lookupOrCreateBundleForLibraryURL:v11];

  v14 = (void *)[a1 newPhotoLibraryWithName:a3 loadedFromBundle:v13 options:v10 error:a6];
  return v14;
}

+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromBundle:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = PLPhotoLibraryGetLog();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315138;
    v25 = a3;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "newPhotoLibraryWithName", "name: %s", buf, 0xCu);
  }

  v16 = (void *)[objc_alloc((Class)a1) initWithName:a3 libraryBundle:v11 options:v10];
  if (v16)
  {
    if ([v16 loadDatabaseWithOptions:v10 error:a6]) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a6)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F8C500];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23 = @"PLPhotoLibrary initWithName:libraryBundle:options: returned nil";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a6 = [v17 errorWithDomain:v18 code:45001 userInfo:v16];
LABEL_9:
  }
  v16 = 0;
LABEL_11:
  v19 = v15;
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134217984;
    v25 = (const char *)v16;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v13, "newPhotoLibraryWithName", "instance: %p", buf, 0xCu);
  }

  return v16;
}

- (BOOL)loadDatabaseWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_managedObjectContextLock = &self->_managedObjectContextLock;
  os_unfair_lock_lock(&self->_managedObjectContextLock);
  if (self->_managedObjectContext)
  {
    char v8 = 1;
    BOOL v9 = 1;
    goto LABEL_23;
  }
  if (PLIsAssetsd())
  {
LABEL_14:
    v21 = [(PLPhotoLibrary *)self _loadDatabaseContextWithOptions:v6 error:a4];
    uint64_t v22 = v21;
    if (!v21)
    {
      BOOL v9 = 0;
LABEL_22:

      char v8 = 1;
      goto LABEL_23;
    }
    v23 = [v21 persistentStoreCoordinator];
    v24 = [v23 persistentStores];
    v25 = [v24 firstObject];

    BOOL v9 = v25 != 0;
    if (v25)
    {
      objc_storeWeak((id *)&self->_loadedPersistentStore, v25);
      objc_storeStrong((id *)&self->_managedObjectContext, v22);
      uint64_t v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v26 addObserver:self selector:sel_handlePersistentStoreRemoval_ name:*MEMORY[0x1E4F1BEB0] object:v23];
    }
    else
    {
      if (!a4)
      {
LABEL_21:

        goto LABEL_22;
      }
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28228];
      v38 = @"Persistent store is nil";
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a4 = [v27 errorWithDomain:*MEMORY[0x1E4F8C500] code:45001 userInfo:v26];
    }

    goto LABEL_21;
  }
  id v10 = [MEMORY[0x1E4F8B998] sharedInstance];
  uint64_t v11 = [v10 photosAccessAllowedWithScope:7];

  id v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "PLPhotosAccessAllowedResult result is %td", buf, 0xCu);
  }

  if (PLPhotosAccessAllowed()) {
    goto LABEL_10;
  }
  os_signpost_id_t v13 = [MEMORY[0x1E4F8B998] sharedInstance];
  uint64_t v14 = [v13 checkPhotosAccessAllowedWithScope:7];

  v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "PLPhotosAccessAllowedResult updatedResult is %td", buf, 0xCu);
  }

  if (PLPhotosAccessAllowed())
  {
LABEL_10:
    if (!+[PLPhotoLibrary systemPhotoLibraryIsObtainable])
    {
      v31 = PLBackendGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v32;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "*** Attempting access to the photo library before it is obtainable. %@", buf, 0xCu);
      }
      id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Access to the photo library is not allowed until the photo library is obtainable." userInfo:0];
      objc_exception_throw(v33);
    }
    if (PLIsSystemLibraryAccessProhibited())
    {
      v16 = [(PLPhotoLibrary *)self pathManager];
      v17 = [v16 libraryURL];
      uint64_t v18 = [v17 URLByStandardizingPath];

      v19 = [MEMORY[0x1E4F8B908] realSystemPhotoLibraryPath];
      v20 = [v18 path];
      LODWORD(v17) = [v19 isEqualToString:v20];

      if (v17)
      {
        v34 = PLBackendGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = [MEMORY[0x1E4F29060] callStackSymbols];
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = (uint64_t)v35;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "*** Attempting access to the system photo library is prohibited. %@", buf, 0xCu);
        }
        id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Access to the system photo library is prohibited." userInfo:0];
        objc_exception_throw(v36);
      }
    }
    goto LABEL_14;
  }
  v29 = PLBackendGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = (uint64_t)v30;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "*** This application is not allowed to access Photo data. %@", buf, 0xCu);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:45002 userInfo:0];
    char v8 = 0;
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v8 = 0;
    BOOL v9 = 0;
  }
LABEL_23:
  os_unfair_lock_unlock(p_managedObjectContextLock);

  return v8 & v9;
}

- (PLPhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 pathManager];
  id v12 = [(PLPhotoLibrary *)self _initWithPathManager:v11];
  os_signpost_id_t v13 = v12;
  if (v12)
  {
    v12->_managedObjectContextLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_libraryBundle, a4);
    uint64_t v14 = [v9 libraryServicesManager];
    objc_storeWeak((id *)&v13->_libraryServicesManager, v14);

    objc_storeStrong((id *)&v13->_options, a5);
    if (a3)
    {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:a3];
      name = v13->_name;
      v13->_name = (NSString *)v15;
    }
    if (![(PLPhotoLibraryBundle *)v13->_libraryBundle registerPLPhotoLibrary:v13])
    {

      os_signpost_id_t v13 = 0;
    }
    +[PLPhotoLibrary reportLibraryDidInit:v13];
    v17 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [(PLPhotoLibrary *)v13 name];
      int v20 = 134218242;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "PLPhotoLibrary %p initWithName %@", (uint8_t *)&v20, 0x16u);
    }
  }

  return v13;
}

- (id)_loadDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (PLIsAssetsd())
  {
    [(PLPhotoLibrary *)self _loadServerDatabaseContextWithOptions:v6 error:a4];
  }
  else
  {
    id v7 = +[PLPhotoLibraryForceExitObserver sharedInstance];
    [(PLPhotoLibrary *)self _loadClientDatabaseContextWithOptions:v6 error:a4];
  char v8 = };

  return v8;
}

- (id)_initWithPathManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPhotoLibrary;
  id v6 = [(PLPhotoLibrary *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathManager, a3);
    char v8 = v7;
  }

  return v7;
}

+ (void)reportLibraryDidInit:(id)a3
{
}

- (id)_loadClientDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (PLIsAssetsd())
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:1845 description:@"Can not be called in assetsd"];
  }
  char v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [(PLPhotoLibrary *)self _loadClientDatabaseContextFastPath];
  if (v9)
  {
    id v10 = v9;
    goto LABEL_21;
  }
  uint64_t v11 = [(PLPhotoLibrary *)self assetsdClient];
  id v12 = [v11 libraryClient];
  id v25 = 0;
  int v13 = [v12 openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:v7 error:&v25];
  id v14 = v25;

  if (!v13)
  {
    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v14;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to load library: %@", buf, 0xCu);
    }
    v19 = v14;
    goto LABEL_17;
  }
  if ([v7 automaticallyPinToFirstFetch]
    && (([v7 automaticallyMergesContext] & 1) != 0 || objc_msgSend(v7, "refreshesAfterSave")))
  {
    uint64_t v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_FAULT, "automaticallyMergesContext/refreshesAfterSave cannot be set with automaticallyPinToFirstFetch on PLPhotoLibaryOptions, disabling automaticallyPinToFirstFetch...", buf, 2u);
    }

    [v7 setAutomaticallyPinToFirstFetch:0];
  }
  uint64_t v16 = +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, [v7 automaticallyMergesContext], objc_msgSend(v7, "automaticallyPinToFirstFetch"));
  if (!v16)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29[0] = @"contextForPhotoLibrary returned nil";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v19 = [v21 errorWithDomain:v22 code:45001 userInfo:v23];

    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to load library (_loadClientDatabaseContext:) %@", buf, 0xCu);
    }
LABEL_17:

    if (a4)
    {
      id v14 = v19;
      v17 = 0;
      *a4 = v14;
    }
    else
    {
      v17 = 0;
      id v14 = v19;
    }
    goto LABEL_20;
  }
  v17 = (void *)v16;
LABEL_20:
  id v10 = v17;

LABEL_21:
  return v10;
}

- (id)_loadClientDatabaseContextFastPath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(PLPhotoLibrary *)self libraryBundle];
  BOOL v4 = +[PLPhotoLibrary shouldTryFastPathWithLibraryBundle:v3];

  if (v4)
  {
    id v5 = [(PLPhotoLibrary *)self options];
    uint64_t v6 = [v5 automaticallyMergesContext];
    id v7 = [(PLPhotoLibrary *)self options];
    char v8 = +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, v6, [v7 automaticallyPinToFirstFetch]);

    if (v8) {
      goto LABEL_7;
    }
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(PLPhotoLibrary *)self pathManager];
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "PLPhotoLibrary %@ fast path loading context failed, falling back to slow path.", (uint8_t *)&v12, 0xCu);
    }
  }
  char v8 = 0;
LABEL_7:
  return v8;
}

- (PLPhotoLibraryOptions)options
{
  return self->_options;
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 72, 1);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

+ (BOOL)shouldTryFastPathWithLibraryBundle:(id)a3
{
  id v3 = a3;
  if (shouldTryFastPathWithLibraryBundle__onceToken != -1) {
    dispatch_once(&shouldTryFastPathWithLibraryBundle__onceToken, &__block_literal_global_579);
  }
  if (shouldTryFastPathWithLibraryBundle__cameraOrPhotosApp == 1
    && ([v3 sqliteErrorIndicatorFileExists] & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F8B980];
    id v7 = [v3 libraryURL];
    unsigned int v4 = [v6 isSystemPhotoLibraryURL:v7];

    if (v4) {
      unsigned int v4 = PLIsRunningInStoreDemoMode() ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (unint64_t)role
{
  char v2 = [(PLPhotoLibrary *)self options];
  unint64_t v3 = [v2 libraryRole];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

+ (id)stringFromLibraryRole:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @".UnknownRole(%tu)", a3);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v3 = off_1E5862D88[a3];
  }
  return v3;
}

+ (void)_withDispatchGroup:(id)a3 onContext:(id)a4 synchronously:(BOOL)a5 shouldSave:(BOOL)a6 refreshAfterSave:(BOOL)a7 performTransaction:(id)a8 completionHandler:(id)a9
{
  BOOL v40 = a5;
  int v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v37 = a9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler__s_onceToken != -1) {
    dispatch_once(&_withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler__s_onceToken, block);
  }
  if (qos_class_self() == QOS_CLASS_BACKGROUND)
  {
    uint64_t v16 = 0;
  }
  else
  {
    qos_class_t v17 = qos_class_self();
    uint64_t v16 = 1;
    if (v17 != QOS_CLASS_UTILITY) {
      uint64_t v16 = 2;
    }
  }
  uint64_t v18 = (atomic_ullong *)((char *)&s_megamocStatsPerQOS + 32 * v16);
  __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  atomic_fetch_add(v18 + 1, 1uLL);
  int v20 = [v14 photoLibrary];
  int v21 = PLIsAssetsd();
  if (!v21)
  {
    uint64_t v22 = 0;
    if (!v13) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F8BA48], "transaction:", "+[PLPhotoLibrary(MegaMocAdditions) _withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:]", v37);
  if (v13) {
LABEL_11:
  }
    dispatch_group_enter(v13);
LABEL_12:
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2;
  v50[3] = &unk_1E5868398;
  BOOL v60 = a6;
  id v23 = v20;
  id v51 = v23;
  id v24 = v15;
  id v55 = v24;
  v57 = v18;
  __uint64_t v58 = v19;
  id v25 = v14;
  id v52 = v25;
  id v59 = a1;
  id v26 = v37;
  id v56 = v26;
  BOOL v61 = a7;
  id v27 = v13;
  v53 = v27;
  id v28 = v22;
  id v54 = v28;
  v29 = (void *)MEMORY[0x19F38D650](v50);
  if (v21)
  {
    v39 = v27;
    v30 = +[PLConcurrencyLimiter sharedLimiter];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_92;
    v43[3] = &unk_1E58683C0;
    id v44 = v25;
    id v47 = v29;
    id v48 = v26;
    id v31 = v30;
    id v45 = v31;
    id v32 = v24;
    id v49 = v32;
    id v33 = v23;
    id v46 = v33;
    v34 = (void (**)(void))MEMORY[0x19F38D650](v43);
    if (v40)
    {
      if (+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform])
      {
        v34[2](v34);
      }
      else
      {
        [v31 sync:v34 identifyingBlock:v32 library:v33];
      }
    }
    else
    {
      [v31 async:v34 identifyingBlock:v32 library:v33];
    }
    id v27 = v39;
  }
  else
  {
    if (v40) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = 5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = v25;
      char v36 = objc_msgSend(v31, "pl_performWithOptions:andBlock:", v35, v29);
      if (v26 && (v36 & 1) == 0) {
        [v31 performWithOptions:v35 andBlock:v26];
      }
    }
    else
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_4;
      v41[3] = &unk_1E5875198;
      id v42 = v29;
      [v25 performWithOptions:v35 andBlock:v41];
      id v31 = v42;
    }
  }
}

+ (BOOL)systemPhotoLibraryIsObtainable
{
  if (PLIsAssetsd())
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"PLPhotoLibrary.m" lineNumber:1426 description:@"Only called by assetsd clients"];
  }
  id v4 = a1;
  objc_sync_enter(v4);
  if (!systemPhotoLibraryIsObtainable_obtainable)
  {
    if (PLIsPTPD()) {
      char v5 = !+[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState];
    }
    else {
      char v5 = 0;
    }
    systemPhotoLibraryIsObtainable_obtainable = (MKBDeviceUnlockedSinceBoot() == 1) & ~v5;
  }
  objc_sync_exit(v4);

  return systemPhotoLibraryIsObtainable_obtainable;
}

- (id)_loadServerDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    char v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:1884 description:@"Can only be called in assetsd"];
  }
  char v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = [(PLPhotoLibrary *)self options];

  if (v9)
  {
    id v10 = [(PLPhotoLibrary *)self options];
    uint64_t v11 = [v10 requiredState];

    if (v11)
    {
      int v12 = [(PLPhotoLibrary *)self options];
      uint64_t v13 = [v12 requiredState];
    }
    else
    {
      uint64_t v13 = 7;
    }
    id v15 = [(PLPhotoLibrary *)self options];
    int v16 = [v15 preventsWaitingForRequiredState];

    int v14 = v16 ^ 1;
  }
  else
  {
    int v14 = 1;
    uint64_t v13 = 7;
  }
  qos_class_t v17 = [(PLPhotoLibrary *)self pathManager];
  uint64_t v18 = [v17 libraryURL];
  __uint64_t v19 = +[PLLibraryServicesManager libraryServicesManagerForLibraryURL:v18];

  if ([v19 state] >= v13)
  {
    id v23 = 0;
  }
  else
  {
    if (!v14)
    {
      id v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F8C500];
      v40[0] = @"requiredState";
      v29 = [NSNumber numberWithInteger:v13];
      v40[1] = @"libraryState";
      v41[0] = v29;
      id v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "state"));
      v41[1] = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      uint64_t v22 = [v31 errorWithDomain:v32 code:43002 userInfo:v34];

      goto LABEL_21;
    }
    id v37 = 0;
    char v20 = [v19 awaitLibraryState:v13 error:&v37];
    id v21 = v37;
    uint64_t v22 = (uint64_t)v21;
    if ((v20 & 1) == 0)
    {
      v29 = PLBackendGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v22;
        v30 = "awaitLibraryState failed: %@";
        goto LABEL_20;
      }
LABEL_21:

      id v25 = 0;
      id v23 = (void *)v22;
      goto LABEL_22;
    }
    id v23 = v21;
  }
  id v24 = [(PLPhotoLibrary *)self options];
  id v25 = +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, [v24 automaticallyMergesContext], objc_msgSend(v7, "automaticallyPinToFirstFetch"));

  if (!v25)
  {
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F8C500];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    v39 = @"Load server database context: contextForPhotoLibrary returned nil";
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v22 = [v26 errorWithDomain:v27 code:45001 userInfo:v28];

    v29 = PLBackendGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v22;
      v30 = "Failed to load library (_loadServerDatabaseContextWithOptions:error:) %@";
LABEL_20:
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_22:

  if (a4 && !v25) {
    *a4 = v23;
  }

  return v25;
}

void __53__PLPhotoLibrary_shouldTryFastPathWithLibraryBundle___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (([v1 isEqual:@"com.apple.camera"] & 1) != 0
    || [v1 isEqual:@"com.apple.mobileslideshow"])
  {
    shouldTryFastPathWithLibraryBundle__cameraOrPhotosApp = 1;
  }
}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 104)) {
    a1 = objc_msgSend(*(id *)(a1 + 32), "setPendingTransactions:", objc_msgSend(*(id *)(a1 + 32), "pendingTransactions") + 1);
  }
  if (*(void *)(v1 + 64))
  {
    char v2 = (void *)MEMORY[0x19F38D3B0](a1);
    if ((unint64_t)[*(id *)(v1 + 32) pendingTransactions] >= 2 && *(unsigned char *)(v1 + 104)) {
      atomic_fetch_add(&s_nestedWriteTransactionCount, 1uLL);
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(v1 + 80) + 8), 0xFFFFFFFFFFFFFFFFLL);
    atomic_fetch_add(*(atomic_ullong *volatile *)(v1 + 80), clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(v1 + 88));
    (*(void (**)(void))(*(void *)(v1 + 64) + 16))();
    uint64_t v3 = 16;
    if (!*(unsigned char *)(v1 + 104)) {
      uint64_t v3 = 24;
    }
    atomic_fetch_add((atomic_ullong *volatile)(*(void *)(v1 + 80) + v3), 1uLL);
  }
  if (*(unsigned char *)(v1 + 104))
  {
    objc_msgSend(*(id *)(v1 + 32), "setPendingTransactions:", objc_msgSend(*(id *)(v1 + 32), "pendingTransactions") - 1);
    if (![*(id *)(v1 + 40) hasChanges]) {
      goto LABEL_22;
    }
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    char v5 = *(void **)(v1 + 40);
    id v30 = 0;
    char v6 = [v5 save:&v30];
    id v7 = v30;
    if ((v6 & 1) == 0)
    {
      char v8 = [*(id *)(v1 + 32) options];
      int v9 = [v8 rollbackOnErrors];

      if (v9)
      {
        [*(id *)(v1 + 40) rollback];
        id v10 = PLBackendGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v7;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context, rolling back due to rollbackOnErrors being set: %@", buf, 0xCu);
        }
      }
      else
      {
        [(id)objc_opt_class() _context:*(void *)(v1 + 40) saveFailedWithError:v7];
      }
    }
  }
  else
  {
    if (![*(id *)(v1 + 40) isUserInterfaceContext]) {
      goto LABEL_22;
    }
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    [*(id *)(v1 + 40) processPendingChanges];
  }
LABEL_22:
  if (*(void *)(v1 + 72))
  {
    uint64_t v11 = (void *)MEMORY[0x19F38D3B0]();
    (*(void (**)(void))(*(void *)(v1 + 72) + 16))();
  }
  if (*(unsigned char *)(v1 + 104))
  {
    int v12 = *(void **)(v1 + 32);
    if (v12)
    {
      uint64_t v13 = [v12 transactionCompletionHandlers];
      int v14 = (void *)[v13 copy];

      [*(id *)(v1 + 32) clearTransactionCompletionHandlers];
    }
    else
    {
      int v14 = 0;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          id v21 = (void *)MEMORY[0x19F38D3B0](v16);
          (*(void (**)(uint64_t))(v20 + 16))(v20);
          ++v19;
        }
        while (v17 != v19);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
        uint64_t v17 = v16;
      }
      while (v16);
    }

    id v23 = (void *)MEMORY[0x19F38D3B0](v22);
    if (*(unsigned char *)(v1 + 105)) {
      objc_msgSend(*(id *)(v1 + 40), "refreshAllObjects", (void)v26);
    }
  }
  id v24 = *(NSObject **)(v1 + 48);
  if (v24) {
    dispatch_group_leave(v24);
  }
  return objc_msgSend(*(id *)(v1 + 56), "stillAlive", (void)v26);
}

- (unint64_t)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)_pauseChangeHandlingNotifications
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  char v2 = [WeakRetained changeHandlingContainer];
  [v2 pauseLaunchEventNotifications];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_destroyWeak((id *)&self->_loadedPersistentStore);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_extraVideoExtensions, 0);
  objc_storeStrong((id *)&self->_audioFileExtensions, 0);
  objc_storeStrong((id *)&self->_rawImageFileExtensions, 0);
  objc_storeStrong((id *)&self->_imageFileExtensions, 0);
  objc_storeStrong((id *)&self->_lastImportedPhotosAlbum, 0);
  objc_storeStrong((id *)&self->_allImportedPhotosAlbum, 0);
  objc_storeStrong((id *)&self->_transactionCompletionHandlers, 0);
}

void __43__PLPhotoLibrary_disableOpportunisticTasks__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  char v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = sOpportunisticTasksDisabled;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Disable opportunistic tasks invoked (was %d)", (uint8_t *)v4, 8u);
  }

  int v3 = sOpportunisticTasksDisabled;
  if (!sOpportunisticTasksDisabled)
  {
    [*(id *)(a1 + 32) _reallyDisableOpportunisticTasks];
    int v3 = sOpportunisticTasksDisabled;
  }
  sOpportunisticTasksDisabled = v3 + 1;
}

- (void)_reallyDisableOpportunisticTasks
{
  int v3 = [(id)objc_opt_class() opportunisticTaskIsolationQueue];
  dispatch_assert_queue_V2(v3);

  [(PLPhotoLibrary *)self _pauseChangeHandlingNotifications];
}

- (void)disableOpportunisticTasks
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:501 description:@"disableOpportunisticTasks can only be called from assetsd"];
  }
  id v4 = [(id)objc_opt_class() opportunisticTaskIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PLPhotoLibrary_disableOpportunisticTasks__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(v4, block);
}

+ (id)opportunisticTaskIsolationQueue
{
  if (opportunisticTaskIsolationQueue_opportunisticTaskIsolationToken != -1) {
    dispatch_once(&opportunisticTaskIsolationQueue_opportunisticTaskIsolationToken, &__block_literal_global_3118);
  }
  char v2 = (void *)sOpportunisticTaskIsolationQueue;
  return v2;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 134218242;
    char v8 = self;
    __int16 v9 = 2112;
    id v10 = name;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "PLPhotoLibrary %p dealloc %@", buf, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(PAVideoConversionServiceClient *)self->_videoConversionServiceClient invalidateAfterPendingRequestCompletion];
  +[PLPhotoLibrary reportLibraryDidDealloc:self];
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoLibrary;
  [(PLPhotoLibrary *)&v6 dealloc];
}

+ (void)reportLibraryDidDealloc:(id)a3
{
}

+ (id)_internalSystemPhotoLibrary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (PLIsForegroundApplication())
  {
    id v2 = +[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary];
  }
  else
  {
    int v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v7 = 0;
    id v2 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[PLPhotoLibrary _internalSystemPhotoLibrary]", v3, 0, &v7);
    id v4 = v7;
    if (!v2)
    {
      uint64_t v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v9 = "+[PLPhotoLibrary _internalSystemPhotoLibrary]";
        __int16 v10 = 2112;
        uint64_t v11 = v3;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
      }
    }
  }
  return v2;
}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke()
{
  uint64_t result = PLIsAssetsd();
  if (result)
  {
    uint64_t v1 = objc_opt_class();
    return [v1 _registerStateHandler];
  }
  return result;
}

- (void)setPendingTransactions:(unint64_t)a3
{
  self->_pendingTransactions = a3;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  return (PLLibraryServicesManager *)WeakRetained;
}

- (void)signalBackgroundProcessingNeeded
{
  id v4 = [(PLPhotoLibrary *)self libraryServicesManager];
  int v3 = [v4 backgroundJobService];
  [v3 signalBackgroundProcessingNeededOnLibrary:self];
}

- (BOOL)isWalrusEnabled
{
  int v3 = _PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass((void *)*MEMORY[0x1E4F17570]);
  if (v3)
  {
    id v4 = [(PLPhotoLibrary *)self cplStatus];
    char v5 = [v4 isWalrusEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)cplStatus
{
  int v3 = [(PLPhotoLibrary *)self pathManager];
  int v4 = [v3 isSystemPhotoLibraryPathManager];

  if (v4)
  {
    if (PLIsAssetsd())
    {
      char v5 = [(PLPhotoLibrary *)self libraryServicesManager];
      objc_super v6 = [v5 cloudPhotoLibraryManager];
      id v7 = [v6 cplStatus];

      if (!v7)
      {
        char v8 = [(PLPhotoLibrary *)self pathManager];
        id v7 = CPLStatusFromPathManager(v8);
      }
    }
    else
    {
      char v5 = [(PLPhotoLibrary *)self pathManager];
      id v7 = CPLStatusFromPathManager(v5);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)personInfoManager
{
  id v2 = [(PLPhotoLibrary *)self libraryBundle];
  int v3 = [v2 personInfoManager];

  return v3;
}

- (unint64_t)numberOfUnpushedAssetsOfKind:(signed __int16)a3
{
  uint64_t v3 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x1E4F1C0D0];
  objc_super v6 = +[PLManagedAsset entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  char v8 = (void *)MEMORY[0x1E4F28F60];
  __int16 v9 = [NSNumber numberWithShort:v3];
  __int16 v10 = [v8 predicateWithFormat:@"noindex(kind) == %@ && noindex(cloudLocalState) == %@ && trashedState != %d", v9, &unk_1EEBED0B0, 2];

  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  v25[0] = v10;
  __int16 v12 = +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders];
  v25[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v14 = [v11 andPredicateWithSubpredicates:v13];

  [v7 setPredicate:v14];
  id v15 = [(PLPhotoLibrary *)self managedObjectContext];
  id v20 = 0;
  unint64_t v16 = [v15 countForFetchRequest:v7 error:&v20];
  id v17 = v20;

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      uint64_t v18 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        int v22 = v3;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Could not fetch count of unpushed assets with type %d: %@", buf, 0x12u);
      }
    }
    unint64_t v16 = 0;
  }

  return v16;
}

- (unint64_t)numberOfCPLSupportedAssetsOfKind:(signed __int16)a3 includingTrashedSinceDate:(id)a4
{
  uint64_t v4 = a3;
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  char v8 = +[PLManagedAsset entityName];
  __int16 v9 = [v7 fetchRequestWithEntityName:v8];

  __int16 v10 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = [NSNumber numberWithShort:v4];
  __int16 v12 = [v10 predicateWithFormat:@"kind == %@", v11];

  id v13 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v12;
  uint64_t v14 = +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders];
  v30[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  unint64_t v16 = [v13 andPredicateWithSubpredicates:v15];

  if (v6)
  {
    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"trashedDate >= %@ || trashedState == %d", v6, 0];
    uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
    v29[0] = v16;
    v29[1] = v17;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v20 = [v18 andPredicateWithSubpredicates:v19];

    unint64_t v16 = (void *)v20;
  }
  [v9 setPredicate:v16];
  id v21 = [(PLPhotoLibrary *)self managedObjectContext];
  id v26 = 0;
  unint64_t v22 = [v21 countForFetchRequest:v9 error:&v26];
  id v23 = v26;

  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v24 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v23;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Could not fetch count of pushable assets: %@", buf, 0xCu);
      }
    }
    unint64_t v22 = 0;
  }

  return v22;
}

- (id)fingerprintContext
{
  id v2 = [(PLPhotoLibrary *)self libraryBundle];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 libraryServicesManager];

    if (v4) {
      [v3 libraryServicesManager];
    }
    else {
    id v6 = +[PLCPLSettings settingsWithLibraryBundle:v3];
    }
    char v5 = [v6 fingerprintContext];
  }
  else
  {
    char v5 = [MEMORY[0x1E4F59890] sharedContext];
  }

  return v5;
}

- (id)mainScopeIdentifier
{
  id v2 = [(PLPhotoLibrary *)self libraryBundle];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 libraryServicesManager];

    if (v4)
    {
      char v5 = [v3 libraryServicesManager];
      [v5 mainScopeIdentifier];
    }
    else
    {
      char v5 = +[PLCPLSettings settingsWithLibraryBundle:v3];
      [v5 deriveMainScopeIdentifier];
    id v6 = };
  }
  else
  {
    id v6 = CPLPrimaryScopeIdentifierForCurrentUniverse();
  }

  return v6;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  uint64_t v3 = [(PLPhotoLibrary *)self libraryServicesManager];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 isCloudPhotoLibraryEnabled];
  }
  else
  {
    id v6 = [(PLPhotoLibrary *)self pathManager];
    id v7 = [v6 libraryURL];
    char v5 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v7);
  }
  return v5;
}

- (unint64_t)sharedStreamsSize
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:22];
  uint64_t v4 = [(PLPhotoLibrary *)self pathManager];
  int v5 = [v4 isUBF];

  pathManager = self->_pathManager;
  if (v5) {
    [(PLPhotoLibraryPathManager *)pathManager photoDirectoryWithType:14];
  }
  else {
  id v7 = [(PLPhotoLibraryPathManager *)pathManager photoMetadataDirectoryForMediaInMainDirectory:v3];
  }
  v11[0] = v3;
  v11[1] = v7;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  unint64_t v9 = _sizeOfDirectories(v8);

  return v9;
}

- (void)deleteTTRDeferredIntermediates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:1];
  int v5 = [v4 stringByAppendingString:@"/Deferred/tmpCaptureContainers"];
  if ([v3 fileExistsAtPath:v5])
  {
    id v9 = 0;
    char v6 = [v3 removeItemAtPath:v5 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      char v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = v5;
        __int16 v12 = 2112;
        id v13 = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to remove temporary capture containers for TTRs at path: %@ with error: %@", buf, 0x16u);
      }
    }
  }
}

- (void)deleteUnusedCameraMetadataPaths
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLManagedAsset entityName];
  int v5 = [v3 fetchRequestWithEntityName:v4];

  char v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = +[PLManagedAsset listOfStatesWithOutstandingDeferredPhotoProcessingWork];
  char v8 = [v6 predicateWithFormat:@"deferredProcessingNeeded IN %@", v7];

  [v5 setPredicate:v8];
  id v9 = [(PLPhotoLibrary *)self pathManager];
  __int16 v10 = [v9 privateDirectoryWithSubType:9 createIfNeeded:0 error:0];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v12 = (void *)MEMORY[0x1E4F1CA80];
  id v22 = 0;
  id v13 = [v11 contentsOfDirectoryAtPath:v10 error:&v22];
  id v14 = v22;
  id v15 = [v12 setWithArray:v13];

  if (v15)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke;
    v17[3] = &unk_1E5870618;
    v17[4] = self;
    id v18 = v5;
    id v19 = v11;
    id v20 = v15;
    id v21 = v10;
    [(PLPhotoLibrary *)self performBlockAndWait:v17];
  }
  else
  {
    unint64_t v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Error getting contents of camera metadata path: %@", buf, 0xCu);
    }
  }
}

void __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke_2;
  v27[3] = &unk_1E5875CB8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v28 = *(id *)(a1 + 48);
  id v29 = *(id *)(a1 + 56);
  id v4 = (id)[v2 enumerateObjectsFromFetchRequest:v3 count:0 usingDefaultBatchSizeWithBlock:v27];

  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 56) count];
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v6;
    __int16 v33 = 2112;
    uint64_t v34 = v7;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Found %lu assets with orphaned camera metadata paths: %@", buf, 0x16u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 138412290;
    long long v21 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", *(void *)(*((void *)&v23 + 1) + 8 * v13), v21);
        id v15 = *(void **)(a1 + 48);
        id v22 = 0;
        char v16 = [v15 removeItemAtPath:v14 error:&v22];
        id v17 = v22;
        if ((v16 & 1) == 0)
        {
          id v18 = PLBackendGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            uint64_t v32 = (uint64_t)v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to remove camera metadata at path: %@", buf, 0xCu);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v11);
  }

  id v19 = PLBackendGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v20;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Deleted camera metadata paths: %@", buf, 0xCu);
  }
}

void __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathForCameraMetadataFile];
  id v9 = [v4 lastPathComponent];

  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 pathForCameraMetadataFile];

  if ([v5 fileExistsAtPath:v6])
  {
    int v7 = [*(id *)(a1 + 40) containsObject:v9];

    id v8 = v9;
    if (!v7) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 40) removeObject:v9];
  }
  else
  {
  }
  id v8 = v9;
LABEL_6:
}

- (void)deleteUnknownDeferredIntermediatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(PLPhotoLibrary *)self libraryBundle];
  int v6 = [v5 isSystemPhotoLibrary];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1E4F1C0D0];
    id v8 = +[PLManagedAsset entityName];
    id v9 = [v7 fetchRequestWithEntityName:v8];

    long long v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = +[PLManagedAsset listOfStatesWithOutstandingDeferredPhotoProcessingWork];
    uint64_t v12 = [v10 predicateWithFormat:@"deferredProcessingNeeded IN %@", v11];

    [v9 setPredicate:v12];
    [v9 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1568];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5874868;
    v14[4] = self;
    id v15 = v9;
    id v16 = v4;
    id v13 = v9;
    [(PLPhotoLibrary *)self performBlockAndWait:v14];
  }
}

void __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v29 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v29];
  id v5 = v29;
  int v6 = v5;
  if (v4)
  {
    id v21 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "additionalAttributes", v21);
          id v15 = [v14 deferredPhotoIdentifier];

          if ([v15 length])
          {
            [v7 addObject:v15];
            id v16 = +[PLPhotoLibrary requestIdentifierFromDeferredIdentifier:v15];
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v11);
    }

    id v17 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v9 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Found %tu assets with deferred identifiers %@", buf, 0x16u);
    }

    id v19 = [[PLDeferredPhotoFinalizer alloc] initForUseCase:2];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke_962;
    v23[3] = &unk_1E5862D68;
    id v24 = *(id *)(a1 + 48);
    [v19 deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers:v8 withCompletionHandler:v23];

    id v4 = v22;
    int v6 = v21;
  }
  else
  {
    uint64_t v20 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = (uint64_t)v6;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch assets with outstanding deferred processing needed with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke_962(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Requested deletion of %zd intermediates from deferredmediad", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteExpiredTrashedAssetsAndAlbums
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  int v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  uint64_t v8 = [v6 predicateWithFormat:@"(trashedState = %d OR trashedState = %d) AND trashedDate < %@ AND (complete != 0)", 1, 2, v7];

  [v5 setPredicate:v8];
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v10 = +[PLGenericAlbum entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  id v14 = [v12 predicateWithFormat:@"(trashedState = %d OR trashedState = %d) AND trashedDate < %@", 1, 2, v13];

  [v11 setPredicate:v14];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke;
  v18[3] = &unk_1E5875368;
  v18[4] = self;
  id v15 = v5;
  id v19 = v15;
  id v21 = v22;
  id v16 = v11;
  id v20 = v16;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_951;
  v17[3] = &unk_1E5875840;
  v17[4] = v22;
  [(PLPhotoLibrary *)self performTransaction:v18 completionHandler:v17];

  _Block_object_dispose(v22, 8);
}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [NSString stringWithFormat:@"Deleting expired burst's non-favorite from trash"];
  id v4 = +[PLAssetTransactionReason transactionReason:v3];

  id v5 = [NSString stringWithFormat:@"Deleting expired asset from trash"];
  int v6 = +[PLAssetTransactionReason transactionReason:v5];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_2;
  v21[3] = &unk_1E5862D40;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  v21[4] = *(void *)(a1 + 32);
  uint64_t v24 = v8;
  id v9 = v4;
  id v22 = v9;
  id v10 = v6;
  id v23 = v10;
  id v11 = (id)[v2 enumerateObjectsFromFetchRequest:v7 count:0 usingDefaultBatchSizeWithBlock:v21];
  uint64_t v12 = [v2 executeFetchRequest:*(void *)(a1 + 48) error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) delete];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_951()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = PLBackendGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1 = NSLocalizedFileSizeDescription();
    int v2 = 138412290;
    uint64_t v3 = v1;
    _os_log_impl(&dword_19B3C7000, v0, OS_LOG_TYPE_DEFAULT, "Deleted %@ of assets from the trash.", (uint8_t *)&v2, 0xCu);
  }
}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_2(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isDeleted] & 1) == 0)
  {
    if ([v3 isAvalancheStackPhoto])
    {
      uint64_t v4 = [PLAvalanche alloc];
      id v5 = [v3 avalancheUUID];
      int v6 = [(PLAvalanche *)v4 initWithUUID:v5 photoLibrary:a1[4]];

      uint64_t v7 = [(PLAvalanche *)v6 assets];
      uint64_t v8 = (void *)[v7 mutableCopy];

      id v9 = [(PLAvalanche *)v6 userFavorites];
      [v8 minusOrderedSet:v9];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            *(void *)(*(void *)(a1[7] + 8) + 24) += objc_msgSend(v15, "originalFilesize", (void)v19);
            [v15 deleteWithReason:a1[5]];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v12);
      }

      uint64_t v16 = [v9 array];
      +[PLAvalanche disolveBurstForAssets:v16 permanently:1];
    }
    else if (([v3 isAvalanchePhoto] & 1) == 0)
    {
      if ([v3 isAvalanchePhoto])
      {
        long long v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          long long v18 = [v3 uuid];
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v18;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_FAULT, "Expected avalanche identifier is missing for asset: %{public}@", buf, 0xCu);
        }
      }
      *(void *)(*(void *)(a1[7] + 8) + 24) += [v3 originalFilesize];
      [v3 deleteWithReason:a1[6]];
    }
  }
}

- (void)deleteExpiredTrashedResources
{
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLInternalResource entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  int v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v6 predicateWithFormat:@"(trashedState = %d OR trashedState = %d) AND trashedDate < %@", 1, 2, v7];

  [v5 setPredicate:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke;
  v10[3] = &unk_1E5875E18;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(PLPhotoLibrary *)self performTransactionAndWait:v10];
}

void __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    int v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Can't retrieve resources: %@", buf, 0xCu);
    }
  }
  uint64_t v7 = [v2 enumerateWithIncrementalSaveUsingObjects:v4 withBlock:&__block_literal_global_941];

  if (v7)
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Can't delete resources from the trash. Error: %@", buf, 0xCu);
    }
  }
}

void __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke_938(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 objectID];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Deleted resource from the trash: %@", (uint8_t *)&v5, 0xCu);
  }
  [v2 applyTrashedState:2];
}

- (void)updateKeyAssetsInAlbums:(id)a3
{
}

- (void)_updateMemoryCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v12 = +[PLMemory entityName];
  uint64_t v13 = [v11 fetchRequestWithEntityName:v12];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", v9);
  [v13 setPredicate:v14];
  [v13 setFetchBatchSize:100];
  v29[0] = v9;
  v29[1] = v8;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v13 setPropertiesToFetch:v15];

  id v24 = 0;
  uint64_t v16 = [v10 executeFetchRequest:v13 error:&v24];
  id v17 = v24;
  if (!v16) {
    goto LABEL_3;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__PLPhotoLibrary__updateMemoryCountKeyPath_withPendingCountKeyPath_inContext___block_invoke;
  v21[3] = &unk_1E5862D18;
  id v22 = v9;
  id v23 = v8;
  uint64_t v18 = [v10 enumerateWithIncrementalSaveUsingObjects:v16 withBlock:v21];

  id v17 = (id)v18;
  if (v18)
  {
LABEL_3:
    long long v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "%@ failed with error: %@", buf, 0x16u);
    }
  }
}

void __78__PLPhotoLibrary__updateMemoryCountKeyPath_withPendingCountKeyPath_inContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 valueForKeyPath:v3];
  uint64_t v6 = [v5 longLongValue];

  [v4 setValue:&unk_1EEBED098 forKeyPath:*(void *)(a1 + 32)];
  uint64_t v7 = [v4 valueForKeyPath:*(void *)(a1 + 40)];
  uint64_t v8 = [v7 longLongValue] + v6;

  id v9 = [NSNumber numberWithLongLong:v8];
  [v4 setValue:v9 forKeyPath:*(void *)(a1 + 40)];
}

- (void)updateMemoryPlayShareViewCountsInContext:(id)a3
{
  id v4 = a3;
  [(PLPhotoLibrary *)self _updateMemoryCountKeyPath:@"playCount" withPendingCountKeyPath:@"pendingPlayCount" inContext:v4];
  [(PLPhotoLibrary *)self _updateMemoryCountKeyPath:@"shareCount" withPendingCountKeyPath:@"pendingShareCount" inContext:v4];
  [(PLPhotoLibrary *)self _updateMemoryCountKeyPath:@"viewCount" withPendingCountKeyPath:@"pendingViewCount" inContext:v4];
}

- (void)_updateAssetCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v12 = +[PLAdditionalAssetAttributes entityName];
  uint64_t v13 = [v11 fetchRequestWithEntityName:v12];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", v9);
  [v13 setPredicate:v14];
  [v13 setFetchBatchSize:100];
  v29[0] = v9;
  v29[1] = v8;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v13 setPropertiesToFetch:v15];

  id v24 = 0;
  uint64_t v16 = [v10 executeFetchRequest:v13 error:&v24];
  id v17 = v24;
  if (!v16) {
    goto LABEL_3;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__PLPhotoLibrary__updateAssetCountKeyPath_withPendingCountKeyPath_inContext___block_invoke;
  v21[3] = &unk_1E5862CF0;
  id v22 = v9;
  id v23 = v8;
  uint64_t v18 = [v10 enumerateWithIncrementalSaveUsingObjects:v16 withBlock:v21];

  id v17 = (id)v18;
  if (v18)
  {
LABEL_3:
    long long v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "%@ failed with error: %@", buf, 0x16u);
    }
  }
}

void __77__PLPhotoLibrary__updateAssetCountKeyPath_withPendingCountKeyPath_inContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 valueForKeyPath:v3];
  uint64_t v6 = [v5 integerValue];

  [v4 setValue:&unk_1EEBED098 forKeyPath:*(void *)(a1 + 32)];
  uint64_t v7 = [v4 valueForKeyPath:*(void *)(a1 + 40)];
  uint64_t v8 = [v7 integerValue] + v6;

  id v9 = [NSNumber numberWithLongLong:v8];
  [v4 setValue:v9 forKeyPath:*(void *)(a1 + 40)];
}

- (void)updateAssetPlayShareViewCountsInContext:(id)a3
{
  id v4 = a3;
  [(PLPhotoLibrary *)self _updateAssetCountKeyPath:@"playCount" withPendingCountKeyPath:@"pendingPlayCount" inContext:v4];
  [(PLPhotoLibrary *)self _updateAssetCountKeyPath:@"shareCount" withPendingCountKeyPath:@"pendingShareCount" inContext:v4];
  [(PLPhotoLibrary *)self _updateAssetCountKeyPath:@"viewCount" withPendingCountKeyPath:@"pendingViewCount" inContext:v4];
}

- (void)old_refreshCachedCountsOnAllAssetContainersInContext:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  int v5 = +[PLManagedAsset entityName];
  uint64_t v6 = [v4 fetchRequestWithEntityName:v5];

  [v6 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1550];
  [v6 setResultType:0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"trashedState = %d", 0);
  [v6 setPredicate:v7];

  [v6 setReturnsObjectsAsFaults:0];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_2;
  v39[3] = &unk_1E5862C78;
  id v9 = v8;
  id v40 = v9;
  id v10 = (void *)MEMORY[0x19F38D650](v39);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_3;
  v36[3] = &unk_1E5862CA0;
  id v28 = v3;
  id v29 = v10;
  id v37 = v29;
  id v38 = &__block_literal_global_872;
  long long v25 = v6;
  id v11 = (id)[v3 enumerateObjectsFromFetchRequest:v6 count:0 batchSize:500 usingBlock:v36];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v30)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v12;
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
        uint64_t v14 = [v28 objectWithID:v13];
        CFArrayRef v15 = (const __CFArray *)(*((uint64_t (**)(id, uint64_t))v29 + 2))(v29, v13);
        for (CFIndex i = 0; i != 3; ++i)
        {
          id v17 = old_refreshCachedCountsOnAllAssetContainersInContext__cachedKeys[i];
          uint64_t v18 = [v14 valueForKey:v17];
          uint64_t v19 = [v18 integerValue];

          ValueAtIndex = CFArrayGetValueAtIndex(v15, i);
          if ((const void *)v19 != ValueAtIndex)
          {
            long long v21 = ValueAtIndex;
            id v22 = PLBackendGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v14 objectID];
              *(_DWORD *)buf = 138413058;
              id v42 = v17;
              __int16 v43 = 2112;
              uint64_t v44 = v23;
              __int16 v45 = 2048;
              uint64_t v46 = v19;
              __int16 v47 = 2048;
              id v48 = v21;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%ld -> %ld)", buf, 0x2Au);
            }
            id v24 = [NSNumber numberWithInteger:v21];
            [v14 setValue:v24 forKey:v17];
          }
        }

        uint64_t v12 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v49 count:16];
    }
    while (v30);
  }
}

void *__71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  Mutable = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 3, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    [*(id *)(a1 + 32) setObject:Mutable forKeyedSubscript:v3];
    CFRelease(Mutable);
  }

  return Mutable;
}

void __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "albums", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) objectID];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v10 = [v3 moment];

  if (v10)
  {
    id v11 = [v3 moment];
    uint64_t v12 = [v11 objectID];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke(uint64_t a1, void *a2, const __CFArray *a3)
{
  int v4 = [a2 kind];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    CFIndex v5 = 1;
  }
  else
  {
    CFIndex v5 = 0;
  }
  ValueAtIndex = (char *)CFArrayGetValueAtIndex(a3, v5);
  CFArraySetValueAtIndex(a3, v5, ValueAtIndex + 1);
LABEL_6:
  uint64_t v7 = (char *)CFArrayGetValueAtIndex(a3, 2) + 1;
  CFArraySetValueAtIndex(a3, 2, v7);
}

- (BOOL)isAlbumSynced:(id)a3
{
  return [a3 kindValue] - 1550 < 3;
}

- (id)syncedAlbumSubtitleStringFormat
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager syncInfoPath];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v3 fileExistsAtPath:v2])
  {
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v2];
    CFIndex v5 = [v4 objectForKey:@"userAgent"];
    uint64_t v6 = [v4 objectForKey:@"libraryKind"];
    uint64_t v7 = v6;
    if (v5)
    {
      uint64_t v8 = [v5 rangeOfString:@"Macintosh"];

      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (v6)
    {
      if ([v6 isEqualToString:@"iPhoto"])
      {

LABEL_11:
        id v9 = @"X_FROM_MY_MAC";
        goto LABEL_13;
      }
      int v10 = [v7 isEqualToString:@"Aperture"];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
LABEL_12:
    id v9 = @"X_FROM_MY_COMPUTER";
    goto LABEL_13;
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)hasCompletedMomentAnalysis
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPhotoLibrary.m", 3644, @"%s Must be called from assetsd directly!", "-[PLPhotoLibrary hasCompletedMomentAnalysis]");
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v11 = PLPlatformMomentAnalysisSupported() ^ 1;
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v4 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PLPhotoLibrary_hasCompletedMomentAnalysis__block_invoke;
    v7[3] = &unk_1E5875E68;
    v7[4] = self;
    v7[5] = &v8;
    [(PLPhotoLibrary *)self performBlockAndWait:v7];
    BOOL v4 = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __44__PLPhotoLibrary_hasCompletedMomentAnalysis__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = 0;
  id v3 = +[PLMoment allMomentsRequiringAnalysisInManagedObjectContext:v2 error:&v6];
  id v4 = v6;

  if (v3) {
    BOOL v5 = [v3 count] == 0;
  }
  else {
    BOOL v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (id)incompleteRestoreProcesses
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:3624 description:@"Only Assetsd should be creating the photostream album!"];
  }
  if (PLIsAssetsd())
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __44__PLPhotoLibrary_incompleteRestoreProcesses__block_invoke;
    long long v13 = &unk_1E5875E18;
    long long v14 = self;
    id v5 = v4;
    id v15 = v5;
    [(PLPhotoLibrary *)self performBlockAndWait:&v10];
    id v6 = [(PLPhotoLibrary *)self thumbnailManager];
    int v7 = [v6 hasRebuildThumbnailsRequest];

    if (v7) {
      [v5 addObject:@"thumbnailsRebuild"];
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

uint64_t __44__PLPhotoLibrary_incompleteRestoreProcesses__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) globalValues];
  char v3 = [v2 didImportFileSystemAssets];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:@"importFileSystemAssets"];
  }
  uint64_t result = [*(id *)(a1 + 32) hasPendingAssetsIgnoreiTunes:0];
  if (result)
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 addObject:@"pendingAssets"];
  }
  return result;
}

- (void)reportLibrarySizeToDAS
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__PLPhotoLibrary_reportLibrarySizeToDAS__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLPhotoLibrary *)self performBlockAndWait:v2];
}

uint64_t __40__PLPhotoLibrary_reportLibrarySizeToDAS__block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v3 = 0;
  [*(id *)(a1 + 32) getPhotoCount:&v4 videoCount:&v3];
  uint64_t v2 = 0;
  return [MEMORY[0x1E4F4F448] reportSystemWorkload:v3 + v4 ofCategory:10 error:&v2];
}

- (BOOL)isReadyForCloudPhotoLibrary
{
  if (PLIsAssetsd())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

    if (!WeakRetained)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 3606, @"Invalid parameter not satisfying: %@", @"_libraryServicesManager" object file lineNumber description];
    }
    id v5 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    id v6 = [v5 cplReadiness];
    char v7 = [v6 isReadyForCloudPhotoLibraryWithStatus:0];
  }
  else
  {
    id v5 = [(PLPhotoLibrary *)self assetsdClient];
    id v6 = [v5 cloudInternalClient];
    char v7 = [v6 isReadyForCloudPhotoLibrary];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)hasCompletedRestorePostProcessing
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPhotoLibrary.m", 3571, @"%s Must be called from assetsd directly!", "-[PLPhotoLibrary hasCompletedRestorePostProcessing]");
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  int v4 = [(PLPhotoLibraryPathManager *)self->_pathManager isDeviceRestoreSupported] ^ 1;
  if (hasCompletedRestorePostProcessing__hasCompletedRestorePostProcessing) {
    LOBYTE(v4) = 1;
  }
  char v24 = v4;
  if (*((unsigned char *)v22 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__2773;
    uint64_t v19 = __Block_byref_object_dispose__2774;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PLPhotoLibrary_hasCompletedRestorePostProcessing__block_invoke;
    v14[3] = &unk_1E5875A90;
    v14[4] = self;
    void v14[5] = &v21;
    v14[6] = &v15;
    [(PLPhotoLibrary *)self performBlockAndWait:v14 completionHandler:0];
    if (!*((unsigned char *)v22 + 24)) {
      goto LABEL_11;
    }
    id v6 = [(PLPhotoLibrary *)self thumbnailManager];
    char v7 = [v6 hasRebuildThumbnailsRequest];
    *((unsigned char *)v22 + 24) = v7 ^ 1;

    if (*((unsigned char *)v22 + 24)
      || (BOOL v8 = (void *)v16[5], v16[5] = @"rebuild thumbnails", v8, *((unsigned char *)v22 + 24)))
    {
      char v9 = 1;
    }
    else
    {
LABEL_11:
      uint64_t v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v16[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Restore post processing incomplete: %{public}@", buf, 0xCu);
      }

      char v9 = *((unsigned char *)v22 + 24);
    }
    hasCompletedRestorePostProcessing__hasCompletedRestorePostProcessing = v9;
    _Block_object_dispose(&v15, 8);

    BOOL v5 = *((unsigned char *)v22 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);
  return v5;
}

void __51__PLPhotoLibrary_hasCompletedRestorePostProcessing__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) globalValues];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 didImportFileSystemAssets];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) hasPendingAssetsIgnoreiTunes:0] ^ 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      return;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(void **)(v3 + 40);
    BOOL v5 = @"pending assets";
  }
  else
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(void **)(v3 + 40);
    BOOL v5 = @"import file system assets";
  }
  *(void *)(v3 + 40) = v5;
}

- (BOOL)hasPendingAssetsIgnoreiTunes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPhotoLibrary.m", 3545, @"%s Must be called from assetsd directly!", "-[PLPhotoLibrary hasPendingAssetsIgnoreiTunes:]");
  }
  id v6 = [(PLPhotoLibrary *)self syncProgressAlbumsIgnoreiTunes:v3];
  if (v3 && [(PLPhotoLibrary *)self _hasIncompleteAsset])
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          int v12 = [v11 pendingItemsCount];
          int v13 = [v11 pendingItemsType];
          if (v12) {
            BOOL v14 = v13 == 1;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
LABEL_18:
  }
  return v7;
}

- (id)syncProgressAlbumsIgnoreiTunes:(BOOL)a3
{
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  if (!a3)
  {
    uint64_t v6 = [(PLPhotoLibrary *)self syncProgressAlbum];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [v5 addObject:v6];
    }
  }
  id v8 = [(PLPhotoLibrary *)self otaRestoreProgressAlbum];
  if (v8) {
    [v5 addObject:v8];
  }
  uint64_t v9 = [(PLPhotoLibrary *)self filesystemImportProgressAlbum];

  if (v9) {
    [v5 addObject:v9];
  }

  return v5;
}

- (id)librarySizes
{
  v93[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PLPhotoLibrary *)self pathManager];
  v79 = v3;
  int v77 = [v3 isUBF];
  if (v77)
  {
    int v4 = (void *)MEMORY[0x1E4F1C0D0];
    BOOL v5 = +[PLInternalResource entityName];
    uint64_t v6 = [v4 fetchRequestWithEntityName:v5];

    uint64_t v72 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"dataLength"];
    uint64_t v7 = (void *)MEMORY[0x1E4F28C68];
    v93[0] = v72;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
    uint64_t v69 = [v7 expressionForFunction:@"sum:" arguments:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v9 setName:@"sum"];
    [v9 setExpression:v69];
    [v9 setExpressionResultType:300];
    id v92 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    [v6 setPropertiesToFetch:v10];

    [v6 setResultType:2];
    [v6 setReturnsObjectsAsFaults:0];
    uint64_t v11 = [(PLPhotoLibrary *)self managedObjectContext];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __30__PLPhotoLibrary_librarySizes__block_invoke;
    v80[3] = &unk_1E5862BD8;
    id v81 = v6;
    v82 = self;
    id v83 = v11;
    id v67 = v11;
    id v66 = v6;
    int v12 = (uint64_t (**)(void, void))MEMORY[0x19F38D650](v80);
    int v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 1);
    BOOL v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudLocalState", 1);
    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v91[0] = v13;
    long long v16 = +[PLManagedAsset predicateFilteringForNonDerivativeRecipeIDs];
    v91[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    long long v18 = [v15 andPredicateWithSubpredicates:v17];

    uint64_t v76 = ((uint64_t (**)(void, void *))v12)[2](v12, v18);
    long long v19 = (void *)MEMORY[0x1E4F28BA0];
    v90[0] = v13;
    v90[1] = v14;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];
    uint64_t v75 = ((uint64_t (**)(void, void *))v12)[2](v12, v21);

    uint64_t v22 = (void *)v69;
    uint64_t v23 = v79;
    int64_t v24 = ((uint64_t (**)(void, void *))v12)[2](v12, v13);

    long long v25 = (void *)v72;
    uint64_t v26 = -1;
  }
  else
  {
    uint64_t v27 = [v3 photoDirectoryWithType:4];
    v73 = [v3 photoDirectoryWithType:28];
    id v28 = [v3 photoDirectoryWithType:29];
    v70 = [v3 photoMetadataDirectoryForMediaInMainDirectory:v27];
    id v29 = [v3 photoMetadataDirectoryForMediaInMainDirectory:v28];
    uint64_t v30 = [v3 photoDirectoryWithType:9];
    uint64_t v31 = [v73 stringByAppendingPathComponent:@"CPL"];
    v89[0] = v27;
    v89[1] = v28;
    long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    uint64_t v33 = _sizeOfDirectories(v32);

    v88[0] = v70;
    v88[1] = v29;
    v88[2] = v30;
    long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
    uint64_t v35 = _sizeOfDirectories(v34);

    v87 = v31;
    char v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    uint64_t v37 = _sizeOfDirectories(v36);

    uint64_t v76 = v33;
    uint64_t v38 = v35 + v33;
    int64_t v24 = v35 + v33 + v37 + [(PLPhotoLibrary *)self _dbFileSizes];
    if ([(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled]) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = 0;
    }
    uint64_t v75 = v39;

    uint64_t v23 = v79;
    long long v25 = [v79 pathsForFinderSyncFilesystemSizeCalculation];
    uint64_t v22 = [v25 allObjects];
    uint64_t v26 = _sizeOfDirectories(v22);
  }

  unint64_t v40 = [(PLPhotoLibrary *)self sharedStreamsSize];
  unint64_t v41 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:0 shouldFreeSpace:0 shouldKeepRecentlyViewedAssets:0 fromPhotoLibrary:self];
  if (v40 >= v41) {
    uint64_t v42 = v40 - v41;
  }
  else {
    uint64_t v42 = 0;
  }
  __int16 v43 = [v23 photoDirectoryWithType:14];
  if (v77) {
    [v23 photoDirectoryWithType:23];
  }
  else {
  uint64_t v44 = [v23 photoMetadataDirectoryForMediaInMainDirectory:v43];
  }
  v86[0] = v43;
  v86[1] = v44;
  __int16 v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
  uint64_t v46 = _sizeOfDirectories(v45);

  uint64_t v47 = v24 + v46 + (v26 & ~(v26 >> 63)) + v42;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = [v23 photoDirectoryWithType:11];
  [v48 addObject:v49];

  if (v77)
  {
    uint64_t v50 = [v23 photoDirectoryWithType:12];
    [v48 addObject:v50];
  }
  v78 = v48;
  uint64_t v51 = _sizeOfDirectories(v48);
  if (v47)
  {
    unint64_t v52 = (unint64_t)((double)v24 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    unint64_t v53 = (unint64_t)((double)v46 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    unint64_t v54 = (unint64_t)((double)v42 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    uint64_t v47 = (unint64_t)((double)v26 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
  }
  else
  {
    unint64_t v52 = 0;
    unint64_t v53 = 0;
    unint64_t v54 = 0;
  }
  v74 = [&unk_1EEBED038 stringValue];
  v84[0] = v74;
  v71 = [NSNumber numberWithUnsignedLongLong:v52 + v24];
  v85[0] = v71;
  v68 = [&unk_1EEBED050 stringValue];
  v84[1] = v68;
  id v55 = [NSNumber numberWithUnsignedLongLong:v53 + v46];
  v85[1] = v55;
  id v56 = [&unk_1EEBED068 stringValue];
  v84[2] = v56;
  v57 = [NSNumber numberWithUnsignedLongLong:v54 + v42];
  v85[2] = v57;
  __uint64_t v58 = [&unk_1EEBED080 stringValue];
  v84[3] = v58;
  id v59 = [NSNumber numberWithUnsignedLongLong:v47 + v26];
  v85[3] = v59;
  BOOL v60 = [&unk_1EEBED008 stringValue];
  v84[4] = v60;
  BOOL v61 = [NSNumber numberWithLongLong:v75];
  v85[4] = v61;
  v62 = [&unk_1EEBECFF0 stringValue];
  v84[5] = v62;
  v63 = [NSNumber numberWithLongLong:v76];
  v85[5] = v63;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:6];

  return v64;
}

uint64_t __30__PLPhotoLibrary_librarySizes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setPredicate:v3];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__PLPhotoLibrary_librarySizes__block_invoke_2;
  v7[3] = &unk_1E5875340;
  int v4 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = &v11;
  [v4 performBlockAndWait:v7];
  uint64_t v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __30__PLPhotoLibrary_librarySizes__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:0];
  if ([v4 count])
  {
    uint64_t v2 = [v4 objectAtIndexedSubscript:0];
    id v3 = [v2 objectForKeyedSubscript:@"sum"];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 unsignedIntegerValue];
  }
}

- (id)estimatedLibrarySizes
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v81 = [(PLPhotoLibrary *)self pathManager];
  context = (void *)MEMORY[0x19F38D3B0]();
  id v3 = [(PLPhotoLibrary *)self managedObjectContext];
  id v4 = +[PLPhotoLibrary _resourcesInfoFromMoc:v3];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"PLSavedPhotosSize"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"PLInternalSizeOriginals"];
  uint64_t v80 = [v6 unsignedIntegerValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"PLSavedPhotosSize"];
  id v8 = [v7 objectForKeyedSubscript:@"PLInternalSizeDerivative"];
  uint64_t v76 = [v8 unsignedIntegerValue];

  id v9 = [v4 objectForKeyedSubscript:@"PLSavedPhotosSize"];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];
  uint64_t v74 = [v10 unsignedIntegerValue];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"PLReferenceMediaSize"];
  int v12 = [v11 objectForKeyedSubscript:@"PLInternalSizeDerivative"];
  uint64_t v73 = [v12 unsignedIntegerValue];

  uint64_t v13 = [v4 objectForKeyedSubscript:@"PLReferenceMediaSize"];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];
  uint64_t v72 = [v14 unsignedIntegerValue];

  uint64_t v15 = [v4 objectForKeyedSubscript:@"PLFinderSyncSize"];
  long long v16 = [v15 objectForKeyedSubscript:@"PLInternalSizeOriginals"];
  uint64_t v71 = [v16 unsignedIntegerValue];

  long long v17 = [v4 objectForKeyedSubscript:@"PLFinderSyncSize"];
  long long v18 = [v17 objectForKeyedSubscript:@"PLInternalSizeDerivative"];
  uint64_t v70 = [v18 unsignedIntegerValue];

  long long v19 = [v4 objectForKeyedSubscript:@"PLFinderSyncSize"];
  long long v20 = [v19 objectForKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];
  uint64_t v69 = [v20 unsignedIntegerValue];

  uint64_t v21 = [v4 objectForKeyedSubscript:@"PLFinderSyncSize"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"PLInternalSizeTableThumbnail"];
  uint64_t v68 = [v22 unsignedIntegerValue];

  uint64_t v23 = [v4 objectForKeyedSubscript:@"PLPhotoStreamSize"];
  int64_t v24 = [v23 objectForKeyedSubscript:@"PLInternalSizeOriginals"];
  uint64_t v67 = [v24 unsignedIntegerValue];

  long long v25 = [v4 objectForKeyedSubscript:@"PLPhotoStreamSize"];
  uint64_t v26 = [v25 objectForKeyedSubscript:@"PLInternalSizeDerivative"];
  uint64_t v66 = [v26 unsignedIntegerValue];

  uint64_t v27 = [v4 objectForKeyedSubscript:@"PLPhotoStreamSize"];
  id v28 = [v27 objectForKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];
  uint64_t v65 = [v28 unsignedIntegerValue];

  id v29 = [v4 objectForKeyedSubscript:@"PLPhotoStreamSize"];
  uint64_t v30 = [v29 objectForKeyedSubscript:@"PLInternalSizeTableThumbnail"];
  uint64_t v64 = [v30 unsignedIntegerValue];

  uint64_t v31 = [v4 objectForKeyedSubscript:@"PLSharedStreamSize"];
  long long v32 = [v31 objectForKeyedSubscript:@"PLInternalSizeOriginals"];
  uint64_t v33 = [v32 unsignedIntegerValue];

  long long v34 = [v4 objectForKeyedSubscript:@"PLSharedStreamSize"];
  uint64_t v35 = [v34 objectForKeyedSubscript:@"PLInternalSizeDerivative"];
  uint64_t v36 = [v35 unsignedIntegerValue];

  uint64_t v37 = [v4 objectForKeyedSubscript:@"PLSharedStreamSize"];
  uint64_t v38 = [v37 objectForKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];
  uint64_t v39 = [v38 unsignedIntegerValue];

  unint64_t v40 = [v4 objectForKeyedSubscript:@"PLSharedStreamSize"];
  unint64_t v41 = [v40 objectForKeyedSubscript:@"PLInternalSizeTableThumbnail"];
  uint64_t v42 = [v41 unsignedIntegerValue];

  int64_t v63 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:self urgency:1];
  __int16 v43 = [(PLPhotoLibrary *)self thumbnailManager];
  uint64_t v44 = [v43 _diskFootprintOfTableThumbnailTables];

  __int16 v45 = [v81 photoDirectoryWithType:6];
  v84[0] = v45;
  uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
  uint64_t v47 = _sizeOfDirectories(v46);

  unint64_t v48 = [(PLPhotoLibrary *)self _dbFileSizes];
  unint64_t v49 = v36 + v33 + v39 + v42;
  unint64_t v50 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:0 shouldFreeSpace:0 shouldKeepRecentlyViewedAssets:0 fromPhotoLibrary:self];
  if (v49 >= v50) {
    unint64_t v51 = v49 - v50;
  }
  else {
    unint64_t v51 = 0;
  }
  contexta = [&unk_1EEBED038 stringValue];
  v82[0] = contexta;
  int v77 = [NSNumber numberWithUnsignedLongLong:v76 + v80 + v74 + v73 + v72 + v44 + v47 + v48];
  v83[0] = v77;
  uint64_t v75 = [&unk_1EEBED050 stringValue];
  v82[1] = v75;
  unint64_t v52 = [NSNumber numberWithUnsignedLongLong:v66 + v67 + v65 + v64];
  v83[1] = v52;
  unint64_t v53 = [&unk_1EEBED068 stringValue];
  v82[2] = v53;
  unint64_t v54 = [NSNumber numberWithUnsignedLongLong:v51];
  v83[2] = v54;
  id v55 = [&unk_1EEBED080 stringValue];
  v82[3] = v55;
  id v56 = [NSNumber numberWithUnsignedLongLong:v70 + v71 + v69 + v68];
  v83[3] = v56;
  v57 = [&unk_1EEBED008 stringValue];
  v82[4] = v57;
  __uint64_t v58 = [NSNumber numberWithUnsignedLongLong:v63];
  v83[4] = v58;
  id v59 = [&unk_1EEBECFF0 stringValue];
  v82[5] = v59;
  BOOL v60 = [NSNumber numberWithUnsignedLongLong:v80];
  v83[5] = v60;
  BOOL v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:6];

  return v61;
}

- (unint64_t)_dbFileSizes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [(PLPhotoLibrary *)self pathManager];
  id v3 = [v15 knownDBPaths];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v10 = [(PLPhotoLibrary *)self _fileSizeAtPath:v9] + v6;
        uint64_t v11 = [v9 stringByAppendingString:@"-shm"];
        unint64_t v12 = v10 + [(PLPhotoLibrary *)self _fileSizeAtPath:v11];
        uint64_t v13 = [v9 stringByAppendingString:@"-wal"];
        unint64_t v6 = v12 + [(PLPhotoLibrary *)self _fileSizeAtPath:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_fileSizeAtPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(&v14, 0, sizeof(v14));
  id v3 = a3;
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v14))
  {
    uint64_t v4 = __error();
    int v5 = *v4;
    if (*v4 == 2)
    {
      unint64_t v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 138412290;
        id v22 = v3;
        uint64_t v7 = "Can't get size for %@, no such file or directory";
        id v8 = (uint8_t *)__strerrbuf;
        id v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v9, v10, v7, v8, v11);
      }
    }
    else
    {
      strerror_r(*v4, __strerrbuf, 0x100uLL);
      unint64_t v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = v3;
        __int16 v17 = 1024;
        int v18 = v5;
        __int16 v19 = 2082;
        long long v20 = __strerrbuf;
        uint64_t v7 = "Can't get size for %@ (%d: %{public}s)";
        id v8 = buf;
        id v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 28;
        goto LABEL_8;
      }
    }

    off_t st_size = 0;
    goto LABEL_10;
  }
  off_t st_size = v14.st_size;
LABEL_10:

  return st_size;
}

- (id)librarySizesFromDBForLibraryKindMask:(unint64_t)a3
{
  char v3 = a3;
  v46[3] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x20) == 0)
  {
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLInternalResource entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  os_log_type_t v10 = (void *)MEMORY[0x1E4F28BA0];
  uint32_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"localAvailability", &unk_1EEBECFC0];
  v46[0] = v11;
  unint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!((%K & %@) == %@)", @"recipeID", &unk_1EEBECFD8, &unk_1EEBECFD8];
  v46[1] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudPhotoLibrarySizesFromDBExclusions"), 1, @"asset");
  v46[2] = v13;
  stat v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  uint64_t v15 = [v10 andPredicateWithSubpredicates:v14];
  [v9 setPredicate:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v16 setName:@"totalFileSize"];
  __int16 v17 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionWithFormat:", @"sum:(%K)", @"dataLength");
  [v16 setExpression:v17];

  [v16 setExpressionResultType:300];
  id v45 = v16;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [v9 setPropertiesToFetch:v18];

  managedObjectContext = self->_managedObjectContext;
  id v38 = 0;
  long long v20 = [(PLManagedObjectContext *)managedObjectContext executeFetchRequest:v9 error:&v38];
  id v21 = v38;
  if (v20)
  {
    if ([v20 count] != 1)
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    id v22 = [v20 objectAtIndexedSubscript:0];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"totalFileSize"];
    uint64_t v5 = [v23 longLongValue];
  }
  else
  {
    id v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int64_t v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v24;
      __int16 v43 = 2112;
      id v44 = v21;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%@ failed to calculate size %@", buf, 0x16u);
    }
    uint64_t v5 = 0;
  }

LABEL_11:
LABEL_12:
  if ([(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled])
  {
    if ((v3 & 0x10) != 0) {
      int64_t v25 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:self urgency:1 sizeOption:1];
    }
    else {
      int64_t v25 = 0;
    }
    uint64_t v27 = [(PLPhotoLibrary *)self libraryBundle];
    id v28 = +[PLCPLSettings settingsWithLibraryBundle:v27];

    char v29 = [v28 isKeepOriginalsEnabled];
    int64_t v26 = 0;
    if ((v3 & 0x40) != 0 && (v29 & 1) == 0)
    {
      int64_t v26 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:self urgency:1 sizeOption:2];
      v25 += v26;
    }
  }
  else
  {
    int64_t v26 = 0;
    int64_t v25 = 0;
  }
  uint64_t v30 = [&unk_1EEBECFF0 stringValue];
  v39[0] = v30;
  uint64_t v31 = [NSNumber numberWithLongLong:v5];
  v40[0] = v31;
  long long v32 = [&unk_1EEBED008 stringValue];
  v39[1] = v32;
  uint64_t v33 = [NSNumber numberWithUnsignedLongLong:v25];
  v40[1] = v33;
  long long v34 = [&unk_1EEBED020 stringValue];
  v39[2] = v34;
  uint64_t v35 = [NSNumber numberWithUnsignedLongLong:v26];
  void v40[2] = v35;
  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];

  return v36;
}

- (id)librarySizesFromDB
{
  return [(PLPhotoLibrary *)self librarySizesFromDBForLibraryKindMask:112];
}

- (void)countOfReferencedMediaWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C0D0];
  unint64_t v6 = +[PLInternalResource entityName];
  uint64_t v7 = [v5 fetchRequestWithEntityName:v6];

  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"fileSystemBookmark != nil"];
  [v7 setPredicate:v8];

  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  os_log_type_t v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PLPhotoLibrary_countOfReferencedMediaWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5874868;
    id v13 = v9;
    id v14 = v7;
    id v15 = v4;
    [(PLPhotoLibrary *)self performBlock:v12];
  }
  else
  {
    uint32_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:0];
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 0x7FFFFFFFFFFFFFFFLL, v11);
  }
}

void __62__PLPhotoLibrary_countOfReferencedMediaWithCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 countForFetchRequest:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  return [(PLPhotoLibrary *)self getPhotoCount:a3 videoCount:a4 excludeTrashed:0 excludeInvisible:0 excludeCloudShared:0];
}

- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4 excludeTrashed:(BOOL)a5 excludeInvisible:(BOOL)a6 excludeCloudShared:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = [(PLPhotoLibrary *)self managedObjectContext];
  BOOL v14 = [(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled];
  *a3 = +[PLManagedAsset countUsedAssetsWithKind:0 excludeTrashed:v9 excludeInvisible:v8 excludeCloudShared:v7 excludePhotoStream:v14 inManagedObjectContext:v13];
  *a4 = +[PLManagedAsset countUsedAssetsWithKind:1 excludeTrashed:v9 excludeInvisible:v8 excludeCloudShared:v7 excludePhotoStream:v14 inManagedObjectContext:v13];

  return 1;
}

- (id)albumListForContentMode:(int)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:self];
  }
  else if (a3 == 13)
  {
    uint64_t v3 = +[PLManagedAlbumList albumListInPhotoLibrary:self];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (PLKeywordManager)keywordManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  uint64_t v3 = [WeakRetained keywordManager];

  return (PLKeywordManager *)v3;
}

- (id)assetsdClient
{
  return [(PLPhotoLibraryBundle *)self->_libraryBundle assetsdClient];
}

- (void)_processPhotoIrisSidecarIfNecessary:(id)a3 forAsset:(id)a4 mainFileMetadata:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  os_log_type_t v10 = [v7 objectForKeyedSubscript:@"kPTPFilename"];
  uint32_t v11 = [v10 pathExtension];
  if (![v11 isEqualToString:@"MOV"]) {
    goto LABEL_18;
  }
  int v12 = [v8 isPhoto];

  if (v12)
  {
    id v13 = PLCameraConnectionKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Processing Iris video from sidecar %@", buf, 0xCu);
    }

    uint32_t v11 = [v8 pathForOriginalFile];
    BOOL v14 = [v11 stringByDeletingLastPathComponent];
    id v15 = [v7 objectForKey:@"kPTPFilename"];
    id v16 = [v14 stringByAppendingPathComponent:v15];

    __int16 v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    LODWORD(v15) = [v17 fileExistsAtPath:v16];

    if (!v15)
    {
      int v18 = PLCameraConnectionKitGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to find Iris video at %@", buf, 0xCu);
      }
      goto LABEL_17;
    }
    int v18 = [objc_alloc(MEMORY[0x1E4F8CE20]) initWithPathToVideo:v16 pathToImage:v11];
    uint64_t v19 = [v18 pairingIdentifier];
    long long v20 = (void *)v19;
    memset(buf, 0, sizeof(buf));
    uint64_t v29 = 0;
    if (v18)
    {
      [v18 imageDisplayTime];
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      [v18 originalVideoDuration];
      if (!v20) {
        goto LABEL_13;
      }
    }
    else
    {
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      if (!v19) {
        goto LABEL_13;
      }
    }
    if (BYTE12(v26))
    {
      id v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:0];
      *(_OWORD *)int64_t v24 = v26;
      uint64_t v25 = v27;
      long long v22 = *(_OWORD *)buf;
      uint64_t v23 = v29;
      [v8 becomePhotoIrisWithMediaGroupUUID:v20 mainFileMetadata:v9 videoURL:v21 videoDuration:v24 stillDisplayTime:&v22 options:0];
LABEL_16:

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
LABEL_13:
    id v21 = PLCameraConnectionKitGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int64_t v24 = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to extract Iris properties", v24, 2u);
    }
    goto LABEL_16;
  }
LABEL_19:
}

- (id)addDCIMEntryAtFileURL:(id)a3 mainFileMetadata:(id)a4 previewImage:(id)a5 thumbnailImage:(id)a6 savedAssetType:(signed __int16)a7 replacementUUID:(id)a8 publicGlobalUUID:(id)a9 extendedInfo:(id)a10 withUUID:(id)a11 isPlaceholder:(BOOL)a12 placeholderFileURL:(id)a13 forFinalCameraImage:(BOOL)a14
{
  id v42 = a3;
  id v19 = a4;
  id v45 = a5;
  id v46 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a13;
  if (v20 && v23)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:2674 description:@"Cannot specify both replacementUUID and newUUID"];
  }
  if (!self->_pendingTransactions)
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v39 = NSStringFromSelector(a2);
    [v38 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 2675, @"Can only call %@ from within a transaction.", v39 object file lineNumber description];
  }
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  uint64_t v67 = __Block_byref_object_copy__2773;
  uint64_t v68 = __Block_byref_object_dispose__2774;
  id v69 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke;
  v50[3] = &unk_1E5862B68;
  BOOL v60 = &v64;
  void v50[4] = self;
  id v43 = v42;
  id v51 = v43;
  id v41 = v19;
  id v52 = v41;
  signed __int16 v61 = a7;
  id v25 = v23;
  id v53 = v25;
  id v26 = v20;
  id v54 = v26;
  BOOL v62 = a12;
  id v27 = v24;
  id v55 = v27;
  id v28 = v22;
  id v56 = v28;
  id v29 = v21;
  id v57 = v29;
  id v30 = v45;
  id v58 = v30;
  id v31 = v46;
  id v59 = v31;
  BOOL v63 = a14;
  long long v32 = (void *)MEMORY[0x19F38D650](v50);
  uint64_t v33 = [(PLPhotoLibrary *)self libraryServicesManager];
  if (!v33)
  {
    uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 2791, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke_2;
  v48[3] = &unk_1E5875198;
  id v34 = v32;
  id v49 = v34;
  [v33 performBlockWithImportMutex:v48];
  id v35 = (id)v65[5];

  _Block_object_dispose(&v64, 8);
  return v35;
}

void __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke(uint64_t a1)
{
  id v34 = 0;
  uint64_t v35 = 0;
  BYTE1(v30) = 1;
  LOBYTE(v30) = *(unsigned char *)(a1 + 122);
  uint64_t v2 = +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(__int16 *)(a1 + 120), 0, *(void *)(a1 + 56), *(void *)(a1 + 64), &v35, &v34, v30);
  id v3 = v34;
  uint64_t v4 = *(void *)(*(void *)(a1 + 112) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v2;

  unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  if (v6)
  {
    if (*(unsigned char *)(a1 + 122))
    {
      [v6 setAttributesFromMainFileURL:*(void *)(a1 + 40) mainFileMetadata:*(void *)(a1 + 48) savedAssetType:*(__int16 *)(a1 + 120) bundleScope:0 isPlaceholder:1 placeholderFileURL:*(void *)(a1 + 72) imageSource:0 imageData:0];
      unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    }
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    id v7 = [v6 uuid];
    PLStringUUIDComponents(v7, &v33, &v32);

    kdebug_trace();
    id v8 = [*(id *)(a1 + 80) objectForKey:*MEMORY[0x1E4F8C880]];
    if (v8) {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setImportedByBundleIdentifier:v8];
    }
    id v9 = [*(id *)(a1 + 80) objectForKey:*MEMORY[0x1E4F8C878]];
    if (+[PLAdditionalAssetAttributes shouldPersistImportedByDisplayName:v9])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setImportedByDisplayName:v9];
    }
    os_log_type_t v10 = [*(id *)(a1 + 80) objectForKey:*MEMORY[0x1E4F8CA10]];
    if (v10)
    {
      uint32_t v11 = +[PLManagedAsset assetWithUUID:v10 inLibrary:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setOriginalAsset:v11];
    }
    int v12 = [*(id *)(a1 + 80) objectForKey:*MEMORY[0x1E4F8C900]];
    id v13 = v12;
    if (v12) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "setMetadataFromCustomRenderedValue:", objc_msgSend(v12, "integerValue"));
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) hasAdjustments])
    {

      id v3 = 0;
      uint64_t v35 = 0;
    }
    if (*(void *)(a1 + 88))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setDisableFileSystemPersistency:1];
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setPublicGlobalUUID:*(void *)(a1 + 88)];
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setDisableFileSystemPersistency:0];
    }
    BYTE1(v29) = 1;
    LOBYTE(v29) = *(unsigned char *)(a1 + 123);
    id v31 = v3;
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:metadata:forceSRGBConversion:forFinalCameraImage:saveCameraPreviewWellImage:", *(void *)(a1 + 96), *(void *)(a1 + 104), v35, v3, 0, 0, v29);
    int v14 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) isPhoto];
    id v15 = [*(id *)(a1 + 80) objectForKey:*MEMORY[0x1E4F8C8D0]];
    id v16 = v15;
    if (v15)
    {
      int v17 = [v15 BOOLValue];
      int v18 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) additionalAttributes];
      [v18 setCameraCaptureDevice:v17 ^ 1u];

      id v19 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) additionalAttributes];
      id v20 = v19;
      if (v17) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
      [v19 setImportedBy:v21];

      if (v14)
      {
        unsigned int v22 = +[PLManagedAsset imageHDRTypeFromCustomRenderedValue:](PLManagedAsset, "imageHDRTypeFromCustomRenderedValue:", [v13 shortValue])- 2;
        if (v22 <= 2)
        {
          id v23 = off_1E5862DA0;
          if (!v17) {
            id v23 = off_1E5862DB8;
          }
          uint64_t v24 = (uint64_t)*v23[v22];
          if (v24) {
            PLSAggregateDictionaryAddValueForScalarKey(v24, 1);
          }
        }
      }
    }
    else
    {
      id v25 = [*(id *)(a1 + 80) objectForKey:@"ImportedBy"];
      id v26 = v25;
      if (v25)
      {
        __int16 v27 = [v25 intValue];
        id v28 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) additionalAttributes];
        [v28 setImportedBy:v27];
      }
    }

    if (*(unsigned char *)(a1 + 122)
      && *(void *)(a1 + 72)
      && ([*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) hasOriginalFile] & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) persistMetadataToFileURL:*(void *)(a1 + 72)];
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) persistMetadataToFilesystem];
    }
    id v3 = v31;
  }
}

void __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyDCIMEntryForPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pathForOriginalFile];
  if (v5 && [v4 isPhoto])
  {
    unint64_t v6 = [v4 photoLibrary];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__PLPhotoLibrary_modifyDCIMEntryForPhoto___block_invoke;
    v7[3] = &unk_1E5873A50;
    id v8 = v5;
    id v9 = self;
    id v10 = v4;
    [v6 performTransaction:v7 completionHandler:0];
  }
}

void __42__PLPhotoLibrary_modifyDCIMEntryForPhoto___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F8CC48]);
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) libraryBundle];
  id v5 = [v4 timeZoneLookup];
  id v15 = (id)[v2 initWithMediaURL:v3 timeZoneLookup:v5];

  unint64_t v6 = *(void **)(a1 + 48);
  id v7 = [v15 fileSystemProperties];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  objc_msgSend(v6, "setOriginalFilesize:", objc_msgSend(v8, "unsignedIntegerValue"));

  id v9 = *(void **)(a1 + 48);
  id v10 = [v15 cgImageProperties];
  [v9 setThumbnailDataFromImageProperties:v10];

  uint32_t v11 = *(void **)(a1 + 48);
  int v12 = [v15 gpsLocation];
  [v11 setLocation:v12];

  id v13 = *(void **)(a1 + 48);
  int v14 = [MEMORY[0x1E4F1C9C8] date];
  [v13 setModificationDate:v14];
}

- (id)photoOutboundSharingTmpDirectoryURL
{
  id v2 = [(PLPhotoLibraryPathManager *)self->_pathManager privateDirectoryWithSubType:2 createIfNeeded:1 error:0];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];

  return v3;
}

- (PLAlbumProtocol)filesystemImportProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum filesystemImportProgressAlbumInLibrary:self];
}

- (PLAlbumProtocol)otaRestoreProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum otaRestoreProgressAlbumInLibrary:self];
}

- (PLAlbumProtocol)syncProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum syncProgressAlbumInLibrary:self];
}

- (NSArray)syncedAlbums
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PLPhotoLibrary *)self managedObjectContext];
  id v5 = +[PLGenericAlbum albumsWithKind:1603 inManagedObjectContext:v4];
  [v3 addObjectsFromArray:v5];

  unint64_t v6 = [(PLPhotoLibrary *)self managedObjectContext];
  id v7 = +[PLGenericAlbum albumsWithKind:1604 inManagedObjectContext:v6];
  [v3 addObjectsFromArray:v7];

  id v8 = [(PLPhotoLibrary *)self managedObjectContext];
  id v9 = +[PLGenericAlbum albumsWithKind:2 inManagedObjectContext:v8];
  [v3 addObjectsFromArray:v9];

  id v10 = [(PLPhotoLibrary *)self managedObjectContext];
  uint32_t v11 = +[PLGenericAlbum albumsWithKind:1550 inManagedObjectContext:v10];
  [v3 addObjectsFromArray:v11];

  return (NSArray *)v3;
}

- (void)resetCachedImportAlbumsIfNeededForAlbum:(id)a3
{
  id v4 = (PLGenericAlbum *)a3;
  p_lastImportedPhotosAlbum = &self->_lastImportedPhotosAlbum;
  if (self->_lastImportedPhotosAlbum != v4)
  {
    allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
    p_allImportedPhotosAlbum = &self->_allImportedPhotosAlbum;
    if (allImportedPhotosAlbum != v4) {
      goto LABEL_5;
    }
    p_lastImportedPhotosAlbum = p_allImportedPhotosAlbum;
  }
  *p_lastImportedPhotosAlbum = 0;
  id v8 = v4;

  id v4 = v8;
LABEL_5:
}

- (id)lastImportedPhotosAlbumCreateIfNeeded:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
  if (!lastImportedPhotosAlbum)
  {
    BOOL v5 = a3;
    unint64_t v6 = [(PLPhotoLibrary *)self managedObjectContext];
    id v7 = +[PLGenericAlbum albumWithKind:1603 inManagedObjectContext:v6];
    id v8 = self->_lastImportedPhotosAlbum;
    self->_lastImportedPhotosAlbum = v7;

    lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
    if (!lastImportedPhotosAlbum && v5)
    {
      id v9 = +[PLGenericAlbum insertNewAlbumWithKind:1603 title:0 intoLibrary:self];
      id v10 = self->_lastImportedPhotosAlbum;
      self->_lastImportedPhotosAlbum = v9;

      uint32_t v11 = [(PLPhotoLibrary *)self managedObjectContext];
      id v16 = 0;
      char v12 = [v11 save:&v16];
      id v13 = v16;

      if ((v12 & 1) == 0)
      {
        int v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save after creating the lastImportedPhotosAlbum: %@", buf, 0xCu);
        }
      }
      lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
    }
  }
  return lastImportedPhotosAlbum;
}

- (id)lastImportedPhotosAlbum
{
  return [(PLPhotoLibrary *)self lastImportedPhotosAlbumCreateIfNeeded:1];
}

- (id)allImportedPhotosAlbumCreateIfNeeded:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
  if (!allImportedPhotosAlbum)
  {
    BOOL v5 = a3;
    unint64_t v6 = [(PLPhotoLibrary *)self managedObjectContext];
    id v7 = +[PLGenericAlbum albumWithKind:1604 inManagedObjectContext:v6];
    id v8 = self->_allImportedPhotosAlbum;
    self->_allImportedPhotosAlbum = v7;

    allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
    if (!allImportedPhotosAlbum && v5)
    {
      id v9 = +[PLGenericAlbum insertNewAlbumWithKind:1604 title:0 intoLibrary:self];
      id v10 = self->_allImportedPhotosAlbum;
      self->_allImportedPhotosAlbum = v9;

      uint32_t v11 = [(PLPhotoLibrary *)self managedObjectContext];
      id v16 = 0;
      char v12 = [v11 save:&v16];
      id v13 = v16;

      if ((v12 & 1) == 0)
      {
        int v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save after creating the allImportedPhotosAlbum: %@", buf, 0xCu);
        }
      }
      allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
    }
  }
  return allImportedPhotosAlbum;
}

- (id)allImportedPhotosAlbum
{
  return [(PLPhotoLibrary *)self allImportedPhotosAlbumCreateIfNeeded:1];
}

- (void)_removeOldFaceMetadataAsync
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PLPhotoLibrary__removeOldFaceMetadataAsync__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [MEMORY[0x1E4F8B900] performBlockOnWriterQueue:v2];
}

void __45__PLPhotoLibrary__removeOldFaceMetadataAsync__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  id v2 = [*(id *)(a1 + 32) pathManager];
  id v3 = [v2 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
  id v4 = [v1 fileURLWithPath:v3 isDirectory:1];

  +[PLPhotoLibrary removeFaceMetadataAtURL:v4 includingPeople:1];
}

- (void)_enumerateFilesAtURL:(id)a3 withBlock:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void))a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v20[0] = *MEMORY[0x1E4F1C6E8];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v9 = [v7 enumeratorAtURL:v5 includingPropertiesForKeys:v8 options:0 errorHandler:&__block_literal_global_662];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

uint64_t __49__PLPhotoLibrary__enumerateFilesAtURL_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [v4 path];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (void)_enumerateFilesAtURLs:(id)a3 withBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(PLPhotoLibrary *)self _enumerateFilesAtURL:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withBlock:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_rebuildSocialGroups
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLPhotoLibrary *)self libraryBundle];
  id v4 = [v3 indicatorFileCoordinator];

  if ([v4 isRebuildingSocialGroups])
  {
    id v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Encountered the social groups rebuild indicator file, this probably indicates a crash during social group rebuild, will resume rebuilding social groups", buf, 2u);
    }
    goto LABEL_10;
  }
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLGraphNode entityName];
  id v5 = [v6 fetchRequestWithEntityName:v7];

  uint64_t v8 = [(PLPhotoLibrary *)self managedObjectContext];
  uint64_t v9 = +[PLSocialGroup predicateForAllVerifiedSocialGroupsInContext:v8];
  [v5 setPredicate:v9];

  uint64_t v10 = [(PLPhotoLibrary *)self managedObjectContext];
  id v23 = 0;
  uint64_t v11 = [v10 countForFetchRequest:v5 error:&v23];
  id v12 = v23;

  if (!v11)
  {
LABEL_9:

LABEL_10:
    if ([(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled]
      && ([(PLPhotoLibrary *)self cplStatus],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          [v14 initialSyncDate],
          long long v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      id v5 = PLMigrationGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "iCloud Photo Library is enabled. Skipping filesystem social group rebuild.", buf, 2u);
      }
    }
    else
    {
      long long v16 = [PLDirectoryJournal alloc];
      uint64_t v17 = [(PLPhotoLibrary *)self pathManager];
      id v5 = [(PLDirectoryJournal *)v16 initWithPathManager:v17 payloadClass:objc_opt_class()];

      id v21 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __38__PLPhotoLibrary__rebuildSocialGroups__block_invoke;
      v22[3] = &unk_1E5862B18;
      void v22[4] = self;
      LOBYTE(v17) = [v5 enumeratePayloadsUsingBlock:v22 error:&v21];
      id v18 = v21;
      if ((v17 & 1) == 0)
      {
        uint64_t v19 = PLMigrationGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to insert graph nodes for social groups: %@", buf, 0xCu);
        }
      }
    }
    goto LABEL_22;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Error fetching count of social groups in library, will proceed with social group rebuild: %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  id v20 = PLMigrationGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Found existing social groups in library, skipping filesystem social group rebuild", buf, 2u);
  }

LABEL_22:
}

void __38__PLPhotoLibrary__rebuildSocialGroups__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 payloadID];
  id v4 = [v3 payloadIDString];
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = +[PLGraphNode graphNodeWithUUID:v4 inManagedObjectContext:v5];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 32) managedObjectContext];
    id v8 = (id)[v9 insertSocialGroupInManagedObjectContext:v7];
  }
}

- (void)_recreateItemsFromMetadataAtDirectoryURLs:(id)a3 includeAlbums:(BOOL)a4
{
  uint64_t v299 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v230 = [(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled];
  v233 = [MEMORY[0x1E4F1CA48] array];
  v232 = [(PLPhotoLibrary *)self managedObjectContext];
  unsigned int v217 = [v232 hasChanges];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  v219 = [MEMORY[0x1E4F1CA80] set];
  v221 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v225 = [MEMORY[0x1E4F1CA48] array];
  v278[0] = MEMORY[0x1E4F143A8];
  v278[1] = 3221225472;
  v278[2] = __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke;
  v278[3] = &unk_1E5862AF0;
  BOOL v284 = a4;
  id v12 = v8;
  id v279 = v12;
  id v223 = v9;
  id v280 = v223;
  id v213 = v7;
  id v281 = v213;
  id v212 = v10;
  id v282 = v212;
  id v206 = v11;
  id v283 = v206;
  v231 = self;
  v204 = v6;
  [(PLPhotoLibrary *)self _enumerateFilesAtURLs:v6 withBlock:v278];
  [v12 sortUsingComparator:&__block_literal_global_635];
  long long v276 = 0u;
  long long v277 = 0u;
  long long v274 = 0u;
  long long v275 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v274 objects:v298 count:16];
  long long v14 = off_1E585E000;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v275;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v275 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v274 + 1) + 8 * v17);
        uint64_t v19 = (void *)MEMORY[0x19F38D3B0]();
        id v20 = [[PLPersistedAlbumMetadata alloc] initWithPersistedDataAtURL:v18];
        id v21 = v20;
        if (!v20)
        {
          __int16 v27 = PLMigrationGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            id v28 = [v18 path];
            *(_DWORD *)buf = 138412290;
            v295 = v28;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);
          }
LABEL_11:

LABEL_26:
          uint64_t v32 = [v18 path];
          [v233 addObject:v32];
          goto LABEL_27;
        }
        unsigned int v22 = [(PLPersistedAlbumMetadata *)v20 kind];
        uint64_t v23 = [v22 integerValue];

        char v24 = [(__objc2_class *)v14[306] isUserCreatedForKind:v23];
        int v25 = [(__objc2_class *)v14[306] isSmartAlbumForKind:v23];
        if (v230) {
          int v26 = [(__objc2_class *)v14[306] is1WaySyncKind:v23];
        }
        else {
          int v26 = 0;
        }
        if (v23 == 1508)
        {
          uint64_t v29 = [(PLPersistedAlbumMetadata *)v21 projectDocumentType];

          if (v24 & 1) == 0 && ((v25 | v26)) {
            goto LABEL_21;
          }
          if (!v29)
          {
            __int16 v27 = PLMigrationGetLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v21;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Found invalid project album metadata will skip and delete %@", buf, 0xCu);
            }
            goto LABEL_11;
          }
        }
        else if ((v24 & 1) == 0 && v25 | v26)
        {
LABEL_21:
          uint64_t v30 = PLMigrationGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = @"orphaned iTunes sync album";
            if (v25) {
              id v31 = @"smart album";
            }
            v295 = (PLPersistedPersonMetadata *)v31;
            __int16 v296 = 2112;
            v297 = v21;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Found metadata for a invalid album kind: %@, will skip and delete %@", buf, 0x16u);
          }

          goto LABEL_26;
        }
        uint64_t v33 = PLMigrationGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          id v34 = [v18 path];
          *(_DWORD *)buf = 138412290;
          v295 = v34;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "Processing album metadata from %@", buf, 0xCu);
        }
        uint64_t v35 = [(PLPersistedAlbumMetadata *)v21 uuid];
        uint64_t v32 = +[PLGenericAlbum albumWithUUID:v35 inLibrary:v231];

        int v36 = [v32 isSmartAlbum];
        if (!v32)
        {
          int v37 = v36;
          id v38 = [(PLPersistedAlbumMetadata *)v21 cloudGUID];
          uint64_t v32 = +[PLGenericAlbum albumWithCloudGUID:v38 inLibrary:v231];

          uint64_t v39 = [(PLPersistedAlbumMetadata *)v21 cloudGUID];

          unint64_t v40 = PLMigrationGetLog();
          id v41 = v40;
          if (v39 && v32)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v21;
              _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Found album with the same cloudGUID will skip and delete %@", buf, 0xCu);
            }

            id v42 = [v18 path];
            [v233 addObject:v42];
          }
          else
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v43 = &stru_1EEB2EB80;
              if (v37) {
                id v43 = @" smart";
              }
              v295 = (PLPersistedPersonMetadata *)v43;
              __int16 v296 = 2112;
              v297 = v21;
              _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Creating new%@ album from metadata %@", buf, 0x16u);
            }

            uint64_t v44 = [(PLPersistedAlbumMetadata *)v21 insertAlbumFromDataInManagedObjectContext:v232];

            if (v44)
            {
              [v219 addObject:v44];
              if ((v37 & 1) == 0) {
                [(PLPersistedAlbumMetadata *)v21 updateChildrenOrderingInAlbum:v44 includePendingAssetChanges:v217];
              }
              uint64_t v32 = (void *)v44;
            }
            else
            {
              uint64_t v32 = 0;
            }
          }
        }
LABEL_27:

        ++v17;
        long long v14 = off_1E585E000;
      }
      while (v15 != v17);
      uint64_t v45 = [obj countByEnumeratingWithState:&v274 objects:v298 count:16];
      uint64_t v15 = v45;
    }
    while (v45);
  }

  v220 = +[PLGenericAlbum rootFolderInLibrary:v231];
  v216 = +[PLGenericAlbum projectAlbumRootFolderInLibrary:v231];
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  id v227 = v223;
  uint64_t v46 = [v227 countByEnumeratingWithState:&v270 objects:v293 count:16];
  if (!v46)
  {
    v211 = 0;
    v215 = 0;
    id v49 = v225;
    goto LABEL_97;
  }
  uint64_t v47 = v46;
  v211 = 0;
  v215 = 0;
  uint64_t v48 = *(void *)v271;
  id v49 = v225;
  do
  {
    uint64_t v50 = 0;
    do
    {
      if (*(void *)v271 != v48) {
        objc_enumerationMutation(v227);
      }
      id v51 = *(void **)(*((void *)&v270 + 1) + 8 * v50);
      id v52 = (void *)MEMORY[0x19F38D3B0]();
      id v53 = [[PLPersistedFolderMetadata alloc] initWithPersistedDataAtURL:v51];
      id v54 = v53;
      if (!v53)
      {
        id v57 = PLMigrationGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          BOOL v63 = [v51 path];
          *(_DWORD *)buf = 138412290;
          v295 = v63;
          uint64_t v64 = v57;
          os_log_type_t v65 = OS_LOG_TYPE_ERROR;
          uint64_t v66 = "Failed to read invalid or missing metadata, will skip and delete %@";
          goto LABEL_64;
        }
LABEL_65:

        BOOL v62 = [v51 path];
        [v233 addObject:v62];
        goto LABEL_82;
      }
      id v55 = [(PLPersistedFolderMetadata *)v53 kind];
      uint64_t v56 = [v55 integerValue];

      if (v230 && +[PLGenericAlbum is1WaySyncKind:v56])
      {
        id v57 = PLMigrationGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Found metadata for a invalid folder kind: orphaned iTunes sync folder, will skip and delete %@", buf, 0xCu);
        }
        goto LABEL_65;
      }
      if ([(PLPersistedFolderMetadata *)v54 isRootFolder])
      {
        id v58 = PLMigrationGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEBUG, "Found root folder metadata %@", buf, 0xCu);
        }

        [v49 addObject:v54];
        id v59 = [(PLPersistedFolderMetadata *)v54 uuid];
        BOOL v60 = [v220 uuid];
        char v61 = [v59 isEqualToString:v60];

        if (v61)
        {
          BOOL v62 = v215;
          v215 = v54;
LABEL_81:
          id v49 = v225;
          goto LABEL_82;
        }
        uint64_t v71 = PLMigrationGetLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v72 = [(PLPersistedFolderMetadata *)v54 uuid];
          uint64_t v73 = [v220 uuid];
          *(_DWORD *)buf = 138412546;
          v295 = v72;
          __int16 v296 = 2112;
          v297 = v73;
          uint64_t v74 = v71;
          uint64_t v75 = "Root folder metadata uuid %@ doesn't match current root folder %@, will delete";
          goto LABEL_79;
        }
        goto LABEL_80;
      }
      if ([(PLPersistedFolderMetadata *)v54 isProjectAlbumRootFolder])
      {
        uint64_t v67 = PLMigrationGetLog();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEBUG, "Found project root folder metadata %@", buf, 0xCu);
        }

        [v49 addObject:v54];
        uint64_t v68 = [(PLPersistedFolderMetadata *)v54 uuid];
        id v69 = [v216 uuid];
        char v70 = [v68 isEqualToString:v69];

        if (v70)
        {
          BOOL v62 = v211;
          v211 = v54;
          goto LABEL_81;
        }
        uint64_t v71 = PLMigrationGetLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v72 = [(PLPersistedFolderMetadata *)v54 uuid];
          uint64_t v73 = [v216 uuid];
          *(_DWORD *)buf = 138412546;
          v295 = v72;
          __int16 v296 = 2112;
          v297 = v73;
          uint64_t v74 = v71;
          uint64_t v75 = "Project Root folder metadata uuid %@ doesn't match current project root folder %@, will delete";
LABEL_79:
          _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0x16u);
        }
LABEL_80:

        BOOL v62 = [v51 path];
        [v233 addObject:v62];
        goto LABEL_81;
      }
      uint64_t v76 = [(PLPersistedFolderMetadata *)v54 cloudGUID];
      if ([v76 isEqualToString:@"----Project-Root-Folder----"])
      {
        BOOL v77 = [(PLPersistedFolderMetadata *)v54 isProjectAlbumRootFolder];

        if (!v77)
        {
          id v57 = PLMigrationGetLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v63 = [(PLPersistedFolderMetadata *)v54 uuid];
            *(_DWORD *)buf = 138412290;
            v295 = v63;
            uint64_t v64 = v57;
            os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
            uint64_t v66 = "found project root album folderMetadata (uuid: %@) with incorrect folder type, will delete";
LABEL_64:
            _os_log_impl(&dword_19B3C7000, v64, v65, v66, buf, 0xCu);
          }
          goto LABEL_65;
        }
      }
      else
      {
      }
      v78 = PLMigrationGetLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        v79 = [v51 path];
        *(_DWORD *)buf = 138412290;
        v295 = v79;
        _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_DEBUG, "Processing folder metadata from %@", buf, 0xCu);
      }
      uint64_t v80 = [(PLPersistedFolderMetadata *)v54 uuid];
      BOOL v62 = +[PLGenericAlbum albumWithUUID:v80 inLibrary:v231];

      if (v62) {
        goto LABEL_93;
      }
      id v81 = PLMigrationGetLog();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v295 = (PLPersistedPersonMetadata *)v54;
        _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_DEFAULT, "Creating new folder from metadata %@", buf, 0xCu);
      }

      uint64_t v82 = [(PLPersistedFolderMetadata *)v54 insertFolderFromDataInManagedObjectContext:v232];
      if (v82)
      {
        BOOL v62 = (void *)v82;
        [v219 addObject:v82];
LABEL_93:
        [v221 setObject:v54 forKey:v62];
LABEL_82:
      }
      ++v50;
    }
    while (v47 != v50);
    uint64_t v83 = [v227 countByEnumeratingWithState:&v270 objects:v293 count:16];
    uint64_t v47 = v83;
  }
  while (v83);
LABEL_97:

  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  id v226 = v213;
  uint64_t v84 = [v226 countByEnumeratingWithState:&v266 objects:v292 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v267;
    do
    {
      for (uint64_t i = 0; i != v85; ++i)
      {
        if (*(void *)v267 != v86) {
          objc_enumerationMutation(v226);
        }
        v88 = [*(id *)(*((void *)&v266 + 1) + 8 * i) path];
        v89 = PLMigrationGetLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v88;
          _os_log_impl(&dword_19B3C7000, v89, OS_LOG_TYPE_DEFAULT, "Processing metadata for albumlist %@", buf, 0xCu);
        }

        if (!+[PLManagedAlbumList restoreAlbumListFromPersistedDataAtPath:v88 library:v231])
        {
          v90 = PLMigrationGetLog();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v295 = v88;
            _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_ERROR, "Found metadata for a invalid album list kind, will skip and delete %@", buf, 0xCu);
          }

          [v233 addObject:v88];
        }
      }
      uint64_t v85 = [v226 countByEnumeratingWithState:&v266 objects:v292 count:16];
    }
    while (v85);
  }

  v91 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v92 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (v215)
  {
    v93 = [(PLPersistedFolderMetadata *)v215 childUUIDs];
    [v91 unionOrderedSet:v93];

    [v49 removeObject:v215];
  }
  v94 = v232;
  if (v211)
  {
    v95 = [(PLPersistedFolderMetadata *)v211 childUUIDs];
    [v92 unionOrderedSet:v95];

    [v49 removeObject:v211];
  }
  v207 = v92;
  long long v264 = 0u;
  long long v265 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  id v229 = v49;
  uint64_t v96 = [v229 countByEnumeratingWithState:&v262 objects:v291 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v263;
    do
    {
      for (uint64_t j = 0; j != v97; ++j)
      {
        if (*(void *)v263 != v98) {
          objc_enumerationMutation(v229);
        }
        v100 = *(void **)(*((void *)&v262 + 1) + 8 * j);
        long long v258 = 0u;
        long long v259 = 0u;
        long long v260 = 0u;
        long long v261 = 0u;
        v101 = [v100 childUUIDs];
        uint64_t v102 = [v101 countByEnumeratingWithState:&v258 objects:v290 count:16];
        if (v102)
        {
          uint64_t v103 = v102;
          uint64_t v104 = *(void *)v259;
          do
          {
            for (uint64_t k = 0; k != v103; ++k)
            {
              if (*(void *)v259 != v104) {
                objc_enumerationMutation(v101);
              }
              [v91 addObject:*(void *)(*((void *)&v258 + 1) + 8 * k)];
            }
            uint64_t v103 = [v101 countByEnumeratingWithState:&v258 objects:v290 count:16];
          }
          while (v103);
        }
      }
      uint64_t v97 = [v229 countByEnumeratingWithState:&v262 objects:v291 count:16];
    }
    while (v97);
  }

  if ([v91 count]) {
    +[PLPersistedFolderMetadata updateChildrenOrderingInFolder:v220 usingChildUUIDs:v91 sourceDescription:0 includePendingChanges:1];
  }
  if ([v207 count]) {
    +[PLPersistedFolderMetadata updateChildrenOrderingInFolder:v216 usingChildUUIDs:v207 sourceDescription:0 includePendingChanges:1];
  }
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  id v106 = v221;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v254 objects:v289 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v109 = *(void *)v255;
    do
    {
      for (uint64_t m = 0; m != v108; ++m)
      {
        if (*(void *)v255 != v109) {
          objc_enumerationMutation(v106);
        }
        uint64_t v111 = *(void *)(*((void *)&v254 + 1) + 8 * m);
        v112 = [v106 objectForKey:v111];
        [v112 updateChildrenOrderingInFolder:v111 includePendingChanges:1];
      }
      uint64_t v108 = [v106 countByEnumeratingWithState:&v254 objects:v289 count:16];
    }
    while (v108);
  }

  [(PLPhotoLibrary *)v231 _deleteEmptyImportAlbumsWithAddedAlbums:v219];
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  id v113 = v219;
  uint64_t v114 = [v113 countByEnumeratingWithState:&v250 objects:v288 count:16];
  if (v114)
  {
    uint64_t v115 = v114;
    uint64_t v116 = *(void *)v251;
    do
    {
      for (uint64_t n = 0; n != v115; ++n)
      {
        if (*(void *)v251 != v116) {
          objc_enumerationMutation(v113);
        }
        v118 = *(void **)(*((void *)&v250 + 1) + 8 * n);
        if (([v118 isRegularRootFolder] & 1) == 0
          && ([v118 isProjectAlbumRootFolder] & 1) == 0)
        {
          v119 = [v118 parentFolder];

          if (!v119)
          {
            if ([v118 isProjectAlbum]) {
              v120 = v216;
            }
            else {
              v120 = v220;
            }
            v121 = [v120 albums];
            [v121 addObject:v118];
          }
        }
      }
      uint64_t v115 = [v113 countByEnumeratingWithState:&v250 objects:v288 count:16];
    }
    while (v115);
  }

  if ([v232 hasChanges])
  {
    id v249 = 0;
    char v122 = [v232 save:&v249];
    id v123 = v249;
    if ((v122 & 1) == 0)
    {
      uint64_t v199 = [NSString stringWithFormat:@"recreateAlbumsFromMetadta failed to save context %@: %@", v232, v123];
      v200 = PLMigrationGetLog();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v295 = (PLPersistedPersonMetadata *)v199;
        _os_log_impl(&dword_19B3C7000, v200, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      id v201 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v199 userInfo:0];
      objc_exception_throw(v201);
    }
  }
  v203 = v113;
  id v205 = v106;
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  id v224 = v212;
  uint64_t v124 = [v224 countByEnumeratingWithState:&v245 objects:v287 count:16];
  if (v124)
  {
    uint64_t v125 = v124;
    uint64_t v126 = *(void *)v246;
    do
    {
      for (iuint64_t i = 0; ii != v125; ++ii)
      {
        if (*(void *)v246 != v126) {
          objc_enumerationMutation(v224);
        }
        v128 = *(void **)(*((void *)&v245 + 1) + 8 * ii);
        v129 = (void *)MEMORY[0x19F38D3B0]();
        v130 = [[PLPersistedMemoryMetadata alloc] initWithPersistedDataAtURL:v128];
        v131 = v130;
        if (v130)
        {
          v132 = [(PLPersistedMemoryMetadata *)v130 uuid];
          v133 = +[PLMemory memoryWithUUID:v132 inPhotoLibrary:v231];

          if (v133) {
            goto LABEL_183;
          }
          BOOL v134 = [(PLPersistedMemoryMetadata *)v131 isObsolete];
          if (!v230 || v134)
          {
            v135 = v232;
            if (v134) {
              goto LABEL_180;
            }
          }
          else
          {
            v135 = v232;
            if (![(PLPersistedMemoryMetadata *)v131 hasAllAssetsAvailableInManagedObjectContext:v232 includePendingAssetChanges:v217])
            {
              v140 = PLMigrationGetLog();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v295 = (PLPersistedPersonMetadata *)v131;
                _os_log_impl(&dword_19B3C7000, v140, OS_LOG_TYPE_DEFAULT, "Skipping restore for memory with references to unavailable assets, will restore %@ from iCloud Photo Library", buf, 0xCu);
              }

LABEL_180:
              v141 = PLMigrationGetLog();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v295 = (PLPersistedPersonMetadata *)v131;
                _os_log_impl(&dword_19B3C7000, v141, OS_LOG_TYPE_DEFAULT, "Removing persisted data for %@", buf, 0xCu);
              }

              [(PLPersistedMemoryMetadata *)v131 removePersistedData];
              v133 = 0;
              goto LABEL_183;
            }
          }
          v138 = PLMigrationGetLog();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v295 = (PLPersistedPersonMetadata *)v131;
            _os_log_impl(&dword_19B3C7000, v138, OS_LOG_TYPE_DEFAULT, "Creating new memory from metadata %@", buf, 0xCu);
          }

          v133 = [(PLPersistedMemoryMetadata *)v131 insertMemoryFromDataInManagedObjectContext:v135];
          if (v133
            && ![(PLPersistedMemoryMetadata *)v131 updateAssetsInMemory:v133 includePendingAssetChanges:v217])
          {
            v139 = PLMigrationGetLog();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v131;
              _os_log_impl(&dword_19B3C7000, v139, OS_LOG_TYPE_ERROR, "Incomplete restore of assets for memory %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v136 = PLMigrationGetLog();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v137 = [v128 path];
            *(_DWORD *)buf = 138412290;
            v295 = v137;
            _os_log_impl(&dword_19B3C7000, v136, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);
          }
          v133 = [v128 path];
          [v233 addObject:v133];
        }
LABEL_183:

        v94 = v232;
        if ([v232 hasChanges])
        {
          id v244 = 0;
          char v142 = [v232 save:&v244];
          v143 = (PLPersistedAlbumMetadata *)v244;
          if ((v142 & 1) == 0)
          {
            v144 = PLMigrationGetLog();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
            {
              v145 = [v128 path];
              *(_DWORD *)buf = 138412546;
              v295 = v145;
              __int16 v296 = 2112;
              v297 = v143;
              _os_log_impl(&dword_19B3C7000, v144, OS_LOG_TYPE_ERROR, "recreateAlbumsFromMetadata failed to rebuild memory from %@: %@", buf, 0x16u);
            }
            [v232 rollback];
          }

          v94 = v232;
        }
      }
      uint64_t v125 = [v224 countByEnumeratingWithState:&v245 objects:v287 count:16];
    }
    while (v125);
  }

  v146 = v231;
  v147 = [(PLPhotoLibrary *)v231 libraryBundle];
  v148 = [v147 indicatorFileCoordinator];

  if (![v148 isRebuildingPersons])
  {
    v149 = +[PLPerson fetchRequest];
    id v243 = 0;
    uint64_t v151 = [v94 countForFetchRequest:v149 error:&v243];
    v152 = (PLPersistedPersonMetadata *)v243;
    v150 = v205;
    if (v151)
    {
      v153 = v148;
      if (v151 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v190 = PLMigrationGetLog();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v190, OS_LOG_TYPE_DEFAULT, "Found existing persons in library, skipping filesystem person rebuild", buf, 2u);
        }

        [(PLPhotoLibrary *)v231 _rebuildSocialGroups];
        v148 = v153;
        goto LABEL_260;
      }
      v154 = PLMigrationGetLog();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v295 = v152;
        _os_log_impl(&dword_19B3C7000, v154, OS_LOG_TYPE_ERROR, "Error fetching count of persons in library, will proceed with person rebuild: %@", buf, 0xCu);
      }

      v148 = v153;
    }

    goto LABEL_200;
  }
  v149 = PLMigrationGetLog();
  v150 = v205;
  if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v149, OS_LOG_TYPE_ERROR, "Encountered the person rebuild indicator file, this probably indicates a crash during person rebuild, will resume rebuilding persons", buf, 2u);
  }
LABEL_200:

  [v148 setIsRebuildingPersons:1];
  v218 = +[PLPersistedPersonMetadata personUUIDsToDedupeWithMetadataURLs:v206 cplEnabled:[(PLPhotoLibrary *)v231 isCloudPhotoLibraryEnabled]];
  v208 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v206, "count"));
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  id v155 = v206;
  uint64_t v156 = [v155 countByEnumeratingWithState:&v239 objects:v286 count:16];
  if (!v156)
  {

    v187 = 0;
    char v188 = 1;
    goto LABEL_253;
  }
  uint64_t v157 = v156;
  v222 = v155;
  v202 = v148;
  v209 = 0;
  unint64_t v210 = 0;
  char v214 = 1;
  uint64_t v158 = *(void *)v240;
  while (2)
  {
    uint64_t v159 = 0;
    while (2)
    {
      if (*(void *)v240 != v158) {
        objc_enumerationMutation(v222);
      }
      v160 = *(void **)(*((void *)&v239 + 1) + 8 * v159);
      v161 = (void *)MEMORY[0x19F38D3B0]();
      v162 = [[PLPersistedPersonMetadata alloc] initWithPersistedDataAtURL:v160 deferUnarchiving:1 cplEnabled:[(PLPhotoLibrary *)v231 isCloudPhotoLibraryEnabled]];
      v163 = v162;
      if (!v162)
      {
        v171 = PLMigrationGetLog();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
        {
          v172 = [v160 path];
          *(_DWORD *)buf = 138412290;
          v295 = v172;
          _os_log_impl(&dword_19B3C7000, v171, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);
        }
        v164 = [v160 path];
        [v233 addObject:v164];
        goto LABEL_236;
      }
      v164 = [(PLPersistedPersonMetadata *)v162 personUUID];
      if (!v164)
      {
        v165 = PLMigrationGetLog();
        if (!os_log_type_enabled(v165, OS_LOG_TYPE_ERROR)) {
          goto LABEL_217;
        }
        v166 = [v160 path];
        *(_DWORD *)buf = 138412290;
        v295 = v166;
        v167 = v165;
        os_log_type_t v168 = OS_LOG_TYPE_ERROR;
        v169 = "Invalid person metadata missing person UUID, will skip and delete %@";
        goto LABEL_215;
      }
      if ([v218 containsObject:v164])
      {
        v165 = PLMigrationGetLog();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          v166 = [v160 path];
          *(_DWORD *)buf = 138412546;
          v295 = v163;
          __int16 v296 = 2112;
          v297 = (PLPersistedAlbumMetadata *)v166;
          v167 = v165;
          os_log_type_t v168 = OS_LOG_TYPE_DEFAULT;
          v169 = "Person from metadata %@ will be deduped, will skip and delete %@";
          uint32_t v170 = 22;
          goto LABEL_216;
        }
        goto LABEL_217;
      }
      uint64_t v174 = +[PLPerson personWithUUID:v164 inManagedObjectContext:v94];
      if (v174)
      {
        v173 = v174;
        v175 = PLMigrationGetLog();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v163;
          _os_log_impl(&dword_19B3C7000, v175, OS_LOG_TYPE_DEFAULT, "Person for metadata already exists: %@", buf, 0xCu);
        }
        goto LABEL_234;
      }
      BOOL v176 = [(PLPersistedPersonMetadata *)v163 readMetadata];
      v177 = PLMigrationGetLog();
      v165 = v177;
      if (!v176)
      {
        if (!os_log_type_enabled(v177, OS_LOG_TYPE_ERROR)) {
          goto LABEL_217;
        }
        v166 = [v160 path];
        *(_DWORD *)buf = 138412290;
        v295 = v166;
        v167 = v165;
        os_log_type_t v168 = OS_LOG_TYPE_ERROR;
        v169 = "Failed to read invalid or missing metadata, will skip and delete %@";
LABEL_215:
        uint32_t v170 = 12;
LABEL_216:
        _os_log_impl(&dword_19B3C7000, v167, v168, v169, buf, v170);

LABEL_217:
        v173 = [v160 path];
        [v233 addObject:v173];
        goto LABEL_235;
      }
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v295 = v163;
        _os_log_impl(&dword_19B3C7000, v165, OS_LOG_TYPE_DEFAULT, "Creating new person from metadata %@", buf, 0xCu);
      }

      unint64_t v178 = [(PLPersistedPersonMetadata *)v163 fromVersion];
      unint64_t v179 = v210;
      if (v178 > v210) {
        unint64_t v179 = v178;
      }
      unint64_t v210 = v179;
      uint64_t v180 = [(PLPersistedPersonMetadata *)v163 insertPersonFromDataInManagedObjectContext:v232];
      if (v180)
      {
        v173 = v180;
        if (![(PLPersistedPersonMetadata *)v163 updateFacesInPerson:v180 fromDataInManagedObjectContext:v232 deferUnmatched:v230])
        {
          v181 = PLMigrationGetLog();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v295 = v163;
            _os_log_impl(&dword_19B3C7000, v181, OS_LOG_TYPE_ERROR, "Incomplete restore of faces for person %@", buf, 0xCu);
          }
        }
        v175 = [(PLPersistedPersonMetadata *)v163 mergeTargetPersonUUID];
        if (v175) {
          [v208 setObject:v175 forKey:v164];
        }
        v209 = (PLPersistedPersonMetadata *)((char *)v209 + 1);
LABEL_234:
      }
      else
      {
        v173 = PLMigrationGetLog();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v163;
          _os_log_impl(&dword_19B3C7000, v173, OS_LOG_TYPE_ERROR, "Failed to create new person from metadata %@", buf, 0xCu);
        }
      }
LABEL_235:

      v94 = v232;
LABEL_236:

      if ([v94 hasChanges])
      {
        id v238 = 0;
        char v182 = [v94 save:&v238];
        v183 = (PLPersistedAlbumMetadata *)v238;
        if ((v182 & 1) == 0)
        {
          v184 = PLMigrationGetLog();
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            v185 = [v160 path];
            *(_DWORD *)buf = 138412546;
            v295 = v185;
            __int16 v296 = 2112;
            v297 = v183;
            _os_log_impl(&dword_19B3C7000, v184, OS_LOG_TYPE_ERROR, "recreateAlbumsFromMetadata failed to rebuild person from %@: %@", buf, 0x16u);
          }
          v94 = v232;
          [v232 rollback];
          char v214 = 0;
        }
      }
      if (v157 != ++v159) {
        continue;
      }
      break;
    }
    uint64_t v186 = [v222 countByEnumeratingWithState:&v239 objects:v286 count:16];
    uint64_t v157 = v186;
    if (v186) {
      continue;
    }
    break;
  }

  v187 = v209;
  if (v209)
  {
    +[PLPersistedPersonMetadata updateMergeTargetPersonWithPersonUUIDMapping:v208 fromDataInManagedObjectContext:v94];
    +[PLPersistedPersonMetadata performPostImportMigrationFromVersion:v210 fromDataInManagedObjectContext:v94];
  }
  v146 = v231;
  v150 = v205;
  v148 = v202;
  char v188 = v214;
LABEL_253:
  v189 = PLMigrationGetLog();
  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v295 = v187;
    _os_log_impl(&dword_19B3C7000, v189, OS_LOG_TYPE_DEFAULT, "Created %lu persons from filesystem rebuild", buf, 0xCu);
  }

  [(PLPhotoLibrary *)v146 _rebuildSocialGroups];
  if (v188) {
LABEL_260:
  }
    [(PLPhotoLibrary *)v146 _removeOldFaceMetadataAsync];
  [v148 setIsRebuildingPersons:0];
  if ([v233 count])
  {
    v191 = PLMigrationGetLog();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
    {
      int v192 = [v233 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v295) = v192;
      _os_log_impl(&dword_19B3C7000, v191, OS_LOG_TYPE_DEFAULT, "Removing %d stale 1-way sync album metadata files", buf, 8u);
    }

    v193 = [MEMORY[0x1E4F8B908] fileManager];
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    long long v237 = 0u;
    id v194 = v233;
    uint64_t v195 = [v194 countByEnumeratingWithState:&v234 objects:v285 count:16];
    if (v195)
    {
      uint64_t v196 = v195;
      uint64_t v197 = *(void *)v235;
      do
      {
        for (juint64_t j = 0; jj != v196; ++jj)
        {
          if (*(void *)v235 != v197) {
            objc_enumerationMutation(v194);
          }
          [v193 removeItemAtPath:*(void *)(*((void *)&v234 + 1) + 8 * jj) error:0];
        }
        uint64_t v196 = [v194 countByEnumeratingWithState:&v234 objects:v285 count:16];
      }
      while (v196);
    }
  }
}

void __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C6E8];
  id v10 = 0;
  int v5 = [v3 getResourceValue:&v11 forKey:v4 error:&v10];
  id v6 = v11;
  id v7 = v10;
  if (v5 && [v6 length])
  {
    if (+[PLPersistedAlbumMetadata isValidPath:v6]
      && *(unsigned char *)(a1 + 72))
    {
      id v8 = *(void **)(a1 + 32);
LABEL_20:
      [v8 addObject:v3];
      goto LABEL_21;
    }
    if (+[PLPersistedFolderMetadata isValidPath:v6]
      && *(unsigned char *)(a1 + 72))
    {
      id v8 = *(void **)(a1 + 40);
      goto LABEL_20;
    }
    if (+[PLManagedAlbumList isValidPathForPersistence:v6]&& *(unsigned char *)(a1 + 72))
    {
      id v8 = *(void **)(a1 + 48);
      goto LABEL_20;
    }
    if (+[PLPersistedMemoryMetadata isValidPath:v6])
    {
      id v8 = *(void **)(a1 + 56);
      goto LABEL_20;
    }
    if (+[PLPersistedPersonMetadata isValidPath:v6])
    {
      id v8 = *(void **)(a1 + 64);
      goto LABEL_20;
    }
  }
  else if (v7)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to get file name for %@ (%@)", buf, 0x16u);
    }
  }
LABEL_21:
}

uint64_t __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke_632(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C530];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  id v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v9 compare:v6];
  return v7;
}

- (void)_deleteEmptyImportAlbumsWithAddedAlbums:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Album"];
  id v5 = [&unk_1EEBF1538 arrayByAddingObject:&unk_1EEBECFA8];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(kind in %@) AND (assets.@count = 0)", v5];
  [v4 setPredicate:v6];

  uint64_t v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v33 = 0;
  id v8 = [v7 executeFetchRequest:v4 error:&v33];
  id v9 = v33;

  if (v8)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v24 = v9;
      int v25 = v8;
      int v26 = v5;
      __int16 v27 = v4;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v17 = [v15 kind];
          int v18 = [&unk_1EEBF1538 containsObject:v17];

          if (!v18
            || [v28 containsObject:v15]
            && ([v15 assets],
                uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                uint64_t v20 = [v19 count],
                v19,
                !v20))
          {
            id v21 = PLMigrationGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v22 = [v15 uuid];
              uint64_t v23 = [v15 kind];
              *(_DWORD *)buf = 138412546;
              id v35 = v22;
              __int16 v36 = 2112;
              int v37 = v23;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Deleting empty album %@ of kind %@", buf, 0x16u);
            }
            [v15 delete];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v12);
      id v5 = v26;
      uint64_t v4 = v27;
      id v9 = v24;
      id v8 = v25;
    }
  }
  else
  {
    id v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error fetching empty albums for cleanup %@", buf, 0xCu);
    }
  }
}

- (void)recreatePersonsFromMetadata
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = [(PLPhotoLibrary *)self pathManager];
  id v5 = [v4 privateDirectoryWithSubType:5 createIfNeeded:1 error:0];
  id v6 = [v3 fileURLWithPath:v5 isDirectory:1];
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [(PLPhotoLibrary *)self _recreateItemsFromMetadataAtDirectoryURLs:v7 includeAlbums:0];
}

- (void)recreateMemoriesAndPersonsFromMetadata
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = [(PLPhotoLibrary *)self pathManager];
  id v5 = [v4 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
  id v6 = [v3 fileURLWithPath:v5 isDirectory:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [(PLPhotoLibrary *)self pathManager];
  id v9 = [v8 privateDirectoryWithSubType:5 createIfNeeded:1 error:0];
  id v10 = [v7 fileURLWithPath:v9 isDirectory:1];

  v12[0] = v6;
  v12[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [(PLPhotoLibrary *)self _recreateItemsFromMetadataAtDirectoryURLs:v11 includeAlbums:0];
}

- (void)recreateAlbumsAndPersonsFromMetadata
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = [(PLPhotoLibrary *)self pathManager];
  id v5 = [v4 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];
  id v6 = [v3 fileURLWithPath:v5 isDirectory:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = [(PLPhotoLibrary *)self pathManager];
  id v9 = [v8 privateDirectoryWithSubType:5 createIfNeeded:1 error:0];
  id v10 = [v7 fileURLWithPath:v9 isDirectory:1];

  v12[0] = v6;
  v12[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [(PLPhotoLibrary *)self _recreateItemsFromMetadataAtDirectoryURLs:v11 includeAlbums:1];
}

- (BOOL)isUnitTesting
{
  return 0;
}

- (void)invalidateWithReason:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PLPhotoLibrary *)self _internal_managedObjectContext];
  id v5 = v4;
  if (v4) {
    [v4 invalidateWithReason:v6];
  }
}

- (id)managedObjectContextStoreUUID
{
  id v2 = [(PLPhotoLibrary *)self managedObjectContext];
  id v3 = [v2 storeUUID];

  return v3;
}

- (void)repairSingletonObjects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (PLIsAssetsd())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    id v3 = [WeakRetained modelMigrator];
    [v3 repairSingletonObjectsInDatabase];
  }
  else
  {
    uint64_t v4 = [(PLPhotoLibrary *)self assetsdClient];
    id v5 = [v4 libraryClient];
    id v10 = 0;
    char v6 = [v5 synchronouslyRepairSingletonObjectsWithError:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      id v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error asking assetsd to repair singleton objects: %@", buf, 0xCu);
      }
    }
  }
}

- (void)cleanupIncompleteAssetsAfterOTARestore
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Cleanup incomplete assets after OTA restore", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLPhotoLibrary cleanupIncompleteAssetsAfterOTARestore]"];
  char v6 = [MEMORY[0x1E4F8B908] fileManager];
  id v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v8 = (void *)MEMORY[0x19F38D3B0]();
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLManagedAsset entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setFetchBatchSize:100];
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"complete == 0"];
  [v11 setPredicate:v12];

  v35[0] = @"master";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v11 setRelationshipKeyPathsForPrefetching:v13];

  id v30 = 0;
  __int16 v14 = [v7 executeFetchRequest:v11 error:&v30];
  id v15 = v30;
  if (!v14)
  {
    uint64_t v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      long long v32 = v17;
      __int16 v33 = 2114;
      id v34 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch incomplete assets %{public}@", buf, 0x16u);
    }
  }

  if ([v14 count])
  {
    int v18 = PLMigrationGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v14 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Found %d incomplete assets", buf, 8u);
    }

    uint64_t v20 = [(PLPhotoLibrary *)self libraryServicesManager];
    id v21 = [v20 modelMigrator];
    unsigned int v22 = [v21 deviceRestoreMigrationSupport];
    char v23 = [v22 isRestoreFromBackupSourceMegaBackup];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke;
    v26[3] = &unk_1E5862AC8;
    char v29 = v23;
    id v27 = v6;
    id v28 = self;
    id v24 = (id)[v7 enumerateWithIncrementalSaveUsingObjects:v14 shouldRefreshAfterSave:1 withBlock:v26];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke_577;
  void v25[3] = &unk_1E5875CE0;
  v25[4] = self;
  [(PLPhotoLibrary *)self performTransactionAndWait:v25];
  [v5 stillAlive];
}

void __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 48)
    && ([v3 objectIDsForRelationshipNamed:@"master"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uuid];
      int v18 = 138543362;
      int v19 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Mega-backup: Asset with UUID %{public}@ has a CloudMaster, setting complete", (uint8_t *)&v18, 0xCu);
    }
    [v4 setComplete:1];
  }
  else
  {
    id v9 = [v4 mainFileURL];
    id v10 = [v9 path];

    if (v10 && ([*(id *)(a1 + 32) fileExistsAtPath:v10] & 1) != 0)
    {
      uint64_t v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v4 uuid];
        int v13 = *(unsigned __int8 *)(a1 + 48);
        int v18 = 138543874;
        int v19 = v12;
        __int16 v20 = 2114;
        id v21 = v10;
        __int16 v22 = 1024;
        int v23 = v13;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Fixing incomplete asset (main file is present) after restore cancelled/completed: uuid:%{public}@ path:%{public}@ isMegaBackup:%d", (uint8_t *)&v18, 0x1Cu);
      }
      [v4 setComplete:1];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 128));
      id v15 = [WeakRetained modelMigrator];
      [v15 postProcessFixesAfterOTARestoreForCompleteAsset:v4 fixAddedDate:0 isMegaBackup:*(unsigned __int8 *)(a1 + 48)];
    }
    else
    {
      uint64_t v16 = PLMigrationGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v4 uuid];
        int v18 = 138543618;
        int v19 = v17;
        __int16 v20 = 2114;
        id v21 = v10;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Deleting incomplete asset after restore cancelled/completed: uuid:%{public}@ path:%{public}@", (uint8_t *)&v18, 0x16u);
      }
      [v4 deleteFromDatabaseOnly];
    }
  }
}

void __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke_577(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) otaRestoreProgressAlbum];
  if ([v1 pendingItemsType] != 1 || objc_msgSend(v1, "pendingItemsCount"))
  {
    id v2 = PLMigrationGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Marking OTA restore progress as complete", v3, 2u);
    }

    [v1 setPendingItemsType:1];
    [v1 setPendingItemsCount:0];
  }
}

- (void)dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLPhotoLibrary *)self pathManager];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 iTunesSyncedAssetsDirectory];
  uint64_t v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

  id v7 = PLMigrationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v16 = "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]";
    __int16 v17 = 2048;
    uint64_t v18 = [v6 count];
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %lu synced", buf, 0x16u);
  }

  if (![v6 count])
  {
    id v8 = [(PLPhotoLibrary *)self managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__PLPhotoLibrary_dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced__block_invoke;
    void v11[3] = &unk_1E5873A50;
    id v12 = v6;
    int v13 = self;
    id v14 = v8;
    id v9 = v8;
    [(PLPhotoLibrary *)self performBlockAndWait:v11];
  }
  id v10 = PLMigrationGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s finished", buf, 0xCu);
  }
}

void __83__PLPhotoLibrary_dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) count])
  {
    id v2 = (void *)MEMORY[0x19F38D3B0]();
    id v3 = objc_msgSend(*(id *)(a1 + 40), "_fetchCompleteAssetIDsWithValidatedSavedAssetTypeMask:context:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), *(void *)(a1 + 48));
    uint64_t v4 = +[PLGenericAlbum allSyncedAlbumsInManagedObjectContext:*(void *)(a1 + 48)];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v8++) delete];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    [*(id *)(a1 + 40) _safeSave:*(void *)(a1 + 48)];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] Data migration housekeeping after the backedup files have been restored. Deleting all synced assets and their albums from the database. The assets themselves are not backed up.", "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]_block_invoke");
    id v10 = +[PLAssetTransactionReason transactionReason:v9];

    [*(id *)(a1 + 40) batchDeleteAssets:v3 withReason:v10];
  }
}

- (id)_fetchCompleteAssetIDsWithValidatedSavedAssetTypeMask:(unsigned int)a3 context:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  uint64_t v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v5 fetchRequestWithEntityName:v7];

  id v9 = (void *)MEMORY[0x1E4F28BA0];
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"complete");
  v23[0] = v10;
  long long v11 = [MEMORY[0x1E4F8BA10] predicateForIncludeMask:v4 useIndex:1];
  v23[1] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  long long v13 = [v9 andPredicateWithSubpredicates:v12];

  [v8 setPredicate:v13];
  [v8 setResultType:1];
  [v8 setIncludesPropertyValues:0];
  id v18 = 0;
  long long v14 = [v6 executeFetchRequest:v8 error:&v18];

  id v15 = v18;
  if (!v14)
  {
    uint64_t v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v20 = v4;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to get complete assets with type mask 0x%x: %@", buf, 0x12u);
    }
  }
  return v14;
}

- (BOOL)batchDeleteObjectsWithEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 1652, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  id v36 = 0;
  long long v11 = [(PLPhotoLibrary *)self _fetchedObjectsForDeleteWithEntity:v9 predicate:v10 batchSize:100 error:&v36];
  id v12 = v36;
  if (v11)
  {
    unint64_t v13 = [v11 count];
    if ((PLIsSuppressingLogsForUnitTesting() & 1) == 0)
    {
      long long v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v9 name];
        *(_DWORD *)buf = 134218242;
        unint64_t v38 = v13;
        __int16 v39 = 2114;
        unint64_t v40 = v15;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleting %ld %{public}@", buf, 0x16u);
      }
    }
    uint64_t v16 = [(PLPhotoLibrary *)self managedObjectContext];
    if (v13)
    {
      id v32 = v9;
      __int16 v33 = self;
      id v29 = v12;
      id v30 = a5;
      id v31 = v10;
      __int16 v17 = 0;
      uint64_t v18 = 0;
      do
      {
        context = (void *)MEMORY[0x19F38D3B0]();
        unint64_t v19 = 0;
        do
        {
          int v20 = [v11 objectAtIndex:v18 + v19];
          [v16 deleteObject:v20];

          unint64_t v21 = v19 + 1;
          unint64_t v22 = v18 + v19 + 1;
          if (v19 > 0x62) {
            break;
          }
          ++v19;
        }
        while (v22 < v13);
        id v35 = v17;
        BOOL v23 = [(PLPhotoLibrary *)v33 safeSave:v16 error:&v35];
        id v24 = v35;

        if (!v23) {
          break;
        }
        v18 += v21;
        __int16 v17 = v24;
      }
      while (v22 < v13);
      if (v30) {
        char v25 = v23;
      }
      else {
        char v25 = 1;
      }
      id v9 = v32;
      if ((v25 & 1) == 0)
      {
        id v24 = v24;
        LOBYTE(v23) = 0;
        id *v30 = v24;
      }
      id v10 = v31;
      id v12 = v29;
    }
    else
    {
      id v24 = 0;
      LOBYTE(v23) = 1;
    }
  }
  else
  {
    int v26 = PLBackendGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v38 = (unint64_t)v12;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch objects to be deleted: %{public}@", buf, 0xCu);
    }

    LOBYTE(v23) = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v23;
}

- (BOOL)batchDeleteAssetsWithPredicate:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 1613, @"Invalid parameter not satisfying: %@", @"assetsPredicate" object file lineNumber description];
  }
  id v34 = [(PLPhotoLibrary *)self managedObjectContext];
  long long v11 = +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:");
  id v37 = 0;
  id v12 = [(PLPhotoLibrary *)self _fetchedObjectsForDeleteWithEntity:v11 predicate:v9 batchSize:100 error:&v37];
  id v13 = v37;
  if (v12)
  {
    unint64_t v14 = [v12 count];
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v10 reason];
      *(_DWORD *)buf = 134218242;
      unint64_t v39 = v14;
      __int16 v40 = 2114;
      uint64_t v41 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Batch deleting %ld assets: %{public}@", buf, 0x16u);
    }
    if (v14)
    {
      id v32 = v9;
      __int16 v33 = self;
      id v29 = v13;
      id v30 = v11;
      id v31 = a5;
      __int16 v17 = 0;
      uint64_t v18 = 0;
      do
      {
        context = (void *)MEMORY[0x19F38D3B0]();
        unint64_t v19 = 0;
        do
        {
          int v20 = [v12 objectAtIndex:v18 + v19];
          [v20 deleteWithReason:v10];

          unint64_t v21 = v19 + 1;
          unint64_t v22 = v18 + v19 + 1;
          if (v19 > 0x62) {
            break;
          }
          ++v19;
        }
        while (v22 < v14);
        id v36 = v17;
        BOOL v23 = [(PLPhotoLibrary *)v33 safeSave:v34 error:&v36];
        id v24 = v36;

        if (!v23) {
          break;
        }
        v18 += v21;
        __int16 v17 = v24;
      }
      while (v22 < v14);
      id v9 = v32;
      if (v31) {
        char v25 = v23;
      }
      else {
        char v25 = 1;
      }
      if ((v25 & 1) == 0)
      {
        id v24 = v24;
        LOBYTE(v23) = 0;
        id *v31 = v24;
      }
      id v13 = v29;
      long long v11 = v30;
    }
    else
    {
      id v24 = 0;
      LOBYTE(v23) = 1;
    }
  }
  else
  {
    int v26 = PLBackendGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v39 = (unint64_t)v13;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "could not batch fault in to-be-deleted assets: %@", buf, 0xCu);
    }

    LOBYTE(v23) = 0;
    if (a5) {
      *a5 = v13;
    }
  }

  return v23;
}

- (id)_fetchedObjectsForDeleteWithEntity:(id)a3 predicate:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoLibrary *)self managedObjectContext];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v13 setEntity:v11];
  [v13 setReturnsObjectsAsFaults:0];
  [v13 setFetchBatchSize:a5];
  unint64_t v14 = [v11 relationshipsByName];

  id v15 = [v14 allKeys];
  [v13 setRelationshipKeyPathsForPrefetching:v15];

  [v13 setPredicate:v10];
  uint64_t v16 = [v12 executeFetchRequest:v13 error:a6];

  return v16;
}

- (void)batchDeleteAssets:(id)a3 withReason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v8];
    [(PLPhotoLibrary *)self batchDeleteAssetsWithPredicate:v7 reason:v6 error:0];
  }
}

- (BOOL)safeSave:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v11 = 0;
  char v6 = [v5 save:&v11];
  id v7 = v11;
  if (v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Save failed. We might lose data. Rolling back any changes. (%{public}@)", buf, 0xCu);
    }

    [v5 rollback];
    if (a4)
    {
      id v7 = v7;
      BOOL v8 = 0;
      *a4 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)_safeSave:(id)a3
{
}

- (void)cleanupAfterImportAllDCIMAssets
{
  if (![(PLPhotoLibrary *)self isCloudPhotoLibraryEnabled])
  {
    id v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Removing obsolete metadata files", v5, 2u);
    }

    uint64_t v4 = [(PLPhotoLibrary *)self managedObjectContext];
    +[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:v4 error:0];

    [(PLPhotoLibrary *)self _deleteObsoleteMetadataFiles];
  }
}

- (void)_deleteObsoleteMetadataFiles
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F8B908] fileManager];
  uint64_t v4 = [(PLPhotoLibrary *)self thumbnailManager];
  [v4 removeObsoleteMetadata];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __46__PLPhotoLibrary__deleteObsoleteMetadataFiles__block_invoke;
  v38[3] = &unk_1E5862AA0;
  id v10 = v5;
  id v39 = v10;
  id v11 = v3;
  id v40 = v11;
  uint64_t v41 = self;
  char v25 = (void *)v8;
  id v12 = (id)[v9 enumerateObjectsFromFetchRequest:v8 count:0 usingDefaultBatchSizeWithBlock:v38];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v28 = v10;
  id obj = [v10 allKeys];
  uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  int v13 = 0;
  if (v29)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = [v28 objectForKey:v15];
        __int16 v17 = [v11 contentsOfDirectoryAtPath:v15 error:0];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              if (([v16 containsObject:v22] & 1) == 0)
              {
                BOOL v23 = [v15 stringByAppendingPathComponent:v22];
                ++v13;
                [v11 removeItemAtPath:v23 error:0];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
          }
          while (v19);
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v29);
  }

  id v24 = PLMigrationGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v43 = v13;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Removed %d obsolete metadata files", buf, 8u);
  }
}

void __46__PLPhotoLibrary__deleteObsoleteMetadataFiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 pathForMetadataDirectory];
  if (v4)
  {
    id v5 = [v3 filename];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) objectForKey:v4];
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [*(id *)(a1 + 32) setObject:v6 forKey:v4];
      }
      if ([v3 isVideo])
      {
        id v7 = [v3 pathForVideoPreviewFile];
        if ([*(id *)(a1 + 40) fileExistsAtPath:v7])
        {
          uint64_t v8 = [v7 lastPathComponent];
          [v6 addObject:v8];
        }
        id v9 = [v3 fileURLForThumbnailFile];
        id v10 = [v9 path];

        if ([*(id *)(a1 + 40) fileExistsAtPath:v10])
        {
          id v11 = [v10 lastPathComponent];
          [v6 addObject:v11];
        }
      }
      id v12 = [v3 pathForNonAdjustedFullsizeImageFile];
      uint64_t v27 = a1;
      if ([*(id *)(a1 + 40) fileExistsAtPath:v12])
      {
        int v13 = [v12 lastPathComponent];
        [v6 addObject:v13];
      }
      uint64_t v14 = objc_msgSend(v3, "modernResources", v12);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v20 = [v19 dataStoreKey];
            if (![v19 version])
            {
              if ([v19 isDerivative]) {
                BOOL v21 = v20 == 0;
              }
              else {
                BOOL v21 = 1;
              }
              if (!v21)
              {
                uint64_t v22 = [v3 assetID];
                BOOL v23 = [v20 fileURLForAssetID:v22];

                id v24 = [v23 lastPathComponent];
                [v6 addObject:v24];
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v16);
      }
      char v25 = [*(id *)(v27 + 48) managedObjectContext];
      objc_msgSend(v25, "refreshObject:mergeChanges:", v3, objc_msgSend(v3, "hasChanges"));
    }
  }
}

- (BOOL)deleteAllDiagnosticFiles:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLManagedAsset entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  [v7 setFetchBatchSize:100];
  uint64_t v8 = [(PLPhotoLibrary *)self managedObjectContext];
  id v30 = 0;
  id v9 = [v8 executeFetchRequest:v7 error:&v30];
  id v10 = v30;

  if (!v9)
  {
    BOOL v20 = 0;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v22 = v7;
    BOOL v23 = a3;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "pathForDiagnosticFile", v22, v23);
        char v25 = 0;
        if (v17 && [v11 fileExistsAtPath:v17 isDirectory:&v25])
        {
          if (v25)
          {
            id v19 = v10;
LABEL_18:

            BOOL v20 = 0;
            id v10 = v19;
            goto LABEL_19;
          }
          id v24 = v10;
          char v18 = [v11 removeItemAtPath:v17 error:&v24];
          id v19 = v24;

          id v10 = v19;
          if ((v18 & 1) == 0) {
            goto LABEL_18;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    BOOL v20 = 1;
LABEL_19:
    id v7 = v22;
    a3 = v23;
  }
  else
  {
    BOOL v20 = 1;
  }

  if (a3) {
LABEL_21:
  }
    *a3 = v10;
LABEL_22:

  return v20;
}

- (id)albumFromGroupURL:(id)a3
{
  return +[PLGenericAlbum albumFromGroupURL:a3 photoLibrary:self];
}

- (id)photoFromAssetURL:(id)a3
{
  return +[PLManagedAsset photoFromAssetURL:a3 photoLibrary:self];
}

- (id)assetURLForPhoto:(id)a3
{
  return (id)[a3 assetURL];
}

- (id)assetURLForPhoto:(id)a3 extension:(id)a4
{
  return (id)[a3 assetURLWithExtension:a4];
}

- (void)createPhotoStreamAlbumWithStreamID:(id)a3
{
  id v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:1383 description:@"Only Assetsd should be creating the photostream album!"];
  }
  [(PLPhotoLibrary *)self _inq_createPhotoStreamAlbumStreamID:v6];
}

- (void)_inq_createPhotoStreamAlbumStreamID:(id)a3
{
  id v4 = a3;
  if (PLIsAssetsd())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__PLPhotoLibrary__inq_createPhotoStreamAlbumStreamID___block_invoke;
    v5[3] = &unk_1E5875E18;
    id v6 = v4;
    id v7 = self;
    [(PLPhotoLibrary *)self performTransactionAndWait:v5];
  }
}

void __54__PLPhotoLibrary__inq_createPhotoStreamAlbumStreamID___block_invoke(uint64_t a1)
{
  id v2 = +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:*(void *)(a1 + 32) inPhotoLibrary:*(void *)(a1 + 40) createIfNeeded:0];
  if (!v2)
  {
    id v3 = +[PLGenericAlbum insertNewAlbumWithKind:1500 title:*(void *)(a1 + 32) intoLibrary:*(void *)(a1 + 40)];
    id v2 = 0;
  }
}

- (void)userExpungeAssets:(id)a3 localOnlyDelete:(BOOL)a4 expungeReasonFromClient:(id)a5
{
  [(PLPhotoLibrary *)self _userApplyTrashedState:2 toAssets:a3 localOnlyDelete:a4 trashedReason:0 expungeReasonFromClient:a5];
  id v6 = [(PLPhotoLibrary *)self libraryBundle];
  [v6 touch];
}

- (void)userUntrashAssets:(id)a3
{
}

- (void)userTrashAssets:(id)a3 withTrashedReason:(unsigned __int16)a4
{
}

- (void)_userApplyTrashedState:(signed __int16)a3 toAssets:(id)a4 localOnlyDelete:(BOOL)a5 trashedReason:(unsigned __int16)a6 expungeReasonFromClient:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  unsigned int v10 = a3;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v66 = a7;
  id v87 = 0;
  id v88 = 0;
  uint64_t v64 = v12;
  [(PLPhotoLibrary *)self _filterAssets:v12 toTrashableAssets:&v88 deletableAssets:&v87 otherAssets:0];
  id v13 = v88;
  id v14 = v87;
  unsigned int v67 = v10;
  if ((unsigned __int16)(v10 - 1) <= 1u)
  {
    uint64_t v15 = +[PLAssetTransactionReason transactionReason:@"[_userApplyTrashedState]Directly deleting assets whose state is either trashed or expunged, and types that never make it to the trash bin."];
    [(PLPhotoLibrary *)self _userDeleteAssets:v14 withReason:v15 localOnlyDelete:v9];
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v83 objects:v92 count:16];
  BOOL v63 = v14;
  if (!v17)
  {
    id v19 = 0;
    BOOL v20 = 0;
    goto LABEL_21;
  }
  uint64_t v18 = v17;
  id v19 = 0;
  BOOL v20 = 0;
  uint64_t v21 = *(void *)v84;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v84 != v21) {
        objc_enumerationMutation(v16);
      }
      BOOL v23 = *(void **)(*((void *)&v83 + 1) + 8 * i);
      if ([v23 isAvalancheStackPhoto])
      {
        if (v20)
        {
          id v24 = v20;
        }
        else
        {
          id v24 = [MEMORY[0x1E4F1CA80] set];
          BOOL v20 = v24;
        }
      }
      else
      {
        if (![v23 isAvalanchePhoto]) {
          continue;
        }
        if (v19)
        {
          id v24 = v19;
        }
        else
        {
          id v24 = [MEMORY[0x1E4F1CA80] set];
          id v19 = v24;
        }
      }
      [v24 addObject:v23];
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v83 objects:v92 count:16];
  }
  while (v18);
LABEL_21:
  id v69 = v19;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v16;
  uint64_t v25 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
  long long v26 = v66;
  uint64_t v27 = v67;
  if (!v25) {
    goto LABEL_38;
  }
  uint64_t v28 = v25;
  uint64_t v29 = *(void *)v80;
  os_log_type_t v65 = v20;
  while (2)
  {
    uint64_t v30 = 0;
    while (2)
    {
      if (*(void *)v80 != v29) {
        objc_enumerationMutation(obj);
      }
      long long v31 = *(void **)(*((void *)&v79 + 1) + 8 * v30);
      [v31 setLocalOnlyDelete:v9];
      if (![v31 isPartOfBurst] || !objc_msgSend(v69, "containsObject:", v31))
      {
        if ([v31 isPartOfBurst] && objc_msgSend(v20, "containsObject:", v31))
        {
          uint64_t v42 = [PLAvalanche alloc];
          int v43 = [v31 avalancheUUID];
          uint64_t v44 = [v31 photoLibrary];
          uint64_t v45 = [(PLAvalanche *)v42 initWithUUID:v43 photoLibrary:v44];

          uint64_t v27 = v67;
          [(PLAvalanche *)v45 applyTrashedState:v67 withTrashedReason:v8];

          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if (([v31 avalanchePickType] & 8) == 0)
      {
LABEL_35:
        [v31 applyTrashedState:v27 withTrashedReason:v8 expungeReasonFromClient:v26];
        goto LABEL_36;
      }
      BOOL v32 = v9;
      uint64_t v33 = v8;
      long long v34 = [PLAvalanche alloc];
      long long v35 = [v31 avalancheUUID];
      [v31 photoLibrary];
      v37 = uint64_t v36 = v27;
      unint64_t v38 = [(PLAvalanche *)v34 initWithUUID:v35 photoLibrary:v37];

      id v39 = [(PLAvalanche *)v38 stackAsset];
      id v40 = v39;
      if (v39) {
        uint64_t v36 = [v39 trashedState];
      }
      uint64_t v41 = v36;
      uint64_t v8 = v33;
      [v31 applyTrashedState:v41 withTrashedReason:v33 expungeReasonFromClient:v66];

      long long v26 = v66;
      uint64_t v27 = v67;
      BOOL v9 = v32;
      BOOL v20 = v65;
LABEL_36:
      if (v28 != ++v30) {
        continue;
      }
      break;
    }
    uint64_t v28 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_38:

  if (v27 == 1)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA80] set];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v47 = v69;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v75 objects:v90 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = 0;
      uint64_t v51 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v76 != v51) {
            objc_enumerationMutation(v47);
          }
          id v53 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          +[PLAvalanche removeFavoriteStatus:v53];
          if ([v53 isPartOfBurst])
          {
            id v54 = [v53 avalancheUUID];
            [v46 addObject:v54];

            if (!v50)
            {
              uint64_t v50 = [v53 photoLibrary];
            }
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v75 objects:v90 count:16];
      }
      while (v49);
    }
    else
    {
      uint64_t v50 = 0;
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v68 = v46;
    uint64_t v55 = [v68 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v72 != v57) {
            objc_enumerationMutation(v68);
          }
          id v59 = [[PLAvalanche alloc] initWithUUID:*(void *)(*((void *)&v71 + 1) + 8 * k) photoLibrary:v50];
          BOOL v60 = [(PLAvalanche *)v59 assets];
          char v61 = [v60 array];
          id v62 = +[PLAvalanche revalidateAvalancheAssets:v61 inLibrary:v50 deleteNonPicks:0 allowDissolve:1];
        }
        uint64_t v56 = [v68 countByEnumeratingWithState:&v71 objects:v89 count:16];
      }
      while (v56);
    }

    long long v26 = v66;
  }
}

- (void)_filterAssets:(id)a3 toTrashableAssets:(id *)a4 deletableAssets:(id *)a5 otherAssets:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a4)
  {
    unsigned int v10 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a5)
    {
LABEL_3:
      id v11 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v10 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  id v11 = 0;
LABEL_6:
  BOOL v20 = a6;
  if (a6) {
    a6 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        char v18 = [v17 canMoveToTrash];
        id v19 = v10;
        if ((v18 & 1) == 0)
        {
          if ([v17 canPerformEditOperation:4]) {
            id v19 = v11;
          }
          else {
            id v19 = a6;
          }
        }
        [v19 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v11;
  }
  if (v20) {
    id *v20 = a6;
  }
}

- (void)_userDeleteAssets:(id)a3 withReason:(id)a4 localOnlyDelete:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  unsigned int v41 = v5;
  id v40 = v7;
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ([v14 isCloudSharedAsset])
        {
          if (!v11)
          {
            id v11 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          uint64_t v15 = [v14 cloudShareAlbum];
          uint64_t v16 = [v15 cloudGUID];
          uint64_t v17 = (void *)v16;
          if (v15) {
            BOOL v18 = v16 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            id v19 = [v11 objectForKey:v16];
            BOOL v20 = [v19 objectForKey:@"albumAssets"];

            if (!v20)
            {
              BOOL v20 = [MEMORY[0x1E4F1CA48] array];
              long long v21 = [MEMORY[0x1E4F1CA60] dictionary];
              [v21 setObject:v15 forKey:@"album"];
              [v21 setObject:v20 forKey:@"albumAssets"];
              [v11 setObject:v21 forKey:v17];
            }
            [v20 addObject:v14];

            uint64_t v5 = v41;
            id v7 = v40;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  long long v22 = [(PLPhotoLibrary *)self libraryBundle];
  int v23 = [v22 isSystemPhotoLibrary];

  if (v23 && v11)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v24 = v11;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [v24 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * j)];
          uint64_t v30 = v29;
          if (v29)
          {
            long long v31 = [v29 objectForKey:@"albumAssets"];
            BOOL v32 = [v30 objectForKey:@"album"];
            +[PLPhotoSharingHelper deleteCloudSharedAssetsFromServer:v31 inSharedAlbum:v32];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v26);
    }

    uint64_t v5 = v41;
    id v7 = v40;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v33 = v7;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v33);
        }
        unint64_t v38 = *(void **)(*((void *)&v42 + 1) + 8 * k);
        [v38 setLocalOnlyDelete:v5];
        [v38 deleteWithReason:v8];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v35);
  }
}

- (id)assetWithUUID:(id)a3 inContainer:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v13 = 0;
    goto LABEL_22;
  }
  id v8 = [(PLPhotoLibrary *)self managedObjectContext];
  uint64_t v9 = +[PLManagedAsset assetWithUUID:v6 inManagedObjectContext:v8];

  if (!v9)
  {
LABEL_18:
    id v13 = 0;
    goto LABEL_21;
  }
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v7;
      id v11 = [v9 albums];
      int v12 = [v11 containsObject:v10];

      if (!v12)
      {
        id v13 = 0;
        goto LABEL_20;
      }
LABEL_6:
      id v13 = v9;
LABEL_20:

      goto LABEL_21;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_msgSend(v7, "assets", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v10);
        }
        if (*(void **)(*((void *)&v19 + 1) + 8 * v17) == v9) {
          goto LABEL_6;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v15) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    goto LABEL_18;
  }
  id v13 = v9;
LABEL_21:

LABEL_22:
  return v13;
}

- (id)assetWithUUID:(id)a3
{
  return [(PLPhotoLibrary *)self assetWithUUID:a3 inContainer:0];
}

- (id)objectWithObjectID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PLPhotoLibrary *)self managedObjectContext];
    id v6 = [v5 objectWithID:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unint64_t)countOfLocalAlbumsContainingAssets:(id)a3 assetsInSomeAlbumCount:(int64_t *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "albums", (void)v17);
        uint64_t v14 = [v13 objectsPassingTest:&__block_literal_global_513];
        if ([v14 count])
        {
          [v6 unionSet:v14];
          ++v10;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    int64_t v10 = 0;
  }

  unint64_t v15 = [v6 count];
  if (a4) {
    *a4 = v10;
  }

  return v15;
}

BOOL __76__PLPhotoLibrary_countOfLocalAlbumsContainingAssets_assetsInSomeAlbumCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 kindValue] == 2;
}

- (id)eventAlbumContainingPhoto:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "predicateWithFormat:", @"(kind == %d) ||(kind == %d) ||(kind == %d)", 12, 1000, 1500);
  id v6 = [v4 albums];

  id v7 = [v6 filteredSetUsingPredicate:v5];
  uint64_t v8 = [v7 anyObject];

  return v8;
}

- (NSArray)photoStreamAlbumsForPreferences
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(PLPhotoLibrary *)self photoStreamAlbums];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isOwnPhotoStreamAlbum", (void)v11)) {
          [v3 insertObject:v9 atIndex:0];
        }
        else {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)photoStreamAlbums
{
  id v2 = [(PLPhotoLibrary *)self managedObjectContext];
  id v3 = +[PLGenericAlbum albumsWithKind:1500 inManagedObjectContext:v2];

  return (NSArray *)v3;
}

- (id)albumListForAlbumOfKind:(int)a3
{
  switch(a3)
  {
    case 4003:
      id v3 = +[PLManagedAlbumList importListInPhotoLibrary:self];
      break;
    case 4002:
      id v3 = +[PLManagedAlbumList eventListInPhotoLibrary:self];
      break;
    case 4001:
      id v3 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:self];
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

- (void)userExpungeAlbums:(id)a3
{
}

- (void)userUntrashAlbums:(id)a3
{
}

- (void)userTrashAlbums:(id)a3
{
}

- (void)_userApplyTrashedState:(signed __int16)a3 toAlbums:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  id v18 = 0;
  [(PLPhotoLibrary *)self _filterAlbums:a4 toTrashableAlbums:&v18 deletableAlbums:&v17 otherAlbums:0];
  id v6 = v18;
  id v7 = v17;
  if (v4 == 1) {
    [(PLPhotoLibrary *)self _userDeleteAlbums:v7];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "applyTrashedState:cascade:", v4, 1, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_filterAlbums:(id)a3 toTrashableAlbums:(id *)a4 deletableAlbums:(id *)a5 otherAlbums:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v20 = a4;
  if (a4) {
    a4 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (a5) {
    uint64_t v10 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v21 = a5;
  if (a6) {
    uint64_t v11 = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    uint64_t v11 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (char v18 = [v17 canMoveToTrash], v19 = a4, (v18 & 1) == 0))
        {
          if ([v17 canPerformEditOperation:32]) {
            long long v19 = v10;
          }
          else {
            long long v19 = v11;
          }
        }
        [v19 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  if (v20) {
    id *v20 = a4;
  }
  if (v21) {
    id *v21 = v10;
  }
  if (a6) {
    *a6 = v11;
  }
}

- (void)_userDeleteAlbums:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v10 isCloudSharedAlbum]
          && [v10 conformsToProtocol:&unk_1EEC33B20])
        {
          if (!v7)
          {
            id v7 = [MEMORY[0x1E4F1CA48] array];
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v11 = [(PLPhotoLibrary *)self libraryBundle];
  int v12 = [v11 isSystemPhotoLibrary];

  if (v12)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          +[PLPhotoSharingHelper deleteCloudSharedAlbumFromServer:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v15);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v4;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v24 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v23, "delete", (void)v24);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }
}

- (id)albumWithUuid:(id)a3
{
  return +[PLGenericAlbum albumWithUUID:a3 inLibrary:self];
}

- (id)eventWithName:(id)a3 andImportSessionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PLPhotoLibrary *)self managedObjectContext];
  id v9 = +[PLGenericAlbum eventsWithName:v7 andImportSessionIdentifier:v6 inManagedObjectContext:v8];

  uint64_t v10 = [v9 firstObject];

  return v10;
}

- (id)transactionCompletionHandlers
{
  return self->_transactionCompletionHandlers;
}

- (void)clearTransactionCompletionHandlers
{
  transactionCompletionHandlers = self->_transactionCompletionHandlers;
  self->_transactionCompletionHandlers = 0;
}

- (void)addCompletionHandlerToCurrentTransaction:(id)a3
{
  id v5 = a3;
  id v12 = v5;
  if (!self->_pendingTransactions)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:925 description:@"Can only schedule completion handlers when there is an ongoing transaction."];

    id v5 = v12;
  }
  if (!self->_transactionCompletionHandlers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = v6;

    id v5 = v12;
  }
  uint64_t v8 = (void *)[v5 copy];
  id v9 = self->_transactionCompletionHandlers;
  uint64_t v10 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)v9 addObject:v10];
}

- (void)deleteITunesSyncedContentForEnablingiCPL
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__PLPhotoLibrary_deleteITunesSyncedContentForEnablingiCPL__block_invoke;
  v2[3] = &unk_1E5875CE0;
  v2[4] = self;
  [(PLPhotoLibrary *)self performTransactionAndWait:v2];
}

void __58__PLPhotoLibrary_deleteITunesSyncedContentForEnablingiCPL__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  id v6 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 1);
  [v5 setFetchBatchSize:100];
  [v5 setPredicate:v6];
  [v5 setReturnsObjectsAsFaults:0];
  id v32 = 0;
  id v7 = [v2 executeFetchRequest:v5 error:&v32];
  id v8 = v32;
  if (!v7)
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to get all assets for deletion: %@", buf, 0xCu);
    }
  }
  long long v23 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v28 + 1) + 8 * v15) albums];
        [v10 unionSet:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v13);
  }

  id v17 = +[PLAssetTransactionReason transactionReason:@"Deleting iTunes synced content to enable iCloud Photos."];
  [*(id *)(a1 + 32) batchDeleteAssets:v11 withReason:v17];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [v2 deleteObject:*(void *)(*((void *)&v24 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v20);
  }
}

- (id)iTunesSyncedContentInfo
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2773;
  id v9 = __Block_byref_object_dispose__2774;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __41__PLPhotoLibrary_iTunesSyncedContentInfo__block_invoke;
  v4[3] = &unk_1E5875E68;
  v4[4] = self;
  v4[5] = &v5;
  [(PLPhotoLibrary *)self performBlockAndWait:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__PLPhotoLibrary_iTunesSyncedContentInfo__block_invoke(uint64_t a1)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForFinderSyncedAsset"), 1);
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  v38[0] = v1;
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  v38[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v5 = [v2 andPredicateWithSubpredicates:v4];

  id v6 = (void *)MEMORY[0x1E4F28BA0];
  long long v29 = (void *)v1;
  v37[0] = v1;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 1);
  v37[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  id v9 = [v6 andPredicateWithSubpredicates:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  id v11 = +[PLManagedAsset entityName];
  uint64_t v12 = (void *)[v10 initWithEntityName:v11];

  [v12 setPredicate:v5];
  id v13 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v14 = +[PLManagedAsset entityName];
  uint64_t v15 = (void *)[v13 initWithEntityName:v14];

  [v15 setPredicate:v9];
  uint64_t v16 = [*(id *)(a1 + 32) managedObjectContext];
  id v32 = 0;
  uint64_t v17 = [v16 countForFetchRequest:v12 error:&v32];
  id v18 = v32;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error getting count of iTunes synced photos: %@", buf, 0xCu);
    }
  }
  id v31 = v18;
  uint64_t v20 = [v16 countForFetchRequest:v15 error:&v31];
  id v21 = v31;

  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v21;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Error getting count of iTunes synced videos: %@", buf, 0xCu);
    }
  }
  v33[0] = @"PLITunesSyncedContentInfoPhotoCountKey";
  long long v23 = [NSNumber numberWithInteger:v17];
  v34[0] = v23;
  v33[1] = @"PLITunesSyncedContentInfoVideoCountKey";
  long long v24 = [NSNumber numberWithInteger:v20];
  v34[1] = v24;
  v33[2] = @"PLITunesSyncedContentInfoAssetCountKey";
  long long v25 = [NSNumber numberWithInteger:v20 + v17];
  v34[2] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

- (BOOL)_hasIncompleteAsset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"complete == 0"];
  [v5 setPredicate:v6];
  [v5 setFetchLimit:1];
  uint64_t v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v12 = 0;
  uint64_t v8 = [v7 countForFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9 || v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error attempting to count incomplete assets: %@", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8 != 0;
}

- (void)_photoLibraryForceClientExitNotification
{
  if (!PLIsSpringboard() || !PLIsRunningInStoreDemoMode())
  {
    id v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Exiting because another process requested a FORCE CLIENT EXIT.  Everything is behaving as it should and you don't need to file a radar about this.\n\nThis is usually initiated by: plphotosctl rebuilddb.", v4, 2u);
    }

    exit(0);
  }
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Ignoring simulated FORCE CLIENT EXIT for SpringBoard in Store Demo Mode to avoid a possible crash loop.", buf, 2u);
  }
}

- (void)_photoLibraryCorruptNotification
{
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Exiting because another process detected a corrupt database.", v3, 2u);
  }

  exit(0);
}

- (id)constraintsDirector
{
  return [(PLPhotoLibraryBundle *)self->_libraryBundle constraintsDirector];
}

- (id)photoAnalysisClient
{
  id v3 = [(PLPhotoLibrary *)self globalValues];
  char v4 = [v3 libraryCreateOptions];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(PLPhotoLibraryBundle *)self->_libraryBundle photoAnalysisServiceClient];
  }
  return v5;
}

- (void)clientApplicationWillEnterForeground
{
  if (PLIsAssetsd())
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:778 description:@"cannot be called by assetsd"];
  }
  char v4 = [(PLPhotoLibrary *)self libraryBundle];
  id v8 = [v4 indicatorFileCoordinator];

  if (__photoLibraryClient == 1
    && [v8 needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:0])
  {
    uint64_t v5 = [(PLPhotoLibrary *)self assetsdClient];
    id v6 = [v5 libraryClient];
    [v6 recoverFromCrashIfNeeded];
  }
}

- (void)handlePersistentStoreRemoval:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1BF40]];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__2773;
  uint64_t v16 = __Block_byref_object_dispose__2774;
  id v17 = 0;
  v11[1] = (id)MEMORY[0x1E4F143A8];
  v11[2] = (id)3221225472;
  void v11[3] = __47__PLPhotoLibrary_handlePersistentStoreRemoval___block_invoke;
  void v11[4] = &unk_1E5875E68;
  v11[5] = self;
  v11[6] = &v12;
  PLRunWithUnfairLock();
  if ([v6 indexOfObject:v13[5]] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[0] = 0;
    BOOL v7 = [(PLPhotoLibrary *)self unloadDatabase:v11];
    id v8 = v11[0];
    if (v7)
    {
      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [(PLPhotoLibrary *)self name];
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Unloaded database %@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to unload database %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v12, 8);
}

void __47__PLPhotoLibrary_handlePersistentStoreRemoval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (BOOL)unloadDatabase:(id *)a3
{
  return 1;
}

id __33__PLPhotoLibrary_unloadDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 32)];

    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 88);
  }
  *(void *)(v2 + 88) = 0;

  uint64_t v5 = (id *)(*(void *)(a1 + 32) + 96);
  return objc_storeWeak(v5, 0);
}

- (void)_setManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

void __43__PLPhotoLibrary__setManagedObjectContext___block_invoke(uint64_t a1)
{
}

- (PLPhotoLibrary)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"You just got singlestacked" reason:@"Must use an initializer that takes a library path" userInfo:0];
  objc_exception_throw(v2);
}

- (void)_cancelAllDeferredPrewarming
{
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Deferred processing: cancel all prewarming due to enabling opportunistic tasks", v4, 2u);
  }

  id v3 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
  [(PLCaptureDeferredPhotoProcessor *)v3 cancelAllPrewarmingWithCompletionHandler:&__block_literal_global_143];
}

- (void)_resumeChangeHandlingNotifications
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  id v2 = [WeakRetained changeHandlingContainer];
  [v2 unpauseLaunchEventNotifications];
}

- (void)_reallyEnableOpportunisticTasks
{
  id v3 = [(id)objc_opt_class() opportunisticTaskIsolationQueue];
  dispatch_assert_queue_V2(v3);

  [(PLPhotoLibrary *)self _resumeChangeHandlingNotifications];
  [(PLPhotoLibrary *)self _cancelAllDeferredPrewarming];
}

- (void)enableOpportunisticTasks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLPhotoLibrary.m", 462, @"Invalid parameter not satisfying: %@", @"_libraryServicesManager" object file lineNumber description];
  }
  if ((PLIsAssetsd() & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:463 description:@"enableOpportunisticTasks: can only be called from assetsd"];
  }
  uint64_t v5 = [(id)objc_opt_class() opportunisticTaskIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PLPhotoLibrary_enableOpportunisticTasks__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(v5, block);
}

void __42__PLPhotoLibrary_enableOpportunisticTasks__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = sOpportunisticTasksDisabled;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Enable opportunistic tasks invoked (was %d)", (uint8_t *)v5, 8u);
  }

  int v3 = sOpportunisticTasksDisabled;
  if (sOpportunisticTasksDisabled < 1)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Attempted to enable opportunistic tasks when not disabled", (uint8_t *)v5, 2u);
    }
  }
  else
  {
    if (sOpportunisticTasksDisabled == 1)
    {
      [*(id *)(a1 + 32) _reallyEnableOpportunisticTasks];
      int v3 = sOpportunisticTasksDisabled;
    }
    sOpportunisticTasksDisabled = v3 - 1;
  }
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p libraryURL=%@>", v4, self, v5];

  return v6;
}

- (BOOL)_isUnknownAssetColumnError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F1BF50]];

  if (v5)
  {
    int v6 = [v5 intValue];
    BOOL v7 = [v3 userInfo];
    id v8 = [v7 objectForKey:@"NSSQLiteDatabaseErrorMessageKey"];

    char v9 = [v8 containsString:@"no such column: ZASSET"];
    if (v6 == 1) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_markForRebuildAndAbortWithReason:(int64_t)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    id v8 = PLRebuildReasonToShortString(a3);
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Corrupt Database Detected: reason: %{public}@, error: %@", (uint8_t *)&v11, 0x16u);
  }
  char v9 = [(PLPhotoLibrary *)self pathManager];
  [v9 setSqliteErrorForRebuildReason:a3 allowsExit:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  [WeakRetained shutdownLibraryWithDescription:@"CoreData error"];
}

- (void)handlePossibleCoreDataError:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F1BF50]];

  if (v5)
  {
    int v6 = [v5 intValue];
    if (v6 == 769)
    {
      [(id)objc_opt_class() contextExecuteFailedWithSQLiteResultCode:769];
    }
    else if (v6 == 26 || v6 == 11)
    {
      [(PLPhotoLibrary *)self _markForRebuildAndAbortWithReason:8 error:v8];
    }
  }
  if ([(PLPhotoLibrary *)self _isUnknownAssetColumnError:v8]) {
    [(PLPhotoLibrary *)self _markForRebuildAndAbortWithReason:21 error:v8];
  }
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  videoConversionServiceClient = self->_videoConversionServiceClient;
  if (!videoConversionServiceClient)
  {
    uint64_t v4 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F748E0]);
    uint64_t v5 = self->_videoConversionServiceClient;
    self->_videoConversionServiceClient = v4;

    videoConversionServiceClient = self->_videoConversionServiceClient;
  }
  return videoConversionServiceClient;
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  imageConversionServiceClient = self->_imageConversionServiceClient;
  if (!imageConversionServiceClient)
  {
    uint64_t v4 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    uint64_t v5 = self->_imageConversionServiceClient;
    self->_imageConversionServiceClient = v4;

    imageConversionServiceClient = self->_imageConversionServiceClient;
  }
  return imageConversionServiceClient;
}

- (PLThumbnailIndexes)thumbnailIndexes
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:363 description:@"PLThumbnailIndexes only available in assetsd"];
  }
  uint64_t v4 = PLLibraryIDFromPathManager();
  uint64_t v5 = PLDataStoreForClassIDAndLibraryID(1, v4);
  int v6 = [v5 thumbnailIndexes];

  return (PLThumbnailIndexes *)v6;
}

- (id)libraryID
{
  return (id)PLLibraryIDFromPathManager();
}

- (id)shortLivedLibraryCopyByAppendingName:(const char *)a3
{
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PLPhotoLibrary.m" lineNumber:326 description:@"Should only be called within assetsd"];
  }
  int v6 = [(PLPhotoLibrary *)self name];
  BOOL v7 = objc_msgSend(v6, "stringByAppendingFormat:", @" %s", a3);

  id v8 = [(PLPhotoLibrary *)self libraryServicesManager];
  char v9 = [v8 databaseContext];
  id v10 = v7;
  int v11 = objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v10, "UTF8String"));

  uint64_t v12 = [(PLPhotoLibrary *)self managedObjectContext];
  uint64_t v13 = [v12 changeSource];
  id v14 = [v11 managedObjectContext];
  [v14 setChangeSource:v13];

  return v11;
}

+ (unint64_t)CloudPhotoLibrarySize
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v3 = [v2 photoDirectoryWithType:4];

  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  unint64_t v5 = _sizeOfDirectories(v4);

  return v5;
}

+ (BOOL)_assetsLibrary_isSharedPhotoStreamsSupportEnabled
{
  return (_sharedPhotoStreamsSupportEnabled & 1) == 0 && _CFExecutableLinkedOnOrAfter() != 0;
}

+ (void)_assetsLibrary_disableSharedPhotoStreamsSupport
{
  _sharedPhotoStreamsSupportEnabled = 1;
}

+ (id)deferredPhotoPreviewDestinationURLForPrimaryAssetURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pathExtension];
  unint64_t v5 = [v3 path];

  int v6 = [v5 stringByDeletingPathExtension];
  BOOL v7 = [v6 stringByAppendingString:*MEMORY[0x1E4F8C300]];
  id v8 = [v7 stringByAppendingPathExtension:v4];

  char v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];

  return v9;
}

+ (id)requestIdentifierFromDeferredIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

+ (void)refreshCachedCountsAndDates:(BOOL)a3 onAssetsContainerClass:(Class)a4 inContext:(id)a5 withPredicate:(id)a6
{
  BOOL v62 = a3;
  v83[7] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v51 = a6;
  if (!a4)
  {
    long long v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PLPhotoLibrary.m", 3857, @"Invalid parameter not satisfying: %@", @"class != nil" object file lineNumber description];
  }
  BOOL v63 = v9;
  if (!v9)
  {
    long long v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"PLPhotoLibrary.m", 3858, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];
  }
  id v58 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v58 setName:@"objectID"];
  id v10 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v58 setExpression:v10];

  [v58 setExpressionResultType:2000];
  uint64_t v57 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count", 0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v11 setName:@"cachedCount"];
  [v11 setExpression:v57];
  long long v52 = v11;
  [v11 setExpressionResultType:200];
  uint64_t v56 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"SUBQUERY(assets, $x, noindex:($x.kind) == %d && noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count", 0, 0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v12 setName:@"cachedPhotosCount"];
  [v12 setExpression:v56];
  long long v53 = v12;
  [v12 setExpressionResultType:200];
  uint64_t v55 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"SUBQUERY(assets, $x, noindex:($x.kind) == %d && noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count", 1, 0];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v13 setName:@"cachedVideosCount"];
  [v13 setExpression:v55];
  id v54 = v13;
  [v13 setExpressionResultType:200];
  if (v62)
  {
    id v14 = (void *)MEMORY[0x1E4F28C68];
    if ((Class)objc_opt_class() == a4) {
      uint64_t v15 = @"addedDate";
    }
    else {
      uint64_t v15 = @"dateCreated";
    }
    uint64_t v16 = [v14 expressionWithFormat:@"SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).%K.@min", 0, v15];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v17 setName:@"startDate"];
    [v17 setExpression:v16];
    long long v48 = v17;
    [v17 setExpressionResultType:900];
    id v18 = (void *)MEMORY[0x1E4F28C68];
    if ((Class)objc_opt_class() == a4) {
      id v19 = @"addedDate";
    }
    else {
      id v19 = @"dateCreated";
    }
    uint64_t v20 = [v18 expressionWithFormat:@"SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).%K.@max", 0, v19];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v21 setName:@"endDate"];
    [v21 setExpression:v20];
    long long v49 = v21;
    [v21 setExpressionResultType:900];
  }
  else
  {
    long long v48 = 0;
    long long v49 = 0;
  }
  BOOL v60 = [(objc_class *)a4 entityName];
  id v59 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v60];
  [v59 setResultType:2];
  if (v62)
  {
    v83[0] = @"uuid";
    v83[1] = v52;
    v83[2] = v53;
    v83[3] = v54;
    v83[4] = v48;
    v83[5] = v49;
    void v83[6] = v58;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:7];
  }
  else
  {
    v82[0] = @"uuid";
    v82[1] = v52;
    v82[2] = v53;
    v82[3] = v54;
    v82[4] = v58;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:5];
  }
  long long v23 = (void *)v22;
  [v59 setPropertiesToFetch:v22];

  [v59 setPredicate:v51];
  id v72 = 0;
  long long v50 = [v63 executeFetchRequest:v59 error:&v72];
  id v47 = v72;
  if (v50)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v50;
    uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v65)
    {
      uint64_t v64 = *(void *)v69;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v69 != v64)
          {
            uint64_t v25 = v24;
            objc_enumerationMutation(obj);
            uint64_t v24 = v25;
          }
          uint64_t v66 = v24;
          uint64_t v26 = *(void **)(*((void *)&v68 + 1) + 8 * v24);
          unsigned int v67 = [v26 objectForKeyedSubscript:@"objectID"];
          if (v67)
          {
            uint64_t v27 = objc_msgSend(v63, "objectWithID:");
            for (uint64_t i = 0; i != 3; ++i)
            {
              long long v29 = refreshCachedCountsAndDates_onAssetsContainerClass_inContext_withPredicate__cachedCountKeys[i];
              long long v30 = [v26 objectForKey:v29];
              id v31 = [v27 valueForKey:v29];
              if ((PLObjectIsEqual() & 1) == 0)
              {
                id v32 = PLBackendGetLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  long long v33 = [v27 objectID];
                  *(_DWORD *)buf = 138413058;
                  long long v74 = v29;
                  __int16 v75 = 2112;
                  long long v76 = v33;
                  __int16 v77 = 2112;
                  id v78 = v31;
                  __int16 v79 = 2112;
                  long long v80 = v30;
                  _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%@ -> %@)", buf, 0x2Au);
                }
                [v27 setValue:v30 forKey:v29];
              }
            }
            if (v62)
            {
              uint64_t v34 = 0;
              char v35 = 1;
              do
              {
                char v36 = v35;
                uint64_t v37 = refreshCachedCountsAndDates_onAssetsContainerClass_inContext_withPredicate__dateKeys[v34];
                unint64_t v38 = [v26 objectForKey:v37];
                uint64_t v39 = [v27 valueForKey:v37];
                if (!PLDateIsApproximatelyEqual(v39, v38, 2.22044605e-16))
                {
                  id v40 = PLBackendGetLog();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v41 = [v27 objectID];
                    *(_DWORD *)buf = 138413058;
                    long long v74 = v37;
                    __int16 v75 = 2112;
                    long long v76 = v41;
                    __int16 v77 = 2112;
                    id v78 = v39;
                    __int16 v79 = 2112;
                    long long v80 = v38;
                    _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%@ -> %@)", buf, 0x2Au);
                  }
                  [v27 setValue:v38 forKey:v37];
                }

                char v35 = 0;
                uint64_t v34 = 1;
              }
              while ((v36 & 1) != 0);
            }
          }
          else
          {
            uint64_t v27 = PLBackendGetLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              long long v42 = [v26 objectForKeyedSubscript:@"uuid"];
              *(_DWORD *)buf = 138412546;
              long long v74 = v60;
              __int16 v75 = 2112;
              long long v76 = v42;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Recalc counts - unable to determine objectID for %@ with uuid: %@", buf, 0x16u);
            }
          }

          uint64_t v24 = v66 + 1;
        }
        while (v66 + 1 != v65);
        uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v65);
    }
  }
  else
  {
    id obj = PLBackendGetLog();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      long long v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      long long v74 = v43;
      __int16 v75 = 2112;
      long long v76 = v60;
      __int16 v77 = 2112;
      id v78 = v47;
      _os_log_impl(&dword_19B3C7000, obj, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);
    }
  }
}

+ (void)refreshCachedCountsOnAllAssetContainersInContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[PLPhotoLibrary refreshCachedCountsAndDates:1 onAssetsContainerClass:objc_opt_class() inContext:v3 withPredicate:0];
  if ([v3 hasChanges])
  {
    uint64_t v4 = [v3 updatedObjects];
    unint64_t v5 = objc_msgSend(v4, "_pl_map:", &__block_literal_global_839);

    int v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on albums %{public}@", buf, 0xCu);
    }

    id v24 = 0;
    char v7 = [v3 save:&v24];
    id v8 = v24;
    if ((v7 & 1) == 0)
    {
      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to update cached counts on albums %{public}@", buf, 0xCu);
      }
    }
  }
  +[PLPhotoLibrary refreshCachedCountsAndDates:0 onAssetsContainerClass:objc_opt_class() inContext:v3 withPredicate:0];
  if ([v3 hasChanges])
  {
    id v10 = [v3 updatedObjects];
    id v11 = objc_msgSend(v10, "_pl_map:", &__block_literal_global_843);

    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on moments %{public}@", buf, 0xCu);
    }

    id v23 = 0;
    char v13 = [v3 save:&v23];
    id v14 = v23;
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to update cached counts on moments %{public}@", buf, 0xCu);
      }
    }
  }
  +[PLPhotoLibrary refreshCachedCountsAndDates:1 onAssetsContainerClass:objc_opt_class() inContext:v3 withPredicate:0];
  if ([v3 hasChanges])
  {
    uint64_t v16 = [v3 updatedObjects];
    id v17 = objc_msgSend(v16, "_pl_map:", &__block_literal_global_848);

    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on importSession %{public}@", buf, 0xCu);
    }

    id v22 = 0;
    char v19 = [v3 save:&v22];
    id v20 = v22;
    if ((v19 & 1) == 0)
    {
      id v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v20;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to update cached counts on importSession %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_845(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_840(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (BOOL)canSaveVideoToLibrary:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v19 = *MEMORY[0x1E4F16158];
    v20[0] = &unk_1EEBED050;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    unint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
    int v6 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v5 options:v4];
    char v7 = v6;
    if (v6)
    {
      if ([v6 isCompatibleWithSavedPhotosAlbum])
      {
        BOOL v8 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v3;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Video %@ cannot be saved to the photo library: reference to remote", buf, 0xCu);
      }
    }
    id v14 = 0;
    uint64_t v10 = [v7 statusOfValueForKey:@"compatibleWithSavedPhotosAlbum" error:&v14];
    id v11 = v14;
    if (v10 != 2)
    {
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v3;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Video %@ cannot be saved to the photo library: %@", buf, 0x16u);
      }
    }
    BOOL v8 = 0;
    goto LABEL_14;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

+ (id)_resourcesInfoFromMoc:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2773;
  uint64_t v15 = __Block_byref_object_dispose__2774;
  id v16 = 0;
  unint64_t v5 = [[PLLibraryContentsEnumerator alloc] initWithSourceManagedObjectContext:v4 concurrent:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__PLPhotoLibrary__resourcesInfoFromMoc___block_invoke;
  v10[3] = &unk_1E5875100;
  v10[4] = &v11;
  [a1 configureEnumeratorForLibrarySizeInfo:v5 completion:v10];
  id v9 = 0;
  LODWORD(a1) = [(PLLibraryContentsEnumerator *)v5 processObjectsWithError:&v9];
  id v6 = v9;
  if (a1) {
    id v7 = (id)v12[5];
  }
  else {
    id v7 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __40__PLPhotoLibrary__resourcesInfoFromMoc___block_invoke(uint64_t a1, void *a2)
{
}

+ (void)configureEnumeratorForLibrarySizeInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLPhotoLibrary.m", 3145, @"Invalid parameter not satisfying: %@", @"enumerator" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLPhotoLibrary.m", 3146, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = malloc_type_calloc(5uLL, 0x20uLL, 0x1000040E0EAB150uLL);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke;
  v19[3] = &__block_descriptor_40_e24_v16__0__PLManagedAsset_8l;
  v19[4] = v10;
  [v7 addAssetVisitor:v19];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke_2;
  v14[3] = &unk_1E5862BB0;
  id v17 = a1;
  id v18 = v10;
  id v15 = v9;
  SEL v16 = a2;
  id v11 = v9;
  [v7 addEndOfListVisitor:v14];
}

void __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F8BA10];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32)
     + 32
     * (__int16)objc_msgSend(v3, "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", objc_msgSend(v4, "savedAssetType"), 4, 4, 1, 4, 0, 4, 4, 4, 4, 4, 3, 4, 4, 4,
                  4,
                  2,
                  4);
  id v6 = [v4 resourcesSortedByQuality];

  +[PLPhotoLibrary _getResourceData:v6 nonDerivativeSizeOut:v5 derivativesSizeOut:v5 + 8 fileBackedThumbnailsSizeOut:v5 + 16 tableThumbnailsSizeOut:v5 + 24];
}

void __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  uint64_t v3 = 0;
  id v4 = off_1E5862DD0;
  do
  {
    uint64_t v5 = (uint64_t)*v4++;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    id v7 = NSNumber;
    unint64_t v8 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + v3 + 8));
    id v9 = [v7 numberWithUnsignedLongLong:v8];
    [v6 setObject:v9 forKeyedSubscript:@"PLInternalSizeDerivative"];

    uint64_t v10 = NSNumber;
    unint64_t v11 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + v3 + 16));
    id v12 = [v10 numberWithUnsignedLongLong:v11];
    [v6 setObject:v12 forKeyedSubscript:@"PLInternalSizeFileBackedThumbnail"];

    uint64_t v13 = NSNumber;
    unint64_t v14 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + v3 + 24));
    id v15 = [v13 numberWithUnsignedLongLong:v14];
    [v6 setObject:v15 forKeyedSubscript:@"PLInternalSizeTableThumbnail"];

    SEL v16 = NSNumber;
    unint64_t v17 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + v3));
    id v18 = [v16 numberWithUnsignedLongLong:v17];
    [v6 setObject:v18 forKeyedSubscript:@"PLInternalSizeOriginals"];

    [v2 setObject:v6 forKeyedSubscript:v5];
    v3 += 32;
  }
  while (v3 != 160);
  free(*(void **)(a1 + 56));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)savedPhotosReferenceMediaSizeWithSizeDataRef:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"PLReferenceMediaSize"];
  id v4 = [v3 objectForKeyedSubscript:@"PLInternalSizeOriginals"];

  return v4;
}

+ (id)savedPhotosOriginalsSizeWithSizeDataRef:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"PLSavedPhotosSize"];
  id v4 = [v3 objectForKeyedSubscript:@"PLInternalSizeOriginals"];

  return v4;
}

+ (void)_getResourceData:(id)a3 nonDerivativeSizeOut:(unint64_t *)a4 derivativesSizeOut:(unint64_t *)a5 fileBackedThumbnailsSizeOut:(unint64_t *)a6 tableThumbnailsSizeOut:(unint64_t *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((int)[v13 localAvailability] >= 1)
        {
          int v14 = [v13 recipeID];
          if ([v13 isDerivative])
          {
            id v15 = [v13 dataStore];
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = objc_opt_class();

            if (v16 == v17)
            {
              unint64_t v18 = [v13 estimatedDataLength];
              uint64_t v19 = a7;
            }
            else
            {
              unint64_t v18 = [v13 estimatedDataLength];
              if ((v14 & 0xFFFF0000) == 0x40000) {
                uint64_t v19 = a6;
              }
              else {
                uint64_t v19 = a5;
              }
            }
            atomic_fetch_add((atomic_ullong *volatile)v19, v18);
          }
          else
          {
            atomic_fetch_add((atomic_ullong *volatile)a4, [v13 estimatedDataLength]);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

+ (int)priorityForFileExtension:(id)a3
{
  uint64_t v3 = [a3 lowercaseString];
  if (+[PLPhotoLibrary isNonRawImageFileExtension:v3])
  {
    int v4 = 1;
  }
  else if (+[PLPhotoLibrary isRawImageFileExtension:v3])
  {
    int v4 = 2;
  }
  else if (+[PLPhotoLibrary isVideoFileExtension:v3])
  {
    int v4 = 3;
  }
  else if (+[PLPhotoLibrary isAudioFileExtension:v3])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 5;
  }

  return v4;
}

+ (BOOL)isAdjustmentEnvelopeExtension:(id)a3
{
  uint64_t v3 = [a3 lowercaseString];
  int v4 = [(id)*MEMORY[0x1E4F8D2E8] lowercaseString];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (BOOL)isAudioFileExtension:(id)a3
{
  id v4 = a3;
  [a1 _loadFileExtensionInformation];
  char v5 = [v4 lowercaseString];

  LOBYTE(v4) = [(id)_audioFileExtensions containsObject:v5];
  return (char)v4;
}

+ (BOOL)isVideoFileExtension:(id)a3
{
  id v4 = a3;
  [a1 _loadFileExtensionInformation];
  char v5 = [v4 lowercaseString];

  id v6 = [MEMORY[0x1E4F166C8] audiovisualMIMETypes];
  id v7 = [MEMORY[0x1E4F290B0] sharedMappings];
  id v8 = [v7 MIMETypeForExtension:v5];

  if ([v6 containsObject:v8]) {
    char v9 = 1;
  }
  else {
    char v9 = [(id)_extraVideoExtensions containsObject:v5];
  }
  if ([(id)_imageFileExtensions containsObject:v5]) {
    LOBYTE(v10) = 0;
  }
  else {
    int v10 = [(id)_audioFileExtensions containsObject:v5] ^ 1;
  }
  char v11 = v9 & v10;

  return v11;
}

+ (BOOL)isNonRawImageFileExtension:(id)a3
{
  id v4 = a3;
  [a1 _loadFileExtensionInformation];
  char v5 = [v4 lowercaseString];

  if ([(id)_imageFileExtensions containsObject:v5]) {
    int v6 = [(id)_rawImageFileExtensions containsObject:v5] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isRawImageFileExtension:(id)a3
{
  id v4 = a3;
  [a1 _loadFileExtensionInformation];
  char v5 = [v4 lowercaseString];

  LOBYTE(v4) = [(id)_rawImageFileExtensions containsObject:v5];
  return (char)v4;
}

+ (BOOL)isImageFileExtension:(id)a3
{
  id v4 = a3;
  [a1 _loadFileExtensionInformation];
  char v5 = [v4 lowercaseString];

  LOBYTE(v4) = [(id)_imageFileExtensions containsObject:v5];
  return (char)v4;
}

+ (void)_loadFileExtensionInformation
{
  if (_loadFileExtensionInformation_onceToken != -1) {
    dispatch_once(&_loadFileExtensionInformation_onceToken, &__block_literal_global_681);
  }
}

void __47__PLPhotoLibrary__loadFileExtensionInformation__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = (void *)CGImageSourceCopyTypeExtensions();
  uint64_t v2 = [v0 initWithArray:v1];
  uint64_t v3 = (void *)_imageFileExtensions;
  _imageFileExtensions = v2;

  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  char v5 = (void *)CGImageSourceCopyTypeExtensions();
  uint64_t v6 = [v4 initWithArray:v5];
  id v7 = (void *)_rawImageFileExtensions;
  _rawImageFileExtensions = v6;

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"wav", @"mp3", @"aac", 0);
  char v9 = (void *)_audioFileExtensions;
  _audioFileExtensions = v8;

  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"avi", @"flv", @"wmv", 0);
  char v11 = (void *)_extraVideoExtensions;
  _extraVideoExtensions = v10;
}

+ (id)masterURLFromSidecarURLs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [v5 allObjects];

  [v6 addObjectsFromArray:v7];
  [v6 sortUsingFunction:PrimaryURLSort context:a1];
  uint64_t v8 = [v6 objectAtIndex:0];

  return v8;
}

+ (id)photoOutboundSharingTmpDirectoryURL
{
  uint64_t v2 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v3 = [v2 privateDirectoryWithSubType:2 createIfNeeded:1 error:0];
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];

  return v4;
}

+ (BOOL)removeFaceMetadataAtURL:(id)a3 includingPeople:(BOOL)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  uint64_t v40 = 0;
  unsigned int v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C6E8];
  v50[0] = *MEMORY[0x1E4F1C6E8];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __58__PLPhotoLibrary_removeFaceMetadataAtURL_includingPeople___block_invoke;
  void v39[3] = &unk_1E5862B40;
  void v39[4] = &v40;
  uint64_t v8 = [v5 enumeratorAtURL:v27 includingPropertiesForKeys:v7 options:0 errorHandler:v39];

  uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v34 = 0;
        int v14 = [v13 getResourceValue:&v34 forKey:v6 error:0];
        id v15 = v34;
        uint64_t v16 = v15;
        if (v14
          && [v15 length]
          && a4
          && +[PLPersistedPersonMetadata isValidPath:v16])
        {
          [v28 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v28;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        id v29 = 0;
        char v22 = [v5 removeItemAtURL:v21 error:&v29];
        id v23 = v29;
        if ((v22 & 1) == 0)
        {
          long long v24 = PLMigrationGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v45 = v21;
            __int16 v46 = 2112;
            id v47 = v23;
            _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Unable to remove metadata at URL: %@: %@", buf, 0x16u);
          }

          *((unsigned char *)v41 + 24) = 0;
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v48 count:16];
    }
    while (v18);
  }

  BOOL v25 = *((unsigned char *)v41 + 24) != 0;
  _Block_object_dispose(&v40, 8);

  return v25;
}

uint64_t __58__PLPhotoLibrary_removeFaceMetadataAtURL_includingPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLMigrationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = [v5 path];
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v10, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;

  return 1;
}

+ (id)fileReservationForFileAtPath:(id)a3 exclusive:(BOOL)a4
{
  if (a4) {
    int v4 = 36;
  }
  else {
    int v4 = 16;
  }
  uint64_t v5 = open((const char *)[a3 fileSystemRepresentation], v4, 438);
  if ((v5 & 0x80000000) != 0) {
    id v6 = 0;
  }
  else {
    id v6 = [[_PLPhotoLibraryFileReservation alloc] initWithFileDescriptor:v5];
  }
  return v6;
}

+ (void)postGlobalPhotoLibraryAvailableIfNecessary
{
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"+[PLPhotoLibrary postGlobalPhotoLibraryAvailableIfNecessary]"];
  id v2 = v3;
  pl_dispatch_once();
}

uint64_t __60__PLPhotoLibrary_postGlobalPhotoLibraryAvailableIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = +[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState];
  if ((result & 1) == 0)
  {
    uint64_t v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Posting library available notification (after data migrator checkpoint)", v5, 2u);
    }

    +[PLIndicatorFileCoordinator setSystemLibraryAvailableIndicatorState:1];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLGlobalPhotoLibraryAvailableNotification, 0, 0, 0);
    return [*(id *)(a1 + 32) stillAlive];
  }
  return result;
}

+ (void)setCloudAlbumSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = PLMyPhotoStreamGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (v3) {
      uint64_t v5 = @"YES";
    }
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "+setCloudAlbumSharingEnabled %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  +[PLCloudSharingEnablingJob enableCloudSharing:v3 withPathManager:v6];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PreferenceChanged", 0, 0, 1u);
}

+ (void)setPhotoStreamEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = PLMyPhotoStreamGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (v3) {
      uint64_t v5 = @"YES";
    }
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "+setPhotoStreamEnabled %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = PLMyPhotoStreamGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "ignoring request to enable Photo Stream", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "calling assetsd to delete all streams", (uint8_t *)&v9, 2u);
    }

    id v6 = +[PLAssetsSaver sharedAssetsSaver];
    [v6 deletePhotoStreamData];
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PreferenceChanged", 0, 0, 1u);
}

+ (BOOL)areOpportunisticTasksDisabled
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PLPhotoLibrary.m" lineNumber:451 description:@"areOpportunisticTasksDisabled can only be called from assetsd"];
  }
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v4 = [a1 opportunisticTaskIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PLPhotoLibrary_areOpportunisticTasksDisabled__block_invoke;
  block[3] = &unk_1E5875840;
  block[4] = &v8;
  dispatch_sync(v4, block);

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

uint64_t __47__PLPhotoLibrary_areOpportunisticTasksDisabled__block_invoke(uint64_t result)
{
  if (sOpportunisticTasksDisabled >= 1) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __49__PLPhotoLibrary_opportunisticTaskIsolationQueue__block_invoke()
{
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = pl_dispatch_queue_create_with_fallback_qos();
  uint64_t v1 = (void *)sOpportunisticTaskIsolationQueue;
  sOpportunisticTaskIsolationQueue = v0;
}

+ (id)systemMainQueuePhotoLibrary
{
  if (PLIsAssetsd())
  {
    PLSimulateCrash();
    [a1 _internalSystemPhotoLibrary];
  }
  else
  {
    +[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary];
  BOOL v3 = };
  return v3;
}

- (void)withDispatchGroup:(id)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  [v8 _withDispatchGroup:v7 onContext:v9 synchronously:0 shouldSave:0 refreshAfterSave:0 performTransaction:v6 completionHandler:0];
}

- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = objc_opt_class();
  id v13 = [(PLPhotoLibrary *)self managedObjectContext];
  __int16 v12 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v11, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", v10, v13, 0, 1, objc_msgSend(v12, "refreshesAfterSave"), v9, v8);
}

- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v10 = [(PLPhotoLibrary *)self managedObjectContext];
  id v9 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", v7, v10, 0, 1, objc_msgSend(v9, "refreshesAfterSave"), v6, 0);
}

- (void)performBlockAndWait:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  [v8 _withDispatchGroup:0 onContext:v9 synchronously:1 shouldSave:0 refreshAfterSave:0 performTransaction:v7 completionHandler:v6];
}

- (void)performBlockAndWait:(id)a3 forceSave:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  id v8 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v7, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v9, 1, v4, objc_msgSend(v8, "refreshesAfterSave"), v6, 0);
}

- (void)performBlock:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  id v10 = [(PLPhotoLibrary *)self managedObjectContext];
  [v9 _withDispatchGroup:0 onContext:v10 synchronously:0 shouldSave:0 refreshAfterSave:0 performTransaction:v8 completionHandler:v7];
}

- (void)performBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [(PLPhotoLibrary *)self managedObjectContext];
  [v8 _withDispatchGroup:0 onContext:v9 synchronously:0 shouldSave:0 refreshAfterSave:0 performTransaction:v7 completionHandler:v6];
}

- (void)performBlock:(id)a3 withPriority:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [(PLPhotoLibrary *)self managedObjectContext];
  [v6 _withDispatchGroup:0 onContext:v7 synchronously:0 shouldSave:0 refreshAfterSave:0 performTransaction:v5 completionHandler:0];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v6 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 0, 0, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);
}

- (void)performTransactionAndWait:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v10 = [(PLPhotoLibrary *)self managedObjectContext];
  id v9 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v10, 1, 1, objc_msgSend(v9, "refreshesAfterSave"), v7, v6);
}

- (void)performTransaction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v10 = [(PLPhotoLibrary *)self managedObjectContext];
  id v9 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v10, 0, 1, objc_msgSend(v9, "refreshesAfterSave"), v7, v6);
}

- (void)performTransaction:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  id v11 = [(PLPhotoLibrary *)self managedObjectContext];
  id v10 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v9, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v11, 0, 1, objc_msgSend(v10, "refreshesAfterSave"), v8, v7);
}

- (void)performTransactionAndWait:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v6 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 1, 1, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);
}

- (void)performTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v7 = [(PLPhotoLibrary *)self managedObjectContext];
  id v6 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 0, 1, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);
}

- (void)performTransaction:(id)a3 withPriority:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v8 = [(PLPhotoLibrary *)self managedObjectContext];
  id v7 = [(PLPhotoLibrary *)self options];
  objc_msgSend(v6, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v8, 0, 1, objc_msgSend(v7, "refreshesAfterSave"), v5, 0);
}

+ (id)queueStatusDescription
{
  id v2 = (void *)MEMORY[0x1E4F28E78];
  BOOL v3 = [a1 _debugStatisticsDescription];
  id v4 = [v2 stringWithFormat:@"[megamoc] %@", v3];

  return v4;
}

+ (void)_context:(id)a3 saveFailedWithError:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"Failed to save context %@: %@", v6, v7];
  id v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v18 = v6;
    __int16 v19 = 1024;
    int v20 = [v7 code];
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to save context %{public}@ [%d] %@", buf, 0x1Cu);
  }

  id v10 = [v7 domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F8C500]];

  if (!v11)
  {
    id v13 = [v7 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F1BF50]];

    if (v14)
    {
      objc_msgSend(a1, "contextExecuteFailedWithSQLiteResultCode:", objc_msgSend(v7, "code"));
      goto LABEL_16;
    }
    id v15 = [v7 domain];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v16)
    {
      [a1 _contextSaveFailedWithCocoaError:v7 message:v8];
      goto LABEL_16;
    }
LABEL_15:
    [a1 _contextSaveFailedWithError:v8];
    goto LABEL_16;
  }
  uint64_t v12 = [v7 code];
  if ((unint64_t)(v12 - 41019) > 6)
  {
LABEL_13:
    if (v12 == 46005)
    {
      [a1 _contextSaveFailedWithNoPersistentStores:v7];
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (((1 << (v12 - 59)) & 0x66) == 0)
  {
    if (v12 == 41019)
    {
      [a1 _contextSaveFailedDueToChangingSPL:v7];
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  [a1 _contextSaveFailedDueToClientRequestedShutdown:v7];
LABEL_16:
}

+ (void)_contextSaveFailedDueToClientRequestedShutdown:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context (Client requested shutdown): %@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)_contextSaveFailedDueToChangingSPL:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context (SPL change): %@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)_contextSaveFailedWithNoPersistentStores:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context: %@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)_contextSaveFailedWithError:(id)a3
{
}

+ (void)_contextSaveFailedWithTimeoutError:(id)a3
{
}

+ (void)_contextSaveFailedWithCocoaError:(id)a3 message:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v11 code];
  if (v7 > 1639)
  {
    if (v7 > 1689)
    {
      if (v7 <= 134029)
      {
        if (v7 == 1690)
        {
          [a1 _contextSaveFailedWithNSValidationInvalidURIError:v6];
          goto LABEL_49;
        }
        if (v7 == 132001)
        {
          [a1 _contextSaveFailedWithNSManagedObjectContextRecursiveSaveError:v6];
          goto LABEL_49;
        }
      }
      else
      {
        switch(v7)
        {
          case 134030:
            [a1 _contextSaveFailedWithNSPersistentStoreSaveError:v6];
            goto LABEL_49;
          case 134090:
            [a1 _contextSaveFailedWithNSPersistentStoreTimeoutError:v6];
            goto LABEL_49;
          case 134180:
            id v8 = [v11 userInfo];
            id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BF50]];
            uint64_t v10 = [v9 intValue];

            [a1 contextExecuteFailedWithSQLiteResultCode:v10];
            goto LABEL_49;
        }
      }
    }
    else if (v7 <= 1659)
    {
      if (v7 == 1640)
      {
        [a1 _contextSaveFailedWithNSValidationDateTooSoonError:v6];
        goto LABEL_49;
      }
      if (v7 == 1650)
      {
        [a1 _contextSaveFailedWithNSValidationInvalidDateError:v6];
        goto LABEL_49;
      }
    }
    else
    {
      switch(v7)
      {
        case 1660:
          [a1 _contextSaveFailedWithNSValidationStringTooLongError:v6];
          goto LABEL_49;
        case 1670:
          [a1 _contextSaveFailedWithNSValidationStringTooShortError:v6];
          goto LABEL_49;
        case 1680:
          [a1 _contextSaveFailedWithNSValidationStringPatternMatchingError:v6];
          goto LABEL_49;
      }
    }
  }
  else if (v7 > 1589)
  {
    if (v7 <= 1609)
    {
      if (v7 == 1590)
      {
        [a1 _contextSaveFailedWithNSValidationRelationshipExceedsMaximumCountError:v6];
        goto LABEL_49;
      }
      if (v7 == 1600)
      {
        [a1 _contextSaveFailedWithNSValidationRelationshipDeniedDeleteError:v6];
        goto LABEL_49;
      }
    }
    else
    {
      switch(v7)
      {
        case 1610:
          [a1 _contextSaveFailedWithNSValidationNumberTooLargeError:v6];
          goto LABEL_49;
        case 1620:
          [a1 _contextSaveFailedWithNSValidationNumberTooSmallError:v6];
          goto LABEL_49;
        case 1630:
          [a1 _contextSaveFailedWithNSValidationDateTooLateError:v6];
          goto LABEL_49;
      }
    }
  }
  else if (v7 <= 1559)
  {
    if (v7 == 1550)
    {
      [a1 _contextSaveFailedWithNSManagedObjectValidationError:v6];
      goto LABEL_49;
    }
    if (v7 == 1551)
    {
      [a1 _contextSaveFailedWithNSManagedObjectConstraintValidationError:v6];
      goto LABEL_49;
    }
  }
  else
  {
    switch(v7)
    {
      case 1560:
        [a1 _contextSaveFailedWithNSValidationMultipleErrorsError:v6];
        goto LABEL_49;
      case 1570:
        [a1 _contextSaveFailedWithNSValidationMissingMandatoryPropertyError:v6];
        goto LABEL_49;
      case 1580:
        [a1 _contextSaveFailedWithNSValidationRelationshipLacksMinimumCountError:v6];
        goto LABEL_49;
    }
  }
  [a1 _contextSaveFailedWithOtherCocoaError:v6];
LABEL_49:
}

+ (void)_contextSaveFailedWithOtherCocoaError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSPersistentStoreTimeoutError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSPersistentStoreSaveError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSManagedObjectContextRecursiveSaveError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationInvalidURIError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationStringPatternMatchingError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationStringTooShortError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationStringTooLongError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationInvalidDateError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationDateTooSoonError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationDateTooLateError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationNumberTooSmallError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationNumberTooLargeError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationRelationshipDeniedDeleteError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationRelationshipExceedsMaximumCountError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationRelationshipLacksMinimumCountError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationMissingMandatoryPropertyError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSValidationMultipleErrorsError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSManagedObjectConstraintValidationError:(id)a3
{
}

+ (void)_contextSaveFailedWithNSManagedObjectValidationError:(id)a3
{
}

+ (void)contextExecuteFailedWithSQLiteResultCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = v3;
    __int16 v7 = 1024;
    int v8 = (char)v3;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Execute failure sqlite result code: %d, primary result code: %d", (uint8_t *)v6, 0xEu);
  }

  switch((char)v3)
  {
    case 1:
      if (v3 == 769) {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_SQLITE_ERROR_SNAPSHOT_769_withCode:", 769);
      }
      else {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_withCode:", v3);
      }
      break;
    case 2:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_INTERNAL_2_withCode:", v3);
      break;
    case 3:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_PERM_3_withCode:", v3);
      break;
    case 4:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ABORT_4_withCode:", v3);
      break;
    case 5:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_BUSY_5_withCode:", v3);
      break;
    case 6:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_LOCKED_6_withCode:", v3);
      break;
    case 7:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOMEM_7_withCode:", v3);
      break;
    case 8:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_READONLY_8_withCode:", v3);
      break;
    case 9:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_INTERRUPT_9_withCode:", v3);
      break;
    case 10:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_IOERR_10_withCode:", v3);
      break;
    case 11:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CORRUPT_11_withCode:", v3);
      break;
    case 12:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTFOUND_12_withCode:", v3);
      break;
    case 13:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_FULL_13_withCode:", v3);
      break;
    case 14:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CANTOPEN_14_withCode:", v3);
      break;
    case 15:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_PROTOCOL_15_withCode:", v3);
      break;
    case 16:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_EMPTY_16_withCode:", v3);
      break;
    case 17:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_SCHEMA_17_withCode:", v3);
      break;
    case 18:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_TOOBIG_18_withCode:", v3);
      break;
    case 19:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CONSTRAINT_19_withCode:", v3);
      break;
    case 20:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_MISMATCH_20_withCode:", v3);
      break;
    case 21:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_MISUSE_21_withCode:", v3);
      break;
    case 22:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOLFS_22_withCode:", v3);
      break;
    case 23:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_AUTH_23_withCode:", v3);
      break;
    case 24:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_FORMAT_24_withCode:", v3);
      break;
    case 25:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_RANGE_25_withCode:", v3);
      break;
    case 26:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTADB_26_withCode:", v3);
      break;
    case 27:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTICE_27_withCode:", v3);
      break;
    case 28:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_WARNING_28_withCode:", v3);
      break;
    default:
      if ((char)v3 == 100)
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ROW_100_withCode:", v3);
      }
      else if ((char)v3 == 101)
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_DONE_101_withCode:", v3);
      }
      else
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_OTHER_withCode:", v3);
      }
      break;
  }
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_SQLITE_ERROR_SNAPSHOT_769_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_OTHER_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_WARNING_28_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_TOOBIG_18_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_SCHEMA_17_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ROW_100_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_READONLY_8_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_RANGE_25_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PROTOCOL_15_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PERM_3_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTICE_27_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTFOUND_12_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTADB_26_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOMEM_7_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOLFS_22_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISUSE_21_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISMATCH_20_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_LOCKED_6_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_IOERR_10_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERRUPT_9_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERNAL_2_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FULL_13_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FORMAT_24_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_EMPTY_16_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_DONE_101_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CORRUPT_11_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CONSTRAINT_19_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CANTOPEN_14_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_BUSY_5_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_AUTH_23_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ABORT_4_withCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Forcing crash after execute failure with sqlite result code: %d", v3);
  [ objc_claimAutoreleasedReturnValue() UTF8String];
  _os_crash();
  __break(1u);
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_92(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v5 = v3;
    if ((objc_msgSend(v5, "pl_performWithOptions:andBlock:", 4, *(void *)(a1 + 56)) & 1) == 0)
    {
      uint64_t v4 = *(void *)(a1 + 64);
      if (v4) {
        [*(id *)(a1 + 40) sync:v4 identifyingBlock:*(void *)(a1 + 72) library:*(void *)(a1 + 48)];
      }
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2_94;
    v6[3] = &unk_1E5875198;
    id v7 = *(id *)(a1 + 56);
    [v3 performWithOptions:4 andBlock:v6];
  }
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_4(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_5;
  v1[3] = &unk_1E5875198;
  id v2 = *(id *)(a1 + 32);
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v1];
}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2_94(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_3;
  v1[3] = &unk_1E5875198;
  id v2 = *(id *)(a1 + 32);
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v1];
}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_registerStateHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerStateHandler_s_onceToken != -1) {
    dispatch_once(&_registerStateHandler_s_onceToken, block);
  }
}

uint64_t __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.megamoc.stateHandleQueue", v0);
  id v2 = (void *)_registerStateHandler_s_stateHandlerQueue;
  _registerStateHandler_s_stateHandlerQueue = (uint64_t)v1;

  return os_state_add_handler();
}

uint64_t __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _stateDataWithHints:a2];
}

+ (void)_activateStatusTimer
{
}

void __56__PLPhotoLibrary_MegaMocAdditions___activateStatusTimer__block_invoke()
{
  uint64_t v0 = +[PLConcurrencyLimiter sharedLimiter];
  dispatch_queue_t v1 = [v0 sharedBackgroundQueue];
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v1);
  uint64_t v3 = (void *)_activateStatusTimer_timer;
  _activateStatusTimer_timer = (uint64_t)v2;

  uint64_t v4 = _activateStatusTimer_timer;
  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v4, v5, 0x6FC23AC00uLL, 0x5F5E100uLL);
  pl_dispatch_source_set_event_handler();
  dispatch_resume((dispatch_object_t)_activateStatusTimer_timer);
}

void __56__PLPhotoLibrary_MegaMocAdditions___activateStatusTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _debugStatisticsDescription];
    int v4 = 138412290;
    dispatch_time_t v5 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "[megamoc] %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)_debugStatisticsDescription
{
  dispatch_source_t v2 = [MEMORY[0x1E4F28E78] string];
  unint64_t v3 = atomic_load((unint64_t *)&s_currentLibraryCount);
  unint64_t v4 = atomic_load((unint64_t *)&s_totalLibraryCount);
  unint64_t v5 = atomic_load((unint64_t *)&s_nestedWriteTransactionCount);
  [v2 appendFormat:@"Library instances currently in memory: %lld, total created in the process: %lld, count of nested write transactions: %lld\n", v3, v4, v5];
  for (uint64_t i = 0; i != 96; i += 32)
  {
    id v7 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i);
    int v8 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24);
    unint64_t v9 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i));
    double v10 = (double)(v9 / 0x3B9ACA00);
    if (i == 32) {
      id v11 = "UT";
    }
    else {
      id v11 = "IN";
    }
    if (!i) {
      id v11 = "BG";
    }
    unint64_t v12 = atomic_load(v8);
    id v13 = v7 + 2;
    unint64_t v14 = atomic_load(v7 + 2);
    unint64_t v15 = v14 + v12;
    unint64_t v16 = atomic_load(v8);
    unint64_t v17 = atomic_load(v7 + 2);
    unint64_t v18 = atomic_load(v7 + 1);
    unint64_t v19 = atomic_load(v8);
    unint64_t v20 = atomic_load(v13);
    [v2 appendFormat:@"[%s: executed: %lld (read: %lld / write: %lld), count waiting: %lld, total wait: %g sec, average wait: %g sec]\n", v11, v15, v16, v17, v18, *(void *)&v10, v10 / (double)(v20 + v19)];
  }
  [v2 appendString:@"\n"];
  __int16 v21 = +[PLConcurrencyLimiter sharedLimiter];
  id v22 = [v21 debugDescription];
  [v2 appendFormat:@"%@", v22];

  return v2;
}

+ (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3->var2 == 3)
  {
    unint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Generating state data for MegaMoc...", buf, 2u);
    }

    unint64_t v5 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v6 = [a1 _stateDictionary];
    id v16 = 0;
    id v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:&v16];
    id v8 = v16;

    if (v7)
    {
      unsigned int v9 = [v7 length];
      uint64_t v10 = v9;
      size_t v11 = v9 + 200;
      unint64_t v12 = (os_state_data_s *)malloc_type_malloc(v11, 0x6C31193CuLL);
      id v13 = v12;
      if (!v12)
      {
LABEL_12:

        return v13;
      }
      bzero(v12, v11);
      v13->var0 = 1;
      v13->var1.var1 = v9;
      unint64_t v14 = [NSString stringWithFormat:@"State for MegaMoc: "];
      [v14 UTF8String];
      __strlcpy_chk();
      [v7 getBytes:v13->var4 length:v10];
    }
    else
    {
      unint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unable to serialize state data for MegaMoc: %@", buf, 0xCu);
      }
      id v13 = 0;
    }

    goto LABEL_12;
  }
  return 0;
}

+ (id)_stateDictionary
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v3 = NSNumber;
  unint64_t v4 = atomic_load((unint64_t *)&s_currentLibraryCount);
  unint64_t v5 = [v3 numberWithUnsignedLongLong:v4];
  [v2 setObject:v5 forKeyedSubscript:@"PLPhotoLibraryCount"];

  uint64_t v6 = NSNumber;
  unint64_t v7 = atomic_load((unint64_t *)&s_totalLibraryCount);
  id v8 = [v6 numberWithUnsignedLongLong:v7];
  [v2 setObject:v8 forKeyedSubscript:@"PLPhotoLibraryTotalCount"];

  unsigned int v9 = NSNumber;
  unint64_t v10 = atomic_load((unint64_t *)&s_nestedWriteTransactionCount);
  size_t v11 = [v9 numberWithUnsignedLongLong:v10];
  [v2 setObject:v11 forKeyedSubscript:@"NestedTransactionCount"];

  for (uint64_t i = 0; i != 96; i += 32)
  {
    id v13 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i + 16);
    unint64_t v14 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i));
    double v15 = (double)(v14 / 0x3B9ACA00);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v17 = NSNumber;
    unint64_t v18 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    uint64_t v19 = [v17 numberWithUnsignedLongLong:v18];
    [v16 setObject:v19 forKeyedSubscript:@"ReadBlockCount"];

    unint64_t v20 = NSNumber;
    unint64_t v21 = atomic_load(v13);
    id v22 = [v20 numberWithUnsignedLongLong:v21];
    [v16 setObject:v22 forKeyedSubscript:@"WriteBlockCount"];

    uint64_t v23 = NSNumber;
    unint64_t v24 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    unint64_t v25 = atomic_load(v13);
    long long v26 = [v23 numberWithUnsignedLongLong:v25 + v24];
    [v16 setObject:v26 forKeyedSubscript:@"TotalBlockCount"];

    id v27 = NSNumber;
    unint64_t v28 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 8));
    id v29 = [v27 numberWithUnsignedLongLong:v28];
    [v16 setObject:v29 forKeyedSubscript:@"WaitingBlockCount"];

    long long v30 = [NSNumber numberWithDouble:v15];
    [v16 setObject:v30 forKeyedSubscript:@"TotalWaitSeconds"];

    long long v31 = NSNumber;
    unint64_t v32 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    unint64_t v33 = atomic_load(v13);
    id v34 = [v31 numberWithDouble:v15 / (double)(v33 + v32)];
    [v16 setObject:v34 forKeyedSubscript:@"AverageWaitSeconds"];

    long long v35 = @"IN";
    if (i == 32) {
      long long v35 = @"UT";
    }
    if (i) {
      long long v36 = v35;
    }
    else {
      long long v36 = @"BG";
    }
    [v2 setObject:v16 forKeyedSubscript:v36];
  }
  long long v37 = +[PLConcurrencyLimiter sharedLimiter];
  long long v38 = [v37 debugDescription];
  [v2 setObject:v38 forKeyedSubscript:@"ConcurrencyLimiter"];

  return v2;
}

@end