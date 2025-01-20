void sub_25D0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned int v4;
  int64_t v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;

  v1 = a1;
  v2 = v1;
  if (!byte_153D8
    || ([v1 name],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = [v3 hasPrefix:@"com.apple.xpc.activity.test."],
        v3,
        v4))
  {
    v5 = sub_5348();
    v6 = [v2 eligibleTime];
    v7 = (uint64_t)v6 - v5 < 1000000000 || (uint64_t)v6 < v5;
    v8 = v5 + 1000000000;
    if (!v7) {
      v8 = (uint64_t)v6;
    }
    if (v8 < qword_153B8)
    {
      qword_153B8 = v8;
      v9 = qword_15408;
      v10 = v8 - v5;
      v11 = dispatch_walltime(0, v8 - v5);
      dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v12 = qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
      {
        v13 = 138543618;
        v14 = v2;
        v15 = 2048;
        v16 = v10 / 0x3B9ACA00;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Scheduling activity timer for [%{public}@] in %lld seconds", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

void sub_28D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2AD4(uint64_t a1, id a2, void *a3)
{
  id v5 = a3;
  if (a1 == 2)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v8 = [(id)qword_153E8 copy];
    id v11 = [v8 countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v80;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v80 != v13) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([v15 token] == a2)
          {
            v16 = qword_15478;
            if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v15;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Unregistered on XPC remove event: %{public}@", buf, 0xCu);
            }
            [(id)qword_153E8 removeObject:v15];
            if (byte_153D8
              && (objc_msgSend(v15, "scheduler_activity"), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
              && (v18 = (void *)v17, unsigned int v19 = [v15 repeating], v18, v19))
            {
              if (qword_15420) {
                sub_8140();
              }
              v20 = qword_15470;
              if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = v15;
                _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Creating zombie: %{public}@", buf, 0xCu);
              }
              objc_storeStrong((id *)&qword_15420, v15);
              __uint64_t v21 = sub_5348();
              uint64_t v22 = v21 + 100000000;
              if ((uint64_t)(v21 + 100000000) < qword_153B8)
              {
                __uint64_t v23 = v21;
                qword_153B8 = v21 + 100000000;
                v24 = qword_15470;
                if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&buf[4] = qword_15420;
                  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Set timer for zombie: %{public}@", buf, 0xCu);
                  uint64_t v22 = qword_153B8;
                }
                v25 = qword_15408;
                dispatch_time_t v26 = dispatch_walltime(0, v22 - v23);
                dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
              }
            }
            else
            {
              sub_8548(v15);
            }
            goto LABEL_75;
          }
        }
        id v12 = [v8 countByEnumeratingWithState:&v79 objects:v83 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    goto LABEL_75;
  }
  if (a1 == 1)
  {
    memset(v84, 0, sizeof(v84));
    if ((xpc_get_event_name() & 1) == 0) {
      __strlcpy_chk();
    }
    v6 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v84;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Creating on XPC add event: %{public}s", buf, 0xCu);
    }
    v7 = sub_3F00((uint64_t)v84, v5);
    id v8 = v7;
    if (!v7)
    {
      uint64_t v27 = qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = v84;
        v28 = "Failed to create: %{public}s";
LABEL_73:
        v57 = v27;
LABEL_74:
        _os_log_impl(&dword_0, v57, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
LABEL_75:

      goto LABEL_76;
    }
    [v7 setToken:a2];
    if ([v8 token])
    {
      [v8 token];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      memset(buf, 0, sizeof(buf));
      if (xpc_get_service_identifier_for_token())
      {
        v9 = +[NSString stringWithUTF8String:buf];
        if ([(__CFString *)v9 hasPrefix:@"com.apple."])
        {
          uint64_t v10 = [(__CFString *)v9 stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_13CA0];

          v9 = (__CFString *)v10;
        }
      }
      else
      {
        v9 = &stru_13CA0;
      }
      if ([(__CFString *)v9 length]) {
        [v8 setServiceName:v9];
      }
    }
    v29 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v8;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Created: %{public}@", buf, 0xCu);
    }
    if (!qword_15420)
    {
LABEL_71:
      [(id)qword_153E8 addObject:v8];
      sub_3624(v8);
      sub_25D0(v8);
      uint64_t v27 = qword_15478;
      if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v8;
        v28 = "Registered: %{public}@";
        goto LABEL_73;
      }
      goto LABEL_75;
    }
    id v30 = (id)qword_15420;
    id v31 = v8;
    v32 = [v30 name];
    v33 = [v31 name];
    if ([v32 isEqualToString:v33])
    {
      unsigned int v34 = [v30 priority];
      if (v34 == [v31 priority])
      {
        unsigned int v35 = objc_msgSend(v30, "allow_battery");
        if (v35 == objc_msgSend(v31, "allow_battery"))
        {
          id v36 = [v30 interval];
          if (v36 == [v31 interval])
          {
            id v37 = objc_msgSend(v30, "grace_period");
            if (v37 == objc_msgSend(v31, "grace_period"))
            {
              id v38 = [v30 delay];
              if (v38 == [v31 delay])
              {
                id v39 = objc_msgSend(v30, "random_initial_delay");
                if (v39 == objc_msgSend(v31, "random_initial_delay"))
                {
                  unsigned int v40 = [v30 repeating];
                  if (v40 == [v31 repeating])
                  {
                    id v41 = objc_msgSend(v30, "expected_duration");
                    if (v41 == objc_msgSend(v31, "expected_duration"))
                    {
                      unsigned int v42 = objc_msgSend(v30, "requires_screen_sleep");
                      if (v42 == objc_msgSend(v31, "requires_screen_sleep"))
                      {
                        unsigned int v43 = objc_msgSend(v30, "requires_significant_user_inactivity");
                        if (v43 == objc_msgSend(v31, "requires_significant_user_inactivity"))
                        {
                          unsigned int v44 = objc_msgSend(v30, "power_nap");
                          if (v44 == objc_msgSend(v31, "power_nap"))
                          {
                            unsigned int v45 = objc_msgSend(v30, "app_refresh");
                            if (v45 == objc_msgSend(v31, "app_refresh"))
                            {
                              unsigned int v46 = objc_msgSend(v30, "memory_intensive");
                              if (v46 == objc_msgSend(v31, "memory_intensive"))
                              {
                                unsigned int v47 = objc_msgSend(v30, "cpu_intensive");
                                if (v47 == objc_msgSend(v31, "cpu_intensive"))
                                {
                                  unsigned int v48 = objc_msgSend(v30, "disk_intensive");
                                  if (v48 == objc_msgSend(v31, "disk_intensive"))
                                  {
                                    unsigned int v49 = objc_msgSend(v30, "requires_buddy_complete");
                                    if (v49 == objc_msgSend(v31, "requires_buddy_complete"))
                                    {
                                      unsigned int v50 = objc_msgSend(v30, "requires_inexpensive_network");
                                      if (v50 == objc_msgSend(v31, "requires_inexpensive_network"))
                                      {
                                        unsigned int v51 = objc_msgSend(v30, "requires_network_connectivity");
                                        if (v51 == objc_msgSend(v31, "requires_network_connectivity"))
                                        {
                                          id v52 = objc_msgSend(v30, "expected_network_download_size_bytes");
                                          if (v52 == objc_msgSend(v31, "expected_network_download_size_bytes"))
                                          {
                                            id v53 = objc_msgSend(v30, "expected_network_upload_size_bytes");
                                            if (v53 == objc_msgSend(v31, "expected_network_upload_size_bytes"))
                                            {
                                              unsigned int v54 = objc_msgSend(v30, "may_reboot_device");
                                              if (v54 == objc_msgSend(v31, "may_reboot_device"))
                                              {
                                                unsigned int v55 = objc_msgSend(v30, "communicates_with_paired_device");
                                                if (v55 == objc_msgSend(v31, "communicates_with_paired_device"))
                                                {
                                                  v58 = (const char *)objc_msgSend(v30, "desired_motion_state");
                                                  v59 = (const char *)objc_msgSend(v31, "desired_motion_state");
                                                  if (v58 == v59 || v58 && v59 && !strcmp(v58, v59))
                                                  {
                                                    unsigned int v60 = objc_msgSend(v30, "duet_power_budgeted");
                                                    if (v60 == objc_msgSend(v31, "duet_power_budgeted"))
                                                    {
                                                      unsigned int v61 = objc_msgSend(v30, "schedule_rtc_wake");
                                                      if (v61 == objc_msgSend(v31, "schedule_rtc_wake"))
                                                      {
                                                        unsigned int v62 = objc_msgSend(v30, "requires_protection_class");
                                                        if (v62 == objc_msgSend(v31, "requires_protection_class"))
                                                        {
                                                          id v78 = [v30 serviceName];
                                                          v63 = (const char *)[v78 UTF8String];
                                                          id v77 = [v31 serviceName];
                                                          v64 = (const char *)[v77 UTF8String];
                                                          if (v63 == v64 || v63 && v64 && !strcmp(v63, v64))
                                                          {
                                                            objc_msgSend(v30, "group_name");
                                                            id v76 = objc_claimAutoreleasedReturnValue();
                                                            v65 = (const char *)[v76 UTF8String];
                                                            objc_msgSend(v31, "group_name");
                                                            id v75 = objc_claimAutoreleasedReturnValue();
                                                            v66 = (const char *)[v75 UTF8String];
                                                            if (v65 == v66)
                                                            {

                                                              goto LABEL_94;
                                                            }
                                                            if (v65 && v66)
                                                            {
                                                              int v67 = strcmp(v65, v66);

                                                              if (!v67)
                                                              {
LABEL_94:
                                                                v68 = qword_15470;
                                                                if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
                                                                {
                                                                  *(_DWORD *)buf = 138543618;
                                                                  *(void *)&buf[4] = v31;
                                                                  *(_WORD *)&buf[12] = 2114;
                                                                  *(void *)&buf[14] = v30;
                                                                  _os_log_impl(&dword_0, v68, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ matches activity with name %{public}@", buf, 0x16u);
                                                                }

                                                                if (byte_153D8)
                                                                {
                                                                  uint64_t v69 = objc_msgSend((id)qword_15420, "scheduler_activity");
                                                                  if (v69)
                                                                  {
                                                                    v70 = (void *)v69;
                                                                    unsigned __int8 v71 = objc_msgSend((id)qword_15420, "das_started");

                                                                    if ((v71 & 1) == 0) {
                                                                      goto LABEL_103;
                                                                    }
                                                                  }
                                                                }
                                                                else if ((objc_msgSend((id)qword_15420, "das_started") & 1) == 0)
                                                                {
LABEL_103:
                                                                  if (byte_153D8)
                                                                  {
                                                                    v72 = objc_msgSend((id)qword_15420, "scheduler_activity");
                                                                    objc_msgSend(v31, "setScheduler_activity:", v72);

                                                                    objc_msgSend((id)qword_15420, "setScheduler_activity:", 0);
                                                                    v73 = objc_msgSend(v31, "scheduler_activity");
                                                                    [v73 linkToCTSActivity:v31];
                                                                  }
                                                                  sub_8140();
                                                                  [(id)qword_153E8 addObject:v31];
                                                                  sub_25D0(v31);
                                                                  uint64_t v74 = qword_15478;
                                                                  if (!os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))goto LABEL_75; {
                                                                  *(_DWORD *)buf = 138543362;
                                                                  }
                                                                  *(void *)&buf[4] = v31;
                                                                  v28 = "Registered (with reuse): %{public}@";
                                                                  v57 = v74;
                                                                  goto LABEL_74;
                                                                }
                                                                goto LABEL_71;
                                                              }
LABEL_68:
                                                              v56 = qword_15470;
                                                              if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
                                                              {
                                                                *(_DWORD *)buf = 138543618;
                                                                *(void *)&buf[4] = v31;
                                                                *(_WORD *)&buf[12] = 2114;
                                                                *(void *)&buf[14] = v30;
                                                                _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ does not match activity with name %{public}@", buf, 0x16u);
                                                              }

                                                              goto LABEL_71;
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_68;
  }
LABEL_76:
}

void sub_3624(void *a1)
{
  id v1 = a1;
  if (byte_153D8)
  {
    v2 = +[_DASActivity activityWithCTSActivity:v1];
    objc_msgSend(v1, "setScheduler_activity:", v2);

    uint64_t v3 = (void *)qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      id v5 = objc_msgSend(v1, "scheduler_activity");
      int v12 = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      id v15 = v1;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Submitting: %{public}@ (CTS Activity %p)", (uint8_t *)&v12, 0x16u);
    }
    v6 = objc_msgSend(v1, "group_name");

    if (v6)
    {
      v7 = objc_msgSend(v1, "group_name");
      id v8 = +[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", v7, objc_msgSend(v1, "group_concurrency_limit"));

      v9 = (void *)qword_15480;
      uint64_t v10 = objc_msgSend(v1, "scheduler_activity");
      [v9 submitActivity:v10 inGroup:v8];
    }
    else
    {
      id v11 = (void *)qword_15480;
      id v8 = objc_msgSend(v1, "scheduler_activity");
      [v11 submitActivity:v8];
    }
  }
}

void sub_3E78(uint64_t a1)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v1 = +[NSDate distantFuture];
    [v1 timeIntervalSinceReferenceDate];
  }
  else
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CFAbsoluteTimeGetCurrent();
  }
}

CTSActivity *sub_3F00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_A17C();
  }
  v4 = objc_alloc_init(CTSActivity);
  id v5 = +[NSString stringWithUTF8String:a1];
  [(CTSActivity *)v4 setName:v5];

  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_POST_INSTALL))
  {
    id v6 = [(CTSActivity *)v4 name];
    *(void *)buf = 0;
    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.xpc.activity2"];
    if (!qword_15430)
    {
      if (sysctlbyname_get_data_np())
      {

        goto LABEL_21;
      }
      v59 = +[NSString stringWithUTF8String:*(void *)buf];
      free(*(void **)buf);
      unsigned int v60 = [v7 stringForKey:@"ProductBuildVersion"];
      if (([v60 isEqualToString:v59] & 1) == 0)
      {
        [v7 removeObjectForKey:@"VersionSpecificActivitiesRun"];
        [v7 setObject:v59 forKey:@"ProductBuildVersion"];
      }
    }
    id v8 = [v7 arrayForKey:@"VersionSpecificActivitiesRun"];
    unsigned __int8 v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0)
    {
      [(CTSActivity *)v4 setPost_install:1];
      goto LABEL_6;
    }
LABEL_21:
    v20 = 0;
    goto LABEL_126;
  }
LABEL_6:
  string = xpc_dictionary_get_string(v3, XPC_ACTIVITY_PRIORITY);
  if (!string || (id v11 = string, !strcmp(string, XPC_ACTIVITY_PRIORITY_MAINTENANCE)))
  {
    [(CTSActivity *)v4 setPriority:0];
  }
  else
  {
    if (strcmp(v11, XPC_ACTIVITY_PRIORITY_UTILITY))
    {
      int v12 = (void *)qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v12;
        __int16 v14 = [(CTSActivity *)v4 name];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v14;
        __int16 v79 = 2080;
        long long v80 = XPC_ACTIVITY_PRIORITY_UTILITY;
        __int16 v81 = 2080;
        long long v82 = XPC_ACTIVITY_PRIORITY_MAINTENANCE;
        _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%{public}@: permissible values for priority are %s or %s", buf, 0x20u);
      }
      goto LABEL_21;
    }
    [(CTSActivity *)v4 setPriority:1];
    [(CTSActivity *)v4 setAllow_battery:1];
  }
  id v15 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_ALLOW_BATTERY);
  v16 = v15;
  if (v15) {
    [(CTSActivity *)v4 setAllow_battery:xpc_BOOL_get_value(v15)];
  }
  uint64_t v17 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_INTERVAL);
  [(CTSActivity *)v4 setInterval:sub_4DE4((uint64_t)v17)];

  if ([(CTSActivity *)v4 interval] >= 1)
  {
    if ([(CTSActivity *)v4 post_install])
    {
      v18 = (id)qword_15470;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = [(CTSActivity *)v4 name];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: postinstall activites are not allowed to repeat; interval property ignored.",
          buf,
          0xCu);
      }
    }
    else
    {
      int64_t v21 = [(CTSActivity *)v4 interval];
      if (v21 >= 0) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = v21 + 1;
      }
      [(CTSActivity *)v4 setDelay:v22 >> 1];
      int64_t v23 = [(CTSActivity *)v4 interval];
      if (v23 >= 0) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v23 + 1;
      }
      uint64_t v25 = [(CTSActivity *)v4 interval];
      uint64_t v26 = v25 & 1;
      if (v25 < 0) {
        uint64_t v26 = -v26;
      }
      [(CTSActivity *)v4 setGrace_period:v26 + (v24 >> 1)];
      [(CTSActivity *)v4 setRepeating:1];
    }
  }
  uint64_t v27 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DELAY);

  if (v27) {
    [(CTSActivity *)v4 setDelay:sub_4DE4((uint64_t)v27)];
  }
  v28 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RANDOM_INITIAL_DELAY);

  if (v28) {
    [(CTSActivity *)v4 setRandom_initial_delay:sub_4DE4((uint64_t)v28)];
  }
  v29 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GRACE_PERIOD);

  if (v29) {
    [(CTSActivity *)v4 setGrace_period:sub_4DE4((uint64_t)v29)];
  }
  id v30 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_REPEATING);

  if (v30)
  {
    if ([(CTSActivity *)v4 post_install])
    {
      id v31 = (id)qword_15470;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(CTSActivity *)v4 name];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v32;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: postinstall activites are not allowed to repeat; repeating property ignored.",
          buf,
          0xCu);
      }
    }
    else
    {
      [(CTSActivity *)v4 setRepeating:xpc_BOOL_get_value(v30)];
    }
  }
  if ([(CTSActivity *)v4 repeating] && ![(CTSActivity *)v4 interval])
  {
    if (![(CTSActivity *)v4 delay] && ![(CTSActivity *)v4 grace_period])
    {
      v33 = (id)qword_15470;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v34 = [(CTSActivity *)v4 name];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v34;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "BUG IN %{public}@? None of interval, delay, grace period set for repeating task", buf, 0xCu);
      }
      [(CTSActivity *)v4 setGrace_period:172800];
    }
    [(CTSActivity *)v4 setInterval:(char *)[(CTSActivity *)v4 delay] + [(CTSActivity *)v4 grace_period]];
  }
  [(CTSActivity *)v4 setExpected_duration:xpc_dictionary_get_int64(v3, XPC_ACTIVITY_EXPECTED_DURATION)];
  unsigned int v35 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DUET_ATTRIBUTE_NAME);

  if (v35)
  {
    if (xpc_get_type(v35) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v35);
      if (string_ptr)
      {
        id v37 = +[NSString stringWithUTF8String:string_ptr];
        [(CTSActivity *)v4 setBundle_id:v37];
      }
    }
  }
  id v38 = xpc_dictionary_get_array(v3, XPC_ACTIVITY_DUET_RELATED_APPLICATIONS);
  id v39 = v38;
  if (v38 && xpc_get_type(v38) == (xpc_type_t)&_xpc_type_array)
  {
    unsigned int v40 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    [(CTSActivity *)v4 setRelated_applications:v40];
  }
  id v41 = xpc_dictionary_get_array(v3, XPC_ACTIVITY_INVOLVED_PROCESSES);
  unsigned int v42 = v41;
  if (v41 && xpc_get_type(v41) == (xpc_type_t)&_xpc_type_array)
  {
    unsigned int v43 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    [(CTSActivity *)v4 setInvolved_processes:v43];
  }
  unsigned int v44 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RUN_WHEN_APP_FOREGROUNDED);

  if (v44)
  {
    unsigned int v45 = [(CTSActivity *)v4 related_applications];
    if ([v45 count])
    {
      xpc_type_t type = xpc_get_type(v44);

      if (type == (xpc_type_t)&_xpc_type_BOOL) {
        [(CTSActivity *)v4 setRunOnAppForeground:xpc_BOOL_get_value(v44)];
      }
    }
    else
    {
    }
  }
  id v77 = v39;
  unsigned int v47 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_USER_REQUESTED_BACKUP_TASK);

  if (v47) {
    [(CTSActivity *)v4 setUser_requested_backup_task:xpc_BOOL_get_value(v47)];
  }
  unsigned int v48 = xpc_dictionary_get_dictionary(v3, XPC_ACTIVITY_NETWORK_TRANSFER_ENDPOINT);
  unsigned int v49 = v48;
  if (v48 && xpc_get_type(v48) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned int v50 = (void *)nw_endpoint_create_from_dictionary();
    [(CTSActivity *)v4 setNetwork_endpoint:v50];
  }
  unsigned int v51 = xpc_dictionary_get_dictionary(v3, XPC_ACTIVITY_NETWORK_TRANSFER_PARAMETERS);
  id v52 = v51;
  if (v51 && xpc_get_type(v51) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v53 = (void *)nw_parameters_create_from_dictionary();
    [(CTSActivity *)v4 setNetwork_parameters:v53];
  }
  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_BUDDY_COMPLETE)) {
    [(CTSActivity *)v4 setRequires_buddy_complete:1];
  }
  unsigned int v54 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GROUP_NAME);

  if (v54)
  {
    if (xpc_get_type(v54) == (xpc_type_t)&_xpc_type_string)
    {
      unsigned int v55 = xpc_string_get_string_ptr(v54);
      if (v55)
      {
        v56 = +[NSString stringWithUTF8String:v55];
        [(CTSActivity *)v4 setGroup_name:v56];

        uint64_t v57 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT);

        if (v57)
        {
          uint64_t v58 = sub_4DE4(v57);
          unsigned int v54 = (void *)v57;
        }
        else
        {
          unsigned int v54 = 0;
          uint64_t v58 = 1;
        }
        [(CTSActivity *)v4 setGroup_concurrency_limit:v58];
      }
    }
  }
  [(CTSActivity *)v4 setRequires_screen_sleep:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP)];
  [(CTSActivity *)v4 setRequires_significant_user_inactivity:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY)];
  [(CTSActivity *)v4 setPower_nap:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_POWER_NAP)];
  [(CTSActivity *)v4 setApp_refresh:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_APP_REFRESH)];
  [(CTSActivity *)v4 setPrevents_device_sleep:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP)];
  [(CTSActivity *)v4 setMemory_intensive:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_MEMORY_INTENSIVE)];
  [(CTSActivity *)v4 setCpu_intensive:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_CPU_INTENSIVE)];
  [(CTSActivity *)v4 setDisk_intensive:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_DISK_INTENSIVE)];
  [(CTSActivity *)v4 setRequires_inexpensive_network:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY)];
  BOOL v61 = xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY)
     || [(CTSActivity *)v4 requires_inexpensive_network];
  [(CTSActivity *)v4 setRequires_network_connectivity:v61];
  unsigned int v62 = xpc_dictionary_get_string(v3, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION);
  BOOL v64 = 0;
  if (v62)
  {
    v63 = v62;
    if (!strcmp(v62, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_UPLOAD)
      || !strcmp(v63, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL))
    {
      BOOL v64 = 1;
    }
  }
  int64_t int64 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_TRANSFER_SIZE);
  int64_t v66 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_DOWNLOAD_SIZE);
  int64_t v67 = xpc_dictionary_get_int64(v3, XPC_ACTIVITY_NETWORK_UPLOAD_SIZE);
  if (v64)
  {
    [(CTSActivity *)v4 setExpected_network_download_size_bytes:v66];
    if (int64 > v67) {
      int64_t v67 = int64;
    }
  }
  else
  {
    if (int64 <= v66) {
      int64_t v68 = v66;
    }
    else {
      int64_t v68 = int64;
    }
    [(CTSActivity *)v4 setExpected_network_download_size_bytes:v68];
  }
  [(CTSActivity *)v4 setExpected_network_upload_size_bytes:v67];
  [(CTSActivity *)v4 setMay_reboot_device:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_MAY_REBOOT_DEVICE)];
  [(CTSActivity *)v4 setCommunicates_with_paired_device:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE)];
  uint64_t v69 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DESIRED_MOTION_STATE);

  if (v69)
  {
    if (xpc_get_type(v69) == (xpc_type_t)&_xpc_type_string)
    {
      v70 = xpc_string_get_string_ptr(v69);
      if (v70)
      {
        unsigned __int8 v71 = v70;
        uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_STATIONARY;
        if (!strcmp(v70, XPC_ACTIVITY_MOTION_STATE_STATIONARY)
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_WALKING, !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_WALKING))
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_RUNNING, !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_RUNNING))
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_CYCLING, !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_CYCLING))
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE, !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE))
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_MOVING,
              !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_MOVING))
          || (uint64_t v72 = XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_STATIONARY,
              !strcmp(v71, XPC_ACTIVITY_MOTION_STATE_AUTOMOTIVE_STATIONARY)))
        {
          [(CTSActivity *)v4 setDesired_motion_state:v72];
        }
      }
    }
  }
  [(CTSActivity *)v4 setDuet_power_budgeted:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING)];
  [(CTSActivity *)v4 setData_budgeted:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_USES_DATA_BUDGETING)];
  [(CTSActivity *)v4 setSchedule_rtc_wake:xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_SHOULD_WAKE_DEVICE)];
  if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A))
  {
    uint64_t v73 = 1;
  }
  else if (xpc_dictionary_get_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B))
  {
    uint64_t v73 = 2;
  }
  else
  {
    uint64_t v74 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_REQUIRES_CLASS_C);

    if (v74)
    {
      uint64_t v73 = 3;
      if (xpc_get_type(v74) == (xpc_type_t)&_xpc_type_BOOL)
      {
        if (xpc_BOOL_get_value(v74)) {
          uint64_t v73 = 3;
        }
        else {
          uint64_t v73 = 4;
        }
      }
    }
    else
    {
      uint64_t v73 = 3;
    }
    uint64_t v69 = v74;
  }
  [(CTSActivity *)v4 setRequires_protection_class:v73];
  id v75 = xpc_dictionary_get_value(v3, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA);
  [(CTSActivity *)v4 setDas_data:v75];

  [(CTSActivity *)v4 setSeqno:xpc_dictionary_get_uint64(v3, XPC_ACTIVITY_SEQUENCE_NUMBER)];
  [(CTSActivity *)v4 setState:1];
  [(CTSActivity *)v4 loadBaseTime];
  v20 = v4;

