@interface BCReadingStatisticsController
+ (id)_persistentStoreDirectory;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCountedCFISet)heatMap;
- (BCMutableCFISet)visibleCFIs;
- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4;
- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4 registerCloudSync:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3;
- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3;
- (BOOL)registerCloudSync;
- (BUCoalescingCallBlock)coalescedChangeProcessing;
- (BUCoalescingCallBlock)coalescedConnectOrdinals;
- (BUCoalescingCallBlock)coalescedSave;
- (NSArray)cachedTextNodeCFIsAndCharacterCounts;
- (NSArray)orderedTOCEntryCFICache;
- (NSDate)lastUpdate;
- (NSManagedObjectContext)moc;
- (NSMutableArray)observers;
- (NSMutableIndexSet)haveTOCCFIIndices;
- (NSMutableIndexSet)haveTextNodeLengthIndices;
- (NSMutableIndexSet)tocEntriesRequiringProcessing;
- (NSString)assetID;
- (NSString)bookVersionString;
- (double)readingThreshold;
- (id)_TOCEntryCFIs;
- (id)_appVersion;
- (id)_fetchRequestForTOCEntries;
- (id)_fetchRequestForTOCEntriesInRange:(_NSRange)a3;
- (id)_managedObjectModel;
- (id)_persistentStoreCoordinatorWithAssetID:(id)a3;
- (id)_persistentStoreFileNameWithAssetID:(id)a3;
- (id)_predicateForCharacterCountsWithOrdinal:(int64_t)a3;
- (id)_predicateForTOCEntriesWithHref:(id)a3;
- (id)_predicateForTOCEntriesWithOrdinal:(int64_t)a3;
- (id)_textNodeCFIToCharacterLengthMapForOrdinal:(unint64_t)a3 error:(id *)a4;
- (int64_t)characterCountForCFI:(id)a3;
- (unint64_t)cachedTextNodeCFIsAndCharacterCountsOrdinal;
- (unint64_t)hash;
- (void)_bulkUpdateTocEntryReadProportions:(id)a3 completion:(id)a4;
- (void)_bulkUpdateWithReadRanges:(id)a3 completion:(id)a4;
- (void)_connectOrdinalsWithCompletion:(id)a3;
- (void)_getHeatMapWithCompletion:(id)a3;
- (void)_getTOCEntriesWithCompletion:(id)a3;
- (void)_getTextNodesWithCompletion:(id)a3;
- (void)_invalidateTOCEntriesIntersectingCFIs:(id)a3;
- (void)_invalidateTOCEntryCFICache;
- (void)_loadWithCompletion:(id)a3;
- (void)_processDirtyTOCEntriesWithCompletion:(id)a3;
- (void)_recreatePersistentStoreDirectory;
- (void)_saveHeatMapWithCompletion:(id)a3;
- (void)_setDisableCoalescing;
- (void)_setOfRangesWithThreshold:(double)a3 completion:(id)a4;
- (void)_setOfReadRangesWithCompletion:(id)a3;
- (void)_slideIterateSortedArray:(id)a3 andArray:(id)a4 index1:(unint64_t *)a5 index2:(unint64_t *)a6 comparator:(id)a7 executing:(id)a8;
- (void)_updateAppVersionOnMOC:(id)a3;
- (void)_updateHeatMapWithCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)bookStatisticsWithCompletion:(id)a3;
- (void)cfisDidAppear:(id)a3;
- (void)cfisWillDisappear:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCachedTextNodeCFIsAndCharacterCounts:(id)a3;
- (void)setCachedTextNodeCFIsAndCharacterCountsOrdinal:(unint64_t)a3;
- (void)setCoalescedChangeProcessing:(id)a3;
- (void)setCoalescedConnectOrdinals:(id)a3;
- (void)setCoalescedSave:(id)a3;
- (void)setHaveTOCCFIIndices:(id)a3;
- (void)setHaveTextNodeLengthIndices:(id)a3;
- (void)setHeatMap:(id)a3;
- (void)setLastUpdate:(id)a3;
- (void)setMoc:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOrderedTOCEntryCFICache:(id)a3;
- (void)setReadingThreshold:(double)a3;
- (void)setRegisterCloudSync:(BOOL)a3;
- (void)setTocEntriesRequiringProcessing:(id)a3;
- (void)setVisibleCFIs:(id)a3;
- (void)setupWithCompletion:(id)a3;
- (void)teardown;
- (void)tocCFIMapWithCompletion:(id)a3;
- (void)tocEntryStatisticsForHref:(id)a3 completion:(id)a4;
@end

