@interface FCCKTestContentDatabase
+ (id)testingDatabase;
- (BOOL)shouldUseCloudd;
- (BOOL)simulateNetworkError;
- (FCCKTestContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 configurationManager:(id)a6;
- (FCCKTestFeedQueryEndpoint)feedQueryEndpoint;
- (FCCKTestMultiFetchQueryEndpoint)multiFetchQueryEndpoint;
- (FCCKTestOrderFeedQueryEndpoint)orderFeedQueryEndpoint;
- (NSMutableArray)records;
- (NSMutableSet)droppedFeeds;
- (NSSet)fetchedKeys;
- (id)addArticlesToTopOfFeed:(id)a3 count:(unint64_t)a4;
- (id)insertTestArticle;
- (id)insertTestArticleListReferencingArticleIDs:(id)a3;
- (id)insertTestArticleWithProperties:(id)a3;
- (id)insertTestForYouConfigWithProperties:(id)a3;
- (id)insertTestIssueListReferencingIssueIDs:(id)a3;
- (id)insertTestIssueWithProperties:(id)a3;
- (id)insertTestTagWithType:(id)a3 feedID:(id)a4;
- (id)insertTestTagWithType:(id)a3 feedID:(id)a4 properties:(id)a5;
- (id)insertTestTagWithType:(id)a3 properties:(id)a4;
- (id)records:(id)a3 withDesiredKeys:(id)a4;
- (unint64_t)orderForArticleID:(id)a3 feedID:(id)a4;
- (void)addOperation:(id)a3;
- (void)deleteArticleWithID:(id)a3;
- (void)deleteFeedID:(id)a3;
- (void)insertArticleID:(id)a3 atBottomOfFeedID:(id)a4;
- (void)insertArticleID:(id)a3 atTopOfFeedID:(id)a4;
- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5;
- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5 subOrder:(unint64_t)a6;
- (void)insertRecord:(id)a3;
- (void)insertTestArticleWithID:(id)a3 properties:(id)a4;
- (void)insertTestIssueWithID:(id)a3 properties:(id)a4;
- (void)insertTestTagWithID:(id)a3 type:(id)a4 properties:(id)a5;
- (void)populateWithBasicTestFeeds;
- (void)setDroppedFeeds:(id)a3;
- (void)setFeedQueryEndpoint:(id)a3;
- (void)setFetchedKeys:(id)a3;
- (void)setMultiFetchQueryEndpoint:(id)a3;
- (void)setOrderFeedQueryEndpoint:(id)a3;
- (void)setRecords:(id)a3;
- (void)setSimulateNetworkError:(BOOL)a3;
- (void)simulateDroppedFeedForFeedID:(id)a3;
- (void)updateArticleID:(id)a3 inFeedID:(id)a4 withProperties:(id)a5;
- (void)updateArticleWithID:(id)a3 modDate:(id)a4 properties:(id)a5;
- (void)updateArticleWithID:(id)a3 properties:(id)a4;
- (void)updateTagWithID:(id)a3 properties:(id)a4;
@end

@implementation FCCKTestContentDatabase

+ (id)testingDatabase
{
  id v2 = [[FCNetworkBehaviorMonitor alloc] initForLoggingOnly];
  id v3 = [[FCConfigurationManager alloc] initForTesting];
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainerIdentifier:@"bogus" productionEnvironment:0 networkBehaviorMonitor:v2 configurationManager:v3];

  return v4;
}

- (FCCKTestContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 configurationManager:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[FCNetworkReachability sharedNetworkReachability];
  v26.receiver = self;
  v26.super_class = (Class)FCCKTestContentDatabase;
  v14 = [(FCCKContentDatabase *)&v26 initWithContainerIdentifier:v12 productionEnvironment:v7 networkBehaviorMonitor:v11 networkReachability:v13 configurationManager:v10];

  if (v14)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v14->_records;
    v14->_records = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    droppedFeeds = v14->_droppedFeeds;
    v14->_droppedFeeds = v17;

    v19 = objc_alloc_init(FCCKTestFeedQueryEndpoint);
    feedQueryEndpoint = v14->_feedQueryEndpoint;
    v14->_feedQueryEndpoint = v19;

    v21 = objc_alloc_init(FCCKTestOrderFeedQueryEndpoint);
    orderFeedQueryEndpoint = v14->_orderFeedQueryEndpoint;
    v14->_orderFeedQueryEndpoint = v21;

    v23 = objc_alloc_init(FCCKTestMultiFetchQueryEndpoint);
    multiFetchQueryEndpoint = v14->_multiFetchQueryEndpoint;
    v14->_multiFetchQueryEndpoint = v23;
  }
  return v14;
}

