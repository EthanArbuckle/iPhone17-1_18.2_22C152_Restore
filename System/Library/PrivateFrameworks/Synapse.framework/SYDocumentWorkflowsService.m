@interface SYDocumentWorkflowsService
+ (id)serviceName;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serviceQueue;
- (SYDocumentWorkflowsService)init;
- (void)beginListeningToConnections;
- (void)dealloc;
- (void)setListener:(id)a3;
- (void)setServiceQueue:(id)a3;
@end

@implementation SYDocumentWorkflowsService

+ (id)serviceName
{
  return @"com.apple.synapse.DocumentWorkflowsService";
}

- (SYDocumentWorkflowsService)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsService;
  v2 = [(SYDocumentWorkflowsService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsService", v3);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SYDocumentWorkflowsRepository);
    repository = v2->_repository;
    v2->_repository = v6;
  }
  return v2;
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "Document Workflows Service deallocated", buf, 2u);
  }

  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;

  v5.receiver = self;
  v5.super_class = (Class)SYDocumentWorkflowsService;
  [(SYDocumentWorkflowsService *)&v5 dealloc];
}

- (void)beginListeningToConnections
{
  v3 = [(SYDocumentWorkflowsService *)self listener];

  if (!v3)
  {
    dispatch_queue_t v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "Starting Document Workflows Service...", v12, 2u);
    }

    id v5 = objc_alloc(MEMORY[0x1E4F29290]);
    v6 = [(id)objc_opt_class() serviceName];
    v7 = (void *)[v5 initWithMachServiceName:v6];
    [(SYDocumentWorkflowsService *)self setListener:v7];

    v8 = [(SYDocumentWorkflowsService *)self listener];
    objc_super v9 = [(SYDocumentWorkflowsService *)self serviceQueue];
    [v8 _setQueue:v9];

    v10 = [(SYDocumentWorkflowsService *)self listener];
    [v10 setDelegate:self];

    v11 = [(SYDocumentWorkflowsService *)self listener];
    [v11 resume];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYDocumentWorkflowsService *)self listener];

  if (v8 == v6)
  {
    objc_super v9 = [(SYDocumentWorkflowsService *)self serviceQueue];
    [v7 _setQueue:v9];

    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2D620];
    [v7 setExportedInterface:v10];

    v11 = [[SYDocumentWorkflowsServiceHandle alloc] initWithRepository:self->_repository];
    [v7 setExportedObject:v11];

    [v7 resume];
  }
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109376;
    v14[1] = [v7 processIdentifier];
    __int16 v15 = 1024;
    BOOL v16 = v8 == v6;
    _os_log_impl(&dword_1C2C5F000, v12, OS_LOG_TYPE_INFO, "Service should accept new connection from PID: %d, accepted: %d", (uint8_t *)v14, 0xEu);
  }

  return v8 == v6;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end