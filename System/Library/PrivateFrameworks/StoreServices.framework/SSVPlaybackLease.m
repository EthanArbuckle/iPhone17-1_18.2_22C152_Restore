@interface SSVPlaybackLease
- (BOOL)_shouldEndLeaseForError:(id)a3 returningEndReasonType:(unint64_t *)a4;
- (BOOL)refreshesAutomatically;
- (NSData)certificateData;
- (NSString)certificateURLBagKey;
- (SSVPlaybackLease)init;
- (SSVPlaybackLease)initWithLeaseConfiguration:(id)a3;
- (SSVPlaybackLease)initWithURLBag:(id)a3;
- (SSVPlaybackLease)initWithURLBag:(id)a3 leaseType:(int64_t)a4;
- (SSVPlaybackLeaseDelegate)delegate;
- (id)_addOperationWithRequest:(id)a3 configurationURL:(id)a4 completionBlock:(id)a5;
- (id)_initSSVPlaybackLease;
- (void)_cancelRefreshTimer;
- (void)_endLease;
- (void)_fireRefreshTimer;
- (void)_sendLeaseDidEndWithEndReasonType:(unint64_t)a3;
- (void)_startRefreshTimerIfNecessary;
- (void)_updateForLeaseResponse:(id)a3 error:(id)a4;
- (void)_updateWithLeaseResponseError:(id)a3;
- (void)beginLeaseWithRequest:(id)a3 completionBlock:(id)a4;
- (void)cancelAllAssetRequests;
- (void)dealloc;
- (void)endLease;
- (void)getAssetWithRequest:(id)a3 completionBlock:(id)a4;
- (void)getCertificateDataWithCompletionBlock:(id)a3;
- (void)preheatLeaseRequestsWithCompletionBlock:(id)a3;
- (void)refreshLeaseWithRequest:(id)a3 completionBlock:(id)a4;
- (void)setCertificateData:(id)a3;
- (void)setCertificateURLBagKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRefreshesAutomatically:(BOOL)a3;
- (void)updateWithExternalLeaseResponseError:(id)a3;
@end

@implementation SSVPlaybackLease

- (id)_initSSVPlaybackLease
{
  v17.receiver = self;
  v17.super_class = (Class)SSVPlaybackLease;
  id v2 = [(SSVPlaybackLease *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVPlaybackLease.delegate", 0);
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVPlaybackLease", 0);
    v6 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v5;

    v7 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 6), v7);
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 17), v7);
    v8 = objc_alloc_init(SSVFairPlaySubscriptionController);
    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v8;

    *((void *)v2 + 8) = 0;
    *((unsigned char *)v2 + 120) = 1;
    v10 = objc_alloc_init(SSVBarrierOperationQueue);
    v11 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v10;

    [*((id *)v2 + 14) setMaxConcurrentOperationCount:5];
    [*((id *)v2 + 14) setName:@"com.apple.StoreServices.SSVPlaybackLease"];
    objc_initWeak(&location, v2);
    v12 = *((void *)v2 + 17);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__SSVPlaybackLease__initSSVPlaybackLease__block_invoke;
    v14[3] = &unk_1E5BA7F98;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.itunesstored.PlaybackLeaseDidEnd", (int *)v2 + 20, v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__SSVPlaybackLease__initSSVPlaybackLease__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v2 BOOLForKey:@"SSVPlaybackLeaseIgnorePushNotifications"])
  {
    char v3 = MGGetBoolAnswer();

    if (v3) {
      return;
    }
  }
  else
  {
  }
  dispatch_queue_t v5 = objc_alloc_init(SSVPlaybackLeaseRequest);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshLeaseWithRequest:v5 completionBlock:0];
}

- (SSVPlaybackLease)init
{
  char v3 = +[SSURLBagContext contextWithBagType:0];
  v4 = SSVDefaultUserAgent();
  [v3 setValue:v4 forHTTPHeaderField:@"User-Agent"];

  dispatch_queue_t v5 = [[SSURLBag alloc] initWithURLBagContext:v3];
  v6 = [(SSVPlaybackLease *)self initWithURLBag:v5];

  return v6;
}

- (SSVPlaybackLease)initWithLeaseConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(SSVPlaybackLease *)self _initSSVPlaybackLease];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SSVPlaybackLeaseConfiguration *)v6;

    v5->_leaseType = [(SSVPlaybackLeaseConfiguration *)v5->_configuration leaseType];
  }

  return v5;
}

