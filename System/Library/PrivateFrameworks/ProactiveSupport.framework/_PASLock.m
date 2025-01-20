@interface _PASLock
- (_PASLock)initWithGuardedData:(id)a3;
- (id)guardedDataAssertingLockContext;
- (id)unsafeGuardedData;
- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4;
- (unsigned)tryWithLockAcquired:(id)a3;
- (void)_runThenUnlock:(uint64_t)a1;
- (void)dealloc;
- (void)runWithLockAcquired:(id)a3;
@end

@implementation _PASLock

- (void).cxx_destruct
{
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASLock;
  [(_PASLock *)&v3 dealloc];
}

- (_PASLock)initWithGuardedData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PASLock;
  v6 = [(_PASLock *)&v8 init];
  if (v6)
  {
    v9.__sig = 0;
    *(void *)v9.__opaque = 0;
    pthread_mutexattr_init(&v9);
    pthread_mutexattr_settype(&v9, 2);
    pthread_mutex_init(&v6->_lock, &v9);
    pthread_mutexattr_destroy(&v9);
    objc_storeStrong(&v6->_guardedData, a3);
  }

  return v6;
}

- (void)runWithLockAcquired:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  -[_PASLock _runThenUnlock:]((uint64_t)self, v5);
}

- (void)_runThenUnlock:(uint64_t)a1
{
  objc_super v3 = a2;
  if (a1)
  {
    *(void *)(a1 + 72) = pthread_self();
    v3[2](v3, *(void *)(a1 + 80));
    *(void *)(a1 + 72) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  }
}

- (id)unsafeGuardedData
{
  return self->_guardedData;
}

- (id)guardedDataAssertingLockContext
{
  p_lock = &self->_lock;
  if (pthread_mutex_trylock(&self->_lock))
  {
    id result = (id)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (result)
    {
      __int16 v9 = 0;
      id v5 = MEMORY[0x1E4F14500];
      v6 = "_PASLock:guardedDataAssertingLockContext called with lock acquired by different thread";
      v7 = (uint8_t *)&v9;
LABEL_10:
      _os_log_error_impl(&dword_1A32C4000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    }
LABEL_11:
    __break(1u);
    return result;
  }
  if (!self->_owner)
  {
    id result = (id)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (result)
    {
      __int16 v8 = 0;
      id v5 = MEMORY[0x1E4F14500];
      v6 = "_PASLock:guardedDataAssertingLockContext called with lock not acquired";
      v7 = (uint8_t *)&v8;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  pthread_mutex_unlock(p_lock);

  return [(_PASLock *)self unsafeGuardedData];
}

- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4
{
  id v6 = a3;
  v7 = (uint64_t (**)(void))a4;
  __int16 v8 = (void *)MEMORY[0x1A62450A0]();
  int v9 = v7[2](v7);
  unsigned __int8 v10 = 1;
  if (v9)
  {
    while ([(_PASLock *)self tryWithLockAcquired:v6])
    {
      uint64_t v11 = sleep(1u);
      v12 = (void *)MEMORY[0x1A62450A0](v11);
      char v13 = v7[2](v7);
      if ((v13 & 1) == 0) {
        goto LABEL_6;
      }
    }
    unsigned __int8 v10 = 0;
  }
LABEL_6:

  return v10;
}

- (unsigned)tryWithLockAcquired:(id)a3
{
  id v4 = a3;
  if (pthread_mutex_trylock(&self->_lock))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    -[_PASLock _runThenUnlock:]((uint64_t)self, v4);
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end