@interface ICDelegationProviderServiceProtocolHandler
- (ICDelegationProviderServiceProtocolHandler)initWithUserIdentityStore:(id)a3 requestContext:(id)a4;
- (unint64_t)_nextSessionUniqueID;
- (void)_getPlayInfoRequestWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 completionHandler:(id)a5;
- (void)getFinishDelegationRequestsWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 replyHandler:(id)a5;
- (void)getStartDelegationRequestForAccountIDs:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation ICDelegationProviderServiceProtocolHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (unint64_t)_nextSessionUniqueID
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->_nextSessionUniqueID, 1uLL) + 1;
}

- (void)_getPlayInfoRequestWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 completionHandler:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v51 = a4;
  id v8 = a5;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v63 = self;
    __int16 v64 = 2114;
    v65 = v7;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Starting - response=%{public}@", buf, 0x16u);
  }

  v46 = (void (**)(void, void, void))v8;
  v47 = (id *)v7;
  if (v7) {
    v10 = (void *)v7[3];
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v58;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v57 + 1) + 8 * v15);
        if (v16)
        {
          id v17 = *(id *)(v16 + 16);
          uint64_t v18 = *(void *)(v16 + 8);
        }
        else
        {
          id v17 = 0;
          uint64_t v18 = 0;
        }
        v19 = [NSNumber numberWithUnsignedLongLong:v18];
        v20 = [v51 objectForKey:v19];

        if (v20)
        {
          v21 = (void *)[v17 copy];
          id v55 = 0;
          id v56 = 0;
          char v22 = [v20 getStreamerInfoContextDataUsingPlayerInfoContextData:v21 returningData:&v56 error:&v55];
          id v23 = v56;
          v24 = v55;

          if (v22)
          {
            v25 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v20, "accountID"));
            v26 = [[ICDelegationPlayInfoTokenRequest alloc] initWithDSID:v25 SICData:v23];
            [v49 setObject:v26 forKey:v25];
          }
          else
          {
            v25 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v63 = self;
              __int16 v64 = 2114;
              v65 = v24;
              _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Failed [Generating streamer info context] - error=%{public}@", buf, 0x16u);
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v27 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      uint64_t v13 = v27;
    }
    while (v27);
  }

  if ([v49 count])
  {
    v28 = objc_alloc_init(ICDelegationPlayInfoRequest);
    v29 = v28;
    v31 = v46;
    v30 = v47;
    if (v47)
    {
      id v32 = v47[1];
      [v29 setPlayerAnisetteMID:v32];

      id v33 = v47[2];
    }
    else
    {
      [(ICDelegationPlayInfoRequest *)v28 setPlayerAnisetteMID:0];
      id v33 = 0;
    }
    id v34 = v33;
    v35 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", 2 * objc_msgSend(v34, "length"));
    id v36 = v34;
    v37 = (unsigned __int8 *)[v36 bytes];
    uint64_t v38 = [v36 length];
    if (v38 >= 1)
    {
      uint64_t v39 = v38;
      do
      {
        unsigned int v40 = *v37++;
        objc_msgSend(v35, "appendFormat:", @"%02X", v40);
        --v39;
      }
      while (v39);
    }

    v41 = [v35 lowercaseString];
    [v29 setPlayerDeviceGUID:v41];

    if (v47) {
      id v42 = v47[4];
    }
    else {
      id v42 = 0;
    }
    id v43 = v42;
    [v29 setPlayerUserAgent:v43];

    identityStore = self->_identityStore;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke;
    v54[3] = &unk_1E5ACC0D8;
    v54[4] = v49;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke_2;
    v52[3] = &unk_1E5ACD2A0;
    v52[4] = v29;
    v52[5] = v49;
    v52[6] = self;
    v53 = v46;
    [(ICUserIdentityStore *)identityStore enumerateDelegateTokensWithType:1 usingBlock:v54 completionHandler:v52];
  }
  else
  {
    v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7503 userInfo:0];
    v45 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    v31 = v46;
    v30 = v47;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v63 = self;
      __int16 v64 = 2114;
      v65 = v29;
      _os_log_impl(&dword_1A2D01000, v45, OS_LOG_TYPE_ERROR, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Failed [no tokens] - error=%{public}@", buf, 0x16u);
    }

    ((void (**)(void, void, void *))v46)[2](v46, 0, v29);
  }
}

void __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  v5 = [a3 DSID];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) objectForKey:v5];
    v7 = [v8 data];
    [v6 setCloudCredentialsTokenData:v7];
  }
}