- (SSVPlaybackLease)initWithURLBag:(id)a3
{
  return [(SSVPlaybackLease *)self initWithURLBag:a3 leaseType:0];
}

- (SSVPlaybackLease)initWithURLBag:(id)a3 leaseType:(int64_t)a4
{
  id v7 = a3;
  v8 = [(SSVPlaybackLease *)self _initSSVPlaybackLease];
  v9 = v8;
  if (v8)
  {
    v8->_leaseType = a4;
    objc_storeStrong((id *)&v8->_urlBag, a3);
  }

  return v9;
}

- (void)dealloc
{
  refreshTimer = self->_refreshTimer;
  if (refreshTimer) {
    dispatch_source_cancel(refreshTimer);
  }
  notify_cancel(self->_leaseDidEndNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SSVPlaybackLease;
  [(SSVPlaybackLease *)&v4 dealloc];
}

- (void)beginLeaseWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyWithLeaseType:*(void *)(*(void *)(a1 + 40) + 96)];
  [v2 _setActionType:0];
  [v2 setStartsLeaseSession:1];
  id v3 = *(id *)(*(void *)(a1 + 40) + 48);
  objc_super v4 = *(id **)(a1 + 40);
  dispatch_queue_t v5 = [v4[4] beginLeaseURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_2;
  v9[3] = &unk_1E5BAC808;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  id v8 = (id)[v4 _addOperationWithRequest:v2 configurationURL:v5 completionBlock:v9];
}

void __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E5BA6EB8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __58__SSVPlaybackLease_beginLeaseWithRequest_completionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)cancelAllAssetRequests
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SSVPlaybackLease_cancelAllAssetRequests__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __42__SSVPlaybackLease_cancelAllAssetRequests__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "cancel", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)certificateData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__48;
  long long v10 = __Block_byref_object_dispose__48;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSVPlaybackLease_certificateData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __35__SSVPlaybackLease_certificateData__block_invoke(uint64_t a1)
{
}

- (NSString)certificateURLBagKey
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__48;
  long long v10 = __Block_byref_object_dispose__48;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSVPlaybackLease_certificateURLBagKey__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __40__SSVPlaybackLease_certificateURLBagKey__block_invoke(uint64_t a1)
{
}

- (SSVPlaybackLeaseDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__48;
  long long v10 = __Block_byref_object_dispose__48;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SSVPlaybackLease_delegate__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVPlaybackLeaseDelegate *)v3;
}

void __28__SSVPlaybackLease_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)endLease
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSVPlaybackLease_endLease__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __28__SSVPlaybackLease_endLease__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endLease];
}

- (void)getAssetWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyWithLeaseType:*(void *)(*(void *)(a1 + 40) + 96)];
  [v2 _setActionType:1];
  id v3 = *(id *)(*(void *)(a1 + 40) + 48);
  objc_super v4 = *(id **)(a1 + 40);
  id v5 = [v4[4] getAssetURL];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_2;
  uint64_t v15 = &unk_1E5BAC808;
  id v17 = *(id *)(a1 + 48);
  id v6 = v3;
  id v16 = v6;
  id v7 = [v4 _addOperationWithRequest:v2 configurationURL:v5 completionBlock:&v12];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 8);
  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;

    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 8);
  }
  objc_msgSend(v8, "addObject:", v7, v12, v13, v14, v15);
}

void __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E5BA6EB8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __56__SSVPlaybackLease_getAssetWithRequest_completionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCertificateDataWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = self->_delegateQueue;
  id v6 = self->_certificateData;
  if (!v6)
  {
    configuration = self->_configuration;
    id v9 = [SSVLeaseCertificateRequestOperation alloc];
    if (configuration) {
      id v10 = [(SSVLeaseCertificateRequestOperation *)v9 initWithConfiguration:self->_configuration];
    }
    else {
      id v10 = [(SSVLeaseCertificateRequestOperation *)v9 initWithURLBag:self->_urlBag];
    }
    id v7 = v10;
    [(SSVLeaseCertificateRequestOperation *)v10 setCertificateURLBagKey:self->_certificateURLBagKey];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_2;
    id v14 = &unk_1E5BAC830;
    id v16 = v4;
    uint64_t v15 = v5;
    [(SSVLeaseCertificateRequestOperation *)v7 setOutputBlock:&v11];
    -[SSVBarrierOperationQueue addOperation:](self->_operationQueue, "addOperation:", v7, v11, v12, v13, v14);

    goto LABEL_8;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke;
    block[3] = &unk_1E5BA7328;
    v19 = (SSVLeaseCertificateRequestOperation *)v4;
    v18 = v6;
    dispatch_async((dispatch_queue_t)v5, block);

    id v7 = v19;
LABEL_8:
  }
}

