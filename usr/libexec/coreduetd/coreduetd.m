void sub_100002540(id a1)
{
  uint64_t vars8;

  qword_100040E90 = objc_alloc_init(CDServiceManager);

  _objc_release_x1();
}

void sub_100002848(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      uint64_t v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100021D74(v4);
      }
    }
  }
}

void sub_1000028BC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      uint64_t v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100021E18(v4);
      }
    }
  }
}

uint64_t sub_100002B20(uint64_t a1, void *a2, const void *a3)
{
  id v4 = a2;
  if (v4)
  {
    v6 = v4;
    if (CFEqual(a3, @"SignificantTimeChangeNotification")) {
      [v6 timeZoneOrTimeChanged:0];
    }
  }

  return _objc_release_x1();
}

void sub_100002C70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.coreduetd", "WatchUpdate");
  v2 = (void *)qword_100040EA0;
  qword_100040EA0 = (uint64_t)v1;

  if (!qword_100040EA0)
  {
    objc_storeStrong((id *)&qword_100040EA0, &_os_log_default);
  }
}

void sub_1000032C4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nextResetTime];
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v3;
    v6 = +[NSDate date];
    v7 = [v4 formatDate:v6];
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TZ or time changed: now %@\n", (uint8_t *)&v15, 0xCu);
  }
  [*(id *)(a1 + 32) setupNextResetTimer:v2];
  v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:@"lastResetDate"];
  if (v8)
  {
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      v12 = [v10 formatDate:v8];
      int v15 = 138412290;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Last reset time: %@\n", (uint8_t *)&v15, 0xCu);
    }
    v13 = +[NSDate date];
    if ((uint64_t)[*(id *)(a1 + 32) hoursBetween:v8 and:v13] >= 25)
    {
      v14 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "More than 24 hours since last push limit reset => forcing now.\n", (uint8_t *)&v15, 2u);
      }
      [*(id *)(a1 + 32) resetPushLimits];
    }
  }
}

id sub_100003688(uint64_t a1)
{
  return [*(id *)(a1 + 32) dailyResetTimer];
}

void sub_100003790(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Daily complication push limit reset timer fired.\n", v5, 2u);
  }
  [*(id *)(a1 + 32) resetPushLimits];
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 nextResetTime];
  [v3 setupNextResetTimer:v4];
}

id sub_100003AE4(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Watch charged above 90%% => resetting complication push limits now.\n", v4, 2u);
  }
  return [*(id *)(a1 + 32) resetPushLimits];
}

uint64_t sub_100003BD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100003C48(id a1)
{
  v9[0] = &off_10003B0F0;
  v9[1] = &off_10003B108;
  v10[0] = &off_10003B0F0;
  v10[1] = &off_10003B0F0;
  v9[2] = &off_10003B120;
  v9[3] = &off_10003B150;
  v10[2] = &off_10003B138;
  v10[3] = &off_10003B168;
  v9[4] = &off_10003B180;
  v9[5] = &off_10003B1B0;
  v10[4] = &off_10003B198;
  v10[5] = &off_10003B1C8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v2 = (void *)qword_100040EB0;
  qword_100040EB0 = v1;

  v7[0] = &off_10003B0F0;
  v7[1] = &off_10003B138;
  v8[0] = &off_10003B0F0;
  v8[1] = &off_10003B120;
  v7[2] = &off_10003B168;
  v7[3] = &off_10003B198;
  v8[2] = &off_10003B150;
  v8[3] = &off_10003B180;
  v7[4] = &off_10003B1C8;
  v8[4] = &off_10003B1B0;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v4 = (void *)qword_100040EB8;
  qword_100040EB8 = v3;

  v5 = objc_alloc_init(CDDCommunicatorHelper);
  v6 = (void *)qword_100040EC0;
  qword_100040EC0 = (uint64_t)v5;
}

void sub_100006478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Unwind_Resume(a1);
}

id sub_1000064B4()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_100040ED8;
  uint64_t v6 = qword_100040ED8;
  if (!qword_100040ED8)
  {
    sub_10000D090();
    v4[3] = (uint64_t)objc_getClass("_PSSuggesterConfiguration");
    qword_100040ED8 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_1000065A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000065BC()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_100040EE8;
  uint64_t v6 = qword_100040EE8;
  if (!qword_100040EE8)
  {
    sub_10000D090();
    v4[3] = (uint64_t)objc_getClass("_PSEnsembleModel");
    qword_100040EE8 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_1000066AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000066C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  [WeakRetained maintainPrivacy];
}

void sub_100006758(uint64_t a1)
{
  uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.refreshPeopleSuggesterCaches", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  os_activity_scope_leave(&v5);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshPeopleSuggesterCaches];
}

void sub_1000068A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000068C0(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if ([v5 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication]) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [WeakRetained workQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006A48;
    v14[3] = &unk_100038AE8;
    objc_copyWeak(&v15, v7);
    v10 = v14;
    v11 = v9;
    v12 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D274;
    block[3] = &unk_100038AA0;
    id v17 = v12;
    id v18 = v10;
    id v13 = v12;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
  }
}

void sub_100006A34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006A48(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained versionCheckAndUpgradeIfNecessaryAndPossible];

  id v3 = objc_loadWeakRetained(v1);
  [v3 populatePeopleSuggesterCaches];
}

void sub_100006BCC(uint64_t a1)
{
  uint64_t v2 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Populating caches", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) ensembleModel];
  [v3 populateCaches];

  [*(id *)(a1 + 32) populateAppSharesCache];
  [*(id *)(a1 + 32) populateAppUsageCache];
  id v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished populating caches", v5, 2u);
  }
}

void sub_100006E64(uint64_t a1)
{
  +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.deletedDB.people.corrupted"];
  uint64_t v2 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%@\nDetected interaction database corruption. Deleting Storage", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 64) deleteStorage];
  id v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Exiting process", (uint8_t *)&v5, 2u);
  }

  exit(1);
}

void sub_10000712C(uint64_t a1)
{
  uint64_t v2 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000221B0();
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) queryVersionNumber];
  id v4 = +[_CDLogging interactionChannel];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == (id)1)
  {
    if (v5) {
      sub_100021FF4(v4);
    }
  }
  else
  {
    if (v5) {
      sub_100022128((uint64_t)v3, v4);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) deleteStorage];
    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.deletedDB.people.versionMismatched"];
    uint64_t v6 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000220A8(v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) recordVersionNumber:1];
    v7 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100022074();
    }

    [*(id *)(a1 + 32) requestInteractionRepopulation];
  }
}

void sub_100007A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v6 = v5;
  if (state == 2)
  {
    v34 = v5;
    v10 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.repopulate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)keys = 0;
    *(void *)&keys[8] = 0;
    os_activity_scope_enter(v10, (os_activity_scope_state_t)keys);
    os_activity_scope_leave((os_activity_scope_state_t)keys);

    v11 = +[CDPeopleDaemon readRepopulationCheckpoint];
    v12 = +[NSDate dateWithTimeIntervalSinceNow:-14515200.0];
    id v13 = objc_alloc_init((Class)_CDInteractionHarvester);
    v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100022458(v11, v14);
    }

    uint64_t v15 = os_transaction_create();
    id v17 = (void *)v15;
    if (v11)
    {
      v33 = (void *)v15;
      *(void *)&long long v16 = 134218240;
      long long v32 = v16;
      while (1)
      {
        [v11 timeIntervalSinceReferenceDate:v32];
        double v19 = v18;
        [v12 timeIntervalSinceReferenceDate];
        if (v19 <= v20)
        {
LABEL_22:

          id v17 = v33;
          goto LABEL_23;
        }
        getpid();
        proc_set_cpumon_params();
        id v21 = v11;
        v22 = [v21 dateByAddingTimeInterval:-172800.0];
        v23 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          [v22 timeIntervalSinceNow];
          double v29 = v28 / -86400.0;
          [v21 timeIntervalSinceNow];
          *(_DWORD *)keys = v32;
          *(double *)&keys[4] = v29;
          *(_WORD *)&keys[12] = 2048;
          *(double *)&keys[14] = v30 / -86400.0;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Harvesting data betweeen %2.1f and %2.1f  days ago", keys, 0x16u);
        }

        v24 = [v13 harvestInteractionsBetweenStartDate:v22 endDate:v21];
        uint64_t v25 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_1000223EC((uint8_t *)values, v24, (xpc_object_t *)((char *)values + 4), v25);
        }

        if (v24 && [v24 count])
        {
          v26 = *(void **)(*(void *)(a1 + 32) + 64);
          id v35 = 0;
          [v26 recordInteractions:v24 error:&v35];
          id v27 = v35;
          [*(id *)(a1 + 32) handleError:v27];
        }
        v11 = [v22 dateByAddingTimeInterval:-1.0];

        +[CDPeopleDaemon writeRepopulationCheckpoint:v11];
        getpid();
        proc_set_cpumon_defaults();
        if (xpc_activity_should_defer(v3)) {
          break;
        }

        if (!v11) {
          goto LABEL_22;
        }
      }
      xpc_activity_set_state(v3, 3);
    }
    else
    {
LABEL_23:
      v31 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_1000223B8();
      }

      xpc_activity_set_state(v3, 5);
    }
    uint64_t v6 = v34;
  }
  else if (!state)
  {
    *(void *)keys = XPC_ACTIVITY_INTERVAL;
    *(void *)&keys[8] = XPC_ACTIVITY_GRACE_PERIOD;
    *(void *)&keys[16] = XPC_ACTIVITY_PRIORITY;
    v38 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v39 = XPC_ACTIVITY_POWER_NAP;
    uint64_t v40 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_MIN);
    values[1] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_HOUR);
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_UTILITY);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_BOOL_create(1);
    values[5] = xpc_BOOL_create(1);
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100022384();
    }

    xpc_activity_set_criteria(v3, v7);
    for (uint64_t i = 5; i != -1; --i)
  }
}

void sub_10000842C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008450(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_1000086D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000086FC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008984(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008C00(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008EE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009164(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_1000093D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000093F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009684(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_1000098F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009914(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v6];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009BA4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) suggester];
  [v2 shareSheetInteractionsFromContext:*(void *)(a1 + 40) maximumNumberOfSuggestions:[*(id *)(a1 + 48) integerValue]];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id sub_10000C3C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) store];
  [v2 enterMaintenanceMode];

  [*(id *)(a1 + 32) _maintainPrivacy];
  id v3 = [*(id *)(a1 + 32) store];
  [v3 exitMaintenanceMode];

  [*(id *)(a1 + 32) populateAppSharesCache];
  id v4 = *(void **)(a1 + 32);

  return [v4 populateAppUsageCache];
}