uint64_t __126__ICDelegationProviderServiceProtocolHandler__getPlayInfoRequestWithStartDelegationResponse_streamContexts_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) allValues];
  [v2 setTokenRequests:v3];

  v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: _getPlayInfoRequestWithStartDelegationResponse - Finished [Request ready] - tokens=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)getStartDelegationRequestForAccountIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACC0B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [(NSOperationQueue *)self->_operationQueue addOperation:v11];
}

void __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unsigned int v63 = 0;
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a1[4];
    uint64_t v5 = (ICPBDGSPlayerInfoContextRequestToken *)a1[5];
    *(_DWORD *)buf = 138543618;
    id v65 = v4;
    __int16 v66 = 2112;
    v67 = v5;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Starting - accountIDs=%@", buf, 0x16u);
  }

  id v62 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v63, &v62);
  id v7 = v62;
  int v8 = v7;
  if (ContextIdentifierForFolderPath)
  {
    id v46 = v7;
    id v47 = v2;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = a1[5];
    uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      id v51 = 0;
      uint64_t v12 = *(void *)v59;
      do
      {
        uint64_t v13 = 0;
        uint64_t v48 = v10;
        do
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(ICPBDGSPlayerInfoContextRequestToken **)(*((void *)&v58 + 1) + 8 * v13);
          uint64_t v15 = [(ICPBDGSPlayerInfoContextRequestToken *)v14 unsignedLongLongValue];
          if (v15)
          {
            unint64_t v16 = v15;
            id v17 = +[ICFPContentInfo whaContentInfoWithAccountID:v15];
            uint64_t v18 = [ICFPStreamContext alloc];
            id v57 = 0;
            v19 = [(ICFPStreamContext *)v18 initWithVersion:3 contextID:v63 contentInfo:v17 returningError:&v57];
            id v20 = v57;
            if (v19)
            {
              v21 = objc_alloc_init(ICPBDGSPlayerInfoContextRequestToken);
              char v22 = [(ICFPStreamContext *)v19 playerInfoContextRequestData];
              id v23 = v22;
              if (v21)
              {
                objc_storeStrong((id *)&v21->_token, v22);

                *(unsigned char *)&v21->_has |= 1u;
                v21->_accountID = v16;
                uint64_t v24 = [a1[4] _nextSessionUniqueID];
                *(unsigned char *)&v21->_has |= 2u;
                v21->_sessionID = v24;
              }
              else
              {

                uint64_t v24 = [a1[4] _nextSessionUniqueID];
              }
              v25 = v51;
              if (!v51) {
                v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              id v51 = v25;
              [(NSMutableArray *)v25 addObject:v21];
              if (!v11) {
                id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              v26 = [NSNumber numberWithUnsignedLongLong:v24];
              [v11 setObject:v19 forKey:v26];

              uint64_t v27 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              uint64_t v10 = v48;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                id v28 = a1[4];
                *(_DWORD *)buf = 138543618;
                id v65 = v28;
                __int16 v66 = 2112;
                v67 = v21;
                _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Built request token: %@", buf, 0x16u);
              }
            }
            else
            {
              v21 = (ICPBDGSPlayerInfoContextRequestToken *)os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_ERROR))
              {
                id v29 = a1[4];
                *(_DWORD *)buf = 138543874;
                id v65 = v29;
                __int16 v66 = 2112;
                v67 = v14;
                __int16 v68 = 2114;
                id v69 = v20;
                _os_log_impl(&dword_1A2D01000, &v21->super.super, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Failed to generate stream context - accountID=%@ - error=%{public}@", buf, 0x20u);
              }
            }
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
        uint64_t v10 = v30;
      }
      while (v30);
    }
    else
    {
      id v11 = 0;
      id v51 = 0;
    }

    if ([(NSMutableArray *)v51 count])
    {
      id v32 = 0;
      int v8 = v46;
      id v2 = v47;
      goto LABEL_38;
    }
    int v8 = v46;
    id v2 = v47;
LABEL_44:
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ICError", -7101, 0, v46, v47);
    id v32 = (ICPBDGSPlayerInfoContextRequestToken *)objc_claimAutoreleasedReturnValue();
    p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      id v40 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v65 = v40;
      __int16 v66 = 2114;
      v67 = v32;
      _os_log_impl(&dword_1A2D01000, p_super, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Unknown issue [request building failed] - error=%{public}@", buf, 0x16u);
    }
    v37 = 0;
    goto LABEL_47;
  }
  if (v7)
  {
    v31 = (ICPBDGSPlayerInfoContextRequestToken *)v7;
  }
  else
  {
    v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
  }
  id v32 = v31;
  id v33 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v34 = a1[4];
    *(_DWORD *)buf = 138543618;
    id v65 = v34;
    __int16 v66 = 2114;
    v67 = v32;
    _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_ERROR, "%{public}@: getStartDelegationRequestForAccountIDs - Fairplay issue [get context failed] - error=%{public}@", buf, 0x16u);
  }

  id v11 = 0;
  if (![0 count])
  {
    id v51 = 0;
    v37 = 0;
    if (v32) {
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  id v51 = 0;
LABEL_38:
  v35 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v65 = v36;
    _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: getStartDelegationRequestForAccountIDs - Request tokens ready", buf, 0xCu);
  }

  v37 = objc_alloc_init(ICPBDGSStartDelegationRequest);
  if (v37)
  {
    uint64_t v38 = v51;
    p_super = &v37->_playerInfoContextRequestTokens->super.super;
    id v51 = v38;
    v37->_playerInfoContextRequestTokens = v38;
LABEL_47:
  }
LABEL_48:
  v41 = *((void *)a1[4] + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke_23;
  block[3] = &unk_1E5ACD2A0;
  id v42 = a1[6];
  v53 = v37;
  id v54 = v11;
  id v55 = v32;
  id v56 = v42;
  id v43 = v32;
  id v44 = v11;
  v45 = v37;
  dispatch_async(v41, block);
  [v2 finishWithError:v43];
}

uint64_t __107__ICDelegationProviderServiceProtocolHandler_getStartDelegationRequestForAccountIDs_withCompletionHandler___block_invoke_23(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)getFinishDelegationRequestsWithStartDelegationResponse:(id)a3 streamContexts:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [ICAsyncBlockOperation alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke;
  v19 = &unk_1E5ACC088;
  id v20 = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v16];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15, v16, v17, v18, v19, v20);
}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Starting - startResponse=%@", buf, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3;
  v11[3] = &unk_1E5ACC060;
  v11[4] = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v12 = v3;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v10 = v3;
  [v7 _getPlayInfoRequestWithStartDelegationResponse:v8 streamContexts:v9 completionHandler:v11];
}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(ICDelegationPlayInfoRequestOperation);
    [(ICDelegationPlayInfoRequestOperation *)v7 setPlayInfoRequest:v5];
    uint64_t v8 = [ICStoreRequestContext alloc];
    uint64_t v9 = +[ICUserIdentity activeAccount];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 16);
    id v12 = [*(id *)(v10 + 40) clientInfo];
    id v13 = [(ICStoreRequestContext *)v8 initWithIdentity:v9 identityStore:v11 clientInfo:v12];

    [(ICDelegationPlayInfoRequestOperation *)v7 setStoreRequestContext:v13];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3;
    v16[3] = &unk_1E5ACC038;
    v16[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    [(ICDelegationPlayInfoRequestOperation *)v7 setResponseHandler:v16];
    [(ICDelegationPlayInfoRequestOperation *)v7 execute];
  }
  else
  {
    id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_2;
    block[3] = &unk_1E5ACD2F0;
    id v23 = (ICDelegationPlayInfoRequestOperation *)*(id *)(a1 + 64);
    id v15 = v6;
    id v22 = v15;
    dispatch_async(v14, block);
    [*(id *)(a1 + 40) finishWithError:v15];

    id v7 = v23;
  }
}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 1);
}

