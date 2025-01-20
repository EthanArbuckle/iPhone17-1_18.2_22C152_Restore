id sub_1488(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:v1 value:&stru_8520 table:0];

  return v3;
}

void sub_173C(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:off_D6B8 object:0];
}

void sub_185C(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:off_D6C0 object:0];
}

void sub_190C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received lostModeChanged distributed notification: %@", (uint8_t *)&v5, 0xCu);
  }

  _os_activity_initiate(&dword_0, "LostModeChangedLocalNotification", OS_ACTIVITY_FLAG_DEFAULT, &stru_82F0);
}

void sub_1F04(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:off_D6B0 object:0];
}

void sub_2314(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "caught LostModeChangedLocalNotification: %@", (uint8_t *)&v10, 0xCu);
  }

  int v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [*(id *)(a1 + 32) isManagedLostmode];
    int v10 = 67109120;
    LODWORD(v11) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "FMIPLockScreenController was managed %i", (uint8_t *)&v10, 8u);
  }

  v7 = +[FMDFMIPManager sharedInstance];
  v8 = [v7 lostModeInfo];

  if (([v8 lostModeEnabled] & 1) == 0)
  {
    v9 = sub_4588();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "FMIPLockScreenController disabling ourself", (uint8_t *)&v10, 2u);
    }

    [*(id *)(a1 + 32) disable];
  }
  [*(id *)(a1 + 32) updateLockScreenView];
}

void sub_24AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "caught SimStatusChangedLocalNotification: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) updateLockScreenView];
}

void sub_256C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "caught RegistrationStatusChangedNotification: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) updateLockScreenView];
}

void sub_2C4C(uint64_t a1)
{
  v2 = +[FMDFMIPManager sharedInstance];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2CE0;
  v3[3] = &unk_8368;
  v3[4] = *(void *)(a1 + 32);
  [v2 userDidAckManagedLostModeLocateWithCompletion:v3];
}

void sub_2CE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = sub_4588();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_480C((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2DA8;
  block[3] = &unk_8340;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_2DA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockScreenView];
}

void sub_2DB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pluginAgent];
  [v2 pluginController:*(void *)(a1 + 32) sendAction:*(void *)(a1 + 40)];
}

void sub_31B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_32A4;
  v11[3] = &unk_8408;
  id v12 = v6;
  id v13 = v5;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void sub_32A4(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  BOOL v2 = *(void *)(a1 + 32) == 0;
  id v3 = sub_4588();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Got subscription Info", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_4900(v1, v4, v5, v6, v7, v8, v9, v10);
  }

  *(void *)buf = 0;
  v28 = buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v11 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = [*(id *)(a1 + 40) subscriptions];
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v15);
        dispatch_group_enter(v11);
        v17 = [*(id *)(a1 + 48) ctClient];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_353C;
        v20[3] = &unk_83E0;
        v22 = buf;
        v21 = v11;
        [v17 copyRegistrationStatus:v16 completion:v20];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }

  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    (*(void (**)(uint64_t, void))(v18 + 16))(v18, v28[24]);
  }

  _Block_object_dispose(buf, 8);
}

void sub_3510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_353C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3634;
  block[3] = &unk_83B8;
  id v13 = v6;
  id v14 = v5;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void sub_3634(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = sub_4588();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_4970(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id v10 = (void *)kCTRegistrationStatusRegisteredHome;
  unsigned int v11 = [*(id *)(a1 + 40) isEqualToString:kCTRegistrationStatusRegisteredHome];

  id v12 = (void *)kCTRegistrationStatusRegisteredRoaming;
  unsigned int v13 = [*(id *)(a1 + 40) isEqualToString:kCTRegistrationStatusRegisteredRoaming];

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v14 + 24)) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = (v11 | v13) == 0;
  }
  if (!v15) {
    *(unsigned char *)(v14 + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_4140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_417C(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4214;
  v3[3] = &unk_8458;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
}

void sub_4214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v6 = WeakRetained;
    BOOL v3 = [WeakRetained currentState] == (char *)&dword_0 + 2;
    id WeakRetained = v6;
    if (!v3)
    {
      id v4 = sub_1488(@"EMERGENCY_BUTTON");
      char v5 = [v6 lockScreenModalView];
      [v5 setSecondaryActionButtonText:v4];

      id WeakRetained = v6;
    }
  }
}

