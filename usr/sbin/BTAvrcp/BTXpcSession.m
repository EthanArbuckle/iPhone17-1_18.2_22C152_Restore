@interface BTXpcSession
- (BTWatchdog)watchdog;
- (BTXpcSession)init;
- (BTXpcSession)initWithConnection:(id)a3;
- (OS_os_transaction)transaction;
- (OS_xpc_object)connection;
- (id)_objectForKey:(const char *)a3 dict:(id)a4 optional:(BOOL)a5 converters:(id)a6;
- (id)numberForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (id)stringForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (id)xpcDictForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (void)_handleEvent:(id)a3;
- (void)_sendMsg:(id)a3 isReply:(BOOL)a4;
- (void)handleMsg:(id)a3;
- (void)sendMsg:(id)a3;
- (void)sendReply:(id)a3;
@end

@implementation BTXpcSession

- (BTXpcSession)init
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BTXpcSession init]");
  +[NSException raise:NSInvalidArgumentException, @"Calling %@ is not allowed", v3 format];

  return 0;
}

- (BTXpcSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BTXpcSession;
  v6 = [(BTXpcSession *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    id v8 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
    [v8 UTF8String];
    uint64_t v9 = os_transaction_create();
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v9;

    v11 = objc_alloc_init(BTWatchdog);
    watchdog = v7->_watchdog;
    v7->_watchdog = v11;

    v13 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [(BTXpcSession *)v7 connection];
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Started XPC session: %@", buf, 0xCu);
    }
    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)&_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002E18;
    handler[3] = &unk_1000187D0;
    v19 = v7;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
  }
  return v7;
}

- (void)sendMsg:(id)a3
{
}

- (void)sendReply:(id)a3
{
}

- (void)handleMsg:(id)a3
{
}

- (id)numberForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F190;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F190, &stru_100018810);
  }
  v10 = [(BTXpcSession *)self _objectForKey:a3 dict:v9 optional:v5 converters:qword_10001F188];

  return v10;
}

- (id)stringForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F1A0;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F1A0, &stru_1000188D0);
  }
  v10 = [(BTXpcSession *)self _objectForKey:a3 dict:v9 optional:v5 converters:qword_10001F198];

  return v10;
}

- (id)xpcDictForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F1B0;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F1B0, &stru_100018930);
  }
  v10 = [(BTXpcSession *)self _objectForKey:a3 dict:v9 optional:v5 converters:qword_10001F1A8];

  return v10;
}

- (void)_sendMsg:(id)a3 isReply:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FAC8(a4, v7);
  }
  uint64_t v8 = [(BTXpcSession *)self connection];
  xpc_connection_send_message(v8, v6);
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
      sub_10000FB98(v6);
    }
    v7 = [(BTXpcSession *)self watchdog];
    [v7 beginTransaction];

    [(BTXpcSession *)self handleMsg:v4];
    uint64_t v8 = [(BTXpcSession *)self watchdog];
    [v8 endTransaction];
  }
  else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    id v9 = (void *)qword_10001F1C0;
    if (v4 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = [(BTXpcSession *)self connection];
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ended XPC session: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
    {
      sub_10000FC3C(v9);
    }
  }
  else
  {
    BOOL v5 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_10000FCD0(v5);
    }
  }
}

- (id)_objectForKey:(const char *)a3 dict:(id)a4 optional:(BOOL)a5 converters:(id)a6
{
  id v11 = a6;
  int v12 = xpc_dictionary_get_value(a4, a3);
  v13 = v12;
  if (v12)
  {
    v14 = +[NSValue valueWithPointer:xpc_get_type(v12)];
    v15 = [v11 objectForKeyedSubscript:v14];
    if (!v15)
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2, self, @"BTXpcSession.m", 150, @"Invalid XPC value type for key \"%s\": %@", a3, v13 object file lineNumber description];
    }
    v16 = ((void (**)(void, void *))v15)[2](v15, v13);

    goto LABEL_5;
  }
  if (!a5)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"BTXpcSession.m" lineNumber:154 description:@"Missing XPC value for key \"%s\""];
    v16 = 0;
LABEL_5:

    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (BTWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end