id sub_10000C87C()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)qword_100040EF8;
  uint64_t v6 = qword_100040EF8;
  if (!qword_100040EF8)
  {
    sub_10000D090();
    v4[3] = (uint64_t)objc_getClass("_PSAppUsageUtilities");
    qword_100040EF8 = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_10000C96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000D040(uint64_t a1)
{
  sub_10000D090();
  Class result = objc_getClass("_PSSuggesterConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100040ED8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000D090()
{
  if (!qword_100040EE0) {
    qword_100040EE0 = _sl_dlopen();
  }
}

uint64_t sub_10000D160()
{
  uint64_t result = _sl_dlopen();
  qword_100040EE0 = result;
  return result;
}

Class sub_10000D1D4(uint64_t a1)
{
  sub_10000D090();
  Class result = objc_getClass("_PSEnsembleModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100040EE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000D224(uint64_t a1)
{
  sub_10000D090();
  Class result = objc_getClass("_PSFamilyRecommender");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100040EF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000D274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

Class sub_10000D284(uint64_t a1)
{
  sub_10000D090();
  Class result = objc_getClass("_PSAppUsageUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100040EF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000D2D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000D2FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000D31C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000D368(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000D594(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.communication.triggerSync", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  uint64_t v3 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [[*(id *)(*(void *)(a1 + 32) + 64) devices];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) isDefaultPairedDevice])
        {
          uint64_t v9 = (void *)IDSCopyIDForDevice();
          [v3 addObject:v9];

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([v3 count])
  {
    uint64_t v10 = +[NSDate date];
    v11 = *(void **)(a1 + 32);
    v12 = [v10 dateByAddingTimeInterval:-86400.0];
    v20[0] = v12;
    v20[1] = v10;
    id v13 = +[NSArray arrayWithObjects:v20 count:2];
    id v14 = [v11 synchronize:v3 interval:v13 withForecasts:1];
  }
  else
  {
    uint64_t v10 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to find devices to which to sync", (uint8_t *)&state, 2u);
    }
  }
}

void sub_10000DA84(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = +[NSDate date];
  id v7 = v5;
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  v11 = [WeakRetained config];
  if (v9 >= (double)(int)[v11 commSyncBoundarySeconds])
  {
  }
  else
  {
    [v6 timeIntervalSinceDate:v7];
    double v13 = v12;

    if (v13 > 0.0) {
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKey:v14];
    }
  }
}

void sub_10000DEF8(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  id v2 = [v1[8] devices];
  [v1 checkDevices:v2];
}

void sub_10000E0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E28C(uint64_t a1)
{
  id v2 = +[NSDate date];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  unsigned __int8 v4 = [WeakRetained classCLocked];

  if ((v4 & 1) == 0)
  {
    if (*(void *)(*(void *)(a1 + 32) + 72))
    {
      [v2 timeIntervalSinceDate:];
      double v6 = v5;
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      double v8 = [v7 config];
      if (v6 >= (double)(int)[v8 commSyncBoundarySeconds])
      {
      }
      else
      {
        [v2 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 72)];
        double v10 = v9;

        if (v10 >= 0.0) {
          goto LABEL_25;
        }
      }
    }
    v11 = +[NSMutableSet set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v12 = [*(id *)(*(void *)(a1 + 32) + 64) devices];
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      char v15 = 0;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v18 isDefaultPairedDevice])
          {
            double v19 = (void *)IDSCopyIDForDevice();
            [v11 addObject:v19];

            double v20 = *(void **)(*(void *)(a1 + 32) + 24);
            id v21 = [v18 uniqueIDOverride];
            [v20 setObject:v2 forKey:v21];

            char v15 = 1;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);

      if (v15)
      {
        v22 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CDDCommunicator: **** exchange forecasts *****", v30, 2u);
        }

        if (!*(void *)(*(void *)(a1 + 32) + 72) || (objc_msgSend(v2, "timeIntervalSinceDate:"), v23 <= 0.0))
        {
          uint64_t v24 = [v2 dateByAddingTimeInterval:-86400.0];
          uint64_t v25 = *(void *)(a1 + 32);
          v26 = *(void **)(v25 + 72);
          *(void *)(v25 + 72) = v24;
        }
        id v27 = *(void **)(a1 + 32);
        v35[0] = v27[9];
        v35[1] = v2;
        double v28 = +[NSArray arrayWithObjects:v35 count:2];
        id v29 = [v27 synchronize:v11 interval:v28 withForecasts:1];

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v2);
        [*(id *)(a1 + 32) saveLastDate];
      }
    }
    else
    {
    }
  }
LABEL_25:
}

id sub_10000F5A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) receiveData:a2 context:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];
}

void sub_10000FAB8(uint64_t a1)
{
  id v2 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) devices];
  id v4 = [v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v30 + 1) + 8 * i) isDefaultPairedDevice])
        {
          double v8 = (void *)IDSCopyIDForDevice();
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v5);
  }

  id v9 = [v2 count];
  double v10 = +[_CDLogging communicatorChannel];
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [*(id *)(a1 + 40) length];
      id v13 = "YES";
      if (!*(unsigned char *)(a1 + 64)) {
        id v13 = "NO";
      }
      *(_DWORD *)buf = 134218242;
      id v35 = v12;
      __int16 v36 = 2080;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: performing immediate exchange (%lu bytes) opportunistically: %s.", buf, 0x16u);
    }

    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    char v15 = v14;
    if (*(unsigned char *)(a1 + 65)) {
      uint64_t v16 = &__kCFBooleanFalse;
    }
    else {
      uint64_t v16 = &__kCFBooleanTrue;
    }
    if (*(unsigned char *)(a1 + 65)) {
      uint64_t v17 = 300;
    }
    else {
      uint64_t v17 = 200;
    }
    [v14 setObject:v16 forKey:IDSSendMessageOptionForceLocalDeliveryKey];
    [v15 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionExpectsPeerResponseKey];
    [v15 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionBypassDuetKey];
    [v15 setObject:&__kCFBooleanFalse forKey:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    [v15 setObject:*(void *)(a1 + 48) forKey:IDSSendMessageOptionTimeoutKey];
    if (*(unsigned char *)(a1 + 64)) {
      [v15 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionOpportunisticDuetKey];
    }
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      [v15 setObject:v18 forKey:IDSSendMessageOptionQueueOneIdentifierKey];
    }
    uint64_t v19 = *(void *)(a1 + 40);
    double v20 = *(void **)(*(void *)(a1 + 32) + 64);
    id v28 = 0;
    id v29 = 0;
    unsigned __int8 v21 = [v20 sendData:v19 toDestinations:v2 priority:v17 options:v15 identifier:&v29 error:&v28];
    id v22 = v29;
    id v23 = v28;
    if ((v21 & 1) == 0)
    {
      uint64_t v24 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v23 description];
        id v26 = [v25 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CDDCommunicator: triggeredExchange: send error %s.", buf, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
      [WeakRetained informCommunicationError];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: No device paired - Data will not be send out", buf, 2u);
    }

    id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v22 informCommunicationError];
  }
}

void sub_1000101DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010774(uint64_t a1)
{
  long long v30 = +[NSMutableSet set];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  unsigned __int8 v3 = [WeakRetained classCLocked];

  if (v3) {
    goto LABEL_22;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v5) {
    goto LABEL_21;
  }
  id v6 = v5;
  char v29 = 0;
  uint64_t v7 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [*(id *)(a1 + 32) deviceFromDeviceDescription:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      if ([v9 isDefaultPairedDevice])
      {
        double v10 = *(void **)(*(void *)(a1 + 32) + 24);
        v11 = [v9 uniqueIDOverride];
        id v12 = [v10 objectForKey:v11];

        id v13 = +[NSDate date];
        id v14 = v13;
        if (v12)
        {
          [v13 timeIntervalSinceDate:v12];
          double v16 = v15;
          id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
          uint64_t v18 = [v17 config];
          if (v16 >= (double)(int)[v18 commSyncBoundarySeconds])
          {
          }
          else
          {
            [v14 timeIntervalSinceDate:v12];
            double v20 = v19;

            if (v20 >= 0.0) {
              goto LABEL_14;
            }
          }
        }
        unsigned __int8 v21 = (void *)IDSCopyIDForDevice();
        [v30 addObject:v21];

        id v22 = *(void **)(*(void *)(a1 + 32) + 24);
        id v23 = [v9 uniqueIDOverride];
        [v22 setObject:v14 forKey:v23];

        char v29 = 1;
LABEL_14:
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v6);

  if (v29)
  {
    uint64_t v24 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CDDCommunicator: **** exchange forecasts on new device *****", buf, 2u);
    }

    id v4 = +[NSDate date];
    id v25 = [v4 dateByAddingTimeInterval:-86400.0];
    id v26 = *(void **)(a1 + 32);
    v36[0] = v25;
    v36[1] = v4;
    id v27 = +[NSArray arrayWithObjects:v36 count:2];
    id v28 = [v26 synchronize:v30 interval:v27 withForecasts:1];

    [*(id *)(a1 + 32) saveLastDate];
LABEL_21:
  }
LABEL_22:
}

void sub_100011084(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100011794(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

Class sub_1000117A4(uint64_t a1)
{
  if (!qword_100040F08) {
    qword_100040F08 = _sl_dlopen();
  }
  Class result = objc_getClass("PSYSyncCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100040F00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000118A4()
{
  uint64_t result = _sl_dlopen();
  qword_100040F08 = result;
  return result;
}

uint64_t start()
{
  id v1 = (void *)os_transaction_create();
  id v2 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "coreduetdStartup", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v3 = +[CDD sharedInstance];
  id v4 = (void *)qword_100040F10;
  qword_100040F10 = v3;

  id v5 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "main: creating CDDaemonManager...", v10, 2u);
  }

  id v6 = +[CDServiceManager sharedInstance];
  uint64_t v7 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "coreduetdStartup", "", v9, 2u);
  }

  CFRunLoopRun();
  return 1;
}

id sub_100011F94(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setupPairedSyncClient];
}

unsigned __int8 *sub_100012438(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPluggedIn];
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  if (result[136] != v2)
  {
    return (unsigned __int8 *)[result triggerSystemDataExchange:1 wakeRemote:1];
  }
  return result;
}

