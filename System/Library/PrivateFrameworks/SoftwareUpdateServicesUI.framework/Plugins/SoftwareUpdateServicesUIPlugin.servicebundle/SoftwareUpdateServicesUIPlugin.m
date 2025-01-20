id sub_4300(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleNewLayout:context:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

void sub_4340(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v17 = 0;
  objc_storeStrong(&v17, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  v15[1] = a1;
  queue = *((void *)a1[4] + 1);
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_4300;
  v12 = &unk_5E880;
  id v13 = a1[4];
  id v14 = v17;
  v15[0] = v16;
  dispatch_async(queue, &v8);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_4BF8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_4E98(uint64_t result, int a2, int a3)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

uint64_t sub_548C(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_58EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

unsigned char *sub_5A1C(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_6BA8(uint64_t a1)
{
  uint64_t v8 = a1;
  uint64_t v7 = a1;
  char v6 = 0;
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v4 = [v3 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];

  char v6 = v4 & 1;
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v1 = @"YES";
    }
    else {
      CFStringRef v1 = @"NO";
    }
    sub_4BF8((uint64_t)v9, *(void *)(a1 + 32), (uint64_t)v1);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[AlertItem] Open URL (%@) success? %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

void sub_7918(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  id v1 = objc_alloc((Class)SUAnalyticsEvent);
  v4[0] = [v1 initWithEventName:kSUAnalyticsUsageEventName];
  [v4[0] setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:kSUAvailableAlertDownloadAndInstallTapped];
  id v2 = [a1[4] softwareUpdateController];
  [v2 submitSUAnalyticsEvent:v4[0]];

  [a1[4] downloadAndInstall];
  objc_storeStrong(v4, 0);
}

void sub_79E0(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  id v1 = objc_alloc((Class)SUAnalyticsEvent);
  v4[0] = [v1 initWithEventName:kSUAnalyticsUsageEventName];
  [v4[0] setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:kSUAvailableAlertLaterTapped];
  id v2 = [a1[4] softwareUpdateController];
  [v2 submitSUAnalyticsEvent:v4[0]];

  [a1[4] downloadAndInstallLater];
  objc_storeStrong(v4, 0);
}

void sub_7AA8(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  id v1 = objc_alloc((Class)SUAnalyticsEvent);
  v4[0] = [v1 initWithEventName:kSUAnalyticsUsageEventName];
  [v4[0] setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:kSUAvailableAlertDetailsTapped];
  id v2 = [a1[4] softwareUpdateController];
  [v2 submitSUAnalyticsEvent:v4[0]];

  [a1[4] activateSoftwareUpdateSettingsDisplay];
  [a1[4] dismissAlert];
  objc_storeStrong(v4, 0);
}

void sub_7E78(id *a1)
{
  v23[2] = a1;
  v23[1] = a1;
  v23[0] = 0;
  id v22 = 0;
  id v22 = [a1[4] descriptor];

  if (v22)
  {
    id v4 = objc_alloc((Class)SUDownloadOptions);
    id v5 = [a1[5] descriptor];
    id v2 = objc_msgSend(v4, "initWithDescriptor:");
    id v3 = v23[0];
    v23[0] = v2;

    id v7 = [a1[4] softwareUpdateController];
    id v6 = v23[0];
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_8160;
    id v16 = &unk_5CF88;
    id v17 = a1[4];
    [v7 startDownloadWithOptions:v6 withResult:&v12];

    objc_storeStrong(&v17, 0);
    int v18 = 0;
  }
  else
  {
    id v21 = (id)SUSUILog();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      log = v21;
      os_log_type_t type = v20;
      id v1 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v1);
      v19 = v10;
      sub_8120((uint64_t)v24, (uint64_t)v19);
      _os_log_impl(&def_46F0, log, type, "[%{public}@] Unable to start download of nil SUDescriptor", v24, 0xCu);

      objc_storeStrong((id *)&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    int v18 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
}

uint64_t sub_8120(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_8160(void *a1, char a2, id obj)
{
  os_log_type_t v20 = a1;
  char v19 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v17[1] = a1;
  if (v19)
  {
    v17[0] = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v17[0];
      os_log_type_t type = v16;
      id v3 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v3);
      v15 = v10;
      sub_8120((uint64_t)v22, (uint64_t)v15);
      _os_log_impl(&def_46F0, log, type, "[%{public}@] Successfully requested download", v22, 0xCu);

      objc_storeStrong((id *)&v15, 0);
    }
    objc_storeStrong(v17, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v13;
      id v4 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v4);
      v12 = v7;
      sub_8384((uint64_t)v21, (uint64_t)v12, (uint64_t)location);
      _os_log_impl(&def_46F0, v5, v6, "[%{public}@] Failed to initiate SU download: %@", v21, 0x16u);

      objc_storeStrong((id *)&v12, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t sub_8384(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_83D8(uint64_t result, char a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

id sub_8434(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

void sub_8610(id *a1, char a2, id obj)
{
  char v19 = a1;
  char v18 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v16[1] = a1;
  id v3 = (objc_class *)objc_opt_class();
  v16[0] = NSStringFromClass(v3);
  if (v18)
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v21, (uint64_t)v16[0]);
      _os_log_impl(&def_46F0, (os_log_t)v15, v14, "[%{public}@] Attempting to showing install tonight alert.", v21, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    id v4 = [a1[5] softwareUpdateController];
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = sub_88C0;
    v11 = &unk_5D000;
    id v12 = a1[4];
    id v13 = v16[0];
    [v4 _createInstallTonightForecastWithResult:&v7];

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_8A10((uint64_t)v20, (uint64_t)v16[0], (uint64_t)location);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to start download: %{public}@", v20, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&location, 0);
}

void sub_88C0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  if ([location[0] _isForecastExpired])
  {
    oslog[0] = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_8A10((uint64_t)v5, *(void *)(a1 + 40), (uint64_t)location[0]);
      _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] forecast not valid: %{public}@", v5, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
    [*(id *)(a1 + 32) dismissAlert];
  }
  else
  {
    [*(id *)(a1 + 32) _activateInstallLaterAlert:location[0]];
    [*(id *)(a1 + 32) dismissAlert];
  }
  objc_storeStrong(location, 0);
}

uint64_t sub_8A10(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id sub_8DC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_8E1C()
{
  predicate = (dispatch_once_t *)&unk_70330;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5D090);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70328;

  return v0;
}

void sub_8EA8(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70328;
  qword_70328 = (uint64_t)v1;
}

void sub_99C4(void *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (location[0]) {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

id sub_9BDC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isValid];
  if (result) {
    return [*(id *)(a1 + 32) invalidate];
  }
  return result;
}

id sub_9E10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(void *)(a1 + 40), a1, a1);
}

id sub_A190()
{
  predicate = (dispatch_once_t *)&unk_70340;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5D390);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70338;

  return v0;
}

void sub_A21C(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70338;
  qword_70338 = (uint64_t)v1;
}

id sub_AD6C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSURL URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  objc_msgSend(v2, "activateDisplayWithURL:");

  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_ADEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_AE20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_AE54(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_B8E4()
{
  predicate = (dispatch_once_t *)&unk_70350;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5D978);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70348;

  return v0;
}

void sub_B970(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70348;
  qword_70348 = (uint64_t)v1;
}

id sub_C224(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installNowAction", a1, a1);
}

id sub_C258(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remindMeLaterAction", a1, a1);
}

id sub_D41C()
{
  predicate = (dispatch_once_t *)&unk_70360;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5DF58);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70358;

  return v0;
}

void sub_D4A8(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70358;
  qword_70358 = (uint64_t)v1;
}

id sub_DD8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_E138()
{
  predicate = (dispatch_once_t *)&unk_70370;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5DF78);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70368;

  return v0;
}

void sub_E1C4(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70368;
  qword_70368 = (uint64_t)v1;
}

void sub_E9E4(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  [a1[4] setActionTaken:1];
  v10[0] = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v10[0];
    os_log_type_t type = v9;
    id v1 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v1);
    int v8 = v5;
    sub_8120((uint64_t)v11, (uint64_t)v8);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Install now action taken", v11, 0xCu);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(v10, 0);
  id v7 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
  [(SUSUISoftwareUpdateInstallOptions *)v7 setIgnorableConstraints:1024];
  id v2 = [a1[4] softwareUpdateController];
  [v2 installNowFromSource:0];

  objc_storeStrong((id *)&v7, 0);
}

void sub_EB80(id *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  [a1[4] setActionTaken:1];
  v12[0] = (id)SUSUILog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v12[0];
    os_log_type_t type = v11;
    id v1 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v1);
    int v10 = v8;
    sub_8120((uint64_t)v13, (uint64_t)v10);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Remind me later action taken", v13, 0xCu);

    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(v12, 0);
  id v5 = [a1[4] softwareUpdateController];
  id v2 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v2);
  objc_msgSend(v5, "repopInstallAlertWithDefaultDurationFromNowForReason:");
}

id sub_EE94()
{
  predicate = (dispatch_once_t *)&unk_70380;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5E278);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70378;

  return v0;
}

void sub_EF20(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70378;
  qword_70378 = (uint64_t)v1;
}

id sub_F400(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_F5E4()
{
  predicate = (dispatch_once_t *)&unk_70390;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5E578);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70388;

  return v0;
}

void sub_F670(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70388;
  qword_70388 = (uint64_t)v1;
}

__CFString *SUSUIStringForInstallAlertInstallStyle(unint64_t a1)
{
  if (a1 <= 1)
  {
    unint64_t v2 = a1 - 1;
    char v1 = 0;
  }
  else
  {
    unint64_t v2 = a1 - 1;
    char v1 = 1;
  }
  if (v1)
  {
    id v4 = @"None-alert-style";
  }
  else
  {
    switch(v2)
    {
      case 0uLL:
        id v4 = @"Auto-download";
        break;
      case 1uLL:
        id v4 = @"Install-with-countdown";
        break;
      case 2uLL:
        id v4 = @"Install-without-countdown";
        break;
      case 3uLL:
        id v4 = @"Enforced-install-now";
        break;
      case 4uLL:
        id v4 = @"Enforced-install-reminder";
        break;
      case 5uLL:
        id v4 = @"Enforced-install-countdown";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v4;
}

id sub_11B70(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v4, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Install Now action taken.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  [*(id *)(a1 + 40) _submitUserInteractionEvent:kSUSoftwareUpdateInstallAlertInstallNowTapped];
  [*(id *)(a1 + 40) _installUpdateNow];
  return [*(id *)(a1 + 40) dismissAlert];
}

id sub_12074(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v4, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to showing install tonight alert.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  [*(id *)(a1 + 40) _submitUserInteractionEvent:kSUSoftwareUpdateInstallAlertInstallLaterTapped];
  [*(id *)(a1 + 40) _userAskedToDeferInstall];
  if (([*(id *)(*(void *)(a1 + 48) + 89) _isForecastExpired] & 1) == 0) {
    return [*(id *)(a1 + 40) _activateInstallLaterAlert];
  }
  [*(id *)(a1 + 40) _scheduleInstallAlertRepopOnDismissWithReason:@"Try tonight forecast expired."];
  return [*(id *)(a1 + 40) dismissAlert];
}

id sub_125F8(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v11, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v8, "[%@] Remind me later action taken", v11, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) _userAskedToDeferInstall];
  [*(id *)(a1 + 40) _submitUserInteractionEvent:kSUSoftwareUpdateInstallAlertRemindMeLaterTapped];
  if (*(void *)(*(void *)(a1 + 48) + 41) < 4uLL)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(v3, "_stringFromAlertStyle:", objc_msgSend(v3, "style"));
    id v4 = +[NSString stringWithFormat:@"\"Later\" from %@ of style: %@", v2, v5];
    objc_msgSend(v3, "_scheduleInstallAlertRepopOnDismissWithReason:");
  }
  else
  {
    id v7 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v10, *(void *)(a1 + 32));
      _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "[%@] DDM alert, don't schedule anything here", v10, 0xCu);
    }
    objc_storeStrong(&v7, 0);
  }
  return [*(id *)(a1 + 40) dismissAlert];
}

void sub_12A50(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v6, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v4, "[%{public}@] Emergency action taken", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) _submitUserInteractionEvent:kSUSoftwareUpdateInstallAlertEmergencyTapped];
  id v3 = [[SUSUIFullScreenEmergencyCallAlert alloc] initWithCompletionBlock:0];
  id v2 = [*(id *)(a1 + 40) softwareUpdateController];
  if (v3 && v2) {
    [v2 presentFullScreenAlert:v3 completion:0];
  }
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
}

id sub_12DCC(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v8, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Route to settings action taken", v8, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) _submitUserInteractionEvent:kSUSoftwareUpdateInstallAlertDetailsTapped];
  id v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = objc_msgSend(v3, "_stringFromAlertStyle:", objc_msgSend(v3, "style"));
  os_log_type_t v4 = +[NSString stringWithFormat:@"\"Details\" from %@ of style: %@", v2, v5];
  objc_msgSend(v3, "_scheduleInstallAlertRepopOnDismissWithReason:");

  [*(id *)(a1 + 40) activateSoftwareUpdateSettingsDisplay];
  return [*(id *)(a1 + 40) dismissAlert];
}

void sub_13554(id *a1, char a2)
{
  os_log_type_t v4 = a1;
  char v3 = a2 & 1;
  location[1] = a1;
  location[0] = [a1[4] softwareUpdateController];
  if (v3) {
    [location[0] installTonight];
  }
  else {
    [location[0] repopInstallAlertWithDefaultDurationFromNowForReason:@"Authentication failed from install tonight passcode authentication alert."];
  }
  objc_storeStrong(location, 0);
}

id sub_135E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_137CC()
{
  predicate = (dispatch_once_t *)&unk_703A0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5E8A0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70398;

  return v0;
}

void sub_13858(id a1)
{
  char v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_70398;
  qword_70398 = (uint64_t)v1;
}

void sub_13944(id a1)
{
  char v1 = objc_alloc_init(SUSUICommandLineTestServer);
  uint64_t v2 = (void *)qword_703A8;
  qword_703A8 = (uint64_t)v1;
}

id sub_13A94(uint64_t a1)
{
  os_log_type_t v9 = +[SUSUISoftwareUpdateController sharedInstance];
  char v1 = [(SUSUISoftwareUpdateController *)v9 clientQueue];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v1;

  id v4 = objc_alloc((Class)NSXPCListener);
  id v5 = [v4 initWithMachServiceName:SUSUICLIToolConnectionName];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 32) + 8) resume];
}

uint64_t sub_141D8(uint64_t result, int a2)
{
  *(unsigned char *)id result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_14210(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v44 = 0;
  objc_storeStrong(&v44, a3);
  v43[1] = a1;
  if (v44)
  {
    id v3 = [*((id *)a1[4] + 3) stringByAppendingString:@"[] Faild finding an update, using a downloaded update instead.\n"];
    id v4 = a1[4];
    id v5 = (void *)v4[3];
    id v4[3] = v3;

    v43[0] = (id)SUSUILog();
    os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v43[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v43[0];
      os_log_type_t type = v42;
      sub_5A1C(v41);
      _os_log_impl(&def_46F0, log, type, "Faild finding an update, using a downloaded update instead", v41, 2u);
    }
    objc_storeStrong(v43, 0);
    id v12 = +[SUSUISoftwareUpdateController sharedInstance];
    v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_146E8;
    v35 = &unk_5EBF0;
    id v36 = a1[4];
    v40[1] = a1[9];
    id v37 = a1[5];
    id v38 = a1[6];
    id v39 = a1[7];
    v40[0] = a1[8];
    [(SUSUISoftwareUpdateController *)v12 _discoveredUpdates:&v31];

    objc_storeStrong(v40, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v6 = [*((id *)a1[4] + 3) stringByAppendingString:@"[] Found a new update, continue presenting the alert.\n"];
    id v7 = a1[4];
    os_log_type_t v8 = (void *)v7[3];
    v7[3] = v6;

    id v30 = (id)SUSUILog();
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v30;
      os_log_type_t v11 = v29;
      sub_5A1C(v28);
      _os_log_impl(&def_46F0, v10, v11, "Found a new update, continue presenting the alert", v28, 2u);
    }
    objc_storeStrong(&v30, 0);
    os_log_type_t v9 = +[SUSUISoftwareUpdateController sharedInstance];
    id v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    os_log_type_t v20 = sub_14978;
    id v21 = &unk_5EBC8;
    id v22 = a1[4];
    v27[1] = a1[9];
    id v23 = a1[5];
    id v24 = a1[6];
    id v25 = location[0];
    id v26 = a1[7];
    v27[0] = a1[8];
    [(SUSUISoftwareUpdateController *)v9 _createInstallTonightForecastWithResult:&v17];

    objc_storeStrong(v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

void sub_146E8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v17 = 0;
  objc_storeStrong(&v17, a3);
  id v16[2] = a1;
  id v5 = +[SUSUISoftwareUpdateController sharedInstance];
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  os_log_type_t v9 = sub_148F4;
  int v10 = &unk_5EBC8;
  id v11 = a1[4];
  v16[1] = a1[9];
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = location[0];
  id v15 = a1[7];
  v16[0] = a1[8];
  -[SUSUISoftwareUpdateController _createInstallTonightForecastWithResult:](v5, "_createInstallTonightForecastWithResult:");

  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void sub_148F4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) presentMiniAlert:*(void *)(a1 + 80) errorCode:*(void *)(a1 + 40) downloadDescriptor:*(void *)(a1 + 48) scanResultsDescriptor:*(void *)(a1 + 56) autoInstallForecast:location[0] andRollbackDescriptor:*(void *)(a1 + 64) result:*(void *)(a1 + 72)];
  objc_storeStrong(location, 0);
}

void sub_14978(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) presentMiniAlert:*(void *)(a1 + 80) errorCode:*(void *)(a1 + 40) downloadDescriptor:*(void *)(a1 + 48) scanResultsDescriptor:*(void *)(a1 + 56) autoInstallForecast:location[0] andRollbackDescriptor:*(void *)(a1 + 64) result:*(void *)(a1 + 72)];
  objc_storeStrong(location, 0);
}

