@interface EPScalablePipeManagerManager
+ (Class)resourceClass;
- (BOOL)isConnected;
- (CBScalablePipeManager)manager;
- (EPScalablePipeManagerManager)initWithName:(id)a3 type:(int64_t)a4 priority:(int64_t)a5;
- (id)newResourceWithDelegate:(id)a3;
- (void)createResource;
- (void)destroyResource;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)update;
@end

@implementation EPScalablePipeManagerManager

- (void)createResource
{
  v7.receiver = self;
  v7.super_class = (Class)EPScalablePipeManagerManager;
  [(EPResourceManager *)&v7 createResource];
  id v3 = objc_alloc((Class)CBScalablePipeManager);
  v4 = [(EPResourceManager *)self queue];
  v5 = (CBScalablePipeManager *)[v3 initWithDelegate:self queue:v4];
  manager = self->_manager;
  self->_manager = v5;

  [(EPScalablePipeManagerManager *)self update];
}

- (void)destroyResource
{
  v8.receiver = self;
  v8.super_class = (Class)EPScalablePipeManagerManager;
  [(EPResourceManager *)&v8 destroyResource];
  if (self->_didRequestEndpoint)
  {
    self->_didRequestEndpoint = 0;
    id v3 = sub_1000A3BC0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = sub_1000A3BC0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412290;
        v10 = name;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPScalablePipeManagerManager: Calling CoreBluetooth unregisterEndpoint: %@", buf, 0xCu);
      }
    }
    [(CBScalablePipeManager *)self->_manager unregisterEndpoint:self->_name];
  }
  manager = self->_manager;
  self->_manager = 0;
}

- (void)setIsConnected:(BOOL)a3
{
  if (self->_isConnected != a3)
  {
    self->_isConnected = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000C7AD8;
    v3[3] = &unk_100169468;
    BOOL v4 = a3;
    [(EPResourceManager *)self enumerateResourcesWithBlock:v3];
  }
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (EPScalablePipeManagerManager)initWithName:(id)a3 type:(int64_t)a4 priority:(int64_t)a5
{
  id v9 = a3;
  v10 = +[EPFactory queue];
  v13.receiver = self;
  v13.super_class = (Class)EPScalablePipeManagerManager;
  v11 = [(EPResourceManager *)&v13 initWithQueue:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v11->_type = a4;
    v11->_priority = a5;
  }

  return v11;
}

- (id)newResourceWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EPScalablePipeManagerManager;
  id v4 = [(EPResourceManager *)&v6 newResourceWithDelegate:a3];
  [v4 setIsConnected:-[EPScalablePipeManagerManager isConnected](self, "isConnected")];

  return v4;
}

- (void)update
{
  if ([(EPResourceManager *)self needsResource])
  {
    id v3 = 0;
    uint64_t v4 = 0;
    switch((unint64_t)[(CBScalablePipeManager *)self->_manager state])
    {
      case 2uLL:
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Bluetooth is not supported";
        objc_super v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v14 = 3;
        goto LABEL_20;
      case 3uLL:
        NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
        CFStringRef v16 = @"Bluetooth is unauthorized";
        objc_super v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        uint64_t v14 = 4;
        goto LABEL_20;
      case 4uLL:
        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        CFStringRef v20 = @"Bluetooth is powered off";
        objc_super v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        uint64_t v14 = 2;
LABEL_20:
        id v3 = +[NSError errorWithDomain:@"com.apple.extensiblepair.corebluetooth.scalablepipemanager" code:v14 userInfo:v13];

        uint64_t v4 = 2;
        goto LABEL_21;
      case 5uLL:
      case 0xAuLL:
        if (!self->_didRequestEndpoint)
        {
          self->_didRequestEndpoint = 1;
          v5 = sub_1000A3BC0();
          BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

          if (v6)
          {
            objc_super v7 = sub_1000A3BC0();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              name = self->_name;
              *(_DWORD *)buf = 138412290;
              v22 = name;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPScalablePipeManagerManager: Calling CoreBluetooth registerEndpoint:type:priority: %@", buf, 0xCu);
            }
          }
          [(CBScalablePipeManager *)self->_manager registerEndpoint:self->_name type:self->_type priority:self->_priority options:0];
        }
        return;
      default:
LABEL_21:
        self->_didRequestEndpoint = 0;
        self->_endpointIsRegistered = 0;
        [(EPScalablePipeManagerManager *)self setIsConnected:0];
        [(EPResourceManager *)self setAvailability:v4 withError:v3];

        break;
    }
  }
  else if (self->_endpointIsRegistered)
  {
    self->_endpointIsRegistered = 0;
    if ([(CBScalablePipeManager *)self->_manager state] == (id)5
      || [(CBScalablePipeManager *)self->_manager state] == (id)10)
    {
      id v9 = sub_1000A3BC0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = self->_name;
          *(_DWORD *)buf = 138412290;
          v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPScalablePipeManagerManager: Calling CoreBluetooth unregisterEndpoint: %@", buf, 0xCu);
        }
      }
      [(CBScalablePipeManager *)self->_manager unregisterEndpoint:self->_name];
    }
  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  [(EPScalablePipeManagerManager *)self update];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C806C;
  v6[3] = &unk_1001683F8;
  id v7 = v4;
  id v5 = v4;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v6];
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  BOOL v6 = (CBScalablePipeManager *)a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_manager == v6)
  {
    name = self->_name;
    BOOL v10 = [v7 name];
    LODWORD(name) = [(NSString *)name isEqual:v10];

    if (name) {
      [(EPScalablePipeManagerManager *)self setIsConnected:1];
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C8194;
  v13[3] = &unk_100165908;
  uint64_t v14 = v6;
  id v15 = v8;
  id v11 = v8;
  v12 = v6;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v13];
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqual:self->_name])
  {
    self->_didRequestEndpoint = 0;
    self->_endpointIsRegistered = 0;
    [(EPResourceManager *)self setAvailability:0 withError:0];
    [(EPScalablePipeManagerManager *)self update];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C82A4;
  v10[3] = &unk_100165908;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v10];
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8 = (CBScalablePipeManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager == v8)
  {
    name = self->_name;
    id v12 = [v9 name];
    LODWORD(name) = [(NSString *)name isEqual:v12];

    if (name) {
      [(EPScalablePipeManagerManager *)self setIsConnected:1];
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C83F0;
  v16[3] = &unk_100165930;
  NSErrorUserInfoKey v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v16];
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqual:self->_name])
  {
    if (v10)
    {
      id v11 = sub_1000A3BC0();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (v12)
      {
        id v13 = sub_1000A3BC0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000FB7DC((uint64_t)v9, (uint64_t)v10, v13);
        }
      }
      id v14 = self;
      uint64_t v15 = 2;
      id v16 = v10;
    }
    else
    {
      self->_endpointIsRegistered = 1;
      id v14 = self;
      uint64_t v15 = 1;
      id v16 = 0;
    }
    [(EPResourceManager *)v14 setAvailability:v15 withError:v16];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C8588;
  v20[3] = &unk_100165930;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v20];
}

- (CBScalablePipeManager)manager
{
  return self->_manager;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end