void sub_100012498(uint64_t a1)
{
  [*(id *)(a1 + 32) currentBatteryLevel];
  uint64_t v2 = *(void *)(a1 + 32);
  double v4 = *(double *)(v2 + 128) - v3;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = -v4;
  }
  id v6 = [*(id *)(v2 + 8) config];
  double v7 = (double)(int)[v6 batteryMonitorExchangeBattDelta];

  if (v5 > v7)
  {
    double v8 = *(void **)(a1 + 32);
    [v8 triggerSystemDataExchange:1 wakeRemote:0];
  }
}

_DWORD *sub_100012530(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) thermalPressureLevel];
  uint64_t result = *(_DWORD **)(a1 + 32);
  if (v2 != result[35])
  {
    return [result triggerSystemDataExchange:1 wakeRemote:0];
  }
  return result;
}

id sub_100012590(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAppStateChanged];
}

id sub_100012598(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNetworkChanged];
}

void sub_100012BBC(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = [a2 pointerValue:a3, a4];
  if (v4)
  {
    free(v4);
  }
}

void sub_100013684(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSValue valueWithPointer:*(void *)(a1 + 40)];
  [v1 addObject:v2];
}

void sub_1000138C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000138EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000138FC(uint64_t a1)
{
}

intptr_t sub_100013904(uint64_t a1, void *a2)
{
  if (a2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v3 = [a2 elements];
    id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v8 isSpringBoardElement]
            && [v8 layoutRole] == (id)1
            && [v8 isUIApplicationElement])
          {
            id v9 = [v8 bundleIdentifier];

            if (v9)
            {
              uint64_t v10 = [v8 bundleIdentifier];
              uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
              id v12 = *(void **)(v11 + 40);
              *(void *)(v11 + 40) = v10;
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    id v14 = *(NSObject **)(a1 + 32);
    return dispatch_semaphore_signal(v14);
  }
}

id sub_100013EB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_1000138EC;
  long long v17 = sub_1000138FC;
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  if (a3) {
    __assert_rtn("processForecastXPCObject", "CDDCommunicator.m", 751, "0");
  }
  if (a4)
  {
    double v8 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014284;
    v11[3] = &unk_100038E48;
    v11[4] = &v13;
    v11[5] = a2;
    v11[6] = a4;
  }
  else
  {
    double v8 = applier;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100014064;
    applier[3] = &unk_100038DF8;
    applier[4] = &v13;
  }
  xpc_dictionary_apply(v7, v8);
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_10001404C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014064(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (!strcmp(a2, "itemsInForecast"))
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = +[NSNumber numberWithLongLong:xpc_uint64_get_value(v5)];
    CFStringRef v11 = @"itemsInForecast";
LABEL_6:
    [v9 setObject:v10 forKey:v11];

    goto LABEL_7;
  }
  if (!strcmp(a2, "databaseEpochSeconds"))
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = +[NSNumber numberWithLongLong:xpc_uint64_get_value(v5)];
    CFStringRef v11 = @"databaseEpochSeconds";
    goto LABEL_6;
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100014204;
  applier[3] = &unk_100038DD0;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = v14;
  xpc_dictionary_apply(v5, applier);
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  double v8 = +[NSString stringWithUTF8String:a2];
  [v7 setObject:v6 forKey:v8];

LABEL_7:
  return 1;
}

uint64_t sub_100014204(uint64_t a1, uint64_t a2, xpc_object_t xdouble)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSNumber numberWithDouble:xpc_double_get_value(xdouble)];
  id v6 = +[NSString stringWithUTF8String:a2];
  [v4 setObject:v5 forKey:v6];

  return 1;
}

uint64_t sub_100014284(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (!strcmp(a2, "itemsInForecast"))
  {
    CFStringRef v11 = *(void **)(*(void *)(a1[4] + 8) + 40);
    id v12 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    CFStringRef v13 = @"itemsInForecast";
LABEL_6:
    [v11 setObject:v12 forKey:v13];

    goto LABEL_7;
  }
  if (!strcmp(a2, "databaseEpochSeconds"))
  {
    CFStringRef v11 = *(void **)(*(void *)(a1[4] + 8) + 40);
    id v12 = +[NSNumber numberWithLongLong:xpc_uint64_get_value(v5)];
    CFStringRef v13 = @"databaseEpochSeconds";
    goto LABEL_6;
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10001442C;
  applier[3] = &unk_100038E20;
  uint64_t v7 = a1[6];
  uint64_t v17 = a1[5];
  uint64_t v18 = v7;
  id v16 = v6;
  id v8 = v6;
  xpc_dictionary_apply(v5, applier);
  id v9 = *(void **)(*(void *)(a1[4] + 8) + 40);
  uint64_t v10 = +[NSString stringWithUTF8String:a2];
  [v9 setObject:v8 forKey:v10];

LABEL_7:
  return 1;
}

uint64_t sub_10001442C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 2)
  {
    if (strcmp(**(const char ***)(a1 + 48), a2)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    double v14 = **(float **)(a1 + 48);
    uint64_t v15 = +[NSString stringWithUTF8String:a2];
    [v15 doubleValue];
    double v17 = v16;

    if (v17 != v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v6) {
    sub_100022854();
  }
  id v7 = **(id **)(a1 + 48);
  id v8 = +[NSString stringWithUTF8String:a2];
  id v9 = [v8 longLongValue];

  if (v7 == v9)
  {
LABEL_5:
    uint64_t v10 = *(void **)(a1 + 32);
    CFStringRef v11 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    id v12 = +[NSString stringWithUTF8String:a2];
    [v10 setObject:v11 forKey:v12];
  }
LABEL_6:

  return 1;
}

uint64_t sub_100014820(uint64_t result)
{
  if (!qword_100040F18)
  {
    qword_100040F18 = [*(id *)(result + 32) getVersionsDictFromMaxVersion:*(void *)(*(void *)(result + 32) + 224) minVersion:*(void *)(*(void *)(result + 32) + 232)];
    return _objc_release_x1();
  }
  return result;
}

void sub_100014A2C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014ACC;
  v5[3] = &unk_100038E70;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v5];
}

void sub_100014ACC(uint64_t a1, void *a2)
{
  id v3 = [a2 pointerValue];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (char *)(v3 + 2);
    [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
    v4[5] = (unint64_t)v6 - *v4;
    v4[6] = (unint64_t)v6;
    uint64_t v7 = [*(id *)(a1 + 40) makeForecastMessage:v5];
    if (v7)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
    }
    else
    {
      uint64_t v8 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: getForecasts: failed to get forecasts.", (uint8_t *)v9, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CDDCommunicator: bad forecast parameters.", buf, 2u);
    }
  }
}

uint64_t sub_100015164(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && [v3 count]) {
    uint64_t v5 = (uint64_t)[v3 containsObject:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

void *sub_100015D10(void *a1)
{
  id v1 = a1;
  id v2 = malloc_type_calloc(1uLL, 0x78uLL, 0x10100401C9C3943uLL);
  if (!v2) {
    sub_100022944();
  }
  id v3 = v2;
  id v4 = [v1 objectForKey:&off_10003B288];
  v3[8] = [v4 unsignedLongLongValue];

  uint64_t v5 = [v1 objectForKey:&off_10003B2A0];
  v3[9] = [v5 unsignedLongLongValue];

  double v6 = [v1 objectForKey:&off_10003B2B8];
  v3[3] = [v6 unsignedLongLongValue];

  uint64_t v7 = [v1 objectForKey:&off_10003B2D0];
  v3[4] = [v7 unsignedLongLongValue];

  uint64_t v8 = [v1 objectForKey:&off_10003B270];
  v3[5] = [v8 unsignedLongLongValue];

  id v9 = [v1 objectForKey:&off_10003B2E8];
  v3[6] = [v9 unsignedLongLongValue];

  v3[7] = -1;
  uint64_t v10 = [v1 objectForKey:&off_10003B258];
  v3[13] = [v10 unsignedLongLongValue];

  CFStringRef v11 = [v1 objectForKey:&off_10003B330];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = v3[8];
    uint64_t v14 = 1;
    if ((v13 & 0x800) == 0) {
      uint64_t v14 = 2;
    }
    if ((v13 & 0x400) != 0) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v14;
    }
    if (v15 == 2)
    {
      v3[2] = [v11 UTF8String];
    }
    else if (v15 == 1)
    {
      [v11 doubleValue];
      v3[1] = v16;
    }
    else
    {
      void *v3 = [v11 longLongValue];
    }
  }

  return v3;
}

id sub_10001672C(void *a1)
{
  return [*(id *)(a1[4] + 112) setObject:a1[5] forKey:a1[6]];
}

id sub_1000169B0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (*(_DWORD *)(a1 + 48)) {
    BOOL v2 = [*(id *)(a1 + 40) count] != 0;
  }
  else {
    BOOL v2 = 1;
  }

  return [v1 exchangeSystemComboMessage:v2];
}

void sub_100016B7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48))
  {
    id v3 = *(void **)(v2 + 88);
    if (!v3) {
      return;
    }
    if (![v3 isEqualToString:*(void *)(a1 + 40)]) {
      return;
    }
    int v4 = sub_100015164(*(void **)(*(void *)(a1 + 32) + 104), *(void **)(*(void *)(a1 + 32) + 88));
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = 0;

    if (!v4) {
      return;
    }
  }
  else
  {
    if ((sub_100015164(*(void **)(v2 + 104), *(void **)(v2 + 88)) & 1) == 0
      && !sub_100015164(*(void **)(*(void *)(a1 + 32) + 104), *(void **)(a1 + 40)))
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
      return;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 88) && (objc_msgSend(*(id *)(v7 + 184), "containsObject:") & 1) == 0)
  {
    uint64_t v8 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(*(void *)(a1 + 32) + 88) UTF8String];
      int v11 = 136315138;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting focal app (%s).", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = +[_CDLogging communicatorChannel];
    uint64_t v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting focal app NIL.", (uint8_t *)&v11, 2u);
    }
  }

  if (*(unsigned char *)(a1 + 52)) {
    [*(id *)(a1 + 32) exchangeSystemComboMessage:v9];
  }
}

void sub_100016E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016E48(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = [a3 componentsJoinedByString:@","];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(void **)(v5 + 40);
  id v11 = v4;
  if (v6)
  {
    uint64_t v7 = [v6 stringByAppendingFormat:@",%@", v4];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v10 = v4;
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;
  }
}

id sub_100016FB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:];
}

id sub_1000170BC(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  return result;
}

