void sub_1000034B8(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;

  if (qword_100063980)
  {
    v3 = [objc_alloc((Class)NSString) initWithUTF8String:a2];
    if ([v3 hasPrefix:@"com.apple."]
      && ([(id)qword_100063980 containsObject:v3] & 1) == 0)
    {
      v4 = sub_10001B604();
      v5 = v4;
      if (!v4 || ([v4 lastPathComponent], (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0)) {
        v6 = [objc_alloc((Class)NSString) initWithUTF8String:a2];
      }
      v7 = sub_100027DEC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v20 = a2;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "adding %s to force-quit monitoring list", buf, 0xCu);
      }

      v8 = qword_100063990;
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_100004CB4;
      v16 = &unk_100050D08;
      v17 = v3;
      v9 = v6;
      v18 = v9;
      dispatch_sync(v8, &v13);
      if (qword_100063958)
      {
        [objc_msgSend((id)qword_100063958, "updateConfiguration:", &stru_100050B78, v13, v14, v15, v16, v17);
      }
      else
      {
        v10 = +[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", &stru_100050B78, v13, v14, v15, v16, v17);
        v11 = (void *)qword_100063958;
        qword_100063958 = v10;

        if (!qword_100063958)
        {
          v12 = sub_100027DEC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to create process monitor", buf, 2u);
          }
        }
      }
    }
  }
}

void sub_100003704(id a1, RBSProcessMonitorConfiguring *a2)
{
  v2 = a2;
  v3 = +[RBSProcessStateDescriptor descriptor];
  [v3 setValues:1];
  uint64_t v7 = FBSSceneVisibilityEndowmentNamespace;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 setEndowmentNamespaces:v4];

  [(RBSProcessMonitorConfiguring *)v2 setStateDescriptor:v3];
  v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifiers:qword_100063980];
  v6 = +[NSArray arrayWithObject:v5];
  [(RBSProcessMonitorConfiguring *)v2 setPredicates:v6];

  [(RBSProcessMonitorConfiguring *)v2 setEvents:1];
  [(RBSProcessMonitorConfiguring *)v2 setUpdateHandler:&stru_100050BB8];
}

void sub_100003834(id a1, RBSProcessMonitor *a2, RBSProcessHandle *a3, RBSProcessStateUpdate *a4)
{
  v6 = a2;
  uint64_t v7 = a3;
  v8 = a4;
  v9 = [(RBSProcessStateUpdate *)v8 exitEvent];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 process];
    v12 = [v11 bundle];
    v13 = [v12 identifier];

    v14 = [v10 process];
    v15 = [v14 bundle];
    v16 = [v15 executablePath];

    v17 = [v10 context];
    v18 = sub_100027DEC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v10 process];
      LODWORD(buf) = 67109120;
      DWORD1(buf) = [v19 pid];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Process %d terminating", (uint8_t *)&buf, 8u);
    }
    v20 = [v17 status];
    if ([v20 domain] == 10)
    {
      v21 = sub_100027DEC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v20 code];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Exit code: 0x%llx", (uint8_t *)&buf, 0xCu);
      }

      if ([v20 code] == (id)3735943697)
      {
        v23 = objc_alloc_init(HTForceQuitRecord);
        [(HTForceQuitRecord *)v23 setBundleId:v13];
        [(HTForceQuitRecord *)v23 setExecutablePath:v16];
        [(HTForceQuitRecord *)v23 setAbsoluteTime:mach_absolute_time()];
        v24 = [v10 process];
        -[HTForceQuitRecord setPid:](v23, "setPid:", [v24 pid]);

        v25 = +[NSDate date];
        [(HTForceQuitRecord *)v23 setCalendarTime:v25];

        v26 = v23;
        [(HTForceQuitRecord *)v26 setExpirationMSec:qword_1000634D0];
        v27 = (void *)dispatch_time(0, 1000000 * [(HTForceQuitRecord *)v26 expirationMSec]);
        v28 = qword_100063990;
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v85 = (uint64_t)sub_100006890;
        v86 = (uint64_t (*)(uint64_t, uint64_t))&unk_100050E68;
        v87 = (void (*)(uint64_t))v26;
        id v88 = v27;
        v29 = v26;
        dispatch_sync(v28, &buf);
      }
    }
  }
  else
  {
    v30 = [(RBSProcessStateUpdate *)v8 previousState];
    if ([v30 isRunning])
    {
    }
    else
    {
      v31 = [(RBSProcessStateUpdate *)v8 state];
      unsigned int v32 = [v31 isRunning];

      if (v32)
      {
        v33 = [(RBSProcessStateUpdate *)v8 process];
        v34 = [v33 bundle];
        v54 = [v34 identifier];

        uint64_t v35 = mach_absolute_time();
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v85 = 0x3032000000;
        v86 = sub_100004100;
        v87 = sub_100004110;
        id v88 = 0;
        uint64_t v76 = 0;
        v77 = &v76;
        uint64_t v78 = 0x3032000000;
        v79 = sub_100004100;
        v80 = sub_100004110;
        id v81 = 0;
        uint64_t v72 = 0;
        v73 = &v72;
        uint64_t v74 = 0x2020000000;
        char v75 = 0;
        v71[0] = 0;
        v71[1] = v71;
        v71[2] = 0x2020000000;
        v71[3] = 0;
        v36 = qword_100063990;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100004118;
        block[3] = &unk_100050BE0;
        p_long long buf = &buf;
        id v65 = v54;
        v67 = v71;
        v68 = &v72;
        id v37 = v65;
        v69 = &v76;
        uint64_t v70 = v35;
        dispatch_sync(v36, block);
        if (*((unsigned char *)v73 + 24))
        {
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_1000044B4;
          v63[3] = &unk_100050C08;
          v63[4] = &buf;
          dispatch_async((dispatch_queue_t)qword_100063998, v63);
          v57 = _NSConcreteStackBlock;
          uint64_t v58 = 3221225472;
          v59 = sub_100004650;
          v60 = &unk_100050C30;
          id v61 = v37;
          v62 = v71;
          AnalyticsSendEventLazy();
          id v38 = objc_alloc_init((Class)UNMutableNotificationContent);
          uint64_t v39 = v77[5];
          v40 = (void *)qword_100063960;
          v41 = [*(id *)(*((void *)&buf + 1) + 40) calendarTime];
          v42 = [v40 stringFromDate:v41];
          v43 = +[NSString stringWithFormat:@"%@ was recently force-quit at %@ and was immediately relaunched. Did you encounter a problem?", v39, v42];
          [v38 setBody:v43];

          v44 = +[UNNotificationSound defaultSound];
          [v38 setSound:v44];

          [v38 setThreadIdentifier:@"com.apple.hangtracerd.usernotifications.force-quit"];
          [v38 setCategoryIdentifier:@"com.apple.hangtracerd.usernotifications.force-quit"];
          [v38 setShouldBackgroundDefaultAction:1];
          v45 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
          [v38 setExpirationDate:v45];

          v82[0] = @"pid";
          v46 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*((void *)&buf + 1) + 40) pid]);
          v82[1] = @"absoluteTime";
          v83[0] = v46;
          v47 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(*((void *)&buf + 1) + 40) absoluteTime]);
          v83[1] = v47;
          v48 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
          [v38 setUserInfo:v48];

          [v38 setTitle:@"Kill-and-Relaunch Detection"];
          v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%d", @"com.apple.hangtracerd.usernotifications.force-quit", [*(id *)(*((void *)&buf + 1) + 40) pid]);
          v50 = +[UNNotificationRequest requestWithIdentifier:v49 content:v38 trigger:0 destinations:5];

          v51 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
          v52 = [v51 notificationCenter];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100004730;
          v55[3] = &unk_100050CE0;
          id v53 = v50;
          id v56 = v53;
          [v52 getNotificationSettingsWithCompletionHandler:v55];
        }
        _Block_object_dispose(v71, 8);
        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(&v76, 8);

        _Block_object_dispose(&buf, 8);
      }
    }
  }
}

void sub_1000040B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Block_object_dispose((const void *)(v43 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004110(uint64_t a1)
{
}

void sub_100004118(uint64_t a1)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = (id)qword_100063970;
  id v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v28 + 1) + 8 * (void)v6));
        uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) bundleId];
        unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 72);
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9
                                                                      - (void)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40) absoluteTime];
          if (sub_10002A984(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) < (double)(unint64_t)qword_1000634D0)
          {
            v12 = sub_100027DEC();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              id v13 = [*(id *)(a1 + 32) UTF8String];
              *(_DWORD *)long long buf = 136315138;
              id v33 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "App %s relaunched", buf, 0xCu);
            }

            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
            uint64_t v14 = [(id)qword_100063988 objectForKeyedSubscript:*(void *)(a1 + 32)];
            uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
            v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;

            [(id)qword_100063970 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
            if ((unint64_t)[(id)qword_100063978 count] >= 8)
            {
              v17 = [(id)qword_100063978 objectAtIndexedSubscript:0];
              id v18 = [v17 pid];
              v19 = +[NSString stringWithFormat:@"%@.%d", @"com.apple.hangtracerd.usernotifications.force-quit", v18, (void)v28];
              [(id)qword_100063978 removeObjectAtIndex:0];
              v20 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
              v21 = [v20 notificationCenter];
              id v22 = +[NSArray arrayWithObject:v19];
              [v21 removePendingNotificationRequestsWithIdentifiers:v22];

              v23 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
              v24 = [v23 notificationCenter];
              v25 = +[NSArray arrayWithObject:v19];
              [v24 removeDeliveredNotificationsWithIdentifiers:v25];

              v26 = [v17 filePath];

              if (v26)
              {
                id v27 = [v17 filePath];
                unlink((const char *)[v27 UTF8String]);
              }
            }
            [(id)qword_100063978 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
            goto LABEL_18;
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

LABEL_18:
}

void sub_1000044B4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pid];
  id v3 = (void *)qword_100063988;
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bundleId];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) executablePath];
  id v11 = 0;
  LODWORD(v2) = +[HTTailspin saveTailspinForForceQuitProcessID:v2 procName:v5 procPath:v6 filePath:&v11];
  id v7 = v11;

  if (v2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setFilePath:v7];
    unsigned int v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pid];
      unsigned int v10 = [(id)qword_100063978 count];
      *(_DWORD *)long long buf = 67109376;
      unsigned int v13 = v9;
      __int16 v14 = 1024;
      unsigned int v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Dumped tailspin for pid %d, now total pending records %u", buf, 0xEu);
    }
  }
}

id sub_100004650(uint64_t a1)
{
  v6[0] = @"mode";
  v6[1] = @"bundleid";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v7[0] = @"detection";
  v7[1] = v1;
  v6[2] = @"timegap";
  id v3 = +[NSNumber numberWithDouble:sub_10002A984(*(void *)(*(void *)(v2 + 8) + 24))];
  v7[2] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

void sub_100004730(uint64_t a1, void *a2)
{
  id v3 = [a2 authorizationStatus];
  if (v3 == (id)2)
  {
    uint64_t v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v13 = "monitorForForceQuit_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification previously authorized", buf, 0xCu);
    }

    id v4 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
    v6 = [v4 notificationCenter];
    [v6 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100050C70];
  }
  else if (v3 == (id)1)
  {
    id v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v13 = "monitorForForceQuit_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s notification previously denied, will not post", buf, 0xCu);
    }
  }
  else
  {
    id v7 = sub_100027DEC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v13 = "monitorForForceQuit_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s requesting provisional notification authorization", buf, 0xCu);
    }

    unsigned int v8 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
    unsigned int v9 = [v8 notificationCenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004A60;
    v10[3] = &unk_100050CB8;
    id v11 = *(id *)(a1 + 32);
    [v9 requestAuthorizationWithOptions:68 completionHandler:v10];

    id v4 = v11;
  }
}

void sub_10000497C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100027DEC();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v2;
      uint64_t v5 = "Notification dispatch failed: %@";
      v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    uint64_t v5 = "Notification dispatched";
    v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_100004A60(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    os_log_type_t v7 = sub_100027DEC();
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v9) {
        goto LABEL_11;
      }
      int v13 = 138412290;
      id v14 = v5;
      unsigned int v10 = "Notification authorization error: %@";
      id v11 = v7;
      uint32_t v12 = 12;
    }
    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      LOWORD(v13) = 0;
      unsigned int v10 = "Notification newly denied";
      id v11 = v7;
      uint32_t v12 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    goto LABEL_11;
  }
  v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notification granted", (uint8_t *)&v13, 2u);
  }

  os_log_type_t v7 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
  uint32_t v8 = [v7 notificationCenter];
  [v8 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100050C90];

LABEL_11:
}

void sub_100004BD0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100027DEC();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v2;
      id v5 = "Notification dispatch failed: %@";
      v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    id v5 = "Notification dispatched";
    v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

id sub_100004CB4(uint64_t a1)
{
  [(id)qword_100063980 addObject:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)qword_100063988;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setObject:v3 forKey:v4];
}

id sub_100004D00()
{
  v0 = +[UNNotificationAction actionWithIdentifier:@"FileRadarAction" title:@"File a radar" options:0];
  uint64_t v1 = +[UNNotificationAction actionWithIdentifier:@"DismissAction" title:@"Dismiss" options:0];
  uint64_t v2 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Internal.Classic/Application%20Debugging/ForceQuitTailspinDump"];
  uint64_t v3 = +[UNNotificationAction actionWithIdentifier:@"MoreOptionAction" title:@"Settings" url:v2 options:0];

  v7[0] = v0;
  v7[1] = v1;
  v7[2] = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:v7 count:3];
  id v5 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.hangtracerd.usernotifications.force-quit" actions:v4 intentIdentifiers:&__NSArray0__struct options:1];

  return v5;
}

Block_layout *sub_100004E70()
{
  return &stru_100050D48;
}

void sub_100004E7C(id a1, UNNotificationResponse *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [(UNNotificationResponse *)v2 notification];
  uint64_t v4 = [v3 request];
  id v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 hasPrefix:@"com.apple.hangtracerd.usernotifications.force-quit"];

  if (v6)
  {
    os_log_type_t v7 = [(UNNotificationResponse *)v2 notification];
    uint32_t v8 = [v7 request];
    int v9 = [v8 content];
    unsigned int v10 = [v9 userInfo];

    id v11 = [v10 objectForKeyedSubscript:@"pid"];
    LODWORD(v7) = [v11 intValue];

    uint32_t v12 = [v10 objectForKeyedSubscript:@"absoluteTime"];
    id v13 = [v12 longLongValue];

    *(void *)&long long v66 = 0;
    *((void *)&v66 + 1) = &v66;
    uint64_t v67 = 0x3032000000;
    v68 = sub_100004100;
    v69 = sub_100004110;
    id v70 = 0;
    uint64_t v55 = 0;
    id v56 = &v55;
    uint64_t v57 = 0x3032000000;
    uint64_t v58 = sub_100004100;
    v59 = sub_100004110;
    id v60 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000579C;
    block[3] = &unk_100050D70;
    int v46 = (int)v7;
    void block[4] = &v66;
    block[5] = &v47;
    block[6] = &v55;
    block[7] = v13;
    dispatch_sync((dispatch_queue_t)qword_100063990, block);
    if (!*((unsigned char *)v48 + 24))
    {
LABEL_29:
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v55, 8);

      _Block_object_dispose(&v66, 8);
      goto LABEL_30;
    }
    id v14 = [(UNNotificationResponse *)v2 actionIdentifier];
    unsigned int v15 = [v14 isEqualToString:UNNotificationDefaultActionIdentifier];

    if (v15)
    {
      v65[0] = @"Kill-and-Relaunch";
      v64[0] = kCFUserNotificationAlertHeaderKey;
      v64[1] = kCFUserNotificationAlertMessageKey;
      uint64_t v16 = v56[5];
      v17 = (void *)qword_100063960;
      id v18 = [*(id *)(*((void *)&v66 + 1) + 40) calendarTime];
      v19 = [v17 stringFromDate:v18];
      v20 = +[NSString stringWithFormat:@"%@ was recently force-quit at %@ and was immediately relaunched. Did you encounter a problem?", v16, v19];
      v65[1] = v20;
      v65[2] = @"File a radar";
      v64[2] = kCFUserNotificationDefaultButtonTitleKey;
      v64[3] = kCFUserNotificationAlternateButtonTitleKey;
      v65[3] = @"Dismiss";
      v65[4] = @"Settings";
      v64[4] = kCFUserNotificationOtherButtonTitleKey;
      v64[5] = kCFUserNotificationAlertTopMostKey;
      v65[5] = &__kCFBooleanTrue;
      v65[6] = &__kCFBooleanTrue;
      v64[6] = SBUserNotificationForcesModalAlertAppearance;
      v64[7] = SBUserNotificationDisplayActionButtonOnLockScreen;
      v65[7] = &__kCFBooleanTrue;
      CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:8];

      id v22 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, 0, v21);
      CFOptionFlags responseFlags = 0;
      CFUserNotificationReceiveResponse(v22, 0.0, &responseFlags);
      if (v22) {
        CFRelease(v22);
      }
      v23 = sub_100027DEC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = responseFlags;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "User selected %lu", (uint8_t *)&buf, 0xCu);
      }

      if (responseFlags == 2)
      {
        long long v30 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Internal.Classic/Application%20Debugging/ForceQuitTailspinDump"];
        v73[0] = FBSOpenApplicationOptionKeyUnlockDevice;
        v73[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
        *(void *)&long long buf = &__kCFBooleanTrue;
        *((void *)&buf + 1) = &__kCFBooleanTrue;
        long long v31 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v73 count:2];
        unsigned int v32 = +[LSApplicationWorkspace defaultWorkspace];
        id v61 = 0;
        [v32 openSensitiveURL:v30 withOptions:v31 error:&v61];
        id v33 = v61;

        if (v33)
        {
          v34 = sub_100027DEC();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v71 = 138412290;
            id v72 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed to open settings: %@", v71, 0xCu);
          }
        }
      }
      else if (!responseFlags)
      {
        *((unsigned char *)v52 + 24) = 1;
      }
      goto LABEL_23;
    }
    id v27 = [(UNNotificationResponse *)v2 actionIdentifier];
    if (([v27 isEqualToString:UNNotificationDismissActionIdentifier] & 1) == 0)
    {
      long long v28 = [(UNNotificationResponse *)v2 actionIdentifier];
      if (![v28 isEqualToString:@"DismissAction"])
      {
        id v37 = [(UNNotificationResponse *)v2 actionIdentifier];
        unsigned __int8 v38 = [v37 isEqualToString:@"FileRadarAction"];

        if ((v38 & 1) == 0)
        {
          uint64_t v39 = [(UNNotificationResponse *)v2 actionIdentifier];
          unsigned __int8 v40 = [v39 isEqualToString:@"MoreOptionAction"];

          if ((v40 & 1) == 0)
          {
            v41 = sub_100027DEC();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = [(UNNotificationResponse *)v2 actionIdentifier];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Unknown action identifier %@", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_29;
          }
          goto LABEL_24;
        }
        goto LABEL_17;
      }
    }
LABEL_17:
    CFDictionaryRef v21 = [(UNNotificationResponse *)v2 actionIdentifier];
    unsigned __int8 v29 = [(__CFDictionary *)v21 isEqualToString:@"FileRadarAction"];
    *((unsigned char *)v52 + 24) = v29;
LABEL_23:

LABEL_24:
    if (*((unsigned char *)v52 + 24))
    {
      v62[0] = kCFUserNotificationAlertMessageKey;
      v62[1] = kCFUserNotificationDefaultButtonTitleKey;
      v63[0] = @"Was the issue a hang?";
      v63[1] = @"Yes, a hang";
      v62[2] = kCFUserNotificationAlternateButtonTitleKey;
      v62[3] = kCFUserNotificationAlertTopMostKey;
      v63[2] = @"No, not a hang";
      v63[3] = &__kCFBooleanTrue;
      v62[4] = SBUserNotificationForcesModalAlertAppearance;
      v62[5] = SBUserNotificationDisplayActionButtonOnLockScreen;
      v63[4] = &__kCFBooleanTrue;
      void v63[5] = &__kCFBooleanTrue;
      CFDictionaryRef v35 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:6];
      v36 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, 0, v35);
      *(void *)&long long buf = 0;
      CFUserNotificationReceiveResponse(v36, 0.0, (CFOptionFlags *)&buf);
      if (v36) {
        CFRelease(v36);
      }
      [*(id *)(*((void *)&v66 + 1) + 40) setIsHang:buf == 0];
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000059C8;
    v43[3] = &unk_100050DC0;
    v43[4] = &v66;
    v43[5] = &v51;
    dispatch_async((dispatch_queue_t)qword_100063998, v43);
    goto LABEL_29;
  }
  unsigned int v10 = sub_100027DEC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(UNNotificationResponse *)v2 notification];
    v25 = [v24 request];
    v26 = [v25 identifier];
    LODWORD(v66) = 138412290;
    *(void *)((char *)&v66 + 4) = v26;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unrecognized request identifier %@", (uint8_t *)&v66, 0xCu);
  }
LABEL_30:
}

void sub_100005734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10000579C(uint64_t a1)
{
  uint64_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)long long buf = 67109376;
    int v22 = v3;
    __int16 v23 = 1024;
    unsigned int v24 = [(id)qword_100063978 count];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Looking for record with pid %d, total %u records", buf, 0xEu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)qword_100063978;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint32_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(id *)(*((void *)&v16 + 1) + 8 * (void)v8));
        if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "pid", (void)v16) == *(_DWORD *)(a1 + 64)
          && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) absoluteTime] == *(id *)(a1 + 56))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          id v11 = (void *)qword_100063988;
          uint32_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bundleId];
          uint64_t v13 = [v11 objectForKeyedSubscript:v12];
          uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
          unsigned int v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          [(id)qword_100063978 removeObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
          goto LABEL_14;
        }
        uint32_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

LABEL_14:
}

void sub_1000059C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) filePath];

  if (v2)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      int v3 = sub_100027DEC();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) filePath];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Filing a radar with file %@", (uint8_t *)&buf, 0xCu);
      }
      AnalyticsSendEventLazy();
      id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v32 = [objc_alloc((Class)NSMutableString) initWithString:@"1299292"];
      id v6 = objc_alloc((Class)NSMutableString);
      uint64_t v7 = (void *)qword_100063988;
      uint32_t v8 = [v5 bundleId];
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];
      id v31 = [v6 initWithString:v9];

      if ([v5 isHang]) {
        [v32 appendFormat:@",%@", @"1299293"];
      }
      v44[0] = @"BundleID";
      unsigned int v10 = [v5 bundleId];
      *(void *)&long long buf = v10;
      v44[1] = @"Classification";
      unsigned int v11 = [v5 isHang];
      CFStringRef v12 = &stru_100053108;
      if (v11) {
        CFStringRef v12 = @"Crash/Hang/Data Loss";
      }
      *((void *)&buf + 1) = v12;
      v44[2] = @"Attachments";
      uint64_t v13 = [v5 filePath];
      int v46 = v13;
      v44[3] = @"Title";
      uint64_t v14 = +[NSString stringWithFormat:@"[Force Quit] I killed %@ and relaunched it because...", v31];
      uint64_t v47 = v14;
      v44[4] = @"Keywords";
      v44[5] = @"DeleteOnAttach";
      id v48 = v32;
      CFStringRef v49 = @"1";
      CFStringRef v50 = @"1";
      v44[6] = @"IncludeDevicePrefixInTitle";
      v44[7] = @"TimeOfIssue";
      unsigned int v15 = (void *)qword_100063968;
      long long v16 = [v5 calendarTime];
      long long v17 = [v15 stringFromDate:v16];
      uint64_t v51 = v17;
      long long v18 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v44 count:8];
      long long v19 = +[NSMutableDictionary dictionaryWithDictionary:v18];

      if ([v5 isHang]) {
        [v19 setObject:@"com.apple.HangTracer.HangLogsDiagnosticExtension" forKeyedSubscript:@"ExtensionIdentifiers"];
      }
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x2020000000;
      char v39 = 1;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000068E8;
      v35[3] = &unk_100050E90;
      id v37 = v38;
      id v20 = [objc_alloc((Class)NSMutableString) initWithString:@"tap-to-radar://new?"];
      id v36 = v20;
      [v19 enumerateKeysAndObjectsUsingBlock:v35];
      CFDictionaryRef v21 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      int v22 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:v21];

      __int16 v23 = sub_100027DEC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v43) = 138412290;
        *(void *)((char *)&v43 + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "URL string is %@", (uint8_t *)&v43, 0xCu);
      }

      unsigned int v24 = +[NSURL URLWithString:v22];
      v42[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v42[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      *(void *)&long long v43 = &__kCFBooleanTrue;
      *((void *)&v43 + 1) = &__kCFBooleanTrue;
      v25 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:v42 count:2];
      v26 = +[LSApplicationWorkspace defaultWorkspace];
      id v34 = 0;
      [v26 openURL:v24 withOptions:v25 error:&v34];
      id v27 = v34;

      if (v27)
      {
        long long v28 = sub_100027DEC();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned __int8 v40 = 138412290;
          id v41 = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error launching Tap-To-Radar for force-quit notification interaction: %@", v40, 0xCu);
        }
      }
      _Block_object_dispose(v38, 8);
    }
    else
    {
      id v33 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) filePath];
      unlink((const char *)[v33 UTF8String]);
    }
  }
  else
  {
    unsigned __int8 v29 = sub_100027DEC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v30 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pid];
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "File for pid %d not found, tailspin generation likely failed", (uint8_t *)&buf, 8u);
    }
  }
}

void sub_100006090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000060C8(uint64_t a1)
{
  v6[0] = @"mode";
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isHang]) {
    CFStringRef v2 = @"hang";
  }
  else {
    CFStringRef v2 = @"nonhang";
  }
  v6[1] = @"bundleid";
  v7[0] = v2;
  int v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bundleId];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_1000061B0()
{
  if (qword_1000639A8 != -1) {
    dispatch_once(&qword_1000639A8, &stru_100050E00);
  }
  v0 = +[HTPrefs sharedPrefs];
  uint64_t v1 = [v0 forceQuitDetectionThresholdMSec];
  qword_1000634D0 = v1;
  CFStringRef v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    uint64_t v14 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Force-quit detection threshold set to %llu ms", (uint8_t *)&v13, 0xCu);
  }

  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = (void *)qword_100063980;
  qword_100063980 = (uint64_t)v3;

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = (void *)qword_100063988;
  qword_100063988 = (uint64_t)v5;

  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100063990);
  uint32_t v8 = (void *)qword_1000639A0;
  qword_1000639A0 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000639A0, &stru_100050E20);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v10 = (void *)qword_100063970;
  qword_100063970 = (uint64_t)v9;

  id v11 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v12 = (void *)qword_100063978;
  qword_100063978 = (uint64_t)v11;

  dispatch_resume((dispatch_object_t)qword_1000639A0);
}

void sub_100006358(id a1)
{
  sub_10001BAA4(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/");
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  CFStringRef v2 = (void *)qword_100063960;
  qword_100063960 = (uint64_t)v1;

  [(id)qword_100063960 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  id v4 = (void *)qword_100063968;
  qword_100063968 = (uint64_t)v3;

  [(id)qword_100063968 setDateFormat:@"yyyy.MM.dd_HH-mm-ss"];
  id v5 = +[NSString stringWithFormat:@"%@.queue", @"com.apple.hangtracer.force-quit-detection"];
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
  dispatch_source_t v7 = (void *)qword_100063990;
  qword_100063990 = (uint64_t)v6;

  id v10 = +[NSString stringWithFormat:@"%@.slow-task-queue", @"com.apple.hangtracer.force-quit-detection"];
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
  id v9 = (void *)qword_100063998;
  qword_100063998 = (uint64_t)v8;
}

void sub_100006484(id a1)
{
  uint64_t v1 = mach_absolute_time();
  if ([(id)qword_100063970 count])
  {
    uint64_t v2 = 0;
    int v3 = 0;
    int v4 = 0;
    do
    {
      id v5 = [(id)qword_100063970 objectAtIndexedSubscript:v2];
      if (v1 <= (unint64_t)[v5 absoluteTime]
        || (double v6 = sub_10002A984(v1 - (void)[v5 absoluteTime]),
            v6 >= (double)(unint64_t)[v5 expirationMSec]))
      {
        ++v3;
        [(id)qword_100063970 removeObjectAtIndex:v2];
        --v4;
      }

      uint64_t v2 = ++v4;
    }
    while ((unint64_t)[(id)qword_100063970 count] > v4);
  }
  else
  {
    int v3 = 0;
  }
  dispatch_source_t v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removed %u expired force-quit records", (uint8_t *)v8, 8u);
  }
}

void sub_1000065E0()
{
  if (qword_1000639A0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1000639A0);
    v0 = (void *)qword_1000639A0;
    qword_1000639A0 = 0;
  }
  if (qword_100063958)
  {
    [(id)qword_100063958 invalidate];
    uint64_t v1 = (void *)qword_100063958;
    qword_100063958 = 0;
  }
  uint64_t v2 = qword_100063990;
  if (qword_100063990)
  {
    dispatch_sync(v2, &stru_100050E40);
  }
}

void sub_100006664(id a1)
{
  uint64_t v1 = (void *)qword_100063970;
  qword_100063970 = 0;

  uint64_t v2 = (void *)qword_100063978;
  if (qword_100063978)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = (id)qword_100063978;
    id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          dispatch_source_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [(id)qword_100063970 removeObject:v7];
          dispatch_queue_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%d", @"com.apple.hangtracerd.usernotifications.force-quit", [v7 pid]);
          id v9 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
          id v10 = [v9 notificationCenter];
          id v11 = +[NSArray arrayWithObject:v8];
          [v10 removePendingNotificationRequestsWithIdentifiers:v11];

          CFStringRef v12 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
          int v13 = [v12 notificationCenter];
          uint64_t v14 = +[NSArray arrayWithObject:v8];
          [v13 removeDeliveredNotificationsWithIdentifiers:v14];

          id v15 = [v7 filePath];
          unlink((const char *)[v15 UTF8String]);
        }
        id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v4);
    }

    uint64_t v2 = (void *)qword_100063978;
  }
  qword_100063978 = 0;
}

void sub_100006890(uint64_t a1)
{
  [(id)qword_100063970 addObject:*(void *)(a1 + 32)];
  uint64_t v2 = qword_1000639A0;
  dispatch_time_t v3 = *(void *)(a1 + 40);

  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_1000068E8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    *(unsigned char *)(v6 + 24) = 0;
  }
  else {
    [*(id *)(a1 + 32) appendString:@"&"];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@=%@", v7, v5];
}

UNNotificationCategory *sub_10000697C()
{
  return +[UNNotificationCategory categoryWithIdentifier:@"com.apple.hangtracerd.usernotifications.hang-log" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
}

void sub_1000069A0(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = +[HTPrefs sharedPrefs];
  unsigned int v8 = [v7 shouldUpdateHangsHUD];

  if (v8)
  {
    id v9 = +[HTPrefs sharedPrefs];
    unsigned int v10 = [v9 isInternal];

    if (!v10)
    {
      int v13 = @"settings-navigation://com.apple.Settings.Developer/HANGTRACER_EXTERNAL_CONFIGURE/";
      goto LABEL_6;
    }
    id v11 = +[HTPrefs sharedPrefs];
    double v12 = (double)[v11 hudThresholdMSec];

    if (v12 <= a3)
    {
      int v13 = @"settings-navigation://com.apple.Settings.Internal.Classic/HANGTRACER/";
LABEL_6:
      id v14 = objc_alloc_init((Class)UNMutableNotificationContent);
      id v15 = v5;
      id v16 = objc_alloc_init((Class)NSNumberFormatter);
      [v16 setNumberStyle:0];
      long long v17 = sub_100006CD8(@"HANG_LOG_NOTIFICATION_SUMMARY_MILLISECONDS%@%@");
      long long v18 = +[NSNumber numberWithDouble:a3];
      long long v19 = [v16 stringFromNumber:v18];
      long long v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v19, v15);

      [v14 setBody:v20];
      CFDictionaryRef v21 = +[UNNotificationSound defaultSound];
      [v14 setSound:v21];

      [v14 setThreadIdentifier:@"com.apple.hangtracerd.usernotifications.hang-log"];
      [v14 setCategoryIdentifier:@"com.apple.hangtracerd.usernotifications.hang-log"];
      [v14 setInterruptionLevel:0];
      int v22 = sub_100006CD8(@"HANG_DETECTED");
      [v14 setTitle:v22];

      __int16 v23 = [(__CFString *)v13 stringByAppendingString:v6];
      unsigned int v24 = +[NSURL URLWithString:v23];
      [v14 setDefaultActionURL:v24];

      v25 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.hangtracerd.usernotifications.hang-log", v15];
      v26 = +[UNNotificationRequest requestWithIdentifier:v25 content:v14 trigger:0];

      id v27 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
      long long v28 = [v27 notificationCenter];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100006EF0;
      v30[3] = &unk_100050CE0;
      id v31 = v26;
      id v29 = v26;
      [v28 getNotificationSettingsWithCompletionHandler:v30];
    }
  }
}

id sub_100006CD8(void *a1)
{
  id v1 = a1;
  if (qword_1000639B8 != -1) {
    dispatch_once(&qword_1000639B8, &stru_100050EF0);
  }
  id v2 = (id)qword_1000639B0;
  dispatch_time_t v3 = +[HTPrefs sharedPrefs];
  id v4 = [v3 thirdPartyDevPreferredLanguages];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = +[HTPrefs sharedPrefs];
    id v7 = [v6 thirdPartyDevPreferredLanguages];
    unsigned int v8 = [v7 firstObject];
    id v9 = +[NSLocale localeWithLocaleIdentifier:v8];
    unsigned int v10 = [v9 languageCode];

    id v11 = [v2 localizations];
    long long v17 = v10;
    double v12 = +[NSArray arrayWithObjects:&v17 count:1];
    int v13 = +[NSBundle preferredLocalizationsFromArray:v11 forPreferences:v12];
    id v14 = [v13 firstObject];

    id v15 = [v2 localizedStringForKey:v1 value:&stru_100053108 table:@"InfoPlist" localization:v14];
  }
  else
  {
    id v15 = [v2 localizedStringForKey:v1 value:&stru_100053108 table:@"InfoPlist"];
  }

  return v15;
}

void sub_100006EF0(uint64_t a1, void *a2)
{
  id v3 = [a2 authorizationStatus];
  if (v3 == (id)2)
  {
    id v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      int v13 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification previously authorized", buf, 0xCu);
    }

    id v4 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
    id v6 = [v4 notificationCenter];
    [v6 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100050EB0];
  }
  else if (v3 == (id)1)
  {
    id v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v13 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s notification previously denied, will not post", buf, 0xCu);
    }
  }
  else
  {
    id v7 = sub_100027DEC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      int v13 = "postHangLogNotification_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s requesting provisional notification authorization", buf, 0xCu);
    }

    unsigned int v8 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
    id v9 = [v8 notificationCenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007220;
    v10[3] = &unk_100050CB8;
    id v11 = *(id *)(a1 + 32);
    [v9 requestAuthorizationWithOptions:68 completionHandler:v10];

    id v4 = v11;
  }
}

void sub_10000713C(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100027DEC();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v2;
      id v5 = "Notification dispatch failed: %@";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    id v5 = "Notification dispatched";
    id v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_100007220(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    os_log_type_t v7 = sub_100027DEC();
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v9) {
        goto LABEL_11;
      }
      int v13 = 138412290;
      id v14 = v5;
      unsigned int v10 = "Notification authorization error: %@";
      id v11 = v7;
      uint32_t v12 = 12;
    }
    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      LOWORD(v13) = 0;
      unsigned int v10 = "Notification newly denied";
      id v11 = v7;
      uint32_t v12 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    goto LABEL_11;
  }
  id v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notification granted", (uint8_t *)&v13, 2u);
  }

  os_log_type_t v7 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
  uint32_t v8 = [v7 notificationCenter];
  [v8 addNotificationRequest:*(void *)(a1 + 32) withCompletionHandler:&stru_100050ED0];

LABEL_11:
}

void sub_100007390(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100027DEC();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v2;
      id v5 = "Notification dispatch failed: %@";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    id v5 = "Notification dispatched";
    id v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_100007474(id a1)
{
  id v3 = +[NSURL fileURLWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.hangtracerd.usernotifications.bundle" relativeToURL:0];
  uint64_t v1 = +[NSBundle bundleWithURL:v3];
  id v2 = (void *)qword_1000639B0;
  qword_1000639B0 = v1;
}

void sub_1000075CC()
{
  v0 = sub_100027DEC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v2, 2u);
  }

  uint64_t v1 = [(id)qword_1000639C8 transaction];

  if (v1) {
    [(id)qword_1000639C8 setTransaction:0];
  }
}

