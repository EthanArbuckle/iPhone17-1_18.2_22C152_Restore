@interface NPKIDVRemoteDeviceServiceContext
+ (BOOL)supportsSecureCoding;
- (NPKIDVRemoteDeviceServiceContext)init;
- (NPKIDVRemoteDeviceServiceContext)initWithCoder:(id)a3;
- (NSString)remoteDeviceID;
- (id)_serviceNamesForEventString:(id)a3;
- (id)description;
- (id)serviceNamesForEvent:(unint64_t)a3;
- (unint64_t)_registeredEventsForServiceName:(id)a3;
- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4;
- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4;
- (void)_setServiceNames:(id)a3 forEventString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NPKIDVRemoteDeviceServiceContext

- (NPKIDVRemoteDeviceServiceContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceServiceContext;
  v2 = [(NPKIDVRemoteDeviceServiceContext *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    remoteDeviceID = v2->_remoteDeviceID;
    v2->_remoteDeviceID = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventsToServiceNames = v2->_eventsToServiceNames;
    v2->_eventsToServiceNames = v6;
  }
  return v2;
}

- (NPKIDVRemoteDeviceServiceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NPKIDVRemoteDeviceServiceContext *)self init];
    if (v5)
    {
      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceID"];
      if ([v6 length])
      {
        objc_storeStrong((id *)&v5->_remoteDeviceID, v6);
      }
      else
      {
        v7 = pk_Payment_log();
        BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          objc_super v9 = pk_Payment_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Missing remote DeviceID from archived context, generating a new one", buf, 2u);
          }
        }
      }
      v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      v14 = [v4 decodeObjectOfClasses:v13 forKey:@"eventsToServiceNames"];

      if (v14)
      {
        uint64_t v15 = [v14 mutableCopy];
        p_super = &v5->_eventsToServiceNames->super.super;
        v5->_eventsToServiceNames = (NSMutableDictionary *)v15;
      }
      else
      {
        v18 = pk_Payment_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

        if (!v19) {
          goto LABEL_13;
        }
        p_super = pk_Payment_log();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_21E92F000, p_super, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Missing registered event from archived context, starting fresh", v20, 2u);
        }
      }

LABEL_13:
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  remoteDeviceID = self->_remoteDeviceID;
  id v5 = a3;
  [v5 encodeObject:remoteDeviceID forKey:@"remoteDeviceID"];
  [v5 encodeObject:self->_eventsToServiceNames forKey:@"eventsToServiceNames"];
}

- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6 = a4;
  v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __66__NPKIDVRemoteDeviceServiceContext_registerEvents_forServiceName___block_invoke;
  v14 = &unk_2644D4BC8;
  uint64_t v15 = self;
  id v16 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v11];
  unint64_t v9 = -[NPKIDVRemoteDeviceServiceContext _registeredEventsForServiceName:](self, "_registeredEventsForServiceName:", v8, v11, v12, v13, v14, v15);

  return v9;
}

void __66__NPKIDVRemoteDeviceServiceContext_registerEvents_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _serviceNamesForEventString:v4];
  [v5 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setServiceNames:v5 forEventString:v4];
}

- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6 = a4;
  v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __68__NPKIDVRemoteDeviceServiceContext_unregisterEvents_forServiceName___block_invoke;
  v14 = &unk_2644D4BC8;
  uint64_t v15 = self;
  id v16 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v11];
  unint64_t v9 = -[NPKIDVRemoteDeviceServiceContext _registeredEventsForServiceName:](self, "_registeredEventsForServiceName:", v8, v11, v12, v13, v14, v15);

  return v9;
}

void __68__NPKIDVRemoteDeviceServiceContext_unregisterEvents_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _serviceNamesForEventString:v4];
  [v5 removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setServiceNames:v5 forEventString:v4];
}

- (id)serviceNamesForEvent:(unint64_t)a3
{
  id v4 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
  id v5 = [v4 firstObject];

  if (v5) {
    [(NPKIDVRemoteDeviceServiceContext *)self _serviceNamesForEventString:v5];
  }
  else {
  id v6 = [MEMORY[0x263EFFA08] set];
  }

  return v6;
}

- (id)_serviceNamesForEventString:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_eventsToServiceNames objectForKeyedSubscript:a3];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = (id)[v3 mutableCopy];
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  id v5 = v4;

  return v5;
}

- (void)_setServiceNames:(id)a3 forEventString:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [v9 count];
  eventsToServiceNames = self->_eventsToServiceNames;
  if (v7) {
    [(NSMutableDictionary *)eventsToServiceNames setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)eventsToServiceNames removeObjectForKey:v6];
  }
}

- (unint64_t)_registeredEventsForServiceName:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_eventsToServiceNames, "count"));
  eventsToServiceNames = self->_eventsToServiceNames;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__NPKIDVRemoteDeviceServiceContext__registeredEventsForServiceName___block_invoke;
  v11[3] = &unk_2644D4BF0;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)eventsToServiceNames enumerateKeysAndObjectsUsingBlock:v11];
  unint64_t v9 = NPKIDVRemoteDeviceServiceEventsFromStringsArray(v7);

  return v9;
}

void __68__NPKIDVRemoteDeviceServiceContext__registeredEventsForServiceName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> {deviceID:%@, eventsToServiceNames:%@}", objc_opt_class(), self, self->_remoteDeviceID, self->_eventsToServiceNames];
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceID, 0);
  objc_storeStrong((id *)&self->_eventsToServiceNames, 0);
}

@end