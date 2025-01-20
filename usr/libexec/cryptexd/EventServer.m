@interface EventServer
- (EventServer)initWithEventStream:(const char *)a3;
- (NSMutableDictionary)clients;
- (OS_os_log)log;
- (OS_xpc_event_publisher)publisher;
- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5;
- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5 toClients:(id)a6;
- (void)activate;
- (void)handlePublisherAddToken:(unint64_t)a3 descriptor:(id)a4;
- (void)handlePublisherError:(int)a3;
- (void)handlePublisherRemoveToken:(unint64_t)a3;
- (void)sendAlreadyInstalledCryptexesToClient:(id)a3;
- (void)withInstalledCryptexList:(id)a3;
@end

@implementation EventServer

- (EventServer)initWithEventStream:(const char *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)EventServer;
  v3 = [(EventServer *)&v16 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.security.cryptexd.event_server", 0);
    uint64_t v5 = xpc_event_publisher_create();
    publisher = v3->_publisher;
    v3->_publisher = (OS_xpc_event_publisher *)v5;

    os_log_t v7 = os_log_create("com.apple.libcryptex", "event_server");
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clients = v3->_clients;
    v3->_clients = v9;

    v11 = [(EventServer *)v3 publisher];
    v15 = v3;
    xpc_event_publisher_set_handler();

    v12 = [(EventServer *)v15 publisher];
    v14 = v15;
    xpc_event_publisher_set_error_handler();
  }
  return v3;
}

- (void)activate
{
  id v2 = [(EventServer *)self publisher];
  xpc_event_publisher_activate();
}

- (void)withInstalledCryptexList:(id)a3
{
  id v3 = a3;
  id v5 = sub_100016EB4();
  id v4 = [v3 copy];

  sub_10001A1E8(v5, (uint64_t)v4, (uint64_t)sub_100015B94);
}

- (void)sendAlreadyInstalledCryptexesToClient:(id)a3
{
  id v4 = a3;
  if ([v4 eventMask])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100015C78;
    v5[3] = &unk_100059CD0;
    v5[4] = self;
    id v6 = v4;
    [(EventServer *)self withInstalledCryptexList:v5];
  }
}

- (void)handlePublisherAddToken:(unint64_t)a3 descriptor:(id)a4
{
  id v6 = a4;
  v21 = 0;
  v22 = 0;
  int v7 = sub_1000403E4(v6, "CryptexEventClientName", &v22);
  if (v7)
  {
    int v8 = *__error();
    v9 = [(EventServer *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "CryptexEventClientName";
      __int16 v25 = 1024;
      LODWORD(v26) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Subscriber missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d", buf, 0x12u);
    }

    v10 = __error();
LABEL_9:
    int *v10 = v8;
    goto LABEL_10;
  }
  int v11 = sub_100040380(v6, "CryptexEventMask", (uint64_t *)&v21);
  if (v11)
  {
    int v8 = *__error();
    v12 = [(EventServer *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = v22;
      __int16 v25 = 2082;
      v26 = "CryptexEventMask";
      __int16 v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Subscriber '%s' missing expected key '%{public}s'. Ignoring.: %{darwin.errno}d", buf, 0x1Cu);
    }

    v10 = __error();
    goto LABEL_9;
  }
  v13 = [EventClient alloc];
  v14 = +[NSString stringWithUTF8String:v22];
  v15 = [(EventClient *)v13 initWithToken:a3 name:v14 eventMask:v21];

  objc_super v16 = [(EventServer *)self clients];
  objc_sync_enter(v16);
  v17 = [(EventServer *)self clients];
  v18 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v17 setObject:v15 forKeyedSubscript:v18];

  objc_sync_exit(v16);
  int v19 = *__error();
  v20 = [(EventServer *)self log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v24 = v22;
    __int16 v25 = 2048;
    v26 = v21;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "'%s' subscribed with event mask 0x%llx, token %llu", buf, 0x20u);
  }

  *__error() = v19;
  [(EventServer *)self sendAlreadyInstalledCryptexesToClient:v15];

LABEL_10:
}

