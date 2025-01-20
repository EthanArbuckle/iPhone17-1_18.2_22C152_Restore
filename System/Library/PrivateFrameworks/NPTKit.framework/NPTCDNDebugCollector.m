@interface NPTCDNDebugCollector
+ (id)collectorName;
- (NSMutableDictionary)cachedMetadata;
- (NSURLSession)session;
- (id)metadataDidChangeHandler;
- (void)setCachedMetadata:(id)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)startCollectingWithCompletion:(id)a3;
- (void)stopCollecting;
@end

@implementation NPTCDNDebugCollector

- (void)startCollectingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NPTCDNDebugCollector *)self setCachedMetadata:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [(NPTCDNDebugCollector *)self cachedMetadata];
  [v8 setObject:v7 forKeyedSubscript:@"initial_state"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [(NPTCDNDebugCollector *)self cachedMetadata];
  [v10 setObject:v9 forKeyedSubscript:@"events"];

  v11 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
  [v11 setTimeoutIntervalForRequest:2.0];
  [v11 setTimeoutIntervalForResource:2.0];
  v12 = [MEMORY[0x263EFC640] sessionWithConfiguration:v11];
  [(NPTCDNDebugCollector *)self setSession:v12];

  v13 = [NSURL URLWithString:@"http://504sfaa.map.apple-dns.net/json"];
  v14 = [(NPTCDNDebugCollector *)self session];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__NPTCDNDebugCollector_startCollectingWithCompletion___block_invoke;
  v18[3] = &unk_2643A1DB0;
  id v19 = v5;
  v20 = self;
  id v21 = v4;
  id v15 = v4;
  id v16 = v5;
  v17 = [v14 dataTaskWithURL:v13 completionHandler:v18];

  [v17 resume];
}

void __54__NPTCDNDebugCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v7)
  {
    id v9 = [v7 localizedDescription];
    [v8 setValue:v9 forKey:@"Error"];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:0];
    [v8 addEntriesFromDictionary:v9];
  }

LABEL_6:
  v27 = v7;
  v28 = v6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v16 = objc_msgSend(v10, "valueForKey:", v15, v27);
        if (v16)
        {
          v17 = *(void **)(a1 + 32);
          v18 = [@"cdn_debug_" stringByAppendingString:v15];
          id v19 = [v18 lowercaseString];
          [v17 setObject:v16 forKey:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = [*(id *)(a1 + 40) cachedMetadata];
  [v21 setObject:v20 forKeyedSubscript:@"initial_state"];

  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23 = v22;
  if (v27) {
    [v22 addObject:v27];
  }
  uint64_t v24 = *(void *)(a1 + 48);
  if (v24)
  {
    uint64_t v25 = *(void *)(a1 + 32);
    v26 = (void *)[v23 copy];
    (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v26);
  }
}

- (void)stopCollecting
{
  id v2 = [(NPTCDNDebugCollector *)self session];
  [v2 invalidateAndCancel];
}

+ (id)collectorName
{
  return @"cdn_debug";
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);

  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end