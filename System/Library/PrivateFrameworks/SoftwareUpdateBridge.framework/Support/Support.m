id sub_100004BBC(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void sub_100004C00(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  SInt32 v2 = CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 56));
  if (!v2)
  {
    if ((responseFlags & 3) != 0 || !*(void *)(a1 + 32)) {
      goto LABEL_13;
    }
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    v5 = +[NSURL URLWithString:*(void *)(a1 + 32)];
    id v20 = 0;
    unsigned __int8 v6 = [v4 openSensitiveURL:v5 withOptions:0 error:&v20];
    id v7 = v20;

    uint64_t v8 = softwareupdatebridge_log;
    BOOL v9 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v10;
        v11 = "successfully opened url: (%{public}@)";
        v12 = v8;
        uint32_t v13 = 12;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else if (v9)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      id v25 = v7;
      v11 = "failed to open url (%{public}@) with error: (%{public}@)";
      v12 = v8;
      uint32_t v13 = 22;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v23) = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to get response from CFUserNotification: %{public}d", buf, 8u);
  }
LABEL_13:
  v15 = *(void **)(a1 + 48);
  if (v15)
  {
    v16 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100004E84;
    v17[3] = &unk_10002C700;
    id v19 = v15;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v16, v17);
  }
}

id sub_100004E84(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  SInt32 v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void sub_1000068E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006908(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  SInt32 v2 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFOptionFlags v13 = responseFlags & 3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[SpaceNotification]: User pressed %lu\n", buf, 0xCu);
  }
  CFOptionFlags v3 = responseFlags & 3;
  v4 = softwareupdatebridge_log;
  BOOL v5 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v3 == 1)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SpaceNotification]: User pressed Unpair, time to unpair\n", buf, 2u);
    }
    CFStringRef v10 = @"obliterate";
    v11 = &__kCFBooleanTrue;
    unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v7 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v8 = SUBActiveNRDevice();
    [v7 unpairWithDevice:v8 withOptions:v6 operationHasBegun:&stru_10002C768];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SpaceNotification]: User pressed OK..Nothing to do\n", buf, 2u);
  }
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_100006AEC(id a1, NSError *a2)
{
  SInt32 v2 = a2;
  CFOptionFlags v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SpaceNotification]: Unable to unpair: %@", (uint8_t *)&v4, 0xCu);
  }
}

id SUBError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v9 = sub_100006BE4(a1, a2, 0, a3, a4, (uint64_t)&a9);
  return v9;
}

id sub_100006BE4(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    id v15 = [v12 mutableCopy];
  }
  else
  {
    id v15 = +[NSMutableDictionary dictionary];
  }
  v16 = v15;
  if (v14)
  {
    id v17 = [objc_alloc((Class)NSString) initWithFormat:v14 arguments:a6];
    if (v17) {
      [v16 setObject:v17 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  id v18 = +[NSError errorWithDomain:v11 code:a2 userInfo:v16];

  return v18;
}

id SUBErrorUserInfo(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v9 = sub_100006BE4(a1, a2, a3, a4, a5, (uint64_t)&a9);
  return v9;
}

uint64_t SUBIsChargerConnected()
{
  CFDictionaryRef v0 = IOServiceMatching("IOPMPowerSource");
  if (!v0) {
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v2 = MatchingService;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, @"ExternalConnected", kCFAllocatorDefault, 0);
  IOObjectRelease(v2);
  if (!CFProperty) {
    return 0;
  }
  uint64_t Value = CFBooleanGetValue(CFProperty);
  CFRelease(CFProperty);
  return Value;
}

id SUBActiveNRDevice()
{
  CFDictionaryRef v0 = +[NRPairedDeviceRegistry sharedInstance];
  v1 = [v0 getAllDevices];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = NRDevicePropertyIsActive;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v9 = objc_msgSend(v8, "valueForProperty:", v6, (void)v13);
        unsigned __int8 v10 = [v9 BOOLValue];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

uint64_t SUBIsRunningInStoreDemoMode()
{
  if (qword_100033CB8 != -1) {
    dispatch_once(&qword_100033CB8, &stru_10002C7D0);
  }
  return byte_100033CB0;
}

void sub_100006F9C(id a1)
{
  byte_100033CB0 = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
}

CFStringRef stringForMAAssetCancelResult(unint64_t a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return *(&off_10002C7F0 + a1);
  }
}

CFStringRef stringForMAAssetPurgeResult(unint64_t a1)
{
  if (a1 > 7) {
    return @"Unknown";
  }
  else {
    return *(&off_10002C828 + a1);
  }
}

void enableNotification(const char *a1)
{
  id v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "Notification", a1);
  xpc_set_event();
}

uint64_t disableNotification()
{
  return xpc_set_event();
}

uint64_t sub_1000070A8()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    uint64_t result = CFPreferencesGetAppIntegerValue(@"SUDefaultsCleanupVersion", @"com.apple.subridge", 0);
    if ((int)result <= 1)
    {
      v1 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v2 = 0;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Resetting asset URLs to default values", v2, 2u);
      }
      ASSetAssetServerURLForAssetType();
      ASSetAssetServerURLForAssetType();
      ASSetAssetServerURLForAssetType();
      ASSetDefaultAssetServerURLForAssetType();
      ASSetDefaultAssetServerURLForAssetType();
      ASSetDefaultAssetServerURLForAssetType();
      CFPreferencesSetAppValue(@"SUDefaultsCleanupVersion", &off_10002F2B8, @"com.apple.subridge");
      return CFPreferencesAppSynchronize(@"com.apple.subridge");
    }
  }
  return result;
}

void SUBLoggingInit()
{
  if (qword_100033CC0 != -1) {
    dispatch_once(&qword_100033CC0, &stru_10002C868);
  }
}

void sub_1000071F8(id a1)
{
  softwareupdatebridge_log = (uint64_t)os_log_create("com.apple.subridge", "Logging");
  _objc_release_x1();
}

CFStringRef SUBStringForManagerState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"Unknown";
  }
  else {
    return (const __CFString *)*((void *)&off_10002C930 + a1 - 1);
  }
}

const char *SUBStringForUserInstallRequestType(unint64_t a1)
{
  if (a1 > 3) {
    return "unknown";
  }
  else {
    return (&off_10002C980)[a1];
  }
}

uint64_t sub_10000728C(uint64_t *a1)
{
  if (qword_100033CD8 != -1) {
    dispatch_once(&qword_100033CD8, &stru_10002C9A0);
  }
  uint64_t v2 = 12;
  if (!byte_100033CD0) {
    uint64_t v2 = 0;
  }
  *a1 = v2;
  return qword_100033CC8;
}

void sub_1000072F4(id a1)
{
  v1 = SUBMessageTypeAddClient[0];
  uint64_t v2 = SUBMessageTypeScanForUpdates[0];
  id v3 = SUBMessageTypeStartDownload[0];
  id v4 = SUBMessageTypeInstallUpdate[0];
  uint64_t v5 = SUBMessageTypeQueryManagerState[0];
  uint64_t v6 = SUBMessageTypeUserDidAcceptTermsAndConditions[0];
  id v7 = SUBMessageTypeUserDidAcceptTermsAndConditionsWithReply[0];
  uint64_t v8 = SUBMessageTypePurgeUpdate[0];
  BOOL v9 = SUBMessageTypeSetUserInstallRequestType[0];
  unsigned __int8 v10 = SUBMessageTypeGetSupportsInstallTonight[0];
  id v12 = SUBMessageTypeGetCloudDescriptors[0];
  long long v13 = SUBMessageTypeRemoveCloudDescriptor[0];
  id v11 = malloc_type_calloc(1uLL, 0x180uLL, 0xBDEBF931uLL);
  qword_100033CC8 = (uint64_t)v11;
  *(void *)id v11 = v1;
  v11[2] = 0x1000000;
  *((void *)v11 + 2) = sub_100007508;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v2;
  v11[10] = 16777217;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 7) = sub_100007584;
  *((void *)v11 + 8) = v3;
  v11[18] = 16777217;
  *((void *)v11 + 10) = 0;
  *((void *)v11 + 11) = sub_1000076D8;
  *((void *)v11 + 12) = v4;
  v11[26] = 16777217;
  *((void *)v11 + 14) = 0;
  *((void *)v11 + 15) = sub_1000078D8;
  *((void *)v11 + 16) = v5;
  v11[34] = 16843009;
  *((void *)v11 + 18) = 0;
  *((void *)v11 + 19) = sub_100007AAC;
  *((void *)v11 + 20) = v6;
  v11[42] = 16777217;
  *((void *)v11 + 22) = 0;
  *((void *)v11 + 23) = 0;
  *((void *)v11 + 24) = v7;
  v11[50] = 16777473;
  *((void *)v11 + 26) = 0;
  *((void *)v11 + 27) = 0;
  *((void *)v11 + 28) = v8;
  v11[58] = 16843009;
  *((void *)v11 + 30) = 0;
  *((void *)v11 + 31) = sub_100007C08;
  *((void *)v11 + 32) = v9;
  v11[66] = 16843009;
  *((void *)v11 + 34) = 0;
  *((void *)v11 + 35) = 0;
  *((void *)v11 + 36) = v10;
  v11[74] = 16777473;
  *((void *)v11 + 38) = 0;
  *((void *)v11 + 39) = 0;
  *((void *)v11 + 40) = v12;
  v11[82] = 0x1000000;
  *((void *)v11 + 42) = sub_100007CF4;
  *((void *)v11 + 43) = 0;
  *((void *)v11 + 44) = v13;
  v11[90] = 0x1000000;
  *((void *)v11 + 46) = sub_100007DA0;
  *((void *)v11 + 47) = 0;
  byte_100033CD0 = 1;
}

void sub_100007508(void *a1, void *a2)
{
  id v3 = (void *)qword_100033CF0;
  id v4 = a2;
  id v5 = a1;
  [v3 addClient:v5];
  [(id)qword_100033CF0 forwardXPCMessage:v4 fromClient:v5];
}

void sub_100007584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = SUBError(@"SUBError", 21, 0, @"Cannot scan while update is being installed", a5, a6, a7, a8, v15);
  BOOL v9 = (void *)qword_100033CF0;
  unsigned __int8 v10 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
  v16[0] = v10;
  id v11 = +[NSString stringWithUTF8String:SUBMessageTypeScanResult[0]];
  v17[0] = v11;
  id v12 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  v16[1] = v12;
  long long v13 = sub_100015E20(v8);
  v17[1] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v9 forwardIDSMessage:v14];
}

void sub_1000076D8(uint64_t a1, void *a2)
{
  uint64_t v2 = SUBMessageDescriptorKey[0];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = sub_10000DEE4(v3, v2, v4);

  unsigned __int8 v10 = SUBError(@"SUBError", 21, 0, @"Cannot start download while update is being installed", v6, v7, v8, v9, v5);
  id v11 = (void *)qword_100033CF0;
  id v12 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
  v21[0] = v12;
  long long v13 = +[NSString stringWithUTF8String:SUBMessageTypeDownloadProgress[0]];
  v22[0] = v13;
  long long v14 = +[NSString stringWithUTF8String:SUBMessageDownloadKey[0]];
  v21[1] = v14;
  uint64_t v15 = +[SUBDownload downloadWithDescriptor:v5 andProgress:0];
  long long v16 = sub_100015E20(v15);
  v22[1] = v16;
  id v17 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  v21[2] = v17;
  id v18 = sub_100015E20(v10);
  v22[2] = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v11 forwardIDSMessage:v19];
}

void sub_1000078D8(uint64_t a1, void *a2)
{
  uint64_t v2 = SUBMessageDescriptorKey[0];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = sub_10000DEE4(v3, v2, v4);

  unsigned __int8 v10 = SUBError(@"SUBError", 21, 0, @"Cannot install update while update is being installed", v6, v7, v8, v9, v19);
  id v11 = (void *)qword_100033CF0;
  id v12 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
  v20[0] = v12;
  long long v13 = +[NSString stringWithUTF8String:SUBMessageTypeInstallResult[0]];
  v21[0] = v13;
  long long v14 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  v20[1] = v14;
  uint64_t v15 = sub_100015E20(v5);
  v21[1] = v15;
  long long v16 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  v20[2] = v16;
  id v17 = sub_100015E20(v10);
  v21[2] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v11 forwardIDSMessage:v18];
}

void sub_100007AAC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[SUBInstallationMonitor sharedInstallationMonitor];
  uint64_t v6 = [v5 descriptorBeingInstalled];

  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    uint64_t v8 = reply;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, SUBMessageManagerStateKey[0], 10);
      sub_10000DDD4(v8, SUBMessageDescriptorKey[0], v6);
      xpc_connection_send_message(v3, v8);
    }
    else
    {
      unsigned __int8 v10 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to create reply to manager state message", v11, 2u);
      }
    }
  }
  else
  {
    uint64_t v9 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "no descriptor being installed while in short circuit handler?", buf, 2u);
    }
  }
}

void sub_100007C08(void *a1, void *a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    uint64_t v9 = SUBMessageErrorKey[0];
    unsigned __int8 v10 = SUBError(@"SUBError", 21, 0, @"cannot purge update while update is being installed", v4, v5, v6, v7, v12);
    sub_10000DDD4(reply, v9, v10);

    xpc_connection_send_message(v3, reply);
  }
  else
  {
    id v11 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed to create reply to manager state message", (uint8_t *)&v12, 2u);
    }
  }
}

