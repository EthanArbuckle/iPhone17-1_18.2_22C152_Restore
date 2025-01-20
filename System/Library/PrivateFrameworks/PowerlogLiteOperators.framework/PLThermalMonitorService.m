@interface PLThermalMonitorService
+ (void)load;
- (NSDate)lastSMCThermalTrigger;
- (PLEntryNotificationOperatorComposition)smcNotification;
- (PLThermalMonitorService)init;
- (PLXPCResponderOperatorComposition)powerHUDResponder;
- (PLXPCResponderOperatorComposition)sysdiagnoseResponder;
- (id)handlePowerHUDCallback:(id)a3;
- (id)handleSysdiagnoseCallback:(id)a3;
- (void)handleSMCCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)performLogging:(id)a3;
- (void)setLastSMCThermalTrigger:(id)a3;
- (void)setPowerHUDResponder:(id)a3;
- (void)setSmcNotification:(id)a3;
- (void)setSysdiagnoseResponder:(id)a3;
@end

@implementation PLThermalMonitorService

- (void)performLogging:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogThermal();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "Sent notification to submodules: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [MEMORY[0x1E4F92A88] postNotificationName:@"PLThermalMonitorNotification" object:self userInfo:v4];
}

- (void)handleSMCCallback:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F929C0] BOOLForKey:@"EnableSMCNotification" ifNotSet:1];
  if (v4 && v5)
  {
    int v6 = [v4 objectForKey:@"entry"];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"mTPL"];
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v8 = (void *)v7;
    v9 = [v6 objectForKeyedSubscript:@"mTPL"];
    uint64_t v10 = [v9 integerValue];

    if (v10 < 1) {
      goto LABEL_20;
    }
    v11 = PLLogThermal();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v21 = [(PLThermalMonitorService *)self lastSMCThermalTrigger];
      int v22 = 138412290;
      v23 = v21;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "Received notification from SMCAgent, lastSMCThermalTrigger: %@", (uint8_t *)&v22, 0xCu);
    }
    v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v13 = [(PLThermalMonitorService *)self lastSMCThermalTrigger];

    if (v13)
    {
      v14 = [(PLThermalMonitorService *)self lastSMCThermalTrigger];
      [v14 timeIntervalSinceDate:v12];
      double v16 = fabs(v15);

      if (v16 <= 40.0)
      {
        v20 = PLLogThermal();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 138412290;
          v23 = v6;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "Too frequent thermal triggers, not notifying submodules: %@", (uint8_t *)&v22, 0xCu);
        }

        goto LABEL_19;
      }
      [(PLThermalMonitorService *)self setLastSMCThermalTrigger:v12];
      v17 = PLLogThermal();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "lastSMCThermalTrigger is non-null, notifying submodules: %@", (uint8_t *)&v22, 0xCu);
      }

      v18 = &unk_1F29E89B0;
    }
    else
    {
      [(PLThermalMonitorService *)self setLastSMCThermalTrigger:v12];
      v19 = PLLogThermal();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "lastSMCThermalTrigger is null, notifying submodules: %@", (uint8_t *)&v22, 0xCu);
      }

      v18 = &unk_1F29E8988;
    }
    [(PLThermalMonitorService *)self performLogging:v18];
LABEL_19:

LABEL_20:
  }
}

- (NSDate)lastSMCThermalTrigger
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastSMCThermalTrigger:(id)a3
{
}

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSMCCallback:a2];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLThermalMonitorService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLThermalMonitorService)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLThermalMonitorService;
  return [(PLOperator *)&v3 init];
}

- (void)initOperatorDependancies
{
  objc_super v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ThermalInstantKeys"];
  id v4 = objc_alloc(MEMORY[0x1E4F929E8]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke;
  v17[3] = &unk_1E692A0F0;
  v17[4] = self;
  int v5 = (PLEntryNotificationOperatorComposition *)[v4 initWithOperator:self forEntryKey:v3 withBlock:v17];
  smcNotification = self->_smcNotification;
  self->_smcNotification = v5;

  id v7 = objc_alloc(MEMORY[0x1E4F92AA8]);
  uint64_t v8 = [(PLOperator *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_27;
  v16[3] = &unk_1E692A118;
  v16[4] = self;
  v9 = (PLXPCResponderOperatorComposition *)[v7 initWithWorkQueue:v8 withRegistration:&unk_1F29E8938 withBlock:v16];
  sysdiagnoseResponder = self->_sysdiagnoseResponder;
  self->_sysdiagnoseResponder = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v12 = [(PLOperator *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_38;
  v15[3] = &unk_1E692A118;
  v15[4] = self;
  v13 = (PLXPCResponderOperatorComposition *)[v11 initWithWorkQueue:v12 withRegistration:&unk_1F29E8960 withBlock:v15];
  powerHUDResponder = self->_powerHUDResponder;
  self->_powerHUDResponder = v13;
}

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSysdiagnoseCallback:");
}

uint64_t __51__PLThermalMonitorService_initOperatorDependancies__block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePowerHUDCallback:");
}

- (id)handleSysdiagnoseCallback:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PLLogThermal();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Received event from Sysdiagnose: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PLThermalMonitorService *)self performLogging:&unk_1F29E89D8];
  return &unk_1F29E8A00;
}

- (id)handlePowerHUDCallback:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PLLogThermal();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Received event from PowerHUD: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PLThermalMonitorService *)self performLogging:&unk_1F29E8A28];
  return &unk_1F29E8A50;
}

- (PLEntryNotificationOperatorComposition)smcNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSmcNotification:(id)a3
{
}

- (PLXPCResponderOperatorComposition)sysdiagnoseResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSysdiagnoseResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)powerHUDResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPowerHUDResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSMCThermalTrigger, 0);
  objc_storeStrong((id *)&self->_powerHUDResponder, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseResponder, 0);
  objc_storeStrong((id *)&self->_smcNotification, 0);
}

@end