void sub_100003BB4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t vars8;

  v6 = a2;
  v5 = a3;
  if (v6 && !v5) {
    [*(id *)(a1 + 32) indexContentPackage:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100003D50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000148AC();
  }

  v4 = [WeakRetained appConnections];
  [v4 addObject:*(void *)(a1 + 32)];
}

void sub_1000040FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004808(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[TPSLogger indexing];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100014490();
  }

  v5 = +[TPSSearchItemIndexer default];
  v6 = [*(id *)(a1 + 32) tipMap];
  v7 = [v6 allValues];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000094DC;
  v9[3] = &unk_100020C40;
  id v10 = v3;
  id v8 = v3;
  [v5 indexTips:v7 qualityOfService:9 completionHandler:v9];
}

void sub_100004E4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100005674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_100005704(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005714(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appConnections];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_100005B8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v13 = +[TPSLogger welcome];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "xpc_activity to show welcome notification \"run\" received", (uint8_t *)&v14, 2u);
    }

    [*(id *)(a1 + 32) setWelcomeXPCActivityScheduleInProgress:0];
    [*(id *)(a1 + 32) registerToNotifyWelcome];
  }
  else if (!state)
  {
    v5 = +[TPSLogger welcome];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "xpc activity check in state received.", (uint8_t *)&v14, 2u);
    }

    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    v7 = v6;
    if (!v6 || xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY) <= 0)
    {
      id v8 = [*(id *)(a1 + 32) getCurrentWelcomeActivityCriteria];

      xpc_activity_set_criteria(v3, v8);
      int64_t int64 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_DELAY);
      int64_t v10 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_GRACE_PERIOD);
      v11 = +[TPSLogger welcome];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2048;
        int64_t v17 = int64;
        __int16 v18 = 2048;
        int64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification with identifier %@, delay %lld, grace period %lld", (uint8_t *)&v14, 0x20u);
      }

      v7 = v8;
    }
  }
}

void sub_100006228(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [a1[4] setObject:a1[5] forKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
    [a1[4] synchronize];
    xpc_object_t v6 = [a1[6] getCurrentWelcomeActivityCriteria];
    id v7 = a1[4];
    id v8 = +[NSDate date];
    [v7 setObject:v8 forKey:@"TPSWelcomeNotificationStartDate"];

    [a1[4] synchronize];
    v9 = (const char *)[a1[5] UTF8String];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000644C;
    handler[3] = &unk_100020A20;
    handler[4] = a1[6];
    xpc_activity_register(v9, v6, handler);
    int64_t int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY);
    int64_t v11 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_GRACE_PERIOD);
    uint64_t v12 = +[TPSLogger welcome];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = a1[5];
      *(_DWORD *)buf = 138412802;
      id v16 = v13;
      __int16 v17 = 2048;
      int64_t v18 = int64;
      __int16 v19 = 2048;
      int64_t v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification with identifier %@, delay %lld, grace period %lld", buf, 0x20u);
    }
  }
  else
  {
    if ((+[TPSUserTypesValidation isBetaBuild] & 1) == 0
      && (+[TPSUserTypesValidation isInternalBuild](TPSUserTypesValidation, "isInternalBuild") & 1) == 0&& [v5 code] != (id)-1009)
    {
      [a1[6] stopWelcomeNotification];
    }
    [a1[6] setWelcomeXPCActivityScheduleInProgress:0];
  }
}

id sub_10000644C(uint64_t a1, xpc_activity_t activity)
{
  id result = (id)xpc_activity_get_state(activity);
  if (result == (id)2)
  {
    [*(id *)(a1 + 32) setWelcomeXPCActivityScheduleInProgress:0];
    v4 = *(void **)(a1 + 32);
    return [v4 registerToNotifyWelcome];
  }
  return result;
}

id sub_100006D38(uint64_t a1)
{
  return _[*(id *)(a1 + 32) registerXPCEventHandlers];
}

void sub_1000072A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000072BC(uint64_t a1, int a2)
{
  if ((int)MKBDeviceUnlockedSinceBoot() >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    char v5 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)byte_1000261B0, (unsigned __int8 *)&v5, 1u);
    xpc_object_t v6 = +[TPSLogger daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = atomic_load(byte_1000261B0);
      v8[0] = 67109120;
      v8[1] = v7 & 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "First unlock received %d", (uint8_t *)v8, 8u);
    }

    [WeakRetained initialize];
    notify_cancel(a2);
  }
}

BOOL sub_100007460(uint64_t a1, void *a2, xpc_activity_state_t a3)
{
  char v5 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v5);
  unsigned __int8 v7 = +[TPSLogger daemon];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v17 = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    xpc_activity_state_t v20 = state;
    __int16 v21 = 2048;
    xpc_activity_state_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Transitioning activity (%@) from state %ld to state %ld.", (uint8_t *)&v17, 0x20u);
  }

  BOOL v9 = state == a3;
  if (state == a3)
  {
    int64_t v10 = +[TPSLogger daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      xpc_activity_state_t v20 = a3;
      uint64_t v12 = "Activity (%@) state is already %ld. No change necessary.";
      id v13 = v10;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!xpc_activity_set_state(v5, a3))
  {
    int64_t v10 = +[TPSLogger daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2048;
      xpc_activity_state_t v20 = state;
      __int16 v21 = 2048;
      xpc_activity_state_t v22 = a3;
      uint64_t v12 = "Failed to transition activity (%@) from state %ld to state %ld.";
      id v13 = v10;
      uint32_t v14 = 32;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

uint64_t sub_100007708(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    *(unsigned char *)(v2 + 24) = 1;
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void sub_100007A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

void sub_100007A70(uint64_t a1, void *a2, void *a3)
{
  char v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v5) = [WeakRetained contentUpdatePostProcessingContentPackage:v7 shouldUpdateNotification:*(unsigned __int8 *)(a1 + 64) shouldDeferBlock:*(void *)(a1 + 40) error:v6];

  if (v5) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 5;
  }
  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), v8);
}

void sub_100007F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_100007FA0()
{
}

void sub_100007FA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (state == 2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) shouldDeferBlockForXPCActivity:v3];
    id v7 = [*(id *)(a1 + 32) xpcActivitySetStateBlockForIdentifier:@"com.apple.tipsd.postInstall-utility"];
    uint64_t v8 = +[TPSLogger daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v13 = @"com.apple.tipsd.postInstall-utility";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "1 to 5 minutes post install load event received: %@", buf, 0xCu);
    }

    if ((v6[2](v6) & 1) == 0) {
      [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonUpgrade];
    }
    if (v6[2](v6))
    {
      uint64_t v9 = 3;
    }
    else if (!*(unsigned char *)(a1 + 48) {
           && (unsigned __int8 v10 = atomic_load(byte_1000261B0), (v10 & 1) != 0)
    }
           && [WeakRetained setupCompleted])
    {
      LOBYTE(v11) = 0;
      [WeakRetained updateContentWithActivity:v3 identifier:@"com.apple.tipsd.postInstall-utility" preferredNotificationIdentifiers:0 multiuserModeOn:*(unsigned __int8 *)(a1 + 48) contextualEligibility:1 widgetEligibility:1 notificationEligibility:v11];
      if (v6[2](v6)) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 5;
      }
    }
    else
    {
      uint64_t v9 = 5;
    }
    ((void (**)(void, _xpc_activity_s *, uint64_t))v7)[2](v7, v3, v9);
  }
}

void sub_100008194(uint64_t a1, void *a2)
{
  id v7 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v7);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (state == 2)
  {
    [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonContentCheck];
    LOBYTE(v6) = 1;
    [v5 updateContentWithActivity:v7 identifier:@"com.apple.tipsd.update-content" preferredNotificationIdentifiers:0 multiuserModeOn:*(unsigned __int8 *)(a1 + 40) contextualEligibility:1 widgetEligibility:1 notificationEligibility:v6];
  }
}

void sub_100008240(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (state == 2)
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (WeakRetained)
      {
        unsigned __int8 v7 = atomic_load(byte_1000261B0);
        if (v7)
        {
          [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonAnalyticsMaintenance];
          if ([v6 setupCompleted])
          {
            id v8 = objc_alloc((Class)TPSAnalyticsProcessingController);
            uint64_t v9 = [v6[14] tipStatusMap];
            unsigned __int8 v10 = [v9 allValues];
            uint64_t v11 = [v6 contextualInfoMap];
            uint64_t v12 = [v6[15] eventsHistoryController];
            CFStringRef v13 = [v12 contextualEventsForIdentifiers];
            uint32_t v14 = [v6 tipsManager];
            uint64_t v15 = [v14 experiment];
            id v16 = [v8 initWithAllTipStatus:v10 contextualInfoMap:v11 eventHistoryMap:v13 experiment:v15];

            [v16 processAnalytics];
          }
        }
      }
    }
    if (!xpc_activity_set_state(v3, 5))
    {
      int v17 = +[TPSLogger daemon];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed setting activity state to done", v18, 2u);
      }
    }
  }
}

void sub_100008404(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = +[TPSLogger daemon];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSString stringWithUTF8String:kNSURLSessionLaunchOnDemandNotificationName];
    int v4 = 138412290;
    char v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ launch event received", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000084D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[TPSLogger daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = +[NSString stringWithUTF8String:"com.apple.coreduetcontext.client_event_stream"];
    int v13 = 138412290;
    uint32_t v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ launch event received", (uint8_t *)&v13, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v7 = WeakRetained;
  if (!*(unsigned char *)(a1 + 40))
  {
    if (WeakRetained)
    {
      unsigned __int8 v8 = atomic_load(byte_1000261B0);
      if (v8)
      {
        [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonDuet];
        string = xpc_dictionary_get_string(v3, "msgtype");
        if (string)
        {
          unsigned __int8 v10 = +[NSString stringWithUTF8String:string];
          unsigned int v11 = [v10 isEqualToString:@"notification"];

          if (v11)
          {
            if (xpc_dictionary_get_string(v3, "id"))
            {
              uint64_t v12 = +[TPSLogger daemon];
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                sub_10001441C();
              }
            }
          }
        }
      }
    }
  }
}

