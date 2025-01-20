@interface VIOSessionThermalStateMonitor
+ (BOOL)isAvailable;
- (BOOL)shouldDisableVIOSession;
- (VIOSessionThermalStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)processInfoThermalStateDidChangeNotification:(id)a3;
- (void)reportStateToStateManager;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VIOSessionThermalStateMonitor

- (VIOSessionThermalStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VIOSessionThermalStateMonitor;
  v4 = [(VIOSessionMonitor *)&v8 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_100706628();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"processInfoThermalStateDidChangeNotification:" name:NSProcessInfoThermalStateDidChangeNotification object:0];

    _GEOConfigAddDelegateListenerForKey();
    [(VIOSessionThermalStateMonitor *)v4 reportStateToStateManager];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100706628();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  GEOConfigRemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)VIOSessionThermalStateMonitor;
  [(VIOSessionThermalStateMonitor *)&v4 dealloc];
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldDisableVIOSession
{
  v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 thermalState];
  LOBYTE(v3) = (uint64_t)v3 >= GEOConfigGetInteger();

  return (char)v3;
}

- (void)reportStateToStateManager
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  objc_super v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316418;
        v20 = (VIOSessionThermalStateMonitor *)"-[VIOSessionThermalStateMonitor reportStateToStateManager]";
        __int16 v21 = 2080;
        v22 = "VIOSessionThermalStateMonitor.m";
        __int16 v23 = 1024;
        *(_DWORD *)v24 = 69;
        *(_WORD *)&v24[4] = 2080;
        *(void *)&v24[6] = "dispatch_get_main_queue()";
        __int16 v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v19,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = +[NSThread callStackSymbols];
          int v19 = 138412290;
          v20 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
  unsigned int v6 = [(VIOSessionThermalStateMonitor *)self shouldDisableVIOSession];
  v7 = sub_100706628();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = +[NSProcessInfo processInfo];
      v10 = (const char *)[v9 thermalState];
      uint64_t Integer = GEOConfigGetInteger();
      int v19 = 134349568;
      v20 = self;
      __int16 v21 = 2048;
      v22 = v10;
      __int16 v23 = 2048;
      *(void *)v24 = Integer;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Will disable VIO with current thermal state: %ld, threshold: %ld", (uint8_t *)&v19, 0x20u);
    }
    v12 = [(VIOSessionMonitor *)self stateManager];
    [v12 recordSessionDisableEvent:5];
  }
  else
  {
    if (v8)
    {
      v13 = +[NSProcessInfo processInfo];
      v14 = (const char *)[v13 thermalState];
      uint64_t v15 = GEOConfigGetInteger();
      int v19 = 134349568;
      v20 = self;
      __int16 v21 = 2048;
      v22 = v14;
      __int16 v23 = 2048;
      *(void *)v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Will NOT disable VIO with current thermal state: %ld, threshold: %ld", (uint8_t *)&v19, 0x20u);
    }
    v12 = [(VIOSessionMonitor *)self stateManager];
    [v12 resetSessionDisableEvent:5];
  }
}

- (void)processInfoThermalStateDidChangeNotification:(id)a3
{
  objc_super v4 = sub_100706628();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    BOOL v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Detected thermal state changed", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100706BF4;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  objc_super v4 = sub_100706628();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Thermal state threshold value changed", (uint8_t *)&v5, 0xCu);
  }

  [(VIOSessionThermalStateMonitor *)self reportStateToStateManager];
}

@end