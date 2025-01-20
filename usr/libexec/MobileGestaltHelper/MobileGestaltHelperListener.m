@interface MobileGestaltHelperListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needsNewCachePostBoot;
- (BOOL)setCacheSentinel;
- (id)getSentinelPath;
- (id)processNameForConnection:(id)a3;
- (id)queryBootUUID;
- (void)getAppleTVMode:(id)a3;
- (void)getServerAnswerForQuestion:(id)a3 reply:(id)a4;
- (void)getSpringboardRegionOverride:(id)a3 reply:(id)a4;
- (void)rebuildCache:(id)a3;
- (void)setCacheSentinel:(id)a3;
@end

@implementation MobileGestaltHelperListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileGestaltHelper];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)getServerAnswerForQuestion:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  v9 = +[NSXPCConnection currentConnection];
  v10 = (void *)_MGServerCopyAnswerWithError();
  v11 = +[NSMutableDictionary dictionary];
  if (_MGServerQuestionIsPlatform())
  {
    v12 = _MGGetFastPathLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(MobileGestaltHelperListener *)self processNameForConnection:v9];
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "platform fast path elided: caller = %@, question = %@", buf, 0x16u);
    }
  }
  if (v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    v14 = [(MobileGestaltHelperListener *)self processNameForConnection:v9];
    *(_DWORD *)buf = 138412802;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22[0] = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "asked question: p = %@, q = %@, a = %@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    v14 = [(MobileGestaltHelperListener *)self processNameForConnection:v9];
    *(_DWORD *)buf = 138413058;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    LODWORD(v22[0]) = 0;
    WORD2(v22[0]) = 2112;
    *(void *)((char *)v22 + 6) = @"no log";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "asked question: p = %@, q = %@, e = %d [%@]", buf, 0x26u);
  }

LABEL_11:
  v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0, 0);
  [v11 setObject:v15 forKeyedSubscript:@"error"];

  if (v10) {
    [v11 setObject:v10 forKeyedSubscript:@"answer"];
  }
  if (cf)
  {
    [v11 setObject:cf forKeyedSubscript:@"logString"];
    CFRelease(cf);
  }
  v7[2](v7, v11);
}

- (id)processNameForConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  long long buffer = 0u;
  memset(v35, 0, sizeof(v35));
  if (v3)
  {
    [v3 auditToken];
    uint64_t v5 = v31;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = +[NSString stringWithFormat:@"[unknown caller].%d", v5];
  int v7 = proc_pidinfo(v5, 13, 0, &buffer, 64);
  if (v7 == 64)
  {
    uint64_t v22 = +[NSString stringWithFormat:@"%s.%d", v35, v5];

    id v6 = (void *)v22;
    goto LABEL_17;
  }
  int v8 = v7;
  if (v7 != -1)
  {
    v23 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
    if (v23) {
      v29 = v23 + 1;
    }
    else {
      v29 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
    }
    sub_1000018D0((uint64_t)v29, 58, @"proc_pidinfo: wrong size: actual = %d, expected = %lu", v24, v25, v26, v27, v28, v8);
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 67109376;
    LODWORD(v33[0]) = v8;
    WORD2(v33[0]) = 2048;
    *(void *)((char *)v33 + 6) = 64;
    id v20 = "proc_pidinfo: wrong size: actual = %d, expected = %lu";
    uint32_t v21 = 18;
    goto LABEL_16;
  }
  v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
  v10 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
  if (v10) {
    v9 = v10 + 1;
  }
  v11 = __error();
  char v12 = strerror(*v11);
  sub_1000018D0((uint64_t)v9, 56, @"proc_pidinfo: %s", v13, v14, v15, v16, v17, v12);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v18 = __error();
    __int16 v19 = strerror(*v18);
    *(_DWORD *)buf = 136315138;
    v33[0] = v19;
    id v20 = "proc_pidinfo: %s";
    uint32_t v21 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
  }
LABEL_17:

  return v6;
}

- (void)getSpringboardRegionOverride:(id)a3 reply:(id)a4
{
  id v18 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  int v7 = (void *)MGCopyAnswer();
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  int v8 = (void *)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v9 = +[NSLocale localeWithLocaleIdentifier:v8];
  v10 = [v9 regionCode];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    v11 = +[NSLocale currentLocale];
    v10 = [v11 regionCode];

    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_8;
  }
