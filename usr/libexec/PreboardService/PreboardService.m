uint64_t sub_100004ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFDictionaryRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  io_service_t MatchingService;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  io_connect_t connect;
  mach_port_t mainPort;

  mainPort = 0;
  connect = 0;
  if (IOMasterPort(0, &mainPort))
  {
    sub_100004C84(1, 3, @"%s: could not get master port\n", v0, v1, v2, v3, v4, (uint64_t)"sep_connect");
  }
  else
  {
    v6 = IOServiceMatching("AppleSEPManager");
    if (v6)
    {
      MatchingService = IOServiceGetMatchingService(mainPort, v6);
      if (MatchingService)
      {
        if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
          return connect;
        }
        sub_100004C84(1, 3, @"%s: Failed to open SEP service.", v18, v19, v20, v21, v22, (uint64_t)"sep_connect");
      }
      else
      {
        sub_100004C84(1, 3, @"%s: Could not find SEP service.", v13, v14, v15, v16, v17, (uint64_t)"sep_connect");
      }
    }
    else
    {
      sub_100004C84(1, 3, @"%s: could not make matching dictionary for '%s'", v7, v8, v9, v10, v11, (uint64_t)"sep_connect");
    }
  }
  return 0;
}

uint64_t sub_100004BBC()
{
  uint64_t v0 = sub_100004ACC();
  sub_100004C84(1, 2, @"%s: Purging system token.", v1, v2, v3, v4, v5, (uint64_t)"purge_system_token");
  if (v0)
  {
    if (IOConnectCallScalarMethod(v0, 0x42u, 0, 0, 0, 0))
    {
      sub_100004C84(1, 3, @"%s: Purging system token failed: 0x%x", v11, v12, v13, v14, v15, (uint64_t)"purge_system_token");
      return 0;
    }
    else
    {
      uint64_t v0 = 1;
      sub_100004C84(1, 3, @"%s: Purging system token succeeded", v11, v12, v13, v14, v15, (uint64_t)"purge_system_token");
    }
  }
  else
  {
    sub_100004C84(1, 2, @"%s: SEP IOService was NULL.", v6, v7, v8, v9, v10, (uint64_t)"purge_system_token");
  }
  return v0;
}

void sub_100004C84(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&a9];
  switch(a2)
  {
    case 3:
      if (a1)
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        uint64_t v13 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_ERROR)) {
          sub_100006608((uint64_t)v11, v13);
        }
      }
      else
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        v16 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_ERROR)) {
          sub_100006590((uint64_t)v11, v16);
        }
      }
      break;
    case 2:
      if (a1)
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        uint64_t v14 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v18 = v11;
          uint64_t v15 = "%{public}@";
LABEL_35:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
        }
      }
      else
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        uint64_t v14 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v11;
          uint64_t v15 = "%@";
          goto LABEL_35;
        }
      }
      break;
    case 1:
      if (qword_10000C0C0 != -1) {
        dispatch_once(&qword_10000C0C0, &stru_100008258);
      }
      uint64_t v12 = qword_10000C0B8;
      if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_DEBUG)) {
        sub_100006518((uint64_t)v11, v12);
      }
      return;
    default:
      if (a1)
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        uint64_t v14 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v18 = v11;
          uint64_t v15 = "%{public}@";
          goto LABEL_35;
        }
      }
      else
      {
        if (qword_10000C0C0 != -1) {
          dispatch_once(&qword_10000C0C0, &stru_100008258);
        }
        uint64_t v14 = qword_10000C0B8;
        if (os_log_type_enabled((os_log_t)qword_10000C0B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v11;
          uint64_t v15 = "%@";
          goto LABEL_35;
        }
      }
      break;
  }
}

uint64_t sub_100004F94()
{
  if (qword_10000C0C0 != -1) {
    dispatch_once(&qword_10000C0C0, &stru_100008258);
  }
  return qword_10000C0B8;
}

