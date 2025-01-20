@interface PTService
- (BOOL)_appendLogContentToKtraceFile:(id)a3 withError:(id *)a4;
- (BOOL)_aspSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_configureKtraceSession:(id)a3 withError:(id *)a4;
- (BOOL)_connectionIsEntitled:(id)a3 toEntitlement:(id)a4;
- (BOOL)_faultSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_graphicsSamplingInit;
- (BOOL)_markPurgable:(id)a3 withUrgency:(unint64_t)a4;
- (BOOL)_postProcessKtraceFile:(id)a3 withError:(id *)a4;
- (BOOL)_sendNotification:(id)a3;
- (BOOL)_syscallSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4;
- (BOOL)_validSymbolicationPreferences;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDate)startTime;
- (NSXPCConnection)connection;
- (OS_dispatch_source)activeTimer;
- (PTService)init;
- (PTTraceConfig)activeConfig;
- (id)_generateToken:(id)a3;
- (id)_traceRecordArgsArrayFromConfig:(id)a3 outputFilePath:(id)a4 error:(id *)a5;
- (ktrace_recording)ktraceRecording;
- (ktrace_session)ktraceSession;
- (void)_graphicsSamplingTeardown;
- (void)_startPerformanceTrace:(id)a3;
- (void)_startPerformanceTraceLegacy:(id)a3;
- (void)_stopPerformanceTrace;
- (void)_stopPerformanceTraceLegacy;
- (void)_symbolicateKtraceFile:(id)a3;
- (void)applyConfig:(id)a3 withError:(id)a4;
- (void)getCurrentStoredConfig:(id)a3;
- (void)pingService:(id)a3;
- (void)resetConfig:(id)a3;
- (void)setActiveConfig:(id)a3;
- (void)setActiveTimer:(id)a3;
- (void)setKtraceRecording:(ktrace_recording *)a3;
- (void)setKtraceSession:(ktrace_session *)a3;
- (void)setStartTime:(id)a3;
- (void)startPerformanceTrace:(id)a3;
- (void)stopPerformanceTrace;
@end

@implementation PTService

- (PTService)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTService;
  result = [(PTService *)&v3 init];
  if (result) {
    result->_ktraceSession = 0;
  }
  return result;
}

- (BOOL)_connectionIsEntitled:(id)a3 toEntitlement:(id)a4
{
  v4 = [a3 valueForEntitlement:a4];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_sendNotification:(id)a3
{
  id v3 = a3;
  if (objc_opt_class())
  {
    id v4 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.PerformanceTrace.notifications"];
    id v5 = objc_alloc_init((Class)UNMutableNotificationContent);
    [v5 setThreadIdentifier:@"performanceTraceNotifications"];
    [v5 setTitle:@"Performance Trace"];
    if (v3)
    {
      v6 = [v3 lastPathComponent];
      v7 = [@"prefs:root=Privacy&path=PROBLEM_REPORTING/DIAGNOSTIC_USAGE_DATA/" stringByAppendingPathComponent:v6];

      v8 = +[NSURL URLWithString:v7];
      v9 = [v3 lastPathComponent];
      v10 = +[NSString stringWithFormat:@"Saved %@.", v9];
      [v5 setBody:v10];

      [v5 setDefaultActionURL:v8];
      v11 = +[UNNotificationActionIcon iconWithSystemImageName:@"doc.text.below.ecg"];
      v12 = +[UNNotificationAction actionWithIdentifier:@"viewAction" title:@"View" url:v8 options:0 icon:v11];
      v30 = v12;
      v13 = +[NSArray arrayWithObjects:&v30 count:1];
      v14 = +[UNNotificationCategory categoryWithIdentifier:@"performanceTraceNotifications" actions:v13 intentIdentifiers:&__NSArray0__struct options:0];

      v15 = +[NSSet setWithObject:v14];
      [v4 setNotificationCategories:v15];
    }
    else
    {
      [v5 setBody:@"Performance Trace failed to complete."];
    }
    [v5 setCategoryIdentifier:@"performanceTraceNotifications"];
    v17 = +[NSUUID UUID];
    v18 = [v17 UUIDString];
    v19 = +[UNNotificationRequest requestWithIdentifier:v18 content:v5 trigger:0];

    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = sub_10000198C;
    v28 = sub_10000199C;
    id v29 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000019A4;
    v23[3] = &unk_1000145E8;
    v23[4] = buf;
    [v4 addNotificationRequest:v19 withCompletionHandler:v23];
    uint64_t v20 = *((void *)v25 + 5);
    BOOL v16 = v20 == 0;
    if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Performance Trace completion notification sent", v22, 2u);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "UserNotifications.framework is weak-linked and unavailable; Performance Trace cannot post notifications",
        buf,
        2u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_syscallSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  [(PTService *)self ktraceSession];
  ktrace_events_range();
  [(PTService *)self ktraceSession];
  ktrace_events_range();
  if (kperf_kdebug_filter_add_class_subclass_fn())
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_10000C540();
LABEL_7:
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (!kperf_kdebug_filter_add_class_subclass_fn())
    {
      *a4 |= 8u;
      LOBYTE(v6) = 1;
      return v6;
    }
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_10000C4D0();
      goto LABEL_7;
    }
  }
  return v6;
}

- (BOOL)_faultSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  [(PTService *)self ktraceSession];
  ktrace_events_range();
  int v5 = kperf_kdebug_filter_add_class_subclass_fn();
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C5B0();
    }
  }
  else
  {
    *a4 |= 8u;
  }
  return v5 == 0;
}

- (BOOL)_graphicsSamplingInit
{
  for (uint64_t i = 0; i != 5; ++i)
  {
    int v5 = 1;
    sysctlbyname(off_100014608[i], 0, 0, &v5, 4uLL);
  }
  [(PTService *)self ktraceSession];
  ktrace_events_range();
  [(PTService *)self ktraceSession];
  ktrace_events_range();
  return 1;
}

- (void)_graphicsSamplingTeardown
{
  for (uint64_t i = 0; i != 5; ++i)
    sysctlbyname(off_100014608[i], 0, 0, 0, 4uLL);
}

- (BOOL)_aspSamplingInitFilter:(kperf_kdebug_filter *)a3 withSamplers:(unsigned int *)a4
{
  return 1;
}

- (BOOL)_configureKtraceSession:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  [(PTService *)self ktraceSession];
  ktrace_set_thread_groups_enabled();
  kperf_reset();
  kperf_action_count_set();
  uint64_t v7 = kperf_kdebug_filter_create();
  if (!v7)
  {
    if (a4)
    {
      CFStringRef v17 = @"Unable to create kdebug filter for kperf";
      goto LABEL_48;
    }
LABEL_65:
    BOOL v33 = 0;
    goto LABEL_66;
  }
  uint64_t v8 = v7;
  v9 = [v6 traceGroups];
  unsigned int v10 = [v9 containsObject:&off_100016068];

  if (v10 && ![(PTService *)self _graphicsSamplingInit])
  {
    if (a4)
    {
      CFStringRef v17 = @"Unable to init graphics sampling";
      goto LABEL_48;
    }
    goto LABEL_65;
  }
  int v41 = 0;
  v11 = [v6 traceGroups];
  unsigned int v12 = [v11 containsObject:&off_100016080];

  if (v12
    && ![(PTService *)self _syscallSamplingInitFilter:v8 withSamplers:&v41])
  {
    if (a4)
    {
      CFStringRef v17 = @"Unable to init syscall sampling";
      goto LABEL_48;
    }
    goto LABEL_65;
  }
  v13 = [v6 traceGroups];
  unsigned int v14 = [v13 containsObject:&off_100016098];

  if (!v14) {
    goto LABEL_9;
  }
  if (![(PTService *)self _faultSamplingInitFilter:v8 withSamplers:&v41])
  {
    if (a4)
    {
      CFStringRef v17 = @"Unable to init vmfault sampling";
      goto LABEL_48;
    }
    goto LABEL_65;
  }
  unsigned int v12 = 1;
