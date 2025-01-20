@interface MMTConnection
- (BOOL)sendMessage:(id)a3;
- (DMCPowerAssertion)powerAssertion;
- (MDMAbstractTunnelParser)parser;
- (MMTConnection)initWithLockdownConnection:(_lockdown_connection *)a3;
- (OS_dispatch_queue)workQueue;
- (_lockdown_connection)lockdownConnection;
- (id)parseErrorFromResponse:(id)a3;
- (id)receiveMessage;
- (void)executeNextCommand;
- (void)setLockdownConnection:(_lockdown_connection *)a3;
- (void)setParser:(id)a3;
- (void)start;
@end

@implementation MMTConnection

- (MMTConnection)initWithLockdownConnection:(_lockdown_connection *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MMTConnection;
  v4 = [(MMTConnection *)&v20 init];
  if (v4)
  {
    v5 = (DMCPowerAssertion *)[objc_alloc((Class)DMCPowerAssertion) initWithReason:@"mc_mobile_tunnel-MMTConnection"];
    powerAssertion = v4->_powerAssertion;
    v4->_powerAssertion = v5;

    v4->_lockdownConnection = a3;
    dispatch_queue_t v7 = dispatch_queue_create("Work Queue", 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v7;

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForceTunnelIsSupervised", @"com.apple.managedconfiguration", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue)
    {
      uint64_t v10 = objc_opt_new();
      parser = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v10;
    }
    else
    {
      uint64_t v12 = objc_opt_new();
      v13 = v4->_parser;
      v4->_parser = (MDMAbstractTunnelParser *)v12;

      objc_initWeak(&location, v4);
      v14 = v4->_parser;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100004A70;
      v16[3] = &unk_100010778;
      objc_copyWeak(&v17, &location);
      [(MDMAbstractTunnelParser *)v14 setEscalationBlock:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return v4;
}

- (void)start
{
  v3 = [(MMTConnection *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B74;
  block[3] = &unk_1000107A0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)receiveMessage
{
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    v14 = [(MMTConnection *)self lockdownConnection];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Receiving on lockdown connection: %p", buf, 0xCu);
  }
  [(MMTConnection *)self lockdownConnection];
  uint64_t v5 = lockdown_recv();
  if (v5)
  {
    v6 = (_lockdown_connection *)v5;
    if (v5 == 4)
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Message cannot be zero length", buf, 2u);
      }
    }
    else
    {
      dispatch_queue_t v7 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = __error();
        uint64_t v10 = strerror(*v9);
        *(_DWORD *)buf = 134218242;
        v14 = v6;
        __int16 v15 = 2082;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not receive size of message: %ld %{public}s", buf, 0x16u);
      }
    }
  }

  return 0;
}

- (BOOL)sendMessage:(id)a3
{
  v4 = (_lockdown_connection *)a3;
  uint64_t v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v27 = [(MMTConnection *)self lockdownConnection];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending response on lockdown connection: %p", buf, 0xCu);
  }
  dispatch_queue_t v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = [(_lockdown_connection *)v4 objectForKeyedSubscript:@"Status"];
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending reply status: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Sending message: %{private}@", buf, 0xCu);
  }
  if (v4)
  {
    id v25 = 0;
    v11 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:&v25];
    uint64_t v12 = (_lockdown_connection *)v25;
    if (!v11)
    {
      __int16 v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Cannot convert reply dictionary into PList: %{public}@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    unsigned int v13 = [v11 length];
    [(MMTConnection *)self lockdownConnection];
    if (lockdown_send() == 4)
    {
      [(MMTConnection *)self lockdownConnection];
      [v11 bytes];
      if (lockdown_send() == v13)
      {
        BOOL v14 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v21 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v17 = v21;
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 136446210;
        v27 = (_lockdown_connection *)v23;
        objc_super v20 = "Could not send message: %{public}s";
        goto LABEL_19;
      }
    }
    else
    {
      v16 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = v16;
        v18 = __error();
        v19 = strerror(*v18);
        *(_DWORD *)buf = 136446210;
        v27 = (_lockdown_connection *)v19;
        objc_super v20 = "Could not send message size: %{public}s";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
      }
    }
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  BOOL v14 = 0;
LABEL_22:

  return v14;
}

