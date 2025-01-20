@interface NMSModelForYouRecommendationsRequestOperation
- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5;
- (void)execute;
@end

@implementation NMSModelForYouRecommendationsRequestOperation

- (void)execute
{
  v3 = [(MPStoreModelRequestOperation *)self request];
  if (objc_msgSend(v3, "nms_useCachedDataOnly"))
  {
    kdebug_trace();
    uint64_t v4 = objc_msgSend(v3, "nms_cachedRecommendationsArray");
    if (v4
      && (v5 = (void *)v4,
          objc_msgSend(v3, "nms_cachedStoreItemMetadataResults"),
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      v7 = objc_msgSend(v3, "nms_cachedRecommendationsArray");
      v8 = objc_msgSend(v3, "nms_cachedStoreItemMetadataResults");
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __56__NMSModelForYouRecommendationsRequestOperation_execute__block_invoke;
      v14[3] = &unk_2646348C8;
      v14[4] = self;
      v13.receiver = self;
      v13.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
      [(MPModelForYouRecommendationsRequestOperation *)&v13 _produceResponseWithRecommendationsArray:v7 storeItemMetadataResults:v8 completion:v14];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x263F11ED8]);
      v10 = [(MPStoreModelRequestOperation *)self request];
      v11 = (void *)[v9 initWithRequest:v10];
      [(MPStoreModelRequestOperation *)self _finishWithResponse:v11 error:0];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
    [(MPStoreModelRequestOperation *)&v12 execute];
  }
}

void __56__NMSModelForYouRecommendationsRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace();
  [*(id *)(a1 + 32) _finishWithResponse:v6 error:v5];
}

- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MPStoreModelRequestOperation *)self request];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __126__NMSModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke;
  v17[3] = &unk_2646348F0;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v16.receiver = self;
  v16.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  [(MPModelForYouRecommendationsRequestOperation *)&v16 _produceResponseWithRecommendationsArray:v14 storeItemMetadataResults:v13 completion:v17];
}

void __126__NMSModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "nms_useCachedDataOnly") & 1) == 0)
  {
    objc_msgSend(v7, "nms_setCachedRecommendationsArray:", *(void *)(a1 + 40));
    objc_msgSend(v7, "nms_setCachedStoreItemMetadataResults:", *(void *)(a1 + 48));
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

@end