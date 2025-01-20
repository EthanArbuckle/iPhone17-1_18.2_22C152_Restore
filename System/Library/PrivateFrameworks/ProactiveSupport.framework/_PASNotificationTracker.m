@interface _PASNotificationTracker
- (BOOL)_deregisterHandlerWithToken:(id)a3 waitOnPending:(BOOL)a4;
- (BOOL)deregisterHandlerAsyncWithToken:(id)a3;
- (BOOL)deregisterHandlerWithToken:(id)a3;
- (_PASNotificationTracker)init;
- (id)registerWithQueue:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)issueNotificationAsyncWithContext:(id)a3;
- (void)issueNotificationAsyncWithContext:(id)a3 callback:(id)a4;
@end

@implementation _PASNotificationTracker

- (id)registerWithQueue:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_PASNotificationTracker.m", 61, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_PASNotificationTracker.m", 62, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  v10 = (unsigned __int8 *)objc_opt_new();
  [v10 setQueue:v7];
  dispatch_group_t v11 = dispatch_group_create();
  [v10 setGroup:v11];

  [v10 setHandler:v9];
  atomic_store(0, v10 + 8);
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  unint64_t nextNotificationToken = self->_nextNotificationToken;
  observers = self->_observers;
  self->_unint64_t nextNotificationToken = nextNotificationToken + 1;
  v15 = [NSNumber numberWithUnsignedInteger:nextNotificationToken];
  [(NSMutableDictionary *)observers setObject:v10 forKeyedSubscript:v15];

  pthread_mutex_unlock(p_lock);
  v16 = objc_opt_new();
  [v16 setToken:nextNotificationToken];

  return v16;
}

- (void).cxx_destruct
{
}

- (void)issueNotificationAsyncWithContext:(id)a3
{
}

- (void)issueNotificationAsyncWithContext:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  observers = self->_observers;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke;
  v14[3] = &unk_1E5AEA5B0;
  dispatch_group_t v11 = v8;
  v15 = v11;
  id v16 = v6;
  id v12 = v6;
  [(NSMutableDictionary *)observers enumerateKeysAndObjectsUsingBlock:v14];
  pthread_mutex_unlock(p_lock);
  if (v7)
  {
    v13 = dispatch_get_global_queue(17, 0);
    dispatch_group_notify(v11, v13, v7);
  }
}

- (BOOL)deregisterHandlerAsyncWithToken:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    dispatch_group_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_PASNotificationTracker.m", 110, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  BOOL v6 = [(_PASNotificationTracker *)self _deregisterHandlerWithToken:v5 waitOnPending:0];

  return v6;
}

- (BOOL)deregisterHandlerWithToken:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    dispatch_group_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_PASNotificationTracker.m", 104, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  BOOL v6 = [(_PASNotificationTracker *)self _deregisterHandlerWithToken:v5 waitOnPending:1];

  return v6;
}

- (BOOL)_deregisterHandlerWithToken:(id)a3 waitOnPending:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "token"));
  pthread_mutex_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_observers removeObjectForKey:v6];
  pthread_mutex_unlock(&self->_lock);
  if (v7)
  {
    atomic_store(1u, v7 + 8);
    if (v4)
    {
      dispatch_group_t v8 = [v7 group];
      dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

  return v7 != 0;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASNotificationTracker;
  [(_PASNotificationTracker *)&v3 dealloc];
}

- (_PASNotificationTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)_PASNotificationTracker;
  v2 = [(_PASNotificationTracker *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    v3->_unint64_t nextNotificationToken = 1;
    uint64_t v4 = objc_opt_new();
    observers = v3->_observers;
    v3->_observers = (NSMutableDictionary *)v4;
  }
  return v3;
}

@end