@interface WFContextualActionRunQueue
+ (id)sharedQueue;
- (NSMutableArray)runnerClients;
- (WFContextualActionRunQueue)init;
- (os_unfair_lock_s)lock;
- (void)enqueueRun:(id)a3;
- (void)runFinished:(id)a3;
@end

@implementation WFContextualActionRunQueue

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableArray)runnerClients
{
  return self->_runnerClients;
}

- (void)runFinished:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_runnerClients removeObject:v5];

  if ([(NSMutableArray *)self->_runnerClients count])
  {
    v6 = [(NSMutableArray *)self->_runnerClients firstObject];
    [v6 startFromQueue];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)enqueueRun:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSMutableArray *)self->_runnerClients count]) {
    [v4 startFromQueue];
  }
  [(NSMutableArray *)self->_runnerClients addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (WFContextualActionRunQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFContextualActionRunQueue;
  v2 = [(WFContextualActionRunQueue *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    runnerClients = v2->_runnerClients;
    v2->_runnerClients = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = v2;
  }

  return v2;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1) {
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedQueue_queue;
  return v2;
}

uint64_t __41__WFContextualActionRunQueue_sharedQueue__block_invoke()
{
  sharedQueue_queue = objc_alloc_init(WFContextualActionRunQueue);
  return MEMORY[0x1F41817F8]();
}

@end