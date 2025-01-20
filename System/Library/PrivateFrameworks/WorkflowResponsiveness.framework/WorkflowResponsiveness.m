void WRRangesSortAndCoalesce(unsigned int *a1)
{
  size_t v1;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;

  v1 = *a1;
  if (v1)
  {
    mergesort_b(*((void **)a1 + 1), v1, 0x10uLL, &__block_literal_global_544);
    v3 = *a1;
    if (v3 >= 2)
    {
      v4 = 0;
      v5 = 0;
      for (i = 1; i < v3; ++i)
      {
        v7 = *((void *)a1 + 1);
        v8 = *(void *)(v7 + v4 + 16);
        v9 = *(void *)(v7 + v4 + 24);
        if (v9 > v8)
        {
          v10 = v7 + 16 * v5;
          v13 = *(void *)(v10 + 8);
          v12 = (unint64_t *)(v10 + 8);
          v11 = v13;
          if (v13 >= v8)
          {
            if (v11 < v9) {
              *v12 = v9;
            }
            *(void *)(v7 + v4 + 24) = v8;
          }
          else
          {
            *(_OWORD *)(v7 + 16 * ++v5) = *(_OWORD *)(v7 + v4 + 16);
            v3 = *a1;
          }
        }
        v4 += 16;
      }
      if (v5) {
        goto LABEL_14;
      }
    }
    v14 = (void *)*((void *)a1 + 1);
    if (v14[1] > *v14)
    {
      v5 = 0;
LABEL_14:
      *a1 = v5 + 1;
      return;
    }
    *a1 = 0;
    free(v14);
    *((void *)a1 + 1) = 0;
  }
}

void sub_261967F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL PlaceholderNameMatches(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "rangeOfString:options:range:", v4, 8, 5, objc_msgSend(v3, "length") - 5);
  uint64_t v7 = v6;

  BOOL v8 = v5 == 5 && v7 == [v3 length] - 5;
  return v8;
}

void sub_2619714AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_261973E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_261974574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WRProcessIsBeingDebugged(int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  if (proc_pidinfo(a1, 13, 1uLL, v5, 64))
  {
    if ((v6 & 2) != 0) {
      return 1;
    }
  }
  else
  {
    int v3 = *__error();
    id v4 = _wrlog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      WRProcessIsBeingDebugged_cold_1(a1, v4);
    }

    *__error() = v3;
  }
  return 0;
}

void sub_261978920(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

id WRSanitizeForCA(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (WRSanitizeForCA_onceToken != -1) {
      dispatch_once(&WRSanitizeForCA_onceToken, &__block_literal_global_371);
    }
    v2 = [v1 componentsSeparatedByCharactersInSet:WRSanitizeForCA_removedCharacters];
    int v3 = [v2 componentsJoinedByString:&stru_270D96DE8];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

void __WRSanitizeForCA_block_invoke()
{
  id v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  id v1 = (void *)WRSanitizeForCA_removedCharacters;
  WRSanitizeForCA_removedCharacters = v0;
}

uint64_t __WRStringForDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = (void *)WRStringForDate_dateFormatter;
  WRStringForDate_dateFormatter = (uint64_t)v0;

  id v2 = (void *)WRStringForDate_dateFormatter;

  return [v2 setDateFormat:@"yyyy-MM-dd-HHmmss.SSS"];
}

uint64_t __WRMachTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&WRMachTimebaseForLiveMachine_timebase);
}

uint64_t __WRRangesSortAndCoalesce_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

void OUTLINED_FUNCTION_30(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_31(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_32(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_33(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

id _wrlog()
{
  if (_wrlog_onceToken != -1) {
    dispatch_once(&_wrlog_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)_wrlog_log;

  return v0;
}

uint64_t ___wrlog_block_invoke()
{
  _wrlog_log = (uint64_t)os_log_create("com.apple.workflow_responsiveness", "wrlogging");

  return MEMORY[0x270F9A758]();
}

id DictGetType(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  long long v7 = [a1 objectForKeyedSubscript:v6];
  if (!v7) {
    goto LABEL_6;
  }
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_7;
  }
  if (a4)
  {
    object_getClassName(v7);
    WRMakeError(6, @"Key %@: unexpected value type %s", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v8 = 0;
  }
LABEL_7:

  return v8;
}

id DictGetNumber(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = objc_opt_class();
  id v8 = DictGetType(v6, v5, v7, a3);

  return v8;
}

id DictGetString(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = objc_opt_class();
  id v8 = DictGetType(v6, v5, v7, a3);

  return v8;
}

id DictGetArray(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = objc_opt_class();
  id v8 = DictGetType(v6, v5, v7, a3);

  return v8;
}

id DictGetDict(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = objc_opt_class();
  id v8 = DictGetType(v6, v5, v7, a3);

  return v8;
}

uint64_t ArrayDoAllClassesMatch(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = a2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            object_getClassName(v12);
            WRMakeError(6, @"Key %@: unexpected value type %s in array", v14, v15, v16, v17, v18, v19, (uint64_t)v6);
            uint64_t v13 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v13 = 0;
          }
          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_13:

  return v13;
}

id DictGetArrayOfClass(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = DictGetArray(a1, v7, a4);
  if (v8 && ArrayDoAllClassesMatch(v7, v8, a3, a4)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

uint64_t WRIsAppleInternal()
{
  if (WRIsAppleInternal_onceToken != -1) {
    dispatch_once(&WRIsAppleInternal_onceToken, &__block_literal_global_11);
  }
  return WRIsAppleInternal_appleInternal;
}

uint64_t __WRIsAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  WRIsAppleInternal_appleInternal = result;
  return result;
}

uint64_t WRIsSeedBuild()
{
  return 0;
}

id WRCreateOSTransaction(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v4 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x200uLL, __format, va);
  id v1 = (void *)os_transaction_create();

  return v1;
}

id WRMakeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  uint64_t v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  id v13 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x263F07F80], 0);
  uint64_t v15 = (void *)[v13 initWithDomain:@"WorkflowResponsivenessError" code:a1 userInfo:v14];

  return v15;
}

id WRMakeErrorWithUnderlyingError(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = (objc_class *)NSString;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  id v15 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v16 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x263F07F80], v13, *MEMORY[0x263F08608], 0);

  uint64_t v17 = (void *)[v15 initWithDomain:@"WorkflowResponsivenessError" code:a1 userInfo:v16];

  return v17;
}

