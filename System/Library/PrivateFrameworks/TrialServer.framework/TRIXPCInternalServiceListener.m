@interface TRIXPCInternalServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TRIXPCInternalServiceListener)initWithServerContextPromise:(id)a3;
@end

@implementation TRIXPCInternalServiceListener

- (TRIXPCInternalServiceListener)initWithServerContextPromise:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TRIXPCInternalServiceListener;
  v6 = [(TRIXPCInternalServiceListener *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promise, a3);
    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3485850];
    interface = v7->_interface;
    v7->_interface = (NSXPCInterface *)v8;

    v10 = v7->_interface;
    v11 = +[TRITaskSupport sharedInstance];
    v12 = [v11 XPCTaskAllowlist];
    [(NSXPCInterface *)v10 setClasses:v12 forSelector:sel_submitTask_options_completion_ argumentIndex:0 ofReply:0];

    v13 = v7->_interface;
    v14 = (void *)MEMORY[0x1E016E7F0]();
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    [(NSXPCInterface *)v13 setClasses:v17 forSelector:sel_setSubscription_namespaceName_completion_ argumentIndex:0 ofReply:0];
  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_new();
  v7 = [TRIInternalServiceRequestHandler alloc];
  promise = self->_promise;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  v9 = [(TRIInternalServiceRequestHandler *)v7 initWithPromise:promise auditToken:v15 entitlementWitness:v6];
  v10 = [[TRIXPCInternalServiceWrapper alloc] initWithUnderlyingHandler:v9];

  v11 = (void *)MEMORY[0x1E4F93BD0];
  interface = self->_interface;
  v13 = TRILogCategory_Server();
  LOBYTE(interface) = [v11 shouldAcceptConnection:v5 serviceName:@"com.apple.triald.internal" whitelistedServerInterface:interface whitelistedClientInterface:0 requestHandler:v10 validateConnection:&__block_literal_global_351 setupClientProxy:0 interruptionHandler:&__block_literal_global_353 invalidationHandler:&__block_literal_global_355 logHandle:v13];

  return (char)interface;
}

uint64_t __68__TRIXPCInternalServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93BD0];
  id v3 = a2;
  v4 = TRILogCategory_Server();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.triald.internal" connection:v3 serviceName:@"com.apple.triald.internal" logHandle:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end