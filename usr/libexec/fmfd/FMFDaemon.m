@interface FMFDaemon
- (BOOL)cachesWarmedUp;
- (BOOL)hashedAPSTokenMatchesStoredToken:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FMFAPSHandler)apsHandler;
- (FMFAPSHandler)cloudKitAPSHandler;
- (NSData)apsTokenData;
- (id)_parseExcludedFacilitiesFromString:(id)a3;
- (id)hashForToken:(id)a3;
- (id)machServiceName;
- (id)xpcDarwinEventHandlers;
- (void)_localeChanged:(id)a3;
- (void)_postAliveNotification;
- (void)_registerUnlockRefresh;
- (void)accountWasAdded;
- (void)accountWasRemoved;
- (void)addObservers;
- (void)deregisterWithAPS;
- (void)didReceiveAPSMessage:(id)a3 onTopic:(id)a4;
- (void)didReceiveAPSToken:(id)a3;
- (void)registerWithAPS;
- (void)removeStoredAPSToken;
- (void)setApsHandler:(id)a3;
- (void)setApsTokenData:(id)a3;
- (void)setCachesWarmedUp:(BOOL)a3;
- (void)setCloudKitAPSHandler:(id)a3;
- (void)startup;
- (void)storeSavedAPSToken:(id)a3;
@end

