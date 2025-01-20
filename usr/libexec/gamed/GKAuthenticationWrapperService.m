@interface GKAuthenticationWrapperService
+ (id)authenticationWrapperForService:(id)a3;
+ (id)serviceForBundleID:(id)a3 player:(id)a4;
+ (id)serviceForClient:(id)a3 player:(id)a4;
- (GKAuthenticationWrapperService)initWithClient:(id)a3;
- (GKAuthenticationWrapperService)initWithService:(id)a3 queue:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_buildSignatureLookupForProtocol:(id)a3;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8;
- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7;
- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 usingFastPath:(BOOL)a5 displayAuthUI:(BOOL)a6 handler:(id)a7;
- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 isGame:(BOOL)a7 usingFastPath:(BOOL)a8 displayAuthUI:(BOOL)a9 handler:(id)a10;
- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 handler:(id)a6;
- (void)checkActivitySharingRepromptWithCompletion:(id)a3;
- (void)didShowFullscreenSignIn;
- (void)didShowSignInBanner;
- (void)fetchItemsForIdentityVerificationSignature:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3;
- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)getAccountAuthTokenWithHandler:(id)a3;
- (void)getDevicePushTokenWithHandler:(id)a3;
- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)isAppUnlistedAndDisallowed:(id)a3;
- (void)isICloudAvailableWithHandler:(id)a3;
- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4;
- (void)notifyWidgetPlayerAuthenticationUpdated;
- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5;
- (void)resetCredentialsWithHandler:(id)a3;
- (void)setActivitySharingRepromptLastTriggerDate:(id)a3;
- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4;
- (void)setupAccountForParameters:(id)a3 handler:(id)a4;
- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4;
- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
@end

@implementation GKAuthenticationWrapperService

- (GKAuthenticationWrapperService)initWithClient:(id)a3
{
  v4 = +[NSString stringWithFormat:@"initWithClient: is not the designated initialier for GKAuthenticationWrapperService, use initWithService:queue: instead."];
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
  id v6 = [v5 lastPathComponent];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKAuthenticationWrapperService initWithClient:]", [v6 UTF8String], 31);

  +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

- (void)_buildSignatureLookupForProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  v5 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  unsigned int outCount = 0;
  id v6 = protocol_copyMethodDescriptionList(v4, 1, 1, &outCount);
  v7 = v6;
  if (outCount)
  {
    unsigned int v8 = 0;
    v9 = v6;
    do
    {
      v10 = NSStringFromSelector(v9->name);
      v11 = +[NSMethodSignature signatureWithObjCTypes:v9->types];
      [(NSDictionary *)v5 setObject:v11 forKeyedSubscript:v10];

      ++v8;
      ++v9;
    }
    while (v8 < outCount);
  }
  free(v7);
  v12 = protocol_copyMethodDescriptionList(v4, 0, 1, &outCount);
  v13 = v12;
  if (outCount)
  {
    unsigned int v14 = 0;
    v15 = v12;
    do
    {
      v16 = NSStringFromSelector(v15->name);
      v17 = +[NSMethodSignature signatureWithObjCTypes:v15->types];
      [(NSDictionary *)v5 setObject:v17 forKeyedSubscript:v16];

      ++v14;
      ++v15;
    }
    while (v14 < outCount);
  }
  free(v13);
  signatureLookup = self->_signatureLookup;
  self->_signatureLookup = v5;
}

- (GKAuthenticationWrapperService)initWithService:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 transport];
  v10 = [v7 clientProxy];
  v11 = [v7 localPlayer];
  v12 = [v7 credential];
  v16.receiver = self;
  v16.super_class = (Class)GKAuthenticationWrapperService;
  v13 = [(GKService *)&v16 initWithTransport:v9 forClient:v10 localPlayer:v11 credential:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v13->_authQueue, a4);
    unsigned int v14 = [objc_msgSend((id)objc_opt_class(), "interfaceClass") interfaceProtocol];
    [(GKAuthenticationWrapperService *)v13 _buildSignatureLookupForProtocol:v14];
  }
  return v13;
}