void sub_100007CF4(void *a1, void *a2)
{
  connection = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  uint64_t v4 = +[SUBCloudDescriptorManager sharedCloudDescriptorManager];
  uint64_t v5 = [v4 getCloudDescriptors];

  if (reply)
  {
    sub_10000DDD4(reply, SUBMessageDescriptorArrayKey[0], v5);
    xpc_connection_send_message(connection, reply);
  }
}

void sub_100007DA0(uint64_t a1, void *a2)
{
  uint64_t v2 = SUBMessageDescriptorKey[0];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  sub_10000DEE4(v3, v2, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = +[SUBCloudDescriptorManager sharedCloudDescriptorManager];
  [v5 removeCloudDescriptor:v6];
}

void start()
{
  SUBLoggingInit();
  v1 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Subridged starting up. Setting up tmp dir", buf, 2u);
  }
  char v2 = _set_user_dir_suffix();
  id v3 = softwareupdatebridge_log;
  BOOL v4 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = v3;
      id v6 = NSTemporaryDirectory();
      *(_DWORD *)buf = 138412290;
      v66 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "tmp directory for subridged set to %@", buf, 0xCu);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to set up tmp directory for subridged", buf, 2u);
  }
  sub_1000070A8();
  uint64_t v7 = objc_alloc_init(SUBMessageEndpoint);
  uint64_t v8 = (void *)qword_100033CE8;
  qword_100033CE8 = (uint64_t)v7;

  uint64_t v9 = objc_alloc_init(SUBBridgeServer);
  unsigned __int8 v10 = (void *)qword_100033CF0;
  qword_100033CF0 = (uint64_t)v9;

  [(id)qword_100033CF0 setEndpoint:qword_100033CE8];
  id v11 = [[SUBTaskSerializer alloc] initWithQueueLabel:"com.apple.subridge.MessageSerializer.Incoming"];
  uint64_t v12 = (void *)qword_100033CF8;
  qword_100033CF8 = (uint64_t)v11;

  long long v13 = objc_alloc_init(SUBDocumentationFetcher);
  long long v14 = (void *)qword_100033CE0;
  qword_100033CE0 = (uint64_t)v13;

  uint64_t v15 = (void *)qword_100033CE8;
  long long v16 = +[NSString stringWithUTF8String:SUBMessageTypeFetchDocumentation[0]];
  [v15 setHandler:&stru_10002C9E0 forMessagesOfType:v16];

  id v17 = (void *)qword_100033CE8;
  id v18 = +[NSString stringWithUTF8String:SUBMessageTypeDownloadProgress[0]];
  [v17 setHandler:&stru_10002CA28 forMessagesOfType:v18];

  uint64_t v19 = (void *)qword_100033CE8;
  id v20 = +[NSString stringWithUTF8String:SUBMessageTypeInstallationCanProceed[0]];
  v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", SUBMessageTypeInstallationWillProceed[0], v20);
  v64[1] = v21;
  v22 = +[NSArray arrayWithObjects:v64 count:2];
  [v19 setHandler:&stru_10002CA98 forMessagesOfTypes:v22];

  uint64_t v23 = (void *)qword_100033CE8;
  __int16 v24 = +[NSString stringWithUTF8String:SUBMessageTypeShowDownloadAndPrepareError[0]];
  [v23 setHandler:&stru_10002CAB8 forMessagesOfType:v24];

  id v25 = (void *)qword_100033CE8;
  v26 = +[NSString stringWithUTF8String:SUBMessageTypeScanResult[0]];
  [v25 setHandler:&stru_10002CB00 forMessagesOfType:v26];

  v27 = (void *)qword_100033CE8;
  v28 = +[NSString stringWithUTF8String:SUBMessageTypeInstallResult[0]];
  [v27 setHandler:&stru_10002CB20 forMessagesOfType:v28];

  v29 = (void *)qword_100033CE8;
  v30 = +[NSString stringWithUTF8String:SUBMessageTypeShowInstallError[0]];
  [v29 setHandler:&stru_10002CB40 forMessagesOfType:v30];

  v31 = (void *)qword_100033CE8;
  v32 = +[NSString stringWithUTF8String:SUBMessageTypeRetrieveSsoToken[0]];
  [v31 setHandler:&stru_10002CB60 forMessagesOfType:v32];

  v33 = (void *)qword_100033CE8;
  v34 = +[NSString stringWithUTF8String:SUBMessageTypeBadgeBridgeApp[0]];
  [v33 setHandler:&stru_10002CBA8 forMessagesOfType:v34];

  v35 = (void *)qword_100033CE8;
  v36 = +[NSString stringWithUTF8String:SUBMessageTypeShowUpdateAvailable[0]];
  [v35 setHandler:&stru_10002CBE8 forMessagesOfType:v36];

  v37 = (void *)qword_100033CE8;
  v38 = +[NSString stringWithUTF8String:SUBMessageTypeCreateStashBag[0]];
  [v37 setHandler:&stru_10002CC28 forMessagesOfType:v38];

  v39 = (void *)qword_100033CE8;
  v40 = +[NSString stringWithUTF8String:SUBMessageTypePerformMigration[0]];
  [v39 setHandler:&stru_10002CCC0 forMessagesOfType:v40];

  v41 = (void *)qword_100033CE8;
  v42 = +[NSString stringWithUTF8String:SUBMessageTypeUserDidAcceptTermsAndConditionsChanged[0]];
  [v41 setHandler:&stru_10002CCE0 forMessagesOfType:v42];

  v43 = (void *)qword_100033CE8;
  v44 = +[NSString stringWithUTF8String:SUBMessageTypeUserInstallRequestTypeChanged[0]];
  [v43 setHandler:&stru_10002CD00 forMessagesOfType:v44];

  v45 = (void *)qword_100033CE8;
  v46 = +[NSString stringWithUTF8String:SUBMessageTypeGetCompanionLockState[0]];
  [v45 setHandler:&stru_10002CD20 forMessagesOfType:v46];

  v47 = (void *)qword_100033CE8;
  v48 = +[NSString stringWithUTF8String:SUBMessageTypeUnlockCompanion[0]];
  [v47 setHandler:&stru_10002CD40 forMessagesOfType:v48];

  v49 = (void *)qword_100033CE8;
  v50 = +[NSString stringWithUTF8String:SUBMessageTypePresentingAlertOnGizmo[0]];
  [v49 setHandler:&stru_10002CD80 forMessagesOfType:v50];

  v51 = (void *)qword_100033CE8;
  v52 = +[NSString stringWithUTF8String:SUBMessageTypeGizmoOSVersionDidChange[0]];
  [v51 setHandler:&stru_10002CDA0 forMessagesOfType:v52];

  v53 = (void *)qword_100033CE8;
  v54 = +[NSString stringWithUTF8String:SUBMessageTypeShowDuetConditions[0]];
  [v53 setHandler:&stru_10002CDC0 forMessagesOfType:v54];

  [(id)qword_100033CE8 resume];
  v55 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "resumed IDS endpoint", buf, 2u);
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(off_100033A50, 0, 1uLL);
  v57 = (void *)qword_100033D00;
  qword_100033D00 = (uint64_t)mach_service;

  if (!qword_100033D00)
  {
    v58 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Failed to create mach service listener connection", buf, 2u);
    }
    abort();
  }
  v59 = (void *)qword_100033CE8;
  v60 = +[NSString stringWithUTF8String:SUBMessageTypeDisplayTerms[0]];
  [v59 setHandler:&stru_10002CDE0 forMessagesOfType:v60];

  v61 = (void *)qword_100033CE8;
  v62 = +[NSString stringWithUTF8String:SUBMessageTypeDisplayTermsCloud[0]];
  [v61 setHandler:&stru_10002CE40 forMessagesOfType:v62];

  xpc_connection_set_event_handler((xpc_connection_t)qword_100033D00, &stru_10002CEE0);
  xpc_connection_activate((xpc_connection_t)qword_100033D00);
  v63 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "activated XPC peer connection listener", buf, 2u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, &stru_10002CFF0);
  CFRunLoopRun();
  exit(1);
}

void sub_10000860C(id a1, NSDictionary *a2, NSString *a3)
{
  BOOL v4 = a2;
  uint64_t v5 = a3;
  id v6 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = sub_100015EC8(v4, v6, v7);

  if (v8)
  {
    if (MGGetBoolAnswer())
    {
      uint64_t v9 = +[NSString stringWithUTF8String:SUBMessageDocumentationAssetServerURLKey[0]];
      unsigned __int8 v10 = [(NSDictionary *)v4 objectForKey:v9];

      BOOL v11 = v10 != 0;
      if (v10)
      {
        uint64_t v12 = +[NSURL URLWithString:v10];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      BOOL v11 = 0;
    }
    uint64_t v19 = [[SUBTransaction alloc] initWithName:@"FetchingDocumentation"];
    id v20 = (void *)qword_100033CE0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100008878;
    void v22[3] = &unk_10002CA08;
    uint64_t v23 = v5;
    __int16 v24 = v19;
    v21 = v19;
    [v20 fetchDocumentationForDescriptor:v8 localOnly:0 shouldOverrideURL:v11 overrideURL:v12 completion:v22];
  }
  else
  {
    long long v13 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "malformed fetch documentation message", buf, 2u);
    }
    id v18 = (void *)qword_100033CE8;
    uint64_t v12 = SUBError(@"SUBError", 1, 0, @"Missing %s key in message", v14, v15, v16, v17, (uint64_t)SUBMessageDescriptorKey[0]);
    [v18 sendErrorReply:v12 toMessage:v5 isCritical:1];
  }
}

void sub_100008878(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [(id)qword_100033CE8 sendErrorReply:v6 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  else
  {
    uint64_t v7 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "successful doc download; sending reply",
        v12,
        2u);
    }
    uint64_t v8 = (void *)qword_100033CE8;
    uint64_t v9 = +[NSString stringWithUTF8String:SUBMessageDocumentationKey[0]];
    long long v13 = v9;
    unsigned __int8 v10 = sub_100015E20(v5);
    uint64_t v14 = v10;
    BOOL v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v8 sendReply:v11 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  [*(id *)(a1 + 40) invalidate];
}

