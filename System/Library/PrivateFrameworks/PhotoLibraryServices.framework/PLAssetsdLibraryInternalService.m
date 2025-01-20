@interface PLAssetsdLibraryInternalService
- (PLAssetsdLibraryInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4;
- (unint64_t)_assetCountInManagedObjectContext:(id)a3 forSyncedAssets:(BOOL)a4;
- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 reply:(id)a5;
- (void)assetsArePendingForDuplicateMergeProcessing:(id)a3 reply:(id)a4;
- (void)availabilityStateShouldPersist:(BOOL)a3 reply:(id)a4;
- (void)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet;
- (void)clearAvailabilityWithReply:(id)a3;
- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3;
- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 reply:(id)a5;
- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3;
- (void)failAvailabilityWithReply:(id)a3;
- (void)featureProcessingSnapshotWithReply:(id)a3;
- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5;
- (void)getAssetCountsWithReply:(id)a3;
- (void)getBackgroundJobServiceBundlesInQueueDictionaryWithReply:(id)a3;
- (void)getBackgroundJobServiceStateWithReply:(id)a3;
- (void)getBackgroundJobServiceStatusCenterDumpWithReply:(id)a3;
- (void)getLibrarySizesFromDB:(BOOL)a3 reply:(id)a4;
- (void)getSearchIndexProgressWithReply:(id)a3;
- (void)getSizeOfResourcesToUploadByCPLWithReply:(id)a3;
- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 reply:(id)a6;
- (void)invalidateBehavioralScoreOnAllAssetsWithReply:(id)a3;
- (void)invalidateReverseLocationDataOnAllAssetsWithReply:(id)a3;
- (void)markPersonAsNeedingKeyFaceWithPersonUUID:(id)a3 reply:(id)a4;
- (void)mergeDuplicateAssetUuidSelection:(id)a3 reply:(id)a4;
- (void)metricsForLibraryAtURL:(id)a3 reply:(id)a4;
- (void)pauseSearchIndexingWithReply:(id)a3;
- (void)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 reply:(id)a4;
- (void)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 reply:(id)a4;
- (void)reloadMomentGenerationOptions;
- (void)repairMemoriesWithUUIDs:(id)a3 reply:(id)a4;
- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4;
- (void)resumeSearchIndexingWithReply:(id)a3;
- (void)setAssetKeywords:(id)a3 forAssetUUID:(id)a4 reply:(id)a5;
- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6;
- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4;
- (void)signalAvailabilityStateDidChangeWithReply:(id)a3;
- (void)updateAssetLocationDataWithUUID:(id)a3 reply:(id)a4;
- (void)waitForSearchIndexExistenceWithReply:(id)a3;
@end

@implementation PLAssetsdLibraryInternalService

- (void).cxx_destruct
{
}

- (void)signalAvailabilityStateDidChangeWithReply:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v6 = [v5 databaseContext];
  v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService signalAvailabilityStateDidChangeWithReply:]"];

  if (v7)
  {
    v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PLAssetsdLibraryInternalService signalAvailabilityStateDidChangeWithReply:]";
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%s - will signal background processing needed", buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdLibraryInternalService signalAvailabilityStateDidChangeWithReply:]"];
    v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v11 = [v10 availabilityComputer];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke;
    v16[3] = &unk_1E586F1F0;
    id v17 = v7;
    v18 = self;
    id v19 = v9;
    v12 = v9;
    [v11 onDemandAvailabilityUpdateForPhotoLibrary:v17 completionHandler:v16];
    v4[2](v4, 1, 0);

    v4 = v12;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"No photo library available to signal availability state change";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v11 = [v13 errorWithDomain:v14 code:46502 userInfo:v15];

    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v11);
  }
}

void __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailure])
  {
    v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v3 error];
      int v11 = 136315394;
      v12 = "-[PLAssetsdLibraryInternalService signalAvailabilityStateDidChangeWithReply:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "%s - on-demand update failed with error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [a1[4] globalValues];
  [v7 setDateOfLastExternalAvailabilitySignal:v6];

  v8 = [a1[5] libraryServicesManager];
  v9 = [v8 backgroundJobService];

  v10 = [a1[4] libraryBundle];
  [v9 signalBackgroundProcessingNeededOnBundle:v10];

  [a1[6] stillAlive];
}

- (void)failAvailabilityWithReply:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v6 = [v5 databaseContext];
  v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService failAvailabilityWithReply:]"];

  if (v7)
  {
    v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v9 = [v8 availabilityComputer];

    id v15 = 0;
    uint64_t v10 = [v9 failAvailabilityForPhotoLibrary:v7 error:&v15];
    id v11 = v15;
    v4[2](v4, v10, v11);

    v4 = (void (**)(id, uint64_t, id))v11;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"No photo library available to simulate  availability job failure";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v9 = [v12 errorWithDomain:v13 code:46502 userInfo:v14];

    v4[2](v4, 0, v9);
  }
}

- (void)clearAvailabilityWithReply:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v6 = [v5 databaseContext];
  v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService clearAvailabilityWithReply:]"];

  if (v7)
  {
    v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v9 = [v8 availabilityComputer];

    id v15 = 0;
    uint64_t v10 = [v9 clearAvailabilityStateForPhotoLibrary:v7 error:&v15];
    id v11 = v15;
    v4[2](v4, v10, v11);

    v4 = (void (**)(id, uint64_t, id))v11;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"No photo library available to clear availability";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v9 = [v12 errorWithDomain:v13 code:46502 userInfo:v14];

    v4[2](v4, 0, v9);
  }
}

