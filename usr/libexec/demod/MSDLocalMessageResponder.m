@interface MSDLocalMessageResponder
+ (id)sharedInstance;
- (BOOL)checkEntitlementsWithRequest:(id)a3 from:(id)a4;
- (BOOL)demoPrepareInProgress;
- (BOOL)saveOperationRequestIfNeeded:(id)a3 completeBy:(int)a4;
- (OS_os_transaction)transaction;
- (OS_xpc_object)connectionForPricing;
- (OS_xpc_object)xpcListener;
- (id)getEntitlementsFrom:(id)a3;
- (void)_handleCloseRunningAppsRequest:(id)a3 from:(id)a4;
- (void)_handleDeviceCheckInOp:(id)a3 from:(id)a4;
- (void)_handleInitializeDeviceSettingsOp:(id)a3 from:(id)a4;
- (void)_handleMarkAsNotDemo:(id)a3 from:(id)a4;
- (void)_handleRefreshDeviceSettingsOp:(id)a3 from:(id)a4;
- (void)_handleStoreSearchOp:(id)a3 from:(id)a4;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)lostClientConnection:(id)a3;
- (void)sendRebootTimeoutMessageToPricing:(int)a3;
- (void)setConnectionForPricing:(id)a3;
- (void)setDemoPrepareInProgress:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
@end

@implementation MSDLocalMessageResponder

+ (id)sharedInstance
{
  if (qword_100189958 != -1) {
    dispatch_once(&qword_100189958, &stru_100152610);
  }
  v2 = (void *)qword_100189950;

  return v2;
}

- (id)getEntitlementsFrom:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  xpc_connection_get_audit_token();
  memset(&v29, 0, sizeof(v29));
  v3 = SecTaskCreateWithAuditToken(0, &v29);
  if (v3)
  {
    v4 = v3;
    v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0);
    v6 = (_UNKNOWN **)SecTaskCopyValueForEntitlement(v4, @"com.apple.private.mobilestoredemo.enabledemo", 0);
    if (v6)
    {
      v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 != CFBooleanGetTypeID())
      {
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 != CFArrayGetTypeID()) {
          v7 = 0;
        }
LABEL_8:
        v10 = +[MSDPlatform sharedInstance];
        if ([v10 macOS])
        {
          if ([(__CFString *)v5 containsString:@"com.apple.SecurityAgentHelper"])
          {
          }
          else
          {
            unsigned __int8 v11 = [(__CFString *)v5 containsString:@"com.apple.SecurityAgent"];

            if ((v11 & 1) == 0)
            {
LABEL_14:
              CFRelease(v4);
              goto LABEL_15;
            }
          }
          v10 = v7;
          v7 = &off_100162C38;
        }

        goto LABEL_14;
      }
      if (CFBooleanGetValue((CFBooleanRef)v7))
      {
        CFRelease(v7);
        v7 = &off_100162C20;
        goto LABEL_8;
      }
    }
    else
    {
      v21 = sub_100068730();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CBB48(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    v7 = 0;
    goto LABEL_8;
  }
  v13 = sub_100068730();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000CBAD0(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v5 = 0;
  v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)checkEntitlementsWithRequest:(id)a3 from:(id)a4
{
  id v6 = a3;
  v7 = [(MSDLocalMessageResponder *)self getEntitlementsFrom:a4];
  if (!v7)
  {
    uint64_t v19 = sub_100068730();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000CBBC0();
    }

    goto LABEL_37;
  }
  string = xpc_dictionary_get_string(v6, "RequestOperation");
  if (string)
  {
    CFTypeID v9 = +[NSString stringWithUTF8String:string];
    if ([v9 isEqualToString:@"GetDeviceOptions"]
      && (v10 = xpc_dictionary_get_string(v6, "SubKey")) != 0)
    {
      unsigned __int8 v11 = +[NSString stringWithUTF8String:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
    if ([&off_100162C68 containsObject:v9])
    {
      CFStringRef v12 = @"Enroll";
    }
    else
    {
      if ([&off_100162C50 containsObject:v9])
      {
        if ([v7 containsObject:@"Manage"]) {
          goto LABEL_11;
        }
        if (![v7 containsObject:@"DigitalCatalog"])
        {
LABEL_36:

LABEL_37:
          BOOL v17 = 0;
          goto LABEL_25;
        }
        v13 = &off_100162C98;
        CFStringRef v12 = v11;
LABEL_10:
        if ([v13 containsObject:v12])
        {
LABEL_11:

          goto LABEL_12;
        }
        goto LABEL_36;
      }
      if ([&off_100162C80 containsObject:v9])
      {
        CFStringRef v12 = @"AccessPersistDemoVolume";
      }
      else if ([&off_100162CB0 containsObject:v9])
      {
        CFStringRef v12 = @"KeychainAccess";
      }
      else if ([&off_100162CC8 containsObject:v9])
      {
        CFStringRef v12 = @"UserKeychainAccess";
      }
      else
      {
        if (![&off_100162CE0 containsObject:v9])
        {
          if ([&off_100162CF8 containsObject:v9]
            && [v7 containsObject:@"PeerDemoDevice"])
          {
            goto LABEL_11;
          }
          goto LABEL_36;
        }
        CFStringRef v12 = @"SecurityPlugin";
      }
    }
    v13 = (_UNKNOWN **)v7;
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v14 = xpc_dictionary_get_string(v6, "QueryDeviceInfo");
  if (v14)
  {
    int v15 = strncmp(v14, "MSDDemoDeviceFrozen", 0x14uLL);
    unsigned int v16 = [v7 containsObject:@"Manage"];
    if (v15)
    {
      if (!v16) {
        goto LABEL_37;
      }
    }
    else if ((v16 & 1) == 0 && ([v7 containsObject:@"SecurityPlugin"] & 1) == 0)
    {
      goto LABEL_37;
    }
  }
  if (xpc_dictionary_get_string(v6, "PricingMessage")
    && ([v7 containsObject:@"Manage"] & 1) == 0)
  {
    goto LABEL_37;
  }
  BOOL v17 = 1;
LABEL_25:

  return v17;
}

- (void)start
{
  v3 = [(MSDLocalMessageResponder *)self xpcListener];

  if (!v3)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemod", 0, 1uLL);
    [(MSDLocalMessageResponder *)self setXpcListener:mach_service];

    v5 = [(MSDLocalMessageResponder *)self xpcListener];

    if (!v5)
    {
      unsigned __int8 v11 = sub_100068730();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", buf, 2u);
      }

      exit(1);
    }
    id v6 = [(MSDLocalMessageResponder *)self xpcListener];
    v7 = +[MSDWorkQueueSet sharedInstance];
    CFTypeID v8 = [v7 messageQueue];
    xpc_connection_set_target_queue(v6, v8);

    CFTypeID v9 = [(MSDLocalMessageResponder *)self xpcListener];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000383F0;
    handler[3] = &unk_100152638;
    handler[4] = self;
    xpc_connection_set_event_handler(v9, handler);

    v10 = [(MSDLocalMessageResponder *)self xpcListener];
    xpc_connection_resume(v10);
  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  id v5 = a3;
  connection = (_xpc_connection_s *)a4;
  uint64_t v323 = 0;
  v324 = (id *)&v323;
  uint64_t v325 = 0x3032000000;
  v326 = sub_10003C344;
  v327 = sub_10003C354;
  id v328 = 0;
  uint64_t v319 = 0;
  v320 = &v319;
  uint64_t v321 = 0x2020000000;
  char v322 = 0;
  v271 = +[MSDPricingUpdateController sharedInstance];
  id v6 = sub_100068730();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000CC628();
  }

  unsigned __int8 v7 = [(MSDLocalMessageResponder *)self checkEntitlementsWithRequest:v5 from:connection];
  *((unsigned char *)v320 + 24) = v7;
  if ((v7 & 1) == 0)
  {
    reply = sub_100068730();
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
      sub_1000CC5F4();
    }
    v274 = 0;
    v275 = 0;
    v279 = 0;
    v269 = 0;
    v270 = 0;
    v272 = 0;
    v273 = 0;
    v276 = 0;
    v277 = 0;
    CFTypeID v9 = 0;
    goto LABEL_128;
  }
  v279 = +[MSDTargetDevice sharedInstance];
  v275 = +[MSDDemoUpdateController sharedInstance];
  v274 = +[MSDPairedWatchProxy sharedInstance];
  CFTypeID v8 = +[NSDictionary dictionaryWithXPCDictionary:v5];
  CFTypeID v9 = v8;
  if (!v8)
  {
    v269 = 0;
    v270 = 0;
    v272 = 0;
    v273 = 0;
    v276 = 0;
    v277 = 0;
    goto LABEL_127;
  }
  v277 = [v8 objectForKey:@"ContentServer"];
  v276 = [v9 objectForKey:@"Port"];
  v273 = [v9 objectForKey:@"PairingCredential"];
  v272 = [v9 objectForKey:@"DeviceName"];
  v270 = [v9 objectForKey:@"ContainerUniqueIdentifier"];
  v269 = [v9 objectForKey:@"PersistentDataBlob"];
  string = xpc_dictionary_get_string(v5, "RequestOperation");
  if (!string) {
    goto LABEL_80;
  }
  unsigned __int8 v11 = sub_100068730();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received an operation request: %{public}s", buf, 0xCu);
  }

  int64_t int64 = xpc_dictionary_get_int64(v5, "Duration");
  if (int64)
  {
    v13 = +[NSDate dateWithTimeIntervalSinceNow:(double)int64];
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;

    uint64_t v16 = (int)v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  BOOL v17 = xpc_dictionary_get_BOOL(v5, "IgnorePairedDevice");
  if ([v279 isBetterTogetherDemo]) {
    unsigned int v18 = [v274 paired] & !v17;
  }
  else {
    unsigned int v18 = 0;
  }
  uint64_t v19 = +[NSString stringWithCString:string encoding:4];
  unsigned __int8 v20 = [(MSDLocalMessageResponder *)self saveOperationRequestIfNeeded:v19 completeBy:v16];
  *((unsigned char *)v320 + 24) = v20;

  v21 = v320;
  if (!*((unsigned char *)v320 + 24)) {
    goto LABEL_127;
  }
  if (!strncmp(string, "DemoEnroll", 0xBuLL))
  {
    if (v277 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v276)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v273)
          {
            uint64_t v23 = sub_100068730();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: warning: no credential from app", buf, 0xCu);
            }
          }
          if (!v272)
          {
            uint64_t v24 = sub_100068730();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: warning: no device name from app", buf, 0xCu);
            }
          }
          [v279 setupDemoDeviceMetadataFolder];
          [v279 setDemoEnrollmentFlag:@"enrollmentStarted"];
          uint64_t v25 = (void *)os_transaction_create();
          [(MSDLocalMessageResponder *)self setTransaction:v25];

          uint64_t v26 = +[MSDWorkQueueSet sharedInstance];
          uint64_t v27 = [v26 demoUpdateQueue];
          uint64_t v28 = block;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10003C35C;
          block[3] = &unk_100152660;
          block[4] = v279;
          v317 = &v319;
          id v312 = v275;
          id v313 = v272;
          id v314 = v273;
          id v315 = v277;
          id v316 = v276;
          v318 = &v323;
          dispatch_async(v27, block);

          goto LABEL_78;
        }
      }
      reply = sub_100068730();
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
        goto LABEL_260;
      }
    }
    else
    {
      reply = sub_100068730();
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
LABEL_260:
      }
        sub_1000CBCF8();
    }
