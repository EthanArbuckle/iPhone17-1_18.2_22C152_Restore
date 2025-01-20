@interface KmlSession
- (KmlSession)initWithRemoteObject:(id)a3 connection:(id)a4 andQueue:(id)a5;
- (id)clientName;
- (id)dumpState;
- (void)cancelBackGroundTimer;
- (void)dealloc;
- (void)endSessionWithCompletion:(id)a3;
- (void)start;
- (void)startBackGroundTimer;
- (void)stopWithError:(id)a3;
@end

@implementation KmlSession

- (KmlSession)initWithRemoteObject:(id)a3 connection:(id)a4 andQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)KmlSession;
  v12 = [(KmlSession *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_remoteObject, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    v13->_isStarted = 0;
    backgroundTimer = v13->_backgroundTimer;
    v13->_backgroundTimer = 0;
  }
  return v13;
}

- (id)clientName
{
  v2 = [(NSXPCConnection *)self->_connection userInfo];
  v3 = [v2 objectForKeyedSubscript:@"ClientName"];

  return v3;
}

- (id)dumpState
{
  return 0;
}

- (void)dealloc
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlSession dealloc]", 74, @"Session released", v2, v3, v4, v5, (uint64_t)v7.receiver);
  v7.receiver = self;
  v7.super_class = (Class)KmlSession;
  [(KmlSession *)&v7 dealloc];
}

- (void)stopWithError:(id)a3
{
  id v11 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlSession stopWithError:]", 79, @"%@", v4, v5, v6, v7, (uint64_t)v11);
  if (self) {
    id Property = objc_getProperty(self, v8, 48, 1);
  }
  else {
    id Property = 0;
  }
  [Property didEnd:v11];
  id v10 = self;
  objc_sync_enter(v10);
  v10->_isStarted = 0;
  objc_sync_exit(v10);
}

- (void)start
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_10032A410((uint64_t)KmlPowerAssertion, v4);
  uint64_t v5 = (KmlPowerAssertion *)objc_claimAutoreleasedReturnValue();
  pwrAssertion = self->_pwrAssertion;
  self->_pwrAssertion = v5;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSession start]", 91, &stru_100421848, v7, v8, v9, v10, v20);
  id v11 = self;
  objc_sync_enter(v11);
  v11->_isStarted = 1;
  objc_sync_exit(v11);

  [objc_getProperty(v11, v12, 48, 1) didStart:1];
  id v21 = [(NSXPCConnection *)v11->_connection userInfo];
  v13 = [v21 objectForKeyedSubscript:@"BackGroundClient"];
  LODWORD(v4) = [v13 BOOLValue];

  if (v4)
  {
    v14 = [v21 objectForKeyedSubscript:@"ClientIsDaemon"];
    if ([v14 BOOLValue]) {
      double v15 = 600.0;
    }
    else {
      double v15 = 10.0;
    }

    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSession start]", 99, @"Kill this session started by background client after %f seconds", v16, v17, v18, v19, *(uint64_t *)&v15);
    sub_1003215E0((uint64_t)v11, v15);
  }
}

- (void)startBackGroundTimer
{
}

- (void)cancelBackGroundTimer
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321A0C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321B6C;
  block[3] = &unk_100419F30;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_backgroundTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_pwrAssertion, 0);
}

@end