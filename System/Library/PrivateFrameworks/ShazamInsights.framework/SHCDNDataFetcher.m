@interface SHCDNDataFetcher
- (BOOL)doesRequestEtag:(id)a3 matchInResponse:(id)a4;
- (SHCDNDataFetcher)init;
- (SHCDNDataFetcher)initWithNetworkRequester:(id)a3;
- (SHNetworkRequester)networkRequester;
- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6;
- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6;
@end

@implementation SHCDNDataFetcher

- (SHCDNDataFetcher)init
{
  v3 = objc_opt_new();
  v4 = [(SHCDNDataFetcher *)self initWithNetworkRequester:v3];

  return v4;
}

- (SHCDNDataFetcher)initWithNetworkRequester:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHCDNDataFetcher;
  v6 = [(SHCDNDataFetcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkRequester, a3);
  }

  return v7;
}

- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263F089E0] requestWithURL:v10];
  v15 = v14;
  if (v12) {
    [v14 addValue:v12 forHTTPHeaderField:@"If-None-Match"];
  }
  v16 = [(SHCDNDataFetcher *)self networkRequester];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __92__SHCDNDataFetcher_fetchClusterURL_forCurrentStorefront_cachedUniqueHash_completionHandler___block_invoke;
  v21[3] = &unk_2647AD400;
  v21[4] = self;
  id v22 = v12;
  id v24 = v10;
  id v25 = v13;
  id v23 = v11;
  id v17 = v10;
  id v18 = v11;
  id v19 = v13;
  id v20 = v12;
  [v16 downloadResourceFromRequest:v15 completionHandler:v21];
}

void __92__SHCDNDataFetcher_fetchClusterURL_forCurrentStorefront_cachedUniqueHash_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 statusCode] == 304
    || [*(id *)(a1 + 32) doesRequestEtag:*(void *)(a1 + 40) matchInResponse:v7])
  {
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamInsightsDataFetcher" code:100 userInfo:0];
    (*(void (**)(uint64_t, void, SHDataFetcherFileInfo *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_5;
    }
    id v12 = [SHDataFetcherFileInfo alloc];
    id v13 = [v7 suggestedFilename];
    id v11 = [(SHDataFetcherFileInfo *)v12 initWithDataURL:v8 suggestedFileName:v13];

    [(SHDataFetcherFileInfo *)v11 setStorefront:*(void *)(a1 + 48)];
    v14 = [MEMORY[0x263EFF910] date];
    [(SHDataFetcherFileInfo *)v11 setCreationDate:v14];

    v15 = [v7 valueForHTTPHeaderField:@"Etag"];
    if (!v15)
    {
      v16 = [MEMORY[0x263F08C38] UUID];
      v15 = [v16 UUIDString];

      id v17 = sh_log_object();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 56);
        int v19 = 138412290;
        uint64_t v20 = v18;
        _os_log_impl(&dword_2266BF000, v17, OS_LOG_TYPE_ERROR, "Etag missing for request to %@, replacing with random hash", (uint8_t *)&v19, 0xCu);
      }
    }
    [(SHDataFetcherFileInfo *)v11 setUniqueHash:v15];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_5:
}

- (BOOL)doesRequestEtag:(id)a3 matchInResponse:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a3;
  v6 = [a4 allHeaderFields];
  id v7 = [v6 objectForKeyedSubscript:@"Etag"];

  LOBYTE(v6) = [v5 isEqualToString:v7];
  return (char)v6;
}

- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [MEMORY[0x263F089E0] requestWithURL:a3];
  id v12 = [(SHCDNDataFetcher *)self networkRequester];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__SHCDNDataFetcher_clusterDataAtURL_forLocation_date_completionHandler___block_invoke;
  v15[3] = &unk_2647AD428;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  [v12 performRequest:v11 completionHandler:v15];
}

void __72__SHCDNDataFetcher_clusterDataAtURL_forLocation_date_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = a2;
    id v9 = [SHDataFetcherFileInfo alloc];
    id v10 = [v8 suggestedFilename];
    id v11 = [(SHDataFetcherFileInfo *)v9 initWithData:v7 suggestedFileName:v10];

    [(SHDataFetcherFileInfo *)v11 setCreationDate:*(void *)(a1 + 32)];
    id v12 = [v8 valueForHTTPHeaderField:@"Etag"];

    [(SHDataFetcherFileInfo *)v11 setUniqueHash:v12];
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (SHNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void).cxx_destruct
{
}

@end