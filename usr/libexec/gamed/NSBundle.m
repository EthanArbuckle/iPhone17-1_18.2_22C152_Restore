@interface NSBundle
+ (id)_gkBundleIdentifierFromAuditToken:(id *)a3;
+ (id)_gkBundleIdentifierFromConnection:(id)a3;
+ (id)_gkBundleIdentifierFromPID:(int)a3;
+ (id)_gkBundleIdentifierOrProcessNameForPID:(int)a3;
+ (id)_gkBundleInfoWithPID:(int)a3;
+ (id)_gkBundleWithIdentifier:(id)a3;
+ (id)_gkBundleWithPID:(int)a3;
+ (id)_gkLocalizedMessageFromDictionary:(id)a3 forBundleID:(id)a4;
+ (id)_gkLocalizedMessageFromPushDictionary:(id)a3 forBundleID:(id)a4;
+ (id)executablePathForPid:(int)a3;
+ (id)executableURLForPid:(int)a3;
- (BOOL)_gkIsBadgingEnabled;
- (BOOL)_gkIsGameCenterEnabled;
@end

@implementation NSBundle

+ (id)_gkBundleIdentifierFromAuditToken:(id *)a3
{
  CFErrorRef error = 0;
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v5 = error;
    v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v7 = (id)GKOSLoggers();
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000CB698((uint64_t)error, v6, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_15;
  }
  long long v14 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v14;
  v15 = SecTaskCreateWithAuditToken(0, &token);
  if (!v15)
  {
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v16 = v15;
  CFErrorRef error = 0;
  v5 = (void *)SecTaskCopySigningIdentifier(v15, &error);
  CFRelease(v16);
  if (error)
  {
    v17 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v18 = (id)GKOSLoggers();
      v17 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = error;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier() failed %@", (uint8_t *)&token, 0xCu);
    }
    CFRelease(error);
    goto LABEL_13;
  }
  if (!v5)
  {
LABEL_13:

    goto LABEL_14;
  }
  v20 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v21 = (id)GKOSLoggers();
    v20 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(void *)&token.val[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier(): %@", (uint8_t *)&token, 0xCu);
  }
LABEL_15:

  return v5;
}

+ (id)_gkBundleIdentifierFromConnection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  v6 = [a1 _gkBundleIdentifierFromAuditToken:v9];
  if (!v6)
  {
    id v7 = [v5 processIdentifier];
    if (v7)
    {
      v6 = [a1 _gkBundleIdentifierFromPID:v7];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (id)_gkBundleIdentifierOrProcessNameForPID:(int)a3
{
  id v4 = [(id)objc_opt_class() executablePathForPid:*(void *)&a3];
  if (!v4)
  {
    CFDictionaryRef v11 = 0;
    goto LABEL_29;
  }
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  CFURLRef v7 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
  if (v7)
  {
    CFURLRef v8 = v7;
    uint64_t v9 = CFBundleCreate(0, v7);
    if (v9)
    {
      uint64_t v10 = v9;
      CFBundleGetIdentifier(v9);
      CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers();
      }
      uint64_t v13 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFDictionaryRef v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Getting bundleId from bundleURL %@", buf, 0xCu);
      }
      CFRelease(v10);
      CFRelease(v8);
      if (v11) {
        goto LABEL_28;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  CFDictionaryRef v14 = CFBundleCopyInfoDictionaryForURL(v6);
  if (!v14) {
    goto LABEL_23;
  }
  CFDictionaryRef v15 = v14;
  CFDictionaryRef v11 = [(__CFDictionary *)v14 objectForKey:@"CFBundleIdentifier"];
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  v17 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Getting bundleId from plist in binary %@", buf, 0xCu);
  }

  if (!v11)
  {
LABEL_23:
    if (!proc_name(a3, buf, 0x400u)) {
      goto LABEL_24;
    }
    CFDictionaryRef v11 = +[NSString stringWithUTF8String:buf];
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      CFDictionaryRef v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Getting bundleID in debug from pid/procname %@", (uint8_t *)&v23, 0xCu);
    }
    if (!v11)
    {
LABEL_24:
      CFDictionaryRef v11 = [(__CFString *)v4 lastPathComponent];
      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers();
      }
      id v21 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFDictionaryRef v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Getting bundleId from process name %@", buf, 0xCu);
      }
    }
  }
LABEL_28:
  CFRelease(v6);
LABEL_29:

  return v11;
}

+ (id)executablePathForPid:(int)a3
{
  int v3 = proc_pidpath(a3, buffer, 0x1000u);
  if (v3 < 1) {
    id v4 = 0;
  }
  else {
    id v4 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v3 encoding:4];
  }

  return v4;
}

