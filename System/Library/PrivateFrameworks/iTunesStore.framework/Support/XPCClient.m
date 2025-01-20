@interface XPCClient
- (BOOL)_isAdHocCodeSigned;
- (BOOL)_isBetaApp;
- (BOOL)_isNewsstandApp;
- (BOOL)canReceiveMessages;
- (BOOL)hasEntitlements;
- (BOOL)isAdHocCodeSigned;
- (BOOL)isAppleSigned;
- (BOOL)isBetaApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewsstandApp;
- (NSData)auditTokenData;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)clientVersion;
- (NSString)userAgent;
- (SSXPCConnection)outputConnection;
- (XPCClient)init;
- (XPCClient)initWithApplicationIdentifier:(id)a3 isAppleSigned:(BOOL)a4;
- (XPCClient)initWithInputConnection:(id)a3;
- (id)_applicationBackgroundModes;
- (id)_initCommon;
- (id)beginBackgroundTaskWithReason:(unsigned int)a3 expirationBlock:(id)a4;
- (id)copyApplicationBackgroundModes;
- (id)copyInputConnection;
- (id)description;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (int64_t)_clientType;
- (int64_t)clientType;
- (unint64_t)hash;
- (unsigned)_applicationState;
- (unsigned)applicationState;
- (void)_applicationStateChanged:(id)a3;
- (void)_handleOutputConnectionDisconnect;
- (void)_invalidateBackgroundTaskAssertion:(id)a3;
- (void)dealloc;
- (void)endBackgroundTaskWithIdentifier:(id)a3;
- (void)loadSpringBoardStateWithCompletionBlock:(id)a3;
- (void)sendCoalescedMessageWithIdentifier:(unint64_t)a3;
- (void)setOutputConnectionWithConnection:(id)a3;
@end

@implementation XPCClient

- (unsigned)applicationState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BF6C;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isNewsstandApp
{
  int isNewsstandApp = self->_isNewsstandApp;
  if (isNewsstandApp == 255)
  {
    v4 = +[SpringBoardUtility sharedInstance];
    id v5 = [v4 copyBundleInfoValueForKey:@"UINewsstandApp" PID:self->_pid];

    if (objc_opt_respondsToSelector()) {
      char v6 = [v5 BOOLValue];
    }
    else {
      char v6 = 0;
    }
    self->_int isNewsstandApp = v6;

    int isNewsstandApp = self->_isNewsstandApp;
  }
  return isNewsstandApp != 0;
}

- (id)copyApplicationBackgroundModes
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10009E580;
  v10 = sub_10009E590;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003D54;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)loadSpringBoardStateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000493C;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_isBetaApp
{
  if (self->_isBetaApp == 255)
  {
    self->_isBetaApp = 0;
    int64_t v3 = [(XPCClient *)self _clientType];
    switch(v3)
    {
      case 3:
LABEL_5:
        self->_isBetaApp = 0;
        return self->_isBetaApp != 0;
      case 1:
        if (self->_clientIdentifier)
        {
          id v4 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
          id v5 = [v4 appState];
          unsigned int v6 = [v5 isValid];

          if (v6) {
            self->_isBetaApp = [v4 isBetaApp];
          }
        }
        break;
      case 0:
        goto LABEL_5;
    }
  }
  return self->_isBetaApp != 0;
}

- (void)_applicationStateChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005B58;
  v7[3] = &unk_1003A3268;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)_applicationBackgroundModes
{
  if (!self->_backgroundModes && (id)[(XPCClient *)self _clientType] == (id)1)
  {
    int64_t v3 = +[SpringBoardUtility sharedInstance];
    id v4 = [v3 copyBundleInfoValueForKey:@"UIBackgroundModes" PID:self->_pid];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = (NSArray *)[v4 copy];
    }
    else {
      id v5 = (NSArray *)objc_alloc_init((Class)NSArray);
    }
    backgroundModes = self->_backgroundModes;
    self->_backgroundModes = v5;
  }
  v7 = self->_backgroundModes;

  return v7;
}

