@interface SUCorePower
+ (id)sharedPowerManager;
+ (int)getPowerAssertionCountForIdentifierDomain:(id)a3;
+ (void)_disablePowerAssertion:(id)a3 forAppendedDomain:(id)a4;
+ (void)_enablePowerAssertion:(id)a3 forAppendedDomain:(id)a4;
+ (void)setPowerAssertion:(BOOL)a3 forIdentifierDomain:(id)a4;
- (NSMutableDictionary)activePowerAssertions;
- (OS_dispatch_queue)assertionQueue;
- (SUCorePower)init;
- (void)setActivePowerAssertions:(id)a3;
@end

@implementation SUCorePower

+ (id)sharedPowerManager
{
  if (sharedPowerManager_powerManagerOnce != -1) {
    dispatch_once(&sharedPowerManager_powerManagerOnce, &__block_literal_global_6);
  }
  v2 = (void *)sharedPowerManager_powerManager;

  return v2;
}

uint64_t __33__SUCorePower_sharedPowerManager__block_invoke()
{
  sharedPowerManager_powerManager = objc_alloc_init(SUCorePower);

  return MEMORY[0x270F9A758]();
}

- (SUCorePower)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SUCorePower;
  v2 = [(SUCorePower *)&v18 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    v4 = [MEMORY[0x263F77D78] sharedCore];
    v5 = [v4 commonDomain];
    v6 = (void *)[v3 initWithFormat:@"%@.%@", v5, @"core.power.assertion"];

    id v7 = v6;
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    assertionQueue = v2->_assertionQueue;
    v2->_assertionQueue = (OS_dispatch_queue *)v10;

    if (v2->_assertionQueue)
    {
      v12 = [MEMORY[0x263F77DE8] sharedLogger];
      v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POWER_ASSERTION] DISPATCH: created dispatch queue domain(%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      v13 = [MEMORY[0x263F77DA8] sharedDiag];
      v14 = (void *)[[NSString alloc] initWithFormat:@"unable to create dispatch queue domain(%@)", v7];
      [v13 trackError:@"[POWER_ASSERTION]" forReason:v14 withResult:8100 withError:0];
    }
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activePowerAssertions = v2->_activePowerAssertions;
    v2->_activePowerAssertions = v15;
  }
  return v2;
}

+ (void)setPowerAssertion:(BOOL)a3 forIdentifierDomain:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = +[SUCorePower sharedPowerManager];
  if (v6)
  {
    id v7 = [MEMORY[0x263F77D78] sharedSUCoreDomainAppending:v5];
    v8 = [v6 assertionQueue];
    dispatch_assert_queue_not_V2(v8);

    v9 = [v6 assertionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke;
    block[3] = &unk_2640DD9B8;
    BOOL v18 = v4;
    id v16 = v6;
    id v17 = v7;
    id v10 = v7;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x263F77DA8] sharedDiag];
    id v12 = [NSString alloc];
    v13 = @"disable";
    if (v4) {
      v13 = @"enable";
    }
    v14 = (void *)[v12 initWithFormat:@"no shared power manager - unable to %@ power assertion for domain(%@)", v13, v5];
    [v11 trackError:@"[POWER_ASSERTION]" forReason:v14 withResult:8101 withError:0];
  }
}

uint64_t __53__SUCorePower_setPowerAssertion_forIdentifierDomain___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    return +[SUCorePower _enablePowerAssertion:v1 forAppendedDomain:v2];
  }
  else {
    return +[SUCorePower _disablePowerAssertion:v1 forAppendedDomain:v2];
  }
}

+ (int)getPowerAssertionCountForIdentifierDomain:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[SUCorePower sharedPowerManager];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  if (v4)
  {
    id v5 = [MEMORY[0x263F77D78] sharedSUCoreDomainAppending:v3];
    v6 = [v4 assertionQueue];
    dispatch_assert_queue_not_V2(v6);

    id v7 = [v4 assertionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke;
    block[3] = &unk_2640DCFF8;
    id v13 = v4;
    id v14 = v5;
    v15 = &v16;
    id v8 = v5;
    dispatch_sync(v7, block);

    v9 = v13;
  }
  else
  {
    id v8 = [MEMORY[0x263F77DA8] sharedDiag];
    v9 = (void *)[[NSString alloc] initWithFormat:@"no shared power manager - unable to get power assertion count for domain(%@)", v3];
    [v8 trackError:@"[POWER_ASSERTION]" forReason:v9 withResult:8101 withError:0];
  }

  int v10 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __57__SUCorePower_getPowerAssertionCountForIdentifierDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activePowerAssertions];
  id v4 = [v2 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class()];

  id v3 = v4;
  if (v4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 activeAssertionCount];
    id v3 = v4;
  }
}

