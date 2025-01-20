@interface ICDelegationConsumerService
- (ICDelegationConsumerService)init;
- (void)performRequest:(id)a3 withResponseHandler:(id)a4;
@end

@implementation ICDelegationConsumerService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSessions, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)performRequest:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v9 = [ICDelegationConsumerServiceSession alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke;
  v20[3] = &unk_1E5AC9108;
  objc_copyWeak(&v22, (id *)buf);
  id v10 = v7;
  id v21 = v10;
  v11 = [(ICDelegationConsumerServiceSession *)v9 initWithRequest:v6 responseHandler:v20];
  accessQueue = self->_accessQueue;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_3;
  v17 = &unk_1E5ACD4C8;
  v18 = self;
  v13 = v11;
  v19 = v13;
  dispatch_barrier_async(accessQueue, &v14);
  [(ICDelegationConsumerServiceSession *)v13 start];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v19 = WeakRetained;
    if (WeakRetained)
    {
      v20 = WeakRetained[1];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_2;
      v22[3] = &unk_1E5ACD4C8;
      v23 = WeakRetained;
      id v24 = v13;
      dispatch_barrier_async(v20, v22);
    }
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    (*(void (**)(uint64_t, id, id, id, id, uint64_t))(v21 + 16))(v21, v14, v15, v16, v17, a7);
  }
}

uint64_t __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

void __66__ICDelegationConsumerService_performRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

- (ICDelegationConsumerService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDelegationConsumerService;
  uint64_t v2 = [(ICDelegationConsumerService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ICDelegationConsumerService.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end