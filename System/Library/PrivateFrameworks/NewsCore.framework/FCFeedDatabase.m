@interface FCFeedDatabase
+ (id)temporaryFeedDatabaseWithEndpoint:(int64_t)a3;
- (FCFeedDatabase)initWithParentDirectoryURL:(id)a3 usage:(int64_t)a4 endpoint:(int64_t)a5;
- (FCFeedDatabaseLookupResult)_shortCircuitLookup:(void *)a3 withFeed:;
- (NSURL)parentDirectoryURL;
- (id)_feedsForLookups:(uint64_t)a1;
- (id)_serviceLookup:(void *)a3 withFeed:(void *)a4 feedItems:;
- (id)performDatabaseLookups:(id)a1;
- (id)performDatabaseLookups:(uint64_t)a3 boundedByCount:;
- (id)t_lookupFeedID:(id)a3 range:(id)a4 maxCount:(unint64_t)a5;
- (int64_t)endpoint;
- (int64_t)usage;
- (unsigned)version;
- (void)_performWithStorageAndWait:(uint64_t)a1;
- (void)_synchronizedInit;
- (void)enumerateRangesMissingFromLookups:(void *)a3 visitor:;
- (void)saveFeedItems:(void *)a3 feedIDs:(void *)a4 extentByFeedID:(void *)a5 requestRangeByFeedID:;
- (void)saveFeedItems:(void *)a3 forFeedID:(void *)a4 insertionToken:(void *)a5 requestDate:(char)a6 reachedToOrder:(uint64_t)a7 extent:(char)a8 reachedEnd:;
- (void)saveWithCompletionHandler:(id)a3;
- (void)t_insertSegmentForFeedID:(id)a3 range:(id)a4 items:(id)a5;
@end

@implementation FCFeedDatabase

- (FCFeedDatabase)initWithParentDirectoryURL:(id)a3 usage:(int64_t)a4 endpoint:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCFeedDatabase;
  v9 = [(FCFeedDatabase *)&v20 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    parentDirectoryURL = v9->_parentDirectoryURL;
    v9->_parentDirectoryURL = (NSURL *)v10;

    if (a4 == 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)[[NSString alloc] initWithFormat:@"feed database should not be created if it's not intended for use"];
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:]";
      __int16 v23 = 2080;
      v24 = "FCFeedDatabase.m";
      __int16 v25 = 1024;
      int v26 = 87;
      __int16 v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v9->_usage = a4;
    v9->_endpoint = a5;
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.news.feeddb.init", v12);
    initQueue = v9->_initQueue;
    v9->_initQueue = (OS_dispatch_queue *)v13;

    if (a5 == 1)
    {
      v17 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "feed database will use the OrderFeed endpoint", buf, 2u);
      }
      __int16 v16 = 1028;
    }
    else if (a5)
    {
      __int16 v16 = 24;
    }
    else
    {
      v15 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "feed database will use the MultiFeed endpoint", buf, 2u);
      }
      __int16 v16 = 25;
    }
    v9->_version = v16;
  }

  return v9;
}

+ (id)temporaryFeedDatabaseWithEndpoint:(int64_t)a3
{
  v3 = [[FCFeedDatabase alloc] initWithParentDirectoryURL:0 usage:2 endpoint:a3];
  return v3;
}

- (void)_synchronizedInit
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__FCFeedDatabase__synchronizedInit__block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

- (id)performDatabaseLookups:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__FCFeedDatabase_performDatabaseLookups___block_invoke;
    v8[3] = &unk_1E5B4C738;
    v8[4] = a1;
    id v9 = v3;
    id v5 = v4;
    id v10 = v5;
    -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)a1, v8);
    v6 = v10;
    a1 = v5;
  }
  return a1;
}

void __41__FCFeedDatabase_performDatabaseLookups___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  v2 = -[FCFeedDatabase _feedsForLookups:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v4 = *(id *)(v1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v82 objects:v97 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v83;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v83 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v82 + 1) + 8 * v8);
        if (v9) {
          uint64_t v10 = v9[2];
        }
        else {
          uint64_t v10 = 0;
        }
        v11 = [v2 objectForKeyedSubscript:v10];
        v12 = -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(void *)(v1 + 32), v9, v11);
        if (v12)
        {
          if (v9) {
            uint64_t v13 = v9[2];
          }
          else {
            uint64_t v13 = 0;
          }
          [*(id *)(v1 + 48) setObject:v12 forKey:v13];
        }
        else
        {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v82 objects:v97 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  uint64_t v15 = *(void *)(v1 + 32);
  id v16 = v3;
  id v17 = v2;
  uint64_t v77 = v1;
  if (!v15)
  {
    v76 = 0;
    goto LABEL_58;
  }
  uint64_t v69 = v15;
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v70 = v16;
  id v19 = v16;
  id obj = (id)[v19 countByEnumeratingWithState:&v92 objects:v101 count:16];
  if (!obj)
  {
    v75 = 0;
    v72 = 0;
    goto LABEL_50;
  }
  v75 = 0;
  uint64_t v20 = *(void *)v93;
  uint64_t v71 = *(void *)v93;
  v72 = 0;
  do
  {
    v21 = 0;
    do
    {
      if (*(void *)v93 != v20) {
        objc_enumerationMutation(v19);
      }
      v22 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v21);
      if (v22) {
        uint64_t v23 = v22[2];
      }
      else {
        uint64_t v23 = 0;
      }
      v24 = [v17 objectForKeyedSubscript:v23];
      __int16 v25 = v24;
      if (v24)
      {
        int v26 = [v24 feedID];
        if (v22) {
          __int16 v27 = (void *)v22[3];
        }
        else {
          __int16 v27 = 0;
        }
        id v28 = v27;
        uint64_t v29 = [v18 objectForKeyedSubscript:v28];

        if (v29)
        {
          v30 = [v18 objectForKeyedSubscript:v28];
          [v30 addObject:v26];
        }
        else
        {
          v30 = [MEMORY[0x1E4F1CA80] setWithObject:v26];
          [v18 setObject:v30 forKeyedSubscript:v28];
        }

        if (v22)
        {
          uint64_t v31 = v22[4];
          if ((unint64_t)(v31 + 1) >= 2)
          {
            id v32 = v19;
            v33 = v18;
            id v34 = v17;
            v35 = v72;
            if (!v72)
            {
              v35 = [MEMORY[0x1E4F1CA60] dictionary];
              uint64_t v31 = v22[4];
            }
            v36 = [NSNumber numberWithUnsignedInteger:v31 + 1];
            v72 = v35;
            [v35 setObject:v36 forKeyedSubscript:v26];

            id v17 = v34;
            v18 = v33;
            id v19 = v32;
            uint64_t v20 = v71;
          }
          if (!v75)
          {
            v37 = (void *)v22[5];
            goto LABEL_39;
          }
        }
        else
        {
          v37 = v75;
          if (!v75)
          {
LABEL_39:
            id v38 = v37;

            v75 = v38;
          }
        }

        uint64_t v1 = v77;
      }

      v21 = (char *)v21 + 1;
    }
    while (obj != v21);
    uint64_t v39 = [v19 countByEnumeratingWithState:&v92 objects:v101 count:16];
    id obj = (id)v39;
  }
  while (v39);
