@interface PLComputeCachePolicyDataSource
- (BOOL)hasAtLeastExpungedAssetCount:(unint64_t)a3;
- (BOOL)isEnabled;
- (NSDate)lastSnapshotDate;
- (PLComputeCachePolicyDataSource)initWithPhotoLibrary:(id)a3 restoreState:(int64_t)a4;
- (int64_t)restoreState;
- (unint64_t)assetCount;
@end

@implementation PLComputeCachePolicyDataSource

- (void).cxx_destruct
{
}

- (NSDate)lastSnapshotDate
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__48389;
  v15 = __Block_byref_object_dispose__48390;
  id v16 = 0;
  v2 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
  v3 = +[PLComputeCacheManager baseURLFromPathManager:v2];

  v4 = +[PLComputeCacheManager payloadClasses];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLComputeCachePolicyDataSource_lastSnapshotDate__block_invoke;
  v8[3] = &unk_1E586AB48;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDate *)v6;
}

void __50__PLComputeCachePolicyDataSource_lastSnapshotDate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v10 = [[PLJournal alloc] initWithBaseURL:*(void *)(a1 + 32) payloadClass:a2];
  id v6 = [(PLJournal *)v10 metadata];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"snapshotDate"];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (BOOL)hasAtLeastExpungedAssetCount:(unint64_t)a3
{
  if (a3)
  {
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    v4 = self->_photoLibrary;
    id v5 = [(PLPhotoLibrary *)v4 pathManager];
    id v6 = +[PLComputeCacheManager baseURLFromPathManager:v5];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke;
    v18[3] = &unk_1E586AAF8;
    uint64_t v7 = v4;
    v19 = v7;
    v20 = v23;
    v21 = buf;
    unint64_t v22 = a3;
    uint64_t v8 = (void *)MEMORY[0x19F38D650](v18);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_2;
    v14[3] = &unk_1E58753C0;
    id v9 = v6;
    id v15 = v9;
    id v10 = v8;
    id v16 = v10;
    v17 = buf;
    [(PLPhotoLibrary *)v7 performBlockAndWait:v14];
    BOOL v11 = v25[24] != 0;

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "ComputeCachePolicyDataSource: minExpungedAssetCount is set to 0, always report expunged asset", buf, 2u);
    }

    return 1;
  }
  return v11;
}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 assetIdentifiers];
  id v11 = [v6 allObjects];

  uint64_t v7 = [v5 assetIdentifierType];
  uint64_t v8 = [*(id *)(a1 + 32) managedObjectContext];
  if (v7 == 1) {
    unint64_t v9 = +[PLManagedAsset countForAssetsWithCloudAssetGUIDs:v11 includePendingChanges:0 inManagedObjectContext:v8 error:0];
  }
  else {
    unint64_t v9 = +[PLManagedAsset countForAssetsWithUUIDs:v11 includePendingChanges:0 inManagedObjectContext:v8 error:0];
  }
  unint64_t v10 = v9;

  if (v10 < [v11 count]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v11 count] - v10;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 56);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_2(uint64_t a1)
{
  v2 = +[PLComputeCacheManager payloadClasses];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_3;
  v5[3] = &unk_1E586AB20;
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __63__PLComputeCachePolicyDataSource_hasAtLeastExpungedAssetCount___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = [[PLJournal alloc] initWithBaseURL:a1[4] payloadClass:a2];
  uint64_t v8 = a1[5];
  id v13 = 0;
  BOOL v9 = [(PLJournal *)v7 enumeratePayloadsUsingBlock:v8 error:&v13];
  id v10 = v13;
  if (!v9)
  {
    id v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [a2 payloadClassID];
      *(_DWORD *)buf = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "ComputeCachePolicyDataSource: Failed to enumerate %@ journal. Error: %@", buf, 0x16u);
    }
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }
}

- (unint64_t)assetCount
{
  return +[PLManagedAsset iCPLAssetCountInPhotoLibrary:self->_photoLibrary];
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (BOOL)isEnabled
{
  v2 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
  BOOL v3 = +[PLComputeCacheManager isEnabledWithPathManager:v2 error:0];

  return v3;
}

- (PLComputeCachePolicyDataSource)initWithPhotoLibrary:(id)a3 restoreState:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLComputeCachePolicyDataSource.m", 30, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLComputeCachePolicyDataSource;
  BOOL v9 = [(PLComputeCachePolicyDataSource *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_restoreState = a4;
  }

  return v10;
}

@end