- (BOOL)shouldUseCloudd
{
  return 1;
}

- (void)addOperation:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    if ([(FCCKTestContentDatabase *)self simulateNetworkError])
    {
      v6 = [v5 queryCompletionBlock];

      if (v6)
      {
        BOOL v7 = [v5 queryCompletionBlock];
        v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:4 userInfo:MEMORY[0x1E4F1CC08]];
        ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
      }
      goto LABEL_18;
    }
    id v10 = [v5 query];
    id v11 = [v10 recordType];
    int v12 = [v11 isEqualToString:@"MultiFeed"];

    if (v12)
    {
      uint64_t v13 = [(FCCKTestContentDatabase *)self feedQueryEndpoint];
    }
    else
    {
      v14 = [v10 recordType];
      int v15 = [v14 isEqualToString:@"OrderFeed"];

      if (v15)
      {
        uint64_t v13 = [(FCCKTestContentDatabase *)self orderFeedQueryEndpoint];
      }
      else
      {
        v16 = [v10 recordType];
        int v17 = [v16 isEqualToString:@"MultiFetch"];

        if (!v17)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          v18 = (void *)[[NSString alloc] initWithFormat:@"unrecognized query record type"];
          *(_DWORD *)buf = 136315906;
          v91 = "-[FCCKTestContentDatabase addOperation:]";
          __int16 v92 = 2080;
          v93 = "FCCKTestContentDatabase.m";
          __int16 v94 = 1024;
          int v95 = 138;
          __int16 v96 = 2114;
          v97 = v18;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_16:

LABEL_17:
LABEL_18:
          objc_opt_class();
          char v9 = 1;
          goto LABEL_19;
        }
        uint64_t v13 = [(FCCKTestContentDatabase *)self multiFetchQueryEndpoint];
      }
    }
    v18 = (void *)v13;
    v19 = [(FCCKTestContentDatabase *)self records];
    v20 = [(FCCKTestContentDatabase *)self droppedFeeds];
    [v18 handleQueryOperation:v5 withRecords:v19 droppedFeeds:v20];

    goto LABEL_16;
  }
  objc_opt_class();
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_23;
  }
  id v5 = 0;
  char v9 = 0;