LABEL_274:

    goto LABEL_127;
  }
  if (!strncmp(string, "DemoUpdate", 0xBuLL))
  {
    audit_token_t v29 = +[MSDWorkQueueSet sharedInstance];
    long long v30 = [v29 demoUpdateQueue];
    uint64_t v28 = v309;
    v309[0] = _NSConcreteStackBlock;
    v309[1] = 3221225472;
    v309[2] = sub_10003C4E4;
    v309[3] = &unk_100152688;
    int v310 = v16;
    v309[5] = &v319;
    v309[4] = v275;
    dispatch_async(v30, v309);

LABEL_78:
    reply = v28[4];
    goto LABEL_79;
  }
  if (!strncmp(string, "DemoMaualUpdate", 0x10uLL))
  {
    v35 = (void *)os_transaction_create();
    [(MSDLocalMessageResponder *)self setTransaction:v35];

    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    id v36 = [v279 canUnlockSnapshot];
    *((unsigned char *)v320 + 24) = (_BYTE)v36;
    if (v18)
    {
      unsigned __int8 v37 = [v274 canUnlockSnapshot:v36];
      if (*((unsigned char *)v320 + 24)) {
        LOBYTE(v36) = v37;
      }
      else {
        LOBYTE(v36) = 0;
      }
      *((unsigned char *)v320 + 24) = (_BYTE)v36;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v36);
    xpc_connection_send_message(connection, reply);
    if (*((unsigned char *)v320 + 24))
    {
      if (!v18 || (unsigned int v38 = [v274 unlockSnapshot], *((unsigned char *)v320 + 24) = v38, v38))
      {
        unsigned __int8 v39 = [v279 unlockSnapshot];
        *((unsigned char *)v320 + 24) = v39;

        goto LABEL_126;
      }
      goto LABEL_297;
    }
    v79 = sub_100068730();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_1000CBDD4();
    }
    goto LABEL_302;
  }
  if (!strncmp(string, "DemoSnapshotRevert", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    id v42 = [v279 canRevertSnapshot];
    *((unsigned char *)v320 + 24) = (_BYTE)v42;
    if (v18)
    {
      unsigned __int8 v43 = [v274 canRevertSnapshot:v42];
      if (*((unsigned char *)v320 + 24)) {
        LOBYTE(v42) = v43;
      }
      else {
        LOBYTE(v42) = 0;
      }
      *((unsigned char *)v320 + 24) = (_BYTE)v42;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v42);
    xpc_connection_send_message(connection, reply);
    if (*((unsigned char *)v320 + 24))
    {
      if (!v18 || (unsigned int v44 = [v274 revertSnapshot], *((unsigned char *)v320 + 24) = v44, v44))
      {
        unsigned __int8 v39 = [v279 revertSnapshot];
        *((unsigned char *)v320 + 24) = v39;

        goto LABEL_126;
      }
      goto LABEL_297;
    }
    v79 = sub_100068730();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_1000CBE08();
    }
LABEL_302:
    int v149 = 4;
LABEL_303:

LABEL_304:
    if (v149 != 7) {
      goto LABEL_158;
    }
    goto LABEL_127;
  }
  if (!strncmp(string, "SetLastShallowRefreshTime", 0x1AuLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    id v47 = objc_alloc_init((Class)NSDateFormatter);
    [v47 setDateFormat:@"dd-MM-yyyy_HH:mm:ss:SSS"];
    v48 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "LastShallowRefreshTime")];
    v49 = [v47 dateFromString:v48];

    v50 = +[MSDTargetDevice sharedInstance];
    [v50 saveLastShallowRefreshTime:v49];

    v51 = +[MSDAnalyticsEventHandler sharedInstance];
    [v51 sendLastShallowRefreshTime:v49];

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_79;
  }
  if (!strncmp(string, "DemoSnapshotCommit", 0x13uLL))
  {
    v61 = dispatch_get_global_queue(21, 0);
    uint64_t v28 = v306;
    v306[0] = _NSConcreteStackBlock;
    v306[1] = 3221225472;
    v306[2] = sub_10003C5C8;
    v306[3] = &unk_100152490;
    v306[4] = v5;
    id v307 = v279;
    v308 = connection;
    dispatch_async(v61, v306);

    goto LABEL_78;
  }
  if (!strncmp(string, "SetSEPDemoMode", 0xFuLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    unsigned __int8 v62 = [v279 setSEPDemoMode:xpc_dictionary_get_BOOL(v5, "SEPDemoMode")];
    *((unsigned char *)v320 + 24) = v62;
    xpc_dictionary_set_BOOL(reply, "MSDResult", v62);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "DemoPrepare", 0xCuLL))
  {
    v63 = (void *)os_transaction_create();
    [(MSDLocalMessageResponder *)self setTransaction:v63];

    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_BOOL(reply, "DemoPrepareAcknowledged", 1);
    if ([(MSDLocalMessageResponder *)self demoPrepareInProgress])
    {
      v64 = sub_100068600();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Ignore second demo prepare request as it's already started.", buf, 2u);
      }

      xpc_connection_send_message(connection, reply);
      goto LABEL_128;
    }
    [(MSDLocalMessageResponder *)self setDemoPrepareInProgress:1];
    v71 = +[MSDWorkQueueSet sharedInstance];
    v72 = [v71 demoUpdateQueue];
    v298[0] = _NSConcreteStackBlock;
    v298[1] = 3221225472;
    v298[2] = sub_10003C6A0;
    v298[3] = &unk_1001526B0;
    id v299 = v279;
    v300 = connection;
    v301 = reply;
    v304 = &v319;
    v305 = &v323;
    id v302 = v5;
    v303 = self;
    reply = reply;
    dispatch_async(v72, v298);

    goto LABEL_79;
  }
  if (!strncmp(string, "Demo", 5uLL))
  {
    v67 = (void *)os_transaction_create();
    [(MSDLocalMessageResponder *)self setTransaction:v67];

    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    id v68 = [v279 canLockSnapshot];
    *((unsigned char *)v320 + 24) = (_BYTE)v68;
    if (v18)
    {
      unsigned __int8 v69 = [v274 canLockSnapshot:v68];
      if (*((unsigned char *)v320 + 24)) {
        LOBYTE(v68) = v69;
      }
      else {
        LOBYTE(v68) = 0;
      }
      *((unsigned char *)v320 + 24) = (_BYTE)v68;
    }
    xpc_dictionary_set_BOOL(reply, "Acknowledged", (BOOL)v68);
    xpc_connection_send_message(connection, reply);
    if (*((unsigned char *)v320 + 24))
    {
      if (!v18 || (unsigned int v70 = [v274 lockSnapshot], *((unsigned char *)v320 + 24) = v70, v70))
      {
        unsigned __int8 v39 = [v279 lockSnapshot];
        *((unsigned char *)v320 + 24) = v39;

        goto LABEL_126;
      }
LABEL_297:
      int v149 = 7;
      goto LABEL_304;
    }
    v79 = sub_100068730();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_1000CBE3C();
    }
    goto LABEL_302;
  }
  if (!strncmp(string, "Virgin", 7uLL))
  {
    v73 = (void *)os_transaction_create();
    [(MSDLocalMessageResponder *)self setTransaction:v73];

    BOOL v74 = xpc_dictionary_get_BOOL(v5, "ObliterateDevice");
    BOOL v75 = xpc_dictionary_get_BOOL(v5, "PreserveESim");
    BOOL v76 = xpc_dictionary_get_BOOL(v5, "CleanUpForBetterTogether");
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    if (v76)
    {
      unsigned int v77 = [v279 canRunCleanUpForBetterTogetherDevice];
      *((unsigned char *)v320 + 24) = v77;
      if (!v77)
      {
        BOOL v83 = 0;
        goto LABEL_204;
      }
      unsigned __int8 v78 = [v279 runCleanUpForBetterTogetherDevice];
    }
    else
    {
      unsigned __int8 v78 = [v279 canUnenrollWithObliteration:v74 consultDeviceOptions:1];
    }
    BOOL v83 = v78;
    *((unsigned char *)v320 + 24) = v78;
LABEL_204:
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v83);
    xpc_connection_send_message(connection, reply);
    if (!*((unsigned char *)v320 + 24))
    {
      v167 = sub_100068730();
      if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR)) {
        sub_1000CBE70();
      }

      goto LABEL_128;
    }
    if (v76)
    {
LABEL_128:

      goto LABEL_158;
    }
    if (v18) {
      [v274 unenrollWithObliteration:v74 callUnregister:1];
    }
    unsigned __int8 v39 = [v279 unenrollWithObliteration:v74 preserveESim:v75 callUnregister:1 preserveDDLFlag:1];
    *((unsigned char *)v320 + 24) = v39;

