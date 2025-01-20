@interface TRMPort
- (BOOL)_startInterestNotifications;
- (BOOL)_updatePropertiesFromService;
- (BOOL)authorizationPending;
- (BOOL)authorizationRequired;
- (BOOL)builtIn;
- (BOOL)connectionActive;
- (BOOL)interestNotificationsStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInactive;
- (BOOL)userAuthorizationPending;
- (IONotificationPort)ioNotificationPort;
- (NSArray)transportsUnauthorized;
- (NSDictionary)servicePropertiesFiltered;
- (NSString)connectionUUID;
- (NSString)portDescription;
- (NSString)portTypeDescription;
- (NSString)userAuthorizationStatusDescription;
- (OS_dispatch_queue)queue;
- (TRMPort)initWithService:(unsigned int)a3 andDelegate:(id)a4;
- (TRMPortDelegate)delegate;
- (id)description;
- (int)portNumber;
- (int)portType;
- (int)userAuthorizationStatus;
- (unint64_t)registryEntryID;
- (unsigned)ioNotification;
- (unsigned)service;
- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_stopInterestNotifications;
- (void)dealloc;
- (void)setAuthorizationPending:(BOOL)a3;
- (void)setAuthorizationRequired:(BOOL)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setConnectionActive:(BOOL)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setInterestNotificationsStarted:(BOOL)a3;
- (void)setIoNotification:(unsigned int)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setPortDescription:(id)a3;
- (void)setPortNumber:(int)a3;
- (void)setPortType:(int)a3;
- (void)setPortTypeDescription:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistryEntryID:(unint64_t)a3;
- (void)setService:(unsigned int)a3;
- (void)setServicePropertiesFiltered:(id)a3;
- (void)setTransportsUnauthorized:(id)a3;
- (void)setUserAuthorizationPending:(BOOL)a3;
- (void)setUserAuthorizationStatus:(int)a3;
- (void)setUserAuthorizationStatus:(int)a3 completionHandler:(id)a4;
- (void)setUserAuthorizationStatusDescription:(id)a3;
@end

@implementation TRMPort

- (TRMPort)initWithService:(unsigned int)a3 andDelegate:(id)a4
{
  kern_return_t RegistryEntryID;
  kern_return_t v12;
  objc_class *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unsigned int v23;

  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 1024;
    v23 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initializing %@... (service: %u)", buf, 0x12u);
  }
  v19.receiver = self;
  v19.super_class = (Class)TRMPort;
  v9 = [(TRMPort *)&v19 init];
  v10 = v9;
  if (v9)
  {
    if (a3)
    {
      v9->_service = a3;
      IOObjectRetain(a3);
      objc_storeWeak((id *)&v10->_delegate, v6);
      RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &v10->_registryEntryID);
      if (!RegistryEntryID)
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = +[NSString stringWithFormat:@"%@.%llu", v14, v10->_registryEntryID];
        v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
        queue = v10->_queue;
        v10->_queue = (OS_dispatch_queue *)v16;

        [(TRMPort *)v10 _startInterestNotifications];
        [(TRMPort *)v10 _updatePropertiesFromService];
        goto LABEL_11;
      }
      v12 = RegistryEntryID;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v12;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetRegistryEntryID failed: %08x", buf, 8u);
      }
      IOObjectRelease(a3);
    }

    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(TRMPort *)self portDescription];
  unint64_t v6 = [(TRMPort *)self registryEntryID];
  unsigned int v7 = [(TRMPort *)self authorizationPending];
  unsigned int v8 = [(TRMPort *)self userAuthorizationPending];
  v9 = [(TRMPort *)self userAuthorizationStatusDescription];
  v10 = [(TRMPort *)self transportsUnauthorized];
  v11 = +[NSString stringWithFormat:@"<%@: %p, portDescription: %@, registryEntryID: %llu, authorizationPending: %d, userAuthorizationPending: %d, userAuthorizationStatusDescription: [%@], transportsUnauthorized: %@>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 registryEntryID];
    BOOL v6 = v5 == (id)[(TRMPort *)self registryEntryID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    *(_DWORD *)buf = 138412546;
    unsigned int v8 = v4;
    __int16 v9 = 2048;
    unint64_t v10 = [(TRMPort *)self registryEntryID];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deallocating %@... (self.registryEntryID: %llu)", buf, 0x16u);
  }
  [(TRMPort *)self _stopInterestNotifications];
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  v6.receiver = self;
  v6.super_class = (Class)TRMPort;
  [(TRMPort *)&v6 dealloc];
}

