@interface STXPCEventDispatcher
+ (id)alarmEventDispatcher;
+ (id)distnotedEventDispatcher;
+ (id)notifydEventDispatcher;
+ (void)installEventHandlers;
- (NSMutableDictionary)eventObserversByIdentifier;
- (NSString)stream;
- (STXPCEventDispatcher)initWithStream:(id)a3;
- (id)registerObserverWithIdentifier:(id)a3;
- (void)_handleEventStream:(id)a3;
@end

@implementation STXPCEventDispatcher

+ (void)installEventHandlers
{
  id v3 = [a1 notifydEventDispatcher];
  id v4 = [a1 alarmEventDispatcher];
  id v5 = [a1 distnotedEventDispatcher];
}

+ (id)notifydEventDispatcher
{
  if (qword_100346958 != -1) {
    dispatch_once(&qword_100346958, &stru_1002FD188);
  }
  v2 = (void *)qword_100346950;
  return v2;
}

+ (id)alarmEventDispatcher
{
  if (qword_100346968 != -1) {
    dispatch_once(&qword_100346968, &stru_1002FD1A8);
  }
  v2 = (void *)qword_100346960;
  return v2;
}

+ (id)distnotedEventDispatcher
{
  if (qword_100346978 != -1) {
    dispatch_once(&qword_100346978, &stru_1002FD1C8);
  }
  v2 = (void *)qword_100346970;
  return v2;
}

- (STXPCEventDispatcher)initWithStream:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STXPCEventDispatcher;
  id v5 = [(STXPCEventDispatcher *)&v16 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    stream = v5->_stream;
    v5->_stream = v6;

    uint64_t v8 = objc_opt_new();
    eventObserversByIdentifier = v5->_eventObserversByIdentifier;
    v5->_eventObserversByIdentifier = (NSMutableDictionary *)v8;

    objc_initWeak(&location, v5);
    v10 = (const char *)[v4 UTF8String];
    id v11 = &_dispatch_main_q;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100058F4C;
    v13[3] = &unk_1002FD1F0;
    objc_copyWeak(&v14, &location);
    xpc_set_event_stream_handler(v10, (dispatch_queue_t)&_dispatch_main_q, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_handleEventStream:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, _xpc_event_key_name);
  v6 = +[STLog daemon];
  v7 = v6;
  if (string)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100263308((uint64_t)string, self);
    }

    v7 = +[NSString stringWithUTF8String:string];
    uint64_t v8 = self->_eventObserversByIdentifier;
    objc_sync_enter(v8);
    v9 = [(NSMutableDictionary *)self->_eventObserversByIdentifier objectForKeyedSubscript:v7];
    objc_sync_exit(v8);

    uint64_t v10 = [v9 handler];
    id v11 = (void *)v10;
    if (v10)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
    }
    else
    {
      v12 = +[STLog daemon];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100263270((uint64_t)string, self);
      }
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1002631D4(self, v7);
  }
}

- (id)registerObserverWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"STXPCEventDispatcher.m", 119, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v6 = [[STXPCEventObserver alloc] initWithIdentifier:v5 dispatcher:self];
  v7 = self->_eventObserversByIdentifier;
  objc_sync_enter(v7);
  eventObserversByIdentifier = self->_eventObserversByIdentifier;
  v9 = [(STXPCEventObserver *)v6 identifier];
  [(NSMutableDictionary *)eventObserversByIdentifier setObject:v6 forKeyedSubscript:v9];

  objc_sync_exit(v7);
  return v6;
}

- (NSString)stream
{
  return self->_stream;
}

- (NSMutableDictionary)eventObserversByIdentifier
{
  return self->_eventObserversByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObserversByIdentifier, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end