- (SSXPCConnection)outputConnection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10009E580;
  v10 = sub_10009E590;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BADC;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSXPCConnection *)v3;
}

- (void)dealloc
{
  if (self->_stateChangeObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_stateChangeObserver];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_backgroundTasks;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [(NSMutableDictionary *)self->_backgroundTasks objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v8)];
        v10 = [v9 processAssertion];
        [v10 setInvalidationHandler:0];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if (self->_clientIdentifier)
  {
    id v11 = +[SpringBoardUtility sharedInstance];
    v12 = +[NSArray arrayWithObject:self->_clientIdentifier];
    [v11 endGeneratingStateChangeNotificationsForIdentifiers:v12];
  }
  [(SSXPCConnection *)self->_outputConnection setDisconnectBlock:0];
  v13.receiver = self;
  v13.super_class = (Class)XPCClient;
  [(XPCClient *)&v13 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong(&self->_stateChangeObserver, 0);
  objc_storeStrong((id *)&self->_inputConnection, 0);
  objc_storeStrong((id *)&self->_inflightMessages, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_backgroundTasks, 0);
  objc_storeStrong((id *)&self->_backgroundModes, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_outputConnection, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setOutputConnectionWithConnection:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006418;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (unsigned)_applicationState
{
  if ((id)[(XPCClient *)self _clientType] != (id)1) {
    return 0;
  }
  unsigned int result = self->_applicationState;
  if (result == -1)
  {
    id v4 = +[SpringBoardUtility sharedInstance];
    self->_applicationState = [v4 applicationStateForIdentifier:self->_clientIdentifier];

    return self->_applicationState;
  }
  return result;
}

- (int64_t)_clientType
{
  int64_t result = self->_clientType;
  if (result == -1)
  {
    id v4 = +[SpringBoardUtility sharedInstance];
    unsigned int v5 = [v4 mostElevatedApplicationStateForPID:self->_pid];

    if (v5)
    {
      if (v5 == 16) {
        int64_t result = 2;
      }
      else {
        int64_t result = 1;
      }
      self->_clientType = result;
    }
    else
    {
      if (self->_clientIdentifier)
      {
        id v6 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
      }
      else
      {
        id v6 = 0;
      }
      uint64_t v7 = [v6 applicationType];

      int64_t v8 = 1;
      if (!v7) {
        int64_t v8 = 2;
      }
      self->_clientType = v8;

      return self->_clientType;
    }
  }
  return result;
}

- (id)copyInputConnection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10009E580;
  v10 = sub_10009E590;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000BAAC;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)clientType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 2;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006C0C;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSData)auditTokenData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (XPCClient)initWithInputConnection:(id)a3
{
  unsigned int v5 = (_xpc_connection_s *)a3;
  uint64_t v6 = [(XPCClient *)self _initCommon];
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = (__CFString *)SSXPCConnectionCopyExecutablePath();
      if (v7)
      {
        CFURLRef v8 = CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, 0);
        if (v8)
        {
          CFURLRef v9 = v8;
          CFURLRef v10 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
          if (v10)
          {
            CFURLRef v11 = v10;
            v12 = CFBundleCreate(0, v10);
            if (v12)
            {
              objc_super v13 = v12;
              uint64_t v14 = CFBundleGetIdentifier(v12);
              clientIdentifier = v6->_clientIdentifier;
              v6->_clientIdentifier = (NSString *)v14;

              long long v16 = CFBundleGetValueForInfoDictionaryKey(v13, _kCFBundleShortVersionStringKey);
              if (!v16)
              {
                long long v16 = CFBundleGetValueForInfoDictionaryKey(v13, kCFBundleVersionKey);
              }
              objc_storeStrong((id *)&v6->_clientVersion, v16);
              long long v17 = CFBundleGetInfoDictionary(v13);
              if ([v17 count])
              {
                v18 = +[SSDevice currentDevice];
                uint64_t v19 = [v18 userAgentWithBundleRef:v13 isCachable:0];
                userAgent = v6->_userAgent;
                v6->_userAgent = (NSString *)v19;
              }
              CFRelease(v13);
            }
            CFRelease(v11);
          }
          CFRelease(v9);
        }
        if (v6->_clientIdentifier)
        {
          int v21 = 0;
        }
        else
        {
          uint64_t v22 = [(__CFString *)v7 lastPathComponent];
          v23 = v6->_clientIdentifier;
          v6->_clientIdentifier = (NSString *)v22;

          clientVersion = v6->_clientVersion;
          v6->_clientVersion = (NSString *)@"1.0";

          int v21 = 1;
        }
        if (!v6->_userAgent)
        {
          v25 = +[SSDevice currentDevice];
          uint64_t v26 = [v25 userAgentWithClientName:v6->_clientIdentifier version:v6->_clientVersion];
          v27 = v6->_userAgent;
          v6->_userAgent = (NSString *)v26;
        }
      }
      else
      {
        int v21 = 0;
      }
      *(_OWORD *)location = 0u;
      long long v43 = 0u;
      xpc_connection_get_audit_token();
      v28 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:location length:32];
      auditTokenData = v6->_auditTokenData;
      v6->_auditTokenData = v28;

      objc_storeStrong((id *)&v6->_inputConnection, a3);
      v6->_pid = xpc_connection_get_pid(v5);
      v30 = (void *)SSXPCConnectionCopyValueForEntitlement();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v6->_entitlements, v30);
      }
      else if (objc_opt_respondsToSelector())
      {
        v31 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
        entitlements = v6->_entitlements;
        v6->_entitlements = v31;

        v6->_legacyEntitlements = 1;
      }
    }
    else
    {
      int v21 = 0;
    }
    if ([(NSString *)v6->_clientIdentifier isEqualToString:@"com.apple.springboard"])
    {
      uint64_t v33 = 3;
LABEL_32:
      v6->_clientType = v33;
      goto LABEL_33;
    }
    if ([(NSString *)v6->_clientIdentifier isEqualToString:@"com.apple.lowtide"])
    {
      v6->_clientType = 0;
    }
    else
    {
      if (v21)
      {
        uint64_t v33 = 2;
        goto LABEL_32;
      }
      v6->_clientType = -1;
      if (v6->_clientIdentifier)
      {
        v35 = +[NSNotificationCenter defaultCenter];
        objc_initWeak(location, v6);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000042BC;
        v40[3] = &unk_1003A51A8;
        objc_copyWeak(&v41, location);
        uint64_t v36 = [v35 addObserverForName:@"SpringBoardUtilityApplicationStateChangeNotification" object:0 queue:0 usingBlock:v40];
        id stateChangeObserver = v6->_stateChangeObserver;
        v6->_id stateChangeObserver = (id)v36;

        v38 = +[SpringBoardUtility sharedInstance];
        v39 = +[NSArray arrayWithObject:v6->_clientIdentifier];
        [v38 beginGeneratingStateChangeNotificationsForIdentifiers:v39];

        objc_destroyWeak(&v41);
        objc_destroyWeak(location);
      }
    }
  }