LABEL_126:
    if (v39) {
      goto LABEL_80;
    }
LABEL_127:
    v45 = v324;
    id obj = v324[5];
    sub_1000C31D4(&obj, 3727744768, @"An error has occurred.");
    objc_storeStrong(v45 + 5, obj);
    reply = +[MSDDemoUpdateStatusHub sharedInstance];
    [reply demoUpdateFailed:v324[5]];
    goto LABEL_128;
  }
  if (!strncmp(string, "GetDeviceOptions", 0x11uLL))
  {
    v79 = [v279 getDeviceOptions];
    xpc_object_t v80 = xpc_dictionary_create_reply(v5);
    if (!v80) {
      xpc_object_t v80 = xpc_dictionary_create(0, 0, 0);
    }
    v81 = xpc_dictionary_get_string(v5, "SubKey");
    if (v81)
    {
      v82 = +[NSString stringWithUTF8String:v81];
      reply = [v79 objectForKey:v82];
    }
    else
    {
      reply = v79;
      v81 = "device_options";
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v90 = v324;
      id v297 = v324[5];
      v91 = +[NSJSONSerialization dataWithJSONObject:reply options:0 error:&v297];
      objc_storeStrong(v90 + 5, v297);
      if (v324[5])
      {
        v186 = sub_100068730();
        if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR)) {
          sub_1000CBF28();
        }

        int v149 = 4;
LABEL_353:

        goto LABEL_303;
      }
      v92 = [objc_alloc((Class)NSString) initWithData:v91 encoding:4];

      reply = v92;
    }
    if (!reply)
    {
LABEL_224:
      xpc_connection_send_message(connection, v80);

      goto LABEL_79;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        xpc_dictionary_set_string(v80, v81, (const char *)[reply UTF8String]);
      }
      else {
        xpc_dictionary_set_BOOL(v80, v81, (BOOL)[reply BOOLValue]);
      }
      goto LABEL_224;
    }
    v91 = sub_100068730();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      sub_1000CBEA4();
    }
    int v149 = 7;
    goto LABEL_353;
  }
  if (!strncmp(string, "ConfigureWiFi", 0xEuLL))
  {
    v84 = sub_100068730();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Configuring WiFi...", buf, 2u);
    }

    xpc_object_t v85 = xpc_dictionary_create_reply(v5);
    v86 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "SSID")];
    v87 = xpc_dictionary_get_string(v5, "Password");
    if (v87)
    {
      reply = +[NSString stringWithUTF8String:v87];
    }
    else
    {
      reply = 0;
    }
    v116 = sub_100068730();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v86;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "Setting up WiFi: ssid = %{public}@", buf, 0xCu);
    }

    v117 = +[MSDWiFiHelper sharedInstance];
    unsigned __int8 v118 = [v117 configureWiFi:v86 password:reply];

    if ([v279 dcotaOfflineModeDevice])
    {
      v119 = +[MSDFindMyHub sharedInstance];
      [v119 handleEnrollmentRetryUponFirstLaunch];
    }
    xpc_dictionary_set_BOOL(v85, "Result", v118);
    xpc_connection_send_message(connection, v85);

    goto LABEL_79;
  }
  if (!strncmp(string, "DisconnectAndForgetWiFi", 0x18uLL))
  {
    v88 = sub_100068730();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Disconnecting from current WiFi and forgetting all known WiFi...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    v89 = +[MSDWiFiHelper sharedInstance];
    [v89 disassociateAndForgetWiFi];

    if ([v279 isContentFrozen]) {
      [v279 setShouldForgetKnownNetworkUponUnlock:1];
    }
    xpc_dictionary_set_BOOL(reply, "Result", 1);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "SetLanguageAndRegion", 0x15uLL))
  {
    v93 = sub_100068730();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Setting Device Language and Region...", buf, 2u);
    }

    v94 = (void *)os_transaction_create();
    [(MSDLocalMessageResponder *)self setTransaction:v94];

    reply = xpc_dictionary_create_reply(v5);
    dispatch_semaphore_t v95 = dispatch_semaphore_create(0);
    v96 = +[MSDUIHelper sharedInstance];
    [v96 startFullScreenUIWith:@"LANGUAGE_UPDATE" allowCancel:0];

    BOOL value = 0;
    v97 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "languageIdentifier")];
    v98 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "regionCode")];
    v99 = +[MSDLanguageAndRegionManager sharedInstance];
    v294[0] = _NSConcreteStackBlock;
    v294[1] = 3221225472;
    v294[2] = sub_10003CC08;
    v294[3] = &unk_1001525A8;
    v100 = v95;
    v295 = v100;
    unsigned int v101 = [v99 setDeviceLanguage:v97 andRegion:v98 sbRestartNeeded:&value sbRestartHandler:v294];

    xpc_dictionary_set_BOOL(reply, "Result", v101);
    xpc_connection_send_message(connection, reply);
    if (value) {
      unsigned int v102 = v101;
    }
    else {
      unsigned int v102 = 0;
    }
    if (v102 == 1)
    {
      v103 = sub_100068600();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Waiting for Springboard restart", buf, 2u);
      }

      dispatch_time_t v104 = dispatch_time(0, 70000000000);
      if (dispatch_semaphore_wait(v100, v104))
      {
        v105 = sub_100068600();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
          sub_1000CBF5C(v105, v106, v107, v108, v109, v110, v111, v112);
        }
      }
    }
    if (v101 && [v279 isOfflineMode])
    {
      v113 = +[MSDWorkQueueSet sharedInstance];
      v114 = [v113 demoUpdateQueue];
      v292[0] = _NSConcreteStackBlock;
      v292[1] = 3221225472;
      v292[2] = sub_10003CC10;
      v292[3] = &unk_100151AF0;
      id v293 = v279;
      dispatch_async(v114, v292);

      v115 = v293;
    }
    else
    {
      v115 = +[MSDUIHelper sharedInstance];
      [v115 stopFullScreenUI:0];
    }

    [(MSDLocalMessageResponder *)self setTransaction:0];
    goto LABEL_79;
  }
  if (!strncmp(string, "GetLanguageAndRegion", 0x15uLL))
  {
    v120 = sub_100068730();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Getting Device Language and Region...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    v121 = +[MSDLanguageAndRegionManager sharedInstance];
    v122 = [v121 getCurrentDeviceLanguage];

    if (v122)
    {
      v123 = +[MSDLanguageAndRegionManager sharedInstance];
      v124 = [v123 getCurrentDeviceRegion];

      if (!v124)
      {
        v191 = sub_100068600();
        if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
          sub_1000CC004();
        }

        goto LABEL_274;
      }
      id v125 = v122;
      xpc_dictionary_set_string(reply, "languageIdentifier", (const char *)[v125 UTF8String]);
      id v126 = v124;
      xpc_dictionary_set_string(reply, "regionCode", (const char *)[v126 UTF8String]);
      xpc_connection_send_message(connection, reply);

      goto LABEL_79;
    }
    v190 = sub_100068600();
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR)) {
      sub_1000CBFD0();
    }
    goto LABEL_358;
  }
  if (!strncmp(string, "GetAppUsageSessionUUID", 0x17uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v127 = +[MSDDeviceDataCollector sharedInstance];
    v128 = [v127 getCurrentAppUsageSessionUUID];

    if (v128)
    {
      xpc_dictionary_set_BOOL(reply, "Result", 1);
      xpc_dictionary_set_string(reply, "SessionUUID", (const char *)[v128 UTF8String]);
    }
    else
    {
      xpc_dictionary_set_BOOL(reply, "Result", 0);
    }
    xpc_connection_send_message(connection, reply);

    goto LABEL_79;
  }
  if (!strncmp(string, "CollectAppUsageData", 0x14uLL))
  {
    xpc_object_t v129 = xpc_dictionary_create_reply(v5);
    v130 = xpc_dictionary_get_value(v5, "StartTime");
    if (xpc_get_type(v130) == (xpc_type_t)&_xpc_type_double)
    {
      v131 = xpc_dictionary_get_value(v5, "EndTime");
      if (xpc_get_type(v131) == (xpc_type_t)&_xpc_type_double)
      {
        reply = +[NSDate dateWithTimeIntervalSince1970:xpc_double_get_value(v130)];
        v132 = +[NSDate dateWithTimeIntervalSince1970:xpc_double_get_value(v131)];
        v133 = +[MSDDeviceDataCollector sharedInstance];
        [v133 collectAppUsageWithSessionStart:reply andEnd:v132];
        BOOL v134 = 1;
LABEL_268:

        xpc_dictionary_set_BOOL(v129, "Result", v134);
        xpc_connection_send_message(connection, v129);

        goto LABEL_79;
      }
      v133 = sub_100068600();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
        sub_1000CC038();
      }
      reply = 0;
      v132 = 0;
    }
    else
    {
      v133 = sub_100068600();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
        sub_1000CC06C();
      }
      reply = 0;
      v132 = 0;
      v131 = 0;
    }
    BOOL v134 = 0;
    goto LABEL_268;
  }
  if (!strncmp(string, "SaveBTPairingInfo", 0x12uLL))
  {
    v136 = sub_100068730();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Saving Bluetooth Pairing Info...", buf, 2u);
    }

    reply = xpc_dictionary_create_reply(v5);
    if ([v279 isContentFrozen])
    {
      v137 = +[MSDBluetoothHelper sharedInstance];
      unsigned int v138 = [v137 preserveBTPairingRecord];

      v139 = sub_100068600();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v138;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "Bluetooth pairing info result: %{public, BOOL}d", buf, 8u);
      }
    }
    else
    {
      LOBYTE(v138) = 1;
    }
    xpc_dictionary_set_BOOL(reply, "Result", v138);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "StartOSUpdate", 0xEuLL))
  {
    reply = objc_opt_new();
    unsigned __int8 v140 = [v279 isVerifiedDemoDevice];
    xpc_object_t v141 = xpc_dictionary_create_reply(v5);
    if (!v141) {
      xpc_object_t v141 = xpc_dictionary_create(0, 0, 0);
    }
    if (v140)
    {
      if (os_variant_has_internal_content())
      {
        v142 = xpc_dictionary_get_string(v5, "OSVersion");
        if (v142)
        {
          v143 = +[NSString stringWithUTF8String:v142];
          [reply setObject:v143 forKey:@"OSVersion"];
        }
        v144 = xpc_dictionary_get_string(v5, "DemodVersion");
        if (v144)
        {
          v145 = +[NSString stringWithUTF8String:v144];
          [reply setObject:v145 forKey:@"demodVersion"];
        }
        [v279 saveOSUpdateRequest:reply];
        v146 = +[MSDWorkQueueSet sharedInstance];
        v147 = [v146 demoUpdateQueue];
        v290[0] = _NSConcreteStackBlock;
        v290[1] = 3221225472;
        v290[2] = sub_10003CC18;
        v290[3] = &unk_100151AF0;
        v291 = v279;
        dispatch_async(v147, v290);

        v148 = v291;
      }
      else
      {
        v148 = sub_100068730();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
          sub_1000CC0A0(v148, v195, v196, v197, v198, v199, v200, v201);
        }
      }
    }
    else
    {
      v148 = sub_100068730();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
        sub_1000CC118();
      }
    }

    xpc_dictionary_set_BOOL(v141, "Result", 1);
    xpc_connection_send_message(connection, v141);

    goto LABEL_79;
  }
  if (!strncmp(string, "LaunchApp", 0xAuLL))
  {
    uint64_t v329 = SBSOpenApplicationOptionKeyPreventDismissalOfTransientOverlays;
    v330 = &__kCFBooleanTrue;
    reply = +[NSDictionary dictionaryWithObjects:&v330 forKeys:&v329 count:1];
    if (os_variant_has_internal_content())
    {
      v150 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "BundleID")];
      +[MSDAppLauncherTerminator launchApp:v150 withOptions:reply outError:0];
    }
    else
    {
      v150 = sub_100068600();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
        sub_1000CC14C(v150, v151, v152, v153, v154, v155, v156, v157);
      }
    }

    xpc_object_t v158 = xpc_dictionary_create_reply(v5);
    v159 = v158;
    if (v158)
    {
      xpc_dictionary_set_BOOL(v158, "MSDResult", 0);
      xpc_connection_send_message(connection, v159);
    }
    goto LABEL_444;
  }
  if (!strncmp(string, "DeviceCheckIn", 0xEuLL))
  {
    [(MSDLocalMessageResponder *)self _handleDeviceCheckInOp:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "MarkAsNotDemo", 0xEuLL))
  {
    [(MSDLocalMessageResponder *)self _handleMarkAsNotDemo:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "StoreSearch", 0xCuLL))
  {
    [(MSDLocalMessageResponder *)self _handleStoreSearchOp:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "ClearSafariHistory", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    v160 = +[MSDTargetDevice sharedInstance];
    [v160 clearSafariHistory];

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "ManageWallpaperSettings", 0x18uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    v161 = xpc_dictionary_get_string(v5, "Action");
    if (!strncmp(v161, "Stash", 6uLL))
    {
      v162 = +[MSDWallpaperManager sharedInstance];
      [v162 stashWallpaperSettingsIfNeeded];
    }
    else
    {
      if (strncmp(v161, "Restore", 8uLL))
      {
        v162 = sub_100068730();
        if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR)) {
          sub_1000CC1C4();
        }
        BOOL v163 = 0;
        goto LABEL_343;
      }
      v162 = +[MSDWallpaperManager sharedInstance];
      [v162 restoreWallpaperSettingsIfNeeded];
    }
    BOOL v163 = 1;