+ (id)authenticationWrapperForService:(id)a3
{
  id v3 = a3;
  v4 = [v3 clientProxy];

  if (v4)
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    id v6 = [v3 clientProxy];
    id v7 = [v6 authQueue];
    id v8 = [v5 initWithService:v3 queue:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)serviceForClient:(id)a3 player:(id)a4
{
  v4 = +[NSString stringWithFormat:@"serviceForClient: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead.", a4];
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v4, "+[GKAuthenticationWrapperService serviceForClient:player:]", [v6 UTF8String], 85);

  +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

+ (id)serviceForBundleID:(id)a3 player:(id)a4
{
  v4 = +[NSString stringWithFormat:@"serviceForBundleID: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead.", a4];
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v4, "+[GKAuthenticationWrapperService serviceForBundleID:player:]", [v6 UTF8String], 91);

  +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self clientProxy];
  id v6 = [v5 replyQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD908;
  v8[3] = &unk_1002D3930;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService authenticatePlayerWithExistingCredentialsWithHandler:]", [v8 UTF8String], 106);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v12 = [(GKService *)self->_service transport];
  v10 = [(GKService *)self->_service clientProxy];
  v11 = +[GKService serviceWithTransport:v12 forClient:v10 localPlayer:0];
  [(GKAuthenticationWrapperService *)self authenticateWithService:v11 username:0 password:0 handler:v5];
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "wrapper generateIdentityVerificationSignatureWithCompletionHandler:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v7 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v7, "-[GKAuthenticationWrapperService generateIdentityVerificationSignatureWithCompletionHandler:]", [v9 UTF8String], 113);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ADCD0;
  block[3] = &unk_1002D3C38;
  block[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(authQueue, block);
}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "wrapper fetchItemsForIdentityVerificationSignature:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v7 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v7, "-[GKAuthenticationWrapperService fetchItemsForIdentityVerificationSignature:]", [v9 UTF8String], 130);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ADFCC;
  block[3] = &unk_1002D3C38;
  block[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(authQueue, block);
}

- (void)didShowSignInBanner
{
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v3 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v5 = [v4 lastPathComponent];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v3, "-[GKAuthenticationWrapperService didShowSignInBanner]", [v5 UTF8String], 146);

    +[NSException raise:@"GameKit Exception", @"%@", v6 format];
  }
  service = self->_service;

  [(GKService *)service didShowSignInBanner];
}

- (void)didShowFullscreenSignIn
{
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v3 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v5 = [v4 lastPathComponent];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v3, "-[GKAuthenticationWrapperService didShowFullscreenSignIn]", [v5 UTF8String], 152);

    +[NSException raise:@"GameKit Exception", @"%@", v6 format];
  }
  service = self->_service;

  [(GKService *)service didShowFullscreenSignIn];
}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "wrapper signOutPlayerWithOptOut:%lu", buf, 0xCu);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v9, "-[GKAuthenticationWrapperService signOutPlayerWithOptOut:handler:]", [v11 UTF8String], 159);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE534;
  block[3] = &unk_1002D8650;
  BOOL v17 = v4;
  block[4] = self;
  id v16 = v6;
  id v14 = v6;
  dispatch_barrier_async(authQueue, block);
}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wrapper setupAccountForParameters:handler:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    v10 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v10, "-[GKAuthenticationWrapperService setupAccountForParameters:handler:]", [v12 UTF8String], 190);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }
  service = self->_service;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AEA5C;
  v16[3] = &unk_1002D45D8;
  id v17 = v7;
  id v15 = v7;
  [(GKService *)service setupAccountForParameters:v6 handler:v16];
}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 isGame:(BOOL)a7 usingFastPath:(BOOL)a8 displayAuthUI:(BOOL)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  v22 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "wrapper authenticateWithService:", buf, 2u);
  }
  v23 = (GKAccountServicePrivate *)v16;
  v24 = [(GKService *)v23 credential];

  v25 = v23;
  if (v24)
  {
    v26 = [GKAccountServicePrivate alloc];
    v27 = [(GKService *)self clientProxy];
    v25 = [(GKService *)v26 initWithoutCredentialWithTransport:0 forClient:v27];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  authQueue = self->_authQueue;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000AEC98;
  v35[3] = &unk_1002D8AC0;
  v36 = v25;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  BOOL v43 = a7;
  BOOL v44 = a8;
  v40 = self;
  id v41 = v20;
  CFAbsoluteTime v42 = Current;
  id v30 = v20;
  id v31 = v19;
  id v32 = v18;
  id v33 = v17;
  v34 = v25;
  dispatch_barrier_async(authQueue, v35);
}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 handler:(id)a6
{
  LOBYTE(v6) = 0;
  [(GKAuthenticationWrapperService *)self authenticateWithService:a3 username:a4 password:a5 altDSID:0 isGame:1 usingFastPath:0 displayAuthUI:v6 handler:a6];
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 usingFastPath:(BOOL)a5 displayAuthUI:(BOOL)a6 handler:(id)a7
{
  BOOL v9 = a5;
  id v19 = a3;
  id v12 = a4;
  id v13 = a7;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v14 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v16 = [v15 lastPathComponent];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v14, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:usingFastPath:displayAuthUI:handler:]", [v16 UTF8String], 330);

    +[NSException raise:@"GameKit Exception", @"%@", v17 format];
  }
  LOBYTE(v18) = a6;
  [(GKAuthenticationWrapperService *)self authenticateWithService:self->_service username:v19 password:v12 altDSID:0 isGame:1 usingFastPath:v9 displayAuthUI:v18 handler:v13];
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  uint64_t v9 = a7;
  BOOL v10 = a6;
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    unsigned int v22 = v9;
    id v17 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v19 = [v18 lastPathComponent];
    id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v17, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]", [v19 UTF8String], 348);

    +[NSException raise:@"GameKit Exception", @"%@", v20 format];
    uint64_t v9 = v22;
  }
  LOBYTE(v21) = 0;
  [(GKAuthenticationWrapperService *)self authenticateWithService:self->_service username:v23 password:v14 altDSID:v15 isGame:v10 usingFastPath:v9 displayAuthUI:v21 handler:v16];
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    BOOL v10 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v10, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:handler:]", [v12 UTF8String], 370);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }
  [(GKAuthenticationWrapperService *)self authenticateWithService:self->_service username:v14 password:v8 handler:v9];
}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v11 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v11, "-[GKAuthenticationWrapperService validateAccountWithUsername:password:handler:]", [v13 UTF8String], 378);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }
  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AFAAC;
  v17[3] = &unk_1002D4588;
  id v18 = v10;
  id v16 = v10;
  [(GKService *)service validateAccountWithUsername:v8 password:v9 handler:v17];
}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  id v8 = a3;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    BOOL v4 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v6 = [v5 lastPathComponent];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v4, "-[GKAuthenticationWrapperService getAccountAuthTokenWithHandler:]", [v6 UTF8String], 387);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }
  [(GKService *)self->_service getAccountAuthTokenWithHandler:v8];
}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  id v8 = a3;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    BOOL v4 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v6 = [v5 lastPathComponent];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v4, "-[GKAuthenticationWrapperService getDevicePushTokenWithHandler:]", [v6 UTF8String], 393);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }
  [(GKService *)self->_service getDevicePushTokenWithHandler:v8];
}