@implementation FMFDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v56 = a3;
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.icloud.fmfd.access"];
  v58 = [v5 valueForEntitlement:@"com.apple.private.contactsui"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    v8 = v58;
    v9 = v58;
  }
  else
  {
    v8 = v58;
    if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v48 = sub_100005560();
      v47 = v48;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        sub_10006B260(v5, v48);
        BOOL v46 = 0;
        v47 = v48;
      }
      else
      {
        BOOL v46 = 0;
      }
      goto LABEL_28;
    }
    v10 = v6;
    v11 = v58;
    if (!v6)
    {
LABEL_9:
      if ([(__objc2_prot *)v8 BOOLValue]) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  if ([(FMFClientSession *)v6 BOOLValue])
  {
LABEL_10:
    if ([(FMFClientSession *)v6 BOOLValue]) {
      v12 = @"com.apple.icloud.fmfd.access";
    }
    else {
      v12 = @"com.apple.private.contactsui";
    }
    v13 = v12;
    v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v5 serviceName];
      *(_DWORD *)buf = 138412802;
      v65 = v15;
      __int16 v66 = 1024;
      unsigned int v67 = [v5 processIdentifier];
      __int16 v68 = 2112;
      v69 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Allowing client %@(%d) to connect(entitlement name: %@ value: 1)", buf, 0x1Cu);
    }
    v58 = &OBJC_PROTOCOL___FMFXPCInternalServerProtocol;
    v52 = &OBJC_PROTOCOL___FMFXPCInternalClientProtocol;
    uint64_t v16 = objc_opt_class();
    v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v17 = objc_opt_class();
    v53 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0);
    v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
    v6 = [[FMFClientSession alloc] initWithConnection:v5];
    v27 = sub_100005560();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v6;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "📩 Connection established from: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v6);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100012000;
    v62[3] = &unk_1000A1CE8;
    objc_copyWeak(&v63, (id *)buf);
    [v5 setInterruptionHandler:v62];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000411C;
    v60[3] = &unk_1000A1CE8;
    objc_copyWeak(&v61, (id *)buf);
    [v5 setInvalidationHandler:v60];
    v28 = +[NSXPCInterface interfaceWithProtocol:v58];
    [v5 setExportedInterface:v28];

    [v5 setExportedObject:v6];
    v29 = [v5 exportedInterface];
    [v29 setClasses:v57 forSelector:"addFriendHandles:" argumentIndex:0 ofReply:0];

    v30 = [v5 exportedInterface];
    [v30 setClasses:v57 forSelector:"removeFriendHandles:" argumentIndex:0 ofReply:0];

    v31 = [v5 exportedInterface];
    [v31 setClasses:v54 forSelector:"setDebugContext:" argumentIndex:0 ofReply:0];

    v32 = [v5 exportedInterface];
    [v32 setClasses:v57 forSelector:"sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:" argumentIndex:0 ofReply:0];

    v33 = [v5 exportedInterface];
    [v33 setClasses:v57 forSelector:"stopSharingMyLocationWithHandles:groupId:callerId:completion:" argumentIndex:0 ofReply:0];

    v34 = [v5 exportedInterface];
    [v34 setClasses:v57 forSelector:"fetchLocationForHandles:callerId:priority:completion:" argumentIndex:0 ofReply:0];

    v35 = [v5 exportedInterface];
    [v35 setClasses:v53 forSelector:"invalidateMappingPackets:completion:" argumentIndex:0 ofReply:0];

    v36 = [v5 exportedInterface];
    [v36 setClasses:v57 forSelector:"canOfferToHandles:completion:" argumentIndex:0 ofReply:0];

    v37 = [v5 exportedInterface];
    [v37 setClasses:v57 forSelector:"fencesForHandles:completion:" argumentIndex:0 ofReply:0];

    v38 = [v5 exportedInterface];
    [v38 setClasses:v26 forSelector:"addFence:completion:" argumentIndex:0 ofReply:0];

    v39 = [v5 exportedInterface];
    [v39 setClasses:v26 forSelector:"deleteFence:completion:" argumentIndex:0 ofReply:0];

    v40 = [v5 exportedInterface];
    [v40 setClasses:v57 forSelector:"addFavorite:completion:" argumentIndex:0 ofReply:0];

    v41 = [v5 exportedInterface];
    [v41 setClasses:v57 forSelector:"removeFavorite:completion:" argumentIndex:0 ofReply:0];

    v42 = +[NSXPCInterface interfaceWithProtocol:v52];
    [v5 setRemoteObjectInterface:v42];

    if (![(FMFDaemon *)self cachesWarmedUp])
    {
      id v43 = +[FMFDataManager sharedInstance];
      [(FMFDaemon *)self setCachesWarmedUp:1];
      v44 = sub_100005560();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Caches warmed up", v59, 2u);
      }
    }
    v45 = +[FMFXPCSessionManager sharedInstance];
    [v45 addClientSession:v6];

    [v5 resume];
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v63);
    objc_destroyWeak((id *)buf);

    BOOL v46 = 1;
    v47 = v52;
    goto LABEL_28;
  }
  if (v8) {
    goto LABEL_9;
  }
LABEL_25:
  v49 = sub_100005560();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = [v5 serviceName];
    *(_DWORD *)buf = 138412802;
    v65 = v50;
    __int16 v66 = 1024;
    unsigned int v67 = [v5 processIdentifier];
    __int16 v68 = 1024;
    LODWORD(v69) = [(FMFClientSession *)v6 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Refusing client %@(%d) to connect(entitlement value: %d)", buf, 0x18u);
  }
  BOOL v46 = 0;
  v47 = v6;
LABEL_28:

  return v46;
}

- (BOOL)cachesWarmedUp
{
  return self->_cachesWarmedUp;
}

- (id)_parseExcludedFacilitiesFromString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"|"];
  v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        v12 = [v10 stringByTrimmingCharactersInSet:v11];

        if ([v12 length]) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = +[NSSet setWithArray:v4];

  return v13;
}

- (id)machServiceName
{
  return @"com.apple.icloud.fmfd";
}

- (void)_postAliveNotification
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting FMFD launched darwin notification(com.apple.icloud.fmfd.launched)", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"com.apple.icloud.fmfd.launched", 0, 0, 0);
}

- (void)_localeChanged:(id)a3
{
  id v3 = a3;
  v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Exiting due to language changes, notification: %@", (uint8_t *)&v5, 0xCu);
  }

  xpc_transaction_exit_clean();
}

