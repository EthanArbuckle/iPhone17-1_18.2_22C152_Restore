@interface BKLibraryIndexer
+ (id)sharedInstance;
+ (void)associateAssetIdentifier:(id)a3 title:(id)a4 isAudiobook:(BOOL)a5 withAttributeSet:(id)a6;
+ (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3;
+ (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3;
+ (void)searchableItemAttributeSetForBook:(id)a3 coverTimeout:(double)a4 completion:(id)a5;
+ (void)setup;
+ (void)startIndexing;
- (BKLibraryIndexer)init;
- (BUCoalescingCallBlock)coalescingProcessChangedBooks;
- (NSSet)cpq_pendingChangedAssetIDs;
- (NSSet)cpq_pendingDeletedAssetIDs;
- (NSSet)iq_retryAssetIDs;
- (NSString)assetIDNeedingProcessAssertion;
- (id)_clientDataFromSearchableItem:(id)a3;
- (id)_clientStateDictionaryFromData:(id)a3;
- (id)_clientStateHash;
- (id)_extractDeletedIdentifiersFromArray:(id)a3 moc:(id)a4;
- (id)_iBooksContainerURL;
- (id)_indexCompletionBlockForItems:(id)a3 shouldBatch:(BOOL)a4 isBatchEnd:(BOOL)a5;
- (id)_indexingUserDefaults;
- (id)_mergeNSSetToUserDefaults:(id)a3 forKey:(id)a4;
- (id)_nsSetFromUserDefaultsForKey:(id)a3;
- (id)_requestStoreURLsForAttributeSets:(id)a3;
- (id)_subtractNSSetFromUserDefaults:(id)a3 forKey:(id)a4;
- (void)_endIndexTask;
- (void)_indexStartingAtLastDateAdded:(id)a3 retryAssetIDs:(id)a4 completion:(id)a5;
- (void)_processChangedBooksWithCompletion:(id)a3;
- (void)_setNSSetToUserDefaults:(id)a3 forKey:(id)a4;
- (void)continueIndexing;
- (void)cpq_addPendingChangedAssetIDs:(id)a3;
- (void)cpq_addPendingDeletedAssetIDs:(id)a3;
- (void)cpq_removePendingChangedAssetIDs:(id)a3;
- (void)cpq_removePendingDeletedAssetIDs:(id)a3;
- (void)cpq_setPendingChangedAssetIDs:(id)a3;
- (void)cpq_setPendingDeletedAssetIDs:(id)a3;
- (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3;
- (void)iq_addRetryAssetIDs:(id)a3;
- (void)iq_indexSearchableItems:(id)a3 shouldBatch:(BOOL)a4;
- (void)iq_removeRetryAssetIDs:(id)a3;
- (void)iq_setRetryAssetIDs:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)managedObjectBackgroundMonitor:(id)a3 willSaveNotify:(id)a4;
- (void)mocq_reindexBooks:(id)a3 assetIDList:(id)a4 batch:(BOOL)a5 completion:(id)a6;
- (void)mocq_reindexBooksWithAssetIDs:(id)a3 batch:(BOOL)a4 moc:(id)a5 completion:(id)a6;
- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setAssetIDNeedingProcessAssertion:(id)a3;
- (void)setCoalescingProcessChangedBooks:(id)a3;
- (void)wq_beginIndexTask;
@end

@implementation BKLibraryIndexer

+ (void)setup
{
  if (+[CSSearchableIndex isIndexingAvailable]) {
    id v3 = [a1 sharedInstance];
  }
}

+ (void)startIndexing
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"BKDisableSpotlightIndexing"];

  if ((v4 & 1) == 0 && +[CSSearchableIndex isIndexingAvailable])
  {
    id v5 = [a1 sharedInstance];
    [v5 continueIndexing];
  }
}

