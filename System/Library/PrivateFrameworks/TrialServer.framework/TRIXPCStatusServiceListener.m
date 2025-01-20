@interface TRIXPCStatusServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TRIXPCStatusServiceListener)initWithPromise:(id)a3;
@end

@implementation TRIXPCStatusServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [TRIXPCStatusRequestHandler alloc];
  promise = self->_promise;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  v8 = [(TRIXPCStatusRequestHandler *)v6 initWithPromise:promise auditToken:v14];
  v9 = [[TRIXPCStatusServiceWrapper alloc] initWithUnderlyingHandler:v8];

  v10 = (void *)MEMORY[0x1E4F93BD0];
  interface = self->_interface;
  v12 = TRILogCategory_Server();
  LOBYTE(interface) = [v10 shouldAcceptConnection:v5 serviceName:@"com.apple.trial.status" whitelistedServerInterface:interface whitelistedClientInterface:0 requestHandler:v9 validateConnection:&__block_literal_global_32 setupClientProxy:0 interruptionHandler:&__block_literal_global_178 invalidationHandler:&__block_literal_global_180 logHandle:v12];

  return (char)interface;
}

uint64_t __66__TRIXPCStatusServiceListener_listener_shouldAcceptNewConnection___block_invoke()
{
  return 1;
}

- (TRIXPCStatusServiceListener)initWithPromise:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIXPCStatusService.m", 812, @"Invalid parameter not satisfying: %@", @"promise" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)TRIXPCStatusServiceListener;
  v7 = [(TRIXPCStatusServiceListener *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_promise, a3);
    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34861B8];
    interface = v8->_interface;
    v8->_interface = (NSXPCInterface *)v9;

    v11 = v8->_interface;
    v12 = (void *)MEMORY[0x1E016E7F0]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    [(NSXPCInterface *)v11 setClasses:v15 forSelector:sel_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion_ argumentIndex:0 ofReply:0];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end