void sub_1000089EC(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = a2;
  BOOL v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008A84;
  v6[3] = &unk_10002CA78;
  uint64_t v7 = v3;
  id v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_100008A84(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008E10;
  v6[3] = &unk_10002CA50;
  id v7 = v3;
  id v5 = v3;
  sub_100008B1C(v4, v6);
}

void sub_100008B1C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000CD14;
  v29[3] = &unk_10002D080;
  id v5 = v3;
  id v30 = v5;
  id v6 = objc_retainBlock(v29);
  id v7 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = sub_100015EC8(v5, v7, v8);

  if (v9
    && ([v9 documentation], unsigned __int8 v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000CFB0;
    v25[3] = &unk_10002D0A8;
    id v26 = v5;
    id v27 = v9;
    id v28 = v4;
    ((void (*)(void *, id, void *))v6[2])(v6, v27, v25);
  }
  else
  {
    BOOL v11 = +[NSString stringWithUTF8String:SUBMessageDownloadKey[0]];
    uint64_t v12 = objc_opt_class();
    long long v13 = sub_100015EC8(v5, v11, v12);

    uint64_t v14 = [v13 descriptor];
    uint64_t v15 = v14;
    if (v14
      && ([v14 documentation], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v16, !v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000D0B4;
      void v20[3] = &unk_10002D0D0;
      id v21 = v5;
      id v22 = v15;
      id v23 = v13;
      id v24 = v4;
      uint64_t v17 = (void (*)(void *, id, void *))v6[2];
      id v18 = v13;
      id v19 = v15;
      v17(v6, v19, v20);
    }
    else
    {

      (*((void (**)(id, id))v4 + 2))(v4, v5);
    }
  }
}

uint64_t sub_100008E10(uint64_t a1, uint64_t a2)
{
  [(id)qword_100033CF0 forwardIDSMessage:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void sub_100008E5C(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = a2;
  id v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008EF4;
  v6[3] = &unk_10002CA78;
  id v7 = v3;
  id v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_100008EF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008F8C;
  v6[3] = &unk_10002CA50;
  id v7 = v3;
  id v5 = v3;
  sub_100008B1C(v4, v6);
}

uint64_t sub_100008F8C(uint64_t a1, uint64_t a2)
{
  [(id)qword_100033CF0 forwardIDSMessage:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void sub_100008FD8(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = a2;
  id v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009070;
  v6[3] = &unk_10002CAE0;
  id v7 = v3;
  id v5 = v3;
  [v4 enqueueSynchronousTask:v6];
}

void sub_100009070(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  char v2 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  uint64_t v3 = objc_opt_class();
  id v4 = sub_100015EC8(v1, v2, v3);

  id v5 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 userInfo];
    int v9 = 138543618;
    unsigned __int8 v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Download error: %{public}@ with userInfo: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = objc_alloc_init(SUBUserNotification);
  [(SUBUserNotification *)v8 showDownloadAndPrepareError:v4];
}

void sub_1000091B0(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a2;
  id v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009248;
  v6[3] = &unk_10002CA78;
  id v7 = v3;
  id v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_100009248(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
    uint64_t v9 = objc_opt_class();
    unsigned __int8 v10 = sub_100015EC8(v7, v8, v9);

    if ([v10 code] == (id)4) {
      sub_100009394(0);
    }
  }
  __int16 v11 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000095D0;
  v13[3] = &unk_10002CA50;
  id v14 = v3;
  id v12 = v3;
  sub_100008B1C(v11, v13);
}

void sub_100009394(int a1)
{
  memcpy(__dst, "com.apple.Bridge", sizeof(__dst));
  SBSSpringBoardServerPort();
  int v2 = SBSetApplicationBadgeNumber();
  if (v2)
  {
    int v3 = v2;
    id v4 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67240192;
      LODWORD(v17) = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "failed to badge bridge app: %{public}d", (uint8_t *)&v16, 8u);
    }
  }
  id v5 = SUBActiveNRDevice();
  id v6 = [v5 valueForProperty:NRDevicePropertyPairingID];
  uint64_t v7 = [v5 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    unsigned __int8 v10 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to get pairingID and pairingDataStorePath. Skipping badging.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    id v11 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Bridge" pairingID:v6 pairingDataStore:v7];
    id v12 = v11;
    if (v11)
    {
      [v11 setBool:a1 > 0 forKey:@"kBadgedForSoftwareUpdateKey"];
      id v13 = [v12 synchronize];
    }
    else
    {
      id v14 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        uint64_t v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to instantiate domain accessor; paired device info: %@",
          (uint8_t *)&v16,
          0xCu);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.Bridge.badgeUpdate", 0, 0, 0);
  }
}

uint64_t sub_1000095D0(uint64_t a1, uint64_t a2)
{
  [(id)qword_100033CF0 forwardIDSMessage:a2];
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void sub_10000961C(id a1, NSDictionary *a2, NSString *a3)
{
  int v3 = a2;
  id v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000096B4;
  v6[3] = &unk_10002CA78;
  uint64_t v7 = v3;
  id v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_1000096B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    unsigned __int8 v10 = SUBMessageTypeInstallResult[0];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received %{public}s", buf, 0xCu);
  }
  id v5 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000097E0;
  v7[3] = &unk_10002CA50;
  id v8 = v3;
  id v6 = v3;
  sub_100008B1C(v5, v7);
}

void sub_1000097E0(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  uint64_t v4 = objc_opt_class();
  id v5 = sub_100015EC8(v10, v3, v4);

  if (!v5)
  {
    sub_100009394(0);
    id v6 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
    uint64_t v7 = objc_opt_class();
    id v8 = sub_100015EC8(v10, v6, v7);

    BOOL v9 = +[SUBInstallationMonitor sharedInstallationMonitor];
    [v9 gizmoDidBeginInstallingDescriptor:v8];
  }
  [(id)qword_100033CF0 forwardIDSMessage:v10];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000990C(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = a2;
  uint64_t v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000099A4;
  v6[3] = &unk_10002CAE0;
  uint64_t v7 = v3;
  id v5 = v3;
  [v4 enqueueSynchronousTask:v6];
}

void sub_1000099A4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  int v2 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = sub_100015EC8(v1, v2, v3);

  if (v4)
  {
    id v5 = (void *)softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = [v4 userInfo];
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Install error %{public}@ with userInfo %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  id v8 = objc_alloc_init(SUBUserNotification);
  [(SUBUserNotification *)v8 showInstallationError:v4];
}

void sub_100009AE8(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = [[SUBTransaction alloc] initWithName:@"RetrievingSsoToken"];
  id v5 = objc_alloc_init(SUBAppleConnectSSO);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009BCC;
  v8[3] = &unk_10002CB88;
  int v9 = v3;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = v3;
  [(SUBAppleConnectSSO *)v5 retrieveSSOToken:v8];
}

void sub_100009BCC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)qword_100033CE8;
  if (a3)
  {
    [(id)qword_100033CE8 sendErrorReply:a3 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  else
  {
    uint64_t v7 = +[NSString stringWithUTF8String:SUBMessageSsoTokenKey[0]];
    id v10 = v7;
    id v8 = sub_100015E20(v5);
    __int16 v11 = v8;
    int v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v6 sendReply:v9 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  [*(id *)(a1 + 40) invalidate];
}

void sub_100009CE4(id a1, NSDictionary *a2, NSString *a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  AppBooleanuint64_t Value = CFPreferencesGetAppBooleanValue(@"SUDisableAvailabilityAlerts", @"com.apple.subridge", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    [(id)qword_100033CF8 enqueueSynchronousTask:&stru_10002CBC8];
  }
  else
  {
    id v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not displaying update alert due to default setting", v7, 2u);
    }
  }
}

void sub_100009D90(id a1)
{
}

void sub_100009D98(id a1, NSDictionary *a2, NSString *a3)
{
}

void sub_100009DAC(id a1)
{
  id v10 = objc_alloc_init(SUBUserNotification);
  v1 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  int v2 = [v1 localizedStringForKey:@"UPDATE_AVAILABLE_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  uint64_t v3 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  BOOL v4 = [v3 localizedStringForKey:@"UPDATE_AVAILABLE_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  id v5 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v6 = [v5 localizedStringForKey:@"DETAILS_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  uint64_t v7 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v8 = [v7 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  LOBYTE(v9) = 1;
  [(SUBUserNotification *)v10 showUserNotificationHeader:v2 message:v4 internalMessage:0 defButton:v6 altButton:v8 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK" showOnLockLockScreen:v9 dismissalHandler:0];
}

void sub_100009F44(id a1, NSDictionary *a2, NSString *a3)
{
  BOOL v4 = a3;
  id v5 = a2;
  id v6 = [[SUBTransaction alloc] initWithName:@"CreatingStashBag"];
  uint64_t v7 = objc_alloc_init(SUBPairedUnlockManager);
  id v8 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v9 = objc_opt_class();
  id v10 = sub_100015EC8(v5, v8, v9);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A0B4;
  v15[3] = &unk_10002CCA0;
  int v16 = v4;
  id v17 = v10;
  id v18 = v7;
  id v19 = v6;
  __int16 v11 = v6;
  id v12 = v7;
  id v13 = v10;
  id v14 = v4;
  [(SUBPairedUnlockManager *)v12 supportsPairedUnlock:v15];
}

void sub_10000A0B4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = softwareupdatebridge_log;
  BOOL v7 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to determine if device supports paired unlock: %{public}@", buf, 0xCu);
    }
    [(id)qword_100033CE8 sendErrorReply:v5 toMessage:*(void *)(a1 + 32) isCritical:1];
    goto LABEL_25;
  }
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "paired unlock supported", buf, 2u);
    }
    int v8 = MKBGetDeviceLockState();
    if ([*(id *)(a1 + 40) userInstallRequestType] != (id)3 || !v8 || v8 == 3)
    {
      disableNotification();
      uint64_t v9 = *(void **)(a1 + 48);
      id v10 = [*(id *)(a1 + 40) manifest];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000A67C;
      v31[3] = &unk_10002CC78;
      id v32 = *(id *)(a1 + 32);
      id v33 = *(id *)(a1 + 56);
      [v9 stageStashBagWithManifest:v10 completion:v31];

      goto LABEL_25;
    }
    enableNotification("com.apple.mobile.keybagd.lock_status");
    id v22 = (void *)qword_100033CE8;
    id v23 = +[NSString stringWithUTF8String:SUBMessageCreateStashBagResponseKey[0]];
    v38 = v23;
    id v24 = +[NSString stringWithUTF8String:SUBMessagePairedUnlockPending[0]];
    v39 = v24;
    id v25 = NSDictionary;
    id v26 = &v39;
    id v27 = &v38;
LABEL_19:
    id v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
    [v22 sendReply:v28 toMessage:*(void *)(a1 + 32) isCritical:1];

    goto LABEL_25;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "paired unlock not supported", buf, 2u);
  }
  __int16 v11 = &AMAuthInstallSsoCreateServiceTicket_ptr;
  if ([*(id *)(a1 + 40) userInstallRequestType] == (id)3)
  {
LABEL_18:
    id v22 = (void *)qword_100033CE8;
    id v23 = +[NSString stringWithUTF8String:SUBMessageCreateStashBagResponseKey[0]];
    v40 = v23;
    id v24 = +[NSString stringWithUTF8String:SUBMessagePairedUnlockNotSupported[0]];
    v41 = v24;
    id v25 = v11[178];
    id v26 = &v41;
    id v27 = &v40;
    goto LABEL_19;
  }
  v42[0] = kCFUserNotificationAlertHeaderKey;
  id v30 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v12 = [v30 localizedStringForKey:@"ENTER_PASSCODE_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v43[0] = v12;
  v42[1] = kCFUserNotificationAlertMessageKey;
  id v13 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v14 = [v13 localizedStringForKey:@"ENTER_PASSCODE_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v43[1] = v14;
  v42[2] = kCFUserNotificationDefaultButtonTitleKey;
  uint64_t v15 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  int v16 = [v15 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v43[2] = v16;
  CFDictionaryRef v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

  SInt32 error = -1;
  CFUserNotificationRef v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, v17);
  if (v18 && !error)
  {
    id v19 = [[SUBTransaction alloc] initWithName:@"ShowingUserNotification"];
    id v20 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A638;
    block[3] = &unk_10002CC50;
    v35 = v19;
    CFUserNotificationRef v36 = v18;
    id v21 = v19;
    dispatch_async(v20, block);

    __int16 v11 = &AMAuthInstallSsoCreateServiceTicket_ptr;
    goto LABEL_18;
  }
  v29 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v45) = error;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "failed to display notification: %{public}d", buf, 8u);
  }
  if (v18) {
    CFRelease(v18);
  }

LABEL_25:
}

void sub_10000A638(uint64_t a1)
{
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, 0);
  int v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void sub_10000A67C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = softwareupdatebridge_log;
  BOOL v5 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "failed to stage stash bag on gizmo: %{public}@", buf, 0xCu);
    }
    [(id)qword_100033CE8 sendErrorReply:v3 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did stage stash bag on gizmo", buf, 2u);
    }
    id v6 = (void *)qword_100033CE8;
    BOOL v7 = +[NSString stringWithUTF8String:SUBMessageCreateStashBagResponseKey[0]];
    int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", SUBMessageCreatedStashBagResponse[0], v7);
    __int16 v11 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v6 sendReply:v9 toMessage:*(void *)(a1 + 32) isCritical:1];
  }
  [*(id *)(a1 + 40) invalidate];
}

void sub_10000A81C(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = SUBMessageDescriptorKey[0];
  BOOL v4 = a2;
  BOOL v5 = +[NSString stringWithUTF8String:v3];
  uint64_t v6 = objc_opt_class();
  BOOL v7 = sub_100015EC8(v4, v5, v6);

  int v8 = [[SUBTransaction alloc] initWithName:@"PurgingUpdateAssets"];
  uint64_t v9 = (void *)qword_100033CE0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A938;
  v11[3] = &unk_10002CAE0;
  id v12 = v8;
  uint64_t v10 = v8;
  [v9 purgeAssetsNotMatchingDescriptor:v7 completion:v11];
}