void sub_100008684(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = WeakRetained == 0;
  }
  if (!v6)
  {
    unsigned __int8 v7 = atomic_load(byte_1000261B0);
    if (v7)
    {
      unsigned __int8 v8 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, _xpc_event_key_name)];
      uint64_t v9 = +[TPSLogger daemon];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "notifyd.matching event received %@", buf, 0xCu);
      }

      if (![v5 tipsInValidState]) {
        goto LABEL_29;
      }
      unsigned __int8 v10 = [*(id *)(a1 + 32) notificationTimingDarwinKey];
      unsigned int v11 = [v8 isEqualToString:v10];

      if (v11)
      {
        if ([v5 setupCompleted]) {
          [v5 showNewTipNotification];
        }
      }
      else
      {
        if (![v8 isEqualToString:BYSetupAssistantExitedDarwinNotification])
        {
          if ([v8 isEqualToString:@"com.apple.language.changed"])
          {
            [v5 handleLanguageDidChangeNotification];
          }
          else
          {
            if (![v8 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
            {
              if ([v8 isEqualToString:@"com.apple.bluetooth.pairing"])
              {
                int v17 = +[TPSTipsManager immediateNotificationIdentifierForType:0];
                uint64_t v18 = +[TPSTipsManager immediateNotificationIdentifierForType:1];
                v23[0] = v18;
                v23[1] = v17;
                __int16 v19 = +[NSArray arrayWithObjects:v23 count:2];
              }
              else
              {
                xpc_activity_state_t v20 = TPSHMManagerSpeakersConfiguredChangedNotificationString();
                unsigned int v21 = [v8 isEqualToString:v20];

                if (v21)
                {
                  int v17 = +[TPSTipsManager immediateNotificationIdentifierForType:2];
                  xpc_activity_state_t v22 = v17;
                  __int16 v19 = +[NSArray arrayWithObjects:&v22 count:1];
                }
                else
                {
                  int v17 = +[TPSLogger daemon];
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v25 = v8;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Event %@ not handled", buf, 0xCu);
                  }
                  __int16 v19 = 0;
                }
              }

              [v5 immediateNotificationForIdentifiers:v19];
              goto LABEL_29;
            }
            [v5 handleDeviceFirstUnlockNotification];
          }
LABEL_30:

          goto LABEL_31;
        }
        if (*(unsigned char *)(a1 + 48)) {
          exit(0);
        }
        id v12 = +[TPSCommonDefines sharedInstance];
        int v13 = +[TPSCommonDefines clientBundleIdentifier];
        unsigned int v14 = +[TPSCommonDefines isAppValidWithBundleIdentifier:v13];

        uint64_t v15 = +[TPSLogger daemon];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "App state valid: %d", buf, 8u);
        }

        id v16 = [v5 welcome];
        [v16 createWelcomeXPCActivity];
      }
LABEL_29:
      [v5 unregisterDarwinNotification:v8];
      goto LABEL_30;
    }
  }
LABEL_31:
}

void sub_100008FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = +[TPSLogger daemon];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = [*(id *)(a1 + 32) document];
      BOOL v6 = [v5 identifier];
      int v7 = 138412546;
      unsigned __int8 v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notification image for %@ cache at %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [*(id *)(a1 + 40) prepareForNotifications];
}

void sub_100009218(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_10000923C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [v8 identifier];
  unsigned int v11 = [v8 correlationID];

  id v12 = +[TPSLogger daemon];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v13)
    {
      int v19 = 138413058;
      xpc_activity_state_t v20 = v10;
      __int16 v21 = 2112;
      xpc_activity_state_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to send a notification with identifier: %@ correlation id: %@, type: %ld with error: %@", (uint8_t *)&v19, 0x2Au);
    }

    if ([v7 code] == (id)4)
    {
      id v14 = [objc_alloc((Class)TPSAnalyticsEventTipNotDisplayed) initWithTipID:v10 correlationID:v11 reason:5 context:0];
      [v14 log];
      uint64_t v15 = [WeakRetained notificationController];
      [WeakRetained notificationController:v15 markIdentifier:v10 type:a3 ineligibleWithReason:5];
    }
    if (a3 != 3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v13)
  {
    int v19 = 138412802;
    xpc_activity_state_t v20 = v10;
    __int16 v21 = 2112;
    xpc_activity_state_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sent a notification with identifier: %@ correlation id: %@, type: %ld", (uint8_t *)&v19, 0x20u);
  }

  switch(a3)
  {
    case 3:
      +[TPSTipsManager removeWelcomeDocumentCache];
LABEL_15:
      id v16 = [WeakRetained welcome];
      [v16 welcomeNotificationDisplayed];
LABEL_16:

      break;
    case 2:
      if (v11) {
        int v17 = v11;
      }
      else {
        int v17 = v10;
      }
      id v18 = v17;
      id v16 = +[TPSCloudController sharedInstance];
      [v16 hintDisplayedForContentID:v18];

      goto LABEL_16;
    case 1:
      [WeakRetained hintDisplayedForIdentifier:v10 correlationID:v11 context:0];
      break;
  }
LABEL_17:
}

void sub_1000094D4(uint64_t a1)
{
}

void sub_1000094DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[TPSLogger indexing];
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000144C4();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tips indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009598(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[TPSLogger indexing];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001452C();
  }

  char v5 = [*(id *)(a1 + 32) userGuides];
  BOOL v6 = +[TPSSearchItemIndexer default];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10000969C;
  v8[3] = &unk_100020C40;
  id v9 = v3;
  id v7 = v3;
  [v6 indexUserGuides:v5 qualityOfService:9 completionHandler:v8];
}

void sub_10000969C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[TPSLogger indexing];
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014560();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User Guide indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009758(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_100009F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009F60(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3)
  {
    id v10 = v7;
    id v7 = [v7 intValue];
    id v8 = v10;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

  return _objc_release_x1(v7, v8);
}

void sub_10000A300(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assistantConnections];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10000A430(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained assistantConnections];
  [v2 addObject:*(void *)(a1 + 32)];
}

void sub_10000A560(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained assistantConnections];
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      char v5 = [v6 assistantConnections];
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_10000A6CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assistantConnections];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10000A7FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained discoverabilityConnections];
  [v2 addObject:*(void *)(a1 + 32)];
}

void sub_10000A92C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained discoverabilityConnections];
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      char v5 = [v6 discoverabilityConnections];
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_10000AA9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained appConnections];
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      char v5 = [v6 appConnections];
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_10000AB3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssistantXPCConnection:v3];

  unsigned int v4 = +[TPSLogger daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device Expert xpc connection invalidated", v5, 2u);
  }
}

void sub_10000ABDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAppXPCConnection:v3];

  unsigned int v4 = +[TPSLogger daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App xpc connection invalidated", v5, 2u);
  }
}

void sub_10000AC7C(id a1)
{
  uint64_t v1 = +[TPSLogger daemon];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "standard access connection invalidated", v2, 2u);
  }
}

void sub_10000ACEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeDiscoverabilityXPCConnection:v3];

  unsigned int v4 = +[TPSLogger daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Discoverability xpc connection invalidated", v5, 2u);
  }
}

void sub_10000AD8C(id a1)
{
  uint64_t v1 = +[TPSLogger daemon];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "xpc connection from client interrupted!", v2, 2u);
  }
}

void sub_10000B664(id a1, TPSContentPackage *a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = +[TPSLogger daemon];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Failed to update content for language change. Error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Successfully updated content for language change";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean();
}

void sub_10000B810(id a1, TPSContentPackage *a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = +[TPSLogger daemon];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Failed to reregister event registration. Error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Successfully registered events from first unlock notification";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean();
}

void sub_10000BB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BBC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained notificationController];
  id v6 = [v5 notificationCache];

  if (!v6)
  {
    id v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No document found to notify.", buf, 2u);
    }

    uint32_t v8 = [v3 collectionMap];
    id v21 = v3;
    xpc_activity_state_t v22 = [v3 tipMap];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];

          if (v15)
          {
            id v16 = +[TPSCommonDefines sharedInstance];
            int v17 = +[NSSet setWithObject:v14];
            [v16 activatedCollections:v17];

            id v18 = +[TPSCloudController sharedInstance];
            [v18 hintDisplayedForContentID:v14];
          }
          else
          {
            int v19 = [v22 objectForKeyedSubscript:v14];
            id v18 = v19;
            if (v19)
            {
              xpc_activity_state_t v20 = [v19 correlationID];
              [WeakRetained hintDisplayedForIdentifier:v14 correlationID:v20 context:0];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    id v3 = v21;
    id v6 = 0;
  }
  [WeakRetained updateNotificationStatus];
}

