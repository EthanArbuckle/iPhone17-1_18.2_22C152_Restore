@interface ICMusicKitURLResponseHandler
- (void)_invalidateDeveloperTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)_invalidateUserTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)_updateRequest:(id)a3 forProcessedResponseOfStoreURLRequest:(id)a4;
- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICMusicKitURLResponseHandler

- (void)_updateRequest:(id)a3 forProcessedResponseOfStoreURLRequest:(id)a4
{
  id v5 = a3;
  [a4 retryDelay];
  objc_msgSend(v5, "setRetryDelay:");
}

- (void)_invalidateUserTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 requestContext];
  v11 = [v8 _developerToken];
  v12 = +[ICMusicUserTokenCache sharedCache];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__ICMusicKitURLResponseHandler__invalidateUserTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5ACC6E8;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v13 = v9;
  id v14 = v7;
  id v15 = v8;
  [v12 setCachedUserToken:0 forDeveloperToken:v11 requestContext:v10 completion:v16];
}

void __103__ICMusicKitURLResponseHandler__invalidateUserTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke(void *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying request after successfully invalidating music user token.", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
    id v7 = @"music-user-token-invalidated";
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8104, a3, @"Failed to invalidate music user token.");
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      v10 = objc_msgSend(v6, "msv_description");
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while processing initial response %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);
    }
    id v7 = 0;
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_invalidateDeveloperTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 requestContext];
  int v11 = [v10 clientInfo];
  uint64_t v12 = [v10 developerTokenProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__ICMusicKitURLResponseHandler__invalidateDeveloperTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5ACC6E8;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v13 = v9;
  id v14 = v7;
  id v15 = v8;
  [v12 invalidateCachedDeveloperTokenForClientInfo:v11 completionHandler:v16];
}

void __108__ICMusicKitURLResponseHandler__invalidateDeveloperTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke(void *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying request after successfully invalidating developer token.", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
    id v7 = @"developer-token-invalidated";
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8201, a3, @"Failed to invalidate developer token.");
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      v10 = objc_msgSend(v6, "msv_description");
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while processing initial response %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);
    }
    id v7 = 0;
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ICMusicKitURLResponseHandler.m", 62, @"%@ only knows how to process responses for MusicKit requests. %@ is unsupported.", self, v10 object file lineNumber description];
  }
  uint64_t v12 = [v10 handlingType];
  if (!v12)
  {
    uint64_t v16 = [v9 statusCode];
    uint64_t v17 = ICURLResponseStatusCodeGetExtendedDescription(v16);
    id v18 = v10;
    id v19 = [v18 requestContext];
    uint64_t v20 = [v19 personalizationMethod];
    if (v20)
    {
      if (v20 != 1)
      {
        v35 = v19;
        BOOL v22 = 0;
        BOOL v21 = 0;
        goto LABEL_14;
      }
      BOOL v21 = v16 == 403;
      if (v16 != 401)
      {
        v35 = v19;
        BOOL v22 = 0;
LABEL_14:
        int v24 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v22 = v16 == 403;
      if (v16 != 401)
      {
        v35 = v19;
        BOOL v21 = 0;
        int v24 = 1;
LABEL_16:
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
        v43[3] = &unk_1E5AC9DD0;
        id v36 = v18;
        id v44 = v18;
        BOOL v50 = v22;
        id v49 = v11;
        v45 = self;
        v37 = v17;
        id v25 = v17;
        id v46 = v25;
        id v26 = v9;
        id v47 = v26;
        id v27 = v44;
        id v48 = v27;
        BOOL v51 = v21;
        v28 = (void *)MEMORY[0x1A6240BF0](v43);
        if (v24)
        {
          v29 = [v27 _pendingEquivalentStoreURLRequest];
          v30 = [v29 responseHandler];
          v31 = v30;
          if (v29 && v30)
          {
            log = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v53 = self;
              __int16 v54 = 2114;
              v55 = v31;
              __int16 v56 = 2114;
              id v57 = v25;
              __int16 v58 = 2114;
              v59 = v29;
              _os_log_impl(&dword_1A2D01000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to %{public}@ to process completed response with status code %{public}@ for %{public}@.", buf, 0x2Au);
            }

            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_13;
            v39[3] = &unk_1E5ACCBB0;
            v39[4] = self;
            id v40 = v27;
            id v41 = v29;
            id v42 = v28;
            id v32 = v29;
            [v31 processCompletedResponse:v26 toRequest:v32 withCompletionHandler:v39];

            goto LABEL_24;
          }
        }
        v38.receiver = self;
        v38.super_class = (Class)ICMusicKitURLResponseHandler;
        [(ICURLResponseHandler *)&v38 processCompletedResponse:v26 toRequest:v27 withCompletionHandler:v28];
LABEL_24:
        id v19 = v35;

        id v18 = v36;
        uint64_t v17 = v37;
LABEL_25:

        goto LABEL_26;
      }
    }
    v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v53 = self;
      __int16 v54 = 2114;
      v55 = v17;
      _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating developer token upon processing completed response with status code %{public}@.", buf, 0x16u);
    }

    [(ICMusicKitURLResponseHandler *)self _invalidateDeveloperTokenForInitialResponse:v9 toRequest:v18 withCompletionHandler:v11];
    goto LABEL_25;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [v10 retryReason];
  __int16 v15 = [v10 error];
  (*((void (**)(id, uint64_t, void *, void *))v11 + 2))(v11, v13, v14, v15);

LABEL_26:
}

