void sub_1000013B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000013DC(id *a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);

  if (WeakRetained)
  {
    objc_copyWeak(&to, a1 + 9);
    if (v4)
    {
      v6 = [v4 device];
      objc_msgSend(a1[4], "setPresentedDeviceType:", objc_msgSend(v6, "deviceType"));

      v7 = [a1[5] identifier];
      unsigned int v8 = [v7 isEqualToString:@"com.followup.ndo_followup_open_action"];

      if (!v8) {
        goto LABEL_14;
      }
      v34[0] = @"devicetype";
      v9 = [v4 device];
      v10 = [v9 deviceTypeString];
      v34[1] = @"remainingdays";
      v35[0] = v10;
      v11 = [v4 warranty];
      if (v11)
      {
        v2 = [v4 warranty];
        +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v2 daysEligible]);
        v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &off_1000044E8;
      }
      v35[1] = v12;
      v13 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      if (v11)
      {
      }
      +[NDOManager postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.followup" eventDict:v13];
    }
    else
    {
      v13 = _NDOLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100002758((uint64_t)a1, v13);
      }
    }

LABEL_14:
    v14 = [a1[5] identifier];
    unsigned int v15 = [v14 isEqualToString:@"FollowupActionIdentifierClear"] ^ 1;
    if (!v4) {
      LOBYTE(v15) = 0;
    }
    if (v15)
    {
      v16 = [v4 warranty];
      unsigned __int8 v17 = [v16 acOfferEligible];

      if (v17)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100001938;
        v23[3] = &unk_100004218;
        id v24 = a1[5];
        id v25 = a1[7];
        id v26 = v4;
        objc_copyWeak(&v29, &to);
        id v28 = a1[8];
        id v27 = a1[6];
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

        objc_destroyWeak(&v29);
        v18 = &v24;
        v19 = &v25;
        id v20 = v26;
LABEL_21:

        objc_destroyWeak(&to);
        goto LABEL_22;
      }
    }
    else
    {
    }
    id v20 = objc_loadWeakRetained(&to);
    v21 = [v20 manager];
    id v22 = a1[6];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000017E4;
    v30[3] = &unk_1000041F0;
    id v31 = v22;
    id v32 = a1[8];
    [v21 dismissFollowUpForSerialNumber:v31 completion:v30];

    v18 = &v31;
    v19 = &v32;
    goto LABEL_21;
  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_22:
}

void sub_1000017C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

void sub_1000017E4(uint64_t a1, int a2)
{
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"Failed to dismiss";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      CFStringRef v5 = @"Dismissed";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ followup up for %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001924;
  block[3] = &unk_1000041C8;
  id v8 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100001924(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100001938(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  unsigned int v3 = [v2 isEqualToString:@"com.followup.ndo_followup_open_action"];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) userInfo];
    CFStringRef v5 = [v4 objectForKeyedSubscript:@"com.applecare.followup.saleflowsource"];

    if ((+[NDOTypeChecking isNotEmptyString:v5] & 1) == 0)
    {
      uint64_t v6 = _NDOLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000027E8(v6);
      }

      CFStringRef v5 = @"UNKNOWN_FOLLOW_UP";
    }
    id v7 = [objc_alloc((Class)NDOAppleCareViewController) initWithDeviceInfo:*(void *)(a1 + 48) presentationType:1 source:v5 deeplinkParams:0];
    id v8 = (id *)(a1 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [v7 setPresentor:WeakRetained];

    id v10 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
    id v11 = objc_loadWeakRetained((id *)(a1 + 72));
    [v11 setVcToPresent:v10];

    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = objc_loadWeakRetained(v8);
    v14 = [v13 vcToPresent];
    (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v14 == 0);
  }
  else
  {
    unsigned int v15 = [*(id *)(a1 + 32) identifier];
    unsigned int v16 = [v15 isEqualToString:@"com.followup.ndo_notification_clear_action"];

    if (v16)
    {
      unsigned __int8 v17 = _NDOLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v30 = "-[NDOAppleCareLandingViewController processFollowUpItem:selectedAction:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Clear notification button clicked", buf, 0xCu);
      }
    }
    else
    {
      id v18 = objc_loadWeakRetained((id *)(a1 + 72));
      id v19 = [v18 presentedDeviceType];

      if (v19 == (id)1) {
        CFStringRef v20 = @"bridge:root=GENERAL_LINK&path=ABOUT/WARRANTY_DESCRIPTION";
      }
      else {
        CFStringRef v20 = @"prefs:root=General&path=COVERAGE/";
      }
      unsigned __int8 v17 = +[NSURL URLWithString:v20];
      v27[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v27[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v28[0] = &__kCFBooleanTrue;
      v28[1] = &__kCFBooleanTrue;
      v21 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      id v22 = +[LSApplicationWorkspace defaultWorkspace];
      [v22 openSensitiveURL:v17 withOptions:v21];
    }
    id v23 = objc_loadWeakRetained((id *)(a1 + 72));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100001CA0;
    v25[3] = &unk_1000041C8;
    uint64_t v24 = *(void *)(a1 + 56);
    id v26 = (__CFString *)*(id *)(a1 + 64);
    [v23 _clearNotificationForSerialNumber:v24 completion:v25];

    CFStringRef v5 = v26;
  }
}

