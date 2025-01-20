@interface SignalMonitor
+ (id)sharedInstance;
- (BOOL)audioActive;
- (BOOL)nfcActive;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)nfcTransaction;
- (ResourceHint)audioResourceHint;
- (ResourceHint)nfcResourceHint;
- (SignalMonitor)init;
- (void)handleAudioSession;
- (void)handleNFCSession;
- (void)handleXPCEvent:(id)a3;
- (void)initAudioHandling;
- (void)initNFCHandling;
- (void)initializeMonitors;
- (void)setAudioActive:(BOOL)a3;
- (void)setAudioResourceHint:(id)a3;
- (void)setNfcActive:(BOOL)a3;
- (void)setNfcResourceHint:(id)a3;
- (void)setNfcTransaction:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SignalMonitor

- (void)handleAudioSession
{
  v3 = [(SignalMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0;
  if (!notify_get_state(dword_10001BEE8, &state64))
  {
    if (state64)
    {
      [(SignalMonitor *)self setAudioActive:1];
      v4 = qword_10001BEE0;
      if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = state64;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Audio playback started current_state %llu. Creating a resource hint", buf, 0xCu);
      }
      v5 = [(SignalMonitor *)self audioResourceHint];

      if (!v5)
      {
        id v11 = [objc_alloc((Class)ResourceHint) initWithResourceType:5 andState:1];
        [(SignalMonitor *)self setAudioResourceHint:v11];

        return;
      }
      v6 = [(SignalMonitor *)self audioResourceHint];
      v7 = v6;
      uint64_t v8 = 1;
    }
    else
    {
      [(SignalMonitor *)self setAudioActive:0];
      v9 = [(SignalMonitor *)self audioResourceHint];

      if (!v9) {
        return;
      }
      v10 = qword_10001BEE0;
      if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Audio playback stopped. Dropping a resource hint", buf, 2u);
      }
      v6 = [(SignalMonitor *)self audioResourceHint];
      v7 = v6;
      uint64_t v8 = 0;
    }
    [v6 updateState:v8];

    return;
  }
  if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_ERROR)) {
    sub_10000D06C();
  }
}

- (ResourceHint)audioResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 24, 1);
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  v5 = [(SignalMonitor *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001B94;
  v7[3] = &unk_100014520;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleNFCSession
{
  v3 = [(SignalMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t state64 = 0;
  if (!notify_get_state(dword_10001BEEC, &state64))
  {
    if (state64 && ![(SignalMonitor *)self nfcActive])
    {
      [(SignalMonitor *)self setNfcActive:1];
      id v4 = [(SignalMonitor *)self nfcResourceHint];

      if (v4)
      {
        id v5 = [(SignalMonitor *)self nfcResourceHint];
        [v5 updateState:1];
      }
      else
      {
        id v6 = qword_10001BEE0;
        if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC session started. Creating a resource hint", buf, 2u);
        }
        id v5 = [objc_alloc((Class)ResourceHint) initWithResourceType:4 andState:1];
        [(SignalMonitor *)self setNfcResourceHint:v5];
      }

      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      id v8 = [(SignalMonitor *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A228;
      block[3] = &unk_1000145C0;
      block[4] = self;
      dispatch_after(v7, v8, block);
    }
    else if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_ERROR))
    {
      sub_10000D0D4();
    }
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (ResourceHint)nfcResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNfcActive:(BOOL)a3
{
  self->_nfcActive = a3;
}

- (void)setAudioActive:(BOOL)a3
{
  self->_audioActive = a3;
}

- (BOOL)nfcActive
{
  return self->_nfcActive;
}

+ (id)sharedInstance
{
  if (qword_10001BED8 != -1) {
    dispatch_once(&qword_10001BED8, &stru_100014758);
  }
  v2 = (void *)qword_10001BED0;

  return v2;
}

- (SignalMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)SignalMonitor;
  v2 = [(SignalMonitor *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerexperieced.signalmonitor", v3);
    [(SignalMonitor *)v2 setQueue:v4];

    os_log_t v5 = os_log_create("com.apple.powerexperienced", "signalMonitor");
    id v6 = (void *)qword_10001BEE0;
    qword_10001BEE0 = (uint64_t)v5;
  }
  return v2;
}

- (void)initializeMonitors
{
  [(SignalMonitor *)self initNFCHandling];
  [(SignalMonitor *)self initAudioHandling];
  v3 = [(SignalMonitor *)self queue];
  id v4 = +[CameraMonitor monitorWithQueue:v3];

  os_log_t v5 = qword_10001BEE0;
  if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initialized signal monitors", v6, 2u);
  }
}

- (void)initAudioHandling
{
  if (notify_register_check("com.apple.coreaudio.IORunning", &dword_10001BEE8))
  {
    if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_ERROR)) {
      sub_10000D038();
    }
  }
}

- (void)initNFCHandling
{
  if (notify_register_check("com.apple.request.hipuncap", &dword_10001BEEC))
  {
    if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_ERROR)) {
      sub_10000D0A0();
    }
  }
}

- (void)setQueue:(id)a3
{
}

- (BOOL)audioActive
{
  return self->_audioActive;
}

- (void)setAudioResourceHint:(id)a3
{
}

- (void)setNfcResourceHint:(id)a3
{
}

- (OS_os_transaction)nfcTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNfcTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcTransaction, 0);
  objc_storeStrong((id *)&self->_nfcResourceHint, 0);
  objc_storeStrong((id *)&self->_audioResourceHint, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end