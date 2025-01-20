@interface SWSystemActivityAssertion
- (BOOL)isActive;
- (NSString)description;
- (SWSystemActivityAssertion)initWithIdentifier:(id)a3;
- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 configurator:(id)a4;
- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 internalConfigurator:(id)a4;
- (void)_checkIfCompleteForAction:(uint64_t)a1;
- (void)acquireWithTimeout:(double)a3 handler:(id)a4;
- (void)callbackAcquisitionHandlerWithError:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithReason:(uint64_t)a1;
- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3;
- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3;
- (void)setSleepMonitor:(id)a3;
- (void)setSystemActivityProvider:(id)a3;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
@end

@implementation SWSystemActivityAssertion

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3
{
  return [(SWSystemActivityAssertion *)self initWithIdentifier:a3 internalConfigurator:&__block_literal_global_0];
}

void __48__SWSystemActivityAssertion_initWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setAcquireWaitsToAbortSleepRequested:0];
  [v4 setAcquireWaitsToAbortSleepImminent:0];
  v2 = +[SWSystemSleepMonitor monitorUsingMainQueue];
  [v4 setSleepMonitor:v2];

  v3 = +[SWSystemActivityProvider sharedProvider];
  [v4 setSystemActivityProvider:v3];
}

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 configurator:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__SWSystemActivityAssertion_initWithIdentifier_configurator___block_invoke;
  v10[3] = &unk_264139B20;
  id v11 = v6;
  id v7 = v6;
  v8 = [(SWSystemActivityAssertion *)self initWithIdentifier:a3 internalConfigurator:v10];

  return v8;
}

void __61__SWSystemActivityAssertion_initWithIdentifier_configurator___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
  id v4 = +[SWSystemSleepMonitor monitorUsingMainQueue];
  [v6 setSleepMonitor:v4];

  v5 = +[SWSystemActivityProvider sharedProvider];
  [v6 setSystemActivityProvider:v5];
}

