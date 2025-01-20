@interface FCFDBStorage
- (FCFDBConnectionReadable)readDBConnection;
- (FCFDBConnectionWritable)writeDBConnection;
- (FCFDBPruningPolicy)pruningPolicy;
- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4;
- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5;
- (FCFDBStorage)initWithPath:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5;
- (NSMutableDictionary)cachedFeedItemOrders;
- (NSMutableDictionary)cachedFeedItems;
- (NSMutableDictionary)cachedFeeds;
- (NSMutableSet)modifiedFeedIDs;
- (NSMutableSet)modifiedFeedItemIDs;
- (NSMutableSet)prunedFeedIDs;
- (NSString)path;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)saveQueue;
- (id)_pruneFeedsIfNeeded:(id)a3;
- (id)feedForFeedID:(id)a3;
- (id)feedItemsForFeedIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCountByFeed:(id)a6 totalMaxCount:(unint64_t)a7;
- (id)feedsForFeedIDs:(id)a3;
- (id)initTransientWithOptions:(int64_t)a3;
- (int64_t)_feedLookupIDForFeedID:(id)a3;
- (int64_t)lastFeedLookupID;
- (int64_t)options;
- (void)accessWithBlock:(id)a3;
- (void)flushChanges;
- (void)insertFeedItems:(id)a3;
- (void)setLastFeedLookupID:(int64_t)a3;
- (void)setWriteDBConnection:(id)a3;
- (void)updateFeedID:(id)a3 refreshedFromOrder:(unint64_t)a4 refreshedToOrder:(unint64_t)a5 fetchedRange:(id)a6;
@end

@implementation FCFDBStorage

- (FCFDBStorage)initWithPath:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)FCFDBStorage;
  id v10 = [(FCFDBStorage *)&v37 init];
  if (v10)
  {
    v11 = [[FCFDBConnection alloc] initWithPath:v8];
    if (v11)
    {
      v12 = (void *)*((void *)v10 + 4);
      *((void *)v10 + 4) = v11;
      v13 = v11;

      *((void *)v10 + 1) = a4;
      uint64_t v14 = [v8 copy];
      v15 = (void *)*((void *)v10 + 2);
      *((void *)v10 + 2) = v14;

      objc_storeStrong((id *)v10 + 3, a5);
      v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v17 = dispatch_queue_create("FCFDBStorage.access", v16);
      v18 = (void *)*((void *)v10 + 5);
      *((void *)v10 + 5) = v17;

      dispatch_queue_set_specific(*((dispatch_queue_t *)v10 + 5), (const void *)FCFDBStorageAccessQueueUnique, (void *)FCFDBStorageAccessQueueUnique, 0);
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v20 = (void *)*((void *)v10 + 6);
      *((void *)v10 + 6) = v19;

      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v22 = (void *)*((void *)v10 + 7);
      *((void *)v10 + 7) = v21;

      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v24 = (void *)*((void *)v10 + 8);
      *((void *)v10 + 8) = v23;

      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v26 = (void *)*((void *)v10 + 10);
      *((void *)v10 + 10) = v25;

      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v28 = (void *)*((void *)v10 + 11);
      *((void *)v10 + 11) = v27;

      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v30 = (void *)*((void *)v10 + 12);
      *((void *)v10 + 12) = v29;

      v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
      dispatch_queue_t v33 = dispatch_queue_create("FCFDBStorage.slowSave", v32);
      v34 = (void *)*((void *)v10 + 13);
      *((void *)v10 + 13) = v33;
    }
    else
    {
      v35 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v8;
        _os_log_error_impl(&dword_1A460D000, v35, OS_LOG_TYPE_ERROR, "failed to establish connection to SQL database at path=%{public}@", buf, 0xCu);
      }
      v31 = v10;
      id v10 = 0;
    }
  }
  return (FCFDBStorage *)v10;
}

- (id)initTransientWithOptions:(int64_t)a3
{
  return [(FCFDBStorage *)self initWithPath:@":memory:" options:a3 pruningPolicy:0];
}

- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4
{
  v6 = [a3 path];
  v7 = [(FCFDBStorage *)self initWithPath:v6 options:a4 pruningPolicy:0];

  return v7;
}

- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5
{
  id v8 = a5;
  id v9 = [a3 path];
  id v10 = [(FCFDBStorage *)self initWithPath:v9 options:a4 pruningPolicy:v8];

  return v10;
}

- (id)feedForFeedID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FCFDBStorage *)self cachedFeeds];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v11[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v9 = [(FCFDBStorage *)self feedsForFeedIDs:v8];
    id v7 = [v9 objectForKey:v4];
  }
  return v7;
}

- (void)accessWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__57;
  dispatch_queue_t v33 = __Block_byref_object_dispose__57;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__57;
  id v27 = __Block_byref_object_dispose__57;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__57;
  id v21 = __Block_byref_object_dispose__57;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__57;
  v15[4] = __Block_byref_object_dispose__57;
  id v16 = 0;
  v5 = [(FCFDBStorage *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__FCFDBStorage_accessWithBlock___block_invoke;
  block[3] = &unk_1E5B58CC0;
  id v6 = v4;
  block[4] = self;
  id v10 = v6;
  v11 = &v29;
  v12 = &v23;
  v13 = &v17;
  uint64_t v14 = v15;
  dispatch_sync(v5, block);

  if ([(id)v30[5] count] || objc_msgSend((id)v24[5], "count") || objc_msgSend((id)v18[5], "count"))
  {
    id v7 = [(FCFDBStorage *)self saveQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__FCFDBStorage_accessWithBlock___block_invoke_2;
    v8[3] = &unk_1E5B58CE8;
    v8[4] = self;
    v8[5] = &v17;
    v8[6] = v15;
    v8[7] = &v29;
    v8[8] = &v23;
    dispatch_async(v7, v8);
  }
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __32__FCFDBStorage_accessWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(a1 + 32) cachedFeeds];
  v3 = [*(id *)(a1 + 32) modifiedFeedIDs];
  id v4 = [v3 allObjects];
  uint64_t v5 = objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 32) cachedFeeds];
  id v9 = [*(id *)(a1 + 32) prunedFeedIDs];
  id v10 = [v9 allObjects];
  uint64_t v11 = objc_msgSend(v8, "nf_objectsForKeysWithoutMarker:", v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(a1 + 32) cachedFeedItems];
  v15 = [*(id *)(a1 + 32) modifiedFeedItemIDs];
  id v16 = [v15 allObjects];
  uint64_t v17 = objc_msgSend(v14, "nf_objectsForKeysWithoutMarker:", v16);
  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  v20 = [*(id *)(a1 + 32) cachedFeeds];
  uint64_t v21 = [v20 copy];
  uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  v24 = [*(id *)(a1 + 32) modifiedFeedIDs];
  [v24 removeAllObjects];

  uint64_t v25 = [*(id *)(a1 + 32) prunedFeedIDs];
  [v25 removeAllObjects];

  id v26 = [*(id *)(a1 + 32) modifiedFeedItemIDs];
  [v26 removeAllObjects];
}

