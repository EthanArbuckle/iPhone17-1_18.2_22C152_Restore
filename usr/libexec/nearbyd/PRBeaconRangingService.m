@interface PRBeaconRangingService
+ (id)serviceWithQueue:(id)a3;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)validateClientEntitlements:(id)a3;
- (NSArray)machServicesNames;
- (PRBeaconRangingService)initWithQueue:(id)a3;
- (void)handleXPCDisconnection:(id)a3;
@end

@implementation PRBeaconRangingService

- (PRBeaconRangingService)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRBeaconRangingService.mm", 34, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PRBeaconRangingService;
  v7 = [(PRBeaconRangingService *)&v12 init];
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    xpcSessions = v7->_xpcSessions;
    v7->_xpcSessions = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[PRBeaconRangingService alloc] initWithQueue:v3];

  return v4;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_100878490;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10040E7B8(v5);
  }
  int v6 = [v4 processIdentifier];
  BOOL v7 = [(PRBeaconRangingService *)self validateClientEntitlements:v4];
  v8 = qword_1008ABDE0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_10040B544(v6, v8);
    }
    v9 = [[PRBeaconRangingClientProxy alloc] initWithConnection:v4 queue:self->_queue];
    [(NSMutableSet *)self->_xpcSessions addObject:v9];
    v10 = sub_100195704();
    [v4 setRemoteObjectInterface:v10];

    v11 = sub_1001960AC();
    [v4 setExportedInterface:v11];

    [v4 setExportedObject:v9];
    [v4 _setQueue:self->_queue];
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002F280;
    v19[3] = &unk_100846958;
    int v22 = v6;
    objc_copyWeak(&v21, &location);
    objc_super v12 = v9;
    v20 = v12;
    [v4 setInterruptionHandler:v19];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002F360;
    v15[3] = &unk_100846958;
    int v18 = v6;
    objc_copyWeak(&v17, &location);
    v13 = v12;
    v16 = v13;
    [v4 setInvalidationHandler:v15];
    [v4 resume];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10040B5BC(v6, v8);
  }

  return v7;
}

- (void)handleXPCDisconnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PRBeaconRangingService.mm", 113, @"Invalid parameter not satisfying: %@", @"proxy" object file lineNumber description];
  }
  int v6 = [v5 clientInfo];
  if (v6)
  {
    BOOL v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 objectForKey:PRProcessNameKey];
      v9 = [v6 objectForKey:PRProcessIdentifierKey];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 1024;
      unsigned int v14 = [v9 intValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingService: XPC connection teardown. Process name: %@, pid: %d", buf, 0x12u);
    }
  }
  [v5 terminate];
  [(NSMutableSet *)self->_xpcSessions removeObject:v5];
}

- (BOOL)validateClientEntitlements:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.nearbyd.xpc"];
  BOOL v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue]) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->machServicesNames, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_xpcSessions, 0);
}

@end