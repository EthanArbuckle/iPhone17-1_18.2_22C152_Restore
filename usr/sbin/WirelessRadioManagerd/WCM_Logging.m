@interface WCM_Logging
+ (BOOL)getLogToFile;
+ (BOOL)isLogLevelEnabled:(int)a3;
+ (id)stringFromXPCObjectWithPrefix:(id)a3 prefix:(id)a4;
+ (int)getNumberOfSavedLogFiles:(int *)a3 new:(int *)a4;
+ (void)initSettingsFromPreferences;
+ (void)logLevel:(int)a3 message:(id)a4;
+ (void)logToFile:(id)a3;
+ (void)reloadLogSettingsFromPreferences;
+ (void)reloadiRATSettingsFromPreferences;
+ (void)setCurrentLogLevel:(unsigned int)a3;
+ (void)setLogSettingsToPreferences;
+ (void)setLogToFile:(BOOL)a3;
+ (void)setiRATSettingsToPreferences:(BOOL)a3;
@end

@implementation WCM_Logging

+ (void)logLevel:(int)a3 message:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  block[6] = &v22;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:a4 arguments:&v22];
  int v7 = 1 << v4;
  if (v4 > 5)
  {
    if ((v7 & 0x3FFF0000) == 0) {
      goto LABEL_17;
    }
    if ((v7 & 0x26030000) != 0)
    {
      v8 = qword_10027D1B0[(v4 - 16)];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        v9 = "%@";
LABEL_15:
        v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v9, buf, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v10 = qword_10027D1B0[(v4 - 16)];
    if ((v7 & 0x14C0000) != 0)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      v9 = "%@";
      goto LABEL_31;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  if (v4 > 2)
  {
    if ((v7 & 0x20) != 0)
    {
      v8 = qword_10027D180[v4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v6;
        v9 = "%{public}@";
        goto LABEL_15;
      }
      goto LABEL_17;
    }
    v10 = qword_10027D180[v4];
    if ((v7 & 8) != 0)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      v9 = "%@";
LABEL_31:
      v11 = v10;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_16;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
LABEL_10:
    sub_10013ACB8((uint64_t)v6, v10);
    goto LABEL_17;
  }
  v8 = qword_10027D180[v4];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    v9 = "%@";
    goto LABEL_15;
  }
LABEL_17:
  if (byte_10027D170 && [a1 isLogLevelEnabled:v4])
  {
    v13 = +[NSDate date];
    id v14 = [(id)qword_10027D178 stringFromDate:v13];
    id v15 = objc_alloc((Class)NSString);
    uint64_t v16 = getpid();
    if (v4 <= 5)
    {
      v17 = &(&off_100210F40)[v4];
    }
    else
    {
      if ((v7 & 0x3FFF0000) == 0)
      {
        v18 = "LogUnknown";
        goto LABEL_24;
      }
      v17 = &(&off_100210F70)[(v4 - 16)];
    }
    v18 = *v17;
LABEL_24:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C30FC;
    block[3] = &unk_10020DAB0;
    block[4] = a1;
    block[5] = [v15 initWithFormat:@"%@ [%d] <%s>: %@\n", v14, v16, v18, v6];
    dispatch_async((dispatch_queue_t)qword_10027D230, block);
  }
}

+ (void)setLogToFile:(BOOL)a3
{
  byte_10027D170 = a3;
}

+ (BOOL)getLogToFile
{
  return byte_10027D170;
}

+ (void)setCurrentLogLevel:(unsigned int)a3
{
  *(_DWORD *)asc_10027CCF8 = a3;
}

+ (BOOL)isLogLevelEnabled:(int)a3
{
  return (*(_DWORD *)asc_10027CCF8 >> a3) & 1;
}

