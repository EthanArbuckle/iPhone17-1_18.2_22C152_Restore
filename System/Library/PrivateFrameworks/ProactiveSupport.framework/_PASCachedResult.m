@interface _PASCachedResult
- (_PASCachedResult)init;
- (_PASCachedResult)resultWithBlock:(id)a3;
- (id)resultNonnullWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation _PASCachedResult

- (void).cxx_destruct
{
}

- (id)resultNonnullWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = pthread_mutex_lock(&self->_lock);
    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_done);
    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A62450A0](v8);
      v11 = v4[2](v4);
      id data = self->_data;
      self->_id data = v11;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->_lock);
  }
  id v6 = self->_data;

  return v6;
}

- (_PASCachedResult)resultWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = pthread_mutex_lock(&self->_lock);
    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_done);
    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A62450A0](v8);
      v11 = v4[2](v4);
      id data = self->_data;
      self->_id data = v11;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->_lock);
  }
  id v6 = (_PASCachedResult *)self->_data;

  return v6;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASCachedResult;
  [(_PASCachedResult *)&v3 dealloc];
}

- (_PASCachedResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PASCachedResult;
  v2 = [(_PASCachedResult *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_done);
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

@end