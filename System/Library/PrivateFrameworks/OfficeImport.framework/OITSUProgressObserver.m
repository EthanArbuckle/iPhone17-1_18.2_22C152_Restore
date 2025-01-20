@interface OITSUProgressObserver
- (OITSUProgressObserver)init;
- (OITSUProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (double)valueInterval;
- (void)dealloc;
- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5;
@end

@implementation OITSUProgressObserver

- (OITSUProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)OITSUProgressObserver;
  v8 = [(OITSUProgressObserver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    if (a4 && a5)
    {
      v8->mValueInterval = a3;
      dispatch_retain((dispatch_object_t)a4);
      v9->mQueue = (OS_dispatch_queue *)a4;
      v9->mHandler = (id)[a5 copy];
      v9->mLastHandledValue = 0.0;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (OITSUProgressObserver)init
{
  return [(OITSUProgressObserver *)self initWithValueInterval:0 queue:0 handler:0.0];
}

- (void)dealloc
{
  mQueue = self->mQueue;
  if (mQueue) {
    dispatch_release(mQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSUProgressObserver;
  [(OITSUProgressObserver *)&v4 dealloc];
}

- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5
{
  if (self->mLastHandledIndeterminate != a5
    || (double v9 = vabdd_f64(a3, self->mLastHandledValue),
        [(OITSUProgressObserver *)self valueInterval],
        v9 >= v10)
    || a3 >= a4 && self->mLastHandledValue < a4)
  {
    self->mLastHandledIndeterminate = a5;
    self->mLastHandledValue = a3;
    mQueue = self->mQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__OITSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke;
    block[3] = &unk_264D60B18;
    block[4] = self;
    dispatch_async(mQueue, block);
  }
}

void __62__OITSUProgressObserver_handleValue_maxValue_isIndeterminate___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (double)valueInterval
{
  return self->mValueInterval;
}

@end