@interface OITSUProgressContextProgress
- (BOOL)isIndeterminate;
- (OITSUProgressContextProgress)init;
- (OITSUProgressContextProgress)initWithProgressContext:(id)a3;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)p_progressDidChange:(id)a3;
- (void)p_updateProgressContextObserver;
- (void)removeProgressObserver:(id)a3;
@end

@implementation OITSUProgressContextProgress

- (OITSUProgressContextProgress)initWithProgressContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUProgressContextProgress;
  v4 = [(OITSUProgress *)&v6 init];
  if (v4)
  {
    v4->mProgressContext = (OITSUProgressContext *)a3;
    v4->mProgressContextObserverQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUProgressContextProgress", 0);
  }
  return v4;
}

- (OITSUProgressContextProgress)init
{
  return [(OITSUProgressContextProgress *)self initWithProgressContext:0];
}

- (void)dealloc
{
  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  if (mProgressContextObserverQueue) {
    dispatch_release(mProgressContextObserverQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressContextProgress;
  [(OITSUProgress *)&v4 dealloc];
}

- (double)value
{
  mProgressContext = self->mProgressContext;
  if (!mProgressContext) {
    return 0.0;
  }
  [(OITSUProgressContext *)mProgressContext overallProgress];
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
  v8.super_class = (Class)OITSUProgressContextProgress;
  id v6 = [(OITSUProgress *)&v8 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  [(OITSUProgressContextProgress *)self p_updateProgressContextObserver];
  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressContextProgress;
  [(OITSUProgress *)&v4 removeProgressObserver:a3];
  [(OITSUProgressContextProgress *)self p_updateProgressContextObserver];
}

- (void)p_updateProgressContextObserver
{
  mProgressContextObserverQueue = self->mProgressContextObserverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__OITSUProgressContextProgress_p_updateProgressContextObserver__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(mProgressContextObserverQueue, block);
}

void __63__OITSUProgressContextProgress_p_updateProgressContextObserver__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
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
}

- (void)p_progressDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSUProgressMessage");
  if (v4) {
    [(OITSUProgress *)self setMessage:v4];
  }
  [(OITSUProgress *)self protected_progressDidChange];
}

@end