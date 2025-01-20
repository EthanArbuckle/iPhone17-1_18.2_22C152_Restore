@interface _PASLazyPurgeableResult
- (_PASLazyPurgeableResult)initWithBlock:(id)a3;
- (_PASLazyPurgeableResult)initWithBlock:(id)a3 idleTimeout:(double)a4;
- (id)result;
- (id)resultIfAvailable;
- (void)dealloc;
@end

@implementation _PASLazyPurgeableResult

- (id)result
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_nil);
  if (v2)
  {
    id v5 = 0;
    goto LABEL_19;
  }
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->super._data) {
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_weakData);
  id data = self->super._data;
  self->super._id data = WeakRetained;

  if (self->super._data)
  {
LABEL_8:
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_nil);
    if (v12) {
      __assert_rtn("-[_PASLazyPurgeableResult _createDispatchSources]", "_PASCachedResult.m", 167, "!atomic_load(&_nil)");
    }
    if (_createDispatchSources__pasOnceToken4 != -1) {
      dispatch_once(&_createDispatchSources__pasOnceToken4, &__block_literal_global_2944);
    }
    v13 = (id)_createDispatchSources__pasExprOnceResult;
    v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x30uLL, v13);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v14;

    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49___PASLazyPurgeableResult__createDispatchSources__block_invoke_2;
    v21[3] = &unk_1E5AEB408;
    objc_copyWeak(&v22, &location);
    v16 = (void *)MEMORY[0x1A6245320](v21);
    dispatch_source_set_event_handler((dispatch_source_t)self->_memoryPressureSource, v16);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    if (fabs(self->_idleTimeout) != INFINITY)
    {
      v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v13);
      idleTimeoutSource = self->_idleTimeoutSource;
      self->_idleTimeoutSource = v17;

      dispatch_source_set_event_handler((dispatch_source_t)self->_idleTimeoutSource, v16);
      dispatch_resume((dispatch_object_t)self->_idleTimeoutSource);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

LABEL_14:
    if (fabs(self->_idleTimeout) != INFINITY)
    {
      v19 = self->_idleTimeoutSource;
      if (!v19) {
        __assert_rtn("-[_PASLazyPurgeableResult result]", "_PASCachedResult.m", 234, "_idleTimeoutSource");
      }
      dispatch_suspend(v19);
      dispatch_source_set_timer((dispatch_source_t)self->_idleTimeoutSource, +[_PASDispatch dispatchTimeWithSecondsFromNow:self->_idleTimeout], 0xFFFFFFFFFFFFFFFFLL, (uint64_t)fmin(self->_idleTimeout * 1000000000.0, 1.0e10));
      dispatch_resume((dispatch_object_t)self->_idleTimeoutSource);
    }
    id v5 = self->super._data;
    goto LABEL_18;
  }
  v8 = (void *)MEMORY[0x1A62450A0]();
  v9 = (*((void (**)(void))self->super._block + 2))();
  if (v9)
  {
    id v10 = self->super._data;
    self->super._id data = v9;
    id v11 = v9;

    objc_storeWeak(&self->_weakData, self->super._data);
    goto LABEL_8;
  }
  id v5 = 0;
  atomic_store(1u, (unsigned __int8 *)&self->_nil);
LABEL_18:
  pthread_mutex_unlock(p_lock);
LABEL_19:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimeoutSource, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);

  objc_destroyWeak(&self->_weakData);
}

- (id)resultIfAvailable
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_nil);
  if (v2)
  {
    id WeakRetained = 0;
  }
  else
  {
    p_lock = &self->super._lock;
    pthread_mutex_lock(&self->super._lock);
    id WeakRetained = objc_loadWeakRetained(&self->_weakData);
    pthread_mutex_unlock(p_lock);
  }

  return WeakRetained;
}

- (void)dealloc
{
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource) {
    dispatch_source_cancel(memoryPressureSource);
  }
  idleTimeoutSource = self->_idleTimeoutSource;
  if (idleTimeoutSource) {
    dispatch_source_cancel(idleTimeoutSource);
  }
  pthread_mutex_unlock(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)_PASLazyPurgeableResult;
  [(_PASLazyResult *)&v6 dealloc];
}

- (_PASLazyPurgeableResult)initWithBlock:(id)a3 idleTimeout:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_PASLazyPurgeableResult;
  result = [(_PASLazyResult *)&v6 _initWithBlock:a3];
  if (result)
  {
    atomic_store(0, (unsigned __int8 *)&result->_nil);
    result->_idleTimeout = a4;
  }
  return result;
}

- (_PASLazyPurgeableResult)initWithBlock:(id)a3
{
  return [(_PASLazyPurgeableResult *)self initWithBlock:a3 idleTimeout:60.0];
}

@end