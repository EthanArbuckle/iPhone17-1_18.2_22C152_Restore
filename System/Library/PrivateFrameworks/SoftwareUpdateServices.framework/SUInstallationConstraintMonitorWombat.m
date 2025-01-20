@interface SUInstallationConstraintMonitorWombat
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_pollSatisfied;
- (void)_set_queue_wombatEnabled:(BOOL)a3;
- (void)_wombatEnabledDidChange:(id)a3;
@end

@implementation SUInstallationConstraintMonitorWombat

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssert();
  v16.receiver = self;
  v16.super_class = (Class)SUInstallationConstraintMonitorWombat;
  id v8 = [(SUInstallationConstraintMonitorBase *)&v16 initOnQueue:v7 withRepresentedInstallationConstraints:4096 andDownload:v6];

  if (v8)
  {
    *((unsigned char *)v8 + 56) = 0;
    v9 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = 0;

    uint64_t v10 = [MEMORY[0x263F544E0] sharedInstance];
    v11 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v10;

    v12 = (void *)MEMORY[0x263F544D0];
    v17[0] = *MEMORY[0x263F544D0];
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [*((id *)v8 + 6) setAttribute:v13 forKey:*MEMORY[0x263F544A0] error:0];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v8 selector:sel__wombatEnabledDidChange_ name:*v12 object:*((void *)v8 + 6)];

    objc_msgSend(v8, "_queue_pollSatisfied");
  }
  return v8;
}

- (void)_wombatEnabledDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKey:*MEMORY[0x263F544D8]];
    id v8 = v7;
    if (v7)
    {
      char v9 = [v7 BOOLValue];
      queue = self->super._queue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__SUInstallationConstraintMonitorWombat__wombatEnabledDidChange___block_invoke;
      v12[3] = &unk_26447CD98;
      v12[4] = self;
      char v13 = v9;
      dispatch_async(queue, v12);
    }
    else
    {
      v11 = SULogInstallConstraints();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SUInstallationConstraintMonitorWombat _wombatEnabledDidChange:]();
      }
    }
  }
  else
  {
    id v8 = SULogInstallConstraints();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUInstallationConstraintMonitorWombat _wombatEnabledDidChange:]();
    }
  }
}

uint64_t __65__SUInstallationConstraintMonitorWombat__wombatEnabledDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_set_queue_wombatEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_pollSatisfied
{
  BSDispatchQueueAssert();
  uint64_t v3 = [(AVSystemController *)self->_avController attributeForKey:*MEMORY[0x263F544C8]];
  BOOL v4 = v3 == *MEMORY[0x263EFFB40];
  [(SUInstallationConstraintMonitorWombat *)self _set_queue_wombatEnabled:v4];
}

- (void)_set_queue_wombatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if (self->_queue_wombatEnabled != v3)
  {
    self->_queue_wombatEnabled = v3;
    v5 = SULogInstallConstraints();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_wombatEnabled) {
        id v6 = @"NO";
      }
      else {
        id v6 = @"YES";
      }
      int v8 = 138412546;
      char v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ - is wombat constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_wombatEnabled) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void).cxx_destruct
{
}

- (void)_wombatEnabledDidChange:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DCF7000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to get userinfo from %@", (uint8_t *)v1, 0x16u);
}

- (void)_wombatEnabledDidChange:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DCF7000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to get status from %@", (uint8_t *)v1, 0x16u);
}

@end