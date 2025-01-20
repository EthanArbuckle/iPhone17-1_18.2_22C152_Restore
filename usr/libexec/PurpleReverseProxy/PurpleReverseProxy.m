CFStringRef sub_100003BF0(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<LogCtxRef: %p>", a1);
}

void sub_100003C24(uint64_t a1)
{
  v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_100003C34(uint64_t *a1)
{
  if (isatty(2))
  {
    qword_1000101B8 = (uint64_t)__stderrp;
    v2 = sub_100003CFC;
  }
  else
  {
    v2 = 0;
  }
  if (sub_1000043D4())
  {
    int v3 = open("/dev/console", 131073);
    qword_1000101B8 = (uint64_t)fdopen(v3, "w");
    v2 = sub_100003CFC;
  }
  uint64_t result = sub_100004074((dispatch_once_t *)&off_100010000, 40);
  *(_DWORD *)(result + 16) = 5;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = v2;
  *a1 = result;
  byte_1000101B0 = 1;
  return result;
}

uint64_t sub_100003CFC(int a1, int a2, char *a3)
{
  if (qword_1000101B8) {
    return fputs(a3, (FILE *)qword_1000101B8);
  }
  return result;
}

void sub_100003D14(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  v16 = getprogname();
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  va_list arguments = (va_list)&a9;
  if (*(void *)(a2 + 32))
  {
    time_t v39 = time(0);
    memset(&v38, 0, sizeof(v38));
    localtime_r(&v39, &v38);
    if (strftime(cStr, 0x63uLL, "%b %d %H:%M:%S ", &v38)
      && (CFStringRef v18 = CFStringCreateWithCString(0, cStr, 0x8000100u)) != 0)
    {
      CFStringRef cf = v18;
      CFArrayAppendValue(Mutable, v18);
    }
    else
    {
      CFStringRef cf = 0;
    }
    uint64_t v19 = getpid();
    if (a1 >= 7) {
      int v20 = 7;
    }
    else {
      int v20 = a1;
    }
    CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s[%d] <%s>: ", v16, v19, (&off_10000C440)[v20]);
    if (v21) {
      CFArrayAppendValue(Mutable, v21);
    }
  }
  else
  {
    CFStringRef cf = 0;
    CFStringRef v21 = 0;
  }
  CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"%s:%d(%s): ", a3, a4, a5);
  if (v22) {
    CFArrayAppendValue(Mutable, v22);
  }
  CFStringRef v23 = CFStringCreateWithFormatAndArguments(0, 0, a7, arguments);
  if (v23) {
    CFArrayAppendValue(Mutable, v23);
  }
  if (a6)
  {
    CFArrayAppendValue(Mutable, @": ");
    CFArrayAppendValue(Mutable, a6);
  }
  CFStringRef v35 = v21;
  CFTypeRef v37 = a6;
  CFStringRef v24 = CFStringCreateByCombiningStrings(0, Mutable, &stru_10000C938);
  CFStringRef v25 = v24;
  v26 = "failed to convert string\n";
  if (v24)
  {
    CFIndex Length = CFStringGetLength(v24);
    CFIndex v28 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 2;
    v29 = (char *)malloc_type_malloc(v28, 0x8D7FBDB6uLL);
    if (CFStringGetCString(v25, v29, v28, 0x8000100u)) {
      v26 = v29;
    }
  }
  else
  {
    v29 = 0;
  }
  if (a1 >= 7) {
    uint64_t v30 = 7;
  }
  else {
    uint64_t v30 = a1;
  }
  uint64_t v31 = a2;
  v32 = *(void (**)(uint64_t, void, const char *))(a2 + 32);
  if (v32)
  {
    size_t v33 = strlen(v26);
    if (v26[v33 - 1] != 10)
    {
      *(_WORD *)&v26[v33] = 10;
      v32 = *(void (**)(uint64_t, void, const char *))(v31 + 32);
    }
    v32(v30, *(void *)(v31 + 24), v26);
  }
  else
  {
    if (a1 >= 5) {
      int v34 = 5;
    }
    else {
      int v34 = a1;
    }
    asl_log(0, 0, v34, "%s", v26);
  }
  if (v29) {
    free(v29);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v37) {
    CFRelease(v37);
  }
}

uint64_t sub_100004074(dispatch_once_t *context, uint64_t a2)
{
  dispatch_once_t v5 = context[16];
  v4 = context + 16;
  if (v5 != -1) {
    dispatch_once_f(v4, context, (dispatch_function_t)sub_1000040F0);
  }
  size_t v6 = a2 - 16;
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v8 = Instance;
  if (Instance) {
    bzero((void *)(Instance + 16), v6);
  }
  return v8;
}

uint64_t sub_1000040F0(void *a1)
{
  uint64_t v2 = a1[1];
  a1[5] = *a1;
  a1[8] = v2;
  a1[12] = a1[2];
  uint64_t result = _CFRuntimeRegisterClass();
  a1[3] = result;
  return result;
}

__CFDictionary *sub_100004130(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"Command", a1);
  v17 = (const void **)&a10;
  v13 = key;
  if (key)
  {
    while (1)
    {
      v14 = v17;
      CFStringRef v18 = v17 + 1;
      if (!*v14) {
        break;
      }
      CFDictionarySetValue(Mutable, v13, *v14);
      v15 = v18;
      v17 = v18 + 1;
      v13 = *v15;
      if (!*v15) {
        return Mutable;
      }
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 119, (uint64_t)"createCommandDictionaryWithArgs", 0, @"no value for key %@", v12, (uint64_t)v13);
    }
  }
  return Mutable;
}

void sub_100004254(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

CFNumberRef sub_1000042B8(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID()) {
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberIntType, a3) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

void sub_100004320(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"ClientListenerDelay", @"com.apple.PurpleReverseProxy");
  if (v1
    || (CFPropertyListRef v1 = CFPreferencesCopyValue(@"ClientListenerDelay", @"com.apple.PurpleReverseProxy", @"mobile", kCFPreferencesAnyHost)) != 0)
  {
    CFTypeID v2 = CFGetTypeID(v1);
    if (v2 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt32Type, &dword_100010088);
    }
    CFRelease(v1);
  }
}

uint64_t sub_1000043D4()
{
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)__s1 = 0u;
  long long v21 = 0u;
  size_t v19 = 256;
  CFStringRef v0 = (const __CFString *)MGCopyAnswerWithError();
  if (v0)
  {
    CFTypeID v2 = v0;
    CFComparisonResult v3 = CFStringCompare(v0, @"Restore", 0);
    BOOL v5 = v3 == kCFCompareEqualTo;
    if (byte_1000101B0 == 1)
    {
      CFComparisonResult v6 = v3;
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 5) {
        sub_100003D14(5u, qword_1000101A8, (uint64_t)"Utilities.c", 372, (uint64_t)"isRestoreOS", 0, @"Asking MobileGestalt for ReleaseType, isRestoreOS: %d\n", v4, v6 == kCFCompareEqualTo);
      }
    }
    goto LABEL_17;
  }
  if (byte_1000101B0 == 1)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 376, (uint64_t)"isRestoreOS", 0, @"Asking for kMGQReleaseType failed: %d\n", v1, 0);
    }
  }
  CFDictionaryRef v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v7)
  {
    if (byte_1000101B0 != 1) {
      goto LABEL_38;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 318, (uint64_t)"isRestoreOSSystemVersion", 0, @"CFCopySystemVersionDictionary failed\n", v8, v17);
    }
LABEL_32:
    if (byte_1000101B0 == 1)
    {
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
        sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 383, (uint64_t)"isRestoreOS", 0, @"Checking SystemVersion failed: %d\n", v8, 0xFFFFFFFFLL);
      }
    }
LABEL_38:
    unsigned int v18 = sysctlbyname("kern.bootargs", __s1, &v19, 0, 0);
    if (v18)
    {
      if (byte_1000101B0 != 1) {
        return 0;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v13 = qword_1000101A8;
      if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
        return 0;
      }
      uint64_t v17 = v18;
      CFStringRef v14 = @"Calling sysctlbyname for kern.bootargs failed: %d\n";
      unsigned int v15 = 3;
      uint64_t v16 = 392;
    }
    else
    {
      if (strstr(__s1, "rd=md0")) {
        return 1;
      }
      if (byte_1000101B0 != 1) {
        return 0;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v13 = qword_1000101A8;
      if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 5) {
        return 0;
      }
      CFStringRef v14 = @"Did not find rd=md0 in bootargs, assuming not RestoreOS\n";
      unsigned int v15 = 5;
      uint64_t v16 = 390;
    }
    sub_100003D14(v15, v13, (uint64_t)"Utilities.c", v16, (uint64_t)"isRestoreOS", 0, v14, v12, v17);
    return 0;
  }
  CFTypeID v2 = v7;
  Value = CFDictionaryGetValue(v7, @"ReleaseType");
  if (!Value)
  {
    if (byte_1000101B0 == 1)
    {
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
        sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 325, (uint64_t)"isRestoreOSSystemVersion", 0, @"CFDictionaryGetValue for ReleaseType failed\n", v10, v17);
      }
    }
    CFRelease(v2);
    goto LABEL_32;
  }
  BOOL v5 = CFEqual(Value, @"Restore") != 0;
LABEL_17:
  CFRelease(v2);
  return v5;
}

void sub_1000048F8(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000497C;
  block[3] = &unk_10000C4C0;
  block[4] = a1;
  dispatch_async(global_queue, block);
}

void sub_10000497C(uint64_t a1)
{
}