void sub_10000C034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint32_t v8 = [WeakRetained tipsManager];
  id v9 = [v8 processUserGuidesFromContentPackage:v6];

  if (v5)
  {
    id v10 = +[TPSLogger daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User guide map may be missing items due to %@", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C2A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  if (v5)
  {
    id v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000149B8(a1, v5, v7);
    }
  }
  else
  {
    uint32_t v8 = +[TPSLogger daemon];
    id v7 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Downloaded remote tip %@", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100014948(a1, v7, v10, v11, v12, v13, v14, v15);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C68C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = 32;
  if (!v2) {
    uint64_t v3 = 40;
  }
  unsigned int v4 = [*(id *)(a1 + v3) error];

  if (v4)
  {
    id v5 = +[TPSLogger daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014AE0(a1, v5, v6, v7, v8, v9, v10, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v12 = objc_alloc((Class)TPSAssetsInfo);
    uint64_t v13 = [*(id *)(a1 + 40) assetIdentifier];
    uint64_t v14 = [*(id *)(a1 + 40) downloadedURL];
    uint64_t v15 = [*(id *)(a1 + 32) assetIdentifier];
    int v16 = [*(id *)(a1 + 32) downloadedURL];
    id v17 = [v12 initWithVideoIdentifier:v13 videoURL:v14 imageIdentifier:v15 imageURL:v16];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000D95C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10000D988(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
        if (v6)
        {
          uint64_t v14 = 0;
        }
        else
        {
          uint64_t v14 = [*(id *)(a1 + 32) miniTipMetadataForContent:*(void *)(*((void *)&v21 + 1) + 8 * (void)v12) bundleID:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
          uint64_t v15 = [v14 error];
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v14 == 0;
          }
          if (v16)
          {
            id v6 = (id)v15;
          }
          else
          {
            [*(id *)(a1 + 56) addObject:v14];
            id v6 = 0;
          }
        }
        id v17 = [v13 identifier:v21];
        [WeakRetained donateContentRetrieved:v17 bundleID:*(void *)(a1 + 40) context:*(void *)(a1 + 48) error:v6];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v18 = *(void **)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  if (v18)
  {
    id v20 = [v18 copy];
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v20, v6);
  }
  else
  {
    (*(void (**)(void, void, id))(v19 + 16))(*(void *)(a1 + 64), 0, v6);
  }
}

void sub_10000DDC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000DE98;
  v10[3] = &unk_100020EE0;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_10000DE98(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tipsManager];
  uint64_t v3 = [v2 welcomeCollectionFromContentPackage:*(void *)(a1 + 40)];

  if (v3 && ([v3 notification], unsigned int v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = [*(id *)(a1 + 40) language];
    unsigned __int8 v6 = +[TPSTipsManager deviceLocalesContainLanguage:v5];

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No proper translated content found for the device.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    uint64_t v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) collectionMap];
      id v9 = [v8 allKeys];
      id v10 = +[TPSCommonDefines sharedInstance];
      id v11 = [v10 collectionIdentifierForCurrentUserType];
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to display welcome notification because collection map %@ does not contain proper notification for collection %@", (uint8_t *)&v12, 0x16u);
    }
  }

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10000EE18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000EE40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

int main(int argc, const char **argv, const char **envp)
{
  qword_100026860 = 0;
  qword_100026868 = 0;
  qword_100026870 = 0;
  sub_10000EFF0();
  id v4 = [self mainRunLoop];
  [v4 run];

  return 0;
}

id sub_10000EFF0()
{
  uint64_t v0 = type metadata accessor for TipsLog();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!_set_user_dir_suffix())
  {
    static TipsLog.default.getter();
    uint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    _StringGuts.grow(_:)(59);
    v20._countAndFlagsBits = 0xD000000000000039;
    v20._object = (void *)0x8000000100019140;
    String.append(_:)(v20);
    v22[3] = errno.getter();
    v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    logError(_:_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    abort();
  }
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8
    || [self isInternalDevice]
    && ([self run] & 1) != 0)
  {
    exit(0);
  }
  id v9 = [objc_allocWithZone((Class)TPSDaemon) init];
  id v10 = (void *)qword_100026860;
  qword_100026860 = (uint64_t)v9;

  id v11 = objc_allocWithZone((Class)NSXPCListener);
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v11 initWithMachServiceName:v12];

  __int16 v14 = (void *)qword_100026868;
  qword_100026868 = (uint64_t)v13;

  if (qword_100026868)
  {
    [(id)qword_100026868 setDelegate:qword_100026860];
    if (qword_100026868) {
      [(id)qword_100026868 resume];
    }
  }
  id result = [self allowsDE];
  if (result)
  {
    id v16 = objc_allocWithZone((Class)NSXPCListener);
    NSString v17 = String._bridgeToObjectiveC()();
    id v18 = [v16 initWithMachServiceName:v17];

    uint64_t v19 = (void *)qword_100026870;
    qword_100026870 = (uint64_t)v18;

    id result = (id)qword_100026870;
    if (qword_100026870)
    {
      [(id)qword_100026870 setDelegate:qword_100026860];
      id result = (id)qword_100026870;
      if (qword_100026870) {
        return [(id)qword_100026870 resume];
      }
    }
  }
  return result;
}

BOOL sub_10000F330(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000F344()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000F38C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000F3B8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t TPSDaemon.findMatchingResultId(from:reply:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  v22[0] = a2;
  sub_10000F758(&qword_1000267C0);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TipsLog();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)v22 - v12;
  static TipsLog.default.getter();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD00000000000001ELL;
  unint64_t v24 = 0x80000001000191A0;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v22[1] = v14;
  v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  logDebug(_:_:)();
  swift_bridgeObjectRelease();
  id v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v13, v7);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_5;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    uint64_t v17 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
    id v18 = (void *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    uint64_t v19 = v22[0];
    v18[4] = a1;
    v18[5] = v19;
    v18[6] = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100011674((uint64_t)v6, (uint64_t)&unk_1000267D0, (uint64_t)v18);
    return swift_release();
  }
  static TipsLog.targeting.getter();
  log(_:_:)();
  v16(v11, v7);
  return ((uint64_t (*)(void, void, void))v22[0])(0, 0, 0);
}

uint64_t sub_10000F758(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000F79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[34] = a5;
  v6[35] = a6;
  v6[33] = a4;
  uint64_t v7 = type metadata accessor for TipsLog();
  v6[36] = v7;
  v6[37] = *(void *)(v7 - 8);
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return _swift_task_switch(sub_10000F870, 0, 0);
}

uint64_t sub_10000F870()
{
  unint64_t v1 = *(void *)(v0 + 264);
  *(void *)(v0 + 320) = [objc_allocWithZone((Class)TPSTargetingCache) init];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 328) = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v30 = 0;
    uint64_t v32 = 0;
    v33 = 0;
LABEL_21:
    v42 = *(void **)(v0 + 320);
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v30, v32, 0);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    v43 = *(uint64_t (**)(void))(v0 + 8);
    return v43();
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
  *(void *)(v0 + 328) = v41;
  if (!v41) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = *(void *)(v0 + 264);
    if ((v4 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v4 + 8 * v3 + 32);
    }
    unint64_t v6 = v5;
    *(void *)(v0 + 336) = v5;
    *(void *)(v0 + 344) = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v7 = ResultContext.conditions.getter();
    *(void *)(v0 + 352) = 0;
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v0 + 312);
    uint64_t v11 = *(void *)(v0 + 288);
    uint64_t v10 = *(void *)(v0 + 296);
    static TipsLog.targeting.getter();
    *(void *)(v0 + 176) = 0;
    *(void *)(v0 + 184) = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    uint64_t v12 = ResultContext.resultId.getter();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 160) = v12;
    *(void *)(v0 + 168) = v14;
    v15._countAndFlagsBits = 0xD000000000000022;
    v15._object = (void *)0x80000001000192F0;
    String.append(_:)(v15);
    v16._countAndFlagsBits = Dictionary.description.getter();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    logDebug(_:_:)();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    *(void *)(v0 + 360) = v17;
    *(void *)(v0 + 368) = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v17(v9, v11);
    if (!*(void *)(v8 + 16))
    {
      uint64_t v26 = *(void *)(v0 + 312);
      uint64_t v27 = *(void *)(v0 + 288);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      static TipsLog.targeting.getter();
      _StringGuts.grow(_:)(29);
      ResultContext.resultId.getter();
      swift_bridgeObjectRelease();
      v28._object = (void *)0x8000000100019380;
      v28._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v28);
      log(_:_:)();
      swift_bridgeObjectRelease();
      v17(v26, v27);
      id v29 = *(id *)(v0 + 336);
      uint64_t v30 = ResultContext.resultId.getter();
      uint64_t v32 = v31;

      v33 = *(void **)(v0 + 336);
      goto LABEL_21;
    }
    sub_1000111F8(v8);
    swift_bridgeObjectRelease();
    id v18 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v20 = [v18 initWithDictionary:isa];
    *(void *)(v0 + 376) = v20;

    if (v20) {
      break;
    }
    uint64_t v21 = *(void *)(v0 + 312);
    uint64_t v22 = *(void *)(v0 + 288);
    static TipsLog.targeting.getter();
    *(void *)(v0 + 208) = 0;
    *(void *)(v0 + 216) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    uint64_t v23 = *(void *)(v0 + 216);
    *(void *)(v0 + 144) = *(void *)(v0 + 208);
    *(void *)(v0 + 152) = v23;
    v24._countAndFlagsBits = ResultContext.resultId.getter();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._countAndFlagsBits = 0xD000000000000038;
    v25._object = (void *)0x8000000100019320;
    String.append(_:)(v25);
    logError(_:_:)();

    swift_bridgeObjectRelease();
    v17(v21, v22);
    uint64_t v3 = *(void *)(v0 + 344);
    if (v3 == *(void *)(v0 + 328)) {
      goto LABEL_20;
    }
  }
  id v34 = [v20 conditions];
  sub_1000141AC(0, &qword_100026838);
  unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  if (v35 >> 62)
  {
    sub_10000F758(&qword_100026840);
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  }
  v45 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease();
  v36 = self;
  sub_10000F758(&qword_100026840);
  Class v37 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 384) = v37;
  swift_bridgeObjectRelease();
  id v38 = [v20 joinType];
  ResultContext.resultId.getter();
  NSString v39 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 392) = v39;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 408;
  *(void *)(v0 + 24) = sub_100010028;
  uint64_t v40 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_1000115C0;
  *(void *)(v0 + 104) = &unk_100021188;
  *(void *)(v0 + 112) = v40;
  [v36 validateConditions:v37 joinType:v38 context:v39 cache:v45 completionQueue:0 completionHandler:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100010028()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 400) = v1;
  if (v1) {
    uint64_t v2 = sub_100010974;
  }
  else {
    uint64_t v2 = sub_100010138;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100010138()
{
  uint64_t v2 = *(void **)(v0 + 384);
  uint64_t v1 = *(void **)(v0 + 392);
  uint64_t v3 = *(void **)(v0 + 376);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 304);
  uint64_t v6 = *(void *)(v0 + 288);
  int v7 = *(unsigned __int8 *)(v0 + 408);

  static TipsLog.targeting.getter();
  *(void *)(v0 + 224) = ResultContext.resultId.getter();
  *(void *)(v0 + 232) = v8;
  v9._countAndFlagsBits = 32;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  if (v7) {
    uint64_t v10 = 0x6465686374616DLL;
  }
  else {
    uint64_t v10 = 0x6374616D20746F6ELL;
  }
  if (v7) {
    unint64_t v11 = 0xE700000000000000;
  }
  else {
    unint64_t v11 = 0xEB00000000646568;
  }
  unint64_t v12 = v11;
  String.append(_:)(*(Swift::String *)&v10);
  swift_bridgeObjectRelease();
  log(_:_:)();
  swift_bridgeObjectRelease();

  v4(v5, v6);
  if (v7)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    id v13 = *(id *)(v0 + 336);
    uint64_t v14 = ResultContext.resultId.getter();
    uint64_t v16 = v15;

    uint64_t v17 = *(void **)(v0 + 336);
    goto LABEL_12;
  }

  uint64_t v18 = *(void *)(v0 + 344);
  if (v18 == *(void *)(v0 + 328))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
