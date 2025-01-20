id sub_100004098(uint64_t a1)
{
  id result;
  uint64_t vars8;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"CmCl") & 1) != 0|| (result = +[CRFDRBaseDeviceHandler isFDRPropertySupported:@"RCSn"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EA00 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

id sub_100004354(uint64_t a1)
{
  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"FSCl") & 1) != 0|| (id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"MSRk"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EA10 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

uint64_t sub_10000467C(uint64_t a1)
{
  [*(id *)(a1 + 32) handleSUCase];
  qword_10001EA20 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

uint64_t sub_1000049BC(uint64_t a1)
{
  qword_10001EA30 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

uint64_t sub_100004D24(uint64_t a1)
{
  qword_10001EA40 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

uint64_t sub_100004FA8(uint64_t a1)
{
  qword_10001EA50 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

id sub_1000055DC(uint64_t a1)
{
  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"tcrt") & 1) != 0|| (id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"dCfg"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EA60 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

uint64_t sub_1000058AC(uint64_t a1)
{
  qword_10001EA70 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

void sub_10000675C(uint64_t a1, void *a2)
{
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    v4 = +[NSMutableDictionary dictionary];
    v5 = +[MSUDataAccessor sharedDataAccessor];
    id v23 = 0;
    id v6 = [v5 copyPathForPersistentData:100 error:&v23];
    v7 = v23;

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      [v4 setObject:v6 forKey:@"datapath"];
      v10 = [objc_alloc((Class)CRFDRSeal) initForRegisterChangeWithParameters:v4];
      if (!v10)
      {
        v7 = handleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10000F888(a1);
        }
        goto LABEL_24;
      }
      v7 = v10;
      if (xpc_activity_should_defer(v3))
      {
        BOOL v11 = xpc_activity_set_state(v3, 3);
        v12 = handleForCategory();
        v9 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [*(id *)(a1 + 32) componentName];
            v14 = +[NSString stringWithFormat:@"Successfully deferred activity %@ to state: %lu", v3, xpc_activity_get_state(v3)];
            *(_DWORD *)buf = 138412546;
            v25 = v13;
            __int16 v26 = 2112;
            v27 = v14;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          sub_10000F94C(a1, v3);
        }
      }
      else
      {
        v15 = [*(id *)(a1 + 32) componentName];
        id v22 = 0;
        id v16 = [v7 registerChangeForComponent:v15 fdrError:&v22];
        v9 = v22;

        if (!v16)
        {
          v17 = handleForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [*(id *)(a1 + 32) componentName];
            v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] register change was successful", "-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke");
            *(_DWORD *)buf = 138412546;
            v25 = v18;
            __int16 v26 = 2112;
            v27 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
          }
          v20 = +[NSUserDefaults standardUserDefaults];
          v21 = [*(id *)(a1 + 32) componentHasNotifiedServerKey];
          [v20 setBool:1 forKey:v21];

          [v20 synchronize];
        }
        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      v9 = handleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000F7C4(a1);
      }
    }

LABEL_24:
    goto LABEL_25;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_DOWNLOAD, 1);
  xpc_activity_set_criteria(v3, v4);
LABEL_25:
}

void sub_100007978(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    [v4 unlockCheckerActivityBodyForFinishRepair];
  }
  else
  {
    v5 = [v4 createCriteriaForUnlockCheckerWithInterval:*(double *)(a1 + 40)];
    xpc_activity_set_criteria(activity, v5);
  }
}

void sub_1000079F4(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    [v4 unlockCheckerActivityBody];
  }
  else
  {
    v5 = [v4 createCriteriaForUnlockCheckerWithInterval:*(double *)(a1 + 40)];
    xpc_activity_set_criteria(activity, v5);
  }
}

void sub_10000819C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008834(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v2) = -1;
  do
  {
    uint64_t v2 = (v2 + 1);
    v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [*(id *)(a1 + 32) componentName];
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] Retry Count:%d", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke", v2);
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    sleep(0xAu);
    id v6 = [*(id *)(a1 + 32) componentAuthHandler];
    id v7 = [v6 copyComponentStatus];
  }
  while (!v7 && v2 < 9);
  if (v2 <= 8 && v7 == (id)1)
  {
    BOOL v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) componentName];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] cleaning up corefollowup finally", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke");
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [WeakRetained clearRepairFollowUp];
    [WeakRetained sendAnalyticsForCount:0x7FFFFFFFFFFFFFFFLL];
    [WeakRetained clearNSUserDefaults];
  }
}