uint64_t __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_3;
    block[3] = &unk_1E5BA6EB8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __58__SSVPlaybackLease_getCertificateDataWithCompletionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)preheatLeaseRequestsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SSVPlaybackLease_preheatLeaseRequestsWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BAC858;
  id v7 = v4;
  id v5 = v4;
  [(SSVPlaybackLease *)self getCertificateDataWithCompletionBlock:v6];
}

uint64_t __60__SSVPlaybackLease_preheatLeaseRequestsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

- (BOOL)refreshesAutomatically
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSVPlaybackLease_refreshesAutomatically__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSVPlaybackLease_refreshesAutomatically__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)refreshLeaseWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyWithLeaseType:*(void *)(*(void *)(a1 + 40) + 96)];
  [v2 _setActionType:2];
  id v3 = *(id *)(*(void *)(a1 + 40) + 48);
  id v4 = *(id **)(a1 + 40);
  id v5 = [v4[4] refreshLeaseURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_2;
  v9[3] = &unk_1E5BAC808;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  id v8 = (id)[v4 _addOperationWithRequest:v2 configurationURL:v5 completionBlock:v9];
}

void __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_3;
    block[3] = &unk_1E5BA6EB8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __60__SSVPlaybackLease_refreshLeaseWithRequest_completionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setCertificateData:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SSVPlaybackLease_setCertificateData___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __39__SSVPlaybackLease_setCertificateData___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
}

- (void)setCertificateURLBagKey:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSVPlaybackLease_setCertificateURLBagKey___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __44__SSVPlaybackLease_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SSVPlaybackLease_setDelegate___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

id __32__SSVPlaybackLease_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)setRefreshesAutomatically:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSVPlaybackLease_setRefreshesAutomatically___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __46__SSVPlaybackLease_setRefreshesAutomatically___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = *(unsigned char *)(a1 + 40);
  v1 = *(unsigned char **)(a1 + 32);
  if (v1[120]) {
    return [v1 _startRefreshTimerIfNecessary];
  }
  else {
    return [v1 _cancelRefreshTimer];
  }
}

- (void)updateWithExternalLeaseResponseError:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSVPlaybackLease_updateWithExternalLeaseResponseError___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __57__SSVPlaybackLease_updateWithExternalLeaseResponseError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithLeaseResponseError:*(void *)(a1 + 40)];
}

- (id)_addOperationWithRequest:(id)a3 configurationURL:(id)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int64_t leaseType = self->_leaseType;
  [v9 _setCertificateData:self->_certificateData];
  [v9 _setKDMovieIdentifier:self->_kdMovieIdentifier];
  [v9 _setURL:v10];
  uint64_t v13 = [SSVLeaseRequestOperation alloc];
  if (v10) {
    id v14 = [(SSVLeaseRequestOperation *)v13 initWithLeaseRequest:v9 configuration:self->_configuration];
  }
  else {
    id v14 = [(SSVLeaseRequestOperation *)v13 initWithLeaseRequest:v9 URLBag:self->_urlBag];
  }
  uint64_t v15 = v14;
  [(SSVLeaseRequestOperation *)v14 setCertificateURLBagKey:self->_certificateURLBagKey];
  if (leaseType == 1) {
    objc_storeStrong((id *)&self->_lastKDLeaseRequest, a3);
  }
  id v16 = self->_serialQueue;
  objc_initWeak(&location, v15);
  objc_initWeak(&from, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke;
  v20[3] = &unk_1E5BAC8A8;
  id v17 = v16;
  v21 = v17;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  v22 = self;
  id v18 = v11;
  id v23 = v18;
  [(SSVLeaseRequestOperation *)v15 setOutputBlock:v20];
  [(SSVBarrierOperationQueue *)self->_operationQueue addBarrierOperation:v15];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v15;
}

void __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke_2;
  v11[3] = &unk_1E5BAC880;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  objc_copyWeak(&v16, (id *)(a1 + 64));
  id v8 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __78__SSVPlaybackLease__addOperationWithRequest_configurationURL_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 72));
    if (v2) {
      [WeakRetained[1] removeObjectIdenticalTo:v2];
    }
    [*(id *)(a1 + 32) _updateForLeaseResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (!v4) {
      goto LABEL_9;
    }
    id v2 = SSError(@"SSErrorDomain", 100, 0, 0);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v2);
  }

LABEL_9:
}

