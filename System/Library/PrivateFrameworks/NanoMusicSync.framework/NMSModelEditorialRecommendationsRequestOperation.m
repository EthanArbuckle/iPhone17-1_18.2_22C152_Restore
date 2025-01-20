@interface NMSModelEditorialRecommendationsRequestOperation
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)execute;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation NMSModelEditorialRecommendationsRequestOperation

- (void)execute
{
  v3 = [(MPStoreModelRequestOperation *)self request];
  if (objc_msgSend(v3, "nms_useCachedDataOnly"))
  {
    v4 = objc_msgSend(v3, "nms_cachedLoadedOutput");

    if (v4)
    {
      v5 = objc_msgSend(v3, "nms_cachedLoadedOutput");
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __59__NMSModelEditorialRecommendationsRequestOperation_execute__block_invoke;
      v10[3] = &unk_2646348C8;
      v10[4] = self;
      [(NMSModelEditorialRecommendationsRequestOperation *)self produceResponseWithLoadedOutput:v5 completion:v10];
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263F12060]);
      v7 = [(MPStoreModelRequestOperation *)self request];
      v8 = (void *)[v6 initWithRequest:v7];
      [(MPStoreModelRequestOperation *)self _finishWithResponse:v8 error:0];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
    [(MPModelStoreBrowseRequestOperation *)&v9 execute];
  }
}

uint64_t __59__NMSModelEditorialRecommendationsRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithResponse:a2 error:a3];
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 dictionaryForBagKey:@"musicSubscription"];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v8 = (void *)getAKAccountManagerClass_softClass_0;
  uint64_t v26 = getAKAccountManagerClass_softClass_0;
  if (!getAKAccountManagerClass_softClass_0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __getAKAccountManagerClass_block_invoke_0;
    v22[3] = &unk_264634070;
    v22[4] = &v23;
    __getAKAccountManagerClass_block_invoke_0((uint64_t)v22);
    v8 = (void *)v24[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v23, 8);
  v10 = [v9 sharedInstance];
  v11 = [v10 primaryAuthKitAccount];
  int v12 = [v10 userUnderAgeForAccount:v11];

  v13 = @"musicStarterPackOver13";
  if (v12) {
    v13 = @"musicStarterPackUnder13";
  }
  v14 = v13;
  v15 = [v7 objectForKey:v14];
  if (v15)
  {
    v16 = [NSURL URLWithString:v15];
    v17 = [(MPStoreModelRequestOperation *)self request];
    [v17 setLoadAdditionalContentURL:v16];
  }
  else
  {
    v18 = NMLogForCategory(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[NMSModelEditorialRecommendationsRequestOperation configurationForLoadingModelDataWithStoreURLBag:error:]((uint64_t)v14, v18);
    }

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
  v19 = [(MPModelStoreBrowseRequestOperation *)&v21 configurationForLoadingModelDataWithStoreURLBag:v6 error:a4];

  return v19;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MPStoreModelRequestOperation *)self request];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __95__NMSModelEditorialRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v13[3] = &unk_264633D50;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  v12.receiver = self;
  v12.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [(MPModelStoreBrowseRequestOperation *)&v12 produceResponseWithLoadedOutput:v10 completion:v13];
}

void __95__NMSModelEditorialRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "nms_useCachedDataOnly") & 1) == 0) {
    objc_msgSend(v7, "nms_setCachedLoadedOutput:", *(void *)(a1 + 40));
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)configurationForLoadingModelDataWithStoreURLBag:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[Recommendation] (Editorial) Missing musicStarterPack bag key: %@", (uint8_t *)&v2, 0xCu);
}

@end