- (void)availabilityStateShouldPersist:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v8 = [v7 databaseContext];
  v9 = (void *)[v8 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService availabilityStateShouldPersist:reply:]"];

  if (v9)
  {
    uint64_t v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v11 = [v10 availabilityComputer];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PLAssetsdLibraryInternalService_availabilityStateShouldPersist_reply___block_invoke;
    v15[3] = &unk_1E586F0F0;
    id v16 = v6;
    [v11 computeAvailabilityForPhotoLibrary:v9 shouldPersist:v4 completionHandler:v15];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"No photo library available for availability computation";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v11 = [v12 errorWithDomain:v13 code:46502 userInfo:v14];

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
  }
}

void __72__PLAssetsdLibraryInternalService_availabilityStateShouldPersist_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFailure])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [v3 error];

    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v6);
  }
  else
  {
    v5 = [v3 result];

    id v6 = [v5 dictionary];

    (*(void (**)(void, id, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, 0);
  }
}

- (void)featureProcessingSnapshotWithReply:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v6 = [v5 databaseContext];
  v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService featureProcessingSnapshotWithReply:]"];

  if (v7)
  {
    v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v9 = [v8 availabilityComputer];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PLAssetsdLibraryInternalService_featureProcessingSnapshotWithReply___block_invoke;
    v13[3] = &unk_1E586F0F0;
    id v14 = v4;
    [v9 computeSnapshotForPhotoLibrary:v7 completionHandler:v13];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"No photo library available for processing snapshot computation";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v9 = [v10 errorWithDomain:v11 code:46502 userInfo:v12];

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __70__PLAssetsdLibraryInternalService_featureProcessingSnapshotWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFailure])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [v3 error];

    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v6);
  }
  else
  {
    v5 = [v3 result];

    id v6 = [v5 dictionary];

    (*(void (**)(void, id, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6, 0);
  }
}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v12 = [v11 searchIndexManager];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PLAssetsdLibraryInternalService_deleteEmbeddings_assetUUID_reply___block_invoke;
  v14[3] = &unk_1E5875198;
  id v15 = v8;
  id v13 = v8;
  [v12 deleteEmbeddings:v10 assetUUID:v9 completion:v14];
}

uint64_t __68__PLAssetsdLibraryInternalService_deleteEmbeddings_assetUUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v14 = [v13 searchIndexManager];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __78__PLAssetsdLibraryInternalService_insertEmbeddings_modelType_assetUUID_reply___block_invoke;
  v16[3] = &unk_1E5875198;
  id v17 = v10;
  id v15 = v10;
  [v14 insertEmbeddings:v12 modelType:a4 assetUUID:v11 completion:v16];
}

uint64_t __78__PLAssetsdLibraryInternalService_insertEmbeddings_modelType_assetUUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mergeDuplicateAssetUuidSelection:(id)a3 reply:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v9 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:v8];

  if (v9)
  {
    id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v11 = [v10 duplicateProcessor];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __74__PLAssetsdLibraryInternalService_mergeDuplicateAssetUuidSelection_reply___block_invoke;
    v16[3] = &unk_1E5874DE8;
    id v17 = v7;
    [v11 mergeDuplicateAssetsWithAssetUUIDs:v6 completionHandler:v16];

    id v12 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"invalid duplicate processing library";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v12 = [v13 errorWithDomain:v14 code:49401 userInfo:v15];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __74__PLAssetsdLibraryInternalService_mergeDuplicateAssetUuidSelection_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)assetsArePendingForDuplicateMergeProcessing:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v9 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:v8];

  if (v9)
  {
    id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v11 = [v10 duplicateProcessor];
    uint64_t v12 = [v11 assetsArePendingForDuplicateMergeProcessing:v6];

    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v15 = [v14 libraryURL];
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Duplicate processing is not supported for library URL: %@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v12 = 0;
  if (v7) {
LABEL_7:
  }
    v7[2](v7, v12);
LABEL_8:
}

- (void)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v8 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:v7];

  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:0];
    uint64_t v11 = 0;
    if (!v6) {
      goto LABEL_8;
    }
LABEL_7:
    v6[2](v6, v11, v12);
    goto LABEL_8;
  }
  if (a3 >= 7) {
    a3 = 7;
  }
  BOOL v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v10 = [v9 duplicateProcessor];
  id v13 = 0;
  uint64_t v11 = [v10 processDuplicatesOfAssetObjectIds:0 processingType:a3 error:&v13 continuationHandler:0];
  id v12 = v13;

  if (v6) {
    goto LABEL_7;
  }
LABEL_8:
}

- (unint64_t)_assetCountInManagedObjectContext:(id)a3 forSyncedAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v7 = +[PLManagedAsset entityName];
  BOOL v8 = [v5 fetchRequestWithEntityName:v7];

  BOOL v9 = (void *)MEMORY[0x1E4F8BA10];
  uint64_t v10 = [MEMORY[0x1E4F8BA10] maskForFinderSyncedAsset];
  if (v4) {
    [v9 predicateForIncludeMask:v10 useIndex:1];
  }
  else {
  uint64_t v11 = [v9 predicateForExcludeMask:v10 useIndex:1];
  }
  [v8 setPredicate:v11];
  id v16 = 0;
  unint64_t v12 = [v6 countForFetchRequest:v8 error:&v16];

  id v13 = v16;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Error getting asset count: %{public}@", buf, 0xCu);
    }

    unint64_t v12 = 0;
  }

  return v12;
}