void sub_100017448(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[168])
  {
    id v11 = [v2 makeSystemComboMessage];
    id v3 = [*(id *)(a1 + 32) generateFocalNonAppFocalMutableSet];
    int v4 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v7 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v5 triggeredExchange:v4 opportunistic:v6 queue:0 timeout:v7 urgent:0];

    uint64_t v8 = +[NSDate date];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = v8;

    [*(id *)(*(void *)(a1 + 32) + 160) setSet:v3];
    *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  }
}

void sub_1000176C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  int v4 = [v2 objectForKey:v3];

  uint64_t v5 = *(void **)(a1 + 40);
  if (v5 && [v5 count])
  {
    if ([*(id *)(a1 + 40) isEqualToArray:v4]) {
      goto LABEL_27;
    }
    if (*(void *)(a1 + 48) == 28
      && [*(id *)(a1 + 40) containsObject:@"com.apple.Siri"])
    {
      uint64_t v6 = +[_CDClientContext userContext];
      uint64_t v7 = +[_CDContextQueries keyPathForSiriActiveStatus];
      [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:v7];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 96);
    id v10 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    [v9 setObject:v8 forKey:v10];

    id v11 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 48);
      id v13 = [*(id *)(a1 + 40) description];
      int v27 = 134218242;
      id v28 = v12;
      __int16 v29 = 2080;
      id v30 = [v13 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: client %lld set focal nonapp (%s).", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v14 = 0;
  }
  else
  {
    if (![v4 count]) {
      goto LABEL_27;
    }
    if (*(void *)(a1 + 48) == 28
      && ([*(id *)(a1 + 40) containsObject:@"com.apple.Siri"] & 1) == 0)
    {
      uint64_t v15 = +[_CDClientContext userContext];
      uint64_t v16 = +[_CDContextQueries keyPathForSiriActiveStatus];
      [v15 setObject:&__kCFBooleanFalse forKeyedSubscript:v16];
    }
    double v17 = *(void **)(*(void *)(a1 + 32) + 96);
    uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    [v17 removeObjectForKey:v18];

    id v11 = +[_CDLogging communicatorChannel];
    uint64_t v14 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      double v19 = *(void **)(a1 + 48);
      int v27 = 134217984;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: client %lld set focal nonapp NIL.", (uint8_t *)&v27, 0xCu);
    }
  }

  double v20 = [*(id *)(a1 + 32) generateNonAppFocalString];
  unsigned __int8 v21 = +[_CDLogging communicatorChannel];
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v22)
    {
      id v23 = [v20 description];
      id v24 = [v23 UTF8String];
      int v27 = 136315138;
      id v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting non-app focal state (%s).", (uint8_t *)&v27, 0xCu);
    }
  }
  else if (v22)
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting non-app focal state NIL.", (uint8_t *)&v27, 2u);
  }

  id v25 = [*(id *)(*(void *)(a1 + 32) + 8) config];
  if ([v25 commEnabled] && *(unsigned char *)(*(void *)(a1 + 32) + 200))
  {
    int v26 = *(unsigned __int8 *)(a1 + 56);

    if (v26) {
      [*(id *)(a1 + 32) exchangeSystemComboMessage:v14];
    }
  }
  else
  {
  }
LABEL_27:
}

void sub_100017C10(uint64_t a1)
{
  uint64_t v2 = +[NSDate date];
  id v3 = v2;
  if (!*(void *)(*(void *)(a1 + 32) + 120)
    || (objc_msgSend(v2, "timeIntervalSinceDate:"),
        double v5 = v4,
        [*(id *)(*(void *)(a1 + 32) + 8) config],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        double v7 = (double)(int)[v6 batteryMonitorExchangeTimerDelta],
        v6,
        v5 >= v7)
    || *(unsigned char *)(a1 + 40))
  {
    uint64_t v8 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: broadcasting system data.", v16, 2u);
    }

    uint64_t v9 = [*(id *)(a1 + 32) makeSystemComboMessage];
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    uint64_t v11 = *(void *)(a1 + 32);
    BOOL v12 = *(unsigned char *)(a1 + 41) == 0;
    id v13 = *(void **)(v11 + 16);
    uint64_t v14 = [*(id *)(v11 + 8) config];
    uint64_t v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 batteryMonitorExchangeTimerDelta]);
    [v13 triggeredExchange:v10 opportunistic:v12 queue:0 timeout:v15 urgent:0];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v3);
  }
}

void sub_100017EB0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) makeRemoteDeviceSyncMessage];
  if (v2)
  {
    id v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
    double v4 = +[_CDLogging communicatorChannel];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CDDCommunicator: Requesting remote device to sync states", v7, 2u);
      }

      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
      double v4 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      [v6 triggeredExchange:v3 opportunistic:0 queue:@"DuetRemoteDeviceSyncRequest" timeout:v4 urgent:1];
    }
    else if (v5)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CDDCommunicator: requestRemoteDeviceSync: failed to archive message, bail.", v8, 2u);
    }
  }
  else
  {
    id v3 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CDDCommunicator: requestRemoteDeviceSync: failed to make request message, bail.", buf, 2u);
    }
  }
}

uint64_t sub_1000182A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100018E24(id a1)
{
  +[_DKCloudUtilities setCloudKitEnabled:1];
  id v1 = [CDKnowledgeDaemon alloc];
  uint64_t v2 = _DKMachServiceName;
  id v3 = +[CDDPaths knowledgeDatabaseDirectory];
  double v4 = [(CDKnowledgeDaemon *)v1 initWithMachServiceName:v2 storePath:v3];
  BOOL v5 = (void *)qword_100040F30;
  qword_100040F30 = (uint64_t)v4;

  id v6 = objc_alloc((Class)_CDIntentSpotlightIndex);
  double v7 = [(id)qword_100040F30 storage];
  id v8 = [v6 initWithKnowledgeStorage:v7];
  [(id)qword_100040F30 setIntentSpotlightIndex:v8];

  [(id)qword_100040F30 registerARPHomeControlNotificationTask];
  [(id)qword_100040F30 registerCloudFamilyPredictionTask];
  [(id)qword_100040F30 registerContactsAutocompleteFeedbackProcessingTask];
  [(id)qword_100040F30 registerDataCollectionTasks];
  [(id)qword_100040F30 registerPeopleSuggesterTasks];
  uint64_t v9 = [(id)qword_100040F30 storage];
  id v10 = [v9 storage];
  uint64_t v11 = [v10 directory];
  id v20 = +[NSString stringWithFormat:@"com.apple.coreduet.system.sync.coordinator.context:%@", v11];

  BOOL v12 = [(id)qword_100040F30 storage];
  id v13 = [v12 storage];
  uint64_t v14 = [v13 databaseName];
  uint64_t v15 = [v20 stringByAppendingPathComponent:v14];

  id v16 = [objc_alloc((Class)_DKSyncContext) initWithName:v15];
  double v17 = [(id)qword_100040F30 storage];
  [v16 setStorage:v17];

  uint64_t v18 = +[_DKSyncCoordinatorFactory syncCoordinatorWithContext:v16];
  double v19 = (void *)qword_100040F28;
  qword_100040F28 = v18;

  [(id)qword_100040F30 setSyncCoordinator:qword_100040F28];
}

void sub_1000190A0(id a1)
{
  +[_DKCloudUtilities setCloudKitEnabled:1];
  id v1 = [CDKnowledgeDaemon alloc];
  uint64_t v2 = _DKUserLocalMachServiceName;
  id v3 = +[CDDPaths userLocalKnowledgeDatabaseDirectory];
  double v4 = [(CDKnowledgeDaemon *)v1 initWithMachServiceName:v2 storePath:v3];
  BOOL v5 = (void *)qword_100040F48;
  qword_100040F48 = (uint64_t)v4;

  id v6 = [(id)qword_100040F48 storage];
  double v7 = [v6 storage];
  id v8 = [v7 directory];
  id v17 = +[NSString stringWithFormat:@"com.apple.coreduet.user.sync.coordinator.context:%@", v8];

  uint64_t v9 = [(id)qword_100040F48 storage];
  id v10 = [v9 storage];
  uint64_t v11 = [v10 databaseName];
  BOOL v12 = [v17 stringByAppendingPathComponent:v11];

  id v13 = [objc_alloc((Class)_DKSyncContext) initWithName:v12];
  uint64_t v14 = [(id)qword_100040F48 storage];
  [v13 setStorage:v14];

  uint64_t v15 = +[_DKSyncCoordinatorFactory syncCoordinatorWithContext:v13];
  id v16 = (void *)qword_100040F40;
  qword_100040F40 = v15;

  [(id)qword_100040F48 setSyncCoordinator:qword_100040F40];
}

void sub_100019978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000199B4(uint64_t a1)
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  os_activity_scope_leave(&v7);

  double v4 = [*(id *)(a1 + 32) activity];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained maintainPrivacyWithActivity:v4];

  if (v4 && xpc_activity_should_defer(v4) && !xpc_activity_set_state(v4, 3))
  {
    id v6 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100022A98(v6);
    }
  }
}

void sub_10001A870(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) closeStorage];
  id v1 = +[NSDistributedNotificationCenter defaultCenter];
  [v1 postNotificationName:_DKKnowledgeStorageDidAgeOutEventsNotification object:0];
}