void sub_100004FD8(id a1)
{
  qword_10000C0B8 = (uint64_t)os_log_create("com.apple.preboardservice_logging", "Common");
}

void sub_100005008(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  out_token[0] = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  char v96 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3052000000;
  v90 = sub_1000058D0;
  v91 = sub_1000058E0;
  uint64_t v92 = 0;
  id v11 = "CURRENT(v2)";
  if (a3) {
    id v11 = "LEGACY";
  }
  v84 = v11;
  sub_100004C84(1, 2, @"%s: %s host tools", a4, a5, a6, a7, a8, (uint64_t)"handle_create_stashbag");
  if (MKBGetDeviceLockState() == 3)
  {
    if (a1 && kCFBooleanTrue) {
      sub_100005A30(a1, +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"Skip"]);
    }
    goto LABEL_84;
  }
  id v12 = [a2 objectForKey:@"Manifest"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v14 = +[NSString stringWithFormat:@"manifest was not Data type"];
      goto LABEL_89;
    }
  }
  if (os_variant_allows_internal_security_policies())
  {
    id v13 = [a2 objectForKey:@"DevicePasscodeData"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v14 = +[NSString stringWithFormat:@"passcode data was not Data type"];
LABEL_89:
        v30 = +[NSString stringWithFormat:@"%s: %@", "handle_create_stashbag", v14];
        id v23 = 0;
        v22 = 0;
        goto LABEL_70;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  MKBKeyBagKeyStashCreateWithMode();
  if (!v13)
  {
    v22 = dispatch_semaphore_create(0);
    if (!v22)
    {
      id v23 = 0;
      v29 = 0;
      int v28 = 0;
      v30 = @"failed to allocate semaphoer for user auth notificaiton";
      goto LABEL_55;
    }
    id v23 = objc_alloc_init((Class)LAContext);
    if (!v23)
    {
      v29 = 0;
      int v28 = 0;
      v30 = @"failed to allocate LAContext to prompt for passcode";
      goto LABEL_55;
    }
    id v24 = +[NSMutableDictionary dictionary];
    if (!v24)
    {
      v29 = 0;
      int v28 = 0;
      v30 = @"failed to allocate options dict for LAContext";
      goto LABEL_55;
    }
    v25 = (void *)MGCopyAnswer();
    v26 = [+[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework"] localizedStringForKey:@"UNLOCK_DEVICE" value:&stru_1000085C8 table:@"PreboardService"];
    v27 = v26;
    if (v25)
    {
      if (v26) {
        v27 = [(NSString *)v26 stringByReplacingOccurrencesOfString:@"<device_name>" withString:v25];
      }
    }
    if (v27) {
      [v24 setObject:v27 forKey:&off_100008E50];
    }
    [v24 setObject:&off_100008E50 forKey:&off_100008E68];
    [v24 setObject:&off_100008E80 forKey:&off_100008E98];
    if (v12) {
      [v24 setObject:v12 forKey:&off_100008EB0];
    }
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1000058EC;
    v86[3] = &unk_100008280;
    v86[5] = &v93;
    v86[6] = &v87;
    v86[4] = v22;
    [v23 evaluatePolicy:1010 options:v24 reply:v86];
    int v28 = 0;
    v29 = 0;
    v30 = @"failed to send show message";
    if (!a1 || (CFBooleanRef v15 = kCFBooleanTrue) == 0)
    {
LABEL_55:
      v53 = +[NSMutableDictionary dictionaryWithCapacity:2];
      if (v30)
      {
        [(__CFString *)v30 UTF8String];
        sub_100004C84(1, 3, @"%s: failed - sending error back to host: %s", v54, v55, v56, v57, v58, (uint64_t)"handle_create_stashbag");
        [(NSMutableDictionary *)v53 setObject:v30 forKey:@"ErrorString"];
      }
      else
      {
        sub_100004C84(1, 3, @"%s: failed - sending error back to host", v48, v49, v50, v51, v52, (uint64_t)"handle_create_stashbag");
      }
      if (v28)
      {
        sub_100004C84(1, 3, @"%s: destroying stashbag", v59, v60, v61, v62, v63, (uint64_t)"handle_create_stashbag");
        MKBKeyBagKeyStashCreateWithMode();
      }
      [(NSMutableDictionary *)v53 setObject:&off_100008EC8 forKey:@"Error"];
      sub_100005A30(a1, v53);
      if (!v29) {
        goto LABEL_80;
      }
      goto LABEL_79;
    }
    if (!sub_100005A30(a1, +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"ShowDialog"]))
    {
LABEL_70:
      v29 = 0;
      int v28 = 0;
      goto LABEL_55;
    }
    sub_100004C84(1, 2, @"%s: waiting for user auth notification", v31, v32, v33, v34, v35, (uint64_t)"handle_create_stashbag");
    dispatch_time_t v36 = dispatch_time(0, 120000000000);
    intptr_t v37 = dispatch_semaphore_wait(v22, v36);
    if (*((unsigned char *)v94 + 24)) {
      goto LABEL_49;
    }
LABEL_35:
    if (v37)
    {
      sub_100004C84(1, 3, @"%s: timed out waiting for unlock", v17, v18, v19, v20, v21, (uint64_t)"handle_create_stashbag");
      [v23 invalidate];
      if (a1) {
        BOOL v43 = v15 == 0;
      }
      else {
        BOOL v43 = 1;
      }
      char v44 = v43;
      if (!v43) {
        sub_100005A30(a1, +[NSDictionary dictionaryWithObject:v15 forKey:@"Timeout"]);
      }
      if (!v13)
      {
        sub_100004C84(1, 2, @"%s: sending hide message", v38, v39, v40, v41, v42, (uint64_t)"handle_create_stashbag");
        if ((v44 & 1) == 0) {
          sub_100005A30(a1, +[NSDictionary dictionaryWithObject:v15 forKey:@"HideDialog"]);
        }
      }
      goto LABEL_80;
    }
    if (!v88[5])
    {
      v29 = 0;
      int v28 = 0;
      v30 = @"user authentication failed";
      goto LABEL_55;
    }
    v30 = +[NSString stringWithFormat:@"user authentication failed: %@", v88[5], v84];

    goto LABEL_70;
  }
  CFBooleanRef v15 = kCFBooleanTrue;
  if (a1 && kCFBooleanTrue) {
    sub_100005A30(a1, +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"StashCreatingWithPasscode"]);
  }
  if (v12) {
    int v16 = MKBKeyBagKeyStashCreateWithManifest();
  }
  else {
    int v16 = MKBKeyBagKeyStashCreateWithMode();
  }
  id v23 = 0;
  v22 = 0;
  BOOL v45 = v16 == 0;
  *((unsigned char *)v94 + 24) = v45;
  intptr_t v37 = -1;
  if (!v45) {
    goto LABEL_35;
  }
LABEL_49:
  if (a3)
  {
    sub_100004C84(1, 2, @"%s: legacy - committing stashbag", v17, v18, v19, v20, v21, (uint64_t)"handle_create_stashbag");
    uint64_t v46 = MKBKeyBagKeyStashCommit();
    if (v46)
    {
      CFStringRef v47 = @"failed to commit key stash %d";
LABEL_54:
      v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v46, v84);
      v29 = 0;
      int v28 = 1;
      goto LABEL_55;
    }
  }
  uint64_t v46 = MKBKeyBagKeyStashPersist();
  if (v46)
  {
    CFStringRef v47 = @"failed to persist stashbag: 0x%x";
    goto LABEL_54;
  }
  v29 = dispatch_semaphore_create(0);
  if (!v29)
  {
    int v28 = 1;
    v30 = @"failed to allocate disconnection semaphore";
    goto LABEL_55;
  }
  v64 = (const char *)[kLockdownNotificationHostDetached UTF8String];
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000059D4;
  handler[3] = &unk_1000082A8;
  handler[4] = v29;
  if (notify_register_dispatch(v64, out_token, global_queue, handler))
  {
    int v28 = 1;
    v30 = @"failed to register for notification";
    goto LABEL_55;
  }
  if (v13)
  {
    sub_100004C84(1, 2, @"%s: sending stash created with passcode message", v66, v67, v68, v69, v70, (uint64_t)"handle_create_stashbag");
    if (a1 && v15)
    {
      CFStringRef v76 = @"StashCreatedWithPasscode";
LABEL_74:
      sub_100005A30(a1, +[NSDictionary dictionaryWithObject:v15 forKey:v76]);
    }
  }
  else
  {
    sub_100004C84(1, 2, @"%s: sending hide message", v66, v67, v68, v69, v70, (uint64_t)"handle_create_stashbag");
    if (a1 && v15)
    {
      CFStringRef v76 = @"HideDialog";
      goto LABEL_74;
    }
  }
  sub_100004C84(1, 2, @"%s: waiting for reboot", v71, v72, v73, v74, v75, (uint64_t)"handle_create_stashbag");
  dispatch_time_t v77 = dispatch_time(0, 14400000000000);
  if (dispatch_semaphore_wait(v29, v77)) {
    CFStringRef v83 = @"%s: stashbag timed out - destroying stashbag";
  }
  else {
    CFStringRef v83 = @"%s: disconnected from host - destroying stashbag";
  }
  sub_100004C84(1, 3, (uint64_t)v83, v78, v79, v80, v81, v82, (uint64_t)"handle_create_stashbag");
  MKBKeyBagKeyStashCreateWithMode();
LABEL_79:
  dispatch_release(v29);
LABEL_80:
  if (v22) {
    dispatch_release(v22);
  }
  if (v23) {

  }
LABEL_84:
  if (out_token[0]) {
    notify_cancel(out_token[0]);
  }
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v93, 8);
}

