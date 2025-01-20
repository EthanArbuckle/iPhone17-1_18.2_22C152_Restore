@interface MBCellularDataSubscriptionMonitor
- (BOOL)_startDelegateTimerWithTimeout:(unint64_t)a3;
- (CoreTelephonyClient)telephonyClient;
- (MBCellularDataSubscriptionMonitor)initWithQueue:(id)a3 timeout:(unint64_t)a4;
- (MBCellularDataSubscriptionMonitor)initWithTimeout:(unint64_t)a3;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)delegateTimer;
- (id)backupOnCellularSupportHandler;
- (int)cellularRadioType;
- (unint64_t)_backupOnCellularSupportWithError:(id *)a3;
- (unint64_t)backupOnCellularSupport;
- (unint64_t)timeout;
- (void)_cancelDelegateTimer;
- (void)_refreshBackupOnCellularSupportWithTimeout:(unint64_t)a3;
- (void)cancel;
- (void)currentDataSimChanged:(id)a3;
- (void)dataSettingsChanged:(id)a3;
- (void)internetDataStatus:(id)a3;
- (void)setBackupOnCellularSupport:(unint64_t)a3;
- (void)setBackupOnCellularSupportHandler:(id)a3;
- (void)setCellularRadioType:(int)a3;
- (void)setDelegateTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)start;
@end

@implementation MBCellularDataSubscriptionMonitor

- (MBCellularDataSubscriptionMonitor)initWithQueue:(id)a3 timeout:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MBCellularDataSubscriptionMonitor;
  v7 = [(MBCellularDataSubscriptionMonitor *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MBCellularDataSubscriptionMonitor *)v7 setQueue:v6];
    [(MBCellularDataSubscriptionMonitor *)v8 setTimeout:a4];
  }

  return v8;
}

- (MBCellularDataSubscriptionMonitor)initWithTimeout:(unint64_t)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

  v7 = (objc_class *)objc_opt_class();
  Name = class_getName(v7);
  dispatch_queue_t v9 = dispatch_queue_create(Name, v6);
  objc_super v10 = [(MBCellularDataSubscriptionMonitor *)self initWithQueue:v9 timeout:a3];
  v11 = v10;
  if (v10)
  {
    [(MBCellularDataSubscriptionMonitor *)v10 setBackupOnCellularSupport:0];
    [(MBCellularDataSubscriptionMonitor *)v11 setCellularRadioType:0];
  }

  return v11;
}