- (void)metricsForLibraryAtURL:(id)a3 reply:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v39 = (void (**)(id, void *, id))a4;
  id v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ begin", buf, 0xCu);
  }

  BOOL v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v9 = [v8 libraryBundle];
  uint64_t v10 = [v9 bundleController];
  v42 = [v10 openBundleAtLibraryURL:v6];

  uint64_t v11 = [PLPhotoLibraryOpener alloc];
  unint64_t v12 = [v42 libraryServicesManager];
  v40 = [(PLPhotoLibraryOpener *)v11 initWithLibraryServicesManager:v12 reportInProgressUpgrades:0];

  id v77 = 0;
  BOOL v13 = [(PLPhotoLibraryOpener *)v40 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:0 error:&v77];
  v41 = (__CFString *)v77;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  if (v13)
  {
    uint64_t v14 = [v42 libraryServicesManager];
    id v15 = [v14 databaseContext];
    id v16 = (void *)[v15 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService metricsForLibraryAtURL:reply:]"];

    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke;
    v65[3] = &unk_1E5874900;
    v67 = &v73;
    v65[4] = self;
    id v17 = v16;
    id v66 = v17;
    v68 = &v69;
    [v17 performBlockAndWait:v65];
  }
  id v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ filesystem calculation begin", buf, 0xCu);
  }

  if (v13)
  {
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__75652;
    *(void *)&buf[32] = __Block_byref_object_dispose__75653;
    id v86 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_91;
    v56[3] = &unk_1E586F1A0;
    v56[4] = &v61;
    v56[5] = &v57;
    v56[6] = buf;
    int v38 = [v42 calculateTotalSizeWithResult:v56];
    if ((v38 & 1) == 0)
    {
      uint64_t v19 = (__CFString *)*(id *)(*(void *)&buf[8] + 40);

      v41 = v19;
    }
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    id v37 = v6;
    if (v38)
    {
      [v42 pathManager];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      v36 = long long v45 = 0u;
      v20 = [v36 pathsForFinderSyncFilesystemSizeCalculation];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v84 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_2;
            v43[3] = &unk_1E586F1C8;
            v43[4] = &v52;
            v43[5] = &v48;
            [MEMORY[0x1E4F8B908] calculateTotalSizeOfFilesAtPath:v24 calculatePurgeable:1 allocatedSize:0 result:v43];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v84 count:16];
        }
        while (v21);
      }
    }
    v82[0] = @"Photo";
    v80[0] = @"_Count";
    v25 = [NSNumber numberWithUnsignedInteger:v74[3]];
    v81[0] = v25;
    v80[1] = @"_PhysicalSize";
    v26 = [NSNumber numberWithUnsignedLongLong:v53[3]];
    v81[1] = v26;
    v80[2] = @"_PurgeableSize";
    v27 = [NSNumber numberWithUnsignedLongLong:v49[3]];
    v81[2] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
    v83[0] = v28;
    v82[1] = @"CameraRoll";
    v78[0] = @"_Count";
    v29 = [NSNumber numberWithUnsignedInteger:v70[3]];
    v79[0] = v29;
    v78[1] = @"_PhysicalSize";
    v30 = [NSNumber numberWithUnsignedLongLong:v62[3] - v53[3]];
    v79[1] = v30;
    v78[2] = @"_PurgeableSize";
    v31 = [NSNumber numberWithUnsignedLongLong:v58[3] - v49[3]];
    v79[2] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
    v83[1] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];

    id v6 = v37;
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    v33 = 0;
    int v38 = 0;
  }
  v34 = PLBackendGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = &stru_1EEB2EB80;
    *(_DWORD *)buf = 138413058;
    if (v41) {
      v35 = v41;
    }
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v38;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v35;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v33;
    _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ success?%d %@ %@", buf, 0x26u);
  }

  v39[2](v39, v33, v41);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
}

void __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 _assetCountInManagedObjectContext:v3 forSyncedAssets:1];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 _assetCountInManagedObjectContext:v5 forSyncedAssets:0];
}

void __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_91(void *a1, int a2, uint64_t a3, int a4, uint64_t a5, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

uint64_t __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) += a5;
  return result;
}

- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void, id))a3;
  id v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v6 = [v5 databaseContext];
  id v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService coreAnalyticsLibrarySummaryDataWithCompletionHandler:]"];

  BOOL v8 = [PLLibraryContentsEnumerator alloc];
  BOOL v9 = [v7 managedObjectContext];
  uint64_t v10 = [(PLLibraryContentsEnumerator *)v8 initWithSourceManagedObjectContext:v9 concurrent:0];

  id v27 = 0;
  uint64_t v11 = (void *)PLCreateShortLivedWellKnownPhotoLibrary(3, (uint64_t)"-[PLAssetsdLibraryInternalService coreAnalyticsLibrarySummaryDataWithCompletionHandler:]", &v27);
  id v24 = v27;
  if (v11)
  {
    unint64_t v12 = [PLLibraryContentsEnumerator alloc];
    BOOL v13 = [v11 managedObjectContext];
    uint64_t v14 = [(PLLibraryContentsEnumerator *)v12 initWithSourceManagedObjectContext:v13 concurrent:0];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v17 = [v7 isCloudPhotoLibraryEnabled];
  +[PLAggdLogging configureEnumeratorForLibrarySizeLogging:v10 cloudPhotoLibraryEnabled:v17 dataForCA:v15 dataForCK:v16];
  +[PLAggdLogging configureEnumeratorForHyperionLocalResourcesLogging:v10 cloudPhotoLibraryEnabled:v17 dataForCA:v15 dataForCK:v16];
  id v18 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  +[PLAggdLogging configureEnumeratorForLibrarySummaryForLibraryEnumerator:v10 withSyndicationLibraryEnumerator:v14 cloudPhotoLibraryEnabled:v17 dataForCA:v15 libraryServicesManager:v18];

  id v26 = 0;
  uint64_t v19 = [(PLLibraryContentsEnumerator *)v10 processObjectsWithError:&v26];
  id v20 = v26;
  uint64_t v21 = v20;
  if (v19 && v14)
  {
    id v25 = v20;
    uint64_t v19 = [(PLLibraryContentsEnumerator *)v14 processObjectsWithError:&v25];
    id v22 = v25;

    uint64_t v21 = v22;
  }
  if (v4)
  {
    if (v19) {
      v23 = 0;
    }
    else {
      v23 = v21;
    }
    ((void (**)(id, uint64_t, void *, id))v4)[2](v4, v19, v23, v15);
  }
}

- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = +[PLBackgroundJobCriteria criteriaWithKnownShortCode:v9];
  if (!v11)
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    id v26 = [NSString stringWithFormat:@"Criteria short code not found: %@", v9];
    v57[0] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    unint64_t v12 = [v24 errorWithDomain:v25 code:41001 userInfo:v27];

    v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v12;
LABEL_12:
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
    }
LABEL_13:

    v10[2](v10, 0, v12);
    goto LABEL_25;
  }
  if (!v8)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F8C500];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    v31 = [NSString stringWithFormat:@"Library path is nil"];
    v49 = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    unint64_t v12 = [v29 errorWithDomain:v30 code:41001 userInfo:v32];

    v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  unint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  BOOL v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v14 = [v13 libraryBundle];
  id v15 = [v14 bundleController];
  id v16 = [v15 openBundleAtLibraryURL:v12];

  if (v16)
  {
    uint64_t v17 = [v16 libraryServicesManager];
    id v18 = [v17 backgroundJobService];

    uint64_t v19 = [v18 serviceState];
    if (+[PLBackgroundJobService verifyStateTransitionFromState:v19 toState:6])
    {
      id v20 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v11 name];
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "forceRunBackgroundJobs: Going to force background jobs to run at criteria %@", buf, 0xCu);
      }
      objc_msgSend(v18, "_unregisterActivityIfNeededShouldConsiderDeferring_enqueue:", 0);
      id v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
      v23 = [v11 shortCode];
      [v18 _appendBundleRecordsToProcessingSet:v22 criteriaShortCode:v23];

      [v18 _setRunningCriteria:v11];
      [v18 _startRunningBackgroundJobsWithCriteria:v11];
      v10[2](v10, 1, 0);
    }
    else
    {
      long long v46 = (void *)MEMORY[0x1E4F28C58];
      long long v47 = v16;
      uint64_t v45 = *MEMORY[0x1E4F8C500];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      int v38 = NSString;
      if ((unint64_t)(v19 - 1) > 9) {
        v39 = @"Unknown";
      }
      else {
        v39 = off_1E5868998[v19 - 1];
      }
      v40 = v39;
      v41 = [v38 stringWithFormat:@"BackgroundJobService is not in a valid state for forced running. It may already be in a running state or it has nothing to run. Current state: %@", v40];
      v53 = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      v43 = [v46 errorWithDomain:v45 code:41001 userInfo:v42];

      long long v44 = PLBackendGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v55 = v43;
        _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
      }

      v10[2](v10, 0, v43);
      id v16 = v47;
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F8C500];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v35 = [NSString stringWithFormat:@"Library bundle is unavailable at path: %@", v8];
    uint64_t v51 = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v18 = [v33 errorWithDomain:v34 code:41001 userInfo:v36];

    id v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v18;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
    }

    v10[2](v10, 0, v18);
  }

LABEL_25:
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setWidgetTimelineGeneratedForDisplaySize:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  uint64_t v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  unint64_t v12 = [v11 databaseContext];
  BOOL v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService setWidgetTimelineGeneratedForDisplaySize:completionHandler:]"];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__PLAssetsdLibraryInternalService_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke;
  v20[3] = &unk_1E5874278;
  id v14 = v13;
  id v21 = v14;
  CGFloat v23 = width;
  CGFloat v24 = height;
  id v15 = v7;
  id v22 = v15;
  [v14 performBlock:v20];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    id v16 = PLRequestGetLog();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __94__PLAssetsdLibraryInternalService_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) globalValues];
  objc_msgSend(v2, "setWidgetTimelineGeneratedForDisplaySize:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v32) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetLimitedLibraryAccessForApplication:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  uint64_t v11 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Resetting system photo library limited access filter for %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__75652;
  int v38 = __Block_byref_object_dispose__75653;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  if (v6)
  {
    unint64_t v12 = [MEMORY[0x1E4F8B998] sharedInstance];
    [v12 requestLimitedLibraryPromptForApplicationIdentifier:v6];

    BOOL v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v14 = [v13 databaseContext];
    id v15 = (void *)[v14 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService resetLimitedLibraryAccessForApplication:completionHandler:]"];

    id v16 = [v15 managedObjectContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __93__PLAssetsdLibraryInternalService_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
    v23[3] = &unk_1E5874900;
    id v24 = v6;
    id v17 = v16;
    id v25 = v17;
    long long v26 = &v28;
    p_long long buf = &buf;
    [v17 performBlockAndWait:v23];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:45002 userInfo:0];
    id v15 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v18;
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, *((unsigned __int8 *)v29 + 24), *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    uint64_t v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __93__PLAssetsdLibraryInternalService_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(void *a1)
{
  +[PLLimitedLibraryFetchFilter deleteLimitedLibraryFetchFilterWithApplicationIdentifier:a1[4] inManagedObjectContext:a1[5]];
  v2 = (void *)a1[5];
  id v6 = 0;
  char v3 = [v2 save:&v6];
  id v4 = v6;
  id v5 = v6;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v4);
  }
}

- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  int v13 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v47) = v13;
  if (v13)
  {
    id v14 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v15 = (void *)*((void *)&v47 + 1);
    *((void *)&v47 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v48 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__75652;
  v53 = __Block_byref_object_dispose__75653;
  id v54 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__75652;
  v43[4] = __Block_byref_object_dispose__75653;
  id v44 = 0;
  id v16 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v17 = [v16 databaseContext];
  uint64_t v18 = (void *)[v17 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:]"];

  uint64_t v19 = +[PLLimitedLibraryFetchFilter fetchFilterIdentifierForApplicationIdentifier:v11];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke;
  v35[3] = &unk_1E586F140;
  id v36 = v19;
  long long v20 = *(_OWORD *)&a5->var0[4];
  long long v41 = *(_OWORD *)a5->var0;
  long long v42 = v20;
  id v21 = v18;
  id v37 = v21;
  id v22 = v10;
  id v38 = v22;
  id v39 = v45;
  uint64_t v40 = v43;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2;
  v29[3] = &unk_1E586F178;
  long long v32 = v45;
  long long v33 = v43;
  id v23 = v36;
  id v30 = v23;
  id v24 = v12;
  id v31 = v24;
  p_long long buf = &buf;
  [v21 performTransaction:v35 completionHandler:v29];

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v47) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v48 + 8));
  }
  if ((void)v48)
  {
    id v25 = PLRequestGetLog();
    long long v26 = v25;
    os_signpost_id_t v27 = v48;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(*((SEL *)&v49 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) managedObjectContext];
  long long v4 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v4;
  id v5 = +[PLLimitedLibraryFetchFilter fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:v2 auditToken:v9 inManagedObjectContext:v3];

  [v5 removeAllAssets];
  if ([*(id *)(a1 + 48) count]) {
    [v5 addAssetsWithUUIDs:*(void *)(a1 + 48)];
  }
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v6 = [v5 objectID];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v4 = a1[4];
    uint64_t v7 = @"PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier";
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v2 postNotificationName:@"PLLimitedLibraryFetchFiltersUpdatedNotification" object:v3 userInfo:v5];
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)invalidateBehavioralScoreOnAllAssetsWithReply:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: invalidateBehavioralScoreOnAllAssetsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__75652;
  id v30 = __Block_byref_object_dispose__75653;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v9 = [v8 databaseContext];
  id v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService invalidateBehavioralScoreOnAllAssetsWithReply:]"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __81__PLAssetsdLibraryInternalService_invalidateBehavioralScoreOnAllAssetsWithReply___block_invoke;
  v16[3] = &unk_1E5875A90;
  uint64_t v18 = &v20;
  id v11 = v10;
  id v17 = v11;
  p_long long buf = &buf;
  [v11 performTransactionAndWait:v16];
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v21 + 24), *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v12 = PLRequestGetLog();
    int v13 = v12;
    os_signpost_id_t v14 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __81__PLAssetsdLibraryInternalService_invalidateBehavioralScoreOnAllAssetsWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = +[PLManagedAsset invalidateBehavioralScoreOnAllAssetsInManagedObjectContext:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: deleteiTunesSyncedContentWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 databaseContext];
  int v8 = (void *)[v7 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService deleteiTunesSyncedContentWithCompletionHandler:]"];

  [v8 deleteITunesSyncedContentForEnablingiCPL];
  v4[2](v4, 1, 0);

  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  BOOL v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 backgroundJobService];

  [v5 _removeAllBundlesFromProcessingSet];
  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    uint64_t v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getBackgroundJobServiceBundlesInQueueDictionaryWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getBackgroundJobServiceBundlesInQueueDictionaryWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 backgroundJobService];

  int v8 = [v7 _bundlesToProcessByCriteriaShortCodesAsPathStrings];
  v4[2](v4, v8);

  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    long long v9 = PLRequestGetLog();
    char v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getBackgroundJobServiceStatusCenterDumpWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getBackgroundJobServiceStatusCenterDumpWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 backgroundJobService];

  int v8 = [v7 statusCenterDump];
  v4[2](v4, v8);

  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    long long v9 = PLRequestGetLog();
    char v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getBackgroundJobServiceStateWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t))a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getBackgroundJobServiceStateWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 backgroundJobService];

  v4[2](v4, [v7 serviceState]);
  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    int v8 = PLRequestGetLog();
    long long v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, BOOL, void *))a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: registerBackgroundJobServiceIfNecessaryOnLibraryPath:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  long long v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v6, 1, (void)v19);
  char v10 = +[PLPhotoLibraryBundleController sharedBundleController];
  long long v11 = [v10 bundleForLibraryURL:v9];

  if (v11)
  {
    char v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v13 = [v12 backgroundJobService];

    [v13 signalBackgroundProcessingNeededOnBundle:v11];
    long long v14 = 0;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    long long v24 = @"Bundle at path not found";
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    long long v14 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v13];
  }

  v7[2](v7, v11 != 0, v14);
  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    id v16 = PLRequestGetLog();
    uint64_t v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)invalidateReverseLocationDataOnAllAssetsWithReply:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: invalidateReverseLocationDataOnAllAssetsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__75652;
  id v30 = __Block_byref_object_dispose__75653;
  id v31 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v9 = [v8 databaseContext];
  char v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService invalidateReverseLocationDataOnAllAssetsWithReply:]"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __85__PLAssetsdLibraryInternalService_invalidateReverseLocationDataOnAllAssetsWithReply___block_invoke;
  v16[3] = &unk_1E5875A90;
  uint64_t v18 = &v20;
  id v11 = v10;
  id v17 = v11;
  p_long long buf = &buf;
  [v11 performTransactionAndWait:v16];
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v21 + 24), *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    char v12 = PLRequestGetLog();
    long long v13 = v12;
    os_signpost_id_t v14 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __85__PLAssetsdLibraryInternalService_invalidateReverseLocationDataOnAllAssetsWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = +[PLManagedAsset invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)setAssetKeywords:(id)a3 forAssetUUID:(id)a4 reply:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v34 = 0u;
  *(_OWORD *)sel = 0u;
  long long v33 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v33) = v11;
  if (v11)
  {
    char v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setAssetKeywords:forAssetUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v13 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  os_signpost_id_t v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v15 = [v14 databaseContext];
  id v16 = (void *)[v15 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService setAssetKeywords:forAssetUUID:reply:]"];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke;
  v28[3] = &unk_1E5875368;
  p_long long buf = &buf;
  id v17 = v16;
  id v29 = v17;
  id v18 = v8;
  id v30 = v18;
  id v19 = v9;
  id v31 = v19;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke_2;
  v25[3] = &unk_1E5870D98;
  id v20 = v10;
  id v26 = v20;
  uint64_t v27 = &buf;
  [v17 performTransaction:v28 completionHandler:v25];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    long long v21 = PLRequestGetLog();
    uint64_t v22 = v21;
    os_signpost_id_t v23 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) keywordManager];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) managedObjectContext];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 setKeywords:v3 forAssetUUID:v2 managedObjectContext:v4];
}

