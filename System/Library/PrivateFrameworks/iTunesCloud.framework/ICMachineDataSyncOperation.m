@interface ICMachineDataSyncOperation
- (void)_finishWithSyncState:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation ICMachineDataSyncOperation

- (void)_finishWithSyncState:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ICMachineDataOperation *)self completionHandler];

  if (v7)
  {
    v8 = [(ICMachineDataOperation *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(ICAsyncOperation *)self finishWithError:v6];
}

- (void)execute
{
  v3 = [(ICMachineDataOperation *)self requestContext];
  v4 = [v3 identityStore];
  v5 = [v3 identity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__ICMachineDataSyncOperation_execute__block_invoke;
  v6[3] = &unk_1E5ACAFF0;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

void __37__ICMachineDataSyncOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__14546;
  v40 = __Block_byref_object_dispose__14547;
  id v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__14546;
  v34[4] = __Block_byref_object_dispose__14547;
  id v35 = 0;
  uint64_t v33 = 0;
  unsigned int v32 = 0;
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  if ([*(id *)(a1 + 32) protocolVersion] == 2)
  {
    uint64_t v7 = -1;
  }
  else
  {
    v8 = [v5 DSID];
    uint64_t v7 = [v8 unsignedLongLongValue];
  }
  id v9 = [*(id *)(a1 + 32) data];
  uint64_t v10 = [v9 bytes];
  v11 = [*(id *)(a1 + 32) data];
  tn46gtiuhw(v7, v10, [v11 length], (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31, (uint64_t)&v30);
  int v13 = v12;

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v13 userInfo:0];
    v15 = (void *)v37[5];
    v37[5] = v14;

    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v37[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v17;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "failed to sync machine data. err=%{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _finishWithSyncState:0 error:v37[5]];
  }
  else
  {
    v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithADIBytes:length:", v31, v30);
    v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithADIBytes:length:", v33, v32);
    v20 = +[ICURLBagProvider sharedBagProvider];
    v21 = [*(id *)(a1 + 32) requestContext];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__ICMachineDataSyncOperation_execute__block_invoke_3;
    v24[3] = &unk_1E5AC8E30;
    v24[4] = *(void *)(a1 + 32);
    v27 = &v36;
    id v22 = v18;
    id v25 = v22;
    id v23 = v19;
    id v26 = v23;
    v28 = v34;
    uint64_t v29 = v7;
    [v20 getBagForRequestContext:v21 withCompletionHandler:v24];
  }
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __37__ICMachineDataSyncOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "failed to fetch url bag for machine data sync. err=%{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _finishWithSyncState:0 error:v6];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) protocolVersion];
    id v9 = @"md-sync-machine";
    if (v8 == 2) {
      id v9 = @"amd-sync-machine";
    }
    uint64_t v10 = v9;
    v11 = [v5 urlForBagKey:v10];
    if (v11)
    {
      int v12 = [MEMORY[0x1E4F1CA60] dictionary];
      int v13 = [*(id *)(a1 + 40) base64EncodedStringWithOptions:0];
      [v12 setObject:v13 forKey:@"clientData"];

      uint64_t v14 = [*(id *)(a1 + 48) base64EncodedStringWithOptions:0];
      [v12 setObject:v14 forKey:@"machineId"];

      if ([*(id *)(a1 + 32) protocolVersion] == 1)
      {
        v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
        [v12 setObject:v15 forKey:@"dsId"];
      }
      v16 = [MEMORY[0x1E4F18D50] requestWithURL:v11];
      [v16 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      [v16 setHTTPMethod:@"POST"];
      uint64_t v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:100 options:0 error:0];
      [v16 setHTTPBody:v17];

      v18 = [ICStoreURLRequest alloc];
      v19 = [*(id *)(a1 + 32) requestContext];
      v20 = [(ICStoreURLRequest *)v18 initWithURLRequest:v16 requestContext:v19];

      [(ICURLRequest *)v20 setMaxRetryCount:0];
      [(ICURLRequest *)v20 setPrioritize:1];
      v21 = +[ICURLSessionManager unlimitedHighPrioritySession];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __37__ICMachineDataSyncOperation_execute__block_invoke_19;
      v25[3] = &unk_1E5AC8E08;
      v25[4] = *(void *)(a1 + 32);
      long long v26 = *(_OWORD *)(a1 + 56);
      [v21 enqueueDataRequest:v20 withCompletionHandler:v25];
    }
    else
    {
      id v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "failed to sync machine data because the bag is missing the request url", buf, 2u);
      }

      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      int v12 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
  }
}

void __37__ICMachineDataSyncOperation_execute__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "failed to perform machine data sync request. err=%{public}@", (uint8_t *)&v13, 0xCu);
    }

    [*(id *)(a1 + 32) _finishWithSyncState:0 error:v5];
  }
  else
  {
    uint64_t v7 = [a2 parsedBodyDictionary];
    uint64_t v8 = v7;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (!v9)
    {
      uint64_t v10 = [v7 objectForKey:@"syncState"];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      int v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    [*(id *)(a1 + 32) _finishWithSyncState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:0];
  }
}

@end