void sub_100004984(uint64_t a1, CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v3 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  uint64_t v4 = *(void *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 136));
  if (v3) {
    CFRetain(v3);
  }
  BOOL v5 = *(const void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;
  if (v5) {
    CFRelease(v5);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 136));
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_100004A14(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v11 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v11 + 16) >= 5) {
      sub_100003D14(5u, v11, (uint64_t)"RPSocket.cpp", 259, (uint64_t)"set_client", 0, @"RPSocket %p: setting client. old: %p. new: %p", a8, a1);
    }
  }
  if (a2) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = 0;
  }
  sub_100004B38(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(void *)(a1 + 24) = a2;
  uint64_t v13 = *(const void **)(a1 + 32);
  if (v13) {
    CFRelease(v13);
  }
  if (v12) {
    CFTypeRef v14 = CFRetain(v12);
  }
  else {
    CFTypeRef v14 = 0;
  }
  *(void *)(a1 + 32) = v14;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));

  return sub_100004BB0(a1);
}

uint64_t sub_100004B38(uint64_t a1)
{
  CFTypeID v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  int v3 = *(_DWORD *)(a1 + 208) - 1;
  *(_DWORD *)(a1 + 208) = v3;
  if (!v3) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  }

  return pthread_mutex_unlock(v2);
}

uint64_t sub_100004BB0(uint64_t a1)
{
  CFTypeID v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  int v3 = *(_DWORD *)(a1 + 208);
  *(_DWORD *)(a1 + 208) = v3 + 1;
  if (!v3) {
    (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
  }

  return pthread_mutex_unlock(v2);
}

void sub_100004C28(uint64_t a1, void *aBlock)
{
  int v3 = _Block_copy(aBlock);
  sub_100004A14(*(void *)(a1 + 16), (uint64_t)sub_100004C84, v3, v4, v5, v6, v7, v8);

  _Block_release(v3);
}

uint64_t sub_100004C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100004C90(uint64_t a1, NSObject *a2)
{
  sub_100004B38(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  uint64_t v4 = *(NSObject **)(a1 + 48);
  if (v4) {
    dispatch_release(v4);
  }
  if (a2)
  {
    *(void *)(a1 + 48) = a2;
    dispatch_retain(a2);
  }
  else
  {
    *(void *)(a1 + 48) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));

  return sub_100004BB0(a1);
}

uint64_t sub_100004D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)os_transaction_create();
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 48))(*(void *)(a1 + 16), a2);
  uint64_t v6 = v5;
  if (v5) {
    *(void *)(*(void *)(v5 + 16) + 200) = v4;
  }
  else {
    os_release(v4);
  }
  return v6;
}

unint64_t sub_100004D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(*(void *)(a1 + 16) + 40);
  if (v11) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v11 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v11 + 16) >= 5) {
      sub_100003D14(5u, v11, (uint64_t)"RPSocket.cpp", 517, (uint64_t)"RPSocketRead", 0, @"Reading %lu bytes from socket %p to buffer %p", a8, a3);
    }
  }
  unint64_t result = (***(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 16))(*(void *)(a1 + 16), a2, a3);
  if (result != -1) {
    atomic_fetch_add_explicit(*(atomic_ullong *volatile *)(*(void *)(a1 + 16) + 224), result, memory_order_relaxed);
  }
  return result;
}

uint64_t sub_100004E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 1;
  }
  uint64_t v8 = a3;
  while (1)
  {
    unint64_t v11 = sub_100004D94(a1, a2, v8, a4, a5, a6, a7, a8);
    if (v11 == -1) {
      break;
    }
    if (!v11)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 40);
      if (v18) {
        goto LABEL_18;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v18 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_18:
        if (*(int *)(v18 + 16) >= 3) {
          sub_100003D14(3u, v18, (uint64_t)"RPSocket.cpp", 532, (uint64_t)"RPSocketReadBuffer", 0, @"EOF on %@\n", a8, a1);
        }
      }
      return 0;
    }
    a2 += v11;
    v8 -= v11;
    if (!v8) {
      return 1;
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 16) + 40);
  if (v13) {
    goto LABEL_12;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v13 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_12:
    if (*(int *)(v13 + 16) >= 3)
    {
      CFTypeRef v14 = __error();
      unsigned int v15 = strerror(*v14);
      CFStringRef v16 = CFStringCreateWithCString(0, v15, 0x8000100u);
      sub_100003D14(3u, v13, (uint64_t)"RPSocket.cpp", 536, (uint64_t)"RPSocketReadBuffer", v16, @"read error on %@", v17, a1);
    }
  }
  return 0;
}

const void *sub_10000504C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  int v33 = -1;
  if (!sub_100004E9C(a1, (uint64_t)&v33, 4, a4, a5, a6, a7, a8) || v33 == -1)
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v27) {
      goto LABEL_19;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v27 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_19:
      if (*(int *)(v27 + 16) >= 3) {
        sub_100003D14(3u, v27, (uint64_t)"RPSocket.cpp", 577, (uint64_t)"RPSocketReadDictionary", 0, @"failed to read length from %@\n", v9, a1);
      }
    }
  }
  else
  {
    CFIndex v10 = v33;
    Mutable = CFDataCreateMutable(0, v33);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFDataSetLength(Mutable, v10);
      MutableBytePtr = CFDataGetMutableBytePtr(v13);
      if (sub_100004E9C(a1, (uint64_t)MutableBytePtr, v10, v15, v16, v17, v18, v19))
      {
        CFPropertyListRef v21 = CFPropertyListCreateWithData(0, v13, 2uLL, 0, &error);
        long long v23 = v21;
        if (!v21 || error)
        {
          uint64_t v31 = *(void *)(*(void *)(a1 + 16) + 40);
          if (v31) {
            goto LABEL_41;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v31 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_41:
            if (*(int *)(v31 + 16) >= 3) {
              sub_100003D14(3u, v31, (uint64_t)"RPSocket.cpp", 595, (uint64_t)"RPSocketReadDictionary", 0, @"failed to deserialize dictionary from %@: %@\n", v22, a1);
            }
          }
          goto LABEL_35;
        }
        CFTypeID v24 = CFGetTypeID(v21);
        if (v24 == CFDictionaryGetTypeID())
        {
LABEL_35:
          CFRelease(v13);
          return v23;
        }
        uint64_t v26 = *(void *)(*(void *)(a1 + 16) + 40);
        if (v26) {
          goto LABEL_12;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v26 = qword_1000101A8;
        if (qword_1000101A8)
        {
LABEL_12:
          if (*(int *)(v26 + 16) >= 3) {
            sub_100003D14(3u, v26, (uint64_t)"RPSocket.cpp", 600, (uint64_t)"RPSocketReadDictionary", 0, @"plist from %@ was not a dictionary\n", v25, a1);
          }
        }
        CFRelease(v23);
      }
      else
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 16) + 40);
        if (v29) {
          goto LABEL_32;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v29 = qword_1000101A8;
        if (qword_1000101A8)
        {
LABEL_32:
          if (*(int *)(v29 + 16) >= 3) {
            sub_100003D14(3u, v29, (uint64_t)"RPSocket.cpp", 589, (uint64_t)"RPSocketReadDictionary", 0, @"RPSocketReadBuffer failed from %@\n", v20, a1);
          }
        }
      }
      long long v23 = 0;
      goto LABEL_35;
    }
    uint64_t v28 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v28) {
      goto LABEL_25;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v28 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_25:
      if (*(int *)(v28 + 16) >= 3) {
        sub_100003D14(3u, v28, (uint64_t)"RPSocket.cpp", 583, (uint64_t)"RPSocketReadDictionary", 0, @"CFDataCreateMutable failed for len %d for %@\n", v12, v10);
      }
    }
  }
  return 0;
}

uint64_t sub_1000053F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1;
  }
  uint64_t v3 = a3;
  while (1)
  {
    unint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2, v3);
    if ((v6 & 0x8000000000000000) != 0) {
      break;
    }
    a2 += v6;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 16) + 224) + 8), v6, memory_order_relaxed);
    v3 -= v6;
    if (!v3) {
      return 1;
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 16) + 40);
  if (v9) {
    goto LABEL_11;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_11:
    if (*(int *)(v9 + 16) >= 3) {
      sub_100003D14(3u, v9, (uint64_t)"RPSocket.cpp", 618, (uint64_t)"RPSocketWrite", 0, @"failed to write %zu bytes to %@\n", v7, v3);
    }
  }
  return 0;
}

uint64_t sub_10000551C(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  if (a2)
  {
    CFDataRef v9 = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFDataRef v11 = v9;
    if (v9 && !error)
    {
      CFIndex Length = CFDataGetLength(v9);
      uint64_t v14 = Length;
      if (Length < 0x80000000)
      {
        int v26 = Length;
        if (sub_1000053F0(a1, (uint64_t)&v26, 4))
        {
          BytePtr = CFDataGetBytePtr(v11);
          if (sub_1000053F0(a1, (uint64_t)BytePtr, v14))
          {
            uint64_t v17 = 1;
LABEL_42:
            CFRelease(v11);
            goto LABEL_43;
          }
          uint64_t v23 = *(void *)(*(void *)(a1 + 16) + 40);
          if (v23) {
            goto LABEL_39;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v23 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_39:
            if (*(int *)(v23 + 16) >= 3) {
              sub_100003D14(3u, v23, (uint64_t)"RPSocket.cpp", 668, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to write length to %@\n", v21, a1);
            }
          }
        }
        else
        {
          uint64_t v22 = *(void *)(*(void *)(a1 + 16) + 40);
          if (v22) {
            goto LABEL_33;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v22 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_33:
            if (*(int *)(v22 + 16) >= 3) {
              sub_100003D14(3u, v22, (uint64_t)"RPSocket.cpp", 663, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to write length to %@\n", v19, a1);
            }
          }
        }
      }
      else
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 16) + 40);
        if (v15) {
          goto LABEL_9;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v15 = qword_1000101A8;
        if (qword_1000101A8)
        {
LABEL_9:
          if (*(int *)(v15 + 16) >= 3) {
            sub_100003D14(3u, v15, (uint64_t)"RPSocket.cpp", 658, (uint64_t)"RPSocketWriteDictionary", 0, @"data too big for %@: %lu\n", v13, a1);
          }
        }
      }
      uint64_t v17 = 0;
      goto LABEL_42;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v18) {
      goto LABEL_22;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v18 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_22:
      if (*(int *)(v18 + 16) >= 3) {
        sub_100003D14(3u, v18, (uint64_t)"RPSocket.cpp", 652, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to serialize dictionary to %@: %@\n", v10, a1);
      }
    }
    uint64_t v17 = 0;
    if (v11) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v16) {
      goto LABEL_15;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v16 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_15:
      if (*(int *)(v16 + 16) >= 3) {
        sub_100003D14(3u, v16, (uint64_t)"RPSocket.cpp", 646, (uint64_t)"RPSocketWriteDictionary", 0, @"no dictionary to send to %@\n", a8, a1);
      }
    }
    uint64_t v17 = 0;
  }
LABEL_43:
  if (error) {
    CFRelease(error);
  }
  return v17;
}

