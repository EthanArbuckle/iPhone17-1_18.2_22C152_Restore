void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t SPHIDResponseDelayThreshold()
{
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1) {
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global);
  }
  return SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
}

void SPExpectedHIDResponseDelayUntil(unint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  if (v2 >= a1)
  {
    MachToNano(v2 - a1);
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPExpectedHIDResponseDelayUntil_cold_4();
    }
    goto LABEL_11;
  }
  if ((double)(unint64_t)MachToNano(a1 - v2) / 1000000000.0 <= 2.0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPExpectedHIDResponseDelayUntil_cold_2();
    }
LABEL_11:
    if (gExpectedHIDResponseDelayEndMachAbs >= a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPExpectedHIDResponseDelayUntil_cold_1(a1);
      }
    }
    else
    {
      gExpectedHIDResponseDelayEndMachAbs = a1;
    }
    return;
  }
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
  }
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
    SPExpectedHIDResponseDelayUntil_cold_3();
  }
}

char *SPPauseMonitoringHIDResponsiveness(const char *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a1) {
    SPPauseMonitoringHIDResponsiveness_cold_1((char **)&v8);
  }
  uint64_t v2 = mach_absolute_time();
  size_t v3 = strlen(a1);
  v4 = (char *)malloc_type_malloc(v3 + 9, 0xB939AC55uLL);
  *(void *)v4 = v2;
  strlcpy(v4 + 8, a1, v3 + 1);
  os_unfair_lock_lock(&gPauseReceiptLock);
  int v5 = gNumPauseReceipts;
  if (!gNumPauseReceipts) {
    gEarliestPauseMachAbs = v2;
  }
  ++gNumPauseReceipts;
  gPauseReceipts = (uint64_t)malloc_type_realloc((void *)gPauseReceipts, 8 * (v5 + 1), 0x2004093837F09uLL);
  *(void *)(gPauseReceipts + 8 * gNumPauseReceipts - 8) = v4;
  os_unfair_lock_unlock(&gPauseReceiptLock);
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
  }
  v6 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = a1;
    _os_log_impl(&dword_215699000, v6, OS_LOG_TYPE_DEFAULT, "Pausing HID responsiveness monitoring for \"%{public}s\"", (uint8_t *)&v8, 0xCu);
  }
  return v4;
}

void SPResumeMonitoringHIDResponsiveness(void *a1)
{
  if (!a1) {
    SPResumeMonitoringHIDResponsiveness_cold_1(&v8);
  }
  uint64_t v2 = mach_absolute_time();
  os_unfair_lock_lock(&gPauseReceiptLock);
  int v3 = gNumPauseReceipts;
  if (gNumPauseReceipts < 1) {
LABEL_6:
  }
    SPResumeMonitoringHIDResponsiveness_cold_5(&v8);
  uint64_t v4 = 0;
  size_t v5 = 8 * (gNumPauseReceipts - 1);
  while (*(void **)(gPauseReceipts + 8 * v4) != a1)
  {
    ++v4;
    v5 -= 8;
    if (gNumPauseReceipts == v4) {
      goto LABEL_6;
    }
  }
  if (gNumPauseReceipts - 1 > (int)v4)
  {
    memmove((void *)(gPauseReceipts + 8 * v4), (const void *)(gPauseReceipts + 8 * v4 + 8), v5);
    int v3 = gNumPauseReceipts;
  }
  gNumPauseReceipts = v3 - 1;
  if (v3 == 1)
  {
    free((void *)gPauseReceipts);
    gPauseReceipts = 0;
    if (gEarliestPauseMachAbs == *a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      v7 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPResumeMonitoringHIDResponsiveness_cold_2(a1, v2, v7);
      }
    }
    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPResumeMonitoringHIDResponsiveness_cold_3(a1, v2);
      }
    }
    gTimeMonitoringLastResumed = v2;
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v6 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPResumeMonitoringHIDResponsiveness_cold_4(a1, v2, v6);
    }
  }
  os_unfair_lock_unlock(&gPauseReceiptLock);
  free(a1);
}

void SPCheckHIDResponseTime2(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1) {
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global);
  }
  if (a1 - 1 >= a2)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v11 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPCheckHIDResponseTime2_cold_6(a1, a2, v11);
    }
    return;
  }
  uint64_t v6 = SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
  if (gNumPauseReceipts >= 1)
  {
    os_unfair_lock_lock(&gPauseReceiptLock);
    if (gNumPauseReceipts) {
      SPCheckHIDResponseTime2_cold_5((char **)buf, gNumPauseReceipts);
    }
    os_unfair_lock_unlock(&gPauseReceiptLock);
  }
  uint64_t v7 = a2 - a1;
  BOOL v8 = a2 - a1 >= v6;
  if (gExpectedHIDResponseDelayEndMachAbs <= (unint64_t)gTimeMonitoringLastResumed) {
    uint64_t v9 = gTimeMonitoringLastResumed;
  }
  else {
    uint64_t v9 = gExpectedHIDResponseDelayEndMachAbs;
  }
  if (v9 <= a1)
  {
    uint64_t v9 = 0;
    goto LABEL_29;
  }
  if (v9 + v6 > a2)
  {
    if (v7 >= v6)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      uint64_t v10 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        double v52 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        __int16 v53 = 2048;
        unint64_t v54 = a1;
        __int16 v55 = 2048;
        unint64_t v56 = a2;
        __int16 v57 = 2048;
        uint64_t v58 = v9;
        __int16 v59 = 2048;
        double v60 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
        _os_log_debug_impl(&dword_215699000, v10, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to expected unresponsiveness until %llu (%.2fs reportable)", buf, 0x34u);
      }
    }
    goto LABEL_28;
  }
  if (v7 < v6)
  {
LABEL_28:
    BOOL v8 = 0;
    goto LABEL_29;
  }
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
  }
  v12 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    double v52 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
    __int16 v53 = 2048;
    unint64_t v54 = a1;
    __int16 v55 = 2048;
    unint64_t v56 = a2;
    __int16 v57 = 2048;
    uint64_t v58 = v9;
    __int16 v59 = 2048;
    double v60 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
    _os_log_debug_impl(&dword_215699000, v12, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu with expected unresponsiveness until %llu still worth reporting (%.2fs reportable)", buf, 0x34u);
  }
  BOOL v8 = 1;