- (BKLibraryIndexer)init
{
  v28.receiver = self;
  v28.super_class = (Class)BKLibraryIndexer;
  v2 = [(BKLibraryIndexer *)&v28 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("BKLibraryIndexer.workQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("BKLibraryIndexer.changeProcessingQueue", v4);
    changeProcessingQueue = v2->_changeProcessingQueue;
    v2->_changeProcessingQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("BKLibraryIndexer.indexSync", v9);
    indexSync = v2->_indexSync;
    v2->_indexSync = (OS_dispatch_queue *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
    indexingSem = v2->_indexingSem;
    v2->_indexingSem = (OS_dispatch_semaphore *)v12;

    id v14 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v15 = +[BKLibraryManager defaultManager];
    v16 = [v15 persistentStoreCoordinator];
    v17 = +[BKLibraryManager defaultManager];
    v18 = [v17 predicateForIndexing];
    v19 = (BCManagedObjectIDMonitor *)[v14 initWithContext:0 coordinator:v16 entityName:@"BKLibraryAsset" predicate:v18 mapProperty:@"assetID" propertiesOfInterest:qword_100B4A248 observer:v2];
    libraryAssetMonitor = v2->_libraryAssetMonitor;
    v2->_libraryAssetMonitor = v19;

    objc_initWeak(&location, v2);
    id v21 = objc_alloc((Class)BUCoalescingCallBlock);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000BA9EC;
    v25[3] = &unk_100A451B8;
    objc_copyWeak(&v26, &location);
    v22 = (BUCoalescingCallBlock *)[v21 initWithNotifyBlock:v25 blockDescription:@"BKLibraryIndexer"];
    coalescingProcessChangedBooks = v2->_coalescingProcessChangedBooks;
    v2->_coalescingProcessChangedBooks = v22;

    [(BUCoalescingCallBlock *)v2->_coalescingProcessChangedBooks setCoalescingDelay:5.0];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BAAE8;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A258 != -1) {
    dispatch_once(&qword_100B4A258, block);
  }
  v2 = (void *)qword_100B4A250;

  return v2;
}

+ (void)searchableItemAttributeSetForBook:(id)a3 coverTimeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = +[BKLibraryManager defaultManager];
  v11 = [v10 dragInfoFromLibraryAsset:v8];

  dispatch_semaphore_t v12 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8550();
  }

  id v13 = objc_alloc((Class)CSSearchableItemAttributeSet);
  [v11 contentType];
  id v14 = BCAssetUTIForContentType();
  id v15 = [v13 initWithItemContentType:v14];

  [v11 fileSizeInMegaBytes];
  v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v15 setFileSize:v16];

  v17 = +[BCDragRepresentationFactory providerDataTypesForDragInfo:v11];
  [v15 setProviderDataTypes:v17];

  v18 = +[BCDragRepresentationFactory providerFileTypesForDragInfo:v11];
  [v15 setProviderFileTypes:v18];

  v19 = [v11 storeURL];
  v20 = [v19 absoluteString];
  id v21 = [objc_alloc((Class)CSCustomAttributeKey) initWithKeyName:@"com_apple_iBooks_storeURL" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  [v15 setValue:v20 forCustomKey:v21];

  v22 = [v11 localFileURL];
  v23 = [v22 absoluteString];
  id v24 = [objc_alloc((Class)CSCustomAttributeKey) initWithKeyName:@"com_apple_iBooks_localFileURL" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  [v15 setValue:v23 forCustomKey:v24];

  v25 = [v8 title];

  if (v25)
  {
    id v26 = [v8 title];
    [v15 setTitle:v26];
  }
  v27 = [v8 shortBookTitle];

  if (v27)
  {
    objc_super v28 = [v8 shortBookTitle];
    [v15 setDisplayName:v28];
  }
  v29 = [v8 lastOpenDate];

  if (v29)
  {
    v30 = [v8 lastOpenDate];
    [v15 setLastUsedDate:v30];
  }
  v31 = [v8 creationDate];

  if (v31)
  {
    v32 = [v8 creationDate];
    [v15 setAddedDate:v32];
  }
  uint64_t v33 = [v8 language];
  v34 = (void *)v33;
  if (v33)
  {
    uint64_t v76 = v33;
    v35 = +[NSArray arrayWithObjects:&v76 count:1];
    [v15 setLanguages:v35];
  }
  v36 = [v8 displayAuthor];

  if (v36)
  {
    v37 = [v8 displayAuthor];
    v75 = v37;
    v38 = +[NSArray arrayWithObjects:&v75 count:1];
    [v15 setContributors:v38];
  }
  v39 = [v8 assetID];
  [v15 setIdentifier:v39];

  v40 = [v8 assetID];
  [v15 setRelatedUniqueIdentifier:v40];

  v41 = [v8 genre];

  if (v41)
  {
    v42 = [v8 genre];
    [v15 setGenre:v42];
  }
  v43 = [v8 isExplicit];

  if (v43)
  {
    v44 = [v8 isExplicit];
    if ([v44 BOOLValue]) {
      v45 = &off_100A82BE8;
    }
    else {
      v45 = &off_100A82C00;
    }
    [v15 setContentRating:v45];
  }
  if ([v8 isPartOfSeries])
  {
    v46 = [v8 seriesSortKey];
    [v15 setContainerOrder:v46];

    v47 = [v8 localOnlySeriesItemsParent];

    if (v47)
    {
      v48 = [v8 localOnlySeriesItemsParent];
      if (([v48 isValid] & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      v49 = [v8 purchasedAndLocalParent];

      if (!v49) {
        goto LABEL_30;
      }
      v48 = [v8 purchasedAndLocalParent];
      if (![v48 isValid]) {
        goto LABEL_29;
      }
    }
    v50 = [v48 title];
    [v15 setContainerTitle:v50];

    v51 = [v48 title];
    [v15 setContainerDisplayName:v51];

    v52 = [v48 assetID];
    [v15 setContainerIdentifier:v52];

LABEL_29:
  }
LABEL_30:
  v53 = [v8 storeID];
  BOOL v54 = [v53 length] == 0;

  if (!v54)
  {
    v55 = [v8 storeID];
    [v15 setAdamID:v55];
  }
  BOOL v56 = [v8 contentType] == 6;
  v57 = [v8 assetID];
  v58 = [v8 title];
  [a1 associateAssetIdentifier:v57 title:v58 isAudiobook:v56 withAttributeSet:v15];

  v59 = [v8 assetID];
  v60 = [v8 title];
  if (qword_100B4A278 != -1) {
    dispatch_once(&qword_100B4A278, &stru_100A451D8);
  }
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v61 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    sub_1007E851C();
  }

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000BB4F4;
  v66[3] = &unk_100A452A0;
  id v62 = v15;
  id v67 = v62;
  id v63 = v59;
  id v68 = v63;
  v71 = v73;
  id v64 = v60;
  id v69 = v64;
  id v65 = v9;
  id v70 = v65;
  double v72 = a4;
  +[BKBookProgressController progressStringForLibraryAsset:v8 completion:v66];

  _Block_object_dispose(v73, 8);
}

+ (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 establishBackgroundTaskForProgressUpdateOfAsset:v4];
}

- (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3
{
  id v4 = a3;
  indexSync = self->_indexSync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BBBC8;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(indexSync, v7);
}

+ (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 processedButNoHighWaterUpdateForAssetsWithIDs:v4];
}

- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[BCBackgroundTaskAssertion sharedAssertion];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 releaseAssertionForIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_clientStateDictionaryFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    id v10 = 0;
    id v4 = +[NSJSONSerialization JSONObjectWithData:v3 options:0 error:&v10];
    id v5 = (char *)v10;
    id v6 = BUDynamicCast();

    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v7 = BCIMLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v12 = "-[BKLibraryIndexer _clientStateDictionaryFromData:]";
    __int16 v13 = 2080;
    id v14 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKLibraryIndexer.m";
    __int16 v15 = 1024;
    int v16 = 447;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  uint64_t v8 = BCIMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "@\"couldn't decode clientData - %@\"", buf, 0xCu);
  }

  id v6 = 0;
