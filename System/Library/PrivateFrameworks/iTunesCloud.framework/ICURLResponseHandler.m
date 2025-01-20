@interface ICURLResponseHandler
- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICURLResponseHandler

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 statusCode];
  v12 = ICURLResponseStatusCodeGetExtendedDescription(v11);
  v13 = [v9 requestContext];
  v14 = [v13 authenticationProvider];

  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0x191 && v14)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v29 = self;
      __int16 v30 = 2114;
      id v31 = v9;
      __int16 v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ attempting re-authentication for HTTP response code %{public}@.", buf, 0x20u);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__ICURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E5ACAB00;
    v24[4] = self;
    id v25 = v9;
    id v26 = v12;
    id v27 = v10;
    [v14 performAuthenticationToHandleResponse:v8 toRequest:v25 withCompletionHandler:v24];
  }
  else
  {
    uint64_t v16 = [v9 handlingType];
    v17 = [v9 retryReason];
    if (!v16)
    {
      uint64_t v16 = [v9 error];

      if (v11 == 502 || v16)
      {
        v18 = +[ICEnvironmentMonitor sharedMonitor];
        char v19 = [v18 isRemoteServerLikelyReachable];

        v20 = [v9 error];
        uint64_t v21 = [v20 code];

        if (v21 != -7100 || (v19 & 1) != 0)
        {

          v17 = @"other";
          uint64_t v16 = 2;
        }
        else
        {
          v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = self;
            __int16 v30 = 2114;
            id v31 = v9;
            _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Got connection error and server is not reachable - skipping retry", buf, 0x16u);
          }

          uint64_t v16 = 0;
        }
      }
    }
    v23 = [v9 error];
    (*((void (**)(id, uint64_t, __CFString *, void *))v10 + 2))(v10, v16, v17, v23);
  }
}

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v11 = a5;
  id v7 = a4;
  uint64_t v8 = [a3 statusCode];
  unsigned int v9 = [v7 cancelOnHTTPErrors];

  if (v8 > 399) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  (*((void (**)(id, uint64_t, void, void, void))v11 + 2))(v11, v10, 0, 0, 0);
}

void __81__ICURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5 && a2)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ authentication for HTTP response code %{public}@ successful - retrying request", (uint8_t *)&v15, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    v12 = @"authentication-performed";
    uint64_t v13 = 1;
    goto LABEL_11;
  }
  uint64_t v13 = a2;
  if (a2) {
    v12 = @"authentication-performed";
  }
  else {
    v12 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (!v5)
  {
LABEL_11:
    v14 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, uint64_t, __CFString *, void *))(v11 + 16))(v11, v13, v12, v14);

    goto LABEL_12;
  }
  (*(void (**)(void, uint64_t, __CFString *, id))(v11 + 16))(*(void *)(a1 + 56), v13, v12, v5);
LABEL_12:
}

@end