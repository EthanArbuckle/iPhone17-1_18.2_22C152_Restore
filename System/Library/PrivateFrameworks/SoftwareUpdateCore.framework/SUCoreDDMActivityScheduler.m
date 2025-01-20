@interface SUCoreDDMActivityScheduler
- (BOOL)armActivitySchedulerWithDate:(id)a3;
- (BOOL)armActivitySchedulerWithDate:(id)a3 options:(id)a4;
- (BOOL)isArmed;
- (BOOL)usePCSimpleTimer;
- (BOOL)useXPC;
- (NSDate)fireDate;
- (NSDictionary)options;
- (NSTimer)timer;
- (SUCoreDDMActivityScheduler)initWithDelegate:(id)a3 options:(id)a4;
- (SUCoreDDMActivitySchedulerDelegate)delegate;
- (id)pcTimer;
- (void)_handleTimerFired:(id)a3;
- (void)disarmActivityScheduler;
- (void)setDelegate:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setIsArmed:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPcTimer:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUsePCSimpleTimer:(BOOL)a3;
- (void)setUseXPC:(BOOL)a3;
@end

@implementation SUCoreDDMActivityScheduler

- (SUCoreDDMActivityScheduler)initWithDelegate:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUCoreDDMActivityScheduler;
    v9 = [(SUCoreDDMActivityScheduler *)&v15 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_options, a4);
      objc_storeStrong(p_isa + 2, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v12 = [MEMORY[0x263F77DE8] sharedLogger];
    v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler initWithDelegate:options:]();
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)armActivitySchedulerWithDate:(id)a3 options:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = (const char *)objc_opt_class();
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Arming", buf, 0xCu);
  }

  if (!v6)
  {
    v13 = [MEMORY[0x263F77DE8] sharedLogger];
    v12 = [v13 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]();
    }
    goto LABEL_9;
  }
  [v6 timeIntervalSinceNow];
  if (v10 < 0.0)
  {
    v11 = [MEMORY[0x263F77DE8] sharedLogger];
    v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]();
    }
LABEL_9:

    BOOL v14 = 0;
    goto LABEL_28;
  }
  if (v7) {
    [(SUCoreDDMActivityScheduler *)self setOptions:v7];
  }
  [(SUCoreDDMActivityScheduler *)self setIsArmed:1];
  [(SUCoreDDMActivityScheduler *)self setFireDate:v6];
  objc_super v15 = [MEMORY[0x263F77DE8] sharedLogger];
  v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = [(SUCoreDDMActivityScheduler *)self fireDate];
    v19 = [(SUCoreDDMActivityScheduler *)self options];
    *(_DWORD *)buf = 138412802;
    v43 = (const char *)v17;
    __int16 v44 = 2112;
    v45 = v18;
    __int16 v46 = 2112;
    v47 = v19;
    _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Fire date: %@, options: %@", buf, 0x20u);
  }
  if ([(SUCoreDDMActivityScheduler *)self useXPC])
  {
    v20 = [MEMORY[0x263F77DE8] sharedLogger];
    v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_20C8EA000, v21, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using XPC alarm stream", buf, 0xCu);
    }

    v22 = [(SUCoreDDMActivityScheduler *)self fireDate];
    [v22 timeIntervalSinceNow];
    double v24 = v23;

    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    time_t v26 = time(0);
    xpc_dictionary_set_date(v25, "Date", (unint64_t)((v24 + (double)v26) * 1000000000.0));
    xpc_set_event();
  }
  if ([(SUCoreDDMActivityScheduler *)self usePCSimpleTimer]
    && objc_opt_class()
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = [MEMORY[0x263F77DE8] sharedLogger];
    v28 = [v27 oslog];

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using PCSimpleTimer", buf, 0xCu);
    }

    id v29 = objc_alloc(MEMORY[0x263F5D408]);
    v30 = [(SUCoreDDMActivityScheduler *)self fireDate];
    v31 = (void *)[v29 initWithFireDate:v30 serviceIdentifier:@"com.apple.MobileSoftwareUpdate.DDMActivityScheduler" target:self selector:sel__handleTimerFired_ userInfo:0];
    [(SUCoreDDMActivityScheduler *)self setPcTimer:v31];

    v32 = [(SUCoreDDMActivityScheduler *)self pcTimer];
    v33 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v32 scheduleInRunLoop:v33];
  }
  else
  {
    v34 = [MEMORY[0x263F77DE8] sharedLogger];
    v35 = [v34 oslog];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_20C8EA000, v35, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using NSTimer", buf, 0xCu);
    }

    id v36 = objc_alloc(MEMORY[0x263EFFA20]);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke;
    v41[3] = &unk_2640DC518;
    v41[4] = self;
    v37 = (void *)[v36 initWithFireDate:v6 interval:0 repeats:v41 block:0.0];
    [(SUCoreDDMActivityScheduler *)self setTimer:v37];

    v38 = [MEMORY[0x263EFF9F0] mainRunLoop];
    v39 = [(SUCoreDDMActivityScheduler *)self timer];
    [v38 addTimer:v39 forMode:*MEMORY[0x263EFF478]];
  }
  BOOL v14 = 1;
