@interface PKAMSPromiseWrapper
- (BOOL)isCanceled;
- (BOOL)isInvalidated;
- (PKAMSPromiseWrapper)init;
- (PKAMSPromiseWrapper)initWithAMSPromise:(id)a3;
- (void)cancel;
- (void)invalidate;
@end

@implementation PKAMSPromiseWrapper

- (PKAMSPromiseWrapper)init
{
  return 0;
}

- (PKAMSPromiseWrapper)initWithAMSPromise:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAMSPromiseWrapper;
    v6 = [(PKAMSPromiseWrapper *)&v10 init];
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_promise, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  promise = self->_promise;
  self->_promise = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCanceled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_canceled = 1;
  promise = self->_promise;
  v7 = promise;
  if (promise)
  {
    id v5 = promise;
    v6 = self->_promise;
    self->_promise = 0;

    os_unfair_lock_unlock(p_lock);
    [MEMORY[0x1E4F4DDB0] cancelPromise:v5];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void).cxx_destruct
{
}

@end