+ (id)executableURLForPid:(int)a3
{
  int v3 = [(id)objc_opt_class() executablePathForPid:*(void *)&a3];
  if (v3)
  {
    id v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_gkBundleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[GKApplicationWorkspace defaultWorkspace];
  v5 = [v4 applicationProxyForBundleID:v3];

  CFURLRef v6 = [v5 bundle];

  return v6;
}

+ (id)_gkBundleWithPID:(int)a3
{
  id v4 = [(id)objc_opt_class() executableURLForPid:*(void *)&a3];
  if (v4)
  {
    v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (v5)
    {
      CFURLRef v6 = [a1 bundleWithURL:v5];
    }
    else
    {
      CFURLRef v6 = 0;
    }
  }
  else
  {
    CFURLRef v6 = 0;
  }

  return v6;
}

+ (id)_gkBundleInfoWithPID:(int)a3
{
  CFURLRef v3 = [(id)objc_opt_class() executableURLForPid:*(void *)&a3];
  CFURLRef v4 = v3;
  if (v3) {
    CFDictionaryRef v5 = CFBundleCopyInfoDictionaryForURL(v3);
  }
  else {
    CFDictionaryRef v5 = 0;
  }

  return v5;
}

+ (id)_gkBundleIdentifierFromPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFURLRef v4 = +[NSBundle _gkBundleWithPID:](NSBundle, "_gkBundleWithPID:");
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFURLRef v6 = [v4 bundleIdentifier];
    CFURLRef v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v8 = (id)GKOSLoggers();
      CFURLRef v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000CB62C((uint64_t)v6, v7, v9, v10, v11, v12, v13, v14);
    }
LABEL_6:

    goto LABEL_14;
  }
  CFDictionaryRef v15 = +[NSBundle _gkBundleInfoWithPID:v3];
  CFDictionaryRef v5 = v15;
  if (v15)
  {
    uint64_t v16 = [v15 objectForKey:@"CFBundleIdentifier"];
    if (v16)
    {
      CFURLRef v6 = (void *)v16;
      v17 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v18 = (id)GKOSLoggers();
        v17 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000CB5C0((uint64_t)v6, v17, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_6;
    }
  }

  CFURLRef v6 = 0;
LABEL_14:

  return v6;
}

+ (id)_gkLocalizedMessageFromDictionary:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  id v6 = a3;
  CFURLRef v7 = [v6 objectForKey:@"loc-key"];
  id v8 = [v6 objectForKey:@"loc-args"];
  id v9 = [v6 objectForKey:@"loc-default"];

  if (!v9) {
    id v9 = v7;
  }
  uint64_t v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 bundleIdentifier];
  if ([v11 isEqualToString:v5])
  {

LABEL_9:
    CFDictionaryRef v15 = +[NSBundle mainBundle];
    goto LABEL_10;
  }
  uint64_t v13 = +[GKApplicationWorkspace defaultWorkspace];
  unsigned int v14 = [v13 applicationIsInstalled:v5];

  if (!v14) {
    goto LABEL_9;
  }
  CFDictionaryRef v15 = +[NSBundle _gkBundleWithIdentifier:v5];
LABEL_10:
  uint64_t v16 = v15;
  uint64_t v12 = [v15 _gkLocalizedStringForKey:v7 defaultValue:v9 arguments:v8];

LABEL_11:

  return v12;
}

+ (id)_gkLocalizedMessageFromPushDictionary:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    CFURLRef v7 = [v6 objectForKeyedSubscript:@"k"];
    id v8 = [v6 objectForKeyedSubscript:@"a"];
    id v9 = [v6 objectForKeyedSubscript:@"d"];

    if (!v9) {
      id v9 = v7;
    }
    uint64_t v10 = +[GKApplicationWorkspace defaultWorkspace];
    unsigned int v11 = [v10 applicationIsInstalled:v5];

    if (v11
      && (+[NSBundle _gkBundleWithIdentifier:v5],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v13 = v12;
      id v14 = [v12 _gkLocalizedStringForKey:v7 defaultValue:v9 arguments:v8];
    }
    else
    {
      id v14 = v9;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_gkIsGameCenterEnabled
{
  v2 = [(NSBundle *)self bundleIdentifier];
  uint64_t v3 = +[GKApplicationWorkspace defaultWorkspace];
  CFURLRef v4 = [v3 applicationProxyForBundleID:v2];

  LOBYTE(v3) = [v4 isGameCenterEnabled];
  return (char)v3;
}

- (BOOL)_gkIsBadgingEnabled
{
  v2 = [(NSBundle *)self infoDictionary];
  uint64_t v3 = [v2 objectForKey:@"GKGameCenterBadgingDisabled"];

  if (v3) {
    unsigned int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

@end