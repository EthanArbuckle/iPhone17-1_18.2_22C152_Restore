uint64_t sub_100003BB0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 == 3 || !*(_DWORD *)(a6 + 40))
  {
    if (a2 == 3) {
      NSLog(@"Error while copying");
    }
    return 2;
  }
  else if ([*(id *)(a6 + 48) isCancelled])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

Copier *sub_100003CA8()
{
  result = objc_alloc_init(Copier);
  qword_10000C648 = (uint64_t)result;
  return result;
}

uint64_t sub_100003CD0(int a1, uint64_t a2, unsigned int *a3, int *a4, _OWORD *a5)
{
  kern_return_t inserted;
  mach_port_name_t v22;
  mach_error_t v23;
  mach_error_t v24;
  mach_error_t v25;
  pid_t pidp;
  mach_port_t previous;
  audit_token_t atoken;
  CFErrorRef error;
  audit_token_t v30;

  mach_port_t v10 = mach_task_self_;
  pidp = -1;
  previous = 0;
  sub_100003FD8();
  *a3 = 0;
  *a4 = 0;
  if (!a1) {
    goto LABEL_15;
  }
  long long v11 = a5[1];
  *(_OWORD *)v30.val = *a5;
  *(_OWORD *)&v30.val[4] = v11;
  error = 0;
  long long v12 = a5[1];
  *(_OWORD *)atoken.val = *a5;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  atoken = v30;
  v13 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &atoken);
  if (!v13)
  {
    *a4 = 13;
LABEL_15:
    sub_100004048("pid %d does not have MDT entitlements", pidp);
    goto LABEL_16;
  }
  v14 = v13;
  CFTypeRef v15 = SecTaskCopyValueForEntitlement(v13, @"com.apple.MobileDataTransit.allow", &error);
  CFErrorRef v16 = error;
  if (error || !v15)
  {
    int v18 = 13;
    if (!v15) {
      goto LABEL_12;
    }
  }
  else
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    int v18 = 13;
    if (TypeID == CFGetTypeID(v15))
    {
      if (CFEqual(v15, kCFBooleanTrue)) {
        int v18 = 0;
      }
      else {
        int v18 = 13;
      }
    }
  }
  CFRelease(v15);
  CFErrorRef v16 = error;
LABEL_12:
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(v14);
  *a4 = v18;
  if (v18) {
    goto LABEL_15;
  }
  mach_error_t v20 = mach_port_allocate(v10, 1u, a3);
  if (v20)
  {
    *a4 = 22;
    mach_error_string(v20);
    sub_100004048("mach_port_allocate: %d (%s)");
LABEL_25:
    if (*a3)
    {
      mach_port_mod_refs(v10, *a3, 1u, -1);
      mach_port_deallocate(v10, *a3);
    }
    *a3 = 0;
    goto LABEL_16;
  }
  inserted = mach_port_insert_right(v10, *a3, *a3, 0x14u);
  v22 = *a3;
  if (inserted)
  {
    v23 = inserted;
    mach_port_mod_refs(v10, v22, 1u, -1);
    *a3 = 0;
    *a4 = 22;
    mach_error_string(v23);
    sub_100004048("mach_port_insert_right: %d (%s)");
    goto LABEL_25;
  }
  v24 = mach_port_move_member(v10, v22, dword_10000C6F8);
  if (v24)
  {
    *a4 = 22;
    mach_error_string(v24);
    sub_100004048("mach_port_move_member: %d (%s)");
    goto LABEL_25;
  }
  v25 = mach_port_request_notification(v10, *a3, 70, 1u, *a3, 0x15u, &previous);
  if (v25)
  {
    *a4 = 22;
    mach_error_string(v25);
    sub_100004048("mach_port_request_notification: %d (%s)");
    goto LABEL_25;
  }
  if (previous) {
    sub_100005ED4();
  }
  +[MDTSession sessionWithServerPort:*a3 clientPort:a2 pid:pidp];
  sub_1000040B8();
LABEL_16:
  sub_100003FD8();
  return 0;
}