LABEL_10:

  return v6;
}

- (id)_clientStateHash
{
  memset(&v10, 0, sizeof(v10));
  CC_SHA256_Init(&v10);
  data[0] = 7;
  CC_SHA256_Update(&v10, data, 1u);
  id v2 = +[UIApplication applicationCacheDirectory];
  id v3 = (const char *)[v2 UTF8String];
  if (v3)
  {
    id v4 = (unsigned __int8 *)v3;
    CC_LONG v5 = strlen(v3) + 1;
    id v6 = v4;
  }
  else
  {
    data[0] = 0;
    id v6 = data;
    CC_LONG v5 = 1;
  }
  CC_SHA256_Update(&v10, v6, v5);

  CC_SHA256_Final(data, &v10);
  id v7 = +[NSData dataWithBytesNoCopy:data length:32 freeWhenDone:0];
  uint64_t v8 = [v7 base64EncodedStringWithOptions:0];

  return v8;
}

- (id)_iBooksContainerURL
{
  if (qword_100B4A280 != -1) {
    dispatch_once(&qword_100B4A280, &stru_100A452C0);
  }
  id v2 = (void *)qword_100B4A288;

  return v2;
}

- (id)_indexingUserDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC230;
  block[3] = &unk_100A43D60;
  block[4] = self;
  if (qword_100B4A290 != -1) {
    dispatch_once(&qword_100B4A290, block);
  }
  return (id)qword_100B4A298;
}

- (id)_nsSetFromUserDefaultsForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  CC_LONG v5 = [(BKLibraryIndexer *)self _indexingUserDefaults];
  id v6 = [v5 objectForKey:v4];

  id v7 = BUDynamicCast();

  if (v7) {
    +[NSSet setWithArray:v7];
  }
  else {
  uint64_t v8 = +[NSSet set];
  }

  return v8;
}

- (void)_setNSSetToUserDefaults:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(BKLibraryIndexer *)self _indexingUserDefaults];
  if ([v9 count])
  {
    uint64_t v8 = [v9 allObjects];
    [v7 setObject:v8 forKey:v6];
  }
  else
  {
    [v7 setObject:0 forKey:v6];
  }
}

- (id)_mergeNSSetToUserDefaults:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKLibraryIndexer *)self _nsSetFromUserDefaultsForKey:v7];
  id v9 = [v8 count];
  CC_SHA256_CTX v10 = v6;
  if (!v6)
  {
    CC_SHA256_CTX v10 = +[NSSet set];
  }
  long long v11 = [v8 setByAddingObjectsFromSet:v10];

  if (!v6) {
  if ([v11 count] != v9)
  }
    [(BKLibraryIndexer *)self _setNSSetToUserDefaults:v11 forKey:v7];

  return v11;
}

- (id)_subtractNSSetFromUserDefaults:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKLibraryIndexer *)self _nsSetFromUserDefaultsForKey:v7];
  id v9 = [v8 mutableCopy];

  id v10 = [v9 count];
  if (v6)
  {
    [v9 minusSet:v6];
  }
  else
  {
    long long v11 = +[NSSet set];
    [v9 minusSet:v11];
  }
  if ([v9 count] != v10) {
    [(BKLibraryIndexer *)self _setNSSetToUserDefaults:v9 forKey:v7];
  }
  id v12 = [v9 copy];

  return v12;
}

- (NSSet)iq_retryAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);

  return (NSSet *)[(BKLibraryIndexer *)self _nsSetFromUserDefaultsForKey:@"retryAssetIDs"];
}

- (void)iq_setRetryAssetIDs:(id)a3
{
  indexSync = self->_indexSync;
  id v5 = a3;
  dispatch_assert_queue_V2(indexSync);
  [(BKLibraryIndexer *)self _setNSSetToUserDefaults:v5 forKey:@"retryAssetIDs"];
}