id sub_100008D34(uint64_t a1)
{
  v26[0] = @"EventType";
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = v2;
  if (!v2)
  {
    v3 = +[NSNull null];
  }
  v27[0] = v3;
  v26[1] = @"isSUCase";
  unsigned int v4 = [*(id *)(a1 + 40) isSUCaseForComponent];
  v5 = &__kCFBooleanFalse;
  if (v4) {
    v5 = &__kCFBooleanTrue;
  }
  v27[1] = v5;
  v26[2] = @"ModuleType";
  id v6 = [*(id *)(a1 + 40) componentName];
  v27[2] = v6;
  v26[3] = @"AuthStatus";
  id v7 = [*(id *)(a1 + 40) componentAuthHandler];
  BOOL v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 copyComponentStatus]);
  v27[3] = v8;
  v26[4] = @"UICoreFollowUpShownDuration";
  v9 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v27[4] = v9;
  v26[5] = @"UILockscreenNotification";
  v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v27[5] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

  if (!v2) {
  v12 = handleForCategory();
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 40) componentName];
    __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%s] send event: %@", "-[MRBaseComponentHandler sendAnalyticsForCount:]_block_invoke", v11);
    *(_DWORD *)buf = 138412546;
    id v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  v15 = handleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [*(id *)(a1 + 40) componentName];
    v17 = [*(id *)(a1 + 40) componentName];
    v18 = *(void **)(a1 + 32);
    v19 = v18;
    if (!v18)
    {
      v19 = +[NSNull null];
    }
    v20 = +[NSString stringWithFormat:@"CoreAnalyticsEvent: ModuleType(%@), EventType(%@)", v17, v19];
    *(_DWORD *)buf = 138412546;
    id v23 = v16;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    if (!v18) {
  }
    }

  return v11;
}

void sub_100009BA0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t sub_100009BD0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

id sub_100009D68(uint64_t a1)
{
  id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"NBCl"];
  if (result)
  {
    qword_10001EA80 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

id sub_100009F7C(uint64_t a1)
{
  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"bCfg") & 1) != 0|| (id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"LCfg"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EA90 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

void sub_10000A25C(id a1)
{
  qword_10001EAA0 = [[MRComponentHealthHandler alloc] _init];

  _objc_release_x1();
}

id sub_10000A774(uint64_t a1)
{
  v12[0] = @"EventType";
  v12[1] = @"ModuleType";
  uint64_t v2 = *(void *)(a1 + 32);
  v13[0] = @"DailyFailure";
  v13[1] = v2;
  v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  unsigned int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[MRComponentHealthHandler sendDailyAnalyticsForModuleType:]_block_invoke";
    __int16 v10 = 2112;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(const char **)(a1 + 32);
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2112;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CoreAnalyticsEvent: ModuleType(%@), Event(%@)", (uint8_t *)&v8, 0x16u);
  }

  return v3;
}

