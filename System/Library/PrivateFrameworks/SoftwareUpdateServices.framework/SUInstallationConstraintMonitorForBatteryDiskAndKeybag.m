@interface SUInstallationConstraintMonitorForBatteryDiskAndKeybag
- (BOOL)_queue_evaluateBattery;
- (BOOL)_queue_evaluateDisk;
- (BOOL)_queue_evaluateKeybag;
- (BOOL)_queue_evaluatePasscodeLocked;
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 installOptions:(id)a5 pollDuration:(double)a6 keybag:(id)a7;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 pollDuration:(double)a5 keybag:(id)a6;
- (unint64_t)deltaSpaceNeeded;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_pollSatisfied;
- (void)dealloc;
- (void)keybagInterface:(id)a3 hasPasscodeSetDidChange:(BOOL)a4;
- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4;
- (void)keybagInterfacePasscodeDidChange:(id)a3;
- (void)refreshConstraints;
@end

@implementation SUInstallationConstraintMonitorForBatteryDiskAndKeybag

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  return [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self initOnQueue:a3 withDownload:a4 andInstallOptions:0];
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[SUKeybagInterface sharedInstance];
  id v12 = [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self initOnQueue:v10 withDownload:v9 installOptions:v8 pollDuration:v11 keybag:300.0];

  return v12;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 pollDuration:(double)a5 keybag:(id)a6
{
  return [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self initOnQueue:a3 withDownload:a4 installOptions:0 pollDuration:a6 keybag:a5];
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 installOptions:(id)a5 pollDuration:(double)a6 keybag:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BSDispatchQueueAssert();
  v30.receiver = self;
  v30.super_class = (Class)SUInstallationConstraintMonitorForBatteryDiskAndKeybag;
  v16 = [(SUInstallationConstraintMonitorBase *)&v30 initOnQueue:v12 withRepresentedInstallationConstraints:53 andDownload:v13 andInstallOptions:v14];
  uint64_t v17 = (uint64_t)v16;
  if (v16)
  {
    v18 = (void *)v16[6];
    v16[6] = 0;

    *(void *)(v17 + 64) = 0;
    *(unsigned char *)(v17 + 72) = 0;
    *(unsigned char *)(v17 + 73) = 0;
    *(unsigned char *)(v17 + 74) = 0;
    *(unsigned char *)(v17 + 75) = 0;
    if (v15)
    {
      id v19 = v15;
    }
    else
    {
      v20 = SULogInstallConstraints();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:](v20);
      }

      id v19 = +[SUKeybagInterface sharedInstance];
    }
    v21 = *(void **)(v17 + 48);
    *(void *)(v17 + 48) = v19;

    [*(id *)(v17 + 48) addObserver:v17];
    objc_initWeak(&location, (id)v17);
    v22 = SULogInstallConstraints();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:](v17, v22, a6);
    }

    id v23 = objc_alloc(MEMORY[0x263F29CF0]);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke;
    v27[3] = &unk_26447DBC8;
    objc_copyWeak(v28, &location);
    v28[1] = *(id *)&a6;
    uint64_t v24 = [v23 initWithFireInterval:v12 repeatInterval:v27 leewayInterval:a6 queue:a6 handler:0.0];
    v25 = *(void **)(v17 + 56);
    *(void *)(v17 + 56) = v24;

    [*(id *)(v17 + 56) schedule];
    objc_msgSend((id)v17, "_queue_pollSatisfied");
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }

  return (id)v17;
}

void __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke(uint64_t a1)
{
  v2 = SULogInstallConstraints();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_pollSatisfied");
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21DCF7000, a2, OS_LOG_TYPE_DEBUG, "%@ - timer invalidated", (uint8_t *)&v2, 0xCu);
}

uint64_t __65__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (unint64_t)deltaSpaceNeeded
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_deltaSpaceNeeded__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_deltaSpaceNeeded__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64);
  return result;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  unint64_t v3 = !self->_queue_batterySatisfied;
  if (!self->_queue_diskSatisfied) {
    v3 |= 4uLL;
  }
  if (!self->_queue_keybagSatisfied) {
    v3 |= 0x10uLL;
  }
  if (self->_queue_passcodeSatisfied) {
    return v3;
  }
  else {
    return v3 | 0x20;
  }
}

