@interface SBAtomicObjectQueue
- (SBAtomicObjectQueue)init;
- (id)dequeue;
- (void)enqueue:(id)a3;
@end

@implementation SBAtomicObjectQueue

- (SBAtomicObjectQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBAtomicObjectQueue;
  v2 = [(SBAtomicObjectQueue *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    data = v3->_data;
    v3->_data = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)enqueue:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_data _sb_enqueue:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)dequeue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableArray *)self->_data _sb_dequeue];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end