- (void)iq_addRetryAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  id v5 = [(BKLibraryIndexer *)self _mergeNSSetToUserDefaults:v4 forKey:@"retryAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E87CC(v4, v5);
  }
}

- (void)iq_removeRetryAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  id v5 = [(BKLibraryIndexer *)self _subtractNSSetFromUserDefaults:v4 forKey:@"retryAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8898(v4, v5);
  }
}

- (void)wq_beginIndexTask
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  indexingSem = self->_indexingSem;
  dispatch_time_t v4 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(indexingSem, v4))
  {
    id v5 = BCSpotlightIndexLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1007E89A4();
    }

    id v6 = self->_indexingSem;
    dispatch_time_t v7 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      uint64_t v8 = BCSpotlightIndexLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1007E8964();
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_indexingSem, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (void)_endIndexTask
{
}

- (void)continueIndexing
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BC944;
  v3[3] = &unk_100A45380;
  v3[4] = self;
  id v4 = [objc_alloc((Class)CSSearchableIndex) initWithName:@"Library"];
  id v2 = v4;
  [v2 fetchLastClientStateWithCompletionHandler:v3];
}

- (void)_indexStartingAtLastDateAdded:(id)a3 retryAssetIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = +[BKLibraryManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BD210;
  v15[3] = &unk_100A450A0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBackgroundReadOnlyBlock:v15];
}

- (id)_extractDeletedIdentifiersFromArray:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 mutableCopy];
  id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  CFStringRef v14 = @"assetID";
  id v9 = +[NSArray arrayWithObjects:&v14 count:1];
  [v8 setPropertiesToFetch:v9];

  id v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", v6];
  [v8 setPredicate:v10];

  [v8 setResultType:2];
  [v8 setReturnsDistinctResults:1];
  long long v11 = [v5 executeFetchRequest:v8 error:0];

  id v12 = [v11 valueForKey:@"assetID"];
  [v7 removeObjectsInArray:v12];
  [v6 removeObjectsInArray:v7];

  return v7;
}

- (void)mocq_reindexBooksWithAssetIDs:(id)a3 batch:(BOOL)a4 moc:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8AC8(v8, v9, v12);
  }

  id v13 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v13 setFetchBatchSize:25];
  v23[0] = @"assetID";
  v23[1] = @"title";
  v23[2] = @"author";
  v23[3] = @"lastOpenDate";
  v23[4] = @"creationDate";
  v23[5] = @"genre";
  v23[6] = @"seriesSortKey";
  v23[7] = @"seriesID";
  CFStringRef v14 = +[NSArray arrayWithObjects:v23 count:8];
  [v13 setPropertiesToFetch:v14];

  __int16 v15 = [v9 allObjects];
  id v16 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", v15];
  [v13 setPredicate:v16];

  id v17 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  v22 = v17;
  v18 = +[NSArray arrayWithObjects:&v22 count:1];
  [v13 setSortDescriptors:v18];

  id v19 = [v11 executeFetchRequest:v13 error:0];

  v20 = [v9 allObjects];
  [(BKLibraryIndexer *)self mocq_reindexBooks:v19 assetIDList:v20 batch:v8 completion:v10];
}

- (id)_clientDataFromSearchableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryIndexer *)self _clientStateHash];
  if (v4)
  {
    id v6 = [v4 attributeSet];
    id v7 = [v6 addedDate];
    [v7 timeIntervalSince1970];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }
  v15[0] = @"hash";
  v15[1] = @"date";
  v16[0] = v5;
  id v10 = +[NSNumber numberWithDouble:v9];
  v16[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v12 = +[NSJSONSerialization dataWithJSONObject:v11 options:0 error:0];
  id v13 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8B8C();
  }

  return v12;
}

