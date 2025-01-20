@interface ASAssetQuery
+ (id)queryPredicateForProperties:(id)a3;
- (ASAssetQuery)initWithAssetType:(id)a3;
- (ASAssetQuery)initWithAssetType:(id)a3 sessionIdentifier:(id)a4;
- (BOOL)queriesLocalAssetInformationOnly;
- (MAAssetQuery)maQuery;
- (NSArray)results;
- (NSPredicate)predicate;
- (NSString)assetType;
- (NSString)sessionIdentifier;
- (double)networkTimeout;
- (id)runQueryAndReturnError:(id *)a3;
- (id)runQueryForInfoReturnError:(id *)a3;
- (void)setAssetType:(id)a3;
- (void)setMaQuery:(id)a3;
- (void)setNetworkTimeout:(double)a3;
- (void)setPredicate:(id)a3;
- (void)setQueriesLocalAssetInformationOnly:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)startQuery:(id)a3;
@end

@implementation ASAssetQuery

- (void)startQuery:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__ASAssetQuery_startQuery___block_invoke;
  v7[3] = &unk_1E6004240;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (ASAssetQuery)initWithAssetType:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASAssetQuery;
  id v8 = [(ASAssetQuery *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_networkTimeout = 30.0;
    uint64_t v10 = [v6 copy];
    assetType = v9->_assetType;
    v9->_assetType = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSString *)v12;

    v14 = (void *)[(id)objc_opt_new() initWithType:v6];
    [(ASAssetQuery *)v9 setMaQuery:v14];

    v15 = [(ASAssetQuery *)v9 maQuery];
    [v15 setDoNotBlockOnNetworkStatus:1];

    v16 = [(ASAssetQuery *)v9 maQuery];
    [v16 returnTypes:2];
  }
  return v9;
}

- (MAAssetQuery)maQuery
{
  return self->maQuery;
}

- (void)setMaQuery:(id)a3
{
}

void __27__ASAssetQuery_startQuery___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  v3 = [v2 runQueryAndReturnError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

- (id)runQueryAndReturnError:(id *)a3
{
  v3 = [(ASAssetQuery *)self runQueryForInfoReturnError:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"Assets"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)runQueryForInfoReturnError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v32 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  id v46 = 0;
  if (!self->_queriesLocalAssetInformationOnly)
  {
    id v4 = objc_opt_new();
    [v4 setDiscretionary:0];
    uint64_t v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    assetType = self->_assetType;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke;
    v38[3] = &unk_1E6005180;
    v40 = &v41;
    id v7 = v5;
    v39 = v7;
    +[MAAsset startCatalogDownload:assetType options:v4 completionWithError:v38];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(self->_networkTimeout * 1000000000.0));
    dispatch_group_wait(v7, v8);
  }
  v9 = [(ASAssetQuery *)self maQuery];
  uint64_t v10 = [v9 queryMetaDataSync];

  if (MAIsQueryResultFailure(v10))
  {
    v11 = (void *)v42[5];
    uint64_t v12 = errorStringForMAQueryResult(v10);
    v17 = MAErrorWithUnderlying(@"com.apple.MobileAssetError.Query", v10, v11, @"%@", v13, v14, v15, v16, (uint64_t)v12);
    objc_super v18 = _ASErrorForMAError(v17);
  }
  else
  {
    objc_super v18 = 0;
  }
  v19 = [(ASAssetQuery *)self maQuery];
  v20 = [v19 results];
  BOOL v21 = v20 == 0;

  if (v21)
  {
    v22 = 0;
  }
  else
  {
    v22 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = [(MAAssetQuery *)self->maQuery results];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x1B3EAACB0]();
          v29 = (void *)[(id)objc_opt_new() initWithMAAsset:v27];
          [v22 addObject:v29];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v24);
    }

    [v32 setObject:v22 forKey:@"Assets"];
  }
  [(ASAssetQuery *)self setResults:v22];
  if (a3)
  {
    if (v22) {
      v30 = 0;
    }
    else {
      v30 = v18;
    }
    *a3 = v30;
  }
  _Block_object_dispose(&v41, 8);

  return v32;
}

- (ASAssetQuery)initWithAssetType:(id)a3
{
  return [(ASAssetQuery *)self initWithAssetType:a3 sessionIdentifier:0];
}

+ (id)queryPredicateForProperties:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ASAssetQuery_queryPredicateForProperties___block_invoke;
  v9[3] = &unk_1E6005158;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];

  return v7;
}

void __44__ASAssetQuery_queryPredicateForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (NSArray)results
{
  v2 = (void *)[(NSArray *)self->_results copy];
  return (NSArray *)v2;
}

void __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)queriesLocalAssetInformationOnly
{
  return self->_queriesLocalAssetInformationOnly;
}

- (void)setQueriesLocalAssetInformationOnly:(BOOL)a3
{
  self->_queriesLocalAssetInformationOnly = a3;
}

- (void)setResults:(id)a3
{
}

- (double)networkTimeout
{
  return self->_networkTimeout;
}

- (void)setNetworkTimeout:(double)a3
{
  self->_networkTimeout = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->maQuery, 0);
}

@end