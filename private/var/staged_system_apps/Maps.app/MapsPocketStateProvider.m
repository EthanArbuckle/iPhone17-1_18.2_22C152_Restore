@interface MapsPocketStateProvider
- (MapsPocketStateProvider)initWithDelegate:(id)a3;
- (void)_enqueueNewState:(int64_t)a3;
- (void)_fireStateUpdate:(int64_t)a3;
- (void)dealloc;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
@end

@implementation MapsPocketStateProvider

- (MapsPocketStateProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsPocketStateProvider;
  v5 = [(MapsPocketStateProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    if (+[CMPocketStateManager isPocketStateAvailable])
    {
      uint64_t v7 = objc_opt_new();
      manager = v6->_manager;
      v6->_manager = (CMPocketStateManager *)v7;

      [(CMPocketStateManager *)v6->_manager setDelegate:v6];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(CMPocketStateManager *)self->_manager setDelegate:0];
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsPocketStateProvider;
  [(MapsPocketStateProvider *)&v4 dealloc];
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  id v6 = a3;
  if (qword_101610310 != -1) {
    dispatch_once(&qword_101610310, &stru_1013131E0);
  }
  uint64_t v7 = (void *)qword_101610308;
  if (os_log_type_enabled((os_log_t)qword_101610308, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a4 > 4) {
      CFStringRef v8 = @"Unknown";
    }
    else {
      CFStringRef v8 = *(&off_101313200 + a4);
    }
    *(_DWORD *)buf = 136315906;
    v13 = "-[MapsPocketStateProvider pocketStateManager:didUpdateState:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    __int16 v18 = 2114;
    CFStringRef v19 = v8;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s, manager: %{public}@ pocket state change: %ld (%{public}@)", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009BD7CC;
  v10[3] = &unk_1012F0708;
  objc_copyWeak(v11, (id *)buf);
  v11[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)buf);
}

- (void)_enqueueNewState:(int64_t)a3
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009BD920;
  v8[3] = &unk_1013131C0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  id v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:10.0];
  uint64_t v7 = self->_updateTimer;
  self->_updateTimer = v6;

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_fireStateUpdate:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didUpdatePocketStateType:a3];

  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end