void sub_2BEC()
{
  untimeout();
}

uint64_t start(__CFBundle *a1)
{
  qword_8250 = (uint64_t)a1;
  qword_8258 = (uint64_t)CFBundleCopyBundleURL(a1);
  if (qword_8258)
  {
    CFRetain((CFTypeRef)qword_8250);
    add_options();
  }
  return 1;
}

void sub_2D3C(uint64_t a1, uint64_t a2)
{
  if (a2 != 8 || !dword_8244) {
    untimeout();
  }
  timeout((int)sub_3184);
}

uint64_t sub_2D84()
{
  return 1;
}

uint64_t sub_2DBC(const char *a1)
{
  if (byte_8240) {
    return 1;
  }
  else {
    return dialog_password((char *)&username_ptr, 256, (char *)&new_passwd_ptr, 256, 2, a1);
  }
}

uint64_t sub_2DF4(const char *a1)
{
  if (!byte_8240)
  {
    uint64_t result = dialog_password((char *)&username_ptr, 256, (char *)&passwd_ptr, 256, 1, a1);
    if (!result) {
      return result;
    }
    strncpy((char *)&user_ptr, (const char *)&username_ptr, 0x100uLL);
  }
  return 1;
}

uint64_t sub_2E58()
{
  return 1;
}

uint64_t dialog_reminder_thread()
{
  v0 = pthread_self();
  if (pthread_detach(v0)) {
    return 0;
  }
  double v1 = 30.0;
  if (dword_8244 >= 300)
  {
    if (dword_8244 >= 0x258)
    {
      if (dword_8244 >= 0x4B0)
      {
        if (dword_8244 >= 0x708) {
          int v3 = 240;
        }
        else {
          int v3 = 180;
        }
        double v1 = (double)v3;
        goto LABEL_12;
      }
      uint64_t v2 = 0x405E000000000000;
    }
    else
    {
      uint64_t v2 = 0x404E000000000000;
    }
    double v1 = *(double *)&v2;
  }
LABEL_12:
  int v4 = 3;
  CFOptionFlags responseFlags = 3;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v6 = Mutable;
    CFURLRef v7 = CFBundleCopyResourceURL((CFBundleRef)qword_8250, @"NetworkConnect.icns", 0, 0);
    if (v7)
    {
      CFURLRef v8 = v7;
      CFDictionaryAddValue(v6, kCFUserNotificationIconURLKey, v7);
      CFRelease(v8);
    }
    SInt32 error = 0;
    CFDictionaryAddValue(v6, kCFUserNotificationLocalizationURLKey, (const void *)qword_8258);
    if (dword_8248) {
      CFStringRef v9 = @"VPN Connection";
    }
    else {
      CFStringRef v9 = @"Network Connection";
    }
    CFDictionaryAddValue(v6, kCFUserNotificationAlertHeaderKey, v9);
    CFDictionaryAddValue(v6, kCFUserNotificationAlertMessageKey, @"Reminder timeout");
    CFDictionaryAddValue(v6, kCFUserNotificationDefaultButtonTitleKey, @"Stay connected");
    CFDictionaryAddValue(v6, kCFUserNotificationAlternateButtonTitleKey, @"Disconnect");
    v10 = CFUserNotificationCreate(0, v1, 2uLL, &error, v6);
    if (v10)
    {
      v11 = v10;
      CFUserNotificationReceiveResponse(v10, v1, &responseFlags);
      CFRelease(v11);
    }
    CFRelease(v6);
    int v4 = responseFlags & 3;
  }
  dword_8260 = v4;
  return 0;
}

void dialog_reminder_watch()
{
  if (!dword_8260)
  {
    timeout((int)sub_3184);
    untimeout();
  }
  if (dword_8260 != -1) {
    lcp_close();
  }

  timeout((int)dialog_reminder_watch);
}

void sub_3184()
{
  dword_8260 = -1;
  if (!pthread_create(&qword_8280, 0, (void *(__cdecl *)(void *))dialog_reminder_thread, 0))
  {
    timeout((int)dialog_reminder_watch);
  }
}