LABEL_50:

  if ([v18 count])
  {
    v40 = [MEMORY[0x1E4F1C9C8] date];
    v41 = [MEMORY[0x1E4F1CA48] array];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke;
    v86[3] = &unk_1E5B56308;
    id v42 = v19;
    id v87 = v42;
    id v43 = v41;
    id v88 = v43;
    uint64_t v89 = v69;
    id v90 = v75;
    id v91 = v72;
    [v18 enumerateKeysAndObjectsUsingBlock:v86];
    v44 = (void *)FCFeedDatabaseLog;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      uint64_t v46 = objc_msgSend(v40, "fc_millisecondTimeIntervalUntilNow");
      uint64_t v47 = [v43 count];
      uint64_t v48 = [v42 count];
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v47;
      uint64_t v1 = v77;
      *(_WORD *)&buf[22] = 2048;
      v99 = (void *)v48;
      _os_log_impl(&dword_1A460D000, v45, OS_LOG_TYPE_DEFAULT, "feed database took %llums to lookup %lu feed items across %lu feeds", buf, 0x20u);
    }
    id v16 = v70;
    if ((unint64_t)[v18 count] >= 2) {
      [v43 sortUsingSelector:sel_compareOrderDescending_];
    }
    v49 = (void *)MEMORY[0x1E4F1C9E8];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke_61;
    v99 = &unk_1E5B4BF78;
    id v100 = v43;
    id v50 = v43;
    v51 = objc_msgSend(v49, "fc_dictionary:", buf);
  }
  else
  {
    v51 = 0;
    id v16 = v70;
  }
  id v52 = v51;

  v76 = v52;
LABEL_58:
  v53 = v17;

  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obja = v16;
  uint64_t v54 = [obja countByEnumeratingWithState:&v78 objects:v96 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v79;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v79 != v56) {
          objc_enumerationMutation(obja);
        }
        v58 = *(void **)(*((void *)&v78 + 1) + 8 * v57);
        uint64_t v59 = *(void *)(v1 + 32);
        if (v58) {
          v60 = (void *)v58[2];
        }
        else {
          v60 = 0;
        }
        id v61 = v60;
        v62 = [v53 objectForKeyedSubscript:v61];
        if (v58) {
          v63 = (void *)v58[2];
        }
        else {
          v63 = 0;
        }
        id v64 = v63;
        v65 = [v76 objectForKeyedSubscript:v64];
        v66 = -[FCFeedDatabase _serviceLookup:withFeed:feedItems:](v59, v58, v62, v65);

        uint64_t v1 = v77;
        if (v58) {
          uint64_t v67 = v58[2];
        }
        else {
          uint64_t v67 = 0;
        }
        [*(id *)(v77 + 48) setObject:v66 forKey:v67];

        ++v57;
      }
      while (v55 != v57);
      uint64_t v68 = [obja countByEnumeratingWithState:&v78 objects:v96 count:16];
      uint64_t v55 = v68;
    }
    while (v68);
  }
}

- (id)_feedsForLookups:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 48);
    id v4 = objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_57);
    uint64_t v5 = [v3 feedsForFeedIDs:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (FCFeedDatabaseLookupResult)_shortCircuitLookup:(void *)a3 withFeed:
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5) {
      uint64_t v7 = (void *)v5[3];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    if ([v8 isEmpty])
    {
      id v9 = objc_alloc_init(FCFeedDatabaseLookupResult);
      v11 = v9;
      if (v9)
      {
        objc_setProperty_nonatomic_copy(v9, v10, 0, 16);
        objc_setProperty_nonatomic_copy(v11, v12, v8, 24);
        v11->_exhaustedRange = 1;
      }
      goto LABEL_36;
    }
    if (v5 && *((unsigned char *)v5 + 8))
    {
      v11 = 0;
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v13 = [v6 refreshRegion];
    uint64_t v14 = v13;
    if (v13 && [v13 containsFeedRange:v8])
    {
      uint64_t v15 = objc_alloc_init(FCFeedDatabaseLookupResult);
      v11 = v15;
      if (v15) {
        objc_setProperty_nonatomic_copy(v15, v16, 0, 16);
      }
      id v17 = [v8 top];
      v18 = [v14 bottom];
      uint64_t v20 = +[FCFeedRange feedRangeWithTop:v17 bottom:v18];
      if (v11)
      {
        objc_setProperty_nonatomic_copy(v11, v19, v20, 24);

        v11->_exhaustedRange = 1;
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_33;
    }
    v21 = [v6 fetchedRanges];
    id v17 = [v21 firstObject];

    v22 = off_1E5B4A000;
    if ([v6 refreshedFromOrder]
      && ([v8 top],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          [v14 top],
          v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v23 compareToCursor:v24],
          v24,
          v23,
          v25 != 1))
    {
      if (v17)
      {
        v18 = [v8 top];
        unint64_t v46 = [v18 order];
        uint64_t v20 = [v17 top];
        if (v46 <= [(FCFeedInsertionToken *)v20 order])
        {
          v11 = 0;
          goto LABEL_33;
        }
        uint64_t v47 = [v14 bottom];
        unint64_t v51 = [v47 order];
        uint64_t v48 = [v17 top];
        unint64_t v49 = [v48 order];

        BOOL v50 = v51 > v49;
        v22 = off_1E5B4A000;
        if (!v50)
        {
          v11 = 0;
          goto LABEL_34;
        }
      }
      id v52 = v17;
      int v26 = v22;
      __int16 v27 = [v14 bottom];
    }
    else
    {
      id v52 = v17;
      int v26 = off_1E5B4A000;
      __int16 v27 = +[FCFeedCursor cursorForCurrentDate];
    }
    id v28 = v27;
    uint64_t v29 = [v27 order];

    v11 = objc_alloc_init(FCFeedDatabaseLookupResult);
    v30 = [v8 top];
    uint64_t v31 = [v8 top];
    id v32 = +[FCFeedRange feedRangeWithTop:v30 bottom:v31];
    id v34 = v32;
    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v33, v32, 24);

      v11->_ckFromOrder = v29;
    }
    else
    {
    }
    v35 = [v6 fetchedRanges];
    v18 = [v35 firstObject];

    v36 = [v8 bottom];
    v37 = v36;
    if (v18)
    {
      id v38 = [v18 top];
      uint64_t v39 = [v37 topmostCursor:v38];
      uint64_t v40 = [v39 order];
      if (v11) {
        v11->_ckToOrder = v40 + 1;
      }
    }
    else
    {
      uint64_t v41 = [v36 order];
      if (v11) {
        v11->_ckToOrder = v41 + 1;
      }
    }

    uint64_t v20 = objc_alloc_init(FCFeedInsertionToken);
    id v42 = [(__objc2_class *)v26[141] cursorForTopOfFeed];
    uint64_t v43 = [v42 order];
    if (v20) {
      v20->_fromOrder = v43;
    }

    id v17 = v52;
    if (v11)
    {
      uint64_t v44 = v11->_ckToOrder - 1;
      if (!v20)
      {
LABEL_32:
        -[FCPurchaseLookupResult setIntroOffer:]((uint64_t)v11, v20);
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v44 = -1;
      if (!v20) {
        goto LABEL_32;
      }
    }
    v20->_toOrder = v44;
    goto LABEL_32;
  }
  v11 = 0;
LABEL_37:

  return v11;
}

