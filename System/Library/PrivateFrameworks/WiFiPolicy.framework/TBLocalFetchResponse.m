@interface TBLocalFetchResponse
+ (id)responseWithResults:(id)a3 entityDescription:(id)a4;
+ (id)responseWithResultsByBSSID:(id)a3;
- (NSArray)results;
- (NSDictionary)resultsByBSSID;
- (NSError)error;
- (NSSet)tiles;
- (TBLocalFetchResponse)initWithResults:(id)a3 entityDescription:(id)a4;
- (TBLocalFetchResponse)initWithResultsByBSSID:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsByBSSID:(id)a3;
@end

@implementation TBLocalFetchResponse

- (NSArray)results
{
  return self->_results;
}

- (NSSet)tiles
{
  return self->_tiles;
}

- (NSError)error
{
  return self->error;
}

- (NSDictionary)resultsByBSSID
{
  return self->_resultsByBSSID;
}

+ (id)responseWithResults:(id)a3 entityDescription:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TBLocalFetchResponse alloc] initWithResults:v6 entityDescription:v5];

  return v7;
}

- (TBLocalFetchResponse)initWithResults:(id)a3 entityDescription:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)TBLocalFetchResponse;
  v8 = [(TBLocalFetchResponse *)&v51 init];
  v9 = v8;
  if (v7 && v8)
  {
    v10 = [v7 name];
    v11 = +[TBAccessPointMO entityName];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      v13 = [MEMORY[0x1E4F1CA60] dictionary];
      v14 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v42 = v6;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v21 = [v20 network];
            [(NSArray *)v14 addObject:v21];

            v22 = [v20 network];
            v23 = [v20 BSSID];
            [(NSDictionary *)v13 setObject:v22 forKey:v23];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v17);
      }

      results = v9->_results;
      v9->_results = v14;
      tiles = v14;

      resultsByBSSID = v9->_resultsByBSSID;
      v9->_resultsByBSSID = v13;

      id v6 = v42;
      goto LABEL_23;
    }
    v27 = [v7 name];
    v28 = +[TBNetworkMO entityName];
    int v29 = [v27 isEqualToString:v28];

    if (v29)
    {
      v30 = (NSArray *)v6;
      tiles = v9->_results;
      v9->_results = v30;
LABEL_23:

      goto LABEL_24;
    }
    v31 = [v7 name];
    v32 = +[TBTileMO entityName];
    int v33 = [v31 isEqualToString:v32];

    if (v33)
    {
      v34 = [MEMORY[0x1E4F1CA80] set];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v35 = v6;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v44 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = [[TBLocalFetchTileItem alloc] initWithTile:*(void *)(*((void *)&v43 + 1) + 8 * j) error:0];
            [(NSSet *)v34 addObject:v40];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v37);
      }

      tiles = (NSArray *)v9->_tiles;
      v9->_tiles = v34;
      goto LABEL_23;
    }
  }
LABEL_24:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByBSSID, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tiles, 0);

  objc_storeStrong((id *)&self->error, 0);
}

+ (id)responseWithResultsByBSSID:(id)a3
{
  id v3 = a3;
  v4 = [[TBLocalFetchResponse alloc] initWithResultsByBSSID:v3];

  return v4;
}

- (TBLocalFetchResponse)initWithResultsByBSSID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TBLocalFetchResponse;
  id v6 = [(TBLocalFetchResponse *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultsByBSSID, a3);
    uint64_t v8 = [v5 allValues];
    results = v7->_results;
    v7->_results = (NSArray *)v8;
  }
  return v7;
}

- (void)setResults:(id)a3
{
}

- (void)setResultsByBSSID:(id)a3
{
}

@end