LABEL_9:
  v15 = [v6 traceGroups];
  unsigned int v16 = [v15 containsObject:&off_1000160B0];

  if (!v16)
  {
    if (!v12) {
      goto LABEL_33;
    }
    goto LABEL_18;
  }
  if ([(PTService *)self _aspSamplingInitFilter:v8 withSamplers:&v41])
  {
LABEL_18:
    if (kperf_kdebug_filter_set())
    {
      uint64_t desc = kperf_kdebug_filter_create_desc();
      if (!a4) {
        goto LABEL_65;
      }
      v19 = "???";
      if (desc) {
        v19 = (const char *)desc;
      }
      goto LABEL_63;
    }
    uint64_t v20 = kperf_kdebug_action_set();
    if (v20)
    {
      if (!a4) {
        goto LABEL_65;
      }
      +[NSString stringWithFormat:@"Unable to set kperf action for kdebug events: %{errno}d", v20];
      goto LABEL_63;
    }
    uint64_t v21 = kperf_action_samplers_set();
    if (v21)
    {
      if (!a4) {
        goto LABEL_65;
      }
      +[NSString stringWithFormat:@"Unable to set samplers for kdebug kperf events: %{errno}d", v21];
      goto LABEL_63;
    }
LABEL_33:
    kperf_kdebug_filter_destroy();
    v22 = [v6 traceGroups];
    unsigned int v23 = [v22 containsObject:&off_1000160C8];

    if (v23)
    {
      for (uint64_t i = 0; i != 52; i += 4)
      {
        [(PTService *)self ktraceSession];
        ktrace_events_range();
      }
      for (uint64_t j = 0; j != 24; j += 8)
      {
        [(PTService *)self ktraceSession];
        ktrace_events_range();
      }
    }
    else
    {
      uint64_t v26 = [v6 traceGroups];
      unsigned int v27 = [v26 containsObject:&off_1000160E0];

      if (v27)
      {
        for (uint64_t k = 0; k != 32; k += 4)
        {
          [(PTService *)self ktraceSession];
          ktrace_events_range();
        }
        char v29 = 1;
        do
        {
          char v30 = v29;
          [(PTService *)self ktraceSession];
          ktrace_events_range();
          char v29 = 0;
        }
        while ((v30 & 1) != 0);
      }
    }
    v31 = [v6 traceGroups];
    unsigned int v32 = [v31 containsObject:&off_1000160F8];

    if (v32)
    {
      [v6 includeKernelStacks];
      if (kperf_action_samplers_set())
      {
        if (a4)
        {
          CFStringRef v17 = @"Unable to set samplers for kperf timer action";
          goto LABEL_48;
        }
        goto LABEL_65;
      }
      kperf_timer_count_set();
      uint64_t v34 = 1000000 * (void)[v6 callstackSamplingRateMS];
      kperf_ns_to_ticks();
      if (kperf_timer_period_set())
      {
        if (!a4) {
          goto LABEL_65;
        }
        +[NSString stringWithFormat:@"Unable to set kperf timer period to %llu ns", v34];
        goto LABEL_63;
      }
      if (kperf_timer_period_get())
      {
        if (!a4) {
          goto LABEL_65;
        }
        CFStringRef v35 = @"Unable to retrieve kperf timer period";
LABEL_55:
        *a4 = +[NSError error:0 description:v35];
        goto LABEL_65;
      }
      uint64_t v36 = kperf_ticks_to_ns();
      if (v36 != v34)
      {
        if (!a4) {
          goto LABEL_65;
        }
        v38 = +[NSString stringWithFormat:@"Unable to set the callstack sampling rate requested.                            Kperf timer period could only be set to %llu ns", v36];
        uint64_t v39 = 3;
        goto LABEL_64;
      }
      if (kperf_timer_action_set())
      {
        if (!a4) {
          goto LABEL_65;
        }
        CFStringRef v35 = @"Unable to set kperf timer action";
        goto LABEL_55;
      }
    }
    [(PTService *)self ktraceSession];
    BOOL v33 = 1;
    ktrace_set_vnode_paths_enabled();
    uint64_t v37 = kperf_sample_set();
    if (!v37) {
      goto LABEL_66;
    }
    if (!a4) {
      goto LABEL_65;
    }
    +[NSString stringWithFormat:@"Could not enable sampling: %{errno}d", v37];
    v38 = LABEL_63:;
    uint64_t v39 = 0;
LABEL_64:
    *a4 = +[NSError error:v39 description:v38];

    goto LABEL_65;
  }
  if (!a4) {
    goto LABEL_65;
  }
  CFStringRef v17 = @"Unable to init asp sampling";
LABEL_48:
  +[NSError error:0 description:v17];
  BOOL v33 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_66:

  return v33;
}

- (BOOL)_validSymbolicationPreferences
{
  CFArrayRef v2 = (const __CFArray *)CFPreferencesCopyAppValue(@"DBGFileMappedPaths", @"com.apple.DebugSymbols");
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFArrayGetTypeID() && CFArrayGetCount(v3) >= 1)
    {
      CFIndex v5 = 0;
      int v6 = 0;
      int v7 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v5);
        CFTypeID v9 = CFGetTypeID(ValueAtIndex);
        if (v9 == CFStringGetTypeID()) {
          v7 |= CFEqual(ValueAtIndex, @"/Library/Caches/com.apple.bni.symbols/bursar.apple.com/uuids");
        }
        CFTypeID v10 = CFGetTypeID(ValueAtIndex);
        if (v10 == CFStringGetTypeID()) {
          v6 |= CFEqual(ValueAtIndex, @"/Library/Caches/com.apple.bni.symbols/uuidsymmap.apple.com/uuids");
        }
        ++v5;
      }
      while (CFArrayGetCount(v3) > v5);
      CFRelease(v3);
      if (v7 & v6)
      {
        LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"XBSCopyExecutable", @"com.apple.dsymForUUID", 0) != 0;
        return (char)v2;
      }
    }
    else
    {
      CFRelease(v3);
    }
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)_symbolicateKtraceFile:(id)a3
{
  id v3 = a3;
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (has_internal_diagnostics)
  {
    if (v5)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Symbolicating Performance Trace", (uint8_t *)v17, 2u);
    }
    id v6 = [v3 path];
    [v6 UTF8String];
    uint64_t v7 = ktrace_file_open();

    if (v7)
    {
      Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
      CFArrayAppendValue(Mutable, @"/");
      v17[0] = Mutable;
      v17[1] = 1;
      ktrace_create_dsym_search_configuration();
      ktrace_symbolicate_file();
      ktrace_free_dsym_search_configuration();
      ktrace_file_close();
      CFRelease(Mutable);
    }
    else
    {
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v9) {
        sub_10000C620(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else if (v5)
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Skipping symbolication because of OS variant.", (uint8_t *)v17, 2u);
  }
}

- (BOOL)_appendLogContentToKtraceFile:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PTService *)self activeConfig];
  unsigned int v8 = [v7 includeOSLogs];

  if (v8) {
    uint64_t v9 = 71;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(PTService *)self activeConfig];
  unsigned int v11 = [v10 includeOSSignposts];

  if (v11) {
    uint64_t v12 = v9 | 0x20;
  }
  else {
    uint64_t v12 = v9;
  }
  if (!v12)
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      sub_10000C65C(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!a4) {
        goto LABEL_27;
      }
    }
    else if (!a4)
    {
      goto LABEL_27;
    }
    CFStringRef v27 = @"Failed to append logs due to missing flags.";
    goto LABEL_23;
  }
  uint64_t v13 = [(PTService *)self startTime];

  if (!v13)
  {
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      sub_10000C698(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!a4) {
        goto LABEL_27;
      }
    }
    else if (!a4)
    {
      goto LABEL_27;
    }
    CFStringRef v27 = @"Unable to append logs due to missing startTime.";
LABEL_23:
    +[NSError error:0 description:v27];
    BOOL v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Starting to append logs.", buf, 2u);
  }
  id v14 = [v6 path];
  [v14 UTF8String];
  uint64_t v15 = ktrace_file_open();

  if (!v15)
  {
    uint64_t v37 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000C6D4();
      if (!a4) {
        goto LABEL_27;
      }
    }
    else if (!a4)
    {
      goto LABEL_27;
    }
    v38 = +[NSString stringWithFormat:@"Failed to open file to append logs: %{errno}d", v37];
    *a4 = +[NSError error:0 description:v38];

    goto LABEL_27;
  }
  uint64_t v16 = [(PTService *)self startTime];
  uint64_t appended = ktrace_file_append_local_log_content();

  if (appended)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000C744();
      if (!a4) {
        goto LABEL_16;
      }
    }
    else if (!a4)
    {
LABEL_16:
      ktrace_file_close();
LABEL_27:
      BOOL v36 = 0;
      goto LABEL_28;
    }
    v18 = +[NSString stringWithFormat:@"Failed to append logs: %{errno}d", appended];
    *a4 = +[NSError error:0 description:v18];

    goto LABEL_16;
  }
  ktrace_file_close();
  BOOL v36 = 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Done appending logs.", v40, 2u);
  }
LABEL_28:

  return v36;
}

