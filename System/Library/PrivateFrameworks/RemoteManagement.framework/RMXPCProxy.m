@interface RMXPCProxy
+ (id)newAgentConnection;
+ (id)newConnectionWithListenerEndpoint:(id)a3;
+ (id)newConnectionWithScope:(int64_t)a3;
+ (id)newDaemonConnection;
+ (id)newInterface;
@end

@implementation RMXPCProxy

+ (id)newConnectionWithScope:(int64_t)a3
{
  if (a3 == 1) {
    return +[RMXPCProxy newDaemonConnection];
  }
  else {
    return +[RMXPCProxy newAgentConnection];
  }
}

+ (id)newAgentConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.RemoteManagementAgent" options:0];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newDaemonConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.remotemanagementd" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newConnectionWithListenerEndpoint:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D68];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithListenerEndpoint:v5];

  v7 = (void *)[a1 newInterface];
  [v6 setRemoteObjectInterface:v7];

  return v6;
}

+ (id)newInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D7AC1A8];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_fetchConfigurationsWithTypes_completionHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
  [v2 setClasses:v15 forSelector:sel_queryForStatusAndErrorsWithKeyPaths_fromManagementSourceWithIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

@end