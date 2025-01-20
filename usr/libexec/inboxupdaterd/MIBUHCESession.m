@interface MIBUHCESession
- (BOOL)_endHCESession:(id *)a3 expected:(BOOL)a4;
- (BOOL)running;
- (BOOL)suppressLogging;
- (MIBUHCESession)initWithDelegate:(id)a3;
- (MIBUHCESessionDelegate)delegate;
- (NFHCESession)session;
- (NFHardwareManager)manager;
- (NSCondition)sessionLock;
- (NSMutableData)pendingAPDU;
- (NSOperationQueue)queue;
- (id)_handleAPDU:(id)a3;
- (unint64_t)sessionState;
- (void)_changeSessionState:(unint64_t)a3;
- (void)_hceSessionDidEnd:(id)a3;
- (void)_hceSessionDidStart:(id)a3 error:(id)a4;
- (void)_listenToCommand;
- (void)_startHCESessionWithCompletion:(id)a3;
- (void)endHCESession:(id *)a3;
- (void)hceSessionDidConnect:(id)a3;
- (void)hceSessionDidDisconnect:(id)a3;
- (void)hceSessionDidEndUnexpectedly:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
- (void)setPendingAPDU:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionLock:(id)a3;
- (void)setSessionState:(unint64_t)a3;
- (void)setSuppressLogging:(BOOL)a3;
- (void)startHCESessionWithCompletion:(id)a3;
- (void)startListening:(id *)a3;
- (void)stopListening;
- (void)waitForTermination:(id *)a3;
@end

@implementation MIBUHCESession

- (MIBUHCESession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MIBUHCESession;
  v5 = [(MIBUHCESession *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUHCESession *)v5 setDelegate:v4];
    [(MIBUHCESession *)v6 setSession:0];
    v7 = objc_opt_new();
    [(MIBUHCESession *)v6 setSessionLock:v7];

    [(MIBUHCESession *)v6 setSessionState:0];
    v8 = objc_opt_new();
    [(MIBUHCESession *)v6 setPendingAPDU:v8];

    v9 = +[NFHardwareManager sharedHardwareManagerWithNoUI];
    [(MIBUHCESession *)v6 setManager:v9];

    id v10 = objc_alloc_init((Class)NSOperationQueue);
    [(MIBUHCESession *)v6 setQueue:v10];

    v11 = [(MIBUHCESession *)v6 queue];
    [v11 setMaxConcurrentOperationCount:1];

    v12 = [(MIBUHCESession *)v6 queue];
    [v12 setName:@"com.apple.mobileinboxupdate.session_queue"];
  }
  return v6;
}

- (void)startHCESessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = [(MIBUHCESession *)self sessionLock];
  [v5 lock];

  if ([(MIBUHCESession *)self sessionState])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058980);
    }
    v6 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      int v9 = 134217984;
      unint64_t v10 = [(MIBUHCESession *)self sessionState];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session already active", (uint8_t *)&v9, 0xCu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    [(MIBUHCESession *)self _startHCESessionWithCompletion:v4];
  }
  v8 = [(MIBUHCESession *)self sessionLock];
  [v8 unlock];
}

- (void)endHCESession:(id *)a3
{
  v5 = [(MIBUHCESession *)self sessionLock];
  [v5 lock];

  if ([(MIBUHCESession *)self sessionState])
  {
    id v10 = 0;
    [(MIBUHCESession *)self _endHCESession:&v10 expected:1];
    id v6 = v10;
    if (a3) {
LABEL_3:
    }
      *a3 = v6;
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000589A0);
    }
    v8 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      *(_DWORD *)buf = 134217984;
      unint64_t v12 = [(MIBUHCESession *)self sessionState];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session already ended", buf, 0xCu);
    }
    id v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  v7 = [(MIBUHCESession *)self sessionLock];
  [v7 unlock];
}