uint64_t sub_10000AB6C(uint64_t a1)
{
  [*(id *)(a1 + 32) handleSUCase];
  qword_10001EAB0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

uint64_t sub_10000AE84(uint64_t a1)
{
  qword_10001EAC0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

id sub_10000B4E0(uint64_t a1)
{
  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"bcrt") & 1) != 0|| (id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"vcrt"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EAD0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

uint64_t sub_10000B744(uint64_t a1)
{
  qword_10001EAE8 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

void sub_10000B8C4(uint64_t a1)
{
  id v25 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.mobilerepair"];
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_opt_new();
  unsigned int v4 = [v3 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
  v5 = +[FLFollowUpAction actionWithLabel:v4 url:*(void *)(a1 + 32)];

  [v2 addObject:v5];
  id v6 = objc_alloc_init((Class)FLFollowUpNotification);
  id v7 = v6;
  if (*(unsigned char *)(a1 + 80))
  {
    [v6 setFrequency:0.0];
    int v8 = [v3 localizedStringWithKey:*(void *)(a1 + 40) defaultString:*(void *)(a1 + 40)];
    [v7 setTitle:v8];

    v9 = [v3 localizedStringWithKey:*(void *)(a1 + 48) defaultString:*(void *)(a1 + 48)];
    [v7 setInformativeText:v9];

    __int16 v10 = [v3 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
    [v7 setUnlockActionLabel:v10];

    [v7 setFirstNotificationDelay:0.0];
    [v7 setActivateAction:v5];
    [v7 setClearAction:0];
    uint64_t v29 = FLNotificationOptionLockscreen;
    BOOL v11 = +[NSArray arrayWithObjects:&v29 count:1];
    uint64_t v12 = +[NSSet setWithArray:v11];
    [v7 setOptions:v12];
  }
  id v13 = objc_alloc_init((Class)FLFollowUpItem);
  [v13 setUniqueIdentifier:*(void *)(a1 + 56)];
  [v13 setGroupIdentifier:FLGroupIdentifierDevice];
  __int16 v14 = [v3 localizedStringWithKey:*(void *)(a1 + 40) defaultString:*(void *)(a1 + 40)];
  v15 = [v3 localizedStringWithKey:*(void *)(a1 + 64) defaultString:*(void *)(a1 + 64)];
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
  [v13 setTitle:v16];

  v17 = [v3 localizedStringWithKey:*(void *)(a1 + 48) defaultString:*(void *)(a1 + 48)];
  v18 = [v3 localizedStringWithKey:*(void *)(a1 + 64) defaultString:*(void *)(a1 + 64)];
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);
  [v13 setInformativeText:v19];

  [v13 setDisplayStyle:2];
  [v13 setActions:v2];
  if (*(unsigned char *)(a1 + 80)) {
    v20 = v7;
  }
  else {
    v20 = 0;
  }
  [v13 setNotification:v20];
  [v13 setTargetBundleIdentifier:FLFollowUpPreferencesBundleIdentifier];
  notify_post("com.apple.mobilerepairui.reload");
  v21 = handleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Posting item: %@", buf, 0xCu);
  }

  id v26 = 0;
  unsigned __int8 v22 = [v25 postFollowUpItem:v13 error:&v26];
  id v23 = v26;
  if ((v22 & 1) == 0)
  {
    __int16 v24 = handleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10000FBBC(v23);
    }
  }
  [*(id *)(*(void *)(a1 + 72) + 16) setObject:v13 forKeyedSubscript:*(void *)(a1 + 56)];
}

void sub_10000BFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C004(uint64_t a1)
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"settingsView"];

  unsigned int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (v3 && !*(unsigned char *)(a1 + 64))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    CFOptionFlags responseFlags = 0;
    SInt32 error = 0;
    v5 = objc_opt_new();
    uint64_t v39 = a1;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = a1 + 40;
    int v8 = *(unsigned __int8 *)(v6 + 24);
    uint64_t v37 = [v5 localizedStringWithKey:v7 defaultString:v7];
    v9 = [v5 localizedStringWithKey:*(void *)(v6 + 8) defaultString:*(void *)(v6 + 8)];
    __int16 v10 = +[NSString stringWithFormat:@"\n%@\n", v9];
    v38 = v5;
    if (v8)
    {
      BOOL v11 = [v5 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
      uint64_t v12 = +[NSNumber numberWithBool:0];
      uint64_t v13 = SBUserNotificationDismissOnLock;
      __int16 v14 = +[NSNumber numberWithBool:1];
      uint64_t v15 = SBUserNotificationDontDismissOnUnlock;
      id v16 = +[NSNumber numberWithBool:1];
      uint64_t v35 = v13;
      v17 = (void *)v37;
      +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v37, kCFUserNotificationAlertHeaderKey, v10, kCFUserNotificationAlertMessageKey, v11, kCFUserNotificationDefaultButtonTitleKey, v12, v35, v14, v15, v16, SBUserNotificationBehavesSuperModally, &off_10001AC98, SBUserNotificationSystemSoundIDKey, 0);
      CFDictionaryRef v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = [v5 localizedStringWithKey:@"OK" defaultString:@"OK"];
      uint64_t v12 = [v5 localizedStringWithKey:@"SETTINGS" defaultString:@"SETTINGS"];
      __int16 v14 = +[NSNumber numberWithBool:0];
      uint64_t v19 = SBUserNotificationDismissOnLock;
      id v16 = +[NSNumber numberWithBool:1];
      uint64_t v20 = SBUserNotificationDontDismissOnUnlock;
      v21 = +[NSNumber numberWithBool:1];
      uint64_t v36 = v19;
      v17 = (void *)v37;
      uint64_t v22 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v37, kCFUserNotificationAlertHeaderKey, v10, kCFUserNotificationAlertMessageKey, v11, kCFUserNotificationDefaultButtonTitleKey, v12, kCFUserNotificationAlternateButtonTitleKey, v14, v36, v16, v20, v21, SBUserNotificationBehavesSuperModally, &off_10001AC98, SBUserNotificationSystemSoundIDKey, 0);

      CFDictionaryRef v18 = (const __CFDictionary *)v22;
    }

    id v23 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, v18);
    if (v23)
    {
      __int16 v24 = v23;
      CFUserNotificationReceiveResponse(v23, 0.0, &responseFlags);
      uint64_t v25 = v39;
      if (responseFlags == 1)
      {
        CFDictionaryRef v26 = v18;
        v27 = handleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void *)v6;
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ User pressed button", buf, 0xCu);
        }

        uint64_t v29 = +[LSApplicationWorkspace defaultWorkspace];
        uint64_t v30 = *(void *)(v39 + 56);
        id v40 = 0;
        unsigned __int8 v31 = [v29 openSensitiveURL:v30 withOptions:0 error:&v40];
        id v32 = v40;

        CFDictionaryRef v18 = v26;
        if ((v31 & 1) == 0)
        {
          v33 = handleForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10000FCD4((uint64_t *)(v39 + 56), v32, v33);
          }
        }
      }
      CFRelease(v24);
    }
    else
    {
      v34 = handleForCategory();
      uint64_t v25 = v39;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10000FC44((uint64_t *)v6, &error, v34);
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v25 + 32));
  }
}

void sub_10000C6B0(id a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C750;
  v2[3] = &unk_1000187E8;
  id v3 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.mobilerepair"];
  id v1 = v3;
  [v1 pendingFollowUpItemsWithCompletion:v2];
}

