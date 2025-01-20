@interface PLMomentGenerationDataManager
+ (BOOL)isManagedObjectContextMomentarilyBlessed:(id)a3;
+ (id)processingMomentsFromMoments:(id)a3;
+ (void)initialize;
+ (void)setManagedObjectContextMomentarilyBlessed:(id)a3;
+ (void)setManagerMomentarilyBlessed:(id)a3;
- (BOOL)_batchDeleteForEntityName:(id)a3 error:(id *)a4;
- (BOOL)_deleteAllObjectsForEntityName:(id)a3 error:(id *)a4;
- (BOOL)cameraIsActive;
- (BOOL)deleteAllHighlightsWithError:(id *)a3;
- (BOOL)deleteAllMomentsWithError:(id *)a3;
- (BOOL)hasChanges;
- (BOOL)isLightweightMigrationManager;
- (BOOL)previousValidationSucceeded;
- (BOOL)routineIsAvailable;
- (BOOL)save:(id *)a3;
- (BOOL)shouldPerformLightweightValidation;
- (BOOL)wantsMomentReplayLogging;
- (CNContactStore)_contactStore;
- (Class)momentAssetDataClass;
- (Class)momentDataClass;
- (NSDictionary)generationOptions;
- (NSManagedObjectContext)managedObjectContext;
- (OS_dispatch_queue)isolationQueue;
- (PLCameraAppWatcher)cameraWatcher;
- (PLMomentGenerationDataManager)initWithLibraryServicesManager:(id)a3;
- (PLMomentGenerationDataManager)initWithManagedObjectContext:(id)a3 pathManagerForLightweightMigration:(id)a4;
- (PLPhotoLibrary)momentGenerationLibrary;
- (id)_currentHomeAddressDictionary;
- (id)_highlightRelationshipsToPrefetchForHighlightKind:(unsigned __int16)a3;
- (id)_highlightRelationshipsToPrefetchForHighlightOfAnyKind;
- (id)allAssetIDsToBeIncludedInMomentsWithError:(id *)a3;
- (id)allAssetsToBeIncludedInMomentsWithError:(id *)a3;
- (id)allEmptyPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4;
- (id)allInvalidAssetsWithError:(id *)a3;
- (id)allInvalidMomentsWithError:(id *)a3;
- (id)allInvalidPhotosHighlightsOfAllKindsWithError:(id *)a3;
- (id)allMomentIDsWithError:(id *)a3;
- (id)allMomentsWithError:(id *)a3;
- (id)allPhotosHighlightsOfAllKindsWithError:(id *)a3;
- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4;
- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 withPredicate:(id)a4 error:(id *)a5;
- (id)allPhotosHighlightsWithPredicate:(id)a3 error:(id *)a4;
- (id)assetWithUniqueID:(id)a3 error:(id *)a4;
- (id)assetsWithUniqueIDs:(id)a3 error:(id *)a4;
- (id)deletedObjects;
- (id)fetchChildHighlightItemsForHighlightItem:(id)a3;
- (id)fetchNeighborHighlightItemsForHighlightItems:(id)a3;
- (id)fetchParentHighlightItemsForHighlightItems:(id)a3;
- (id)generator;
- (id)highlightsIntersectingDateInterval:(id)a3 ofKind:(unsigned __int16)a4;
- (id)insertNewMoment;
- (id)insertNewPhotosHighlight;
- (id)insertedObjects;
- (id)lastLocationOfInterestVisit;
- (id)locationsOfInterest;
- (id)momentWithUniqueID:(id)a3 error:(id *)a4;
- (id)momentsBetweenDate:(id)a3 andDate:(id)a4 sorted:(BOOL)a5 excludeExternal:(BOOL)a6;
- (id)momentsForAssetsWithUniqueIDs:(id)a3 error:(id *)a4;
- (id)momentsIntersectingDateInterval:(id)a3;
- (id)momentsRequiringLocationOfInterestUpdateWithError:(id *)a3;
- (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailable:(id *)a3;
- (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable:(id *)a3;
- (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:(id *)a3;
- (id)momentsWithUniqueIDs:(id)a3 error:(id *)a4;
- (id)orphanedAssetIDsWithError:(id *)a3;
- (id)replayLogPath;
- (id)updatedObjects;
- (int64_t)previousValidatedModelVersion;
- (unint64_t)hardGenerationBatchSizeLimit;
- (void)_finalizeInit;
- (void)_initIsolationQueue;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)fetchLocationsOfInterestIfNeeded;
- (void)invalidateAllHighlightSubtitles;
- (void)logRoutineInformation;
- (void)performBlock:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)performBlock:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6;
- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6;
- (void)refreshAllObjects;
- (void)releaseMemoryIntensiveObjects;
- (void)reloadGenerationOptions;
- (void)resetOnFailure;
- (void)runPeriodicMaintenanceTasks:(unint64_t)a3 withTransaction:(id)a4;
- (void)setManagedObjectContext:(id)a3;
- (void)setMomentGenerationLibrary:(id)a3;
- (void)setPreviousValidatedModelVersion:(int64_t)a3;
- (void)setPreviousValidationSucceeded:(BOOL)a3;
- (void)setShouldPerformLightweightValidation:(BOOL)a3;
- (void)verifyAndRepairOrphanedAssets:(id)a3 completionBlock:(id)a4;
@end

@implementation PLMomentGenerationDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentGenerationLibrary, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_lightWeightMigrationPathManager, 0);
  objc_storeStrong((id *)&self->_generationOptions, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong(&self->_reachabilityBlock, 0);
}