LABEL_29:
  if (a1 < a3)
  {
    if (v6 + a3 <= a2)
    {
      if (v8)
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        v14 = libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          double v21 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
          uint64_t v22 = MachToNano(a2 - a3);
          *(_DWORD *)buf = 134219008;
          double v52 = v21;
          __int16 v53 = 2048;
          unint64_t v54 = a1;
          __int16 v55 = 2048;
          unint64_t v56 = a2;
          __int16 v57 = 2048;
          uint64_t v58 = a3;
          __int16 v59 = 2048;
          double v60 = (double)(unint64_t)v22 / 1000000000.0;
          _os_log_debug_impl(&dword_215699000, v14, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu out-of-order (latest event %llu) still worth reporting (%.2fs reportable)", buf, 0x34u);
        }
        BOOL v8 = 1;
      }
    }
    else if (v8)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      v13 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        double v19 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        uint64_t v20 = MachToNano(a2 - a3);
        *(_DWORD *)buf = 134219008;
        double v52 = v19;
        __int16 v53 = 2048;
        unint64_t v54 = a1;
        __int16 v55 = 2048;
        unint64_t v56 = a2;
        __int16 v57 = 2048;
        uint64_t v58 = a3;
        __int16 v59 = 2048;
        double v60 = (double)(unint64_t)v20 / 1000000000.0;
        _os_log_debug_impl(&dword_215699000, v13, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to out-of-order HID processing (latest event %llu, %.2fs reportable)", buf, 0x34u);
      }
      BOOL v8 = 0;
    }
    if (v9 <= a3) {
      uint64_t v9 = a3;
    }
  }
  if (MEMORY[0x263F34220])
  {
    if (v9 <= a1) {
      unint64_t v15 = a1;
    }
    else {
      unint64_t v15 = v9;
    }
    if (v15 <= SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs) {
      unint64_t v15 = SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs;
    }
    if (SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs < a2) {
      SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs = a2;
    }
    unint64_t v16 = a2 - v15;
    if (a2 > v15)
    {
      unint64_t v17 = MachToNano(a2 - v15);
      if (v17 >= 0x2FAF080)
      {
        if (v17 >= 0x5F5E100)
        {
          if (v17 >= 0xEE6B280)
          {
            if (v17 >= 0x1DCD6500)
            {
              if (v17 >= 0x3B9ACA00)
              {
                if (v17 >= 0x77359400)
                {
                  if (v17 >= 0x12A05F200)
                  {
                    uint64_t v18 = 7;
                    if (v17 >= 0x2540BE400) {
                      uint64_t v18 = 8;
                    }
                  }
                  else
                  {
                    uint64_t v18 = 6;
                  }
                }
                else
                {
                  uint64_t v18 = 5;
                }
              }
              else
              {
                uint64_t v18 = 4;
              }
            }
            else
            {
              uint64_t v18 = 3;
            }
          }
          else
          {
            uint64_t v18 = 2;
          }
        }
        else
        {
          uint64_t v18 = 1;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      atomic_fetch_add_explicit(&gHIDEventCountBuckets[v18], 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&gHIDEventDurationMachAbsBuckets[v18], v16, memory_order_relaxed);
      atomic_fetch_add_explicit(&gActionCount, 1uLL, memory_order_relaxed);
      if ((SPAddToHIDTelemetry_telemetryPending & 1) == 0)
      {
        SPAddToHIDTelemetry_telemetryPending = 1;
        dispatch_time_t v23 = dispatch_time(0, 10000000000);
        global_queue = dispatch_get_global_queue(9, 0);
        dispatch_after(v23, global_queue, &__block_literal_global_41);
      }
    }
  }
  if (v8)
  {
    if (SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs > a1)
    {
      if (SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs + v6 > a2)
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        v25 = libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          double v26 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
          uint64_t v27 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
          uint64_t v28 = MachToNano(a2 - SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs);
          *(_DWORD *)buf = 134219008;
          double v52 = v26;
          __int16 v53 = 2048;
          unint64_t v54 = a1;
          __int16 v55 = 2048;
          unint64_t v56 = a2;
          __int16 v57 = 2048;
          uint64_t v58 = v27;
          __int16 v59 = 2048;
          double v60 = (double)(unint64_t)v28 / 1000000000.0;
          _os_log_debug_impl(&dword_215699000, v25, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to previously reported HID response delay at %llu (%.2fs reportable)", buf, 0x34u);
        }
        return;
      }
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      v29 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        double v48 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        uint64_t v49 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
        uint64_t v50 = MachToNano(a2 - SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs);
        *(_DWORD *)buf = 134219008;
        double v52 = v48;
        __int16 v53 = 2048;
        unint64_t v54 = a1;
        __int16 v55 = 2048;
        unint64_t v56 = a2;
        __int16 v57 = 2048;
        uint64_t v58 = v49;
        __int16 v59 = 2048;
        double v60 = (double)(unint64_t)v50 / 1000000000.0;
        _os_log_debug_impl(&dword_215699000, v29, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu overlapping previously reported HID response delay at %llu still worth reporting (%.2fs reportable)", buf, 0x34u);
      }
      if (v9 <= SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs) {
        uint64_t v9 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
      }
    }
    SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs = a2;
    if (v9 <= a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      uint64_t v36 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO)) {
        goto LABEL_95;
      }
      uint64_t v37 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134218496;
      double v52 = (double)(unint64_t)v37 / 1000000000.0;
      __int16 v53 = 2048;
      unint64_t v54 = a1;
      __int16 v55 = 2048;
      unint64_t v56 = a2;
      v33 = "Reporting %.2fs HID response delay %llu-%llu";
      v34 = v36;
      uint32_t v35 = 32;
    }
    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      uint64_t v30 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO)) {
        goto LABEL_95;
      }
      double v31 = (double)(unint64_t)MachToNano(v9 - a1) / 1000000000.0;
      uint64_t v32 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134219008;
      double v52 = v31;
      __int16 v53 = 2048;
      unint64_t v54 = a1;
      __int16 v55 = 2048;
      unint64_t v56 = a2;
      __int16 v57 = 2048;
      uint64_t v58 = v9;
      __int16 v59 = 2048;
      double v60 = (double)(unint64_t)v32 / 1000000000.0;
      v33 = "Reporting %.2fs HID response delay %llu-%llu with start time capped to %llu (%.2fs original)";
      v34 = v30;
      uint32_t v35 = 52;
    }
    _os_log_impl(&dword_215699000, v34, OS_LOG_TYPE_INFO, v33, buf, v35);