- (void)setUserAuthorizationStatus:(int)a3 completionHandler:(id)a4
{
  objc_super v6 = [(TRMPort *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke;
  v7[3] = &unk_515B0;
  v7[4] = self;
  int v8 = a3;
  dispatch_async(v6, v7);
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke(uint64_t a1)
{
  kern_return_t v3;
  int v4;
  void *v5;
  kern_return_t v6;
  int v7;
  uint64_t v8;
  io_connect_t connect;

  connect = -1431655766;
  io_service_t v2 = [*(id *)(a1 + 32) service];
  v3 = IOServiceOpen(v2, mach_task_self_, 1u, &connect);
  if (v3)
  {
    id v4 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_2(v4);
    }
    id v5 = +[NSError errorWithDomain:@"TRMPortErrorDomain" code:-2 userInfo:0];
  }
  else
  {
    int v8 = *(unsigned int *)(a1 + 40);
    objc_super v6 = IOConnectCallScalarMethod(connect, 0, &v8, 1u, 0, 0);
    if (v6)
    {
      unsigned int v7 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_1(v7);
      }
      id v5 = +[NSError errorWithDomain:@"TRMPortErrorDomain" code:-2 userInfo:0];
    }
    else
    {
      id v5 = 0;
    }
    IOServiceClose(connect);
  }
}

- (BOOL)_updatePropertiesFromService
{
  kern_return_t CFProperties;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  kern_return_t v28;
  _DWORD v29[4];
  unsigned char buf[24];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = [(TRMPort *)self registryEntryID];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Updating properties... (self.registryEntryID: %llu)", buf, 0xCu);
  }
  *(void *)buf = 0;
  if (_updatePropertiesFromService_onceToken != -1) {
    dispatch_once(&_updatePropertiesFromService_onceToken, &__block_literal_global_4);
  }
  if (![(TRMPort *)self service]) {
    return 0;
  }
  CFProperties = IORegistryEntryCreateCFProperties([(TRMPort *)self service], (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
  if (CFProperties)
  {
    v28 = CFProperties;
    v13 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    v29[0] = 67109120;
    v29[1] = v28;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: %08x", (uint8_t *)v29, 8u);
    return 0;
  }
  id v4 = *(void **)buf;
  id v5 = [*(id *)buf dictionaryWithValuesForKeys:_updatePropertiesFromService_propertyFilter];
  objc_super v6 = [v5 mutableCopy];

  unsigned int v7 = +[NSNull null];
  int v8 = [v6 allKeysForObject:v7];
  [v6 removeObjectsForKeys:v8];

  __int16 v9 = [(TRMPort *)self servicePropertiesFiltered];
  unint64_t v10 = [v6 isEqualToDictionary:v9];

  v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v11)
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No properties have changed!", (uint8_t *)v29, 2u);
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Properties have changed!", (uint8_t *)v29, 2u);
    }
    v12 = [(TRMPort *)self servicePropertiesFiltered];
    printDictionaryDelta(v12, v6);

    [(TRMPort *)self setServicePropertiesFiltered:v6];
  }
  v13 = v10 ^ 1;
  v14 = [v4 objectForKeyedSubscript:@"PortDescription"];
  [(TRMPort *)self setPortDescription:v14];

  v15 = [v4 objectForKeyedSubscript:@"PortType"];
  -[TRMPort setPortType:](self, "setPortType:", [v15 intValue]);

  v16 = [v4 objectForKeyedSubscript:@"PortTypeDescription"];
  [(TRMPort *)self setPortTypeDescription:v16];

  v17 = [v4 objectForKeyedSubscript:@"PortNumber"];
  -[TRMPort setPortNumber:](self, "setPortNumber:", [v17 intValue]);

  v18 = [v4 objectForKeyedSubscript:@"BuiltIn"];
  -[TRMPort setBuiltIn:](self, "setBuiltIn:", [v18 BOOLValue]);

  v19 = [v4 objectForKeyedSubscript:@"ConnectionActive"];
  -[TRMPort setConnectionActive:](self, "setConnectionActive:", [v19 BOOLValue]);

  v20 = [v4 objectForKeyedSubscript:@"ConnectionUUID"];
  [(TRMPort *)self setConnectionUUID:v20];

  v21 = [v4 objectForKeyedSubscript:@"AuthorizationRequired"];
  -[TRMPort setAuthorizationRequired:](self, "setAuthorizationRequired:", [v21 BOOLValue]);

  v22 = [v4 objectForKeyedSubscript:@"AuthorizationPending"];
  -[TRMPort setAuthorizationPending:](self, "setAuthorizationPending:", [v22 BOOLValue]);

  v23 = [v4 objectForKeyedSubscript:@"UserAuthorizationPending"];
  -[TRMPort setUserAuthorizationPending:](self, "setUserAuthorizationPending:", [v23 BOOLValue]);

  v24 = [v4 objectForKeyedSubscript:@"TransportsUnauthorized"];
  [(TRMPort *)self setTransportsUnauthorized:v24];

  v25 = [v4 objectForKeyedSubscript:@"UserAuthorizationStatus"];
  -[TRMPort setUserAuthorizationStatus:](self, "setUserAuthorizationStatus:", [v25 intValue]);

  v26 = [v4 objectForKeyedSubscript:@"UserAuthorizationStatusDescription"];
  [(TRMPort *)self setUserAuthorizationStatusDescription:v26];

  return v13;
}