void sub_1000058A0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9 = (void *)a1[28];
  if (*v9 || v9[1])
  {
    uint64_t v10 = a1[5];
    if (v10) {
      goto LABEL_7;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v10 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_7:
      if (*(int *)(v10 + 16) >= 5) {
        sub_100003D14(5u, v10, (uint64_t)"RPSocket.cpp", 168, (uint64_t)"reset_stats", 0, @"Reset stats for %@ after reading %lld bytes and writing %lld bytes\n", a8, a1[1]);
      }
    }
    CFDataRef v11 = (void *)a1[28];
    *CFDataRef v11 = 0;
    v11[1] = 0;
  }
}

void sub_100005980(void *cf, uint64_t a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = cf[2];
  uint64_t v12 = *(void **)(v11 + 216);
  if (!v12)
  {
    uint64_t v12 = malloc_type_calloc(1uLL, 0x10000uLL, 0x39F2ED72uLL);
    uint64_t v11 = cf[2];
    *(void *)(v11 + 216) = v12;
  }
  if (a2 == 1)
  {
    uint64_t v14 = *(void *)(v11 + 40);
    if (v14) {
      goto LABEL_15;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v14 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_15:
      if (*(int *)(v14 + 16) >= 3) {
        sub_100003D14(3u, v14, (uint64_t)"RPSocket.cpp", 697, (uint64_t)"ExchangeDataHelper", 0, @"wrong kCFStreamEventOpenCompleted from %@\n", a8, (uint64_t)cf);
      }
    }
  }
  else
  {
    if (a2 == 16)
    {
      uint64_t v13 = *(void *)(v11 + 40);
      if (v13) {
        goto LABEL_9;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v13 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_9:
        if (*(int *)(v13 + 16) >= 3) {
          sub_100003D14(3u, v13, (uint64_t)"RPSocket.cpp", 691, (uint64_t)"ExchangeDataHelper", 0, @"kCFStreamEventEndEncountered from %@\n", a8, (uint64_t)cf);
        }
      }
    }
    else
    {
      unint64_t v15 = sub_100004D94((uint64_t)cf, (uint64_t)v12, 0x10000, a4, a5, a6, a7, a8);
      if (v15)
      {
        if (v15 == -1)
        {
          uint64_t v17 = *(void *)(cf[2] + 40);
          if (v17) {
            goto LABEL_23;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v17 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_23:
            if (*(int *)(v17 + 16) >= 3)
            {
              uint64_t v18 = __error();
              uint64_t v19 = strerror(*v18);
              CFStringRef v20 = CFStringCreateWithCString(0, v19, 0x8000100u);
              sub_100003D14(3u, v17, (uint64_t)"RPSocket.cpp", 703, (uint64_t)"ExchangeDataHelper", v20, @"RPSocketRead from %@", v21, (uint64_t)cf);
            }
          }
        }
        else
        {
          if (sub_1000053F0((uint64_t)a3, *(void *)(cf[2] + 216), v15)) {
            return;
          }
          uint64_t v24 = *(void *)(cf[2] + 40);
          if (v24) {
            goto LABEL_36;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v24 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_36:
            if (*(int *)(v24 + 16) >= 3) {
              sub_100003D14(3u, v24, (uint64_t)"RPSocket.cpp", 711, (uint64_t)"ExchangeDataHelper", 0, @"RPSocketWrite failed to %@", v23, (uint64_t)a3);
            }
          }
        }
      }
      else
      {
        uint64_t v22 = *(void *)(cf[2] + 40);
        if (v22) {
          goto LABEL_29;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v22 = qword_1000101A8;
        if (qword_1000101A8)
        {
LABEL_29:
          if (*(int *)(v22 + 16) >= 3) {
            sub_100003D14(3u, v22, (uint64_t)"RPSocket.cpp", 707, (uint64_t)"ExchangeDataHelper", 0, @"EOF from %@\n", v16, (uint64_t)cf);
          }
        }
      }
    }
    CFRetain(cf);
    CFRetain(a3);
    (*(void (**)(void))(*(void *)cf[2] + 32))(cf[2]);
    sub_1000048F8((uint64_t)cf);
    if (a3)
    {
      (*(void (**)(void *))(*a3[2] + 32))(a3[2]);
      sub_1000048F8((uint64_t)a3);
    }
  }
}

void sub_100005D78()
{
}

void sub_100005DD0()
{
}

uint64_t sub_100005DF4(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = sub_100006448(a1);
  *(void *)uint64_t v6 = off_10000C570;
  *(_DWORD *)(v6 + 232) = -1;
  *(_OWORD *)(v6 + 240) = 0u;
  *(_OWORD *)(v6 + 256) = 0u;
  *(_OWORD *)(v6 + 272) = 0u;
  *(_OWORD *)(v6 + 288) = 0u;
  *(_OWORD *)(v6 + 304) = 0u;
  *(_OWORD *)(v6 + 320) = 0u;
  *(_OWORD *)(v6 + 336) = 0u;
  *(_OWORD *)(v6 + 352) = 0u;
  *(void *)(v6 + 368) = 0;
  uint64_t v8 = *(void *)(v6 + 40);
  if (v8) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v8 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v8 + 16) >= 5) {
      sub_100003D14(5u, v8, (uint64_t)"RPSocket.cpp", 932, (uint64_t)"RPSocket_fd", 0, @"Creating RPSocket_fd: %p for fd: %d and mode: %d", v7, a1);
    }
  }
  *(_DWORD *)(a1 + 232) = a2;
  *(void *)(a1 + 240) = dispatch_queue_create("com.apple.PurpleReverseProxy.FDQueue", 0);
  int v34 = 1;
  if (setsockopt(*(_DWORD *)(a1 + 232), 0xFFFF, 4130, &v34, 4u) == -1)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      goto LABEL_12;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v9 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_12:
      if (*(int *)(v9 + 16) >= 3)
      {
        uint64_t v10 = __error();
        uint64_t v11 = strerror(*v10);
        CFStringRef v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
        sub_100003D14(3u, v9, (uint64_t)"RPSocket.cpp", 938, (uint64_t)"RPSocket_fd", v12, @"setsockopt for %@", v13, *(void *)(a1 + 8));
      }
    }
  }
  bzero(v44, 0x401uLL);
  bzero(v43, 0x401uLL);
  socklen_t v33 = 128;
  if (getsockname(a2, (sockaddr *)(a1 + 248), &v33))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      goto LABEL_19;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v14 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_19:
      if (*(int *)(v14 + 16) >= 3)
      {
        unint64_t v15 = __error();
        uint64_t v16 = strerror(*v15);
        CFStringRef v17 = CFStringCreateWithCString(0, v16, 0x8000100u);
        sub_100003D14(3u, v14, (uint64_t)"RPSocket.cpp", 949, (uint64_t)"RPSocket_fd", v17, @"getsockname for %@", v18, *(void *)(a1 + 8));
      }
    }
  }
  sub_1000065F4((uint64_t)v44, (sockaddr *)(a1 + 248));
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    sockaddr v35 = (sockaddr)0;
    long long v36 = 0u;
    socklen_t v32 = 128;
    if (getpeername(a2, &v35, &v32))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (v20) {
        goto LABEL_27;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v20 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_27:
        if (*(int *)(v20 + 16) >= 3)
        {
          uint64_t v21 = __error();
          uint64_t v22 = strerror(*v21);
          CFStringRef v23 = CFStringCreateWithCString(0, v22, 0x8000100u);
          sub_100003D14(3u, v20, (uint64_t)"RPSocket.cpp", 959, (uint64_t)"RPSocket_fd", v23, @"getpeername for %@", v24, *(void *)(a1 + 8));
        }
      }
    }
    sub_1000065F4((uint64_t)v43, &v35);
  }
  switch(a3)
  {
    case 2:
      uint64_t v26 = *(void *)(a1 + 40);
      if (v26) {
        goto LABEL_43;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v26 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_43:
        if (*(int *)(v26 + 16) >= 5) {
          sub_100003D14(5u, v26, (uint64_t)"RPSocket.cpp", 973, (uint64_t)"RPSocket_fd", 0, @"%@: accepted %s <- %s", v19, *(void *)(a1 + 8));
        }
      }
      break;
    case 1:
      uint64_t v27 = *(void *)(a1 + 40);
      if (v27) {
        goto LABEL_49;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v27 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_49:
        if (*(int *)(v27 + 16) >= 5) {
          sub_100003D14(5u, v27, (uint64_t)"RPSocket.cpp", 970, (uint64_t)"RPSocket_fd", 0, @"%@: listening on %s", v19, *(void *)(a1 + 8));
        }
      }
      break;
    case 0:
      uint64_t v25 = *(void *)(a1 + 40);
      if (v25) {
        goto LABEL_37;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v25 = qword_1000101A8;
      if (qword_1000101A8)
      {
LABEL_37:
        if (*(int *)(v25 + 16) >= 5) {
          sub_100003D14(5u, v25, (uint64_t)"RPSocket.cpp", 967, (uint64_t)"RPSocket_fd", 0, @"%@: with unknown mode with address: %s", v19, *(void *)(a1 + 8));
        }
      }
      break;
  }
  CFRetain(*(CFTypeRef *)(a1 + 8));
  uintptr_t v28 = *(int *)(a1 + 232);
  global_queue = dispatch_get_global_queue(0, 0);
  long long v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v28, 0, global_queue);
  *(void *)(a1 + 376) = v30;
  dispatch_set_context(v30, (void *)a1);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 376), (dispatch_function_t)sub_100006BCC);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 376), (dispatch_function_t)sub_100006BC4);
  return a1;
}