void sub_100007F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100007FE4(id a1)
{
  uint64_t v1 = [[HTFixedSizeQueue alloc] initWithSize:128];
  id v2 = (void *)qword_1000639C8;
  qword_1000639C8 = (uint64_t)v1;

  if (!qword_1000639C8)
  {
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to instantiate queue to hold process launch and exit records, exiting", v4, 2u);
    }

    exit(12);
  }
}

void sub_100008730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_msgSend(@"com.apple.hangtracer.htprefs.refreshed", "isEqualToString:"))
  {
    id v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v128 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Handling notification: %@", buf, 0xCu);
    }

    id v5 = +[HTPrefs sharedPrefs];
    unsigned int v6 = [v5 memoryLoggingEnabled];

    os_log_type_t v7 = sub_100027DEC();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Memory Logging Enabled", buf, 2u);
      }

      if (!qword_1000639F8)
      {
        dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100064560);
        unsigned int v10 = (void *)qword_1000639F8;
        qword_1000639F8 = (uint64_t)v9;

        dispatch_source_set_event_handler((dispatch_source_t)qword_1000639F8, &stru_100050FF8);
        sub_10000BA2C();
        dispatch_resume((dispatch_object_t)qword_1000639F8);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Memory Logging Disabled", buf, 2u);
      }

      if (qword_1000639F8)
      {
        dispatch_source_cancel((dispatch_source_t)qword_1000639F8);
        id v11 = (void *)qword_1000639F8;
        qword_1000639F8 = 0;
      }
    }
    uint32_t v12 = +[HTPrefs sharedPrefs];
    unsigned int v13 = [v12 hangtracerDaemonEnabled];

    id v14 = sub_100027DEC();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Enabled", buf, 2u);
      }

      if (!launch_service_stats_enable())
      {
        id v16 = sub_100027DEC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_100031210();
        }
      }
      if (!qword_100063A00)
      {
        dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100064560);
        long long v18 = (void *)qword_100063A00;
        qword_100063A00 = (uint64_t)v17;

        dispatch_time_t v19 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer((dispatch_source_t)qword_100063A00, v19, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
        dispatch_source_set_event_handler((dispatch_source_t)qword_100063A00, &stru_100051018);
        dispatch_resume((dispatch_object_t)qword_100063A00);
      }
      if (qword_100063A30 != -1) {
        dispatch_once(&qword_100063A30, &stru_100051038);
      }
      long long v20 = +[HTPrefs sharedPrefs];
      if ([v20 forceQuitDetectionEnabled])
      {
        CFDictionaryRef v21 = +[HTPrefs sharedPrefs];
        unsigned int v22 = [v21 isInternal];

        if (v22)
        {
          __int16 v23 = sub_100027DEC();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Force Quit Detection Enabled", buf, 2u);
          }

          if ((byte_100063A38 & 1) == 0)
          {
            byte_100063A38 = 1;
            sub_1000061B0();
          }
          goto LABEL_45;
        }
      }
      else
      {
      }
      long long v28 = sub_100027DEC();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Force Quit Detection Disabled", buf, 2u);
      }

      if (byte_100063A38 == 1)
      {
        byte_100063A38 = 0;
        sub_1000065E0();
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Hang Tracer Daemon Disabled", buf, 2u);
      }

      +[HTProcessInfo stopWatchingAllPids];
      if (byte_100063A38 == 1)
      {
        byte_100063A38 = 0;
        sub_1000065E0();
      }
      unsigned int v24 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
      v25 = [v24 notificationCenter];

      [v25 removeAllPendingNotificationRequests];
      [v25 removeAllDeliveredNotifications];

      if (!launch_service_stats_disable())
      {
        v26 = sub_100027DEC();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_100031244();
        }
      }
      if (qword_100063A00)
      {
        dispatch_source_cancel((dispatch_source_t)qword_100063A00);
        id v27 = (void *)qword_100063A00;
        qword_100063A00 = 0;
      }
    }
LABEL_45:
    id v29 = sub_100027DEC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "hangtracerd compiled without App Activation Logging", buf, 2u);
    }

    unsigned int v30 = +[HTPrefs sharedPrefs];
    unsigned int v31 = [v30 slowAppActivationTailspinEnabled];

    if (v31)
    {
      id v32 = sub_100027DEC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Slow App Activation Tailspins Enabled", buf, 2u);
      }

      +[HTTailspin resetDailyActivationTailspinCounts];
      +[HTTailspin resetAppActivationTailspinCounts];
    }
    id v33 = +[HTPrefs sharedPrefs];
    unsigned int v34 = [v33 eplEnabledProfile];

    CFDictionaryRef v35 = +[HTPrefs sharedPrefs];
    unsigned int v36 = [v35 eplEnabled];

    id v37 = sub_100027DEC();
    unsigned __int8 v38 = v37;
    if (v34)
    {
      if (v36)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_1000311A8();
        }
LABEL_58:

        goto LABEL_66;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "EPL is not enabled by PLDE, but enabled by profile, attempting to persist and unredact logs", buf, 2u);
      }

      int v39 = 1;
    }
    else
    {
      if (v36)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_1000311DC();
        }
        goto LABEL_58;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "EPL is not enabled by PLDE, and not enabled by profile, attempting to restore os_log state", buf, 2u);
      }

      int v39 = 0;
    }
    sub_10001BDE4(v39);
LABEL_66:
    unsigned __int8 v40 = +[STYSignpostsMonitor sharedMonitor];
    id v41 = +[HTPrefs sharedPrefs];
    unsigned int v42 = [v41 signpostMonitoringEnabled];

    long long v43 = sub_100027DEC();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
    if (!v42)
    {
      if (v44)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Signpost Monitoring Disabled", buf, 2u);
      }

      [v40 stopMonitoringSignposts];
LABEL_78:
      CFStringRef v49 = +[HTPrefs sharedPrefs];
      unsigned int v50 = [v49 appLaunchMonitoringEnabled];

      uint64_t v51 = sub_100027DEC();
      BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);
      if (v50)
      {
        if (v52)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "App Launch Monitoring Enabled", buf, 2u);
        }

        [v40 monitorAppLaunchSignposts];
        unsigned int v42 = 1;
      }
      else
      {
        if (v52)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "App Launch Monitoring Disabled", buf, 2u);
        }

        [v40 stopMonitoringAppLaunchSignposts];
      }
      uint64_t v53 = +[HTPrefs sharedPrefs];
      unsigned int v54 = [v53 workflowResponsivenessEnabled];

      uint64_t v55 = sub_100027DEC();
      BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_INFO);
      if (v54)
      {
        if (v56)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Workflow Responsiveness Monitoring Enabled", buf, 2u);
        }

        uint64_t v57 = +[HTPrefs sharedPrefs];
        id v58 = [v57 workflowResponsivenessDailyLogLimit];
        v59 = +[HTPrefs sharedPrefs];
        id v60 = [v59 workflowResponsivenessPerPeriodLogLimit];
        id v61 = +[HTPrefs sharedPrefs];
        [v40 monitorWorkflowsWithDailyLogLimit:v58 perPeriodLogLimit:v60 periodLengthSec:sub_10002A9DC([v61 reportPeriodMATU])];
      }
      else
      {
        if (v56)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Workflow Responsiveness Monitoring Disabled", buf, 2u);
        }

        [v40 stopMonitoringWorkflows];
      }
      if (v42)
      {
        if (!qword_100063A10)
        {
          dispatch_source_t v62 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100064560);
          v63 = (void *)qword_100063A10;
          qword_100063A10 = (uint64_t)v62;

          dispatch_time_t v64 = dispatch_time(0, 60000000000);
          dispatch_source_set_timer((dispatch_source_t)qword_100063A10, v64, 0xDF8475800uLL, 0x3B9ACA00uLL);
          dispatch_source_set_event_handler((dispatch_source_t)qword_100063A10, &stru_100051058);
          dispatch_resume((dispatch_object_t)qword_100063A10);
        }
      }
      else if (qword_100063A10)
      {
        dispatch_source_cancel((dispatch_source_t)qword_100063A10);
        id v65 = (void *)qword_100063A10;
        qword_100063A10 = 0;
      }
      long long v66 = +[HTPrefs sharedPrefs];
      unsigned int v67 = [v66 shouldUpdateHangsHUD];

      if (v67)
      {
        if ((byte_1000639D8 & 1) == 0)
        {
          if (!qword_100063A08)
          {
            dispatch_source_t v68 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100064568);
            v69 = (void *)qword_100063A08;
            qword_100063A08 = (uint64_t)v68;

            dispatch_time_t v70 = dispatch_time(0, 50000000);
            dispatch_source_set_timer((dispatch_source_t)qword_100063A08, v70, 0x2FAF080uLL, 0x2FAF080uLL);
            dispatch_source_set_event_handler((dispatch_source_t)qword_100063A08, &stru_100051078);
            dispatch_resume((dispatch_object_t)qword_100063A08);
          }
          byte_1000639D8 = 1;
        }
      }
      else if (!byte_1000639D8)
      {
        goto LABEL_107;
      }
      v71 = +[HTPrefs sharedPrefs];
      unsigned __int8 v72 = [v71 shouldUpdateHangsHUD];

      if ((v72 & 1) == 0)
      {
        byte_1000639D8 = 0;
        if (qword_100063A08)
        {
          dispatch_source_cancel((dispatch_source_t)qword_100063A08);
          v73 = (void *)qword_100063A08;
          qword_100063A08 = 0;
        }
        sub_100027B18(0);
      }
LABEL_107:
      uint64_t v74 = +[HTPrefs sharedPrefs];
      if (([v74 hangtracerDaemonEnabled] & 1) == 0)
      {
        char v75 = +[HTPrefs sharedPrefs];
        if (([v75 forceQuitDetectionEnabled] & 1) == 0)
        {
          uint64_t v76 = +[HTPrefs sharedPrefs];
          if (([v76 memoryLoggingEnabled] & 1) == 0)
          {
            v77 = +[HTPrefs sharedPrefs];
            if (([v77 appActivationLoggingEnabled] & 1) == 0)
            {
              uint64_t v78 = +[HTPrefs sharedPrefs];
              if (([v78 signpostMonitoringEnabled] & 1) == 0)
              {
                v79 = +[HTPrefs sharedPrefs];
                if (([v79 workflowResponsivenessEnabled] & 1) == 0)
                {
                  +[HTPrefs sharedPrefs];
                  v116 = v115 = v40;
                  unsigned __int8 v123 = [v116 appLaunchMonitoringEnabled];

                  unsigned __int8 v40 = v115;
                  if ((v123 & 1) == 0)
                  {
                    v117 = sub_100027DEC();
                    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "Triggering cleanup of the spool directory on exit", buf, 2u);
                    }

                    sub_100009A0C(1);
                    v118 = sub_100027DEC();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "hangtracerd will exit. All sources turned off", buf, 2u);
                    }

                    if ((byte_1000639D9 & 1) == 0)
                    {
                      v119 = sub_100027DEC();
                      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "hangtracerd is setting up xpc connection and handler before exiting", buf, 2u);
                      }

                      handler[0] = _NSConcreteStackBlock;
                      handler[1] = 3221225472;
                      handler[2] = sub_10000A058;
                      handler[3] = &unk_100050F38;
                      v120 = xpc_connection_create_mach_service("com.apple.hangtracerd", (dispatch_queue_t)qword_100064560, 1uLL);
                      v126 = v120;
                      xpc_connection_set_event_handler(v120, handler);
                      xpc_connection_resume(v120);
                    }
                    v121 = sub_100027DEC();
                    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "hangtracerd is exiting", buf, 2u);
                    }

                    exit(0);
                  }
LABEL_119:
                  v80 = +[HTPrefs sharedPrefs];
                  id v81 = [v80 areProcessTerminationsMonitored];

                  if (!qword_1000639E8)
                  {
                    v82 = +[HTPrefs sharedPrefs];
                    uint64_t v83 = +[HTProcessExitFilteringConfiguration configurationFromPrefs:v82];
                    v84 = (void *)qword_1000639E8;
                    qword_1000639E8 = v83;
                  }
                  uint64_t v85 = +[HTPrefs sharedPrefs];
                  v86 = +[HTProcessExitFilteringConfiguration configurationFromPrefs:v85];

                  v87 = +[HTPrefs sharedPrefs];
                  id v88 = [v87 runloopHangTimeoutDurationMSec];

                  v89 = +[HTPrefs sharedPrefs];
                  v90 = [v89 thirdPartyDevPreferredLanguages];

                  if (byte_1000639DA == v81
                    && v88 == (id)qword_1000639E0
                    && [v90 isEqualToArray:off_100063598]
                    && ([v86 isEqual:qword_1000639E8] & 1) != 0)
                  {
                    v91 = sub_100027DEC();
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                    {
                      CFStringRef v92 = @"Disabled";
                      if (v81) {
                        CFStringRef v92 = @"Enabled";
                      }
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v128 = (uint64_t)v92;
                      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "Process Terminations: no changes (%@)", buf, 0xCu);
                    }
                    goto LABEL_155;
                  }
                  v93 = sub_100027DEC();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                  {
                    CFStringRef v94 = @"Disabled";
                    if (v81) {
                      CFStringRef v94 = @"Enabled";
                    }
                    *(_DWORD *)long long buf = 138412290;
                    uint64_t v128 = (uint64_t)v94;
                    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Process Terminations: %@", buf, 0xCu);
                  }

                  v95 = sub_100027DEC();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 134217984;
                    uint64_t v128 = (uint64_t)v88;
                    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "HTPrefs.sharedPrefs.timeoutDurationPrevious is now %llu", buf, 0xCu);
                  }
                  v122 = v40;

                  v96 = sub_100027DEC();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    uint64_t v128 = (uint64_t)v90;
                    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "HTPrefs.sharedPrefs.thirdPartyDevPreferredLanguages is now %@", buf, 0xCu);
                  }

                  v97 = [HUDConfiguration alloc];
                  v98 = +[HTPrefs sharedPrefs];
                  id v99 = [v98 runloopHangTimeoutDurationMSec];
                  v100 = +[HTPrefs sharedPrefs];
                  v101 = [v100 thirdPartyDevPreferredLanguages];
                  v91 = [(HUDConfiguration *)v97 initWithRunloopHangTimeoutDurationMSec:v99 thirdPartyDevPreferredLanguages:v101 areProcessTerminationsMonitored:v81 processTerminationsFiltering:v86];

                  v102 = sub_100027DEC();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG)) {
                    sub_100031174();
                  }

                  v103 = +[HangHUDClient sharedInstance];
                  [v103 sendHudConfiguration:v91 completion:&stru_100050F58];

                  byte_1000639DA = (char)v81;
                  qword_1000639E0 = (uint64_t)v88;
                  objc_storeStrong((id *)&off_100063598, v90);
                  objc_storeStrong((id *)&qword_1000639E8, v86);
                  if (v81)
                  {
                    if (qword_1000639F0)
                    {
                      unsigned __int8 v40 = v122;
LABEL_155:

                      return;
                    }
                    v106 = +[HangHUDClient sharedInstance];
                    uint64_t v107 = [v106 obtainKeepHangHUDAliveAssertion:@"HangHUD keep alive assertion from hangtracerd"];
                    v108 = (void *)qword_1000639F0;
                    qword_1000639F0 = v107;

                    id v124 = 0;
                    unsigned __int8 v109 = [(id)qword_1000639F0 acquireWithError:&v124];
                    id v105 = v124;
                    v110 = sub_100027DEC();
                    v111 = v110;
                    if (v109)
                    {
                      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 134217984;
                        uint64_t v128 = qword_1000639F0;
                        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "Acquired keepHangHUDAliveAssertion: %p", buf, 0xCu);
                      }
                    }
                    else if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                    {
                      v114 = [(id)qword_1000639F0 target];
                      *(_DWORD *)long long buf = 138412546;
                      uint64_t v128 = (uint64_t)v114;
                      __int16 v129 = 2114;
                      id v130 = v105;
                      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Failed to acquire keepHangHUDAliveAssertion in hangtracerd for target %@: %{public}@", buf, 0x16u);
                    }
                    unsigned __int8 v40 = v122;
                  }
                  else
                  {
                    unsigned __int8 v40 = v122;
                    if (!qword_1000639F0) {
                      goto LABEL_155;
                    }
                    v104 = sub_100027DEC();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)long long buf = 134217984;
                      uint64_t v128 = qword_1000639F0;
                      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "Invalidating keepHangHUDAliveAssertion: %p", buf, 0xCu);
                    }

                    [(id)qword_1000639F0 invalidate];
                    id v105 = (id)qword_1000639F0;
                    qword_1000639F0 = 0;
                  }

                  goto LABEL_155;
                }
              }
            }
          }
        }
      }
      goto LABEL_119;
    }
    if (v44)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Signpost Monitoring Enabled", buf, 2u);
    }

    v45 = +[HTPrefs sharedPrefs];
    if (([v45 eplEnabledProfile] & 1) == 0)
    {
      int v46 = +[HTPrefs sharedPrefs];
      if (![v46 eplEnabled])
      {
        v112 = +[HTPrefs sharedPrefs];
        unsigned __int8 v113 = [v112 isInternal];

        if ((v113 & 1) == 0)
        {
          uint64_t v47 = v40;
          uint64_t v48 = 1;
          goto LABEL_74;
        }
LABEL_73:
        uint64_t v47 = v40;
        uint64_t v48 = 0;
LABEL_74:
        [v47 monitorSignposts:v48];
        goto LABEL_78;
      }
    }
    goto LABEL_73;
  }
}

void sub_100009A0C(int a1)
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Cleaning up", buf, 2u);
  }

  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"/var/root/Library/Caches/hangtracerd/tmp"];
  if (a1) {
    [v3 addObject:@"/var/root/Library/Caches/hangtracerd/spool"];
  }
  id v4 = +[NSFileManager defaultManager];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v3;
  id v35 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v50;
    NSURLResourceKey v5 = NSURLTotalFileSizeKey;
    CFStringRef v6 = @"/var/root/Library/Caches/hangtracerd/tmp";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v7;
        BOOL v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
        dispatch_source_t v9 = sub_100027DEC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          unsigned int v54 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cleaning up %@", buf, 0xCu);
        }

        unsigned int v10 = +[NSURL URLWithString:v8];
        id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLPathKey, NSURLCreationDateKey, v5, 0);
        uint32_t v12 = [v4 enumeratorAtURL:v10 includingPropertiesForKeys:v11 options:0 errorHandler:&stru_1000510B8];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v38 = v12;
        id v40 = [v38 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v40)
        {
          uint64_t v39 = *(void *)v46;
          id v37 = v8;
          do
          {
            unsigned int v13 = 0;
            do
            {
              if (*(void *)v46 != v39) {
                objc_enumerationMutation(v38);
              }
              id v14 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v13);
              id v43 = 0;
              id v44 = 0;
              unsigned __int8 v15 = [v14 getResourceValue:&v44 forKey:v5 error:&v43];
              id v16 = v44;
              id v17 = v43;
              if ((v15 & 1) == 0)
              {
                long long v18 = sub_100027DEC();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  dispatch_time_t v19 = [v17 localizedDescription];
                  *(_DWORD *)long long buf = 138412546;
                  unsigned int v54 = v14;
                  __int16 v55 = 2112;
                  id v56 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error getting file size for %@: %@", buf, 0x16u);
                }
              }
              id v42 = v17;
              unsigned int v20 = [v4 removeItemAtURL:v14 error:&v42];
              id v21 = v42;

              unsigned int v22 = sub_100027DEC();
              BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
              if (v20)
              {
                if (!v23) {
                  goto LABEL_27;
                }
                *(_DWORD *)long long buf = 138412290;
                unsigned int v54 = v14;
                unsigned int v24 = v22;
                v25 = "Successfully deleted file at %@";
                uint32_t v26 = 12;
              }
              else
              {
                if (!v23) {
                  goto LABEL_27;
                }
                *(_DWORD *)long long buf = 138412802;
                unsigned int v54 = v14;
                __int16 v55 = 2112;
                id v56 = v16;
                __int16 v57 = 2112;
                id v58 = v21;
                unsigned int v24 = v22;
                v25 = "Failed to delete file at file path: %@ size: %@ error: %@";
                uint32_t v26 = 32;
              }
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
LABEL_27:

              if ([v8 isEqualToString:v6])
              {
                CFStringRef v27 = v6;
                long long v28 = v5;
                id v29 = v4;
                unsigned int v30 = [v16 unsignedIntValue];
                unsigned int v31 = sub_100027DEC();
                id v32 = v31;
                if (v30 < 0xC800001)
                {
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412802;
                    unsigned int v54 = v14;
                    __int16 v55 = 2112;
                    id v56 = v16;
                    __int16 v57 = 1024;
                    LODWORD(v58) = v20;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Detected file abandoned in the tmp directory, file path: %@ size: %@  deleted: %{BOOL}d", buf, 0x1Cu);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)long long buf = 138412802;
                    unsigned int v54 = v14;
                    __int16 v55 = 2112;
                    id v56 = v16;
                    __int16 v57 = 1024;
                    LODWORD(v58) = v20;
                    _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "Detected large file abandoned in the tmp directory, file path: %@ size: %@ deleted: %{BOOL}d", buf, 0x1Cu);
                  }

                  id v41 = v16;
                  AnalyticsSendEventLazy();
                  id v32 = v41;
                }
                id v4 = v29;

                NSURLResourceKey v5 = v28;
                CFStringRef v6 = v27;
                BOOL v8 = v37;
              }

              unsigned int v13 = (char *)v13 + 1;
            }
            while (v40 != v13);
            id v40 = [v38 countByEnumeratingWithState:&v45 objects:v59 count:16];
          }
          while (v40);
        }

        uint64_t v7 = v36 + 1;
      }
      while ((id)(v36 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v35);
  }
}

void sub_10000A058(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    CFStringRef v6 = sub_100027DEC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 67109120;
      LODWORD(v15) = xpc_connection_get_pid((xpc_connection_t)v3);
      uint64_t v7 = "XPC: Client started new connection: pid %d";
      BOOL v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 8;
      goto LABEL_8;
    }
  }
  else
  {
    xpc_type_t v5 = type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      if (v3 == &_xpc_error_connection_invalid)
      {
        CFStringRef v6 = sub_100027DEC();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_9;
        }
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        int v14 = 136315394;
        unsigned __int8 v15 = string;
        __int16 v16 = 1024;
        LODWORD(v17) = pid;
        uint64_t v7 = "xpc_error_connection_invalid %s - from pid %d";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_INFO;
        uint32_t v10 = 18;
        goto LABEL_8;
      }
      CFStringRef v6 = sub_100027DEC();
      BOOL v12 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v3 != &_xpc_error_connection_interrupted)
      {
        if (!v12) {
          goto LABEL_9;
        }
        int v14 = 134218242;
        unsigned __int8 v15 = (const char *)v3;
        __int16 v16 = 2080;
        id v17 = string;
        uint64_t v7 = "hangtracerd: Connection error: %p : %s";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        uint32_t v10 = 22;
        goto LABEL_8;
      }
      if (!v12) {
        goto LABEL_9;
      }
      int v14 = 136315138;
      unsigned __int8 v15 = string;
      uint64_t v7 = "xpc_error_connection_interrupted: %s";
      goto LABEL_5;
    }
    CFStringRef v6 = sub_100027DEC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      unsigned __int8 v15 = (const char *)v5;
      uint64_t v7 = "hangtracerd: unknown event type : %p";
LABEL_5:
      BOOL v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v14, v10);
    }
  }
LABEL_9:
}

void sub_10000A2A4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      xpc_type_t v5 = "htPrefsRefreshedNotificationCallback_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Process Terminations: sendHudConfiguration did not complete @ %s. Error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_10000A368(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  unsigned __int8 v6 = [a3 isEqualToString:off_1000637D8];
  uint64_t v7 = sub_100027DEC();
  BOOL v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v56 = "handleSentryTailspinRequest";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: received problem detected notification", buf, 0xCu);
    }

    os_log_type_t v9 = off_1000637E8;
    id v10 = a5;
    id v11 = [v10 objectForKeyedSubscript:v9];
    BOOL v12 = [v10 objectForKeyedSubscript:off_100063800];
    unsigned int v13 = [v10 objectForKeyedSubscript:off_1000637F0];
    uint64_t v14 = [v10 objectForKeyedSubscript:off_1000637F8];
    unsigned __int8 v15 = [v10 objectForKeyedSubscript:off_100063808];
    long long v50 = [v10 objectForKeyedSubscript:off_100063810];
    long long v51 = [v10 objectForKeyedSubscript:off_100063818];
    long long v49 = [v10 objectForKeyedSubscript:off_100063820];
    __int16 v16 = [v10 objectForKeyedSubscript:off_100063828];

    long long v48 = (void *)v14;
    if (!v11)
    {
      unsigned int v20 = sub_100027DEC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v56 = "handleSentryTailspinRequest";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: reportRef is nil, this is REALLY bad", buf, 0xCu);
      }

      BOOL v8 = sub_10001B7CC(0, @"reportRef is nil, this is REALLY bad");
      v79 = off_100063848;
      v80 = v8;
      CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      goto LABEL_56;
    }
    long long v47 = v13;
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          if (v16)
          {
            id v17 = 0;
            int v18 = 0;
            dispatch_time_t v19 = 0;
LABEL_28:
            unsigned int v28 = [v16 isEqualToString:off_100063830];
            if (!v28 || v15)
            {
              if (v51) {
                unsigned int v32 = 0;
              }
              else {
                unsigned int v32 = v28;
              }
              if (v32 == 1)
              {
                id v33 = sub_100027DEC();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 136315138;
                  id v56 = "handleSentryTailspinRequest";
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: duration is nil for App launch request type", buf, 0xCu);
                }

                BOOL v8 = sub_10001B7CC(0, @"duration is nil for App launch request type");

                v67[0] = off_1000637E8;
                v67[1] = off_100063848;
                v68[0] = v11;
                v68[1] = v8;
                unsigned int v30 = v68;
                unsigned int v31 = v67;
              }
              else
              {
                if (v50) {
                  unsigned int v34 = 0;
                }
                else {
                  unsigned int v34 = v28;
                }
                if (v34 == 1)
                {
                  id v35 = sub_100027DEC();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 136315138;
                    id v56 = "handleSentryTailspinRequest";
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: reason is nil for App launch request type", buf, 0xCu);
                  }

                  BOOL v8 = sub_10001B7CC(0, @"reason is nil for App launch request type");

                  v65[0] = off_1000637E8;
                  v65[1] = off_100063848;
                  v66[0] = v11;
                  v66[1] = v8;
                  unsigned int v30 = v66;
                  unsigned int v31 = v65;
                }
                else
                {
                  if (v49) {
                    unsigned int v36 = 0;
                  }
                  else {
                    unsigned int v36 = v28;
                  }
                  if (v36 != 1)
                  {
                    if (!v18)
                    {
                      if (v28)
                      {
                        v61[0] = off_1000637E8;
                        v61[1] = off_100063810;
                        v62[0] = v11;
                        v62[1] = v50;
                        v61[2] = @"PID";
                        v61[3] = @"StartTime";
                        unsigned int v13 = v47;
                        v62[2] = v15;
                        v62[3] = v47;
                        v62[4] = v48;
                        v61[4] = @"EndTime";
                        v61[5] = off_100063840;
                        id v41 = +[NSUUID UUID];
                        uint64_t v42 = [v41 UUIDString];
                        v61[6] = off_100063828;
                        v62[5] = v42;
                        void v62[6] = off_100063830;
                        id v43 = (void *)v42;
                        uint64_t v39 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:7];
                      }
                      else
                      {
                        v59[0] = off_1000637E8;
                        v59[1] = off_100063828;
                        v60[0] = v11;
                        v60[1] = off_100063838;
                        uint64_t v39 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
                        unsigned int v13 = v47;
                      }
                      id v44 = sub_100027DEC();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
                        sub_100031278(v13, v48, v44);
                      }

                      long long v52 = v19;
                      [HTTailspin saveSentryTailspin:v12 infoDict:v39 startTime:[v13 unsignedLongLongValue] endTime:[v48 unsignedLongLongValue] error:&v52];
                      BOOL v8 = v52;

                      if (!v8) {
                        goto LABEL_60;
                      }
                      long long v45 = sub_100027DEC();
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v46 = [v8 localizedDescription];
                        *(_DWORD *)long long buf = 136315394;
                        id v56 = "handleSentryTailspinRequest";
                        __int16 v57 = 2112;
                        id v58 = v46;
                        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
                      }
                      v53[0] = off_1000637E8;
                      v53[1] = off_100063848;
                      v54[0] = v11;
                      v54[1] = v8;
                      CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];

                      id v38 = sub_100027DEC();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 136315138;
                        id v56 = "handleSentryTailspinRequest";
                        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s: Posting notification to Sentry due to failure to dump tailspin", buf, 0xCu);
                      }
LABEL_59:

                      LocalCenter = CFNotificationCenterGetLocalCenter();
                      CFNotificationCenterPostNotification(LocalCenter, off_1000637E0, 0, v21, 1u);
                      id v17 = v21;
LABEL_60:

                      goto LABEL_61;
                    }
                    BOOL v8 = v19;
                    CFDictionaryRef v21 = (const __CFDictionary *)v17;
                    goto LABEL_55;
                  }
                  id v37 = sub_100027DEC();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 136315138;
                    id v56 = "handleSentryTailspinRequest";
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: threshold is nil for App launch request type", buf, 0xCu);
                  }

                  BOOL v8 = sub_10001B7CC(0, @"threshold is nil for App launch request type");

                  v63[0] = off_1000637E8;
                  v63[1] = off_100063848;
                  v64[0] = v11;
                  v64[1] = v8;
                  unsigned int v30 = v64;
                  unsigned int v31 = v63;
                }
              }
            }
            else
            {
              id v29 = sub_100027DEC();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                id v56 = "handleSentryTailspinRequest";
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: pid is nil for App launch request type", buf, 0xCu);
              }

              BOOL v8 = sub_10001B7CC(0, @"pid is nil for App launch request type");

              v69[0] = off_1000637E8;
              v69[1] = off_100063848;
              v70[0] = v11;
              v70[1] = v8;
              unsigned int v30 = v70;
              unsigned int v31 = v69;
            }
            CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:2];

LABEL_55:
            unsigned int v13 = v47;
LABEL_56:
            id v38 = sub_100027DEC();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315138;
              id v56 = "handleSentryTailspinRequest";
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: infoDict does not contain all necessary info, posting failure notification", buf, 0xCu);
            }
            uint64_t v39 = 0;
            goto LABEL_59;
          }
          CFStringRef v27 = sub_100027DEC();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            id v56 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: reportType is nil", buf, 0xCu);
          }

          dispatch_time_t v19 = sub_10001B7CC(0, @"reportType is nil");
          v71[0] = off_1000637E8;
          v71[1] = off_100063848;
          v72[0] = v11;
          v72[1] = v19;
          BOOL v23 = v72;
          unsigned int v24 = v71;
        }
        else
        {
          uint32_t v26 = sub_100027DEC();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            id v56 = "handleSentryTailspinRequest";
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: endTime is nil", buf, 0xCu);
          }

          dispatch_time_t v19 = sub_10001B7CC(0, @"endTime is nil");
          v73[0] = off_1000637E8;
          v73[1] = off_100063848;
          v74[0] = v11;
          v74[1] = v19;
          BOOL v23 = v74;
          unsigned int v24 = v73;
        }
      }
      else
      {
        v25 = sub_100027DEC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v56 = "handleSentryTailspinRequest";
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: startTime is nil", buf, 0xCu);
        }

        dispatch_time_t v19 = sub_10001B7CC(0, @"startTime is nil");
        v75[0] = off_1000637E8;
        v75[1] = off_100063848;
        v76[0] = v11;
        v76[1] = v19;
        BOOL v23 = v76;
        unsigned int v24 = v75;
      }
    }
    else
    {
      unsigned int v22 = sub_100027DEC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v56 = "handleSentryTailspinRequest";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: fileName is nil", buf, 0xCu);
      }

      dispatch_time_t v19 = sub_10001B7CC(0, @"fileName is nil");
      v77[0] = off_1000637E8;
      v77[1] = off_100063848;
      v78[0] = v11;
      v78[1] = v19;
      BOOL v23 = v78;
      unsigned int v24 = v77;
    }
    id v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:2];
    int v18 = 1;
    goto LABEL_28;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v56 = "handleSentryTailspinRequest";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: notification is not a Sentry problem detected notification, returning early", buf, 0xCu);
  }
LABEL_61:
}

void start()
{
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.hangtracer", v1);
  id v3 = (void *)qword_100064560;
  qword_100064560 = (uint64_t)v2;

  int v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.hangtracer.hud.timer", v4);
  unsigned __int8 v6 = (void *)qword_100064568;
  qword_100064568 = (uint64_t)v5;

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_100064560, &stru_100050F98);
  sub_100009A0C(0);
  uint64_t v7 = 0;
  while (1)
  {
    memset(&v33, 0, sizeof(v33));
    BOOL v8 = off_100051100[v7];
    if (!stat(v8, &v33))
    {
      if ((v33.st_mode & 0xF000) == 0x4000) {
        goto LABEL_10;
      }
      if (unlink(v8) < 0)
      {
        unsigned int v13 = sub_100027DEC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          unsigned int v30 = v8;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to remove previous non-directory at %s", buf, 0xCu);
        }
      }
    }
    os_log_type_t v9 = sub_100027DEC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Create log directory: %s", buf, 0xCu);
    }

    if (mkdir(v8, 0x1EDu))
    {
      id v10 = sub_100027DEC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = __error();
        BOOL v12 = strerror(*v11);
        *(_DWORD *)long long buf = 136315394;
        unsigned int v30 = v8;
        __int16 v31 = 2080;
        unsigned int v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot create spool directory - %s failed with %s - continuing anyway.", buf, 0x16u);
      }
    }
LABEL_10:
    if (++v7 == 3)
    {
      uint64_t v14 = objc_alloc_init(HTPrefsObserver_hangtracerd);
      unsigned __int8 v15 = (void *)qword_1000639D0;
      qword_1000639D0 = (uint64_t)v14;

      __int16 v16 = +[HTPrefs sharedPrefs];
      uint64_t v17 = qword_1000639D0;
      int v18 = NSStringFromSelector("memoryLoggingIntervalSec");
      [v16 addObserver:v17 forKeyPath:v18 options:3 context:off_1000635A0];

      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)sub_100008730, @"com.apple.hangtracer.htprefs.refreshed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      unsigned int v20 = +[HTPrefs sharedPrefs];
      [v20 setupPrefsWithQueue:qword_100064560];

      id v21 = objc_alloc_init((Class)NSDateFormatter);
      unsigned int v22 = (void *)qword_100064558;
      qword_100064558 = (uint64_t)v21;

      [(id)qword_100064558 setDateFormat:@"yyyy-MM-dd-HHmmss.SSS"];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000B4BC;
      handler[3] = &unk_100050F38;
      BOOL v23 = xpc_connection_create_mach_service("com.apple.hangtracerd", (dispatch_queue_t)qword_100064560, 1uLL);
      void handler[4] = v23;
      xpc_connection_set_event_handler(v23, handler);
      xpc_connection_resume(v23);
      byte_1000639D9 = 1;
      unsigned int v24 = +[HTPrefs sharedPrefs];
      unsigned int v25 = [v24 shouldIncludeDisplayData];

      if (v25)
      {
        +[HTProcessInfo addDisplayStateChangeEvent:](HTProcessInfo, "addDisplayStateChangeEvent:", mach_absolute_time(), 0xFFFFFFFFLL);
        v33.st_dev = 0;
        notify_register_dispatch("com.apple.iokit.hid.displayStatus", &v33.st_dev, (dispatch_queue_t)qword_100064560, &stru_100050FD8);
      }
      uint32_t v26 = sub_100027DEC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v33.st_dev = 138412290;
        *(void *)&v33.st_mode = off_1000637D8;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Adding %@ notification observer", (uint8_t *)&v33, 0xCu);
      }

      CFStringRef v27 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(v27, 0, (CFNotificationCallback)sub_10000A368, off_1000637D8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      dispatch_main();
    }
  }
}