void sub_10000C750(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v76 = a3;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = &AnalyticsSendEventLazy_ptr;
    uint64_t v75 = *(void *)v80;
    uint64_t v74 = FLGroupIdentifierDevice;
    uint64_t v65 = FLFollowUpPreferencesBundleIdentifier;
    do
    {
      int v8 = 0;
      id v66 = v6;
      do
      {
        if (*(void *)v80 != v75) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v8);
        id v10 = objc_alloc_init((Class)v7[124]);
        BOOL v11 = [v9 uniqueIdentifier];
        [v10 setUniqueIdentifier:v11];

        [v10 setGroupIdentifier:v74];
        uint64_t v12 = [v9 uniqueIdentifier];
        unsigned __int8 v13 = [@"com.apple.mobilerepair.DisplayRepair" isEqualToString:v12];

        __int16 v14 = off_100018428;
        if (v13) {
          goto LABEL_18;
        }
        uint64_t v15 = [v9 uniqueIdentifier];
        unsigned __int8 v16 = [@"com.apple.mobilerepair.BatteryRepair" isEqualToString:v15];

        __int16 v14 = off_100018410;
        if (v16) {
          goto LABEL_18;
        }
        v17 = [v9 uniqueIdentifier];
        unsigned __int8 v18 = [@"com.apple.mobilerepair.CameraRepair" isEqualToString:v17];

        __int16 v14 = off_100018420;
        if (v18) {
          goto LABEL_18;
        }
        uint64_t v19 = [v9 uniqueIdentifier];
        unsigned __int8 v20 = [@"com.apple.mobilerepair.BluetoothRepair" isEqualToString:v19];

        __int16 v14 = off_100018418;
        if (v20) {
          goto LABEL_18;
        }
        v21 = [v9 uniqueIdentifier];
        unsigned __int8 v22 = [@"com.apple.mobilerepair.WifiRepair" isEqualToString:v21];

        __int16 v14 = &off_100018458;
        if (v22) {
          goto LABEL_18;
        }
        id v23 = [v9 uniqueIdentifier];
        unsigned __int8 v24 = [@"com.apple.mobilerepair.BasebandRepair" isEqualToString:v23];

        __int16 v14 = off_100018408;
        if (v24) {
          goto LABEL_18;
        }
        uint64_t v25 = [v9 uniqueIdentifier];
        unsigned __int8 v26 = [@"com.apple.mobilerepair.BasebandRepair" isEqualToString:v25];

        if (v26) {
          goto LABEL_18;
        }
        v27 = [v9 uniqueIdentifier];
        unsigned __int8 v28 = [@"com.apple.mobilerepair.NFCRepair" isEqualToString:v27];

        __int16 v14 = off_100018438;
        if (v28) {
          goto LABEL_18;
        }
        uint64_t v29 = [v9 uniqueIdentifier];
        unsigned __int8 v30 = [@"com.apple.mobilerepair.UWBRepair" isEqualToString:v29];

        __int16 v14 = off_100018450;
        if (v30) {
          goto LABEL_18;
        }
        unsigned __int8 v31 = [v9 uniqueIdentifier];
        unsigned __int8 v32 = [@"com.apple.mobilerepair.AudioRepair" isEqualToString:v31];

        __int16 v14 = off_100018400;
        if (v32) {
          goto LABEL_18;
        }
        v33 = [v9 uniqueIdentifier];
        unsigned __int8 v34 = [@"com.apple.mobilerepair.FaceIDRepair" isEqualToString:v33];

        __int16 v14 = off_100018430;
        if ((v34 & 1) != 0
          || ([v9 uniqueIdentifier],
              uint64_t v35 = objc_claimAutoreleasedReturnValue(),
              unsigned int v36 = [@"com.apple.mobilerepair.TouchIDRepair" isEqualToString:v35],
              v35,
              __int16 v14 = off_100018448,
              v36))
        {
LABEL_18:
          uint64_t v37 = [(__objc2_class *)*v14 sharedSingleton];
          v38 = [v37 popUpNotificationTitle];

          uint64_t v39 = [(__objc2_class *)*v14 sharedSingleton];
          id v40 = [v39 followUpInfoMessage];
        }
        else
        {
          id v40 = 0;
          v38 = 0;
        }
        v41 = handleForCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v38;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Title key :%@", buf, 0xCu);
        }

        v42 = handleForCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v40;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "infotext key:%@", buf, 0xCu);
        }

        if (v38 && v40)
        {
          v72 = v8;
          v43 = v9;
          v69 = v9;
          id v44 = objc_alloc_init((Class)NSMutableArray);
          v45 = objc_opt_new();
          v46 = [v45 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
          v47 = [v43 actions];
          v48 = [v47 firstObject];
          v49 = [v48 url];
          uint64_t v50 = +[FLFollowUpAction actionWithLabel:v46 url:v49];

          v70 = (void *)v50;
          [v44 addObject:v50];
          v51 = [v45 localizedStringWithKey:v38 defaultString:v38];
          [v10 setTitle:v51];

          v71 = v45;
          v52 = [v45 localizedStringWithKey:v40 defaultString:v40];
          [v10 setInformativeText:v52];

          [v10 setDisplayStyle:2];
          id v73 = v44;
          [v10 setActions:v44];
          [v10 setTargetBundleIdentifier:v65];
          v53 = *(void **)(a1 + 32);
          v54 = [v69 uniqueIdentifier];
          v55 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v54, 0);
          id v78 = v76;
          LOBYTE(v53) = [v53 clearPendingFollowUpItemsWithUniqueIdentifiers:v55 error:&v78];
          id v56 = v78;

          if (v53)
          {
            v57 = handleForCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Successfully deleted the followup", buf, 2u);
            }

            v58 = handleForCategory();
            int v8 = v72;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v86 = v10;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Re Posting item: %@", buf, 0xCu);
            }

            v59 = *(void **)(a1 + 32);
            id v77 = v56;
            unsigned __int8 v60 = [v59 postFollowUpItem:v10 error:&v77];
            id v76 = v77;

            v61 = v71;
            if (v60)
            {
              id v6 = v66;
              uint64_t v7 = &AnalyticsSendEventLazy_ptr;
              v62 = v73;
LABEL_39:

              goto LABEL_40;
            }
            v63 = handleForCategory();
            id v6 = v66;
            uint64_t v7 = &AnalyticsSendEventLazy_ptr;
            id v56 = v76;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
              sub_10000FE98((uint64_t)v83, (uint64_t)v76);
            }
            v62 = v73;
          }
          else
          {
            v63 = handleForCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
              sub_10000FEF4((uint64_t)v84, (uint64_t)v56);
            }
            id v6 = v66;
            uint64_t v7 = &AnalyticsSendEventLazy_ptr;
            v62 = v73;
            v61 = v45;
            int v8 = v72;
          }

          id v76 = v56;
          goto LABEL_39;
        }