- (void)_cancelRefreshTimer
{
  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
  {
    dispatch_source_cancel(refreshTimer);
    uint64_t v4 = self->_refreshTimer;
    self->_refreshTimer = 0;
  }
}

- (void)_endLease
{
  [(SSVPlaybackLease *)self _cancelRefreshTimer];
  assetOperations = self->_assetOperations;
  self->_assetOperations = 0;

  self->_kdMovieIdentifier = 0;
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = 0;

  [(SSVFairPlaySubscriptionController *)self->_fairPlaySubscriptionController stopSubscriptionLease:0];
  operationQueue = self->_operationQueue;
  [(SSVBarrierOperationQueue *)operationQueue cancelAllOperations];
}

- (void)_fireRefreshTimer
{
  [(SSVPlaybackLease *)self _cancelRefreshTimer];
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = 0;

  objc_initWeak(&location, self);
  lastKDLeaseRequest = self->_lastKDLeaseRequest;
  if (lastKDLeaseRequest)
  {
    id v5 = [(SSVPlaybackLeaseRequest *)lastKDLeaseRequest _copyWithLeaseType:self->_leaseType];
  }
  else
  {
    id v5 = +[SSVPlaybackLeaseRequest _requestWithType:self->_leaseType];
  }
  id v6 = v5;
  [v5 _setActionType:2];
  id v7 = [(SSVPlaybackLeaseConfiguration *)self->_configuration refreshLeaseURL];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke;
  v9[3] = &unk_1E5BAC8F8;
  objc_copyWeak(&v10, &location);
  id v8 = [(SSVPlaybackLease *)self _addOperationWithRequest:v6 configurationURL:v7 completionBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__SSVPlaybackLease__fireRefreshTimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)WeakRetained + 5);
    if (objc_opt_respondsToSelector())
    {
      id v10 = v8[6];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_2;
      block[3] = &unk_1E5BAC8D0;
      id v11 = &v24;
      id v24 = v9;
      id v12 = (id *)&v25;
      id v25 = v8;
      id v26 = v5;
      id v27 = v6;
      dispatch_async(v10, block);

      id v13 = v26;
    }
    else
    {
      if (v5)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_9:

          goto LABEL_10;
        }
        id v14 = v8[6];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_3;
        v20[3] = &unk_1E5BA7018;
        id v11 = &v21;
        id v21 = v9;
        id v12 = (id *)&v22;
        v22 = v8;
        dispatch_async(v14, v20);
LABEL_8:

        goto LABEL_9;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_9;
      }
      id v15 = v8[6];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_4;
      v16[3] = &unk_1E5BA7068;
      id v11 = &v17;
      id v17 = v9;
      id v12 = (id *)&v18;
      id v18 = v8;
      id v19 = v6;
      dispatch_async(v15, v16);
      id v13 = v19;
    }

    goto LABEL_8;
  }
LABEL_10:
}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) playbackLease:*(void *)(a1 + 40) automaticRefreshDidFinishWithResponse:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) playbackLeaseAutomaticRefreshDidFinish:*(void *)(a1 + 40)];
}

uint64_t __37__SSVPlaybackLease__fireRefreshTimer__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) playbackLease:*(void *)(a1 + 40) automaticRefreshDidFailWithError:*(void *)(a1 + 48)];
}

- (void)_sendLeaseDidEndWithEndReasonType:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke;
    v13[3] = &unk_1E5BA7018;
    id v7 = (id *)v14;
    v14[0] = WeakRetained;
    v14[1] = self;
    id v8 = v13;
    id v9 = delegateQueue;
LABEL_5:
    dispatch_async(v9, v8);

    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke_2;
    block[3] = &unk_1E5BA86D0;
    id v7 = (id *)v12;
    v12[0] = WeakRetained;
    v12[1] = self;
    v12[2] = a3;
    id v8 = block;
    id v9 = v10;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) playbackLeaseDidEnd:*(void *)(a1 + 40)];
}

uint64_t __54__SSVPlaybackLease__sendLeaseDidEndWithEndReasonType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) playbackLease:*(void *)(a1 + 40) didEndWithReasonType:*(void *)(a1 + 48)];
}

- (BOOL)_shouldEndLeaseForError:(id)a3 returningEndReasonType:(unint64_t *)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"SSServerErrorDomain"]
    && ([v5 code] == 3059 || objc_msgSend(v5, "code") == 3060))
  {
    BOOL v7 = 1;
    unint64_t v8 = 2;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"SSVFairPlayErrorDomain"]) {
    BOOL v7 = (unint64_t)([v5 code] + 42589) < 2;
  }
  else {
    BOOL v7 = 0;
  }
  unint64_t v8 = 1;
  if (a4) {
LABEL_10:
  }
    *a4 = v8;
