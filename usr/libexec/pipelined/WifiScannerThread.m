@interface WifiScannerThread
- (WifiScannerThread)init;
- (WifiScannerThread)initWithBackend:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)runWifiThread:(id)a3;
- (void)setStopExpected;
@end

@implementation WifiScannerThread

- (WifiScannerThread)initWithBackend:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WifiScannerThread;
  id v6 = [(WifiScannerThread *)&v9 init];
  v7 = (WifiScannerThread *)v6;
  if (v6)
  {
    *((unsigned char *)v6 + 16) = 0;
    objc_storeStrong((id *)v6 + 1, a3);
  }

  return v7;
}

- (void)runWifiThread:(id)a3
{
  v4 = a3;
  Current = CFRunLoopGetCurrent();
  v7 = _os_activity_create((void *)&_mh_execute_header, "Wifi Framework", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
  os_activity_scope_enter(v7, &state);
  unsigned int v8 = [*((id *)self + 1) onQueueAllocManagerWithRunLoop:Current];
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
  }
  objc_super v9 = (id)qword_10047BEE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*((id *)self + 1) wifiThreadRunLoop];
    uint64_t v11 = *((void *)self + 1);
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v10;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Created runloop %p on %p", buf, 0x16u);
  }

  if ((v8 & 1) == 0)
  {
    if (qword_10047BED8 != -1) {
      goto LABEL_21;
    }
    v12 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failure, wifi manager failed to initialize", buf, 2u);
      goto LABEL_9;
    }
  }
  while (1)
  {
LABEL_9:
    v13 = [*((id *)self + 1) wifiThreadShutdown:v17, v18, v19];
    v14 = (void *)*((void *)self + 1);
    *((void *)self + 1) = 0;

    os_activity_scope_leave(&state);
    if (v8)
    {
      if (qword_10047BED8 == -1)
      {
        v15 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_13;
        }
      }
      else
      {
        dispatch_once(&qword_10047BED8, &stru_1004682C0);
        v15 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
        {
LABEL_13:
          v7 = kCFRunLoopCommonModes;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100009DE4;
          block[3] = &unk_1004527B8;
          v21 = v4;
          CFRunLoopPerformBlock(Current, kCFRunLoopCommonModes, block);
          if (qword_10047BED8 == -1)
          {
            v16 = qword_10047BEE0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT))
            {
LABEL_16:
              CFRunLoopRun();

              goto LABEL_18;
            }
          }
          else
          {
            dispatch_once(&qword_10047BED8, &stru_1004682C0);
            v16 = qword_10047BEE0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
          }
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting WiFi runloop", buf, 2u);
          goto LABEL_16;
        }
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Scheduling block onto runloop to unblock init", buf, 2u);
      goto LABEL_13;
    }
    dispatch_semaphore_signal(v4);
    [(WifiScannerThread *)self setStopExpected];
LABEL_18:
    dispatch_semaphore_signal(v13);
    Current = (__CFRunLoop *)((char *)self + 24);
    std::mutex::lock((std::mutex *)((char *)self + 24));
    if (*((unsigned char *)self + 16)) {
      break;
    }
    sub_1003A7180((NSObject **)buf);

    uint64_t v18 = 606;
    v19 = "-[WifiScannerThread runWifiThread:]";
    v17 = "/Library/Caches/com.apple.xbs/Sources/purpleslam/common/wifiscanning/sensor/backend/IOSWifiScannerBackend.mm";
    abort_report_np();
    __break(1u);
LABEL_21:
    dispatch_once(&qword_10047BED8, &stru_1004682C0);
    v12 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
  }
  std::mutex::unlock((std::mutex *)((char *)self + 24));
}

- (id).cxx_construct
{
  *((void *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 10) = 0;
  return self;
}

- (WifiScannerThread)init
{
  return 0;
}

- (void)setStopExpected
{
  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  *((unsigned char *)self + 16) = 1;

  std::mutex::unlock(v3);
}

- (void)dealloc
{
  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  if (*((unsigned char *)self + 16))
  {
    std::mutex::unlock(v3);
    v4.receiver = self;
    v4.super_class = (Class)WifiScannerThread;
    [(WifiScannerThread *)&v4 dealloc];
  }
  else
  {
    sub_1003A7048(&v5);

    abort_report_np();
    __break(1u);
  }
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 24));

  objc_storeStrong((id *)self + 1, 0);
}

@end