- (void)refreshConstraints
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_refreshConstraints__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __76__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_refreshConstraints__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterface:(id)a3 hasPasscodeSetDidChange:(BOOL)a4
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_hasPasscodeSetDidChange___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __98__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_hasPasscodeSetDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_passcodeLockedStateDidChange___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __103__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterfacePasscodeDidChange:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterfacePasscodeDidChange___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterfacePasscodeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)_queue_pollSatisfied
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  unint64_t v3 = SULogInstallConstraints();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = self;
    _os_log_impl(&dword_21DCF7000, v3, OS_LOG_TYPE_DEFAULT, "%@ - evaluating constraints for disk/battery/passcode/keybag", (uint8_t *)&v13, 0xCu);
  }

  if (!self->_queue_keybag)
  {
    uint64_t v4 = +[SUKeybagInterface sharedInstance];
    queue_keybag = self->_queue_keybag;
    self->_queue_keybag = v4;

    [(SUKeybagInterface *)self->_queue_keybag addObserver:self];
  }
  BOOL v6 = [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self _queue_evaluateBattery];
  BOOL v7 = [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self _queue_evaluateDisk];
  BOOL v8 = [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self _queue_evaluateKeybag];
  BOOL v9 = [(SUInstallationConstraintMonitorForBatteryDiskAndKeybag *)self _queue_evaluatePasscodeLocked];
  uint64_t v10 = v6;
  if (v7) {
    uint64_t v10 = v6 | 4;
  }
  if (v8) {
    v10 |= 0x10uLL;
  }
  if (v9) {
    uint64_t v11 = v10 | 0x20;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11)
  {
    id v12 = [(SUInstallationConstraintMonitorBase *)self delegate];
    [v12 installationConstraintMonitor:self constraintsDidChange:v11];
  }
}

- (BOOL)_queue_evaluateBattery
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  unint64_t v3 = [(SUInstallationConstraintMonitorBase *)self download];
  uint64_t v4 = [v3 descriptor];
  v5 = [(SUInstallationConstraintMonitorBase *)self installOptions];
  int v6 = SUHasEnoughBatteryForInstallation(v4, v5);

  int queue_batterySatisfied = self->_queue_batterySatisfied;
  if (queue_batterySatisfied != v6)
  {
    self->_int queue_batterySatisfied = v6;
    BOOL v8 = SULogInstallConstraints();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_batterySatisfied) {
        BOOL v9 = @"YES";
      }
      else {
        BOOL v9 = @"NO";
      }
      int v11 = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ - battery constraint changed (satisfied? %@)", (uint8_t *)&v11, 0x16u);
    }
  }
  return queue_batterySatisfied != v6;
}

- (BOOL)_queue_evaluateDisk
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  unint64_t v3 = SULogInstallConstraints();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(SUInstallationConstraintMonitorBase *)self download];
    *(_DWORD *)v28 = 134217984;
    *(void *)&v28[4] = v4;
    _os_log_impl(&dword_21DCF7000, v3, OS_LOG_TYPE_DEFAULT, "evaluateDisk: download: (%p)", v28, 0xCu);
  }
  id v12 = [(SUInstallationConstraintMonitorBase *)self download];
  if (!v12)
  {
    v16 = @"Download instance is nil";
LABEL_11:
    SULogInfo(v16, v5, v6, v7, v8, v9, v10, v11, *(uint64_t *)v28);
    BOOL v17 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = @"download not class SUDownload";
    goto LABEL_11;
  }
  __int16 v13 = [v12 descriptor];

  if (!v13)
  {
    v16 = @"descriptor instance is nil";
    goto LABEL_11;
  }
  id v14 = [v12 downloadOptions];

  if (v14)
  {
    uint64_t v15 = [v12 downloadOptions];
LABEL_15:
    v20 = v15;
    [v15 isAutoDownload];

    goto LABEL_16;
  }
  id v19 = [v12 metadata];

  if (v19)
  {
    uint64_t v15 = [v12 metadata];
    goto LABEL_15;
  }
