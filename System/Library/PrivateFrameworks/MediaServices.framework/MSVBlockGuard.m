@interface MSVBlockGuard
- (BOOL)disarm;
- (MSVBlockGuard)init;
- (MSVBlockGuard)initWithDeallocHandler:(id)a3;
- (MSVBlockGuard)initWithTimeout:(double)a3;
- (MSVBlockGuard)initWithTimeout:(double)a3 interruptionHandler:(id)a4;
- (void)_interruptWithReason:(int64_t)a3;
- (void)dealloc;
@end

@implementation MSVBlockGuard

- (BOOL)disarm
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MSVBlockGuard_disarm__block_invoke;
  block[3] = &unk_1E5ADA9B8;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v10;
  dispatch_sync(accessQueue, block);
  BOOL v3 = 0;
  if (!*((unsigned char *)v11 + 24)) {
    BOOL v3 = *((unsigned char *)v7 + 24) == 0;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (void)dealloc
{
  [(MSVBlockGuard *)self _interruptWithReason:1];
  v3.receiver = self;
  v3.super_class = (Class)MSVBlockGuard;
  [(MSVBlockGuard *)&v3 dealloc];
}

- (void)_interruptWithReason:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5635;
  v11 = __Block_byref_object_dispose__5636;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MSVBlockGuard__interruptWithReason___block_invoke;
  block[3] = &unk_1E5ADA990;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  uint64_t v5 = v8[5];
  if (v5) {
    (*(void (**)(uint64_t, int64_t))(v5 + 16))(v5, a3);
  }
  _Block_object_dispose(&v7, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (MSVBlockGuard)initWithDeallocHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MSVBlockGuard_initWithDeallocHandler___block_invoke;
  v8[3] = &unk_1E5ADA920;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(MSVBlockGuard *)self initWithTimeout:v8 interruptionHandler:0.0];

  return v6;
}

- (MSVBlockGuard)initWithTimeout:(double)a3 interruptionHandler:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MSVBlockGuard;
  uint64_t v7 = [(MSVBlockGuard *)&v19 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaServices/MSVBlockGuard/access", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = MEMORY[0x1A62426F0](v6);
    id interruptionHandler = v7->_interruptionHandler;
    v7->_id interruptionHandler = (id)v10;

    if (a3 > 0.0)
    {
      objc_initWeak(&location, v7);
      id v12 = dispatch_get_global_queue(21, 0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__MSVBlockGuard_initWithTimeout_interruptionHandler___block_invoke;
      v16[3] = &unk_1E5ADA968;
      objc_copyWeak(&v17, &location);
      uint64_t v13 = +[MSVTimer timerWithInterval:0 repeats:v12 queue:v16 block:a3];
      timeoutTimer = v7->_timeoutTimer;
      v7->_timeoutTimer = (MSVTimer *)v13;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

void __23__MSVBlockGuard_disarm__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 16);
  *(unsigned char *)(a1[4] + 16) = 1;
  [*(id *)(a1[4] + 24) invalidate];
  uint64_t v2 = a1[4];
  objc_super v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = a1[4];
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 17);
}

uint64_t __38__MSVBlockGuard__interruptWithReason___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    uint64_t v2 = (void *)result;
    result = *(void *)(v1 + 32);
    if (result)
    {
      if (!v2[6])
      {
        *(unsigned char *)(v1 + 17) = 1;
        result = *(void *)(v2[4] + 32);
      }
      *(void *)(*(void *)(v2[5] + 8) + 40) = MEMORY[0x1A62426F0](result);
      return MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

void __53__MSVBlockGuard_initWithTimeout_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _interruptWithReason:0];
}

- (MSVBlockGuard)initWithTimeout:(double)a3
{
  return [(MSVBlockGuard *)self initWithTimeout:&__block_literal_global_5642 interruptionHandler:a3];
}

uint64_t __40__MSVBlockGuard_initWithDeallocHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (MSVBlockGuard)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSVBlockGuard;
  uint64_t v2 = [(MSVBlockGuard *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaServices/MSVBlockGuard/access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end