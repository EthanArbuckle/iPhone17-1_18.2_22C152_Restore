@interface _UIViewServiceSessionManager
+ (BOOL)hasActiveSessions;
+ (id)__serviceSessionManager;
+ (void)startViewServiceSessionManagerAsPlugin:(BOOL)a3;
+ (void)startViewServiceSessionWithDelegate:(id)a3;
- (BOOL)_hasActiveSessions;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_UIViewServiceSessionManager)init;
- (_UIViewServiceSessionManagerDelegate)delegate;
- (id)_initAsPlugIn:(BOOL)a3;
- (id)_initWithDelegate:(id)a3;
- (void)_configureSessionForConnection:(id)a3;
- (void)_registerSessionForDefaultDeputies:(id)a3;
- (void)_startListener;
- (void)_startListenerWithName:(id)a3;
- (void)_startOrStopSystemsForBackgroundRunning;
- (void)dealloc;
@end

@implementation _UIViewServiceSessionManager

+ (BOOL)hasActiveSessions
{
  return [(id)__viewServiceSessionManager _hasActiveSessions];
}

+ (void)startViewServiceSessionManagerAsPlugin:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceSessionManager_startViewServiceSessionManagerAsPlugin___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  if (startViewServiceSessionManagerAsPlugin__onceToken != -1) {
    dispatch_once(&startViewServiceSessionManagerAsPlugin__onceToken, block);
  }
}

- (id)_initAsPlugIn:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_UIViewServiceSessionManager;
  BOOL v4 = [(_UIViewServiceSessionManager *)&v19 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessions = v4->_sessions;
    v4->_sessions = v5;

    if (a3)
    {
      v7 = _UIMainBundleIdentifier();
      v8 = [v7 stringByAppendingString:@".viewservice"];

      [(_UIViewServiceSessionManager *)v4 _startListenerWithName:v8];
    }
    else
    {
      v4->_connectionNotificationToken = 0;
      v9 = _UIMainBundleIdentifier();
      _UIViewServiceConnectionNotificationName(v9, v10);
      id v11 = objc_claimAutoreleasedReturnValue();
      v12 = (const char *)[v11 UTF8String];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __46___UIViewServiceSessionManager__initAsPlugIn___block_invoke;
      handler[3] = &unk_1E52E5DD8;
      v13 = v4;
      v18 = v13;
      notify_register_dispatch(v12, &v4->_connectionNotificationToken, MEMORY[0x1E4F14428], handler);

      uint64_t v16 = 0;
      notify_get_state(v4->_connectionNotificationToken, &v16);
      if (v16) {
        [(_UIViewServiceSessionManager *)v13 _startListener];
      }
      v8 = v18;
    }

    v14 = v4;
  }

  return v4;
}

- (_UIViewServiceSessionManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"You may not directly init a %@", v6 format];

  return 0;
}

+ (void)startViewServiceSessionWithDelegate:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___UIViewServiceSessionManager_startViewServiceSessionWithDelegate___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v7 = v3;
  uint64_t v4 = startViewServiceSessionWithDelegate__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&startViewServiceSessionWithDelegate__onceToken, block);
  }
}

+ (id)__serviceSessionManager
{
  return (id)__viewServiceSessionManager;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  notify_cancel(self->_connectionNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceSessionManager;
  [(_UIViewServiceSessionManager *)&v3 dealloc];
}

- (id)_initWithDelegate:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIViewServiceSessionManager;
  v6 = [(_UIViewServiceSessionManager *)&v21 init];
  if (v6)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessions = v6->_sessions;
    v6->_sessions = v7;

    objc_storeStrong((id *)&v6->_delegate, a3);
    if ([(_UIViewServiceSessionManagerDelegate *)v6->_delegate isExtensionViewServiceSessionManager:v6])
    {
      v9 = _UIMainBundleIdentifier();
      v10 = [v9 stringByAppendingString:@".viewservice"];

      [(_UIViewServiceSessionManager *)v6 _startListenerWithName:v10];
    }
    else
    {
      v6->_connectionNotificationToken = 0;
      id v11 = _UIMainBundleIdentifier();
      _UIViewServiceConnectionNotificationName(v11, v12);
      id v13 = objc_claimAutoreleasedReturnValue();
      v14 = (const char *)[v13 UTF8String];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __50___UIViewServiceSessionManager__initWithDelegate___block_invoke;
      handler[3] = &unk_1E52E5DD8;
      v15 = v6;
      v20 = v15;
      notify_register_dispatch(v14, &v6->_connectionNotificationToken, MEMORY[0x1E4F14428], handler);

      uint64_t v18 = 0;
      notify_get_state(v6->_connectionNotificationToken, &v18);
      if (v18) {
        [(_UIViewServiceSessionManager *)v15 _startListener];
      }
      v10 = v20;
    }

    uint64_t v16 = v6;
  }

  return v6;
}

- (void)_startListener
{
  _UIMainBundleIdentifier();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = _UIViewServiceMachServiceName((uint64_t)v4);
  [(_UIViewServiceSessionManager *)self _startListenerWithName:v3];
}

- (void)_startListenerWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceSessionManager", &_startListenerWithName____s_category)
                    + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Starting connection listener with service name %{public}@", (uint8_t *)&v8, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_listener)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v4];
    listener = self->_listener;
    self->_listener = v6;

    os_unfair_lock_unlock(&self->_lock);
    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
  }
}

- (void)_registerSessionForDefaultDeputies:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  uint64_t v4 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke;
  v8[3] = &unk_1E530DBE0;
  objc_copyWeak(&v9, &location);
  [v3 registerDeputyClass:v4 withConnectionHandler:v8];
  if (+[_UIViewServiceTextEffectsOperator _shouldAddServiceOperator])
  {
    uint64_t v5 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke_2;
    v6[3] = &unk_1E530DBE0;
    objc_copyWeak(&v7, &location);
    [v3 registerDeputyClass:v5 withConnectionHandler:v6];
    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_hasActiveSessions
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_sessions count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_configureSessionForConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[_UIViewServiceSession sessionWithConnection:v4 manager:self];
  [(_UIViewServiceSessionManager *)self _registerSessionForDefaultDeputies:v5];
  v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceSessionManager", _configureSessionForConnection____s_category)+ 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = [v4 serviceName];
    int v9 = [v4 processIdentifier];
    uint64_t v10 = [v5 uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v8;
    __int16 v19 = 1026;
    int v20 = v9;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Configuring connection on service %{public}@ to host pid %{public}d for session %{public}@", buf, 0x1Cu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_sessions addObject:v5];
  os_unfair_lock_unlock(&self->_lock);
  [(_UIViewServiceSessionManager *)self _startOrStopSystemsForBackgroundRunning];
  objc_initWeak((id *)buf, v5);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __63___UIViewServiceSessionManager__configureSessionForConnection___block_invoke;
  v14 = &unk_1E52D9960;
  objc_copyWeak(&v16, (id *)buf);
  v15 = self;
  [v5 setTerminationHandler:&v11];
  objc_msgSend(v4, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 1;
}

- (void)_startOrStopSystemsForBackgroundRunning
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceSessionManager__startOrStopSystemsForBackgroundRunning__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (_UIViewServiceSessionManagerDelegate)delegate
{
  return (_UIViewServiceSessionManagerDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end