void sub_100001064()
{
  double Current;
  int v1;
  char *v2;
  int v3;
  size_t v4;
  const char *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  size_t size;
  int v9[4];
  uint64_t v10;

  v7 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog()) {
    _DLLog();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  Current = CFAbsoluteTimeGetCurrent();
  v1 = 0;
  while (1)
  {
    if (!v1) {
      goto LABEL_11;
    }
    if (v1 == -1) {
      break;
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    sleep(1u);
LABEL_11:
    v10 = 0;
    *(_OWORD *)v9 = xmmword_100005E68;
    size = 0;
    v1 = sysctl(v9, 3u, 0, &size, 0, 0);
    if (!v1)
    {
      v2 = (char *)malloc_type_malloc(size, 0x1EB90317uLL);
      v3 = sysctl(v9, 3u, v2, &size, 0, 0);
      if (v3)
      {
        v1 = v3;
      }
      else
      {
        if (size < 0x288)
        {
LABEL_20:
          free(v2);
          v1 = -1;
          goto LABEL_21;
        }
        v4 = size / 0x288;
        v5 = v2 + 243;
        while (1)
        {
          v1 = *(_DWORD *)(v5 - 203);
          if (v1 >= 1 && !strncmp("DataMigrator", v5, 0x10uLL)) {
            break;
          }
          v5 += 648;
          if (!--v4) {
            goto LABEL_20;
          }
        }
      }
      free(v2);
    }
LABEL_21:
    if (CFAbsoluteTimeGetCurrent() - Current > 60.0)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      if (DLDisconnect())
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        DLKillConnection();
      }
      return;
    }
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  if (DLDeviceReady())
  {
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  else
  {
    *(void *)(v7 + 56) = kCFBooleanTrue;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSync.SyncAgent.kSyncAgentSyncStarted", 0, 0, 0);
    sub_100003C34();
  }
}

uint64_t sub_1000013F8()
{
  if (DLShouldLog()) {
    _DLLog();
  }

  return sub_100003C34();
}

uint64_t sub_100001448()
{
  uint64_t result = DLShouldLog();
  if (result) {
    return _DLLog();
  }
  return result;
}

void sub_1000014A0()
{
  if (DLShouldLog()) {
    _DLLog();
  }
  exit(0);
}

id sub_1000014F0(uint64_t a1, uint64_t a2)
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v4 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v9 = a2;
    _DLLog();
  }
  if (*(const CFBooleanRef *)(v4 + 48) == kCFBooleanTrue)
  {
    if (j__DLDeleteDeviceLinkConnection() && DLShouldLog()) {
      _DLLog();
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (DLShouldLog()) {
      _DLLog();
    }
  }
  else
  {
    if (dword_10000C0D0 == 1)
    {
      CFDictionaryRef v5 = (const __CFDictionary *)DLGetDeviceLinkConnectionInfo();
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
      if (!sub_1000039D4(MutableCopy, dword_10000C0D0))
      {
        if (DLShouldLog()) {
          _DLLog();
        }
        [v3 drain:v9];
        exit(0);
      }
    }
    else
    {
      MutableCopy = 0;
    }
    if (DLWaitForConnection() && DLShouldLog()) {
      _DLLog();
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  sub_100003CC8(v4);
  sub_100004150();
  byte_10000C329 = 0;
  SBSSetStatusBarShowsSyncActivity();
  return [v3 drain];
}

id sub_10000172C(uint64_t a1)
{
  if (DLShouldLog()) {
    _DLLog();
  }

  return sub_1000014F0(a1, @"Lost connection");
}

uint64_t sub_100001794()
{
  uint64_t result = DLShouldLog();
  if (result) {
    return _DLLog();
  }
  return result;
}

uint64_t sub_1000017EC()
{
  uint64_t result = DLShouldLog();
  if (result) {
    return _DLLog();
  }
  return result;
}

id sub_100001844(uint64_t a1, const void *a2, NSDictionary *a3, const __CFBoolean *a4, uint64_t a5)
{
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v44[0] = 0;
  DLGetDeviceLinkConnectionContext();
  if (!a3) {
    a3 = +[NSDictionary dictionary];
  }
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a3);
  if (DLShouldLog())
  {
    v12 = "s";
    if (Count == 1) {
      v12 = "";
    }
    CFBooleanRef v41 = a4;
    uint64_t v42 = a5;
    v38 = a2;
    CFTypeRef v39 = (CFTypeRef)Count;
    v40 = v12;
    _DLLog();
  }
  if (SyncPlaybackEnabled())
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v14 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(v14, a2);
    CFArrayAppendValue(Mutable, v14);
    CFRelease(v14);
    CFDictionaryApplyFunction((CFDictionaryRef)a3, (CFDictionaryApplierFunction)sub_100003F4C, Mutable);
    v15 = &selRef_dictionary;
    if (!qword_10000C338) {
      qword_10000C338 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    }
    if (CFArrayGetCount(Mutable) >= 2) {
      CFArrayAppendValue((CFMutableArrayRef)qword_10000C338, Mutable);
    }
    if (kCFBooleanFalse == a4)
    {
      if (qword_10000C338 && CFArrayGetCount((CFArrayRef)qword_10000C338))
      {
        if (qword_10000C340)
        {
          CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C340, @"data class", a2);
          CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_10000C338, 0, (const void *)qword_10000C340);
        }
        v44[1] = 0;
        if (DLShouldLog()) {
          _DLLog();
        }
        CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"%@/%@", @"/Library/Logs/MobileSync", a2, v40, v41, v42);
        if (DLShouldLog())
        {
          v38 = v16;
          _DLLog();
        }
        size_t v17 = CFStringGetLength(v16) + 24;
        v18 = (char *)malloc_type_malloc(v17, 0xB2FACFD8uLL);
        if (v18)
        {
          v19 = v18;
          CFIndex Length = CFStringGetLength(v16);
          v21 = (char *)malloc_type_malloc(Length + 1, 0x40612E16uLL);
          CFIndex v22 = CFStringGetLength(v16);
          if (!CFStringGetCString(v16, v21, v22 + 1, 0x600u) && DLShouldLog()) {
            _DLLog();
          }
          id v43 = v10;
          DLEnsureDirectoryExists();
          if (v16) {
            CFRelease(v16);
          }
          int v23 = 0;
          memset(&v45, 0, sizeof(v45));
          do
          {
            int v24 = v23 + 1;
            snprintf(v19, v17, "%s/%s.%02d.plist", v21, "SyncPlayback", v23);
            int v25 = stat(v19, &v45);
            int v23 = v24;
          }
          while (!v25);
          CFStringRef v26 = CFStringCreateWithCString(0, v19, 0x600u);
          free(v19);
          id v10 = v43;
          v15 = &selRef_dictionary;
        }
        else
        {
          if (v16) {
            CFRelease(v16);
          }
          if (DLShouldLog())
          {
            v38 = (const void *)v17;
            _DLLog();
          }
          CFStringRef v26 = 0;
        }
        CFIndex v27 = CFStringGetLength(v26);
        v28 = (char *)malloc_type_malloc(v27 + 1, 0x90B9DA6DuLL);
        CFIndex v29 = CFStringGetLength(v26);
        if (!CFStringGetCString(v26, v28, v29 + 1, 0x600u) && DLShouldLog()) {
          _DLLog();
        }
        if (v26) {
          CFRelease(v26);
        }
        size_t v30 = strlen(v28);
        CFURLRef v31 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v28, v30, 0);
        if (!DLWritePropertyListToFile() && DLShouldLog()) {
          _DLLog();
        }
        if (v31) {
          CFRelease(v31);
        }
        free(v28);
      }
      else if (DLShouldLog())
      {
        _DLLog();
      }
      v32 = v15[103];
      if (v32)
      {
        CFRelease(v32);
        v15[103] = 0;
      }
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  uint64_t v33 = DataSourceProcessChanges();
  if (v33)
  {
    uint64_t v34 = v33;
    if (DLShouldLog())
    {
      v38 = (const void *)v34;
      CFTypeRef v39 = v44[0];
      _DLLog();
    }
    if (v44[0])
    {
      CFRelease(v44[0]);
      v44[0] = 0;
    }
  }
  uint64_t v35 = sub_100005534(a1, (uint64_t)a2, 0, (uint64_t)v44);
  if (v35)
  {
    uint64_t v36 = v35;
    if (DLShouldLog())
    {
      v38 = (const void *)v36;
      CFTypeRef v39 = v44[0];
      _DLLog();
    }
    if (v44[0])
    {
      CFRelease(v44[0]);
      v44[0] = 0;
    }
  }
  return [v10 drain:v38, v39];
}