LABEL_9:

  char v12 = 0;
  if (v7 && v10)
  {
    uint64_t v13 = +[NSFileManager defaultManager];
    uint64_t v14 = [v13 stringWithFileSystemRepresentation:"/System/Library/CoreServices/RegionalOverrideSoftwareBehaviors.plist" length:68];

    uint64_t v15 = +[NSDictionary dictionaryWithContentsOfFile:v14];
    uint64_t v16 = [v15 objectForKey:v7];

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v17 = [v16 objectForKey:v10];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v12 = [v17 objectForKey:v18];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  v5[2](v5, v12);
}

- (void)getAppleTVMode:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = +[NSXPCConnection currentConnection];
  int v7 = +[NSMutableDictionary dictionary];
  if (objc_opt_class())
  {
    int v8 = +[CADisplay mainDisplay];
    v9 = [v8 currentMode];

    if (v9)
    {
      v10 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v9 width]);
      [v7 setObject:v10 forKeyedSubscript:@"width"];

      v11 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v9 height]);
      [v7 setObject:v11 forKeyedSubscript:@"height"];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000276C(self, (uint64_t)v6, (uint64_t)v9);
    }
  }
  v4[2](v4, v7);
}

- (void)rebuildCache:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = +[NSXPCConnection currentConnection];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(MobileGestaltHelperListener *)self processNameForConnection:v6];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested a cache rebuild: p = %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = _MGRebuildCache();
  v4[2](v4, v8);
}

- (void)setCacheSentinel:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = +[NSXPCConnection currentConnection];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(MobileGestaltHelperListener *)self processNameForConnection:v6];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested a cache sentinel: p = %@", (uint8_t *)&v8, 0xCu);
  }
  v4[2](v4, [(MobileGestaltHelperListener *)self setCacheSentinel]);
}

- (id)queryBootUUID
{
  __int16 v15 = 0;
  memset(v14, 0, sizeof(v14));
  size_t v11 = 50;
  if (sysctlbyname("kern.bootsessionuuid", v14, &v11, 0, 0) == -1)
  {
    id v3 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
    if (v3) {
      int v9 = v3 + 1;
    }
    else {
      int v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
    }
    sub_1000018D0((uint64_t)v9, 221, @"Could not lookup %s", v4, v5, v6, v7, v8, (char)"kern.bootsessionuuid");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "kern.bootsessionuuid";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not lookup %s", buf, 0xCu);
    }
    v2 = 0;
  }
  else
  {
    v2 = +[NSString stringWithUTF8String:v14];
  }

  return v2;
}

- (id)getSentinelPath
{
  return [@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.mobilegestaltcache/Library/Caches/com.apple.MobileGestalt.plist" stringByAppendingString:@".rebuild"];
}

- (BOOL)setCacheSentinel
{
  id v3 = [(MobileGestaltHelperListener *)self getSentinelPath];
  if (!v3)
  {
LABEL_8:
    id v8 = 0;
    uint64_t v5 = 0;
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  uint64_t v4 = [(MobileGestaltHelperListener *)self queryBootUUID];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002818();
    }
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  id v10 = 0;
  BOOL v6 = 1;
  unsigned __int8 v7 = [v4 writeToFile:v3 atomically:1 encoding:4 error:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002860((uint64_t)v5, (uint64_t)v3, v8);
    }
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (BOOL)needsNewCachePostBoot
{
  id v3 = [(MobileGestaltHelperListener *)self getSentinelPath];
  uint64_t v4 = +[NSFileManager defaultManager];
  uint64_t v5 = v4;
  if (v3 && [v4 fileExistsAtPath:v3])
  {
    id v16 = 0;
    BOOL v6 = +[NSString stringWithContentsOfFile:v3 encoding:4 error:&v16];
    id v7 = v16;
    if (v6)
    {
      id v8 = [(MobileGestaltHelperListener *)self queryBootUUID];
      unsigned __int8 v9 = [v6 isEqualToString:v8];
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Boot UUIDs match %@", buf, 0xCu);
        }
        id v11 = v7;
      }
      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "New cache needed", buf, 2u);
        }
        id v15 = v7;
        unsigned __int8 v13 = [v5 removeItemAtPath:v3 error:&v15];
        id v11 = v15;

        if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000029B8(v11);
        }
      }
      char v12 = v9 ^ 1;

      id v7 = v11;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100002920(v7);
      }
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

@end