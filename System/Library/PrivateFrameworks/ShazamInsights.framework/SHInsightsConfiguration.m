@interface SHInsightsConfiguration
+ (id)bagContract;
+ (void)fetchSharedInstanceWithCompletion:(id)a3;
- (SHBagContract)bagContract;
- (SHInsightsConfiguration)init;
- (SHInsightsConfiguration)initWithBagContract:(id)a3;
- (id)fillInTokenizedURL:(id)a3 date:(id)a4 geoHash:(id)a5;
- (void)artistsCachedDataMaxAgeWithCompletionHandler:(id)a3;
- (void)artistsClusterEndpointWithCompletionHandler:(id)a3;
- (void)artistsEnabledWithCompletionHandler:(id)a3;
- (void)geoChartsEndpointForDate:(id)a3 geoHash:(id)a4 completionHandler:(id)a5;
- (void)geoHashLengthsWithCompletionHandler:(id)a3;
- (void)tokenizedURLForBagPathKey:(id)a3 completionHandler:(id)a4;
- (void)tracksCachedDataMaxAgeWithCompletionHandler:(id)a3;
- (void)tracksClusterEndpointForStorefront:(id)a3 completionHandler:(id)a4;
- (void)tracksEnabledWithCompletionHandler:(id)a3;
@end

@implementation SHInsightsConfiguration

+ (void)fetchSharedInstanceWithCompletion:(id)a3
{
  id v3 = a3;
  if (fetchSharedInstanceWithCompletion__onceToken != -1) {
    dispatch_once(&fetchSharedInstanceWithCompletion__onceToken, &__block_literal_global_1);
  }
  v4 = shcore_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266BF000, v4, OS_LOG_TYPE_DEBUG, "Fetching insights configuration...", buf, 2u);
  }

  v5 = [(id)fetchSharedInstanceWithCompletion__insights bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke_38;
  v7[3] = &unk_2647AD1D0;
  id v8 = v3;
  id v6 = v3;
  [v5 loadBaseDictionary:v7];
}

uint64_t __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke()
{
  fetchSharedInstanceWithCompletion__insights = objc_alloc_init(SHInsightsConfiguration);
  return MEMORY[0x270F9A758]();
}

void __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = shcore_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2266BF000, v4, OS_LOG_TYPE_DEBUG, "Failed to load insights configuration %@, using defaults", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)bagContract
{
  if (bagContract_onceToken != -1) {
    dispatch_once(&bagContract_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)bagContract_bagContract;
  return v2;
}

uint64_t __38__SHInsightsConfiguration_bagContract__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F6C488]) initWithBaseDictionaryKey:@"shazam-insights" profile:@"Shazam" profileVersion:@"1"];
  v1 = (void *)bagContract_bagContract;
  bagContract_bagContract = v0;

  [(id)bagContract_bagContract addBagKey:@"geocharts/minGeohashLength" defaultValue:&unk_26DA45050];
  [(id)bagContract_bagContract addBagKey:@"geocharts/maxGeohashLength" defaultValue:&unk_26DA45068];
  [(id)bagContract_bagContract addBagKey:@"targeting/updateInterval" defaultValue:&unk_26DA45080];
  uint64_t v2 = MEMORY[0x263EFFA80];
  [(id)bagContract_bagContract addBagKey:@"targeting/enabled" defaultValue:MEMORY[0x263EFFA80]];
  [(id)bagContract_bagContract addBagKey:@"artists/maxAgeInSeconds" defaultValue:&unk_26DA45080];
  id v3 = (void *)bagContract_bagContract;
  return [v3 addBagKey:@"artists/enabled" defaultValue:v2];
}

- (SHInsightsConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHInsightsConfiguration;
  uint64_t v2 = [(SHInsightsConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() bagContract];
    bagContract = v2->_bagContract;
    v2->_bagContract = (SHBagContract *)v3;
  }
  return v2;
}

- (SHInsightsConfiguration)initWithBagContract:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHInsightsConfiguration;
  objc_super v6 = [(SHInsightsConfiguration *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bagContract, a3);
  }

  return v7;
}

- (void)tracksCachedDataMaxAgeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHInsightsConfiguration *)self bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SHInsightsConfiguration_tracksCachedDataMaxAgeWithCompletionHandler___block_invoke;
  v7[3] = &unk_2647AD1F8;
  id v8 = v4;
  id v6 = v4;
  [v5 doubleBackedByStringForKey:@"targeting/updateInterval" completionHandler:v7];
}

