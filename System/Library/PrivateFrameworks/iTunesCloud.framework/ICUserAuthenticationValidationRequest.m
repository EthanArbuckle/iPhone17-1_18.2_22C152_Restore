@interface ICUserAuthenticationValidationRequest
- (ICUserAuthenticationValidationRequest)initWithRequestContext:(id)a3;
- (ICUserAuthenticationValidationRequest)initWithUserIdentity:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation ICUserAuthenticationValidationRequest

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ICStoreRequestContext *)self->_requestContext identity];
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ performing authentication validation for user identity %{public}@", buf, 0x16u);
  }
  v7 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke;
  v10[3] = &unk_1E5AC9E30;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v7 getBagForRequestContext:requestContext withCompletionHandler:v10];
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch the bag. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = [a2 urlForBagKey:@"getSubscriptionStatusSrv"];
    if (v8)
    {
      id v9 = [[ICStoreURLRequest alloc] initWithURL:v8 requestContext:*(void *)(*(void *)(a1 + 32) + 8)];
      [(ICURLRequest *)v9 setMaxRetryCount:0];
      v10 = +[ICURLSessionManager defaultSession];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_5;
      v15[3] = &unk_1E5ACD400;
      id v11 = *(void **)(a1 + 40);
      v15[4] = *(void *)(a1 + 32);
      id v16 = v11;
      [v10 enqueueDataRequest:v9 withCompletionHandler:v15];
    }
    else
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Validation failed because the subscription status url is missing from the bag", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(a1 + 40);
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      (*(void (**)(uint64_t, void, ICStoreURLRequest *))(v14 + 16))(v14, 0, v9);
    }
  }
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v7;
      __int16 v31 = 2114;
      id v32 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch subscription status. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = [a2 parsedBodyDictionary];
    if (v8)
    {
      id v28 = 0;
      BOOL v9 = +[ICMusicSubscriptionStatusResponse isValidSubscriptionStatusResponseDictionary:v8 error:&v28];
      id v10 = v28;
      if (v9)
      {
        id v11 = [[ICMusicSubscriptionStatusResponse alloc] initWithResponseDictionary:v8 expirationDate:0];
        v12 = [(ICMusicSubscriptionStatusResponse *)v11 subscriptionStatus];
        uint64_t v13 = [v12 reasonType];

        uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13 == 4)
        {
          if (v15)
          {
            uint64_t v16 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v16;
            _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Received invalidToken response - attempting to authenticate", buf, 0xCu);
          }

          v17 = [*(id *)(*(void *)(a1 + 32) + 8) authenticationProvider];
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(v18 + 8);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_7;
          v26[3] = &unk_1E5ACCD60;
          v26[4] = v18;
          id v27 = *(id *)(a1 + 40);
          [v17 performAuthenticationUsingRequestContext:v19 withCompletionHandler:v26];
        }
        else
        {
          if (v15)
          {
            uint64_t v25 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v25;
            _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ authentication validation completed successfully", buf, 0xCu);
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = v24;
          __int16 v31 = 2114;
          id v32 = v10;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status response parsing failed with error: %{public}@.", buf, 0x16u);
        }

        (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v10);
      }
    }
    else
    {
      id v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v21;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed due to invalid response.", buf, 0xCu);
      }

      uint64_t v22 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0, v10);
    }
  }
}

void __63__ICUserAuthenticationValidationRequest_performWithCompletion___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication complete. authenticated = %{BOOL}u, err = %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICUserAuthenticationValidationRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICUserAuthenticationValidationRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;
  }
  return v5;
}

- (ICUserAuthenticationValidationRequest)initWithUserIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [ICStoreRequestContext alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ICUserAuthenticationValidationRequest_initWithUserIdentity___block_invoke;
  v10[3] = &unk_1E5ACC698;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(ICStoreRequestContext *)v5 initWithBlock:v10];
  int v8 = [(ICUserAuthenticationValidationRequest *)self initWithRequestContext:v7];

  return v8;
}

void __62__ICUserAuthenticationValidationRequest_initWithUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  [v3 setStoreDialogResponseHandler:0];
  [v3 setAllowsExpiredBags:1];
}

@end