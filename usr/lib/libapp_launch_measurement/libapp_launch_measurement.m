void alm_stop_tracking_responsive_launch()
{
  s_bail_responsive_launch = 1;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __alm_did_reach_launch_milestone_block_invoke(uint64_t a1)
{
}

void alm_app_did_activate(os_signpost_id_t a1, int a2)
{
}

uint64_t __alm_mach_time_to_ns_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&alm_mach_time_to_ns_timebase_info);
}

void alm_app_will_activate_with_details(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t *a6)
{
  v11 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  alm_app_will_activate_with_signpost_id(v12, a2, a3, a4, a5, v12);
  *a6 = v12;
}

uint64_t alm_legacy_app_regular_or_extended_launch_end(uint64_t result)
{
  if (!s_launch_task_count)
  {
    os_signpost_id_t v1 = result;
    v2 = alm_FrontBoard_lifecycle_log_s_log;
    if (!alm_FrontBoard_lifecycle_log_s_log)
    {
      v2 = os_log_create("com.apple.FrontBoard", "AppLaunch");
      alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v2;
    }
    if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_210827000, v2, OS_SIGNPOST_INTERVAL_END, v1, "AppLaunch", " enableTelemetry=YES ", v3, 2u);
    }
    result = _os_feature_enabled_impl();
    if (result)
    {
      result = mach_continuous_time();
      qword_26AA46EA0 = result;
    }
  }
  return result;
}

void alm_aggregate_and_send_ca_measurement_event(uint64_t a1, unsigned int a2)
{
  if (a1 && a2 <= 1 && *(unsigned char *)(a1 + 779) && strnlen((const char *)(a1 + 385), 0x80uLL) >= 5)
  {
    v3 = a2
       ? "com.apple.app_launch_measurement.ExtendedLaunchMetrics"
       : "com.apple.app_launch_measurement.FirstFramePresentationMetric";
    if ((analytics_send_event_lazy() & 1) == 0)
    {
      v4 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        v4 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v4;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        alm_aggregate_and_send_ca_measurement_event_cold_1((uint64_t)v3, a2, v4);
      }
    }
  }
}

void alm_aggregate_and_send_ca_measurement_event_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_210827000, log, OS_LOG_TYPE_ERROR, "Failed to send CA Event for app launch measurements for ca_event_type: %d event_name: %s", (uint8_t *)v3, 0x12u);
}

void alm_app_extended_launch_end_with_details(uint64_t a1, void *a2, uint64_t a3)
{
  int v6 = _os_feature_enabled_impl();
  if (a1 && v6)
  {
    if ((void)xmmword_26AA46E90 != a1)
    {
      qword_26AA46E84 = 0;
      word_26AA46E81 = 256;
      byte_26AA46EB8 = 0;
      *(long long *)((char *)&xmmword_26AA46E90 + 8) = 0u;
      *(_OWORD *)algn_26AA46EA8 = 0u;
      qword_26AA46EC0 = 0;
      byte_26AA46ED8 = 0;
      *(_OWORD *)&qword_26AA46EC8 = 0u;
      xmmword_26AA46EE0 = 0u;
      byte_26AA46EF0 = 0;
      dword_26AA46F08 = 0;
      xmmword_26AA46EF8 = 0u;
      *(void *)&xmmword_26AA46E90 = a1;
      s_ca_metrics = 1;
    }
    qword_26AA46EA0 = mach_continuous_time();
  }
  alm_did_reach_launch_milestone(4);
  int v7 = _alm_build_launch_info();
  if (a2)
  {
    if (MEMORY[0x2166745C0](a2) == MEMORY[0x263EF8708])
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "extendedAppLaunchActivity");
      xpc_object_t v9 = xpc_retain(value);
      a2 = (void *)nw_activity_create_from_xpc_object();
      xpc_release(v9);
    }
    else
    {
      a2 = 0;
    }
  }
  v10 = uikit_app_lifecycle_log_s_log;
  if (!uikit_app_lifecycle_log_s_log)
  {
    v10 = os_log_create("com.apple.UIKit", "AppLifecycle");
    uikit_app_lifecycle_log_s_log = (uint64_t)v10;
  }
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210827000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtendedAppLaunch", " enableTelemetry=YES ", buf, 2u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  v11[2] = __alm_app_extended_launch_end_with_details_block_invoke_2;
  v11[3] = &unk_26413A708;
  v11[5] = a1;
  v11[6] = a2;
  int v12 = v7;
  v11[4] = a3;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_44, (uint64_t)v11);
}

void alm_app_will_launch_with_details_and_metrics_payload(const char *a1, int a2, const char *a3, const char *a4, const char *a5, uint64_t a6, os_signpost_id_t *a7, xpc_object_t *a8)
{
  v16 = alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    v16 = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v16;
  }
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  uint64_t value = a6;
  alm_app_will_launch_with_signpost_id((uint64_t)a1, a2, a3, a4, a6, v17);
  *a7 = v17;
  if (a8)
  {
    v28 = a5;
    v18 = (void *)nw_activity_create();
    v19 = (void *)nw_activity_create();
    nw_activity_activate();
    nw_activity_activate();
    *a8 = xpc_dictionary_create(0, 0, 0);
    v20 = (void *)nw_activity_copy_xpc_object();
    v21 = (void *)nw_activity_copy_xpc_object();
    xpc_dictionary_set_value(*a8, "appLaunchActivity", v20);
    xpc_dictionary_set_value(*a8, "extendedAppLaunchActivity", v21);
    nw_release(v18);
    nw_release(v19);
    xpc_release(v20);
    xpc_release(v21);
    v22 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      v22 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v22;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      alm_app_will_launch_with_details_and_metrics_payload_cold_5();
    }
    if (_os_feature_enabled_impl())
    {
      if (!*a8) {
        *a8 = xpc_dictionary_create(0, 0, 0);
      }
      if ((os_variant_has_internal_content() & 1) == 0 && (!v28 || strncmp(v28, "com.apple.", 0xAuLL)))
      {
        if (alm_ca_hit_3rd_party_bundle_capture_limit_per_day())
        {
          v24 = alm_general_log_s_log;
          if (!alm_general_log_s_log)
          {
            v24 = os_log_create("com.apple.app_launch_measurement", "General");
            alm_general_log_s_log = (uint64_t)v24;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            alm_app_will_launch_with_details_and_metrics_payload_cold_2(v24);
          }
LABEL_41:
          xpc_dictionary_set_BOOL(*a8, "should_capture_launch", 0);
          return;
        }
        arc4random_stir();
        if (-1431655765 * arc4random() >= 0x55555556)
        {
          v25 = alm_general_log_s_log;
          if (!alm_general_log_s_log)
          {
            v25 = os_log_create("com.apple.app_launch_measurement", "General");
            alm_general_log_s_log = (uint64_t)v25;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            alm_app_will_launch_with_details_and_metrics_payload_cold_4((uint64_t)v28, v25);
          }
          goto LABEL_41;
        }
        ++_MergedGlobals;
        v26 = alm_general_log_s_log;
        if (!alm_general_log_s_log)
        {
          v26 = os_log_create("com.apple.app_launch_measurement", "General");
          alm_general_log_s_log = (uint64_t)v26;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          alm_app_will_launch_with_details_and_metrics_payload_cold_3((uint64_t)v28, v26);
        }
      }
      xpc_dictionary_set_BOOL(*a8, "should_capture_launch", 1);
      s_ca_metrics = 0;
      qword_26AA46E84 = 0;
      word_26AA46E81 = 0;
      xmmword_26AA46E90 = 0u;
      *(_OWORD *)&qword_26AA46EA0 = 0u;
      *(_OWORD *)&algn_26AA46EA8[1] = 0u;
      qword_26AA46EC0 = 0;
      *(_OWORD *)&qword_26AA46EC8 = 0u;
      byte_26AA46ED8 = 0;
      xmmword_26AA46EE0 = 0u;
      byte_26AA46EF0 = 0;
      xmmword_26AA46EF8 = 0u;
      dword_26AA46F08 = 0;
      if (a1) {
        xpc_dictionary_set_string(*a8, "transition_source", a1);
      }
      if (a3) {
        xpc_dictionary_set_string(*a8, "bundle_version", a3);
      }
      if (a4) {
        xpc_dictionary_set_string(*a8, "bundle_short_version_string", a4);
      }
      if (v28) {
        xpc_dictionary_set_string(*a8, "bundle_id", v28);
      }
      if (v17) {
        xpc_dictionary_set_uint64(*a8, "launch_id", v17);
      }
      xpc_dictionary_set_BOOL(*a8, "is_background", a2);
      xpc_dictionary_set_uint64(*a8, "launch_begin_time", value);
      s_payload_metrics = (uint64_t)*a8;
      *(void *)&xmmword_26AA46E90 = v17;
      xpc_dictionary_set_uint64((xpc_object_t)s_payload_metrics, "shared_cache_cryptex_ext_count", alm_app_will_launch_with_details_and_metrics_payload_shared_cache_cryptex_count);
      if (_os_feature_enabled_impl()
        && alm_app_will_launch_with_details_and_metrics_payload_dispatch_token != -1)
      {
        dispatch_once(&alm_app_will_launch_with_details_and_metrics_payload_dispatch_token, &__block_literal_global_26);
      }
      xpc_dictionary_set_uint64(*a8, "file_system_months", alm_app_will_launch_with_details_and_metrics_payload_num_months_since_last_erase_install);
      v23 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        v23 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v23;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        alm_app_will_launch_with_details_and_metrics_payload_cold_1();
      }
    }
  }
}