id AllWorkflowKeys()
{
  if (AllWorkflowKeys_onceToken != -1) {
    dispatch_once(&AllWorkflowKeys_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)AllWorkflowKeys_allWorkflowKeys;

  return v0;
}

uint64_t __AllWorkflowKeys_block_invoke()
{
  uint64_t v0 = NSDictionary;
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  AllWorkflowKeys_allWorkflowKeys = objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", v1, @"name", v2, @"maximum_duration", v3, @"contextual_telemetry", v4, @"signposts", objc_opt_class(), @"diagnostics", 0);

  return MEMORY[0x270F9A758]();
}

id AllSignpostKeys()
{
  if (AllSignpostKeys_onceToken != -1) {
    dispatch_once(&AllSignpostKeys_onceToken, &__block_literal_global_97);
  }
  uint64_t v0 = (void *)AllSignpostKeys_allSignpostKeys;

  return v0;
}

uint64_t __AllSignpostKeys_block_invoke()
{
  id v15 = NSDictionary;
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v14, @"start", v13, @"end", v12, @"end_group", v11, @"subsystem", v10, @"category", v0, @"name", v1, @"event_identifier_field_name", v2, @"individuation_field_name", v3,
    @"environment_field_names",
    v4,
    @"network_bound",
    v5,
    @"diagnostics",
    v6,
    @"disabled",
    v7,
    @"overall_interval",
    v8,
    @"diagnostics_threshold_seconds",
    objc_opt_class(),
    @"diagnostics_threshold_count",
  AllSignpostKeys_allSignpostKeys = 0);

  return MEMORY[0x270F9A758]();
}

id AllDiagnosticKeys()
{
  if (AllDiagnosticKeys_onceToken != -1) {
    dispatch_once(&AllDiagnosticKeys_onceToken, &__block_literal_global_99);
  }
  uint64_t v0 = (void *)AllDiagnosticKeys_allDiagnosticKeys;

  return v0;
}

uint64_t __AllDiagnosticKeys_block_invoke()
{
  uint64_t v16 = NSDictionary;
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v15, @"name", v14, @"trigger_threshold_duration_sum", v13, @"trigger_threshold_duration_union", v12, @"trigger_threshold_duration_single", v11, @"trigger_threshold_count", v10, @"trigger_event_timeout", v0, @"gather_tailspin", v1, @"option_tailspin_includes_oslogs", v2,
    @"report_spindump_this_thread",
    v3,
    @"report_spindump_thread_name",
    v4,
    @"report_spindump_main_thread",
    v5,
    @"report_spindump_this_dispatchqueue",
    v6,
    @"report_spindump_dispatchqueue_label",
    v7,
    @"option_report_other_signpost",
    v8,
    @"option_report_other_processes",
    objc_opt_class(),
    @"option_report_omit_network_bound_intervals",
  AllDiagnosticKeys_allDiagnosticKeys = 0);

  return MEMORY[0x270F9A758]();
}

id WRCheckForBadWorkflowDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AllWorkflowKeys();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadWorkflowDict_block_invoke;
  v6[3] = &unk_2655893E8;
  id v3 = v2;
  id v7 = v3;
  uint64_t v8 = &v9;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_26197B5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __WRCheckForBadWorkflowDict_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v9)
  {
    uint64_t v22 = WRMakeError(1, @"Unknown workflow key \"%@\"", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    *a4 = 1;
    goto LABEL_47;
  }
  uint64_t v16 = (objc_class *)v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    object_getClassName(v8);
    v85 = NSStringFromClass(v16);
    uint64_t v31 = WRMakeError(6, @"Wrong value type for workflow key \"%@\": %s, expected %@", v25, v26, v27, v28, v29, v30, (uint64_t)v7);
    uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

LABEL_46:
    *a4 = 1;
    goto LABEL_47;
  }
  if (v16 == (objc_class *)objc_opt_class())
  {
    if ([v7 isEqualToString:@"signposts"])
    {
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v34 = v8;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v90 objects:v95 count:16];
      if (!v35)
      {
LABEL_38:

        goto LABEL_47;
      }
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v91;
LABEL_12:
      uint64_t v38 = 0;
      while (1)
      {
        if (*(void *)v91 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v90 + 1) + 8 * v38);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          WRCheckForBadSignpostDict(v39);
        }
        else
        {
          ClassName = object_getClassName(v39);
          WRMakeError(6, @"Wrong type for workflow signpost dict: %s", v42, v43, v44, v45, v46, v47, (uint64_t)ClassName);
        uint64_t v40 = };
        uint64_t v48 = *(void *)(*(void *)(a1 + 40) + 8);
        v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = v40;

        if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
          break;
        }
        if (v36 == ++v38)
        {
          uint64_t v36 = [v34 countByEnumeratingWithState:&v90 objects:v95 count:16];
          if (v36) {
            goto LABEL_12;
          }
          goto LABEL_38;
        }
      }
    }
    else
    {
      if (![v7 isEqualToString:@"diagnostics"])
      {
        int v71 = *__error();
        v72 = _wrlog();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
          __WRCheckForBadWorkflowDict_block_invoke_cold_1((uint64_t)v7, v72);
        }

        *__error() = v71;
        uint64_t v79 = WRMakeError(6, @"unhandled workflow array key %@", v73, v74, v75, v76, v77, v78, (uint64_t)v7);
        uint64_t v80 = *(void *)(*(void *)(a1 + 40) + 8);
        v81 = *(void **)(v80 + 40);
        *(void *)(v80 + 40) = v79;

        goto LABEL_46;
      }
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v34 = v8;
      uint64_t v50 = [v34 countByEnumeratingWithState:&v86 objects:v94 count:16];
      if (!v50) {
        goto LABEL_38;
      }
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v87;
LABEL_27:
      uint64_t v53 = 0;
      while (1)
      {
        if (*(void *)v87 != v52) {
          objc_enumerationMutation(v34);
        }
        v54 = *(void **)(*((void *)&v86 + 1) + 8 * v53);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          WRCheckForBadDiagnosticDict(v54);
        }
        else
        {
          v56 = object_getClassName(v54);
          WRMakeError(6, @"Wrong type for workflow diagnostic dict: %s", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
        uint64_t v55 = };
        uint64_t v63 = *(void *)(*(void *)(a1 + 40) + 8);
        v64 = *(void **)(v63 + 40);
        *(void *)(v63 + 40) = v55;

        if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
          break;
        }
        if (v51 == ++v53)
        {
          uint64_t v51 = [v34 countByEnumeratingWithState:&v86 objects:v94 count:16];
          if (v51) {
            goto LABEL_27;
          }
          goto LABEL_38;
        }
      }
    }
    *a4 = 1;
    goto LABEL_38;
  }
  id v17 = v7;
  id v18 = v8;
  if ([v17 isEqualToString:@"name"])
  {
    uint64_t v19 = v18;
    char v20 = 4;
LABEL_6:
    uint64_t v21 = WRValidateString(v19, v20, v17);
    goto LABEL_45;
  }
  if ([v17 isEqualToString:@"maximum_duration"])
  {
    uint64_t v21 = WRValidateDouble(v18, v17, 3600.0);
  }
  else
  {
    if ([v17 isEqualToString:@"contextual_telemetry"])
    {
      uint64_t v19 = v18;
      char v20 = 0;
      goto LABEL_6;
    }
    uint64_t v21 = WRMakeError(1, @"Unknown workflow leaf key %@", v65, v66, v67, v68, v69, v70, (uint64_t)v17);
  }
