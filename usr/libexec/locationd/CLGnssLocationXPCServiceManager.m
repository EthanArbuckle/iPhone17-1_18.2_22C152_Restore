@interface CLGnssLocationXPCServiceManager
- (CLGnssLocationXPCServiceManager)init;
- (NSXPCConnection)connection;
- (id)getConnection;
- (id)getSynchronousRemoteObjectProxy;
- (void)configureInitializeAndStartRavenSupervisorWithPlatformInfo:(id)a3 withParametersOverrideString:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)getRavenSolutionAtMCTime:(double)a3 WithReply:(id)a4;
- (void)getRavenSolutionWithReply:(id)a3;
- (void)pauseResetAndFreeRavenSupervisorWithCompletion:(id)a3;
- (void)raiseRavenEventsFromData:(id)a3;
- (void)reconfigureRavenIfNeeded;
- (void)reset;
- (void)setConnection:(id)a3;
- (void)shutdown;
@end

@implementation CLGnssLocationXPCServiceManager

- (CLGnssLocationXPCServiceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLGnssLocationXPCServiceManager;
  v2 = [(CLGnssLocationXPCServiceManager *)&v7 init];
  if (v2)
  {
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v3 = qword_102419408;
    if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,init", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419400 != -1) {
        dispatch_once(&qword_102419400, &stru_1022B8110);
      }
      v4 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager init]", "%s\n");
LABEL_19:
      if (v4 != buf) {
        free(v4);
      }
    }
  }
  else
  {
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v5 = qword_102419408;
    if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLGLS,CLGnssLocationXPCServiceManager,could not initialize object", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419400 != -1) {
        dispatch_once(&qword_102419400, &stru_1022B8110);
      }
      v4 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGnssLocationXPCServiceManager init]", "%s\n");
      goto LABEL_19;
    }
  }
  *(_WORD *)&v2->fRavenCurrentlyRunning = 0;
  v2->fRavenPlatformInfoData = 0;
  v2->fRavenParametersString = 0;
  return v2;
}

- (id)getConnection
{
  id result = self->_connection;
  if (!result)
  {
    id result = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.corelocation.GNSSLocationService"];
    self->_connection = (NSXPCConnection *)result;
    if (result)
    {
      [(NSXPCConnection *)self->_connection setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GNSSLocationServiceProtocol]];
      uint64_t v4 = objc_opt_class();
      v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
      [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v5 forSelector:"getRavenSolutionWithReply:" argumentIndex:0 ofReply:0];
      [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v5 forSelector:"getRavenSolutionWithReply:" argumentIndex:0 ofReply:1];
      [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v5 forSelector:"getRavenSolutionAtMCTime:WithReply:" argumentIndex:0 ofReply:0];
      [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v5 forSelector:"getRavenSolutionAtMCTime:WithReply:" argumentIndex:0 ofReply:1];
      [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v5 forSelector:"raiseRavenEventsFromData:" argumentIndex:0 ofReply:0];
      connection = self->_connection;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100508F10;
      v9[3] = &unk_10229FED8;
      v9[4] = self;
      [(NSXPCConnection *)connection setInvalidationHandler:v9];
      objc_super v7 = self->_connection;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1005090BC;
      v8[3] = &unk_10229FED8;
      v8[4] = self;
      [(NSXPCConnection *)v7 setInterruptionHandler:v8];
      [(NSXPCConnection *)self->_connection activate];
      return self->_connection;
    }
  }
  return result;
}

- (void)dealloc
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  v3 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,dealloc", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    __int16 v9 = 0;
    objc_super v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager dealloc]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
  }
  self->_connection = 0;
  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0;
  }
  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CLGnssLocationXPCServiceManager;
  [(CLGnssLocationXPCServiceManager *)&v8 dealloc];
}

- (void)reconfigureRavenIfNeeded
{
  if (self->fRavenCurrentlyRunning
    && self->fConnectionInterruptedAfterRavenConfiguration
    && self->fRavenPlatformInfoData
    && self->fRavenParametersString)
  {
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v3 = qword_102419408;
    if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,reconfigureRavenIfNeeded", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419400 != -1) {
        dispatch_once(&qword_102419400, &stru_1022B8110);
      }
      __int16 v9 = 0;
      objc_super v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager reconfigureRavenIfNeeded]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    id v4 = [(CLGnssLocationXPCServiceManager *)self getSynchronousRemoteObjectProxy];
    fRavenPlatformInfoData = self->fRavenPlatformInfoData;
    fRavenParametersString = self->fRavenParametersString;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100509678;
    v8[3] = &unk_1022B7C20;
    v8[4] = self;
    [v4 configureInitializeAndStartRavenSupervisorWithPlatformInfo:fRavenPlatformInfoData withParametersOverrideString:fRavenParametersString withCompletion:v8];
  }
}