void sub_100003FD8()
{
  if (qword_10000C698 && +[MDTSession sessionCount] <= 0)
  {
    v0 = (__CFRunLoopTimer *)qword_10000C698;
    double v1 = CFAbsoluteTimeGetCurrent() + 60.0;
    CFRunLoopTimerSetNextFireDate(v0, v1);
  }
}

void sub_100004048(char *a1, ...)
{
  va_start(va, a1);
  if (dword_10000C640) {
    int v1 = 5;
  }
  else {
    int v1 = 3;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v1, a1, va);
  }
  else {
    vsyslog(v1, a1, va);
  }
}

void sub_1000040B8()
{
  if (qword_10000C688) {
    BOOL v0 = qword_10000C698 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0) {
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
  }
}

uint64_t sub_1000040E8(uint64_t a1)
{
  if (!+[MDTSession sessionCount]) {
    sub_100004130();
  }
  sub_100003FD8();
  return 0;
}

void sub_100004130()
{
  if (qword_10000C688) {
    BOOL v0 = qword_10000C698 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0) {
    CFRunLoopAddTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
  }
}

uint64_t sub_100004160(uint64_t a1)
{
  int v1 = +[MDTSession lookupSessionForPort:a1];
  if (v1) {
    [v1[3] cancelCopy];
  }
  sub_100003FD8();
  return 0;
}

uint64_t sub_1000041A4(uint64_t a1, const char *a2, const char *a3, uint64_t a4, int a5, unsigned char *a6, int a7)
{
  sub_100004330("Copy %s -> %s\n", a2, a3);
  sub_100003FD8();
  id v14 = +[MDTSession lookupSessionForPort:a1];
  if (!v14) {
    return 268451842;
  }
  id v15 = v14;
  CFErrorRef v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithCString:a2 encoding:4]);
  v17 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithCString:a3 encoding:4]);
  if (a5)
  {
    int v18 = +[NSString stringWithCString:a4 encoding:4];
    if (!a6) {
      goto LABEL_9;
    }
  }
  else
  {
    int v18 = 0;
    if (!a6)
    {
LABEL_9:
      mach_error_t v20 = 0;
      goto LABEL_10;
    }
  }
  if (!*a6) {
    goto LABEL_9;
  }
  mach_error_t v20 = +[NSString stringWithCString:a6 encoding:4];
LABEL_10:
  LODWORD(v22) = a7;
  *((void *)v15 + 3) = +[Copier copierWithSourceURL:v16 uniqueIdentifier:v18 destURL:v17 sandboxExtension:v20 callbackTarget:v15 selector:"returnStatusWithDestURL:error:" options:v22];
  id v21 = *((id *)v15 + 3);
  [*((id *)v15 + 3) startCopy];
  sub_100003FD8();
  return 0;
}

void sub_100004330(char *a1, ...)
{
  va_start(va, a1);
  if (dword_10000C640) {
    int v1 = 5;
  }
  else {
    int v1 = 6;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v1, a1, va);
  }
  else {
    vsyslog(v1, a1, va);
  }
}