LABEL_12:
    uint64_t v19 = *(void **)(v0 + 320);
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v14, v16, 0);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    id v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
  id v22 = *(id *)(v0 + 352);
  while (1)
  {
    uint64_t v32 = *(void *)(v0 + 264);
    if ((v32 & 0xC000000000000001) != 0) {
      id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v33 = *(id *)(v32 + 8 * v18 + 32);
    }
    id v34 = v33;
    *(void *)(v0 + 336) = v33;
    *(void *)(v0 + 344) = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    uint64_t v35 = ResultContext.conditions.getter();
    *(void *)(v0 + 352) = v22;
    if (!v22) {
      break;
    }
    uint64_t v23 = *(void **)(v0 + 336);
    uint64_t v24 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 288);
    uint64_t v25 = *(void *)(v0 + 296);
    static TipsLog.targeting.getter();
    *(void *)(v0 + 240) = 0;
    *(void *)(v0 + 248) = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    uint64_t v27 = *(void *)(v0 + 248);
    *(void *)(v0 + 192) = *(void *)(v0 + 240);
    *(void *)(v0 + 200) = v27;
    v28._countAndFlagsBits = ResultContext.resultId.getter();
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    v29._countAndFlagsBits = 0xD000000000000026;
    v29._object = (void *)0x80000001000192C0;
    String.append(_:)(v29);
    swift_getErrorValue();
    v30._countAndFlagsBits = Error.localizedDescription.getter();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 0x697070696B53202ELL;
    v31._object = (void *)0xEB000000002E676ELL;
    String.append(_:)(v31);
    logError(_:_:)();

    swift_bridgeObjectRelease();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
LABEL_17:
    id v22 = 0;
    uint64_t v18 = *(void *)(v0 + 344);
    if (v18 == *(void *)(v0 + 328)) {
      goto LABEL_11;
    }
  }
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)(v0 + 312);
  uint64_t v39 = *(void *)(v0 + 288);
  uint64_t v38 = *(void *)(v0 + 296);
  static TipsLog.targeting.getter();
  *(void *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = 0xE000000000000000;
  _StringGuts.grow(_:)(38);
  uint64_t v40 = ResultContext.resultId.getter();
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 160) = v40;
  *(void *)(v0 + 168) = v42;
  v43._countAndFlagsBits = 0xD000000000000022;
  v43._object = (void *)0x80000001000192F0;
  String.append(_:)(v43);
  v44._countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v44);
  swift_bridgeObjectRelease();
  logDebug(_:_:)();
  swift_bridgeObjectRelease();
  v45 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  *(void *)(v0 + 360) = v45;
  *(void *)(v0 + 368) = (v38 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v45(v37, v39);
  if (!*(void *)(v36 + 16))
  {
    uint64_t v53 = *(void *)(v0 + 312);
    uint64_t v54 = *(void *)(v0 + 288);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static TipsLog.targeting.getter();
    _StringGuts.grow(_:)(29);
    ResultContext.resultId.getter();
    swift_bridgeObjectRelease();
    v55._object = (void *)0x8000000100019380;
    v55._countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v55);
    log(_:_:)();
    swift_bridgeObjectRelease();
    v45(v53, v54);
    goto LABEL_9;
  }
  sub_1000111F8(v36);
  swift_bridgeObjectRelease();
  id v46 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v22 = [v46 initWithDictionary:isa];
  *(void *)(v0 + 376) = v22;

  if (!v22)
  {
    uint64_t v48 = *(void *)(v0 + 312);
    uint64_t v49 = *(void *)(v0 + 288);
    static TipsLog.targeting.getter();
    *(void *)(v0 + 208) = 0;
    *(void *)(v0 + 216) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    uint64_t v50 = *(void *)(v0 + 216);
    *(void *)(v0 + 144) = *(void *)(v0 + 208);
    *(void *)(v0 + 152) = v50;
    v51._countAndFlagsBits = ResultContext.resultId.getter();
    String.append(_:)(v51);
    swift_bridgeObjectRelease();
    v52._countAndFlagsBits = 0xD000000000000038;
    v52._object = (void *)0x8000000100019320;
    String.append(_:)(v52);
    logError(_:_:)();

    swift_bridgeObjectRelease();
    v45(v48, v49);
    goto LABEL_17;
  }
  id v56 = [v22 conditions];
  sub_1000141AC(0, &qword_100026838);
  unint64_t v57 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v57 >> 62))
  {
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    goto LABEL_29;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  sub_10000F758(&qword_100026840);
  _bridgeCocoaArray<A>(_:)();
  swift_bridgeObjectRelease();
LABEL_29:
  v63 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease();
  v58 = self;
  sub_10000F758(&qword_100026840);
  Class v59 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 384) = v59;
  swift_bridgeObjectRelease();
  id v60 = [v22 joinType];
  ResultContext.resultId.getter();
  NSString v61 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 392) = v61;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 408;
  *(void *)(v0 + 24) = sub_100010028;
  uint64_t v62 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_1000115C0;
  *(void *)(v0 + 104) = &unk_100021188;
  *(void *)(v0 + 112) = v62;
  [v58 validateConditions:v59 joinType:v60 context:v61 cache:v63 completionQueue:0 completionHandler:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100010974()
{
  uint64_t v1 = *(void **)(v0 + 392);
  uint64_t v3 = *(void **)(v0 + 376);
  uint64_t v2 = *(void **)(v0 + 384);
  uint64_t v4 = *(void **)(v0 + 320);
  swift_willThrow();

  id v5 = *(id *)(v0 + 400);
  uint64_t v6 = *(void **)(v0 + 336);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v53 = *(void *)(v0 + 296);
  uint64_t v55 = *(void *)(v0 + 288);
  static TipsLog.targeting.getter();
  *(void *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = 0xE000000000000000;
  _StringGuts.grow(_:)(53);
  uint64_t v8 = *(void *)(v0 + 248);
  *(void *)(v0 + 192) = *(void *)(v0 + 240);
  *(void *)(v0 + 200) = v8;
  v9._countAndFlagsBits = ResultContext.resultId.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0xD000000000000026;
  v10._object = (void *)0x80000001000192C0;
  String.append(_:)(v10);
  swift_getErrorValue();
  v11._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x697070696B53202ELL;
  v12._object = (void *)0xEB000000002E676ELL;
  String.append(_:)(v12);
  logError(_:_:)();

  swift_bridgeObjectRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v7, v55);
  uint64_t v13 = *(void *)(v0 + 344);
  if (v13 == *(void *)(v0 + 328))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
LABEL_11:
    Swift::String v43 = *(void **)(v0 + 320);
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v35, v36, 0);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v44 = *(uint64_t (**)(void))(v0 + 8);
    return v44();
  }
  else
  {
    while (1)
    {
      uint64_t v14 = *(void *)(v0 + 264);
      if ((v14 & 0xC000000000000001) != 0) {
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v15 = *(id *)(v14 + 8 * v13 + 32);
      }
      id v16 = v15;
      *(void *)(v0 + 336) = v15;
      *(void *)(v0 + 344) = v13 + 1;
      if (__OFADD__(v13, 1))
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v17 = ResultContext.conditions.getter();
      *(void *)(v0 + 352) = 0;
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)(v0 + 312);
      id v20 = v16;
      id v22 = *(void **)(v0 + 288);
      uint64_t v21 = *(void *)(v0 + 296);
      static TipsLog.targeting.getter();
      *(void *)(v0 + 176) = 0;
      *(void *)(v0 + 184) = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      id v56 = v20;
      uint64_t v23 = ResultContext.resultId.getter();
      uint64_t v25 = v24;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 160) = v23;
      *(void *)(v0 + 168) = v25;
      v26._countAndFlagsBits = 0xD000000000000022;
      v26._object = (void *)0x80000001000192F0;
      String.append(_:)(v26);
      v27._countAndFlagsBits = Dictionary.description.getter();
      String.append(_:)(v27);
      swift_bridgeObjectRelease();
      logDebug(_:_:)();
      swift_bridgeObjectRelease();
      Swift::String v28 = *(void (**)(uint64_t, id))(v21 + 8);
      *(void *)(v0 + 360) = v28;
      *(void *)(v0 + 368) = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v28(v19, v22);
      if (!*(void *)(v18 + 16))
      {
        uint64_t v38 = *(void *)(v0 + 312);
        uint64_t v39 = *(void **)(v0 + 288);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        static TipsLog.targeting.getter();
        _StringGuts.grow(_:)(29);
        ResultContext.resultId.getter();
        swift_bridgeObjectRelease();
        v40._object = (void *)0x8000000100019380;
        v40._countAndFlagsBits = 0xD00000000000001BLL;
        String.append(_:)(v40);
        log(_:_:)();
        swift_bridgeObjectRelease();
        v28(v38, v39);
        id v41 = *(id *)(v0 + 336);
        uint64_t v35 = ResultContext.resultId.getter();
        uint64_t v36 = v42;

        uint64_t v37 = *(void **)(v0 + 336);
        goto LABEL_11;
      }
      sub_1000111F8(v18);
      swift_bridgeObjectRelease();
      id v29 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v5 = [v29 initWithDictionary:isa];
      *(void *)(v0 + 376) = v5;

      if (v5) {
        break;
      }
      uint64_t v31 = *(void *)(v0 + 312);
      id v5 = *(id *)(v0 + 288);
      static TipsLog.targeting.getter();
      *(void *)(v0 + 208) = 0;
      *(void *)(v0 + 216) = 0xE000000000000000;
      _StringGuts.grow(_:)(58);
      uint64_t v32 = *(void *)(v0 + 216);
      *(void *)(v0 + 144) = *(void *)(v0 + 208);
      *(void *)(v0 + 152) = v32;
      v33._countAndFlagsBits = ResultContext.resultId.getter();
      String.append(_:)(v33);
      swift_bridgeObjectRelease();
      v34._countAndFlagsBits = 0xD000000000000038;
      v34._object = (void *)0x8000000100019320;
      String.append(_:)(v34);
      logError(_:_:)();

      swift_bridgeObjectRelease();
      v28(v31, v5);
      uint64_t v13 = *(void *)(v0 + 344);
      if (v13 == *(void *)(v0 + 328)) {
        goto LABEL_9;
      }
    }
    id v46 = [v5 conditions];
    sub_1000141AC(0, &qword_100026838);
    unint64_t v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v47 >> 62))
    {
      swift_bridgeObjectRetain();
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
      goto LABEL_16;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    sub_10000F758(&qword_100026840);
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v48 = *(void **)(v0 + 320);
    swift_bridgeObjectRelease();
    id v54 = self;
    sub_10000F758(&qword_100026840);
    Class v49 = Array._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 384) = v49;
    swift_bridgeObjectRelease();
    id v50 = [v5 joinType];
    ResultContext.resultId.getter();
    NSString v51 = String._bridgeToObjectiveC()();
    *(void *)(v0 + 392) = v51;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 408;
    *(void *)(v0 + 24) = sub_100010028;
    uint64_t v52 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_1000115C0;
    *(void *)(v0 + 104) = &unk_100021188;
    *(void *)(v0 + 112) = v52;
    [v54 validateConditions:v49 joinType:v50 context:v51 cache:v48 completionQueue:0 completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_100011130(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  Swift::String v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100014418;
  return sub_10000F79C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000111F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000F758(&qword_100026848);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100013FFC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000141E8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000141E8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000141E8(v36, v37);
    sub_1000141E8(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000141E8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1000141F8();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000115C0(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000F758(&qword_100026810);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100011674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001405C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1000118AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    NSString v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);
}

uint64_t TPSDaemon.availableUserGuideIdentifiers(reply:)(uint64_t (*a1)(void *))
{
  if (![self supportsUserGuide]) {
    return a1(&_swiftEmptyArrayStorage);
  }
  type metadata accessor for UserGuideManager();
  unint64_t v2 = static UserGuideManager.userGuides()();
  unint64_t v3 = v2;
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v4 = result;
    int64_t v16 = (void (*)(char *))a1;
    if (result) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = (void (*)(char *))a1;
  if (!v4) {
    goto LABEL_17;
  }
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v8 = *(id *)(v3 + 8 * v6 + 32);
    }
    unint64_t v9 = v8;
    uint64_t v10 = UserGuide.identifier.getter();
    uint64_t v12 = v11;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_1000131D4(0, *((void *)v7 + 2) + 1, 1, v7);
    }
    unint64_t v14 = *((void *)v7 + 2);
    unint64_t v13 = *((void *)v7 + 3);
    if (v14 >= v13 >> 1) {
      uint64_t v7 = sub_1000131D4((char *)(v13 > 1), v14 + 1, 1, v7);
    }
    ++v6;
    *((void *)v7 + 2) = v14 + 1;
    int64_t v15 = &v7[16 * v14];
    *((void *)v15 + 4) = v10;
    *((void *)v15 + 5) = v12;
  }
  while (v4 != v6);