LABEL_40:

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v64 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
      id v6 = v64;
    }
    while (v64);
  }
}

void sub_10000CF9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000CFBC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10000CFD0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

id sub_10000D71C(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkInAndHandleAuthStatus];
}

uint64_t start()
{
  id v1 = handleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mobilerepaird started", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3032000000;
  unsigned __int8 v31 = sub_10000DFC0;
  unsigned __int8 v32 = sub_10000DFD0;
  v33 = &off_10001ACB0;
  uint64_t state64 = 0;
  uint32_t v2 = notify_register_check("com.apple.system.console_mode_changed", &dword_10001E998);
  if (v2)
  {
    id v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001000C(v2, v3);
    }
  }
  else
  {
    uint32_t state = notify_get_state(dword_10001E998, &state64);
    if (!state) {
      goto LABEL_10;
    }
    id v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000FF94(state, v3);
    }
  }

LABEL_10:
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unsigned __int8 v34 = 134217984;
    uint64_t v35 = state64;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Game mode at launch:%llu", v34, 0xCu);
  }

  id v6 = *((id *)v29 + 5);
  objc_sync_enter(v6);
  uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:state64];
  int v8 = (void *)*((void *)v29 + 5);
  *((void *)v29 + 5) = v7;

  objc_sync_exit(v6);
  id v9 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000DFD8;
  handler[3] = &unk_100018838;
  handler[4] = buf;
  notify_register_dispatch("com.apple.system.console_mode_changed", &dword_10001E99C, (dispatch_queue_t)&_dispatch_main_q, handler);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000E138;
  v25[3] = &unk_100018860;
  v25[4] = buf;
  xpc_activity_register("com.apple.mobilerepaird.post_install", XPC_ACTIVITY_CHECK_IN, v25);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000E3DC;
  v24[3] = &unk_100018860;
  v24[4] = buf;
  xpc_activity_register("com.apple.mobilerepaird.cache_clean", XPC_ACTIVITY_CHECK_IN, v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000E5C0;
  v23[3] = &unk_100018860;
  v23[4] = buf;
  xpc_activity_register("com.apple.mobilerepaird.daily_stats", XPC_ACTIVITY_CHECK_IN, v23);
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188A0);

  xpc_set_event_stream_handler("com.apple.fsevents.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188C0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188E0);

  uint64_t v10 = objc_opt_new();
  id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mobilerepaird"];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 setDelegate:v10];
    [v12 resume];
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      id v13 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair.intentControl" options:0];
      __int16 v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairBootIntentProtocol];
      [v13 setRemoteObjectInterface:v14];

      [v13 resume];
      uint64_t v15 = [v13 remoteObjectProxyWithErrorHandler:&stru_100018920];
      [v15 clearBootIntent:&stru_100018960];

      id v16 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corerepair.intentControl" options:0];
      v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CoreRepairBootIntentProtocol];
      [v16 setRemoteObjectInterface:v17];

      [v16 resume];
      unsigned __int8 v18 = [v16 remoteObjectProxyWithErrorHandler:&stru_100018980];
      [v18 clearRepairBackup:&stru_1000189A0];
    }
    sub_10000E8D0();
    uint64_t v19 = 0;
  }
  else
  {
    unsigned __int8 v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000FF50(v20);
    }

    uint64_t v19 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(buf, 8);

  if (v12)
  {
    v21 = +[NSRunLoop currentRunLoop];
    [v21 run];

    uint64_t v19 = 0;
  }

  return v19;
}

void sub_10000DF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_10000DFC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DFD0(uint64_t a1)
{
}

void sub_10000DFD8(uint64_t a1, int a2)
{
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "GAME MODE notification", buf, 2u);
  }

  uint64_t state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    id v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = state64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GAME MODE get state:%llu", buf, 0xCu);
    }

    if (state64 == 1)
    {
      id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v6);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = &off_10001ACC8;

      objc_sync_exit(v6);
    }
  }
}

void sub_10000E138(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received xpc post install", (uint8_t *)&v14, 2u);
  }

  if (xpc_activity_get_state(v3) == 2)
  {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v5);
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_exit(v5);

    if (!xpc_activity_should_defer(v3)
      && ([v6 isEqualToNumber:&__kCFBooleanTrue] & 1) == 0)
    {
      +[MRBatteryComponentHandler handleSUCase];
      id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v7);
      id v8 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

      objc_sync_exit(v7);
      if (xpc_activity_should_defer(v3)
        || ([v8 isEqualToNumber:&__kCFBooleanTrue] & 1) != 0)
      {
        id v6 = v8;
      }
      else
      {
        +[MRDisplayComponentHandler handleSUCase];
        id v13 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        objc_sync_enter(v13);
        id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

        objc_sync_exit(v13);
        if (!xpc_activity_should_defer(v3)
          && ([v6 isEqualToNumber:&__kCFBooleanTrue] & 1) == 0)
        {
          +[MRCameraComponentHandler handleSUCase];
LABEL_15:

          goto LABEL_16;
        }
      }
    }
    BOOL v9 = xpc_activity_set_state(v3, 3);
    uint64_t v10 = handleForCategory();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        xpc_activity_state_t state = xpc_activity_get_state(v3);
        int v14 = 138412546;
        uint64_t v15 = v3;
        __int16 v16 = 2048;
        xpc_activity_state_t v17 = state;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully deferred activity %@ to state: %lu", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100010084(v3);
    }

    goto LABEL_15;
  }