LABEL_95:
    mach_get_times();
    if (v9 <= a1) {
      unint64_t v38 = a1;
    }
    else {
      unint64_t v38 = v9;
    }
    double v39 = *(double *)&v38;
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v40 = libspindump_log_logt;
    if (os_signpost_enabled((os_log_t)libspindump_log_logt))
    {
      *(_DWORD *)buf = 134349312;
      double v52 = v39;
      __int16 v53 = 2050;
      unint64_t v54 = a2;
      _os_signpost_emit_with_name_impl(&dword_215699000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SlowHIDResponse", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x16u);
    }
    kdebug_trace();
    uint64_t v41 = spindump_connection();
    if (v41)
    {
      v42 = (_xpc_connection_s *)v41;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v44 = empty;
        xpc_dictionary_set_int64(empty, "message", 8);
        xpc_dictionary_set_uint64(v44, "eventtime_machabs", a1);
        if (v9 > a1) {
          xpc_dictionary_set_uint64(v44, "starttime_machabs", v9);
        }
        xpc_dictionary_set_uint64(v44, "endtime_machabs", a2);
        xpc_dictionary_set_uint64(v44, "threshold_machabs", v6);
        *(_DWORD *)buf = 0;
        if (_NSGetExecutablePath(0, (uint32_t *)buf))
        {
          if ((*(_DWORD *)buf - 1) >> 30)
          {
            if (libspindump_log_onceToken != -1) {
              dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
            }
            v47 = libspindump_log_logt;
            if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
              SPCheckHIDResponseTime2_cold_4((int *)buf, v47);
            }
          }
          else
          {
            v45 = (char *)malloc_type_malloc(*(unsigned int *)buf, 0x37F895C0uLL);
            if (_NSGetExecutablePath(v45, (uint32_t *)buf))
            {
              if (libspindump_log_onceToken != -1) {
                dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
              }
              v46 = libspindump_log_logt;
              if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
                SPCheckHIDResponseTime2_cold_3((int *)buf, v46);
              }
            }
            else
            {
              xpc_dictionary_set_string(v44, "pname", v45);
            }
            free(v45);
          }
        }
        else
        {
          if (libspindump_log_onceToken != -1) {
            dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
          }
          if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
            SPCheckHIDResponseTime2_cold_2();
          }
        }
        xpc_connection_send_message(v42, v44);
        xpc_release(v44);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

uint64_t spindump_connection()
{
  if (spindump_connection_once != -1) {
    dispatch_once(&spindump_connection_once, &__block_literal_global_70);
  }
  if (!spindump_connection_connection)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      spindump_connection_cold_1();
    }
  }
  return spindump_connection_connection;
}

void SPReportHIDResponseDelay(unint64_t a1, unint64_t a2)
{
}

