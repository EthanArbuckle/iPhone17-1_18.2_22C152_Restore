@interface _PASLazyImmortalResult
- (_PASLazyImmortalResult)initWithResult:(id)a3;
- (id)_initWithBlock:(id)a3;
- (id)result;
- (id)resultIfAvailable;
@end

@implementation _PASLazyImmortalResult

- (id)resultIfAvailable
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_done);
  if (v2) {
    id v3 = self->super._data;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)result
{
  p_done = &self->_done;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = pthread_mutex_lock(&self->super._lock);
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)p_done);
    if ((v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1A62450A0](v7);
      v10 = (*((void (**)(void))self->super._block + 2))();
      id data = self->super._data;
      self->super._id data = v10;

      id block = self->super._block;
      self->super._id block = 0;

      atomic_store(1u, (unsigned __int8 *)&self->_done);
    }
    pthread_mutex_unlock(&self->super._lock);
  }
  id v5 = self->super._data;

  return v5;
}

- (_PASLazyImmortalResult)initWithResult:(id)a3
{
  id v5 = a3;
  v6 = [(_PASLazyResult *)[_PASLazyImmortalResult alloc] _init];

  if (v6)
  {
    objc_storeStrong(&v6->super._data, a3);
    atomic_store(1u, (unsigned __int8 *)&v6->_done);
  }

  return v6;
}

- (id)_initWithBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PASLazyImmortalResult;
  id result = [(_PASLazyResult *)&v4 _initWithBlock:a3];
  if (result) {
    atomic_store(0, (unsigned __int8 *)result + 88);
  }
  return result;
}

@end