void sub_10000B3E8(id a1, OS_xpc_object *a2)
{
  dispatch_queue_t v2 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a2, _xpc_event_key_name)];
  id v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    dispatch_queue_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "hangtracerd: Received XPC Event via notifyd: notification name = %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B4BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v7 = sub_100027DEC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v17 = 67109120;
      *(_DWORD *)&v17[4] = xpc_connection_get_pid((xpc_connection_t)v3);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "XPC: Client started new connection: pid %d", v17, 8u);
    }

    BOOL v8 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v8, (dispatch_queue_t)qword_100064560);
    *(void *)uint64_t v17 = _NSConcreteStackBlock;
    *(void *)&v17[8] = 3221225472;
    *(void *)&v17[16] = sub_10000C658;
    int v18 = &unk_100050F38;
    dispatch_time_t v19 = v8;
    unsigned __int8 v6 = v8;
    xpc_connection_set_event_handler(v6, v17);
    xpc_connection_resume(v6);

    goto LABEL_8;
  }
  xpc_type_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (v3 == &_xpc_error_connection_invalid)
    {
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      id v10 = sub_100027DEC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v17 = 136315394;
        *(void *)&v17[4] = string;
        *(_WORD *)&v17[12] = 1024;
        *(_DWORD *)&v17[14] = pid;
        BOOL v12 = "xpc_error_connection_invalid %s - pid %d";
        unsigned int v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 18;
        goto LABEL_17;
      }
    }
    else
    {
      id v10 = sub_100027DEC();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v3 == &_xpc_error_connection_interrupted)
      {
        if (v11)
        {
          *(_DWORD *)uint64_t v17 = 136315138;
          *(void *)&v17[4] = string;
          BOOL v12 = "xpc_error_connection_interrupted: %s";
          unsigned int v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
          uint32_t v15 = 12;
          goto LABEL_17;
        }
      }
      else if (v11)
      {
        *(_DWORD *)uint64_t v17 = 134218242;
        *(void *)&v17[4] = v3;
        *(_WORD *)&v17[12] = 2080;
        *(void *)&v17[14] = string;
        BOOL v12 = "hangtracerd: Connection error: %p : %s";
        unsigned int v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, v17, v15);
      }
    }

    goto LABEL_19;
  }
  sub_100027DEC();
  unsigned __int8 v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v17 = 134217984;
    *(void *)&v17[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "hangtracerd: unknown event type : %p", v17, 0xCu);
  }
LABEL_8:

LABEL_19:
}

void sub_10000B7A8(id a1, int a2)
{
  uint64_t state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    uint64_t v2 = mach_absolute_time();
    +[HTProcessInfo addDisplayStateChangeEvent:](HTProcessInfo, "addDisplayStateChangeEvent:", v2, state64 != 0);
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109632;
      BOOL v6 = state64 == 0;
      __int16 v7 = 2048;
      uint64_t v8 = state64;
      __int16 v9 = 2048;
      uint64_t v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Display state changed %d -> %llu,  time: %llu", buf, 0x1Cu);
    }
  }
}

void sub_10000BA2C()
{
  if (qword_1000639F8)
  {
    v0 = +[HTPrefs sharedPrefs];
    dispatch_time_t v1 = dispatch_time(0, 1000000000 * [v0 memoryLoggingIntervalSec]);

    uint64_t v2 = qword_1000639F8;
    id v3 = +[HTPrefs sharedPrefs];
    dispatch_source_set_timer(v2, v1, 1000000000 * [v3 memoryLoggingIntervalSec], 0x3B9ACA00uLL);
  }
}

void sub_10000BB00(id a1)
{
  uint64_t v1 = mach_absolute_time();
  uint64_t v2 = +[HTPrefs sharedPrefs];
  int v3 = [v2 runLoopHangPerPeriodLogLimit];

  if (v3 >= 1)
  {
    int v4 = +[HTPrefs sharedPrefs];
    unint64_t v5 = (unint64_t)[v4 reportPeriodMATU];
    BOOL v6 = +[HTPrefs sharedPrefs];
    unint64_t v7 = v5 / (int)[v6 runLoopHangPerPeriodLogLimit];

    if (v1 - qword_100063A18 > v7)
    {
      +[HTTailspin refreshAppGeneratedLogsCount];
      qword_100063A18 = v1;
    }
  }
  if (qword_100063A20)
  {
    if (v1 - qword_100063A20 < 0x1E2CC310001) {
      goto LABEL_8;
    }
    +[HTTailspin resetLogCountsForDailyRollover];
  }
  qword_100063A20 = v1;
LABEL_8:
  if (v1 - qword_100063A28 >= 0x141DD76001)
  {
    uint64_t v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100031338();
    }

    qword_100063A28 = v1;
    __int16 v9 = +[NSDate date];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    BOOL v12 = +[HTPrefs sharedPrefs];
    [v12 eplTimeoutTimestampSec];
    double v14 = v13;

    if (v11 < v14) {
      goto LABEL_46;
    }
    uint64_t v42 = v9;
    uint32_t v15 = sub_100027DEC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PLDE failed to turn EPL off properly, turning off hangtracerd", buf, 2u);
    }
    uint64_t v43 = v1;

    __int16 v16 = +[RMECacheEnumerator getEPLProfilePath];
    if (v16)
    {
      uint64_t v17 = +[NSFileManager defaultManager];
      id v53 = 0;
      unsigned int v18 = [v17 removeItemAtPath:v16 error:&v53];
      id v19 = v53;

      unsigned int v20 = sub_100027DEC();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_DWORD *)long long buf = 138412290;
          v59 = v16;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deleted ReportMemoryException plist at %@", buf, 0xCu);
        }
      }
      else if (v21)
      {
        unsigned int v22 = [v19 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        v59 = v16;
        __int16 v60 = 2112;
        id v61 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to delete ReportMemoryException plist at %@ with error: %@", buf, 0x16u);
      }
    }

    BOOL v23 = sub_10002CEE4(@"com.apple.da", @"mobile", @"HTEPL");
    id v41 = sub_10002CEE4(@"com.apple.hangtracer", @"mobile", @"HTEPL");
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v23;
    id v24 = [obj countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v28 = *(const __CFString **)(*((void *)&v49 + 1) + 8 * i);
          id v29 = sub_100027DEC();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v56 = 138412290;
            CFStringRef v57 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removing OTA Key: %@", v56, 0xCu);
          }

          CFPreferencesSetValue(v28, 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        }
        id v25 = [obj countByEnumeratingWithState:&v49 objects:buf count:16];
      }
      while (v25);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v30 = v41;
    id v31 = [v30 countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v46;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          CFStringRef v35 = *(const __CFString **)(*((void *)&v45 + 1) + 8 * (void)j);
          unsigned int v36 = sub_100027DEC();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unsigned int v54 = 138412290;
            CFStringRef v55 = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Removing HT Key: %@", v54, 0xCu);
          }

          CFPreferencesSetValue(v35, 0, @"com.apple.hangtracer", @"mobile", kCFPreferencesAnyHost);
        }
        id v32 = [v30 countByEnumeratingWithState:&v45 objects:v56 count:16];
      }
      while (v32);
    }

    int v37 = sub_100014FB8(0);
    id v38 = sub_100027DEC();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      uint64_t v1 = v43;
      if (v39)
      {
        *(_WORD *)unsigned int v54 = 0;
        id v40 = "Successfully reset tailspin to default system configuration";
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v40, v54, 2u);
      }
    }
    else
    {
      uint64_t v1 = v43;
      if (v39)
      {
        *(_WORD *)unsigned int v54 = 0;
        id v40 = "Failed to reset tailspin to default system configuration, tailspin will likely remain enabled on this device";
        goto LABEL_44;
      }
    }

    sub_10001BAA4(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/");
    sub_10001BDE4(0);
    notify_post(off_1000637A8[0]);
    notify_post(off_1000637A0[0]);

    __int16 v9 = v42;
LABEL_46:
  }
  +[HTProcessInfo checkForHangTimeouts:v1];
}

void sub_10000C164(id a1)
{
  uint64_t v1 = sub_100004D00();
  uint64_t v2 = sub_10000697C();
  v10[0] = v1;
  v10[1] = v2;
  int v3 = +[NSArray arrayWithObjects:v10 count:2];
  id v4 = +[HTUserNotificationHelper sharedHelperWithCategories:v3];
  unint64_t v5 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
  BOOL v6 = [v1 identifier];
  unint64_t v7 = sub_100004E70();
  [v5 associatePrefix:v6 withHandler:v7];

  uint64_t v8 = +[HTUserNotificationHelper sharedHelperWithCategories:0];
  __int16 v9 = [v2 identifier];
  [v8 associatePrefix:v9 withHandler:0];
}

void sub_10000C2B0(id a1)
{
  uint64_t v1 = mach_absolute_time();
  uint64_t v2 = +[HTPrefs sharedPrefs];
  int v3 = [v2 signpostMonitoringPerPeriodLogLimit];

  if (v3 >= 1)
  {
    id v4 = +[HTPrefs sharedPrefs];
    unint64_t v5 = (unint64_t)[v4 reportPeriodMATU];
    BOOL v6 = +[HTPrefs sharedPrefs];
    unint64_t v7 = v5 / (int)[v6 signpostMonitoringPerPeriodLogLimit];

    if (v1 - qword_100063A40 > v7)
    {
      +[HTTailspin refreshPerPeriodSentryLogCount];
      qword_100063A40 = v1;
    }
  }
  uint64_t v8 = qword_100063A48;
  if (!qword_100063A48)
  {
    qword_100063A48 = v1;
    uint64_t v8 = v1;
  }
  if (v1 - v8 >= 0x1E2CC310001)
  {
    +[HTTailspin resetDailySentryTailspinCounts];
    qword_100063A48 = v1;
  }
}

void sub_10000C3A0(id a1)
{
  uint64_t v1 = mach_absolute_time();
  +[HTProcessInfo checkForHUDTimeouts:v1];
  uint64_t v2 = +[HTPrefs sharedPrefs];
  unsigned int v3 = [v2 shouldDisplayFenceHangToHUD];

  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = qword_100063A50[v4 + 1];
      if (v5)
      {
        uint64_t v6 = qword_100063A50[v4 + 2];
        double v7 = sub_10002A984(v1);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
        if (v7 - sub_10002A984(v6) < 1000.0) {
          break;
        }
      }
LABEL_8:
      v4 += 3;
      if (v4 == 15) {
        goto LABEL_9;
      }
    }
    double v7 = sub_10002A984(v6);
LABEL_7:
    double v8 = sub_10002A984(v5);
    sub_100026CE8((uint64_t)"Fence Hang", v1, v5, v6, 0, 0, v7 - v8);
    goto LABEL_8;
  }
LABEL_9:

  sub_1000272D0();
}

BOOL sub_10000C4C0(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    __int16 v9 = v4;
    __int16 v10 = 2112;
    double v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

id sub_10000C594(uint64_t a1)
{
  v5[0] = @"DeletionSucceeded";
  uint64_t v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"FileSizeBytes";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

void sub_10000C658(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    double v7 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v8 = v3;
    int64_t pid = xpc_connection_get_pid(v7);
    if ((int)pid <= 0)
    {
      double v13 = sub_100027DEC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v152 = pid;
        id v24 = "%d is not a valid pid to watch";
        id v25 = v13;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 8;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, v27);
      }
      goto LABEL_43;
    }
    int64_t int64 = xpc_dictionary_get_int64(v8, "command");
    if (int64 == 2)
    {
      +[HTProcessInfo stopWatchingPid:pid];
LABEL_44:

      goto LABEL_45;
    }
    int64_t v11 = int64;
    if (int64 == 1)
    {
      BOOL v12 = xpc_dictionary_get_value(v8, "shmem");
      double v13 = v12;
      if (v12)
      {
        region[0] = 0;
        size_t v14 = xpc_shmem_map(v12, region);
        if (region[0])
        {
          size_t v15 = v14;
          if (v14)
          {
            string = xpc_dictionary_get_string(v8, "bundle-id");
            uint64_t v17 = +[HTProcessInfo startWatchingPid:pid sharedMem:region[0] length:v15 bundleID:string];
            if (v17)
            {
              unsigned int v18 = sub_100027DEC();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = xpc_dictionary_get_string(v8, "name");
                *(_DWORD *)long long buf = 138543618;
                *(void *)v152 = v17;
                *(_WORD *)&v152[8] = 2082;
                *(void *)&v152[10] = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initialization complete now watching hangs for %{public}@ | %{public}s", buf, 0x16u);
              }
            }
            if (byte_100063A38 == 1) {
              sub_1000034B8(pid, (uint64_t)string);
            }
            goto LABEL_42;
          }
        }
        region[0] = 0;
        uint64_t v17 = sub_100027DEC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          CFStringRef v35 = "Something wrong w/shmem";
          unsigned int v36 = v17;
          uint32_t v37 = 2;
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
        }
      }
      else
      {
        uint64_t v17 = sub_100027DEC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)v152 = pid;
          CFStringRef v35 = "Didn't get shmem from no longer watching %d";
LABEL_38:
          unsigned int v36 = v17;
          uint32_t v37 = 8;
          goto LABEL_41;
        }
      }
LABEL_42:

LABEL_43:
      goto LABEL_44;
    }
    switch(int64)
    {
      case 3:
        goto LABEL_82;
      case 4:
        double v13 = sub_100027DEC();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_WORD *)long long buf = 0;
        id v24 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
        goto LABEL_51;
      case 5:
        double v13 = sub_100027DEC();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_WORD *)long long buf = 0;
        id v24 = "HTActivationStats: Received an app activation event but hangtracerd was compiled without app activation logging";
LABEL_51:
        id v25 = v13;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 2;
        goto LABEL_24;
      case 6:
        id v38 = sub_100027DEC();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_10003136C();
        }

        uint64_t int64 = xpc_dictionary_get_uint64(v8, "name");
        uint64_t v40 = xpc_dictionary_get_uint64(v8, "startTime");
        uint64_t v41 = v40;
        int v42 = dword_100063AC8 % 5;
        if ((-858993459 * (dword_100063AC8 + 1) + 429496729) >= 0x33333333) {
          int v43 = dword_100063AC8 + 1;
        }
        else {
          int v43 = 0;
        }
        dword_100063AC8 = v43;
        id v44 = &qword_100063A50[3 * v42];
        uint64_t *v44 = uint64;
        v44[1] = v40;
        v44[2] = 0x7FFFFFFFFFFFFFFFLL;
        dword_100063ACC = v42;
        long long v45 = sub_100027DEC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134218496;
          *(void *)v152 = uint64;
          *(_WORD *)&v152[8] = 2048;
          *(void *)&v152[10] = v41;
          *(_WORD *)&v152[18] = 1024;
          *(_DWORD *)&v152[20] = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "saveFenceStartTime: name=%llu, start=%llu, arr_index=%d", buf, 0x1Cu);
        }

        goto LABEL_44;
      case 7:
        long long v46 = sub_100027DEC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          sub_1000313A0();
        }

        uint64_t v47 = xpc_dictionary_get_uint64(v8, "name");
        uint64_t v48 = xpc_dictionary_get_uint64(v8, "endTime");
        sub_10000DAAC(v47, v48);
        goto LABEL_44;
      case 8:
      case 10:
        uint64_t v29 = xpc_dictionary_get_uint64(v8, "name");
        uint64_t v30 = xpc_dictionary_get_uint64(v8, "startTime");
        uint64_t v31 = xpc_dictionary_get_uint64(v8, "endTime");
        id v32 = sub_100027DEC();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v11 == 10)
        {
          if (v33)
          {
            *(_DWORD *)long long buf = 134218496;
            *(void *)v152 = v29;
            *(_WORD *)&v152[8] = 2048;
            *(void *)&v152[10] = v30;
            *(_WORD *)&v152[18] = 2048;
            *(void *)&v152[20] = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Got CA Fence Blown message (fenceName:%llu, startTime:%llu, endTime:%llu)", buf, 0x20u);
          }

          uint64_t v137 = v29;
          uint64_t v34 = 5;
        }
        else
        {
          if (v33)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "HTFenceTracking: Fence blown", buf, 2u);
          }

          sub_10000DAAC(v29, v31);
          uint64_t v137 = 0;
          uint64_t v34 = 4;
        }
        char v75 = +[HTPrefs sharedPrefs];
        LOWORD(v121) = 0;
        +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:](HTProcessInfo, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:", @"Fence-hang", v30 - 12000000, v31 + 12000000, v31, v137, [v75 htTailspinEnabled], v34, v121);

        goto LABEL_44;
      case 11:
        long long v49 = xpc_connection_copy_entitlement_value();
        double v13 = v49;
        if (v49 && xpc_get_type(v49) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v13))
        {
          uint64_t v17 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "archiveSaveDirectory")];
          xpc_dictionary_get_BOOL(v8, "archiveCompressionBypass");
          long long v50 = sub_100027DEC();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
            sub_1000313D4((uint64_t)v17, v50);
          }

          if (v17 && (sub_10001A1D0() & 1) != 0) {
            goto LABEL_42;
          }
          long long v51 = sub_100027DEC();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v152 = v17;
            long long v52 = "HT command HANGTRACER_XPC_CMD_COLLECT_LOGS failed to save the archive in directory %@";
            id v53 = v51;
            uint32_t v54 = 12;
LABEL_107:
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
          }
        }
        else
        {
          uint64_t v17 = sub_10000DC28(pid);
          long long v51 = sub_100027DEC();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543874;
            *(void *)v152 = v17;
            *(_WORD *)&v152[8] = 1024;
            *(_DWORD *)&v152[10] = pid;
            *(_WORD *)&v152[14] = 2080;
            *(void *)&v152[16] = "com.apple.hangtracer.collect-logs";
            long long v52 = "client %{public}@ [%d] does not bear entitlement \"%s\"; refusing HANGTRACER_XPC_CMD_COLLECT_LOGS command";
            id v53 = v51;
            uint32_t v54 = 28;
            goto LABEL_107;
          }
        }

        goto LABEL_42;
      case 12:
        CFStringRef v55 = (void *)xpc_connection_copy_entitlement_value();
        id v56 = v55;
        if (!v55 || xpc_get_type(v55) != (xpc_type_t)&_xpc_type_BOOL)
        {
          CFStringRef v57 = sub_10000DC28(pid);
          goto LABEL_77;
        }
        BOOL value = xpc_BOOL_get_value(v56);
        uint64_t v78 = sub_10000DC28(pid);
        CFStringRef v57 = v78;
        if (!value)
        {
LABEL_77:
          id v58 = sub_100027DEC();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543874;
            *(void *)v152 = v57;
            *(_WORD *)&v152[8] = 1024;
            *(_DWORD *)&v152[10] = pid;
            *(_WORD *)&v152[14] = 2080;
            *(void *)&v152[16] = "com.apple.hangtracer.logs-processed";
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "client %{public}@ [%d] does not bear entitlement \"%s\"; refusing HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED command",
              buf,
              0x1Cu);
          }

LABEL_80:
          goto LABEL_44;
        }
        if ([v78 isEqualToString:@"hangreporter"])
        {
          size_t length = 0;
          data = xpc_dictionary_get_data(v8, "hangLogInfo", &length);
          if (data)
          {
            if (length)
            {
              uint64_t v80 = +[NSData dataWithBytesNoCopy:data length:length freeWhenDone:0];
              if (v80)
              {
                id v81 = v80;
                id v82 = objc_alloc((Class)NSSet);
                v153[0] = objc_opt_class();
                v153[1] = objc_opt_class();
                v153[2] = objc_opt_class();
                v153[3] = objc_opt_class();
                uint64_t v83 = +[NSArray arrayWithObjects:v153 count:4];
                id v84 = [v82 initWithArray:v83];

                id v145 = 0;
                id v135 = v84;
                uint64_t v85 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v84 fromData:v81 error:&v145];
                id v86 = v145;
                v87 = sub_100027DEC();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
                  sub_10003144C(v85, (uint64_t)v86, v87);
                }
                __int16 v129 = v57;
                v131 = v56;

                id v88 = (void *)v85;
                v133 = v86;
                if (!v85 || v86)
                {
                  v100 = v135;
                  v101 = v81;
                  id v105 = sub_100027DEC();
                  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)v152 = v86;
                    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to unarchive the data dictionary with error: %@", buf, 0xCu);
                  }
                  goto LABEL_152;
                }
                long long v143 = 0u;
                long long v144 = 0u;
                *(_OWORD *)region = 0u;
                long long v142 = 0u;
                v89 = (char *)[&off_1000594F0 countByEnumeratingWithState:region objects:buf count:16];
                v90 = v135;
                if (v89)
                {
                  v91 = v89;
                  v127 = v81;
                  uint64_t v92 = *(void *)v142;
                  char v93 = 1;
                  do
                  {
                    for (i = 0; i != v91; ++i)
                    {
                      if (*(void *)v142 != v92) {
                        objc_enumerationMutation(&off_1000594F0);
                      }
                      v95 = (void *)*((void *)region[1] + i);
                      v96 = [v88 objectForKey:v95];

                      if (!v96)
                      {
                        v97 = sub_100027DEC();
                        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v147 = 138412290;
                          v148 = v95;
                          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED dictionary will not post a notification due to missing key: %@", v147, 0xCu);
                        }

                        char v93 = 0;
                      }
                    }
                    v91 = (char *)[&off_1000594F0 countByEnumeratingWithState:region objects:buf count:16];
                  }
                  while (v91);
                  id v81 = v127;
                  v90 = v135;
                  if ((v93 & 1) == 0) {
                    goto LABEL_153;
                  }
                }
                v98 = [v88 objectForKeyedSubscript:@"displayedInHUD"];
                unsigned int v99 = [v98 BOOLValue];

                if (!v99) {
                  goto LABEL_153;
                }
                v100 = v90;
                v101 = v81;
                v102 = [v88 objectForKeyedSubscript:@"startWallTime"];
                [v102 doubleValue];
                double v104 = v103;

                id v105 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v104];
                v106 = [v88 objectForKeyedSubscript:@"durationMS"];
                [v106 doubleValue];
                double v108 = v107;

                v139 = [v88 objectForKeyedSubscript:@"processPath"];
                sub_10001B718(v139);
                uint64_t v128 = v140 = 0;
                id v136 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v128 allowPlaceholder:0 error:&v140];
                id v125 = v140;
                if (v125)
                {
                  unsigned __int8 v109 = sub_100027DEC();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v147 = 138543618;
                    v148 = v128;
                    __int16 v149 = 2112;
                    id v150 = v125;
                    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Unable to create an LS application record from bundle id %{public}@: %@", v147, 0x16u);
                  }

                  uint64_t v110 = [v139 lastPathComponent];
                }
                else
                {
                  v115 = +[HTPrefs sharedPrefs];
                  v116 = [v115 thirdPartyDevPreferredLanguages];
                  id v117 = [v116 count];

                  if (v117)
                  {
                    v118 = +[HTPrefs sharedPrefs];
                    v119 = [v118 thirdPartyDevPreferredLanguages];
                    v111 = [v136 localizedNameWithPreferredLocalizations:v119];

                    goto LABEL_151;
                  }
                  uint64_t v110 = [v136 localizedName];
                }
                v111 = (void *)v110;
LABEL_151:
                v120 = [v88 objectForKeyedSubscript:@"hangUUID"];
                sub_1000069A0(v111, v120, v108);

LABEL_152:
                id v81 = v101;
                v90 = v100;
LABEL_153:

                id v56 = v131;
                CFStringRef v57 = v129;
                goto LABEL_154;
              }
            }
          }
          id v81 = sub_100027DEC();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            v112 = "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED failed to retrieve the hang log info NSData";
            unsigned __int8 v113 = v81;
            uint32_t v114 = 2;
            goto LABEL_146;
          }
        }
        else
        {
          id v81 = sub_100027DEC();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            *(void *)v152 = v57;
            *(_WORD *)&v152[8] = 1024;
            *(_DWORD *)&v152[10] = pid;
            v112 = "client %{public}@ [%d] is not expected to issue this command; refusing HANGTRACER_XPC_CMD_HANG_LOGS_P"
                   "ROCESSED command";
            unsigned __int8 v113 = v81;
            uint32_t v114 = 18;
LABEL_146:
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, v112, buf, v114);
          }
        }
LABEL_154:

        goto LABEL_80;
      case 13:
        int64_t pid = xpc_dictionary_get_int64(v8, "pid");
LABEL_82:
        double v13 = +[HTProcessInfo processForPid:pid];
        if (v13)
        {
          unint64_t v59 = xpc_dictionary_get_int64(v8, "startTime");
          unint64_t v60 = xpc_dictionary_get_int64(v8, "endTime");
          int64_t v124 = xpc_dictionary_get_int64(v8, "threadID");
          v122 = xpc_dictionary_get_string(v8, "name");
          BOOL v134 = xpc_dictionary_get_BOOL(v8, "saveReport");
          uint64_t v123 = (int)xpc_dictionary_get_int64(v8, "hangSubtype");
          BOOL v130 = xpc_dictionary_get_BOOL(v8, "saveMicroHang");
          region[0] = 0;
          id v61 = xpc_dictionary_get_data(v8, "userActionData", (size_t *)region);
          uint64_t v62 = 0;
          if (v11 == 3)
          {
            uint64_t v62 = 0;
            if (v61)
            {
              if (region[0])
              {
                uint64_t v62 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
              }
            }
          }
          v132 = (void *)v62;
          v138 = v13;
          uint64_t v63 = 0;
          unint64_t v64 = 0;
          id v65 = (unint64_t *)&unk_100063A60;
          do
          {
            unint64_t v66 = *(v65 - 1);
            unint64_t v67 = *v65;
            if (v66 <= v59) {
              unint64_t v66 = v59;
            }
            if (v67 >= v60) {
              unint64_t v67 = v60;
            }
            unint64_t v68 = v67 - v66;
            if (v67 > v66)
            {
              double v69 = sub_10002A984(v67 - v66);
              dispatch_time_t v70 = sub_100027DEC();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v126 = *(v65 - 2);
                double v71 = sub_10002A984(v68);
                *(_DWORD *)long long buf = 67109632;
                *(_DWORD *)v152 = v63;
                *(_WORD *)&v152[4] = 2048;
                *(void *)&v152[6] = v126;
                *(_WORD *)&v152[14] = 2048;
                *(double *)&v152[16] = v71;
                _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "CheckForFence: fenceIdx=%i, fenceName= %llu, overlap = %f ", buf, 0x1Cu);
              }
              unint64_t v64 = (unint64_t)(v69 + (double)v64);
            }
            v65 += 3;
            ++v63;
          }
          while (v63 != 5);
          unsigned __int8 v72 = sub_100027DEC();
          BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_INFO);
          double v13 = v138;
          if (v64 <= 0x190)
          {
            if (v73)
            {
              *(_DWORD *)long long buf = 134217984;
              *(void *)v152 = v64;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "CheckForFence: total fence overlap time = %llu ms, not fence-hang", buf, 0xCu);
            }

            uint64_t v76 = +[NSString stringWithUTF8String:v122];
            BYTE1(v121) = v130;
            LOBYTE(v121) = [v138 isThirdPartyDevSupportModeHang];
            uint64_t v74 = v132;
            -[NSObject recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:](v138, "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:", v76, v124, v59, v60, v134, v123, v132, v121);
          }
          else
          {
            if (v73)
            {
              *(_DWORD *)long long buf = 134217984;
              *(void *)v152 = v64;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "CheckForFence: total fence overlap time = %llu ms => treating as Fence-hang", buf, 0xCu);
            }

            BYTE1(v121) = v130;
            LOBYTE(v121) = [v138 isThirdPartyDevSupportModeHang];
            +[HTProcessInfo recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:](HTProcessInfo, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:", @"Fence-hang", v59 - 12000000, v60 + 12000000, v60, 0, v134, 3, v121);
            uint64_t v74 = v132;
          }

          goto LABEL_43;
        }
        uint64_t v17 = sub_100027DEC();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v152 = pid;
        CFStringRef v35 = "Got hang detected message for a pid we're not monitoring: %d";
        goto LABEL_38;
      default:
        double v13 = sub_100027DEC();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        *(_DWORD *)long long buf = 134217984;
        *(void *)v152 = v8;
        id v24 = "Don't know how to handle %p";
        id v25 = v13;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 12;
        goto LABEL_24;
    }
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      pid_t v28 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      sub_100027DEC();
      double v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v152 = v28;
        BOOL v21 = "Client disconnected: %d";
        unsigned int v22 = v7;
        uint32_t v23 = 8;
        goto LABEL_35;
      }
    }
    else if (v3 == &_xpc_error_termination_imminent)
    {
      sub_100027DEC();
      double v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        BOOL v21 = "Termination imminent!";
        unsigned int v22 = v7;
        uint32_t v23 = 2;
        goto LABEL_35;
      }
    }
    else
    {
      unsigned int v20 = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      sub_100027DEC();
      double v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)v152 = v20;
        BOOL v21 = "Unexpected error: %s";
        unsigned int v22 = v7;
        uint32_t v23 = 12;
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v5 = xpc_copy_description(v3);
  uint64_t v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)v152 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We got a non-dictionary event: %s", buf, 0xCu);
  }

  free(v5);
LABEL_46:
}

void sub_10000DAAC(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = dword_100063ACC;
  if (qword_100063A50[3 * dword_100063ACC] != a1)
  {
    uint64_t v5 = 0;
    unsigned int v4 = -1;
    uint64_t v6 = qword_100063A50;
    do
    {
      uint64_t v7 = *v6;
      v6 += 3;
      if (v7 == a1) {
        unsigned int v4 = v5;
      }
      ++v5;
    }
    while (v5 != 5);
  }
  if ((v4 & 0x80000000) != 0)
  {
    id v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = a1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HTFenceTracking: Fence end, failed to find corresponding fence(%llu)", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    qword_100063A50[3 * v4 + 2] = a2;
  }
  __int16 v9 = sub_100027DEC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218496;
    uint64_t v11 = a1;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "saveFenceEndTime: name=%llu, end=%llu, arr_index=%d", (uint8_t *)&v10, 0x1Cu);
  }
}

id sub_10000DC28(int a1)
{
  proc_name(a1, buffer, 0x20u);
  uint64_t v1 = +[NSString stringWithUTF8String:buffer];

  return v1;
}

void sub_10000DCA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

__CFString *sub_10000DF84(unint64_t a1)
{
  if (a1 > 3)
  {
    uint64_t v2 = @"Unknown";
  }
  else
  {
    uint64_t v2 = *(&off_1000511C8)[a1];
  }
  return v2;
}

id sub_10000DFDC(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_10001C628(a1);
  uint64_t v6 = sub_10001C628(a2);
  uint64_t v7 = sub_10000DF84(a3);
  id v8 = +[NSString stringWithFormat:@"%@.%@.%@", v5, v6, v7];

  return v8;
}

double sub_10000E084(unint64_t a1, unint64_t a2)
{
  if (a1 >= a2)
  {
    unint64_t v6 = a1 - a2;
    return sub_10002A984(v6);
  }
  else
  {
    double v3 = -sub_10002A984(a2 - a1);
    unsigned int v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000314D4(v4, v3);
    }

    return v3;
  }
}