- (SWSystemActivityAssertion)initWithIdentifier:(id)a3 internalConfigurator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SWSystemActivityAssertion;
  v9 = [(SWSystemActivityAssertion *)&v13 init];
  v10 = v9;
  if (v9)
  {
    *(void *)&v9->_lock_assertionID = 0;
    v9->_lock_state = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    id v11 = (void (**)(id, SWSystemActivityAssertion *))v8;
    v10->_initializing = 1;
    v11[2](v11, v10);
    v10->_initializing = 0;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_clientDidInvalidate)
  {
    v5 = [NSString stringWithFormat:@"%p must invalidate before dealloc : %@", self, self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      objc_super v13 = v8;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = @"SWSystemActivityAssertion.m";
      __int16 v18 = 1024;
      int v19 = 96;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080FDFCLL);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)SWSystemActivityAssertion;
  [(SWSystemActivityAssertion *)&v9 dealloc];
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  id v4 = (id)[v3 appendUnsignedInteger:self->_lock_state withName:@"state"];
  id v5 = (id)[v3 appendBool:self->_acquireWaitsToAbortSleepRequested withName:@"waitsForAbortSleep" ifEqualTo:1];
  id v6 = (id)[v3 appendBool:self->_lock_acquisitionHandler != 0 withName:@"pendingAcquisition" ifEqualTo:1];
  id v7 = (id)[v3 appendUnsignedInt:self->_lock_assertionID withName:@"assertionID"];
  id v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_state == 4;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SWSystemActivityAssertion_acquireWithTimeout_handler___block_invoke;
  block[3] = &unk_264139B48;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __56__SWSystemActivityAssertion_acquireWithTimeout_handler___block_invoke(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (!v2) {
    goto LABEL_33;
  }
  id v4 = SWLogPower();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v48 = *(void *)(v2 + 8);
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v2;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2048;
    *(void *)v84 = v1;
    _os_log_debug_impl(&dword_210809000, v4, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will acquire with timeout:%lf", buf, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
  *(void *)(v2 + 72) = v1;
  uint64_t v5 = [v3 copy];
  id v6 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = v5;

  *(unsigned char *)(v2 + 83) = [*(id *)(v2 + 24) isSleepImminent];
  *(void *)(v2 + 56) = [*(id *)(v2 + 32) getMachContinuousKernelWakeTime];
  if (!*(void *)(v2 + 64))
  {
    *(void *)(v2 + 64) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    v15 = SWLogPower();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v57 = *(void *)(v2 + 8);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      _os_log_debug_impl(&dword_210809000, v15, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will declare system activity", buf, 0x16u);
    }

    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v2 + 44));
    __int16 v16 = [*(id *)(v2 + 32) declareSystemActivityWithName:*(void *)(v2 + 8)];
    if (!v16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%p system activity assertion - provider returned NULL declare result; id:%@",
        v2,
      v78 = *(void *)(v2 + 8));
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__queue_declareSystemActivity);
        id v79 = (id)objc_claimAutoreleasedReturnValue();
        v80 = (objc_class *)objc_opt_class();
        v81 = NSStringFromClass(v80);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v79;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v81;
        *(_WORD *)&buf[22] = 2048;
        *(void *)v84 = v2;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"SWSystemActivityAssertion.m";
        *(_WORD *)&v84[18] = 1024;
        *(_DWORD *)&v84[20] = 173;
        *(_WORD *)&v84[24] = 2114;
        v85 = v78;
        _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v78 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x210810C8CLL);
    }
    v17 = SWLogPower();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v58 = *(void *)(v2 + 8);
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      *(void *)v84 = v16;
      _os_log_debug_impl(&dword_210809000, v17, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) will system activity result:%@", buf, 0x20u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
    int v18 = [v16 systemState];
    int v19 = [*(id *)(v2 + 24) isSleepImminent];
    int v20 = [*(id *)(v2 + 24) hasSleepBeenRequested];
    if (v20)
    {
      BOOL v21 = *(unsigned char *)(v2 + 81) != 0;
      if (!v19)
      {
LABEL_16:
        BOOL v22 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      BOOL v21 = 0;
      if (!v19) {
        goto LABEL_16;
      }
    }
    BOOL v22 = *(unsigned char *)(v2 + 82) != 0;
LABEL_24:
    int v26 = v21 || v22;
    if (v18 == 1) {
      int v27 = 1;
    }
    else {
      int v27 = v26;
    }
    *(unsigned char *)(v2 + 84) = v27;
    if ([v16 returnValue])
    {
      v28 = SWLogPower();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        int v63 = [v16 returnValue];
        uint64_t v64 = *(void *)(v2 + 8);
        uint64_t v65 = *(void *)(v2 + 64);
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v63;
        *(_WORD *)&buf[22] = 2114;
        *(void *)v84 = v64;
        *(_WORD *)&v84[8] = 1024;
        *(_DWORD *)&v84[10] = v65;
        _os_log_fault_impl(&dword_210809000, v28, OS_LOG_TYPE_FAULT, "%p failed to start system activity (%ld) for id:%{public}@ state:%u", buf, 0x26u);
      }

      v29 = (void *)MEMORY[0x263F087E8];
      id location = (id)*MEMORY[0x263F08320];
      objc_msgSend(NSString, "stringWithFormat:", @"%p failed to start system activity (%ld); id:%@ state:%u",
        v2,
        (int)[v16 returnValue],
        *(void *)(v2 + 8),
      v30 = *(void *)(v2 + 64));
      *(void *)buf = v30;
      v31 = [NSDictionary dictionaryWithObjects:buf forKeys:&location count:1];
      v32 = [v29 errorWithDomain:@"BSSystemActivityDomain" code:4 userInfo:v31];

      *(void *)(v2 + 64) = 5;
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
LABEL_31:
      -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](v2, v32);
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v33 = *(void *)(v2 + 64);
    if ((v33 | 2) != 3)
    {
      v49 = SWLogPower();
      v50 = v49;
      BOOL v47 = v33 != 5;
      if (v33 == 5)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v54 = *(void *)(v2 + 8);
          unsigned int v55 = [v16 assertionID];
          uint64_t v56 = *(void *)(v2 + 16);
          *(_DWORD *)buf = 134218754;
          *(void *)&uint8_t buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2048;
          *(void *)v84 = v55;
          *(_WORD *)&v84[8] = 2114;
          *(void *)&v84[10] = v56;
          _os_log_impl(&dword_210809000, v50, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated while waiting on system acquisition (will immediately release); id:"
            "%{public}@ assertionID:%lu timer:%{public}@",
            buf,
            0x2Au);
        }

        v32 = 0;
      }
      else
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          uint64_t v74 = *(void *)(v2 + 64);
          uint64_t v75 = *(unsigned int *)(v2 + 40);
          uint64_t v76 = *(void *)(v2 + 8);
          uint64_t v77 = *(void *)(v2 + 16);
          *(_DWORD *)buf = 134219010;
          *(void *)&uint8_t buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v76;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v84 = v74;
          *(_WORD *)&v84[4] = 2048;
          *(void *)&v84[6] = v75;
          *(_WORD *)&v84[14] = 2114;
          *(void *)&v84[16] = v77;
          _os_log_fault_impl(&dword_210809000, v50, OS_LOG_TYPE_FAULT, "%p system activity assertion state mutated unexpectedly (will immediately release); id:%{public}@ state:%u a"
            "ssertionID:%lu timer:%{public}@",
            buf,
            0x30u);
        }

        v51 = (void *)MEMORY[0x263F087E8];
        id location = (id)*MEMORY[0x263F08320];
        objc_msgSend(NSString, "stringWithFormat:", @"%p system activity assertion state mutated unexpectedly; id:%@ state:%u",
          v2,
          *(void *)(v2 + 8),
        v52 = *(void *)(v2 + 64));
        *(void *)buf = v52;
        v53 = [NSDictionary dictionaryWithObjects:buf forKeys:&location count:1];
        v32 = [v51 errorWithDomain:@"BSSystemActivityDomain" code:3 userInfo:v53];

        *(void *)(v2 + 64) = 5;
      }
      objc_msgSend(*(id *)(v2 + 32), "releaseAssertionID:", objc_msgSend(v16, "assertionID"));