uint64_t __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 reply:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v46 = 0u;
  *(_OWORD *)sel = 0u;
  long long v45 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v45) = v11;
  if (v11)
  {
    char v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: applyGraphUpdates:supportingData:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v13 = (void *)*((void *)&v45 + 1);
    *((void *)&v45 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v46 + 8));
  }
  os_signpost_id_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  id v20 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
  long long v21 = +[PLZeroKeywordStore expectedClasses];
  uint64_t v22 = [v20 setByAddingObjectsFromSet:v21];

  id v44 = 0;
  os_signpost_id_t v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v22 fromData:v9 error:&v44];
  long long v24 = (char *)v44;
  if (!v23)
  {
    long long v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v53 = v24;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Search Indexing [Graph]: Unable to unarchive supportingData dictionary from data with error: %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    id v26 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    int v27 = [v26 isSearchIndexingEnabled];

    if (v27)
    {
      uint64_t v28 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v29 = [v28 searchIndexManager];

      id v30 = PLBackendGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [v8 count];
        uint64_t v32 = [v23 count];
        *(_DWORD *)long long buf = 138412802;
        v53 = v29;
        __int16 v54 = 2048;
        uint64_t v55 = v31;
        __int16 v56 = 2048;
        uint64_t v57 = v32;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_INFO, "Search Indexing [Graph]: Search index manager: %@ will apply graph updates with a count of %lu and a supporting data with a count of %lu", buf, 0x20u);
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __74__PLAssetsdLibraryInternalService_applyGraphUpdates_supportingData_reply___block_invoke;
      v42[3] = &unk_1E5875198;
      id v43 = v10;
      [v29 applyGraphUpdates:v8 supportingData:v23 completion:v42];
      long long v33 = v43;
    }
    else
    {
      id v36 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        v53 = "-[PLAssetsdLibraryInternalService applyGraphUpdates:supportingData:reply:]";
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Search Indexing [Graph]: Search index manager disabled, unable to perform operation %s", buf, 0xCu);
      }

      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      uint64_t v51 = @"search indexer not enabled";
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      long long v33 = [v37 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v29];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v33);
    }
  }
  else
  {
    long long v34 = PLBackendGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Search Indexing [Graph]: Search index manager is unable to get graphUpdates dictionary", buf, 2u);
    }

    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    long long v49 = @"graphUpdates cannot be nil";
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    long long v33 = [v35 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v29];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v33);
  }

  if ((_BYTE)v45) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v46 + 8));
  }
  if ((void)v46)
  {
    char v38 = PLRequestGetLog();
    uint64_t v39 = v38;
    os_signpost_id_t v40 = v46;
    if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v53 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v39, OS_SIGNPOST_INTERVAL_END, v40, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __74__PLAssetsdLibraryInternalService_applyGraphUpdates_supportingData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pauseSearchIndexingWithReply:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v16 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v16) = v5;
  if (v5)
  {
    *((void *)&v16 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: pauseSearchIndexingWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 isSearchIndexingEnabled];

  if (v7)
  {
    if (_os_feature_enabled_impl())
    {
      id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v9 = [v8 searchIndexingEngine];
      [v9 pauseSearchIndexRebuildWithSourceName:@"Service request"];

      v4[2](v4, 1, 0);
      goto LABEL_14;
    }
    int v11 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v21 = "-[PLAssetsdLibraryInternalService pauseSearchIndexingWithReply:]";
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unsupported when PhotosSearchBackgroundJobWorker is disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v21 = "-[PLAssetsdLibraryInternalService pauseSearchIndexingWithReply:]";
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
LABEL_13:
      char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v12);
    }
  }