void sub_10000E100(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v6 = MonitoredStates;
  qword_100063AD8 = (qword_100063AD8 + 1) % 0xAuLL;
  uint64_t v7 = (unint64_t *)((char *)&unk_100063AE0 + 32 * qword_100063AD8);
  *uint64_t v7 = a1;
  v7[1] = a2;
  void v7[2] = a3;
  void v7[3] = a4;
  sub_10001C628(a1);
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = sub_100027DEC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138413058;
    uint64_t v76 = v8;
    __int16 v77 = 2048;
    CFStringRef v78 = (const __CFString *)a2;
    __int16 v79 = 2048;
    CFStringRef v80 = (const __CFString *)a3;
    __int16 v81 = 2048;
    *(void *)id v82 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "reportTailspinRequestStats( type=%@, start=%llu, end=%llu, tailspin=%llu)", buf, 0x2Au);
  }

  +[NSString stringWithFormat:@"%@.%@", off_1000635A8, @"Tailspin_Requests"];
  j__ADClientAddValueForScalarKey();
  int v10 = sub_100027DEC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100031614(v10);
  }

  uint64_t v11 = off_1000635A8;
  __int16 v12 = sub_10001C628(a1);
  +[NSString stringWithFormat:@"%@.%@.%@", v11, @"Tailspin_Requests_By_Type", v12];
  j__ADClientAddValueForScalarKey();

  uint64_t v13 = sub_100027DEC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100031550(a1, v13);
  }

  __int16 v14 = off_1000635A8;
  unsigned int v15 = sub_10001C628(a1);
  +[NSString stringWithFormat:@"%@.%@.%@", v14, @"EndTime_To_TailspinTime", v15];
  sub_10000E084(a4, a3);
  j__ADClientPushValueForDistributionKey();

  __int16 v16 = sub_100027DEC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v65 = off_1000635A8;
    sub_10001C628(a1);
    unint64_t v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v67 = sub_10000E084(a4, a3);
    *(_DWORD *)long long buf = 138413058;
    uint64_t v76 = v65;
    __int16 v77 = 2112;
    CFStringRef v78 = v66;
    __int16 v79 = 2112;
    CFStringRef v80 = @"EndTime_To_TailspinTime";
    __int16 v81 = 2048;
    *(double *)id v82 = v67;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@.%@.%@ value=%f", buf, 0x2Au);
  }
  unint64_t v68 = a1;
  AnalyticsSendEventLazy();
  uint64_t v17 = 0;
  do
  {
    unsigned int v18 = (unint64_t *)((char *)&unk_100063AE0 + 32 * (void)v17);
    unint64_t v19 = v18[1];
    unint64_t v20 = v18[2];
    unint64_t v72 = *v18;
    BOOL v21 = sub_10001C628(*v18);
    BOOL v22 = v6[69].cache == v17 || v19 == 0;
    if (!v22 && v20 != 0)
    {
      uint64_t v24 = 0;
      do
      {
        uint64_t v25 = dword_10003AFA8[v24];
        double v26 = (double)(1000 * (int)v25);
        if (sub_10000E084(a4, v20) >= v26) {
          break;
        }
        +[NSString stringWithFormat:@"%@.%@.%@%02i.%@.%@", off_1000635A8, @"Tailspin_Requests_End_Within_Threshold", @"Threshold=", v25, v21, v8];
        j__ADClientAddValueForScalarKey();
        uint32_t v27 = sub_100027DEC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138413570;
          uint64_t v76 = off_1000635A8;
          __int16 v77 = 2112;
          CFStringRef v78 = @"Tailspin_Requests_End_Within_Threshold";
          __int16 v79 = 2112;
          CFStringRef v80 = @"Threshold=";
          __int16 v81 = 1024;
          *(_DWORD *)id v82 = v25;
          *(_WORD *)&v82[4] = 2112;
          *(void *)&v82[6] = v21;
          *(_WORD *)&v82[14] = 2112;
          *(void *)&v82[16] = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
        }

        if (sub_10000E084(a4, v19) < v26)
        {
          +[NSString stringWithFormat:@"%@.%@.%@%02i.%@.%@", off_1000635A8, @"Tailspin_Requests_Start_Within_Threshold", @"Threshold=", v25, v21, v8];
          j__ADClientAddValueForScalarKey();
          pid_t v28 = sub_100027DEC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138413570;
            uint64_t v76 = off_1000635A8;
            __int16 v77 = 2112;
            CFStringRef v78 = @"Tailspin_Requests_Start_Within_Threshold";
            __int16 v79 = 2112;
            CFStringRef v80 = @"Threshold=";
            __int16 v81 = 1024;
            *(_DWORD *)id v82 = v25;
            *(_WORD *)&v82[4] = 2112;
            *(void *)&v82[6] = v21;
            *(_WORD *)&v82[14] = 2112;
            *(void *)&v82[16] = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@.%@.%@%02i.%@.%@", buf, 0x3Au);
          }
        }
        ++v24;
        id v73 = v21;
        uint64_t v74 = v8;
        AnalyticsSendEventLazy();
      }
      while (v24 != 5);
      unint64_t v29 = a3;
      unint64_t v6 = MonitoredStates;
      if (sub_10000E084(a3, v20) < 60000.0)
      {
        uint64_t v30 = 0;
        int v31 = 0;
        id v32 = &qword_100063AF0;
        do
        {
          if (v17 != v30 && *v32 > v20 && *v32 < a3) {
            ++v31;
          }
          ++v30;
          v32 += 4;
        }
        while (v30 != (char *)10);
        BOOL v34 = v19 < a2;
        BOOL v35 = v20 >= a2 && v19 < a2;
        if (v20 < a2) {
          BOOL v34 = 1;
        }
        BOOL v22 = !v34;
        uint64_t v36 = 2;
        if (!v22) {
          uint64_t v36 = v35;
        }
        if (v20 <= a3) {
          unint64_t v37 = v36;
        }
        else {
          unint64_t v37 = 3;
        }
        sub_10000DFDC(v68, v72, v37);
        double v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithFormat:@"%@.%@.%@", off_1000635A8, @"Overlap_Counts", v71];
        j__ADClientAddValueForScalarKey();
        id v38 = sub_100027DEC();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412802;
          uint64_t v76 = off_1000635A8;
          __int16 v77 = 2112;
          CFStringRef v78 = @"Overlap_Counts";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1", buf, 0x20u);
        }

        +[NSString stringWithFormat:@"%@.%@.%@", off_1000635A8, @"Intermediate_Hangs_For_Overlap_Type", v71];
        j__ADClientSetValueForScalarKey();
        BOOL v39 = sub_100027DEC();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138413058;
          uint64_t v76 = off_1000635A8;
          __int16 v77 = 2112;
          CFStringRef v78 = @"Intermediate_Hangs_For_Overlap_Type";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          __int16 v81 = 1024;
          *(_DWORD *)id v82 = v31;
          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@.%@.%@ == %i", buf, 0x26u);
        }

        +[NSString stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"All_Request_Intervals", v71, @"Intervals_S1toS2"];
        sub_10000E084(a2, v19);
        j__ADClientPushValueForDistributionKey();
        uint64_t v40 = sub_100027DEC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          long long v49 = off_1000635A8;
          double v50 = sub_10000E084(a2, v19);
          *(_DWORD *)long long buf = 138413314;
          uint64_t v76 = v49;
          unint64_t v29 = a3;
          __int16 v77 = 2112;
          CFStringRef v78 = @"All_Request_Intervals";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          __int16 v81 = 2112;
          *(void *)id v82 = @"Intervals_S1toS2";
          *(_WORD *)&v82[8] = 2048;
          *(double *)&v82[10] = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        +[NSString stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"All_Request_Intervals", v71, @"Intervals_S1toE2"];
        sub_10000E084(v29, v19);
        j__ADClientPushValueForDistributionKey();
        uint64_t v41 = sub_100027DEC();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          long long v51 = off_1000635A8;
          double v52 = sub_10000E084(a3, v19);
          *(_DWORD *)long long buf = 138413314;
          uint64_t v76 = v51;
          unint64_t v29 = a3;
          __int16 v77 = 2112;
          CFStringRef v78 = @"All_Request_Intervals";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          __int16 v81 = 2112;
          *(void *)id v82 = @"Intervals_S1toE2";
          *(_WORD *)&v82[8] = 2048;
          *(double *)&v82[10] = v52;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        +[NSString stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"All_Request_Intervals", v71, @"Intervals_E1toS2"];
        sub_10000E084(a2, v20);
        j__ADClientPushValueForDistributionKey();
        int v42 = sub_100027DEC();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          id v53 = off_1000635A8;
          double v54 = sub_10000E084(a2, v20);
          *(_DWORD *)long long buf = 138413314;
          uint64_t v76 = v53;
          unint64_t v29 = a3;
          __int16 v77 = 2112;
          CFStringRef v78 = @"All_Request_Intervals";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          __int16 v81 = 2112;
          *(void *)id v82 = @"Intervals_E1toS2";
          *(_WORD *)&v82[8] = 2048;
          *(double *)&v82[10] = v54;
          _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        +[NSString stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"All_Request_Intervals", v71, @"Intervals_E1toE2"];
        sub_10000E084(v29, v20);
        j__ADClientPushValueForDistributionKey();
        int v43 = sub_100027DEC();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v55 = off_1000635A8;
          double v56 = sub_10000E084(a3, v20);
          *(_DWORD *)long long buf = 138413314;
          uint64_t v76 = v55;
          __int16 v77 = 2112;
          CFStringRef v78 = @"All_Request_Intervals";
          __int16 v79 = 2112;
          CFStringRef v80 = v71;
          __int16 v81 = 2112;
          *(void *)id v82 = @"Intervals_E1toE2";
          *(_WORD *)&v82[8] = 2048;
          *(double *)&v82[10] = v56;
          _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
        }

        AnalyticsSendEventLazy();
        unint64_t v6 = MonitoredStates;
        if (!v31)
        {
          id v44 = &ADClientAddValueForScalarKey_ptr;
          +[NSString stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"Adjacent_Request_Intervals", v71, @"Intervals_S1toS2"];
          sub_10000E084(a2, v19);
          j__ADClientPushValueForDistributionKey();
          long long v45 = sub_100027DEC();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            CFStringRef v57 = off_1000635A8;
            double v58 = sub_10000E084(a2, v19);
            *(_DWORD *)long long buf = 138413314;
            uint64_t v76 = v57;
            id v44 = &ADClientAddValueForScalarKey_ptr;
            __int16 v77 = 2112;
            CFStringRef v78 = @"Adjacent_Request_Intervals";
            __int16 v79 = 2112;
            CFStringRef v80 = v71;
            __int16 v81 = 2112;
            *(void *)id v82 = @"Intervals_S1toS2";
            *(_WORD *)&v82[8] = 2048;
            *(double *)&v82[10] = v58;
            _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          [v44[291] stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"Adjacent_Request_Intervals", v71, @"Intervals_S1toE2"];
          sub_10000E084(a3, v19);
          j__ADClientPushValueForDistributionKey();
          long long v46 = sub_100027DEC();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v59 = off_1000635A8;
            double v60 = sub_10000E084(a3, v19);
            *(_DWORD *)long long buf = 138413314;
            uint64_t v76 = v59;
            id v44 = &ADClientAddValueForScalarKey_ptr;
            __int16 v77 = 2112;
            CFStringRef v78 = @"Adjacent_Request_Intervals";
            __int16 v79 = 2112;
            CFStringRef v80 = v71;
            __int16 v81 = 2112;
            *(void *)id v82 = @"Intervals_S1toE2";
            *(_WORD *)&v82[8] = 2048;
            *(double *)&v82[10] = v60;
            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          [v44[291] stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"Adjacent_Request_Intervals", v71, @"Intervals_E1toS2"];
          sub_10000E084(a2, v20);
          j__ADClientPushValueForDistributionKey();
          uint64_t v47 = sub_100027DEC();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            id v61 = off_1000635A8;
            double v62 = sub_10000E084(a2, v20);
            *(_DWORD *)long long buf = 138413314;
            uint64_t v76 = v61;
            id v44 = &ADClientAddValueForScalarKey_ptr;
            __int16 v77 = 2112;
            CFStringRef v78 = @"Adjacent_Request_Intervals";
            __int16 v79 = 2112;
            CFStringRef v80 = v71;
            __int16 v81 = 2112;
            *(void *)id v82 = @"Intervals_E1toS2";
            *(_WORD *)&v82[8] = 2048;
            *(double *)&v82[10] = v62;
            _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }

          [v44[291] stringWithFormat:@"%@.%@.%@.%@", off_1000635A8, @"Adjacent_Request_Intervals", v71, @"Intervals_E1toE2"];
          sub_10000E084(a3, v20);
          j__ADClientPushValueForDistributionKey();
          uint64_t v48 = sub_100027DEC();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v63 = off_1000635A8;
            double v64 = sub_10000E084(a3, v20);
            *(_DWORD *)long long buf = 138413314;
            uint64_t v76 = v63;
            __int16 v77 = 2112;
            CFStringRef v78 = @"Adjacent_Request_Intervals";
            __int16 v79 = 2112;
            CFStringRef v80 = v71;
            __int16 v81 = 2112;
            *(void *)id v82 = @"Intervals_E1toE2";
            *(_WORD *)&v82[8] = 2048;
            *(double *)&v82[10] = v64;
            _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%@.%@.%@.%@ value=%f", buf, 0x34u);
          }
        }
      }
    }

    uint64_t v17 = (char *)v17 + 1;
  }
  while (v17 != (void *)10);
}

id sub_10000F210(uint64_t a1)
{
  v7[0] = @"Type";
  uint64_t v2 = sub_10001C628(*(void *)(a1 + 32));
  v8[0] = v2;
  v7[1] = @"EndTime_To_TailspinTime";
  double v3 = +[NSNumber numberWithDouble:sub_10000E084(*(void *)(a1 + 56), *(void *)(a1 + 48))];
  v8[1] = v3;
  void v7[2] = @"Tailspin_Request_Denied";
  unsigned int v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  _DWORD v8[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id sub_10000F320(uint64_t a1)
{
  v9[0] = @"Threshold";
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v10[0] = v2;
  v10[1] = &__kCFBooleanTrue;
  v9[1] = @"EndWithinThreshold";
  v9[2] = @"BeginWithinThreshold";
  double v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  void v10[2] = v3;
  v10[3] = v4;
  v9[3] = @"RequestType";
  v9[4] = @"LatestRequestType";
  void v10[4] = v5;
  v9[5] = @"Tailspin_Request_Denied";
  unint64_t v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 53)];
  v10[5] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

id sub_10000F458(uint64_t a1)
{
  v13[0] = @"RequestType";
  uint64_t v2 = sub_10001C628(*(void *)(a1 + 32));
  v14[0] = v2;
  v13[1] = @"LatestRequestType";
  double v3 = sub_10001C628(*(void *)(a1 + 64));
  v14[1] = v3;
  v13[2] = @"OverlapType";
  uint64_t v4 = sub_10000DF84(*(void *)(a1 + 96));
  v14[2] = v4;
  uint64_t v5 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 104), @"RequestType", @"LatestRequestType", @"OverlapType", @"NumberRequestsBetween"];
  v14[3] = v5;
  v13[4] = @"Intervals_S1toS2";
  unint64_t v6 = +[NSNumber numberWithDouble:sub_10000E084(*(void *)(a1 + 72), *(void *)(a1 + 40))];
  v14[4] = v6;
  v13[5] = @"Intervals_S1toE2";
  uint64_t v7 = +[NSNumber numberWithDouble:sub_10000E084(*(void *)(a1 + 80), *(void *)(a1 + 40))];
  v14[5] = v7;
  v13[6] = @"Intervals_E1toS2";
  id v8 = +[NSNumber numberWithDouble:sub_10000E084(*(void *)(a1 + 72), *(void *)(a1 + 48))];
  v14[6] = v8;
  v13[7] = @"Intervals_E1toE2";
  uint64_t v9 = +[NSNumber numberWithDouble:sub_10000E084(*(void *)(a1 + 80), *(void *)(a1 + 48))];
  v14[7] = v9;
  v13[8] = @"Tailspin_Request_Denied";
  int v10 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
  v14[8] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:9];

  return v11;
}

void sub_10000F690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (qword_100063C20 != -1) {
    dispatch_once(&qword_100063C20, &stru_100051188);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F7BC;
  block[3] = &unk_1000511A8;
  void block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  block[7] = a4;
  char v12 = a5;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)qword_100063AD0, v10);
}

void sub_10000F77C(id a1)
{
  qword_100063AD0 = (uint64_t)dispatch_queue_create("HT_Tailspin_Request_Reporting_Queue", 0);

  _objc_release_x1();
}

void sub_10000F7BC(unint64_t *a1)
{
}

void sub_10000F7D0(double a1)
{
  if (!qword_100063C28)
  {
    dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100064560);
    double v3 = (void *)qword_100063C28;
    qword_100063C28 = (uint64_t)v2;

    dispatch_source_set_event_handler_f((dispatch_source_t)qword_100063C28, (dispatch_function_t)sub_10000F88C);
    dispatch_activate((dispatch_object_t)qword_100063C28);
  }
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a1 * 1000000.0));
  uint64_t v5 = qword_100063C28;

  dispatch_source_set_timer(v5, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

id sub_10000F88C()
{
  id v0 = +[HTHangInfo getHangWaitTimeout];
  if ((unint64_t)v1.n128_f64[0])
  {
    v1.n128_f64[0] = (double)(unint64_t)v1.n128_f64[0];
    return (id)sub_10000F7D0(v0, v1);
  }
  else
  {
    return +[HTTailspin collectTailspinAndUpdateTelemtry];
  }
}

void sub_10000FB48(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableArray);
  dispatch_source_t v2 = (void *)qword_100063C40;
  qword_100063C40 = (uint64_t)v1;

  qword_100063C30 = 0;
  qword_100063C50 = -1;
  qword_100063C58 = 0;
  double v3 = (void *)qword_100063C28;
  qword_100063C28 = 0;
}

void sub_1000108AC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

id sub_100010B24(uint64_t a1)
{
  if (a1 == 2) {
    +[HUDTheme darkModeTheme];
  }
  else {
  id v1 = +[HUDTheme lightModeTheme];
  }

  return v1;
}

void sub_100010F44(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  dispatch_source_t v2 = (void *)qword_100063C68;
  qword_100063C68 = (uint64_t)v1;

  double v3 = (void *)qword_100063C68;

  _[v3 setCountLimit:20];
}

void sub_100011504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011534(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadThemeColors];
}

void sub_100011574(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHUDLineWithId:@"some-id" content:*(void *)(a1 + 40) options:0];
  dispatch_source_t v2 = [*(id *)(a1 + 48) valueLayer];
  [v2 preferredFrameSize];
  [*(id *)(a1 + 32) setMinimumValueLayerWidth:];

  double v3 = *(void **)(a1 + 32);
  id v5 = [v3 hudLines];
  uint64_t v4 = [v5 objectForKeyedSubscript:@"some-id"];
  [v3 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

id sub_100011964(uint64_t a1)
{
  dispatch_source_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HangTracer HUD new orientation %@ → %@", buf, 0x16u);
  }
  sub_10002B4B0();
  id v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100011AB4;
  void v7[3] = &unk_100051280;
  v7[4] = v5;
  return [v5 performHUDUpdate:v7];
}

void sub_100011AB4(uint64_t a1)
{
  dispatch_source_t v2 = [*(id *)(a1 + 32) hudLines];
  id v5 = [v2 allKeys];

  [*(id *)(a1 + 32) layoutHUDLines:[v5 count] ids:v5];
  [*(id *)(a1 + 32) determineNewFrameForRootLayer:objc_msgSend(v5, "count") numberOfLines:v3, v4];
}

id sub_100011B5C(uint64_t a1)
{
  dispatch_source_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    double v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HangTracer HUD new bounds %@ → %@", buf, 0x16u);
  }
  sub_10002B4CC();
  [*(id *)(a1 + 40) setDisplayScaleDependentPropertiesOnLayers];
  id v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100011CB4;
  void v7[3] = &unk_100051280;
  v7[4] = v5;
  return [v5 performHUDUpdate:v7];
}

void sub_100011CB4(uint64_t a1)
{
  [*(id *)(a1 + 32) setSidePadding:0.0];
  [*(id *)(a1 + 32) setLastKnownMaxKeyLayerWidth:0.0];
  dispatch_source_t v2 = [*(id *)(a1 + 32) hudLines];
  double v3 = [v2 allKeys];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        __int16 v10 = [*(id *)(a1 + 32) hudLines:v14];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        sub_10002AE44();
        [v11 setFontSize:];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) layoutHUDLines:[v4 count] ids:v4];
  [*(id *)(a1 + 32) determineNewFrameForRootLayer:objc_msgSend(v4, "count") numberOfLines:v12, v13];
}

void sub_1000120A4(uint64_t a1)
{
  double v2 = -[HUDLine contentScaleForTexts]_0();
  CATransform3DMakeScale(&v7, v2, v2, v2);
  double v3 = [*(id *)(a1 + 32) rootLayer];
  CATransform3D v6 = v7;
  [v3 setTransform:&v6];

  id v4 = [*(id *)(a1 + 32) containerLayer];
  [v4 setShadowOffset:0.0, 10.0 / v2];

  id v5 = [*(id *)(a1 + 32) containerLayer];
  [v5 setShadowRadius:25.0 / v2];
}

void sub_1000124F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_10001251C(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  id v4 = a3;
  [(HUDLine *)v4 removeFromSuperlayer];
  [(HUDLine *)v4 nilifyCALayers];
}

void sub_100012560(uint64_t a1, uint64_t a2)
{
}

void sub_10001256C(uint64_t a1)
{
}

void sub_100012574(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_100012610;
    void v6[3] = &unk_100050D08;
    uint64_t v5 = *(void *)(a1 + 32);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void sub_100012610(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) containerLayer];

  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    double v3 = [*(id *)(a1 + 32) hudLines];
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_1000512E0];

    id v4 = [*(id *)(a1 + 32) hudLines];
    [v4 removeAllObjects];

    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v8 = [*(id *)(a1 + 32) containerLayer];
    [v8 setFrame:CGRectMake(CGRectZero.origin.x, y, width, height)];

    uint64_t v9 = [*(id *)(a1 + 32) rootLayer];
    [v9 setHidden:1];

    [*(id *)(a1 + 32) invalidate];
    __int16 v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_unlock(v10);
  }
  else
  {
    uint64_t v11 = sub_100027DEC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100031A24(v11);
    }
  }
}

void sub_10001274C(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  id v4 = a3;
  [(HUDLine *)v4 removeFromSuperlayer];
  [(HUDLine *)v4 nilifyCALayers];
}

void sub_1000129D8(uint64_t a1)
{
  double v2 = +[NSMutableArray array];
  double v3 = [*(id *)(a1 + 32) hudLines];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100012D68;
  v41[3] = &unk_100051330;
  id v42 = *(id *)(a1 + 40);
  id v43 = *(id *)(a1 + 48);
  id v4 = v2;
  id v44 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v41];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) hudLines:v37];
        double v12 = [v11 objectForKeyedSubscript:v10];
        [v12 removeFromSuperlayer];

        double v13 = [*(id *)(a1 + 32) hudLines];
        [v13 removeObjectForKey:v10];

        long long v14 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
        [v14 removeObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v7);
  }

  long long v15 = sub_100027DEC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100031A68(a1, v15, v16, v17, v18, v19, v20, v21);
  }

  BOOL v22 = [*(id *)(a1 + 32) containerLayer];
  [v22 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v23 = 0;
    do
    {
      uint64_t v24 = [[*(id *)(a1 + 48) objectAtIndexedSubscript:v23];
      uint64_t v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:v24];
      [*(id *)(a1 + 32) HangHUD_updater_latency_in_ms];
      uint64_t v27 = sub_10002B510(v25, *(void *)(a1 + 64), v26 + 50.0);
      if ([v25 timedOut]) {
        uint64_t v28 = v27 | 2;
      }
      else {
        uint64_t v28 = v27;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v24 content:v25 options:v28];

      ++v23;
      unint64_t v29 = *(void *)(a1 + 56);
    }
    while (v23 < v29);
  }
  else
  {
    unint64_t v29 = 0;
  }
  [*(id *)(a1 + 32) layoutHUDLines:v29 ids:*(void *)(a1 + 48) v37];
  [*(id *)(a1 + 32) determineNewFrameForRootLayer:*(int *)(a1 + 56)];
  uint64_t v30 = [*(id *)(a1 + 32) containerLayer];
  int v31 = [v30 sublayers];
  id v32 = [v31 count];

  if (v32)
  {
    BOOL v33 = [*(id *)(a1 + 32) rootLayer];
    [v33 setHidden:0];

    BOOL v34 = [*(id *)(a1 + 32) containerLayer];
    [v34 setHidden:0];

    BOOL v35 = [*(id *)(a1 + 32) containerLayer];
    LODWORD(v36) = 1.0;
    [v35 setOpacity:v36];
  }
}

void sub_100012D68(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [a1[4] objectForKeyedSubscript:];
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_100012DF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012FE0(uint64_t a1)
{
  double v2 = +[NSMutableArray array];
  uint64_t v3 = [*(id *)(a1 + 32) hudLines];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100013410;
  v48[3] = &unk_100051330;
  id v49 = *(id *)(a1 + 40);
  id v50 = *(id *)(a1 + 48);
  id v4 = v2;
  id v51 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v48];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v45;
    *(void *)&long long v7 = 138412290;
    long long v43 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        double v12 = [*(id *)(a1 + 32) hudLines:v43];
        double v13 = [v12 objectForKeyedSubscript:v11];
        [v13 removeFromSuperlayer];

        long long v14 = [*(id *)(a1 + 32) hudLines];
        long long v15 = [v14 objectForKeyedSubscript:v11];
        [v15 nilifyCALayers];

        uint64_t v16 = [*(id *)(a1 + 32) hudLines];
        [v16 removeObjectForKey:v11];

        uint64_t v17 = sub_100027DEC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v43;
          uint64_t v53 = v11;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removed hudLines item %@", buf, 0xCu);
        }

        uint64_t v18 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
        [v18 removeObject:v11];
      }
      id v8 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v8);
  }

  uint64_t v19 = sub_100027DEC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100031AD8(a1, v19, v20, v21, v22, v23, v24, v25);
  }

  double v26 = [*(id *)(a1 + 32) containerLayer];
  [v26 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v27];
      unint64_t v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:v28];
      [*(id *)(a1 + 32) HangHUD_updater_latency_in_ms];
      uint64_t v31 = [v29 isCurrent:*(void *)(a1 + 64) withHUDUpdateInterval:v30 + 50.0];
      if ([v29 isTimedOut]) {
        uint64_t v32 = v31 | 2;
      }
      else {
        uint64_t v32 = v31;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v28 content:v29 options:v32];

      ++v27;
      unint64_t v33 = *(void *)(a1 + 56);
    }
    while (v27 < v33);
  }
  else
  {
    unint64_t v33 = 0;
  }
  [*(id *)(a1 + 32) layoutHUDLines:v33 ids:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) determineNewFrameForRootLayer:*(int *)(a1 + 56)];
  BOOL v34 = [*(id *)(a1 + 32) containerLayer];
  BOOL v35 = [v34 sublayers];
  id v36 = [v35 count];

  if (v36)
  {
    long long v37 = [*(id *)(a1 + 32) rootLayer];
    [v37 setHidden:0];

    long long v38 = [*(id *)(a1 + 32) containerLayer];
    [v38 setHidden:0];

    [*(id *)(a1 + 32) HUD_background_opacity];
    float v40 = v39;
    uint64_t v41 = [*(id *)(a1 + 32) containerLayer];
    *(float *)&double v42 = v40;
    [v41 setOpacity:v42];
  }
}

void sub_100013410(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [a1[4] objectForKeyedSubscript:];
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_1000134A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100013D14(uint64_t a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  uint64_t v4 = [v20 keyLayer];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v20 keyLayer];
    [v6 preferredFrameSize];
    double v8 = v7;
    double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

    if (v8 > v9)
    {
      uint64_t v10 = [v20 keyLayer];
      [v10 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
    }
  }
  uint64_t v12 = [v20 valueLayer];
  if (v12)
  {
    double v13 = (void *)v12;
    long long v14 = [v20 valueLayer];
    [v14 preferredFrameSize];
    double v16 = v15;
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

    if (v16 > v17)
    {
      uint64_t v18 = [v20 valueLayer];
      [v18 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
    }
  }
}

void sub_100014060(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentTheme];
  id v3 = [v2 backgroundColor];
  uint64_t v4 = [*(id *)(a1 + 32) containerLayer];
  [v4 setBackgroundColor:v3];

  id v5 = [*(id *)(a1 + 32) hudLines];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014174;
  v9[3] = &unk_1000513D0;
  v9[4] = *(void *)(a1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = [*(id *)(a1 + 32) lastKnownHangs];

  if (v6)
  {
    double v7 = *(void **)(a1 + 32);
    double v8 = [v7 lastKnownHangs];
    [v7 updateHangs:v8 withCompletion:&stru_1000513F0];
  }
}

void sub_100014174(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) currentTheme];
    [v5 setCurrentTheme:v4];
  }
}

void sub_100014430(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100031B48((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
    [v10 removeObject:v2];
  }
}

void sub_100014554(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100031BB4((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
    [v10 addObject:v2];
  }
}

void sub_1000147D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000149CC(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v2 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v4 = CGColorCreateSRGB(0.921568627, 0.537254902, 0.0, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  uint64_t v6 = CGColorCreateSRGB(0.949019608, 0.219607843, 0.180392157, 1.0);
  CGColorRef v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  CGColorRef v8 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v9 = CGColorCreateSRGB(0.396078431, 0.396078431, 0.396078431, 1.0);
  uint64_t v10 = [[HUDTheme alloc] initWithPreviousHangTextColor:v3 currentHangTextColor:v2 currentHangSevereTextColor:v4 previousHangSevereTextColor:CopyWithAlpha currentHangCriticalTextColor:v6 previousHangCriticalTextColor:v7 backgroundColor:SRGB currentProcessExitTextColor:v8 processExitReasonNamespaceTextColor:v9];
  uint64_t v11 = (void *)qword_100063C78;
  qword_100063C78 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);

  CFRelease(v9);
}

void sub_100014BE8(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(0.141176471, 0.141176471, 0.156862745, 1.0);
  CGColorRef v2 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v4 = CGColorCreateSRGB(1.0, 0.584313725, 0.0392156863, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  uint64_t v6 = CGColorCreateSRGB(1.0, 0.270588235, 0.22745098, 1.0);
  CGColorRef v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  CGColorRef v8 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v9 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v10 = [[HUDTheme alloc] initWithPreviousHangTextColor:v3 currentHangTextColor:v2 currentHangSevereTextColor:v4 previousHangSevereTextColor:CopyWithAlpha currentHangCriticalTextColor:v6 previousHangCriticalTextColor:v7 backgroundColor:SRGB currentProcessExitTextColor:v8 processExitReasonNamespaceTextColor:v9];
  uint64_t v11 = (void *)qword_100063C88;
  qword_100063C88 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);

  CFRelease(v9);
}

uint64_t sub_100014E48(uint64_t a1)
{
  CGColorRef v2 = sub_100027DEC();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync();
  }
  else
  {
    if (v3)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v5, 2u);
    }

    return 0;
  }
}

BOOL sub_100014EF8()
{
  id v0 = sub_10002CEE4(@"com.apple.da", @"mobile", @"HTEPL");
  BOOL v1 = [v0 count] != 0;

  return v1;
}

BOOL sub_100014F58()
{
  id v0 = sub_10002CEE4(@"com.apple.da", @"mobile", @"HTThirdPartyDevSupport");
  BOOL v1 = [v0 count] != 0;

  return v1;
}

uint64_t sub_100014FB8(int a1)
{
  unsigned __int8 v2 = +[PerfDiagsSelfEnablementController isAnyModeActive];
  BOOL v3 = sub_100014F58();
  uint64_t v4 = sub_100027DEC();
  uint64_t v5 = v4;
  if ((v2 & 1) != 0 || v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      CGColorRef v9 = "ConfigureTailspinForEPL: A different HangTracer enablement mode is ACTIVE, do not attempt to configure tailspin";
      uint64_t v10 = (uint8_t *)&v12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_14:

    return 0;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ConfigureTailspinForEPL: Other HangTracer enablement modes are NOT active, attempt to configure tailspin", buf, 2u);
  }

  uint64_t v6 = tailspin_config_create_with_default_config();
  if (!v6)
  {
    uint64_t v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      CGColorRef v9 = "ConfigureTailspinForEPL: Failed to create tailspin config object";
      uint64_t v10 = v13;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  if (a1) {
    tailspin_enabled_set();
  }
  uint64_t v8 = sub_100014E48(v7);
  tailspin_config_free();
  return v8;
}

uint64_t sub_1000150FC(int a1)
{
  if (sub_100014EF8())
  {
    unsigned __int8 v2 = sub_100027DEC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "configureTailspinForThirdPartyDevelopment";
      BOOL v3 = "%s: Not configuring tailspin since EPL is active";
      uint64_t v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, v3, (uint8_t *)&v10, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v6 = tailspin_config_create_with_default_config();
  if (!v6)
  {
    unsigned __int8 v2 = sub_100027DEC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "configureTailspinForThirdPartyDevelopment";
      BOOL v3 = "%s: Failed to create tailspin config object";
      uint64_t v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
LABEL_11:

    return 0;
  }
  uint64_t v7 = v6;
  if (a1)
  {
    tailspin_enabled_set();
    tailspin_buffer_size_set();
    tailspin_oncore_sampling_period_set();
    tailspin_full_sampling_period_set();
  }
  uint64_t v8 = sub_100014E48(v7);
  tailspin_config_free();
  return v8;
}

void sub_10001531C(uint64_t a1)
{
  unsigned __int8 v2 = +[NSProcessInfo processInfo];
  BOOL v3 = [v2 processName];
  id v6 = +[NSString stringWithFormat:@"%@ (%i) : %p", v3, getpid(), *(void *)(a1 + 32)];

  id v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:v6];
  os_log_type_t v5 = (void *)qword_100063C90;
  qword_100063C90 = (uint64_t)v4;
}

void sub_100015634(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HangHUDServiceSpecification clientContextIdentifierKey];
  [v3 encodeObject:v2 forKey:v4];
}

void sub_1000156AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HangHUDServiceSpecification interface];
  [v3 setInterface:v4];

  os_log_type_t v5 = +[HangHUDServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100015844;
  v10[3] = &unk_1000514A0;
  id v11 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100015898;
  void v8[3] = &unk_1000514A0;
  id v9 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100015904;
  void v6[3] = &unk_1000514A0;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void sub_100015844(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

void sub_100015898(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];

  [v5 activate];
}

void sub_100015904(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

id sub_1000162A8()
{
  if (qword_100063CA0 != -1) {
    dispatch_once(&qword_100063CA0, &stru_1000514E8);
  }
  id v0 = (void *)qword_100063CA8;

  return v0;
}

void sub_1000162FC(id a1)
{
  id v6 = +[NSMutableArray array];
  unint64_t v1 = 2;
  do
  {
    uint64_t v2 = +[NSNumber numberWithUnsignedLongLong:v1];
    [v6 addObject:v2];

    unint64_t v3 = v1 >> 41;
    v1 *= 2;
  }
  while (!v3);
  id v4 = [v6 copy];
  id v5 = (void *)qword_100063CA8;
  qword_100063CA8 = (uint64_t)v4;
}

void sub_1000163A0(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  uint64_t v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CFStringRef v6 = kCTFontOpticalSizeAttribute;
  unint64_t v3 = +[NSNumber numberWithDouble:sub_10002AB9C()];
  id v7 = v3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v2, v4);

  qword_100063CB8 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithAttributes);
}

void sub_1000164B4(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  uint64_t v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v2, (CFNumberRef)&off_100059520, (CFNumberRef)&off_100059538);
  CFStringRef v7 = kCTFontOpticalSizeAttribute;
  CFDictionaryRef v4 = +[NSNumber numberWithDouble:sub_10002AB9C()];
  uint64_t v8 = v4;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CopyWithFeature, v5);

  qword_100063CC8 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithFeature);
  CFRelease(CopyWithAttributes);
}

void sub_1000165E8(id a1)
{
  qword_100063CD8 = (uint64_t)CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
}

void sub_100017314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001732C(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 preferredFrameSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32);
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  [v9 preferredFrameSize];
  if (v6 < v7)
  {
    [v9 preferredFrameSize];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8;
  }
  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(double *)(*(void *)(a1 + 32) + 8)
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 32);
}

void sub_100017D3C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100017D5C(void *a1)
{
  if ([a1 isEqualToString:@"HTThirdPartyDevSupport"])
  {
    v3[0] = @"HangTracerHUDThresholdMSec";
    v3[1] = @"HangTracerThirdPartyHangThreshold";
    unint64_t v1 = +[NSArray arrayWithObjects:v3 count:2];
  }
  else
  {
    unint64_t v1 = &__NSArray0__struct;
  }

  return v1;
}

void sub_100018344()
{
  __chkstk_darwin();
  id v105 = +[NSMutableString stringWithCapacity:52428800];
  if (!v105) {
    goto LABEL_10;
  }
  id v0 = (void *)qword_100064558;
  unint64_t v1 = +[NSDate date];
  uint64_t v2 = [v0 stringFromDate:v1];
  double v104 = +[NSString stringWithFormat:@"memory-snapshot-%@.ips", v2];

  if (v104)
  {
    unint64_t v3 = +[NSString stringWithFormat:@"/var/root/Library/Caches/hangtracerd//%@", v104];
    if (v3)
    {
      id v4 = v3;
      int __fd = open_dprotected_np((const char *)[v4 UTF8String], 514, 4, 0, 420);
      if (__fd < 0)
      {
        id v11 = v4;
        id v12 = [v11 UTF8String];
        double v13 = __error();
        long long v14 = strerror(*v13);
        NSLog(@"Could not create file - won't take a memory snapshot: %s %s", v12, v14);
        goto LABEL_13;
      }
      id v102 = v4;
      id v5 = v105;
      if (!qword_100063CE0)
      {
        double v6 = (void *)_CFCopyServerVersionDictionary();
        if (!v6) {
          double v6 = (void *)_CFCopySupplementalVersionDictionary();
        }
        double v7 = [v6 objectForKey:_kCFSystemVersionProductVersionKey];
        uint64_t v8 = [v6 objectForKey:_kCFSystemVersionProductNameKey];
        id v9 = [v6 objectForKey:_kCFSystemVersionBuildVersionKey];
        if (v8)
        {
          uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"iPhone OS" withString:@"iOS"];
        }
        else
        {
          uint64_t v10 = @"???";
        }
        CFStringRef v15 = @"???";
        if (v7) {
          CFStringRef v16 = v7;
        }
        else {
          CFStringRef v16 = @"???";
        }
        if (v9) {
          CFStringRef v15 = v9;
        }
        uint64_t v17 = +[NSString stringWithFormat:@"%@ %@ (%@)", v10, v16, v15];
        if (v8) {

        }
        uint64_t v18 = (void *)qword_100063CE0;
        qword_100063CE0 = v17;

        __strlcpy_chk();
        [(id)qword_100063CE0 UTF8String];
        __strlcat_chk();
        __strlcat_chk();
        uname((utsname *)&unk_100063CE8);
      }
      [v5 appendFormat:@"%s", &unk_1000641E8];
      uint64_t v19 = (void *)qword_100064558;
      id v20 = +[NSDate date];
      uint64_t v21 = [v19 stringFromDate:v20];
      [v5 appendFormat:@"{\n\"Model\" : \"%s\",\n\"Timestamp\" : \"%@\",\n\"OSVersion\" : \"%@\"\n}\n", &unk_1000640E8, v21, qword_100063CE0];

      [v5 appendString:@"{\n"];
      id v22 = v5;
      uint64_t v23 = +[NSMutableDictionary dictionaryWithCapacity:22];
      uint64_t v121 = 0;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      *(_OWORD *)host_info64_out = 0u;
      HIDWORD(namesCnt) = 38;
      mach_port_t v24 = mach_host_self();
      *(void *)x = 0;
      double v107 = x;
      uint64_t v108 = 0x2020000000;
      uint64_t v109 = 0;
      if (host_statistics64(v24, 4, host_info64_out, (mach_msg_type_number_t *)&namesCnt + 1))
      {
        [v23 setObject:@"host_statistics64 failed" forKeyedSubscript:@"error"];
      }
      else
      {
        uint64_t v25 = +[NSNumber numberWithUnsignedLong:vm_kernel_page_size];
        [v23 setObject:v25 forKeyedSubscript:@"page_size"];

        double v26 = +[NSNumber numberWithUnsignedInt:host_info64_out[0]];
        [v23 setObject:v26 forKeyedSubscript:@"free_count"];

        unint64_t v27 = +[NSNumber numberWithUnsignedInt:host_info64_out[1]];
        [v23 setObject:v27 forKeyedSubscript:@"active_count"];

        uint64_t v28 = +[NSNumber numberWithUnsignedInt:host_info64_out[2]];
        [v23 setObject:v28 forKeyedSubscript:@"inactive_count"];

        unint64_t v29 = +[NSNumber numberWithUnsignedInt:host_info64_out[3]];
        [v23 setObject:v29 forKeyedSubscript:@"wire_count"];

        double v30 = +[NSNumber numberWithUnsignedLongLong:(void)v113];
        [v23 setObject:v30 forKeyedSubscript:@"zero_fill_count"];

        uint64_t v31 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v113 + 1)];
        [v23 setObject:v31 forKeyedSubscript:@"reactivations"];

        uint64_t v32 = +[NSNumber numberWithUnsignedLongLong:(void)v114];
        [v23 setObject:v32 forKeyedSubscript:@"pageins"];

        unint64_t v33 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v114 + 1)];
        [v23 setObject:v33 forKeyedSubscript:@"pageouts"];

        BOOL v34 = +[NSNumber numberWithUnsignedLongLong:(void)v115];
        [v23 setObject:v34 forKeyedSubscript:@"faults"];

        BOOL v35 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v115 + 1)];
        [v23 setObject:v35 forKeyedSubscript:@"cow_faults"];

        id v36 = +[NSNumber numberWithUnsignedLongLong:(void)v116];
        [v23 setObject:v36 forKeyedSubscript:@"lookups"];

        long long v37 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v116 + 1)];
        [v23 setObject:v37 forKeyedSubscript:@"hits"];

        long long v38 = +[NSNumber numberWithUnsignedLongLong:(void)v117];
        [v23 setObject:v38 forKeyedSubscript:@"purges"];

        double v39 = +[NSNumber numberWithUnsignedInt:DWORD2(v117)];
        [v23 setObject:v39 forKeyedSubscript:@"purgeable_count"];

        float v40 = +[NSNumber numberWithUnsignedInt:HIDWORD(v117)];
        [v23 setObject:v40 forKeyedSubscript:@"speculative_count"];

        uint64_t v41 = +[NSNumber numberWithUnsignedLongLong:(void)v118];
        [v23 setObject:v41 forKeyedSubscript:@"decompressions"];

        double v42 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v118 + 1)];
        [v23 setObject:v42 forKeyedSubscript:@"compressions"];

        long long v43 = +[NSNumber numberWithUnsignedLongLong:(void)v119];
        [v23 setObject:v43 forKeyedSubscript:@"swapins"];

        long long v44 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v119 + 1)];
        [v23 setObject:v44 forKeyedSubscript:@"swapouts"];

        long long v45 = +[NSNumber numberWithUnsignedInt:v120];
        [v23 setObject:v45 forKeyedSubscript:@"compressor_page_count"];

        long long v46 = +[NSNumber numberWithUnsignedInt:DWORD1(v120)];
        [v23 setObject:v46 forKeyedSubscript:@"throttled_count"];

        long long v47 = +[NSNumber numberWithUnsignedInt:DWORD2(v120)];
        [v23 setObject:v47 forKeyedSubscript:@"external_page_count"];

        uint64_t v48 = +[NSNumber numberWithUnsignedInt:HIDWORD(v120)];
        [v23 setObject:v48 forKeyedSubscript:@"internal_page_count"];

        id v49 = +[NSNumber numberWithUnsignedLongLong:v121];
        [v23 setObject:v49 forKeyedSubscript:@"total_uncompressed_pages_in_compressor"];
      }
      id v50 = [v23 count];
      *((void *)v107 + 3) = v50;
      info[0] = (mach_zone_info_array_t)_NSConcreteStackBlock;
      info[1] = (mach_zone_info_array_t)3221225472;
      *(void *)&long long v123 = sub_1000193D4;
      *((void *)&v123 + 1) = &unk_100051B30;
      id v51 = v22;
      *(void *)&long long v124 = v51;
      *((void *)&v124 + 1) = x;
      [v23 enumerateKeysAndObjectsUsingBlock:info];
      mach_port_deallocate(mach_task_self_, v24);

      _Block_object_dispose(x, 8);
      id v52 = v51;
      __s = 0;
      long long v123 = 0u;
      long long v124 = 0u;
      *(_OWORD *)info = 0u;
      *(void *)x = 0;
      if (dword_10006424C) {
        goto LABEL_28;
      }
      pid_for_task(mach_task_self_, x);
      if ((ledger() & 0x80000000) != 0
        || (__s = (char *)malloc_type_malloc(96 * *((void *)&v124 + 1), 0x1000040565EDBD2uLL)) == 0)
      {

        goto LABEL_109;
      }
      dword_100064250 = DWORD2(v124);
      if ((ledger() & 0x80000000) != 0)
      {
        double v54 = 0;
        double v56 = 0;
        int v77 = 0;
        id v82 = __s;
        goto LABEL_84;
      }
      uint64_t v78 = dword_100064250;
      if (dword_100064250)
      {
        uint64_t v79 = 0;
        CFStringRef v80 = __s;
        do
        {
          size_t v81 = strlen(v80);
          if (!strncmp(v80, "phys_footprint", v81)) {
            goto LABEL_81;
          }
          ++v79;
          v80 += 96;
        }
        while (v78 != v79);
        int v77 = 0;
        double v56 = 0;
        double v54 = 0;
        dword_10006424C = v78;
        goto LABEL_83;
      }
      LODWORD(v79) = 0;