void sub_42A8(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4340;
  v3[3] = &unk_8458;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
}

void sub_4340(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCallButtonEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_456C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_4588()
{
  if (qword_DA28 != -1) {
    dispatch_once(&qword_DA28, &stru_84A0);
  }
  v0 = (void *)qword_DA30;

  return v0;
}

void sub_45DC(id a1)
{
  qword_DA30 = (uint64_t)os_log_create("com.apple.icloud.FindMyiPhoneLockScreen", "_");

  _objc_release_x1();
}

void sub_4620(void *a1, NSObject *a2)
{
  BOOL v3 = [a1 _mainViewController];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "viewController: %@", (uint8_t *)&v4, 0xCu);
}

void sub_46B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to instantiateInitialViewController", v1, 2u);
}

void sub_46FC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "TRACE: pluginAppearance: darkBackground: %d", (uint8_t *)v2, 8u);
}

void sub_4774(void *a1, NSObject *a2)
{
  BOOL v3 = [a1 view];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "FMIPLockScreenViewController loadView: %@", (uint8_t *)&v4, 0xCu);
}

void sub_480C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4878(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "viewDidAppear", v1, 2u);
}

void sub_48BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "viewWillDisappear", v1, 2u);
}

void sub_4900(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4970(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MAEGetActivationStateWithError()
{
  return _MAEGetActivationStateWithError();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__addObservers(void *a1, const char *a2, ...)
{
  return [a1 _addObservers];
}

id objc_msgSend__mainViewController(void *a1, const char *a2, ...)
{
  return [a1 _mainViewController];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_ctClient(void *a1, const char *a2, ...)
{
  return [a1 ctClient];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_disable(void *a1, const char *a2, ...)
{
  return [a1 disable];
}

id objc_msgSend_footnoteText(void *a1, const char *a2, ...)
{
  return [a1 footnoteText];
}

id objc_msgSend_isDeviceActivated(void *a1, const char *a2, ...)
{
  return [a1 isDeviceActivated];
}

id objc_msgSend_isManagedLostmode(void *a1, const char *a2, ...)
{
  return [a1 isManagedLostmode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockScreenModalView(void *a1, const char *a2, ...)
{
  return [a1 lockScreenModalView];
}

id objc_msgSend_lostModeChangedToken(void *a1, const char *a2, ...)
{
  return [a1 lostModeChangedToken];
}

id objc_msgSend_lostModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 lostModeEnabled];
}

id objc_msgSend_lostModeInfo(void *a1, const char *a2, ...)
{
  return [a1 lostModeInfo];
}

id objc_msgSend_lostModeType(void *a1, const char *a2, ...)
{
  return [a1 lostModeType];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_newLockScreenModalView(void *a1, const char *a2, ...)
{
  return [a1 newLockScreenModalView];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pluginAgent(void *a1, const char *a2, ...)
{
  return [a1 pluginAgent];
}

id objc_msgSend_pluginAppearance(void *a1, const char *a2, ...)
{
  return [a1 pluginAppearance];
}

id objc_msgSend_pluginController(void *a1, const char *a2, ...)
{
  return [a1 pluginController];
}

id objc_msgSend_registrationStatusChangedToken(void *a1, const char *a2, ...)
{
  return [a1 registrationStatusChangedToken];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_simStatusChangedToken(void *a1, const char *a2, ...)
{
  return [a1 simStatusChangedToken];
}

id objc_msgSend_stopAlarm(void *a1, const char *a2, ...)
{
  return [a1 stopAlarm];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_updateAppearance(void *a1, const char *a2, ...)
{
  return [a1 updateAppearance];
}

id objc_msgSend_updateLockScreenView(void *a1, const char *a2, ...)
{
  return [a1 updateLockScreenView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}