void __32__FCFDBStorage_accessWithBlock___block_invoke_2(uint64_t a1)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F96318]);
  v3 = [MEMORY[0x1E4F96478] currentProcess];
  id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
  v43[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
  v43[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  id v7 = (void *)[v2 initWithExplanation:@"News feed item storage write" target:v3 attributes:v6];

  [v7 acquireWithError:0];
  id v8 = [*(id *)(a1 + 32) writeDBConnection];

  if (!v8)
  {
    id v9 = [FCFDBConnection alloc];
    id v10 = [*(id *)(a1 + 32) path];
    uint64_t v11 = [(FCFDBConnection *)v9 initWithPath:v10];
    [*(id *)(a1 + 32) setWriteDBConnection:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) writeDBConnection];
  [v12 beginTransaction];

  v13 = [*(id *)(a1 + 32) writeDBConnection];
  [v13 insertIndexesForFeedItems:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) knownFeedsByID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v14 = [*(id *)(a1 + 32) writeDBConnection];
  [v14 insertFeedItems:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) knownFeedsByID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  v15 = [*(id *)(a1 + 32) writeDBConnection];
  [v15 insertFeeds:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  if (([*(id *)(a1 + 32) options] & 2) != 0)
  {
    id v16 = [*(id *)(a1 + 32) writeDBConnection];
    [v16 insertFeatureIndexesForFeedItems:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) knownFeedsByID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  if (([*(id *)(a1 + 32) options] & 4) != 0
    && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    dispatch_queue_t v33 = v7;
    v36 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v35 = *(void *)v38;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
          uint64_t v21 = [*(id *)(a1 + 32) writeDBConnection];
          objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "feedLookupID"));
          uint64_t v23 = v22 = a1;
          v41 = v23;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
          uint64_t v25 = [v20 trailingEmptyRegion];
          id v26 = [v21 selectFeedItemIDsWithFeedLookupIDs:v24 feedRange:v25 feature:0 maxCount:0];

          a1 = v22;
          [v36 addObjectsFromArray:v26];
          id v27 = [*(id *)(v22 + 32) writeDBConnection];
          id v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "feedLookupID"));
          uint64_t v29 = [v20 trailingEmptyRegion];
          [v27 deleteFeedItemIndexesFromFeedLookupID:v28 feedRange:v29];

          ++v19;
        }
        while (v18 != v19);
        uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v18);
    }

    v30 = [*(id *)(a1 + 32) writeDBConnection];
    [v30 deleteFeedItemsWithIDs:v36];

    uint64_t v31 = [*(id *)(a1 + 32) writeDBConnection];
    [v31 incrementalVacuum];

    id v7 = v33;
  }
  v32 = [*(id *)(a1 + 32) writeDBConnection];
  [v32 commitTransaction];

  [v7 invalidateWithError:0];
}

- (id)feedsForFeedIDs:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = (void *)[[NSString alloc] initWithFormat:@"accessing fdb storage outside the access queue"];
    *(_DWORD *)buf = 136315906;
    long long v38 = "-[FCFDBStorage feedsForFeedIDs:]";
    __int16 v39 = 2080;
    long long v40 = "FCFDBStorage.m";
    __int16 v41 = 1024;
    int v42 = 208;
    __int16 v43 = 2114;
    v44 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v6 = [(FCFDBStorage *)self cachedFeeds];
  id v7 = objc_msgSend(v4, "fc_arrayByRemovingKeysInDictionary:", v6);

  if ([v7 count])
  {
    id v8 = [(FCFDBStorage *)self readDBConnection];
    id v9 = [v8 selectFeedsWithFeedIDs:v7];

    id v10 = [(FCFDBStorage *)self _pruneFeedsIfNeeded:v9];
    uint64_t v11 = [(FCFDBStorage *)self cachedFeeds];
    [v11 addEntriesFromDictionary:v10];

    uint64_t v12 = objc_msgSend(v7, "fc_arrayByRemovingKeysInDictionary:", v10);
    if ([v12 count])
    {
      id v31 = v4;
      int64_t v13 = [(FCFDBStorage *)self lastFeedLookupID];
      v30 = v9;
      if (v13)
      {
        [(FCFDBStorage *)self setLastFeedLookupID:v13];
      }
      else
      {
        uint64_t v14 = [(FCFDBStorage *)self readDBConnection];
        -[FCFDBStorage setLastFeedLookupID:](self, "setLastFeedLookupID:", [v14 selectMaxFeedLookupID]);
      }
      id v28 = v12;
      uint64_t v29 = v10;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            [(FCFDBStorage *)self setLastFeedLookupID:[(FCFDBStorage *)self lastFeedLookupID] + 1];
            uint64_t v21 = [[FCFDBFeed alloc] initWithFeedID:v20 feedLookupID:[(FCFDBStorage *)self lastFeedLookupID]];
            uint64_t v22 = [(FCFDBStorage *)self cachedFeeds];
            [v22 setObject:v21 forKey:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v17);
      }

      uint64_t v23 = [(FCFDBStorage *)self modifiedFeedIDs];
      [v23 addObjectsFromArray:v15];

      id v9 = v30;
      id v4 = v31;
      uint64_t v12 = v28;
      id v10 = v29;
    }
  }
  v24 = [(FCFDBStorage *)self cachedFeeds];
  uint64_t v25 = objc_msgSend(v24, "fc_subdictionaryForKeys:", v4);

  return v25;
}