LABEL_45:
  uint64_t v82 = v21;

  uint64_t v83 = *(void *)(*(void *)(a1 + 40) + 8);
  v84 = *(void **)(v83 + 40);
  *(void *)(v83 + 40) = v82;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_46;
  }
LABEL_47:
}

id WRCheckForBadSignpostDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AllSignpostKeys();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadSignpostDict_block_invoke;
  v6[3] = &unk_2655893E8;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_26197BBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WRCheckForBadDiagnosticDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AllDiagnosticKeys();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadDiagnosticDict_block_invoke;
  v6[3] = &unk_2655893E8;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_26197BD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __WRCheckForBadSignpostDict_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (v9)
  {
    uint64_t v16 = (objc_class *)v9;
    if (objc_opt_isKindOfClass())
    {
      if (v16 != (objc_class *)objc_opt_class())
      {
        uint64_t v17 = WRValidateSignpostDictLeafEntry(v7, v8);
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      if ([v7 isEqualToString:@"diagnostics"])
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v32 = v8;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v79 objects:v84 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v80;
LABEL_13:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v80 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void **)(*((void *)&v79 + 1) + 8 * v36);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              WRCheckForBadDiagnosticDict(v37);
            }
            else
            {
              ClassName = object_getClassName(v37);
              WRMakeError(6, @"Wrong type for signpost diagnostic dict: %s", v40, v41, v42, v43, v44, v45, (uint64_t)ClassName);
            uint64_t v38 = };
            uint64_t v46 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v47 = *(void **)(v46 + 40);
            *(void *)(v46 + 40) = v38;

            if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
              break;
            }
            if (v34 == ++v36)
            {
              uint64_t v34 = [v32 countByEnumeratingWithState:&v79 objects:v84 count:16];
              if (v34) {
                goto LABEL_13;
              }
              goto LABEL_37;
            }
          }
LABEL_36:
          *a4 = 1;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      if ([v7 isEqualToString:@"environment_field_names"])
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v32 = v8;
        uint64_t v48 = [v32 countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v76;
LABEL_26:
          uint64_t v51 = 0;
          while (1)
          {
            if (*(void *)v76 != v50) {
              objc_enumerationMutation(v32);
            }
            uint64_t v52 = *(void **)(*((void *)&v75 + 1) + 8 * v51);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              WRValidateSignpostDictLeafEntry(v7, v52);
            }
            else
            {
              v54 = object_getClassName(v52);
              WRMakeError(6, @"Wrong type for signpost environmental field name: %s", v55, v56, v57, v58, v59, v60, (uint64_t)v54);
            uint64_t v53 = };
            uint64_t v61 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v62 = *(void **)(v61 + 40);
            *(void *)(v61 + 40) = v53;

            if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
              goto LABEL_36;
            }
            if (v49 == ++v51)
            {
              uint64_t v49 = [v32 countByEnumeratingWithState:&v75 objects:v83 count:16];
              if (v49) {
                goto LABEL_26;
              }
              break;
            }
          }
        }
LABEL_37:

        goto LABEL_9;
      }
      int v63 = *__error();
      v64 = _wrlog();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
        __WRCheckForBadSignpostDict_block_invoke_cold_1((uint64_t)v7, v64);
      }

      *__error() = v63;
      uint64_t v71 = WRMakeError(6, @"unhandled signpost array key %@", v65, v66, v67, v68, v69, v70, (uint64_t)v7);
      uint64_t v72 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v73 = *(void **)(v72 + 40);
      *(void *)(v72 + 40) = v71;
    }
    else
    {
      object_getClassName(v8);
      uint64_t v74 = NSStringFromClass(v16);
      uint64_t v29 = WRMakeError(6, @"Wrong value type for signpost key \"%@\": %s, expected %@", v23, v24, v25, v26, v27, v28, (uint64_t)v7);
      uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
LABEL_8:
    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v20 = WRMakeError(1, @"Unknown signpost key \"%@\"", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  *a4 = 1;
LABEL_9:
}

id WRValidateSignpostDictLeafEntry(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (([v3 isEqualToString:@"start"] & 1) != 0
    || ([v3 isEqualToString:@"end"] & 1) != 0
    || ([v3 isEqualToString:@"network_bound"] & 1) != 0
    || [v3 isEqualToString:@"disabled"])
  {
    uint64_t v5 = WRValidateBool(v4, v3);
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"name"])
  {
    id v8 = v4;
    char v9 = 20;
LABEL_19:
    uint64_t v5 = WRValidateString(v8, v9, v3);
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"end_group"])
  {
    id v8 = v4;
    char v9 = 4;
    goto LABEL_19;
  }
  if (([v3 isEqualToString:@"subsystem"] & 1) != 0
    || ([v3 isEqualToString:@"category"] & 1) != 0
    || ([v3 isEqualToString:@"event_identifier_field_name"] & 1) != 0
    || ([v3 isEqualToString:@"individuation_field_name"] & 1) != 0
    || [v3 isEqualToString:@"environment_field_names"])
  {
    id v8 = v4;
    char v9 = 1;
    goto LABEL_19;
  }
  uint64_t v5 = WRMakeError(1, @"Unknown signpost leaf key %@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
LABEL_6:
  uint64_t v6 = (void *)v5;

  return v6;
}