LABEL_63:
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
      if (!v47) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    *(_DWORD *)(v2 + 40) = [v16 assertionID];
    [*(id *)(v2 + 24) registerActiveSystemActivity:v2];
    if (!v27 || *(void *)(v2 + 64) != 1)
    {
      *(void *)(v2 + 64) = 4;
      v42 = SWLogPower();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = *(void *)(v2 + 8);
        int v44 = [v16 systemState];
        unsigned int v45 = [v16 assertionID];
        int v46 = *(unsigned __int8 *)(v2 + 83);
        *(_DWORD *)buf = 134219522;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v84 = v44;
        *(_WORD *)&v84[4] = 2048;
        *(void *)&v84[6] = v45;
        *(_WORD *)&v84[14] = 1024;
        *(_DWORD *)&v84[16] = v46;
        *(_WORD *)&v84[20] = 1024;
        *(_DWORD *)&v84[22] = v19;
        LOWORD(v85) = 1024;
        *(_DWORD *)((char *)&v85 + 2) = v20;
        _os_log_impl(&dword_210809000, v42, OS_LOG_TYPE_INFO, "%p created system activity assertion; id:%{public}@ systemState:%u assertionID:%lu wasSleepImminent:%{BOOL}u i"
          "sSleepImminent:%{BOOL}u hasSleepBeenRequested:%{BOOL}u",
          buf,
          0x38u);
      }

      BOOL v47 = 1;
      goto LABEL_59;
    }
    v34 = SWLogPower();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (v18 == 1)
    {
      if (v35)
      {
        uint64_t v36 = *(void *)(v2 + 8);
        int v37 = [v16 returnValue];
        int v38 = *(unsigned __int8 *)(v2 + 83);
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2048;
        *(void *)v84 = v37;
        *(_WORD *)&v84[8] = 1024;
        *(_DWORD *)&v84[10] = v38;
        *(_WORD *)&v84[14] = 1024;
        *(_DWORD *)&v84[16] = v19;
        v39 = "%p created system activity assertion too late, will wait for next system wake, id:%{public}@ err:%ld wasSl"
              "eepImminent:%{BOOL}u isSleepImminent:%{BOOL}u";
        v40 = v34;
        uint32_t v41 = 44;
LABEL_57:
        _os_log_impl(&dword_210809000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
      }
LABEL_58:

      BOOL v47 = 0;
      *(void *)(v2 + 64) = 2;
LABEL_59:
      if (*(double *)(v2 + 72) > 0.0)
      {
        [*(id *)(v2 + 16) invalidate];
        uint64_t v70 = [*(id *)(v2 + 32) createTimerWithIdentifier:*(void *)(v2 + 8)];
        v71 = *(void **)(v2 + 16);
        *(void *)(v2 + 16) = v70;

        objc_initWeak(&location, (id)v2);
        v72 = *(void **)(v2 + 16);
        double v73 = *(double *)(v2 + 72);
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __57__SWSystemActivityAssertion__queue_declareSystemActivity__block_invoke;
        *(void *)v84 = &unk_264139B70;
        objc_copyWeak((id *)&v84[8], &location);
        [v72 scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:buf queue:v73 handler:1.0];
        objc_destroyWeak((id *)&v84[8]);
        objc_destroyWeak(&location);
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
        v32 = 0;
        if (!v47) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      v32 = 0;
      goto LABEL_63;
    }
    if (v22)
    {
      if (!v35) {
        goto LABEL_58;
      }
      uint64_t v66 = *(void *)(v2 + 8);
      int v67 = [v16 returnValue];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v66;
      *(_WORD *)&buf[22] = 2048;
      *(void *)v84 = v67;
      v39 = "%p created system activity assertion after prepareForSleep, will wait for next system wake, id:%{public}@ err:%ld";
    }
    else
    {
      if (!v35) {
        goto LABEL_58;
      }
      uint64_t v68 = *(void *)(v2 + 8);
      int v69 = [v16 returnValue];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v68;
      *(_WORD *)&buf[22] = 2048;
      *(void *)v84 = v69;
      v39 = "%p created system activity assertion after sleepRequested, will wait for next system wake, id:%{public}@ err:%ld";
    }
    v40 = v34;
    uint32_t v41 = 32;
    goto LABEL_57;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 44));
  uint64_t v7 = *(void *)(v2 + 64);
  id v8 = SWLogPower();
  objc_super v9 = v8;
  if (v7 == 5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(v2 + 64);
      uint64_t v11 = *(unsigned int *)(v2 + 40);
      uint64_t v12 = *(void *)(v2 + 8);
      uint64_t v13 = *(void *)(v2 + 16);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v84 = v10;
      *(_WORD *)&v84[4] = 2048;
      *(void *)&v84[6] = v11;
      *(_WORD *)&v84[14] = 2114;
      *(void *)&v84[16] = v13;
      _os_log_impl(&dword_210809000, v9, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated before declaration; id:%{public}@ state:%u assertionID:%lu timer:%{public}@",
        buf,
        0x30u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    __int16 v14 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v59 = *(void *)(v2 + 64);
      uint64_t v60 = *(unsigned int *)(v2 + 40);
      uint64_t v61 = *(void *)(v2 + 8);
      uint64_t v62 = *(void *)(v2 + 16);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v61;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v84 = v59;
      *(_WORD *)&v84[4] = 2048;
      *(void *)&v84[6] = v60;
      *(_WORD *)&v84[14] = 2114;
      *(void *)&v84[16] = v62;
      _os_log_fault_impl(&dword_210809000, v9, OS_LOG_TYPE_FAULT, "%p system activity assertion already acquired; id:%{public}@ state:%u assertionID:%lu timer:%{public}@",
        buf,
        0x30u);
    }

    v23 = (void *)MEMORY[0x263F087E8];
    id location = (id)*MEMORY[0x263F08320];
    objc_msgSend(NSString, "stringWithFormat:", @"%p twice tried to acquire system activity assertion; id:%@ state:%u",
      v2,
      *(void *)(v2 + 8),
    v24 = *(void *)(v2 + 64));
    *(void *)buf = v24;
    v25 = [NSDictionary dictionaryWithObjects:buf forKeys:&location count:1];
    __int16 v14 = [v23 errorWithDomain:@"BSSystemActivityDomain" code:2 userInfo:v25];

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 44));
    if (v14) {
      -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](v2, v14);
    }
  }