void sub_100006420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000067B0(v8, a2, a3, a4, a5, a6, a7, a8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006448(uint64_t a1)
{
  *(void *)a1 = &off_10000C628;
  *(void *)(a1 + 200) = 0;
  *(_DWORD *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  CFTypeID v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = v2;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 136), 0);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 64), 0);
  uint64_t v3 = sub_100004074((dispatch_once_t *)&off_100010090, 24);
  *(void *)(a1 + 8) = v3;
  if (v3)
  {
    *(void *)(v3 + 16) = a1;
LABEL_3:
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  if (qword_1000101A8)
  {
    if (*(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"RPSocket.cpp", 140, (uint64_t)"RPSocket", 0, @"could not allocate socket\n", v4, v6);
    }
    goto LABEL_3;
  }
LABEL_5:
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 5) {
    sub_100003D14(5u, qword_1000101A8, (uint64_t)"RPSocket.cpp", 144, (uint64_t)"RPSocket", 0, @"Creating RPSocket: %p (_sockRef: %p)", v4, a1);
  }
  return a1;
}

uint64_t sub_1000065F4(uint64_t result, sockaddr *a2)
{
  uint64_t v3 = result;
  int sa_family = a2->sa_family;
  if (sa_family != 30 && sa_family != 1 && !a2->sa_family)
  {
    *(_WORD *)(result + 8) = 62;
    uint64_t v5 = *(void *)"<unknown>";
LABEL_21:
    *(void *)uint64_t v3 = v5;
    return result;
  }
  if (sa_family == 30) {
    int v6 = 28;
  }
  else {
    int v6 = 0;
  }
  if (sa_family == 2) {
    int v7 = 16;
  }
  else {
    int v7 = v6;
  }
  if (a2->sa_len) {
    socklen_t sa_len = a2->sa_len;
  }
  else {
    socklen_t sa_len = v7;
  }
  unint64_t result = getnameinfo(a2, sa_len, v11, 0x401u, v10, 0x20u, 10);
  if (result)
  {
    if (a2->sa_family == 1)
    {
      unsigned int v9 = a2->sa_len - 2;
      if (v9 >= 0x68) {
        unsigned int v9 = 104;
      }
      if (v9) {
        return snprintf((char *)v3, 0x401uLL, "%s%.*s%s");
      }
    }
    *(_WORD *)(v3 + 8) = 62;
    uint64_t v5 = *(void *)"<unknown>";
    goto LABEL_21;
  }
  if (!v10[0] || *(unsigned __int16 *)v10 == 48) {
    v10[0] = 0;
  }
  return snprintf((char *)v3, 0x401uLL, "%s%s%s%s%s");
}

uint64_t sub_1000067B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &off_10000C628;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_100003D14(5u, v9, (uint64_t)"RPSocket.cpp", 110, (uint64_t)"~RPSocket", 0, @"Releasing RPSocket: %p (_sockRef: %p)", a8, a1);
    }
  }
  uint64_t v10 = *(const void **)(a1 + 32);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 40);
  if (v11) {
    CFRelease(v11);
  }
  CFStringRef v12 = *(const void **)(a1 + 16);
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = *(NSObject **)(a1 + 48);
  if (v13) {
    dispatch_release(v13);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 136));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 64));
  uint64_t v14 = *(void **)(a1 + 224);
  if (v14) {
    free(v14);
  }
  unint64_t v15 = *(void **)(a1 + 216);
  if (v15) {
    free(v15);
  }
  return a1;
}

void sub_1000068DC(void *a1)
{
}

uint64_t sub_100006900()
{
  return 0;
}

uint64_t sub_100006908()
{
  return 0;
}

uint64_t sub_100006910()
{
  return 0;
}

uint64_t sub_100006918()
{
  return 0;
}

uint64_t sub_100006924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006990(a1, 8, a3, a4, a5, a6, a7, a8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(void *)(a1 + 24) = 0;
  uint64_t v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
  *(void *)(a1 + 32) = 0;
  uint64_t v10 = *(const void **)(a1 + 40);
  if (v10) {
    CFRelease(v10);
  }
  *(void *)(a1 + 40) = 0;

  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
}

void sub_100006990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v10 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      sub_100003D14(5u, v10, (uint64_t)"RPSocket.cpp", 229, (uint64_t)"signal", 0, @"RPSocket %p (ref: %p): got signal with event %d and current _cb: %p", a8, a1);
    }
  }
  uint64_t v11 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  uint64_t v13 = *(void (**)(const void *, uint64_t, const void *))(a1 + 24);
  if (v13)
  {
    uint64_t v14 = *(const void **)(a1 + 32);
    uint64_t context = *(void *)(a1 + 24);
    CFTypeRef cf = v14;
    unint64_t v15 = *(NSObject **)(a1 + 48);
    if (v14) {
      CFRetain(v14);
    }
    if (v15) {
      dispatch_retain(v15);
    }
    uint64_t v16 = *(const void **)(a1 + 8);
    uint64_t v19 = v16;
    uint64_t v20 = a2;
    CFRetain(v16);
    pthread_mutex_unlock(v11);
    if (v15)
    {
      dispatch_sync_f(v15, &context, (dispatch_function_t)sub_100006BB4);
      dispatch_release(v15);
      uint64_t v16 = v19;
    }
    else
    {
      v13(v16, a2, v14);
    }
    sub_1000048F8((uint64_t)v16);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      goto LABEL_18;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v17 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_18:
      if (*(int *)(v17 + 16) >= 3) {
        sub_100003D14(3u, v17, (uint64_t)"RPSocket.cpp", 243, (uint64_t)"signal", 0, @"No client callback, missing event %d for socket %p", v12, a2);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  }
}

uint64_t sub_100006BB4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))a1)(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24));
}

void sub_100006BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006924(a1, a2, a3, a4, a5, a6, a7, a8);
  dispatch_sync_f(*(dispatch_queue_t *)(a1 + 240), (void *)a1, (dispatch_function_t)sub_100006C20);
  uint64_t v9 = *(void *)(a1 + 8);

  sub_1000048F8(v9);
}

uint64_t sub_100006C20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 120))();
}

uint64_t sub_100006C44(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 232);
  if (result != -1) {
    uint64_t result = close(result);
  }
  *(_DWORD *)(a1 + 232) = -1;
  return result;
}

uint64_t sub_100006C7C(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 232);
  if (result != -1) {
    return shutdown(result, 2);
  }
  return result;
}

void sub_100006C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006CCC(a1, a2, a3, a4, a5, a6, a7, a8);

  operator delete();
}

uint64_t sub_100006CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = off_10000C570;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_100003D14(5u, v9, (uint64_t)"RPSocket.cpp", 999, (uint64_t)"~RPSocket_fd", 0, @"Releasing RPSocket_fd: %p", a8, a1);
    }
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 376));
  dispatch_release(*(dispatch_object_t *)(a1 + 376));
  dispatch_release(*(dispatch_object_t *)(a1 + 240));

  return sub_1000067B0(a1, v10, v11, v12, v13, v14, v15, v16);
}

const void *sub_100006DC4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 232);
  socklen_t v25 = 4;
  if (qword_1000101C0 != -1) {
    dispatch_once(&qword_1000101C0, &stru_10000C4A0);
  }
  unsigned int v26 = 0;
  usleep(1000 * dword_100010088);
  if (getsockopt(v1, 6, 516, &v26, &v25))
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v2 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      uint64_t v3 = __error();
      uint64_t v4 = strerror(*v3);
      CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
      sub_100003D14(3u, v2, (uint64_t)"Utilities.c", 298, (uint64_t)"copyEntitlementsForSocketPeer", v5, @"getsockopt", v6, v24);
    }
    return 0;
  }
  uint64_t v7 = v26;
  uint64_t v27 = 0;
  if (!csops()) {
    return 0;
  }
  if (*__error() != 34)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v13 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      uint64_t v14 = __error();
      strerror(*v14);
      sub_100003D14(3u, v13, (uint64_t)"Utilities.c", 244, (uint64_t)"copyEntitlementsForPid", 0, @"csops1(%d): %s\n", v15, v7);
    }
    return 0;
  }
  uint64_t v8 = (UInt8 *)malloc_type_calloc(1uLL, bswap32(HIDWORD(v27)), 0x59FBFC9DuLL);
  if (csops())
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v10 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      uint64_t v11 = __error();
      strerror(*v11);
      sub_100003D14(3u, v10, (uint64_t)"Utilities.c", 252, (uint64_t)"copyEntitlementsForPid", 0, @"csops2(%d): %s\n", v12, v7);
    }
    if (!v8) {
      return 0;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)v8 != 1903288058)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"Utilities.c", 257, (uint64_t)"copyEntitlementsForPid", 0, @"bad magic 0x%08x\n", v9, *(unsigned int *)v8);
    }
    goto LABEL_18;
  }
  unsigned int v18 = bswap32(*((_DWORD *)v8 + 1));
  if (v18 < 9
    || (CFIndex v19 = v18 - 8,
        *((_DWORD *)v8 + 1) = v19,
        (CFDataRef v20 = CFDataCreateWithBytesNoCopy(0, v8 + 8, v19, kCFAllocatorNull)) == 0))
  {
LABEL_18:
    free(v8);
    return 0;
  }
  CFDataRef v21 = v20;
  CFPropertyListRef v22 = CFPropertyListCreateWithData(0, v20, 0, 0, 0);
  uint64_t v16 = v22;
  if (v22)
  {
    CFTypeID v23 = CFGetTypeID(v22);
    if (v23 != CFDictionaryGetTypeID())
    {
      CFRelease(v16);
      uint64_t v16 = 0;
    }
  }
  free(v8);
  CFRelease(v21);
  return v16;
}