void __WRCheckForBadDiagnosticDict_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v51 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v51];
  if (!v8)
  {
    uint64_t v22 = WRMakeError(1, @"Unknown diagnostic key \"%@\"", v9, v10, v11, v12, v13, v14, (uint64_t)v51);
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v15 = (objc_class *)v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    object_getClassName(v7);
    uint64_t v24 = NSStringFromClass(v15);
    uint64_t v31 = WRMakeError(6, @"Wrong value type for diagnostic key \"%@\": %s, expected %@", v25, v26, v27, v28, v29, v30, (uint64_t)v51);
    uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    goto LABEL_12;
  }
  id v16 = v51;
  id v17 = v7;
  if (([v16 isEqualToString:@"trigger_threshold_duration_sum"] & 1) != 0
    || ([v16 isEqualToString:@"trigger_threshold_duration_union"] & 1) != 0
    || [v16 isEqualToString:@"trigger_threshold_duration_single"])
  {
    uint64_t v18 = WRValidateDouble(v17, v16, 0.0);
    goto LABEL_7;
  }
  if (([v16 isEqualToString:@"trigger_event_timeout"] & 1) != 0
    || ([v16 isEqualToString:@"gather_tailspin"] & 1) != 0
    || ([v16 isEqualToString:@"option_tailspin_includes_oslogs"] & 1) != 0
    || ([v16 isEqualToString:@"report_spindump_this_thread"] & 1) != 0
    || ([v16 isEqualToString:@"report_spindump_main_thread"] & 1) != 0
    || ([v16 isEqualToString:@"report_spindump_this_dispatchqueue"] & 1) != 0
    || [v16 isEqualToString:@"option_report_omit_network_bound_intervals"])
  {
    uint64_t v18 = WRValidateBool(v17, v16);
    goto LABEL_7;
  }
  if (![v16 isEqualToString:@"trigger_threshold_count"])
  {
    if (([v16 isEqualToString:@"option_report_other_signpost"] & 1) != 0
      || [v16 isEqualToString:@"name"])
    {
      uint64_t v42 = v17;
      char v43 = 20;
    }
    else
    {
      if (([v16 isEqualToString:@"report_spindump_thread_name"] & 1) == 0
        && ([v16 isEqualToString:@"report_spindump_dispatchqueue_label"] & 1) == 0
        && ![v16 isEqualToString:@"option_report_other_processes"])
      {
        uint64_t v18 = WRMakeError(1, @"Unknown diagnostic key %@", v44, v45, v46, v47, v48, v49, (uint64_t)v16);
        goto LABEL_7;
      }
      uint64_t v42 = v17;
      char v43 = 1;
    }
    uint64_t v18 = WRValidateString(v42, v43, v16);
LABEL_7:
    uint64_t v19 = v18;
    goto LABEL_8;
  }
  id v34 = v17;
  id v35 = v16;
  uint64_t v50 = v34;
  if ([v34 longLongValue] < 0)
  {
    uint64_t v19 = WRMakeError(8, @"%@ is negative (%lld)", v36, v37, v38, v39, v40, v41, (uint64_t)v35);
  }
  else
  {
    [v34 unsignedLongLongValue];
    uint64_t v19 = 0;
  }

LABEL_8:
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
LABEL_13:
  }
    *a4 = 1;
}

id WRValidateString(void *a1, char a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
    [v7 addCharactersInString:@"_"];
    if ((a2 & 2) != 0)
    {
      uint64_t v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      [v7 formUnionWithCharacterSet:v9];

      if ((a2 & 8) == 0)
      {
LABEL_6:
        if ((a2 & 0x10) != 0) {
          [v7 addCharactersInString:@"."];
        }
        goto LABEL_11;
      }
    }
    else
    {
      if ((a2 & 4) != 0) {
        [v7 addCharactersInString:@" "];
      }
      if ((a2 & 8) == 0) {
        goto LABEL_6;
      }
    }
    uint64_t v10 = [MEMORY[0x263F08708] punctuationCharacterSet];
    [v7 formUnionWithCharacterSet:v10];

LABEL_11:
    [v7 invert];
    uint64_t v11 = [v5 rangeOfCharacterFromSet:v7];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v20 = objc_msgSend(v5, "substringWithRange:", v11, v12);
      uint64_t v8 = WRMakeError(8, @"%@ contains invalid characters (\"%@\": \"%@\")", v13, v14, v15, v16, v17, v18, (uint64_t)v6);
    }
    goto LABEL_15;
  }
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

id WRValidateDouble(void *a1, void *a2, double a3)
{
  id v5 = a2;
  [a1 doubleValue];
  if (v12 >= 0.0)
  {
    if (a3 == 0.0 || v12 <= a3)
    {
      uint64_t v14 = 0;
      goto LABEL_10;
    }
    WRMakeError(8, @"%@ is above max value (%f > %f)", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    WRMakeError(8, @"%@ is negative (%f)", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  uint64_t v14 = };
LABEL_10:

  return v14;
}

id WRValidateBool(void *a1, void *a2)
{
  id v3 = a2;
  if ([a1 intValue] < 2)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = WRMakeError(8, @"%@ is not a BOOL (%d)", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }

  return v10;
}

__CFString *WRTaskingKeyForNewWorkflows()
{
  return @"WR.workflows";
}

__CFString *WRTaskingKeyForWorkflowTelemetryEnabled(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)NSString;
    id v2 = a1;
    id v3 = (__CFString *)[[v1 alloc] initWithFormat:@"WR.%@.telemetryEnabled", v2];
  }
  else
  {
    id v3 = @"WR.telemetryEnabled";
  }

  return v3;
}