LABEL_33:
}

- (void)callbackAcquisitionHandlerWithError:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SWLogPower();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 8);
    int v15 = 134218498;
    uint64_t v16 = a1;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_debug_impl(&dword_210809000, v4, OS_LOG_TYPE_DEBUG, "%p system activity assertion (%{public}@) callback with error:%{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v5 = (os_unfair_lock_s *)(a1 + 44);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  id v6 = (void (**)(void, void, void, void))MEMORY[0x216673C60](*(void *)(a1 + 48));
  uint64_t v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;

  int v8 = *(_DWORD *)(a1 + 40);
  int v9 = *(unsigned __int8 *)(a1 + 83);
  int v10 = *(unsigned __int8 *)(a1 + 84);
  uint64_t v11 = [*(id *)(a1 + 32) getMachContinuousKernelWakeTime];
  uint64_t v12 = *(void *)(a1 + 56);
  os_unfair_lock_unlock(v5);
  if (v6)
  {
    uint64_t v13 = [[SWSystemActivityAcquisitionDetails alloc] initWithAfterPendingSleepWasAlreadyInitiated:v9 != 0 afterFailingToRevertPendingSleep:v10 != 0 afterSleepOfNonZeroDuration:v12 != v11];
    ((void (**)(void, BOOL, id, SWSystemActivityAcquisitionDetails *))v6)[2](v6, v8 != 0, v3, v13);
  }
}