- (unint64_t)_backupOnCellularSupportWithError:(id *)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    -[MBCellularDataSubscriptionMonitor _backupOnCellularSupportWithError:]();
  }
  v5 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  *a3 = 0;
  id v6 = [(MBCellularDataSubscriptionMonitor *)self telephonyClient];
  v7 = v6;
  if (v6)
  {
    id v115 = 0;
    v8 = [v6 getCurrentDataSubscriptionContextSync:&v115];
    dispatch_queue_t v9 = (__CFString *)v115;
    objc_super v10 = MBGetDefaultLog();
    v11 = v10;
    if (!v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v9;
        _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the data subscription context: %@", buf, 0xCu);
        _MBLog(@"ERROR", (uint64_t)"Failed to fetch the data subscription context: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v9);
      }

      v47 = v9;
      unint64_t v40 = 0;
      *a3 = v47;
      goto LABEL_66;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v117 = v8;
      _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_INFO, "Fetched the data subscription context: %@", buf, 0xCu);
      _MBLog(@"INFO", (uint64_t)"Fetched the data subscription context: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    }

    v114 = v9;
    v18 = [v7 getSupports5G:v8 error:&v114];
    v19 = v114;

    if (v18)
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v117 = v18;
        _os_log_impl(&dword_1DD9AE000, v20, OS_LOG_TYPE_DEBUG, "Fetched device&carrier 5G support: %{public}@", buf, 0xCu);
        _MBLog(@"DEBUG", (uint64_t)"Fetched device&carrier 5G support: %{public}@", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }

      if (![(__CFString *)v18 BOOLValue])
      {
        unint64_t v40 = 0;
        goto LABEL_54;
      }
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];

      id v113 = 0;
      v28 = [v7 copyCarrierBundleValueWithDefault:v8 key:@"EnableBackupOnCellular" bundleType:v27 error:&v113];
      id v29 = v113;
      v30 = v29;
      if (v28)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v32 = MBGetDefaultLog();
        v33 = v32;
        if (isKindOfClass)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v117 = @"EnableBackupOnCellular";
            __int16 v118 = 2114;
            *(void *)v119 = v28;
            _os_log_impl(&dword_1DD9AE000, v33, OS_LOG_TYPE_DEFAULT, "Fetched \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
            _MBLog(@"DEFAULT", (uint64_t)"Fetched \"%{public}@\" carrier bundle key: %{public}@", v34, v35, v36, v37, v38, v39, @"EnableBackupOnCellular");
          }

          if (([v28 BOOLValue] & 1) == 0)
          {
            unint64_t v40 = 0;
            goto LABEL_38;
          }
LABEL_37:
          unint64_t v40 = 2;
LABEL_38:

          id v112 = 0;
          v70 = [v7 copyCarrierBundleValueWithDefault:v8 key:@"EnableRestoreOnCellular" bundleType:v27 error:&v112];
          v19 = (__CFString *)v112;

          if (v70)
          {
            objc_opt_class();
            char v71 = objc_opt_isKindOfClass();
            v72 = MBGetDefaultLog();
            v73 = v72;
            if (v71)
            {
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v117 = @"EnableRestoreOnCellular";
                __int16 v118 = 2114;
                *(void *)v119 = v70;
                _os_log_impl(&dword_1DD9AE000, v73, OS_LOG_TYPE_DEFAULT, "Fetched \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
                _MBLog(@"DEFAULT", (uint64_t)"Fetched \"%{public}@\" carrier bundle key: %{public}@", v74, v75, v76, v77, v78, v79, @"EnableRestoreOnCellular");
              }

              if (([v70 BOOLValue] & 1) == 0) {
                goto LABEL_53;
              }
              goto LABEL_52;
            }
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v117 = @"EnableRestoreOnCellular";
              __int16 v118 = 2114;
              *(void *)v119 = v70;
              _os_log_impl(&dword_1DD9AE000, v73, OS_LOG_TYPE_ERROR, "Invalid value for \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"Invalid value for \"%{public}@\" carrier bundle key: %{public}@", v86, v87, v88, v89, v90, v91, @"EnableRestoreOnCellular");
            }
          }
          else
          {
            if (!v19)
            {
LABEL_51:
              v70 = 0;
LABEL_52:
              v40 |= 4uLL;
LABEL_53:

LABEL_54:
              v111 = v19;
              v92 = [v7 getDataStatus:v8 error:&v111];
              v47 = v111;

              if (!v92)
              {
                v97 = MBGetDefaultLog();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v117 = v47;
                  _os_log_impl(&dword_1DD9AE000, v97, OS_LOG_TYPE_ERROR, "Failed to fetch data status: %@", buf, 0xCu);
                  _MBLog(@"ERROR", (uint64_t)"Failed to fetch data status: %@", v98, v99, v100, v101, v102, v103, (uint64_t)v47);
                }
                goto LABEL_64;
              }
              int v93 = [v92 newRadioCoverage];
              int v94 = [v92 radioTechnology];
              int v95 = v94;
              if (v93)
              {
                uint64_t v96 = 2;
              }
              else
              {
                if (v94 != 7) {
                  goto LABEL_62;
                }
                uint64_t v96 = 1;
              }
              [(MBCellularDataSubscriptionMonitor *)self setCellularRadioType:v96];
              v40 |= 1uLL;
LABEL_62:
              v97 = MBGetDefaultLog();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                v117 = v18;
                __int16 v118 = 1024;
                *(_DWORD *)v119 = v93;
                *(_WORD *)&v119[4] = 1024;
                *(_DWORD *)&v119[6] = v95;
                __int16 v120 = 2048;
                unint64_t v121 = v40;
                _os_log_impl(&dword_1DD9AE000, v97, OS_LOG_TYPE_INFO, "Fetched data status, supports5G:%{public}@, newRadioCoverage:%d, radioTechnology:%d, result:0x%lx", buf, 0x22u);
                _MBLog(@"INFO", (uint64_t)"Fetched data status, supports5G:%{public}@, newRadioCoverage:%d, radioTechnology:%d, result:0x%lx", v104, v105, v106, v107, v108, v109, (uint64_t)v18);
              }
