uint64_t sub_100004D70(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1;
}

void sub_1000054C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000054D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000054E8(uint64_t a1)
{
}

uint64_t sub_1000054F0(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, 0);
}

uint64_t sub_100005540(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_100005A98(a2, 0);

  return _objc_release_x1();
}

uint64_t sub_100005658(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  v4 = (const char *)[*(id *)(a1 + 40) UTF8String];

  return sqlite3_bind_text(a2, 2, v4, -1, 0);
}

uint64_t sub_100005770(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, 0);
}

void sub_100005924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005940(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_100005AD8(a2, 0);

  return _objc_release_x1();
}

void sub_100005A28(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100005A78(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sub_100005A98(sqlite3_stmt *a1, int a2)
{
  v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    v2 = +[NSString stringWithUTF8String:v2];
  }

  return v2;
}

NSNumber *sub_100005AD8(sqlite3_stmt *a1, int a2)
{
  sqlite3_int64 v2 = sqlite3_column_int64(a1, a2);

  return +[NSNumber numberWithLongLong:v2];
}

sqlite3 *sub_100005B18(void *a1, int a2)
{
  ppDb = 0;
  if (a2) {
    int v2 = 65537;
  }
  else {
    int v2 = 65542;
  }
  id v3 = [a1 path];
  int v4 = sqlite3_open_v2((const char *)[v3 UTF8String], &ppDb, v2, 0);

  if (v4)
  {
    v5 = sub_100009D24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003D1B8(v4, v5);
    }
  }
  return ppDb;
}

BOOL sub_100005BB0(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_100005BD0(const char *a1)
{
  return sub_100005BD8(a1, 384);
}

uint64_t sub_100005BD8(const char *a1, int a2)
{
  if (!a1) {
    sub_10003D230();
  }
  int v3 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v3 == -1)
  {
    v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003D25C();
    }

    return 0;
  }
  else
  {
    int v4 = v3;
    if (fstat(v3, &v9) < 0)
    {
      v7 = sub_100009D24();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003D2DC();
      }
    }
    else
    {
      if ((v9.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        uint64_t v5 = 1;
        if (v4 < 0) {
          return v5;
        }
        goto LABEL_16;
      }
      v7 = sub_100009D24();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003D35C();
      }
    }

    uint64_t v5 = 0;
    if ((v4 & 0x80000000) == 0) {
LABEL_16:
    }
      close(v4);
  }
  return v5;
}

uint64_t sub_100005D14(const char *a1)
{
  return sub_100005BD8(a1, 420);
}

CFArrayRef sub_100005D34(__CFReadStream *a1, int a2)
{
  CFErrorRef error = 0;
  if (!a1)
  {
    v8 = sub_100009D24();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = 0;
      goto LABEL_19;
    }
    sub_10003D3DC(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_16;
  }
  if (!CFReadStreamOpen(a1))
  {
    if (a2) {
      goto LABEL_16;
    }
    v16 = sub_100009D24();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v17 = "CreateMISAuthListWithStream: open stream failed (may be non-existing)";
    v18 = v16;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    uint32_t v20 = 2;
    goto LABEL_15;
  }
  CFPropertyListRef v4 = CFPropertyListCreateWithStream(0, a1, 0, 0, 0, &error);
  if (!v4)
  {
    v21 = sub_100009D24();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    CFErrorRef v25 = error;
    v17 = "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@";
    v18 = v21;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    uint32_t v20 = 12;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID()) {
    goto LABEL_17;
  }
  v7 = sub_100009D24();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: plist root has wrong type", buf, 2u);
  }
  CFRelease(v5);
LABEL_16:
  uint64_t v5 = 0;
LABEL_17:
  if (error) {
    CFRelease(error);
  }
LABEL_19:
  if (!v5 && a2) {
    return CFArrayCreate(0, 0, 0, &kCFTypeArrayCallBacks);
  }
  return (CFArrayRef)v5;
}

CFArrayRef sub_100005F10(const __CFString *a1, int a2)
{
  CFURLRef v3 = sub_10001237C(a1);
  if (v3)
  {
    CFURLRef v4 = v3;
    uint64_t v5 = CFReadStreamCreateWithFile(0, v3);
    CFArrayRef v6 = sub_100005D34(v5, a2);
    CFRelease(v4);
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    v7 = sub_100009D24();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D414(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0;
  }
  return v6;
}

BOOL sub_100005FA0(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    for (i = 0; i != v5; BOOL v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID())
      {
        if (!(*(unsigned int (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex)) {
          return v6;
        }
      }
      else
      {
        uint64_t v10 = sub_100009D24();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "authListIterate: row with unknown type", v12, 2u);
        }
      }
      ++i;
    }
  }
  return v6;
}

CFArrayRef sub_1000060A8()
{
  return sub_100005F10(@"Indeterminates.plist", 1);
}

BOOL sub_1000060BC(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    CFIndex v7 = 0;
    uint64_t v28 = a2;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        CFDictionaryRef v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, @"cdhash");
        uint64_t v12 = CFDictionaryGetValue(v10, @"upp-uuid");
        uint64_t v13 = CFDictionaryGetValue(v10, @"teamid");
        uint64_t v14 = CFDictionaryGetValue(v10, @"type");
        CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v10, @"grace");
        if (Value
          && (CFNumberRef v16 = v15, v17 = CFGetTypeID(Value), v17 == CFStringGetTypeID())
          && v12
          && (CFTypeID v18 = CFGetTypeID(v12), v18 == CFStringGetTypeID())
          && v13
          && (CFTypeID v19 = CFGetTypeID(v13), v19 == CFStringGetTypeID())
          && v14
          && (CFTypeID v20 = CFGetTypeID(v14), v20 == CFNumberGetTypeID()))
        {
          if (!v16 || (CFTypeID v21 = CFGetTypeID(v16), v21 != CFNumberGetTypeID()))
          {
            int valuePtr = 0;
            CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          }
          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(v28 + 16))(v28, Value, v12, v13, v14, v16))return v6; {
        }
          }
        else
        {
          v26 = sub_100009D24();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = buf;
            v24 = v26;
            CFErrorRef v25 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }
      else
      {
        v22 = sub_100009D24();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = 0;
          v23 = (uint8_t *)&v31;
          v24 = v22;
          CFErrorRef v25 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, v23, 2u);
        }
      }
      BOOL v6 = ++v7 >= v5;
      if (v5 == v7) {
        return v6;
      }
    }
  }
  return 1;
}

CFArrayRef sub_100006318()
{
  return sub_100005F10(@"Rejections.plist", 1);
}

BOOL sub_10000632C(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    CFIndex v7 = 0;
    uint64_t v27 = a2;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        CFDictionaryRef v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, @"upp-uuid");
        uint64_t v12 = CFDictionaryGetValue(v10, @"cdhash");
        uint64_t v13 = CFDictionaryGetValue(v10, @"teamid");
        CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v10, @"wholeProfile");
        if (Value
          && (CFNumberRef v15 = v14, v16 = CFGetTypeID(Value), v16 == CFStringGetTypeID())
          && v12
          && (CFTypeID v17 = CFGetTypeID(v12), v17 == CFStringGetTypeID())
          && v13
          && (CFTypeID v18 = CFGetTypeID(v13), v18 == CFStringGetTypeID())
          && v15
          && (CFTypeID v19 = CFGetTypeID(v15), v19 == CFNumberGetTypeID()))
        {
          int valuePtr = 0;
          if (CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
          {
            if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, BOOL))(v27 + 16))(v27, Value, v12, v13, valuePtr != 0))return v6; {
            goto LABEL_20;
            }
          }
          CFErrorRef v25 = sub_100009D24();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v28 = 0;
            CFTypeID v21 = (uint8_t *)&v28;
            v22 = v25;
            v23 = "rejectionListIterate: could not convert wholeProfile";
            goto LABEL_19;
          }
        }
        else
        {
          v24 = sub_100009D24();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            CFTypeID v21 = buf;
            v22 = v24;
            v23 = "rejectionListIterate: malformed row";
            goto LABEL_19;
          }
        }
      }
      else
      {
        CFTypeID v20 = sub_100009D24();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = 0;
          CFTypeID v21 = (uint8_t *)&v31;
          v22 = v20;
          v23 = "rejectionListIterate: row with unknown type";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }
LABEL_20:
      BOOL v6 = ++v7 >= v5;
      if (v5 == v7) {
        return v6;
      }
    }
  }
  return 1;
}

void sub_100006598(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_1000065B4()
{
  if (qword_10005B020 != -1) {
    dispatch_once(&qword_10005B020, &stru_100051878);
  }
  v0 = (void *)qword_10005B028;

  return v0;
}

void sub_100006608(id a1)
{
  qword_10005B028 = objc_opt_new();

  _objc_release_x1();
}

uint64_t sub_100006644(void *a1, void *a2, uint64_t a3)
{
  CFIndex v5 = a1;
  id v6 = a2;
  CFIndex v7 = (void *)xpc_connection_copy_entitlement_value();
  pid_t pid = xpc_connection_get_pid(v5);
  if (v7) {
    BOOL v9 = v7 == &_xpc_BOOL_false;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (v9)
  {
    int v11 = pid;
    uint64_t v12 = sub_100009D24();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003D44C(a3, v11, v12);
    }

    xpc_dictionary_set_int64(v6, "resu", 16);
    xpc_connection_send_message(v5, v6);
    xpc_connection_cancel(v5);
  }

  return v10;
}

void start()
{
  sub_100006870();
  sub_1000069A4();
  v0 = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v0, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_1000518B8);
  sub_100006E9C();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  CFStringRef v2 = (const __CFString *)sub_10000C7C0(@"denylist.map");
  sub_10000C2C4(v2, (char **)&v6);
  long long v3 = v6;
  long long v4 = v7;
  long long v5 = v8;
  sub_100010200((const void **)&v3);
  long long v3 = v6;
  long long v4 = v7;
  long long v5 = v8;
  sub_10000C66C((uint64_t)&v3);
  xpc_activity_register("com.apple.mis.profile-garbage-collection", XPC_ACTIVITY_CHECK_IN, &stru_100051900);
  xpc_activity_register("com.apple.online-auth-agent.check-indeterminates", XPC_ACTIVITY_CHECK_IN, &stru_100051920);
  xpc_activity_register("com.apple.online-auth-agent.reaper", XPC_ACTIVITY_CHECK_IN, &stru_100051940);
  xpc_activity_register("com.apple.mis.opportunistic-validation.boot", XPC_ACTIVITY_CHECK_IN, &stru_100051960);
  xpc_activity_register("com.apple.online-auth-agent.denylist-update", XPC_ACTIVITY_CHECK_IN, &stru_100051980);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_100006870()
{
  mode_t v0 = umask(0x12u);
  CFIndex Length = CFStringGetLength(@"/private/var/db/MobileIdentityData");
  CFIndex v2 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  long long v3 = (char *)CFAllocatorAllocate(0, v2, 0);
  if (v3)
  {
    long long v4 = v3;
    if (CFStringGetCString(@"/private/var/db/MobileIdentityData", v3, v2, 0x8000100u))
    {
      if ((mkdir(v4, 0x1EDu) & 0x80000000) == 0 || *__error() == 17) {
        goto LABEL_13;
      }
      long long v5 = sub_100009D24();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10003D53C((uint64_t)v4, v5);
      }
    }
    else
    {
      long long v5 = sub_100009D24();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10003D508();
      }
    }

LABEL_13:
    CFAllocatorDeallocate(0, v4);
    return umask(v0);
  }
  long long v6 = sub_100009D24();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003D4D4();
  }

  return umask(v0);
}

void sub_1000069A4()
{
  mode_t v0 = sub_100009D24();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Creating UserTrust.db if it doesn't exist", v1, 2u);
  }
}

void sub_100006A1C(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006B28;
    handler[3] = &unk_1000518E0;
    long long v8 = v2;
    uint64_t v10 = v8;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_resume(v8);
    long long v5 = v10;
  }
  else
  {
    xpc_type_t v4 = type;
    long long v5 = sub_100009D24();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid && v4 == (xpc_type_t)&_xpc_type_error)
    {
      if (v6) {
        sub_10003D5DC();
      }
    }
    else if (v6)
    {
      sub_10003D610();
    }
  }
}

void sub_100006B28(uint64_t a1, void *a2)
{
  id v4 = a2;
  sub_10000866C(*(void **)(a1 + 32), v4);
}

void sub_100006B88(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  id v4 = (id)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  if (state) {
    sub_100010398();
  }
}

void sub_100006BF0(id a1, OS_xpc_object *a2)
{
  activity = a2;
  CFIndex v2 = (void *)os_transaction_create();
  if (xpc_activity_get_state(activity)) {
    sub_100011174(1, activity);
  }
}

void sub_100006C5C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2))
  {
    sub_100009DCC();
  }
}

void sub_100006C94(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  long long v3 = (void *)os_transaction_create();
  if (xpc_activity_get_state(v2))
  {
    id v4 = sub_100009D24();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking whether opportunistic validation is needed", buf, 2u);
    }

    char v10 = 0;
    char v5 = MISExistsIndeterminateApps();
    BOOL v6 = sub_100009D24();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Yes, performing opportunistic validation.", v9, 2u);
      }

      sub_100011174(0, v2);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)long long v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Opportunistic validation not necessary.", v8, 2u);
      }
    }
  }
}

void sub_100006DE0(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2))
  {
    sub_10000F670();
    if (_os_feature_enabled_impl())
    {
      CFIndex v2 = sub_1000065B4();
      id v5 = 0;
      [v2 syncLaunchWarningsAndReturnError:&v5];
      id v3 = v5;
      if (v3)
      {
        id v4 = sub_100009D24();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_10003D644((uint64_t)v3, v4);
        }
      }
    }
  }
}

void sub_100006E9C()
{
  mode_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  targetq = dispatch_queue_create("com.apple.mis.relister", v0);

  xpc_set_event_stream_handler("com.apple.distnoted.matching", targetq, &stru_100051A08);
}

void sub_100006F18(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  id v3 = (void *)os_transaction_create();
  id v4 = sub_100009D24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Relister invoked.", buf, 2u);
  }

  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string && !strcmp(string, "Application Installed"))
  {
    BOOL v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Relister handling app installation.", v13, 2u);
    }

    BOOL v7 = xpc_dictionary_get_value(v2, "UserInfo");
    long long v8 = v7;
    if (v7)
    {
      if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
      {
        char v10 = _CFXPCCreateCFObjectFromXPCObject();
        BOOL v9 = v10;
        if (v10)
        {
          int v11 = [v10 objectForKeyedSubscript:@"bundleIDs"];
          uint64_t v12 = v11;
          if (v11) {
            [v11 enumerateObjectsUsingBlock:&stru_100051A48];
          }
        }
        else
        {
          uint64_t v12 = sub_100009D24();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_10003D6F0();
          }
        }
      }
      else
      {
        BOOL v9 = sub_100009D24();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10003D724();
        }
      }
    }
    else
    {
      BOOL v9 = sub_100009D24();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003D6BC();
      }
    }
  }
}

void sub_100007108(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4 placeholder:0];
    BOOL v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 bundleURL];
      long long v8 = [v7 path];

      if (v8)
      {
        [v7 path];
        MISQueryBlacklistForBundle();
      }
    }
  }
  else
  {
    BOOL v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003D758();
    }
  }
}

uint64_t sub_1000072A8()
{
  if (qword_10005B038 != -1) {
    dispatch_once(&qword_10005B038, &stru_100051A68);
  }
  return byte_10005B030;
}

void sub_1000072EC(id a1)
{
  sub_10000F614();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  char v1 = sub_10000F648() ^ 1;
  CFIndex v2 = sub_10000F664();
  byte_10005B030 = [v3 isEqualToString:v2] & v1;
}

uint64_t sub_100007360(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  CFDataRef v17 = a1;
  id v18 = a2;
  id v56 = a3;
  id v19 = a4;
  id v59 = a5;
  id v57 = a6;
  id v58 = a7;
  id v20 = a9;
  CFTypeID v21 = a10;
  v22 = a11;
  v23 = sub_100012584(v17);
  v24 = sub_100009D24();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v72 = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Performing auth request for: %@, %@, %@", buf, 0x20u);
  }

  if (sub_10003CEBC(v18))
  {
    CFErrorRef v25 = sub_100009D24();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "UPP is ready.", buf, 2u);
    }

    sub_10000CAEC(@"AuthListReadyCdHashes.plist", v23);
    sub_10000CF24(v23, v18);
    uint64_t v26 = v21[2](v21, 65);
    goto LABEL_19;
  }
  if (_os_feature_enabled_impl()) {
    goto LABEL_18;
  }
  id v66 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v27 = (void (*)(id *))off_10005B040;
  v70 = off_10005B040;
  if (!off_10005B040)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100009A10;
    v72 = &unk_100051AB8;
    v73 = &v67;
    sub_100009A10((uint64_t)buf);
    uint64_t v27 = (void (*)(id *))v68[3];
  }
  _Block_object_dispose(&v67, 8);
  if (!v27) {
    sub_10003D78C();
  }
  __int16 v28 = v27(&v66);
  id v29 = v66;
  if (v29 || !v28)
  {

    goto LABEL_21;
  }
  v30 = [v28 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
  BOOL v31 = (objc_opt_respondsToSelector() & 1) != 0 && (~[v30 intValue] & 0x21) == 0;

  if (!v31)
  {
LABEL_21:
    if (([v19 BOOLValue] & 1) == 0)
    {
      *(void *)buf = 0;
      MISCopyProvisioningProfile();
      if (*(void *)buf)
      {
        if (MISProvisioningProfileHasPPQExemption())
        {
          CFRelease(*(CFTypeRef *)buf);
          sub_10000CF24(v23, v18);
          uint64_t v26 = v21[2](v21, 1);
          goto LABEL_19;
        }
        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
      }
    }
    v34 = sub_10000C934((uint64_t)&unk_10005AE20, dword_10005B01C);
    v54 = sub_10000C934((uint64_t)&unk_10005ADD8, dword_10005AE1C);
    if (sub_10000CA1C(v34, v18) || sub_10000CA1C(v54, v59))
    {
      v35 = sub_100009D24();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "UPP or Team ID is exempt.", buf, 2u);
      }

      sub_10000CF24(v23, v18);
      uint64_t v36 = v21[2](v21, 1);
    }
    else
    {
      if ([(__CFData *)v17 length] == (id)20 || [(__CFData *)v17 length] == (id)32)
      {
        v37 = +[NSMutableData dataWithLength:16];
        if (v37)
        {
          id v53 = v37;
          id v38 = [v53 mutableBytes];
          if (v38 && !SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v38))
          {
            v52 = sub_100007BA4();
            if (v52)
            {
              v51 = sub_100007D0C(v17, v18);
              if (v51)
              {
                unsigned int v40 = sub_10000E648(v23);
                unsigned int v41 = sub_10000E8E0(v18);
                v50 = sub_100007E6C(v53, v52, v18, v51, v59, v40, v41, v56, v19, v57, v58, v20, a8);
                if (v50)
                {
                  v60[0] = _NSConcreteStackBlock;
                  v60[1] = 3221225472;
                  v60[2] = sub_1000082B8;
                  v60[3] = &unk_100051A90;
                  id v48 = v18;
                  id v61 = v48;
                  v47 = v23;
                  v62 = v47;
                  id v42 = v59;
                  id v63 = v42;
                  uint64_t v65 = a8;
                  v64 = v21;
                  v49 = objc_retainBlock(v60);
                  if (sub_10000A734(v50, 0, v49))
                  {
                    uint64_t v32 = 1;
                  }
                  else
                  {
                    v46 = sub_100009D24();
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Could not perform authorization attempt. Forcing indeterminate...", buf, 2u);
                    }

                    sub_10000DC54(v47, v48, v42, a8, 0, 0);
                    uint64_t v32 = v22[2](v22);
                  }
                }
                else
                {
                  v45 = sub_100009D24();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                    sub_10003D8A0();
                  }

                  uint64_t v32 = v22[2](v22);
                }
              }
              else
              {
                v44 = sub_100009D24();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                  sub_10003D86C();
                }

                uint64_t v32 = v22[2](v22);
              }
            }
            else
            {
              v43 = sub_100009D24();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                sub_10003D838();
              }

              uint64_t v32 = v22[2](v22);
            }

            goto LABEL_33;
          }
        }
        v39 = sub_100009D24();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10003D804();
        }
      }
      else
      {
        v39 = sub_100009D24();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10003D8D4();
        }
      }

      uint64_t v36 = v22[2](v22);
    }
    uint64_t v32 = v36;
LABEL_33:

    goto LABEL_20;
  }
LABEL_18:
  sub_10000CF24(v23, v18);
  uint64_t v26 = v21[2](v21, 1);
LABEL_19:
  uint64_t v32 = v26;
LABEL_20:

  return v32;
}

void sub_100007B84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100007BA4()
{
  mode_t v0 = (void *)sub_1000122A8();
  uint64_t v1 = v0;
  if (!v0)
  {
    CFNumberRef v14 = sub_100009D24();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003D908();
    }

    goto LABEL_14;
  }
  id v2 = [v0 lengthOfBytesUsingEncoding:4];
  size_t v3 = (v2 + 15) & 0xFFFFFFF0;
  id v4 = sub_100012678([v1 UTF8String], (size_t)v2, v3);
  if (!v4)
  {
LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  id v5 = v4;
  BOOL v6 = sub_100012620(v3);
  if (!v6)
  {
    free(v5);
    goto LABEL_14;
  }
  BOOL v7 = v6;
  mach_port_t v8 = sub_1000126CC();
  io_connect_t v9 = v8;
  if (!v8)
  {
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  int v10 = sub_100012764(v8, (uint64_t)v5, (uint64_t)v7, v3);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = sub_100009D24();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003D93C(v11, v12);
    }

    goto LABEL_9;
  }
  uint64_t v13 = +[NSData dataWithBytes:v7 length:v2];
LABEL_19:
  free(v5);
  free(v7);
  if (v9) {
    j__IOServiceClose(v9);
  }
LABEL_15:

  return v13;
}

id sub_100007D0C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [objc_alloc((Class)NSMutableData) initWithData:v4];

  if (v5)
  {
    id v6 = v3;
    id v7 = [v6 UTF8String];
    if (v7)
    {
      [v5 appendBytes:v7 length:objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4)];
      ccsha256_di();
      [v5 length];
      [v5 bytes];
      ccdigest();
      id v8 = [objc_alloc((Class)NSData) initWithBytes:v11 length:32];
      goto LABEL_8;
    }
    io_connect_t v9 = sub_100009D24();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003D9B4();
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

id sub_100007E6C(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, unsigned int a7, void *a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13)
{
  id v51 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v52 = a5;
  id v50 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  id v48 = v23;
  v49 = v22;
  if (!v25)
  {
    id v36 = 0;
    BOOL v31 = v20;
    uint64_t v32 = v50;
    v30 = v51;
    v33 = v21;
    goto LABEL_18;
  }
  uint64_t v26 = [v51 base64EncodedStringWithOptions:0];
  [v25 setObject:v26 forKey:@"nonce"];

  [v25 setObject:@"INSTALL_FINE_GRAINED" forKey:@"action"];
  uint64_t v27 = [v18 base64EncodedStringWithOptions:0];
  [v25 setObject:v27 forKey:@"deviceID"];

  [v25 setObject:v19 forKey:@"profileID"];
  __int16 v28 = [v20 base64EncodedStringWithOptions:0];
  [v25 setObject:v28 forKey:@"appID"];

  id v29 = +[NSNumber numberWithLong:a13];
  [v25 setObject:v29 forKey:@"checkType"];

  [v25 setObject:v22 forKey:@"cdVersion"];
  [v25 setObject:v23 forKey:@"signingTime"];
  v30 = v51;
  BOOL v31 = v20;
  uint64_t v32 = v50;
  v33 = v21;
  if (v24 && a13 == 1)
  {
    v34 = sub_100011AB8(v24, v31);
    v35 = v34;
    if (v34 && [v34 count]) {
      [v25 setObject:v35 forKey:@"appIdentity"];
    }
  }
  if (v50) {
    [v25 setObject:v50 forKey:@"universalProfile"];
  }
  if (v21) {
    [v25 setObject:v21 forKey:@"localProfile"];
  }
  if ([v52 isEqual:&stru_100054200])
  {
    [v25 setObject:&stru_100054200 forKey:@"teamID"];
LABEL_17:
    v43 = +[NSNumber numberWithBool:a6];
    [v25 setObject:v43 forKey:@"previousRejected"];

    v44 = +[NSNumber numberWithInt:a7];
    [v25 setObject:v44 forKey:@"rejectedApps"];

    id v36 = v25;
    goto LABEL_18;
  }
  v37 = v31;
  id v38 = [v52 dataUsingEncoding:4];
  ccsha256_di();
  [v38 length];
  id v39 = v38;
  [v39 bytes];
  ccdigest();
  unsigned int v40 = +[NSData dataWithBytes:v53 length:32];
  if (v40)
  {
    unsigned int v41 = v40;
    id v42 = [v40 base64EncodedStringWithOptions:0];
    [v25 setObject:v42 forKey:@"teamID"];

    BOOL v31 = v37;
    uint64_t v32 = v50;
    v30 = v51;
    goto LABEL_17;
  }

  id v36 = 0;
  uint64_t v32 = v50;
  v30 = v51;
LABEL_18:

  return v36;
}

void sub_1000082B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  int v30 = 0;
  if (v3)
  {
    id v5 = [v3 valueForKey:@"validity"];
    if (v5) {
      sub_10000EE94(*(void **)(a1 + 32), v5);
    }
  }
  id v7 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  id v29 = 0;
  sub_10000DC54(v6, v7, v8, v9, (uint64_t)&v30, (uint64_t)&v29);
  id v10 = v29;
  if (v4)
  {
    int v11 = [v4 valueForKey:@"actions"];
    if ([v11 containsObject:@"AUTHORIZED"])
    {
      uint64_t v12 = sub_100009D24();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v13;
        __int16 v33 = 2112;
        uint64_t v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Authorized: %@, %@", buf, 0x16u);
      }

      sub_10000CF24(*(void **)(a1 + 40), *(void **)(a1 + 32));
      sub_10000D6A4(*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
    else
    {
      if ([v11 containsObject:@"REJECT_APP_FOR_PROFILE"])
      {
        CFTypeID v16 = sub_100009D24();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v17 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v32 = v17;
          __int16 v33 = 2112;
          uint64_t v34 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejected app/profile combination: %@, %@", buf, 0x16u);
        }

        id v19 = *(void **)(a1 + 32);
        id v20 = *(void **)(a1 + 40);
        id v21 = *(void **)(a1 + 48);
        char v22 = 0;
      }
      else
      {
        if (![v11 containsObject:@"REJECT_APP_AND_PROFILE"])
        {
          if ([v11 containsObject:@"REJECT_PROFILE"])
          {
            uint64_t v26 = sub_100009D24();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = *(void *)(a1 + 32);
              uint64_t v27 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              uint64_t v32 = v27;
              __int16 v33 = 2112;
              uint64_t v34 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Permanently rejected profile: %@, %@", buf, 0x16u);
            }

            sub_10000CAEC(@"AuthListBannedUpps.plist", *(void **)(a1 + 32));
            sub_10000CAEC(@"AuthListBannedCdHashes.plist", *(void **)(a1 + 40));
            sub_10000CF24(*(void **)(a1 + 40), *(void **)(a1 + 32));
            sub_10000D6A4(*(void **)(a1 + 32), *(void **)(a1 + 40));
          }
          goto LABEL_22;
        }
        id v23 = sub_100009D24();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          uint64_t v24 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v32 = v24;
          __int16 v33 = 2112;
          uint64_t v34 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Rejected profile: %@, %@", buf, 0x16u);
        }

        id v19 = *(void **)(a1 + 32);
        id v20 = *(void **)(a1 + 40);
        id v21 = *(void **)(a1 + 48);
        char v22 = 1;
      }
      sub_10000E450(v19, v20, v21, v22);
      sub_10000CF24(*(void **)(a1 + 40), *(void **)(a1 + 32));
    }
LABEL_22:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_23;
  }
  CFNumberRef v15 = sub_100009D24();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Did not receive a valid response.", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_23:
}

void sub_10000866C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      id v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "connection is now invalid.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v12, buf, 2u);
      }
    }
    else
    {
      if (v4 != &_xpc_error_termination_imminent) {
        goto LABEL_7;
      }
      id v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "termination imminent, canceling connection.";
        goto LABEL_27;
      }
    }
LABEL_28:

    xpc_connection_cancel(v3);
    id v8 = 0;
    goto LABEL_29;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DAB0();
    }
    goto LABEL_28;
  }
LABEL_7:
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (!reply) {
    sub_10003D9E8();
  }
  id v8 = reply;
  string = xpc_dictionary_get_string(v4, "type");
  if (!string)
  {
    int v11 = sub_100009D24();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003DA14();
    }
LABEL_20:

    xpc_connection_cancel(v3);
    goto LABEL_29;
  }
  id v10 = string;
  if (!strncmp(string, "ping", 4uLL))
  {
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      uint64_t v13 = v3;
      id v8 = v8;
      xpc_dictionary_set_int64(v8, "resu", 1);
      xpc_dictionary_set_string(v8, "pong", "pong!");
      xpc_connection_send_message(v13, v8);
    }
  }
  else if (!strncmp(v10, "auth", 4uLL))
  {
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      uint64_t v14 = v3;
      id v15 = v4;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v40 = 3221225472;
      unsigned int v41 = sub_100009BAC;
      id v42 = &unk_100051B18;
      id v8 = v8;
      id v43 = v8;
      v44 = v14;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100009BEC;
      v37[3] = &unk_100051B40;
      CFTypeID v16 = objc_retainBlock(buf);
      id v38 = v16;
      uint64_t v17 = objc_retainBlock(v37);
      size_t length = 0;
      data = xpc_dictionary_get_data(v15, "cdha", &length);
      id v19 = xpc_dictionary_get_string(v15, "uuid");
      id v20 = xpc_dictionary_get_string(v15, "team");
      uint64_t v32 = xpc_dictionary_get_string(v15, "apppath");
      id v21 = xpc_dictionary_get_value(v15, "univ");
      uint64_t v34 = xpc_dictionary_get_value(v15, "locl");
      __int16 v33 = xpc_dictionary_get_value(v15, "cdvr");
      xpc_dictionary_get_value(v15, "sgnt");
      xpc_object_t xint = (xpc_object_t)objc_claimAutoreleasedReturnValue();
      if (data && v19 && v20)
      {
        BOOL v31 = +[NSData dataWithBytes:data length:length];
        int v30 = +[NSString stringWithUTF8String:v19];
        if (v21)
        {
          id v29 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v21)];
        }
        else
        {
          id v29 = 0;
        }
        if (v34)
        {
          uint64_t v28 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v34)];
        }
        else
        {
          uint64_t v28 = 0;
        }
        if (v33)
        {
          uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v33)];
        }
        else
        {
          uint64_t v27 = &off_1000547A8;
        }
        if (xint)
        {
          uint64_t v26 = +[NSNumber numberWithLongLong:xpc_int64_get_value(xint)];
        }
        else
        {
          uint64_t v26 = &off_1000547A8;
        }
        id v23 = +[NSString stringWithUTF8String:v20];
        if (v32)
        {
          uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        }
        else
        {
          uint64_t v24 = 0;
        }
        int int64 = xpc_dictionary_get_int64(v15, "ckty");
        sub_100007360(v31, v30, v29, v28, v23, v27, v26, int64, v24, v16, v17);
      }
      else
      {
        char v22 = sub_100009D24();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10003DA48();
        }

        ((void (*)(void *))v17[2])(v17);
      }
    }
  }
  else if (!strncmp(v10, "trst", 4uLL))
  {
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.trust.set")) {
      sub_100008DE8(v3, v4, v8);
    }
  }
  else if (!strncmp(v10, "blov", 4uLL))
  {
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.trust.set")) {
      sub_100009250(v3, v4, v8);
    }
  }
  else if (!strncmp(v10, "rqup", 4uLL))
  {
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.trust.set")) {
      sub_10000946C(v3, v4, v8);
    }
  }
  else
  {
    if (strncmp(v10, "lwov", 4uLL))
    {
      if (!strncmp(v10, "chlw", 4uLL))
      {
        sub_1000096E0(v3, v4, v8);
        goto LABEL_29;
      }
      int v11 = sub_100009D24();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003DA7C();
      }
      goto LABEL_20;
    }
    if (sub_100006644(v3, v8, (uint64_t)"com.apple.private.mis.trust.set")) {
      sub_1000094FC(v3, v4, v8);
    }
  }
LABEL_29:
}

void sub_100008DE8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100009C18;
  v34[3] = &unk_100051B68;
  uint64_t v37 = 0;
  id v6 = a3;
  id v35 = v6;
  id v7 = v5;
  id v36 = v7;
  id v8 = a2;
  uint64_t v9 = objc_retainBlock(v34);
  size_t length = 0;
  string = xpc_dictionary_get_string(v8, "uuid");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "trst");
  BOOL v12 = xpc_dictionary_get_BOOL(v8, "usdb");
  uint64_t v13 = (void *)xpc_dictionary_get_string(v8, "team");
  data = (const UInt8 *)xpc_dictionary_get_data(v8, "xsig", &length);

  if (string)
  {
    id v15 = +[NSString stringWithUTF8String:string];
    id v30 = [objc_alloc((Class)NSUUID) initWithUUIDString:v15];
    if (v13)
    {
      uint64_t v13 = +[NSString stringWithUTF8String:v13];
    }
    if (data)
    {
      CFDataRef v16 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
      if (!v16)
      {
        uint64_t v17 = sub_100009D24();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10003DBA0();
        }

        ((void (*)(void *))v9[2])(v9);
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      CFDataRef v16 = 0;
    }
    id v19 = sub_100009D24();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      id v39 = string;
      __int16 v40 = 1024;
      BOOL v41 = v11;
      __int16 v42 = 1024;
      BOOL v43 = v12;
      __int16 v44 = 2112;
      v45 = v13;
      __int16 v46 = 2112;
      CFDataRef v47 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting trust for UPP %s: trust: %d, use db: %d, team ID: %@, auxiliary signature: %@", buf, 0x2Cu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v12)
    {
      id v29 = v13;
      id v21 = objc_opt_new();
      char v22 = v21;
      if (v11)
      {
        uint64_t v32 = 0;
        id v23 = (id *)&v32;
        [v21 createUserTrustedProfileEntryWithUuid:v30 teamId:v29 signature:v16 error:&v32];
      }
      else
      {
        uint64_t v31 = 0;
        id v23 = (id *)&v31;
        [v21 deleteTrustedProfileWithUuid:v30 error:&v31];
      }
      id v25 = *v23;
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = sub_100009D24();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10003DB18((uint64_t)string, (uint64_t)v26, v27);
        }

        ((void (*)(void *))v9[2])(v9);
        uint64_t v13 = v29;
        goto LABEL_33;
      }
      if (v11) {
        CFStringRef v28 = @"MISUPPTrustSet";
      }
      else {
        CFStringRef v28 = @"MISUPPTrustRevoked";
      }
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v28, 0, 0, 0);

      uint64_t v13 = v29;
    }
    else
    {
      if (v11)
      {
        sub_10000CAEC(@"UserTrustedUpps.plist", v15);
        CFStringRef v24 = @"MISUPPTrustSet";
      }
      else
      {
        sub_10000CD50(@"UserTrustedUpps.plist", v15);
        CFStringRef v24 = @"MISUPPTrustRevoked";
      }
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v24, 0, 0, 0);
    }
    xpc_dictionary_set_int64(v6, "resu", 256);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
    if (v16) {
      CFRelease(v16);
    }
    goto LABEL_33;
  }
  uint64_t v18 = sub_100009D24();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10003DAE4();
  }

  ((void (*)(void *))v9[2])(v9);
LABEL_34:
}

void sub_100009250(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100009C64;
  v20[3] = &unk_100051B90;
  id v6 = a3;
  id v21 = v6;
  id v7 = v5;
  id v22 = v7;
  id v8 = a2;
  uint64_t v9 = objc_retainBlock(v20);
  size_t length = 0;
  data = xpc_dictionary_get_data(v8, "cdha", &length);
  uint int64 = xpc_dictionary_get_uint64(v8, "haty");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (data)
  {
    id v12 = objc_alloc((Class)NSMutableData);
    CFDataRef v13 = (const __CFData *)[v12 initWithBytes:data length:length];
    CFDataRef v14 = v13;
    if (v13)
    {
      [(__CFData *)v13 appendBytes:&uint64 length:4];
      id v15 = sub_100012584(v14);
      if (v11) {
        sub_10000CAEC(@"UserOverriddenCdHashes.plist", v15);
      }
      else {
        sub_10000CD50(@"UserOverriddenCdHashes.plist", v15);
      }
      xpc_dictionary_set_int64(v6, "resu", 1024);
      xpc_connection_send_message((xpc_connection_t)v7, v6);
    }
    else
    {
      uint64_t v17 = sub_100009D24();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003DC08();
      }

      ((void (*)(void *))v9[2])(v9);
    }
  }
  else
  {
    CFDataRef v16 = sub_100009D24();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003DBD4();
    }

    ((void (*)(void *))v9[2])(v9);
  }
}

void sub_10000946C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  connection = a1;
  uint int64 = xpc_dictionary_get_uint64(a2, "phas");
  sub_10000EB64(uint64);
  xpc_dictionary_set_int64(v5, "resu", 512);
  xpc_connection_send_message(connection, v5);
}

void sub_1000094FC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009CA4;
  v19[3] = &unk_100051B90;
  id v6 = a3;
  id v20 = v6;
  id v7 = v5;
  id v21 = v7;
  id v8 = a2;
  uint64_t v9 = objc_retainBlock(v19);
  uint int64 = xpc_dictionary_get_uint64(v8, "lwid");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (v11)
  {
    uint32_t v12 = notify_post("com.apple.mis.warning.override");
    if (v12)
    {
      int v13 = v12;
      CFDataRef v14 = sub_100009D24();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003DCB4(v13, v14);
      }
    }
  }
  id v15 = sub_1000065B4();
  id v18 = 0;
  [v15 setUserOverride:v11 forID:uint64 error:&v18];
  id v16 = v18;
  if (v16)
  {
    uint64_t v17 = sub_100009D24();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003DC3C((uint64_t)v16, v17);
    }

    ((void (*)(void *))v9[2])(v9);
  }
  else
  {
    xpc_dictionary_set_int64(v6, "resu", 1024);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
  }
}

void sub_1000096E0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009CE4;
  v24[3] = &unk_100051B90;
  id v7 = a3;
  id v25 = v7;
  id v8 = v5;
  id v26 = v8;
  uint64_t v9 = objc_retainBlock(v24);
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "cdhd", &length);
  if (data && length)
  {
    BOOL v11 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data);
    int64_t int64 = xpc_dictionary_get_int64(v6, "cdht");
    int v13 = sub_100009D24();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v28 = int64;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "XPC: checking launch warning data for: %llu, %@", buf, 0x16u);
    }

    CFDataRef v14 = sub_1000065B4();
    id v22 = 0;
    id v15 = [v14 lookupLaunchWarningData:v11 cdhashType:int64 error:&v22];
    id v16 = v22;
    uint64_t v17 = sub_100009D24();
    id v18 = v17;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = [v15 length];
        *(_DWORD *)buf = 138412546;
        int64_t v28 = (int64_t)v15;
        __int16 v29 = 2048;
        id v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "XPC: launch warning data response: %@, %lu", buf, 0x16u);
      }

      id v20 = v15;
      xpc_dictionary_set_data(v7, "warndata", [v20 bytes], (size_t)[v20 length]);
      xpc_dictionary_set_int64(v7, "resu", 0);
      xpc_connection_send_message((xpc_connection_t)v8, v7);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003DD60((uint64_t)v16, v18);
      }

      ((void (*)(void *))v9[2])(v9);
    }
  }
  else
  {
    id v21 = sub_100009D24();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003DD2C();
    }

    ((void (*)(void *))v9[2])(v9);
  }
}

void *sub_100009A10(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10005B048)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100009B38;
    v4[4] = &unk_100051AF0;
    v4[5] = v4;
    long long v5 = off_100051AD8;
    uint64_t v6 = 0;
    qword_10005B048 = _sl_dlopen();
  }
  id v2 = (void *)qword_10005B048;
  if (!qword_10005B048) {
    sub_10003DDD8(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "MAECopyActivationRecordWithError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10005B040 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100009B38()
{
  uint64_t result = _sl_dlopen();
  qword_10005B048 = result;
  return result;
}

uint64_t sub_100009BAC(uint64_t a1, int64_t value)
{
  return 1;
}

uint64_t sub_100009BEC(uint64_t a1)
{
  return 0;
}

uint64_t sub_100009C18(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0;
}

uint64_t sub_100009C64(uint64_t a1)
{
  return 0;
}

uint64_t sub_100009CA4(uint64_t a1)
{
  return 0;
}

uint64_t sub_100009CE4(uint64_t a1)
{
  return 0;
}

id sub_100009D24()
{
  if (qword_10005B058 != -1) {
    dispatch_once(&qword_10005B058, &stru_100051BB0);
  }
  if (qword_10005B050) {
    mode_t v0 = (void *)qword_10005B050;
  }
  else {
    mode_t v0 = &_os_log_default;
  }

  return v0;
}

void sub_100009D88(id a1)
{
  qword_10005B050 = (uint64_t)os_log_create("com.apple.mis", "mis");

  _objc_release_x1();
}

void sub_100009DCC()
{
  kern_return_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  kern_return_t v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  pid_t *v19;
  pid_t *v20;
  int v21;
  uint64_t v22;
  pid_t *v23;
  pid_t v24;
  pid_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  int v43;
  uint8_t v44[4];
  pid_t v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  int v52[2];

  BOOL v43 = 0;
  *(void *)id v52 = 0x600000001;
  __int16 v42 = 4;
  mode_t v0 = sub_100009D24();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "The reaper woke up.", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  CFDictionaryRef v1 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
  io_object_t v3 = MatchingService;
  if (MatchingService)
  {
    id v4 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)buf);
    if (v4)
    {
      long long v5 = v4;
      uint64_t v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003DF78(v5, v6);
      }
    }
    else
    {
      CFDataRef v14 = IOConnectCallMethod(*(mach_port_t *)buf, 4u, 0, 0, 0, 0, 0, 0, 0, 0);
      if (!v14) {
        goto LABEL_13;
      }
      id v15 = v14;
      uint64_t v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003DF00(v15, v6);
      }
    }
  }
  else
  {
    uint64_t v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DEC8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

LABEL_13:
  if (*(_DWORD *)buf) {
    IOServiceClose(*(io_connect_t *)buf);
  }
  if (v3) {
    IOObjectRelease(v3);
  }
  id v16 = sysctl(v52, 2u, &v43, &v42, 0, 0);
  uint64_t v17 = sub_100009D24();
  id v18 = v17;
  if (v16 == -1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003DE58(v18, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_36;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    CFDataRef v47 = v43;
    id v48 = 2048;
    v49 = 4;
    id v50 = 2048;
    id v51 = 4 * v43;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "pid space %d*%lu = %lu", buf, 0x1Cu);
  }

  id v19 = (pid_t *)malloc_type_malloc(4 * v43, 0x100004052888210uLL);
  if (!v19)
  {
    id v18 = sub_100009D24();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003DE90(v18, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_36:

    return;
  }
  id v20 = v19;
  id v21 = proc_listallpids(v19, 4 * v43);
  if (v21 >= 1)
  {
    id v22 = v21;
    id v23 = v20;
    do
    {
      id v25 = *v23++;
      CFStringRef v24 = v25;
      if ((csops() & 0x80000000) != 0)
      {
        id v26 = sub_100009D24();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v44 = 67109120;
          v45 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "reaper could not get cdhash for pid %d", v44, 8u);
        }
      }
      else
      {
        id v26 = +[NSData dataWithBytes:buf length:20];
        if (MISQueryBlacklistForCdHash())
        {
          uint64_t v27 = sub_100009D24();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v44 = 67109120;
            v45 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "reaping process %d", v44, 8u);
          }

          kill(v24, 9);
        }
      }

      --v22;
    }
    while (v22);
  }
  free(v20);
}

void sub_10000A614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A664(uint64_t a1)
{
  id v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
  io_object_t v3 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t sub_10000A6C4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_10000A718(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL sub_10000A734(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v86 = a3;
  int v83 = a2;
  if (a2 < 3)
  {
    id v92 = 0;
    v85 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v92];
    id v8 = v92;
    uint64_t v6 = v8;
    if (!v85)
    {
      BOOL v49 = v8 == 0;
      oslog = sub_100009D24();
      BOOL v50 = os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      if (v49)
      {
        if (v50) {
          sub_10003E1E0();
        }
      }
      else if (v50)
      {
        sub_10003E214(v6);
      }
      BOOL v7 = 0;
      goto LABEL_81;
    }
    uint64_t v9 = sub_100009D24();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [objc_alloc((Class)NSString) initWithData:v85 encoding:4];
      id v11 = [v10 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Full JSON message to send: %s", buf, 0xCu);
    }
    oslog = [v5 objectForKey:@"appID"];
    v80 = [v5 objectForKey:@"profileID"];
    uint32_t v12 = sub_100009D24();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = oslog;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v80;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Signing JSON message for %@, %@", buf, 0x16u);
    }

    id v78 = v85;
    uint32_t v13 = arc4random_uniform(0x2A300u);
    id v79 = objc_alloc_init((Class)NSMutableData);
    SecAccessControlRef cf = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0);
    *(void *)&long long v123 = 0;
    *((void *)&v123 + 1) = &v123;
    uint64_t v124 = 0x2020000000;
    CFDataRef v14 = (id *)qword_10005B060;
    v125 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B060;
    if (!qword_10005B060)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000BF08;
      v114 = &unk_100051AB8;
      v115 = &v123;
      id v15 = (void *)sub_10000BF58();
      uint64_t v16 = dlsym(v15, "kMAOptionsBAAKeychainLabel");
      *((void *)v115[1].isa + 3) = v16;
      qword_10005B060 = *((void *)v115[1].isa + 3);
      CFDataRef v14 = *(id **)(*((void *)&v123 + 1) + 24);
    }
    _Block_object_dispose(&v123, 8);
    if (!v14) {
      sub_10003E2A0();
    }
    id v17 = *v14;
    *(void *)v119 = v17;
    *(void *)&long long v123 = @"com.apple.online-auth.ppq-identity";
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    id v18 = (id *)qword_10005B070;
    v106 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B070;
    if (!qword_10005B070)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000C0C4;
      v114 = &unk_100051AB8;
      v115 = &v103;
      id v19 = (void *)sub_10000BF58();
      id v20 = dlsym(v19, "kMAOptionsBAAKeychainAccessGroup");
      *((void *)v115[1].isa + 3) = v20;
      qword_10005B070 = *((void *)v115[1].isa + 3);
      id v18 = (id *)v104[3];
    }
    _Block_object_dispose(&v103, 8);
    if (!v18) {
      sub_10003E318();
    }
    id v21 = *v18;
    *(void *)&v119[8] = v21;
    *((void *)&v123 + 1) = @"online-auth-agent";
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    id v22 = (id *)qword_10005B078;
    v106 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B078;
    if (!qword_10005B078)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000C114;
      v114 = &unk_100051AB8;
      v115 = &v103;
      id v23 = (void *)sub_10000BF58();
      CFStringRef v24 = dlsym(v23, "kMAOptionsBAANetworkTimeoutInterval");
      *((void *)v115[1].isa + 3) = v24;
      qword_10005B078 = *((void *)v115[1].isa + 3);
      id v22 = (id *)v104[3];
    }
    _Block_object_dispose(&v103, 8);
    if (!v22) {
      sub_10003E390();
    }
    id v25 = *v22;
    *(void *)&v119[16] = v25;
    uint64_t v124 = (uint64_t)&off_1000547C0;
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    id v26 = (id *)qword_10005B080;
    v106 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B080;
    if (!qword_10005B080)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000C164;
      v114 = &unk_100051AB8;
      v115 = &v103;
      uint64_t v27 = (void *)sub_10000BF58();
      int64_t v28 = dlsym(v27, "kMAOptionsBAAValidity");
      *((void *)v115[1].isa + 3) = v28;
      qword_10005B080 = *((void *)v115[1].isa + 3);
      id v26 = (id *)v104[3];
    }
    _Block_object_dispose(&v103, 8);
    if (!v26) {
      sub_10003E408();
    }
    id v29 = *v26;
    id v120 = v29;
    id v30 = +[NSNumber numberWithUnsignedInt:v13 + 172800];
    v125 = v30;
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    uint64_t v31 = (id *)qword_10005B088;
    v106 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B088;
    if (!qword_10005B088)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000C1B4;
      v114 = &unk_100051AB8;
      v115 = &v103;
      uint64_t v32 = (void *)sub_10000BF58();
      __int16 v33 = dlsym(v32, "kMAOptionsBAASCRTAttestation");
      *((void *)v115[1].isa + 3) = v33;
      qword_10005B088 = *((void *)v115[1].isa + 3);
      uint64_t v31 = (id *)v104[3];
    }
    _Block_object_dispose(&v103, 8);
    if (!v31) {
      sub_10003E480();
    }
    id v34 = *v31;
    id v121 = v34;
    v126 = (void (*)(uint64_t))&__kCFBooleanFalse;
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    id v35 = (id *)qword_10005B090;
    v106 = (uint64_t (*)(uint64_t, uint64_t))qword_10005B090;
    if (!qword_10005B090)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10000C204;
      v114 = &unk_100051AB8;
      v115 = &v103;
      id v36 = (void *)sub_10000BF58();
      uint64_t v37 = dlsym(v36, "kMAOptionsBAAAccessControls");
      *((void *)v115[1].isa + 3) = v37;
      qword_10005B090 = *((void *)v115[1].isa + 3);
      id v35 = (id *)v104[3];
    }
    _Block_object_dispose(&v103, 8);
    if (!v35) {
      sub_10003E4F8();
    }
    id v122 = *v35;
    id v127 = cf;
    id v38 = v122;
    id v39 = +[NSDictionary dictionaryWithObjects:&v123 forKeys:v119 count:6];

    dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x3032000000;
    v106 = sub_10000B854;
    v107 = sub_10000B864;
    id v108 = 0;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x2020000000;
    uint64_t v102 = 0;
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x3032000000;
    v96 = sub_10000B854;
    v97 = sub_10000B864;
    id v98 = 0;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_10000BD94;
    v114 = &unk_100051C50;
    v116 = &v103;
    v117 = &v99;
    v118 = &v93;
    BOOL v41 = v40;
    v115 = v41;
    id v42 = v39;
    BOOL v43 = buf;
    *(void *)v109 = 0;
    v110 = v109;
    uint64_t v111 = 0x2020000000;
    __int16 v44 = off_10005B098;
    v112 = off_10005B098;
    if (!off_10005B098)
    {
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_10000C254;
      v128[3] = &unk_100051AB8;
      v129 = v109;
      v45 = (void *)sub_10000BF58();
      __int16 v46 = dlsym(v45, "DeviceIdentityIssueClientCertificateWithCompletion");
      *(void *)(*((void *)v129 + 1) + 24) = v46;
      off_10005B098 = *(_UNKNOWN **)(*((void *)v129 + 1) + 24);
      __int16 v44 = (void *)*((void *)v110 + 3);
    }
    _Block_object_dispose(v109, 8);
    if (!v44)
    {
      v76 = +[NSAssertionHandler currentHandler];
      v77 = +[NSString stringWithUTF8String:"void wl_DeviceIdentityIssueClientCertificateWithCompletion(__strong dispatch_queue_t, NSDictionary *__strong, __strong MABAACompletionBlock)"];
      [v76 handleFailureInFunction:v77 file:@"online_auth_server.m" lineNumber:34 description:@"%s", dlerror()];

      __break(1u);
    }
    ((void (*)(void, id, unsigned char *))v44)(0, v42, v43);

    dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    CFRelease(cf);
    CFDataRef v47 = (void *)v100[3];
    if (v104[5])
    {
      id v48 = sub_100009D24();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_10003E6B8((uint64_t)&v104, v48);
      }
    }
    else if (v47 && (id v51 = (void *)v94[5]) != 0)
    {
      id v52 = [v51 objectAtIndexedSubscript:0];
      id v53 = (const void *)SecIdentityCreate();

      if (v53)
      {
        id v48 = +[NSMutableDictionary dictionary];
        v54 = [(id)v94[5] objectAtIndexedSubscript:1];
        v128[0] = v54;
        v55 = +[NSArray arrayWithObjects:v128 count:1];
        [v48 setObject:v55 forKeyedSubscript:kSecCMSAdditionalCerts];

        int v56 = SecCMSCreateSignedData();
        if (!v56)
        {
          if (sub_1000072A8())
          {
            v74 = [v79 base64EncodedStringWithOptions:33];
            v75 = sub_100009D24();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v109 = 0;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "CMS Blob:", v109, 2u);
            }

            [v74 enumerateLinesUsingBlock:&stru_100051C90];
          }
          CFRelease(v53);
          id v58 = v79;
LABEL_47:

          _Block_object_dispose(&v93, 8);
          _Block_object_dispose(&v99, 8);
          _Block_object_dispose(&v103, 8);

          if (!v58)
          {
            BOOL v7 = 0;
LABEL_80:

LABEL_81:
            goto LABEL_82;
          }
          id v59 = +[NSURL URLWithString:@"https://ppq.apple.com/v2/authorization"];
          if (sub_1000072A8())
          {
            id v60 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mis"];
            id v61 = [v60 stringForKey:@"serverUrl"];

            if (v61)
            {
              uint64_t v62 = +[NSURL URLWithString:v61];

              id v59 = (void *)v62;
            }
            id v63 = sub_100009D24();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              LODWORD(v123) = 138412290;
              *(void *)((char *)&v123 + 4) = v59;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "ppq Server URL is %@", (uint8_t *)&v123, 0xCu);
            }
          }
          if (!v59)
          {
            uint64_t v65 = sub_100009D24();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_10003E570();
            }
            BOOL v7 = 0;
            goto LABEL_79;
          }
          v64 = +[NSMutableURLRequest requestWithURL:v59];
          uint64_t v65 = v64;
          if (v64)
          {
            [v64 setHTTPMethod:@"POST"];
            [v65 addValue:@"8bit" forHTTPHeaderField:@"Content-Transfer-Encoding"];
            [v65 addValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
            id v66 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
            uint64_t v67 = v66;
            if (v66)
            {
              [v66 setTimeoutIntervalForRequest:10.0];
              [v67 setTimeoutIntervalForResource:10.0];
              v68 = objc_alloc_init(OnlineAuthAgentURLSessionDelegate);
              cfa = +[NSURLSession sessionWithConfiguration:v67 delegate:v68 delegateQueue:0];
              if (cfa)
              {
                *(void *)&long long v123 = 0;
                *((void *)&v123 + 1) = &v123;
                uint64_t v124 = 0x3032000000;
                v125 = sub_10000B854;
                v126 = sub_10000B864;
                id v127 = (id)os_transaction_create();
                v87[0] = _NSConcreteStackBlock;
                v87[1] = 3221225472;
                v87[2] = sub_10000B86C;
                v87[3] = &unk_100051C28;
                int v91 = v83;
                id v88 = v5;
                id v89 = v86;
                v90 = &v123;
                uint64_t v69 = objc_retainBlock(v87);
                v70 = sub_100009D24();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v119 = 138412546;
                  *(void *)&v119[4] = oslog;
                  *(_WORD *)&v119[12] = 2112;
                  *(void *)&v119[14] = v80;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Sending request for %@, %@", v119, 0x16u);
                }

                v71 = [cfa uploadTaskWithRequest:v65 fromData:v58 completionHandler:v69];
                [cfa finishTasksAndInvalidate];
                BOOL v7 = v71 != 0;
                if (v71)
                {
                  [v71 resume];
                }
                else
                {
                  v72 = *(void **)(*((void *)&v123 + 1) + 40);
                  *(void *)(*((void *)&v123 + 1) + 40) = 0;
                }
                _Block_object_dispose(&v123, 8);
              }
              else
              {
                BOOL v7 = 0;
              }

              goto LABEL_78;
            }
          }
          else
          {
            uint64_t v67 = sub_100009D24();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              sub_10003E5A4();
            }
          }
          BOOL v7 = 0;
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }
        id v57 = sub_100009D24();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_10003E640(v56, v57);
        }

        CFRelease(v53);
      }
      else
      {
        id v48 = sub_100009D24();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10003E60C();
        }
      }
    }
    else
    {
      id v48 = sub_100009D24();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_10003E5D8();
      }
    }
    id v58 = 0;
    goto LABEL_47;
  }
  uint64_t v6 = sub_100009D24();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v83;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Maximum number of attempts (%d) reached, bailing out.", buf, 8u);
  }
  BOOL v7 = 0;
LABEL_82:

  return v7;
}

void sub_10000B7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_10000B854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B864(uint64_t a1)
{
}

void sub_10000B86C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v41 = 0;
  id v10 = sub_100009D24();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Response received", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v11 = [v8 statusCode], v11 == (id)200))
  {
    int v12 = 0;
    if (v7) {
      goto LABEL_6;
    }
LABEL_16:
    id v23 = sub_100009D24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Server returned no data", buf, 2u);
    }
    goto LABEL_20;
  }
  id v21 = v11;
  id v22 = sub_100009D24();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v43[0] = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Server returned HTTP status code %ld", buf, 0xCu);
  }

  int v12 = 1;
  if (!v7) {
    goto LABEL_16;
  }
LABEL_6:
  uint64_t ApplePPQSigning = SecPolicyCreateApplePPQSigning();
  if (!ApplePPQSigning)
  {
    id v23 = sub_100009D24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10003E7C0();
    }
LABEL_20:

    goto LABEL_21;
  }
  CFDataRef v14 = (const void *)ApplePPQSigning;
  int v15 = SecCMSVerifyCopyDataAndAttributes();
  if (v15)
  {
    int v16 = v15;
    id v17 = sub_100009D24();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43[0]) = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not verify the CMS blob, received error %d", buf, 8u);
    }

    id v18 = sub_100009D24();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
      id v20 = [v19 UTF8String];
      *(_DWORD *)buf = 136315138;
      v43[0] = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The server returned: %s", buf, 0xCu);
    }
    CFRelease(v14);
    goto LABEL_21;
  }
  CFRelease(v14);
  if (v12)
  {
LABEL_21:
    CFStringRef v24 = sub_100009D24();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *(_DWORD *)(a1 + 56) + 1;
      *(_DWORD *)buf = 67109376;
      LODWORD(v43[0]) = v25;
      WORD2(v43[0]) = 1024;
      *(_DWORD *)((char *)v43 + 6) = 3;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Could not complete online authorization (attempt %d/%d).", buf, 0xEu);
    }

    if (v9)
    {
      id v26 = sub_100009D24();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10003E738(v9);
      }
    }
    if ((sub_10000A734(*(void *)(a1 + 32), (*(_DWORD *)(a1 + 56) + 1), *(void *)(a1 + 40)) & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    int64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = 0;
    goto LABEL_30;
  }
  id v29 = v41;
  id v30 = sub_100009D24();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [objc_alloc((Class)NSString) initWithData:v41 encoding:4];
    id v32 = [v31 UTF8String];
    *(_DWORD *)buf = 136315138;
    v43[0] = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "The server returned: %s", buf, 0xCu);
  }
  id v40 = 0;
  __int16 v33 = +[NSJSONSerialization JSONObjectWithData:v41 options:0 error:&v40];
  id v34 = v40;
  int64_t v28 = v34;
  if (v33)
  {
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v34)
    {
      id v36 = sub_100009D24();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v28 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v43[0] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Could not convert JSON to Dictionary: %@", buf, 0xCu);
      }
    }
    id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v35();
  uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
  id v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = 0;

LABEL_30:
}

void sub_10000BD94(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (v9 && [v9 count] == (id)2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BE54(id a1, NSString *a2, BOOL *a3)
{
  id v4 = a2;
  *a3 = 0;
  id v5 = sub_100009D24();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void *sub_10000BF08(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAAKeychainLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B060 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000BF58()
{
  v2[0] = 0;
  if (!qword_10005B068)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_10000C050;
    v2[4] = &unk_100051AF0;
    v2[5] = v2;
    long long v3 = off_100051CB0;
    uint64_t v4 = 0;
    qword_10005B068 = _sl_dlopen();
  }
  uint64_t v0 = qword_10005B068;
  if (!qword_10005B068) {
    sub_10003E7F4(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_10000C050()
{
  uint64_t result = _sl_dlopen();
  qword_10005B068 = result;
  return result;
}

void *sub_10000C0C4(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAAKeychainAccessGroup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B070 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C114(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAANetworkTimeoutInterval");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B078 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C164(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAAValidity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B080 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C1B4(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAASCRTAttestation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B088 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C204(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "kMAOptionsBAAAccessControls");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10005B090 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C254(uint64_t a1)
{
  id v2 = (void *)sub_10000BF58();
  uint64_t result = dlsym(v2, "DeviceIdentityIssueClientCertificateWithCompletion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10005B098 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000C2A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000C2C4(const __CFString *a1@<X0>, char **a2@<X8>)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  int v6 = (char *)CFAllocatorAllocate(0, v5, 0);
  if (v6)
  {
    if (CFStringGetCString(a1, v6, v5, 0x8000100u))
    {
      int v7 = open(v6, 0);
      if ((v7 & 0x80000000) == 0)
      {
        int v8 = v7;
        off_t v9 = lseek(v7, 0, 2);
        if (v9 > 23)
        {
          int v16 = (char *)mmap(0, v9, 1, 2, v8, 0);
          if (v16 == (char *)-1)
          {
            id v19 = sub_100009D24();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_10003EA94();
            }
            uint64_t v11 = -1;
          }
          else
          {
            uint64_t v11 = (uint64_t)v16;
            a2[2] = 0;
            a2[3] = 0;
            *((_DWORD *)a2 + 6) = v8;
            a2[4] = v16;
            a2[5] = (char *)v9;
            *a2 = v16;
            a2[1] = 0;
            if (*(_DWORD *)v16 == 1134124660)
            {
              unint64_t v17 = *((unsigned int *)v16 + 2);
              if (v9 >= v17)
              {
                CFStringRef v24 = &v16[v17];
                uint64_t v25 = *((unsigned int *)v16 + 3);
                id v26 = &v24[32 * v25];
                a2[1] = v24;
                a2[2] = v26;
                uint64_t v27 = &v26[4 * v25];
                off_t v28 = v27 - &v16[v9];
                if (v27 <= &v16[v9])
                {
LABEL_35:
                  CFAllocatorDeallocate(0, v6);
                  return;
                }
                id v29 = sub_100009D24();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  int v31 = 134217984;
                  off_t v32 = v28;
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Denylist is %td bytes short for entry count", (uint8_t *)&v31, 0xCu);
                }
              }
              else
              {
                id v18 = sub_100009D24();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  sub_10003EB10();
                }
              }
            }
            else
            {
              id v20 = sub_100009D24();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                sub_10003EB98();
              }
            }
          }
        }
        else
        {
          uint64_t v10 = sub_100009D24();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_10003EA0C(v9, v10);
          }
          if (v9 < 1) {
            goto LABEL_30;
          }
          uint64_t v11 = 0;
        }
        if ((unint64_t)(v11 + 1) >= 2) {
          munmap((void *)v11, v9);
        }
LABEL_30:
        close(v8);
        goto LABEL_31;
      }
      int v14 = *__error();
      int v15 = sub_100009D24();
      if (v14 == 2)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_10003E950();
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        sub_10003E990();
      }
    }
    else
    {
      uint32_t v13 = sub_100009D24();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003E91C();
      }
    }
  }
  else
  {
    int v12 = sub_100009D24();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003E8E8();
    }
  }
LABEL_31:
  id v21 = sub_100009D24();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10003E8A8();
  }
  id v22 = (char *)mmap(0, 0x18uLL, 3, 4098, -1, 0);
  if (v22 == (char *)-1)
  {
    id v30 = sub_100009D24();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10003E874();
    }
    abort();
  }
  id v23 = v22;
  *((void *)v22 + 2) = 0;
  *(_OWORD *)id v22 = xmmword_100042988;
  mprotect(v22, 0x18uLL, 1);
  *a2 = v23;
  a2[1] = 0;
  a2[2] = 0;
  a2[3] = (char *)0xFFFFFFFFLL;
  a2[4] = v23;
  a2[5] = (char *)24;
  if (v6) {
    goto LABEL_35;
  }
}

uint64_t sub_10000C66C(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    long long v3 = *(void **)(a1 + 32);
    if ((unint64_t)v3 + 1 >= 2) {
      munmap(v3, v2);
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 24);
  if ((result & 0x80000000) == 0)
  {
    return close(result);
  }
  return result;
}

void *sub_10000C6CC(uint64_t a1, void *__key)
{
  uint64_t result = bsearch_b(__key, *(const void **)(a1 + 8), *(unsigned int *)(*(void *)a1 + 12), 0x20uLL, &stru_100051CE8);
  if (result) {
    return (void *)(*(void *)(a1 + 16) + (((uint64_t)result - *(void *)(a1 + 8)) >> 3));
  }
  return result;
}

int sub_10000C71C(id a1, const void *a2, const void *a3)
{
  unint64_t v3 = bswap64(*(void *)a2);
  unint64_t v4 = bswap64(*(void *)a3);
  if (v3 == v4)
  {
    unint64_t v3 = bswap64(*((void *)a2 + 1));
    unint64_t v4 = bswap64(*((void *)a3 + 1));
    if (v3 == v4)
    {
      unint64_t v3 = bswap64(*((void *)a2 + 2));
      unint64_t v4 = bswap64(*((void *)a3 + 2));
      if (v3 == v4)
      {
        unint64_t v3 = bswap64(*((void *)a2 + 3));
        unint64_t v4 = bswap64(*((void *)a3 + 3));
        if (v3 == v4) {
          return 0;
        }
      }
    }
  }
  if (v3 < v4) {
    return -1;
  }
  return 1;
}

void sub_10000C7A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_10000C7C0(uint64_t a1)
{
  return [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:a1];
}

id sub_10000C7D0()
{
  if (qword_10005B0A0 != -1) {
    dispatch_once(&qword_10005B0A0, &stru_100051E48);
  }
  uint64_t v0 = (void *)qword_10005B0A8;

  return v0;
}

id sub_10000C824(void *a1, int a2)
{
  id v3 = a1;
  id v4 = [objc_alloc((Class)NSArray) initWithContentsOfFile:v3];

  if (!v4)
  {
    CFIndex v5 = sub_100009D24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "could not read in auth list (may be non-existing)", buf, 2u);
    }

    if (a2)
    {
      int v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "creating empty auth list", v8, 2u);
      }

      id v4 = objc_alloc_init((Class)NSArray);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

id sub_10000C934(uint64_t a1, unsigned int a2)
{
  size_t v2 = +[NSData dataWithBytesNoCopy:a1 length:a2 freeWhenDone:0];
  id v7 = 0;
  id v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:&v7];
  id v4 = v7;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CFIndex v5 = sub_100009D24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003EC10((uint64_t)v4, v5);
    }
  }

  return v3;
}

BOOL sub_10000CA1C(void *a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CAC0;
  v6[3] = &unk_100051D10;
  id v7 = a2;
  id v3 = v7;
  BOOL v4 = [a1 indexOfObjectPassingTest:v6] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

BOOL sub_10000CAC0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) compare:a2 options:1] == 0;
}

uint64_t sub_10000CAEC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  CFIndex v5 = sub_10000C7D0();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CBEC;
  block[3] = &unk_100051D38;
  id v11 = v3;
  id v12 = v4;
  uint32_t v13 = &v14;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);

  uint64_t v8 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_10000CBEC(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableArray);
  id v3 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:*(void *)(a1 + 32)];
  id v4 = sub_10000C824(v3, 1);
  id v6 = [v2 initWithArray:v4];

  if (sub_10000CA1C(v6, *(void **)(a1 + 40)))
  {
    char v5 = 0;
  }
  else
  {
    [v6 addObject:*(void *)(a1 + 40)];
    sub_10000CCC0(v6, *(void *)(a1 + 32));
    char v5 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void sub_10000CCC0(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:a2];
  unsigned __int8 v5 = [v3 writeToFile:v4 atomically:1];

  if ((v5 & 1) == 0)
  {
    id v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003EC88(v6);
    }
  }
}

uint64_t sub_10000CD50(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  unsigned __int8 v5 = sub_10000C7D0();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE50;
  block[3] = &unk_100051D38;
  id v11 = v3;
  id v12 = v4;
  uint32_t v13 = &v14;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);

  uint64_t v8 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_10000CE50(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableArray);
  id v3 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:*(void *)(a1 + 32)];
  id v4 = sub_10000C824(v3, 1);
  id v6 = [v2 initWithArray:v4];

  if (sub_10000CA1C(v6, *(void **)(a1 + 40)))
  {
    [v6 removeObject:*(void *)(a1 + 40)];
    sub_10000CCC0(v6, *(void *)(a1 + 32));
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void sub_10000CF24(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = sub_10000C7D0();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CFF0;
  v8[3] = &unk_100051D60;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

void sub_10000CFF0(uint64_t a1)
{
  id v2 = sub_10000D1A4();
  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 objectForKey:@"cdhash"];
        uint64_t v10 = [v8 objectForKey:@"upp-uuid"];
        id v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12
          && ([v9 compare:*(void *)(a1 + 32) options:1]
           || [v11 compare:*(void *)(a1 + 40) options:1]))
        {
          [v13 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  sub_10000CCC0(v13, @"Indeterminates.plist");
}

id sub_10000D1A4()
{
  id v0 = objc_alloc((Class)NSMutableArray);
  CFDictionaryRef v1 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Indeterminates.plist"];
  id v2 = [v0 initWithContentsOfFile:v1];

  if (v2)
  {
    id v22 = v2;
    id v3 = v2;
    id v23 = objc_alloc_init((Class)NSMutableArray);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v31 objects:buf count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v32;
      do
      {
        id v7 = 0;
        id v29 = v5;
        do
        {
          if (*(void *)v32 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = [v8 mutableCopy];
            uint64_t v10 = [v9 objectForKey:@"cdhash"];
            id v11 = [v9 objectForKey:@"upp-uuid"];
            BOOL v12 = [v9 objectForKey:@"firstFailure"];
            id v13 = [v9 objectForKey:@"lastCheck"];
            long long v14 = [v9 objectForKey:@"type"];
            long long v15 = [v9 objectForKey:@"grace"];
            long long v16 = [v9 objectForKey:@"attempts"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              CFDataRef v27 = sub_1000123EC(v10);

              if (v27)
              {
                off_t v28 = +[NSDate date];
                id v26 = v12;
                id v25 = v13;
                id v24 = v14;
                if ([v26 compare:v28] == (id)1)
                {
                  NSLog(@"firstFailure in %@ is in the future, throwing away", v26);
                }
                else if ([v25 compare:v28] == (id)1)
                {
                  NSLog(@"lastCheck in %@ is in the future, throwing away", v25);
                }
                else if ([v24 intValue] < 2)
                {
                  if (v16)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      NSLog(@"attempt in row %@ is not a number, removing", v9);
                      [v9 removeObjectForKey:@"attempts"];
                    }
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v21 = +[NSNumber numberWithInt:0];

                    long long v15 = (void *)v21;
                    [v9 setObject:v21 forKey:@"grace"];
                  }
                  [v23 addObject:v9];
                }
                else
                {
                  NSLog(@"type in row %@ is invalid, throwing away", v9);
                }
              }
              else
              {
                NSLog(@"cannot decode cdhash: %@", v10);
              }
            }
            else
            {
              NSLog(@"bad or incomplete indeterminates row: %@", v9);
            }

            id v5 = v29;
          }
          else
          {
            NSLog(@"indeterminates row is not a dictionary, but %@", v8);
          }
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v17 = [obj countByEnumeratingWithState:&v31 objects:buf count:16];
        id v5 = v17;
      }
      while (v17);
    }

    id v2 = v22;
    id v18 = v23;
  }
  else
  {
    id v19 = sub_100009D24();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "could not read in indeterminates, creating new one", buf, 2u);
    }

    id v18 = objc_alloc_init((Class)NSMutableArray);
  }

  return v18;
}

void sub_10000D6A4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_10000C7D0();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D770;
  v8[3] = &unk_100051D60;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

void sub_10000D770(uint64_t a1)
{
  id v2 = sub_10000D91C();
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 objectForKey:@"cdhash"];
        id v10 = [v8 objectForKey:@"upp-uuid"];
        id v11 = v10;
        if (!v10
          || [v10 compare:*(void *)(a1 + 32) options:1]
          || [v9 compare:*(void *)(a1 + 40) options:1])
        {
          [v3 addObject:v8];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  sub_10000CCC0(v3, @"Rejections.plist");
}

id sub_10000D91C()
{
  id v0 = objc_alloc((Class)NSMutableArray);
  CFDictionaryRef v1 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Rejections.plist"];
  id v2 = [v0 initWithContentsOfFile:v1];

  if (v2)
  {
    id v19 = v2;
    id v3 = v2;
    id v20 = objc_alloc_init((Class)NSMutableArray);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v22 objects:buf count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      id v21 = v4;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = [v9 mutableCopy];
            id v11 = [v10 objectForKey:@"cdhash"];
            BOOL v12 = [v10 objectForKey:@"upp-uuid"];
            long long v13 = [v10 objectForKey:@"teamid"];
            long long v14 = [v10 objectForKey:@"wholeProfile"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              CFDataRef v15 = sub_1000123EC(v11);

              if (v15) {
                [v20 addObject:v10];
              }
              else {
                NSLog(@"cannot decode rejections cdhash: %@", v11);
              }
              id v4 = v21;
            }
            else
            {
              NSLog(@"bad or incomplete rejections row: %@", v10);
            }
          }
          else
          {
            NSLog(@"rejections row is not a dictionary, but %@", v9);
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v16 = [v4 countByEnumeratingWithState:&v22 objects:buf count:16];
        id v6 = v16;
      }
      while (v16);
    }

    id v2 = v19;
  }
  else
  {
    id v17 = sub_100009D24();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "could not read in rejections, creating new one", buf, 2u);
    }

    id v20 = objc_alloc_init((Class)NSMutableArray);
  }

  return v20;
}

void sub_10000DC54(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  long long v14 = sub_10000C7D0();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000DD64;
  v18[3] = &unk_100051D88;
  id v19 = v11;
  id v20 = v12;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  id v21 = v13;
  uint64_t v22 = a4;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_sync(v14, v18);
}

void sub_10000DD64(uint64_t a1)
{
  id v3 = (uint64_t *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 0:
      int v4 = 0;
      goto LABEL_6;
    case 2:
      sub_10000D1A4();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = sub_10000E028(*(void **)(a1 + 32), *(void **)(a1 + 40), v15);
      id v5 = v8;
      if (v8) {
        sub_10000E1EC(v8, *(_DWORD **)(a1 + 64), *(void **)(a1 + 72));
      }
      goto LABEL_25;
    case 1:
      int v4 = 1;
LABEL_6:
      sub_10000D1A4();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      sub_10000E028(*(void **)(a1 + 32), *(void **)(a1 + 40), v15);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = +[NSDate date];
      if (!v5)
      {
        id v5 = objc_alloc_init((Class)NSMutableDictionary);
        [v5 setValue:*(void *)(a1 + 32) forKey:@"cdhash"];
        [v5 setValue:*(void *)(a1 + 40) forKey:@"upp-uuid"];
        [v5 setValue:v6 forKey:@"firstFailure"];
        [v5 setValue:*(void *)(a1 + 48) forKey:@"teamid"];
        if (v4)
        {
          uint64_t v7 = +[NSNumber numberWithInt:sub_10000E2D0(*(void **)(a1 + 40)) + 1];
          [v5 setValue:v7 forKey:@"grace"];
        }
        else
        {
          [v5 setValue:0 forKey:@"grace"];
        }
        [v5 setValue:&off_1000547D8 forKey:@"attempts"];
        [v15 addObject:v5];
      }
      sub_10000E1EC(v5, *(_DWORD **)(a1 + 64), *(void **)(a1 + 72));
      [v5 setValue:v6 forKey:@"lastCheck"];
      if (v4) {
        id v10 = &off_1000547F0;
      }
      else {
        id v10 = &off_1000547D8;
      }
      [v5 setValue:v10 forKey:@"type"];
      id v11 = [v5 objectForKey:@"grace"];
      int v12 = [v11 intValue];

      if (v12 > 0) {
        int v13 = v4;
      }
      else {
        int v13 = 0;
      }
      if (v13 == 1)
      {
        long long v14 = +[NSNumber numberWithInt:(v12 - 1)];
        [v5 setValue:v14 forKey:@"grace"];
      }
      sub_10000CCC0(v15, @"Indeterminates.plist");

LABEL_25:

      return;
  }
  id v9 = sub_100009D24();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003ECCC(v3, v9);
  }
}

id sub_10000E028(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v18 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (CFIndex i = 0; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v12 = [v11 objectForKey:@"cdhash"];
        uint64_t v13 = [v11 objectForKey:@"upp-uuid"];
        long long v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15 && ![v12 compare:v5 options:1] && !objc_msgSend(v14, "compare:options:", v18, 1))
        {
          id v16 = v11;

          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_16:

  return v16;
}

void sub_10000E1EC(void *a1, _DWORD *a2, void *a3)
{
  id v9 = a1;
  id v5 = [v9 objectForKey:@"attempts"];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 intValue] + 1;
    id v8 = +[NSNumber numberWithInt:v7];
    [v9 setValue:v8 forKey:@"attempts"];

    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  LODWORD(v7) = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v7;
LABEL_4:
  if (a3)
  {
    *a3 = [v9 objectForKey:@"firstFailure"];
  }
}

uint64_t sub_10000E2D0(void *a1)
{
  id v1 = a1;
  sub_10000F314();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (CFIndex i = 0; i != v4; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 objectForKey:@"upp-uuid"];
        id v9 = [v7 objectForKey:@"grace"];
        if (![v8 compare:v1 options:1])
        {
          uint64_t v10 = (uint64_t)[v9 intValue];

          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 33;
LABEL_11:

  return v10;
}

void sub_10000E450(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = sub_10000C7D0();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E550;
  v14[3] = &unk_100051DB0;
  id v15 = v8;
  id v16 = v7;
  id v17 = v9;
  char v18 = a4;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_sync(v10, v14);
}

void sub_10000E550(uint64_t a1)
{
  sub_10000D91C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_10000E028(*(void **)(a1 + 32), *(void **)(a1 + 40), v4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    [v2 setValue:*(void *)(a1 + 40) forKey:@"upp-uuid"];
    [v2 setValue:*(void *)(a1 + 32) forKey:@"cdhash"];
    [v2 setValue:*(void *)(a1 + 48) forKey:@"teamid"];
    if (*(unsigned char *)(a1 + 56)) {
      id v3 = &off_1000547F0;
    }
    else {
      id v3 = &off_1000547D8;
    }
    [v2 setValue:v3 forKey:@"wholeProfile"];
    [v4 addObject:v2];
  }
  sub_10000CCC0(v4, @"Rejections.plist");
}

uint64_t sub_10000E648(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v2 = sub_10000C7D0();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E724;
  v6[3] = &unk_100051DD8;
  id v7 = v1;
  id v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);

  uint64_t v4 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_10000E724(uint64_t a1)
{
  sub_10000D91C();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      for (CFIndex i = 0; i != v3; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v7 = [v6 objectForKey:@"upp-uuid"];
        id v8 = [v6 objectForKey:@"cdhash"];
        uint64_t v9 = [v6 objectForKey:@"wholeProfile"];
        uint64_t v10 = v9;
        if (v7) {
          BOOL v11 = v8 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        BOOL v12 = v11 || v9 == 0;
        if (!v12
          && [v9 BOOLValue]
          && ![v8 compare:*(void *)(a1 + 32) options:1])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_19;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

uint64_t sub_10000E8E0(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  id v2 = sub_10000C7D0();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E9BC;
  v6[3] = &unk_100051DD8;
  id v7 = v1;
  id v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);

  uint64_t v4 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_10000E9BC(uint64_t a1)
{
  id v1 = sub_10000D91C();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (CFIndex i = 0; i != v3; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v7 = [v6 objectForKey:@"upp-uuid"];
        id v8 = [v6 objectForKey:@"cdhash"];
        uint64_t v9 = [v6 objectForKey:@"wholeProfile"];
        uint64_t v10 = v9;
        if (v7) {
          BOOL v11 = v8 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        BOOL v12 = v11 || v9 == 0;
        if (!v12
          && [v9 BOOLValue]
          && ![v7 compare:*(void *)(a1 + 32) options:1])
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

uint64_t sub_10000EB64(uint64_t a1)
{
  if (a1 != 1) {
    return 1;
  }
  id v1 = +[NSFileManager defaultManager];
  id v2 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"UserTrustedUpps.plist"];
  if ([v1 fileExistsAtPath:v2])
  {
    id v3 = sub_100009D24();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = 1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading MIS data: Migrating old trusted UPP plist to new database (phase %llu)", buf, 0xCu);
    }

    CFArrayRef v4 = sub_100005F10(@"UserTrustedUpps.plist", 1);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EDD8;
    v13[3] = &unk_100051E00;
    id v5 = (id)objc_opt_new();
    id v14 = v5;
    if (sub_100005FA0(v4, (uint64_t)v13))
    {
      id v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing old trusted UPP plist", buf, 2u);
      }

      id v12 = 0;
      [v1 removeItemAtPath:v2 error:&v12];
      id v7 = v12;
      id v8 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Version.plist"];
      id v11 = v7;
      [v1 removeItemAtPath:v8 error:&v11];
      id v9 = v11;

      CFRelease(v4);
      return 1;
    }
  }
  return 0;
}

BOOL sub_10000EDD8(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:a2];
  id v5 = *(void **)(a1 + 32);
  id v9 = 0;
  [v5 createUserTrustedProfileEntryWithUuid:v4 teamId:0 signature:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = sub_100009D24();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003ED48(a2, (uint64_t)v6, v7);
    }
  }
  return v6 == 0;
}

void sub_10000EE94(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  id v5 = sub_10000C7D0();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF88;
  block[3] = &unk_100051E28;
  id v10 = v4;
  id v11 = v12;
  id v9 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);

  _Block_object_dispose(v12, 8);
}

void sub_10000EF88(uint64_t a1)
{
  id v2 = sub_10000F314();
  id v29 = objc_alloc_init((Class)NSMutableDictionary);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
    while (2)
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v9 = [v8 objectForKey:@"upp-uuid"];
        id v10 = [v8 objectForKey:@"grace"];
        if (![v9 compare:*(void *)(a1 + 32) options:1])
        {
          unsigned int v12 = [*(id *)(a1 + 40) intValue];
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12
                                                                      - [v10 intValue];
          [v8 setValue:*(void *)(a1 + 40) forKey:@"grace"];

          id v11 = v29;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v11 = v29;
  [v29 setValue:*(void *)(a1 + 32) forKey:@"upp-uuid"];
  [v29 setValue:*(void *)(a1 + 40) forKey:@"grace"];
  [v3 addObject:v29];
LABEL_11:
  sub_10000CCC0(v3, @"AGP.plist");
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v28 = v3;
    int v13 = sub_10000D1A4();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      CFStringRef v17 = @"upp-uuid";
      do
      {
        char v18 = 0;
        id v30 = v15;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v18);
          long long v20 = [v19 objectForKey:v17];
          long long v21 = [v19 objectForKey:@"grace"];
          if (![v20 compare:*(void *)(a1 + 32) options:1]
            && (int)[v21 intValue] >= 1)
          {
            signed int v22 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
                + [v21 intValue];
            +[NSNumber numberWithInt:v22 & ~(v22 >> 31)];
            uint64_t v23 = v16;
            CFStringRef v24 = v17;
            uint64_t v25 = a1;
            CFDataRef v27 = v26 = v13;
            [v19 setValue:v27 forKey:@"grace"];

            int v13 = v26;
            a1 = v25;
            CFStringRef v17 = v24;
            uint64_t v16 = v23;
            id v15 = v30;
          }

          char v18 = (char *)v18 + 1;
        }
        while (v15 != v18);
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v15);
    }
    sub_10000CCC0(v13, @"Indeterminates.plist");

    id v3 = v28;
    id v11 = v29;
  }
}

id sub_10000F314()
{
  id v0 = objc_alloc((Class)NSMutableArray);
  id v1 = [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"AGP.plist"];
  id v2 = [v0 initWithContentsOfFile:v1];

  if (v2)
  {
    id v15 = v2;
    id v3 = v2;
    id v16 = objc_alloc_init((Class)NSMutableArray);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:buf count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (CFIndex i = 0; i != v6; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = [v9 mutableCopy];
            id v11 = [v10 objectForKey:@"upp-uuid"];
            unsigned int v12 = [v10 objectForKey:@"grace"];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
              [v16 addObject:v10];
            }
            else {
              NSLog(@"bad or incomplete graces row: %@", v10);
            }
          }
          else
          {
            NSLog(@"graces row is not a dictionary, but %@", v9);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v17 objects:buf count:16];
      }
      while (v6);
    }

    id v2 = v15;
  }
  else
  {
    int v13 = sub_100009D24();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "could not read in graces, creating new one", buf, 2u);
    }

    id v16 = objc_alloc_init((Class)NSMutableArray);
  }

  return v16;
}

void sub_10000F5B0(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("auth-list-queue", v3);
  id v2 = (void *)qword_10005B0A8;
  qword_10005B0A8 = (uint64_t)v1;
}

id sub_10000F614()
{
  id v0 = (void *)MGCopyAnswer();

  return v0;
}

uint64_t sub_10000F648()
{
  return _MGGetBoolAnswer(@"SigningFuse");
}

uint64_t sub_10000F654()
{
  return MGCopyAnswer();
}

CFStringRef sub_10000F664()
{
  return @"Internal";
}

void sub_10000F670()
{
  id v0 = objc_opt_new();
  [v0 setAllowsCellularAccess:1];
  [v0 setAllowsExpensiveAccess:1];
  [v0 setRequiresPowerPluggedIn:0];
  [v0 setDiscretionary:1];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10000FE70;
  v47[3] = &unk_100051E70;
  long long v32 = v0;
  dsema = dispatch_semaphore_create(0);
  id v48 = dsema;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.MobileIdentityService.DenyList" options:v0 then:v47];
  dispatch_time_t v1 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(dsema, v1);
  id v34 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.MobileIdentityService.DenyList"];
  [v34 queryMetaDataSync];
  id v2 = [v34 results];
  id v3 = v50;
  if (!v2 || (int ResultFailure = MAIsQueryResultFailure(), v2, ResultFailure))
  {
    id v5 = sub_100009D24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Denylist asset query failed: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_54;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long buf = 0u;
  CFStringRef v6 = (const __CFString *)sub_10000C7C0(@"denylist.map");
  sub_10000C2C4(v6, (char **)&buf);
  id v36 = *(id *)(buf + 16);
  *(_OWORD *)BOOL v50 = buf;
  *(_OWORD *)&v50[16] = v53;
  long long v51 = v54;
  sub_10000C66C((uint64_t)v50);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v34 results];
  id v7 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (!v7)
  {

    goto LABEL_46;
  }
  val = 0;
  uint64_t v8 = *(void *)v44;
  uint64_t v9 = ASAttributeCompatibilityVersion;
  uint64_t v38 = ASAttributeContentVersion;
  do
  {
    for (CFIndex i = 0; i != v7; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v44 != v8) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      unsigned int v12 = [v11 attributes];
      int v13 = v12;
      if (v12)
      {
        id v14 = [v12 objectForKey:v9];
        if (v14
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [v14 intValue] == 1)
        {
          id v15 = [v13 objectForKey:v38];
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v16 = sub_100009D24();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              id v17 = [v11 state];
              *(_DWORD *)BOOL v50 = 138412802;
              *(void *)&v50[4] = v11;
              *(_WORD *)&v50[12] = 2112;
              *(void *)&v50[14] = v15;
              *(_WORD *)&v50[22] = 2048;
              *(void *)&v50[24] = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Seeing denylist asset '%@' (version '%@', state %ld)", v50, 0x20u);
            }

            id v18 = [v15 unsignedLongLongValue];
            if (v18 > v36)
            {
              long long v19 = v11;
              long long v20 = val;
              val = v19;
              id v36 = v18;
              goto LABEL_35;
            }
          }
          else
          {
            long long v20 = sub_100009D24();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              if (v15)
              {
                id v37 = [v15 debugDescription];
                signed int v22 = (const char *)[v37 UTF8String];
              }
              else
              {
                signed int v22 = "NULL";
              }
              *(_DWORD *)BOOL v50 = 136315138;
              *(void *)&v50[4] = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping asset with unparsable content version '%s'.", v50, 0xCu);
              if (v15) {
            }
              }
LABEL_35:
          }
        }
        else
        {
          id v15 = sub_100009D24();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            if (v14)
            {
              id v3 = [v14 debugDescription];
              long long v21 = (const char *)[v3 UTF8String];
            }
            else
            {
              long long v21 = "NULL";
            }
            *(_DWORD *)BOOL v50 = 136315138;
            *(void *)&v50[4] = v21;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping asset with incompatible compatibility version '%s'.", v50, 0xCu);
            if (v14) {
          }
            }
        }

        goto LABEL_37;
      }
      id v14 = sub_100009D24();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003EE04(&v41, v42, v14);
      }
LABEL_37:
    }
    id v7 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  }
  while (v7);

  if (val)
  {
    uint64_t v23 = sub_100009D24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      CFStringRef v24 = [val assetId];
      id v25 = [val state];
      [val state];
      id v26 = MAStringForMAAssetState();
      *(_DWORD *)BOOL v50 = 138412802;
      *(void *)&v50[4] = v24;
      *(_WORD *)&v50[12] = 2048;
      *(void *)&v50[14] = v25;
      *(_WORD *)&v50[22] = 2112;
      *(void *)&v50[24] = v26;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Using latest asset: %@, state: %ld (%@)", v50, 0x20u);
    }
    if ([val wasLocal])
    {
      CFDataRef v27 = [val getLocalUrl];
      id v28 = [v27 path];

      if (v28)
      {
        id v29 = sub_10000FFC8(v28);
        id v30 = sub_100010044(v28);
        sub_10000FEDC(v29, v30);
      }
      else
      {
        id v29 = sub_100009D24();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10003EDD0();
        }
      }
    }
    else
    {
      *(void *)BOOL v50 = 0;
      *(void *)&v50[8] = v50;
      *(void *)&v50[16] = 0x3042000000;
      *(void *)&v50[24] = sub_1000100C0;
      *(void *)&long long v51 = sub_1000100CC;
      objc_initWeak((id *)&v51 + 1, val);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000100D4;
      v40[3] = &unk_100051E98;
      v40[4] = v50;
      [val startDownload:v32 completionWithError:v40];
      _Block_object_dispose(v50, 8);
      objc_destroyWeak((id *)&v51 + 1);
    }
    long long v31 = val;
    goto LABEL_53;
  }
LABEL_46:
  long long v31 = sub_100009D24();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "No new denylist found.", v50, 2u);
  }
LABEL_53:

LABEL_54:
}

void sub_10000FE48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 224), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

intptr_t sub_10000FE70(uint64_t a1, uint64_t a2)
{
  if (MAIsDownloadResultFailure())
  {
    id v4 = sub_100009D24();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003EE44(a2, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000FEDC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_10005B0B0 != -1) {
    dispatch_once(&qword_10005B0B0, &stru_100051EB8);
  }
  uint64_t v5 = qword_10005B0B8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001053C;
  v8[3] = &unk_100051D60;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

id sub_10000FFC8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSString stringWithUTF8String:"denylist.map"];
  id v3 = [v1 stringByAppendingPathComponent:v2];

  return v3;
}

id sub_100010044(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSString stringWithUTF8String:"DocumentCheckerDefinition.plist"];
  id v3 = [v1 stringByAppendingPathComponent:v2];

  return v3;
}

void sub_1000100C0(uint64_t a1, uint64_t a2)
{
}

void sub_1000100CC(uint64_t a1)
{
}

void sub_1000100D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = MAIsDownloadResultFailure();
  id v6 = sub_100009D24();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7) {
      sub_10003EEB0((uint64_t)v4, v6);
    }
  }
  else
  {
    if (v7) {
      sub_10003EF5C();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    id v6 = [WeakRetained getLocalUrl];

    if (v6)
    {
      id v9 = [v6 path];
      id v10 = v9;
      if (v9)
      {
        id v11 = sub_10000FFC8(v9);
        unsigned int v12 = sub_100010044(v10);
        sub_10000FEDC(v11, v12);
      }
      else
      {
        id v11 = sub_100009D24();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10003EF28();
        }
      }
    }
  }
}

uint64_t sub_100010200(const void **a1)
{
  io_connect_t connect = 0;
  uint64_t input = *((unsigned int *)*a1 + 3);
  uint64_t v2 = sub_100009D24();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending denylist to AMFI....", buf, 2u);
  }

  CFDictionaryRef v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  io_object_t v5 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      id v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003F02C();
      }
    }
    else
    {
      if (!IOConnectCallMethod(connect, 9u, &input, 1u, a1[1], 32 * *((unsigned int *)*a1 + 3), 0, 0, 0, 0)) {
        goto LABEL_13;
      }
      id v6 = sub_100009D24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003EFC4();
      }
    }
  }
  else
  {
    id v6 = sub_100009D24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003EF90();
    }
  }

LABEL_13:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v5) {
    return IOObjectRelease(v5);
  }
  return result;
}

uint64_t sub_100010398()
{
  io_connect_t connect = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  io_object_t v2 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      CFDictionaryRef v3 = sub_100009D24();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10003F02C();
      }
    }
    else
    {
      if (!IOConnectCallMethod(connect, 0xDu, 0, 0, 0, 0, 0, 0, 0, 0)) {
        goto LABEL_11;
      }
      CFDictionaryRef v3 = sub_100009D24();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10003EFC4();
      }
    }
  }
  else
  {
    CFDictionaryRef v3 = sub_100009D24();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003EF90();
    }
  }

LABEL_11:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v2) {
    return IOObjectRelease(v2);
  }
  return result;
}

void sub_1000104D8(id a1)
{
  CFDictionaryRef v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("blacklist-ingest", v3);
  io_object_t v2 = (void *)qword_10005B0B8;
  qword_10005B0B8 = (uint64_t)v1;
}

void sub_10001053C(uint64_t a1)
{
  io_object_t v2 = (__CFString *)*(id *)(a1 + 32);
  CFDictionaryRef v3 = sub_100009D24();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = [(__CFString *)v2 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ingesting denylist '%s'", buf, 0xCu);
  }

  *(_OWORD *)from_fd = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  sub_10000C2C4(v2, (char **)&v71);
  if (from_fd[2] < 0)
  {
    signed int v22 = sub_100009D24();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003F3F8();
    }
    goto LABEL_34;
  }
  unint64_t v4 = *(void *)(v71 + 16);
  io_object_t v5 = sub_100009D24();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(__CFString *)v2 UTF8String];
    int v7 = *(_DWORD *)(v71 + 12);
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Denylist '%s' was issued at %{time_t}lld with %u entries.", buf, 0x1Cu);
  }

  *(_OWORD *)v74 = 0u;
  long long v75 = 0u;
  uint64_t v8 = *(unsigned int *)(v71 + 12);
  if (v8)
  {
    uint64_t v9 = 0;
    id v10 = (unint64_t *)v74;
    id v11 = (unint64_t *)*((void *)&v71 + 1);
    while (1)
    {
      unint64_t v12 = bswap64(*v11);
      unint64_t v13 = bswap64(*v10);
      if (v12 != v13) {
        goto LABEL_13;
      }
      unint64_t v12 = bswap64(v11[1]);
      unint64_t v13 = bswap64(v10[1]);
      if (v12 == v13
        && (unint64_t v12 = bswap64(v11[2]), v13 = bswap64(v10[2]), v12 == v13)
        && (unint64_t v12 = bswap64(v11[3]), v13 = bswap64(v10[3]), v12 == v13))
      {
        int v14 = 0;
      }
      else
      {
LABEL_13:
        int v14 = v12 < v13 ? -1 : 1;
      }
      if (v14 < 0) {
        break;
      }
      id v10 = (unint64_t *)(*((void *)&v71 + 1) + 32 * v9++);
      v11 += 4;
      if (v8 == v9) {
        goto LABEL_18;
      }
    }
    uint64_t v23 = sub_100009D24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_100011074((uint64_t)v11);
      id v24 = objc_claimAutoreleasedReturnValue();
      id v25 = [v24 UTF8String];
      sub_100011074((uint64_t)v10);
      id v26 = objc_claimAutoreleasedReturnValue();
      id v27 = [v26 UTF8String];
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Denylist entry number %zu smaller than previous entry: %s < %s", buf, 0x20u);
    }
    goto LABEL_32;
  }
LABEL_18:
  *(_OWORD *)long long buf = v71;
  *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)from_fd;
  long long v78 = v73;
  if (!sub_10000C6CC((uint64_t)buf, "INTEGRITY_CHECK_SENTINEL_01"))
  {
    uint64_t v23 = sub_100009D24();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10003F460();
    }
LABEL_32:

    signed int v22 = sub_100009D24();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003F42C();
    }
LABEL_34:

    *(_OWORD *)long long buf = v71;
    *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)from_fd;
    long long v78 = v73;
    long long v21 = buf;
LABEL_35:
    sub_10000C66C((uint64_t)v21);
    goto LABEL_36;
  }
  long long v78 = 0u;
  memset(buf, 0, sizeof(buf));
  CFStringRef v15 = (const __CFString *)sub_10000C7C0(@"denylist.map");
  sub_10000C2C4(v15, (char **)buf);
  int v16 = *(_DWORD *)&buf[24];
  id v17 = sub_100009D24();
  id v18 = v17;
  if (v16 < 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v74 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Currently installed denylist is broken, replacing unconditionally.", v74, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)buf + 16);
      *(_DWORD *)v74 = 134217984;
      *(void *)&v74[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Existing denylist was issued at %lld", v74, 0xCu);
    }

    if (v4 < *(void *)(*(void *)buf + 16))
    {
      long long v20 = sub_100009D24();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v74 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Denylist to ingest is older than current denylist, ignoring.", v74, 2u);
      }

      *(_OWORD *)v74 = *(_OWORD *)buf;
      long long v75 = *(_OWORD *)&buf[16];
      long long v76 = v78;
      sub_10000C66C((uint64_t)v74);
      *(_OWORD *)v74 = v71;
      long long v75 = *(_OWORD *)from_fd;
      long long v76 = v73;
      long long v21 = v74;
      goto LABEL_35;
    }
  }
  *(_OWORD *)v74 = *(_OWORD *)buf;
  long long v75 = *(_OWORD *)&buf[16];
  long long v76 = v78;
  sub_10000C66C((uint64_t)v74);
  *(_OWORD *)v74 = v71;
  long long v75 = *(_OWORD *)from_fd;
  long long v76 = v73;
  sub_100010200((const void **)v74);
  BOOL v49 = sub_10000C7C0(@"denylist.map.ingestXXXXXXX");
  BOOL v50 = (char *)[v49 lengthOfBytesUsingEncoding:4] + 1;
  long long v51 = (char *)malloc_type_malloc((size_t)v50, 0x428FA061uLL);
  if (!v51)
  {
    v64 = sub_100009D24();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_10003F494();
    }

    *(_OWORD *)v74 = v71;
    long long v75 = *(_OWORD *)from_fd;
    long long v76 = v73;
    sub_10000C66C((uint64_t)v74);
    goto LABEL_98;
  }
  id v52 = (std::__fs::filesystem::path *)v51;
  strlcpy(v51, (const char *)[v49 UTF8String], (size_t)v50);
  int v53 = mkstemp((char *)v52);
  if (v53 < 0)
  {
    id v66 = sub_100009D24();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_10003F4C8();
    }

    *(_OWORD *)v74 = v71;
    long long v75 = *(_OWORD *)from_fd;
    long long v76 = v73;
    sub_10000C66C((uint64_t)v74);
    goto LABEL_97;
  }
  int v54 = v53;
  if (fchmod(v53, 0x1A4u) < 0)
  {
    v68 = sub_100009D24();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_10003F558();
    }

    *(_OWORD *)v74 = v71;
    long long v75 = *(_OWORD *)from_fd;
    long long v76 = v73;
    sub_10000C66C((uint64_t)v74);
    close(v54);
  }
  else
  {
    lseek(from_fd[2], 0, 0);
    int v55 = fcopyfile(from_fd[2], v54, 0, 8u);
    off_t v56 = lseek(v54, 0, 2);
    close(v54);
    *(_OWORD *)v74 = v71;
    long long v75 = *(_OWORD *)from_fd;
    long long v76 = v73;
    sub_10000C66C((uint64_t)v74);
    if (v55 < 0)
    {
      uint64_t v69 = sub_100009D24();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_10003F5E8();
      }
    }
    else
    {
      if (v56 == *((void *)&v73 + 1))
      {
        sub_10000C7C0(@"denylist.map");
        id v57 = objc_claimAutoreleasedReturnValue();
        id v58 = (const std::__fs::filesystem::path *)[v57 UTF8String];

        rename(v52, v58, v59);
        if ((v60 & 0x80000000) == 0)
        {
          free(v52);
          id v61 = sub_100009D24();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            id v62 = [(__CFString *)v2 UTF8String];
            *(_DWORD *)v74 = 136315138;
            *(void *)&v74[4] = v62;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Successfully ingested new denylist '%s'", v74, 0xCu);
          }

          goto LABEL_98;
        }
        v70 = sub_100009D24();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          sub_10003F668();
        }

        goto LABEL_96;
      }
      uint64_t v69 = sub_100009D24();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_10003F700((uint64_t *)&v73 + 1, v56, v69);
      }
    }
  }
LABEL_96:
  unlink((const char *)v52);
LABEL_97:
  free(v52);
LABEL_98:

LABEL_36:
  id v28 = *(id *)(a1 + 40);
  id v29 = sub_100009D24();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = [v28 UTF8String];
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Ingesting DocumentCheckList '%s'", buf, 0xCu);
  }

  id v31 = v28;
  int v32 = open((const char *)[v31 cStringUsingEncoding:4], 0);
  if ((v32 & 0x80000000) == 0)
  {
    int v33 = v32;
    id v34 = sub_10000C7C0(@"DocumentCheckerDefinition.plist.ingestXXXXXXX");
    long long v35 = (char *)[v34 lengthOfBytesUsingEncoding:4] + 1;
    id v36 = (std::__fs::filesystem::path *)malloc_type_malloc((size_t)v35, 0xF493F3CEuLL);
    if (v36)
    {
      id v37 = v36;
      id v34 = v34;
      strlcpy((char *)v37, (const char *)[v34 UTF8String], (size_t)v35);
      int v38 = mkstemp((char *)v37);
      if (v38 < 0)
      {
        id v48 = sub_100009D24();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10003F158();
        }

        close(v33);
      }
      else
      {
        int v39 = v38;
        if (fchmod(v38, 0x1A4u) < 0)
        {
          id v63 = sub_100009D24();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            sub_10003F1E8();
          }

          close(v33);
          close(v39);
        }
        else
        {
          int v40 = fcopyfile(v33, v39, 0, 8u);
          close(v33);
          close(v39);
          if (v40 < 0)
          {
            uint64_t v65 = sub_100009D24();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_10003F278();
            }
          }
          else
          {
            sub_10000C7C0(@"DocumentCheckerDefinition.plist");
            id v41 = objc_claimAutoreleasedReturnValue();
            id v42 = (const std::__fs::filesystem::path *)[v41 UTF8String];

            rename(v37, v42, v43);
            if ((v44 & 0x80000000) == 0)
            {
              if (notify_post("com.apple.mis.doc-check-list-ingested"))
              {
                long long v45 = sub_100009D24();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                  sub_10003F2F8();
                }
              }
              free(v37);
              long long v46 = sub_100009D24();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                id v47 = [v31 UTF8String];
                *(_DWORD *)long long buf = 136315138;
                *(void *)&uint8_t buf[4] = v47;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Successfully ingested new DocCheckList '%s'", buf, 0xCu);
              }
LABEL_54:

              goto LABEL_87;
            }
            uint64_t v67 = sub_100009D24();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              sub_10003F360();
            }
          }
        }
        unlink((const char *)v37);
      }
      free(v37);
      goto LABEL_87;
    }
    long long v46 = sub_100009D24();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_10003F124();
    }
    goto LABEL_54;
  }
  id v34 = sub_100009D24();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_10003F094();
  }
LABEL_87:

  sub_100009DCC();
}

__CFString *sub_100011074(uint64_t a1)
{
  CFDataRef v1 = +[NSData dataWithBytes:a1 length:28];
  io_object_t v2 = sub_100012584(v1);

  return v2;
}

void sub_1000110F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100011154(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_100011174(int a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = sub_100009D24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    io_object_t v5 = "";
    if (a1) {
      io_object_t v5 = " (periodic)";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Revalidating apps.%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  CFArrayRef v6 = sub_1000060A8();
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001163C;
  v28[3] = &unk_100051F60;
  id v7 = v3;
  id v29 = v7;
  p_long long buf = &buf;
  sub_1000060BC(v6, (uint64_t)v28);
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    CFArrayRef v8 = sub_100006318();
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100011794;
    v25[3] = &unk_100051FC8;
    id v9 = v7;
    id v26 = v9;
    id v27 = &buf;
    sub_10000632C(v8, (uint64_t)v25);
    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      v33[0] = kMISValidationOptionValidateSignatureOnly;
      v33[1] = kMISValidationOptionOnlineAuthorization;
      v34[0] = kCFBooleanTrue;
      v34[1] = kCFBooleanTrue;
      v33[2] = kMISValidationOptionOnlineCheckType;
      if (a1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      id v11 = +[NSNumber numberWithInteger:v10];
      v34[2] = v11;
      unint64_t v12 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

      unint64_t v13 = +[LSApplicationWorkspace defaultWorkspace];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000118EC;
      v21[3] = &unk_100051FF0;
      id v22 = v9;
      id v24 = &buf;
      id v14 = v12;
      id v23 = v14;
      [v13 enumerateBundlesOfType:1 block:v21];

      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        unsigned __int8 v32 = 0;
        int v15 = MISExistsIndeterminateApps();
        int v16 = v32;
        id v17 = sub_100009D24();
        id v18 = v17;
        if (v16) {
          int v19 = 1;
        }
        else {
          int v19 = v15;
        }
        if (v19 == 1)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Scheduling opportunistic validation.", v31, 2u);
          }

          xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_BOOL(v20, XPC_ACTIVITY_REPEATING, 0);
          xpc_dictionary_set_string(v20, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
          xpc_dictionary_set_BOOL(v20, XPC_ACTIVITY_ALLOW_BATTERY, 1);
          xpc_dictionary_set_BOOL(v20, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
          xpc_dictionary_set_int64(v20, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_8_HOURS);
          xpc_dictionary_set_int64(v20, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
          xpc_activity_register("com.apple.mis.opportunistic-validation.scheduled", v20, &stru_100052010);
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Nothing about to go indeterminate, cancelling any opportunistic validation.", v31, 2u);
          }

          xpc_activity_unregister("com.apple.mis.opportunistic-validation.scheduled");
        }
      }
    }
  }

  _Block_object_dispose(&buf, 8);
}

void sub_100011614(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001163C(uint64_t a1, const __CFString *a2, void *a3, void *a4)
{
  id v9 = (xpc_activity_t *)(a1 + 32);
  CFArrayRef v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    CFDataRef v20 = sub_1000123EC(a2);
    sub_100007360(v20, a3, 0, 0, a4, &off_100054808, &off_100054808, 2, 0, &stru_100051EF8, &stru_100051F38);

    return 1;
  }
  BOOL v10 = xpc_activity_set_state(*v9, 3);
  id v11 = sub_100009D24();
  unint64_t v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003F78C((uint64_t)v9, v12, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

BOOL sub_100011784(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_10001178C(id a1)
{
  return 1;
}

uint64_t sub_100011794(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  id v9 = (xpc_activity_t *)(a1 + 32);
  CFArrayRef v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    CFDataRef v20 = sub_1000123EC(a3);
    sub_100007360(v20, a2, 0, 0, a4, &off_100054808, &off_100054808, 2, 0, &stru_100051F80, &stru_100051FA0);

    return 1;
  }
  BOOL v10 = xpc_activity_set_state(*v9, 3);
  id v11 = sub_100009D24();
  unint64_t v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003F78C((uint64_t)v9, v12, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

BOOL sub_1000118DC(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_1000118E4(id a1)
{
  return 1;
}

void sub_1000118EC(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  CFArrayRef v6 = *(_xpc_activity_s **)(a1 + 32);
  if (v6 && xpc_activity_should_defer(v6))
  {
    BOOL v7 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    CFArrayRef v8 = sub_100009D24();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", v18, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_12;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003F78C(a1 + 32, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if ([v5 profileValidated])
  {
    uint64_t v16 = [v5 bundleURL];
    uint64_t v17 = [v16 path];

    MISValidateSignature();
  }
LABEL_12:
}

void sub_100011A1C(id a1, OS_xpc_object *a2)
{
  io_object_t v2 = a2;
  id v3 = sub_100009D24();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Performing opportunistic validation.", v4, 2u);
  }

  sub_100011174(0, v2);
}

void sub_100011A9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100011AB8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (sub_100012068())
  {
    id v5 = +[NSURL fileURLWithPath:v3];
    *(void *)long long buf = 0;
    long long v35 = buf;
    uint64_t v36 = 0x3032000000;
    char v37 = sub_100011F80;
    int v38 = sub_100011F90;
    id v39 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    BOOL v7 = dispatch_get_global_queue(21, 0);
    id v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    id v29 = sub_100011F98;
    id v30 = &unk_100052038;
    int v33 = buf;
    CFArrayRef v8 = v6;
    id v31 = v8;
    id v9 = v3;
    id v32 = v9;
    uint64_t v10 = v5;
    id v11 = v4;
    id v12 = v7;
    uint64_t v13 = &v27;
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v14 = (void (*)(NSObject *, id, id, void ***))off_10005B0C8;
    long long v43 = off_10005B0C8;
    if (!off_10005B0C8)
    {
      *(void *)&long long v44 = _NSConcreteStackBlock;
      *((void *)&v44 + 1) = 3221225472;
      long long v45 = sub_1000121AC;
      long long v46 = &unk_100051AB8;
      id v47 = &v40;
      uint64_t v15 = (void *)sub_1000121FC();
      uint64_t v16 = dlsym(v15, "PVAppIdentity_GenerateDigestWithCompletion");
      *(void *)(v47[1] + 24) = v16;
      off_10005B0C8 = *(_UNKNOWN **)(v47[1] + 24);
      uint64_t v14 = (void (*)(NSObject *, id, id, void ***))v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v14)
    {
      id v25 = +[NSAssertionHandler currentHandler];
      id v26 = +[NSString stringWithUTF8String:"void sl_PVAppIdentity_GenerateDigestWithCompletion(NSURL *__strong, NSData *__strong, dispatch_queue_t  _Nullable __strong, void (^__strong)(PVAppIdentityDigest *__strong))"];
      [v25 handleFailureInFunction:v26 file:@"AppIdentity.m" lineNumber:23 description:@"%s" dlerror() v27 v28 v29 v30 v31 v32 v33];

      __break(1u);
    }
    v14(v10, v11, v12, v13);

    dispatch_time_t v17 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v8, v17);
    uint64_t v18 = (void *)*((void *)v35 + 5);
    if (v18)
    {
      id v19 = v18;
    }
    else
    {
      CFDataRef v20 = sub_100009D24();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LODWORD(v44) = 138412290;
        *(void *)((char *)&v44 + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Timed out digest calculation for %@", (uint8_t *)&v44, 0xCu);
      }

      uint64_t v40 = 0;
      id v41 = &v40;
      uint64_t v42 = 0x2050000000;
      long long v21 = (void *)qword_10005B0D0;
      long long v43 = (void *)qword_10005B0D0;
      if (!qword_10005B0D0)
      {
        *(void *)&long long v44 = _NSConcreteStackBlock;
        *((void *)&v44 + 1) = 3221225472;
        long long v45 = sub_100012250;
        long long v46 = &unk_100051AB8;
        id v47 = &v40;
        sub_100012250((uint64_t)&v44);
        long long v21 = (void *)v41[3];
      }
      id v22 = v21;
      _Block_object_dispose(&v40, 8);
      id v23 = [v22 digestWithTimeoutError];
      id v19 = [v23 asDictionary];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v10 = sub_100009D24();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Digest calculation not supported", buf, 2u);
    }
    id v19 = &__NSDictionary0__struct;
  }

  return v19;
}

void sub_100011F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011F80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011F90(uint64_t a1)
{
}

void sub_100011F98(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 asDictionary];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_semaphore_t v6 = sub_100009D24();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Succesfully calculated digest for %@", (uint8_t *)&v8, 0xCu);
  }
}

uint64_t sub_100012068()
{
  if (!qword_10005B0C0) {
    qword_10005B0C0 = _sl_dlopen();
  }
  return qword_10005B0C0;
}

uint64_t sub_100012138()
{
  uint64_t result = _sl_dlopen();
  qword_10005B0C0 = result;
  return result;
}

void *sub_1000121AC(uint64_t a1)
{
  io_object_t v2 = (void *)sub_1000121FC();
  uint64_t result = dlsym(v2, "PVAppIdentity_GenerateDigestWithCompletion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10005B0C8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000121FC()
{
  uint64_t v1 = 0;
  uint64_t result = sub_100012068();
  if (!result) {
    sub_10003F7FC(&v1);
  }
  return result;
}

Class sub_100012250(uint64_t a1)
{
  sub_1000121FC();
  Class result = objc_getClass("PVAppIdentityDigest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10003F87C();
  }
  qword_10005B0D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

const void *sub_1000122A8()
{
  CFDictionaryRef v0 = (const void *)sub_10000F654();
  if (!v0)
  {
    uint64_t v4 = sub_100009D24();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003F8F8();
    }

    return 0;
  }
  uint64_t v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    uint64_t v3 = sub_100009D24();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003F92C();
    }

    CFRelease(v1);
    return 0;
  }
  return v1;
}

void sub_100012348(id a1)
{
  qword_10005B0D8 = (uint64_t)CFURLCreateWithFileSystemPath(0, @"/private/var/db/MobileIdentityData", kCFURLPOSIXPathStyle, 1u);
}

CFURLRef sub_10001237C(CFStringRef filePath)
{
  if (qword_10005B0E0 != -1) {
    dispatch_once(&qword_10005B0E0, &stru_100052070);
  }
  CFURLRef v2 = (const __CFURL *)qword_10005B0D8;

  return CFURLCreateWithFileSystemPathRelativeToBase(0, filePath, kCFURLPOSIXPathStyle, 0, v2);
}

CFDataRef sub_1000123EC(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v3 = Length;
  if (Length) {
    return 0;
  }
  if (Length >= 0) {
    uint64_t v4 = Length;
  }
  else {
    uint64_t v4 = Length + 1;
  }
  id v5 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, v4 | 1, 0);
  if (!CFStringGetCString(a1, v5, v4 | 1, 0x600u)) {
    goto LABEL_36;
  }
  dispatch_semaphore_t v6 = (UInt8 *)CFAllocatorAllocate(kCFAllocatorDefault, v4 >> 1, 0);
  uint64_t v7 = v6;
  if (v3 >= 2)
  {
    int v8 = (unsigned __int8 *)(v5 + 1);
    uint64_t v9 = v6;
    uint64_t v10 = v4 >> 1;
    do
    {
      int v11 = *(v8 - 1);
      unsigned int v12 = v11 - 48;
      unsigned int v13 = v11 - 97;
      char v14 = v11 - 55;
      BOOL v15 = (v11 - 65) < 6;
      if ((v11 - 65) >= 6) {
        char v14 = 0;
      }
      char v16 = v11 - 87;
      BOOL v17 = v13 > 5;
      int v18 = v13 <= 5 || v15;
      if (v17) {
        char v16 = v14;
      }
      if (v12 < 0xA)
      {
        int v18 = 1;
        char v16 = v12;
      }
      char v19 = 16 * v16;
      int v20 = *v8;
      unsigned int v21 = v20 - 48;
      unsigned int v22 = v20 - 97;
      char v23 = v20 - 55;
      BOOL v24 = (v20 - 65) < 6;
      if ((v20 - 65) >= 6) {
        char v23 = 0;
      }
      char v25 = v20 - 87;
      BOOL v26 = v22 > 5;
      char v27 = v22 <= 5 || v24;
      if (v26) {
        char v28 = v23;
      }
      else {
        char v28 = v25;
      }
      if (v21 >= 0xA) {
        char v29 = v27;
      }
      else {
        char v29 = 1;
      }
      if (v21 >= 0xA) {
        LOBYTE(v21) = v28;
      }
      UInt8 *v9 = v21 | v19;
      if (!v18 || (v29 & 1) == 0) {
        goto LABEL_35;
      }
      ++v9;
      v8 += 2;
    }
    while (--v10);
  }
  CFDataRef v30 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, v4 >> 1, kCFAllocatorDefault);
  if (!v30 && v7)
  {
LABEL_35:
    CFAllocatorDeallocate(kCFAllocatorDefault, v7);
LABEL_36:
    CFDataRef v30 = 0;
  }
  if (v5) {
    CFAllocatorDeallocate(kCFAllocatorDefault, v5);
  }
  return v30;
}

__CFString *sub_100012584(const __CFData *a1)
{
  CFIndex Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v5 = CFDataGetLength(a1);
  if (v5 >= 1)
  {
    CFIndex v6 = v5;
    do
    {
      unsigned int v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, @"%02x", v7);
      --v6;
    }
    while (v6);
  }
  return Mutable;
}

void *sub_100012620(size_t size)
{
  memptr = 0;
  if (!malloc_type_posix_memalign(&memptr, 0x10uLL, size, 0xF69F43FDuLL)) {
    bzero(memptr, size);
  }
  return memptr;
}

void *sub_100012678(const void *a1, size_t a2, size_t size)
{
  CFIndex v5 = sub_100012620(size);
  CFIndex v6 = v5;
  if (v5) {
    memcpy(v5, a1, a2);
  }
  return v6;
}

CFMutableDictionaryRef sub_1000126CC()
{
  io_connect_t connect = 0;
  CFMutableDictionaryRef result = IOServiceMatching("IOAESAccelerator");
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFRetain(result);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (MatchingService)
    {
      io_object_t v3 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      CFRelease(v1);
      IOObjectRelease(v3);
      return (CFMutableDictionaryRef)connect;
    }
    else
    {
      CFRelease(v1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100012764(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)&void v19[4] = 0;
  size_t outputStructCnt = 88;
  memset(&c, 0, sizeof(c));
  unint64_t data = (unint64_t)CFAbsoluteTimeGetCurrent() & 0xFFFFFFFFFF800000;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 8u);
  CC_SHA256_Final(md, &c);
  long long v15 = *(_OWORD *)md;
  outputStruct[0] = a2;
  outputStruct[1] = a3;
  int v14 = a4;
  uint64_t v16 = 0x8000000000;
  long long v17 = 0u;
  long long v18 = 0u;
  *(void *)char v19 = 2106;
  return IOConnectCallStructMethod(a1, 1u, outputStruct, 0x58uLL, outputStruct, &outputStructCnt);
}

id sub_100012878()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  id v1 = [super setupSchema];
  if (v1)
  {
    NSString v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (!v2)
    {
      NSString v3 = sub_10003FE70();
      [v0 executeQuery:v3 withBind:0 withResults:0];

      NSString v4 = sub_10003FE70();
      [v0 executeQuery:v4 withBind:0 withResults:0];

      CFIndex v5 = @"databaseSchemaVersion";
      NSString v2 = sub_10003FE70();
      [v0 setSetting:v5 toValue:v2];
    }
  }
  return v1;
}

id variable initialization expression of UserTrustAgentOperations.utdb()
{
  type metadata accessor for UserTrustDB();
  char v0 = sub_100018080();
  return sub_10002B250(v0 & 1);
}

void UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v27 = a1;
  uint64_t v26 = sub_10003FD30();
  uint64_t v9 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  int v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UserTrustedProfileEntry();
  __chkstk_darwin(v12 - 8);
  int v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = 0;
  if (a3)
  {
    uint64_t v25 = a2;
    uint64_t v16 = a4;
    unint64_t v17 = a5;
    unint64_t v18 = a5 >> 60;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    if (v18 <= 0xE)
    {
      swift_bridgeObjectRetain();
      sub_100012DE0(v16, v17);
      uint64_t v15 = nullsub_1(v25, a3, v16, v17);
      uint64_t v19 = v22;
      uint64_t v20 = v23;
      unint64_t v21 = v24;
    }
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v26);
  sub_100012C3C(v15, v19, v20, v21);
  sub_100014ACC((uint64_t)v11, v15, v19, v20, v21, (uint64_t)v14);
  sub_100029FC4((uint64_t)v14);
  sub_100012CE0((uint64_t)v14);
  sub_100012D3C(v15, v19, v20, v21);
}

void sub_100012C3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_100012C88(a3, a4);
  }
}

uint64_t sub_100012C88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_100012CE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100012D3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_100012D88(a3, a4);
  }
}

uint64_t sub_100012D88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100012DE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100012C88(a1, a2);
  }
  return a1;
}

uint64_t UserTrustAgentOperations.deleteTrustedProfile(uuid:)(uint64_t a1)
{
  return sub_10002A728(a1);
}

id UserTrustAgentOperations.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id UserTrustAgentOperations.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  uint64_t v2 = v0;
  char v3 = sub_100018080();
  *(void *)&v0[v1] = sub_10002B250(v3 & 1);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return [super init];
}

uint64_t type metadata accessor for UserTrustAgentOperations()
{
  return self;
}

id UserTrustAgentOperations.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return [super dealloc];
}

uint64_t sub_100013318(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100012D88(a1, a2);
  }
  return a1;
}

void sub_10001332C()
{
  qword_10005D670 = -1;
}

uint64_t sub_10001334C()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_100013380(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1000133C0())()
{
  return j__swift_endAccess;
}

uint64_t sub_100013418(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_10001344C(uint64_t a1, unint64_t a2, int a3)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v14 = (int)a1;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        goto LABEL_16;
      }
      swift_retain();
      sub_100012C88(a1, a2);
      sub_10001416C((int)a1, a1 >> 32, (sqlite3_stmt *)(a2 & 0x3FFFFFFFFFFFFFFFLL), v3, a3);
      uint64_t result = sub_100012D88(a1, a2);
      break;
    case 2uLL:
      uint64_t v16 = (sqlite3_stmt *)(a2 & 0x3FFFFFFFFFFFFFFFLL);
      uint64_t v17 = *(void *)(a1 + 16);
      uint64_t v18 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_10001416C(v17, v18, v16, v3, a3);
      swift_release();
      uint64_t result = swift_release();
      break;
    case 3uLL:
      memset(v21, 0, 14);
      uint64_t v19 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 88);
      uint64_t v20 = swift_retain();
      uint64_t v14 = v19(v20);
      if (qword_10005B0E8 != -1) {
LABEL_16:
      }
        swift_once();
      uint64_t v10 = (void (__cdecl *)(void *))qword_10005D670;
      int v11 = (sqlite3_stmt *)v14;
      int v12 = a3;
      int v13 = 0;
      goto LABEL_14;
    default:
      v21[0] = a1;
      LOWORD(v21[1]) = a2;
      BYTE2(v21[1]) = BYTE2(a2);
      BYTE3(v21[1]) = BYTE3(a2);
      BYTE4(v21[1]) = BYTE4(a2);
      BYTE5(v21[1]) = BYTE5(a2);
      objc_super v7 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 88);
      uint64_t v8 = swift_retain();
      uint64_t v9 = v7(v8);
      if (qword_10005B0E8 != -1) {
        swift_once();
      }
      uint64_t v10 = (void (__cdecl *)(void *))qword_10005D670;
      int v11 = (sqlite3_stmt *)v9;
      int v12 = a3;
      int v13 = BYTE6(a2);
LABEL_14:
      sqlite3_bind_blob(v11, v12, v21, v13, v10);
      uint64_t result = swift_release();
      break;
  }
  return result;
}

unsigned char *sub_100013788(int a1)
{
  char v3 = *(uint64_t (**)(void))(*(void *)v1 + 88);
  NSString v4 = (sqlite3_stmt *)v3();
  uint64_t result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    CFIndex v6 = result;
    objc_super v7 = (sqlite3_stmt *)v3();
    int v8 = sqlite3_column_bytes(v7, a1);
    return (unsigned char *)sub_100014360(v6, v8);
  }
  return result;
}

uint64_t sub_100013814(uint64_t a1, int a2)
{
  uint64_t result = sub_10003FCD0();
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  sqlite3_int64 v6 = (uint64_t)v5;
  objc_super v7 = (sqlite3_stmt *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 88))(result);

  return sqlite3_bind_int64(v7, a2, v6);
}

uint64_t sub_1000138CC(int a1)
{
  char v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  v4.n128_f64[0] = (double)sqlite3_column_int64(v3, a1);

  return Date.init(timeIntervalSince1970:)(v4);
}

uint64_t sub_10001393C(sqlite3_int64 a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88))();

  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_1000139A4(int a1)
{
  char v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();

  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_1000139FC(char a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88))();

  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_100013A64(int a1)
{
  char v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_100013AB8(uint64_t result, uint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t v6 = result;
    swift_retain();
    return sub_100013B14(v6, a2, v3, a3);
  }
  return result;
}

uint64_t sub_100013B14(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_100040150();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      double v5 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      double v5 = (const char *)sub_100040180();
    }
    sub_1000149C8(v5);
    return swift_release();
  }
  *(void *)int v8 = a1;
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  objc_super v7 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)a3 + 88))();
  if (qword_10005B0E8 != -1) {
    swift_once();
  }
  sqlite3_bind_text(v7, a4, v8, -1, (void (__cdecl *)(void *))qword_10005D670);
  return swift_release();
}

const unsigned __int8 *sub_100013C8C(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  uint64_t result = sqlite3_column_text(v3, a1);
  if (result) {
    return (const unsigned __int8 *)sub_10003FF00();
  }
  return result;
}

uint64_t sub_100013CE8()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100013CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  NSString v18 = sub_10003FE70();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  unint64_t v24 = sub_10001448C;
  uint64_t v25 = (void *)v10;
  aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  uint64_t v22 = sub_100013F70;
  uint64_t v23 = &unk_1000521A8;
  int v11 = _Block_copy(&aBlock);
  sub_100014534(a3);
  swift_release();
  int v12 = (void *)swift_allocObject();
  v12[2] = a5;
  void v12[3] = a6;
  v12[4] = v9;
  unint64_t v24 = sub_10001458C;
  uint64_t v25 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  uint64_t v22 = sub_100013FC4;
  uint64_t v23 = &unk_1000521F8;
  int v13 = _Block_copy(&aBlock);
  sub_100014534(a5);
  swift_retain();
  swift_release();
  unsigned int v14 = [v19 executeQuery:v18 withBind:v11 withResults:v13];
  _Block_release(v13);
  _Block_release(v11);

  if (v14)
  {
    sub_100014640();
    swift_allocError();
    *(void *)uint64_t v15 = v14;
    *(void *)(v15 + 8) = 0;
    *(void *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = 0;
    *(unsigned char *)(v15 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release();
  }
  swift_beginAccess();
  if (*(void *)(v9 + 16))
  {
    swift_errorRetain();
    goto LABEL_5;
  }
  return swift_release();
}

uint64_t sub_100013F70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100013FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  sub_100014978();
  uint64_t v4 = sub_10003FE50();
  swift_retain();
  v3(a2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100014054(void (*a1)(uint64_t))
{
  uint64_t result = sub_100013CF8(0xD000000000000011, 0x8000000100045D60, 0, 0, 0, 0);
  if (!v1)
  {
    a1(result);
    return sub_100013CF8(0xD000000000000012, 0x8000000100045DA0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t sub_10001416C(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  uint64_t v10 = (char *)sub_10003F990();
  if (!v10)
  {
LABEL_4:
    BOOL v12 = __OFSUB__(a2, a1);
    uint64_t v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      uint64_t v14 = sub_10003F9B0();
      if (v14 < v13) {
        uint64_t v13 = v14;
      }
      a3 = a4;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)a4 + 88))();
      if (!v10) {
        uint64_t v13 = 0;
      }
      if (v13 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_10005B0E8 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_10005D670);
            return swift_release();
          }
LABEL_16:
          swift_once();
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  uint64_t result = sub_10003F9C0();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001429C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_100014360(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_10001429C(__src, &__src[a2]);
  }
  sub_10003F9D0();
  swift_allocObject();
  sub_10003F980();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_10003FBF0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_100014414()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001444C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001448C(uint64_t result)
{
  unint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1000149B8((uint64_t)v2);
  }
  return result;
}

uint64_t sub_10001451C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001452C()
{
  return swift_release();
}

uint64_t sub_100014534(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100014544()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001458C(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1000149B8((uint64_t)v2);
  }
  return result;
}

unint64_t sub_100014640()
{
  unint64_t result = qword_100059AA0;
  if (!qword_100059AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059AA0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DBError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1000146C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_100014720(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_100014720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1000146C8(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1000146C8(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_100014720(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_100014720(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10001492C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_100014938(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return self;
}

unint64_t sub_100014978()
{
  unint64_t result = qword_100059BB0;
  if (!qword_100059BB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059BB0);
  }
  return result;
}

uint64_t sub_1000149B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000149C8(const char *a1)
{
  int v3 = *(_DWORD *)(v1 + 24);
  int v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(void **)(v1 + 16) + 88))();
  if (qword_10005B0E8 != -1) {
    swift_once();
  }
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_10005D670);
}

uint64_t type metadata accessor for UserTrustedProfileEntry()
{
  uint64_t result = qword_10005B170;
  if (!qword_10005B170) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t result = type metadata accessor for UserTrustedProfileEntry();
  uint64_t v14 = (void *)(a6 + *(int *)(result + 20));
  *uint64_t v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t destroy for TrustedTeamIdEntry(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);

  return sub_100012D88(v2, v3);
}

void *initializeWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_100012C88(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_100012C88(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_100012D88(v6, v7);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for TrustedTeamIdEntry(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_100012D88(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_100014D44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003FD30();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    if (v11)
    {
      void *v9 = *v10;
      v9[1] = v11;
      uint64_t v12 = v10[2];
      unint64_t v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_100012C88(v12, v13);
      v9[2] = v12;
      v9[3] = v13;
    }
    else
    {
      long long v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)long long v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }
  return a1;
}

uint64_t sub_100014E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (void *)(a1 + *(int *)(a2 + 20));
  uint64_t result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v5[2];
    unint64_t v8 = v5[3];
    return sub_100012D88(v7, v8);
  }
  return result;
}

uint64_t sub_100014ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (void *)(a1 + v7);
  long long v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  if (v10)
  {
    void *v8 = *v9;
    v8[1] = v10;
    uint64_t v11 = v9[2];
    unint64_t v12 = v9[3];
    swift_bridgeObjectRetain();
    sub_100012C88(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }
  else
  {
    long long v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }
  return a1;
}

uint64_t sub_100014F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (void *)(a1 + v7);
  long long v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      void *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = v9[2];
      unint64_t v13 = v9[3];
      sub_100012C88(v12, v13);
      uint64_t v14 = v8[2];
      unint64_t v15 = v8[3];
      v8[2] = v12;
      v8[3] = v13;
      sub_100012D88(v14, v15);
    }
    else
    {
      sub_100015098((uint64_t)v8);
      long long v18 = *((_OWORD *)v9 + 1);
      *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v18;
    }
  }
  else if (v11)
  {
    void *v8 = *v9;
    v8[1] = v9[1];
    uint64_t v16 = v9[2];
    unint64_t v17 = v9[3];
    swift_bridgeObjectRetain();
    sub_100012C88(v16, v17);
    v8[2] = v16;
    v8[3] = v17;
  }
  else
  {
    long long v19 = *((_OWORD *)v9 + 1);
    *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v19;
  }
  return a1;
}

uint64_t sub_100015098(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000150CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (_OWORD *)(a1 + v7);
  long long v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  _OWORD *v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_100015150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 8)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
    sub_100015098(v8);
LABEL_5:
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    return a1;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v8 + 16);
  unint64_t v12 = *(void *)(v8 + 24);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  sub_100012D88(v11, v12);
  return a1;
}

uint64_t sub_10001520C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015220);
}

uint64_t sub_100015220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD30();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_1000152F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100015304);
}

uint64_t sub_100015304(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003FD30();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_1000153C4()
{
  uint64_t result = sub_10003FD30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100015458(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10003FC70();
  uint64_t v16 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_100012C88(a1, a2);
      sub_100012C88(a1, a2);
      break;
    default:
      break;
  }
  sub_10003FC80();
  sub_100012D88(a1, a2);
  sub_1000156A8();
  sub_1000400E0();
  if (v21)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0xE000000000000000;
    long long v17 = xmmword_100042B20;
    do
    {
      char v9 = v20;
      sub_100015700(&qword_100059C40);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = v17;
      *(void *)(v10 + 56) = &type metadata for UInt8;
      *(void *)(v10 + 64) = &protocol witness table for UInt8;
      *(unsigned char *)(v10 + 32) = v9;
      uint64_t v11 = sub_10003FEB0();
      long long v13 = v12;
      uint64_t v18 = v7;
      unint64_t v19 = v8;
      swift_bridgeObjectRetain();
      v22._countAndFlagsBits = v11;
      v22._object = v13;
      sub_10003FEF0(v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = v18;
      unint64_t v8 = v19;
      sub_1000400E0();
    }
    while (v21 != 1);
  }
  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v4);
  return v7;
}

unint64_t sub_1000156A8()
{
  unint64_t result = qword_100059C38;
  if (!qword_100059C38)
  {
    sub_10003FC70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059C38);
  }
  return result;
}

uint64_t sub_100015700(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100015744(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100015700(&qword_100059C48);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000157AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1000157F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100015838(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for AppRecord(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005B210);
}

int *sub_1000158AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10003FBA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  char v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v46 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v46 - v13;
  id v15 = [a1 bundleIdentifier];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v52 = sub_10003FEA0();
    uint64_t v51 = v17;

    id v18 = [a1 URL];
    sub_10003FB40();

    unsigned int v19 = sub_10001F150();
    if (v2)
    {
      swift_errorRelease();
      uint64_t v50 = 0;
      uint64_t v48 = 0;
      unint64_t v49 = 0xF000000000000000;
    }
    else
    {
      unint64_t v49 = v21;
      uint64_t v50 = v20;
      uint64_t v48 = v19;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    id v26 = [a1 URL];
    sub_10003FB40();

    id v27 = [a1 teamIdentifier];
    if (v27)
    {
      char v28 = v27;
      uint64_t v29 = sub_10003FEA0();
      uint64_t v46 = v30;
      uint64_t v47 = v29;
    }
    else
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
    }
    uint64_t v31 = v5;
    id v32 = [a1 iTunesMetadata:v46, v47];
    id v33 = [v32 versionIdentifier];

    id v34 = [a1 uniqueInstallIdentifier];
    if (v34)
    {
      long long v35 = v34;
      uint64_t v36 = sub_10003FC30();
      unint64_t v38 = v37;
    }
    else
    {
      uint64_t v36 = 0;
      unint64_t v38 = 0xF000000000000000;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v12, v31);
    uint64_t result = (int *)type metadata accessor for AppRecord(0);
    id v39 = (uint64_t *)(a2 + result[5]);
    uint64_t v40 = v51;
    uint64_t *v39 = v52;
    v39[1] = v40;
    id v41 = (uint64_t *)(a2 + result[6]);
    uint64_t v42 = v46;
    *id v41 = v47;
    v41[1] = v42;
    *(void *)(a2 + result[7]) = v33;
    long long v43 = (uint64_t *)(a2 + result[8]);
    uint64_t *v43 = v36;
    v43[1] = v38;
    long long v44 = (void *)(a2 + result[9]);
    uint64_t v45 = v50;
    void *v44 = v48;
    v44[1] = v45;
    v44[2] = v49;
  }
  else
  {
    type metadata accessor for AppManagerError(0);
    sub_100016D10(&qword_100059C50, (void (*)(uint64_t))type metadata accessor for AppManagerError);
    swift_allocError();
    uint64_t v23 = v22;
    id v24 = [a1 URL];
    sub_10003FB40();

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v23, v9, v5);
    swift_storeEnumTagMultiPayload();
    return (int *)swift_willThrow();
  }
  return result;
}

uint64_t type metadata accessor for AppManagerError(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005B200);
}

uint64_t sub_100015C84(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100015CBC(uint64_t a1, uint64_t a2)
{
  id v4 = [self enumeratorWithOptions:0];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100016C24;
  *(void *)(v6 + 24) = v5;
  v9[4] = sub_100016C3C;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100016278;
  v9[3] = &unk_100052380;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  [v4 swift_forEach:v7];

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100015E3C(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for AppRecord(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v22 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t result = (uint64_t)[a1 teamIdentifier];
  if (!result) {
    return result;
  }

  id v12 = [a1 teamIdentifier];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_10003FEA0();
    uint64_t v16 = v15;

    if (v14 == 0x3030303030303030 && v16 == 0xEA00000000003030)
    {
      return swift_bridgeObjectRelease();
    }
    char v17 = sub_1000402D0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      return result;
    }
  }
  if (![a1 isProfileValidated]
    || (uint64_t result = (uint64_t)[a1 isBeta], result))
  {
    id v18 = [a1 URL];
    sub_10003FB40();

    char v19 = sub_1000191FC((uint64_t)v10);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if ((v19 & 1) == 0)
    {
      uint64_t result = (uint64_t)[a1 isDeletableSystemApplication];
      if ((result & 1) == 0)
      {
        uint64_t v20 = v22;
        sub_1000158AC(a1, v22);
        a2(v20);
        return sub_100017F84(v20, type metadata accessor for AppRecord);
      }
    }
  }
  return result;
}

void sub_100016278(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_1000162C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for AppRecord(0);
  uint64_t v6 = (uint64_t *)(a2 + *(int *)(v5 + 32));
  unint64_t v7 = v6[1];
  if (v7 >> 60 == 15)
  {
    sub_10003FFB0();
    uint64_t v8 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100042B20;
    id v10 = v8;
    uint64_t v11 = sub_10003FB60();
    uint64_t v13 = v12;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_100016C7C();
    *(void *)(v9 + 32) = v11;
    *(void *)(v9 + 40) = v13;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    type metadata accessor for AppManagerError(0);
    sub_100016D10(&qword_100059C50, (void (*)(uint64_t))type metadata accessor for AppManagerError);
    swift_allocError();
    uint64_t v15 = v14;
    uint64_t v16 = sub_10003FBA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v15, a2, v16);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    uint64_t v17 = v5;
    uint64_t v45 = *v6;
    sub_100012C88(*v6, v7);
    sub_10003FFC0();
    unint64_t v46 = v7;
    long long v44 = sub_10001E35C();
    id v18 = (void *)*v44;
    sub_100015700(&qword_100059C40);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100042B20;
    uint64_t v20 = (uint64_t *)(a2 + *(int *)(v17 + 20));
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    *(void *)(v19 + 56) = &type metadata for String;
    unint64_t v23 = sub_100016C7C();
    *(void *)(v19 + 64) = v23;
    *(void *)(v19 + 32) = v21;
    *(void *)(v19 + 40) = v22;
    id v24 = v18;
    swift_bridgeObjectRetain();
    sub_10003FD80();

    swift_bridgeObjectRelease();
    id v25 = objc_allocWithZone((Class)MIAppIdentity);
    swift_bridgeObjectRetain();
    NSString v26 = sub_10003FE70();
    swift_bridgeObjectRelease();
    id v27 = [v25 initWithBundleID:v26];

    uint64_t v28 = (*(uint64_t (**)(void))(*(void *)a1 + 112))();
    if (v2)
    {

      sub_100013318(v45, v46);
    }
    else
    {
      uint64_t v30 = v28;
      unint64_t v42 = v23;
      unint64_t v31 = v29;
      id v32 = v27;
      Class isa = sub_10003FC10().super.isa;
      unint64_t v43 = v31;
      uint64_t v34 = v30;
      Class v35 = sub_10003FC10().super.isa;
      char v36 = MISetLaunchWarning();

      if (v36)
      {
        id v37 = 0;

        sub_100013318(v45, v46);
        sub_100012D88(v34, v43);
      }
      else
      {
        uint64_t v41 = v34;
        sub_10003FFC0();
        unint64_t v38 = (void *)*v44;
        uint64_t v39 = swift_allocObject();
        *(_OWORD *)(v39 + 16) = xmmword_100042B20;
        *(void *)(v39 + 56) = &type metadata for String;
        *(void *)(v39 + 64) = v42;
        *(void *)(v39 + 32) = v21;
        *(void *)(v39 + 40) = v22;
        swift_bridgeObjectRetain();
        id v40 = v38;
        sub_10003FD80();

        swift_bridgeObjectRelease();
        type metadata accessor for AppManagerError(0);
        sub_100016D10(&qword_100059C50, (void (*)(uint64_t))type metadata accessor for AppManagerError);
        swift_allocError();
        swift_storeEnumTagMultiPayload();
        swift_willThrow();

        sub_100013318(v45, v46);
        sub_100012D88(v41, v43);
      }
    }
  }
}

id sub_1000168DC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)RBSTerminateContext);
  NSString v5 = sub_10003FE70();
  id v6 = [v4 initWithExplanation:v5];

  [v6 setMaximumTerminationResistance:40];
  swift_bridgeObjectRetain();
  NSString v7 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v8 = [self predicateMatchingBundleIdentifier:v7];

  id v9 = [objc_allocWithZone((Class)RBSTerminateRequest) initWithPredicate:v8 context:v6];
  id v17 = 0;
  id v10 = [v9 execute:&v17];
  if (v10)
  {
    id v11 = v17;
  }
  else
  {
    id v12 = v17;
    sub_10003FAE0();

    swift_willThrow();
    sub_10003FFB0();
    uint64_t v13 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100042B20;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_100016C7C();
    *(void *)(v14 + 32) = a1;
    *(void *)(v14 + 40) = a2;
    swift_bridgeObjectRetain();
    id v15 = v13;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  return v10;
}

uint64_t sub_100016B24()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100016B34()
{
  return swift_allocObject();
}

uint64_t sub_100016B44()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80))();
}

uint64_t sub_100016B88()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t sub_100016BCC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))() & 1;
}

uint64_t sub_100016C14()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016C24(void *a1)
{
  return sub_100015E3C(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100016C2C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016C3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100016C64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016C74()
{
  return swift_release();
}

unint64_t sub_100016C7C()
{
  unint64_t result = qword_10005A660;
  if (!qword_10005A660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A660);
  }
  return result;
}

unint64_t sub_100016CD0()
{
  unint64_t result = qword_100059C58;
  if (!qword_100059C58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059C58);
  }
  return result;
}

uint64_t sub_100016D10(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100016D58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v7 = sub_10003FBA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100016EA8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    uint64_t v3 = sub_10003FBA0();
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100016F24(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_10003FBA0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100017030(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100017F84((uint64_t)a1, type metadata accessor for AppManagerError);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_10003FBA0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_100017160(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_10003FBA0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10001726C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100017F84((uint64_t)a1, type metadata accessor for AppManagerError);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_10003FBA0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_10001739C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000173C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000173F0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100017400()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_100017488(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003FBA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    id v10 = (uint64_t *)((char *)a1 + v8);
    id v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *id v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = *(uint64_t *)((char *)a2 + v17);
    *uint64_t v13 = v15;
    v13[1] = v16;
    *(uint64_t *)((char *)a1 + v17) = v19;
    uint64_t v20 = (char *)a1 + v18;
    uint64_t v21 = (uint64_t *)((char *)a2 + v18);
    unint64_t v22 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    }
    else
    {
      uint64_t v24 = *v21;
      sub_100012C88(*v21, v22);
      *(void *)uint64_t v20 = v24;
      *((void *)v20 + 1) = v22;
    }
    uint64_t v25 = a3[9];
    NSString v26 = (char *)a1 + v25;
    id v27 = (char *)a2 + v25;
    unint64_t v28 = *((void *)v27 + 2);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)NSString v26 = *(_OWORD *)v27;
      *((void *)v26 + 2) = *((void *)v27 + 2);
    }
    else
    {
      *(_DWORD *)NSString v26 = *(_DWORD *)v27;
      uint64_t v29 = *((void *)v27 + 1);
      sub_100012C88(v29, v28);
      *((void *)v26 + 1) = v29;
      *((void *)v26 + 2) = v28;
    }
  }
  return a1;
}

uint64_t sub_100017618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 32));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    uint64_t result = sub_100012D88(*v6, v7);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 36);
  unint64_t v9 = *(void *)(v8 + 16);
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *(void *)(v8 + 8);
    return sub_100012D88(v10, v9);
  }
  return result;
}

uint64_t sub_1000176EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  unint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (uint64_t *)(a2 + v8);
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void *)(a2 + v16);
  *uint64_t v12 = v14;
  v12[1] = v15;
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (uint64_t *)(a2 + v17);
  unint64_t v21 = *(void *)(a2 + v17 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }
  else
  {
    uint64_t v22 = *v20;
    sub_100012C88(*v20, v21);
    *(void *)uint64_t v19 = v22;
    *(void *)(v19 + 8) = v21;
  }
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  unint64_t v26 = *(void *)(v25 + 16);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    *(void *)(v24 + 16) = *(void *)(v25 + 16);
  }
  else
  {
    *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
    uint64_t v27 = *(void *)(v25 + 8);
    sub_100012C88(v27, v26);
    *(void *)(v24 + 8) = v27;
    *(void *)(v24 + 16) = v26;
  }
  return a1;
}

uint64_t sub_10001782C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = a3[8];
  uint64_t v14 = (uint64_t *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  unint64_t v16 = *(void *)(a2 + v13 + 8);
  if (*(void *)(a1 + v13 + 8) >> 60 == 15)
  {
    if (v16 >> 60 != 15)
    {
      uint64_t v17 = *v15;
      sub_100012C88(v17, v16);
      *uint64_t v14 = v17;
      v14[1] = v16;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v16 >> 60 == 15)
  {
    sub_100017A30((uint64_t)v14);
LABEL_6:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_8;
  }
  uint64_t v18 = *v15;
  sub_100012C88(v18, v16);
  uint64_t v19 = *v14;
  unint64_t v20 = v14[1];
  *uint64_t v14 = v18;
  v14[1] = v16;
  sub_100012D88(v19, v20);
LABEL_8:
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (long long *)(a2 + v21);
  unint64_t v24 = *(void *)(a1 + v21 + 16) >> 60;
  unint64_t v25 = *(void *)(a2 + v21 + 16) >> 60;
  if (v24 <= 0xE)
  {
    if (v25 <= 0xE)
    {
      *(_DWORD *)uint64_t v22 = *(_DWORD *)v23;
      uint64_t v30 = *((void *)v23 + 1);
      unint64_t v31 = *((void *)v23 + 2);
      sub_100012C88(v30, v31);
      uint64_t v32 = *(void *)(v22 + 8);
      unint64_t v33 = *(void *)(v22 + 16);
      *(void *)(v22 + 8) = v30;
      *(void *)(v22 + 16) = v31;
      sub_100012D88(v32, v33);
    }
    else
    {
      sub_100017A84(v22);
      uint64_t v27 = *((void *)v23 + 2);
      *(_OWORD *)uint64_t v22 = *v23;
      *(void *)(v22 + 16) = v27;
    }
  }
  else if (v25 <= 0xE)
  {
    *(_DWORD *)uint64_t v22 = *(_DWORD *)v23;
    uint64_t v28 = *((void *)v23 + 1);
    unint64_t v29 = *((void *)v23 + 2);
    sub_100012C88(v28, v29);
    *(void *)(v22 + 8) = v28;
    *(void *)(v22 + 16) = v29;
  }
  else
  {
    long long v26 = *v23;
    *(void *)(v22 + 16) = *((void *)v23 + 2);
    *(_OWORD *)uint64_t v22 = v26;
  }
  return a1;
}

uint64_t sub_100017A30(uint64_t a1)
{
  return a1;
}

uint64_t sub_100017A84(uint64_t a1)
{
  return a1;
}

uint64_t sub_100017AD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(v10 + 16) = *(void *)(v11 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  return a1;
}

uint64_t sub_100017B8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  unint64_t v20 = *(void *)(a1 + v17 + 8);
  if (v20 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v21 = *(void *)(v19 + 8);
  if (v21 >> 60 == 15)
  {
    sub_100017A30(v18);
LABEL_4:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    goto LABEL_6;
  }
  uint64_t v22 = *(void *)v18;
  *(void *)uint64_t v18 = *(void *)v19;
  *(void *)(v18 + 8) = v21;
  sub_100012D88(v22, v20);
LABEL_6:
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  unint64_t v26 = *(void *)(a1 + v23 + 16);
  if (v26 >> 60 != 15)
  {
    unint64_t v27 = *(void *)(v25 + 16);
    if (v27 >> 60 != 15)
    {
      *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
      uint64_t v28 = *(void *)(v24 + 8);
      *(void *)(v24 + 8) = *(void *)(v25 + 8);
      *(void *)(v24 + 16) = v27;
      sub_100012D88(v28, v26);
      return a1;
    }
    sub_100017A84(v24);
  }
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  return a1;
}

uint64_t sub_100017CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017D08);
}

uint64_t sub_100017D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100017DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100017DE0);
}

uint64_t sub_100017DE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003FBA0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100017EA0()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AppManager()
{
  return self;
}

uint64_t sub_100017F84(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100017FE4()
{
  uint64_t v0 = sub_10003FBA0();
  sub_100018728(v0, qword_10005D678);
  sub_100018048(v0, (uint64_t)qword_10005D678);
  return sub_10003FB10();
}

uint64_t sub_100018048(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100018080()
{
  return 0;
}

id sub_100018088(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_10005B220 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10003FBA0();
  sub_100018048(v5, (uint64_t)qword_10005D678);
  sub_10003FB20(v6);
  uint64_t v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  id v9 = [super initWithDatabaseURL:v7 asReadOnly:a1 & 1];

  return v9;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return self;
}

id sub_100018380()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  id v1 = [super setupSchema];
  if (v1)
  {
    id v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = sub_10003FEA0();
      unint64_t v6 = v5;
    }
    else
    {
      NSString v7 = sub_10003FE70();
      [v0 executeQuery:v7 withBind:0 withResults:0];

      uint64_t v8 = @"databaseSchemaVersion";
      uint64_t v4 = 49;
      unint64_t v6 = 0xE100000000000000;
      NSString v9 = sub_10003FE70();
      [v0 setSetting:v8 toValue:v9];
    }
    if (v4 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_1000402D0();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return v1;
      }
    }
    NSString v12 = sub_10003FE70();
    [v0 executeQuery:v12 withBind:0 withResults:0];

    uint64_t v13 = @"databaseSchemaVersion";
    NSString v14 = sub_10003FE70();
    [v0 setSetting:v13 toValue:v14];
  }
  return v1;
}

id sub_1000186F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return [super dealloc];
}

uint64_t *sub_100018728(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_10001878C()
{
  uint64_t v0 = self;
  id v1 = [v0 defaultManager];
  sub_10003FB60();
  NSString v2 = sub_10003FE70();
  swift_bridgeObjectRelease();
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (v3)
  {
    id v4 = [v0 defaultManager];
    sub_10003FB20(v5);
    NSString v7 = v6;
    id v34 = 0;
    unsigned int v8 = [v4 removeItemAtURL:v6 error:&v34];

    id v9 = v34;
    if (!v8)
    {
LABEL_12:
      id v33 = v9;
      sub_10003FAE0();

      swift_willThrow();
      return;
    }
    id v10 = v34;
  }
  id v11 = [v0 defaultManager];
  sub_10003FB20(v12);
  NSString v14 = v13;
  sub_10003FB20(v15);
  uint64_t v17 = v16;
  id v34 = 0;
  unsigned int v18 = [v11 copyItemAtURL:v14 toURL:v16 error:&v34];

  id v9 = v34;
  if (!v18) {
    goto LABEL_12;
  }
  id v19 = v34;
  sub_10003FB50(1);
  uint64_t v20 = sub_10003FED0();
  swift_bridgeObjectRelease();
  int v21 = chmod((const char *)(v20 + 32), 0x1A4u);
  swift_release();
  if (v21)
  {
    os_log_type_t v22 = sub_10003FFB0();
    uint64_t v23 = *sub_10001E35C();
    if (os_log_type_enabled(v23, v22))
    {
      uint64_t v24 = v23;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 67109120;
      LODWORD(v34) = sub_10003FDA0();
      sub_1000400F0();
      _os_log_impl((void *)&_mh_execute_header, v24, v22, "Failed to chmod document checker: %d", v25, 8u);
      swift_slowDealloc();
    }
  }
  uint32_t v26 = notify_post("com.apple.mis.doc-check-list-ingested");
  if (v26)
  {
    uint32_t v27 = v26;
    os_log_type_t v28 = sub_10003FFB0();
    unint64_t v29 = *sub_10001E35C();
    if (os_log_type_enabled(v29, v28))
    {
      uint64_t v30 = v29;
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v31 = 67109120;
      LODWORD(v34) = v27;
      sub_1000400F0();
      _os_log_impl((void *)&_mh_execute_header, v30, v28, "Failed to notify about new document checker: %u", v31, 8u);
      swift_slowDealloc();
    }
  }
  sub_10003FFC0();
  id v32 = (id)*sub_10001E35C();
  sub_10003FD80();
}

unint64_t sub_100018B38(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10003FC70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSString v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_100012C88(a1, a2);
      sub_100012C88(a1, a2);
      break;
    default:
      break;
  }
  sub_10003FC80();
  sub_100012D88(a1, a2);
  sub_10001A1B4((unint64_t *)&qword_100059C38, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
  sub_1000400E0();
  if (v11)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    do
    {
      unint64_t v8 = v10[14] | (v8 << 8);
      sub_1000400E0();
    }
    while (v11 != 1);
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_100059E80)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100059E80);
    }
  }
}

uint64_t sub_100018D5C()
{
  return sub_10003FB30();
}

uint64_t sub_100018DA8(const char *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_10003F970();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v31 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v30 = v6;
      if ((int)a2 > a2 >> 32)
      {
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      sub_100012C88(a2, a3);
      char v11 = (char *)sub_10003F990();
      if (v11)
      {
        uint64_t v12 = sub_10003F9C0();
        if (__OFSUB__((int)a2, v12))
        {
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
        }
        v11 += (int)a2 - v12;
      }
      sub_10003F9B0();
      if (__OFSUB__(HIDWORD(a2), a2))
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v13 = sub_10003FED0();
      int v14 = setxattr(a1, (const char *)(v13 + 32), v11, HIDWORD(a2) - (int)a2, 0, 0);
      swift_release();
      uint64_t result = sub_100012D88(a2, a3);
      uint64_t v6 = v30;
      if (v14 < 0)
      {
LABEL_18:
        int v26 = sub_10003FDA0();
        uint64_t v27 = sub_10003FD90();
        if ((v27 & 0x100000000) != 0)
        {
          sub_10001A160();
          swift_allocError();
          *unint64_t v29 = v26;
        }
        else
        {
          LODWORD(value[0]) = v27;
          sub_100019A30((uint64_t)&_swiftEmptyArrayStorage);
          sub_10001A1B4(&qword_100059EB0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
          os_log_type_t v28 = v31;
          sub_10003FAC0();
          sub_10003F960();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
        }
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v30 = v7;
      uint64_t v16 = v6;
      uint64_t v17 = *(void *)(a2 + 16);
      swift_retain();
      swift_retain();
      unsigned int v18 = (char *)sub_10003F990();
      if (!v18) {
        goto LABEL_13;
      }
      uint64_t v19 = sub_10003F9C0();
      if (__OFSUB__(v17, v19)) {
        goto LABEL_27;
      }
      v18 += v17 - v19;
LABEL_13:
      uint64_t v6 = v16;
      sub_10003F9B0();
      uint64_t v21 = *(void *)(a2 + 16);
      uint64_t v20 = *(void *)(a2 + 24);
      size_t v22 = v20 - v21;
      uint64_t v7 = v30;
      if (__OFSUB__(v20, v21)) {
        goto LABEL_24;
      }
      uint64_t v23 = sub_10003FED0();
      int v10 = setxattr(a1, (const char *)(v23 + 32), v18, v22, 0, 0);
      swift_release();
      swift_release();
LABEL_15:
      uint64_t result = swift_release();
      if (v10 < 0) {
        goto LABEL_18;
      }
      return result;
    case 3uLL:
      memset(value, 0, 14);
      uint64_t v24 = sub_10003FED0();
      int v25 = setxattr(a1, (const char *)(v24 + 32), value, 0, 0, 0);
      uint64_t result = swift_release();
      if (v25 < 0) {
        goto LABEL_18;
      }
      return result;
    default:
      value[0] = a2;
      LOWORD(value[1]) = a3;
      BYTE2(value[1]) = BYTE2(a3);
      BYTE3(value[1]) = BYTE3(a3);
      BYTE4(value[1]) = BYTE4(a3);
      BYTE5(value[1]) = BYTE5(a3);
      uint64_t v9 = sub_10003FED0();
      int v10 = setxattr(a1, (const char *)(v9 + 32), value, BYTE6(a3), 0, 0);
      goto LABEL_15;
  }
}

uint64_t sub_1000191FC(uint64_t a1)
{
  bzero(v7, 0x878uLL);
  uint64_t v3 = sub_10003FB50(1);
  int v10 = v7;
  uint64_t v11 = a1;
  sub_100019538((uint64_t (*)(void *))sub_100019E8C, (uint64_t)v9, v3, v4);
  swift_bridgeObjectRelease();
  if (!v1) {
    int v5 = (v8 >> 14) & 1;
  }
  return v5 & 1;
}

uint64_t sub_1000192D8(const char *a1, statfs *a2)
{
  uint64_t v4 = sub_10003F970();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = statfs(a1, a2);
  if (result == -1)
  {
    int v9 = sub_10003FDA0();
    sub_10003FFB0();
    int v10 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100042B30;
    *(void *)(v11 + 56) = &type metadata for Int32;
    *(void *)(v11 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v11 + 32) = v9;
    id v12 = v10;
    uint64_t v13 = sub_10003FB60();
    uint64_t v15 = v14;
    *(void *)(v11 + 96) = &type metadata for String;
    *(void *)(v11 + 104) = sub_100016C7C();
    *(void *)(v11 + 72) = v13;
    *(void *)(v11 + 80) = v15;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    uint64_t v16 = sub_10003FD90();
    if ((v16 & 0x100000000) != 0)
    {
      sub_10001A160();
      swift_allocError();
      _DWORD *v17 = v9;
    }
    else
    {
      int v19 = v16;
      sub_100019A30((uint64_t)&_swiftEmptyArrayStorage);
      sub_10001A1B4(&qword_100059EB0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
      sub_10003FAC0();
      sub_10003F960();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_100019538(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000)) {
    return sub_100040150();
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v7[0] = a3;
    v7[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v5 = v7;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v5 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v5 = (void *)sub_100040180();
  }
  return a1(v5);
}

uint64_t sub_1000195FC(uint64_t a1, uint64_t a2)
{
  return sub_1000196F4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100019614()
{
  sub_10003FEA0();
  sub_10003FEE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100019668()
{
  sub_10003FEA0();
  sub_100040370();
  sub_10003FEE0();
  Swift::Int v0 = sub_100040390();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000196DC(uint64_t a1, uint64_t a2)
{
  return sub_1000196F4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000196F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10003FEA0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100019738(uint64_t a1, id *a2)
{
  uint64_t result = sub_10003FE80();
  *a2 = 0;
  return result;
}

uint64_t sub_1000197B0(uint64_t a1, id *a2)
{
  char v3 = sub_10003FE90();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100019830@<X0>(void *a1@<X8>)
{
  sub_10003FEA0();
  NSString v2 = sub_10003FE70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100019874()
{
  uint64_t v0 = sub_10003FEA0();
  uint64_t v2 = v1;
  if (v0 == sub_10003FEA0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000402D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100019900@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10003FE70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100019948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003FEA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100019974(uint64_t a1)
{
  uint64_t v2 = sub_10001A1B4(&qword_100059E70, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_10001A1B4(&qword_100059EA0, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100019A30(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015700(&qword_100059EB8);
  uint64_t v2 = sub_100040200();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001A1FC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100019B5C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10001A264(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100019B5C(uint64_t a1, uint64_t a2)
{
  sub_100040370();
  sub_10003FEE0();
  Swift::Int v4 = sub_100040390();

  return sub_100019BD4(a1, a2, v4);
}

unint64_t sub_100019BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1000402D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1000402D0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1000402D0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_100019D1C(uint64_t a1)
{
  sub_10003FEA0();
  sub_100040370();
  sub_10003FEE0();
  Swift::Int v2 = sub_100040390();
  swift_bridgeObjectRelease();

  return sub_100019FE8(a1, v2);
}

uint64_t sub_100019DB0(uint64_t a1)
{
  uint64_t v2 = sub_100015700(&qword_100059E78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019E10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100019E6C(const char *a1)
{
  return sub_100018DA8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100019E8C(const char *a1)
{
  return sub_1000192D8(a1, *(statfs **)(v1 + 16));
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  int *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_100019F10()
{
  return sub_10001A1B4(&qword_100059E88, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_100019F58()
{
  return sub_10001A1B4(&qword_100059E90, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_100019FA0()
{
  return sub_10001A1B4(&qword_100059E98, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

unint64_t sub_100019FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_10003FEA0();
    uint64_t v8 = v7;
    if (v6 == sub_10003FEA0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1000402D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_10003FEA0();
          uint64_t v15 = v14;
          if (v13 == sub_10003FEA0() && v15 == v16) {
            break;
          }
          char v18 = sub_1000402D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10001A160()
{
  unint64_t result = qword_100059EA8;
  if (!qword_100059EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059EA8);
  }
  return result;
}

uint64_t sub_10001A1B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_100059EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10001A264(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001A274(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_10003F9D0();
      swift_allocObject();
      sub_10003F9A0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_10003FBF0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

char *sub_10001A314(uint64_t a1, unint64_t a2)
{
  uint64_t v23 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v4 = a1;
  switch(a2 >> 62)
  {
    case 1uLL:
      a1 = (int)a1;
      if (v4 >> 32 < (int)v4)
      {
        __break(1u);
LABEL_17:
        __break(1u);
      }
      sub_10001A668(a1, v4 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t *)&v23);
      uint64_t v6 = v2;
LABEL_7:
      sub_100012D88(v4, a2);
      if (v6) {
        return (char *)swift_bridgeObjectRelease();
      }
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_10001A668(v7, v8, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t *)&v23);
      uint64_t v6 = v2;
      swift_release();
      swift_release();
      goto LABEL_7;
    case 3uLL:
      __break(1u);
      JUMPOUT(0x10001A5B0);
    default:
      uint64_t v17 = a1;
      __int16 v18 = a2;
      char v19 = BYTE2(a2);
      char v20 = BYTE3(a2);
      char v21 = BYTE4(a2);
      char v22 = BYTE5(a2);
      if ((a2 & 0x3000000000000) != 0)
      {
        sub_10001A7F8();
        swift_allocError();
        *(_OWORD *)uint64_t v5 = xmmword_100042E60;
        *(unsigned char *)(v5 + 16) = 2;
        swift_willThrow();
        sub_100012D88(v4, a2);
        return (char *)swift_bridgeObjectRelease();
      }
      uint64_t v10 = (a2 >> 50) & 0x3F;
      if (!v10) {
        goto LABEL_17;
      }
      char v11 = sub_10001A84C(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      uint64_t v12 = 0;
      unint64_t v13 = *((void *)v11 + 2);
      uint64_t v14 = 4 * v10;
      do
      {
        unsigned int v15 = *(_DWORD *)((char *)&v17 + v12);
        unint64_t v16 = *((void *)v11 + 3);
        if (v13 >= v16 >> 1) {
          char v11 = sub_10001A84C((char *)(v16 > 1), v13 + 1, 1, v11);
        }
        *((void *)v11 + 2) = v13 + 1;
        *(_DWORD *)&v11[4 * v13 + 32] = bswap32(v15);
        v12 += 4;
        ++v13;
      }
      while (v14 != v12);
      sub_100012D88(v4, a2);
      uint64_t v23 = v11;
      break;
  }
  return v23;
}

uint64_t sub_10001A5C0(uint64_t result)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void (**)(void))(**(void **)(v1 + 40) + 136);
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    do
    {
      v6(*(unsigned int *)(v5 + 4 * v7 + 32));
      if (v3) {
        break;
      }
    }
    while (v4 - 1 != v7++);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001A668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = sub_10003F990();
  uint64_t v8 = (unsigned int *)result;
  if (result)
  {
    uint64_t result = sub_10003F9C0();
    if (__OFSUB__(a1, result))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v8 = (unsigned int *)((char *)v8 + a1 - result);
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t result = sub_10003F9B0();
  if (!v8) {
    goto LABEL_25;
  }
  if (result >= v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = result;
  }
  if ((v11 & 3) != 0)
  {
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v12 = xmmword_100042E60;
    *(unsigned char *)(v12 + 16) = 2;
    return swift_willThrow();
  }
  uint64_t v13 = v11 + 3;
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  if (v11 < 4)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t v14 = (v13 >> 2) - 1;
  uint64_t v15 = *a4;
  uint64_t v16 = 0x2000000000000000;
  while (1)
  {
    unsigned int v18 = *v8++;
    unsigned int v17 = v18;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v15;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10001A84C(0, *(void *)(v15 + 16) + 1, 1, (char *)v15);
      uint64_t v15 = result;
      *a4 = result;
    }
    unint64_t v20 = *(void *)(v15 + 16);
    unint64_t v19 = *(void *)(v15 + 24);
    if (v20 >= v19 >> 1)
    {
      uint64_t result = (uint64_t)sub_10001A84C((char *)(v19 > 1), v20 + 1, 1, (char *)v15);
      uint64_t v15 = result;
    }
    *(void *)(v15 + 16) = v20 + 1;
    *(_DWORD *)(v15 + 4 * v20 + 32) = bswap32(v17);
    *a4 = v15;
    if (!v14) {
      return result;
    }
    --v14;
    if (!--v16)
    {
      __break(1u);
      goto LABEL_23;
    }
  }
}

unint64_t sub_10001A7F8()
{
  unint64_t result = qword_100059EC8;
  if (!qword_100059EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059EC8);
  }
  return result;
}

char *sub_10001A84C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100015700(&qword_100059ED0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for BloomFilterUpdate()
{
  return &type metadata for BloomFilterUpdate;
}

void *sub_10001A958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = a1;
  v4[3] = a2;
  char v5 = sub_10001B1D8;
  if (a1 == 0x363532616873 && a2 == 0xE600000000000000
    || (v6 = sub_1000402D0(), char v5 = sub_10001B1D8, (v6 & 1) != 0)
    || (char v5 = sub_10001B8E0, a1 == 0x323135616873) && a2 == 0xE600000000000000
    || (v7 = sub_1000402D0(), char v5 = sub_10001B8E0, (v7 & 1) != 0))
  {
    v4[4] = v5;
    v4[5] = 0;
  }
  else
  {
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v9 = xmmword_100042E90;
    *(unsigned char *)(v9 + 16) = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  return v4;
}

uint64_t sub_10001AADC()
{
  return 1;
}

Swift::Int sub_10001AAE4()
{
  return sub_100040390();
}

uint64_t sub_10001AB30()
{
  return sub_10003FEE0();
}

Swift::Int sub_10001AB40()
{
  return sub_100040390();
}

uint64_t sub_10001AB88@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000524A8;
  v7._object = v3;
  Swift::Int v5 = sub_100040230(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10001ABDC(void *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_10001ABF0()
{
  return 1701667182;
}

uint64_t sub_10001AC00@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_1000524E0;
  v8._object = a2;
  Swift::Int v6 = sub_100040230(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_10001AC58()
{
  return 0;
}

void sub_10001AC64(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001AC70(uint64_t a1)
{
  unint64_t v2 = sub_10001C128();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001ACAC(uint64_t a1)
{
  unint64_t v2 = sub_10001C128();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001ACE8(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_10001AD38(a1);
  return v2;
}

void *sub_10001AD38(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100015700(&qword_100059ED8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000157F4(a1, a1[3]);
  sub_10001C128();
  sub_1000403B0();
  if (!v2)
  {
    uint64_t v9 = sub_100040240();
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    v3[2] = v9;
    v3[3] = v10;
    uint64_t v14 = sub_10001B1D8;
    BOOL v15 = v9 == 0x363532616873 && v10 == 0xE600000000000000;
    if (v15
      || (v16 = sub_1000402D0(), uint64_t v14 = sub_10001B1D8, (v16 & 1) != 0)
      || ((uint64_t v14 = sub_10001B8E0, v12 == 0x323135616873) ? (v17 = v13 == 0xE600000000000000) : (v17 = 0),
          v17 || (v18 = sub_1000402D0(), uint64_t v14 = sub_10001B8E0, (v18 & 1) != 0)))
    {
      unint64_t v19 = v14;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v3[4] = v19;
      v3[5] = 0;
      goto LABEL_4;
    }
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v20 = xmmword_100042E90;
    *(unsigned char *)(v20 + 16) = 2;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
  }
  type metadata accessor for BloomFilterAlgorithm();
  swift_deallocPartialClassInstance();
LABEL_4:
  sub_100015838((uint64_t)a1);
  return v3;
}

uint64_t sub_10001AFEC(void *a1)
{
  uint64_t v2 = sub_100015700(&qword_100059EE8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000157F4(a1, a1[3]);
  sub_10001C128();
  sub_1000403C0();
  sub_100040280();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10001B118()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t sub_10001B158@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001B194()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_10001B1D8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10003FE20();
  uint64_t v51 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FE00();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C338(&qword_100059EF0, (void (*)(uint64_t))&type metadata accessor for SHA256);
  sub_10003FDF0();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v50 = 0;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      unint64_t v49 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_100012C88(a1, a2);
      sub_10001C258((int)a1, a1 >> 32, v49, (uint64_t)v6, (void (*)(void))&type metadata accessor for SHA256, &qword_100059EF0, (void (*)(uint64_t))&type metadata accessor for SHA256);
      break;
    case 2uLL:
      unint64_t v49 = *(void *)(a1 + 16);
      uint64_t v50 = 0;
      uint64_t v11 = *(void *)(a1 + 24);
      sub_100012C88(a1, a2);
      swift_retain();
      swift_retain();
      sub_10001C258(v49, v11, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v6, (void (*)(void))&type metadata accessor for SHA256, &qword_100059EF0, (void (*)(uint64_t))&type metadata accessor for SHA256);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v54, 0, 14);
      goto LABEL_7;
    default:
      v54[0] = a1;
      LOWORD(v54[1]) = a2;
      BYTE2(v54[1]) = BYTE2(a2);
      BYTE3(v54[1]) = BYTE3(a2);
      BYTE4(v54[1]) = BYTE4(a2);
      BYTE5(v54[1]) = BYTE5(a2);
LABEL_7:
      sub_10003FDD0();
      break;
  }
  sub_100012D88(a1, a2);
  sub_10003FDE0();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v4);
  uint64_t v55 = v7;
  uint64_t v56 = sub_10001C338(&qword_100059EF8, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
  uint64_t v12 = sub_10001C1F4(v54);
  (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  sub_1000157F4(v54, v55);
  sub_10003F9E0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v13 = v52;
  unint64_t v14 = v53;
  sub_100015838((uint64_t)v54);
  sub_100015700(&qword_100059F00);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100042EA0;
  uint64_t v16 = sub_10001B85C(0, 3, v13, v14);
  unint64_t v18 = v17;
  unint64_t v19 = sub_100018B38(v16, v17);
  sub_100012D88(v16, v18);
  *(void *)(v15 + 32) = v19;
  uint64_t v20 = sub_10001B85C(4, 7, v13, v14);
  unint64_t v22 = v21;
  unint64_t v23 = sub_100018B38(v20, v21);
  sub_100012D88(v20, v22);
  *(void *)(v15 + 40) = v23;
  uint64_t v24 = sub_10001B85C(8, 11, v13, v14);
  unint64_t v26 = v25;
  unint64_t v27 = sub_100018B38(v24, v25);
  sub_100012D88(v24, v26);
  *(void *)(v15 + 48) = v27;
  uint64_t v28 = sub_10001B85C(12, 15, v13, v14);
  unint64_t v30 = v29;
  unint64_t v31 = sub_100018B38(v28, v29);
  sub_100012D88(v28, v30);
  *(void *)(v15 + 56) = v31;
  uint64_t v32 = sub_10001B85C(16, 19, v13, v14);
  unint64_t v34 = v33;
  unint64_t v35 = sub_100018B38(v32, v33);
  sub_100012D88(v32, v34);
  *(void *)(v15 + 64) = v35;
  uint64_t v36 = sub_10001B85C(20, 23, v13, v14);
  unint64_t v38 = v37;
  unint64_t v39 = sub_100018B38(v36, v37);
  sub_100012D88(v36, v38);
  *(void *)(v15 + 72) = v39;
  uint64_t v40 = sub_10001B85C(24, 27, v13, v14);
  unint64_t v42 = v41;
  unint64_t v43 = sub_100018B38(v40, v41);
  sub_100012D88(v40, v42);
  *(void *)(v15 + 80) = v43;
  uint64_t v44 = sub_10001B85C(28, 31, v13, v14);
  unint64_t v46 = v45;
  unint64_t v47 = sub_100018B38(v44, v45);
  sub_100012D88(v44, v46);
  *(void *)(v15 + 88) = v47;
  sub_100012D88(v13, v14);
  return v15;
}

uint64_t sub_10001B85C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v5 > a2)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v4 <= a2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (a2 + 1 < a1)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x10001B8D0);
  }
  return Data._Representation.subscript.getter();
}

uint64_t sub_10001B8E0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10003FE30();
  uint64_t v83 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FE10();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C338(&qword_100059F08, (void (*)(uint64_t))&type metadata accessor for SHA512);
  sub_10003FDF0();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v82 = 0;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      unint64_t v81 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_100012C88(a1, a2);
      sub_10001C258((int)a1, a1 >> 32, v81, (uint64_t)v6, (void (*)(void))&type metadata accessor for SHA512, &qword_100059F08, (void (*)(uint64_t))&type metadata accessor for SHA512);
      break;
    case 2uLL:
      unint64_t v81 = *(void *)(a1 + 16);
      uint64_t v82 = 0;
      uint64_t v11 = *(void *)(a1 + 24);
      sub_100012C88(a1, a2);
      swift_retain();
      swift_retain();
      sub_10001C258(v81, v11, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v6, (void (*)(void))&type metadata accessor for SHA512, &qword_100059F08, (void (*)(uint64_t))&type metadata accessor for SHA512);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v86, 0, 14);
      goto LABEL_7;
    default:
      v86[0] = a1;
      LOWORD(v86[1]) = a2;
      BYTE2(v86[1]) = BYTE2(a2);
      BYTE3(v86[1]) = BYTE3(a2);
      BYTE4(v86[1]) = BYTE4(a2);
      BYTE5(v86[1]) = BYTE5(a2);
LABEL_7:
      sub_10003FDD0();
      break;
  }
  sub_100012D88(a1, a2);
  sub_10003FDE0();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v6, v4);
  uint64_t v87 = v7;
  uint64_t v88 = sub_10001C338(&qword_100059F10, (void (*)(uint64_t))&type metadata accessor for SHA512Digest);
  uint64_t v12 = sub_10001C1F4(v86);
  (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  sub_1000157F4(v86, v87);
  sub_10003F9E0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v13 = v84;
  unint64_t v14 = v85;
  sub_100015838((uint64_t)v86);
  sub_100015700(&qword_100059F00);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100042EB0;
  uint64_t v16 = sub_10001B85C(0, 3, v13, v14);
  unint64_t v18 = v17;
  unint64_t v19 = sub_100018B38(v16, v17);
  sub_100012D88(v16, v18);
  *(void *)(v15 + 32) = v19;
  uint64_t v20 = sub_10001B85C(4, 7, v13, v14);
  unint64_t v22 = v21;
  unint64_t v23 = sub_100018B38(v20, v21);
  sub_100012D88(v20, v22);
  *(void *)(v15 + 40) = v23;
  uint64_t v24 = sub_10001B85C(8, 11, v13, v14);
  unint64_t v26 = v25;
  unint64_t v27 = sub_100018B38(v24, v25);
  sub_100012D88(v24, v26);
  *(void *)(v15 + 48) = v27;
  uint64_t v28 = sub_10001B85C(12, 15, v13, v14);
  unint64_t v30 = v29;
  unint64_t v31 = sub_100018B38(v28, v29);
  sub_100012D88(v28, v30);
  *(void *)(v15 + 56) = v31;
  uint64_t v32 = sub_10001B85C(16, 19, v13, v14);
  unint64_t v34 = v33;
  unint64_t v35 = sub_100018B38(v32, v33);
  sub_100012D88(v32, v34);
  *(void *)(v15 + 64) = v35;
  uint64_t v36 = sub_10001B85C(20, 23, v13, v14);
  unint64_t v38 = v37;
  unint64_t v39 = sub_100018B38(v36, v37);
  sub_100012D88(v36, v38);
  *(void *)(v15 + 72) = v39;
  uint64_t v40 = sub_10001B85C(24, 27, v13, v14);
  unint64_t v42 = v41;
  unint64_t v43 = sub_100018B38(v40, v41);
  sub_100012D88(v40, v42);
  *(void *)(v15 + 80) = v43;
  uint64_t v44 = sub_10001B85C(28, 31, v13, v14);
  unint64_t v46 = v45;
  unint64_t v47 = sub_100018B38(v44, v45);
  sub_100012D88(v44, v46);
  *(void *)(v15 + 88) = v47;
  uint64_t v48 = sub_10001B85C(32, 35, v13, v14);
  unint64_t v50 = v49;
  unint64_t v51 = sub_100018B38(v48, v49);
  sub_100012D88(v48, v50);
  *(void *)(v15 + 96) = v51;
  uint64_t v52 = sub_10001B85C(36, 39, v13, v14);
  unint64_t v54 = v53;
  unint64_t v55 = sub_100018B38(v52, v53);
  sub_100012D88(v52, v54);
  *(void *)(v15 + 104) = v55;
  uint64_t v56 = sub_10001B85C(40, 43, v13, v14);
  unint64_t v58 = v57;
  unint64_t v59 = sub_100018B38(v56, v57);
  sub_100012D88(v56, v58);
  *(void *)(v15 + 112) = v59;
  uint64_t v60 = sub_10001B85C(44, 47, v13, v14);
  unint64_t v62 = v61;
  unint64_t v63 = sub_100018B38(v60, v61);
  sub_100012D88(v60, v62);
  *(void *)(v15 + 120) = v63;
  uint64_t v64 = sub_10001B85C(48, 51, v13, v14);
  unint64_t v66 = v65;
  unint64_t v67 = sub_100018B38(v64, v65);
  sub_100012D88(v64, v66);
  *(void *)(v15 + 128) = v67;
  uint64_t v68 = sub_10001B85C(52, 55, v13, v14);
  unint64_t v70 = v69;
  unint64_t v71 = sub_100018B38(v68, v69);
  sub_100012D88(v68, v70);
  *(void *)(v15 + 136) = v71;
  uint64_t v72 = sub_10001B85C(56, 59, v13, v14);
  unint64_t v74 = v73;
  unint64_t v75 = sub_100018B38(v72, v73);
  sub_100012D88(v72, v74);
  *(void *)(v15 + 144) = v75;
  uint64_t v76 = sub_10001B85C(60, 63, v13, v14);
  unint64_t v78 = v77;
  unint64_t v79 = sub_100018B38(v76, v77);
  sub_100012D88(v76, v78);
  *(void *)(v15 + 152) = v79;
  sub_100012D88(v13, v14);
  return v15;
}

uint64_t type metadata accessor for BloomFilterAlgorithm()
{
  return self;
}

unint64_t sub_10001C128()
{
  unint64_t result = qword_100059EE0;
  if (!qword_100059EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059EE0);
  }
  return result;
}

unsigned char *sub_10001C17C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_10001429C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_10001C5C0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_10001C63C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t *sub_10001C1F4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001C258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  uint64_t result = sub_10003F990();
  if (!result || (uint64_t result = sub_10003F9C0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_10003F9B0();
      a5(0);
      sub_10001C338(a6, a7);
      return sub_10003FDD0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C338(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001C384()
{
  unint64_t result = qword_100059F18;
  if (!qword_100059F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059F18);
  }
  return result;
}

unint64_t sub_10001C3DC()
{
  unint64_t result = qword_100059F20;
  if (!qword_100059F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059F20);
  }
  return result;
}

unint64_t sub_10001C434()
{
  unint64_t result = qword_100059F28;
  if (!qword_100059F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059F28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        int *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      int *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001C578);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterAlgorithm.CodingKeys()
{
  return &type metadata for BloomFilterAlgorithm.CodingKeys;
}

ValueMetadata *type metadata accessor for HashAlgorithmRegistry()
{
  return &type metadata for HashAlgorithmRegistry;
}

uint64_t sub_10001C5C0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_10003F9D0();
  swift_allocObject();
  uint64_t result = sub_10003F980();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_10003FBF0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_10001C63C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_10003F9D0();
  swift_allocObject();
  uint64_t result = sub_10003F980();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

const char *sub_10001C6C0()
{
  return "ckContainer";
}

const char *sub_10001C6CC()
{
  return "ckEnvironment";
}

uint64_t sub_10001C6D8()
{
  return sub_10001C9D0();
}

id sub_10001C6F0()
{
  return sub_10001C7F4();
}

void sub_10001C710()
{
}

void sub_10001C730()
{
  NSString v1 = sub_10003FE70();
  [v0 deleteSetting:v1];
}

uint64_t sub_10001C798()
{
  return sub_10001C9D0();
}

void sub_10001C7B4()
{
}

id sub_10001C7D0()
{
  return sub_10001C7F4();
}

id sub_10001C7F4()
{
  NSString v1 = sub_10003FE70();
  id v2 = [v0 readSetting:v1];

  if (v2)
  {
    sub_10003FEA0();

    id v2 = (id)sub_10003FBE0();
    swift_bridgeObjectRelease();
  }
  return v2;
}

void sub_10001C88C()
{
}

void sub_10001C8B0()
{
  NSString v1 = sub_10003FE70();
  sub_10003FC20(0);
  NSString v2 = sub_10003FE70();
  swift_bridgeObjectRelease();
  [v0 setSetting:v1 toValue:v2];
}

void sub_10001C948()
{
  NSString v1 = sub_10003FE70();
  [v0 deleteSetting:v1];
}

uint64_t sub_10001C9B4()
{
  return sub_10001C9D0();
}

uint64_t sub_10001C9D0()
{
  NSString v1 = sub_10003FE70();
  id v2 = [v0 readSetting:v1];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_10003FEA0();

  return v3;
}

void sub_10001CA4C()
{
}

void sub_10001CA68()
{
  NSString v1 = sub_10003FE70();
  NSString v2 = sub_10003FE70();
  [v0 setSetting:v1 toValue:v2];
}

uint64_t sub_10001CAEC(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_10001CB04(char a1)
{
  return a1 & 1;
}

BOOL sub_10001CB0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001CB24()
{
  Swift::UInt v1 = *v0;
  sub_100040370();
  sub_100040380(v1);
  return sub_100040390();
}

void sub_10001CB6C()
{
  sub_100040380(*v0);
}

Swift::Int sub_10001CB98()
{
  Swift::UInt v1 = *v0;
  sub_100040370();
  sub_100040380(v1);
  return sub_100040390();
}

void *sub_10001CBDC@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_10001CBFC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_10001CC08()
{
  return &unk_1000430C0;
}

void *sub_10001CC14()
{
  return &unk_1000430C8;
}

void *sub_10001CC20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_10001CC2C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_10001CC34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10001CC48@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10001CC5C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001CC70(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10001CCA0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10001CCCC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10001CCF0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10001CD04(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10001CD18(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10001CD2C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001CD40(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_10001CD54(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_10001CD68(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10001CD7C()
{
  return *v0 == 0;
}

uint64_t sub_10001CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10001CDA4(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_10001CDB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10001CDC8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_10001CDD4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001CDE8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_10001E144(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails()
{
  uint64_t result = qword_10005BDB0;
  if (!qword_10005BDB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001CE74@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  char v12 = a5 & 1;
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = a8 + v13[6];
  uint64_t v15 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a4, v15);
  *(unsigned char *)(a8 + v13[7]) = v12;
  *(void *)(a8 + v13[8]) = a6;
  uint64_t v16 = a8 + v13[9];

  return sub_10001CF40(a7, v16);
}

uint64_t sub_10001CF40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001CFAC()
{
  unint64_t result = qword_100059FE8;
  if (!qword_100059FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059FE8);
  }
  return result;
}

unint64_t sub_10001D004()
{
  unint64_t result = qword_100059FF0;
  if (!qword_100059FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059FF0);
  }
  return result;
}

unint64_t sub_10001D05C()
{
  unint64_t result = qword_100059FF8;
  if (!qword_100059FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059FF8);
  }
  return result;
}

unint64_t sub_10001D0B4()
{
  unint64_t result = qword_10005A000;
  if (!qword_10005A000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A000);
  }
  return result;
}

unint64_t sub_10001D10C()
{
  unint64_t result = qword_10005A008;
  if (!qword_10005A008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A008);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LaunchWarningReason(unsigned char *result, unsigned char *a2)
{
  int *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    int *result = a2 + 1;
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
        JUMPOUT(0x10001D2C8);
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
          int *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10001D2F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001D2F8(unsigned char *result, char a2)
{
  int *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

void *sub_10001D324(_DWORD *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    void *v4 = *a2;
    unsigned int v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_100012C88(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10003FD00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(void *)((char *)v4 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_10003FBA0();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_100015700(&qword_10005A810);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_10001D500(uint64_t a1, uint64_t a2)
{
  sub_100012D88(*(void *)(a1 + 8), *(void *)(a1 + 16));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = sub_10003FBA0();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

uint64_t sub_10001D620(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_100012C88(v6, v7);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_10003FBA0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_100015700(&qword_10005A810);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_10001D7AC(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_100012C88(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_100012D88(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_10003FBA0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_100015700(&qword_10005A810);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_10001D9A8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_10003FBA0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100015700(&qword_10005A810);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_10001DB28(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_100012D88(v6, v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_10003FBA0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100015700(&qword_10005A810);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_10001DD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001DD2C);
}

uint64_t sub_10001DD2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FD00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[6];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 254)
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + a3[7]);
    if (v12 >= 2) {
      return v12 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v13 = sub_100015700(&qword_10005A810);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[9];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_10001DE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001DE6C);
}

uint64_t sub_10001DE6C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_10003FD00();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[6];
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7]) = a2 + 1;
  }
  else
  {
    uint64_t v13 = sub_100015700(&qword_10005A810);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_10001DF9C()
{
  sub_10003FD00();
  if (v0 <= 0x3F)
  {
    sub_10001E094();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10001E094()
{
  if (!qword_10005A068)
  {
    sub_10003FBA0();
    unint64_t v0 = sub_1000400D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005A068);
    }
  }
}

void type metadata accessor for SecCSDigestAlgorithm()
{
  if (!qword_10005A0A8)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10005A0A8);
    }
  }
}

uint64_t sub_10001E144(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_10001E180()
{
  sub_10001E3CC();
  uint64_t result = sub_1000400C0();
  qword_10005D690 = result;
  return result;
}

uint64_t *sub_10001E1E8()
{
  if (qword_10005BDC0 != -1) {
    swift_once();
  }
  return &qword_10005D690;
}

uint64_t sub_10001E234()
{
  sub_10001E3CC();
  uint64_t result = sub_1000400C0();
  qword_10005D698 = result;
  return result;
}

uint64_t *sub_10001E29C()
{
  if (qword_10005BDC8 != -1) {
    swift_once();
  }
  return &qword_10005D698;
}

uint64_t sub_10001E2E8()
{
  sub_10001E3CC();
  uint64_t result = sub_1000400C0();
  qword_10005D6A0 = result;
  return result;
}

uint64_t *sub_10001E35C()
{
  if (qword_10005BDD0 != -1) {
    swift_once();
  }
  return &qword_10005D6A0;
}

uint64_t type metadata accessor for Logger()
{
  return self;
}

unint64_t sub_10001E3CC()
{
  unint64_t result = qword_10005A148;
  if (!qword_10005A148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005A148);
  }
  return result;
}

uint64_t sub_10001E40C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4 = a1 == 1634564716 && a2 == 0xE400000000000000;
  if (v4 || (sub_1000402D0() & 1) != 0)
  {
    uint64_t v7 = (unsigned int *)&enum case for Algorithm.lzma(_:);
LABEL_7:
    uint64_t v8 = *v7;
    uint64_t v9 = sub_10003FD70();
    uint64_t v16 = *(void *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104))(a3, v8, v9);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v11 = a3;
    uint64_t v12 = 0;
    uint64_t v13 = v9;
    goto LABEL_8;
  }
  if (a1 == 1651076218 && a2 == 0xE400000000000000 || (sub_1000402D0() & 1) != 0)
  {
    uint64_t v7 = (unsigned int *)&enum case for Algorithm.zlib(_:);
    goto LABEL_7;
  }
  uint64_t v15 = sub_10003FD70();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v13 = v15;
  uint64_t v11 = a3;
  uint64_t v12 = 1;
LABEL_8:

  return v10(v11, v12, 1, v13);
}

void sub_10001E5A4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a3;
  uint64_t v45 = a2;
  uint64_t v48 = a1;
  uint64_t v43 = sub_10003FD70();
  uint64_t v47 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  BOOL v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003FD60();
  uint64_t v46 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003FBA0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37 - v13;
  unint64_t v15 = sub_10001EA74();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v16(v14, v48, v8);
  id v17 = v51;
  id v18 = sub_10001EAB4((uint64_t)v14, (SEL *)&selRef_fileHandleForReadingFromURL_error_);
  if (!v17)
  {
    uint64_t v40 = (void (*)(char *, uint64_t, uint64_t))v16;
    unint64_t v41 = v15;
    uint64_t v42 = v8;
    uint64_t v48 = v12;
    id v51 = v18;
    unint64_t v38 = v7;
    unint64_t v39 = v4;
    int v19 = self;
    id v20 = [v19 defaultManager];
    uint64_t v21 = v45;
    sub_10003FB60();
    NSString v22 = sub_10003FE70();
    swift_bridgeObjectRelease();
    unsigned __int8 v23 = [v20 fileExistsAtPath:v22];

    if ((v23 & 1) == 0)
    {
      id v24 = [v19 defaultManager];
      sub_10003FB60();
      NSString v25 = sub_10003FE70();
      swift_bridgeObjectRelease();
      [v24 createFileAtPath:v25 contents:0 attributes:0];
    }
    uint64_t v26 = (uint64_t)v48;
    v40(v48, v21, v42);
    id v27 = sub_10001EAB4(v26, (SEL *)&selRef_fileHandleForWritingToURL_error_);
    uint64_t v28 = v47;
    unint64_t v29 = v27;
    (*(void (**)(char *, void, uint64_t))(v46 + 104))(v38, enum case for FilterOperation.decompress(_:), v5);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v39, v44, v43);
    uint64_t v30 = swift_allocObject();
    unint64_t v31 = v51;
    *(void *)(v30 + 16) = v51;
    sub_100015700(&qword_10005A158);
    swift_allocObject();
    id v32 = v31;
    sub_10003FD50();
    uint64_t v33 = sub_10003FD40();
    for (unint64_t i = v34; i >> 60 != 15; unint64_t i = v36)
    {
      uint64_t v49 = v33;
      unint64_t v50 = i;
      sub_10001EC74();
      sub_10003FF90();
      sub_100013318(v33, i);
      uint64_t v33 = sub_10003FD40();
    }

    swift_release();
  }
}

unint64_t sub_10001EA74()
{
  unint64_t result = qword_10005A150;
  if (!qword_10005A150)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005A150);
  }
  return result;
}

id sub_10001EAB4(uint64_t a1, SEL *a2)
{
  sub_10003FB20(__stack_chk_guard);
  uint64_t v5 = v4;
  id v14 = 0;
  id v6 = [swift_getObjCClassFromMetadata() *a2 v4, &v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_10003FBA0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_10003FAE0();

    swift_willThrow();
    uint64_t v12 = sub_10003FBA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_10001EC0C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001EC44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003FF80();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

unint64_t sub_10001EC74()
{
  unint64_t result = qword_10005A160;
  if (!qword_10005A160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A160);
  }
  return result;
}

uint64_t sub_10001ECC8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  v23[0] = a3;
  uint64_t v5 = sub_10003FD70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003FD60();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = 0;
  uint64_t v13 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x10001F00CLL);
      }
      uint64_t v13 = HIDWORD(a1) - (int)a1;
LABEL_6:
      (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for FilterOperation.decompress(_:), v9);
      (*(void (**)(char *, void, uint64_t))(v6 + 16))(v8, v23[0], v5);
      uint64_t v16 = (void *)swift_allocObject();
      v16[2] = v13;
      v16[3] = v25;
      v16[4] = a1;
      v16[5] = a2;
      sub_100015700(&qword_10005A158);
      swift_allocObject();
      swift_retain();
      sub_100012C88(a1, a2);
      uint64_t v17 = v23[1];
      sub_10003FD50();
      if (v17) {
        return swift_release();
      }
      long long v24 = xmmword_100042C60;
      uint64_t v18 = sub_10003FD40();
      for (unint64_t i = v19; i >> 60 != 15; unint64_t i = v21)
      {
        sub_10003FC50();
        sub_100013318(v18, i);
        uint64_t v18 = sub_10003FD40();
      }
      swift_release();
      swift_release();
      return v24;
    case 2uLL:
      uint64_t v15 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      uint64_t v13 = v14 - v15;
      if (!__OFSUB__(v14, v15)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v13 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_10001F01C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F02C()
{
  swift_release();
  sub_100012D88(*(void *)(v0 + 32), *(void *)(v0 + 40));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001F06C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = (uint64_t *)(*(void *)(v2 + 24) + 16);
  swift_beginAccess();
  uint64_t result = *v6;
  if (__OFSUB__(v5, *v6))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v5 - *v6 >= a1) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = v5 - result;
  }
  if (__OFADD__(result, v8)) {
    goto LABEL_10;
  }
  if (result + v8 < result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v9 = sub_10003FC60();
  uint64_t v11 = v10;
  uint64_t result = swift_beginAccess();
  if (!__OFADD__(*v6, v8))
  {
    *v6 += v8;
    *a2 = v9;
    a2[1] = v11;
    return result;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10001F150()
{
  SecStaticCodeRef staticCode = 0;
  sub_10003FB20(__stack_chk_guard);
  CFURLRef v1 = v0;
  OSStatus v2 = SecStaticCodeCreateWithPath(v0, 0, &staticCode);

  if (v2 || !staticCode)
  {
    sub_10003FFB0();
    uint64_t v11 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_100042B30;
    *(void *)(v12 + 56) = &type metadata for Int32;
    *(void *)(v12 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v12 + 32) = v2;
    uint64_t v13 = v11;
    uint64_t v14 = sub_10003FB60();
    uint64_t v16 = v15;
    *(void *)(v12 + 96) = &type metadata for String;
    *(void *)(v12 + 104) = sub_100016C7C();
    *(void *)(v12 + 72) = v14;
    *(void *)(v12 + 80) = v16;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    sub_10001F800();
    swift_allocError();
    *(_DWORD *)uint64_t v17 = v2;
    *(unsigned char *)(v17 + 4) = 0;
    swift_willThrow();
LABEL_28:

    return v13;
  }
  CFDictionaryRef information = 0;
  uint64_t v3 = staticCode;
  OSStatus v4 = SecCodeCopySigningInformation(v3, 0x21u, &information);
  if (v4 || (CFDictionaryRef v5 = information) == 0)
  {
    sub_10003FFB0();
    uint64_t v18 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100042B30;
    *(void *)(v13 + 56) = &type metadata for Int32;
    *(void *)(v13 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v13 + 32) = v4;
    id v19 = v18;
    uint64_t v20 = sub_10003FB60();
    uint64_t v22 = v21;
    *(void *)(v13 + 96) = &type metadata for String;
    *(void *)(v13 + 104) = sub_100016C7C();
    *(void *)(v13 + 72) = v20;
    *(void *)(v13 + 80) = v22;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    sub_10001F800();
    swift_allocError();
    *(_DWORD *)uint64_t v23 = v4;
    *(unsigned char *)(v23 + 4) = 0;
    swift_willThrow();
LABEL_27:

    goto LABEL_28;
  }
  *(void *)&long long v39 = kSecCodeInfoCdHashesFull;
  id v6 = kSecCodeInfoCdHashesFull;
  CFDictionaryRef v7 = v5;
  id v8 = v6;
  CFDictionaryRef v9 = v7;
  sub_100015700(&qword_10005A170);
  id v10 = [(__CFDictionary *)v9 __swift_objectForKeyedSubscript:sub_1000402E0()];
  swift_unknownObjectRelease();
  if (v10)
  {
    sub_100040110();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_10001F854((uint64_t)&v39, (uint64_t)v41);
  if (!v42)
  {

    sub_100019DB0((uint64_t)v41);
LABEL_16:
    sub_10003FFB0();
    uint64_t v25 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100042B20;
    id v26 = v25;
    uint64_t v27 = sub_10003FB60();
    uint64_t v29 = v28;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_100016C7C();
    *(void *)(v13 + 32) = v27;
    *(void *)(v13 + 40) = v29;
LABEL_26:
    sub_10003FD80();

    swift_bridgeObjectRelease();
    sub_10001F800();
    swift_allocError();
    *(_DWORD *)uint64_t v36 = 0;
    *(unsigned char *)(v36 + 4) = 1;
    swift_willThrow();

    goto LABEL_27;
  }
  sub_100015700(&qword_10005A178);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_16;
  }

  long long v24 = (id)kSecCodeInfoDigestAlgorithm;
  if ([(__CFDictionary *)v9 __swift_objectForKeyedSubscript:v24])
  {
    sub_100040110();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_10001F854((uint64_t)&v39, (uint64_t)v41);
  if (!v42)
  {

    swift_bridgeObjectRelease();
    sub_100019DB0((uint64_t)v41);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v13 = v38;

  if (!*(void *)(v38 + 16) || (unint64_t v30 = sub_10001F8BC(v38), (v31 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_10003FFB0();
    id v32 = (void *)*sub_10001E35C();
    sub_100015700(&qword_100059C40);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100042B20;
    id v26 = v32;
    uint64_t v33 = sub_10003FB60();
    uint64_t v35 = v34;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_100016C7C();
    *(void *)(v13 + 32) = v33;
    *(void *)(v13 + 40) = v35;
    goto LABEL_26;
  }
  sub_100012C88(*(void *)(*(void *)(v38 + 56) + 16 * v30), *(void *)(*(void *)(v38 + 56) + 16 * v30 + 8));

  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_10001F800()
{
  unint64_t result = qword_10005A168;
  if (!qword_10005A168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A168);
  }
  return result;
}

uint64_t sub_10001F854(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_100059E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001F8BC(int a1)
{
  uint64_t v2 = sub_100040360();

  return sub_10001FBC0(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_10001F964(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001F980(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_100012D88(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s17online_auth_agent10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_100012C88(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_100012C88(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_100012D88(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_100012D88(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_10001FB78(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_10001FBC0(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001FC5C(char *a1, char *a2)
{
  return sub_10001FC68(*a1, *a2);
}

uint64_t sub_10001FC68(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1702521203;
  }
  else {
    uint64_t v3 = 7107189;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1702521203;
  }
  else {
    uint64_t v5 = 7107189;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000402D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10001FD00()
{
  return sub_100040390();
}

uint64_t sub_10001FD74()
{
  sub_10003FEE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001FDD4()
{
  return sub_100040390();
}

uint64_t sub_10001FE44@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100052858;
  v8._object = v3;
  Swift::Int v5 = sub_100040230(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_10001FEA4(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7107189;
  if (*v1) {
    uint64_t v2 = 1702521203;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10001FED4()
{
  if (*v0) {
    return 1702521203;
  }
  else {
    return 7107189;
  }
}

uint64_t sub_10001FF00@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_100052858;
  v9._object = a2;
  Swift::Int v6 = sub_100040230(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

void sub_10001FF64(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10001FF70(uint64_t a1)
{
  unint64_t v2 = sub_1000215A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001FFAC(uint64_t a1)
{
  unint64_t v2 = sub_1000215A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001FFE8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100020040(a1, a2);
  return v4;
}

uint64_t sub_100020040(uint64_t a1, unint64_t a2)
{
  uint64_t v43 = sub_10003FBA0();
  uint64_t v5 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v42 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = self;
  id v8 = [v7 defaultManager];
  sub_10003FB60();
  NSString v9 = sub_10003FE70();
  swift_bridgeObjectRelease();
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  unint64_t v41 = a2;
  if ((v10 & 1) == 0)
  {
    *(void *)&long long v46 = sub_10001A274(a2 >> 3);
    *((void *)&v46 + 1) = v23;
    sub_1000212D4((uint64_t *)&v46, 0);
    uint64_t v21 = v2;
    long long v24 = v46;
    id v25 = [v7 defaultManager];
    sub_10003FB60();
    NSString v26 = sub_10003FE70();
    swift_bridgeObjectRelease();
    Class isa = sub_10003FC10().super.isa;
    [v25 createFileAtPath:v26 contents:isa attributes:0];

    uint64_t v15 = a1;
    sub_100012D88(v24, *((unint64_t *)&v24 + 1));
    uint64_t v29 = v43;
    uint64_t v28 = v44;
    goto LABEL_15;
  }
  id v11 = [v7 defaultManager];
  sub_10003FB60();
  NSString v12 = sub_10003FE70();
  swift_bridgeObjectRelease();
  *(void *)&long long v46 = 0;
  id v13 = [v11 attributesOfItemAtPath:v12 error:&v46];

  uint64_t v14 = (void *)v46;
  if (!v13)
  {
    id v30 = (id)v46;
    sub_10003FAE0();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v43);
LABEL_17:
    uint64_t v28 = v44;
LABEL_21:
    type metadata accessor for BloomFilterDiskStorage();
    swift_deallocPartialClassInstance();
    return v28;
  }
  uint64_t v15 = a1;
  type metadata accessor for FileAttributeKey();
  sub_1000218BC(&qword_100059E70, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v16 = sub_10003FE50();
  id v17 = v14;

  uint64_t v18 = v43;
  if (*(void *)(v16 + 16))
  {
    id v19 = NSFileSize;
    unint64_t v20 = sub_100019D1C((uint64_t)v19);
    uint64_t v21 = v2;
    if (v22)
    {
      sub_100019E10(*(void *)(v16 + 56) + 32 * v20, (uint64_t)&v46);
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
    }
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v21 = v2;
  }
  uint64_t v28 = v44;
  swift_bridgeObjectRelease();
  if (!*((void *)&v47 + 1))
  {
    sub_100019DB0((uint64_t)&v46);
    uint64_t v29 = v18;
    if (!v41) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  uint64_t v29 = v18;
  if ((swift_dynamicCast() & 1) == 0)
  {
    if (!v41) {
      goto LABEL_15;
    }
LABEL_20:
    sub_10001A7F8();
    swift_allocError();
    *(void *)uint64_t v38 = 0;
    *(void *)(v38 + 8) = 0;
    *(unsigned char *)(v38 + 16) = 2;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v15, v29);
    goto LABEL_21;
  }
  if (v45 >> 61) {
    __break(1u);
  }
  if (v41 != 8 * v45) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v31 = v28 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  uint64_t v32 = v5;
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v33(v28 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url, v15, v29);
  sub_10001EA74();
  uint64_t v34 = (uint64_t)v42;
  v33((uint64_t)v42, v15, v29);
  id v35 = sub_1000205B0(v34);
  if (v21)
  {
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v36(v15, v29);
    v36(v31, v29);
    goto LABEL_17;
  }
  id v37 = v35;
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v15, v29);
  uint64_t v28 = v44;
  *(void *)(v44 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v37;
  *(void *)(v28 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = v41;
  return v28;
}

id sub_1000205B0(uint64_t a1)
{
  sub_10003FB20(__stack_chk_guard);
  unint64_t v3 = v2;
  id v12 = 0;
  id v4 = [(id)swift_getObjCClassFromMetadata() fileHandleForUpdatingURL:v2 error:&v12];

  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = sub_10003FBA0();
    char v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    id v8 = v5;
    v7(a1, v6);
  }
  else
  {
    id v9 = v12;
    sub_10003FAE0();

    swift_willThrow();
    uint64_t v10 = sub_10003FBA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

uint64_t sub_100020708(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_100020758(a1);
  return v2;
}

uint64_t sub_100020758(void *a1)
{
  uint64_t v3 = sub_10003FBA0();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  NSString v26 = (char *)&v23 - v7;
  uint64_t v8 = sub_100015700(&qword_10005A188);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v27 = a1;
  sub_1000157F4(a1, v12);
  sub_1000215A8();
  sub_1000403B0();
  if (v1)
  {
    uint64_t v16 = (uint64_t)v27;
    uint64_t v18 = v28;
    type metadata accessor for BloomFilterDiskStorage();
    swift_deallocPartialClassInstance();
    uint64_t v22 = v16;
  }
  else
  {
    uint64_t v23 = v6;
    uint64_t v24 = v9;
    uint64_t v13 = v25;
    char v30 = 0;
    sub_1000218BC(&qword_10005A198, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v14 = v26;
    sub_100040260();
    uint64_t v15 = v8;
    uint64_t v18 = v28;
    uint64_t v19 = v28 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v28 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url, v14, v3);
    char v29 = 1;
    *(void *)(v18 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = sub_100040270();
    sub_10001EA74();
    uint64_t v20 = (uint64_t)v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v23, v19, v3);
    id v21 = sub_1000205B0(v20);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v15);
    *(void *)(v18 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v21;
    uint64_t v22 = (uint64_t)v27;
  }
  sub_100015838(v22);
  return v18;
}

uint64_t sub_100020B04(void *a1)
{
  uint64_t v3 = sub_100015700(&qword_10005A1A0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000157F4(a1, a1[3]);
  sub_1000215A8();
  sub_1000403C0();
  v8[15] = 0;
  sub_10003FBA0();
  sub_1000218BC(&qword_10005A1A8, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_1000402A0();
  if (!v1)
  {
    v8[14] = 1;
    sub_1000402B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100020CC0(unint64_t a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    sub_10001A7F8();
    swift_allocError();
    *(void *)uint64_t v11 = a1;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
LABEL_8:
    swift_willThrow();
    return v8 & 1;
  }
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  id v17 = 0;
  if (![v4 seekToOffset:a1 >> 3 error:&v17])
  {
    id v12 = v17;
    sub_10003FAE0();

    goto LABEL_8;
  }
  id v5 = v17;
  uint64_t v6 = sub_10003FF80();
  if (!v2)
  {
    unint64_t v9 = v7;
    if (v7 >> 60 != 15)
    {
      uint64_t v14 = v6;
      char v15 = ~(_BYTE)a1 & 7;
      unint64_t v16 = sub_100018B38(v6, v7);
      sub_100013318(v14, v9);
      uint64_t v8 = (v16 >> v15) & 1;
      return v8 & 1;
    }
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v10 = xmmword_100043440;
    *(unsigned char *)(v10 + 16) = 0;
    goto LABEL_8;
  }
  return v8 & 1;
}

void sub_100020E58(unint64_t a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    sub_10001A7F8();
    swift_allocError();
    *(void *)uint64_t v11 = a1;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
    goto LABEL_8;
  }
  unint64_t v4 = a1 >> 3;
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  __srCC_SHA256_CTX c = 0;
  if (![v5 seekToOffset:a1 >> 3 error:&__src])
  {
    id v12 = __src;
    sub_10003FAE0();

    goto LABEL_8;
  }
  id v6 = __src;
  uint64_t v7 = sub_10003FF80();
  if (v2) {
    return;
  }
  unint64_t v9 = v8;
  if (v8 >> 60 == 15)
  {
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v10 = xmmword_100043440;
    *(unsigned char *)(v10 + 16) = 0;
LABEL_8:
    swift_willThrow();
    return;
  }
  uint64_t v13 = v7;
  id v20 = 0;
  __srCC_SHA256_CTX c = (id)(sub_100018B38(v7, v8) | (1 << (~(_BYTE)a1 & 7)));
  if ([v5 seekToOffset:v4 error:&v20])
  {
    id v14 = v20;
    uint64_t v15 = sub_10001429C(&__src, (unsigned char *)&__src + 1);
    unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFLL;
    Class isa = sub_10003FC10().super.isa;
    sub_100012D88(v15, v17);
    [v5 writeData:isa];
    sub_100013318(v13, v9);
  }
  else
  {
    id v19 = v20;
    sub_10003FAE0();

    swift_willThrow();
    sub_100013318(v13, v9);
  }
}

id sub_100021094()
{
  id v0 = [self defaultManager];
  sub_10003FB20((NSURL *)OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url);
  uint64_t v2 = v1;
  sub_10003FB20(v3);
  id v5 = v4;
  id v9 = 0;
  unsigned int v6 = [v0 copyItemAtURL:v2 toURL:v4 error:&v9];

  if (v6) {
    return v9;
  }
  id v8 = v9;
  sub_10003FAE0();

  return (id)swift_willThrow();
}

uint64_t sub_1000211A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  uint64_t v2 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100021254@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100021290()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

void sub_1000212D4(uint64_t *a1, int __c)
{
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1000214C8((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_10003FBB0();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_10003F990();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x1000214B8);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_10003F9C0();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_10003F9B0();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      memset((void *)(v11 + v13), __c, v17);
      *a1 = __b;
      a1[1] = v7 | 0x8000000000000000;
      return;
    case 3uLL:
      return;
    default:
      uint64_t __b = *a1;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *a1 = v5;
      a1[1] = v6;
      return;
  }
}

void sub_1000214C8(int *a1, int a2)
{
  sub_10003FBD0();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = sub_10003F990();
  if (!v6)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_10003F9C0();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v10 = v5 - v4;
  uint64_t v11 = sub_10003F9B0();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }

  memset((void *)(v7 + v9), a2, v12);
}

uint64_t type metadata accessor for BloomFilterDiskStorage()
{
  uint64_t result = qword_10005C260;
  if (!qword_10005C260) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000215A8()
{
  unint64_t result = qword_10005A190;
  if (!qword_10005A190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A190);
  }
  return result;
}

unint64_t sub_100021600()
{
  unint64_t result = qword_10005A1B0;
  if (!qword_10005A1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A1B0);
  }
  return result;
}

unint64_t sub_100021658()
{
  unint64_t result = qword_10005A1B8;
  if (!qword_10005A1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A1B8);
  }
  return result;
}

unint64_t sub_1000216B0()
{
  unint64_t result = qword_10005A1C0;
  if (!qword_10005A1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A1C0);
  }
  return result;
}

uint64_t sub_100021704()
{
  return type metadata accessor for BloomFilterDiskStorage();
}

uint64_t sub_10002170C()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BloomFilterDiskStorage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    int *result = a2 + 1;
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
        JUMPOUT(0x100021884);
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
          int *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterDiskStorage.CodingKeys()
{
  return &type metadata for BloomFilterDiskStorage.CodingKeys;
}

uint64_t sub_1000218BC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100021904(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t sub_100021940(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100021998(a1, a2);
  return v4;
}

uint64_t sub_100021998(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = a2 >> 62;
  char v5 = 1;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      if (!v8)
      {
        char v5 = 1;
LABEL_22:
        sub_100021C3C();
        swift_allocError();
        char *v26 = v5;
        swift_willThrow();
        sub_100012D88(a1, a2);
        type metadata accessor for LaunchWarningMark();
        swift_deallocPartialClassInstance();
        return v3;
      }
      if (sub_10003FC90() != 1)
      {
        char v5 = 0;
        goto LABEL_22;
      }
      if (v4)
      {
        if (v4 == 1)
        {
          LODWORD(v12) = HIDWORD(a1) - a1;
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v12 = (int)v12;
            goto LABEL_16;
          }
          goto LABEL_31;
        }
        uint64_t v14 = *(void *)(a1 + 16);
        uint64_t v13 = *(void *)(a1 + 24);
        BOOL v11 = __OFSUB__(v13, v14);
        uint64_t v12 = v13 - v14;
        if (v11)
        {
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          sub_10003F9B0();
          __break(1u);
LABEL_37:
          sub_10003F9B0();
          __break(1u);
          JUMPOUT(0x100021C1CLL);
        }
      }
      else
      {
        uint64_t v12 = BYTE6(a2);
      }
LABEL_16:
      char v5 = 1;
      if (v12 != 9) {
        goto LABEL_22;
      }
      *(unsigned char *)(v3 + 16) = 1;
      uint64_t v15 = sub_10001B85C(1, 8, a1, a2);
      uint64_t v17 = sub_100021CB4(v15, v16);
      uint64_t v18 = v17;
      unint64_t v20 = v19;
      uint64_t v21 = v17;
      switch(v19 >> 62)
      {
        case 1uLL:
          if ((int)v17 > v17 >> 32) {
            goto LABEL_33;
          }
          uint64_t v22 = sub_10003F990();
          if (!v22) {
            goto LABEL_37;
          }
          uint64_t v23 = v22;
          uint64_t v24 = sub_10003F9C0();
          uint64_t v25 = (int)v18 - v24;
          if (__OFSUB__((int)v18, v24)) {
            goto LABEL_35;
          }
          sub_10003F9B0();
          uint64_t v21 = *(void *)(v23 + v25);
LABEL_28:
          sub_100012D88(v18, v20);
          sub_100012D88(a1, a2);
          *(void *)(v3 + 24) = v21;
          break;
        case 2uLL:
          uint64_t v28 = *(void *)(v17 + 16);
          swift_retain();
          swift_retain();
          uint64_t v29 = sub_10003F990();
          if (!v29) {
            goto LABEL_36;
          }
          uint64_t v30 = v29;
          uint64_t v31 = sub_10003F9C0();
          BOOL v11 = __OFSUB__(v28, v31);
          uint64_t v32 = v28 - v31;
          if (v11) {
            goto LABEL_34;
          }
          sub_10003F9B0();
          uint64_t v21 = *(void *)(v30 + v32);
          swift_release();
          swift_release();
          goto LABEL_28;
        case 3uLL:
          uint64_t v21 = 0;
          goto LABEL_28;
        default:
          goto LABEL_28;
      }
      return v3;
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_30;
    case 3uLL:
      goto LABEL_22;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_100021C3C()
{
  unint64_t result = qword_10005A2A0;
  if (!qword_10005A2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A2A0);
  }
  return result;
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return self;
}

uint64_t sub_100021CB4(uint64_t a1, unint64_t a2)
{
  v28[3] = &type metadata for Data;
  void v28[4] = &protocol witness table for Data;
  v28[0] = a1;
  v28[1] = a2;
  unint64_t v4 = sub_1000157F4(v28, (uint64_t)&type metadata for Data);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_100012C88(a1, a2);
      sub_100012C88(v5, v6);
      uint64_t v8 = (unsigned char *)sub_10003F990();
      if (v8)
      {
        uint64_t v9 = sub_10003F9C0();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_10003F9B0();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_10001C17C(v8, v13, &v27);
      sub_100012D88(v5, v6);
LABEL_27:
      sub_100012D88(a1, a2);
      uint64_t v24 = v27;
      sub_100015838((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_100012C88(a1, a2);
      swift_retain();
      swift_retain();
      unint64_t v16 = (unsigned char *)sub_10003F990();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_10003F9C0();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_10003F9B0();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_10001C17C(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_100012C88(a1, a2);
      uint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_100012C88(a1, a2);
      uint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_10001C17C(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_100021F68(uint64_t a1, uint64_t a2)
{
  v8[3] = &type metadata for UnsafeRawBufferPointer;
  void v8[4] = &protocol witness table for UnsafeRawBufferPointer;
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = sub_1000157F4(v8, (uint64_t)&type metadata for UnsafeRawBufferPointer);
  uint64_t v3 = (unsigned char *)*v2;
  if (*v2 && (unint64_t v4 = (unsigned char *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_10001429C(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_10001C5C0((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_10001C63C((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_100015838((uint64_t)v8);
  return v6;
}

uint64_t sub_100022024()
{
  long long v6 = xmmword_100043610;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v1 = sub_100021F68((uint64_t)&v5, (uint64_t)&v6);
  unint64_t v3 = v2;
  sub_10003FC50();
  sub_100012D88(v1, v3);
  return v6;
}

uint64_t sub_1000220C8()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 112))();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    sub_100018D5C();
    return sub_100012D88(v4, v5);
  }
  return result;
}

uint64_t sub_10002216C()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

unint64_t sub_100022180()
{
  unint64_t result = qword_10005A2A8;
  if (!qword_10005A2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A2A8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningMarkError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    int *result = a2 + 1;
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
        JUMPOUT(0x1000222A0);
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
          int *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

BOOL sub_1000222D8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1000222E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = swift_allocObject();
  sub_100022388(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

void *sub_100022388(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = v9;
  uint64_t v11 = v8;
  v11[2] = a7;
  v11[3] = a8;
  v11[5] = a1;
  v11[4] = *(void *)(a1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size);
  v11[8] = a2;
  v11[9] = a3;
  type metadata accessor for BloomFilterAlgorithm();
  swift_retain();
  sub_100012C88(a2, a3);
  uint64_t v17 = sub_10001A958(a4, a5);
  if (!v9)
  {
    v11[6] = v17;
    BOOL v18 = (uint64_t (*)(void, unint64_t))v17[4];
    swift_retain();
    uint64_t v19 = v18(0, 0xC000000000000000);
    swift_release();
    uint64_t v20 = *(void *)(v19 + 16);
    swift_bridgeObjectRelease();
    if (a6 >= 1 && v20 >= a6)
    {
      sub_100012D88(a2, a3);
      swift_release();
      v11[7] = a6;
      return v11;
    }
    sub_10001A7F8();
    swift_allocError();
    *(_OWORD *)uint64_t v21 = xmmword_100043720;
    *(unsigned char *)(v21 + 16) = 2;
    swift_willThrow();
  }
  sub_100012D88(a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  if (!v10) {
    swift_release();
  }
  sub_100012D88(v11[8], v11[9]);
  type metadata accessor for BloomFilter();
  swift_deallocPartialClassInstance();
  return v11;
}

uint64_t type metadata accessor for BloomFilter()
{
  return self;
}

uint64_t sub_100022564(unsigned __int8 *a1, char *a2)
{
  return sub_100022570(*a1, *a2);
}

uint64_t sub_100022570(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1702521203;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1702521203;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x656761726F7473;
      break;
    case 2:
      uint64_t v5 = 0x687469726F676C61;
      unint64_t v3 = 0xE90000000000006DLL;
      break;
    case 3:
      uint64_t v5 = 0x4572655073746962;
      unint64_t v3 = 0xEC0000007972746ELL;
      break;
    case 4:
      uint64_t v5 = 1953259891;
      break;
    case 5:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v5 = 25705;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x656761726F7473) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xE90000000000006DLL;
      if (v5 != 0x687469726F676C61) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xEC0000007972746ELL;
      if (v5 != 0x4572655073746962) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v2 = 1953259891;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xE200000000000000;
      if (v5 != 25705) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_1000402D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_100022754()
{
  return sub_10002275C();
}

Swift::Int sub_10002275C()
{
  return sub_100040390();
}

uint64_t sub_10002285C()
{
  sub_10003FEE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100022944()
{
  return sub_10002294C();
}

Swift::Int sub_10002294C()
{
  return sub_100040390();
}

uint64_t sub_100022A48@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100023884(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100022A78(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1702521203;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x656761726F7473;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x687469726F676C61;
      *(void *)(a1 + 8) = 0xE90000000000006DLL;
      break;
    case 3:
      strcpy((char *)a1, "bitsPerEntry");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 4:
      *(void *)a1 = 1953259891;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 5:
      *(void *)a1 = 25705;
      *(void *)(a1 + 8) = 0xE200000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_100022B40()
{
  uint64_t result = 1702521203;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656761726F7473;
      break;
    case 2:
      uint64_t result = 0x687469726F676C61;
      break;
    case 3:
      uint64_t result = 0x4572655073746962;
      break;
    case 4:
      uint64_t result = 1953259891;
      break;
    case 5:
      uint64_t result = 25705;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100022BF4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100023884(a1, a2);
  *a3 = result;
  return result;
}

void sub_100022C1C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100022C28(uint64_t a1)
{
  unint64_t v2 = sub_1000238D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100022C64(uint64_t a1)
{
  unint64_t v2 = sub_1000238D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100022CA0(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_100022CF0(a1);
  return v2;
}

uint64_t sub_100022CF0(void *a1)
{
  uint64_t v4 = sub_100015700(&qword_10005A370);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000157F4(a1, a1[3]);
  sub_1000238D0();
  sub_1000403B0();
  if (v2)
  {
    type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v10) = 0;
    *(void *)(v1 + 32) = sub_100040270();
    LOBYTE(v10) = 3;
    *(void *)(v1 + 56) = sub_100040250();
    char v11 = 4;
    sub_100023924();
    sub_100040260();
    *(_OWORD *)(v1 + 64) = v10;
    LOBYTE(v10) = 5;
    *(void *)(v1 + 16) = sub_100040240();
    *(void *)(v1 + 24) = v9;
    type metadata accessor for BloomFilterAlgorithm();
    char v11 = 2;
    sub_1000239CC(&qword_10005A388, (void (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm);
    sub_100040260();
    *(void *)(v1 + 48) = v10;
    type metadata accessor for BloomFilterDiskStorage();
    char v11 = 1;
    sub_1000239CC(&qword_10005A390, (void (*)(uint64_t))type metadata accessor for BloomFilterDiskStorage);
    sub_100040260();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)(v1 + 40) = v10;
  }
  sub_100015838((uint64_t)a1);
  return v1;
}

uint64_t sub_100023080(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100015700(&qword_10005A398);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000157F4(a1, a1[3]);
  sub_1000238D0();
  sub_1000403C0();
  LOBYTE(v12) = 0;
  sub_1000402B0();
  if (!v2)
  {
    LOBYTE(v12) = 3;
    sub_100040290();
    long long v12 = *(_OWORD *)(v3 + 64);
    char v11 = 4;
    sub_100023978();
    sub_1000402A0();
    LOBYTE(v12) = 5;
    sub_100040280();
    *(void *)&long long v12 = *(void *)(v3 + 48);
    char v11 = 2;
    type metadata accessor for BloomFilterAlgorithm();
    sub_1000239CC(&qword_10005A3A8, (void (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm);
    sub_1000402A0();
    *(void *)&long long v12 = *(void *)(v3 + 40);
    char v11 = 1;
    type metadata accessor for BloomFilterDiskStorage();
    sub_1000239CC(&qword_10005A3B0, (void (*)(uint64_t))type metadata accessor for BloomFilterDiskStorage);
    sub_1000402A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100023338()
{
  uint64_t v2 = *(void *)(v0 + 64);
  unint64_t v1 = *(void *)(v0 + 72);
  sub_100012C88(v2, v1);
  uint64_t v4 = sub_100021CB4(v2, v1);
  sub_10003FC50();
  return v4;
}

char *sub_1000233A0()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*v0 + 152))();
  unint64_t v3 = v2;
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))(v0[6] + 32);
  swift_retain();
  uint64_t v5 = v4(v1, v3);
  swift_release();
  sub_1000234A0(v0[7], v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v11 = v10;
  swift_retain();
  long long v12 = sub_100023A14(v7, v9, v11, (uint64_t)v0);
  swift_release();
  sub_100012D88(v1, v3);
  swift_unknownObjectRelease();
  return v12;
}

int64_t sub_1000234A0(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000234E4()
{
  uint64_t result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(uint64_t (**)(void))(*v0[5] + 128);
      uint64_t v7 = v4 - 1;
      do
      {
        int v8 = v6(*(void *)(v3 + 8 * v5 + 32));
        BOOL v10 = v7 != v5++;
      }
      while ((v8 & v10 & 1) != 0);
      char v11 = v8 ^ 1;
    }
    else
    {
      char v11 = 0;
    }
    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  return result;
}

uint64_t sub_1000235D4()
{
  uint64_t result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *(void (**)(void))(*v0[5] + 136);
      do
        v6(*(void *)(v3 + 8 * v5++ + 32));
      while (v4 != v5);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100023698()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_100012D88(*(void *)(v0 + 64), *(void *)(v0 + 72));

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t sub_1000236E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 136))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100023724()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

char *sub_100023768(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100023788(a1, a2, a3, *v3);
  unsigned char *v3 = result;
  return result;
}

char *sub_100023788(char *result, int64_t a2, char a3, char *a4)
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
    sub_100015700(&qword_100059F00);
    BOOL v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    BOOL v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_100023884(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000529C8;
  v6._object = a2;
  unint64_t v4 = sub_100040230(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

unint64_t sub_1000238D0()
{
  unint64_t result = qword_10005A378;
  if (!qword_10005A378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A378);
  }
  return result;
}

unint64_t sub_100023924()
{
  unint64_t result = qword_10005A380;
  if (!qword_10005A380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A380);
  }
  return result;
}

unint64_t sub_100023978()
{
  unint64_t result = qword_10005A3A0;
  if (!qword_10005A3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A3A0);
  }
  return result;
}

uint64_t sub_1000239CC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_100023A14(char *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_15;
  }
  char v5 = result;
  uint64_t result = (char *)&_swiftEmptyArrayStorage;
  if (v4)
  {
    unint64_t v15 = a3 >> 1;
    uint64_t result = sub_100023768(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    unint64_t v7 = *(void *)(a4 + 32);
    if (!v7)
    {
LABEL_17:
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    uint64_t result = (char *)&_swiftEmptyArrayStorage;
    uint64_t v10 = v15;
    uint64_t v9 = a2;
    while (1)
    {
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        break;
      }
      if (v9 + v8 >= v10 || v8 >= v4) {
        goto LABEL_14;
      }
      unint64_t v12 = *(void *)&v5[8 * a2 + 8 * v8];
      uint64_t v17 = result;
      unint64_t v14 = *((void *)result + 2);
      unint64_t v13 = *((void *)result + 3);
      if (v14 >= v13 >> 1)
      {
        sub_100023768((char *)(v13 > 1), v14 + 1, 1);
        uint64_t v10 = v15;
        uint64_t v9 = a2;
        uint64_t result = v17;
      }
      *((void *)result + 2) = v14 + 1;
      *(void *)&result[8 * v14 + 32] = v12 % v7;
      ++v8;
      if (v11 == v4) {
        return result;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

unint64_t sub_100023B54()
{
  unint64_t result = qword_10005A3B8;
  if (!qword_10005A3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A3B8);
  }
  return result;
}

unint64_t sub_100023BAC()
{
  unint64_t result = qword_10005A3C0;
  if (!qword_10005A3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A3C0);
  }
  return result;
}

unint64_t sub_100023C04()
{
  unint64_t result = qword_10005A3C8;
  if (!qword_10005A3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A3C8);
  }
  return result;
}

unint64_t sub_100023C5C()
{
  unint64_t result = qword_10005A3D0;
  if (!qword_10005A3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A3D0);
  }
  return result;
}

uint64_t sub_100023CB4(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for BloomFilterError(uint64_t a1)
{
  return sub_100023CD8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100023CD8(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17online_auth_agent16BloomFilterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100023CB4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for BloomFilterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100023CB4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100023CD8(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for BloomFilterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BloomFilterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100023CD8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100023E78(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100023E90(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterError()
{
  return &type metadata for BloomFilterError;
}

unsigned char *storeEnumTagSinglePayload for BloomFilterResult(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
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
        JUMPOUT(0x100023F84);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterResult()
{
  return &type metadata for BloomFilterResult;
}

uint64_t getEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    char *result = a2 + 5;
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
        JUMPOUT(0x100024118);
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
          char *result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_100024140(unsigned char *result, char a2)
{
  char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

uint64_t sub_100024158@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10001C6C0();
  swift_bridgeObjectRetain();
  NSString v4 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v5 = [a1 readSetting:v4];

  if (v5)
  {
    uint64_t v26 = sub_10003FEA0();
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v7 = 0x8000000100046460;
    uint64_t v26 = 0xD00000000000001ELL;
  }
  swift_bridgeObjectRetain();
  sub_10001C6CC();
  swift_bridgeObjectRetain();
  NSString v8 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v9 = [a1 readSetting:v8];

  if (v9)
  {
    uint64_t v10 = sub_10003FEA0();
    uint64_t v12 = v11;

    if (v10 == 0x786F62646E6173 && v12 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = 2;
    }
    else
    {
      char v14 = sub_1000402D0();
      swift_bridgeObjectRelease();
      if (v14) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
    }
  }
  else
  {
    uint64_t v13 = 1;
  }
  uint64_t v15 = sub_10001C6D8();
  if (v16) {
    unint64_t v17 = v15;
  }
  else {
    unint64_t v17 = 0xD00000000000001ELL;
  }
  if (v16) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = 0x8000000100046480;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_10001C9B4();
  uint64_t v21 = v20;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_10001C798();
  uint64_t v24 = v23;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v26;
  a2[1] = v7;
  a2[2] = v13;
  a2[3] = v17;
  a2[4] = v18;
  a2[5] = v19;
  a2[6] = v21;
  a2[7] = v22;
  a2[8] = v24;
  return result;
}

void sub_10002438C(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  id v5 = objc_allocWithZone((Class)CKContainerID);
  swift_bridgeObjectRetain();
  NSString v6 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithContainerIdentifier:v6 environment:v4];

  id v8 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v7];
  id v9 = [v8 publicCloudDatabase];
  id v10 = objc_allocWithZone((Class)CKRecordZone);
  id v21 = v9;
  swift_bridgeObjectRetain();
  NSString v11 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithZoneName:v11];

  sub_1000245E0(a1 + 40, (uint64_t)v22);
  sub_1000245E0((uint64_t)v22, (uint64_t)&v23);
  id v13 = v24;
  if (!v24)
  {
    id v20 = v12;
    if (*(void *)(a1 + 64)) {
      goto LABEL_3;
    }
LABEL_5:

    sub_100024648(a1);
    id v19 = 0;
    goto LABEL_6;
  }
  id v14 = objc_allocWithZone((Class)CKRecordZone);
  id v15 = v12;
  sub_1000246A0((uint64_t)v22);
  NSString v16 = sub_10003FE70();
  sub_1000246CC((uint64_t)v22);
  id v13 = [v14 initWithZoneName:v16];

  if (!*(void *)(a1 + 64)) {
    goto LABEL_5;
  }
LABEL_3:
  swift_bridgeObjectRetain();
  sub_100024648(a1);
  id v17 = objc_allocWithZone((Class)CKRecordZone);
  NSString v18 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithZoneName:v18];

LABEL_6:
  *a2 = v8;
  a2[1] = v21;
  a2[2] = v12;
  a2[3] = v19;
  a2[4] = v13;
}

uint64_t sub_1000245E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024648(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000246A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000246CC(uint64_t a1)
{
  return a1;
}

uint64_t destroy for CloudKitConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CloudKitConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitConfiguration()
{
  return &type metadata for CloudKitConfiguration;
}

void destroy for CloudKitRuntime(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for CloudKitRuntime(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  id v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  id v13 = *(void **)(a1 + 24);
  id v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  NSString v16 = *(void **)(a1 + 32);
  id v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  return a1;
}

__n128 initializeWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitRuntime(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitRuntime(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitRuntime()
{
  return &type metadata for CloudKitRuntime;
}

void type metadata accessor for CKContainerEnvironment()
{
  if (!qword_10005A4D8)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10005A4D8);
    }
  }
}

Swift::Int sub_100024C68()
{
  return sub_100040390();
}

void sub_100024CAC()
{
}

Swift::Int sub_100024CD4()
{
  return sub_100040390();
}

uint64_t sub_100024D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_100015700(&qword_10005A810);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  id v8 = &v38[-v7];
  uint64_t v9 = sub_10003FD00();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = &v38[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  id v14 = &v38[-v13];
  id v15 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 160);
  unint64_t v16 = v15(0);
  uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(1);
  unint64_t v43 = v17;
  uint64_t v18 = v15(2);
  uint64_t v19 = v15(3);
  (*(void (**)(uint64_t))(*(void *)a1 + 144))(4);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(5);
  if ((v16 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(v16))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v22 = v21;
  char v23 = sub_10001CAEC(v18);
  if (v23 == 2)
  {
    swift_bridgeObjectRelease();
    sub_10003FFB0();
    uint64_t v24 = (void *)*sub_10001E1E8();
    sub_100015700(&qword_100059C40);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100042B20;
    *(void *)(v25 + 56) = &type metadata for Int64;
    *(void *)(v25 + 64) = &protocol witness table for Int64;
    *(void *)(v25 + 32) = v18;
    id v26 = v24;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    uint64_t v46 = v18;
    uint64_t v27 = sub_1000402C0();
    uint64_t v29 = v28;
    sub_100014640();
    swift_allocError();
    *(_OWORD *)uint64_t v30 = xmmword_100043A40;
    *(void *)(v30 + 16) = v27;
    *(void *)(v30 + 24) = v29;
    *(unsigned char *)(v30 + 32) = 1;
    swift_willThrow();
    sub_100012D88(v42, v43);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v44 + 8))(v14, v45);
  }
  else
  {
    uint64_t v40 = v19;
    int v39 = v23 & 1;
    uint64_t v31 = sub_10003FBA0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 1, 1, v31);
    if (v22)
    {
      sub_10003FB70();
      swift_bridgeObjectRelease();
      sub_100027738((uint64_t)v8, &qword_10005A810);
      sub_10001CF40((uint64_t)v6, (uint64_t)v8);
    }
    uint64_t v33 = v44;
    uint64_t v32 = v45;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v44 + 16))(v12, v14, v45);
    uint64_t v37 = nullsub_1(v40, v34, v35, v36);
    sub_100025678((uint64_t)v8, (uint64_t)v6, &qword_10005A810);
    sub_10001CE74(v16, v42, v43, (uint64_t)v12, v39, v37, (uint64_t)v6, v41);
    sub_100027738((uint64_t)v8, &qword_10005A810);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v33 + 8))(v14, v32);
  }
}

uint64_t _s18LaunchWarningEntryVMa()
{
  uint64_t result = qword_10005CAF0;
  if (!qword_10005CAF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000251DC(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A810);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)a1 + 152);
  v7(*a2, 1);
  (*(void (**)(void, void, uint64_t))(*(void *)a1 + 120))(*((void *)a2 + 1), *((void *)a2 + 2), 2);
  id v8 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v9 = sub_10001CB04(*((unsigned char *)a2 + v8[7]));
  v7(v9, 3);
  v7(*(void *)((char *)a2 + v8[8]), 4);
  v7(0, 5);
  (*(void (**)(char *, uint64_t))(*(void *)a1 + 136))((char *)a2 + v8[6], 6);
  sub_100025678((uint64_t)a2 + v8[9], (uint64_t)v6, &qword_10005A810);
  uint64_t v10 = sub_10003FBA0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_100027738((uint64_t)v6, &qword_10005A810);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_10003FB00();
    uint64_t v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 184))(v12, v13, 7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002543C@<X0>(int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_100015700(&qword_10005A4E0);
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_100040160(87);
  v15._countAndFlagsBits = 0x205443454C4553;
  v15._object = (void *)0xE700000000000000;
  sub_10003FEF0(v15);
  v16._object = (void *)0x80000001000464A0;
  v16._countAndFlagsBits = 0xD000000000000035;
  sub_10003FEF0(v16);
  v17._countAndFlagsBits = 0xD00000000000004ELL;
  v17._object = (void *)0x80000001000465A0;
  sub_10003FEF0(v17);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(void *)(v11 + 32) = a3;
  sub_100012C88(a2, a3);
  swift_retain();
  sub_100013CF8(0, 0xE000000000000000, (uint64_t)sub_100025658, v11, (uint64_t)sub_10002565C, v7);
  swift_bridgeObjectRelease();
  swift_release();
  if (v14) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_100025678(v9, a4, &qword_10005A4E0);
  return swift_release();
}

uint64_t sub_10002565C(uint64_t a1)
{
  return sub_100025918(a1);
}

uint64_t sub_100025678(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100015700(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000256DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100015700(&qword_10005A4E0);
  uint64_t v5 = swift_allocBox();
  uint64_t v7 = v6;
  uint64_t v8 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_100040160(62);
  v10._countAndFlagsBits = 0x205443454C4553;
  v10._object = (void *)0xE700000000000000;
  sub_10003FEF0(v10);
  v11._object = (void *)0x80000001000464A0;
  v11._countAndFlagsBits = 0xD000000000000035;
  sub_10003FEF0(v11);
  v12._object = (void *)0x80000001000465F0;
  v12._countAndFlagsBits = 0xD000000000000035;
  sub_10003FEF0(v12);
  swift_retain();
  swift_retain();
  sub_100013CF8(0, 0xE000000000000000, (uint64_t)sub_1000258C0, a1, (uint64_t)sub_10002565C, v5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v2) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_100025678(v7, a2, &qword_10005A4E0);
  return swift_release();
}

uint64_t sub_1000258C0(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 24);
  if ((result & 0x8000000000000000) == 0) {
    return (*(uint64_t (**)(void))(*(void *)a1 + 152))();
  }
  __break(1u);
  return result;
}

uint64_t sub_100025918(uint64_t a1)
{
  uint64_t v3 = sub_100015700(&qword_10005A4E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_projectBox();
  uint64_t result = sub_100024D14(a1, (uint64_t)v8);
  if (!v1)
  {
    char v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(6);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(7);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v12 = result;
      uint64_t v13 = _s18LaunchWarningEntryVMa();
      sub_10002663C((uint64_t)v8, (uint64_t)v5 + *(int *)(v13 + 20), (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
      uint64_t *v5 = v12;
      *((unsigned char *)v5 + *(int *)(v13 + 24)) = v11 & 1;
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 0, 1, v13);
      swift_beginAccess();
      return sub_1000279D0((uint64_t)v5, v9);
    }
  }
  return result;
}

uint64_t sub_100025B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100015700(&qword_10005A4E0);
  __chkstk_darwin(v3);
  uint64_t v32 = (uint64_t)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LaunchWarningDetails();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  uint64_t v35 = (void *)(v9 + 16);
  uint64_t v10 = swift_allocBox();
  uint64_t v12 = v11;
  uint64_t v13 = _s18LaunchWarningEntryVMa();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v14;
  Swift::String v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v30 = v13;
  v15(v12, 1, 1);
  sub_100027A38(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v17 = (v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v33;
  *(void *)(v18 + 16) = v33;
  sub_10002663C((uint64_t)v8, v18 + v16, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
  *(void *)(v18 + v17) = v10;
  *(void *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8)) = v9;
  aBlock[4] = sub_100026548;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000265E4;
  aBlock[3] = &unk_100052DE0;
  id v20 = _Block_copy(aBlock);
  id v21 = v19;
  swift_retain();
  swift_retain();
  swift_release();
  [v21 transaction:v20];
  _Block_release(v20);
  uint64_t v22 = v35;
  swift_beginAccess();
  if (*v22)
  {
    swift_errorRetain();
    swift_willThrow();
LABEL_5:
    swift_release();
    return swift_release();
  }
  uint64_t v23 = v31;
  uint64_t v24 = v28;
  swift_beginAccess();
  uint64_t v25 = v24;
  uint64_t v26 = v32;
  sub_100025678(v25, v32, &qword_10005A4E0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v26, 1, v30);
  if (result != 1)
  {
    sub_10002663C(v26, v23, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025E94()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100025ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v44 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100015700(&qword_10005A4E0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v46 = (uint64_t)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v40 - v13;
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)v40 - v15;
  uint64_t v17 = _s18LaunchWarningEntryVMa();
  uint64_t v47 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v43 = (uint64_t)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v21 = (char *)v40 - v20;
  uint64_t v45 = swift_projectBox();
  sub_10002543C(*(_DWORD *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), (uint64_t)v16);
  v40[2] = v7;
  uint64_t v41 = v14;
  uint64_t v42 = a4;
  uint64_t v25 = v47;
  uint64_t v27 = v47 + 48;
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
  int v28 = v26(v16, 1, v17);
  if (v28 == 1)
  {
    v40[0] = v26;
    v40[1] = v27;
    sub_100027738((uint64_t)v16, &qword_10005A4E0);
    uint64_t v29 = a2;
    sub_100027A38(a2, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
    unint64_t v30 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v31 = swift_allocObject();
    sub_10002663C((uint64_t)v8, v31 + v30, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
    sub_100013CF8(0xD000000000000085, 0x8000000100046510, (uint64_t)sub_100027908, v31, 0, 0);
    swift_release();
    uint64_t v32 = (uint64_t)v41;
    sub_10002543C(*(_DWORD *)v29, *(void *)(v29 + 8), *(void *)(v29 + 16), (uint64_t)v41);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v40[0])(v32, 1, v17) == 1)
    {
      sub_100027738(v32, &qword_10005A4E0);
      sub_10002797C();
      uint64_t v33 = swift_allocError();
      swift_willThrow();
      uint64_t v22 = (uint64_t *)(v42 + 16);
      swift_beginAccess();
      uint64_t *v22 = v33;
      swift_errorRelease();
      return 0;
    }
    else
    {
      uint64_t v36 = v43;
      sub_10002663C(v32, v43, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
      uint64_t v37 = v36;
      uint64_t v38 = v46;
      sub_10002663C(v37, v46, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
      uint64_t v23 = 1;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v38, 0, 1, v17);
      uint64_t v39 = v45;
      swift_beginAccess();
      sub_1000279D0(v38, v39);
    }
  }
  else
  {
    sub_10002663C((uint64_t)v16, (uint64_t)v21, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
    uint64_t v34 = v46;
    sub_10002663C((uint64_t)v21, v46, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
    uint64_t v23 = 1;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v34, 0, 1, v17);
    uint64_t v35 = v45;
    swift_beginAccess();
    sub_1000279D0(v34, v35);
  }
  return v23;
}

uint64_t sub_1000263A4()
{
  uint64_t v1 = (int *)(type metadata accessor for LaunchWarningDetails() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  sub_100012D88(*(void *)(v0 + v3 + 8), *(void *)(v0 + v3 + 16));
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + v1[11];
  uint64_t v8 = sub_10003FBA0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100026548()
{
  uint64_t v1 = *(void *)(type metadata accessor for LaunchWarningDetails() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + v3);
  uint64_t v6 = *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_100025ECC(v4, v0 + v2, v5, v6);
}

uint64_t sub_1000265E4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

uint64_t sub_100026624(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100026634()
{
  return swift_release();
}

uint64_t sub_10002663C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000266A4(char a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_100013CF8(0xD00000000000003ALL, 0x8000000100046630, (uint64_t)sub_100026754, v4, 0, 0);
  return swift_release();
}

uint64_t sub_100026744()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026754(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)a1 + 168))(*(unsigned __int8 *)(v2 + 16), 1);
  if ((v4 & 0x8000000000000000) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 152))(v4, 2);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000267DC()
{
  sub_100012D88(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100026814(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  (*(void (**)(void, uint64_t))(*(void *)a1 + 152))(*(unsigned int *)(v1 + 16), 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 120))(v3, v4, 2);
}

unint64_t sub_1000268A4()
{
  unint64_t result = qword_10005A4E8;
  if (!qword_10005A4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A4E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningDBError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        char *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      char *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100026994);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

void *sub_1000269CC(void *a1, void *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    void *v4 = *a2;
    unsigned int v4 = (void *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + v7) = *(_DWORD *)((char *)a2 + v7);
    uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
    unint64_t v11 = *(void *)((char *)a2 + v7 + 16);
    sub_100012C88(v10, v11);
    *((void *)v8 + 1) = v10;
    *((void *)v8 + 2) = v11;
    uint64_t v12 = (int *)type metadata accessor for LaunchWarningDetails();
    uint64_t v13 = v12[6];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v16 = sub_10003FD00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(void *)&v8[v12[8]] = *(void *)&v9[v12[8]];
    uint64_t v17 = v12[9];
    uint64_t v18 = &v8[v17];
    uint64_t v19 = &v9[v17];
    uint64_t v20 = sub_10003FBA0();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_100015700(&qword_10005A810);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_100026BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_100012D88(*(void *)(v2 + 8), *(void *)(v2 + 16));
  uint64_t v3 = type metadata accessor for LaunchWarningDetails();
  uint64_t v4 = v2 + *(int *)(v3 + 24);
  uint64_t v5 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v2 + *(int *)(v3 + 36);
  uint64_t v7 = sub_10003FBA0();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

void *sub_100026D08(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_100012C88(v9, v10);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  unint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_10003FBA0();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100015700(&qword_10005A810);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_100026ECC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_100012C88(v9, v10);
  uint64_t v11 = *((void *)v7 + 1);
  unint64_t v12 = *((void *)v7 + 2);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  sub_100012D88(v11, v12);
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = v13[6];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(void *)&v7[v13[8]] = *(void *)&v8[v13[8]];
  uint64_t v18 = v13[9];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_10003FBA0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v7) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (!v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_100015700(&qword_10005A810);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000270FC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  uint64_t v9 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  unint64_t v12 = &v8[v10];
  uint64_t v13 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  uint64_t v14 = v9[9];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_10003FBA0();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_100015700(&qword_10005A810);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000272B4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a1 + v6 + 8);
  unint64_t v10 = *((void *)v7 + 2);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v8 + 8);
  sub_100012D88(v9, v10);
  uint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_10003FBA0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (!v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_100015700(&qword_10005A810);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000274D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000274EC);
}

uint64_t sub_1000274EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_1000275C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000275D4);
}

uint64_t sub_1000275D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t sub_100027694()
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100027738(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100015700(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100027798()
{
  unint64_t v1 = (int *)(type metadata accessor for LaunchWarningDetails() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  sub_100012D88(*(void *)(v0 + v3 + 8), *(void *)(v0 + v3 + 16));
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + v1[11];
  uint64_t v8 = sub_10003FBA0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002790C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for LaunchWarningDetails() - 8);
  uint64_t v4 = (unsigned int *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_1000251DC(a1, v4);
}

unint64_t sub_10002797C()
{
  unint64_t result = qword_10005A578;
  if (!qword_10005A578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A578);
  }
  return result;
}

uint64_t sub_1000279D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100027A38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_100027AA0()
{
  uint64_t v17 = sub_10003FFD0();
  uint64_t v1 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100040010();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10003FDC0();
  __chkstk_darwin(v5 - 8);
  type metadata accessor for LaunchWarningDB();
  uint64_t v6 = v0;
  char v7 = sub_100018080();
  id v8 = sub_100018088(v7 & 1);
  *(void *)&v6[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_db] = v8;
  id v9 = v8;
  sub_100024158(v9, v22);
  uint64_t v10 = type metadata accessor for CloudKitOperations();
  uint64_t v11 = sub_10002D5D8((uint64_t)v22);
  type metadata accessor for LaunchWarningController(0);
  uint64_t v20 = v10;
  uint64_t v21 = &off_100053390;
  *(void *)&long long v19 = v11;
  id v12 = v9;
  swift_retain();
  *(void *)&v6[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController] = sub_100032914(v12, (uint64_t)&v19);
  sub_100027DB8();
  sub_10003FDB0();
  *(void *)&long long v19 = &_swiftEmptyArrayStorage;
  sub_100027DF8();
  sub_100015700(&qword_10005A5A0);
  sub_100027E50();
  sub_100040140();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v17);
  *(void *)&v6[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_syncQueue] = sub_100040020();
  uint64_t v13 = type metadata accessor for MetricReporter();
  uint64_t v14 = sub_100016B34();
  uint64_t v20 = v13;
  uint64_t v21 = &off_100053790;
  swift_release();
  *(void *)&long long v19 = v14;
  sub_100027EAC(&v19, (uint64_t)&v6[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics]);

  uint64_t v15 = (objc_class *)type metadata accessor for LaunchWarningOperations();
  v18.receiver = v6;
  v18.super_class = v15;
  return [super init];
}

unint64_t sub_100027DB8()
{
  unint64_t result = qword_10005A590;
  if (!qword_10005A590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005A590);
  }
  return result;
}

unint64_t sub_100027DF8()
{
  unint64_t result = qword_10005A598;
  if (!qword_10005A598)
  {
    sub_100040010();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A598);
  }
  return result;
}

unint64_t sub_100027E50()
{
  unint64_t result = qword_10005A5A8;
  if (!qword_10005A5A8)
  {
    sub_1000157AC(&qword_10005A5A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A5A8);
  }
  return result;
}

uint64_t sub_100027EAC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for LaunchWarningOperations()
{
  return self;
}

uint64_t sub_100027F0C(char a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A4E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v37 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s18LaunchWarningEntryVMa();
  uint64_t v35 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003FFC0();
  id v9 = sub_10001E35C();
  uint64_t v10 = (void *)*v9;
  uint64_t v11 = sub_100015700(&qword_100059C40);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100042B30;
  *(void *)(v12 + 56) = &type metadata for UInt64;
  *(void *)(v12 + 64) = &protocol witness table for UInt64;
  *(void *)(v12 + 32) = a2;
  *(void *)(v12 + 96) = &type metadata for Bool;
  *(void *)(v12 + 104) = &protocol witness table for Bool;
  *(unsigned char *)(v12 + 72) = a1;
  id v13 = v10;
  sub_10003FD80();

  uint64_t v14 = v38;
  swift_bridgeObjectRelease();
  uint64_t v36 = a2;
  uint64_t v15 = v39;
  uint64_t result = sub_1000266A4(a1, a2);
  if (!v15)
  {
    v34[1] = v11;
    uint64_t v39 = (void **)v9;
    uint64_t v17 = (uint64_t)v37;
    if (a1)
    {
      type metadata accessor for LaunchWarningMark();
      v34[0] = sub_100021904(v36);
      sub_1000256DC(v34[0], v17);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v17, 1, v6) == 1)
      {
        sub_100027738(v17, &qword_10005A4E0);
        sub_10003FFB0();
        objc_super v18 = *v39;
        uint64_t v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = xmmword_100042B20;
        *(void *)(v19 + 56) = &type metadata for UInt64;
        *(void *)(v19 + 64) = &protocol witness table for UInt64;
        *(void *)(v19 + 32) = v36;
        id v20 = v18;
        sub_10003FD80();

        swift_bridgeObjectRelease();
        return swift_release();
      }
      else
      {
        sub_100028B20(v17, (uint64_t)v8, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
        uint64_t v21 = &v8[*(int *)(v6 + 20)];
        uint64_t v22 = *(unsigned int *)v21;
        uint64_t v23 = *((void *)v21 + 1);
        unint64_t v24 = *((void *)v21 + 2);
        sub_100012C88(v23, v24);
        uint64_t v26 = nullsub_1(v22, v23, v24, v25);
        uint64_t v28 = v27;
        unint64_t v30 = v29;
        uint64_t v31 = (void *)(v14 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics);
        uint64_t v32 = *(void *)(v14 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        uint64_t v33 = *(void *)(v14 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_1000157F4(v31, v32);
        (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v33 + 32))(v26, v28, v30, v32, v33);
        sub_100012D88(v28, v30);
        swift_release();
        return sub_100029974((uint64_t)v8, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
      }
    }
  }
  return result;
}

uint64_t sub_1000283A8(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = _s18LaunchWarningEntryVMa();
  __chkstk_darwin(v6 - 8);
  unint64_t v62 = (uint64_t *)((char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100015700(&qword_10005A5C0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for LaunchWarningDetails();
  uint64_t v64 = *(void *)(v67 - 8);
  uint64_t v11 = __chkstk_darwin(v67);
  uint64_t v60 = (uint64_t)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v61 = (unsigned int *)((char *)&v59 - v13);
  sub_10003FFC0();
  uint64_t v14 = (id *)sub_10001E35C();
  id v15 = *v14;
  uint64_t v65 = sub_100015700(&qword_100059C40);
  uint64_t v16 = swift_allocObject();
  long long v63 = xmmword_100042B30;
  *(_OWORD *)(v16 + 16) = xmmword_100042B30;
  *(void *)(v16 + 56) = &type metadata for UInt32;
  *(void *)(v16 + 64) = &protocol witness table for UInt32;
  unsigned int v68 = a3;
  *(_DWORD *)(v16 + 32) = a3;
  id v17 = v15;
  uint64_t v18 = a1;
  uint64_t v19 = a1;
  unint64_t v20 = a2;
  uint64_t v21 = sub_100015458(v19, a2);
  uint64_t v23 = v22;
  *(void *)(v16 + 96) = &type metadata for String;
  unint64_t v66 = sub_100016C7C();
  *(void *)(v16 + 104) = v66;
  *(void *)(v16 + 72) = v21;
  *(void *)(v16 + 80) = v23;
  sub_10003FD80();

  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(v70 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController);
  if (v24)
  {
    uint64_t v25 = *(void (**)(uint64_t, unint64_t, void))(*(void *)v24 + 280);
    swift_retain();
    uint64_t v26 = v18;
    uint64_t v27 = v18;
    unsigned int v28 = v68;
    uint64_t v29 = v69;
    v25(v27, v20, v68);
    if (v29)
    {
      swift_errorRelease();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56))(v10, 1, 1, v67);
      uint64_t v70 = 0;
    }
    else
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v10, 1, v67) != 1)
      {
        uint64_t v39 = v61;
        sub_100028B20((uint64_t)v10, (uint64_t)v61, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
        sub_10003FFC0();
        id v40 = *v14;
        uint64_t v41 = swift_allocObject();
        *(_OWORD *)(v41 + 16) = xmmword_100042B20;
        sub_10002990C((uint64_t)v39, v60, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
        id v42 = v40;
        uint64_t v43 = sub_10003FEC0();
        unint64_t v44 = v66;
        *(void *)(v41 + 56) = &type metadata for String;
        *(void *)(v41 + 64) = v44;
        *(void *)(v41 + 32) = v43;
        *(void *)(v41 + 40) = v45;
        sub_10003FD80();

        swift_bridgeObjectRelease();
        uint64_t v46 = *v39;
        uint64_t v47 = *((void *)v39 + 1);
        unint64_t v48 = *((void *)v39 + 2);
        sub_100012C88(v47, v48);
        uint64_t v50 = nullsub_1(v46, v47, v48, v49);
        uint64_t v52 = v51;
        unint64_t v54 = v53;
        uint64_t v55 = *(void *)(v70 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        uint64_t v56 = *(void *)(v70 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_1000157F4((void *)(v70 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v55);
        (*(void (**)(uint64_t, uint64_t, unint64_t, void, uint64_t, uint64_t, uint64_t))(v56 + 24))(v50, v52, v54, 0, 1, v55, v56);
        unint64_t v57 = v62;
        sub_100025B0C((uint64_t)v39, (uint64_t)v62);
        type metadata accessor for LaunchWarningMark();
        uint64_t v58 = sub_100021904(*v57);
        uint64_t v30 = (*(uint64_t (**)(void))(*(void *)v58 + 112))();
        swift_release();
        uint64_t v70 = 0;
        sub_100012D88(v52, v54);
        swift_release();
        sub_100029974((uint64_t)v57, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
        sub_100029974((uint64_t)v39, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
        return v30;
      }
      uint64_t v70 = 0;
    }
    sub_100027738((uint64_t)v10, &qword_10005A5C0);
    sub_10003FFA0();
    id v32 = *v14;
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = v63;
    *(void *)(v33 + 56) = &type metadata for UInt32;
    *(void *)(v33 + 64) = &protocol witness table for UInt32;
    *(_DWORD *)(v33 + 32) = v28;
    id v34 = v32;
    uint64_t v35 = sub_100015458(v26, v20);
    unint64_t v36 = v66;
    *(void *)(v33 + 96) = &type metadata for String;
    *(void *)(v33 + 104) = v36;
    *(void *)(v33 + 72) = v35;
    *(void *)(v33 + 80) = v37;
    sub_10003FD80();
    swift_release();

    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v30 = sub_10003FFB0();
    id v31 = *v14;
    sub_10003FD80();

    sub_100028ACC();
    swift_allocError();
    swift_willThrow();
  }
  return v30;
}

unint64_t sub_100028ACC()
{
  unint64_t result = qword_10005A5C8;
  if (!qword_10005A5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A5C8);
  }
  return result;
}

uint64_t sub_100028B20(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100028C9C()
{
  uint64_t result = sub_10001AADC();
  if (result)
  {
    sub_10003FFC0();
    long long v2 = sub_10001E35C();
    id v3 = (id)*v2;
    sub_10003FD80();

    if (*(void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController))
    {
      __chkstk_darwin(v4);
      swift_retain();
      sub_10003FFE0();
      return swift_release();
    }
    else
    {
      sub_10003FFB0();
      id v5 = (id)*v2;
      sub_10003FD80();

      sub_100028ACC();
      swift_allocError();
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_100028E24(uint64_t a1, void *a2)
{
  v96 = a2;
  uint64_t v4 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0);
  os_log_t v94 = *(os_log_t *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v83 - v8;
  uint64_t v97 = sub_10003FD00();
  uint64_t v10 = *(void *)(v97 - 8);
  uint64_t v11 = __chkstk_darwin(v97);
  uint64_t v13 = (char *)v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)v83 - v14;
  uint64_t v16 = sub_10003FCF0();
  __int16 v17 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(v16);
  Class isa = v19;
  if (v2)
  {
    uint64_t v20 = *(void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
    uint64_t v21 = *(void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
    v96 = sub_1000157F4((void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v20);
    sub_10003FCF0();
    sub_10003FCA0();
    double v23 = v22;
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v25 = v13;
    uint64_t v26 = v97;
    v24(v25, v97);
    (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v21 + 16))(v2, v20, v21, v23);
    swift_errorRelease();
    return ((uint64_t (*)(char *, uint64_t))v24)(v15, v26);
  }
  __int16 v28 = v17;
  v90 = v7;
  uint64_t v91 = a1;
  uint64_t v92 = v4;
  uint64_t v93 = v9;
  id v89 = 0;
  uint64_t v30 = *(void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
  uint64_t v29 = *(void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
  v96 = (void *)((char *)v96 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics);
  __int16 v31 = v18;
  *(void *)&long long v88 = sub_1000157F4(v96, v30);
  sub_10003FCF0();
  uint64_t v87 = v15;
  sub_10003FCA0();
  double v33 = v32;
  unint64_t v36 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
  uint64_t v34 = v10 + 8;
  uint64_t v35 = v36;
  uint64_t v86 = v34 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v37 = v13;
  uint64_t v38 = v97;
  v36(v37, v97);
  uint64_t v39 = (uint64_t)isa;
  (*(void (**)(void, Class, void, uint64_t, uint64_t, double))(v29 + 8))(v28 & 0x101, isa, v31 & 0x101, v30, v29, v33);
  uint64_t v40 = v34;
  if ((v28 & 1) == 0 && v39 < 1)
  {
    uint64_t v41 = v87;
    return v35(v41, v38);
  }
  sub_10003FFC0();
  id v42 = sub_10001E35C();
  id v43 = (id)*v42;
  sub_10003FD80();

  unint64_t v44 = v89;
  uint64_t v45 = (*(uint64_t (**)(void))(*(void *)v91 + 296))();
  if (v44) {
    return v35(v87, v38);
  }
  uint64_t v46 = v45;
  uint64_t v47 = *(void *)(v45 + 16);
  if (!v47)
  {
    swift_bridgeObjectRelease();
    sub_10003FFC0();
    id v82 = (id)*v42;
    sub_10003FD80();

    uint64_t v41 = v87;
    return v35(v41, v38);
  }
  uint64_t v84 = v35;
  v83[0] = v40;
  os_log_type_t v48 = sub_10003FFC0();
  id v89 = (NSObject **)v42;
  id v49 = (id)*v42;
  os_log_type_t v50 = v48;
  if (os_log_type_enabled((os_log_t)*v42, v48))
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = v49;
    unint64_t v53 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v53 = 134217984;
    uint64_t v99 = v47;
    sub_1000400F0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v52, v50, "Launch warning sync found %ld local warnings.", v53, 0xCu);
    swift_slowDealloc();
  }
  uint64_t v54 = *(void *)(v46 + 16);
  uint64_t v55 = v46;
  uint64_t v56 = (uint64_t)v93;
  if (v54)
  {
    uint64_t isa_low = LOBYTE(v94[10].isa);
    v83[1] = v55;
    uint64_t v58 = v55 + ((isa_low + 32) & ~isa_low);
    Class isa = v94[9].isa;
    *(void *)&long long v51 = 136315138;
    long long v88 = v51;
    unint64_t v85 = (char *)&type metadata for Any + 8;
    do
    {
      sub_10002990C(v58, v56, type metadata accessor for LaunchWarningController.NewLaunchWarning);
      unint64_t v71 = (unsigned int *)(v56 + *(int *)(v92 + 20));
      uint64_t v72 = *(void *)((char *)v71 + *(int *)(type metadata accessor for LaunchWarningDetails() + 32));
      uint64_t v73 = *(void *)sub_10001CC14();
      uint64_t v98 = v72;
      uint64_t v99 = v73;
      sub_10001D05C();
      if (sub_100040120())
      {
        char v59 = 0;
      }
      else
      {
        os_log_type_t v74 = sub_10003FFC0();
        uint64_t v75 = (uint64_t)v90;
        uint64_t v76 = *v89;
        sub_10002990C(v56, (uint64_t)v90, type metadata accessor for LaunchWarningController.NewLaunchWarning);
        if (os_log_type_enabled(v76, v74))
        {
          os_log_t v94 = v76;
          uint64_t v77 = swift_slowAlloc();
          uint64_t v99 = swift_slowAlloc();
          *(_DWORD *)uint64_t v77 = v88;
          unint64_t v78 = (uint64_t *)(v75 + *(int *)(type metadata accessor for AppRecord(0) + 20));
          uint64_t v79 = *v78;
          unint64_t v80 = v78[1];
          swift_bridgeObjectRetain();
          *(void *)(v77 + 4) = sub_1000299D4(v79, v80, &v99);
          swift_bridgeObjectRelease();
          sub_100029974((uint64_t)v90, type metadata accessor for LaunchWarningController.NewLaunchWarning);
          os_log_t v81 = v94;
          _os_log_impl((void *)&_mh_execute_header, v94, v74, "Terminating app: %s", (uint8_t *)v77, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          sub_100029974(v75, type metadata accessor for LaunchWarningController.NewLaunchWarning);
        }
        char v59 = (*(uint64_t (**)(uint64_t))(*(void *)v91 + 304))(v56);
      }
      uint64_t v60 = *v71;
      uint64_t v61 = *((void *)v71 + 1);
      unint64_t v62 = *((void *)v71 + 2);
      sub_100012C88(v61, v62);
      uint64_t v64 = nullsub_1(v60, v61, v62, v63);
      uint64_t v66 = v65;
      unint64_t v68 = v67;
      uint64_t v69 = v96[3];
      uint64_t v70 = v96[4];
      sub_1000157F4(v96, v69);
      (*(void (**)(uint64_t, uint64_t, unint64_t, void, void, uint64_t, uint64_t))(v70 + 24))(v64, v66, v68, v59 & 1, 0, v69, v70);
      sub_100012D88(v66, v68);
      uint64_t v56 = (uint64_t)v93;
      sub_100029974((uint64_t)v93, type metadata accessor for LaunchWarningController.NewLaunchWarning);
      v58 += (uint64_t)isa;
      --v54;
    }
    while (v54);
    swift_bridgeObjectRelease();
    uint64_t v38 = v97;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v84(v87, v38);
}

uint64_t sub_1000296A8()
{
  return sub_100028E24(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_100029740()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningOperations();
  return [super dealloc];
}

unint64_t sub_1000297E4()
{
  unint64_t result = qword_10005A5D0;
  if (!qword_10005A5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A5D0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningOperationsError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        char *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      char *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000298D4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningOperationsError()
{
  return &type metadata for LaunchWarningOperationsError;
}

uint64_t sub_10002990C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100029974(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000299D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100029AA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100019E10((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100019E10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100015838((uint64_t)v12);
  return v7;
}

uint64_t sub_100029AA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100040100();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100029C64(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100040180();
  if (!v8)
  {
    sub_1000401C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100040210();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100029C64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100029CFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100029E74(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100029E74(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100029CFC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100015744(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100040170();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000401C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10003FF10();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100040210();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000401C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100029E74(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100015700(&qword_100059C48);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100040210();
  __break(1u);
  return result;
}

uint64_t sub_100029FC4(uint64_t a1)
{
  uint64_t v4 = sub_10003FD30();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  ((void (*)(void))__chkstk_darwin)();
  int64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  int64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v16 = a1;
  v9(v7, a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, v7, v4);
  swift_retain();
  sub_100013CF8(0xD000000000000039, 0x8000000100046C30, (uint64_t)sub_10002A608, v11, (uint64_t)sub_10002A694, v8);
  swift_release();
  swift_release();
  if (v2) {
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v13 = *(void *)(v8 + 16);
  uint64_t v14 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_release();
  __chkstk_darwin(v15);
  *(&v16 - 4) = v16;
  *(&v16 - 3) = v1;
  *(&v16 - 2) = v13;
  *(&v16 - 1) = v14;
  sub_100014054((void (*)(uint64_t))sub_10002A6C0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void *)(type metadata accessor for UserTrustedProfileEntry() - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = (uint64_t *)(a1 + *(int *)(__chkstk_darwin() + 28));
  uint64_t v12 = v11[1];
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  if (!v12) {
    goto LABEL_3;
  }
  uint64_t v28 = v4;
  uint64_t v13 = v11[2];
  unint64_t v14 = v11[3];
  uint64_t v15 = *v11;
  uint64_t v29 = v9;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = v12;
  v16[4] = v13;
  v16[5] = v14;
  swift_bridgeObjectRetain();
  sub_100012C88(v13, v14);
  sub_100013CF8(0xD000000000000077, 0x8000000100046BB0, (uint64_t)sub_10002B148, (uint64_t)v16, 0, 0);
  uint64_t v5 = v28;
  uint64_t v9 = v29;
  uint64_t result = swift_release();
  if (!v28)
  {
LABEL_3:
    sub_10002AD5C(a1, (uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v19 = swift_allocObject();
    sub_10002ADC0((uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
    sub_100013CF8(0xD00000000000004CLL, 0x8000000100046D40, (uint64_t)sub_10002AF1C, v19, 0, 0);
    uint64_t result = swift_release();
    if (!v5)
    {
      uint64_t v20 = v27;
      if (v27)
      {
        uint64_t v21 = swift_allocObject();
        *(void *)(v21 + 16) = 0;
        uint64_t v22 = swift_allocObject();
        uint64_t v23 = v26;
        *(void *)(v22 + 16) = v26;
        *(void *)(v22 + 24) = v20;
        swift_bridgeObjectRetain();
        swift_retain();
        sub_100013CF8(0xD000000000000043, 0x8000000100046C70, (uint64_t)sub_10002AD40, v22, (uint64_t)sub_10002AD44, v21);
        swift_release();
        swift_release();
        swift_beginAccess();
        uint64_t v24 = *(void *)(v21 + 16);
        uint64_t result = swift_release();
        if (!v24)
        {
          uint64_t v25 = swift_allocObject();
          *(void *)(v25 + 16) = v23;
          *(void *)(v25 + 24) = v20;
          swift_bridgeObjectRetain();
          sub_100013CF8(0xD000000000000033, 0x8000000100046CC0, (uint64_t)sub_10002AD40, v25, 0, 0);
          return swift_release();
        }
      }
    }
  }
  return result;
}

uint64_t sub_10002A590(uint64_t a1)
{
  uint64_t v2 = sub_10003FD10();
  (*(void (**)(uint64_t))(*(void *)a1 + 184))(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A60C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)a1 + 192))(0);
  uint64_t v5 = v4;
  swift_beginAccess();
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002A694(uint64_t a1)
{
  return sub_10002A60C(a1, v1);
}

uint64_t sub_10002A6C0()
{
  return sub_10002A20C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10002A6E0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A6F0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A728(uint64_t a1)
{
  uint64_t v2 = sub_10003FD30();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v28 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int64_t v7 = (char *)v25 - v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  v25[1] = v8 + 16;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v8 + 24) = 0;
  uint64_t v29 = a1;
  uint64_t v27 = v9;
  v9(v7, a1, v2);
  uint64_t v10 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  v25[2] = v10 | 7;
  v25[3] = v11 + v4;
  uint64_t v12 = swift_allocObject();
  uint64_t v26 = v11;
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  uint64_t v30 = v2;
  v13(v12 + v11, v7, v2);
  swift_retain();
  uint64_t v14 = v31;
  sub_100013CF8(0xD000000000000039, 0x8000000100046C30, (uint64_t)sub_10002A608, v12, (uint64_t)sub_10002A694, v8);
  swift_release();
  swift_release();
  if (v14) {
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v16 = *(void *)(v8 + 24);
  uint64_t v31 = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  __int16 v17 = v28;
  uint64_t v18 = v30;
  v27(v28, v29, v30);
  uint64_t v19 = swift_allocObject();
  v13(v19 + v26, v17, v18);
  sub_100013CF8(0xD000000000000031, 0x8000000100046D00, (uint64_t)sub_10002AC90, v19, 0, 0);
  uint64_t result = swift_release();
  uint64_t v20 = v31;
  if (v16)
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = 0;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v20;
    *(void *)(v22 + 24) = v16;
    swift_bridgeObjectRetain_n();
    swift_retain();
    sub_100013CF8(0xD000000000000043, 0x8000000100046C70, (uint64_t)sub_10002AD40, v22, (uint64_t)sub_10002AD44, v21);
    swift_release();
    swift_release();
    swift_beginAccess();
    uint64_t v23 = *(void *)(v21 + 16);
    swift_bridgeObjectRelease();
    swift_release();
    if (v23)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v20;
      *(void *)(v24 + 24) = v16;
      swift_bridgeObjectRetain();
      sub_100013CF8(0xD000000000000033, 0x8000000100046CC0, (uint64_t)sub_10002AD40, v24, 0, 0);
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10002AB8C(uint64_t a1)
{
  sub_10003FD30();

  return sub_10002A590(a1);
}

uint64_t sub_10002AC00()
{
  uint64_t v1 = sub_10003FD30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002AC94(uint64_t a1)
{
  sub_10003FD30();
  uint64_t v2 = sub_10003FD10();
  (*(void (**)(uint64_t))(*(void *)a1 + 184))(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002AD44(uint64_t a1)
{
  return sub_10002B030(a1);
}

uint64_t sub_10002AD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002ADC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002AE24()
{
  uint64_t v1 = (int *)(type metadata accessor for UserTrustedProfileEntry() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_10003FD30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  uint64_t v6 = (void *)(v0 + v3 + v1[7]);
  if (v6[1])
  {
    swift_bridgeObjectRelease();
    sub_100012D88(v6[2], v6[3]);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002AF1C(uint64_t a1)
{
  uint64_t v3 = (int *)(type metadata accessor for UserTrustedProfileEntry() - 8);
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v3 + 80));
  uint64_t v5 = sub_10003FD10();
  uint64_t v6 = *(void (**)(uint64_t))(*(void *)a1 + 184);
  v6(v5);
  swift_bridgeObjectRelease();
  int64_t v7 = (uint64_t *)(v4 + v3[7]);
  uint64_t v8 = v7[1];
  if (v8)
  {
    uint64_t v9 = *v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = 0;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(v9, v8, 2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002B030(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)a1 + 160))(0);
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 16) = v3;
  return result;
}

uint64_t sub_10002B0B4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)a1 + 184))(*(void *)(v1 + 16), *(void *)(v1 + 24), 1);
}

uint64_t sub_10002B108()
{
  swift_bridgeObjectRelease();
  sub_100012D88(*(void *)(v0 + 32), *(void *)(v0 + 40));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002B14C(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  (*(void (**)(void, void, uint64_t))(*(void *)a1 + 184))(v1[2], v1[3], 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 120))(v3, v4, 2);
}

uint64_t sub_10002B1EC()
{
  uint64_t v0 = sub_10003FBA0();
  sub_100018728(v0, qword_10005D6C0);
  sub_100018048(v0, (uint64_t)qword_10005D6C0);
  return sub_10003FB10();
}

id sub_10002B250(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_10005CC80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10003FBA0();
  sub_100018048(v5, (uint64_t)qword_10005D6C0);
  sub_10003FB20(v6);
  uint64_t v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  id v9 = [super initWithDatabaseURL:v7 asReadOnly:a1 & 1];

  return v9;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return self;
}

uint64_t sub_10002B548()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10003FBA0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [v1 dbURL];
  sub_10003FB40();

  sub_10003FB60();
  int64_t v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v5, v2);
  uint64_t v8 = sub_10003FED0();
  swift_bridgeObjectRelease();
  sub_100005D14((const char *)(v8 + 32));
  swift_release();
  id v9 = [v1 shmURL];
  sub_10003FB40();

  sub_10003FB60();
  v7(v5, v2);
  uint64_t v10 = sub_10003FED0();
  swift_bridgeObjectRelease();
  sub_100005D14((const char *)(v10 + 32));
  swift_release();
  id v11 = [v1 walURL];
  sub_10003FB40();

  sub_10003FB60();
  v7(v5, v2);
  uint64_t v12 = sub_10003FED0();
  swift_bridgeObjectRelease();
  sub_100005D14((const char *)(v12 + 32));
  return swift_release();
}

id sub_10002B7C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return [super dealloc];
}

BOOL sub_10002B800(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id sub_10002B814(void *a1, void *a2)
{
  id v35 = a1;
  uint64_t v3 = sub_100015700(&qword_10005A630);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = sub_10003FD00();
  uint64_t v10 = *(void **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v30 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v30 - v17;
  if (a2)
  {
    id v34 = a2;
    id v19 = [v35 creationDate];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v31 = v13;
      sub_10003FCE0();

      double v33 = (void (*)(char *, char *, uint64_t))v10[4];
      v33(v8, v16, v9);
      double v32 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v10[7];
      v32(v8, 0, 1, v9);
      uint64_t v21 = (unsigned int (*)(char *, uint64_t, uint64_t))v10[6];
      if (v21(v8, 1, v9) != 1)
      {
        v33(v18, v8, v9);
        id v22 = [v35 creationDate];
        if (v22)
        {
          uint64_t v23 = v22;
          sub_10003FCE0();

          v33(v6, v16, v9);
          v32(v6, 0, 1, v9);
          if (v21(v6, 1, v9) != 1)
          {
            uint64_t v24 = v31;
            v33(v31, v6, v9);
            char v25 = sub_10003FCB0();
            uint64_t v26 = (void (*)(char *, uint64_t))v10[1];
            v26(v24, v9);
            v26(v18, v9);
            if (v25)
            {

              goto LABEL_8;
            }
            return v34;
          }
        }
        else
        {
          v32(v6, 1, 1, v9);
        }
        ((void (*)(char *, uint64_t))v10[1])(v18, v9);
        uint64_t v29 = (uint64_t)v6;
LABEL_15:
        sub_100027738(v29, &qword_10005A630);
        return v34;
      }
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v10[7])(v8, 1, 1, v9);
    }
    uint64_t v29 = (uint64_t)v8;
    goto LABEL_15;
  }
LABEL_8:
  id v27 = v35;

  return v27;
}

uint64_t sub_10002BBEC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v63 = a7;
  uint64_t v64 = a8;
  int v66 = a3;
  uint64_t v67 = a1;
  unint64_t v68 = a2;
  uint64_t v69 = a9;
  uint64_t v12 = sub_100015700(&qword_10005A810);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v65 = &v61[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  uint64_t v16 = &v61[-v15];
  uint64_t v17 = sub_100015700(&qword_10005A630);
  __chkstk_darwin(v17 - 8);
  id v19 = &v61[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_10003FD00();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = &v61[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  uint64_t v26 = &v61[-v25];
  sub_100025678(a6, (uint64_t)v19, &qword_10005A630);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_10003FCF0();
    sub_100027738((uint64_t)v19, &qword_10005A630);
    if (!a4) {
      goto LABEL_11;
    }
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 32))(v26, v19, v20);
    if (!a4)
    {
LABEL_11:
      sub_10003FFB0();
      uint64_t v40 = (void *)*sub_10001E29C();
      sub_100015700(&qword_100059C40);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_100042B20;
      uint64_t v71 = a4;
      swift_unknownObjectRetain();
      id v36 = v40;
      sub_100015700((uint64_t *)&unk_10005A840);
      uint64_t v42 = sub_10003FEC0();
      uint64_t v44 = v43;
      *(void *)(v41 + 56) = &type metadata for String;
      *(void *)(v41 + 64) = sub_100016C7C();
      *(void *)(v41 + 32) = v42;
      *(void *)(v41 + 40) = v44;
      goto LABEL_12;
    }
  }
  uint64_t v71 = a4;
  swift_unknownObjectRetain();
  sub_100015700(&qword_10005A808);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v30 = nullsub_1(v70, v27, v28, v29);
  if (!a5 || (uint64_t v31 = v30, v71 = a5, swift_unknownObjectRetain(), (swift_dynamicCast() & 1) == 0))
  {
    sub_10003FFB0();
    uint64_t v45 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_100042B20;
    uint64_t v71 = a5;
    swift_unknownObjectRetain();
    id v47 = v45;
    sub_100015700((uint64_t *)&unk_10005A840);
    uint64_t v48 = sub_10003FEC0();
    uint64_t v50 = v49;
    *(void *)(v46 + 56) = &type metadata for String;
    *(void *)(v46 + 64) = sub_100016C7C();
    *(void *)(v46 + 32) = v48;
    *(void *)(v46 + 40) = v50;
    sub_10003FD80();

    goto LABEL_14;
  }
  char v32 = sub_10001CAEC(v70);
  if (v32 == 2)
  {
    uint64_t v33 = *(void *)sub_10001CC08();
    uint64_t v70 = v31;
    uint64_t v71 = v33;
    sub_10001D05C();
    if (sub_100040120())
    {
      sub_10003FFC0();
      id v34 = (void *)*sub_10001E29C();
      sub_100015700(&qword_100059C40);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_100042B30;
      *(void *)(v35 + 56) = &type metadata for UInt32;
      *(void *)(v35 + 64) = &protocol witness table for UInt32;
      *(_DWORD *)(v35 + 32) = v66;
      id v36 = v34;
      uint64_t v37 = sub_100015458(v67, v68);
      uint64_t v39 = v38;
      *(void *)(v35 + 96) = &type metadata for String;
      *(void *)(v35 + 104) = sub_100016C7C();
      *(void *)(v35 + 72) = v37;
      *(void *)(v35 + 80) = v39;
LABEL_12:
      sub_10003FD80();

LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v26, v20);
      uint64_t v51 = type metadata accessor for LaunchWarningDetails();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v69, 1, 1, v51);
    }
    int v53 = 1;
  }
  else
  {
    int v53 = v32 & 1;
  }
  int v62 = v53;
  uint64_t v54 = sub_10003FBA0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v16, 1, 1, v54);
  uint64_t v55 = (uint64_t)v65;
  if (v64)
  {
    sub_10003FB70();
    sub_100027738((uint64_t)v16, &qword_10005A810);
    sub_100031CF8(v55, (uint64_t)v16, &qword_10005A810);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 16))(v24, v26, v20);
  sub_100025678((uint64_t)v16, v55, &qword_10005A810);
  uint64_t v56 = v55;
  uint64_t v57 = v67;
  uint64_t v58 = v68;
  sub_100012C88(v67, v68);
  uint64_t v59 = v69;
  sub_10001CE74(v66, v57, v58, (uint64_t)v24, v62, v31, v56, v69);
  sub_100027738((uint64_t)v16, &qword_10005A810);
  (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v26, v20);
  uint64_t v60 = type metadata accessor for LaunchWarningDetails();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 0, 1, v60);
}

uint64_t sub_10002C290@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100015700(&qword_10005A810);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FBA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v75 - v12;
  if (sub_100040080())
  {
    self;
    uint64_t v14 = (void *)swift_dynamicCastObjCClass();
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v85 = a2;
      id v16 = [v14 fileURL];
      if (v16)
      {
        uint64_t v17 = v16;
        sub_10003FB40();

        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v18(v6, v11, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
        {
          v18(v13, v6, v7);
          uint64_t v19 = sub_100040080();
          if (!v19 || (uint64_t v88 = v19, sub_100015700(&qword_10005A808), (swift_dynamicCast() & 1) == 0))
          {
            sub_10003FFB0();
            id v47 = (void *)*sub_10001E29C();
            sub_100015700(&qword_100059C40);
            uint64_t v48 = swift_allocObject();
            *(_OWORD *)(v48 + 16) = xmmword_100042B20;
            *(void *)(v48 + 56) = sub_100031CBC(0, &qword_10005A638);
            *(void *)(v48 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
            *(void *)(v48 + 32) = a1;
            id v49 = a1;
            id v50 = v47;
            sub_10003FD80();
            swift_unknownObjectRelease();

LABEL_36:
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
            goto LABEL_37;
          }
          uint64_t v20 = v86;
          unint64_t v21 = v87;
          uint64_t v22 = sub_100040080();
          uint64_t v84 = v20;
          if (v22
            && (uint64_t v86 = v22, (swift_dynamicCast() & 1) != 0)
            && (uint64_t v23 = v88, (v24 = sub_100040080()) != 0)
            && (uint64_t v88 = v24, (swift_dynamicCast() & 1) != 0))
          {
            uint64_t v81 = v86;
            uint64_t v82 = v23;
            uint64_t v25 = v87;
            uint64_t v26 = sub_100040080();
            if (v26 && (uint64_t v83 = v25, v88 = v26, (swift_dynamicCast() & 1) != 0))
            {
              uint64_t v27 = v87;
              uint64_t v80 = v86;
              uint64_t v28 = sub_100040080();
              if (v28)
              {
                uint64_t v88 = v28;
                if (swift_dynamicCast())
                {
                  unint64_t v79 = v21;
                  uint64_t v29 = v86;
                  uint64_t v78 = v87;
                  uint64_t v30 = sub_100040080();
                  if (v30)
                  {
                    uint64_t v88 = v30;
                    if (swift_dynamicCast())
                    {
                      uint64_t v31 = v87;
                      uint64_t v77 = v86;
                      uint64_t v32 = sub_100040080();
                      if (v32)
                      {
                        uint64_t v76 = v31;
                        uint64_t v86 = v32;
                        if (swift_dynamicCast())
                        {
                          uint64_t v75 = v88;
                          uint64_t v33 = sub_100040080();
                          if (v33)
                          {
                            uint64_t v88 = v33;
                            int v34 = swift_dynamicCast();
                            if (v34) {
                              uint64_t v35 = v86;
                            }
                            else {
                              uint64_t v35 = 0;
                            }
                            if (v34) {
                              uint64_t v36 = v87;
                            }
                            else {
                              uint64_t v36 = 0;
                            }
                          }
                          else
                          {
                            uint64_t v35 = 0;
                            uint64_t v36 = 0;
                          }
                          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
                          uint64_t v74 = v35;
                          uint64_t v72 = v85;
                          sub_100039EC4((uint64_t)v11, v84, v79, v82, v81, v83, v80, v27, v85, v29, v78, v77, v76, v75, v74, v36);
                          swift_unknownObjectRelease();
                          (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
                          uint64_t v73 = type metadata accessor for BloomFilterRecord(0);
                          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8)
                                                                                              + 56))(v72, 0, 1, v73);
                        }
                      }
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      sub_10003FFB0();
                      unint64_t v68 = (void *)*sub_10001E29C();
                      sub_100015700(&qword_100059C40);
                      uint64_t v69 = swift_allocObject();
                      *(_OWORD *)(v69 + 16) = xmmword_100042B20;
                      *(void *)(v69 + 56) = sub_100031CBC(0, &qword_10005A638);
                      *(void *)(v69 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
                      *(void *)(v69 + 32) = a1;
                      id v70 = v68;
                      id v71 = a1;
                      sub_10003FD80();
                      sub_100012D88(v84, v79);
                      swift_unknownObjectRelease();

                      goto LABEL_36;
                    }
                  }
                  uint64_t v64 = v20;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  LODWORD(v83) = sub_10003FFB0();
                  uint64_t v65 = (void *)*sub_10001E29C();
                  sub_100015700(&qword_100059C40);
                  uint64_t v66 = swift_allocObject();
                  *(_OWORD *)(v66 + 16) = xmmword_100042B20;
                  *(void *)(v66 + 56) = sub_100031CBC(0, &qword_10005A638);
                  *(void *)(v66 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
                  *(void *)(v66 + 32) = a1;
                  id v67 = a1;
                  id v54 = v65;
                  sub_10003FD80();
                  uint64_t v55 = v64;
                  unint64_t v56 = v79;
                  goto LABEL_35;
                }
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              LODWORD(v83) = sub_10003FFB0();
              uint64_t v61 = (void *)*sub_10001E29C();
              sub_100015700(&qword_100059C40);
              uint64_t v62 = swift_allocObject();
              *(_OWORD *)(v62 + 16) = xmmword_100042B20;
              *(void *)(v62 + 56) = sub_100031CBC(0, &qword_10005A638);
              *(void *)(v62 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
              *(void *)(v62 + 32) = a1;
              id v63 = a1;
              id v54 = v61;
            }
            else
            {
              swift_bridgeObjectRelease();
              LODWORD(v83) = sub_10003FFB0();
              uint64_t v58 = (void *)*sub_10001E29C();
              sub_100015700(&qword_100059C40);
              uint64_t v59 = swift_allocObject();
              *(_OWORD *)(v59 + 16) = xmmword_100042B20;
              *(void *)(v59 + 56) = sub_100031CBC(0, &qword_10005A638);
              *(void *)(v59 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
              *(void *)(v59 + 32) = a1;
              id v60 = a1;
              id v54 = v58;
            }
          }
          else
          {
            LODWORD(v83) = sub_10003FFB0();
            uint64_t v51 = (void *)*sub_10001E29C();
            sub_100015700(&qword_100059C40);
            uint64_t v52 = swift_allocObject();
            *(_OWORD *)(v52 + 16) = xmmword_100042B20;
            *(void *)(v52 + 56) = sub_100031CBC(0, &qword_10005A638);
            *(void *)(v52 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
            *(void *)(v52 + 32) = a1;
            id v53 = a1;
            id v54 = v51;
          }
          sub_10003FD80();
          uint64_t v55 = v84;
          unint64_t v56 = v21;
LABEL_35:
          sub_100012D88(v55, v56);
          swift_unknownObjectRelease();

          goto LABEL_36;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
      }
      sub_100027738((uint64_t)v6, &qword_10005A810);
      sub_10003FFB0();
      uint64_t v44 = (void *)*sub_10001E29C();
      sub_100015700(&qword_100059C40);
      uint64_t v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_100042B20;
      *(void *)(v45 + 56) = sub_100031CBC(0, &qword_10005A818);
      *(void *)(v45 + 64) = sub_100031900(&qword_10005A820, &qword_10005A818);
      *(void *)(v45 + 32) = v15;
      id v46 = v44;
      swift_unknownObjectRetain();
      sub_10003FD80();

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_37:
      uint64_t v57 = type metadata accessor for BloomFilterRecord(0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v85, 1, 1, v57);
    }
    swift_unknownObjectRelease();
  }
  sub_10003FFB0();
  uint64_t v37 = (void *)*sub_10001E29C();
  sub_100015700(&qword_100059C40);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_100042B20;
  *(void *)(v38 + 56) = sub_100031CBC(0, &qword_10005A638);
  *(void *)(v38 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
  *(void *)(v38 + 32) = a1;
  id v39 = a1;
  id v40 = v37;
  sub_10003FD80();

  swift_bridgeObjectRelease();
  uint64_t v41 = type metadata accessor for BloomFilterRecord(0);
  uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56);

  return v42(a2, 1, 1, v41);
}

uint64_t sub_10002CFD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100015700(&qword_10005A810);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FBA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v31 - v12;
  if (!sub_100040080())
  {
LABEL_7:
    sub_10003FFB0();
    unint64_t v21 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100042B20;
    *(void *)(v22 + 56) = sub_100031CBC(0, &qword_10005A638);
    *(void *)(v22 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
    *(void *)(v22 + 32) = a1;
    id v23 = v21;
    id v24 = a1;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    uint64_t v25 = type metadata accessor for DocumentCheckerRecord(0);
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
    return v26(a2, 1, 1, v25);
  }
  self;
  uint64_t v14 = (void *)swift_dynamicCastObjCClass();
  if (!v14)
  {
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  uint64_t v15 = v14;
  id v16 = [v14 fileURL];
  if (v16)
  {
    uint64_t v17 = v16;
    sub_10003FB40();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v11, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v18(v13, v6, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      sub_10003A008((uint64_t)v11, a2);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      uint64_t v19 = type metadata accessor for DocumentCheckerRecord(0);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a2, 0, 1, v19);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_100027738((uint64_t)v6, &qword_10005A810);
  sub_10003FFB0();
  uint64_t v27 = (void *)*sub_10001E29C();
  sub_100015700(&qword_100059C40);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_100042B20;
  *(void *)(v28 + 56) = sub_100031CBC(0, &qword_10005A818);
  *(void *)(v28 + 64) = sub_100031900(&qword_10005A820, &qword_10005A818);
  *(void *)(v28 + 32) = v15;
  id v29 = v27;
  swift_unknownObjectRetain();
  sub_10003FD80();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v30 = type metadata accessor for DocumentCheckerRecord(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a2, 1, 1, v30);
}

id sub_10002D4D0@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = (void *)v1[3];
  uint64_t v5 = (void *)v1[4];
  id v6 = (void *)v1[5];
  id v12 = (id)v1[6];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v12;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;

  return v12;
}

void sub_10002D55C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = (void *)v1[3];
  uint64_t v5 = (void *)v1[4];
  id v6 = (void *)v1[5];
  id v7 = (void *)v1[6];
  long long v8 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v1 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v1 + 2) = v8;
  v1[6] = *(void *)(a1 + 32);
}

uint64_t sub_10002D5D8(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_10002438C(a1, v5);
  long long v3 = v5[1];
  *(_OWORD *)(v2 + 16) = v5[0];
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v6;
  return v2;
}

__n128 sub_10002D638(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = *(void *)(a1 + 32);
  return result;
}

uint64_t sub_10002D678()
{
  id v1 = objc_allocWithZone((Class)CKRecordZone);
  swift_bridgeObjectRetain();
  NSString v2 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithZoneName:v2];

  long long v4 = *(uint64_t (**)(unsigned char *))(*(void *)v0 + 104);
  uint64_t v5 = (void (*)(unsigned char *, void))v4(v15);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v3;

  v5(v15, 0);
  id v8 = objc_allocWithZone((Class)CKRecordZone);
  swift_bridgeObjectRetain();
  NSString v9 = sub_10003FE70();
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithZoneName:v9];

  uint64_t v11 = (uint64_t (*)(unsigned char *, void))v4(v15);
  uint64_t v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v10;

  return v11(v15, 0);
}

id *sub_10002D7E0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v9 = sub_100015700(&qword_10005A630);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 result = sub_10002EEB4(a1, a2);
  if (!v4)
  {
    uint64_t v13 = result;
    if (result)
    {
      uint64_t v21 = sub_100040080();
      uint64_t v14 = sub_100040080();
      id v15 = [v13 creationDate];
      if (v15)
      {
        id v16 = v15;
        sub_10003FCE0();

        uint64_t v17 = sub_10003FD00();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
      }
      else
      {
        uint64_t v19 = sub_10003FD00();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 1, 1, v19);
      }
      sub_100031CBC(0, &qword_10005A638);
      sub_100040000();
      sub_10002BBEC(a1, a2, a3, v21, v14, (uint64_t)v11, v20[0], v20[1], a4);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return (id *)sub_100027738((uint64_t)v11, &qword_10005A630);
    }
    else
    {
      uint64_t v18 = type metadata accessor for LaunchWarningDetails();
      return (id *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a4, 1, 1, v18);
    }
  }
  return result;
}

void sub_10002DA4C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v30)(void *__return_ptr);
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  CKFetchRecordZoneChangesOperation v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  id *v96;
  id *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  long long v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  int v108;
  void *v109;
  uint64_t *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void v119[3];
  uint64_t v120;
  uint64_t v121;
  void v122[3];
  uint64_t v123;
  uint64_t v124;
  void v125[3];
  uint64_t v126;
  uint64_t v127;
  id v128[3];
  uint64_t v129;
  uint64_t v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137[2];
  id v138;
  Swift::OpaquePointer_optional v139;
  Swift::OpaquePointer_optional v140;

  uint64_t v101 = a3;
  uint64_t v4 = v3;
  uint64_t v7 = sub_100015700(&qword_10005A640);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v99 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v100 = (char *)&v95 - v10;
  uint64_t v11 = sub_100015700(&qword_10005A648);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v102 = (uint64_t)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v107 = (uint64_t)&v95 - v14;
  uint64_t v15 = swift_allocObject();
  v116 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_100042C50;
  uint64_t v98 = v15 + 16;
  uint64_t v16 = swift_allocObject();
  uint64_t v111 = v16;
  *(void *)(v16 + 16) = 0;
  v96 = (id *)(v16 + 16);
  uint64_t v17 = swift_allocObject();
  v115 = v17;
  *(void *)(v17 + 16) = 0;
  uint64_t v97 = (id *)(v17 + 16);
  uint64_t v18 = swift_allocObject();
  v114 = v18;
  *(void *)(v18 + 16) = 0;
  v110 = (uint64_t *)(v18 + 16);
  id v19 = [objc_allocWithZone((Class)CKFetchRecordZoneChangesConfiguration) init];
  v112 = v19;
  v113 = v4;
  if (a2 >> 60 != 15)
  {
    sub_100012C88(a1, a2);
    sub_10003FFA0();
    uint64_t v20 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100042B20;
    id v22 = v20;
    uint64_t v23 = sub_10003FC20(0);
    uint64_t v25 = v24;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_100016C7C();
    *(void *)(v21 + 32) = v23;
    *(void *)(v21 + 40) = v25;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    id v26 = objc_allocWithZone((Class)CKServerChangeToken);
    sub_100012C88(a1, a2);
    Class isa = sub_10003FC10().super.isa;
    id v28 = [v26 initWithData:isa];
    sub_100013318(a1, a2);

    id v19 = v112;
    uint64_t v4 = v113;
    [v112 setPreviousServerChangeToken:v28];

    sub_100013318(a1, a2);
  }
  uint64_t v29 = sub_100040060();
  uint64_t v30 = *(void (**)(void *__return_ptr))(*(void *)v4 + 88);
  ((void (*)(void *__return_ptr, uint64_t))v30)(v119, v29);
  uint64_t v31 = (void *)v119[0];
  uint64_t v32 = (id)v119[2];

  uint64_t v33 = (void *)v119[1];
  sub_100031CF8((uint64_t)&v120, (uint64_t)&v138, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v138);
  sub_100031CF8((uint64_t)&v121, (uint64_t)v137, (uint64_t *)&unk_10005A650);
  sub_10002F790(v137);
  int v34 = [v32 zoneID];

  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001) != 0)
  {
    if ((uint64_t)&_swiftEmptyDictionarySingleton < 0) {
      uint64_t v37 = &_swiftEmptyDictionarySingleton;
    }
    else {
      uint64_t v37 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8);
    }
    uint64_t v38 = v19;
    id v39 = sub_1000401A0();
    if (__OFADD__(v39, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v36 = (void *)sub_10002FDA8((uint64_t)v37, v39 + 1);
  }
  else
  {
    uint64_t v35 = v19;
    uint64_t v36 = &_swiftEmptyDictionarySingleton;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v118 = v36;
  sub_100030314((uint64_t)v19, v34, isUniquelyReferenced_nonNull_native);
  v109 = v118;

  swift_bridgeObjectRelease();
  id v108 = sub_10003FFA0();
  v106 = sub_10001E29C();
  uint64_t v41 = (void *)*v106;
  uint64_t v105 = sub_100015700(&qword_100059C40);
  uint64_t v42 = swift_allocObject();
  v104 = xmmword_100042B20;
  *(_OWORD *)(v42 + 16) = xmmword_100042B20;
  uint64_t v43 = v41;
  v30(v122);
  uint64_t v44 = (void *)v122[0];
  uint64_t v45 = (id)v122[2];

  id v46 = (void *)v122[1];
  sub_100031CF8((uint64_t)&v123, (uint64_t)&v136, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v136);
  sub_100031CF8((uint64_t)&v124, (uint64_t)&v135, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v135);
  id v47 = [v45 zoneID];

  uint64_t v48 = [v47 zoneName];
  id v49 = sub_10003FEA0();
  uint64_t v51 = v50;

  *(void *)(v42 + 56) = &type metadata for String;
  uint64_t v103 = sub_100016C7C();
  *(void *)(v42 + 64) = v103;
  *(void *)(v42 + 32) = v49;
  *(void *)(v42 + 40) = v51;
  sub_10003FD80();

  swift_bridgeObjectRelease();
  sub_100031CBC(0, &qword_10005A668);
  sub_100015700((uint64_t *)&unk_10005A670);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_100043C50;
  v30(v125);
  id v53 = (void *)v125[0];
  id v54 = (id)v125[2];

  uint64_t v55 = (void *)v125[1];
  sub_100031CF8((uint64_t)&v126, (uint64_t)&v134, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v134);
  sub_100031CF8((uint64_t)&v127, (uint64_t)&v133, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v133);
  unint64_t v56 = [v54 zoneID];

  *(void *)(v52 + 32) = v56;
  v118 = (void *)v52;
  sub_10003FF30();
  uint64_t v57 = v118;
  LOBYTE(v54) = (_BYTE)v109;
  swift_bridgeObjectRetain();
  v139.value._rawValue = v57;
  v139.is_nil = (char)v54;
  v58.super.super.super.super.Class isa = sub_100040040(v139, v140).super.super.super.super.isa;
  uint64_t v59 = (void *)swift_allocObject();
  uint64_t v61 = v114;
  id v60 = v115;
  uint64_t v62 = v111;
  v59[2] = v114;
  v59[3] = v62;
  v59[4] = v60;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100040050();
  id v63 = swift_allocObject();
  *(void *)(v63 + 16) = v116;
  *(void *)(v63 + 24) = v61;
  swift_retain();
  swift_retain();
  sub_100040030();
  uint64_t v64 = [(objc_class *)v58.super.super.super.super.isa configuration];
  if (!v64)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v65 = v64;
  [v64 setQualityOfService:25];

  uint64_t v66 = [(objc_class *)v58.super.super.super.super.isa configuration];
  if (!v66)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v67 = v66;
  [v66 setTimeoutIntervalForRequest:10.0];

  unint64_t v68 = [(objc_class *)v58.super.super.super.super.isa configuration];
  if (!v68)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v69 = v68;
  [v68 setTimeoutIntervalForResource:60.0];

  id v70 = [(objc_class *)v58.super.super.super.super.isa configuration];
  if (!v70)
  {
LABEL_26:
    __break(1u);
    return;
  }
  id v71 = v70;
  swift_bridgeObjectRelease();
  [v71 setPreferAnonymousRequests:1];

  v30(v128);
  uint64_t v72 = v128[1];

  sub_100031CF8((uint64_t)&v129, (uint64_t)&v132, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v132);
  sub_100031CF8((uint64_t)&v130, (uint64_t)&v131, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v131);
  [v72 addOperation:v58.super.super.super.super.isa];

  [(objc_class *)v58.super.super.super.super.isa waitUntilFinished];
  uint64_t v73 = v110;
  swift_beginAccess();
  uint64_t v74 = *v73;
  if (v74)
  {
    swift_errorRetain();
    sub_10003FFB0();
    uint64_t v75 = (void *)*v106;
    uint64_t v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = v104;
    v117 = v74;
    swift_errorRetain();
    uint64_t v77 = v75;
    sub_100015700(&qword_100059E40);
    uint64_t v78 = sub_10003FEC0();
    unint64_t v79 = v103;
    *(void *)(v76 + 56) = &type metadata for String;
    *(void *)(v76 + 64) = v79;
    *(void *)(v76 + 32) = v78;
    *(void *)(v76 + 40) = v80;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v81 = type metadata accessor for BloomFilterRecord(0);
    uint64_t v82 = v107;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v107, 1, 1, v81);
    uint64_t v83 = v96;
    swift_beginAccess();
    if (*v83)
    {
      uint64_t v84 = *v83;
      uint64_t v85 = v102;
      sub_10002C290(v84, v102);

      sub_100027738(v82, &qword_10005A648);
      sub_100031CF8(v85, v82, &qword_10005A648);
    }
    uint64_t v86 = type metadata accessor for DocumentCheckerRecord(0);
    uint64_t v87 = (uint64_t)v100;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 56))(v100, 1, 1, v86);
    uint64_t v88 = v97;
    swift_beginAccess();
    id v89 = (uint64_t)v99;
    if (*v88)
    {
      v90 = *v88;
      sub_10002CFD8(v90, v89);

      sub_100027738(v87, &qword_10005A640);
      sub_100031CF8(v89, v87, &qword_10005A640);
    }
    uint64_t v91 = v107;
    uint64_t v92 = v102;
    sub_100025678(v107, v102, &qword_10005A648);
    sub_100025678(v87, v89, &qword_10005A640);
    swift_beginAccess();
    uint64_t v93 = *(void *)(v116 + 16);
    os_log_t v94 = *(void *)(v116 + 24);
    sub_100012DE0(v93, v94);
    sub_10003A0A8(v92, v89, v93, v94, v101);

    sub_100027738(v87, &qword_10005A640);
    sub_100027738(v91, &qword_10005A648);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
}

id sub_10002E63C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void (*v49)(id *__return_ptr);
  void *v50;
  id v53;
  uint64_t v54;
  void v55[3];
  uint64_t v56;
  uint64_t v57;
  id v58[3];
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64[2];
  void *v65;
  Swift::OpaquePointer_optional v66;
  Swift::OpaquePointer_optional v67;

  id v54 = swift_allocObject();
  *(unsigned char *)(v54 + 16) = 0;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100042C50;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  id v50 = (void *)(v8 + 16);
  id v49 = *(void (**)(id *__return_ptr))(*(void *)v4 + 88);
  v49((id *)v55);
  sub_100031CF8((uint64_t)&v56, (uint64_t)v64, (uint64_t *)&unk_10005A650);
  uint64_t v9 = (void *)v55[0];
  sub_1000308F8(v64);

  sub_10002F790(v64);
  sub_100031CF8((uint64_t)&v57, (uint64_t)&v63, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v63);
  sub_100031CF8((uint64_t)v64, (uint64_t)&v65, (uint64_t *)&unk_10005A650);
  id v53 = v65;
  if (!v65)
  {
    sub_10003FFC0();
    id v26 = (id)*sub_10001E29C();
    sub_10003FD80();

    sub_100030924();
    swift_allocError();
    *uint64_t v27 = 3;
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    return (id)(a3 & 1);
  }
  id v10 = [objc_allocWithZone((Class)CKFetchRecordZoneChangesConfiguration) init];
  if (a4 >> 60 != 15)
  {
    sub_100012C88(a3, a4);
    sub_10003FFA0();
    uint64_t v11 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_100042B20;
    id v13 = v11;
    uint64_t v14 = v7;
    uint64_t v15 = sub_10003FC20(0);
    uint64_t v16 = v10;
    uint64_t v17 = v8;
    uint64_t v19 = v18;
    *(void *)(v12 + 56) = &type metadata for String;
    *(void *)(v12 + 64) = sub_100016C7C();
    *(void *)(v12 + 32) = v15;
    *(void *)(v12 + 40) = v19;
    uint64_t v7 = v14;
    uint64_t v8 = v17;
    id v10 = v16;
    sub_10003FD80();

    swift_bridgeObjectRelease();
    id v20 = objc_allocWithZone((Class)CKServerChangeToken);
    sub_100012C88(a3, a4);
    Class isa = sub_10003FC10().super.isa;
    id v22 = [v20 initWithData:isa];
    sub_100013318(a3, a4);

    [v16 setPreviousServerChangeToken:v22];
    sub_100013318(a3, a4);
  }
  sub_100040060();
  id v23 = [v53 zoneID];
  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001) != 0)
  {
    if ((uint64_t)&_swiftEmptyDictionarySingleton < 0) {
      uint64_t v25 = &_swiftEmptyDictionarySingleton;
    }
    else {
      uint64_t v25 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8);
    }
    id v28 = v10;
    id result = (id)sub_1000401A0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    LOBYTE(v25) = sub_10002FDA8((uint64_t)v25, (uint64_t)result + 1);
  }
  else
  {
    id v24 = v10;
    uint64_t v25 = &_swiftEmptyDictionarySingleton;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = v10;
  sub_100030314((uint64_t)v10, v23, isUniquelyReferenced_nonNull_native);
  Swift::Bool v31 = (char)v25;

  swift_bridgeObjectRelease();
  sub_100031CBC(0, &qword_10005A668);
  sub_100015700((uint64_t *)&unk_10005A670);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_100043C50;
  *(void *)(v32 + 32) = [v53 zoneID];
  sub_10003FF30();
  swift_bridgeObjectRetain();
  v66.value._rawValue = (void *)v32;
  v66.is_nil = v31;
  v33.super.super.super.super.Class isa = sub_100040040(v66, v67).super.super.super.super.isa;
  int v34 = (void *)swift_allocObject();
  uint64_t v34[2] = v8;
  void v34[3] = v54;
  void v34[4] = a1;
  v34[5] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100040050();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v7;
  *(void *)(v35 + 24) = v8;
  swift_retain();
  swift_retain();
  sub_100040030();
  id result = [(objc_class *)v33.super.super.super.super.isa configuration];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v36 = result;
  [result setQualityOfService:25];

  id result = [(objc_class *)v33.super.super.super.super.isa configuration];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v37 = result;
  [result setTimeoutIntervalForRequest:10.0];

  id result = [(objc_class *)v33.super.super.super.super.isa configuration];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v38 = result;
  [result setTimeoutIntervalForResource:60.0];

  id result = [(objc_class *)v33.super.super.super.super.isa configuration];
  if (result)
  {
    id v39 = result;
    swift_bridgeObjectRelease();
    [v39 setPreferAnonymousRequests:1];

    v49(v58);
    id v40 = v58[1];

    sub_100031CF8((uint64_t)&v59, (uint64_t)&v62, (uint64_t *)&unk_10005A650);
    sub_10002F790(&v62);
    sub_100031CF8((uint64_t)&v60, (uint64_t)&v61, (uint64_t *)&unk_10005A650);
    sub_10002F790(&v61);
    [v40 addOperation:v33.super.super.super.super.isa];

    [(objc_class *)v33.super.super.super.super.isa waitUntilFinished];
    swift_beginAccess();
    if (*v50)
    {
      swift_errorRetain();
      LOBYTE(a3) = sub_10003FFB0();
      uint64_t v41 = (void *)*sub_10001E29C();
      sub_100015700(&qword_100059C40);
      uint64_t v42 = swift_allocObject();
      *(_OWORD *)(v42 + 16) = xmmword_100042B20;
      swift_errorRetain();
      id v43 = v41;
      sub_100015700(&qword_100059E40);
      uint64_t v44 = sub_10003FEC0();
      uint64_t v46 = v45;
      *(void *)(v42 + 56) = &type metadata for String;
      *(void *)(v42 + 64) = sub_100016C7C();
      *(void *)(v42 + 32) = v44;
      *(void *)(v42 + 40) = v46;
      sub_10003FD80();

      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    else
    {
      swift_beginAccess();
      char v47 = *(unsigned char *)(v54 + 16);
      swift_beginAccess();
      sub_100012DE0(*(void *)(v7 + 16), *(void *)(v7 + 24));
      LOBYTE(a3) = sub_10003A124(v47);
    }
    sub_10002F790(v64);
    swift_release();
    swift_release();
    swift_release();

    return (id)(a3 & 1);
  }
LABEL_25:
  __break(1u);
  return result;
}

id *sub_10002EEB4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(id **)(*(void *)v2 + 88);
  ((void (*)(void *__return_ptr))v5)(v43);
  sub_100031CF8((uint64_t)&v45, (uint64_t)v52, (uint64_t *)&unk_10005A650);
  uint64_t v6 = (void *)v43[0];
  sub_1000308F8(v52);

  sub_100031CF8((uint64_t)&v44, (uint64_t)&v51, (uint64_t *)&unk_10005A650);
  sub_10002F790(&v51);
  sub_10002F790(v52);
  sub_100031CF8((uint64_t)v52, (uint64_t)&v53, (uint64_t *)&unk_10005A650);
  uint64_t v7 = v53;
  if (!v53)
  {
    sub_10003FFB0();
    id v29 = (id)*sub_10001E29C();
    sub_10003FD80();

    sub_100030924();
    swift_allocError();
    unsigned char *v30 = 1;
    swift_willThrow();
    return v5;
  }
  id v40 = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(unsigned char *)(v8 + 24) = -1;
  v54._countAndFlagsBits = sub_1000402C0();
  sub_10003FEF0(v54);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 47;
  v55._object = (void *)0xE100000000000000;
  sub_10003FEF0(v55);
  v56._countAndFlagsBits = sub_100015458(a1, a2);
  sub_10003FEF0(v56);
  swift_bridgeObjectRelease();
  sub_100031CBC(0, &qword_10005A788);
  swift_bridgeObjectRetain();
  v9.super.Class isa = (Class)[v7 zoneID];
  v57._countAndFlagsBits = 0x73616864632F3176;
  v57._object = (void *)0xEA00000000002F68;
  Class isa = sub_10003FF70(v57, v9).super.isa;
  sub_10003FFA0();
  id v39 = (id *)sub_10001E29C();
  id v11 = *v39;
  sub_100015700(&qword_100059C40);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100042B20;
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v38 = sub_100016C7C();
  *(void *)(v12 + 64) = v38;
  *(void *)(v12 + 32) = 0x73616864632F3176;
  *(void *)(v12 + 40) = 0xEA00000000002F68;
  id v13 = v11;
  sub_10003FD80();

  swift_bridgeObjectRelease();
  sub_100015700((uint64_t *)&unk_10005A670);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100043C50;
  *(void *)(v14 + 32) = isa;
  sub_10003FF30();
  id v15 = objc_allocWithZone((Class)CKFetchRecordsOperation);
  uint64_t v16 = isa;
  Class v17 = sub_10003FF20().super.isa;
  swift_bridgeObjectRelease();
  id v18 = [v15 initWithRecordIDs:v17];

  swift_retain();
  sub_10003FFF0();
  id result = (id *)[v18 configuration];
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v20 = result;
  [result setQualityOfService:25];

  id result = (id *)[v18 configuration];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v21 = result;
  [result setTimeoutIntervalForRequest:10.0];

  id result = (id *)[v18 configuration];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v22 = result;
  [result setTimeoutIntervalForResource:60.0];

  id result = (id *)[v18 configuration];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v23 = result;
  [result setPreferAnonymousRequests:1];

  id result = (id *)[v18 configuration];
  if (result)
  {
    id v24 = result;
    NSString v25 = sub_10003FE70();
    [v24 set_sourceApplicationSecondaryIdentifier:v25];

    uint64_t v5 = v46;
    ((void (*)(id *__return_ptr))v40)(v46);
    id v26 = v46[1];

    sub_100031CF8((uint64_t)&v47, (uint64_t)&v50, (uint64_t *)&unk_10005A650);
    sub_10002F790(&v50);
    sub_100031CF8((uint64_t)&v48, (uint64_t)&v49, (uint64_t *)&unk_10005A650);
    sub_10002F790(&v49);
    [v26 addOperation:v18];

    [v18 waitUntilFinished];
    swift_beginAccess();
    int v27 = *(unsigned __int8 *)(v8 + 24);
    if (v27 == 255)
    {
      sub_10003FFB0();
      id v31 = *v39;
      sub_10003FD80();

      sub_100030924();
      swift_allocError();
      *uint64_t v32 = 0;
      swift_willThrow();
      swift_release();

      sub_10002F790(v52);
    }
    else
    {
      uint64_t v5 = *(id **)(v8 + 16);
      if (v27)
      {
        uint64_t v42 = *(void *)(v8 + 16);
        sub_100031E10(v5, v27);
        sub_100031950(v5, 1);
        sub_100031950(v5, 1);
        sub_100015700(&qword_100059E40);
        type metadata accessor for CKError(0);
        if ((swift_dynamicCast() & 1) != 0
          && (sub_100031E88(&qword_10005A778, type metadata accessor for CKError),
              sub_10003FA90(),
              v41,
              v42 == 11))
        {
          sub_100031E28(v5, v27);
          sub_100031E28(v5, v27);
          swift_release();

          sub_10002F790(v52);
          return 0;
        }
        else
        {
          sub_10003FFB0();
          id v33 = *v39;
          uint64_t v34 = swift_allocObject();
          *(_OWORD *)(v34 + 16) = xmmword_100042B20;
          sub_100031E10(v5, v27);
          id v35 = v33;
          uint64_t v36 = sub_10003FEC0();
          *(void *)(v34 + 56) = &type metadata for String;
          *(void *)(v34 + 64) = v38;
          *(void *)(v34 + 32) = v36;
          *(void *)(v34 + 40) = v37;
          sub_10003FD80();

          swift_bridgeObjectRelease();
          swift_willThrow();
          sub_100031E28(v5, v27);
          swift_release();

          sub_10002F790(v52);
        }
      }
      else
      {
        id v28 = v5;

        sub_10002F790(v52);
        swift_release();
      }
    }
    return v5;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_10002F6D8()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_100012D88(*(void *)(v0 + 16), v1);
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F720()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F758()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

id *sub_10002F790(id *a1)
{
  return a1;
}

uint64_t sub_10002F7BC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 40);
  uint64_t v4 = *(void **)(v0 + 48);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_10002F824()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t sub_10002F868()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t sub_10002F8AC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))() & 1;
}

uint64_t sub_10002F900()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

id sub_10002F944()
{
  return *v0;
}

uint64_t sub_10002F94C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10002F954()
{
  return sub_10003FEA0();
}

uint64_t sub_10002F964(uint64_t a1)
{
  uint64_t v2 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10002F9D0(uint64_t a1)
{
  uint64_t v2 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10002FA3C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_10002FACC()
{
  id v1 = *v0;
  uint64_t v2 = sub_1000400B0();

  return v2;
}

uint64_t sub_10002FB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10002FB80()
{
  return sub_100040390();
}

uint64_t sub_10002FBE0(uint64_t a1)
{
  uint64_t v2 = sub_100031E88(&qword_10005A868, type metadata accessor for CKError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10002FC4C(uint64_t a1)
{
  uint64_t v2 = sub_100031E88(&qword_10005A868, type metadata accessor for CKError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10002FCB8(uint64_t a1)
{
  uint64_t v2 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_10002FD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100031E88(&qword_10005A778, type metadata accessor for CKError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

Swift::Int sub_10002FDA8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100015700(&qword_10005A830);
    uint64_t v2 = sub_1000401F0();
    uint64_t v18 = v2;
    sub_100040190();
    uint64_t v3 = sub_1000401B0();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100031CBC(0, &qword_10005A828);
      do
      {
        swift_dynamicCast();
        sub_100031CBC(0, &qword_10005A838);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100030040(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100040090(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1000401B0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

unint64_t sub_10002FFFC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100040090(*(void *)(v2 + 40));

  return sub_1000319F8(a1, v4);
}

uint64_t sub_100030040(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100015700(&qword_10005A830);
  uint64_t v6 = sub_1000401E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_100040090(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  id v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_100030314(uint64_t a1, void *a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_10002FFFC((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_100031B14();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100030040(v12, a3 & 1);
  unint64_t v17 = sub_10002FFFC((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_100031CBC(0, &qword_10005A828);
    sub_1000402F0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

uint64_t sub_100030488()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000304D0(void *a1, void *a2, char a3)
{
  if (a3)
  {
    uint64_t v13 = v3[2];
    swift_errorRetain();
    sub_10003FFC0();
    uint64_t v14 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_100042B30;
    *(void *)(v15 + 56) = sub_100031CBC(0, &qword_10005A788);
    *(void *)(v15 + 64) = sub_100031900(&qword_10005A790, &qword_10005A788);
    *(void *)(v15 + 32) = a1;
    sub_100031950(a2, 1);
    id v16 = v14;
    id v17 = a1;
    sub_100015700(&qword_100059E40);
    uint64_t v18 = sub_10003FEC0();
    uint64_t v20 = v19;
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = sub_100016C7C();
    *(void *)(v15 + 72) = v18;
    *(void *)(v15 + 80) = v20;
    sub_10003FD80();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    *(void *)(v13 + 16) = a2;
    swift_errorRelease();
    return;
  }
  uint64_t v6 = v3[3];
  uint64_t v5 = v3[4];
  id v7 = a2;
  sub_10003FFC0();
  char v8 = (void *)*sub_10001E29C();
  sub_100015700(&qword_100059C40);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100042B20;
  *(void *)(v9 + 56) = sub_100031CBC(0, &qword_10005A638);
  *(void *)(v9 + 64) = sub_100031900(&qword_10005A798, &qword_10005A638);
  *(void *)(v9 + 32) = v7;
  sub_100031950(a2, 0);
  id v10 = v8;
  sub_10003FD80();
  swift_bridgeObjectRelease();

  if (sub_100040070() == 0xD00000000000001DLL && v11 == 0x80000001000472E0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v22 = (id *)(v6 + 16);
LABEL_8:
    swift_beginAccess();
    id v23 = *v22;
    id v24 = *v22;
    id v25 = sub_10002B814(v7, v23);
    sub_10003195C(a2, 0);
    sub_10003195C(a2, 0);

    swift_beginAccess();
    id v26 = *v22;
    id *v22 = v25;

    return;
  }
  char v21 = sub_1000402D0();
  swift_bridgeObjectRelease();
  if (v21) {
    goto LABEL_7;
  }
  if (sub_100040070() == 0xD000000000000013 && v27 == 0x8000000100047300)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = (id *)(v5 + 16);
    goto LABEL_8;
  }
  char v28 = sub_1000402D0();
  swift_bridgeObjectRelease();
  if (v28)
  {
    uint64_t v22 = (id *)(v5 + 16);
    goto LABEL_8;
  }
  sub_10003195C(a2, 0);

  sub_10003195C(a2, 0);
}

uint64_t sub_1000308AC(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_10003123C(a1, a2, a3, a4, a5);
}

uint64_t sub_1000308E8()
{
  return _swift_deallocObject(v0, 17, 7);
}

id *sub_1000308F8(id *a1)
{
  id v2 = *a1;
  return a1;
}

unint64_t sub_100030924()
{
  unint64_t result = qword_10005A680;
  if (!qword_10005A680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A680);
  }
  return result;
}

uint64_t sub_100030978()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000309C0(void *a1, void *a2, char a3)
{
  uint64_t v5 = (uint64_t *)(v3[2] + 16);
  if (a3)
  {
    swift_errorRetain();
    sub_10003FFC0();
    uint64_t v14 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_100042B30;
    *(void *)(v15 + 56) = sub_100031CBC(0, &qword_10005A788);
    *(void *)(v15 + 64) = sub_100031900(&qword_10005A790, &qword_10005A788);
    *(void *)(v15 + 32) = a1;
    *(void *)&long long v61 = a2;
    sub_100031950(a2, 1);
    id v16 = v14;
    id v17 = a1;
    sub_100015700(&qword_100059E40);
    uint64_t v18 = sub_10003FEC0();
    uint64_t v20 = v19;
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = sub_100016C7C();
    *(void *)(v15 + 72) = v18;
    *(void *)(v15 + 80) = v20;
    sub_10003FD80();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    uint64_t *v5 = (uint64_t)a2;
LABEL_31:
    swift_errorRelease();
    return;
  }
  uint64_t v6 = v3[3];
  uint64_t v52 = (void (*)(long long *))v3[4];
  id v7 = a2;
  sub_10003FFC0();
  char v8 = (void *)*sub_10001E29C();
  sub_100015700(&qword_100059C40);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100042B20;
  uint64_t v53 = sub_100031CBC(0, &qword_10005A638);
  *(void *)(v9 + 56) = v53;
  uint64_t v10 = sub_100031900(&qword_10005A798, &qword_10005A638);
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = v7;
  sub_100031950(a2, 0);
  id v11 = v8;
  sub_10003FD80();
  swift_bridgeObjectRelease();

  if (sub_100040070() == 0xD000000000000019 && v12 == 0x8000000100046FE0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_beginAccess();
    *(unsigned char *)(v6 + 16) = 1;
    uint64_t v22 = sub_100040080();
    if (v22
      && (*(void *)&long long v61 = v22, sub_100015700(&qword_10005A808), (swift_dynamicCast() & 1) != 0)
      && (uint64_t v23 = *(void *)&v58[0], (v24 = sub_100040080()) != 0)
      && (*(void *)&v58[0] = v24, (swift_dynamicCast() & 1) != 0))
    {
      long long v25 = v61;
      uint64_t v26 = sub_100040080();
      if (v26 && (*(void *)&long long v61 = v26, (swift_dynamicCast() & 1) != 0))
      {
        uint64_t v27 = *(void *)&v58[0];
        uint64_t v28 = sub_100040080();
        if (v28)
        {
          *(void *)&v58[0] = v28;
          if (swift_dynamicCast())
          {
            uint64_t v29 = sub_100040080();
            if (v29)
            {
              *(void *)&v58[0] = v29;
              int v30 = swift_dynamicCast();
              if (v30) {
                uint64_t v31 = v61;
              }
              else {
                uint64_t v31 = 0;
              }
              if (v30) {
                uint64_t v32 = *((void *)&v61 + 1);
              }
              else {
                uint64_t v32 = 0;
              }
            }
            else
            {
              uint64_t v31 = 0;
              uint64_t v32 = 0;
            }
            sub_10003A074(v23, v25, *((uint64_t *)&v61 + 1), v27, v61, *((uint64_t *)&v61 + 1), v31, v32, &v61);
            long long v39 = v61;
            long long v40 = v62;
            uint64_t v38 = *((void *)&v63 + 1);
            uint64_t v37 = v63;
            long long v41 = v64;
            goto LABEL_28;
          }
        }
        sub_10003FFB0();
        uint64_t v48 = (void *)*sub_10001E29C();
        sub_100015700(&qword_100059C40);
        uint64_t v49 = swift_allocObject();
        *(_OWORD *)(v49 + 16) = xmmword_100042B20;
        *(void *)(v49 + 56) = v53;
        *(void *)(v49 + 64) = v10;
        *(void *)(v49 + 32) = v7;
        id v50 = v48;
        id v51 = v7;
        sub_10003FD80();

        swift_bridgeObjectRelease();
        sub_100012D88(v25, *((unint64_t *)&v25 + 1));
      }
      else
      {
        sub_10003FFB0();
        uint64_t v44 = (void *)*sub_10001E29C();
        sub_100015700(&qword_100059C40);
        uint64_t v45 = swift_allocObject();
        *(_OWORD *)(v45 + 16) = xmmword_100042B20;
        *(void *)(v45 + 56) = v53;
        *(void *)(v45 + 64) = v10;
        *(void *)(v45 + 32) = v7;
        id v46 = v7;
        id v47 = v44;
        sub_10003FD80();

        swift_bridgeObjectRelease();
        sub_100012D88(v25, *((unint64_t *)&v25 + 1));
      }
    }
    else
    {
      sub_10003FFB0();
      id v33 = (void *)*sub_10001E29C();
      sub_100015700(&qword_100059C40);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_100042B20;
      *(void *)(v34 + 56) = v53;
      *(void *)(v34 + 64) = v10;
      *(void *)(v34 + 32) = v7;
      id v35 = v7;
      id v36 = v33;
      sub_10003FD80();

      swift_bridgeObjectRelease();
    }
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
LABEL_28:
    v54[0] = v39;
    v54[1] = v40;
    uint64_t v55 = v37;
    uint64_t v56 = v38;
    long long v57 = v41;
    sub_10003195C(a2, 0);
    sub_100031CF8((uint64_t)v54, (uint64_t)v58, &qword_10005A7A0);
    if (*((void *)&v59 + 1))
    {
      long long v61 = v58[0];
      long long v62 = v58[1];
      long long v63 = v59;
      long long v64 = v60;
      v52(&v61);
      sub_10003195C(a2, 0);
      sub_100031968((uint64_t)v54);
      return;
    }
    sub_100030924();
    uint64_t v42 = swift_allocError();
    unsigned char *v43 = 2;
    sub_10003195C(a2, 0);
    swift_beginAccess();
    uint64_t *v5 = v42;
    goto LABEL_31;
  }
  char v21 = sub_1000402D0();
  swift_bridgeObjectRelease();
  if (v21) {
    goto LABEL_7;
  }
  sub_10003195C(a2, 0);

  sub_10003195C(a2, 0);
}

uint64_t sub_1000311C0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031200(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_10003123C(a1, a2, a3, a4, a5);
}

uint64_t sub_10003123C(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a5 & 0x100) == 0)
  {
    uint64_t v7 = *(void *)(v5 + 16);
    id v8 = a2;
    sub_10003FFA0();
    uint64_t v9 = (void *)*sub_10001E29C();
    sub_100015700(&qword_100059C40);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100042B20;
    id v11 = v9;
    id v12 = [v8 data];
    uint64_t v13 = sub_10003FC30();
    unint64_t v15 = v14;

    uint64_t v16 = sub_10003FC20(0);
    uint64_t v18 = v17;
    sub_100012D88(v13, v15);
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_100016C7C();
    *(void *)(v10 + 32) = v16;
    *(void *)(v10 + 40) = v18;
    sub_10003FD80();
    swift_bridgeObjectRelease();

    id v19 = [v8 data];
    uint64_t v20 = sub_10003FC30();
    uint64_t v22 = v21;

    swift_beginAccess();
    uint64_t v23 = *(void *)(v7 + 16);
    unint64_t v24 = *(void *)(v7 + 24);
    *(void *)(v7 + 16) = v20;
    *(void *)(v7 + 24) = v22;
    return sub_100013318(v23, v24);
  }
  uint64_t v38 = (uint64_t *)(*(void *)(v5 + 24) + 16);
  swift_errorRetain();
  sub_10003FFB0();
  uint64_t v29 = (void *)*sub_10001E29C();
  sub_100015700(&qword_100059C40);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100042B20;
  sub_1000317F0(a2, a3, a4, a5, 1);
  id v31 = v29;
  sub_100015700(&qword_100059E40);
  uint64_t v37 = a3;
  uint64_t v32 = sub_10003FEC0();
  uint64_t v34 = v33;
  *(void *)(v30 + 56) = &type metadata for String;
  *(void *)(v30 + 64) = sub_100016C7C();
  *(void *)(v30 + 32) = v32;
  *(void *)(v30 + 40) = v34;
  sub_10003FD80();
  swift_bridgeObjectRelease();

  swift_errorRetain();
  type metadata accessor for CKError(0);
  if (!swift_dynamicCast())
  {
    id v35 = v38;
LABEL_8:
    swift_beginAccess();
    uint64_t *v35 = (uint64_t)a2;
    return swift_errorRelease();
  }
  sub_100031E88(&qword_10005A778, type metadata accessor for CKError);
  sub_10003FA90();
  id v35 = v38;
  if (a2 != (void *)21)
  {

    goto LABEL_8;
  }
  sub_100031858();
  uint64_t v36 = swift_allocError();
  sub_1000318AC((void *)0x15, v37, a4, a5, 1);

  swift_beginAccess();
  *uint64_t v38 = v36;
  return swift_errorRelease();
}

unint64_t sub_1000315E4()
{
  unint64_t result = qword_10005A688;
  if (!qword_10005A688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A688);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CloudKitError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CloudKitError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    id *result = a2 + 3;
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
        JUMPOUT(0x100031794);
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
          id *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitError()
{
  return &type metadata for CloudKitError;
}

uint64_t type metadata accessor for CloudKitOperations()
{
  return self;
}

uint64_t sub_1000317F0(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    return swift_errorRetain();
  }
  else
  {
    id v9 = a1;
    return sub_100012DE0(a2, a3);
  }
}

void type metadata accessor for CKError(uint64_t a1)
{
}

unint64_t sub_100031858()
{
  unint64_t result = qword_10005A780;
  if (!qword_10005A780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A780);
  }
  return result;
}

uint64_t sub_1000318AC(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    return swift_errorRelease();
  }
  else
  {

    return sub_100013318(a2, a3);
  }
}

uint64_t sub_100031900(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100031CBC(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100031950(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_10003195C(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_100031968(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000319A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    sub_100012D88(a2, a3);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1000319F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100031CBC(0, &qword_10005A828);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1000400A0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1000400A0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_100031B14()
{
  uint64_t v1 = v0;
  sub_100015700(&qword_10005A830);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000401D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100031CBC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100031CF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100015700(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100031D5C()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255) {
    sub_10003195C(*(void **)(v0 + 16), v1 & 1);
  }

  return _swift_deallocObject(v0, 25, 7);
}

id sub_100031DA4(uint64_t a1, void *a2, char a3)
{
  swift_beginAccess();
  uint64_t v6 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a2;
  unsigned __int8 v7 = *(unsigned char *)(v3 + 24);
  a3 &= 1u;
  *(unsigned char *)(v3 + 24) = a3;
  sub_100031E28(v6, v7);
  return sub_100031950(a2, a3);
}

id sub_100031E10(id result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_100031950(result, a2 & 1);
  }
  return result;
}

void sub_100031E28(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_10003195C(a1, a2 & 1);
  }
}

uint64_t sub_100031E40()
{
  return sub_100031E88(&qword_10005A858, type metadata accessor for CKError);
}

uint64_t sub_100031E88(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100031ED0()
{
  return sub_100031E88(&qword_10005A860, type metadata accessor for CKError);
}

uint64_t sub_100031F18()
{
  return sub_100031E88(&qword_10005A868, type metadata accessor for CKError);
}

uint64_t sub_100031F60()
{
  return sub_100031E88(&qword_10005A870, type metadata accessor for CKError);
}

uint64_t sub_100031FA8()
{
  return sub_100031E88(&qword_10005A878, type metadata accessor for CKError);
}

uint64_t sub_100031FF0()
{
  return sub_100031E88(&qword_10005A880, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_10003204C()
{
  return sub_100031E88(&qword_10005A888, type metadata accessor for Code);
}

unint64_t sub_100032098()
{
  unint64_t result = qword_10005A890;
  if (!qword_10005A890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A890);
  }
  return result;
}

uint64_t sub_1000320EC()
{
  return sub_100031E88(&qword_10005A898, type metadata accessor for Code);
}

uint64_t sub_100032134()
{
  return sub_100031E88(&qword_10005A778, type metadata accessor for CKError);
}

uint64_t sub_10003217C()
{
  uint64_t v0 = sub_10003FAF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100015700(&qword_10005A810);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FBA0();
  sub_100018728(v7, qword_10005D6D8);
  sub_100018048(v7, (uint64_t)qword_10005D6D8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  return sub_10003FB80();
}

void sub_10003231C()
{
  qword_10005D6F0 = 0x6C69666D6F6F6C62;
  *(void *)algn_10005D6F8 = 0xEF6E69622E726574;
}

uint64_t sub_10003234C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess();
  uint64_t v4 = sub_10003FBA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1000323D0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess();
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_10003245C())()
{
  return j_j__swift_endAccess;
}

id sub_1000324B8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_100032510(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_100032564())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000325C0()
{
  return swift_retain();
}

uint64_t sub_10003260C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_100032660())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000326BC@<X0>(uint64_t a1@<X8>)
{
  return sub_100032750(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, a1);
}

uint64_t sub_1000326C8(uint64_t a1)
{
  return sub_1000327C0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, (void (*)(uint64_t, uint64_t))sub_100027EAC);
}

uint64_t (*sub_1000326E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100032744@<X0>(uint64_t a1@<X8>)
{
  return sub_100032750(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, a1);
}

uint64_t sub_100032750@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_10003718C(v4, a2);
}

uint64_t sub_1000327A0(uint64_t a1)
{
  return sub_1000327C0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, (void (*)(uint64_t, uint64_t))sub_100027EAC);
}

uint64_t sub_1000327C0(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  sub_100015838(v6);
  a3(a1, v6);
  return swift_endAccess();
}

uint64_t (*sub_100032830())()
{
  return j__swift_endAccess;
}

uint64_t sub_10003288C@<X0>(uint64_t a1@<X8>)
{
  return sub_100032750(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, a1);
}

uint64_t sub_100032898(uint64_t a1)
{
  return sub_1000327C0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, (void (*)(uint64_t, uint64_t))sub_100027EAC);
}

uint64_t (*sub_1000328B8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100032914(void *a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v26 = a2;
  id v24 = a1;
  uint64_t v5 = sub_10003FAF0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003FBA0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v25[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005D290 != -1) {
    swift_once();
  }
  sub_100018048(v9, (uint64_t)qword_10005D6D8);
  v25[0] = 0xD000000000000011;
  v25[1] = 0x80000001000474D0;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for URL.DirectoryHint.inferFromPath(_:), v5);
  sub_1000371F0();
  sub_10003FB90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v13 = [self defaultManager];
  sub_10003FB60();
  NSString v14 = sub_10003FE70();
  swift_bridgeObjectRelease();
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  if (!v15)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v19 = 0;
LABEL_7:
    uint64_t v20 = v26;
    sub_10003718C(v26, (uint64_t)v25);
    uint64_t v16 = (*(uint64_t (**)(id, uint64_t, void *))(v4 + 272))(v24, v19, v25);
    sub_100015838(v20);
    return v16;
  }
  sub_10003FA10();
  swift_allocObject();
  uint64_t v16 = sub_10003FA00();
  uint64_t v17 = sub_10003FBC0();
  if (!v3)
  {
    uint64_t v21 = v17;
    unint64_t v22 = v18;
    type metadata accessor for BloomFilter();
    sub_1000374F8(&qword_10005A918);
    sub_10003F9F0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    sub_100012D88(v21, v22);
    swift_release();
    uint64_t v19 = v25[0];
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  swift_release();
  sub_100015838(v26);
  return v16;
}

uint64_t sub_100032D04(void *a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  uint64_t v6 = sub_100037244(a1, a2, a3);

  swift_release();
  return v6;
}

uint64_t sub_100032D6C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = sub_100015700(&qword_10005A5C0);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v57 = a3;
  __srCC_SHA256_CTX c = bswap32(a3);
  uint64_t v60 = sub_10001429C(&__src, &v60);
  uint64_t v61 = v14 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v15 = a1;
  unint64_t v58 = a2;
  uint64_t v16 = sub_10003FC50();
  uint64_t v17 = v60;
  unint64_t v18 = v61;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 176))(v16);
  if (v19)
  {
    uint64_t v56 = a4;
    char v20 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v19 + 168))(v17, v18);
    if (v5)
    {
      swift_release();
      return sub_100012D88(v17, v18);
    }
    else
    {
      unint64_t v54 = v18;
      uint64_t v55 = 0;
      uint64_t v53 = v17;
      if (sub_1000222D8(v20 & 1, 1))
      {
        sub_10003FFC0();
        id v24 = (void *)*sub_10001E35C();
        sub_100015700(&qword_100059C40);
        uint64_t v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = xmmword_100042B30;
        *(void *)(v25 + 56) = &type metadata for UInt32;
        *(void *)(v25 + 64) = &protocol witness table for UInt32;
        *(_DWORD *)(v25 + 32) = v57;
        id v26 = v24;
        uint64_t v27 = sub_100015458(v15, v58);
        uint64_t v29 = v28;
        *(void *)(v25 + 96) = &type metadata for String;
        *(void *)(v25 + 104) = sub_100016C7C();
        *(void *)(v25 + 72) = v27;
        *(void *)(v25 + 80) = v29;
        sub_10003FD80();
        swift_release();
        sub_100012D88(v53, v54);

        swift_bridgeObjectRelease();
        uint64_t v30 = type metadata accessor for LaunchWarningDetails();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v56, 1, 1, v30);
      }
      else
      {
        (*(void (**)(uint64_t *__return_ptr))(*(void *)v6 + 200))(&v60);
        uint64_t v31 = v62;
        uint64_t v32 = v63;
        sub_1000157F4(&v60, v62);
        uint64_t v33 = v15;
        uint64_t v34 = v15;
        unsigned int v35 = v57;
        uint64_t v36 = v55;
        (*(void (**)(uint64_t, unint64_t, void, uint64_t, uint64_t))(v32 + 8))(v34, v58, v57, v31, v32);
        if (v36)
        {
          swift_release();
          sub_100012D88(v53, v54);
          return sub_100015838((uint64_t)&v60);
        }
        else
        {
          uint64_t v55 = 0;
          uint64_t v37 = type metadata accessor for LaunchWarningDetails();
          uint64_t v38 = *(void *)(v37 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v13, 1, v37) == 1)
          {
            sub_100027738((uint64_t)v13, &qword_10005A5C0);
            sub_100015838((uint64_t)&v60);
            sub_10003FFC0();
            long long v39 = (void *)*sub_10001E35C();
            sub_100015700(&qword_100059C40);
            uint64_t v40 = swift_allocObject();
            *(_OWORD *)(v40 + 16) = xmmword_100042B30;
            *(void *)(v40 + 56) = &type metadata for UInt32;
            *(void *)(v40 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v40 + 32) = v35;
            id v41 = v39;
            uint64_t v42 = sub_100015458(v33, v58);
            uint64_t v44 = v43;
            *(void *)(v40 + 96) = &type metadata for String;
            *(void *)(v40 + 104) = sub_100016C7C();
            *(void *)(v40 + 72) = v42;
            *(void *)(v40 + 80) = v44;
            sub_10003FD80();
            swift_release();
            sub_100012D88(v53, v54);

            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v56, 1, 1, v37);
          }
          else
          {
            uint64_t v45 = v56;
            sub_100037420((uint64_t)v13, v56, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
            sub_100015838((uint64_t)&v60);
            v52[1] = sub_10003FFC0();
            id v46 = (void *)*sub_10001E35C();
            sub_100015700(&qword_100059C40);
            uint64_t v47 = swift_allocObject();
            *(_OWORD *)(v47 + 16) = xmmword_100042B30;
            *(void *)(v47 + 56) = &type metadata for UInt32;
            *(void *)(v47 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v47 + 32) = v35;
            id v48 = v46;
            uint64_t v49 = sub_100015458(v33, v58);
            uint64_t v51 = v50;
            *(void *)(v47 + 96) = &type metadata for String;
            *(void *)(v47 + 104) = sub_100016C7C();
            *(void *)(v47 + 72) = v49;
            *(void *)(v47 + 80) = v51;
            sub_10003FD80();
            swift_release();
            sub_100012D88(v53, v54);

            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v45, 0, 1, v37);
          }
        }
      }
    }
  }
  else
  {
    sub_10003FFB0();
    id v22 = (id)*sub_10001E35C();
    sub_10003FD80();
    sub_100012D88(v17, v18);

    uint64_t v23 = type metadata accessor for LaunchWarningDetails();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a4, 1, 1, v23);
  }
}

uint64_t sub_1000333E4()
{
  void (*v44)(id *__return_ptr);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  int *v55;
  int v56;
  int v57;
  char *v58;
  void *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_log_type_t v74;
  NSObject *v75;
  NSObject *v76;
  uint8_t *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  id v81;
  void *v82;
  void *v83;
  unsigned int v84;
  id v85;
  void (**v86)(void);
  char *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(void);
  char *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  void *v107;
  uint64_t v108;
  unint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  os_log_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  void (*v132)(char *, uint64_t);
  os_log_t v133;
  os_log_type_t v134;
  NSObject *v135;
  uint64_t v136;
  uint8_t *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  os_log_t v141;
  id v142;
  char *v143;
  uint64_t v144;
  id v145;
  NSURL *v146;
  void *v147;
  void *v148;
  NSURL *v149;
  void *v150;
  void *v151;
  unsigned int v152;
  id v153;
  uint64_t v154;
  os_log_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  id v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  id v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  id v185;
  void (*v186)(uint64_t, uint64_t);
  uint64_t v187;
  uint64_t v188;
  int *v189;
  os_log_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  unint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  char *v216;
  char *v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t);
  uint64_t v225;
  uint64_t v226;
  uint64_t (*v227)(void);
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  char *v238;
  void (*v239)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v240;
  void (*v241)(char *, uint64_t);
  uint64_t v242;
  void (*v243)(char *, uint64_t);
  unint64_t v244;
  void (*v245)(char *, void, uint64_t);
  unsigned int v246;
  uint64_t v247;
  void (**v248)(void);
  void (*v249)(void);
  uint64_t *v250;
  char *v251;
  uint64_t *v252;
  unint64_t v253;
  long long v254;
  uint64_t v255;
  uint64_t v256;
  void (*v257)(char *, uint64_t);
  os_log_t v258;
  char *v259;
  char *v260;
  uint64_t v261;
  char *v262;
  uint64_t *v263;
  char *v264;
  uint64_t v265;
  uint64_t v266;
  char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  char *v278;
  char *v279;
  char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void (*v285)(id *__return_ptr);
  uint64_t v286;
  uint64_t v287;
  int *v288;
  uint64_t v289;
  uint64_t (*v290)(void);
  uint64_t v291;
  os_log_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  id v296;
  unint64_t v297;
  uint64_t v298;
  uint64_t v299;

  uint64_t v1 = v0;
  uint64_t v2 = sub_100015700(&qword_10005A640);
  __chkstk_darwin(v2 - 8);
  v275 = (uint64_t)&v242 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v274 = type metadata accessor for DocumentCheckerRecord(0);
  v273 = *(void *)(v274 - 8);
  __chkstk_darwin(v274);
  v281 = (uint64_t)&v242 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v269 = sub_10003FD70();
  v268 = *(void *)(v269 - 8);
  __chkstk_darwin(v269);
  v264 = (char *)&v242 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100015700(&qword_10005A920);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  v267 = (char *)&v242 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v266 = (uint64_t)&v242 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v265 = (uint64_t)&v242 - v12;
  __chkstk_darwin(v11);
  v270 = (uint64_t)&v242 - v13;
  v282 = sub_10003FAF0();
  v277 = *(void *)(v282 - 8);
  __chkstk_darwin(v282);
  v280 = (char *)&v242 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10003FBA0();
  v286 = *(void *)(v15 - 8);
  v287 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  v271 = (char *)&v242 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  v260 = (char *)&v242 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v262 = (char *)&v242 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v279 = (char *)&v242 - v23;
  __chkstk_darwin(v22);
  v278 = (char *)&v242 - v24;
  uint64_t v25 = sub_100015700(&qword_10005A648);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v242 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v288 = (int *)type metadata accessor for BloomFilterRecord(0);
  v283 = *((void *)v288 - 1);
  __chkstk_darwin(v288);
  v276 = (char *)&v242 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v272 = type metadata accessor for BaseZoneSyncResult(0);
  uint64_t v29 = __chkstk_darwin(v272);
  uint64_t v31 = (char *)&v242 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v34 = (char *)&v242 - v33;
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v242 - v35;
  uint64_t v37 = swift_allocObject();
  v293 = v37;
  *(void *)(v37 + 16) = 0;
  v261 = v37 + 16;
  uint64_t v38 = swift_allocObject();
  v294 = v38;
  *(void *)(v38 + 16) = 0;
  v263 = (uint64_t *)(v38 + 16);
  long long v39 = *(uint64_t (**)(void))(*(void *)v0 + 152);
  v289 = *(void *)v0 + 152;
  v290 = v39;
  uint64_t v40 = (void *)v39();
  id v41 = sub_10001C6F0();
  unint64_t v43 = v42;

  uint64_t v44 = *(void (**)(id *__return_ptr))(*(void *)v1 + 200);
  uint64_t v45 = *(void *)v1 + 200;
  v291 = v1;
  v284 = v45;
  v285 = v44;
  v44(&v296);
  id v46 = v298;
  uint64_t v47 = v299;
  sub_1000157F4(&v296, v298);
  id v48 = v292;
  (*(void (**)(id, unint64_t, uint64_t, uint64_t))(v47 + 16))(v41, v43, v46, v47);
  if (v48)
  {
    sub_100013318((uint64_t)v41, v43);
    sub_100015838((uint64_t)&v296);
    v295 = (uint64_t)v48;
    swift_errorRetain();
    sub_100015700(&qword_100059E40);
    if (!swift_dynamicCast())
    {
      swift_errorRelease();
      swift_release();
      return swift_release();
    }
    uint64_t v49 = swift_errorRelease();
    uint64_t v50 = v291;
    uint64_t v51 = (void *)((uint64_t (*)(uint64_t))v290)(v49);
    sub_10001C730();

    v285(&v296);
    uint64_t v52 = v298;
    uint64_t v53 = v299;
    sub_1000157F4(&v296, v298);
    (*(void (**)(void, unint64_t, uint64_t, uint64_t))(v53 + 16))(0, 0xF000000000000000, v52, v53);
    unint64_t v54 = 0;
    v258 = v48;
    sub_100037420((uint64_t)v31, (uint64_t)v36, type metadata accessor for BaseZoneSyncResult);
    sub_100015838((uint64_t)&v296);
    swift_errorRelease();
  }
  else
  {
    sub_100013318((uint64_t)v41, v43);
    sub_100037420((uint64_t)v34, (uint64_t)v36, type metadata accessor for BaseZoneSyncResult);
    sub_100015838((uint64_t)&v296);
    v258 = 0;
    unint64_t v54 = 0;
    uint64_t v50 = v291;
  }
  sub_100025678((uint64_t)v36, (uint64_t)v27, &qword_10005A648);
  uint64_t v55 = v288;
  uint64_t v56 = (*(uint64_t (**)(char *, uint64_t, int *))(v283 + 48))(v27, 1, v288);
  unsigned int v57 = v56;
  v259 = v36;
  if (v56 == 1)
  {
    sub_100027738((uint64_t)v27, &qword_10005A648);
    goto LABEL_17;
  }
  LODWORD(v283) = v56;
  v292 = 0;
  unint64_t v58 = v276;
  sub_100037420((uint64_t)v27, (uint64_t)v276, type metadata accessor for BloomFilterRecord);
  sub_10003FFC0();
  long long v59 = (void *)*sub_10001E29C();
  v255 = sub_100015700(&qword_100059C40);
  uint64_t v60 = swift_allocObject();
  v254 = xmmword_100042B20;
  *(_OWORD *)(v60 + 16) = xmmword_100042B20;
  uint64_t v61 = &v58[v55[9]];
  uint64_t v63 = *(void *)v61;
  uint64_t v62 = *((void *)v61 + 1);
  v252 = (uint64_t *)v61;
  *(void *)(v60 + 56) = &type metadata for String;
  v253 = sub_100016C7C();
  *(void *)(v60 + 64) = v253;
  *(void *)(v60 + 32) = v63;
  *(void *)(v60 + 40) = v62;
  long long v64 = v59;
  swift_bridgeObjectRetain();
  sub_10003FD80();

  uint64_t v65 = swift_bridgeObjectRelease();
  uint64_t v66 = v290;
  id v67 = (void *)((uint64_t (*)(uint64_t))v290)(v65);
  sub_10001C948();

  unint64_t v68 = (void *)v66();
  v251 = &v58[v55[7]];
  swift_bridgeObjectRetain();
  sub_10001CA4C();

  uint64_t v69 = swift_bridgeObjectRelease();
  id v70 = (void *)((uint64_t (*)(uint64_t))v66)(v69);
  v250 = (uint64_t *)&v58[v55[8]];
  swift_bridgeObjectRetain();
  sub_10001C7B4();

  id v71 = swift_bridgeObjectRelease();
  uint64_t v72 = (*(uint64_t (**)(uint64_t))(*(void *)v50 + 176))(v71);
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = sub_10003FFA0();
    uint64_t v75 = *sub_10001E35C();
    if (os_log_type_enabled(v75, v74))
    {
      swift_retain_n();
      uint64_t v76 = v75;
      uint64_t v77 = (uint8_t *)swift_slowAlloc();
      uint64_t v78 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v77 = 136315138;
      v296 = v78;
      unint64_t v79 = sub_10003FB60();
      v295 = sub_1000299D4(v79, v80, (uint64_t *)&v296);
      sub_1000400F0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v76, v74, "Removing old bloom filter: %s", v77, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    uint64_t v81 = [self defaultManager];
    sub_10003FB20(*(NSURL **)(v73 + 40));
    uint64_t v83 = v82;
    v296 = 0;
    uint64_t v84 = [v81 removeItemAtURL:v82 error:&v296];

    if (!v84)
    {
      v142 = v296;
      v143 = v58;
      sub_10003FAE0();

      swift_willThrow();
      swift_release();
LABEL_47:
      v112 = (uint64_t)v143;
      goto LABEL_48;
    }
    uint64_t v85 = v296;
    swift_release();
    uint64_t v50 = v291;
  }
  uint64_t v86 = (void (**)(void))(*(void *)v50 + 128);
  uint64_t v87 = v279;
  v249 = *v86;
  v248 = v86;
  v249();
  uint64_t v88 = v270;
  if (qword_10005D298 != -1) {
    swift_once();
  }
  v296 = (id)qword_10005D6F0;
  v297 = *(void *)algn_10005D6F8;
  id v89 = v277;
  v90 = *(void (**)(void))(v277 + 104);
  uint64_t v91 = v280;
  v246 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v92 = v282;
  v247 = v277 + 104;
  v245 = (void (*)(char *, void, uint64_t))v90;
  v90(v280);
  uint64_t v93 = sub_1000371F0();
  swift_bridgeObjectRetain();
  os_log_t v94 = (uint64_t)v278;
  v244 = v93;
  sub_10003FB90();
  v243 = *(void (**)(char *, uint64_t))(v89 + 8);
  v243(v91, v92);
  swift_bridgeObjectRelease();
  uint64_t v95 = *(void (**)(char *, uint64_t))(v286 + 8);
  v96 = v87;
  uint64_t v97 = v287;
  v256 = v286 + 8;
  v257 = v95;
  v95(v96, v287);
  uint64_t v98 = v268;
  uint64_t v99 = v269;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v268 + 56))(v88, 1, 1, v269);
  v100 = (uint64_t *)&v58[v288[12]];
  uint64_t v101 = v100[1];
  if (v101)
  {
    uint64_t v102 = *v100;
    swift_bridgeObjectRetain();
    uint64_t v103 = v265;
    sub_10001E40C(v102, v101, v265);
    v104 = v88;
    sub_100027738(v88, &qword_10005A920);
    sub_100037590(v103, v88);
    uint64_t v105 = v266;
    sub_100025678(v88, v266, &qword_10005A920);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48))(v105, 1, v99) == 1)
    {
      sub_100027738(v105, &qword_10005A920);
      sub_10003FFB0();
      v106 = v58;
      v107 = (void *)*sub_10001E35C();
      id v108 = swift_allocObject();
      *(_OWORD *)(v108 + 16) = v254;
      v109 = v253;
      *(void *)(v108 + 56) = &type metadata for String;
      *(void *)(v108 + 64) = v109;
      *(void *)(v108 + 32) = v102;
      *(void *)(v108 + 40) = v101;
      swift_bridgeObjectRetain();
      v110 = v107;
      sub_10003FD80();

      swift_bridgeObjectRelease();
      sub_10003753C();
      swift_allocError();
      *(void *)uint64_t v111 = v102;
      *(void *)(v111 + 8) = v101;
      *(unsigned char *)(v111 + 16) = 1;
      swift_willThrow();
      sub_100027738(v104, &qword_10005A920);
      v257(v278, v287);
      v112 = (uint64_t)v106;
LABEL_48:
      sub_100038D90(v112, type metadata accessor for BloomFilterRecord);
      sub_100038D90((uint64_t)v259, type metadata accessor for BaseZoneSyncResult);
      swift_release();
      return swift_release();
    }
    swift_bridgeObjectRelease();
    sub_100027738(v105, &qword_10005A920);
    uint64_t v97 = v287;
    os_log_t v94 = (uint64_t)v278;
  }
  v144 = (uint64_t)v267;
  sub_100025678(v88, (uint64_t)v267, &qword_10005A920);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48))(v144, 1, v99) != 1)
  {
    v154 = (uint64_t)v264;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 32))(v264, v144, v99);
    v155 = v292;
    sub_10001E5A4(v58, v94, v154);
    if (v155)
    {
      sub_10003FFB0();
      v156 = (void *)*sub_10001E35C();
      v157 = swift_allocObject();
      *(_OWORD *)(v157 + 16) = v254;
      v158 = v88;
      v159 = *v252;
      v160 = v252[1];
      v161 = v253;
      *(void *)(v157 + 56) = &type metadata for String;
      *(void *)(v157 + 64) = v161;
      *(void *)(v157 + 32) = v159;
      *(void *)(v157 + 40) = v160;
      v162 = v156;
      v163 = v98;
      v164 = v162;
      swift_bridgeObjectRetain();
      sub_10003FD80();

      swift_bridgeObjectRelease();
      sub_10003753C();
      swift_allocError();
      *(void *)v165 = 0;
      *(void *)(v165 + 8) = 0;
      *(unsigned char *)(v165 + 16) = 2;
      swift_willThrow();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v163 + 8))(v264, v99);
      sub_100027738(v158, &qword_10005A920);
      v257((char *)v94, v287);
      sub_100038D90((uint64_t)v276, type metadata accessor for BloomFilterRecord);
LABEL_51:
      sub_100038D90((uint64_t)v259, type metadata accessor for BaseZoneSyncResult);
      swift_release();
      return swift_release();
    }
    v292 = 0;
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v154, v99);
    goto LABEL_44;
  }
  sub_100027738(v144, &qword_10005A920);
  v145 = [self defaultManager];
  sub_10003FB20(v146);
  v148 = v147;
  sub_10003FB20(v149);
  v151 = v150;
  v296 = 0;
  v152 = [v145 copyItemAtURL:v148 toURL:v150 error:&v296];

  if (!v152)
  {
    v185 = v296;
    v143 = v58;
    sub_10003FAE0();

    swift_willThrow();
    sub_100027738(v270, &qword_10005A920);
    v257((char *)v94, v97);
    goto LABEL_47;
  }
  v153 = v296;
  uint64_t v88 = v270;
LABEL_44:
  v186 = (void (*)(uint64_t, uint64_t))v257;
  type metadata accessor for BloomFilterDiskStorage();
  v187 = (uint64_t)v262;
  (*(void (**)(char *, uint64_t, uint64_t))(v286 + 16))(v262, v94, v97);
  v188 = v97;
  v189 = v288;
  v190 = v292;
  v191 = sub_10001FFE8(v187, *(void *)&v58[v288[6]]);
  v143 = v58;
  if (v190)
  {
    sub_100027738(v88, &qword_10005A920);
    v186(v94, v188);
    goto LABEL_47;
  }
  v192 = v191;
  v292 = (os_log_t)type metadata accessor for BloomFilter();
  v193 = (uint64_t *)&v58[v189[5]];
  v194 = *v193;
  v195 = v193[1];
  v196 = v189[11];
  v197 = (uint64_t *)&v58[v189[10]];
  v198 = *v197;
  v199 = v197[1];
  v269 = *(void *)&v58[v196];
  v200 = v252[1];
  v288 = (int *)*v252;
  swift_retain();
  sub_100012C88(v194, v195);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v216 = (char *)sub_1000222E8(v192, v194, v195, v198, v199, v269, (uint64_t)v288, v200);
  v288 = (int *)v192;
  v217 = v279;
  v218 = v291;
  v249();
  v296 = (id)0xD000000000000011;
  v297 = 0x80000001000474D0;
  v219 = v280;
  v220 = v282;
  v245(v280, v246, v282);
  sub_10003FB90();
  v243(v219, v220);
  swift_bridgeObjectRelease();
  v257(v217, v287);
  sub_10003FA40();
  swift_allocObject();
  sub_10003FA30();
  v296 = v216;
  sub_1000374F8(&qword_10005A930);
  v221 = sub_10003FA20();
  v222 = v260;
  v269 = v223;
  sub_10003FC40();
  v224 = *(uint64_t (**)(uint64_t))(*(void *)v218 + 184);
  v225 = swift_retain();
  v226 = v224(v225);
  v227 = v290;
  v228 = (void *)((uint64_t (*)(uint64_t))v290)(v226);
  v229 = *((void *)v251 + 1);
  v268 = *(void *)v251;
  v292 = 0;
  v230 = v229;
  swift_bridgeObjectRetain();
  sub_10001CA4C();

  v231 = swift_bridgeObjectRelease();
  v232 = (void *)((uint64_t (*)(uint64_t))v227)(v231);
  v266 = *v250;
  v267 = v216;
  v233 = v250[1];
  swift_bridgeObjectRetain();
  sub_10001C7B4();

  v234 = swift_bridgeObjectRelease();
  v235 = (void *)((uint64_t (*)(uint64_t))v227)(v234);
  sub_10001C948();

  v285(&v296);
  v237 = v298;
  v236 = v299;
  sub_1000157F4(&v296, v298);
  v238 = v222;
  v239 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v236 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v239(v266, v233, v268, v230, v237, v236);
  uint64_t v50 = v291;
  unint64_t v54 = v292;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100012D88(v221, v269);
  swift_release();
  swift_release();
  swift_release();
  v240 = v287;
  v241 = v257;
  v257(v238, v287);
  sub_100027738(v270, &qword_10005A920);
  v241(v278, v240);
  sub_100038D90((uint64_t)v276, type metadata accessor for BloomFilterRecord);
  sub_100015838((uint64_t)&v296);
  uint64_t v36 = v259;
  unsigned int v57 = v283;
LABEL_17:
  v113 = v282;
  v114 = v272;
  v292 = v54;
  v115 = &v36[*(int *)(v272 + 24)];
  v116 = *((void *)v115 + 1);
  if (v116 >> 60 != 15)
  {
    v117 = *(void *)v115;
    v118 = sub_100012C88(*(void *)v115, *((void *)v115 + 1));
    v119 = (void *)((uint64_t (*)(uint64_t))v290)(v118);
    sub_10001C710();

    sub_100013318(v117, v116);
  }
  id v120 = v275;
  sub_100025678((uint64_t)&v36[*(int *)(v114 + 20)], v275, &qword_10005A640);
  id v121 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v273 + 48))(v120, 1, v274);
  id v122 = v286;
  if (v121 == 1)
  {
    long long v123 = sub_100027738(v120, &qword_10005A640);
    uint64_t v124 = 0;
    v125 = v292;
  }
  else
  {
    v126 = sub_100037420(v120, v281, type metadata accessor for DocumentCheckerRecord);
    id v127 = v279;
    (*(void (**)(uint64_t))(*(void *)v50 + 128))(v126);
    v296 = (id)0xD00000000000001FLL;
    v297 = 0x80000001000474B0;
    v128 = v277;
    v129 = v280;
    (*(void (**)(char *, void, uint64_t))(v277 + 104))(v280, enum case for URL.DirectoryHint.inferFromPath(_:), v113);
    sub_1000371F0();
    sub_10003FB90();
    (*(void (**)(char *, uint64_t))(v128 + 8))(v129, v113);
    swift_bridgeObjectRelease();
    v132 = *(void (**)(char *, uint64_t))(v122 + 8);
    v130 = v122 + 8;
    v131 = v132;
    v132(v127, v287);
    v133 = v292;
    sub_10001878C();
    v125 = v133;
    if (v133)
    {
      v134 = sub_10003FFB0();
      v135 = *sub_10001E35C();
      if (os_log_type_enabled(v135, v134))
      {
        swift_errorRetain();
        swift_errorRetain();
        v292 = v135;
        v136 = swift_slowAlloc();
        v286 = v130;
        v137 = (uint8_t *)v136;
        v138 = swift_slowAlloc();
        LODWORD(v283) = v57;
        v139 = (void *)v138;
        *(_DWORD *)v137 = 138412290;
        swift_errorRetain();
        v140 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v296 = v140;
        uint64_t v50 = v291;
        sub_1000400F0();
        *v139 = v140;
        swift_errorRelease();
        swift_errorRelease();
        v141 = v292;
        _os_log_impl((void *)&_mh_execute_header, v292, v134, "Failed to install document checker: %@", v137, 0xCu);
        sub_100015700(&qword_10005A928);
        swift_arrayDestroy();
        unsigned int v57 = v283;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      swift_errorRelease();
      uint64_t v124 = 0;
      v125 = 0;
    }
    else
    {
      uint64_t v124 = 256;
    }
    v131(v271, v287);
    long long v123 = sub_100038D90(v281, type metadata accessor for DocumentCheckerRecord);
    uint64_t v36 = v259;
  }
  v166 = (*(uint64_t (**)(uint64_t))(*(void *)v50 + 176))(v123);
  if (v166)
  {
    v167 = v166;
    LODWORD(v292) = v124;
    v168 = (uint64_t)v36;
    LODWORD(v283) = v57;
    v169 = (void *)swift_allocObject();
    v170 = v293;
    v169[2] = v294;
    v169[3] = v50;
    v169[4] = v167;
    v169[5] = v170;
    swift_retain();
    swift_retain();
    swift_retain();
    v171 = swift_retain();
    v172 = (void *)((uint64_t (*)(uint64_t))v290)(v171);
    v173 = sub_10001C7D0();
    v175 = v174;

    v285(&v296);
    v176 = v298;
    v177 = v299;
    sub_1000157F4(&v296, v298);
    (*(void (**)(uint64_t (*)(void *), void *, id, unint64_t, uint64_t, uint64_t))(v177 + 24))(sub_1000374D8, v169, v173, v175, v176, v177);
    if (v125)
    {
      sub_100013318((uint64_t)v173, v175);
      sub_100015838((uint64_t)&v296);
      v295 = (uint64_t)v125;
      swift_errorRetain();
      sub_100015700(&qword_100059E40);
      if (!swift_dynamicCast())
      {
        sub_100038D90(v168, type metadata accessor for BaseZoneSyncResult);
        swift_release();
        swift_release();
        swift_errorRelease();
        swift_release();
        return swift_release();
      }
      v180 = swift_errorRelease();
      v181 = (void *)((uint64_t (*)(uint64_t))v290)(v180);
      sub_10001C948();

      v285(&v296);
      v182 = v298;
      v183 = v299;
      sub_1000157F4(&v296, v298);
      (*(void (**)(uint64_t (*)(void *), void *, void, unint64_t, uint64_t, uint64_t))(v183 + 24))(sub_1000374D8, v169, 0, 0xF000000000000000, v182, v183);
      v202 = v201;
      v204 = v203;
      sub_100015838((uint64_t)&v296);
      swift_errorRelease();
    }
    else
    {
      v202 = v178;
      v204 = v179;
      sub_100013318((uint64_t)v173, v175);
      sub_100015838((uint64_t)&v296);
    }
    v205 = v263;
    swift_beginAccess();
    v206 = *v205;
    if (v206)
    {
      swift_errorRetain();
      LODWORD(v292) = sub_10003FFB0();
      v207 = (void *)*sub_10001E35C();
      sub_100015700(&qword_100059C40);
      v208 = swift_allocObject();
      *(_OWORD *)(v208 + 16) = xmmword_100042B20;
      v295 = v206;
      swift_errorRetain();
      v209 = v207;
      sub_100015700(&qword_100059E40);
      v210 = sub_10003FEC0();
      v212 = v211;
      *(void *)(v208 + 56) = &type metadata for String;
      *(void *)(v208 + 64) = sub_100016C7C();
      *(void *)(v208 + 32) = v210;
      *(void *)(v208 + 40) = v212;
      sub_10003FD80();

      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_release();
      swift_release();
      sub_100013318(v202, v204);
      goto LABEL_51;
    }
    if (v204 >> 60 == 15)
    {
      swift_release();
    }
    else
    {
      v213 = sub_100012DE0(v202, v204);
      v214 = (void *)((uint64_t (*)(uint64_t))v290)(v213);
      sub_10001C88C();

      swift_release();
      sub_100013318(v202, v204);
    }
    v215 = (uint64_t)v259;
    swift_release();
    sub_100013318(v202, v204);
    sub_100038D90(v215, type metadata accessor for BaseZoneSyncResult);
    swift_beginAccess();
    swift_release();
    swift_release();
    unsigned int v57 = v283;
    uint64_t v124 = (int)v292;
  }
  else
  {
    sub_100038D90((uint64_t)v36, type metadata accessor for BaseZoneSyncResult);
    swift_release();
    swift_release();
  }
  return v124 | (v57 != 1);
}

uint64_t sub_100035684(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v92 = a4;
  uint64_t v93 = a5;
  uint64_t v99 = a3;
  uint64_t v95 = a1;
  uint64_t v7 = sub_10003FD70();
  uint64_t v94 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100015700(&qword_10005A920);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v81 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v81 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v81 - v20;
  uint64_t result = swift_beginAccess();
  if (*(void *)(a2 + 16)) {
    return result;
  }
  uint64_t v84 = v19;
  uint64_t v85 = v16;
  uint64_t v86 = v13;
  uint64_t v82 = v9;
  uint64_t v89 = v7;
  uint64_t v83 = (uint64_t *)(a2 + 16);
  uint64_t v88 = v21;
  uint64_t v91 = v5;
  sub_10003FFC0();
  uint64_t v23 = (void *)*sub_10001E29C();
  uint64_t v24 = sub_100015700(&qword_100059C40);
  uint64_t v25 = swift_allocObject();
  long long v87 = xmmword_100042B30;
  *(_OWORD *)(v25 + 16) = xmmword_100042B30;
  uint64_t v26 = v95;
  uint64_t v27 = *v95;
  *(void *)(v25 + 56) = &type metadata for Int64;
  *(void *)(v25 + 64) = &protocol witness table for Int64;
  uint64_t v81 = v27;
  *(void *)(v25 + 32) = v27;
  v98[0] = *((_OWORD *)v26 + 2);
  *(void *)(v25 + 96) = &type metadata for String;
  unint64_t v90 = sub_100016C7C();
  *(void *)(v25 + 104) = v90;
  *(_OWORD *)(v25 + 72) = *((_OWORD *)v26 + 2);
  long long v28 = v98[0];
  id v29 = v23;
  sub_1000246A0((uint64_t)v98);
  sub_10003FD80();

  swift_bridgeObjectRelease();
  uint64_t v30 = *(uint64_t (**)(void))(*(void *)v99 + 176);
  uint64_t v31 = swift_bridgeObjectRetain();
  uint64_t v32 = ((uint64_t (*)(uint64_t))v30)(v31);
  if (!v32)
  {
    sub_1000246CC((uint64_t)v98);
    goto LABEL_10;
  }
  uint64_t v33 = v30;
  unint64_t v34 = *(void *)(v32 + 16);
  unint64_t v35 = *(void *)(v32 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  if (v28 != __PAIR128__(v35, v34))
  {
    char v36 = sub_1000402D0();
    swift_bridgeObjectRelease();
    sub_1000246CC((uint64_t)v98);
    uint64_t v30 = v33;
    if (v36) {
      goto LABEL_7;
    }
LABEL_10:
    sub_10003FFB0();
    unint64_t v54 = (void *)*sub_10001E35C();
    uint64_t v55 = swift_allocObject();
    unint64_t v56 = v90;
    *(void *)(v55 + 56) = &type metadata for String;
    *(void *)(v55 + 64) = v56;
    long long v57 = v98[0];
    *(_OWORD *)(v55 + 16) = v87;
    *(_OWORD *)(v55 + 32) = v57;
    sub_1000246A0((uint64_t)v98);
    id v58 = v54;
    uint64_t v59 = v30();
    if (v59)
    {
      uint64_t v61 = *(void *)(v59 + 16);
      uint64_t v60 = *(void *)(v59 + 24);
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      uint64_t v61 = 0;
      uint64_t v60 = 0;
    }
    uint64_t v96 = v61;
    uint64_t v97 = v60;
    sub_100015700(&qword_10005A4D0);
    uint64_t v62 = sub_10003FEC0();
    *(void *)(v55 + 96) = &type metadata for String;
    *(void *)(v55 + 104) = v56;
    *(void *)(v55 + 72) = v62;
    *(void *)(v55 + 80) = v63;
    sub_10003FD80();

    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_1000246CC((uint64_t)v98);
LABEL_7:
  uint64_t v37 = v94;
  uint64_t v38 = (uint64_t)v88;
  uint64_t v39 = v89;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v88, 1, 1, v89);
  uint64_t v40 = v26[7];
  uint64_t v41 = v91;
  if (v40)
  {
    uint64_t v42 = v26[6];
    swift_bridgeObjectRetain();
    uint64_t v43 = (uint64_t)v84;
    uint64_t v99 = v42;
    sub_10001E40C(v42, v40, (uint64_t)v84);
    sub_100027738(v38, &qword_10005A920);
    sub_100037590(v43, v38);
    uint64_t v44 = (uint64_t)v85;
    sub_100025678(v38, (uint64_t)v85, &qword_10005A920);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v44, 1, v39) == 1)
    {
      sub_100027738(v44, &qword_10005A920);
      sub_10003FFB0();
      uint64_t v45 = v38;
      id v46 = (void *)*sub_10001E35C();
      uint64_t v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = xmmword_100042B20;
      unint64_t v48 = v90;
      *(void *)(v47 + 56) = &type metadata for String;
      *(void *)(v47 + 64) = v48;
      uint64_t v49 = v99;
      *(void *)(v47 + 32) = v99;
      *(void *)(v47 + 40) = v40;
      swift_bridgeObjectRetain();
      id v50 = v46;
      sub_10003FD80();

      swift_bridgeObjectRelease();
      sub_10003753C();
      uint64_t v51 = swift_allocError();
      *(void *)uint64_t v52 = v49;
      *(void *)(v52 + 8) = v40;
      *(unsigned char *)(v52 + 16) = 1;
      sub_100027738(v45, &qword_10005A920);
      uint64_t v53 = v83;
      swift_beginAccess();
      *uint64_t v53 = v51;
      return swift_errorRelease();
    }
    swift_bridgeObjectRelease();
    sub_100027738(v44, &qword_10005A920);
    uint64_t v39 = v89;
  }
  uint64_t v99 = v24;
  uint64_t v65 = v26[1];
  unint64_t v64 = v26[2];
  uint64_t v66 = (uint64_t)v86;
  sub_100025678(v38, (uint64_t)v86, &qword_10005A920);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v66, 1, v39) == 1)
  {
    sub_100012C88(v65, v64);
    sub_100027738(v66, &qword_10005A920);
  }
  else
  {
    uint64_t v67 = (uint64_t)v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v82, v66, v39);
    sub_100012C88(v65, v64);
    uint64_t v68 = sub_10001ECC8(v65, v64, v67);
    if (v41)
    {
      swift_errorRelease();
      sub_10003FFB0();
      id v70 = (void *)*sub_10001E35C();
      uint64_t v71 = swift_allocObject();
      *(_OWORD *)(v71 + 16) = xmmword_100042B20;
      *(void *)(v71 + 56) = &type metadata for Int64;
      *(void *)(v71 + 64) = &protocol witness table for Int64;
      *(void *)(v71 + 32) = v81;
      id v72 = v70;
      sub_10003FD80();

      swift_bridgeObjectRelease();
      sub_10003753C();
      uint64_t v73 = swift_allocError();
      *(void *)uint64_t v74 = 0;
      *(void *)(v74 + 8) = 0;
      *(unsigned char *)(v74 + 16) = 2;
      sub_100012D88(v65, v64);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v67, v39);
      sub_100027738((uint64_t)v88, &qword_10005A920);
      uint64_t v75 = v83;
      swift_beginAccess();
      uint64_t *v75 = v73;
      return swift_errorRelease();
    }
    uint64_t v76 = v68;
    unint64_t v77 = v69;
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v67, v39);
    sub_100012D88(v65, v64);
    uint64_t v65 = v76;
    unint64_t v64 = v77;
  }
  sub_100012C88(v65, v64);
  uint64_t v78 = sub_10001A314(v65, v64);
  uint64_t v79 = v93;
  if (v41)
  {
    sub_100012D88(v65, v64);
    return sub_100027738(v38, &qword_10005A920);
  }
  else
  {
    sub_10001A5C0((uint64_t)v78);
    swift_bridgeObjectRelease();
    sub_100012D88(v65, v64);
    uint64_t v80 = (void *)(v79 + 16);
    sub_100027738(v38, &qword_10005A920);
    uint64_t result = swift_beginAccess();
    if (__OFADD__(*v80, 1)) {
      __break(1u);
    }
    else {
      ++*v80;
    }
  }
  return result;
}

void *sub_100035F68()
{
  uint64_t v10 = &_swiftEmptyArrayStorage;
  (*(void (**)(void *__return_ptr))(*(void *)v0 + 224))(v7);
  uint64_t v1 = v8;
  uint64_t v2 = v9;
  sub_1000157F4(v7, v8);
  uint64_t v5 = v0;
  uint64_t v6 = &v10;
  (*(void (**)(void (*)(uint64_t), uint64_t *, uint64_t, uint64_t))(v2 + 8))(sub_100037680, &v4, v1, v2);
  sub_100015838((uint64_t)v7);
  return v10;
}

void sub_100036030(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  unint64_t v90 = a3;
  uint64_t v102 = a2;
  uint64_t v89 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0);
  uint64_t v91 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v92 = (uint64_t)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s18LaunchWarningEntryVMa();
  uint64_t v100 = *(void *)(v5 - 8);
  uint64_t v101 = v5;
  __chkstk_darwin(v5);
  uint64_t v93 = (uint64_t *)((char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100015700(&qword_10005A5C0);
  __chkstk_darwin(v7 - 8);
  uint64_t v99 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LaunchWarningDetails();
  uint64_t v97 = *(void *)(v9 - 8);
  uint64_t v98 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v94 = (uint64_t)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v96 = (uint64_t)&v85 - v12;
  uint64_t v13 = sub_100015700(&qword_10005A4E0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v95 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v104 = (uint64_t)&v85 - v16;
  uint64_t v17 = type metadata accessor for AppRecord(0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v105) = sub_10003FFA0();
  uint64_t v20 = sub_10001E35C();
  uint64_t v21 = (void *)*v20;
  uint64_t v22 = sub_100015700(&qword_100059C40);
  uint64_t v23 = swift_allocObject();
  long long v103 = xmmword_100042B20;
  *(_OWORD *)(v23 + 16) = xmmword_100042B20;
  sub_100037618(a1, (uint64_t)v19, type metadata accessor for AppRecord);
  id v24 = v21;
  uint64_t v25 = sub_10003FEC0();
  uint64_t v27 = v26;
  *(void *)(v23 + 56) = &type metadata for String;
  unint64_t v28 = sub_100016C7C();
  *(void *)(v23 + 64) = v28;
  *(void *)(v23 + 32) = v25;
  *(void *)(v23 + 40) = v27;
  sub_10003FD80();

  swift_bridgeObjectRelease();
  id v29 = (uint64_t *)(a1 + *(int *)(v17 + 36));
  unint64_t v30 = v29[2];
  if (v30 >> 60 == 15)
  {
    sub_10003FFA0();
    uint64_t v31 = (void *)*v20;
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = v103;
    id v33 = v31;
    uint64_t v34 = sub_10003FB60();
    *(void *)(v32 + 56) = &type metadata for String;
    *(void *)(v32 + 64) = v28;
    *(void *)(v32 + 32) = v34;
    *(void *)(v32 + 40) = v35;
    sub_10003FD80();

    swift_bridgeObjectRelease();
  }
  else
  {
    long long v87 = (void **)v20;
    uint64_t v88 = v22;
    uint64_t v105 = a1;
    uint64_t v36 = *v29;
    uint64_t v37 = v29[1];
    uint64_t v38 = v102;
    uint64_t v39 = *(uint64_t (**)(uint64_t))(*v102 + 152);
    uint64_t v40 = sub_100012C88(v37, v30);
    uint64_t v41 = (void *)v39(v40);
    sub_100012C88(v37, v30);
    uint64_t v42 = v109;
    sub_10002543C(v36, v37, v30, v104);
    sub_100038D74(v36, v37, v30);
    if (v42)
    {
      sub_100038D74(v36, v37, v30);
    }
    else
    {

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v104, 1, v101) == 1)
      {
        uint64_t v85 = v39;
        sub_100027738(v104, &qword_10005A4E0);
        uint64_t v43 = *v38;
        uint64_t v86 = v36;
        uint64_t v44 = *(void (**)(uint64_t, unint64_t, uint64_t))(v43 + 280);
        uint64_t v104 = v37;
        sub_100012C88(v37, v30);
        uint64_t v45 = (uint64_t)v99;
        uint64_t v46 = v104;
        v44(v104, v30, v86);
        sub_100038D74(v86, v46, v30);
        uint64_t v109 = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v45, 1, v98) == 1)
        {
          sub_100027738(v45, &qword_10005A5C0);
          sub_10003FFA0();
          uint64_t v47 = *v87;
          uint64_t v48 = swift_allocObject();
          *(_OWORD *)(v48 + 16) = v103;
          id v49 = v47;
          uint64_t v50 = sub_10003FB60();
          *(void *)(v48 + 56) = &type metadata for String;
          *(void *)(v48 + 64) = v28;
          *(void *)(v48 + 32) = v50;
          *(void *)(v48 + 40) = v51;
          sub_10003FD80();

          swift_bridgeObjectRelease();
          sub_100038D74(v86, v46, v30);
        }
        else
        {
          uint64_t v52 = v96;
          sub_100037420(v45, v96, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
          LODWORD(v99) = sub_10003FFC0();
          uint64_t v53 = *v87;
          uint64_t v54 = swift_allocObject();
          *(_OWORD *)(v54 + 16) = xmmword_100042B30;
          id v55 = v53;
          uint64_t v56 = sub_10003FB60();
          *(void *)(v54 + 56) = &type metadata for String;
          *(void *)(v54 + 64) = v28;
          *(void *)(v54 + 32) = v56;
          *(void *)(v54 + 40) = v57;
          sub_100037618(v52, v94, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
          uint64_t v58 = sub_10003FEC0();
          *(void *)(v54 + 96) = &type metadata for String;
          *(void *)(v54 + 104) = v28;
          *(void *)(v54 + 72) = v58;
          *(void *)(v54 + 80) = v59;
          uint64_t v60 = v102;
          sub_10003FD80();

          uint64_t v61 = swift_bridgeObjectRelease();
          uint64_t v62 = (void *)v85(v61);
          uint64_t v63 = v95;
          uint64_t v64 = v109;
          sub_100025B0C(v52, v95);
          if (v64)
          {
            swift_errorRelease();

            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v100 + 56))(v63, 1, 1, v101);
            sub_100027738(v63, &qword_10005A4E0);
            sub_10003FFB0();
            uint64_t v65 = *v87;
            uint64_t v66 = swift_allocObject();
            *(_OWORD *)(v66 + 16) = v103;
            id v67 = v65;
            uint64_t v68 = sub_10003FB60();
            *(void *)(v66 + 56) = &type metadata for String;
            *(void *)(v66 + 64) = v28;
            *(void *)(v66 + 32) = v68;
            *(void *)(v66 + 40) = v69;
            sub_10003FD80();

            swift_bridgeObjectRelease();
            sub_100038D74(v86, v104, v30);
            sub_100038D90(v52, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
          }
          else
          {

            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v100 + 56))(v63, 0, 1, v101);
            id v70 = v93;
            sub_100037420(v63, (uint64_t)v93, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
            sub_10003FFC0();
            uint64_t v71 = *v87;
            uint64_t v72 = swift_allocObject();
            *(_OWORD *)(v72 + 16) = v103;
            uint64_t v73 = *v70;
            *(void *)(v72 + 56) = &type metadata for UInt64;
            *(void *)(v72 + 64) = &protocol witness table for UInt64;
            *(void *)(v72 + 32) = v73;
            id v74 = v71;
            sub_10003FD80();

            swift_bridgeObjectRelease();
            type metadata accessor for LaunchWarningMark();
            uint64_t v75 = sub_100021904(v73);
            (*(void (**)(void *__return_ptr))(*v60 + 224))(v106);
            uint64_t v76 = v107;
            uint64_t v77 = v108;
            sub_1000157F4(v106, v107);
            uint64_t v78 = v105;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 16))(v75, v105, v76, v77);
            sub_100015838((uint64_t)v106);
            uint64_t v79 = v92;
            sub_100037618(v78, v92, type metadata accessor for AppRecord);
            sub_100037618(v52, v79 + *(int *)(v89 + 20), (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
            uint64_t v80 = v90;
            unint64_t v81 = *v90;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t *v80 = v81;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v81 = sub_100036F24(0, *(void *)(v81 + 16) + 1, 1, v81);
              unint64_t *v80 = v81;
            }
            unint64_t v84 = *(void *)(v81 + 16);
            unint64_t v83 = *(void *)(v81 + 24);
            if (v84 >= v83 >> 1)
            {
              unint64_t v81 = sub_100036F24(v83 > 1, v84 + 1, 1, v81);
              unint64_t *v80 = v81;
            }
            *(void *)(v81 + 16) = v84 + 1;
            sub_100037420(v92, v81+ ((*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80))+ *(void *)(v91 + 72) * v84, type metadata accessor for LaunchWarningController.NewLaunchWarning);
            swift_release();
            sub_100038D74(v86, v104, v30);
            sub_100038D90((uint64_t)v70, (uint64_t (*)(void))_s18LaunchWarningEntryVMa);
            sub_100038D90(v52, (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
          }
        }
      }
      else
      {
        sub_100038D74(v36, v37, v30);
        sub_100027738(v104, &qword_10005A4E0);
      }
    }
  }
}

uint64_t sub_100036C50(uint64_t a1)
{
  (*(void (**)(void *__return_ptr))(*(void *)v1 + 224))(v13);
  uint64_t v3 = v14;
  uint64_t v4 = v15;
  sub_1000157F4(v13, v14);
  uint64_t v5 = (void *)(a1 + *(int *)(type metadata accessor for AppRecord(0) + 20));
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  char v8 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v4 + 24))(*v5, v6, v3, v4);
  sub_100015838((uint64_t)v13);
  if (v8) {
    sub_10003FFC0();
  }
  else {
    sub_10003FFB0();
  }
  uint64_t v9 = (void *)*sub_10001E35C();
  sub_100015700(&qword_100059C40);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100042B20;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_100016C7C();
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v6;
  id v11 = v9;
  swift_bridgeObjectRetain();
  sub_10003FD80();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100036E34()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  uint64_t v2 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  sub_100015838(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit);
  sub_100015838(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager);
  sub_100015838(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100036F24(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100015700(&qword_10005AB38);
  uint64_t v10 = *(void *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1000401C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  void v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100038DF0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10003718C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000371F0()
{
  unint64_t result = qword_10005A910;
  if (!qword_10005A910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A910);
  }
  return result;
}

uint64_t sub_100037244(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (void *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  *(void *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db) = a1;
  swift_beginAccess();
  void *v8 = a2;
  id v9 = a1;
  swift_retain();
  swift_release();
  sub_10003718C(a3, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit);
  if (qword_10005D290 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10003FBA0();
  uint64_t v11 = sub_100018048(v10, (uint64_t)qword_10005D6D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL, v11, v10);
  uint64_t v12 = type metadata accessor for AppManager();
  uint64_t v13 = sub_100016B34();
  size_t v14 = (uint64_t *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager);
  v14[3] = v12;
  void v14[4] = (uint64_t)&off_1000523A8;
  *size_t v14 = v13;
  uint64_t v17 = type metadata accessor for MetricReporter();
  unint64_t v18 = &off_100053790;
  *(void *)&long long v16 = sub_100016B34();
  sub_100015838(a3);
  sub_100027EAC(&v16, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics);
  return v4;
}

uint64_t sub_1000373D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000373E8()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100037420(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100037488()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000374D8(void *a1)
{
  return sub_100035684(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000374F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BloomFilter();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003753C()
{
  unint64_t result = qword_10005A938;
  if (!qword_10005A938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A938);
  }
  return result;
}

uint64_t sub_100037590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100015700(&qword_10005A920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LaunchWarningController.NewLaunchWarning(uint64_t a1)
{
  return sub_100015C84(a1, qword_10005D330);
}

uint64_t sub_100037618(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_100037680(uint64_t a1)
{
  sub_100036030(a1, *(uint64_t **)(v1 + 16), *(unint64_t **)(v1 + 24));
}

uint64_t sub_1000376A0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LaunchWarningControllerError(uint64_t a1)
{
  return sub_1000376C8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1000376C8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17online_auth_agent28LaunchWarningControllerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000376A0(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1000376A0(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000376C8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000376C8(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for LaunchWarningControllerError()
{
  return &type metadata for LaunchWarningControllerError;
}

uint64_t sub_1000377DC()
{
  return type metadata accessor for LaunchWarningController(0);
}

uint64_t type metadata accessor for LaunchWarningController(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005D320);
}

uint64_t sub_100037804()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for LaunchWarningController.SyncResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningController.SyncResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[18]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningController.SyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningController.SyncResult()
{
  return &type metadata for LaunchWarningController.SyncResult;
}

uint64_t *sub_100037974(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003FBA0();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v44 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v44(a1, a2, v7);
    id v9 = (int *)type metadata accessor for AppRecord(0);
    uint64_t v10 = v9[5];
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v9[6];
    BOOL v15 = (uint64_t *)((char *)a1 + v14);
    long long v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *BOOL v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)a1 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    uint64_t v18 = v9[8];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    unint64_t v21 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v23 = *v20;
      sub_100012C88(*v20, v21);
      *(void *)uint64_t v19 = v23;
      *((void *)v19 + 1) = v21;
    }
    uint64_t v24 = v9[9];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    unint64_t v27 = *((void *)v26 + 2);
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
      *((void *)v25 + 2) = *((void *)v26 + 2);
    }
    else
    {
      *(_DWORD *)uint64_t v25 = *(_DWORD *)v26;
      uint64_t v28 = *((void *)v26 + 1);
      sub_100012C88(v28, v27);
      *((void *)v25 + 1) = v28;
      *((void *)v25 + 2) = v27;
    }
    uint64_t v29 = *(int *)(a3 + 20);
    unint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    *(_DWORD *)((char *)a1 + v29) = *(_DWORD *)((char *)a2 + v29);
    uint64_t v32 = *(uint64_t *)((char *)a2 + v29 + 8);
    unint64_t v33 = *((void *)v31 + 2);
    sub_100012C88(*((void *)v31 + 1), v33);
    *((void *)v30 + 1) = v32;
    *((void *)v30 + 2) = v33;
    uint64_t v34 = (int *)type metadata accessor for LaunchWarningDetails();
    uint64_t v35 = v34[6];
    uint64_t v36 = &v30[v35];
    uint64_t v37 = &v31[v35];
    uint64_t v38 = sub_10003FD00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    v30[v34[7]] = v31[v34[7]];
    *(void *)&v30[v34[8]] = *(void *)&v31[v34[8]];
    uint64_t v39 = v34[9];
    uint64_t v40 = &v30[v39];
    uint64_t v41 = &v31[v39];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&v31[v39], 1, v7))
    {
      uint64_t v42 = sub_100015700(&qword_10005A810);
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      v44((uint64_t *)v40, (uint64_t *)v41, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v40, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_100037C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v17(a1, v4);
  uint64_t v6 = type metadata accessor for AppRecord(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(v6 + 32));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_100012D88(*v7, v8);
  }
  uint64_t v9 = a1 + *(int *)(v6 + 36);
  unint64_t v10 = *(void *)(v9 + 16);
  if (v10 >> 60 != 15) {
    sub_100012D88(*(void *)(v9 + 8), v10);
  }
  uint64_t v11 = a1 + *(int *)(a2 + 20);
  sub_100012D88(*(void *)(v11 + 8), *(void *)(v11 + 16));
  uint64_t v12 = type metadata accessor for LaunchWarningDetails();
  uint64_t v13 = v11 + *(int *)(v12 + 24);
  uint64_t v14 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = v11 + *(int *)(v12 + 36);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v4);
  }
  return result;
}

uint64_t sub_100037E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v42(a1, a2, v6);
  unint64_t v8 = (int *)type metadata accessor for AppRecord(0);
  uint64_t v9 = v8[5];
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = v11[1];
  *unint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = v8[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  uint64_t v17 = v8[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = *(void *)(a2 + v17 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  else
  {
    uint64_t v21 = *v19;
    sub_100012C88(*v19, v20);
    *(void *)uint64_t v18 = v21;
    *(void *)(v18 + 8) = v20;
  }
  uint64_t v22 = v8[9];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  unint64_t v25 = *(void *)(v24 + 16);
  if (v25 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    *(void *)(v23 + 16) = *(void *)(v24 + 16);
  }
  else
  {
    *(_DWORD *)uint64_t v23 = *(_DWORD *)v24;
    uint64_t v26 = *(void *)(v24 + 8);
    sub_100012C88(v26, v25);
    *(void *)(v23 + 8) = v26;
    *(void *)(v23 + 16) = v25;
  }
  uint64_t v27 = *(int *)(a3 + 20);
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(_DWORD *)(a1 + v27) = *(_DWORD *)(a2 + v27);
  uint64_t v30 = *(void *)(a2 + v27 + 8);
  unint64_t v31 = *(void *)(v29 + 16);
  sub_100012C88(*(void *)(v29 + 8), v31);
  *(void *)(v28 + 8) = v30;
  *(void *)(v28 + 16) = v31;
  uint64_t v32 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v33 = v32[6];
  uint64_t v34 = v28 + v33;
  uint64_t v35 = v29 + v33;
  uint64_t v36 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  *(unsigned char *)(v28 + v32[7]) = *(unsigned char *)(v29 + v32[7]);
  *(void *)(v28 + v32[8]) = *(void *)(v29 + v32[8]);
  uint64_t v37 = v32[9];
  uint64_t v38 = (void *)(v28 + v37);
  uint64_t v39 = (const void *)(v29 + v37);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v29 + v37, 1, v6))
  {
    uint64_t v40 = sub_100015700(&qword_10005A810);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    v42((uint64_t)v38, (uint64_t)v39, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v38, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_100038128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  id v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v55(a1, a2, v6);
  unint64_t v8 = (int *)type metadata accessor for AppRecord(0);
  uint64_t v9 = v8[5];
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *unint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = v8[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  uint64_t v15 = v8[8];
  uint64_t v16 = (uint64_t *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  unint64_t v18 = *(void *)(a2 + v15 + 8);
  if (*(void *)(a1 + v15 + 8) >> 60 == 15)
  {
    if (v18 >> 60 != 15)
    {
      uint64_t v19 = *v17;
      sub_100012C88(v19, v18);
      uint64_t *v16 = v19;
      v16[1] = v18;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v18 >> 60 == 15)
  {
    sub_100017A30((uint64_t)v16);
LABEL_6:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    goto LABEL_8;
  }
  uint64_t v20 = *v17;
  sub_100012C88(v20, v18);
  uint64_t v21 = *v16;
  unint64_t v22 = v16[1];
  uint64_t *v16 = v20;
  v16[1] = v18;
  sub_100012D88(v21, v22);
LABEL_8:
  uint64_t v23 = v8[9];
  uint64_t v24 = a1 + v23;
  unint64_t v25 = (long long *)(a2 + v23);
  unint64_t v26 = *(void *)(a1 + v23 + 16) >> 60;
  unint64_t v27 = *(void *)(a2 + v23 + 16) >> 60;
  if (v26 <= 0xE)
  {
    if (v27 <= 0xE)
    {
      *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
      uint64_t v32 = *((void *)v25 + 1);
      unint64_t v33 = *((void *)v25 + 2);
      sub_100012C88(v32, v33);
      uint64_t v34 = *(void *)(v24 + 8);
      unint64_t v35 = *(void *)(v24 + 16);
      *(void *)(v24 + 8) = v32;
      *(void *)(v24 + 16) = v33;
      sub_100012D88(v34, v35);
    }
    else
    {
      sub_100017A84(v24);
      uint64_t v29 = *((void *)v25 + 2);
      *(_OWORD *)uint64_t v24 = *v25;
      *(void *)(v24 + 16) = v29;
    }
  }
  else if (v27 <= 0xE)
  {
    *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
    uint64_t v30 = *((void *)v25 + 1);
    unint64_t v31 = *((void *)v25 + 2);
    sub_100012C88(v30, v31);
    *(void *)(v24 + 8) = v30;
    *(void *)(v24 + 16) = v31;
  }
  else
  {
    long long v28 = *v25;
    *(void *)(v24 + 16) = *((void *)v25 + 2);
    *(_OWORD *)uint64_t v24 = v28;
  }
  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(_DWORD *)(a1 + v36) = *(_DWORD *)(a2 + v36);
  uint64_t v39 = *(void *)(a2 + v36 + 8);
  unint64_t v40 = *(void *)(v38 + 16);
  sub_100012C88(*(void *)(v38 + 8), v40);
  uint64_t v41 = *(void *)(v37 + 8);
  unint64_t v42 = *(void *)(v37 + 16);
  *(void *)(v37 + 8) = v39;
  *(void *)(v37 + 16) = v40;
  sub_100012D88(v41, v42);
  uint64_t v43 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v44 = v43[6];
  uint64_t v45 = v37 + v44;
  uint64_t v46 = v38 + v44;
  uint64_t v47 = sub_10003FD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 24))(v45, v46, v47);
  *(unsigned char *)(v37 + v43[7]) = *(unsigned char *)(v38 + v43[7]);
  *(void *)(v37 + v43[8]) = *(void *)(v38 + v43[8]);
  uint64_t v48 = v43[9];
  id v49 = (void *)(v37 + v48);
  uint64_t v50 = (const void *)(v38 + v48);
  uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v46) = v51(v37 + v48, 1, v6);
  int v52 = v51((uint64_t)v50, 1, v6);
  if (!v46)
  {
    if (!v52)
    {
      v55((uint64_t)v49, (uint64_t)v50, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v49, v6);
    goto LABEL_20;
  }
  if (v52)
  {
LABEL_20:
    uint64_t v53 = sub_100015700(&qword_10005A810);
    memcpy(v49, v50, *(void *)(*(void *)(v53 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v49, v50, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v49, 0, 1, v6);
  return a1;
}

char *sub_10003851C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for AppRecord(0);
  *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
  *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
  *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
  *(_OWORD *)&a1[v9[8]] = *(_OWORD *)&a2[v9[8]];
  uint64_t v10 = v9[9];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((void *)v11 + 2) = *((void *)v12 + 2);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(_DWORD *)uint64_t v14 = *(_DWORD *)&a2[v13];
  *(_OWORD *)(v14 + 8) = *(_OWORD *)&a2[v13 + 8];
  uint64_t v16 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v17 = v16[6];
  unint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  v14[v16[7]] = v15[v16[7]];
  *(void *)&v14[v16[8]] = *(void *)&v15[v16[8]];
  uint64_t v21 = v16[9];
  unint64_t v22 = &v14[v21];
  uint64_t v23 = &v15[v21];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&v15[v21], 1, v6))
  {
    uint64_t v24 = sub_100015700(&qword_10005A810);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v8(v22, v23, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v6);
  }
  return a1;
}

char *sub_100038748(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for AppRecord(0);
  uint64_t v10 = v9[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *(void *)uint64_t v11 = v14;
  *((void *)v11 + 1) = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = v9[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (uint64_t *)&a2[v15];
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *(void *)uint64_t v16 = v19;
  *((void *)v16 + 1) = v18;
  swift_bridgeObjectRelease();
  *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
  uint64_t v20 = v9[8];
  uint64_t v21 = (uint64_t)&a1[v20];
  unint64_t v22 = &a2[v20];
  unint64_t v23 = *(void *)&a1[v20 + 8];
  if (v23 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v24 = *((void *)v22 + 1);
  if (v24 >> 60 == 15)
  {
    sub_100017A30(v21);
LABEL_4:
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    goto LABEL_6;
  }
  uint64_t v25 = *(void *)v21;
  *(void *)uint64_t v21 = *(void *)v22;
  *(void *)(v21 + 8) = v24;
  sub_100012D88(v25, v23);
LABEL_6:
  uint64_t v26 = v9[9];
  uint64_t v27 = (uint64_t)&a1[v26];
  long long v28 = &a2[v26];
  unint64_t v29 = *(void *)&a1[v26 + 16];
  if (v29 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    *(void *)(v27 + 16) = *((void *)v28 + 2);
    goto LABEL_11;
  }
  unint64_t v30 = *((void *)v28 + 2);
  if (v30 >> 60 == 15)
  {
    sub_100017A84(v27);
    goto LABEL_9;
  }
  *(_DWORD *)uint64_t v27 = *(_DWORD *)v28;
  uint64_t v31 = *(void *)(v27 + 8);
  *(void *)(v27 + 8) = *((void *)v28 + 1);
  *(void *)(v27 + 16) = v30;
  sub_100012D88(v31, v29);
LABEL_11:
  uint64_t v32 = *(int *)(a3 + 20);
  unint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  *(_DWORD *)unint64_t v33 = *(_DWORD *)&a2[v32];
  uint64_t v35 = *(void *)&a1[v32 + 8];
  unint64_t v36 = *(void *)&a1[v32 + 16];
  *(_OWORD *)(v33 + 8) = *(_OWORD *)&a2[v32 + 8];
  sub_100012D88(v35, v36);
  uint64_t v37 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v38 = v37[6];
  uint64_t v39 = &v33[v38];
  unint64_t v40 = &v34[v38];
  uint64_t v41 = sub_10003FD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 40))(v39, v40, v41);
  v33[v37[7]] = v34[v37[7]];
  *(void *)&v33[v37[8]] = *(void *)&v34[v37[8]];
  uint64_t v42 = v37[9];
  uint64_t v43 = &v33[v42];
  uint64_t v44 = &v34[v42];
  uint64_t v45 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v40) = v45(&v33[v42], 1, v6);
  int v46 = v45(v44, 1, v6);
  if (!v40)
  {
    if (!v46)
    {
      v8(v43, v44, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v43, v6);
    goto LABEL_16;
  }
  if (v46)
  {
LABEL_16:
    uint64_t v47 = sub_100015700(&qword_10005A810);
    memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v43, v44, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v43, 0, 1, v6);
  return a1;
}

uint64_t sub_100038A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100038A9C);
}

uint64_t sub_100038A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppRecord(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for LaunchWarningDetails();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100038B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100038BA8);
}

uint64_t sub_100038BA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for AppRecord(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for LaunchWarningDetails();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_100038CAC()
{
  uint64_t result = type metadata accessor for AppRecord(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for LaunchWarningDetails();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100038D74(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    return sub_100012D88(a2, a3);
  }
  return result;
}

uint64_t sub_100038D90(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100038DF0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_100040210();
  __break(1u);
  return result;
}

void sub_100038F4C(__int16 a1, uint64_t a2, __int16 a3, double a4)
{
  NSString v8 = sub_10003FE70();
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = a1 & 1;
  *(unsigned char *)(v9 + 17) = HIBYTE(a1) & 1;
  *(void *)(v9 + 24) = a2;
  *(unsigned char *)(v9 + 32) = a3 & 1;
  *(unsigned char *)(v9 + 33) = HIBYTE(a3) & 1;
  *(double *)(v9 + 40) = a4;
  v11[4] = sub_100039080;
  v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100039310;
  v11[3] = &unk_100053678;
  uint64_t v10 = _Block_copy(v11);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v10);
}

uint64_t sub_100039070()
{
  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_100039080()
{
  sub_100015700(&qword_10005AC00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000440D0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x8000000100047A30;
  *(NSNumber *)(inited + 48) = sub_10003FF40();
  *(void *)(inited + 56) = 0xD000000000000012;
  *(void *)(inited + 64) = 0x8000000100047A50;
  *(NSNumber *)(inited + 72) = sub_10003FF40();
  *(void *)(inited + 80) = 0xD000000000000012;
  *(void *)(inited + 88) = 0x8000000100047A70;
  *(NSNumber *)(inited + 96) = sub_10003FF40();
  *(void *)(inited + 104) = 0x65746C694677656ELL;
  *(void *)(inited + 112) = 0xE900000000000072;
  *(NSNumber *)(inited + 120) = sub_10003FF40();
  *(void *)(inited + 128) = 0x70616C45656D6974;
  *(void *)(inited + 136) = 0xEB00000000646573;
  *(NSNumber *)(inited + 144) = sub_10003FF50();
  *(void *)(inited + 152) = 0x6F43657461647075;
  *(void *)(inited + 160) = 0xEB00000000746E75;
  *(NSNumber *)(inited + 168) = sub_10003FF60();
  return sub_1000391F4(inited);
}

unint64_t sub_1000391F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100015700(&qword_10005AC08);
  unint64_t v2 = (void *)sub_100040200();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100039CF0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_100039310(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100039E4C();
    v4.super.Class isa = sub_10003FE40().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10003939C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000393AC()
{
  return swift_release();
}

void sub_1000393B4(uint64_t a1, double a2)
{
  NSString v4 = sub_10003FE70();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  v7[4] = sub_1000394F4;
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  void v7[2] = sub_100039310;
  void v7[3] = &unk_1000536C8;
  uint64_t v6 = _Block_copy(v7);
  swift_errorRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v6);
}

uint64_t sub_1000394BC()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000394F4()
{
  uint64_t v0 = (void *)sub_10003FAD0();
  sub_100015700(&qword_10005AC00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000440E0;
  *(void *)(inited + 32) = 1701080931;
  *(void *)(inited + 40) = 0xE400000000000000;
  [v0 code];
  *(NSNumber *)(inited + 48) = sub_10003FF60();
  *(void *)(inited + 56) = 0x6E69616D6F64;
  *(void *)(inited + 64) = 0xE600000000000000;
  id result = [v0 domain];
  if (result)
  {
    *(void *)(inited + 72) = result;
    *(void *)(inited + 80) = 0x70616C45656D6974;
    *(void *)(inited + 88) = 0xEB00000000646573;
    *(NSNumber *)(inited + 96) = sub_10003FF50();
    unint64_t v3 = sub_1000391F4(inited);

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000395F4(int a1, uint64_t a2, unint64_t a3, char a4, char a5)
{
  char v9 = a5 & 1;
  NSString v10 = sub_10003FE70();
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(void *)(v11 + 32) = a3;
  *(unsigned char *)(v11 + 40) = v9;
  *(unsigned char *)(v11 + 41) = a4;
  void v13[4] = sub_10003971C;
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100039310;
  void v13[3] = &unk_100053718;
  uint64_t v12 = _Block_copy(v13);
  sub_100012C88(a2, a3);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);
}

uint64_t sub_100039714()
{
  return sub_10003994C(42);
}

unint64_t sub_10003971C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  sub_100015700(&qword_10005AC00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000440F0;
  *(void *)(inited + 32) = 0x687361686463;
  *(void *)(inited + 40) = 0xE600000000000000;
  sub_100015458(v1, v2);
  NSString v4 = sub_10003FE70();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = 0x7954687361686463;
  *(void *)(inited + 64) = 0xEA00000000006570;
  *(NSNumber *)(inited + 72) = sub_1000403A0();
  *(void *)(inited + 80) = 0x6E6F697461636F6CLL;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(NSNumber *)(inited + 96) = sub_10003FF60();
  *(void *)(inited + 104) = 0x74616E696D726574;
  *(void *)(inited + 112) = 0xEA00000000006465;
  *(NSNumber *)(inited + 120) = sub_10003FF40();
  return sub_1000391F4(inited);
}

void sub_100039834(int a1, uint64_t a2, unint64_t a3)
{
  NSString v6 = sub_10003FE70();
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a3;
  v9[4] = sub_100039990;
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100039310;
  v9[3] = &unk_100053768;
  id v8 = _Block_copy(v9);
  sub_100012C88(a2, a3);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);
}

uint64_t sub_100039944()
{
  return sub_10003994C(40);
}

uint64_t sub_10003994C(uint64_t a1)
{
  sub_100012D88(*(void *)(v1 + 24), *(void *)(v1 + 32));

  return _swift_deallocObject(v1, a1, 7);
}

unint64_t sub_100039990()
{
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v1 = *(void *)(v0 + 32);
  sub_100015700(&qword_10005AC00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100042B30;
  *(void *)(inited + 32) = 0x687361686463;
  *(void *)(inited + 40) = 0xE600000000000000;
  sub_100015458(v2, v1);
  NSString v4 = sub_10003FE70();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = 0x7954687361686463;
  *(void *)(inited + 64) = 0xEA00000000006570;
  *(NSNumber *)(inited + 72) = sub_1000403A0();
  return sub_1000391F4(inited);
}

unint64_t sub_100039A54()
{
  unint64_t result = qword_10005AB40;
  if (!qword_10005AB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AB40);
  }
  return result;
}

uint64_t sub_100039AA8(__int16 a1, uint64_t a2, __int16 a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(**(void **)v3 + 80))(a1 & 0x101, a2, a3 & 0x101);
}

uint64_t sub_100039AF8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t sub_100039B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(**(void **)v5 + 96))(a1, a2, a3, a4, a5 & 1);
}

uint64_t sub_100039B84()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for WarningLocation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    id *result = a2 + 1;
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
        JUMPOUT(0x100039C94);
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
          id *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WarningLocation()
{
  return &type metadata for WarningLocation;
}

uint64_t type metadata accessor for MetricReporter()
{
  return self;
}

unint64_t sub_100039CF0(uint64_t a1, uint64_t a2)
{
  sub_100040370();
  sub_10003FEE0();
  Swift::Int v4 = sub_100040390();

  return sub_100039D68(a1, a2, v4);
}

unint64_t sub_100039D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000402D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000402D0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100039E4C()
{
  unint64_t result = qword_10005AC10;
  if (!qword_10005AC10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005AC10);
  }
  return result;
}

uint64_t type metadata accessor for BloomFilterRecord(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005D640);
}

int *sub_100039EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v23 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(a9, a1, v23);
  unint64_t result = (int *)type metadata accessor for BloomFilterRecord(0);
  uint64_t v25 = (void *)(a9 + result[5]);
  *uint64_t v25 = a2;
  v25[1] = a3;
  *(void *)(a9 + result[6]) = a4;
  uint64_t v26 = (void *)(a9 + result[7]);
  void *v26 = a5;
  v26[1] = a6;
  uint64_t v27 = (void *)(a9 + result[8]);
  *uint64_t v27 = a7;
  v27[1] = a8;
  long long v28 = (void *)(a9 + result[9]);
  *long long v28 = a10;
  v28[1] = a11;
  unint64_t v29 = (void *)(a9 + result[10]);
  *unint64_t v29 = a12;
  v29[1] = a13;
  *(void *)(a9 + result[11]) = a14;
  unint64_t v30 = (void *)(a9 + result[12]);
  void *v30 = a15;
  v30[1] = a16;
  return result;
}

uint64_t sub_10003A008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10003FBA0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t sub_10003A074@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t type metadata accessor for BaseZoneSyncResult(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005D660);
}

uint64_t sub_10003A0A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_100031CF8(a1, a5, &qword_10005A648);
  uint64_t v9 = type metadata accessor for BaseZoneSyncResult(0);
  uint64_t result = sub_100031CF8(a2, a5 + *(int *)(v9 + 20), &qword_10005A640);
  BOOL v11 = (void *)(a5 + *(int *)(v9 + 24));
  *BOOL v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t sub_10003A124(char a1)
{
  return a1 & 1;
}

unint64_t sub_10003A130()
{
  unint64_t result = qword_10005AC18;
  if (!qword_10005AC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC18);
  }
  return result;
}

uint64_t *sub_10003A184(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003FBA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    NSString v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_100012C88(*v10, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = *(uint64_t *)((char *)a2 + v13);
    uint64_t *v9 = v11;
    v9[1] = v12;
    *(uint64_t *)((char *)a1 + v13) = v15;
    uint64_t v16 = (uint64_t *)((char *)a1 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (uint64_t *)((char *)a1 + v19);
    unint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    unint64_t v24 = (uint64_t *)((char *)a1 + v20);
    uint64_t v25 = (uint64_t *)((char *)a2 + v20);
    uint64_t v26 = v25[1];
    void *v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[10];
    uint64_t v28 = a3[11];
    unint64_t v29 = (uint64_t *)((char *)a1 + v27);
    unint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    *unint64_t v29 = *v30;
    v29[1] = v31;
    *(uint64_t *)((char *)a1 + v28) = *(uint64_t *)((char *)a2 + v28);
    uint64_t v32 = a3[12];
    unint64_t v33 = (uint64_t *)((char *)a1 + v32);
    uint64_t v34 = (uint64_t *)((char *)a2 + v32);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10003A300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_100012D88(*(void *)(a1 + *(int *)(a2 + 20)), *(void *)(a1 + *(int *)(a2 + 20) + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003A3C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_100012C88(*v9, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void *)(a2 + v12);
  uint64_t *v8 = v10;
  v8[1] = v11;
  *(void *)(a1 + v12) = v14;
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = (void *)(a1 + v19);
  unint64_t v24 = (void *)(a2 + v19);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = a3[10];
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v26);
  unint64_t v29 = (void *)(a2 + v26);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  unint64_t v33 = (void *)(a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10003A4F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_100012C88(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  uint64_t *v8 = v10;
  v8[1] = v11;
  sub_100012D88(v12, v13);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  unint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  void *v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v26 = a3[12];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10003A688(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_10003A748(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_100012D88(v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  unint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *unint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  void *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10003A86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003A880);
}

uint64_t sub_10003A880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FBA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10003A944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003A958);
}

uint64_t sub_10003A958(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003FBA0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10003AA18()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10003AAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10003AB44(uint64_t a1)
{
  uint64_t v2 = sub_10003FBA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10003ABA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10003AC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10003AC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10003ACD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10003AD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003AD4C);
}

uint64_t sub_10003AD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10003ADB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003ADCC);
}

uint64_t sub_10003ADCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003FBA0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DocumentCheckerRecord(uint64_t a1)
{
  return sub_100015C84(a1, (uint64_t *)&unk_10005D650);
}

uint64_t sub_10003AE5C()
{
  uint64_t result = sub_10003FBA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for BloomFilterUpdateRecord(uint64_t a1)
{
  sub_100012D88(*(void *)(a1 + 8), *(void *)(a1 + 16));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 16);
  sub_100012C88(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BloomFilterUpdateRecord(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_100012C88(v4, v5);
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_100012D88(v6, v7);
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_100012D88(v4, v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterUpdateRecord()
{
  return &type metadata for BloomFilterUpdateRecord;
}

uint64_t *sub_10003B15C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for BloomFilterRecord(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100015700(&qword_10005A648);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_10003FBA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = v7[5];
      uint64_t v13 = (uint64_t *)((char *)a1 + v12);
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_100012C88(*v14, v16);
      *uint64_t v13 = v15;
      v13[1] = v16;
      *(uint64_t *)((char *)a1 + v7[6]) = *(uint64_t *)((char *)a2 + v7[6]);
      uint64_t v17 = v7[7];
      uint64_t v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      void *v18 = *v19;
      v18[1] = v20;
      uint64_t v21 = v7[8];
      uint64_t v22 = (uint64_t *)((char *)a1 + v21);
      uint64_t v23 = (uint64_t *)((char *)a2 + v21);
      uint64_t v24 = v23[1];
      void *v22 = *v23;
      v22[1] = v24;
      uint64_t v25 = v7[9];
      uint64_t v26 = (uint64_t *)((char *)a1 + v25);
      uint64_t v27 = (uint64_t *)((char *)a2 + v25);
      uint64_t v28 = v27[1];
      void *v26 = *v27;
      v26[1] = v28;
      uint64_t v29 = v7[10];
      uint64_t v30 = (uint64_t *)((char *)a1 + v29);
      uint64_t v31 = (uint64_t *)((char *)a2 + v29);
      uint64_t v32 = v31[1];
      void *v30 = *v31;
      v30[1] = v32;
      *(uint64_t *)((char *)a1 + v7[11]) = *(uint64_t *)((char *)a2 + v7[11]);
      uint64_t v33 = v7[12];
      uint64_t v34 = (uint64_t *)((char *)a1 + v33);
      uint64_t v35 = (uint64_t *)((char *)a2 + v33);
      uint64_t v36 = v35[1];
      void *v34 = *v35;
      v34[1] = v36;
      uint64_t v37 = *(void (**)(uint64_t *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v37(a1, 0, 1, v7);
    }
    uint64_t v38 = *(int *)(a3 + 20);
    uint64_t v39 = (char *)a1 + v38;
    unint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = type metadata accessor for DocumentCheckerRecord(0);
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      uint64_t v43 = sub_100015700(&qword_10005A640);
      memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      uint64_t v44 = sub_10003FBA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v39, v40, v44);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
    uint64_t v45 = *(int *)(a3 + 24);
    int v46 = (char *)a1 + v45;
    uint64_t v47 = (char *)a2 + v45;
    unint64_t v48 = *((void *)v47 + 1);
    if (v48 >> 60 == 15)
    {
      *(_OWORD *)int v46 = *(_OWORD *)v47;
    }
    else
    {
      uint64_t v49 = *(void *)v47;
      sub_100012C88(*(void *)v47, *((void *)v47 + 1));
      *(void *)int v46 = v49;
      *((void *)v46 + 1) = v48;
    }
  }
  return a1;
}

uint64_t sub_10003B4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BloomFilterRecord(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    uint64_t v5 = sub_10003FBA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    sub_100012D88(*(void *)(a1 + *(int *)(v4 + 20)), *(void *)(a1 + *(int *)(v4 + 20) + 8));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for DocumentCheckerRecord(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = sub_10003FBA0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v6, v9);
  }
  uint64_t v10 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v11 = v10[1];
  if (v11 >> 60 != 15)
  {
    uint64_t v12 = *v10;
    return sub_100012D88(v12, v11);
  }
  return result;
}

char *sub_10003B6BC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100015700(&qword_10005A648);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_10003FBA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    uint64_t v10 = v6[5];
    unint64_t v11 = (uint64_t *)&a1[v10];
    uint64_t v12 = (uint64_t *)&a2[v10];
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    sub_100012C88(*v12, v14);
    *unint64_t v11 = v13;
    v11[1] = v14;
    *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
    uint64_t v15 = v6[7];
    unint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)unint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    uint64_t v19 = v6[8];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = v6[9];
    uint64_t v24 = &a1[v23];
    uint64_t v25 = &a2[v23];
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    uint64_t v27 = v6[10];
    uint64_t v28 = &a1[v27];
    uint64_t v29 = &a2[v27];
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
    uint64_t v31 = v6[12];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    uint64_t v34 = *((void *)v33 + 1);
    *(void *)uint64_t v32 = *(void *)v33;
    *((void *)v32 + 1) = v34;
    uint64_t v35 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(a1, 0, 1, v6);
  }
  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = type metadata accessor for DocumentCheckerRecord(0);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100015700(&qword_10005A640);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    uint64_t v42 = sub_10003FBA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v37, v38, v42);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  uint64_t v43 = *(int *)(a3 + 24);
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &a2[v43];
  unint64_t v46 = *((void *)v45 + 1);
  if (v46 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  }
  else
  {
    uint64_t v47 = *(void *)v45;
    sub_100012C88(*(void *)v45, *((void *)v45 + 1));
    *(void *)uint64_t v44 = v47;
    *((void *)v44 + 1) = v46;
  }
  return a1;
}

char *sub_10003BA08(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = sub_10003FBA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = v6[5];
      uint64_t v13 = (uint64_t *)&a1[v12];
      unint64_t v14 = (uint64_t *)&a2[v12];
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_100012C88(*v14, v16);
      *uint64_t v13 = v15;
      v13[1] = v16;
      *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
      uint64_t v17 = v6[7];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      *(void *)uint64_t v18 = *(void *)v19;
      *((void *)v18 + 1) = *((void *)v19 + 1);
      uint64_t v20 = v6[8];
      uint64_t v21 = &a1[v20];
      uint64_t v22 = &a2[v20];
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = *((void *)v22 + 1);
      uint64_t v23 = v6[9];
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      *(void *)uint64_t v24 = *(void *)v25;
      *((void *)v24 + 1) = *((void *)v25 + 1);
      uint64_t v26 = v6[10];
      uint64_t v27 = &a1[v26];
      uint64_t v28 = &a2[v26];
      *(void *)uint64_t v27 = *(void *)v28;
      *((void *)v27 + 1) = *((void *)v28 + 1);
      *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
      uint64_t v29 = v6[12];
      uint64_t v30 = &a1[v29];
      uint64_t v31 = &a2[v29];
      *(void *)uint64_t v30 = *(void *)v31;
      *((void *)v30 + 1) = *((void *)v31 + 1);
      uint64_t v32 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_10003BFDC((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    uint64_t v33 = sub_100015700(&qword_10005A648);
    memcpy(a1, a2, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v53 = sub_10003FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 24))(a1, a2, v53);
  uint64_t v54 = v6[5];
  id v55 = (uint64_t *)&a1[v54];
  uint64_t v56 = (uint64_t *)&a2[v54];
  uint64_t v57 = *v56;
  unint64_t v58 = v56[1];
  sub_100012C88(*v56, v58);
  uint64_t v59 = *v55;
  unint64_t v60 = v55[1];
  uint64_t *v55 = v57;
  v55[1] = v58;
  sub_100012D88(v59, v60);
  *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
  uint64_t v61 = v6[7];
  uint64_t v62 = &a1[v61];
  uint64_t v63 = &a2[v61];
  *(void *)uint64_t v62 = *(void *)v63;
  *((void *)v62 + 1) = *((void *)v63 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v6[8];
  uint64_t v65 = &a1[v64];
  uint64_t v66 = &a2[v64];
  *(void *)uint64_t v65 = *(void *)v66;
  *((void *)v65 + 1) = *((void *)v66 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = v6[9];
  uint64_t v68 = &a1[v67];
  uint64_t v69 = &a2[v67];
  *(void *)uint64_t v68 = *(void *)v69;
  *((void *)v68 + 1) = *((void *)v69 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v70 = v6[10];
  uint64_t v71 = &a1[v70];
  uint64_t v72 = &a2[v70];
  *(void *)uint64_t v71 = *(void *)v72;
  *((void *)v71 + 1) = *((void *)v72 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  uint64_t v73 = v6[12];
  id v74 = &a1[v73];
  uint64_t v75 = &a2[v73];
  *(void *)id v74 = *(void *)v75;
  *((void *)v74 + 1) = *((void *)v75 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v34 = *(int *)(a3 + 20);
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = type metadata accessor for DocumentCheckerRecord(0);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (v40)
  {
    if (!v41)
    {
      uint64_t v42 = sub_10003FBA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v35, v36, v42);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v41)
  {
    sub_10003BFDC((uint64_t)v35, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    uint64_t v43 = sub_100015700(&qword_10005A640);
    memcpy(v35, v36, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v76 = sub_10003FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 24))(v35, v36, v76);
LABEL_13:
  uint64_t v44 = *(int *)(a3 + 24);
  uint64_t v45 = (uint64_t *)&a1[v44];
  unint64_t v46 = (uint64_t *)&a2[v44];
  unint64_t v47 = *(void *)&a2[v44 + 8];
  if (*(void *)&a1[v44 + 8] >> 60 != 15)
  {
    if (v47 >> 60 != 15)
    {
      uint64_t v49 = *v46;
      sub_100012C88(v49, v47);
      uint64_t v50 = *v45;
      unint64_t v51 = v45[1];
      uint64_t *v45 = v49;
      v45[1] = v47;
      sub_100012D88(v50, v51);
      return a1;
    }
    sub_100017A30((uint64_t)v45);
    goto LABEL_18;
  }
  if (v47 >> 60 == 15)
  {
LABEL_18:
    *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
    return a1;
  }
  uint64_t v48 = *v46;
  sub_100012C88(v48, v47);
  uint64_t *v45 = v48;
  v45[1] = v47;
  return a1;
}

uint64_t sub_10003BFDC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_10003C03C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100015700(&qword_10005A648);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_10003FBA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
    *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
    *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
    *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
    *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
    (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for DocumentCheckerRecord(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = sub_100015700(&qword_10005A640);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_10003FBA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_10003C2F0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = sub_10003FBA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
      *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
      *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
      *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
      *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
      *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
      *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
      *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
      (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_10003BFDC((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    uint64_t v12 = sub_100015700(&qword_10005A648);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v30 = sub_10003FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(a1, a2, v30);
  uint64_t v31 = v6[5];
  uint64_t v32 = *(void *)&a1[v31];
  unint64_t v33 = *(void *)&a1[v31 + 8];
  *(_OWORD *)&a1[v31] = *(_OWORD *)&a2[v31];
  sub_100012D88(v32, v33);
  *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
  uint64_t v34 = v6[7];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v38 = *(void *)v36;
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = v38;
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = v6[8];
  int v40 = &a1[v39];
  int v41 = &a2[v39];
  uint64_t v43 = *(void *)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *(void *)int v40 = v43;
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  uint64_t v44 = v6[9];
  uint64_t v45 = &a1[v44];
  unint64_t v46 = &a2[v44];
  uint64_t v48 = *(void *)v46;
  uint64_t v47 = *((void *)v46 + 1);
  *(void *)uint64_t v45 = v48;
  *((void *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  uint64_t v49 = v6[10];
  uint64_t v50 = &a1[v49];
  unint64_t v51 = &a2[v49];
  uint64_t v53 = *(void *)v51;
  uint64_t v52 = *((void *)v51 + 1);
  *(void *)uint64_t v50 = v53;
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  uint64_t v54 = v6[12];
  id v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  uint64_t v58 = *(void *)v56;
  uint64_t v57 = *((void *)v56 + 1);
  *(void *)id v55 = v58;
  *((void *)v55 + 1) = v57;
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for DocumentCheckerRecord(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      uint64_t v21 = sub_10003FBA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v14, v15, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    sub_10003BFDC((uint64_t)v14, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    uint64_t v22 = sub_100015700(&qword_10005A640);
    memcpy(v14, v15, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v59 = sub_10003FBA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 40))(v14, v15, v59);
LABEL_13:
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = (uint64_t *)&a1[v23];
  uint64_t v25 = (uint64_t *)&a2[v23];
  unint64_t v26 = *(void *)&a1[v23 + 8];
  if (v26 >> 60 != 15)
  {
    unint64_t v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      uint64_t v28 = *v24;
      uint64_t *v24 = *v25;
      v24[1] = v27;
      sub_100012D88(v28, v26);
      return a1;
    }
    sub_100017A30((uint64_t)v24);
  }
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  return a1;
}

uint64_t sub_10003C7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003C7C0);
}

uint64_t sub_10003C7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015700(&qword_10005A648);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_100015700(&qword_10005A640);
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      uint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
      BOOL v15 = ((4 * v14) & 0xC) == 0;
      unsigned int v16 = ((4 * v14) & 0xC | (v14 >> 2)) ^ 0xF;
      if (v15) {
        return 0;
      }
      else {
        return v16;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_10003C8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003C8FC);
}

uint64_t sub_10003C8FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100015700(&qword_10005A648);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100015700(&qword_10005A640);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      BOOL v15 = (void *)(a1 + *(int *)(a4 + 24));
      *BOOL v15 = 0;
      v15[1] = (unint64_t)((~a2 >> 2) & 3 | (4 * ~a2)) << 60;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_10003CA24()
{
  sub_10003CB2C(319, &qword_10005AD98, (void (*)(uint64_t))type metadata accessor for BloomFilterRecord);
  if (v0 <= 0x3F)
  {
    sub_10003CB2C(319, (unint64_t *)&unk_10005ADA0, (void (*)(uint64_t))type metadata accessor for DocumentCheckerRecord);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10003CB2C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000400D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t destroy for UpdateZoneSyncResult(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 >> 60 != 15) {
    return sub_100012D88(*(void *)(result + 8), v1);
  }
  return result;
}

uint64_t _s17online_auth_agent20UpdateZoneSyncResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = (uint64_t *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v3;
  }
  else
  {
    uint64_t v5 = *v3;
    sub_100012C88(*v3, *(void *)(a2 + 16));
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = (_OWORD *)(a1 + 8);
  unint64_t v4 = (uint64_t *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_100012C88(*v4, *(void *)(a2 + 16));
      uint64_t v8 = *(void *)(a1 + 8);
      unint64_t v9 = *(void *)(a1 + 16);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v5;
      sub_100012D88(v8, v9);
      return a1;
    }
    sub_100017A30(a1 + 8);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    _OWORD *v3 = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_100012C88(*v4, *(void *)(a2 + 16));
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithTake for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  unint64_t v5 = (void *)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = *v5;
      *(void *)(a1 + 16) = v7;
      sub_100012D88(v8, v6);
      return a1;
    }
    sub_100017A30(a1 + 8);
  }
  _OWORD *v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateZoneSyncResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateZoneSyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateZoneSyncResult()
{
  return &type metadata for UpdateZoneSyncResult;
}

unsigned char *storeEnumTagSinglePayload for CloudKitOperationsError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        int *result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      int *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10003CE84);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitOperationsError()
{
  return &type metadata for CloudKitOperationsError;
}

BOOL sub_10003CEBC(void *a1)
{
  if (![a1 caseInsensitiveCompare:[NSString stringWithUTF8String:"fbe71da1-0834-4d49-9b41-d3fa7f9e4d4f"]])return 1; {
  unint64_t v2 = 0;
  }
  do
  {
    unint64_t v3 = v2;
    if (v2 == 14) {
      break;
    }
    id v4 = [a1 caseInsensitiveCompare:[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_1000539E8)[v2 + 1])];
    unint64_t v2 = v3 + 1;
  }
  while (v4);
  return v3 < 0xE;
}

void sub_10003CF54(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Database failed to initialize.", v1, 2u);
}

void sub_10003CF98()
{
  sub_100005A60();
  sub_100005A28((void *)&_mh_execute_header, v0, v1, "Finalize error (%d) on query: %@");
}

void sub_10003D000(sqlite3 **a1)
{
  sqlite3_errmsg(*a1);
  sqlite3_errcode(*a1);
  sub_100005A48();
  sub_100005A78((void *)&_mh_execute_header, v2, v3, "SQL error '%s' (%1d)", v4, v5, v6, v7, v8);
}

void sub_10003D094(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Query canceled", v1, 2u);
}

void sub_10003D0D8()
{
  sub_100005A60();
  sub_100005A28((void *)&_mh_execute_header, v0, v1, "Prepare error (%d) on query: %@");
}

void sub_10003D140(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100005A28((void *)&_mh_execute_header, a2, a3, "Unable to table row count for %@: %d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10003D1B8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_10003D230()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_10003D25C()
{
  __error();
  sub_100005D1C();
  sub_100005A78((void *)&_mh_execute_header, v0, v1, "unable to open file to update permissions: %d, %s", v2, v3, v4, v5, v6);
}

void sub_10003D2DC()
{
  __error();
  sub_100005D1C();
  sub_100005A78((void *)&_mh_execute_header, v0, v1, "unable to check filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
}

void sub_10003D35C()
{
  __error();
  sub_100005D1C();
  sub_100005A78((void *)&_mh_execute_header, v0, v1, "unable to set filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
}

void sub_10003D3DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D414(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D44C(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Caller (pid %d) does not have required entitlement '%s'", (uint8_t *)v3, 0x12u);
}

void sub_10003D4D4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not allocate path buffer for MIS data directory (this should not happen).", v2, v3, v4, v5, v6);
}

void sub_10003D508()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not get path for MIS data directory (this should not happen).", v2, v3, v4, v5, v6);
}

void sub_10003D53C(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create data directory '%s' (error %{errno}d)!", (uint8_t *)&v5, 0x12u);
}

void sub_10003D5DC()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not set up service listener, or connection invalid in top-level handler.", v2, v3, v4, v5, v6);
}

void sub_10003D610()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Unexpected listener event.", v2, v3, v4, v5, v6);
}

void sub_10003D644(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launch warning sync had error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003D6BC()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Did not get any user info from event, ignoring.", v2, v3, v4, v5, v6);
}

void sub_10003D6F0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to convert user info XPC dictionary to CF dictionary, ignoring.", v2, v3, v4, v5, v6);
}

void sub_10003D724()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "User info was not a dictionary, ignoring.", v2, v3, v4, v5, v6);
}

void sub_10003D758()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Seen weird bundle ID.", v2, v3, v4, v5, v6);
}

void sub_10003D78C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSDictionary *wl_MAECopyActivationRecordWithError(NSError *__autoreleasing *)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_agent.m" lineNumber:65 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003D804()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "could not create random key!", v2, v3, v4, v5, v6);
}

void sub_10003D838()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "failure obtaining device ID", v2, v3, v4, v5, v6);
}

void sub_10003D86C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "failure creating app ID", v2, v3, v4, v5, v6);
}

void sub_10003D8A0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to construct authorization request", v2, v3, v4, v5, v6);
}

void sub_10003D8D4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "bogus cdhash size!", v2, v3, v4, v5, v6);
}

void sub_10003D908()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to get device ID", v2, v3, v4, v5, v6);
}

void sub_10003D93C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not encrypt the message (status 0x%x)", (uint8_t *)v2, 8u);
}

void sub_10003D9B4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failure converting UPP UUID to UTF8 string", v2, v3, v4, v5, v6);
}

void sub_10003D9E8()
{
  __assert_rtn("peerEventHandler", "online_auth_agent.m", 784, "reply != NULL");
}

void sub_10003DA14()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "no message type provided, canceling connection.", v2, v3, v4, v5, v6);
}

void sub_10003DA48()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "device_id, cdhash, upp_uuid, or team_id missing from message.", v2, v3, v4, v5, v6);
}

void sub_10003DA7C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "unknown message type provided, canceling connection.", v2, v3, v4, v5, v6);
}

void sub_10003DAB0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "request is not a dictionary, canceling connection.", v2, v3, v4, v5, v6);
}

void sub_10003DAE4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "upp_uuid missing from message.", v2, v3, v4, v5, v6);
}

void sub_10003DB18(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set trust for UPP %s: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10003DBA0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for signature data", v2, v3, v4, v5, v6);
}

void sub_10003DBD4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "cdHash missing from message.", v2, v3, v4, v5, v6);
}

void sub_10003DC08()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not initialize key for denylist override.", v2, v3, v4, v5, v6);
}

void sub_10003DC3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Set launch warning override failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003DCB4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Posting launch warning override notification failed: %d", (uint8_t *)v2, 8u);
}

void sub_10003DD2C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Caller didn't provide cdhash data", v2, v3, v4, v5, v6);
}

void sub_10003DD60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Get launch warning data failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003DDD8(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *MobileActivationLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"online_auth_agent.m" lineNumber:64 description:@"%s", *a1];

  __break(1u);
}

void sub_10003DE58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DE90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DEC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DF00(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AppleMobileFileIntegrity user client call failed: 0x%x", (uint8_t *)v2, 8u);
}

void sub_10003DF78(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unable to open AppleMobileFileIntegrity user client: 0x%x", (uint8_t *)v2, 8u);
}

void sub_10003DFF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E028(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E098(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E108(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E174(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E1E0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "No json in request.", v2, v3, v4, v5, v6);
}

void sub_10003E214(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C2A4((void *)&_mh_execute_header, v2, v3, "Could not convert dictionary to JSON: %@", v4, v5, v6, v7, 2u);
}

void sub_10003E2A0()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAAKeychainLabel) getkMAOptionsBAAKeychainLabel(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:28 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E318()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAAKeychainAccessGroup) getkMAOptionsBAAKeychainAccessGroup(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:29 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E390()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAANetworkTimeoutInterval) getkMAOptionsBAANetworkTimeoutInterval(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:30 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E408()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAAValidity) getkMAOptionsBAAValidity(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:31 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E480()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAASCRTAttestation) getkMAOptionsBAASCRTAttestation(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:32 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E4F8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"typeof (kMAOptionsBAAAccessControls) getkMAOptionsBAAAccessControls(void)"];
  [v0 handleFailureInFunction:v1 file:@"online_auth_server.m" lineNumber:33 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10003E570()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "ppq Server URL is NULL, not proceeding with authorizing attempt.", v2, v3, v4, v5, v6);
}

void sub_10003E5A4()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "urlRequest is NULL, not proceeding with authorizing attempt.", v2, v3, v4, v5, v6);
}

void sub_10003E5D8()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not find device identity certificate", v2, v3, v4, v5, v6);
}

void sub_10003E60C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could create device identity", v2, v3, v4, v5, v6);
}

void sub_10003E640(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create CMS blob, got error %d", (uint8_t *)v2, 8u);
}

void sub_10003E6B8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't get device identity %@", (uint8_t *)&v3, 0xCu);
}

void sub_10003E738(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C2A4((void *)&_mh_execute_header, v2, v3, "session error: %@", v4, v5, v6, v7, 2u);
}

void sub_10003E7C0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not create signing policy", v2, v3, v4, v5, v6);
}

void sub_10003E7F4(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *DeviceIdentityLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"online_auth_server.m" lineNumber:27 description:@"%s", *a1];

  __break(1u);
}

void sub_10003E874()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to mmap fallback denylist header. Giving up.", v2, v3, v4, v5, v6);
}

void sub_10003E8A8()
{
  sub_100006E90();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Using empty denylist.", v1, 2u);
}

void sub_10003E8E8()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer for denylist path (this should not happen.", v2, v3, v4, v5, v6);
}

void sub_10003E91C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Denylist path conversion failed (this should not happen.)", v2, v3, v4, v5, v6);
}

void sub_10003E950()
{
  sub_100006E90();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Denylist does not exist.", v1, 2u);
}

void sub_10003E990()
{
  __error();
  sub_10000C794();
  sub_10000C7A0((void *)&_mh_execute_header, v0, v1, "Could not open denylist, error %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10003EA0C(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 24;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Denylist is too short (%lld bytes) for header (%lu bytes)", (uint8_t *)&v2, 0x16u);
}

void sub_10003EA94()
{
  __error();
  sub_10000C794();
  sub_10000C7A0((void *)&_mh_execute_header, v0, v1, "Could not map denylist, error %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10003EB10()
{
  sub_10000C794();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Denylist entries offset %u is past denylist size %lld", v2, 0x12u);
}

void sub_10003EB98()
{
  sub_10000C794();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Wrong denylist magic (0x08%x)", v1, 8u);
}

void sub_10003EC10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not read in internal auth list, error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EC88(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failure writing out auth list", v1, 2u);
}

void sub_10003ECCC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unhandled onlineCheckType %ld encountered. (This should not happen.)", (uint8_t *)&v3, 0xCu);
}

void sub_10003ED48(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to migrate UPP %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10003EDD0()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Latest asset has no path? (This should not happen, update ignored.)", v2, v3, v4, v5, v6);
}

void sub_10003EE04(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping asset with NULL attributes (this should not happen).", buf, 2u);
}

void sub_10003EE44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EEB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Downloaded asset failure: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EF28()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Downloaded asset has no path? (This should not happen, update ignored.)", v2, v3, v4, v5, v6);
}

void sub_10003EF5C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Downloaded asset", v2, v3, v4, v5, v6);
}

void sub_10003EF90()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "unable to find AppleMobileFileIntegrity service", v2, v3, v4, v5, v6);
}

void sub_10003EFC4()
{
  sub_100011148();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "AppleMobileFileIntegrity user client call failed: 0x%x", v2, v3, v4, v5, v6);
}

void sub_10003F02C()
{
  sub_100011148();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "unable to open AppleMobileFileIntegrity user client: 0x%x", v2, v3, v4, v5, v6);
}

void sub_10003F094()
{
  sub_10001113C();
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_1000110CC();
  sub_1000110F0((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to open new DocCheckList '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F124()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to create docCheckList ingestion path", v2, v3, v4, v5, v6);
}

void sub_10003F158()
{
  sub_10001113C();
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_1000110CC();
  sub_1000110F0((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to create temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F1E8()
{
  sub_10001113C();
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_1000110CC();
  sub_1000110F0((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to chmod 0644 temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F278()
{
  __error();
  sub_10000C7A0((void *)&_mh_execute_header, v0, v1, "Copying asset to temporary ingestion DocCheckList failed, error %{errno}d", v2, v3, v4, v5, 0);
}

void sub_10003F2F8()
{
  sub_100011148();
  sub_10000A718((void *)&_mh_execute_header, v0, v1, "Posting DocCheckList notification failed: %d", v2, v3, v4, v5, v6);
}

void sub_10003F360()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100011110();
  sub_100011154((void *)&_mh_execute_header, v1, v2, "Failed to rename DocCheckList ingestion file '%s' to actual path '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F3F8()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Opening denylist for ingest failed, not ingesting.", v2, v3, v4, v5, v6);
}

void sub_10003F42C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Denylist integrity check failed, not ingesting.", v2, v3, v4, v5, v6);
}

void sub_10003F460()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Denylist integrity check sentinel not found.", v2, v3, v4, v5, v6);
}

void sub_10003F494()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "Failed to created ingestion path", v2, v3, v4, v5, v6);
}

void sub_10003F4C8()
{
  sub_10001113C();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000110CC();
  sub_1000110F0((void *)&_mh_execute_header, v1, v2, "Failed to create temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F558()
{
  sub_10001113C();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000110CC();
  sub_1000110F0((void *)&_mh_execute_header, v1, v2, "Failed to chmod 0644 temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F5E8()
{
  __error();
  sub_10000C7A0((void *)&_mh_execute_header, v0, v1, "Copying asset to temporary ingestion denylist failed, error %{errno}d", v2, v3, v4, v5, 0);
}

void sub_10003F668()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100011110();
  sub_100011154((void *)&_mh_execute_header, v1, v2, "Failed rename denylist ingestion file '%s' to actual denylist '%s': (%d) %s", v3, v4, v5, v6, v7);
}

void sub_10003F700(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Size mismatch while copying denylist, %ld total, %lld copied.", (uint8_t *)&v4, 0x16u);
}

void sub_10003F78C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F7FC(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ProfileValidatedAppIdentityLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"AppIdentity.m" lineNumber:18 description:@"%s" *a1];

  __break(1u);
}

void sub_10003F87C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getPVAppIdentityDigestClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"AppIdentity.m" lineNumber:19 description:@"Unable to find class %s", "PVAppIdentityDigest"];

  __break(1u);
}

void sub_10003F8F8()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "got NULL when querying UDID", v2, v3, v4, v5, v6);
}

void sub_10003F92C()
{
  sub_100006E90();
  sub_100006598((void *)&_mh_execute_header, v0, v1, "got non-string when querying UDID", v2, v3, v4, v5, v6);
}

uint64_t sub_10003F960()
{
  return POSIXError._nsError.getter();
}

uint64_t sub_10003F970()
{
  return type metadata accessor for POSIXError();
}

uint64_t sub_10003F980()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_10003F990()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10003F9A0()
{
  return __DataStorage.init(length:)();
}

uint64_t sub_10003F9B0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10003F9C0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10003F9D0()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_10003F9E0()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t sub_10003F9F0()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_10003FA00()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_10003FA10()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_10003FA20()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_10003FA30()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_10003FA40()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_10003FA90()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_10003FAC0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_10003FAD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10003FAE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10003FAF0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10003FB00()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10003FB10()
{
  return URL.init(fileURLWithPath:)();
}

void sub_10003FB20(NSURL *retstr@<X8>)
{
}

uint64_t sub_10003FB30()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)();
}

uint64_t sub_10003FB40()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FB50(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10003FB60()
{
  return URL.path.getter();
}

uint64_t sub_10003FB70()
{
  return URL.init(string:)();
}

uint64_t sub_10003FB80()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10003FB90()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10003FBA0()
{
  return type metadata accessor for URL();
}

void sub_10003FBB0()
{
}

uint64_t sub_10003FBC0()
{
  return Data.init(contentsOf:options:)();
}

void sub_10003FBD0()
{
}

uint64_t sub_10003FBE0()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_10003FBF0()
{
  return type metadata accessor for Data.RangeReference();
}

NSData sub_10003FC10()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10003FC20(NSDataBase64EncodingOptions options)
{
  return Data.base64EncodedString(options:)(options)._countAndFlagsBits;
}

uint64_t sub_10003FC30()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FC40()
{
  return Data.write(to:options:)();
}

uint64_t sub_10003FC50()
{
  return Data.append(_:)();
}

uint64_t sub_10003FC60()
{
  return Data.subdata(in:)();
}

uint64_t sub_10003FC70()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t sub_10003FC80()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t sub_10003FC90()
{
  return Data.subscript.getter();
}

uint64_t sub_10003FCA0()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10003FCB0()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10003FCD0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10003FCE0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FCF0()
{
  return static Date.now.getter();
}

uint64_t sub_10003FD00()
{
  return type metadata accessor for Date();
}

uint64_t sub_10003FD10()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10003FD20()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FD30()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10003FD40()
{
  return dispatch thunk of InputFilter.readData(ofLength:)();
}

uint64_t sub_10003FD50()
{
  return InputFilter.init(_:using:bufferCapacity:readingFrom:)();
}

uint64_t sub_10003FD60()
{
  return type metadata accessor for FilterOperation();
}

uint64_t sub_10003FD70()
{
  return type metadata accessor for Algorithm();
}

uint64_t sub_10003FD80()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10003FD90()
{
  return POSIXErrorCode.init(rawValue:)();
}

uint64_t sub_10003FDA0()
{
  return errno.getter();
}

uint64_t sub_10003FDB0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10003FDC0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10003FDD0()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_10003FDE0()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_10003FDF0()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_10003FE00()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_10003FE10()
{
  return type metadata accessor for SHA512Digest();
}

uint64_t sub_10003FE20()
{
  return type metadata accessor for SHA256();
}

uint64_t sub_10003FE30()
{
  return type metadata accessor for SHA512();
}

NSDictionary sub_10003FE40()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10003FE50()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FE60()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString sub_10003FE70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10003FE80()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10003FE90()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10003FEA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FEB0()
{
  return String.init(format:_:)();
}

uint64_t sub_10003FEC0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10003FED0()
{
  return String.utf8CString.getter();
}

uint64_t sub_10003FEE0()
{
  return String.hash(into:)();
}

void sub_10003FEF0(Swift::String a1)
{
}

uint64_t sub_10003FF00()
{
  return String.init(cString:)();
}

Swift::Int sub_10003FF10()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10003FF20()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10003FF30()
{
  return specialized Array._endMutation()();
}

NSNumber sub_10003FF40()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_10003FF50()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_10003FF60()
{
  return Int._bridgeToObjectiveC()();
}

CKRecordID sub_10003FF70(Swift::String recordName, CKRecordZoneID zoneID)
{
  return CKRecordID.init(recordName:zoneID:)(recordName, zoneID);
}

uint64_t sub_10003FF80()
{
  return NSFileHandle.read(upToCount:)();
}

uint64_t sub_10003FF90()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

uint64_t sub_10003FFA0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10003FFB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10003FFC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10003FFD0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10003FFE0()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10003FFF0()
{
  return CKFetchRecordsOperation.perRecordResultBlock.setter();
}

uint64_t sub_100040000()
{
  return CKRecordKeyValueSetting.subscript.getter();
}

uint64_t sub_100040010()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t sub_100040020()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100040030()
{
  return CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter();
}

CKFetchRecordZoneChangesOperation sub_100040040(Swift::OpaquePointer_optional recordZoneIDs, Swift::OpaquePointer_optional configurationsByRecordZoneID)
{
  return CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(recordZoneIDs, configurationsByRecordZoneID);
}

uint64_t sub_100040050()
{
  return CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter();
}

uint64_t sub_100040060()
{
  return CKFetchRecordZoneChangesConfiguration.desiredKeys.setter();
}

uint64_t sub_100040070()
{
  return CKRecord.recordType.getter();
}

uint64_t sub_100040080()
{
  return CKRecord.subscript.getter();
}

Swift::Int sub_100040090(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000400A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000400B0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_1000400C0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1000400D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000400E0()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_1000400F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100040100()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100040110()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100040120()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_100040140()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100040150()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_100040160(Swift::Int a1)
{
}

uint64_t sub_100040170()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100040180()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100040190()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_1000401A0()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_1000401B0()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_1000401C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000401D0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000401E0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000401F0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_100040200()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100040210()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100040230(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100040240()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100040250()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100040260()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100040270()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100040280()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100040290()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000402A0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000402B0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000402C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000402D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000402E0()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1000402F0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100040320()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100040330()
{
  return Error._code.getter();
}

uint64_t sub_100040340()
{
  return Error._domain.getter();
}

uint64_t sub_100040350()
{
  return Error._userInfo.getter();
}

uint64_t sub_100040360()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t sub_100040370()
{
  return Hasher.init(_seed:)();
}

void sub_100040380(Swift::UInt a1)
{
}

Swift::Int sub_100040390()
{
  return Hasher._finalize()();
}

NSNumber sub_1000403A0()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t sub_1000403B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000403C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
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

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return _CFURLCreateWithFileSystemPathRelativeToBase(allocator, filePath, pathStyle, isDirectory, baseURL);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
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

uint64_t MAIsDownloadResultFailure()
{
  return _MAIsDownloadResultFailure();
}

uint64_t MAIsQueryResultFailure()
{
  return _MAIsQueryResultFailure();
}

uint64_t MAStringForMAAssetState()
{
  return _MAStringForMAAssetState();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MISBlacklistSetOverride()
{
  return _MISBlacklistSetOverride();
}

uint64_t MISCopyProvisioningProfile()
{
  return _MISCopyProvisioningProfile();
}

uint64_t MISExistsIndeterminateApps()
{
  return _MISExistsIndeterminateApps();
}

uint64_t MISProvisioningProfileHasPPQExemption()
{
  return _MISProvisioningProfileHasPPQExemption();
}

uint64_t MISQueryBlacklistForBundle()
{
  return _MISQueryBlacklistForBundle();
}

uint64_t MISQueryBlacklistForCdHash()
{
  return _MISQueryBlacklistForCdHash();
}

uint64_t MISValidateSignature()
{
  return _MISValidateSignature();
}

uint64_t MISetLaunchWarning()
{
  return _MISetLaunchWarning();
}

void NSLog(NSString *format, ...)
{
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

uint64_t SecCMSCreateSignedData()
{
  return _SecCMSCreateSignedData();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return _SecCMSVerifyCopyDataAndAttributes();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return _SecCodeCopySigningInformation(code, flags, information);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

uint64_t SecPolicyCreateApplePPQService()
{
  return _SecPolicyCreateApplePPQService();
}

uint64_t SecPolicyCreateApplePPQSigning()
{
  return _SecPolicyCreateApplePPQSigning();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return _SecStaticCodeCreateWithPath(path, flags, staticCode);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return _SecTrustGetCertificateAtIndex(trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return _SecTrustGetCertificateCount(trust);
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return _bsearch_b(__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t csops()
{
  return _csops();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_posix_memalign(memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return _mprotect(a1, a2, a3);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_origin_name(a1, a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_table_name(a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_readonly(db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
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

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 addValue:forHTTPHeaderField:];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:length:];
}

id objc_msgSend_applicationProxyForIdentifier_placeholder_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier:placeholder:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return _[a1 asDictionary];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return _[a1 assetId];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createUserTrustedProfileEntryWithUuid_teamId_signature_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createUserTrustedProfileEntryWithUuid:teamId:signature:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return [a1 dataWithLength:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteTrustedProfileWithUuid_error_(void *a1, const char *a2, ...)
{
  return [a1 deleteTrustedProfileWithUuid:error:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_digestWithTimeoutError(void *a1, const char *a2, ...)
{
  return _[a1 digestWithTimeoutError];
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return [a1 enumerateBundlesOfType:block:];
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateLinesUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_executeQuery_withBind_withCancellableResults_(void *a1, const char *a2, ...)
{
  return [a1 executeQuery:x0 withBind:x1 withCancellableResults:x2];
}

id objc_msgSend_executeQuery_withBind_withResults_(void *a1, const char *a2, ...)
{
  return [a1 executeQuery:x0 withBind:x1 withResults:x2];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 finishTasksAndInvalidate];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalUrl];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfFile:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithDatabaseURL:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lookupLaunchWarningData_cdhashType_error_(void *a1, const char *a2, ...)
{
  return [a1 lookupLaunchWarningData:cdhashType:error:];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLong:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
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

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return _[a1 profileValidated];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [a1 propertyListWithData:x0 options:x1 format:x2 error:x3];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:x0 delegate:x1 delegateQueue:x2];
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCellularAccess:];
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsExpensiveAccess:];
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionary:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresPowerPluggedIn:];
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutIntervalForRequest:];
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutIntervalForResource:];
}

id objc_msgSend_setUserOverride_forID_error_(void *a1, const char *a2, ...)
{
  return [a1 setUserOverride:forID:error:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setupPermissions(void *a1, const char *a2, ...)
{
  return _[a1 setupPermissions];
}

id objc_msgSend_setupSchema(void *a1, const char *a2, ...)
{
  return _[a1 setupSchema];
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return [a1 startCatalogDownload:x0 options:x1 then:x2];
}

id objc_msgSend_startDownload_completionWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "startDownload:completionWithError:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
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

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_syncLaunchWarningsAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 syncLaunchWarningsAndReturnError:];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_uploadTaskWithRequest_fromData_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 uploadTaskWithRequest:x0 fromData:x1 completionHandler:x2];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return _[a1 wasLocal];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}