id WROverrideDiagnosticsEnablementForWorkflow(void *a1, void *a2)
{
  id v3 = WRTaskingKeyForWorkflowDiagnosticsEnabled(a1);
  uint64_t v4 = WRTaskingNumberForKey(v3, a2);

  return v4;
}

id WRTaskingNumberForKey(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = WRTaskingValueForKeyOfType(v3, v4, a2);

  return v5;
}

__CFString *WRTaskingKeyForWorkflowDiagnosticsEnabled(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)NSString;
    id v2 = a1;
    id v3 = (__CFString *)[[v1 alloc] initWithFormat:@"WR.%@.diagnosticsEnabled", v2];
  }
  else
  {
    id v3 = @"WR.diagnosticsEnabled";
  }

  return v3;
}

id WROverrideTelemetryEnablementForWorkflow(void *a1, void *a2)
{
  id v3 = WRTaskingKeyForWorkflowTelemetryEnabled(a1);
  uint64_t v4 = WRTaskingNumberForKey(v3, a2);

  return v4;
}

id WROverrideDiagnosticForWorkflow(void *a1, void *a2, void *a3)
{
  return _WROverrideDiagnostics(a1, 0, a2, a3);
}

id _WROverrideDiagnostics(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v5 = WRTaskingKeyBaseForDiagnostic(a1, a2, a3);
  uint64_t v6 = AllDiagnosticKeys();
  uint64_t v7 = [v6 allKeys];
  uint64_t v8 = _WROverrideDict(v5, v7);

  if (v8)
  {
    uint64_t v9 = WRCheckForBadDiagnosticDict(v8);
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      uint64_t v11 = (void *)[v8 copy];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id WROverrideDiagnosticsEnablement(void *a1)
{
  return WRTaskingNumberForKey(@"WR.diagnosticsEnabled", a1);
}

id WROverrideTelemetryEnablement(void *a1)
{
  return WRTaskingNumberForKey(@"WR.telemetryEnabled", a1);
}

id WROverrideForWorkflow(void *a1, void *a2)
{
  id v3 = WRTaskingKeyBaseForWorkflow(a1);
  uint64_t v4 = AllWorkflowKeys();
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = _WROverrideDict(v3, v5);

  if (v6)
  {
    [v6 setObject:0 forKeyedSubscript:@"signposts"];
    [v6 setObject:0 forKeyedSubscript:@"diagnostics"];
    uint64_t v7 = WRCheckForBadWorkflowDict(v6);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = 0;
      if (a2) {
        *a2 = v7;
      }
    }
    else
    {
      uint64_t v9 = (void *)[v6 copy];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id _WROverrideDict(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v3 stringByAppendingString:v10];
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = WRTaskingValueForKeyOfType(v11, v12, 0);
        if (v13)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          [v7 setObject:v13 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id WRTaskingKeyBaseForWorkflow(void *a1)
{
  id v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithFormat:@"WR.%@.", v2];

  return v3;
}

id WROverrideForSignpost(void *a1, void *a2, void *a3)
{
  id v4 = WRTaskingKeyBaseForSignpost(a1, a2);
  uint64_t v5 = AllSignpostKeys();
  uint64_t v6 = [v5 allKeys];
  id v7 = _WROverrideDict(v4, v6);

  if (v7)
  {
    [v7 setObject:0 forKeyedSubscript:@"diagnostics"];
    uint64_t v8 = WRCheckForBadSignpostDict(v7);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = 0;
      if (a3) {
        *a3 = v8;
      }
    }
    else
    {
      uint64_t v10 = (void *)[v7 copy];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id WRTaskingKeyBaseForSignpost(void *a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = (void *)[[v3 alloc] initWithFormat:@"WR.%@.%@.", v5, v4];

  return v6;
}

id WROverrideNewSignpostsForWorkflow(void *a1, uint64_t *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = v3;
  uint64_t v44 = 0;
  if (a2) {
    *a2 = 0;
  }
  else {
    a2 = &v44;
  }
  id v5 = WRTaskingKeyForNewSignposts(v3);
  uint64_t v6 = WRTaskingStringForKey(v5, a2);

  if (v6)
  {
    id v7 = [v6 componentsSeparatedByString:@","];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = v7;
    uint64_t v39 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v39)
    {
      uint64_t v10 = *(void *)v41;
      uint64_t v37 = v6;
      uint64_t v38 = *(void *)v41;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        uint64_t v13 = WROverrideForSignpost(v4, v12, a2);
        if (!v13) {
          break;
        }
        uint64_t v20 = v13;
        uint64_t v21 = [v13 objectForKeyedSubscript:@"name"];
        uint64_t v22 = v21;
        if (v21)
        {
          if (([v21 isEqualToString:v12] & 1) == 0)
          {
            WRMakeError(7, @"Workflow %@ new signpost %@ has wrong name %@", v23, v24, v25, v26, v27, v28, (uint64_t)v4);
            *a2 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

LABEL_21:
            id v35 = 0;
            uint64_t v6 = v37;
            goto LABEL_22;
          }
        }
        else
        {
          id v29 = v9;
          uint64_t v30 = a2;
          uint64_t v31 = v8;
          uint64_t v32 = v4;
          uint64_t v33 = (void *)[v20 mutableCopy];
          [v33 setObject:v12 forKeyedSubscript:@"name"];
          uint64_t v34 = [v33 copy];

          id v4 = v32;
          uint64_t v8 = v31;
          a2 = v30;
          id v9 = v29;
          uint64_t v10 = v38;
          uint64_t v20 = (void *)v34;
        }
        [v8 addObject:v20];

        if (v39 == ++v11)
        {
          uint64_t v6 = v37;
          uint64_t v39 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v39) {
            goto LABEL_7;
          }
          goto LABEL_17;
        }
      }
      if (!*a2)
      {
        WRMakeError(7, @"No override dictionary for workflow %@ new signpost %@", v14, v15, v16, v17, v18, v19, (uint64_t)v4);
        *a2 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_21;
    }
LABEL_17:

    id v35 = (void *)[v8 copy];
LABEL_22:
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

id WRTaskingStringForKey(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  id v5 = WRTaskingValueForKeyOfType(v3, v4, a2);

  return v5;
}

id WRTaskingKeyForNewSignposts(void *a1)
{
  id v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithFormat:@"WR.%@.%@", v2, @"signposts"];

  return v3;
}

id WROverrideNewWorkflows(uint64_t *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v37 = 0;
  if (a1)
  {
    id v1 = a1;
    *a1 = 0;
  }
  else
  {
    id v1 = &v37;
  }
  id v2 = WRTaskingStringForKey(@"WR.workflows", v1);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 componentsSeparatedByString:@","];
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      id obj = v6;
      uint64_t v31 = v3;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        uint64_t v12 = WROverrideForWorkflow(v11, v1);
        uint64_t v13 = (void *)[v12 mutableCopy];

        if (!v13)
        {
          if (*v1) {
            goto LABEL_26;
          }
          uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithObjectsAndKeys:", v11, @"name", 0);
        }
        uint64_t v14 = [v13 objectForKeyedSubscript:@"name"];
        uint64_t v15 = v14;
        if (v14)
        {
          if (([v14 isEqualToString:v11] & 1) == 0)
          {
            WRMakeError(7, @"Workflow %@ has wrong name %@", v16, v17, v18, v19, v20, v21, (uint64_t)v11);
            *id v1 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
            id v6 = obj;

            id v29 = 0;
            id v3 = v31;
            goto LABEL_27;
          }
        }
        else
        {
          [v13 setObject:v11 forKeyedSubscript:@"name"];
        }
        uint64_t v28 = WROverrideNewSignpostsForWorkflow(v11, v1);
        if (!v28)
        {
          if (!*v1)
          {
            WRMakeError(7, @"No signposts for new workflow %@", v22, v23, v24, v25, v26, v27, (uint64_t)v11);
            *id v1 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_25;
        }
        [v13 setObject:v28 forKeyedSubscript:@"signposts"];
        [v5 addObject:v13];

        if (v8 == ++v10)
        {
          id v6 = obj;
          uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
          id v3 = v31;
          if (v8) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    id v29 = (void *)[v5 copy];
LABEL_27:
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

id WRTaskingDictForWorkflow(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a2;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [v3 name];
  if (!v5) {
    [v6 setObject:v7 forKeyedSubscript:@"WR.workflows"];
  }
  uint64_t v8 = [v3 encodedDict];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = [v5 encodedDict];

  uint64_t v13 = (void *)[v12 mutableCopy];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __WRTaskingDictForWorkflow_block_invoke;
  v37[3] = &unk_265589790;
  id v14 = v13;
  id v38 = v14;
  id v15 = v11;
  id v39 = v15;
  id v16 = v10;
  id v40 = v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v37];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __WRTaskingDictForWorkflow_block_invoke_2;
  v34[3] = &unk_265589410;
  id v35 = v9;
  id v17 = v15;
  id v36 = v17;
  [v14 enumerateKeysAndObjectsUsingBlock:v34];
  id v18 = v17;
  uint64_t v19 = WRTaskingKeyBaseForWorkflow(v7);
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __WRTaskingDictForWorkflow_block_invoke_34;
  uint64_t v30 = &unk_265589790;
  id v20 = v6;
  id v31 = v20;
  id v21 = v7;
  id v32 = v21;
  id v33 = v19;
  id v22 = v19;
  [v18 enumerateKeysAndObjectsUsingBlock:&v27];
  if (objc_msgSend(v16, "count", v27, v28, v29, v30))
  {
    uint64_t v23 = WRTaskingKeyForNewSignposts(v21);
    uint64_t v24 = [v16 componentsJoinedByString:@","];
    [v20 setObject:v24 forKeyedSubscript:v23];
  }
  uint64_t v25 = (void *)[v20 copy];

  return v25;
}

void __WRTaskingDictForWorkflow_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if ([v5 isEqualToString:@"signposts"])
  {
    uint64_t v45 = @"signposts";
    uint64_t v46 = a1;
    id v48 = v6;
    id v49 = v5;
    uint64_t v8 = *(void **)(a1 + 48);
    id v9 = v6;
    uint64_t v47 = v7;
    id v51 = v7;
    id v50 = v8;
    id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v9;
    uint64_t v54 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v82 != v53) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"name", v45);
          if (v12)
          {
            uint64_t v58 = v11;
            id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            id v13 = v51;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v75 objects:v87 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v76;
LABEL_10:
              uint64_t v17 = 0;
              while (1)
              {
                if (*(void *)v76 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v75 + 1) + 8 * v17);
                uint64_t v19 = [v18 objectForKeyedSubscript:@"name"];
                char v20 = [v19 isEqualToString:v12];

                if (v20) {
                  break;
                }
                if (v15 == ++v17)
                {
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v75 objects:v87 count:16];
                  if (v15) {
                    goto LABEL_10;
                  }
                  goto LABEL_16;
                }
              }
              id v21 = v18;

              if (v21) {
                goto LABEL_19;
              }
            }
            else
            {
LABEL_16:
            }
            [v50 addObject:v12];
            id v21 = 0;
LABEL_19:
            v72[0] = MEMORY[0x263EF8330];
            v72[1] = 3221225472;
            v72[2] = ___WRTaskingFilteredSignposts_block_invoke;
            v72[3] = &unk_265589410;
            id v22 = v21;
            id v73 = v22;
            id v23 = v56;
            id v74 = v23;
            [v58 enumerateKeysAndObjectsUsingBlock:v72];
            v70[0] = MEMORY[0x263EF8330];
            v70[1] = 3221225472;
            v70[2] = ___WRTaskingFilteredSignposts_block_invoke_2;
            v70[3] = &unk_265589410;
            v70[4] = v58;
            id v24 = v23;
            id v71 = v24;
            [v22 enumerateKeysAndObjectsUsingBlock:v70];
            if ([v24 count])
            {
              [v24 setObject:v12 forKeyedSubscript:@"name"];
              [v52 addObject:v24];
            }
          }
          else
          {
            int v25 = *__error();
            uint64_t v26 = _wrlog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              __WRTaskingDictForWorkflow_block_invoke_cold_1(&v79, v80);
            }

            *__error() = v25;
          }
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
      }
      while (v54);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v57 = v51;
    uint64_t v27 = [v57 countByEnumeratingWithState:&v66 objects:v86 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v59 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v67 != v59) {
            objc_enumerationMutation(v57);
          }
          uint64_t v30 = objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * j), "objectForKeyedSubscript:", @"name", v45);
          if (v30)
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v31 = obj;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v85 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v61;
              while (2)
              {
                for (uint64_t k = 0; k != v33; ++k)
                {
                  if (*(void *)v61 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  id v36 = [*(id *)(*((void *)&v60 + 1) + 8 * k) objectForKeyedSubscript:@"name"];
                  char v37 = [v36 isEqualToString:v30];

                  if (v37)
                  {

                    goto LABEL_46;
                  }
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v60 objects:v85 count:16];
                if (v33) {
                  continue;
                }
                break;
              }
            }

            id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [v38 setObject:v30 forKeyedSubscript:@"name"];
            [v38 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x270D972C8];
            [v52 addObject:v38];
          }
          else
          {
            int v39 = *__error();
            id v40 = _wrlog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
              __WRTaskingDictForWorkflow_block_invoke_cold_1(&v64, v65);
            }

            *__error() = v39;
          }
