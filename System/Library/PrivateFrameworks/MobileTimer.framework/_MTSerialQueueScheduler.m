@interface _MTSerialQueueScheduler
- (NAScheduler)internalScheduler;
- (OS_dispatch_queue)internalQueue;
- (_MTSerialQueueScheduler)initWithQueue:(id)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
@end

@implementation _MTSerialQueueScheduler

- (void)performBlock:(id)a3
{
}

- (_MTSerialQueueScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MTSerialQueueScheduler;
  v6 = [(_MTSerialQueueScheduler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalQueue, a3);
    uint64_t v8 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:v5];
    internalScheduler = v7->_internalScheduler;
    v7->_internalScheduler = (NAScheduler *)v8;
  }
  return v7;
}

- (void)performSyncBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  return (id)[(NAScheduler *)self->_internalScheduler performCancelableBlock:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return (id)[(NAScheduler *)self->_internalScheduler afterDelay:a4 performBlock:a3];
}

- (NAScheduler)internalScheduler
{
  return self->_internalScheduler;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_internalScheduler, 0);
}

@end