- (BOOL)_postProcessKtraceFile:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 path];
  [v7 UTF8String];
  uint64_t v8 = ktrace_file_open();

  if (v8)
  {
    ktrace_file_append_live_ariadne_signpost_specs();
    ktrace_file_close();
    if (ktrace_session_create())
    {
      ktrace_set_execnames_enabled();
      ktrace_session_set_event_names_enabled();
      uint64_t v27 = 0;
      BOOL v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v30 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      char v26 = 1;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v24[3] = 0;
      ktrace_events_all();
      uint64_t v9 = dispatch_semaphore_create(0);
      ktrace_set_completion_handler();
      id v10 = [v6 path];
      [v10 UTF8String];
      uint64_t v11 = ktrace_set_file();

      if (v11)
      {
        if (a4)
        {
          uint64_t v12 = +[NSString stringWithFormat:@"Failed to open trace file for post-processing: %{errno}d", v11];
          uint64_t v13 = +[NSError error:0 description:v12];
LABEL_15:
          *a4 = v13;

          goto LABEL_16;
        }
        goto LABEL_16;
      }
      id v16 = &_dispatch_main_q;
      uint64_t v17 = ktrace_start();

      if (v17)
      {
        if (a4)
        {
          uint64_t v12 = +[NSString stringWithFormat:@"Failed to parse trace file for post-processing: %{errno}d", v17];
          uint64_t v13 = +[NSError error:0 description:v12];
          goto LABEL_15;
        }
LABEL_16:
        ktrace_session_destroy();
        goto LABEL_17;
      }
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      ktrace_session_destroy();
      if (v28[3])
      {
        if (a4)
        {
          +[NSError error:5 description:@"Events were lost during tracing. Trace will be unreadable"];
          BOOL v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
LABEL_17:
        BOOL v15 = 0;
LABEL_18:

        _Block_object_dispose(v24, 8);
        _Block_object_dispose(v25, 8);
        _Block_object_dispose(&v27, 8);
        goto LABEL_19;
      }
      BOOL v19 = [(PTService *)self activeConfig];
      if ([v19 includeOSLogs])
      {
      }
      else
      {
        uint64_t v20 = [(PTService *)self activeConfig];
        unsigned int v21 = [v20 includeOSSignposts];

        if (!v21) {
          goto LABEL_28;
        }
      }
      if (![(PTService *)self _appendLogContentToKtraceFile:v6 withError:a4]|| *a4)
      {
        goto LABEL_17;
      }
LABEL_28:
      uint64_t v22 = [(PTService *)self activeConfig];
      unsigned int v23 = [v22 symbolicate];

      if (v23) {
        [(PTService *)self _symbolicateKtraceFile:v6];
      }
      BOOL v15 = 1;
      goto LABEL_18;
    }
    if (a4)
    {
      CFStringRef v14 = @"Failed to create the tracing session for post-processing";
      goto LABEL_10;
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  if (!a4) {
    goto LABEL_11;
  }
  CFStringRef v14 = @"Failed to open the trace file to append specs";
LABEL_10:
  +[NSError error:0 description:v14];
  BOOL v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v15;
}

- (BOOL)_markPurgable:(id)a3 withUrgency:(unint64_t)a4
{
  unint64_t v9 = a4 | 0x10005;
  id v4 = [a3 path];
  int v5 = open((const char *)[v4 UTF8String], 0);

  if (v5 < 0)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    sub_10000C824();
    goto LABEL_6;
  }
  if (ffsctl(v5, 0xC0084A44uLL, &v9, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C7B4();
    }
    close(v5);
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Marked file purgeable", v8, 2u);
  }
  close(v5);
  LOBYTE(v6) = 1;
  return v6;
}

- (id)_generateToken:(id)a3
{
  id v4 = [a3 path];
  [v4 UTF8String];
  int v5 = [(PTService *)self activeConfig];
  [v5 ownerPID];
  BOOL v6 = (void *)sandbox_extension_issue_file_to_process_by_pid();

  if (v6)
  {
    id v7 = +[NSString stringWithUTF8String:v6];
    free(v6);
  }
  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_10000C8A0(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    id v7 = 0;
  }
  return v7;
}

- (void)startPerformanceTrace:(id)a3
{
  id v4 = a3;
  if ([v4 useTraceRecord]) {
    [(PTService *)self _startPerformanceTrace:v4];
  }
  else {
    [(PTService *)self _startPerformanceTraceLegacy:v4];
  }
}

- (void)_startPerformanceTrace:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Starting PerformanceTrace", buf, 2u);
  }
  if ([(PTService *)self ktraceRecording] || [(PTService *)self ktraceSession])
  {
    int v5 = [(PTService *)self activeConfig];

    if (v5)
    {
      BOOL v6 = [(PTService *)self activeConfig];
      id v7 = [v6 ownerName];
      BOOL v8 = [(PTService *)self activeConfig];
      uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Tracing is already in progress by another PerformanceTrace client: %@ [%i]", v7, [v8 ownerPID]);
      id v10 = +[NSError error:2 description:v9];

      uint64_t v11 = [(PTService *)self connection];
      id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146A0];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = +[NSError error:2 description:@"Tracing is already in progress by another PerformanceTrace client: Unknown"];
      uint64_t v13 = [(PTService *)self connection];
      id v12 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146C0];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_9:
      }
        sub_10000C8DC(v10);
    }
