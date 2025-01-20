@interface MIHelperServiceClient
+ (id)sharedInstance;
- (BOOL)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 withError:(id *)a7;
- (BOOL)dataContainer:(id)a3 ofContainerType:(unint64_t)a4 isEmpty:(BOOL *)a5 error:(id *)a6;
- (BOOL)makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 withError:(id *)a5;
- (BOOL)migrateMobileContentWithError:(id *)a3;
- (BOOL)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 withError:(id *)a7;
- (BOOL)wipeStagingRootAndSetUpPerUserDataDirWithError:(id *)a3;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_sharedConnection;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 withError:(id *)a7;
- (id)stageItemAtURL:(id)a3 options:(id)a4 containedSymlink:(BOOL *)a5 error:(id *)a6;
- (void)_invalidateObject;
- (void)dealloc;
- (void)setXpcConnection:(id)a3;
@end

@implementation MIHelperServiceClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000398E4;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A6030 != -1) {
    dispatch_once(&qword_1000A6030, block);
  }
  v2 = (void *)qword_1000A6038;

  return v2;
}

- (void)_invalidateObject
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MIHelperServiceClient *)obj xpcConnection];
  [v2 invalidate];

  [(MIHelperServiceClient *)obj setXpcConnection:0];
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(MIHelperServiceClient *)self _invalidateObject];
  v3.receiver = self;
  v3.super_class = (Class)MIHelperServiceClient;
  [(MIHelperServiceClient *)&v3 dealloc];
}