- (void)setMomentGenerationLibrary:(id)a3
{
}

- (BOOL)isLightweightMigrationManager
{
  return self->_isLightweightMigrationManager;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (PLCameraAppWatcher)cameraWatcher
{
  return self->_cameraWatcher;
}

- (BOOL)previousValidationSucceeded
{
  return self->_previousValidationSucceeded;
}

- (int64_t)previousValidatedModelVersion
{
  return self->_previousValidatedModelVersion;
}

- (BOOL)shouldPerformLightweightValidation
{
  return self->_shouldPerformLightweightValidation;
}

- (void)releaseMemoryIntensiveObjects
{
}

- (void)runPeriodicMaintenanceTasks:(unint64_t)a3 withTransaction:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  BOOL v7 = [(PLMomentGenerationDataManager *)self cameraIsActive];
  v8 = PLMomentsGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Periodic maintenance tasks: Skipped, Camera is active.", buf, 2u);
    }
    goto LABEL_42;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Periodic maintenance tasks: Start", buf, 2u);
  }

  v8 = dispatch_group_create();
  if (v4)
  {
    v10 = PLMomentsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Process recent highlights: Start", buf, 2u);
    }

    dispatch_group_enter(v8);
    generator = self->_generator;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke;
    v38[3] = &unk_1E5875CE0;
    v39 = v8;
    [(PLMomentGeneration *)generator processRecentHighlightsWithCompletionBlock:v38];

    if ((v4 & 0x20) == 0)
    {
LABEL_8:
      if ((v4 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_20;
    }
  }
  else if ((v4 & 0x20) == 0)
  {
    goto LABEL_8;
  }
  v12 = PLMomentsGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Location Of Interest Update: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v13 = self->_generator;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_241;
  v36[3] = &unk_1E5875CE0;
  v37 = v8;
  [(PLMomentGeneration *)v13 locationOfInterestUpdateWithCompletionBlock:v36];

  if ((v4 & 4) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_20:
  v14 = PLMomentsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Process unprocessed moment locations: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v15 = self->_generator;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_242;
  v34[3] = &unk_1E5875CE0;
  v35 = v8;
  [(PLMomentGeneration *)v15 processUnprocessedMomentLocationsWithCompletionBlock:v34];

  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_23:
  v16 = PLMomentsGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Update highlight titles: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v17 = self->_generator;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_243;
  v32[3] = &unk_1E5875CE0;
  v33 = v8;
  [(PLMomentGeneration *)v17 updateHighlightTitlesWithCompletionBlock:v32];

  if ((v4 & 2) == 0)
  {
LABEL_11:
    if ((v4 & 0x10) == 0) {
      goto LABEL_12;
    }
LABEL_29:
    v19 = PLMomentsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Validate library: Start", buf, 2u);
    }

    dispatch_group_enter(v8);
    v20 = self->_generator;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_245;
    v28[3] = &unk_1E5875CE0;
    v29 = v8;
    [(PLMomentGeneration *)v20 validateLibraryWithCompletionBlock:v28];

    if ((v4 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_32;
  }
LABEL_26:
  v18 = PLMomentsGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Run repair of orphaned assets: Start", buf, 2u);
  }

  dispatch_group_enter(v8);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_244;
  v30[3] = &unk_1E5875CE0;
  v31 = v8;
  [(PLMomentGenerationDataManager *)self verifyAndRepairOrphanedAssets:v6 completionBlock:v30];

  if ((v4 & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_12:
  if ((v4 & 0x20) != 0)
  {
LABEL_32:
    v21 = PLMomentsGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Cleanup empty highlights: Start", buf, 2u);
    }

    dispatch_group_enter(v8);
    v22 = self->_generator;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_246;
    v26[3] = &unk_1E5875CE0;
    v27 = v8;
    [(PLMomentGeneration *)v22 cleanupEmptyHighlightsWithCompletionBlock:v26];
  }
LABEL_35:
  v23 = PLMomentsGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Wait for tasks to complete", buf, 2u);
  }

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v24 = PLMomentsGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "Release memory intensive objects", buf, 2u);
  }

  [(PLMomentGeneration *)self->_generator releaseMemoryIntensiveObjects];
  [v6 stillAlive];
  v25 = PLMomentsGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "Periodic maintenance tasks: Done", buf, 2u);
  }

LABEL_42:
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Process recent highlights: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_241(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Location Of Interest Update: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_242(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Process unprocessed moment locations: Dont", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_243(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Update highlight titles: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_244(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Run repair of orphaned assets: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_245(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Validate library: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__PLMomentGenerationDataManager_runPeriodicMaintenanceTasks_withTransaction___block_invoke_246(uint64_t a1)
{
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Cleanup empty highlights: Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setPreviousValidationSucceeded:(BOOL)a3
{
  BOOL v3 = a3;
  self->_previousValidationSucceeded = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"com.apple.photos.validation.previousValidationSucceeded"];
}

- (void)setPreviousValidatedModelVersion:(int64_t)a3
{
  self->_previousValidatedModelVersion = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setInteger:a3 forKey:@"com.apple.photos.validation.previousValidatedModelVersion"];
}

- (void)setShouldPerformLightweightValidation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldPerformLightweightValidation = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"com.apple.photos.validation.performLightweightValidation"];
}

