@interface ICLibraryAuthServiceBulkClientTokenRequest
- (ICLibraryAuthServiceBulkClientTokenRequest)initWithStoreRequestContext:(id)a3 accountDSIDs:(id)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICLibraryAuthServiceBulkClientTokenRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSIDs, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)execute
{
  v3 = +[ICURLBagProvider sharedBagProvider];
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke;
  v5[3] = &unk_1E5ACD950;
  v5[4] = self;
  [v3 getBagForRequestContext:storeRequestContext withCompletionHandler:v5];
}

void __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    v5 = [a2 urlForBagKey:@"library-auth-service-token-url"];
    v6 = *(id **)(a1 + 32);
    if (v5)
    {
      v7 = [v6[38] identityStore];
      v8 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
      id v59 = 0;
      v9 = [v7 getPropertiesForUserIdentity:v8 error:&v59];
      id v10 = v59;

      if (v10)
      {
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          v13 = [*(id *)(v12 + 304) identity];
          *(_DWORD *)buf = 138543874;
          uint64_t v64 = v12;
          __int16 v65 = 2114;
          id v66 = v13;
          __int16 v67 = 2114;
          id v68 = v10;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load properties for account %{public}@. err=%{public}@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) finishWithError:v10];
      }
      else if (v9)
      {
        v48 = v5;
        v15 = [MEMORY[0x1E4F18D50] requestWithURL:v5];
        [v15 setHTTPMethod:@"POST"];
        v46 = v15;
        [v15 setCachePolicy:1];
        v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        v17 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
        uint64_t v18 = [v17 deviceGUID];

        if (v18) {
          [v16 setObject:v18 forKey:@"guid"];
        }
        v45 = (void *)v18;
        v49 = v16;
        uint64_t v50 = a1;
        v19 = (void *)[*(id *)(*(void *)(a1 + 32) + 320) mutableCopy];
        v47 = v9;
        v20 = [v9 DSID];
        [v19 addObject:v20];

        v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
        v21 = +[ICHTTPCookieStore sharedCookieStore];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v19;
        uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v56 != v24) {
                objc_enumerationMutation(obj);
              }
              v26 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v27 = [NSString stringWithFormat:@"mz_at_ssl-%@", v26];
              v28 = [v21 getCookieWithName:v27 userIdentifier:v26];
              v29 = v28;
              if (v28)
              {
                v60[0] = @"dsid";
                v60[1] = @"sslToken";
                v61[0] = v26;
                v30 = [v28 value];
                v61[1] = v30;
                v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
                [v52 addObject:v31];
              }
              else
              {
                v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v32 = *(void *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v64 = v32;
                  __int16 v65 = 2112;
                  id v66 = v26;
                  _os_log_impl(&dword_1A2D01000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load sslToken for account DSID %@ - skipping", buf, 0x16u);
                }
              }
            }
            uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
          }
          while (v23);
        }

        [v49 setObject:v52 forKey:@"dsids"];
        id v54 = 0;
        v33 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v49 options:1 error:&v54];
        id v34 = v54;
        if (v33)
        {
          v35 = v46;
          [v46 setHTTPBody:v33];
          [v46 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
          v36 = [[ICStoreURLRequest alloc] initWithURLRequest:v46 requestContext:*(void *)(*(void *)(v50 + 32) + 304)];
          v37 = +[ICURLSessionManager defaultSession];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke_33;
          v53[3] = &unk_1E5ACD928;
          v53[4] = *(void *)(v50 + 32);
          [v37 enqueueDataRequest:v36 withCompletionHandler:v53];

          v9 = v47;
          v5 = v48;
          id v10 = 0;
          v38 = v45;
        }
        else
        {
          v43 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          id v10 = 0;
          v9 = v47;
          v38 = v45;
          v35 = v46;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = *(void *)(v50 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v64 = v44;
            __int16 v65 = 2114;
            id v66 = v34;
            _os_log_impl(&dword_1A2D01000, v43, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize request body. err=%{public}@", buf, 0x16u);
          }

          [*(id *)(v50 + 32) finishWithError:v34];
          v5 = v48;
        }
      }
      else
      {
        v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v64 = v40;
          _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_ERROR, "%{public}@ No active account - failing request", buf, 0xCu);
        }

        v41 = *(void **)(a1 + 32);
        v42 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7406, @"This request requires an active iTunes account");
        [v41 finishWithError:v42];
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v6 finishWithError:v14];
    }
  }
}

void __53__ICLibraryAuthServiceBulkClientTokenRequest_execute__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v6 = [a2 parsedBodyDictionary];
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v14 = 138543618;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Recevied token response %@", (uint8_t *)&v14, 0x16u);
      }

      v9 = [[ICLibraryAuthServiceBulkClientTokenResponse alloc] initWithResponseDictionary:v6];
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 312);
      *(void *)(v10 + 312) = v9;

      id v5 = 0;
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 138543362;
        uint64_t v15 = v13;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ failed to parse token response", (uint8_t *)&v14, 0xCu);
      }

      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    }
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__ICLibraryAuthServiceBulkClientTokenRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __80__ICLibraryAuthServiceBulkClientTokenRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 312), a2);
}

- (ICLibraryAuthServiceBulkClientTokenRequest)initWithStoreRequestContext:(id)a3 accountDSIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICLibraryAuthServiceBulkClientTokenRequest;
  v9 = [(ICRequestOperation *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeRequestContext, a3);
    uint64_t v11 = [v8 copy];
    accountDSIDs = v10->_accountDSIDs;
    v10->_accountDSIDs = (NSSet *)v11;
  }
  return v10;
}

@end