LABEL_81:
      dword_10006424C = v79;
      if (v79 != v78)
      {
LABEL_28:
        int v53 = memorystatus_control();
        if (v53)
        {
          double v54 = (char *)malloc_type_malloc(2 * v53, 0x8B035FCBuLL);
          if (v54 && (unsigned int v55 = memorystatus_control()) != 0)
          {
            double v56 = (unsigned int *)malloc_type_malloc(48 * dword_100064250, 0x1000040EED21634uLL);
            if (v56)
            {
              [v52 appendString:@"\"Processes\" :\n[\n"];
              if (v55 >= 0x18)
              {
                uint64_t v57 = 0;
                LODWORD(v58) = v55 / 0x18;
                if (v55 / 0x18 <= 1) {
                  uint64_t v58 = 1;
                }
                else {
                  uint64_t v58 = v58;
                }
                uint64_t v97 = v55 / 0x18;
                uint64_t v98 = v58;
                while (1)
                {
                  unint64_t v59 = (int *)&v54[24 * v57];
                  if ((ledger() & 0x80000000) == 0) {
                    break;
                  }
                  double v64 = 0;
                  ++v57;
LABEL_66:

                  if (v57 == v98) {
                    goto LABEL_67;
                  }
                }
                unint64_t v60 = v56[12 * dword_10006424C];
                vm_size_t v61 = vm_kernel_page_size;
                if ((proc_pidpath(*v59, host_info64_out, 0x1000u) & 0x80000000) == 0)
                {
                  double v62 = +[NSString stringWithUTF8String:host_info64_out];
                  uint64_t v63 = (char *)[v62 rangeOfString:@"/" options:4];
                  if (v63 != (char *)0x7FFFFFFFFFFFFFFFLL
                    && ([v62 substringFromIndex:v63 + 1],
                        (double v64 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0)
                    || (+[NSString stringWithFormat:@"UnknownProcess_%d", *v59], (double v64 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    BOOL v65 = [(__CFString *)v64 length] == 0;

                    CFStringRef v66 = @"No_Name";
                    if (!v65) {
                      CFStringRef v66 = v64;
                    }
                    goto LABEL_48;
                  }
                }
                double v64 = 0;
                CFStringRef v66 = @"No_Name";
LABEL_48:
                double v67 = &v54[24 * v57];
                unint64_t v68 = "Y";
                if ((*((_DWORD *)v67 + 5) & 0x20) == 0) {
                  unint64_t v68 = "N";
                }
                double v69 = "-";
                if ((*((_DWORD *)v67 + 5) & 8) != 0) {
                  double v69 = v68;
                }
                [v52 appendFormat:@"{\"ProcessName\":\"%@\", \"Priority\":%d, \"Footprint\":%d, \"Dirty\":\"%s\"", v66, *((unsigned int *)v67 + 1), v60 / v61, v69];
                dispatch_time_t v70 = &v54[24 * v57];
                uint64_t v72 = *((void *)v70 + 1);
                double v71 = (unint64_t *)(v70 + 8);
                if (v72)
                {
                  id v73 = objc_opt_new();
                  unint64_t v74 = *v71;
                  [v52 appendString:@", \"Assertions\":["];
                  if (v74)
                  {
                    unint64_t v75 = 0;
                    do
                    {
                      if (v74)
                      {
                        if (v75 > 0x1A) {
                          [v73 appendFormat:@"\"UnknownAssertion_%d\"", v75];
                        }
                        else {
                          [v73 appendString:off_100051A50[v75]];
                        }
                        if (v74 < 2) {
                          break;
                        }
                        [v73 appendString:@","];
                      }
                      ++v75;
                      BOOL v76 = v74 >= 2;
                      v74 >>= 1;
                    }
                    while (v76);
                  }
                  [v52 appendFormat:@"%@]", v73];
                }
                [v52 appendString:@"}"];
                if (++v57 == v97) {
                  uint64_t v57 = v97;
                }
                else {
                  [v52 appendString:@",\n"];
                }
                goto LABEL_66;
              }
LABEL_67:
              [v52 appendString:@"],\n"];
              int v77 = 1;
            }
            else
            {
              int v77 = 0;
            }
          }
          else
          {
            int v77 = 0;
            double v56 = 0;
          }
LABEL_83:
          id v82 = __s;
          if (!__s)
          {
LABEL_85:
            if (v54) {
              free(v54);
            }
            if (v56)
            {
              free(v56);

              if ((v77 & 1) == 0) {
                goto LABEL_109;
              }
LABEL_91:
              __sa = (char *)v52;
              uint64_t namesCnt = 0;
              *(void *)host_info64_out = 0;
              info[0] = 0;
              *(void *)x = 0;
              mach_msg_type_number_t infoCnt = 0;
              mach_port_t v83 = mach_host_self();
              if (mach_memory_info(v83, (mach_zone_name_array_t *)x, (mach_msg_type_number_t *)&namesCnt, info, &infoCnt, (mach_memory_info_array_t *)host_info64_out, (mach_msg_type_number_t *)&namesCnt + 1) < 0)
              {
                BOOL v91 = 0;
              }
              else
              {
                [__sa appendString:@"\"Zones\" :\n[\n"];
                vm_address_t v84 = *(void *)x;
                mach_msg_type_number_t v86 = infoCnt;
                uint64_t v85 = namesCnt;
                mach_zone_info_array_t v87 = info[0];
                id v88 = __sa;
                if (v85 && v85 == v86)
                {
                  uint64_t v89 = v85 - 1;
                  for (i = &v87->mzi_cur_size; ; i += 8)
                  {
                    [v88 appendFormat:@"{ \"Name\" : \"%s\", \"Pages\" : %llu }", v84, *i / vm_kernel_page_size];
                    if (!v89) {
                      break;
                    }
                    [v88 appendString:@","];
                    [v88 appendString:@"\n"];
                    --v89;
                    v84 += 80;
                  }
                  [v88 appendString:@"\n"];
                }
                BOOL v91 = v85 == v86;

                if (v91)
                {
                  [v88 appendString:@"]\n"];
                  BOOL v91 = 1;
                }
              }
              if (*(void *)x) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)x, 80 * namesCnt);
              }
              if (info[0]) {
                vm_deallocate(mach_task_self_, (vm_address_t)info[0], (unint64_t)infoCnt << 6);
              }
              if (*(void *)host_info64_out) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)host_info64_out, 176 * HIDWORD(namesCnt));
              }

              if (v91)
              {
                [__sa appendString:@"}\n"];
                uint64_t v92 = __sa;
                write(__fd, [v92 UTF8String], (size_t)[v92 lengthOfBytesUsingEncoding:4]);
                close(__fd);
                id v11 = v102;
                char v93 = (const std::__fs::filesystem::path *)[v11 UTF8String];
                id v94 = +[NSString stringWithFormat:@"/Library/Logs/CrashReporter//%@", v104];
                v95 = (const std::__fs::filesystem::path *)[v94 UTF8String];
                rename(v93, v95, v96);

                goto LABEL_13;
              }
              goto LABEL_109;
            }

            if (v77) {
              goto LABEL_91;
            }
LABEL_109:
            LODWORD(v3) = __fd;
            goto LABEL_12;
          }
LABEL_84:
          free(v82);
          goto LABEL_85;
        }
      }
      int v77 = 0;
      double v56 = 0;
      double v54 = 0;
      goto LABEL_83;
    }
  }
  else
  {
LABEL_10:
    LODWORD(v3) = 0;
    double v104 = 0;
  }
  id v102 = 0;
LABEL_12:
  close((int)v3);
  id v11 = v102;
  unlink((const char *)[v11 UTF8String]);
LABEL_13:
}

void sub_1000193B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000193D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendFormat:@"\"%@\" : %lu", v6, [a3 unsignedIntegerValue]];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  id result = [*(id *)(a1 + 32) appendString:@"\n"];
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t sub_100019518(uint64_t a1)
{
  qword_100064258 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_1000196C4(uint64_t a1)
{
  qword_100064268 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100019B20(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) identifier];
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:v1];

  uint64_t v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___HangHUDServerProtocol];
  [v5 setServer:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_100064278;
  qword_100064278 = (uint64_t)v3;
}

uint64_t sub_100019BD8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[HTPrefs sharedPrefs];
  unsigned __int8 v3 = [v2 enableLoggingForWidgetRenderer];

  if ((v3 & 1) != 0 || ([v1 containsString:@"WidgetRenderer-Default"] & 1) == 0)
  {
    id v5 = +[HTPrefs sharedPrefs];
    unsigned __int8 v6 = [v5 enableLoggingForPoster];

    if (v6 & 1) != 0 || ([v1 containsString:@"PosterBoard"])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v7 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v1 error:0];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = [v7 extensionPointRecord];
        id v4 = v9;
        if (v9)
        {
          uint64_t v10 = [v9 identifier];
          unsigned int v11 = [v10 isEqualToString:@"com.apple.posterkit.provider"];

          LODWORD(v4) = (int)(v11 << 31) >> 31;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

id sub_100019CFC()
{
  v5[0] = @"/var/root/Library/Caches/hangtracerd/spool";
  v5[1] = @"/var/mobile/Library/Logs/CrashReporter/";
  id v0 = +[NSArray arrayWithObjects:v5 count:2];
  v4[0] = @"UIKit-runloop";
  v4[1] = @"Fence-hang";
  id v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = sub_100019DF0(v0, v1, 1);

  return v2;
}

id sub_100019DF0(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v36 = a2;
  BOOL v34 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v31)
  {
    uint64_t v30 = a3 ^ 1u;
    uint64_t v29 = *(void *)v50;
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        uint64_t v8 = +[NSURL URLWithString:*(void *)(*((void *)&v49 + 1) + 8 * v7)];
        id v9 = +[NSFileManager defaultManager];
        v55[0] = v6;
        v55[1] = NSURLNameKey;
        uint64_t v10 = +[NSArray arrayWithObjects:v55 count:2];
        uint64_t v32 = (void *)v8;
        unsigned int v11 = [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:v30 errorHandler:&stru_100051B50];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v38 = v11;
        id v12 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          do
          {
            CFStringRef v15 = 0;
            id v37 = v13;
            do
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v38);
              }
              CFStringRef v16 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v15);
              id v44 = 0;
              [v16 getResourceValue:&v44 forKey:v6 error:0];
              id v18 = v44;
              if (([v18 BOOLValue] & 1) == 0)
              {
                id v43 = 0;
                [v16 getResourceValue:&v43 forKey:NSURLNameKey error:0];
                id v19 = v43;
                id v20 = [v19 lastPathComponent];
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                id v21 = v36;
                id v22 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v40;
                  while (2)
                  {
                    for (i = 0; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v40 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      if ([v20 hasPrefix:*(void *)(*((void *)&v39 + 1) + 8 * i)])
                      {

                        id v21 = [v16 path];
                        [v34 addObject:v21];
                        goto LABEL_22;
                      }
                    }
                    id v23 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }
LABEL_22:
                  NSURLResourceKey v6 = NSURLIsDirectoryKey;
                  uint64_t v14 = v35;
                }

                id v13 = v37;
              }

              CFStringRef v15 = (char *)v15 + 1;
            }
            while (v15 != v13);
            id v13 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v33 + 1;
      }
      while ((id)(v33 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v31);
  }

  id v26 = [v34 copy];

  return v26;
}

uint64_t sub_10001A1D0()
{
  id v0 = (id)__chkstk_darwin();
  uint64_t v1 = MGCopyAnswer();
  uint64_t v2 = MGCopyAnswer();
  unsigned __int8 v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  id v4 = +[NSDate date];
  id v5 = [v3 stringFromDate:v4];
  mach_zone_info_array_t v87 = (void *)v1;
  id v88 = (void *)v2;
  uint64_t v6 = +[NSString stringWithFormat:@"%@-%@-%@-%@.%@", @"ArchivedHangs", v1, v2, v5, @"tgz"];

  uint64_t v7 = (void *)v6;
  uint64_t v8 = +[NSString stringWithFormat:@"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v6];
  sub_100019CFC();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v8;
  unsigned int v11 = (const char *)[v10 UTF8String];
  if (MKBDeviceUnlockedSinceBoot()) {
    int v12 = 3;
  }
  else {
    int v12 = 2;
  }
  int v13 = open_dprotected_np(v11, 514, v12, 0, 416);
  if (v13 < 0)
  {
    uint64_t v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)double v103 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error getting file descriptor for %s due to protection classes", buf, 0xCu);
    }
    goto LABEL_20;
  }
  int v14 = v13;
  id v86 = v0;
  archive_write_new();
  int v15 = archive_write_add_filter_gzip();
  if (v15)
  {
    int v16 = v15;
    archive_write_free();
    close(v14);
    uint64_t v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)double v103 = v16;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = archive_errno();
      *(_WORD *)&v103[10] = 2080;
      *(void *)&v103[12] = archive_error_string();
      id v18 = "Error creating compressed file (archive_write_add_filter_gzip): %i err_num: %i, err_string: %s";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v19 = archive_write_set_options();
  if (v19)
  {
    int v20 = v19;
    archive_write_free();
    close(v14);
    uint64_t v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)double v103 = v20;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = archive_errno();
      *(_WORD *)&v103[10] = 2080;
      *(void *)&v103[12] = archive_error_string();
      id v18 = "Error creating compressed file (archive_write_set_options): %i err_num: %i, err_string: %s";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v21 = archive_write_set_format_pax();
  if (v21)
  {
    int v22 = v21;
    archive_write_free();
    close(v14);
    uint64_t v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)double v103 = v22;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = archive_errno();
      *(_WORD *)&v103[10] = 2080;
      *(void *)&v103[12] = archive_error_string();
      id v18 = "Error creating compressed file (archive_write_set_format_pax): %i err_num: %i, err_string: %s";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v23 = archive_write_open_fd();
  if (v23)
  {
    int v24 = v23;
    archive_write_free();
    close(v14);
    uint64_t v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)double v103 = v24;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = archive_errno();
      *(_WORD *)&v103[10] = 2080;
      *(void *)&v103[12] = archive_error_string();
      id v18 = "Error creating compressed file (archive_write_open_fd): %i err_num: %i, err_string: %s";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v79 = v7;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v17 = v9;
  id v80 = [v17 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (!v80) {
    goto LABEL_52;
  }
  uint64_t v83 = *(void *)v91;
  size_t v81 = v3;
  id v82 = v9;
  while (2)
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v91 != v83) {
        objc_enumerationMutation(v17);
      }
      id v34 = *(id *)(*((void *)&v90 + 1) + 8 * (void)v33);
      uint64_t v35 = (const char *)[v34 UTF8String];
      id v84 = [v34 lastPathComponent];
      [v84 UTF8String];
      archive_entry_new();
      memset(&v94, 0, sizeof(v94));
      int v36 = stat(v35, &v94);
      if (v36)
      {
        int v37 = v36;
        archive_entry_free();
        id v38 = sub_100027DEC();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
LABEL_39:
          unsigned __int8 v3 = v81;
          id v9 = v82;
          long long v42 = v84;

          goto LABEL_40;
        }
        *(_DWORD *)long long buf = 136315394;
        *(void *)double v103 = v35;
        *(_WORD *)&v103[8] = 1024;
        *(_DWORD *)&v103[10] = v37;
        long long v39 = v38;
        long long v40 = "Error stat-ing original file: %s with error: %i. Will skip.";
        uint32_t v41 = 18;
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
        goto LABEL_39;
      }
      int v43 = open(v35, 0);
      if (v43 < 0)
      {
        archive_entry_free();
        id v38 = sub_100027DEC();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_39;
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)double v103 = v35;
        long long v39 = v38;
        long long v40 = "Error getting fd for file: %s. Will skip.";
        uint32_t v41 = 12;
        goto LABEL_38;
      }
      int v44 = v43;
      archive_entry_copy_stat();
      archive_entry_set_pathname();
      archive_entry_set_filetype();
      archive_entry_set_perm();
      int v45 = archive_write_header();
      if (v45)
      {
        int v64 = v45;
        archive_entry_free();
        BOOL v65 = sub_100027DEC();
        unsigned __int8 v3 = v81;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          int v66 = archive_errno();
          uint64_t v67 = archive_error_string();
          *(_DWORD *)long long buf = 67109634;
          *(_DWORD *)double v103 = v64;
          *(_WORD *)&v103[4] = 1024;
          *(_DWORD *)&v103[6] = v66;
          *(_WORD *)&v103[10] = 2080;
          *(void *)&v103[12] = v67;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Error creating compressed file (archive_write_header): %i err_num: %i, err_string: %s", buf, 0x18u);
        }

LABEL_58:
        uint64_t v25 = v87;
        uint64_t v7 = v79;
        id v9 = v82;
        archive_write_free();
        close(v14);
        uint64_t v58 = sub_100027DEC();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          int v59 = archive_errno();
          uint64_t v60 = archive_error_string();
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)double v103 = v59;
          *(_WORD *)&v103[4] = 2080;
          *(void *)&v103[6] = v60;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Error creating compressed file (addFileToZippingArchive) err_num: %i, err_string: %s", buf, 0x12u);
        }

        goto LABEL_21;
      }
      ssize_t v46 = read(v44, buf, 0x2000uLL);
      unsigned __int8 v3 = v81;
      if (v46 >= 1)
      {
        ssize_t v47 = v46;
        while (1)
        {
          uint64_t v48 = archive_write_data();
          if (v48 != v47) {
            break;
          }
          ssize_t v47 = read(v44, buf, 0x2000uLL);
          if (v47 < 1) {
            goto LABEL_48;
          }
        }
        uint64_t v54 = v48;
        unsigned int v55 = sub_100027DEC();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          int v56 = archive_errno();
          uint64_t v57 = archive_error_string();
          *(_DWORD *)v96 = 134218498;
          uint64_t v97 = v54;
          __int16 v98 = 1024;
          int v99 = v56;
          __int16 v100 = 2080;
          uint64_t v101 = v57;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Error writing data to archive: %zd byte written with err_num: %i, err_string: %s", v96, 0x1Cu);
        }

        archive_entry_free();
        close(v44);
        goto LABEL_58;
      }
LABEL_48:
      archive_entry_free();
      close(v44);
      id v9 = v82;
      long long v42 = v84;
LABEL_40:

      uint64_t v33 = (char *)v33 + 1;
    }
    while (v33 != v80);
    id v49 = [v17 countByEnumeratingWithState:&v90 objects:v95 count:16];
    id v80 = v49;
    if (v49) {
      continue;
    }
    break;
  }
LABEL_52:

  int v50 = archive_write_close();
  int v51 = archive_write_free();
  if (v50)
  {
    close(v14);
    uint64_t v17 = sub_100027DEC();
    uint64_t v7 = v79;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = archive_errno();
      uint64_t v53 = archive_error_string();
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)double v103 = v50;
      *(_WORD *)&v103[4] = 1024;
      *(_DWORD *)&v103[6] = v52;
      *(_WORD *)&v103[10] = 2080;
      *(void *)&v103[12] = v53;
      id v18 = "Error creating compressed file (archive_write_close): %i err_num: %i, err_string: %s";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v61 = v51;
  close(v14);
  uint64_t v7 = v79;
  if (!v61)
  {

    uint64_t v30 = +[NSString stringWithFormat:@"%@/%@", v0, v79];
    unint64_t v68 = +[NSFileManager defaultManager];
    id v89 = 0;
    int v69 = [v68 moveItemAtPath:v10 toPath:v30 error:&v89];
    id v70 = v89;

    if (v69)
    {
      id v85 = v70;
      id v71 = v9;
      uint64_t v72 = v30;
      int v73 = chmod((const char *)[v72 UTF8String], 0x1B6u);
      unint64_t v74 = sub_100027DEC();
      unint64_t v75 = v74;
      uint64_t v25 = v87;
      if (v73)
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)double v103 = v72;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Failed to chmod file: %@", buf, 0xCu);
        }
        uint64_t v29 = 0;
      }
      else
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
          sub_10003206C((uint64_t)v72, v75);
        }
        uint64_t v29 = 1;
      }
      id v9 = v71;
      id v70 = v85;
    }
    else
    {
      BOOL v76 = sub_100027DEC();
      uint64_t v25 = v87;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        *(void *)double v103 = v10;
        *(_WORD *)&v103[8] = 2112;
        *(void *)&v103[10] = v30;
        *(_WORD *)&v103[18] = 2112;
        id v104 = v70;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Unable to move file %@ to final path %@: %@", buf, 0x20u);
      }

      id v77 = v10;
      if ((unlink((const char *)[v77 UTF8String]) & 0x80000000) == 0)
      {
        uint64_t v29 = 0;
LABEL_84:
        id v26 = v88;

        id v0 = v86;
LABEL_28:

        goto LABEL_29;
      }
      unint64_t v75 = sub_100027DEC();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        int v78 = *__error();
        *(_DWORD *)long long buf = 138412546;
        *(void *)double v103 = v77;
        *(_WORD *)&v103[8] = 1024;
        *(_DWORD *)&v103[10] = v78;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Unable to unlink temp archive file %@ due to error %{darwin.errno}d", buf, 0x12u);
      }
      uint64_t v29 = 0;
    }

    goto LABEL_84;
  }
  uint64_t v17 = sub_100027DEC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v62 = archive_errno();
    uint64_t v63 = archive_error_string();
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)double v103 = v61;
    *(_WORD *)&v103[4] = 1024;
    *(_DWORD *)&v103[6] = v62;
    *(_WORD *)&v103[10] = 2080;
    *(void *)&v103[12] = v63;
    id v18 = "Error creating compressed file (archive_write_free): %i err_num: %i, err_string: %s";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x18u);
  }
LABEL_20:
  uint64_t v25 = v87;
LABEL_21:
  id v26 = v88;

  unint64_t v27 = sub_100027DEC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)double v103 = v10;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to createZippedArchive: %@", buf, 0xCu);
  }

  id v28 = v10;
  if (unlink((const char *)[v28 UTF8String]) < 0)
  {
    uint64_t v30 = sub_100027DEC();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = *__error();
      *(_DWORD *)long long buf = 138412546;
      *(void *)double v103 = v28;
      *(_WORD *)&v103[8] = 1024;
      *(_DWORD *)&v103[10] = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Unable to unlink temp archive file %@ due to error %{darwin.errno}d", buf, 0x12u);
    }
    uint64_t v29 = 0;
    goto LABEL_28;
  }
  uint64_t v29 = 0;
LABEL_29:

  return v29;
}

BOOL sub_10001AF04(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error handling url %@: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

id sub_10001AFD8(double a1)
{
  if (sub_10002B9CC()) {
    +[HUDConfiguration sharedInstance];
  }
  else {
  uint64_t v2 = +[HTPrefs sharedPrefs];
  }
  id v3 = [v2 runloopHangTimeoutDurationMSec];

  double v4 = (double)(unint64_t)v3;
  if ((double)(unint64_t)v3 <= a1) {
    +[NSString stringWithFormat:@"%.f+ ms", v4, (double)(unint64_t)v3];
  }
  else {
  id v5 = +[NSString stringWithFormat:@"%.f ms", v4, *(void *)&a1];
  }

  return v5;
}

void sub_10001B3BC(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10001B43C;
  v4[3] = &unk_100050E68;
  v4[4] = v2;
  *(double *)&v4[5] = a2;
  dispatch_sync(v3, v4);
}

void sub_10001B43C(uint64_t a1)
{
  +[CATransaction setDisableActions:1];
  uint64_t v2 = sub_10001AFD8(*(double *)(a1 + 40));
  double v4 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  [v4 setString:v2];

  id v5 = sub_100027DEC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000322E4(v3, v5);
  }
}

void sub_10001B4B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B534;
  block[3] = &unk_100051280;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_10001B534(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

id sub_10001B604()
{
  int v0 = __chkstk_darwin();
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(v0, buffer, 0x1000u))
  {
    uint64_t v1 = +[NSString stringWithUTF8String:buffer];
    if (!v1)
    {
      uint64_t v1 = +[NSString stringWithCString:buffer encoding:1];
      uint64_t v2 = sub_100027DEC();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        sub_100032380((uint64_t)v1, v2);
      }
    }
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

__CFString *sub_10001B718(void *a1)
{
  uint64_t v1 = a1;
  if (v1 && (CFURLRef v2 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    CFURLRef v3 = v2;
    double v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
    if (v4)
    {
      id v5 = v4;
      CFBundleGetIdentifier(v4);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v5);
    }
    else
    {
      uint64_t v6 = &stru_100053108;
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v6 = &stru_100053108;
  }

  return v6;
}

id sub_10001B7CC(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = +[NSDictionary dictionaryWithObject:a2 forKey:NSLocalizedDescriptionKey];
  double v4 = +[NSError errorWithDomain:@"SentryTailspinError" code:a1 userInfo:v3];

  return v4;
}

uint64_t sub_10001B858(void *a1, int a2)
{
  id v3 = a1;
  double v4 = +[NSFileManager defaultManager];
  char v19 = 0;
  if ([v4 fileExistsAtPath:v3 isDirectory:&v19]) {
    BOOL v5 = v19 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = sub_100027DEC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
    }

    if (a2)
    {
      NSFileAttributeKey v24 = NSFileOwnerAccountName;
      CFStringRef v25 = @"mobile";
      uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v18 = 0;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v7 error:&v18];
    id v9 = v18;
    __int16 v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:v3 isDirectory:&v19];

    if (v19) {
      uint64_t v8 = v11;
    }
    else {
      uint64_t v8 = 0;
    }
    int v12 = sub_100027DEC();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8 == 1)
    {
      if (v13)
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v3;
        int v14 = "Successfully created directory at path %@";
        int v15 = v12;
        uint32_t v16 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else if (v13)
    {
      *(_DWORD *)long long buf = 138412546;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v9;
      int v14 = "Error: error creating directory at path %@ %@";
      int v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  uint64_t v8 = 1;
LABEL_21:

  return v8;
}

void sub_10001BAA4(void *a1)
{
  id v1 = a1;
  CFURLRef v2 = +[NSFileManager defaultManager];
  id v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000323F8((uint64_t)v1, v3);
  }

  uint32_t v16 = v1;
  double v4 = +[NSURL URLWithString:v1];
  BOOL v5 = [v2 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:&stru_100051BC0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        unsigned __int8 v12 = [v2 removeItemAtURL:v11 error:&v17];
        id v13 = v17;
        int v14 = sub_100027DEC();
        int v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v23 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Successfully deleted file at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v23 = v11;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete file at %@ : %@", buf, 0x16u);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }
}

BOOL sub_10001BD10(id a1, NSURL *a2, NSError *a3)
{
  double v4 = a2;
  BOOL v5 = a3;
  id v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void sub_10001BDE4(int a1)
{
  CFStringRef v24 = @"Subsystems";
  v22[0] = @"com.apple.hangtracer";
  v22[1] = @"com.apple.performancelogging";
  v23[0] = &off_1000595D0;
  v23[1] = &off_1000595D0;
  v22[2] = @"com.apple.Sentry.Framework";
  v23[2] = &off_1000595D0;
  CFURLRef v2 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v25 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  int v4 = OSLogValidateProfilePayload();
  id v5 = 0;
  id v6 = v5;
  if (v4)
  {
    id v7 = sub_100027DEC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully validated profile payload", buf, 2u);
    }

    if (a1)
    {
      int v8 = OSLogInstallProfilePayload();
      uint64_t v9 = 0;
      __int16 v10 = v9;
      if (v8)
      {
        uint64_t v11 = sub_100027DEC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          unsigned __int8 v12 = "Successfully installed profile payload";
LABEL_14:
          id v13 = v11;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 2;
          goto LABEL_15;
        }
        goto LABEL_23;
      }
      if (v9)
      {
        uint64_t v11 = sub_100027DEC();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        long long v18 = [v10 localizedDescription];
        *(_DWORD *)long long buf = 138412290;
        long long v21 = v18;
        long long v19 = "Failed to install os log profile payload with error: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

        goto LABEL_23;
      }
    }
    else
    {
      int v16 = OSLogRemoveProfilePayload();
      id v17 = 0;
      __int16 v10 = v17;
      if (v16)
      {
        uint64_t v11 = sub_100027DEC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          unsigned __int8 v12 = "Successfully removed profile payload";
          goto LABEL_14;
        }
LABEL_23:

        goto LABEL_24;
      }
      if (v17)
      {
        uint64_t v11 = sub_100027DEC();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        long long v18 = [v10 localizedDescription];
        *(_DWORD *)long long buf = 138412290;
        long long v21 = v18;
        long long v19 = "Failed to remove os log profile payload with error: %@";
        goto LABEL_22;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v5)
  {
    __int16 v10 = sub_100027DEC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      long long v21 = v11;
      unsigned __int8 v12 = "Failed to validate os log profile payload with error: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
LABEL_25:
}

id sub_10001C114()
{
  if (qword_100064290 != -1) {
    dispatch_once(&qword_100064290, &stru_100051BE0);
  }
  int v0 = (void *)qword_100064288;

  return v0;
}

void sub_10001C168(id a1)
{
  qword_100064288 = (uint64_t)os_log_create("com.apple.hangtracer", "signpost_hang");

  _objc_release_x1();
}

id sub_10001C1AC()
{
  if (qword_1000642A0 != -1) {
    dispatch_once(&qword_1000642A0, &stru_100051C00);
  }
  int v0 = (void *)qword_100064298;

  return v0;
}

void sub_10001C200(id a1)
{
  qword_100064298 = (uint64_t)os_log_create("com.apple.hangtracer", "always_on_hang");

  _objc_release_x1();
}

void sub_10001C244(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = a1;
  __int16 v10 = a2;
  uint64_t v11 = a5;
  *(void *)long long buf = 0;
  mach_get_times();
  if (os_signpost_enabled(v11))
  {
    unsigned __int8 v12 = v11;
    id v13 = v12;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      CFStringRef v14 = @"Unknown";
      *(_DWORD *)long long buf = 134349826;
      *(void *)&uint8_t buf[4] = a3;
      if (v10) {
        CFStringRef v15 = v10;
      }
      else {
        CFStringRef v15 = @"Unknown";
      }
      __int16 v17 = 2050;
      uint64_t v18 = a4;
      __int16 v19 = 2114;
      if (v9) {
        CFStringRef v14 = v9;
      }
      CFStringRef v20 = v15;
      __int16 v21 = 2114;
      CFStringRef v22 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, a3, "HangInterval", "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{public, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x2Au);
    }
  }
}

uint64_t sub_10001C3AC(int a1)
{
  CFURLRef v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 environment];
  int v4 = [v3 objectForKeyedSubscript:@"HT_DISABLE_DEBUGGER_CHECK"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = sub_100027DEC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Check for app is being debugged is disabled", buf, 2u);
    }

    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)long long buf = 0u;
  long long v16 = 0u;
  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    int v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to check if app is being debugged", (uint8_t *)&v11, 2u);
    }
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  if ((v17 & 2) != 0)
  {
    int v8 = +[NSString stringWithUTF8String:&v16];
    if (([v8 isEqualToString:@"xctest"] & 1) != 0
      || ([v8 isEqualToString:@"hangman"] & 1) != 0
      || [v8 hasSuffix:@"-Runner"])
    {
      uint64_t v9 = sub_100027DEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        unsigned __int8 v12 = v8;
        __int16 v13 = 1024;
        int v14 = a1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO", (uint8_t *)&v11, 0x12u);
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v9 = sub_100027DEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App is being debugged, do not track this hang", (uint8_t *)&v11, 2u);
      }
      uint64_t v7 = 1;
    }

LABEL_18:
    return v7;
  }
  return 0;
}

__CFString *sub_10001C628(unint64_t a1)
{
  if (a1 > 4)
  {
    CFURLRef v2 = @"Unknown";
  }
  else
  {
    CFURLRef v2 = *off_100051C20[a1];
  }
  return v2;
}

__CFString *sub_10001C680(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_100051C48[a1];
  }
  return (__CFString *)(id)a1;
}

BOOL sub_10001C6C4(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

CFStringRef sub_10001C6D4(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"tailspin capture failed for unknown reason";
  }
  else {
    return off_100051CA0[a1];
  }
}

uint64_t sub_10001C6F8(int a1, int a2, double a3)
{
  if (a1)
  {
    int v4 = +[HTPrefs sharedPrefs];
    double v5 = (double)(unint64_t)[v4 runloopLongHangDurationThresholdMSec];

    if (v5 <= a3)
    {
      return 222;
    }
    else
    {
      id v6 = +[HTPrefs sharedPrefs];
      double v7 = (double)(unint64_t)[v6 runloopHangDurationThresholdMSec];

      if (v7 <= a3) {
        return 223;
      }
      else {
        return 310;
      }
    }
  }
  else if (a2)
  {
    return 328;
  }
  else
  {
    return 228;
  }
}

uint64_t sub_10001C798(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"UIKit-runloop"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 containsString:@"Fence-hang"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 containsString:@"Slow-Launch"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 containsString:@"Sentry"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 containsString:@"Force-Quit"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 5;
  }

  return v2;
}

NSDate *sub_10001C860(uint64_t a1, void *a2, unint64_t a3)
{
  [a2 timeIntervalSinceReferenceDate];
  double v6 = sub_10002AA40((unint64_t)(v5 * 1000.0));
  double v7 = sub_10002A9DC((unint64_t)(v6 - (double)a3) + a1);

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
}

BOOL sub_10001C8CC(unint64_t a1, uint64_t a2, double *a3)
{
  unsigned int v3 = atomic_load((unsigned int *)(a2 + 24));
  BOOL result = 0;
  if (!v3)
  {
    unint64_t v5 = *(void *)a2;
    double v6 = sub_10002A984(a1);
    double v7 = v6 - sub_10002A984(v5);
    *a3 = v7;
    if (v7 > 100.0) {
      return 1;
    }
  }
  return result;
}

id sub_10001DA04(uint64_t a1)
{
  uint64_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HangTracer: Detected app exit (pid=%u), check for hangs", (uint8_t *)v6, 8u);
  }

  int v4 = [*(id *)(a1 + 32) checkEventsForTimeouts:mach_absolute_time() withType:8];
  [v4 recordHang];

  return +[HTProcessInfo stopWatchingPid:*(unsigned int *)(a1 + 40)];
}