void SPGenerateSpindump(unsigned int a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, const char *a6, const char *a7, const char *a8, const void *a9)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
  }
  unint64_t v16 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    double v31 = procname_btd(a1);
    __int16 v32 = 1024;
    unsigned int v33 = a1;
    __int16 v34 = 2080;
    uint32_t v35 = a6;
    _os_log_impl(&dword_215699000, v16, OS_LOG_TYPE_DEFAULT, "Requesting spindump to be generated for %{public}s [%d] due to %s", buf, 0x1Cu);
  }
  uint64_t v17 = spindump_connection();
  if (v17)
  {
    connection = (_xpc_connection_s *)v17;
    xpc_object_t empty = xpc_dictionary_create_empty();
    if (empty)
    {
      double v19 = empty;
      xpc_dictionary_set_int64(empty, "message", 9);
      if ((a1 & 0x80000000) == 0) {
        xpc_dictionary_set_int64(v19, "pid", a1);
      }
      if (a2) {
        xpc_dictionary_set_uint64(v19, "tid", a2);
      }
      if (a3) {
        xpc_dictionary_set_double(v19, "duration", (double)a3 / 1000.0);
      }
      if (a4) {
        xpc_dictionary_set_double(v19, "interval", (double)a4 / 1000000.0);
      }
      if (a5) {
        xpc_dictionary_set_uint64(v19, "flags", a5);
      }
      if (a6) {
        xpc_dictionary_set_string(v19, "reason", a6);
      }
      if (a8) {
        xpc_dictionary_set_string(v19, "filename", a8);
      }
      if (a7)
      {
        if (strnlen(a7, 0x100uLL) <= 0xFF)
        {
          xpc_dictionary_set_string(v19, "signature", a7);
          if (a9) {
            goto LABEL_26;
          }
          goto LABEL_36;
        }
        uint64_t v20 = (char *)malloc_type_malloc(0x100uLL, 0x6EA1B580uLL);
        __strlcpy_chk();
        xpc_dictionary_set_string(v19, "signature", v20);
        if (v20) {
          free(v20);
        }
      }
      if (a9)
      {
LABEL_26:
        xpc_dictionary_set_BOOL(v19, "callback", 1);
        double v21 = _Block_copy(a9);
        global_queue = dispatch_get_global_queue(0, 0);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __SPGenerateSpindump_block_invoke;
        handler[3] = &unk_264254D58;
        handler[4] = v21;
        xpc_connection_send_message_with_reply(connection, v19, global_queue, handler);
LABEL_37:
        xpc_release(v19);
        return;
      }
LABEL_36:
      xpc_connection_send_message(connection, v19);
      goto LABEL_37;
    }
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      SPCheckHIDResponseTime2_cold_1();
    }
    int v23 = 12;
    if (a9)
    {
LABEL_34:
      v24 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __SPGenerateSpindump_block_invoke_2;
      block[3] = &unk_264254D80;
      block[4] = a9;
      int v28 = v23;
      dispatch_async(v24, block);
    }
  }
  else
  {
    int v23 = 2;
    if (a9) {
      goto LABEL_34;
    }
  }
}

_DWORD *procname_btd(int pid)
{
  if (procname_btd_onceToken != -1) {
    dispatch_once(&procname_btd_onceToken, &__block_literal_global_75);
  }
  if (procname_btd_avoid_proc_name) {
    return 0;
  }
  unsigned int add_explicit = atomic_fetch_add_explicit(procname_btd_index, 1u, memory_order_relaxed);
  int v4 = add_explicit & 3;
  int v6 = -add_explicit;
  BOOL v5 = v6 < 0;
  int v7 = v6 & 3;
  if (v5) {
    int v8 = v4;
  }
  else {
    int v8 = -v7;
  }
  uint64_t v2 = (_DWORD *)((char *)&procname_btd_names + 128 * (uint64_t)v8);
  *uint64_t v2 = 0;
  proc_name(pid, v2, 0x80u);
  return v2;
}

void __SPGenerateSpindump_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x2166C0FF0](a2) != MEMORY[0x263EF8720] && MEMORY[0x2166C0FF0](a2) == MEMORY[0x263EF8708])
  {
    xpc_dictionary_get_int64(a2, "errno");
    xpc_dictionary_get_string(a2, "path");
    int v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
  BOOL v5 = *(const void **)(a1 + 32);

  _Block_release(v5);
}

uint64_t __SPGenerateSpindump_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

