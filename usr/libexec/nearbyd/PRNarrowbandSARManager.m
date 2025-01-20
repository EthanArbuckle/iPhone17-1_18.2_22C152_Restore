@interface PRNarrowbandSARManager
- (BOOL)clearSARStateOverride;
- (BOOL)injectNarrowbandSARState:(int)a3;
- (BOOL)startMonitoring;
- (PRNarrowbandSARManager)initWithQueue:(id)a3 stateChangeHandler:(id)a4;
- (id).cxx_construct;
- (id)printableStateOnQueue;
- (id)stateChangeHandler;
- (int)audioRouteToSARState:(int)a3;
- (int)checkCurrentAudioRoute;
- (unsigned)getCurrentSARIndexOnQueue;
- (unsigned)nbSARStateToSARIndex:(int)a3;
- (void)audioRouteChanged:(id)a3;
- (void)dealloc;
- (void)initNarrowbandSARListner;
- (void)setStateChangeHandler:(id)a3;
- (void)stopMonitoring;
- (void)updateSARStateIfRequired;
@end

@implementation PRNarrowbandSARManager

- (PRNarrowbandSARManager)initWithQueue:(id)a3 stateChangeHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRNarrowbandSARMonitor.mm", 83, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PRNarrowbandSARManager;
  v10 = [(PRNarrowbandSARManager *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    fNotificationCenter = v11->_fNotificationCenter;
    v11->_fNotificationCenter = 0;

    *(_WORD *)&v11->_monitoring = 0;
    if (v11->_overrideSARState.__engaged_) {
      v11->_overrideSARState.__engaged_ = 0;
    }
    v11->_systemSARState = 0;
    id v13 = objc_retainBlock(v9);
    id stateChangeHandler = v11->_stateChangeHandler;
    v11->_id stateChangeHandler = v13;
  }
  return v11;
}

- (void)dealloc
{
  [(PRNarrowbandSARManager *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)PRNarrowbandSARManager;
  [(PRNarrowbandSARManager *)&v3 dealloc];
}

- (void)initNarrowbandSARListner
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  fNotificationCenter = self->_fNotificationCenter;
  self->_fNotificationCenter = v3;

  v5 = self->_fNotificationCenter;
  id v6 = +[AVAudioSession sharedInstance];
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "audioRouteChanged:", AVAudioSessionRouteChangeNotification);
}

- (BOOL)startMonitoring
{
  if (!self->_monitoring)
  {
    objc_super v3 = qword_1008A7930;
    if (os_log_type_enabled((os_log_t)qword_1008A7930, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nb-sar,starting monitoring", buf, 2u);
    }
    v4 = +[NSUserDefaults standardUserDefaults];
    v5 = [v4 stringForKey:@"NBSARStateMonitorOverride"];

    if (!v5) {
      goto LABEL_13;
    }
    id v6 = v5;
    if ([v6 isEqualToString:@"failsafe"])
    {
      uint64_t v7 = 0;
    }
    else
    {
      if (([v6 isEqualToString:@"head"] & 1) == 0)
      {
        unsigned int v11 = [v6 isEqualToString:@"body"];
        if (v11) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 0;
        }

        if (!v11)
        {
LABEL_13:
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002AB584;
          block[3] = &unk_1008473B0;
          block[4] = self;
          dispatch_async((dispatch_queue_t)queue, block);
          self->_monitoring = 1;

          return 1;
        }
LABEL_10:
        id v8 = qword_1008A7930;
        if (os_log_type_enabled((os_log_t)qword_1008A7930, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nb-sar,injecting state from defaults", buf, 2u);
        }
        [(PRNarrowbandSARManager *)self injectNarrowbandSARState:v7];
        goto LABEL_13;
      }
      uint64_t v7 = 1;
    }

    goto LABEL_10;
  }
  return 1;
}

- (void)stopMonitoring
{
  if (self->_monitoring)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002AB648;
    block[3] = &unk_1008473B0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
    self->_monitoring = 0;
  }
}