LABEL_33:

  return v6;
}

- (id)_initCommon
{
  v6.receiver = self;
  v6.super_class = (Class)XPCClient;
  v2 = [(XPCClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.XPCClient", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_appleSigned = -1;
    v2->_applicationState = -1;
    *(_WORD *)&v2->_int isNewsstandApp = -1;
    v2->_isAdHocCodeSigned = -1;
  }
  return v2;
}

- (XPCClient)init
{
  return [(XPCClient *)self initWithInputConnection:0];
}

- (XPCClient)initWithApplicationIdentifier:(id)a3 isAppleSigned:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)XPCClient;
  uint64_t v7 = [(XPCClient *)&v12 init];
  CFURLRef v8 = v7;
  if (v7)
  {
    v7->_appleSigned = a4;
    CFURLRef v9 = (NSString *)[v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = v9;

    v8->_clientType = 1;
  }

  return v8;
}

- (id)beginBackgroundTaskWithReason:(unsigned int)a3 expirationBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((id)[(XPCClient *)self clientType] == (id)1)
  {
    id v7 = [objc_alloc((Class)BKSProcessAssertion) initWithPID:self->_pid flags:1 reason:v4 name:@"com.apple.itunesstored.xpcclient"];
    if ([v7 valid])
    {
      CFURLRef v8 = +[NSUUID UUID];
      CFURLRef v9 = [v8 UUIDString];
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009E1BC;
      block[3] = &unk_1003A51D0;
      id v11 = v7;
      id v18 = v11;
      id v21 = v6;
      uint64_t v19 = self;
      int v22 = v4;
      id v12 = v9;
      id v20 = v12;
      dispatch_sync(dispatchQueue, block);
      objc_initWeak(&location, v11);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009E3C4;
      v14[3] = &unk_1003A5010;
      v14[4] = self;
      objc_copyWeak(&v15, &location);
      [v11 setInvalidationHandler:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)canReceiveMessages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009E4C8;
  v5[3] = &unk_1003A51F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifierHeader
{
  v2 = [(XPCClient *)self clientIdentifier];
  char v3 = ISClientIdentifierForBundleIdentifier();

  return (NSString *)v3;
}

- (void)endBackgroundTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009E640;
    v7[3] = &unk_1003A3268;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(dispatchQueue, v7);
  }
}