void start()
{
  mach_msg_return_t v13;
  BOOL v14;
  mach_msg_return_t v16;
  char *v17;
  uint64_t v18;
  integer_t port_info_out[4];
  long long v20;
  uint64_t v21;
  mach_msg_type_number_t port_info_outCnt;
  sigaction v23;
  mach_port_t sp;

  if (dword_10000C700)
  {
    BOOL v0 = asl_open(0, "com.apple.mdt", 2u);
    qword_10000C6D8 = (uint64_t)v0;
    if (v0)
    {
      if (dword_10000C6FC) {
        int v1 = 255;
      }
      else {
        int v1 = 127;
      }
      asl_set_filter(v0, v1);
    }
    else
    {
      fwrite("Error initializing ASL\n", 0x17uLL, 1uLL, __stderrp);
    }
  }
  else
  {
    openlog("com.apple.mdt", 9, 24);
    if (dword_10000C6FC) {
      int v2 = 255;
    }
    else {
      int v2 = 127;
    }
    setlogmask(v2);
  }
  port_info_outCnt = 0;
  *(_OWORD *)port_info_out = 0u;
  mach_error_t v20 = 0u;
  id v21 = 0;
  v3 = getprogname();
  sub_100004330("%s started", v3);
  qword_10000C758 = (uint64_t)vproc_transaction_begin(0);
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  v23.sa_mask = 0;
  v23.sa_flags = 2;
  sigaction(1, &v23, 0);
  sigaction(13, &v23, 0);
  sigaction(14, &v23, 0);
  sigaction(24, &v23, 0);
  sigaction(25, &v23, 0);
  sigaction(26, &v23, 0);
  sigaction(27, &v23, 0);
  sigaction(18, &v23, 0);
  sigaction(21, &v23, 0);
  sigaction(22, &v23, 0);
  sigaction(30, &v23, 0);
  sigaction(31, &v23, 0);
  v23.sa_flags = 0;
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100004904;
  sigaction(2, &v23, 0);
  sigaction(15, &v23, 0);
  v23.sa_flags = 10;
  sigaction(20, &v23, 0);
  if (pthread_mutexattr_init(&stru_10000C748)
    || pthread_mutexattr_settype(&stru_10000C748, 1)
    || pthread_mutex_init(&stru_10000C708, &stru_10000C748)
    || pthread_cond_init(&stru_10000C650, 0))
  {
    sub_100004048("could not initialize mutex: %m", v18);
  }
  else
  {
    pthread_mutex_lock(&stru_10000C708);
    if (pthread_create(&qword_10000C680, 0, (void *(__cdecl *)(void *))sub_1000049CC, 0))
    {
      pthread_mutex_unlock(&stru_10000C708);
      sub_100004048("could not start runloop thread: %m", v18);
    }
    else
    {
      while (!qword_10000C688)
      {
        if (pthread_cond_wait(&stru_10000C650, &stru_10000C708)) {
          __assert_rtn("main", "server.m", 694, "err == 0");
        }
      }
      pthread_mutex_unlock(&stru_10000C708);
      sp = 0;
      mach_error_t v4 = bootstrap_check_in(bootstrap_port, "com.apple.mdt", &sp);
      if (v4)
      {
        mach_error_string(v4);
        sub_100004048("bootstrap_check_in: %d (%s)");
      }
      else if (sp)
      {
        mach_error_t inserted = mach_port_insert_right(mach_task_self_, sp, sp, 0x14u);
        if (inserted)
        {
          mach_error_string(inserted);
          sub_100004048("mach_port_insert_right: %d (%s)");
        }
      }
      else
      {
        sub_100004048("launchd returned a NULL Mach port");
      }
      if (sp)
      {
        dword_10000C690 = sp;
        mach_error_t v5 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C6F8);
        if (v5)
        {
          mach_error_string(v5);
          sub_100004048("gPortSet mach_port_allocate: %d (%s)");
        }
        else
        {
          mach_error_t v6 = mach_port_move_member(mach_task_self_, dword_10000C690, dword_10000C6F8);
          if (!v6)
          {
            id v21 = 0;
            *(_OWORD *)port_info_out = 0u;
            mach_error_t v20 = 0u;
            port_info_outCnt = 10;
            mach_error_t attributes = mach_port_get_attributes(mach_task_self_, dword_10000C690, 2, port_info_out, &port_info_outCnt);
            if (attributes)
            {
              mach_error_t v8 = attributes;
              v9 = mach_error_string(attributes);
              sub_100004048("get status count: %d (%s)", v8, v9);
            }
            else if (!v20)
            {
              sleep(5u);
            }
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            qword_10000C698 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 60.0, 60.0, 0, 0, (CFRunLoopTimerCallBack)sub_100004A88, 0);
            if (pthread_create(qword_10000C6A0, 0, (void *(__cdecl *)(void *))sub_100004AC8, (void *)1)) {
              sub_100004048("could create ipc worker thread[%d]: %m", 1);
            }
            sub_100004130();
            while (1)
            {
              id v12 = objc_alloc_init((Class)NSAutoreleasePool);
              v13 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004B6C, 0x108Cu, dword_10000C6F8, 50331648);
              if (v13) {
                id v14 = v13 == 268451842;
              }
              else {
                id v14 = 1;
              }
              if (!v14 && v13 != 268451846)
              {
                CFErrorRef v16 = v13;
                v17 = mach_error_string(v13);
                sub_100004048("ipc main mach_msg_server: (%d) %s", v16, v17);
              }
              [v12 drain];
            }
          }
          mach_error_string(v6);
          sub_100004048("portset mach_port_move_member: %d (%s)");
        }
      }
    }
  }
  sub_100004950(1);
}

