@interface HDSPSleepDaemon
- (HDSPEnvironment)environment;
- (HDSPSleepDaemon)init;
- (HDSPSleepDaemon)initWithBehavior:(id)a3;
- (NSDate)launchDate;
- (OS_dispatch_source)sigtermSource;
- (id)diagnosticDescription;
- (id)diagnosticInfo;
- (void)_handleSigterm;
- (void)_setupSigtermHandler;
- (void)start;
@end

@implementation HDSPSleepDaemon

- (HDSPSleepDaemon)init
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  v4 = [(HDSPSleepDaemon *)self initWithBehavior:v3];

  return v4;
}

- (HDSPSleepDaemon)initWithBehavior:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepDaemon;
  v5 = [(HDSPSleepDaemon *)&v19 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      __int16 v22 = 2048;
      v23 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    launchDate = v5->_launchDate;
    v5->_launchDate = (NSDate *)v9;

    if (objc_msgSend(v4, "hksp_supportsSleep"))
    {
      if (!objc_msgSend(v4, "hksp_demoMode"))
      {
        uint64_t v15 = +[HDSPEnvironment standardEnvironment];
        environment = v5->_environment;
        v5->_environment = (HDSPEnvironment *)v15;

        v14 = [(HDSPEnvironment *)v5->_environment diagnostics];
        [v14 addProvider:v5];
        goto LABEL_14;
      }
      v11 = HKSPLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "sleepd entering demo mode", buf, 2u);
      }

      uint64_t v12 = +[HDSPEnvironment demoModeEnvironment];
    }
    else
    {
      v13 = HKSPLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "sleepd disabled", buf, 2u);
      }

      uint64_t v12 = +[HDSPEnvironment disabledEnvironment];
    }
    v14 = v5->_environment;
    v5->_environment = (HDSPEnvironment *)v12;
LABEL_14:

    v17 = v5;
  }

  return v5;
}

- (void)start
{
  [(HDSPEnvironment *)self->_environment prepare];

  [(HDSPSleepDaemon *)self _setupSigtermHandler];
}

- (void)_setupSigtermHandler
{
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "sleepd setting up sigterm handler", (uint8_t *)buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  id v4 = dispatch_get_global_queue(21, 0);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, v4);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v5;

  objc_initWeak(buf, self);
  v7 = self->_sigtermSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__HDSPSleepDaemon__setupSigtermHandler__block_invoke;
  handler[3] = &unk_2645DA138;
  objc_copyWeak(&v9, buf);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __39__HDSPSleepDaemon__setupSigtermHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSigterm];
  xpc_transaction_exit_clean();
}

- (void)_handleSigterm
{
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "sleepd received sigterm", v4, 2u);
  }

  [(HDSPEnvironment *)self->_environment shutdown];
}

- (id)diagnosticDescription
{
  return (id)[NSString stringWithFormat:@"Launched: %@", self->_launchDate];
}

- (id)diagnosticInfo
{
  v6[1] = *MEMORY[0x263EF8340];
  launchDate = self->_launchDate;
  v5 = @"Launched";
  v6[0] = launchDate;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (HDSPEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sigtermSource, 0);

  objc_storeStrong((id *)&self->_launchDate, 0);
}

@end