void __39__TRMPort__updatePropertiesFromService__block_invoke(id a1)
{
  v1 = (void *)_updatePropertiesFromService_propertyFilter;
  _updatePropertiesFromService_propertyFilter = (uint64_t)&off_5A780;
}

- (BOOL)_startInterestNotifications
{
  kern_return_t v5;
  int v7;
  unint64_t v8;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = 134217984;
    int v8 = [(TRMPort *)self registryEntryID];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering for interest notifications... (self.registryEntryID: %llu)", (uint8_t *)&v7, 0xCu);
  }
  if ([(TRMPort *)self interestNotificationsStarted]) {
    [(TRMPort *)self _stopInterestNotifications];
  }
  [(TRMPort *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
  v3 = [(TRMPort *)self ioNotificationPort];
  id v4 = [(TRMPort *)self queue];
  IONotificationPortSetDispatchQueue(v3, v4);

  id v5 = IOServiceAddInterestNotification([(TRMPort *)self ioNotificationPort], [(TRMPort *)self service], "IOGeneralInterest", (IOServiceInterestCallback)_serviceNotification, self, &self->_ioNotification);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = 67109120;
      LODWORD(v8) = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOServiceAddInterestNotification failed: %08x", (uint8_t *)&v7, 8u);
    }
  }
  else
  {
    [(TRMPort *)self setInterestNotificationsStarted:1];
  }
  return v5 == 0;
}