- (id)lastLocationOfInterestVisit
{
  return [(PLRoutineService *)self->_routineManager lastLocationOfInterestVisit];
}

- (void)fetchLocationsOfInterestIfNeeded
{
}

- (BOOL)cameraIsActive
{
  v2 = [(PLMomentGenerationDataManager *)self cameraWatcher];
  char v3 = [v2 isCameraRunning];

  return v3;
}

- (id)locationsOfInterest
{
  if ([(PLMomentGenerationDataManager *)self routineIsAvailable])
  {
    char v3 = [(PLRoutineService *)self->_routineManager allLocationsOfInterest];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (BOOL)routineIsAvailable
{
  if ([(PLMomentGenerationDataManager *)self cameraIsActive]) {
    return 0;
  }
  routineManager = self->_routineManager;
  return [(PLRoutineService *)routineManager routineIsAvailable];
}

- (void)logRoutineInformation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(PLMomentGenerationDataManager *)self routineIsAvailable])
  {
    char v3 = [(PLMomentGenerationDataManager *)self locationsOfInterest];
    id v4 = PLMomentsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = [v3 count];
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Routine is available with %lu LOIs:", buf, 0xCu);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          v11 = PLMomentsGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v18 = v10;
            _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "\t%{private}@", buf, 0xCu);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v5 = PLMomentsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Routine is not available", buf, 2u);
    }
  }
}

- (id)replayLogPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  char v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs/com.apple.photos/"];
  v5 = [v4 stringByAppendingPathComponent:@"MomentsReplayLog.plist"];

  return v5;
}

- (BOOL)wantsMomentReplayLogging
{
  int v2 = MEMORY[0x19F38BDA0](self, a2);
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"PLMomentGenerationReplayLoggingEnabled", @"com.apple.mobileslideshow", 0) != 0;
  }
  return v2;
}

- (void)verifyAndRepairOrphanedAssets:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLMomentGenerationDataManager *)self isolationQueue];
  v11 = v7;
  id v9 = v7;
  id v10 = v6;
  pl_dispatch_async();
}

void __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__224;
  uint64_t v18 = __Block_byref_object_dispose__225;
  id v19 = 0;
  id v2 = a1[4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_226;
  v13[3] = &unk_1E5875E68;
  v13[4] = v2;
  v13[5] = &v14;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_227;
  v11[3] = &unk_1E5875CE0;
  id v12 = a1[5];
  [v2 performBlock:v13 synchronously:1 completionHandler:v11];
  char v3 = (void *)v15[5];
  if (v3 && [v3 count])
  {
    id v4 = PLMomentsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(id)v15[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "MOMENTS: found %lu orphaned assets. Marking for moment generation", buf, 0xCu);
    }

    id v6 = [a1[4] generator];
    uint64_t v7 = v15[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_228;
    v8[3] = &unk_1E58742F0;
    id v9 = a1[5];
    id v10 = a1[6];
    [v6 generateWithAssetInsertsAndUpdates:v7 assetDeletes:0 assetUpdatesForHighlights:0 momentUpdatesForHighlights:0 completionHandler:v8];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

  _Block_object_dispose(&v14, 8);
}

void __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_226(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v8 = 0;
  uint64_t v3 = [v2 orphanedAssetIDsWithError:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = PLMomentsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "MOMENTS: error fetching orphaned assets: %@", buf, 0xCu);
    }
  }
}

uint64_t __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_227(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

uint64_t __79__PLMomentGenerationDataManager_verifyAndRepairOrphanedAssets_completionBlock___block_invoke_228(uint64_t a1)
{
  [*(id *)(a1 + 32) stillAlive];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)orphanedAssetIDsWithError:(id *)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Asset"];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsIncludedInMoments"), 1);
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"visibilityState", 0, v7);
  v17[1] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 1", @"hidden");
  v17[2] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 0);
  v17[3] = v10;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"moment");
  v17[4] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  long long v13 = [v6 andPredicateWithSubpredicates:v12];

  [v5 setPredicate:v13];
  [v5 setResultType:1];
  [v5 setIncludesPropertyValues:0];
  uint64_t v14 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  long long v15 = [v14 executeFetchRequest:v5 error:a3];

  return v15;
}

- (id)insertNewPhotosHighlight
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = 0;
  uint64_t v3 = +[PLPhotosHighlight insertNewPhotosHighlightInManagedObjectContext:v2 error:&v5];

  return v3;
}

- (id)insertNewMoment
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v3 = +[PLMoment entityName];
  id v4 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v3, (uint64_t)v2, 0);

  return v4;
}

- (BOOL)deleteAllHighlightsWithError:(id *)a3
{
  uint64_t v5 = +[PLPhotosHighlight entityName];
  LOBYTE(a3) = [(PLMomentGenerationDataManager *)self _deleteAllObjectsForEntityName:v5 error:a3];

  return (char)a3;
}

