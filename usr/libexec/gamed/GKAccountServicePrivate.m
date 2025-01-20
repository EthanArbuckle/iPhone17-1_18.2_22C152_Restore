@interface GKAccountServicePrivate
+ (Class)interfaceClass;
+ (id)getAccountMatchingCredential:(id)a3 from:(id)a4;
+ (id)lastContactsIntegrationConsentVersionDisplayedForPlayerID:(id)a3;
+ (id)lastFriendSuggestionsVersionDisplayedForPlayerID:(id)a3;
+ (id)lastPersonalizationVersionDisplayedForPlayerID:(id)a3;
+ (id)lastProfilePrivacyVersionDisplayedForPlayerID:(id)a3;
+ (id)standardUserDefaults;
+ (int)getAccountAgeCategoryForCredential:(id)a3;
+ (int)getAgeCategoryFromIDMS:(id)a3 appleAccount:(id)a4;
+ (int)playerAgeCategoryForAccount:(id)a3;
+ (unint64_t)lastPrivacyNoticeVersionDisplayedForPlayerID:(id)a3;
+ (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:(id)a3;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthenticationForSelector:(SEL)a3;
- (BOOL)shouldCadencedActivitySharingRepromptWithLimit:(int64_t)a3 minDaysBetween:(int64_t)a4;
- (BOOL)shouldSuppressFullscreenSignInSheet;
- (id)_authenticatedLocalPlayerWithUsername:(id)a3 inContext:(id)a4 isValid:(BOOL *)a5;
- (void)_addAchievementPointsEntryForGame:(id)a3 record:(id)a4 profile:(id)a5 moc:(id)a6;
- (void)_addGameListEntryForGame:(id)a3 profile:(id)a4 moc:(id)a5;
- (void)_appInitWithGroup:(id)a3;
- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 handler:(id)a7;
- (void)_constructAuthenticationResponseWithError:(id)a3 handler:(id)a4;
- (void)_continueAuthenticationWithHandler:(id)a3;
- (void)_continueAuthenticationWithLoginDisabled:(BOOL)a3 handler:(id)a4;
- (void)_fetchCredentialsForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6;
- (void)_fetchLoginDisabledWithHandler:(id)a3;
- (void)_initGameForLaunchedApp:(BOOL)a3 withHandler:(id)a4;
- (void)_loadProfileWithGroup:(id)a3;
- (void)_notifyAllClientsPlayerAuthenticatedFromClient:(id)a3 withCredential:(id)a4 replyGroup:(id)a5;
- (void)_postLaunchEventsForGame:(id)a3 moc:(id)a4;
- (void)_preloadDataForGameCenterTabs;
- (void)_primeCacheWithGroup:(id)a3;
- (void)_syncPlayerOnboardingParametersInManagedObjectContext:(id)a3 withServerResult:(id)a4;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8;
- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
- (void)checkActivitySharingRepromptWithCompletion:(id)a3;
- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)getAccountAuthTokenWithHandler:(id)a3;
- (void)getDevicePushTokenWithHandler:(id)a3;
- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)isICloudAvailableWithHandler:(id)a3;
- (void)notifyClient:(id)a3 authenticationDidChangeWithError:(id)a4 handler:(id)a5;
- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4;
- (void)notifyClient:(id)a3 playerAuthenticatedWithCredential:(id)a4 authenticatingBundleID:(id)a5;
- (void)renewAuthToken;
- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5;
- (void)setActivitySharingRepromptLastTriggerDate:(id)a3;
- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4;
- (void)setupAccountForParameters:(id)a3 handler:(id)a4;
- (void)updateBadgeCounts;
- (void)updateClientSettings:(id)a3;
- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
@end

@implementation GKAccountServicePrivate

+ (id)lastProfilePrivacyVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  v7 = [v6 stringForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "lastProfilePrivacyVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v7;
}

+ (id)lastFriendSuggestionsVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  v7 = [v6 stringForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "lastFriendSuggestionsVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v7;
}

+ (id)lastPersonalizationVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  v7 = [v6 stringForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "lastPersonalizationVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v7;
}

+ (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  id v7 = [v6 integerForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = +[NSNumber numberWithUnsignedInteger:v7];
    *(_DWORD *)buf = 138412546;
    id v14 = v3;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "lastWelcomeWhatsNewCopyVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }
  return (unint64_t)v7;
}

+ (unint64_t)lastPrivacyNoticeVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  id v7 = [v6 integerForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = +[NSNumber numberWithUnsignedInteger:v7];
    *(_DWORD *)buf = 138412546;
    id v14 = v3;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "lastPrivacyNoticeVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }
  return (unint64_t)v7;
}

+ (id)lastContactsIntegrationConsentVersionDisplayedForPlayerID:(id)a3
{
  id v3 = a3;
  v4 = [v3 _gkSHA256Hash];
  v5 = +[NSString stringWithFormat:@"GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@", v4];

  v6 = [(id)objc_opt_class() standardUserDefaults];
  id v7 = [v6 stringForKey:v5];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "lastContactsIntegrationConsentVersionDisplayedForPlayer (%@) -> %@", buf, 0x16u);
  }

  return v7;
}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID: %@", (uint8_t *)&v13, 0xCu);
  }
  v10 = +[GKPlayerCredentialController sharedController];
  v11 = [(GKService *)self clientProxy];
  id v12 = [v10 credentialForPlayerID:v6 environment:[v11 environment]];

  v7[2](v7, +[GKAccountServicePrivate getAccountAgeCategoryForCredential:v12]);
}

+ (int)getAccountAgeCategoryForCredential:(id)a3
{
  id v3 = a3;
  v4 = +[ACAccountStore defaultStore];
  uint64_t v25 = ACAccountTypeIdentifierIDMS;
  v5 = +[NSArray arrayWithObjects:&v25 count:1];
  id v21 = 0;
  id v6 = [v4 accountsWithAccountTypeIdentifiers:v5 error:&v21];
  id v7 = v21;

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_1000350AC();
    }
  }
  v9 = +[ACAccountStore defaultStore];
  uint64_t v24 = ACAccountTypeIdentifierAppleAccount;
  v10 = +[NSArray arrayWithObjects:&v24 count:1];
  id v20 = v7;
  v11 = [v9 accountsWithAccountTypeIdentifiers:v10 error:&v20];
  id v12 = v20;

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100035044();
    }
  }
  id v14 = +[GKAccountServicePrivate getAccountMatchingCredential:v3 from:v6];
  __int16 v15 = +[GKAccountServicePrivate getAccountMatchingCredential:v3 from:v11];

  int v16 = +[GKAccountServicePrivate getAgeCategoryFromIDMS:v14 appleAccount:v15];
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForCredential: Returning GKPlayerAgeCategory(%d)", buf, 8u);
  }

  return v16;
}