- (id)feedItemsForFeedIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCountByFeed:(id)a6 totalMaxCount:(unint64_t)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v16
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v38 = (void *)[[NSString alloc] initWithFormat:@"accessing fdb storage outside the access queue"];
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFDBStorage feedItemsForFeedIDs:feedRange:feature:maxCountByFeed:totalMaxCount:]";
    __int16 v57 = 2080;
    v58 = "FCFDBStorage.m";
    __int16 v59 = 1024;
    int v60 = 242;
    __int16 v61 = 2114;
    v62 = v38;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke;
  v54[3] = &unk_1E5B4DDA8;
  v54[4] = self;
  uint64_t v17 = objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", v54);
  uint64_t v18 = [(FCFDBStorage *)self readDBConnection];
  __int16 v41 = (void *)v17;
  unint64_t v42 = a7;
  uint64_t v19 = [v18 selectFeedItemIDsWithFeedLookupIDs:v17 feedRange:v13 feature:v14 maxCount:a7];

  uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_2;
  v50[3] = &unk_1E5B50288;
  id v39 = v12;
  id v51 = v39;
  v52 = self;
  id v21 = v13;
  id v53 = v21;
  uint64_t v22 = objc_msgSend(v20, "fc_array:", v50);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4;
  v45[3] = &unk_1E5B58D60;
  id v23 = v15;
  id v46 = v23;
  id v24 = v22;
  id v47 = v24;
  id v25 = v19;
  id v48 = v25;
  v49 = self;
  id v26 = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4((uint64_t)v45);
  id v27 = [v26 allObjects];
  id v28 = [(FCFDBStorage *)self cachedFeedItems];
  uint64_t v29 = objc_msgSend(v27, "fc_arrayByRemovingKeysInDictionary:", v28);

  if ([v29 count])
  {
    v30 = [(FCFDBStorage *)self readDBConnection];
    id v31 = [v30 selectFeedItemsWithIDs:v29];

    long long v32 = [(FCFDBStorage *)self cachedFeedItems];
    [v32 addEntriesFromDictionary:v31];
  }
  long long v33 = [(FCFDBStorage *)self cachedFeedItems];
  long long v34 = [v26 allObjects];
  long long v35 = objc_msgSend(v33, "nf_mutableObjectsForKeysWithoutMarker:", v34);

  if (v14)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_8;
    v43[3] = &unk_1E5B58D88;
    id v44 = v14;
    v36 = [v35 indexesOfObjectsPassingTest:v43];
    [v35 removeObjectsAtIndexes:v36];
  }
  [v35 sortUsingSelector:sel_compareOrderDescending_];
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL) {
    objc_msgSend(v35, "fc_trimToMaxCount:");
  }

  return v35;
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) _feedLookupIDForFeedID:a2];
  return [v2 numberWithLongLong:v3];
}

void __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_2(id *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1[4];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = [a1[5] _feedLookupIDForFeedID:v8];
        id v10 = [a1[5] cachedFeedItemOrders];
        uint64_t v11 = [v10 objectForKey:v8];

        uint64_t v12 = [a1[6] nsRange];
        uint64_t v14 = v13;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_3;
        v16[3] = &unk_1E5B58D10;
        id v17 = v3;
        uint64_t v18 = v9;
        objc_msgSend(v11, "enumerateIndexesInRange:options:usingBlock:", v12, v14, 0, v16);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

void __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40) | (a2 << 20)];
  [v2 addObject:v3];
}