id sub_10000A938(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000A940(id a1, NSDictionary *a2, NSString *a3)
{
  id v3 = a2;
  BOOL v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A9D8;
  v6[3] = &unk_10002CA78;
  BOOL v7 = v3;
  BOOL v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_10000A9D8(uint64_t a1, void *a2)
{
  int v2 = (void *)qword_100033CF0;
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = a2;
  [v2 forwardIDSMessage:v3];
  v4[2]();
}

void sub_10000AA40(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a2;
  BOOL v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000AAD8;
  v6[3] = &unk_10002CA78;
  BOOL v7 = v3;
  BOOL v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_10000AAD8(uint64_t a1, void *a2)
{
  int v2 = (void *)qword_100033CF0;
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = a2;
  [v2 forwardIDSMessage:v3];
  v4[2]();
}

void sub_10000AB40(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a3;
  BOOL v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[SUBPairedUnlockManager lockState]);
  BOOL v5 = (void *)qword_100033CE8;
  uint64_t v6 = +[NSString stringWithUTF8String:SUBMessageCompanionLockState[0]];
  uint64_t v9 = v6;
  BOOL v7 = sub_100015E20(v4);
  uint64_t v10 = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v5 sendReply:v8 toMessage:v3 isCritical:1];
}

void sub_10000AC58(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = SUBMessageDescriptorKey[0];
  BOOL v4 = a2;
  BOOL v5 = +[NSString stringWithUTF8String:v3];
  uint64_t v6 = objc_opt_class();
  BOOL v7 = sub_100015EC8(v4, v5, v6);

  CFDictionaryRef v17 = objc_alloc_init(SUBUserNotification);
  CFUserNotificationRef v18 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  int v8 = [v18 localizedStringForKey:@"UNLOCK_COMPANION_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  uint64_t v9 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  uint64_t v10 = [v9 localizedStringForKey:@"UNLOCK_COMPANION_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  __int16 v11 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v12 = [v11 localizedStringForKey:@"OK_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  id v13 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v14 = [v13 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000AEA4;
  v19[3] = &unk_10002CAE0;
  id v20 = v7;
  id v15 = v7;
  LOBYTE(v16) = 1;
  [(SUBUserNotification *)v17 showUserNotificationHeader:v8 message:v10 internalMessage:0 defButton:v12 altButton:v14 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK" showOnLockLockScreen:v16 dismissalHandler:v19];
}

void sub_10000AEA4(uint64_t a1)
{
  int v2 = (void *)qword_100033CE8;
  uint64_t v3 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
  v8[0] = v3;
  BOOL v4 = +[NSString stringWithUTF8String:SUBMessageTypeInstallUpdate[0]];
  v9[0] = v4;
  BOOL v5 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  v8[1] = v5;
  uint64_t v6 = sub_100015E20(*(void **)(a1 + 32));
  v9[1] = v6;
  BOOL v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v2 sendMessage:v7 isCritical:1 completion:&stru_10002CD60];
}

void sub_10000AFD4(id a1, NSError *a2)
{
  int v2 = a2;
  if (v2)
  {
    uint64_t v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      BOOL v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to send install update message: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10000B084(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a2;
  int v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B11C;
  v6[3] = &unk_10002CA78;
  BOOL v7 = v3;
  BOOL v5 = v3;
  [v4 enqueueAsynchronousTask:v6];
}

void sub_10000B11C(uint64_t a1, void *a2)
{
  int v2 = (void *)qword_100033CF0;
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = a2;
  [v2 forwardIDSMessage:v3];
  v4[2]();
}

void sub_10000B184(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[GizmoOSVersionDidChange]: handling IDS message from watch", v5, 2u);
  }
  int v4 = +[SUBInstallationMonitor sharedInstallationMonitor];
  [v4 gizmoUpdateCompleted];
}

void sub_10000B208(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a2;
  int v4 = (void *)qword_100033CF8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B2A0;
  v6[3] = &unk_10002CAE0;
  BOOL v7 = v3;
  BOOL v5 = v3;
  [v4 enqueueSynchronousTask:v6];
}

void sub_10000B2A0(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  int v2 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v3 = objc_opt_class();
  sub_100015EC8(v1, v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  int v4 = objc_alloc_init(SUBUserNotification);
  [(SUBUserNotification *)v4 showDuetConditions:v5];
}

void sub_10000B340(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Want to display terms notification... checking if still needed", v7, 2u);
  }
  int v4 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
  int v8 = v4;
  id v5 = +[NSString stringWithUTF8String:SUBMessageTypeQueryManagerState[0]];
  uint64_t v9 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [(id)qword_100033CE8 sendMessage:v6 isCritical:1 withReply:&stru_10002CE20];
}

void sub_10000B468(id a1, NSDictionary *a2, NSError *a3)
{
  int v4 = a2;
  id v5 = v4;
  if (!a3)
  {
    uint64_t v6 = (void *)qword_100033CF8;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B508;
    v7[3] = &unk_10002CAE0;
    int v8 = v4;
    [v6 enqueueSynchronousTask:v7];
  }
}

void sub_10000B508(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  int v2 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v3 = objc_opt_class();
  int v4 = sub_100015EC8(v1, v2, v3);

  if ([v4 displayTermsRequested]
    && ([v4 userDidAcceptTermsAndConditions] & 1) == 0)
  {
    uint64_t v6 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFUserNotificationRef v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Displaying terms notification", v18, 2u);
    }
    id v15 = objc_alloc_init(SUBUserNotification);
    uint64_t v16 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    BOOL v7 = [v16 localizedStringForKey:@"TERMS_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    int v8 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    uint64_t v9 = [v8 localizedStringForKey:@"TERMS_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    uint64_t v10 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    __int16 v11 = [v10 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    id v12 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    id v13 = [v12 localizedStringForKey:@"LATER_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    LOBYTE(v14) = 1;
    [(SUBUserNotification *)v15 showUserNotificationHeader:v7 message:v9 internalMessage:0 defButton:v11 altButton:v13 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK&terms=YES" showOnLockLockScreen:v14 dismissalHandler:0];
  }
  else
  {
    id v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Don't need to display terms notification", buf, 2u);
    }
  }
}

void sub_10000B78C(id a1, NSDictionary *a2, NSString *a3)
{
  uint64_t v3 = a2;
  int v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received Terms request from the cloud", buf, 2u);
  }
  id v5 = objc_alloc_init((Class)NRTermsAcknowledgementRegistry);
  uint64_t v6 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v7 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_10002CE80];
  int v8 = [v7 lastObject];

  uint64_t v9 = [v8 valueForProperty:NRDevicePropertyPairingID];
  id v10 = [objc_alloc((Class)NRTermsEvent) initWithDeviceID:v9];
  __int16 v11 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v12 = objc_opt_class();
  id v13 = sub_100015EC8(v3, v11, v12);

  uint64_t v14 = [v13 documentation];
  id v15 = [v14 licenseAgreement];
  [v10 setTermsText:v15];

  [v10 setPresentationReason:@"software update"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000BA18;
  void v20[3] = &unk_10002CCA0;
  id v21 = v10;
  id v22 = v5;
  id v23 = v9;
  id v24 = v13;
  id v16 = v13;
  id v17 = v9;
  id v18 = v5;
  id v19 = v10;
  [v18 checkForAcknowledgement:v19 forDeviceID:v17 withCompletion:v20];
}

BOOL sub_10000B9D4(id a1, NRDevice *a2)
{
  int v2 = [(NRDevice *)a2 valueForProperty:NRDevicePropertyIsArchived];
  BOOL v3 = v2 == 0;

  return v3;
}

void sub_10000BA18(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) setEventType:4];
    [*(id *)(a1 + 40) add:*(void *)(a1 + 32) forDeviceID:*(void *)(a1 + 48) withCompletion:&stru_10002CEA0];
  }
  else
  {
    id v30 = v5;
    v29 = +[SUBCloudDescriptorManager sharedCloudDescriptorManager];
    [v29 getCloudDescriptors];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v33;
      while (2)
      {
        __int16 v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v11) documentation];
          id v13 = [v12 licenseAgreement];
          uint64_t v14 = [*(id *)(a1 + 56) documentation];
          id v15 = [v14 licenseAgreement];
          unsigned int v16 = [v13 isEqualToData:v15];

          if (v16)
          {
            id v25 = softwareupdatebridge_log;
            if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found equivalent terms, not posting notification", buf, 2u);
            }

            goto LABEL_15;
          }
          __int16 v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v17 = +[SUBCloudDescriptorManager sharedCloudDescriptorManager];
    [v17 saveCloudDescriptor:*(void *)(a1 + 56)];

    id v27 = objc_alloc_init(SUBUserNotification);
    id v28 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    id v18 = [v28 localizedStringForKey:@"TERMS_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    id v19 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    id v20 = [v19 localizedStringForKey:@"TERMS_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    id v21 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    id v22 = [v21 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    id v23 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    id v24 = [v23 localizedStringForKey:@"LATER_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    LOBYTE(v26) = 1;
    [(SUBUserNotification *)v27 showUserNotificationHeader:v18 message:v20 internalMessage:0 defButton:v22 altButton:v24 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK&terms=YES" showOnLockLockScreen:v26 dismissalHandler:0];

LABEL_15:
    uint64_t v6 = v30;
  }
}

void sub_10000BD88(id a1, NSError *a2)
{
  int v2 = a2;
  uint64_t v3 = softwareupdatebridge_log;
  BOOL v4 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "Unable to broadcast terms acceptance: %@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "Sent terms add to all watches";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

void sub_10000BE64(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "event on peer listener", buf, 2u);
  }
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint32_t v7 = v2;
    BOOL v8 = sub_10000E150();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000C05C;
    v11[3] = &unk_10002CFD0;
    id v9 = v7;
    uint64_t v12 = v9;
    BOOL v13 = v8;
    xpc_connection_set_event_handler(v9, v11);
    xpc_connection_activate(v9);
    uint64_t v10 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "activated peer connection", buf, 2u);
    }
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error) {
      sub_10001D800(v2);
    }
    id v5 = xpc_copy_description(v2);
    uint64_t v6 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unexpected type on peer listener connection: %{public}s", buf, 0xCu);
    }
    if (v5) {
      free(v5);
    }
  }
}

void sub_10000C05C(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  BOOL v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 134218240;
    id v45 = v3;
    __int16 v46 = 2048;
    v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "got message %p on peer connection %p", buf, 0x16u);
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    __int16 v11 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      id v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "got xpc error on peer connection %p", buf, 0xCu);
    }
    [(id)qword_100033CF0 removeClient:*(void *)(a1 + 32)];
    BOOL v13 = (void *)softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(const char **)(a1 + 32);
      id v15 = v13;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      *(_DWORD *)buf = 134218242;
      id v45 = v14;
      __int16 v46 = 2082;
      v47 = string;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "got xpc error on peer connection %p: %{public}s", buf, 0x16u);
    }
    goto LABEL_15;
  }
  uint64_t v6 = xpc_dictionary_get_string(v3, SUBMessageTypeKey[0]);
  if (qword_100033CD8 != -1) {
    dispatch_once(&qword_100033CD8, &stru_10002C9A0);
  }
  if (byte_100033CD0 == 1)
  {
    uint64_t v7 = qword_100033CC8 + 12;
    uint64_t v8 = -1;
    while (1)
    {
      id v9 = *(const char **)(v7 - 12);
      size_t v10 = strlen(v9);
      if (!strncmp(v6, v9, v10)) {
        break;
      }
      v7 += 32;
      if ((unint64_t)++v8 >= 0xB) {
        goto LABEL_16;
      }
    }
    char v17 = *(unsigned char *)(v7 - 4);
    char v18 = *(unsigned char *)(v7 - 1);
    id v19 = *(void (**)(void, void))(v7 + 4);
    if ((v18 & 1) == 0 || *(unsigned char *)(a1 + 40))
    {
      if (*(unsigned char *)(v7 - 4))
      {
        int v28 = *(_DWORD *)v7;
        char v29 = *(unsigned char *)(v7 - 2);
        char v30 = *(unsigned char *)(v7 - 3);
        v31 = *(void (**)(void, char *))(v7 + 12);
        id v20 = +[SUBInstallationMonitor sharedInstallationMonitor];
        id v21 = [v20 descriptorBeingInstalled];

        if (v21)
        {
          id v22 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            id v45 = v6;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "gizmo is installing; short circuiting message of type %{public}s",
              buf,
              0xCu);
          }
          if (v31) {
            v31(*(void *)(a1 + 32), v3);
          }
        }
        else if (v30)
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v3);
          id v27 = (void *)qword_100033CF0;
          uint64_t v25 = *(void *)(a1 + 32);
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10000C4E4;
          v32[3] = &unk_10002CFA8;
          long long v33 = v3;
          id v34 = reply;
          id v35 = *(id *)(a1 + 32);
          CFUserNotificationRef v36 = v9;
          char v37 = v17;
          char v38 = v30;
          char v39 = v29;
          char v40 = v18;
          int v41 = v28;
          v42 = v19;
          v43 = (void (*)(void, void))v31;
          id v26 = reply;
          [v27 forwardXPCMessage:v33 fromClient:v25 withReply:v32];
        }
        else
        {
          [(id)qword_100033CF0 forwardXPCMessage:v3 fromClient:*(void *)(a1 + 32)];
        }
      }
      else if (v19)
      {
        v19(*(void *)(a1 + 32), v3);
      }
      else
      {
        id v23 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          id v45 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "unhandled message of type %{public}s", buf, 0xCu);
        }
      }
      goto LABEL_16;
    }
LABEL_15:
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
LABEL_16:
}

void sub_10000C4E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)qword_100033CF8;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C704;
    void v20[3] = &unk_10002CF08;
    uint64_t v8 = &v21;
    id v21 = *(id *)(a1 + 32);
    id v9 = &v22;
    id v22 = *(id *)(a1 + 40);
    size_t v10 = &v23;
    id v23 = v6;
    id v24 = *(id *)(a1 + 48);
    [v7 enqueueSynchronousTask:v20];
  }
  else
  {
    __int16 v11 = (void *)qword_100033CF8;
    if (*(unsigned char *)(a1 + 66))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      void v16[2] = sub_10000C7F0;
      v16[3] = &unk_10002CF58;
      uint64_t v8 = &v17;
      id v17 = v5;
      id v9 = &v18;
      id v18 = *(id *)(a1 + 40);
      size_t v10 = &v19;
      id v19 = *(id *)(a1 + 48);
      [v11 enqueueAsynchronousTask:v16];
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000C918;
      v12[3] = &unk_10002CF80;
      uint64_t v8 = &v13;
      id v13 = v5;
      id v9 = &v14;
      id v14 = *(id *)(a1 + 40);
      size_t v10 = &v15;
      id v15 = *(id *)(a1 + 48);
      [v11 enqueueSynchronousTask:v12];
    }
  }
}

id sub_10000C704(uint64_t a1)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), SUBMessageTypeKey[0]);
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    id v6 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to forward message of type %{public}s", (uint8_t *)&v5, 0xCu);
  }
  sub_10000DDD4(*(void **)(a1 + 40), SUBMessageErrorKey[0], *(void **)(a1 + 48));
  return [(id)qword_100033CF0 sendClient:*(void *)(a1 + 56) message:*(void *)(a1 + 40)];
}

void sub_10000C7F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C8B4;
  v6[3] = &unk_10002CF30;
  BOOL v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  sub_100008B1C(v4, v6);
}