LABEL_10:
    [v12 performanceTraceDidStart:v10];
    goto LABEL_11;
  }
  [(PTService *)self setKtraceRecording:ktrace_recording_create()];
  if (![(PTService *)self ktraceRecording])
  {
    id v10 = +[NSError error:0 description:@"Cannot start tracing as Performance Trace failed to create the ktrace recording"];
    BOOL v19 = [(PTService *)self connection];
    id v12 = [v19 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146E0];

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (ktrace_config_create_current())
  {
    if (ktrace_config_get_owner_kind() == 1)
    {
      owner_name = (const char *)ktrace_config_get_owner_name();
      if (strncmp(owner_name, "com.apple.Perfor", 0x20uLL))
      {
        uint64_t v15 = +[NSString stringWithFormat:@"Cannot start tracing as another process already owns foreground tracing: %s [%i]", owner_name, ktrace_config_get_owner_pid()];
        id v10 = +[NSError error:2 description:v15];

        ktrace_config_destroy();
        id v16 = [(PTService *)self activeConfig];

        if (v16)
        {
          uint64_t v17 = [(PTService *)self activeConfig];
          [v17 setTracingActiveTransaction:0];

          [(PTService *)self setActiveConfig:0];
        }
        if ([(PTService *)self ktraceRecording])
        {
          [(PTService *)self ktraceRecording];
          ktrace_recording_destroy();
          kperf_reset();
          [(PTService *)self setKtraceRecording:0];
        }
        [(PTService *)self _graphicsSamplingTeardown];
        v18 = [(PTService *)self connection];
        id v12 = [v18 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014740];

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_10000C964();
      }
      uint64_t v20 = ktrace_reset_existing();
      if (v20)
      {
        unsigned int v21 = +[NSString stringWithFormat:@"ktrace was left in a bad state and cannot be reset: %{errno}d", v20];
        id v10 = +[NSError error:0 description:v21];

        ktrace_config_destroy();
        uint64_t v22 = [(PTService *)self activeConfig];

        if (v22)
        {
          unsigned int v23 = [(PTService *)self activeConfig];
          [v23 setTracingActiveTransaction:0];

          [(PTService *)self setActiveConfig:0];
        }
        if ([(PTService *)self ktraceRecording])
        {
          [(PTService *)self ktraceRecording];
          ktrace_recording_destroy();
          kperf_reset();
          [(PTService *)self setKtraceRecording:0];
        }
        [(PTService *)self _graphicsSamplingTeardown];
        uint64_t v24 = [(PTService *)self connection];
        id v12 = [v24 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014700];

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      uint64_t v25 = kperf_reset();
      if (v25)
      {
        char v26 = +[NSString stringWithFormat:@"kperf was left in a bad state and cannot be reset: %{errno}d", v25];
        id v10 = +[NSError error:0 description:v26];

        ktrace_config_destroy();
        uint64_t v27 = [(PTService *)self activeConfig];

        if (v27)
        {
          BOOL v28 = [(PTService *)self activeConfig];
          [v28 setTracingActiveTransaction:0];

          [(PTService *)self setActiveConfig:0];
        }
        if ([(PTService *)self ktraceRecording])
        {
          [(PTService *)self ktraceRecording];
          ktrace_recording_destroy();
          kperf_reset();
          [(PTService *)self setKtraceRecording:0];
        }
        [(PTService *)self _graphicsSamplingTeardown];
        uint64_t v29 = [(PTService *)self connection];
        id v12 = [v29 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014720];

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    ktrace_config_destroy();
  }
  [(PTService *)self setActiveConfig:v4];
  uint64_t v30 = +[NSDate date];
  [(PTService *)self setStartTime:v30];

  id v10 = objc_alloc_init((Class)NSDateFormatter);
  [v10 setDateStyle:1];
  [v10 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  uint64_t v31 = [v4 traceName];
  uint64_t v32 = v31;
  if (v31)
  {
    id v12 = v31;
  }
  else
  {
    uint64_t v33 = [(PTService *)self startTime];
    uint64_t v34 = [v10 stringFromDate:v33];
    id v12 = +[NSString stringWithFormat:@"trace_%@.atrc", v34];
  }
  uint64_t v35 = [v4 traceDirectoryURL];
  uint64_t v36 = [v35 path];
  uint64_t v37 = (void *)v36;
  v38 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
  if (v36) {
    v38 = (__CFString *)v36;
  }
  uint64_t v39 = v38;

  v40 = +[NSFileManager defaultManager];
  NSFileAttributeKey v108 = NSFilePosixPermissions;
  v109 = &off_100016110;
  int v41 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
  id v104 = 0;
  unsigned __int8 v42 = [v40 createDirectoryAtPath:v39 withIntermediateDirectories:1 attributes:v41 error:&v104];
  id v43 = v104;
  v44 = v43;
  if (v42)
  {
    v45 = [(__CFString *)v39 stringByAppendingPathComponent:v12];
    id v103 = 0;
    uint64_t v46 = [(PTService *)self _traceRecordArgsArrayFromConfig:v4 outputFilePath:v45 error:&v103];
    id v79 = v103;
    v80 = (void *)v46;
    if (v79)
    {
      v47 = [(PTService *)self activeConfig];

      if (v47)
      {
        v48 = [(PTService *)self activeConfig];
        [v48 setTracingActiveTransaction:0];

        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceRecording])
      {
        [(PTService *)self ktraceRecording];
        ktrace_recording_destroy();
        kperf_reset();
        [(PTService *)self setKtraceRecording:0];
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v49 = [(PTService *)self connection];
      v50 = [v49 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014780];

      v51 = v79;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000C8DC(v79);
      }
      [v50 performanceTraceDidStart:v79];
    }
    else
    {
      v85 = v44;
      [(PTService *)self ktraceRecording];
      ktrace_recording_set_streams();
      v58 = (void *)v46;
      v59 = (void *)os_transaction_create();
      [v4 setTracingActiveTransaction:v59];

      [(PTService *)self ktraceRecording];
      v95 = _NSConcreteStackBlock;
      uint64_t v96 = 3221225472;
      v97 = sub_100003F08;
      v98 = &unk_100014828;
      v99 = self;
      v77 = v45;
      id v100 = v45;
      id v101 = v4;
      v78 = v41;
      id v102 = v41;
      ktrace_recording_follow_notifications();
      v60 = dispatch_get_global_queue(25, 0);
      v61 = dispatch_queue_create_with_target_V2("com.apple.PerformanceTrace.tracingStartedNotificationQueue", 0, v60);
      queue = v60;

      int out_token = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000047B8;
      handler[3] = &unk_100014870;
      handler[4] = self;
      v75 = v61;
      notify_register_dispatch("com.apple.PerformanceTrace.StartedTraceRecord", &out_token, v61, handler);
      signed int v74 = [v58 count];
      v86 = malloc_type_calloc(v74 + 1, 8uLL, 0x10040436913F5uLL);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v62 = v58;
      id v63 = [v62 countByEnumeratingWithState:&v89 objects:v107 count:16];
      if (v63)
      {
        id v64 = v63;
        v82 = v40;
        v84 = v39;
        id v73 = v10;
        v65 = 0;
        uint64_t v66 = *(void *)v90;
        do
        {
          v67 = 0;
          uint64_t v68 = (void)v65 << 32;
          uint64_t v69 = (int)v65;
          v70 = (char *)&v86[(int)v65];
          do
          {
            if (*(void *)v90 != v66) {
              objc_enumerationMutation(v62);
            }
            *(void *)&v70[8 * (void)v67] = strdup((const char *)[*(id *)(*((void *)&v89 + 1) + 8 * (void)v67) UTF8String]);
            v67 = (char *)v67 + 1;
            v68 += (uint64_t)&_mh_execute_header;
          }
          while (v64 != v67);
          id v64 = [v62 countByEnumeratingWithState:&v89 objects:v107 count:16];
          v65 = (char *)v67 + v69;
        }
        while (v64);
        uint64_t v71 = v68 >> 32;
        id v10 = v73;
        v40 = v82;
        uint64_t v39 = v84;
      }
      else
      {
        uint64_t v71 = 0;
      }

      v86[v71] = 0;
      v51 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v72 = [v62 componentsJoinedByString:@" "];
        *(_DWORD *)buf = 138412290;
        v106 = v72;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trace record args: %@", buf, 0xCu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004898;
      block[3] = &unk_1000148B8;
      signed int v88 = v74;
      block[4] = self;
      block[5] = v86;
      dispatch_async(queue, block);

      v45 = v77;
      int v41 = v78;
      v44 = v85;
    }
  }
  else
  {
    v81 = v40;
    v83 = v39;
    v52 = [v43 localizedDescription];
    v53 = +[NSString stringWithFormat:@"Cannot start tracing as Performance Trace cannot write to the target directory: %@", v52];
    v54 = +[NSError error:3 description:v53 underlyingError:v44];

    v55 = [(PTService *)self activeConfig];

    if (v55)
    {
      v56 = [(PTService *)self activeConfig];
      [v56 setTracingActiveTransaction:0];

      [(PTService *)self setActiveConfig:0];
    }
    if ([(PTService *)self ktraceRecording])
    {
      [(PTService *)self ktraceRecording];
      ktrace_recording_destroy();
      kperf_reset();
      [(PTService *)self setKtraceRecording:0];
    }
    [(PTService *)self _graphicsSamplingTeardown];
    v57 = [(PTService *)self connection];
    v51 = [v57 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014760];

    v40 = v81;
    v45 = v54;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C8DC(v54);
    }
    [v51 performanceTraceDidStart:v54];
    uint64_t v39 = v83;
  }

LABEL_11:
}

- (id)_traceRecordArgsArrayFromConfig:(id)a3 outputFilePath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[NSMutableArray arrayWithObject:@"record"];
  id v44 = v8;
  id v10 = +[NSArray arrayWithObjects:&v44 count:1];
  [v9 addObjectsFromArray:v10];

  uint64_t v11 = [v7 planNameOrPath];

  if (v11)
  {
    id v12 = [v7 planNameOrPath];
    unsigned int v13 = [v12 isAbsolutePath];

    uint64_t v14 = [v7 planNameOrPath];
    uint64_t v15 = (void *)v14;
    if (v13)
    {
      v43[0] = v14;
      v43[1] = @"--experimental";
      id v16 = +[NSArray arrayWithObjects:v43 count:2];
      [v9 addObjectsFromArray:v16];
    }
    else
    {
      [v9 addObject:v14];
    }
  }
  uint64_t v17 = [v7 traceGroups];
  unsigned int v18 = [v17 containsObject:&off_100016068];

  if (v18) {
    [v9 addObjectsFromArray:&off_1000162A8];
  }
  BOOL v19 = [v7 traceGroups];
  unsigned int v20 = [v19 containsObject:&off_100016080];

  if (v20) {
    [v9 addObjectsFromArray:&off_1000162C0];
  }
  unsigned int v21 = [v7 traceGroups];
  unsigned int v22 = [v21 containsObject:&off_100016098];

  if (v22) {
    [v9 addObjectsFromArray:&off_1000162D8];
  }
  unsigned int v23 = [v7 traceGroups];
  unsigned int v24 = [v23 containsObject:&off_1000160B0];

  if (v24) {
    [v9 addObjectsFromArray:&off_1000162F0];
  }
  uint64_t v25 = [v7 traceGroups];
  unsigned int v26 = [v25 containsObject:&off_1000160F8];

  if (v26 && [v7 callstackSamplingRateMS] != (id)1)
  {
    if (!a5) {
      goto LABEL_54;
    }
    uint64_t v30 = +[NSString stringWithFormat:@"Callstack sampling rate other than 1ms not supported"];
    uint64_t v31 = 0;
    goto LABEL_53;
  }
  id v27 = [v7 traceType];
  if (v27 == (id)2)
  {
    if (![v7 traceDurationSecs])
    {
      if (!a5) {
        goto LABEL_54;
      }
      +[NSString stringWithFormat:@"Non-zero traceDurationSecs must be specified when using ringbuffer mode", v39];
      goto LABEL_52;
    }
    v41[0] = @"--trailing-duration";
    BOOL v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lus", [v7 traceDurationSecs]);
    v41[1] = v28;
    uint64_t v29 = v41;
    goto LABEL_24;
  }
  if (v27 != (id)1)
  {
    if (!a5) {
      goto LABEL_54;
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot start tracing as an unknown trace type is used: %lu", [v7 traceType]);
    goto LABEL_52;
  }
  if ([v7 traceDurationSecs])
  {
    v42[0] = @"--end-after-duration";
    BOOL v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lus", [v7 traceDurationSecs]);
    v42[1] = v28;
    uint64_t v29 = v42;
LABEL_24:
    uint64_t v32 = +[NSArray arrayWithObjects:v29 count:2];
    [v9 addObjectsFromArray:v32];
  }
  if ([v7 kernelBufferSizeMB])
  {
    if ((unint64_t)[v7 kernelBufferSizeMB] >= 0x401)
    {
      if (!a5) {
        goto LABEL_54;
      }
      +[NSString stringWithFormat:@"Cannot start tracing as PerformanceTrace cannot have a kernel buffer size larger than %dMB.", 1024];
      uint64_t v30 = LABEL_52:;
      uint64_t v31 = 3;
LABEL_53:
      *a5 = +[NSError error:v31 description:v30];

      a5 = 0;
      goto LABEL_54;
    }
    v40[0] = @"--unsafe";
    v40[1] = @"--kdebug-buffer-size";
    uint64_t v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lumb", [v7 kernelBufferSizeMB]);
    v40[2] = v33;
    uint64_t v34 = +[NSArray arrayWithObjects:v40 count:3];
    [v9 addObjectsFromArray:v34];
  }
  if ([v7 enableSwiftUITracing]) {
    [v9 addObjectsFromArray:&off_100016308];
  }
  if ([v7 overrideIncludeOSLogs])
  {
    if ([v7 includeOSLogs]) {
      uint64_t v35 = &off_100016320;
    }
    else {
      uint64_t v35 = &off_100016338;
    }
    [v9 addObjectsFromArray:v35];
  }
  if ([v7 overrideIncludeOSSignposts])
  {
    if ([v7 includeOSSignposts]) {
      uint64_t v36 = &off_100016350;
    }
    else {
      uint64_t v36 = &off_100016368;
    }
    [v9 addObjectsFromArray:v36];
  }
  if ([v7 overrideSymbolicate])
  {
    if ([v7 symbolicate]) {
      uint64_t v37 = &off_100016380;
    }
    else {
      uint64_t v37 = &off_100016398;
    }
    [v9 addObjectsFromArray:v37];
  }
  [v9 addObjectsFromArray:&off_1000163B0];
  [v9 addObjectsFromArray:&off_1000163C8];
  a5 = (id *)[v9 copy];
LABEL_54:

  return a5;
}

- (void)_startPerformanceTraceLegacy:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Starting PerformanceTrace (legacy)", buf, 2u);
  }
  if (![(PTService *)self ktraceRecording] && ![(PTService *)self ktraceSession])
  {
    [(PTService *)self setKtraceSession:ktrace_session_create()];
    if (![(PTService *)self ktraceSession])
    {
      id v10 = +[NSError error:0 description:@"Cannot start tracing as Performance Trace failed to create the ktrace session"];
      unsigned int v18 = [(PTService *)self connection];
      id v12 = [v18 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014918];

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    [(PTService *)self ktraceSession];
    ktrace_set_execnames_enabled();
    [(PTService *)self ktraceSession];
    ktrace_session_set_event_names_enabled();
    if (ktrace_config_create_current())
    {
      if (ktrace_config_get_owner_kind() == 1)
      {
        owner_name = (const char *)ktrace_config_get_owner_name();
        if (strncmp(owner_name, "com.apple.Perfor", 0x20uLL))
        {
          uint64_t v15 = +[NSString stringWithFormat:@"Cannot start tracing as another process already owns foreground tracing: %s [%i]", owner_name, ktrace_config_get_owner_pid()];
          id v10 = +[NSError error:2 description:v15];

          ktrace_config_destroy();
          id v16 = [(PTService *)self activeConfig];

          if (v16) {
            [(PTService *)self setActiveConfig:0];
          }
          if ([(PTService *)self ktraceSession])
          {
            [(PTService *)self ktraceSession];
            ktrace_session_destroy();
            kperf_reset();
            [(PTService *)self setKtraceSession:0];
          }
          [(PTService *)self _graphicsSamplingTeardown];
          uint64_t v17 = [(PTService *)self connection];
          id v12 = [v17 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014978];

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10000C964();
        }
        uint64_t v19 = ktrace_reset_existing();
        if (v19)
        {
          unsigned int v20 = +[NSString stringWithFormat:@"ktrace was left in a bad state and cannot be reset: %{errno}d", v19];
          id v10 = +[NSError error:0 description:v20];

          ktrace_config_destroy();
          unsigned int v21 = [(PTService *)self activeConfig];

          if (v21) {
            [(PTService *)self setActiveConfig:0];
          }
          if ([(PTService *)self ktraceSession])
          {
            [(PTService *)self ktraceSession];
            ktrace_session_destroy();
            kperf_reset();
            [(PTService *)self setKtraceSession:0];
          }
          [(PTService *)self _graphicsSamplingTeardown];
          unsigned int v22 = [(PTService *)self connection];
          id v12 = [v22 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014938];

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
        uint64_t v23 = kperf_reset();
        if (v23)
        {
          unsigned int v24 = +[NSString stringWithFormat:@"kperf was left in a bad state and cannot be reset: %{errno}d", v23];
          id v10 = +[NSError error:0 description:v24];

          ktrace_config_destroy();
          uint64_t v25 = [(PTService *)self activeConfig];

          if (v25) {
            [(PTService *)self setActiveConfig:0];
          }
          if ([(PTService *)self ktraceSession])
          {
            [(PTService *)self ktraceSession];
            ktrace_session_destroy();
            kperf_reset();
            [(PTService *)self setKtraceSession:0];
          }
          [(PTService *)self _graphicsSamplingTeardown];
          unsigned int v26 = [(PTService *)self connection];
          id v12 = [v26 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014958];

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
      ktrace_config_destroy();
    }
    [(PTService *)self setActiveConfig:v4];
    id v27 = +[NSDate date];
    [(PTService *)self setStartTime:v27];

    id v10 = objc_alloc_init((Class)NSDateFormatter);
    [v10 setDateStyle:1];
    [v10 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    BOOL v28 = [v4 traceName];
    uint64_t v29 = v28;
    if (v28)
    {
      id v12 = v28;
    }
    else
    {
      uint64_t v30 = [(PTService *)self startTime];
      uint64_t v31 = [v10 stringFromDate:v30];
      id v12 = +[NSString stringWithFormat:@"trace_%@.ktrace", v31];
    }
    uint64_t v32 = [v4 traceDirectoryURL];
    uint64_t v33 = [v32 path];
    uint64_t v34 = (void *)v33;
    uint64_t v35 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
    if (v33) {
      uint64_t v35 = (__CFString *)v33;
    }
    uint64_t v36 = v35;

    uint64_t v37 = +[NSFileManager defaultManager];
    NSFileAttributeKey v105 = NSFilePosixPermissions;
    v106 = &off_100016110;
    v38 = +[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
    id v103 = 0;
    uint64_t v96 = v37;
    unsigned __int8 v39 = [v37 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:v38 error:&v103];
    id v40 = v103;
    int v41 = v40;
    if ((v39 & 1) == 0)
    {
      v94 = v36;
      v51 = [v40 localizedDescription];
      v52 = +[NSString stringWithFormat:@"Cannot start tracing as Performance Trace cannot write to the target directory: %@", v51];
      v53 = +[NSError error:3 description:v52 underlyingError:v41];

      v54 = [(PTService *)self activeConfig];

      if (v54) {
        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceSession])
      {
        [(PTService *)self ktraceSession];
        ktrace_session_destroy();
        kperf_reset();
        [(PTService *)self setKtraceSession:0];
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v55 = [(PTService *)self connection];
      id v44 = [v55 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014998];

      uint64_t v36 = v94;
      v50 = v96;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000C8DC(v53);
      }
      [v44 performanceTraceDidStart:v53];
      goto LABEL_104;
    }
    uint64_t v42 = [(__CFString *)v36 stringByAppendingPathComponent:v12];
    id v102 = 0;
    unsigned __int8 v43 = [(PTService *)self _configureKtraceSession:v4 withError:&v102];
    id v44 = v102;
    long long v92 = (void *)v42;
    if (v44 || (v43 & 1) == 0)
    {
      v56 = [(PTService *)self activeConfig];

      if (v56) {
        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceSession])
      {
        [(PTService *)self ktraceSession];
        ktrace_session_destroy();
        kperf_reset();
        [(PTService *)self setKtraceSession:0];
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v57 = [(PTService *)self connection];
      v49 = [v57 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149B8];

      v50 = v96;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000C8DC(v44);
      }
      [v49 performanceTraceDidStart:v44];
      goto LABEL_103;
    }
    long long v89 = v41;
    if ((unint64_t)[v4 kernelBufferSizeMB] >= 0x401)
    {
      v45 = +[NSString stringWithFormat:@"Cannot start tracing as PerformanceTrace cannot have a kernel buffer size larger than %dMB.", 1024];
      long long v90 = +[NSError error:3 description:v45];

      uint64_t v46 = [(PTService *)self activeConfig];

      if (v46) {
        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceSession])
      {
        [(PTService *)self ktraceSession];
        ktrace_session_destroy();
        kperf_reset();
        [(PTService *)self setKtraceSession:0];
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v47 = [(PTService *)self connection];
      v48 = [v47 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149D8];

      int v41 = v89;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000C8DC(v90);
      }
      v49 = v90;
      [v48 performanceTraceDidStart:v90];

      v50 = v96;
      goto LABEL_103;
    }
    v95 = v36;
    [(PTService *)self ktraceSession];
    [v4 kernelBufferSizeMB];
    ktrace_set_buffer_size();
    [(PTService *)self ktraceSession];
    [v4 kernelBufferDrainQoS];
    ktrace_set_collection_qos();
    [(PTService *)self ktraceSession];
    [v4 kernelBufferDrainRateMS];
    ktrace_set_collection_interval();
    v58 = (void *)v42;
    v59 = (void *)os_transaction_create();
    [(PTService *)self ktraceSession];
    void handler[5] = _NSConcreteStackBlock;
    handler[6] = 3221225472;
    handler[7] = sub_10000629C;
    handler[8] = &unk_100014A20;
    handler[9] = self;
    id v60 = v58;
    id v98 = v60;
    id v61 = v4;
    id v99 = v61;
    v93 = v38;
    id v100 = v38;
    id v91 = v59;
    id v101 = v91;
    ktrace_set_completion_handler();
    id v62 = [v61 traceType];
    if (v62 == (id)2)
    {
      [(PTService *)self ktraceSession];
      uint64_t started = ktrace_configure();
    }
    else
    {
      if (v62 != (id)1)
      {
        uint64_t v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot start tracing as an unknown trace type is used: %lu", [v61 traceType]);
        v65 = +[NSError error:3 description:v69];

        v70 = [(PTService *)self activeConfig];

        v38 = v93;
        if (v70) {
          [(PTService *)self setActiveConfig:0];
        }
        int v41 = v89;
        if ([(PTService *)self ktraceSession])
        {
          [(PTService *)self ktraceSession];
          ktrace_session_destroy();
          kperf_reset();
          [(PTService *)self setKtraceSession:0];
        }
        [(PTService *)self _graphicsSamplingTeardown];
        uint64_t v71 = [(PTService *)self connection];
        uint64_t v68 = [v71 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A40];

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_88;
        }
LABEL_87:
        sub_10000C8DC(v65);
LABEL_88:
        [v68 performanceTraceDidStart:v65];

        v50 = v96;
LABEL_102:

        v49 = v91;
LABEL_103:

        v53 = v92;
LABEL_104:

        goto LABEL_11;
      }
      [(PTService *)self ktraceSession];
      [v60 UTF8String];
      uint64_t started = ktrace_start_writing_path();
    }
    if (started)
    {
      id v64 = +[NSString stringWithFormat:@"Cannot start tracing as Performance Trace failed to write to the expected output path: %{errno}d", started];
      v65 = +[NSError error:3 description:v64];

      uint64_t v66 = [(PTService *)self activeConfig];

      int v41 = v89;
      if (v66) {
        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceSession])
      {
        [(PTService *)self ktraceSession];
        ktrace_session_destroy();
        kperf_reset();
        [(PTService *)self setKtraceSession:0];
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v67 = [(PTService *)self connection];
      uint64_t v68 = [v67 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A60];

      v38 = v93;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      goto LABEL_87;
    }
    uint64_t v72 = (uint64_t)[v61 traceTimeoutS];
    if ([v61 traceTimeoutS] && (unint64_t)objc_msgSend(v61, "traceTimeoutS") < 0x1F) {
      goto LABEL_93;
    }
    uint64_t v73 = [(PTService *)self connection];
    if (!v73) {
      goto LABEL_95;
    }
    signed int v74 = (void *)v73;
    v75 = [(PTService *)self connection];
    unsigned __int8 v76 = [(PTService *)self _connectionIsEntitled:v75 toEntitlement:@"com.apple.PerformanceTrace.OverrideTimeout"];

    if (v76)
    {
LABEL_93:
      v50 = v96;
      v38 = v93;
      int v41 = v89;
      if (!v72) {
        goto LABEL_99;
      }
    }
    else
    {
LABEL_95:
      BOOL v77 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v77) {
        sub_10000CBBC(v77, v78, v79, v80, v81, v82, v83, v84);
      }
      uint64_t v72 = 30;
      v50 = v96;
      v38 = v93;
      int v41 = v89;
    }
    v85 = v50;
    v86 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_time_t v87 = dispatch_time(0, 1000000000 * v72);
    dispatch_source_set_timer(v86, v87, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006788;
    handler[3] = &unk_100014660;
    handler[4] = self;
    dispatch_source_set_event_handler(v86, handler);
    dispatch_activate(v86);
    [(PTService *)self setActiveTimer:v86];

    v50 = v85;
LABEL_99:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Sucessfully started Performance Trace", buf, 2u);
    }
    signed int v88 = [(PTService *)self connection];
    v65 = [v88 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014A80];

    [v65 performanceTraceDidStart:0];
    uint64_t v36 = v95;
    goto LABEL_102;
  }
  int v5 = [(PTService *)self activeConfig];

  if (v5)
  {
    BOOL v6 = [(PTService *)self activeConfig];
    id v7 = [v6 ownerName];
    id v8 = [(PTService *)self activeConfig];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Tracing is already in progress by another PerformanceTrace client: %@ [%i]", v7, [v8 ownerPID]);
    id v10 = +[NSError error:2 description:v9];

    uint64_t v11 = [(PTService *)self connection];
    id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000148D8];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
  }
  else
  {
    id v10 = +[NSError error:2 description:@"Tracing is already in progress by another PerformanceTrace client: Unknown"];
    unsigned int v13 = [(PTService *)self connection];
    id v12 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000148F8];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_9:
    }
      sub_10000C8DC(v10);
  }