void sub_10001B1CC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.cdinteraction.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = objc_alloc((Class)_CDInteractionDataCollectionTask);
      id v6 = +[_CDInteractionStore defaultDatabaseDirectory];
      os_activity_scope_state_s v7 = +[_CDInteractionStore storeWithDirectory:v6 readOnly:0];
      id v8 = [v5 initWithStore:v7 activity:v2];

      [v8 execute];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v18 = XPC_ACTIVITY_PRIORITY;
    double v19 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v20 = XPC_ACTIVITY_POWER_NAP;
    unsigned __int8 v21 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v22 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v9 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v10 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v11 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v12 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v13 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v14 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v14);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001B40C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.cdftcpinteraction.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = objc_alloc((Class)_CDFTCPInteractionDataCollectionTask);
      id v6 = +[_CDInteractionStore defaultDatabaseDirectory];
      os_activity_scope_state_s v7 = +[_CDInteractionStore storeWithDirectory:v6 readOnly:0];
      id v8 = [v5 initWithStore:v7 activity:v2];

      [v8 execute];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v18 = XPC_ACTIVITY_PRIORITY;
    double v19 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v20 = XPC_ACTIVITY_POWER_NAP;
    unsigned __int8 v21 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v22 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v9 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v10 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v11 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v12 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v13 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v14 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v14);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001B6F4(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.PersonLinking", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = [objc_alloc((Class)_CDPersonLinkingDataCollectionTask) initWithFile:@"/var/mobile/Library/CoreDuet/DataCollection/person_pairs_pet.json" activity:v2];
      [v5 execute];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v15 = XPC_ACTIVITY_PRIORITY;
    id v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v17 = XPC_ACTIVITY_POWER_NAP;
    uint64_t v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v10 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001B8F4(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.VisionSignalGrading", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = [objc_alloc((Class)_CDVisionSignalGradingDataCollectionTask) initWithFile:@"/var/mobile/Library/CoreDuet/DataCollection/vision_grades_pet.json" activity:v2];
      [v5 execute];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v15 = XPC_ACTIVITY_PRIORITY;
    id v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v17 = XPC_ACTIVITY_POWER_NAP;
    uint64_t v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v10 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001BAF4(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.cloudfamily.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = objc_alloc_init((Class)_PSFamilyMLPredictionTask);
      [v5 execute:v2];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v15 = XPC_ACTIVITY_PRIORITY;
    id v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v17 = XPC_ACTIVITY_POWER_NAP;
    uint64_t v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v10 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001BCE8(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      double v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.feedback.cna.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      id v5 = objc_alloc_init((Class)_PSCNAutocompleteFeedbackProcessingTask);
      [v5 execute];
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    uint64_t v15 = XPC_ACTIVITY_PRIORITY;
    id v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v17 = XPC_ACTIVITY_POWER_NAP;
    uint64_t v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v10 = &_xpc_BOOL_true;
    xpc_object_t values[6] = &_xpc_BOOL_true;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (uint64_t i = 6; i != -1; --i)
  }
}

void sub_10001BF24(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state)
  {
    if (state == 2) {
      notify_post((const char *)[@"com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery" UTF8String]);
    }
  }
  else
  {
    keys[0] = (char *)XPC_ACTIVITY_INTERVAL;
    keys[1] = (char *)XPC_ACTIVITY_REPEATING;
    keys[2] = (char *)XPC_ACTIVITY_PRIORITY;
    keys[3] = (char *)XPC_ACTIVITY_ALLOW_BATTERY;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_30_MIN);
    id v4 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_UTILITY);
    id v5 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
    xpc_activity_set_criteria(v2, v6);

    for (uint64_t i = 3; i != -1; --i)
  }
}

void sub_10001C124(uint64_t a1, void *a2)
{
  xpc_activity_state_t v3 = a2;
  xpc_activity_state_t v4 = xpc_activity_get_state(v3);
  if (v4)
  {
    if (v4 == 2)
    {
      id v5 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.mediaanalysis.proc.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      os_activity_scope_leave(&state);

      xpc_object_t v6 = +[_CDPaths peopleDirectory];
      id v7 = [v6 stringByAppendingPathComponent:@"MediaAnalysisProcessing"];
      id v8 = [objc_alloc((Class)NSData) initWithContentsOfFile:v7];
      if (v8)
      {
        id v22 = 0;
        id v9 = +[NSPropertyListSerialization propertyListWithData:v8 options:0 format:0 error:&v22];
        id v10 = v22;
        if (v10)
        {
          xpc_object_t v11 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_100022DB0(v10, v11);
          }
        }
        if (v9)
        {
          id v12 = [v9 objectForKeyedSubscript:@"_PSMediaAnalysisProcessing"];
          uint64_t v13 = [v12 objectForKeyedSubscript:@"BookmarkDate"];
          if (v13)
          {
            uint64_t v14 = *(void *)(a1 + 32);
            uint64_t v15 = *(void **)(v14 + 32);
            *(void *)(v14 + 32) = v13;

LABEL_15:
            id v21 = [objc_alloc((Class)_PSMediaAnalysisProcessingTask) initWithBookmark:*(void *)(*(void *)(a1 + 32) + 32) interactionStore:0];
            [v21 executeTaskWithCompletionHandler:&stru_100039118];

            goto LABEL_16;
          }
        }
      }
      uint64_t v19 = +[NSDate distantPast];
      uint64_t v20 = *(void *)(a1 + 32);
      id v10 = *(id *)(v20 + 32);
      *(void *)(v20 + 32) = v19;
      goto LABEL_15;
    }
  }
  else
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_object_t v17 = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_INTERVAL, v17);

    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REPEATING, &_xpc_BOOL_true);
    xpc_object_t v18 = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_PRIORITY, v18);

    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, &_xpc_BOOL_true);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_POWER_NAP, &_xpc_BOOL_true);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_ALLOW_BATTERY, &_xpc_BOOL_false);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_CLASS_C, &_xpc_BOOL_true);
    xpc_activity_set_criteria(v3, empty);
  }
LABEL_16:
}

void sub_10001C540(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  +[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10001C6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  +[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10001C834(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  +[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

id sub_10001CDA8(void *a1)
{
  return [a1 invoke];
}

id sub_10001CDC0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CDD8(void *a1)
{
  return [a1 invoke];
}

id sub_10001CDF0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE08(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE20(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE38(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE50(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE68(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE80(void *a1)
{
  return [a1 invoke];
}

id sub_10001CE98(void *a1)
{
  return [a1 invoke];
}

id sub_10001CEB0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CEC8(void *a1)
{
  return [a1 invoke];
}

id sub_10001CEE0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CEF8(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF10(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF28(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF40(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF58(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF70(void *a1)
{
  return [a1 invoke];
}

id sub_10001CF88(void *a1)
{
  return [a1 invoke];
}

id sub_10001CFA0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CFB8(void *a1)
{
  return [a1 invoke];
}

id sub_10001CFD0(void *a1)
{
  return [a1 invoke];
}

id sub_10001CFE8(void *a1)
{
  return [a1 invoke];
}

id sub_10001D000(void *a1)
{
  return [a1 invoke];
}

id sub_10001D018(void *a1)
{
  return [a1 invoke];
}

id sub_10001D030(void *a1)
{
  return [a1 invoke];
}

id sub_10001D048(void *a1)
{
  return [a1 invoke];
}

id sub_10001D060(void *a1)
{
  return [a1 invoke];
}

id sub_10001D078(void *a1)
{
  return [a1 invoke];
}

id sub_10001D090(void *a1)
{
  return [a1 invoke];
}

id sub_10001D0A8(void *a1)
{
  return [a1 invoke];
}

id sub_10001D0C0(void *a1)
{
  return [a1 invoke];
}

id sub_10001D0D8(void *a1)
{
  return [a1 invoke];
}

id sub_10001D0F0(void *a1)
{
  return [a1 invoke];
}

id sub_10001D108(void *a1)
{
  return [a1 invoke];
}

id sub_10001D120(void *a1)
{
  return [a1 invoke];
}

id sub_10001D138(void *a1)
{
  return [a1 invoke];
}

id sub_10001D150(void *a1)
{
  return [a1 invoke];
}

id sub_10001D168(void *a1)
{
  return [a1 invoke];
}

id sub_10001D180(void *a1)
{
  return [a1 invoke];
}

id sub_10001D198(void *a1)
{
  return [a1 invoke];
}

id sub_10001D1B0(void *a1)
{
  return [a1 invoke];
}

id sub_10001D1C8(void *a1)
{
  return [a1 invoke];
}

id sub_10001D1E0(void *a1)
{
  return [a1 invoke];
}

id sub_10001D1F8(void *a1)
{
  return [a1 invoke];
}

id sub_10001D210(void *a1)
{
  return [a1 invoke];
}

id sub_10001D228(void *a1)
{
  return [a1 invoke];
}

id sub_10001D240(void *a1)
{
  return [a1 invoke];
}

id sub_10001D258(void *a1)
{
  return [a1 invoke];
}

void sub_10001D27C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001D7A8(id a1)
{
  qword_100040F58 = objc_alloc_init(CDDataMigrator);

  _objc_release_x1();
}

void sub_10001D8AC(id a1, int a2)
{
  notify_cancel(a2);

  +[CDDataMigrator performMigration];
}

uint64_t sub_10001E044(uint64_t a1, int a2, const char **a3, const char **a4)
{
  if (a2 == 1 && !strcmp(*a4, "ZINTEGERID"))
  {
    int v9 = atoi(*a3);
    uint64_t v8 = 0;
    qword_100040F68 = v9;
  }
  else
  {
    uint64_t v8 = 1;
  }
  return v8;
}

uint64_t sub_10001E0C4(void *a1, int a2, const char **a3, const char **a4)
{
  int v9 = v8;
  if (a2 < 1)
  {
    id v10 = 0;
    id v11 = 0;
    goto LABEL_24;
  }
  id v25 = a1;
  int v26 = v8;
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = a2;
  do
  {
    uint64_t v13 = *a4;
    if (!strcmp(*a4, "ZCREATIONDATE"))
    {
      double v16 = strtod(*a3, 0);
      if (v16 <= 0.0) {
        goto LABEL_9;
      }
      uint64_t v17 = +[NSDate dateWithTimeIntervalSinceNow:-v16];
      uint64_t v15 = v10;
      id v10 = (id)v17;
    }
    else
    {
      if (strcmp(v13, "ZVALUE")) {
        goto LABEL_9;
      }
      uint64_t v14 = +[NSString stringWithUTF8String:*a3];
      uint64_t v15 = v11;
      id v11 = (id)v14;
    }

LABEL_9:
    ++a3;
    ++a4;
    --v12;
  }
  while (v12);
  if (v10)
  {
    int v9 = v26;
    if (v11)
    {
      id v18 = v25;
      id v11 = v11;
      id v10 = v10;
      if (qword_100040F70 != -1) {
        dispatch_once(&qword_100040F70, &stru_100039338);
      }
      uint64_t v20 = +[_DKEvent eventWithStream:qword_100040F78 startDate:v10 endDate:v10 identifierStringValue:v11 metadata:0];

      [v18 addObject:v20];
      if ((unint64_t)[v18 count] >= 0x101)
      {
        id v21 = +[_DKKnowledgeStore knowledgeStore];
        id v27 = 0;
        [v21 saveObjects:v18 error:&v27];
        id v22 = v27;
        if (v22)
        {
          id v23 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_100023010();
          }
        }
        else
        {
          [v18 removeAllObjects];
        }
      }
    }
  }
  else
  {
    int v9 = v26;
  }
LABEL_24:

  return 0;
}

void sub_10001EA2C(id a1)
{
  id v3 = +[_DKAnyStringIdentifier type];
  uint64_t v1 = +[_DKEventStream eventStreamWithName:@"com.apple.spotlightviewer.events" valueType:v3];
  uint64_t v2 = (void *)qword_100040F78;
  qword_100040F78 = v1;
}

void sub_10001EAFC(id a1)
{
  qword_100040F80 = objc_alloc_init(CDD);

  _objc_release_x1();
}

uint64_t sub_10001F05C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isClassCLocked] & 1) == 0)
  {
    uint64_t v2 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Class C unlocked...", v4, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  }
  return notify_cancel(*(_DWORD *)(a1 + 40));
}

id sub_10001F0EC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isLocked];
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = (_BYTE)result;
  return result;
}

id sub_10001F1F8(uint64_t a1)
{
  long long v6 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v3 = 1814400;
  long long v7 = 0uLL;
  long long v8 = xmmword_100031E10;
  long long v11 = 0uLL;
  [*(id *)(*(void *)(a1 + 32) + 8) registerScheduledExchange:&v3];
  return [*(id *)(*(void *)(a1 + 32) + 8) setupCommControl];
}

void sub_10001FF2C(id a1, id a2)
{
}

id sub_10001FF50(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  long long v4 = +[NSString stringWithFormat:@"%@%s", v2, "XQW90"];
  id v5 = [v3 hasPrefix:v4];

  return v5;
}

void sub_100020324(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000203D8;
    v5[3] = &unk_100039710;
    id v6 = *(id *)(a1 + 32);
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

id sub_1000203D8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&off_10003B828 forKeyedSubscript:a2];
}

void sub_10002087C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = +[_CDLogging communicatorChannel];
  long long v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002310C((uint64_t)v5, v7);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saved histogram: %@", (uint8_t *)&v10, 0xCu);
  }

  if (*(void *)(a1 + 48))
  {
    long long v7 = +[CDKnowledgeDaemon defaultDaemon];
    long long v9 = [v7 storage];
    [v9 deleteHistogram:*(void *)(a1 + 48)];

LABEL_9:
  }
}

void sub_100020C44(id a1, id a2)
{
}

void sub_100021A68(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 privacyCloak];
  id v4 = [v2 cdd];

  id v3 = [v4 communicator];
  [v3 triggerSystemDataExchange:1 wakeRemote:0];
}

unsigned char *sub_100021B54(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isManagedConfigurationSettingOn])
  {
    id result = *(unsigned char **)(a1 + 32);
    if (!result[24])
    {
      id v3 = [result cdd];
      id v4 = +[NSDate date];
      [v3 setDatabaseAge:v4];

      id result = *(unsigned char **)(a1 + 32);
    }
    result[24] = 1;
  }
  else
  {
    id v5 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting All Sensitive Entries in DB.", v6, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    return [*(id *)(a1 + 32) deletePrivacySensitiveDBEntries];
  }
  return result;
}

void sub_100021CE4()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Registering xpc_set_event_stream_handler(\"com.apple.distnoted.matching\"", v0, 2u);
}

void sub_100021D2C()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Registering xpc_set_event_stream_handler(\"com.apple.notifyd.matching\"", v0, 2u);
}

void sub_100021D74(uint64_t a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:a1];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received notifyd xpc notification: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100021E18(uint64_t a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:a1];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received distnoted xpc notification: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100021EBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CRITICAL error: failed to access push limit defaults", v1, 2u);
}