uint64_t sub_10000C8B4(uint64_t a1, void *a2)
{
  id v3 = sub_10000E324(a2, *(void **)(a1 + 32));
  [(id)qword_100033CF0 sendClient:*(void *)(a1 + 40) message:*(void *)(a1 + 32)];
  BOOL v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

id sub_10000C918(uint64_t a1)
{
  id v2 = sub_10000E324(*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v3 = (void *)qword_100033CF0;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 sendClient:v4 message:v5];
}

void sub_10000C968(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.mobile.keybagd.lock_status"))
  {
    id v3 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
    id v6 = v3;
    uint64_t v4 = +[NSString stringWithUTF8String:SUBMessageTypeQueryManagerState[0]];
    id v7 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

    [(id)qword_100033CE8 sendMessage:v5 isCritical:1 withReply:&stru_10002D010];
  }
}

void sub_10000CA70(id a1, NSDictionary *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (!a3)
  {
    id v6 = (void *)qword_100033CF8;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000CB10;
    v7[3] = &unk_10002CAE0;
    id v8 = v4;
    [v6 enqueueSynchronousTask:v7];
  }
}

void sub_10000CB10(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[NSString stringWithUTF8String:SUBMessageDescriptorKey[0]];
  uint64_t v3 = objc_opt_class();
  sub_100015EC8(v1, v2, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  int v4 = MKBGetDeviceLockState();
  if ([v9 userInstallRequestType] != (id)3 || v4 == 3 || v4 == 0)
  {
    if ([v9 userInstallRequestType] == (id)3)
    {
      id v7 = objc_alloc_init(SUBPairedUnlockManager);
      id v8 = [v9 manifest];
      [(SUBPairedUnlockManager *)v7 stageStashBagWithManifest:v8 completion:&stru_10002D030];
    }
    else
    {
      disableNotification();
    }
  }
}

void sub_10000CC14(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v2;
      int v4 = "failed to stage stash bag on gizmo: %{public}@";
      uint64_t v5 = v3;
      uint32_t v6 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v6);
    }
  }
  else
  {
    disableNotification();
    uint64_t v7 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      int v4 = "did stage stash bag on gizmo";
      uint64_t v5 = v7;
      uint32_t v6 = 2;
      goto LABEL_6;
    }
  }
}

void sub_10000CD14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (MGGetBoolAnswer())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = +[NSString stringWithUTF8String:SUBMessageDocumentationAssetServerURLKey[0]];
    id v9 = [v7 objectForKey:v8];

    BOOL v10 = v9 != 0;
    if (v9)
    {
      __int16 v11 = +[NSURL URLWithString:v9];
    }
    else
    {
      __int16 v11 = 0;
    }
  }
  else
  {
    __int16 v11 = 0;
    BOOL v10 = 0;
  }
  uint64_t v12 = [[SUBTransaction alloc] initWithName:@"FetchingDocumentation"];
  id v13 = (void *)qword_100033CE0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10000CEB4;
  v17[3] = &unk_10002D058;
  id v19 = v12;
  id v20 = v6;
  id v18 = v5;
  id v14 = v12;
  id v15 = v6;
  id v16 = v5;
  [v13 fetchDocumentationForDescriptor:v16 localOnly:0 shouldOverrideURL:v10 overrideURL:v11 completion:v17];
}

void sub_10000CEB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed to retrieve documentation for update (%{public}@) with error: (%{public}@)", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

void sub_10000CFB0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) mutableCopy];
  if (v5)
  {
    uint64_t v7 = sub_100015E20(v5);
    uint64_t v8 = SUBMessageErrorKey;
  }
  else
  {
    [*(id *)(a1 + 40) setDocumentation:v10];
    uint64_t v7 = sub_100015E20(*(void **)(a1 + 40));
    uint64_t v8 = SUBMessageDescriptorKey;
  }
  int v9 = +[NSString stringWithUTF8String:*v8];
  [v6 setObject:v7 forKeyedSubscript:v9];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000D0B4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) mutableCopy];
  if (v5)
  {
    uint64_t v7 = sub_100015E20(v5);
    uint64_t v8 = SUBMessageErrorKey;
  }
  else
  {
    [*(id *)(a1 + 40) setDocumentation:v10];
    uint64_t v7 = sub_100015E20(*(void **)(a1 + 48));
    uint64_t v8 = SUBMessageDownloadKey;
  }
  int v9 = +[NSString stringWithUTF8String:*v8];
  [v6 setObject:v7 forKeyedSubscript:v9];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

char *SUBResultTypeForMessageType(const char *a1)
{
  if (!strcmp(a1, SUBMessageTypeScanForUpdates[0])) {
    return SUBMessageTypeScanResult[0];
  }
  if (!strcmp(a1, SUBMessageTypeStartDownload[0])) {
    return SUBMessageTypeDownloadProgress[0];
  }
  if (!strcmp(a1, SUBMessageTypeInstallUpdate[0])) {
    return SUBMessageTypeInstallResult[0];
  }
  if (!strcmp(a1, SUBMessageTypeSetUserInstallRequestType[0])) {
    return off_100033978[0];
  }
  if (!strcmp(a1, SUBMessageTypeUserDidAcceptTermsAndConditions[0])) {
    return off_1000338F8[0];
  }
  return 0;
}

uint64_t sub_10000D398(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D470(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D528;
  v6[3] = &unk_10002CAE0;
  dispatch_semaphore_t v7 = v2;
  int v4 = *(void (**)(uint64_t, void *))(v3 + 16);
  id v5 = v2;
  v4(v3, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10000D528(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000D718(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_10000D7BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

uint64_t sub_10000D95C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D96C(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), SUBMessageTypeKey[0]);
  if (!v3) {
    goto LABEL_15;
  }
  id v5 = string;
  id v6 = softwareupdatebridge_log;
  BOOL v7 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_15;
    }
    LOWORD(v18) = 0;
    id v15 = "failed to forward message without message type";
    id v16 = v6;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 2u);
    goto LABEL_15;
  }
  if (v7)
  {
    int v18 = 136446210;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to forward message of type %{public}s", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v8 = SUBResultTypeForMessageType(v5);
  if (!v8)
  {
    uint64_t v17 = softwareupdatebridge_log;
    if (!os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(v18) = 0;
    id v15 = "no result message type for dropped message";
    id v16 = v17;
    goto LABEL_14;
  }
  int v9 = v8;
  id v10 = sub_10000E324(*(void **)(a1 + 40), 0);
  xpc_dictionary_set_string(v10, SUBMessageTypeKey[0], v9);
  sub_10000DDD4(v10, SUBMessageErrorKey[0], v3);
  if (!strcmp(v5, SUBMessageTypeStartDownload[0]))
  {
    __int16 v11 = *(void **)(a1 + 40);
    id v12 = +[NSString stringWithUTF8String:SUBMessageDownloadKey[0]];
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13)
    {
      id v14 = objc_alloc_init(SUBDownload);
      sub_10000DDD4(v10, SUBMessageDownloadKey[0], v14);
    }
  }
  [*(id *)(a1 + 48) sendClient:*(void *)(a1 + 56) message:v10];

LABEL_15:
}

void sub_10000DC28(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    dispatch_semaphore_t v2 = sub_10000E324(*(void **)(a1 + 40), 0);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 16);
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        BOOL v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v8 + 1) + 8 * (void)v7), v2);
          BOOL v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void sub_10000DDD4(void *a1, const char *a2, void *a3)
{
  if (a1 && a2 && a3)
  {
    id v5 = a3;
    id v6 = a1;
    id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v10 encodeObject:v5 forKey:NSKeyedArchiveRootObjectKey];

    [v10 finishEncoding];
    id v7 = [v10 encodedData];
    id v8 = [v7 bytes];
    long long v9 = [v10 encodedData];
    xpc_dictionary_set_data(v6, a2, v8, (size_t)[v9 length]);
  }
}

id sub_10000DEE4(void *a1, const char *a2, uint64_t a3)
{
  data = 0;
  if (a1)
  {
    if (a2)
    {
      size_t length = 0;
      data = (void *)xpc_dictionary_get_data(a1, a2, &length);
      if (data)
      {
        id v5 = objc_alloc((Class)NSKeyedUnarchiver);
        id v6 = +[NSData dataWithBytes:data length:length];
        id v7 = [v5 initForReadingFromData:v6 error:0];

        data = [v7 decodeObjectOfClass:a3 forKey:NSKeyedArchiveRootObjectKey];
        [v7 finishDecoding];
      }
    }
  }
  return data;
}

id sub_10000DFB8(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  data = 0;
  if (a1)
  {
    if (a2)
    {
      size_t length = 0;
      data = (void *)xpc_dictionary_get_data(a1, a2, &length);
      if (data)
      {
        id v7 = objc_alloc((Class)NSKeyedUnarchiver);
        id v8 = +[NSData dataWithBytes:data length:length];
        id v9 = [v7 initForReadingFromData:v8 error:0];

        id v13 = 0;
        data = [v9 decodeTopLevelObjectOfClasses:v5 forKey:NSKeyedArchiveRootObjectKey error:&v13];
        id v10 = v13;
        [v9 finishDecoding];
        if (v10)
        {
          long long v11 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v16 = a2;
            __int16 v17 = 2112;
            id v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error decoding %s: %@", buf, 0x16u);
          }
        }
      }
    }
  }

  return data;
}

BOOL sub_10000E150()
{
  long long v15 = 0u;
  long long v16 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  CFDictionaryRef v0 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v0)
  {
    v1 = v0;
    CFErrorRef error = 0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.allow-subridge", &error);
    CFErrorRef v3 = error;
    if (v2)
    {
      CFBooleanRef v4 = v2;
      CFTypeID v5 = CFGetTypeID(v2);
      if (v5 == CFBooleanGetTypeID())
      {
        BOOL v6 = CFBooleanGetValue(v4) != 0;
      }
      else
      {
        id v12 = softwareupdatebridge_log;
        BOOL v6 = 0;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(token.val[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "entitlement has wrong type", (uint8_t *)&token, 2u);
          BOOL v6 = 0;
        }
      }
      CFRelease(v1);
      goto LABEL_16;
    }
    uint64_t v7 = softwareupdatebridge_log;
    BOOL v8 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        token.val[0] = 138543362;
        *(void *)&token.val[1] = v3;
        id v9 = "unable to look up client entitlement: %{public}@";
        id v10 = v7;
        uint32_t v11 = 12;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&token, v11);
      }
    }
    else if (v8)
    {
      LOWORD(token.val[0]) = 0;
      id v9 = "client is not entitled";
      id v10 = v7;
      uint32_t v11 = 2;
      goto LABEL_14;
    }
    BOOL v6 = 0;
    CFBooleanRef v4 = v1;
LABEL_16:
    CFRelease(v4);

    return v6;
  }
  return 0;
}

id sub_10000E324(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFTypeID v5 = v4;
  if (v4) {
    xpc_object_t v6 = v4;
  }
  else {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10000E3FC;
  v9[3] = &unk_10002D198;
  id v7 = v6;
  id v10 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void sub_10000E3FC(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = xpc_string_create((const char *)[v8 UTF8String]);
LABEL_7:
    uint32_t v11 = v9;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    xpc_object_t v9 = xpc_data_create([v10 bytes], (size_t)objc_msgSend(v10, "length"));
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = xpc_int64_create((int64_t)[v8 integerValue]);
    goto LABEL_7;
  }
  uint32_t v11 = 0;
LABEL_8:
  id v12 = *(void **)(a1 + 32);
  id v13 = v7;
  xpc_dictionary_set_value(v12, (const char *)[v13 UTF8String], v11);
  *a4 = 0;
}

id sub_10000E53C(void *a1)
{
  id v1 = a1;
  CFBooleanRef v2 = v1;
  if (v1 && xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    +[NSMutableDictionary dictionary];
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10000E618;
    applier[3] = &unk_10002D1C0;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v3;
    xpc_dictionary_apply(v2, applier);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_10000E618(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
  }
  else if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    uint64_t v7 = +[NSData dataWithBytes:bytes_ptr length:xpc_data_get_length(v5)];
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_int64) {
      goto LABEL_9;
    }
    uint64_t v7 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
  }
  xpc_object_t v9 = (void *)v7;
  if (v7)
  {
    id v10 = *(void **)(a1 + 32);
    uint32_t v11 = +[NSString stringWithUTF8String:a2];
    [v10 setObject:v9 forKey:v11];
  }
LABEL_9:

  return 1;
}

void sub_10000EB74(uint64_t a1)
{
  CFBooleanRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EC58;
  v4[3] = &unk_10002D240;
  v4[4] = v2;
  char v8 = *(unsigned char *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 65);
  id v6 = *(id *)(a1 + 48);
  [v2 _fetchDocumentationForDocumentationID:v3 localOnly:1 shouldOverrideURL:0 overrideURL:0 completion:v4];
}

void sub_10000EC58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (!*(unsigned char *)(a1 + 64))
  {
    if (v5)
    {
      __int16 v17 = [v5 licenseAgreement];

      if (!v6 && v17) {
        goto LABEL_2;
      }
      if (*(unsigned char *)(a1 + 64)) {
        goto LABEL_14;
      }
    }
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 65);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000EEE8;
    v24[3] = &unk_10002D218;
    long long v16 = &v25;
    uint64_t v21 = *(void *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    v24[4] = *(void *)(a1 + 32);
    id v25 = v22;
    [v18 _fetchDocumentationForDocumentationID:v19 localOnly:0 shouldOverrideURL:v20 overrideURL:v21 completion:v24];
LABEL_13:

    goto LABEL_14;
  }
LABEL_2:
  if (*(void *)(a1 + 56))
  {
    id v7 = [v5 licenseAgreement];
    id v8 = [v7 length];

    if (!v8)
    {
      char v9 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Empty license agreement found locally", buf, 2u);
      }
      uint64_t v14 = SUBError(@"SUBError", 6, 0, @"Empty license found locally", v10, v11, v12, v13, v23);

      id v6 = (id)v14;
    }
    long long v15 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EEA0;
    block[3] = &unk_10002D1F0;
    long long v16 = &v29;
    id v29 = *(id *)(a1 + 56);
    id v27 = v5;
    id v6 = v6;
    id v28 = v6;
    dispatch_async(v15, block);

    goto LABEL_13;
  }