- (BOOL)deleteAllMomentsWithError:(id *)a3
{
  uint64_t v5 = +[PLMoment entityName];
  LOBYTE(a3) = [(PLMomentGenerationDataManager *)self _batchDeleteForEntityName:v5 error:a3];

  return (char)a3;
}

- (BOOL)_deleteAllObjectsForEntityName:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];
  id v9 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v10 = [PLEnumerateAndSaveController alloc];
  uint64_t v11 = NSStringFromSelector(a2);
  id v12 = [v9 pathManager];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke;
  v25[3] = &unk_1E586FB88;
  id v26 = v9;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke_2;
  v22[3] = &unk_1E5868628;
  id v13 = v26;
  id v23 = v13;
  v24 = &v27;
  uint64_t v14 = [(PLEnumerateAndSaveController *)v10 initWithName:v11 fetchRequest:v8 context:v13 pathManager:v12 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v25 didFetchObjectIDsBlock:0 processResultsBlock:v22];

  id v21 = 0;
  BOOL v15 = [(PLEnumerateAndSaveController *)v14 processObjectsWithError:&v21];
  id v16 = v21;
  if (v15)
  {
    v17 = PLMomentsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)v28[3];
      *(_DWORD *)buf = 138412546;
      id v32 = v7;
      __int16 v33 = 2048;
      id v34 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Finished deleting entity: %@, count deleted: %ld", buf, 0x16u);
    }
  }
  else
  {
    id v19 = PLMomentsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to delete objects of entity: %@, error: %@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v16;
    }
  }

  _Block_object_dispose(&v27, 8);
  return v15;
}

id __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __70__PLMomentGenerationDataManager__deleteAllObjectsForEntityName_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) deleteObject:*(void *)(*((void *)&v9 + 1) + 8 * v8)];
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_batchDeleteForEntityName:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v6];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  [v8 setResultType:2];
  long long v9 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  id v16 = 0;
  long long v10 = [v9 executeRequest:v8 error:&v16];
  id v11 = v16;
  long long v12 = PLMigrationGetLog();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to clear %@ references, %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v10 result];
    *(_DWORD *)buf = 138412546;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Cleared all %@ %@ references from assets", buf, 0x16u);
  }
  if (a4) {
    *a4 = v11;
  }

  return v11 == 0;
}

- (id)allAssetIDsToBeIncludedInMomentsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allAssetsIncludedInMomentsInManagedObjectContext:v4 IDsOnly:1 error:a3];

  return v5;
}

- (id)allInvalidAssetsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allInvalidAssetsInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)allAssetsToBeIncludedInMomentsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allAssetsIncludedInMomentsInManagedObjectContext:v4 IDsOnly:0 error:a3];

  return v5;
}

- (id)allMomentIDsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allMomentIDsInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)momentsRequiringLocationOfInterestUpdateWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment momentsWithLocationOfInterestInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailable:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)allInvalidMomentsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allInvalidMomentsInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)allMomentsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLMoment allMomentsInManagedObjectContext:v4 error:a3];

  return v5;
}

- (id)allPhotosHighlightsWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v8 = [(PLMomentGenerationDataManager *)self _highlightRelationshipsToPrefetchForHighlightOfAnyKind];
  long long v9 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v7 predicate:v6 keyPathsForPrefetching:v8 error:a4];

  return v9;
}

- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 withPredicate:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  long long v9 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  long long v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v6);
  id v11 = v10;
  if (v8)
  {
    long long v12 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v10;
    v18[1] = v8;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v14 = [v12 andPredicateWithSubpredicates:v13];
  }
  else
  {
    id v14 = v10;
  }
  BOOL v15 = [(PLMomentGenerationDataManager *)self _highlightRelationshipsToPrefetchForHighlightKind:v6];
  id v16 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v9 predicate:v14 keyPathsForPrefetching:v15 error:a5];

  return v16;
}

- (id)allPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4
{
  return [(PLMomentGenerationDataManager *)self allPhotosHighlightsOfKind:a3 withPredicate:0 error:a4];
}

- (id)allEmptyPhotosHighlightsOfKind:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v6 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v7 = +[PLPhotosHighlight predicateForEmptyHighlightsOfKind:v5];
  id v8 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v6 predicate:v7 keyPathsForPrefetching:0 error:a4];

  return v8;
}

- (id)allInvalidPhotosHighlightsOfAllKindsWithError:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v5 = +[PLPhotosHighlight predicateForInvalidHighlightsOfAllKinds];
  uint64_t v6 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v4 predicate:v5 keyPathsForPrefetching:0 error:a3];

  return v6;
}

- (id)allPhotosHighlightsOfAllKindsWithError:(id *)a3
{
  uint64_t v5 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v6 = [(PLMomentGenerationDataManager *)self _highlightRelationshipsToPrefetchForHighlightOfAnyKind];
  uint64_t v7 = +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:v5 predicate:0 keyPathsForPrefetching:v6 error:a3];

  return v7;
}