void alm_app_will_launch_with_signpost_id(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t a6)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  alm_build_version_string(__dst, a3, a4);
  v10 = alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    v10 = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v10;
  }
  unint64_t v11 = a6 - 1;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v12 = "YES";
    int v14 = 136446722;
    *(void *)v15 = a1;
    if (a2) {
      int v12 = "NO";
    }
    *(_WORD *)&v15[8] = 2082;
    *(void *)&v15[10] = v12;
    *(_WORD *)&v15[18] = 2050;
    *(void *)&v15[20] = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v10, OS_SIGNPOST_INTERVAL_BEGIN, a6, "AppLaunch", "TransitionSource=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu enableTelemetry=YES ", (uint8_t *)&v14, 0x20u);
  }
  v13 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(void *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(void *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationFirstFramePresentation", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
    v13 = alm_application_launch_log_s_log;
  }
  if (!v13)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(void *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(void *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationFirstFramePresentationResponsive", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
    v13 = alm_application_launch_log_s_log;
  }
  if (!v13)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v14 = 67240706;
    *(_DWORD *)v15 = a2 ^ 1;
    *(_WORD *)&v15[4] = 2082;
    *(void *)&v15[6] = __dst;
    *(_WORD *)&v15[14] = 2050;
    *(void *)&v15[16] = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v13, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationLaunchExtendedResponsive", "IsForeground=%{public, signpost.telemetry:number1}d AppVersion=%{public, signpost.telemetry:string1}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x1Cu);
  }
}

void alm_app_did_present_with_metrics_payload(os_signpost_id_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v8 = _os_feature_enabled_impl();
  uint64_t v9 = MEMORY[0x263EF8708];
  if (a2 && v8 && MEMORY[0x2166745C0](a2) == v9 && xpc_dictionary_get_BOOL(a2, "should_capture_launch"))
  {
    string = xpc_dictionary_get_string(a2, "bundle_id");
    xpc_dictionary_get_string(a2, "transition_source");
    xpc_dictionary_get_string(a2, "bundle_version");
    xpc_dictionary_get_string(a2, "bundle_short_version_string");
    if (a1 && (void)xmmword_26AA46E90 != a1)
    {
      qword_26AA46E84 = 0;
      word_26AA46E81 = 0;
      xmmword_26AA46E90 = 0u;
      *(_OWORD *)&qword_26AA46EA0 = 0u;
      *(_OWORD *)&algn_26AA46EA8[1] = 0u;
      qword_26AA46EC0 = 0;
      *(_OWORD *)&qword_26AA46EC8 = 0u;
      byte_26AA46ED8 = 0;
      xmmword_26AA46EE0 = 0u;
      byte_26AA46EF0 = 0;
      xmmword_26AA46EF8 = 0u;
      dword_26AA46F08 = 0;
    }
    s_ca_metrics = 1;
    HIBYTE(dword_26AA46F08) = 1;
    if (string && strnlen(string, 0x80uLL) > 4 || alm_retreive_process_name(byte_26AA46D81, 0x100uLL)) {
      __strlcpy_chk();
    }
    __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    LOBYTE(word_26AA46E81) = xpc_dictionary_get_BOOL(a2, "is_background");
    *((void *)&xmmword_26AA46E90 + 1) = xpc_dictionary_get_uint64(a2, "launch_begin_time");
    *(void *)&xmmword_26AA46E90 = xpc_dictionary_get_uint64(a2, "launch_id");
    qword_26AA46EC0 = xpc_dictionary_get_uint64(a2, "activation_time");
    *(void *)&xmmword_26AA46EF8 = xpc_dictionary_get_uint64(a2, "shared_cache_cryptex_ext_count");
    *((void *)&xmmword_26AA46EF8 + 1) = xpc_dictionary_get_uint64(a2, "file_system_months");
  }
  s_frontboard_launch_signpost_id = a1;
  s_alm_launch_signpost_id = a1;
  int v11 = _alm_build_launch_info();
  if (_os_feature_enabled_impl() && s_ca_metrics)
  {
    LODWORD(qword_26AA46E84) = v11;
    *(void *)algn_26AA46EA8 = mach_continuous_time();
    dispatch_time_t v12 = dispatch_time(0, 20000000000);
    dispatch_after(v12, MEMORY[0x263EF83A0], &__block_literal_global_86);
  }
  v13 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    v13 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v13;
  }
  unint64_t v14 = a1 - 1;
  if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LODWORD(buf.ru_utime.tv_sec) = 67240192;
    HIDWORD(buf.ru_utime.tv_sec) = v11;
    _os_signpost_emit_with_name_impl(&dword_210827000, v13, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationFirstFramePresentation", "LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&buf, 8u);
  }
  if (s_ca_metrics && os_variant_has_internal_content())
  {
    memset(&buf, 0, sizeof(buf));
    if (getrusage(0, &buf) >= 0) {
      uint64_t ru_majflt = buf.ru_majflt;
    }
    else {
      uint64_t ru_majflt = 0;
    }
    v16 = alm_application_launch_log_s_log;
    if (!alm_application_launch_log_s_log)
    {
      v16 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v16;
    }
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LODWORD(buf.ru_utime.tv_sec) = 67240448;
      HIDWORD(buf.ru_utime.tv_sec) = (_BYTE)word_26AA46E81 == 0;
      LOWORD(buf.ru_utime.tv_usec) = 2050;
      *(void *)((char *)&buf.ru_utime.tv_usec + 2) = ru_majflt;
      _os_signpost_emit_with_name_impl(&dword_210827000, v16, OS_SIGNPOST_EVENT, a1, "ApplicationLaunchPageInCount", "IsForeground=%{public, signpost.telemetry:number1}d PageInCount=%{public, signpost.telemetry:number2}llu", (uint8_t *)&buf, 0x12u);
    }
    kdebug_trace();
  }
  uint64_t v17 = v9;
  alm_did_reach_launch_milestone(1);
  if (s_launch_task_count) {
    int v18 = 1;
  }
  else {
    int v18 = a3;
  }
  if (_os_feature_enabled_impl()) {
    HIBYTE(word_26AA46E81) = v18;
  }
  if (a2)
  {
    if (MEMORY[0x2166745C0](a2) == v17)
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "appLaunchActivity");
      xpc_object_t v23 = xpc_retain(value);
      xpc_object_t v24 = xpc_dictionary_get_value(a2, "extendedAppLaunchActivity");
      xpc_object_t v25 = xpc_retain(v24);
      a2 = (void *)nw_activity_create_from_xpc_object();
      uint64_t v19 = nw_activity_create_from_xpc_object();
      nw_activity_set_global_parent();
      xpc_release(v23);
      xpc_release(v25);
      if (v18) {
        goto LABEL_41;
      }
      goto LABEL_56;
    }
    a2 = 0;
  }
  uint64_t v19 = 0;
  if (v18)
  {
LABEL_41:
    v20 = uikit_app_lifecycle_log_s_log;
    if (!uikit_app_lifecycle_log_s_log)
    {
      v20 = os_log_create("com.apple.UIKit", "AppLifecycle");
      uikit_app_lifecycle_log_s_log = (uint64_t)v20;
    }
    if (os_signpost_enabled(v20))
    {
      LOWORD(buf.ru_utime.tv_sec) = 0;
      _os_signpost_emit_with_name_impl(&dword_210827000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtendedAppLaunch", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }
    if ((s_launch_milestones & 4) != 0)
    {
      if (_os_feature_enabled_impl()) {
        *(void *)&xmmword_26AA46EE0 = mach_continuous_time();
      }
      v21 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        v21 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v21;
      }
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        LOWORD(buf.ru_utime.tv_sec) = 0;
        _os_signpost_emit_with_name_impl(&dword_210827000, v21, OS_SIGNPOST_INTERVAL_BEGIN, a1, "ApplicationLaunchExtendedOnlyResponsive", "", (uint8_t *)&buf, 2u);
      }
    }
    if (_os_feature_enabled_impl()) {
      qword_26AA46EA0 = mach_continuous_time();
    }
    goto LABEL_59;
  }
