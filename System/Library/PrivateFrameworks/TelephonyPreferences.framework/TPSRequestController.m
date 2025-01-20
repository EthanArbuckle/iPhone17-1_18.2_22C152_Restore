@interface TPSRequestController
- (CoreTelephonyClient)telephonyClient;
- (NSMapTable)delegateToQueue;
- (NSMutableOrderedSet)requests;
- (OS_dispatch_queue)serialDispatchQueue;
- (TPSRequest)pendingRequest;
- (TPSRequestController)init;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addRequest:(id)a3;
- (void)execute;
- (void)executeRequest:(id)a3;
- (void)postResponse:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setPendingRequest:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation TPSRequestController

- (TPSRequestController)init
{
  v18.receiver = self;
  v18.super_class = (Class)TPSRequestController;
  v2 = [(TPSRequestController *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v2->_delegateToQueue;
    v2->_delegateToQueue = (NSMapTable *)v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    requests = v2->_requests;
    v2->_requests = v5;

    v7 = NSString;
    v8 = objc_msgSend((id)objc_opt_class(), "tps_classIdentifier");
    v9 = NSStringFromSelector(sel_serialDispatchQueue);
    v10 = [v7 stringWithFormat:@"%@.%@", v8, v9];

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v12 = v10;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    serialDispatchQueue = v2->_serialDispatchQueue;
    v2->_serialDispatchQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_serialDispatchQueue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v15;

    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
  }
  return v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TPSRequestController *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TPSRequestController_addDelegate_queue___block_invoke;
  block[3] = &unk_1E6EB2180;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __42__TPSRequestController_addDelegate_queue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F14428];
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self serialDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__TPSRequestController_removeDelegate___block_invoke;
  v7[3] = &unk_1E6EB22C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__TPSRequestController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)addRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self serialDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TPSRequestController_addRequest___block_invoke;
  v7[3] = &unk_1E6EB22C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__TPSRequestController_addRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) requests];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 execute];
}

- (void)execute
{
  uint64_t v3 = [(TPSRequestController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TPSRequestController *)self pendingRequest];
  if (!v4)
  {
    v5 = [(TPSRequestController *)self requests];
    id v7 = [v5 firstObject];

    id v4 = v7;
    if (v7)
    {
      [(TPSRequestController *)self setPendingRequest:v7];
      id v6 = [(TPSRequestController *)self requests];
      [v6 removeObject:v7];

      [(TPSRequestController *)self executeRequest:v7];
      id v4 = v7;
    }
  }
}

- (void)executeRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSRequestController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [TPSResponse alloc];
  id v7 = [v4 subscriptionContext];

  id v8 = [(TPSResponse *)v6 initWithSubscriptionContext:v7 error:0];
  [(TPSRequestController *)self postResponse:v8];
}

- (void)postResponse:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TPSRequestController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(TPSRequestController *)self delegateToQueue];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        v11 = [(TPSRequestController *)self delegateToQueue];
        id v12 = [v11 objectForKey:v10];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__TPSRequestController_postResponse___block_invoke;
        block[3] = &unk_1E6EB2180;
        block[4] = v10;
        void block[5] = self;
        id v19 = v4;
        dispatch_async(v12, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  id v13 = [(TPSRequestController *)self pendingRequest];
  v14 = [v13 subscriptionContext];
  uint64_t v15 = [v4 subscriptionContext];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
    [(TPSRequestController *)self setPendingRequest:0];
    [(TPSRequestController *)self execute];
  }
}

uint64_t __37__TPSRequestController_postResponse___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 requestController:v4 didReceiveResponse:v5];
  }
  return result;
}

- (TPSRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (NSMutableOrderedSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end