- (void)startup
{
  [(FMFDaemon *)self _registerUnlockRefresh];
  [(FMFDaemon *)self setCachesWarmedUp:0];
  id v3 = +[FMXPCTransactionManager sharedInstance];
  [v3 setLaunchOnRebootActivity:@"com.apple.icloud.fmfd.launch-on-reboot" keepAliveActivity:@"com.apple.icloud.fmfd.keep-alive-on-dirty"];

  if ([(Daemon *)self isInternalBuild])
  {
    v4 = [(Daemon *)self _verifyLaunchEventsConfiguration];
    if (v4)
    {
      int v5 = sub_100005560();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Bug in fmfd configuration. Please raise a radar with this message - %@", buf, 0xCu);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)FMFDaemon;
  [(Daemon *)&v25 startup];
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\n************************************************************************\n  FMF Daemon Starting...\n************************************************************************", buf, 2u);
  }

  id v7 = +[NSProcessInfo processInfo];
  uint64_t v8 = [v7 environment];

  v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Environment:\n%@", buf, 0xCu);
  }

  +[KeychainUtil migrateLegacyKeychainItems];
  v10 = +[FMFAccountManager sharedInstance];
  [v10 updateAccountInfo];

  v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = +[FMFAccountManager sharedInstance];
    v13 = [v12 account];
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Account : %@", buf, 0xCu);
  }
  v14 = sub_100005560();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Registering for APS token", buf, 2u);
  }

  long long v15 = +[FMFAccountManager sharedInstance];
  long long v16 = [v15 account];
  uint64_t v17 = [v16 apsEnvironment];
  long long v18 = (void *)v17;
  uint64_t v19 = off_1000BB010;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  uint64_t v20 = v19;

  uint64_t v21 = +[FMFAPSHandler instanceForEnvironment:v20];
  [(FMFDaemon *)self setApsHandler:v21];

  uint64_t v22 = +[FMFAPSHandler instanceForEnvironment:v20];
  [(FMFDaemon *)self setCloudKitAPSHandler:v22];

  [(FMFDaemon *)self registerWithAPS];
  uint64_t v23 = +[FMFHeartbeatManager sharedInstance];
  [v23 checkin];

  id v24 = +[FMFNetworkObserver sharedInstance];
  [(FMFDaemon *)self _postAliveNotification];
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  v4 = off_1000BAFA8;
  int v5 = +[NSOperationQueue mainQueue];
  id v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:&stru_1000A1CA0];

  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = off_1000BAFB0;
  v9 = +[NSOperationQueue mainQueue];
  id v10 = [v7 addObserverForName:v8 object:0 queue:v9 usingBlock:&stru_1000A1CC0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"accountWasAdded" name:off_1000BAFC8 object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"accountWasRemoved" name:off_1000BAFC0 object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
}

- (id)xpcDarwinEventHandlers
{
  uint64_t v5 = ACDAccountStoreDidChangeNotification;
  id v2 = [&stru_1000A1D08 copy];
  id v6 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (void)registerWithAPS
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "registering with APS", v8, 2u);
  }

  v4 = [(FMFDaemon *)self apsHandler];
  [v4 registerDelegate:self forTopic:off_1000BB000];

  uint64_t v5 = [(FMFDaemon *)self cloudKitAPSHandler];
  id v6 = +[FMFCloudKitManager sharedInstance];
  id v7 = [v6 cloudKitPushTopic];
  [v5 registerDelegate:self forTopic:v7];

  +[FMFAPSHandler startupComplete];
}

- (void)deregisterWithAPS
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "deregistering with APS", v6, 2u);
  }

  v4 = [(FMFDaemon *)self apsHandler];
  [v4 deregisterDelegate:self];

  uint64_t v5 = [(FMFDaemon *)self cloudKitAPSHandler];
  [v5 deregisterDelegate:self];
}