@implementation BCReadingStatisticsController

- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4
{
  return [(BCReadingStatisticsController *)self initWithAssetID:a3 versionString:a4 registerCloudSync:1];
}

- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4 registerCloudSync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)BCReadingStatisticsController;
  v10 = [(BCReadingStatisticsController *)&v54 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    assetID = v10->_assetID;
    v10->_assetID = v11;

    objc_storeStrong((id *)&v10->_bookVersionString, a4);
    v13 = objc_alloc_init(BCCountedCFISet);
    heatMap = v10->_heatMap;
    v10->_heatMap = v13;

    [(BCCountedCFISet *)v10->_heatMap setLengthProvider:v10];
    [(BCCountedCFISet *)v10->_heatMap setMaximumCFICount:1000];
    v15 = objc_alloc_init(BCMutableCFISet);
    visibleCFIs = v10->_visibleCFIs;
    v10->_visibleCFIs = v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    tocEntriesRequiringProcessing = v10->_tocEntriesRequiringProcessing;
    v10->_tocEntriesRequiringProcessing = v17;

    v19 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    haveTOCCFIIndices = v10->_haveTOCCFIIndices;
    v10->_haveTOCCFIIndices = v19;

    v21 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    haveTextNodeLengthIndices = v10->_haveTextNodeLengthIndices;
    v10->_haveTextNodeLengthIndices = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.iBooks.BCReadingStatistics.dispatchQueue", v24);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = +[NSMutableArray array];
    observers = v10->_observers;
    v10->_observers = (NSMutableArray *)v27;

    v10->_readingThreshold = 1.0;
    objc_initWeak(&location, v10);
    id v29 = objc_alloc((Class)BUCoalescingCallBlock);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1F164;
    v50[3] = &unk_2C4458;
    objc_copyWeak(&v52, &location);
    v30 = v10;
    v51 = v30;
    id v31 = [v29 initWithNotifyBlock:v50 blockDescription:@"BCReadingStatisticsController _saveHeatMapWithCompletion"];
    id v43 = v9;
    id v32 = v30[18];
    v30[18] = v31;

    [v30[18] setCoalescingDelay:1.0];
    [v30[18] setMaximumDelay:5.0];
    id v33 = objc_alloc((Class)BUCoalescingCallBlock);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1F300;
    v47[3] = &unk_2C4458;
    objc_copyWeak(&v49, &location);
    v34 = v30;
    v48 = v34;
    id v35 = [v33 initWithNotifyBlock:v47 blockDescription:@"BCReadingStatisticsController _processDirtyTOCEntriesWithCompletion"];
    id v36 = v34[19];
    v34[19] = v35;

    [v34[19] setCoalescingDelay:0.1];
    [v34[19] setMaximumDelay:1.0];
    id v37 = objc_alloc((Class)BUCoalescingCallBlock);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1F3D4;
    v44[3] = &unk_2C4458;
    objc_copyWeak(&v46, &location);
    v38 = v34;
    v45 = v38;
    id v39 = [v37 initWithNotifyBlock:v44 blockDescription:@"BCReadingStatisticsController _connectOrdinalsWithCompletion"];
    id v40 = v38[20];
    v38[20] = v39;

    [v38[20] setCoalescingDelay:1.0];
    [v38[20] setMaximumDelay:15.0];
    *((unsigned char *)v38 + 24) = v5;
    if (v5)
    {
      v41 = +[BCReadingStatisticsSyncManager sharedInstance];
      [v41 registerReadingStatisticsController:v38];
    }
    objc_destroyWeak(&v46);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    id v9 = v43;
  }

  return v10;
}