void sub_100001CA0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001D24;
  block[3] = &unk_1000041C8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100001D24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100001E10(uint64_t a1, int a2)
{
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"Failed to dismiss";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      CFStringRef v5 = @"Dismissed";
    }
    int v8 = 138543618;
    CFStringRef v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ notification for %@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100002368(uint64_t a1, int a2)
{
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"Failed to dismiss";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      CFStringRef v5 = @"Dismissed";
    }
    int v7 = 138543618;
    CFStringRef v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ followup up for %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100002440(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  CFStringRef v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device info refreshed after outreach completion: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10000286C(v5);
  }

  if (*(void *)(a1 + 40) == 2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002580;
    block[3] = &unk_1000042D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100002580(uint64_t a1)
{
  if ([*(id *)(a1 + 32) presentedDeviceType] == (id)1) {
    CFStringRef v2 = @"bridge:root=GENERAL_LINK&path=ABOUT/WARRANTY_DESCRIPTION";
  }
  else {
    CFStringRef v2 = @"prefs:root=General&path=COVERAGE/";
  }
  id v4 = +[NSURL URLWithString:v2];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000026CC(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  id v3 = "-[NDOAppleCareLandingViewController processFollowUpItem:selectedAction:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s: Followup up serial number %@", (uint8_t *)&v2, 0x16u);
}

void sub_100002758(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 136446466;
  __int16 v4 = "-[NDOAppleCareLandingViewController processFollowUpItem:selectedAction:completion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s: No device info found for %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000027E8(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "-[NDOAppleCareLandingViewController processFollowUpItem:selectedAction:completion:]_block_invoke_2";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: No sales flow source in follow up user info notification button clicked", (uint8_t *)&v1, 0xCu);
}

void sub_10000286C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Falied to load warranty from network", v1, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _NDOLogSystem()
{
  return __NDOLogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_acOfferEligible(void *a1, const char *a2, ...)
{
  return [a1 acOfferEligible];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_daysEligible(void *a1, const char *a2, ...)
{
  return [a1 daysEligible];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_deviceTypeString(void *a1, const char *a2, ...)
{
  return [a1 deviceTypeString];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_presentedDeviceType(void *a1, const char *a2, ...)
{
  return [a1 presentedDeviceType];
}

id objc_msgSend_presentedSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 presentedSerialNumber];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_vcToPresent(void *a1, const char *a2, ...)
{
  return [a1 vcToPresent];
}

id objc_msgSend_warranty(void *a1, const char *a2, ...)
{
  return [a1 warranty];
}