LABEL_56:
  if (_os_feature_enabled_impl()) {
    qword_26AA46EA0 = mach_continuous_time();
  }
  alm_did_reach_launch_milestone(12);
LABEL_59:
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 0x40000000;
  v26[2] = __alm_app_did_present_with_metrics_payload_block_invoke_2;
  v26[3] = &unk_26413A6C0;
  char v28 = v18;
  v26[6] = a2;
  v26[7] = v19;
  int v27 = v11;
  v26[4] = a4;
  v26[5] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_39, (uint64_t)v26);
}

void alm_did_reach_launch_milestone(int a1)
{
  s_launch_milestones &= ~(_BYTE)a1;
  if (_os_feature_enabled_impl())
  {
    int ca_send_event_from_reached_milestone = alm_get_ca_send_event_from_reached_milestone(a1);
    if (ca_send_event_from_reached_milestone != 2)
    {
      char v3 = ca_send_event_from_reached_milestone;
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __alm_did_reach_launch_milestone_block_invoke;
      block[3] = &__block_descriptor_tmp_50;
      char v8 = v3;
      dispatch_async(global_queue, block);
    }
  }
  uint64_t v5 = (void (**)(void))s_measurement_complete_handler;
  if ((s_launch_milestones & 0xF) == 0 && s_measurement_complete_handler != 0)
  {
    s_measurement_complete_handler = 0;
    v5[2](v5);
    _Block_release(v5);
  }
}

uint64_t alm_get_ca_send_event_from_reached_milestone(int a1)
{
  if (_os_feature_enabled_impl()) {
    BOOL v2 = s_ca_metrics == 0;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t result = 2;
  if (!v2 && HIBYTE(dword_26AA46F08) != 0)
  {
    switch(a1)
    {
      case 1:
        if (!(_BYTE)dword_26AA46F08)
        {
          uint64_t result = 0;
          LOBYTE(dword_26AA46F08) = 1;
        }
        break;
      case 2:
      case 8:
      case 10:
        if ((s_launch_milestones & 0xA) == 0 && !BYTE1(dword_26AA46F08))
        {
          uint64_t result = 1;
          BYTE1(dword_26AA46F08) = 1;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void alm_app_will_activate_with_signpost_id(uint64_t a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  alm_build_version_string(__dst, a3, a4);
  int v9 = _os_feature_enabled_impl();
  if (a6 && v9)
  {
    BOOL v10 = (void)xmmword_26AA46E90 != a6 || s_payload_metrics == 0;
    if (!v10 && MEMORY[0x2166745C0]() == MEMORY[0x263EF8708]) {
      xpc_dictionary_set_uint64((xpc_object_t)s_payload_metrics, "activation_time", a5);
    }
  }
  int v11 = alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    int v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    dispatch_time_t v12 = "YES";
    v15 = __dst;
    int v14 = 136446722;
    if (a2) {
      dispatch_time_t v12 = "NO";
    }
    __int16 v16 = 2082;
    uint64_t v17 = v12;
    __int16 v18 = 2050;
    uint64_t v19 = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationActivationFirstFramePresentation", "AppVersion=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x20u);
    int v11 = alm_application_launch_log_s_log;
  }
  if (!v11)
  {
    int v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)v11;
  }
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = "YES";
    v15 = __dst;
    int v14 = 136446722;
    if (a2) {
      v13 = "NO";
    }
    __int16 v16 = 2082;
    uint64_t v17 = v13;
    __int16 v18 = 2050;
    uint64_t v19 = a5;
    _os_signpost_emit_with_name_impl(&dword_210827000, v11, OS_SIGNPOST_INTERVAL_BEGIN, a6, "ApplicationActivationFirstFramePresentationResponsive", "AppVersion=%{public, signpost.telemetry:string1}s IsForeground=%{public, signpost.telemetry:string2}s %{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0x20u);
  }
}

void *__alm_aggregate_and_send_ca_measurement_event_block_invoke(uint64_t a1)
{
  char v3 = 0;
  alm_generate_ca_payload_from_metrics_data(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), &v3);
  if (!v3)
  {
    os_signpost_id_t v1 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      os_signpost_id_t v1 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v1;
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __alm_aggregate_and_send_ca_measurement_event_block_invoke_cold_1();
    }
  }
  return v3;
}