- (void)dealloc
{
  if (self->_registerCloudSync)
  {
    v3 = +[BCReadingStatisticsSyncManager sharedInstance];
    [v3 unregisterReadingStatisticsController:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)BCReadingStatisticsController;
  [(BCReadingStatisticsController *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [v4 assetID];
    v6 = [(BCReadingStatisticsController *)self assetID];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(BCReadingStatisticsController *)self assetID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)tocEntryStatisticsForHref:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BCReadingStatisticsController *)self moc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1F6C4;
  v11[3] = &unk_2C4480;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)bookStatisticsWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCReadingStatisticsController *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F9C8;
  v7[3] = &unk_2C3A40;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (void)tocCFIMapWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCReadingStatisticsController *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1FD4C;
  v7[3] = &unk_2C3A40;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (void)cfisDidAppear:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1FFB0;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)cfisWillDisappear:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_20138;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)setupWithCompletion:(id)a3
{
  id v9 = a3;
  id v4 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  moc = self->_moc;
  self->_moc = v4;

  id v6 = self->_moc;
  id v7 = [(BCReadingStatisticsController *)self assetID];
  id v8 = [(BCReadingStatisticsController *)self _persistentStoreCoordinatorWithAssetID:v7];
  [(NSManagedObjectContext *)v6 setPersistentStoreCoordinator:v8];

  [(NSManagedObjectContext *)self->_moc setUndoManager:0];
  [(BCReadingStatisticsController *)self _loadWithCompletion:v9];
}

- (void)teardown
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_20360;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  id v4 = [(BCReadingStatisticsController *)self haveTextNodeLengthIndices];
  LOBYTE(a3) = [v4 containsIndex:a3] ^ 1;

  return a3;
}

- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  v22 = self;
  id v6 = a3;
  id v7 = a5;
  id v8 = +[NSMutableDictionary dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    while (2)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v13);
        id v29 = 0;
        v15 = +[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v14, &v29, v22);
        id v16 = v29;
        if (v16)
        {
          id v18 = v16;
          v19 = BCReadingStatisticsLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1E9AD8();
          }

          id v20 = objc_retainBlock(v7);
          v21 = v20;
          if (v20) {
            (*((void (**)(id, id))v20 + 2))(v20, v18);
          }

          goto LABEL_15;
        }
        v17 = [v9 objectForKeyedSubscript:v14];
        [v8 setObject:v17 forKeyedSubscript:v15];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [(BCReadingStatisticsController *)v22 moc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_20638;
  v24[3] = &unk_2C44F0;
  int64_t v28 = a4;
  v24[4] = v22;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v8;
  id v27 = v7;
  id v18 = v25;
  [v18 performBlock:v24];

LABEL_15:
}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  id v4 = [(BCReadingStatisticsController *)self haveTOCCFIIndices];
  LOBYTE(a3) = [v4 containsIndex:a3] ^ 1;

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(BCReadingStatisticsController *)self moc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_20ECC;
  v13[3] = &unk_2C44F0;
  id v16 = v9;
  int64_t v17 = a4;
  v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  [v12 performBlock:v13];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21518;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21648;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)characterCountForCFI:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 characterCountIfComputable];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  id v6 = [v4 headCFI];
  id v25 = 0;
  id v7 = -[BCReadingStatisticsController _textNodeCFIToCharacterLengthMapForOrdinal:error:](self, "_textNodeCFIToCharacterLengthMapForOrdinal:error:", [v6 spineIndex], &v25);
  id v8 = v25;
  if (v8)
  {
    id v9 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1E9C08();
    }
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  v28[0] = v6;
  id v10 = +[NSNull null];
  v28[1] = v10;
  id v9 = +[NSArray arrayWithObjects:v28 count:2];

  id v11 = [v7 indexOfObject:v9 inSortedRange:0 options:1024 usingComparator:&stru_2C4550];
  id v12 = [v7 count];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  id v14 = v12;
  uint64_t v15 = (uint64_t)v11 <= 1 ? 1 : (uint64_t)v11;
  if (v15 > (uint64_t)v12) {
    goto LABEL_10;
  }
  v24 = v6;
  id v5 = 0;
  uint64_t v17 = v15 - 1;
  *(void *)&long long v13 = 138412290;
  long long v23 = v13;
  while (1)
  {
    id v18 = [v7 objectAtIndexedSubscript:v17, v23];
    v19 = [v18 objectAtIndexedSubscript:0];
    id v20 = [v4 intersectWithCFI:v19];
    if (![v20 isRange]) {
      break;
    }
    if ([v20 isEqual:v19])
    {
      v21 = [v18 objectAtIndexedSubscript:1];
      id v5 = &v5[(void)[v21 integerValue]];
    }
    else
    {
      id v22 = [v20 characterCountIfComputable];
      if (v22 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v5 = &v5[(void)v22];
        goto LABEL_24;
      }
      v21 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v23;
        id v27 = v20;
        _os_log_error_impl(&def_7D91C, v21, OS_LOG_TYPE_ERROR, "Unexpected failure to compute character count for CFI %@", buf, 0xCu);
      }
    }

