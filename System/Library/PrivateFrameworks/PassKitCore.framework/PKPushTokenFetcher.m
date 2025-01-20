@interface PKPushTokenFetcher
- (PKPushTokenFetcher)init;
- (void)_handleTimeout;
- (void)_invokeCompletionWithPushToken:(id)a3;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)fetchPushTokenWithTimeout:(double)a3 completion:(id)a4;
@end

@implementation PKPushTokenFetcher

- (PKPushTokenFetcher)init
{
  v16.receiver = self;
  v16.super_class = (Class)PKPushTokenFetcher;
  id v2 = [(PKPushTokenFetcher *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PKPushTokenFetcher", 0);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    uint64_t v6 = [v5 initWithEnvironmentName:*MEMORY[0x1E4F4E1D0] namedDelegatePort:*MEMORY[0x1E4F4E1B8] queue:*((void *)v2 + 1)];
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    v12 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__PKPushTokenFetcher_init__block_invoke;
    handler[3] = &unk_1E56D8AE0;
    id v15 = v2;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
  }
  return (PKPushTokenFetcher *)v2;
}

void __26__PKPushTokenFetcher_init__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192FDC630]();
  [*(id *)(a1 + 32) _handleTimeout];
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
  pushConnection = self->_pushConnection;
  v4 = [MEMORY[0x1E4F1C978] array];
  [(APSConnection *)pushConnection _setEnabledTopics:v4];

  [(APSConnection *)self->_pushConnection setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)PKPushTokenFetcher;
  [(PKPushTokenFetcher *)&v5 dealloc];
}

- (void)fetchPushTokenWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKPushTokenFetcher_fetchPushTokenWithTimeout_completion___block_invoke;
  block[3] = &unk_1E56D8590;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __59__PKPushTokenFetcher_fetchPushTokenWithTimeout_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v4 = _Block_copy(v2);
  [v3 addObject:v4];

  objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 32) publicToken];
  if (v5)
  {
    [*(id *)(a1 + 32) _invokeCompletionWithPushToken:v5];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "No push token; registering fake push topic", v9, 2u);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 32) _setEnabledTopics:&unk_1EE22B0D8];
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Push token fetcher received public token %@", (uint8_t *)&v7, 0xCu);
  }

  [(PKPushTokenFetcher *)self _invokeCompletionWithPushToken:v5];
}

- (void)_handleTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  dispatch_queue_t v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Push token fetcher timed out", v5, 2u);
  }

  v4 = [(APSConnection *)self->_pushConnection publicToken];
  [(PKPushTokenFetcher *)self _invokeCompletionWithPushToken:v4];
}

- (void)_invokeCompletionWithPushToken:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Push token fetcher completed with push token %@", buf, 0xCu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  [(APSConnection *)self->_pushConnection setDelegate:0];
  pushConnection = self->_pushConnection;
  int v7 = [MEMORY[0x1E4F1C978] array];
  [(APSConnection *)pushConnection _setEnabledTopics:v7];

  if ([(NSMutableArray *)self->_completionHandlers count])
  {
    completionHandlers = self->_completionHandlers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke;
    v9[3] = &unk_1E56E7A90;
    id v10 = v4;
    [(NSMutableArray *)completionHandlers enumerateObjectsUsingBlock:v9];
    [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  }
}

void __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke_2;
  v7[3] = &unk_1E56D83D8;
  id v9 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_10;
  block[3] = &unk_1E56D8360;
  id v11 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__PKPushTokenFetcher__invokeCompletionWithPushToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end