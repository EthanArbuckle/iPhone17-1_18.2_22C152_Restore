@interface ADApplicationStateChangeEventListener
- (ADApplicationStateChangeEventListener)init;
- (void)applicationStateChanged:(id)a3;
- (void)dealloc;
@end

@implementation ADApplicationStateChangeEventListener

- (void)applicationStateChanged:(id)a3
{
  uint64_t v5 = mach_absolute_time();
  double v6 = *(double *)&qword_5070;
  if (*(double *)&qword_5070 == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    double v6 = (double)v7 / (double)v8 * 0.000000001;
    *(double *)&qword_5070 = v6;
  }
  id v9 = [a3 objectForKey:BKSApplicationStateProcessIDKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = (uint64_t)[v9 intValue];
  }
  else {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  uint64_t v11 = BKSApplicationStateDisplayIDKey;
  id v12 = [a3 objectForKey:BKSApplicationStateDisplayIDKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v12 isEqualToString:@"com.apple.webapp"] && (v10 & 0x80000000) == 0) {
      id v12 = objc_msgSend(-[BKSApplicationStateMonitor applicationInfoForPID:](self->_appStateMonitor, "applicationInfoForPID:", v10), "objectForKeyedSubscript:", v11);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [a3 objectForKey:BKSApplicationStateKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v14 = v6 * (double)v5;
        unsigned int v15 = [v13 intValue];
        if (v15 == 32) {
          int v16 = 8;
        }
        else {
          int v16 = v15;
        }
        [a3 objectForKey:BKSApplicationStateExtensionKey];
        session_queue = self->_session_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1DE0;
        block[3] = &unk_41E0;
        block[4] = self;
        block[5] = v12;
        *(double *)&block[6] = v14;
        int v19 = v16;
        int v20 = v10;
        dispatch_async(session_queue, block);
      }
    }
  }
}

- (ADApplicationStateChangeEventListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADApplicationStateChangeEventListener;
  v2 = [(ADApplicationStateChangeEventListener *)&v9 init];
  if (v2)
  {
    gADEventListenerLogObject = (uint64_t)os_log_create("com.apple.osanalytics.aggd_event_listener", "default");
    v2->_activeBundles = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v2->_session_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ADSessionSync", v3);
    v4 = (BKSApplicationStateMonitor *)objc_alloc_init((Class)BKSApplicationStateMonitor);
    v2->_appStateMonitor = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1E74;
    v8[3] = &unk_4190;
    v8[4] = v2;
    [(BKSApplicationStateMonitor *)v4 setHandler:v8];
    session_queue = v2->_session_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_27CC;
    v7[3] = &unk_41B8;
    v7[4] = v2;
    notify_register_dispatch("com.apple.session.dump", (int *)&unk_5068, session_queue, v7);
  }
  return v2;
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_appStateMonitor setHandler:0];

  dispatch_release((dispatch_object_t)self->_session_queue);
  v3.receiver = self;
  v3.super_class = (Class)ADApplicationStateChangeEventListener;
  [(ADApplicationStateChangeEventListener *)&v3 dealloc];
}

@end