@interface VLFSessionMonitor
+ (BOOL)isEnabled;
- (VLFSessionMonitor)initWithObserver:(id)a3;
- (VLFSessionMonitorObserver)observer;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation VLFSessionMonitor

- (VLFSessionMonitor)initWithObserver:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[VLFSessionMonitor initWithObserver:]";
      __int16 v14 = 2080;
      v15 = "VLFSessionMonitor.m";
      __int16 v16 = 1024;
      int v17 = 23;
      __int16 v18 = 2080;
      v19 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VLFSessionMonitor;
  v5 = [(VLFSessionMonitor *)&v11 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v6;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    if (qword_10160E988 != -1) {
      dispatch_once(&qword_10160E988, &stru_1012E5F98);
    }
    v5 = (id)qword_10160E980;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      v8 = (void *)v7;
      CFStringRef v9 = @"Hide";
      if (a3 == 1) {
        CFStringRef v9 = @"EnablePuck";
      }
      if (a3 == 2) {
        CFStringRef v9 = @"EnablePuckAndBanner";
      }
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      CFStringRef v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: updating state: %@", (uint8_t *)&v11, 0x16u);
    }
    self->_state = a3;
    v10 = [(VLFSessionMonitor *)self observer];
    [v10 monitor:self didChangeState:[self state]];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (VLFSessionMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (VLFSessionMonitorObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

+ (BOOL)isEnabled
{
  return 0;
}

@end