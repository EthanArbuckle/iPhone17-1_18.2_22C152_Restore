@interface BKLibraryAssetPostProcessor
- (BKLibraryAssetPostProcessor)initWithLibraryManager:(id)a3;
- (BKLibraryManager)libraryManager;
- (NSMutableSet)qDownloadingStoreIDs;
- (OS_dispatch_queue)coverImageQueue;
- (OS_dispatch_queue)iVarQueue;
- (id)_libraryAssetsForPostProcessingInManagedObjectContext:(id)a3;
- (void)_postProcess;
- (void)_postProcessExplicitFlagForProductProfiles:(id)a3;
- (void)dealloc;
- (void)ownershipDidChange:(id)a3;
- (void)setCoverImageQueue:(id)a3;
- (void)setIVarQueue:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setQDownloadingStoreIDs:(id)a3;
@end

@implementation BKLibraryAssetPostProcessor

- (BKLibraryAssetPostProcessor)initWithLibraryManager:(id)a3
{
  id v5 = a3;
  v6 = [(BKLibraryAssetPostProcessor *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryManager, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.BKLibraryAssetCoverLoader", v8);
    iVarQueue = v7->_iVarQueue;
    v7->_iVarQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.BKLibraryAssetCoverLoader", v11);
    coverImageQueue = v7->_coverImageQueue;
    v7->_coverImageQueue = (OS_dispatch_queue *)v12;

    v14 = v7->_iVarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4EA44;
    block[3] = &unk_D1520;
    v15 = v7;
    v19 = v15;
    dispatch_sync(v14, block);
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v15 selector:"ownershipDidChange:" name:@"BKLibraryOwnershipDidChangeNotification" object:v7->_libraryManager];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BKLibraryOwnershipDidChangeNotification" object:self->_libraryManager];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAssetPostProcessor;
  [(BKLibraryAssetPostProcessor *)&v4 dealloc];
}

- (void)ownershipDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"BKLibraryOwnershipAssetsKey"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) objectForKeyedSubscript:@"BKLibraryOwnershipOldDatasource"];

        if (!v11)
        {

          [(BKLibraryAssetPostProcessor *)self _postProcess];
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)_postProcessExplicitFlagForProductProfiles:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryAssetPostProcessor *)self libraryManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4ED10;
  v7[3] = &unk_D18D8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 performBlockOnWorkerQueue:v7];
}

- (void)_postProcess
{
  kdebug_trace();
  v3 = [(BKLibraryAssetPostProcessor *)self libraryManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4F0B4;
  v4[3] = &unk_D16B0;
  v4[4] = self;
  [v3 performNamed:@"post-processing" workerQueueBlock:v4];
}

- (id)_libraryAssetsForPostProcessingInManagedObjectContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v5 = +[BKLibraryManager predicateForLibraryAssetsMissingExplicitContentFlag];
  id v6 = +[BKLibraryManager predicateForDownloadableStoreLibraryAssets];
  v12[0] = v5;
  v12[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v12 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  [v4 setResultType:2];
  [v4 setPropertiesToFetch:&off_DA118];
  uint64_t v11 = 0;
  uint64_t v9 = [v3 executeFetchRequest:v4 error:&v11];

  return v9;
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setLibraryManager:(id)a3
{
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
}

- (OS_dispatch_queue)coverImageQueue
{
  return self->_coverImageQueue;
}

- (void)setCoverImageQueue:(id)a3
{
}

- (NSMutableSet)qDownloadingStoreIDs
{
  return self->_qDownloadingStoreIDs;
}

- (void)setQDownloadingStoreIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qDownloadingStoreIDs, 0);
  objc_storeStrong((id *)&self->_coverImageQueue, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);

  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end