LABEL_19:
  if (objc_opt_isKindOfClass())
  {
    id v21 = v4;
    v22 = [(FCCKTestContentDatabase *)self fetchedKeys];
    if (v22)
    {
      v23 = [(FCCKTestContentDatabase *)self fetchedKeys];
      v24 = [v21 desiredKeys];
      v25 = [v23 setByAddingObjectsFromArray:v24];
      [(FCCKTestContentDatabase *)self setFetchedKeys:v25];
    }
    else
    {
      objc_super v26 = (void *)MEMORY[0x1E4F1CAD0];
      v23 = [v21 desiredKeys];
      v24 = [v26 setWithArray:v23];
      [(FCCKTestContentDatabase *)self setFetchedKeys:v24];
    }

    if ([(FCCKTestContentDatabase *)self simulateNetworkError])
    {
      v27 = [v21 fetchRecordsCompletionBlock];

      if (v27)
      {
        v28 = [v21 fetchRecordsCompletionBlock];
        v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:4 userInfo:MEMORY[0x1E4F1CC08]];
        ((void (**)(void, void, void *))v28)[2](v28, 0, v29);
      }
    }
    else
    {
      id v74 = v5;
      id v75 = v4;
      v30 = [v21 recordIDs];
      v31 = [(FCCKTestContentDatabase *)self records];
      v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v30, @"recordID"];
      v33 = [v31 filteredArrayUsingPredicate:v32];

      v34 = [v21 desiredKeys];
      v35 = [(FCCKTestContentDatabase *)self records:v33 withDesiredKeys:v34];

      v36 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      obuint64_t j = v35;
      uint64_t v37 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v83 != v39) {
              objc_enumerationMutation(obj);
            }
            v41 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            v42 = [v21 perRecordProgressBlock];

            if (v42)
            {
              v43 = [v21 perRecordProgressBlock];
              v44 = [v41 recordID];
              ((void (**)(void, void *, double))v43)[2](v43, v44, 0.5);
            }
            v45 = [v21 perRecordCompletionBlock];

            if (v45)
            {
              v46 = [v21 perRecordCompletionBlock];
              v47 = [v41 recordID];
              ((void (**)(void, void *, void *, void))v46)[2](v46, v41, v47, 0);
            }
            v48 = [v41 recordID];
            [v36 setObject:v41 forKey:v48];

            v49 = [v21 perRecordCompletionBlock];

            if (v49)
            {
              v50 = [v21 perRecordCompletionBlock];
              v51 = [v41 recordID];
              ((void (**)(void, void *, void *, void))v50)[2](v50, v41, v51, 0);
            }
          }
          uint64_t v38 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
        }
        while (v38);
      }

      v52 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v53 = v30;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v78 objects:v88 count:16];
      v76 = v52;
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v79;
        uint64_t v57 = *MEMORY[0x1E4F19C40];
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v79 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v59 = *(void *)(*((void *)&v78 + 1) + 8 * j);
            v60 = [v36 objectForKeyedSubscript:v59];

            if (!v60)
            {
              v61 = [MEMORY[0x1E4F28C58] errorWithDomain:v57 code:11 userInfo:MEMORY[0x1E4F1CC08]];
              [v52 setObject:v61 forKeyedSubscript:v59];
              v62 = [v21 perRecordCompletionBlock];

              if (v62)
              {
                v63 = [v21 perRecordCompletionBlock];
                ((void (**)(void, void, uint64_t, void *))v63)[2](v63, 0, v59, v61);
              }
              v52 = v76;
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v78 objects:v88 count:16];
        }
        while (v55);
      }

      id v5 = v74;
      if ([v52 count])
      {
        v64 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v65 = *MEMORY[0x1E4F19C40];
        uint64_t v86 = *MEMORY[0x1E4F19CD8];
        v87 = v52;
        v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v67 = [v64 errorWithDomain:v65 code:2 userInfo:v66];
      }
      else
      {
        v67 = 0;
      }
      id v4 = v75;
      v68 = [v21 fetchRecordsCompletionBlock];

      if (v68)
      {
        v69 = [v21 fetchRecordsCompletionBlock];
        ((void (**)(void, void *, void *))v69)[2](v69, v36, v67);
      }
    }
    goto LABEL_60;
  }
  id v21 = 0;
  if (v9) {
    goto LABEL_60;
  }
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v70 = [NSString alloc];
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    v73 = (void *)[v70 initWithFormat:@"%@ isn't supported by FCCKTestContentDatabase", v72];
    *(_DWORD *)buf = 136315906;
    v91 = "-[FCCKTestContentDatabase addOperation:]";
    __int16 v92 = 2080;
    v93 = "FCCKTestContentDatabase.m";
    __int16 v94 = 1024;
    int v95 = 191;
    __int16 v96 = 2114;
    v97 = v73;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v21 = 0;
LABEL_60:
}

- (void)insertRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCKTestContentDatabase *)self records];
  [v5 addObject:v4];
}

- (id)insertTestArticle
{
  id v3 = FCRandomArticleCloudKitID();
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:v3 properties:0];
  return v3;
}

- (id)insertTestArticleWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = FCRandomArticleCloudKitID();
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:v5 properties:v4];

  return v5;
}

- (void)insertTestArticleWithID:(id)a3 properties:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  BOOL v7 = [(FCCKTestContentDatabase *)self insertTestTagWithType:@"channel" properties:0];
  id v8 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v15];
  id v10 = (void *)[v8 initWithRecordType:@"Article" recordID:v9];

  [v10 setEtag:@"1"];
  [v10 setObject:v7 forKeyedSubscript:@"sourceChannelTagID"];
  id v11 = [(FCCKTestContentDatabase *)self records];
  [v11 addObject:v10];

  int v12 = [v6 objectForKeyedSubscript:@"publishDate"];

  if (!v12)
  {
    if (v6) {
      [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setObject:v14 forKeyedSubscript:@"publishDate"];

    id v6 = v13;
  }
  [(FCCKTestContentDatabase *)self updateArticleWithID:v15 properties:v6];
}

