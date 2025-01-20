@interface CPXIDSRelayCompanion
+ (id)defaultCPXIDSRelayCompanion;
- (CPXIDSRelayCompanion)init;
- (NSMutableDictionary)connectionMap;
- (NSMutableDictionary)connectionSources;
- (NSMutableDictionary)connectionTimers;
- (NSNumber)lockdownPortNum;
- (NSNumber)lockdownPortNumIPV6;
- (OS_dispatch_group)connectionSourceGroup;
- (id)copyLockdownPortNumWithRequireHostIP:(id)a3 ipV6:(BOOL)a4;
- (id)setupListeningSocket:(unsigned __int16)a3 serviceName:(id)a4 requiredHostIP:(id)a5 ipV6:(BOOL)a6 isLowPriority:(BOOL)a7 preferWifi:(BOOL)a8;
- (void)acceptConnection:(id)a3 socket:(int)a4 targetPort:(unint64_t)a5 serviceName:(id)a6 requiredHostIP:(id)a7 isLowPriority:(BOOL)a8 preferWifi:(BOOL)a9;
- (void)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5;
- (void)dealloc;
- (void)handleIDSRelayConnectionResponse:(id)a3 fromID:(id)a4 UUID:(id)a5 context:(id)a6;
- (void)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setConnectionMap:(id)a3;
- (void)setConnectionSourceGroup:(id)a3;
- (void)setConnectionTimers:(id)a3;
- (void)setLockdownPortNum:(id)a3;
- (void)setLockdownPortNumIPV6:(id)a3;
- (void)startTimerForUDID:(id)a3 queue:(id)a4 timeout:(unint64_t)a5 withErrorCallback:(id)a6;
- (void)stopTimerForUDID:(id)a3;
- (void)teardownAllListeningSockets;
- (void)teardownListeningSocket:(unint64_t)a3;
@end

@implementation CPXIDSRelayCompanion

- (CPXIDSRelayCompanion)init
{
  v13.receiver = self;
  v13.super_class = (Class)CPXIDSRelayCompanion;
  v2 = [(CPXIDSRelay *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionTimers = v2->_connectionTimers;
    v2->_connectionTimers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionSources = v2->_connectionSources;
    v2->_connectionSources = v7;

    dispatch_group_t v9 = dispatch_group_create();
    connectionSourceGroup = v2->_connectionSourceGroup;
    v2->_connectionSourceGroup = (OS_dispatch_group *)v9;

    lockdownPortNum = v2->_lockdownPortNum;
    v2->_lockdownPortNum = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(CPXIDSRelayCompanion *)self teardownAllListeningSockets];
  v3.receiver = self;
  v3.super_class = (Class)CPXIDSRelayCompanion;
  [(CPXIDSRelayCompanion *)&v3 dealloc];
}

+ (id)defaultCPXIDSRelayCompanion
{
  if (qword_100019FF8 != -1) {
    dispatch_once(&qword_100019FF8, &stru_1000145F8);
  }
  v2 = (void *)qword_100019FF0;

  return v2;
}

- (id)copyLockdownPortNumWithRequireHostIP:(id)a3 ipV6:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v4)
  {
    p_lockdownPortNumIPV6 = (void **)&v7->_lockdownPortNumIPV6;
    lockdownPortNumIPV6 = v7->_lockdownPortNumIPV6;
    if (!lockdownPortNumIPV6)
    {
      uint64_t v10 = [(CPXIDSRelayCompanion *)v7 setupListeningSocket:62078 serviceName:@"com.apple.mobile.lockdown" requiredHostIP:v6 ipV6:1 isLowPriority:0 preferWifi:0];
LABEL_6:
      v11 = *p_lockdownPortNumIPV6;
      *p_lockdownPortNumIPV6 = (void *)v10;

      lockdownPortNumIPV6 = *p_lockdownPortNumIPV6;
    }
  }
  else
  {
    p_lockdownPortNumIPV6 = (void **)&v7->_lockdownPortNum;
    lockdownPortNumIPV6 = v7->_lockdownPortNum;
    if (!lockdownPortNumIPV6)
    {
      uint64_t v10 = [(CPXIDSRelayCompanion *)v7 setupListeningSocket:62078 serviceName:@"com.apple.mobile.lockdown" requiredHostIP:v6 ipV6:0 isLowPriority:0 preferWifi:0];
      goto LABEL_6;
    }
  }
  id v12 = lockdownPortNumIPV6;
  objc_sync_exit(v7);

  return v12;
}