void sub_100004904(int a1)
{
  if (a1 != 20)
  {
    if (a1 == 15 || a1 == 2) {
      sub_100004950(0);
    }
    sub_100004330("got signal %d", a1);
  }
}

void sub_100004950(int a1)
{
  if (dword_10000C6F8)
  {
    mach_port_move_member(mach_task_self_, dword_10000C690, 0);
    mach_port_mod_refs(mach_task_self_, dword_10000C6F8, 3u, -1);
    dword_10000C6F8 = 0;
  }
  int v2 = getprogname();
  sub_100004330("%s exiting: %d", v2, a1);
  sub_100004CA4();
  exit(a1);
}

uint64_t sub_1000049CC()
{
  pthread_mutex_lock(&stru_10000C708);
  qword_10000C688 = (uint64_t)CFRunLoopGetCurrent();
  pthread_cond_broadcast(&stru_10000C650);
  pthread_mutex_unlock(&stru_10000C708);
  sub_100004130();
  CFRunLoopRunResult v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
  if (qword_10000C688) {
    BOOL v1 = v0 == kCFRunLoopRunStopped;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    do
    {
      if (v0 == kCFRunLoopRunFinished) {
        sleep(1u);
      }
      CFRunLoopRunResult v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (qword_10000C688) {
        BOOL v2 = v0 == kCFRunLoopRunStopped;
      }
      else {
        BOOL v2 = 1;
      }
    }
    while (!v2);
  }
  return 0;
}

void sub_100004A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10000C758)
  {
    vproc_transaction_end(0, (vproc_transaction_t)qword_10000C758);
    qword_10000C758 = 0;
  }
  sub_100004950(0);
}

void sub_100004AC8(const void *a1)
{
  mach_msg_return_t v3;
  BOOL v4;
  mach_msg_return_t v6;
  char *v7;

  while (1)
  {
    id v2 = objc_alloc_init((Class)NSAutoreleasePool);
    v3 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004B6C, 0x108Cu, dword_10000C6F8, 50331648);
    if (v3) {
      mach_error_t v4 = v3 == 268451842;
    }
    else {
      mach_error_t v4 = 1;
    }
    if (!v4 && v3 != 268451846)
    {
      mach_error_t v6 = v3;
      v7 = mach_error_string(v3);
      sub_100004048("ipc thread[%p] mach_msg_server: %d (%s)", a1, v6, v7);
    }
    [v2 drain];
  }
}

uint64_t sub_100004B6C(_DWORD *a1, uint64_t a2)
{
  pid_t pidp = -1;
  int v4 = a1[5];
  if ((v4 - 78) > 0xFFFFFFF1)
  {
    *(_DWORD *)a2 = *a1 & 0x1F;
    unsigned int v6 = a1[2];
    *(_DWORD *)(a2 + 4) = 36;
    *(void *)(a2 + 8) = v6;
    *(_DWORD *)(a2 + 20) = v4 + 100;
    int v7 = a1[5];
    if (v7 == 72 || v7 == 70)
    {
      *(_DWORD *)(a2 + 32) = -303;
      uint64_t audit_trailer = os_mach_msg_get_audit_trailer();
      if (audit_trailer)
      {
        long long v9 = *(_OWORD *)(audit_trailer + 36);
        *(_OWORD *)atoken.val = *(_OWORD *)(audit_trailer + 20);
        *(_OWORD *)&atoken.val[4] = v9;
        audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
        if (!pidp)
        {
          sub_1000040E8(a1[3]);
          *(_DWORD *)a2 = 0;
          *(_DWORD *)(a2 + 8) = 0;
          *(_DWORD *)(a2 + 32) = 0;
        }
      }
      else
      {
        sub_100004048("No Trailer");
      }
    }
    else
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 32) = -303;
    }
    return 1;
  }
  else
  {
    return sub_100005DE4(a1, a2);
  }
}