LABEL_24:
    if (v14 == (id)++v17) {
      goto LABEL_25;
    }
  }
  if ([v4 compareTailToHead:v19] != (id)-1) {
    goto LABEL_24;
  }

LABEL_25:
  id v8 = 0;
  id v6 = v24;
LABEL_11:

LABEL_12:
  return (int64_t)v5;
}

- (id)_textNodeCFIToCharacterLengthMapForOrdinal:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = sub_21C28;
  id v29 = sub_21C38;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_21C28;
  long long v23 = sub_21C38;
  id v24 = 0;
  if ([(BCReadingStatisticsController *)self cachedTextNodeCFIsAndCharacterCountsOrdinal] == a3)
  {
    uint64_t v7 = [(BCReadingStatisticsController *)self cachedTextNodeCFIsAndCharacterCounts];
    id v8 = (void *)v26[5];
    v26[5] = v7;
  }
  if (!v26[5])
  {
    id v9 = [(BCReadingStatisticsController *)self moc];
    id v10 = [(BCReadingStatisticsController *)self moc];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_21C40;
    v14[3] = &unk_2C4598;
    v14[4] = self;
    unint64_t v18 = a3;
    id v11 = v9;
    id v15 = v11;
    id v16 = &v19;
    uint64_t v17 = &v25;
    [v10 performBlockAndWait:v14];

    [(BCReadingStatisticsController *)self setCachedTextNodeCFIsAndCharacterCounts:v26[5]];
    [(BCReadingStatisticsController *)self setCachedTextNodeCFIsAndCharacterCountsOrdinal:a3];
  }
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)_appVersion
{
  if (qword_345580 != -1) {
    dispatch_once(&qword_345580, &stru_2C45B8);
  }
  v2 = (void *)qword_345578;

  return v2;
}