- (void)audioRouteChanged:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AB770;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (int)checkCurrentAudioRoute
{
  v2 = +[AVAudioSession sharedInstance];
  objc_super v3 = [v2 currentRoute];

  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    [v3 outputs];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) portType];
          unsigned __int8 v9 = [v8 isEqualToString:AVAudioSessionPortBuiltInReceiver];

          if (v9)
          {
            int v10 = 1;
            goto LABEL_12;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    int v10 = 2;
LABEL_12:
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)updateSARStateIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(PRNarrowbandSARManager *)self checkCurrentAudioRoute];
  v4 = (id)qword_1008A7930;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(__p, (&off_10085D890)[(int)v3]);
    id v5 = v16 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nb-sar,audio route: %s", buf, 0xCu);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
  }

  uint64_t v6 = [(PRNarrowbandSARManager *)self audioRouteToSARState:v3];
  uint64_t v7 = v6;
  if (!self->_sarStateInitialized || self->_systemSARState != v6)
  {
    self->_sarStateInitialized = 1;
    self->_systemSARState = v6;
    if (self->_overrideSARState.__engaged_)
    {
      id v8 = (id)qword_1008A7930;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (!self->_overrideSARState.__engaged_) {
          sub_10000AE44();
        }
        sub_100004950(__p, (&off_10085D8A8)[self->_overrideSARState.var0.__val_]);
        int v9 = v16;
        int v10 = (void **)__p[0];
        sub_100004950(buf, (&off_10085D8A8)[(int)v7]);
        unsigned int v11 = __p;
        if (v9 < 0) {
          unsigned int v11 = v10;
        }
        if (v18 >= 0) {
          long long v12 = buf;
        }
        else {
          long long v12 = *(unsigned char **)buf;
        }
        *(_DWORD *)v19 = 136315394;
        v20 = v11;
        __int16 v21 = 2080;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nb-sar,SAR override %s - ignoring SAR state  : %s", v19, 0x16u);
        if (v18 < 0) {
          operator delete(*(void **)buf);
        }
        if (v16 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    else if (self->_stateChangeHandler)
    {
      long long v13 = (id)qword_1008A7930;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        sub_100004950(__p, (&off_10085D8A8)[(int)v7]);
        long long v14 = v16 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#nb-sar,updated SAR state: %s", buf, 0xCu);
        if (v16 < 0) {
          operator delete(__p[0]);
        }
      }

      (*((void (**)(id, void))self->_stateChangeHandler + 2))(self->_stateChangeHandler, [(PRNarrowbandSARManager *)self nbSARStateToSARIndex:v7]);
    }
  }
}

- (unsigned)getCurrentSARIndexOnQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = 28;
  if (!self->_overrideSARState.__engaged_) {
    uint64_t v3 = 36;
  }
  uint64_t v4 = *(unsigned int *)((char *)&self->super.isa + v3);

  return [(PRNarrowbandSARManager *)self nbSARStateToSARIndex:v4];
}

- (id)printableStateOnQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = objc_opt_new();
  BOOL monitoring = self->_monitoring;
  BOOL sarStateInitialized = self->_sarStateInitialized;
  sub_100004950(v13, (&off_10085D8A8)[self->_systemSARState]);
  if (v14 >= 0) {
    uint64_t v6 = v13;
  }
  else {
    uint64_t v6 = (void **)v13[0];
  }
  BOOL engaged = self->_overrideSARState.__engaged_;
  if (self->_overrideSARState.__engaged_)
  {
    sub_100004950(__p, (&off_10085D8A8)[self->_overrideSARState.var0.__val_]);
    if (v12 >= 0) {
      id v8 = __p;
    }
    else {
      id v8 = (void **)__p[0];
    }
  }
  else
  {
    id v8 = (void **)"-";
  }
  int v9 = +[NSString stringWithFormat:@"Monitoring: %d. State initialized: %d. System state: %s. Override state: %s", monitoring, sarStateInitialized, v6, v8];
  [v3 addObject:v9];

  if (engaged && v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }

  return v3;
}

- (BOOL)injectNarrowbandSARState:(int)a3
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002ABE80;
  v5[3] = &unk_100857CC8;
  v5[4] = self;
  int v6 = a3;
  dispatch_async((dispatch_queue_t)queue, v5);
  return 1;
}

- (BOOL)clearSARStateOverride
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AC04C;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
  return 1;
}

- (int)audioRouteToSARState:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (unsigned)nbSARStateToSARIndex:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)stateChangeHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setStateChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeHandler, 0);
  objc_storeStrong((id *)&self->_fNotificationCenter, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 28) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end