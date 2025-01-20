@interface BRCOperation
@end

@implementation BRCOperation

uint64_t __34___BRCOperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishIfCancelled];
}

uint64_t __22___BRCOperation__main__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 248) setupIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 main];
}

void __53___BRCOperation__scheduleExecutionWithPreviousError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  long long v6 = *(_OWORD *)(*(void *)(a1 + 32) + 480);
  uint64_t v7 = v2;
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx retrying %@%@", buf, 0x20u);
  }

  [*(id *)(a1 + 32) _executeWithPreviousError:*(void *)(a1 + 40)];
  __brc_leave_section((uint64_t *)&v6);
}

uint64_t __25___BRCOperation_schedule__block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  if (!*(void *)(*(void *)(a1 + 32) + 248))
  {
    uint64_t v5 = brc_bread_crumbs();
    long long v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __25___BRCOperation_schedule__block_invoke_cold_2(v1);
    }
  }
  uint64_t v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __25___BRCOperation_schedule__block_invoke_cold_1(v1);
  }

  return objc_msgSend(*(id *)(*v1 + 248), "addOperation:");
}

void __22___BRCOperation_start__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  long long v6 = *(_OWORD *)(*(void *)(a1 + 32) + 480);
  uint64_t v7 = v2;
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx starting with throttle %@%@", buf, 0x20u);
  }

  [*(id *)(a1 + 32) _scheduleExecutionWithPreviousError:0];
  __brc_leave_section((uint64_t *)&v6);
}

void __22___BRCOperation_start__block_invoke_99(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  long long v9 = *(_OWORD *)(*(void *)(a1 + 32) + 480);
  uint64_t v10 = v2;
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx starting %@%@", buf, 0x20u);
  }

  if ([*(id *)(a1 + 32) finishIfCancelled])
  {
    uint64_t v5 = brc_bread_crumbs();
    long long v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [*(id *)(a1 + 32) operationID];
      __22___BRCOperation_start__block_invoke_99_cold_1(v7, (uint64_t)v5, (uint64_t)buf);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _main];
  }
  __brc_leave_section((uint64_t *)&v9);
}

NSObject *__23___BRCOperation_cancel__block_invoke(uint64_t a1)
{
  result = *(NSObject **)(*(void *)(a1 + 32) + 352);
  if (result)
  {
    dispatch_source_cancel(result);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 352);
    *(void *)(v3 + 352) = 0;

    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _finishIfCancelled];
  }
  return result;
}

void __43___BRCOperation_completedWithResult_error___block_invoke()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)completedWithResult_error____personalPersona;
  completedWithResult_error____personalPersona = v0;
}

uint64_t __43___BRCOperation_completedWithResult_error___block_invoke_118(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __43___BRCOperation_completedWithResult_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_cold_1();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 group];
    BOOL v4 = v3 == 0;

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 48) group];
      [v2 setGroup:v5];
    }
    if ([*(id *)(a1 + 48) nonDiscretionary])
    {
      long long v6 = [v2 configuration];
      [v6 setDiscretionaryNetworkBehavior:0];

      uint64_t v7 = [v2 configuration];
      [v7 setAutomaticallyRetryNetworkFailures:0];
    }
    [*(id *)(a1 + 48) _setDeviceConfigurationHeaderOnCKOp:v2];
    uint64_t v8 = [v2 completionBlock];
    objc_initWeak((id *)location, v2);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_126;
    v21[3] = &unk_26507EDE8;
    v21[4] = *(void *)(a1 + 48);
    objc_copyWeak(&v23, (id *)location);
    id v9 = v8;
    id v22 = v9;
    [v2 setCompletionBlock:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    id v2 = *(id *)(a1 + 40);
    uint64_t v10 = [v2 group];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 48) group];
      [v2 setGroup:v12];
    }
    if (([v2 nonDiscretionary] & 1) == 0) {
      objc_msgSend(v2, "setNonDiscretionary:", objc_msgSend(*(id *)(a1 + 48), "nonDiscretionary"));
    }
  }

LABEL_14:
  __int16 v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = [*(id *)(a1 + 48) operationID];
    uint64_t v17 = [v16 UUIDString];
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] (%@) Queuing %@%@", location, 0x20u);
  }
  [*(id *)(a1 + 32) addOperation:*(void *)(a1 + 40) allowsCellularAccess:*(void *)(a1 + 56)];
  uint64_t result = [*(id *)(a1 + 48) isCancelled];
  if (result) {
    return [*(id *)(a1 + 40) cancel];
  }
  return result;
}

uint64_t __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_126(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 400);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v7, "associateWithCompletedOperation:", WeakRetained, (void)v10);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __46___BRCOperation_blockOnHighPriorityOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[47]);
    uint64_t v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, dispatch_group_t *))(v4 + 16))(v4, v3);
    uint64_t v3 = v5;
  }
}

void __34___BRCOperation_cancelAfterDelay___block_invoke(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __34___BRCOperation_cancelAfterDelay___block_invoke_cold_1(a1, (uint64_t)v2, v3);
  }

  [*(id *)(*(void *)(a1 + 32) + 296) timeIntervalSinceNow];
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) name];
  uint64_t v7 = [*(id *)(a1 + 32) nonDiscretionary];
  uint64_t v8 = [*(id *)(a1 + 32) syncContext];
  id v9 = +[AppTelemetryTimeSeriesEvent newOperationTimedOutEventWithTime:type:nonDiscretionary:hasForegroundClients:](AppTelemetryTimeSeriesEvent, "newOperationTimedOutEventWithTime:type:nonDiscretionary:hasForegroundClients:", v6, v7, [v8 isForeground], v5);

  long long v10 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  long long v11 = [v10 analyticsReporter];
  [v11 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v9];

  [*(id *)(a1 + 32) setTimedOut:1];
  [*(id *)(a1 + 32) cancel];
}

void __25___BRCOperation_schedule__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v2, (uint64_t)v2, "[DEBUG] scheduling %@%@", (uint8_t *)&v3);
}

void __25___BRCOperation_schedule__block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Operation %@ is missing syncContext%@", (void)v3, DWORD2(v3));
}

void __22___BRCOperation_start__block_invoke_99_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, v6, v4, "[DEBUG] Operation %@ cancelled before calling main%@", v5);
}

void __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: context%@", v2, v3, v4, v5, v6);
}

void __34___BRCOperation_cancelAfterDelay___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) description];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_23FA42000, a3, v6, "[DEBUG] Timeout expired, cancelling operation %@%@", (uint8_t *)&v7);
}

@end