void alm_generate_ca_payload_from_metrics_data(uint64_t a1, int a2, void **a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    int v14 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      int v14 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v14;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      alm_generate_ca_payload_from_metrics_data_cold_1();
    }
    return;
  }
  *a3 = xpc_dictionary_create(0, 0, 0);
  bzero(string, 0x203uLL);
  long long v55 = 0u;
  long long v56 = 0u;
  *(_OWORD *)__str = 0u;
  long long v54 = 0u;
  alm_build_version_string(string, (const char *)(a1 + 1), (const char *)(a1 + 129));
  snprintf(__str, 0x40uLL, "%llu", *(void *)(a1 + 656));
  alm_decode_dyld_launch_info_into_dict(*(_DWORD *)(a1 + 644), *a3);
  xpc_dictionary_set_string(*a3, "transition_source", (const char *)(a1 + 257));
  xpc_dictionary_set_string(*a3, "bundle_id", (const char *)(a1 + 385));
  xpc_dictionary_set_string(*a3, "version_string", string);
  xpc_dictionary_set_uint64(*a3, "is_background", *(unsigned __int8 *)(a1 + 641));
  xpc_dictionary_set_string(*a3, "launch_id", __str);
  xpc_dictionary_set_uint64(*a3, "launch_info", *(unsigned int *)(a1 + 644));
  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = *(void *)(a1 + 760);
    memset(&v52, 0, sizeof(v52));
    if (getrusage(0, &v52) >= 0) {
      uint64_t ru_majflt = v52.ru_majflt;
    }
    else {
      uint64_t ru_majflt = 0;
    }
    float disk_fullness_percentage = alm_get_disk_fullness_percentage();
    xpc_dictionary_set_uint64(*a3, "shared_cache_cryptex_ext_count", v9);
    xpc_dictionary_set_uint64(*a3, "num_pagein_during_launch", ru_majflt);
    unint64_t v12 = *(void *)(a1 + 768);
    if (v12 >= 7)
    {
      if (v12 >= 0xD)
      {
        if (v12 >= 0x13)
        {
          if (v12 >= 0x19)
          {
            if (v12 < 0x31) {
              uint64_t v13 = 48;
            }
            else {
              uint64_t v13 = 49;
            }
          }
          else
          {
            uint64_t v13 = 24;
          }
        }
        else
        {
          uint64_t v13 = 18;
        }
      }
      else
      {
        uint64_t v13 = 12;
      }
    }
    else
    {
      uint64_t v13 = 6;
    }
    xpc_dictionary_set_uint64(*a3, "file_system_months", v13);
    if (disk_fullness_percentage <= 50.0)
    {
      *(double *)&uint64_t v16 = 50.0;
    }
    else
    {
      if (disk_fullness_percentage > 80.0)
      {
        if (disk_fullness_percentage <= 90.0)
        {
          double v15 = 90.0;
        }
        else
        {
          double v15 = 95.0;
          if (disk_fullness_percentage > 95.0) {
            double v15 = 96.0;
          }
        }
        goto LABEL_30;
      }
      *(double *)&uint64_t v16 = 80.0;
    }
    double v15 = *(double *)&v16;
LABEL_30:
    xpc_dictionary_set_double(*a3, "disk_fullness_percentage", v15);
  }
  if (a2 == 1)
  {
    unint64_t v22 = alm_mach_time_to_ns(*(void *)(a1 + 680), v6, v7, v8);
    unint64_t v21 = v22 - alm_mach_time_to_ns(*(void *)(a1 + 664), v23, v24, v25);
    unint64_t v29 = alm_mach_time_to_ns(*(void *)(a1 + 688), v26, v27, v28);
    double v33 = (double)(v29 - alm_mach_time_to_ns(*(void *)(a1 + 664), v30, v31, v32));
    double v34 = v33 / 1000000.0;
    unint64_t v37 = alm_mach_time_to_ns(*(void *)(a1 + 672), v33, v35, v36);
    double v41 = (double)(v37 - alm_mach_time_to_ns(*(void *)(a1 + 664), v38, v39, v40));
    double v42 = v41 / 1000000.0;
    unint64_t v45 = alm_mach_time_to_ns(*(void *)(a1 + 720), v41, v43, v44);
    unint64_t v49 = alm_mach_time_to_ns(*(void *)(a1 + 664), v46, v47, v48);
    if (*(unsigned char *)(a1 + 728)) {
      double v50 = 0.0;
    }
    else {
      double v50 = (double)(v45 - v49) / 1000000.0;
    }
    if (*(unsigned char *)(a1 + 696)) {
      double v51 = 0.0;
    }
    else {
      double v51 = v34;
    }
    if (*(unsigned char *)(a1 + 778))
    {
      if (!*(void *)(a1 + 688)) {
        double v51 = 20.0;
      }
      if (!*(void *)(a1 + 720)) {
        double v50 = 20.0;
      }
      if (!*(void *)(a1 + 672)) {
        double v42 = 20.0;
      }
    }
    xpc_dictionary_set_uint64(*a3, "activation_flags", *(unsigned int *)(a1 + 648));
    xpc_dictionary_set_double(*a3, "extended_responsive_time", v50);
    xpc_dictionary_set_double(*a3, "legacy_frontboard_launch_time", v42);
    xpc_dictionary_set_double(*a3, "first_frame_presentation_responsive_time", v51);
  }
  else
  {
    if (a2) {
      return;
    }
    unint64_t v17 = alm_mach_time_to_ns(*(void *)(a1 + 680), v6, v7, v8);
    unint64_t v21 = v17 - alm_mach_time_to_ns(*(void *)(a1 + 664), v18, v19, v20);
  }
  xpc_dictionary_set_double(*a3, "first_frame_presentation_time", (double)v21 / 1000000.0);
}

unint64_t alm_mach_time_to_ns(unint64_t a1, double a2, double a3, double a4)
{
  if (alm_mach_time_to_ns_onceToken != -1) {
    dispatch_once(&alm_mach_time_to_ns_onceToken, &__block_literal_global);
  }
  LODWORD(a3) = alm_mach_time_to_ns_timebase_info;
  LODWORD(a4) = *(_DWORD *)algn_26AA46BE4;
  return (unint64_t)((double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 * (double)a1);
}

size_t alm_build_version_string(char *__dst, const char *a2, const char *a3)
{
  if (a2) {
    strlcpy(__dst, a2, 0x101uLL);
  }
  else {
    *(void *)__dst = 0x4E574F4E4B4E55;
  }
  strlcat(__dst, "(", 0x203uLL);
  if (a3)
  {
    size_t v5 = strlen(__dst);
    strlcat(__dst, a3, v5 + 257);
  }
  else
  {
    *(void *)&__dst[strlen(__dst)] = 0x4E574F4E4B4E55;
  }

  return strlcat(__dst, ")", 0x203uLL);
}

float alm_get_disk_fullness_percentage()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  bzero(&v3, 0x878uLL);
  int v0 = statfs("/", &v3);
  float result = 0.0;
  if (!v0)
  {
    uint64_t v2 = v3.f_blocks * v3.f_bsize;
    if (v2) {
      return 100.0 - (double)(v3.f_bavail * v3.f_bsize) * 100.0 / (double)v2;
    }
  }
  return result;
}

void alm_decode_dyld_launch_info_into_dict(unsigned int a1, void *a2)
{
  if (a2 && MEMORY[0x2166745C0](a2) == MEMORY[0x263EF8708])
  {
    int v4 = 10 << (a1 >> 5);
    if (((a1 >> 5) & 0x1F) == 0) {
      int v4 = 0;
    }
    xpc_dictionary_set_uint64(a2, "uptime", v4);
    xpc_dictionary_set_uint64(a2, "uptime_log", (a1 >> 5) & 0x1F);
    xpc_dictionary_set_uint64(a2, "using_closure", a1 & 1);
    xpc_dictionary_set_uint64(a2, "built_closure_at_launch", (a1 >> 1) & 1);
    xpc_dictionary_set_uint64(a2, "closure_saved_to_file", (a1 >> 2) & 1);
    xpc_dictionary_set_uint64(a2, "minimal_closure", (a1 >> 3) & 1);
  }
}