LABEL_126:

  return v20;
}

uint64_t sub_4DE4(uint64_t result)
{
  if (result)
  {
    id v1 = (void *)result;
    xpc_type_t type = xpc_get_type((xpc_object_t)result);
    if (type == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t value = xpc_int64_get_value(v1);
      result = value & ~(value >> 63);
    }
    else if (type == (xpc_type_t)&_xpc_type_uint64)
    {
      result = xpc_uint64_get_value(v1);
    }
    else if (type == (xpc_type_t)&_xpc_type_double)
    {
      double v4 = xpc_double_get_value(v1);
      unint64_t v5 = llround(v4);
      if (v4 <= 0.0) {
        result = 0;
      }
      else {
        result = v5;
      }
    }
    else
    {
      result = 0;
    }
  }
  if (result >= 0x3FFFFFFFFFFFFFFFLL) {
    return 0x3FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void sub_4FE4()
{
  if (!qword_153D0)
  {
    CFDictionaryRef v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"ActivityBaseDates", @"com.apple.xpc.activity2");
    if (v0)
    {
      CFDictionaryRef v1 = v0;
      qword_153D0 = (uint64_t)CFDictionaryCreateMutableCopy(0, 0, v0);
      CFRelease(v1);
      sub_5E6C((const __CFDictionary *)qword_153D0);
    }
    else
    {
      qword_153D0 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFPreferencesSetAppValue(@"DateCompleted", 0, @"com.apple.xpc.activity2");
    CFPreferencesSetAppValue(@"DateSubmitted", 0, @"com.apple.xpc.activity2");
    dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_15468);
    id v3 = (void *)qword_153C8;
    qword_153C8 = (uint64_t)v2;

    dispatch_source_set_event_handler((dispatch_source_t)qword_153C8, &stru_10838);
    double v4 = qword_153C8;
    dispatch_time_t v5 = dispatch_time(0, 86400000000000);
    dispatch_source_set_timer(v4, v5, 0x4E94914F0000uLL, 0x13A52453C000uLL);
    id v6 = qword_153C8;
    dispatch_activate(v6);
  }
}

__uint64_t sub_5348()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
}