LABEL_11:

  return v7;
}

- (void)_startRefreshTimerIfNecessary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_refreshTimer && self->_leaseExpirationDate && self->_refreshesAutomatically)
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_serialQueue);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    id v5 = self->_refreshTimer;
    [(NSDate *)self->_leaseExpirationDate timeIntervalSinceNow];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v5, v7, 0, 0);
    objc_initWeak(&location, self);
    unint64_t v8 = self->_refreshTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __49__SSVPlaybackLease__startRefreshTimerIfNecessary__block_invoke;
    id v27 = &unk_1E5BA8810;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v8, &handler);
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    int v11 = [v9 shouldLogToDisk];
    id v12 = [v9 OSLogObject];
    id v13 = v12;
    if (v11) {
      v10 |= 2u;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      v10 &= 2u;
    }
    if (v10)
    {
      id v14 = (id)objc_opt_class();
      [(NSDate *)self->_leaseExpirationDate timeIntervalSinceNow];
      int v30 = 138412546;
      id v31 = v14;
      __int16 v32 = 2048;
      uint64_t v33 = v15;
      LODWORD(v23) = 22;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        dispatch_resume((dispatch_object_t)self->_refreshTimer);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        return;
      }
      id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v30, v23, handler, v25, v26, v27);
      free(v16);
      SSFileLog(v9, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_15;
  }
}

void __49__SSVPlaybackLease__startRefreshTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireRefreshTimer];
}

- (void)_updateForLeaseResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SSVPlaybackLease *)self _cancelRefreshTimer];
  if (!self->_certificateData)
  {
    unint64_t v8 = [v6 certificateData];
    certificateData = self->_certificateData;
    self->_certificateData = v8;
  }
  self->_kdMovieIdentifier = [v6 KDMovieIdentifier];
  if (v7)
  {
    [(SSVPlaybackLease *)self _updateWithLeaseResponseError:v7];
  }
  else
  {
    [v6 leaseDuration];
    if (v10 >= 2.22044605e-16)
    {
      if (v10 <= 90.0)
      {
        [(SSVPlaybackLease *)self _fireRefreshTimer];
      }
      else
      {
        id v12 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v10 + -90.0];
        leaseExpirationDate = self->_leaseExpirationDate;
        self->_leaseExpirationDate = v12;

        [(SSVPlaybackLease *)self _startRefreshTimerIfNecessary];
      }
    }
    else
    {
      int v11 = self->_leaseExpirationDate;
      self->_leaseExpirationDate = 0;
    }
    if ([v6 isOfflineSlotAvailable] && !self->_offlineSlotRequest && !self->_leaseType)
    {
      id v14 = objc_alloc_init(SSVRefreshSubscriptionRequest);
      offlineSlotRequest = self->_offlineSlotRequest;
      self->_offlineSlotRequest = v14;

      [(SSVRefreshSubscriptionRequest *)self->_offlineSlotRequest setRequestingOfflineSlot:1];
      objc_initWeak(&location, self);
      id v16 = self->_offlineSlotRequest;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke;
      v17[3] = &unk_1E5BAC920;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      [(SSVRefreshSubscriptionRequest *)v16 startWithResponseBlock:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke_2;
    block[3] = &unk_1E5BA7040;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

void __50__SSVPlaybackLease__updateForLeaseResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = 0;
}

- (void)_updateWithLeaseResponseError:(id)a3
{
  uint64_t v7 = 1;
  if ([(SSVPlaybackLease *)self _shouldEndLeaseForError:a3 returningEndReasonType:&v7])
  {
    [(SSVPlaybackLease *)self _endLease];
    [(SSVPlaybackLease *)self _sendLeaseDidEndWithEndReasonType:v7];
  }
  else
  {
    [(NSDate *)self->_leaseExpirationDate timeIntervalSinceNow];
    if (v4 < 2.22044605e-16)
    {
      id v5 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:90.0];
      leaseExpirationDate = self->_leaseExpirationDate;
      self->_leaseExpirationDate = v5;
    }
    [(SSVPlaybackLease *)self _startRefreshTimerIfNecessary];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_offlineSlotRequest, 0);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_lastKDLeaseRequest, 0);
  objc_storeStrong((id *)&self->_fairPlaySubscriptionController, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_assetOperations, 0);
}

@end