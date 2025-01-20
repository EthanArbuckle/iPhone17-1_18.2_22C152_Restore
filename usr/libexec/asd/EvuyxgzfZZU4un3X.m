@interface EvuyxgzfZZU4un3X
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation EvuyxgzfZZU4un3X

+ (id)sharedInstance
{
  if (qword_1006A5D20 != -1) {
    dispatch_once(&qword_1006A5D20, &stru_10065ED20);
  }
  sub_100006680();
  v2 = (void *)qword_1006A5D18;

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v22 = 0;
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NNHzG8lq6aMxZpXq];
  [v6 setExportedInterface:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  if (v6) {
    [v6 auditToken];
  }
  v8 = (void *)qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    unsigned int v10 = [v6 processIdentifier];
    LODWORD(buf) = 67240192;
    HIDWORD(buf) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "connection from %{public}d", (uint8_t *)&buf, 8u);
  }
  LOBYTE(buf) = 0;
  sub_1003581FC();
  int v11 = buf;
  if ((_BYTE)buf)
  {
    objc_initWeak(&buf, v6);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A404;
    v18[3] = &unk_10065ED48;
    objc_copyWeak(&v19, &buf);
    [v6 setInvalidationHandler:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000A4EC;
    v16[3] = &unk_10065ED48;
    objc_copyWeak(&v17, &buf);
    [v6 setInterruptionHandler:v16];
    v12 = [QwDGuEabMS2vnWkj alloc];
    v13 = [(QwDGuEabMS2vnWkj *)v12 initWithsk6s81V5EsZL9icr:v22];
    [v6 setExportedObject:v13];

    [v6 resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  else
  {
    v14 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C354(v14);
    }
  }

  return v11 != 0;
}

- (void).cxx_destruct
{
}

@end