+ (void)initSettingsFromPreferences
{
  id v2 = (id)qword_10027D178;
  if (!qword_10027D178)
  {
    id v2 = objc_alloc_init((Class)NSDateFormatter);
    qword_10027D178 = (uint64_t)v2;
  }
  [v2 setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"];
  qword_10027D180[0] = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Error");
  qword_10027D188 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Warning");
  qword_10027D190 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Info");
  qword_10027D198 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Trace");
  qword_10027D1A0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Detail");
  qword_10027D1A8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Public");
  qword_10027D1B0[0] = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Error");
  qword_10027D1B8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Warning");
  qword_10027D1C0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Info");
  qword_10027D1C8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceWifi");
  qword_10027D1D0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceSymptom");
  qword_10027D1D8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMotion");
  qword_10027D1E0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceCellular");
  qword_10027D1E8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceRTP");
  qword_10027D1F0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceHandoverManager");
  qword_10027D1F8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMetrics");
  qword_10027D200 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceOther");
  qword_10027D208 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceIDS");
  qword_10027D210 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMediaStreaming");
  qword_10027D218 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceFTHandoverManager");
  int out_token = 0;
  notify_register_dispatch("com.apple.WirelessRadioManager.PrefChangeNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100210FE0);
  +[WCM_Logging reloadLogSettingsFromPreferences];
  _set_user_dir_suffix();
  NSTemporaryDirectory();
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v4 = v3;
  if (!qword_10027D220) {
    qword_10027D220 = (uint64_t)[-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0) stringByAppendingPathComponent:@"Logs/WirelessRadioManager/"];
  }
  v5 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v5 fileExistsAtPath:qword_10027D220])
  {
    id v6 = +[NSFileManager defaultManager];
    if ([(NSFileManager *)v6 createDirectoryAtPath:qword_10027D220 withIntermediateDirectories:0 attributes:0 error:0])
    {
      NSLog(@"Created %@", v4);
    }
  }
  if (!qword_10027D228) {
    qword_10027D228 = (uint64_t)[(id)qword_10027D220 stringByAppendingPathComponent:@"WirelessRadioManager.log"];
  }
  uint64_t v7 = 1;
  do
  {
    id v8 = [[(id)qword_10027D220 stringByAppendingFormat:@"/WirelessRadioManager%i.log", v7];
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v8])
    {
      NSLog(@"Remove old-style log file %@", v8);
      [+[NSFileManager defaultManager] removeItemAtPath:v8 error:0];
    }
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 10);
  if (!qword_10027D230) {
    qword_10027D230 = (uint64_t)dispatch_queue_create("com.apple.WirelessRadioManager.Log", 0);
  }
}

+ (void)setLogSettingsToPreferences
{
  if (byte_10027D170) {
    id v2 = "TRUE";
  }
  else {
    id v2 = "FALSE";
  }
  *(_OWORD *)keys = off_100211000;
  values[0] = +[NSString stringWithFormat:@"%s", v2];
  values[1] = +[NSString stringWithFormat:@"0x%08x", *(unsigned int *)asc_10027CCF8];
  CFDictionaryRef v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFPreferencesSetAppValue(@"LogInfo", v3, @"com.apple.WirelessRadioManager.debug");
    CFRelease(v4);
  }
  if (!CFPreferencesAppSynchronize(@"com.apple.WirelessRadioManager.debug")) {
    NSLog(@"%s: Failed to sync the preferences.", "+[WCM_Logging setLogSettingsToPreferences]");
  }
}

+ (void)reloadLogSettingsFromPreferences
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"LogInfo", @"com.apple.WirelessRadioManager.debug");
  if (!v2)
  {
    NSLog(@"LogInfo not Found");
    byte_10027D170 = 0;
    *(_DWORD *)asc_10027CCF8 = 458759;
LABEL_17:
    +[WCM_Logging setLogSettingsToPreferences];
    return;
  }
  CFDictionaryRef v3 = v2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3))
  {
    NSLog(@"LogInfo not Found");
    byte_10027D170 = 0;
LABEL_16:
    *(_DWORD *)asc_10027CCF8 = 458759;
    CFRelease(v3);
    goto LABEL_17;
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, @"LogToFile", (const void **)&value)
    && (CFTypeID v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
  {
    CFComparisonResult v6 = CFStringCompare(@"TRUE", (CFStringRef)value, 0);
    byte_10027D170 = v6 == kCFCompareEqualTo;
    uint64_t v7 = "FALSE";
    if (v6 == kCFCompareEqualTo) {
      uint64_t v7 = "TRUE";
    }
    NSLog(@"LogToFile read from preference %s", v7);
    int v8 = 0;
  }
  else
  {
    NSLog(@"LogToFile not found");
    byte_10027D170 = 0;
    int v8 = 1;
  }
  if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, @"LogLevels", (const void **)&value)
    || (CFTypeID v9 = CFStringGetTypeID(), v9 != CFGetTypeID(value)))
  {
    NSLog(@"LogLevels not found");
    goto LABEL_16;
  }
  sscanf((const char *)[value UTF8String], "0x%08x", asc_10027CCF8);
  NSLog(@"LogLevels read from preference 0x%08x", *(unsigned int *)asc_10027CCF8);
  CFRelease(v3);
  if (v8) {
    goto LABEL_17;
  }
}

