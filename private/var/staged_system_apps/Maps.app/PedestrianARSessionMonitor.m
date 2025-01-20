@interface PedestrianARSessionMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (BOOL)isEnabled;
+ (id)friendlyName;
- (BOOL)shouldShowPedestrianAR;
- (PedestrianARSessionMonitor)initWithObserver:(id)a3;
- (PedestrianARSessionMonitorObserver)observer;
- (void)dealloc;
- (void)setShouldShowPedestrianAR:(BOOL)a3;
@end

@implementation PedestrianARSessionMonitor

- (void)setShouldShowPedestrianAR:(BOOL)a3
{
  if (self->_shouldShowPedestrianAR != a3)
  {
    BOOL v3 = a3;
    v5 = sub_1000B2ADC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = @"NO";
      if (v3) {
        v8 = @"YES";
      }
      v9 = v8;
      int v11 = 134349570;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v7;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] %@: updating state: %@", (uint8_t *)&v11, 0x20u);
    }
    self->_shouldShowPedestrianAR = v3;
    v10 = [(PedestrianARSessionMonitor *)self observer];
    [v10 monitor:self didChangeState:self->_shouldShowPedestrianAR];
  }
}

- (PedestrianARSessionMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (PedestrianARSessionMonitorObserver *)WeakRetained;
}

- (BOOL)shouldShowPedestrianAR
{
  return self->_shouldShowPedestrianAR;
}

+ (BOOL)isEnabled
{
  [a1 enablementGEOConfigKey];

  return GEOConfigGetBOOL();
}

- (PedestrianARSessionMonitor)initWithObserver:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[PedestrianARSessionMonitor initWithObserver:]";
      __int16 v16 = 2080;
      v17 = "PedestrianARSessionMonitor.m";
      __int16 v18 = 1024;
      int v19 = 23;
      __int16 v20 = 2080;
      v21 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)PedestrianARSessionMonitor;
  v5 = [(PedestrianARSessionMonitor *)&v13 init];
  if (v5)
  {
    v6 = sub_1000B2ADC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      __int16 v15 = (const char *)v5;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ initializing", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v5;
}

- (void)dealloc
{
  BOOL v3 = sub_1000B2ADC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ deallocing", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionMonitor;
  [(PedestrianARSessionMonitor *)&v6 dealloc];
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315650;
    v8 = "+[PedestrianARSessionMonitor enablementGEOConfigKey]";
    __int16 v9 = 2080;
    v10 = "PedestrianARSessionMonitor.m";
    __int16 v11 = 1024;
    int v12 = 48;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    BOOL v3 = sub_1005762E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = +[NSThread callStackSymbols];
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v5 = GEOConfigKey_InvalidBOOL[0];
  objc_super v6 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v6;
  *(void *)&result.var0.var0 = v5;
  return result;
}

+ (id)friendlyName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end