@interface WLKSiriBestPlayableForStatsIDsOperation
- (NSArray)statsIDs;
- (WLKSiriBestPlayableForStatsIDsOperation)initWithStatsIDs:(id)a3 caller:(id)a4;
- (WLKSiriBestPlayablesResponse)response;
- (void)processResponse;
@end

@implementation WLKSiriBestPlayableForStatsIDsOperation

- (WLKSiriBestPlayableForStatsIDsOperation)initWithStatsIDs:(id)a3 caller:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The statsIDs parameter must not be nil."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"The statsIDs parameter must be an array."];
  }
  if (![v5 count]) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"The statsIDs parameter must not be an empty array."];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = *v7;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v12 format:@"The statsIDs values must all be strings."];
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x1E4F29008];
  v15 = NSStringFromSelector(sel_self);
  v16 = [v14 sortDescriptorWithKey:v15 ascending:1];

  v34 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v18 = [v8 sortedArrayUsingDescriptors:v17];

  v32 = @"ids";
  v19 = [v18 componentsJoinedByString:@","];
  v33 = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v21 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:@"siri/bestPlayableForStatsIds" queryParameters:v20 httpMethod:0 caller:v6];

  v27.receiver = self;
  v27.super_class = (Class)WLKSiriBestPlayableForStatsIDsOperation;
  v22 = [(WLKUTSNetworkRequestOperation *)&v27 initWithRequestProperties:v21];
  if (v22)
  {
    uint64_t v23 = [v8 copy];
    statsIDs = v22->_statsIDs;
    v22->_statsIDs = (NSArray *)v23;
  }
  return v22;
}

- (void)processResponse
{
  id v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  [(WLKDictionaryResponseProcessor *)v6 setObjectClass:objc_opt_class()];
  v3 = [(WLKNetworkRequestOperation *)self data];
  v4 = [(WLKDictionaryResponseProcessor *)v6 processResponseData:v3 error:0];
  response = self->_response;
  self->_response = v4;
}

- (NSArray)statsIDs
{
  return self->_statsIDs;
}

- (WLKSiriBestPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_statsIDs, 0);
}

@end