LABEL_343:

    xpc_dictionary_set_BOOL(reply, "MSDResult", v163);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "EnterOfflineMode", 0x11uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    unsigned __int8 v164 = [v279 isOfflineMode];
    if (v164)
    {
      if (![(MSDLocalMessageResponder *)self demoPrepareInProgress])
      {
        [(MSDLocalMessageResponder *)self setDemoPrepareInProgress:1];
        v165 = +[MSDWorkQueueSet sharedInstance];
        v166 = [v165 demoUpdateQueue];
        v287[0] = _NSConcreteStackBlock;
        v287[1] = 3221225472;
        v287[2] = sub_10003CC6C;
        v287[3] = &unk_1001520B0;
        id v288 = v279;
        v289 = self;
        dispatch_async(v166, v287);

        xpc_dictionary_set_BOOL(reply, "Acknowledged", 1);
        xpc_connection_send_message(connection, reply);

        goto LABEL_79;
      }
      v224 = sub_100068730();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_DEFAULT, "Ignore second cache bundle install request as it's already started.", buf, 2u);
      }
    }
    else
    {
      v224 = sub_100068730();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR)) {
        sub_1000CC22C();
      }
    }

    xpc_dictionary_set_BOOL(reply, "Acknowledged", v164);
    xpc_connection_send_message(connection, reply);
    goto LABEL_128;
  }
  if (!strncmp(string, "AutoEnrollmentResults", 0x16uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    double v168 = xpc_dictionary_get_double(v5, "AutoEnrollmentTimeStamp");
    v169 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "AutoEnrollmentSelectedStoreID")];
    *(void *)buf = 0;
    data = xpc_dictionary_get_data(v5, "AutoEnrollmentHelpMenuUserTapped", (size_t *)buf);
    id v171 = objc_alloc((Class)NSData);
    id v172 = [v171 initWithBytesNoCopy:data length:*(void *)buf freeWhenDone:0];
    uint64_t v173 = objc_opt_class();
    v174 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v173, objc_opt_class(), 0);
    id v286 = 0;
    v175 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v174 fromData:v172 error:&v286];
    id v176 = v286;

    v177 = +[MSDFindMyHub sharedInstance];
    [v177 setAutoEnrollmentInfo:v169 withStoreId:v175 withHelpMenuRowSelection:v168];

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_79;
  }
  if (!strncmp(string, "AutoEnrollmentAbortEvent", 0x19uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    v178 = +[NSError errorDomainMSDWithCode:3727744772 message:@"Auto Enrollment Abort by user choosing not a demo device"];
    v179 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "AutoEnrollmentAbortLanguageCodeInfo")];
    v180 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "AutoEnrollmentAbortCountryCodeInfo")];
    v181 = +[MSDCellularHelper sharedInstance];
    v182 = [v181 getCellularSimInfo];

    v183 = +[MSDWiFiHelper sharedInstance];
    v184 = [v183 getCurrentWiFiSsid];

    v185 = +[MSDAnalyticsEventHandler sharedInstance];
    [v185 sendAutoEnrollmentAbortEvent:v178 languageCode:v179 countryCode:v180 networkInformation:v182 wifiSSID:v184];

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_79;
  }
  if (!strncmp(string, "SetUpPeerService", 0x11uLL))
  {
    v187 = +[MSDDemoPeerCommander sharedInstance];
    reply = [v187 createXPCEndpoint];

    xpc_object_t v188 = xpc_dictionary_create_reply(v5);
    v159 = v188;
    if (v188)
    {
      if (reply)
      {
        xpc_dictionary_set_BOOL(v188, "Result", 1);
        v189 = [reply _endpoint];
        xpc_dictionary_set_value(v159, "PeerServiceXPCEndpoint", v189);
      }
      else
      {
        xpc_dictionary_set_BOOL(v188, "Result", 0);
      }
      xpc_connection_send_message(connection, v159);
    }
    goto LABEL_444;
  }
  if (!strncmp(string, "CloseRunningApps", 0x11uLL))
  {
    [(MSDLocalMessageResponder *)self _handleCloseRunningAppsRequest:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "InitializeAppSwitcherContent", 0x1DuLL))
  {
    reply = +[MSDAppSwitcherManager sharedInstance];
    [reply initializeClearAppSwitcherStateForDemoMode];
    goto LABEL_79;
  }
  if (!strncmp(string, "RefreshDeviceSettings", 0x16uLL))
  {
    [(MSDLocalMessageResponder *)self _handleRefreshDeviceSettingsOp:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "InitializeDeviceSettings", 0x19uLL))
  {
    [(MSDLocalMessageResponder *)self _handleInitializeDeviceSettingsOp:v5 from:connection];
    goto LABEL_80;
  }
  if (!strncmp(string, "UICheckIn", 0xAuLL))
  {
    v192 = +[MSDUIHelper sharedInstance];
    [v192 setConnection:connection];

    v193 = xpc_dictionary_create_reply(v5);
    reply = v193;
    if (v193)
    {
LABEL_375:
      xpc_dictionary_set_BOOL(v193, "Acknowledged", 1);
      xpc_connection_send_message(connection, reply);
    }
LABEL_79:

    goto LABEL_80;
  }
  if (!strncmp(string, "Cancel", 7uLL))
  {
    v194 = +[MSDDemoUpdateController sharedInstance];
    [v194 cancelDemoContentUpdate];

    v193 = xpc_dictionary_create_reply(v5);
    reply = v193;
    if (!v193) {
      goto LABEL_79;
    }
    goto LABEL_375;
  }
  if (!strncmp(string, "StoreDataBlob", 0xEuLL))
  {
    *((unsigned char *)v21 + 24) = 0;
    if (v269 && v270)
    {
      v202 = +[MSDCache sharedInstance];
      unsigned __int8 v203 = [v202 storeDataBlob:v269 withContainerIdentifier:v270];
      *((unsigned char *)v320 + 24) = v203;
    }
    v204 = xpc_dictionary_create_reply(v5);
    reply = v204;
    if (!v204) {
      goto LABEL_79;
    }
LABEL_386:
    xpc_dictionary_set_BOOL(v204, "Acknowledged", *((unsigned char *)v320 + 24));
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "RetrieveSavedDataBlob", 0x16uLL))
  {
    if (v270)
    {
      v205 = +[MSDCache sharedInstance];
      reply = [v205 retrieveDataBlob:v270];
    }
    else
    {
      reply = 0;
    }
    v159 = xpc_dictionary_create_reply(v5);
    if (v159)
    {
      v211 = reply;
      xpc_dictionary_set_data(v159, "SavedDataBlob", [v211 bytes], (size_t)[v211 length]);
      xpc_connection_send_message(connection, v159);
    }
    goto LABEL_444;
  }
  if (!strncmp(string, "DeleteDataBlob", 0xFuLL))
  {
    *((unsigned char *)v21 + 24) = 0;
    if (v270)
    {
      v206 = +[MSDCache sharedInstance];
      unsigned __int8 v207 = [v206 deleteDataBlob:v270];
      *((unsigned char *)v320 + 24) = v207;
    }
    v204 = xpc_dictionary_create_reply(v5);
    reply = v204;
    if (!v204) {
      goto LABEL_79;
    }
    goto LABEL_386;
  }
  if (!strncmp(string, "GetCurrentNetworkInfo", 0x16uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = xpc_dictionary_create(0, 0, 0);
    }
    xpc_object_t v208 = xpc_dictionary_create(0, 0, 0);
    v209 = xpc_dictionary_get_array(v5, "NetworkInfoKeys");
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10003CCAC;
    applier[3] = &unk_1001526D8;
    id v210 = v208;
    id v284 = v210;
    id v285 = v279;
    xpc_array_apply(v209, applier);
    xpc_dictionary_set_value(reply, "Result", v210);
    xpc_connection_send_message(connection, reply);

    goto LABEL_79;
  }
  if (!strncmp(string, "IsStoreOpen", 0xCuLL))
  {
    v212 = +[MSDTargetDevice sharedInstance];
    [v212 refreshStoreHoursManagerUsingSettings];

    v213 = +[MSDStoreHoursManager sharedInstance];
    unsigned __int8 v214 = [v213 isStoreOpenNow];

    reply = xpc_dictionary_create_reply(v5);
    v215 = sub_100068600();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEBUG)) {
      sub_1000CC260(v214, v215);
    }

    if (reply)
    {
      xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
      xpc_dictionary_set_BOOL(reply, "ResultData", v214);
      xpc_connection_send_message(connection, reply);
    }
    goto LABEL_79;
  }
  if (!strncmp(string, "NextStoreOpenDate", 0x12uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v216 = +[MSDTargetDevice sharedInstance];
    [v216 refreshStoreHoursManagerUsingSettings];

    v217 = +[MSDStoreHoursManager sharedInstance];
    v159 = [v217 nextStoreOpenDate];

    if (reply)
    {
      if (v159)
      {
        v218 = sub_100068600();
        if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG)) {
          sub_1000CC2F0();
        }

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        [v159 timeIntervalSince1970];
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v219);
      }
      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string(reply, "ErrorMessage", "MSDStoreHoursManager returned nil value for nextStoreOpenDate");
      }
      xpc_connection_send_message(connection, reply);
    }
    goto LABEL_444;
  }
  if (!strncmp(string, "NextStoreCloseDate", 0x13uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    v220 = +[MSDTargetDevice sharedInstance];
    [v220 refreshStoreHoursManagerUsingSettings];

    v221 = +[MSDStoreHoursManager sharedInstance];
    v159 = [v221 nextStoreClosedDate];

    if (reply)
    {
      if (v159)
      {
        v222 = sub_100068600();
        if (os_log_type_enabled(v222, OS_LOG_TYPE_DEBUG)) {
          sub_1000CC370();
        }

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        [v159 timeIntervalSince1970];
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v223);
      }
      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string(reply, "ErrorMessage", "MSDStoreHoursManager returned nil value for nextStoreCloseDate");
      }
      xpc_connection_send_message(connection, reply);
    }