- (id)_sharedConnection
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(MIHelperServiceClient *)v2 xpcConnection];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
    [(MIHelperServiceClient *)v2 setXpcConnection:v4];

    v5 = [(MIHelperServiceClient *)v2 xpcConnection];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = sub_10000B4BC();
    v7 = [(MIHelperServiceClient *)v2 xpcConnection];
    [v7 setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100039C30;
    v14[3] = &unk_10008D7A8;
    objc_copyWeak(&v15, &location);
    v8 = [(MIHelperServiceClient *)v2 xpcConnection];
    [v8 setInterruptionHandler:v14];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100039C70;
    v12[3] = &unk_10008D7A8;
    objc_copyWeak(&v13, &location);
    v9 = [(MIHelperServiceClient *)v2 xpcConnection];
    [v9 setInvalidationHandler:v12];

    v10 = [(MIHelperServiceClient *)v2 xpcConnection];
    [v10 resume];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v5 = [(MIHelperServiceClient *)v2 xpcConnection];
LABEL_5:
  objc_sync_exit(v2);

  return v5;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(MIHelperServiceClient *)self _sharedConnection];
  v7 = v5;
  if (v5)
  {
    v8 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v9 = sub_100014A08((uint64_t)"-[MIHelperServiceClient _remoteObjectProxyWithErrorHandler:]", 85, MIInstallerErrorDomain, 4, 0, 0, @"Failed to get XPC connection", v6, v11);
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(MIHelperServiceClient *)self _sharedConnection];
  v7 = v5;
  if (v5)
  {
    v8 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v9 = sub_100014A08((uint64_t)"-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]", 96, MIInstallerErrorDomain, 4, 0, 0, @"Failed to get XPC connection", v6, v11);
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)migrateMobileContentWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100039FB0;
  v14 = sub_100039FC0;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039FC8;
  v9[3] = &unk_10008D7D0;
  v9[4] = &v10;
  id v4 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A044;
  v8[3] = &unk_10008D7D0;
  v8[4] = &v10;
  [v4 migrateMobileContentWithCompletion:v8];

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = v5;
    v5 = (void *)v11[5];
  }
  BOOL v6 = v5 == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)wipeStagingRootAndSetUpPerUserDataDirWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100039FB0;
  v14 = sub_100039FC0;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A1BC;
  v9[3] = &unk_10008D7D0;
  v9[4] = &v10;
  id v4 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A238;
  v8[3] = &unk_10008D7D0;
  v8[4] = &v10;
  [v4 wipeStagingRootAndSetUpPerUserDataDirWithCompletion:v8];

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = v5;
    v5 = (void *)v11[5];
  }
  BOOL v6 = v5 == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)stageItemAtURL:(id)a3 options:(id)a4 containedSymlink:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100039FB0;
  v33 = sub_100039FC0;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100039FB0;
  v27 = sub_100039FC0;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003A4B8;
  v18[3] = &unk_10008D7D0;
  v18[4] = &v23;
  uint64_t v12 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003A534;
  v17[3] = &unk_10008D7F8;
  v17[4] = &v23;
  v17[5] = &v29;
  v17[6] = &v19;
  [v12 stageItemAtURL:v10 options:v11 completion:v17];

  id v13 = v30;
  v14 = (void *)v30[5];
  if (a6 && !v14)
  {
    *a6 = (id) v24[5];
    id v13 = v30;
    v14 = (void *)v30[5];
  }
  if (a5 && v14)
  {
    *a5 = *((unsigned char *)v20 + 24);
    v14 = (void *)v13[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100039FB0;
  v20 = sub_100039FC0;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003A774;
  v15[3] = &unk_10008D7D0;
  v15[4] = &v16;
  id v10 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003A7F0;
  v14[3] = &unk_10008D7D0;
  void v14[4] = &v16;
  [v10 makeSymlinkFromAppDataContainerToBundleForIdentifier:v8 forPersona:v9 completion:v14];

  id v11 = (void *)v17[5];
  if (a5 && v11)
  {
    *a5 = v11;
    id v11 = (void *)v17[5];
  }
  BOOL v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

- (BOOL)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100039FB0;
  uint64_t v25 = sub_100039FC0;
  id v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003A9C0;
  v20[3] = &unk_10008D7D0;
  v20[4] = &v21;
  id v15 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003AA3C;
  v19[3] = &unk_10008D7D0;
  v19[4] = &v21;
  [v15 createSafeHarborWithIdentifier:v12 forPersona:v13 containerType:a5 andMigrateDataFrom:v14 completion:v19];

  uint64_t v16 = (void *)v22[5];
  if (a7 && v16)
  {
    *a7 = v16;
    uint64_t v16 = (void *)v22[5];
  }
  BOOL v17 = v16 == 0;
  _Block_object_dispose(&v21, 8);

  return v17;
}

- (BOOL)dataContainer:(id)a3 ofContainerType:(unint64_t)a4 isEmpty:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100039FB0;
  uint64_t v25 = sub_100039FC0;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003AC30;
  v16[3] = &unk_10008D7D0;
  v16[4] = &v21;
  id v11 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003ACAC;
  v15[3] = &unk_10008D820;
  v15[4] = &v17;
  void v15[5] = &v21;
  [v11 isDataContainerEmpty:v10 ofContainerType:a4 completion:v15];

  if (a6)
  {
    id v12 = (void *)v22[5];
    if (v12) {
      *a6 = v12;
    }
  }
  if (a5) {
    *a5 = *((unsigned char *)v18 + 24);
  }
  BOOL v13 = v22[5] == 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 withError:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100039FB0;
  v30 = sub_100039FC0;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100039FB0;
  v24 = sub_100039FC0;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003AEFC;
  v19[3] = &unk_10008D7D0;
  v19[4] = &v26;
  id v14 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003AF78;
  v18[3] = &unk_10008D848;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v14 createAppSnapshotWithBundleID:v12 snapshotToURL:v13 onlyV1AppIfPresent:v9 placeholderOnly:v8 completion:v18];

  id v15 = (void *)v21[5];
  if (a7 && !v15)
  {
    *a7 = (id) v27[5];
    id v15 = (void *)v21[5];
  }
  id v16 = v15;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v16;
}

- (BOOL)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100039FB0;
  v30 = sub_100039FC0;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003B214;
  v21[3] = &unk_10008D7D0;
  v21[4] = &v26;
  id v14 = [(MIHelperServiceClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003B290;
  v20[3] = &unk_10008D870;
  v20[4] = &v26;
  void v20[5] = &v22;
  long long v15 = *(_OWORD *)&a6->var0[4];
  v19[0] = *(_OWORD *)a6->var0;
  v19[1] = v15;
  [v14 moveItemInStagingDirectory:a3 atRelativePath:v12 toDestinationURL:v13 onBehalfOf:v19 completion:v20];

  int v16 = *((unsigned __int8 *)v23 + 24);
  if (a7 && !*((unsigned char *)v23 + 24))
  {
    *a7 = (id) v27[5];
    int v16 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end