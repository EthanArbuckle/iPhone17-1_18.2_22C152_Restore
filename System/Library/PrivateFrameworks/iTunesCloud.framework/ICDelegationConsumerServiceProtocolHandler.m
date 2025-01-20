@interface ICDelegationConsumerServiceProtocolHandler
- (ICDelegationConsumerServiceProtocolHandler)init;
- (void)getResponseForFinishDelegationRequest:(id)a3 withSessionIDToRequestInfoMap:(id)a4 completionHandler:(id)a5;
- (void)getResponseForStartDelegationRequest:(id)a3 requestContext:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICDelegationConsumerServiceProtocolHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)getResponseForStartDelegationRequest:(id)a3 requestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [ICAsyncBlockOperation alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke;
  v19 = &unk_1E5ACC088;
  id v20 = v9;
  id v21 = v8;
  v22 = self;
  id v23 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  v15 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v16];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19);
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) deviceInfo];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2;
  v31[3] = &unk_1E5AC7A10;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v32 = v5;
  uint64_t v33 = v6;
  id v7 = v4;
  id v34 = v7;
  id v35 = *(id *)(a1 + 32);
  id v37 = *(id *)(a1 + 56);
  id v8 = v3;
  id v36 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v31);
  id v29 = 0;
  id v30 = 0;
  BOOL v10 = +[ICADIUtilities generateMachineDataForAccountID:-1 returningMachineIDData:&v30 otpData:0 error:&v29];
  id v11 = v30;
  id v12 = v29;
  id v13 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v15;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Had existing anisette data.", buf, 0xCu);
    }

    ((void (**)(void, uint64_t, id))v9)[2](v9, 1, v11);
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v16;
      __int16 v40 = 2114;
      id v41 = v12;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing anisette data (error: %{public}@), starting provisioning...", buf, 0x16u);
    }

    uint64_t v17 = [ICStoreRequestContext alloc];
    v18 = +[ICUserIdentity nullIdentity];
    v19 = +[ICUserIdentityStore defaultIdentityStore];
    id v20 = [*(id *)(a1 + 32) clientInfo];
    id v21 = [(ICStoreRequestContext *)v17 initWithIdentity:v18 identityStore:v19 clientInfo:v20];

    v22 = +[ICURLBagProvider sharedBagProvider];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_25;
    v24[3] = &unk_1E5ACCC08;
    id v25 = v7;
    v26 = v21;
    uint64_t v27 = *(void *)(a1 + 48);
    v28 = v9;
    id v23 = v21;
    [v22 getBagForRequestContext:v23 withCompletionHandler:v24];
  }
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v62 = 0;
  id v61 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v62, &v61);
  id v8 = v61;
  id v9 = 0;
  id v10 = 0;
  if (ContextIdentifierForFolderPath)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = *(void **)(a1 + 32);
    v43 = v8;
    id v44 = v6;
    uint64_t v45 = a1;
    id v41 = a3;
    int v42 = a2;
    if (v11) {
      id v11 = (void *)v11[1];
    }
    id v12 = v11;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v48 = *(void *)v58;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v58 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * v16);
          if (v17) {
            v18 = (void *)v17[3];
          }
          else {
            v18 = 0;
          }
          id v19 = v18;
          id v20 = objc_msgSend(v19, "copy", v41);

          if (v17)
          {
            unint64_t v21 = v17[2];
            uint64_t v22 = v17[1];
          }
          else
          {
            unint64_t v21 = 0;
            uint64_t v22 = 0;
          }
          id v23 = [NSNumber numberWithUnsignedLongLong:v21];
          v24 = objc_alloc_init(ICPBDGSPlayerInfoContextToken);
          id v25 = v24;
          if (v24)
          {
            *(unsigned char *)&v24->_has |= 1u;
            v24->_sessionID = v21;
          }
          uint64_t v56 = 0;
          if ([v20 length])
          {
            id v26 = v13;
            uint64_t v55 = 0;
            unsigned int v54 = 0;
            id v27 = v20;
            [v27 bytes];
            [v27 length];
            woqRTqq9PL5McfBs891();
            if (v28)
            {
              id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v28 userInfo:0];
              p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                uint64_t v64 = v31;
                __int16 v65 = 2114;
                v66 = v29;
                _os_log_impl(&dword_1A2D01000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to create PIC with error: %{public}@.", buf, 0x16u);
              }
LABEL_21:
            }
            else
            {
              objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v55, v54);
              id v32 = (NSData *)objc_claimAutoreleasedReturnValue();
              id v29 = v32;
              if (v25)
              {
                id v29 = v32;
                p_super = &v25->_token->super;
                v25->_token = v29;
                goto LABEL_21;
              }
            }

            uint64_t v33 = [[ICDelegationConsumerServiceSessionRequestInfo alloc] initWithAccountID:v22 fairPlaySessionID:v56];
            [v47 setObject:v33 forKey:v23];

            id v13 = v26;
          }
          [v13 addObject:v25];

          ++v16;
        }
        while (v15 != v16);
        uint64_t v34 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
        uint64_t v15 = v34;
      }
      while (v34);
    }

    id v35 = objc_alloc_init(ICPBDGSStartDelegationResponse);
    id v36 = [*(id *)(a1 + 48) deviceFairPlayGUIDData];
    if (v35) {
      objc_storeStrong((id *)&v35->_playerDeviceGUID, v36);
    }

    playerInfoContextTokens = [*(id *)(a1 + 56) userAgent];
    id v8 = v43;
    id v6 = v44;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_playerUserAgent, playerInfoContextTokens);

      if (v42) {
        objc_storeStrong((id *)&v35->_playerAnisetteMID, v41);
      }
      v38 = (NSMutableArray *)v13;
      playerInfoContextTokens = v35->_playerInfoContextTokens;
      v35->_playerInfoContextTokens = v38;
    }

    uint64_t v39 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_18;
    block[3] = &unk_1E5ACD2A0;
    id v53 = *(id *)(a1 + 72);
    id v9 = v35;
    v50 = v9;
    id v10 = v47;
    id v51 = v10;
    id v40 = v43;
    id v52 = v40;
    dispatch_async(v39, block);
    [*(id *)(v45 + 64) finishWithError:v40];
  }
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = [a2 urlForBagKey:@"subDownload"];
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v3];
    [v4 setHTTPMethod:@"POST"];
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", @"lease-start", @"action", 0);
    id v6 = [*(id *)(a1 + 32) deviceGUID];
    if (v6) {
      [v5 setObject:v6 forKey:@"guid"];
    }
    id v15 = 0;
    id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v15];
    id v8 = v15;
    id v9 = v8;
    if (!v7 || v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [v4 setHTTPBody:v7];
      [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      id v10 = [[ICStoreURLRequest alloc] initWithURLRequest:v4 requestContext:*(void *)(a1 + 40)];
      [(ICURLRequest *)v10 setPrioritize:1];
      [(ICStoreURLRequest *)v10 setShouldParseBodyData:0];
      id v11 = +[ICURLSessionManager defaultSession];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2_42;
      v13[3] = &unk_1E5ACD400;
      id v12 = *(void **)(a1 + 56);
      v13[4] = *(void *)(a1 + 48);
      id v14 = v12;
      [v11 enqueueDataRequest:v10 withCompletionHandler:v13];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_2_42(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v10 = 0;
  BOOL v2 = +[ICADIUtilities generateMachineDataForAccountID:-1 returningMachineIDData:&v10 otpData:0 error:&v9];
  id v3 = v10;
  id v4 = v9;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Provisioned anisette data.", buf, 0xCu);
    }
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing anisette data (error: %{public}@.", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __120__ICDelegationConsumerServiceProtocolHandler_getResponseForStartDelegationRequest_requestContext_withCompletionHandler___block_invoke_18(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)getResponseForFinishDelegationRequest:(id)a3 withSessionIDToRequestInfoMap:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [ICAsyncBlockOperation alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke;
  id v19 = &unk_1E5ACC088;
  id v20 = v8;
  id v21 = v9;
  uint64_t v22 = self;
  id v23 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v16];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19);
}