- (id)_serviceLookup:(void *)a3 withFeed:(void *)a4 feedItems:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x3032000000;
    uint64_t v71 = __Block_byref_object_copy__41;
    v72 = __Block_byref_object_dispose__41;
    v73 = objc_alloc_init(FCFeedDatabaseLookupResult);
    if (v7)
    {
      id v10 = *((id *)v7 + 3);
      unint64_t v11 = *((void *)v7 + 4);
      BOOL v12 = *((unsigned char *)v7 + 8) != 0;
    }
    else
    {
      unint64_t v11 = 0;
      id v10 = 0;
      BOOL v12 = 0;
    }
    if ([v10 isEmpty])
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = (void *)[[NSString alloc] initWithFormat:@"empty feed ranges aren't handled yet"];
        *(_DWORD *)buf = 136315906;
        v75 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
        __int16 v76 = 2080;
        uint64_t v77 = "FCFeedDatabase.m";
        __int16 v78 = 1024;
        int v79 = 803;
        __int16 v80 = 2114;
        long long v81 = v44;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
    if (v12)
    {
      id v16 = objc_msgSend(v9, "fc_subarrayWithMaxCount:", v11);
      id v17 = (void *)v69[5];
      if (v17) {
        objc_setProperty_nonatomic_copy(v17, v15, v16, 16);
      }

      v18 = (void *)v69[5];
      if (v18) {
        v18 = (void *)v18[2];
      }
      id v19 = v18;
      v21 = FCFeedRangeCoveredByFeedItems(v19);
      v22 = (void *)v69[5];
      if (v22) {
        objc_setProperty_nonatomic_copy(v22, v20, v21, 24);
      }

      uint64_t v23 = (void *)v69[5];
      if (v23) {
        uint64_t v23 = (void *)v23[2];
      }
      v24 = v23;
      uint64_t v25 = [v24 count];
      uint64_t v26 = [v9 count];
      uint64_t v27 = v69[5];
      if (v27) {
        *(unsigned char *)(v27 + 8) = v25 != v26;
      }
      goto LABEL_28;
    }
    id v28 = [v8 refreshRegion];
    v24 = v28;
    if (v28)
    {
      if ([v28 containsFeedRange:v10])
      {
        uint64_t v29 = MEMORY[0x1E4F14500];
        id v30 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v61 = (void *)[[NSString alloc] initWithFormat:@"this case should have been short-circuited"];
          *(_DWORD *)buf = 136315906;
          v75 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
          __int16 v76 = 2080;
          uint64_t v77 = "FCFeedDatabase.m";
          __int16 v78 = 1024;
          int v79 = 816;
          __int16 v80 = 2114;
          long long v81 = v61;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
LABEL_27:

LABEL_28:
        id v36 = (id)v69[5];

        _Block_object_dispose(&v68, 8);
        goto LABEL_29;
      }
      uint64_t v31 = [v10 top];
      id v32 = [v24 top];
      BOOL v33 = [v31 compareToCursor:v32] == 1;

      if (!v33)
      {
        id v38 = [v8 fetchedRanges];
        BOOL v39 = [v38 count] == 0;

        if (!v39)
        {
          uint64_t v40 = [v8 contiguousFetchedRangeInRange:v10];
          uint64_t v41 = objc_msgSend(v9, "fc_subarrayWithMaxCount:", v11);
          unint64_t v63 = [v41 count];
          unint64_t v42 = [v9 count];
          if (v40) {
            int v43 = [v40 containsFeedRange:v10];
          }
          else {
            int v43 = 0;
          }
          if ([v9 count] >= v11) {
            int v48 = 1;
          }
          else {
            int v48 = v43;
          }
          if (v48 == 1)
          {
            unint64_t v49 = (void *)v69[5];
            if (v49) {
              objc_setProperty_nonatomic_copy(v49, v47, v41, 16);
            }
            unint64_t v51 = FCFeedRangeCoveredByFeedItems(v41);
            id v52 = (void *)v69[5];
            if (v52) {
              objc_setProperty_nonatomic_copy(v52, v50, v51, 24);
            }

            uint64_t v53 = v69[5];
            if (v53)
            {
              if (v63 >= v42) {
                char v54 = v43;
              }
              else {
                char v54 = 0;
              }
              *(unsigned char *)(v53 + 8) = v54;
            }
          }
          else
          {
            uint64_t v55 = [v10 top];
            uint64_t v56 = [v10 top];
            v58 = +[FCFeedRange feedRangeWithTop:v55 bottom:v56];
            uint64_t v59 = (void *)v69[5];
            if (v59) {
              objc_setProperty_nonatomic_copy(v59, v57, v58, 24);
            }

            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __52__FCFeedDatabase__serviceLookup_withFeed_feedItems___block_invoke;
            v64[3] = &unk_1E5B56330;
            id v65 = v10;
            uint64_t v67 = &v68;
            id v66 = v8;
            [v66 enumerateGapsWithBlock:v64];
          }
          goto LABEL_28;
        }
        v45 = MEMORY[0x1E4F14500];
        id v46 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v62 = (void *)[[NSString alloc] initWithFormat:@"this case should have been short-circuited"];
          *(_DWORD *)buf = 136315906;
          v75 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
          __int16 v76 = 2080;
          uint64_t v77 = "FCFeedDatabase.m";
          __int16 v78 = 1024;
          int v79 = 824;
          __int16 v80 = 2114;
          long long v81 = v62;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        goto LABEL_27;
      }
    }
    id v34 = MEMORY[0x1E4F14500];
    id v35 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v60 = (void *)[[NSString alloc] initWithFormat:@"this case should have been short-circuited"];
      *(_DWORD *)buf = 136315906;
      v75 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
      __int16 v76 = 2080;
      uint64_t v77 = "FCFeedDatabase.m";
      __int16 v78 = 1024;
      int v79 = 820;
      __int16 v80 = 2114;
      long long v81 = v60;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_27;
  }
  id v36 = 0;
LABEL_29:

  return v36;
}

- (void)_performWithStorageAndWait:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    if (!NSClassFromString(&cfstr_Xctest.isa)
      && [MEMORY[0x1E4F29060] isMainThread]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v4 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
      int v5 = 136315906;
      id v6 = "-[FCFeedDatabase _performWithStorageAndWait:]";
      __int16 v7 = 2080;
      id v8 = "FCFeedDatabase.m";
      __int16 v9 = 1024;
      int v10 = 533;
      __int16 v11 = 2114;
      BOOL v12 = v4;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
    }
    -[FCFeedDatabase _synchronizedInit](a1);
    [*(id *)(a1 + 48) accessWithBlock:v3];
  }
}

- (id)performDatabaseLookups:(uint64_t)a3 boundedByCount:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v20 = v5;
  if (a1)
  {
    id v6 = v5;
    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      __int16 v11 = MEMORY[0x1E4F14500];
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v7);
          }
          id v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
          if (v14)
          {
            if (v14[5] && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"count-bounded lookups don't yet support required features"];
              *(_DWORD *)buf = 136315906;
              id v30 = "-[FCFeedDatabase performDatabaseLookups:boundedByCount:]";
              __int16 v31 = 2080;
              id v32 = "FCFeedDatabase.m";
              __int16 v33 = 1024;
              int v34 = 170;
              __int16 v35 = 2114;
              id v36 = v15;
              _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            v14[4] = a3;
            objc_setProperty_nonatomic_copy(v14, v9, 0, 40);
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v10);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke;
    v21[3] = &unk_1E5B56270;
    v21[4] = a1;
    id v22 = v7;
    id v16 = v19;
    id v23 = v16;
    uint64_t v24 = a3;
    -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)a1, v21);
    id v17 = v23;
    a1 = v16;
  }
  return a1;
}