- (void)_updateHeatMapWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  id v6 = [(BCReadingStatisticsController *)self lastUpdate];
  [(BCReadingStatisticsController *)self setLastUpdate:v5];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v6
    && ([(BCReadingStatisticsController *)self visibleCFIs],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    && ([v5 timeIntervalSinceDate:v6], double v9 = v8, v8 > 1.0))
  {
    id v29 = v6;
    id v30 = v5;
    id v31 = v4;
    id v10 = [(BCReadingStatisticsController *)self heatMap];
    int64_t v28 = self;
    id v11 = [(BCReadingStatisticsController *)self visibleCFIs];
    id v12 = [v11 copy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = v12;
    long long v13 = [v12 allCFIs];
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v17);
          uint64_t v19 = BCReadingStatisticsLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v20 = [v18 string];
            *(_DWORD *)buf = 138412546;
            id v37 = v20;
            __int16 v38 = 2048;
            double v39 = v9;
            _os_log_debug_impl(&def_7D91C, v19, OS_LOG_TYPE_DEBUG, "Read %@ for %.1lf seconds", buf, 0x16u);
          }
          [v10 addCFI:v18 count:v9];
          uint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v15);
    }

    uint64_t v21 = [v27 allCFIs];
    [(BCReadingStatisticsController *)v28 _invalidateTOCEntriesIntersectingCFIs:v21];

    id v22 = [(BCReadingStatisticsController *)v28 coalescedSave];
    [v22 signalWithCompletion:&stru_2C45D8];

    id v4 = v31;
    id v23 = objc_retainBlock(v31);
    id v24 = v23;
    if (v23) {
      (*((void (**)(id, void))v23 + 2))(v23, 0);
    }

    id v6 = v29;
    id v5 = v30;
  }
  else
  {
    id v25 = objc_retainBlock(v4);
    id v26 = v25;
    if (v25) {
      (*((void (**)(id, void))v25 + 2))(v25, 0);
    }
  }
}

- (void)_saveHeatMapWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = [(BCReadingStatisticsController *)self heatMap];
  id v6 = [v5 allCFIStringCounts];
  [(BCReadingStatisticsController *)self moc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_223C8;
  v10[3] = &unk_2C4480;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  long long v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = v11;
  [v9 performBlock:v10];
}

- (void)_updateAppVersionOnMOC:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BCReadingStatsAppVersion"];
  CFStringRef v14 = @"appVersion";
  id v6 = +[NSArray arrayWithObjects:&v14 count:1];
  [v5 setPropertiesToFetch:v6];

  uint64_t v13 = 0;
  id v7 = [v4 executeFetchRequest:v5 error:&v13];
  id v8 = v7;
  if (v13 || ![v7 count])
  {
    id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCReadingStatsAppVersion" inManagedObjectContext:v4];
    id v10 = [(BCReadingStatisticsController *)self _appVersion];
    id v11 = v9;
    id v12 = v10;
  }
  else
  {
    id v9 = [(BCReadingStatisticsController *)self _appVersion];
    id v11 = [v8 objectAtIndexedSubscript:0];
    id v10 = v11;
    id v12 = v9;
  }
  [v11 setAppVersion:v12];
}

- (void)_loadWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCReadingStatisticsController *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_228EC;
  v7[3] = &unk_2C3A40;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (id)_predicateForCharacterCountsWithOrdinal:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:@"ordinal == %d", a3];
}

- (id)_predicateForTOCEntriesWithOrdinal:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:@"ordinal == %d", a3];
}

- (id)_predicateForTOCEntriesWithHref:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"href == %@", a3];
}

- (id)_fetchRequestForTOCEntries
{
  return -[BCReadingStatisticsController _fetchRequestForTOCEntriesInRange:](self, "_fetchRequestForTOCEntriesInRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (id)_fetchRequestForTOCEntriesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BCReadingStatsTOCEntry"];
  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"ordinal" ascending:1];
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"intraOrdinalOrder" ascending:1];
  v10[0] = v6;
  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  [v5 setSortDescriptors:v8];

  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    [v5 setFetchOffset:location];
    [v5 setFetchLimit:length];
  }

  return v5;
}

- (void)_bulkUpdateTocEntryReadProportions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 mutableCopy];
    id v9 = [(BCReadingStatisticsController *)self moc];
    id v10 = [(BCReadingStatisticsController *)self moc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_23498;
    v15[3] = &unk_2C4480;
    v15[4] = self;
    id v16 = v9;
    id v17 = v8;
    id v18 = v7;
    id v11 = v8;
    id v12 = v9;
    [v10 performBlock:v15];
  }
  else
  {
    id v13 = objc_retainBlock(v7);
    CFStringRef v14 = v13;
    if (v13) {
      (*((void (**)(id))v13 + 2))(v13);
    }
  }
}