- (id)momentsBetweenDate:(id)a3 andDate:(id)a4 sorted:(BOOL)a5 excludeExternal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v27[2] = *MEMORY[0x1E4F143B8];
  long long v10 = (void *)MEMORY[0x1E4F1C0D0];
  id v11 = a4;
  id v12 = a3;
  id v13 = +[PLMoment entityName];
  id v14 = [v10 fetchRequestWithEntityName:v13];

  BOOL v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K >= %@) AND (%K <= %@)", @"endDate", v12, @"startDate", v11];

  if (v6)
  {
    id v16 = +[PLMoment fetchPredicateForExcludingOriginatorState:8];
    v17 = (void *)MEMORY[0x1E4F28BA0];
    v27[0] = v15;
    v27[1] = v16;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    __int16 v19 = [v17 andPredicateWithSubpredicates:v18];
    [v14 setPredicate:v19];
  }
  else
  {
    [v14 setPredicate:v15];
  }
  [v14 setReturnsObjectsAsFaults:0];
  if (v7)
  {
    id v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"representativeDate" ascending:1];
    v26[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v26[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [v14 setSortDescriptors:v22];
  }
  id v23 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  v24 = [v23 executeFetchRequest:v14 error:0];

  return v24;
}

- (id)momentsIntersectingDateInterval:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLMomentGenerationDataManager.m", 594, @"Invalid parameter not satisfying: %@", @"dateInterval" object file lineNumber description];
  }
  BOOL v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = [v5 endDate];
  id v8 = [v5 startDate];
  long long v9 = [v6 predicateWithFormat:@"(startDate <= %@) AND (endDate >= %@)", v7, v8];

  long long v10 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Moment"];
  [v10 setFetchBatchSize:100];
  [v10 setReturnsObjectsAsFaults:0];
  [v10 setPredicate:v9];
  [v10 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1C58];
  id v11 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  id v12 = [v11 executeFetchRequest:v10 error:0];

  return v12;
}

- (id)highlightsIntersectingDateInterval:(id)a3 ofKind:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLMomentGenerationDataManager.m", 579, @"Invalid parameter not satisfying: %@", @"dateInterval" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1E4F28F60];
  long long v9 = [v7 endDate];
  long long v10 = [v7 startDate];
  id v11 = [v8 predicateWithFormat:@"(startDate <= %@) AND (endDate >= %@) AND kind = %d", v9, v10, v4];

  id v12 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PhotosHighlight"];
  [v12 setFetchBatchSize:100];
  [v12 setReturnsObjectsAsFaults:0];
  [v12 setPredicate:v11];
  id v13 = [(PLMomentGenerationDataManager *)self _highlightRelationshipsToPrefetchForHighlightKind:v4];
  [v12 setRelationshipKeyPathsForPrefetching:v13];

  id v14 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  BOOL v15 = [v14 executeFetchRequest:v12 error:0];

  return v15;
}

- (id)_highlightRelationshipsToPrefetchForHighlightOfAnyKind
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"parentPhotosHighlight";
  v4[1] = @"childPhotosHighlights";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)_highlightRelationshipsToPrefetchForHighlightKind:(unsigned __int16)a3
{
  v11[7] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
      v11[0] = @"parentPhotosHighlight";
      v11[1] = @"assets";
      v11[2] = @"assets.additionalAttributes";
      v11[3] = @"summaryAssets";
      void v11[4] = @"extendedAssets";
      v11[5] = @"moments";
      v11[6] = @"parentDayGroupPhotosHighlight";
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v4 = (__CFString **)v11;
      uint64_t v5 = 7;
      goto LABEL_7;
    case 1u:
      v9[0] = @"parentPhotosHighlight";
      v9[1] = @"childPhotosHighlights";
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v4 = (__CFString **)v9;
      uint64_t v5 = 2;
      goto LABEL_7;
    case 2u:
      id v8 = @"childPhotosHighlights";
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v4 = &v8;
      uint64_t v5 = 1;
      goto LABEL_7;
    case 3u:
      v10[0] = @"parentPhotosHighlight";
      v10[1] = @"dayGroupAssets";
      v10[2] = @"dayGroupAssets.additionalAttributes";
      v10[3] = @"dayGroupSummaryAssets";
      v10[4] = @"dayGroupExtendedAssets";
      v10[5] = @"childDayGroupPhotosHighlights";
      uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v4 = (__CFString **)v10;
      uint64_t v5 = 6;
LABEL_7:
      BOOL v6 = [v3 arrayWithObjects:v4 count:v5];
      break;
    default:
      BOOL v6 = 0;
      break;
  }
  return v6;
}

- (id)_currentHomeAddressDictionary
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(PLMomentGenerationDataManager *)self _contactStore];
  v23[0] = *MEMORY[0x1E4F1AF10];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v21 = 0;
  uint64_t v4 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v21];
  id v5 = v21;

  if (v4)
  {
    [v4 postalAddresses];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      uint64_t v10 = *MEMORY[0x1E4F1B6F8];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "label", (void)v17);
          if ([v13 isEqualToString:v10])
          {
            BOOL v15 = [v12 value];
            id v14 = [v15 dictionaryRepresentation];

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (CNContactStore)_contactStore
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_contactStore
    && (unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1)
  {
    uint64_t v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "We should never attempt to access the contact store when it isn't authorized. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  contactStore = self->_contactStore;
  return contactStore;
}

- (void)_networkReachabilityDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F4BDA8]];
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__31991;
  BOOL v15 = __Block_byref_object_dispose__31992;
  id v16 = 0;
  uint64_t v8 = _networkReachabilityQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PLMomentGenerationDataManager__networkReachabilityDidChange___block_invoke;
  v10[3] = &unk_1E5875E68;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v8, v10);

  uint64_t v9 = v12[5];
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
  }
  _Block_object_dispose(&v11, 8);
}