void alm_execute_when_main_queue_idle_with_condition(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    alm_execute_when_main_queue_idle_with_condition_cold_1();
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2000000000;
  uint64_t v22 = 0;
  uint64_t v22 = mach_continuous_time();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2000000000;
  uint64_t v18 = 0;
  uint64_t v18 = v20[3];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2000000000;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  __int16 v14 = 0;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3002000000;
  BOOL v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = __alm_execute_when_main_queue_idle_with_condition_block_invoke;
  aBlock[3] = &unk_26413A808;
  aBlock[6] = v13;
  aBlock[7] = v15;
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[8] = v17;
  aBlock[9] = &v7;
  aBlock[10] = &v19;
  aBlock[11] = info;
  int v4 = _Block_copy(aBlock);
  v8[5] = (uint64_t)v4;
  dispatch_time_t v5 = dispatch_time(0, 3000000);
  dispatch_after(v5, MEMORY[0x263EF83A0], (dispatch_block_t)v8[5]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

void __alm_execute_when_main_queue_idle_with_condition_block_invoke(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2 > 0x1F4) {
    char v4 = 1;
  }
  else {
    char v4 = v3;
  }
  if (v4)
  {
    if (v2 >= 0x1F5)
    {
      dispatch_time_t v5 = alm_general_log_s_log;
      if (!alm_general_log_s_log)
      {
        dispatch_time_t v5 = os_log_create("com.apple.app_launch_measurement", "General");
        alm_general_log_s_log = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)rusage buf = 0;
        _os_log_impl(&dword_210827000, v5, OS_LOG_TYPE_DEFAULT, "Bailing responsive launch check as reached maximum count", buf, 2u);
      }
    }
    goto LABEL_12;
  }
  if (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 9u)
  {
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_release(*(const void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
    return;
  }
  ++*(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v6 = mach_continuous_time();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if ((v6 - *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
     * *(unsigned int *)(a1 + 88)
     / *(unsigned int *)(a1 + 92) > 0x7A11FF)
  {
    *(unsigned char *)(v8 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
    uint64_t v9 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      uint64_t v9 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v9;
    }
    if (!os_signpost_enabled(v9)) {
      goto LABEL_23;
    }
    __int16 v13 = 0;
    BOOL v10 = "ResponsiveCheckFailed";
    int v11 = (uint8_t *)&v13;
  }
  else
  {
    ++*(unsigned char *)(v8 + 24);
    uint64_t v9 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      uint64_t v9 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v9;
    }
    if (!os_signpost_enabled(v9)) {
      goto LABEL_23;
    }
    __int16 v14 = 0;
    BOOL v10 = "ResponsiveCheckSucceeded";
    int v11 = (uint8_t *)&v14;
  }
  _os_signpost_emit_with_name_impl(&dword_210827000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, "", v11, 2u);
LABEL_23:
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v7;
  dispatch_time_t v12 = dispatch_time(0, 3000000);
  dispatch_after(v12, MEMORY[0x263EF83A0], *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
}

uint64_t __alm_app_did_present_with_metrics_payload_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

uint64_t __alm_app_did_activate_with_responsive_check_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

uint64_t __alm_app_extended_launch_end_with_details_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

void alm_app_did_activate_with_responsive_check(os_signpost_id_t a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    qword_26AA46EC8 = mach_continuous_time();
    HIDWORD(qword_26AA46E84) = a2;
  }
  if ((a2 & 2) != 0)
  {
    int v7 = _alm_build_launch_info();
    uint64_t v8 = alm_application_launch_log_s_log;
    if (!alm_application_launch_log_s_log)
    {
      uint64_t v8 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v8;
    }
    if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)rusage buf = 67240448;
      int v12 = a2;
      __int16 v13 = 1026;
      int v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_210827000, v8, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationActivationFirstFramePresentation", "ActivationFlag=%{public, signpost.telemetry:number1}d LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", buf, 0xEu);
    }
    if (_os_feature_enabled_impl()) {
      LODWORD(qword_26AA46E84) = v7;
    }
  }
  else
  {
    uint64_t v6 = alm_application_launch_log_s_log;
    if (!alm_application_launch_log_s_log)
    {
      uint64_t v6 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v6;
    }
    if (a1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)rusage buf = 67240192;
      int v12 = a2;
      _os_signpost_emit_with_name_impl(&dword_210827000, v6, OS_SIGNPOST_INTERVAL_END, a1, "ApplicationActivationFirstFramePresentation", "ActivationFlag=%{public, signpost.telemetry:number1}d enableTelemetry=YES ", buf, 8u);
    }
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = __alm_app_did_activate_with_responsive_check_block_invoke_2;
  v9[3] = &unk_26413A750;
  int v10 = a2;
  v9[4] = a3;
  v9[5] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_48, (uint64_t)v9);
}

uint64_t _alm_build_launch_info()
{
  v7.float tv_sec = 0;
  v7.tv_nsec = 0;
  int v0 = clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &v7);
  float tv_sec = (float)v7.tv_sec;
  unsigned int v2 = _dyld_launch_mode();
  int v3 = v2 & 7 | (8 * ((v2 >> 4) & 1));
  double v4 = tv_sec / 10.0;
  if (v0) {
    double v4 = 0.0;
  }
  int v5 = llround(log2(ceil(v4)));
  if (v5 >= 15) {
    int v5 = 15;
  }
  return v3 | (32 * v5);
}

void __alm_app_did_present_with_metrics_payload_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v4 = alm_application_launch_log_s_log;
  if (a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      double v4 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v4;
    }
    os_signpost_id_t v5 = *(void *)(a1 + 40);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_210827000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ApplicationFirstFramePresentationResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
    }
    if (_os_feature_enabled_impl())
    {
      qword_26AA46EB0 = mach_continuous_time();
      byte_26AA46EB8 = 1;
    }
    if (*(void *)(a1 + 48)) {
      nw_activity_complete_with_reason();
    }
    if (!*(unsigned char *)(a1 + 68))
    {
      uint64_t v6 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        uint64_t v6 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v6;
      }
      os_signpost_id_t v7 = *(void *)(a1 + 40);
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl(&dword_210827000, v6, OS_SIGNPOST_INTERVAL_END, v7, "ApplicationLaunchExtendedResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_26AA46ED0 = mach_continuous_time();
        byte_26AA46ED8 = 1;
      }
      if (*(void *)(a1 + 56)) {
LABEL_39:
      }
        nw_activity_complete_with_reason();
    }
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      double v4 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v4;
    }
    os_signpost_id_t v9 = *(void *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      int v10 = *(_DWORD *)(a1 + 64);
      int v17 = 134218240;
      uint64_t v18 = a3;
      __int16 v19 = 1026;
      int v20 = v10;
      _os_signpost_emit_with_name_impl(&dword_210827000, v4, OS_SIGNPOST_INTERVAL_END, v9, "ApplicationFirstFramePresentationResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
    }
    if (*(void *)(a1 + 48)) {
      nw_activity_complete_with_reason();
    }
    if (_os_feature_enabled_impl())
    {
      qword_26AA46EB0 = a3;
      byte_26AA46EB8 = 0;
    }
    if (!*(unsigned char *)(a1 + 68))
    {
      int v11 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        int v11 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v11;
      }
      os_signpost_id_t v12 = *(void *)(a1 + 40);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        int v13 = *(_DWORD *)(a1 + 64);
        int v17 = 134218240;
        uint64_t v18 = a3;
        __int16 v19 = 1026;
        int v20 = v13;
        _os_signpost_emit_with_name_impl(&dword_210827000, v11, OS_SIGNPOST_INTERVAL_END, v12, "ApplicationLaunchExtendedResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_26AA46ED0 = a3;
        byte_26AA46ED8 = 0;
      }
      if (*(void *)(a1 + 56)) {
        goto LABEL_39;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 68)) {
    nw_activity_set_global_parent();
  }
  int v14 = *(void **)(a1 + 48);
  if (v14) {
    nw_release(v14);
  }
  uint64_t v15 = *(void **)(a1 + 56);
  if (v15) {
    nw_release(v15);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  alm_did_reach_launch_milestone(2);
}