uint64_t dialog_password(char *a1, int a2, char *a3, int a4, int a5, const char *a6)
{
  int v8 = 0;
  CFIndex Count = 0;
  CFOptionFlags responseFlags = 0;
  if (a5 == 2) {
    CFOptionFlags v9 = 196608;
  }
  else {
    CFOptionFlags v9 = 0x20000;
  }
  SInt32 error = 0;
  CFIndex v53 = a2;
  CFIndex v51 = a4;
  CFStringRef v10 = kCFUserNotificationAlertMessageKey;
  while (1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable) {
      return 0;
    }
    v12 = Mutable;
    CFURLRef v13 = CFBundleCopyResourceURL((CFBundleRef)qword_8250, @"NetworkConnect.icns", 0, 0);
    if (v13)
    {
      CFURLRef v14 = v13;
      CFDictionaryAddValue(v12, kCFUserNotificationIconURLKey, v13);
      CFRelease(v14);
    }
    if (a6)
    {
      CFStringRef v15 = CFStringCreateWithCString(0, a6, 0x8000100u);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFDictionaryAddValue(v12, v10, v15);
        CFRelease(v16);
      }
    }
    if (a5 == 1)
    {
      BOOL v17 = &tokencard_ptr == 1;
      CFStringRef v18 = @"Incorrect password";
      CFStringRef v19 = @"Incorrect token";
    }
    else
    {
      if (a5 != 2) {
        goto LABEL_19;
      }
      BOOL v17 = &tokencard_ptr == 1;
      CFStringRef v18 = @"Expired password";
      CFStringRef v19 = @"Expired token";
    }
    if (v17) {
      CFStringRef v20 = v19;
    }
    else {
      CFStringRef v20 = v18;
    }
    CFDictionaryAddValue(v12, v10, v20);
LABEL_19:
    v21 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (v21)
    {
      v22 = v21;
      if (a5 == 1)
      {
        CFArrayAppendValue(v21, @"Retry name:");
        BOOL v24 = &tokencard_ptr == 1;
        CFStringRef v25 = @"Retry password:";
        CFStringRef v26 = @"Retry token:";
      }
      else if (a5 == 2)
      {
        if (&tokencard_ptr == 1) {
          CFStringRef v23 = @"New token:";
        }
        else {
          CFStringRef v23 = @"New password:";
        }
        CFArrayAppendValue(v21, v23);
        BOOL v24 = &tokencard_ptr == 1;
        CFStringRef v25 = @"Confirm new password:";
        CFStringRef v26 = @"Confirm new token:";
      }
      else
      {
        CFArrayAppendValue(v21, @"Account Name:");
        BOOL v24 = &tokencard_ptr == 1;
        CFStringRef v25 = @"Password:";
        CFStringRef v26 = @"Token:";
      }
      if (v24) {
        CFStringRef v27 = v26;
      }
      else {
        CFStringRef v27 = v25;
      }
      CFArrayAppendValue(v22, v27);
      CFIndex Count = CFArrayGetCount(v22);
      CFDictionaryAddValue(v12, kCFUserNotificationTextFieldTitlesKey, v22);
      CFRelease(v22);
    }
    CFMutableArrayRef v28 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (v28)
    {
      v29 = v28;
      if (a5 != 2)
      {
        CFStringRef v30 = CFStringCreateWithCString(0, a1, 0x8000100u);
        if (v30)
        {
          CFStringRef v31 = v30;
          CFArrayAppendValue(v29, v30);
          CFRelease(v31);
        }
      }
      CFDictionaryAddValue(v12, kCFUserNotificationTextFieldValuesKey, v29);
      CFRelease(v29);
    }
    CFDictionaryAddValue(v12, kCFUserNotificationLocalizationURLKey, (const void *)qword_8258);
    if (dword_8248) {
      CFStringRef v32 = @"VPN Connection";
    }
    else {
      CFStringRef v32 = @"Network Connection";
    }
    CFDictionaryAddValue(v12, kCFUserNotificationAlertHeaderKey, v32);
    if (v8)
    {
      if (&tokencard_ptr == 1) {
        CFStringRef v33 = @"Incorrectly entered token";
      }
      else {
        CFStringRef v33 = @"Incorrectly entered password";
      }
      CFDictionaryAddValue(v12, v10, v33);
    }
    CFDictionaryAddValue(v12, kCFUserNotificationAlternateButtonTitleKey, @"Cancel");
    CFOptionFlags responseFlags = v9;
    CFOptionFlags v34 = v9;
    if (Count >= 1)
    {
      v35 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      v36 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      uint64_t v56 = 1;
      CFNumberRef v37 = CFNumberCreate(0, kCFNumberIntType, (char *)&v56 + 4);
      CFNumberRef v38 = CFNumberCreate(0, kCFNumberIntType, &v56);
      CFNumberRef v39 = v38;
      if (v35 && v36 && v37 && v38)
      {
        v40 = a6;
        CFIndex v41 = Count;
        do
        {
          CFArrayAppendValue(v35, v37);
          CFArrayAppendValue(v36, v39);
          --v41;
        }
        while (v41);
        CFDictionarySetValue(v12, @"SBUserNotificationTextAutocapitalizationType", v35);
        CFDictionarySetValue(v12, @"SBUserNotificationTextAutocorrectionType", v36);
        a6 = v40;
      }
      if (v35) {
        CFRelease(v35);
      }
      if (v36) {
        CFRelease(v36);
      }
      CFStringRef v10 = kCFUserNotificationAlertMessageKey;
      if (v37) {
        CFRelease(v37);
      }
      if (v39) {
        CFRelease(v39);
      }
      CFOptionFlags v34 = responseFlags;
    }
    v42 = CFUserNotificationCreate(0, 0.0, v34, &error, v12);
    qword_8268 = (uint64_t)v42;
    if (!v42)
    {
      CFRelease(v12);
      return 0;
    }
    CFUserNotificationReceiveResponse(v42, 0.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      char v43 = 0;
      uint64_t v44 = 0;
    }
    else
    {
      CFStringRef ResponseValue = CFUserNotificationGetResponseValue((CFUserNotificationRef)qword_8268, kCFUserNotificationTextFieldValuesKey, 0);
      CFStringRef v46 = CFUserNotificationGetResponseValue((CFUserNotificationRef)qword_8268, kCFUserNotificationTextFieldValuesKey, 1);
      CFStringRef v47 = v46;
      if (ResponseValue) {
        BOOL v48 = v46 == 0;
      }
      else {
        BOOL v48 = 1;
      }
      int v49 = !v48;
      if (a5 == 2)
      {
        if (!v49 || CFStringCompare(ResponseValue, v46, 0)) {
          goto LABEL_79;
        }
      }
      else if (!v49 || !CFStringGetCString(ResponseValue, a1, v53, 0x8000100u))
      {
LABEL_79:
        uint64_t v44 = 0xFFFFFFFFLL;
        char v43 = 1;
        goto LABEL_80;
      }
      if (!CFStringGetCString(v47, a3, v51, 0x8000100u)) {
        goto LABEL_79;
      }
      char v43 = 0;
      uint64_t v44 = 1;
    }
