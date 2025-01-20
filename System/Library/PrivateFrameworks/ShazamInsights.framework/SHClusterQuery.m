@interface SHClusterQuery
+ (id)artistsCluster;
+ (id)clusterForType:(int64_t)a3;
+ (id)tracksCluster;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (SHClusterQuery)initWithType:(int64_t)a3 configuration:(id)a4 sourceURL:(id)a5 destinationURL:(id)a6;
- (SHClusterQuery)initWithType:(int64_t)a3 sourceURL:(id)a4 destinationURL:(id)a5;
- (SHInsightsConfiguration)configuration;
- (SHStorefront)storefront;
- (int64_t)type;
- (void)controllerForType:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)filterMediaItemQueryCollection:(id)a3 bySeedCollection:(id)a4 completionHandler:(id)a5;
- (void)mediaItemsMatchingValuesInCollection:(id)a3 completionHandler:(id)a4;
- (void)mediaItemsWithHighCohesionToValue:(id)a3 forProperty:(id)a4 completionHandler:(id)a5;
- (void)statusWithCompletionHandler:(id)a3;
@end

@implementation SHClusterQuery

+ (id)clusterForType:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [a1 artistsCluster];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v3 = [a1 tracksCluster];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

+ (id)artistsCluster
{
  if (artistsCluster_onceToken != -1) {
    dispatch_once(&artistsCluster_onceToken, &__block_literal_global);
  }
  v2 = (void *)artistsCluster_artistCluster;
  return v2;
}

uint64_t __32__SHClusterQuery_artistsCluster__block_invoke()
{
  artistsCluster_artistCluster = [[SHClusterQuery alloc] initWithType:2 sourceURL:0 destinationURL:0];
  return MEMORY[0x270F9A758]();
}

+ (id)tracksCluster
{
  if (tracksCluster_onceToken != -1) {
    dispatch_once(&tracksCluster_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)tracksCluster_trackCluster;
  return v2;
}

uint64_t __31__SHClusterQuery_tracksCluster__block_invoke()
{
  tracksCluster_trackCluster = [[SHClusterQuery alloc] initWithType:1 sourceURL:0 destinationURL:0];
  return MEMORY[0x270F9A758]();
}

- (SHClusterQuery)initWithType:(int64_t)a3 sourceURL:(id)a4 destinationURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(SHInsightsConfiguration);
  v11 = [(SHClusterQuery *)self initWithType:a3 configuration:v10 sourceURL:v9 destinationURL:v8];

  return v11;
}

- (SHClusterQuery)initWithType:(int64_t)a3 configuration:(id)a4 sourceURL:(id)a5 destinationURL:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SHClusterQuery;
  v14 = [(SHClusterQuery *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceURL, a5);
    objc_storeStrong((id *)&v15->_configuration, a4);
    if (v13)
    {
      v16 = (NSURL *)v13;
    }
    else if (a3 == 1)
    {
      v16 = +[SHClusterController trackClusterDefaultLocationURL];
    }
    else
    {
      if (a3 != 2) {
        goto LABEL_5;
      }
      v16 = +[SHClusterController artistClusterDefaultLocationURL];
    }
    destinationURL = v15->_destinationURL;
    v15->_destinationURL = v16;

LABEL_5:
    v15->_type = a3;
    v18 = (SHStorefront *)objc_alloc_init(MEMORY[0x263F6C4C8]);
    storefront = v15->_storefront;
    v15->_storefront = v18;
  }
  return v15;
}

- (void)controllerForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(SHClusterQuery *)self storefront];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke;
  v9[3] = &unk_2647AD098;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 storefrontCountryCode:v9];
}

void __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SHClusterLoaderRequest alloc];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) sourceURL];
  v7 = [*(id *)(a1 + 32) destinationURL];
  id v8 = [*(id *)(a1 + 32) configuration];
  id v9 = [(SHClusterLoaderRequest *)v4 initWithType:v5 sourceURL:v6 outputURL:v7 configuration:v8];

  id v10 = [*(id *)(a1 + 32) configuration];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_2647ACF38;
  id v12 = *(id *)(a1 + 40);
  +[SHClusterLoader loadDataForRequest:v9 storefront:v3 configuration:v10 completionHandler:v11];
}

void __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    v7 = [[SHClusterController alloc] initWithDataStore:v5];
    (*(void (**)(uint64_t, SHClusterController *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

- (void)filterMediaItemQueryCollection:(id)a3 bySeedCollection:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(SHClusterQuery *)self type];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__SHClusterQuery_filterMediaItemQueryCollection_bySeedCollection_completionHandler___block_invoke;
  v15[3] = &unk_2647AD0C0;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(SHClusterQuery *)self controllerForType:v11 withCompletionHandler:v15];
}