LABEL_18:
  swift_bridgeObjectRelease_n();
  v16(v7);

  return swift_bridgeObjectRelease();
}

uint64_t TPSDaemon.fetchDocument(identifier:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_10000F758(&qword_1000267C0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a1;
  v13[8] = a2;
  id v14 = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100011674((uint64_t)v11, (uint64_t)&unk_1000267E0, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_100011CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[23] = a7;
  v8[24] = a8;
  v8[21] = a5;
  v8[22] = a6;
  v8[20] = a4;
  uint64_t v9 = type metadata accessor for TipsLog();
  v8[25] = v9;
  v8[26] = *(void *)(v9 - 8);
  v8[27] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v8[28] = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_100011E18;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v8 + 32, 0, 0, 0xD000000000000023, 0x8000000100019210, sub_100012B50, 0, &type metadata for Bool);
}

uint64_t sub_100011E18()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1000120F0;
  }
  else {
    unint64_t v2 = sub_100011F2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100011F2C()
{
  if (*(unsigned char *)(v0 + 256) == 1)
  {
    id v1 = [*(id *)(v0 + 160) tipsManager];
    *(void *)(v0 + 240) = v1;
    if (v1)
    {
      unint64_t v2 = v1;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 152;
      *(void *)(v0 + 24) = sub_100012254;
      uint64_t v3 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_100012890;
      *(void *)(v0 + 104) = &unk_1000210F8;
      *(void *)(v0 + 112) = v3;
      [v2 contentFromOrigin:0 processTipKitContent:0 contextualEligibility:0 widgetEligibility:0 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v0 + 80];
      id v1 = (id)(v0 + 16);
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_await(v1);
  }
  else
  {
    uint64_t v4 = *(void (**)(void, uint64_t))(v0 + 168);
    sub_100013BF8();
    uint64_t v5 = swift_allocError();
    unsigned char *v6 = 2;
    v4(0, v5);
    swift_errorRelease();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_1000120F0()
{
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = v0[25];
  uint64_t v5 = (void (*)(void, uint64_t))v0[21];
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  v6._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  logError(_:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_errorRetain();
  v5(0, v1);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100012254()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    uint64_t v2 = sub_100012720;
  }
  else {
    uint64_t v2 = sub_100012364;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100012364()
{
  uint64_t v1 = *(void **)(v0 + 152);

  id v2 = [v1 collectionMap];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1000141AC(0, &qword_100026808);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [v1 tipMap];
  if (v5)
  {
    Swift::String v6 = v5;
    sub_1000141AC(0, &qword_100026800);
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    if (!v4)
    {
LABEL_16:
      id v12 = 0;
      if (v7) {
        goto LABEL_17;
      }
LABEL_11:
      if (v12) {
        goto LABEL_22;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (!v4) {
      goto LABEL_16;
    }
  }
  if (!*(void *)(v4 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)(v0 + 184);
  uint64_t v8 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_100013078(v9, v8);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  id v12 = *(id *)(*(void *)(v4 + 56) + 8 * v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_11;
  }
LABEL_17:
  if (*(void *)(v7 + 16))
  {
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v13 = *(void *)(v0 + 192);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_100013078(v14, v13);
    if (v16)
    {
      id v17 = *(id *)(*(void *)(v7 + 56) + 8 * v15);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();

      id v12 = v17;
LABEL_23:
      uint64_t v18 = *(void (**)(id, void))(v0 + 168);
      id v19 = v12;
      v18(v12, 0);

      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v12)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v21 = *(void *)(v0 + 184);
  uint64_t v20 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain();
  sub_100013C4C(v7, v21, v20);
  id v12 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v24 = *(void *)(v0 + 208);
  uint64_t v23 = *(void *)(v0 + 216);
  uint64_t v26 = *(void **)(v0 + 192);
  uint64_t v25 = *(void *)(v0 + 200);
  uint64_t v27 = *(void *)(v0 + 184);
  uint64_t v28 = *(void (**)(void, uint64_t))(v0 + 168);
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = v27;
  v29._object = v26;
  String.append(_:)(v29);
  v30._countAndFlagsBits = 0x756F6620746F6E20;
  v30._object = (void *)0xEB000000002E646ELL;
  String.append(_:)(v30);
  logDebug(_:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  sub_100013BF8();
  uint64_t v31 = swift_allocError();
  *uint64_t v32 = 0;
  v28(0, v31);
  swift_errorRelease();
LABEL_26:

  swift_task_dealloc();
  long long v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_100012720()
{
  uint64_t v1 = (void *)v0[30];
  swift_willThrow();

  uint64_t v2 = v0[31];
  uint64_t v4 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v5 = v0[25];
  Swift::String v6 = (void (*)(void, uint64_t))v0[21];
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  v7._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  logError(_:_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_errorRetain();
  v6(0, v2);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100012890(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000F758(&qword_100026810);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

void sub_100012AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_100012B50(uint64_t a1)
{
  uint64_t v2 = sub_10000F758(&qword_100026818);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = [objc_allocWithZone((Class)TPSDeviceCapability) init];
  [v5 setType:2];
  [v5 setKey:kTPSCapabilitySiriLanguageMatchesSystemLanguageEnabled];
  id v6 = [self targetValidationForCapability:v5];
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100013F10;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012E14;
  aBlock[3] = &unk_100021138;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  [v6 getCurrentStateWithCompletion:v9];
  _Block_release(v9);

  return swift_unknownObjectRelease();
}

uint64_t sub_100012D70(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4[0] = a2;
    swift_errorRetain();
    sub_10000F758(&qword_100026818);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_100013FFC(a1, (uint64_t)v4);
    LOBYTE(v4[0]) = swift_dynamicCast() & v3;
    sub_10000F758(&qword_100026818);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_100012E14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(v8, a3);
  swift_release();

  return sub_100013FAC((uint64_t)v8);
}

uint64_t sub_100012EA4(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100012F80;
  return v6(a1);
}

uint64_t sub_100012F80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100013078(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000130F0(a1, a2, v4);
}

unint64_t sub_1000130F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

char *sub_1000131D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000F758(&qword_100026820);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000132DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_100014418;
  return sub_100011CD4(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_1000133B8(uint64_t a1, uint64_t a2)
{
  sub_100012AE0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000133C4()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100013414(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_1000134F0;
  return sub_100011CD4(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000134F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000135E4(unint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_10000F758(&qword_1000267C0);
  __chkstk_darwin(v4 - 8);
  v22[0] = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TipsLog();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  _Block_copy(a2);
  static TipsLog.default.getter();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD00000000000001ELL;
  unint64_t v24 = 0x80000001000191A0;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v22[1] = v14;
  v15._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  logDebug(_:_:)();
  swift_bridgeObjectRelease();
  char v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_5;
    }
LABEL_7:
    static TipsLog.targeting.getter();
    log(_:_:)();
    v16(v10, v6);
    a2[2](a2, 0, 0);
    return swift_release();
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v17 = type metadata accessor for TaskPriority();
  uint64_t v18 = v22[0];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v22[0], 1, 1, v17);
  id v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = a1;
  v19[5] = sub_100013BA4;
  v19[6] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100011674(v18, (uint64_t)&unk_1000267F0, (uint64_t)v19);
  swift_release();
  return swift_release();
}

void sub_100013964(uint64_t a1)
{
  if ([self supportsUserGuide])
  {
    type metadata accessor for UserGuideManager();
    unint64_t v2 = static UserGuideManager.userGuides()();
    unint64_t v3 = v2;
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4)
      {
LABEL_4:
        if (v4 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v5 = 0;
        uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v7 = *(id *)(v3 + 8 * v5 + 32);
          }
          uint64_t v8 = v7;
          uint64_t v9 = UserGuide.identifier.getter();
          uint64_t v11 = v10;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_1000131D4(0, *((void *)v6 + 2) + 1, 1, v6);
          }
          unint64_t v13 = *((void *)v6 + 2);
          unint64_t v12 = *((void *)v6 + 3);
          if (v13 >= v12 >> 1) {
            uint64_t v6 = sub_1000131D4((char *)(v12 > 1), v13 + 1, 1, v6);
          }
          ++v5;
          *((void *)v6 + 2) = v13 + 1;
          uint64_t v14 = &v6[16 * v13];
          *((void *)v14 + 4) = v9;
          *((void *)v14 + 5) = v11;
        }
        while (v4 != v5);
      }
    }
    swift_bridgeObjectRelease_n();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t))(a1 + 16))(a1);
LABEL_18:
}

uint64_t sub_100013B6C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100013BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000118AC(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100013BB0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_100013BF8()
{
  unint64_t result = qword_1000267F8;
  if (!qword_1000267F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000267F8);
  }
  return result;
}

void sub_100013C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_22;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v24) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v24) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v24) {
          goto LABEL_28;
        }
        unint64_t v13 = *(void *)(v23 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v24) {
            goto LABEL_28;
          }
          unint64_t v13 = *(void *)(v23 + 8 * v9);
          if (!v13)
          {
            int64_t v14 = v12 + 4;
            if (v14 >= v24) {
              goto LABEL_28;
            }
            unint64_t v13 = *(void *)(v23 + 8 * v14);
            int64_t v9 = v14;
            if (!v13) {
              break;
            }
          }
        }
      }
    }
LABEL_21:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_22:
    id v15 = *(id *)(*(void *)(a1 + 56) + 8 * v11);
    id v16 = [v15 correlationID];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v20 = v19;

      if (v18 == a2 && v20 == a3)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v22)
      {
LABEL_28:
        swift_release();
        return;
      }
    }
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v24) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_100013E7C()
{
  uint64_t v1 = sub_10000F758(&qword_100026818);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100013F10(uint64_t a1, uint64_t a2)
{
  sub_10000F758(&qword_100026818);

  return sub_100012D70(a1, a2);
}

uint64_t sub_100013F94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013FA4()
{
  return swift_release();
}

uint64_t sub_100013FAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100013FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001405C(uint64_t a1)
{
  uint64_t v2 = sub_10000F758(&qword_1000267C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000140BC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000140F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000134F0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100026828 + dword_100026828);
  return v6(a1, v4);
}

uint64_t sub_1000141AC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_1000141E8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000141F8()
{
  return swift_release();
}

unsigned char *_s12ServiceErrorOwCP(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s12ServiceErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s12ServiceErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001436CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100014394(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000143A0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *_s12ServiceErrorOMa()
{
  return &_s12ServiceErrorON;
}

unint64_t sub_1000143C0()
{
  unint64_t result = qword_100026850;
  if (!qword_100026850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026850);
  }
  return result;
}

void sub_10001441C()
{
  sub_10000EE5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Received context value change notification for registration %s", v1, 0xCu);
}

void sub_100014490()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "Tips indexing started.", v2, v3, v4, v5, v6);
}

void sub_1000144C4()
{
  sub_10000EE5C();
  sub_10000EE40((void *)&_mh_execute_header, v0, v1, "Tips indexing completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_10001452C()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "User Guide indexing started.", v2, v3, v4, v5, v6);
}

void sub_100014560()
{
  sub_10000EE5C();
  sub_10000EE40((void *)&_mh_execute_header, v0, v1, "User Guide indexing completed with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000145C8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 URL];
  sub_10000EE5C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "discretionary task with URL %@", v4, 0xCu);
}

void sub_10001465C()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "User is on a major release beta.", v2, v3, v4, v5, v6);
}

void sub_100014690(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "User is under seed build, current needsResetOnMajorGM status: %d", (uint8_t *)v2, 8u);
}