LABEL_46:
        }
        uint64_t v28 = [v57 countByEnumeratingWithState:&v66 objects:v86 count:16];
      }
      while (v28);
    }

    if ([v52 count])
    {
      id v41 = v52;
      long long v42 = v52;
      id v43 = v41;
    }
    else
    {
      long long v42 = v52;
      id v43 = 0;
    }
    id v6 = v48;
    id v5 = v49;
    uint64_t v7 = v47;

    [*(id *)(v46 + 40) setObject:v43 forKeyedSubscript:v45];
  }
  else if ([v5 isEqualToString:@"diagnostics"])
  {
    uint64_t v44 = _WRTaskingFilteredDiagnostics(v6, v7);
    [*(id *)(a1 + 40) setObject:v44 forKeyedSubscript:@"diagnostics"];
  }
  else if (!v7 || ([v6 isEqual:v7] & 1) == 0)
  {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

id _WRTaskingFilteredDiagnostics(void *a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v41 = a2;
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v3;
  uint64_t v44 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v74;
    int v39 = v61;
    id v40 = v64;
    id v38 = v72;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v74 != v43) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v6 = objc_msgSend(v5, "objectForKeyedSubscript:", @"name", v38, v39, v40);
        if (v6)
        {
          id v48 = v5;
          id v46 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v7 = v41;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v67 objects:v79 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v68;
LABEL_9:
            uint64_t v11 = 0;
            while (1)
            {
              if (*(void *)v68 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v67 + 1) + 8 * v11);
              id v13 = [v12 objectForKeyedSubscript:@"name"];
              char v14 = [v13 isEqualToString:v6];

              if (v14) {
                break;
              }
              if (v9 == ++v11)
              {
                uint64_t v9 = [v7 countByEnumeratingWithState:&v67 objects:v79 count:16];
                if (v9) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            id v16 = v12;

            uint64_t v15 = v46;
            if (v16) {
              goto LABEL_18;
            }
          }
          else
          {
LABEL_15:

            uint64_t v15 = v46;
          }
          [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"is_new"];
          id v16 = 0;
LABEL_18:
          v63[0] = MEMORY[0x263EF8330];
          v63[1] = 3221225472;
          v64[0] = ___WRTaskingFilteredDiagnostics_block_invoke;
          v64[1] = &unk_265589410;
          id v17 = v16;
          id v65 = v17;
          id v18 = v15;
          id v66 = v18;
          [v48 enumerateKeysAndObjectsUsingBlock:v63];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v61[0] = ___WRTaskingFilteredDiagnostics_block_invoke_2;
          v61[1] = &unk_265589410;
          v61[2] = v48;
          id v19 = v18;
          id v62 = v19;
          [v17 enumerateKeysAndObjectsUsingBlock:v60];
          if ([v19 count])
          {
            [v19 setObject:v6 forKeyedSubscript:@"name"];
            [v42 addObject:v19];
          }
        }
        else
        {
          int v20 = *__error();
          id v21 = _wrlog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            _WRTaskingFilteredDiagnostics_cold_1(&v71, v38);
          }

          *__error() = v20;
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v44);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v47 = v41;
  uint64_t v22 = [v47 countByEnumeratingWithState:&v56 objects:v78 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v49 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(v47);
        }
        int v25 = [*(id *)(*((void *)&v56 + 1) + 8 * j) objectForKeyedSubscript:@"name"];
        if (v25)
        {
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v26 = obj;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v77 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v51;
            while (2)
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v51 != v29) {
                  objc_enumerationMutation(v26);
                }
                id v31 = [*(id *)(*((void *)&v50 + 1) + 8 * k) objectForKeyedSubscript:@"name"];
                char v32 = [v31 isEqualToString:v25];

                if (v32)
                {

                  goto LABEL_45;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v77 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v33 setObject:v25 forKeyedSubscript:@"name"];
          [v33 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"gather_tailspin"];
          [v42 addObject:v33];
        }
        else
        {
          int v34 = *__error();
          id v35 = _wrlog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            _WRTaskingFilteredDiagnostics_cold_1(&v54, v55);
          }

          *__error() = v34;
        }
