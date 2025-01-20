@interface MTXPCConnectionInfo
+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9;
+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 options:(unint64_t)a5;
- (MTXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9;
- (NSString)lifecycleNotification;
- (NSString)machServiceName;
- (NSString)requiredEntitlement;
- (NSXPCInterface)exportedObjectInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)description;
- (id)exportedObject;
- (unint64_t)options;
- (void)setExportedObject:(id)a3;
- (void)setExportedObjectInterface:(id)a3;
- (void)setLifecycleNotification:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setRequiredEntitlement:(id)a3;
@end

@implementation MTXPCConnectionInfo

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MTXPCConnectionInfo *)self machServiceName];
  v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (NSXPCInterface)exportedObjectInterface
{
  return self->_exportedObjectInterface;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (unint64_t)options
{
  return self->_options;
}

+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMachServiceName:v19 remoteObjectInterface:v18 exportedObject:v17 exportedObjectInterface:v16 lifecycleNotification:v15 requiredEntitlement:v14 options:0];

  return v20;
}

- (MTXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v15 = a3;
  id v35 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v16)
  {
    [v17 protocol];
    v20 = id v34 = v15;
    char v21 = [v16 conformsToProtocol:v20];

    id v15 = v34;
    if ((v21 & 1) == 0)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [v17 protocol];
      [v30 handleFailureInMethod:a2, self, @"MTXPCConnectionInfo.m", 62, @"exportedObject: %@ must conform to protocol: %@", v16, v31 object file lineNumber description];

      v32 = MTLogForCategory(2);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[MTXPCConnectionInfo initWithMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:]((uint64_t)v16, v17, v32);
      }

      id v15 = v34;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)MTXPCConnectionInfo;
  v22 = [(MTXPCConnectionInfo *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    machServiceName = v22->_machServiceName;
    v22->_machServiceName = (NSString *)v23;

    objc_storeStrong((id *)&v22->_remoteObjectInterface, a4);
    objc_storeStrong(&v22->_exportedObject, a5);
    objc_storeStrong((id *)&v22->_exportedObjectInterface, a6);
    uint64_t v25 = [v18 copy];
    lifecycleNotification = v22->_lifecycleNotification;
    v22->_lifecycleNotification = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    requiredEntitlement = v22->_requiredEntitlement;
    v22->_requiredEntitlement = (NSString *)v27;

    v22->_options = a9;
  }

  return v22;
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 options:(unint64_t)a5
{
  return (id)[a1 infoForMachServiceName:a3 remoteObjectInterface:a4 exportedObject:0 exportedObjectInterface:0 lifecycleNotification:0 requiredEntitlement:0 options:a5];
}

- (void)setMachServiceName:(id)a3
{
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (void)setExportedObject:(id)a3
{
}

- (void)setExportedObjectInterface:(id)a3
{
}

- (void)setLifecycleNotification:(id)a3
{
}

- (void)setRequiredEntitlement:(id)a3
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_lifecycleNotification, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (void)initWithMachServiceName:(NSObject *)a3 remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a2 protocol];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_19CC95000, a3, OS_LOG_TYPE_ERROR, "exportedObject: %{public}@ must conform to protocol: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end