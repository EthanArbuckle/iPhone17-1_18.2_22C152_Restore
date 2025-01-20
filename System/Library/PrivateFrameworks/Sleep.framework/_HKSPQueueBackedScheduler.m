@interface _HKSPQueueBackedScheduler
- (NAScheduler)scheduler;
- (OS_dispatch_queue)queue;
- (_HKSPQueueBackedScheduler)initWithQueue:(id)a3;
- (_HKSPQueueBackedScheduler)initWithScheduler:(id)a3 queue:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation _HKSPQueueBackedScheduler

- (_HKSPQueueBackedScheduler)initWithQueue:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F7A0F0];
  id v5 = a3;
  v6 = [v4 schedulerWithDispatchQueue:v5];
  v7 = [(_HKSPQueueBackedScheduler *)self initWithScheduler:v6 queue:v5];

  return v7;
}

- (_HKSPQueueBackedScheduler)initWithScheduler:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HKSPQueueBackedScheduler;
  v9 = [(_HKSPQueueBackedScheduler *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scheduler, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = v10;
  }

  return v10;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return (id)[(NAScheduler *)self->_scheduler afterDelay:a4 performBlock:a3];
}

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  return (id)[(NAScheduler *)self->_scheduler performCancelableBlock:a3];
}

- (void)suspend
{
}

- (void)resume
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end