@interface VLFVIOSessionTimeoutMonitor
+ (BOOL)isAvailable;
- (GCDTimer)timeoutTimer;
- (NSString)description;
- (VLFVIOSessionTimeoutMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)_startTimeoutTimer;
- (void)dealloc;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation VLFVIOSessionTimeoutMonitor

- (VLFVIOSessionTimeoutMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)VLFVIOSessionTimeoutMonitor;
  v4 = [(VIOSessionMonitor *)&v20 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_100CDA688();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v22 = v4;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = [(VIOSessionMonitor *)v4 configuration];
    unsigned int v9 = [v8 isVLF];

    if (v9)
    {
      v10 = [(VIOSessionMonitor *)v4 platformController];
      v11 = [v10 currentSession];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v18 = [(VIOSessionMonitor *)v4 platformController];
        [v18 addObserver:v4];

        [(VLFVIOSessionTimeoutMonitor *)v4 _startTimeoutTimer];
        return v4;
      }
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_100CDA688();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 134349314;
      v22 = v4;
      __int16 v23 = 2112;
      v24 = v15;
      v16 = "[%{public}p] %@ will not run because we are currently navigating";
    }
    else
    {
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_100CDA688();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        return v4;
      }
      v17 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v17);
      *(_DWORD *)buf = 134349314;
      v22 = v4;
      __int16 v23 = 2112;
      v24 = v15;
      v16 = "[%{public}p] %@ will not run because the session is not configured for VLF";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

    goto LABEL_11;
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100CDA688();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    unsigned int v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6 = [(VIOSessionMonitor *)self platformController];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)VLFVIOSessionTimeoutMonitor;
  [(VLFVIOSessionTimeoutMonitor *)&v7 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned int v5 = [(VIOSessionMonitor *)self isEnabled];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  objc_super v7 = v6;
  GEOConfigGetDouble();
  unsigned int v9 = +[NSString stringWithFormat:@"<%@ %p enabled: %@, timeout: %f>", v4, self, v7, v8];

  return (NSString *)v9;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (void)_startTimeoutTimer
{
  GEOConfigGetDouble();
  double v4 = v3;
  objc_initWeak(&location, self);
  unsigned int v5 = sub_100CDA688();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v15 = self;
    __int16 v16 = 2048;
    double v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Starting timeout timer with time interval: %f", buf, 0x16u);
  }

  id v6 = &_dispatch_main_q;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  __int16 v10 = sub_100CDAA7C;
  v11 = &unk_1012E7638;
  objc_copyWeak(&v12, &location);
  objc_super v7 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v8 block:v4];
  -[VLFVIOSessionTimeoutMonitor setTimeoutTimer:](self, "setTimeoutTimer:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = sub_100CDA688();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stopping timeout timer",
        (uint8_t *)&v10,
        0xCu);
    }

    uint64_t v9 = [(VIOSessionMonitor *)self platformController];
    [v9 removeObserver:self];

    [(VLFVIOSessionTimeoutMonitor *)self setTimeoutTimer:0];
    [(VIOSessionMonitor *)self setEnabled:0];
  }
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end