void __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke(uint64_t a1)
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  v110 = -[FCFeedDatabase _feedsForLookups:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v127 objects:v142 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v128;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v128 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v127 + 1) + 8 * v6);
        if (v7) {
          uint64_t v8 = v7[2];
        }
        else {
          uint64_t v8 = 0;
        }
        __int16 v9 = [v110 objectForKeyedSubscript:v8];
        uint64_t v10 = -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(void *)(a1 + 32), v7, v9);
        __int16 v11 = (void *)v10;
        if (v10 && *(void *)(v10 + 40))
        {
          if (v7) {
            uint64_t v12 = v7[2];
          }
          else {
            uint64_t v12 = 0;
          }
          [*(id *)(a1 + 48) setObject:v10 forKey:v12];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v13 = [v2 countByEnumeratingWithState:&v127 objects:v142 count:16];
      uint64_t v4 = v13;
    }
    while (v13);
  }

  unint64_t v14 = [*(id *)(a1 + 48) count];
  if (v14 < [*(id *)(a1 + 40) count])
  {
    id v15 = *(id *)(a1 + 32);
    uint64_t v99 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 40);
    id v111 = v110;
    id v17 = (void *)&unk_1A4973000;
    unint64_t v18 = 0x1E4F1C000;
    id v101 = v15;
    if (v15)
    {
      id v19 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v103 = v16;
      id obj = v16;
      uint64_t v20 = [obj countByEnumeratingWithState:&v136 objects:v149 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        v106 = 0;
        uint64_t v22 = *(void *)v137;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v137 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v136 + 1) + 8 * v23);
            if (v24) {
              uint64_t v25 = v24[2];
            }
            else {
              uint64_t v25 = 0;
            }
            long long v26 = [v111 objectForKeyedSubscript:v25];
            long long v27 = v26;
            if (v26)
            {
              long long v28 = [v26 feedID];
              if (v24) {
                uint64_t v29 = (void *)v24[3];
              }
              else {
                uint64_t v29 = 0;
              }
              id v30 = v29;
              __int16 v31 = [v19 objectForKeyedSubscript:v30];

              if (v31)
              {
                id v32 = [v19 objectForKeyedSubscript:v30];
                [v32 addObject:v28];
              }
              else
              {
                id v32 = [MEMORY[0x1E4F1CA80] setWithObject:v28];
                [v19 setObject:v32 forKeyedSubscript:v30];
              }

              if (v24)
              {
                uint64_t v33 = v24[4];
                if ((unint64_t)(v33 + 1) >= 2)
                {
                  uint64_t v34 = (uint64_t)v106;
                  if (!v106)
                  {
                    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
                    uint64_t v33 = v24[4];
                  }
                  __int16 v35 = (void *)v34;
                  id v36 = [NSNumber numberWithUnsignedInteger:v33 + 1];
                  v106 = v35;
                  [v35 setObject:v36 forKeyedSubscript:v28];
                }
              }
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v37 = [obj countByEnumeratingWithState:&v136 objects:v149 count:16];
          uint64_t v21 = v37;
        }
        while (v37);
      }
      else
      {
        v106 = 0;
      }

      if ([v19 count])
      {
        uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
        unint64_t v18 = 0x1E4F1C000uLL;
        BOOL v39 = [MEMORY[0x1E4F1CA48] array];
        v131[0] = MEMORY[0x1E4F143A8];
        id v17 = &unk_1A4973000;
        v131[1] = 3221225472;
        v131[2] = __68__FCFeedDatabase__feedItemsForLookups_withFeedsByID_boundedByCount___block_invoke;
        v131[3] = &unk_1E5B56358;
        id v40 = v39;
        id v132 = v40;
        id v133 = v101;
        id v134 = v106;
        uint64_t v135 = v99 + 1;
        [v19 enumerateKeysAndObjectsUsingBlock:v131];
        uint64_t v41 = (void *)FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v42 = v41;
          uint64_t v43 = objc_msgSend(v38, "fc_millisecondTimeIntervalUntilNow");
          uint64_t v44 = [v40 count];
          uint64_t v45 = [obj count];
          *(_DWORD *)buf = 134218496;
          uint64_t v144 = v43;
          __int16 v145 = 2048;
          uint64_t v146 = v44;
          __int16 v147 = 2048;
          uint64_t v148 = v45;
          _os_log_impl(&dword_1A460D000, v42, OS_LOG_TYPE_DEFAULT, "feed database took %llums to lookup %lu feed items across %lu feeds", buf, 0x20u);
        }
        if ((unint64_t)[v19 count] >= 2) {
          [v40 sortUsingSelector:sel_compareOrderDescending_];
        }
        id v46 = v134;
        id v15 = v40;
      }
      else
      {
        id v15 = 0;
        unint64_t v18 = 0x1E4F1C000uLL;
        id v17 = &unk_1A4973000;
      }

      id v16 = v103;
    }

    unint64_t v104 = [v15 count];
    long long v95 = v15;
    uint64_t v47 = objc_msgSend(v15, "fc_subarrayWithMaxCount:", *(void *)(a1 + 56));
    uint64_t v102 = [v47 count];
    int v48 = (void *)MEMORY[0x1E4F1C9E8];
    v125[0] = MEMORY[0x1E4F143A8];
    uint64_t v49 = v17[214];
    v125[1] = v49;
    v125[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_2;
    v125[3] = &unk_1E5B4BF78;
    id v50 = v47;
    id v126 = v50;
    objc_msgSend(v48, "fc_dictionary:", v125);
    id obja = (id)objc_claimAutoreleasedReturnValue();
    long long v94 = v50;
    v107 = FCFeedRangeCoveredByFeedItems(v50);
    v97 = [*(id *)(v18 + 2632) array];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v98 = *(id *)(a1 + 40);
    uint64_t v51 = [v98 countByEnumeratingWithState:&v121 objects:v141 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v100 = *(void *)v122;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v122 != v100) {
            objc_enumerationMutation(v98);
          }
          uint64_t v54 = *(void *)(*((void *)&v121 + 1) + 8 * v53);
          if (v54) {
            uint64_t v55 = *(void *)(v54 + 16);
          }
          else {
            uint64_t v55 = 0;
          }
          uint64_t v56 = objc_msgSend(v111, "objectForKeyedSubscript:", v55, v94);
          if (v54) {
            uint64_t v57 = *(void **)(v54 + 24);
          }
          else {
            uint64_t v57 = 0;
          }
          id v58 = v57;
          uint64_t v59 = [v56 contiguousFetchedRangeInRange:v58];

          if (v54) {
            v60 = *(void **)(v54 + 16);
          }
          else {
            v60 = 0;
          }
          id v61 = v60;
          v62 = [obja objectForKeyedSubscript:v61];
          unint64_t v63 = FCFeedItemsCoveredByRange(v62, v59);

          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = v49;
          v116[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3;
          v116[3] = &unk_1E5B56248;
          v116[4] = v54;
          id v64 = v59;
          id v117 = v64;
          uint64_t v65 = *(void *)(a1 + 56);
          uint64_t v119 = v102;
          uint64_t v120 = v65;
          id v66 = v107;
          id v118 = v66;
          if (__56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3((uint64_t)v116))
          {
            [v97 addObject:v54];
          }
          else
          {
            uint64_t v67 = objc_alloc_init(FCFeedDatabaseLookupResult);
            uint64_t v69 = v67;
            if (v67)
            {
              objc_setProperty_nonatomic_copy(v67, v68, v63, 16);
              objc_setProperty_nonatomic_copy(v69, v70, v66, 24);
            }
            unint64_t v71 = *(void *)(a1 + 56);
            if (v104 <= v71)
            {
              if (v54) {
                v73 = *(void **)(v54 + 24);
              }
              else {
                v73 = 0;
              }
              id v96 = v73;
              char v72 = objc_msgSend(v64, "containsFeedRange:");
            }
            else
            {
              char v72 = 0;
            }
            if (v69) {
              v69->_exhaustedRange = v72;
            }
            if (v104 <= v71) {

            }
            if (v54) {
              uint64_t v74 = *(void *)(v54 + 16);
            }
            else {
              uint64_t v74 = 0;
            }
            [*(id *)(a1 + 48) setObject:v69 forKey:v74];
          }
          ++v53;
        }
        while (v52 != v53);
        uint64_t v75 = [v98 countByEnumeratingWithState:&v121 objects:v141 count:16];
        uint64_t v52 = v75;
      }
      while (v75);
    }

    __int16 v76 = v97;
    if ([v97 count])
    {
      [*(id *)(a1 + 48) removeAllObjects];
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v77 = v97;
      uint64_t v78 = [v77 countByEnumeratingWithState:&v112 objects:v140 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v113;
        do
        {
          uint64_t v81 = 0;
          do
          {
            if (*(void *)v113 != v80) {
              objc_enumerationMutation(v77);
            }
            uint64_t v82 = *(void **)(*((void *)&v112 + 1) + 8 * v81);
            if (v82) {
              uint64_t v83 = v82[2];
            }
            else {
              uint64_t v83 = 0;
            }
            long long v84 = objc_msgSend(v111, "objectForKeyedSubscript:", v83, v94);
            long long v85 = v84;
            if (v82) {
              uint64_t v86 = v82[3];
            }
            else {
              uint64_t v86 = 0;
            }
            id v87 = [v84 contiguousFetchedRangeInRange:v86];
            if (v82) {
              uint64_t v88 = v82[2];
            }
            else {
              uint64_t v88 = 0;
            }
            uint64_t v89 = [obja objectForKeyedSubscript:v88];
            id v90 = FCFeedItemsCoveredByRange(v89, v87);

            id v91 = -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(void *)(a1 + 32), v82, v85);
            if (!v91
              && (-[FCFeedDatabase _serviceLookup:withFeed:feedItems:](*(void *)(a1 + 32), v82, v85, v90),
                  (id v91 = objc_claimAutoreleasedReturnValue()) == 0)
              || !v91[5])
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v105 = (void *)[[NSString alloc] initWithFormat:@"feed is missing data but lookup result has no cursor"];
                *(_DWORD *)v149 = 136315906;
                v150 = "-[FCFeedDatabase performDatabaseLookups:boundedByCount:]_block_invoke";
                __int16 v151 = 2080;
                v152 = "FCFeedDatabase.m";
                __int16 v153 = 1024;
                int v154 = 271;
                __int16 v155 = 2114;
                v156 = v105;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v149, 0x26u);
              }
            }
            if (v82) {
              uint64_t v92 = v82[2];
            }
            else {
              uint64_t v92 = 0;
            }
            [*(id *)(a1 + 48) setObject:v91 forKey:v92];

            ++v81;
          }
          while (v79 != v81);
          uint64_t v93 = [v77 countByEnumeratingWithState:&v112 objects:v140 count:16];
          uint64_t v79 = v93;
        }
        while (v93);
      }

      __int16 v76 = v97;
    }
  }
}

