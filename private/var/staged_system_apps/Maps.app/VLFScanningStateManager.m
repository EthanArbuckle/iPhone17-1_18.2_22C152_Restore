@interface VLFScanningStateManager
- (ARSession)session;
- (GCDTimer)initializingTimer;
- (OS_os_activity)activity;
- (VLFScanningStateCameraMotionMonitor)cameraMotionMonitor;
- (VLFScanningStateCameraPitchMonitor)cameraPitchMonitor;
- (VLFScanningStateManager)initWithSession:(id)a3 delegate:(id)a4;
- (VLFScanningStateManagerDelegate)delegate;
- (int64_t)currentState;
- (void)_createMonitors;
- (void)_recalculateState;
- (void)_start;
- (void)scanningStateMonitor:(id)a3 didChangeState:(int64_t)a4;
- (void)setActivity:(id)a3;
- (void)setCameraMotionMonitor:(id)a3;
- (void)setCameraPitchMonitor:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInitializingTimer:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation VLFScanningStateManager

- (VLFScanningStateManager)initWithSession:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)state = 136315906;
      *(void *)&state[4] = "-[VLFScanningStateManager initWithSession:delegate:]";
      *(_WORD *)&state[12] = 2080;
      *(void *)&state[14] = "VLFScanningStateManager.m";
      __int16 v23 = 1024;
      int v24 = 46;
      __int16 v25 = 2080;
      v26 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", state, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = +[NSThread callStackSymbols];
        *(_DWORD *)state = 138412290;
        *(void *)&state[4] = v15;
        v16 = (void *)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);
      }
    }
  }
  if (!v8)
  {
    v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)state = 136315906;
      *(void *)&state[4] = "-[VLFScanningStateManager initWithSession:delegate:]";
      *(_WORD *)&state[12] = 2080;
      *(void *)&state[14] = "VLFScanningStateManager.m";
      __int16 v23 = 1024;
      int v24 = 47;
      __int16 v25 = 2080;
      v26 = "delegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", state, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = +[NSThread callStackSymbols];
        *(_DWORD *)state = 138412290;
        *(void *)&state[4] = v19;
        v20 = (void *)v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)VLFScanningStateManager;
  v9 = [(VLFScanningStateManager *)&v21 init];
  if (v9)
  {
    os_activity_t v10 = _os_activity_create((void *)&_mh_execute_header, "Visual Localization", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    [(VLFScanningStateManager *)v9 setActivity:v10];

    *(void *)state = 0;
    *(void *)&state[8] = 0;
    v11 = [(VLFScanningStateManager *)v9 activity];
    os_activity_scope_enter(v11, (os_activity_scope_state_t)state);

    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v9->_session, a3);
    v9->_currentState = 1;
    [(VLFScanningStateManager *)v9 _createMonitors];
    [(VLFScanningStateManager *)v9 _start];
    os_activity_scope_leave((os_activity_scope_state_t)state);
  }

  return v9;
}

- (void)_createMonitors
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = [(VLFScanningStateManager *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"VLFSessionScanningEnableCameraMotionMonitorKey"];

  v6 = sub_10074D238();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Creating camera motion monitor", v14, 2u);
    }

    id v8 = [VLFScanningStateCameraMotionMonitor alloc];
    v6 = [(VLFScanningStateManager *)self session];
    v9 = [(VLFScanningStateMonitor *)v8 initWithDelegate:self session:v6];
    [(VLFScanningStateManager *)self setCameraMotionMonitor:v9];
  }
  else if (v7)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not creating camera motion monitor", v14, 2u);
  }

  os_activity_t v10 = sub_10074D238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating camera pitch monitor", v14, 2u);
  }

  v11 = [VLFScanningStateCameraPitchMonitor alloc];
  v12 = [(VLFScanningStateManager *)self session];
  v13 = [(VLFScanningStateCameraPitchMonitor *)v11 initWithDelegate:self session:v12];
  [(VLFScanningStateManager *)self setCameraPitchMonitor:v13];

  os_activity_scope_leave(&state);
}

- (void)_start
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = [(VLFScanningStateManager *)self activity];
  os_activity_scope_enter(v3, &state);

  GEOConfigGetDouble();
  double v5 = v4;
  v6 = sub_10074D238();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 <= 0.0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialization delay is 0 seconds; going straight to .Scanning state",
        buf,
        2u);
    }

    [(VLFScanningStateManager *)self setCurrentState:2];
    [(VLFScanningStateManager *)self _recalculateState];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting initializing timer with delay %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v8 = &_dispatch_main_q;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10074D4C0;
    v10[3] = &unk_1012E7638;
    objc_copyWeak(&v11, (id *)buf);
    v9 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v10 block:v5];
    [(VLFScanningStateManager *)self setInitializingTimer:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)_recalculateState
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_activity_scope_state_s state = 136316418;
        *(void *)&state[4] = "-[VLFScanningStateManager _recalculateState]";
        *(_WORD *)&state[12] = 2080;
        *(void *)&state[14] = "VLFScanningStateManager.m";
        __int16 v23 = 1024;
        int v24 = 110;
        __int16 v25 = 2080;
        v26 = "dispatch_get_main_queue()";
        __int16 v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          state,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = +[NSThread callStackSymbols];
          *(_DWORD *)os_activity_scope_state_s state = 138412290;
          *(void *)&state[4] = v19;
          v20 = (void *)v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);
        }
      }
    }
  }
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  v6 = [(VLFScanningStateManager *)self activity];
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);

  BOOL v7 = [(VLFScanningStateManager *)self cameraMotionMonitor];
  if (v7)
  {
    id v8 = [(VLFScanningStateManager *)self cameraMotionMonitor];
    BOOL v9 = [v8 currentState] == (id)2;

    if (!v9)
    {
      uint64_t v15 = sub_10074D238();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Camera motion monitor detected device is moving too fast; updating state",
          v21,
          2u);
      }

      double v14 = [(VLFScanningStateManager *)self cameraMotionMonitor];
      -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", [v14 currentState]);
      goto LABEL_18;
    }
  }
  os_activity_t v10 = [(VLFScanningStateManager *)self cameraPitchMonitor];
  if ([v10 currentState] == (id)5)
  {

LABEL_12:
    v13 = sub_10074D238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Camera pitch monitor detected device is tilted too much; updating state",
        v21,
        2u);
    }

    double v14 = [(VLFScanningStateManager *)self cameraPitchMonitor];
    -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", [v14 currentState]);
