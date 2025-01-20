@interface GenericSiriRemoteListener
+ (id)instance;
- (DoAPAudioRelay)doapAudioRelay;
- (GenericSiriRemoteListener)init;
- (HIDManager)hidManager;
- (NSDate)lastAudioDate;
- (NSMutableArray)audioBuffer;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (id)allocHIDQueue;
- (unsigned)state;
- (void)dealloc;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)handleAudioData:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setHidManager:(id)a3;
- (void)setLastAudioDate:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setUpHidHandlers;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation GenericSiriRemoteListener

+ (id)instance
{
  if (qword_1000CD038 != -1) {
    dispatch_once(&qword_1000CD038, &stru_1000B15A8);
  }
  v2 = (void *)qword_1000CD030;

  return v2;
}

- (void)dealloc
{
  hidManager = self->_hidManager;
  if (hidManager)
  {
    [(HIDManager *)hidManager cancel];
    [(HIDManager *)self->_hidManager close];
  }
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)GenericSiriRemoteListener;
  [(GenericSiriRemoteListener *)&v5 dealloc];
}

- (void)setUpHidHandlers
{
  [(HIDManager *)self->_hidManager setInputElementMatching:&off_1000B7C68];
  hidManager = self->_hidManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017FE8;
  v6[3] = &unk_1000B15D0;
  v6[4] = self;
  [(HIDManager *)hidManager setInputElementHandler:v6];
  [(HIDManager *)self->_hidManager setDeviceMatching:&off_1000B7CB8];
  v4 = self->_hidManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018040;
  v5[3] = &unk_1000B15F8;
  v5[4] = self;
  [(HIDManager *)v4 setDeviceNotificationHandler:v5];
  [(HIDManager *)self->_hidManager setDispatchQueue:self->_eventQueue];
  [(HIDManager *)self->_hidManager open];
  [(HIDManager *)self->_hidManager activate];
}

- (id)allocHIDQueue
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v3 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], v2);

  return v4;
}

- (GenericSiriRemoteListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)GenericSiriRemoteListener;
  v2 = [(GenericSiriRemoteListener *)&v12 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    doapAudioStart = v2->_doapAudioStart;
    v2->_doapAudioStart = (OS_dispatch_semaphore *)v5;

    v7 = (HIDManager *)objc_alloc_init((Class)HIDManager);
    hidManager = v2->_hidManager;
    v2->_hidManager = v7;

    v9 = [(GenericSiriRemoteListener *)v2 allocHIDQueue];
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v9;
  }
  return v2;
}

- (void)handleAudioData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 length];
  uint64_t v28 = 0;
  if (v5 <= 3)
  {
    uint64_t v6 = v5;
    v7 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006E310(v6, v7);
    }
    goto LABEL_22;
  }
  [v4 getBytes:&v28 range:4];
  if ([(GenericSiriRemoteListener *)self state] == 4) {
    goto LABEL_22;
  }
  if (v4 && v28)
  {
    v8 = +[NSDate date];
    [(GenericSiriRemoteListener *)self setLastAudioDate:v8];

    v9 = +[NSData dataWithData:v4];
    if (objc_opt_class())
    {
      v10 = +[SLGLog sharedInstance];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001861C;
      v26[3] = &unk_1000B12B8;
      v27 = v9;
      [v10 logBlock:v26];
    }
    v11 = self;
    objc_sync_enter(v11);
    objc_super v12 = [(GenericSiriRemoteListener *)v11 audioBuffer];

    if (v12)
    {
      v13 = [(GenericSiriRemoteListener *)v11 audioBuffer];
      [v13 addObject:v9];
    }
    else
    {
      v13 = [(GenericSiriRemoteListener *)v11 doapAudioRelay];
      [v13 sendAudioFrame:v9];
    }

    objc_sync_exit(v11);
LABEL_21:

    goto LABEL_22;
  }
  if (!v28)
  {
    if (objc_opt_class())
    {
      v22 = +[SLGLog sharedInstance];
      [v22 logBlock:&stru_1000B1618];
    }
    v23 = [(GenericSiriRemoteListener *)self doapAudioStop];

    if (v23)
    {
      v24 = [(GenericSiriRemoteListener *)self doapAudioStop];
      dispatch_semaphore_signal(v24);
    }
    v9 = self;
    objc_sync_enter(v9);
    v25 = [(GenericSiriRemoteListener *)v9 audioBuffer];
    [v25 removeAllObjects];

    objc_sync_exit(v9);
    goto LABEL_21;
  }
  v14 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006E388(v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_22:
}