- (BOOL)hasEntitlements
{
  return self->_entitlements != 0;
}

- (BOOL)isAppleSigned
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009E8CC;
  v5[3] = &unk_1003A51F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNewsstandApp
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009EAC8;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBetaApp
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009EBA8;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAdHocCodeSigned
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009EC88;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)processIdentifier
{
  return self->_pid;
}

- (void)sendCoalescedMessageWithIdentifier:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009ED38;
  v4[3] = &unk_1003A5220;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (NSString)userAgent
{
  if (MGGetSInt32Answer() == 4) {
    char v3 = 0;
  }
  else {
    char v3 = self->_userAgent;
  }

  return v3;
}

- (id)valueForEntitlement:(id)a3
{
  return [(NSDictionary *)self->_entitlements objectForKey:a3];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)XPCClient;
  char v3 = [(XPCClient *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@: %@", v3, self->_clientIdentifier];

  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_clientIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    clientIdentifier = self->_clientIdentifier;
    uint64_t v8 = [v4 clientIdentifier];
    unsigned __int8 v6 = [(NSString *)clientIdentifier isEqual:v8];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_handleOutputConnectionDisconnect
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F14C;
  block[3] = &unk_1003A3140;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateBackgroundTaskAssertion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F2E4;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_isAdHocCodeSigned
{
  if (self->_isAdHocCodeSigned == 255)
  {
    self->_isAdHocCodeSigned = 0;
    int64_t v3 = [(XPCClient *)self _clientType];
    switch(v3)
    {
      case 3:
LABEL_5:
        self->_isAdHocCodeSigned = 0;
        return self->_isAdHocCodeSigned != 0;
      case 1:
        if (self->_clientIdentifier)
        {
          id v4 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
          uint64_t v5 = [v4 appState];
          unsigned int v6 = [v5 isValid];

          if (v6) {
            self->_isAdHocCodeSigned = [v4 isAdHocCodeSigned];
          }
        }
        break;
      case 0:
        goto LABEL_5;
    }
  }
  return self->_isAdHocCodeSigned != 0;
}

@end