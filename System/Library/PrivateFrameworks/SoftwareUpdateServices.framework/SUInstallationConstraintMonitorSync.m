@interface SUInstallationConstraintMonitorSync
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_initilizaSyncState;
- (void)_queue_setSyncing:(BOOL)a3;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)connectionWasInterrupted:(id)a3;
@end

@implementation SUInstallationConstraintMonitorSync

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssert();
  v12.receiver = self;
  v12.super_class = (Class)SUInstallationConstraintMonitorSync;
  v8 = [(SUInstallationConstraintMonitorBase *)&v12 initOnQueue:v7 withRepresentedInstallationConstraints:128 andDownload:v6];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F24B18]);
    id v10 = v8[7];
    v8[7] = v9;

    [v8[7] setDelegate:v8];
    [v8[7] registerForStatus];
    objc_msgSend(v8, "_queue_initilizaSyncState");
  }
  return v8;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_isSyncing) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5 = a4;
  queue = self->super._queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SUInstallationConstraintMonitorSync_connection_updatedProgress___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __66__SUInstallationConstraintMonitorSync_connection_updatedProgress___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKey:@"Enabled"];
  uint64_t v3 = [v2 BOOLValue];

  v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "_queue_setSyncing:", v3);
}

- (void)connectionWasInterrupted:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUInstallationConstraintMonitorSync_connectionWasInterrupted___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__SUInstallationConstraintMonitorSync_connectionWasInterrupted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSyncing:", 0);
}

- (void)_queue_initilizaSyncState
{
  BSDispatchQueueAssert();
  unsigned __int8 v3 = 0;
  if ([(ATConnection *)self->_queue_airTrafficConnection isSyncing:&v3 automatically:0 wirelessly:0])[(SUInstallationConstraintMonitorSync *)self _queue_setSyncing:v3]; {
}
  }

- (void)_queue_setSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if (self->_queue_isSyncing != v3)
  {
    self->_queue_isSyncing = v3;
    id v5 = SULogInstallConstraints();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isSyncing) {
        id v6 = @"NO";
      }
      else {
        id v6 = @"YES";
      }
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ - iTunes sync constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (void).cxx_destruct
{
}

@end