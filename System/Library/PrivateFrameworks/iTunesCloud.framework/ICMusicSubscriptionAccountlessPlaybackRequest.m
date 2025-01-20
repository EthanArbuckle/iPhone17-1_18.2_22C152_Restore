@interface ICMusicSubscriptionAccountlessPlaybackRequest
- (ICMusicSubscriptionAccountlessPlaybackRequest)initWithRequestContext:(id)a3 storeSubscriptionAdamID:(int64_t)a4;
- (ICStoreRequestContext)requestContext;
- (NSString)assetSourceStorefrontID;
- (id)performWithResponseHandler:(id)a3;
- (int64_t)qualityOfService;
- (int64_t)storeSubscriptionAdamID;
- (void)setAssetSourceStorefrontID:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation ICMusicSubscriptionAccountlessPlaybackRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (id)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v6 = objc_alloc_init(ICMusicSubscriptionPlaybackRequestOperation);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke;
  v17[3] = &unk_1E5ACD750;
  v18 = v6;
  v7 = v6;
  [v5 setCancellationHandler:v17];
  [v5 setCancellable:1];
  [(ICMusicSubscriptionPlaybackRequestOperation *)v7 setRequestType:3];
  [(ICMusicSubscriptionPlaybackRequestOperation *)v7 setAssetSourceStorefrontID:self->_assetSourceStorefrontID];
  [(ICMusicSubscriptionPlaybackRequestOperation *)v7 setRequestContext:self->_requestContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke_2;
  v14[3] = &unk_1E5AC7A88;
  id v8 = v5;
  id v15 = v8;
  id v16 = v4;
  id v9 = v4;
  [(ICMusicSubscriptionPlaybackRequestOperation *)v7 setResponseHandler:v14];
  [(ICMusicSubscriptionPlaybackRequestOperation *)v7 setStoreSubscriptionAdamID:self->_storeSubscriptionAdamID];
  v10 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
  [v10 addOperation:v7];

  v11 = v16;
  id v12 = v8;

  return v12;
}

uint64_t __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __76__ICMusicSubscriptionAccountlessPlaybackRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = *(void **)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  [v8 setCancellationHandler:0];
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICMusicSubscriptionAccountlessPlaybackRequest)initWithRequestContext:(id)a3 storeSubscriptionAdamID:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionAccountlessPlaybackRequest;
  v7 = [(ICMusicSubscriptionAccountlessPlaybackRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    requestContext = v7->_requestContext;
    v7->_requestContext = (ICStoreRequestContext *)v8;

    v7->_qualityOfService = 25;
    v7->_storeSubscriptionAdamID = a4;
  }

  return v7;
}

@end