void __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = @"authentication-performed";
    if (v7 == @"authentication-performed")
    {
    }
    else
    {
      int v10 = [(__CFString *)v7 isEqual:@"authentication-performed"];

      if (!v10) {
        goto LABEL_7;
      }
    }
    unint64_t v11 = [*(id *)(a1 + 32) _retryCountForReason:@"authentication-performed"];
    if (v11 < [*(id *)(a1 + 32) _maxRetryCountForReason:@"authentication-performed"])
    {
LABEL_21:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_22;
    }
  }
LABEL_7:
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(a1 + 48);
      int v26 = 138543618;
      uint64_t v27 = v13;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating developer token upon processing completed response with status code %{public}@, after considering generic response handler.", (uint8_t *)&v26, 0x16u);
    }

    [*(id *)(a1 + 40) _invalidateDeveloperTokenForInitialResponse:*(void *)(a1 + 56) toRequest:*(void *)(a1 + 64) withCompletionHandler:*(void *)(a1 + 72)];
    goto LABEL_22;
  }
  if (!*(unsigned char *)(a1 + 81))
  {
    id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    id v19 = v18;
    if (v8)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        BOOL v21 = *(void **)(a1 + 56);
        BOOL v22 = [v21 urlResponse];
        v23 = [*(id *)(a1 + 56) parsedBodyDictionary];
        int v26 = 138544386;
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        v29 = v21;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        v33 = v22;
        __int16 v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Completed processing response %{public}@ with error %{public}@.\nHTTP response=%{public}@\nbody=%{public}@", (uint8_t *)&v26, 0x34u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = *(void **)(a1 + 56);
      int v26 = 138543618;
      uint64_t v27 = v24;
      __int16 v28 = 2114;
      v29 = v25;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed processing response %{public}@.", (uint8_t *)&v26, 0x16u);
    }

    goto LABEL_21;
  }
  __int16 v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void **)(a1 + 48);
    int v26 = 138543618;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating user token upon processing completed response with status code %{public}@, after considering generic response handler.", (uint8_t *)&v26, 0x16u);
  }

  [*(id *)(a1 + 40) _invalidateUserTokenForInitialResponse:*(void *)(a1 + 56) toRequest:*(void *)(a1 + 64) withCompletionHandler:*(void *)(a1 + 72)];
LABEL_22:
}

void __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_13(void *a1, uint64_t a2, void *a3, void *a4)
{
  v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  id v9 = a4;
  id v10 = a3;
  [v6 _updateRequest:v7 forProcessedResponseOfStoreURLRequest:v8];
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ICMusicKitURLResponseHandler.m", 35, @"%@ only knows how to process responses for MusicKit requests. %@ is unsupported.", self, v10 object file lineNumber description];
  }
  id v12 = v10;
  uint64_t v13 = [v12 requestContext];
  if ([v13 personalizationMethod]) {
    goto LABEL_10;
  }
  uint64_t v14 = [v12 _pendingEquivalentStoreURLRequest];
  __int16 v15 = [v14 responseHandler];
  uint64_t v16 = v15;
  if (!v14 || !v15)
  {

LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)ICMusicKitURLResponseHandler;
    [(ICURLResponseHandler *)&v21 processInitialResponse:v9 toRequest:v12 withCompletionHandler:v11];
    goto LABEL_11;
  }
  uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = ICURLResponseStatusCodeGetExtendedDescription([v9 statusCode]);
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    v29 = v16;
    __int16 v30 = 2114;
    id v31 = v18;
    __int16 v32 = 2114;
    v33 = v14;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to %{public}@ to process initial response with status code %{public}@ for %{public}@.", buf, 0x2Au);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__ICMusicKitURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E5AC9DA8;
  v22[4] = self;
  id v23 = v12;
  id v24 = v14;
  id v25 = v11;
  id v19 = v14;
  [v16 processInitialResponse:v9 toRequest:v19 withCompletionHandler:v22];

LABEL_11:
}

void __87__ICMusicKitURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  id v10 = a5;
  id v11 = a4;
  [v7 _updateRequest:v8 forProcessedResponseOfStoreURLRequest:v9];
  (*(void (**)(void))(a1[7] + 16))();
}

@end