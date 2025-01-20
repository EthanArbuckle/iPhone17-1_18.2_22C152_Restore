@interface MainServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_workloop)xpcQueue;
- (transparencyd)daemonContext;
- (void)setDaemonContext:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation MainServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"application-identifier"];
  v7 = [v5 valueForEntitlement:@"com.apple.transparency.kt"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8)
  {
    if (qword_100326870 != -1) {
      dispatch_once(&qword_100326870, &stru_1002BD5B0);
    }
    v9 = (void *)qword_100326878;
    if (os_log_type_enabled((os_log_t)qword_100326878, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      int v16 = 138412546;
      *(void *)v17 = v6;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = [v5 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "transparency accepting new connection from: %@[%d]", (uint8_t *)&v16, 0x12u);
    }
    v11 = [(MainServiceDelegate *)self xpcQueue];
    [v5 _setQueue:v11];

    v12 = +[TransparencyXPCInterface interface];
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:self->_daemonContext];
    [v5 resume];
  }
  else
  {
    if (qword_100326870 != -1) {
      dispatch_once(&qword_100326870, &stru_1002BD590);
    }
    v13 = (void *)qword_100326878;
    if (os_log_type_enabled((os_log_t)qword_100326878, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      int v16 = 67109378;
      *(_DWORD *)v17 = [v5 processIdentifier];
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "transparency rejecting client %d/[%@] due to lack of entitlement", (uint8_t *)&v16, 0x12u);
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

- (transparencyd)daemonContext
{
  return (transparencyd *)objc_getProperty(self, a2, 16, 1);
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