LABEL_16:
  v21 = objc_alloc_init(SUSpacePurgeOptions);
  v22 = [v12 descriptor];
  -[SUSpacePurgeOptions setNeededBytes:](v21, "setNeededBytes:", [v22 installationSize]);

  [(SUSpacePurgeOptions *)v21 setEnableCacheDelete:1];
  [(SUSpacePurgeOptions *)v21 setEnableAppOffload:0];
  [(SUSpacePurgeOptions *)v21 setCacheDeleteUrgency:4];
  id v23 = +[SUSpace hasSufficientSpaceWithOptions:v21 error:0];
  int v24 = [v23 hasSufficientFreeSpace];
  self->_queue_deltaSpaceNeeded = [v23 additionalBytesRequired];
  int queue_diskSatisfied = self->_queue_diskSatisfied;
  BOOL v17 = queue_diskSatisfied != v24;
  if (queue_diskSatisfied != v24)
  {
    self->_int queue_diskSatisfied = v24;
    v26 = SULogInstallConstraints();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_diskSatisfied) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      *(_DWORD *)v28 = 138412546;
      *(void *)&v28[4] = self;
      __int16 v29 = 2112;
      objc_super v30 = v27;
      _os_log_impl(&dword_21DCF7000, v26, OS_LOG_TYPE_DEFAULT, "%@ - disk constraint changed (satisfied? %@)", v28, 0x16u);
    }
  }
LABEL_12:

  return v17;
}

- (BOOL)_queue_evaluatePasscodeLocked
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if ([(SUKeybagInterface *)self->_queue_keybag isPasscodeLocked]) {
    int queue_keybagSatisfied = self->_queue_keybagSatisfied;
  }
  else {
    int queue_keybagSatisfied = 1;
  }
  int queue_passcodeSatisfied = self->_queue_passcodeSatisfied;
  if (queue_passcodeSatisfied != queue_keybagSatisfied)
  {
    self->_int queue_passcodeSatisfied = queue_keybagSatisfied;
    uint64_t v5 = SULogInstallConstraints();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_passcodeSatisfied) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      int v8 = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ - passcode constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }
  }
  return queue_passcodeSatisfied != queue_keybagSatisfied;
}

- (BOOL)_queue_evaluateKeybag
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  queue_keybag = self->_queue_keybag;
  uint64_t v4 = [(SUInstallationConstraintMonitorBase *)self download];
  uint64_t v5 = [v4 descriptor];
  int v6 = [(SUKeybagInterface *)queue_keybag installationKeybagStateForDescriptor:v5] != 1;

  int queue_keybagSatisfied = self->_queue_keybagSatisfied;
  if (queue_keybagSatisfied != v6)
  {
    self->_int queue_keybagSatisfied = v6;
    int v8 = SULogInstallConstraints();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_keybagSatisfied) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      int v11 = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_DEFAULT, "%@ - keybag constraint changed (satisfied? %@)", (uint8_t *)&v11, 0x16u);
    }
  }
  return queue_keybagSatisfied != v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_timer, 0);
  objc_storeStrong((id *)&self->_queue_keybag, 0);
}

- (void)initOnQueue:(double)a3 withDownload:installOptions:pollDuration:keybag:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_21DCF7000, a2, OS_LOG_TYPE_DEBUG, "%@ - timer scheduled for interval @ %f s", (uint8_t *)&v3, 0x16u);
}

- (void)initOnQueue:(os_log_t)log withDownload:installOptions:pollDuration:keybag:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21DCF7000, log, OS_LOG_TYPE_DEBUG, "No KeybagInterface instance provided to SUInstallationConstraintMonitorForBatteryDiskAndKeybag initializer", v1, 2u);
}

void __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138412546;
  id v7 = WeakRetained;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_21DCF7000, a2, OS_LOG_TYPE_DEBUG, "%@ - timer fired @ %f s", (uint8_t *)&v6, 0x16u);
}

@end