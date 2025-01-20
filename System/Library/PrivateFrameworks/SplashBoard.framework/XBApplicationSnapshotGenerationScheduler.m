@interface XBApplicationSnapshotGenerationScheduler
+ (id)sharedInstance;
- (id)_init;
- (void)performImageDataGenerationAsync:(id)a3 withHandler:(id)a4;
- (void)performImageDataGenerationAsyncAndWait:(id)a3 withHandler:(id)a4;
- (void)performImageGenerationAsync:(id)a3;
- (void)performImageGenerationAsyncAndWait:(id)a3;
@end

@implementation XBApplicationSnapshotGenerationScheduler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sheduler;
  return v2;
}

uint64_t __58__XBApplicationSnapshotGenerationScheduler_sharedInstance__block_invoke()
{
  sharedInstance_sheduler = [[XBApplicationSnapshotGenerationScheduler alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)XBApplicationSnapshotGenerationScheduler;
  id v2 = [(XBApplicationSnapshotGenerationScheduler *)&v10 init];
  if (v2)
  {
    dispatch_workloop_t v3 = dispatch_workloop_create("XBApplicationSnapshotSchedulerImageGenerationWorkloop");
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("XBApplicationSnapshotSchedulerImageGenerationQueue", 0, *((dispatch_queue_t *)v2 + 1));
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    dispatch_workloop_t v7 = dispatch_workloop_create("XBApplicationSnapshotSchedulerImageDataGenerationWorkloop");
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;
  }
  return v2;
}

- (void)performImageGenerationAsync:(id)a3
{
}

- (void)performImageGenerationAsyncAndWait:(id)a3
{
}

- (void)performImageDataGenerationAsync:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dataGenerationWorkloop = self->_dataGenerationWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsync_withHandler___block_invoke;
  block[3] = &unk_2646A5CD8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dataGenerationWorkloop, block);
}

void __88__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsync_withHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  dispatch_workloop_t v3 = (void *)a1[6];
  if (v3)
  {
    v4 = *(NSObject **)(a1[4] + 16);
    dispatch_async(v4, v3);
  }
}

- (void)performImageDataGenerationAsyncAndWait:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dataGenerationWorkloop = self->_dataGenerationWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsyncAndWait_withHandler___block_invoke;
  block[3] = &unk_2646A5CD8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async_and_wait(dataGenerationWorkloop, block);
}

void __95__XBApplicationSnapshotGenerationScheduler_performImageDataGenerationAsyncAndWait_withHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  dispatch_workloop_t v3 = (void *)a1[6];
  if (v3)
  {
    v4 = *(NSObject **)(a1[4] + 16);
    dispatch_async(v4, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataGenerationWorkloop, 0);
  objc_storeStrong((id *)&self->_imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->_imageGenerationWorkloop, 0);
}

@end