void sub_10001470C()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "User went from major release beta to GM, reset notifications.", v2, v3, v4, v5, v6);
}

void sub_100014740()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "User is on a GM build.", v2, v3, v4, v5, v6);
}

void sub_100014774()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "GM reset not needed.", v2, v3, v4, v5, v6);
}

void sub_1000147A8()
{
  sub_10000EE5C();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "VersionTokens %@, minor version %ld", v2, 0x16u);
}

void sub_10001482C(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Contains connection: %d", (uint8_t *)v3, 8u);
}

void sub_1000148AC()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "Adding app XPC Connection. ", v2, v3, v4, v5, v6);
}

void sub_1000148E0()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "Standard access connection.", v2, v3, v4, v5, v6);
}

void sub_100014914()
{
  sub_10000EE34();
  sub_10000EE18((void *)&_mh_execute_header, v0, v1, "xpc connection event tipsAppActive received.", v2, v3, v4, v5, v6);
}

void sub_100014948(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000149B8(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error downloading remote tip %@, %@", (uint8_t *)&v6, 0x16u);
}

void sub_100014A6C()
{
  sub_10000EE5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "fetchAssetsWithAssetsConfiguration - assetConfiguration: %@", v1, 0xCu);
}

void sub_100014AE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t static UserGuideManager.userGuides()()
{
  return static UserGuideManager.userGuides()();
}

uint64_t type metadata accessor for UserGuideManager()
{
  return type metadata accessor for UserGuideManager();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t static TipsLog.data.getter()
{
  return static TipsLog.data.getter();
}

uint64_t static TipsLog.default.getter()
{
  return static TipsLog.default.getter();
}

uint64_t static TipsLog.targeting.getter()
{
  return static TipsLog.targeting.getter();
}

uint64_t type metadata accessor for TipsLog()
{
  return type metadata accessor for TipsLog();
}

uint64_t ResultContext.conditions.getter()
{
  return ResultContext.conditions.getter();
}

uint64_t ResultContext.resultId.getter()
{
  return ResultContext.resultId.getter();
}

uint64_t type metadata accessor for ResultContext()
{
  return type metadata accessor for ResultContext();
}

uint64_t log(_:_:)()
{
  return log(_:_:)();
}

uint64_t logDebug(_:_:)()
{
  return logDebug(_:_:)();
}

uint64_t logError(_:_:)()
{
  return logError(_:_:)();
}

uint64_t UserGuide.identifier.getter()
{
  return UserGuide.identifier.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
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

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TPSHMManagerSpeakersConfiguredChangedNotificationString()
{
  return _TPSHMManagerSpeakersConfiguredChangedNotificationString();
}

uint64_t TPSMiniTipContentManagerServiceInterfaceServerInterface()
{
  return _TPSMiniTipContentManagerServiceInterfaceServerInterface();
}

uint64_t TPSXPCServerInterface()
{
  return _TPSXPCServerInterface();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
}

{
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
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

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addAppXPCConnection_(void *a1, const char *a2, ...)
{
  return [a1 _addAppXPCConnection:];
}

id objc_msgSend__addAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addAssistantXPCConnection:");
}

id objc_msgSend__addDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addDiscoverabilityXPCConnection:");
}

id objc_msgSend__adoptPersonaForContainerLookupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _adoptPersonaForContainerLookupIfNeeded];
}

id objc_msgSend__appXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return [_appXPCConnectionContainsConnection:];
}

id objc_msgSend__assistantXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_assistantXPCConnectionContainsConnection:");
}

id objc_msgSend__clearDisplayedContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 _clearDisplayedContentIDs];
}

id objc_msgSend__discoverabilityXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_discoverabilityXPCConnectionContainsConnection:");
}

id objc_msgSend__errorForHintIneligibleReason_contentID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_errorForHintIneligibleReason:contentID:");
}

id objc_msgSend__listDisplayContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 _listDisplayContentIDs];
}

id objc_msgSend__removeAppXPCConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeAppXPCConnection:");
}

id objc_msgSend__removeAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return [a1 _removeAssistantXPCConnection:];
}

id objc_msgSend__removeDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return [a1 _removeDiscoverabilityXPCConnection:];
}

id objc_msgSend_activatedCollections_(void *a1, const char *a2, ...)
{
  return [a1 activatedCollections:];
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return [a1 addBarrierBlock:];
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return [a1 addDependency:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addHintDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return [a1 addHintDisplayedForIdentifier:context:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_analyticsExperiment(void *a1, const char *a2, ...)
{
  return _[a1 analyticsExperiment];
}

id objc_msgSend_appConnections(void *a1, const char *a2, ...)
{
  return _[a1 appConnections];
}

id objc_msgSend_appGroupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 appGroupDefaults];
}

id objc_msgSend_appRemovalCleanupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 appRemovalCleanupIfNeeded];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 assetIdentifier];
}

id objc_msgSend_assetPathFromAssetConfiguration_type_(void *a1, const char *a2, ...)
{
  return [a1 assetPathFromAssetConfiguration:x0 type:x1];
}

id objc_msgSend_assistantConnections(void *a1, const char *a2, ...)
{
  return _[a1 assistantConnections];
}

id objc_msgSend_assistantSupportInterface(void *a1, const char *a2, ...)
{
  return _[a1 assistantSupportInterface];
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 backgroundSessionConfigurationWithIdentifier:];
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 blockOperationWithBlock:];
}

id objc_msgSend_bodyContent(void *a1, const char *a2, ...)
{
  return _[a1 bodyContent];
}

id objc_msgSend_bodyText(void *a1, const char *a2, ...)
{
  return _[a1 bodyText];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cacheIdentifierForType_(void *a1, const char *a2, ...)
{
  return [a1 cacheIdentifierForType:];
}

id objc_msgSend_cachedUserGuideMap(void *a1, const char *a2, ...)
{
  return _[a1 cachedUserGuideMap];
}

id objc_msgSend_camp(void *a1, const char *a2, ...)
{
  return _[a1 camp];
}

id objc_msgSend_cancelLegacyBackgroundTaskIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 cancelLegacyBackgroundTaskIfNeeded];
}

id objc_msgSend_cancelQueryWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelQueryWithIdentifier:];
}

id objc_msgSend_clearCachedUserGuides(void *a1, const char *a2, ...)
{
  return _[a1 clearCachedUserGuides];
}

id objc_msgSend_clearDataCache(void *a1, const char *a2, ...)
{
  return _[a1 clearDataCache];
}

id objc_msgSend_clearNotificationCache(void *a1, const char *a2, ...)
{
  return _[a1 clearNotificationCache];
}

id objc_msgSend_clearNotificationCount(void *a1, const char *a2, ...)
{
  return _[a1 clearNotificationCount];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientBundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 collectionIdentifier];
}

id objc_msgSend_collectionIdentifierForCurrentUserType(void *a1, const char *a2, ...)
{
  return _[a1 collectionIdentifierForCurrentUserType];
}

id objc_msgSend_collectionMap(void *a1, const char *a2, ...)
{
  return _[a1 collectionMap];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentForVariantIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 contentForVariantIdentifiers:];
}

id objc_msgSend_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:");
}

id objc_msgSend_contentUpdatePostProcessingContentPackage_shouldUpdateNotification_shouldDeferBlock_error_(void *a1, const char *a2, ...)
{
  return [a1 contentUpdatePostProcessingContentPackage:x0 shouldUpdateNotification:x1 shouldDeferBlock:x2 error:x3];
}

id objc_msgSend_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:");
}

id objc_msgSend_contextualEventsForIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 contextualEventsForIdentifiers];
}

