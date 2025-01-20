@interface PLThumbnailContextCleanupTimer
- (PLThumbnailContextCleanupTimer)initWithHandler:(id)a3;
- (void)_timerFired;
- (void)activate;
- (void)invalidate;
- (void)startOrRestartTimer;
@end

@implementation PLThumbnailContextCleanupTimer

- (PLThumbnailContextCleanupTimer)initWithHandler:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLThumbnailContextCleanupTimer;
  id v5 = [(PLThumbnailContextCleanupTimer *)&v20 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19F38D650](v4);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.backend.thumbnailContextCleanup", v9);
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v5 + 2));
    v13 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v12;

    *((_DWORD *)v5 + 8) = 0;
    objc_initWeak(&location, v5);
    v14 = *((void *)v5 + 3);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PLThumbnailContextCleanupTimer_initWithHandler___block_invoke;
    v17[3] = &unk_1E5875F08;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v14, v17);
    id v15 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return (PLThumbnailContextCleanupTimer *)v5;
}

- (void)activate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)startOrRestartTimer
{
  PLRunWithUnfairLock();
  dispatch_time_t v3 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
}

void __53__PLThumbnailContextCleanupTimer_startOrRestartTimer__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = os_transaction_create();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)_timerFired
{
}

void __45__PLThumbnailContextCleanupTimer__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)invalidate
{
}

void __44__PLThumbnailContextCleanupTimer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __50__PLThumbnailContextCleanupTimer_initWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

@end