- (void)startListening:(id *)a3
{
  v5 = [(MIBUHCESession *)self sessionLock];
  [v5 lock];

  objc_initWeak(&location, self);
  if ((id)[(MIBUHCESession *)self sessionState] == (id)2)
  {
    id v6 = [(MIBUHCESession *)self queue];
    BOOL v7 = [v6 operationCount] == 0;

    if (v7)
    {
      v8 = [(MIBUHCESession *)self queue];
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      v21 = sub_1000053E4;
      v22 = &unk_100058A28;
      v23 = self;
      objc_copyWeak(&v24, &location);
      int v9 = +[NSBlockOperation blockOperationWithBlock:&v19];
      [v8 addOperation:v9, v19, v20, v21, v22, v23];

      objc_destroyWeak(&v24);
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000589E0);
      }
      v18 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "HCE Session already listening", buf, 2u);
      }
    }
    id v10 = 0;
    if (a3) {
LABEL_5:
    }
      *a3 = v10;
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000589C0);
    }
    unint64_t v12 = (id)qword_10006C950;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(MIBUHCESession *)self sessionState];
      *(_DWORD *)buf = 134217984;
      unint64_t v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session cannot start listening", buf, 0xCu);
    }

    id v25 = 0;
    sub_1000102B8(&v25, 83886080, 0, @"Cannot start listening for NFC commands", v14, v15, v16, v17, (uint64_t)v19);
    id v10 = v25;
    if (a3) {
      goto LABEL_5;
    }
  }
  v11 = [(MIBUHCESession *)self sessionLock];
  [v11 unlock];

  objc_destroyWeak(&location);
}

- (void)stopListening
{
  v3 = [(MIBUHCESession *)self sessionLock];
  [v3 lock];

  unint64_t v4 = [(MIBUHCESession *)self sessionState];
  unsigned __int8 v5 = [(MIBUHCESession *)self suppressLogging];
  if (v4 < 2)
  {
    if ((v5 & 1) == 0)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058A68);
      }
      BOOL v7 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session is already terminated or cancelling, do nothing", v9, 2u);
      }
    }
  }
  else
  {
    if ((v5 & 1) == 0)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058A48);
      }
      id v6 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Signaling session thread to stop...", buf, 2u);
      }
    }
    [(MIBUHCESession *)self _changeSessionState:1];
  }
  v8 = [(MIBUHCESession *)self sessionLock];
  [v8 unlock];
}

- (BOOL)running
{
  v3 = [(MIBUHCESession *)self sessionLock];
  [v3 lock];

  LOBYTE(v3) = [(MIBUHCESession *)self sessionState] != 0;
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 unlock];

  return (char)v3;
}

- (void)waitForTermination:(id *)a3
{
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 lock];

  if ([(MIBUHCESession *)self sessionState])
  {
    *(void *)&long long v5 = 134217984;
    long long v12 = v5;
    do
    {
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058A88);
        }
        id v6 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v7 = v6;
          unint64_t v8 = [(MIBUHCESession *)self sessionState];
          *(_DWORD *)buf = v12;
          unint64_t v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current session state is %ld; waiting for session to terminate...",
            buf,
            0xCu);
        }
      }
      int v9 = [(MIBUHCESession *)self sessionLock];
      [v9 wait];
    }
    while ([(MIBUHCESession *)self sessionState]);
  }
  if (![(MIBUHCESession *)self suppressLogging])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058AA8);
    }
    id v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HCE session termination wait successful", buf, 2u);
    }
  }
  [(MIBUHCESession *)self setSession:0];
  v11 = [(MIBUHCESession *)self sessionLock];
  [v11 unlock];
}

- (void)hceSessionDidEndUnexpectedly:(id)a3
{
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 lock];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100058AC8);
  }
  long long v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003DA78(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  [(MIBUHCESession *)self _changeSessionState:0];
  unint64_t v13 = [(MIBUHCESession *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(MIBUHCESession *)self delegate];
    [v15 sessionDidEndUnexpectedly:self];
  }
  uint64_t v16 = [(MIBUHCESession *)self sessionLock];
  [v16 unlock];
}

- (void)hceSessionDidConnect:(id)a3
{
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 lock];

  if ([(MIBUHCESession *)self sessionState] >= 2)
  {
    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058AE8);
      }
      long long v5 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HCE session connected!", v10, 2u);
      }
    }
    [(MIBUHCESession *)self _changeSessionState:3];
    uint64_t v6 = [(MIBUHCESession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(MIBUHCESession *)self delegate];
      [v8 sessionDidConnect:self];
    }
  }
  uint64_t v9 = [(MIBUHCESession *)self sessionLock];
  [v9 unlock];
}