__uint64_t sub_5350(uint64_t a1)
{
  __uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    time_t v3 = time(0);
    return a1 - clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) + 1000000000 * v3;
  }
  return result;
}

uint64_t sub_53A8(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, "random_initial_delay"))
  {
    uint32_t v2 = objc_msgSend(v1, "random_initial_delay");
    uint32_t v3 = arc4random_uniform(v2);
    double v4 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67240448;
      v7[1] = v3;
      __int16 v8 = 1026;
      uint32_t v9 = v2;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Adding random initial delay %{public}d/%{public}d", (uint8_t *)v7, 0xEu);
    }
    uint64_t v5 = 1000000000 * v3;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_57A4(void *a1, uint64_t a2)
{
  id key = a1;
  sub_4FE4();
  if (key)
  {
    sub_3E78(a2);
    CFDateRef v4 = CFDateCreate(0, v3);
    if (v4)
    {
      CFDateRef v5 = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_153D0, key, v4);
      CFRelease(v5);
    }
    CFPreferencesSetAppValue(@"ActivityBaseDates", (CFPropertyListRef)qword_153D0, @"com.apple.xpc.activity2");
  }
}

BOOL sub_597C(void *a1, uint64_t a2)
{
  kern_return_t v9;
  NSObject *v10;
  uint8_t v12[8];
  void handler[7];
  mach_port_name_t v14;
  mach_port_name_t v15;
  void v16[3];
  unint64_t v17;
  mach_port_t port[2];
  mach_port_t *v19;
  uint64_t v20;
  uint64_t v21;
  mach_port_name_t name;

  CFAbsoluteTime v3 = a1;
  if (qword_153C0) {
    sub_A17C();
  }
  CFDateRef v4 = v3;
  mach_port_name_t v5 = mach_host_self();
  port[0] = 0;
  if (!host_get_special_port(v5, -1, 1, port))
  {
    mach_port_deallocate(mach_task_self_, v5);
    mach_port_name_t v5 = port[0];
  }
  name = 0;
  BOOL v6 = 0;
  if (!mach_port_allocate(mach_task_self_, 1u, &name))
  {
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0, v4);
    __int16 v8 = (void *)qword_153C0;
    qword_153C0 = (uint64_t)v7;

    if (!qword_153C0) {
      sub_A17C();
    }
    *(void *)port = 0;
    unsigned int v19 = port;
    v20 = 0x2020000000;
    int64_t v21 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    uint64_t v17 = 0;
    uint64_t v17 = sub_5B90();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_5BFC;
    handler[3] = &unk_107F8;
    handler[4] = v16;
    handler[5] = port;
    handler[6] = a2;
    __int16 v14 = name;
    id v15 = v5;
    dispatch_source_set_event_handler((dispatch_source_t)qword_153C0, handler);
    dispatch_activate((dispatch_object_t)qword_153C0);
    uint32_t v9 = host_request_notification(v5, 1, name);
    BOOL v6 = v9 == 0;
    if (!v9)
    {
      uint64_t v10 = qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Time Change: Registered for time change notifications", v12, 2u);
      }
    }
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(port, 8);
  }

  return v6;
}