LABEL_14:
  if (v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    long long v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resumeSearchIndexingWithReply:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v25) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resumeSearchIndexingWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      int v11 = [v10 databaseContext];
      char v12 = (void *)[v11 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]"];

      long long v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      os_signpost_id_t v14 = [v13 searchIndexingEngine];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke;
      v22[3] = &unk_1E586F118;
      v22[4] = self;
      id v15 = v12;
      id v23 = v15;
      id v24 = v4;
      [v14 resumeSearchIndexRebuildIfNeededForLibrary:v15 calledBy:@"Service request" completion:v22];

LABEL_14:
      goto LABEL_15;
    }
    char v17 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v29 = "-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]";
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unsupported when PhotosSearchBackgroundJobWorker is disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
LABEL_13:
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v15);
      goto LABEL_14;
    }
  }
  else
  {
    long long v16 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v29 = "-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]";
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4) {
      goto LABEL_13;
    }
  }
LABEL_15:
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    long long v18 = PLRequestGetLog();
    uint64_t v19 = v18;
    os_signpost_id_t v20 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuccess])
  {
    id v4 = [*(id *)(a1 + 32) libraryServicesManager];
    int v5 = [v4 searchIndexingEngine];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke_2;
    v10[3] = &unk_1E586F0F0;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v5 resumeProcessingIncrementalUpdatesInLibrary:v6 completion:v10];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = [v3 isSuccess];
      int v9 = [v3 error];
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v9);
    }
  }
}

void __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    uint64_t v4 = [v3 isSuccess];
    id v5 = [v3 error];

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)waitForSearchIndexExistenceWithReply:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: waitForSearchIndexExistenceWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  uint64_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v11 = [v10 searchIndexingEngine];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke;
      v24[3] = &unk_1E586F0F0;
      id v25 = v4;
      [v11 openWithCompletion:v24];

      char v12 = v25;
    }
    else
    {
      long long v16 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      char v17 = [v16 searchIndexManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke_2;
      v22[3] = &unk_1E5875198;
      id v23 = v4;
      [v17 ensureSearchIndexExistsWithCompletionHandler:v22];

      char v12 = v23;
    }
  }
  else
  {
    long long v13 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v32 = "-[PLAssetsdLibraryInternalService waitForSearchIndexExistenceWithReply:]";
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    os_signpost_id_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v30 = @"search indexer not enabled";
    char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v15 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v15);
  }
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    long long v18 = PLRequestGetLog();
    uint64_t v19 = v18;
    os_signpost_id_t v20 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

