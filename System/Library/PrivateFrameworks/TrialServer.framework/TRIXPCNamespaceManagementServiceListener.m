@interface TRIXPCNamespaceManagementServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TRIXPCNamespaceManagementServiceListener)initWithServerContextPromise:(id)a3;
@end

@implementation TRIXPCNamespaceManagementServiceListener

- (TRIXPCNamespaceManagementServiceListener)initWithServerContextPromise:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TRIXPCNamespaceManagementServiceListener;
  v6 = [(TRIXPCNamespaceManagementServiceListener *)&v36 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3485E50];
    interface = v6->_interface;
    v6->_interface = (NSXPCInterface *)v7;

    v9 = v6->_interface;
    v10 = (void *)MEMORY[0x1E016E7F0]();
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    [(NSXPCInterface *)v9 setClasses:v13 forSelector:sel_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion_ argumentIndex:0 ofReply:0];

    v14 = v6->_interface;
    v15 = (void *)MEMORY[0x1E016E7F0]();
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    [(NSXPCInterface *)v14 setClasses:v18 forSelector:sel_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion_ argumentIndex:0 ofReply:0];

    v19 = v6->_interface;
    v20 = (void *)MEMORY[0x1E016E7F0]();
    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    [(NSXPCInterface *)v19 setClasses:v23 forSelector:sel_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion_ argumentIndex:0 ofReply:0];

    v24 = v6->_interface;
    v25 = (void *)MEMORY[0x1E016E7F0]();
    id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v26, "initWithObjects:", v27, v28, objc_opt_class(), 0);
    [(NSXPCInterface *)v24 setClasses:v29 forSelector:sel_setPurgeabilityLevelsForFactors_forNamespaceName_completion_ argumentIndex:0 ofReply:0];

    v30 = v6->_interface;
    v31 = (void *)MEMORY[0x1E016E7F0]();
    id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
    [(NSXPCInterface *)v30 setClasses:v34 forSelector:sel_statusOfDownloadForFactors_withNamespace_factorsState_completion_ argumentIndex:0 ofReply:0];

    objc_storeStrong((id *)&v6->_promise, a3);
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E6BB82F8;
  block[4] = self;
  if (qword_1EA8D80E0 != -1) {
    dispatch_once(&qword_1EA8D80E0, block);
  }
  id v8 = (id)qword_1EA8D80D8;
  [v7 _setQueue:v8];
  v9 = [TRIXPCNamespaceManagementRequestHandler alloc];
  promise = self->_promise;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = [(TRIXPCNamespaceManagementRequestHandler *)v9 initWithServerContextPromise:promise auditToken:v17];
  uint64_t v12 = [[TRIXPCNamespaceManagementServiceWrapper alloc] initWithUnderlyingHandler:v11];

  v13 = (void *)MEMORY[0x1E4F93BD0];
  interface = self->_interface;
  v15 = TRILogCategory_Server();
  LOBYTE(interface) = [v13 shouldAcceptConnection:v7 serviceName:@"com.apple.triald.namespace-management" whitelistedServerInterface:interface whitelistedClientInterface:0 requestHandler:v12 validateConnection:&__block_literal_global_490_0 setupClientProxy:0 interruptionHandler:&__block_literal_global_492 invalidationHandler:&__block_literal_global_494 logHandle:v15];

  return (char)interface;
}

void __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v1 = (void *)MEMORY[0x1E4F93B18];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend(v1, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v3, "UTF8String"), 17);
  id v5 = (void *)qword_1EA8D80D8;
  qword_1EA8D80D8 = v4;
}

uint64_t __79__TRIXPCNamespaceManagementServiceListener_listener_shouldAcceptNewConnection___block_invoke_2()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_serverContext, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end