LABEL_10:
  [v12 performanceTraceDidStart:v10];
LABEL_11:
}

- (void)stopPerformanceTrace
{
  id v3 = [(PTService *)self activeConfig];

  if (v3)
  {
    id v4 = [(PTService *)self activeConfig];
    unsigned int v5 = [v4 useTraceRecord];

    if (v5)
    {
      [(PTService *)self _stopPerformanceTrace];
    }
    else
    {
      [(PTService *)self _stopPerformanceTraceLegacy];
    }
  }
}

- (void)_stopPerformanceTrace
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Stopping Performance Trace", buf, 2u);
  }
  if ([(PTService *)self ktraceRecording])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000CDF0();
    }
    if (notify_post("com.apple.PerformanceTrace.EndTraceRecord")
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000CD80();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Successfully stopped Performance Trace", v15, 2u);
    }
    id v3 = [(PTService *)self connection];
    id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AC0];

    [v4 performanceTraceDidStop:0];
  }
  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_10000CD44(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    id v4 = +[NSError error:4 description:@"No current tracing session exists to stop."];
    unsigned int v13 = [(PTService *)self connection];
    uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AA0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CCBC(v4);
    }
    [v14 performanceTraceDidStop:v4];
  }
}

- (void)_stopPerformanceTraceLegacy
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Stopping PerformanceTrace (legacy)", buf, 2u);
  }
  id v3 = [(PTService *)self activeTimer];
  BOOL v4 = v3 == 0;

  if (!v4)
  {
    BOOL v5 = [(PTService *)self activeTimer];
    dispatch_source_cancel(v5);

    [(PTService *)self setActiveTimer:0];
  }
  if (![(PTService *)self ktraceSession])
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_10000CD44(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    id v16 = +[NSError error:4 description:@"No current tracing session exists to stop."];
    uint64_t v17 = [(PTService *)self connection];
    unsigned int v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014AE0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CE38(v16);
    }
    [v18 performanceTraceDidStop:v16];

    goto LABEL_54;
  }
  uint64_t v6 = [(PTService *)self activeConfig];
  BOOL v7 = [v6 traceType] == (id)1;

  if (!v7)
  {
    uint64_t v19 = [(PTService *)self activeConfig];
    BOOL v20 = [v19 traceType] == (id)2;

    if (!v20) {
      goto LABEL_51;
    }
    *(void *)buf = 0;
    uint64_t v72 = buf;
    uint64_t v73 = 0x2020000000;
    uint64_t v74 = 0;
    uint64_t v74 = ktrace_session_create();
    id v21 = objc_alloc_init((Class)NSDateFormatter);
    [v21 setDateStyle:1];
    [v21 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    unsigned int v22 = [(PTService *)self activeConfig];
    uint64_t v23 = [v22 traceName];
    unsigned int v24 = v23;
    if (v23)
    {
      id v67 = v23;
    }
    else
    {
      uint64_t v25 = +[NSDate date];
      unsigned int v26 = [v21 stringFromDate:v25];
      id v67 = +[NSString stringWithFormat:@"trace_%@.ktrace", v26];
    }
    id v27 = [(PTService *)self activeConfig];
    BOOL v28 = [v27 traceDirectoryURL];
    uint64_t v29 = [v28 path];
    uint64_t v30 = (void *)v29;
    uint64_t v31 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
    if (v29) {
      uint64_t v31 = (__CFString *)v29;
    }
    uint64_t v32 = v31;

    uint64_t v33 = +[NSFileManager defaultManager];
    NSFileAttributeKey v75 = NSFilePosixPermissions;
    unsigned __int8 v76 = &off_100016110;
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v70 = 0;
    unsigned __int8 v35 = [v33 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:v34 error:&v70];
    id v36 = v70;
    uint64_t v37 = v36;
    if (v35)
    {
      id v38 = [(__CFString *)v32 stringByAppendingPathComponent:v67];
      if (*((void *)v72 + 3))
      {
        ktrace_set_execnames_enabled();
        ktrace_session_set_event_names_enabled();
        uint64_t v39 = ktrace_set_use_existing();
        if (!v39)
        {
          v59 = (void *)os_transaction_create();
          id v68 = v38;
          id v69 = v34;
          id v41 = v59;
          ktrace_set_completion_handler();
          [(PTService *)self ktraceSession];
          ktrace_session_free();
          [(PTService *)self setKtraceSession:0];
          id v38 = v68;
          [v38 UTF8String];
          uint64_t started = ktrace_start_writing_path();
          if (started)
          {
            uint64_t v61 = +[NSString stringWithFormat:@"Cannot write ringbuffer trace due to failure to start writing out buffer: %{errno}d", started];
            uint64_t v66 = +[NSError error:0 description:v61];

            id v62 = [(PTService *)self activeConfig];
            LOBYTE(v61) = v62 == 0;

            if ((v61 & 1) == 0) {
              [(PTService *)self setActiveConfig:0];
            }
            if ([(PTService *)self ktraceSession])
            {
              [(PTService *)self ktraceSession];
              ktrace_end();
              [(PTService *)self ktraceSession];
              ktrace_session_destroy();
              kperf_reset();
              [(PTService *)self setKtraceSession:0];
            }
            if (*((void *)v72 + 3))
            {
              ktrace_end();
              ktrace_session_destroy();
              *((void *)v72 + 3) = 0;
            }
            [(PTService *)self _graphicsSamplingTeardown];
            id v63 = [(PTService *)self connection];
            id v64 = [v63 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BA8];

            id v65 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              [v66 description];
              objc_claimAutoreleasedReturnValue();
              sub_10000CEC4();
            }

            [v64 performanceTraceDidStop:v66];
            [v64 performanceTraceDidComplete:0 withToken:0 withError:v66];

            int v57 = 1;
          }
          else
          {
            int v57 = 0;
          }

LABEL_50:
          _Block_object_dispose(buf, 8);
          if (v57) {
            return;
          }
          goto LABEL_51;
        }
        id v40 = +[NSString stringWithFormat:@"Cannot write ringbuffer trace due to failure to find existing session: %{errno}d", v39];
        id v41 = +[NSError error:0 description:v40];

        uint64_t v42 = [(PTService *)self activeConfig];
        BOOL v43 = v42 == 0;

        if (!v43) {
          [(PTService *)self setActiveConfig:0];
        }
        if ([(PTService *)self ktraceSession])
        {
          [(PTService *)self ktraceSession];
          ktrace_end();
          [(PTService *)self ktraceSession];
          ktrace_session_destroy();
          kperf_reset();
          [(PTService *)self setKtraceSession:0];
        }
        if (*((void *)v72 + 3))
        {
          ktrace_end();
          ktrace_session_destroy();
          *((void *)v72 + 3) = 0;
        }
        [(PTService *)self _graphicsSamplingTeardown];
        id v44 = [(PTService *)self connection];
        v45 = [v44 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B40];

        id v46 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [v41 description];
          objc_claimAutoreleasedReturnValue();
          sub_10000CEC4();
        }
      }
      else
      {
        id v41 = +[NSError error:0 description:@"Cannot stop ringbuffer tracing as Performance Trace was unable to generate a ktrace session"];
        v53 = [(PTService *)self activeConfig];
        BOOL v54 = v53 == 0;

        if (!v54) {
          [(PTService *)self setActiveConfig:0];
        }
        if ([(PTService *)self ktraceSession])
        {
          [(PTService *)self ktraceSession];
          ktrace_end();
          [(PTService *)self ktraceSession];
          ktrace_session_destroy();
          kperf_reset();
          [(PTService *)self setKtraceSession:0];
        }
        if (*((void *)v72 + 3))
        {
          ktrace_end();
          ktrace_session_destroy();
          *((void *)v72 + 3) = 0;
        }
        [(PTService *)self _graphicsSamplingTeardown];
        v55 = [(PTService *)self connection];
        v45 = [v55 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B20];

        id v56 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [v41 description];
          objc_claimAutoreleasedReturnValue();
          sub_10000CEC4();
        }
      }

      [v45 performanceTraceDidStop:v41];
      [v45 performanceTraceDidComplete:0 withToken:0 withError:v41];
    }
    else
    {
      v47 = [v36 localizedDescription];
      v48 = +[NSString stringWithFormat:@"Cannot dump ringbuffer trace as Performance Trace cannot write to the target directory: %@", v47];
      id v38 = +[NSError error:3 description:v48 underlyingError:v37];

      v49 = [(PTService *)self activeConfig];
      BOOL v50 = v49 == 0;

      if (!v50) {
        [(PTService *)self setActiveConfig:0];
      }
      if ([(PTService *)self ktraceSession])
      {
        [(PTService *)self ktraceSession];
        ktrace_end();
        [(PTService *)self ktraceSession];
        ktrace_session_destroy();
        kperf_reset();
        [(PTService *)self setKtraceSession:0];
      }
      if (*((void *)v72 + 3))
      {
        ktrace_end();
        ktrace_session_destroy();
        *((void *)v72 + 3) = 0;
      }
      [(PTService *)self _graphicsSamplingTeardown];
      v51 = [(PTService *)self connection];
      id v41 = [v51 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B00];

      id v52 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [v38 description];
        objc_claimAutoreleasedReturnValue();
        sub_10000CEC4();
      }

      [v41 performanceTraceDidStop:v38];
      [v41 performanceTraceDidComplete:0 withToken:0 withError:v38];
    }
    int v57 = 1;
    goto LABEL_50;
  }
  [(PTService *)self ktraceSession];
  ktrace_end();