LABEL_45:
      }
      uint64_t v23 = [v47 countByEnumeratingWithState:&v56 objects:v78 count:16];
    }
    while (v23);
  }

  if ([v42 count]) {
    id v36 = v42;
  }
  else {
    id v36 = 0;
  }

  return v36;
}

void __WRTaskingDictForWorkflow_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (__CFString *)&unk_270D99AD8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = &stru_270D96DE8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_9;
        }
        id v7 = (__CFString *)MEMORY[0x263EFFA68];
      }
    }
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
  }
LABEL_9:
}

void __WRTaskingDictForWorkflow_block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"signposts"])
  {
    id v22 = v5;
    id v7 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v21 = v6;
    id v9 = v6;
    id v10 = v7;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v9;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v16 = [v15 objectForKeyedSubscript:@"name"];
          id v17 = WRTaskingKeyBaseForSignpost(v10, v16);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = ___WRTaskingDictAddSignposts_block_invoke;
          v24[3] = &unk_2655897B8;
          id v25 = v8;
          id v26 = v10;
          id v27 = v16;
          id v28 = v17;
          id v18 = v17;
          id v19 = v16;
          [v15 enumerateKeysAndObjectsUsingBlock:v24];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    id v6 = v21;
    id v5 = v22;
  }
  else if ([v5 isEqualToString:@"diagnostics"])
  {
    _WRTaskingDictAddDiagnostics(*(void **)(a1 + 32), v6, *(void **)(a1 + 40), 0);
  }
  else if (![v5 isEqualToString:@"name"] {
         || ([v6 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  }
  {
    int v20 = (void *)[[NSString alloc] initWithFormat:@"%@%@", *(void *)(a1 + 48), v5];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v20];
  }
}

void _WRTaskingDictAddDiagnostics(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v23 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    LODWORD(v12) = 0;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [v15 objectForKeyedSubscript:@"is_new"];

        if (v16)
        {
          uint64_t v12 = (v12 + 1);
          id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v12);
        }
        else
        {
          id v17 = [v15 objectForKeyedSubscript:@"name"];
        }
        id v18 = v17;
        id v19 = WRTaskingKeyBaseForDiagnostic(v8, v9, v17);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = ___WRTaskingDictAddDiagnostics_block_invoke;
        v24[3] = &unk_265589790;
        id v25 = v18;
        id v26 = v19;
        id v27 = v23;
        id v20 = v18;
        id v21 = v19;
        [v15 enumerateKeysAndObjectsUsingBlock:v24];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
}