uint64_t __71__SHInsightsConfiguration_tracksCachedDataMaxAgeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tracksEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHInsightsConfiguration *)self bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SHInsightsConfiguration_tracksEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_2647AD220;
  id v8 = v4;
  id v6 = v4;
  [v5 BOOLeanBackedByStringForKey:@"targeting/enabled" completionHandler:v7];
}

uint64_t __62__SHInsightsConfiguration_tracksEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tracksClusterEndpointForStorefront:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__SHInsightsConfiguration_tracksClusterEndpointForStorefront_completionHandler___block_invoke;
  v10[3] = &unk_2647AD248;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SHInsightsConfiguration *)self tokenizedURLForBagPathKey:@"targeting/path" completionHandler:v10];
}

void __80__SHInsightsConfiguration_tracksClusterEndpointForStorefront_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 updateToken:3 withValue:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [v6 URLRepresentation];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)artistsCachedDataMaxAgeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHInsightsConfiguration *)self bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__SHInsightsConfiguration_artistsCachedDataMaxAgeWithCompletionHandler___block_invoke;
  v7[3] = &unk_2647AD1F8;
  id v8 = v4;
  id v6 = v4;
  [v5 doubleBackedByStringForKey:@"artists/maxAgeInSeconds" completionHandler:v7];
}

uint64_t __72__SHInsightsConfiguration_artistsCachedDataMaxAgeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)artistsEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHInsightsConfiguration *)self bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SHInsightsConfiguration_artistsEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_2647AD220;
  id v8 = v4;
  id v6 = v4;
  [v5 BOOLeanBackedByStringForKey:@"artists/enabled" completionHandler:v7];
}

uint64_t __63__SHInsightsConfiguration_artistsEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)artistsClusterEndpointWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__SHInsightsConfiguration_artistsClusterEndpointWithCompletionHandler___block_invoke;
  v6[3] = &unk_2647AD270;
  id v7 = v4;
  id v5 = v4;
  [(SHInsightsConfiguration *)self tokenizedURLForBagPathKey:@"artists/path" completionHandler:v6];
}

void __71__SHInsightsConfiguration_artistsClusterEndpointWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 URLRepresentation];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)geoChartsEndpointForDate:(id)a3 geoHash:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__SHInsightsConfiguration_geoChartsEndpointForDate_geoHash_completionHandler___block_invoke;
  v14[3] = &unk_2647AD298;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(SHInsightsConfiguration *)self tokenizedURLForBagPathKey:@"geocharts/path" completionHandler:v14];
}

void __78__SHInsightsConfiguration_geoChartsEndpointForDate_geoHash_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) fillInTokenizedURL:a2 date:*(void *)(a1 + 40) geoHash:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 56);
    v3(v4);
  }
}

- (id)fillInTokenizedURL:(id)a3 date:(id)a4 geoHash:(id)a5
{
  id v7 = (void *)MEMORY[0x263EFF8F0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 currentCalendar];
  id v12 = [v11 components:8196 fromDate:v9];

  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v12, "year"));
  [v10 updateToken:6 withValue:v13];

  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v12, "weekOfYear"));
  [v10 updateToken:7 withValue:v14];

  [v10 updateToken:8 withValue:v8];
  id v15 = [v10 URLRepresentation];

  return v15;
}

- (void)geoHashLengthsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHInsightsConfiguration *)self bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke;
  v7[3] = &unk_2647AD2E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 integerBackedByStringForKey:@"geocharts/minGeohashLength" completionHandler:v7];
}

void __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) bagContract];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_2647AD2C0;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  [v6 integerBackedByStringForKey:@"geocharts/maxGeohashLength" completionHandler:v8];
}

uint64_t __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[4]) {
    a3 = a1[4];
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1[5] + 16))(a1[5], a1[6], a2, a3);
}

- (void)tokenizedURLForBagPathKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHInsightsConfiguration *)self bagContract];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke;
  v11[3] = &unk_2647AD338;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 stringForKey:@"baseURL" withCompletionHandler:v11];
}

void __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bagContract];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke_2;
  v7[3] = &unk_2647AD310;
  id v8 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 stringForKey:v5 withCompletionHandler:v7];
}

void __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  if (v3 && *(void *)(a1 + 32))
  {
    id v5 = objc_alloc(MEMORY[0x263F6C4D0]);
    id v6 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v8];
    id v7 = (void *)[v5 initWithString:v6];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v7, 0);
  }
  else
  {
    id v6 = +[SHInsightsError errorWithCode:200 underlyingError:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
  }
}

- (SHBagContract)bagContract
{
  return self->_bagContract;
}

- (void).cxx_destruct
{
}

@end