id sub_100001E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v6 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v10 = a2;
    uint64_t v11 = a3;
    _DLLog();
  }
  sub_100003CC8(v6);
  uint64_t v7 = DLWaitForMessage();
  if (v7)
  {
    uint64_t v8 = v7;
    if (DLShouldLog())
    {
      uint64_t v10 = v8;
      uint64_t v11 = 0;
      _DLLog();
    }
  }
  return [v5 drain:v10, v11];
}

id sub_100001F58(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, const __CFNumber *a5, const __CFDictionary *a6)
{
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  CFTypeRef cf = 0;
  uint64_t v11 = (void *)DLGetDeviceLinkConnectionContext();
  if (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEphemeralMultiUser"))
  {
    if (DLShouldLog())
    {
      uint64_t v29 = (uint64_t)a2;
      _DLLog();
    }
    CFStringRef v12 = @"This data class is disabled for tethered syncing on the device.";
LABEL_67:
    uint64_t v26 = sub_100005340(a1, (uint64_t)a2, (uint64_t)v12, (uint64_t)&cf);
    if (v26)
    {
      uint64_t v27 = v26;
      if (DLShouldLog())
      {
        uint64_t v29 = v27;
        CFTypeRef v30 = cf;
        _DLLog();
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    return [v10 drain:v29, v30];
  }
  *uint64_t v11 = CFRetain(a2);
  int valuePtr = 0;
  if (a5) {
    CFNumberGetValue(a5, kCFNumberIntType, &valuePtr);
  }
  v13 = objc_opt_new();
  if (a6) {
    [v13 setValue:CFDictionaryGetValue(a6, @"HostVersion") forKey:@"hostOS"];
  }
  [v13 setValue:a2 forKey:@"dataClass"];
  if (AnalyticsSendEventLazy())
  {
    if (!DLShouldLog()) {
      goto LABEL_14;
    }
  }
  else if (!DLShouldLog())
  {
    goto LABEL_14;
  }
  _DLLog();
LABEL_14:
  v14 = 0;
  if (CFEqual(a2, @"com.apple.Calendars"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v14 = Mutable;
    if (valuePtr <= 109) {
      CFDictionarySetValue(Mutable, kShouldSendAllCalendarsOnFastSyncKey, kCFBooleanTrue);
    }
    CFDictionarySetValue(v14, kShouldSyncCalendarColors, kCFBooleanTrue);
    CFDictionarySetValue(v14, kShouldSyncAttendeesAndOrganizers, kCFBooleanTrue);
    CFDictionarySetValue(v14, kIsEventsOnlySource, kCFBooleanTrue);
    CFDictionarySetValue(v14, kIsTetheredSync, kCFBooleanTrue);
  }
  if (CFStringCompare(a2, @"com.apple.Bookmarks", 0))
  {
LABEL_19:
    dataTypeForDataClassName();
    if (GetTetheredSyncingDisabledForDataType() && DLShouldLog())
    {
      uint64_t v29 = (uint64_t)a2;
      _DLLog();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    uint64_t DataSourceForDataClassName = CreateDataSourceForDataClassName();
    if (v14) {
      CFRelease(v14);
    }
    if (DataSourceForDataClassName)
    {
      if (DLShouldLog())
      {
        uint64_t v29 = DataSourceForDataClassName;
        CFTypeRef v30 = cf;
        _DLLog();
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      CFStringRef v12 = @"No Data Store available for data class";
      goto LABEL_67;
    }
    uint64_t Version = DataSourceGetVersion();
    if (Version)
    {
      uint64_t v23 = Version;
      if (!DLShouldLog()) {
        goto LABEL_62;
      }
      uint64_t v29 = v23;
      CFTypeRef v30 = cf;
    }
    else
    {
      if (DLShouldLog())
      {
        uint64_t v29 = (uint64_t)a2;
        CFTypeRef v30 = a5;
        _DLLog();
      }
      CanSyncWithuint64_t Version = DataSourceCanSyncWithVersion();
      if (!CanSyncWithVersion) {
        goto LABEL_64;
      }
      uint64_t v25 = CanSyncWithVersion;
      if (!DLShouldLog())
      {
LABEL_62:
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
LABEL_64:
        if (DLShouldLog())
        {
          uint64_t v29 = (uint64_t)a5;
          CFTypeRef v30 = 0;
          _DLLog();
        }
        CFStringRef v12 = @"Your computer's software is out of date. Please update and try again";
        goto LABEL_67;
      }
      uint64_t v29 = v25;
      CFTypeRef v30 = cf;
    }
    _DLLog();
    goto LABEL_62;
  }
  CFArrayRef theArray = 0;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a2, @".");
  CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
  CFArrayGetValueAtIndex(ArrayBySeparatingStrings, Count - 1);
  uint64_t v19 = CopyExternalSourcesEnabledForDataType();
  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
  if (v19 || !theArray)
  {
    if (v19)
    {
      if (DLShouldLog())
      {
        uint64_t v29 = v19;
        CFTypeRef v30 = cf;
        _DLLog();
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    goto LABEL_19;
  }
  if (CFArrayGetCount(theArray) < 1) {
    goto LABEL_19;
  }
  if (theArray)
  {
    CFRelease(theArray);
    CFArrayRef theArray = 0;
  }
  if (DLShouldLog())
  {
    uint64_t v29 = (uint64_t)a2;
    _DLLog();
  }
  uint64_t v20 = sub_100005340(a1, (uint64_t)a2, @"This data class is disabled for tethered syncing on the device.", (uint64_t)&cf);
  if (v20)
  {
    uint64_t v21 = v20;
    if (DLShouldLog())
    {
      uint64_t v29 = v21;
      CFTypeRef v30 = cf;
      _DLLog();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  if (v14) {
    CFRelease(v14);
  }
  return [v10 drain:v29, v30];
}

id sub_100002BF0(_DWORD *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  CFTypeRef cf = 0;
  DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v15 = a2;
    _DLLog();
  }
  uint64_t v5 = DataSourceClearAllRecords();
  if (!v5)
  {
    uint64_t v11 = sub_1000053C8((uint64_t)a1, a2, (uint64_t)&cf);
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v12 = v11;
    if (!DLShouldLog()) {
      goto LABEL_16;
    }
    uint64_t v15 = v12;
    CFTypeRef v16 = cf;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  if (DLShouldLog())
  {
    uint64_t v15 = v6;
    CFTypeRef v16 = cf;
    _DLLog();
  }
  uint64_t v7 = sub_100005648(a1);
  if (v7)
  {
    uint64_t v8 = v7;
    if (DLShouldLog())
    {
      uint64_t v15 = v8;
      CFTypeRef v16 = cf;
      _DLLog();
    }
  }
  uint64_t v9 = DLWaitForMessage();
  if (v9)
  {
    uint64_t v10 = v9;
    if (!DLShouldLog()) {
      goto LABEL_16;
    }
    uint64_t v15 = v10;
    CFTypeRef v16 = cf;
LABEL_15:
    _DLLog();
LABEL_16:
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
LABEL_18:
  if (SyncPlaybackEnabled())
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, @"sync type", @"SDSyncTypeReset");
  }
  return [v4 drain:v15, v16];
}

id sub_100002E28(_DWORD *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v5 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v12 = a2;
    _DLLog();
  }
  *(void *)(v5 + 24) = kCFBooleanFalse;
  *(void *)(v5 + 32) = kCFBooleanFalse;
  uint64_t Changes = DataSourceGetChanges();
  if (Changes)
  {
    uint64_t v7 = Changes;
    if (DLShouldLog())
    {
      uint64_t v12 = v7;
      uint64_t v13 = 0;
      _DLLog();
    }
  }
  uint64_t v8 = sub_100005454(a1);
  if (v8)
  {
    uint64_t v9 = v8;
    if (DLShouldLog())
    {
      uint64_t v12 = v9;
      uint64_t v13 = 0;
      _DLLog();
    }
  }
  if (DLShouldLog())
  {
    uint64_t v12 = 0;
    _DLLog();
  }
  if (SyncPlaybackEnabled())
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, @"sync type", @"SDSyncTypeFast");
  }
  return [v4 drain:v12:v13:0:0];
}

id sub_100003030(_DWORD *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v5 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v12 = a2;
    _DLLog();
  }
  *(void *)(v5 + 24) = kCFBooleanFalse;
  *(void *)(v5 + 32) = kCFBooleanTrue;
  uint64_t AllRecords = DataSourceGetAllRecords();
  if (AllRecords)
  {
    uint64_t v7 = AllRecords;
    if (DLShouldLog())
    {
      uint64_t v12 = v7;
      uint64_t v13 = 0;
      _DLLog();
    }
  }
  uint64_t v8 = sub_100005454(a1);
  if (v8)
  {
    uint64_t v9 = v8;
    if (DLShouldLog())
    {
      uint64_t v12 = v9;
      uint64_t v13 = 0;
      _DLLog();
    }
  }
  if (DLShouldLog())
  {
    uint64_t v12 = 0;
    _DLLog();
  }
  if (SyncPlaybackEnabled())
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, @"sync type", @"SDSyncTypeSlow");
  }
  return [v4 drain:v12, v13];
}

id sub_100003248(_DWORD *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  CFTypeRef cf = 0;
  uint64_t v5 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog())
  {
    uint64_t v10 = a2;
    _DLLog();
  }
  CFBooleanRef v6 = *(const __CFBoolean **)(v5 + 24);
  if (v6 == kCFBooleanTrue)
  {
    if (*(const __CFBoolean **)(v5 + 32) == v6) {
      sub_100003030(a1, a2);
    }
    else {
      sub_100002E28(a1, a2);
    }
  }
  else
  {
    uint64_t v7 = sub_1000054A8((uint64_t)a1, a2, (uint64_t)&cf);
    if (v7)
    {
      uint64_t v8 = v7;
      if (DLShouldLog())
      {
        uint64_t v10 = v8;
        CFTypeRef v11 = cf;
        _DLLog();
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
  }
  return [v4 drain:v10, v11];
}

id sub_10000336C(_DWORD *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  CFTypeRef cf = 0;
  uint64_t v5 = DLGetDeviceLinkConnectionContext();
  *(void *)(v5 + 40) = kCFBooleanTrue;
  if (DLShouldLog()) {
    _DLLog();
  }
  if (!DataSourceCommit())
  {
    if (!sub_1000055BC((uint64_t)a1, a2, (uint64_t)&cf)) {
      goto LABEL_25;
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    goto LABEL_21;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  int v6 = sub_100005648(a1);
  if (v6 && DLShouldLog()) {
    _DLLog();
  }
  if (DLWaitForMessage() && DLShouldLog()) {
    _DLLog();
  }
  if (v6)
  {
LABEL_21:
    if (DLShouldLog()) {
      _DLLog();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
LABEL_25:
  sub_100003CC8(v5);
  return [v4 drain];
}

void sub_1000035E8(uint64_t a1, const char *a2, int a3, int a4, uint64_t a5, int a6)
{
  observer = 0;
  CFTypeRef cf = 0;
  CFTypeRef v11 = malloc_type_calloc(0x48uLL, 1uLL, 0xAC89FB83uLL);
  *CFTypeRef v11 = 0;
  v11[1] = 0;
  v11[3] = kCFBooleanFalse;
  v11[4] = kCFBooleanFalse;
  v11[5] = kCFBooleanFalse;
  v11[6] = kCFBooleanFalse;
  v11[7] = kCFBooleanFalse;
  *((_DWORD *)v11 + 16) = -1;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a2)
  {
    CFStringRef v13 = CFStringCreateWithCString(0, a2, 0x600u);
    CFDictionarySetValue(Mutable, @"DLInfoHostnameKey", v13);
    CFRelease(v13);
  }
  if (a4)
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    byte_10000C328 = 1;
  }
  if (sub_1000039D4(Mutable, a6))
  {
    int v14 = DLShouldLog();
    if (a2)
    {
      if (!v14) {
        goto LABEL_19;
      }
    }
    else if (!v14)
    {
      goto LABEL_19;
    }
    _DLLog();
LABEL_19:
    if (sub_100004B2C(a5, (uint64_t)off_10000C038, (uint64_t)v11, (uint64_t)&observer, (uint64_t)&cf))
    {
      if (!DLShouldLog())
      {
LABEL_22:
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        return;
      }
LABEL_21:
      _DLLog();
      goto LABEL_22;
    }
    if (a3) {
      v11[6] = kCFBooleanTrue;
    }
    if (a2)
    {
      if (DLConnect())
      {
        if (!DLShouldLog()) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      if (DLDeviceReady())
      {
        if (!DLShouldLog()) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      v11[7] = kCFBooleanTrue;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSync.SyncAgent.kSyncAgentSyncStarted", 0, 0, 0);
    }
    else if (DLWaitForConnection())
    {
      if (!DLShouldLog()) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    CFTypeRef v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v16, observer, (CFNotificationCallback)sub_100003B88, @"com.apple.SyncAgent.cancel", 0, (CFNotificationSuspensionBehavior)0);
    sub_100004150();
    CFRunLoopRun();
    CFRelease(Mutable);
    sub_100003CC8((uint64_t)v11);
    free(v11);
    return;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

uint64_t sub_1000039D4(__CFDictionary *a1, int a2)
{
  dword_10000C0D0 = a2;
  sub_100004010();
  if (a2 == 2)
  {
    CFDictionarySetValue(a1, @"DLInfoStreamTypeKey", @"DLInfoStreamTypeTCP");
    int valuePtr = 6666;
    if (DLShouldLog()) {
      _DLLog();
    }
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a1, @"DLInfoPortKey", v5);
LABEL_15:
    CFRelease(v5);
    return 1;
  }
  if (a2 != 1)
  {
    if (a2) {
      return 0;
    }
    if (DLLockdownXPCCheckin())
    {
      uint64_t result = DLShouldLog();
      if (!result) {
        return result;
      }
      _DLLog();
      return 0;
    }
    return 1;
  }
  CFDictionarySetValue(a1, @"DLInfoStreamTypeKey", @"DLInfoStreamTypeTCP");
  uint64_t result = DLGetListenerSocketFromLaunchd();
  int valuePtr = result;
  if (!result) {
    return result;
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, @"DLInfoSocketKey", v5);
  if (v5) {
    goto LABEL_15;
  }
  return 1;
}

id sub_100003B88(uint64_t a1, uint64_t a2)
{
  if (DLShouldLog()) {
    _DLLog();
  }
  if (DLKillConnection() && DLShouldLog()) {
    _DLLog();
  }
  return sub_1000014F0(a2, @"Cancel Sync Notification");
}

uint64_t sub_100003C34()
{
  SBSSetStatusBarShowsSyncActivity();
  byte_10000C329 = 1;
  uint64_t result = qword_10000C330;
  if (qword_10000C330)
  {
    CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_10000C330);
    CFRelease((CFTypeRef)qword_10000C330);
    qword_10000C330 = 0;
    uint64_t result = DLShouldLog();
    if (result)
    {
      return _DLLog();
    }
  }
  return result;
}

void sub_100003CC8(uint64_t a1)
{
  if (*(const CFBooleanRef *)(a1 + 56) == kCFBooleanTrue)
  {
    *(void *)(a1 + 56) = kCFBooleanFalse;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSync.SyncAgent.kSyncAgentSyncEnded", 0, 0, 0);
  }
  int v3 = *(_DWORD *)(a1 + 64);
  if (v3 != -1)
  {
    if (flock(v3, 8) == -1 && DLShouldLog())
    {
      __error();
      id v4 = __error();
      strerror(*v4);
      _DLLog();
    }
    if (DLShouldLog()) {
      _DLLog();
    }
    close(*(_DWORD *)(a1 + 64));
    *(_DWORD *)(a1 + 64) = -1;
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  *(void *)a1 = 0;
  if (*(void *)(a1 + 16))
  {
    if (*(const CFBooleanRef *)(a1 + 40) == kCFBooleanFalse)
    {
      if (DLShouldLog()) {
        _DLLog();
      }
      if (DataSourceRollback() && DLShouldLog()) {
        _DLLog();
      }
    }
    else
    {
      *(void *)(a1 + 40) = kCFBooleanFalse;
    }
    if (DataSourceDeleteDataSource() && DLShouldLog()) {
      _DLLog();
    }
    *(void *)(a1 + 16) = 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (DLShouldLog()) {
      _DLLog();
    }
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0;
  }
}

void sub_100003F4C(const void *a1, CFTypeRef cf, __CFArray *a3)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)cf);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count + 1, (CFDictionaryRef)cf);
    CFDictionarySetValue(MutableCopy, @"SyncAgent_RecordID", a1);
    CFArrayAppendValue(a3, MutableCopy);
    CFRelease(MutableCopy);
  }
  else
  {
    CFArrayAppendValue(a3, cf);
  }
}

uint64_t sub_100004008(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_100004010()
{
  uint64_t result = qword_10000C0D8;
  if (qword_10000C0D8 == -1)
  {
    if (byte_10000C328 == 1)
    {
      uint64_t result = 0;
      qword_10000C0D8 = 0;
      return result;
    }
    qword_10000C0D8 = 600;
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"InactivityTimeout", @"com.apple.SyncAgent", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat != 1 || (CFIndex v2 = AppIntegerValue, AppIntegerValue < 0))
    {
      uint64_t v4 = qword_10000C0D8;
      int v5 = DLShouldLog();
      if (v4)
      {
        if (v5) {
          goto LABEL_15;
        }
      }
      else if (v5)
      {
        goto LABEL_15;
      }
    }
    else
    {
      qword_10000C0D8 = AppIntegerValue;
      int v3 = DLShouldLog();
      if (v2)
      {
        if (v3) {
          goto LABEL_15;
        }
      }
      else if (v3)
      {
LABEL_15:
        _DLLog();
      }
    }
    return qword_10000C0D8;
  }
  return result;
}

void sub_100004150()
{
  uint64_t v0 = sub_100004010();
  if (v0)
  {
    if (dword_10000C0D0 == 1)
    {
      if (DLShouldLog())
      {
        _DLLog();
      }
    }
    else
    {
      uint64_t v1 = v0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      qword_10000C330 = (uint64_t)CFRunLoopTimerCreate(0, Current + (double)v1, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100004238, 0);
      int v3 = CFRunLoopGetCurrent();
      uint64_t v4 = (__CFRunLoopTimer *)qword_10000C330;
      CFRunLoopAddTimer(v3, v4, kCFRunLoopCommonModes);
    }
  }
}

void sub_100004238(uint64_t a1)
{
  if (byte_10000C329 == 1 && DLShouldLog()) {
    _DLLog();
  }
  if (qword_10000C330 != a1 && DLShouldLog()) {
    _DLLog();
  }
  if (DLShouldLog()) {
    _DLLog();
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SyncAgent.inactivityTimeout", 0, 0, 0);
  exit(0);
}

uint64_t start(int a1, const char **a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  DLSetLogDirectoryName();
  if (a1 < 2)
  {
    LODWORD(v5) = 0;
    CFStringRef v6 = 0;
    CFStringRef v26 = 0;
    CFStringRef v7 = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    CFURLRef v31 = 0;
    int v32 = 0;
    int v28 = 0;
    unsigned __int8 v30 = 1;
    LODWORD(v10) = 2;
    LODWORD(v11) = 1;
    goto LABEL_31;
  }
  id v25 = v4;
  CFStringRef v26 = 0;
  uint64_t v11 = 0;
  int v28 = 0;
  int v29 = 0;
  int v32 = 0;
  CFURLRef v31 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  CFStringRef v27 = 0;
  CFStringRef v33 = 0;
  uint64_t v5 = 0;
  unsigned __int8 v30 = 1;
  uint64_t v10 = 2;
  uint64_t v12 = "b:c:def:hkl:Lm:noprs:S:t:vX:Y:";
  while (2)
  {
    while (1)
    {
      int v13 = getopt_long(a1, (char *const *)a2, v12, (const option *)&off_10000C0E0, 0);
      if (v13 <= 83) {
        break;
      }
      switch(v13)
      {
        case 'c':
          CFStringRef v22 = CFStringCreateWithCString(0, optarg, 0x8000100u);
          dataClassNameForDataType();
          CreateDataSourceForDataClassName();
          DataSourceGetCountOfRecords();
          CFPrintf();
          if (v22) {
            CFRelease(v22);
          }
          goto LABEL_67;
        case 'd':
          unsigned __int8 v30 = 0;
          continue;
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'l':
        case 'p':
        case 'q':
        case 'u':
          break;
        case 'k':
          uint64_t v10 = 0;
          uint64_t v5 = 1;
          continue;
        case 'm':
          uint64_t v9 = 1;
          if (optarg) {
            CFStringRef v26 = sub_100004A94(optarg);
          }
          continue;
        case 'n':
          int v32 = 1;
          continue;
        case 'o':
          goto LABEL_23;
        case 'r':
          uint64_t v11 = 1;
          continue;
        case 's':
          CFURLRef v31 = optarg;
LABEL_23:
          uint64_t v11 = 1;
          uint64_t v5 = 1;
          continue;
        case 't':
          continue;
        case 'v':
          uint64_t v11 = 1;
          int v29 = 1;
          continue;
        default:
          if (v13 == 84)
          {
            SetTetheredSyncingDisabledForDatatype();
            goto LABEL_67;
          }
          if (v13 == 88)
          {
            SetExternalSourceEnabledForDataType();
            SetAccountNameEnabledForDataType();
LABEL_67:
            exit(0);
          }
          return result;
      }
LABEL_29:
      int v28 = 1;
    }
    switch(v13)
    {
      case 'C':
        CFStringRef v33 = CFStringCreateWithCString(0, optarg, 0x8000100u);
        continue;
      case 'D':
        CFStringCreateWithCString(0, optarg, 0x8000100u);
        continue;
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
        goto LABEL_29;
      case 'K':
        uint64_t v8 = 1;
        if (optarg) {
          CFStringRef v27 = sub_100004A94(optarg);
        }
        continue;
      case 'L':
        uint64_t v10 = 1;
        continue;
      default:
        if (v13 == 83)
        {
          int v14 = v12;
          uint64_t v15 = v11;
          uint64_t v16 = v5;
          uint64_t v17 = v10;
          uint64_t v18 = v8;
          uint64_t v19 = v9;
          CFStringRef v20 = CFStringCreateWithCString(0, optarg, 0x8000100u);
          CopyExternalSourcesEnabledForDataType();
          CFPrintf();
          CopyAccountNamesEnabledForDataType();
          CFStringRef v23 = v20;
          uint64_t v24 = 0;
          CFPrintf();
          if (v20) {
            CFRelease(v20);
          }
          uint64_t v9 = v19;
          uint64_t v8 = v18;
          uint64_t v10 = v17;
          uint64_t v5 = v16;
          uint64_t v11 = v15;
          uint64_t v12 = v14;
          continue;
        }
        if (v13 != -1) {
          goto LABEL_29;
        }
        id v4 = v25;
        CFStringRef v6 = v33;
        CFStringRef v7 = v27;
        if (!v29) {
LABEL_31:
        }
          DLSetOutputLevel();
        if (v28)
        {
          printf("Usage:\n%s --run [--oneshot]\n%s --sync hostname\n%s --playback filename\n", *a2, *a2, *a2);
          goto LABEL_60;
        }
        if (v9)
        {
          CFStringRef v7 = v26;
          if (v26) {
            CFStringRef v7 = (const __CFString *)[objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:kCFBooleanTrue, v26, 0];
          }
          if (CreateDataSourceForDataClassName()) {
            NSLog(@"Couldn't create a data source with the name %@: %@", v6, 0);
          }
          if (CreateDataSourceForDataClassName()) {
            NSLog(@"Couldn't create a data source with the name %@: %@", v6, 0);
          }
          if (DataSourceMigrateRecords()) {
            NSLog(@"Couldn't migrate records: %@", 0);
          }
          if (DataSourceDeleteDataSource()) {
            NSLog(@"Couldn't delete the source data source: %@", 0);
          }
          if (DataSourceDeleteDataSource()) {
            NSLog(@"Couldn't delete the destination data source: %@", 0, v24);
          }
          goto LABEL_58;
        }
        if (v8)
        {
          if (v7) {
            CFStringRef v7 = (const __CFString *)[objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:kCFBooleanTrue, v7, 0];
          }
          if (CreateDataSourceForDataClassName()) {
            NSLog(@"Couldn't create a data source with the name %@: %@", v6, 0);
          }
          if (DataSourceClearAllRecords()) {
            NSLog(@"Couldn't clear all records in the data source: %@", 0);
          }
          if (DataSourceCommit()) {
            NSLog(@"Couldn't commit the data source: %@", 0);
          }
          if (DataSourceDeleteDataSource()) {
            NSLog(@"Couldn't delete the data source: %@", 0, v24);
          }
LABEL_58:
          if (v7) {
            CFRelease(v7);
          }
        }
        else if (v11)
        {
          sub_1000035E8((uint64_t)*a2, v31, v5, v32, v30, v10);
        }
LABEL_60:
        [v4 drain:v23];
        return 0;
    }
  }
}

CFStringRef sub_100004A94(const char *a1)
{
  if (strncasecmp(a1, "event", 5uLL)) {
    return @"IsEventsOnly";
  }
  if (!strncasecmp(a1, "todo", 4uLL) && !strncasecmp(a1, "task", 4uLL) && !strncasecmp(a1, "reminder", 8uLL)) {
    return 0;
  }
  return @"IsRemindersOnly";
}

uint64_t sub_100004B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = a2 + 88;
  uint64_t v11 = malloc_type_calloc(0x18uLL, 1uLL, 0x7B2F8120uLL);
  *uint64_t v11 = v10;
  v11[1] = a2;
  uint64_t v12 = dword_10000C320;

  return __DLCreateDeviceLinkConnectionForDevice(a1, a2, a3, v11, a4, sub_100004BC8, v12, a5);
}

uint64_t sub_100004BC8(uint64_t a1, CFArrayRef theArray)
{
  id v4 = *(void **)(a1 + 16);
  CFIndex Count = CFArrayGetCount(theArray);
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex)
  {
    if (!DLShouldLog()) {
      return 0xFFFFFFFFLL;
    }
LABEL_20:
    _DLLog();
    return 0xFFFFFFFFLL;
  }
  CFStringRef v7 = ValueAtIndex;
  if (CFStringCompare(ValueAtIndex, @"SDMessageSyncDataClassWithDevice", 0))
  {
    if (CFStringCompare(v7, @"SDMessageSyncDataClassWithComputer", 0))
    {
      if (CFStringCompare(v7, @"SDMessageRefuseToSyncDataClassWithComputer", 0))
      {
        if (CFStringCompare(v7, @"SDMessageClearAllRecordsOnDevice", 0))
        {
          if (CFStringCompare(v7, @"SDMessageDeviceWillClearAllRecords", 0))
          {
            if (CFEqual(v7, @"SDMessageGetChangesFromDevice"))
            {
              if (Count < 2) {
                uint64_t v27 = 0;
              }
              else {
                uint64_t v27 = _DLGetParameterAtIndex();
              }
              (*(void (**)(uint64_t, uint64_t))(v4[1] + 120))(a1, v27);
              return 0;
            }
            if (CFStringCompare(v7, @"SDMessageGetAllRecordsFromDevice", 0))
            {
              if (CFStringCompare(v7, @"SDMessageProcessChanges", 0))
              {
                if (CFStringCompare(v7, @"SDMessageAcknowledgeChangesFromDevice", 0))
                {
                  if (CFStringCompare(v7, @"SDMessageDeviceReadyToReceiveChanges", 0))
                  {
                    if (CFStringCompare(v7, @"SDMessageRemapRecordIdentifiers", 0))
                    {
                      if (CFEqual(v7, @"SDMessageFinishSessionOnDevice"))
                      {
                        if (Count < 2) {
                          uint64_t v38 = 0;
                        }
                        else {
                          uint64_t v38 = _DLGetParameterAtIndex();
                        }
                        (*(void (**)(uint64_t, uint64_t))(v4[1] + 144))(a1, v38);
                        return 0;
                      }
                      if (CFStringCompare(v7, @"SDMessageDeviceFinishedSession", 0))
                      {
                        if (CFEqual(v7, @"SDMessageCancelSession"))
                        {
                          if (Count < 2)
                          {
                            uint64_t v8 = 0;
                          }
                          else
                          {
                            uint64_t v8 = _DLGetParameterAtIndex();
                            if (Count != 2)
                            {
                              uint64_t v9 = _DLGetParameterAtIndex();
LABEL_115:
                              (*(void (**)(uint64_t, uint64_t, uint64_t))(*v4 + 8))(a1, v8, v9);
                              return 0;
                            }
                          }
                          uint64_t v9 = 0;
                          goto LABEL_115;
                        }
                        return 0xFFFFFFFFLL;
                      }
                      if (Count < 2) {
                        uint64_t v26 = 0;
                      }
                      else {
                        uint64_t v26 = _DLGetParameterAtIndex();
                      }
                      uint64_t v39 = v4[2];
                      if (!v39 || (CFStringRef v33 = *(void (**)(uint64_t, uint64_t))(v39 + 152)) == 0)
                      {
                        if (!DLShouldLog()) {
                          return 0xFFFFFFFFLL;
                        }
                        goto LABEL_20;
                      }
                      goto LABEL_80;
                    }
                    if (Count < 2)
                    {
                      uint64_t v36 = 0;
                    }
                    else
                    {
                      uint64_t v36 = _DLGetParameterAtIndex();
                      if (Count != 2)
                      {
                        uint64_t v37 = _DLGetParameterAtIndex();
LABEL_103:
                        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[2] + 144))(a1, v36, v37);
                        return 0;
                      }
                    }
                    uint64_t v37 = 0;
                    goto LABEL_103;
                  }
                  if (Count < 2) {
                    uint64_t v34 = 0;
                  }
                  else {
                    uint64_t v34 = _DLGetParameterAtIndex();
                  }
                  uint64_t v35 = v4[2];
                }
                else
                {
                  if (Count < 2) {
                    uint64_t v34 = 0;
                  }
                  else {
                    uint64_t v34 = _DLGetParameterAtIndex();
                  }
                  uint64_t v35 = v4[1];
                }
                (*(void (**)(uint64_t, uint64_t))(v35 + 136))(a1, v34);
                return 0;
              }
              uint64_t v29 = (uint64_t)kCFBooleanFalse;
              if (Count < 2)
              {
                uint64_t v30 = 0;
              }
              else
              {
                uint64_t v30 = _DLGetParameterAtIndex();
                if (Count != 2)
                {
                  uint64_t v31 = _DLGetParameterAtIndex();
                  if ((unint64_t)Count >= 4)
                  {
                    uint64_t v29 = _DLGetParameterAtIndexWithDefaultValue();
                    if (Count != 4)
                    {
                      uint64_t v32 = _DLGetParameterAtIndex();
LABEL_88:
                      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*v4)(a1, v30, v31, v29, v32);
                      return 0;
                    }
                  }
LABEL_87:
                  uint64_t v32 = 0;
                  goto LABEL_88;
                }
              }
              uint64_t v31 = 0;
              goto LABEL_87;
            }
            if (Count < 2) {
              uint64_t v26 = 0;
            }
            else {
              uint64_t v26 = _DLGetParameterAtIndex();
            }
            uint64_t v28 = v4[1];
          }
          else
          {
            if (Count < 2) {
              uint64_t v26 = 0;
            }
            else {
              uint64_t v26 = _DLGetParameterAtIndex();
            }
            uint64_t v28 = v4[2];
          }
          CFStringRef v33 = *(void (**)(uint64_t, uint64_t))(v28 + 128);
LABEL_80:
          v33(a1, v26);
          return 0;
        }
        if (Count < 2)
        {
          uint64_t v24 = 0;
        }
        else
        {
          uint64_t v24 = _DLGetParameterAtIndex();
          if (Count != 2)
          {
            uint64_t v25 = _DLGetParameterAtIndex();
LABEL_57:
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[1] + 112))(a1, v24, v25);
            return 0;
          }
        }
        uint64_t v25 = 0;
        goto LABEL_57;
      }
      if (Count < 2)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = _DLGetParameterAtIndex();
        if (Count != 2)
        {
          uint64_t v20 = _DLGetParameterAtIndex();
LABEL_48:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[2] + 120))(a1, v19, v20);
          return 0;
        }
      }
      uint64_t v20 = 0;
      goto LABEL_48;
    }
    if (Count < 2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = _DLGetParameterAtIndex();
      if (Count != 2)
      {
        uint64_t v21 = _DLGetParameterAtIndex();
        if ((unint64_t)Count < 4)
        {
          uint64_t v15 = 0;
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = _DLGetParameterAtIndex();
          if (Count != 4)
          {
            uint64_t v22 = _DLGetParameterAtIndex();
            if ((unint64_t)Count < 6)
            {
              uint64_t v15 = 0;
            }
            else
            {
              uint64_t v15 = _DLGetParameterAtIndex();
              if (Count != 6)
              {
                uint64_t v23 = _DLGetParameterAtIndex();
                goto LABEL_39;
              }
            }
LABEL_38:
            uint64_t v23 = 0;
LABEL_39:
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4[2] + 112))(a1, v14, v21, v16, v22, v15, v23);
            return 0;
          }
          uint64_t v15 = 0;
        }
