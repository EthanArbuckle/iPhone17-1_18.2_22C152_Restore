@interface VIOSessionDailyUsageMonitor
+ (BOOL)isAvailable;
- (BOOL)shouldDisableVIOSession;
- (GCDTimer)usageLimitTimer;
- (NSString)description;
- (VIOSessionDailyUsageEntry)currentEntry;
- (VIOSessionDailyUsageMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)calendarDayChangedNotification:(id)a3;
- (void)dealloc;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setCurrentEntry:(id)a3;
- (void)setUsageLimitTimer:(id)a3;
- (void)startUsageLimitTimer;
- (void)stopUsageLimitTimer;
@end

@implementation VIOSessionDailyUsageMonitor

- (VIOSessionDailyUsageMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)VIOSessionDailyUsageMonitor;
  v4 = [(VIOSessionMonitor *)&v21 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_1009BC2C8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (VIOSessionDailyUsageEntry *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v23 = v4;
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    uint64_t v8 = +[VIOSessionDailyUsageEntry loadOrCreateEntry];
    currentEntry = v4->_currentEntry;
    v4->_currentEntry = (VIOSessionDailyUsageEntry *)v8;

    v10 = sub_1009BC2C8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v4->_currentEntry;
      *(_DWORD *)buf = 134349314;
      v23 = v4;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Loaded current entry: %@", buf, 0x16u);
    }

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v4 selector:"calendarDayChangedNotification:" name:NSCalendarDayChangedNotification object:0];

    v13 = [(VIOSessionMonitor *)v4 session];
    [v13 _addObserver:v4];

    v14 = [(VIOSessionMonitor *)v4 session];
    id v15 = [v14 state];

    if (v15 == (id)1)
    {
      [(VIOSessionDailyUsageMonitor *)v4 startUsageLimitTimer];
    }
    else
    {
      v16 = [(VIOSessionDailyUsageMonitor *)v4 currentEntry];
      [v16 timeRemaining];
      double v18 = v17;

      if (v18 == 0.0)
      {
        v19 = [(VIOSessionMonitor *)v4 stateManager];
        [v19 recordSessionDisableEvent:2];
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_1009BC2C8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6 = [(VIOSessionMonitor *)self session];
  [v6 _removeObserver:self];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  [(VIOSessionDailyUsageMonitor *)self stopUsageLimitTimer];
  v8.receiver = self;
  v8.super_class = (Class)VIOSessionDailyUsageMonitor;
  [(VIOSessionDailyUsageMonitor *)&v8 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  v6 = +[NSString stringWithFormat:@"<%@ %p currentEntry: %@>", v4, self, v5];

  return (NSString *)v6;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldDisableVIOSession
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316418;
        v14 = "-[VIOSessionDailyUsageMonitor shouldDisableVIOSession]";
        __int16 v15 = 2080;
        v16 = "VIOSessionDailyUsageMonitor.m";
        __int16 v17 = 1024;
        int v18 = 88;
        __int16 v19 = 2080;
        v20 = "dispatch_get_main_queue()";
        __int16 v21 = 2080;
        v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  v6 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  [v6 timeRemaining];
  BOOL v8 = v7 == 0.0;

  return v8;
}

- (void)startUsageLimitTimer
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136316418;
        *(void *)&location[4] = "-[VIOSessionDailyUsageMonitor startUsageLimitTimer]";
        __int16 v28 = 2080;
        v29 = "VIOSessionDailyUsageMonitor.m";
        __int16 v30 = 1024;
        int v31 = 97;
        __int16 v32 = 2080;
        v33 = "dispatch_get_main_queue()";
        __int16 v34 = 2080;
        v35 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v36 = 2080;
        v37 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          location,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v23 = sub_1005762E4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = +[NSThread callStackSymbols];
          *(_DWORD *)location = 138412290;
          *(void *)&location[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
        }
      }
    }
  }
  v6 = [(VIOSessionMonitor *)self session];
  id v7 = [v6 isVIORunning];
  BOOL v8 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  [v8 setIsRunningVIO:v7];

  v9 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  [v9 timeRemaining];
  double v11 = v10;
  v12 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  [v12 timeMultiplier];
  double v14 = v13;

  double v15 = v11 / v14;
  if (v15 <= 0.0)
  {
    v20 = sub_1009BC2C8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)location = 134349056;
      *(void *)&location[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Daily usage limit reached; disabling VIO session for the rest of the day",
        location,
        0xCu);
    }

    __int16 v21 = [(VIOSessionMonitor *)self stateManager];
    [v21 recordSessionDisableEvent:2];
  }
  else
  {
    v16 = +[NSDate date];
    __int16 v17 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v17 setLastStartDate:v16];

    int v18 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v18 save];

    objc_initWeak((id *)location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1009BCABC;
    v25[3] = &unk_1012E7638;
    objc_copyWeak(&v26, (id *)location);
    __int16 v19 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v25 block:v15];
    [(VIOSessionDailyUsageMonitor *)self setUsageLimitTimer:v19];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
}