- (void)isICloudAvailableWithHandler:(id)a3
{
  id v8 = a3;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    BOOL v4 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v6 = [v5 lastPathComponent];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v4, "-[GKAuthenticationWrapperService isICloudAvailableWithHandler:]", [v6 UTF8String], 399);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }
  [(GKService *)self->_service isICloudAvailableWithHandler:v8];
}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v7 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v7, "-[GKAuthenticationWrapperService notifyClient:playerAuthenticatedFromClient:]", [v9 UTF8String], 405);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }
  [(GKService *)self->_service notifyClient:v11 playerAuthenticatedFromClient:v6];
}

- (void)resetCredentialsWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService resetCredentialsWithHandler:]", [v8 UTF8String], 411);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 signOutPlayerWithOptOut:0 handler:v5];
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v5 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v5, "-[GKAuthenticationWrapperService setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:]", [v7 UTF8String], 417);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }
  id v9 = +[GKService serviceFromService:self];
  [v9 setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:a3];
}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 423);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v5 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v5, "-[GKAuthenticationWrapperService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:]", [v7 UTF8String], 429);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }
  id v9 = +[GKService serviceFromService:self];
  [v9 setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:a3];
}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 435);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService setLastPersonalizationVersionDisplayedForSignedInPlayer:]", [v8 UTF8String], 441);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 setLastPersonalizationVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 447);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:]", [v8 UTF8String], 453);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 459);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService setLastProfilePrivacyVersionDisplayedForSignedInPlayer:]", [v8 UTF8String], 465);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 setLastProfilePrivacyVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 471);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:]", [v8 UTF8String], 477);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]", [v8 UTF8String], 483);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  service = self->_service;
  id v7 = a4;
  id v8 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v9, "-[GKAuthenticationWrapperService getOnboardingInfoForPlayerID:withCompletion:]", [v11 UTF8String], 488);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = +[GKService serviceFromService:self];
  [v13 getOnboardingInfoForPlayerID:v8 withCompletion:v7];
}