uint64_t __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSearchIndexProgressWithReply:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getSearchIndexProgressWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  uint64_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v11 = [v10 databaseContext];
      char v12 = (void *)[v11 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService getSearchIndexProgressWithReply:]"];

      long long v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      os_signpost_id_t v14 = [v13 searchIndexingEngine];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke;
      v24[3] = &unk_1E586F0C8;
      id v25 = v4;
      [v14 fetchRemainingWorkWithLibrary:v12 completion:v24];
    }
    else
    {
      long long v16 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      char v17 = [v16 searchIndexManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke_2;
      v22[3] = &unk_1E586F0C8;
      id v23 = v4;
      [v17 enqueuedUUIDsCountWithCompletionHandler:v22];

      char v12 = v23;
    }
  }
  else
  {
    id v15 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v30 = "-[PLAssetsdLibraryInternalService getSearchIndexProgressWithReply:]";
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    (*((void (**)(id, void, void, double))v4 + 2))(v4, 0, 0, 0.0);
  }
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    long long v18 = PLRequestGetLog();
    uint64_t v19 = v18;
    os_signpost_id_t v20 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markPersonAsNeedingKeyFaceWithPersonUUID:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v17) = v8;
  if (v8)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: markPersonAsNeedingKeyFaceWithPersonUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  int v9 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v21 = v6;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Marking person with UUID as needing key face: %@", buf, 0xCu);
  }

  id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v11 = [v10 databaseContext];
  char v12 = (void *)[v11 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService markPersonAsNeedingKeyFaceWithPersonUUID:reply:]"];

  long long v13 = +[PLKeyFaceManager sharedInstance];
  [v13 markPersonAsNeedingKeyFace:v6 photoLibrary:v12];

  v7[2](v7, 1, 0);
  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    id v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)reloadMomentGenerationOptions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: reloadMomentGenerationOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  id v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 momentGenerationDataManager];
  [v5 reloadGenerationOptions];

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    uint64_t v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)repairMemoriesWithUUIDs:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    long long v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: repairMemoriesWithUUIDs:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    char v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  long long v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  char v12 = [v11 databaseContext];
  long long v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAssetsdLibraryInternalService repairMemoriesWithUUIDs:reply:]"];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PLAssetsdLibraryInternalService_repairMemoriesWithUUIDs_reply___block_invoke;
  v21[3] = &unk_1E5874868;
  id v14 = v6;
  id v22 = v14;
  id v15 = v13;
  id v23 = v15;
  id v16 = v7;
  id v24 = v16;
  [v15 performTransaction:v21];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    long long v17 = PLRequestGetLog();
    long long v18 = v17;
    os_signpost_id_t v19 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __65__PLAssetsdLibraryInternalService_repairMemoriesWithUUIDs_reply___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v1 = +[PLMemory memoriesWithUUIDs:a1[4] inPhotoLibrary:a1[5]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v18;
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v1);
        }
        int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v9 = [v8 keyAsset];

        if (!v9)
        {
          char v10 = [v8 calculateKeyAsset];
          if (v10)
          {
            [v8 setKeyAsset:v10];
          }
          else
          {
            if (!v4)
            {
              long long v11 = [NSString stringWithFormat:@"couldn't repair the key asset of memory %@ because there's no available replacement", v8];
              char v12 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v23 = v6;
              id v24 = v11;
              long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
              id v4 = [v12 errorWithDomain:v16 code:41001 userInfo:v13];
            }
            id v14 = PLGatekeeperXPCGetLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v22 = v8;
              _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Error repairing key asset of memory: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)updateAssetLocationDataWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v8;
  if (v8)
  {
    long long v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateAssetLocationDataWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    char v10 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService updateAssetLocationDataWithUUID:reply:]");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __73__PLAssetsdLibraryInternalService_updateAssetLocationDataWithUUID_reply___block_invoke;
  v18[3] = &unk_1E5875E18;
  id v12 = v6;
  id v19 = v12;
  id v13 = v11;
  id v20 = v13;
  [v13 performBlockAndWait:v18];
  v7[2](v7, 0);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v14 = PLRequestGetLog();
    id v15 = v14;
    os_signpost_id_t v16 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __73__PLAssetsdLibraryInternalService_updateAssetLocationDataWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v4 = +[PLManagedAsset assetWithUUID:v2 inManagedObjectContext:v3];

  [*(id *)(a1 + 40) modifyDCIMEntryForPhoto:v4];
}

- (void)getSizeOfResourcesToUploadByCPLWithReply:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, BOOL, uint64_t, id))a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v17) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getSizeOfResourcesToUploadByCPLWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v17 + 1);
    *((void *)&v17 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v9 = [v8 cloudPhotoLibraryManager];

  id v16 = 0;
  uint64_t v10 = [v9 sizeOfResourcesToUploadByCPL:&v16];
  id v11 = v16;
  v4[2](v4, v11 == 0, v10, v11);

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    id v12 = PLRequestGetLog();
    id v13 = v12;
    os_signpost_id_t v14 = v18;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getLibrarySizesFromDB:(BOOL)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v25) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getLibrarySizesFromDB:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v9 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  id v10 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService getLibrarySizesFromDB:reply:]");
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__75652;
  uint64_t v31 = __Block_byref_object_dispose__75653;
  id v32 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke;
  v21[3] = &unk_1E58711C8;
  BOOL v24 = a3;
  p_long long buf = &buf;
  id v11 = v10;
  id v22 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke_2;
  v17[3] = &unk_1E586F0A0;
  id v19 = &buf;
  BOOL v20 = a3;
  id v12 = v6;
  id v18 = v12;
  [v11 performBlock:v21 completionHandler:v17];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    id v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 librarySizesFromDB];
  }
  else {
  uint64_t v4 = [v3 estimatedLibrarySizes];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v2 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) description];
      *(_DWORD *)long long buf = 67109378;
      int v13 = v3;
      __int16 v14 = 2114;
      os_signpost_id_t v15 = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "getLibrarySizesFromDB:%d result:%{public}@", buf, 0x12u);
    }
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    id v11 = @"Unable to get library size";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v5 = [v6 errorWithDomain:v7 code:41001 userInfo:v8];

    int v2 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)long long buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2112;
      os_signpost_id_t v15 = v5;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "getLibrarySizesFromDB:%d error %@", buf, 0x12u);
    }
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0);
}

- (void)getAssetCountsWithReply:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v18) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getAssetCountsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService getAssetCountsWithReply:]");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PLAssetsdLibraryInternalService_getAssetCountsWithReply___block_invoke;
  v15[3] = &unk_1E58742F0;
  id v9 = v8;
  id v16 = v9;
  id v10 = v4;
  id v17 = v10;
  [v9 performBlock:v15];

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    id v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __59__PLAssetsdLibraryInternalService_getAssetCountsWithReply___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if ([*(id *)(a1 + 32) getPhotoCount:&v5 videoCount:&v4 excludeTrashed:1 excludeInvisible:1 excludeCloudShared:1])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = @"Unable to get asset counts";
    int v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    int v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (PLAssetsdLibraryInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdLibraryInternalService;
  id v8 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
  }

  return v9;
}

@end