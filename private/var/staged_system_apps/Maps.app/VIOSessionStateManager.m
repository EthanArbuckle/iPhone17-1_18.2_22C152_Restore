@interface VIOSessionStateManager
- (ARConfiguration)configuration;
- (ARSession)session;
- (BOOL)isDisabled;
- (BOOL)isThrottling;
- (BOOL)isThrottlingOrDisabled;
- (GCDTimer)sessionRestartTimer;
- (GEOObserverHashTable)observers;
- (NSMutableDictionary)stateEnteredThrottleEventTimers;
- (NSMutableSet)activeDisableEvents;
- (NSSet)disableEventReasons;
- (VIOSessionStateManager)initWithSession:(id)a3 configuration:(id)a4;
- (double)remainingThrottleTime;
- (int64_t)throttleEventReason;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)disableSession;
- (void)recordSessionDisableEvent:(int64_t)a3;
- (void)recordStateEnteredThrottleEvent:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)resetSessionDisableEvent:(int64_t)a3;
- (void)resetStateEnteredThrottleEvent:(int64_t)a3;
- (void)resumeSession;
- (void)setActiveDisableEvents:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSessionRestartTimer:(id)a3;
- (void)setStateEnteredThrottleEventTimers:(id)a3;
- (void)setThrottleEventReason:(int64_t)a3;
- (void)throttleSessionWithEventReason:(int64_t)a3;
@end

@implementation VIOSessionStateManager

- (VIOSessionStateManager)initWithSession:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[VIOSessionStateManager initWithSession:configuration:]";
      __int16 v28 = 2080;
      v29 = "VIOSessionStateManager.m";
      __int16 v30 = 1024;
      int v31 = 48;
      __int16 v32 = 2080;
      v33 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[VIOSessionStateManager initWithSession:configuration:]";
      __int16 v28 = 2080;
      v29 = "VIOSessionStateManager.m";
      __int16 v30 = 1024;
      int v31 = 49;
      __int16 v32 = 2080;
      v33 = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v27 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)VIOSessionStateManager;
  v8 = [(VIOSessionStateManager *)&v25 init];
  if (v8)
  {
    v9 = sub_100A34FD0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v27 = (const char *)v8;
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v8->_session, v6);
    objc_storeStrong((id *)&v8->_configuration, a4);
    uint64_t v12 = +[NSMutableDictionary dictionary];
    stateEnteredThrottleEventTimers = v8->_stateEnteredThrottleEventTimers;
    v8->_stateEnteredThrottleEventTimers = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableSet set];
    activeDisableEvents = v8->_activeDisableEvents;
    v8->_activeDisableEvents = (NSMutableSet *)v14;

    v16 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VIOSessionStateManagerObserver queue:0];
    observers = v8->_observers;
    v8->_observers = v16;
  }
  return v8;
}

- (void)dealloc
{
  v3 = sub_100A34FD0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  id v7 = [WeakRetained technique];
  [v7 setVioThrottled:0];

  v8.receiver = self;
  v8.super_class = (Class)VIOSessionStateManager;
  [(VIOSessionStateManager *)&v8 dealloc];
}

