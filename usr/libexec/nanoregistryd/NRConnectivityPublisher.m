@interface NRConnectivityPublisher
+ (id)sharedConnectivityPublisher;
- (BOOL)isConnected;
- (NRConnectivityPublisher)init;
- (int)_registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (int64_t)dropoutCounter;
- (int64_t)getDropoutCounter;
- (unint64_t)_readNotifyToken:(int)a3;
- (void)_readConnectivityStatus;
- (void)_updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5;
- (void)_writeConnectivityStatus;
- (void)setConnected:(BOOL)a3;
- (void)setDropoutCounter:(int64_t)a3;
@end

@implementation NRConnectivityPublisher

+ (id)sharedConnectivityPublisher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3554;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A12E8 != -1) {
    dispatch_once(&qword_1001A12E8, block);
  }
  v2 = (void *)qword_1001A12E0;

  return v2;
}

- (NRConnectivityPublisher)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRConnectivityPublisher;
  v2 = [(NRConnectivityPublisher *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.connectivitypublisher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_dropoutCounterNotifyToken = [(NRConnectivityPublisher *)v2 _registerNotifyTokenWithName:@"com.apple.nanoregistry.dropoutcounter" withQueue:0 withBlock:0];
    [(NRConnectivityPublisher *)v2 _readConnectivityStatus];
  }
  return v2;
}

- (void)setConnected:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A36A8;
  v4[3] = &unk_1001660F8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A3794;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)getDropoutCounter
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A3854;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_readConnectivityStatus
{
  int64_t v3 = [(NRConnectivityPublisher *)self _readNotifyToken:self->_dropoutCounterNotifyToken];
  self->_connected = v3 >= 0;
  self->_dropoutCounter = v3 & 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_writeConnectivityStatus
{
}

- (void)_updateNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5
{
  id v7 = a5;
  uint64_t v8 = nr_daemon_log();
  uint64_t v9 = v8;
  if (a3 == -1)
  {
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = nr_daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000FA8A8((uint64_t)v7, v13);
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v7;
        __int16 v16 = 2048;
        unint64_t v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating token %@ with value %lld", (uint8_t *)&v14, 0x16u);
      }
    }
    notify_set_state(a3, a4);
    notify_post((const char *)[v7 UTF8String]);
  }
}

- (unint64_t)_readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (int)_registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  uint64_t v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  v11 = (const char *)[v10 UTF8String];
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9)) {
      goto LABEL_9;
    }
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_9;
  }
  BOOL v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    int v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to register block and get notify token for %@", buf, 0xCu);
    }
  }
LABEL_9:
  int v15 = out_token;

  return v15;
}

- (int64_t)dropoutCounter
{
  return self->_dropoutCounter;
}

- (void)setDropoutCounter:(int64_t)a3
{
  self->_dropoutCounter = a3;
}

- (void).cxx_destruct
{
}

@end