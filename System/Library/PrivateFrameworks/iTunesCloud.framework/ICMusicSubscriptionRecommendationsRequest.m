@interface ICMusicSubscriptionRecommendationsRequest
- (ICMusicSubscriptionRecommendationsRequest)initWithRequestContext:(id)a3 seedItemID:(int64_t)a4 isLibraryID:(BOOL)a5 maxResultCount:(int64_t)a6;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICMusicSubscriptionRecommendationsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsList, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t seedItemID = self->_seedItemID;
    BOOL isLibraryID = self->_isLibraryID;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = seedItemID;
    __int16 v13 = 1024;
    BOOL v14 = isLibraryID;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with seed itemID %lld, isLibraryID=%d", buf, 0x1Cu);
  }

  v6 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke;
  v8[3] = &unk_1E5ACD950;
  v8[4] = self;
  [v6 getBagForRequestContext:requestContext forceRefetch:0 withCompletionHandler:v8];
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
    objc_msgSend((id)v3, "finishWithError:");
  }
  else
  {
    if (*(unsigned char *)(v3 + 320)) {
      v5 = @"cloudId";
    }
    else {
      v5 = @"adamId";
    }
    v24[0] = v5;
    v6 = NSNumber;
    uint64_t v7 = *(void *)(v3 + 312);
    v8 = v5;
    v9 = [v6 numberWithLongLong:v7];
    v10 = [v9 stringValue];
    v25[0] = v10;
    v24[1] = @"count";
    __int16 v11 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 32) + 328)];
    int64_t v12 = [v11 stringValue];
    v24[2] = @"version";
    v25[1] = v12;
    v25[2] = @"1.0";
    __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

    BOOL v14 = [ICStoreRequestContext alloc];
    uint64_t v15 = +[ICUserIdentity activeAccount];
    v16 = [(ICStoreRequestContext *)v14 initWithIdentity:v15];

    v17 = +[ICURLBagProvider sharedBagProvider];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_2;
    v21[3] = &unk_1E5AC7F28;
    v21[4] = *(void *)(a1 + 32);
    id v22 = v13;
    v23 = v16;
    v18 = v16;
    id v19 = v13;
    [v17 getBagForRequestContext:v18 forceRefetch:0 withCompletionHandler:v21];
  }
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    v5 = [a2 urlForBagKey:@"pmlt-url"];
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v17 = 0;
      uint64_t v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v17];
      id v8 = v17;
      if (v8)
      {
        v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = v10;
          __int16 v20 = 2114;
          id v21 = v8;
          _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize recommended content request. err= %{public}@", buf, 0x16u);
        }

        [*(id *)(a1 + 32) finishWithError:v8];
      }
      else
      {
        __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v5];
        [v13 setHTTPBody:v7];
        [v13 setCachePolicy:1];
        [v13 setValue:@"Software" forHTTPHeaderField:@"X-Mme-Client-Application"];
        BOOL v14 = [[ICStoreURLRequest alloc] initWithURLRequest:v13 requestContext:*(void *)(a1 + 48)];
        uint64_t v15 = +[ICURLSessionManager defaultSession];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_26;
        v16[3] = &unk_1E5ACD928;
        v16[4] = *(void *)(a1 + 32);
        [v15 enqueueDataRequest:v14 withCompletionHandler:v16];
      }
    }
    else
    {
      __int16 v11 = *(void **)(a1 + 32);
      int64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v11 finishWithError:v12];
    }
  }
}

void __52__ICMusicSubscriptionRecommendationsRequest_execute__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to fetch recommended content. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    id v8 = [a2 parsedBodyDictionary];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 objectForKey:@"recommendedContentIds"];
      uint64_t v11 = *(void *)(a1 + 32);
      int64_t v12 = *(void **)(v11 + 336);
      *(void *)(v11 + 336) = v10;

      [*(id *)(a1 + 32) finishWithError:0];
    }
    else
    {
      __int16 v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v17 = 138543362;
        uint64_t v18 = v14;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ no response body - treating as failure", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v15 = *(void **)(a1 + 32);
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      [v15 finishWithError:v16];
    }
  }
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ICMusicSubscriptionRecommendationsRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __79__ICMusicSubscriptionRecommendationsRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 336), a2);
}

- (ICMusicSubscriptionRecommendationsRequest)initWithRequestContext:(id)a3 seedItemID:(int64_t)a4 isLibraryID:(BOOL)a5 maxResultCount:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICMusicSubscriptionRecommendationsRequest;
  int64_t v12 = [(ICRequestOperation *)&v15 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestContext, a3);
    v13->_int64_t seedItemID = a4;
    v13->_BOOL isLibraryID = a5;
    v13->_maxResultCount = a6;
  }

  return v13;
}

@end