+ (int)getNumberOfSavedLogFiles:(int *)a3 new:(int *)a4
{
  int v30 = 0;
  CFComparisonResult v6 = +[NSDate distantFuture];
  uint64_t v7 = +[NSDate distantPast];
  int v8 = +[NSFileManager defaultManager];
  CFTypeID v9 = [(NSFileManager *)v8 contentsOfDirectoryAtPath:qword_10027D220 error:0];
  if (v9)
  {
    v26 = a3;
    v27 = a4;
    v10 = [(NSArray *)v9 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"SELF like %@", @"WirelessRadioManager-????.log"]];
    int v11 = [(NSArray *)v10 count];
    int v25 = v11;
    if (v11 >= 1)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v11;
      int v28 = -1;
      int v29 = -1;
      while (1)
      {
        id v14 = [(NSArray *)v10 objectAtIndex:v12];
        id v15 = [(id)qword_10027D220 stringByAppendingPathComponent:v14];
        uint64_t v16 = [+[NSFileManager defaultManager] attributesOfItemAtPath:v15 error:0];
        if (!v16)
        {
          NSLog(@"Failed to get attributes for %@", v15);
          goto LABEL_11;
        }
        v17 = v16;
        v18 = +[NSScanner scannerWithString:v14];
        [(NSScanner *)v18 scanString:@"WirelessRadioManager-" intoString:0];
        if (![(NSScanner *)v18 scanInt:&v30])
        {
          NSLog(@"Failed to get index number from %@", v14);
          goto LABEL_11;
        }
        v19 = [(NSDictionary *)v17 objectForKey:NSFileCreationDate];
        id v20 = [(NSDate *)v19 compare:v6];
        if (v20)
        {
          if (v20 != (id)-1) {
            goto LABEL_16;
          }
          int v21 = v30;
        }
        else
        {
          int v21 = v30;
          if (v30 >= v29) {
            goto LABEL_16;
          }
        }
        CFComparisonResult v6 = v19;
        int v29 = v21;
LABEL_16:
        id v22 = [(NSDate *)v19 compare:v7];
        if (v22)
        {
          if (v22 == (id)1)
          {
            int v23 = v30;
LABEL_20:
            int v28 = v23;
            goto LABEL_12;
          }
        }
        else
        {
          int v23 = v30;
          if (v30 > v28) {
            goto LABEL_20;
          }
        }
LABEL_11:
        v19 = v7;
LABEL_12:
        ++v12;
        uint64_t v7 = v19;
        if (v13 == v12) {
          goto LABEL_23;
        }
      }
    }
    int v28 = -1;
    int v29 = -1;
LABEL_23:
    int result = v25;
    int *v26 = v29;
    int *v27 = v28;
  }
  else
  {
    NSLog(@"Failed to get contents of %@", qword_10027D220);
    return -1;
  }
  return result;
}