void __57__SWSystemActivityAssertion__queue_declareSystemActivity__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = SWLogPower();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = WeakRetained[1];
      *(_DWORD *)buf = 134218242;
      uint64_t v5 = WeakRetained;
      __int16 v6 = 2114;
      uint64_t v7 = v2;
      _os_log_impl(&dword_210809000, v1, OS_LOG_TYPE_DEFAULT, "%p system activity assertion timed out: %{public}@", buf, 0x16u);
    }

    -[SWSystemActivityAssertion invalidateWithReason:]((uint64_t)WeakRetained, 0);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_clientDidInvalidate = 1;
  os_unfair_lock_unlock(p_lock);
  -[SWSystemActivityAssertion invalidateWithReason:]((uint64_t)self, 1);
}

- (void)invalidateWithReason:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    [*(id *)(a1 + 16) invalidate];
    uint64_t v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = SWLogPower();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void **)(a1 + 8);
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134218754;
      uint64_t v38 = a1;
      __int16 v39 = 2114;
      v40 = v8;
      __int16 v41 = 1024;
      *(_DWORD *)v42 = v9;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v6 != 0;
      _os_log_impl(&dword_210809000, v7, OS_LOG_TYPE_INFO, "%p system activity assertion invalidated; id:%{public}@ state:%u hasUncalledAcquisitionHandler:%{BOOL}u",
        buf,
        0x22u);
    }

    if (*(void *)(a1 + 64) == 5)
    {
      int v10 = SWLogPower();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v23 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 134218242;
        uint64_t v38 = a1;
        __int16 v39 = 2114;
        v40 = v23;
        _os_log_debug_impl(&dword_210809000, v10, OS_LOG_TYPE_DEBUG, "%p system activity assertion already invalid; id:%{public}@",
          buf,
          0x16u);
      }

      uint64_t v11 = *(unsigned int *)(a1 + 40);
      if (v11)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%p system activity assertion marked invalid but has non-null asssertionID:%u; id:%@ state:%u",
          a1,
          v11,
          *(void *)(a1 + 8),
        v24 = *(void *)(a1 + 64));
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_invalidateWithReason_);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          int v26 = (objc_class *)objc_opt_class();
          int v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138544642;
          uint64_t v38 = (uint64_t)v25;
          __int16 v39 = 2114;
          v40 = v27;
          __int16 v41 = 2048;
          *(void *)v42 = a1;
          *(_WORD *)&v42[8] = 2114;
          uint64_t v43 = @"SWSystemActivityAssertion.m";
          __int16 v44 = 1024;
          int v45 = 289;
          __int16 v46 = 2114;
          BOOL v47 = v24;
          _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v24 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x210811530);
      }
      if (v6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%p system activity assertion marked invalid but has hasUncalledAcquisitionHandler; id:%@ state:%u",
          a1,
          *(void *)(a1 + 8),
        v28 = *(void *)(a1 + 64));
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_invalidateWithReason_);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138544642;
          uint64_t v38 = (uint64_t)v29;
          __int16 v39 = 2114;
          v40 = v31;
          __int16 v41 = 2048;
          *(void *)v42 = a1;
          *(_WORD *)&v42[8] = 2114;
          uint64_t v43 = @"SWSystemActivityAssertion.m";
          __int16 v44 = 1024;
          int v45 = 290;
          __int16 v46 = 2114;
          BOOL v47 = v28;
          _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v28 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x210811638);
      }
      *(void *)(a1 + 64) = 5;
      id v12 = *(id *)(a1 + 32);
      *(_DWORD *)(a1 + 40) = 0;
    }
    else
    {
      int v13 = *(_DWORD *)(a1 + 40);
      *(void *)(a1 + 64) = 5;
      id v12 = *(id *)(a1 + 32);
      *(_DWORD *)(a1 + 40) = 0;
      if (v13)
      {
        uint64_t v14 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__SWSystemActivityAssertion_invalidateWithReason___block_invoke;
        block[3] = &unk_264139B98;
        id v12 = v12;
        id v33 = v12;
        int v34 = v13;
        dispatch_async(v14, block);

        char v15 = 0;
        goto LABEL_13;
      }
    }
    char v15 = 1;