LABEL_37:
        uint64_t v22 = 0;
        goto LABEL_38;
      }
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    uint64_t v21 = 0;
    goto LABEL_37;
  }
  if (Count < 2)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    goto LABEL_29;
  }
  uint64_t v11 = _DLGetParameterAtIndex();
  if (Count == 2)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_29:
    uint64_t v17 = 0;
    goto LABEL_30;
  }
  uint64_t v13 = _DLGetParameterAtIndex();
  if ((unint64_t)Count < 4)
  {
    uint64_t v12 = 0;
    goto LABEL_29;
  }
  uint64_t v17 = _DLGetParameterAtIndex();
  if (Count == 4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = _DLGetParameterAtIndex();
    if ((unint64_t)Count >= 6)
    {
      uint64_t v18 = _DLGetParameterAtIndex();
      goto LABEL_31;
    }
  }
LABEL_30:
  uint64_t v18 = 0;
LABEL_31:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4[1] + 104))(a1, v11, v13, v17, v12, v18);
  return 0;
}

uint64_t sub_1000052B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 7;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a8, @"SDSyncDataClassWithComputer: Computer cannot call this method");
  }
}

uint64_t sub_100005340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 8;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a4, @"SDRefuseToSyncDataClassWithComputer: Computer cannot call this method");
  }
}

