@interface BKSecureDrawingMonitor
+ (id)sharedInstance;
- (BKSecureDrawingMonitor)init;
- (BOOL)isSecureModeEnabled;
- (void)reportAndKillInsecureProcesses;
- (void)setSecureModeEnabled:(BOOL)a3;
- (void)startMonitoringSecureDrawing;
@end

@implementation BKSecureDrawingMonitor

- (void).cxx_destruct
{
}

- (void)setSecureModeEnabled:(BOOL)a3
{
  self->_secureModeEnabled = a3;
}

- (BOOL)isSecureModeEnabled
{
  return self->_secureModeEnabled;
}

- (void)reportAndKillInsecureProcesses
{
  if ([(BKSecureDrawingMonitor *)self isSecureModeEnabled])
  {
    v2 = +[CAWindowServer serverIfRunning];
    v3 = [v2 secureModeViolations];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_1000744EC;
    v35 = sub_1000744FC;
    id v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_1000744EC;
    v29[4] = sub_1000744FC;
    id v30 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100074504;
    v28[3] = &unk_1000F7C58;
    v28[4] = &v31;
    v28[5] = v29;
    [v3 enumerateObjectsUsingBlock:v28];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_1000744EC;
    v26 = sub_1000744FC;
    id v27 = 0;
    if (v32[5])
    {
      id v4 = objc_alloc_init((Class)NSMutableArray);
      v5 = (void *)v23[5];
      v23[5] = (uint64_t)v4;

      v6 = (void *)v32[5];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000746F4;
      v21[3] = &unk_1000F7CA8;
      v21[4] = v29;
      v21[5] = &v22;
      [v6 enumerateKeysAndObjectsUsingBlock:v21];
      if (v23[5])
      {
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        v7 = (void *)qword_100123060;
        uint64_t v45 = qword_100123060;
        if (!qword_100123060)
        {
          v37 = _NSConcreteStackBlock;
          uint64_t v38 = 3221225472;
          v39 = sub_100074810;
          v40 = &unk_1000F7CD0;
          v41 = &v42;
          sub_100074810((uint64_t)&v37);
          v7 = (void *)v43[3];
        }
        v8 = v7;
        _Block_object_dispose(&v42, 8);
        id v9 = objc_alloc_init(v8);
        v10 = [v9 systemApplicationBundleIdentifier];
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        v11 = (id *)qword_100123070;
        uint64_t v45 = qword_100123070;
        if (!qword_100123070)
        {
          v37 = _NSConcreteStackBlock;
          uint64_t v38 = 3221225472;
          v39 = sub_1000748D8;
          v40 = &unk_1000F7CD0;
          v41 = &v42;
          v12 = sub_100074928();
          v13 = dlsym(v12, "FBSOpenApplicationOptionKeyActions");
          *(void *)(v41[1] + 24) = v13;
          qword_100123070 = *(void *)(v41[1] + 24);
          v11 = (id *)v43[3];
        }
        _Block_object_dispose(&v42, 8);
        if (!v11)
        {
          v19 = +[NSAssertionHandler currentHandler];
          v20 = +[NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyActions(void)"];
          [v19 handleFailureInFunction:v20 file:@"BKSecureDrawingMonitor.m" lineNumber:27 description:@"%s" dlerror()];

          __break(1u);
          return;
        }
        id v14 = *v11;
        v15 = v14;
        if (v10)
        {
          if (v14)
          {
            id v16 = objc_alloc((Class)BKSInsecureDrawingAction);
            id v17 = [v16 initWithSecureModeViolations:v23[5]];
            v18 = +[NSSet setWithObject:v17];
            [v9 sendActions:v18 withResult:0];
          }
        }
      }
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v31, 8);
  }
}

- (void)startMonitoringSecureDrawing
{
  int out_token = 0;
  reportingQueue = self->_reportingQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100074BD0;
  v3[3] = &unk_1000F7C30;
  v3[4] = self;
  notify_register_dispatch("com.apple.CoreAnimation.CAWindowServer.SecureModeViolation", &out_token, reportingQueue, v3);
}

- (BKSecureDrawingMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKSecureDrawingMonitor;
  v2 = [(BKSecureDrawingMonitor *)&v8 init];
  if (v2)
  {
    v3 = +[BSDispatchQueueAttributes serial];
    id v4 = [v3 serviceClass:9];
    uint64_t v5 = BSDispatchQueueCreate();
    reportingQueue = v2->_reportingQueue;
    v2->_reportingQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100123058 != -1) {
    dispatch_once(&qword_100123058, &stru_1000F7C08);
  }
  v2 = (void *)qword_100123050;

  return v2;
}

@end