LABEL_13:
    id v16 = *(id *)(a1 + 24);
    [v16 removeObserver:a1];
    __int16 v17 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    os_unfair_lock_unlock(v4);
    if ((v15 & 1) == 0) {
      [v16 unregisterInactiveSystemActivity:a1];
    }
    if (!v6) {
      goto LABEL_22;
    }
    if (a2)
    {
      if (a2 == 1)
      {
        os_unfair_lock_lock(v4);
        uint64_t v18 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = 0;

        os_unfair_lock_unlock(v4);
LABEL_22:

        return;
      }
      BOOL v22 = 0;
    }
    else
    {
      __int16 v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      objc_msgSend(NSString, "stringWithFormat:", @"%p system activity assertion timed out before acquisition; id:%@",
        a1,
      id v20 = *(void *)(a1 + 8));
      uint64_t v36 = v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      BOOL v22 = [v19 errorWithDomain:@"BSSystemActivityDomain" code:1 userInfo:v21];
    }
    -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](a1, v22);

    goto LABEL_22;
  }
}

uint64_t __50__SWSystemActivityAssertion_invalidateWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseAssertionID:*(unsigned int *)(a1 + 40)];
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_initializing)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = NSStringFromSelector(a2);
    uint64_t v7 = [v5 stringWithFormat:@"%@ called after initialization", v6];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = @"SWSystemActivityAssertion.m";
      __int16 v19 = 1024;
      int v20 = 351;
      __int16 v21 = 2114;
      BOOL v22 = v7;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21081183CLL);
  }
  self->_acquireWaitsToAbortSleepRequested = a3;
}

- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_initializing)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = NSStringFromSelector(a2);
    uint64_t v7 = [v5 stringWithFormat:@"%@ called after initialization", v6];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = @"SWSystemActivityAssertion.m";
      __int16 v19 = 1024;
      int v20 = 356;
      __int16 v21 = 2114;
      BOOL v22 = v7;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2108119F0);
  }
  self->_acquireWaitsToAbortSleepImminent = a3;
}