- (void)recordStateEnteredThrottleEvent:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v27 = (VIOSessionStateManager *)"-[VIOSessionStateManager recordStateEnteredThrottleEvent:]";
        __int16 v28 = 2080;
        v29 = "VIOSessionStateManager.m";
        __int16 v30 = 1024;
        int v31 = 78;
        __int16 v32 = 2080;
        v33 = "dispatch_get_main_queue()";
        __int16 v34 = 2080;
        v35 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v36 = 2080;
        v37 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if (![(VIOSessionStateManager *)self isThrottlingOrDisabled])
  {
    objc_super v8 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
    v9 = +[NSNumber numberWithInteger:a3];
    v10 = [v8 objectForKey:v9];
    BOOL v11 = v10 == 0;

    uint64_t v12 = sub_100A34FD0();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        CFStringRef v15 = @"VIOSessionThrottleEventDeviceMotion";
        if (!a3) {
          CFStringRef v15 = @"VIOSessionThrottleEventARTrackingState";
        }
        *(_DWORD *)buf = 134349314;
        v27 = self;
        __int16 v28 = 2112;
        v29 = (const char *)v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Recording a new consecutive throttle event of type %@", buf, 0x16u);
      }

      GEOConfigGetDouble();
      v17 = v16;
      objc_initWeak((id *)buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100A35578;
      v24[3] = &unk_1012F8730;
      objc_copyWeak(v25, (id *)buf);
      v25[1] = (id)a3;
      v25[2] = v17;
      v18 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v24 block:*(double *)&v17];

      v19 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
      v20 = +[NSNumber numberWithInteger:a3];
      [v19 setObject:v18 forKey:v20];

      objc_destroyWeak(v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v14 = @"VIOSessionThrottleEventDeviceMotion";
        if (!a3) {
          CFStringRef v14 = @"VIOSessionThrottleEventARTrackingState";
        }
        *(_DWORD *)buf = 134349314;
        v27 = self;
        __int16 v28 = 2112;
        v29 = (const char *)v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Recording another consecutive throttle event of type %@", buf, 0x16u);
      }
    }
  }
}

- (void)resetStateEnteredThrottleEvent:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      CFStringRef v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        v19 = (VIOSessionStateManager *)"-[VIOSessionStateManager resetStateEnteredThrottleEvent:]";
        __int16 v20 = 2080;
        v21 = "VIOSessionStateManager.m";
        __int16 v22 = 1024;
        int v23 = 102;
        __int16 v24 = 2080;
        objc_super v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  if (![(VIOSessionStateManager *)self isThrottlingOrDisabled])
  {
    objc_super v8 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
    v9 = +[NSNumber numberWithInteger:a3];
    v10 = [v8 objectForKey:v9];

    if (v10)
    {
      BOOL v11 = sub_100A34FD0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        CFStringRef v12 = @"VIOSessionThrottleEventDeviceMotion";
        if (!a3) {
          CFStringRef v12 = @"VIOSessionThrottleEventARTrackingState";
        }
        int v18 = 134349314;
        v19 = self;
        __int16 v20 = 2112;
        v21 = (const char *)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Resetting consecutive throttle event timeout timer for event of type %@", (uint8_t *)&v18, 0x16u);
      }

      v13 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
      CFStringRef v14 = +[NSNumber numberWithInteger:a3];
      [v13 removeObjectForKey:v14];
    }
  }
}

- (void)recordSessionDisableEvent:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      int v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v26 = 136316418;
        *(void *)&v26[4] = "-[VIOSessionStateManager recordSessionDisableEvent:]";
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "VIOSessionStateManager.m";
        *(_WORD *)&v26[22] = 1024;
        int v27 = 117;
        __int16 v28 = 2080;
        v29 = "dispatch_get_main_queue()";
        __int16 v30 = 2080;
        int v31 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v32 = 2080;
        v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          v26,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v24 = sub_1005762E4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_super v25 = +[NSThread callStackSymbols];
          *(_DWORD *)__int16 v26 = 138412290;
          *(void *)&v26[4] = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
        }
      }
    }
  }
  objc_super v8 = [(VIOSessionStateManager *)self activeDisableEvents];
  v9 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v10 = [v8 containsObject:v9];

  BOOL v11 = sub_100A34FD0();
  CFStringRef v12 = v11;
  if (v10)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    if ((unint64_t)(a3 - 1) > 9) {
      CFStringRef v13 = @"VIOSessionDisableEventLowPowerMode";
    }
    else {
      CFStringRef v13 = off_101314E70[a3 - 1];
    }
    *(_DWORD *)__int16 v26 = 134349314;
    *(void *)&v26[4] = self;
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v13;
    CFStringRef v15 = "[%{public}p] Recording another disable event of type %@";
    v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    if ((unint64_t)(a3 - 1) > 9) {
      CFStringRef v14 = @"VIOSessionDisableEventLowPowerMode";
    }
    else {
      CFStringRef v14 = off_101314E70[a3 - 1];
    }
    *(_DWORD *)__int16 v26 = 134349314;
    *(void *)&v26[4] = self;
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v14;
    CFStringRef v15 = "[%{public}p] Recording the first disable event of type %@";
    v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, v26, 0x16u);