id objc_msgSend_contextualInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 contextualInfoForIdentifier:];
}

id objc_msgSend_contextualInfoMap(void *a1, const char *a2, ...)
{
  return _[a1 contextualInfoMap];
}

id objc_msgSend_contextualTipsInactive(void *a1, const char *a2, ...)
{
  return _[a1 contextualTipsInactive];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return _[a1 correlationID];
}

id objc_msgSend_correlationIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 correlationIdentifierForIdentifier:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_createWelcomeXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 createWelcomeXPCActivity];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_customizationIDForContentID_(void *a1, const char *a2, ...)
{
  return [a1 customizationIDForContentID:];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return _[a1 daemon];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_default(void *a1, const char *a2, ...)
{
  return _[a1 default];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSearchableItemsWithCompletionHandler:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceLocalesContainLanguage_(void *a1, const char *a2, ...)
{
  return [a1 deviceLocalesContainLanguage:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_discoverability(void *a1, const char *a2, ...)
{
  return _[a1 discoverability];
}

id objc_msgSend_discoverabilityConnections(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilityConnections];
}

id objc_msgSend_discoverabilityController(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilityController];
}

id objc_msgSend_displayBundleID(void *a1, const char *a2, ...)
{
  return _[a1 displayBundleID];
}

id objc_msgSend_displayDarwinNotificationKey(void *a1, const char *a2, ...)
{
  return _[a1 displayDarwinNotificationKey];
}

id objc_msgSend_displayStatusCheckForHintIneligibleReasonWithContent_context_bypassExperiment_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:")];
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _[a1 displayType];
}

id objc_msgSend_displayTypeStringForDisplayType_(void *a1, const char *a2, ...)
{
  return [a1 displayTypeStringForDisplayType:];
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _[a1 document];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateContentRetrieved_bundleID_context_error_(void *a1, const char *a2, ...)
{
  return [a1 donateContentRetrieved:x0 bundleID:x1 context:x2 error:x3];
}

id objc_msgSend_donateHintIneligibleReason_contentID_bundleID_context_(void *a1, const char *a2, ...)
{
  return [a1 donateHintIneligibleReason:contentID:bundleID:context:];
}

id objc_msgSend_downloadedURL(void *a1, const char *a2, ...)
{
  return _[a1 downloadedURL];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_eventWithReason_alreadyRunning_(void *a1, const char *a2, ...)
{
  return [a1 eventWithReason:alreadyRunning:];
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_displayType_reason_date_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:");
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_serviceError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:serviceError:");
}

id objc_msgSend_eventsHistoryController(void *a1, const char *a2, ...)
{
  return _[a1 eventsHistoryController];
}

id objc_msgSend_experiment(void *a1, const char *a2, ...)
{
  return _[a1 experiment];
}

id objc_msgSend_experimentCampIDStringForCamp_(void *a1, const char *a2, ...)
{
  return [a1 experimentCampIDStringForCamp:];
}

id objc_msgSend_fetchNotificationAssetIfNeededCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchNotificationAssetIfNeededCompletionHandler:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCurrentWelcomeActivityCriteria(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentWelcomeActivityCriteria];
}

id objc_msgSend_handleDeviceFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return _[a1 handleDeviceFirstUnlockNotification];
}

id objc_msgSend_handleLanguageDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 handleLanguageDidChangeNotification];
}

id objc_msgSend_hasWidgetDocument(void *a1, const char *a2, ...)
{
  return _[a1 hasWidgetDocument];
}

id objc_msgSend_hintDisplayedDates(void *a1, const char *a2, ...)
{
  return _[a1 hintDisplayedDates];
}

id objc_msgSend_hintDisplayedForContentID_(void *a1, const char *a2, ...)
{
  return [a1 hintDisplayedForContentID:];
}

id objc_msgSend_hintDisplayedForIdentifier_correlationID_context_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hintDisplayedForIdentifier:correlationID:context:")];
}

id objc_msgSend_hintInelgibileReasonForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hintInelgibileReasonForIdentifier:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreCloud(void *a1, const char *a2, ...)
{
  return _[a1 ignoreCloud];
}

id objc_msgSend_immediateNotificationForIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 immediateNotificationForIdentifiers:];
}

id objc_msgSend_immediateNotificationIdentifierForType_(void *a1, const char *a2, ...)
{
  return [a1 immediateNotificationIdentifierForType:];
}

id objc_msgSend_indexContentPackage_(void *a1, const char *a2, ...)
{
  return [a1 indexContentPackage:];
}

id objc_msgSend_indexTips_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexTips:qualityOfService:completionHandler:")];
}

id objc_msgSend_indexUserGuides_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 indexUserGuides:qualityOfService:completionHandler:];
}

id objc_msgSend_indexing(void *a1, const char *a2, ...)
{
  return _[a1 indexing];
}

id objc_msgSend_ineligibleReasonStringForReason_(void *a1, const char *a2, ...)
{
  return [a1 ineligibleReasonStringForReason:];
}

id objc_msgSend_initWithAllTipStatus_contextualInfoMap_eventHistoryMap_experiment_(void *a1, const char *a2, ...)
{
  return [a1 initWithAllTipStatus:x0 contextualInfoMap:x1 eventHistoryMap:x2 experiment:x3];
}

id objc_msgSend_initWithAssetIdentifier_assetURLPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetIdentifier:x0 assetURLPath:x1];
}

id objc_msgSend_initWithAsyncBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithAsyncBlock:];
}

id objc_msgSend_initWithAuthenticationContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithAuthenticationContext:];
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return [a1 initWithContent:];
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataSource:];
}

id objc_msgSend_initWithDelegate_tipsManager_notificationController_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:a2 tipsManager:a3 notificationController:a4];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithTipID_correlationID_bundleID_reason_context_date_(void *a1, const char *a2, ...)
{
  return [a1 initWithTipID:x0 correlationID:x1 bundleID:x2 reason:x3 context:x4 date:x5];
}

id objc_msgSend_initWithTipID_correlationID_reason_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithTipID:x0 correlationID:x1 reason:x2 context:x3];
}

id objc_msgSend_initWithTipStatusController_(void *a1, const char *a2, ...)
{
  return [a1 initWithTipStatusController:];
}

id objc_msgSend_initWithVideoIdentifier_videoURL_imageIdentifier_imageURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithVideoIdentifier:v1 videoURL:v2 imageIdentifier:v3 imageURL:v4];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _[a1 initialize];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_isAppRestrictedWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isAppRestrictedWithBundleIdentifier:];
}

id objc_msgSend_isAppValidWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isAppValidWithBundleIdentifier:];
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return _[a1 isBetaBuild];
}

id objc_msgSend_isContentHintDisplayMaxDisplayedCountExceededForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isContentHintDisplayMaxDisplayedCountExceededForIdentifier:];
}

id objc_msgSend_isContentIdentifierHoldoutCamp_(void *a1, const char *a2, ...)
{
  return [a1 isContentIdentifierHoldoutCamp];
}

id objc_msgSend_isContentIneligibleDueToViewOnOtherDevices_(void *a1, const char *a2, ...)
{
  return [a1 isContentIneligibleDueToViewOnOtherDevices:];
}

id objc_msgSend_isContextualInfoExistForIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "isContextualInfoExistForIdentifier:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isHintDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 isHintDisplayed];
}

id objc_msgSend_isHintDisplayedOnCloudDevices(void *a1, const char *a2, ...)
{
  return _[a1 isHintDisplayedOnCloudDevices];
}

id objc_msgSend_isHintInelgibileForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isHintInelgibileForIdentifier:];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isInternalDevice(void *a1, const char *a2, ...)
{
  return _[a1 isInternalDevice];
}

id objc_msgSend_isLocalContent(void *a1, const char *a2, ...)
{
  return _[a1 isLocalContent];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 isMultiUser];
}

id objc_msgSend_isNotificationSettingValid(void *a1, const char *a2, ...)
{
  return _[a1 isNotificationSettingValid];
}

id objc_msgSend_isPreconditionMatchedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 isPreconditionMatchedForIdentifier:];
}

id objc_msgSend_isPreconditionValidForIdentifier_preconditionDictionary_(void *a1, const char *a2, ...)
{
  return [a1 isPreconditionValidForIdentifier:preconditionDictionary:];
}

id objc_msgSend_isReminderCompleted(void *a1, const char *a2, ...)
{
  return _[a1 isReminderCompleted];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_lastDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 lastDisplayContext];
}

id objc_msgSend_lastFetchedLanguage(void *a1, const char *a2, ...)
{
  return _[a1 lastFetchedLanguage];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_logAnalyticsEvent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logAnalyticsEvent:");
}

id objc_msgSend_logAnalyticsEvents_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logAnalyticsEvents:");
}

id objc_msgSend_logDaemonActiveEventWithReason_(void *a1, const char *a2, ...)
{
  return [a1 logDaemonActiveEventWithReason:];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _[a1 majorVersion];
}

id objc_msgSend_markHintIneligibleForIdentifiers_bundleID_context_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "markHintIneligibleForIdentifiers:bundleID:context:reason:");
}

id objc_msgSend_markHintIneligibleForIdentifiers_context_reason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "markHintIneligibleForIdentifiers:context:reason:");
}

id objc_msgSend_miniContent(void *a1, const char *a2, ...)
{
  return _[a1 miniContent];
}

id objc_msgSend_miniTipMetadataForContent_bundleID_context_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "miniTipMetadataForContent:bundleID:context:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_monitoringEventsForContentID_(void *a1, const char *a2, ...)
{
  return [a1 monitoringEventsForContentID:];
}

id objc_msgSend_multiuserModeOn(void *a1, const char *a2, ...)
{
  return _[a1 multiuserModeOn];
}

id objc_msgSend_needImmediateNotificationForType_(void *a1, const char *a2, ...)
{
  return [a1 needImmediateNotificationForType:];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCache(void *a1, const char *a2, ...)
{
  return _[a1 notificationCache];
}

id objc_msgSend_notificationController(void *a1, const char *a2, ...)
{
  return _[a1 notificationController];
}

id objc_msgSend_notificationController_markIdentifier_type_ineligibleWithReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend a1, "notificationController:markIdentifier:type:ineligibleWithReason:"];
}

id objc_msgSend_notificationDocument(void *a1, const char *a2, ...)
{
  return _[a1 notificationDocument];
}

id objc_msgSend_notificationTimingDarwinKey(void *a1, const char *a2, ...)
{
  return _[a1 notificationTimingDarwinKey];
}

