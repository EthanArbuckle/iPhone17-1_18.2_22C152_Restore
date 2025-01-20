@interface ICContentKeyNonceRequest
- (ICContentKeyNonceRequest)initWithStoreRequestContext:(id)a3 adamID:(id)a4 accountDSID:(id)a5 keyServerURL:(id)a6;
- (void)execute;
- (void)performWithResponseHandler:(id)a3;
@end

@implementation ICContentKeyNonceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)execute
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    adamID = self->_adamID;
    if (!adamID) {
      adamID = (NSNumber *)&unk_1EF640978;
    }
    v27[0] = adamID;
    v26[0] = @"adamID";
    v26[1] = @"DSID";
    v5 = ICCreateLoggableValueForDSID(self->_accountDSID);
    v27[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    *(_DWORD *)buf = 138543618;
    v29 = self;
    __int16 v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Executing nonce request with params: %{public}@", buf, 0x16u);
  }
  v7 = self->_adamID;
  if (!v7) {
    v7 = (NSNumber *)&unk_1EF640978;
  }
  v24[0] = @"adam-id";
  v24[1] = @"id";
  v25[0] = v7;
  v25[1] = &unk_1EF640990;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v22[1] = @"nonce-requests";
  v23[0] = &unk_1EF640990;
  v21 = v8;
  v22[0] = @"version";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v23[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v20 = 0;
  v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v20];
  id v12 = v20;
  v13 = v12;
  if (!v11 || v12)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: [SKD] - Failed to serialize key server request data with error: %{public}@", buf, 0x16u);
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7101, v13, @"Failed to serialize key server request data");
    [(ICRequestOperation *)self finishWithError:v14];
  }
  else
  {
    v14 = [MEMORY[0x1E4F18D50] requestWithURL:self->_keyServerURL];
    [v14 setHTTPMethod:@"POST"];
    [v14 setHTTPBody:v11];
    v15 = [(NSNumber *)self->_accountDSID stringValue];
    [v14 setValue:v15 forHTTPHeaderField:@"X-Secure-Invalidation-Dsid"];

    [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v16 = [[ICStoreURLRequest alloc] initWithURLRequest:v14 requestContext:self->_storeRequestContext];
    [(ICURLRequest *)v16 enableLoadURLMetricsWithRequestName:@"skd/nonce"];
    v17 = +[ICURLSessionManager highPrioritySession];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__ICContentKeyNonceRequest_execute__block_invoke;
    v19[3] = &unk_1E5ACD928;
    v19[4] = self;
    [v17 enqueueDataRequest:v16 withCompletionHandler:v19];
  }
}

void __35__ICContentKeyNonceRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v36 = 138543362;
      uint64_t v37 = v11;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed Nonce request", (uint8_t *)&v36, 0xCu);
    }

    id v12 = [v5 parsedBodyDictionary];
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v36 = 138543618;
      uint64_t v37 = v14;
      __int16 v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Received response %@", (uint8_t *)&v36, 0x16u);
    }

    if (!v12)
    {
      v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        int v36 = 138543362;
        uint64_t v37 = v34;
        _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Received empty response", (uint8_t *)&v36, 0xCu);
      }

      v35 = *(void **)(a1 + 32);
      v16 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"Received empty response");
      [v35 finishWithError:v16];
      goto LABEL_24;
    }
    v15 = objc_msgSend(v12, "ic_arrayValueForKey:", @"nonce-responses");
    v16 = v15;
    if (v15 && ([v15 objectAtIndexedSubscript:0], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = (void *)v17;
      v19 = [[ICContentKeyNonceResponse alloc] initWithResponseDictionary:v17];
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(v20 + 336);
      *(void *)(v20 + 336) = v19;

      uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 336) status];
      if (v22)
      {
        uint64_t v23 = v22;
        v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          int v36 = 138543618;
          uint64_t v37 = v25;
          __int16 v38 = 2114;
          v39 = v12;
          _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Received non-zero status code response: %{public}@", (uint8_t *)&v36, 0x16u);
        }

        v26 = *(void **)(a1 + 32);
        v27 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICKeyServerError", v23, @"received non-zero status in nonce response");
        [v26 finishWithError:v27];

        goto LABEL_20;
      }
      v31 = *(void **)(a1 + 32);
      uint64_t v32 = 0;
    }
    else
    {
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        int v36 = 138543618;
        uint64_t v37 = v29;
        __int16 v38 = 2114;
        v39 = v12;
        _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Received a response with no nonce-responses: %{public}@", (uint8_t *)&v36, 0x16u);
      }

      __int16 v30 = *(void **)(a1 + 32);
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"Received a response with no nonce-responses");
      v31 = v30;
      uint64_t v32 = v18;
    }
    [v31 finishWithError:v32];
LABEL_20:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = objc_msgSend(v6, "msv_description");
    int v36 = 138543618;
    uint64_t v37 = v9;
    __int16 v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Completed Nonce request error=%{public}@", (uint8_t *)&v36, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithError:v6];
LABEL_25:
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ICContentKeyNonceRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __55__ICContentKeyNonceRequest_performWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 336), a2);
}

- (ICContentKeyNonceRequest)initWithStoreRequestContext:(id)a3 adamID:(id)a4 accountDSID:(id)a5 keyServerURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICContentKeyNonceRequest;
  v15 = [(ICRequestOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeRequestContext, a3);
    objc_storeStrong((id *)&v16->_adamID, a4);
    objc_storeStrong((id *)&v16->_accountDSID, a5);
    objc_storeStrong((id *)&v16->_keyServerURL, a6);
  }

  return v16;
}

@end