void sub_1000058A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000058D0(uint64_t a1, uint64_t a2)
{
}

void sub_1000058E0(uint64_t a1)
{
}

intptr_t sub_1000058EC(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    [+[NSString stringWithFormat:@"%@", a2] UTF8String];
    sub_100004C84(1, 2, @"%s: Policy successfully evaluated: %s", v4, v5, v6, v7, v8, (uint64_t)"handle_create_stashbag_block_invoke");
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
    id v10 = *(id *)(*(void *)(a1[6] + 8) + 40);
    [+[NSString stringWithFormat:@"%@", a3] UTF8String];
    sub_100004C84(1, 3, @"%s: evaluatePolicy: FAILED: %s", v11, v12, v13, v14, v15, (uint64_t)"handle_create_stashbag_block_invoke");
  }
  int v16 = a1[4];

  return dispatch_semaphore_signal(v16);
}

intptr_t sub_1000059D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C84(1, 3, @"%s: got disconnect notification", a4, a5, a6, a7, a8, (uint64_t)"handle_create_stashbag_block_invoke_2");
  uint64_t v9 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v9);
}

uint64_t sub_100005A30(uint64_t a1, void *a2)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = (uint64_t)[a2 mutableCopy];
      if (result)
      {
        uint64_t v4 = (void *)result;
        [result setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2)] forKey:@"Version"];
        int v5 = lockdown_send_message();

        if (v5)
        {
          sub_100004C84(1, 3, @"%s: failed to send message: %d", v6, v7, v8, v9, v10, (uint64_t)"_sendMessageDict");
          return 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_100005AE0(NSString *a1, NSString **a2)
{
  uint64_t v4 = (void *)MKBGetDeviceLockStateInfo();
  int v5 = v4;
  if (!v4)
  {
    CFStringRef v29 = @"couldn't fetch lock state";
LABEL_18:
    v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v37, v39);
    goto LABEL_19;
  }
  id v39 = [[objc_msgSend(v4, "description") UTF8String];
  sub_100004C84(1, 2, @"%s: returned %s\n", v6, v7, v8, v9, v10, (uint64_t)"is_keybag_recoverable");
  id v11 = [v5 objectForKey:kMKBInfoBagState];
  if (!v11)
  {
    v30 = +[NSString stringWithFormat:@"no keybag state in lock state: %@", 0, v39];
LABEL_19:
    a1 = +[NSString stringWithFormat:@"%s: %@", "is_keybag_recoverable", v30];
    BOOL v19 = 0;
LABEL_23:
    if (a1)
    {
      [(NSString *)a1 UTF8String];
      sub_100004C84(1, 2, @"%s: %s", v32, v33, v34, v35, v36, (uint64_t)"is_keybag_recoverable");
    }
    goto LABEL_10;
  }
  uint64_t v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v29 = @"keybag state was not Number type";
    goto LABEL_18;
  }
  unsigned __int8 v13 = [v12 unsignedIntValue];
  BOOL v19 = (v13 & 0x40) == 0;
  uint64_t v20 = "IS NOT";
  if ((v13 & 0x40) == 0) {
    uint64_t v20 = "IS";
  }
  uint64_t v40 = v20;
  sub_100004C84(1, 2, @"%s: keybag %s recoverable", v14, v15, v16, v17, v18, (uint64_t)"is_keybag_recoverable");
  if (a1)
  {
    id v21 = [v5 objectForKey:kMKBInfoRecoveryCountdown];
    if (v21)
    {
      v22 = v21;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a1 = (NSString)[v22 unsignedIntValue];
        sub_100004C84(1, 2, @"%s: recovery countdown: %lld", v23, v24, v25, v26, v27, (uint64_t)"is_keybag_recoverable");
        a1 = 0;
        goto LABEL_10;
      }
      uint64_t v31 = +[NSString stringWithFormat:@"keybag state was not Number type", v38, v40];
    }
    else
    {
      uint64_t v31 = +[NSString stringWithFormat:@"no recovery countdown in lock state: %@", v12, v40];
    }
    a1 = +[NSString stringWithFormat:@"%s: %@", "is_keybag_recoverable", v31];
    goto LABEL_23;
  }
