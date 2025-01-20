@interface PLCaptureDeferredPhotoProcessor
+ (id)sharedAsyncQueue;
- (PLCaptureDeferredPhotoProcessor)init;
- (PLCaptureDeferredPhotoProcessor)initWithProcessor:(id)a3 asyncQueue:(id)a4;
- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3;
- (void)deletePersistentStorageForPhotoProxy:(id)a3;
- (void)persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:(id)a3;
- (void)prewarmWithSettings:(id)a3 completionHandler:(id)a4;
- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6;
@end

@implementation PLCaptureDeferredPhotoProcessor

uint64_t __73__PLCaptureDeferredPhotoProcessor_prewarmWithSettings_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) prewarmWithSettings:a1[5]];
  v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)prewarmWithSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PLCaptureDeferredPhotoProcessor_prewarmWithSettings_completionHandler___block_invoke;
  block[3] = &unk_1E5874868;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(asyncQueue, block);
}

- (PLCaptureDeferredPhotoProcessor)init
{
  v3 = +[PLCaptureDeferredPhotoProcessor sharedAsyncQueue];
  v4 = [MEMORY[0x1E4F16420] sharedPhotoProcessorForApplicationID:@"com.apple.camera"];
  v5 = [(PLCaptureDeferredPhotoProcessor *)self initWithProcessor:v4 asyncQueue:v3];

  return v5;
}

- (PLCaptureDeferredPhotoProcessor)initWithProcessor:(id)a3 asyncQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCaptureDeferredPhotoProcessor;
  id v9 = [(PLCaptureDeferredPhotoProcessor *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processor, a3);
    objc_storeStrong((id *)&v10->_asyncQueue, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)sharedAsyncQueue
{
  pl_dispatch_once();
  v2 = (void *)sharedAsyncQueue_pl_once_object_17;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
}

- (void)deletePersistentStorageForPhotoProxy:(id)a3
{
}

- (void)persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PLCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asyncQueue, v7);
}

void __95__PLCaptureDeferredPhotoProcessor_persistentlyStoredDeferredPhotoProxiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) persistentlyStoredDeferredPhotoProxies];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PLCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke;
  block[3] = &unk_1E5870618;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(asyncQueue, block);
}

uint64_t __90__PLCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) processPhotoProxy:a1[5] queuePosition:a1[6] delegate:a1[7] delegateQueue:a1[8]];
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  asyncQueue = self->_asyncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PLCaptureDeferredPhotoProcessor_cancelAllPrewarmingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asyncQueue, v7);
}

uint64_t __76__PLCaptureDeferredPhotoProcessor_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) cancelAllPrewarming];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __51__PLCaptureDeferredPhotoProcessor_sharedAsyncQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.assetsd.AVCaptureDeferredPhotoProcessor", v2);
  v1 = (void *)sharedAsyncQueue_pl_once_object_17;
  sharedAsyncQueue_pl_once_object_17 = (uint64_t)v0;
}

@end