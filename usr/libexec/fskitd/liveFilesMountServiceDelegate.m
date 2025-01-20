@interface liveFilesMountServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation liveFilesMountServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10003D314(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = [v6 valueForEntitlement:@"com.apple.private.LiveFS.connection"];
  v16 = v15;
  if (v15) {
    id v17 = [v15 BOOLValue];
  }
  else {
    id v17 = 0;
  }
  v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Incomming connection, entitled %d", (uint8_t *)&buf, 8u);
  }

  v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LiveFSMounter];
  [v6 setExportedInterface:v19];

  id v20 = [[fskitdXPCServer alloc] initForEntitledClient:v17];
  v21 = v20;
  if (v20)
  {
    [v20 setOurConn:v6];
    [v6 setExportedObject:v21];
    v22 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LiveFSMounterClient];
    [v6 setRemoteObjectInterface:v22];

    objc_initWeak(&buf, v21);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000FF20;
    v45[3] = &unk_100058DB0;
    objc_copyWeak(&v46, &buf);
    [v6 setInterruptionHandler:v45];
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472;
    v42 = sub_10000FFD8;
    v43 = &unk_100058DB0;
    objc_copyWeak(&v44, &buf);
    [v6 setInvalidationHandler:&v40];
    [v6 resume:v40, v41, v42, v43];
    v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10003D224(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&buf);
  }
  else
  {
    v31 = fskit_std_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_10003D29C(v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  return v21 != 0;
}

@end