LABEL_19:

  int v18 = [(VIOSessionStateManager *)self activeDisableEvents];
  id v19 = [v18 count];

  __int16 v20 = [(VIOSessionStateManager *)self activeDisableEvents];
  v21 = +[NSNumber numberWithInteger:a3];
  [v20 addObject:v21];

  if (!v19) {
    [(VIOSessionStateManager *)self disableSession];
  }
  __int16 v22 = [(VIOSessionStateManager *)self observers];
  [v22 disableEventReceived:a3];
}

- (void)resetSessionDisableEvent:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136316418;
        __int16 v26 = (VIOSessionStateManager *)"-[VIOSessionStateManager resetSessionDisableEvent:]";
        __int16 v27 = 2080;
        __int16 v28 = "VIOSessionStateManager.m";
        __int16 v29 = 1024;
        int v30 = 137;
        __int16 v31 = 2080;
        __int16 v32 = "dispatch_get_main_queue()";
        __int16 v33 = 2080;
        __int16 v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v35 = 2080;
        __int16 v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v25,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v23 = sub_1005762E4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = +[NSThread callStackSymbols];
          int v25 = 138412290;
          __int16 v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
  }
  objc_super v8 = [(VIOSessionStateManager *)self activeDisableEvents];
  v9 = +[NSNumber numberWithInteger:a3];
  unsigned int v10 = [v8 containsObject:v9];

  if (v10)
  {
    BOOL v11 = [(VIOSessionStateManager *)self activeDisableEvents];
    id v12 = [v11 count];

    CFStringRef v13 = [(VIOSessionStateManager *)self activeDisableEvents];
    CFStringRef v14 = +[NSNumber numberWithInteger:a3];
    [v13 removeObject:v14];

    CFStringRef v15 = [(VIOSessionStateManager *)self activeDisableEvents];
    id v16 = [v15 count];

    os_log_type_t v17 = sub_100A34FD0();
    int v18 = v17;
    if (v16 || !v12)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a3 - 1) > 9) {
          CFStringRef v20 = @"VIOSessionDisableEventLowPowerMode";
        }
        else {
          CFStringRef v20 = off_101314E70[a3 - 1];
        }
        int v25 = 134349314;
        __int16 v26 = self;
        __int16 v27 = 2112;
        __int16 v28 = (const char *)v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Resetting disable event of type %@", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(a3 - 1) > 9) {
          CFStringRef v19 = @"VIOSessionDisableEventLowPowerMode";
        }
        else {
          CFStringRef v19 = off_101314E70[a3 - 1];
        }
        int v25 = 134349314;
        __int16 v26 = self;
        __int16 v27 = 2112;
        __int16 v28 = (const char *)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Resetting the last disable event after type %@", (uint8_t *)&v25, 0x16u);
      }

      [(VIOSessionStateManager *)self resumeSession];
    }
    v21 = [(VIOSessionStateManager *)self observers];
    [v21 disableEventReset:a3];
  }
}

- (BOOL)isThrottling
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VIOSessionStateManager isThrottling]";
        __int16 v14 = 2080;
        CFStringRef v15 = "VIOSessionStateManager.m";
        __int16 v16 = 1024;
        int v17 = 159;
        __int16 v18 = 2080;
        CFStringRef v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  id v6 = [(VIOSessionStateManager *)self sessionRestartTimer];
  BOOL v7 = v6 != 0;

  return v7;
}