void sub_5B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

unint64_t sub_5B90()
{
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  if (mach_get_times()) {
    sub_A198();
  }
  mach_timebase_info v1 = 0;
  mach_timebase_info(&v1);
  return v3 - v4 * (unint64_t)v1.numer / v1.denom + 1000000000 * v2;
}

uint64_t sub_5BFC(uint64_t a1)
{
  mach_msg_return_t v3;
  mach_msg_return_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  long long v13;
  long long v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  unint64_t v18;

  uint64_t v13 = 0u;
  __int16 v14 = 0u;
  int v2 = *(_DWORD *)(a1 + 56);
  DWORD1(v13) = 24;
  HIDWORD(v13) = v2;
  uint64_t v3 = mach_msg_receive((mach_msg_header_t *)&v13);
  uint64_t v4 = v3;
  if (DWORD1(v14) == 951)
  {
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  _os_assumes_log();
  if (!v4) {
LABEL_3:
  }
    mach_msg_destroy((mach_msg_header_t *)&v13);
LABEL_4:
  mach_port_name_t v5 = sub_5B90();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5
                                                               - *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 >= 0) {
    dispatch_source_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    dispatch_source_t v7 = -v6;
  }
  __int16 v8 = qword_15470;
  uint32_t v9 = os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT);
  if (v7 < 0x6FC23AC01)
  {
    if (v9)
    {
      id v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v16 = v11 / 1000000000;
      uint64_t v17 = 2048;
      v18 = v11 % 1000000000 / 0xF4240uLL;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Time Change: have change of %lld.%03lld seconds, continuing to accumulate.", buf, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v16 = v10 / 1000000000;
      uint64_t v17 = 2048;
      v18 = v10 % 1000000000 / 0xF4240uLL;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Time Change: accumulated change of %lld.%03lld seconds, resetting activities.", buf, 0x16u);
    }
    (*(void (**)(void))(a1 + 48))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  __uint64_t result = host_request_notification(*(_DWORD *)(a1 + 60), 1, *(_DWORD *)(a1 + 56));
  if (result) {
    return _os_assumes_log();
  }
  return result;
}

void sub_5E6C(const __CFDictionary *a1)
{
  if (a1)
  {
    size_t Count = CFDictionaryGetCount(a1);
    if (Count)
    {
      int64_t v3 = Count;
      uint64_t v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
      mach_port_name_t v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0xC0040B8AA526DuLL);
      CFDictionaryGetKeysAndValues(a1, v4, v5);
      double Current = CFAbsoluteTimeGetCurrent();
      double v7 = CFAbsoluteTimeGetCurrent();
      if (v3 >= 1)
      {
        double v8 = v7 + -4838400.0;
        uint32_t v9 = v5;
        uint64_t v10 = v4;
        do
        {
          CFTypeID v11 = CFGetTypeID(*v9);
          CFTypeID TypeID = CFDateGetTypeID();
          CFTypeRef v13 = *v10;
          if (v11 == TypeID)
          {
            CFTypeID v14 = CFGetTypeID(*v10);
            if (v14 != CFStringGetTypeID()
              || (CFStringRef v15 = (const __CFString *)*v10,
                  v20.length = CFStringGetLength((CFStringRef)*v10),
                  v20.location = 0,
                  !CFStringFindWithOptions(v15, @"com.apple.StateReplicator.DuetHandshakeScheduler.", v20, 0, 0)))
            {
              double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)*v9);
              if (AbsoluteTime >= v8)
              {
                if (AbsoluteTime > Current)
                {
                  CFDateRef v17 = CFDateCreate(0, Current - kCFAbsoluteTimeIntervalSince1970);
                  if (v17)
                  {
                    CFDateRef v18 = v17;
                    CFDictionarySetValue(a1, *v10, v17);
                    CFRelease(v18);
                  }
                }
                goto LABEL_11;
              }
            }
            CFTypeRef v13 = *v10;
          }
          CFDictionaryRemoveValue(a1, v13);
LABEL_11:
          ++v10;
          ++v9;
          --v3;
        }
        while (v3);
      }
      free(v4);
      free(v5);
    }
  }
}

void sub_6054(id a1)
{
}

CFMutableDictionaryRef sub_6060(const char *a1)
{
  IOPMAssertionID AssertionID = 0;
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (result)
  {
    int64_t v3 = result;
    cStr = 0;
    asprintf(&cStr, "TEMP:%s", a1);
    if (cStr)
    {
      CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
      if (v4)
      {
        CFStringRef v5 = v4;
        CFDictionarySetValue(v3, @"AssertName", v4);
        CFRelease(v5);
        free(cStr);
        CFDictionarySetValue(v3, @"PlugInBundleID", @"com.apple.xpc.activity");
        CFDictionarySetValue(v3, @"AssertType", @"PreventUserIdleSystemSleep");
        CFDictionarySetValue(v3, @"TimeoutAction", @"TimeoutActionTurnOff");
        int valuePtr = 15;
        CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        if (v6)
        {
          CFNumberRef v7 = v6;
          CFDictionarySetValue(v3, @"TimeoutSeconds", v6);
          CFRelease(v7);
          int valuePtr = 255;
          CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          if (v8)
          {
            CFNumberRef v9 = v8;
            CFDictionarySetValue(v3, @"AssertLevel", v8);
            CFRelease(v9);
            if (IOPMAssertionCreateWithProperties(v3, &AssertionID)) {
              IOPMAssertionID AssertionID = 0;
            }
          }
        }
      }
      else
      {
        free(cStr);
      }
    }
    CFRelease(v3);
    return (CFMutableDictionaryRef)AssertionID;
  }
  return result;
}

void sub_6440(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v5 = WeakRetained;
  if (WeakRetained)
  {
    CFNumberRef v6 = objc_msgSend(WeakRetained, "scheduler_activity");
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      objc_msgSend(v5, "setDas_eligible:", 1);
      objc_msgSend(v5, "setDas_started:", 1);
      if ([v5 state] == (char *)&dword_0 + 2)
      {
        CFNumberRef v8 = qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          CFNumberRef v9 = "DAS told us to run %{public}@, but it is already running";
LABEL_8:
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = qword_15418;
        dispatch_time_t v11 = dispatch_time(0, 50000000);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
        CFNumberRef v8 = qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          CFNumberRef v9 = "DAS told us to run %{public}@";
          goto LABEL_8;
        }
      }
    }
  }
}

void sub_65C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v5 = WeakRetained;
  if (WeakRetained)
  {
    CFNumberRef v6 = objc_msgSend(WeakRetained, "scheduler_activity");
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      if (objc_msgSend(v5, "das_eligible"))
      {
        objc_msgSend(v5, "setDas_eligible:", 0);
        if ([v5 state] == (char *)&dword_0 + 1 || objc_msgSend(v5, "state") == (char *)&dword_0 + 3)
        {
          sub_6768(v5);
          sub_3624(v5);
        }
        CFNumberRef v8 = qword_15418;
        dispatch_time_t v9 = dispatch_time(0, 50000000);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
        uint64_t v10 = qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          dispatch_time_t v11 = "DAS told us to suspend %{public}@";
LABEL_11:
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          CFTypeRef v13 = v5;
          dispatch_time_t v11 = "DAS told us to suspend %{public}@, but it isn't eligible";
          goto LABEL_11;
        }
      }
    }
  }
}

void sub_6768(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (byte_153D8)
  {
    id v3 = objc_msgSend(v1, "scheduler_activity");

    if (v3)
    {
      CFStringRef v4 = (void *)qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
      {
        CFStringRef v5 = v4;
        CFNumberRef v6 = objc_msgSend(v2, "scheduler_activity");
        int v9 = 138543618;
        uint64_t v10 = v6;
        __int16 v11 = 2048;
        int v12 = v2;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Canceling: %{public}@ (CTS Activity %p)", (uint8_t *)&v9, 0x16u);
      }
      unsigned int v7 = (void *)qword_15480;
      CFNumberRef v8 = objc_msgSend(v2, "scheduler_activity");
      [v7 activityCanceled:v8];

      objc_msgSend(v2, "setScheduler_activity:", 0);
    }
  }
}