void __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  uint64_t v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 48);
      if (v10) {
        uint64_t v10 = (void *)v10[3];
      }
      uint64_t v11 = v10;
      uint64_t v12 = [v11 count];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v73 = v9;
      __int16 v74 = 2048;
      uint64_t v75 = v12;
      __int16 v76 = 2112;
      uint64_t v77 = v13;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse [%lu tokens] - Received Response - response=%@", buf, 0x20u);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = *(void **)(a1 + 48);
    id v53 = v6;
    id v54 = v14;
    if (v15) {
      id v15 = (void *)v15[3];
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    uint64_t v17 = a1;
    if (v16)
    {
      uint64_t v18 = v16;
      unint64_t v19 = 0x1E4F28000uLL;
      uint64_t v59 = *(void *)v65;
      do
      {
        uint64_t v20 = 0;
        uint64_t v55 = v18;
        do
        {
          if (*(void *)v65 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v64 + 1) + 8 * v20);
          if (v21) {
            id v22 = *(objc_class **)(v21 + 8);
          }
          else {
            id v22 = 0;
          }
          id v23 = *(void **)(v17 + 56);
          uint64_t v24 = objc_msgSend(*(id *)(v19 + 3792), "numberWithUnsignedLongLong:", v22, v53);
          v25 = [v23 objectForKey:v24];

          if (v25)
          {
            v26 = objc_msgSend(objc_alloc(*(Class *)(v19 + 3792)), "initWithUnsignedLongLong:", objc_msgSend(v25, "accountID"));
            uint64_t v27 = [v58 objectForKey:v26];
            id v28 = v27;
            if (v27)
            {
              id v29 = [v27 tokenData];
              id v62 = 0;
              id v63 = 0;
              char v30 = [v25 getPlayerDelegateInfoDataUsingPlayerDelegateInfoResponseData:v29 returningData:&v63 error:&v62];
              id v31 = v63;
              id v32 = v63;
              id v33 = v62;

              if (v30)
              {
                id v34 = objc_alloc_init(ICPBDGSPlayerDelegateInfoToken);
                os_log_t p_super = &v34->super.super;
                if (v34)
                {
                  objc_storeStrong((id *)&v34->_token, v31);
                  LOBYTE(p_super[5].isa) |= 2u;
                  p_super[2].isa = v22;
                }
                id v36 = [v28 storefrontIdentifier];
                if (v36 && p_super) {
                  objc_storeStrong((id *)&p_super[3].isa, v36);
                }
                v37 = [v28 expirationDate];
                uint64_t v38 = v37;
                double v39 = 604800.0;
                if (v37)
                {
                  objc_msgSend(v37, "timeIntervalSinceNow", 604800.0);
                  if (v39 < 0.0) {
                    double v39 = 0.0;
                  }
                }
                if (p_super)
                {
                  LOBYTE(p_super[5].isa) |= 1u;
                  *(double *)&p_super[1].isa = v39;
                }
                objc_msgSend(v54, "addObject:", p_super, v39);
                id v40 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v41 = *(void *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v73 = v41;
                  __int16 v74 = 2114;
                  uint64_t v75 = (uint64_t)p_super;
                  _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Generated player delegate info - delegateInfoToken=%{public}@", buf, 0x16u);
                }

LABEL_35:
                uint64_t v17 = a1;
              }
              else
              {
                os_log_t p_super = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                uint64_t v17 = a1;
                uint64_t v43 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                uint64_t v73 = v43;
                __int16 v74 = 2114;
                uint64_t v75 = (uint64_t)v33;
                _os_log_impl(&dword_1A2D01000, p_super, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Generating player delegate info data failed - error=%{public}@", buf, 0x16u);
              }

              unint64_t v19 = 0x1E4F28000;
              uint64_t v18 = v55;
            }
            else
            {
              id v32 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                uint64_t v42 = *(void *)(v17 + 32);
                *(_DWORD *)buf = 138543618;
                uint64_t v73 = v42;
                __int16 v74 = 2112;
                uint64_t v75 = (uint64_t)v26;
                _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Missing token data for account: %@", buf, 0x16u);
              }
            }
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v44 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
        uint64_t v18 = v44;
      }
      while (v44);
    }
    v45 = objc_alloc_init(ICPBDGSFinishDelegationRequest);
    id v46 = v45;
    id v47 = v54;
    if (v45) {
      objc_storeStrong((id *)&v45->_playerDelegateInfoTokens, v54);
    }
    uint64_t v48 = *(NSObject **)(*(void *)(v17 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_13;
    block[3] = &unk_1E5ACD2F0;
    id v49 = *(id *)(v17 + 64);
    void block[4] = v46;
    id v61 = v49;
    dispatch_async(v48, block);
    [*(id *)(v17 + 40) finishWithError:0];

    id v6 = v53;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v73 = v50;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: getFinishDelegationRequestsWithStartDelegationResponse - Failed [no response] - error=%@", buf, 0x16u);
    }

    id v51 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_8;
    v68[3] = &unk_1E5ACD2F0;
    id v70 = *(id *)(a1 + 64);
    id v52 = v6;
    id v69 = v52;
    dispatch_async(v51, v68);
    [*(id *)(a1 + 40) finishWithError:v52];

    id v47 = v70;
  }
}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 1);
}

uint64_t __129__ICDelegationProviderServiceProtocolHandler_getFinishDelegationRequestsWithStartDelegationResponse_streamContexts_replyHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1);
}

- (ICDelegationProviderServiceProtocolHandler)initWithUserIdentityStore:(id)a3 requestContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDelegationProviderServiceProtocolHandler;
  uint64_t v9 = [(ICDelegationProviderServiceProtocolHandler *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityStore, a3);
    objc_storeStrong((id *)&v10->_requestContext, a4);
    uint64_t v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    [(NSOperationQueue *)v10->_operationQueue setName:@"com.apple.iTunesCloud.ICDelegationProviderServiceProtocolHandler.operationQueue"];
    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:3];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceProtocolHandler.calloutQueue", 0);
    calloutQueue = v10->_calloutQueue;
    v10->_calloutQueue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

@end