LABEL_64:

              goto LABEL_65;
            }
            v70 = MBGetDefaultLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v117 = @"EnableRestoreOnCellular";
              __int16 v118 = 2112;
              *(void *)v119 = v19;
              _os_log_impl(&dword_1DD9AE000, v70, OS_LOG_TYPE_ERROR, "Failed to fetch \"%{public}@\" carrier bundle key: %@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"Failed to fetch \"%{public}@\" carrier bundle key: %@", v80, v81, v82, v83, v84, v85, @"EnableRestoreOnCellular");
            }
          }

          goto LABEL_51;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v117 = @"EnableBackupOnCellular";
          __int16 v118 = 2114;
          *(void *)v119 = v28;
          _os_log_impl(&dword_1DD9AE000, v33, OS_LOG_TYPE_ERROR, "Invalid value for \"%{public}@\" carrier bundle key: %{public}@", buf, 0x16u);
          _MBLog(@"ERROR", (uint64_t)"Invalid value for \"%{public}@\" carrier bundle key: %{public}@", v64, v65, v66, v67, v68, v69, @"EnableBackupOnCellular");
        }
      }
      else
      {
        if (!v29)
        {
LABEL_36:
          v28 = 0;
          goto LABEL_37;
        }
        v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v117 = @"EnableBackupOnCellular";
          __int16 v118 = 2112;
          *(void *)v119 = v30;
          _os_log_impl(&dword_1DD9AE000, v28, OS_LOG_TYPE_ERROR, "Failed to fetch \"%{public}@\" carrier bundle key: %@", buf, 0x16u);
          _MBLog(@"ERROR", (uint64_t)"Failed to fetch \"%{public}@\" carrier bundle key: %@", v58, v59, v60, v61, v62, v63, @"EnableBackupOnCellular");
        }
      }

      goto LABEL_36;
    }
    if ([(__CFString *)v19 code] == 45
      && ([(__CFString *)v19 domain],
          v48 = objc_claimAutoreleasedReturnValue(),
          int v49 = [v48 isEqualToString:*MEMORY[0x1E4F28798]],
          v48,
          v49))
    {
      v50 = MBGetDefaultLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v19;
        _os_log_impl(&dword_1DD9AE000, v50, OS_LOG_TYPE_INFO, "Failed to check for device&carrier 5G support: %@", buf, 0xCu);
        v57 = @"INFO";
LABEL_27:
        _MBLog(v57, (uint64_t)"Failed to check for device&carrier 5G support: %@", v51, v52, v53, v54, v55, v56, (uint64_t)v19);
      }
    }
    else
    {
      v50 = MBGetDefaultLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v19;
        _os_log_impl(&dword_1DD9AE000, v50, OS_LOG_TYPE_ERROR, "Failed to check for device&carrier 5G support: %@", buf, 0xCu);
        v57 = @"ERROR";
        goto LABEL_27;
      }
    }

    v47 = v19;
    unint64_t v40 = 0;
    *a3 = v47;
LABEL_65:

LABEL_66:
    goto LABEL_67;
  }
  +[MBError errorWithCode:1 format:@"nil CoreTelephonyClient"];
  unint64_t v40 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v40;
}

- (BOOL)_startDelegateTimerWithTimeout:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  [(MBCellularDataSubscriptionMonitor *)self _cancelDelegateTimer];
  if (a3)
  {
    objc_initWeak(&location, self);
    id v6 = [(MBCellularDataSubscriptionMonitor *)self queue];
    v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);

    dispatch_time_t v8 = dispatch_walltime(0, 1000000000 * a3);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__MBCellularDataSubscriptionMonitor__startDelegateTimerWithTimeout___block_invoke;
    handler[3] = &unk_1E6D00FE8;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v7, handler);
    [(MBCellularDataSubscriptionMonitor *)self setDelegateTimer:v7];
    dispatch_queue_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_DEBUG, "Starting CoreTelephonyClientDataDelegate timer (%llds): %p", buf, 0x16u);
      _MBLog(@"DEBUG", (uint64_t)"Starting CoreTelephonyClientDataDelegate timer (%llds): %p", v10, v11, v12, v13, v14, v15, a3);
    }

    dispatch_resume(v7);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  return a3 != 0;
}

void __68__MBCellularDataSubscriptionMonitor__startDelegateTimerWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = MBGetDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = objc_opt_class();
      _os_log_impl(&dword_1DD9AE000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fired", buf, 0xCu);
      uint64_t v3 = objc_opt_class();
      _MBLog(@"DEFAULT", (uint64_t)"%{public}@ timer fired", v4, v5, v6, v7, v8, v9, v3);
    }

    [WeakRetained _cancelDelegateTimer];
    [WeakRetained _refreshBackupOnCellularSupportWithTimeout:0];
  }
}

- (void)_cancelDelegateTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(MBCellularDataSubscriptionMonitor *)self delegateTimer];
  if (v4)
  {
    [(MBCellularDataSubscriptionMonitor *)self setDelegateTimer:0];
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_DEBUG, "Canceling CoreTelephonyClientDataDelegate timer: %p", buf, 0xCu);
      _MBLog(@"DEBUG", (uint64_t)"Canceling CoreTelephonyClientDataDelegate timer: %p", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    }

    dispatch_source_cancel(v4);
  }
}