LABEL_14:
}

uint64_t sub_10000EEA0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000EECC(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
}

void sub_10000EEE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EFC4;
    block[3] = &unk_10002D1F0;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t sub_10000EFC4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000EFF0(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
}

void sub_10000F2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000F2C0(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v3)
  {
LABEL_4:
    uint64_t v4 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      CFStringRef v12 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
      id v5 = "[SUBDocumentationFetcher] : Successfully downloaded %{public}@ catalog";
LABEL_8:
      id v6 = v4;
      uint32_t v7 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (v3 != 18)
  {
    if (v3 != 10)
    {
      uint64_t v8 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        int v11 = 138543618;
        CFStringRef v12 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
        __int16 v13 = 2050;
        uint64_t v14 = v9;
        id v5 = "[SUBDocumentationFetcher] : failed to download %{public}@ catalog: %{public}ld";
        id v6 = v8;
        uint32_t v7 = 22;
        goto LABEL_11;
      }
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    goto LABEL_4;
  }
  uint64_t v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    CFStringRef v12 = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
    id v5 = "[SUBDocumentationFetcher] : Pallas found no matching asset for %{public}@";
    goto LABEL_8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010074(id a1, MAProgressNotification *a2)
{
  CFBooleanRef v2 = a2;
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : SUDocumentation progress:", (uint8_t *)&v17, 2u);
  }
  if ([(MAProgressNotification *)v2 totalWritten])
  {
    if ([(MAProgressNotification *)v2 totalExpected])
    {
      uint64_t v4 = (void *)softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v4;
        float v6 = (float)(uint64_t)[(MAProgressNotification *)v2 totalWritten];
        id v7 = [(MAProgressNotification *)v2 totalExpected];
        int v17 = 134349056;
        double v18 = (float)(v6 / (float)(uint64_t)v7);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Percent Complete: %{public}f", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  uint64_t v8 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    [(MAProgressNotification *)v2 expectedTimeRemaining];
    int v17 = 134349056;
    double v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Time Remaining  : %{public}f", (uint8_t *)&v17, 0xCu);
  }
  int v11 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = v11;
    unsigned int v13 = [(MAProgressNotification *)v2 isStalled];
    int v17 = 67240192;
    LODWORD(v18) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IsStalled       : %{public}d", (uint8_t *)&v17, 8u);
  }
  uint64_t v14 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = v14;
    double v16 = [(MAProgressNotification *)v2 taskDescription];
    int v17 = 138543362;
    double v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Descriptor      : %{public}@", (uint8_t *)&v17, 0xCu);
  }
}

void sub_1000102D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001039C;
  v6[3] = &unk_10002D2F8;
  uint64_t v11 = a2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v3, v6);
}

void sub_10001039C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2 == 10 || v2 == 0)
  {
    id v4 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v18 = 138543362;
      *(void *)&v18[4] = @"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : %{public}@ download succeeded", v18, 0xCu);
    }
    uint64_t v5 = [[SUBDocumentation alloc] initWithMAAsset:*(void *)(a1 + 32)];
    float v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    id v9 = v5;
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 64);
      *(_DWORD *)double v18 = 134349056;
      *(void *)&v18[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : documentation asset download failed: %{public}ld", v18, 0xCu);
    }
    SUBError(@"SUBError", 7, *(void **)(a1 + 56), @"Documentation asset download failed", v13, v14, v15, v16, *(uint64_t *)v18);
    uint64_t v5 = (SUBDocumentation *)objc_claimAutoreleasedReturnValue();
    float v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    id v9 = 0;
    id v10 = v5;
  }
  [v6 _invokeFetchCompletionsForDocumentationID:v7 localOnly:v8 documentation:v9 error:v10];
}

void sub_1000105E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001067C;
  v3[3] = &unk_10002D348;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _purgeAssetsNotMatchingDescriptor:v2 completion:v3];
}

void sub_10001067C(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010720;
    block[3] = &unk_10002D0F8;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t sub_100010720(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010744(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
}

void sub_100010AC4(id a1, int64_t a2)
{
  uint64_t v3 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = stringForMAAssetCancelResult(a2);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Asset download cancel result: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_100010B88(id a1, int64_t a2)
{
  uint64_t v3 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = stringForMAAssetPurgeResult(a2);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUBDocumentationFetcher] : Asset purge result: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001119C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011260;
  block[3] = &unk_10002D418;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void sub_100011260(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)char v11 = 138543362;
      *(void *)&void v11[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Failed to determine if paired unlock is supported: %{public}@", v11, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = SUBError(@"SUBError", 17, *(void **)(a1 + 32), @"Could not determine if paired unlock is supported", v3, v4, v5, v6, *(uint64_t *)v11);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v10();
  }
}

void sub_1000115A8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001166C;
  block[3] = &unk_10002D418;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

void sub_10001166C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      char v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
  else
  {
    uint64_t v2 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)char v12 = 138543362;
      *(void *)&void v12[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Failed to stage stash bag on gizmo: %{public}@", v12, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = SUBError(@"SUBError", 17, *(void **)(a1 + 32), @"Failed to stage stash bag on gizmo", v3, v4, v5, v6, *(uint64_t *)v12);
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void sub_1000117B8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001187C;
  block[3] = &unk_10002D418;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

void sub_10001187C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      char v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
  else
  {
    uint64_t v2 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)char v12 = 138543362;
      *(void *)&void v12[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Failed to stage stash bag on gizmo: %{public}@", v12, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = SUBError(@"SUBError", 17, *(void **)(a1 + 32), @"Failed to stage stash bag on gizmo", v3, v4, v5, v6, *(uint64_t *)v12);
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

void sub_100011A30(id a1)
{
  qword_100033D08 = objc_alloc_init(SUBCloudDescriptorManager);
  _objc_release_x1();
}

void sub_100011C2C(uint64_t a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = +[NSFileManager defaultManager];
    uint64_t v6 = *(void *)(a1 + 32);
    id v17 = 0;
    [v5 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:0 error:&v17];
    id v4 = v17;

    if (v4)
    {
      uint64_t v7 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to create: %@ - Error: %@", buf, 0x16u);
      }
    }
  }
  id v9 = sub_100015E20(*(void **)(a1 + 40));
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = [*(id *)(a1 + 40) productVersion];
    char v12 = +[NSString stringWithFormat:@"%@/%@", v10, v11];

    LODWORD(v11) = [v9 writeToFile:v12 atomically:1];
    uint64_t v13 = softwareupdatebridge_log;
    BOOL v14 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v12;
        uint64_t v15 = "Serialized data to %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      uint64_t v15 = "Failed to serialize cloud descriptor to %@";
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  uint64_t v16 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to serialize cloud descriptor", buf, 2u);
  }
LABEL_16:
}

void sub_1000126F0(id a1)
{
  qword_100033D18 = objc_alloc_init(SUBInstallationMonitor);
  _objc_release_x1();
}

void sub_1000129CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _installMarkerPath];
  if (v2)
  {
    unsigned __int8 v3 = +[NSFileManager defaultManager];
    unsigned int v4 = [v3 fileExistsAtPath:v2];

    if (v4)
    {
      uint64_t v5 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v6 = "received gizmo did begin installing message but install marker already exists";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else
    {
      uint64_t v7 = sub_100015E20(*(void **)(a1 + 40));
      uint64_t v8 = +[NSDate date];
      v23[0] = @"Descriptor";
      v23[1] = @"Date";
      v24[0] = v7;
      v24[1] = v8;
      id v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v18 = 0;
      uint64_t v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:&v18];
      id v11 = v18;
      char v12 = v11;
      if (v10)
      {
        id v17 = v11;
        unsigned __int8 v13 = [v10 writeToFile:v2 options:268435457 error:&v17];
        id v14 = v17;

        if (v13)
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
          [*(id *)(a1 + 32) setDescriptor:*(void *)(a1 + 40)];
          [*(id *)(a1 + 32) setMarkerCreationDate:v8];
        }
        else
        {
          uint64_t v16 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v20 = v2;
            __int16 v21 = 2112;
            id v22 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to create install marker at %@: %@", buf, 0x16u);
          }
        }
        char v12 = v14;
      }
      else
      {
        uint64_t v15 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "failed to serialize install marker: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v5 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "no install marker path";
      goto LABEL_7;
    }
  }
}

void sub_100012D24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _installMarkerPath];
  if (v2)
  {
    unsigned __int8 v3 = +[NSFileManager defaultManager];
    unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

    if (v4)
    {
      uint64_t v5 = +[NSFileManager defaultManager];
      id v14 = 0;
      unsigned __int8 v6 = [v5 removeItemAtPath:v2 error:&v14];
      id v7 = v14;

      if (v6)
      {
        uint64_t v8 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v2;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[GizmoOSVersionDidChange]: Successfully cleared out install marker file at %@", buf, 0xCu);
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
        [*(id *)(a1 + 32) setDescriptor:0];
        [*(id *)(a1 + 32) setMarkerCreationDate:0];
        goto LABEL_19;
      }
      id v11 = [v7 domain];
      if ([v11 isEqualToString:NSCocoaErrorDomain])
      {
        if ([v7 code] == (id)260)
        {

LABEL_19:
          goto LABEL_20;
        }
        id v13 = [v7 code];

        if (v13 == (id)4) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      char v12 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v2;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[GizmoOSVersionDidChange]: Failed to remove install marker at %@: %@", buf, 0x16u);
      }
      goto LABEL_19;
    }
    id v9 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "[GizmoOSVersionDidChange]: Received gizmo OS version change message but install marker does not exist";
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "[GizmoOSVersionDidChange]: no install marker path";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
  }
LABEL_20:
}

uint64_t sub_100013114(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013124(uint64_t a1)
{
}

void sub_10001312C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _installMarkerPath];
  if (!v2)
  {
    uint64_t v10 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no install marker path", buf, 2u);
    }
    goto LABEL_31;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 8)) {
    goto LABEL_3;
  }
  id v28 = 0;
  id v11 = +[NSData dataWithContentsOfFile:v2 options:0 error:&v28];
  id v12 = v28;
  id v13 = v12;
  if (!v11)
  {
    __int16 v20 = [v12 domain];
    if ([v20 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v13 code] == (id)260)
      {

LABEL_30:
        goto LABEL_31;
      }
      id v25 = [v13 code];

      if (v25 == (id)4) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    uint64_t v23 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v2;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "failed to read install marker at %@: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v27 = 0;
  id v14 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v27];
  id v15 = v27;

  if (v14)
  {
    uint64_t v16 = [v14 objectForKey:@"Date"];
    [*(id *)(a1 + 32) setMarkerCreationDate:v16];

    uint64_t v17 = objc_opt_class();
    id v18 = sub_100015EC8(v14, @"Descriptor", v17);
    [*(id *)(a1 + 32) setDescriptor:v18];

    uint64_t v3 = *(void *)(a1 + 32);
LABEL_3:
    if (![(id)v3 _installIntervalHasPassedSinceDate:*(void *)(v3 + 24)])
    {
LABEL_6:
      uint64_t v7 = [*(id *)(a1 + 32) descriptor];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      goto LABEL_31;
    }
    [*(id *)(a1 + 32) setDescriptor:0];
    [*(id *)(a1 + 32) setMarkerCreationDate:0];
    unsigned __int8 v4 = +[NSFileManager defaultManager];
    id v26 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:v2 error:&v26];
    id v6 = v26;

    if (v5)
    {

      goto LABEL_6;
    }
    uint64_t v19 = [v6 domain];
    if ([v19 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v6 code] == (id)260)
      {

LABEL_28:
        goto LABEL_31;
      }
      id v24 = [v6 code];

      if (v24 == (id)4) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    __int16 v21 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v2;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to remove install marker at %@: %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  id v22 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "failed to deserialize install marker: %@", buf, 0xCu);
  }

LABEL_31:
}

void sub_1000136C8(uint64_t a1)
{
  uint64_t ServiceTicket = AMAuthInstallSsoCreateServiceTicket();
  uint64_t v3 = softwareupdatebridge_log;
  BOOL v4 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (ServiceTicket)
  {
    if (v4)
    {
      *(_DWORD *)buf = 67109378;
      int v12 = ServiceTicket;
      __int16 v13 = 2112;
      uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed to get SSO token: %d; error: %@",
        buf,
        0x12u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    SUBError(@"SUBError", 14, 0, @"Failed to get SSO token: %d; error: %@",
      v5,
      v6,
      v7,
      v8,
    uint64_t v10 = ServiceTicket);
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "got AppleConnect SSO data", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_100015E20(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v2 encodeObject:v1 forKey:NSKeyedArchiveRootObjectKey];
    [v2 finishEncoding];
    uint64_t v3 = [v2 encodedData];
  }
  else
  {
    uint64_t v3 = +[NSNull null];
  }

  return v3;
}

id sub_100015EC8(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:v6];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [v5 objectForKey:v6];
  uint64_t v10 = +[NSNull null];
  unsigned __int8 v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    id v13 = objc_alloc((Class)NSKeyedUnarchiver);
    uint64_t v14 = [v5 objectForKey:v6];
    id v15 = [v13 initForReadingFromData:v14 error:0];

    uint64_t v16 = [v15 decodeObjectOfClass:a3 forKey:NSKeyedArchiveRootObjectKey];
    [v15 finishDecoding];
    id v12 = 0;
    if (objc_opt_isKindOfClass()) {
      id v12 = v16;
    }
  }
  else
  {
LABEL_3:
    id v12 = 0;
  }

  return v12;
}

