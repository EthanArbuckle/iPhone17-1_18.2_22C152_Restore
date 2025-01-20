@interface PowerUIWalletSignalMonitor
+ (PowerUIWalletSignalMonitor)monitorWithDelegate:(id)a3;
+ (id)wallet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)waitForFinalChangeTimer;
- (OS_os_log)log;
- (PowerUISignalMonitorDelegate)delegate;
- (PowerUIWalletSignalMonitor)initWithDelegate:(id)a3;
- (id)detectedSignals;
- (id)requiredFullChargeDate;
- (unint64_t)signalID;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWaitForFinalChangeTimer:(id)a3;
- (void)sourceInformationChangedNotification:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PowerUIWalletSignalMonitor

+ (id)wallet
{
  v2 = (void *)wallet_wallet;
  if (!wallet_wallet)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F5BF80]);
    v4 = (void *)wallet_wallet;
    wallet_wallet = (uint64_t)v3;

    v2 = (void *)wallet_wallet;
  }
  return v2;
}

- (PowerUIWalletSignalMonitor)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PowerUIWalletSignalMonitor;
  v6 = [(PowerUIWalletSignalMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    os_log_t v8 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;
  }
  return v7;
}

+ (PowerUIWalletSignalMonitor)monitorWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDelegate:v4];

  return (PowerUIWalletSignalMonitor *)v5;
}

- (unint64_t)signalID
{
  return 5;
}

- (void)startMonitoring
{
  id v3 = +[PowerUIWalletSignalMonitor wallet];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_sourceInformationChangedNotification_ name:*MEMORY[0x263F5C650] object:0];
}

- (void)sourceInformationChangedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    delegate = self->_delegate;
    *(_DWORD *)buf = 138412290;
    v17 = delegate;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Boarding pass has changed, set timer for %@", buf, 0xCu);
  }
  if (!self->_queue)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    os_log_t v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.powerui.walletMonitorQueue", v7);
    queue = self->_queue;
    self->_queue = v8;
  }
  waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  if (!waitForFinalChangeTimer)
  {
    objc_super v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    v12 = self->_waitForFinalChangeTimer;
    self->_waitForFinalChangeTimer = v11;

    v13 = self->_waitForFinalChangeTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __67__PowerUIWalletSignalMonitor_sourceInformationChangedNotification___block_invoke;
    handler[3] = &unk_2645A5CF0;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);
    waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  }
  dispatch_time_t v14 = dispatch_walltime(0, 5000000000);
  dispatch_source_set_timer(waitForFinalChangeTimer, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)self->_waitForFinalChangeTimer);
}

void __67__PowerUIWalletSignalMonitor_sourceInformationChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Timer ran out, suggest new deadline for %@.", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) requiredFullChargeDate];
  [*(id *)(*(void *)(a1 + 32) + 8) monitor:*(void *)(a1 + 32) maySuggestNewFullChargeDeadline:v4];
}

- (void)stopMonitoring
{
  waitForFinalChangeTimer = self->_waitForFinalChangeTimer;
  if (waitForFinalChangeTimer) {
    dispatch_source_set_timer(waitForFinalChangeTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F5C650] object:0];
}