void __alm_app_did_activate_with_responsive_check_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  os_signpost_id_t v5 = alm_application_launch_log_s_log;
  if (a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      os_signpost_id_t v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    os_signpost_id_t v6 = *(void *)(a1 + 40);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v15) = 0;
      os_signpost_id_t v7 = " BAILED=yes ";
      uint64_t v8 = v5;
      os_signpost_id_t v9 = v6;
      uint32_t v10 = 2;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_210827000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ApplicationActivationFirstFramePresentationResponsive", v7, (uint8_t *)&v15, v10);
    }
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      os_signpost_id_t v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    os_signpost_id_t v12 = *(void *)(a1 + 40);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v13 = *(_DWORD *)(a1 + 48);
      int v15 = 134218240;
      uint64_t v16 = a3;
      __int16 v17 = 1026;
      int v18 = v13;
      os_signpost_id_t v7 = "%{signpost.description:end_time}llu ActivationFlag=%{public, signpost.telemetry:number1}d enableTelemetry=YES ";
      uint64_t v8 = v5;
      os_signpost_id_t v9 = v12;
      uint32_t v10 = 18;
      goto LABEL_12;
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, a2, a3, a4);
  }
  alm_did_reach_launch_milestone(16);
}

void __alm_app_extended_launch_end_with_details_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v4 = s_launch_milestones;
  os_signpost_id_t v5 = alm_application_launch_log_s_log;
  if (a2)
  {
    if (!alm_application_launch_log_s_log)
    {
      os_signpost_id_t v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    os_signpost_id_t v6 = *(void *)(a1 + 40);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_210827000, v5, OS_SIGNPOST_INTERVAL_END, v6, "ApplicationLaunchExtendedResponsive", " BAILED=yes ", (uint8_t *)&v17, 2u);
    }
    if (_os_feature_enabled_impl())
    {
      qword_26AA46ED0 = mach_continuous_time();
      byte_26AA46ED8 = 1;
    }
    if ((v4 & 1) == 0)
    {
      os_signpost_id_t v7 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        os_signpost_id_t v7 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v7;
      }
      os_signpost_id_t v8 = *(void *)(a1 + 40);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl(&dword_210827000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ApplicationLaunchExtendedOnlyResponsive", " BAILED=yes", (uint8_t *)&v17, 2u);
      }
      byte_26AA46EF0 = 1;
      *((void *)&xmmword_26AA46EE0 + 1) = mach_continuous_time();
    }
    if (*(void *)(a1 + 48)) {
LABEL_34:
    }
      nw_activity_complete_with_reason();
  }
  else
  {
    if (!alm_application_launch_log_s_log)
    {
      os_signpost_id_t v5 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
      alm_application_launch_log_s_log = (uint64_t)v5;
    }
    os_signpost_id_t v10 = *(void *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v11 = *(_DWORD *)(a1 + 56);
      int v17 = 134218240;
      uint64_t v18 = a3;
      __int16 v19 = 1026;
      int v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_210827000, v5, OS_SIGNPOST_INTERVAL_END, v10, "ApplicationLaunchExtendedResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
    }
    if (_os_feature_enabled_impl())
    {
      byte_26AA46ED8 = 0;
      qword_26AA46ED0 = a3;
    }
    if ((v4 & 1) == 0)
    {
      os_signpost_id_t v12 = alm_application_launch_log_s_log;
      if (!alm_application_launch_log_s_log)
      {
        os_signpost_id_t v12 = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
        alm_application_launch_log_s_log = (uint64_t)v12;
      }
      os_signpost_id_t v13 = *(void *)(a1 + 40);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        int v14 = *(_DWORD *)(a1 + 56);
        int v17 = 134218240;
        uint64_t v18 = a3;
        __int16 v19 = 1026;
        int v20 = v14;
        _os_signpost_emit_with_name_impl(&dword_210827000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ApplicationLaunchExtendedOnlyResponsive", "%{signpost.description:end_time}llu LaunchInfo=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", (uint8_t *)&v17, 0x12u);
      }
      if (_os_feature_enabled_impl())
      {
        byte_26AA46EF0 = 0;
        *((void *)&xmmword_26AA46EE0 + 1) = a3;
      }
    }
    if (*(void *)(a1 + 48)) {
      goto LABEL_34;
    }
  }
  nw_activity_set_global_parent();
  int v15 = *(void **)(a1 + 48);
  if (v15) {
    nw_release(v15);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  alm_did_reach_launch_milestone(8);
}

void alm_execute_when_measurement_complete(const void *a1)
{
  if (!a1) {
    alm_execute_when_measurement_complete_cold_1();
  }
  os_signpost_id_t v1 = (const void *)s_measurement_complete_handler;
  if (s_measurement_complete_handler)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 0x40000000;
    v2[2] = __alm_execute_when_measurement_complete_block_invoke;
    v2[3] = &unk_26413A798;
    v2[4] = s_measurement_complete_handler;
    v2[5] = a1;
    s_measurement_complete_handler = (uint64_t)_Block_copy(v2);
    _Block_release(v1);
  }
  else
  {
    s_measurement_complete_handler = (uint64_t)_Block_copy(a1);
  }
}

BOOL alm_app_measurement_ongoing()
{
  if (s_launch_milestones) {
    return 0;
  }
  if ((s_launch_milestones & 4) == 0)
  {
    if ((s_launch_milestones & 0xF) != 0) {
      return (s_bail_responsive_launch & 1) == 0;
    }
    return 0;
  }
  return 1;
}

double alm_ca_metric_info_init()
{
  s_ca_metrics = 0;
  double result = 0.0;
  qword_26AA46E84 = 0;
  word_26AA46E81 = 0;
  xmmword_26AA46E90 = 0u;
  *(_OWORD *)&qword_26AA46EA0 = 0u;
  *(_OWORD *)&algn_26AA46EA8[1] = 0u;
  qword_26AA46EC0 = 0;
  byte_26AA46ED8 = 0;
  *(_OWORD *)&qword_26AA46EC8 = 0u;
  xmmword_26AA46EE0 = 0u;
  byte_26AA46EF0 = 0;
  dword_26AA46F08 = 0;
  xmmword_26AA46EF8 = 0u;
  return result;
}

uint64_t alm_get_currrent_ca_metric_info()
{
  return 0;
}