void init_cts(uint64_t a1)
{
  byte_153D8 = objc_opt_class() != 0;
  qword_153E0 = a1;
  os_log_t v2 = os_log_create("com.apple.xpc.activity", "Internal");
  id v3 = (void *)qword_15470;
  qword_15470 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.xpc.activity", "Activities");
  CFStringRef v5 = (void *)qword_15478;
  qword_15478 = (uint64_t)v4;

  id v6 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v7 = (void *)qword_153E8;
  qword_153E8 = (uint64_t)v6;

  ++dword_15428;
  xpc_event_provider_create();
}

void sub_6A7C()
{
  CFPreferencesGetAppBooleanValue(@"DisableSmartPowerNap", @"com.apple.xpc.activity2", 0);
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_15468);
  id v1 = (void *)qword_15410;
  qword_15410 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15410, &stru_10908);
  dispatch_activate((dispatch_object_t)qword_15410);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_15468);
  id v3 = (void *)qword_15418;
  qword_15418 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15418, &stru_10928);
  dispatch_source_set_timer((dispatch_source_t)qword_15418, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)qword_15418);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_15468);
  CFStringRef v5 = (void *)qword_15408;
  qword_15408 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_15408, &stru_10948);
  dispatch_activate((dispatch_object_t)qword_15408);
  notify_register_dispatch("com.apple.xpc.activity.debug.trigger", &dword_1542C, (dispatch_queue_t)qword_15468, &stru_10988);
  sub_597C((void *)qword_15468, (uint64_t)sub_8354);
  int v6 = dword_15428;
  int v7 = dword_15428 - 1;
  if (dword_15428 >= 1)
  {
    --dword_15428;
    int v6 = v7;
  }
  if (!v6)
  {
    CFNumberRef v8 = qword_15418;
    dispatch_time_t v9 = dispatch_time(0, 50000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  }
}

void sub_6C30(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_6CEC;
    handler[3] = &unk_108C8;
    id v3 = v2;
    CFStringRef v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_15468);
    xpc_connection_activate(v3);
  }
}

void sub_6CEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int v6 = xpc_dictionary_get_value(v5, "name");
    int v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v7);
      uint64_t v10 = sub_3F00((uint64_t)string_ptr, v5);
      if (v10)
      {
        __int16 v11 = qword_15478;
        if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v16 = 138543362;
          *(void *)&v16[4] = v10;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Created unmanaged XPC Activity: %{public}@", v16, 0xCu);
        }
        [(id)qword_153E8 addObject:v10];
        sub_3624(v10);
        sub_25D0(v10);
        int v12 = qword_15478;
        if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v16 = 138543362;
          *(void *)&v16[4] = v10;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Registered unmanaged XPC Activity: %{public}@", v16, 0xCu);
        }
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
        {
          CFTypeRef v13 = (void *)xpc_copy_debug_description();
          CFTypeID v14 = qword_15470;
          if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v16 = 136446466;
            *(void *)&v16[4] = string_ptr;
            *(_WORD *)&v16[12] = 2082;
            *(void *)&v16[14] = v13;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", v16, 0x16u);
          }
          free(v13);
        }
        [v10 setUnmanaged:1];
        [v10 setPeer:v4];
        *(void *)v16 = _NSConcreteStackBlock;
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = sub_94B8;
        CFDateRef v17 = &unk_109B0;
        id v18 = v10;
        unsigned int v19 = (_xpc_connection_s *)v4;
        xpc_connection_set_event_handler(v19, v16);
      }
      else
      {
        CFStringRef v15 = qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_ERROR)) {
          sub_A1F8((uint64_t)string_ptr, v15);
        }
      }
    }
    else
    {
      CFNumberRef v8 = qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_ERROR)) {
        sub_A1B4(v8);
      }
    }
  }
}

void sub_6FF0(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    id v3 = (void *)qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 67109120;
      pid_t pid = xpc_connection_get_pid(v2);
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Control channel connection: %d", buf, 8u);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_7138;
    handler[3] = &unk_108C8;
    id v5 = v2;
    int v7 = v5;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_set_target_queue(v5, (dispatch_queue_t)qword_15468);
    xpc_connection_activate(v5);
  }
}

void sub_7138(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error) {
    goto LABEL_101;
  }
  string = xpc_dictionary_get_string(v2, "Command");
  id v4 = xpc_dictionary_get_string(v2, "Identifier");
  id v5 = qword_15470;
  if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v58 = string;
    __int16 v59 = 2082;
    unsigned int v60 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Control Channel: %{public}s %{public}s", buf, 0x16u);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v2);
  if (!string) {
    goto LABEL_8;
  }
  if (strcmp(string, "Run"))
  {
    if (strcmp(string, "List"))
    {
      if (strcmp(string, "Debug"))
      {
LABEL_8:
        unsigned int v7 = 22;
        goto LABEL_98;
      }
      xpc_object_t xdict = reply;
      xpc_dictionary_get_uint64(v2, "Flags");
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v9 = (id)qword_153E8;
      id v40 = [v9 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v54;
        unsigned int v7 = 2;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v54 != v42) {
              objc_enumerationMutation(v9);
            }
            if (v4)
            {
              unsigned int v44 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              id v45 = [v44 name];
              int v46 = strcmp((const char *)[v45 UTF8String], v4);

              if (!v46)
              {
                objc_msgSend(v44, "setBgtask_debug:", 1);
                unsigned int v7 = 0;
              }
            }
          }
          id v41 = [v9 countByEnumeratingWithState:&v53 objects:buf count:16];
        }
        while (v41);
      }
      else
      {
        unsigned int v7 = 2;
      }
      goto LABEL_97;
    }
    id v50 = v2;
    xpc_object_t xdicta = reply;
    xpc_object_t v18 = xpc_array_create(0, 0);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = (id)qword_153E8;
    id v20 = [v19 countByEnumeratingWithState:&v53 objects:buf count:16];
    if (!v20) {
      goto LABEL_80;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v54;
LABEL_27:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v54 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void **)(*((void *)&v53 + 1) + 8 * v23);
      if (v4)
      {
        id v25 = [*(id *)(*((void *)&v53 + 1) + 8 * v23) name];
        int v26 = strcmp((const char *)[v25 UTF8String], v4);

        if (v26) {
          goto LABEL_78;
        }
      }
      xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
      id v28 = [v24 name];
      xpc_dictionary_set_string(v27, "Identifier", (const char *)[v28 UTF8String]);

      switch((unint64_t)[v24 state])
      {
        case 0uLL:
          v29 = v27;
          id v30 = "CheckIn";
          goto LABEL_39;
        case 1uLL:
          v29 = v27;
          id v30 = "Wait";
          goto LABEL_39;
        case 2uLL:
          xpc_dictionary_set_string(v27, "State", "Run");
          xpc_dictionary_set_BOOL(v27, "ConfirmedRun", (BOOL)objc_msgSend(v24, "confirmed_run"));
          break;
        case 3uLL:
          v29 = v27;
          id v30 = "Defer";
          goto LABEL_39;
        case 4uLL:
          v29 = v27;
          id v30 = "Continue";
          goto LABEL_39;
        case 5uLL:
          v29 = v27;
          id v30 = "Done";
LABEL_39:
          xpc_dictionary_set_string(v29, "State", v30);
          break;
        default:
          break;
      }
      int64_t v31 = sub_5350((uint64_t)objc_msgSend(v24, "baseTime", v50));
      xpc_dictionary_set_date(v27, "BaseTime", v31);
      if ([v24 state] == (char *)&dword_0 + 1 || objc_msgSend(v24, "state") == (char *)&dword_0 + 3)
      {
        int64_t v32 = sub_5350((uint64_t)[v24 eligibleTime]);
        xpc_dictionary_set_date(v27, "Eligible", v32);
        if (objc_msgSend(v24, "grace_period") != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v33 = sub_5350((uint64_t)[v24 deadlineTime]);
          xpc_dictionary_set_date(v27, "Deadline", v33);
        }
      }
      xpc_dictionary_set_uint64(v27, "ElapsedTime", (unint64_t)[v24 elapsedTime] / 0x3B9ACA00);
      xpc_dictionary_set_int64(v27, "SequenceNumber", (int64_t)[v24 seqno]);
      xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v34, "Interval", (int64_t)[v24 interval]);
      xpc_dictionary_set_int64(v34, "GracePeriod", (int64_t)objc_msgSend(v24, "grace_period"));
      xpc_dictionary_set_int64(v34, "Delay", (int64_t)[v24 delay]);
      unsigned int v35 = [v24 priority];
      if (!v35) {
        break;
      }
      if (v35 == 1)
      {
        id v36 = "Utility";
LABEL_48:
        xpc_dictionary_set_string(v34, "Priority", v36);
      }
      xpc_dictionary_set_BOOL(v34, "AllowBattery", (BOOL)objc_msgSend(v24, "allow_battery"));
      xpc_dictionary_set_BOOL(v34, "Repeating", (BOOL)[v24 repeating]);
      xpc_dictionary_set_BOOL(v34, "PowerNap", (BOOL)objc_msgSend(v24, "power_nap"));
      xpc_dictionary_set_BOOL(v34, "AppRefresh", (BOOL)objc_msgSend(v24, "app_refresh"));
      unsigned int v37 = objc_msgSend(v24, "requires_protection_class") - 1;
      if (v37 <= 2) {
        xpc_dictionary_set_string(v34, "RequireProtectionClass", off_109D0[v37]);
      }
      if (objc_msgSend(v24, "requires_screen_sleep")) {
        xpc_dictionary_set_BOOL(v34, "RequiresScreenSleep", (BOOL)objc_msgSend(v24, "requires_screen_sleep"));
      }
      if (objc_msgSend(v24, "requires_significant_user_inactivity")) {
        xpc_dictionary_set_BOOL(v34, "RequiresSignificantUserInactivity", (BOOL)objc_msgSend(v24, "requires_significant_user_inactivity"));
      }
      if (objc_msgSend(v24, "requires_buddy_complete")) {
        xpc_dictionary_set_BOOL(v34, "RequiresBuddyComplete", (BOOL)objc_msgSend(v24, "requires_buddy_complete"));
      }
      if (objc_msgSend(v24, "requires_network_connectivity")) {
        xpc_dictionary_set_BOOL(v34, "RequiresNetworkConnectivity", (BOOL)objc_msgSend(v24, "requires_network_connectivity"));
      }
      if (objc_msgSend(v24, "requires_inexpensive_network")) {
        xpc_dictionary_set_BOOL(v34, "RequiresInexpensiveNetwork", (BOOL)objc_msgSend(v24, "requires_inexpensive_network"));
      }
      if (objc_msgSend(v24, "cpu_intensive")) {
        xpc_dictionary_set_BOOL(v34, "CPUIntensive", (BOOL)objc_msgSend(v24, "cpu_intensive"));
      }
      if (objc_msgSend(v24, "memory_intensive")) {
        xpc_dictionary_set_BOOL(v34, "MemoryIntensive", (BOOL)objc_msgSend(v24, "memory_intensive"));
      }
      if (objc_msgSend(v24, "disk_intensive")) {
        xpc_dictionary_set_BOOL(v34, "DiskIntensive", (BOOL)objc_msgSend(v24, "disk_intensive"));
      }
      if (objc_msgSend(v24, "may_reboot_device")) {
        xpc_dictionary_set_BOOL(v34, "MayRebootDevice", (BOOL)objc_msgSend(v24, "may_reboot_device"));
      }
      if (objc_msgSend(v24, "post_install")) {
        xpc_dictionary_set_BOOL(v34, "PostInstall", (BOOL)objc_msgSend(v24, "post_install"));
      }
      if (objc_msgSend(v24, "duet_power_budgeted")) {
        xpc_dictionary_set_BOOL(v34, "DuetPowerBudgeting", (BOOL)objc_msgSend(v24, "duet_power_budgeted"));
      }
      if (objc_msgSend(v24, "user_requested_backup_task")) {
        xpc_dictionary_set_BOOL(v34, "UserRequestedBackup", (BOOL)objc_msgSend(v24, "user_requested_backup_task"));
      }
      xpc_dictionary_set_value(v27, "Effective Criteria", v34);
      id v38 = objc_msgSend(v24, "group_name");

      if (v38)
      {
        objc_msgSend(v24, "group_name");
        id v39 = objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_string(v27, "ActivityGroupName", (const char *)[v39 UTF8String]);

        xpc_dictionary_set_uint64(v27, "MaxConcurrencyLimit", (uint64_t)objc_msgSend(v24, "group_concurrency_limit"));
      }
      xpc_array_append_value(v18, v27);

