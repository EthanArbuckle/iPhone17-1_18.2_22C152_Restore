@interface TSUProgress
- (BOOL)isIndeterminate;
- (BOOL)protected_hasProgressObservers;
- (NSString)message;
- (TSUProgress)init;
- (double)maxValue;
- (double)protected_minProgressObserverValueInterval;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)protected_progressDidChange;
- (void)removeProgressObserver:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation TSUProgress

- (TSUProgress)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSUProgress;
  v2 = [(TSUProgress *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return 0;
    }
    else
    {
      v2->mProgressObservers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      v2->mProgressObserversQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUProgress", 0);
    }
  }
  return v2;
}

- (void)dealloc
{
  mProgressObserversQueue = self->mProgressObserversQueue;
  if (mProgressObserversQueue) {
    dispatch_release(mProgressObserversQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUProgress;
  [(TSUProgress *)&v4 dealloc];
}

- (double)value
{
  return NAN;
}

- (double)maxValue
{
  return NAN;
}

- (BOOL)isIndeterminate
{
  return 1;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  objc_super v5 = 0;
  if (a4 && a5)
  {
    objc_super v5 = [[TSUProgressObserver alloc] initWithValueInterval:a4 queue:a5 handler:a3];
    mProgressObserversQueue = self->mProgressObserversQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__TSUProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
    v9[3] = &unk_26462A298;
    v9[4] = self;
    v9[5] = v5;
    dispatch_async(mProgressObserversQueue, v9);
  }
  return v5;
}

uint64_t __66__TSUProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeProgressObserver:(id)a3
{
  if (a3)
  {
    mProgressObserversQueue = self->mProgressObserversQueue;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38__TSUProgress_removeProgressObserver___block_invoke;
    v4[3] = &unk_26462A298;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(mProgressObserversQueue, v4);
  }
}

uint64_t __38__TSUProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)protected_progressDidChange
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSUProgress_protected_progressDidChange__block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __42__TSUProgress_protected_progressDidChange__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  [*(id *)(a1 + 32) value];
  uint64_t v4 = v3;
  [*(id *)(a1 + 32) maxValue];
  uint64_t v6 = v5;
  char v7 = [*(id *)(a1 + 32) isIndeterminate];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__TSUProgress_protected_progressDidChange__block_invoke_2;
  v11[3] = &unk_26462A598;
  v11[4] = v8;
  v11[5] = v4;
  v11[6] = v6;
  char v12 = v7;
  dispatch_async(v9, v11);
  return [v2 drain];
}

uint64_t __42__TSUProgress_protected_progressDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) handleValue:*(unsigned __int8 *)(a1 + 56) maxValue:*(double *)(a1 + 40) isIndeterminate:*(double *)(a1 + 48)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return [v2 drain];
}

- (BOOL)protected_hasProgressObservers
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mProgressObserversQueue = self->mProgressObserversQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__TSUProgress_protected_hasProgressObservers__block_invoke;
  v5[3] = &unk_26462A4E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressObserversQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__TSUProgress_protected_hasProgressObservers__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (double)protected_minProgressObserverValueInterval
{
  uint64_t v6 = 0;
  char v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FF0000000000000;
  mProgressObserversQueue = self->mProgressObserversQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TSUProgress_protected_minProgressObserverValueInterval__block_invoke;
  v5[3] = &unk_26462A5C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressObserversQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__TSUProgress_protected_minProgressObserverValueInterval__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6) valueInterval];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmin(v7, *(double *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24));
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessage:(id)a3
{
}

@end