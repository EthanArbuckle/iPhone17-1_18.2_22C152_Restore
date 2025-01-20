@interface MLDClientImportService
+ (MLDClientImportService)sharedService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLDClientImportService)init;
@end

@implementation MLDClientImportService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  v7 = [[MLDClientImportServiceSession alloc] initWithConnection:v6];
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BBB8;
  block[3] = &unk_10002D8A8;
  block[4] = self;
  v9 = v7;
  v34 = v9;
  dispatch_sync(accessQueue, block);
  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ML3ClientImportServiceSessionXPCInterface];
  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  [v10 setClasses:v12 forSelector:"addItems:completion:" argumentIndex:0 ofReply:0];

  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
  [v10 setClasses:v14 forSelector:"updateItems:completion:" argumentIndex:0 ofReply:0];

  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
  [v10 setClasses:v16 forSelector:"removeItems:completion:" argumentIndex:0 ofReply:0];

  [v6 setExportedInterface:v10];
  [v6 setExportedObject:v9];
  v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ML3ClientImportSessionXPCInterface];
  [v6 setRemoteObjectInterface:v17];
  unsigned int v18 = [v6 processIdentifier];
  if (v6)
  {
    [v6 auditToken];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  v19 = MSVBundleIDForAuditToken();
  v20 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v36 = self;
    __int16 v37 = 2114;
    v38 = v9;
    __int16 v39 = 2114;
    v40 = v19;
    __int16 v41 = 1024;
    unsigned int v42 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Created new session %{public}@ for incoming connection from %{public}@[%d]", buf, 0x26u);
  }

  objc_initWeak((id *)buf, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001BBC4;
  v28[3] = &unk_10002D8D0;
  objc_copyWeak(&v30, (id *)buf);
  v21 = v9;
  v29 = v21;
  [v6 setInterruptionHandler:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001BD18;
  v25[3] = &unk_10002D8D0;
  objc_copyWeak(&v27, (id *)buf);
  v22 = v21;
  v26 = v22;
  [v6 setInvalidationHandler:v25];
  [v6 resume];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (MLDClientImportService)init
{
  v9.receiver = self;
  v9.super_class = (Class)MLDClientImportService;
  v2 = [(MLDClientImportService *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.amp.MusicLibrary.MLDCLientImportService.accessQueue", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (MLDClientImportService)sharedService
{
  if (qword_100035030 != -1) {
    dispatch_once(&qword_100035030, &stru_10002D880);
  }
  v2 = (void *)qword_100035028;

  return (MLDClientImportService *)v2;
}

@end