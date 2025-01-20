@interface TRIXPCInternalSystemServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TRIXPCInternalSystemServiceListener)init;
@end

@implementation TRIXPCInternalSystemServiceListener

- (TRIXPCInternalSystemServiceListener)init
{
  v31.receiver = self;
  v31.super_class = (Class)TRIXPCInternalSystemServiceListener;
  v2 = [(TRIXPCInternalSystemServiceListener *)&v31 init];
  if (v2)
  {
    v30 = objc_opt_new();
    v3 = [[TRIInternalSystemServiceRequestHandler alloc] initWithEntitlementWitness:v30];
    v4 = [[TRIXPCInternalSystemServiceWrapper alloc] initWithUnderlyingHandler:v3];

    wrapper = v2->_wrapper;
    v2->_wrapper = v4;

    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3486860];
    interface = v2->_interface;
    v2->_interface = (NSXPCInterface *)v6;

    v8 = v2->_interface;
    v9 = (void *)MEMORY[0x1E016E7F0]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    [(NSXPCInterface *)v8 setClasses:v14 forSelector:sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_ argumentIndex:0 ofReply:0];

    v15 = v2->_interface;
    v16 = (void *)MEMORY[0x1E016E7F0]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v17, "initWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    [(NSXPCInterface *)v15 setClasses:v21 forSelector:sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_ argumentIndex:1 ofReply:0];

    v22 = v2->_interface;
    v23 = (void *)MEMORY[0x1E016E7F0]();
    id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v24, "initWithObjects:", v25, v26, v27, objc_opt_class(), 0);
    [(NSXPCInterface *)v22 setClasses:v28 forSelector:sel_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap_completion_ argumentIndex:2 ofReply:0];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F93BD0];
  wrapper = self->_wrapper;
  interface = self->_interface;
  id v7 = a4;
  v8 = TRILogCategory_Server();
  LOBYTE(v4) = [v4 shouldAcceptConnection:v7 serviceName:@"com.apple.triald.system.internal" whitelistedServerInterface:interface whitelistedClientInterface:0 requestHandler:wrapper validateConnection:&__block_literal_global_14 setupClientProxy:0 interruptionHandler:&__block_literal_global_126_0 invalidationHandler:&__block_literal_global_128 logHandle:v8];

  return (char)v4;
}

uint64_t __74__TRIXPCInternalSystemServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93BD0];
  id v3 = a2;
  v4 = TRILogCategory_Server();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.triald.system.internal" connection:v3 serviceName:@"com.apple.triald.system.internal" logHandle:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end