id sub_10001E3C4(uint64_t a1)
{
  v8[0] = off_100063870;
  v7[0] = off_100063858;
  v7[1] = off_100063878;
  uint64_t v2 = sub_10001C680(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  v8[1] = v2;
  _DWORD v8[2] = v3;
  void v7[2] = off_100063888;
  void v7[3] = off_100063880;
  int v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v8[3] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

id sub_10001E4DC(uint64_t a1)
{
  v8[0] = off_100063868;
  v7[0] = off_100063858;
  v7[1] = off_100063878;
  uint64_t v2 = sub_10001C680(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  v8[1] = v2;
  _DWORD v8[2] = v3;
  void v7[2] = off_100063888;
  void v7[3] = off_100063880;
  int v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v8[3] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

id sub_10001E5F4(uint64_t a1)
{
  v8[0] = off_100063860;
  v7[0] = off_100063858;
  v7[1] = off_100063878;
  uint64_t v2 = sub_10001C680(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  v8[1] = v2;
  _DWORD v8[2] = v3;
  void v7[2] = off_100063888;
  void v7[3] = off_100063880;
  int v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v8[3] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

id sub_10001F460(uint64_t a1)
{
  v8[0] = off_100063860;
  v7[0] = off_100063858;
  v7[1] = off_100063878;
  uint64_t v2 = sub_10001C680(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  v8[1] = v2;
  _DWORD v8[2] = v3;
  void v7[2] = off_100063888;
  void v7[3] = off_100063880;
  int v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v8[3] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

uint64_t sub_10001FFC0(uint64_t a1)
{
  qword_100064358 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100020324(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  void v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100053108;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTBadDay";
  v3[7] = @"PDSEHTThirdParty";
  v3[8] = @"PDSEWorkflowResponsiveness";
  v3[9] = @"PDSEHTRateOnly";
  v3[10] = @"PDSESentry";
  v3[11] = @"PDSEAppLaunch";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  uint64_t v2 = (void *)qword_100064370;
  qword_100064370 = v1;
}

void sub_100022938(id a1)
{
  qword_100064378 = objc_alloc_init(HTPrefs);

  _objc_release_x1();
}

void sub_10002470C(id a1)
{
  memset(v4, 0, sizeof(v4));
  size_t v3 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0))
  {
    uint64_t v1 = +[NSString stringWithUTF8String:v4];
    uint64_t v2 = (void *)qword_100064390;
    qword_100064390 = v1;
  }
}

void sub_1000258CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  objc_destroyWeak(v51);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v52 - 240), 8);
  _Block_object_dispose((const void *)(v52 - 208), 8);
  _Block_object_dispose((const void *)(v52 - 176), 8);
  _Block_object_dispose((const void *)(v52 - 144), 8);
  objc_destroyWeak((id *)(v52 - 112));
  _Unwind_Resume(a1);
}

void sub_100025940(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    size_t v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      int v4 = "HTPrefs: Tasking Changed";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    size_t v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      int v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    size_t v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      int v4 = "HTPrefs: Profile List Changed";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != a2)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_19;
    }
    size_t v3 = sub_100027DEC();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_WORD *)long long buf = 0;
    int v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
    goto LABEL_17;
  }
  unint64_t v5 = sub_100027DEC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HTPrefs: EPL State Changed", buf, 2u);
  }

  +[HTTailspin resetLogCountsForEPL];
LABEL_19:
  double v6 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v8 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v9 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v9 hangtracerDaemonEnabled];

  if (v8 != WeakRetained)
  {
    __int16 v10 = sub_100027DEC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v8) {
        CFStringRef v11 = @"ON";
      }
      else {
        CFStringRef v11 = @"OFF";
      }
      id v12 = objc_loadWeakRetained(v6);
      if ([v12 hangtracerDaemonEnabled]) {
        CFStringRef v13 = @"ON";
      }
      else {
        CFStringRef v13 = @"OFF";
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v22 = v11;
      __int16 v23 = 2112;
      CFStringRef v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);
    }
    id v14 = objc_loadWeakRetained(v6);
    CFStringRef v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 hangtracerDaemonEnabled:@"Enabled"]);
    CFStringRef v20 = v15;
    long long v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    long long v17 = +[NSNotificationCenter defaultCenter];
    id v18 = objc_loadWeakRetained(v6);
    [v17 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v18 userInfo:v16];
  }
}

void *sub_100025CB8(void *result, int a2)
{
  if (*(_DWORD *)(*(void *)(result[4] + 8) + 24) == a2)
  {
    uint64_t v2 = sub_100027DEC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)size_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }

    +[HTTailspin resetLogCountsForDailyRollover];
    +[HTTailspin resetDailySentryTailspinCounts];
    +[HTTailspin resetPerAppCounts];
    return +[HTTailspin refreshPerPeriodSentryLogCount];
  }
  return result;
}

void *sub_100025D58(void *result, int a2)
{
  if (*(_DWORD *)(*(void *)(result[5] + 8) + 24) == a2)
  {
    uint64_t v2 = result;
    size_t v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: System Language Change Triggered Refresh", v4, 2u);
    }

    sub_100027BF4();
    return [(id)v2[4] refreshHTPrefs];
  }
  return result;
}

void sub_100025DE4(uint64_t a1)
{
  uint64_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Sentry Enablement Settings changed", (uint8_t *)v9, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(unsigned __int8 *)(v3 + 55);
  unint64_t v5 = (__CFString *)*(id *)(v3 + 392);
  double v6 = (void *)CFPreferencesCopyValue(@"allowSentryEnablement", v5, @"mobile", kCFPreferencesAnyHost);
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = [v6 BOOLValue];
  double v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 55);
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HTPrefs: Sentry Enablement Settings changed from %d -> %d", (uint8_t *)v9, 0xEu);
  }
}

void sub_100025F44(uint64_t a1)
{
  uint64_t v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed", (uint8_t *)v9, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(unsigned __int8 *)(v3 + 56);
  unint64_t v5 = (__CFString *)*(id *)(v3 + 392);
  double v6 = (void *)CFPreferencesCopyValue(@"allowWorkflowResponsivenessEnablement", v5, @"mobile", kCFPreferencesAnyHost);
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = [v6 BOOLValue];
  double v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "HTPrefs: Workflow Responsiveness Monitoring Enablement Settings changed from %d -> %d", (uint8_t *)v9, 0xEu);
  }
}

void sub_100026C7C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_100026CC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100026CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, double a7)
{
  if (qword_1000643C0 != -1) {
    dispatch_once(&qword_1000643C0, &stru_100051F20);
  }
  id v14 = sub_100027DEC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316418;
    uint64_t v19 = a1;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = a4;
    __int16 v24 = 2048;
    double v25 = a7;
    __int16 v26 = 1024;
    int v27 = a6;
    __int16 v28 = 1024;
    BOOL v29 = a4 == 0x7FFFFFFFFFFFFFFFLL;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sendHangToHUD: bundleID = %s, startTime=%llu, endTime=%llu, elapsedTimeMS=%f, timed out: %{BOOL}d (is over: %{BOOL}d)", buf, 0x36u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026E90;
  v15[3] = &unk_100051E60;
  *(double *)&v15[4] = a7;
  char v16 = a5;
  v15[5] = a1;
  v15[6] = a3;
  v15[7] = a4;
  v15[8] = a2;
  char v17 = a6;
  dispatch_async((dispatch_queue_t)qword_100064398, v15);
}

void sub_100026E90(uint64_t a1)
{
  sub_100027218();
  uint64_t v2 = (void *)(a1 + 32);
  double v3 = *(double *)(a1 + 32);
  uint64_t v4 = +[HTPrefs sharedPrefs];
  double v5 = (double)[v4 hudThresholdMSec];

  if (v3 > v5)
  {
    double v6 = +[NSString stringWithUTF8String:*(void *)(a1 + 40)];
    double v7 = [v6 componentsSeparatedByString:@"."];
    int v8 = [v7 objectAtIndexedSubscript:[v7 count] - 1];
    if (sub_10002B884())
    {
      uint64_t v9 = &stru_100053108;
    }
    else
    {
      __int16 v10 = +[NSString stringWithFormat:@"%.0f", *v2];
      if ((unint64_t)[v10 length] <= 3)
      {
        uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%*s%@", 4 - [v10 length], "", v10);

        __int16 v10 = (void *)v11;
      }
      id v12 = [v8 stringByPaddingToLength:(16 - [v10 length]) withString:@" " startingAtIndex:0];
      CFStringRef v13 = v12;
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v14 = [v12 stringByReplacingCharactersInRange:NSMakeRange([v12 length] - 1, 1) withString:@"*"];

        CFStringRef v13 = (void *)v14;
      }
      CFStringRef v15 = +[NSMutableString stringWithString:@"|"];
      double v16 = *(double *)v2 / 200.0;
      if (v16 > 100.0)
      {
        char v17 = sub_100027DEC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_100032C90((uint64_t *)(a1 + 32), v17, v16);
        }

        double v16 = 100.0;
      }
      int v18 = (int)v16;
      if ((int)v16 >= 1)
      {
        do
        {
          [v15 appendString:@"-"];
          --v18;
        }
        while (v18);
      }
      uint64_t v9 = +[NSString stringWithFormat:@"%@ %@ms%@", v13, v10, v15];
    }
    uint64_t v19 = [HTHangHUDInfo alloc];
    LOBYTE(v25) = *(unsigned char *)(a1 + 73);
    __int16 v20 = [(HTHangHUDInfo *)v19 initWithHangStartTime:*(void *)(a1 + 48) hangEndTime:*(void *)(a1 + 56) receivedTimestamp:*(void *)(a1 + 64) hangDurationMS:v9 hudString:v8 shortenedBundle:v6 bundleId:*(double *)(a1 + 32) timedOut:v25];
    uint64_t v21 = [(HTHangHUDInfo *)v20 getHangHUDInfoKey];
    [(id)qword_1000643A0 setObject:v20 forKeyedSubscript:v21];
    dword_1000643A8 = 0;
    __int16 v22 = sub_100027DEC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      int v27 = v8;
      __int16 v28 = 2048;
      uint64_t v29 = v23;
      __int16 v30 = 2048;
      uint64_t v31 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "HTHUD: received updated hang info: bundle=%@, elapsedtime_ms=%f (so far), starttime_matu=%llu", buf, 0x20u);
    }
  }
}

void sub_100027218()
{
  if ((sub_10002B9CC() & 1) == 0
    && sub_10002B884()
    && (!qword_1000643B0 || ([(id)qword_1000643B0 isValid] & 1) == 0))
  {
    int v0 = sub_100027DEC();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Hud context is nil or no longer valid: re-creating", v4, 2u);
    }

    [(id)qword_1000643B0 invalidate];
    uint64_t v1 = [HUDContext alloc];
    uint64_t v2 = [(HUDContext *)v1 initWithQueue:qword_100064398];
    double v3 = (void *)qword_1000643B0;
    qword_1000643B0 = (uint64_t)v2;
  }
}

void sub_1000272D0()
{
  int v0 = +[HTPrefs sharedPrefs];
  unsigned int v1 = [v0 shouldUpdateHangsHUD];

  if (v1)
  {
    if (qword_1000643C0 != -1) {
      dispatch_once(&qword_1000643C0, &stru_100051F20);
    }
    uint64_t v2 = qword_100064398;
    dispatch_async(v2, &stru_100051E80);
  }
}

void sub_100027364(id a1)
{
  sub_100027218();
  if ((sub_10002B9CC() & 1) == 0 && sub_10002B884() && byte_1000643AC == 1)
  {
    [(id)qword_1000643B0 clearBundleNameCache];
    byte_1000643AC = 0;
  }
  if ([(id)qword_1000643A0 count])
  {
    uint64_t v1 = mach_absolute_time();
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v2 = [(id)qword_1000643A0 allKeys];
    id v3 = [v2 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v72;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v72 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          int v8 = [(id)qword_1000643A0 objectForKeyedSubscript:v7];
          id v9 = [v8 receivedTimestamp];

          __int16 v10 = [(id)qword_1000643A0 objectForKeyedSubscript:v7];
          id v11 = [v10 hangEndTime];

          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v12 = [(id)qword_1000643A0 objectForKeyedSubscript:v7];
            id v9 = [v12 hangEndTime];
          }
          double v13 = sub_10002A984(v1 - (void)v9);
          if (v13 >= 5000.0)
          {
            double v14 = v13;
            if ((sub_10002B9CC() & 1) != 0 || !sub_10002B884()) {
              unsigned int v15 = 0;
            }
            else {
              unsigned int v15 = [(id)qword_1000643B0 hangHasPendingAnimation:v7] ^ 1;
            }
            if ((sub_10002B9CC() & 1) != 0 || (v15 | sub_10002B884() ^ 1) == 1)
            {
              double v16 = sub_100027DEC();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                int v61 = [(id)qword_1000643A0 objectForKeyedSubscript:v7];
                int v18 = [v61 shortenedBundle];
                uint64_t v19 = [(id)qword_1000643A0 objectForKeyedSubscript:v7];
                id v20 = [v19 hangStartTime];
                *(_DWORD *)long long buf = 138412802;
                int v78 = v18;
                __int16 v79 = 2048;
                id v80 = v20;
                __int16 v81 = 2048;
                double v82 = v14;
                _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "HTHUD: hang removed from hud: bundle=%@, starttime_matu=%llu, age_ms=%f", buf, 0x20u);
              }
              [(id)qword_1000643A0 removeObjectForKey:v7];
              dword_1000643A8 = 0;
            }
            else
            {
              char v17 = sub_100027DEC();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                int v78 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Not removing hang since an animation is in progress %@", buf, 0xCu);
              }
            }
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v4);
    }

    if (sub_10002B884())
    {
      int v21 = sub_10002B9CC();
      sub_10002BA70(v21);
      if (v21)
      {
        __int16 v22 = sub_100027DEC();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_100032D24(v22, v23, v24, v25, v26, v27, v28, v29);
        }

        id v30 = objc_alloc((Class)NSDictionary);
        id v31 = [v30 initWithDictionary:qword_1000643A0];
        uint64_t v32 = +[HangHUDClient sharedInstance];
        [v32 sendHangHUDInfo:v31 completion:&stru_100051EA0];
      }
      else
      {
        [(id)qword_1000643B0 updateHangs:qword_1000643A0 withCompletion:&stru_100051EC0];
      }
    }
    else if (dword_1000643A8 <= 2)
    {
      ++dword_1000643A8;
      uint64_t v33 = [(id)qword_1000643A0 allKeys];
      id v34 = [v33 sortedArrayUsingSelector:"compare:"];

      id v35 = objc_alloc_init((Class)NSMutableArray);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      int v59 = v34;
      int v36 = [v34 reverseObjectEnumerator];
      id v37 = [v36 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v37)
      {
        id v38 = v37;
        int v39 = 0;
        uint64_t v40 = *(void *)v68;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(void *)v68 != v40) {
              objc_enumerationMutation(v36);
            }
            if (v39 <= 4)
            {
              [v35 addObject:*(void *)(*((void *)&v67 + 1) + 8 * (void)j)];
              ++v39;
            }
          }
          id v38 = [v36 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v38);
      }

      long long v42 = v35;
      if (byte_1000643B8) {
        int v43 = @"\n\n";
      }
      else {
        int v43 = &stru_100053108;
      }
      int v62 = +[NSMutableArray array];
      uint64_t v58 = v42;
      [v42 sortedArrayUsingSelector:"compare:"];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      obj = long long v66 = 0u;
      id v44 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v44)
      {
        id v45 = v44;
        ssize_t v46 = &ADClientAddValueForScalarKey_ptr;
        uint64_t v47 = *(void *)v64;
        do
        {
          for (k = 0; k != v45; k = (char *)k + 1)
          {
            if (*(void *)v64 != v47) {
              objc_enumerationMutation(obj);
            }
            uint64_t v49 = *(void *)(*((void *)&v63 + 1) + 8 * (void)k);
            if ([(__CFString *)v43 length])
            {
              int v50 = [(__CFString *)v43 stringByAppendingString:@"\n"];
            }
            else
            {
              int v50 = v43;
            }
            int v51 = [(id)qword_1000643A0 objectForKeyedSubscript:v49];
            uint64_t v52 = [v51 hudString];
            uint64_t v53 = [v46[291] stringWithUTF8String:">"];
            double v54 = sub_10002A984(v1 - (void)[v51 receivedTimestamp]);
            if ([v51 hangEndTime] != (id)0x7FFFFFFFFFFFFFFFLL || v54 > 50.0)
            {
              uint64_t v56 = [v46[291] stringWithUTF8String:"|"];

              uint64_t v53 = (void *)v56;
            }
            uint64_t v57 = [v52 stringByAppendingString:v53];

            int v43 = [v50 stringByAppendingString:v57];

            [v62 addObject:v51];
            ssize_t v46 = &ADClientAddValueForScalarKey_ptr;
          }
          id v45 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v45);
        int v43 = v43;
        id v44 = [(__CFString *)v43 UTF8String];
      }
      sub_100027B18((uint64_t)v44);
    }
  }
}

void sub_100027A64(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      uint64_t v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sendHangData did not complete. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100027B18(uint64_t a1)
{
  mach_port_name_t ServerPort = CARenderServerGetServerPort();
  if (ServerPort)
  {
    mach_port_name_t v3 = ServerPort;
    if (!a1)
    {
      uint64_t v5 = sub_100027DEC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100032D5C(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    CARenderServerSetDebugMessage();
    mach_port_deallocate(mach_task_self_, v3);
  }
  else
  {
    int v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to get render server port!", v13, 2u);
    }
  }
}

void sub_100027BF4()
{
  if (qword_100064398) {
    dispatch_async((dispatch_queue_t)qword_100064398, &stru_100051EE0);
  }
}

void sub_100027C10(id a1)
{
  byte_1000643AC = 1;
}

void sub_100027C20()
{
  [(id)qword_1000643A0 removeAllObjects];
  int v0 = qword_100064398;

  dispatch_async(v0, &stru_100051F00);
}

void sub_100027C60(id a1)
{
}

void sub_100027C70(id a1)
{
  uint64_t v1 = sub_100027DEC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100032D94(v1, v2, v3, v4, v5, v6, v7, v8);
  }

  id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  uint64_t v10 = (void *)qword_1000643A0;
  qword_1000643A0 = (uint64_t)v9;

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.hangtracer.hud_update_queue", 0);
  uint64_t v12 = (void *)qword_100064398;
  qword_100064398 = (uint64_t)v11;

  int v13 = MGGetBoolAnswer();
  double v14 = (void *)MGCopyAnswer();
  if ([v14 containsString:@"iPhone"] && v13) {
    byte_1000643B8 = 1;
  }
  unsigned int v15 = sub_100027DEC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16[0] = 67109634;
    v16[1] = v13;
    __int16 v17 = 2112;
    int v18 = v14;
    __int16 v19 = 1024;
    int v20 = byte_1000643B8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setupHangHUD: pearlDevice = %i and deviceClass = %@ => shouldLowerHUD = %i", (uint8_t *)v16, 0x18u);
  }
}

id sub_100027DEC()
{
  if (qword_1000643D0 != -1) {
    dispatch_once(&qword_1000643D0, &stru_100051F40);
  }
  int v0 = (void *)qword_1000643C8;

  return v0;
}

void sub_100027E40(id a1)
{
  qword_1000643C8 = (uint64_t)os_log_create("com.apple.hangtracer", "");

  _objc_release_x1();
}

void sub_100027F80(id a1)
{
  qword_1000643D8 = objc_alloc_init(HUDAnimator);

  _objc_release_x1();
}

void sub_1000280EC(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(HUDAnimation);
  [(HUDAnimation *)v3 setFromValue:*(double *)(a1 + 64)];
  [(HUDAnimation *)v3 setToValue:*(double *)(a1 + 72)];
  [(HUDAnimation *)v3 setStartTime:CACurrentMediaTime()];
  [(HUDAnimation *)v3 startTime];
  [(HUDAnimation *)v3 setEndTime:v2 + *(double *)(a1 + 80)];
  [(HUDAnimation *)v3 setUpdateBlock:*(void *)(a1 + 48)];
  [(HUDAnimation *)v3 setCompletionBlock:*(void *)(a1 + 56)];
  [(HUDAnimation *)v3 setIdentifier:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v3];
}

void sub_100028260(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_1000283F8;
  v10[3] = &unk_100051FB0;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 indexOfObjectPassingTest:v10];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v3];
    uint64_t v6 = objc_alloc_init(HUDAnimation);
    double v7 = CACurrentMediaTime();
    [v5 valueAtTime:];
    -[HUDAnimation setFromValue:](v6, "setFromValue:");
    [(HUDAnimation *)v6 setToValue:*(double *)(a1 + 48)];
    [(HUDAnimation *)v6 setStartTime:v7];
    [(HUDAnimation *)v6 setEndTime:v7 + *(double *)(a1 + 56)];
    uint64_t v8 = [v5 updateBlock];
    [(HUDAnimation *)v6 setUpdateBlock:v8];

    id v9 = [v5 completionBlock];
    [(HUDAnimation *)v6 setCompletionBlock:v9];

    [(HUDAnimation *)v6 setRetargeted:1];
    [(HUDAnimation *)v6 setIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v4 withObject:v6];
  }
}

id sub_1000283F8(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000284D4(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100028664;
  v9[3] = &unk_100051FB0;
  id v10 = *(id *)(a1 + 40);
  id v3 = [v2 indexOfObjectPassingTest:v9];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v3];
    uint64_t v6 = objc_alloc_init(HUDAnimation);
    [v5 fromValue];
    -[HUDAnimation setFromValue:](v6, "setFromValue:");
    [v5 toValue];
    -[HUDAnimation setToValue:](v6, "setToValue:");
    [v5 startTime];
    -[HUDAnimation setStartTime:](v6, "setStartTime:");
    [v5 endTime];
    -[HUDAnimation setEndTime:](v6, "setEndTime:");
    double v7 = [v5 updateBlock];
    [(HUDAnimation *)v6 setUpdateBlock:v7];

    uint64_t v8 = [v5 completionBlock];
    [(HUDAnimation *)v6 setCompletionBlock:v8];

    [(HUDAnimation *)v6 setCanceled:1];
    [(HUDAnimation *)v6 setIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v4 withObject:v6];
  }
}

id sub_100028664(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_10002871C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    if (!*(void *)(*(void *)(a1 + 32) + 24))
    {
      uint64_t v2 = +[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:");
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = objc_alloc((Class)NSThread);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      void v7[2] = sub_100028830;
      void v7[3] = &unk_100051280;
      void v7[4] = *(void *)(a1 + 32);
      id v6 = [v5 initWithBlock:v7];
      CAFrameRateRange v8 = CAFrameRateRangeMake(30.0, 30.0, 30.0);
      [*(id *)(*(void *)(a1 + 32) + 24) setPreferredFrameRateRange:v8.minimum, v8.maximum, v8.preferred];
      [v6 setQualityOfService:33];
      [v6 setName:@"com.apple.hangtracerd.HUDAnimator"];
      [v6 start];
    }
  }
}

void sub_100028830(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = +[NSRunLoop currentRunLoop];
  [v1 addToRunLoop:v2 forMode:NSDefaultRunLoopMode];

  id v3 = +[NSRunLoop currentRunLoop];
  [v3 run];
}

void sub_100028AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028B00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028B10(uint64_t a1)
{
}

void sub_100028B18(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) indexesOfObjectsPassingTest:&stru_100052018];
  uint64_t v3 = [*(id *)(a1[4] + 8) objectsAtIndexes:v2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1[4] + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028C78;
  v11[3] = &unk_100052038;
  v11[4] = a1[8];
  double v7 = [v6 indexesOfObjectsPassingTest:v11];
  if ([v7 count])
  {
    uint64_t v8 = [*(id *)(a1[4] + 8) objectsAtIndexes:v7];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1[4] + 8) removeObjectsAtIndexes:v7];
    if (![*(id *)(a1[4] + 8) count]) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
}

BOOL sub_100028C58(id a1, HUDAnimation *a2, unint64_t a3, BOOL *a4)
{
  return ![(HUDAnimation *)a2 canceled];
}

uint64_t sub_100028C78(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 endTime];
  if (v4 <= *(double *)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = (uint64_t)[v3 canceled];
  }

  return v5;
}

void sub_100028CCC(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 updateBlock];
        [v7 valueAtTime:*(double *)(a1 + 48)];
        v8[2](v8);
      }
      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
        unsigned int v15 = [v14 completionBlock:v17];

        if (v15)
        {
          double v16 = [v14 completionBlock];
          ((void (**)(void, void, id))v16)[2](v16, [v14 canceled] ^ 1, [v14 retargeted]);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
}

void sub_100028EE0(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;
  }
}

id sub_1000290B4()
{
  if (qword_1000643F0 != -1) {
    dispatch_once(&qword_1000643F0, &stru_1000520A8);
  }
  int v0 = (void *)qword_1000643E8;

  return v0;
}

void sub_100029108(id a1)
{
  qword_1000643E8 = (uint64_t)os_log_create("com.apple.HangHUD", "");

  _objc_release_x1();
}

id sub_1000292F8(unsigned int a1)
{
  if (a1 >= 0x2A)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000520C8 + (char)a1);
  }

  return v1;
}

id sub_100029364(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    id v3 = *(&off_100052218 + v1);
  }
  else
  {
    uint64_t v2 = sub_1000292F8(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_1000293E4(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F)
  {
    char v1 = +[NSString stringWithFormat:@"SIG%d", a1];
  }
  else
  {
    char v1 = *(&off_100052348 + (int)a1 - 1);
  }

  return v1;
}

id sub_10002944C(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    char v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    char v1 = *(&off_100052440 + (int)a1);
  }

  return v1;
}

id sub_1000294B0(uint64_t a1)
{
  int v1 = a1 - 2;
  if (a1 - 2) < 0xE && ((0x2655u >> v1))
  {
    id v3 = *(&off_1000524C0 + v1);
  }
  else
  {
    uint64_t v2 = sub_10002944C(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *sub_100029524(uint64_t a1)
{
  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          uint64_t v2 = @"thermal pressure";
          return v2;
        case 3306925313:
          uint64_t v2 = @"cpu violation";
          return v2;
        case 3306925314:
          uint64_t v2 = @"walltime violation";
          return v2;
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user quit";
        return v2;
      }
      if (a1 == 4227595259)
      {
        uint64_t v2 = @"force quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3306925315)
      {
        uint64_t v2 = @"system busy";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
LABEL_62:
    uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a1];
    return v2;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        uint64_t v2 = @"application assertion";
        return v2;
      case 439025681:
        uint64_t v2 = @"input ui scene";
        return v2;
      case 732775916:
        uint64_t v2 = @"secure draw violation";
        return v2;
    }
    goto LABEL_62;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      uint64_t v2 = @"legacy clear the board";
      return v2;
    }
    if (a1 == 2343432205)
    {
      uint64_t v2 = @"watchdog";
      return v2;
    }
    goto LABEL_62;
  }
  if (a1 != 1539435073)
  {
    if (a1 == 1539435076)
    {
      uint64_t v2 = @"clear the board";
      return v2;
    }
    goto LABEL_62;
  }
  uint64_t v2 = @"languages changed";
  return v2;
}

__CFString *sub_1000297EC(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 != 1539435077)
    {
      if (a1 == 3306925313)
      {
        uint64_t v1 = @"CPU Violation";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v1 = @"Legacy Clear the Board";
  }
  else
  {
    if (a1 != 439025681)
    {
      if (a1 == 1539435076)
      {
        uint64_t v1 = @"Clear the Board";
        goto LABEL_11;
      }
LABEL_8:
      uint64_t v2 = sub_100029524(a1);
      uint64_t v1 = [v2 capitalizedString];

      goto LABEL_11;
    }
    uint64_t v1 = @"InputUI Scene";
  }
LABEL_11:

  return v1;
}

id sub_1000298B8(uint64_t a1)
{
  if ((a1 - 1) >= 4)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    uint64_t v1 = *(&off_100052530 + (int)a1 - 1);
  }

  return v1;
}

id sub_100029920(uint64_t a1)
{
  uint64_t v1 = sub_1000298B8(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

id sub_10002996C(uint64_t a1)
{
  if ((a1 - 1) >= 0x13)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    uint64_t v1 = *(&off_100052550 + (int)a1 - 1);
  }

  return v1;
}

id sub_1000299D4(uint64_t a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 0x13 && ((0x55F7Fu >> v1))
  {
    id v3 = *(&off_1000525E8 + v1);
  }
  else
  {
    uint64_t v2 = sub_10002996C(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_100029A4C(uint64_t a1)
{
  if ((a1 - 1) >= 5)
  {
    int v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    int v1 = *(&off_100052680 + (int)a1 - 1);
  }

  return v1;
}

__CFString *sub_100029AB4(uint64_t a1)
{
  if (a1 == 5)
  {
    int v1 = @"JIT";
  }
  else
  {
    uint64_t v2 = sub_100029A4C(a1);
    int v1 = [v2 capitalizedString];
  }

  return v1;
}

id sub_100029B14(uint64_t a1)
{
  if ((a1 - 1) >= 9)
  {
    int v1 = +[NSString stringWithFormat:@"%u", a1];
  }
  else
  {
    int v1 = *(&off_1000526A8 + (int)a1 - 1);
  }

  return v1;
}

__CFString *sub_100029B7C(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      uint64_t v2 = sub_100029B14(a1);
      int v1 = [v2 capitalizedString];

      break;
  }

  return v1;
}

id sub_100029C04(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1))
  {
    uint64_t v2 = *(&off_1000526F0 + v1);
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }

  return v2;
}

id sub_100029C78(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 7 && ((0x47u >> v1))
  {
    id v3 = *(&off_100052738 + v1);
  }
  else
  {
    uint64_t v2 = sub_100029C04(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *sub_100029CEC(uint64_t a1)
{
  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      switch(a1)
      {
        case 0:
          uint64_t v2 = @"none";
          return v2;
        case 97132013:
          uint64_t v2 = @"conditions changed";
          return v2;
        case 562215597:
          uint64_t v2 = @"assertion timeout";
          return v2;
      }
    }
    else
    {
      if (a1 <= 562215635)
      {
        if (a1 == 562215634)
        {
          uint64_t v2 = @"background task assertion timeout";
        }
        else
        {
          uint64_t v2 = @"background url session completion timeout";
        }
        return v2;
      }
      if (a1 == 562215636)
      {
        uint64_t v2 = @"background fetch completion timeout";
        return v2;
      }
      if (a1 == 732775916)
      {
        uint64_t v2 = @"security violation";
        return v2;
      }
    }
LABEL_66:
    uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a1];
    return v2;
  }
  if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        uint64_t v2 = @"termination assertion";
        return v2;
      }
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user initiated quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3490524077)
      {
        uint64_t v2 = @"max assertions violation";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
    goto LABEL_66;
  }
  if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      uint64_t v2 = @"process exited";
      return v2;
    }
    if (a1 == 3221229823)
    {
      uint64_t v2 = @"thermal pressure";
      return v2;
    }
    goto LABEL_66;
  }
  if (a1 != 2343432205)
  {
    if (a1 == 2970405393)
    {
      uint64_t v2 = @"max states violation";
      return v2;
    }
    goto LABEL_66;
  }
  uint64_t v2 = @"watchdog violation";
  return v2;
}

__CFString *sub_100029FE4(uint64_t a1)
{
  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      goto LABEL_13;
    }
    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a1)
    {
      case 2970405393:
        uint64_t v1 = @"Maximum States Violation";
        goto LABEL_13;
      case 3490524077:
        uint64_t v1 = @"Maximum Assertions Violation";
        goto LABEL_13;
      case 3735943697:
        uint64_t v1 = @"User-Initiated Quit";
        goto LABEL_13;
    }
  }
  uint64_t v2 = sub_100029CEC(a1);
  uint64_t v1 = [v2 capitalizedString];

LABEL_13:

  return v1;
}

id sub_10002A0C0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%llu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_100052770 + a1 - 1);
  }

  return v1;
}

id sub_10002A128(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1))
  {
    id v3 = *(&off_100052798 + v1);
  }
  else
  {
    uint64_t v2 = sub_10002A0C0(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_10002A19C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%llu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000527C0 + a1 - 1);
  }

  return v1;
}

id sub_10002A204(uint64_t a1)
{
  uint64_t v1 = sub_10002A19C(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *sub_10002A250(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"service timeout";
      break;
    case 1001:
      uint64_t v2 = @"chronokit";
      break;
    case 2:
      uint64_t v2 = @"timeout no diags";
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
      break;
  }
  return v2;
}

__CFString *sub_10002A2FC(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }
  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }
  else
  {
    uint64_t v2 = sub_10002A250(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

__CFString *sub_10002A370(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"api violation";
  }
  else if (a1 == 2)
  {
    uint64_t v2 = @"internal error";
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }
  return v2;
}

__CFString *sub_10002A3FC(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }
  else
  {
    uint64_t v2 = sub_10002A370(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

id sub_10002A45C(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1))
  {
    uint64_t v2 = *(&off_1000527D8 + v1);
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }

  return v2;
}

id sub_10002A4D4(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if (unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1))
  {
    id v3 = *(&off_100052880 + v1);
  }
  else
  {
    uint64_t v2 = sub_10002A45C(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_10002A548(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_10002944C(a2);
      break;
    case 2:
      uint64_t v2 = sub_1000293E4(a2);
      break;
    case 3:
      uint64_t v2 = sub_1000298B8(a2);
      break;
    case 6:
      uint64_t v2 = sub_100029C04(a2);
      break;
    case 7:
      uint64_t v2 = sub_100029B14(a2);
      break;
    case 9:
      uint64_t v2 = sub_10002996C(a2);
      break;
    case 10:
      uint64_t v2 = sub_100029524(a2);
      break;
    case 15:
      uint64_t v2 = sub_100029CEC(a2);
      break;
    case 18:
      uint64_t v2 = sub_10002A128(a2);
      break;
    case 20:
      uint64_t v2 = sub_10002A250(a2);
      break;
    case 22:
      uint64_t v2 = sub_10002A370(a2);
      break;
    case 23:
      uint64_t v2 = sub_100029A4C(a2);
      break;
    case 27:
      uint64_t v2 = sub_10002A19C(a2);
      break;
    case 32:
      uint64_t v2 = sub_10002A45C(a2);
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%llu", a2];
      break;
  }

  return v2;
}

id sub_10002A71C(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_1000294B0(a2);
      break;
    case 2:
      uint64_t v2 = sub_1000293E4(a2);
      break;
    case 3:
      uint64_t v2 = sub_100029920(a2);
      break;
    case 6:
      uint64_t v2 = sub_100029C78(a2);
      break;
    case 7:
      uint64_t v2 = sub_100029B7C(a2);
      break;
    case 9:
      uint64_t v2 = sub_1000299D4(a2);
      break;
    case 10:
      uint64_t v2 = sub_1000297EC(a2);
      break;
    case 15:
      uint64_t v2 = sub_100029FE4(a2);
      break;
    case 18:
      uint64_t v2 = sub_10002A128(a2);
      break;
    case 20:
      uint64_t v2 = sub_10002A2FC(a2);
      break;
    case 22:
      uint64_t v2 = sub_10002A3FC(a2);
      break;
    case 23:
      uint64_t v2 = sub_100029AB4(a2);
      break;
    case 27:
      uint64_t v2 = sub_10002A204(a2);
      break;
    case 32:
      uint64_t v2 = sub_10002A4D4(a2);
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a2];
      break;
  }

  return v2;
}

double sub_10002A8F0()
{
  if (qword_100064400 != -1) {
    dispatch_once(&qword_100064400, &stru_1000528D8);
  }
  return *(double *)&qword_1000643F8;
}