LABEL_78:
      if (v21 == (id)++v23)
      {
        id v21 = [v19 countByEnumeratingWithState:&v53 objects:buf count:16];
        if (!v21)
        {
LABEL_80:

          xpc_object_t reply = xdicta;
          xpc_dictionary_set_value(xdicta, "List", v18);

          unsigned int v7 = 0;
          id v2 = v50;
          goto LABEL_98;
        }
        goto LABEL_27;
      }
    }
    id v36 = "Maintenance";
    goto LABEL_48;
  }
  xpc_object_t xdict = reply;
  CFNumberRef v8 = +[NSString stringWithUTF8String:v4];
  id v9 = v8;
  if (byte_153D8 && ![v8 hasPrefix:@"com.apple.xpc.activity.test."])
  {
    unsigned int v47 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v58 = v4;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Control Channel: 'ctsctl run' is unsupported, please use 'dastool run' instead for %{public}s", buf, 0xCu);
    }
    unsigned int v7 = 78;
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v10 = objc_msgSend((id)qword_153E8, "copy", v2);
    id v11 = [v10 countByEnumeratingWithState:&v53 objects:buf count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v54;
      unsigned int v7 = 2;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v54 != v13) {
            objc_enumerationMutation(v10);
          }
          if (v4)
          {
            CFStringRef v15 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            id v16 = [v15 name];
            int v17 = strcmp((const char *)[v16 UTF8String], v4);

            if (!v17)
            {
              if ([v15 state] == (char *)&dword_0 + 1
                || [v15 state] == (char *)&dword_0 + 3)
              {
                [v15 setEligible:1];
                sub_860C(v15, 2, 0);
                unsigned int v7 = 0;
              }
              else
              {
                unsigned int v7 = 16;
              }
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v53 objects:buf count:16];
      }
      while (v12);
    }
    else
    {
      unsigned int v7 = 2;
    }

    id v2 = v49;
  }
LABEL_97:

  xpc_object_t reply = xdict;
LABEL_98:
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Result", v7);
    xpc_dictionary_get_remote_connection(reply);
    unsigned int v48 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v48, reply);
  }
LABEL_101:
}

void sub_7C3C(id a1)
{
  if (!CFPreferencesAppSynchronize(@"com.apple.xpc.activity2")) {
    _os_assumes_log();
  }
}

void sub_7C6C(id a1)
{
  id v1 = qword_15470;
  if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "evaluating activities", buf, 2u);
  }
  sub_8140();
  v31.tv_sec = 0;
  *(void *)&v31.tv_usec = 0;
  gettimeofday(&v31, 0);
  if (dword_15428 < 1)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v3 = [(id)qword_153E8 copy];
    id v4 = [v3 countByEnumeratingWithState:&v27 objects:buf count:16];
    if (!v4) {
      goto LABEL_44;
    }
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    id key = (char *)XPC_ACTIVITY_SEQUENCE_NUMBER;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v27 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "das_eligible");
        id v10 = [v8 eligibleTime];
        if ((uint64_t)v10 <= (uint64_t)sub_5348())
        {
          if (!byte_153D8)
          {
            uint64_t v16 = qword_15470;
            id v9 = &dword_0 + 1;
            if (!os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO)) {
              goto LABEL_19;
            }
            *(_DWORD *)int64_t v33 = 138543362;
            id v34 = v8;
            CFTypeID v14 = v16;
            CFStringRef v15 = "Activity %{public}@ is eligible to run.";
            goto LABEL_18;
          }
          id v11 = [v8 name];
          unsigned int v12 = [v11 hasPrefix:@"com.apple.xpc.activity.test."];

          if (v12)
          {
            uint64_t v13 = qword_15470;
            id v9 = &dword_0 + 1;
            if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int64_t v33 = 138543362;
              id v34 = v8;
              CFTypeID v14 = v13;
              CFStringRef v15 = "Debug activity %{public}@ is eligible to run.";
LABEL_18:
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, v33, 0xCu);
            }
          }
        }
LABEL_19:
        int v17 = (char *)[v8 state];
        if (v17 == (unsigned char *)&dword_0 + 3) {
          goto LABEL_22;
        }
        if (v17 != (unsigned char *)&dword_0 + 2)
        {
          if (v17 != (unsigned char *)&dword_0 + 1) {
            goto LABEL_39;
          }
LABEL_22:
          if (v9) {
            sub_860C(v8, 2, 0);
          }
          goto LABEL_39;
        }
        if (v9 != [v8 eligible])
        {
          xpc_object_t v18 = [v8 peer];

          id v19 = qword_15478;
          BOOL v20 = os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              *(_DWORD *)int64_t v33 = 138543618;
              id v21 = "false";
              if (v9) {
                id v21 = "true";
              }
              id v34 = v8;
              __int16 v35 = 2080;
              id v36 = v21;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating: %{public}@ (eligible=%s)", v33, 0x16u);
            }
            xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_BOOL(v22, "eligible", (BOOL)v9);
            if ([v8 unmanaged])
            {
              id v23 = [v8 name];
              xpc_dictionary_set_string(v22, "name", (const char *)[v23 UTF8String]);
            }
            if ([v8 seqno]) {
              xpc_dictionary_set_uint64(v22, key, (uint64_t)[v8 seqno]);
            }
            uint64_t v24 = [v8 peer];
            xpc_connection_send_notification();
          }
          else if (v20)
          {
            *(_DWORD *)int64_t v33 = 138543618;
            id v25 = "false";
            if (v9) {
              id v25 = "true";
            }
            id v34 = v8;
            __int16 v35 = 2080;
            id v36 = v25;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating (deferred): %{public}@ (eligible=%s)", v33, 0x16u);
          }
        }
LABEL_39:
        [v8 setEligible:v9];

        if ([v8 state] == (char *)&dword_0 + 1 || objc_msgSend(v8, "state") == (char *)&dword_0 + 3) {
          sub_25D0(v8);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (!v5)
      {
LABEL_44:

        return;
      }
    }
  }
  id v2 = qword_15470;
  if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "activities are suspended", buf, 2u);
  }
}

void sub_8140()
{
  dispatch_source_t v0 = (void *)qword_15420;
  if (qword_15420)
  {
    id v1 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      int v4 = 138543362;
      uint64_t v5 = qword_15420;
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Reaping zombie: %{public}@", (uint8_t *)&v4, 0xCu);
      dispatch_source_t v0 = (void *)qword_15420;
    }
    sub_8548(v0);
    id v2 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      int v4 = 138543362;
      uint64_t v5 = qword_15420;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "REAPED zombie: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    id v3 = (void *)qword_15420;
    qword_15420 = 0;
  }
}

void sub_825C(id a1)
{
  qword_153B8 = 0x7FFFFFFFFFFFFFFFLL;
  id v1 = qword_15470;
  if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "activity timer fired", v4, 2u);
  }
  id v2 = qword_15418;
  dispatch_time_t v3 = dispatch_time(0, 50000000);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
}

void sub_82FC(id a1, int a2)
{
  id v2 = qword_15418;
  dispatch_time_t v3 = dispatch_time(0, 50000000);

  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
}