LABEL_10:
  if (a2) {
    *a2 = a1;
  }
  if (v5) {

  }
  return v19;
}

uint64_t sub_100005D20(void *a1)
{
  int v28 = 0;
  uint64_t v29 = 0;
  uint64_t v2 = +[NSDate dateWithTimeIntervalSinceNow:900.0];
  if (v2)
  {
    uint64_t v3 = v2;
    while (!sub_100005AE0((NSString *)&v29, &v28))
    {
      if (!v29)
      {
        uint64_t v26 = v28;
        CFStringRef v17 = @"keybag is not recoverable and countdown time is 0 - stopping: \"%@\"";
        goto LABEL_13;
      }
      uint64_t v9 = v29 / 500000;
      sub_100004C84(1, 2, @"%s: waiting for keybag to be recoverable - %d seconds until recovery is possible", v4, v5, v6, v7, v8, (uint64_t)"wait_for_recoverable_keybag");
      unsigned int v15 = v9 >> (v9 > 0xA);
      if (v15 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v15;
      }
      uint64_t v27 = v16;
      sub_100004C84(1, 2, @"%s: waiting for keybag to be recoverable - sleeping for %d seconds", v10, v11, v12, v13, v14, (uint64_t)"wait_for_recoverable_keybag");
      sleep(v16);
      uint64_t v29 = 0;
      if ((id)[+[NSDate date] compare:v3] == (id)1)
      {
        CFStringRef v17 = @"timed out waiting for keybag to become recoverable";
LABEL_13:
        BOOL v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %@", "wait_for_recoverable_keybag", +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v26, v27));
        goto LABEL_14;
      }
    }
    uint64_t v18 = 1;
    BOOL v19 = v28;
    if (v28) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %@", "wait_for_recoverable_keybag", +[NSString stringWithFormat:@"couldn't create timeout object"]);
LABEL_14:
    uint64_t v18 = 0;
    int v28 = v19;
    if (v19)
    {
LABEL_15:
      [(NSString *)v19 UTF8String];
      sub_100004C84(1, 3, @"%s: %s", v20, v21, v22, v23, v24, (uint64_t)"wait_for_recoverable_keybag");
    }
  }
  if (a1) {
    *a1 = v28;
  }
  return v18;
}