id objc_msgSend_notifiedCollection_(void *a1, const char *a2, ...)
{
  return [a1 notifiedCollection:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
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

id objc_msgSend_performMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 performMigrationIfNeeded];
}

id objc_msgSend_performQuery_completion_(void *a1, const char *a2, ...)
{
  return [a1 performQuery:x0 completion:x1];
}

id objc_msgSend_preconditions(void *a1, const char *a2, ...)
{
  return _[a1 preconditions];
}

id objc_msgSend_prepareForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 prepareForNotifications];
}

id objc_msgSend_processAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 processAnalytics];
}

id objc_msgSend_processAppInteractedByUser(void *a1, const char *a2, ...)
{
  return _[a1 processAppInteractedByUser];
}

id objc_msgSend_processUserGuidesFromContentPackage_(void *a1, const char *a2, ...)
{
  return [a1 processUserGuidesFromContentPackage:];
}

id objc_msgSend_reconnectWelcomeIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 reconnectWelcomeIfNeeded:];
}

id objc_msgSend_registerDarwinNotification_(void *a1, const char *a2, ...)
{
  return [a1 registerDarwinNotification:];
}

id objc_msgSend_registerForMobileKeyBagLockStatusNotify(void *a1, const char *a2, ...)
{
  return _[a1 registerForMobileKeyBagLockStatusNotify];
}

id objc_msgSend_registerImmediateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerImmediateNotifications];
}

id objc_msgSend_registerToNotifyWelcome(void *a1, const char *a2, ...)
{
  return _[a1 registerToNotifyWelcome];
}

id objc_msgSend_reindexAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 reindexAllSearchableItemsWithCompletionHandler:];
}

id objc_msgSend_reindexSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "reindexSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_reloadAppGroupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 reloadAppGroupDefaults];
}

id objc_msgSend_reminderState(void *a1, const char *a2, ...)
{
  return _[a1 reminderState];
}

id objc_msgSend_removeAllNotifications(void *a1, const char *a2, ...)
{
  return _[a1 removeAllNotifications];
}

id objc_msgSend_removeAssetCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 removeAssetCacheDirectory];
}

id objc_msgSend_removeContextualInfoCache(void *a1, const char *a2, ...)
{
  return _[a1 removeContextualInfoCache];
}

id objc_msgSend_removeExperimentCache(void *a1, const char *a2, ...)
{
  return _[a1 removeExperimentCache];
}

id objc_msgSend_removeNotificationCache(void *a1, const char *a2, ...)
{
  return _[a1 removeNotificationCache];
}

id objc_msgSend_removeNotificationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeNotificationWithIdentifier:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeWelcomeDocumentCache(void *a1, const char *a2, ...)
{
  return _[a1 removeWelcomeDocumentCache];
}

id objc_msgSend_removeWidgetUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 removeWidgetUpdateDate];
}

id objc_msgSend_resetAllDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 resetAllDataIfNeeded];
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 resetAnalytics];
}

id objc_msgSend_resetBasicDefaults(void *a1, const char *a2, ...)
{
  return _[a1 resetBasicDefaults];
}

id objc_msgSend_resetDaemonData(void *a1, const char *a2, ...)
{
  return _[a1 resetDaemonData];
}

id objc_msgSend_resetWelcomeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 resetWelcomeNotifications];
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 restartTriggerTrackingIfNotDisplayedForIdentifier:];
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 restartTriggerTrackingIfNotDisplayedForIdentifiers:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revertTipStatusArchivalIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 revertTipStatusArchivalIfNeeded];
}

id objc_msgSend_rulesVersion(void *a1, const char *a2, ...)
{
  return _[a1 rulesVersion];
}

id objc_msgSend_scheduleWelcomeNotificationActivity(void *a1, const char *a2, ...)
{
  return _[a1 scheduleWelcomeNotificationActivity];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:delegate:delegateQueue:];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAuthenticationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationHandler:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setCustomizationID_(void *a1, const char *a2, ...)
{
  return [a1 setCustomizationID:];
}

id objc_msgSend_setDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 setDataProvider:];
}

id objc_msgSend_setDefaultSessionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSessionDelegate:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionary:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setExcludeCachingDataTypes_(void *a1, const char *a2, ...)
{
  return [a1 setExcludeCachingDataTypes:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPCookieStorage:];
}

id objc_msgSend_setInteractivityMode_(void *a1, const char *a2, ...)
{
  return [a1 setInteractivityMode:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setLastMajorVersionUpdateDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastMajorVersionUpdateDate:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMonitoringEvents_(void *a1, const char *a2, ...)
{
  return [a1 setMonitoringEvents:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNotificationController_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationController:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
}

id objc_msgSend_setTipsFeedURLSession_(void *a1, const char *a2, ...)
{
  return [a1 setTipsFeedURLSession:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUserLanguage_(void *a1, const char *a2, ...)
{
  return [a1 setUserLanguage:];
}

id objc_msgSend_setWelcomeXPCActivityScheduleInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setWelcomeXPCActivityScheduleInProgress:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_sourceApplicationBundleIdentifier:];
}

id objc_msgSend_setupCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setupCompleted];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldDeferBlockForXPCActivity_(void *a1, const char *a2, ...)
{
  return [a1 shouldDeferBlockForXPCActivity:];
}

id objc_msgSend_shouldShowWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowWelcomeNotification];
}

id objc_msgSend_showNewTipNotification(void *a1, const char *a2, ...)
{
  return _[a1 showNewTipNotification];
}

id objc_msgSend_showNotificationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 showNotificationWithCompletionHandler:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_statusCheckForHintIneligibleReasonWithContentID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "statusCheckForHintIneligibleReasonWithContentID:");
}

id objc_msgSend_statusForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 statusForIdentifier:];
}

id objc_msgSend_stopWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 stopWelcomeNotification];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_supportsRemoteIcon(void *a1, const char *a2, ...)
{
  return _[a1 supportsRemoteIcon];
}

id objc_msgSend_supportsWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 supportsWelcomeNotification];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:x0];
}

id objc_msgSend_tipMap(void *a1, const char *a2, ...)
{
  return _[a1 tipMap];
}

id objc_msgSend_tipStatusController(void *a1, const char *a2, ...)
{
  return _[a1 tipStatusController];
}

id objc_msgSend_tipStatusForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 tipStatusForIdentifier:];
}

id objc_msgSend_tipStatusMap(void *a1, const char *a2, ...)
{
  return _[a1 tipStatusMap];
}

id objc_msgSend_tipsAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 tipsAppInstalled];
}

id objc_msgSend_tipsFeedURLSession(void *a1, const char *a2, ...)
{
  return _[a1 tipsFeedURLSession];
}

id objc_msgSend_tipsInValidState(void *a1, const char *a2, ...)
{
  return _[a1 tipsInValidState];
}

id objc_msgSend_tipsManager(void *a1, const char *a2, ...)
{
  return _[a1 tipsManager];
}

id objc_msgSend_tps_userLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 tps_userLanguageCode];
}

id objc_msgSend_transactionWithName_(void *a1, const char *a2, ...)
{
  return [a1 transactionWithName:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unregisterDarwinNotification_(void *a1, const char *a2, ...)
{
  return [a1 unregisterDarwinNotification:];
}

id objc_msgSend_unregisterImmediateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterImmediateNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateContentFromOrigin_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 updateContentFromOrigin:x0 contextualEligibility:x1 widgetEligibility:x2 notificationEligibility:x3 preferredNotificationIdentifiers:x4 shouldDeferBlock:x5 completionHandler:x6];
}

id objc_msgSend_updateContentIfOverrideImmediately_(void *a1, const char *a2, ...)
{
  return [a1 updateContentIfOverrideImmediately:];
}

id objc_msgSend_updateContentWithActivity_identifier_preferredNotificationIdentifiers_multiuserModeOn_contextualEligibility_widgetEligibility_notificationEligibility_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateContentWithActivity:identifier:preferredNotificationIdentifiers:multiuserModeOn:contextualEligibility:widgetEligibility:notificationEligibility:");
}

id objc_msgSend_updateContextualInfoForIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateContextualInfoForIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:");
}

id objc_msgSend_updateHintDismissedForIdentifier_dismissType_context_(void *a1, const char *a2, ...)
{
  return [a1 updateHintDismissedForIdentifier:dismissType:context:];
}

id objc_msgSend_updateHintWouldHaveBeenDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return [a1 updateHintWouldHaveBeenDisplayedForIdentifier:context:];
}

id objc_msgSend_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload_(void *a1, const char *a2, ...)
{
  return [a1 updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:];
}

id objc_msgSend_updateNotificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateNotificationStatus];
}

id objc_msgSend_usageEventManager(void *a1, const char *a2, ...)
{
  return _[a1 usageEventManager];
}

id objc_msgSend_userGuides(void *a1, const char *a2, ...)
{
  return _[a1 userGuides];
}

id objc_msgSend_userInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "userInfoForIdentifier:");
}

id objc_msgSend_userLanguage(void *a1, const char *a2, ...)
{
  return _[a1 userLanguage];
}

id objc_msgSend_userLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 userLanguageCode];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return _[a1 userType];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_variantIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 variantIdentifierForIdentifier:];
}

id objc_msgSend_welcome(void *a1, const char *a2, ...)
{
  return _[a1 welcome];
}

id objc_msgSend_welcome_contentAvailableRemotelyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 welcome:contentAvailableRemotelyWithCompletionHandler:];
}

id objc_msgSend_welcome_notifyWelcomeDocument_(void *a1, const char *a2, ...)
{
  return [a1 welcome:notifyWelcomeDocument:];
}

id objc_msgSend_welcomeCollectionFromContentPackage_(void *a1, const char *a2, ...)
{
  return [a1 welcomeCollectionFromContentPackage:];
}

id objc_msgSend_welcomeDocumentFromContentPackage_(void *a1, const char *a2, ...)
{
  return [a1 welcomeDocumentFromContentPackage:];
}

id objc_msgSend_welcomeNotificationDelay(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationDelay];
}

id objc_msgSend_welcomeNotificationDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationDisplayed];
}

id objc_msgSend_welcomeNotificationGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationGracePeriod];
}

id objc_msgSend_welcomeXPCActivityScheduleInProgress(void *a1, const char *a2, ...)
{
  return _[a1 welcomeXPCActivityScheduleInProgress];
}

id objc_msgSend_xpcActivitySetStateBlockForIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "xpcActivitySetStateBlockForIdentifier:");
}