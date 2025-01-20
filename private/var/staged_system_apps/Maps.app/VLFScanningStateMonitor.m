@interface VLFScanningStateMonitor
- (ARSession)session;
- (VLFScanningStateMonitor)initWithDelegate:(id)a3 session:(id)a4;
- (VLFScanningStateMonitorDelegate)delegate;
- (int64_t)currentState;
- (void)dealloc;
- (void)setCurrentState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation VLFScanningStateMonitor

- (VLFScanningStateMonitor)initWithDelegate:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[VLFScanningStateMonitor initWithDelegate:session:]";
      __int16 v20 = 2080;
      v21 = "VLFScanningStateMonitor.m";
      __int16 v22 = 1024;
      int v23 = 30;
      __int16 v24 = 2080;
      v25 = "delegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[VLFScanningStateMonitor initWithDelegate:session:]";
      __int16 v20 = 2080;
      v21 = "VLFScanningStateMonitor.m";
      __int16 v22 = 1024;
      int v23 = 31;
      __int16 v24 = 2080;
      v25 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)VLFScanningStateMonitor;
  v8 = [(VLFScanningStateMonitor *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_currentState = 1;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_session, a4);
    [(ARSession *)v9->_session _addObserver:v9];
  }

  return v9;
}

- (void)dealloc
{
  [(ARSession *)self->_session _removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFScanningStateMonitor;
  [(VLFScanningStateMonitor *)&v3 dealloc];
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (qword_10160FC18 != -1) {
      dispatch_once(&qword_10160FC18, &stru_1012FE818);
    }
    v4 = (id)qword_10160FC10;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      unint64_t v8 = self->_currentState - 2;
      if (v8 > 3) {
        CFStringRef v9 = @"VLFScanningStateInitializing";
      }
      else {
        CFStringRef v9 = *(&off_1012FE838 + v8);
      }
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      CFStringRef v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ changing state to: %@", (uint8_t *)&v11, 0x16u);
    }
    v10 = [(VLFScanningStateMonitor *)self delegate];
    [v10 scanningStateMonitor:self didChangeState:self->_currentState];
  }
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (VLFScanningStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VLFScanningStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end