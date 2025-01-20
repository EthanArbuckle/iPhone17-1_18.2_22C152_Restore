@interface ICMachineDataActionHandler
+ (ICMachineDataActionHandler)sharedHandler;
- (ICMachineDataActionHandler)init;
- (void)processAction:(id)a3 data:(id)a4 withRequestContext:(id)a5 version:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)processActionFromResponse:(id)a3 withRequestContext:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ICMachineDataActionHandler

+ (ICMachineDataActionHandler)sharedHandler
{
  if (sharedHandler_sOnceToken != -1) {
    dispatch_once(&sharedHandler_sOnceToken, &__block_literal_global_38088);
  }
  v2 = (void *)sharedHandler_sSharedHandler;

  return (ICMachineDataActionHandler *)v2;
}

- (void)processActionFromResponse:(id)a3 withRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(v8, "ic_valueForHTTPHeaderField:", @"X-Apple-MD-Action");
  if (v11)
  {
    v12 = (void *)v11;
    v13 = ICStoreHTTPHeaderKeyXAppleMDData;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v15 = objc_msgSend(v8, "ic_valueForHTTPHeaderField:", @"X-Apple-AMD-Action");
    if (!v15)
    {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
      goto LABEL_12;
    }
    v12 = (void *)v15;
    v13 = &ICStoreHTTPHeaderKeyXAppleAMDData;
    uint64_t v14 = 2;
  }
  v16 = objc_msgSend(v8, "ic_valueForHTTPHeaderField:", *v13);
  if (!v16) {
    goto LABEL_10;
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:0];
  if (!v17)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "failed to decode anisette response data from response %{public}@", buf, 0xCu);
    }

LABEL_10:
    v17 = [MEMORY[0x1E4F1C9B8] data];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__ICMachineDataActionHandler_processActionFromResponse_withRequestContext_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E5ACD0F8;
  id v21 = v12;
  id v22 = v10;
  id v19 = v12;
  [(ICMachineDataActionHandler *)self processAction:v19 data:v17 withRequestContext:v9 version:v14 withCompletionHandler:v20];

LABEL_12:
}

uint64_t __43__ICMachineDataActionHandler_sharedHandler__block_invoke()
{
  sharedHandler_sSharedHandler = objc_alloc_init(ICMachineDataActionHandler);

  return MEMORY[0x1F41817F8]();
}

- (ICMachineDataActionHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICMachineDataActionHandler;
  v2 = [(ICMachineDataActionHandler *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMachineDataSession.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.iTunesCloud.ICMachineDataSession.operation"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

uint64_t __97__ICMachineDataActionHandler_processActionFromResponse_withRequestContext_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2, a3);
  }
  return result;
}

- (void)processAction:(id)a3 data:(id)a4 withRequestContext:(id)a5 version:(int64_t)a6 withCompletionHandler:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v12;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "processing machine data action %{public}@", buf, 0xCu);
  }

  if ([v12 isEqualToString:@"SP"])
  {
    v17 = off_1E5AC5F78;
  }
  else if ([v12 isEqualToString:@"SM"])
  {
    v17 = off_1E5AC5F80;
  }
  else
  {
    if (([v12 isEqualToString:@"RP"] & 1) == 0)
    {
      if (v12)
      {
        v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v12;
          _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "unknown machine data action %{public}@ - ignoring", buf, 0xCu);
        }
      }
      goto LABEL_15;
    }
    v17 = off_1E5AC5F70;
  }
  id v18 = objc_alloc_init(*v17);
  if (!v18)
  {
LABEL_15:
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
    goto LABEL_16;
  }
  id v19 = v18;
  [v18 setData:v13];
  [v19 setRequestContext:v14];
  [v19 setProtocolVersion:a6];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E5ACD0B0;
  id v22 = v12;
  v23 = self;
  id v24 = v15;
  [v19 setCompletionHandler:v21];
  [(NSOperationQueue *)self->_operationQueue addOperation:v19];

LABEL_16:
}

void __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "machine data action %{public}@ completed. err=%{public}@", buf, 0x16u);
  }

  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke_16;
  block[3] = &unk_1E5ACD250;
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v9, block);
}

uint64_t __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke_16(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end