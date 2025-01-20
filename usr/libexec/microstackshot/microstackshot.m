void start()
{
  xpc_activity_register("com.apple.systemstats.microstackshot_periodic", XPC_ACTIVITY_CHECK_IN, &stru_1000041E0);
  dispatch_main();
}

void sub_100001A2C(id a1, OS_xpc_object *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001AC0;
  block[3] = &unk_100004208;
  v4 = a2;
  v2 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100001AC0(uint64_t a1)
{
  v1 = (xpc_activity_t *)(a1 + 32);
  if (!xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32)))
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v6) {
      sub_10000280C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Activity fired in RUN", buf, 2u);
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v2 = sub_10000220C(&v47, &v46);
  if (v2)
  {
    uint64_t v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002A34();
    }
    xpc_activity_t v4 = *v1;
    uint64_t v5 = v3;
    goto LABEL_11;
  }
  if (!xpc_activity_should_defer(*v1))
  {
    v15 = +[NSUserDefaults standardUserDefaults];
    v16 = [v15 objectForKey:@"last_attempt_progress"];
    id v17 = [v16 unsignedIntValue];

    if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000029B4((int)v17);
    }
    if (systemstats_persistence_is_allowed())
    {
      snprintf(__str, 0x10uLL, "%ld", v47);
      snprintf(v58, 0x10uLL, "%ld", v46);
      if (v17)
      {
        BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v21) {
          sub_100002978(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
      else if (systemstats_cpu_hotspot_report_allowed_by_tasking() {
             && DiagnosticLogSubmissionEnabled())
      }
      {
        *(void *)buf = "/usr/sbin/spindump";
        v49 = "-system_stats";
        v50 = "-microstackshots_starttime";
        v51 = __str;
        v52 = "-microstackshots_endtime";
        v53 = v58;
        v54 = "-system_stats_signature";
        v55 = "com.apple.SystemStats.Daily";
        v56 = 0;
        sub_10000256C((char *const *)buf);
        id v17 = (id)(v17 | 1);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CPU microstackshot reports disallowed.", buf, 2u);
      }
      if (xpc_activity_should_defer(*v1))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Activity should defer at progress %#x", buf, 8u);
        }
        v29 = +[NSUserDefaults standardUserDefaults];
        v30 = +[NSNumber numberWithUnsignedInt:v17];
        [v29 setObject:v30 forKey:@"last_attempt_progress"];

        if (!xpc_activity_set_state(*v1, 3) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          goto LABEL_18;
        }
        return;
      }
      if ((v17 & 2) != 0)
      {
        BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v31) {
          sub_10000293C(v31, v32, v33, v34, v35, v36, v37, v38);
        }
      }
      else if (systemstats_io_hotspot_report_allowed_by_tasking() {
             && DiagnosticLogSubmissionEnabled())
      }
      {
        *(void *)buf = "/usr/sbin/spindump";
        v49 = "-system_stats";
        v50 = "-microstackshots_starttime";
        v51 = __str;
        v52 = "-microstackshots_endtime";
        v53 = v58;
        v54 = "-microstackshots_io";
        v55 = "-system_stats_signature";
        v56 = "com.apple.SystemStats.Daily.IO";
        uint64_t v57 = 0;
        sub_10000256C((char *const *)buf);
        LODWORD(v17) = v17 | 2;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "I/O microstackshot reports disallowed.", buf, 2u);
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      v18 = "Completed all work with progress %#x";
      os_log_type_t v19 = OS_LOG_TYPE_INFO;
      uint32_t v20 = 8;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_50:
        uint64_t v39 = v46;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1000028CC();
        }
        v40 = +[NSUserDefaults standardUserDefaults];
        v41 = +[NSNumber numberWithLong:v39];
        [v40 setObject:v41 forKey:@"last_processed_snapshot_timestamp"];

        v42 = +[NSUserDefaults standardUserDefaults];
        id v43 = objc_alloc((Class)NSString);
        sub_1000026EC();
        id v44 = [v43 initWithUTF8String:&byte_100008058];
        [v42 setObject:v44 forKey:@"last_processed_snapshot_build"];

        v45 = +[NSUserDefaults standardUserDefaults];
        [v45 removeObjectForKey:@"last_attempt_progress"];

