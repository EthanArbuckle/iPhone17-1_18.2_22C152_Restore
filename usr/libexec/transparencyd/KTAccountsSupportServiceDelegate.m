@interface KTAccountsSupportServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_workloop)xpcQueue;
- (TransparencydIDSSupportProtocol)daemonContext;
- (void)setDaemonContext:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation KTAccountsSupportServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"application-identifier"];
  v7 = [v5 valueForEntitlement:@"com.apple.transparencyd.accounts-support"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8)
  {
    if (qword_100326870 != -1) {
      dispatch_once(&qword_100326870, &stru_1002BD630);
    }
    v9 = qword_100326878;
    if (os_log_type_enabled((os_log_t)qword_100326878, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      v16[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "accounts-support accepting new connection from %@", (uint8_t *)&v15, 0xCu);
    }
    v10 = [(KTAccountsSupportServiceDelegate *)self xpcQueue];
    [v5 _setQueue:v10];

    v11 = +[TransparencyAccountsSupportInterface interface];
    [v5 setExportedInterface:v11];

    [v5 setExportedObject:self->_daemonContext];
    [v5 resume];
  }
  else
  {
    if (qword_100326870 != -1) {
      dispatch_once(&qword_100326870, &stru_1002BD610);
    }
    v12 = (void *)qword_100326878;
    if (os_log_type_enabled((os_log_t)qword_100326878, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      int v15 = 67109378;
      LODWORD(v16[0]) = [v5 processIdentifier];
      WORD2(v16[0]) = 2112;
      *(void *)((char *)v16 + 6) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "accounts-support rejecting client %d/[%@] due to lack of entitlement", (uint8_t *)&v15, 0x12u);
    }
  }

  return v8;
}

- (OS_dispatch_workloop)xpcQueue
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcQueue:(id)a3
{
}

- (TransparencydIDSSupportProtocol)daemonContext
{
  return (TransparencydIDSSupportProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDaemonContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);

  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end