void sub_100016074(id a1)
{
  qword_100033D30 = objc_alloc_init(SUBMessageEndpoint);
  _objc_release_x1();
}

uint64_t sub_100016500(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016510(uint64_t a1)
{
}

void sub_100016518(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    [v2 addObject:v3];
  }
  else
  {
    uint64_t v4 = +[NSMutableArray arrayWithObject:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;
  }
  [*(id *)(a1 + 32) _checkConnectivityForQueuedDisconnectedBlocks];
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    if (v10)
    {
      unsigned __int8 v11 = [*(id *)(v9 + 40) description];
    }
    else
    {
      unsigned __int8 v11 = @"UnknownObject";
    }
    int v14 = 134218498;
    uint64_t v15 = add - 1;
    __int16 v16 = 1024;
    int v17 = 148;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v14, 0x1Cu);
    if (v10) {
  }
    }
  if (add <= 0) {
    sub_10001D954();
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  if (v13)
  {
    *(void *)(v12 + 40) = 0;
  }
}

void sub_1000168C0(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v4);
  }

  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    if (v10)
    {
      objc_msgSend(*(id *)(v9 + 40), "description", (void)v14);
      unsigned __int8 v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v11 = @"UnknownObject";
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = add - 1;
    __int16 v20 = 1024;
    int v21 = 168;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", buf, 0x1Cu);
    if (v10) {
  }
    }
  if (add <= 0) {
    sub_10001D980();
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  if (v13)
  {
    *(void *)(v12 + 40) = 0;
  }
}

void sub_100016C4C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 56)];
  [*(id *)(*(void *)(a1 + 32) + 48) addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      id v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      id v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 185;
    __int16 v13 = 2112;
    long long v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001D9AC();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_100016F58(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeDelegate:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeDelegate:");
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      id v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      id v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 200;
    __int16 v13 = 2112;
    long long v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001D9D8();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_1000172F8(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    *(void *)__int16 v18 = 0;
    *(void *)&v18[8] = v18;
    *(void *)&uint8_t v18[16] = 0x3032000000;
    *(void *)&unsigned char v18[24] = sub_100016500;
    uint64_t v19 = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    id v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v22 = add;
      __int16 v23 = 2080;
      id v24 = "SUBTransactionBegin";
      __int16 v25 = 2080;
      id v26 = "com.apple.SoftwareUpdateBridge.sendMessage.1.2";
      __int16 v27 = 1024;
      int v28 = 59;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v20 = (id)os_transaction_create();
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000175E8;
    v15[3] = &unk_10002D590;
    uint64_t v7 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    long long v17 = v18;
    [v4 _sendMessage:v5 isCritical:v6 useTimeout:v7 completion:v15];

    _Block_object_dispose(v18, 8);
  }
  else
  {
    [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) isCritical:*(unsigned __int8 *)(a1 + 72) useTimeout:*(void *)(a1 + 48) completion:0];
  }
  uint64_t v8 = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  int v9 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v11 = *(void *)(v10 + 40);
    if (v11)
    {
      int v12 = [*(id *)(v10 + 40) description];
    }
    else
    {
      int v12 = @"UnknownObject";
    }
    *(_DWORD *)__int16 v18 = 134218498;
    *(void *)&v18[4] = v8 - 1;
    *(_WORD *)&v18[12] = 1024;
    *(_DWORD *)&v18[14] = 229;
    *(_WORD *)&v18[18] = 2112;
    *(void *)&v18[20] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", v18, 0x1Cu);
    if (v11) {
  }
    }
  if (v8 <= 0) {
    sub_10001DA04();
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v14 = *(void **)(v13 + 40);
  if (v14)
  {
    *(void *)(v13 + 40) = 0;
  }
}

void sub_1000175C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000175E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    if (v7)
    {
      uint64_t v8 = [*(id *)(v6 + 40) description];
    }
    else
    {
      uint64_t v8 = @"UnknownObject";
    }
    int v11 = 134218498;
    uint64_t v12 = add - 1;
    __int16 v13 = 1024;
    int v14 = 222;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v11, 0x1Cu);
    if (v7) {
  }
    }
  if (add <= 0) {
    sub_10001DA30();
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  if (v10)
  {
    *(void *)(v9 + 40) = 0;
  }
}

void sub_100017A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017AA8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      uint64_t v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 261;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DA5C();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_100017E4C(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    *(void *)__int16 v15 = 0;
    *(void *)&v15[8] = v15;
    *(void *)&v15[16] = 0x3032000000;
    *(void *)&v15[24] = sub_100016500;
    id v16 = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    id v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v19 = add;
      __int16 v20 = 2080;
      int v21 = "SUBTransactionBegin";
      __int16 v22 = 2080;
      __int16 v23 = "com.apple.SoftwareUpdateBridge.sendMessage.2.2";
      __int16 v24 = 1024;
      int v25 = 59;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v17 = (id)os_transaction_create();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100018110;
    v12[3] = &unk_10002D608;
    void v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    int v14 = v15;
    uint64_t v4 = objc_retainBlock(v12);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) isCritical:*(unsigned __int8 *)(a1 + 72) useTimeout:*(void *)(a1 + 48) withReply:v4];
  uint64_t v5 = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v8 = *(void *)(v7 + 40);
    if (v8)
    {
      int v9 = [*(id *)(v7 + 40) description];
    }
    else
    {
      int v9 = @"UnknownObject";
    }
    *(_DWORD *)__int16 v15 = 134218498;
    *(void *)&void v15[4] = v5 - 1;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = 295;
    *(_WORD *)&v15[18] = 2112;
    *(void *)&v15[20] = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", v15, 0x1Cu);
    if (v8) {
  }
    }
  if (v5 <= 0) {
    sub_10001DA88();
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  if (v11)
  {
    *(void *)(v10 + 40) = 0;
  }
}

void sub_100018110(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 64));
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    if (v10)
    {
      __int16 v11 = [*(id *)(v9 + 40) description];
    }
    else
    {
      __int16 v11 = @"UnknownObject";
    }
    int v14 = 134218498;
    uint64_t v15 = add - 1;
    __int16 v16 = 1024;
    int v17 = 289;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v14, 0x1Cu);
    if (v10) {
  }
    }
  if (add <= 0) {
    sub_10001DAB4();
  }
  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  if (v13)
  {
    *(void *)(v12 + 40) = 0;
  }
}

void sub_100018520(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      id v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      id v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 317;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DAE0();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_100018A4C(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    *(void *)unint64_t v19 = 0;
    *(void *)&v19[8] = v19;
    *(void *)&v19[16] = 0x3032000000;
    *(void *)&v19[24] = sub_100016500;
    __int16 v20 = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    id v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v23 = add;
      __int16 v24 = 2080;
      int v25 = "SUBTransactionBegin";
      __int16 v26 = 2080;
      __int16 v27 = "com.apple.SoftwareUpdateBridge.sendCloudMessage1.2";
      __int16 v28 = 1024;
      int v29 = 59;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v21 = (id)os_transaction_create();
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100018D44;
    v16[3] = &unk_10002D590;
    id v17 = *(id *)(a1 + 64);
    __int16 v18 = v19;
    [v4 _sendCloudMessage:v5 isCritical:v6 useTimeout:v7 destinations:v8 completion:v16];

    _Block_object_dispose(v19, 8);
  }
  else
  {
    [*(id *)(a1 + 32) _sendCloudMessage:*(void *)(a1 + 40) isCritical:*(unsigned __int8 *)(a1 + 80) useTimeout:*(void *)(a1 + 48) destinations:*(void *)(a1 + 56) completion:0];
  }
  uint64_t v9 = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v12 = *(void *)(v11 + 40);
    if (v12)
    {
      __int16 v13 = [*(id *)(v11 + 40) description];
    }
    else
    {
      __int16 v13 = @"UnknownObject";
    }
    *(_DWORD *)unint64_t v19 = 134218498;
    *(void *)&void v19[4] = v9 - 1;
    *(_WORD *)&v19[12] = 1024;
    *(_DWORD *)&v19[14] = 362;
    *(_WORD *)&v19[18] = 2112;
    *(void *)&v19[20] = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", v19, 0x1Cu);
    if (v12) {
  }
    }
  if (v9 <= 0) {
    sub_10001DB0C();
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  if (v15)
  {
    *(void *)(v14 + 40) = 0;
  }
}

void sub_100018D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018D44(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    if (v7)
    {
      uint64_t v8 = [*(id *)(v6 + 40) description];
    }
    else
    {
      uint64_t v8 = @"UnknownObject";
    }
    int v11 = 134218498;
    uint64_t v12 = add - 1;
    __int16 v13 = 1024;
    int v14 = 355;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v11, 0x1Cu);
    if (v7) {
  }
    }
  if (add <= 0) {
    sub_10001DB38();
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  if (v10)
  {
    *(void *)(v9 + 40) = 0;
  }
}

void sub_10001914C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      uint64_t v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 383;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DB64();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_10001950C(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    *(void *)__int16 v15 = 0;
    *(void *)&v15[8] = v15;
    *(void *)&v15[16] = 0x3032000000;
    *(void *)&v15[24] = sub_100016500;
    __int16 v16 = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    id v3 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v19 = add;
      __int16 v20 = 2080;
      id v21 = "SUBTransactionBegin";
      __int16 v22 = 2080;
      unint64_t v23 = "com.apple.SoftwareUpdateBridge.sendCloudMessage2.2";
      __int16 v24 = 1024;
      int v25 = 59;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v17 = (id)os_transaction_create();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000197D0;
    v12[3] = &unk_10002D608;
    void v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 64);
    int v14 = v15;
    uint64_t v4 = objc_retainBlock(v12);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 32) _sendCloudMessage:*(void *)(a1 + 40) isCritical:*(unsigned __int8 *)(a1 + 80) useTimeout:*(void *)(a1 + 48) withReply:v4 destinations:*(void *)(a1 + 56)];
  uint64_t v5 = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v8 = *(void *)(v7 + 40);
    if (v8)
    {
      int v9 = [*(id *)(v7 + 40) description];
    }
    else
    {
      int v9 = @"UnknownObject";
    }
    *(_DWORD *)__int16 v15 = 134218498;
    *(void *)&void v15[4] = v5 - 1;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = 418;
    *(_WORD *)&v15[18] = 2112;
    *(void *)&v15[20] = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", v15, 0x1Cu);
    if (v8) {
  }
    }
  if (v5 <= 0) {
    sub_10001DB90();
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  if (v11)
  {
    *(void *)(v10 + 40) = 0;
  }
}

void sub_1000197D0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 64));
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    if (v10)
    {
      __int16 v11 = [*(id *)(v9 + 40) description];
    }
    else
    {
      __int16 v11 = @"UnknownObject";
    }
    int v14 = 134218498;
    uint64_t v15 = add - 1;
    __int16 v16 = 1024;
    int v17 = 412;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v14, 0x1Cu);
    if (v10) {
  }
    }
  if (add <= 0) {
    sub_10001DBBC();
  }
  uint64_t v12 = *(void *)(a1[6] + 8);
  id v13 = *(void **)(v12 + 40);
  if (v13)
  {
    *(void *)(v12 + 40) = 0;
  }
}

void sub_100019BFC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      id v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      id v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 440;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DBE8();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_100019F64(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendReply:*(void *)(a1 + 40) toMessage:*(void *)(a1 + 48) isCritical:*(unsigned __int8 *)(a1 + 64)];
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      id v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      id v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 459;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DC14();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_10001A2B8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

void sub_10001A3E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        int v9 = *(void **)(*(void *)(a1 + 40) + 8);
        id v10 = objc_retainBlock(v2);
        objc_msgSend(v9, "setObject:forKey:", v10, v8, (void)v11);

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void sub_10001AAAC(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = +[NSNull null];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v10];
  }
  *a4 = 0;
}

void sub_10001B628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_10001B67C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = +[NSNull null];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v10];
  }
  *a4 = 0;
}

intptr_t sub_10001B724(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(*(void *)(a1 + 104) + 8);
  id v34 = *(id *)(v9 + 40);
  id obj = v6;
  unsigned __int8 v10 = [v3 sendData:v2 toDestinations:v7 priority:v4 options:v8 identifier:&obj error:&v34];
  objc_storeStrong((id *)(v5 + 40), obj);
  objc_storeStrong((id *)(v9 + 40), v34);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v10;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v11 = *(void *)(a1 + 64);
    long long v12 = softwareupdatebridge_log;
    BOOL v13 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        long long v14 = *(void **)(a1 + 64);
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        char v37 = v14;
        __int16 v38 = 2114;
        uint64_t v39 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sent message reply to: %{public}@ with identifier: %{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      __int16 v26 = *(void **)(a1 + 72);
      __int16 v27 = SUBMessageTypeKey[0];
      __int16 v28 = v12;
      int v29 = +[NSString stringWithUTF8String:v27];
      id v30 = [v26 objectForKeyedSubscript:v29];
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      char v37 = v30;
      __int16 v38 = 2114;
      uint64_t v39 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sent message: %{public}@ with identifier: %{public}@", buf, 0x16u);
    }
    char v24 = 1;
  }
  else
  {
    __int16 v16 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      char v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to send message: %{public}@", buf, 0xCu);
    }
    if (*(void *)(a1 + 120))
    {
      long long v33 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      SUBError(@"SUBError", 2, v33, @"Failed to send message: %@", v17, v18, v19, v20, (uint64_t)v33);
      **(void **)(a1 + 120) = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v22 = softwareupdatebridge_log;
    BOOL v23 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    char v24 = 0;
    if (v23)
    {
      int v25 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      char v37 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", buf, 0xCu);
      char v24 = 0;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v24;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
}

void sub_10001BDE8(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendErrorReply:*(void *)(a1 + 40) toMessage:*(void *)(a1 + 48) isCritical:*(unsigned __int8 *)(a1 + 64)];
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [*(id *)(v4 + 40) description];
    }
    else
    {
      uint64_t v6 = @"UnknownObject";
    }
    int v9 = 134218498;
    uint64_t v10 = add - 1;
    __int16 v11 = 1024;
    int v12 = 739;
    __int16 v13 = 2112;
    long long v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v9, 0x1Cu);
    if (v5) {
  }
    }
  if (add <= 0) {
    sub_10001DC40();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void sub_10001C5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C610(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 32));
    }
  }
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    if (v7)
    {
      uint64_t v8 = [*(id *)(v6 + 40) description];
    }
    else
    {
      uint64_t v8 = @"UnknownObject";
    }
    int v11 = 134218498;
    uint64_t v12 = add - 1;
    __int16 v13 = 1024;
    int v14 = 799;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v11, 0x1Cu);
    if (v7) {
  }
    }
  if (add <= 0) {
    sub_10001DC6C();
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  if (v10)
  {
    *(void *)(v9 + 40) = 0;
  }
}