void sub_100021F00(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection from PID %d rejected for lacking entitlement", (uint8_t *)v3, 8u);
}

void sub_100021F8C()
{
  sub_10000D2F0();
  sub_10000D31C((void *)&_mh_execute_header, v0, v1, "Could not populate caches, device is class C locked", v2, v3, v4, v5, v6);
}

void sub_100021FC0()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Storing version number into defaults", v2, v3, v4, v5, v6);
}

void sub_100021FF4(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Interaction store version %ld is current", (uint8_t *)&v1, 0xCu);
}

void sub_100022074()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Requesting interaction repopulation", v2, v3, v4, v5, v6);
}

void sub_1000220A8(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Recording current interaction store version %ld", (uint8_t *)&v1, 0xCu);
}

void sub_100022128(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Interaction store version mismatch (current %ld != desired %ld). Deleting storage.", (uint8_t *)&v2, 0x16u);
}

void sub_1000221B0()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Checking interaction store version", v2, v3, v4, v5, v6);
}

void sub_1000221E4()
{
  sub_10000D338();
  sub_10000D368((void *)&_mh_execute_header, v0, v1, "Could not list file attributes of %@. Error: %@.");
}

void sub_10002224C()
{
  sub_10000D338();
  sub_10000D368((void *)&_mh_execute_header, v0, v1, "Could not change POSIX permissions of %@ to 0644. Error: %@.");
}

void sub_1000222B4()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Repopulation date did synchronize.", v2, v3, v4, v5, v6);
}

void sub_1000222E8()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Defaults did synchronize.", v2, v3, v4, v5, v6);
}

void sub_10002231C()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Repopulation is off by default, enable it with (iOS as mobile, OSX as root):\ndefaults write com.apple.coreduetd EnableInteractionRepopulation YES", v2, v3, v4, v5, v6);
}

void sub_100022350()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Interaction repopulation defaults did synchronize.", v2, v3, v4, v5, v6);
}

void sub_100022384()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Checking in repopulation job", v2, v3, v4, v5, v6);
}

void sub_1000223B8()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Done with repopulation", v2, v3, v4, v5, v6);
}

void sub_1000223EC(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 count];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Harvested %lu interactions", a1, 0xCu);
}

void sub_100022458(void *a1, NSObject *a2)
{
  [a1 timeIntervalSinceNow];
  int v4 = 134217984;
  double v5 = v3 / -86400.0;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Starting batch repopulation with checkpoint = %2.1f days ago", (uint8_t *)&v4, 0xCu);
}

void sub_1000224F0()
{
  sub_10000D2F0();
  sub_10000D31C((void *)&_mh_execute_header, v0, v1, "Device is Class C locked", v2, v3, v4, v5, v6);
}

void sub_100022524(id *a1)
{
  [*a1 maxNumberOfInteractionsStored];
  sub_10000D2FC((void *)&_mh_execute_header, v1, v2, "Deleted %lu interactions to keep max count at %lu", v3, v4, v5, v6, 0);
}

void sub_1000225B4(id *a1)
{
  uint64_t v1 = [*a1 dateOfOldestAllowedInteraction];
  sub_10000D350();
  sub_10000D2FC((void *)&_mh_execute_header, v2, v3, "Deleted %lu Non first-party whitelisted interations older than %@", v4, v5, v6, v7, v8);
}

void sub_100022648(id *a1)
{
  uint64_t v1 = [*a1 dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds];
  sub_10000D350();
  sub_10000D2FC((void *)&_mh_execute_header, v2, v3, "Deleted %lu first-party allowlisted interations older than %@", v4, v5, v6, v7, v8);
}

void sub_1000226DC()
{
  sub_10000D2F0();
  sub_10000D2D4((void *)&_mh_execute_header, v0, v1, "Performing privacy maintenance for interactions", v2, v3, v4, v5, v6);
}

void sub_100022710(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error registering token to post conditions changed notifications!", v1, 2u);
}

void sub_100022754(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Saved date did synchronize.", v1, 2u);
}

void sub_100022798(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error unarchiving object %@", (uint8_t *)&v2, 0xCu);
}

void sub_100022810(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Restore defaults did synchronize.", v1, 2u);
}

void sub_100022854()
{
}

void sub_100022880(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "send sysdata: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100022918()
{
}

void sub_100022944()
{
}

void sub_100022970(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "received sysdata: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000229E8()
{
}

void sub_100022A14()
{
}

void sub_100022A40()
{
}

void sub_100022A6C()
{
}

void sub_100022A98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set defer state for privacy maintenance activity.", v1, 2u);
}

void sub_100022ADC()
{
  sub_10001D270();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%@\nDetected knowledge database corruption. Deleting Storage", v1, 0xCu);
}

void sub_100022B50(void *a1)
{
  [a1 count];
  sub_10001D270();
  sub_10001D27C((void *)&_mh_execute_header, v1, v2, "Attempting to save %lu objects to knowledge store", v3, v4, v5, v6, v7);
}

void sub_100022BC8(void *a1)
{
  [a1 count];
  sub_10001D270();
  sub_10001D27C((void *)&_mh_execute_header, v1, v2, "Attempting to delete %lu objects from knowledge store", v3, v4, v5, v6, v7);
}

void sub_100022C40()
{
  sub_10001D270();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Client provided invalid predicate %@", v1, 0xCu);
}

void sub_100022CB4()
{
  sub_10001D270();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Storage appears to be invalid: %@", v1, 0xCu);
}

void sub_100022D28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ARPHomeControl Suggester Notification", v1, 2u);
}

void sub_100022D6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Media Analysis Processing Task", v1, 2u);
}

void sub_100022DB0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_10001D270();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error encountered while reading from plist: %@", v4, 0xCu);
}

void sub_100022E44(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Notification registration failed for data migration with status %d.", (uint8_t *)v1, 8u);
}

void sub_100022EC4()
{
  sub_10001D270();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Successfully removed file %@", v0, 0xCu);
}

void sub_100022F40()
{
  sub_10001D270();
  __int16 v2 = 2112;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to remove file at path %@ with error %@", v1, 0x16u);
}

void sub_100022FC8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Database migration was not successful.", v0, 2u);
}

void sub_100023010()
{
  sub_10001D270();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to migrate spotlight events: %@", v1, 0xCu);
}

void sub_100023084(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Initialization of one of the daemon's modules failed", v1, 2u);
}

void sub_1000230C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IDS Framework not available. Communicator not instantiated.", v1, 2u);
}

