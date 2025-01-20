@interface SBSApplicationRestrictionMonitorProxy
- (id)initWithMonitor:(id *)a1;
- (id)makeConnection;
- (uint64_t)connection;
- (uint64_t)monitor;
- (uint64_t)queue;
- (void)dealloc;
- (void)didInvalidate;
- (void)invalidate;
- (void)observeUpdateWithApplicationRestrictState:(id)a3;
@end

@implementation SBSApplicationRestrictionMonitorProxy

- (void)dealloc
{
  [(SBSApplicationRestrictionMonitorProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSApplicationRestrictionMonitorProxy;
  [(SBSApplicationRestrictionMonitorProxy *)&v3 dealloc];
}

- (id)initWithMonitor:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)SBSApplicationRestrictionMonitorProxy;
    v5 = (id *)[super init];
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      [NSString stringWithFormat:@"com.apple.springboard.application-restriction-monitoring-service.connectionQueue-%p", a1];
      id v6 = objc_claimAutoreleasedReturnValue();
      v7 = (const char *)[v6 UTF8String];
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
      id v10 = a1[2];
      a1[2] = v9;

      uint64_t v11 = -[SBSApplicationRestrictionMonitorProxy makeConnection](a1);
      id v12 = a1[3];
      a1[3] = (id)v11;

      [a1[3] activate];
    }
  }

  return a1;
}

- (id)makeConnection
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    objc_super v3 = +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification identifier];
    id v4 = [MEMORY[0x1E4F50BB8] endpointForMachName:v2 service:v3 instance:0];
    v5 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v4];
    objc_initWeak(&location, a1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke;
    v7[3] = &unk_1E566B438;
    v7[4] = a1;
    objc_copyWeak(&v8, &location);
    [v5 configureConnection:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)observeUpdateWithApplicationRestrictState:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__SBSApplicationRestrictionMonitorProxy_observeUpdateWithApplicationRestrictState___block_invoke;
  v6[3] = &unk_1E566BB08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __83__SBSApplicationRestrictionMonitorProxy_observeUpdateWithApplicationRestrictState___block_invoke(uint64_t a1)
{
  v2 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "Notifying monitor of an application restriction update", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) monitorDidUpdateApplicationRestrictionState:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  objc_super v3 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Client invalidated connection", v5, 2u);
  }

  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification interface];
  [v3 setInterface:v4];

  id v5 = +[SBSApplicationRestrictionMonitoringServiceInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  [v3 setTargetQueue:v7];
  [v3 setActivationHandler:&__block_literal_global_32];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_8;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v8];
  objc_destroyWeak(&v9);
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __55__SBSApplicationRestrictionMonitorProxy_makeConnection__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = SBLogApplicationRestrictionMonitoring();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSApplicationRestrictionMonitorProxy didInvalidate]((uint64_t)WeakRetained);
}

- (void)didInvalidate
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SBSApplicationRestrictionMonitorProxy_didInvalidate__block_invoke;
    block[3] = &unk_1E566BCE8;
    block[4] = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__SBSApplicationRestrictionMonitorProxy_didInvalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) monitorDidLoseConnection];
}

- (uint64_t)monitor
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)connection
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end