void __63__PLMomentGenerationDataManager__networkReachabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F38D650](*(void *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fetchParentHighlightItemsForHighlightItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "parentPhotosHighlight", (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 allObjects];

  return v11;
}

- (id)fetchChildHighlightItemsForHighlightItem:(id)a3
{
  id v3 = [a3 childPhotosHighlights];
  id v4 = [v3 allObjects];

  return v4;
}

- (id)fetchNeighborHighlightItemsForHighlightItems:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v21 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_30;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v38 = v4;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v37 = self;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v13 = [v12 startDate];
        long long v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 earlierDate:v5];

          id v5 = (void *)v15;
        }
        long long v16 = [v12 endDate];
        long long v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 laterDate:v6];

          uint64_t v6 = (void *)v18;
        }
        unsigned int v19 = [v12 kind];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v9);

    if (v19)
    {
      long long v20 = &PLYearGroupingRuleTimeIntervalForNeighbors;
      self = v37;
      goto LABEL_19;
    }
    self = v37;
  }
  else
  {
  }
  unsigned int v19 = 0;
  long long v20 = &PLMonthGroupingRuleTimeIntervalForNeighbors;
LABEL_19:
  double v22 = *(double *)v20;
  id v23 = (void *)MEMORY[0x1E4F28F60];
  v24 = [v5 dateByAddingTimeInterval:-*(double *)v20];
  v25 = [v23 predicateWithFormat:@"startDate >= %@", v24];

  id v26 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v27 = [v6 dateByAddingTimeInterval:v22];
  v28 = [v26 predicateWithFormat:@"endDate <= %@", v27];

  if (v19 - 1 < 2)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", v19, v36);
  }
  else
  {
    if (v19 && v19 != 3)
    {
      uint64_t v29 = 0;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d || kind = %d", 0, 3);
  uint64_t v29 = };
LABEL_25:
  uint64_t v30 = (void *)MEMORY[0x1E4F28BA0];
  v46[0] = v25;
  v46[1] = v28;
  v46[2] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  id v32 = [v30 andPredicateWithSubpredicates:v31];

  id v39 = 0;
  id v21 = [(PLMomentGenerationDataManager *)self allPhotosHighlightsWithPredicate:v32 error:&v39];
  id v33 = v39;
  if (v33)
  {
    id v34 = PLMomentsGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v33;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Error fetching child highlight: %@", buf, 0xCu);
    }
  }
  id v4 = v38;
LABEL_30:

  return v21;
}

- (NSDictionary)generationOptions
{
  if (MEMORY[0x19F38BDA0](self, a2)) {
    id v3 = self->_generationOptions;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (unint64_t)hardGenerationBatchSizeLimit
{
  return 1000;
}

- (void)resetOnFailure
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  [v2 reset];
}

- (BOOL)save:(id *)a3
{
  id v4 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  int v5 = [v4 save:a3];
  if (v5) {
    [v4 refreshAllObjects];
  }

  return v5;
}

- (Class)momentAssetDataClass
{
  return (Class)objc_opt_class();
}

- (Class)momentDataClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChanges
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  char v3 = [v2 hasChanges];

  return v3;
}

- (void)refreshAllObjects
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  [v2 refreshAllObjects];
}

- (id)momentsForAssetsWithUniqueIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v8 = +[PLMoment entityName];
    uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets IN %@", v6];
    [v9 setPredicate:v10];
    if ((unint64_t)[v6 count] >= 0x65) {
      [v9 setFetchBatchSize:100];
    }
    [v9 setReturnsObjectsAsFaults:0];
    uint64_t v11 = [(PLMomentGenerationDataManager *)self managedObjectContext];
    id v12 = [v11 executeFetchRequest:v9 error:a4];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)momentsWithUniqueIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v8 = +[PLMoment entityName];
    uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v6];
    [v9 setPredicate:v10];
    if ((unint64_t)[v6 count] >= 0x65) {
      [v9 setFetchBatchSize:100];
    }
    [v9 setReturnsObjectsAsFaults:0];
    uint64_t v11 = [(PLMomentGenerationDataManager *)self managedObjectContext];
    id v12 = [v11 executeFetchRequest:v9 error:a4];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)momentWithUniqueID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLMomentGenerationDataManager.m" lineNumber:309 description:@"Must get object with NSManagedObjectID"];
  }
  id v8 = v7;
  uint64_t v9 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v10 = [v9 existingObjectWithID:v8 error:a4];

  return v10;
}