- (void)startTimerForUDID:(id)a3 queue:(id)a4 timeout:(unint64_t)a5 withErrorCallback:(id)a6
{
  id v10 = a3;
  v11 = a4;
  id v12 = a6;
  if (!v10) {
    sub_10000D910();
  }
  objc_super v13 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000D93C((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
  }
  v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
  v22 = [(CPXIDSRelayCompanion *)self connectionTimers];
  [v22 setObject:v21 forKeyedSubscript:v10];

  dispatch_time_t v23 = dispatch_time(0, 1000000000 * a5);
  dispatch_source_set_timer(v21, v23, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008584;
  handler[3] = &unk_100014620;
  id v27 = v10;
  v28 = self;
  id v29 = v13;
  id v24 = v13;
  id v25 = v10;
  dispatch_source_set_event_handler(v21, handler);
  dispatch_resume(v21);
}

- (void)stopTimerForUDID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000DA28((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id v12 = [(CPXIDSRelayCompanion *)self connectionTimers];
  objc_super v13 = [v12 objectForKeyedSubscript:v4];

  if (v13)
  {
    uint64_t v14 = [(CPXIDSRelayCompanion *)self connectionTimers];
    uint64_t v15 = [v14 objectForKeyedSubscript:v4];
    dispatch_source_cancel(v15);

    uint64_t v16 = [(CPXIDSRelayCompanion *)self connectionTimers];
    [v16 removeObjectForKey:v4];
  }
}

- (void)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008720;
  block[3] = &unk_100014648;
  BOOL v6 = a5;
  BOOL v7 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008980;
  block[3] = &unk_100014648;
  BOOL v6 = a4;
  BOOL v7 = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)setupListeningSocket:(unsigned __int16)a3 serviceName:(id)a4 requiredHostIP:(id)a5 ipV6:(BOOL)a6 isLowPriority:(BOOL)a7 preferWifi:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  unsigned int v12 = a3;
  id v14 = a4;
  id v15 = a5;
  *(void *)&v95.sa_len = 0;
  *(void *)&v95.sa_data[6] = 0;
  uint64_t v80 = 0;
  in6_addr v81 = (in6_addr)0;
  int v82 = 0;
  socklen_t v79 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  int v78 = -1;
  if (v10) {
    int v16 = 30;
  }
  else {
    int v16 = 2;
  }
  int v17 = socket(v16, 1, 0);
  *((_DWORD *)v76 + 6) = v17;
  if (v17 == -1)
  {
    id v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *__error();
      id v24 = __error();
      id v25 = strerror(*v24);
      *(_DWORD *)buf = 67109378;
      unsigned int v84 = v23;
      __int16 v85 = 2080;
      v86 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "socket failed: %d (%s)", buf, 0x12u);
    }

    goto LABEL_37;
  }
  if (v10)
  {
    int v74 = 1;
    LODWORD(v80) = 7708;
    in6_addr v81 = in6addr_any;
    socklen_t v79 = 28;
    if (setsockopt(v17, 41, 27, &v74, 4u))
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *__error();
        uint64_t v20 = __error();
        v21 = strerror(*v20);
        *(_DWORD *)buf = 67109378;
        unsigned int v84 = v19;
        __int16 v85 = 2080;
        v86 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt failed: %d (%s)", buf, 0x12u);
      }
      goto LABEL_36;
    }
    int v17 = *((_DWORD *)v76 + 6);
    id v27 = (sockaddr *)&v80;
    socklen_t v26 = v79;
  }
  else
  {
    v95.sa_family = 2;
    *(_WORD *)v95.sa_data = 0;
    *(_DWORD *)&v95.sa_data[2] = 0;
    socklen_t v26 = 16;
    socklen_t v79 = 16;
    id v27 = &v95;
  }
  if (bind(v17, v27, v26) == -1)
  {
    id v43 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    int v44 = *__error();
    v45 = __error();
    v46 = strerror(*v45);
    *(_DWORD *)buf = 67109378;
    unsigned int v84 = v44;
    __int16 v85 = 2080;
    v86 = v46;
    v47 = "bind error: %d (%s)";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v47, buf, 0x12u);
    goto LABEL_36;
  }
  if (getsockname(*((_DWORD *)v76 + 6), v27, &v79) == -1)
  {
    id v48 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    int v49 = *__error();
    v50 = __error();
    v51 = strerror(*v50);
    *(_DWORD *)buf = 67109378;
    unsigned int v84 = v49;
    __int16 v85 = 2080;
    v86 = v51;
    v47 = "getsockname error: %d (%s)";
    goto LABEL_35;
  }
  v28 = &v95;
  if (v10) {
    v28 = (sockaddr *)&v80;
  }
  unsigned int v29 = *(unsigned __int16 *)v28->sa_data;
  if (listen(*((_DWORD *)v76 + 6), 128) == -1)
  {
    id v52 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = *__error();
      v54 = __error();
      v55 = strerror(*v54);
      *(_DWORD *)buf = 67109378;
      unsigned int v84 = v53;
      __int16 v85 = 2080;
      v86 = v55;
      v47 = "listen error: %d (%s)";
      goto LABEL_35;
    }