LABEL_16:
}

void sub_10000E3DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received xpc cache clean", (uint8_t *)&v12, 2u);
  }

  if (xpc_activity_get_state(v3) == 2)
  {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v5);
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_exit(v5);

    if (!xpc_activity_should_defer(v3)
      && ([v6 isEqualToNumber:&__kCFBooleanTrue] & 1) == 0)
    {
      id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      [v7 removeObjectForKey:@"tempPreflightResults"];
    }
    BOOL v8 = xpc_activity_set_state(v3, 3);
    BOOL v9 = handleForCategory();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        xpc_activity_state_t state = xpc_activity_get_state(v3);
        int v12 = 138412546;
        id v13 = v3;
        __int16 v14 = 2048;
        xpc_activity_state_t v15 = state;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully deferred activity %@ to state: %lu", (uint8_t *)&v12, 0x16u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_100010084(v3);
    }
  }
}

void sub_10000E5C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received daily stats activity", (uint8_t *)&v11, 2u);
  }

  if (xpc_activity_get_state(v3) == 2)
  {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v5);
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_exit(v5);

    if (xpc_activity_should_defer(v3)
      || ([v6 isEqualToNumber:&__kCFBooleanTrue] & 1) != 0)
    {
      BOOL v7 = xpc_activity_set_state(v3, 3);
      BOOL v8 = handleForCategory();
      BOOL v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state(v3);
          int v11 = 138412546;
          int v12 = v3;
          __int16 v13 = 2048;
          xpc_activity_state_t v14 = state;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully deferred activity %@ to state: %lu", (uint8_t *)&v11, 0x16u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_100010084(v3);
      }
    }
    else
    {
      BOOL v9 = +[MRComponentHealthHandler sharedInstance];
      [v9 sendFailedComponentStats];
    }
  }
}

void sub_10000E790(id a1, OS_xpc_object *a2)
{
  uint32_t v2 = a2;
  id v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    BOOL v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received IOKit matching event:%@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v2, _xpc_event_key_name)];
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    BOOL v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC Event: %@ (iokit)", (uint8_t *)&v6, 0xCu);
  }

  sub_10000E8D0();
}

void sub_10000E8D0()
{
  int v0 = MGGetBoolAnswer();
  id v1 = (void *)MGCopyAnswer();
  unsigned int v2 = [v1 intValue];

  if ((v0 & 1) == 0 && v2 == 3)
  {
    id v3 = handleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", (uint8_t *)v15, 2u);
    }

    goto LABEL_12;
  }
  if (v2 == 1) {
    int v4 = v0;
  }
  else {
    int v4 = 1;
  }
  if (v4 != 1)
  {
LABEL_12:
    int v6 = +[MRBatteryComponentHandler sharedSingleton];
    [v6 checkInAndHandleAuthStatus];

    BOOL v7 = +[MRDisplayComponentHandler sharedSingleton];
    [v7 checkInAndHandleAuthStatus];

    BOOL v8 = +[MRCameraComponentHandler sharedSingleton];
    [v8 checkInAndHandleAuthStatus];

    BOOL v9 = +[MRFaceIDComponentHandler sharedSingleton];
    [v9 checkInAndHandleAuthStatus];

    uint64_t v10 = +[MRTouchIDComponentHandler sharedSingleton];
    [v10 checkInAndHandleAuthStatus];

    int v11 = +[MRBackGlassComponentHandler sharedSingleton];
    [v11 checkInAndHandleAuthStatus];

    int v12 = +[MREnclosureComponentHandler sharedSingleton];
    [v12 checkInAndHandleAuthStatus];

    __int16 v13 = +[MRRCamComponentHandler sharedSingleton];
    [v13 checkInAndHandleAuthStatus];

    xpc_activity_state_t v14 = +[MRAudioComponentHandler sharedSingleton];
    [v14 checkInAndHandleAuthStatus];

    id v5 = +[MRAudioCodecComponentHandler sharedSingleton];
    [v5 checkInAndHandleAuthStatus];
    goto LABEL_13;
  }
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = v0;
    __int16 v16 = 1024;
    unsigned int v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "exiting Diagnostics mode:%d::deviceClass:%d", (uint8_t *)v15, 0xEu);
  }
LABEL_13:
}

void sub_10000EB38(id a1, OS_xpc_object *a2)
{
  unsigned int v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "received a com.apple.fsevents.matching notification", v3, 2u);
  }
}