LABEL_10:
        xpc_activity_t v14 = *v1;
        uint64_t v5 = sub_10000220C(0, 0);
        xpc_activity_t v4 = v14;
LABEL_11:
        sub_1000020D8(v4, v5);
        return;
      }
      *(_WORD *)buf = 0;
      v18 = "Persistence is currently disallowed based on tasking defaults. No microstackshots available for hotspot reports.";
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v19, v18, buf, v20);
    goto LABEL_50;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Activity should defer before doing anything", buf, 2u);
  }
  if (!xpc_activity_set_state(*v1, 3) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
LABEL_18:
  }
    sub_100002848(v1);
}

void sub_1000020D8(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  xpc_object_t v4 = xpc_activity_copy_criteria(v3);
  if (v4)
  {
    time_t v5 = time(0);
    if (a2 <= v5) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = a2 - v5;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218496;
      uint64_t v8 = a2;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      __int16 v11 = 1024;
      int v12 = 28800;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Setting activity to run at %ld (%ld+%d)", (uint8_t *)&v7, 0x1Cu);
    }
    xpc_dictionary_set_uint64(v4, XPC_ACTIVITY_DELAY, v6);
    xpc_dictionary_set_uint64(v4, XPC_ACTIVITY_GRACE_PERIOD, 0x7080uLL);
    xpc_activity_set_criteria(v3, v4);
  }
  else
  {
    _os_assumes_log();
  }
}

uint64_t sub_10000220C(uint64_t *a1, uint64_t *a2)
{
  time_t v4 = time(0);
  time_t v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = [v5 stringForKey:@"last_processed_snapshot_build"];

  id v7 = objc_alloc((Class)NSString);
  sub_1000026EC();
  id v8 = [v7 initWithUTF8String:&byte_100008058];
  if ([v8 isEqualToString:v6])
  {
    __int16 v9 = +[NSUserDefaults standardUserDefaults];
    uint64_t v10 = [v9 objectForKey:@"last_processed_snapshot_timestamp"];
    id v11 = [v10 longValue];

    if (v11)
    {
      if ((uint64_t)v11 >= v4 - 259200) {
        uint64_t v12 = (uint64_t)v11;
      }
      else {
        uint64_t v12 = v4 - 86400;
      }
      uint64_t v19 = v12;
      uint64_t v13 = v12 + 86400;
      if (a1 && a2)
      {
        if (v12 + 82800 < v4 && v13 > v4) {
          uint64_t v13 = v4;
        }
        if (v13 > v4)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100002C98();
          }
          goto LABEL_39;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v12;
          __int16 v22 = 2048;
          uint64_t v23 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "This is subsequent report, generating report for 24 hour period %ld -> %ld", buf, 0x16u);
        }
        *a1 = v12;
LABEL_38:
        *a2 = v13;
        uint64_t v13 = 0;
        goto LABEL_39;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100002C28();
      }
      goto LABEL_39;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Builds don't match, ignoring saved start time, if any. (%@ -> %@)", buf, 0x16u);
  }
  uint64_t v15 = qword_100008078;
  if (!qword_100008078)
  {
    *(void *)buf = 0x1500000001;
    size_t v20 = 16;
    if (sysctl((int *)buf, 2u, &qword_100008078, &v20, 0, 0) == -1) {
      sub_100002A7C();
    }
    uint64_t v15 = qword_100008078;
    if (!qword_100008078) {
      sub_100002A9C();
    }
  }
  if (v15 < v4 - 259200) {
    uint64_t v15 = v4 - 86400;
  }
  uint64_t v19 = v15;
  v16 = localtime(&v19);
  v16->tm_min = 0;
  v16->tm_hour = 0;
  uint64_t v13 = mktime(v16) + 86400;
  if (a1 && a2)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v13 <= v4)
    {
      if (v17) {
        sub_100002B98(&v19, v13);
      }
      *a1 = v19;
      goto LABEL_38;
    }
    if (v17) {
      sub_100002B28();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100002AB8();
  }
LABEL_39:

  return v13;
}