LABEL_36:

    close(*((_DWORD *)v76 + 6));
LABEL_37:
    v42 = 0;
    goto LABEL_38;
  }
  uintptr_t v30 = *((int *)v76 + 6);
  v31 = dispatch_get_global_queue(0, 0);
  v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v30, 0, v31);

  if (v32)
  {
    unsigned int v59 = bswap32(v29) >> 16;
    v33 = -[CPXIDSForwardingProxy initWithServerPort:targetingPort:]([CPXIDSForwardingProxy alloc], "initWithServerPort:targetingPort:");
    if (v33)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100009378;
      handler[3] = &unk_100014670;
      void handler[4] = self;
      v70 = &v75;
      __int16 v71 = v12;
      id v34 = v14;
      id v68 = v34;
      id v58 = v15;
      id v69 = v58;
      BOOL v72 = a7;
      BOOL v73 = v8;
      dispatch_source_set_event_handler(v32, handler);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1000093F4;
      v60[3] = &unk_100014670;
      __int16 v65 = v59;
      __int16 v66 = v12;
      v64 = &v75;
      id v35 = v34;
      id v61 = v35;
      v62 = self;
      v36 = v33;
      v63 = v36;
      dispatch_source_set_cancel_handler(v32, v60);
      dispatch_resume(v32);
      v37 = [(CPXIDSRelayCompanion *)self connectionSourceGroup];
      dispatch_group_enter(v37);

      v38 = [(CPXIDSRelayCompanion *)self connectionSources];
      objc_sync_enter(v38);
      v39 = [(CPXIDSRelayCompanion *)self connectionSources];
      [v39 setObject:v32 forKey:v36];

      objc_sync_exit(v38);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v40 = @"(ipV4)";
        *(_DWORD *)buf = 67110402;
        unsigned int v84 = v59;
        __int16 v85 = 2048;
        v86 = (char *)v12;
        if (v10) {
          CFStringRef v40 = @"(ipV6)";
        }
        CFStringRef v41 = @"(Bluetooth)";
        __int16 v87 = 2112;
        id v88 = v35;
        __int16 v89 = 2112;
        if (v8) {
          CFStringRef v41 = @"(WiFi)";
        }
        id v90 = v58;
        __int16 v91 = 2112;
        CFStringRef v92 = v40;
        __int16 v93 = 2112;
        CFStringRef v94 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Forward port companion %d to gizmo %lu for %@ %@ %@. Client link preference: %@", buf, 0x3Au);
      }
      v42 = +[NSNumber numberWithUnsignedShort:v59];

      goto LABEL_47;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v57 = "Failed to create proxied ports object.";
      goto LABEL_45;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v57 = "Failed to create listening dispatch source";
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
  }
  close(*((_DWORD *)v76 + 6));
  v42 = 0;
LABEL_47:

LABEL_38:
  _Block_object_dispose(&v75, 8);

  return v42;
}

