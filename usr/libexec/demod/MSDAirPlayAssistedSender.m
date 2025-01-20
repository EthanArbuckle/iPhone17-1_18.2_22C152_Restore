@interface MSDAirPlayAssistedSender
+ (id)sharedInstance;
- (AVOutputContext)avOutputContext;
- (AVOutputDeviceDiscoverySession)avDiscoverySession;
- (BOOL)_activateSenderUsingParameters:(id)a3 discoveryMode:(unint64_t)a4;
- (BOOL)_isAirPlayStreaming;
- (BOOL)_startAWDLDiscoveryUsingBonjour:(BOOL)a3;
- (BOOL)activateSenderUsingParametersData:(id)a3 discoveryMode:(unint64_t)a4;
- (BOOL)isSenderReady;
- (BonjourBrowser)bonjourBrowser;
- (MSDAirPlayAssistedSender)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (id)_NSStringFromSenderState:(unint64_t)a3;
- (unint64_t)state;
- (void)_handleAVOutputDeviceDidChangeNotification:(id)a3;
- (void)_handleTimeoutTimerFired;
- (void)_startTimeoutTimer;
- (void)_stopAWDLDiscovery;
- (void)_stopActivation;
- (void)_stopTimoutTimer;
- (void)setAvDiscoverySession:(id)a3;
- (void)setAvOutputContext:(id)a3;
- (void)setBonjourBrowser:(BonjourBrowser *)a3;
- (void)setQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation MSDAirPlayAssistedSender

+ (id)sharedInstance
{
  if (qword_100189960 != -1) {
    dispatch_once(&qword_100189960, &stru_100152770);
  }
  v2 = (void *)qword_100189968;

  return v2;
}

- (MSDAirPlayAssistedSender)init
{
  v11.receiver = self;
  v11.super_class = (Class)MSDAirPlayAssistedSender;
  v2 = [(MSDAirPlayAssistedSender *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileStoreDemo.AirPlayAsssitedSender", v3);
    [(MSDAirPlayAssistedSender *)v2 setQueue:v4];

    v5 = +[AVOutputContext sharedSystemScreenContext];
    [(MSDAirPlayAssistedSender *)v2 setAvOutputContext:v5];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleAVOutputDeviceDidChangeNotification:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    if ([(MSDAirPlayAssistedSender *)v2 _isAirPlayStreaming]) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    [(MSDAirPlayAssistedSender *)v2 setState:v7];
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(MSDAirPlayAssistedSender *)v2 _NSStringFromSenderState:[(MSDAirPlayAssistedSender *)v2 state]];
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Sender initialized to state: %{public}@", buf, 0xCu);
    }
  }
  return v2;
}

- (BOOL)isSenderReady
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(MSDAirPlayAssistedSender *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E89C;
  v5[3] = &unk_100152798;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)activateSenderUsingParametersData:(id)a3 discoveryMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Activating sender in discovery mode: %lu", buf, 0xCu);
  }

  id v19 = 0;
  uint64_t v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v19];
  id v9 = v19;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = [(MSDAirPlayAssistedSender *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003EB28;
    block[3] = &unk_1001527C0;
    v17 = &v20;
    block[4] = self;
    id v16 = v8;
    unint64_t v18 = a4;
    dispatch_sync(v10, block);

    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v9 localizedDescription];
      sub_1000CC78C(v13, buf, v12);
    }

    BOOL v11 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

- (BOOL)_isAirPlayStreaming
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MSDAirPlayAssistedSender *)self avOutputContext];
  v3 = [v2 outputDevices];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) deviceType])
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = (int)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Sender has AirPlay streaming=%{BOOL}d", buf, 8u);
  }

  return (char)v4;
}

- (BOOL)_activateSenderUsingParameters:(id)a3 discoveryMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v7);

  if ((id)[(MSDAirPlayAssistedSender *)self state] != (id)1)
  {
    uint64_t v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CC8C8(self, v8);
    }

    goto LABEL_17;
  }
  [(MSDAirPlayAssistedSender *)self setState:2];
  if (a4)
  {
    if (a4 == 2)
    {
      if (![(MSDAirPlayAssistedSender *)self _startAWDLDiscoveryUsingBonjour:0])
      {
LABEL_16:
        [(MSDAirPlayAssistedSender *)self _stopActivation];
        [(MSDAirPlayAssistedSender *)self setState:1];
LABEL_17:
        BOOL v10 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      if (a4 != 1)
      {
        long long v11 = sub_100068600();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000CC7E4(a4, v11);
        }
        goto LABEL_15;
      }
      if (![(MSDAirPlayAssistedSender *)self _startAWDLDiscoveryUsingBonjour:1]) {
        goto LABEL_16;
      }
    }
  }
  [(MSDAirPlayAssistedSender *)self _startTimeoutTimer];
  uint64_t v9 = APSXPCClientSendCommandCreatingReply();
  if (v9)
  {
    uint64_t v13 = v9;
    long long v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CC85C(v13, v11, v14, v15, v16, v17, v18, v19);
    }