void sub_8354(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = (id)qword_153E8;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    if (a1 >= 0) {
      unint64_t v7 = a1;
    }
    else {
      unint64_t v7 = -a1;
    }
    int64_t v8 = v7 / 0x3B9ACA00;
    *(void *)&long long v4 = 138543362;
    long long v13 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", v13, (void)v14) == (char *)&dword_0 + 1
          || [v10 state] == (char *)&dword_0 + 3)
        {
          id v11 = [v10 delay];
          if (v8 >= ((uint64_t)v11 + (uint64_t)objc_msgSend(v10, "grace_period")) / 100)
          {
            unsigned int v12 = qword_15470;
            if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v13;
              id v19 = v10;
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Time Change: resubmitting actiivty %{public}@", buf, 0xCu);
            }
            sub_6768(v10);
            sub_3624(v10);
            sub_25D0(v10);
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

void sub_8548(void *a1)
{
  id v5 = a1;
  sub_860C(v5, -1, 0);
  id v1 = [v5 peer];

  if (v1)
  {
    id v2 = [v5 peer];
    xpc_connection_cancel(v2);
  }
  [v5 setPeer:0];
  id v3 = [v5 connection];

  if (v3)
  {
    long long v4 = [v5 connection];
    xpc_connection_cancel(v4);
  }
  [v5 setConnection:0];
}

void sub_860C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)qword_15470;
  if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = v6;
    int64_t v8 = [v5 name];
    *(_DWORD *)id v50 = 138543874;
    *(void *)&v50[4] = v8;
    *(_WORD *)&v50[12] = 2048;
    *(void *)&v50[14] = [v5 state];
    *(_WORD *)&v50[22] = 2048;
    unsigned int v51 = (void *)a2;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@ state change %ld -> %ld", v50, 0x20u);
  }
  switch(a2)
  {
    case -1:
      sub_6768(v5);
      if ([v5 state] == (char *)&dword_0 + 2) {
        [v5 resetBaseTime];
      }
      a2 = -1;
      goto LABEL_58;
    case 2:
      objc_msgSend(v5, "setConfirmed_run:", 0);
      id v9 = qword_15478;
      if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v50 = 138543362;
        *(void *)&v50[4] = v5;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Initiating: %{public}@", v50, 0xCu);
      }
      [v5 markStarted:sub_5348()];
      if (objc_msgSend(v5, "schedule_rtc_wake"))
      {
        if (objc_msgSend(v5, "power_assertion")) {
          _os_assumes_log();
        }
        if ([v5 pid]) {
          _os_assumes_log();
        }
        id v10 = [v5 name];
        objc_msgSend(v5, "setPower_assertion:", sub_6060((const char *)objc_msgSend(v10, "UTF8String")));

        id v11 = (void *)qword_15470;
        if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = v11;
          unsigned int v13 = objc_msgSend(v5, "power_assertion");
          *(_DWORD *)id v50 = 138543618;
          *(void *)&v50[4] = v5;
          *(_WORD *)&v50[12] = 1024;
          *(_DWORD *)&v50[14] = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Created temporary power assertion for %{public}@: %d", v50, 0x12u);
        }
      }
      xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
      if ([v5 seqno]) {
        xpc_dictionary_set_uint64(v14, XPC_ACTIVITY_SEQUENCE_NUMBER, (uint64_t)[v5 seqno]);
      }
      if (![v5 unmanaged])
      {
        id v29 = v5;
        if (![v29 unmanaged])
        {
          long long v30 = [v29 connection];

          if (!v30)
          {
            xpc_connection_t v31 = xpc_connection_create(0, (dispatch_queue_t)qword_15468);
            [v29 setConnection:v31];

            int64_t v32 = [v29 connection];
            *(void *)id v50 = _NSConcreteStackBlock;
            *(void *)&v50[8] = 3221225472;
            *(void *)&v50[16] = sub_8F58;
            unsigned int v51 = &unk_108C8;
            id v33 = v29;
            id v52 = v33;
            xpc_connection_set_event_handler(v32, v50);

            id v34 = [v33 connection];
            xpc_connection_activate(v34);
          }
          __int16 v35 = [v29 connection];
          xpc_endpoint_t v36 = xpc_endpoint_create(v35);

          xpc_dictionary_set_value(v14, XPC_ACTIVITY_REPLY_ENDPOINT, v36);
          [v29 token];
          xpc_event_provider_token_fire();
        }
        sub_A17C();
      }
      xpc_dictionary_set_BOOL(v14, "run", 1);
      id v15 = [v5 name];
      xpc_dictionary_set_string(v14, "name", (const char *)[v15 UTF8String]);

      long long v16 = [v5 peer];
      xpc_connection_send_notification();

      a2 = 2;
      break;
    case 3:
      long long v17 = qword_15478;
      if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v50 = 138543362;
        *(void *)&v50[4] = v5;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Deferring: %{public}@", v50, 0xCu);
      }
      if (((objc_msgSend(v5, "power_nap") & 1) != 0 || objc_msgSend(v5, "app_refresh"))
        && IOPMIsADarkWake()
        && IOPMAllowsBackgroundTask())
      {
        [v5 resetBaseTime];
      }
      sub_25D0(v5);
      sub_6768(v5);
      sub_3624(v5);
      a2 = 3;
      goto LABEL_58;
    case 5:
      xpc_object_t v18 = qword_15478;
      if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v50 = 138543362;
        *(void *)&v50[4] = v5;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Completed: %{public}@", v50, 0xCu);
      }
      if (byte_153D8)
      {
        id v19 = objc_msgSend(v5, "scheduler_activity");
        [v19 setCompletionStatus:a3];
      }
      id v20 = v5;
      id v21 = v20;
      if (byte_153D8)
      {
        xpc_object_t v22 = objc_msgSend(v20, "scheduler_activity");

        if (v22)
        {
          unsigned __int8 v23 = objc_msgSend(v21, "das_started");
          uint64_t v24 = (void *)qword_15470;
          if (v23)
          {
            if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
            {
              id v25 = v24;
              int v26 = objc_msgSend(v21, "scheduler_activity");
              *(_DWORD *)id v50 = 138543618;
              *(void *)&v50[4] = v26;
              *(_WORD *)&v50[12] = 2048;
              *(void *)&v50[14] = v21;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Completing: %{public}@ (CTS Activity %p)", v50, 0x16u);
            }
            long long v27 = (void *)qword_15480;
            long long v28 = objc_msgSend(v21, "scheduler_activity");
            [v27 activityCompleted:v28];

            objc_msgSend(v21, "setScheduler_activity:", 0);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v37 = v24;
              id v38 = [v21 name];
              *(_DWORD *)id v50 = 138543618;
              *(void *)&v50[4] = v38;
              *(_WORD *)&v50[12] = 2048;
              *(void *)&v50[14] = v21;
              _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Trying to complete DASActivity for \"%{public}@\" (CTS Activity %p) but it never started, likely forced. Canceling instead.", v50, 0x16u);
            }
            sub_6768(v21);
          }
        }
      }

      [v21 advanceBaseTime];
      if (IOPMIsADarkWake() && IOPMAllowsBackgroundTask()) {
        objc_msgSend(v21, "setBgwake_count:", objc_msgSend(v21, "bgwake_count") + 1);
      }
      if (objc_msgSend(v21, "post_install"))
      {
        id v39 = v21;
        id v40 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.xpc.activity2"];
        id v41 = [v40 arrayForKey:@"VersionSpecificActivitiesRun"];
        uint64_t v42 = v41;
        if (v41) {
          id v43 = [v41 mutableCopy];
        }
        else {
          id v43 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
        }
        unsigned int v44 = v43;
        id v45 = [v39 name];

        [v44 addObject:v45];
        [v40 setObject:v44 forKey:@"VersionSpecificActivitiesRun"];
      }
      if ([v21 repeating])
      {
        int v46 = qword_15478;
        if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v50 = 138543362;
          *(void *)&v50[4] = v21;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Rescheduling: %{public}@", v50, 0xCu);
        }
        sub_25D0(v21);
        [v21 setEligible:0];
        sub_3624(v21);
        a2 = 1;
      }
      else
      {
        a2 = 5;
      }
LABEL_58:
      if ([v5 state] == (char *)&dword_0 + 2) {
        [v5 markStopped:sub_5348()];
      }
      break;
    default:
      break;
  }
  [v5 setState:a2];
  if ([v5 state] != (char *)&dword_0 + 2 && objc_msgSend(v5, "power_assertion"))
  {
    unsigned int v47 = (void *)qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      unsigned int v48 = v47;
      unsigned int v49 = objc_msgSend(v5, "power_assertion");
      *(_DWORD *)id v50 = 67109378;
      *(_DWORD *)&v50[4] = v49;
      *(_WORD *)&v50[8] = 2114;
      *(void *)&v50[10] = v5;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "releasing power assertion: %d for %{public}@", v50, 0x12u);
    }
    j__IOPMAssertionRelease((IOPMAssertionID)objc_msgSend(v5, "power_assertion"));
    objc_msgSend(v5, "setPower_assertion:", 0);
  }
}

void sub_8F58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_15468);
    unint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_9070;
    id v10 = &unk_109B0;
    id v11 = *(id *)(a1 + 32);
    long long v4 = v3;
    unsigned int v12 = v4;
    xpc_connection_set_event_handler(v4, &v7);
    xpc_connection_activate(v4);
    id v5 = objc_msgSend(*(id *)(a1 + 32), "peer", v7, v8, v9, v10);

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) peer];
      xpc_connection_cancel(v6);
    }
    [*(id *)(a1 + 32) setPeer:v4];
  }
}

void sub_9070(uint64_t a1, void *a2)
{
}