- (void)teardownListeningSocket:(unint64_t)a3
{
  uint64_t v5 = [(CPXIDSRelayCompanion *)self connectionSources];
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = [(CPXIDSRelayCompanion *)self connectionSources];
  BOOL v7 = [v6 allKeys];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 targetPort] == a3)
        {
          unsigned int v12 = [(CPXIDSRelayCompanion *)self connectionSources];
          objc_super v13 = [v12 objectForKey:v11];

          if (v13) {
            dispatch_source_cancel(v13);
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)teardownAllListeningSockets
{
  objc_super v3 = [(CPXIDSRelayCompanion *)self connectionSources];
  id v4 = [v3 allValues];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v22 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There are %lu sources to tear down", buf, 0xCu);
  }
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v16 + 1) + 8 * i));
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    BOOL v10 = [(CPXIDSRelayCompanion *)self connectionSourceGroup];
    dispatch_time_t v11 = dispatch_time(0, 3000000000);
    intptr_t v12 = dispatch_group_wait(v10, v11);

    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (!v13) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      long long v14 = "Timed out waiting to cancel all connection sources";
    }
    else
    {
      if (!v13) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      long long v14 = "Successfully cancelled all connection sources";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
LABEL_17:
  long long v15 = [(CPXIDSRelayCompanion *)self connectionSources];
  if ([v15 count]) {
    sub_10000DA9C();
  }
}

- (void)acceptConnection:(id)a3 socket:(int)a4 targetPort:(unint64_t)a5 serviceName:(id)a6 requiredHostIP:(id)a7 isLowPriority:(BOOL)a8 preferWifi:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  *(void *)&v51.sa_len = 0;
  *(void *)&v51.sa_data[6] = 0;
  socklen_t v44 = 16;
  char v43 = 0;
  uint64_t v18 = accept(a4, &v51, &v44);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    id v34 = "Must have a host IP to check against";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    goto LABEL_20;
  }
  uint64_t v19 = v18;
  uint64_t v20 = sub_10000AE34(v18, &v43);
  if (!v20)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    id v34 = "createIPStringFromSocket failed";
    goto LABEL_16;
  }
  v21 = v20;
  if (a5 == 62078 || ([v20 isEqualToString:v17] & 1) != 0)
  {
    id v35 = v21;
    -[CPXIDSRelayCompanion acquirePort:isLowPriority:preferWifi:](self, "acquirePort:isLowPriority:preferWifi:", a5, v9);
    id v22 = +[NSUUID UUID];
    int v23 = [v22 UUIDString];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v46 = v16;
      __int16 v47 = 1024;
      *(_DWORD *)id v48 = a5;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Accepted a connection for service %@ with target port: %d and sending IDSRelayMessageConnect with UUID: %@", buf, 0x1Cu);
    }
    id v24 = objc_opt_new();
    [v24 setObject:&off_100015318 forKeyedSubscript:@"Type"];
    [v24 setObject:v23 forKeyedSubscript:@"UUID"];
    id v25 = +[NSNumber numberWithUnsignedInteger:a5];
    [v24 setObject:v25 forKeyedSubscript:@"Port"];

    socklen_t v26 = +[NSNumber numberWithBool:v9];
    [v24 setObject:v26 forKeyedSubscript:@"LowPriority"];

    id v27 = +[NSNumber numberWithInt:v19];
    [v24 setObject:v27 forKeyedSubscript:@"Socket"];

    v28 = +[NSNumber numberWithBool:a9];
    [v24 setObject:v28 forKeyedSubscript:@"PreferWifi"];

    if (v16) {
      [v24 setObject:v16 forKeyedSubscript:@"ServiceName"];
    }
    unsigned int v29 = [(CPXIDSRelayCompanion *)self connectionMap];
    [v29 setObject:v24 forKey:v23];

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100009E4C;
    v36[3] = &unk_100014698;
    v36[4] = self;
    id v30 = v23;
    id v37 = v30;
    unint64_t v39 = a5;
    BOOL v41 = v9;
    BOOL v42 = a9;
    id v38 = v16;
    int v40 = v19;
    v31 = objc_retainBlock(v36);
    v32 = [(CPXIDSRelay *)self queue];
    [(CPXIDSRelayCompanion *)self startTimerForUDID:v30 queue:v32 timeout:35 withErrorCallback:v31];

    v33 = [(CPXIDSRelay *)self sendMessage:v15 messageDictionary:v24];
    if (!v33)
    {
      [(CPXIDSRelayCompanion *)self stopTimerForUDID:v30];
      ((void (*)(void *))v31[2])(v31);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v46 = v21;
      __int16 v47 = 2112;
      *(void *)id v48 = v17;
      *(_WORD *)&v48[8] = 2112;
      *(void *)&v48[10] = v16;
      __int16 v49 = 2048;
      unint64_t v50 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Denying host at %@, was expecting %@. Must be same IP that started %@ on %lu.", buf, 0x2Au);
    }
  }