void SPReportCPUUsageResource(int a1, const char *a2, uint64_t a3, uint64_t a4, const char *a5, unint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportCPUUsageResource_cold_1();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    double v19 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v20 = "fatal ";
      }
      else {
        uint64_t v20 = (const char *)&unk_21569EB8A;
      }
      int v25 = 136447490;
      double v26 = v20;
      __int16 v27 = 2082;
      int v28 = procname_btd(a1);
      __int16 v29 = 1024;
      int v30 = a1;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      double v34 = (double)a6 / 1000000000.0;
      __int16 v35 = 2048;
      double v36 = (double)a7 / 1000000000.0;
      _os_log_impl(&dword_215699000, v19, OS_LOG_TYPE_DEFAULT, "Reporting %{public}scpu usage for %{public}s [%d] thread %#llx using %.0fs cpu over the last %.0f seconds", (uint8_t *)&v25, 0x3Au);
    }
    uint64_t v21 = spindump_connection();
    if (v21)
    {
      uint64_t v22 = (_xpc_connection_s *)v21;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v24 = empty;
        xpc_dictionary_set_int64(empty, "message", 3);
        xpc_dictionary_set_int64(v24, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v24, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v24, "tid", a3);
        }
        if (a4) {
          xpc_dictionary_set_uint64(v24, "flags", a4);
        }
        if (a5) {
          xpc_dictionary_set_string(v24, "action", a5);
        }
        xpc_dictionary_set_double(v24, "cpu", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v24, "duration", (double)a7 / 1000000000.0);
        xpc_dictionary_set_double(v24, "endtime", (double)a10 / 1000000000.0 + (double)a9 - *MEMORY[0x263EFFAF8]);
        if (a11 >= 1 && a12 >= 1)
        {
          xpc_dictionary_set_double(v24, "cpu_limit", (double)(unint64_t)a11 / 1000000000.0);
          xpc_dictionary_set_double(v24, "duration_limit", (double)(unint64_t)a12 / 1000000000.0);
        }
        xpc_connection_send_message(v22, v24);
        xpc_release(v24);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

void SPReportDiskWritesResource(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, int64_t a9, unint64_t a10)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportDiskWritesResource_cold_1();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    uint64_t v17 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v18 = "fatal ";
      }
      else {
        uint64_t v18 = (const char *)&unk_21569EB8A;
      }
      *(_DWORD *)buf = 136447234;
      int v25 = v18;
      __int16 v26 = 2082;
      __int16 v27 = procname_btd(a1);
      __int16 v28 = 1024;
      int v29 = a1;
      __int16 v30 = 2048;
      int64_t v31 = a5;
      __int16 v32 = 2048;
      double v33 = (double)a6 / 1000000000.0;
      _os_log_impl(&dword_215699000, v17, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sdisk writes for %{public}s [%d] causing %{bytes}lld writes over the last %.0f seconds", buf, 0x30u);
    }
    uint64_t v19 = spindump_connection();
    if (v19)
    {
      uint64_t v20 = (_xpc_connection_s *)v19;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v22 = empty;
        xpc_dictionary_set_int64(empty, "message", 5);
        xpc_dictionary_set_int64(v22, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v22, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v22, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v22, "action", a4);
        }
        xpc_dictionary_set_int64(v22, "io", a5);
        xpc_dictionary_set_double(v22, "duration", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v22, "endtime", (double)a8 / 1000000000.0 + (double)a7 - *MEMORY[0x263EFFAF8]);
        if (a9)
        {
          if (a10)
          {
            xpc_dictionary_set_int64(v22, "io_limit", a9);
            xpc_dictionary_set_double(v22, "duration_limit", (double)a10 / 1000000000.0);
          }
        }
        xpc_connection_send_message(v20, v22);
        xpc_release(v22);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

void SPReportFileDescriptorExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportFileDescriptorExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportFileDescriptorExhaustion_cold_1();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE) {
        unint64_t v15 = (const char *)&unk_21569EB8A;
      }
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl(&dword_215699000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sfile descriptor exhaustion for %{public}s [%d] at %lld file descriptors", (uint8_t *)&v20, 0x26u);
    }
    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 11);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_fds", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_fds_limit", a6);
        }
        if ((a7 - 1) <= 0xFFFFFFFD) {
          xpc_dictionary_set_mach_send();
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

void SPReportPortExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportPortExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportPortExhaustion_cold_1();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE) {
        unint64_t v15 = (const char *)&unk_21569EB8A;
      }
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl(&dword_215699000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sport exhaustion for %{public}s [%d] at %lld ports", (uint8_t *)&v20, 0x26u);
    }
    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 12);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_ports", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_ports_limit", a6);
        }
        if ((a7 - 1) <= 0xFFFFFFFD) {
          xpc_dictionary_set_mach_send();
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

void SPReportKQWorkLoopExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportKQWorkLoopExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportKQWorkLoopExhaustion_cold_1();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE) {
        unint64_t v15 = (const char *)&unk_21569EB8A;
      }
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl(&dword_215699000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}skqworkloop exhaustion for %{public}s [%d] at %lld kqworkloops", (uint8_t *)&v20, 0x26u);
    }
    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 14);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_kqworkloops", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_kqworkloops_limit", a6);
        }
        if ((a7 - 1) <= 0xFFFFFFFD) {
          xpc_dictionary_set_mach_send();
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

void SPReportWorkflowResponsivenessDelay(const char *a1)
{
  if (a1)
  {
    uint64_t v2 = spindump_connection();
    if (v2)
    {
      int v3 = (_xpc_connection_s *)v2;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        BOOL v5 = empty;
        xpc_dictionary_set_int64(empty, "message", 13);
        xpc_dictionary_set_string(v5, "filename", a1);
        xpc_connection_send_message(v3, v5);
        xpc_release(v5);
      }
      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
        SPReportWorkflowResponsivenessDelay_cold_2();
      }
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportWorkflowResponsivenessDelay_cold_1();
    }
  }
}