uint64_t sub_1000071B8(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 249);
  if (v1 == 30 || v1 == 2) {
    return bswap32(*(unsigned __int16 *)(a1 + 250)) >> 16;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000071E0(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
LABEL_5:
    if (accept(*(_DWORD *)(a1 + 232), 0, 0) != -1)
    {
      sub_100005D78();
    }
    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      goto LABEL_18;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v19 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_18:
      if (*(int *)(v19 + 16) >= 3)
      {
        CFDataRef v20 = __error();
        CFDataRef v21 = strerror(*v20);
        CFStringRef v12 = CFStringCreateWithCString(0, v21, 0x8000100u);
        uint64_t v14 = "RPSocket.cpp";
        uint64_t v28 = *(void *)(a1 + 8);
        uint64_t v15 = "accept";
        CFStringRef v16 = @"accept for %@";
        uint64_t v17 = v19;
        uint64_t v18 = 1073;
        goto LABEL_20;
      }
    }
    return 0;
  }
  uintptr_t v4 = *(int *)(a1 + 232);
  int v5 = kqueue();
  if (v5 != -1)
  {
    int v6 = v5;
    timeout.tv_sec = (int)(a2 / 0x3B9ACA00);
    timeout.tv_nsec = a2 % 0x3B9ACA00;
    eventlist.ident = v4;
    *(_DWORD *)&eventlist.filter = 1179647;
    memset(&eventlist.fflags, 0, 20);
    int v7 = kevent(v5, &eventlist, 1, &eventlist, 1, &timeout);
    if (v7 == -1)
    {
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v22 = qword_1000101A8;
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
      {
        CFTypeID v23 = __error();
        uint64_t v24 = strerror(*v23);
        CFStringRef v25 = CFStringCreateWithCString(0, v24, 0x8000100u);
        sub_100003D14(3u, v22, (uint64_t)"Utilities.c", 216, (uint64_t)"WaitSocket", v25, @"kevent", v26, v28);
      }
      close(v6);
      return 0;
    }
    int v8 = v7;
    close(v6);
    if (v8 < 1) {
      return 0;
    }
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
  {
    uint64_t v10 = __error();
    uint64_t v11 = strerror(*v10);
    CFStringRef v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
    uint64_t v14 = "Utilities.c";
    uint64_t v15 = "WaitSocket";
    CFStringRef v16 = @"kqueue";
    uint64_t v17 = v9;
    uint64_t v18 = 206;
LABEL_20:
    sub_100003D14(3u, v17, (uint64_t)v14, v18, (uint64_t)v15, v12, v16, v13, v28);
  }
  return 0;
}

CFStringRef sub_1000074DC(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"fd fd=%d", *(unsigned int *)(a1 + 232));
}

void sub_100007514(NSObject **a1)
{
  dispatch_source_cancel(a1[47]);
  uint64_t v2 = a1[30];

  dispatch_sync_f(v2, a1, (dispatch_function_t)sub_100007564);
}

uint64_t sub_100007564(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 112))();
}

void sub_100007588(uint64_t a1)
{
}

void sub_100007590(uint64_t a1)
{
}

ssize_t sub_100007598(uint64_t a1, const void *a2, size_t a3)
{
  return write(*(_DWORD *)(a1 + 232), a2, a3);
}

ssize_t sub_1000075A0(uint64_t a1, void *a2, size_t a3)
{
  return read(*(_DWORD *)(a1 + 232), a2, a3);
}

CFStringRef sub_1000075A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 136));
  uint64_t v2 = *(const void **)(v1 + 16);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v1 + 16));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v1 + 136));
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1);
  uintptr_t v4 = (const void *)v3;
  if (v3) {
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"<RPSocket %p %p: %@ %@>", v1, *(void *)(v1 + 8), v2, v3);
  }
  else {
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"<RPSocket %p %p: %@>", v1, *(void *)(v1 + 8), v2);
  }
  CFStringRef v6 = v5;
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

uint64_t sub_100007680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(v9 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v10 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      sub_100003D14(5u, v10, (uint64_t)"RPSocket.cpp", 384, (uint64_t)"FinalizeRPSocket", 0, @"Closed %@ after reading %lld bytes and writing %lld bytes\n", a8, a1);
    }
  }
  if (*(void *)(v9 + 200))
  {
    uint64_t v11 = *(void *)(v9 + 40);
    if (v11) {
      goto LABEL_12;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v11 = qword_1000101A8;
    if (qword_1000101A8)
    {
LABEL_12:
      if (*(int *)(v11 + 16) >= 5) {
        sub_100003D14(5u, v11, (uint64_t)"RPSocket.cpp", 387, (uint64_t)"FinalizeRPSocket", 0, @"Ending os transaction for %@\n", a8, a1);
      }
    }
    os_release(*(void **)(v9 + 200));
    *(void *)(v9 + 200) = 0;
  }
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(*(void *)result + 88);
    return v13();
  }
  return result;
}

uint64_t sub_100007820(uint64_t a1)
{
  return off_1000101D8(*(void *)(a1 + 384));
}

void sub_100007830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006CCC(a1, a2, a3, a4, a5, a6, a7, a8);

  operator delete();
}

CFStringRef sub_10000786C(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"lockdown fd=%d", *(unsigned int *)(a1 + 232));
}

uint64_t sub_1000078A4(uint64_t a1)
{
  return off_1000101C8(*(void *)(a1 + 384));
}

uint64_t sub_1000078B4(uint64_t a1)
{
  return off_1000101D0(*(void *)(a1 + 384));
}

void sub_1000078C4(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1)
  {
    uint64_t v2 = v1;
    off_1000101C8 = (uint64_t (*)(void))dlsym(v1, "lockdown_send");
    off_1000101D0 = (uint64_t (*)(void))dlsym(v2, "lockdown_recv");
    off_1000101D8 = (uint64_t (*)(void))dlsym(v2, "lockdown_disconnect");
    off_1000101E0 = dlsym(v2, "lockdown_get_socket");
  }
}

uint64_t sub_100007954()
{
  if (qword_1000101F8 != -1) {
    dispatch_once(&qword_1000101F8, &stru_10000C540);
  }
  if (off_1000101F0) {
    operator new();
  }
  return 0;
}

void sub_100007A30()
{
}

void sub_100007A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007A9C(a1, a2, a3, a4, a5, a6, a7, a8);

  operator delete();
}

uint64_t sub_100007A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = off_10000C750;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_100003D14(5u, v9, (uint64_t)"RPSocket.cpp", 1226, (uint64_t)"~RPSocket_lockdown_service", 0, @"Releasing RPSocket_lockdown_service: %p", a8, a1);
    }
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 248));
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = (void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), i);
      if (ValueAtIndex) {
        (*(void (**)(void *))(*ValueAtIndex[2] + 32))(ValueAtIndex[2]);
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 248));
  free(*(void **)(a1 + 232));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 256));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 320));

  return sub_1000067B0(a1, v13, v14, v15, v16, v17, v18, v19);
}

const void *sub_100007C08(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    gettimeofday(&v16, 0);
    unint64_t v4 = a2 + 1000 * v16.tv_usec;
    __darwin_time_t tv_sec = v16.tv_sec;
    CFStringRef v6 = (pthread_mutex_t *)(a1 + 256);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
    if (v4)
    {
      __darwin_time_t v7 = tv_sec + v4 / 0x3B9ACA00;
      while (!CFArrayGetCount(*(CFArrayRef *)(a1 + 248)))
      {
        v15.__darwin_time_t tv_sec = v7;
        v15.tv_nsec = v4 % 0x3B9ACA00;
        int v8 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 320), (pthread_mutex_t *)(a1 + 256), &v15);
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 40);
          if (v9) {
            goto LABEL_10;
          }
          if (qword_1000101A0 != -1)
          {
            int v14 = v8;
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
            int v8 = v14;
          }
          uint64_t v9 = qword_1000101A8;
          if (qword_1000101A8)
          {
LABEL_10:
            if (*(int *)(v9 + 16) >= 3)
            {
              uint64_t v10 = *(void *)(a1 + 8);
              strerror(v8);
              sub_100003D14(3u, v9, (uint64_t)"RPSocket.cpp", 1280, (uint64_t)"accept", 0, @"pthread_cond_timedwait from %@: %s\n", v11, v10);
            }
          }
          break;
        }
      }
    }
  }
  else
  {
    CFStringRef v6 = (pthread_mutex_t *)(a1 + 256);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 248)) < 1)
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), 0);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 248), 0);
  }
  pthread_mutex_unlock(v6);
  return ValueAtIndex;
}