void sub_9080(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7 == &_xpc_error_connection_invalid)
  {
    unsigned int v13 = qword_15470;
    if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
    {
      int v26 = 138543362;
      *(void *)long long v27 = v5;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Client connection closed: %{public}@", (uint8_t *)&v26, 0xCu);
    }
    if ([v5 state] == (char *)&dword_0 + 2 && (objc_msgSend(v5, "unmanaged") & 1) == 0) {
      sub_860C(v5, 3, 0);
    }
    xpc_object_t v14 = [v5 peer];

    if (v14 == v6)
    {
      id v15 = [v5 peer];
      xpc_connection_cancel(v15);

      [v5 setPeer:0];
    }
    if ([v5 unmanaged])
    {
      long long v16 = qword_15478;
      if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543362;
        *(void *)long long v27 = v5;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Unregistered unmanaged XPC Activity: %{public}@", (uint8_t *)&v26, 0xCu);
      }
      [(id)qword_153E8 removeObject:v5];
      sub_8548(v5);
    }
  }
  else if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(v8, "state");
    int64_t v10 = xpc_dictionary_get_int64(v8, "completion_status");
    if (int64 == 2)
    {
      if ([v5 state] == (char *)&dword_0 + 2)
      {
        objc_msgSend(v5, "setConfirmed_run:", 1);
        [v5 setPid:xpc_connection_get_pid(v6)];
        long long v17 = (void *)qword_15478;
        if (os_log_type_enabled((os_log_t)qword_15478, OS_LOG_TYPE_DEFAULT))
        {
          xpc_object_t v18 = v17;
          int v26 = 67109378;
          *(_DWORD *)long long v27 = [v5 pid];
          *(_WORD *)&v27[4] = 2114;
          *(void *)&v27[6] = v5;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Running (PID %d): %{public}@", (uint8_t *)&v26, 0x12u);
        }
        if (byte_153D8)
        {
          id v19 = [v5 pid];
          id v20 = objc_msgSend(v5, "scheduler_activity");
          [v20 setPid:v19];

          id v21 = (void *)qword_15480;
          xpc_object_t v22 = objc_msgSend(v5, "scheduler_activity");
          [v21 activityStarted:v22];
        }
        IOPMAssertionID v23 = objc_msgSend(v5, "power_assertion");
        if (v23)
        {
          IOPMAssertionID v24 = v23;
          j__IOPMAssertionRelease(v23);
          id v25 = qword_15470;
          if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_INFO))
          {
            int v26 = 138543618;
            *(void *)long long v27 = v5;
            *(_WORD *)&v27[8] = 1024;
            *(_DWORD *)&v27[10] = v24;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "releasing temporary power assertion: %{public}@: %d", (uint8_t *)&v26, 0x12u);
          }
          objc_msgSend(v5, "setPower_assertion:", 0);
        }
      }
    }
    else if (int64 == 5 || int64 == 3)
    {
      sub_860C(v5, int64, v10);
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "state", (int64_t)[v5 state]);
      xpc_dictionary_set_BOOL(reply, "eligible", (BOOL)[v5 eligible]);
      if ([v5 seqno]) {
        xpc_dictionary_set_uint64(reply, XPC_ACTIVITY_SEQUENCE_NUMBER, (uint64_t)[v5 seqno]);
      }
      xpc_dictionary_get_remote_connection(reply);
      unsigned int v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v12, reply);
    }
  }
}

void sub_94B8(uint64_t a1, void *a2)
{
}

void sub_9A2C()
{
}

void sub_9A98(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!qword_15450)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)qword_15450;
    qword_15450 = v6;
  }
  if (a1 == 2)
  {
    long long v17 = (void *)qword_15450;
    xpc_object_t v18 = +[NSNumber numberWithUnsignedLongLong:a2];
    uint64_t v8 = [v17 objectForKey:v18];

    id v19 = (void *)qword_15440;
    if (os_log_type_enabled((os_log_t)qword_15440, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      id v21 = [(CTSCalendarInterval *)v8 identifier];
      int v23 = 136315138;
      id v24 = [v21 UTF8String];
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Unregistered StartCalendarInterval: %s", (uint8_t *)&v23, 0xCu);
    }
    xpc_object_t v22 = (void *)qword_15450;
    unsigned int v12 = +[NSNumber numberWithUnsignedLongLong:a2];
    [v22 removeObjectForKey:v12];
    goto LABEL_10;
  }
  if (a1 == 1)
  {
    uint64_t v8 = [[CTSCalendarInterval alloc] initWithToken:a2 andEvent:v5];
    id v9 = (void *)qword_15450;
    int64_t v10 = +[NSNumber numberWithUnsignedLongLong:a2];
    [v9 setObject:v8 forKey:v10];

    id v11 = (void *)qword_15440;
    if (!os_log_type_enabled((os_log_t)qword_15440, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      goto LABEL_12;
    }
    unsigned int v12 = v11;
    unsigned int v13 = [(CTSCalendarInterval *)v8 identifier];
    xpc_object_t v14 = [(CTSCalendarInterval *)v8 fireDate];
    id v15 = +[NSLocale currentLocale];
    long long v16 = [v14 descriptionWithLocale:v15];
    int v23 = 138543618;
    id v24 = v13;
    __int16 v25 = 2114;
    int v26 = v16;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Registered StartCalendarInterval: %{public}@: %{public}@", (uint8_t *)&v23, 0x16u);

LABEL_10:
    goto LABEL_11;
  }
LABEL_12:
  sub_9D74();
}

void sub_9D28(id a1)
{
  qword_15458 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];

  _objc_release_x1();
}

void sub_9D74()
{
  id v0 = +[NSDate distantFuture];
  id v1 = +[NSDate date];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)qword_15450;
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  long long v16 = v0;
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        uint64_t v6 = v0;
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(id)qword_15450 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        uint64_t v8 = [v7 fireDate];
        id v9 = [v8 compare:v1];

        if (v9 == (id)-1)
        {
          int64_t v10 = (void *)qword_15440;
          if (os_log_type_enabled((os_log_t)qword_15440, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = v10;
            unsigned int v12 = [v7 identifier];
            *(_DWORD *)buf = 138543362;
            int v23 = v12;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Running StartCalendarInterval: %{public}@", buf, 0xCu);
          }
          [v7 token];
          xpc_event_provider_token_set_state();
        }
        unsigned int v13 = [v7 fireDate];
        id v0 = [v6 earlierDate:v13];
      }
      id v3 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v3);
  }

  if (!qword_15448) {
    xpc_event_provider_get_queue();
  }
  if ([v0 compare:v16] == (id)-1)
  {
    [v0 timeIntervalSinceNow];
    dispatch_time_t v15 = dispatch_walltime(0, 1000000000 * (uint64_t)v14);
    dispatch_source_set_timer((dispatch_source_t)qword_15448, v15, 0xFFFFFFFFFFFFFFFFLL, 0x165A0BC00uLL);
  }
}

void sub_A17C()
{
}

void sub_A198()
{
}

void sub_A1B4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No name in unmanaged activity request. Rejecting request.", v1, 2u);
}

void sub_A1F8(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to register unmanaged XPC Activity: %{public}s", (uint8_t *)&v2, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t IOPMAllowsBackgroundTask()
{
  return _IOPMAllowsBackgroundTask();
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPMIsADarkWake()
{
  return _IOPMIsADarkWake();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return _host_get_special_port(host_priv, node, which, port);
}

kern_return_t host_request_notification(host_t host, host_flavor_t notify_type, mach_port_t notify_port)
{
  return _host_request_notification(host, notify_type, notify_port);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

mach_msg_return_t mach_msg_receive(mach_msg_header_t *a1)
{
  return _mach_msg_receive(a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return _nw_endpoint_create_from_dictionary();
}

uint64_t nw_parameters_create_from_dictionary()
{
  return _nw_parameters_create_from_dictionary();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t sysctlbyname_get_data_np()
{
  return _sysctlbyname_get_data_np();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

uint64_t xpc_connection_send_notification()
{
  return _xpc_connection_send_notification();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_debug_description()
{
  return _xpc_copy_debug_description();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}

uint64_t xpc_get_event_name()
{
  return _xpc_get_event_name();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return _xpc_get_service_identifier_for_token();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_advanceBaseTime(void *a1, const char *a2, ...)
{
  return [a1 advanceBaseTime];
}

id objc_msgSend_baseTime(void *a1, const char *a2, ...)
{
  return [a1 baseTime];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return [a1 complete];
}

id objc_msgSend_completeUnlessOpen(void *a1, const char *a2, ...)
{
  return [a1 completeUnlessOpen];
}

id objc_msgSend_completeUntilFirstUserAuthentication(void *a1, const char *a2, ...)
{
  return [a1 completeUntilFirstUserAuthentication];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_deadlineTime(void *a1, const char *a2, ...)
{
  return [a1 deadlineTime];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_eligible(void *a1, const char *a2, ...)
{
  return [a1 eligible];
}

id objc_msgSend_eligibleTime(void *a1, const char *a2, ...)
{
  return [a1 eligibleTime];
}

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return [a1 fireDate];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_isValidDate(void *a1, const char *a2, ...)
{
  return [a1 isValidDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadBaseTime(void *a1, const char *a2, ...)
{
  return [a1 loadBaseTime];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_repeating(void *a1, const char *a2, ...)
{
  return [a1 repeating];
}

id objc_msgSend_resetBaseTime(void *a1, const char *a2, ...)
{
  return [a1 resetBaseTime];
}

id objc_msgSend_resetFireDate(void *a1, const char *a2, ...)
{
  return [a1 resetFireDate];
}

id objc_msgSend_runOnAppForeground(void *a1, const char *a2, ...)
{
  return [a1 runOnAppForeground];
}

id objc_msgSend_seqno(void *a1, const char *a2, ...)
{
  return [a1 seqno];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_setEveryMinuteIfNothingElseSet(void *a1, const char *a2, ...)
{
  return [a1 setEveryMinuteIfNothingElseSet];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_tempDelay(void *a1, const char *a2, ...)
{
  return [a1 tempDelay];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_unmanaged(void *a1, const char *a2, ...)
{
  return [a1 unmanaged];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}