void sub_10002A934(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_1000643F8 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_10002A984(unint64_t a1)
{
  if (qword_100064400 != -1) {
    dispatch_once(&qword_100064400, &stru_1000528D8);
  }
  return *(double *)&qword_1000643F8 * (double)a1;
}

double sub_10002A9DC(unint64_t a1)
{
  if (qword_100064400 != -1) {
    dispatch_once(&qword_100064400, &stru_1000528D8);
  }
  return *(double *)&qword_1000643F8 * (double)a1 / 1000.0;
}

double sub_10002AA40(unint64_t a1)
{
  if (qword_100064400 != -1) {
    dispatch_once(&qword_100064400, &stru_1000528D8);
  }
  return (double)a1 / *(double *)&qword_1000643F8;
}

void sub_10002AAA4(id a1)
{
  byte_100064410 = MGGetBoolAnswer();
}

void sub_10002AACC(id a1)
{
  byte_100064420 = MGGetSInt32Answer() == 3;
}

void sub_10002AB00(id a1)
{
  byte_100064430 = MGGetSInt32Answer() == 6;
}

void sub_10002AB34(id a1)
{
  byte_100064440 = MGGetSInt32Answer() == 4;
}

void sub_10002AB68(id a1)
{
  byte_100064450 = MGGetSInt32Answer() == 11;
}

double sub_10002AB9C()
{
  if (qword_100064438 != -1) {
    dispatch_once(&qword_100064438, &stru_100052958);
  }
  if (byte_100064440)
  {
    int v0 = +[CADisplay mainDisplay];
    [v0 bounds];
    if (v1 <= 1920.0) {
      double v2 = 28.0;
    }
    else {
      double v2 = 42.0;
    }
  }
  else
  {
    if (qword_100064428 != -1) {
      dispatch_once(&qword_100064428, &stru_100052938);
    }
    if (byte_100064430)
    {
      double v3 = sub_10002ACE4();
      if (v3 > 170.0 || v3 < 1.0) {
        return 24.0;
      }
      else {
        return 22.0;
      }
    }
    else
    {
      if (qword_100064448 != -1) {
        dispatch_once(&qword_100064448, &stru_100052978);
      }
      double v2 = 22.0;
      if (!byte_100064450)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 3.0) {
          return 40.0;
        }
        else {
          return 28.0;
        }
      }
    }
  }
  return v2;
}

double sub_10002ACE4()
{
  double result = *(double *)&qword_100064478;
  if (*(double *)&qword_100064478 <= 0.0)
  {
    if (qword_100064438 != -1) {
      dispatch_once(&qword_100064438, &stru_100052958);
    }
    int v1 = byte_100064440;
    double v2 = +[CADisplay mainDisplay];
    [v2 bounds];
    double v4 = fmax(v3, 1920.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_100064478 = *(void *)&v4;

    double result = *(double *)&qword_100064478 / -[HUDLine contentScaleForTexts]_0();
    qword_100064478 = *(void *)&result;
  }
  return result;
}

void sub_10002AE44()
{
  if (*(double *)&qword_100064458 <= 0.0)
  {
    double v0 = sub_10002AB9C();
    *(double *)&qword_100064458 = v0 / -[HUDLine contentScaleForTexts]_0();
  }
}

double sub_10002AE8C()
{
  double v0 = *(double *)&qword_100064460;
  if (*(double *)&qword_100064460 > 0.0) {
    return v0;
  }
  int v1 = +[CADisplay mainDisplay];
  double v2 = [v1 currentOrientation];

  if (qword_100064428 != -1) {
    dispatch_once(&qword_100064428, &stru_100052938);
  }
  double v3 = 20.0;
  if (!byte_100064430)
  {
    if (qword_100064418 != -1) {
      dispatch_once(&qword_100064418, &stru_100052918);
    }
    double v3 = 50.0;
    if (!byte_100064420
      && v2 != (void *)kCADisplayOrientationRotation270
      && v2 != (void *)kCADisplayOrientationRotation90)
    {
      if (qword_1000644D8 != -1) {
        dispatch_once(&qword_1000644D8, &stru_100052AB8);
      }
      if (byte_1000644E0)
      {
        *(double *)&uint64_t v6 = 168.0;
LABEL_18:
        double v3 = *(double *)&v6;
        goto LABEL_5;
      }
      if (qword_100064408 != -1) {
        dispatch_once(&qword_100064408, &stru_1000528F8);
      }
      if (byte_100064410)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 2.0)
        {
          *(double *)&uint64_t v6 = 100.0;
          goto LABEL_18;
        }
        if (qword_100064408 != -1) {
          dispatch_once(&qword_100064408, &stru_1000528F8);
        }
      }
      if (byte_100064410 && -[HUDLine contentScaleForTexts]_0() == 3.0)
      {
        double v3 = 150.0;
      }
      else
      {
        if (qword_100064438 != -1) {
          dispatch_once(&qword_100064438, &stru_100052958);
        }
        int v7 = byte_100064440;
        double v8 = -[HUDLine contentScaleForTexts]_0();
        if (v7) {
          double v3 = dbl_10003B160[v8 > 1.0];
        }
        else {
          double v3 = v8 * 25.0;
        }
      }
    }
  }
LABEL_5:
  qword_100064460 = *(void *)&v3;
  *(double *)&qword_100064460 = v3 / -[HUDLine contentScaleForTexts]_0();
  double v4 = sub_100027DEC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100032DCC((uint64_t)v2, v4);
  }

  double v0 = *(double *)&qword_100064460;
  return v0;
}

void sub_10002B108()
{
  if (*(double *)&qword_100064468 <= 0.0)
  {
    if (qword_100064408 != -1) {
      dispatch_once(&qword_100064408, &stru_1000528F8);
    }
    double v0 = 25.0;
    if (!byte_100064410) {
      double v0 = sub_10002AE8C();
    }
    qword_100064468 = *(void *)&v0;
  }
}

double sub_10002B174()
{
  double result = *(double *)&qword_100064470;
  if (*(double *)&qword_100064470 <= 0.0)
  {
    if (qword_100064428 != -1) {
      dispatch_once(&qword_100064428, &stru_100052938);
    }
    double v1 = 5.0;
    if (!byte_100064430)
    {
      double v2 = -[HUDLine contentScaleForTexts]_0();
      if (qword_100064418 != -1)
      {
        double v4 = v2;
        dispatch_once(&qword_100064418, &stru_100052918);
        double v2 = v4;
      }
      double v3 = 10.0;
      if (!byte_100064420) {
        double v3 = 8.0;
      }
      double v1 = v2 * v3;
    }
    qword_100064470 = *(void *)&v1;
    double result = v1 / -[HUDLine contentScaleForTexts]_0();
    qword_100064470 = *(void *)&result;
  }
  return result;
}

double sub_10002B244()
{
  double result = *(double *)&qword_100064480;
  if (*(double *)&qword_100064480 <= 0.0)
  {
    if (qword_100064438 != -1) {
      dispatch_once(&qword_100064438, &stru_100052958);
    }
    int v1 = byte_100064440;
    double v2 = +[CADisplay mainDisplay];
    [v2 bounds];
    double v4 = fmax(v3, 1080.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_100064480 = *(void *)&v4;

    double result = *(double *)&qword_100064480 / -[HUDLine contentScaleForTexts]_0();
    qword_100064480 = *(void *)&result;
  }
  return result;
}

void sub_10002B2EC()
{
  if (*(double *)&qword_100064490 <= 0.0)
  {
    double v0 = sub_10002ACE4();
    double v1 = fmin(v0, sub_10002B244());
    sub_10002B108();
    *(double *)&qword_100064490 = v1 + v2 * -2.0;
  }
}

double sub_10002B340()
{
  if (qword_100064498 != -1) {
    dispatch_once(&qword_100064498, &stru_100052998);
  }
  return *(double *)&qword_1000644A0;
}

void sub_10002B384(id a1)
{
  if (qword_100064428 != -1) {
    dispatch_once(&qword_100064428, &stru_100052938);
  }
  double v1 = 2.0;
  if (!byte_100064430) {
    double v1 = 20.0;
  }
  qword_1000644A0 = *(void *)&v1;
  *(double *)&qword_1000644A0 = v1 / -[HUDLine contentScaleForTexts]_0();
}

double sub_10002B3F8()
{
  if (qword_1000644A8 != -1) {
    dispatch_once(&qword_1000644A8, &stru_1000529B8);
  }
  return *(double *)&qword_1000644B0;
}

void sub_10002B43C(id a1)
{
  if (qword_100064428 != -1) {
    dispatch_once(&qword_100064428, &stru_100052938);
  }
  double v1 = 2.0;
  if (!byte_100064430) {
    double v1 = 20.0;
  }
  qword_1000644B0 = *(void *)&v1;
  *(double *)&qword_1000644B0 = v1 / -[HUDLine contentScaleForTexts]_0();
}

void sub_10002B4B0()
{
  qword_100064460 = 0;
  qword_100064468 = 0;
  qword_100064490 = 0;
}

void sub_10002B4CC()
{
  qword_100064458 = 0;
  qword_100064460 = 0;
  qword_100064468 = 0;
  qword_100064470 = 0;
  qword_100064478 = 0;
  qword_100064480 = 0;
  qword_100064488 = 0;
  qword_100064490 = 0;
}

uint64_t sub_10002B510(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  double v6 = sub_10002A984(a2 - (void)[v5 receivedTimestamp]);
  int v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    double v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "durationSinceLastUpdateMs: %f", (uint8_t *)&v11, 0xCu);
  }

  if ([v5 hangEndTime] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= a3)
    {
      uint64_t v8 = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  double v9 = sub_10002A984(a2 - (void)[v5 hangEndTime]);
  uint64_t v8 = 1;
  if (v9 >= 200.0 && v6 > a3) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

id sub_10002B63C(void *a1, unsigned int a2)
{
  double v3 = [a1 keysSortedByValueWithOptions:0 usingComparator:&stru_1000529F8];
  double v4 = 0;
  if ((unint64_t)[v3 count] >= a2) {
    double v4 = (char *)[v3 count] - a2;
  }
  id v5 = [v3 count];
  if ((unint64_t)v5 >= a2) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = (unint64_t)v5;
  }
  int v7 = [v3 subarrayWithRange:v4, v6];

  return v7;
}

int64_t sub_10002B6D8(id a1, HTHangHUDInfo *a2, HTHangHUDInfo *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = [(HTHangHUDInfo *)v4 hangStartTime];
  if (v6 == (id)[(HTHangHUDInfo *)v5 hangStartTime])
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [(HTHangHUDInfo *)v4 hangStartTime];
    if (v8 > (id)[(HTHangHUDInfo *)v5 hangStartTime]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }

  return v7;
}

id sub_10002B760(void *a1, unsigned int a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    double v4 = [v3 keysSortedByValueUsingComparator:&stru_100052A38];
    unint64_t v5 = a2;
    if ((unint64_t)[v4 count] >= a2) {
      id v6 = (char *)[v4 count] - a2;
    }
    else {
      id v6 = 0;
    }
    id v8 = [v4 count];
    if ((unint64_t)v8 >= v5) {
      id v9 = (id)v5;
    }
    else {
      id v9 = v8;
    }
    [v4 subarrayWithRange:v6, v9];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSArray);
  }

  return v7;
}

int64_t sub_10002B828(id a1, HUDContentProtocol *a2, HUDContentProtocol *a3)
{
  double v4 = a3;
  id v5 = [(HUDContentProtocol *)a2 compareValue];
  id v6 = [(HUDContentProtocol *)v4 compareValue];

  int64_t v7 = 1;
  if (v5 <= v6) {
    int64_t v7 = -1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_10002B884()
{
  if (qword_1000644B8 != -1) {
    dispatch_once(&qword_1000644B8, &stru_100052A58);
  }
  return byte_1000644C0;
}

void sub_10002B8C8(id a1)
{
  byte_1000644C0 = _os_feature_enabled_impl();
}

uint64_t sub_10002B8F8(void *a1, unsigned char *a2)
{
  id v3 = a1;
  double v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 persistentDomainForName:@"com.apple.HangHUD"];
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 objectForKey:v3];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *a2 = [v7 isEqualToString:@"YES"];
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_10002B9CC()
{
  char v2 = 0;
  double v0 = &v2;
  if ((sub_10002B8F8(@"UseHangHUD", &v2) & 1) == 0)
  {
    if (qword_1000644C8 != -1) {
      dispatch_once(&qword_1000644C8, &stru_100052A78);
    }
    double v0 = &byte_1000644D0;
  }
  return *v0;
}

void sub_10002BA40(id a1)
{
  byte_1000644D0 = _os_feature_enabled_impl();
}

void sub_10002BA70(int a1)
{
  char v1 = a1;
  if (byte_1000638F0 != a1)
  {
    char v2 = sub_100027DEC();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
    if (v1)
    {
      if (v3)
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "  =>  clearing HUD context on hangtracerd when enabling HangHUD", v5, 2u);
      }

      sub_100027C20();
    }
    else
    {
      if (v3)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "  =>  clear HUD context on angle server when disabling HangHUD", buf, 2u);
      }

      double v4 = +[HangHUDClient sharedInstance];
      [v4 clearHUDWithCompletion:&stru_100052A98];
    }
  }
  byte_1000638F0 = v1;
}

void sub_10002BB58(id a1, NSError *a2)
{
  char v2 = a2;
  if (v2)
  {
    BOOL v3 = sub_100027DEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "clearHUDWithCompletionHandler did not complete. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10002BC08(id a1)
{
  byte_1000644E0 = SBSIsSystemApertureAvailable();
  char v1 = sub_100027DEC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = byte_1000644E0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "New API was available, retrieved aperture available %{BOOL}i", (uint8_t *)v2, 8u);
  }
}

BOOL sub_10002BCB8()
{
  if (qword_100064530 != -1) {
    dispatch_once(&qword_100064530, &stru_100052AD8);
  }
  return off_1000644E8 != 0;
}

uint64_t sub_10002BD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100064530 != -1) {
    dispatch_once(&qword_100064530, &stru_100052AD8);
  }
  if (off_1000644E8)
  {
    v23[0] = qword_1000644F0;
    v23[1] = qword_1000644F8;
    v24[0] = &__kCFBooleanTrue;
    v24[1] = a4;
    v23[2] = qword_100064500;
    v24[2] = +[NSNumber numberWithUnsignedLongLong:a2];
    void v23[3] = qword_100064508;
    v24[3] = +[NSNumber numberWithUnsignedLongLong:a3];
    v23[4] = qword_100064510;
    v24[4] = +[NSNumber numberWithBool:a6];
    v23[5] = qword_100064518;
    v24[5] = +[NSNumber numberWithBool:a7];
    v23[6] = qword_100064520;
    v24[6] = +[NSNumber numberWithBool:a8];
    long long v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7]);
    if (a5)
    {
      long long v18 = +[NSNumber numberWithInt:a5];
      [(NSMutableDictionary *)v17 setObject:v18 forKey:qword_100064528];
    }
    uint64_t v19 = off_1000644E8(a1, v17);
  }
  else
  {
    long long v20 = sub_100027DEC();
    uint64_t v19 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tailspin dump symbol is missing!", v22, 2u);
      uint64_t v19 = 0;
    }
  }
  return v19;
}

void sub_10002BF40(id a1)
{
  char v1 = dlopen("/usr/lib/libtailspin.dylib", 1);
  qword_100064538 = (uint64_t)v1;
  if (v1)
  {
    off_1000644E8 = dlsym(v1, "tailspin_dump_output_with_options_sync");
    qword_1000644F8 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_ReasonString");
    qword_1000644F0 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_NoSymbolicate");
    qword_100064500 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_MinTimestamp");
    qword_100064508 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_MaxTimestamp");
    qword_100064528 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_TargetPID");
    qword_100064510 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_CollectOsSignposts");
    qword_100064518 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_CollectTrials");
    qword_100064520 = *(void *)dlsym((void *)qword_100064538, "TSPDumpOptions_ScrubOutput");
  }
  else
  {
    char v2 = sub_100027DEC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "libtailspin.dylib is not present.", v3, 2u);
    }
  }
}

uint64_t sub_10002C0B4(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = 0;
  unint64_t v33 = 0;
  int v8 = 0;
  unint64_t v30 = a2 - a1;
  uint64_t v32 = a3 + 32;
  do
  {
    if (*(void *)(a3 + v7))
    {
      ++v8;
      uint64_t v9 = a3 + v7;
      unint64_t v10 = *(void *)(a3 + v7 + 24);
      if (v10 >= *(void *)(a3 + v7 + 16)) {
        unint64_t v10 = *(void *)(a3 + v7 + 16);
      }
      unint64_t v11 = *(void *)(a3 + v7 + 8) <= a1 ? a1 : *(void *)(a3 + v7 + 8);
      unint64_t v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        int v13 = sub_100027DEC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          double v14 = *(double *)(a3 + v7);
          double v15 = *(double *)(v9 + 8);
          uint64_t v16 = *(void *)(v9 + 24);
          *(_DWORD *)long long buf = 134219266;
          double v37 = v14;
          __int16 v38 = 2080;
          *(void *)&double v39 = v32 + v7;
          __int16 v40 = 2048;
          double v41 = v15;
          __int16 v42 = 2048;
          uint64_t v43 = v16;
          __int16 v44 = 2048;
          unint64_t v45 = a1;
          __int16 v46 = 2048;
          unint64_t v47 = a2;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end=%llu, hangstart=%llu, hangend=%llu)", buf, 0x3Eu);
        }

        if (*(unsigned char *)(a3 + v7 + 96))
        {
          if (*(void *)(v9 + 24) < a2)
          {
            long long v17 = sub_100027DEC();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              long long v18 = v17;
              uint64_t v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              uint32_t v20 = 2;
LABEL_22:
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, v20);
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          if (*(void *)(v9 + 8) > a1)
          {
            long long v17 = sub_100027DEC();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              long long v18 = v17;
              uint64_t v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }
LABEL_23:

            goto LABEL_30;
          }
          double v21 = sub_10002A984(v30);
          long long v22 = sub_100027DEC();
          long long v17 = v22;
          if (v21 >= 1000.0)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            double v23 = sub_10002A984(v30);
            *(_DWORD *)long long buf = 134217984;
            double v37 = v23;
            long long v18 = v17;
            uint64_t v19 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            uint32_t v20 = 12;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            sub_100032F0C(v34, v30, &v35, v17);
          }
        }
        v33 += v12 - v11;
        if (a4) {
          AnalyticsSendEventLazy();
        }
      }
    }
LABEL_30:
    v7 += 104;
  }
  while (v7 != 1040);
  if (!v8)
  {
    uint64_t v28 = sub_100027DEC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_100032E84(v28);
    }
    goto LABEL_48;
  }
  double v24 = sub_10002A984(v33);
  double v25 = sub_10002A984(v30) - v24;
  if (v25 >= 250.0)
  {
    uint64_t v29 = sub_100027DEC();
    uint64_t v28 = v29;
    if (v33)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        double v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      sub_100032EC8(v28);
    }
LABEL_48:

    return 0;
  }
  uint64_t v26 = sub_100027DEC();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    double v37 = v24;
    __int16 v38 = 2048;
    double v39 = (double)v33 * 100.0 / (double)v30;
    __int16 v40 = 2048;
    double v41 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap", buf, 0x20u);
  }

  if (a4)
  {
    j__ADClientPushValueForDistributionKey();
    j__ADClientPushValueForDistributionKey();
    AnalyticsSendEventLazy();
  }
  return 1;
}

id sub_10002C5E4(void *a1)
{
  v6[0] = @"assertionOverlapMs";
  char v2 = +[NSNumber numberWithUnsignedLongLong:a1[4] - a1[5]];
  v6[1] = @"assertionOverlapName";
  v7[0] = v2;
  BOOL v3 = +[NSString stringWithUTF8String:a1[6]];
  v7[1] = v3;
  int v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id sub_10002C6CC(uint64_t a1)
{
  v6[0] = @"hangDurationOverlapMs";
  char v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v6[1] = @"hangDurationOverlapPercent";
  v7[0] = v2;
  BOOL v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v3;
  int v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_10002C958(uint64_t a1)
{
  char v2 = objc_alloc_init(HTUserNotificationHelper);
  BOOL v3 = (void *)qword_100064540;
  qword_100064540 = (uint64_t)v2;

  if (v2)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.hangtracerd.notification-queue", 0);
    [(id)qword_100064540 setNotificationQueue:v4];

    id v5 = objc_alloc((Class)UNUserNotificationCenter);
    id v6 = [(id)qword_100064540 notificationQueue];
    id v7 = [v5 initWithBundleIdentifier:@"com.apple.hangtracerd.usernotifications" queue:v6];
    [(id)qword_100064540 setNotificationCenter:v7];

    int v8 = [(id)qword_100064540 notificationCenter];
    uint64_t v9 = +[NSSet setWithArray:*(void *)(a1 + 32)];
    [v8 setNotificationCategories:v9];

    uint64_t v10 = qword_100064540;
    unint64_t v11 = [(id)qword_100064540 notificationCenter];
    [v11 setDelegate:v10];

    unint64_t v12 = [(id)qword_100064540 notificationCenter];
    [v12 setWantsNotificationResponsesDelivered];

    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [(id)qword_100064540 setResponseHandlers:v13];
  }
}

id sub_10002CEE4(const __CFString *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSString stringWithFormat:@"%@.", a3];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CFArrayRef v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  id v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 hasPrefix:v6]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

void sub_10002D1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D1C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002D1D0(uint64_t a1)
{
}

void sub_10002D1D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 unsignedIntValue] - 1;
  CFArrayRef v8 = sub_100027DEC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412802;
    id v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = [v6 unsignedIntValue];
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Generated Logs count decreased %u -> %u", (uint8_t *)&v14, 0x18u);
  }

  if (v7)
  {
    id v9 = +[NSNumber numberWithUnsignedInt:v7];
    [(id)qword_100064590 setObject:v9 forKeyedSubscript:v5];
  }
  else
  {
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v10)
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v10 addObject:v5];
  }
}

BOOL sub_10002E4E4(uint64_t a1)
{
  char v1 = [(id)qword_100064598 objectForKeyedSubscript:a1];
  char v2 = v1;
  if (v1)
  {
    unsigned int v3 = [v1 unsignedIntValue];
    dispatch_queue_t v4 = +[HTPrefs sharedPrefs];
    BOOL v5 = v3 > [v4 slowAppActivationPerAppMaxLogLimit];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_10002E564(void *a1)
{
  id v1 = a1;
  char v2 = [(id)qword_100064598 objectForKeyedSubscript:v1];
  unsigned int v3 = v2;
  if (v2) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }
  BOOL v5 = +[HTPrefs sharedPrefs];
  unsigned int v6 = [v5 slowAppActivationPerAppMaxLogLimit];

  if (v4 >= v6)
  {
    CFArrayRef v8 = sub_100027DEC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412802;
      id v10 = v1;
      __int16 v11 = 1024;
      unsigned int v12 = v4;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Launch Generated Log count : %u -> %u", (uint8_t *)&v9, 0x18u);
    }
  }
  else
  {
    uint64_t v7 = sub_100027DEC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412802;
      id v10 = v1;
      __int16 v11 = 1024;
      unsigned int v12 = v4;
      __int16 v13 = 1024;
      unsigned int v14 = v4 + 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ Launch Generated Log count: %u -> %u", (uint8_t *)&v9, 0x18u);
    }

    CFArrayRef v8 = +[NSNumber numberWithUnsignedInt:v4 + 1];
    [(id)qword_100064598 setObject:v8 forKeyedSubscript:v1];
  }
}

id sub_10002E918(uint64_t a1)
{
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"EnablementType";
  v8[1] = @"CaptureSuccessful";
  char v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v9[1] = v2;
  _DWORD v8[2] = @"CaptureFailureReason";
  unsigned int v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  _DWORD v9[2] = v3;
  void v8[3] = @"HangSubType";
  unsigned int v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v9[3] = v4;
  void v8[4] = @"HTBugType";
  BOOL v5 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  void v9[4] = v5;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

id sub_100031060(uint64_t a1)
{
  v8[0] = @"RequestType";
  char v2 = sub_10001C628(*(void *)(a1 + 32));
  v9[0] = v2;
  v8[1] = @"PreviousDumpTime_To_RequestEndTime";
  LODWORD(v3) = *(_DWORD *)(a1 + 56);
  unsigned int v4 = +[NSNumber numberWithFloat:v3];
  v9[1] = v4;
  _DWORD v8[2] = @"RequestEndTime_To_CurrentTime";
  BOOL v5 = +[NSNumber numberWithDouble:sub_10002A984(*(void *)(a1 + 40) - *(void *)(a1 + 48))];
  _DWORD v9[2] = v5;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

void sub_100031174()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "Sending HUD configuration data to HangHUD", v2, v3, v4, v5, v6);
}

void sub_1000311A8()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "EPL is already enabled by PLDE, not changing os_log subsystem state", v2, v3, v4, v5, v6);
}

void sub_1000311DC()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "EPL is enabled by PLDE, not changing os_log subsystem state", v2, v3, v4, v5, v6);
}

void sub_100031210()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "launch_service_stats enabled.", v2, v3, v4, v5, v6);
}

void sub_100031244()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "launch_service_stats disabled.", v2, v3, v4, v5, v6);
}

void sub_100031278(void *a1, void *a2, NSObject *a3)
{
  int v5 = 136315650;
  uint8_t v6 = "handleSentryTailspinRequest";
  __int16 v7 = 2048;
  id v8 = [a1 unsignedLongLongValue];
  __int16 v9 = 2048;
  id v10 = [a2 unsignedLongLongValue];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: Requested startTime = %llu, endTime = %llu", (uint8_t *)&v5, 0x20u);
}

void sub_100031338()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "Checking for possible EPL and HTSE timeouts", v2, v3, v4, v5, v6);
}

void sub_10003136C()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "HTFenceTracking: Fence begin", v2, v3, v4, v5, v6);
}

void sub_1000313A0()
{
  sub_10000DCBC();
  sub_10000DCA0((void *)&_mh_execute_header, v0, v1, "HTFenceTracking: Fence end", v2, v3, v4, v5, v6);
}

void sub_1000313D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Archive Save Directory specified as %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003144C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HT command HANGTRACER_XPC_CMD_HANG_LOGS_PROCESSED reporting data:%@ error:%@", (uint8_t *)&v3, 0x16u);
}

void sub_1000314D4(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "matuTimeDifferenceMS: negative distance = %f", (uint8_t *)&v2, 0xCu);
}

void sub_100031550(unint64_t a1, NSObject *a2)
{
  double v3 = off_1000635A8;
  uint64_t v4 = sub_10001C628(a1);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  id v8 = v4;
  __int16 v9 = 2112;
  CFStringRef v10 = @"Tailspin_Requests_By_Type";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@.%@.%@ += 1 ", (uint8_t *)&v5, 0x20u);
}

void sub_100031614(os_log_t log)
{
  int v1 = 138412546;
  int v2 = off_1000635A8;
  __int16 v3 = 2112;
  CFStringRef v4 = @"Tailspin_Requests";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@.%@ += 1", (uint8_t *)&v1, 0x16u);
}

void sub_1000316AC(os_log_t log)
{
  int v1 = 134218240;
  uint64_t v2 = qword_100063C50;
  __int16 v3 = 2048;
  uint64_t v4 = qword_100063C58;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "getHangWaitTimeout: hangSequenceStartTime %llu, hangSequenceLastHangReportedTime %llu", (uint8_t *)&v1, 0x16u);
}

void sub_100031740()
{
  sub_100010894();
  sub_1000108AC((void *)&_mh_execute_header, v0, v1, "getHangWaitTimeout: now %llu < earliestHangStartTime %llu", v2, v3);
}

void sub_1000317A8(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = qword_100063C58;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "getHangWaitTimeout: now %llu < hangSequenceLastHangReportedTime %llu", (uint8_t *)&v2, 0x16u);
}

void sub_100031834()
{
  sub_100010894();
  sub_1000108AC((void *)&_mh_execute_header, v0, v1, "getHangWaitTimeout: now %llu < earliestPendingHangStartTime %llu", v2, v3);
}

void sub_10003189C(void *a1, int a2, NSObject *a3)
{
  uint64_t v5 = [a1 objectForKeyedSubscript:@"Primary"];
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Acquired network state: interface xpc_type_t type = %@, time since primary = %u", (uint8_t *)&v6, 0x12u);
}

void sub_100031954(void *a1, NSObject *a2)
{
  [a1 HUD_background_opacity];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "HUD_background_opacity set to %f", (uint8_t *)&v4, 0xCu);
}

void sub_1000319E0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Deallocating HUDContext…", v1, 2u);
}

void sub_100031A24(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, " Avoided redundant hud line clear and render context invalidation.", v1, 2u);
}

void sub_100031A68(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031AD8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031B48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031BB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031C20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031C98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031D10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031D88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031E00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031E78(void *a1)
{
  [a1 exitTimestamp];
  sub_100017D3C((void *)&_mh_execute_header, v1, v2, " * ProcExitHUDLine finishedUpdates! - exitTimestamp:%llu", v3, v4, v5, v6, 0);
}

void sub_100031EF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No more update happens as it's completed for %@ @ HangHUDLine::update:", (uint8_t *)&v2, 0xCu);
}

void sub_100031F6C(void *a1)
{
  [a1 hangDurationMS];
  sub_100017D3C((void *)&_mh_execute_header, v1, v2, " * HangHUDLine finishedUpdates! hangDurationMS: %f", v3, v4, v5, v6, 0);
}

void sub_100031FE8(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Checking if hang is current with hangID %@: durationSinceLastUpdateMs:%f", (uint8_t *)&v3, 0x16u);
}

void sub_10003206C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved file: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000320E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032154(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000147D8((void *)&_mh_execute_header, a1, a3, "TextAnimation: duration layer's animation object updated with toValue = %f", a5, a6, a7, a8, 0);
}

void sub_1000321C4(void *a1, NSObject *a2, double a3)
{
  __int16 v5 = [a1 string];
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TextAnimation: duration layer's animation object initialized: text set as %@ for a given duration %f", (uint8_t *)&v6, 0x16u);
}

void sub_100032274(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000322E4(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 string];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TextAnimation:  duration layer's text set as %@", (uint8_t *)&v4, 0xCu);
}

void sub_100032380(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000323F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

void sub_100032470(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Generate recentAppsDict with pids and paths of recently running apps", v1, 2u);
}

void sub_1000324B4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "dealloc for %@", (uint8_t *)&v3, 0xCu);
}

void sub_100032530(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Querying LS database for bundle id %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000325AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, " 🔚 A hang with ID %@ has ended!", (uint8_t *)&v2, 0xCu);
}

void sub_100032624(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "    A hang with ID %@ has not ended yet!", (uint8_t *)&v2, 0xCu);
}

void sub_10003269C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_100032724(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100026C7C((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void sub_1000327B0()
{
  sub_100026C9C();
  sub_100026CDC();
  sub_100026C7C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10003284C()
{
  sub_100026C9C();
  sub_100026CDC();
  sub_100026C7C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_1000328E8(int a1, int a2, os_log_t log)
{
  int v3 = 138412802;
  CFStringRef v4 = @"isCarryDevice";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@: %{BOOL}d -> %{BOOL}d", (uint8_t *)&v3, 0x18u);
}

void sub_100032980()
{
  sub_100026CAC();
  sub_100026CC0((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s is set to %@, treating as carry device", v2, v3, v4, v5, 2u);
}

void sub_1000329F8()
{
  sub_100026CAC();
  sub_100026CC0((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", v2, v3, v4, v5, 2u);
}

void sub_100032A70()
{
  sub_100026CAC();
  sub_100026CC0((void *)&_mh_execute_header, v0, v1, "HTPrefs: %s: %@", v2, v3, v4, v5, 2u);
}

void sub_100032AE8()
{
  sub_100026C9C();
  sub_100026CDC();
  sub_100026C7C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_100032B84()
{
  sub_100026C9C();
  sub_100026CDC();
  sub_100026C7C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_100032C20(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_100032C64()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_100032C90(uint64_t *a1, NSObject *a2, double a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  __int16 v8 = 2048;
  uint64_t v9 = 0x4059000000000000;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "HTHUD: numberOfDashes greater than maximum, elapsedTimeMS=%f, numberOfDashes=%f, capping to max_dash_count=%f", (uint8_t *)&v4, 0x20u);
}

void sub_100032D24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032D5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032D94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032DCC(uint64_t a1, NSObject *a2)
{
  int v4 = 134218498;
  uint64_t v5 = qword_100064460;
  __int16 v6 = 2048;
  double v7 = -[HUDLine contentScaleForTexts]_0();
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "cachedTopMargin is set to %f where DisplayScale is %f. The orientation is %@", (uint8_t *)&v4, 0x20u);
}

void sub_100032E84(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: no assertions have been tracked", v1, 2u);
}

void sub_100032EC8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: hang does not overlap any assertions", v1, 2u);
}

void sub_100032F0C(uint8_t *a1, unint64_t a2, double *a3, NSObject *a4)
{
  double v7 = sub_10002A984(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms", a1, 0xCu);
}

void sub_100032F78(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Tailspins will include trial information", (uint8_t *)&v2, 0xCu);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return _ADClientPushValueForDistributionKey();
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t AMFIIsDeveloperModeEnabled()
{
  return _AMFIIsDeveloperModeEnabled();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

uint64_t CARenderServerGetServerPort()
{
  return _CARenderServerGetServerPort();
}

uint64_t CARenderServerSetDebugMessage()
{
  return _CARenderServerSetDebugMessage();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return _CGColorCreateCopyWithAlpha(color, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateSRGB(red, green, blue, alpha);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return _CTFontCopyFontDescriptor(font);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateCopyWithAttributes(original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithFeature(CTFontDescriptorRef original, CFNumberRef featureTypeIdentifier, CFNumberRef featureSelectorIdentifier)
{
  return _CTFontDescriptorCreateCopyWithFeature(original, featureTypeIdentifier, featureSelectorIdentifier);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetFloat32Answer()
{
  return _MGGetFloat32Answer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OSLogInstallProfilePayload()
{
  return _OSLogInstallProfilePayload();
}

uint64_t OSLogRemoveProfilePayload()
{
  return _OSLogRemoveProfilePayload();
}

uint64_t OSLogValidateProfilePayload()
{
  return _OSLogValidateProfilePayload();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return __CFBundleCreateWithExecutableURLIfLooksLikeBundle();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return __CFCopyServerVersionDictionary();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return __CFCopySupplementalVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _launch_service_stats_copy_impl()
{
  return __launch_service_stats_copy_impl();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_filetype()
{
  return _archive_entry_set_filetype();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

uint64_t archive_write_set_options()
{
  return _archive_write_set_options();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t launch_service_stats_disable()
{
  return _launch_service_stats_disable();
}

uint64_t launch_service_stats_enable()
{
  return _launch_service_stats_enable();
}

uint64_t ledger()
{
  return _ledger();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return _mach_memory_info(host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

uint64_t nw_path_get_interface_time_delta()
{
  return _nw_path_get_interface_time_delta();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return _nw_path_uses_interface_type(path, interface_type);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_buffer_size_set()
{
  return _tailspin_buffer_size_set();
}

uint64_t tailspin_config_apply_sync()
{
  return _tailspin_config_apply_sync();
}

uint64_t tailspin_config_create_with_default_config()
{
  return _tailspin_config_create_with_default_config();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_enabled_set()
{
  return _tailspin_enabled_set();
}

uint64_t tailspin_full_sampling_period_set()
{
  return _tailspin_full_sampling_period_set();
}

uint64_t tailspin_oncore_sampling_period_set()
{
  return _tailspin_oncore_sampling_period_set();
}

int uname(utsname *a1)
{
  return _uname(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return _xpc_shmem_map(xshmem, region);
}

id objc_msgSend_HUD_background_opacity(void *a1, const char *a2, ...)
{
  return [a1 HUD_background_opacity];
}

id objc_msgSend_HangHUD_updater_latency_in_ms(void *a1, const char *a2, ...)
{
  return [a1 HangHUD_updater_latency_in_ms];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return [a1 __createInternalSettings];
}

id objc_msgSend_absoluteTime(void *a1, const char *a2, ...)
{
  return _[a1 absoluteTime];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return [a1 actionWithIdentifier:title:options:];
}

id objc_msgSend_actionWithIdentifier_title_url_options_(void *a1, const char *a2, ...)
{
  return [a1 actionWithIdentifier:title:url:options:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return [a1 addCommitHandler:forPhase:];
}

id objc_msgSend_addDisplayStateChangeEvent_(void *a1, const char *a2, ...)
{
  return [a1 addDisplayStateChangeEvent:];
}

id objc_msgSend_addHang_(void *a1, const char *a2, ...)
{
  return [a1 addHang:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addNotificationRequest:withCompletionHandler:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addToRunLoop:forMode:];
}

id objc_msgSend_allHangs(void *a1, const char *a2, ...)
{
  return _[a1 allHangs];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return [a1 allKeysForObject:];
}

id objc_msgSend_allowedProcessNames(void *a1, const char *a2, ...)
{
  return _[a1 allowedProcessNames];
}

id objc_msgSend_allowedReasons(void *a1, const char *a2, ...)
{
  return _[a1 allowedReasons];
}

id objc_msgSend_allowedSubReasons(void *a1, const char *a2, ...)
{
  return _[a1 allowedSubReasons];
}

id objc_msgSend_allowsAllProcesses(void *a1, const char *a2, ...)
{
  return _[a1 allowsAllProcesses];
}

id objc_msgSend_allowsCriticalProcesses(void *a1, const char *a2, ...)
{
  return _[a1 allowsCriticalProcesses];
}

id objc_msgSend_animationDidStartOnLine_(void *a1, const char *a2, ...)
{
  return [a1 animationDidStartOnLine:];
}

id objc_msgSend_animationDidStopOnLine_(void *a1, const char *a2, ...)
{
  return [a1 animationDidStopOnLine:];
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return [a1 animationForKey:];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_appActivationLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appActivationLoggingEnabled];
}

id objc_msgSend_appLaunchMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 appLaunchMonitoringEnabled];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_areAllProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areAllProcessTerminationsMonitored];
}

id objc_msgSend_areCriticalProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areCriticalProcessTerminationsMonitored];
}

id objc_msgSend_areProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areProcessTerminationsMonitored];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_associatePrefix_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 associatePrefix:withHandler:];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return [a1 attributeWithDomain:name:];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAnimationFromValue_toValue_duration_updateBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 beginAnimationFromValue:x0 toValue:x1 duration:x2 updateBlock:x3 completionBlock:x4];
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 BOOLProperty:contextPrefixOut:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdToAppNameCache(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdToAppNameCache];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithURL:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_calendarTime(void *a1, const char *a2, ...)
{
  return _[a1 calendarTime];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_captureMicroHang(void *a1, const char *a2, ...)
{
  return _[a1 captureMicroHang];
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return [a1 categoryWithIdentifier:x0 actions:x1 intentIdentifiers:x2 options:x3];
}

id objc_msgSend_checkEventsForHUDUpdate_(void *a1, const char *a2, ...)
{
  return [a1 checkEventsForHUDUpdate:];
}

id objc_msgSend_checkEventsForTimeouts_withType_(void *a1, const char *a2, ...)
{
  return [a1 checkEventsForTimeouts:withType:];
}

id objc_msgSend_checkForHUDTimeouts_(void *a1, const char *a2, ...)
{
  return [a1 checkForHUDTimeouts:];
}

id objc_msgSend_checkForHangTimeouts_(void *a1, const char *a2, ...)
{
  return [a1 checkForHangTimeouts:];
}

id objc_msgSend_checkShouldSaveHangLogs(void *a1, const char *a2, ...)
{
  return _[a1 checkShouldSaveHangLogs];
}

id objc_msgSend_cleanupAllHangs(void *a1, const char *a2, ...)
{
  return _[a1 cleanupAllHangs];
}

id objc_msgSend_clearBundleNameCache(void *a1, const char *a2, ...)
{
  return _[a1 clearBundleNameCache];
}

id objc_msgSend_clearHUDLinesAnimated_(void *a1, const char *a2, ...)
{
  return [a1 clearHUDLinesAnimated:];
}

id objc_msgSend_clearHUDLinesAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 clearHUDLinesAnimated:withCompletion:];
}

id objc_msgSend_clearHUDWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 clearHUDWithCompletion:];
}

id objc_msgSend_clientContextIdentifierKey(void *a1, const char *a2, ...)
{
  return _[a1 clientContextIdentifierKey];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectTailspinAndUpdateTelemtry(void *a1, const char *a2, ...)
{
  return _[a1 collectTailspinAndUpdateTelemtry];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compareBootSessionUUIDAndClearPreferencesWithDomain_prefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "compareBootSessionUUIDAndClearPreferencesWithDomain:prefix:");
}

id objc_msgSend_compareValue(void *a1, const char *a2, ...)
{
  return _[a1 compareValue];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationAllowingAllProcesses_criticalProcesses_processNames_reasons_subReasons_(void *a1, const char *a2, ...)
{
  return [a1 configurationAllowingAllProcesses:x0, x1, x2, x3, x4];
}

id objc_msgSend_configurationFromPrefs_(void *a1, const char *a2, ...)
{
  return [a1 configurationFromPrefs:];
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return [a1 configureConnection:];
}

id objc_msgSend_connectionWithEndpoint_clientContextBuilder_(void *a1, const char *a2, ...)
{
  return [a1 connectionWithEndpoint:x0 clientContextBuilder:x1];
}

id objc_msgSend_containerLayer(void *a1, const char *a2, ...)
{
  return _[a1 containerLayer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentScaleForTexts(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleForTexts];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_countsOfMeetingEndingConditions(void *a1, const char *a2, ...)
{
  return _[a1 countsOfMeetingEndingConditions];
}

id objc_msgSend_createContainerLayer(void *a1, const char *a2, ...)
{
  return _[a1 createContainerLayer];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_currentHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return [a1 currentHangTextColorForStatus:];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 currentOrientation];
}

id objc_msgSend_currentProcessExitTextColor(void *a1, const char *a2, ...)
{
  return _[a1 currentProcessExitTextColor];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return _[a1 currentTheme];
}

id objc_msgSend_darkModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 darkModeTheme];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0, x1, x2];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeArrayOfObjectsOfClass:forKey:];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeDoubleForKey:];
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeInt64ForKey:];
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _[a1 defaultSound];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_determineNewFrameForRootLayer_numberOfLines_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "determineNewFrameForRootLayer:numberOfLines:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _[a1 displayId];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return [a1 displayLinkWithTarget:selector:];
}

id objc_msgSend_displayNameForHangInfo_(void *a1, const char *a2, ...)
{
  return [a1 displayNameForHangInfo:];
}

id objc_msgSend_displayStateArray(void *a1, const char *a2, ...)
{
  return _[a1 displayStateArray];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 doubleProperty:x0 contextPrefixOut:&x1];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_enableLoggingForPoster(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForPoster];
}

id objc_msgSend_enableLoggingForWidgetRenderer(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForWidgetRenderer];
}

id objc_msgSend_enablementPrefix(void *a1, const char *a2, ...)
{
  return _[a1 enablementPrefix];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:x0 forKey:x1];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeDouble:x0 forKey:x1];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt64:forKey:];
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_endAnimation_(void *a1, const char *a2, ...)
{
  return [a1 endAnimation:];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return [a1 endpointForMachName:x0 service:x1 instance:x2];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_eplEnabled(void *a1, const char *a2, ...)
{
  return _[a1 eplEnabled];
}

id objc_msgSend_eplEnabledProfile(void *a1, const char *a2, ...)
{
  return _[a1 eplEnabledProfile];
}

id objc_msgSend_eplTimeoutTimestampSec(void *a1, const char *a2, ...)
{
  return _[a1 eplTimeoutTimestampSec];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return _[a1 exitEvent];
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCode];
}

id objc_msgSend_exitReasonCodeTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCodeTextLayer];
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespace];
}

id objc_msgSend_exitReasonNamespaceTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespaceTextLayer];
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 exitTimestamp];
}

id objc_msgSend_expirationMSec(void *a1, const char *a2, ...)
{
  return _[a1 expirationMSec];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointRecord];
}