LABEL_444:

    goto LABEL_79;
  }
  if (!strncmp(string, "UpdateStoreHours", 0x11uLL))
  {
    reply = xpc_dictionary_create_reply(v5);
    int has_internal_content = os_variant_has_internal_content();
    BOOL v226 = has_internal_content;
    if (!has_internal_content)
    {
      v228 = sub_100068600();
      if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR)) {
        sub_1000CC49C(v228, v241, v242, v243, v244, v245, v246, v247);
      }
LABEL_438:

      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "Result", v226);
        xpc_connection_send_message(connection, reply);
      }
      goto LABEL_79;
    }
    v227 = xpc_dictionary_get_array(v5, "RawStoreHours");
    v228 = +[NSArray arrayWithXPCArray:v227];

    if (v228)
    {
      v229 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_dictionary_get_date(v5, "EvaluateAgainstDate")];
      if (!v229)
      {
        v268 = sub_100068600();
        if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR)) {
          sub_1000CC468();
        }

        goto LABEL_274;
      }
      v230 = +[MSDTargetDevice sharedInstance];
      v231 = [v230 hubSuppliedSettings];
      id v232 = [v231 mutableCopy];

      [v232 setObject:v228 forKey:@"StoreHours"];
      [v230 saveHubSuppliedSettings:v232];
      [v230 refreshStoreHoursManagerUsingSettings];
      v233 = +[MSDStoreHoursManager sharedInstance];
      [v233 evaluateStoreStatusAgainstPointInTime:v229];

      goto LABEL_438;
    }
    v190 = sub_100068600();
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR)) {
      sub_1000CC3F0(v190, v261, v262, v263, v264, v265, v266, v267);
    }