- (void)handlePublisherRemoveToken:(unint64_t)a3
{
  id v5 = [(EventServer *)self clients];
  objc_sync_enter(v5);
  id v6 = [(EventServer *)self clients];
  int v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  int v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [(EventServer *)self clients];
  v10 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v9 removeObjectForKey:v10];

  objc_sync_exit(v5);
  int v11 = *__error();
  v12 = [(EventServer *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v8 clientName];
    int v14 = 138412546;
    v15 = v13;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "'%@' unsubscribed with token %llu", (uint8_t *)&v14, 0x16u);
  }
  *__error() = v11;
}

- (void)handlePublisherError:(int)a3
{
  int v5 = *__error();
  id v6 = [(EventServer *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "XPC publisher error: %{darwin.errno}d", (uint8_t *)v7, 8u);
  }

  *__error() = v5;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5
{
  id v19 = a4;
  id v20 = a5;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = [(EventServer *)self clients];
  objc_sync_enter(v9);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = [(EventServer *)self clients];
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v15 = [(EventServer *)self clients];
        __int16 v16 = [v15 objectForKeyedSubscript:v14];

        if (((unint64_t)[v16 eventMask] & a3) != 0) {
          [v8 addObject:v16];
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
  unint64_t v17 = [(EventServer *)self broadcastEvent:a3 forCryptex:v19 withInfo:v20 toClients:v8];

  return v17;
}

- (id)broadcastEvent:(unint64_t)a3 forCryptex:(id)a4 withInfo:(id)a5 toClients:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v11;
  id v37 = v12;
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  unint64_t v38 = a3;
  xpc_dictionary_set_uint64(v14, "CRYPTEX_EVENT_TYPE", a3);
  id v39 = v10;
  xpc_object_t xdict = v14;
  xpc_dictionary_set_string(v14, "CRYPTEX_EVENT_CRYPTEX_NAME", (const char *)[v39 UTF8String]);
  v35 = v13;
  if (v13)
  {
    id v45 = 0;
    v15 = +[NSPropertyListSerialization dataWithPropertyList:v13 format:100 options:0 error:&v45];
    id v16 = v45;
    if (!v15)
    {
      unint64_t v28 = v16;
      signed int v29 = [v16 code];
      v30 = [(EventServer *)self log];

      if (v30)
      {
        v31 = [(EventServer *)self log];
        os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        *(_WORD *)buf = 0;
        v32 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_WORD *)buf = 0;
        v32 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v27 = sub_10000BF78("-[EventServer broadcastEvent:forCryptex:withInfo:toClients:]", "event_server.m", 220, "com.apple.security.cryptex", v29, v28, v32);
      free(v32);
      goto LABEL_19;
    }
    v34 = v16;
    id v36 = v15;
    xpc_dictionary_set_data(v14, "CRYPTEX_EVENT_INFO", [v36 bytes], (size_t)[v36 length]);
  }
  else
  {
    id v36 = 0;
    v34 = 0;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = v37;
  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v42;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        int v22 = *__error();
        long long v23 = [(EventServer *)self log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          long long v24 = [v21 clientName];
          *(_DWORD *)buf = 134218498;
          unint64_t v47 = v38;
          __int16 v48 = 2112;
          id v49 = v39;
          __int16 v50 = 2112;
          v51 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "event 0x%llx for cryptex '%@' sent to '%@'", buf, 0x20u);
        }
        *__error() = v22;
        __int16 v25 = [(EventServer *)self publisher];
        v26 = [v21 token];
        [v26 unsignedLongLongValue];
        xpc_event_publisher_fire();
      }
      id v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v18);
  }

  CFErrorRef v27 = 0;
  unint64_t v28 = v36;
LABEL_19:

  return v27;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

@end