uint64_t sub_100005EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C84(1, 2, @"%s: CURRENT(v2) host tools", a4, a5, a6, a7, a8, (uint64_t)"handle_clear_system_token");
  sub_100004C84(1, 2, @"%s: Clearing system token in preparation for an erase.", v9, v10, v11, v12, v13, (uint64_t)"handle_clear_system_token");
  uint64_t result = sub_100004BBC();
  unsigned int v15 = &kCFBooleanTrue;
  if (!result) {
    unsigned int v15 = &kCFBooleanFalse;
  }
  if (a1 && *v15)
  {
    uint64_t v16 = +[NSDictionary dictionaryWithObject:*v15 forKey:@"ClearSystemTokenSuccess"];
    return sub_100005A30(a1, v16);
  }
  return result;
}

void sub_100005FBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v59 = 0;
  sub_100004C84(1, 2, @"%s: starting", a4, a5, a6, a7, a8, (uint64_t)"handle_commit_stashbag");
  id v10 = [a2 objectForKey:@"Manifest"];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringRef v57 = @"manifest was not Data type";
LABEL_28:
      uint64_t v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %@", "handle_commit_stashbag", +[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v58));
      goto LABEL_17;
    }
  }
  if (!MGGetBoolAnswer()) {
    goto LABEL_15;
  }
  int v11 = MGGetBoolAnswer();
  if (!v10)
  {
    if (v11)
    {
      uint64_t v59 = +[NSString stringWithFormat:@"NULL manifest - manifest is required on this device"];
      [(NSString *)v59 UTF8String];
      sub_100004C84(1, 2, @"%s: %s", v23, v24, v25, v26, v27, (uint64_t)"handle_commit_stashbag");
      goto LABEL_17;
    }
    sub_100004C84(1, 3, @"%s: manifest not required - continuing", v12, v13, v14, v15, v16, (uint64_t)"handle_commit_stashbag");
    goto LABEL_15;
  }
  if (!v11)
  {
    if (MKBKeyBagKeyStashSetManifest()) {
      sub_100004C84(1, 2, @"%s: failed to set manifest: %d (not required - continuing)", v28, v29, v30, v31, v32, (uint64_t)"handle_commit_stashbag");
    }
    goto LABEL_15;
  }
  if (!sub_100005D20(&v59))
  {
    uint64_t v58 = v59;
    CFStringRef v57 = @"tried to wait for recoverable keybag, but keybag is not recoverable: %@";
    goto LABEL_28;
  }
  uint64_t v17 = MKBKeyBagKeyStashSetManifest();
  if (v17)
  {
    uint64_t v59 = +[NSString stringWithFormat:@"failed to set manifest: %d", v17];
    [(NSString *)v59 UTF8String];
    sub_100004C84(1, 3, @"%s: %s", v18, v19, v20, v21, v22, (uint64_t)"handle_commit_stashbag");
LABEL_17:
    uint64_t v49 = +[NSMutableDictionary dictionaryWithCapacity:2];
    if (v59)
    {
      [(NSString *)v59 UTF8String];
      sub_100004C84(1, 3, @"%s: failed - sending error back to host:%s", v50, v51, v52, v53, v54, (uint64_t)"handle_commit_stashbag");
      [(NSMutableDictionary *)v49 setObject:v59 forKey:@"ErrorString"];
    }
    else
    {
      sub_100004C84(1, 2, @"%s: failed - sending error back to host", v44, v45, v46, v47, v48, (uint64_t)"handle_commit_stashbag");
    }
    [(NSMutableDictionary *)v49 setObject:&off_100008EC8 forKey:@"Error"];
    [(NSMutableDictionary *)v49 setObject:&off_100008EE0 forKey:@"StashbagCommitComplete"];
    uint64_t v56 = a1;
    p_super = &v49->super;
    goto LABEL_24;
  }