uint64_t __SPHIDResponseDelayThresholdMachAbs_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HIDResponseDelayReportThresholdMs", (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if (AppIntegerValue < 0)
    {
      uint64_t result = -1;
      goto LABEL_7;
    }
    uint64_t v1 = 1000000 * AppIntegerValue;
  }
  else
  {
    uint64_t v1 = 500000000;
  }
  uint64_t result = NanoToMach(v1);
LABEL_7:
  SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs = result;
  return result;
}

uint64_t NanoToMach(uint64_t a1)
{
  if (MachTimebase_onceToken != -1) {
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_35);
  }
  if (MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if (MachTimebase_info) {
      BOOL v2 = HIDWORD(MachTimebase_info) == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2) {
      return 0;
    }
    else {
      return __udivti3();
    }
  }
  return a1;
}

uint64_t __MachTimebase_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&MachTimebase_info);
}

uint64_t MachToNano(uint64_t a1)
{
  if (MachTimebase_onceToken != -1) {
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_35);
  }
  if (MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if (MachTimebase_info) {
      BOOL v2 = HIDWORD(MachTimebase_info) == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2) {
      return 0;
    }
    else {
      return __udivti3();
    }
  }
  return a1;
}

os_log_t __libspindump_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libspindump", "logging");
  libspindump_log_logt = (uint64_t)result;
  if (!result) {
    __libspindump_log_block_invoke_cold_1();
  }
  return result;
}

uint64_t __SPAddToHIDTelemetry_block_invoke(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  do
  {
    __swp(gHIDEventCountBuckets + v1 * 8, (unsigned int *)&gHIDEventCountBuckets[v1]);
    *(void *)((char *)&v9 + v1 * 8) = &gHIDEventCountBuckets[v1];
    __swp(a1, (unsigned int *)&gHIDEventDurationMachAbsBuckets[v1]);
    a1 = MachToNano(a1);
    *(void *)((char *)&v13 + v1 * 8 + 8) = a1;
    ++v1;
  }
  while (v1 != 9);
  uint64_t v2 = 0;
  __swp(gHIDEventCountBuckets, (unsigned int *)&gActionCount);
  uint64_t v3 = v13;
  uint64_t v4 = *((void *)&v17 + 1);
  do
  {
    BOOL v5 = (char *)&v9 + 8 * v2;
    v3 += *((void *)v5 + 7);
    *((void *)v5 + 7) = v3;
    v4 += *((void *)v5 + 16);
    *((void *)v5 + 16) = v4;
    unint64_t v6 = v2 + 8;
    --v2;
  }
  while (v6 > 1);
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
  }
  int v7 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134222592;
    *(void *)&uint8_t buf[4] = gHIDEventCountBuckets;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    double v19 = (double)*((unint64_t *)&v13 + 1) / 1000000000.0;
    *(_WORD *)int v20 = 2048;
    *(void *)&v20[2] = *((void *)&v9 + 1);
    *(_WORD *)&v20[10] = 2048;
    *(double *)&v20[12] = (double)(unint64_t)v14 / 1000000000.0;
    *(_WORD *)&v20[20] = 2048;
    *(void *)&v20[22] = v10;
    *(_WORD *)&v20[30] = 2048;
    *(double *)&v20[32] = (double)*((unint64_t *)&v14 + 1) / 1000000000.0;
    *(_WORD *)uint64_t v21 = 2048;
    *(void *)&v21[2] = *((void *)&v10 + 1);
    *(_WORD *)&v21[10] = 2048;
    *(double *)&v21[12] = (double)(unint64_t)v15 / 1000000000.0;
    *(_WORD *)&v21[20] = 2048;
    *(void *)&v21[22] = v11;
    *(_WORD *)&v21[30] = 2048;
    *(double *)__int16 v22 = (double)*((unint64_t *)&v15 + 1) / 1000000000.0;
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = *((void *)&v11 + 1);
    *(_WORD *)&v22[18] = 2048;
    *(double *)&v22[20] = (double)(unint64_t)v16 / 1000000000.0;
    *(_WORD *)&v22[28] = 2048;
    *(void *)&v22[30] = v12;
    *(_WORD *)&v22[38] = 2048;
    *(double *)&v22[40] = (double)*((unint64_t *)&v16 + 1) / 1000000000.0;
    *(_WORD *)int v23 = 2048;
    *(void *)&v23[2] = *((void *)&v12 + 1);
    *(_WORD *)&v23[10] = 2048;
    *(double *)&v23[12] = (double)(unint64_t)v17 / 1000000000.0;
    *(_WORD *)&v23[20] = 2048;
    *(void *)&v23[22] = v13;
    *(_WORD *)&v23[30] = 2048;
    double v24 = (double)*((unint64_t *)&v17 + 1) / 1000000000.0;
    _os_log_debug_impl(&dword_215699000, v7, OS_LOG_TYPE_DEBUG, "HID statistics actions:%llu responseBuckets:%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs)", buf, 0xC0u);
  }
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(_OWORD *)&v22[16] = v14;
  *(_OWORD *)&v22[32] = v15;
  *(_OWORD *)int v23 = v16;
  *(_OWORD *)&v23[16] = v17;
  *(_OWORD *)&v20[24] = v10;
  *(_OWORD *)uint64_t v21 = v11;
  *(_OWORD *)&v21[16] = v12;
  *(_OWORD *)__int16 v22 = v13;
  *(void *)&buf[16] = __SPSubmitHIDTelemetry_block_invoke;
  double v19 = COERCE_DOUBLE(&__block_descriptor_184_e30___NSObject_OS_xpc_object__8__0l);
  *(void *)int v20 = gHIDEventCountBuckets;
  *(_OWORD *)&v20[8] = v9;
  uint64_t result = analytics_send_event_lazy();
  SPAddToHIDTelemetry_telemetryPending = 0;
  return result;
}