id objc_msgSend_failReason(void *a1, const char *a2, ...)
{
  return _[a1 failReason];
}

id objc_msgSend_fenceHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 fenceHangDailyLogLimit];
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessRecords];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:x0 isDirectory:x1];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:x0 relativeToURL:x1];
}

id objc_msgSend_firstHang(void *a1, const char *a2, ...)
{
  return _[a1 firstHang];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_forceQuitDetectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 forceQuitDetectionEnabled];
}

id objc_msgSend_forceQuitDetectionThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 forceQuitDetectionThresholdMSec];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _[a1 fromValue];
}

id objc_msgSend_getApplicationByBundleId_(void *a1, const char *a2, ...)
{
  return [a1 getApplicationByBundleId:];
}

id objc_msgSend_getBootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 getBootSessionUUID];
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return [a1 getDescription:];
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 getEPLProfilePath];
}

id objc_msgSend_getEarliestPendingHangStartTime_(void *a1, const char *a2, ...)
{
  return [a1 getEarliestPendingHangStartTime:];
}

id objc_msgSend_getHangHUDInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 getHangHUDInfoKey];
}

id objc_msgSend_getHangStartTime_(void *a1, const char *a2, ...)
{
  return [a1 getHangStartTime:];
}

id objc_msgSend_getHangWaitTimeout(void *a1, const char *a2, ...)
{
  return _[a1 getHangWaitTimeout];
}

id objc_msgSend_getHighestPrioritySettingValue_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 getHighestPrioritySettingValue:matchingSelector:contextPrefixOut:];
}

id objc_msgSend_getKeyForLine_(void *a1, const char *a2, ...)
{
  return [a1 getKeyForLine:];
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getNotificationSettingsWithCompletionHandler:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_hangDescription(void *a1, const char *a2, ...)
{
  return _[a1 hangDescription];
}

id objc_msgSend_hangDuration(void *a1, const char *a2, ...)
{
  return _[a1 hangDuration];
}

id objc_msgSend_hangDurationMS(void *a1, const char *a2, ...)
{
  return _[a1 hangDurationMS];
}

id objc_msgSend_hangEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangEndTime];
}

id objc_msgSend_hangHasPendingAnimation_(void *a1, const char *a2, ...)
{
  return [a1 hangHasPendingAnimation:];
}

id objc_msgSend_hangSequenceEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangSequenceEndTime];
}

id objc_msgSend_hangSequenceStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangSequenceStartTime];
}

id objc_msgSend_hangStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangStartTime];
}

id objc_msgSend_hangSubType(void *a1, const char *a2, ...)
{
  return _[a1 hangSubType];
}

id objc_msgSend_hangWaitTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 hangWaitTimeoutDurationMSec];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasAppExceededGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return [a1 hasAppExceededGeneratedLogsCountForDuration:x0 procName:x1 isFirstPartyApp:x2];
}

id objc_msgSend_hasExceededDailyFenceLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 hasExceededDailyFenceLogLimit];
}

id objc_msgSend_hasExceededDailyLimit_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return [a1 hasExceededDailyLimit:isFirstPartyApp:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_htTailspinEnabled(void *a1, const char *a2, ...)
{
  return _[a1 htTailspinEnabled];
}

id objc_msgSend_hudContentWithPendingAnimations(void *a1, const char *a2, ...)
{
  return _[a1 hudContentWithPendingAnimations];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_hudLine(void *a1, const char *a2, ...)
{
  return _[a1 hudLine];
}

id objc_msgSend_hudLines(void *a1, const char *a2, ...)
{
  return _[a1 hudLines];
}

id objc_msgSend_hudRenderContext(void *a1, const char *a2, ...)
{
  return _[a1 hudRenderContext];
}

id objc_msgSend_hudString(void *a1, const char *a2, ...)
{
  return _[a1 hudString];
}

id objc_msgSend_hudThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 hudThresholdMSec];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 identityForAngelJobLabel:];
}

id objc_msgSend_incrementAppGeneratedLogsCountForDuration_procName_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return [a1 incrementAppGeneratedLogsCountForDuration:x0 procName:x1 isFirstPartyApp:x2];
}

id objc_msgSend_incrementDailyFenceLogGenerationCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementDailyFenceLogGenerationCount];
}

id objc_msgSend_incrementDailyLogGenerationCountForDuration_isFirstPartyApp_(void *a1, const char *a2, ...)
{
  return [a1 incrementDailyLogGenerationCountForDuration:isFirstPartyApp:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDict(void *a1, const char *a2, ...)
{
  return _[a1 infoDict];
}

id objc_msgSend_initPropertyProcessTerminationSubReasonsMonitored_(void *a1, const char *a2, ...)
{
  return [a1 initPropertyProcessTerminationSubReasonsMonitored:];
}

id objc_msgSend_initStatus(void *a1, const char *a2, ...)
{
  return _[a1 initStatus];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlock:];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:x0 allowPlaceholder:x1 error:x2];
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:error:];
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:x0 queue:x1];
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:x0 length:x1 encoding:x2 freeWhenDone:x3];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithChangesDeliveredOnQueue_toBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithChangesDeliveredOnQueue:x0 toBlock:x1];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:x0 target:x1 attributes:x2];
}

id objc_msgSend_initWithHangStartTime_hangEndTime_receivedTimestamp_hangDurationMS_hudString_shortenedBundle_bundleId_timedOut_(void *a1, const char *a2, ...)
{
  return [a1 initWithHangStartTime:x0 hangEndTime:x1 receivedTimestamp:x2 hangDurationMS:x3 hudString:x4 shortenedBundle:x5 bundleId:x6 timedOut:x7];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_(void *a1, const char *a2, ...)
{
  return [a1 initWithInfo:x0 pid:x1 spawnTimestamp:x2 exitTimestamp:x3 exitReasonCode:x4 exitReasonNamespace:x5 jetsam_priority:x6];
}

id objc_msgSend_initWithNamespaceLayer_codeLayer_(void *a1, const char *a2, ...)
{
  return [a1 initWithNamespaceLayer:x0 codeLayer:x1];
}

id objc_msgSend_initWithPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPid:x0 sharedMem:x1 length:x2 bundleID:x3];
}

id objc_msgSend_initWithPid_threadID_startTime_endTime_reportedTime_blownFenceID_hangSubtype_isFirstPartyApp_isThirdPartyDevSupportModeHang_displayedInHUD_serviceName_reason_processName_processPath_userActionData_(void *a1, const char *a2, ...)
{
  return [a1 initWithPid:x0 threadID:x1 startTime:x2 endTime:x3 reportedTime:x4 blownFenceID:x5 hangSubtype:x6 isFirstPartyApp:x7 isThirdPartyDevSupportModeHang:x8 displayedInHUD:x9 serviceName:x10 reason:x11 processName:x12 processPath:x13 userActionData:x14];
}

id objc_msgSend_initWithPreviousHangTextColor_currentHangTextColor_currentHangSevereTextColor_previousHangSevereTextColor_currentHangCriticalTextColor_previousHangCriticalTextColor_backgroundColor_currentProcessExitTextColor_processExitReasonNamespaceTextColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithPreviousHangTextColor:x0 currentHangTextColor:x1 currentHangSevereTextColor:x2 previousHangSevereTextColor:x3 currentHangCriticalTextColor:x4 previousHangCriticalTextColor:x5 backgroundColor:x6 currentProcessExitTextColor:x7 processExitReasonNamespaceTextColor:x8];
}

id objc_msgSend_initWithProcExitRecord_theme_lineDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithProcExitRecord:x0 theme:x1 lineDelegate:x2];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithQueue_processName_theme_fontSize_lineDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:x0 processName:x1 theme:x2 fontSize:x3 lineDelegate:x4];
}

id objc_msgSend_initWithRenderContext_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithRenderContext:x0 queue:x1];
}

id objc_msgSend_initWithRunloopHangTimeoutDurationMSec_thirdPartyDevPreferredLanguages_areProcessTerminationsMonitored_processTerminationsFiltering_(void *a1, const char *a2, ...)
{
  return [a1 initWithRunloopHangTimeoutDurationMSec:x0 thirdPartyDevPreferredLanguages:x1 areProcessTerminationsMonitored:x2 processTerminationsFiltering:x3];
}

id objc_msgSend_initWithServiceName_threadID_startTime_endTime_saveTailspin_subType_userActionData_isThirdPartyDevSupportModeHang_processInfo_captureMicroHang_(void *a1, const char *a2, ...)
{
  return [a1 initWithServiceName:x0 threadID:x1 startTime:x2 endTime:x3 saveTailspin:x4 subType:x5 userActionData:x6 isThirdPartyDevSupportModeHang:x7 processInfo:x8 captureMicroHang:x9];
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:x0];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initializeStatus(void *a1, const char *a2, ...)
{
  return _[a1 initializeStatus];
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return [a1 insert:];
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 intProperty:x0 contextPrefixOut:x1];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithIdentifier:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAnyModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isAnyModeActive];
}

id objc_msgSend_isCurrent_withHUDUpdateInterval_(void *a1, const char *a2, ...)
{
  return [a1 isCurrent:withHUDUpdateInterval:];
}

id objc_msgSend_isDeveloperApp(void *a1, const char *a2, ...)
{
  return _[a1 isDeveloperApp];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFirstPartyApp(void *a1, const char *a2, ...)
{
  return _[a1 isFirstPartyApp];
}

id objc_msgSend_isHang(void *a1, const char *a2, ...)
{
  return _[a1 isHang];
}

id objc_msgSend_isHangEndedWithDuration_updateInterval_hangID_(void *a1, const char *a2, ...)
{
  return [a1 isHangEndedWithDuration:x0 updateInterval:x1 hangID:x2];
}

id objc_msgSend_isImmersionLevelControllerPresentOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 isImmersionLevelControllerPresentOnScreen];
}

id objc_msgSend_isInForeground(void *a1, const char *a2, ...)
{
  return _[a1 isInForeground];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return _[a1 isProfileValidated];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isThirdPartyDevSupportModeHang(void *a1, const char *a2, ...)
{
  return _[a1 isThirdPartyDevSupportModeHang];
}

id objc_msgSend_isTimedOut(void *a1, const char *a2, ...)
{
  return _[a1 isTimedOut];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return [a1 jetsam_priority];
}

id objc_msgSend_keyLayer(void *a1, const char *a2, ...)
{
  return _[a1 keyLayer];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastKnownHangs(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownHangs];
}

id objc_msgSend_lastKnownMaxKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownMaxKeyLayerWidth];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutHUDLines_ids_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "layoutHUDLines:ids:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_lightModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 lightModeTheme];
}

id objc_msgSend_lineDelegate(void *a1, const char *a2, ...)
{
  return _[a1 lineDelegate];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return [a1 localizedNameWithPreferredLocalizations:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2 localization:x3];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_machName(void *a1, const char *a2, ...)
{
  return _[a1 machName];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_memoryLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 memoryLoggingEnabled];
}

id objc_msgSend_memoryLoggingIntervalSec(void *a1, const char *a2, ...)
{
  return _[a1 memoryLoggingIntervalSec];
}

id objc_msgSend_minimumValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 minimumValueLayerWidth];
}

id objc_msgSend_monitorAppLaunchSignposts(void *a1, const char *a2, ...)
{
  return _[a1 monitorAppLaunchSignposts];
}

id objc_msgSend_monitorSignposts_(void *a1, const char *a2, ...)
{
  return [a1 monitorSignposts:];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_monitorWorkflowsWithDailyLogLimit_perPeriodLogLimit_periodLengthSec_(void *a1, const char *a2, ...)
{
  return [a1 monitorWorkflowsWithDailyLogLimit:x0 perPeriodLogLimit:x1 periodLengthSec:x2];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_networkStateForTailSpin(void *a1, const char *a2, ...)
{
  return _[a1 networkStateForTailSpin];
}

id objc_msgSend_nilifyCALayers(void *a1, const char *a2, ...)
{
  return _[a1 nilifyCALayers];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenter];
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return _[a1 notificationQueue];
}

id objc_msgSend_notifyHTTailSpinResult_failReason_hangSubType_htBugType_(void *a1, const char *a2, ...)
{
  return [a1 notifyHTTailSpinResult:x0 failReason:x1 hangSubType:x2 htBugType:x3];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfHangs(void *a1, const char *a2, ...)
{
  return _[a1 numberOfHangs];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 objectProperty:x0 matchingSelector:x1 contextPrefixOut:x2];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 objectsAtIndexes:];
}

id objc_msgSend_obtainKeepHangHUDAliveAssertion_(void *a1, const char *a2, ...)
{
  return [a1 obtainKeepHangHUDAliveAssertion:];
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:x0 withOptions:x1 error:x2];
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openURL:withOptions:error:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performHUDUpdate_(void *a1, const char *a2, ...)
{
  return [a1 performHUDUpdate:];
}

id objc_msgSend_performHUDUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "performHUDUpdate:withCompletion:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return [a1 persistentDomainForName:];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingBundleIdentifiers:];
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 prefNamed:x0 domain:x1 profile:x2 matchingSelector:x3 contextPrefixOut:x4];
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredFrameSize];
}

id objc_msgSend_preferredKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredKeyLayerWidth];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:x0 forPreferences:x1];
}

id objc_msgSend_preferredValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredValueLayerWidth];
}

id objc_msgSend_previousDurationSinceLastUpdateMs(void *a1, const char *a2, ...)
{
  return _[a1 previousDurationSinceLastUpdateMs];
}

id objc_msgSend_previousHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return [a1 previousHangTextColorForStatus:];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return _[a1 process];
}

id objc_msgSend_processExitReasonNamespaceTextColor(void *a1, const char *a2, ...)
{
  return _[a1 processExitReasonNamespaceTextColor];
}

id objc_msgSend_processForPid_(void *a1, const char *a2, ...)
{
  return [a1 processForPid:];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processTerminationNamesMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationNamesMonitored];
}

id objc_msgSend_processTerminationReasonsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationReasonsMonitored];
}

id objc_msgSend_processTerminationSubReasonsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationSubReasonsMonitored];
}

id objc_msgSend_processTerminationsFiltering(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationsFiltering];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return [a1 protocolForProtocol:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:x0 options:x1];
}

id objc_msgSend_receiveHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return [a1 receiveHangHUDInfo:completion:];
}

id objc_msgSend_receiveHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return [a1 receiveHudConfiguration:x0 completion:x1];
}

id objc_msgSend_receiveMonitoredStates_completion_(void *a1, const char *a2, ...)
{
  return [a1 receiveMonitoredStates:x0, x1];
}

id objc_msgSend_receiveProcExitRecord_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receiveProcExitRecord:completion:")];
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 receivedTimestamp];
}

id objc_msgSend_recentAppsDict(void *a1, const char *a2, ...)
{
  return _[a1 recentAppsDict];
}

id objc_msgSend_recordFenceHang_startTime_endTime_reportedTime_blownFenceId_saveTailspin_subtype_isThirdPartyDevSupportModeHang_captureMicroHang_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "recordFenceHang:startTime:endTime:reportedTime:blownFenceId:saveTailspin:subtype:isThirdPartyDevSupportModeHang:captureMicroHang:");
}

id objc_msgSend_recordHang(void *a1, const char *a2, ...)
{
  return _[a1 recordHang];
}

id objc_msgSend_recordHang_threadID_startTime_endTime_saveTailspin_subtype_userActionData_isThirdPartyDevSupportModeHang_captureMicroHang_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:");
}

id objc_msgSend_refreshAppGeneratedLogsCount(void *a1, const char *a2, ...)
{
  return _[a1 refreshAppGeneratedLogsCount];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_refreshPerPeriodSentryLogCount(void *a1, const char *a2, ...)
{
  return _[a1 refreshPerPeriodSentryLogCount];
}

id objc_msgSend_reloadThemeColors(void *a1, const char *a2, ...)
{
  return _[a1 reloadThemeColors];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 remoteContextWithOptions:];
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return [a1 remoteTargetWithLaunchingAssertionAttributes:];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return _[a1 removeAllDeliveredNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _[a1 removeAllPendingNotificationRequests];
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 removeDeliveredNotificationsWithIdentifiers:];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsAtIndexes:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 removePendingNotificationRequestsWithIdentifiers:];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectAtIndex:withObject:];
}

id objc_msgSend_reportPeriodMATU(void *a1, const char *a2, ...)
{
  return _[a1 reportPeriodMATU];
}

id objc_msgSend_reportedTime(void *a1, const char *a2, ...)
{
  return _[a1 reportedTime];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestAuthorizationWithOptions:];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:];
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:destinations:];
}

id objc_msgSend_resetAppActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetAppActivationTailspinCounts];
}

id objc_msgSend_resetDailyActivationTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailyActivationTailspinCounts];
}

id objc_msgSend_resetDailyGeneratedLogsCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailyGeneratedLogsCounts];
}

id objc_msgSend_resetDailySentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetDailySentryTailspinCounts];
}

id objc_msgSend_resetLogCountsForDailyRollover(void *a1, const char *a2, ...)
{
  return _[a1 resetLogCountsForDailyRollover];
}

id objc_msgSend_resetLogCountsForEPL(void *a1, const char *a2, ...)
{
  return _[a1 resetLogCountsForEPL];
}

id objc_msgSend_resetPerAppCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetPerAppCounts];
}

id objc_msgSend_resetPerPeriodSentryTailspinCounts(void *a1, const char *a2, ...)
{
  return _[a1 resetPerPeriodSentryTailspinCounts];
}

id objc_msgSend_responseHandlers(void *a1, const char *a2, ...)
{
  return _[a1 responseHandlers];
}

id objc_msgSend_retargeted(void *a1, const char *a2, ...)
{
  return _[a1 retargeted];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runLoopHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopHangDailyLogLimit];
}

id objc_msgSend_runLoopHangPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopHangPerPeriodLogLimit];
}

id objc_msgSend_runLoopLongHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopLongHangDailyLogLimit];
}

id objc_msgSend_runLoopMicroHangDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runLoopMicroHangDailyLogLimit];
}

id objc_msgSend_runloopHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangDurationThresholdMSec];
}

id objc_msgSend_runloopHangThirdPartyDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangThirdPartyDailyLogLimit];
}

id objc_msgSend_runloopHangThirdPartyDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangThirdPartyDurationThresholdMSec];
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangTimeoutDurationMSec];
}

id objc_msgSend_runloopLongHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopLongHangDurationThresholdMSec];
}

id objc_msgSend_savePreferencesForRestoration_withDomain_prefix_(void *a1, const char *a2, ...)
{
  return [a1 savePreferencesForRestoration:withDomain:prefix:];
}

id objc_msgSend_saveSentryTailspin_infoDict_startTime_endTime_error_(void *a1, const char *a2, ...)
{
  return [a1 saveSentryTailspin:infoDict:startTime:endTime:error:];
}

id objc_msgSend_saveTailSpinWithFileName_infoDictArray_startTime_endTime_processString_pid_requestType_failReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:");
}

id objc_msgSend_saveTailspin(void *a1, const char *a2, ...)
{
  return _[a1 saveTailspin];
}

id objc_msgSend_saveTailspinForAllHangs(void *a1, const char *a2, ...)
{
  return _[a1 saveTailspinForAllHangs];
}

id objc_msgSend_saveTailspinForForceQuitProcessID_procName_procPath_filePath_(void *a1, const char *a2, ...)
{
  return [a1 saveTailspinForForceQuitProcessID:procName:procPath:filePath:];
}

id objc_msgSend_saveTailspinWithFileName_path_infoDictArray_startTime_endTime_processString_pid_requestType_includeOSSignposts_failReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:");
}

id objc_msgSend_sendHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendHangHUDInfo:completion:];
}

id objc_msgSend_sendHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendHudConfiguration:completion:];
}

id objc_msgSend_serverRunningDidChange_(void *a1, const char *a2, ...)
{
  return [a1 serverRunningDidChange:];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAbsoluteTime_(void *a1, const char *a2, ...)
{
  return [a1 setAbsoluteTime:];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActivationHandler:];
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return [a1 setAffineTransform:];
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return [a1 setAlignmentMode:];
}

id objc_msgSend_setAllowedProcessNames_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedProcessNames:];
}

id objc_msgSend_setAllowedReasons_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedReasons:];
}

id objc_msgSend_setAllowedSubReasons_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedSubReasons:];
}

id objc_msgSend_setAllowsAllProcesses_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAllProcesses:];
}

id objc_msgSend_setAllowsCriticalProcesses_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCriticalProcesses:];
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsGroupOpacity:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return [a1 setBody:];
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setBundleId:];
}

id objc_msgSend_setCalendarTime_(void *a1, const char *a2, ...)
{
  return [a1 setCalendarTime:];
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return [a1 setCanceled:];
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryIdentifier:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setContainerLayer_(void *a1, const char *a2, ...)
{
  return [a1 setContainerLayer:];
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 setContentsScale:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCountsOfMeetingEndingConditions_(void *a1, const char *a2, ...)
{
  return [a1 setCountsOfMeetingEndingConditions:];
}

id objc_msgSend_setCurrentTheme_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTheme:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultActionURL:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setDisplayScaleDependentPropertiesOnLayers(void *a1, const char *a2, ...)
{
  return _[a1 setDisplayScaleDependentPropertiesOnLayers];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return [a1 setEndTime:];
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return [a1 setEndowmentNamespaces:];
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return [a1 setEvents:];
}

id objc_msgSend_setExecutablePath_(void *a1, const char *a2, ...)
{
  return [a1 setExecutablePath:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setExpirationMSec_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationMSec:];
}

id objc_msgSend_setFailReason_(void *a1, const char *a2, ...)
{
  return [a1 setFailReason:];
}

id objc_msgSend_setFilePath_(void *a1, const char *a2, ...)
{
  return [a1 setFilePath:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setFontSize:];
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundColor:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setHUD_background_opacity_(void *a1, const char *a2, ...)
{
  return [a1 setHUD_background_opacity:];
}

id objc_msgSend_setHangDuration_animated_(void *a1, const char *a2, ...)
{
  return [a1 setHangDuration:animated:];
}

id objc_msgSend_setHangHUD_updater_latency_in_ms_(void *a1, const char *a2, ...)
{
  return [a1 setHangHUD_updater_latency_in_ms:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHudLine_(void *a1, const char *a2, ...)
{
  return [a1 setHudLine:];
}

id objc_msgSend_setHudRenderContext_(void *a1, const char *a2, ...)
{
  return [a1 setHudRenderContext:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return [a1 setInterface:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionLevel:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsHang_(void *a1, const char *a2, ...)
{
  return [a1 setIsHang:];
}

id objc_msgSend_setKeyLayer_(void *a1, const char *a2, ...)
{
  return [a1 setKeyLayer:];
}

id objc_msgSend_setLastKnownHangs_(void *a1, const char *a2, ...)
{
  return [a1 setLastKnownHangs:];
}

id objc_msgSend_setLastKnownMaxKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLastKnownMaxKeyLayerWidth:];
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return [a1 setLayer:];
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return [a1 setLevel:];
}

id objc_msgSend_setLineDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setLineDelegate:];
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return [a1 setMemoryLoggingIntervalSec:];
}

id objc_msgSend_setMinimumValueLayerWidth_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumValueLayerWidth:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationCategories:];
}

id objc_msgSend_setNotificationCenter_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationCenter:];
}

id objc_msgSend_setNotificationQueue_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationQueue:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return [a1 setPid:];
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return [a1 setPredicates:];
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredFrameRateRange:];
}

id objc_msgSend_setPreferredKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredKeyLayerWidth:];
}

id objc_msgSend_setPreferredValueLayerWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredValueLayerWidth:];
}

id objc_msgSend_setPreviousDurationSinceLastUpdateMs_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousDurationSinceLastUpdateMs:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setRemovedOnCompletion:];
}

id objc_msgSend_setResponseHandlers_(void *a1, const char *a2, ...)
{
  return [a1 setResponseHandlers:];
}

id objc_msgSend_setRetargeted_(void *a1, const char *a2, ...)
{
  return [a1 setRetargeted:];
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return [a1 setSecure:];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return [a1 setServer:];
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return [a1 setServiceQuality:];
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOffset:];
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOpacity:];
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return [a1 setShadowPathIsBounds:];
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return [a1 setShadowRadius:];
}

id objc_msgSend_setShouldBackgroundDefaultAction_(void *a1, const char *a2, ...)
{
  return [a1 setShouldBackgroundDefaultAction:];
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPostHTPrefsChangedNotification:];
}

id objc_msgSend_setSidePadding_(void *a1, const char *a2, ...)
{
  return [a1 setSidePadding:];
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return [a1 setSound:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setStartTime:];
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setStateDescriptor:];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:];
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return [a1 setSublayerTransform:];
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setThreadIdentifier:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setTransaction:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTruncationMode_(void *a1, const char *a2, ...)
{
  return [a1 setTruncationMode:];
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateBlock:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUpdatesComplete_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatesComplete:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setValueLayer_(void *a1, const char *a2, ...)
{
  return [a1 setValueLayer:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVibrancyFilter_(void *a1, const char *a2, ...)
{
  return [a1 setVibrancyFilter:];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 setupPrefsWithQueue:];
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return [a1 setupPrefsWithQueue:x0 profilePath:x1 taskingDomainName:x2 hangtracerDomain:x3 setupInternalPrefs:x4];
}

id objc_msgSend_sharedAnimator(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnimator];
}

id objc_msgSend_sharedHelperWithCategories_(void *a1, const char *a2, ...)
{
  return [a1 sharedHelperWithCategories:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shortenedBundle(void *a1, const char *a2, ...)
{
  return _[a1 shortenedBundle];
}

id objc_msgSend_shouldCollectOSSignposts(void *a1, const char *a2, ...)
{
  return _[a1 shouldCollectOSSignposts];
}

id objc_msgSend_shouldDisplayFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayFenceHangToHUD];
}

id objc_msgSend_shouldDisplayNonFenceHangToHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayNonFenceHangToHUD];
}

id objc_msgSend_shouldIncludeDisplayData(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeDisplayData];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_shouldSaveFenceHangLogs(void *a1, const char *a2, ...)
{
  return _[a1 shouldSaveFenceHangLogs];
}

id objc_msgSend_shouldUpdateHangsHUD(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpdateHangsHUD];
}

id objc_msgSend_shouldUploadToDiagPipe(void *a1, const char *a2, ...)
{
  return _[a1 shouldUploadToDiagPipe];
}

id objc_msgSend_signpostMonitoringDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringDailyLogLimit];
}

id objc_msgSend_signpostMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringEnabled];
}

id objc_msgSend_signpostMonitoringPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 signpostMonitoringPerPeriodLogLimit];
}

id objc_msgSend_slowAppActivationDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationDailyLogLimit];
}

id objc_msgSend_slowAppActivationPerAppMaxLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationPerAppMaxLogLimit];
}

id objc_msgSend_slowAppActivationTailspinEnabled(void *a1, const char *a2, ...)
{
  return _[a1 slowAppActivationTailspinEnabled];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 spawnTimestamp];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_startTimeWithinMS_ofCurrentTime_(void *a1, const char *a2, ...)
{
  return [a1 startTimeWithinMS:ofCurrentTime:];
}

id objc_msgSend_startWatchingPid_sharedMem_length_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 startWatchingPid:x0 sharedMem:x1 length:x2 bundleID:x3];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusForHangWithDuration_timedOut_(void *a1, const char *a2, ...)
{
  return [a1 statusForHangWithDuration:x0 timedOut:x1];
}

id objc_msgSend_stopMonitoringAppLaunchSignposts(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringAppLaunchSignposts];
}

id objc_msgSend_stopMonitoringSignposts(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringSignposts];
}

id objc_msgSend_stopMonitoringWorkflows(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringWorkflows];
}

id objc_msgSend_stopWatchingAllPids(void *a1, const char *a2, ...)
{
  return _[a1 stopWatchingAllPids];
}

id objc_msgSend_stopWatchingPid_(void *a1, const char *a2, ...)
{
  return [a1 stopWatchingPid:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:")];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stringByPaddingToLength:withString:startingAtIndex:];
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingCharactersInRange:withString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 stringProperty:x0 contextPrefixOut:x1];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return _[a1 subtype];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return [a1 targetWithProcessIdentity:];
}

id objc_msgSend_thirdPartyDevHangHUDEnabled(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevHangHUDEnabled];
}

id objc_msgSend_thirdPartyDevPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevPreferredLanguages];
}

id objc_msgSend_thirdPartyIncludeNonDevelopmentApps(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyIncludeNonDevelopmentApps];
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return _[a1 threadID];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return _[a1 timedOut];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _[a1 toValue];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntProperty:x0 contextPrefixOut:x1];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongProperty:x0 contextPrefixOut:&x1];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_update_options_(void *a1, const char *a2, ...)
{
  return [a1 update:options:];
}

id objc_msgSend_updateAnimation_toValue_duration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateAnimation:toValue:duration:");
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateBlock];
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 updateConfiguration:];
}

id objc_msgSend_updateCornerRadiusAndSidePaddingIfNecessary_(void *a1, const char *a2, ...)
{
  return [a1 updateCornerRadiusAndSidePaddingIfNecessary:];
}

id objc_msgSend_updateCurrentTheme(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentTheme];
}

id objc_msgSend_updateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 updateDisplayLink];
}

id objc_msgSend_updateHUDLineWithId_content_options_(void *a1, const char *a2, ...)
{
  return [a1 updateHUDLineWithId:content:options:];
}

id objc_msgSend_updateHangs_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 updateHangs:withCompletion:];
}

id objc_msgSend_updatesComplete(void *a1, const char *a2, ...)
{
  return _[a1 updatesComplete];
}

id objc_msgSend_userActionData(void *a1, const char *a2, ...)
{
  return _[a1 userActionData];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _[a1 valid];
}

id objc_msgSend_valueAtTime_(void *a1, const char *a2, ...)
{
  return [a1 valueAtTime:];
}

id objc_msgSend_valueLayer(void *a1, const char *a2, ...)
{
  return _[a1 valueLayer];
}

id objc_msgSend_workflowResponsivenessDailyLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 workflowResponsivenessDailyLogLimit];
}

id objc_msgSend_workflowResponsivenessEnabled(void *a1, const char *a2, ...)
{
  return _[a1 workflowResponsivenessEnabled];
}

id objc_msgSend_workflowResponsivenessPerPeriodLogLimit(void *a1, const char *a2, ...)
{
  return _[a1 workflowResponsivenessPerPeriodLogLimit];
}