+ (id)getAccountMatchingCredential:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKAccountManager sharedInstance];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v7 altDSIDForAccount:v12];
        id v14 = [v5 altDSID];
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) != 0
          || ([v12 username],
              int v16 = objc_claimAutoreleasedReturnValue(),
              [v5 accountName],
              id v17 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v18 = [v16 isEqualToString:v17],
              v17,
              v16,
              (v18 & 1) != 0))
        {
          id v19 = v12;

          goto LABEL_13;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v19 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v19 = 0;
  }
LABEL_13:

  return v19;
}

+ (int)getAgeCategoryFromIDMS:(id)a3 appleAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKAccountManager sharedInstance];
  id v8 = v7;
  if (v5)
  {
    if ([v7 userUnderAgeForAccount:v5])
    {
      if (!os_log_GKGeneral) {
        id v9 = (id)GKOSLoggers();
      }
      uint64_t v10 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID: IDMS account has isUnderage = 1, result = GKPlayerAgeCategoryChild", (uint8_t *)&v28, 2u);
      }
      int v11 = 3;
      goto LABEL_32;
    }
    if (!v6
      || (int v11 = +[GKAccountServicePrivate playerAgeCategoryForAccount:v6]) == 0)
    {
      id v14 = [v8 birthYearForAccount:v5];
      if (v14)
      {
        int v16 = +[NSCalendar currentCalendar];
        id v17 = +[NSDate date];
        unsigned __int8 v18 = [v16 component:4 fromDate:v17];

        uint64_t v19 = v18 - (unsigned char *)[v14 integerValue];
        if (v19 > 21) {
          int v11 = 1;
        }
        else {
          int v11 = 2;
        }
        if (!os_log_GKGeneral) {
          id v20 = (id)GKOSLoggers();
        }
        id v21 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          BOOL v22 = v19 > 21;
          long long v23 = v21;
          long long v24 = +[NSNumber numberWithInteger:v19];
          int v28 = 138413058;
          v29 = v14;
          __int16 v30 = 2112;
          v31 = v24;
          __int16 v32 = 1024;
          BOOL v33 = v22;
          __int16 v34 = 1024;
          int v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID: IDMS account has yob = %@, approximated age = %@, isAdult = %d, result = GKPlayerAgeCategory(%d)", (uint8_t *)&v28, 0x22u);
        }
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v25 = (id)GKOSLoggers();
        }
        v26 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          int v11 = 2;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID: IDMS account has no yob, treat the player as GKPlayerAgeCategoryAdolescent", (uint8_t *)&v28, 2u);
        }
        else
        {
          int v11 = 2;
        }
      }
      goto LABEL_31;
    }
  }
  else
  {
    if (!v6)
    {
      int v11 = 0;
      goto LABEL_32;
    }
    int v11 = +[GKAccountServicePrivate playerAgeCategoryForAccount:v6];
    if (!v11) {
      goto LABEL_32;
    }
  }
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  id v13 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    unsigned __int8 v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 aa_ageCategory]);
    int v28 = 138412290;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "getAccountAgeCategoryForPlayerID: AppleAccount account has a populated ageCategory = %@", (uint8_t *)&v28, 0xCu);

LABEL_31:
  }
LABEL_32:

  return v11;
}

+ (int)playerAgeCategoryForAccount:(id)a3
{
  id v3 = [(char *)[a3 aa_ageCategory];
  if ((unint64_t)(v3 - 1) > 8) {
    return 0;
  }
  else {
    return dword_10024F1E0[(void)(v3 - 1)];
  }
}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)GKPlayerInternalOnboarding) initWithPlayerID:v7];

  id v9 = [(GKService *)self clientProxy];
  uint64_t v10 = [v9 replyQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027A4C;
  v13[3] = &unk_1002D3930;
  id v14 = v8;
  id v15 = v6;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v10, v13);
}

- (void)isICloudAvailableWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAccountService isICloudAvailableWithHandler", buf, 2u);
  }
  +[GKDispatchGroup dispatchGroupWithName:@"isICloudAvailable"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027C18;
  v15[3] = &unk_1002D3A70;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v7;
  id v17 = self;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027E00;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  if (sel_isEqual("getAccountNameWithHandler:", a3)
    || sel_isEqual("getAuthenticatedPlayerIDWithHandler:", a3)
    || sel_isEqual("getAuthenticatedLocalPlayersWithStatus:handler:", a3))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)GKAccountServicePrivate;
  return [(GKService *)&v6 requiresAuthenticationForSelector:a3];
}

- (void)updateBadgeCounts
{
  id v3 = [(GKService *)self clientProxy];
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 812, "-[GKAccountServicePrivate updateBadgeCounts]");
  id v5 = [(GKService *)self transactionGroupWithName:v4];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000280D4;
  v13[3] = &unk_1002D4050;
  void v13[4] = self;
  [v5 perform:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028198;
  v11[3] = &unk_1002D4078;
  v11[4] = self;
  id v12 = v5;
  id v6 = v5;
  [v6 performOnManagedObjectContext:v11];
  id v7 = [v3 replyQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000284B0;
  v9[3] = &unk_1002D40E0;
  id v10 = v3;
  id v8 = v3;
  [v6 notifyOnQueue:v7 block:v9];
}

- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 859, "-[GKAccountServicePrivate _authenticateUsername:password:altDSID:validateOnly:handler:]");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000286CC;
  v22[3] = &unk_1002D4180;
  id v23 = v12;
  id v24 = v13;
  BOOL v28 = a6;
  id v25 = v14;
  v26 = self;
  id v27 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  +[GKActivity named:v16 execute:v22];

  id v21 = +[GKReporter reporter];
  [v21 reportEvent:GKReporterDomainLogin type:GKLoginSignIn];
}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self credential];
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000296B0;
    v6[3] = &unk_1002D3930;
    id v8 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = +[GKDataRequestManager sharedManager];
  id v5 = [v6 pushToken];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)_constructAuthenticationResponseWithError:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 1185, "-[GKAccountServicePrivate _constructAuthenticationResponseWithError:handler:]");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000298AC;
  v11[3] = &unk_1002D3A48;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:v8 execute:v11];
}

- (void)_addGameListEntryForGame:(id)a3 profile:(id)a4 moc:(id)a5
{
  id v7 = a5;
  id v8 = [a4 gameList];
  if (v8)
  {
    id v9 = [(GKService *)self clientProxy];
    id v10 = [v9 bundleIdentifier];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002A10C;
    v14[3] = &unk_1002D4270;
    id v11 = v10;
    id v15 = v11;
    id v12 = [v8 findEntry:v14];
    id v13 = [v8 mutableOrderedSetValueForKeyPath:@"entries"];
    if (!v12)
    {
      id v12 = [(GKCacheObject *)[GKGameListEntryCacheObject alloc] initWithManagedObjectContext:v7];
      [(GKGameListEntryCacheObject *)v12 setBundleID:v11];
      [v13 addObject:v12];
    }
    [v13 insertObject:v12 atIndex:0];
  }
}