void sub_10002310C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error saving histogram: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100023184(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 firstObject];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = objc_opt_class();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error obtaining DB age: %@ last event class: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002323C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Privacy setting did synchronize.", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ARPCollectAndSendAnalyticsEvents()
{
  return _ARPCollectAndSendAnalyticsEvents();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CDCurrentOrXPCProcessName()
{
  return __CDCurrentOrXPCProcessName();
}

uint64_t _DKDaemonInterface()
{
  return __DKDaemonInterface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _cdknowledge_signpost_event_count()
{
  return __cdknowledge_signpost_event_count();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

uint64_t proc_set_cpumon_params()
{
  return _proc_set_cpumon_params();
}

uint64_t setClassesForCDInteractionXPCInterface()
{
  return _setClassesForCDInteractionXPCInterface();
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
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

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_CDDConfigurationBundlePath(void *a1, const char *a2, ...)
{
  return [a1 CDDConfigurationBundlePath];
}

id objc_msgSend_CDDConfigurationBundlePathDefault(void *a1, const char *a2, ...)
{
  return [a1 CDDConfigurationBundlePathDefault];
}

id objc_msgSend_CDDDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 CDDDatabaseDirectory];
}

id objc_msgSend_CDDUserDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 CDDUserDatabaseDirectory];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__maintainPrivacy(void *a1, const char *a2, ...)
{
  return [a1 _maintainPrivacy];
}

id objc_msgSend__migrateSpotlightEvents(void *a1, const char *a2, ...)
{
  return [a1 _migrateSpotlightEvents];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_admissionCheckChannel(void *a1, const char *a2, ...)
{
  return [a1 admissionCheckChannel];
}

id objc_msgSend_ageOfDatabase(void *a1, const char *a2, ...)
{
  return [a1 ageOfDatabase];
}

id objc_msgSend_airplayTaskScheduler(void *a1, const char *a2, ...)
{
  return [a1 airplayTaskScheduler];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowEvaluation(void *a1, const char *a2, ...)
{
  return [a1 allowEvaluation];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return [a1 appInFocusStream];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizedEventStreamsToRead(void *a1, const char *a2, ...)
{
  return [a1 authorizedEventStreamsToRead];
}

id objc_msgSend_batteryMonitorExchangeBattDelta(void *a1, const char *a2, ...)
{
  return [a1 batteryMonitorExchangeBattDelta];
}

id objc_msgSend_batteryMonitorExchangeTimerDelta(void *a1, const char *a2, ...)
{
  return [a1 batteryMonitorExchangeTimerDelta];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cacheSharesForEachApp(void *a1, const char *a2, ...)
{
  return [a1 cacheSharesForEachApp];
}

id objc_msgSend_candidatesForShareSheetRankingCompute(void *a1, const char *a2, ...)
{
  return [a1 candidatesForShareSheetRankingCompute];
}

id objc_msgSend_cdd(void *a1, const char *a2, ...)
{
  return [a1 cdd];
}

id objc_msgSend_checkForecastSync(void *a1, const char *a2, ...)
{
  return [a1 checkForecastSync];
}

id objc_msgSend_classCAndPasscodeCheck(void *a1, const char *a2, ...)
{
  return [a1 classCAndPasscodeCheck];
}

id objc_msgSend_classCError(void *a1, const char *a2, ...)
{
  return [a1 classCError];
}

id objc_msgSend_classCLocked(void *a1, const char *a2, ...)
{
  return [a1 classCLocked];
}

id objc_msgSend_closeStorage(void *a1, const char *a2, ...)
{
  return [a1 closeStorage];
}

id objc_msgSend_commEnabled(void *a1, const char *a2, ...)
{
  return [a1 commEnabled];
}

id objc_msgSend_commMinClientGranularity(void *a1, const char *a2, ...)
{
  return [a1 commMinClientGranularity];
}

id objc_msgSend_commSyncBoundarySeconds(void *a1, const char *a2, ...)
{
  return [a1 commSyncBoundarySeconds];
}

id objc_msgSend_communicator(void *a1, const char *a2, ...)
{
  return [a1 communicator];
}

id objc_msgSend_communicatorChannel(void *a1, const char *a2, ...)
{
  return [a1 communicatorChannel];
}

id objc_msgSend_computeDatabaseAge(void *a1, const char *a2, ...)
{
  return [a1 computeDatabaseAge];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_confirmDatabaseConnectionError(void *a1, const char *a2, ...)
{
  return [a1 confirmDatabaseConnectionError];
}

id objc_msgSend_contactSuggester(void *a1, const char *a2, ...)
{
  return [a1 contactSuggester];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 currentBatteryLevel];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentCellQuality(void *a1, const char *a2, ...)
{
  return [a1 currentCellQuality];
}

id objc_msgSend_currentFocalApplication(void *a1, const char *a2, ...)
{
  return [a1 currentFocalApplication];
}

id objc_msgSend_currentFocalNonApps(void *a1, const char *a2, ...)
{
  return [a1 currentFocalNonApps];
}

id objc_msgSend_currentWiFiWiredQuality(void *a1, const char *a2, ...)
{
  return [a1 currentWiFiWiredQuality];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_databaseName(void *a1, const char *a2, ...)
{
  return [a1 databaseName];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateOfOldestAllowedInteraction(void *a1, const char *a2, ...)
{
  return [a1 dateOfOldestAllowedInteraction];
}

id objc_msgSend_dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds(void *a1, const char *a2, ...)
{
  return [a1 dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultDaemon(void *a1, const char *a2, ...)
{
  return [a1 defaultDaemon];
}

id objc_msgSend_defaultDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabaseDirectory];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deletePrivacySensitiveDBEntries(void *a1, const char *a2, ...)
{
  return [a1 deletePrivacySensitiveDBEntries];
}

id objc_msgSend_deleteStorage(void *a1, const char *a2, ...)
{
  return [a1 deleteStorage];
}

id objc_msgSend_deregisterForSystemConditionChanges(void *a1, const char *a2, ...)
{
  return [a1 deregisterForSystemConditionChanges];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceBatteryPercentageStream(void *a1, const char *a2, ...)
{
  return [a1 deviceBatteryPercentageStream];
}

id objc_msgSend_deviceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifiers];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return [a1 directory];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_dkcMigration(void *a1, const char *a2, ...)
{
  return [a1 dkcMigration];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpAll(void *a1, const char *a2, ...)
{
  return [a1 dumpAll];
}

id objc_msgSend_effectiveBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveBundleIdentifier];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_ensembleModel(void *a1, const char *a2, ...)
{
  return [a1 ensembleModel];
}

id objc_msgSend_enterMaintenanceMode(void *a1, const char *a2, ...)
{
  return [a1 enterMaintenanceMode];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_eventCountPerStreamName(void *a1, const char *a2, ...)
{
  return [a1 eventCountPerStreamName];
}

id objc_msgSend_eventStreams(void *a1, const char *a2, ...)
{
  return [a1 eventStreams];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_executeCorrelationTask(void *a1, const char *a2, ...)
{
  return [a1 executeCorrelationTask];
}

id objc_msgSend_exitMaintenanceMode(void *a1, const char *a2, ...)
{
  return [a1 exitMaintenanceMode];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_extensionHostIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionHostIdentifier];
}

id objc_msgSend_familyRecommendations(void *a1, const char *a2, ...)
{
  return [a1 familyRecommendations];
}

id objc_msgSend_familyRecommender(void *a1, const char *a2, ...)
{
  return [a1 familyRecommender];
}

id objc_msgSend_filePosixPermissions(void *a1, const char *a2, ...)
{
  return [a1 filePosixPermissions];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generateFocalNonAppFocalMutableSet(void *a1, const char *a2, ...)
{
  return [a1 generateFocalNonAppFocalMutableSet];
}

id objc_msgSend_generateNonAppFocalString(void *a1, const char *a2, ...)
{
  return [a1 generateNonAppFocalString];
}

id objc_msgSend_getAckMessage(void *a1, const char *a2, ...)
{
  return [a1 getAckMessage];
}

id objc_msgSend_getCurrrentSupportedVersions(void *a1, const char *a2, ...)
{
  return [a1 getCurrrentSupportedVersions];
}

id objc_msgSend_getScheduledForecasts(void *a1, const char *a2, ...)
{
  return [a1 getScheduledForecasts];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_informCommunicationError(void *a1, const char *a2, ...)
{
  return [a1 informCommunicationError];
}

id objc_msgSend_instrumentationChannel(void *a1, const char *a2, ...)
{
  return [a1 instrumentationChannel];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intentSpotlightIndex(void *a1, const char *a2, ...)
{
  return [a1 intentSpotlightIndex];
}

id objc_msgSend_interactionChannel(void *a1, const char *a2, ...)
{
  return [a1 interactionChannel];
}

id objc_msgSend_interactionCountPerMechanism(void *a1, const char *a2, ...)
{
  return [a1 interactionCountPerMechanism];
}

id objc_msgSend_interactionPolicies(void *a1, const char *a2, ...)
{
  return [a1 interactionPolicies];
}

id objc_msgSend_interactionSignpost(void *a1, const char *a2, ...)
{
  return [a1 interactionSignpost];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isClassCLocked(void *a1, const char *a2, ...)
{
  return [a1 isClassCLocked];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isKnowledgeAgent(void *a1, const char *a2, ...)
{
  return [a1 isKnowledgeAgent];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isManagedConfigurationSettingOn(void *a1, const char *a2, ...)
{
  return [a1 isManagedConfigurationSettingOn];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isPluggedIn(void *a1, const char *a2, ...)
{
  return [a1 isPluggedIn];
}

id objc_msgSend_isRunningOnInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isRunningOnInternalBuild];
}

id objc_msgSend_isSpringBoardElement(void *a1, const char *a2, ...)
{
  return [a1 isSpringBoardElement];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_keyPathForBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryLevel];
}

id objc_msgSend_keyPathForCellConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCellConnectionQuality];
}

id objc_msgSend_keyPathForDefaultPairedDeviceBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceBatteryLevel];
}

id objc_msgSend_keyPathForDefaultPairedDeviceForegroundApp(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceForegroundApp];
}

id objc_msgSend_keyPathForDefaultPairedDevicePluginStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDevicePluginStatus];
}

id objc_msgSend_keyPathForDefaultPairedDeviceThermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceThermalPressureLevel];
}

id objc_msgSend_keyPathForDefaultPairedServicesAppearingForeground(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedServicesAppearingForeground];
}

id objc_msgSend_keyPathForForegroundApp(void *a1, const char *a2, ...)
{
  return [a1 keyPathForForegroundApp];
}

id objc_msgSend_keyPathForPluginStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPluginStatus];
}

id objc_msgSend_keyPathForServicesAppearingForeground(void *a1, const char *a2, ...)
{
  return [a1 keyPathForServicesAppearingForeground];
}

id objc_msgSend_keyPathForSiriActiveStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForSiriActiveStatus];
}

id objc_msgSend_keyPathForThermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForThermalPressureLevel];
}

id objc_msgSend_keyPathForWiFiConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiFiConnectionQuality];
}

id objc_msgSend_keyPathForWiredConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiredConnectionQuality];
}

id objc_msgSend_knowledgeChannel(void *a1, const char *a2, ...)
{
  return [a1 knowledgeChannel];
}

id objc_msgSend_knowledgeDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 knowledgeDatabaseDirectory];
}