void sub_10000EBA4(id a1, OS_xpc_object *a2)
{
  unsigned int v2 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a2, _xpc_event_key_name)];
  id v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "received:%@", (uint8_t *)&v7, 0xCu);
  }

  if ([v2 isEqualToString:@"AppleLanguagePreferencesChangedNotification"])
  {
    int v4 = handleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received a AppleLanguagePreferencesChangedNotification", (uint8_t *)&v7, 2u);
    }

    id v5 = +[MRUINotificationHelper sharedSingleton];
    [v5 updateFollowupsToNewLocale];
  }
  if ([v2 isEqualToString:@"com.apple.mobilerepair.refreshui"])
  {
    int v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received com.apple.mobilerepair.refreshui", (uint8_t *)&v7, 2u);
    }

    sub_10000E8D0();
  }
}

void sub_10000ED54(id a1, NSError *a2)
{
  unsigned int v2 = a2;
  id v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100010100((uint64_t)v2, v3);
  }
}

void sub_10000EDAC(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  int v4 = a3;
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    BOOL v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearBootIntent status:%d:error:%@", (uint8_t *)v6, 0x12u);
  }
}

void sub_10000EE74(id a1, NSError *a2)
{
  unsigned int v2 = a2;
  BOOL v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100010178((uint64_t)v2, v3);
  }
}

void sub_10000EECC(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  int v4 = a3;
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2112;
    BOOL v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearRepairBackup status: %d error: %@", (uint8_t *)v6, 0x12u);
  }
}

void sub_10000EFAC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10000F26C(uint64_t a1)
{
  [*(id *)(a1 + 32) handleSUCase];
  qword_10001EAF8 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

id sub_10000F6B8(uint64_t a1)
{
  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"psd2") & 1) != 0|| (id result = +[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"prpc"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_10001EB08 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
    return (id)_objc_release_x1();
  }
  return result;
}

void sub_10000F7C4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) componentName];
  unsigned int v2 = +[NSString stringWithFormat:@"[%s]Unable to get FDR path"];
  sub_100009BC0();
  sub_100009BA0((void *)&_mh_execute_header, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);
}

void sub_10000F888(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) componentName];
  unsigned int v2 = +[NSString stringWithFormat:@"[%s] unable to create sealer"];
  sub_100009BC0();
  sub_100009BA0((void *)&_mh_execute_header, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);
}

void sub_10000F94C(uint64_t a1, _xpc_activity_s *a2)
{
  int v3 = [*(id *)(a1 + 32) componentName];
  uint64_t v11 = (uint64_t)a2;
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  int v4 = +[NSString stringWithFormat:@"Failed to set state to DEFER for activity %@ current state: %lu"];
  sub_100009BC0();
  sub_100009BA0((void *)&_mh_execute_header, v5, v6, "[%@][%@]", v7, v8, v9, v10, v11, state, 2u);
}

void sub_10000FA18()
{
  sub_100009BE8();
  sub_100009BD0(v2, v3, v4, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%@][%@]", v5, 0x16u);
}

void sub_10000FA70(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 componentName];
  uint64_t v11 = a2;
  uint64_t v4 = +[NSString stringWithFormat:@"[%s] ignoring rogue event with unlock countL: %ld"];
  sub_100009BC0();
  sub_100009BA0((void *)&_mh_execute_header, v5, v6, "[%@][%@]", v7, v8, v9, v10, (uint64_t)"-[MRBaseComponentHandler sendAnalyticsForCount:]", v11, 2u);
}

void sub_10000FB34(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find matching service to IOPlatformExpertDevice", v1, 2u);
}

void sub_10000FB78(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find property \"config-number\"", v1, 2u);
}

void sub_10000FBBC(void *a1)
{
  id v1 = [a1 localizedDescription];
  sub_10000CF9C((void *)&_mh_execute_header, v2, v3, "failed to post followup error:%@", v4, v5, v6, v7, 2u);
}

void sub_10000FC44(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to display %@ notification ERROR:%d", (uint8_t *)&v5, 0x12u);
}

void sub_10000FCD4(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  int v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to open sensitive url:%@ :: error:%@", (uint8_t *)&v6, 0x16u);
}

void sub_10000FD88(void *a1)
{
  id v1 = [a1 description];
  sub_10000CF9C((void *)&_mh_execute_header, v2, v3, "failed to clear Followup error:%@", v4, v5, v6, v7, 2u);
}

void sub_10000FE10(void *a1)
{
  id v1 = [a1 description];
  sub_10000CF9C((void *)&_mh_execute_header, v2, v3, "failed to clear Followup notification:%@", v4, v5, v6, v7, 2u);
}

void sub_10000FE98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [[(id)sub_10000CFBC(a1, a2) localizedDescription];
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  sub_10000CFD0((void *)&_mh_execute_header, v5, v6, "failed to post followup error:%@");
}

void sub_10000FEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [[sub_10000CFBC(a1, a2) description];
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  sub_10000CFD0((void *)&_mh_execute_header, v5, v6, "failed to clear Followup error:%@");
}

void sub_10000FF50(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot create listener", v1, 2u);
}

void sub_10000FF94(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "GameMode notification check failed:%d", (uint8_t *)v2, 8u);
}

void sub_10001000C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "GameMode notification register failed:%d", (uint8_t *)v2, 8u);
}

void sub_100010084(_xpc_activity_s *a1)
{
  xpc_activity_get_state(a1);
  sub_10000EF94();
  sub_10000EFAC((void *)&_mh_execute_header, v1, v2, "Failed to set state to DEFER for activity %@ current state: %lu", v3, v4, v5, v6, v7);
}