void __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "feedID", (void)v13);
        __int16 v11 = [v3 objectForKeyedSubscript:v10];

        if (v11)
        {
          uint64_t v12 = [v3 objectForKeyedSubscript:v10];
          [v12 addObject:v9];
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
          [v3 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

BOOL __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 8)) {
      return 0;
    }
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return ([*(id *)(a1 + 40) containsFeedRange:v3] & 1) == 0
      && (*(void *)(a1 + 56) < *(void *)(a1 + 64)
       || ([*(id *)(a1 + 40) containsFeedRange:*(void *)(a1 + 48)] & 1) == 0);
}

- (void)saveFeedItems:(void *)a3 forFeedID:(void *)a4 insertionToken:(void *)a5 requestDate:(char)a6 reachedToOrder:(uint64_t)a7 extent:(char)a8 reachedEnd:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (!a1) {
    goto LABEL_16;
  }
  if ([v15 count] | a7
    || (a8 & 1) != 0
    || (a6 & 1) != 0
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (v16) {
      goto LABEL_9;
    }
  }
  else
  {
    id v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedItems.count != 0 || ckReachedToOrder || reachedEnd || extent != 0");
    *(_DWORD *)buf = 136315906;
    uint64_t v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    __int16 v34 = 2080;
    __int16 v35 = "FCFeedDatabase.m";
    __int16 v36 = 1024;
    int v37 = 289;
    __int16 v38 = 2114;
    BOOL v39 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16) {
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    __int16 v34 = 2080;
    __int16 v35 = "FCFeedDatabase.m";
    __int16 v36 = 1024;
    int v37 = 290;
    __int16 v38 = 2114;
    BOOL v39 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_9:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "opaqueInsertionToken != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    __int16 v34 = 2080;
    __int16 v35 = "FCFeedDatabase.m";
    __int16 v36 = 1024;
    int v37 = 291;
    __int16 v38 = 2114;
    BOOL v39 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v18)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "requestDate != nil");
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
        __int16 v34 = 2080;
        __int16 v35 = "FCFeedDatabase.m";
        __int16 v36 = 1024;
        int v37 = 292;
        __int16 v38 = 2114;
        BOOL v39 = v22;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v18)
  {
    goto LABEL_12;
  }
  if (v16)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __102__FCFeedDatabase_saveFeedItems_forFeedID_insertionToken_requestDate_reachedToOrder_extent_reachedEnd___block_invoke;
    v23[3] = &unk_1E5B56298;
    id v24 = v17;
    uint64_t v25 = a1;
    id v26 = v16;
    id v27 = v15;
    char v30 = a6;
    id v28 = v18;
    uint64_t v29 = a7;
    char v31 = a8;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v23);
  }
LABEL_16:
}