void sub_100004CA4()
{
  if (!dword_10000C700) {
    closelog();
  }
  if (qword_10000C6D8)
  {
    asl_close((asl_object_t)qword_10000C6D8);
    qword_10000C6D8 = 0;
  }
}

void sub_100004CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_10000C640) {
    int v9 = 5;
  }
  else {
    int v9 = 7;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v9, "now quitting (%d sec idle)", &a9);
  }
  else {
    vsyslog(v9, "now quitting (%d sec idle)", &a9);
  }
}

CFDictionaryRef sub_100004D5C(const __CFURL *a1, __CFError *a2)
{
  v20[0] = @"URL";
  v20[1] = @"Domain";
  v20[2] = @"Code";
  v20[3] = @"UserInfo";
  long long v18 = 0u;
  *(_OWORD *)cf = 0u;
  if (!a1)
  {
    CFIndex v4 = 0;
    uint64_t v3 = 1;
    if (!a2) {
      goto LABEL_19;
    }
LABEL_5:
    CFIndex valuePtr = CFErrorGetCode(a2);
    *((void *)&v18 + 1) = CFErrorGetDomain(a2);
    cf[0] = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
    CFDictionaryRef v5 = CFErrorCopyUserInfo(a2);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      uint64_t Count = CFDictionaryGetCount(v5);
      Mutable = CFDictionaryCreateMutable(0, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        int v9 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0);
        if (v9)
        {
          mach_port_t v10 = v9;
          CFDictionaryGetKeysAndValues(v6, v9, &v9[Count]);
          if (Count >= 1)
          {
            uint64_t v11 = Count;
            id v12 = v10;
            while (1)
            {
              v13 = v12[Count];
              CFTypeID v14 = CFGetTypeID(v13);
              if (v14 == CFErrorGetTypeID()) {
                break;
              }
              CFRetain(v13);
              if (v13) {
                goto LABEL_14;
              }
LABEL_15:
              ++v12;
              if (!--v11) {
                goto LABEL_16;
              }
            }
            v13 = (const void *)sub_100004D5C(0, v13);
            if (!v13) {
              goto LABEL_15;
            }
LABEL_14:
            CFDictionarySetValue(Mutable, *v12, v13);
            CFRelease(v13);
            goto LABEL_15;
          }
LABEL_16:
          CFAllocatorDeallocate(0, v10);
        }
      }
      CFRelease(v6);
    }
    else
    {
      Mutable = 0;
    }
    cf[1] = Mutable;
    v4 += 3;
    goto LABEL_19;
  }
  uint64_t v3 = 0;
  *(void *)&long long v18 = CFURLGetString(a1);
  CFIndex v4 = 1;
  if (a2) {
    goto LABEL_5;
  }
LABEL_19:
  CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)&v20[v3], (const void **)((unint64_t)&v18 | (8 * v3)), v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  return v15;
}

CFDictionaryRef sub_100004F9C(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(result, @"Domain");
    CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue(v1, @"Code");
    CFDictionaryRef v4 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"UserInfo");
    result = 0;
    CFIndex valuePtr = 0;
    if (Value)
    {
      if (v3)
      {
        CFNumberGetValue(v3, kCFNumberLongType, &valuePtr);
        return CFErrorCreate(0, Value, valuePtr, v4);
      }
    }
  }
  return result;
}

CFURLRef sub_100005040(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"URL");
  if (!Value) {
    return 0;
  }

  return CFURLCreateWithString(0, Value, 0);
}