- (id)assetsWithUniqueIDs:(id)a3 error:(id *)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  id v8 = +[PLManagedAsset entityName];
  uint64_t v9 = [v6 fetchRequestWithEntityName:v8];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v7];
  [v9 setPredicate:v10];
  unint64_t v11 = [v7 count];

  if (v11 >= 0x65) {
    [v9 setFetchBatchSize:100];
  }
  [v9 setReturnsObjectsAsFaults:0];
  v16[0] = @"moment";
  v16[1] = @"additionalAttributes";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v9 setRelationshipKeyPathsForPrefetching:v12];

  long long v13 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  long long v14 = [v13 executeFetchRequest:v9 error:a4];

  return v14;
}

- (id)assetWithUniqueID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PLMomentGenerationDataManager.m" lineNumber:283 description:@"Must get object with NSManagedObjectID"];
  }
  id v7 = v6;
  id v8 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  uint64_t v9 = +[PLManagedAsset assetWithObjectID:v7 inManagedObjectContext:v8];

  return v9;
}

- (id)deletedObjects
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  char v3 = [v2 deletedObjects];

  return v3;
}

- (id)updatedObjects
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  char v3 = [v2 updatedObjects];

  return v3;
}

- (id)insertedObjects
{
  id v2 = [(PLMomentGenerationDataManager *)self managedObjectContext];
  char v3 = [v2 insertedObjects];

  return v3;
}

- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  long long v13 = (void (**)(void))a3;
  uint64_t v10 = (void (**)(void))a6;
  if (self->_isLightweightMigrationManager)
  {
    os_unfair_lock_lock(&self->_lightweightMigrationLock);
    if (v13) {
      v13[2](v13);
    }
    [(PLMomentGenerationDataManager *)self save:0];
    [(PLMomentGenerationDataManager *)self refreshAllObjects];
    if (v10) {
      v10[2](v10);
    }
    os_unfair_lock_unlock(&self->_lightweightMigrationLock);
  }
  else
  {
    unint64_t v11 = [(PLMomentGenerationDataManager *)self momentGenerationLibrary];
    id v12 = v11;
    if (v8) {
      [v11 performTransactionAndWait:v13 completionHandler:v10];
    }
    else {
      [v11 performTransaction:v13 completionHandler:v10 withPriority:a5];
    }
  }
}

- (void)performDataTransaction:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)performBlock:(id)a3 synchronously:(BOOL)a4 priority:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  long long v13 = (void (**)(void))a3;
  uint64_t v10 = (void (**)(void))a6;
  if (self->_isLightweightMigrationManager)
  {
    os_unfair_lock_lock(&self->_lightweightMigrationLock);
    if (v13) {
      v13[2](v13);
    }
    if (v10) {
      v10[2](v10);
    }
    os_unfair_lock_unlock(&self->_lightweightMigrationLock);
  }
  else
  {
    unint64_t v11 = [(PLMomentGenerationDataManager *)self momentGenerationLibrary];
    id v12 = v11;
    if (v8) {
      [v11 performBlockAndWait:v13 completionHandler:v10];
    }
    else {
      [v11 performBlock:v13 completionHandler:v10 withPriority:a5];
    }
  }
}

- (void)performBlock:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
}

- (NSManagedObjectContext)managedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext)
  {
    char v3 = managedObjectContext;
  }
  else
  {
    id v4 = [(PLMomentGenerationDataManager *)self momentGenerationLibrary];
    char v3 = [v4 managedObjectContext];
  }
  return v3;
}

- (PLPhotoLibrary)momentGenerationLibrary
{
  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PLMomentGenerationDataManager.m" lineNumber:177 description:@"Unsupported platform"];
  }
  if (self->_isLightweightMigrationManager)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PLMomentGenerationDataManager.m" lineNumber:178 description:@"Moment Generation attempted to set up a photolibrary during lightweight migration"];
  }
  p_libraryServicesManager = &self->_libraryServicesManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLMomentGenerationDataManager.m", 179, @"Invalid parameter not satisfying: %@", @"_libraryServicesManager" object file lineNumber description];
  }
  id v6 = self;
  objc_sync_enter(v6);
  if (!v6->_momentGenerationLibrary)
  {
    id v7 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    BOOL v8 = [v7 databaseContext];
    uint64_t v9 = [v8 momentLibrary];
    momentGenerationLibrary = v6->_momentGenerationLibrary;
    v6->_momentGenerationLibrary = (PLPhotoLibrary *)v9;

    unint64_t v11 = v6->_momentGenerationLibrary;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__PLMomentGenerationDataManager_momentGenerationLibrary__block_invoke;
    v17[3] = &unk_1E5875CE0;
    v17[4] = v6;
    [(PLPhotoLibrary *)v11 performBlockAndWait:v17];
  }
  objc_sync_exit(v6);

  id v12 = v6->_momentGenerationLibrary;
  return v12;
}

void __56__PLMomentGenerationDataManager_momentGenerationLibrary__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 112) managedObjectContext];
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:v1];
}

- (void)invalidateAllHighlightSubtitles
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v4 = +[PLPhotosHighlight entity];
  int v5 = (void *)[v3 initWithEntity:v4];

  long long v17 = @"subtitle";
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v18[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [v5 setPropertiesToUpdate:v7];

  [v5 setResultType:2];
  BOOL v8 = [(PLMomentGenerationDataManager *)self momentGenerationLibrary];
  uint64_t v9 = [v8 managedObjectContext];
  id v14 = 0;
  uint64_t v10 = [v9 executeRequest:v5 error:&v14];
  id v11 = v14;

  id v12 = PLMomentsGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [v10 result];
    *(_DWORD *)buf = 138412290;
    long long v16 = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Invalidate all titles for %@ Highlights", buf, 0xCu);
  }
}

