@interface ICLibraryAuthServiceClientTokenRequest
- (ICLibraryAuthServiceClientTokenRequest)initWithStoreRequestContext:(id)a3;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICLibraryAuthServiceClientTokenRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)execute
{
  v3 = +[ICURLBagProvider sharedBagProvider];
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke;
  v5[3] = &unk_1E5ACD950;
  v5[4] = self;
  [v3 getBagForRequestContext:storeRequestContext withCompletionHandler:v5];
}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5445;
    v16 = __Block_byref_object_dispose__5446;
    id v17 = [v5 urlForBagKey:@"library-auth-service-token-url"];
    v7 = *(id **)(a1 + 32);
    if (v13[5])
    {
      v8 = [v7[38] identityStore];
      v9 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_2;
      v11[3] = &unk_1E5AC7850;
      v11[4] = *(void *)(a1 + 32);
      v11[5] = &v12;
      [v8 getPropertiesForUserIdentity:v9 completionHandler:v11];
    }
    else
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v7 finishWithError:v10];
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    id v5 = [v3 DSID];
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 stringValue];
      [v4 setObject:v7 forKey:@"dsid"];
    }
    v8 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
    v9 = [v8 deviceGUID];

    if (v9) {
      [v4 setObject:v9 forKey:@"guid"];
    }
    uint64_t v10 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_URLByAppendingQueryParameters:", v4);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v13 setCachePolicy:1];
    uint64_t v14 = [[ICStoreURLRequest alloc] initWithURLRequest:v13 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
    v15 = +[ICURLSessionManager defaultSession];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_11;
    v20[3] = &unk_1E5ACD928;
    v20[4] = *(void *)(a1 + 32);
    [v15 enqueueDataRequest:v14 withCompletionHandler:v20];
  }
  else
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = [*(id *)(v17 + 304) identity];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no properties for account %{public}@", buf, 0x16u);
    }
    v19 = *(void **)(a1 + 32);
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
    [v19 finishWithError:v4];
  }
}

void __49__ICLibraryAuthServiceClientTokenRequest_execute__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v7 = [a2 urlResponse];
    uint64_t v8 = [v7 statusCode];
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v25 = 138543874;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      v28 = v6;
      __int16 v29 = 1024;
      int v30 = v8;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received error %{public}@. http status code=%d", (uint8_t *)&v25, 0x1Cu);
    }

    uint64_t v11 = [[ICLibraryAuthServiceClientTokenResponse alloc] initWithResultCode:v8];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 312);
    *(void *)(v12 + 312) = v11;
  }
  else
  {
    uint64_t v14 = [a2 parsedBodyDictionary];
    if (v14)
    {
      v7 = (void *)v14;
      v15 = [[ICLibraryAuthServiceClientTokenResponse alloc] initWithResponseDictionary:v14];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 312);
      *(void *)(v16 + 312) = v15;

      v18 = [*(id *)(*(void *)(a1 + 32) + 312) tokenResult];
      v19 = [v18 token];
      uint64_t v20 = [v19 length];

      if (!v20)
      {
        v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          int v25 = 138543618;
          uint64_t v26 = v22;
          __int16 v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ no token in library auth service response: %{public}@", (uint8_t *)&v25, 0x16u);
        }
      }
      id v6 = 0;
    }
    else
    {
      __int16 v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        int v25 = 138543362;
        uint64_t v26 = v24;
        _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to parse token response", (uint8_t *)&v25, 0xCu);
      }

      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      v7 = 0;
    }
  }

  [*(id *)(a1 + 32) finishWithError:v6];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ICLibraryAuthServiceClientTokenRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __76__ICLibraryAuthServiceClientTokenRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 312), a2);
}

- (ICLibraryAuthServiceClientTokenRequest)initWithStoreRequestContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLibraryAuthServiceClientTokenRequest;
  id v6 = [(ICRequestOperation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeRequestContext, a3);
  }

  return v7;
}

@end