id objc_msgSend_knowledgeSignpost(void *a1, const char *a2, ...)
{
  return [a1 knowledgeSignpost];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_knowledgeStoreWithDirectReadOnlyAccess(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStoreWithDirectReadOnlyAccess];
}

id objc_msgSend_lastFocalApp(void *a1, const char *a2, ...)
{
  return [a1 lastFocalApp];
}

id objc_msgSend_lastFocalNonApps(void *a1, const char *a2, ...)
{
  return [a1 lastFocalNonApps];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadDefaults];
}

id objc_msgSend_loadSavedDateIfExist(void *a1, const char *a2, ...)
{
  return [a1 loadSavedDateIfExist];
}

id objc_msgSend_localInBedPeriod(void *a1, const char *a2, ...)
{
  return [a1 localInBedPeriod];
}

id objc_msgSend_localMaxSupportedVersionNumber(void *a1, const char *a2, ...)
{
  return [a1 localMaxSupportedVersionNumber];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logMigration(void *a1, const char *a2, ...)
{
  return [a1 logMigration];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_macSleepModelingDataCollectionTasks(void *a1, const char *a2, ...)
{
  return [a1 macSleepModelingDataCollectionTasks];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_maintainPrivacy(void *a1, const char *a2, ...)
{
  return [a1 maintainPrivacy];
}

id objc_msgSend_makeAckMessage(void *a1, const char *a2, ...)
{
  return [a1 makeAckMessage];
}

id objc_msgSend_makeRemoteDeviceSyncMessage(void *a1, const char *a2, ...)
{
  return [a1 makeRemoteDeviceSyncMessage];
}

id objc_msgSend_makeSystemComboMessage(void *a1, const char *a2, ...)
{
  return [a1 makeSystemComboMessage];
}

id objc_msgSend_maxNumberOfInteractionsDeleted(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfInteractionsDeleted];
}

id objc_msgSend_maxNumberOfInteractionsStored(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfInteractionsStored];
}

id objc_msgSend_messagesPinningSuggester(void *a1, const char *a2, ...)
{
  return [a1 messagesPinningSuggester];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextResetTime(void *a1, const char *a2, ...)
{
  return [a1 nextResetTime];
}

id objc_msgSend_obtainForegroundApplication(void *a1, const char *a2, ...)
{
  return [a1 obtainForegroundApplication];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedDeviceForecastStream(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceForecastStream];
}

id objc_msgSend_peopleDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 peopleDatabaseDirectory];
}

id objc_msgSend_peopleDirectory(void *a1, const char *a2, ...)
{
  return [a1 peopleDirectory];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_populateAppSharesCache(void *a1, const char *a2, ...)
{
  return [a1 populateAppSharesCache];
}

id objc_msgSend_populateAppUsageCache(void *a1, const char *a2, ...)
{
  return [a1 populateAppUsageCache];
}

id objc_msgSend_populateCaches(void *a1, const char *a2, ...)
{
  return [a1 populateCaches];
}

id objc_msgSend_populatePeopleSuggesterCaches(void *a1, const char *a2, ...)
{
  return [a1 populatePeopleSuggesterCaches];
}

id objc_msgSend_privacyCloak(void *a1, const char *a2, ...)
{
  return [a1 privacyCloak];
}

id objc_msgSend_privacyMonitor(void *a1, const char *a2, ...)
{
  return [a1 privacyMonitor];
}

id objc_msgSend_privacyPolicyEnforcer(void *a1, const char *a2, ...)
{
  return [a1 privacyPolicyEnforcer];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_queryInteractionsOnlyAuthorization(void *a1, const char *a2, ...)
{
  return [a1 queryInteractionsOnlyAuthorization];
}

id objc_msgSend_queryVersionNumber(void *a1, const char *a2, ...)
{
  return [a1 queryVersionNumber];
}

id objc_msgSend_rateLimitPolicyEnforcer(void *a1, const char *a2, ...)
{
  return [a1 rateLimitPolicyEnforcer];
}

id objc_msgSend_readConfigParamsFromPlist(void *a1, const char *a2, ...)
{
  return [a1 readConfigParamsFromPlist];
}

id objc_msgSend_readRepopulationCheckpoint(void *a1, const char *a2, ...)
{
  return [a1 readRepopulationCheckpoint];
}

id objc_msgSend_readVersionNumberFromDefaults(void *a1, const char *a2, ...)
{
  return [a1 readVersionNumberFromDefaults];
}

id objc_msgSend_refreshCaches(void *a1, const char *a2, ...)
{
  return [a1 refreshCaches];
}

id objc_msgSend_refreshPeopleSuggesterCaches(void *a1, const char *a2, ...)
{
  return [a1 refreshPeopleSuggesterCaches];
}

id objc_msgSend_registerARPHomeControlNotificationTask(void *a1, const char *a2, ...)
{
  return [a1 registerARPHomeControlNotificationTask];
}

id objc_msgSend_registerAirPlayTasks(void *a1, const char *a2, ...)
{
  return [a1 registerAirPlayTasks];
}

id objc_msgSend_registerCDFTCPInteractionDataCollectionTask(void *a1, const char *a2, ...)
{
  return [a1 registerCDFTCPInteractionDataCollectionTask];
}

id objc_msgSend_registerCDInteractionDataCollectionTask(void *a1, const char *a2, ...)
{
  return [a1 registerCDInteractionDataCollectionTask];
}

id objc_msgSend_registerCloudFamilyPredictionTask(void *a1, const char *a2, ...)
{
  return [a1 registerCloudFamilyPredictionTask];
}

id objc_msgSend_registerContactsAutocompleteFeedbackProcessingTask(void *a1, const char *a2, ...)
{
  return [a1 registerContactsAutocompleteFeedbackProcessingTask];
}

id objc_msgSend_registerDataCollectionTasks(void *a1, const char *a2, ...)
{
  return [a1 registerDataCollectionTasks];
}

id objc_msgSend_registerForSystemConditionChanges(void *a1, const char *a2, ...)
{
  return [a1 registerForSystemConditionChanges];
}

id objc_msgSend_registerPeopleSuggesterTasks(void *a1, const char *a2, ...)
{
  return [a1 registerPeopleSuggesterTasks];
}

id objc_msgSend_registerPersonLinkingDataCollectionTask(void *a1, const char *a2, ...)
{
  return [a1 registerPersonLinkingDataCollectionTask];
}

id objc_msgSend_registerVisionSignalGradingDataCollectionTask(void *a1, const char *a2, ...)
{
  return [a1 registerVisionSignalGradingDataCollectionTask];
}

id objc_msgSend_registerWithTrial(void *a1, const char *a2, ...)
{
  return [a1 registerWithTrial];
}

id objc_msgSend_remoteDeviceInBedTimesStream(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceInBedTimesStream];
}

id objc_msgSend_remoteHistogramMigration(void *a1, const char *a2, ...)
{
  return [a1 remoteHistogramMigration];
}

id objc_msgSend_remoteVersionNumber(void *a1, const char *a2, ...)
{
  return [a1 remoteVersionNumber];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reportPeopleStatistics(void *a1, const char *a2, ...)
{
  return [a1 reportPeopleStatistics];
}

id objc_msgSend_requestInteractionRepopulation(void *a1, const char *a2, ...)
{
  return [a1 requestInteractionRepopulation];
}

id objc_msgSend_requestRemoteDeviceSync(void *a1, const char *a2, ...)
{
  return [a1 requestRemoteDeviceSync];
}

id objc_msgSend_resetPushLimits(void *a1, const char *a2, ...)
{
  return [a1 resetPushLimits];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return [a1 resultType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retrieveHistogram(void *a1, const char *a2, ...)
{
  return [a1 retrieveHistogram];
}

id objc_msgSend_saveLastDate(void *a1, const char *a2, ...)
{
  return [a1 saveLastDate];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setDefaultConfigParams(void *a1, const char *a2, ...)
{
  return [a1 setDefaultConfigParams];
}

id objc_msgSend_setupCommControl(void *a1, const char *a2, ...)
{
  return [a1 setupCommControl];
}

id objc_msgSend_setupCommunicator(void *a1, const char *a2, ...)
{
  return [a1 setupCommunicator];
}

id objc_msgSend_setupDataProtectionChangeHandler(void *a1, const char *a2, ...)
{
  return [a1 setupDataProtectionChangeHandler];
}

id objc_msgSend_setupIDSLink(void *a1, const char *a2, ...)
{
  return [a1 setupIDSLink];
}

id objc_msgSend_setupServices(void *a1, const char *a2, ...)
{
  return [a1 setupServices];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sourceDeviceIdentity(void *a1, const char *a2, ...)
{
  return [a1 sourceDeviceIdentity];
}

id objc_msgSend_spotlightViewerEventsMigration(void *a1, const char *a2, ...)
{
  return [a1 spotlightViewerEventsMigration];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startIntentDeletionForContactDeletions(void *a1, const char *a2, ...)
{
  return [a1 startIntentDeletionForContactDeletions];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suggester(void *a1, const char *a2, ...)
{
  return [a1 suggester];
}

id objc_msgSend_syncCoordinator(void *a1, const char *a2, ...)
{
  return [a1 syncCoordinator];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncStateWithActiveRemote(void *a1, const char *a2, ...)
{
  return [a1 syncStateWithActiveRemote];
}

id objc_msgSend_syncStorage(void *a1, const char *a2, ...)
{
  return [a1 syncStorage];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_thermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 thermalPressureLevel];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unauthorizedClientError(void *a1, const char *a2, ...)
{
  return [a1 unauthorizedClientError];
}

id objc_msgSend_unavailableForCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 unavailableForCurrentUser];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDOverride];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateAllowed(void *a1, const char *a2, ...)
{
  return [a1 updateAllowed];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_userLocalKnowledgeDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 userLocalKnowledgeDatabaseDirectory];
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return [a1 verbose];
}

id objc_msgSend_versionCheckAndUpgradeIfNecessaryAndPossible(void *a1, const char *a2, ...)
{
  return [a1 versionCheckAndUpgradeIfNecessaryAndPossible];
}

id objc_msgSend_watchUpdate(void *a1, const char *a2, ...)
{
  return [a1 watchUpdate];
}

id objc_msgSend_watchUpdateLog(void *a1, const char *a2, ...)
{
  return [a1 watchUpdateLog];
}

id objc_msgSend_whitelistedFirstPartyBundleIds(void *a1, const char *a2, ...)
{
  return [a1 whitelistedFirstPartyBundleIds];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_zkwSuggestionsFromContext_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return [a1 zkwSuggestionsFromContext:x0 maxSuggestions:x1 reply:x2];
}