LABEL_51:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Successfully stopped Performance Trace", buf, 2u);
  }
  v58 = [(PTService *)self connection];
  id v16 = [v58 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BC8];

  [v16 performanceTraceDidStop:0];
LABEL_54:
}

- (void)getCurrentStoredConfig:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Getting Current Config", buf, 2u);
  }
  *(void *)buf = 0;
  unsigned int v18 = buf;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = sub_10000198C;
  id v21 = sub_10000199C;
  id v22 = 0;
  BOOL v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:@"/private/var/tmp/com.apple.PerformanceTrace"];

  if ((v6 & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007FEC;
    v16[3] = &unk_1000145E8;
    v16[4] = buf;
    [(PTService *)self resetConfig:v16];
  }
  BOOL v7 = (id *)(v18 + 40);
  if (*((void *)v18 + 5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CFF8();
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, *((void *)v18 + 5), 0);
  }
  else
  {
    obuint64_t j = 0;
    BOOL v8 = +[NSData dataWithContentsOfFile:@"/private/var/tmp/com.apple.PerformanceTrace" options:1 error:&obj];
    objc_storeStrong(v7, obj);
    if (*((void *)v18 + 5) || !v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CF10();
      }
      (*((void (**)(id, void, void))v4 + 2))(v4, *((void *)v18 + 5), 0);
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = (id *)(v18 + 40);
      id v14 = (id)*((void *)v18 + 5);
      uint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v9 fromData:v8 error:&v14];
      objc_storeStrong(v10, v14);
      if (*((void *)v18 + 5))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10000CF84();
        }
        uint64_t v12 = 0;
        uint64_t v13 = *((void *)v18 + 5);
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v12 = v11;
      }
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, v13, v12);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)applyConfig:(id)a3 withError:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = (void (**)(id, id))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Applying Config", buf, 2u);
  }
  [v5 setSource:3];
  id v12 = 0;
  BOOL v7 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D0DC();
    }
