@interface SESDarwinNotificationMonitor
+ (BOOL)registerDelegate:(id)a3 forEvent:(id)a4;
+ (id)sharedObject;
+ (void)kickoff;
- (SESDarwinNotificationMonitor)initWithQueue:(id)a3;
- (void)_handleEvent:(id)a3;
@end

@implementation SESDarwinNotificationMonitor

+ (id)sharedObject
{
  if (qword_10045CCC0 != -1) {
    dispatch_once(&qword_10045CCC0, &stru_10040CF50);
  }
  v2 = (void *)qword_10045CCB8;

  return v2;
}

- (SESDarwinNotificationMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SESDarwinNotificationMonitor;
  v6 = [(SESDarwinNotificationMonitor *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[NSMapTable strongToWeakObjectsMapTable];
    registeredDelegates = v7->_registeredDelegates;
    v7->_registeredDelegates = (NSMapTable *)v8;

    uint64_t v10 = objc_opt_new();
    pendingNotificationIdentifiers = v7->_pendingNotificationIdentifiers;
    v7->_pendingNotificationIdentifiers = (NSMutableSet *)v10;

    queue = v7->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003192C;
    handler[3] = &unk_10040CF78;
    v15 = v7;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);
  }
  return v7;
}

+ (void)kickoff
{
  id v2 = +[SESDarwinNotificationMonitor sharedObject];
}

- (void)_handleEvent:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  string = xpc_dictionary_get_string(v5, _xpc_event_key_name);

  if (string)
  {
    v7 = +[NSString stringWithUTF8String:string];
    uint64_t v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Notification %@ received", (uint8_t *)&v12, 0xCu);
    }

    v9 = [(NSMapTable *)self->_registeredDelegates objectForKey:v7];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 onDarwinNotification:v7];
    }
    else if ((unint64_t)[(NSMutableSet *)self->_pendingNotificationIdentifiers count] < 0x65)
    {
      [(NSMutableSet *)self->_pendingNotificationIdentifiers addObject:v7];
    }
    else
    {
      v11 = SESDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Too many notifications received, dropping event %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

+ (BOOL)registerDelegate:(id)a3 forEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v7 = +[SESDarwinNotificationMonitor sharedObject];
  dispatch_assert_queue_not_V2(v7[1]);
  uint64_t v8 = v7[1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031CE0;
  v16[3] = &unk_10040CFA0;
  v9 = v7;
  v17 = v9;
  id v10 = v5;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  v20 = &v21;
  dispatch_sync(v8, v16);
  int v12 = SESDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *((unsigned __int8 *)v22 + 24);
    *(_DWORD *)buf = 138543618;
    id v26 = v11;
    __int16 v27 = 1026;
    int v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registered delegate for event %{public}@, pending %{public}d", buf, 0x12u);
  }

  BOOL v14 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNotificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end