- (void)doapAudioWillStart:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(GenericSiriRemoteListener *)self state] == 4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"GenericSiriRemote stopped (disconnected)"];
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    objc_super v12 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    v4[2](v4, v7);
  }
  else
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001885C;
    block[3] = &unk_1000B1640;
    block[4] = self;
    v10 = v4;
    dispatch_async(eventQueue, block);
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(GenericSiriRemoteListener *)self state] == 4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"GenericSiriRemote stopped (disconnected)"];
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    v52 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    v4[2](v4, v7);
    v8 = [(GenericSiriRemoteListener *)self doapAudioStart];
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }
  v9 = [(GenericSiriRemoteListener *)self lastAudioDate];
  [v9 timeIntervalSinceNow];
  double v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    v25 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = [(GenericSiriRemoteListener *)self lastAudioDate];
      [v27 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      double v50 = fabs(v28) * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_super v12 = [(GenericSiriRemoteListener *)self doapAudioStop];

  if (v12)
  {
    v13 = [(GenericSiriRemoteListener *)self lastAudioDate];
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    uint64_t v16 = [(GenericSiriRemoteListener *)self doapAudioStop];
    dispatch_time_t v17 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    intptr_t v18 = dispatch_semaphore_wait(v16, v17);

    uint64_t v19 = qword_1000CD178;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        uint64_t v21 = v19;
        v22 = [(GenericSiriRemoteListener *)self lastAudioDate];
        [v22 timeIntervalSinceNow];
        *(_DWORD *)buf = 134217984;
        double v50 = fabs(v23) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received Siri audio data %f ms ago.", buf, 0xCu);
      }
      eventQueue = self->_eventQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000191F0;
      v45[3] = &unk_1000B1640;
      v45[4] = self;
      v46 = v4;
      dispatch_async(eventQueue, v45);

      goto LABEL_18;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received empty audio input report. Stop Siri session.", buf, 2u);
    }
LABEL_17:
    [(GenericSiriRemoteListener *)self setDoapAudioStop:0];
    v4[2](v4, 0);
    v42 = [(GenericSiriRemoteListener *)self doapAudioStart];
    dispatch_semaphore_signal(v42);

    v43 = self;
    objc_sync_enter(v43);
    id v44 = objc_alloc_init((Class)NSMutableArray);
    [(GenericSiriRemoteListener *)v43 setAudioBuffer:v44];

    objc_sync_exit(v43);
    goto LABEL_18;
  }
  v29 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006E3C0(v29, v30, v31, v32, v33, v34, v35, v36);
  }
  NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
  CFStringRef v48 = @"No doapAudioStop semaphore";
  v37 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v38 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870165 userInfo:v37];

  v4[2](v4, v38);
  v39 = [(GenericSiriRemoteListener *)self doapAudioStart];
  dispatch_semaphore_signal(v39);

  v40 = self;
  objc_sync_enter(v40);
  id v41 = objc_alloc_init((Class)NSMutableArray);
  [(GenericSiriRemoteListener *)v40 setAudioBuffer:v41];

  objc_sync_exit(v40);
LABEL_18:
}

- (void)doapAudioDidStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(GenericSiriRemoteListener *)self state] == 4)
  {
    uint64_t v5 = +[NSString stringWithFormat:@"GenericSiriRemote stopped (disconnected)"];
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = v5;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    v4[2](v4, v7);
    v8 = [(GenericSiriRemoteListener *)self doapAudioStart];
    dispatch_semaphore_signal(v8);
  }
  else
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000193A0;
    block[3] = &unk_1000B1640;
    block[4] = self;
    double v11 = v4;
    dispatch_async(eventQueue, block);
  }
}

- (HIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);

  objc_storeStrong((id *)&self->_hidManager, 0);
}

@end