@interface VIOSessionTrackingStateMonitor
+ (BOOL)isAvailable;
- (VIOSessionTrackingStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
@end

@implementation VIOSessionTrackingStateMonitor

- (VIOSessionTrackingStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VIOSessionTrackingStateMonitor;
  v4 = [(VIOSessionMonitor *)&v10 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_100D37F78();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v12 = v4;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = [(VIOSessionMonitor *)v4 session];
    [v8 _addObserver:v4];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100D37F78();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6 = [(VIOSessionMonitor *)self session];
  [v6 _removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)VIOSessionTrackingStateMonitor;
  [(VIOSessionTrackingStateMonitor *)&v7 dealloc];
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (unint64_t)[v5 trackingState];
  unint64_t v7 = (unint64_t)[v5 trackingStateReason];

  v8 = sub_100D37F78();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (v6 >= 3)
    {
      v9 = +[NSString stringWithFormat:@"%ld", v6];
    }
    else
    {
      v9 = off_1013229C0[v6];
    }
    __int16 v10 = v9;
    if (v7 >= 5)
    {
      v11 = +[NSString stringWithFormat:@"%ld", v7];
    }
    else
    {
      v11 = off_1013229D8[v7];
    }
    *(_DWORD *)buf = 134349570;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected tracking state %@ with reason: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D382CC;
  block[3] = &unk_1012F0708;
  v13[1] = (id)v6;
  objc_copyWeak(v13, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

@end