- (id)_indexCompletionBlockForItems:(id)a3 shouldBatch:(BOOL)a4 isBatchEnd:(BOOL)a5
{
  int v5 = a5;
  int v6 = a4;
  id v7 = a3;
  double v8 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v7 bu_prettyDescription];
    *(_DWORD *)buf = 67109634;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Index completed items. shouldBatch:%{BOOL}d, isBatchEnd:%{BOOL}d. %@", buf, 0x18u);
  }
  if (v6 == v5)
  {
    [v7 valueForKeyPath:@"attributeSet.identifier"];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BDBEC;
    v14[3] = &unk_100A453E8;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v15;
    double v9 = objc_retainBlock(v14);
  }
  else
  {
    double v9 = &stru_100A453C0;
  }
  id v11 = objc_retainBlock(v9);

  return v11;
}

- (id)_requestStoreURLsForAttributeSets:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  v41 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v11 = [v10 adamID];
        if (v11)
        {
          id v12 = [v10 contentType];
          id v13 = BCAssetUTIForContentType();
          unsigned __int8 v14 = [v12 isEqualToString:v13];

          id v15 = v4;
          if (v14) {
            goto LABEL_9;
          }
          id v16 = [v10 contentType];
          int v17 = BCAssetUTIForContentType();
          unsigned int v18 = [v16 isEqualToString:v17];

          id v15 = v41;
          if (v18) {
LABEL_9:
          }
            [v15 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v7);
  }

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  __int16 v20 = +[BCMBridgedCatalogService sharedInstance];
  id v21 = objc_alloc((Class)BFMRequestMetadata);
  v22 = +[NSString stringWithFormat:@"%s", "BKLibraryIndexer.m"];
  id v23 = [v21 initWithFileID:v22 line:816];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000BE160;
  v46[3] = &unk_100A45410;
  id v24 = v5;
  id v47 = v24;
  v25 = v19;
  v48 = v25;
  [v20 fetchMixedAssetsWithBookIds:v4 audiobookIds:v41 relationships:0 views:0 additionalParameters:0 batchSize:25 metadata:v23 completionHandler:v46];

  dispatch_time_t v26 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v25, v26);
  id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v24 count]];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v24;
  id v29 = [v28 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v43;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        v34 = [v33 adamID];
        v35 = v34;
        if (v34)
        {
          id v36 = v34;
        }
        else
        {
          id v36 = [v33 identifier];
        }
        v37 = v36;

        id v38 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v37 domainIdentifier:0 attributeSet:v33];
        [v27 addObject:v38];
      }
      id v30 = [v28 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v30);
  }

  id v39 = [v27 copy];

  return v39;
}

- (void)iq_indexSearchableItems:(id)a3 shouldBatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  if (v4) {
    [(CSSearchableIndex *)self->_index beginIndexBatch];
  }
  id v6 = [(BKLibraryIndexer *)self _indexCompletionBlockForItems:v15 shouldBatch:v4 isBatchEnd:0];
  [(CSSearchableIndex *)self->_index indexSearchableItems:v15 completionHandler:v6];
  if (v4)
  {
    uint64_t v7 = [(BKLibraryIndexer *)self _indexCompletionBlockForItems:v15 shouldBatch:1 isBatchEnd:1];

    index = self->_index;
    double v9 = [v15 lastObject];
    id v10 = [(BKLibraryIndexer *)self _clientDataFromSearchableItem:v9];
    [(CSSearchableIndex *)index endIndexBatchWithClientState:v10 completionHandler:v7];

    id v11 = [v15 lastObject];
    id v12 = [v11 attributeSet];
    id v13 = [v12 addedDate];
    lastBatchDate = self->_lastBatchDate;
    self->_lastBatchDate = v13;

    id v6 = (void *)v7;
  }
}