- (id)generator
{
  return self->_generator;
}

- (void)reloadGenerationOptions
{
  if (PLIsAssetsd() && MEMORY[0x19F38BDA0]())
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v4 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.mobileslideshow"];
    id v7 = (id)[v3 initWithSuiteName:v4];

    int v5 = [v7 objectForKey:@"MomentGenerationOptionsDictionary"];
    generationOptions = self->_generationOptions;
    self->_generationOptions = v5;
  }
}

- (void)_finalizeInit
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_shouldPerformLightweightValidation = [v3 BOOLForKey:@"com.apple.photos.validation.performLightweightValidation"];

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_previousValidatedModelVersion = [v4 integerForKey:@"com.apple.photos.validation.previousValidatedModelVersion"];

  int v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_previousValidationSucceeded = [v5 BOOLForKey:@"com.apple.photos.validation.previousValidationSucceeded"];

  id v6 = objc_alloc_init(PLCameraAppWatcher);
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v6;
}

- (void)_initIsolationQueue
{
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  pl_dispatch_queue_create_with_fallback_qos();
  id v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  self->_isolationQueue = v3;
}

- (PLMomentGenerationDataManager)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLMomentGenerationDataManager;
  id v5 = [(PLMomentGenerationDataManager *)&v13 init];
  if (PLPlatformMomentsSupported())
  {
    if (v5)
    {
      [(PLMomentGenerationDataManager *)v5 _initIsolationQueue];
      objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
      [(PLMomentGenerationDataManager *)v5 reloadGenerationOptions];
      id v6 = [PLMomentGeneration alloc];
      id v7 = [v4 libraryBundle];
      uint64_t v8 = [(PLMomentGeneration *)v6 initWithMomentGenerationDataManager:v5 bundle:v7];
      generator = v5->_generator;
      v5->_generator = (PLMomentGeneration *)v8;

      uint64_t v10 = [[PLRoutineService alloc] initWithFetchDateInterval:0];
      routineManager = v5->_routineManager;
      v5->_routineManager = v10;

      [(PLMomentGenerationDataManager *)v5 _finalizeInit];
    }
  }
  else
  {

    id v5 = 0;
  }

  return v5;
}

- (PLMomentGenerationDataManager)initWithManagedObjectContext:(id)a3 pathManagerForLightweightMigration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLMomentGenerationDataManager;
  uint64_t v8 = [(PLMomentGenerationDataManager *)&v17 init];
  if (!PLPlatformMomentsSupported())
  {
    id v11 = v8;
    uint64_t v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    [(PLMomentGenerationDataManager *)v8 _initIsolationQueue];
    v8->_isLightweightMigrationManager = 1;
    v8->_lightweightMigrationLock._os_unfair_lock_opaque = 0;
    [(PLMomentGenerationDataManager *)v8 setMomentGenerationLibrary:0];
    [(PLMomentGenerationDataManager *)v8 setManagedObjectContext:v6];
    objc_opt_class();
    id v9 = v6;
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    id v12 = [PLMomentGeneration alloc];
    objc_super v13 = [(PLMomentGenerationDataManager *)v11 pl_libraryBundle];
    uint64_t v14 = [(PLMomentGeneration *)v12 initWithMomentGenerationDataManager:v8 bundle:v13];
    generator = v8->_generator;
    v8->_generator = (PLMomentGeneration *)v14;

    objc_storeStrong((id *)&v8->_lightWeightMigrationPathManager, a4);
    [(PLMomentGenerationDataManager *)v8 _finalizeInit];
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

+ (id)processingMomentsFromMoments:(id)a3
{
  return (id)objc_msgSend(a3, "_pl_map:", &__block_literal_global_196_32062);
}

PLMomentProcessingData *__62__PLMomentGenerationDataManager_processingMomentsFromMoments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PLMomentProcessingData alloc] initWithMoment:v2];

  return v3;
}

+ (BOOL)isManagedObjectContextMomentarilyBlessed:(id)a3
{
  id v5 = a3;
  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"PLMomentGenerationDataManager.m" lineNumber:278 description:@"Unsupported platform"];
  }
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKey:@"MomentarilyBlessed"];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (void)setManagedObjectContextMomentarilyBlessed:(id)a3
{
  id v3 = [a3 userInfo];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"MomentarilyBlessed"];
}

+ (void)setManagerMomentarilyBlessed:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PLMomentGenerationDataManager.m" lineNumber:265 description:@"Passed in incorrect data manager class"];
  }
  if ((PLPlatformMomentsSupported() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"PLMomentGenerationDataManager.m" lineNumber:266 description:@"Unsupported platform"];
  }
  id v5 = [v8 managedObjectContext];
  [a1 setManagedObjectContextMomentarilyBlessed:v5];
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PLMomentGenerationDataManager;
  objc_msgSendSuper2(&v3, sel_initialize);
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 registerDefaults:&unk_1EEBF2900];
}

@end