void sub_10000256C(char *const *a1)
{
  pid_t v6 = 0;
  posix_spawnattr_t v5 = 0;
  if (posix_spawnattr_init(&v5)) {
    sub_100002F44();
  }
  if (posix_spawnattr_setjetsam_ext()) {
    sub_100002F44();
  }
  int v2 = posix_spawn(&v6, "/usr/sbin/spindump", 0, &v5, a1, environ);
  posix_spawnattr_destroy(&v5);
  if (!v2)
  {
    int v4 = 0;
    int v3 = 1000001;
    while (--v3)
    {
      if (waitpid(v6, &v4, 0) != -1 || *__error() != 4) {
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100002EFC();
    }
LABEL_12:
    if ((v4 & 0xFF7F) != 0)
    {
      if ((v4 & 0x7F) != 0)
      {
        if ((v4 & 0x7F) == 0x7F)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100002E80();
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100002D8C();
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100002E08();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_100002D08(&v6);
    }
  }
}

void sub_1000026EC()
{
  if (!byte_100008058)
  {
    *(void *)v1 = 0x4100000001;
    size_t v0 = 32;
    if (sysctl(v1, 2u, &byte_100008058, &v0, 0, 0) == -1) {
      sub_100002A7C();
    }
    if (!byte_100008058) {
      sub_100002A9C();
    }
  }
}

void sub_100002794(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000027D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_1000027F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000280C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002848(xpc_activity_t *a1)
{
  xpc_activity_get_state(*a1);
  sub_1000027C8();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unable to defer with state %#lx", v1, 0xCu);
}

void sub_1000028CC()
{
  sub_1000027C8();
  sub_100002794((void *)&_mh_execute_header, &_os_log_default, v0, "Saving report start time: %ld", v1, v2, v3, v4, v5);
}

void sub_10000293C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000029B4(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Already have some progress: %#x", (uint8_t *)v1, 8u);
}

void sub_100002A34()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Activity fired too early", v0, 2u);
}

void sub_100002A7C()
{
}

void sub_100002A9C()
{
}

void sub_100002AB8()
{
  sub_1000027C8();
  sub_100002794((void *)&_mh_execute_header, &_os_log_default, v0, "Will be ready to generate the first report after %ld", v1, v2, v3, v4, v5);
}

void sub_100002B28()
{
  sub_1000027C8();
  sub_100002794((void *)&_mh_execute_header, &_os_log_default, v0, "Not ready to generate first report, waiting until %ld", v1, v2, v3, v4, v5);
}

void sub_100002B98(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "This is first report, generating report from boot (%ld) to midnight (%ld)", (uint8_t *)&v3, 0x16u);
}

void sub_100002C28()
{
  sub_1000027C8();
  sub_100002794((void *)&_mh_execute_header, &_os_log_default, v0, "Will be ready to generate a subsequent report at %ld", v1, v2, v3, v4, v5);
}

void sub_100002C98()
{
  sub_1000027C8();
  sub_100002794((void *)&_mh_execute_header, &_os_log_default, v0, "Not ready to generate subsequent report, waiting until %ld", v1, v2, v3, v4, v5);
}

void sub_100002D08(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "spindump[%d] exited succesfully.", (uint8_t *)v2, 8u);
}

void sub_100002D8C()
{
  sub_1000027B0();
  sub_1000027D4((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] died with signal %d.", v1, v2, v3, v4, v5);
}

void sub_100002E08()
{
  sub_1000027B0();
  sub_1000027D4((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] exited with return value %d.", v1, v2, v3, v4, v5);
}

void sub_100002E80()
{
  sub_1000027B0();
  sub_1000027D4((void *)&_mh_execute_header, &_os_log_default, v0, "spindump[%d] stoppedby signal %d.", v1, v2, v3, v4, v5);
}

void sub_100002EFC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "spindump never returned", v0, 2u);
}

void sub_100002F44()
{
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

void dispatch_main(void)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

uint64_t posix_spawnattr_setjetsam_ext()
{
  return _posix_spawnattr_setjetsam_ext();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

uint64_t systemstats_cpu_hotspot_report_allowed_by_tasking()
{
  return _systemstats_cpu_hotspot_report_allowed_by_tasking();
}

uint64_t systemstats_io_hotspot_report_allowed_by_tasking()
{
  return _systemstats_io_hotspot_report_allowed_by_tasking();
}

uint64_t systemstats_persistence_is_allowed()
{
  return _systemstats_persistence_is_allowed();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}