- (void)setSleepMonitor:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (!self->_initializing)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = NSStringFromSelector(a2);
    id v8 = [v6 stringWithFormat:@"%@ called after initialization", v7];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      int v20 = @"SWSystemActivityAssertion.m";
      __int16 v21 = 1024;
      int v22 = 361;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210811BD8);
  }
  objc_storeStrong((id *)&self->_sleepMonitor, a3);
  [v12 addObserver:self];
}

- (void)setSystemActivityProvider:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = (SWSystemActivityProviding *)a3;
  if (!self->_initializing)
  {
    uint64_t v7 = NSString;
    id v8 = NSStringFromSelector(a2);
    id v9 = [v7 stringWithFormat:@"%@ called after initialization", v8];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      int v20 = @"SWSystemActivityAssertion.m";
      __int16 v21 = 1024;
      int v22 = 367;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210811DC4);
  }
  provider = self->_provider;
  self->_provider = v5;
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
}

- (void)_checkIfCompleteForAction:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4 == 1)
  {
    id v9 = SWLogPower();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(unsigned int *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 8);
      uint64_t v13 = *(void *)(a1 + 16);
      int v18 = 134219010;
      uint64_t v19 = a1;
      __int16 v20 = 2114;
      *(void *)__int16 v21 = v3;
      *(_WORD *)&v21[8] = 2114;
      *(void *)&v21[10] = v12;
      *(_WORD *)&v21[18] = 2048;
      *(void *)&v21[20] = v11;
      *(_WORD *)&v21[28] = 2114;
      *(void *)&v21[30] = v13;
      _os_log_debug_impl(&dword_210809000, v9, OS_LOG_TYPE_DEBUG, "%p system activity assertion woke while still acquiring, waiting for acquisition to complete (%{public}@); id:%{"
        "public}@ assertionID:%lu timer:%{public}@",
        (uint8_t *)&v18,
        0x34u);
    }

    *(void *)(a1 + 64) = 3;
    goto LABEL_13;
  }
  if (v4 != 2)
  {
    id v10 = SWLogPower();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(unsigned int *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 8);
      uint64_t v17 = *(void *)(a1 + 16);
      int v18 = 134219266;
      uint64_t v19 = a1;
      __int16 v20 = 1024;
      *(_DWORD *)__int16 v21 = v14;
      *(_WORD *)&v21[4] = 2114;
      *(void *)&v21[6] = v3;
      *(_WORD *)&v21[14] = 2114;
      *(void *)&v21[16] = v16;
      *(_WORD *)&v21[24] = 2048;
      *(void *)&v21[26] = v15;
      *(_WORD *)&v21[34] = 2114;
      *(void *)&v21[36] = v17;
      _os_log_debug_impl(&dword_210809000, v10, OS_LOG_TYPE_DEBUG, "%p system activity assertion not complete, state:%u (%{public}@); id:%{public}@ assertionID:%lu timer:%{public}@",
        (uint8_t *)&v18,
        0x3Au);
    }

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
    goto LABEL_14;
  }
  *(void *)(a1 + 64) = 4;
  uint64_t v5 = SWLogPower();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    int v18 = 134219010;
    uint64_t v19 = a1;
    __int16 v20 = 2114;
    *(void *)__int16 v21 = v3;
    *(_WORD *)&v21[8] = 2114;
    *(void *)&v21[10] = v7;
    *(_WORD *)&v21[18] = 2048;
    *(void *)&v21[20] = v6;
    *(_WORD *)&v21[28] = 2114;
    *(void *)&v21[30] = v8;
    _os_log_impl(&dword_210809000, v5, OS_LOG_TYPE_INFO, "%p system activity assertion now valid (%{public}@); id:%{public}@ assertionID:%lu timer:%{public}@",
      (uint8_t *)&v18,
      0x34u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  -[SWSystemActivityAssertion callbackAcquisitionHandlerWithError:](a1, 0);
LABEL_14:
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end