+ (void)_enablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (__CFString *)a4;
  id v7 = [v5 assertionQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 activePowerAssertions];
  v9 = [v8 safeObjectForKey:v6 ofClass:objc_opt_class()];

  if (!v9)
  {
    id v13 = objc_alloc_init(SUCorePowerAssertion);
    if (!v13)
    {
      v9 = [MEMORY[0x263F77DA8] sharedDiag];
      v11 = [[NSString alloc] initWithFormat:@"unable to create SUCorePowerAssertion object for domain(%@)", v6];
      [v9 trackError:@"[POWER_ASSERTION]" forReason:v11 withResult:8100 withError:0];
      goto LABEL_11;
    }
    v9 = v13;
    IOPMAssertionID AssertionID = -1;
    IOReturn v14 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v6, &AssertionID);
    if (v14)
    {
      IOReturn v15 = v14;
      v11 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"unable to create IOKit Power Assertion for domain(%@)", v6];
      [v11 trackError:@"[POWER_ASSERTION]" forReason:v16 withResult:v15 withError:0];

      goto LABEL_11;
    }
    objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
    [v9 setAssertionID:AssertionID];
    id v17 = [v5 activePowerAssertions];
    [v17 setSafeObject:v9 forKey:v6];

    uint64_t v18 = [MEMORY[0x263F77DE8] sharedLogger];
    v11 = [v18 oslog];

    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v19 = [v9 activeAssertionCount];
    *(_DWORD *)buf = 67109378;
    int v22 = v19;
    __int16 v23 = 2114;
    v24 = v6;
    id v12 = "[POWER_ASSERTION] ENABLED(count=%d) for domain(%{public}@)";
    goto LABEL_4;
  }
  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") + 1);
  int v10 = [MEMORY[0x263F77DE8] sharedLogger];
  v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = [v9 activeAssertionCount];
    __int16 v23 = 2114;
    v24 = v6;
    id v12 = "[POWER_ASSERTION] INCREASED(count=%d) for domain(%{public}@)";
LABEL_4:
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
  }
LABEL_11:
}

+ (void)_disablePowerAssertion:(id)a3 forAppendedDomain:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 assertionQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 activePowerAssertions];
  v9 = [v8 safeObjectForKey:v6 ofClass:objc_opt_class()];

  if (!v9)
  {
    v11 = [MEMORY[0x263F77DA8] sharedDiag];
    id v13 = (void *)[[NSString alloc] initWithFormat:@"disabling power assertion when no assertion is active for domain(%@)", v6];
    [v11 trackError:@"[POWER_ASSERTION]" forReason:v13 withResult:8101 withError:0];

    goto LABEL_7;
  }
  objc_msgSend(v9, "setActiveAssertionCount:", objc_msgSend(v9, "activeAssertionCount") - 1);
  if ((int)[v9 activeAssertionCount] <= 0)
  {
    IOReturn v14 = IOPMAssertionRelease([v9 assertionID]);
    if (v14)
    {
      IOReturn v15 = v14;
      uint64_t v16 = [MEMORY[0x263F77DA8] sharedDiag];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"unable to release IOKit Power Assertion for domain(%@)", v6];
      [v16 trackError:@"[POWER_ASSERTION]" forReason:v17 withResult:v15 withError:0];

      goto LABEL_8;
    }
    uint64_t v18 = [v5 activePowerAssertions];
    [v18 removeObjectForKey:v6];

    int v19 = [MEMORY[0x263F77DE8] sharedLogger];
    v11 = [v19 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = [v9 activeAssertionCount];
      __int16 v22 = 2114;
      id v23 = v6;
      id v12 = "[POWER_ASSERTION] DISABLED(count=%d) for domain(%{public}@)";
      goto LABEL_5;
    }
  }
  else
  {
    int v10 = [MEMORY[0x263F77DE8] sharedLogger];
    v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = [v9 activeAssertionCount];
      __int16 v22 = 2114;
      id v23 = v6;
      id v12 = "[POWER_ASSERTION] DECREASED(count=%d) for domain(%{public}@)";
LABEL_5:
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
    }
  }
LABEL_7:

LABEL_8:
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (NSMutableDictionary)activePowerAssertions
{
  return self->_activePowerAssertions;
}

- (void)setActivePowerAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePowerAssertions, 0);

  objc_storeStrong((id *)&self->_assertionQueue, 0);
}

@end