- (void)_addAchievementPointsEntryForGame:(id)a3 record:(id)a4 profile:(id)a5 moc:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [a5 achievementPointsList];
  if (v11)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 bundleIdentifier];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A2B4;
    v17[3] = &unk_1002D4298;
    id v14 = v13;
    id v18 = v14;
    id v15 = [v11 findEntry:v17];
    id v16 = [v11 mutableOrderedSetValueForKeyPath:@"entries"];
    if (!v15)
    {
      id v15 = [(GKCacheObject *)[GKAchievementPointsEntryCacheObject alloc] initWithManagedObjectContext:v10];
      [(GKAchievementPointsEntryCacheObject *)v15 setGameRecord:v9];
      [v16 addObject:v15];
    }
    [v16 insertObject:v15 atIndex:0];
  }
}

- (void)_postLaunchEventsForGame:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKAccountService _postLaunchEventsForGame:", (uint8_t *)&v24, 2u);
  }
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 launchEvent];

  if (v11)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    id v13 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      unsigned int v15 = [v11 eventType];
      id v16 = [v11 context];
      id v17 = [(GKService *)self clientProxy];
      int v24 = 67109634;
      *(_DWORD *)id v25 = v15;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Launch event(%d) context %@ for client %@", (uint8_t *)&v24, 0x1Cu);
    }
    id v18 = [v11 context];
    id v19 = [v11 eventType];
    if (v19 == (id)2)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
      id v20 = [(GKService *)self clientProxy];
      [v20 friendRequestSelected:v18];
    }
    else if (v19 == (id)1)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
      id v20 = [(GKService *)self clientProxy];
      [v20 completedChallengeSelected:v18];
    }
    else
    {
      if (v19)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_opt_class();
      objc_opt_isKindOfClass();
      id v20 = [(GKService *)self clientProxy];
      [v20 receivedChallengeSelected:v18];
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  BOOL v22 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v18 = v22;
    id v20 = [(GKService *)self clientProxy];
    int v24 = 138412290;
    *(void *)id v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No launch event for client %@", (uint8_t *)&v24, 0xCu);
    goto LABEL_20;
  }
LABEL_22:
  id v23 = [(GKService *)self clientProxy];
  [v23 setLaunchEvent:0];
}

- (void)renewAuthToken
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKAccountService renewAuthToken", buf, 2u);
  }
  id v5 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v6 = [(GKService *)self clientProxy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A770;
  v7[3] = &unk_1002D42E0;
  v7[4] = self;
  [v5 issueRequest:0 bagKey:@"gk-renew-auth-token" clientProxy:v6 handler:v7];
}

- (void)_initGameForLaunchedApp:(BOOL)a3 withHandler:(id)a4
{
  id v5 = a4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAccountService _initGame", buf, 2u);
  }
  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v8 = +[GKDataRequestManager sharedManager];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 1364, "-[GKAccountServicePrivate _initGameForLaunchedApp:withHandler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  [(GKService *)self clientProxy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002ABE8;
  v20[3] = &unk_1002D4378;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v11;
  BOOL v22 = self;
  id v12 = v10;
  id v23 = v12;
  id v25 = buf;
  id v13 = v8;
  id v24 = v13;
  [v12 perform:v20];
  if (v5)
  {
    id v14 = [v11 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002B3F4;
    v16[3] = &unk_1002D43A0;
    id v18 = v5;
    id v17 = v12;
    id v19 = buf;
    [v17 notifyOnQueue:v14 block:v16];
  }
  unsigned int v15 = +[GKReporter reporter];
  [v15 reportEvent:GKReporterDomainLogin type:GKLoginAppInit];

  _Block_object_dispose(buf, 8);
}

- (void)_syncPlayerOnboardingParametersInManagedObjectContext:(id)a3 withServerResult:(id)a4
{
  id v5 = a4;
  id v6 = +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:a3];
  id v7 = [v5 representedItem];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    log = v9;
    v43 = +[GKPreferences shared];
    unsigned int v39 = [v43 forcePrivacyNotice];
    uint64_t v10 = GKAccountPrivacyNoticeVersionKey;
    id v11 = [v7 objectForKeyedSubscript:GKAccountPrivacyNoticeVersionKey];
    v41 = +[GKPreferences shared];
    unsigned int v38 = [v41 forceDefaultNickname];
    uint64_t v12 = GKAccountIsDefaultNicknameKey;
    v37 = [v7 objectForKeyedSubscript:GKAccountIsDefaultNicknameKey];
    v40 = +[GKPreferences shared];
    unsigned int v36 = [v40 forceDefaultPrivacy];
    uint64_t v13 = GKAccountHasPrivacySettingsKey;
    id v14 = [v7 objectForKeyedSubscript:GKAccountHasPrivacySettingsKey];
    +[GKPreferences shared];
    unsigned int v15 = v44 = v6;
    unsigned int v16 = [v15 forceDefaultContactsIntegrationConsent];
    uint64_t v17 = GKContactsIntegrationConsentKey;
    id v18 = [v7 objectForKeyedSubscript:GKContactsIntegrationConsentKey];
    *(_DWORD *)buf = 67111938;
    unsigned int v48 = v39;
    __int16 v49 = 2112;
    uint64_t v50 = v10;
    __int16 v51 = 2112;
    v52 = v11;
    __int16 v53 = 1024;
    unsigned int v54 = v38;
    __int16 v55 = 2112;
    uint64_t v56 = v12;
    __int16 v57 = 2112;
    v58 = v37;
    __int16 v59 = 1024;
    unsigned int v60 = v36;
    __int16 v61 = 2112;
    uint64_t v62 = v13;
    __int16 v63 = 2112;
    v64 = v14;
    __int16 v65 = 1024;
    unsigned int v66 = v16;
    __int16 v67 = 2112;
    uint64_t v68 = v17;
    __int16 v69 = 2112;
    v70 = v18;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Updating onboarding parameters for the player:\n GKPreferences.shared.forcePrivacyNotice=%d, server has %@=%@\n GKPreferences.shared.forceDefaultNickname=%d, server has %@=%@\n GKPreferences.shared.forceDefaultPrivacy=%d, server has %@=%@\n GKPreferences.shared.forceDefaultContactsIntegrationConsent=%d, server has %@=%@", buf, 0x6Au);

    id v6 = v44;
  }
  id v19 = +[GKPreferences shared];
  unsigned int v20 = [v19 forcePrivacyNotice];

  if (v20)
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers();
    }
    BOOL v22 = os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Going to skip syncing the privacy notice version from the server because the test flag is set.", buf, 2u);
    }
  }
  else
  {
    uint64_t v23 = GKAccountPrivacyNoticeVersionKey;
    id v24 = [v7 objectForKeyedSubscript:GKAccountPrivacyNoticeVersionKey];

    if (v24)
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers();
      }
      __int16 v26 = os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "The server has a valid privacy notice version.", buf, 2u);
      }
      id v27 = [v7 objectForKeyedSubscript:v23];
      -[GKAccountService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:](self, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:", [v27 unsignedIntegerValue]);
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v28 = (id)GKOSLoggers();
      }
      uint64_t v29 = os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "The server doesn't have this player's privacy notice version.", buf, 2u);
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10002BA38;
      v46[3] = &unk_1002D43E8;
      v46[4] = self;
      [(GKAccountService *)self getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:v46];
    }
  }
  __int16 v30 = [v7 objectForKeyedSubscript:GKAccountIsDefaultNicknameKey];
  if ([v30 BOOLValue])
  {
    [v6 setDefaultNickname:1];
  }
  else
  {
    v31 = +[GKPreferences shared];
    [v6 setDefaultNickname:[v31 forceDefaultNickname]];
  }
  __int16 v32 = [v7 objectForKeyedSubscript:GKAccountHasPrivacySettingsKey];
  if ([v32 BOOLValue])
  {
    BOOL v33 = +[GKPreferences shared];
    [v6 setDefaultPrivacyVisibility:[v33 forceDefaultPrivacy]];
  }
  else
  {
    [v6 setDefaultPrivacyVisibility:1];
  }

  __int16 v34 = [v7 objectForKeyedSubscript:GKContactsIntegrationConsentKey];
  if ([v34 isEqualToString:GKContactsIntegrationConsentUndetermined])
  {
    [v6 setDefaultContactsIntegrationConsent:1];
  }
  else
  {
    int v35 = +[GKPreferences shared];
    [v6 setDefaultContactsIntegrationConsent:[v35 forceDefaultContactsIntegrationConsent]];
  }
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
}