- (id)insertTestForYouConfigWithProperties:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = FCRandomForYouConfigCloudKitID();
  id v6 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5];
  id v8 = (void *)[v6 initWithRecordType:@"ForYouConfig" recordID:v7];

  [v8 setEtag:@"1"];
  char v9 = [(FCCKTestContentDatabase *)self records];
  [v9 addObject:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v18);
        [v8 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v5;
}

- (id)insertTestArticleListReferencingArticleIDs:(id)a3
{
  id v4 = a3;
  id v5 = FCRandomArticleListCloudKitID();
  id v6 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5];
  id v8 = (void *)[v6 initWithRecordType:@"ArticleList" recordID:v7];

  [v8 setEtag:@"1"];
  char v9 = [(FCCKTestContentDatabase *)self records];
  [v9 addObject:v8];

  [v8 setObject:v4 forKeyedSubscript:@"articleIDs"];
  return v5;
}

- (id)insertTestIssueListReferencingIssueIDs:(id)a3
{
  id v4 = a3;
  id v5 = FCRandomIssueListCloudKitID();
  id v6 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5];
  id v8 = (void *)[v6 initWithRecordType:@"IssueList" recordID:v7];

  [v8 setEtag:@"1"];
  char v9 = [(FCCKTestContentDatabase *)self records];
  [v9 addObject:v8];

  [v8 setObject:v4 forKeyedSubscript:@"issueIDs"];
  return v5;
}

- (void)updateArticleWithID:(id)a3 properties:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  [(FCCKTestContentDatabase *)self updateArticleWithID:v8 modDate:v9 properties:v7];
}

- (void)updateArticleWithID:(id)a3 modDate:(id)a4 properties:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(FCCKTestContentDatabase *)self records];
  uint64_t v12 = FCLookupRecordByName(v11, v8);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        long long v19 = [v13 objectForKeyedSubscript:v18];
        [v12 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }

  [v12 setModificationDate:v9];
  long long v20 = [v13 objectForKeyedSubscript:@"publishDate"];
  if (v20)
  {
    id v29 = v9;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v21 = [(FCCKTestContentDatabase *)self records];
    id v30 = v8;
    v22 = FCFeedItemRecordsForArticle(v21, v8);

    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "fc_millisecondTimeIntervalSince1970"));
          [v27 setObject:v28 forKeyedSubscript:@"publishDateMillis"];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }

    id v9 = v29;
    id v8 = v30;
  }
}

- (void)deleteArticleWithID:(id)a3
{
  id v4 = a3;
  id v7 = [(FCCKTestContentDatabase *)self records];
  id v5 = [(FCCKTestContentDatabase *)self records];
  id v6 = FCLookupRecordByName(v5, v4);

  [v7 removeObject:v6];
}

- (id)insertTestTagWithType:(id)a3 feedID:(id)a4
{
  return [(FCCKTestContentDatabase *)self insertTestTagWithType:a3 feedID:a4 properties:0];
}

- (id)insertTestTagWithType:(id)a3 feedID:(id)a4 properties:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v12 = FCRandomTagCloudKitID();
  id v13 = (void *)[v11 initWithRecordName:v12];
  uint64_t v14 = (void *)[v10 initWithRecordType:@"Tag" recordID:v13];

  [v14 setEtag:@"1"];
  [v14 setObject:v7 forKeyedSubscript:@"type"];
  uint64_t v15 = +[FCAppleAccount sharedAccount];
  uint64_t v16 = [v15 contentStoreFrontID];
  int v17 = FCCKLocalizedRecordKey(@"feedConfiguration", (uint64_t)v16);

  id v18 = [NSString alloc];
  long long v19 = (void *)MEMORY[0x1E4F28D90];
  v40 = @"everythingFeedID";
  v41[0] = v8;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  long long v21 = [v19 dataWithJSONObject:v20 options:0 error:0];
  v22 = (void *)[v18 initWithData:v21 encoding:4];
  [v14 setObject:v22 forKeyedSubscript:v17];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v29 = [v23 objectForKeyedSubscript:v28];
        [v14 setObject:v29 forKeyedSubscript:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v25);
  }

  id v30 = [(FCCKTestContentDatabase *)self records];
  [v30 addObject:v14];

  long long v31 = [v14 recordID];
  long long v32 = [v31 recordName];

  return v32;
}