LABEL_20:
}

- (void)handleIDSRelayConnectionResponse:(id)a3 fromID:(id)a4 UUID:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v10 deviceForFromID:v11];
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x2020000000;
  int v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  unint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  socklen_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_10000A434;
  __int16 v47 = sub_10000A444;
  id v48 = 0;
  id v15 = [(CPXIDSRelayCompanion *)self connectionMap];
  id v16 = [v15 objectForKey:v12];

  if (v16)
  {
    [(CPXIDSRelayCompanion *)self stopTimerForUDID:v12];
    id v17 = [(CPXIDSRelayCompanion *)self connectionMap];
    [v17 removeObjectForKey:v12];

    uint64_t v18 = [v16 objectForKey:@"Socket"];
    unsigned int v19 = [v18 intValue];
    *((_DWORD *)v58 + 6) = v19;

    uint64_t v20 = [v16 objectForKey:@"Port"];
    id v21 = [v20 unsignedIntegerValue];
    v54[3] = (uint64_t)v21;

    id v22 = [v16 objectForKey:@"LowPriority"];
    unsigned __int8 v23 = [v22 BOOLValue];
    *((unsigned char *)v50 + 24) = v23;

    uint64_t v24 = [v16 objectForKey:@"ServiceName"];
    id v25 = (void *)v44[5];
    v44[5] = v24;

    socklen_t v26 = [v16 objectForKey:@"PreferWifi"];
    unsigned __int8 v27 = [v26 BOOLValue];

    v66[0] = IDSOpenSocketOptionTransportKey;
    v66[1] = IDSOpenSocketOptionPriorityKey;
    v67[0] = &off_100015330;
    v67[1] = &off_100015348;
    v66[2] = IDSOpenSocketOptionStreamNameKey;
    v67[2] = v12;
    v28 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v62 = 0x3032000000;
    v63 = sub_10000A434;
    v64 = sub_10000A444;
    id v65 = 0;
    id v29 = objc_alloc((Class)IDSDeviceConnection);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000A44C;
    v33[3] = &unk_100014708;
    p_long long buf = &buf;
    id v38 = &v57;
    unint64_t v39 = &v53;
    id v34 = v12;
    id v35 = self;
    int v40 = &v43;
    BOOL v41 = &v49;
    unsigned __int8 v42 = v27;
    id v36 = v13;
    id v30 = [(CPXIDSRelay *)self queue];
    id v31 = [v29 initSocketWithDevice:v14 options:v28 completionHandler:v33 queue:v30];
    v32 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v31;

    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error locating entry in connection map for %@", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v21 = 0;
  long long v14 = +[NSPropertyListSerialization propertyListWithData:a5 options:0 format:0 error:&v21];
  id v15 = v21;
  if (v14)
  {
    id v16 = [v14 objectForKey:@"Type"];
    unsigned __int16 v17 = (unsigned __int16)[v16 intValue];

    uint64_t v18 = [v14 objectForKey:@"UUID"];
    if (v17 == 2)
    {
      [(CPXIDSRelayCompanion *)self handleIDSRelayConnectionResponse:v11 fromID:v12 UUID:v18 context:v13];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: unknown message", v19, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error creating dictionary for message", buf, 2u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (!a6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error occurred sending message (id: %@): %@", (uint8_t *)&v15, 0x16u);
  }
}

- (NSNumber)lockdownPortNum
{
  return self->_lockdownPortNum;
}

- (void)setLockdownPortNum:(id)a3
{
}

- (NSNumber)lockdownPortNumIPV6
{
  return self->_lockdownPortNumIPV6;
}

- (void)setLockdownPortNumIPV6:(id)a3
{
}

- (NSMutableDictionary)connectionSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)connectionMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionMap:(id)a3
{
}

- (NSMutableDictionary)connectionTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionTimers:(id)a3
{
}

- (OS_dispatch_group)connectionSourceGroup
{
  return self->_connectionSourceGroup;
}

- (void)setConnectionSourceGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSourceGroup, 0);
  objc_storeStrong((id *)&self->_connectionTimers, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_connectionSources, 0);
  objc_storeStrong((id *)&self->_lockdownPortNumIPV6, 0);

  objc_storeStrong((id *)&self->_lockdownPortNum, 0);
}

@end