- (void)hceSessionDidDisconnect:(id)a3
{
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 lock];

  if ([(MIBUHCESession *)self sessionState] >= 2)
  {
    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058B08);
      }
      long long v5 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HCE session disconnected", v10, 2u);
      }
    }
    [(MIBUHCESession *)self _changeSessionState:2];
    uint64_t v6 = [(MIBUHCESession *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(MIBUHCESession *)self delegate];
      [v8 sessionDidDisconnect:self];
    }
  }
  uint64_t v9 = [(MIBUHCESession *)self sessionLock];
  [v9 unlock];
}

- (void)_hceSessionDidStart:(id)a3 error:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MIBUHCESession *)self sessionLock];
  [v6 lock];

  if (!v5)
  {
    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058B28);
      }
      char v7 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HCE Session started!", v12, 2u);
      }
    }
    [(MIBUHCESession *)self _changeSessionState:2];
  }
  uint64_t v8 = [(MIBUHCESession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(MIBUHCESession *)self delegate];
    [v10 sessionDidStart:self withError:v5];
  }
  uint64_t v11 = [(MIBUHCESession *)self sessionLock];
  [v11 unlock];
}

- (void)_hceSessionDidEnd:(id)a3
{
  unint64_t v4 = [(MIBUHCESession *)self sessionLock];
  [v4 lock];

  [(MIBUHCESession *)self _changeSessionState:0];
  id v5 = [(MIBUHCESession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(MIBUHCESession *)self delegate];
    [v7 sessionDidEnd:self];
  }
  id v8 = [(MIBUHCESession *)self sessionLock];
  [v8 unlock];
}

- (void)_changeSessionState:(unint64_t)a3
{
  if (![(MIBUHCESession *)self suppressLogging])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058B48);
    }
    id v5 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = v5;
      int v8 = 134218240;
      unint64_t v9 = [(MIBUHCESession *)self sessionState];
      __int16 v10 = 2048;
      unint64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing HCE session state from: %ld to: %ld", (uint8_t *)&v8, 0x16u);
    }
  }
  [(MIBUHCESession *)self setSessionState:a3];
  char v7 = [(MIBUHCESession *)self sessionLock];
  [v7 signal];
}

- (void)_startHCESessionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unint64_t v28 = sub_1000065AC;
  v29 = sub_1000065BC;
  id v30 = 0;
  id v5 = [(MIBUHCESession *)self manager];
  unsigned int v6 = [v5 getHwSupport];

  if (v6 == 2)
  {
    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058B88);
      }
      char v7 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting HCE Session ...", buf, 2u);
      }
    }
    int v8 = +[NFHardwareManager sharedHardwareManagerWithNoUI];
    v19[0] = (uint64_t)_NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = (uint64_t)sub_100006694;
    v19[3] = (uint64_t)&unk_100058C30;
    objc_copyWeak(&v22, &location);
    v21 = &v25;
    v19[4] = (uint64_t)self;
    id v20 = v4;
    id v9 = [v8 startHCESession:v19];

    objc_destroyWeak(&v22);
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058B68);
    }
    __int16 v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DAB0(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = (id *)(v26 + 5);
    id obj = (id)v26[5];
    sub_1000102B8(&obj, 83886085, 0, @"Device does not support NearField", v14, v15, v16, v17, v19[0]);
    objc_storeStrong(v18, obj);
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, v26[5]);
    }
  }
  _Block_object_dispose(&v25, 8);

  objc_destroyWeak(&location);
}

- (BOOL)_endHCESession:(id *)a3 expected:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(MIBUHCESession *)self suppressLogging])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058C50);
    }
    char v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopping Emulation...", buf, 2u);
    }
  }
  int v8 = [(MIBUHCESession *)self session];
  id v9 = [v8 stopEmulation];

  if (![(MIBUHCESession *)self suppressLogging])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058C70);
    }
    __int16 v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ending HCE Session; expected=%d...", buf, 8u);
    }
  }
  uint64_t v11 = [(MIBUHCESession *)self session];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006E80;
  v13[3] = &unk_100058C98;
  BOOL v14 = v4;
  v13[4] = self;
  [v11 endSessionWithCompletion:v13];

  if (a3) {
    *a3 = v9;
  }

  return v9 == 0;
}