CFStringRef sub_100007DBC(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"lockdown_service service=%s", *(void *)(a1 + 232));
}

void sub_100007DF4()
{
}

uint64_t sub_100007E04(uint64_t result)
{
  if (!*(unsigned char *)(result + 240))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 232);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 0x40000000;
    v3[2] = sub_100007EA0;
    v3[3] = &unk_10000C7D8;
    v3[4] = v1;
    uint64_t result = off_1000101F0(v2, 0, 0, v3);
    *(unsigned char *)(v1 + 240) = 1;
  }
  return result;
}

void sub_100007EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v9 = qword_1000101A8;
  if (qword_1000101A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 7) {
      sub_100003D14(7u, v9, (uint64_t)"RPSocket.cpp", 1241, (uint64_t)"unpause_block_invoke", 0, @"got a %s connection for %@\n", a8, *(void *)(v8 + 232));
    }
  }
  if (qword_1000101E8 != -1) {
    dispatch_once(&qword_1000101E8, &stru_10000C500);
  }
  if (off_1000101C8 && off_1000101D0 && off_1000101D8 && off_1000101E0) {
    operator new();
  }
  pthread_mutex_lock((pthread_mutex_t *)(v8 + 256));
  CFArrayAppendValue(*(CFMutableArrayRef *)(v8 + 248), 0);
  CFRelease(0);
  pthread_cond_broadcast((pthread_cond_t *)(v8 + 320));
  pthread_mutex_unlock((pthread_mutex_t *)(v8 + 256));

  sub_100006990(v8, 2, v10, v11, v12, v13, v14, v15);
}

void sub_100008060()
{
}

void sub_100008084()
{
}

void sub_100008094()
{
}

void sub_1000080A4()
{
}

void sub_1000080B4(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1) {
    off_1000101F0 = (uint64_t (*)(void, void, void, void))dlsym(v1, "lockdown_checkin_xpc");
  }
}

void start(int a1, uint64_t a2)
{
  BOOL v3 = a1 >= 2 && (v2 = *(const char **)(a2 + 8)) != 0 && strcmp(v2, "--ramdisk") == 0;
  unint64_t v4 = sub_1000087F0("notify");
  if (!v4)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v6 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      CFStringRef v7 = @"notify socket checkin failed\n";
      uint64_t v8 = 381;
LABEL_51:
      sub_100003D14(3u, v6, (uint64_t)"PurpleReverseProxyService.c", v8, (uint64_t)"main", 0, v7, v5, v33);
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  uint64_t v9 = (uint64_t)v4;
  uint64_t v10 = sub_1000087F0("socks");
  if (!v10)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v6 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      CFStringRef v7 = @"socks socket checkin failed\n";
      uint64_t v8 = 387;
      goto LABEL_51;
    }
LABEL_52:
    exit(1);
  }
  uint64_t v11 = (uint64_t)v10;
  if (v3)
  {
    *(_OWORD *)long long v36 = xmmword_10000A9F0;
    *(_OWORD *)&v36[12] = *(long long *)((char *)&xmmword_10000A9F0 + 12);
    uint64_t v12 = (uint64_t)sub_1000087F0("ctrl");
    int v13 = socket(30, 1, 0);
    if (v13 != -1)
    {
      int v19 = v13;
      if (bind(v13, (const sockaddr *)v36, 0x1Cu) == -1)
      {
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v20 = qword_1000101A8;
        if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
        {
          CFDataRef v21 = __error();
          uint64_t v22 = strerror(*v21);
          CFStringRef v23 = CFStringCreateWithCString(0, v22, 0x8000100u);
          sub_100003D14(3u, v20, (uint64_t)"RPSocket.cpp", 1136, (uint64_t)"RPCreateSocketAcceptingWithAddress", v23, @"bind(port=%d)", v24, 0);
        }
      }
      else
      {
        if (listen(v19, 128) != -1) {
          sub_100005D78();
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v25 = qword_1000101A8;
        if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
        {
          uint64_t v26 = __error();
          uint64_t v27 = strerror(*v26);
          CFStringRef v28 = CFStringCreateWithCString(0, v27, 0x8000100u);
          sub_100003D14(3u, v25, (uint64_t)"RPSocket.cpp", 1141, (uint64_t)"RPCreateSocketAcceptingWithAddress", v28, @"listen(port=%d)", v29, 0);
        }
      }
      close(v19);
LABEL_44:
      uint64_t v14 = 0;
      if (v12)
      {
LABEL_45:
        if (v14)
        {
          BOOL v30 = (sub_1000043D4() & 1) == 0 && (MGGetBoolAnswer() & 1) != 0 && !v3;
          __int16 v31 = (*(uint64_t (**)(void))(**(void **)(v14 + 16) + 56))(*(void *)(v14 + 16));
          qword_100010200 = (uint64_t)CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 0x40000000;
          aBlock[2] = sub_10000896C;
          aBlock[3] = &unk_10000C818;
          aBlock[4] = v9;
          BOOL v41 = v30;
          sub_100004C28(v9, aBlock);
          *(void *)long long v36 = _NSConcreteStackBlock;
          *(void *)&v36[8] = 0x40000000;
          *(void *)&v36[16] = sub_100008AAC;
          *(void *)&v36[24] = &unk_10000C838;
          BOOL v39 = v30;
          uint64_t v37 = v11;
          uint64_t v38 = v14;
          sub_100004C28(v11, v36);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 0x40000000;
          v34[2] = sub_100009178;
          v34[3] = &unk_10000C878;
          v34[4] = v12;
          __int16 v35 = v31;
          sub_100004C28(v12, v34);
          sub_100004BB0(*(void *)(v9 + 16));
          sub_100004BB0(*(void *)(v12 + 16));
          sub_100004BB0(*(void *)(v11 + 16));
          if (!v3) {
            sub_100004BB0(*(void *)(v14 + 16));
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 7) {
            sub_100003D14(7u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 443, (uint64_t)"main", 0, @"proxy running\n", v32, v33);
          }
          CFRunLoopRun();
          exit(0);
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v6 = qword_1000101A8;
        if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
        {
          CFStringRef v7 = @"no conn listener\n";
          uint64_t v8 = 426;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
LABEL_26:
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v6 = qword_1000101A8;
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
      {
        CFStringRef v7 = @"no ctrl listener\n";
        uint64_t v8 = 421;
        goto LABEL_51;
      }
      goto LABEL_52;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v14 = qword_1000101A8;
    if (qword_1000101A8)
    {
      if (*(int *)(qword_1000101A8 + 16) >= 3)
      {
        uint64_t v15 = __error();
        timeval v16 = strerror(*v15);
        CFStringRef v17 = CFStringCreateWithCString(0, v16, 0x8000100u);
        sub_100003D14(3u, v14, (uint64_t)"RPSocket.cpp", 1123, (uint64_t)"RPCreateSocketAcceptingWithAddress", v17, @"socket(%d, SOCK_STREAM)", v18, 30);
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v12 = sub_100007954();
    uint64_t v14 = sub_100007954();
  }
  if (v12) {
    goto LABEL_45;
  }
  goto LABEL_26;
}

int *sub_1000087F0(const char *a1)
{
  size_t cnt = 0;
  fds = 0;
  int v2 = launch_activate_socket(a1, &fds, &cnt);
  if (v2)
  {
    int v4 = v2;
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v5 = qword_1000101A8;
    if (qword_1000101A8)
    {
      if (*(int *)(qword_1000101A8 + 16) >= 3)
      {
        uint64_t v9 = strerror(v4);
        sub_100003D14(3u, v5, (uint64_t)"PurpleReverseProxyService.c", 21, (uint64_t)"get_launchd_socket", 0, @"launch_activate_socket: %s\n", v6, (uint64_t)v9);
      }
    }
  }
  else
  {
    if (cnt)
    {
      int v8 = *fds;
      free(fds);
      if (v8 != -1) {
        sub_100005D78();
      }
      return 0;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 25, (uint64_t)"get_launchd_socket", 0, @"launch_activate_socket: no sockets for %s\n", v3, (uint64_t)a1);
    }
  }
  uint64_t result = fds;
  if (fds)
  {
    free(fds);
    return 0;
  }
  return result;
}

void sub_10000896C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = sub_1000096D0(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a4, a5, a6, a7, a8);
  if (v9)
  {
    uint64_t v11 = (uint64_t *)v9;
    sub_100004984(v9, @"NotifyConn");
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000;
    aBlock[2] = sub_100009DF0;
    aBlock[3] = &unk_10000C7F8;
    aBlock[4] = v11;
    sub_100004C28((uint64_t)v11, aBlock);
    sub_100004BB0(v11[2]);
    CFRelease(v11);
  }
  else
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v12 = qword_1000101A8;
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
    {
      sub_100003D14(3u, v12, (uint64_t)"PurpleReverseProxyService.c", 131, (uint64_t)"startProxy_block_invoke", 0, @"acceptConnection failed\n", v10, a9);
    }
  }
}

void sub_100008AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = sub_1000096D0(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 48), a4, a5, a6, a7, a8);
  if (v10)
  {
    uint64_t v12 = (uint64_t *)v10;
    pthread_mutex_lock(&stru_100010158);
    int v13 = (void **)qword_100010208;
    if (qword_100010208)
    {
      CFRetain((CFTypeRef)qword_100010208);
      int v14 = dword_100010198;
      pthread_mutex_unlock(&stru_100010158);
      int v78 = 1;
      if (sub_1000053F0((uint64_t)v13, (uint64_t)&v78, 4))
      {
        uint64_t v15 = sub_100004D0C(*(void *)(a1 + 40), 10000000000);
        if (v15)
        {
          CFStringRef v17 = (uint64_t *)v15;
          uint64_t v18 = malloc_type_malloc(0xAuLL, 0xCA344469uLL);
          if (sub_100004E9C((uint64_t)v17, (uint64_t)v18, 10, v19, v20, v21, v22, v23))
          {
            if (*(void *)v18 == 0x6E6F436F6C6C6548 && v18[4] == 110)
            {
              int v27 = 1;
              if (!v18)
              {
LABEL_18:
                if (v27)
                {
                  uint64_t v28 = random();
                  uint64_t v29 = random();
                  uint64_t v30 = random();
                  CFStringRef v31 = CFStringCreateWithFormat(0, 0, @"%08x%08x%08x", v28, v29, v30);
                  CFStringRef v39 = v31;
                  if (v14 == 1)
                  {
                    long long v40 = 0;
                    if (sub_1000053F0((uint64_t)v17, (uint64_t)"HelloConn", 10))
                    {
LABEL_57:
                      sub_100004984((uint64_t)v17, @"Host-%@", v39);
                      sub_100004984((uint64_t)v12, @"Client-%@", v39);
                      uint64_t v50 = *(void *)(v17[2] + 40);
                      if (v50) {
                        goto LABEL_61;
                      }
                      if (qword_1000101A0 != -1) {
                        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
                      }
                      uint64_t v50 = qword_1000101A8;
                      if (qword_1000101A8)
                      {
LABEL_61:
                        if (*(int *)(v50 + 16) >= 5) {
                          sub_100003D14(5u, v50, (uint64_t)"RPSocket.cpp", 726, (uint64_t)"RPSocketExchangeData", 0, @"RPSocketExchangeData:   %p  <==>  %p\n", v49, v17[2]);
                        }
                      }
                      sub_100004B38(v17[2]);
                      sub_100004B38(v12[2]);
                      sub_1000058A0((uint64_t *)v17[2], v51, v52, v53, v54, v55, v56, v57);
                      sub_1000058A0((uint64_t *)v12[2], v58, v59, v60, v61, v62, v63, v64);
                      uint64_t v70 = *(void *)(v17[2] + 40);
                      if (v70) {
                        goto LABEL_67;
                      }
                      if (qword_1000101A0 != -1) {
                        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
                      }
                      uint64_t v70 = qword_1000101A8;
                      if (qword_1000101A8)
                      {
LABEL_67:
                        if (*(int *)(v70 + 16) >= 5) {
                          sub_100003D14(5u, v70, (uint64_t)"RPSocket.cpp", 734, (uint64_t)"RPSocketExchangeData", 0, @"Beginning data exchange:   %@  <==>  %@\n", v69, (uint64_t)v17);
                        }
                      }
                      sub_100004A14(v17[2], (uint64_t)sub_100005980, v12, v65, v66, v67, v68, v69);
                      sub_100004A14(v12[2], (uint64_t)sub_100005980, v17, v71, v72, v73, v74, v75);
                      v76 = dispatch_queue_create("com.apple.PurpleReverseProxy.ExchangeData", 0);
                      sub_100004C90(v17[2], v76);
                      sub_100004C90(v12[2], v76);
                      dispatch_release(v76);
                      sub_100004BB0(v17[2]);
                      sub_100004BB0(v12[2]);
                      sub_100004BB0(v17[2]);
                      sub_100004BB0(v12[2]);
                      CFRelease(v12);
LABEL_41:
                      CFRelease(v13);
LABEL_42:
                      if (v17) {
                        CFRelease(v17);
                      }
                      if (v39) {
                        CFRelease(v39);
                      }
                      if (v40)
                      {
                        CFRelease(v40);
                      }
                      return;
                    }
                  }
                  else
                  {
                    long long v40 = sub_100004130(@"HelloConn", v32, v33, v34, v35, v36, v37, v38, @"Identifier", (uint64_t)v31);
                    sub_100004254(v40, @"ConnProtoVersion", 2);
                    if (sub_10000551C((uint64_t)v17, v40, v43, v44, v45, v46, v47, v48)) {
                      goto LABEL_57;
                    }
                  }
LABEL_38:
                  (*(void (**)(uint64_t))(*(void *)v12[2] + 32))(v12[2]);
                  if (v17) {
                    (*(void (**)(uint64_t))(*(void *)v17[2] + 32))(v17[2]);
                  }
                  CFRelease(v12);
                  if (!v13) {
                    goto LABEL_42;
                  }
                  goto LABEL_41;
                }
LABEL_37:
                CFStringRef v39 = 0;
                long long v40 = 0;
                goto LABEL_38;
              }
LABEL_17:
              free(v18);
              goto LABEL_18;
            }
            uint64_t v26 = *(void *)(v17[2] + 40);
            if (v26) {
              goto LABEL_14;
            }
            if (qword_1000101A0 != -1) {
              dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
            }
            uint64_t v26 = qword_1000101A8;
            if (qword_1000101A8)
            {
LABEL_14:
              if (*(int *)(v26 + 16) >= 3) {
                sub_100003D14(3u, v26, (uint64_t)"RPSocket.cpp", 559, (uint64_t)"RPSocketReceiveExpectedMessage", 0, @"invalid message from %@, expecting '%s'\n", v24, (uint64_t)v17);
              }
            }
          }
          int v27 = 0;
          if (!v18) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
          sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 231, (uint64_t)"startProxy_block_invoke_3", 0, @"RPSocketCreateAccepted failed\n", v16, (uint64_t)key);
        }
      }
      else
      {
        (*(void (**)(void *))(*v13[2] + 32))(v13[2]);
      }
    }
    else
    {
      pthread_mutex_unlock(&stru_100010158);
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
        sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 218, (uint64_t)"startProxy_block_invoke_3", 0, @"no current ctrl connection exists from the host so we can't accept socks connections right now\n", v42, (uint64_t)key);
      }
      int v13 = 0;
    }
    CFStringRef v17 = 0;
    goto LABEL_37;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v41 = qword_1000101A8;
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
  {
    sub_100003D14(3u, v41, (uint64_t)"PurpleReverseProxyService.c", 206, (uint64_t)"startProxy_block_invoke_3", 0, @"acceptConnection failed\n", v11, a9);
  }
}