id sub_15A88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

BOOL sub_16000(id a1)
{
  return BYSetupAssistantNeedsToRun() & 1;
}

uint64_t sub_16030(uint64_t result, uint64_t a2)
{
  *(unsigned char *)id result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_16304(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[1] = (id)a1;
  v15[0] = 0;
  if (*(void *)(a1 + 40))
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v17, *(void *)(a1 + 40));
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Unknown laggards UI type: %lu", v17, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    id v5 = [SUSUIFullScreenScheduleUpdateAlert alloc];
    id v6 = [location[0] preferredDescriptor];
    os_log_type_t v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_16540;
    id v13 = &unk_5CFD8;
    id v14 = *(id *)(a1 + 32);
    uint64_t v2 = [(SUSUIFullScreenScheduleUpdateAlert *)v5 initWithDescriptor:v6 completionBlock:&v9];
    id v3 = v15[0];
    v15[0] = v2;

    objc_storeStrong(&v14, 0);
  }
  id v4 = +[SUSUISoftwareUpdateController sharedInstance];
  -[SUSUISoftwareUpdateController presentFullScreenAlert:completion:](v4, "presentFullScreenAlert:completion:", v15[0]);

  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_16540(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_16594(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  v8[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_4BF8((uint64_t)v11, (uint64_t)location[0], (uint64_t)v9);
    _os_log_impl(&def_46F0, (os_log_t)v8[0], OS_LOG_TYPE_DEFAULT, "Scan Results: %@, error: %@", v11, 0x16u);
  }
  objc_storeStrong(v8, 0);
  char v6 = 0;
  BOOL v3 = 1;
  if (!v9)
  {
    id v7 = [location[0] preferredDescriptor];
    char v6 = 1;
    BOOL v3 = v7 == 0;
  }
  if (v6) {

  }
  if (v3) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else {
    (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

BOOL sub_16B80(uint64_t a1, uint64_t a2)
{
  return sub_17DB0(a1, a2) != 0;
}

void sub_16BBC(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = (id)a1;
  id v9 = [SUSUIFullScreenAuthenticationAlert alloc];
  id v10 = [location[0] descriptor];
  id v5 = v14;
  char v6 = *(unsigned char *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 49);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
  id v12 = *(id *)(a1 + 40);
  v13[0] = -[SUSUIFullScreenAuthenticationAlert initWithDescriptor:autoInstallForecast:forInstallTonight:canDeferInstallation:completionQueue:completionBlock:](v9, "initWithDescriptor:autoInstallForecast:forInstallTonight:canDeferInstallation:completionQueue:completionBlock:", v10, v5, v6 & 1, v7 & 1, v8);

  int v11 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v11 presentAuthenticationAlert:v13[0] completion:0];

  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_16D80(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_16DF4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

uint64_t sub_16FA4(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

id sub_1728C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reboot:", 0, a1, a1);
}

uint64_t sub_17DB0(uint64_t a1, uint64_t a2)
{
  return a1 & a2;
}

void sub_19278(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v6, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v4, "[%{public}@] Install tonight action taken", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  *(unsigned char *)(*(void *)(a1 + 40) + 57) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v1 = [WeakRetained softwareUpdateController];
  [v1 installTonight];

  objc_storeStrong(&WeakRetained, 0);
}

void sub_193C4(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v7, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v5, "[%{public}@] Remind me later action taken", v7, 0xCu);
  }
  objc_storeStrong(location, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = WeakRetained;
  uint64_t v2 = +[NSString stringWithFormat:@"\"Later\" from install tonight alert: %@", *(void *)(a1 + 32)];
  objc_msgSend(v1, "_scheduleInstallAlertRepopOnDismissWithReason:");

  [WeakRetained dismissAlert];
  objc_storeStrong(&WeakRetained, 0);
}

void sub_19530(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v7, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v5, "[%{public}@] Emergency action taken", v7, 0xCu);
  }
  objc_storeStrong(location, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [[SUSUIFullScreenEmergencyCallAlert alloc] initWithCompletionBlock:0];
  id v2 = [WeakRetained softwareUpdateController];
  if (v3 && v2) {
    [v2 presentEmergencyCallAlert:v3 completion:0];
  }
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&WeakRetained, 0);
}

id sub_19CA8()
{
  predicate = (dispatch_once_t *)&unk_703C8;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5F020);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_703C0;

  return v0;
}

void sub_19D34(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_703C0;
  qword_703C0 = (uint64_t)v1;
}

__CFString *window2Str(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      id v2 = @"SUSUIDDMReminderWindowOverdue";
      break;
    case 2:
      id v2 = @"SUSUIDDMReminderWindowSoon";
      break;
    case 3:
      id v2 = @"SUSUIDDMReminderWindowFar";
      break;
    default:
      id v2 = @"SUSUIDDMReminderWindowNone";
      break;
  }

  return v2;
}

uint64_t sub_1A638(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1A68C(uint64_t result, uint64_t a2)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1A7D0(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if (!*(void *)(a1 + 32))
  {
    if (*(void *)(*(void *)(a1 + 40) + 8))
    {
      location[0] = (id)SUSUILog();
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v31, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke");
      }
      objc_storeStrong(location, 0);
      [*(id *)(a1 + 40) _disarm];
      return;
    }
    id v22 = (id)SUSUILog();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v30, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke");
      _os_log_impl(&def_46F0, (os_log_t)v22, v21, "%s: [DDM] Got nil and the existing one is also nil...", v30, 0xCu);
    }
    objc_storeStrong(&v22, 0);
    goto LABEL_20;
  }
  if (([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 8)] & 1) == 0)
  {
    if (*(void *)(*(void *)(a1 + 40) + 8))
    {
      os_log_t v18 = (os_log_t)(id)SUSUILog();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        sub_1ADDC((uint64_t)v28, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke", *(void *)(*(void *)(a1 + 40) + 8), *(void *)(a1 + 32));
        _os_log_impl(&def_46F0, v18, v17, "%s: [DDM] Replacing existing declaration: %@ \nwith new declaration: %@", v28, 0x20u);
      }
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      os_log_t v16 = (os_log_t)(id)SUSUILog();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A638((uint64_t)v27, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke", *(void *)(a1 + 32));
        _os_log_impl(&def_46F0, v16, v15, "%s: [DDM] No previous declaration, new declaration: %@", v27, 0x16u);
      }
      objc_storeStrong((id *)&v16, 0);
    }
LABEL_20:
    if ([(id)objc_opt_class() _isDeclarationRelevant:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
      id v10 = [*(id *)(*(void *)(a1 + 40) + 8) enforcedInstallDate];
      id v9 = +[NSDate now];
      uint64_t v8 = [(NSDate *)v9 dateByAddingTimeInterval:3600.0];
      id v1 = objc_msgSend(v10, "laterDate:");
      uint64_t v2 = *(void *)(a1 + 40);
      id v3 = *(void **)(v2 + 64);
      *(void *)(v2 + 64) = v1;

      os_log_t v14 = (os_log_t)(id)SUSUILog();
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v7 = *(void **)(*(void *)(a1 + 40) + 64);
        [v7 timeIntervalSince1970];
        sub_1AE48((uint64_t)v26, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke", (uint64_t)v7, v4);
        _os_log_impl(&def_46F0, v14, v13, "%s: [DDM] Will directly start installing after %@ (interval: %lf)", v26, 0x20u);
      }
      objc_storeStrong((id *)&v14, 0);
      [*(id *)(a1 + 40) _setPasscodePolicyToRequiredIfNeeded];
      [*(id *)(a1 + 40) _makeScheduling];
      [*(id *)(a1 + 40) _scheduleNextDDMAlert];
      *(unsigned char *)(*(void *)(a1 + 40) + 88) = 0;
    }
    else
    {
      os_log_t v12 = (os_log_t)(id)SUSUILog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v5 = objc_opt_class();
        sub_1ADDC((uint64_t)v25, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke", v6, v5);
        _os_log_impl(&def_46F0, v12, OS_LOG_TYPE_DEFAULT, "%s: [DDM] Declaration %@ isn't relevant for %@", v25, 0x20u);
      }
      objc_storeStrong((id *)&v12, 0);
    }
    return;
  }
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v29, (uint64_t)"-[SUSUIDDMController setDeclaration:]_block_invoke");
    _os_log_impl(&def_46F0, oslog, v19, "%s: [DDM] New declaration equals the existing one. No need to do anything", v29, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

uint64_t sub_1ADDC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_1AE48(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_1C320(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a1;
  uint64_t v22 = a1;
  unint64_t v23 = a2 & ~(unint64_t)[*(id *)(a1 + 32) ignorableConstraints];
  if (v23)
  {
    os_log_t v9 = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_1C924((uint64_t)v25, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke", v23);
      _os_log_impl(&def_46F0, v9, OS_LOG_TYPE_DEFAULT, "%s: [DDM] Cannot install due to %ld; show an alert instead",
        v25,
        0x16u);
    }
    objc_storeStrong((id *)&v9, 0);
    [*(id *)(a1 + 40) _showDDMAlertNowOrInstallIfNecessary:0];
  }
  else
  {
    id v4 = +[UMUserManager sharedManager];
    unsigned __int8 v5 = [v4 isSharedIPad];

    char v21 = v5 & 1;
    uint64_t v6 = +[SUSUIPreferences sharedInstance];
    unsigned __int8 v7 = [(SUSUIPreferences *)v6 isSharedIPad];

    if (v7)
    {
      id location = (id)SUSUILog();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v30, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke");
        _os_log_impl(&def_46F0, (os_log_t)location, v19, "%s: [DDM] Overriding isSharedIPad to YES", v30, 0xCu);
      }
      objc_storeStrong(&location, 0);
      char v21 = 1;
    }
    id v18 = (id)SUSUILog();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      sub_1C87C((uint64_t)v29, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke", v21 & 1);
      _os_log_impl(&def_46F0, (os_log_t)v18, v17, "%s: [DDM] Installing DDM update now (isSharedIpad = %d)", v29, 0x12u);
    }
    objc_storeStrong(&v18, 0);
    if (v21)
    {
      id v16 = (id)SUSUILog();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v28, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke");
        _os_log_impl(&def_46F0, (os_log_t)v16, v15, "%s: [DDM] Directly install the update on a shared iPad", v28, 0xCu);
      }
      objc_storeStrong(&v16, 0);
      [*(id *)(a1 + 40) _doInstall:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v2 = [SUSUISoftwareUpdateInstallAlertItem alloc];
      id v3 = [*(id *)(*(void *)(a1 + 40) + 16) _download];
      id obj = -[SUSUISoftwareUpdateInstallAlertItem initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:](v2, "initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:");

      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_1C8D0((uint64_t)v27, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke", (uint64_t)obj);
        _os_log_impl(&def_46F0, oslog, v12, "%s: [DDM] [Install Alert] Presenting %{public}@", v27, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if ([*(id *)(*(void *)(a1 + 40) + 16) presentAlert:obj])
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), obj);
      }
      else
      {
        os_log_t v11 = (os_log_t)(id)SUSUILog();
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          sub_1A68C((uint64_t)v26, (uint64_t)"-[SUSUIDDMController _installNow]_block_invoke");
          _os_log_impl(&def_46F0, v11, v10, "%s: [DDM] Failed to show the countdown; try to show a regular alert",
            v26,
            0xCu);
        }
        objc_storeStrong((id *)&v11, 0);
        [*(id *)(a1 + 40) _showDDMAlertNowOrInstallIfNecessary:0];
      }
      objc_storeStrong(&obj, 0);
    }
  }
}

uint64_t sub_1C87C(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t sub_1C8D0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1C924(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1D8AC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_1E524(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) humanReadableUpdateName];
    sub_1A638((uint64_t)v8, (uint64_t)"-[SUSUIDDMController installDidStart:]_block_invoke", (uint64_t)v4);
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: [DDM] Started to install %@; pause showing alert...",
      v8,
      0x16u);
  }
  objc_storeStrong(location, 0);
  *(unsigned char *)(*(void *)(a1 + 40) + 88) = 1;
  id v3 = +[SUSUIFollowUpPresenter sharedInstance];
  id v2 = +[SUSUIFollowUpDDMUpdate uniqueIdentifier];
  id v7 = v2;
  id v1 = +[NSArray arrayWithObjects:&v7 count:1];
  -[SUSUIFollowUpPresenter clearFollowUpWithIdentifiers:](v3, "clearFollowUpWithIdentifiers:");
}

void sub_1E7D4(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  if ([a1[4] _isUpdateRelevant:a1[5]])
  {
    location[0] = (id)SUSUILog();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [a1[5] humanReadableUpdateName];
      sub_1A638((uint64_t)v8, (uint64_t)"-[SUSUIDDMController installDidFinish:]_block_invoke", (uint64_t)v2);
      _os_log_impl(&def_46F0, (os_log_t)location[0], v5, "%s: [DDM] Finished to install relevant update %@; disarming...",
        v8,
        0x16u);
    }
    objc_storeStrong(location, 0);
    [a1[4] _disarm];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v1 = [a1[5] humanReadableUpdateName];
      sub_1A638((uint64_t)v7, (uint64_t)"-[SUSUIDDMController installDidFinish:]_block_invoke", (uint64_t)v1);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] Finished to install irrelevant update %@; resume showing alert...",
        v7,
        0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    *((unsigned char *)a1[4] + 88) = 0;
  }
}

void sub_1EBDC(uint64_t a1)
{
  id v17[2] = (id)a1;
  v17[1] = (id)a1;
  v17[0] = *(id *)(*(void *)(a1 + 32) + 48);
  if (*(uint64_t *)(a1 + 40) >= 0)
  {
    unint64_t v15 = *(void *)(a1 + 40);
    if (v15 < (unint64_t)[*(id *)(*(void *)(a1 + 32) + 72) count]) {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndex:*(void *)(a1 + 40)];
    }
    else {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 72) lastObject];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;
  }
  else
  {
    id v1 = [*(id *)(a1 + 32) _schedulingUnitWithIntervalFromEnforcedDate:(double)(86400 * *(void *)(a1 + 40))];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = v1;
  }
  if (qword_703D8) {
    [(id)qword_703D8 dismissAlert];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    os_log_type_t v13 = [SUSUISoftwareUpdateInstallAlertItem alloc];
    id v14 = [*(id *)(*(void *)(a1 + 32) + 16) _download];
    id v7 = -[SUSUISoftwareUpdateInstallAlertItem initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:](v13, "initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:", v14, [*(id *)(a1 + 32) scheduledAlertStyle], *(void *)(*(void *)(a1 + 32) + 16), 0);
    uint64_t v8 = (void *)qword_703D8;
    qword_703D8 = (uint64_t)v7;
  }
  else
  {
    os_log_t v11 = [SUSUIDDMAvailableAlertItem alloc];
    id v12 = [*(id *)(a1 + 32) descriptor];
    os_log_t v9 = -[SUSUIDDMAvailableAlertItem initWithDescriptor:softwareUpdateController:alertWindow:](v11, "initWithDescriptor:softwareUpdateController:alertWindow:", v12, *(void *)(*(void *)(a1 + 32) + 16), [*(id *)(*(void *)(a1 + 32) + 48) window]);
    os_log_type_t v10 = (void *)qword_703D8;
    qword_703D8 = (uint64_t)v9;
  }
  [*(id *)(a1 + 32) _presentAlert:qword_703D8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v17[0]);
  objc_storeStrong(v17, 0);
}

id sub_1EF7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showDDMAlert:install:", *(void *)(*(void *)(a1 + 32) + 80) - 1, *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

id sub_1F15C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installNow", a1, a1);
}

id sub_1F310()
{
  predicate = (dispatch_once_t *)&unk_703E8;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5F398);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_703E0;

  return v0;
}

