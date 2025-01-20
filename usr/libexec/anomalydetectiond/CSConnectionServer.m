@interface CSConnectionServer
- (CLDispatchSilo)dispatchSilo;
- (CSConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4;
- (CSConnectionServerDelegateProtocol)delegate;
- (NSMutableSet)mutableConnections;
- (NSString)serviceName;
- (id).cxx_construct;
- (void)connection:(id)a3 handleMessage:(id)a4;
- (void)connectionHandleDisconnection:(id)a3;
- (void)connectionHandleInterruption:(id)a3;
- (void)dealloc;
@end

@implementation CSConnectionServer

- (CSConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSConnectionServer;
  v9 = [(CSConnectionServer *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchSilo, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = objc_opt_new();
    mutableConnections = v10->_mutableConnections;
    v10->_mutableConnections = (NSMutableSet *)v11;

    objc_initWeak(&location, v10);
    v13 = [(CSConnectionServer *)v10 serviceName];
    sub_100007BC0(v17, v13);
    [(CSConnectionServer *)v10 dispatchSilo];
    [(id)objc_claimAutoreleasedReturnValue() queue];
    objc_claimAutoreleasedReturnValue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10031EEF0;
    v15[3] = &unk_1003BB048;
    objc_copyWeak(&v16, &location);
    objc_retainBlock(v15);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  v3 = [(CSConnectionServer *)self mutableConnections];
  [v3 removeAllObjects];

  mutableConnections = self->_mutableConnections;
  self->_mutableConnections = 0;

  sub_10031F170(&self->_server.__ptr_.__value_, 0);
  v5.receiver = self;
  v5.super_class = (Class)CSConnectionServer;
  [(CSConnectionServer *)&v5 dealloc];
}

- (NSString)serviceName
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CSConnectionServer.mm" lineNumber:58 description:@"Children must provide a serviceName."];

  return 0;
}

- (void)connection:(id)a3 handleMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003BB070);
  }
  id v8 = (id)qword_1003DB728;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v7 name];
    v10 = [v7 payloadObject];
    v12[0] = 68289794;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleMessage\", \"connection\":%{public, location:escape_only}@, \"name\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x30u);
  }
  uint64_t v11 = [(CSConnectionServer *)self delegate];
  [v11 messageReceived:v7 fromConnection:v6];
}

- (void)connectionHandleDisconnection:(id)a3
{
  id v4 = a3;
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003BB070);
  }
  objc_super v5 = qword_1003DB728;
  if (os_log_type_enabled((os_log_t)qword_1003DB728, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleDisconnection\", \"connection\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v6 = [(CSConnectionServer *)self delegate];
  [v6 connectionDisconnected:v4];

  id v7 = [(CSConnectionServer *)self mutableConnections];
  [v7 removeObject:v4];
}

- (void)connectionHandleInterruption:(id)a3
{
  id v4 = a3;
  if (qword_1003DB720 != -1) {
    dispatch_once(&qword_1003DB720, &stru_1003BB070);
  }
  objc_super v5 = qword_1003DB728;
  if (os_log_type_enabled((os_log_t)qword_1003DB728, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"handleInterruption\", \"connection\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  id v6 = [(CSConnectionServer *)self delegate];
  [v6 connectionInterrupted:v4];

  id v7 = [(CSConnectionServer *)self mutableConnections];
  [v7 removeObject:v4];
}

- (NSMutableSet)mutableConnections
{
  return self->_mutableConnections;
}

- (CSConnectionServerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSConnectionServerDelegateProtocol *)WeakRetained;
}

- (CLDispatchSilo)dispatchSilo
{
  return self->_dispatchSilo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSilo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutableConnections, 0);

  sub_10031F170(&self->_server.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end