- (id)getSynchronousRemoteObjectProxy
{
  id v2 = [(CLGnssLocationXPCServiceManager *)self getConnection];

  return [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_1022B80C8];
}

- (void)configureInitializeAndStartRavenSupervisorWithPlatformInfo:(id)a3 withParametersOverrideString:(id)a4 withCompletion:(id)a5
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  __int16 v9 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,configureInitializeAndStartRavenSupervisorWithPlatformInfo", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager configureInitializeAndStartRavenSupervisorWithPlatformInfo:withParametersOverrideString:withCompletion:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy")) configureInitializeAndStartRavenSupervisorWithPlatformInfo:a3 withParametersOverrideString:a4 withCompletion:a5];
  *(_WORD *)&self->fRavenCurrentlyRunning = 1;
  self->fRavenPlatformInfoData = (NSData *)a3;
  self->fRavenParametersString = (NSString *)a4;
}

- (void)pauseResetAndFreeRavenSupervisorWithCompletion:(id)a3
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  v5 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,pauseResetAndFreeRavenSupervisor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager pauseResetAndFreeRavenSupervisorWithCompletion:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100509DEC;
  v7[3] = &unk_1022B7C48;
  v7[4] = self;
  v7[5] = a3;
  [(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy")) pauseResetAndFreeRavenSupervisorWithCompletion:v7];
}

- (void)getRavenSolutionAtMCTime:(double)a3 WithReply:(id)a4
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  objc_super v7 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply,%{public}.2lf", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    int v10 = 134349056;
    double v11 = a3;
    __int16 v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager getRavenSolutionAtMCTime:WithReply:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  [(CLGnssLocationXPCServiceManager *)self reconfigureRavenIfNeeded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10050A058;
  v9[3] = &unk_1022B80F0;
  v9[4] = a4;
  [[-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy") getRavenSolutionAtMCTime:v9 WithReply:a3];
}

- (void)getRavenSolutionWithReply:(id)a3
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  v5 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGLS,CLGnssLocationXPCServiceManager,getRavenSolutionAtMCTimeWithReply", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager getRavenSolutionWithReply:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(CLGnssLocationXPCServiceManager *)self reconfigureRavenIfNeeded];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10050A260;
  v7[3] = &unk_1022B80F0;
  v7[4] = a3;
  [(-[CLGnssLocationXPCServiceManager getSynchronousRemoteObjectProxy](self, "getSynchronousRemoteObjectProxy")) getRavenSolutionWithReply:v7];
}

- (void)raiseRavenEventsFromData:(id)a3
{
  [(CLGnssLocationXPCServiceManager *)self reconfigureRavenIfNeeded];
  id v5 = [(CLGnssLocationXPCServiceManager *)self getSynchronousRemoteObjectProxy];

  [v5 raiseRavenEventsFromData:a3];
}

- (void)reset
{
  if (qword_102419400 != -1) {
    dispatch_once(&qword_102419400, &stru_1022B8110);
  }
  v3 = qword_102419408;
  if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,reset", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager reset]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  fRavenPlatformInfoData = self->fRavenPlatformInfoData;
  if (fRavenPlatformInfoData)
  {

    self->fRavenPlatformInfoData = 0;
  }
  fRavenParametersString = self->fRavenParametersString;
  if (fRavenParametersString)
  {

    self->fRavenParametersString = 0;
  }
  self->fRavenCurrentlyRunning = 0;
}

- (void)shutdown
{
  [(CLGnssLocationXPCServiceManager *)self reset];
  if (self->_connection)
  {
    if (qword_102419400 != -1) {
      dispatch_once(&qword_102419400, &stru_1022B8110);
    }
    v3 = qword_102419408;
    if (os_log_type_enabled((os_log_t)qword_102419408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,invalidating connection", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419400 != -1) {
        dispatch_once(&qword_102419400, &stru_1022B8110);
      }
      id v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssLocationXPCServiceManager shutdown]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(NSXPCConnection *)self->_connection invalidate];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end