uint64_t sub_1000053C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 10;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a3, @"SDDeviceWillClearAllRecords: Computer cannot call this method");
  }
}

uint64_t sub_100005454(_DWORD *a1)
{
  *a1 = 13;
  return 0;
}

uint64_t sub_1000054A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 15;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a3, @"SDDeviceWillClearAllRecords: Computer cannot call this method");
  }
}

uint64_t sub_100005534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 16;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a4, @"SDRemapRecordIdentifiers: Computer cannot call this method");
  }
}

uint64_t sub_1000055BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite();
    _DLRequestRead();
    *(_DWORD *)a1 = 18;
    return 0;
  }
  else
  {
    return _DLSetStatus(4294967292, a3, @"SDDeviceFinishedSession: Computer cannot call this method");
  }
}

uint64_t sub_100005648(_DWORD *a1)
{
  *a1 = 19;
  return 0;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t CFPrintf()
{
  return _CFPrintf();
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

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

uint64_t CopyAccountNamesEnabledForDataType()
{
  return _CopyAccountNamesEnabledForDataType();
}

uint64_t CopyExternalSourcesEnabledForDataType()
{
  return _CopyExternalSourcesEnabledForDataType();
}

uint64_t CreateDataSourceForDataClassName()
{
  return _CreateDataSourceForDataClassName();
}

uint64_t DLConnect()
{
  return _DLConnect();
}

uint64_t DLCreateUUID()
{
  return _DLCreateUUID();
}

uint64_t DLDeleteDeviceLinkConnection()
{
  return _DLDeleteDeviceLinkConnection();
}

uint64_t DLDeviceReady()
{
  return _DLDeviceReady();
}

uint64_t DLDisconnect()
{
  return _DLDisconnect();
}

uint64_t DLEnsureDirectoryExists()
{
  return _DLEnsureDirectoryExists();
}

uint64_t DLGetDeviceLinkConnectionContext()
{
  return _DLGetDeviceLinkConnectionContext();
}

uint64_t DLGetDeviceLinkConnectionInfo()
{
  return _DLGetDeviceLinkConnectionInfo();
}

uint64_t DLGetListenerSocketFromLaunchd()
{
  return _DLGetListenerSocketFromLaunchd();
}

uint64_t DLKillConnection()
{
  return _DLKillConnection();
}

uint64_t DLLockdownXPCCheckin()
{
  return _DLLockdownXPCCheckin();
}

uint64_t DLSetLogDirectoryName()
{
  return _DLSetLogDirectoryName();
}

uint64_t DLSetOutputLevel()
{
  return _DLSetOutputLevel();
}

uint64_t DLShouldLog()
{
  return _DLShouldLog();
}

uint64_t DLWaitForConnection()
{
  return _DLWaitForConnection();
}

uint64_t DLWaitForMessage()
{
  return _DLWaitForMessage();
}

uint64_t DLWritePropertyListToFile()
{
  return _DLWritePropertyListToFile();
}

uint64_t DataSourceCanSyncWithVersion()
{
  return _DataSourceCanSyncWithVersion();
}

uint64_t DataSourceClearAllRecords()
{
  return _DataSourceClearAllRecords();
}

uint64_t DataSourceCommit()
{
  return _DataSourceCommit();
}

uint64_t DataSourceDeleteDataSource()
{
  return _DataSourceDeleteDataSource();
}

uint64_t DataSourceGetAllRecords()
{
  return _DataSourceGetAllRecords();
}

uint64_t DataSourceGetChanges()
{
  return _DataSourceGetChanges();
}

uint64_t DataSourceGetCountOfRecords()
{
  return _DataSourceGetCountOfRecords();
}

uint64_t DataSourceGetSyncTypeAndExchangeSyncAnchors()
{
  return _DataSourceGetSyncTypeAndExchangeSyncAnchors();
}

uint64_t DataSourceGetVersion()
{
  return _DataSourceGetVersion();
}

uint64_t DataSourceLockFilePath()
{
  return _DataSourceLockFilePath();
}

uint64_t DataSourceMigrateRecords()
{
  return _DataSourceMigrateRecords();
}

uint64_t DataSourceProcessChanges()
{
  return _DataSourceProcessChanges();
}

uint64_t DataSourceRollback()
{
  return _DataSourceRollback();
}

uint64_t DataSourceShouldLockData()
{
  return _DataSourceShouldLockData();
}

uint64_t GetTetheredSyncingDisabledForDataType()
{
  return _GetTetheredSyncingDisabledForDataType();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSSetStatusBarShowsSyncActivity()
{
  return _SBSSetStatusBarShowsSyncActivity();
}

uint64_t SetAccountNameEnabledForDataType()
{
  return _SetAccountNameEnabledForDataType();
}

uint64_t SetExternalSourceEnabledForDataType()
{
  return _SetExternalSourceEnabledForDataType();
}

uint64_t SetTetheredSyncingDisabledForDatatype()
{
  return _SetTetheredSyncingDisabledForDatatype();
}

uint64_t SyncPlaybackEnabled()
{
  return _SyncPlaybackEnabled();
}

uint64_t _DLGetParameterAtIndex()
{
  return __DLGetParameterAtIndex();
}

uint64_t _DLGetParameterAtIndexWithDefaultValue()
{
  return __DLGetParameterAtIndexWithDefaultValue();
}

uint64_t _DLLog()
{
  return __DLLog();
}

uint64_t _DLRequestRead()
{
  return __DLRequestRead();
}

uint64_t _DLRequestWrite()
{
  return __DLRequestWrite();
}

int *__error(void)
{
  return ___error();
}

int close(int a1)
{
  return _close(a1);
}

uint64_t dataClassNameForDataType()
{
  return _dataClassNameForDataType();
}

uint64_t dataTypeForDataClassName()
{
  return _dataTypeForDataClassName();
}

void exit(int a1)
{
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

void free(void *a1)
{
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isEphemeralMultiUser];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}