- (void)notifyWidgetPlayerAuthenticationUpdated
{
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v3 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    BOOL v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v5 = [v4 lastPathComponent];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v3, "-[GKAuthenticationWrapperService notifyWidgetPlayerAuthenticationUpdated]", [v5 UTF8String], 493);

    +[NSException raise:@"GameKit Exception", @"%@", v6 format];
  }
  id v7 = +[GKService serviceFromService:self];
  [v7 notifyWidgetPlayerAuthenticationUpdated];
}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  service = self->_service;
  id v7 = a4;
  id v8 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v9, "-[GKAuthenticationWrapperService getAccountAgeCategoryForPlayerID:withCompletion:]", [v11 UTF8String], 500);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = +[GKService serviceFromService:self];
  [v13 getAccountAgeCategoryForPlayerID:v8 withCompletion:v7];
}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService checkActivitySharingRepromptWithCompletion:]", [v8 UTF8String], 506);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 checkActivitySharingRepromptWithCompletion:v5];
}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountService] & 1) == 0)
  {
    id v6 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]", v6, "-[GKAuthenticationWrapperService setActivitySharingRepromptLastTriggerDate:]", [v8 UTF8String], 511);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  id v10 = +[GKService serviceFromService:self];
  [v10 setActivitySharingRepromptLastTriggerDate:v5];
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!os_log_GKGeneral) {
    id v19 = (id)GKOSLoggers();
  }
  id v20 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    BOOL v31 = a7;
    uint64_t v21 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    unsigned int v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v23 = [v22 lastPathComponent];
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v21, "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:finished:handler:]", [v23 UTF8String], 524);

    a7 = v31;
    +[NSException raise:@"GameKit Exception", @"%@", v24 format];
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B18BC;
  block[3] = &unk_1002D8AE8;
  block[4] = self;
  id v33 = v14;
  id v34 = v15;
  id v35 = v16;
  BOOL v38 = a7;
  id v36 = v17;
  id v37 = v18;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  id v30 = v14;
  dispatch_barrier_async(authQueue, block);
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  unsigned int v22 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    v23 = id v38 = v15;
    +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v37 = v18;
    id v24 = v17;
    id v25 = v16;
    v27 = BOOL v26 = a8;
    id v28 = [v27 lastPathComponent];
    id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v23, "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]", [v28 UTF8String], 559);

    a8 = v26;
    id v16 = v25;
    id v17 = v24;
    id v18 = v37;

    id v15 = v38;
    +[NSException raise:@"GameKit Exception", @"%@", v29 format];
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B1F98;
  block[3] = &unk_1002D8B38;
  block[4] = self;
  id v40 = v15;
  id v41 = v16;
  id v42 = v17;
  id v43 = v18;
  id v44 = v19;
  BOOL v46 = a8;
  id v45 = v20;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  id v34 = v17;
  id v35 = v16;
  id v36 = v15;
  dispatch_barrier_async(authQueue, block);
}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "wrapper accountEdited:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v19 = v25 = v12;
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v21 = [v20 lastPathComponent];
    unsigned int v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v19, "-[GKAuthenticationWrapperService accountEdited:alias:firstName:lastName:handler:]", [v21 UTF8String], 592);

    id v12 = v25;
    +[NSException raise:@"GameKit Exception", @"%@", v22 format];
  }
  service = self->_service;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000B260C;
  v26[3] = &unk_1002D3A20;
  id v27 = v16;
  id v24 = v16;
  [(GKService *)service accountEdited:v12 alias:v13 firstName:v14 lastName:v15 handler:v26];
}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "wrapper setLoginStatus:", buf, 2u);
  }
  if (([(GKService *)self->_service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountServicePrivate protocol!"];
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v9, "-[GKAuthenticationWrapperService setLoginStatus:handler:]", [v11 UTF8String], 603);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  service = self->_service;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B2804;
  v15[3] = &unk_1002D45D8;
  id v16 = v6;
  id v14 = v6;
  [(GKService *)service setLoginStatus:a3 handler:v15];
}

- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5
{
  service = self->_service;
  id v9 = a5;
  id v10 = a3;
  if (([(GKService *)service conformsToProtocol:&OBJC_PROTOCOL___GKAccountServicePrivate] & 1) == 0)
  {
    id v11 = +[NSString stringWithFormat:@"Wrapped service must conform to the GKAccountService protocol!"];
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]", v11, "-[GKAuthenticationWrapperService renewCredentialsForAccountWithUsername:ttl:withCompletion:]", [v13 UTF8String], 612);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }
  id v15 = +[GKService serviceFromService:self];
  [v15 renewCredentialsForAccountWithUsername:v10 ttl:v9 withCompletion:a4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKAuthenticationWrapperService;
  id v5 = -[GKAuthenticationWrapperService methodSignatureForSelector:](&v11, "methodSignatureForSelector:");
  if (!v5)
  {
    id v6 = NSStringFromSelector(a3);
    uint64_t v7 = [(NSDictionary *)self->_signatureLookup objectForKeyedSubscript:v6];
    if (!v7)
    {
      CFStringRef v12 = @"selector";
      id v13 = v6;
      id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v10 = +[NSException exceptionWithName:@"GKNoSuchServiceException" reason:@"Attempted to dispatch a selector which is not recognized by any service" userInfo:v9];

      objc_exception_throw(v10);
    }
    id v5 = (void *)v7;
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (-[GKService requiresAuthenticationForSelector:](self->_service, "requiresAuthenticationForSelector:", [v4 selector]))
  {
    [v4 retainArguments];
    authQueue = self->_authQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B2BA8;
    v6[3] = &unk_1002D3B38;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(authQueue, v6);
  }
  else
  {
    [v4 invokeWithTarget:self->_service];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureLookup, 0);
  objc_storeStrong((id *)&self->_authQueue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end