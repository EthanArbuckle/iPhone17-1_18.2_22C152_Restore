@interface TSUProgressContextProgress
- (BOOL)isIndeterminate;
- (TSUProgressContextProgress)init;
- (TSUProgressContextProgress)initWithProgressContext:(id)a3;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)p_progressDidChange:(id)a3;
- (void)p_updateProgressContextObserver;
- (void)removeProgressObserver:(id)a3;
@end

@implementation TSUProgressContextProgress

- (TSUProgressContextProgress)initWithProgressContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUProgressContextProgress;
  v4 = [(TSUProgress *)&v6 init];
  if (v4)
  {
    v4->mProgressContext = (TSUProgressContext *)a3;
    v4->mProgressContextObserverQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUProgressContextProgress", 0);
  }
  return v4;
}

- (TSUProgressContextProgress)init
{
  return [(TSUProgressContextProgress *)self initWithProgressContext:0];
}

- (void)dealloc
{
  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  if (mProgressContextObserverQueue) {
    dispatch_release(mProgressContextObserverQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUProgressContextProgress;
  [(TSUProgress *)&v4 dealloc];
}

- (double)value
{
  mProgressContext = self->mProgressContext;
  if (!mProgressContext) {
    return 0.0;
  }
  [(TSUProgressContext *)mProgressContext overallProgress];
  return result;
}

- (double)maxValue
{
  return 1.0;
}

- (BOOL)isIndeterminate
{
  return 0;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TSUProgressContextProgress;
  id v6 = [(TSUProgress *)&v8 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  [(TSUProgressContextProgress *)self p_updateProgressContextObserver];
  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSUProgressContextProgress;
  [(TSUProgress *)&v4 removeProgressObserver:a3];
  [(TSUProgressContextProgress *)self p_updateProgressContextObserver];
}

- (void)p_updateProgressContextObserver
{
  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__TSUProgressContextProgress_p_updateProgressContextObserver__block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  dispatch_async(mProgressContextObserverQueue, block);
}

uint64_t __61__TSUProgressContextProgress_p_updateProgressContextObserver__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  int v3 = objc_msgSend(*(id *)(a1 + 32), "protected_hasProgressObservers");
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 48)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    if (*(unsigned char *)(v4 + 48)) {
      char v6 = v3;
    }
    else {
      char v6 = 1;
    }
    if ((v6 & 1) == 0) {
      objc_msgSend(*(id *)(v4 + 32), "removeProgressObserver:");
    }
  }
  else
  {
    [*(id *)(v4 + 32) addProgressObserver:v4 selector:sel_p_progressDidChange_];
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  }
  return [v2 drain];
}

- (void)p_progressDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSUProgressMessage");
  if (v4) {
    [(TSUProgress *)self setMessage:v4];
  }
  [(TSUProgress *)self protected_progressDidChange];
}

@end