LABEL_80:
    CFRelease((CFTypeRef)qword_8268);
    qword_8268 = 0;
    CFRelease(v12);
    ++v8;
    if ((v43 & 1) == 0) {
      return v44;
    }
  }
}

uint64_t dialog_invoke_ui_thread()
{
  if (pipe(&dword_8270) < 0) {
    error();
  }
  if (pthread_create(&qword_8278, 0, (void *(__cdecl *)(void *))sub_3994, 0)) {
    error();
  }
  char v5 = 0;
  int v0 = dword_8270;
  int v1 = 1;
  uint64_t v2 = &v5;
  do
  {
    ssize_t v3 = read(v0, v2, v1);
    if (v3 < 0)
    {
      if (&kill_link_ptr || *__error() != 4)
      {
        close(dword_8270);
        dword_8270 = -1;
        close(dword_8274);
        dword_8274 = -1;
        goto LABEL_17;
      }
      ssize_t v3 = 0;
    }
    else if (!v3)
    {
      break;
    }
    v1 -= v3;
    v2 += v3;
  }
  while (v1 > 0);
  close(dword_8270);
  dword_8270 = -1;
  close(dword_8274);
  dword_8274 = -1;
  if (v1 <= 0)
  {
    uint64_t result = v5;
    if (result == 1)
    {
      strncpy((char *)&user_ptr, (const char *)&username_ptr, 0x100uLL);
      return 1;
    }
    return result;
  }
LABEL_17:
  uint64_t result = qword_8268;
  if (qword_8268)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_8268);
    return 0;
  }
  return result;
}

uint64_t sub_3994()
{
  BOOL __buf = 0;
  int v0 = pthread_self();
  if (!pthread_detach(v0)) {
    BOOL __buf = dialog_password((char *)&username_ptr, 256, (char *)&passwd_ptr, 256, 0, 0) != 0;
  }
  if (dword_8274 != -1) {
    write(dword_8274, &__buf, 1uLL);
  }
  return 0;
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

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return _CFBundleCopyBundleURL(bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

int *__error(void)
{
  return ___error();
}

void add_notifier()
{
  while (1)
    ;
}

void add_options()
{
  while (1)
    ;
}

int close(int a1)
{
  return _close(a1);
}

void error()
{
  while (1)
    ;
}

void lcp_close()
{
  while (1)
    ;
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

void timeout(int a1)
{
  while (1)
    ;
}

void untimeout()
{
  while (1)
    ;
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}