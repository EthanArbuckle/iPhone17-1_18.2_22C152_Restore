@interface SUInstallationConstraintMonitorDriving
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_handleVehicularStateChangeNotification:(id)a3;
- (void)_queue_pollSatisfied;
@end

@implementation SUInstallationConstraintMonitorDriving

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssert();
  v11.receiver = self;
  v11.super_class = (Class)SUInstallationConstraintMonitorDriving;
  v8 = [(SUInstallationConstraintMonitorBase *)&v11 initOnQueue:v7 withRepresentedInstallationConstraints:2048 andDownload:v6];

  if (v8)
  {
    v8[48] = 0;
    if ([MEMORY[0x263F017C8] isAvailable])
    {
      v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:v8 selector:sel__handleVehicularStateChangeNotification_ name:*MEMORY[0x263F017F0] object:0];

      objc_msgSend(v8, "_queue_pollSatisfied");
    }
  }
  return v8;
}

- (void)_queue_pollSatisfied
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  BOOL v3 = [MEMORY[0x263F017C8] vehicularState] == 2
    && [MEMORY[0x263F017C8] vehicularOperatorState] != 1;
  if (self->_queue_isDriving != v3)
  {
    self->_queue_isDriving = v3;
    v4 = SULogInstallConstraints();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isDriving) {
        v5 = @"NO";
      }
      else {
        v5 = @"YES";
      }
      int v7 = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_21DCF7000, v4, OS_LOG_TYPE_DEFAULT, "%@ - is driving constraint changed (satisfied? %@)", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (void)_handleVehicularStateChangeNotification:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__SUInstallationConstraintMonitorDriving__handleVehicularStateChangeNotification___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __82__SUInstallationConstraintMonitorDriving__handleVehicularStateChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_isDriving) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

@end