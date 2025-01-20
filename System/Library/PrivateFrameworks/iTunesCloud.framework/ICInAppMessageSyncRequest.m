@interface ICInAppMessageSyncRequest
- (ICInAppMessageSyncRequest)initWithStoreRequestContext:(id)a3 fromRevision:(unint64_t)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICInAppMessageSyncRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncResponse, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)execute
{
  v3 = [(ICStoreRequestContext *)self->_storeRequestContext identityStore];
  v4 = [(ICStoreRequestContext *)self->_storeRequestContext identity];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke;
  v5[3] = &unk_1E5ACAFF0;
  v5[4] = self;
  [v3 getPropertiesForUserIdentity:v4 completionHandler:v5];
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load account properties. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    v9 = +[ICURLBagProvider sharedBagProvider];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 304);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke_4;
    v12[3] = &unk_1E5ACAFC8;
    v12[4] = v10;
    id v13 = v5;
    [v9 getBagForRequestContext:v11 withCompletionHandler:v12];
  }
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to load bag. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    v9 = [ICInAppMessageConfiguration alloc];
    uint64_t v10 = [v5 dictionaryForBagKey:@"inAppMessages"];
    uint64_t v11 = [(ICInAppMessageConfiguration *)v9 initWithDictionary:v10];

    v12 = [(ICInAppMessageConfiguration *)v11 syncURL];
    if (v12)
    {
      id v13 = objc_alloc_init(ICIAMSynchronizeMessagesRequest);
      v14 = [*(id *)(a1 + 40) DSID];
      -[ICIAMSynchronizeMessagesRequest setDSID:](v13, "setDSID:", [v14 longLongValue]);

      [(ICIAMSynchronizeMessagesRequest *)v13 setActiveCommandsOnly:*(void *)(*(void *)(a1 + 32) + 320) != 0];
      [(ICIAMSynchronizeMessagesRequest *)v13 setCommandSerialNumber:*(void *)(*(void *)(a1 + 32) + 320)];
      uint64_t v15 = +[ICDeviceInfo currentDeviceInfo];
      __int16 v16 = [v15 deviceGUID];
      [(ICIAMSynchronizeMessagesRequest *)v13 setDeviceID:v16];

      id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 320);
        *(_DWORD *)buf = 138543875;
        uint64_t v32 = v18;
        __int16 v33 = 2048;
        id v34 = v19;
        __int16 v35 = 2113;
        v36 = v13;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending sync request with revision %lld; %{private}@",
          buf,
          0x20u);
      }

      v20 = [(ICIAMSynchronizeMessagesRequest *)v13 data];
      if (v20)
      {
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v12];
        [v21 setHTTPBody:v20];
        [v21 setHTTPMethod:@"POST"];
        [v21 setValue:@"application/x-protobuf" forHTTPHeaderField:@"Content-Type"];
        v22 = [[ICStoreURLRequest alloc] initWithURLRequest:v21 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
        v23 = +[ICURLSessionManager defaultSession];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __36__ICInAppMessageSyncRequest_execute__block_invoke_12;
        v30[3] = &unk_1E5ACD928;
        v30[4] = *(void *)(a1 + 32);
        [v23 enqueueDataRequest:v22 withCompletionHandler:v30];
      }
      else
      {
        v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v32 = v28;
          _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to serialize request object", buf, 0xCu);
        }

        v29 = *(void **)(a1 + 32);
        v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
        [v29 finishWithError:v21];
      }
    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v25;
        _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to find bag key for url endpoint", buf, 0xCu);
      }

      v26 = *(void **)(a1 + 32);
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v26 finishWithError:v13];
    }
  }
}

void __36__ICInAppMessageSyncRequest_execute__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Sync request failed. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    v9 = v6;
  }
  else
  {
    uint64_t v10 = [ICIAMSynchronizeMessagesResponse alloc];
    uint64_t v11 = [v5 bodyData];
    uint64_t v12 = [(ICIAMSynchronizeMessagesResponse *)v10 initWithData:v11];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 312);
    *(void *)(v13 + 312) = v12;

    if (*(void *)(*(void *)(a1 + 32) + 312))
    {
      v9 = 0;
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to decode response object", (uint8_t *)&v17, 0xCu);
      }

      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    }
  }
  [*(id *)(a1 + 32) finishWithError:v9];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__ICInAppMessageSyncRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __63__ICInAppMessageSyncRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 312), a2);
}

- (ICInAppMessageSyncRequest)initWithStoreRequestContext:(id)a3 fromRevision:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICInAppMessageSyncRequest;
  uint64_t v8 = [(ICRequestOperation *)&v14 init];
  v9 = v8;
  if (v8)
  {
    p_storeRequestContext = (void **)&v8->_storeRequestContext;
    objc_storeStrong((id *)&v8->_storeRequestContext, a3);
    uint64_t v11 = [v7 copyWithBlock:&__block_literal_global_30697];
    uint64_t v12 = *p_storeRequestContext;
    *p_storeRequestContext = (void *)v11;

    v9->_fromRevision = a4;
  }

  return v9;
}

void __70__ICInAppMessageSyncRequest_initWithStoreRequestContext_fromRevision___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v2 = +[ICDeviceInfo currentDeviceInfo];
  int v3 = [v2 isMac];

  if (v3)
  {
    id v4 = [[ICClientInfo alloc] initWithSystemApplicationType:0];
    [v5 setClientInfo:v4];
  }
}

@end