LABEL_18:

    goto LABEL_19;
  }
  id v11 = [(VLFScanningStateManager *)self cameraPitchMonitor];
  BOOL v12 = [v11 currentState] == (id)4;

  if (v12) {
    goto LABEL_12;
  }
  v16 = sub_10074D238();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "None of the monitors detected anything; updating state",
      v21,
      2u);
  }

  [(VLFScanningStateManager *)self setCurrentState:2];
LABEL_19:
  os_activity_scope_leave((os_activity_scope_state_t)state);
}

- (void)setCurrentState:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_activity_scope_state_s state = 136316418;
        *(void *)&state[4] = "-[VLFScanningStateManager setCurrentState:]";
        *(_WORD *)&state[12] = 2080;
        *(void *)&state[14] = "VLFScanningStateManager.m";
        __int16 v20 = 1024;
        int v21 = 128;
        __int16 v22 = 2080;
        __int16 v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        __int16 v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        __int16 v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          state,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = +[NSThread callStackSymbols];
          *(_DWORD *)os_activity_scope_state_s state = 138412290;
          *(void *)&state[4] = v15;
          v16 = (void *)v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);
        }
      }
    }
  }
  if (self->_currentState != a3)
  {
    *(void *)os_activity_scope_state_s state = 0;
    *(void *)&state[8] = 0;
    id v8 = [(VLFScanningStateManager *)self activity];
    os_activity_scope_enter(v8, (os_activity_scope_state_t)state);

    self->_currentState = a3;
    BOOL v9 = sub_10074D238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = self->_currentState - 2;
      if (v10 > 3) {
        CFStringRef v11 = @"VLFScanningStateInitializing";
      }
      else {
        CFStringRef v11 = *(&off_1012F75B8 + v10);
      }
      int v17 = 138412290;
      CFStringRef v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Changing state to: %@", (uint8_t *)&v17, 0xCu);
    }

    BOOL v12 = [(VLFScanningStateManager *)self delegate];
    [v12 scanningStateManager:self didChangeState:self->_currentState];

    os_activity_scope_leave((os_activity_scope_state_t)state);
  }
}

- (void)scanningStateMonitor:(id)a3 didChangeState:(int64_t)a4
{
  v6 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      double v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v20 = "-[VLFScanningStateManager scanningStateMonitor:didChangeState:]";
        __int16 v21 = 2080;
        __int16 v22 = "VLFScanningStateManager.m";
        __int16 v23 = 1024;
        int v24 = 147;
        __int16 v25 = 2080;
        __int16 v26 = "dispatch_get_main_queue()";
        __int16 v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        uint64_t v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v20 = (const char *)v16;
          int v17 = (void *)v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  unint64_t v10 = [(VLFScanningStateManager *)self activity];
  os_activity_scope_enter(v10, &v18);

  CFStringRef v11 = sub_10074D238();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 2) > 3) {
      CFStringRef v12 = @"VLFScanningStateInitializing";
    }
    else {
      CFStringRef v12 = *(&off_1012F75B8 + a4 - 2);
    }
    *(_DWORD *)buf = 138412546;
    __int16 v20 = v6;
    __int16 v21 = 2112;
    __int16 v22 = (const char *)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ changed its state to %@", buf, 0x16u);
  }

  if ((id)[(VLFScanningStateManager *)self currentState] == (id)1)
  {
    v13 = sub_10074D238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "We haven't finished initializing yet; delaying state update",
        buf,
        2u);
    }
  }
  else
  {
    [(VLFScanningStateManager *)self _recalculateState];
  }
  os_activity_scope_leave(&v18);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (GCDTimer)initializingTimer
{
  return self->_initializingTimer;
}

- (void)setInitializingTimer:(id)a3
{
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (VLFScanningStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VLFScanningStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VLFScanningStateCameraMotionMonitor)cameraMotionMonitor
{
  return self->_cameraMotionMonitor;
}

- (void)setCameraMotionMonitor:(id)a3
{
}

- (VLFScanningStateCameraPitchMonitor)cameraPitchMonitor
{
  return self->_cameraPitchMonitor;
}

- (void)setCameraPitchMonitor:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_cameraPitchMonitor, 0);
  objc_storeStrong((id *)&self->_cameraMotionMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_initializingTimer, 0);
}

@end