- (void)mocq_reindexBooks:(id)a3 assetIDList:(id)a4 batch:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8CF4(v10);
  }

  if ([v9 count])
  {
    if (a5)
    {
      BOOL v48 = 1;
    }
    else
    {
      int v17 = [v9 lastObject];
      if ([v17 isValid])
      {
        lastBatchDate = self->_lastBatchDate;
        dispatch_semaphore_t v19 = [v17 creationDate];
        BOOL v48 = [(NSDate *)lastBatchDate compare:v19] == NSOrderedAscending;
      }
      else
      {
        BOOL v48 = 0;
      }
    }
    __int16 v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v16 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);

    queue = dispatch_queue_create("com.apple.iBooks.libraryIndexer.attributeSet", v16);
    id v47 = [objc_alloc((Class)NSMutableArray) initWithCapacity:25];
    v46 = +[NSMutableSet setWithCapacity:25];
    long long v45 = +[NSMutableSet set];
    long long v44 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v10 count]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v21 = v9;
    id v22 = [v21 countByEnumeratingWithState:&v71 objects:v81 count:16];
    if (v22)
    {
      id v23 = v22;
      v40 = v16;
      id v41 = v11;
      id v42 = v10;
      id v43 = v9;
      uint64_t v24 = *(void *)v72;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v72 != v24) {
            objc_enumerationMutation(v21);
          }
          dispatch_time_t v26 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          id v27 = [v26 assetID:v40, v41, v42, v43];
          if ([v27 length])
          {
            if ([v26 isValid])
            {
              id v28 = BCSpotlightIndexLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                v35 = [v26 title];
                *(_DWORD *)buf = 138412546;
                id v76 = v27;
                __int16 v77 = 2112;
                v78 = v35;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "indexing %@ - %@", buf, 0x16u);
              }
              id v29 = objc_alloc_init((Class)AMSMutablePromise);
              v68[0] = _NSConcreteStackBlock;
              v68[1] = 3221225472;
              v68[2] = sub_1000BEB84;
              v68[3] = &unk_100A45438;
              id v30 = v27;
              id v69 = v30;
              id v31 = v29;
              id v70 = v31;
              +[BKLibraryIndexer searchableItemAttributeSetForBook:v26 coverTimeout:v68 completion:10.0];
              v60[0] = _NSConcreteStackBlock;
              v60[1] = 3221225472;
              v60[2] = sub_1000BEBF4;
              v60[3] = &unk_100A45488;
              id v61 = v31;
              id v32 = v30;
              id v62 = v32;
              id v63 = v47;
              id v64 = self;
              id v65 = v45;
              BOOL v67 = v48;
              id v66 = v46;
              uint64_t v33 = v31;
              dispatch_async(queue, v60);
              v34 = BCSpotlightIndexLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v76 = v32;
                _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "To be indexed: %@", buf, 0xCu);
              }
            }
            else
            {
              [v44 addObject:v27];
              uint64_t v33 = BCSpotlightIndexLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v76 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Indexes to be deleted: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v33 = BCSpotlightIndexLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_1007E8C7C(v79, v26, &v80, v33);
            }
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v71 objects:v81 count:16];
      }
      while (v23);
      id v10 = v42;
      id v9 = v43;
      id v16 = v40;
      id v11 = v41;
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000BEF78;
    v53[3] = &unk_100A454D8;
    v53[4] = self;
    id v54 = v47;
    BOOL v59 = v48;
    id v55 = v45;
    id v56 = v46;
    id v57 = v44;
    id v58 = v11;
    id v36 = v44;
    id v37 = v46;
    id v38 = v45;
    id v39 = v47;
    dispatch_async(queue, v53);
  }
  else
  {
    if ([v10 count])
    {
      id v13 = BCSpotlightIndexLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1007E8BF8(v10);
      }

      indexSync = self->_indexSync;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BF1A0;
      block[3] = &unk_100A43DD8;
      block[4] = self;
      id v52 = v10;
      dispatch_sync(indexSync, block);
    }
    id v15 = objc_retainBlock(v11);
    id v16 = v15;
    if (v15) {
      ((void (*))v15[2].isa)(v15);
    }
  }
}

