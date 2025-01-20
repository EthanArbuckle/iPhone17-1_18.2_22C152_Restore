@interface CSKappaConnection
- (CSKappaConnection)init;
- (void)defaultMessageHandler:(shared_ptr<CLConnectionMessage>)a3;
- (void)interruptionHandler;
- (void)sendCommand:(int)a3;
- (void)sendCommand:(int)a3 withValue:(int)a4;
- (void)sendTestCachedMessage:(int)a3;
- (void)sendTestMessage:(int)a3;
- (void)sendTestPowerAssertion:(double)a3;
- (void)sendTestSMSignal:(double)a3;
- (void)sendTestSOS;
- (void)sendTestTTR;
- (void)sendTestTrigger;
@end

@implementation CSKappaConnection

- (CSKappaConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSKappaConnection;
  v2 = [(CSKappaConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSKappaConnectionQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    operator new();
  }
  return 0;
}

- (void)defaultMessageHandler:(shared_ptr<CLConnectionMessage>)a3
{
  ptr = (CLConnectionMessage **)a3.__ptr_;
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(*ptr);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(*ptr);
    v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    v11[0] = 68289538;
    v11[1] = 0;
    __int16 v12 = 2082;
    v13 = "";
    __int16 v14 = 2082;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"defaultMessageHandler\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)v11, 0x26u);
  }
}

- (void)interruptionHandler
{
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v2 = qword_1003DB728;
  if (os_log_type_enabled((os_log_t)qword_1003DB728, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection Interrupted", v3, 2u);
  }
}

- (void)sendTestMessage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.message.test" UTF8String]);
  __int16 v12 = +[NSNumber numberWithInt:v3];
  sub_100289EAC(&v13);

  if (SBYTE3(v19) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(v13);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(v13);
    v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    __p = (void *)68289538;
    __int16 v16 = 2082;
    uint64_t v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestMessage\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v11 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v14) {
    sub_10000BB9C(v14);
  }
}

- (void)sendTestCachedMessage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.message.test" UTF8String]);
  __int16 v12 = +[NSNumber numberWithInt:v3];
  sub_100289EAC(&v13);

  if (SBYTE3(v19) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(v13);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(v13);
    v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    __p = (void *)68289538;
    __int16 v16 = 2082;
    uint64_t v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestMessage\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v11 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v14) {
    sub_10000BB9C(v14);
  }
}

- (void)sendTestTrigger
{
  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.trigger.test" UTF8String]);
  sub_100289FF0(&v10);
  if (SBYTE3(v16) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v2 = (id)qword_1003DB728;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = CLConnectionMessage::name(v10);
    int v4 = *(char *)(v3 + 23);
    uint64_t v5 = *(void *)v3;
    uint64_t v6 = CLConnectionMessage::getDictionary(v10);
    uint64_t v7 = (void *)v6;
    if (v4 >= 0) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v5;
    }
    __p = (void *)68289538;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestTrigger\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v9) {
    sub_10000BB9C(v9);
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
}

- (void)sendTestSOS
{
  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.sos.test" UTF8String]);
  sub_100289FF0(&v10);
  if (SBYTE3(v16) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v2 = (id)qword_1003DB728;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = CLConnectionMessage::name(v10);
    int v4 = *(char *)(v3 + 23);
    uint64_t v5 = *(void *)v3;
    uint64_t v6 = CLConnectionMessage::getDictionary(v10);
    uint64_t v7 = (void *)v6;
    if (v4 >= 0) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v5;
    }
    __p = (void *)68289538;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSOS\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v9) {
    sub_10000BB9C(v9);
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
}

- (void)sendTestTTR
{
  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.ttr.test" UTF8String]);
  sub_100289FF0(&v10);
  if (SBYTE3(v16) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  v2 = (id)qword_1003DB728;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = CLConnectionMessage::name(v10);
    int v4 = *(char *)(v3 + 23);
    uint64_t v5 = *(void *)v3;
    uint64_t v6 = CLConnectionMessage::getDictionary(v10);
    uint64_t v7 = (void *)v6;
    if (v4 >= 0) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v5;
    }
    __p = (void *)68289538;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestTTR\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v9) {
    sub_10000BB9C(v9);
  }
  if (v11) {
    sub_10000BB9C(v11);
  }
}

- (void)sendCommand:(int)a3
{
  CFStringRef v22 = @"CSKappaCommandKey";
  uint64_t v3 = +[NSNumber numberWithInt:*(void *)&a3];
  v23 = v3;
  id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.command" UTF8String]);
  sub_10028A0A8(&v12);
  if (SBYTE3(v19) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  int v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(v12);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(v12);
    v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    __p = (void *)68289538;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendCommand\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  v11 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v13) {
    sub_10000BB9C(v13);
  }
}

- (void)sendCommand:(int)a3 withValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v25[0] = @"CSKappaCommandKey";
  uint64_t v5 = +[NSNumber numberWithInt:*(void *)&a3];
  v26[0] = v5;
  v25[1] = @"CSKappaValueKey";
  int v6 = +[NSNumber numberWithInt:v4];
  v26[1] = v6;
  id v17 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.command" UTF8String]);
  sub_10028A0A8(&v15);
  if (SBYTE3(v22) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  uint64_t v7 = (id)qword_1003DB728;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = CLConnectionMessage::name(v15);
    int v9 = *(char *)(v8 + 23);
    uint64_t v10 = *(void *)v8;
    uint64_t v11 = CLConnectionMessage::getDictionary(v15);
    __int16 v12 = (void *)v11;
    if (v9 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v10;
    }
    __p = (void *)68289538;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v21 = 2082;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendCommand\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  id v14 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v14) {
    sub_10000BB9C(v14);
  }
  if (v16) {
    sub_10000BB9C(v16);
  }
}

- (void)sendTestSMSignal:(double)a3
{
  CFStringRef v22 = @"testSMSignal";
  uint64_t v3 = +[NSNumber numberWithDouble:a3];
  __int16 v23 = v3;
  id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.signal.test" UTF8String]);
  sub_10028A0A8(&v12);
  if (SBYTE3(v19) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  uint64_t v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(v12);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(v12);
    int v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    __p = (void *)68289538;
    __int16 v16 = 2082;
    id v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSMSignal\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  uint64_t v11 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v13) {
    sub_10000BB9C(v13);
  }
}

- (void)sendTestPowerAssertion:(double)a3
{
  CFStringRef v22 = @"testPowerAssertionCmd";
  uint64_t v3 = +[NSNumber numberWithDouble:a3];
  __int16 v23 = v3;
  id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  sub_100007BC0(&__p, (char *)[@"com.apple.anomalydetectiond.kappa.powerassertion.test" UTF8String]);
  sub_10028A0A8(&v12);
  if (SBYTE3(v19) < 0) {
    operator delete(__p);
  }
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003B2128);
  }
  uint64_t v4 = (id)qword_1003DB728;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = CLConnectionMessage::name(v12);
    int v6 = *(char *)(v5 + 23);
    uint64_t v7 = *(void *)v5;
    uint64_t v8 = CLConnectionMessage::getDictionary(v12);
    int v9 = (void *)v8;
    if (v6 >= 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v7;
    }
    __p = (void *)68289538;
    __int16 v16 = 2082;
    id v17 = "";
    __int16 v18 = 2082;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"sendTestSMSignal\", \"name\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}@}", (uint8_t *)&__p, 0x26u);
  }
  uint64_t v11 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v11) {
    sub_10000BB9C(v11);
  }
  if (v13) {
    sub_10000BB9C(v13);
  }
}

- (void).cxx_destruct
{
}

@end