xpc_object_t __SPSubmitHIDTelemetry_block_invoke(uint64_t *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = (void *)[v2 bundleIdentifier];
  uint64_t v4 = (void *)[v2 infoDictionary];
  BOOL v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];
  unint64_t v6 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x263EFFAA0]];
  uint64_t v7 = [v6 length];
  uint64_t v8 = [v5 length];
  if (v7)
  {
    if (v8) {
      id v9 = (id)[[NSString alloc] initWithFormat:@"%@ (%@)", v6, v5];
    }
    else {
      id v9 = v6;
    }
    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = v5;
LABEL_7:
    long long v10 = v9;
    goto LABEL_8;
  }
  long long v10 = 0;
LABEL_8:
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "action_count", a1[4]);
  xpc_dictionary_set_uint64(empty, "all_count", a1[5]);
  xpc_dictionary_set_uint64(empty, "50ms_count", a1[6]);
  xpc_dictionary_set_uint64(empty, "100ms_count", a1[7]);
  xpc_dictionary_set_uint64(empty, "250ms_count", a1[8]);
  xpc_dictionary_set_uint64(empty, "500ms_count", a1[9]);
  xpc_dictionary_set_uint64(empty, "1s_count", a1[10]);
  xpc_dictionary_set_uint64(empty, "2s_count", a1[11]);
  xpc_dictionary_set_uint64(empty, "5s_count", a1[12]);
  xpc_dictionary_set_uint64(empty, "10s_count", a1[13]);
  xpc_dictionary_set_uint64(empty, "all_ns", a1[14]);
  xpc_dictionary_set_uint64(empty, "50ms_ns", a1[15]);
  xpc_dictionary_set_uint64(empty, "100ms_ns", a1[16]);
  xpc_dictionary_set_uint64(empty, "250ms_ns", a1[17]);
  xpc_dictionary_set_uint64(empty, "500ms_ns", a1[18]);
  xpc_dictionary_set_uint64(empty, "1s_ns", a1[19]);
  xpc_dictionary_set_uint64(empty, "2s_ns", a1[20]);
  xpc_dictionary_set_uint64(empty, "5s_ns", a1[21]);
  xpc_dictionary_set_uint64(empty, "10s_ns", a1[22]);
  long long v12 = (const char *)[v3 UTF8String];
  if (v12) {
    xpc_dictionary_set_string(empty, "bundle_id", v12);
  }
  long long v13 = (const char *)[v10 UTF8String];
  if (v13) {
    xpc_dictionary_set_string(empty, "bundle_version", v13);
  }

  return empty;
}

void __spindump_connection_block_invoke()
{
  mach_service = xpc_connection_create_mach_service("com.apple.spindump", 0, 2uLL);
  spindump_connection_connection = (uint64_t)mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_73);
    uint64_t v1 = (_xpc_connection_s *)spindump_connection_connection;
    xpc_connection_resume(v1);
  }
}

void __spindump_connection_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x2166C0FF0](a2) == MEMORY[0x263EF8720]
    && a2 != (void *)MEMORY[0x263EF86A0]
    && a2 != (void *)MEMORY[0x263EF86C0])
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    BOOL v5 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      __spindump_connection_block_invoke_2_cold_1(a2, v5);
    }
  }
}

void __procname_btd_block_invoke()
{
  getpid();
  int v0 = sandbox_check();
  if (v0 == -1)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_37);
    }
    uint64_t v2 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      __procname_btd_block_invoke_cold_1(v2);
    }
    goto LABEL_9;
  }
  if (!v0)
  {
LABEL_9:
    char v1 = 0;
    goto LABEL_10;
  }
  if (v0 != 1) {
    return;
  }
  char v1 = 1;
LABEL_10:
  procname_btd_avoid_proc_name = v1;
}

void SPExpectedHIDResponseDelayUntil_cold_1(uint64_t a1)
{
  MachToNano(gExpectedHIDResponseDelayEndMachAbs - a1);
  OUTLINED_FUNCTION_4(&dword_215699000, v1, v2, "Expected HID response delay before existing expected HID response delay by %.2fs (%llu vs %llu), not updating", v3, v4, v5, v6, 0);
}

void SPExpectedHIDResponseDelayUntil_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_215699000, v0, OS_LOG_TYPE_DEBUG, "Expected HID response delay for the next %.2fs (%llu)", v1, 0x16u);
}

