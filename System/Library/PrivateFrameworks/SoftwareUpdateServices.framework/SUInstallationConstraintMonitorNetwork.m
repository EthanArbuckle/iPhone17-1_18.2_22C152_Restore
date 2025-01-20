@interface SUInstallationConstraintMonitorNetwork
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 networkMonitor:(id)a5;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_networkDidChange;
- (void)dealloc;
- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4;
@end

@implementation SUInstallationConstraintMonitorNetwork

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SUNetworkMonitor sharedInstance];
  id v9 = [(SUInstallationConstraintMonitorNetwork *)self initOnQueue:v7 withDownload:v6 networkMonitor:v8];

  return v9;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 networkMonitor:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  BSDispatchQueueAssert();
  v14.receiver = self;
  v14.super_class = (Class)SUInstallationConstraintMonitorNetwork;
  v12 = [(SUInstallationConstraintMonitorBase *)&v14 initOnQueue:v11 withRepresentedInstallationConstraints:2 andDownload:v10];

  if (v12)
  {
    objc_storeStrong(v12 + 6, a5);
    [v12[6] addObserver:v12];
    objc_msgSend(v12, "_queue_networkDidChange");
  }

  return v12;
}

- (void)dealloc
{
  [(SUNetworkMonitor *)self->_queue_networkMonitor removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorNetwork;
  [(SUInstallationConstraintMonitorNetwork *)&v3 dealloc];
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_hasNetwork) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__SUInstallationConstraintMonitorNetwork_networkChangedFromNetworkType_toNetworkType___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __86__SUInstallationConstraintMonitorNetwork_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_networkDidChange");
}

- (void)_queue_networkDidChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  BOOL v3 = [(SUNetworkMonitor *)self->_queue_networkMonitor currentNetworkType] != 0;
  if (self->_queue_hasNetwork != v3)
  {
    self->_queue_hasNetwork = v3;
    v4 = SULogInstallConstraints();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_hasNetwork) {
        v5 = @"YES";
      }
      else {
        v5 = @"NO";
      }
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_21DCF7000, v4, OS_LOG_TYPE_DEFAULT, "%@ - network constraint changed (satisfied? %@)", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (void).cxx_destruct
{
}

@end