LABEL_358:

    goto LABEL_274;
  }
  if (!strncmp(string, "preserveSecondPartyAppDataToShelter", 0x24uLL))
  {
    v234 = [v9 objectForKey:@"SourcePath"];
    v235 = sub_100068730();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v234;
      _os_log_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_DEFAULT, "Preserving second-party app data from %{public}@", buf, 0xCu);
    }

    v236 = +[MSDHelperAgent sharedInstance];
    id v282 = 0;
    unsigned __int8 v237 = [v236 preserveSecondPartyAppDataToShelter:v234 withReturnErrorMsg:&v282];
    reply = v282;

    xpc_object_t v238 = xpc_dictionary_create_reply(v5);
    v239 = v238;
    if (v238)
    {
      xpc_dictionary_set_BOOL(v238, "Result", v237);
      if (reply) {
        char v240 = v237;
      }
      else {
        char v240 = 1;
      }
      if ((v240 & 1) == 0) {
        xpc_dictionary_set_string(v239, "ErrorMsg", (const char *)[reply UTF8String]);
      }
      xpc_connection_send_message(connection, v239);
    }

    goto LABEL_79;
  }
  if (!strncmp(string, "ReloadDemodsPreferencesFile", 0x1CuLL))
  {
    int v248 = os_variant_has_internal_content();
    BOOL v249 = v248;
    if (v248)
    {
      v250 = +[MSDPreferencesFile sharedInstance];
      [v250 reload];
    }
    else
    {
      v250 = sub_100068600();
      if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR)) {
        sub_1000CC514(v250, v252, v253, v254, v255, v256, v257, v258);
      }
    }

    reply = xpc_dictionary_create_reply(v5);
    xpc_dictionary_set_BOOL(reply, "Result", v249);
    xpc_connection_send_message(connection, reply);
    goto LABEL_79;
  }
  if (!strncmp(string, "queryFeatureFlag", 0x11uLL))
  {
    reply = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "FeatureFlag")];
    if (+[MSDHubFeatureFlags isSupportedFeatureFlag:reply])
    {
      BOOL v251 = +[MSDHubFeatureFlags readBoolValueForFeatureFlag:reply];
    }
    else
    {
      v259 = sub_100068730();
      if (os_log_type_enabled(v259, OS_LOG_TYPE_DEBUG)) {
        sub_1000CC58C();
      }

      BOOL v251 = 0;
    }
    xpc_object_t v260 = xpc_dictionary_create_reply(v5);
    xpc_dictionary_set_BOOL(v260, "Result", v251);
    xpc_connection_send_message(connection, v260);

    goto LABEL_79;
  }
  uint64_t v22 = sub_100068730();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unknown request: %{public}s", buf, 0xCu);
  }

  [v279 deleteOperationRequest];