void __102__FCFeedDatabase_saveFeedItems_forFeedID_insertionToken_requestDate_reachedToOrder_extent_reachedEnd___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = (void *)[[NSString alloc] initWithFormat:@"can't save feed items without an insertion token"];
    *(_DWORD *)buf = 136315906;
    uint64_t v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    __int16 v70 = 2080;
    unint64_t v71 = "FCFeedDatabase.m";
    __int16 v72 = 1024;
    int v73 = 301;
    __int16 v74 = 2114;
    uint64_t v75 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = FCCheckedDynamicCast(v2, *(void *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 48);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 feedForFeedID:*(void *)(a1 + 48)];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = (void *)[[NSString alloc] initWithFormat:@"must have a feed in order to save feed items"];
    *(_DWORD *)buf = 136315906;
    uint64_t v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    __int16 v70 = 2080;
    unint64_t v71 = "FCFeedDatabase.m";
    __int16 v72 = 1024;
    int v73 = 305;
    __int16 v74 = 2114;
    uint64_t v75 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v7 = [v6 refreshedFromOrder];
  uint64_t v8 = [v6 refreshedToOrder];
  __int16 v9 = [*(id *)(a1 + 56) sortedArrayUsingSelector:sel_compareOrderDescending_];
  if (v3) {
    uint64_t v10 = v3[1];
  }
  else {
    uint64_t v10 = 0;
  }
  __int16 v11 = +[FCFeedCursor cursorForOrder:v10];
  if (v3) {
    uint64_t v12 = v3[2];
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v8;
  long long v14 = +[FCFeedCursor cursorForOrder:v12];
  id v15 = +[FCFeedRange feedRangeWithTop:v11 bottom:v14];
  id v16 = FCFeedItemsCoveredByRange(v9, v15);

  id v17 = v16;
  uint64_t v18 = [v16 count];
  if (v18 != [*(id *)(a1 + 56) count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"CK cursor shouldn't produce feed items that precede it"];
    *(_DWORD *)buf = 136315906;
    uint64_t v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    __int16 v70 = 2080;
    unint64_t v71 = "FCFeedDatabase.m";
    __int16 v72 = 1024;
    int v73 = 315;
    __int16 v74 = 2114;
    uint64_t v75 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v19 = *(unsigned __int8 *)(a1 + 80) != 0;
  if ([*(id *)(a1 + 56) count])
  {
    unint64_t v20 = v13;
    if ([v17 count]) {
      goto LABEL_24;
    }
    uint64_t v21 = (void *)FCFeedDatabaseLog;
    if (!os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = 1;
      goto LABEL_24;
    }
    if (v3) {
      uint64_t v25 = (const char *)v3[2];
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = v21;
    id v27 = [v6 feedID];
    *(_DWORD *)buf = 134218242;
    uint64_t v69 = v25;
    __int16 v70 = 2112;
    unint64_t v71 = v27;
    _os_log_error_impl(&dword_1A460D000, v26, OS_LOG_TYPE_ERROR, "pretending to reach order %llu for feed %@ because rdar://problem/27201634 caused us to make no progress", buf, 0x16u);

    BOOL v19 = 1;
  }
  unint64_t v20 = v13;
LABEL_24:
  id v66 = [v6 refreshRegion];
  BOOL v63 = v19;
  if (v3) {
    uint64_t v28 = v3[1];
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = +[FCFeedCursor cursorForTopOfFeed];
  uint64_t v30 = [v29 order];

  if (v28 == v30)
  {
    uint64_t v31 = [v6 refreshedFromOrder];
    unint64_t v32 = objc_msgSend(*(id *)(a1 + 64), "fc_millisecondTimeIntervalSince1970");
    if (v32 > v7) {
      unint64_t v7 = v32;
    }
    if (v3) {
      unint64_t v33 = v3[2];
    }
    else {
      unint64_t v33 = 0;
    }
    uint64_t v34 = *(void *)(a1 + 72);
    BOOL v35 = v34 != 0;
    unint64_t v36 = v34 - 1;
    if (!v35) {
      unint64_t v36 = 0;
    }
    if (v31) {
      unint64_t v37 = v20;
    }
    else {
      unint64_t v37 = -1;
    }
    if (v33 < v37) {
      unint64_t v37 = v33;
    }
    if (v33 >= v36) {
      unint64_t v20 = v37;
    }
    else {
      unint64_t v20 = v36;
    }
    if (![v17 count])
    {
      id v50 = 0;
      uint64_t v51 = v66;
      goto LABEL_66;
    }
    uint64_t v67 = v28;
    unint64_t v64 = v7;
  }
  else
  {
    uint64_t v67 = v28;
    unint64_t v64 = v7;
    [v17 count];
  }
  uint64_t v65 = v17;
  __int16 v38 = FCFeedRangeCoveredByFeedItems(v17);
  BOOL v39 = [v38 top];
  uint64_t v40 = [v38 bottom];
  if (v67 == v30)
  {
    uint64_t v41 = objc_msgSend(v6, "fetchedRangePrecedingOrder:", objc_msgSend(v39, "order"));
    unint64_t v42 = v41;
    if (v41)
    {
      unint64_t v60 = v20;
      id v61 = v9;
      v62 = v6;
      uint64_t v43 = [v41 bottom];
      unint64_t v44 = [v43 order];
      unint64_t v45 = [v39 order];

      if (v44 > v45)
      {
        uint64_t v46 = [v42 bottom];

        BOOL v39 = (void *)v46;
      }
      __int16 v9 = v61;
      uint64_t v6 = v62;
      unint64_t v20 = v60;
    }
  }
  else
  {
    if (v3) {
      uint64_t v47 = v3[1];
    }
    else {
      uint64_t v47 = 0;
    }
    +[FCFeedCursor cursorForOrder:v47];
    BOOL v39 = v42 = v39;
  }

  if (*(unsigned char *)(a1 + 81))
  {
    uint64_t v48 = +[FCFeedCursor cursorForBottomOfFeed];
  }
  else
  {
    if (v63)
    {
      if (v3) {
        uint64_t v49 = v3[2];
      }
      else {
        uint64_t v49 = 0;
      }
    }
    else
    {
      uint64_t v52 = *(void *)(a1 + 72);
      if (!v52) {
        goto LABEL_62;
      }
      uint64_t v49 = v52 - 1;
    }
    uint64_t v48 = +[FCFeedCursor cursorForOrder:v49];
  }
  uint64_t v53 = (void *)v48;

  uint64_t v40 = v53;
LABEL_62:
  uint64_t v51 = v66;
  if (v67 == v30 && objc_msgSend(v66, "containsOrder:", objc_msgSend(v40, "order")))
  {
    [v66 bottom];
    v55 = unint64_t v54 = v20;

    uint64_t v40 = (void *)v55;
    unint64_t v20 = v54;
    uint64_t v51 = v66;
  }
  id v50 = +[FCFeedRange feedRangeWithTop:v39 bottom:v40];

  unint64_t v7 = v64;
  id v17 = v65;
LABEL_66:
  uint64_t v56 = *(void *)(a1 + 40);
  if (v56) {
    uint64_t v57 = *(void **)(v56 + 48);
  }
  else {
    uint64_t v57 = 0;
  }
  [v57 insertFeedItems:v17];
  uint64_t v58 = *(void *)(a1 + 40);
  if (v58) {
    uint64_t v59 = *(void **)(v58 + 48);
  }
  else {
    uint64_t v59 = 0;
  }
  [v59 updateFeedID:*(void *)(a1 + 48) refreshedFromOrder:v7 refreshedToOrder:v20 fetchedRange:v50];
}

- (void)saveFeedItems:(void *)a3 feedIDs:(void *)a4 extentByFeedID:(void *)a5 requestRangeByFeedID:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__FCFeedDatabase_saveFeedItems_feedIDs_extentByFeedID_requestRangeByFeedID___block_invoke;
    v13[3] = &unk_1E5B4DC70;
    id v14 = v9;
    id v15 = v10;
    uint64_t v16 = a1;
    id v17 = v11;
    id v18 = v12;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v13);
  }
}

