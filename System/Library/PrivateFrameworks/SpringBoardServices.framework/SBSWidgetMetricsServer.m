@interface SBSWidgetMetricsServer
+ (id)checkOutServerInstance;
+ (void)returnServerInstance:(id)a3;
- (SBSWidgetMetricsServer)init;
- (id)_init;
- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3;
- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5;
- (id)systemMetricsForWidget:(id)a3;
- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4;
- (void)_createConnection;
- (void)dealloc;
@end

@implementation SBSWidgetMetricsServer

+ (id)checkOutServerInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedServerInstanceLock);
  v2 = (void *)__sharedServerInstance;
  if (!__sharedServerInstance)
  {
    id v3 = [[SBSWidgetMetricsServer alloc] _init];
    v4 = (void *)__sharedServerInstance;
    __sharedServerInstance = (uint64_t)v3;

    v2 = (void *)__sharedServerInstance;
  }
  id v5 = v2;
  ++__sharedServerInstanceCheckoutCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedServerInstanceLock);
  return v5;
}

+ (void)returnServerInstance:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__sharedServerInstanceLock);
  uint64_t v6 = __sharedServerInstance;

  if ((id)v6 != v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"SBSWidgetMetricsServer.m" lineNumber:49 description:@"unknown server instance returned"];
  }
  uint64_t v7 = __sharedServerInstanceCheckoutCount;
  if (!__sharedServerInstanceCheckoutCount)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"SBSWidgetMetricsServer.m" lineNumber:50 description:@"returnServerInstance: call unbalanced with checkOutServerInstance"];

    uint64_t v7 = __sharedServerInstanceCheckoutCount;
  }
  __sharedServerInstanceCheckoutCount = v7 - 1;
  if (v7 == 1)
  {
    v8 = (void *)__sharedServerInstance;
    __sharedServerInstance = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__sharedServerInstanceLock);
}

- (SBSWidgetMetricsServer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSWidgetMetricsServer.m" lineNumber:60 description:@"Use +checkOutServerInstance"];

  return 0;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SBSWidgetMetricsServer;
  v2 = [(SBSWidgetMetricsServer *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(SBSWidgetMetricsServer *)v2 _createConnection];
  }
  return v3;
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSWidgetMetricsServer;
  [(SBSWidgetMetricsServer *)&v3 dealloc];
}

- (id)systemMetricsForWidget:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  objc_super v5 = [(BSServiceConnection *)connection remoteTarget];
  uint64_t v6 = [v5 systemMetricsForWidget:v4];

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  objc_super v5 = [(BSServiceConnection *)connection remoteTarget];
  uint64_t v6 = [v5 previewMetricsSpecificationForBundleIdentifier:v4];

  return v6;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(BSServiceConnection *)connection remoteTarget];
  v12 = [v11 previewMetricsSpecificationForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  return v12;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BSServiceConnection *)connection remoteTarget];
  id v9 = [v8 systemMetricsForWidget:v7 inHostingEnvironment:v6];

  return v9;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  objc_super v5 = [(BSServiceConnection *)connection remoteTarget];
  id v6 = [v5 previewMetricsSpecificationsForBundleIdentifier:v4];

  return v6;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(BSServiceConnection *)connection remoteTarget];
  v12 = [v11 previewMetricsSpecificationsForDeviceContext:v10 displayContext:v9 bundleIdentifier:v8];

  return v12;
}

- (void)_createConnection
{
  objc_super v3 = (void *)MEMORY[0x1E4F50BB8];
  id v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  objc_super v5 = +[SBSWidgetMetricsServiceInterfaceSpecification identifier];
  id v8 = [v3 endpointForMachName:v4 service:v5 instance:0];

  id v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
  connection = self->_connection;
  self->_connection = v6;

  [(BSServiceConnection *)self->_connection configureConnection:&__block_literal_global_19];
  [(BSServiceConnection *)self->_connection activate];
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = +[SBSWidgetMetricsServiceInterfaceSpecification serviceQuality];
  [v4 setServiceQuality:v2];

  objc_super v3 = +[SBSWidgetMetricsServiceInterfaceSpecification interface];
  [v4 setInterface:v3];

  [v4 setInterruptionHandler:&__block_literal_global_19];
  [v4 setInvalidationHandler:&__block_literal_global_22];
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "SBSWidgetMetricsServer: connection interrupted; attempting to re-activate",
      v4,
      2u);
  }

  [v2 activate];
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_20()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__SBSWidgetMetricsServer__createConnection__block_invoke_20_cold_1(v0);
  }
}

- (void).cxx_destruct
{
}

void __43__SBSWidgetMetricsServer__createConnection__block_invoke_20_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSWidgetMetricsServer: connection invalidated", v1, 2u);
}

@end