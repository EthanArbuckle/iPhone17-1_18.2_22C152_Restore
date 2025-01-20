@interface MTExponentialBackOffTimer
+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5;
+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6;
+ (id)timerWithInitialTime:(double)a3 fireBlock:(id)a4;
- (MTExponentialBackOffTimer)initWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (double)initialTime;
- (id)block;
- (id)description;
- (unint64_t)backoffFactor;
- (unint64_t)currentBackoff;
- (void)_cancel;
- (void)reset;
- (void)setBackoffFactor:(unint64_t)a3;
- (void)setBlock:(id)a3;
- (void)setCurrentBackoff:(unint64_t)a3;
- (void)setInitialTime:(double)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerFinished;
@end

@implementation MTExponentialBackOffTimer

+ (id)timerWithInitialTime:(double)a3 fireBlock:(id)a4
{
  return (id)[a1 timerWithInitialTime:2 backoffFactor:a4 fireBlock:a3];
}

+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5
{
  id v8 = a5;
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MTExponentialBackOffTimer.serial", 0);
  v10 = [a1 timerWithInitialTime:a4 backoffFactor:v8 fireBlock:v9 queue:a3];

  return v10;
}

+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = (void *)[objc_alloc((Class)a1) initWithInitialTime:a4 backoffFactor:v11 fireBlock:v10 queue:a3];

  return v12;
}

- (MTExponentialBackOffTimer)initWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MTExponentialBackOffTimer;
  v12 = [(MTExponentialBackOffTimer *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    id block = v12->_block;
    v12->_id block = (id)v13;

    v12->_currentBackoff = 1;
    v12->_backoffFactor = a4;
    v12->_initialTime = a3;
    objc_storeStrong((id *)&v12->_queue, a6);
  }

  return v12;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MTExponentialBackOffTimer_start__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__MTExponentialBackOffTimer_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 8))
  {
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v1 + 24));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __34__MTExponentialBackOffTimer_start__block_invoke_2;
    handler[3] = &unk_1E59150A8;
    handler[4] = v6;
    dispatch_source_set_event_handler(v7, handler);
    uint64_t v8 = *(void *)(a1 + 32);
    dispatch_queue_t v9 = *(NSObject **)(v8 + 8);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(*(double *)(v8 + 32) * (double)*(unint64_t *)(v8 + 40) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
}

uint64_t __34__MTExponentialBackOffTimer_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) timerFinished];
}

- (void)timerFinished
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = 0;

  self->_currentBackoff *= self->_backoffFactor;
  uint64_t v4 = (void (*)(void))*((void *)self->_block + 2);
  v4();
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MTExponentialBackOffTimer_stop__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__33__MTExponentialBackOffTimer_stop__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[1])
  {
    result = (void *)[result _cancel];
    *(void *)(*(void *)(a1 + 32) + 40) *= *(void *)(*(void *)(a1 + 32) + 48);
  }
  return result;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MTExponentialBackOffTimer_reset__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__34__MTExponentialBackOffTimer_reset__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[1])
  {
    result = (void *)[result _cancel];
    *(void *)(*(void *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)_cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  timer = self->_timer;
  self->_timer = 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p backoff: %ld>", objc_opt_class(), self, self->_currentBackoff];
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)initialTime
{
  return self->_initialTime;
}

- (void)setInitialTime:(double)a3
{
  self->_initialTime = a3;
}

- (unint64_t)currentBackoff
{
  return self->_currentBackoff;
}

- (void)setCurrentBackoff:(unint64_t)a3
{
  self->_currentBackoff = a3;
}

- (unint64_t)backoffFactor
{
  return self->_backoffFactor;
}

- (void)setBackoffFactor:(unint64_t)a3
{
  self->_backoffFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end