LABEL_15:

    goto LABEL_16;
  }
  BOOL v10 = 1;
LABEL_18:

  return v10;
}

- (BOOL)_startAWDLDiscoveryUsingBonjour:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v37[0] = 67109120;
    v37[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Starting AWDL discovery using bonjour service: %{BOOL}d", (uint8_t *)v37, 8u);
  }

  if (!v3)
  {
    id v10 = [objc_alloc((Class)AVOutputDeviceDiscoverySession) initWithDeviceFeatures:2];
    [(MSDAirPlayAssistedSender *)self setAvDiscoverySession:v10];

    long long v11 = [(MSDAirPlayAssistedSender *)self avDiscoverySession];

    if (v11)
    {
      long long v12 = [(MSDAirPlayAssistedSender *)self avDiscoverySession];
      [v12 setDiscoveryMode:2];

      return 1;
    }
    uint64_t v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CCA48(v15, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_14;
  }
  uint64_t v6 = BonjourBrowser_CreateEx();
  if (v6)
  {
    uint64_t v14 = v6;
    uint64_t v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CC9DC(v14, v15, v16, v17, v18, v19, v20, v21);
    }
LABEL_14:

    return 0;
  }
  [(MSDAirPlayAssistedSender *)self bonjourBrowser];
  uint64_t v7 = [(MSDAirPlayAssistedSender *)self queue];
  BonjourBrowser_SetDispatchQueue();

  [(MSDAirPlayAssistedSender *)self bonjourBrowser];
  uint64_t v8 = BonjourBrowser_Start();
  if (v8)
  {
    uint64_t v29 = v8;
    v30 = sub_100068600();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000CC970(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    return 0;
  }
  BOOL v9 = 1;
  sleep(1u);
  return v9;
}

- (void)_startTimeoutTimer
{
  BOOL v3 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  [(MSDAirPlayAssistedSender *)self setTimeoutTimer:v5];

  uint64_t v6 = [(MSDAirPlayAssistedSender *)self timeoutTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003F1A4;
  handler[3] = &unk_100151AF0;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  uint64_t v7 = [(MSDAirPlayAssistedSender *)self timeoutTimer];
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  BOOL v9 = [(MSDAirPlayAssistedSender *)self timeoutTimer];
  dispatch_resume(v9);
}

- (void)_stopActivation
{
  BOOL v3 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MSDAirPlayAssistedSender *)self _stopAWDLDiscovery];

  [(MSDAirPlayAssistedSender *)self _stopTimoutTimer];
}

- (void)_stopAWDLDiscovery
{
  BOOL v3 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Stopping AWDL discovery.", v7, 2u);
  }

  dispatch_source_t v5 = [(MSDAirPlayAssistedSender *)self avDiscoverySession];

  if (v5)
  {
    uint64_t v6 = [(MSDAirPlayAssistedSender *)self avDiscoverySession];
    [v6 setDiscoveryMode:0];

    [(MSDAirPlayAssistedSender *)self setAvDiscoverySession:0];
  }
  if ([(MSDAirPlayAssistedSender *)self bonjourBrowser])
  {
    [(MSDAirPlayAssistedSender *)self bonjourBrowser];
    BonjourBrowser_Stop();
    CFRelease([(MSDAirPlayAssistedSender *)self bonjourBrowser]);
    [(MSDAirPlayAssistedSender *)self setBonjourBrowser:0];
  }
}

- (void)_stopTimoutTimer
{
  BOOL v3 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Stopping timeout timer.", v7, 2u);
  }

  dispatch_source_t v5 = [(MSDAirPlayAssistedSender *)self timeoutTimer];

  if (v5)
  {
    uint64_t v6 = [(MSDAirPlayAssistedSender *)self timeoutTimer];
    dispatch_source_cancel(v6);

    [(MSDAirPlayAssistedSender *)self setTimeoutTimer:0];
  }
}

- (void)_handleTimeoutTimerFired
{
  BOOL v3 = [(MSDAirPlayAssistedSender *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_source_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Timed out waiting for sender to start streaming!", v5, 2u);
  }

  [(MSDAirPlayAssistedSender *)self _stopActivation];
  [(MSDAirPlayAssistedSender *)self setState:1];
}

- (id)_NSStringFromSenderState:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1001527E0 + a3);
  }
}

- (void)_handleAVOutputDeviceDidChangeNotification:(id)a3
{
  id v4 = [(MSDAirPlayAssistedSender *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F4E8;
  block[3] = &unk_100151AF0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (AVOutputContext)avOutputContext
{
  return self->_avOutputContext;
}

- (void)setAvOutputContext:(id)a3
{
}

- (AVOutputDeviceDiscoverySession)avDiscoverySession
{
  return self->_avDiscoverySession;
}

- (void)setAvDiscoverySession:(id)a3
{
}

- (BonjourBrowser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setBonjourBrowser:(BonjourBrowser *)a3
{
  self->_bonjourBrowser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end