void __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v37 = a1;
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[1];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v36 = *(void *)v45;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v44 + 1) + 8 * v6);
        if (v7) {
          uint64_t v8 = *(void *)(v7 + 16);
        }
        else {
          uint64_t v8 = 0;
        }
        id v9 = [NSNumber numberWithUnsignedLongLong:v8];
        id v10 = [*(id *)(v37 + 40) objectForKey:v9];
        if (v10)
        {
          uint64_t v43 = 0;
          unsigned int v42 = 0;
          if (v7) {
            id v11 = *(void **)(v7 + 32);
          }
          else {
            id v11 = 0;
          }
          id v12 = v11;
          id v13 = (void *)[v12 copy];

          uint64_t v14 = [v10 fairPlaySessionID];
          id v15 = v13;
          nXJ7Amk1zyK93(v14, [v15 bytes], objc_msgSend(v15, "length"), (uint64_t)&v43, (uint64_t)&v42);
          if (v16)
          {
            uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v16 userInfo:0];
            v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = *(void *)(v37 + 48);
              *(_DWORD *)buf = 138543618;
              uint64_t v49 = v19;
              __int16 v50 = 2114;
              id v51 = v17;
              _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to extract PDInfo with error: %{public}@.", buf, 0x16u);
            }
            id v20 = 0;
            id v21 = 0;
            goto LABEL_23;
          }
          id v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v43, v42);
          if (v20)
          {
            if (v7) {
              double v22 = *(double *)(v7 + 8);
            }
            else {
              double v22 = 0.0;
            }
            if (v22 < 600.0) {
              double v22 = 600.0;
            }
            v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v22];
            id v21 = [[ICDelegateToken alloc] initWithType:1 data:v20 expirationDate:v18];
            uint64_t v17 = 0;