void sub_100010100(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_100010178(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t DMCopyCurrentBuildVersion()
{
  return _DMCopyCurrentBuildVersion();
}

uint64_t DMGetPreviousBuildVersion()
{
  return _DMGetPreviousBuildVersion();
}

uint64_t DMGetUserDataDisposition()
{
  return _DMGetUserDataDisposition();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkInAndHandleAuthStatus(void *a1, const char *a2, ...)
{
  return [a1 checkInAndHandleAuthStatus];
}

id objc_msgSend_clearNSUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 clearNSUserDefaults];
}

id objc_msgSend_clearRepairFollowUp(void *a1, const char *a2, ...)
{
  return [a1 clearRepairFollowUp];
}

id objc_msgSend_componentAuthHandler(void *a1, const char *a2, ...)
{
  return [a1 componentAuthHandler];
}

id objc_msgSend_componentEventQueue(void *a1, const char *a2, ...)
{
  return [a1 componentEventQueue];
}

id objc_msgSend_componentFollowupClientID(void *a1, const char *a2, ...)
{
  return [a1 componentFollowupClientID];
}

id objc_msgSend_componentFollowupRetriggerdays(void *a1, const char *a2, ...)
{
  return [a1 componentFollowupRetriggerdays];
}

id objc_msgSend_componentHasNotifiedServerKey(void *a1, const char *a2, ...)
{
  return [a1 componentHasNotifiedServerKey];
}

id objc_msgSend_componentLastCheckTimeKey(void *a1, const char *a2, ...)
{
  return [a1 componentLastCheckTimeKey];
}

id objc_msgSend_componentName(void *a1, const char *a2, ...)
{
  return [a1 componentName];
}

id objc_msgSend_componentRetriggerCountKey(void *a1, const char *a2, ...)
{
  return [a1 componentRetriggerCountKey];
}

id objc_msgSend_componentSUCaseKey(void *a1, const char *a2, ...)
{
  return [a1 componentSUCaseKey];
}

id objc_msgSend_componentStatusKey(void *a1, const char *a2, ...)
{
  return [a1 componentStatusKey];
}

id objc_msgSend_componentUnLockCheckCountKey(void *a1, const char *a2, ...)
{
  return [a1 componentUnLockCheckCountKey];
}

id objc_msgSend_componentUnlockCheckerActivityName(void *a1, const char *a2, ...)
{
  return [a1 componentUnlockCheckerActivityName];
}

id objc_msgSend_componentfollowUpDisplaydays(void *a1, const char *a2, ...)
{
  return [a1 componentfollowUpDisplaydays];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyComponentStatus(void *a1, const char *a2, ...)
{
  return [a1 copyComponentStatus];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRepairFollowUp(void *a1, const char *a2, ...)
{
  return [a1 createRepairFollowUp];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceSupportsRepairBootIntent(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsRepairBootIntent];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayModalPopup(void *a1, const char *a2, ...)
{
  return [a1 displayModalPopup];
}

id objc_msgSend_finishRepairMessage(void *a1, const char *a2, ...)
{
  return [a1 finishRepairMessage];
}

id objc_msgSend_finishRepairTitle(void *a1, const char *a2, ...)
{
  return [a1 finishRepairTitle];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_followUpInfoMessage(void *a1, const char *a2, ...)
{
  return [a1 followUpInfoMessage];
}

id objc_msgSend_getHwRevision(void *a1, const char *a2, ...)
{
  return [a1 getHwRevision];
}

id objc_msgSend_handleSUCase(void *a1, const char *a2, ...)
{
  return [a1 handleSUCase];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isSUCaseForComponent(void *a1, const char *a2, ...)
{
  return [a1 isSUCaseForComponent];
}

id objc_msgSend_isSupportedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSupportedIPad];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainNonAuthRepairFlow(void *a1, const char *a2, ...)
{
  return [a1 mainNonAuthRepairFlow];
}

id objc_msgSend_notifyServer(void *a1, const char *a2, ...)
{
  return [a1 notifyServer];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_popUpNotificationNowWithMessage(void *a1, const char *a2, ...)
{
  return [a1 popUpNotificationNowWithMessage];
}

id objc_msgSend_popUpNotificationTitle(void *a1, const char *a2, ...)
{
  return [a1 popUpNotificationTitle];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleNetworkActivity(void *a1, const char *a2, ...)
{
  return [a1 scheduleNetworkActivity];
}

id objc_msgSend_sendFailedComponentStats(void *a1, const char *a2, ...)
{
  return [a1 sendFailedComponentStats];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return [a1 sharedSingleton];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronouslycopyAuthStatus(void *a1, const char *a2, ...)
{
  return [a1 synchronouslycopyAuthStatus];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlockCheckActivityRequired(void *a1, const char *a2, ...)
{
  return [a1 unlockCheckActivityRequired];
}

id objc_msgSend_unlockCheckerActivityBody(void *a1, const char *a2, ...)
{
  return [a1 unlockCheckerActivityBody];
}

id objc_msgSend_unlockCheckerActivityBodyForFinishRepair(void *a1, const char *a2, ...)
{
  return [a1 unlockCheckerActivityBodyForFinishRepair];
}

id objc_msgSend_updateFollowupsToNewLocale(void *a1, const char *a2, ...)
{
  return [a1 updateFollowupsToNewLocale];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}