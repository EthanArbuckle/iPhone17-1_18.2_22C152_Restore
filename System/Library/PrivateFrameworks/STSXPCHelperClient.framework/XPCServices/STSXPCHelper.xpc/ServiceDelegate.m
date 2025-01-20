@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (ServiceDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)ServiceDelegate;
  v2 = [(ServiceDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableArray *)v3;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ServiceDelegate listener:shouldAcceptNewConnection:]", 66, self, @"[XPCService]Processing new connection...", v8, v9, v32);
  if (self) {
    activeConnections = self->_activeConnections;
  }
  else {
    activeConnections = 0;
  }
  if ([(NSMutableArray *)activeConnections count])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ServiceDelegate listener:shouldAcceptNewConnection:]", 71, self, @"Maximum XPC connections reached", v11, v12, v33);
    BOOL v13 = 0;
  }
  else
  {
    id v14 = sub_1000251F0([STSXPCHelperEntitlementChecker alloc], v7);
    v17 = v14;
    if (v14 && *((unsigned char *)v14 + 8))
    {
      v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STSHelperProtocol];
      [v7 setExportedInterface:v18];

      id v19 = v7;
      self;
      uint64_t v20 = objc_opt_new();
      v21 = (id *)v20;
      if (v20) {
        objc_storeStrong((id *)(v20 + 8), a4);
      }
      v22 = [STSXPCHelper alloc];
      v23 = [v19 _queue];

      id v24 = sub_1000283AC(v22, v23, v21);
      if (v21) {
        objc_storeStrong(v21 + 2, v24);
      }

      if (self) {
        v25 = self->_activeConnections;
      }
      else {
        v25 = 0;
      }
      [(NSMutableArray *)v25 addObject:v21];
      if (v21 && (v26 = (id *)v21[2]) != 0)
      {
        objc_storeWeak(v26 + 3, v19);
        id v27 = v21[2];
      }
      else
      {
        id v27 = 0;
      }
      [v19 setExportedObject:v27];
      v28 = sub_10002EF58();
      [v19 setExportedInterface:v28];

      v29 = sub_10002EF90();
      [v19 setRemoteObjectInterface:v29];

      objc_initWeak(&location, self);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100022890;
      v34[3] = &unk_100054FF8;
      objc_copyWeak(&v36, &location);
      v30 = v21;
      v35 = v30;
      [v19 setInvalidationHandler:v34];
      [v19 setInterruptionHandler:&stru_100055018];
      [v19 resume];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);

      BOOL v13 = 1;
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ServiceDelegate listener:shouldAcceptNewConnection:]", 78, self, @"Missing xpcClientAccess entitlement", v15, v16, v33);
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (void).cxx_destruct
{
}

@end