- (id)insertTestTagWithType:(id)a3 properties:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v9 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v10 = FCRandomTagCloudKitID();
  id v11 = (void *)[v9 initWithRecordName:v10];
  uint64_t v12 = (void *)[v8 initWithRecordType:@"Tag" recordID:v11];

  [v12 setObject:v6 forKeyedSubscript:@"type"];
  [v12 setEtag:@"1"];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v12 setModificationDate:v13];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v20 = objc_msgSend(v14, "objectForKeyedSubscript:", v19, (void)v25);
        [v12 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  long long v21 = [(FCCKTestContentDatabase *)self records];
  [v21 addObject:v12];

  v22 = [v12 recordID];
  id v23 = [v22 recordName];

  return v23;
}

- (void)insertTestTagWithID:(id)a3 type:(id)a4 properties:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8];
  id v13 = (void *)[v11 initWithRecordType:@"Tag" recordID:v12];

  [v13 setObject:v9 forKeyedSubscript:@"type"];
  [v13 setEtag:@"1"];
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v13 setModificationDate:v14];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v23);
        [v13 setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  v22 = [(FCCKTestContentDatabase *)self records];
  [v22 addObject:v13];
}

- (id)insertTestIssueWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = FCRandomIssueCloudKitID();
  [(FCCKTestContentDatabase *)self insertTestIssueWithID:v5 properties:v4];

  return v5;
}

- (void)insertTestIssueWithID:(id)a3 properties:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v6];
  id v10 = (void *)[v8 initWithRecordType:@"Issue" recordID:v9];

  [v10 setEtag:@"1"];
  id v11 = [(FCCKTestContentDatabase *)self records];
  [v11 addObject:v10];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v12, "objectForKeyedSubscript:", v17, (void)v19);
        [v10 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)updateTagWithID:(id)a3 properties:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCCKTestContentDatabase *)self records];
  id v9 = FCLookupRecordByName(v8, v6);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v18);
        [v9 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setModificationDate:v17];
}

- (void)insertArticleID:(id)a3 atTopOfFeedID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FCCKTestContentDatabase *)self records];
  FCSortedFeedItemRecordsForFeedID(v8, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v14 firstObject];
  id v10 = [v9 objectForKeyedSubscript:@"order"];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"FeedItem"];
  [v11 setObject:v6 forKeyedSubscript:@"tagID"];

  [v11 setObject:v7 forKeyedSubscript:@"articleID"];
  if (v10)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + 1);
    [v11 setObject:v12 forKeyedSubscript:@"order"];
  }
  else
  {
    [v11 setObject:&unk_1EF8D8070 forKeyedSubscript:@"order"];
  }
  uint64_t v13 = [(FCCKTestContentDatabase *)self records];
  [v13 addObject:v11];
}

- (void)insertArticleID:(id)a3 atBottomOfFeedID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FCCKTestContentDatabase *)self records];
  FCSortedFeedItemRecordsForFeedID(v8, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v14 lastObject];
  id v10 = [v9 objectForKeyedSubscript:@"order"];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"FeedItem"];
  [v11 setObject:v6 forKeyedSubscript:@"tagID"];

  [v11 setObject:v7 forKeyedSubscript:@"articleID"];
  if (v10)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") - 1);
    [v11 setObject:v12 forKeyedSubscript:@"order"];
  }
  else
  {
    [v11 setObject:&unk_1EF8D8070 forKeyedSubscript:@"order"];
  }
  uint64_t v13 = [(FCCKTestContentDatabase *)self records];
  [v13 addObject:v11];
}

- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1A2D8];
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)[[v8 alloc] initWithRecordType:@"FeedItem"];
  [v13 setObject:v9 forKeyedSubscript:@"tagID"];

  [v13 setObject:v10 forKeyedSubscript:@"articleID"];
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a5];
  [v13 setObject:v11 forKeyedSubscript:@"order"];

  uint64_t v12 = [(FCCKTestContentDatabase *)self records];
  [v12 addObject:v13];
}

- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5 subOrder:(unint64_t)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F1A2D8];
  id v11 = a4;
  id v12 = a3;
  id v16 = (id)[[v10 alloc] initWithRecordType:@"FeedItem"];
  [v16 setObject:v11 forKeyedSubscript:@"tagID"];

  [v16 setObject:v12 forKeyedSubscript:@"articleID"];
  id v13 = [NSNumber numberWithUnsignedLongLong:a5];
  [v16 setObject:v13 forKeyedSubscript:@"order"];

  id v14 = [NSNumber numberWithUnsignedLongLong:a6];
  [v16 setObject:v14 forKeyedSubscript:@"subOrder"];

  uint64_t v15 = [(FCCKTestContentDatabase *)self records];
  [v15 addObject:v16];
}

- (void)updateArticleID:(id)a3 inFeedID:(id)a4 withProperties:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FCCKTestContentDatabase *)self records];
  id v12 = FCLookupFeedItemRecordByFeedAndArticle(v11, v9, v8);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v19 = objc_msgSend(v13, "objectForKeyedSubscript:", v18, (void)v20);
        [v12 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)populateWithBasicTestFeeds
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = objc_msgSend(v3, "fc_millisecondTimeIntervalSince1970");

  [(FCCKTestContentDatabase *)self insertTestTagWithID:@"Ichannel" type:@"channel" properties:MEMORY[0x1E4F1CC08]];
  v43 = @"channelTagID";
  v44[0] = @"Ichannel";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  [(FCCKTestContentDatabase *)self insertTestIssueWithID:@"Iissue" properties:v5];

  v41[0] = @"parentIssueID";
  v41[1] = @"sourceChannelTagID";
  v42[0] = @"Iissue";
  v42[1] = @"Ichannel";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed1_article1" properties:v6];

  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed1_article2" properties:0];
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed1_article3" properties:0];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed1_article1" inFeedID:@"test_feed1" withOrder:v4];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed1_article2" inFeedID:@"test_feed1" withOrder:v4 - 1];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed1_article3" inFeedID:@"test_feed1" withOrder:v4 - 2];
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed2_article1" properties:0];
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed2_article2" properties:0];
  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"Atest_feed2_article3" properties:0];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed2_article1" inFeedID:@"test_feed2" withOrder:v4 - 1];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed2_article2" inFeedID:@"test_feed2" withOrder:v4 - 2];
  [(FCCKTestContentDatabase *)self insertArticleID:@"Atest_feed2_article3" inFeedID:@"test_feed2" withOrder:v4 - 3];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-21600.0];
  uint64_t v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-43200.0];
  v40[0] = v7;
  v39[0] = @"publishDate";
  v39[1] = @"publishDateMillis";
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970"));
  v40[1] = v9;
  v39[2] = @"tagHalfLifeMillis";
  id v10 = [NSNumber numberWithUnsignedLongLong:86400000];
  v40[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed1_article1" inFeedID:@"test_feed1" withProperties:v11];

  long long v27 = v8;
  v38[0] = v8;
  v37[0] = @"publishDate";
  v37[1] = @"publishDateMillis";
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "fc_millisecondTimeIntervalSince1970"));
  v38[1] = v12;
  v37[2] = @"tagHalfLifeMillis";
  id v13 = [NSNumber numberWithUnsignedLongLong:86400000];
  v38[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed1_article2" inFeedID:@"test_feed1" withProperties:v14];

  v36[0] = v28;
  v35[0] = @"publishDate";
  v35[1] = @"publishDateMillis";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "fc_millisecondTimeIntervalSince1970"));
  v36[1] = v15;
  v35[2] = @"tagHalfLifeMillis";
  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:86400000];
  v36[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed1_article3" inFeedID:@"test_feed1" withProperties:v17];

  v34[0] = v7;
  v33[0] = @"publishDate";
  v33[1] = @"publishDateMillis";
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970"));
  v34[1] = v18;
  v33[2] = @"tagHalfLifeMillis";
  long long v19 = [NSNumber numberWithUnsignedLongLong:86400000];
  v34[2] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed2_article1" inFeedID:@"test_feed2" withProperties:v20];

  v32[0] = v27;
  v31[0] = @"publishDate";
  v31[1] = @"publishDateMillis";
  long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "fc_millisecondTimeIntervalSince1970"));
  v32[1] = v21;
  v31[2] = @"tagHalfLifeMillis";
  long long v22 = [NSNumber numberWithUnsignedLongLong:86400000];
  v32[2] = v22;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed2_article2" inFeedID:@"test_feed2" withProperties:v23];

  v30[0] = v28;
  v29[0] = @"publishDate";
  v29[1] = @"publishDateMillis";
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "fc_millisecondTimeIntervalSince1970"));
  v30[1] = v24;
  v29[2] = @"tagHalfLifeMillis";
  uint64_t v25 = [NSNumber numberWithUnsignedLongLong:86400000];
  v30[2] = v25;
  long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  [(FCCKTestContentDatabase *)self updateArticleID:@"Atest_feed2_article3" inFeedID:@"test_feed2" withProperties:v26];

  [(FCCKTestContentDatabase *)self insertTestArticleWithID:@"A-canary" properties:0];
}