void sub_1F39C(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_703E0;
  qword_703E0 = (uint64_t)v1;
}

id sub_1F7B0()
{
  predicate = (dispatch_once_t *)&unk_703F8;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5F698);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_703F0;

  return v0;
}

void sub_1F83C(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_703F0;
  qword_703F0 = (uint64_t)v1;
}

id sub_1FA8C()
{
  predicate = (dispatch_once_t *)&unk_70408;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5F998);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70400;

  return v0;
}

void sub_1FB18(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_70400;
  qword_70400 = (uint64_t)v1;
}

id sub_201AC(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v4, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] OK action taken.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  return [*(id *)(a1 + 40) dismissAlert];
}

id sub_2042C()
{
  predicate = (dispatch_once_t *)&unk_70418;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5FC98);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70410;

  return v0;
}

void sub_204B8(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_70410;
  qword_70410 = (uint64_t)v1;
}

void sub_208CC(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void sub_20924(uint64_t a1)
{
}

void sub_20954(uint64_t a1)
{
  id v12[3] = (id)a1;
  v12[2] = (id)a1;
  *(_DWORD *)(*(void *)(a1 + 32) + 52) = -1;
  name = (char *)kSBSLockStateNotifyKey;
  uint64_t v1 = *(void *)(a1 + 32);
  queue = *(NSObject **)(v1 + 8);
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  os_log_type_t v10 = sub_20AEC;
  os_log_t v11 = &unk_5FCE8;
  v12[0] = *(id *)(a1 + 32);
  v12[1] = *(id *)(a1 + 48);
  notify_register_dispatch(name, (int *)(v1 + 52), queue, &v7);
  objc_msgSend(*(id *)(a1 + 32), "_queue_UILockStateChanged:initially:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "_queue_fetchUILockState") & 1, 1);
  id v4 = *(id **)(a1 + 32);
  id v5 = [v4[3] currentLayout];
  objc_msgSend(v4, "_queue_handleNewLayout:context:");

  if (*(void *)(a1 + 40)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  objc_storeStrong(v12, 0);
}

id sub_20AEC(id result)
{
  if (*(_DWORD *)(*((void *)result + 4) + 52) != -1) {
    return objc_msgSend(*(id *)(*(void *)(*((void *)result + 5) + 8) + 40), "_queue_UILockStateChanged:initially:", (unint64_t)objc_msgSend(*((id *)result + 4), "_queue_fetchUILockState") & 1, 0);
  }
  return result;
}

void sub_20D3C(uint64_t a1)
{
}

uint64_t sub_20E8C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48) & 1;
  return result;
}

uint64_t sub_20FCC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 50) & 1;
  return result;
}

void *sub_21104(void *result)
{
  if (result[4]) {
    return [*(id *)(result[5] + 32) addObject:result[4]];
  }
  return result;
}

void *sub_21268(void *result)
{
  if (result[4]) {
    return [*(id *)(result[5] + 32) removeObject:result[4]];
  }
  return result;
}

id sub_213D4(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_queue_fetchUILockState");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

void sub_216B4(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      if (objc_opt_respondsToSelector()) {
        [v9 layoutStateMonitorUILockStateDidChange:*(void *)(a1 + 40)];
      }
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

void sub_21888(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      if (objc_opt_respondsToSelector()) {
        [v9 layoutStateMonitorStateDidChange:*(void *)(a1 + 40)];
      }
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

id sub_22578()
{
  predicate = (dispatch_once_t *)&unk_70428;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_5FD58);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70420;

  return v0;
}

void sub_22604(id a1)
{
  uint64_t v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  uint64_t v2 = (void *)qword_70420;
  qword_70420 = (uint64_t)v1;
}

__CFString *SUSUIStringForInstallSource(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = @"Automatic";
    }
  }
  else
  {
    uint64_t v2 = @"User Action";
  }

  return v2;
}

__CFString *SUSUIStringForInstallAlertFlow(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if (v1)
  {
    id v4 = @"Unknown";
  }
  else
  {
    switch(v2)
    {
      case 0:
        id v4 = @"None";
        break;
      case 1:
        id v4 = @"AutoDownloadNotify";
        break;
      case 2:
        id v4 = @"ManualUserDownload";
        break;
      case 3:
        id v4 = @"InstallTonightWithCountdown";
        break;
      case 4:
        id v4 = @"InstallWithoutCountdown";
        break;
      case 5:
        id v4 = @"AutoUpdate";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v4;
}

__CFString *SUSUIStringForInstallType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"Install Tonight";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"Auto Update";
    }
  }
  else
  {
    uint64_t v2 = @"Install Now";
  }

  return v2;
}

__CFString *SUSUIStringForInstallAlertRepopStrategy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        id v4 = @"None";
        break;
      case 1:
        id v4 = @"Default";
        break;
      case 2:
        id v4 = @"Default - 1 Week";
        break;
      case 3:
        id v4 = @"Immediate";
        break;
      case 4:
        id v4 = @"Immediate with small buffer";
        break;
      case 5:
        id v4 = @"Immediate with longer buffer";
        break;
      case 6:
        id v4 = @"Until Able";
        break;
      case 7:
        id v4 = @"Next Unlock";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v4;
}

__CFString *SUSUIStringForInstallPolicyType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = @"Required";
    }
    else {
      uint64_t v2 = @"Unknown";
    }
  }
  else
  {
    uint64_t v2 = @"Default";
  }

  return v2;
}

void sub_22E68(id a1)
{
  char v1 = objc_alloc_init(SUSUISoftwareUpdateController);
  uint64_t v2 = (void *)qword_70430;
  qword_70430 = (uint64_t)v1;
}

void sub_230DC(id *a1)
{
  v62[2] = a1;
  v62[1] = a1;
  *((void *)a1[4] + 25) = 0;
  objc_storeStrong((id *)a1[4] + 4, 0);
  objc_storeStrong((id *)a1[4] + 26, 0);
  objc_storeStrong((id *)a1[4] + 3, a1[5]);
  char v1 = [[SUSUIAlertPresentationManager alloc] initWithQueue:*((void *)a1[4] + 3)];
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)v2[10];
  v2[10] = v1;

  id v4 = [[SUSUIFullScreenAlertPresentationManager alloc] initWithQueue:*((void *)a1[4] + 3)];
  id v5 = a1[4];
  uint64_t v6 = (void *)v5[9];
  v5[9] = v4;

  id v7 = [objc_alloc((Class)SUManagerClient) initWithDelegate:a1[4] queue:*((void *)a1[4] + 3) clientType:0];
  int v8 = a1[4];
  id v9 = (void *)v8[2];
  id v8[2] = v7;

  uint64_t v10 = objc_alloc_init(SUSUILayoutStateMonitor);
  uint64_t v11 = a1[4];
  id v12 = (void *)v11[11];
  v11[11] = v10;

  objc_storeStrong((id *)a1[4] + 8, 0);
  id v13 = +[SUSFollowUpController sharedController];
  id v14 = a1[4];
  unint64_t v15 = (void *)v14[30];
  v14[30] = v13;

  id v16 = +[NSHashTable weakObjectsHashTable];
  os_log_type_t v17 = a1[4];
  id v18 = (void *)v17[16];
  v17[16] = v16;

  id v19 = objc_alloc_init((Class)SUSUISoftwareUpdateDefaults);
  os_log_type_t v20 = a1[4];
  char v21 = (void *)v20[17];
  v20[17] = v19;

  id v22 = objc_alloc_init((Class)SUSUIExternalSettingsAppDefaults);
  unint64_t v23 = a1[4];
  uint64_t v24 = (void *)v23[18];
  v23[18] = v22;

  id v25 = +[SUKeybagInterface sharedInstance];
  id v26 = a1[4];
  v27 = (void *)v26[13];
  v26[13] = v25;

  v50 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v28 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.badgingQueue", v50);
  os_log_type_t v29 = a1[4];
  id v30 = (void *)v29[19];
  v29[19] = v28;

  v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v31 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.backgroundQueue", v51);
  int v32 = a1[4];
  int v33 = (void *)v32[21];
  v32[21] = v31;

  id v34 = objc_alloc_init((Class)FBSSystemService);
  v35 = a1[4];
  id v36 = (void *)v35[20];
  v35[20] = v34;

  objc_storeStrong((id *)a1[4] + 24, 0);
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  id v38 = a1[4];
  id v39 = (void *)v38[27];
  v38[27] = v37;

  id v40 = objc_alloc_init((Class)NSMutableDictionary);
  v41 = a1[4];
  os_log_type_t v42 = (void *)v41[28];
  v41[28] = v40;

  v52 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v43 = dispatch_queue_create("com.apple.softwareupdateservices.ui.ios.homescreenArrayQueue", v52);
  id v44 = a1[4];
  v45 = (void *)v44[29];
  v44[29] = v43;

  v46 = +[SUSUIAuthenticationInterface sharedInstance];
  v47 = a1[4];
  v48 = (void *)v47[14];
  v47[14] = v46;

  [*((id *)a1[4] + 14) setIsController:1];
  [*((id *)a1[4] + 14) resetAttempts];
  v53 = +[BSPowerMonitor sharedInstance];
  [(BSPowerMonitor *)v53 addObserver:a1[4]];

  [a1[4] _migrateForNewOSVersionIfNecessary];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1[4], (CFNotificationCallback)sub_23628, @"SBSpringBoardDidLaunchNotification", 0, CFNotificationSuspensionBehaviorDrop);
  dispatch_time_t v54 = dispatch_time(0, 5000000000);
  dispatch_queue_t queue = &_dispatch_main_q;
  v57 = _NSConcreteStackBlock;
  int v58 = -1073741824;
  int v59 = 0;
  v60 = sub_2367C;
  v61 = &unk_5CC30;
  v62[0] = a1[4];
  dispatch_after(v54, queue, &v57);

  [a1[4] _initializeState];
  objc_storeStrong(v62, 0);
}

id sub_23628(uint64_t a1, void *a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a2, @"SBSpringBoardDidLaunchNotification", 0);
  return [a2 initPostOTAFollowUpController];
}

id sub_2367C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initPostOTAFollowUpController", a1, a1);
}

void sub_238D8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  if (location[0])
  {
    v8[0] = (id)SUSUILog();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_1A638((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateController _initializeState]_block_invoke", (uint64_t)location[0]);
      _os_log_impl(&def_46F0, (os_log_t)v8[0], v7, "%s: [DDM] Found declaration: %@", v12, 0x16u);
    }
    objc_storeStrong(v8, 0);
    id v3 = [a1[4] getInitIfNeededDDMController];
    [*((id *)a1[4] + 26) setDeclaration:location[0]];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateController _initializeState]_block_invoke");
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] No declaration found", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void sub_23AD0(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v85 = 0;
  objc_storeStrong(&v85, a3);
  id v84 = 0;
  objc_storeStrong(&v84, a4);
  id v83 = 0;
  objc_storeStrong(&v83, a5);
  v82 = a1;
  char v80 = 0;
  unsigned __int8 v44 = 0;
  if (location[0])
  {
    id v81 = [location[0] progress];
    char v80 = 1;
    unsigned __int8 v44 = [v81 isDone];
  }
  if (v80) {

  }
  if (v44)
  {
    [a1[4] _setInstallPolicy:v85];
    id v79 = (id)SUSUILog();
    os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_DEFAULT))
    {
      log = v79;
      os_log_type_t type = v78;
      id v36 = location[0];
      id v39 = [location[0] descriptor];
      id v77 = v39;
      sub_24660((uint64_t)v89, (uint64_t)v36, (uint64_t)v77);
      _os_log_impl(&def_46F0, log, type, "Download (%p) found complete at startup for descriptor: %@", v89, 0x16u);

      objc_storeStrong(&v77, 0);
    }
    objc_storeStrong(&v79, 0);
    id v76 = (id)SUSUILog();
    os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_DEFAULT))
    {
      sub_4BF8((uint64_t)v88, (uint64_t)v85, (uint64_t)v84);
      _os_log_impl(&def_46F0, (os_log_t)v76, v75, "install policy: %@, autoInstallOperation: %@", v88, 0x16u);
    }
    objc_storeStrong(&v76, 0);
    [a1[4] setUpdateToInstall:location[0]];
    id v5 = [SUSUISoftwareUpdateAlertModel alloc];
    uint64_t v6 = [(SUSUISoftwareUpdateAlertModel *)v5 initWithDownload:location[0] autoInstallOperation:v84 defaults:*((void *)a1[4] + 17)];
    os_log_type_t v7 = a1[4];
    int v8 = (void *)v7[6];
    v7[6] = v6;

    [*((id *)a1[4] + 6) setDelegate:a1[4]];
    [*((id *)a1[4] + 6) setCurrentInstallationPolicy:v85 forReason:@"Startup; policy associated with download"];
    BOOL v74 = 0;
    BOOL v35 = 0;
    if ([v84 _isEffectivelyScheduled])
    {
      BOOL v34 = 1;
      if ([*((id *)a1[4] + 6) alertFlow] != (char *)&def_46F0 + 3) {
        BOOL v34 = [*((id *)a1[4] + 6) alertFlow] == (char *)&dword_4 + 1;
      }
      BOOL v35 = v34;
    }
    BOOL v74 = v35;
    if (v35) {
      objc_msgSend(a1[4], "_setPasscodePolicyType:", objc_msgSend(a1[4], "getPasscodePolicyForAlertModel:", *((void *)a1[4] + 6)));
    }
    if ([a1[4] _shouldShowOrScheduleInstallAlert])
    {
      id v33 = [*((id *)a1[4] + 6) nextAlertDate];

      if (v33)
      {
        uint64_t v73 = 0;
        id v32 = [*((id *)a1[4] + 6) nextAlertRepopStrategy];
        if (v32) {
          uint64_t v31 = (uint64_t)v32;
        }
        else {
          uint64_t v31 = 1;
        }
        uint64_t v73 = v31;
        os_log_type_t v29 = (id *)a1[4];
        id v30 = [v29[6] nextAlertDate];
        objc_msgSend(v29, "_scheduleInstallAlertReminderWithDate:repopStrategy:forReason:");
      }
      else if (v74)
      {
        id v72 = (id)SUSUILog();
        os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = location[0];
          id v28 = v84;
          unsigned __int8 v9 = [a1[4] _isAutoUpdateEnabled];
          CFStringRef v10 = @"YES";
          if ((v9 & 1) == 0) {
            CFStringRef v10 = @"NO";
          }
          sub_246B0((uint64_t)v87, (uint64_t)v27, (uint64_t)v28, (uint64_t)v10, (uint64_t)[*((id *)a1[4] + 6) alertFlow]);
          _os_log_impl(&def_46F0, (os_log_t)v72, v71, "Automatic install detected at boot time: %@, auto install operation: %@ autoUpdateEnabled: %@ alertFlow:%lu", v87, 0x2Au);
        }
        objc_storeStrong(&v72, 0);
        char v70 = 0;
        char v70 = [*((id *)a1[4] + 2) isInstallationKeybagRequired] & 1;
        if (([a1[4] _isAutoUpdateEnabled] & 1) != 0
          && [*((id *)a1[4] + 6) alertFlow] == (char *)&dword_4 + 1)
        {
          os_log_t oslog = (os_log_t)(id)SUSUILog();
          os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = oslog;
            os_log_type_t v26 = v68;
            sub_5A1C(v67);
            _os_log_impl(&def_46F0, v25, v26, "Auto update flow", v67, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v66 = 0;
          v66 = (char *)[a1[4] getPasscodePolicyForAlertModel:*((void *)a1[4] + 6)];
          if ((v70 & 1) != 0 && v66 != (unsigned char *)&def_46F0 + 2)
          {
            os_log_t v65 = (os_log_t)(id)SUSUILog();
            os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v23 = v65;
              os_log_type_t v24 = v64;
              sub_5A1C(v63);
              _os_log_impl(&def_46F0, v23, v24, "Auto update reinitiated and keybag required, overriding passcode policy to required", v63, 2u);
            }
            objc_storeStrong((id *)&v65, 0);
            v66 = (unsigned char *)(&def_46F0 + 2);
          }
          [a1[4] _setupAutoUpdate:v84 withPasscodePolicy:v66];
        }
        else
        {
          if (v70)
          {
            os_log_t v62 = (os_log_t)(id)SUSUILog();
            os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              char v21 = v62;
              os_log_type_t v22 = v61;
              sub_5A1C(v60);
              _os_log_impl(&def_46F0, v21, v22, "Keybag lost after reboot. Set passcode policy to required", v60, 2u);
            }
            objc_storeStrong((id *)&v62, 0);
            [a1[4] _setPasscodePolicyType:2];
          }
          os_log_t v59 = (os_log_t)(id)SUSUILog();
          os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = v59;
            os_log_type_t v20 = v58;
            sub_5A1C(v57);
            _os_log_impl(&def_46F0, v19, v20, "Not scheduling install alert because we're waiting for the SU install notification to come in.", v57, 2u);
          }
          objc_storeStrong((id *)&v59, 0);
          [a1[4] _setTryTonightAutoInstallOperation:v84 cancelIfNecessary:1];
        }
      }
      else if ([a1[4] _isAutoUpdateEnabled])
      {
        id v18 = (void *)*((void *)a1[4] + 2);
        v51 = _NSConcreteStackBlock;
        int v52 = -1073741824;
        int v53 = 0;
        dispatch_time_t v54 = sub_2472C;
        v55 = &unk_600A8;
        id v56 = a1[4];
        [v18 currentAutoInstallOperation:1 withResult:&v51];
        objc_storeStrong(&v56, 0);
      }
      else if ([*((id *)a1[4] + 6) nextAlertRepopStrategy] == (char *)&dword_4 + 3)
      {
        [a1[4] _realertWithStrategy:7 andReason:@"Scheduling next install alert for next unlock."];
      }
      else
      {
        os_log_t v50 = (os_log_t)(id)SUSUILog();
        os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v50;
          os_log_type_t v17 = v49;
          sub_5A1C(v48);
          _os_log_impl(&def_46F0, v16, v17, "Showing the install alert if possible", v48, 2u);
        }
        objc_storeStrong((id *)&v50, 0);
        [a1[4] _showOrScheduleNextInstallAlert];
      }
    }
  }
  else
  {
    os_log_t v47 = (os_log_t)(id)SUSUILog();
    os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v47;
      os_log_type_t v15 = v46;
      sub_5A1C(v45);
      _os_log_impl(&def_46F0, v14, v15, "No download found at startup.", v45, 2u);
    }
    objc_storeStrong((id *)&v47, 0);
    uint64_t v11 = [[SUSUISoftwareUpdateAlertModel alloc] initWithDefaults:*((void *)a1[4] + 17)];
    id v12 = a1[4];
    id v13 = (void *)v12[6];
    v12[6] = v11;

    [*((id *)a1[4] + 6) setDelegate:a1[4]];
    [*((id *)a1[4] + 6) resetTransientDownloadState];
  }
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_24660(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_246B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_2472C(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (!location[0] || v7)
  {
    v6[0] = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        CFStringRef v3 = (const __CFString *)v7;
      }
      else {
        CFStringRef v3 = @"nil";
      }
      sub_548C((uint64_t)v9, (uint64_t)v3);
      _os_log_impl(&def_46F0, (os_log_t)v6[0], OS_LOG_TYPE_DEFAULT, "Error creating autoInstallOperation: %@", v9, 0xCu);
    }
    objc_storeStrong(v6, 0);
    [a1[4] _showOrScheduleNextInstallAlert];
  }
  else
  {
    [a1[4] _setupAutoUpdate:location[0] withPasscodePolicy:1];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

id sub_24AA0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "recordSUAnalyticsEvent:", *(void *)(a1 + 40), a1, a1);
}