os_log_t uikit_app_lifecycle_log()
{
  os_log_t result = (os_log_t)uikit_app_lifecycle_log_s_log;
  if (!uikit_app_lifecycle_log_s_log)
  {
    os_log_t result = os_log_create("com.apple.UIKit", "AppLifecycle");
    uikit_app_lifecycle_log_s_log = (uint64_t)result;
  }
  return result;
}

os_log_t alm_application_launch_log()
{
  os_log_t result = (os_log_t)alm_application_launch_log_s_log;
  if (!alm_application_launch_log_s_log)
  {
    os_log_t result = os_log_create("com.apple.app_launch_measurement", "ApplicationLaunch");
    alm_application_launch_log_s_log = (uint64_t)result;
  }
  return result;
}

os_log_t alm_FrontBoard_lifecycle_log()
{
  os_log_t result = (os_log_t)alm_FrontBoard_lifecycle_log_s_log;
  if (!alm_FrontBoard_lifecycle_log_s_log)
  {
    os_log_t result = os_log_create("com.apple.FrontBoard", "AppLaunch");
    alm_FrontBoard_lifecycle_log_s_log = (uint64_t)result;
  }
  return result;
}

uint64_t alm_build_launch_info(uint64_t (*a1)(void), uint64_t a2)
{
  unsigned int v3 = a1();
  int v4 = v3 & 7 | (8 * ((v3 >> 4) & 1));
  int v5 = llround(log2(ceil((float)a2 / 10.0)));
  if (v5 >= 15) {
    int v5 = 15;
  }
  return v4 | (32 * v5);
}

void alm_app_will_launch(const char *a1, int a2, uint64_t a3, os_signpost_id_t *a4)
{
}

void alm_app_will_launch_with_details(const char *a1, int a2, const char *a3, const char *a4, uint64_t a5, os_signpost_id_t *a6)
{
}

uint64_t alm_is_internal_variant_os()
{
  return os_variant_has_internal_content();
}

BOOL alm_is_internal_app(char *__s1, uint64_t a2)
{
  BOOL result = 0;
  if (__s1)
  {
    if (a2) {
      return strncmp(__s1, "com.apple.", 0xAuLL) == 0;
    }
  }
  return result;
}

BOOL alm_ca_hit_3rd_party_bundle_capture_limit_per_day()
{
  uint64_t v0 = mach_continuous_time();
  uint64_t v4 = v0;
  if (!qword_26776D140 || alm_mach_time_to_ns(v0 - qword_26776D140, v1, v2, v3) >= 0x4E94914F0001)
  {
    _MergedGlobals = 0;
    qword_26776D140 = v4;
    int v5 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      int v5 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      alm_ca_hit_3rd_party_bundle_capture_limit_per_day_cold_1();
    }
  }
  return _MergedGlobals > 3u;
}

BOOL alm_ca_should_random_sampling_3rd_party_data()
{
  return -1431655765 * arc4random() < 0x55555556;
}

uint64_t __alm_app_will_launch_with_details_and_metrics_payload_block_invoke()
{
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_29);
  uint64_t result = alm_get_num_months_since_last_erase_install();
  alm_app_will_launch_with_details_and_metrics_payload_num_months_since_last_erase_install = result;
  return result;
}

uint64_t __alm_app_will_launch_with_details_and_metrics_payload_block_invoke_2()
{
  uint64_t result = alm_count_cryptex_file_extents("/private/preboot/cryptex1/current/os.dmg");
  alm_app_will_launch_with_details_and_metrics_payload_shared_cache_cryptex_count = result;
  return result;
}

uint64_t alm_count_cryptex_file_extents(const char *a1)
{
  if (!a1) {
    return 0;
  }
  int v1 = open(a1, 0, 0);
  if (v1 < 0) {
    return 0;
  }
  int v2 = v1;
  memset(&v10, 0, sizeof(v10));
  if (fstat(v1, &v10) || (off_t st_size = v10.st_size, v10.st_size < 1))
  {
    uint64_t v3 = 0;
  }
  else
  {
    off_t v6 = 0;
    uint64_t v3 = 0;
    do
    {
      int v7 = 0;
      off_t v8 = st_size - v6;
      off_t v9 = v6;
      if (fcntl(v2, 65, &v7)) {
        break;
      }
      if (!v8) {
        break;
      }
      v6 += v8;
      ++v3;
    }
    while (v6 < st_size);
  }
  close(v2);
  return v3;
}

uint64_t alm_get_num_months_since_last_erase_install()
{
  unint64_t v2 = 0;
  fsctl("/var/mobile", 0x40086804uLL, &v2, 0);
  if (!v2) {
    return 0;
  }
  __tp.float tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  uint64_t result = 0;
  if (__tp.tv_sec >= v2)
  {
    unsigned int v1 = ((double)(__tp.tv_sec - v2) / 2629743.83);
    if (v1 <= 1) {
      return 1;
    }
    else {
      return v1;
    }
  }
  return result;
}

void alm_app_did_present(os_signpost_id_t a1, int a2, uint64_t a3)
{
}