- (NSSet)cpq_pendingChangedAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);

  return (NSSet *)[(BKLibraryIndexer *)self _nsSetFromUserDefaultsForKey:@"pendingChangedAssetIDs"];
}

- (void)cpq_setPendingChangedAssetIDs:(id)a3
{
  changeProcessingQueue = self->_changeProcessingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(changeProcessingQueue);
  [(BKLibraryIndexer *)self _setNSSetToUserDefaults:v5 forKey:@"pendingChangedAssetIDs"];
}

- (void)cpq_addPendingChangedAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  id v5 = [(BKLibraryIndexer *)self _mergeNSSetToUserDefaults:v4 forKey:@"pendingChangedAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E8FD8();
  }
}

- (void)cpq_removePendingChangedAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  id v5 = [(BKLibraryIndexer *)self _subtractNSSetFromUserDefaults:v4 forKey:@"pendingChangedAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E9040();
  }
}

- (NSSet)cpq_pendingDeletedAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);

  return (NSSet *)[(BKLibraryIndexer *)self _nsSetFromUserDefaultsForKey:@"pendingDeletedAssetIDs"];
}

- (void)cpq_setPendingDeletedAssetIDs:(id)a3
{
  changeProcessingQueue = self->_changeProcessingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(changeProcessingQueue);
  [(BKLibraryIndexer *)self _setNSSetToUserDefaults:v5 forKey:@"pendingDeletedAssetIDs"];
}

- (void)cpq_addPendingDeletedAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  id v5 = [(BKLibraryIndexer *)self _mergeNSSetToUserDefaults:v4 forKey:@"pendingDeletedAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E90A8();
  }
}

- (void)cpq_removePendingDeletedAssetIDs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  id v5 = [(BKLibraryIndexer *)self _subtractNSSetFromUserDefaults:v4 forKey:@"pendingDeletedAssetIDs"];
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007E9110();
  }
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  changeProcessingQueue = self->_changeProcessingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF600;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(changeProcessingQueue, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 willSaveNotify:(id)a4
{
  id v5 = a4;
  changeProcessingQueue = self->_changeProcessingQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BF754;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(changeProcessingQueue, v8);
}

- (void)_processChangedBooksWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFA04;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a4;
  id v6 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Requested to reindex all searchable items.", buf, 2u);
  }

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C00FC;
  v9[3] = &unk_100A44120;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(workQueue, v9);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = BCSpotlightIndexLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 bu_prettyDescription];
    *(_DWORD *)buf = 138412290;
    unsigned int v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Requested to reindex some searchable items: %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0470;
  block[3] = &unk_100A455E8;
  id v15 = v7;
  id v16 = v8;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(workQueue, block);
}

- (BUCoalescingCallBlock)coalescingProcessChangedBooks
{
  return self->_coalescingProcessChangedBooks;
}

- (void)setCoalescingProcessChangedBooks:(id)a3
{
}

- (NSString)assetIDNeedingProcessAssertion
{
  return self->_assetIDNeedingProcessAssertion;
}

- (void)setAssetIDNeedingProcessAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDNeedingProcessAssertion, 0);
  objc_storeStrong((id *)&self->_coalescingProcessChangedBooks, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_storeStrong((id *)&self->_indexingSem, 0);
  objc_storeStrong((id *)&self->_indexSync, 0);
  objc_storeStrong((id *)&self->_changeProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastBatchDate, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

+ (void)associateAssetIdentifier:(id)a3 title:(id)a4 isAudiobook:(BOOL)a5 withAttributeSet:(id)a6
{
  uint64_t v8 = sub_1007FDC70();
  id v10 = v9;
  uint64_t v11 = sub_1007FDC70();
  uint64_t v13 = v12;
  id v14 = a6;
  _sSo16BKLibraryIndexerC5BooksE9associate15assetIdentifier5title11isAudiobook12attributeSetySS_SSSbSo025CSSearchableItemAttributeK0CtFZ_0(v8, v10, v11, v13, a5, (uint64_t)v14);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end