id sub_24BE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "submitSUAnalyticsEvent:", *(void *)(a1 + 40), a1, a1);
}

void sub_24D14(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

void sub_252F4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] installTonightWithOperation:location[0] options:0];
  objc_storeStrong(location, 0);
}

void sub_25B64(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  CFStringRef v3 = (id *)(a1 + 40);
  *CFStringRef v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void sub_25BBC(uint64_t a1)
{
}

void sub_25BEC(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), location[0]);
  if (*(void *)(a1 + 32)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void sub_25DE8(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  v9[1] = a1;
  if (location[0])
  {
    v9[0] = (id)SUSUILog();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v13, (uint64_t)location[0]);
      _os_log_impl(&def_46F0, (os_log_t)v9[0], v8, "Got new auto install forecast: (%@)", v13, 0xCu);
    }
    objc_storeStrong(v9, 0);
  }
  else
  {
    id v7 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v12, (uint64_t)v10);
      _os_log_impl(&def_46F0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Failed getting auto install forecast: %{public}@", v12, 0xCu);
    }
    objc_storeStrong(&v7, 0);
  }
  CFStringRef v3 = (void (**)(void))(a1[4] + 16);
  id v4 = [location[0] copy];
  (*v3)();

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void sub_260E0(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  v7[1] = a1;
  if (location[0])
  {
    v7[0] = (id)SUSUILog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v11, (uint64_t)location[0]);
      _os_log_impl(&def_46F0, (os_log_t)v7[0], v6, "Got new auto install operation: (%p)", v11, 0xCu);
    }
    objc_storeStrong(v7, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v10, (uint64_t)v8);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Failed to create auto install operation: %{public}@", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

id *sub_26804(id *result)
{
  char v1 = result;
  if (result[4] == *((id *)result[5] + 12))
  {
    if ((*((unsigned char *)result[5] + 57) & 1) != 0 && ([result[4] isUILocked] & 1) == 0) {
      [v1[5] _realertWithStrategy:3 andReason:@"UI unlocked"];
    }
    return (id *)objc_msgSend(*((id *)v1[5] + 10), "updateAllAlertLockState:", (unint64_t)objc_msgSend(v1[4], "isUILocked") & 1);
  }
  return result;
}

void sub_269D4(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 88))
  {
    char v16 = 0;
    char v16 = [*(id *)(a1 + 32) isHomeScreenForeground] & 1;
    if (*(unsigned char *)(*(void *)(a1 + 40) + 56) & 1) != 0 && (v16) {
      [*(id *)(a1 + 40) _realertWithStrategy:3 andReason:@"Homescreen activated"];
    }
    if (v16)
    {
      dispatch_queue_t queue = *(NSObject **)(*(void *)(a1 + 40) + 232);
      id v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      id v13 = sub_26BE4;
      id v14 = &unk_5CC30;
      id v15 = *(id *)(a1 + 40);
      dispatch_async(queue, &v10);
      objc_storeStrong(&v15, 0);
    }
    if (v16 & 1) != 0 || ([*(id *)(a1 + 40) settingsForeground])
    {
      char v1 = *(NSObject **)(*(void *)(a1 + 40) + 232);
      id v4 = _NSConcreteStackBlock;
      int v5 = -1073741824;
      int v6 = 0;
      id v7 = sub_26F20;
      id v8 = &unk_5CC30;
      id v9 = *(id *)(a1 + 40);
      dispatch_async(v1, &v4);
      objc_storeStrong(&v9, 0);
    }
  }
}

id sub_26BE4(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v23 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(*(void *)(a1 + 32) + 216) allKeys];
  id v11 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v7);
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v4 = type;
        sub_548C((uint64_t)v25, v22);
        _os_log_impl(&def_46F0, log, v4, "Running homescreen block %@", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v18 = [*(id *)(*(void *)(a1 + 32) + 216) objectForKey:v22];
      dispatch_queue_t queue = *(NSObject **)(*(void *)(a1 + 32) + 24);
      int v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = sub_26EE4;
      char v16 = &unk_601C0;
      id v17 = v18;
      dispatch_async(queue, &v12);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0;
        id v8 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  return [*(id *)(*(void *)(a1 + 32) + 216) removeAllObjects];
}

uint64_t sub_26EE4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

id sub_26F20(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v23 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(*(void *)(a1 + 32) + 224) allKeys];
  id v11 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v7);
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v4 = type;
        sub_548C((uint64_t)v25, v22);
        _os_log_impl(&def_46F0, log, v4, "Running homescreenOrSettings block %@", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v18 = [*(id *)(*(void *)(a1 + 32) + 224) objectForKey:v22];
      dispatch_queue_t queue = *(NSObject **)(*(void *)(a1 + 32) + 24);
      int v12 = _NSConcreteStackBlock;
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = sub_27220;
      char v16 = &unk_601C0;
      id v17 = v18;
      dispatch_async(queue, &v12);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0;
        id v8 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  return [*(id *)(*(void *)(a1 + 32) + 224) removeAllObjects];
}

uint64_t sub_27220(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

uint64_t sub_2746C(uint64_t a1, uint64_t a2)
{
  return a1 & ~a2;
}

void sub_28044(uint64_t a1)
{
  id v9[2] = (id)a1;
  v9[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
  CFStringRef v3 = [SUSUISoftwareUpdateDownloadFailedAlertItem alloc];
  id v4 = [*(id *)(a1 + 40) descriptor];
  v9[0] = -[SUSUISoftwareUpdateDownloadFailedAlertItem initWithDescriptor:softwareUpdateController:fromSettings:](v3, "initWithDescriptor:softwareUpdateController:fromSettings:", v4, *(void *)(a1 + 32), (unint64_t)[*(id *)(a1 + 32) settingsForeground] & 1);

  [v9[0] setError:*(void *)(a1 + 48)];
  id location = (id)SUSUILog();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = location;
    os_log_type_t type = v7;
    sub_5A1C(v6);
    _os_log_impl(&def_46F0, log, type, "Presenting download failure alert", v6, 2u);
  }
  objc_storeStrong(&location, 0);
  [*(id *)(*(void *)(a1 + 32) + 80) presentAlert:v9[0] animated:1];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 184) & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 88) removeObserver:*(void *)(a1 + 32)];
  }
  objc_storeStrong(v9, 0);
}

void sub_281E4(uint64_t a1)
{
  char v1 = *(void **)(*(void *)(a1 + 32) + 224);
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  objc_msgSend(v1, "setObject:forKey:");
}

void sub_28664(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a1;
  uint64_t v38 = a2;
  location[1] = (id)a1;
  if ((a2 & 0x8000000) != 0)
  {
    location[0] = (id)SUSUILog();
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      sub_1A68C((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController client:downloadDidFinish:withInstallPolicy:]_block_invoke");
      _os_log_error_impl(&def_46F0, (os_log_t)location[0], v36, "%s: update is no longer installable...", v42, 0xCu);
    }
    objc_storeStrong(location, 0);
    id v11 = *(void **)(a1 + 32);
    id v12 = [v11 _stringForInstallNotAllowableReason:0x8000000];
    objc_msgSend(v11, "_resetStateForReason:");
  }
  else
  {
    [*(id *)(a1 + 32) setUpdateToInstall:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setInstallPolicy:*(void *)(a1 + 48)];
    BOOL v35 = (v38 & 0x2000000) == 0x2000000;
    if ((v38 & 0x2000000) == 0x2000000)
    {
      id v34 = (id)SUSUILog();
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v41, (uint64_t)"-[SUSUISoftwareUpdateController client:downloadDidFinish:withInstallPolicy:]_block_invoke");
        _os_log_impl(&def_46F0, (os_log_t)v34, v33, "%s: installation is in progress", v41, 0xCu);
      }
      objc_storeStrong(&v34, 0);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 48) setCurrentInstallationPolicy:*(void *)(a1 + 48) forReason:@"Download finished; policy associated with download"];
      [*(id *)(*(void *)(a1 + 32) + 48) didFinishDownloading:*(void *)(a1 + 40)];
      id v32 = 0;
      id v32 = (char *)[*(id *)(*(void *)(a1 + 32) + 48) alertFlow];
      id v31 = (id)SUSUILog();
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v31;
        os_log_type_t v9 = v30;
        id v10 = SUSUIStringForInstallAlertFlow((uint64_t)v32);
        os_log_type_t v29 = v10;
        sub_548C((uint64_t)v40, (uint64_t)v29);
        _os_log_impl(&def_46F0, v8, v9, "downloadDidFinish: current alertflow = %@", v40, 0xCu);

        objc_storeStrong((id *)&v29, 0);
      }
      objc_storeStrong(&v31, 0);
      if (v32 == (unsigned char *)&def_46F0 + 2)
      {
        [*(id *)(a1 + 32) _showNextInstallAlertWithReasons:v38 orScheduleIfNecessary:1];
      }
      else if (v32 == (unsigned char *)&dword_4 + 1)
      {
        os_log_type_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v23 = _NSConcreteStackBlock;
        int v24 = -1073741824;
        int v25 = 0;
        os_log_type_t v26 = sub_28C38;
        id v27 = &unk_600A8;
        id v28 = *(id *)(a1 + 32);
        [v7 currentAutoInstallOperation:1 withResult:&v23];
        objc_storeStrong(&v28, 0);
      }
      else if (v32 == (unsigned char *)&def_46F0 + 3)
      {
        uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
        id v17 = _NSConcreteStackBlock;
        int v18 = -1073741824;
        int v19 = 0;
        os_log_type_t v20 = sub_28CC4;
        char v21 = &unk_600A8;
        id v22 = *(id *)(a1 + 32);
        [v6 currentAutoInstallOperation:0 withResult:&v17];
        objc_storeStrong(&v22, 0);
      }
      else
      {
        [*(id *)(a1 + 32) _realertWithStrategy:1 andReason:@"Download completed successfully."];
      }
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = oslog;
        os_log_type_t v5 = v15;
        sub_5A1C(v14);
        _os_log_impl(&def_46F0, v4, v5, "[Settings Badge] Download complete... badging settings", v14, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v2 = *(void **)(a1 + 32);
      id v3 = [*(id *)(a1 + 40) descriptor];
      objc_msgSend(v2, "toggleSettingsBadge:update:", 1);
    }
  }
}

