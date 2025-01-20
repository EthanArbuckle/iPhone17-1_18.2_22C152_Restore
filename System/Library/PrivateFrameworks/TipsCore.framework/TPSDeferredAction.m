@interface TPSDeferredAction
- (BOOL)scheduled;
- (OS_dispatch_queue)queue;
- (TPSDeferredAction)init;
- (TPSDeferredAction)initWithQueue:(id)a3;
- (TPSDeferredActionDelegate)delegate;
- (os_unfair_lock_s)lock;
- (void)scheduleNextRunLoop;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setScheduled:(BOOL)a3;
@end

@implementation TPSDeferredAction

- (TPSDeferredAction)init
{
  return [(TPSDeferredAction *)self initWithQueue:0];
}

- (TPSDeferredAction)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSDeferredAction;
  v5 = [(TPSDeferredAction *)&v8 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = (id)MEMORY[0x1E4F14428];
      id v6 = MEMORY[0x1E4F14428];
    }
    objc_storeStrong((id *)&v5->_queue, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)scheduleNextRunLoop
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(TPSDeferredAction *)self scheduled])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(TPSDeferredAction *)self setScheduled:1];
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__TPSDeferredAction_scheduleNextRunLoop__block_invoke;
    v4[3] = &unk_1E5906E60;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __40__TPSDeferredAction_scheduleNextRunLoop__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 3;
    id v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 3);
    [(os_unfair_lock_s *)v4 setScheduled:0];
    v3 = [(os_unfair_lock_s *)v4 delegate];
    [v3 deferredActionPerform:v4];

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }
}

- (TPSDeferredActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSDeferredActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end