- (id)_authenticatedLocalPlayerWithUsername:(id)a3 inContext:(id)a4 isValid:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"Assertion failed"];
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"];
    id v12 = [v11 lastPathComponent];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (username != ((void *)0))\n[%s (%s:%d)]", v10, "-[GKAccountServicePrivate _authenticatedLocalPlayerWithUsername:inContext:isValid:]", [v12 UTF8String], 1523);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers();
  }
  unsigned int v15 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKAccountService _authenticatedLocalPlayerWithUsername:", buf, 2u);
  }
  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100029C60;
  __int16 v30 = sub_100029C70;
  id v31 = 0;
  *a5 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002BD30;
  v20[3] = &unk_1002D4410;
  id v16 = v8;
  id v21 = v16;
  id v17 = v9;
  id v24 = buf;
  id v25 = a5;
  id v22 = v17;
  uint64_t v23 = self;
  [v17 performBlockAndWait:v20];
  id v18 = *((id *)v27 + 5);

  _Block_object_dispose(buf, 8);

  return v18;
}

- (void)_primeCacheWithGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self clientProxy];
  id v6 = +[GKService serviceFromService:self];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10002C0CC;
  id v14 = &unk_1002D4460;
  id v8 = v6;
  id v15 = v8;
  CFAbsoluteTime v16 = Current;
  [v4 perform:&v11];

  if ((objc_msgSend(v5, "isUIService", v11, v12, v13, v14) & 1) == 0
    && ([v5 isExtension] & 1) == 0)
  {
    id v9 = +[GKService serviceFromService:self];
    uint64_t v10 = [v5 gameDescriptor];
    [v9 getCompatibilityMatrix:v10 handler:0];
  }
}

- (void)_fetchCredentialsForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 1586, "-[GKAccountServicePrivate _fetchCredentialsForUsername:password:altDSID:handler:]");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002C370;
  v19[3] = &unk_1002D39A8;
  id v20 = v10;
  id v21 = v11;
  id v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  +[GKActivity named:v14 execute:v19];
}

- (void)_preloadDataForGameCenterTabs
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  id v4 = [(GKService *)self clientProxy];
  id v5 = [v4 replyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C8AC;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_after(v3, v5, block);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  id v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKAccountService auth username:%@", buf, 0xCu);
  }
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 1714, "-[GKAccountServicePrivate authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002CCB0;
  v24[3] = &unk_1002D4180;
  BOOL v29 = a6;
  v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  +[GKActivity named:v19 execute:v24];
}

- (void)notifyClient:(id)a3 authenticationDidChangeWithError:(id)a4 handler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D5F0;
  v9[3] = &unk_1002D3A48;
  void v9[4] = self;
  id v10 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [a3 sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:0 completionHandler:v9];
}

- (void)_loadProfileWithGroup:(id)a3
{
  id v5 = a3;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAccountService _loadProfile", buf, 2u);
  }
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = (id)GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100035860(v8, (void *)a2);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D870;
  v11[3] = &unk_1002D3A70;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [v10 perform:v11];
}

- (void)_appInitWithGroup:(id)a3
{
  id v5 = a3;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAccountService _appInit", buf, 2u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DBC0;
  v9[3] = &unk_1002D4650;
  id v10 = v5;
  SEL v11 = a2;
  void v9[4] = self;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v8 = v5;
  [v8 perform:v9];
}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "notifyClient:playerAuthenticatedFromClient:", buf, 2u);
  }
  [(GKService *)self credential];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002E470;
  v13[3] = &unk_1002D4678;
  id v14 = v6;
  id v15 = self;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v7;
  id v10 = v7;
  id v11 = v16;
  id v12 = v6;
  +[GKClientProxy enumerateClientsUsingBlock:v13];
}

- (void)notifyClient:(id)a3 playerAuthenticatedWithCredential:(id)a4 authenticatingBundleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 bundleIdentifier];
  int v11 = GKGetApplicationStateForBundleID(v10);

  if (v11 == 8)
  {
    id v12 = [v7 transportWithCredential:v8];
    id v13 = +[GKService serviceWithTransport:v12 forClient:v7 credential:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002E644;
    v14[3] = &unk_1002D4700;
    id v15 = v7;
    id v16 = v9;
    [v13 _initGameForLaunchedApp:0 withHandler:v14];
  }
  else
  {
    [v7 sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:v9 completionHandler:&stru_1002D4720];
  }
}

- (void)_notifyAllClientsPlayerAuthenticatedFromClient:(id)a3 withCredential:(id)a4 replyGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002E83C;
  v13[3] = &unk_1002D4678;
  id v14 = v8;
  id v15 = a5;
  id v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  +[GKClientProxy enumerateClientsUsingBlock:v13];
}