- (void)deleteFeedID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCKTestContentDatabase *)self records];
  FCSortedFeedItemRecordsForFeedID(v5, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(FCCKTestContentDatabase *)self records];
  [v6 removeObjectsInArray:v7];
}

- (void)simulateDroppedFeedForFeedID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCKTestContentDatabase *)self droppedFeeds];
  [v5 addObject:v4];
}

- (id)addArticlesToTopOfFeed:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] array];
  {
    id v8 = [(FCCKTestContentDatabase *)self insertTestArticle];
    [(FCCKTestContentDatabase *)self insertArticleID:v8 atTopOfFeedID:v6];
    [i insertObject:v8 atIndex:0];
  }
  return i;
}

- (unint64_t)orderForArticleID:(id)a3 feedID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FCCKTestContentDatabase *)self records];
  id v9 = FCLookupFeedItemRecordByFeedAndArticle(v8, v6, v7);

  id v10 = [v9 objectForKeyedSubscript:@"order"];
  unint64_t v11 = [v10 unsignedLongLongValue];

  return v11;
}

- (id)records:(id)a3 withDesiredKeys:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = [v5 setWithArray:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__FCCKTestContentDatabase_records_withDesiredKeys___block_invoke;
  v11[3] = &unk_1E5B4FD78;
  id v12 = v7;
  id v8 = v7;
  id v9 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v11);

  return v9;
}

id __51__FCCKTestContentDatabase_records_withDesiredKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "valuesByKey", 0);
  id v5 = [v4 allKeys];

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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0)
        {
          unint64_t v11 = [v3 valuesByKey];
          [v11 setObject:0 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)simulateNetworkError
{
  return self->_simulateNetworkError;
}

- (void)setSimulateNetworkError:(BOOL)a3
{
  self->_simulateNetworkError = a3;
}

- (NSSet)fetchedKeys
{
  return self->_fetchedKeys;
}

- (void)setFetchedKeys:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (NSMutableSet)droppedFeeds
{
  return self->_droppedFeeds;
}

- (void)setDroppedFeeds:(id)a3
{
}

- (FCCKTestFeedQueryEndpoint)feedQueryEndpoint
{
  return self->_feedQueryEndpoint;
}

- (void)setFeedQueryEndpoint:(id)a3
{
}

- (FCCKTestOrderFeedQueryEndpoint)orderFeedQueryEndpoint
{
  return self->_orderFeedQueryEndpoint;
}

- (void)setOrderFeedQueryEndpoint:(id)a3
{
}

- (FCCKTestMultiFetchQueryEndpoint)multiFetchQueryEndpoint
{
  return self->_multiFetchQueryEndpoint;
}

- (void)setMultiFetchQueryEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiFetchQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_orderFeedQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_feedQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_droppedFeeds, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_fetchedKeys, 0);
}

@end