void sub_100009178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v46 = -1;
  uint64_t v9 = sub_1000096D0(*(void *)(a1 + 32), a2, 0, a4, a5, a6, a7, a8);
  if (v9)
  {
    uint64_t v11 = (uint64_t *)v9;
    sub_100004984(v9, @"CtrlConn");
    if (sub_100004E9C((uint64_t)v11, (uint64_t)&v47, 10, v12, v13, v14, v15, v16))
    {
      if (v47 == 0x7274436E69676542 && v48 == 108)
      {
        CFDictionaryRef v29 = (const __CFDictionary *)sub_10000504C((uint64_t)v11, v17, v18, v19, v20, v21, v22, v23);
        CFDictionaryRef v26 = v29;
        if (v29)
        {
          if (sub_1000042B8(v29, @"CtrlProtoVersion", &v46))
          {
            if (v46 != 2)
            {
              if (qword_1000101A0 != -1) {
                dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
              }
              int v30 = qword_1000101A8;
              if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
              {
                uint64_t v44 = v46;
                sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 303, (uint64_t)"startProxy_block_invoke_4", 0, @"Mismatched ctrl proto version (expected %d, got %d); this may or may not work\n",
                  v36,
                  2);
              }
            }
            int v27 = sub_100004130(@"BeginCtrl", v30, v31, v32, v33, v34, v35, v36, 0, v44);
            sub_100004254(v27, @"CtrlProtoVersion", 2);
            sub_100004254(v27, @"ConnPort", *(unsigned __int16 *)(a1 + 40));
            if (sub_10000551C((uint64_t)v11, v27, v37, v38, v39, v40, v41, v42)) {
              goto LABEL_12;
            }
LABEL_45:
            (*(void (**)(uint64_t))(*(void *)v11[2] + 32))(v11[2]);
LABEL_46:
            CFRelease(v11);
            if (v26) {
              CFRelease(v26);
            }
            if (v27) {
              CFRelease(v27);
            }
            return;
          }
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
            sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 298, (uint64_t)"startProxy_block_invoke_4", 0, @"Host didn't specify ctrl proto version\n", v36, (uint64_t)key);
          }
        }
LABEL_44:
        int v27 = 0;
        goto LABEL_45;
      }
      if (v47 != 0x7274436F6C6C6548 || v48 != 108)
      {
        CFDictionaryRef v26 = 0;
        int v27 = 0;
LABEL_12:
        pthread_mutex_lock(&stru_100010158);
        if (qword_100010208)
        {
          (*(void (**)(void))(**(void **)(qword_100010208 + 16) + 32))(*(void *)(qword_100010208 + 16));
          sub_1000048F8(qword_100010208);
        }
        qword_100010208 = (uint64_t)v11;
        dword_100010198 = v46;
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 5) {
          sub_100003D14(5u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 327, (uint64_t)"startProxy_block_invoke_4", 0, @"got a ctrl connection from a host so we can now accept socks connections\n", v28, (uint64_t)key);
        }
        sub_100009994(1);
        CFRetain((CFTypeRef)qword_100010208);
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 0x40000000;
        aBlock[2] = sub_100009A18;
        aBlock[3] = &unk_10000C858;
        aBlock[4] = v11;
        sub_100004C28((uint64_t)v11, aBlock);
        sub_100004BB0(v11[2]);
        notify_post("com.apple.PurpleReverseProxy.ProxyOnline");
        pthread_mutex_unlock(&stru_100010158);
        goto LABEL_46;
      }
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
        sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 314, (uint64_t)"startProxy_block_invoke_4", 0, @"Host is using deprecated ReverseProxy protocol; allowing for now\n",
      }
          v23,
          (uint64_t)key);
      if (sub_1000053F0((uint64_t)v11, (uint64_t)"HelloCtrl", 10)
        && sub_1000053F0((uint64_t)v11, a1 + 40, 2))
      {
        CFDictionaryRef v26 = 0;
        int v27 = 0;
        unsigned int v46 = 1;
        goto LABEL_12;
      }
    }
    CFDictionaryRef v26 = 0;
    goto LABEL_44;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
    sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 282, (uint64_t)"startProxy_block_invoke_4", 0, @"acceptConnection failed\n", v10, (uint64_t)key);
  }
}