- (void)_setOfReadRangesWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCReadingStatisticsController *)self readingThreshold];
  -[BCReadingStatisticsController _setOfRangesWithThreshold:completion:](self, "_setOfRangesWithThreshold:completion:", v4);
}

- (void)_setOfRangesWithThreshold:(double)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_239F8;
  block[3] = &unk_2C4628;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)_bulkUpdateWithReadRanges:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if ((uint64_t)[v6 cfiCount] < 1)
  {
    id v9 = objc_retainBlock(v7);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_23BC4;
    block[3] = &unk_2C4650;
    objc_copyWeak(&v15, &location);
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_async(accessQueue, block);

    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);
}

- (void)_getHeatMapWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_23D84;
  v7[3] = &unk_2C4678;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)_setDisableCoalescing
{
  id v3 = [(BCReadingStatisticsController *)self coalescedSave];
  [v3 setCoalescingDelay:0.0];

  id v4 = [(BCReadingStatisticsController *)self coalescedSave];
  [v4 setMaximumDelay:0.0];

  id v5 = [(BCReadingStatisticsController *)self coalescedChangeProcessing];
  [v5 setCoalescingDelay:0.0];

  id v6 = [(BCReadingStatisticsController *)self coalescedChangeProcessing];
  [v6 setMaximumDelay:0.0];

  id v7 = [(BCReadingStatisticsController *)self coalescedConnectOrdinals];
  [v7 setCoalescingDelay:0.0];

  id v8 = [(BCReadingStatisticsController *)self coalescedConnectOrdinals];
  [v8 setMaximumDelay:0.0];
}

- (void)_getTextNodesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCReadingStatisticsController *)self moc];
  id v6 = [(BCReadingStatisticsController *)self moc];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_23FB8;
  v9[3] = &unk_2C4370;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlock:v9];
}

- (void)_getTOCEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCReadingStatisticsController *)self moc];
  id v6 = [(BCReadingStatisticsController *)self moc];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_241C0;
  v9[3] = &unk_2C3A40;
  void v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlock:v9];
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication applicationDocumentsDirectory];
  id v5 = [v4 stringByAppendingPathComponent:@"BCReadingStatistics"];

  id v6 = +[NSFileManager defaultManager];
  id v9 = 0;
  [v6 removeItemAtPath:v5 error:&v9];
  id v7 = v9;

  id v8 = (void (**)(id, BOOL, id))objc_retainBlock(v3);
  if (v8) {
    v8[2](v8, v7 == 0, v7);
  }
}

+ (id)_persistentStoreDirectory
{
  v2 = +[UIApplication applicationDocumentsDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"BCReadingStatistics"];

  return v3;
}

- (id)_persistentStoreFileNameWithAssetID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.sqlite", a3];
}

- (void)_recreatePersistentStoreDirectory
{
  id v5 = [(id)objc_opt_class() _persistentStoreDirectory];
  v2 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v2 relativePath];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)_managedObjectModel
{
  model = self->_model;
  if (!model)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 pathForResource:@"BCReadingStatistics" ofType:@"momd"];

    id v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    id v7 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v6];
    id v8 = self->_model;
    self->_model = v7;

    model = self->_model;
  }

  return model;
}