uint64_t __84__SHClusterQuery_filterMediaItemQueryCollection_bySeedCollection_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 affinityGroupsFromQueryCollection:a1[4] filteredBySeedCollection:a1[5] completionHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)mediaItemsWithHighCohesionToValue:(id)a3 forProperty:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(SHClusterQuery *)self type];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__SHClusterQuery_mediaItemsWithHighCohesionToValue_forProperty_completionHandler___block_invoke;
  v15[3] = &unk_2647AD0C0;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(SHClusterQuery *)self controllerForType:v11 withCompletionHandler:v15];
}

uint64_t __82__SHClusterQuery_mediaItemsWithHighCohesionToValue_forProperty_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 mediaItemsSimilarToValue:a1[4] forKey:a1[5] completionHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)mediaItemsMatchingValuesInCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(SHClusterQuery *)self type];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__SHClusterQuery_mediaItemsMatchingValuesInCollection_completionHandler___block_invoke;
  v11[3] = &unk_2647AD0E8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(SHClusterQuery *)self controllerForType:v8 withCompletionHandler:v11];
}

uint64_t __73__SHClusterQuery_mediaItemsMatchingValuesInCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 mediaItemsForPropertyCollection:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)statusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHClusterQuery *)self destinationURL];
  char v6 = [v5 isFileURL];

  if (v6)
  {
    id v7 = [SHClusterLoaderRequest alloc];
    int64_t v8 = [(SHClusterQuery *)self type];
    id v9 = [(SHClusterQuery *)self configuration];
    id v10 = [(SHClusterLoaderRequest *)v7 initWithType:v8 configuration:v9];

    int64_t v11 = [(SHClusterQuery *)self storefront];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke;
    v13[3] = &unk_2647AD138;
    v13[4] = self;
    id v14 = v10;
    id v15 = v4;
    id v12 = v10;
    [v11 storefrontCountryCode:v13];
  }
  else
  {
    id v12 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    (*((void (**)(id, void, SHClusterLoaderRequest *))v4 + 2))(v4, 0, v12);
  }
}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] type];
  id v5 = [a1[4] configuration];
  if (v4 == 2)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_2647AD110;
    char v6 = &v16;
    id v7 = (id *)v17;
    id v16 = a1[5];
    v17[0] = v3;
    v17[1] = a1[4];
    int64_t v8 = &v18;
    id v18 = a1[6];
    id v9 = v3;
    [v5 artistsCachedDataMaxAgeWithCompletionHandler:v15];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_2647AD110;
    char v6 = &v12;
    id v7 = (id *)v13;
    id v12 = a1[5];
    v13[0] = v3;
    v13[1] = a1[4];
    int64_t v8 = &v14;
    id v14 = a1[6];
    id v10 = v3;
    [v5 tracksCachedDataMaxAgeWithCompletionHandler:v11];
  }
}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v4 = [SHClusterSQLiteDataStore alloc];
  uint64_t v5 = [*(id *)(a1 + 32) type];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) destinationURL];
  id v12 = [(SHClusterSQLiteDataStore *)v4 initWithClusterType:v5 databaseMaxAge:v6 forStorefront:v7 databaseFilePathURL:a2];

  int64_t v8 = [(SHClusterSQLiteDataStore *)v12 dataStatus];
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[SHInsightsError errorWithCode:200 underlyingError:0];
  }
  uint64_t v10 = *(void *)(a1 + 56);
  int64_t v11 = [(SHClusterSQLiteDataStore *)v12 dataStatus];
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v9);
}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v4 = [SHClusterSQLiteDataStore alloc];
  uint64_t v5 = [*(id *)(a1 + 32) type];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) destinationURL];
  id v12 = [(SHClusterSQLiteDataStore *)v4 initWithClusterType:v5 databaseMaxAge:v6 forStorefront:v7 databaseFilePathURL:a2];

  int64_t v8 = [(SHClusterSQLiteDataStore *)v12 dataStatus];
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[SHInsightsError errorWithCode:200 underlyingError:0];
  }
  uint64_t v10 = *(void *)(a1 + 56);
  int64_t v11 = [(SHClusterSQLiteDataStore *)v12 dataStatus];
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v9);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int64_t)type
{
  return self->_type;
}

- (SHStorefront)storefront
{
  return self->_storefront;
}

- (SHInsightsConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end