id __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v16 = [MEMORY[0x1E4F1CA80] set];
    id v2 = [MEMORY[0x1E4F1CA70] orderedSet];
    [v2 addObjectsFromArray:*(void *)(a1 + 48)];
    [v2 addObjectsFromArray:*(void *)(a1 + 40)];
    [v2 sortUsingComparator:&__block_literal_global_135];
    id v3 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_7;
    v21[3] = &unk_1E5B58D38;
    v21[4] = *(void *)(a1 + 56);
    uint64_t v4 = objc_msgSend(v3, "fc_dictionaryByTransformingKeysWithBlock:", v21);
    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
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
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "unsignedLongLongValue") & 0xFFFFF);
          uint64_t v13 = [v4 objectForKeyedSubscript:v12];
          unint64_t v14 = [v13 unsignedIntegerValue];

          if (!v14 || [v5 countForObject:v12] < v14)
          {
            [v16 addObject:v11];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5;
    v22[3] = &unk_1E5B4E868;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 48);
    __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5((uint64_t)v22);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = v23;
  }

  return v16;
}

id __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  id v3 = [v1 setWithArray:v2];

  return v3;
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) _feedLookupIDForFeedID:a2];
  return [v2 numberWithLongLong:v3];
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 hasFeature:*(void *)(a1 + 32)] ^ 1;
}

- (void)insertFeedItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = (void *)[[NSString alloc] initWithFormat:@"accessing fdb storage outside the access queue"];
    *(_DWORD *)buf = 136315906;
    long long v32 = "-[FCFDBStorage insertFeedItems:]";
    __int16 v33 = 2080;
    long long v34 = "FCFDBStorage.m";
    __int16 v35 = 1024;
    int v36 = 336;
    __int16 v37 = 2114;
    long long v38 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v25 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v10 feedID];
        int64_t v12 = [(FCFDBStorage *)self _feedLookupIDForFeedID:v11];

        uint64_t v13 = [v10 order];
        unint64_t v14 = [(FCFDBStorage *)self cachedFeedItemOrders];
        id v15 = [v10 feedID];
        id v16 = [v14 objectForKey:v15];

        if (!v16)
        {
          id v16 = [MEMORY[0x1E4F28E60] indexSet];
          long long v17 = [(FCFDBStorage *)self cachedFeedItemOrders];
          long long v18 = [v10 feedID];
          [v17 setObject:v16 forKey:v18];
        }
        objc_msgSend(v16, "addIndex:", objc_msgSend(v10, "order"));
        long long v19 = [NSNumber numberWithLongLong:v12 | (v13 << 20)];
        [v25 setObject:v10 forKey:v19];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  long long v20 = [(FCFDBStorage *)self cachedFeedItems];
  [v20 addEntriesFromDictionary:v25];

  long long v21 = [(FCFDBStorage *)self modifiedFeedItemIDs];
  long long v22 = [v25 allKeys];
  [v21 addObjectsFromArray:v22];
}

- (void)updateFeedID:(id)a3 refreshedFromOrder:(unint64_t)a4 refreshedToOrder:(unint64_t)a5 fetchedRange:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int64_t v12 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v12
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v17 = (void *)[[NSString alloc] initWithFormat:@"accessing fdb storage outside the access queue"];
    int v18 = 136315906;
    long long v19 = "-[FCFDBStorage updateFeedID:refreshedFromOrder:refreshedToOrder:fetchedRange:]";
    __int16 v20 = 2080;
    long long v21 = "FCFDBStorage.m";
    __int16 v22 = 1024;
    int v23 = 367;
    __int16 v24 = 2114;
    id v25 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);
  }
  uint64_t v13 = [(FCFDBStorage *)self feedForFeedID:v10];
  unint64_t v14 = (void *)[v13 copyWithRefreshedFromOrder:a4 refreshedToOrder:a5 newlyFetchedRange:v11];
  id v15 = [(FCFDBStorage *)self cachedFeeds];
  [v15 setObject:v14 forKey:v10];

  id v16 = [(FCFDBStorage *)self modifiedFeedIDs];
  [v16 addObject:v10];
}

- (void)flushChanges
{
  id v2 = [(FCFDBStorage *)self saveQueue];
  dispatch_sync(v2, &__block_literal_global_43_2);
}

- (int64_t)_feedLookupIDForFeedID:(id)a3
{
  uint64_t v3 = [(FCFDBStorage *)self feedForFeedID:a3];
  int64_t v4 = [v3 feedLookupID];

  return v4;
}

