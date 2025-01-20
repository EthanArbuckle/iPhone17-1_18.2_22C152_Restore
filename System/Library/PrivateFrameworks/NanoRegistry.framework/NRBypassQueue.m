@interface NRBypassQueue
- (NRBypassQueue)init;
- (void)enqueueBlock:(id)a3;
- (void)enqueueBlockAsync:(id)a3;
- (void)enqueueBypassBlock:(id)a3;
- (void)enqueueBypassBlockAsync:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation NRBypassQueue

- (void)enqueueBlock:(id)a3
{
}

- (void)suspend
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__NRBypassQueue_suspend__block_invoke;
  v4[3] = &unk_1E5B00230;
  v4[4] = self;
  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  __24__NRBypassQueue_suspend__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

void __24__NRBypassQueue_suspend__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
}

- (NRBypassQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)NRBypassQueue;
  id v2 = [(NRBypassQueue *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.bypass.queue", v3);
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v4;

    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.nanoregistry.suspendable.queue", v3, *((dispatch_queue_t *)v2 + 2));
    v7 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v6;

    *((_DWORD *)v2 + 7) = 0;
  }
  return (NRBypassQueue *)v2;
}

- (void)resume
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__NRBypassQueue_resume__block_invoke;
  v4[3] = &unk_1E5B00230;
  v4[4] = self;
  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  __23__NRBypassQueue_resume__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

void __23__NRBypassQueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 0;
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
}

- (void)enqueueBypassBlockAsync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bypassQueue, 0);

  objc_storeStrong((id *)&self->_suspendableQueue, 0);
}

- (void)enqueueBlockAsync:(id)a3
{
}

- (void)enqueueBypassBlock:(id)a3
{
}

@end