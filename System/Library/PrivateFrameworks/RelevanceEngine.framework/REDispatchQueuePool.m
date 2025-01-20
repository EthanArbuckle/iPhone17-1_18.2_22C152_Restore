@interface REDispatchQueuePool
- (REDispatchQueuePool)initWithQueueCount:(unint64_t)a3 prefix:(id)a4;
- (id)nextAvailableQueue;
@end

@implementation REDispatchQueuePool

- (REDispatchQueuePool)initWithQueueCount:(unint64_t)a3 prefix:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)REDispatchQueuePool;
  v7 = [(REDispatchQueuePool *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->_currentIndex = 0;
    v9 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    if (a3)
    {
      uint64_t v10 = 0;
      do
      {
        objc_msgSend(v6, "stringByAppendingFormat:", @".%ld", v10);
        id v11 = objc_claimAutoreleasedReturnValue();
        v12 = (const char *)[v11 UTF8String];
        v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
        [v9 addObject:v14];

        ++v10;
      }
      while (a3 != v10);
    }
    uint64_t v15 = [v9 copy];
    queues = v8->_queues;
    v8->_queues = (NSArray *)v15;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (id)nextAvailableQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSArray *)self->_queues objectAtIndexedSubscript:self->_currentIndex];
  queues = self->_queues;
  unint64_t v6 = self->_currentIndex + 1;
  self->_currentIndex = v6;
  if (v6 >= [(NSArray *)queues count]) {
    self->_currentIndex = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end