- (double)remainingThrottleTime
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      BOOL v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        CFStringRef v15 = "-[VIOSessionStateManager remainingThrottleTime]";
        __int16 v16 = 2080;
        int v17 = "VIOSessionStateManager.m";
        __int16 v18 = 1024;
        int v19 = 166;
        __int16 v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        int v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          CFStringRef v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  id v6 = [(VIOSessionStateManager *)self sessionRestartTimer];
  BOOL v7 = [v6 fireDate];
  [v7 timeIntervalSinceNow];
  double v9 = v8;

  return v9;
}

- (BOOL)isDisabled
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VIOSessionStateManager isDisabled]";
        __int16 v14 = 2080;
        CFStringRef v15 = "VIOSessionStateManager.m";
        __int16 v16 = 1024;
        int v17 = 173;
        __int16 v18 = 2080;
        int v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  id v6 = [(VIOSessionStateManager *)self activeDisableEvents];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (NSSet)disableEventReasons
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VIOSessionStateManager disableEventReasons]";
        __int16 v14 = 2080;
        CFStringRef v15 = "VIOSessionStateManager.m";
        __int16 v16 = 1024;
        int v17 = 180;
        __int16 v18 = 2080;
        int v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  id v6 = [(VIOSessionStateManager *)self activeDisableEvents];
  id v7 = [v6 copy];

  return (NSSet *)v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VIOSessionStateManager addObserver:]";
        __int16 v14 = 2080;
        CFStringRef v15 = "VIOSessionStateManager.m";
        __int16 v16 = 1024;
        int v17 = 187;
        __int16 v18 = 2080;
        int v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  double v8 = [(VIOSessionStateManager *)self observers];
  [v8 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VIOSessionStateManager removeObserver:]";
        __int16 v14 = 2080;
        CFStringRef v15 = "VIOSessionStateManager.m";
        __int16 v16 = 1024;
        int v17 = 194;
        __int16 v18 = 2080;
        int v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unsigned int v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          BOOL v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  double v8 = [(VIOSessionStateManager *)self observers];
  [v8 unregisterObserver:v4];
}

- (BOOL)isThrottlingOrDisabled
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      BOOL v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316418;
        BOOL v11 = "-[VIOSessionStateManager isThrottlingOrDisabled]";
        __int16 v12 = 2080;
        CFStringRef v13 = "VIOSessionStateManager.m";
        __int16 v14 = 1024;
        int v15 = 203;
        __int16 v16 = 2080;
        int v17 = "dispatch_get_main_queue()";
        __int16 v18 = 2080;
        int v19 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v10,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          double v9 = +[NSThread callStackSymbols];
          int v10 = 138412290;
          BOOL v11 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
  if ([(VIOSessionStateManager *)self isThrottling]) {
    return 1;
  }
  else {
    return [(VIOSessionStateManager *)self isDisabled];
  }
}

