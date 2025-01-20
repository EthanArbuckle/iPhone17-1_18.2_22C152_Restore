@interface STXPCServiceDescription
+ (id)anonymousDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedProtocol:(id)a5;
+ (id)machDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedInterface:(id)a5;
+ (id)machDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedProtocol:(id)a5;
- (NSString)serviceEntitlement;
- (NSString)serviceName;
- (NSXPCInterface)exportedInterface;
- (id)_initWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedInterface:(id)a5 type:(int64_t)a6;
- (id)description;
- (int64_t)type;
@end

@implementation STXPCServiceDescription

- (NSString)serviceEntitlement
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (id)_initWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedInterface:(id)a5 type:(int64_t)a6
{
  v10 = (NSXPCInterface *)a5;
  v20.receiver = self;
  v20.super_class = (Class)STXPCServiceDescription;
  id v11 = a4;
  id v12 = a3;
  v13 = [(STXPCServiceDescription *)&v20 init];
  v14 = (NSString *)objc_msgSend(v12, "copy", v20.receiver, v20.super_class);

  serviceName = v13->_serviceName;
  v13->_serviceName = v14;

  v16 = (NSString *)[v11 copy];
  serviceEntitlement = v13->_serviceEntitlement;
  v13->_serviceEntitlement = v16;

  exportedInterface = v13->_exportedInterface;
  v13->_exportedInterface = v10;

  v13->_type = a6;
  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STXPCServiceDescription *)self serviceName];
  v5 = [(STXPCServiceDescription *)self serviceEntitlement];
  int64_t v6 = [(STXPCServiceDescription *)self type];
  CFStringRef v7 = @"Anonymous";
  if (!v6) {
    CFStringRef v7 = @"Mach";
  }
  v8 = +[NSString stringWithFormat:@"<%@ { ServiceName: %@, Entitlement: %@, Type: %@ }>", v3, v4, v5, v7];

  return v8;
}

+ (id)machDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedProtocol:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [STXPCServiceDescription alloc];
  id v11 = +[NSXPCInterface interfaceWithProtocol:v7];

  id v12 = [(STXPCServiceDescription *)v10 _initWithServiceName:v9 serviceEntitlement:v8 exportedInterface:v11 type:0];
  return v12;
}

+ (id)machDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedInterface:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[STXPCServiceDescription alloc] _initWithServiceName:v9 serviceEntitlement:v8 exportedInterface:v7 type:0];

  return v10;
}

+ (id)anonymousDescriptionWithServiceName:(id)a3 serviceEntitlement:(id)a4 exportedProtocol:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [STXPCServiceDescription alloc];
  id v11 = +[NSXPCInterface interfaceWithProtocol:v7];

  id v12 = [(STXPCServiceDescription *)v10 _initWithServiceName:v9 serviceEntitlement:v8 exportedInterface:v11 type:1];
  return v12;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_serviceEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end