LABEL_23:
          }
          else
          {
            uint64_t v17 = 0;
            id v21 = 0;
          }
          id v23 = [ICDelegationConsumerServiceSessionRequestResult alloc];
          if (v7) {
            v24 = *(void **)(v7 + 24);
          }
          else {
            v24 = 0;
          }
          id v25 = v24;
          id v26 = [(ICDelegationConsumerServiceSessionRequestResult *)v23 initWithDelegateToken:v21 storefrontIdentifier:v25 resultError:v17];

          [v35 setObject:v26 forKey:v9];
        }

        ++v6;
      }
      while (v5 != v6);
      uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      uint64_t v5 = v27;
    }
    while (v27);
  }
  int v28 = objc_alloc_init(ICPBDGSFinishDelegationResponse);
  id v29 = *(NSObject **)(*(void *)(v37 + 48) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke_11;
  block[3] = &unk_1E5ACD250;
  id v30 = *(id *)(v37 + 56);
  uint64_t v39 = v28;
  id v40 = v35;
  id v41 = v30;
  id v31 = v35;
  id v32 = v28;
  dispatch_async(v29, block);
  [v33 finishWithError:0];
}

uint64_t __132__ICDelegationConsumerServiceProtocolHandler_getResponseForFinishDelegationRequest_withSessionIDToRequestInfoMap_completionHandler___block_invoke_11(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (ICDelegationConsumerServiceProtocolHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICDelegationConsumerServiceProtocolHandler;
  BOOL v2 = [(ICDelegationConsumerServiceProtocolHandler *)&v8 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.iTunesCloud.ICDelegationConsumerServiceProtocolHandler.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:3];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceProtocolHandler.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end