void sub_28C38(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  [a1[4] _setupAutoUpdate:location[0] withPasscodePolicy:1];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void sub_28CC4(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  if ([location[0] _isEffectivelyScheduled]) {
    [a1[4] _doInstallTonight:location[0] consent:1];
  }
  else {
    [a1[4] _realertWithStrategy:1 andReason:@"Download completed successfully."];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void sub_29E7C(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  v11[1] = a1;
  if (!location[0] || v12)
  {
    id v8 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        CFStringRef v3 = (const __CFString *)v12;
      }
      else {
        CFStringRef v3 = @"nil";
      }
      sub_548C((uint64_t)v14, (uint64_t)v3);
      _os_log_impl(&def_46F0, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Error creating autoInstallOperation: %@", v14, 0xCu);
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v11[0] = (id)SUSUILog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v11[0];
      os_log_type_t type = v10;
      sub_5A1C(v9);
      _os_log_impl(&def_46F0, log, type, "Setting up auto update for downloaded update", v9, 2u);
    }
    objc_storeStrong(v11, 0);
    [a1[4] _setupAutoUpdate:location[0] withPasscodePolicy:1];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void sub_2A1E4(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  v11[1] = a1;
  if (!location[0] || v12)
  {
    id v8 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        CFStringRef v3 = (const __CFString *)v12;
      }
      else {
        CFStringRef v3 = @"nil";
      }
      sub_548C((uint64_t)v14, (uint64_t)v3);
      _os_log_impl(&def_46F0, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Error creating autoInstallOperation: %@", v14, 0xCu);
    }
    objc_storeStrong(&v8, 0);
    [a1[4] _realertWithStrategy:6 andReason:@"Managed Install request received"];
  }
  else
  {
    v11[0] = (id)SUSUILog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v11[0];
      os_log_type_t type = v10;
      sub_5A1C(v9);
      _os_log_impl(&def_46F0, log, type, "Setting up auto update for managed install request", v9, 2u);
    }
    objc_storeStrong(v11, 0);
    [a1[4] _setupAutoUpdate:location[0] withPasscodePolicy:2];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_2A844(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_2A8B4(uint64_t a1, char a2, id obj)
{
  uint64_t v10 = a1;
  char v9 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v7[1] = (id)a1;
  if (*(unsigned char *)(a1 + 48) & 1) == 0 || (v9)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateController client:presentingRecommendedUpdate:shouldPresent:]_block_invoke");
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: Not showing recommended update UI due to update still downloading", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(*(void *)(a1 + 40) + 80) dismissAlertsOfClass:objc_opt_class() animated:1];
  }
  else
  {
    v7[0] = (id)SUSUILog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateController client:presentingRecommendedUpdate:shouldPresent:]_block_invoke");
      _os_log_impl(&def_46F0, (os_log_t)v7[0], v6, "%s: Showing recommended update UI", v12, 0xCu);
    }
    objc_storeStrong(v7, 0);
    id v5 = [[SUSUISoftwareUpdateRecommendedAvailableAlertItem alloc] initWithDescriptor:*(void *)(a1 + 32) softwareUpdateController:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 40) + 80) presentAlert:v5 animated:1];
    objc_storeStrong((id *)&v5, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_2AD34(NSObject *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (!location[0] || v6)
  {
    oslog[0] = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_4BF8((uint64_t)v8, (uint64_t)location[0], (uint64_t)v6);
      _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "Failed to get the auto install operation %@, error %@", v8, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    [(objc_class *)a1[4].isa _doInstallTonight:location[0] consent:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_2BAB8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_2C12C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v6 = a1;
  char v5 = 0;
  char v5 = [*(id *)(a1 + 32) _showNextInstallAlertWithReasons:a2 orScheduleIfNecessary:0 withInstallOptions:*(void *)(a1 + 40)] & 1;
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v2 = @"YES";
    }
    else {
      CFStringRef v2 = @"NO";
    }
    sub_24660((uint64_t)v9, *(void *)(a1 + 48), (uint64_t)v2);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Auto install operation (%p) is ready to install, and attempting: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*(void *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2CAA4(id a1)
{
}

void sub_2CB74(id a1)
{
}

void sub_2DDE4(NSObject *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (v6)
  {
    oslog[0] = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v8, (uint64_t)v6);
      _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "Error creating auto install operation: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  if (location[0]) {
    [(objc_class *)a1[4].isa _setupAutoUpdate:location[0] withPasscodePolicy:a1[5].isa];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

id sub_2E544(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissInstallAlertsWithReason:@"Install authentication succeeded." includingInstallTonight:1 withRealertStrategy:0];
  [*(id *)(a1 + 32) _dismissInstallFailureAlertsWithoutRepop];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 && (unint64_t)(v3 - 1) <= 1) {
    return [*(id *)(a1 + 32) _doInstallTonight:*(void *)(a1 + 48) consent:1];
  }
  else {
    return [*(id *)(a1 + 32) _doInstallNowWithOptions:*(void *)(a1 + 40)];
  }
}

uint64_t sub_2E610(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(unsigned char *)(result + 14) = 64;
  *(unsigned char *)(result + 15) = 8;
  *(void *)(result + 16) = a4;
  return result;
}

uint64_t sub_2E67C(uint64_t a1, char a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) rescheduleIfAuthFails];
  if (result) {
    return (uint64_t)[*(id *)(a1 + 40) _realertWithStrategy:1 andReason:@"Rescheduling on installation authentication failure because asked to via install options."];
  }
  return result;
}

void sub_2E8CC(uint64_t a1, char a2, id obj)
{
  uint64_t v9 = a1;
  char v8 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = (os_log_t)a1;
  if (v8)
  {
    os_log_t v4 = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v10, *(void *)(a1 + 32));
      _os_log_impl(&def_46F0, v4, OS_LOG_TYPE_DEFAULT, "Installation starting: options = %@", v10, 0xCu);
    }
    objc_storeStrong((id *)&v4, 0);
    [*(id *)(a1 + 40) _setPendingInstallOptions:*(void *)(a1 + 32)];
  }
  else
  {
    oslog[0] = (os_log_t)(id)SUSUILog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v11, (uint64_t)location);
      _os_log_impl(&def_46F0, oslog[0], type, "Unable to start the software update installation.  Something went wrong: %@", v11, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_2ECC4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = (id)a1;
  if (location[0])
  {
    if ([location[0] isExpired])
    {
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_16030((uint64_t)v10, (uint64_t)location[0]);
        _os_log_impl(&def_46F0, oslog, v4, "A software update 'try tonight' auto install operation (%p) was attempted to be scheduled, but it was already expired.", v10, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [*(id *)(a1 + 32) _autoInstallOperationDidExpire:location[0] withRepopStrategy:1 error:0];
    }
    else if ([location[0] isCanceled])
    {
      os_log_t v3 = (os_log_t)(id)SUSUILog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        sub_16030((uint64_t)v9, (uint64_t)location[0]);
        _os_log_impl(&def_46F0, v3, OS_LOG_TYPE_DEFAULT, "A software update 'try tonight' auto install operation (%p) was attempted to be scheduled, but it was already cancelled.", v9, 0xCu);
      }
      objc_storeStrong((id *)&v3, 0);
      [*(id *)(a1 + 32) _autoInstallOperationWasCancelled:location[0] withRepopStrategy:1];
    }
    else
    {
      [*(id *)(a1 + 32) _setTryTonightAutoInstallOperation:location[0] cancelIfNecessary:1];
      if (*(unsigned char *)(a1 + 40)) {
        [*(id *)(*(void *)(a1 + 32) + 40) setAgreementStatus:1];
      }
    }
  }
  else
  {
    v7[0] = (id)SUSUILog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v11, (uint64_t)location[0]);
      _os_log_impl(&def_46F0, (os_log_t)v7[0], v6, "A software update 'try tonight' auto install operation (%p) was attempted to be scheduled, but it was nil.", v11, 0xCu);
    }
    objc_storeStrong(v7, 0);
    [*(id *)(a1 + 32) _autoInstallOperationDidExpire:location[0] withRepopStrategy:1 error:0];
  }
  objc_storeStrong(location, 0);
}

uint64_t sub_2F41C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_30364(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t sub_30A54(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

void sub_31674(uint64_t a1, void *a2, void *a3, id obj)
{
  uint64_t v16 = a1;
  os_log_type_t v15 = a2;
  int v14 = a3;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v12[3] = (id)a1;
  dispatch_queue_t queue = *(NSObject **)(*(void *)(a1 + 32) + 24);
  os_log_type_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = sub_31794;
  uint64_t v10 = &unk_60368;
  v12[1] = v15;
  v12[2] = v14;
  id v11 = location;
  objc_copyWeak(v12, (id *)(a1 + 40));
  dispatch_async(queue, &v6);
  objc_destroyWeak(v12);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void sub_31794(uint64_t a1)
{
  id v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = (id)SUSUILog();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v11[0];
    os_log_type_t type = v10;
    id v6 = (id)SUStringFromInstallationConstraints();
    id v2 = v6;
    id v9 = v2;
    id v5 = (id)SUStringFromInstallationConstraints();
    id v8 = v5;
    sub_58EC((uint64_t)v12, (uint64_t)v2, (uint64_t)v8, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, log, type, "Installation constraints did change - unsatisfied constraints: %@, changed constraints: %@, error: %@", v12, 0x20u);

    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _installationConstraintsDidChange:*(void *)(a1 + 48) changed:*(void *)(a1 + 56) error:*(void *)(a1 + 32)];
}

id sub_31C00(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _showNextInstallAlertWithReasons:a2 orScheduleIfNecessary:1];
}

uint64_t sub_324C4(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t sub_32900(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_3297C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

void sub_32BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v21 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_32C04(void *a1, char a2, id obj)
{
  id v27 = a1;
  char v26 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  int v24 = a1;
  char v22 = 0;
  unsigned __int8 v14 = 0;
  if ((v26 & 1) == 0)
  {
    unsigned __int8 v14 = 0;
    if (location)
    {
      id v23 = [location domain];
      char v22 = 1;
      unsigned __int8 v14 = [v23 isEqualToString:SUErrorDomain];
    }
  }
  if (v22) {

  }
  if (v14)
  {
    os_log_t v3 = (char *)[location code];
    if ((unint64_t)v3 <= 3)
    {
      id v5 = v3 - 3;
      char v4 = 0;
    }
    else
    {
      id v5 = v3 - 3;
      char v4 = 1;
    }
    if ((v4 & 1) == 0)
    {
      switch((unint64_t)v5)
      {
        case 0uLL:
        case 8uLL:
        case 0xFuLL:
          *(void *)(*(void *)(a1[6] + 8) + 24) |= 0x8000000uLL;
          break;
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 9uLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0x10uLL:
          break;
        case 0xAuLL:
          *(void *)(*(void *)(a1[6] + 8) + 24) |= 0x4000000uLL;
          break;
        case 0xBuLL:
          *(void *)(*(void *)(a1[6] + 8) + 24) |= 0x2000000uLL;
          break;
        case 0x11uLL:
          id v12 = [location userInfo];
          id v11 = [v12 objectForKey:kSUInstallationConstraintsUnmetKey];
          *(void *)(*(void *)(a1[6] + 8) + 24) |= (unint64_t)[v11 unsignedIntegerValue];

          if ((*(void *)(*(void *)(a1[6] + 8) + 24) & 0x20) == 0x20
            && ([*(id *)(a1[4] + 104) isPasscodeLocked] & 1) == 0)
          {
            id v21 = (id)SUSUILog();
            os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
            {
              log = v21;
              os_log_type_t type = v20;
              sub_5A1C(v19);
              _os_log_impl(&def_46F0, log, type, "[SoftwareUpdate] We were passcode locked, but now we're not. Reverting the passcode locked constraint.", v19, 2u);
            }
            objc_storeStrong(&v21, 0);
            *(void *)(*(void *)(a1[6] + 8) + 24) &= ~0x20uLL;
          }
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  BOOL v18 = 0;
  BOOL v18 = *(void *)(*(void *)(a1[6] + 8) + 24) == 0;
  id v17 = 0;
  int v7 = (void *)a1[4];
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 24);
  id v8 = [v7 _allNonInstallableReasons];
  id v16 = v17;
  objc_msgSend(v7, "_doesStateContainNonInstallableReasons:reasonsToCheck:outMatchingReasonsString:", v6);
  objc_storeStrong(&v17, v16);

  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_330E8((uint64_t)v28, v18, (uint64_t)v17);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "SU is installable now? %d; reasons: %@", v28, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (a1[5]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_330E8(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 64;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void sub_33924(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v32[1] = (id)a1;
  v32[0] = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) alertFlow];
  if (v2)
  {
    id v4 = v2;
    char v3 = 1;
  }
  else
  {
    id v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch((unint64_t)v4)
    {
      case 0uLL:
        break;
      case 1uLL:
        id v5 = [SUSUISoftwareUpdateInstallAlertItem alloc];
        uint64_t v6 = [(SUSUISoftwareUpdateInstallAlertItem *)v5 initWithDownload:*(void *)(*(void *)(a1 + 32) + 32) style:1 softwareUpdateController:*(void *)(a1 + 32) tryTonightInstallOperationForecast:location[0] installOptions:*(void *)(a1 + 40)];
        id v7 = v32[0];
        v32[0] = v6;

        break;
      case 2uLL:
        char v22 = +[SUSUIPreferences sharedInstance];
        char v23 = 0;
        if ([(SUSUIPreferences *)v22 preventCountdownAlert]) {
          char v23 = _BSIsInternalInstall();
        }

        if (v23)
        {
          id v31 = (id)SUSUILog();
          os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
          {
            log = v31;
            os_log_type_t type = v30;
            sub_5A1C(v29);
            _os_log_impl(&def_46F0, log, type, "User setting prevented presentation of SU installation countdown alert", v29, 2u);
          }
          objc_storeStrong(&v31, 0);
        }
        else
        {
          id v8 = [SUSUISoftwareUpdateInstallAlertItem alloc];
          id v9 = [(SUSUISoftwareUpdateInstallAlertItem *)v8 initWithDownload:*(void *)(*(void *)(a1 + 32) + 32) style:2 softwareUpdateController:*(void *)(a1 + 32) tryTonightInstallOperationForecast:location[0] installOptions:*(void *)(a1 + 40)];
          id v10 = v32[0];
          v32[0] = v9;
        }
        break;
      case 3uLL:
        id v11 = [[SUSUISoftwareUpdateInstallAlertItem alloc] initWithDownload:*(void *)(*(void *)(a1 + 32) + 32) style:2 softwareUpdateController:*(void *)(a1 + 32) tryTonightInstallOperationForecast:0 installOptions:*(void *)(a1 + 40)];
        id v12 = v32[0];
        v32[0] = v11;

        break;
      case 4uLL:
        int v13 = [SUSUISoftwareUpdateInstallAlertItem alloc];
        unsigned __int8 v14 = [(SUSUISoftwareUpdateInstallAlertItem *)v13 initWithDownload:*(void *)(*(void *)(a1 + 32) + 32) style:3 softwareUpdateController:*(void *)(a1 + 32) tryTonightInstallOperationForecast:location[0] installOptions:*(void *)(a1 + 40)];
        id v15 = v32[0];
        v32[0] = v14;

        break;
      case 5uLL:
        id v28 = (id)SUSUILog();
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v18 = v28;
          os_log_type_t v19 = v27;
          sub_5A1C(v26);
          _os_log_impl(&def_46F0, v18, v19, "Showing countdown alert", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        id v16 = [[SUSUISoftwareUpdateInstallAlertItem alloc] initWithDownload:*(void *)(*(void *)(a1 + 32) + 32) style:2 softwareUpdateController:*(void *)(a1 + 32) tryTonightInstallOperationForecast:0 installOptions:*(void *)(a1 + 40)];
        id v17 = v32[0];
        v32[0] = v16;

        break;
      default:
        JUMPOUT(0);
    }
  }
  if (v32[0])
  {
    id v25 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_8A10((uint64_t)v34, (uint64_t)v32[0], (uint64_t)location[0]);
      _os_log_impl(&def_46F0, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "[Install Alert] Presenting %{public}@ with auto install operation forecast: %{public}@", v34, 0x16u);
    }
    objc_storeStrong(&v25, 0);
    [*(id *)(*(void *)(a1 + 32) + 80) presentAlert:v32[0] animated:1];
    [*(id *)(*(void *)(a1 + 32) + 208) notifyAlertWasPresented];
    [*(id *)(a1 + 32) _registerForInstallationConstraintChangedNotifications];
  }
  objc_storeStrong(v32, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_3429C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id sub_35044(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) removeObjectForKey:@"Update-Available"];
}

id sub_35494(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 32) _showSUAvailableAlertForDescriptor:*(void *)(a1 + 40)];
  location[0] = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "[Settings Badge] Badging settings because Auto download unknown to user failed to download", v5, 2u);
  }
  objc_storeStrong(location, 0);
  id result = [*(id *)(a1 + 32) toggleSettingsBadge:1 update:*(void *)(a1 + 40)];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 184) & 1) == 0) {
    return [*(id *)(*(void *)(a1 + 32) + 88) removeObserver:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_355AC(uint64_t a1)
{
  char v1 = *(void **)(*(void *)(a1 + 32) + 216);
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  objc_msgSend(v1, "setObject:forKey:");
}

void sub_358A8(uint64_t a1, char a2)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v2 = @"YES";
    }
    else {
      CFStringRef v2 = @"NO";
    }
    sub_330E8((uint64_t)v7, *(unsigned char *)(a1 + 40) & 1, (uint64_t)v2);
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[Install Alert] Authentication success for tonight (%d)? %@", v7, 0x12u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_35FFC(id a1, BOOL a2, NSError *a3)
{
  id v8 = a1;
  BOOL v7 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v3 = @"Success";
    }
    else {
      CFStringRef v3 = @"Failure";
    }
    sub_4BF8((uint64_t)v9, (uint64_t)v3, (uint64_t)location);
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[Rollback] Purge result: %@ Error: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_367A0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_36B2C(uint64_t a1)
{
  v5[2] = (id)a1;
  v5[1] = (id)a1;
  [*(id *)(a1 + 32) _rebootQuiet];
  v5[0] = objc_alloc_init((Class)FBSSystemService);
  id v1 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"OTA Software Update"];
  id v4 = v1;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  [v1 setRebootType:v2];
  [v5[0] shutdownWithOptions:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

id sub_37180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_badgingQueue_savePreferencesBadgeEnabled:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

void sub_372E8(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    if ((*(unsigned char *)(a1 + 48) & 1) == 1) {
      id v1 = "BADGE";
    }
    else {
      id v1 = "UNBADGE";
    }
    sub_1A68C((uint64_t)v46, (uint64_t)v1);
    _os_log_impl(&def_46F0, (os_log_t)location[0], v44, "[Settings Badge] Running on async queue to %s settings for software update", v46, 0xCu);
  }
  objc_storeStrong(location, 0);
  if (!*(void *)(*(void *)(a1 + 32) + 240))
  {
    id v2 = +[SUSFollowUpController sharedController];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 240);
    *(void *)(v3 + 240) = v2;
  }
  char v43 = 0;
  char v43 = objc_msgSend(*(id *)(a1 + 32), "_badgingQueue_isBadgedForSoftwareUpdate") & 1;
  if (v43)
  {
    id v42 = (id)SUSUILog();
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = v42;
      os_log_type_t v19 = v41;
      sub_5A1C(v40);
      _os_log_impl(&def_46F0, v18, v19, "[Settings Badge]: Currently badged with legacy mechanism. Switching to new flow. Toggling badge ON via CFU", v40, 2u);
    }
    objc_storeStrong(&v42, 0);
    [*(id *)(*(void *)(a1 + 32) + 240) postFollowUpOfType:0 withUpdate:*(void *)(a1 + 40) userInfo:0];
    id v39 = (id)SUSUILog();
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v39;
      os_log_type_t v17 = v38;
      sub_5A1C(v37);
      _os_log_impl(&def_46F0, v16, v17, "[Settings Badge]: Toggling badge OFF via followup", v37, 2u);
    }
    objc_storeStrong(&v39, 0);
    [*(id *)(*(void *)(a1 + 32) + 240) dismissFollowUpType:0];
    objc_msgSend(*(id *)(a1 + 32), "_badgingQueue_savePreferencesBadgeEnabled:", 0);
    id v36 = (id)SUSUILog();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v14 = v36;
      os_log_type_t v15 = v35;
      sub_5A1C(v34);
      _os_log_impl(&def_46F0, v14, v15, "[Settings Badge]: Legacy badging mechanism is now disabled. Switch to new flow complete", v34, 2u);
    }
    objc_storeStrong(&v36, 0);
  }
  id v33 = +[UMUserManager sharedManager];
  char v5 = *(unsigned char *)(a1 + 48);
  char v31 = 0;
  BOOL v13 = 0;
  if (v5)
  {
    BOOL v12 = 0;
    if ([v33 isMultiUser])
    {
      id v32 = [v33 currentUser];
      char v31 = 1;
      BOOL v12 = [v32 userType] == (char *)&def_46F0 + 1;
    }
    BOOL v13 = v12;
  }
  if (v31) {

  }
  if (v13)
  {
    id v30 = (id)SUSUILog();
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v30;
      os_log_type_t v11 = v29;
      sub_5A1C(v28);
      _os_log_impl(&def_46F0, v10, v11, "[Settings Badge] Disallowing enabling of the SU badge in EDU Multi-User.", v28, 2u);
    }
    objc_storeStrong(&v30, 0);
    int v27 = 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v26 = (id)SUSUILog();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v26;
        os_log_type_t v9 = v25;
        sub_5A1C(v24);
        _os_log_impl(&def_46F0, v8, v9, "[Settings Badge] Asking SUSFollowUpController to badge settings", v24, 2u);
      }
      objc_storeStrong(&v26, 0);
      [*(id *)(*(void *)(a1 + 32) + 240) postFollowUpOfType:0 withUpdate:*(void *)(a1 + 40) userInfo:0];
    }
    else
    {
      id v23 = (id)SUSUILog();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = v23;
        os_log_type_t v7 = v22;
        sub_5A1C(v21);
        _os_log_impl(&def_46F0, v6, v7, "[Settings Badge] Asking SUSFollowUpController to unbadge settings", v21, 2u);
      }
      objc_storeStrong(&v23, 0);
      [*(id *)(*(void *)(a1 + 32) + 240) dismissFollowUpType:0];
    }
    int v27 = 0;
  }
  objc_storeStrong(&v33, 0);
}

