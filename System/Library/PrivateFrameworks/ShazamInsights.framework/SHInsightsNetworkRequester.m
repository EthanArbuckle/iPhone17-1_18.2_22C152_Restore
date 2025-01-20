@interface SHInsightsNetworkRequester
- (id)response:(id)a3 data:(id)a4 error:(id)a5;
- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4;
- (void)performRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation SHInsightsNetworkRequester

- (void)performRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F08BF8];
  id v8 = a3;
  v9 = [v7 sharedSession];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __63__SHInsightsNetworkRequester_performRequest_completionHandler___block_invoke;
  v15 = &unk_2647AD460;
  v16 = self;
  id v17 = v6;
  id v10 = v6;
  v11 = [v9 dataTaskWithRequest:v8 completionHandler:&v12];

  objc_msgSend(v11, "resume", v12, v13, v14, v15, v16);
}

void __63__SHInsightsNetworkRequester_performRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v11 = [v7 response:v8 data:v9 error:a4];
  if (v11) {
    id v10 = 0;
  }
  else {
    id v10 = v9;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, v10);
}

- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F08BF8];
  id v8 = a3;
  id v9 = [v7 sharedSession];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __76__SHInsightsNetworkRequester_downloadResourceFromRequest_completionHandler___block_invoke;
  v15 = &unk_2647AD488;
  v16 = self;
  id v17 = v6;
  id v10 = v6;
  id v11 = [v9 downloadTaskWithRequest:v8 completionHandler:&v12];

  objc_msgSend(v11, "resume", v12, v13, v14, v15, v16);
}

void __76__SHInsightsNetworkRequester_downloadResourceFromRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = (void *)MEMORY[0x263EFF8F8];
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = [v8 dataWithContentsOfURL:v11];
  id v14 = [v7 response:v10 data:v12 error:v9];

  if (v14) {
    id v13 = 0;
  }
  else {
    id v13 = v11;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v13);
}

- (id)response:(id)a3 data:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)([v7 statusCode] - 200) < 0x64 || objc_msgSend(v7, "statusCode") == 304)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    if (v8)
    {
      uint64_t v12 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    if ([v7 statusCode] == 404) {
      uint64_t v13 = 200;
    }
    else {
      uint64_t v13 = 100;
    }
    id v10 = +[SHInsightsError errorWithCode:v13 underlyingError:v9 keyOverrides:v11];

    id v14 = shcore_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_2266BF000, v14, OS_LOG_TYPE_ERROR, "Network call: %@ failed with bad server response: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  return v10;
}

@end