LABEL_15:
  uint64_t v33 = MKBKeyBagKeyStashCommit();
  if (v33)
  {
    uint64_t v59 = +[NSString stringWithFormat:@"failed to commit stashbag: %d", v33];
    [(NSString *)v59 UTF8String];
    sub_100004C84(1, 3, @"%s: %s", v39, v40, v41, v42, v43, (uint64_t)"handle_commit_stashbag");
    MKBKeyBagKeyStashCreateWithMode();
    goto LABEL_17;
  }
  sub_100004C84(1, 2, @"%s: successfully committed stashbag", v34, v35, v36, v37, v38, (uint64_t)"handle_commit_stashbag");
  if (a1 && kCFBooleanTrue)
  {
    p_super = +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"StashbagCommitComplete"];
    uint64_t v56 = a1;
LABEL_24:
    sub_100005A30(v56, p_super);
  }
}

void sub_1000062C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = a1;
    if (dword_10000C0B0 == 1)
    {
      int v9 = 1;
LABEL_8:
      sub_100005008(a1, a2, v9, a4, a5, a6, a7, a8);
      return;
    }
    if (!lockdown_receive_message())
    {
      id v10 = [0 valueForKey:@"Command"];
      if (v10)
      {
        int v11 = v10;
        if ([v10 isEqualToString:@"CreateStashbag"])
        {
          a2 = 0;
          a1 = v8;
          int v9 = 0;
          goto LABEL_8;
        }
        if ([v11 isEqualToString:@"CommitStashbag"])
        {
          sub_100005FBC(v8, 0, v12, v13, v14, v15, v16, v17);
          return;
        }
        if ([v11 isEqualToString:@"ClearSystemToken"])
        {
          sub_100005EEC(v8, v18, v19, v20, v21, v22, v23, v24);
          return;
        }
        sub_100004C84(1, 3, @"%s: unknown command: %@", v20, v21, v22, v23, v24, (uint64_t)"handle_connection");
      }
    }
    if (kCFBooleanTrue) {
      sub_100005A30(v8, +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"Error"]);
    }
  }
}