void __76__FCFeedDatabase_saveFeedItems_feedIDs_extentByFeedID_requestRangeByFeedID___block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v72 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v87 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        id v9 = [v8 feedID];
        id v10 = [v2 objectForKeyedSubscript:v9];

        if (v10)
        {
          [v10 addObject:v8];
        }
        else
        {
          id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
          id v12 = [v8 feedID];
          [v2 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v5);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v13 = v72;
  id obj = *(id *)(v72 + 40);
  uint64_t v73 = [obj countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v73)
  {
    uint64_t v71 = *(void *)v83;
    *(void *)&long long v14 = 136315906;
    long long v69 = v14;
    uint64_t v80 = v2;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v83 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v82 + 1) + 8 * v15);
        uint64_t v17 = *(void *)(v13 + 48);
        if (v17) {
          id v18 = *(void **)(v17 + 48);
        }
        else {
          id v18 = 0;
        }
        uint64_t v77 = v15;
        BOOL v19 = objc_msgSend(v18, "feedForFeedID:", v16, v69);
        if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          unint64_t v64 = (void *)[[NSString alloc] initWithFormat:@"must have a feed in order to save feed items"];
          *(_DWORD *)buf = v69;
          id v91 = "-[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]_block_invoke";
          __int16 v92 = 2080;
          uint64_t v93 = "FCFeedDatabase.m";
          __int16 v94 = 1024;
          int v95 = 423;
          __int16 v96 = 2114;
          v97 = v64;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        unint64_t v20 = [v19 refreshedFromOrder];
        uint64_t v21 = [v19 refreshedToOrder];
        uint64_t v79 = [*(id *)(v13 + 56) objectForKey:v16];
        uint64_t v22 = [v79 unsignedLongLongValue];
        uint64_t v81 = [v19 refreshRegion];
        uint64_t v23 = [v19 refreshedFromOrder];
        [*(id *)(v13 + 64) objectForKey:v16];
        uint64_t v25 = v24 = v16;
        id v26 = [v25 dateRange];
        id v27 = [v26 laterDate];
        unint64_t v28 = objc_msgSend(v27, "fc_millisecondTimeIntervalSince1970");

        if (v28 <= v20) {
          unint64_t v29 = v20;
        }
        else {
          unint64_t v29 = v28;
        }
        uint64_t v78 = v25;
        uint64_t v30 = [v25 bottom];
        unint64_t v31 = [v30 order];
        if (v22) {
          unint64_t v32 = v22 - 1;
        }
        else {
          unint64_t v32 = 0;
        }
        if (v23) {
          unint64_t v33 = v21;
        }
        else {
          unint64_t v33 = -1;
        }
        if (v31 < v33) {
          unint64_t v33 = v31;
        }
        if (v31 >= v32) {
          unint64_t v34 = v33;
        }
        else {
          unint64_t v34 = v32;
        }

        BOOL v35 = [v80 objectForKeyedSubscript:v24];
        uint64_t v76 = v35;
        if ([v35 count])
        {
          unint64_t v36 = [v35 sortedArrayUsingSelector:sel_compareOrderDescending_];
          uint64_t v37 = [v36 count];
          if (v37 != [v35 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v65 = (void *)[[NSString alloc] initWithFormat:@"CK cursor shouldn't produce feed items that precede it"];
            *(_DWORD *)buf = v69;
            id v91 = "-[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]_block_invoke";
            __int16 v92 = 2080;
            uint64_t v93 = "FCFeedDatabase.m";
            __int16 v94 = 1024;
            int v95 = 449;
            __int16 v96 = 2114;
            v97 = v65;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          unint64_t v75 = v29;
          __int16 v38 = FCFeedRangeCoveredByFeedItems(v36);
          BOOL v39 = v38;
          if (v22)
          {
            uint64_t v40 = [v38 top];
            uint64_t v41 = +[FCFeedCursor cursorForOrder:v22 - 1];
            uint64_t v42 = +[FCFeedRange feedRangeWithTop:v40 bottom:v41];

            BOOL v39 = (void *)v42;
          }
          uint64_t v43 = (void *)v81;
          __int16 v74 = v36;
          unint64_t v44 = [v39 top];
          unint64_t v45 = objc_msgSend(v19, "fetchedRangePrecedingOrder:", objc_msgSend(v44, "order"));

          if (v45)
          {
            uint64_t v46 = [v45 bottom];
            unint64_t v47 = [v46 order];
            uint64_t v48 = [v39 top];
            unint64_t v49 = [v48 order];

            if (v47 > v49)
            {
              id v50 = [v45 bottom];
              uint64_t v51 = [v50 order];
              uint64_t v52 = [v39 bottom];
              uint64_t v53 = +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", v51, [v52 order]);

              BOOL v39 = (void *)v53;
            }
            uint64_t v43 = (void *)v81;
          }
          uint64_t v54 = v24;
          uint64_t v55 = [v39 bottom];
          int v56 = [v43 containsCursor:v55];

          if (v56)
          {
            uint64_t v57 = [v39 top];
            uint64_t v58 = [v43 bottom];
            uint64_t v59 = +[FCFeedRange feedRangeWithTop:v57 bottom:v58];

            BOOL v39 = (void *)v59;
          }
          uint64_t v13 = v72;
          unint64_t v60 = v79;
          uint64_t v61 = v77;
          unint64_t v29 = v75;
        }
        else
        {
          uint64_t v54 = v24;
          BOOL v39 = 0;
          uint64_t v13 = v72;
          unint64_t v60 = v79;
          uint64_t v43 = (void *)v81;
          uint64_t v61 = v77;
        }
        uint64_t v62 = *(void *)(v13 + 48);
        if (v62) {
          BOOL v63 = *(void **)(v62 + 48);
        }
        else {
          BOOL v63 = 0;
        }
        [v63 updateFeedID:v54 refreshedFromOrder:v29 refreshedToOrder:v34 fetchedRange:v39];

        uint64_t v15 = v61 + 1;
        uint64_t v2 = v80;
      }
      while (v73 != v15);
      uint64_t v66 = [obj countByEnumeratingWithState:&v82 objects:v98 count:16];
      uint64_t v73 = v66;
    }
    while (v66);
  }

  uint64_t v67 = *(void *)(v13 + 48);
  if (v67) {
    uint64_t v68 = *(void **)(v67 + 48);
  }
  else {
    uint64_t v68 = 0;
  }
  [v68 insertFeedItems:*(void *)(v13 + 32)];
}

- (void)enumerateRangesMissingFromLookups:(void *)a3 visitor:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke;
    v7[3] = &unk_1E5B4E088;
    id v8 = v5;
    uint64_t v9 = a1;
    id v10 = v6;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v7);
  }
}

void __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_96);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 48);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v16 = (void *)v2;
  id v5 = [v4 feedsForFeedIDs:v2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 16);
        }
        else {
          uint64_t v11 = 0;
        }
        id v12 = [v5 objectForKeyedSubscript:v11];
        uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_3;
        v18[3] = &unk_1E5B562E0;
        v18[4] = v10;
        id v14 = v13;
        id v19 = v14;
        [v12 enumerateGapsWithBlock:v18];
        if ([v14 count]) {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v15 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }
}

id __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 16);
  }
  else {
    return 0;
  }
}

void __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_3(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24);
  }
  else {
    uint64_t v7 = 0;
  }
  id v17 = v5;
  if ([v5 intersectsRange:v7])
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    if (v8) {
      uint64_t v8 = (void *)v8[3];
    }
    uint64_t v10 = v8;
    uint64_t v11 = [v17 feedRangeByIntersectingWithRange:v10];
    [v9 addObject:v11];
  }
  id v12 = [v17 bottom];
  unint64_t v13 = [v12 order];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 24);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v15 bottom];
  *a3 = v13 <= [v16 order];
}