void SPExpectedHIDResponseDelayUntil_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = v0;
  uint64_t v4 = 0x4000000000000000;
  _os_log_fault_impl(&dword_215699000, v1, OS_LOG_TYPE_FAULT, "Expected HID response delay for the next %.2fs (%llu is more than %.2fs in the future", v2, 0x20u);
}

void SPExpectedHIDResponseDelayUntil_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_215699000, v0, OS_LOG_TYPE_DEBUG, "Expected HID response delay until %.2fs ago (%llu)", v1, 0x16u);
}

void SPPauseMonitoringHIDResponsiveness_cold_1(char **a1)
{
  *a1 = 0;
  asprintf(a1, "No reason string provided");
  qword_26787F4B8 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_1(char **a1)
{
  *a1 = 0;
  asprintf(a1, "No receipt provided");
  qword_26787F4B8 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1 + 1;
  uint64_t v5 = MachToNano(a2 - *a1);
  int v6 = 136446466;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  double v9 = (double)(unint64_t)v5 / 1000000000.0;
  _os_log_debug_impl(&dword_215699000, a3, OS_LOG_TYPE_DEBUG, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs", (uint8_t *)&v6, 0x16u);
}

void SPResumeMonitoringHIDResponsiveness_cold_3(void *a1, uint64_t a2)
{
  MachToNano(a2 - *a1);
  MachToNano(a2 - gEarliestPauseMachAbs);
  OUTLINED_FUNCTION_4(&dword_215699000, v3, v4, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs, was paused for %.2fs total", v5, v6, v7, v8, 2u);
}

void SPResumeMonitoringHIDResponsiveness_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1 + 1;
  uint64_t v5 = MachToNano(a2 - *a1);
  int v6 = 136446722;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  double v9 = (double)(unint64_t)v5 / 1000000000.0;
  __int16 v10 = 1024;
  int v11 = gNumPauseReceipts;
  _os_log_debug_impl(&dword_215699000, a3, OS_LOG_TYPE_DEBUG, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs, still waiting on %d others", (uint8_t *)&v6, 0x1Cu);
}

void SPResumeMonitoringHIDResponsiveness_cold_5(char **a1)
{
  *a1 = 0;
  asprintf(a1, "Receipt passed to SPResumeMonitoringHIDResponsiveness does not match any live receipt returned by SPPauseMonitoringHIDResponsiveness");
  qword_26787F4B8 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215699000, v0, v1, "Unable to allocate xpc dictionary", v2, v3, v4, v5, v6);
}

void SPCheckHIDResponseTime2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215699000, v0, v1, "Unable to get executable path for HID response delay: 0 return with 0-length buffer", v2, v3, v4, v5, v6);
}

void SPCheckHIDResponseTime2_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_215699000, a2, OS_LOG_TYPE_ERROR, "Unable to get executable path for HID response delay with buffer of size %#x", (uint8_t *)v3, 8u);
}

void SPCheckHIDResponseTime2_cold_4(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_215699000, a2, OS_LOG_TYPE_ERROR, "Unable to get executable path for HID response delay, requires buffer of size %#x", (uint8_t *)v3, 8u);
}

void SPCheckHIDResponseTime2_cold_5(char **a1, int a2)
{
  *a1 = 0;
  asprintf(a1, "No matching SPResumeMonitoringHIDResponsiveness call for SPPauseMonitoringHIDResponsiveness before responding to a HID event. Monitoring is paused by \"%s\" (and %d others)", (const char *)(*(void *)gPauseReceipts + 8), a2 - 1);
  qword_26787F4B8 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime2_cold_6(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_215699000, log, OS_LOG_TYPE_FAULT, "Invalid timestamps for HID response delay: %llu to %llu", (uint8_t *)&v3, 0x16u);
}

void spindump_connection_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215699000, v0, v1, "No connection to spindump", v2, v3, v4, v5, v6);
}

void SPReportCPUUsageResource_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting cpu usage for pid 0", v2, v3, v4, v5, v6);
}

void SPReportDiskWritesResource_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting disk writes for pid 0", v2, v3, v4, v5, v6);
}

void _SPReportFileDescriptorExhaustion_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting file descriptor exhaustion for pid 0", v2, v3, v4, v5, v6);
}

void _SPReportPortExhaustion_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting port exhaustion for pid 0", v2, v3, v4, v5, v6);
}

void _SPReportKQWorkLoopExhaustion_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting kqworkloop exhaustion for pid 0", v2, v3, v4, v5, v6);
}

void SPReportWorkflowResponsivenessDelay_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_215699000, v0, v1, "Reporting workflow responsiveness delay with empty tailspin path", v2, v3, v4, v5, v6);
}

void SPReportWorkflowResponsivenessDelay_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215699000, v0, v1, "Unable to connect to spindump, returning", v2, v3, v4, v5, v6);
}

void __libspindump_log_block_invoke_cold_1()
{
}

void __spindump_connection_block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v4 = 136446210;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_215699000, a2, OS_LOG_TYPE_ERROR, "Got xpc error message: %{public}s\n", (uint8_t *)&v4, 0xCu);
}

void __procname_btd_block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_215699000, a1, OS_LOG_TYPE_ERROR, "Unable to check for proc_name availability: %{errno}d", (uint8_t *)v3, 8u);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x270ED7D10](buf, bufsize);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A70]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}