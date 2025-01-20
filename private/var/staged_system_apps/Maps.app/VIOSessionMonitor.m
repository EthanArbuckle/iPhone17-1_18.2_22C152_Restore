@interface VIOSessionMonitor
+ (BOOL)isAvailable;
- (ARConfiguration)configuration;
- (ARSession)session;
- (BOOL)isEnabled;
- (BOOL)shouldDisableVIOSession;
- (PlatformController)platformController;
- (VIOSessionMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (VIOSessionStateManager)stateManager;
- (void)setEnabled:(BOOL)a3;
@end

@implementation VIOSessionMonitor

- (VIOSessionMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[VIOSessionMonitor initWithStateManager:platformController:]";
      __int16 v21 = 2080;
      v22 = "VIOSessionMonitor.m";
      __int16 v23 = 1024;
      int v24 = 22;
      __int16 v25 = 2080;
      v26 = "stateManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v8)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[VIOSessionMonitor initWithStateManager:platformController:]";
      __int16 v21 = 2080;
      v22 = "VIOSessionMonitor.m";
      __int16 v23 = 1024;
      int v24 = 23;
      __int16 v25 = 2080;
      v26 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)VIOSessionMonitor;
  v9 = [(VIOSessionMonitor *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stateManager, a3);
    objc_storeWeak((id *)&v10->_platformController, v8);
    v10->_enabled = 1;
  }

  return v10;
}

- (ARSession)session
{
  v2 = [(VIOSessionMonitor *)self stateManager];
  v3 = [v2 session];

  return (ARSession *)v3;
}

- (ARConfiguration)configuration
{
  v2 = [(VIOSessionMonitor *)self stateManager];
  v3 = [v2 configuration];

  return (ARConfiguration *)v3;
}

- (BOOL)shouldDisableVIOSession
{
  return 0;
}

+ (BOOL)isAvailable
{
  return 1;
}

- (VIOSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end