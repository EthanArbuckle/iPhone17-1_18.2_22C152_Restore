@interface GKAccountService
+ (Class)interfaceClass;
+ (id)standardUserDefaults;
+ (unint64_t)requiredEntitlements;
- (id)ampController;
- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3;
- (void)didAcceptPrivacyNotice;
- (void)didShowFullscreenSignIn;
- (void)didShowSignInBanner;
- (void)fetchItemsForIdentityVerificationSignature:(id)a3;
- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3;
- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)isAppUnlistedAndDisallowed:(id)a3;
- (void)notifyWidgetPlayerAuthenticationUpdated;
- (void)resetCredentialsWithHandler:(id)a3;
- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4;
@end

@implementation GKAccountService

+ (unint64_t)requiredEntitlements
{
  return 1;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4 = a3;
  v5 = [(GKService *)self clientProxy];
  v6 = [v5 replyQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023920;
  v8[3] = &unk_1002D3C38;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)notifyWidgetPlayerAuthenticationUpdated
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
    sub_100034F10();
  }
  id v3 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"FriendsArePlayingWidget" inBundleIdentifier:@"com.apple.gamecenter.widgets.extension"];
  id v4 = [v3 reloadTimelineWithReason:@"GC player authentication updated"];
  id v5 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"ContinuePlayingWidget" inBundleIdentifier:@"com.apple.gamecenter.widgets.extension"];
  id v6 = [v5 reloadTimelineWithReason:@"GC player authentication updated"];
  id v7 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"ActivityFeedWidget" inBundleIdentifier:@"com.apple.gamecenter.widgets.extension"];
  id v8 = [v7 reloadTimelineWithReason:@"GC player authentication updated"];
}

- (id)ampController
{
  return +[GKAMPController controller];
}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKService serviceFromService:self];
  [v5 authenticatePlayerWithUsername:0 password:0 handler:v4];
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v6 = [(GKService *)self clientProxy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023C7C;
  v8[3] = &unk_1002D3F48;
  id v9 = v4;
  id v7 = v4;
  [v5 issueRequest:&off_1002F2BD8 bagKey:@"gk-get-auth-token-for-third-party" clientProxy:v6 handler:v8];
}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4 = a3;
  id v5 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v6 = [(GKService *)self clientProxy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023D74;
  v8[3] = &unk_1002D3F48;
  id v9 = v4;
  id v7 = v4;
  [v5 issueRequest:&off_1002F2C00 bagKey:@"gk-get-auth-token-for-third-party" clientProxy:v6 handler:v8];
}

- (void)didShowSignInBanner
{
  id v3 = +[GKPlayerCredentialController sharedController];
  id v2 = [v3 signInVisibilityManager];
  [v2 didShowBanner];
}

- (void)didShowFullscreenSignIn
{
  id v3 = +[GKPlayerCredentialController sharedController];
  id v2 = [v3 signInVisibilityManager];
  [v2 didShowFullscreen];
}

- (void)resetCredentialsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKService serviceFromService:self];
  [v5 signOutPlayerWithOptOut:0 handler:v4];
}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    v10 = [(GKService *)self localPlayer];
    v11 = [v10 alias];
    *(_DWORD *)buf = 138412290;
    unint64_t v35 = (unint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "signOutPlayerWithOptOut:%@", buf, 0xCu);
  }
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKAccountService signOutPlayerWithOptOut:%lu", buf, 0xCu);
  }
  CFStringRef v32 = @"timestamp";
  v14 = +[NSDate _gkServerTimestamp];
  v33 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 257, "-[GKAccountService signOutPlayerWithOptOut:handler:]");
  v17 = +[GKDispatchGroup dispatchGroupWithName:v16];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100024210;
  v27[3] = &unk_1002D3FB8;
  id v28 = v15;
  v29 = self;
  id v18 = v17;
  id v30 = v18;
  BOOL v31 = v4;
  id v19 = v15;
  [v18 perform:v27];
  v20 = [(GKService *)self clientProxy];
  v21 = [v20 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100024ABC;
  v24[3] = &unk_1002D3930;
  id v25 = v18;
  id v26 = v6;
  id v22 = v18;
  id v23 = v6;
  [v22 notifyOnQueue:v21 block:v24];
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    v10 = [v9 playerID];
    v11 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v12 = [(GKService *)self credential];
  v13 = [v12 playerInternal];
  v14 = [v13 playerID];
  v15 = [v14 _gkSHA256Hash];
  v16 = +[NSString stringWithFormat:@"GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@", v15];

  v17 = [(id)objc_opt_class() standardUserDefaults];
  id v18 = v17;
  if (a3)
  {
    id v19 = +[NSNumber numberWithUnsignedInteger:a3];
    [v18 setObject:v19 forKey:v16];
  }
  else
  {
    [v17 removeObjectForKey:v16];
  }
  [v18 synchronize];
}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 367, "-[GKAccountService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100024F10;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000250A8;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    id v10 = [v9 playerID];
    id v11 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412546;
    id v30 = v10;
    __int16 v31 = 2112;
    CFStringRef v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v12 = [(GKService *)self credential];
  id v13 = [v12 playerInternal];
  id v14 = [v13 playerID];
  v15 = [v14 _gkSHA256Hash];
  id v16 = +[NSString stringWithFormat:@"GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@", v15];

  v17 = [(id)objc_opt_class() standardUserDefaults];
  id v18 = [v17 objectForKey:v16];
  id v19 = [v18 integerValue];

  if (v19 == (id)a3)
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    v21 = os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      __int16 v22 = "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: Skipped because the values of current and new are the same.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    }
  }
  else if (a3 && v19 == (id)-1)
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers();
    }
    v21 = os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      __int16 v22 = "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: Skipped because the current value has been overridden for testing.";
      goto LABEL_16;
    }
  }
  else
  {
    if (a3)
    {
      v24 = +[NSNumber numberWithUnsignedInteger:a3];
      [v17 setObject:v24 forKey:v16];

      [(GKAccountService *)self didAcceptPrivacyNotice];
    }
    else
    {
      [v17 removeObjectForKey:v16];
    }
    if (!os_log_GKGeneral) {
      id v25 = (id)GKOSLoggers();
    }
    id v26 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v27 = v26;
      id v28 = +[NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412290;
      id v30 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: The value is set to %@", buf, 0xCu);
    }
    [(GKAccountService *)self notifyWidgetPlayerAuthenticationUpdated];
  }
}