- (void)saveWithCompletionHandler:(id)a3
{
  id v6 = a3;
  if (self) {
    storage = self->_storage;
  }
  else {
    storage = 0;
  }
  [(FCFDBStorage *)storage flushChanges];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

void __35__FCFeedDatabase__synchronizedInit__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      if (([(id)v3 usage] & 4) != 0) {
        uint64_t v4 = 6;
      }
      else {
        uint64_t v4 = 4;
      }
      if (!NSClassFromString(&cfstr_Xctest.isa))
      {
        id v5 = *(void **)(v3 + 16);
        if (v5)
        {
          id v6 = [v5 URLByAppendingPathComponent:@"feeddatabase" isDirectory:0];
          uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v8 = [v6 path];
          int v9 = [v7 fileExistsAtPath:v8];

          if (v9)
          {
            LOWORD(value) = 0;
            id v10 = v6;
            getxattr((const char *)[v10 fileSystemRepresentation], "com.apple.newscore.storeVersion", &value, 2uLL, 0, 0);
            uint64_t v11 = (unsigned __int16)value;
            uint64_t v12 = *(unsigned __int16 *)(v3 + 8);
            if ((unsigned __int16)value != v12)
            {
              unint64_t v13 = FCFeedDatabaseLog;
              if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v38 = v11;
                __int16 v39 = 2048;
                uint64_t v40 = v12;
                _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "wiping feed database because persisted version %lu does not match current version %lu", buf, 0x16u);
              }
              uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
              [v14 removeItemAtURL:v10 error:0];
            }
          }
          uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v16 = [v6 path];
          char v17 = [v15 fileExistsAtPath:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v19 = [v6 path];
            [v18 createFileAtPath:v19 contents:0 attributes:0];

            setxattr((const char *)[v6 fileSystemRepresentation], "com.apple.newscore.storeVersion", (const void *)(v3 + 8), 2uLL, 0, 0);
          }
          id value = 0;
          int v20 = [v6 getResourceValue:&value forKey:*MEMORY[0x1E4F1C5F8] error:0];
          id v21 = value;
          if (v20)
          {
            long long v22 = (void *)FCFeedDatabaseLog;
            if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
            {
              long long v23 = (void *)MEMORY[0x1E4F28B68];
              uint64_t v24 = v22;
              uint64_t v25 = objc_msgSend(v23, "stringFromByteCount:countStyle:", objc_msgSend(v21, "unsignedLongLongValue"), 0);
              *(_DWORD *)buf = 138543362;
              uint64_t v38 = (uint64_t)v25;
              _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "feed database takes up %{public}@ on disk", buf, 0xCu);
            }
          }
          id v26 = [FCFDBStorage alloc];
          id v27 = [[FCFDBPruningPolicy alloc] initWithMaxAgeToPersist:1209600.0];
          uint64_t v28 = [(FCFDBStorage *)v26 initWithFileURL:v6 options:v4 pruningPolicy:v27];
          unint64_t v29 = *(void **)(v3 + 48);
          *(void *)(v3 + 48) = v28;
        }
      }
      if (!*(void *)(v3 + 48))
      {
        uint64_t v30 = FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "will use in-memory storage", buf, 2u);
        }
        id v31 = [[FCFDBStorage alloc] initTransientWithOptions:v4];
        unint64_t v32 = *(void **)(v3 + 48);
        *(void *)(v3 + 48) = v31;
      }
    }
    unint64_t v33 = (void *)FCFeedDatabaseLog;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v34 = v33;
      uint64_t v35 = objc_msgSend(v2, "fc_millisecondTimeIntervalUntilNow");
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = v35;
      _os_log_impl(&dword_1A460D000, v34, OS_LOG_TYPE_DEFAULT, "feed database took %llums to initialize", buf, 0xCu);
    }
  }
}

id __35__FCFeedDatabase__feedsForLookups___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 16);
  }
  else {
    return 0;
  }
}

void __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v5 count] == 1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) firstObject];
    if (!v7 || (uint64_t v8 = v7[4], v7, v8 != -1))
    {
      int v9 = [*(id *)(a1 + 32) firstObject];
      if (v9) {
        uint64_t v8 = v9[4] + 1;
      }
      else {
        uint64_t v8 = 1;
      }
    }
  }
  else
  {
    uint64_t v8 = -1;
  }
  uint64_t v11 = *(void **)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  if (v10) {
    id v10 = (void *)v10[6];
  }
  uint64_t v12 = v10;
  unint64_t v13 = [v15 allObjects];
  uint64_t v14 = [v12 feedItemsForFeedIDs:v13 feedRange:v6 feature:*(void *)(a1 + 56) maxCountByFeed:*(void *)(a1 + 64) totalMaxCount:v8];

  [v11 addObjectsFromArray:v14];
}

void __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "feedID", (void)v13);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];

        if (v11)
        {
          uint64_t v12 = [v3 objectForKeyedSubscript:v10];
          [v12 addObject:v9];
        }
        else
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
          [v3 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __52__FCFeedDatabase__serviceLookup_withFeed_feedItems___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 intersectsRange:*(void *)(a1 + 32)])
  {
    uint64_t v6 = [v5 feedRangeByIntersectingWithRange:*(void *)(a1 + 32)];
    uint64_t v7 = [v6 top];
    uint64_t v8 = [v7 order];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v9) {
      *(void *)(v9 + 40) = v8;
    }

    id v10 = [v6 bottom];
    uint64_t v11 = [v10 order];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12) {
      *(void *)(v12 + 48) = v11 + 1;
    }

    long long v13 = objc_opt_new();
    long long v14 = [v6 top];
    uint64_t v15 = [v14 order];
    if (v13) {
      v13[1] = v15;
    }

    long long v16 = [v6 bottom];
    uint64_t v17 = [v16 order];
    if (v13) {
      v13[2] = v17;
    }

    -[FCPurchaseLookupResult setIntroOffer:](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
    uint64_t v18 = (id)FCFeedDatabaseLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [*(id *)(a1 + 40) feedID];
      int v20 = (void *)v19;
      if (v13)
      {
        uint64_t v21 = v13[1];
        uint64_t v22 = v13[2];
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
      }
      int v23 = 138412802;
      uint64_t v24 = v19;
      __int16 v25 = 2048;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = v22;
      _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "trying to extend feed %@ from order %llu to order %llu", (uint8_t *)&v23, 0x20u);
    }
    *a3 = 1;
  }
}

void __68__FCFeedDatabase__feedItemsForLookups_withFeedsByID_boundedByCount___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v7 = (void *)a1[4];
  uint64_t v6 = (void *)a1[5];
  if (v6) {
    uint64_t v6 = (void *)v6[6];
  }
  uint64_t v8 = v6;
  id v9 = a2;
  id v11 = [a3 allObjects];
  id v10 = [v8 feedItemsForFeedIDs:v11 feedRange:v9 feature:0 maxCountByFeed:a1[6] totalMaxCount:a1[7]];

  [v7 addObjectsFromArray:v10];
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)parentDirectoryURL
{
  return self->_parentDirectoryURL;
}

- (int64_t)usage
{
  return self->_usage;
}

- (int64_t)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_initQueue, 0);
  objc_storeStrong((id *)&self->_parentDirectoryURL, 0);
}

- (void)t_insertSegmentForFeedID:(id)a3 range:(id)a4 items:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__FCFeedDatabase_Testing__t_insertSegmentForFeedID_range_items___block_invoke;
  v14[3] = &unk_1E5B4DD08;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)self, v14);
}

void __64__FCFeedDatabase_Testing__t_insertSegmentForFeedID_range_items___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 48);
  }
  else {
    id v3 = 0;
  }
  id v13 = [v3 feedForFeedID:*(void *)(a1 + 40)];
  uint64_t v4 = [v13 refreshedFromOrder];
  uint64_t v5 = [v13 refreshedToOrder];
  if (v4)
  {
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970");

    id v8 = [*(id *)(a1 + 48) top];
    uint64_t v6 = [v8 order];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    id v10 = *(void **)(v9 + 48);
  }
  else {
    id v10 = 0;
  }
  [v10 insertFeedItems:*(void *)(a1 + 56)];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 48);
  }
  else {
    id v12 = 0;
  }
  [v12 updateFeedID:*(void *)(a1 + 40) refreshedFromOrder:v4 refreshedToOrder:v6 fetchedRange:*(void *)(a1 + 48)];
}

- (id)t_lookupFeedID:(id)a3 range:(id)a4 maxCount:(unint64_t)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  id v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, v8, 16);
    objc_setProperty_nonatomic_copy(v12, v13, v9, 24);
    v12[4] = a5;
  }
  v19[0] = v12;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v15 = -[FCFeedDatabase performDatabaseLookups:](self, v14);
  id v16 = [v15 allValues];
  id v17 = [v16 firstObject];

  return v17;
}

@end