id sub_379D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_badgingQueue_badgeSettingsWithValue:", *(void *)(a1 + 40), a1, a1);
}

void sub_38964(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v11, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v9, "[%{public}@] Opens the Software Update pane to install recommended update", v11, 0xCu);
  }
  objc_storeStrong(location, 0);
  id v1 = objc_alloc((Class)SUAnalyticsEvent);
  id v8 = [v1 initWithEventName:kSUAnalyticsUsageEventName];
  [v8 setEventPayloadEntry:kSUAnalyticsUserInteractionType stringValue:kSURecommendedAvailableAlertLearnMoreTapped];
  id v2 = [*(id *)(a1 + 40) softwareUpdateController];
  [v2 submitSUAnalyticsEvent:v8];

  uint64_t v3 = [SUSUIFullScreenScheduleUpdateAlert alloc];
  id v4 = [*(id *)(a1 + 40) descriptor];
  os_log_type_t v7 = -[SUSUIFullScreenScheduleUpdateAlert initWithDescriptor:completionBlock:](v3, "initWithDescriptor:completionBlock:");

  id v5 = [*(id *)(a1 + 40) softwareUpdateController];
  [v5 presentFullScreenAlert:v7 completion:0];

  [*(id *)(a1 + 40) dismissAlert];
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&v8, 0);
}

id sub_38B80()
{
  predicate = (dispatch_once_t *)&unk_70468;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_607A0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70460;

  return v0;
}

void sub_38C0C(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70460;
  qword_70460 = (uint64_t)v1;
}

void sub_39094(uint64_t a1)
{
  v39[2] = (id)a1;
  v39[1] = (id)a1;
  v39[0] = *(id *)(*(void *)(a1 + 32) + 16);
  CFOptionFlags responseFlags = 0;
  SInt32 v37 = 0;
  SInt32 v37 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 24), 0.0, &responseFlags);
  if (v37)
  {
    id location = (id)SUSUILog();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v43, v37);
      _os_log_impl(&def_46F0, (os_log_t)location, v35, "failed to get response from CFUserNotification: %ld", v43, 0xCu);
    }
    objc_storeStrong(&location, 0);
    int v34 = 1;
  }
  else if ((responseFlags & 3) == 3)
  {
    id v33 = (id)SUSUILog();
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v42, *(void *)(*(void *)(a1 + 32) + 8));
      _os_log_impl(&def_46F0, (os_log_t)v33, v32, "notification was canceled (alert = %@)", v42, 0xCu);
    }
    objc_storeStrong(&v33, 0);
    int v34 = 1;
  }
  else
  {
    id v31 = CFUserNotificationGetResponseDictionary(*(CFUserNotificationRef *)(*(void *)(a1 + 32) + 24));
    if (v31)
    {
      id v28 = [v31 objectForKeyedSubscript:SBSUserNotificationButtonDefinitionResponseIndexKey];
      if (v28)
      {
        id v24 = (id)SUSUILog();
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          sub_16030((uint64_t)v40, (uint64_t)[v28 unsignedIntegerValue]);
          _os_log_impl(&def_46F0, (os_log_t)v24, v23, "User clicked button index %ld", v40, 0xCu);
        }
        objc_storeStrong(&v24, 0);
        id v6 = [v28 unsignedIntegerValue];
        if (v6 < [*(id *)(a1 + 40) count])
        {
          id v19 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v28, "integerValue"));
          if (v19)
          {
            dispatch_queue_t queue = v39[0];
            id v10 = _NSConcreteStackBlock;
            int v11 = -1073741824;
            int v12 = 0;
            BOOL v13 = sub_396F0;
            unsigned __int8 v14 = &unk_601C0;
            id v15 = v19;
            dispatch_async(queue, &v10);
            objc_storeStrong(&v15, 0);
            int v34 = 0;
          }
          else
          {
            os_log_t oslog = (os_log_t)(id)SUSUILog();
            os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              id v2 = oslog;
              os_log_type_t v3 = v17;
              sub_5A1C(v16);
              _os_log_impl(&def_46F0, v2, v3, "No action registered for button", v16, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
            int v34 = 1;
          }
          objc_storeStrong(&v19, 0);
        }
        else
        {
          id v22 = (id)SUSUILog();
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
          {
            id v4 = v22;
            os_log_type_t v5 = v21;
            sub_5A1C(v20);
            _os_log_impl(&def_46F0, v4, v5, "index does not match any button", v20, 2u);
          }
          objc_storeStrong(&v22, 0);
          int v34 = 1;
        }
      }
      else
      {
        id v27 = (id)SUSUILog();
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v7 = v27;
          os_log_type_t v8 = v26;
          sub_5A1C(v25);
          _os_log_impl(&def_46F0, v7, v8, "failed to get button index from response dictionary", v25, 2u);
        }
        objc_storeStrong(&v27, 0);
        int v34 = 1;
      }
      objc_storeStrong(&v28, 0);
    }
    else
    {
      id v30 = (id)SUSUILog();
      os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
      {
        sub_16030((uint64_t)v41, v37);
        _os_log_impl(&def_46F0, (os_log_t)v30, v29, "failed to get response dictionary from CFUserNotification: %ld", v41, 0xCu);
      }
      objc_storeStrong(&v30, 0);
      int v34 = 1;
    }
    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(v39, 0);
}

uint64_t sub_396F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

uint64_t sub_3BE54(uint64_t result, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(unsigned char *)(result + 24) = 0;
  *(unsigned char *)(result + 25) = 4;
  *(_DWORD *)(result + 26) = a5;
  *(unsigned char *)(result + 30) = 0;
  *(unsigned char *)(result + 31) = 4;
  *(_DWORD *)(result + 32) = a6;
  *(unsigned char *)(result + 36) = 64;
  *(unsigned char *)(result + 37) = 8;
  *(void *)(result + 38) = a7;
  return result;
}

uint64_t sub_3C100(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_3D3C4(id a1)
{
  id v1 = objc_alloc_init(SUSUIControllerServer);
  id v2 = (void *)qword_70470;
  qword_70470 = (uint64_t)v1;
}

id sub_3D4F8(uint64_t a1)
{
  os_log_type_t v9 = +[SUSUISoftwareUpdateController sharedInstance];
  id v1 = [(SUSUISoftwareUpdateController *)v9 clientQueue];
  uint64_t v2 = *(void *)(a1 + 32);
  os_log_type_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v1;

  id v4 = objc_alloc((Class)NSXPCListener);
  id v5 = [v4 initWithMachServiceName:SUSUIControllerConnectionName];
  uint64_t v6 = *(void *)(a1 + 32);
  os_log_type_t v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 32) + 8) resume];
}

BOOL sub_3DB28(id a1)
{
  return BYSetupAssistantNeedsToRun() & 1;
}

void sub_3DD74(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v24 = a1;
  id v10 = +[SUSUIPreferences sharedInstance];
  char v22 = 0;
  LOBYTE(v11) = 0;
  if ([(SUSUIPreferences *)v10 needsAlertPresentationAfterOTAUpdate])
  {
    os_log_type_t v23 = +[SUSUIPreferences sharedInstance];
    char v22 = 1;
    unsigned int v11 = [(SUSUIPreferences *)v23 preventPostUpdateAlert] ^ 1;
  }
  if (v22) {

  }
  if (v11)
  {
    int v21 = 0;
    char v20 = 0;
    os_log_type_t v7 = +[SUPreferences sharedInstance];
    char v18 = 0;
    unsigned __int8 v8 = 1;
    if (([(SUPreferences *)v7 skipDownload] & 1) == 0)
    {
      id v19 = +[SUPreferences sharedInstance];
      char v18 = 1;
      unsigned __int8 v8 = [(SUPreferences *)v19 skipApply];
    }
    if (v18) {

    }
    char v20 = v8 & 1;
    if (v8)
    {
      id location = (id)SUSUILogPostUpdateAlert();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        log = location;
        os_log_type_t type = v16;
        sub_5A1C(v15);
        _os_log_impl(&def_46F0, log, type, "Previous OTA attempt was fake", v15, 2u);
      }
      objc_storeStrong(&location, 0);
    }
    if ((v20 & 1) != 0 || (MSURetrievePreviousUpdateState() & 1) == 0 || v21 == 1 || v21 == 3)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_3E290, BYSetupAssistantFinishedDarwinNotification, 0, CFNotificationSuspensionBehaviorDrop);
      *(unsigned char *)(*(void *)(a1 + 32) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1;
      if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 1) == 0)
      {
        uint64_t v2 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveEveryObserver(v2, *(const void **)(a1 + 32));
      }
      [*(id *)(*(void *)(a1 + 32) + 16) addObserver:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(a1 + 32) + 26) = [*(id *)(*(void *)(a1 + 32) + 16) isUILocked] & 1;
      os_log_t oslog = (os_log_t)(id)SUSUILogPostUpdateAlert();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 24)) {
          CFStringRef v3 = @"YES";
        }
        else {
          CFStringRef v3 = @"NO";
        }
        if (*(unsigned char *)(*(void *)(a1 + 32) + 26)) {
          CFStringRef v4 = @"YES";
        }
        else {
          CFStringRef v4 = @"NO";
        }
        sub_4BF8((uint64_t)v26, (uint64_t)v3, (uint64_t)v4);
        _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Initialized from OTA SoftwareUpdate? YES, inSetupMode: %@, UILocked? %@", v26, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (*(unsigned char *)(*(void *)(a1 + 32) + 26)) {
        [*(id *)(a1 + 32) _showStartupAlertItemForReason:@"Initialized - from OTA update"];
      }
    }
    else
    {
      id v14 = (id)SUSUILogPostUpdateAlert();
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        sub_141D8((uint64_t)v27, v21);
        _os_log_impl(&def_46F0, (os_log_t)v14, v13, "Previous OTA attempt failed. MSUPreviousUpdateState: %d", v27, 8u);
      }
      objc_storeStrong(&v14, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _dismissAlertForReason:@"Initialized - not from OTA SoftwareUpdate"];
  }
}

id sub_3E290(uint64_t a1, void *a2)
{
  return [a2 _setupAssistantFinished];
}

void sub_3E3D0(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILogPostUpdateAlert();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v9, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Clearing OTA Reboot Alert State with reason: %@", v9, 0xCu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(*(void *)(a1 + 40) + 16) removeObserver:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), 0);
  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 0;
  CFStringRef v3 = +[SUSUIPreferences sharedInstance];
  char v6 = 0;
  LOBYTE(v4) = 0;
  if ([(SUSUIPreferences *)v3 needsAlertPresentationAfterOTAUpdate])
  {
    os_log_type_t v7 = +[SUSUIPreferences sharedInstance];
    char v6 = 1;
    unsigned int v4 = [(SUSUIPreferences *)v7 preventPostUpdateAlert] ^ 1;
  }
  if (v6) {

  }
  if (v4)
  {
    uint64_t v2 = +[SUSUIPreferences sharedInstance];
    [(SUSUIPreferences *)v2 setNeedsAlertPresentationAfterOTAUpdate:0];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, *(const void **)(a1 + 40));
}

void sub_3E6C8(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 26) & 1) != (*(unsigned char *)(a1 + 40) & 1))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 26) = *(unsigned char *)(a1 + 40) & 1;
    location[0] = (id)SUSUILogPostUpdateAlert();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        CFStringRef v1 = @"YES";
      }
      else {
        CFStringRef v1 = @"NO";
      }
      sub_548C((uint64_t)v10, (uint64_t)v1);
      _os_log_impl(&def_46F0, (os_log_t)location[0], v8, "UI lock state changed: isUILocked=%@", v10, 0xCu);
    }
    objc_storeStrong(location, 0);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 26))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 27))
      {
        os_log_t oslog = (os_log_t)(id)SUSUILogPostUpdateAlert();
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v2 = oslog;
          os_log_type_t v3 = v6;
          sub_5A1C(v5);
          _os_log_impl(&def_46F0, v2, v3, "Showing alert already, not showing again", v5, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        [*(id *)(a1 + 32) _showStartupAlertItemForReason:@"UILocked"];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _dismissAlertForReason:@"UIUnlocked"];
    }
  }
}

void sub_3E9A4(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = (id)SUSUILogPostUpdateAlert();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v5;
    sub_5A1C(v4);
    _os_log_impl(&def_46F0, log, type, "setup assistant finished", v4, 2u);
  }
  objc_storeStrong(location, 0);
  *((unsigned char *)a1[4] + 24) = 0;
  if (*((unsigned char *)a1[4] + 26)) {
    [a1[4] _showStartupAlertItemForReason:@"Setup completed"];
  }
}

void sub_3EE7C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location)
{
  *(void *)(v19 - 112) = a1;
  *(_DWORD *)(v19 - 116) = a2;
  objc_destroyWeak((id *)(v19 - 96));
  _Unwind_Resume(*(_Unwind_Exception **)(v19 - 112));
}

void sub_3EEF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteAlertAcknowledgedWithReason:@"UserTappedCloseButton"];
}

id sub_3EF40(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) dismissAlertsOfClass:objc_opt_class() animated:0];
  id result = [*(id *)(*(void *)(a1 + 32) + 8) presentAlert:*(void *)(a1 + 40) animated:1];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 32) + 27) = 0;
  }
  return result;
}

id sub_3F19C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) dismissAlertsOfClass:objc_opt_class() animated:0];
}

void sub_40570(id a1)
{
  CFStringRef v1 = objc_alloc_init(SUSUIFollowUpPresenter);
  uint64_t v2 = (void *)qword_70488;
  qword_70488 = (uint64_t)v1;
}

void sub_40820(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = [*(id *)(a1 + 32) _followUpItemForSUSUIFollowUp:*(void *)(a1 + 40)];
  if (location[0]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) postFollowUpItem:location[0] error:*(void *)(a1 + 56)] & 1;
  }
  if (*(void *)(a1 + 56))
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_4BF8((uint64_t)v4, (uint64_t)location[0], **(void **)(a1 + 56));
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Error posting FollowUpItem: %@ Error: %@", v4, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

void sub_40AF0(void *a1)
{
  id v8[2] = a1;
  v8[1] = a1;
  v8[0] = 0;
  uint64_t v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = a1[5];
  id obj = 0;
  unsigned __int8 v5 = [v2 clearPendingFollowUpItemsWithUniqueIdentifiers:v3 error:&obj];
  objc_storeStrong(v8, obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 & 1;
  if (v8[0])
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v9, (uint64_t)v8[0]);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Error clearing pending FollowUp Items: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(v8, 0);
}

void sub_40D60(void *a1)
{
  id v6[2] = a1;
  v6[1] = a1;
  v6[0] = 0;
  CFStringRef v1 = *(void **)(a1[4] + 16);
  id obj = 0;
  unsigned __int8 v3 = [v1 clearPendingFollowUpItems:&obj];
  objc_storeStrong(v6, obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3 & 1;
  if (v6[0])
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v7, (uint64_t)v6[0]);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Error clearing pending FollowUp Items: %@", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(v6, 0);
}