- (id)_pruneFeedsIfNeeded:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = (void *)[[NSString alloc] initWithFormat:@"accessing fdb storage outside the access queue"];
    *(_DWORD *)buf = 136315906;
    id v44 = "-[FCFDBStorage _pruneFeedsIfNeeded:]";
    __int16 v45 = 2080;
    id v46 = "FCFDBStorage.m";
    __int16 v47 = 1024;
    int v48 = 394;
    __int16 v49 = 2114;
    v50 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (([(FCFDBStorage *)self options] & 4) != 0)
  {
    uint64_t v8 = [(FCFDBStorage *)self pruningPolicy];
    uint64_t v9 = [v8 feedRangeToPrune];

    if (v9)
    {
      id v6 = v9;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v25 = v4;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v26 = self;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v29;
        do
        {
          uint64_t v15 = 0;
          uint64_t v27 = v12;
          do
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v15);
            long long v17 = [v10 objectForKey:v16];
            if ([v17 hasFetchedRangesInRange:v6])
            {
              if (!v13) {
                uint64_t v13 = (void *)[v10 mutableCopy];
              }
              id v18 = v6;
              long long v19 = (void *)[v17 copyWithoutFetchedRange:v6];
              [v13 setObject:v19 forKey:v16];
              __int16 v20 = [(FCFDBStorage *)v26 modifiedFeedIDs];
              [v20 addObject:v16];

              long long v21 = [(FCFDBStorage *)v26 prunedFeedIDs];
              [v21 addObject:v16];

              id v6 = v18;
              uint64_t v12 = v27;
            }

            ++v15;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v42 count:16];
        }
        while (v12);
      }
      else
      {
        uint64_t v13 = 0;
      }

      if (v13) {
        __int16 v22 = v13;
      }
      else {
        __int16 v22 = v10;
      }
      id v7 = v22;

      id v4 = v25;
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      long long v34 = __36__FCFDBStorage__pruneFeedsIfNeeded___block_invoke_2;
      __int16 v35 = &unk_1E5B4C840;
      id v36 = v4;
      id v7 = v36;

      id v6 = 0;
    }
  }
  else
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    uint64_t v39 = __36__FCFDBStorage__pruneFeedsIfNeeded___block_invoke;
    long long v40 = &unk_1E5B4C840;
    id v41 = v4;
    id v6 = v41;
    id v7 = v6;
  }

  return v7;
}

id __36__FCFDBStorage__pruneFeedsIfNeeded___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __36__FCFDBStorage__pruneFeedsIfNeeded___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)options
{
  return self->_options;
}

- (NSString)path
{
  return self->_path;
}

- (FCFDBPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (FCFDBConnectionReadable)readDBConnection
{
  return self->_readDBConnection;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)cachedFeeds
{
  return self->_cachedFeeds;
}

- (NSMutableDictionary)cachedFeedItemOrders
{
  return self->_cachedFeedItemOrders;
}

- (NSMutableDictionary)cachedFeedItems
{
  return self->_cachedFeedItems;
}

- (int64_t)lastFeedLookupID
{
  return self->_lastFeedLookupID;
}

- (void)setLastFeedLookupID:(int64_t)a3
{
  self->_lastFeedLookupID = a3;
}

- (NSMutableSet)modifiedFeedItemIDs
{
  return self->_modifiedFeedItemIDs;
}

- (NSMutableSet)modifiedFeedIDs
{
  return self->_modifiedFeedIDs;
}

- (NSMutableSet)prunedFeedIDs
{
  return self->_prunedFeedIDs;
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (FCFDBConnectionWritable)writeDBConnection
{
  return self->_writeDBConnection;
}

- (void)setWriteDBConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeDBConnection, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_prunedFeedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedFeedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedFeedItemIDs, 0);
  objc_storeStrong((id *)&self->_cachedFeedItems, 0);
  objc_storeStrong((id *)&self->_cachedFeedItemOrders, 0);
  objc_storeStrong((id *)&self->_cachedFeeds, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_readDBConnection, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end