LABEL_11:
    v6[2](v6, v9);

    goto LABEL_12;
  }
  id v11 = 0;
  unsigned __int8 v10 = [v7 writeToFile:@"/private/var/tmp/com.apple.PerformanceTrace" options:1 error:&v11];
  id v9 = v11;
  if (v9 || (v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D06C();
    }
    goto LABEL_11;
  }
  v6[2](v6, 0);
LABEL_12:
}

- (void)resetConfig:(id)a3
{
  id v74 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resetting Config", buf, 2u);
  }
  id v3 = +[PTTraceConfig configWithTemplate:1];
  [v3 setSource:0];
  id v4 = (void *)CFPreferencesCopyValue(@"selectedConfigName", @"com.apple.internal.taptotrace", @"mobile", kCFPreferencesAnyHost);
  v91[0] = @"/Library/Managed Preferences/";
  v91[1] = @"mobile";
  id v5 = [@"com.apple.internal.taptotrace" stringByAppendingString:@".plist"];
  v91[2] = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:v91 count:3];
  BOOL v7 = +[NSURL fileURLWithPathComponents:v6];

  id v8 = [v7 path];
  id v9 = +[NSDictionary dictionaryWithContentsOfFile:v8];

  if (v9)
  {
    unsigned __int8 v10 = [v9 valueForKey:@"selectedConfigName"];

    if (v10)
    {
      uint64_t v11 = [v9 valueForKey:@"selectedConfigName"];

      id v4 = (void *)v11;
    }
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Device has a legacy configuration installed. Resolving config.", buf, 2u);
    }
    [v3 setSymbolicate:0];
    [v3 setTraceType:2];
    [v3 setSource:1];
    if ([v4 isEqualToString:@"audio"])
    {
      [v3 setKernelBufferSizeMB:512];
      id v12 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1000160C8, &off_1000160F8, &off_100016080, &off_100016098, 0);
      [v3 setTraceGroups:v12];
    }
  }
  NSFileAttributeKey v75 = v4;
  unsigned __int8 v76 = v3;
  CFDictionaryRef v13 = CFPreferencesCopyMultiple(0, @"com.apple.PerformanceTrace.config", @"mobile", kCFPreferencesAnyHost);
  v90[0] = @"/Library/Managed Preferences/";
  v90[1] = @"mobile";
  id v14 = [@"com.apple.PerformanceTrace.config" stringByAppendingString:@".plist"];
  v90[2] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v90 count:3];
  id v16 = +[NSURL fileURLWithPathComponents:v15];

  uint64_t v17 = [v16 path];
  unsigned int v18 = +[NSDictionary dictionaryWithContentsOfFile:v17];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v19 = [v18 allKeys];
  id v20 = [v19 countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v84 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        uint64_t v25 = [v18 valueForKey:v24];

        if (v25)
        {
          unsigned int v26 = [v18 valueForKey:v24];
          [(__CFDictionary *)v13 setValue:v26 forKey:v24];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v83 objects:v89 count:16];
    }
    while (v21);
  }

  id v27 = v76;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Device has a configuration installed. Resolving config.", buf, 2u);
    }
    BOOL v28 = [(__CFDictionary *)v13 valueForKey:@"symbolicate"];

    if (v28)
    {
      uint64_t v29 = [(__CFDictionary *)v13 valueForKey:@"symbolicate"];
      objc_msgSend(v76, "setSymbolicate:", objc_msgSend(v29, "BOOLValue"));

      [v76 setSource:2];
    }
    uint64_t v30 = [(__CFDictionary *)v13 valueForKey:@"callstackSamplingRateMS"];

    if (v30)
    {
      uint64_t v31 = [(__CFDictionary *)v13 valueForKey:@"callstackSamplingRateMS"];
      objc_msgSend(v76, "setCallstackSamplingRateMS:", objc_msgSend(v31, "unsignedLongValue"));

      [v76 setSource:2];
    }
    uint64_t v32 = [(__CFDictionary *)v13 valueForKey:@"traceName"];

    if (v32)
    {
      uint64_t v33 = [(__CFDictionary *)v13 valueForKey:@"traceName"];
      id v34 = [v33 copy];
      [v76 setTraceName:v34];

      [v76 setSource:2];
    }
    unsigned __int8 v35 = [(__CFDictionary *)v13 valueForKey:@"compressWhenFinished"];

    if (v35)
    {
      id v36 = [(__CFDictionary *)v13 valueForKey:@"compressWhenFinished"];
      objc_msgSend(v76, "setCompressWhenFinished:", objc_msgSend(v36, "BOOLValue"));

      [v76 setSource:2];
    }
    uint64_t v37 = [(__CFDictionary *)v13 valueForKey:@"includeOSLogs"];

    if (v37)
    {
      id v38 = [(__CFDictionary *)v13 valueForKey:@"includeOSLogs"];
      objc_msgSend(v76, "setIncludeOSLogs:", objc_msgSend(v38, "BOOLValue"));

      [v76 setSource:2];
    }
    uint64_t v39 = [(__CFDictionary *)v13 valueForKey:@"includeOSSignposts"];

    if (v39)
    {
      id v40 = [(__CFDictionary *)v13 valueForKey:@"includeOSSignposts"];
      objc_msgSend(v76, "setIncludeOSSignposts:", objc_msgSend(v40, "BOOLValue"));

      [v76 setSource:2];
    }
    id v41 = [(__CFDictionary *)v13 valueForKey:@"traceTimeoutS"];

    if (v41)
    {
      uint64_t v42 = [(__CFDictionary *)v13 valueForKey:@"traceTimeoutS"];
      objc_msgSend(v76, "setTraceTimeoutS:", objc_msgSend(v42, "unsignedLongValue"));

      [v76 setSource:2];
    }
    BOOL v43 = [(__CFDictionary *)v13 valueForKey:@"skipNotification"];

    if (v43)
    {
      id v44 = [(__CFDictionary *)v13 valueForKey:@"skipNotification"];
      objc_msgSend(v76, "setSkipNotification:", objc_msgSend(v44, "BOOLValue"));

      [v76 setSource:2];
    }
    v45 = [(__CFDictionary *)v13 valueForKey:@"includeKernelStacks"];

    if (v45)
    {
      id v46 = [(__CFDictionary *)v13 valueForKey:@"includeKernelStacks"];
      objc_msgSend(v76, "setIncludeKernelStacks:", objc_msgSend(v46, "BOOLValue"));

      [v76 setSource:2];
    }
    v47 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferSizeMB"];

    if (v47)
    {
      v48 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferSizeMB"];
      objc_msgSend(v76, "setKernelBufferSizeMB:", objc_msgSend(v48, "unsignedLongValue"));

      [v76 setSource:2];
    }
    v49 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferDrainQoS"];

    if (v49)
    {
      BOOL v50 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferDrainQoS"];
      objc_msgSend(v76, "setKernelBufferDrainQoS:", objc_msgSend(v50, "unsignedIntValue"));

      [v76 setSource:2];
    }
    v51 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferDrainRateMS"];

    if (v51)
    {
      id v52 = [(__CFDictionary *)v13 valueForKey:@"kernelBufferDrainRateMS"];
      objc_msgSend(v76, "setKernelBufferDrainRateMS:", objc_msgSend(v52, "unsignedLongValue"));

      [v76 setSource:2];
    }
    v53 = [(__CFDictionary *)v13 valueForKey:@"traceDirectoryURL"];

    if (v53)
    {
      BOOL v54 = [(__CFDictionary *)v13 valueForKey:@"traceDirectoryURL"];
      v55 = +[NSURL fileURLWithPath:v54];
      [v76 setTraceDirectoryURL:v55];

      [v76 setSource:2];
    }
    id v56 = [(__CFDictionary *)v13 valueForKey:@"traceType"];

    if (v56)
    {
      int v57 = [(__CFDictionary *)v13 valueForKey:@"traceType"];
      [v76 setTraceType:traceTypeForString(v57)];

      [v76 setSource:2];
    }
    v58 = [(__CFDictionary *)v13 valueForKey:@"traceGroups"];

    if (v58)
    {
      uint64_t v73 = v16;
      v59 = [(__CFDictionary *)v13 valueForKey:@"traceGroups"];
      id v60 = +[NSMutableArray array];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v61 = v59;
      id v62 = [v61 countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v63; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v80 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
            if (v66 && traceGroupForString(*(void **)(*((void *)&v79 + 1) + 8 * (void)j)))
            {
              id v67 = +[NSNumber numberWithUnsignedInteger:traceGroupForString(v66)];
              [v60 addObject:v67];
            }
          }
          id v63 = [v61 countByEnumeratingWithState:&v79 objects:v88 count:16];
        }
        while (v63);
      }

      id v27 = v76;
      if ([v60 count])
      {
        [v76 setTraceGroups:v60];
        [v76 setSource:2];
      }

      id v16 = v73;
    }
  }
  id v78 = 0;
  id v68 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v78];
  id v69 = v78;
  if (v69)
  {
    id v70 = v69;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D0DC();
    }