- (id)parseErrorFromResponse:(id)a3
{
  id v3 = [a3 mutableCopy];
  uint64_t v4 = kMCTPErrorObjectKey;
  uint64_t v5 = [v3 objectForKeyedSubscript:kMCTPErrorObjectKey];
  if (v5)
  {
    [v3 setObject:0 forKeyedSubscript:v4];
    uint64_t v6 = +[NSMutableData data];
    id v21 = [objc_alloc((Class)NSArchiver) initForWritingWithMutableData:v6];
    [v21 encodeRootObject:v5];
    v24 = v3;
    v22 = (void *)v6;
    [v3 setObject:v6 forKeyedSubscript:@"CommandErrorArchive"];
    dispatch_queue_t v7 = objc_opt_new();
    v23 = v5;
    id v8 = v5;
    uint64_t v9 = kMDMPErrorChainLocalizedDescriptionKey;
    uint64_t v10 = kMDMPErrorChainErrorDomainKey;
    uint64_t v11 = kMDMPErrorChainUSEnglishDescriptionKey;
    uint64_t v12 = kMDMPErrorChainErrorCodeKey;
    do
    {
      unsigned int v13 = +[NSMutableDictionary dictionaryWithCapacity:4];
      BOOL v14 = [v8 userInfo];
      __int16 v15 = [v8 localizedDescription];
      [v13 setObject:v15 forKeyedSubscript:v9];

      v16 = [v8 domain];
      [v13 setObject:v16 forKeyedSubscript:v10];

      id v17 = [v8 DMCUSEnglishDescription];
      [v13 setObject:v17 forKeyedSubscript:v11];

      v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
      [v13 setObject:v18 forKeyedSubscript:v12];

      [v7 addObject:v13];
      uint64_t v19 = [v14 objectForKey:NSUnderlyingErrorKey];

      id v8 = (id)v19;
    }
    while (v19);
    id v3 = v24;
    [v24 setObject:v7 forKeyedSubscript:kMDMPErrorChainKey];

    uint64_t v5 = v23;
  }

  return v3;
}

- (void)executeNextCommand
{
  id v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    *(_DWORD *)buf = 134217984;
    __int16 v15 = [(MMTConnection *)self lockdownConnection];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Executing command from lockdown connection: %p", buf, 0xCu);
  }
  uint64_t v5 = [(MMTConnection *)self receiveMessage];
  if (byte_100014BC0) {
    goto LABEL_9;
  }
  if ((+[DMCMobileGestalt isAppleTV] & 1) != 0
    || !DMIsMigrationNeeded())
  {
LABEL_8:
    byte_100014BC0 = 1;
LABEL_9:
    if (v5)
    {
      uint64_t v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        dispatch_queue_t v7 = v6;
        id v8 = [v5 objectForKeyedSubscript:@"RequestType"];
        *(_DWORD *)buf = 138543362;
        __int16 v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received request: %{public}@", buf, 0xCu);
      }
      uint64_t v9 = [(MMTConnection *)self parser];
      uint64_t v10 = [(MMTConnection *)self powerAssertion];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000058C0;
      v12[3] = &unk_1000107C8;
      v12[4] = self;
      [v9 processRequest:v5 assertion:v10 completionBlock:v12];
    }
    else
    {
      uint64_t v9 = +[MMTConnectionManager sharedInstance];
      [v9 removeConnection:self];
    }
    goto LABEL_14;
  }
  if (MKBDeviceUnlockedSinceBoot())
  {
    DMPerformMigrationIfNeeded();
    goto LABEL_8;
  }
  uint64_t v11 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Telling client to wait until preboard is finished.", buf, 2u);
  }
  [(MMTConnection *)self sendMessage:&off_1000113F0];
  uint64_t v9 = [(MMTConnection *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058B8;
  block[3] = &unk_1000107A0;
  block[4] = self;
  dispatch_async(v9, block);
LABEL_14:
}

- (_lockdown_connection)lockdownConnection
{
  return self->_lockdownConnection;
}

- (void)setLockdownConnection:(_lockdown_connection *)a3
{
  self->_lockdownConnection = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (MDMAbstractTunnelParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (DMCPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end