- (void)_refreshBackupOnCellularSupportWithTimeout:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v22 = 0;
  uint64_t v6 = [(MBCellularDataSubscriptionMonitor *)self _backupOnCellularSupportWithError:&v22];
  id v7 = v22;
  if ([v7 code] == 35
    && ([v7 domain],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:*MEMORY[0x1E4F28798]],
        v8,
        v9))
  {
    if (![(MBCellularDataSubscriptionMonitor *)self _startDelegateTimerWithTimeout:a3])
    {
      self->_backupOnCellularSupportChanged = 0;
      uint64_t v10 = [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupportHandler];

      if (v10)
      {
        uint64_t v11 = [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupportHandler];
        uint64_t v12 = +[MBError errorWithCode:17 format:@"Failed to fetch backupOnCellularSupport"];
        ((void (**)(void, uint64_t, void *))v11)[2](v11, v6, v12);

LABEL_12:
      }
    }
  }
  else if (!self->_backupOnCellularSupportChanged {
         || v6 != [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupport])
  }
  {
    uint64_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupport];
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = v6;
      __int16 v25 = 2048;
      unint64_t v26 = v14;
      _os_log_impl(&dword_1DD9AE000, v13, OS_LOG_TYPE_DEFAULT, "backupOnCellularSupport changed: %ld(%ld)", buf, 0x16u);
      [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupport];
      _MBLog(@"DEFAULT", (uint64_t)"backupOnCellularSupport changed: %ld(%ld)", v15, v16, v17, v18, v19, v20, v6);
    }

    self->_backupOnCellularSupportChanged = 1;
    [(MBCellularDataSubscriptionMonitor *)self setBackupOnCellularSupport:v6];
    unint64_t v21 = [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupportHandler];

    if (v21)
    {
      uint64_t v11 = [(MBCellularDataSubscriptionMonitor *)self backupOnCellularSupportHandler];
      v11[2](v11, v6, 0);
      goto LABEL_12;
    }
  }
}

- (void)start
{
  __assert_rtn("-[MBCellularDataSubscriptionMonitor start]", "MBCellularDataSubscriptionMonitor.m", 205, "self.backupOnCellularSupport == MBBackupOnCellularSupportNone");
}

uint64_t __42__MBCellularDataSubscriptionMonitor_start__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F23A80]);
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  uint64_t v4 = (void *)[v2 initWithQueue:v3];
  [*(id *)(a1 + 32) setTelephonyClient:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 telephonyClient];
  [v6 setDelegate:v5];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 timeout];
  return [v7 _refreshBackupOnCellularSupportWithTimeout:v8];
}

- (void)cancel
{
  [(MBCellularDataSubscriptionMonitor *)self setTelephonyClient:0];
  uint64_t v3 = [(MBCellularDataSubscriptionMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MBCellularDataSubscriptionMonitor_cancel__block_invoke;
  block[3] = &unk_1E6D00E18;
  block[4] = self;
  dispatch_async(v3, block);
}

void __43__MBCellularDataSubscriptionMonitor_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelDelegateTimer];
  id v2 = [*(id *)(a1 + 32) backupOnCellularSupportHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) backupOnCellularSupportHandler];
    uint64_t v4 = +[MBError errorWithCode:202 format:@"Cancelled"];
    ((void (**)(void, void, void *))v3)[2](v3, 0, v4);

    uint64_t v5 = *(void **)(a1 + 32);
    [v5 setBackupOnCellularSupportHandler:0];
  }
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "currentDataSimChanged: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"currentDataSimChanged: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
  }

  [(MBCellularDataSubscriptionMonitor *)self _refreshBackupOnCellularSupportWithTimeout:0];
}

- (void)dataSettingsChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_DEFAULT, "dataSettingsChanged: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"dataSettingsChanged: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
}

- (void)internetDataStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MBCellularDataSubscriptionMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "internetDataStatus: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"internetDataStatus: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
  }

  [(MBCellularDataSubscriptionMonitor *)self _refreshBackupOnCellularSupportWithTimeout:0];
}

- (unint64_t)backupOnCellularSupport
{
  return self->_backupOnCellularSupport;
}

- (void)setBackupOnCellularSupport:(unint64_t)a3
{
  self->_backupOnCellularSupport = a3;
}

- (int)cellularRadioType
{
  return self->_cellularRadioType;
}

- (void)setCellularRadioType:(int)a3
{
  self->_cellularRadioType = a3;
}

- (id)backupOnCellularSupportHandler
{
  return self->_backupOnCellularSupportHandler;
}

- (void)setBackupOnCellularSupportHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)delegateTimer
{
  return self->_delegateTimer;
}

- (void)setDelegateTimer:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTelephonyClient:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_delegateTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_backupOnCellularSupportHandler, 0);
}

- (void)_backupOnCellularSupportWithError:.cold.1()
{
}

@end