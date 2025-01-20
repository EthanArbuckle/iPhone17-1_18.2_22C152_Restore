@interface _PASKVOHandler
- (_PASKVOHandler)init;
- (void)_watchKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingTask:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reactAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5;
- (void)reactAsynchronouslyAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5 onQueue:(id)a6;
- (void)reactBeforeAndAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5;
@end

@implementation _PASKVOHandler

- (void).cxx_destruct
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  if (pthread_mutex_lock(&self->_lock) != 22)
  {
    v13 = a6;
    pthread_mutex_unlock(&self->_lock);
    v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    v15 = [MEMORY[0x1E4F1CA98] null];

    if (v14 == v15)
    {

      v14 = 0;
    }
    v16 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    v17 = [MEMORY[0x1E4F1CA98] null];

    if (v16 == v17)
    {

      v16 = 0;
    }
    v18 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284D8]];
    uint64_t v19 = [v18 BOOLValue];

    v20 = [v13 beforeAndAfterBlock];

    if (v20)
    {
      v21 = [v13 beforeAndAfterBlock];
      ((void (**)(void, id, id, void *, void *, uint64_t))v21)[2](v21, v24, v11, v14, v16, v19);
    }
    else
    {
      v22 = [v13 afterBlock];

      if (!v22)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"_PASKVOHandler.m", 120, @"Invalid parameter not satisfying: %@", @"task.afterBlock" object file lineNumber description];
      }
      v21 = [v13 afterBlock];
      ((void (*)(void (**)(void, void, void, void, void, void), id, id, void *, void *))v21[2])(v21, v24, v11, v14, v16);
    }
  }
}

- (void)_watchKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingTask:(id)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  pthread_mutex_lock(&self->_lock);
  [(NSMutableArray *)self->_tasks addObject:v11];
  [v10 addObserver:self forKeyPath:v12 options:a5 context:v11];
  pthread_mutex_unlock(&self->_lock);
}

- (void)reactBeforeAndAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setKeyPath:v10];
  [v11 setObject:v9];
  [v11 setBeforeAndAfterBlock:v8];

  [(_PASKVOHandler *)self _watchKeyPath:v10 ofObject:v9 options:11 usingTask:v11];
}

- (void)reactAsynchronouslyAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5 onQueue:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke;
  v14[3] = &unk_1E5AEB010;
  id v15 = v11;
  id v16 = v10;
  id v12 = v10;
  id v13 = v11;
  [(_PASKVOHandler *)self reactAfterChangesToKeyPath:a3 ofObject:a4 usingBlock:v14];
}

- (void)reactAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setKeyPath:v10];
  [v11 setObject:v9];
  [v11 setAfterBlock:v8];

  [(_PASKVOHandler *)self _watchKeyPath:v10 ofObject:v9 options:3 usingTask:v11];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_tasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 object];
        if (v9)
        {
          id v10 = [v8 keyPath];
          [v9 removeObserver:self forKeyPath:v10 context:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v11.receiver = self;
  v11.super_class = (Class)_PASKVOHandler;
  [(_PASKVOHandler *)&v11 dealloc];
}

- (_PASKVOHandler)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_PASKVOHandler;
  v2 = [(_PASKVOHandler *)&v6 init];
  if (v2)
  {
    v7.__sig = 0;
    *(void *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v2->_lock, &v7);
    pthread_mutexattr_destroy(&v7);
    uint64_t v3 = objc_opt_new();
    tasks = v2->_tasks;
    v2->_tasks = (NSMutableArray *)v3;
  }
  return v2;
}

@end