void sub_41010(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  v18[0] = 0;
  CFStringRef v1 = *(void **)(a1[4] + 16);
  id v16 = 0;
  id v11 = [v1 pendingFollowUpItems:&v16];
  objc_storeStrong(v18, v16);
  id v17 = v11;
  if (v18[0])
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v20, (uint64_t)v18[0]);
      _os_log_impl(&def_46F0, (os_log_t)v15, v14, "Error fetching pending FollowUp Items: %@", v20, 0xCu);
    }
    objc_storeStrong(&v15, 0);
  }
  if (v17)
  {
    memset(__b, 0, sizeof(__b));
    id obj = v17;
    id v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      id v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v6);
        id v2 = [v13 uniqueIdentifier];
        unsigned __int8 v3 = [v2 isEqualToString:a1[5]];

        if (v3) {
          break;
        }
        ++v6;
        if (v4 + 1 >= (unint64_t)v7)
        {
          uint64_t v6 = 0;
          id v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v7) {
            goto LABEL_14;
          }
        }
      }
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
LABEL_14:
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

id sub_41EE8(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v4, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Reboot Now action taken.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  [*(id *)(a1 + 40) reboot];
  return [*(id *)(a1 + 40) dismissAlert];
}

id sub_421D0(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v4, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, oslog[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancel action taken.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  [*(id *)(a1 + 40) cancel];
  return [*(id *)(a1 + 40) dismissAlert];
}

id sub_4243C()
{
  predicate = (dispatch_once_t *)&unk_704A0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_61768);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_70498;

  return v0;
}

void sub_424C8(id a1)
{
  CFStringRef v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_70498;
  qword_70498 = (uint64_t)v1;
}

id sub_42A50(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unsigned __int8 v3 = +[NSURL URLWithString:@"prefs:root=General&path=About/SW_VERSION_SPECIFIER"];
  objc_msgSend(v2, "activateDisplayWithURL:");

  return [*(id *)(a1 + 32) dismissAlert];
}

id sub_42AD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_42D20()
{
  predicate = (dispatch_once_t *)&unk_704B0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_61D48);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_704A8;

  return v0;
}

void sub_42DAC(id a1)
{
  CFStringRef v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  id v2 = (void *)qword_704A8;
  qword_704A8 = (uint64_t)v1;
}

void sub_434D4(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v31, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], v28, "[%{public}@] Remove action taken.", v31, 0xCu);
  }
  objc_storeStrong(location, 0);
  unsigned __int8 v1 = [*(id *)(*(void *)(a1 + 40) + 57) promptForPasscode];
  char v26 = 0;
  unsigned __int8 v8 = 0;
  if (v1)
  {
    id v27 = +[SUKeybagInterface sharedInstance];
    char v26 = 1;
    unsigned __int8 v8 = [(SUKeybagInterface *)v27 hasPasscodeSet];
  }
  if (v26) {

  }
  if (v8)
  {
    id v25 = (id)SUSUILog();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_8120((uint64_t)v30, *(void *)(a1 + 32));
      _os_log_impl(&def_46F0, (os_log_t)v25, v24, "[%{public}@] Prompting for passcode for rollback.", v30, 0xCu);
    }
    objc_storeStrong(&v25, 0);
    unsigned __int8 v3 = [SUSUIFullScreenAuthenticationAlert alloc];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 49);
    id v5 = [*(id *)(a1 + 48) softwareUpdateController];
    id v4 = [v5 clientQueue];
    id v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    uint64_t v19 = sub_43970;
    char v20 = &unk_62050;
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    os_log_type_t v23 = [(SUSUIFullScreenAuthenticationAlert *)v3 initWithRollbackDescriptor:v2 canDeferInstallation:1 completionQueue:v4 completionBlock:&v16];

    id v7 = [*(id *)(a1 + 48) softwareUpdateController];
    uint64_t v6 = v23;
    id v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = sub_43B80;
    os_log_type_t v14 = &unk_5CC30;
    id v15 = *(id *)(a1 + 48);
    [v7 presentAuthenticationAlert:v6 completion:&v10];

    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 40) + 81)) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 81) + 16))();
    }
    [*(id *)(a1 + 48) dismissAlert];
  }
}

void sub_43970(uint64_t *a1, char a2)
{
  int v11 = a1;
  char v10 = a2 & 1;
  location[1] = a1;
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      CFStringRef v2 = @"succeeded";
    }
    else {
      CFStringRef v2 = @"failed";
    }
    sub_8384((uint64_t)v12, a1[4], (uint64_t)v2);
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Passcode entry %@", v12, 0x16u);
  }
  objc_storeStrong(location, 0);
  if (*(void *)(a1[5] + 81))
  {
    uint64_t v3 = *(void *)(a1[5] + 81);
    char v4 = v10;
    uint64_t v5 = *(void *)(a1[5] + 49);
    char v7 = 0;
    if (v10)
    {
      (*(void (**)(uint64_t, void, uint64_t, void))(v3 + 16))(v3, v10 & 1, v5, 0);
    }
    else
    {
      id v8 = +[SUUtility errorWithCode:92];
      char v7 = 1;
      (*(void (**)(uint64_t, void, uint64_t, id))(v3 + 16))(v3, v4 & 1, v5, v8);
    }
    if (v7) {
  }
    }
}

id sub_43B80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_43DB4(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_8120((uint64_t)v6, *(void *)(a1 + 32));
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancel action taken.", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  if (*(void *)(*(void *)(a1 + 40) + 81))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 81);
    id v3 = +[SUUtility errorWithCode:90];
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  }
  return [*(id *)(a1 + 48) dismissAlert];
}

void sub_44468(uint64_t *a1, char a2)
{
  int v11 = a1;
  char v10 = a2 & 1;
  location[1] = a1;
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      CFStringRef v2 = @"succeeded";
    }
    else {
      CFStringRef v2 = @"failed";
    }
    sub_8384((uint64_t)v12, a1[4], (uint64_t)v2);
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "[%{public}@] Passcode entry %@", v12, 0x16u);
  }
  objc_storeStrong(location, 0);
  if (*(void *)(a1[5] + 81))
  {
    uint64_t v3 = *(void *)(a1[5] + 81);
    char v4 = v10;
    uint64_t v5 = *(void *)(a1[5] + 49);
    char v7 = 0;
    if (v10)
    {
      (*(void (**)(uint64_t, void, uint64_t, void))(v3 + 16))(v3, v10 & 1, v5, 0);
    }
    else
    {
      id v8 = +[SUUtility errorWithCode:92];
      char v7 = 1;
      (*(void (**)(uint64_t, void, uint64_t, id))(v3 + 16))(v3, v4 & 1, v5, v8);
    }
    if (v7) {
  }
    }
}

id sub_44678(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAlert", a1, a1);
}

id sub_4478C()
{
  predicate = (dispatch_once_t *)&unk_704C0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_62070);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)qword_704B8;

  return v0;
}

void sub_44818(id a1)
{
  unsigned __int8 v1 = +[NSBundle bundleWithIdentifier:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin", a1, a1];
  CFStringRef v2 = (void *)qword_704B8;
  qword_704B8 = (uint64_t)v1;
}

uint64_t BSDispatchQueueAssert()
{
  return _BSDispatchQueueAssert();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationGetResponseDictionary(userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return _CFUserNotificationUpdate(userNotification, timeout, flags, dictionary);
}

uint64_t CPFSSizeStrings()
{
  return _CPFSSizeStrings();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t MSURetrievePreviousUpdateState()
{
  return _MSURetrievePreviousUpdateState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SURequiredBatteryLevelForInstall()
{
  return _SURequiredBatteryLevelForInstall();
}

uint64_t SUSUILog()
{
  return _SUSUILog();
}

uint64_t SUSUILogEmergencyCallUI()
{
  return _SUSUILogEmergencyCallUI();
}

uint64_t SUSUILogPostUpdateAlert()
{
  return _SUSUILogPostUpdateAlert();
}

uint64_t SUStringFromInstallationConstraints()
{
  return _SUStringFromInstallationConstraints();
}

uint64_t _BSIsInternalInstall()
{
  return __BSIsInternalInstall();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return __CFCopySupplementalVersionDictionary();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_msgSend_IWillRebootLater(void *a1, const char *a2, ...)
{
  return [a1 IWillRebootLater];
}

id objc_msgSend__acknowledge(void *a1, const char *a2, ...)
{
  return [a1 _acknowledge];
}

id objc_msgSend__activateInstallLaterAlert(void *a1, const char *a2, ...)
{
  return [a1 _activateInstallLaterAlert];
}

id objc_msgSend__alertModel(void *a1, const char *a2, ...)
{
  return [a1 _alertModel];
}

id objc_msgSend__alertStyleForCurrentWindow(void *a1, const char *a2, ...)
{
  return [a1 _alertStyleForCurrentWindow];
}

id objc_msgSend__allNonInstallableReasons(void *a1, const char *a2, ...)
{
  return [a1 _allNonInstallableReasons];
}

id objc_msgSend__availableRollback(void *a1, const char *a2, ...)
{
  return [a1 _availableRollback];
}

id objc_msgSend__cancelButton(void *a1, const char *a2, ...)
{
  return [a1 _cancelButton];
}

id objc_msgSend__computeDefaultRealertDate(void *a1, const char *a2, ...)
{
  return [a1 _computeDefaultRealertDate];
}

id objc_msgSend__computeNextLastPredictedUnlockDateMinus4HoursFromNow(void *a1, const char *a2, ...)
{
  return [a1 _computeNextLastPredictedUnlockDateMinus4HoursFromNow];
}

id objc_msgSend__detailsButton(void *a1, const char *a2, ...)
{
  return [a1 _detailsButton];
}

id objc_msgSend__disarm(void *a1, const char *a2, ...)
{
  return [a1 _disarm];
}

id objc_msgSend__dismissAllAlerts(void *a1, const char *a2, ...)
{
  return [a1 _dismissAllAlerts];
}

id objc_msgSend__dismissInstallFailureAlertsWithoutRepop(void *a1, const char *a2, ...)
{
  return [a1 _dismissInstallFailureAlertsWithoutRepop];
}

id objc_msgSend__download(void *a1, const char *a2, ...)
{
  return [a1 _download];
}

id objc_msgSend__emergencyButton(void *a1, const char *a2, ...)
{
  return [a1 _emergencyButton];
}

id objc_msgSend__foregroundBundleID(void *a1, const char *a2, ...)
{
  return [a1 _foregroundBundleID];
}

id objc_msgSend__getPasscodePolicy(void *a1, const char *a2, ...)
{
  return [a1 _getPasscodePolicy];
}

id objc_msgSend__goToSUPaneAction(void *a1, const char *a2, ...)
{
  return [a1 _goToSUPaneAction];
}

id objc_msgSend__homescreenForeground(void *a1, const char *a2, ...)
{
  return [a1 _homescreenForeground];
}

id objc_msgSend__initialInstallAlertFlowFromDownload(void *a1, const char *a2, ...)
{
  return [a1 _initialInstallAlertFlowFromDownload];
}

id objc_msgSend__initializeState(void *a1, const char *a2, ...)
{
  return [a1 _initializeState];
}

id objc_msgSend__installLaterButton(void *a1, const char *a2, ...)
{
  return [a1 _installLaterButton];
}

id objc_msgSend__installLaterButtonText(void *a1, const char *a2, ...)
{
  return [a1 _installLaterButtonText];
}

id objc_msgSend__installNow(void *a1, const char *a2, ...)
{
  return [a1 _installNow];
}

id objc_msgSend__installNowAction(void *a1, const char *a2, ...)
{
  return [a1 _installNowAction];
}

id objc_msgSend__installNowButton(void *a1, const char *a2, ...)
{
  return [a1 _installNowButton];
}

id objc_msgSend__installNowButtonText(void *a1, const char *a2, ...)
{
  return [a1 _installNowButtonText];
}

id objc_msgSend__installPolicy(void *a1, const char *a2, ...)
{
  return [a1 _installPolicy];
}

id objc_msgSend__installUpdateNow(void *a1, const char *a2, ...)
{
  return [a1 _installUpdateNow];
}

id objc_msgSend__isAutoUpdateEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isAutoUpdateEnabled];
}

id objc_msgSend__isEffectivelyScheduled(void *a1, const char *a2, ...)
{
  return [a1 _isEffectivelyScheduled];
}

id objc_msgSend__isForecastExpired(void *a1, const char *a2, ...)
{
  return [a1 _isForecastExpired];
}

id objc_msgSend__isMDMAlert(void *a1, const char *a2, ...)
{
  return [a1 _isMDMAlert];
}

id objc_msgSend__isMultiUserAppleId(void *a1, const char *a2, ...)
{
  return [a1 _isMultiUserAppleId];
}

id objc_msgSend__isSettingsLaunchable(void *a1, const char *a2, ...)
{
  return [a1 _isSettingsLaunchable];
}

id objc_msgSend__isShowingInstallAlert(void *a1, const char *a2, ...)
{
  return [a1 _isShowingInstallAlert];
}

id objc_msgSend__isValidForScheduling(void *a1, const char *a2, ...)
{
  return [a1 _isValidForScheduling];
}

id objc_msgSend__load(void *a1, const char *a2, ...)
{
  return [a1 _load];
}

id objc_msgSend__makeScheduling(void *a1, const char *a2, ...)
{
  return [a1 _makeScheduling];
}

id objc_msgSend__migrateForNewOSVersionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _migrateForNewOSVersionIfNecessary];
}

id objc_msgSend__needsToWaitForHomescreenToAppear(void *a1, const char *a2, ...)
{
  return [a1 _needsToWaitForHomescreenToAppear];
}

id objc_msgSend__notificationButtonActions(void *a1, const char *a2, ...)
{
  return [a1 _notificationButtonActions];
}

id objc_msgSend__notificationButtons(void *a1, const char *a2, ...)
{
  return [a1 _notificationButtons];
}

id objc_msgSend__notificationFlags(void *a1, const char *a2, ...)
{
  return [a1 _notificationFlags];
}

id objc_msgSend__notificationMessage(void *a1, const char *a2, ...)
{
  return [a1 _notificationMessage];
}

id objc_msgSend__notificationOptions(void *a1, const char *a2, ...)
{
  return [a1 _notificationOptions];
}

id objc_msgSend__notificationTitle(void *a1, const char *a2, ...)
{
  return [a1 _notificationTitle];
}

id objc_msgSend__okButton(void *a1, const char *a2, ...)
{
  return [a1 _okButton];
}

id objc_msgSend__reallyShouldEnforceNow(void *a1, const char *a2, ...)
{
  return [a1 _reallyShouldEnforceNow];
}

id objc_msgSend__rebootNowButton(void *a1, const char *a2, ...)
{
  return [a1 _rebootNowButton];
}

id objc_msgSend__rebootQuiet(void *a1, const char *a2, ...)
{
  return [a1 _rebootQuiet];
}

id objc_msgSend__registerForInstallationConstraintChangedNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForInstallationConstraintChangedNotifications];
}

id objc_msgSend__registerForUnlockNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForUnlockNotifications];
}

id objc_msgSend__remindMeLaterAction(void *a1, const char *a2, ...)
{
  return [a1 _remindMeLaterAction];
}

id objc_msgSend__remindMeLaterButton(void *a1, const char *a2, ...)
{
  return [a1 _remindMeLaterButton];
}

id objc_msgSend__removeButton(void *a1, const char *a2, ...)
{
  return [a1 _removeButton];
}

id objc_msgSend__scheduleNextDDMAlert(void *a1, const char *a2, ...)
{
  return [a1 _scheduleNextDDMAlert];
}

id objc_msgSend__sendInstallTonightDidCompleteToObservers(void *a1, const char *a2, ...)
{
  return [a1 _sendInstallTonightDidCompleteToObservers];
}

id objc_msgSend__setPasscodePolicyToRequiredIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setPasscodePolicyToRequiredIfNeeded];
}

id objc_msgSend__setupAssistantFinished(void *a1, const char *a2, ...)
{
  return [a1 _setupAssistantFinished];
}

id objc_msgSend__setupDefinition(void *a1, const char *a2, ...)
{
  return [a1 _setupDefinition];
}

id objc_msgSend__shouldCountdown(void *a1, const char *a2, ...)
{
  return [a1 _shouldCountdown];
}

id objc_msgSend__shouldDisallowAvailabilityNotifications(void *a1, const char *a2, ...)
{
  return [a1 _shouldDisallowAvailabilityNotifications];
}

id objc_msgSend__shouldHideAlert(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideAlert];
}

id objc_msgSend__shouldShowInstallLater(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowInstallLater];
}

id objc_msgSend__shouldShowOrScheduleInstallAlert(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowOrScheduleInstallAlert];
}

id objc_msgSend__showOrScheduleNextInstallAlert(void *a1, const char *a2, ...)
{
  return [a1 _showOrScheduleNextInstallAlert];
}

id objc_msgSend__stringForCurrentVersionPreference(void *a1, const char *a2, ...)
{
  return [a1 _stringForCurrentVersionPreference];
}

id objc_msgSend__unregisterForInstallationConstraintChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForInstallationConstraintChangeNotifications];
}

id objc_msgSend__unregisterForUnlockNotifications(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForUnlockNotifications];
}

