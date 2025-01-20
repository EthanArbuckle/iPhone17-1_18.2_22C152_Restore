@interface RDListener
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)description;
- (NSXPCListener)listener;
- (id)exportedObject;
- (void)dealloc;
- (void)setExportedObject:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation RDListener

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAE0 = (uint64_t)os_log_create("com.apple.SensorKit", "DaemonListener");
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"%@ %@", self->_serviceName, self->_listener];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(RDListener *)self setListener:0];

  self->_connections = 0;
  self->_exportedObject = 0;

  self->_exportedInterface = 0;
  self->_remoteObjectInterface = 0;

  self->_serviceName = 0;
  self->_stateCache = 0;
  objc_setProperty_nonatomic(self, v3, 0, 40);
  v4.receiver = self;
  v4.super_class = (Class)RDListener;
  [(RDListener *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = qword_10006EAE0;
  if (os_log_type_enabled((os_log_t)qword_10006EAE0, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138412290;
    v20 = serviceName;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got a connection attempt on %@", buf, 0xCu);
  }
  else if (!self)
  {
    goto LABEL_11;
  }
  stateCache = self->_stateCache;
  if (stateCache)
  {
    uint64_t v9 = mach_continuous_time();
    if (qword_10006EC88 != -1) {
      dispatch_once(&qword_10006EC88, &stru_10005CDC0);
    }
    BOOL v10 = qword_10006EC90 < v9;
    double v11 = *(double *)&qword_10006EC98;
    double v12 = *(double *)&qword_10006ECA0;
    TMConvertTicksToSeconds();
    if (!v10) {
      double v13 = -v13;
    }
    if (v12 + v11 + v13 < stateCache->_localDaemonLaunchTime + 3.0 + stateCache->_remoteRTCOffset) {
      AnalyticsSendEventLazy();
    }
  }
LABEL_11:
  [a4 _setQueue:self->_q];
  [a4 setExportedInterface:self->_exportedInterface];
  [a4 setExportedObject:self->_exportedObject];
  [a4 setRemoteObjectInterface:self->_remoteObjectInterface];
  objc_initWeak((id *)buf, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000090FC;
  v17[3] = &unk_10005CD10;
  objc_copyWeak(&v18, (id *)buf);
  [a4 setInterruptionHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000091A4;
  v15[3] = &unk_10005CD38;
  objc_copyWeak(&v16, (id *)buf);
  v15[4] = a4;
  [a4 setInvalidationHandler:v15];
  [a4 resume];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
  return 1;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  self->_exportedObject = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

@end