void start(int a1, char **a2)
{
  while (1)
  {
    int v4 = getopt(a1, a2, "v:");
    if (v4 == 118)
    {
      dword_10000C0B0 = atoi(optarg);
    }
    else if (v4 == -1)
    {
      sub_100004C84(1, 2, @"%s: Preboard Service Version: %d", v5, v6, v7, v8, v9, (uint64_t)"main");
      lockdown_checkin_xpc();
      dispatch_main();
    }
  }
}

void sub_1000064C4(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  sub_1000062C8((uint64_t)a2, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  lockdown_disconnect();
  sub_100004C84(1, 2, @"%s: done", v8, v9, v10, v11, v12, (uint64_t)"main_block_invoke");
  exit(0);
}

void sub_100006518(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_100006590(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_100006608(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
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

uint64_t MKBGetDeviceLockStateInfo()
{
  return _MKBGetDeviceLockStateInfo();
}

uint64_t MKBKeyBagKeyStashCommit()
{
  return _MKBKeyBagKeyStashCommit();
}

uint64_t MKBKeyBagKeyStashCreateWithManifest()
{
  return _MKBKeyBagKeyStashCreateWithManifest();
}

uint64_t MKBKeyBagKeyStashCreateWithMode()
{
  return _MKBKeyBagKeyStashCreateWithMode();
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return _MKBKeyBagKeyStashPersist();
}

uint64_t MKBKeyBagKeyStashSetManifest()
{
  return _MKBKeyBagKeyStashSetManifest();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

int atoi(const char *a1)
{
  return _atoi(a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}