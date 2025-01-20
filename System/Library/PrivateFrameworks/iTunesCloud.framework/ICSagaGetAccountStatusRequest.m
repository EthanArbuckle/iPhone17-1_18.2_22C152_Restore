@interface ICSagaGetAccountStatusRequest
- (ICSagaGetAccountStatusRequest)initWithStoreRequestContext:(id)a3;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICSagaGetAccountStatusRequest

- (void).cxx_destruct
{
}

- (void)execute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    storeRequestContext = self->_storeRequestContext;
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    v15 = storeRequestContext;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Gathering iTunes match account status for context %{public}@", buf, 0x16u);
  }

  v5 = [(ICStoreRequestContext *)self->_storeRequestContext identity];
  v6 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v5];
  int v7 = [v6 privacyAcknowledgementRequiredForMusic];

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Skipping saga account status request because privacy acknowledgement is required", buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
    [(ICRequestOperation *)self finishWithError:v9];
  }
  else
  {
    v9 = +[ICURLBagProvider sharedBagProvider];
    v10 = self->_storeRequestContext;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__ICSagaGetAccountStatusRequest_execute__block_invoke;
    v11[3] = &unk_1E5ACD950;
    v11[4] = self;
    [v9 getBagForRequestContext:v10 withCompletionHandler:v11];
  }
}

void __40__ICSagaGetAccountStatusRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 312) = [v5 BOOLValueForBagKey:@"isMatchServiceEnabled"];
  int v7 = [v5 stringForBagKey:@"cloud-welcome"];
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = v7 != 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 314) = 0;
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch the bag to obtain match status url. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    v10 = [*(id *)(*(void *)(a1 + 32) + 304) identityStore];
    v11 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
    id v21 = 0;
    uint64_t v12 = [v10 getPropertiesForUserIdentity:v11 error:&v21];
    unint64_t v13 = (unint64_t)v21;

    if (v12 | v13)
    {
      __int16 v14 = [v5 stringForBagKey:@"getMatchStatusSrv"];
      if (v14)
      {
        v15 = [ICStoreURLRequest alloc];
        uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
        v17 = [(ICStoreURLRequest *)v15 initWithURL:v16 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];

        v18 = +[ICURLSessionManager defaultSession];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __40__ICSagaGetAccountStatusRequest_execute__block_invoke_6;
        v20[3] = &unk_1E5ACD928;
        v20[4] = *(void *)(a1 + 32);
        [v18 enqueueDataRequest:v17 withCompletionHandler:v20];
      }
      else
      {
        v19 = *(void **)(a1 + 32);
        v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
        [v19 finishWithError:v17];
      }
    }
    else
    {
      [*(id *)(a1 + 32) finishWithError:0];
    }
  }
}

void __40__ICSagaGetAccountStatusRequest_execute__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = [a2 parsedBodyDictionary];
    int v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      unint64_t v13 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received match status response: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    if (v6)
    {
      uint64_t v9 = [v6 objectForKey:@"isMatchSubscriber"];
      *(unsigned char *)(*(void *)(a1 + 32) + 314) = [v9 BOOLValue];
    }
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__ICSagaGetAccountStatusRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

void __67__ICSagaGetAccountStatusRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 304);
      int v8 = *(unsigned __int8 *)(v6 + 312);
      int v9 = *(unsigned __int8 *)(v6 + 313);
      int v10 = *(unsigned __int8 *)(v6 + 314);
      uint64_t v11 = objc_msgSend(v3, "msv_description");
      int v17 = 138544642;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 1024;
      int v24 = v9;
      __int16 v25 = 1024;
      int v26 = v10;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Finished gathering iTunes match account status for context %{public}@. isEnabled=%{BOOL}u, canSubscribe = %{BOOL}u, isSubscriber=%{BOOL}u error=%{public}@", (uint8_t *)&v17, 0x32u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v12 + 304);
    int v14 = *(unsigned __int8 *)(v12 + 312);
    int v15 = *(unsigned __int8 *)(v12 + 313);
    int v16 = *(unsigned __int8 *)(v12 + 314);
    int v17 = 138544386;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 1024;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = v15;
    __int16 v25 = 1024;
    int v26 = v16;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished gathering iTunes match account status for context %{public}@. isEnabled=%{BOOL}u, canSubscribe = %{BOOL}u, isSubscriber=%{BOOL}u", (uint8_t *)&v17, 0x28u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICSagaGetAccountStatusRequest)initWithStoreRequestContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSagaGetAccountStatusRequest;
  uint64_t v6 = [(ICRequestOperation *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeRequestContext, a3);
  }

  return v7;
}

@end