void sub_10001CF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_10001CF80(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = *(void (**)(void))(a1[8] + 16);
  }
  else
  {
    uint64_t v3 = (void *)a1[5];
    uint64_t v4 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];

    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = (void *)a1[5];
      uint64_t v8 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];
      uint64_t v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v6 fromData:v9 error:0];

      (*(void (**)(void))(a1[8] + 16))();
      goto LABEL_6;
    }
    uint64_t v18 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = a1[6];
      uint64_t v20 = a1[7];
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2114;
      v24[0] = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received message reply (%{public}@) to message with identifier: %{public}@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v2 = *(void (**)(void))(a1[8] + 16);
  }
  v2();
LABEL_6:
  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v12 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1[9] + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    if (v14)
    {
      __int16 v15 = [*(id *)(v13 + 40) description];
    }
    else
    {
      __int16 v15 = @"UnknownObject";
    }
    int v21 = 134218498;
    uint64_t v22 = add - 1;
    __int16 v23 = 1024;
    LODWORD(v24[0]) = 852;
    WORD2(v24[0]) = 2112;
    *(void *)((char *)v24 + 6) = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v21, 0x1Cu);
    if (v14) {
  }
    }
  if (add <= 0) {
    sub_10001DC98();
  }
  uint64_t v16 = *(void *)(a1[9] + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  if (v17)
  {
    *(void *)(v16 + 40) = 0;
  }
}

void sub_10001D224(uint64_t a1)
{
  uint64_t v2 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v3;
    __int16 v17 = 2114;
    v18[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received message: %{public}@; identifier: %{public}@",
      (uint8_t *)&v15,
      0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 56) outgoingResponseIdentifier];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  uint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v9 = (id)softwareupdatebridge_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v11 = *(void *)(v10 + 40);
    if (v11)
    {
      uint64_t v12 = [*(id *)(v10 + 40) description];
    }
    else
    {
      uint64_t v12 = @"UnknownObject";
    }
    int v15 = 134218498;
    uint64_t v16 = add - 1;
    __int16 v17 = 1024;
    LODWORD(v18[0]) = 890;
    WORD2(v18[0]) = 2112;
    *(void *)((char *)v18 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "TX ⬇: %ld SUBTransactionEnd %d %@", (uint8_t *)&v15, 0x1Cu);
    if (v11) {
  }
    }
  if (add <= 0) {
    sub_10001DCC4();
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  if (v14)
  {
    *(void *)(v13 + 40) = 0;
  }
}

void sub_10001D800(void *a1)
{
  uint64_t v2 = (void *)softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    int v4 = 136446210;
    string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "error on XPC peer listener connection: %{public}s", (uint8_t *)&v4, 0xCu);
  }
  abort();
}

void sub_10001D8A4()
{
}

void sub_10001D8D0()
{
}

void sub_10001D8FC()
{
}

void sub_10001D928()
{
}

void sub_10001D954()
{
  __assert_rtn("-[SUBMessageEndpoint executeBlockWhenDisconnected:]_block_invoke", "SUBMessageEndpoint.m", 148, "tcount >= 0");
}

void sub_10001D980()
{
  __assert_rtn("-[SUBMessageEndpoint _checkConnectivityForQueuedDisconnectedBlocks]_block_invoke", "SUBMessageEndpoint.m", 168, "tcount >= 0");
}

void sub_10001D9AC()
{
  __assert_rtn("-[SUBMessageEndpoint resume]_block_invoke", "SUBMessageEndpoint.m", 185, "tcount >= 0");
}

void sub_10001D9D8()
{
  __assert_rtn("-[SUBMessageEndpoint suspend]_block_invoke", "SUBMessageEndpoint.m", 200, "tcount >= 0");
}

void sub_10001DA04()
{
  __assert_rtn("-[SUBMessageEndpoint sendMessage:isCritical:useTimeout:completion:]_block_invoke", "SUBMessageEndpoint.m", 229, "tcount >= 0");
}

void sub_10001DA30()
{
  __assert_rtn("-[SUBMessageEndpoint sendMessage:isCritical:useTimeout:completion:]_block_invoke", "SUBMessageEndpoint.m", 222, "tcount >= 0");
}

void sub_10001DA5C()
{
  __assert_rtn("-[SUBMessageEndpoint _sendMessage:isCritical:useTimeout:completion:]_block_invoke", "SUBMessageEndpoint.m", 261, "tcount >= 0");
}

void sub_10001DA88()
{
  __assert_rtn("-[SUBMessageEndpoint sendMessage:isCritical:useTimeout:withReply:]_block_invoke", "SUBMessageEndpoint.m", 295, "tcount >= 0");
}

void sub_10001DAB4()
{
  __assert_rtn("-[SUBMessageEndpoint sendMessage:isCritical:useTimeout:withReply:]_block_invoke", "SUBMessageEndpoint.m", 289, "tcount >= 0");
}

void sub_10001DAE0()
{
  __assert_rtn("-[SUBMessageEndpoint _sendMessage:isCritical:useTimeout:withReply:]_block_invoke", "SUBMessageEndpoint.m", 317, "tcount >= 0");
}

void sub_10001DB0C()
{
  __assert_rtn("-[SUBMessageEndpoint sendCloudMessage:isCritical:useTimeout:destinations:completion:]_block_invoke", "SUBMessageEndpoint.m", 362, "tcount >= 0");
}

void sub_10001DB38()
{
  __assert_rtn("-[SUBMessageEndpoint sendCloudMessage:isCritical:useTimeout:destinations:completion:]_block_invoke", "SUBMessageEndpoint.m", 355, "tcount >= 0");
}

void sub_10001DB64()
{
  __assert_rtn("-[SUBMessageEndpoint _sendCloudMessage:isCritical:useTimeout:destinations:completion:]_block_invoke", "SUBMessageEndpoint.m", 383, "tcount >= 0");
}

void sub_10001DB90()
{
  __assert_rtn("-[SUBMessageEndpoint sendCloudMessage:isCritical:useTimeout:withReply:destinations:]_block_invoke", "SUBMessageEndpoint.m", 418, "tcount >= 0");
}

void sub_10001DBBC()
{
  __assert_rtn("-[SUBMessageEndpoint sendCloudMessage:isCritical:useTimeout:withReply:destinations:]_block_invoke", "SUBMessageEndpoint.m", 412, "tcount >= 0");
}

void sub_10001DBE8()
{
  __assert_rtn("-[SUBMessageEndpoint _sendCloudMessage:isCritical:useTimeout:withReply:destinations:]_block_invoke", "SUBMessageEndpoint.m", 440, "tcount >= 0");
}

void sub_10001DC14()
{
  __assert_rtn("-[SUBMessageEndpoint sendReply:toMessage:isCritical:]_block_invoke", "SUBMessageEndpoint.m", 459, "tcount >= 0");
}

void sub_10001DC40()
{
  __assert_rtn("-[SUBMessageEndpoint sendErrorReply:toMessage:isCritical:]_block_invoke", "SUBMessageEndpoint.m", 739, "tcount >= 0");
}

void sub_10001DC6C()
{
  __assert_rtn("-[SUBMessageEndpoint service:account:identifier:didSendWithSuccess:error:]_block_invoke", "SUBMessageEndpoint.m", 799, "tcount >= 0");
}

void sub_10001DC98()
{
  __assert_rtn("-[SUBMessageEndpoint handleMessage:withContext:]_block_invoke", "SUBMessageEndpoint.m", 852, "tcount >= 0");
}

void sub_10001DCC4()
{
  __assert_rtn("-[SUBMessageEndpoint handleMessage:withContext:]_block_invoke", "SUBMessageEndpoint.m", 890, "tcount >= 0");
}

uint64_t AMAuthInstallSsoCreateServiceTicket()
{
  return _AMAuthInstallSsoCreateServiceTicket();
}

uint64_t ASSetAssetServerURLForAssetType()
{
  return _ASSetAssetServerURLForAssetType();
}

uint64_t ASSetDefaultAssetServerURLForAssetType()
{
  return _ASSetDefaultAssetServerURLForAssetType();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURLInDirectory(bundleURL, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
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

uint64_t CPFSSizeStrings()
{
  return _CPFSSizeStrings();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
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

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

uint64_t SBSetApplicationBadgeNumber()
{
  return _SBSetApplicationBadgeNumber();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
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

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
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

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_SUBDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 SUBDefaultPairedDevice];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__checkConnectivityForQueuedDisconnectedBlocks(void *a1, const char *a2, ...)
{
  return [a1 _checkConnectivityForQueuedDisconnectedBlocks];
}

id objc_msgSend__documentationQuery(void *a1, const char *a2, ...)
{
  return [a1 _documentationQuery];
}

id objc_msgSend__installMarkerPath(void *a1, const char *a2, ...)
{
  return [a1 _installMarkerPath];
}

id objc_msgSend__loadBundleResources(void *a1, const char *a2, ...)
{
  return [a1 _loadBundleResources];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeWatchShouldOfferUnpair(void *a1, const char *a2, ...)
{
  return [a1 activeWatchShouldOfferUnpair];
}

id objc_msgSend_additionalServerParams(void *a1, const char *a2, ...)
{
  return [a1 additionalServerParams];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentPhoneLanguage(void *a1, const char *a2, ...)
{
  return [a1 currentPhoneLanguage];
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

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_denialReasons(void *a1, const char *a2, ...)
{
  return [a1 denialReasons];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_descriptorBeingInstalled(void *a1, const char *a2, ...)
{
  return [a1 descriptorBeingInstalled];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayTermsRequested(void *a1, const char *a2, ...)
{
  return [a1 displayTermsRequested];
}

id objc_msgSend_documentation(void *a1, const char *a2, ...)
{
  return [a1 documentation];
}

id objc_msgSend_documentationBundleURL(void *a1, const char *a2, ...)
{
  return [a1 documentationBundleURL];
}

id objc_msgSend_documentationID(void *a1, const char *a2, ...)
{
  return [a1 documentationID];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 expectedTimeRemaining];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return [a1 finishEncoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 getActiveDevice];
}

id objc_msgSend_getAllDevices(void *a1, const char *a2, ...)
{
  return [a1 getAllDevices];
}

id objc_msgSend_getCloudDescriptorPath(void *a1, const char *a2, ...)
{
  return [a1 getCloudDescriptorPath];
}

id objc_msgSend_getCloudDescriptors(void *a1, const char *a2, ...)
{
  return [a1 getCloudDescriptors];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_gizmoUpdateCompleted(void *a1, const char *a2, ...)
{
  return [a1 gizmoUpdateCompleted];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableUpdateName];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_licenseAgreement(void *a1, const char *a2, ...)
{
  return [a1 licenseAgreement];
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return [a1 lockState];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return [a1 manifest];
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return [a1 marketingVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_postSpaceNotificationWithUnpair(void *a1, const char *a2, ...)
{
  return [a1 postSpaceNotificationWithUnpair];
}

id objc_msgSend_preferencesIcon(void *a1, const char *a2, ...)
{
  return [a1 preferencesIcon];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredPhoneLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredPhoneLanguages];
}

id objc_msgSend_preparationSize(void *a1, const char *a2, ...)
{
  return [a1 preparationSize];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return [a1 productSystemName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_releaseNotes(void *a1, const char *a2, ...)
{
  return [a1 releaseNotes];
}

id objc_msgSend_releaseNotesSummary(void *a1, const char *a2, ...)
{
  return [a1 releaseNotesSummary];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedCloudDescriptorManager(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDescriptorManager];
}

id objc_msgSend_sharedInstallationMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedInstallationMonitor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedUnlockManager(void *a1, const char *a2, ...)
{
  return [a1 sharedUnlockManager];
}

id objc_msgSend_softwareUpdateIconImagePath(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateIconImagePath];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_suCoreParsedDocumentation(void *a1, const char *a2, ...)
{
  return [a1 suCoreParsedDocumentation];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return [a1 taskDescription];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userDidAcceptTermsAndConditions(void *a1, const char *a2, ...)
{
  return [a1 userDidAcceptTermsAndConditions];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInstallRequestType(void *a1, const char *a2, ...)
{
  return [a1 userInstallRequestType];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}