- (void)_listenToCommand
{
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_1000065AC;
  v44 = sub_1000065BC;
  id v45 = 0;
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = sub_1000065AC;
  v38[3] = sub_1000065BC;
  id v39 = 0;
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  dispatch_time_t v3 = dispatch_time(0, 55000000000);
  id v4 = 0;
  while (1)
  {
    id v5 = [(MIBUHCESession *)self sessionLock];
    [v5 lock];
    while (1)
    {

      unint64_t v6 = [(MIBUHCESession *)self sessionState];
      BOOL v7 = v6 != 2;
      if (v6 != 2) {
        break;
      }
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058CB8);
        }
        int v8 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Waiting to connect to reader ...", buf, 2u);
        }
      }
      id v5 = +[NSDate dateWithTimeIntervalSinceNow:55.0];
      id v9 = [(MIBUHCESession *)self sessionLock];
      unsigned __int8 v10 = [v9 waitUntilDate:v5];

      if ((v10 & 1) == 0)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058CD8);
        }
        id v22 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = 55;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Wait reader connection timed out after %ds", buf, 8u);
        }
        v23 = [(MIBUHCESession *)self sessionLock];
        [v23 unlock];

        goto LABEL_53;
      }
      dispatch_time_t v3 = dispatch_time(0, 55000000000);
    }
    uint64_t v11 = [(MIBUHCESession *)self sessionLock];
    [v11 unlock];

    if ([(MIBUHCESession *)self sessionState] <= 1)
    {
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058CF8);
        }
        v29 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "HCE Listening Thread: quit listening loop...", buf, 2u);
        }
      }
LABEL_53:
      if (v4)
      {
        if (![(MIBUHCESession *)self suppressLogging])
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_100058E20);
          }
          id v24 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = 3;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting %ds before stopping HCE listening thread...", buf, 8u);
          }
        }
        sleep(3u);
      }
      goto LABEL_60;
    }

    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058D18);
      }
      uint64_t v12 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Reading APDU from reader...", buf, 2u);
      }
    }
    uint64_t v13 = [(MIBUHCESession *)self session];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000079F4;
    v33[3] = &unk_100058D40;
    v35 = &v40;
    v36 = &v37;
    BOOL v14 = v31;
    v34 = v14;
    [v13 readAPDUWithCompletion:v33];

    if (dispatch_semaphore_wait(v14, v3)) {
      break;
    }
    if (*(void *)(v38[0] + 40))
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058D80);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003DCC8();
      }
      id v4 = 0;
    }
    else
    {
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058DA0);
        }
        uint64_t v15 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v16 = (void *)v41[5];
          *(_DWORD *)buf = 138543362;
          id v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got APDU: %{public}@", buf, 0xCu);
        }
      }
      id v4 = [(MIBUHCESession *)self _handleAPDU:v41[5]];
      if (!v4)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058DC0);
        }
        uint64_t v17 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003DC88(v46, &v47, v17);
        }
        id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_1000509C2 length:2];
      }
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058DE0);
        }
        v18 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending APDU response: %@", buf, 0xCu);
        }
      }
      v19 = [(MIBUHCESession *)self session];
      uint64_t v20 = [v19 sendAPDU:v4];
      v21 = *(void **)(v38[0] + 40);
      *(void *)(v38[0] + 40) = v20;

      if (*(void *)(v38[0] + 40))
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058E00);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003DC48();
        }
      }
    }

    if ([(MIBUHCESession *)self sessionState] <= 1) {
      goto LABEL_53;
    }
  }
  if (![(MIBUHCESession *)self suppressLogging])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058D60);
    }
    id v30 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = 55;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Reading APDU timed out after %ds", buf, 8u);
    }
  }

  id v4 = 0;
  BOOL v7 = 0;