- (void)_stopInterestNotifications
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    unint64_t v4 = [(TRMPort *)self registryEntryID];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling interest notifications... (self.registryEntryID: %llu)", (uint8_t *)&v3, 0xCu);
  }
  if ([(TRMPort *)self ioNotification]) {
    IOObjectRelease([(TRMPort *)self ioNotification]);
  }
  if ([(TRMPort *)self ioNotificationPort]) {
    IONotificationPortDestroy([(TRMPort *)self ioNotificationPort]);
  }
  [(TRMPort *)self setInterestNotificationsStarted:0];
}

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  switch(a4)
  {
    case 0xE0000010:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messageType: kIOMessageServiceIsTerminated", v18, 2u);
      }
      [(TRMPort *)self setIsInactive:1];
      [(TRMPort *)self _stopInterestNotifications];
      io_object_t service = self->_service;
      if (service) {
        IOObjectRelease(service);
      }
      unint64_t v10 = [(TRMPort *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        int v8 = [(TRMPort *)self delegate];
        [v8 portDidTerminate:self];
        goto LABEL_22;
      }
      break;
    case 0xE3FF80CB:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messageType: kIOPort_Message_AuthorizationStateChange", v17, 2u);
      }
      if ([(TRMPort *)self _updatePropertiesFromService])
      {
        v12 = [(TRMPort *)self delegate];
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          v14 = [(TRMPort *)self delegate];
          [v14 portDidUpdate:self];
        }
      }
      v15 = [(TRMPort *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        int v8 = [(TRMPort *)self delegate];
        [v8 portDidUpdateAuthorizationState:self];
        goto LABEL_22;
      }
      break;
    case 0xE0000130:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messageType: kIOMessageServicePropertyChange", buf, 2u);
      }
      if ([(TRMPort *)self _updatePropertiesFromService])
      {
        objc_super v6 = [(TRMPort *)self delegate];
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          int v8 = [(TRMPort *)self delegate];
          [v8 portDidUpdate:self];
LABEL_22:
        }
      }
      break;
  }
}

- (TRMPortDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TRMPortDelegate *)WeakRetained;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (void)setRegistryEntryID:(unint64_t)a3
{
  self->_registryEntryID = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (NSString)portDescription
{
  return self->_portDescription;
}

- (void)setPortDescription:(id)a3
{
}

- (int)portType
{
  return self->_portType;
}

- (void)setPortType:(int)a3
{
  self->_portType = a3;
}

- (NSString)portTypeDescription
{
  return self->_portTypeDescription;
}

- (void)setPortTypeDescription:(id)a3
{
}

- (int)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(int)a3
{
  self->_portNumber = a3;
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (BOOL)connectionActive
{
  return self->_connectionActive;
}

- (void)setConnectionActive:(BOOL)a3
{
  self->_connectionActive = a3;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (BOOL)authorizationRequired
{
  return self->_authorizationRequired;
}

- (void)setAuthorizationRequired:(BOOL)a3
{
  self->_authorizationRequired = a3;
}

- (BOOL)authorizationPending
{
  return self->_authorizationPending;
}

- (void)setAuthorizationPending:(BOOL)a3
{
  self->_authorizationPending = a3;
}

- (BOOL)userAuthorizationPending
{
  return self->_userAuthorizationPending;
}

- (void)setUserAuthorizationPending:(BOOL)a3
{
  self->_userAuthorizationPending = a3;
}

- (NSArray)transportsUnauthorized
{
  return self->_transportsUnauthorized;
}

- (void)setTransportsUnauthorized:(id)a3
{
}

- (int)userAuthorizationStatus
{
  return self->_userAuthorizationStatus;
}

- (void)setUserAuthorizationStatus:(int)a3
{
  self->_userAuthorizationStatus = a3;
}

- (NSString)userAuthorizationStatusDescription
{
  return self->_userAuthorizationStatusDescription;
}

- (void)setUserAuthorizationStatusDescription:(id)a3
{
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioNotification
{
  return self->_ioNotification;
}

- (void)setIoNotification:(unsigned int)a3
{
  self->_ioNotification = a3;
}

- (BOOL)interestNotificationsStarted
{
  return self->_interestNotificationsStarted;
}

- (void)setInterestNotificationsStarted:(BOOL)a3
{
  self->_interestNotificationsStarted = a3;
}

- (NSDictionary)servicePropertiesFiltered
{
  return self->_servicePropertiesFiltered;
}

- (void)setServicePropertiesFiltered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePropertiesFiltered, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userAuthorizationStatusDescription, 0);
  objc_storeStrong((id *)&self->_transportsUnauthorized, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_portTypeDescription, 0);
  objc_storeStrong((id *)&self->_portDescription, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_1(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set user authorization status! IOConnectCallScalarMethod returned 0x%08x", (uint8_t *)v1, 8u);
}

void __56__TRMPort_setUserAuthorizationStatus_completionHandler___block_invoke_cold_2(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to open user client! IOServiceOpen returned 0x%08x", (uint8_t *)v1, 8u);
}

@end