+ (void)logToFile:(id)a3
{
  CFTypeID v5 = +[NSFileManager defaultManager];
  if ([(NSFileManager *)v5 fileExistsAtPath:qword_10027D228])
  {
    CFComparisonResult v6 = (void *)qword_10027D238;
    if (qword_10027D238) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = +[NSFileManager defaultManager];
    [(NSFileManager *)v7 createFileAtPath:qword_10027D228 contents:0 attributes:0];
    if (qword_10027D238)
    {
      [(id)qword_10027D238 closeFile];

      qword_10027D238 = 0;
    }
  }
  int v8 = +[NSFileHandle fileHandleForWritingAtPath:qword_10027D228];
  qword_10027D238 = (uint64_t)v8;
  if (!v8)
  {
    NSLog(@"Failed to open handle to %@", qword_10027D228);
    return;
  }
  CFTypeID v9 = v8;
  CFComparisonResult v6 = (void *)qword_10027D238;
LABEL_8:
  [v6 writeData:[a3 dataUsingEncoding:4]];
  if ((unint64_t)[(id)qword_10027D238 seekToEndOfFile] >= 0x989681)
  {
    uint64_t v14 = 0;
    id v10 = [a1 getNumberOfSavedLogFiles:(char *)&v14 + 4 new:&v14];
    if ((v10 & 0x80000000) != 0)
    {
      NSLog(@"Just return because of numberOfSavedLogFiles(%d)", v10);
    }
    else
    {
      if (v10 >= 3) {
        [[+[NSFileManager defaultManager](NSFileManager, "defaultManager") removeItemAtPath:[objc_msgSend((id)qword_10027D220, "stringByAppendingFormat:", @"/WirelessRadioManager-%04i.log", HIDWORD(v14))] error:0];
      }
      if (v14 == 9999) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = (v14 + 1);
      }
      id v12 = [[(id)qword_10027D220 stringByAppendingFormat:@"/WirelessRadioManager-%04i.log", v11];
      if ([+[NSFileManager defaultManager] fileExistsAtPath:v12])
      {
        NSLog(@"Remove %@ existing already", v12);
        [+[NSFileManager defaultManager] removeItemAtPath:v12 error:0];
      }
      id v13 = [(id)qword_10027D220 stringByAppendingPathComponent:@"WirelessRadioManager.log"];
      if ([+[NSFileManager defaultManager] copyItemAtPath:v13 toPath:v12 error:0])
      {
        [(id)qword_10027D238 truncateFileAtOffset:0];
      }
      else
      {
        NSLog(@"Failed to copy %@ to %@", v13, v12);
      }
    }
  }
}

+ (void)reloadiRATSettingsFromPreferences
{
  CFDictionaryRef v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"iRATDebug", @"com.apple.WirelessRadioManager.debug");
  if (!v2)
  {
    NSLog(@"iRATDebug not Found");
    sub_1000CA238(0);
    BOOL v7 = 0;
LABEL_25:
    +[WCM_Logging setiRATSettingsToPreferences:v7];
    return;
  }
  CFDictionaryRef v3 = v2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v3))
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(v3, @"HandoverAlert", (const void **)&value)
      && (CFTypeID v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
    {
      CFComparisonResult v6 = CFStringCompare(@"TRUE", (CFStringRef)value, 0);
      BOOL v7 = v6 == kCFCompareEqualTo;
      int v8 = "FALSE";
      if (v6 == kCFCompareEqualTo) {
        int v8 = "TRUE";
      }
      NSLog(@"HandoverAlert read from preference %s", v8);
      int v9 = 0;
    }
    else
    {
      NSLog(@"HandoverAlert not found");
      BOOL v7 = 0;
      int v9 = 1;
    }
    CFTypeRef cf = 0;
    if (CFDictionaryGetValueIfPresent(v3, @"iRATPolicy", &cf)
      && (CFTypeID v10 = CFStringGetTypeID(), v10 == CFGetTypeID(cf)))
    {
      if (CFStringCompare(@"DYNAMICPOLICY", (CFStringRef)cf, 0))
      {
        if (CFStringCompare(@"WIFIPREFERRED", (CFStringRef)cf, 0))
        {
          if (CFStringCompare(@"IMSPREFERRED", (CFStringRef)cf, 0))
          {
            if (CFStringCompare(@"CELLULARPREFERRED", (CFStringRef)cf, 0)) {
              uint64_t v11 = 0;
            }
            else {
              uint64_t v11 = 3;
            }
          }
          else
          {
            uint64_t v11 = 2;
          }
        }
        else
        {
          uint64_t v11 = 1;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      NSLog(@"reloadiRATSettingsFromPreferences iRATPolicy = %lu", v11);
      sub_1000CA294(v11);
    }
    else
    {
      NSLog(@"stored iRAT Policy not found");
    }
  }
  else
  {
    NSLog(@"iRATDebug not Found");
    BOOL v7 = 0;
    int v9 = 1;
  }
  CFRelease(v3);
  sub_1000CA238(v7);
  if (v9) {
    goto LABEL_25;
  }
}

+ (void)setiRATSettingsToPreferences:(BOOL)a3
{
  CFDictionaryRef v3 = "FALSE";
  if (a3) {
    CFDictionaryRef v3 = "TRUE";
  }
  values = +[NSString stringWithFormat:@"%s", v3];
  keys = @"HandoverAlert";
  CFDictionaryRef v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFPreferencesSetAppValue(@"iRATDebug", v4, @"com.apple.WirelessRadioManager.debug");
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(@"com.apple.WirelessRadioManager.debug")) {
    NSLog(@"%s: Failed to sync the preferences.", "+[WCM_Logging setiRATSettingsToPreferences:]");
  }
}

+ (id)stringFromXPCObjectWithPrefix:(id)a3 prefix:(id)a4
{
  CFDictionaryRef v4 = 0;
  if (a3)
  {
    if (a4)
    {
      CFDictionaryRef v4 = xpc_copy_description(a3);
      if (v4)
      {
        CFComparisonResult v6 = +[NSString stringWithUTF8String:v4];
        free(v4);
        BOOL v7 = [(NSString *)v6 componentsSeparatedByString:@"\n"];
        CFDictionaryRef v4 = (char *)objc_alloc_init((Class)NSMutableString);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              if ([v12 length]) {
                [v4 appendFormat:@"%@%@\n", a4, v12];
              }
            }
            id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v9);
        }
      }
    }
  }
  return v4;
}

@end