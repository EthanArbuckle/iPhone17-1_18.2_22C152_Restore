@interface WBSCopyOnWriteState
- (WBSCopyOnWriteState)init;
- (id)forkIfNeededWithHandler:(id)a3;
- (void)decrementCount;
- (void)incrementCount;
@end

@implementation WBSCopyOnWriteState

- (void)incrementCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_count;
  os_unfair_lock_unlock(p_lock);
}

- (id)forkIfNeededWithHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  unint64_t count = v5->_count;
  if (count >= 2)
  {
    v5->_unint64_t count = count - 1;
    v8 = objc_alloc_init(WBSCopyOnWriteState);

    v4[2](v4);
    v5 = v8;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (WBSCopyOnWriteState)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSCopyOnWriteState;
  v2 = [(WBSCopyOnWriteState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_unint64_t count = 1;
    v4 = v2;
  }

  return v3;
}

- (void)decrementCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  --self->_count;
  os_unfair_lock_unlock(p_lock);
}

@end