- (id)requiredFullChargeDate
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)os_transaction_create();
  id v4 = +[PowerUISmartChargeUtilities dateForPreferenceKey:@"WMQDisabledUntil" inDomain:@"com.apple.smartcharging.topoffprotection"];
  int v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceNow];
    if (v6 >= 0.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "wallet monitor currently disabled", buf, 2u);
      }
      v13 = [MEMORY[0x263EFF910] distantFuture];
      goto LABEL_49;
    }
    [v5 timeIntervalSinceNow];
    if (v7 < 0.0)
    {
      os_log_t v8 = self->_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "reset wallet monitor disablement", buf, 2u);
      }
      +[PowerUISmartChargeUtilities setNumber:0 forPreferenceKey:@"WMQAttempts" inDomain:@"com.apple.smartcharging.topoffprotection"];
      +[PowerUISmartChargeUtilities setNumber:0 forPreferenceKey:@"WMQSuccesses" inDomain:@"com.apple.smartcharging.topoffprotection"];
      +[PowerUISmartChargeUtilities setDate:0 forPreferenceKey:@"WMQDisabledUntil" inDomain:@"com.apple.smartcharging.topoffprotection"];
    }
  }
  v9 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"WMQAttempts" inDomain:@"com.apple.smartcharging.topoffprotection"];
  if (v9)
  {
    v10 = v9;
    objc_super v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "unsignedIntValue") + 1);
  }
  else
  {
    objc_super v11 = &unk_26D385960;
  }
  +[PowerUISmartChargeUtilities setNumber:v11 forPreferenceKey:@"WMQAttempts" inDomain:@"com.apple.smartcharging.topoffprotection"];
  dispatch_time_t v14 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"WMQSuccesses" inDomain:@"com.apple.smartcharging.topoffprotection"];
  int v15 = [v11 unsignedIntValue];
  if (v14) {
    int v16 = [v14 unsignedIntValue];
  }
  else {
    int v16 = 0;
  }
  if ((v15 - v16) < 5)
  {
    v56 = v11;
    v57 = v5;
    v58 = v3;
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Begining of walletMonitor requiredFullChargeDate"];
    v19 = +[PowerUIWalletSignalMonitor wallet];
    v20 = [v19 passesOfStyles:16];

    v52 = self;
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      uint64_t v23 = [v20 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v68 = v23;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Found %lu passes", buf, 0xCu);
    }
    v24 = [MEMORY[0x263EFF910] date];
    v25 = [v24 dateByAddingTimeInterval:-10800.0];
    v55 = v24;
    v26 = [v24 dateByAddingTimeInterval:86400.0];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v27 = v20;
    uint64_t v51 = [v27 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v51)
    {
      uint64_t v28 = *(void *)v64;
      v53 = v27;
      v54 = v14;
      uint64_t v49 = *(void *)v64;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v27);
          }
          v30 = *(void **)(*((void *)&v63 + 1) + 8 * v29);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v50 = v30;
          v31 = objc_msgSend(v30, "relevantDates", v49);
          uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v71 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v60;
            while (2)
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v60 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                v37 = [v36 date];
                [v37 timeIntervalSinceDate:v25];
                if (v38 < 0.0)
                {
                }
                else
                {
                  v39 = [v36 date];
                  [v39 timeIntervalSinceDate:v26];
                  double v41 = v40;

                  if (v41 <= 0.0)
                  {
                    v43 = v52->_log;
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                    {
                      v45 = v43;
                      v46 = [v50 localizedName];
                      v47 = [v36 date];
                      *(_DWORD *)buf = 138412546;
                      uint64_t v68 = (uint64_t)v46;
                      __int16 v69 = 2112;
                      v70 = v47;
                      _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Found pass, forcing immediate charge: %@, %@", buf, 0x16u);
                    }
                    v13 = [MEMORY[0x263EFF910] distantPast];

                    id v27 = v53;
                    dispatch_time_t v14 = v54;
                    goto LABEL_47;
                  }
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v71 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }

          ++v29;
          id v27 = v53;
          dispatch_time_t v14 = v54;
          uint64_t v28 = v49;
        }
        while (v29 != v51);
        uint64_t v51 = [v53 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v51);
    }

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of walletMonitor requiredFullChargeDate"];
    if (v14)
    {
      uint64_t v42 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);

      dispatch_time_t v14 = (void *)v42;
    }
    else
    {
      dispatch_time_t v14 = &unk_26D385960;
    }
    +[PowerUISmartChargeUtilities setNumber:v14 forPreferenceKey:@"WMQSuccesses" inDomain:@"com.apple.smartcharging.topoffprotection"];
    v13 = [MEMORY[0x263EFF910] distantFuture];
LABEL_47:

    int v5 = v57;
    uint64_t v3 = v58;
    objc_super v11 = v56;
  }
  else
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "too many WMQ failures, temp disable", buf, 2u);
    }
    uint64_t v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:604800.0];
    +[PowerUISmartChargeUtilities setDate:v18 forPreferenceKey:@"WMQDisabledUntil" inDomain:@"com.apple.smartcharging.topoffprotection"];

    v13 = [MEMORY[0x263EFF910] distantFuture];
  }

LABEL_49:
  return v13;
}

- (id)detectedSignals
{
  v2 = [(PowerUIWalletSignalMonitor *)self requiredFullChargeDate];
  uint64_t v3 = [MEMORY[0x263EFF910] distantFuture];
  int v4 = [v2 isEqualToDate:v3];

  if (v4) {
    [MEMORY[0x263EFF8C0] array];
  }
  else {
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v2];
  }

  return v5;
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)waitForFinalChangeTimer
{
  return self->_waitForFinalChangeTimer;
}

- (void)setWaitForFinalChangeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForFinalChangeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end