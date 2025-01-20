@interface SSCoalescingQueue
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)source;
- (SSCoalescingQueue)initWithBlock:(id)a3;
- (void)executeBlock;
- (void)setQueue:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SSCoalescingQueue

- (SSCoalescingQueue)initWithBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSCoalescingQueue;
  id v5 = [(SSCoalescingQueue *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreServices.SSCoalescingQueue", 0);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v5 + 1));
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v5 + 2), v4);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
  }

  return (SSCoalescingQueue *)v5;
}

- (void)executeBlock
{
  v2 = [(SSCoalescingQueue *)self source];
  dispatch_source_merge_data(v2, 1uLL);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end