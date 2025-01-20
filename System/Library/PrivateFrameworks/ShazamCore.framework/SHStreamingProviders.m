@interface SHStreamingProviders
- (NSDictionary)providersKeyedByBundleID;
- (SHStreamingProviders)initWithResponse:(id)a3;
- (id)availableBundleIdentifiers;
- (id)buildStreamingProvidersFromResponseArray:(id)a3;
- (id)providerNameForBundleID:(id)a3;
- (id)searchURLForBundleID:(id)a3 title:(id)a4 artist:(id)a5;
- (id)songURIForBundleID:(id)a3;
- (id)streamingProviderForBundleID:(id)a3;
- (int64_t)availableStreamingProviders;
@end

@implementation SHStreamingProviders

- (SHStreamingProviders)initWithResponse:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHStreamingProviders;
  v5 = [(SHStreamingProviders *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SHStreamingProviders *)v5 buildStreamingProvidersFromResponseArray:v4];
    providersKeyedByBundleID = v6->_providersKeyedByBundleID;
    v6->_providersKeyedByBundleID = (NSDictionary *)v7;
  }
  return v6;
}

- (id)buildStreamingProvidersFromResponseArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"bundleIdentifier", (void)v14);
        [v4 setValue:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)availableBundleIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(SHStreamingProviders *)self providersKeyedByBundleID];
  id v4 = [v3 allKeys];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (int64_t)availableStreamingProviders
{
  v2 = [(SHStreamingProviders *)self providersKeyedByBundleID];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)streamingProviderForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHStreamingProviders *)self providersKeyedByBundleID];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)providerNameForBundleID:(id)a3
{
  int64_t v3 = [(SHStreamingProviders *)self streamingProviderForBundleID:a3];
  id v4 = [v3 objectForKeyedSubscript:@"providerName"];

  return v4;
}

- (id)songURIForBundleID:(id)a3
{
  int64_t v3 = [(SHStreamingProviders *)self streamingProviderForBundleID:a3];
  id v4 = [v3 objectForKeyedSubscript:@"songURI"];

  return v4;
}

- (id)searchURLForBundleID:(id)a3 title:(id)a4 artist:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_super v10 = [(SHStreamingProviders *)self songURIForBundleID:a3];
  v11 = [[SHTokenizedURL alloc] initWithString:v10];
  [(SHTokenizedURL *)v11 updateToken:13 withValue:v9];

  [(SHTokenizedURL *)v11 updateToken:14 withValue:v8];
  v12 = [(SHTokenizedURL *)v11 URLRepresentation];

  return v12;
}

- (NSDictionary)providersKeyedByBundleID
{
  return self->_providersKeyedByBundleID;
}

- (void).cxx_destruct
{
}

@end