LABEL_80:
  v32 = xpc_dictionary_get_string(v5, "QueryDeviceInfo");
  v33 = sub_100068730();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBD6C();
  }

  if (!v32) {
    goto LABEL_137;
  }
  reply = xpc_dictionary_create_reply(v5);
  if (!reply) {
    reply = xpc_dictionary_create(0, 0, 0);
  }
  if (!strncmp(v32, "MSDDemoManualUpdateState", 0x19uLL))
  {
    buf[0] = 0;
    BOOL value = 0;
    [v279 manualUpdateMode:buf allowChange:&value];
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateCurrentMode", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateAllowChange", value);
    xpc_connection_send_message(connection, reply);
    goto LABEL_136;
  }
  if (!strncmp(v32, "MSDDemoUpdateState", 0x13uLL))
  {
    buf[0] = 0;
    BOOL value = 0;
    [v275 getDemoUpdateInProgress:buf operationAllowed:&value];
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateInProgress", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateAllowed", value);
    xpc_dictionary_set_BOOL(reply, "MSDDemoAlreadySetup", (BOOL)[v279 demoSetup]);
    xpc_connection_send_message(connection, reply);
    goto LABEL_136;
  }
  if (!strncmp(v32, "MSDDemoUpdateEnrolled", 0x16uLL))
  {
    if (v277 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v276)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v279 setHubHostName:v277];
          [v279 setHubPort:v276];
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
          unsigned __int8 v40 = [v275 enrolled];
          v41 = "MSDDemoUpdateEnrolled";
          goto LABEL_134;
        }
      }
      v135 = sub_100068730();
      if (!os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
        goto LABEL_273;
      }
    }
    else
    {
      v135 = sub_100068730();
      if (!os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
      {
LABEL_273:

        goto LABEL_274;
      }
    }
    sub_1000CBCF8();
    goto LABEL_273;
  }
  if (strncmp(v32, "MSDDemoDeviceManaged", 0x15uLL))
  {
    if (!strncmp(v32, "MSDDemoDeviceFrozen", 0x14uLL))
    {
      xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
      unsigned __int8 v40 = [v279 isContentFrozen];
      v41 = "MSDDemoDeviceFrozen";
    }
    else
    {
      if (!strncmp(v32, "MSDDemoDeviceInstallState", 0x1AuLL))
      {
        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_int64(reply, "MSDDemoDeviceInstallState", [v279 mode]);
        goto LABEL_135;
      }
      if (!strncmp(v32, "MSDTypeOfDemoDevice", 0x14uLL))
      {
        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_uint64(reply, "MSDTypeOfDemoDevice", (uint64_t)[v279 typeOfDemoDevice]);
        goto LABEL_135;
      }
      if (!strncmp(v32, "MSDFriendlyDeviceName", 0x16uLL))
      {
        v65 = [v279 hubSuppliedSettings];
        v66 = [v65 objectForKey:@"DeviceName"];

        if (v66)
        {
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
          xpc_dictionary_set_string(reply, "MSDFriendlyDeviceName", (const char *)[v66 UTF8String]);
        }
        else
        {
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 0);
        }
        xpc_connection_send_message(connection, reply);

        goto LABEL_136;
      }
      if (strncmp(v32, "MSDDeviceInOfflineMode", 0x17uLL))
      {
        v34 = sub_100068730();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Unknown query", buf, 2u);
        }

        goto LABEL_136;
      }
      xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
      unsigned __int8 v40 = [v279 isOfflineMode];
      v41 = "MSDDeviceInOfflineMode";
    }
LABEL_134:
    xpc_dictionary_set_BOOL(reply, v41, v40);
LABEL_135:
    xpc_connection_send_message(connection, reply);
    goto LABEL_136;
  }
  id v46 = [v279 typeOfDemoDevice];
  xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
  xpc_dictionary_set_BOOL(reply, "MSDDemoDeviceManaged", v46 == (id)6);
  xpc_connection_send_message(connection, reply);
LABEL_136:

LABEL_137:
  v52 = +[MSDPlatform sharedInstance];
  if ([v52 macOS])
  {
  }
  else
  {
    v53 = +[MSDPlatform sharedInstance];
    unsigned int v54 = [v53 iOS];

    if (!v54) {
      goto LABEL_158;
    }
  }
  v55 = xpc_dictionary_get_string(v5, "PricingMessage");
  v56 = sub_100068730();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBC90();
  }

  if (v55)
  {
    [(MSDLocalMessageResponder *)self setConnectionForPricing:connection];
    if (!strcmp(v55, "PricingMessageRequestUpdate"))
    {
      v58 = sub_100068730();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "XPC - PricingRequestUpdate", buf, 2u);
      }

      [v271 receivedUpdateRequest:connection fromRequest:v5];
    }
    else if (!strcmp(v55, "PricingMessageUpdateComplete"))
    {
      v59 = sub_100068730();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "XPC - PricingUpdateComplete", buf, 2u);
      }

      [v271 receivedCompletionNotice:connection fromRequest:v5];
    }
    else if (!strcmp(v55, "PricingMessageHeartBeat"))
    {
      v60 = sub_100068730();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "XPC - PricingMessageHeartBeat", buf, 2u);
      }

      [v271 receivedHeartBeat:connection fromRequest:v5];
    }
    else
    {
      v57 = sub_100068730();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Unknow message from Pricing.", buf, 2u);
      }

      [v271 receivedOtherMessages:connection fromRequest:v5];
    }
  }
LABEL_158:

  _Block_object_dispose(&v319, 8);
  _Block_object_dispose(&v323, 8);
}

- (void)sendRebootTimeoutMessageToPricing:(int)a3
{
  id v5 = [(MSDLocalMessageResponder *)self connectionForPricing];

  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      unsigned __int8 v7 = sub_100068730();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000CC65C();
      }

      xpc_dictionary_set_int64(v6, "MSDRebootTimeout", a3);
      CFTypeID v8 = [(MSDLocalMessageResponder *)self connectionForPricing];
      xpc_connection_send_message(v8, v6);
    }
  }
}

- (void)lostClientConnection:(id)a3
{
  id v9 = a3;
  id v4 = [(MSDLocalMessageResponder *)self connectionForPricing];

  if (v4 == v9) {
    [(MSDLocalMessageResponder *)self setConnectionForPricing:0];
  }
  id v5 = +[MSDUIHelper sharedInstance];
  id v6 = [v5 connection];

  unsigned __int8 v7 = v9;
  if (v6 == v9)
  {
    CFTypeID v8 = +[MSDUIHelper sharedInstance];
    [v8 setConnection:0];

    unsigned __int8 v7 = v9;
  }
}

- (BOOL)saveOperationRequestIfNeeded:(id)a3 completeBy:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if ([v5 isEqualToString:@"DemoUpdate"])
  {
    uint64_t v6 = 1;
    CFStringRef v7 = @"UpdateContent";
  }
  else if ([v5 isEqualToString:@"Demo"])
  {
    uint64_t v6 = 0;
    CFStringRef v7 = @"TurnSnapshotON";
  }
  else if ([v5 isEqualToString:@"DemoMaualUpdate"])
  {
    uint64_t v6 = 0;
    CFStringRef v7 = @"TurnSnapshotOFF";
  }
  else if ([v5 isEqualToString:@"DemoSnapshotRevert"])
  {
    uint64_t v6 = 8;
    CFStringRef v7 = @"RevertSnapshot";
  }
  else if ([v5 isEqualToString:@"OSUpdate"])
  {
    uint64_t v6 = 0;
    CFStringRef v7 = @"UpdateOS";
  }
  else
  {
    if (![v5 isEqualToString:@"Reboot"])
    {
      unsigned __int8 v9 = 1;
      goto LABEL_14;
    }
    uint64_t v6 = 0;
    CFStringRef v7 = @"Restart";
  }
  CFTypeID v8 = +[MSDTargetDevice sharedInstance];
  unsigned __int8 v9 = [v8 saveOperationRequest:v7 requestFlag:v6 completeBy:v4];

LABEL_14:
  return v9;
}

- (void)_handleDeviceCheckInOp:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v7 = +[MSDFindMyHub sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D240;
  v10[3] = &unk_100152700;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 checkInWithCompletion:v10];
}

- (void)_handleMarkAsNotDemo:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v7 = +[MSDFindMyHub sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D3BC;
  v10[3] = &unk_100152728;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 markAsNotDemoWithCompletion:v10];
}

- (void)_handleStoreSearchOp:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = sub_10003C344;
  unsigned int v18 = sub_10003C354;
  id reply = xpc_dictionary_create_reply(v5);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_10003C344;
  v12[4] = sub_10003C354;
  id v7 = v6;
  id v13 = v7;
  id v8 = +[NSDictionary dictionaryWithXPCDictionary:v5];
  if (v8)
  {
    id v9 = +[MSDFindMyHub sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003D684;
    v11[3] = &unk_100152750;
    v11[4] = &v20;
    v11[5] = &v14;
    v11[6] = v12;
    [v9 searchStoreWithOptions:v8 completion:v11];
  }
  else
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CC690();
    }

    xpc_dictionary_set_BOOL((xpc_object_t)v15[5], "Result", *((unsigned char *)v21 + 24));
    xpc_connection_send_message((xpc_connection_t)v7, (xpc_object_t)v15[5]);
  }

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (void)_handleRefreshDeviceSettingsOp:(id)a3 from:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t xdict = reply;
  id v7 = +[MSDSettingsRefresher sharedInstance];
  [v7 restoreSavedDeviceSettings];

  xpc_dictionary_set_BOOL(xdict, "MSDResult", 1);
  xpc_connection_send_message(v5, xdict);
}

- (void)_handleInitializeDeviceSettingsOp:(id)a3 from:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  id v6 = a3;
  BOOL v7 = xpc_dictionary_get_BOOL(v6, "InitializeSettingsOverwrite");
  keys = (char **)xpc_dictionary_create_reply(v6);

  if (!keys) {
    keys = (char **)xpc_dictionary_create(0, 0, 0);
  }
  id v8 = +[MSDSettingsRefresher sharedInstance];
  [v8 initializeWithOverwrite:v7];

  xpc_dictionary_set_BOOL(keys, "MSDResult", 1);
  xpc_connection_send_message(v5, keys);
}

- (void)_handleCloseRunningAppsRequest:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = (_xpc_connection_s *)a4;
  BOOL v7 = +[MSDAppHelper sharedInstance];
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  id v9 = xpc_dictionary_get_array(v5, "ScreenSaverAppIDs");
  v10 = +[NSArray arrayWithXPCArray:v9];

  if (v10)
  {
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Leaving %@ running", buf, 0xCu);
    }

    id v12 = [v7 runningApps:0];
    id v13 = [v12 mutableCopy];

    [v13 removeObjectsInArray:v10];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        unsigned int v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          +[MSDAppLauncherTerminator terminateApp:outError:](MSDAppLauncherTerminator, "terminateApp:outError:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v18), 0, (void)v20);
          unsigned int v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    uint64_t v19 = +[MSDAppSwitcherManager sharedInstance];
    [v19 clearAppSwitcherForDemoMode];
  }
  xpc_dictionary_set_BOOL(reply, "MSDResult", v10 != 0);
  xpc_connection_send_message(v6, reply);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_xpc_object)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_xpc_object)connectionForPricing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionForPricing);

  return (OS_xpc_object *)WeakRetained;
}

- (void)setConnectionForPricing:(id)a3
{
}

- (BOOL)demoPrepareInProgress
{
  return self->_demoPrepareInProgress;
}

- (void)setDemoPrepareInProgress:(BOOL)a3
{
  self->_demoPrepareInProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionForPricing);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end