- (void)_fetchLoginDisabledWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)GKSignInVisibilityConfig);
  id v6 = [(GKService *)self transport];
  uint64_t v7 = [v6 storeBag];

  if (v7)
  {
    id v8 = [(GKService *)self transport];
    id v9 = [v8 storeBag];
    id v10 = [v9 valueForKey:GKSignInBannerEnabled];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(v7) = [v10 BOOLValue];
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  unsigned int v11 = [(GKAccountServicePrivate *)self shouldSuppressFullscreenSignInSheet];
  char v12 = v11;
  if (v11)
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKAccountService _fetchLoginDisabledWithHandler: Suppressing full screen sign in sheet", buf, 2u);
    }
  }
  id v15 = [(GKService *)self transport];
  id v16 = [v15 storeBag];
  if (!v16) {
    LOBYTE(v7) = 0;
  }

  if (v7)
  {
    v35[0] = GKFullscreenSignInSheetLimit;
    v35[1] = GKFullscreenSignInSheetInitialLimit;
    v35[2] = GKFullscreenSignInSheetCooldown;
    v35[3] = GKFullscreenSignInSheetMinTimeBetween;
    v35[4] = GKFullscreenSignInSheetEnabled;
    v35[5] = GKSignInBannerLimit;
    v35[6] = GKSignInBannerInitialLimit;
    v35[7] = GKSignInBannerCooldown;
    v35[8] = GKSignInBannerMinTimeBetween;
    v35[9] = GKSignInBannerEnabled;
    id v17 = +[NSArray arrayWithObjects:v35 count:10];
    id v18 = [(GKService *)self transport];
    id v19 = [v18 storeBag];
    id v20 = [(GKService *)self clientProxy];
    id v21 = [v20 replyQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002EE14;
    v27[3] = &unk_1002D4770;
    id v28 = v5;
    id v29 = v4;
    char v30 = v12;
    id v22 = v4;
    [v19 getValuesForKeys:v17 queue:v21 completion:v27];
  }
  else
  {
    id v23 = [v5 sheetConfig];
    [v23 setLimit:3];

    id v24 = [v5 bannerConfig];
    [v24 setEnabled:0];

    id v25 = +[GKPlayerCredentialController sharedController];
    id v26 = [v25 signInVisibilityManager];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002EDF8;
    v31[3] = &unk_1002D4748;
    id v32 = v4;
    char v33 = v12;
    id v17 = v4;
    [v26 promptsDisabledWithConfig:v5 scope:1 handler:v31];

    id v22 = v32;
  }
}

- (BOOL)shouldSuppressFullscreenSignInSheet
{
  v2 = [(GKService *)self clientProxy];
  dispatch_time_t v3 = [v2 bundleIdentifier];

  if (v3) {
    unsigned __int8 v4 = +[GKGame isNewsApp:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_continueAuthenticationWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002F25C;
  v4[3] = &unk_1002D4798;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKAccountServicePrivate *)v5 _fetchLoginDisabledWithHandler:v4];
}

- (void)_continueAuthenticationWithLoginDisabled:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    unsigned int v11 = [(GKService *)self credential];
    *(_DWORD *)buf = 138412546;
    uint64_t v62 = v10;
    __int16 v63 = 2112;
    v64 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ cred:%@", buf, 0x16u);
  }
  char v12 = [(GKService *)self credential];
  id v13 = [v12 accountName];

  if (!v13)
  {
    id v14 = +[NSString stringWithFormat:@"Assertion failed"];
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"];
    id v16 = [v15 lastPathComponent];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (credential.accountName)\n[%s (%s:%d)]", v14, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]", [v16 UTF8String], 2260);

    +[NSException raise:@"GameKit Exception", @"%@", v17 format];
  }
  id v18 = [v12 playerInternal];
  id v19 = [v18 playerID];

  if (!v19)
  {
    id v20 = +[NSString stringWithFormat:@"Assertion failed"];
    id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"];
    id v22 = [v21 lastPathComponent];
    id v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (credential.playerInternal.playerID)\n[%s (%s:%d)]", v20, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]", [v22 UTF8String], 2261);

    +[NSException raise:@"GameKit Exception", @"%@", v23 format];
  }
  id v24 = [(GKService *)self clientProxy];
  id v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2264, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]");
  id v26 = +[GKDispatchGroup dispatchGroupWithName:v25];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10002F8C0;
  v60[3] = &unk_1002D40E0;
  v60[4] = self;
  [(GKAccountServicePrivate *)self updateClientSettings:v60];
  id v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2272, "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]");
  id v28 = [(GKService *)self transactionGroupWithName:v27];

  id v29 = [v28 context];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10002F90C;
  v57[3] = &unk_1002D3B38;
  id v30 = v12;
  id v58 = v30;
  id v31 = v28;
  id v59 = v31;
  [v29 performBlockAndWait:v57];

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (v30 && !a3)
  {
    [(GKAccountServicePrivate *)self _loadProfileWithGroup:v31];
    [(GKAccountServicePrivate *)self _appInitWithGroup:v31];
    [(GKAccountServicePrivate *)self _primeCacheWithGroup:v31];
  }
  char v33 = [v24 replyQueue];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10002F9C4;
  v49[3] = &unk_1002D47E8;
  CFAbsoluteTime v55 = Current;
  id v34 = v26;
  id v50 = v34;
  id v35 = v31;
  id v51 = v35;
  v52 = self;
  id v36 = v30;
  id v53 = v36;
  SEL v56 = a2;
  id v37 = v24;
  id v54 = v37;
  [v34 join:v35 queue:v33 block:v49];

  if (v6)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000301E4;
    v47[3] = &unk_1002D3A70;
    v47[4] = self;
    id v38 = v34;
    id v48 = v38;
    [v38 perform:v47];
    unsigned int v39 = [v37 replyQueue];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100030324;
    v41[3] = &unk_1002D4838;
    id v46 = v6;
    id v42 = v38;
    id v43 = v36;
    id v44 = v37;
    v45 = self;
    [v42 notifyOnQueue:v39 block:v41];
  }
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  BOOL v35 = a7;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  id v16 = a5;
  id v17 = a3;
  id v36 = +[GKDataRequestManager sharedManager];
  id v18 = +[GKPlayerCredential internalRepresentation];
  id v19 = +[GKLocalPlayerInternal internalRepresentation];
  [v19 setPlayerID:v13];
  [v19 setAlias:v14];
  [v18 setAccountName:v17];

  [v18 setAuthenticationToken:v16];
  [v18 setPlayerInternal:v19];
  id v20 = [(GKService *)self clientProxy];
  [v18 setEnvironment:[v20 environment]];

  [v18 setScope:14];
  id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2416, "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:finished:handler:]");
  id v22 = [(GKService *)self transactionGroupWithName:v21];

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000308A0;
  v54[3] = &unk_1002D4050;
  id v23 = v18;
  id v55 = v23;
  [v22 perform:v54];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000309EC;
  v53[3] = &unk_1002D4050;
  v53[4] = self;
  [v22 perform:v53];
  id v24 = objc_alloc_init((Class)GKAuthenticateResponse);
  id v25 = [v22 context];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100030A94;
  v46[3] = &unk_1002D4860;
  id v26 = v13;
  id v47 = v26;
  id v27 = v22;
  id v48 = v27;
  __int16 v49 = self;
  id v28 = v14;
  id v50 = v28;
  id v29 = v24;
  id v51 = v29;
  id v30 = v23;
  id v52 = v30;
  [v25 performBlockAndWait:v46];

  if (v35)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100030C18;
    v44[3] = &unk_1002D3A70;
    v44[4] = self;
    id v45 = v27;
    [v45 perform:v44];

    id v31 = v36;
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v32 = [v27 context];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100030D40;
  v40[3] = &unk_1002D4888;
  id v41 = v27;
  id v42 = self;
  id v31 = v36;
  id v43 = v36;
  [v32 performBlockAndWait:v40];

  if (v15)
  {
LABEL_5:
    char v33 = [(GKService *)self clientProxy];
    id v34 = [v33 replyQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100030FC8;
    v37[3] = &unk_1002D3930;
    id v39 = v15;
    id v38 = v27;
    [v38 notifyOnQueue:v34 block:v37];
  }
LABEL_6:
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  BOOL v37 = a8;
  id v14 = a4;
  id v15 = a6;
  id v39 = a9;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v38 = +[GKDataRequestManager sharedManager];
  id v19 = +[GKPlayerCredential internalRepresentation];
  id v20 = +[GKLocalPlayerInternal internalRepresentation];
  [v20 setPlayerID:v14];
  [v20 setAlias:v15];
  [v19 setAccountName:v18];

  [v19 setAuthenticationToken:v17];
  [v19 setPlayerInternal:v20];
  id v21 = [(GKService *)self clientProxy];
  [v19 setEnvironment:[v21 environment]];

  [v19 setScope:14];
  [v19 setAltDSID:v16];

  id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2514, "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]");
  id v23 = [(GKService *)self transactionGroupWithName:v22];

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100031504;
  v57[3] = &unk_1002D4050;
  id v24 = v19;
  id v58 = v24;
  [v23 perform:v57];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100031650;
  v56[3] = &unk_1002D4050;
  v56[4] = self;
  [v23 perform:v56];
  id v25 = objc_alloc_init((Class)GKAuthenticateResponse);
  id v26 = [v23 context];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000316F8;
  v49[3] = &unk_1002D4860;
  id v27 = v14;
  id v50 = v27;
  id v28 = v23;
  id v51 = v28;
  id v52 = self;
  id v29 = v15;
  id v53 = v29;
  id v30 = v25;
  id v54 = v30;
  id v31 = v24;
  id v55 = v31;
  [v26 performBlockAndWait:v49];

  if (v37)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10003187C;
    v47[3] = &unk_1002D3A70;
    v47[4] = self;
    id v48 = v28;
    [v48 perform:v47];

    id v32 = v38;
  }
  else
  {
    char v33 = [v28 context];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000319A4;
    v43[3] = &unk_1002D4888;
    id v44 = v28;
    id v45 = self;
    id v32 = v38;
    id v46 = v38;
    [v33 performBlockAndWait:v43];
  }
  if (v39)
  {
    id v34 = [(GKService *)self clientProxy];
    [v34 replyQueue];
    v36 = BOOL v35 = v32;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100031C2C;
    v40[3] = &unk_1002D3930;
    id v42 = v39;
    id v41 = v28;
    [v41 notifyOnQueue:v36 block:v40];

    id v32 = v35;
  }
}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)GKAuthenticateResponse);
  char v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2593, "-[GKAccountServicePrivate validateAccountWithUsername:password:handler:]");
  id v13 = +[GKDispatchGroup dispatchGroupWithName:v12];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100031EBC;
  v26[3] = &unk_1002D48B0;
  v26[4] = self;
  id v27 = v8;
  id v28 = v9;
  id v14 = v13;
  id v29 = v14;
  id v15 = v9;
  id v16 = v8;
  [v14 perform:v26];
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100031FCC;
  v22[3] = &unk_1002D48D8;
  id v24 = v14;
  id v25 = v10;
  id v23 = v11;
  id v19 = v14;
  id v20 = v11;
  id v21 = v10;
  [v19 notifyOnQueue:v18 block:v22];
}

- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2611, "-[GKAccountServicePrivate renewCredentialsForAccountWithUsername:ttl:withCompletion:]");
  id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100032210;
  v21[3] = &unk_1002D4900;
  id v22 = v8;
  double v24 = a4;
  id v12 = v11;
  id v23 = v12;
  id v13 = v8;
  [v12 perform:v21];
  id v14 = [(GKService *)self clientProxy];
  id v15 = [v14 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100032334;
  v18[3] = &unk_1002D3930;
  id v19 = v12;
  id v20 = v9;
  id v16 = v12;
  id v17 = v9;
  [v16 notifyOnQueue:v15 block:v18];
}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(id)objc_opt_class() standardUserDefaults];
  id v9 = [v8 objectForKey:GKOptedOutOfGameCenter];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v12 = (id)GKOSLoggers();
      id v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKAppleIDAuthenticationDelegate ignoring authentication response since user has opted out of game center.", buf, 2u);
    }
    id v13 = +[NSError errorWithDomain:GKInternalErrorDomain code:100 userInfo:0];
    v7[2](v7, v13);
    goto LABEL_55;
  }
  id v14 = +[GKPreferences shared];
  if ([v14 isAccountModificationRestricted])
  {

LABEL_10:
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    id v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Game Center account will not be saved as accounts are restricted", buf, 2u);
    }
    id v13 = +[NSError userErrorForServerCode:5000 reason:@"Game Center accounts are disabled"];
    if (v7) {
      v7[2](v7, v13);
    }
    id v19 = +[GKService serviceFromService:self];
    [v19 terminate];

    goto LABEL_55;
  }
  id v15 = +[GKPreferences shared];
  unsigned int v16 = [v15 isGameCenterDisabled];

  if (v16) {
    goto LABEL_10;
  }
  id v20 = +[ACAccountStore defaultStore];
  id v21 = [(GKService *)self credential];
  id v22 = [v21 accountName];

  uint64_t v23 = [v20 _gkAccountForAppleID:v22];
  double v24 = (void *)v23;
  if (v22) {
    BOOL v25 = v23 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  int v26 = v25;
  int v79 = v26;
  v82 = [(GKService *)self clientProxy];
  if (!os_log_GKGeneral) {
    id v27 = (id)GKOSLoggers();
  }
  id v28 = v20;
  id v29 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v103 = v6;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Account setup parameters: %@", buf, 0xCu);
  }
  id v30 = [v6 objectForKeyedSubscript:@"player-id"];
  v87 = [v6 objectForKeyedSubscript:@"alias"];
  v90 = [v6 objectForKeyedSubscript:@"apple-id"];
  v89 = [v6 objectForKeyedSubscript:@"auth-token"];
  v86 = [v6 objectForKeyedSubscript:@"firstName"];
  v85 = [v6 objectForKeyedSubscript:@"lastName"];
  v84 = [v6 objectForKeyedSubscript:@"altDSID"];
  id v31 = [v6 objectForKeyedSubscript:@"dsid"];
  objc_opt_class();
  v88 = v31;
  if (objc_opt_isKindOfClass())
  {
    id v32 = [v31 stringValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v83 = 0;
      goto LABEL_33;
    }
    id v32 = v31;
  }
  v83 = v32;