uint64_t alm_retreive_process_name(char *a1, size_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 && (memset(buffer, 0, sizeof(buffer)), pid_t v4 = getpid(), proc_name(v4, buffer, 0x100u))) {
    return (snprintf(a1, a2, "(P)%s", (const char *)buffer) >> 31);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t alm_get_process_num_page_in()
{
  memset(&v1, 0, sizeof(v1));
  if (getrusage(0, &v1) >= 0) {
    return v1.ru_majflt;
  }
  else {
    return 0;
  }
}

BOOL alm_has_running_launch_task()
{
  return s_launch_task_count != 0;
}

BOOL alm_has_reached_launch_milestone(char a1)
{
  return (s_launch_milestones & a1) == 0;
}

uint64_t alm_is_responsive_launch_bailed()
{
  return s_bail_responsive_launch & 1;
}

void alm_app_extended_launch_end(uint64_t a1, uint64_t a2)
{
}

void alm_clear_responsive_launch_bailed()
{
  s_bail_responsive_launch = 0;
}

void alm_reset_launch_milestone()
{
  s_launch_milestones = 15;
}

uint64_t __alm_execute_when_measurement_complete_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void alm_execute_when_main_queue_idle(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = __alm_execute_when_main_queue_idle_block_invoke_2;
  v1[3] = &unk_26413A7E0;
  v1[4] = a1;
  alm_execute_when_main_queue_idle_with_condition((uint64_t)&__block_literal_global_56, (uint64_t)v1);
}

uint64_t __alm_execute_when_main_queue_idle_block_invoke()
{
  return s_bail_responsive_launch & 1;
}

uint64_t __alm_execute_when_main_queue_idle_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL alm_is_running_launch_task(CFTypeRef cf1)
{
  unint64_t v2 = 0;
  BOOL v3 = 1;
  do
  {
    pid_t v4 = (const void *)s_launch_tasks[v2];
    if (v4 && CFEqual(cf1, v4)) {
      break;
    }
    BOOL v3 = v2++ < 0xF;
  }
  while (v2 != 16);
  return v3;
}

uint64_t alm_will_start_extended_launch_task(const __CFString *a1)
{
  if (!a1) {
    return 1;
  }
  if (CFStringGetLength(a1) > 256) {
    return 1;
  }
  if (s_launch_task_count > 0xFu) {
    return 2;
  }
  if ((s_launch_milestones & 4) == 0) {
    return 3;
  }
  if (alm_is_running_launch_task(a1)) {
    return 4;
  }
  uint64_t v3 = 0;
  while (s_launch_tasks[v3])
  {
    uint64_t result = 0;
    if (++v3 == 16) {
      return result;
    }
  }
  s_launch_tasks[v3] = (uint64_t)a1;
  CFRetain(a1);
  uint64_t result = 0;
  ++s_launch_task_count;
  return result;
}

uint64_t alm_did_finish_extended_launch_task(const __CFString *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a1 || CFStringGetLength(a1) > 256) {
    return 1;
  }
  if (s_alm_launch_signpost_id) {
    BOOL v3 = s_frontboard_launch_signpost_id == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    pid_t v4 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      pid_t v4 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v4;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      alm_did_finish_extended_launch_task_cold_1();
    }
    return 6;
  }
  else
  {
    uint64_t v5 = 0;
    while (1)
    {
      off_t v6 = (const void *)s_launch_tasks[v5];
      if (v6)
      {
        if (CFEqual(a1, v6)) {
          break;
        }
      }
      if (++v5 == 16) {
        return 5;
      }
    }
    CFRelease((CFTypeRef)s_launch_tasks[v5]);
    s_launch_tasks[v5] = 0;
    if (!--s_launch_task_count)
    {
      uint64_t v7 = alm_FrontBoard_lifecycle_log_s_log;
      if (!alm_FrontBoard_lifecycle_log_s_log)
      {
        uint64_t v7 = os_log_create("com.apple.FrontBoard", "AppLaunch");
        alm_FrontBoard_lifecycle_log_s_log = (uint64_t)v7;
      }
      os_signpost_id_t v8 = s_frontboard_launch_signpost_id;
      if ((unint64_t)(s_frontboard_launch_signpost_id - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        v9[0] = 67240192;
        v9[1] = 1;
        _os_signpost_emit_with_name_impl(&dword_210827000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AppLaunch", "IsExtendedLaunch=%{public, signpost.telemetry:number1}u enableTelemetry=YES ", (uint8_t *)v9, 8u);
      }
      if (_os_feature_enabled_impl())
      {
        qword_26AA46EA0 = mach_continuous_time();
        HIBYTE(word_26AA46E81) = 1;
      }
      alm_app_extended_launch_end_with_details(s_alm_launch_signpost_id, 0, 0);
    }
    return 0;
  }
}

uint64_t alm_bucketize_file_system_months(unint64_t a1)
{
  if (a1 < 0x31) {
    char v1 = 48;
  }
  else {
    char v1 = 49;
  }
  if (a1 >= 0x19) {
    char v2 = v1;
  }
  else {
    char v2 = 24;
  }
  if (a1 >= 0x13) {
    char v3 = v2;
  }
  else {
    char v3 = 18;
  }
  if (a1 >= 0xD) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 12;
  }
  if (a1 >= 7) {
    return v4;
  }
  else {
    return 6;
  }
}

uint64_t alm_bucketize_disk_fullness_percentage(double a1)
{
  if (a1 <= 50.0) {
    return 50;
  }
  if (a1 <= 80.0) {
    return 80;
  }
  if (a1 <= 90.0) {
    return 90;
  }
  if (a1 <= 95.0) {
    return 95;
  }
  return 96;
}

uint64_t alm_get_3rd_party_app_sampling_info()
{
  return 0;
}

void s_telemetry_timeout_handler_block_invoke()
{
  if (!BYTE1(dword_26AA46F08) && (s_launch_milestones & 1) == 0)
  {
    BYTE2(dword_26AA46F08) = 1;
    uint64_t v0 = alm_general_log_s_log;
    if (!alm_general_log_s_log)
    {
      uint64_t v0 = os_log_create("com.apple.app_launch_measurement", "General");
      alm_general_log_s_log = (uint64_t)v0;
    }
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      s_telemetry_timeout_handler_block_invoke_cold_1(v0);
    }
    alm_did_reach_launch_milestone(10);
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_210827000, v0, v1, "CA telemetry data is added to metric payload", v2, v3, v4, v5, v6);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_2(NSObject *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = mach_continuous_time();
  v6[0] = 67109376;
  v6[1] = 4;
  __int16 v7 = 2048;
  unint64_t v8 = alm_mach_time_to_ns(v2 - qword_26776D140, v3, v4, v5) / 0x34630B8A000;
  _os_log_debug_impl(&dword_210827000, a1, OS_LOG_TYPE_DEBUG, "Reached per-day limit of %d for capturing 3rd party data ! Wont collect data. Num hours: %llu", (uint8_t *)v6, 0x12u);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = _MergedGlobals;
  uint64_t v5 = mach_continuous_time();
  int v9 = 136315650;
  uint64_t v10 = a1;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2048;
  unint64_t v14 = alm_mach_time_to_ns(v5 - qword_26776D140, v6, v7, v8) / 0x34630B8A000;
  _os_log_debug_impl(&dword_210827000, a2, OS_LOG_TYPE_DEBUG, "Capture 3rd party %s data. Num Collected(24hr): %d Num hours: %llu", (uint8_t *)&v9, 0x1Cu);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_210827000, a2, OS_LOG_TYPE_DEBUG, "Random sampling decided not to capture 3rd party %s data", (uint8_t *)&v2, 0xCu);
}

void alm_app_will_launch_with_details_and_metrics_payload_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_210827000, v0, v1, "network activtity data is added to metric payload", v2, v3, v4, v5, v6);
}

void alm_ca_hit_3rd_party_bundle_capture_limit_per_day_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_210827000, v0, v1, "Reset the 3rd party bundle sampling limit after 24 hours pass", v2, v3, v4, v5, v6);
}

void alm_execute_when_main_queue_idle_with_condition_cold_1()
{
  __assert_rtn("alm_execute_when_main_queue_idle_with_condition", "app_launch_measurement.c", 984, "handler != NULL");
}

void alm_execute_when_measurement_complete_cold_1()
{
  __assert_rtn("alm_execute_when_measurement_complete", "app_launch_measurement.c", 961, "handler != NULL");
}

void alm_did_finish_extended_launch_task_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_210827000, v0, v1, "Couldn't find persisted ALM/FrontBoard launch signpost id when finishing an ext launch task.", v2, v3, v4, v5, v6);
}

void alm_generate_ca_payload_from_metrics_data_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_210827000, v0, v1, "Payload pointer cannot be NULL", v2, v3, v4, v5, v6);
}

void __alm_aggregate_and_send_ca_measurement_event_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_210827000, v0, v1, "CA Event payload is not created properly !", v2, v3, v4, v5, v6);
}

void s_telemetry_timeout_handler_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 20;
  _os_log_error_impl(&dword_210827000, log, OS_LOG_TYPE_ERROR, "CA Telemetry timedout after %d seconds due to app launch has not reached all responsive milestones", (uint8_t *)v1, 8u);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _dyld_launch_mode()
{
  return MEMORY[0x270ED7FA8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x270F18A78]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void arc4random_stir(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x270ED9D50](*(void *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x270EF7998]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_copy_xpc_object()
{
  return MEMORY[0x270EF79B8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79C8]();
}

uint64_t nw_activity_create_from_xpc_object()
{
  return MEMORY[0x270EF79E0]();
}

uint64_t nw_activity_set_global_parent()
{
  return MEMORY[0x270EF7A20]();
}

void nw_release(void *obj)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}