CFTypeRef sub_10000508C(void *a1, const __CFString *a2, CFIndex a3)
{
  userInfoValues = a1;
  userInfoKeys = (void *)kCFErrorDescriptionKey;
  CFNumberRef v3 = CFErrorCreateWithUserInfoKeysAndValues(0, a2, a3, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  CFDictionaryRef v5 = sub_100004D5C(0, v3);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    CFTypeRef v7 = sub_100005150(v5);
    CFRelease(v6);
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

CFTypeRef sub_100005150(const void *a1)
{
  CFTypeRef v1 = a1;
  if (a1)
  {
    id v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
    if (v2)
    {
      CFNumberRef v3 = v2;
      CFWriteStreamOpen(v2);
      if (CFPropertyListWrite(v1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0))
      {
        CFTypeRef v1 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
        CFWriteStreamClose(v3);
      }
      else
      {
        CFTypeRef v1 = 0;
      }
      CFRelease(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

CFDataRef sub_1000051EC(CFDataRef theData)
{
  CFDataRef v1 = theData;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(v1);
    CFDictionaryRef v4 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, kCFAllocatorNull);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFPropertyListFormat format = 0;
      CFReadStreamOpen(v4);
      CFIndex v6 = CFDataGetLength(v1);
      CFDataRef v1 = (const __CFData *)CFPropertyListCreateWithStream(0, v5, v6, 0, &format, 0);
      CFReadStreamClose(v5);
      CFRelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_100005334(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000053E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005484(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFErrorRef sub_1000057BC(CFErrorRef result)
{
  if (result)
  {
    CFErrorRef v1 = result;
    id v2 = [(__CFError *)result userInfo];
    if (v2)
    {
      CFNumberRef v3 = v2;
      CFDictionaryRef v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v2 count]);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
            id v10 = [v3 valueForKey:v9];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v10 = (id)sub_1000057BC(v10);
            }
            else {
              id v11 = v10;
            }
            [(NSMutableDictionary *)v4 setObject:v10 forKey:v9];
          }
          id v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
    else
    {
      CFDictionaryRef v4 = 0;
    }
    return CFErrorCreate(0, (CFErrorDomain)[(__CFError *)v1 domain], (CFIndex)[(__CFError *)v1 code], (CFDictionaryRef)v4);
  }
  return result;
}

uint64_t sub_10000595C(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = a3;
  int v9 = 16777472;
  int v10 = a4;
  NDR_record_t v11 = NDR_record;
  int v12 = a2;
  int v13 = a4;
  uint64_t v5 = 2147483667;
  int v6 = a1;
  long long v7 = xmmword_100007E70;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 1, 0x3Cu, 0, 0, 0, 0);
}

uint64_t sub_1000059E8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 954437181) >= 0xFFFFFFFC) {
    return (uint64_t)*(&off_1000084E0 + 5 * (v1 - 954437177) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005A28(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  CFDictionaryRef v4 = (unsigned int *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 28);
  long long v7 = *(_OWORD *)(result + 76);
  v8[0] = *(_OWORD *)(result + 60);
  v8[1] = v7;
  result = sub_100003CD0(v5, v6, v4, (int *)(a2 + 48), v8);
  if (!result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100005B2C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)sub_1000040E8(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100005B88(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_46;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x48 || v4 > 0x1048) {
    goto LABEL_46;
  }
  unsigned int v6 = *((_DWORD *)result + 9);
  if (v6 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 72 < v6 || v4 < v7 + 72) {
    goto LABEL_46;
  }
  int v9 = (char *)&result[v7];
  unsigned int v10 = *((_DWORD *)v9 + 11);
  if (v10 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v11 = v4 - v7;
  unsigned int v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 72 < v10 || v11 < v12 + 72) {
    goto LABEL_46;
  }
  long long v14 = v9 - 1024;
  uint64_t v15 = (uint64_t)&v9[v12 - 1024];
  unsigned int v16 = *(_DWORD *)(v15 + 1076);
  if (v16 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v17 = v11 - v12;
  unsigned int v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 72 < v16 || v17 < v18 + 72) {
    goto LABEL_46;
  }
  uint64_t v20 = v15 - 1024;
  uint64_t v21 = v15 - 1024 + v18;
  unsigned int v22 = *(_DWORD *)(v21 + 2112);
  if (v22 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v23 = (v22 + 3) & 0xFFFFFFFC;
  unsigned int v24 = v17 - v18;
  if (v24 - 72 < v22 || v24 != v23 + 72) {
    goto LABEL_46;
  }
  uint64_t v26 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL) {
    uint64_t v26 = *((unsigned int *)result + 1);
  }
  result = (const char *)memchr((void *)(result + 40), 0, v26 - 40);
  if (!result) {
    goto LABEL_46;
  }
  v27 = &v3[v4];
  v28 = v14 + 1072;
  size_t v29 = v27 - (v14 + 1072) >= 1024 ? 1024 : v27 - (v14 + 1072);
  result = (const char *)memchr(v14 + 1072, 0, v29);
  if (!result) {
    goto LABEL_46;
  }
  uint64_t v30 = v20 + 2104;
  size_t v31 = (uint64_t)&v27[-v20 - 2104] >= 1024 ? 1024 : (size_t)&v27[-v20 - 2104];
  result = (const char *)memchr((void *)(v20 + 2104), 0, v31);
  if (result
    && ((uint64_t v32 = v21 - 1024, v33 = (unsigned char *)(v21 + 2116), v27 - v33 >= 1024) ? (v34 = 1024) : (v34 = v27 - v33),
        (result = (const char *)memchr(v33, 0, v34)) != 0))
  {
    result = (const char *)sub_1000041A4(*((unsigned int *)v3 + 3), v3 + 40, v28, v30, *(_DWORD *)(v32 + 3128), v33, *(_DWORD *)(v32 + v23 + 3140));
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
LABEL_46:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

_DWORD *sub_100005D88(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100004160(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_100005DE4(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 954437181) >= 0xFFFFFFFC
    && (int v5 = (void (*)(void))*(&off_1000084E0 + 5 * (v4 - 954437177) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100005E7C()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 329, "NULL != path");
}

void sub_100005EA8()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 330, "NULL != sourceFilename");
}

void sub_100005ED4()
{
  __assert_rtn("_server_create_session", "server.m", 187, "oldport == MACH_PORT_NULL");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return _CFErrorCreateWithUserInfoKeysAndValues(allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return _CFErrorGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFReadStreamCreateWithBytesNoCopy(alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return _CFURLGetString(anURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFWriteStreamCopyProperty(stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return _CFWriteStreamCreateWithAllocatedBuffers(alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

void asl_close(asl_object_t obj)
{
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

int asl_set_filter(asl_object_t client, int f)
{
  return _asl_set_filter(client, f);
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  return _asl_vlog(obj, msg, level, format, ap);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void closelog(void)
{
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return _copyfile_state_set(s, flag, src);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return _getprogname();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return _mach_port_get_attributes(task, name, flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  return _mach_port_move_member(task, member, after);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
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

void objc_enumerationMutation(id obj)
{
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void openlog(const char *a1, int a2, int a3)
{
}

uint64_t os_mach_msg_get_audit_trailer()
{
  return _os_mach_msg_get_audit_trailer();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setlogmask(int a1)
{
  return _setlogmask(a1);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

vproc_transaction_t vproc_transaction_begin(vproc_t virtual_proc)
{
  return _vproc_transaction_begin(virtual_proc);
}

void vproc_transaction_end(vproc_t virtual_proc, vproc_transaction_t handle)
{
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_cancelCopy(void *a1, const char *a2, ...)
{
  return [a1 cancelCopy];
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

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_serverPort(void *a1, const char *a2, ...)
{
  return [a1 serverPort];
}

id objc_msgSend_sessionCount(void *a1, const char *a2, ...)
{
  return [a1 sessionCount];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startCopy(void *a1, const char *a2, ...)
{
  return [a1 startCopy];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}