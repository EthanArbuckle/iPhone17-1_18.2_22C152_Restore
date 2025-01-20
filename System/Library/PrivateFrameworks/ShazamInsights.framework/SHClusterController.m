@interface SHClusterController
+ (id)artistClusterDefaultLocationURL;
+ (id)databaseURLForName:(id)a3;
+ (id)trackClusterDefaultLocationURL;
- (SHClusterController)initWithDataStore:(id)a3;
- (SHClusterSQLiteDataStore)dataStore;
- (SHClusterStatementRunner)query;
- (id)affinityGroupsAtCohesionLevel:(int64_t)a3 forQuery:(id)a4 queryCollection:(id)a5 filteredBy:(id)a6;
- (id)filterQueryCollection:(id)a3 byItemsWithinCluster:(id)a4;
- (void)affinityGroupsFromQueryCollection:(id)a3 filteredBySeedCollection:(id)a4 completionHandler:(id)a5;
- (void)mediaItemsForPropertyCollection:(id)a3 completionHandler:(id)a4;
- (void)mediaItemsSimilarToValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)resultsFromQueryBlock:(id)a3 completionHandler:(id)a4;
@end

@implementation SHClusterController

- (SHClusterController)initWithDataStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHClusterController;
  v6 = [(SHClusterController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    v8 = [SHClusterStatementRunner alloc];
    v9 = [(SHClusterSQLiteDataStore *)v7->_dataStore databaseFilePathURL];
    uint64_t v10 = [(SHClusterStatementRunner *)v8 initWithDatabaseURL:v9];
    query = v7->_query;
    v7->_query = (SHClusterStatementRunner *)v10;
  }
  return v7;
}

- (void)mediaItemsSimilarToValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, id))a5;
  v11 = [(SHClusterController *)self dataStore];
  v12 = [v11 dataStatus];
  uint64_t v13 = [v12 loadStatus];

  if (v13 == 1)
  {
    v14 = [(SHClusterController *)self query];
    id v19 = 0;
    v15 = [v14 mediaItemsSimilarToMediaItemValue:v8 forKey:v9 error:&v19];
    id v16 = v19;

    v17 = [v15 allObjects];
    v10[2](v10, v17, v16);
  }
  else
  {
    v18 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    v10[2](v10, 0, v18);
  }
}

- (void)mediaItemsForPropertyCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  id v8 = [(SHClusterController *)self dataStore];
  id v9 = [v8 dataStatus];
  uint64_t v10 = [v9 loadStatus];

  if (v10 == 1)
  {
    v11 = [(SHClusterController *)self query];
    id v16 = 0;
    v12 = [v11 mediaItemsFromPropertyCollection:v6 error:&v16];
    id v13 = v16;

    v14 = [v12 allObjects];
    v7[2](v7, v14, v13);
  }
  else
  {
    v15 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    v7[2](v7, 0, v15);
  }
}

- (void)resultsFromQueryBlock:(id)a3 completionHandler:(id)a4
{
  v12 = (void (**)(void))a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v7 = [(SHClusterController *)self dataStore];
  id v8 = [v7 dataStatus];
  uint64_t v9 = [v8 loadStatus];

  if (v9 == 1)
  {
    uint64_t v10 = v12[2]();
    uint64_t v11 = [v10 allObjects];
    v6[2](v6, v11, 0);

    id v6 = (void (**)(id, uint64_t, void))v11;
  }
  else
  {
    uint64_t v10 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v10);
  }
}

- (void)affinityGroupsFromQueryCollection:(id)a3 filteredBySeedCollection:(id)a4 completionHandler:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  uint64_t v10 = [(SHClusterController *)self dataStore];
  uint64_t v11 = [v10 dataStatus];
  uint64_t v12 = [v11 loadStatus];

  if (v12 == 1)
  {
    id v13 = [SHClusterStatementRunner alloc];
    v14 = [(SHClusterController *)self dataStore];
    v15 = [v14 databaseFilePathURL];
    id v16 = [(SHClusterStatementRunner *)v13 initWithDatabaseURL:v15];

    v17 = [MEMORY[0x263EFF980] array];
    v18 = [(SHClusterController *)self affinityGroupsAtCohesionLevel:1 forQuery:v16 queryCollection:v23 filteredBy:v8];
    if (v18) {
      [v17 addObject:v18];
    }
    id v19 = [(SHClusterController *)self filterQueryCollection:v23 byItemsWithinCluster:v18];

    v20 = [(SHClusterController *)self affinityGroupsAtCohesionLevel:2 forQuery:v16 queryCollection:v19 filteredBy:v8];
    if (v20) {
      [v17 addObject:v20];
    }
    id v23 = [(SHClusterController *)self filterQueryCollection:v19 byItemsWithinCluster:v20];

    v21 = [(SHClusterController *)self affinityGroupsAtCohesionLevel:3 forQuery:v16 queryCollection:v23 filteredBy:v8];
    if (v21) {
      [v17 addObject:v21];
    }
    v22 = (void *)[v17 copy];
    v9[2](v9, v22, 0);
  }
  else
  {
    id v16 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    ((void (**)(id, void *, SHClusterStatementRunner *))v9)[2](v9, 0, v16);
    v17 = v9;
  }
}

- (id)filterQueryCollection:(id)a3 byItemsWithinCluster:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 collection];
  id v8 = (void *)[v7 mutableCopy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = objc_msgSend(v6, "mediaItems", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) appleMusicID];
        [v8 removeObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v15 = [SHMediaItemPropertyCollection alloc];
  id v16 = (void *)[v8 copy];
  v17 = [v16 allObjects];
  v18 = [v5 property];
  id v19 = [(SHMediaItemPropertyCollection *)v15 initWithArray:v17 representingProperty:v18];

  return v19;
}

- (id)affinityGroupsAtCohesionLevel:(int64_t)a3 forQuery:(id)a4 queryCollection:(id)a5 filteredBy:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 collection];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v10 mediaItemsAtCohesionLevel:a3 forQueryMediaIDs:v11 filteredBySeedMediaIDs:v12 error:0];
    if ([v15 count])
    {
      id v16 = [SHAffinityGroup alloc];
      v17 = [(SHClusterController *)self dataStore];
      v18 = [v17 dataStatus];
      id v19 = -[SHAffinityGroup initWithType:cohesionLevel:](v16, "initWithType:cohesionLevel:", [v18 clusterType], a3);

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v20 = objc_msgSend(v15, "allObjects", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            [(SHAffinityGroup *)v19 appendMediaItem:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v22);
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)artistClusterDefaultLocationURL
{
  return (id)[a1 databaseURLForName:@"artists"];
}

+ (id)trackClusterDefaultLocationURL
{
  return (id)[a1 databaseURLForName:@"tracks"];
}

+ (id)databaseURLForName:(id)a3
{
  id v3 = a3;
  v4 = +[SHClusterImporterUtils cachesDirectory];
  id v5 = [v4 URLByAppendingPathComponent:v3];

  id v6 = [v5 URLByAppendingPathExtension:@"db"];

  return v6;
}

- (SHClusterStatementRunner)query
{
  return self->_query;
}

- (SHClusterSQLiteDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end