- (id)_persistentStoreCoordinatorWithAssetID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSPersistentStoreCoordinator);
  id v6 = [(BCReadingStatisticsController *)self _managedObjectModel];
  id v7 = [v5 initWithManagedObjectModel:v6];

  v20[0] = NSInferMappingModelAutomaticallyOption;
  v20[1] = NSMigratePersistentStoresAutomaticallyOption;
  v21[0] = &__kCFBooleanTrue;
  v21[1] = &__kCFBooleanTrue;
  id v8 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v9 = [(id)objc_opt_class() _persistentStoreDirectory];
  id v10 = [(BCReadingStatisticsController *)self _persistentStoreFileNameWithAssetID:v4];

  [(BCReadingStatisticsController *)self _recreatePersistentStoreDirectory];
  id v11 = [v9 stringByAppendingPathComponent:v10];
  id v12 = +[NSURL fileURLWithPath:v11 isDirectory:0];
  id v19 = 0;
  id v13 = [v7 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v12 options:v8 error:&v19];
  id v14 = v19;
  if (!v13)
  {
    id v15 = +[NSFileManager defaultManager];
    [v15 removeItemAtPath:v9 error:0];

    [(BCReadingStatisticsController *)self _recreatePersistentStoreDirectory];
    id v18 = v14;
    id v13 = [v7 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v12 options:v8 error:&v18];
    id v16 = v18;

    id v14 = v16;
  }

  return v7;
}

- (void)_invalidateTOCEntryCFICache
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_247E4;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)_TOCEntryCFIs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v3 = [(BCReadingStatisticsController *)self orderedTOCEntryCFICache];

  if (!v3)
  {
    [(BCReadingStatisticsController *)self moc];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_21C28;
    id v14 = sub_21C38;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_24948;
    v7[3] = &unk_2C4720;
    void v7[4] = self;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v4;
    id v9 = &v10;
    [v4 performBlockAndWait:v7];
    [(BCReadingStatisticsController *)self setOrderedTOCEntryCFICache:v11[5]];

    _Block_object_dispose(&v10, 8);
  }
  id v5 = [(BCReadingStatisticsController *)self orderedTOCEntryCFICache];

  return v5;
}

- (void)_invalidateTOCEntriesIntersectingCFIs:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v5 = [(BCReadingStatisticsController *)self tocEntriesRequiringProcessing];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 count];

    if (v7)
    {
      id v8 = [(BCReadingStatisticsController *)self _TOCEntryCFIs];
      if ([v8 count])
      {
        uint64_t v11 = 0;
        uint64_t v12 = &v11;
        uint64_t v13 = 0x2020000000;
        char v14 = 0;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        void v10[2] = sub_24E18;
        v10[3] = &unk_2C4788;
        void v10[4] = self;
        v10[5] = &v11;
        [(BCReadingStatisticsController *)self _slideIterateSortedArray:v4 andArray:v8 index1:0 index2:0 comparator:&stru_2C4760 executing:v10];
        if (*((unsigned char *)v12 + 24))
        {
          id v9 = [(BCReadingStatisticsController *)self coalescedChangeProcessing];
          [v9 signalWithCompletion:&stru_2C47A8];
        }
        _Block_object_dispose(&v11, 8);
      }
    }
  }
}

