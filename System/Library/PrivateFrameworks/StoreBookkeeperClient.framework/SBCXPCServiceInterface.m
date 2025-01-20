@interface SBCXPCServiceInterface
+ (id)newListener;
+ (id)serviceClientInterface;
+ (id)serviceInterface;
+ (id)serviceName;
- (id)newServiceConnection;
@end

@implementation SBCXPCServiceInterface

+ (id)serviceClientInterface
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"SBCXPCService.m", 135, @"Subclass %@ must implement +%@", v6, v7 object file lineNumber description];

  return 0;
}

+ (id)serviceInterface
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"SBCXPCService.m", 129, @"Subclass %@ must implement +%@", v6, v7 object file lineNumber description];

  return 0;
}

+ (id)serviceName
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"SBCXPCService.m", 123, @"Subclass %@ must implement +%@", v6, v7 object file lineNumber description];

  return 0;
}

+ (id)newListener
{
  v2 = [a1 serviceName];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v2];

  return v3;
}

- (id)newServiceConnection
{
  v2 = [(id)objc_opt_class() serviceName];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v2 options:0];
  v4 = [(id)objc_opt_class() serviceInterface];
  [v3 setRemoteObjectInterface:v4];

  v5 = [(id)objc_opt_class() serviceClientInterface];
  [v3 setExportedInterface:v5];

  return v3;
}

@end