uint64_t sub_1000096D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 != 2)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 47, (uint64_t)"acceptConnection", 0, @"unknown event type %lu\n", a8, a2);
    }
LABEL_30:
    exit(1);
  }
  uint64_t v9 = sub_100004D0C(a1, 0);
  if (!v9)
  {
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3) {
      sub_100003D14(3u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 53, (uint64_t)"acceptConnection", 0, @"RPSocketCreateAccepted failed\n", v10, v20);
    }
    goto LABEL_30;
  }
  uint64_t v11 = v9;
  if (!a3) {
    return v11;
  }
  CFDictionaryRef v12 = (const __CFDictionary *)(*(uint64_t (**)(void))(**(void **)(v9 + 16) + 72))(*(void *)(v9 + 16));
  CFDictionaryRef v14 = v12;
  if (v12)
  {
    if (CFDictionaryGetValue(v12, @"com.apple.private.PurpleReverseProxy.allowed") == kCFBooleanTrue)
    {
LABEL_18:
      CFRelease(v14);
      return v11;
    }
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v15 = qword_1000101A8;
    if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
      goto LABEL_17;
    }
    CFStringRef v16 = @"client not entitled to use proxy\n";
    uint64_t v17 = 66;
    goto LABEL_16;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v15 = qword_1000101A8;
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
  {
    CFStringRef v16 = @"RPSocketCopyEntitlements failed\n";
    uint64_t v17 = 61;
LABEL_16:
    sub_100003D14(3u, v15, (uint64_t)"PurpleReverseProxyService.c", v17, (uint64_t)"acceptConnection", 0, v16, v13, v20);
  }
LABEL_17:
  (*(void (**)(void))(**(void **)(v11 + 16) + 32))(*(void *)(v11 + 16));
  sub_1000048F8(v11);
  uint64_t v11 = 0;
  if (v14) {
    goto LABEL_18;
  }
  return v11;
}

void sub_100009994(char a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100009C64;
  block[3] = &unk_10000C898;
  char v4 = a1;
  dispatch_async(global_queue, block);
}

uint64_t sub_100009A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int64_t v9 = sub_100004D94(*(void *)(a1 + 32), (uint64_t)v24, 10, a4, a5, a6, a7, a8);
  if (v9 < 1)
  {
    int64_t v15 = v9;
    if (qword_1000101A0 != -1) {
      dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
    }
    uint64_t v16 = qword_1000101A8;
    if (v15 == -1)
    {
      if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
        goto LABEL_15;
      }
      uint64_t v21 = __error();
      uint64_t v22 = strerror(*v21);
      CFStringRef v17 = CFStringCreateWithCString(0, v22, 0x8000100u);
      CFStringRef v12 = @"ctrl socket read";
      unsigned int v13 = 3;
      uint64_t v11 = v16;
      uint64_t v14 = 339;
      goto LABEL_14;
    }
    if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 7) {
      goto LABEL_15;
    }
    CFStringRef v12 = @"ctrl socket eof\n";
    unsigned int v13 = 7;
    uint64_t v11 = qword_1000101A8;
    uint64_t v14 = 341;
LABEL_13:
    CFStringRef v17 = 0;
LABEL_14:
    sub_100003D14(v13, v11, (uint64_t)"PurpleReverseProxyService.c", v14, (uint64_t)"startProxy_block_invoke_5", v17, v12, v10, v23);
    goto LABEL_15;
  }
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  uint64_t v11 = qword_1000101A8;
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 3)
  {
    CFStringRef v12 = @"unexpected data on ctrl socket\n";
    unsigned int v13 = 3;
    uint64_t v14 = 337;
    goto LABEL_13;
  }
LABEL_15:
  pthread_mutex_lock(&stru_100010158);
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18)
  {
    (*(void (**)(void))(**(void **)(v18 + 16) + 32))(*(void *)(v18 + 16));
    uint64_t v19 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (qword_100010208 == v19)
  {
    sub_1000048F8(v19);
    qword_100010208 = 0;
    dword_100010198 = -1;
    sub_100009994(0);
  }
  return pthread_mutex_unlock(&stru_100010158);
}

uint64_t sub_100009C64(uint64_t a1)
{
  pthread_mutex_lock(&stru_100010118);
  CFSetApplyFunction((CFSetRef)qword_100010200, (CFSetApplierFunction)sub_100009CC8, (void *)(a1 + 32));

  return pthread_mutex_unlock(&stru_100010118);
}

uint64_t sub_100009CC8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100009CD0(a1, *a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100009CD0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_1000101A0 != -1) {
    dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
  }
  if (qword_1000101A8 && *(int *)(qword_1000101A8 + 16) >= 5)
  {
    uint64_t v10 = "is not";
    if (a2) {
      uint64_t v10 = "is";
    }
    sub_100003D14(5u, qword_1000101A8, (uint64_t)"PurpleReverseProxyService.c", 94, (uint64_t)"sendANotification", 0, @"sending a client notification that the proxy %s online\n", a8, (uint64_t)v10);
  }
  int v13 = a2;
  uint64_t result = sub_1000053F0(a1, (uint64_t)&v13, 4);
  if ((result & 1) == 0 && a1)
  {
    CFStringRef v12 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 32);
    return v12();
  }
  return result;
}

void sub_100009DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v9 = (const __CFDictionary *)sub_10000504C(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    Value = CFDictionaryGetValue(v9, @"Command");
    if (Value)
    {
      int v13 = Value;
      if (CFEqual(Value, @"RegisterNotify"))
      {
        pthread_mutex_lock(&stru_100010118);
        CFSetAddValue((CFMutableSetRef)qword_100010200, *(const void **)(a1 + 32));
        pthread_mutex_unlock(&stru_100010118);
        pthread_mutex_lock(&stru_100010158);
        sub_100009CD0(*(void *)(a1 + 32), qword_100010208 != 0, v14, v15, v16, v17, v18, v19);
        pthread_mutex_unlock(&stru_100010158);
        CFRelease(v10);
        return;
      }
      if (CFEqual(v13, @"SetLogLevel"))
      {
        int v29 = 0;
        if (sub_1000042B8(v10, @"Level", &v29))
        {
          int v24 = v29;
          if (qword_1000101A0 != -1) {
            dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
          }
          uint64_t v25 = qword_1000101A8;
          if (v24 >= 7) {
            LODWORD(v26) = 7;
          }
          else {
            LODWORD(v26) = v24;
          }
          if (v24 < 0) {
            LODWORD(v26) = 0;
          }
          if (v24 == -1) {
            uint64_t v26 = 5;
          }
          else {
            uint64_t v26 = v26;
          }
          *(_DWORD *)(qword_1000101A8 + 16) = v26;
          if (v26 >= 3) {
            sub_100003D14(3u, v25, (uint64_t)"Logging.c", 111, (uint64_t)"SetDefaultLogLevel", 0, @"set default log level to %d (%s)\n", v12, v26);
          }
          goto LABEL_42;
        }
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v21 = qword_1000101A8;
        if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
          goto LABEL_42;
        }
        CFStringRef v22 = @"client dictionary has invalid level\n";
        uint64_t v23 = 166;
      }
      else
      {
        if (qword_1000101A0 != -1) {
          dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
        }
        uint64_t v21 = qword_1000101A8;
        if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
          goto LABEL_42;
        }
        CFStringRef v22 = @"unknown command from client\n";
        uint64_t v23 = 172;
      }
    }
    else
    {
      if (qword_1000101A0 != -1) {
        dispatch_once_f(&qword_1000101A0, &qword_1000101A8, (dispatch_function_t)sub_100003C34);
      }
      uint64_t v21 = qword_1000101A8;
      if (!qword_1000101A8 || *(int *)(qword_1000101A8 + 16) < 3) {
        goto LABEL_42;
      }
      CFStringRef v22 = @"client dictionary doesn't contain a command\n";
      uint64_t v23 = 146;
    }
    sub_100003D14(3u, v21, (uint64_t)"PurpleReverseProxyService.c", v23, (uint64_t)"startProxy_block_invoke_2", 0, v22, v12, v28);
LABEL_42:
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27) {
      (*(void (**)(void))(**(void **)(v27 + 16) + 32))(*(void *)(v27 + 16));
    }
    pthread_mutex_lock(&stru_100010118);
    CFSetRemoveValue((CFMutableSetRef)qword_100010200, *(const void **)(a1 + 32));
    pthread_mutex_unlock(&stru_100010118);
    CFRelease(v10);
    return;
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(void))(**(void **)(v20 + 16) + 32))(*(void *)(v20 + 16));
  }
  pthread_mutex_lock(&stru_100010118);
  CFSetRemoveValue((CFMutableSetRef)qword_100010200, *(const void **)(a1 + 32));

  pthread_mutex_unlock(&stru_100010118);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
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

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
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

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return _asl_log(client, msg, level, format);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
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

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int isatty(int a1)
{
  return _isatty(a1);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return _launch_activate_socket(name, fds, cnt);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
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

uint64_t random(void)
{
  return _random();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}