- (void)stopUsageLimitTimer
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      __int16 v30 = sub_1005762E4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316418;
        __int16 v34 = "-[VIOSessionDailyUsageMonitor stopUsageLimitTimer]";
        __int16 v35 = 2080;
        __int16 v36 = "VIOSessionDailyUsageMonitor.m";
        __int16 v37 = 1024;
        int v38 = 125;
        __int16 v39 = 2080;
        v40 = "dispatch_get_main_queue()";
        __int16 v41 = 2080;
        v42 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v43 = 2080;
        v44 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v33,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v31 = sub_1005762E4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = +[NSThread callStackSymbols];
          int v33 = 138412290;
          __int16 v34 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v33, 0xCu);
        }
      }
    }
  }
  [(VIOSessionDailyUsageMonitor *)self setUsageLimitTimer:0];
  v6 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
  id v7 = [v6 lastStartDate];

  if (v7)
  {
    BOOL v8 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    v9 = +[NSDate date];
    double v10 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    double v11 = [v10 lastStartDate];
    [v9 timeIntervalSinceDate:v11];
    double v13 = v12;
    double v14 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v14 timeMultiplier];
    double v16 = v15;
    [v8 currentUsage];
    [v8 setCurrentUsage:v17 + v13 * v16];

    int v18 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v18 currentUsage];
    double v19 = 0.0;
    if (v20 > 0.0)
    {
      __int16 v21 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
      [v21 currentUsage];
      double v19 = v22;
    }
    __int16 v23 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v23 dailyUsageLimit];
    if (v19 >= v24)
    {
      v25 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
      [v25 dailyUsageLimit];
      double v19 = v26;
    }
    v27 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v27 setCurrentUsage:v19];

    __int16 v28 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v28 setLastStartDate:0];

    v29 = [(VIOSessionDailyUsageMonitor *)self currentEntry];
    [v29 save];
  }
}

- (void)calendarDayChangedNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label == v6 || (label ? (BOOL v7 = v6 == 0) : (BOOL v7 = 1), !v7 && !strcmp(label, v6)))
  {
    BOOL v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[VIOSessionDailyUsageMonitor calendarDayChangedNotification:]";
      __int16 v14 = 2080;
      double v15 = "VIOSessionDailyUsageMonitor.m";
      __int16 v16 = 1024;
      int v17 = 141;
      __int16 v18 = 2080;
      double v19 = "dispatch_get_main_queue()";
      __int16 v20 = 2080;
      __int16 v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = +[NSThread callStackSymbols];
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009BD1CC;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v12, (id *)location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009BD3D4;
  block[3] = &unk_1012F0708;
  v6[1] = (id)a4;
  objc_copyWeak(v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (VIOSessionDailyUsageEntry)currentEntry
{
  return self->_currentEntry;
}

- (void)setCurrentEntry:(id)a3
{
}

- (GCDTimer)usageLimitTimer
{
  return self->_usageLimitTimer;
}

- (void)setUsageLimitTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageLimitTimer, 0);

  objc_storeStrong((id *)&self->_currentEntry, 0);
}

@end