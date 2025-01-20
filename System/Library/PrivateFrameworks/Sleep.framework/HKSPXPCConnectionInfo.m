@interface HKSPXPCConnectionInfo
+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9;
- (HKSPXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9;
- (NSString)lifecycleNotification;
- (NSString)machServiceName;
- (NSString)requiredEntitlement;
- (NSXPCInterface)exportedObjectInterface;
- (NSXPCInterface)remoteObjectInterface;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)exportedObject;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)options;
@end

@implementation HKSPXPCConnectionInfo

- (id)succinctDescription
{
  v2 = [(HKSPXPCConnectionInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(HKSPXPCConnectionInfo *)self machServiceName];
  [v3 appendString:v4 withName:@"machServiceName"];

  v5 = [(HKSPXPCConnectionInfo *)self remoteObjectInterface];
  id v6 = (id)[v3 appendObject:v5 withName:@"remoteObjectInterface"];

  v7 = [(HKSPXPCConnectionInfo *)self exportedObject];
  id v8 = (id)[v3 appendObject:v7 withName:@"exportedObject"];

  v9 = [(HKSPXPCConnectionInfo *)self exportedObjectInterface];
  id v10 = (id)[v3 appendObject:v9 withName:@"exportedObjectInterface"];

  v11 = [(HKSPXPCConnectionInfo *)self requiredEntitlement];
  id v12 = (id)[v3 appendObject:v11 withName:@"requiredEntitlement"];

  return v3;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)exportedObject
{
  return self->_exportedObject;
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

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
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

- (HKSPXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v15 = a3;
  id v29 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HKSPXPCConnectionInfo;
  v20 = [(HKSPXPCConnectionInfo *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    machServiceName = v20->_machServiceName;
    v20->_machServiceName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_remoteObjectInterface, a4);
    objc_storeStrong(&v20->_exportedObject, a5);
    objc_storeStrong((id *)&v20->_exportedObjectInterface, a6);
    uint64_t v23 = [v18 copy];
    lifecycleNotification = v20->_lifecycleNotification;
    v20->_lifecycleNotification = (NSString *)v23;

    uint64_t v25 = [v19 copy];
    requiredEntitlement = v20->_requiredEntitlement;
    v20->_requiredEntitlement = (NSString *)v25;

    v20->_options = a9;
    v27 = v20;
  }

  return v20;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPXPCConnectionInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
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

@end