LABEL_60:
  if ([(MIBUHCESession *)self sessionState])
  {
    if (![(MIBUHCESession *)self suppressLogging])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058E40);
      }
      uint64_t v25 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "HCE Listening Thread: ending HCE session...", buf, 2u);
      }
    }
    v26 = (id *)(v38[0] + 40);
    id obj = *(id *)(v38[0] + 40);
    [(MIBUHCESession *)self _endHCESession:&obj expected:v7];
    objc_storeStrong(v26, obj);
    if (*(void *)(v38[0] + 40))
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100058E60);
      }
      uint64_t v27 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003DBD0((uint64_t)v38, v27, v28);
      }
    }
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v40, 8);
}

- (id)_handleAPDU:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unint64_t v6 = [[MIBUNFCCommand alloc] initWithAPDU:v4];
  BOOL v7 = v6;
  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058E80);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DD08();
    }
    id v13 = objc_alloc((Class)NSData);
    BOOL v14 = &unk_1000509C6;
    goto LABEL_22;
  }
  if (![(MIBUNFCCommand *)v6 code])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058EA0);
    }
    uint64_t v15 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138543362;
      id v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unsupported APDU command: %{public}@", (uint8_t *)&v30, 0xCu);
    }
    id v13 = objc_alloc((Class)NSData);
    BOOL v14 = &unk_1000509C4;
LABEL_22:
    id v12 = [v13 initWithBytes:v14 length:2];
    goto LABEL_44;
  }
  if ((id)[(MIBUNFCCommand *)v7 code] == (id)5)
  {
    int v8 = [(MIBUNFCCommand *)v7 payload];
    id v9 = [v8 objectForKey:@"EvelopedAPDU"];

    if (v9 && [v9 length])
    {
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058EC0);
        }
        unsigned __int8 v10 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = 138543362;
          id v31 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving enveloped data: %{public}@ to pending apdu", (uint8_t *)&v30, 0xCu);
        }
      }
      uint64_t v11 = [(MIBUHCESession *)self pendingAPDU];
      [v11 appendData:v9];

      id v12 = [objc_alloc((Class)NSData) initWithBytes:&unk_1000509C0 length:2];
    }
    else
    {
      if (![(MIBUHCESession *)self suppressLogging])
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058EE0);
        }
        v21 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = v21;
          v23 = [(MIBUHCESession *)self pendingAPDU];
          int v30 = 138543362;
          id v31 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ENVELOPE command chain ends; processing pending APDU: %{public}@",
            (uint8_t *)&v30,
            0xCu);
        }
      }
      id v24 = [(MIBUHCESession *)self pendingAPDU];
      id v12 = [(MIBUHCESession *)self _handleAPDU:v24];

      uint64_t v25 = objc_opt_new();
      [(MIBUHCESession *)self setPendingAPDU:v25];
    }
    goto LABEL_37;
  }
  BOOL v16 = [(MIBUHCESession *)self delegate];
  uint64_t v17 = [v16 handleCommand:v7];

  if ([v17 rejected])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058F00);
    }
    v18 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DD74(v18, v7);
    }
    id v19 = objc_alloc((Class)NSData);
    uint64_t v20 = &unk_1000509C4;
  }
  else
  {
    uint64_t v26 = [v17 serialize];
    if (v26)
    {
      id v9 = (void *)v26;
      [v5 appendData:v26];
      id v27 = [objc_alloc((Class)NSData) initWithBytes:&unk_1000509C0 length:2];
      [v5 appendData:v27];

      id v12 = v5;
LABEL_37:

      goto LABEL_44;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058F20);
    }
    uint64_t v28 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DE04(v28, v7);
    }
    id v19 = objc_alloc((Class)NSData);
    uint64_t v20 = &unk_1000509C2;
  }
  id v12 = [v19 initWithBytes:v20 length:2];

LABEL_44:

  return v12;
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  self->_suppressLogging = a3;
}

- (NFHCESession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (NSCondition)sessionLock
{
  return self->_sessionLock;
}

- (void)setSessionLock:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NFHardwareManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (MIBUHCESessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableData)pendingAPDU
{
  return self->_pendingAPDU;
}

- (void)setPendingAPDU:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAPDU, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionLock, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end