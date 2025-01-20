@interface PXDiscoveryFeedDataSourceManager
- (PXDiscoveryFeedDataSourceManager)init;
- (PXDiscoveryFeedDataSourceManager)initWithPhotoLibrary:(id)a3;
- (id)_requestMemoryWithCount:(int64_t)a3 beforeDate:(id)a4;
- (id)createInitialDataSource;
- (void)_handleMoreContentLoadedWithDataSource:(id)a3;
- (void)_loadMoreContentWithCompletionHandler:(id)a3;
- (void)loadMoreContentWithCompletionHandler:(id)a3;
@end

@implementation PXDiscoveryFeedDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)_requestMemoryWithCount:(int64_t)a3 beforeDate:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  photoLibrary = self->_photoLibrary;
  id v6 = a4;
  v7 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
  [v7 setWantsIncrementalChangeDetails:0];
  [v7 setIncludePendingMemories:1];
  [v7 setFetchLimit:a3];
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v7 setSortDescriptors:v10];

  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@", v6];

  [v7 setPredicate:v11];
  v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v7];

  return v12;
}

- (id)createInitialDataSource
{
  v3 = [(PXDiscoveryFeedGenerationSession *)self->_session additionaItemsWithTargetCount:5];
  if (![v3 count])
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = [(PXDiscoveryFeedDataSourceManager *)self _requestMemoryWithCount:5 beforeDate:v4];

    v3 = (void *)v5;
  }
  workQueue = self->_workQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __59__PXDiscoveryFeedDataSourceManager_createInitialDataSource__block_invoke;
  v14 = &unk_1E5DD32A8;
  v15 = self;
  id v16 = v3;
  id v7 = v3;
  dispatch_async(workQueue, &v11);
  v8 = [PXDiscoveryFeedDataSource alloc];
  v9 = -[PXDiscoveryFeedDataSource initWithAssetCollections:](v8, "initWithAssetCollections:", v7, v11, v12, v13, v14, v15);

  return v9;
}

void __59__PXDiscoveryFeedDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) fetchedObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;
}

- (void)_handleMoreContentLoadedWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__PXDiscoveryFeedDataSourceManager__handleMoreContentLoadedWithDataSource___block_invoke;
    v6[3] = &unk_1E5DCE4F8;
    id v7 = v4;
    [(PXDiscoveryFeedDataSourceManager *)self performChanges:v6];
  }
  atomic_store(0, (unsigned __int8 *)&self->_hasDispatchedCallToGetAdditionalItems);
}

uint64_t __75__PXDiscoveryFeedDataSourceManager__handleMoreContentLoadedWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDataSource:*(void *)(a1 + 32) changeDetails:0];
}

- (void)_loadMoreContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_assetCollections];
  id v6 = [(PXDiscoveryFeedGenerationSession *)self->_session additionaItemsWithTargetCount:5];
  if ([v6 count])
  {
    id v7 = [v6 fetchedObjects];
    v8 = [v7 firstObject];
    [v5 addObject:v8];

    v9 = [v6 fetchedObjects];
    [v5 addObjectsFromArray:v9];

    v10 = (NSArray *)[v5 copy];
    assetCollections = self->_assetCollections;
    self->_assetCollections = v10;

    id v12 = objc_alloc(MEMORY[0x1E4F39150]);
    v13 = (void *)[v12 initWithObjects:v5 photoLibrary:self->_photoLibrary fetchType:*MEMORY[0x1E4F39668] fetchPropertySets:0 identifier:0 registerIfNeeded:1];
    v14 = [[PXDiscoveryFeedDataSource alloc] initWithAssetCollections:v13];
  }
  else
  {
    v14 = 0;
  }
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PXDiscoveryFeedDataSourceManager__loadMoreContentWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v20, &location);
  v18 = v14;
  id v19 = v4;
  id v15 = v4;
  id v16 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __74__PXDiscoveryFeedDataSourceManager__loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleMoreContentLoadedWithDataSource:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)loadMoreContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ((atomic_exchange(&self->_hasDispatchedCallToGetAdditionalItems._Value, 1u) & 1) == 0)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PXDiscoveryFeedDataSourceManager_loadMoreContentWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5DD1848;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async((dispatch_queue_t)self->_workQueue, v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __73__PXDiscoveryFeedDataSourceManager_loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _loadMoreContentWithCompletionHandler:*(void *)(a1 + 32)];
}

- (PXDiscoveryFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDiscoveryFeedDataSourceManager;
  id v6 = [(PXSectionedDataSourceManager *)&v8 init];
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
  }

  return 0;
}

- (PXDiscoveryFeedDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDiscoveryFeedDataSourceManager.m", 37, @"%s is not available as initializer", "-[PXDiscoveryFeedDataSourceManager init]");

  abort();
}

@end