id WRTaskingValueForKeyOfType(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  if (a3) {
    *a3 = 0;
  }
  id v5 = OSAGetDATaskingValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      ClassName = object_getClassName(v5);
      WRMakeError(6, @"Unexpected type %s for tasking value for key %@", v8, v9, v10, v11, v12, v13, (uint64_t)ClassName);
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

id WRTaskingKeyBaseForDiagnostic(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = a1;
  id v9 = [v6 alloc];
  if (v5) {
    uint64_t v10 = [v9 initWithFormat:@"WR.%@.%@.%@.%@.", v8, v5, @"diagnostics", v7];
  }
  else {
    uint64_t v10 = [v9 initWithFormat:@"WR.%@.%@.%@.", v8, @"diagnostics", v7, v13];
  }
  uint64_t v11 = (void *)v10;

  return v11;
}

unsigned char *OUTLINED_FUNCTION_0_0(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

BOOL WRIsDisabledWorkflow(void *a1)
{
  id v1 = a1;
  id v2 = [v1 URLByStandardizingPath];
  id v3 = [v2 path];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v5 = [v4 attributesOfItemAtPath:v3 error:0];

    if (v5)
    {
      id v6 = [v5 fileType];
      if ([v6 isEqualToString:*MEMORY[0x263F080E8]]) {
        BOOL v7 = [v5 fileSize] == 0;
      }
      else {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    int v8 = *__error();
    id v9 = _wrlog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      WRIsDisabledWorkflow_cold_1();
    }

    BOOL v7 = 0;
    *__error() = v8;
  }

  return v7;
}

void sub_261981FA0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x520], 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2619827A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

id _WRGetString(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [a1 objectForKeyedSubscript:v6];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:v6];
  }
  uint64_t v10 = v9;

  [v10 length];

  return v10;
}

void sub_261984FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

#error "2619887D8: call analysis failed (funcsize=43)"

#error "261988CBC: call analysis failed (funcsize=49)"

void WRProcessIsBeingDebugged_cold_1(int a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_261964000, a2, OS_LOG_TYPE_ERROR, "[%d] Unable to get proc info, assuming not being debugged: %{errno}d", (uint8_t *)v5, 0xEu);
}

#error "261989F9C: call analysis failed (funcsize=47)"

#error "26198A0E8: call analysis failed (funcsize=41)"

#error "26198A240: call analysis failed (funcsize=43)"

#error "26198A398: call analysis failed (funcsize=43)"

#error "26198A4E0: call analysis failed (funcsize=41)"

#error "26198A7C8: call analysis failed (funcsize=44)"

#error "26198A944: call analysis failed (funcsize=49)"

void __WRCheckForBadWorkflowDict_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_261964000, a2, OS_LOG_TYPE_FAULT, "unhandled workflow array key %{public}@", (uint8_t *)&v2, 0xCu);
}

void __WRCheckForBadSignpostDict_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_261964000, a2, OS_LOG_TYPE_FAULT, "unhandled signpost array key %{public}@", (uint8_t *)&v2, 0xCu);
}

void __WRTaskingDictForWorkflow_block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_261964000, v2, v3, "nil signpost name", v4);
}

void _WRTaskingFilteredDiagnostics_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_261964000, v2, v3, "nil diagnostic name", v4);
}

void WRIsDisabledWorkflow_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_261964000, v0, v1, "Unable to get path for URL %@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x270F24B50]();
}

uint64_t SPReportWorkflowResponsivenessDelay()
{
  return MEMORY[0x270F9B438]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
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

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x270ED98C0](*(void *)&a1, *(void *)&a2, a3, *(void *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x270F8C4A0]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x270F8C4A8]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x270F8C4B0]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x270F8C4B8]();
}

uint64_t ktrace_chunk_version_major()
{
  return MEMORY[0x270F8C4C0]();
}

uint64_t ktrace_config_create()
{
  return MEMORY[0x270F8C4C8]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x270F8C4D0]();
}

uint64_t ktrace_config_get_reason()
{
  return MEMORY[0x270F8C4D8]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x270F8C518]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x270F8C530]();
}

uint64_t ktrace_file_open()
{
  return MEMORY[0x270F8C538]();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x270EDA4C8](__base, __nel, __width, __compar);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x270F9B9B0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}