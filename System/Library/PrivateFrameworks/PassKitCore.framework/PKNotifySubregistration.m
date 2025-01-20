@interface PKNotifySubregistration
- (BOOL)isInvalidated;
- (PKNotifySubregistration)init;
- (PKNotifySubregistration)initWithParent:(id)a3 handler:(id)a4;
- (void)_invalidateFromParent:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invokeHandler;
@end

@implementation PKNotifySubregistration

- (PKNotifySubregistration)initWithParent:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKNotifySubregistration;
  v8 = [(PKNotifySubregistration *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_parent, v6);
    v10 = _Block_copy(v7);
    id handler = v9->_handler;
    v9->_id handler = v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)_invalidateFromParent:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_invalidated = 1;
    if (a3) {
      id WeakRetained = 0;
    }
    else {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    }
    objc_storeWeak((id *)&self->_parent, 0);
    id handler = self->_handler;
    self->_id handler = 0;

    os_unfair_lock_unlock(p_lock);
    if (WeakRetained)
    {
      [WeakRetained removeInvalidatedSubregistration:self];
    }
  }
}

- (void)invalidate
{
}

- (void)dealloc
{
  [(PKNotifySubregistration *)self _invalidateFromParent:1];
  v3.receiver = self;
  v3.super_class = (Class)PKNotifySubregistration;
  [(PKNotifySubregistration *)&v3 dealloc];
}

- (PKNotifySubregistration)init
{
  return 0;
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invokeHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = (void (**)(id, PKNotifySubregistration *))_Block_copy(self->_handler);
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      v4[2](v4, self);
    }
  }
}

@end