LABEL_33:
  v80 = v22;
  unsigned int v33 = [v22 isEqualToString:v90];
  id v34 = v28;
  v81 = v24;
  if ([v30 length] && objc_msgSend(v89, "length") && objc_msgSend(v90, "length"))
  {
    v77 = v30;
    v74 = v28;
    BOOL v35 = [v6 objectForKeyedSubscript:GKEnvironmentKey];
    id v75 = +[GKPreferences environmentForString:v35];

    id v36 = [(GKService *)self credential];
    id v72 = [v36 environment];

    BOOL v37 = +[GKPlayerCredential internalRepresentation];
    id v38 = +[GKLocalPlayerInternal internalRepresentation];
    id v39 = [(GKService *)self credential];
    v40 = [v39 authenticationToken];
    unsigned __int8 v41 = [v40 isEqual:v89];

    v78 = v37;
    if (v79)
    {
      [v38 setPlayerID:v77];
      [v38 setAlias:v87];
      [v38 setFirstName:v86];
      [v38 setLastName:v85];
      id v42 = [(id)objc_opt_class() compositeNameForFirstName:v86 lastName:v85];
      [v38 setCompositeName:v42];

      [v37 setAccountName:v90];
      v73 = v38;
      [v37 setPlayerInternal:v38];
      [v37 setAuthenticationToken:v89];
      [v37 setEnvironment:];
      if (v83) {
        [v37 setDSID:];
      }
      id v34 = v74;
      id v43 = v88;
      if (v84) {
        [v37 setAltDSID:];
      }
      [v37 setScope:14];
      v71 = +[GKPlayerCredentialController sharedController];
      [v71 setPrimaryCredential:v37 completionHandler:0];
      if (!os_log_GKGeneral) {
        id v44 = (id)GKOSLoggers();
      }
      id v45 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v103 = v75;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Account setup (No existing player): Switching environment(%ld) and recording player credentials, will terminate", buf, 0xCu);
      }
      id v46 = +[GKStoreBag storeBagForEnvironment:v75];
      id v47 = +[GKDataTransport transportWithBag:v46 clientProxy:v82 credential:v37];
      [(GKService *)self setTransport:v47];

      id v48 = +[GKClientProxy gameCenterClient];
      [v48 setEnvironment:v75];
      +[GKClientProxy removeAllCaches];
      __int16 v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2747, "-[GKAccountServicePrivate setupAccountForParameters:handler:]");
      id v50 = [(GKService *)self transactionGroupWithName:v49];

      id v51 = [v50 context];
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_1000330FC;
      v96[3] = &unk_1002D4328;
      id v97 = v77;
      id v98 = v50;
      id v99 = v87;
      id v100 = v86;
      id v101 = v85;
      id v52 = v50;
      [v51 performBlockAndWait:v96];

      id v30 = v77;
      [(GKAccountServicePrivate *)self _loadProfileWithGroup:v52];
      [(GKAccountServicePrivate *)self _appInitWithGroup:v52];
      [(GKAccountServicePrivate *)self _primeCacheWithGroup:v52];
      [(GKAccountServicePrivate *)self updateBadgeCounts];

      id v53 = v89;
      id v38 = v73;
    }
    else
    {
      id v30 = v77;
      if (v72 == v75) {
        unsigned __int8 v59 = v41;
      }
      else {
        unsigned __int8 v59 = 0;
      }
      id v43 = v88;
      if (v59 & 1) != 0 || ((v33 ^ 1))
      {
        id v34 = v74;
        id v53 = v89;
        if (!os_log_GKGeneral) {
          id v69 = (id)GKOSLoggers();
        }
        v70 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Account setup not new and no change:", buf, 2u);
        }
      }
      else
      {
        id v34 = v74;
        id v53 = v89;
        if (!os_log_GKGeneral) {
          id v60 = (id)GKOSLoggers();
        }
        __int16 v61 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v103 = v38;
          __int16 v104 = 2112;
          v105 = v78;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Account setup (Player did not change): Recording new credentials and updating profile. Previous player:%@ credential:%@", buf, 0x16u);
        }
        [v38 setPlayerID:v77];
        [v38 setAlias:v87];
        [v38 setFirstName:v86];
        [v38 setLastName:v85];
        uint64_t v62 = [(id)objc_opt_class() compositeNameForFirstName:v86 lastName:v85];
        [v38 setCompositeName:v62];

        [v78 setAccountName:v90];
        [v78 setPlayerInternal:v38];
        [v78 setAuthenticationToken:v89];
        [v78 setEnvironment:v75];
        if (v83) {
          [v78 setDSID:];
        }
        if (v84) {
          [v78 setAltDSID:];
        }
        [v78 setScope:14];
        v76 = +[GKPlayerCredentialController sharedController];
        [v76 setPrimaryCredential:v78 completionHandler:0];
        if (!os_log_GKGeneral) {
          id v63 = (id)GKOSLoggers();
        }
        v64 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v103 = v78;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Account setup (Player did not change): saving the received credentials:%@", buf, 0xCu);
        }
        __int16 v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2797, "-[GKAccountServicePrivate setupAccountForParameters:handler:]");
        unsigned int v66 = [(GKService *)self transactionGroupWithName:v65];

        __int16 v67 = [v66 context];
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_1000331BC;
        v91[3] = &unk_1002D4928;
        id v92 = v66;
        id v93 = v87;
        id v94 = v86;
        id v95 = v85;
        id v68 = v66;
        [v67 performBlockAndWait:v91];

        id v30 = v77;
      }
    }

    id v13 = 0;
    int v56 = v79;
    if (!v7) {
      goto LABEL_52;
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v54 = (id)GKOSLoggers();
    }
    id v55 = os_log_GKError;
    id v43 = v88;
    id v53 = v89;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v103 = v30;
      __int16 v104 = 2112;
      v105 = v89;
      __int16 v106 = 2112;
      v107 = v90;
      _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "SetupAccountForParameters: Missing expected account setup parameters playerID:%@ token:%@ accountName:%@", buf, 0x20u);
    }
    id v13 = +[NSError userErrorForServerCode:5000 reason:@"Missing expected account setup parameters"];
    int v56 = 0;
    if (!v7) {
      goto LABEL_52;
    }
  }
  int v57 = v56;
  v7[2](v7, v13);
  int v56 = v57;
  id v43 = v88;
LABEL_52:
  if (v56)
  {
    id v58 = +[GKService serviceFromService:self];
    [v58 terminate];
  }