- (void)accountWasAdded
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "accountWasAdded", v4, 2u);
  }

  [(FMFDaemon *)self registerWithAPS];
}

- (void)accountWasRemoved
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "accountWasRemoved", v4, 2u);
  }

  [(FMFDaemon *)self deregisterWithAPS];
  [(FMFDaemon *)self removeStoredAPSToken];
}

- (void)didReceiveAPSMessage:(id)a3 onTopic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 description];
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received APS message (topic: %@) : \n%@", buf, 0x16u);
  }
  v9 = +[FMFCloudKitManager sharedInstance];
  id v10 = [v9 cloudKitPushTopic];
  unsigned int v11 = [v6 isEqualToString:v10];

  if (v11)
  {
    v12 = +[FMFCloudKitManager sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000126C4;
    v14[3] = &unk_1000A1708;
    id v15 = v5;
    [v12 fetchChangesWithCompletion:v14];

    id v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (([v6 isEqualToString:off_1000BB008] & 1) == 0)
  {
    id v13 = +[FMFCommandManager sharedInstance];
    [v13 refreshDueToTapWithMessage:v5];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)didReceiveAPSToken:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FMFDaemon *)self hashedAPSTokenMatchesStoredToken:v4];
  if (v5)
  {
    id v6 = sub_100005560();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v12) = 0;
    id v7 = "didReceiveAPSToken: saved token does match new token, not refreshing";
  }
  else
  {
    uint64_t v8 = [(FMFDaemon *)self hashForToken:v4];
    [(FMFDaemon *)self storeSavedAPSToken:v8];

    id v6 = sub_100005560();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v12) = 0;
    id v7 = "didReceiveAPSToken: saved token doesn't match new token, will force refresh";
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 2u);
LABEL_7:

  v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received APS token - %@. APS token differs from saved: %d", (uint8_t *)&v12, 0x12u);
  }

  id v10 = +[FMFCommandManager sharedInstance];
  unsigned int v11 = v10;
  if (v5) {
    [v10 sendInitWithLazyCheckForSession:0 withReason:5 completion:0];
  }
  else {
    [v10 refreshForSession:0 withReason:5 withCompletion:0];
  }
}

- (BOOL)hashedAPSTokenMatchesStoredToken:(id)a3
{
  id v4 = [(FMFDaemon *)self hashForToken:a3];
  unsigned int v5 = [(FMFDaemon *)self apsTokenData];
  if (v5) {
    unsigned __int8 v6 = [v4 isEqualToData:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)hashForToken:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  CC_SHA1([v3 bytes], (CC_LONG)[v3 length], md);
  id v4 = +[NSData dataWithBytes:md length:20];

  return v4;
}

- (NSData)apsTokenData
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"apsTokenStorageKey"];

  return (NSData *)v3;
}

- (void)storeSavedAPSToken:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"apsTokenStorageKey"];

  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 synchronize];
}

- (void)removeStoredAPSToken
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"apsTokenStorageKey"];

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 synchronize];
}

- (void)_registerUnlockRefresh
{
  if ((int)MKBDeviceUnlockedSinceBoot() <= 0)
  {
    int out_token = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012BD8;
    handler[3] = &unk_1000A1D48;
    int v3 = -1;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)setApsTokenData:(id)a3
{
}

- (FMFAPSHandler)apsHandler
{
  return self->_apsHandler;
}

- (void)setApsHandler:(id)a3
{
}

- (FMFAPSHandler)cloudKitAPSHandler
{
  return self->_cloudKitAPSHandler;
}

- (void)setCloudKitAPSHandler:(id)a3
{
}

- (void)setCachesWarmedUp:(BOOL)a3
{
  self->_cachesWarmedUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitAPSHandler, 0);
  objc_storeStrong((id *)&self->_apsHandler, 0);

  objc_storeStrong((id *)&self->_apsTokenData, 0);
}

@end