- (void)_processDirtyTOCEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v5 = [(BCReadingStatisticsController *)self tocEntriesRequiringProcessing];
  if ([v5 count])
  {
    id v6 = [(BCReadingStatisticsController *)self heatMap];
    id v7 = [v6 allCFICounts];

    [(BCReadingStatisticsController *)self moc];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_250B8;
    v12[3] = &unk_2C4870;
    v12[4] = self;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v7;
    id v15 = v5;
    id v16 = v4;
    id v8 = v7;
    id v9 = v13;
    [v9 performBlock:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v4);
    uint64_t v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (void)_connectOrdinalsWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCReadingStatisticsController *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_259E4;
  v7[3] = &unk_2C3A40;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (void)_slideIterateSortedArray:(id)a3 andArray:(id)a4 index1:(unint64_t *)a5 index2:(unint64_t *)a6 comparator:(id)a7 executing:(id)a8
{
  id v28 = a3;
  id v13 = a4;
  id v14 = (uint64_t (**)(id, void *, void *))a7;
  id v15 = a8;
  id v16 = (unint64_t *)[v28 count];
  id v17 = [v13 count];
  id v18 = a5;
  unint64_t v19 = (unint64_t)v17;
  if (a5) {
    a5 = (unint64_t *)*a5;
  }
  id v26 = v18;
  if (a6) {
    unint64_t v20 = *a6;
  }
  else {
    unint64_t v20 = 0;
  }
  uint64_t v27 = a6;
  if (a5 < v16 && v20 < (unint64_t)v17)
  {
    do
    {
      uint64_t v21 = [v28 objectAtIndexedSubscript:a5];
      id v22 = [v13 objectAtIndexedSubscript:v20];
      id v23 = objc_retainBlock(v15);
      id v24 = v23;
      if (v23) {
        (*((void (**)(id, void *, void *, unint64_t *, unint64_t))v23 + 2))(v23, v21, v22, a5, v20);
      }

      if (v14[2](v14, v21, v22) == 1) {
        ++v20;
      }
      else {
        a5 = (unint64_t *)((char *)a5 + 1);
      }
    }
    while (a5 < v16 && v20 < v19);
  }
  if (v26) {
    *id v26 = a5;
  }
  if (v27) {
    *uint64_t v27 = v20;
  }
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSString)bookVersionString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (double)readingThreshold
{
  return self->_readingThreshold;
}

- (void)setReadingThreshold:(double)a3
{
  self->_readingThreshold = a3;
}

- (NSMutableIndexSet)haveTOCCFIIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHaveTOCCFIIndices:(id)a3
{
}

- (NSMutableIndexSet)haveTextNodeLengthIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHaveTextNodeLengthIndices:(id)a3
{
}

- (NSArray)cachedTextNodeCFIsAndCharacterCounts
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedTextNodeCFIsAndCharacterCounts:(id)a3
{
}

- (unint64_t)cachedTextNodeCFIsAndCharacterCountsOrdinal
{
  return self->_cachedTextNodeCFIsAndCharacterCountsOrdinal;
}

- (void)setCachedTextNodeCFIsAndCharacterCountsOrdinal:(unint64_t)a3
{
  self->_cachedTextNodeCFIsAndCharacterCountsOrdinal = a3;
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (BOOL)registerCloudSync
{
  return self->_registerCloudSync;
}

- (void)setRegisterCloudSync:(BOOL)a3
{
  self->_registerCloudSync = a3;
}

- (BCCountedCFISet)heatMap
{
  return self->_heatMap;
}

- (void)setHeatMap:(id)a3
{
}

- (BCMutableCFISet)visibleCFIs
{
  return self->_visibleCFIs;
}

- (void)setVisibleCFIs:(id)a3
{
}

- (NSMutableIndexSet)tocEntriesRequiringProcessing
{
  return self->_tocEntriesRequiringProcessing;
}

- (void)setTocEntriesRequiringProcessing:(id)a3
{
}

- (NSArray)orderedTOCEntryCFICache
{
  return self->_orderedTOCEntryCFICache;
}

- (void)setOrderedTOCEntryCFICache:(id)a3
{
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedSave
{
  return self->_coalescedSave;
}

- (void)setCoalescedSave:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedChangeProcessing
{
  return self->_coalescedChangeProcessing;
}

- (void)setCoalescedChangeProcessing:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedConnectOrdinals
{
  return self->_coalescedConnectOrdinals;
}

- (void)setCoalescedConnectOrdinals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedConnectOrdinals, 0);
  objc_storeStrong((id *)&self->_coalescedChangeProcessing, 0);
  objc_storeStrong((id *)&self->_coalescedSave, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_orderedTOCEntryCFICache, 0);
  objc_storeStrong((id *)&self->_tocEntriesRequiringProcessing, 0);
  objc_storeStrong((id *)&self->_visibleCFIs, 0);
  objc_storeStrong((id *)&self->_heatMap, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_cachedTextNodeCFIsAndCharacterCounts, 0);
  objc_storeStrong((id *)&self->_haveTextNodeLengthIndices, 0);
  objc_storeStrong((id *)&self->_haveTOCCFIIndices, 0);
  objc_storeStrong((id *)&self->_bookVersionString, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end