LABEL_73:
    uint64_t v72 = v74;
    (*((void (**)(id, id))v74 + 2))(v74, v70);

    goto LABEL_74;
  }
  id v77 = 0;
  unsigned __int8 v71 = [v68 writeToFile:@"/private/var/tmp/com.apple.PerformanceTrace" options:1 error:&v77];
  id v70 = v77;
  if (v70 || (v71 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D06C();
    }
    goto LABEL_73;
  }
  uint64_t v72 = v74;
  (*((void (**)(id, void))v74 + 2))(v74, 0);
LABEL_74:
}

- (void)pingService:(id)a3
{
  id v4 = a3;
  id v5 = [(PTService *)self connection];
  int v6 = [v5 processIdentifier];

  proc_name(v6, buffer, 0x21u);
  BOOL v7 = +[NSString stringWithCString:buffer encoding:4];
  if (!v7)
  {
    BOOL v7 = +[NSString stringWithCString:buffer encoding:1];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v8 = [(PTService *)self connection];
    int v11 = 138412802;
    id v12 = v4;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = [v8 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received Ping: %@ from Client: %{public}@ [%i]", (uint8_t *)&v11, 0x1Cu);
  }
  id v9 = [(PTService *)self connection];
  unsigned __int8 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014BE8];

  [v10 _didPingService:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(PTService *)self _connectionIsEntitled:v6 toEntitlement:@"com.apple.PerformanceTrace.Tracing"];
  if (v7)
  {
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PTServiceInterface];
    [v6 setExportedInterface:v8];

    [v6 setExportedObject:self];
    id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PTTraceSessionDelegatePrivate];
    [v6 setRemoteObjectInterface:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000090EC;
    v12[3] = &unk_100014660;
    v12[4] = self;
    [v6 setInvalidationHandler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009180;
    v11[3] = &unk_100014660;
    v11[4] = self;
    [v6 setInterruptionHandler:v11];
    objc_storeStrong((id *)&self->_connection, a4);
    [v6 resume];
  }
  else
  {
    proc_name((int)[v6 processIdentifier], buffer, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D1BC();
    }
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (ktrace_session)ktraceSession
{
  return self->_ktraceSession;
}

- (void)setKtraceSession:(ktrace_session *)a3
{
  self->_ktraceSession = a3;
}

- (ktrace_recording)ktraceRecording
{
  return self->_ktraceRecording;
}

- (void)setKtraceRecording:(ktrace_recording *)a3
{
  self->_ktraceRecording = a3;
}

- (PTTraceConfig)activeConfig
{
  return (PTTraceConfig *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveConfig:(id)a3
{
}

- (OS_dispatch_source)activeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveTimer:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_activeTimer, 0);
  objc_storeStrong((id *)&self->_activeConfig, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end