- (void)throttleSessionWithEventReason:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      int v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        int v25 = (VIOSessionStateManager *)"-[VIOSessionStateManager throttleSessionWithEventReason:]";
        __int16 v26 = 2080;
        __int16 v27 = "VIOSessionStateManager.m";
        __int16 v28 = 1024;
        int v29 = 210;
        __int16 v30 = 2080;
        __int16 v31 = "dispatch_get_main_queue()";
        __int16 v32 = 2080;
        __int16 v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v34 = 2080;
        __int16 v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          int v25 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  double v8 = sub_100A34FD0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = @"VIOSessionThrottleEventDeviceMotion";
    if (!a3) {
      CFStringRef v9 = @"VIOSessionThrottleEventARTrackingState";
    }
    *(_DWORD *)buf = 134349314;
    int v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = (const char *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Pausing VIO session with event reason: %@", buf, 0x16u);
  }

  [(VIOSessionStateManager *)self setThrottleEventReason:a3];
  int v10 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
  [v10 removeAllObjects];

  BOOL v11 = [(VIOSessionStateManager *)self session];
  __int16 v12 = [v11 technique];
  [v12 setVioThrottled:1];

  CFStringRef v13 = [(VIOSessionStateManager *)self session];
  [v13 pause];

  GEOConfigGetDouble();
  double v15 = v14;
  __int16 v16 = sub_100A34FD0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    int v25 = self;
    __int16 v26 = 2048;
    __int16 v27 = *(const char **)&v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Starting retry timer with interval: %f", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A37248;
  v22[3] = &unk_1012E7638;
  objc_copyWeak(&v23, (id *)buf);
  int v17 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v22 block:v15];
  [(VIOSessionStateManager *)self setSessionRestartTimer:v17];

  __int16 v18 = [(VIOSessionStateManager *)self observers];
  [v18 throttleDidBeginWithEvent:a3];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)disableSession
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      int v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316418;
        double v14 = (VIOSessionStateManager *)"-[VIOSessionStateManager disableSession]";
        __int16 v15 = 2080;
        __int16 v16 = "VIOSessionStateManager.m";
        __int16 v17 = 1024;
        int v18 = 236;
        __int16 v19 = 2080;
        __int16 v20 = "dispatch_get_main_queue()";
        __int16 v21 = 2080;
        __int16 v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          __int16 v12 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          double v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  id v6 = sub_100A34FD0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [(VIOSessionStateManager *)self disableEventReasons];
    int v13 = 134349314;
    double v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Disabling VIO session with event reasons: %@", (uint8_t *)&v13, 0x16u);
  }
  double v8 = [(VIOSessionStateManager *)self stateEnteredThrottleEventTimers];
  [v8 removeAllObjects];

  [(VIOSessionStateManager *)self setSessionRestartTimer:0];
  CFStringRef v9 = [(VIOSessionStateManager *)self session];
  [v9 pause];
}

- (void)resumeSession
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      BOOL v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        __int16 v15 = (VIOSessionStateManager *)"-[VIOSessionStateManager resumeSession]";
        __int16 v16 = 2080;
        __int16 v17 = "VIOSessionStateManager.m";
        __int16 v18 = 1024;
        int v19 = 248;
        __int16 v20 = 2080;
        __int16 v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        __int16 v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        int v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          __int16 v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  id v6 = sub_100A34FD0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 134349056;
    __int16 v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Resuming VIO session", (uint8_t *)&v14, 0xCu);
  }

  [(VIOSessionStateManager *)self setSessionRestartTimer:0];
  BOOL v7 = [(VIOSessionStateManager *)self session];
  double v8 = [(VIOSessionStateManager *)self configuration];
  [v7 runWithConfiguration:v8];

  CFStringRef v9 = [(VIOSessionStateManager *)self session];
  int v10 = [v9 technique];
  [v10 setVioThrottled:0];
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (ARSession *)WeakRetained;
}

- (ARConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)throttleEventReason
{
  return self->_throttleEventReason;
}

- (void)setThrottleEventReason:(int64_t)a3
{
  self->_throttleEventReason = a3;
}

- (GCDTimer)sessionRestartTimer
{
  return self->_sessionRestartTimer;
}

- (void)setSessionRestartTimer:(id)a3
{
}

- (NSMutableDictionary)stateEnteredThrottleEventTimers
{
  return self->_stateEnteredThrottleEventTimers;
}

- (void)setStateEnteredThrottleEventTimers:(id)a3
{
}

- (NSMutableSet)activeDisableEvents
{
  return self->_activeDisableEvents;
}

- (void)setActiveDisableEvents:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeDisableEvents, 0);
  objc_storeStrong((id *)&self->_stateEnteredThrottleEventTimers, 0);
  objc_storeStrong((id *)&self->_sessionRestartTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_session);
}

@end