- (void)didAcceptPrivacyNotice
{
  id v3 = +[GKPreferences shared];
  [v3 setForcePrivacyNotice:0];

  id v4 = [(GKAccountService *)self ampController];
  id v5 = [(GKService *)self transport];
  id v6 = [v5 storeBag];
  [v4 setupAsyncWithStoreBag:v6 withCompletion:&stru_1002D3FD8];

  id v7 = +[GKService serviceFromService:self];
  id v8 = [(GKService *)self credential];
  id v9 = [v8 playerInternal];
  id v10 = [v9 playerID];

  if (v10)
  {
    id v13 = v10;
    id v11 = +[NSArray arrayWithObjects:&v13 count:1];
    [v7 preloadInstalledGamesScopedPlayerIDs:v11 completion:0];
  }
  id v12 = +[GKService serviceFromService:self];
  [v12 updateNotificationTopicsForcefully:1];
}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 434, "-[GKAccountService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002580C;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000259A4;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    id v10 = [v9 playerID];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastPersonalizationVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v11 = [(GKService *)self credential];
  id v12 = [v11 playerInternal];
  id v13 = [v12 playerID];
  id v14 = [v13 _gkSHA256Hash];
  v15 = +[NSString stringWithFormat:@"GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@", v14];

  id v16 = [(id)objc_opt_class() standardUserDefaults];
  if ([v4 length]) {
    [v16 setObject:v4 forKey:v15];
  }
  else {
    [v16 removeObjectForKey:v15];
  }
  [v16 synchronize];
}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 465, "-[GKAccountService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100025DAC;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100025F08;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 482, "-[GKAccountService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026118;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026274;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    id v10 = [v9 playerID];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastProfilePrivacyVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v11 = [(GKService *)self credential];
  id v12 = [v11 playerInternal];
  id v13 = [v12 playerID];
  id v14 = [v13 _gkSHA256Hash];
  v15 = +[NSString stringWithFormat:@"GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@", v14];

  id v16 = [(id)objc_opt_class() standardUserDefaults];
  if ([v4 length]) {
    [v16 setObject:v4 forKey:v15];
  }
  else {
    [v16 removeObjectForKey:v15];
  }
  [v16 synchronize];
}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 513, "-[GKAccountService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002666C;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000267C8;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    id v10 = [v9 playerID];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastFriendSuggestionsVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v11 = [(GKService *)self credential];
  id v12 = [v11 playerInternal];
  id v13 = [v12 playerID];
  id v14 = [v13 _gkSHA256Hash];
  v15 = +[NSString stringWithFormat:@"GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@", v14];

  id v16 = [(id)objc_opt_class() standardUserDefaults];
  if ([v4 length]) {
    [v16 setObject:v4 forKey:v15];
  }
  else {
    [v16 removeObjectForKey:v15];
  }
  [v16 synchronize];
}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 544, "-[GKAccountService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026BC0;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026D1C;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [(GKService *)self credential];
    id v9 = [v8 playerInternal];
    id v10 = [v9 playerID];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer (%@) %@", buf, 0x16u);
  }
  id v11 = [(GKService *)self credential];
  id v12 = [v11 playerInternal];
  id v13 = [v12 playerID];
  id v14 = [v13 _gkSHA256Hash];
  v15 = +[NSString stringWithFormat:@"GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@", v14];

  id v16 = [(id)objc_opt_class() standardUserDefaults];
  if ([v4 length]) {
    [v16 setObject:v4 forKey:v15];
  }
  else {
    [v16 removeObjectForKey:v15];
  }
  [v16 synchronize];
}

@end