id objc_msgSend__unregisterHomescreenAlerts(void *a1, const char *a2, ...)
{
  return [a1 _unregisterHomescreenAlerts];
}

id objc_msgSend__userAskedToDeferInstall(void *a1, const char *a2, ...)
{
  return [a1 _userAskedToDeferInstall];
}

id objc_msgSend__waitableReasonsForShowingInstallAlert(void *a1, const char *a2, ...)
{
  return [a1 _waitableReasonsForShowingInstallAlert];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activateSoftwareUpdateSettingsDisplay(void *a1, const char *a2, ...)
{
  return [a1 activateSoftwareUpdateSettingsDisplay];
}

id objc_msgSend_activeDownloadPolicyType(void *a1, const char *a2, ...)
{
  return [a1 activeDownloadPolicyType];
}

id objc_msgSend_activeFullScreenAlerts(void *a1, const char *a2, ...)
{
  return [a1 activeFullScreenAlerts];
}

id objc_msgSend_alertAfterDownload(void *a1, const char *a2, ...)
{
  return [a1 alertAfterDownload];
}

id objc_msgSend_alertFlow(void *a1, const char *a2, ...)
{
  return [a1 alertFlow];
}

id objc_msgSend_alertItem(void *a1, const char *a2, ...)
{
  return [a1 alertItem];
}

id objc_msgSend_alertMsgFormat(void *a1, const char *a2, ...)
{
  return [a1 alertMsgFormat];
}

id objc_msgSend_alertPresentationManager(void *a1, const char *a2, ...)
{
  return [a1 alertPresentationManager];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowInSetup(void *a1, const char *a2, ...)
{
  return [a1 allowInSetup];
}

id objc_msgSend_allowLockScreenDismissal(void *a1, const char *a2, ...)
{
  return [a1 allowLockScreenDismissal];
}

id objc_msgSend_allowMenuButtonDismissal(void *a1, const char *a2, ...)
{
  return [a1 allowMenuButtonDismissal];
}

id objc_msgSend_allowNoButton(void *a1, const char *a2, ...)
{
  return [a1 allowNoButton];
}

id objc_msgSend_allowNotification(void *a1, const char *a2, ...)
{
  return [a1 allowNotification];
}

id objc_msgSend_allowedApps(void *a1, const char *a2, ...)
{
  return [a1 allowedApps];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoUpdateEnabled(void *a1, const char *a2, ...)
{
  return [a1 autoUpdateEnabled];
}

id objc_msgSend_autoUpdateExpired(void *a1, const char *a2, ...)
{
  return [a1 autoUpdateExpired];
}

id objc_msgSend_autoUpdateRetryCount(void *a1, const char *a2, ...)
{
  return [a1 autoUpdateRetryCount];
}

id objc_msgSend_automaticInstallAttempt(void *a1, const char *a2, ...)
{
  return [a1 automaticInstallAttempt];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_buildAlertItemDefinition(void *a1, const char *a2, ...)
{
  return [a1 buildAlertItemDefinition];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_buildVersionString(void *a1, const char *a2, ...)
{
  return [a1 buildVersionString];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return [a1 buttons];
}

id objc_msgSend_canDeferInstallation(void *a1, const char *a2, ...)
{
  return [a1 canDeferInstallation];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelRollback(void *a1, const char *a2, ...)
{
  return [a1 cancelRollback];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return [a1 clientQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return [a1 configurationContext];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_contentExtensionID(void *a1, const char *a2, ...)
{
  return [a1 contentExtensionID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentInstallationPolicy(void *a1, const char *a2, ...)
{
  return [a1 currentInstallationPolicy];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentReleaseTypeIsInternal(void *a1, const char *a2, ...)
{
  return [a1 currentReleaseTypeIsInternal];
}

id objc_msgSend_currentReminderWindow(void *a1, const char *a2, ...)
{
  return [a1 currentReminderWindow];
}

id objc_msgSend_currentSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 currentSystemVersion];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultOptions];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_destroyInstallationKeybag(void *a1, const char *a2, ...)
{
  return [a1 destroyInstallationKeybag];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissAlert];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return [a1 displayBacklightLevel];
}

id objc_msgSend_displayStyle(void *a1, const char *a2, ...)
{
  return [a1 displayStyle];
}

id objc_msgSend_documentation(void *a1, const char *a2, ...)
{
  return [a1 documentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadAndInstall(void *a1, const char *a2, ...)
{
  return [a1 downloadAndInstall];
}

id objc_msgSend_downloadAndInstallLater(void *a1, const char *a2, ...)
{
  return [a1 downloadAndInstallLater];
}

id objc_msgSend_downloadOptions(void *a1, const char *a2, ...)
{
  return [a1 downloadOptions];
}

id objc_msgSend_downloadWasQueuedRemotely(void *a1, const char *a2, ...)
{
  return [a1 downloadWasQueuedRemotely];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_enforcedInstallDate(void *a1, const char *a2, ...)
{
  return [a1 enforcedInstallDate];
}

id objc_msgSend_extensionDictionary(void *a1, const char *a2, ...)
{
  return [a1 extensionDictionary];
}

id objc_msgSend_forcePasscodeRequired(void *a1, const char *a2, ...)
{
  return [a1 forcePasscodeRequired];
}

id objc_msgSend_forcesModalAlertAppearance(void *a1, const char *a2, ...)
{
  return [a1 forcesModalAlertAppearance];
}

id objc_msgSend_forecast(void *a1, const char *a2, ...)
{
  return [a1 forecast];
}

id objc_msgSend_getDDMUpdateDescriptor(void *a1, const char *a2, ...)
{
  return [a1 getDDMUpdateDescriptor];
}

id objc_msgSend_getInitIfNeededDDMController(void *a1, const char *a2, ...)
{
  return [a1 getInitIfNeededDDMController];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 hasPasscodeSet];
}

id objc_msgSend_hideInstallAlert(void *a1, const char *a2, ...)
{
  return [a1 hideInstallAlert];
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return [a1 homeButtonType];
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableUpdateName];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return [a1 id];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignorableConstraints(void *a1, const char *a2, ...)
{
  return [a1 ignorableConstraints];
}

id objc_msgSend_informativeFooterText(void *a1, const char *a2, ...)
{
  return [a1 informativeFooterText];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initPostOTAFollowUpController(void *a1, const char *a2, ...)
{
  return [a1 initPostOTAFollowUpController];
}

id objc_msgSend_installAlertIntervalMinutes(void *a1, const char *a2, ...)
{
  return [a1 installAlertIntervalMinutes];
}

id objc_msgSend_installDark(void *a1, const char *a2, ...)
{
  return [a1 installDark];
}

id objc_msgSend_installNow(void *a1, const char *a2, ...)
{
  return [a1 installNow];
}

id objc_msgSend_installTonight(void *a1, const char *a2, ...)
{
  return [a1 installTonight];
}

id objc_msgSend_installationSize(void *a1, const char *a2, ...)
{
  return [a1 installationSize];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAnyClientInUserInteraction(void *a1, const char *a2, ...)
{
  return [a1 isAnyClientInUserInteraction];
}

id objc_msgSend_isAutoDownload(void *a1, const char *a2, ...)
{
  return [a1 isAutoDownload];
}

id objc_msgSend_isBadgedForSoftwareUpdate(void *a1, const char *a2, ...)
{
  return [a1 isBadgedForSoftwareUpdate];
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return [a1 isCanceled];
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return [a1 isDone];
}

id objc_msgSend_isDownloadOnly(void *a1, const char *a2, ...)
{
  return [a1 isDownloadOnly];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return [a1 isExpired];
}

id objc_msgSend_isHomeScreenForeground(void *a1, const char *a2, ...)
{
  return [a1 isHomeScreenForeground];
}

id objc_msgSend_isInstallOverdue(void *a1, const char *a2, ...)
{
  return [a1 isInstallOverdue];
}

id objc_msgSend_isInstallationKeybagRequired(void *a1, const char *a2, ...)
{
  return [a1 isInstallationKeybagRequired];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeLocked];
}

id objc_msgSend_isPreferredButton(void *a1, const char *a2, ...)
{
  return [a1 isPreferredButton];
}

id objc_msgSend_isScreenOn(void *a1, const char *a2, ...)
{
  return [a1 isScreenOn];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_isSplatOnly(void *a1, const char *a2, ...)
{
  return [a1 isSplatOnly];
}

id objc_msgSend_isSpringBoardElement(void *a1, const char *a2, ...)
{
  return [a1 isSpringBoardElement];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_isUILocked(void *a1, const char *a2, ...)
{
  return [a1 isUILocked];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isValidDeclaration(void *a1, const char *a2, ...)
{
  return [a1 isValidDeclaration];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastAppliedUpdateWasSplatOnly(void *a1, const char *a2, ...)
{
  return [a1 lastAppliedUpdateWasSplatOnly];
}

id objc_msgSend_lastOSVersion(void *a1, const char *a2, ...)
{
  return [a1 lastOSVersion];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latestUpdate(void *a1, const char *a2, ...)
{
  return [a1 latestUpdate];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_learnMoreButton(void *a1, const char *a2, ...)
{
  return [a1 learnMoreButton];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_migrateAndClearLegacyPreferences(void *a1, const char *a2, ...)
{
  return [a1 migrateAndClearLegacyPreferences];
}

id objc_msgSend_needsAlertPresentationAfterOTAUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsAlertPresentationAfterOTAUpdate];
}

id objc_msgSend_nextAlertDate(void *a1, const char *a2, ...)
{
  return [a1 nextAlertDate];
}

id objc_msgSend_nextAlertRepopStrategy(void *a1, const char *a2, ...)
{
  return [a1 nextAlertRepopStrategy];
}

id objc_msgSend_notificationActivateAction(void *a1, const char *a2, ...)
{
  return [a1 notificationActivateAction];
}

id objc_msgSend_notificationBodyString(void *a1, const char *a2, ...)
{
  return [a1 notificationBodyString];
}

id objc_msgSend_notificationClearAction(void *a1, const char *a2, ...)
{
  return [a1 notificationClearAction];
}

id objc_msgSend_notificationFrequency(void *a1, const char *a2, ...)
{
  return [a1 notificationFrequency];
}

id objc_msgSend_notificationInformativeText(void *a1, const char *a2, ...)
{
  return [a1 notificationInformativeText];
}

id objc_msgSend_notificationOptions(void *a1, const char *a2, ...)
{
  return [a1 notificationOptions];
}

id objc_msgSend_notificationTitle(void *a1, const char *a2, ...)
{
  return [a1 notificationTitle];
}

id objc_msgSend_notificationTitleString(void *a1, const char *a2, ...)
{
  return [a1 notificationTitleString];
}

id objc_msgSend_notificationUnlockActionLabel(void *a1, const char *a2, ...)
{
  return [a1 notificationUnlockActionLabel];
}

id objc_msgSend_notifyAlertWasPresented(void *a1, const char *a2, ...)
{
  return [a1 notifyAlertWasPresented];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_passcodePolicy(void *a1, const char *a2, ...)
{
  return [a1 passcodePolicy];
}

id objc_msgSend_passcodeRequiredDays(void *a1, const char *a2, ...)
{
  return [a1 passcodeRequiredDays];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_predictNextDateForLastUnlockAttemptOfTheDay(void *a1, const char *a2, ...)
{
  return [a1 predictNextDateForLastUnlockAttemptOfTheDay];
}

id objc_msgSend_preferredDescriptor(void *a1, const char *a2, ...)
{
  return [a1 preferredDescriptor];
}

id objc_msgSend_presentAlert(void *a1, const char *a2, ...)
{
  return [a1 presentAlert];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_presentedAlerts(void *a1, const char *a2, ...)
{
  return [a1 presentedAlerts];
}

id objc_msgSend_preventCountdownAlert(void *a1, const char *a2, ...)
{
  return [a1 preventCountdownAlert];
}

id objc_msgSend_preventPostUpdateAlert(void *a1, const char *a2, ...)
{
  return [a1 preventPostUpdateAlert];
}

id objc_msgSend_preventRollbackPrompt(void *a1, const char *a2, ...)
{
  return [a1 preventRollbackPrompt];
}

id objc_msgSend_primaryForegroundBundleID(void *a1, const char *a2, ...)
{
  return [a1 primaryForegroundBundleID];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_promptForConsent(void *a1, const char *a2, ...)
{
  return [a1 promptForConsent];
}

id objc_msgSend_promptForPasscode(void *a1, const char *a2, ...)
{
  return [a1 promptForPasscode];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reappearsAfterLock(void *a1, const char *a2, ...)
{
  return [a1 reappearsAfterLock];
}

id objc_msgSend_reappearsAfterUnlock(void *a1, const char *a2, ...)
{
  return [a1 reappearsAfterUnlock];
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return [a1 reboot];
}

id objc_msgSend_recommendedUpdateAlertBodyString(void *a1, const char *a2, ...)
{
  return [a1 recommendedUpdateAlertBodyString];
}

id objc_msgSend_recommendedUpdateTitleString(void *a1, const char *a2, ...)
{
  return [a1 recommendedUpdateTitleString];
}

id objc_msgSend_remindMeLaterCountForCurrentUpdate(void *a1, const char *a2, ...)
{
  return [a1 remindMeLaterCountForCurrentUpdate];
}

id objc_msgSend_remindMeLaterCountSinceRequiringInstallation(void *a1, const char *a2, ...)
{
  return [a1 remindMeLaterCountSinceRequiringInstallation];
}

id objc_msgSend_remoteDefinition(void *a1, const char *a2, ...)
{
  return [a1 remoteDefinition];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_rescheduleIfAuthFails(void *a1, const char *a2, ...)
{
  return [a1 rescheduleIfAuthFails];
}

id objc_msgSend_resetAttempts(void *a1, const char *a2, ...)
{
  return [a1 resetAttempts];
}

id objc_msgSend_resetTransientDownloadState(void *a1, const char *a2, ...)
{
  return [a1 resetTransientDownloadState];
}

id objc_msgSend_restartCountdownOverrideIntervalSeconds(void *a1, const char *a2, ...)
{
  return [a1 restartCountdownOverrideIntervalSeconds];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rollbackDescriptor(void *a1, const char *a2, ...)
{
  return [a1 rollbackDescriptor];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_schduledAlertDate(void *a1, const char *a2, ...)
{
  return [a1 schduledAlertDate];
}

id objc_msgSend_scheduleType(void *a1, const char *a2, ...)
{
  return [a1 scheduleType];
}

id objc_msgSend_scheduledAlertStyle(void *a1, const char *a2, ...)
{
  return [a1 scheduledAlertStyle];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsForeground(void *a1, const char *a2, ...)
{
  return [a1 settingsForeground];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldEnforceUpdate(void *a1, const char *a2, ...)
{
  return [a1 shouldEnforceUpdate];
}

id objc_msgSend_shouldShowCountdown(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCountdown];
}

id objc_msgSend_shouldShowInLockScreen(void *a1, const char *a2, ...)
{
  return [a1 shouldShowInLockScreen];
}

id objc_msgSend_showButtonsOnLockScreen(void *a1, const char *a2, ...)
{
  return [a1 showButtonsOnLockScreen];
}

id objc_msgSend_skipApply(void *a1, const char *a2, ...)
{
  return [a1 skipApply];
}

id objc_msgSend_skipDownload(void *a1, const char *a2, ...)
{
  return [a1 skipDownload];
}

id objc_msgSend_skipsAllowed(void *a1, const char *a2, ...)
{
  return [a1 skipsAllowed];
}

id objc_msgSend_softwareUpdateController(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateController];
}

id objc_msgSend_softwareUpdateState(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateState];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_targetBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetBundleIdentifier];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_undimsScreen(void *a1, const char *a2, ...)
{
  return [a1 undimsScreen];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAlert(void *a1, const char *a2, ...)
{
  return [a1 updateAlert];
}

id objc_msgSend_updateName(void *a1, const char *a2, ...)
{
  return [a1 updateName];
}

id objc_msgSend_useDarkBoot(void *a1, const char *a2, ...)
{
  return [a1 useDarkBoot];
}

id objc_msgSend_userAskedToDeferInstall(void *a1, const char *a2, ...)
{
  return [a1 userAskedToDeferInstall];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userSelectedRemindMeLater(void *a1, const char *a2, ...)
{
  return [a1 userSelectedRemindMeLater];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return [a1 userType];
}

id objc_msgSend_userUpdateTonight(void *a1, const char *a2, ...)
{
  return [a1 userUpdateTonight];
}

id objc_msgSend_versionString(void *a1, const char *a2, ...)
{
  return [a1 versionString];
}

id objc_msgSend_viewControllerClassName(void *a1, const char *a2, ...)
{
  return [a1 viewControllerClassName];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_willPresentAlert(void *a1, const char *a2, ...)
{
  return [a1 willPresentAlert];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeKeepAliveFile(void *a1, const char *a2, ...)
{
  return [a1 writeKeepAliveFile];
}