LABEL_55:
}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2832, "-[GKAccountServicePrivate accountEdited:alias:firstName:lastName:handler:]");
  id v18 = [(GKService *)self transactionGroupWithName:v17];

  id v19 = [v18 context];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000334FC;
  v26[3] = &unk_1002D4950;
  id v27 = v18;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  id v25 = v18;
  [v19 performBlock:v26];
}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = +[GKPlayerCredentialController sharedController];
  id v8 = [(GKService *)self credential];
  if (!v8)
  {
    id v9 = [(GKService *)self transport];
    id v8 = [v9 credential];
  }
  unsigned int v10 = [v8 scope];
  if ((v4 & 4) != 0) {
    uint64_t v11 = v10 | 0xC;
  }
  else {
    uint64_t v11 = v10 & 0xFFFFFFF3 | v4 & 8;
  }
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  id v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v8;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "setLoginStatus cred:(%@) new:%lX old:%lX", buf, 0x20u);
  }
  [v8 setScope:v11];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10003388C;
  id v19 = &unk_1002D3BC8;
  id v20 = self;
  id v21 = v6;
  id v14 = v6;
  id v15 = objc_retainBlock(&v16);
  if ((v4 & 4) != 0) {
    [v7 setPrimaryCredential:v8 completionHandler:v15, v16, v17, v18, v19, v20, v21];
  }
  else {
    [v7 setCredential:v8 completionHandler:v15, v16, v17, v18, v19, v20, v21];
  }
}

- (void)updateClientSettings:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2924, "-[GKAccountServicePrivate updateClientSettings:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [(GKService *)self transport];
  id v8 = [v7 storeBag];

  id v9 = +[GKPreferences shared];
  unsigned int v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isStoreDemoModeEnabled]);
  [v6 setObject:v10 forKeyedSubscript:@"storeDemoModeEnabled"];

  [v9 debugRequestTimeout];
  uint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v11 forKeyedSubscript:@"GKDebugRequestTimeout"];

  id v12 = +[GKLocalPlayerInternal archivedProfile];
  id v13 = [v12 playerID];
  id v14 = +[NSString stringWithFormat:@"%@-%@", @"GKAllowNearbyMultiplayer", v13];

  id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 shouldAllowNearbyMultiplayer]);
  [v6 setObject:v15 forKeyedSubscript:v14];

  if (v8)
  {
    id v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 shouldUseHTTPPipelining]);
    [v6 setObject:v16 forKeyedSubscript:@"GKHTTPPipelining"];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100033C78;
    v24[3] = &unk_1002D3980;
    id v25 = v8;
    __int16 v26 = self;
    id v27 = v6;
    [v27 perform:v24];
  }
  uint64_t v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100033F88;
  v21[3] = &unk_1002D3A48;
  void v21[4] = self;
  id v22 = v6;
  id v23 = v4;
  id v19 = v4;
  id v20 = v6;
  [v20 notifyOnQueue:v18 block:v21];
}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "checkActivitySharingRepromptWithCompletion", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountService.m", 2962, "-[GKAccountServicePrivate checkActivitySharingRepromptWithCompletion:]");
  id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003420C;
  v17[3] = &unk_1002D3A70;
  void v17[4] = self;
  id v9 = v8;
  id v18 = v9;
  [v9 perform:v17];
  unsigned int v10 = [(GKService *)self clientProxy];
  uint64_t v11 = [v10 replyQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100034780;
  v14[3] = &unk_1002D3930;
  id v15 = v9;
  id v16 = v4;
  id v12 = v9;
  id v13 = v4;
  [v12 notifyOnQueue:v11 block:v14];
}

- (BOOL)shouldCadencedActivitySharingRepromptWithLimit:(int64_t)a3 minDaysBetween:(int64_t)a4
{
  id v6 = [(id)objc_opt_class() standardUserDefaults];
  id v7 = [v6 objectForKey:@"GKActivitySharingReprompt"];
  id v8 = [v7 objectForKeyedSubscript:@"totalTriggerCount"];
  id v9 = [v8 integerValue];

  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  uint64_t v11 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v38 = (int64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: totalTriggerCount=%ld", buf, 0xCu);
  }
  if ((uint64_t)v9 < a3)
  {
    id v12 = [v7 objectForKeyedSubscript:@"lastTriggerDate"];
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    id v14 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v38 = (int64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: lastTriggerDate=%@", buf, 0xCu);
    }
    if (!v12)
    {
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers();
      }
      id v32 = os_log_GKTrace;
      BOOL v23 = 1;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: Yes, the reprompt has never been triggered before.", buf, 2u);
      }
      goto LABEL_35;
    }
    int64_t v15 = a4;
    uint64_t v16 = +[NSDate date];
    uint64_t v17 = +[NSCalendar currentCalendar];
    id v36 = (void *)v16;
    id v18 = [v17 components:16 fromDate:v12 toDate:v16 options:0];
    id v19 = [v18 day];
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    id v21 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v38 = (int64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: days diff=%ld", buf, 0xCu);
    }
    BOOL v22 = (uint64_t)v19 <= v15;
    BOOL v23 = (uint64_t)v19 > v15;
    if (v22)
    {
      if (!os_log_GKGeneral) {
        id v33 = (id)GKOSLoggers();
      }
      id v34 = os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134217984;
      int64_t v38 = v15;
      __int16 v26 = "shouldCadencedActivitySharingReprompt: No, last trigger was under %ld days ago.";
      id v27 = v34;
      uint32_t v28 = 12;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v24 = (id)GKOSLoggers();
      }
      id v25 = os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      __int16 v26 = "shouldCadencedActivitySharingReprompt: Yes, last trigger was a long time ago and it hasn't reached the limit.";
      id v27 = v25;
      uint32_t v28 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  if (!os_log_GKGeneral) {
    id v29 = (id)GKOSLoggers();
  }
  id v30 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v38 = a3;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "shouldCadencedActivitySharingReprompt: No, the reprompt has reached the limit of %ld.", buf, 0xCu);
  }
  BOOL v23 = 0;
LABEL_36:

  return v23;
}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "setActivitySharingRepromptLastTriggerDate: %@", buf, 0xCu);
  }
  id v6 = [(id)objc_opt_class() standardUserDefaults];
  id v7 = [v6 objectForKey:@"GKActivitySharingReprompt"];
  id v8 = [v7 objectForKeyedSubscript:@"totalTriggerCount"];
  unsigned int v9 = [v8 intValue];

  uint64_t v10 = v9 + 1;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "setActivitySharingRepromptLastTriggerDate: new count is %d", buf, 8u);
  }
  id v13 = +[NSNumber numberWithInt:v10, @"lastTriggerDate", @"totalTriggerCount", v3];
  v16[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:2];
  [v6 setObject:v14 forKey:@"GKActivitySharingReprompt"];
}

@end