LABEL_28:

  return v14;
}

uint64_t __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTimerFired:a2];
}

- (BOOL)armActivitySchedulerWithDate:(id)a3
{
  return [(SUCoreDDMActivityScheduler *)self armActivitySchedulerWithDate:a3 options:0];
}

- (void)_handleTimerFired:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger", a3);
  v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(SUCoreDDMActivityScheduler *)self options];
    id v8 = [(SUCoreDDMActivityScheduler *)self fireDate];
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    BOOL v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Fired with options: %@, fireDate: %@", (uint8_t *)&v11, 0x20u);
  }
  [(SUCoreDDMActivityScheduler *)self setIsArmed:0];
  v9 = [(SUCoreDDMActivityScheduler *)self delegate];
  double v10 = [(SUCoreDDMActivityScheduler *)self options];
  [v9 timeFiredForScheduler:self withOptions:v10 replyBlock:&__block_literal_global];
}

- (void)disarmActivityScheduler
{
  if ([(SUCoreDDMActivityScheduler *)self useXPC]) {
    xpc_set_event();
  }
  v3 = [(SUCoreDDMActivityScheduler *)self timer];

  if (v3)
  {
    v4 = [(SUCoreDDMActivityScheduler *)self timer];
    [v4 invalidate];

    [(SUCoreDDMActivityScheduler *)self setTimer:0];
  }
  v5 = [(SUCoreDDMActivityScheduler *)self pcTimer];
  if (v5 && objc_opt_class())
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(SUCoreDDMActivityScheduler *)self pcTimer];
      [v7 invalidate];

      [(SUCoreDDMActivityScheduler *)self setPcTimer:0];
    }
  }
  else
  {
  }
  [(SUCoreDDMActivityScheduler *)self setIsArmed:0];

  [(SUCoreDDMActivityScheduler *)self setFireDate:0];
}

- (SUCoreDDMActivitySchedulerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (BOOL)isArmed
{
  return self->_isArmed;
}

- (void)setIsArmed:(BOOL)a3
{
  self->_isArmed = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)usePCSimpleTimer
{
  return self->_usePCSimpleTimer;
}

- (void)setUsePCSimpleTimer:(BOOL)a3
{
  self->_usePCSimpleTimer = a3;
}

- (BOOL)useXPC
{
  return self->_useXPC;
}

- (void)setUseXPC:(BOOL)a3
{
  self->_useXPC = a3;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
}

- (id)pcTimer
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPcTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pcTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:options:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_20C8EA000, v0, v1, "[DDM] %@: Can't init SUCoreDDMActivityScheduler with nil as delegate", v2, v3, v4, v5, 2u);
}

- (void)armActivitySchedulerWithDate:options:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_20C8EA000, v0, v1, "[DDM] %@: No custom date found to schedule update, bail", v2, v3, v4, v5, 2u);
}

- (void)armActivitySchedulerWithDate:options:.cold.2()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_20C8EA000, v0, v1, "[DDM] %@: Trying to schedule for a date earlier than now, bailing", v2, v3, v4, v5, 2u);
}

@end