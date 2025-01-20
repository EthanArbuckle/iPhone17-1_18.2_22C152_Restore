@interface SHClusterLoader
+ (void)loadDataForRequest:(id)a3 storefront:(id)a4 configuration:(id)a5 completionHandler:(id)a6;
- (SHClusterLoader)initWithDataFetcher:(id)a3 dataStore:(id)a4;
- (SHClusterSQLiteDataStore)dataStore;
- (SHDataFetcher)dataFetcher;
- (void)loadFromURL:(id)a3 type:(int64_t)a4 storefront:(id)a5 reuseExistingData:(BOOL)a6 completion:(id)a7;
@end

@implementation SHClusterLoader

+ (void)loadDataForRequest:(id)a3 storefront:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__SHClusterLoader_loadDataForRequest_storefront_configuration_completionHandler___block_invoke;
  v13[3] = &unk_2647ACF60;
  id v14 = v9;
  id v15 = v10;
  id v11 = v9;
  id v12 = v10;
  [v11 sourceURLForRequestForStorefront:a4 configuration:a5 completion:v13];
}

void __81__SHClusterLoader_loadDataForRequest_storefront_configuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    id v9 = +[SHDataFetcherFileInfo dataFetcherForSourceURL:v7];
    id v10 = [SHClusterSQLiteDataStore alloc];
    uint64_t v11 = [*(id *)(a1 + 32) type];
    id v12 = [*(id *)(a1 + 32) outputURL];
    v13 = [(SHClusterSQLiteDataStore *)v10 initWithClusterType:v11 databaseMaxAge:v8 forStorefront:v12 databaseFilePathURL:a4];

    id v14 = [[SHClusterLoader alloc] initWithDataFetcher:v9 dataStore:v13];
    uint64_t v15 = [*(id *)(a1 + 32) type];
    uint64_t v16 = [*(id *)(a1 + 32) shouldDeleteExistingDatabaseAtOutputURL] ^ 1;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __81__SHClusterLoader_loadDataForRequest_storefront_configuration_completionHandler___block_invoke_2;
    v17[3] = &unk_2647ACF38;
    id v18 = *(id *)(a1 + 40);
    [(SHClusterLoader *)v14 loadFromURL:v7 type:v15 storefront:v8 reuseExistingData:v16 completion:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__SHClusterLoader_loadDataForRequest_storefront_configuration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [v7 dataStatus];
  [v6 loadStatus];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SHClusterLoader)initWithDataFetcher:(id)a3 dataStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHClusterLoader;
  id v9 = [(SHClusterLoader *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataFetcher, a3);
    objc_storeStrong((id *)&v10->_dataStore, a4);
  }

  return v10;
}

- (void)loadFromURL:(id)a3 type:(int64_t)a4 storefront:(id)a5 reuseExistingData:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  uint64_t v15 = [(SHClusterLoader *)self dataStore];
  uint64_t v16 = [v15 dataStatus];
  int v17 = [v16 isDataValid];

  if (v17 && v8)
  {
    id v18 = sh_log_object();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266BF000, v18, OS_LOG_TYPE_DEBUG, "Cluster data already loaded", (uint8_t *)buf, 2u);
    }

    v19 = [(SHClusterLoader *)self dataStore];
    v14[2](v14, v19, 0);
  }
  else
  {
    objc_initWeak(buf, self);
    v20 = [(SHClusterLoader *)self dataFetcher];
    v21 = [(SHClusterLoader *)self dataStore];
    v22 = [v21 dataStatus];
    v23 = [v22 uniqueHash];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __76__SHClusterLoader_loadFromURL_type_storefront_reuseExistingData_completion___block_invoke;
    v25[3] = &unk_2647ACF88;
    objc_copyWeak(v27, buf);
    v24 = v14;
    v27[1] = (id)a4;
    v25[4] = self;
    id v26 = v24;
    [v20 fetchClusterURL:v12 forCurrentStorefront:v13 cachedUniqueHash:v23 completionHandler:v25];

    objc_destroyWeak(v27);
    objc_destroyWeak(buf);
  }
}

void __76__SHClusterLoader_loadFromURL_type_storefront_reuseExistingData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v8 = [v6 domain];
  if ([v8 isEqualToString:@"com.apple.ShazamInsightsDataFetcher"])
  {
    uint64_t v9 = [v6 code];

    if (v9 == 100)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [WeakRetained dataStore];
      (*(void (**)(uint64_t, SHClusterMetadata *, void))(v10 + 16))(v10, v11, 0);
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
  }
  if (v5)
  {
    id v12 = [SHClusterMetadata alloc];
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = [(SHDataFetcherFileInfo *)v5 storefront];
    uint64_t v15 = [(SHDataFetcherFileInfo *)v5 uniqueHash];
    uint64_t v16 = [(SHDataFetcherFileInfo *)v5 creationDate];
    uint64_t v11 = [(SHClusterMetadata *)v12 initWithType:v13 storefront:v14 uniqueHash:v15 creationDate:v16];

    if ([(SHDataFetcherFileInfo *)v5 compressionType])
    {
      id v33 = 0;
      id v17 = +[SHClusterImporterUtils buildTemporaryClusterURLWithError:&v33];
      id v18 = v33;
      if (v18
        || (v19 = (void *)MEMORY[0x263F6C490],
            [(SHDataFetcherFileInfo *)v5 dataFilePathURL],
            v20 = objc_claimAutoreleasedReturnValue(),
            id v32 = 0,
            v21 = objc_msgSend(v19, "decompressFile:withAlgorithm:toLocation:error:", v20, -[SHDataFetcherFileInfo compressionType](v5, "compressionType"), v17, &v32), id v18 = v32, v20, (v21 & 1) == 0))
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:

        goto LABEL_18;
      }
      v22 = [[SHDataFetcherFileInfo alloc] initWithDataURL:v17];

      id v5 = v22;
    }
    id v18 = +[SHClusterImporterUtils importerForFile:v5];
    v23 = [WeakRetained dataStore];
    v24 = [v23 databaseFilePathURL];
    id v31 = 0;
    char v25 = [v18 loadDataFromFileInfo:v5 withMetadata:v11 toDestinationURL:v24 error:&v31];
    id v17 = v31;

    if ((v25 & 1) == 0)
    {
      id v26 = sh_log_object();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v17;
        _os_log_impl(&dword_2266BF000, v26, OS_LOG_TYPE_ERROR, "Failed to load the datastore %@", buf, 0xCu);
      }
    }
    uint64_t v27 = *(void *)(a1 + 40);
    v28 = [*(id *)(a1 + 32) dataStore];
    (*(void (**)(uint64_t, void *, id))(v27 + 16))(v27, v28, v17);

    goto LABEL_17;
  }
  uint64_t v29 = *(void *)(a1 + 40);
  v30 = [WeakRetained dataStore];
  (*(void (**)(uint64_t, void *, id))(v29 + 16))(v29, v30, v6);

LABEL_19:
}

- (SHClusterSQLiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SHDataFetcher)dataFetcher
{
  return self->_dataFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFetcher, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end